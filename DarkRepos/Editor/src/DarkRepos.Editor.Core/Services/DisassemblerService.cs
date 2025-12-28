using DarkRepos.Editor.Core.Interfaces;
using DarkRepos.Editor.Core.Models;

namespace DarkRepos.Editor.Core.Services;

/// <summary>
/// Service for disassembly operations.
/// </summary>
public class DisassemblerService : IDisassemblerService {
	private readonly Dictionary<RomPlatform, IInstructionDecoder> _decoders;

	public DisassemblerService() {
		_decoders = new Dictionary<RomPlatform, IInstructionDecoder> {
			[RomPlatform.Nes] = new Mos6502Decoder(),
			[RomPlatform.Snes] = new Wdc65816Decoder(),
			[RomPlatform.GameBoy] = new SharpLr35902Decoder(),
			[RomPlatform.GameBoyColor] = new SharpLr35902Decoder()
		};
	}

	public IEnumerable<DisassemblyLine> Disassemble(
		byte[] data,
		int offset,
		int length,
		RomPlatform platform,
		IEnumerable<Label>? labels = null) {
		var decoder = GetDecoder(platform);
		var labelDict = labels?.ToDictionary(l => l.Address, l => l) ?? new Dictionary<int, Label>();
		var end = Math.Min(offset + length, data.Length);
		var pc = offset;

		while (pc < end) {
			// Check for label at this address
			string? label = labelDict.TryGetValue(pc, out var l) ? l.Name : null;
			string? comment = l?.Comment;

			var (mnemonic, operand, size) = decoder.Decode(data, pc);
			var bytes = new byte[size];
			Array.Copy(data, pc, bytes, 0, Math.Min(size, data.Length - pc));

			// Replace address operands with labels if available
			operand = ResolveLabels(operand, labelDict);

			yield return new DisassemblyLine(pc, bytes, mnemonic, operand, label, comment);
			pc += size;
		}
	}

	public DisassemblyLine DisassembleInstruction(byte[] data, int offset, RomPlatform platform) {
		var decoder = GetDecoder(platform);
		var (mnemonic, operand, size) = decoder.Decode(data, offset);
		var bytes = new byte[size];
		Array.Copy(data, offset, bytes, 0, Math.Min(size, data.Length - offset));

		return new DisassemblyLine(offset, bytes, mnemonic, operand);
	}

	public IInstructionDecoder GetDecoder(RomPlatform platform) {
		if (_decoders.TryGetValue(platform, out var decoder))
			return decoder;

		// Default to 6502 for unknown platforms
		return new Mos6502Decoder();
	}

	public string FormatOutput(
		IEnumerable<DisassemblyLine> lines,
		DisassemblyFormat format = DisassemblyFormat.Ca65,
		bool includeBytes = true) {
		var sb = new System.Text.StringBuilder();

		foreach (var line in lines) {
			// Label
			if (!string.IsNullOrEmpty(line.Label)) {
				sb.AppendLine(FormatLabel(line.Label, format));
			}

			// Instruction
			var instruction = FormatInstruction(line, format, includeBytes);
			sb.AppendLine(instruction);
		}

		return sb.ToString();
	}

	private static string FormatLabel(string label, DisassemblyFormat format) {
		return format switch {
			DisassemblyFormat.Ca65 => $"{label}:",
			DisassemblyFormat.Asm6 => $"{label}:",
			DisassemblyFormat.NesAsm => $"{label}:",
			_ => $"{label}:"
		};
	}

	private static string FormatInstruction(DisassemblyLine line, DisassemblyFormat format, bool includeBytes) {
		var address = $"${line.Address:x4}";
		var bytes = includeBytes ? string.Join(" ", line.Bytes.Select(b => $"{b:x2}")) : "";
		var instruction = string.IsNullOrEmpty(line.Operand)
			? line.Mnemonic
			: $"{line.Mnemonic} {line.Operand}";

		var comment = !string.IsNullOrEmpty(line.Comment)
			? $" ; {line.Comment}"
			: "";

		return format switch {
			DisassemblyFormat.Ca65 when includeBytes =>
				$"    {instruction,-20}{comment}".TrimEnd() + $" ; {address}: {bytes}",
			DisassemblyFormat.Ca65 =>
				$"    {instruction,-20}{comment}".TrimEnd(),
			DisassemblyFormat.Plain =>
				$"{address}: {bytes,-12} {instruction}{comment}",
			_ =>
				$"    {instruction}{comment}"
		};
	}

