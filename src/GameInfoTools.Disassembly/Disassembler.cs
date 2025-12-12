using System.Text;
using GameInfoTools.Core;

namespace GameInfoTools.Disassembly;

/// <summary>
/// 6502/65816 disassembler.
/// </summary>
public class Disassembler {
	/// <summary>
	/// CPU mode.
	/// </summary>
	public enum CpuMode {
		Cpu6502,    // NES, C64, etc.
		Cpu65C02,   // Apple IIc, etc.
		Cpu65816,   // SNES
	}

	/// <summary>
	/// Disassembly options.
	/// </summary>
	public class Options {
		public CpuMode Mode { get; set; } = CpuMode.Cpu6502;
		public int BaseAddress { get; set; } = 0x8000;
		public bool ShowBytes { get; set; } = true;
		public bool ShowAddresses { get; set; } = true;
		public bool LowercaseHex { get; set; } = true;
		public bool LowercaseMnemonics { get; set; } = true;
		public SymbolTable? Symbols { get; set; }
		public int TabWidth { get; set; } = 4;
	}

	/// <summary>
	/// Disassembled instruction.
	/// </summary>
	public record DisassembledInstruction(
		int Address,
		byte[] Bytes,
		string Mnemonic,
		string Operand,
		string? Comment = null
	);

	private readonly byte[] _data;
	private readonly Options _options;

	// 6502 opcode definitions
	private static readonly (string Mnemonic, int Length, string Mode)[] Opcodes6502 = CreateOpcodeTable();

	public Disassembler(byte[] data, Options? options = null) {
		_data = data;
		_options = options ?? new Options();
	}

	/// <summary>
	/// Disassemble a range of bytes.
	/// </summary>
	public List<DisassembledInstruction> Disassemble(int offset, int length) {
		var instructions = new List<DisassembledInstruction>();
		int end = offset + length;
		int pos = offset;

		while (pos < end && pos < _data.Length) {
			var instr = DisassembleOne(pos);
			instructions.Add(instr);
			pos += instr.Bytes.Length;
		}

		return instructions;
	}

	/// <summary>
	/// Disassemble a single instruction.
	/// </summary>
	public DisassembledInstruction DisassembleOne(int offset) {
		if (offset >= _data.Length) {
			return new DisassembledInstruction(
				_options.BaseAddress + offset,
				Array.Empty<byte>(),
				".byte",
				"??",
				"Beyond end of data"
			);
		}

		byte opcode = _data[offset];
		var (mnemonic, length, mode) = Opcodes6502[opcode];

		// Handle invalid/unknown opcodes
		if (string.IsNullOrEmpty(mnemonic)) {
			return new DisassembledInstruction(
				_options.BaseAddress + offset,
				new byte[] { opcode },
				".byte",
				FormatByte(opcode),
				"Unknown opcode"
			);
		}

		// Read operand bytes
		var bytes = new byte[length];
		for (int i = 0; i < length && offset + i < _data.Length; i++) {
			bytes[i] = _data[offset + i];
		}

		// Format operand based on addressing mode
		string operand = FormatOperand(mode, bytes, _options.BaseAddress + offset);

		// Check for symbol
		string? comment = null;
		if (_options.Symbols != null) {
			int targetAddr = GetTargetAddress(mode, bytes, _options.BaseAddress + offset);
			if (targetAddr >= 0) {
				var symbol = _options.Symbols.GetSymbol(targetAddr);
				if (symbol != null && operand.Contains(FormatWord((ushort)targetAddr))) {
					operand = operand.Replace(FormatWord((ushort)targetAddr), symbol);
				} else if (symbol != null) {
					comment = symbol;
				}
			}
		}

		// Apply case preference
		if (_options.LowercaseMnemonics) {
			mnemonic = mnemonic.ToLowerInvariant();
		}

		return new DisassembledInstruction(
			_options.BaseAddress + offset,
			bytes,
			mnemonic,
			operand,
			comment
		);
	}

	private string FormatOperand(string mode, byte[] bytes, int instrAddr) {
		if (bytes.Length < 1) {
			return "";
		}

		return mode switch {
			"imp" => "",
			"acc" => "a",
			"imm" => $"#${FormatByte(bytes[1])}",
			"zp" => $"${FormatByte(bytes[1])}",
			"zpx" => $"${FormatByte(bytes[1])},x",
			"zpy" => $"${FormatByte(bytes[1])},y",
			"abs" when bytes.Length >= 3 => $"${FormatWord(bytes[1], bytes[2])}",
			"abx" when bytes.Length >= 3 => $"${FormatWord(bytes[1], bytes[2])},x",
			"aby" when bytes.Length >= 3 => $"${FormatWord(bytes[1], bytes[2])},y",
			"ind" when bytes.Length >= 3 => $"(${FormatWord(bytes[1], bytes[2])})",
			"inx" => $"(${FormatByte(bytes[1])},x)",
			"iny" => $"(${FormatByte(bytes[1])}),y",
			"rel" when bytes.Length >= 2 => FormatRelative(bytes[1], instrAddr),
			_ => bytes.Length >= 2 ? $"${FormatByte(bytes[1])}" : ""
		};
	}

	private int GetTargetAddress(string mode, byte[] bytes, int instrAddr) {
		return mode switch {
			"abs" or "abx" or "aby" or "ind" when bytes.Length >= 3 => bytes[1] | (bytes[2] << 8),
			"zp" or "zpx" or "zpy" or "inx" or "iny" when bytes.Length >= 2 => bytes[1],
			"rel" when bytes.Length >= 2 => instrAddr + 2 + (sbyte)bytes[1],
			_ => -1
		};
	}

	private string FormatRelative(byte offset, int instrAddr) {
		int target = instrAddr + 2 + (sbyte)offset;
		return $"${FormatWord((ushort)target)}";
	}

	private string FormatByte(byte b) {
		return _options.LowercaseHex ? $"{b:x2}" : $"{b:X2}";
	}

	private string FormatWord(byte lo, byte hi) {
		int word = lo | (hi << 8);
		return FormatWord((ushort)word);
	}

	private string FormatWord(ushort w) {
		return _options.LowercaseHex ? $"{w:x4}" : $"{w:X4}";
	}

	/// <summary>
	/// Format disassembly as text.
	/// </summary>
	public string FormatAsText(List<DisassembledInstruction> instructions) {
		var sb = new StringBuilder();

		foreach (var instr in instructions) {
			// Address
			if (_options.ShowAddresses) {
				sb.Append($"${FormatWord((ushort)instr.Address)}:  ");
			}

			// Bytes
			if (_options.ShowBytes) {
				var bytesStr = string.Join(" ", instr.Bytes.Select(b => FormatByte(b)));
				sb.Append($"{bytesStr,-9} ");
			}

			// Mnemonic and operand
			sb.Append($"{instr.Mnemonic,-4} {instr.Operand}");

			// Comment
			if (!string.IsNullOrEmpty(instr.Comment)) {
				int currentLen = sb.Length - sb.ToString().LastIndexOf('\n') - 1;
				int padding = Math.Max(1, 40 - currentLen);
				sb.Append(new string(' ', padding));
				sb.Append($"; {instr.Comment}");
			}

			sb.AppendLine();
		}

		return sb.ToString();
	}

