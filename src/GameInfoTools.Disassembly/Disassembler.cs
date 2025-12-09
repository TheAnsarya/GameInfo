using System.Text;
using GameInfoTools.Core;

namespace GameInfoTools.Disassembly;

/// <summary>
/// 6502/65816 disassembler.
/// </summary>
public class Disassembler
{
	/// <summary>
	/// CPU mode.
	/// </summary>
	public enum CpuMode
	{
		Cpu6502,    // NES, C64, etc.
		Cpu65C02,   // Apple IIc, etc.
		Cpu65816,   // SNES
	}

	/// <summary>
	/// Disassembly options.
	/// </summary>
	public class Options
	{
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

	public Disassembler(byte[] data, Options? options = null)
	{
		_data = data;
		_options = options ?? new Options();
	}

	/// <summary>
	/// Disassemble a range of bytes.
	/// </summary>
	public List<DisassembledInstruction> Disassemble(int offset, int length)
	{
		var instructions = new List<DisassembledInstruction>();
		int end = offset + length;
		int pos = offset;

		while (pos < end && pos < _data.Length)
		{
			var instr = DisassembleOne(pos);
			instructions.Add(instr);
			pos += instr.Bytes.Length;
		}

		return instructions;
	}

	/// <summary>
	/// Disassemble a single instruction.
	/// </summary>
	public DisassembledInstruction DisassembleOne(int offset)
	{
		if (offset >= _data.Length)
		{
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
		if (string.IsNullOrEmpty(mnemonic))
		{
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
		for (int i = 0; i < length && offset + i < _data.Length; i++)
		{
			bytes[i] = _data[offset + i];
		}

		// Format operand based on addressing mode
		string operand = FormatOperand(mode, bytes, _options.BaseAddress + offset);

		// Check for symbol
		string? comment = null;
		if (_options.Symbols != null)
		{
			int targetAddr = GetTargetAddress(mode, bytes, _options.BaseAddress + offset);
			if (targetAddr >= 0)
			{
				var symbol = _options.Symbols.GetSymbol(targetAddr);
				if (symbol != null && operand.Contains(FormatWord((ushort)targetAddr)))
				{
					operand = operand.Replace(FormatWord((ushort)targetAddr), symbol);
				}
				else if (symbol != null)
				{
					comment = symbol;
				}
			}
		}

		// Apply case preference
		if (_options.LowercaseMnemonics)
		{
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

	private string FormatOperand(string mode, byte[] bytes, int instrAddr)
	{
		if (bytes.Length < 1)
		{
			return "";
		}

		return mode switch
		{
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

	private int GetTargetAddress(string mode, byte[] bytes, int instrAddr)
	{
		return mode switch
		{
			"abs" or "abx" or "aby" or "ind" when bytes.Length >= 3 => bytes[1] | (bytes[2] << 8),
			"zp" or "zpx" or "zpy" or "inx" or "iny" when bytes.Length >= 2 => bytes[1],
			"rel" when bytes.Length >= 2 => instrAddr + 2 + (sbyte)bytes[1],
			_ => -1
		};
	}

	private string FormatRelative(byte offset, int instrAddr)
	{
		int target = instrAddr + 2 + (sbyte)offset;
		return $"${FormatWord((ushort)target)}";
	}

	private string FormatByte(byte b)
	{
		return _options.LowercaseHex ? $"{b:x2}" : $"{b:X2}";
	}

	private string FormatWord(byte lo, byte hi)
	{
		int word = lo | (hi << 8);
		return FormatWord((ushort)word);
	}

	private string FormatWord(ushort w)
	{
		return _options.LowercaseHex ? $"{w:x4}" : $"{w:X4}";
	}

	/// <summary>
	/// Format disassembly as text.
	/// </summary>
	public string FormatAsText(List<DisassembledInstruction> instructions)
	{
		var sb = new StringBuilder();

		foreach (var instr in instructions)
		{
			// Address
			if (_options.ShowAddresses)
			{
				sb.Append($"${FormatWord((ushort)instr.Address)}:  ");
			}

			// Bytes
			if (_options.ShowBytes)
			{
				var bytesStr = string.Join(" ", instr.Bytes.Select(b => FormatByte(b)));
				sb.Append($"{bytesStr,-9} ");
			}

			// Mnemonic and operand
			sb.Append($"{instr.Mnemonic,-4} {instr.Operand}");

			// Comment
			if (!string.IsNullOrEmpty(instr.Comment))
			{
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
	public string GenerateAsmSource(int offset, int length, string? label = null)
	{
		var sb = new StringBuilder();
		var instructions = Disassemble(offset, length);

		// Header
		sb.AppendLine($"; Disassembly of ${_options.BaseAddress + offset:x4}-${_options.BaseAddress + offset + length - 1:x4}");
		sb.AppendLine($"; Generated by GameInfoTools Disassembler");
		sb.AppendLine();

		if (!string.IsNullOrEmpty(label))
		{
			sb.AppendLine($"{label}:");
		}

		// Instructions
		foreach (var instr in instructions)
		{
			// Check for label at this address
			var symbol = _options.Symbols?.GetSymbol(instr.Address);
			if (!string.IsNullOrEmpty(symbol))
			{
				sb.AppendLine($"{symbol}:");
			}

			// Instruction
			sb.Append('\t');
			sb.Append($"{instr.Mnemonic,-4}");

			if (!string.IsNullOrEmpty(instr.Operand))
			{
				sb.Append($" {instr.Operand}");
			}

			// Comment with bytes
			if (_options.ShowBytes)
			{
				var bytesStr = string.Join(" ", instr.Bytes.Select(b => FormatByte(b)));
				sb.Append($"\t\t; ${instr.Address:x4}: {bytesStr}");
			}

			if (!string.IsNullOrEmpty(instr.Comment))
			{
				sb.Append($" - {instr.Comment}");
			}

			sb.AppendLine();
		}

		return sb.ToString();
	}

	private static (string Mnemonic, int Length, string Mode)[] CreateOpcodeTable()
	{
		var table = new (string, int, string)[256];

		// Initialize all as unknown
		for (int i = 0; i < 256; i++)
		{
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
}