	private static string ResolveLabels(string operand, Dictionary<int, Label> labels) {
		// Try to parse address from operand and replace with label
		if (string.IsNullOrEmpty(operand)) return operand;

		// Match $xxxx addresses
		if (operand.StartsWith('$') && operand.Length >= 3) {
			var addrStr = operand.TrimStart('$').Split(',')[0].Split(')')[0].Split('(')[0];
			if (int.TryParse(addrStr, System.Globalization.NumberStyles.HexNumber, null, out var addr)) {
				if (labels.TryGetValue(addr, out var label)) {
					return operand.Replace($"${addrStr}", label.Name);
				}
			}
		}

		return operand;
	}
}

/// <summary>
/// MOS 6502 instruction decoder (NES, C64, Apple II, etc.)
/// </summary>
public class Mos6502Decoder : IInstructionDecoder {
	public string Architecture => "MOS 6502";

	// Addressing modes
	private enum Mode {
		Imp,    // Implied
		Acc,    // Accumulator
		Imm,    // Immediate #$xx
		Zp,     // Zero Page $xx
		ZpX,    // Zero Page,X $xx,X
		ZpY,    // Zero Page,Y $xx,Y
		Abs,    // Absolute $xxxx
		AbsX,   // Absolute,X $xxxx,X
		AbsY,   // Absolute,Y $xxxx,Y
		Ind,    // Indirect ($xxxx)
		IndX,   // Indexed Indirect ($xx,X)
		IndY,   // Indirect Indexed ($xx),Y
		Rel     // Relative (branch)
	}

	private static readonly (string Mnemonic, Mode Mode)[] _opcodes = new (string, Mode)[256];