	/// <summary>
	/// Generate an assembly source file.
	/// </summary>
	public string GenerateAsmSource(int offset, int length, string? label = null) {
		var sb = new StringBuilder();
		var instructions = Disassemble(offset, length);

		// Header
		sb.AppendLine($"; Disassembly of ${_options.BaseAddress + offset:x4}-${_options.BaseAddress + offset + length - 1:x4}");
		sb.AppendLine($"; Generated by GameInfoTools Disassembler");
		sb.AppendLine();

		if (!string.IsNullOrEmpty(label)) {
			sb.AppendLine($"{label}:");
		}

		// Instructions
		foreach (var instr in instructions) {
			// Check for label at this address
			var symbol = _options.Symbols?.GetSymbol(instr.Address);
			if (!string.IsNullOrEmpty(symbol)) {
				sb.AppendLine($"{symbol}:");
			}

			// Instruction
			sb.Append('\t');
			sb.Append($"{instr.Mnemonic,-4}");

			if (!string.IsNullOrEmpty(instr.Operand)) {
				sb.Append($" {instr.Operand}");
			}

			// Comment with bytes
			if (_options.ShowBytes) {
				var bytesStr = string.Join(" ", instr.Bytes.Select(b => FormatByte(b)));
				sb.Append($"\t\t; ${instr.Address:x4}: {bytesStr}");
			}

			if (!string.IsNullOrEmpty(instr.Comment)) {
				sb.Append($" - {instr.Comment}");
			}

			sb.AppendLine();
		}

		return sb.ToString();
	}

	private static (string Mnemonic, int Length, string Mode)[] CreateOpcodeTable() {
		var table = new (string, int, string)[256];

		// Initialize all as unknown
		for (int i = 0; i < 256; i++) {
			table[i] = ("", 1, "imp");
		}

		// ADC
		table[0x69] = ("ADC", 2, "imm");
		table[0x65] = ("ADC", 2, "zp");
		table[0x75] = ("ADC", 2, "zpx");
		table[0x6d] = ("ADC", 3, "abs");
		table[0x7d] = ("ADC", 3, "abx");
		table[0x79] = ("ADC", 3, "aby");
		table[0x61] = ("ADC", 2, "inx");
		table[0x71] = ("ADC", 2, "iny");

		// AND
		table[0x29] = ("AND", 2, "imm");
		table[0x25] = ("AND", 2, "zp");
		table[0x35] = ("AND", 2, "zpx");
		table[0x2d] = ("AND", 3, "abs");
		table[0x3d] = ("AND", 3, "abx");
		table[0x39] = ("AND", 3, "aby");
		table[0x21] = ("AND", 2, "inx");
		table[0x31] = ("AND", 2, "iny");

		// ASL
		table[0x0a] = ("ASL", 1, "acc");
		table[0x06] = ("ASL", 2, "zp");
		table[0x16] = ("ASL", 2, "zpx");
		table[0x0e] = ("ASL", 3, "abs");
		table[0x1e] = ("ASL", 3, "abx");

		// Branches
		table[0x90] = ("BCC", 2, "rel");
		table[0xb0] = ("BCS", 2, "rel");
		table[0xf0] = ("BEQ", 2, "rel");
		table[0x30] = ("BMI", 2, "rel");
		table[0xd0] = ("BNE", 2, "rel");
		table[0x10] = ("BPL", 2, "rel");
		table[0x50] = ("BVC", 2, "rel");
		table[0x70] = ("BVS", 2, "rel");

		// BIT
		table[0x24] = ("BIT", 2, "zp");
		table[0x2c] = ("BIT", 3, "abs");

		// BRK
		table[0x00] = ("BRK", 1, "imp");

		// Clear flags
		table[0x18] = ("CLC", 1, "imp");
		table[0xd8] = ("CLD", 1, "imp");
		table[0x58] = ("CLI", 1, "imp");
		table[0xb8] = ("CLV", 1, "imp");

		// CMP
		table[0xc9] = ("CMP", 2, "imm");
		table[0xc5] = ("CMP", 2, "zp");
		table[0xd5] = ("CMP", 2, "zpx");
		table[0xcd] = ("CMP", 3, "abs");
		table[0xdd] = ("CMP", 3, "abx");
		table[0xd9] = ("CMP", 3, "aby");
		table[0xc1] = ("CMP", 2, "inx");
		table[0xd1] = ("CMP", 2, "iny");

		// CPX
		table[0xe0] = ("CPX", 2, "imm");
		table[0xe4] = ("CPX", 2, "zp");
		table[0xec] = ("CPX", 3, "abs");

		// CPY
		table[0xc0] = ("CPY", 2, "imm");
		table[0xc4] = ("CPY", 2, "zp");
		table[0xcc] = ("CPY", 3, "abs");

		// DEC
		table[0xc6] = ("DEC", 2, "zp");
		table[0xd6] = ("DEC", 2, "zpx");
		table[0xce] = ("DEC", 3, "abs");
		table[0xde] = ("DEC", 3, "abx");

		// DEX, DEY
		table[0xca] = ("DEX", 1, "imp");
		table[0x88] = ("DEY", 1, "imp");

		// EOR
		table[0x49] = ("EOR", 2, "imm");
		table[0x45] = ("EOR", 2, "zp");
		table[0x55] = ("EOR", 2, "zpx");
		table[0x4d] = ("EOR", 3, "abs");
		table[0x5d] = ("EOR", 3, "abx");
		table[0x59] = ("EOR", 3, "aby");
		table[0x41] = ("EOR", 2, "inx");
		table[0x51] = ("EOR", 2, "iny");

		// INC
		table[0xe6] = ("INC", 2, "zp");
		table[0xf6] = ("INC", 2, "zpx");
		table[0xee] = ("INC", 3, "abs");
		table[0xfe] = ("INC", 3, "abx");

		// INX, INY
		table[0xe8] = ("INX", 1, "imp");
		table[0xc8] = ("INY", 1, "imp");

		// JMP
		table[0x4c] = ("JMP", 3, "abs");
		table[0x6c] = ("JMP", 3, "ind");

		// JSR
		table[0x20] = ("JSR", 3, "abs");

		// LDA
		table[0xa9] = ("LDA", 2, "imm");
		table[0xa5] = ("LDA", 2, "zp");
		table[0xb5] = ("LDA", 2, "zpx");
		table[0xad] = ("LDA", 3, "abs");
		table[0xbd] = ("LDA", 3, "abx");
		table[0xb9] = ("LDA", 3, "aby");
		table[0xa1] = ("LDA", 2, "inx");
		table[0xb1] = ("LDA", 2, "iny");

		// LDX
		table[0xa2] = ("LDX", 2, "imm");
		table[0xa6] = ("LDX", 2, "zp");
		table[0xb6] = ("LDX", 2, "zpy");
		table[0xae] = ("LDX", 3, "abs");
		table[0xbe] = ("LDX", 3, "aby");

		// LDY
		table[0xa0] = ("LDY", 2, "imm");
		table[0xa4] = ("LDY", 2, "zp");
		table[0xb4] = ("LDY", 2, "zpx");
		table[0xac] = ("LDY", 3, "abs");
		table[0xbc] = ("LDY", 3, "abx");

		// LSR
		table[0x4a] = ("LSR", 1, "acc");
		table[0x46] = ("LSR", 2, "zp");
		table[0x56] = ("LSR", 2, "zpx");
		table[0x4e] = ("LSR", 3, "abs");
		table[0x5e] = ("LSR", 3, "abx");

		// NOP
		table[0xea] = ("NOP", 1, "imp");

		// ORA
		table[0x09] = ("ORA", 2, "imm");
		table[0x05] = ("ORA", 2, "zp");
		table[0x15] = ("ORA", 2, "zpx");
		table[0x0d] = ("ORA", 3, "abs");
		table[0x1d] = ("ORA", 3, "abx");
		table[0x19] = ("ORA", 3, "aby");
		table[0x01] = ("ORA", 2, "inx");
		table[0x11] = ("ORA", 2, "iny");

		// Stack
		table[0x48] = ("PHA", 1, "imp");
		table[0x08] = ("PHP", 1, "imp");
		table[0x68] = ("PLA", 1, "imp");
		table[0x28] = ("PLP", 1, "imp");

		// ROL
		table[0x2a] = ("ROL", 1, "acc");
		table[0x26] = ("ROL", 2, "zp");
		table[0x36] = ("ROL", 2, "zpx");
		table[0x2e] = ("ROL", 3, "abs");
		table[0x3e] = ("ROL", 3, "abx");

		// ROR
		table[0x6a] = ("ROR", 1, "acc");
		table[0x66] = ("ROR", 2, "zp");
		table[0x76] = ("ROR", 2, "zpx");
		table[0x6e] = ("ROR", 3, "abs");
		table[0x7e] = ("ROR", 3, "abx");

		// RTI, RTS
		table[0x40] = ("RTI", 1, "imp");
		table[0x60] = ("RTS", 1, "imp");

		// SBC
		table[0xe9] = ("SBC", 2, "imm");
		table[0xe5] = ("SBC", 2, "zp");
		table[0xf5] = ("SBC", 2, "zpx");
		table[0xed] = ("SBC", 3, "abs");
		table[0xfd] = ("SBC", 3, "abx");
		table[0xf9] = ("SBC", 3, "aby");
		table[0xe1] = ("SBC", 2, "inx");
		table[0xf1] = ("SBC", 2, "iny");

		// Set flags
		table[0x38] = ("SEC", 1, "imp");
		table[0xf8] = ("SED", 1, "imp");
		table[0x78] = ("SEI", 1, "imp");

		// STA
		table[0x85] = ("STA", 2, "zp");
		table[0x95] = ("STA", 2, "zpx");
		table[0x8d] = ("STA", 3, "abs");
		table[0x9d] = ("STA", 3, "abx");
		table[0x99] = ("STA", 3, "aby");
		table[0x81] = ("STA", 2, "inx");
		table[0x91] = ("STA", 2, "iny");

		// STX
		table[0x86] = ("STX", 2, "zp");
		table[0x96] = ("STX", 2, "zpy");
		table[0x8e] = ("STX", 3, "abs");

		// STY
		table[0x84] = ("STY", 2, "zp");
		table[0x94] = ("STY", 2, "zpx");
		table[0x8c] = ("STY", 3, "abs");

		// Transfers
		table[0xaa] = ("TAX", 1, "imp");
		table[0xa8] = ("TAY", 1, "imp");
		table[0xba] = ("TSX", 1, "imp");
		table[0x8a] = ("TXA", 1, "imp");
		table[0x9a] = ("TXS", 1, "imp");
		table[0x98] = ("TYA", 1, "imp");

		return table;
	}