	static Mos6502Decoder() {
		// Initialize all opcodes to unknown
		for (var i = 0; i < 256; i++)
			_opcodes[i] = ("???", Mode.Imp);

		// Load/Store
		_opcodes[0xa9] = ("lda", Mode.Imm);
		_opcodes[0xa5] = ("lda", Mode.Zp);
		_opcodes[0xb5] = ("lda", Mode.ZpX);
		_opcodes[0xad] = ("lda", Mode.Abs);
		_opcodes[0xbd] = ("lda", Mode.AbsX);
		_opcodes[0xb9] = ("lda", Mode.AbsY);
		_opcodes[0xa1] = ("lda", Mode.IndX);
		_opcodes[0xb1] = ("lda", Mode.IndY);

		_opcodes[0xa2] = ("ldx", Mode.Imm);
		_opcodes[0xa6] = ("ldx", Mode.Zp);
		_opcodes[0xb6] = ("ldx", Mode.ZpY);
		_opcodes[0xae] = ("ldx", Mode.Abs);
		_opcodes[0xbe] = ("ldx", Mode.AbsY);

		_opcodes[0xa0] = ("ldy", Mode.Imm);
		_opcodes[0xa4] = ("ldy", Mode.Zp);
		_opcodes[0xb4] = ("ldy", Mode.ZpX);
		_opcodes[0xac] = ("ldy", Mode.Abs);
		_opcodes[0xbc] = ("ldy", Mode.AbsX);

		_opcodes[0x85] = ("sta", Mode.Zp);
		_opcodes[0x95] = ("sta", Mode.ZpX);
		_opcodes[0x8d] = ("sta", Mode.Abs);
		_opcodes[0x9d] = ("sta", Mode.AbsX);
		_opcodes[0x99] = ("sta", Mode.AbsY);
		_opcodes[0x81] = ("sta", Mode.IndX);
		_opcodes[0x91] = ("sta", Mode.IndY);

		_opcodes[0x86] = ("stx", Mode.Zp);
		_opcodes[0x96] = ("stx", Mode.ZpY);
		_opcodes[0x8e] = ("stx", Mode.Abs);

		_opcodes[0x84] = ("sty", Mode.Zp);
		_opcodes[0x94] = ("sty", Mode.ZpX);
		_opcodes[0x8c] = ("sty", Mode.Abs);

		// Transfers
		_opcodes[0xaa] = ("tax", Mode.Imp);
		_opcodes[0xa8] = ("tay", Mode.Imp);
		_opcodes[0xba] = ("tsx", Mode.Imp);
		_opcodes[0x8a] = ("txa", Mode.Imp);
		_opcodes[0x9a] = ("txs", Mode.Imp);
		_opcodes[0x98] = ("tya", Mode.Imp);

		// Stack
		_opcodes[0x48] = ("pha", Mode.Imp);
		_opcodes[0x08] = ("php", Mode.Imp);
		_opcodes[0x68] = ("pla", Mode.Imp);
		_opcodes[0x28] = ("plp", Mode.Imp);

		// Arithmetic
		_opcodes[0x69] = ("adc", Mode.Imm);
		_opcodes[0x65] = ("adc", Mode.Zp);
		_opcodes[0x75] = ("adc", Mode.ZpX);
		_opcodes[0x6d] = ("adc", Mode.Abs);
		_opcodes[0x7d] = ("adc", Mode.AbsX);
		_opcodes[0x79] = ("adc", Mode.AbsY);
		_opcodes[0x61] = ("adc", Mode.IndX);
		_opcodes[0x71] = ("adc", Mode.IndY);

		_opcodes[0xe9] = ("sbc", Mode.Imm);
		_opcodes[0xe5] = ("sbc", Mode.Zp);
		_opcodes[0xf5] = ("sbc", Mode.ZpX);
		_opcodes[0xed] = ("sbc", Mode.Abs);
		_opcodes[0xfd] = ("sbc", Mode.AbsX);
		_opcodes[0xf9] = ("sbc", Mode.AbsY);
		_opcodes[0xe1] = ("sbc", Mode.IndX);
		_opcodes[0xf1] = ("sbc", Mode.IndY);

		// Compare
		_opcodes[0xc9] = ("cmp", Mode.Imm);
		_opcodes[0xc5] = ("cmp", Mode.Zp);
		_opcodes[0xd5] = ("cmp", Mode.ZpX);
		_opcodes[0xcd] = ("cmp", Mode.Abs);
		_opcodes[0xdd] = ("cmp", Mode.AbsX);
		_opcodes[0xd9] = ("cmp", Mode.AbsY);
		_opcodes[0xc1] = ("cmp", Mode.IndX);
		_opcodes[0xd1] = ("cmp", Mode.IndY);

		_opcodes[0xe0] = ("cpx", Mode.Imm);
		_opcodes[0xe4] = ("cpx", Mode.Zp);
		_opcodes[0xec] = ("cpx", Mode.Abs);

		_opcodes[0xc0] = ("cpy", Mode.Imm);
		_opcodes[0xc4] = ("cpy", Mode.Zp);
		_opcodes[0xcc] = ("cpy", Mode.Abs);

		// Inc/Dec
		_opcodes[0xe6] = ("inc", Mode.Zp);
		_opcodes[0xf6] = ("inc", Mode.ZpX);
		_opcodes[0xee] = ("inc", Mode.Abs);
		_opcodes[0xfe] = ("inc", Mode.AbsX);
		_opcodes[0xe8] = ("inx", Mode.Imp);
		_opcodes[0xc8] = ("iny", Mode.Imp);

		_opcodes[0xc6] = ("dec", Mode.Zp);
		_opcodes[0xd6] = ("dec", Mode.ZpX);
		_opcodes[0xce] = ("dec", Mode.Abs);
		_opcodes[0xde] = ("dec", Mode.AbsX);
		_opcodes[0xca] = ("dex", Mode.Imp);
		_opcodes[0x88] = ("dey", Mode.Imp);

		// Logic
		_opcodes[0x29] = ("and", Mode.Imm);
		_opcodes[0x25] = ("and", Mode.Zp);
		_opcodes[0x35] = ("and", Mode.ZpX);
		_opcodes[0x2d] = ("and", Mode.Abs);
		_opcodes[0x3d] = ("and", Mode.AbsX);
		_opcodes[0x39] = ("and", Mode.AbsY);
		_opcodes[0x21] = ("and", Mode.IndX);
		_opcodes[0x31] = ("and", Mode.IndY);

		_opcodes[0x09] = ("ora", Mode.Imm);
		_opcodes[0x05] = ("ora", Mode.Zp);
		_opcodes[0x15] = ("ora", Mode.ZpX);
		_opcodes[0x0d] = ("ora", Mode.Abs);
		_opcodes[0x1d] = ("ora", Mode.AbsX);
		_opcodes[0x19] = ("ora", Mode.AbsY);
		_opcodes[0x01] = ("ora", Mode.IndX);
		_opcodes[0x11] = ("ora", Mode.IndY);

		_opcodes[0x49] = ("eor", Mode.Imm);
		_opcodes[0x45] = ("eor", Mode.Zp);
		_opcodes[0x55] = ("eor", Mode.ZpX);
		_opcodes[0x4d] = ("eor", Mode.Abs);
		_opcodes[0x5d] = ("eor", Mode.AbsX);
		_opcodes[0x59] = ("eor", Mode.AbsY);
		_opcodes[0x41] = ("eor", Mode.IndX);
		_opcodes[0x51] = ("eor", Mode.IndY);

		_opcodes[0x24] = ("bit", Mode.Zp);
		_opcodes[0x2c] = ("bit", Mode.Abs);

		// Shift/Rotate
		_opcodes[0x0a] = ("asl", Mode.Acc);
		_opcodes[0x06] = ("asl", Mode.Zp);
		_opcodes[0x16] = ("asl", Mode.ZpX);
		_opcodes[0x0e] = ("asl", Mode.Abs);
		_opcodes[0x1e] = ("asl", Mode.AbsX);

		_opcodes[0x4a] = ("lsr", Mode.Acc);
		_opcodes[0x46] = ("lsr", Mode.Zp);
		_opcodes[0x56] = ("lsr", Mode.ZpX);
		_opcodes[0x4e] = ("lsr", Mode.Abs);
		_opcodes[0x5e] = ("lsr", Mode.AbsX);

		_opcodes[0x2a] = ("rol", Mode.Acc);
		_opcodes[0x26] = ("rol", Mode.Zp);
		_opcodes[0x36] = ("rol", Mode.ZpX);
		_opcodes[0x2e] = ("rol", Mode.Abs);
		_opcodes[0x3e] = ("rol", Mode.AbsX);

		_opcodes[0x6a] = ("ror", Mode.Acc);
		_opcodes[0x66] = ("ror", Mode.Zp);
		_opcodes[0x76] = ("ror", Mode.ZpX);
		_opcodes[0x6e] = ("ror", Mode.Abs);
		_opcodes[0x7e] = ("ror", Mode.AbsX);

		// Branches
		_opcodes[0x90] = ("bcc", Mode.Rel);
		_opcodes[0xb0] = ("bcs", Mode.Rel);
		_opcodes[0xf0] = ("beq", Mode.Rel);
		_opcodes[0x30] = ("bmi", Mode.Rel);
		_opcodes[0xd0] = ("bne", Mode.Rel);
		_opcodes[0x10] = ("bpl", Mode.Rel);
		_opcodes[0x50] = ("bvc", Mode.Rel);
		_opcodes[0x70] = ("bvs", Mode.Rel);

		// Jumps
		_opcodes[0x4c] = ("jmp", Mode.Abs);
		_opcodes[0x6c] = ("jmp", Mode.Ind);
		_opcodes[0x20] = ("jsr", Mode.Abs);
		_opcodes[0x60] = ("rts", Mode.Imp);
		_opcodes[0x40] = ("rti", Mode.Imp);

		// Flags
		_opcodes[0x18] = ("clc", Mode.Imp);
		_opcodes[0xd8] = ("cld", Mode.Imp);
		_opcodes[0x58] = ("cli", Mode.Imp);
		_opcodes[0xb8] = ("clv", Mode.Imp);
		_opcodes[0x38] = ("sec", Mode.Imp);
		_opcodes[0xf8] = ("sed", Mode.Imp);
		_opcodes[0x78] = ("sei", Mode.Imp);

		// Misc
		_opcodes[0x00] = ("brk", Mode.Imp);
		_opcodes[0xea] = ("nop", Mode.Imp);
	}

	public (string Mnemonic, string Operand, int Size) Decode(byte[] data, int offset) {
		if (offset >= data.Length)
			return ("???", "", 1);

		var opcode = data[offset];
		var (mnemonic, mode) = _opcodes[opcode];
		var (operand, size) = DecodeOperand(data, offset, mode);

		return (mnemonic, operand, size);
	}

	private static (string Operand, int Size) DecodeOperand(byte[] data, int offset, Mode mode) {
		return mode switch {
			Mode.Imp => ("", 1),
			Mode.Acc => ("a", 1),
			Mode.Imm when offset + 1 < data.Length => ($"#${data[offset + 1]:x2}", 2),
			Mode.Zp when offset + 1 < data.Length => ($"${data[offset + 1]:x2}", 2),
			Mode.ZpX when offset + 1 < data.Length => ($"${data[offset + 1]:x2},x", 2),
			Mode.ZpY when offset + 1 < data.Length => ($"${data[offset + 1]:x2},y", 2),
			Mode.Abs when offset + 2 < data.Length => ($"${data[offset + 1] | (data[offset + 2] << 8):x4}", 3),
			Mode.AbsX when offset + 2 < data.Length => ($"${data[offset + 1] | (data[offset + 2] << 8):x4},x", 3),
			Mode.AbsY when offset + 2 < data.Length => ($"${data[offset + 1] | (data[offset + 2] << 8):x4},y", 3),
			Mode.Ind when offset + 2 < data.Length => ($"(${data[offset + 1] | (data[offset + 2] << 8):x4})", 3),
			Mode.IndX when offset + 1 < data.Length => ($"(${data[offset + 1]:x2},x)", 2),
			Mode.IndY when offset + 1 < data.Length => ($"(${data[offset + 1]:x2}),y", 2),
			Mode.Rel when offset + 1 < data.Length =>
				($"${(offset + 2 + (sbyte)data[offset + 1]) & 0xffff:x4}", 2),
			_ => ("", 1)
		};
	}
}