	#region Advanced Multi-Architecture Support

	/// <summary>
	/// Extended CPU modes for different platforms.
	/// </summary>
	public enum ExtendedCpuMode {
		Cpu6502,       // NES, C64
		Cpu65C02,      // Apple IIc
		Cpu65816,      // SNES
		Spc700,        // SNES audio
		Z80,           // Game Boy, SMS
		Gbz80,         // Game Boy (modified Z80)
		Arm7Tdmi,      // GBA
		SuperFx,       // SNES co-processor
		Sa1,           // SNES co-processor
	}

	/// <summary>
	/// Function detection result.
	/// </summary>
	public record DetectedFunction(
		int StartAddress,
		int EndAddress,
		string Name,
		List<int> CalledBy,
		List<int> Calls,
		int StackUsage,
		bool IsLeaf
	);

	/// <summary>
	/// Local variable tracking result.
	/// </summary>
	public record LocalVariable(
		string Name,
		int StackOffset,
		int Size,
		string? Type
	);

	/// <summary>
	/// Z80 opcode table entry.
	/// </summary>
	private static readonly Dictionary<byte, (string Mnemonic, int Length, string Mode)> Z80Opcodes = CreateZ80Table();

	/// <summary>
	/// SPC700 opcode table entry.
	/// </summary>
	private static readonly Dictionary<byte, (string Mnemonic, int Length, string Mode)> Spc700Opcodes = CreateSpc700Table();

	/// <summary>
	/// Disassemble Z80 code.
	/// </summary>
	public static List<DisassembledInstruction> DisassembleZ80(byte[] data, int offset, int length, int baseAddress = 0) {
		var instructions = new List<DisassembledInstruction>();
		int end = Math.Min(offset + length, data.Length);
		int pos = offset;

		while (pos < end) {
			var instr = DisassembleZ80One(data, pos, baseAddress);
			instructions.Add(instr);
			pos += instr.Bytes.Length;
		}

		return instructions;
	}

	/// <summary>
	/// Disassemble a single Z80 instruction.
	/// </summary>
	public static DisassembledInstruction DisassembleZ80One(byte[] data, int offset, int baseAddress) {
		if (offset >= data.Length) {
			return new DisassembledInstruction(baseAddress + offset, [], ".byte", "??", "Beyond data");
		}

		byte opcode = data[offset];

		// Handle CB prefix (bit operations)
		if (opcode == 0xcb && offset + 1 < data.Length) {
			return DisassembleZ80CB(data, offset, baseAddress);
		}

		// Handle DD/FD prefix (IX/IY operations)
		if ((opcode == 0xdd || opcode == 0xfd) && offset + 1 < data.Length) {
			return DisassembleZ80Index(data, offset, baseAddress, opcode == 0xdd ? "ix" : "iy");
		}

		// Handle ED prefix (extended operations)
		if (opcode == 0xed && offset + 1 < data.Length) {
			return DisassembleZ80ED(data, offset, baseAddress);
		}

		if (!Z80Opcodes.TryGetValue(opcode, out var entry)) {
			return new DisassembledInstruction(baseAddress + offset, [opcode], ".byte", $"${opcode:x2}", "Unknown");
		}

		var (mnemonic, len, mode) = entry;
		var bytes = new byte[Math.Min(len, data.Length - offset)];
		Array.Copy(data, offset, bytes, 0, bytes.Length);

		string operand = FormatZ80Operand(mode, bytes, baseAddress + offset);

		return new DisassembledInstruction(baseAddress + offset, bytes, mnemonic.ToLower(), operand);
	}

	private static DisassembledInstruction DisassembleZ80CB(byte[] data, int offset, int baseAddress) {
		byte cb = data[offset + 1];
		int reg = cb & 0x07;
		int bit = (cb >> 3) & 0x07;
		int op = (cb >> 6) & 0x03;

		string[] regNames = ["b", "c", "d", "e", "h", "l", "(hl)", "a"];
		string regName = regNames[reg];

		string mnemonic = op switch {
			0 => (cb >> 3) switch {
				0 => "rlc", 1 => "rrc", 2 => "rl", 3 => "rr",
				4 => "sla", 5 => "sra", 6 => "sll", _ => "srl"
			},
			1 => "bit",
			2 => "res",
			_ => "set"
		};

		string operand = op == 0 ? regName : $"{bit},{regName}";
		return new DisassembledInstruction(baseAddress + offset, [0xcb, cb], mnemonic, operand);
	}

	private static DisassembledInstruction DisassembleZ80Index(byte[] data, int offset, int baseAddress, string indexReg) {
		byte op = data[offset + 1];

		// Simple IX/IY versions of HL instructions
		if (op == 0x21 && offset + 3 < data.Length) {  // LD IX,nn
			ushort val = (ushort)(data[offset + 2] | (data[offset + 3] << 8));
			return new DisassembledInstruction(
				baseAddress + offset,
				[data[offset], op, data[offset + 2], data[offset + 3]],
				"ld", $"{indexReg},${val:x4}");
		}

		// Default: show as prefix + opcode
		return new DisassembledInstruction(
			baseAddress + offset,
			[data[offset], op],
			".byte", $"${data[offset]:x2},${op:x2}", $"{indexReg} prefix");
	}

	private static DisassembledInstruction DisassembleZ80ED(byte[] data, int offset, int baseAddress) {
		byte ed = data[offset + 1];

		// Common ED instructions
		var edOps = new Dictionary<byte, (string m, int l, string o)> {
			[0x42] = ("sbc", 2, "hl,bc"), [0x52] = ("sbc", 2, "hl,de"),
			[0x62] = ("sbc", 2, "hl,hl"), [0x72] = ("sbc", 2, "hl,sp"),
			[0x4a] = ("adc", 2, "hl,bc"), [0x5a] = ("adc", 2, "hl,de"),
			[0x6a] = ("adc", 2, "hl,hl"), [0x7a] = ("adc", 2, "hl,sp"),
			[0x44] = ("neg", 2, ""), [0x45] = ("retn", 2, ""),
			[0x4d] = ("reti", 2, ""),
			[0xa0] = ("ldi", 2, ""), [0xa1] = ("cpi", 2, ""),
			[0xa8] = ("ldd", 2, ""), [0xa9] = ("cpd", 2, ""),
			[0xb0] = ("ldir", 2, ""), [0xb1] = ("cpir", 2, ""),
			[0xb8] = ("lddr", 2, ""), [0xb9] = ("cpdr", 2, ""),
		};

		if (edOps.TryGetValue(ed, out var info)) {
			return new DisassembledInstruction(
				baseAddress + offset,
				[0xed, ed],
				info.m, info.o);
		}

		return new DisassembledInstruction(
			baseAddress + offset,
			[0xed, ed],
			".byte", "$ed,$" + ed.ToString("x2"), "ED prefix");
	}

	private static string FormatZ80Operand(string mode, byte[] bytes, int addr) {
		return mode switch {
			"" => "",
			"imm8" when bytes.Length > 1 => $"${bytes[1]:x2}",
			"imm16" when bytes.Length > 2 => $"${(bytes[1] | (bytes[2] << 8)):x4}",
			"rel" when bytes.Length > 1 => $"${(addr + 2 + (sbyte)bytes[1]):x4}",
			"abs" when bytes.Length > 2 => $"(${(bytes[1] | (bytes[2] << 8)):x4})",
			_ => mode
		};
	}

	/// <summary>
	/// Disassemble SPC700 code.
	/// </summary>
	public static List<DisassembledInstruction> DisassembleSpc700(byte[] data, int offset, int length, int baseAddress = 0) {
		var instructions = new List<DisassembledInstruction>();
		int end = Math.Min(offset + length, data.Length);
		int pos = offset;

		while (pos < end) {
			var instr = DisassembleSpc700One(data, pos, baseAddress);
			instructions.Add(instr);
			pos += instr.Bytes.Length;
		}

		return instructions;
	}

	/// <summary>
	/// Disassemble a single SPC700 instruction.
	/// </summary>
	public static DisassembledInstruction DisassembleSpc700One(byte[] data, int offset, int baseAddress) {
		if (offset >= data.Length) {
			return new DisassembledInstruction(baseAddress + offset, [], ".byte", "??", "Beyond data");
		}

		byte opcode = data[offset];

		if (!Spc700Opcodes.TryGetValue(opcode, out var entry)) {
			return new DisassembledInstruction(baseAddress + offset, [opcode], ".byte", $"${opcode:x2}", "Unknown");
		}

		var (mnemonic, len, mode) = entry;
		var bytes = new byte[Math.Min(len, data.Length - offset)];
		Array.Copy(data, offset, bytes, 0, bytes.Length);

		string operand = FormatSpc700Operand(mode, bytes, baseAddress + offset);

		return new DisassembledInstruction(baseAddress + offset, bytes, mnemonic.ToLower(), operand);
	}

	private static string FormatSpc700Operand(string mode, byte[] bytes, int addr) {
		return mode switch {
			"" => "",
			"a" => "a",
			"x" => "x",
			"y" => "y",
			"sp" => "sp",
			"psw" => "psw",
			"imm" when bytes.Length > 1 => $"#${bytes[1]:x2}",
			"dp" when bytes.Length > 1 => $"${bytes[1]:x2}",
			"dpx" when bytes.Length > 1 => $"${bytes[1]:x2}+x",
			"dpy" when bytes.Length > 1 => $"${bytes[1]:x2}+y",
			"abs" when bytes.Length > 2 => $"${(bytes[1] | (bytes[2] << 8)):x4}",
			"rel" when bytes.Length > 1 => $"${(addr + 2 + (sbyte)bytes[1]):x4}",
			"ya" => "ya",
			_ => mode
		};
	}