/// <summary>
/// WDC 65816 instruction decoder (SNES)
/// </summary>
public class Wdc65816Decoder : IInstructionDecoder {
	public string Architecture => "WDC 65816";

	public (string Mnemonic, string Operand, int Size) Decode(byte[] data, int offset) {
		// For now, use basic 6502 decoding with 16-bit extensions
		// A full implementation would handle all 65816-specific opcodes
		var decoder = new Mos6502Decoder();
		return decoder.Decode(data, offset);
	}
}

/// <summary>
/// Sharp LR35902 instruction decoder (Game Boy)
/// </summary>
public class SharpLr35902Decoder : IInstructionDecoder {
	public string Architecture => "Sharp LR35902 (Game Boy)";

	private static readonly string[] _mnemonics = new string[256];
	private static readonly int[] _sizes = new int[256];

	static SharpLr35902Decoder() {
		// Initialize default values
		for (var i = 0; i < 256; i++) {
			_mnemonics[i] = "???";
			_sizes[i] = 1;
		}

		// Common Game Boy opcodes
		_mnemonics[0x00] = "nop"; _sizes[0x00] = 1;
		_mnemonics[0x01] = "ld bc,"; _sizes[0x01] = 3;
		_mnemonics[0x02] = "ld (bc),a"; _sizes[0x02] = 1;
		_mnemonics[0x03] = "inc bc"; _sizes[0x03] = 1;
		_mnemonics[0x04] = "inc b"; _sizes[0x04] = 1;
		_mnemonics[0x05] = "dec b"; _sizes[0x05] = 1;
		_mnemonics[0x06] = "ld b,"; _sizes[0x06] = 2;
		_mnemonics[0x07] = "rlca"; _sizes[0x07] = 1;
		_mnemonics[0x08] = "ld (),sp"; _sizes[0x08] = 3;
		_mnemonics[0x09] = "add hl,bc"; _sizes[0x09] = 1;
		_mnemonics[0x0a] = "ld a,(bc)"; _sizes[0x0a] = 1;
		_mnemonics[0x0b] = "dec bc"; _sizes[0x0b] = 1;
		_mnemonics[0x0c] = "inc c"; _sizes[0x0c] = 1;
		_mnemonics[0x0d] = "dec c"; _sizes[0x0d] = 1;
		_mnemonics[0x0e] = "ld c,"; _sizes[0x0e] = 2;
		_mnemonics[0x0f] = "rrca"; _sizes[0x0f] = 1;

		// Jumps and calls
		_mnemonics[0xc3] = "jp"; _sizes[0xc3] = 3;
		_mnemonics[0xcd] = "call"; _sizes[0xcd] = 3;
		_mnemonics[0xc9] = "ret"; _sizes[0xc9] = 1;
		_mnemonics[0x18] = "jr"; _sizes[0x18] = 2;
		_mnemonics[0x20] = "jr nz,"; _sizes[0x20] = 2;
		_mnemonics[0x28] = "jr z,"; _sizes[0x28] = 2;
		_mnemonics[0x30] = "jr nc,"; _sizes[0x30] = 2;
		_mnemonics[0x38] = "jr c,"; _sizes[0x38] = 2;

		// Loads
		_mnemonics[0x3e] = "ld a,"; _sizes[0x3e] = 2;
		_mnemonics[0x21] = "ld hl,"; _sizes[0x21] = 3;
		_mnemonics[0x31] = "ld sp,"; _sizes[0x31] = 3;

		// Stack
		_mnemonics[0xc5] = "push bc"; _sizes[0xc5] = 1;
		_mnemonics[0xd5] = "push de"; _sizes[0xd5] = 1;
		_mnemonics[0xe5] = "push hl"; _sizes[0xe5] = 1;
		_mnemonics[0xf5] = "push af"; _sizes[0xf5] = 1;
		_mnemonics[0xc1] = "pop bc"; _sizes[0xc1] = 1;
		_mnemonics[0xd1] = "pop de"; _sizes[0xd1] = 1;
		_mnemonics[0xe1] = "pop hl"; _sizes[0xe1] = 1;
		_mnemonics[0xf1] = "pop af"; _sizes[0xf1] = 1;

		// CB prefix (extended opcodes)
		_mnemonics[0xcb] = "CB"; _sizes[0xcb] = 2;

		// Misc
		_mnemonics[0x76] = "halt"; _sizes[0x76] = 1;
		_mnemonics[0xf3] = "di"; _sizes[0xf3] = 1;
		_mnemonics[0xfb] = "ei"; _sizes[0xfb] = 1;
	}

	public (string Mnemonic, string Operand, int Size) Decode(byte[] data, int offset) {
		if (offset >= data.Length)
			return ("???", "", 1);

		var opcode = data[offset];
		var mnemonic = _mnemonics[opcode];
		var size = _sizes[opcode];
		var operand = "";

		if (size == 2 && offset + 1 < data.Length) {
			operand = $"${data[offset + 1]:x2}";
		} else if (size == 3 && offset + 2 < data.Length) {
			operand = $"${data[offset + 1] | (data[offset + 2] << 8):x4}";
		}

		return (mnemonic, operand, size);
	}
}