	/// <summary>
	/// Disassemble ARM7 (GBA) Thumb code.
	/// </summary>
	public static List<DisassembledInstruction> DisassembleArm7Thumb(byte[] data, int offset, int length, int baseAddress = 0) {
		var instructions = new List<DisassembledInstruction>();
		int end = Math.Min(offset + length, data.Length);
		int pos = offset;

		while (pos < end - 1) {
			var instr = DisassembleArm7ThumbOne(data, pos, baseAddress);
			instructions.Add(instr);
			pos += 2;  // Thumb instructions are 16-bit
		}

		return instructions;
	}

	/// <summary>
	/// Disassemble a single ARM7 Thumb instruction.
	/// </summary>
	public static DisassembledInstruction DisassembleArm7ThumbOne(byte[] data, int offset, int baseAddress) {
		if (offset + 1 >= data.Length) {
			return new DisassembledInstruction(baseAddress + offset, [], ".hword", "????", "Beyond data");
		}

		ushort instr = (ushort)(data[offset] | (data[offset + 1] << 8));
		byte[] bytes = [data[offset], data[offset + 1]];

		// Decode Thumb instruction
		int op = (instr >> 13) & 0x7;
		string mnemonic, operand;

		switch (op) {
			case 0:  // Shift/Add/Subtract
				int subOp = (instr >> 11) & 0x3;
				int rd = instr & 0x7;
				int rs = (instr >> 3) & 0x7;
				int offset5 = (instr >> 6) & 0x1f;
				mnemonic = subOp switch { 0 => "lsl", 1 => "lsr", 2 => "asr", _ => "mov" };
				operand = $"r{rd},r{rs},#{offset5}";
				break;

			case 1:  // Add/subtract immediate
				rd = instr & 0x7;
				rs = (instr >> 3) & 0x7;
				int imm3 = (instr >> 6) & 0x7;
				bool isSub = ((instr >> 9) & 1) == 1;
				mnemonic = isSub ? "sub" : "add";
				operand = $"r{rd},r{rs},#{imm3}";
				break;

			case 2:  // Mov/Compare/Add/Sub immediate
				rd = (instr >> 8) & 0x7;
				int imm8 = instr & 0xff;
				subOp = (instr >> 11) & 0x3;
				mnemonic = subOp switch { 0 => "mov", 1 => "cmp", 2 => "add", _ => "sub" };
				operand = $"r{rd},#${imm8:x2}";
				break;

			case 3:  // Load/Store
				rd = instr & 0x7;
				rs = (instr >> 3) & 0x7;
				offset5 = (instr >> 6) & 0x1f;
				bool isLoad = ((instr >> 11) & 1) == 1;
				bool isByte = ((instr >> 12) & 1) == 1;
				mnemonic = (isLoad ? "ldr" : "str") + (isByte ? "b" : "");
				operand = $"r{rd},[r{rs},#{offset5 * (isByte ? 1 : 4)}]";
				break;

			case 4:  // Load/Store halfword or SP-relative
				rd = instr & 0x7;
				rs = (instr >> 3) & 0x7;
				offset5 = (instr >> 6) & 0x1f;
				isLoad = ((instr >> 11) & 1) == 1;
				mnemonic = isLoad ? "ldrh" : "strh";
				operand = $"r{rd},[r{rs},#{offset5 * 2}]";
				break;

			case 5:  // Branch/misc
				if (((instr >> 12) & 1) == 0) {
					// Load address
					rd = (instr >> 8) & 0x7;
					imm8 = instr & 0xff;
					bool useSP = ((instr >> 11) & 1) == 1;
					mnemonic = "add";
					operand = $"r{rd},{(useSP ? "sp" : "pc")},#${imm8 * 4:x}";
				} else {
					// Conditional branch
					int cond = (instr >> 8) & 0xf;
					int soff = (sbyte)(instr & 0xff);
					string[] condNames = ["eq", "ne", "cs", "cc", "mi", "pl", "vs", "vc", "hi", "ls", "ge", "lt", "gt", "le", "", ""];
					mnemonic = "b" + condNames[cond];
					operand = $"${(baseAddress + offset + 4 + soff * 2):x8}";
				}
				break;

			case 6:  // Push/Pop or branch
				if (((instr >> 12) & 1) == 0) {
					// Unconditional branch
					int soff11 = instr & 0x7ff;
					if ((soff11 & 0x400) != 0) soff11 |= unchecked((int)0xfffff800);
					mnemonic = "b";
					operand = $"${(baseAddress + offset + 4 + soff11 * 2):x8}";
				} else {
					// Push/Pop
					bool isPop = ((instr >> 11) & 1) == 1;
					bool hasLr = ((instr >> 8) & 1) == 1;
					int regList = instr & 0xff;
					mnemonic = isPop ? "pop" : "push";
					var regs = new List<string>();
					for (int i = 0; i < 8; i++) {
						if ((regList & (1 << i)) != 0) regs.Add($"r{i}");
					}
					if (hasLr) regs.Add(isPop ? "pc" : "lr");
					operand = "{" + string.Join(",", regs) + "}";
				}
				break;

			default:
				mnemonic = ".hword";
				operand = $"${instr:x4}";
				break;
		}

		return new DisassembledInstruction(baseAddress + offset, bytes, mnemonic, operand);
	}

	/// <summary>
	/// Detect functions in disassembled code.
	/// </summary>
	public static List<DetectedFunction> DetectFunctions(List<DisassembledInstruction> instructions, int baseAddress) {
		var functions = new List<DetectedFunction>();
		var callTargets = new Dictionary<int, List<int>>();
		var jumpTargets = new HashSet<int>();

		// First pass: find call targets and jump targets
		foreach (var instr in instructions) {
			string mnem = instr.Mnemonic.ToLower();
			if (mnem is "jsr" or "call" or "bl") {
				if (TryParseAddress(instr.Operand, out int target)) {
					if (!callTargets.ContainsKey(target))
						callTargets[target] = [];
					callTargets[target].Add(instr.Address);
				}
			} else if (mnem.StartsWith('j') || mnem.StartsWith('b')) {
				if (TryParseAddress(instr.Operand, out int target)) {
					jumpTargets.Add(target);
				}
			}
		}

		// Second pass: identify function boundaries
		DetectedFunction? currentFunc = null;
		var calls = new List<int>();

		foreach (var instr in instructions) {
			string mnem = instr.Mnemonic.ToLower();

			// Start of function (called from elsewhere or after previous function end)
			if (callTargets.ContainsKey(instr.Address) || currentFunc == null) {
				if (currentFunc != null) {
					functions.Add(currentFunc with {
						EndAddress = instr.Address - 1,
						Calls = new List<int>(calls),
						IsLeaf = calls.Count == 0
					});
				}

				string name = callTargets.ContainsKey(instr.Address)
					? $"sub_{instr.Address:x}"
					: $"func_{instr.Address:x}";

				currentFunc = new DetectedFunction(
					instr.Address,
					instr.Address,
					name,
					callTargets.TryGetValue(instr.Address, out var callers) ? callers : [],
					[],
					0,
					true
				);
				calls.Clear();
			}

			// Track calls made
			if (mnem is "jsr" or "call" or "bl") {
				if (TryParseAddress(instr.Operand, out int target)) {
					calls.Add(target);
				}
			}

			// End of function
			if (mnem is "rts" or "ret" or "rti" or "bx" && currentFunc != null) {
				functions.Add(currentFunc with {
					EndAddress = instr.Address,
					Calls = new List<int>(calls),
					IsLeaf = calls.Count == 0
				});
				currentFunc = null;
				calls.Clear();
			}
		}

		// Add final function if still open
		if (currentFunc != null && instructions.Count > 0) {
			functions.Add(currentFunc with {
				EndAddress = instructions[^1].Address,
				Calls = new List<int>(calls),
				IsLeaf = calls.Count == 0
			});
		}

		return functions;
	}

	private static bool TryParseAddress(string operand, out int address) {
		address = 0;
		operand = operand.Trim();
		if (operand.StartsWith('$')) operand = operand[1..];
		if (operand.StartsWith("0x", StringComparison.OrdinalIgnoreCase)) operand = operand[2..];
		return int.TryParse(operand, System.Globalization.NumberStyles.HexNumber, null, out address);
	}

	/// <summary>
	/// Detect local variables from stack operations.
	/// </summary>
	public static List<LocalVariable> DetectLocalVariables(List<DisassembledInstruction> instructions) {
		var variables = new List<LocalVariable>();
		var stackOffsets = new Dictionary<int, int>();  // offset -> size
		int varCount = 0;

		foreach (var instr in instructions) {
			string mnem = instr.Mnemonic.ToLower();
			string op = instr.Operand.ToLower();

			// Look for stack-relative addressing
			if (op.Contains("sp") || op.Contains("s,") || op.Contains(",s")) {
				// Try to extract offset
				var match = System.Text.RegularExpressions.Regex.Match(op, @"\$?([0-9a-f]+)");
				if (match.Success && int.TryParse(match.Groups[1].Value, System.Globalization.NumberStyles.HexNumber, null, out int offset)) {
					if (!stackOffsets.ContainsKey(offset)) {
						int size = mnem switch {
							"lda" or "sta" or "ldb" or "stb" => 1,
							"ldx" or "stx" or "ldy" or "sty" => 2,
							"ldr" or "str" => 4,
							"ldrh" or "strh" => 2,
							"ldrb" or "strb" => 1,
							_ => 2
						};
						stackOffsets[offset] = size;
					}
				}
			}
		}

		// Convert to LocalVariable records
		foreach (var kvp in stackOffsets.OrderBy(x => x.Key)) {
			variables.Add(new LocalVariable(
				$"local_{varCount++}",
				kvp.Key,
				kvp.Value,
				kvp.Value switch { 1 => "byte", 2 => "word", 4 => "dword", _ => null }
			));
		}

		return variables;
	}

	/// <summary>
	/// Create basic Z80 opcode table.
	/// </summary>
	private static Dictionary<byte, (string, int, string)> CreateZ80Table() {
		var table = new Dictionary<byte, (string, int, string)> {
			[0x00] = ("nop", 1, ""),
			[0x01] = ("ld", 3, "bc,imm16"), [0x11] = ("ld", 3, "de,imm16"),
			[0x21] = ("ld", 3, "hl,imm16"), [0x31] = ("ld", 3, "sp,imm16"),
			[0x02] = ("ld", 1, "(bc),a"), [0x12] = ("ld", 1, "(de),a"),
			[0x0a] = ("ld", 1, "a,(bc)"), [0x1a] = ("ld", 1, "a,(de)"),
			[0x22] = ("ld", 3, "abs"), [0x32] = ("ld", 3, "abs"),
			[0x2a] = ("ld", 3, "abs"), [0x3a] = ("ld", 3, "abs"),
			[0x03] = ("inc", 1, "bc"), [0x13] = ("inc", 1, "de"),
			[0x23] = ("inc", 1, "hl"), [0x33] = ("inc", 1, "sp"),
			[0x0b] = ("dec", 1, "bc"), [0x1b] = ("dec", 1, "de"),
			[0x2b] = ("dec", 1, "hl"), [0x3b] = ("dec", 1, "sp"),
			[0x04] = ("inc", 1, "b"), [0x0c] = ("inc", 1, "c"),
			[0x14] = ("inc", 1, "d"), [0x1c] = ("inc", 1, "e"),
			[0x24] = ("inc", 1, "h"), [0x2c] = ("inc", 1, "l"),
			[0x34] = ("inc", 1, "(hl)"), [0x3c] = ("inc", 1, "a"),
			[0x05] = ("dec", 1, "b"), [0x0d] = ("dec", 1, "c"),
			[0x15] = ("dec", 1, "d"), [0x1d] = ("dec", 1, "e"),
			[0x25] = ("dec", 1, "h"), [0x2d] = ("dec", 1, "l"),
			[0x35] = ("dec", 1, "(hl)"), [0x3d] = ("dec", 1, "a"),
			[0x06] = ("ld", 2, "b,imm8"), [0x0e] = ("ld", 2, "c,imm8"),
			[0x16] = ("ld", 2, "d,imm8"), [0x1e] = ("ld", 2, "e,imm8"),
			[0x26] = ("ld", 2, "h,imm8"), [0x2e] = ("ld", 2, "l,imm8"),
			[0x36] = ("ld", 2, "(hl),imm8"), [0x3e] = ("ld", 2, "a,imm8"),
			[0x07] = ("rlca", 1, ""), [0x0f] = ("rrca", 1, ""),
			[0x17] = ("rla", 1, ""), [0x1f] = ("rra", 1, ""),
			[0x27] = ("daa", 1, ""), [0x2f] = ("cpl", 1, ""),
			[0x37] = ("scf", 1, ""), [0x3f] = ("ccf", 1, ""),
			[0x76] = ("halt", 1, ""),
			[0xc3] = ("jp", 3, "imm16"), [0xc9] = ("ret", 1, ""),
			[0xcd] = ("call", 3, "imm16"),
			[0x18] = ("jr", 2, "rel"), [0x20] = ("jr", 2, "nz,rel"),
			[0x28] = ("jr", 2, "z,rel"), [0x30] = ("jr", 2, "nc,rel"),
			[0x38] = ("jr", 2, "c,rel"),
			[0xc0] = ("ret", 1, "nz"), [0xc8] = ("ret", 1, "z"),
			[0xd0] = ("ret", 1, "nc"), [0xd8] = ("ret", 1, "c"),
			[0xc2] = ("jp", 3, "nz,imm16"), [0xca] = ("jp", 3, "z,imm16"),
			[0xd2] = ("jp", 3, "nc,imm16"), [0xda] = ("jp", 3, "c,imm16"),
			[0xc4] = ("call", 3, "nz,imm16"), [0xcc] = ("call", 3, "z,imm16"),
			[0xd4] = ("call", 3, "nc,imm16"), [0xdc] = ("call", 3, "c,imm16"),
			[0xe9] = ("jp", 1, "(hl)"),
			[0xf3] = ("di", 1, ""), [0xfb] = ("ei", 1, ""),
			[0xc7] = ("rst", 1, "$00"), [0xcf] = ("rst", 1, "$08"),
			[0xd7] = ("rst", 1, "$10"), [0xdf] = ("rst", 1, "$18"),
			[0xe7] = ("rst", 1, "$20"), [0xef] = ("rst", 1, "$28"),
			[0xf7] = ("rst", 1, "$30"), [0xff] = ("rst", 1, "$38"),
			[0xc6] = ("add", 2, "a,imm8"), [0xce] = ("adc", 2, "a,imm8"),
			[0xd6] = ("sub", 2, "imm8"), [0xde] = ("sbc", 2, "a,imm8"),
			[0xe6] = ("and", 2, "imm8"), [0xee] = ("xor", 2, "imm8"),
			[0xf6] = ("or", 2, "imm8"), [0xfe] = ("cp", 2, "imm8"),
			[0xc5] = ("push", 1, "bc"), [0xd5] = ("push", 1, "de"),
			[0xe5] = ("push", 1, "hl"), [0xf5] = ("push", 1, "af"),
			[0xc1] = ("pop", 1, "bc"), [0xd1] = ("pop", 1, "de"),
			[0xe1] = ("pop", 1, "hl"), [0xf1] = ("pop", 1, "af"),
		};

		// Add LD r,r' instructions (0x40-0x7F except HALT)
		string[] regs = ["b", "c", "d", "e", "h", "l", "(hl)", "a"];
		for (int dst = 0; dst < 8; dst++) {
			for (int src = 0; src < 8; src++) {
				byte op = (byte)(0x40 | (dst << 3) | src);
				if (op != 0x76) {  // Not HALT
					table[op] = ("ld", 1, $"{regs[dst]},{regs[src]}");
				}
			}
		}

		// Add ALU instructions (0x80-0xBF)
		string[] aluOps = ["add", "adc", "sub", "sbc", "and", "xor", "or", "cp"];
		for (int aluOp = 0; aluOp < 8; aluOp++) {
			for (int src = 0; src < 8; src++) {
				byte op = (byte)(0x80 | (aluOp << 3) | src);
				string oper = aluOp < 2 ? $"a,{regs[src]}" : regs[src];
				table[op] = (aluOps[aluOp], 1, oper);
			}
		}

		return table;
	}

	/// <summary>
	/// Create basic SPC700 opcode table.
	/// </summary>
	private static Dictionary<byte, (string, int, string)> CreateSpc700Table() {
		return new Dictionary<byte, (string, int, string)> {
			[0x00] = ("nop", 1, ""),
			[0x01] = ("tcall", 1, "0"), [0x11] = ("tcall", 1, "1"),
			[0x21] = ("tcall", 1, "2"), [0x31] = ("tcall", 1, "3"),
			[0x41] = ("tcall", 1, "4"), [0x51] = ("tcall", 1, "5"),
			[0x61] = ("tcall", 1, "6"), [0x71] = ("tcall", 1, "7"),
			[0x81] = ("tcall", 1, "8"), [0x91] = ("tcall", 1, "9"),
			[0xa1] = ("tcall", 1, "10"), [0xb1] = ("tcall", 1, "11"),
			[0xc1] = ("tcall", 1, "12"), [0xd1] = ("tcall", 1, "13"),
			[0xe1] = ("tcall", 1, "14"), [0xf1] = ("tcall", 1, "15"),
			[0x02] = ("set1", 2, "dp.0"), [0x22] = ("set1", 2, "dp.1"),
			[0x42] = ("set1", 2, "dp.2"), [0x62] = ("set1", 2, "dp.3"),
			[0x82] = ("set1", 2, "dp.4"), [0xa2] = ("set1", 2, "dp.5"),
			[0xc2] = ("set1", 2, "dp.6"), [0xe2] = ("set1", 2, "dp.7"),
			[0x12] = ("clr1", 2, "dp.0"), [0x32] = ("clr1", 2, "dp.1"),
			[0x52] = ("clr1", 2, "dp.2"), [0x72] = ("clr1", 2, "dp.3"),
			[0x92] = ("clr1", 2, "dp.4"), [0xb2] = ("clr1", 2, "dp.5"),
			[0xd2] = ("clr1", 2, "dp.6"), [0xf2] = ("clr1", 2, "dp.7"),
			[0x03] = ("bbs", 3, "dp.0,rel"), [0x23] = ("bbs", 3, "dp.1,rel"),
			[0x43] = ("bbs", 3, "dp.2,rel"), [0x63] = ("bbs", 3, "dp.3,rel"),
			[0x83] = ("bbs", 3, "dp.4,rel"), [0xa3] = ("bbs", 3, "dp.5,rel"),
			[0xc3] = ("bbs", 3, "dp.6,rel"), [0xe3] = ("bbs", 3, "dp.7,rel"),
			[0x13] = ("bbc", 3, "dp.0,rel"), [0x33] = ("bbc", 3, "dp.1,rel"),
			[0x53] = ("bbc", 3, "dp.2,rel"), [0x73] = ("bbc", 3, "dp.3,rel"),
			[0x93] = ("bbc", 3, "dp.4,rel"), [0xb3] = ("bbc", 3, "dp.5,rel"),
			[0xd3] = ("bbc", 3, "dp.6,rel"), [0xf3] = ("bbc", 3, "dp.7,rel"),
			[0x04] = ("or", 2, "a,dp"), [0x05] = ("or", 3, "a,abs"),
			[0x06] = ("or", 1, "a,(x)"), [0x07] = ("or", 2, "a,[dp+x]"),
			[0x08] = ("or", 2, "a,imm"), [0x09] = ("or", 3, "dp,dp"),
			[0x14] = ("or", 2, "a,dpx"), [0x15] = ("or", 3, "a,abx"),
			[0x16] = ("or", 3, "a,aby"), [0x17] = ("or", 2, "a,[dp]+y"),
			[0x18] = ("or", 3, "dp,imm"), [0x19] = ("or", 1, "(x),(y)"),
			[0x24] = ("and", 2, "a,dp"), [0x25] = ("and", 3, "a,abs"),
			[0x26] = ("and", 1, "a,(x)"), [0x27] = ("and", 2, "a,[dp+x]"),
			[0x28] = ("and", 2, "a,imm"), [0x29] = ("and", 3, "dp,dp"),
			[0x34] = ("and", 2, "a,dpx"), [0x35] = ("and", 3, "a,abx"),
			[0x36] = ("and", 3, "a,aby"), [0x37] = ("and", 2, "a,[dp]+y"),
			[0x38] = ("and", 3, "dp,imm"), [0x39] = ("and", 1, "(x),(y)"),
			[0x44] = ("eor", 2, "a,dp"), [0x45] = ("eor", 3, "a,abs"),
			[0x46] = ("eor", 1, "a,(x)"), [0x47] = ("eor", 2, "a,[dp+x]"),
			[0x48] = ("eor", 2, "a,imm"), [0x49] = ("eor", 3, "dp,dp"),
			[0x54] = ("eor", 2, "a,dpx"), [0x55] = ("eor", 3, "a,abx"),
			[0x56] = ("eor", 3, "a,aby"), [0x57] = ("eor", 2, "a,[dp]+y"),
			[0x58] = ("eor", 3, "dp,imm"), [0x59] = ("eor", 1, "(x),(y)"),
			[0x64] = ("cmp", 2, "a,dp"), [0x65] = ("cmp", 3, "a,abs"),
			[0x66] = ("cmp", 1, "a,(x)"), [0x67] = ("cmp", 2, "a,[dp+x]"),
			[0x68] = ("cmp", 2, "a,imm"), [0x69] = ("cmp", 3, "dp,dp"),
			[0x74] = ("cmp", 2, "a,dpx"), [0x75] = ("cmp", 3, "a,abx"),
			[0x76] = ("cmp", 3, "a,aby"), [0x77] = ("cmp", 2, "a,[dp]+y"),
			[0x78] = ("cmp", 3, "dp,imm"), [0x79] = ("cmp", 1, "(x),(y)"),
			[0x84] = ("adc", 2, "a,dp"), [0x85] = ("adc", 3, "a,abs"),
			[0x86] = ("adc", 1, "a,(x)"), [0x87] = ("adc", 2, "a,[dp+x]"),
			[0x88] = ("adc", 2, "a,imm"), [0x89] = ("adc", 3, "dp,dp"),
			[0x94] = ("adc", 2, "a,dpx"), [0x95] = ("adc", 3, "a,abx"),
			[0x96] = ("adc", 3, "a,aby"), [0x97] = ("adc", 2, "a,[dp]+y"),
			[0x98] = ("adc", 3, "dp,imm"), [0x99] = ("adc", 1, "(x),(y)"),
			[0xa4] = ("sbc", 2, "a,dp"), [0xa5] = ("sbc", 3, "a,abs"),
			[0xa6] = ("sbc", 1, "a,(x)"), [0xa7] = ("sbc", 2, "a,[dp+x]"),
			[0xa8] = ("sbc", 2, "a,imm"), [0xa9] = ("sbc", 3, "dp,dp"),
			[0xb4] = ("sbc", 2, "a,dpx"), [0xb5] = ("sbc", 3, "a,abx"),
			[0xb6] = ("sbc", 3, "a,aby"), [0xb7] = ("sbc", 2, "a,[dp]+y"),
			[0xb8] = ("sbc", 3, "dp,imm"), [0xb9] = ("sbc", 1, "(x),(y)"),
			[0xe4] = ("mov", 2, "a,dp"), [0xe5] = ("mov", 3, "a,abs"),
			[0xe6] = ("mov", 1, "a,(x)"), [0xe7] = ("mov", 2, "a,[dp+x]"),
			[0xe8] = ("mov", 2, "a,imm"), [0xe9] = ("mov", 3, "x,abs"),
			[0xf4] = ("mov", 2, "a,dpx"), [0xf5] = ("mov", 3, "a,abx"),
			[0xf6] = ("mov", 3, "a,aby"), [0xf7] = ("mov", 2, "a,[dp]+y"),
			[0xf8] = ("mov", 2, "x,dp"), [0xf9] = ("mov", 2, "x,dpy"),
			[0xc4] = ("mov", 2, "dp,a"), [0xc5] = ("mov", 3, "abs,a"),
			[0xc6] = ("mov", 1, "(x),a"), [0xc7] = ("mov", 2, "[dp+x],a"),
			[0xd4] = ("mov", 2, "dpx,a"), [0xd5] = ("mov", 3, "abx,a"),
			[0xd6] = ("mov", 3, "aby,a"), [0xd7] = ("mov", 2, "[dp]+y,a"),
			[0xd8] = ("mov", 2, "dp,x"), [0xd9] = ("mov", 2, "dpy,x"),
			[0xcd] = ("mov", 2, "x,imm"), [0x8d] = ("mov", 2, "y,imm"),
			[0xeb] = ("mov", 2, "y,dp"), [0xec] = ("mov", 3, "y,abs"),
			[0xfb] = ("mov", 2, "y,dpx"), [0xcb] = ("mov", 2, "dp,y"),
			[0xcc] = ("mov", 3, "abs,y"), [0xdb] = ("mov", 2, "dpx,y"),
			[0xba] = ("movw", 2, "ya,dp"), [0xda] = ("movw", 2, "dp,ya"),
			[0x2d] = ("push", 1, "a"), [0x4d] = ("push", 1, "x"),
			[0x6d] = ("push", 1, "y"), [0x0d] = ("push", 1, "psw"),
			[0xae] = ("pop", 1, "a"), [0xce] = ("pop", 1, "x"),
			[0xee] = ("pop", 1, "y"), [0x8e] = ("pop", 1, "psw"),
			[0x2f] = ("bra", 2, "rel"), [0x10] = ("bpl", 2, "rel"),
			[0x30] = ("bmi", 2, "rel"), [0x50] = ("bvc", 2, "rel"),
			[0x70] = ("bvs", 2, "rel"), [0x90] = ("bcc", 2, "rel"),
			[0xb0] = ("bcs", 2, "rel"), [0xd0] = ("bne", 2, "rel"),
			[0xf0] = ("beq", 2, "rel"),
			[0x3f] = ("call", 3, "abs"), [0x6f] = ("ret", 1, ""),
			[0x7f] = ("reti", 1, ""),
			[0x0a] = ("or1", 3, "c,m.b"), [0x2a] = ("or1", 3, "c,/m.b"),
			[0x4a] = ("and1", 3, "c,m.b"), [0x6a] = ("and1", 3, "c,/m.b"),
			[0x8a] = ("eor1", 3, "c,m.b"), [0xaa] = ("mov1", 3, "c,m.b"),
			[0xca] = ("mov1", 3, "m.b,c"),
			[0x20] = ("clrp", 1, ""), [0x40] = ("setp", 1, ""),
			[0x60] = ("clrc", 1, ""), [0x80] = ("setc", 1, ""),
			[0xa0] = ("ei", 1, ""), [0xc0] = ("di", 1, ""),
			[0xe0] = ("clrv", 1, ""), [0xed] = ("notc", 1, ""),
			[0xef] = ("sleep", 1, ""), [0xff] = ("stop", 1, ""),
		};
	}

	#endregion
}
