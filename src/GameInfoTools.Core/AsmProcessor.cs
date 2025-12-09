using System.Text;
using System.Text.RegularExpressions;

namespace GameInfoTools.Core;

/// <summary>
/// Assembly source code formatter and processor.
/// </summary>
public static class AsmFormatter
{
	/// <summary>
	/// Formatting options for assembly output.
	/// </summary>
	public class FormatOptions
	{
		public int LabelColumn { get; set; } = 0;
		public int OpcodeColumn { get; set; } = 16;
		public int OperandColumn { get; set; } = 24;
		public int CommentColumn { get; set; } = 48;
		public bool UseUppercaseOpcodes { get; set; } = false;
		public bool UseUppercaseHex { get; set; } = false;
		public string CommentPrefix { get; set; } = ";";
		public bool AlignComments { get; set; } = true;
		public bool PreserveBlankLines { get; set; } = true;
		public int TabWidth { get; set; } = 4;
		public bool UseTabs { get; set; } = true;
	}

	/// <summary>
	/// Format a single assembly line.
	/// </summary>
	public static string FormatLine(string line, FormatOptions options)
	{
		if (string.IsNullOrWhiteSpace(line))
		{
			return options.PreserveBlankLines ? "" : null!;
		}

		// Pure comment line
		if (line.TrimStart().StartsWith(options.CommentPrefix) || line.TrimStart().StartsWith("*"))
		{
			return line.TrimEnd();
		}

		// Parse the line
		var (label, opcode, operand, comment) = ParseAsmLine(line, options.CommentPrefix);

		// Apply case transformations
		if (options.UseUppercaseOpcodes && !string.IsNullOrEmpty(opcode))
		{
			opcode = opcode.ToUpperInvariant();
		}
		else if (!options.UseUppercaseOpcodes && !string.IsNullOrEmpty(opcode))
		{
			opcode = opcode.ToLowerInvariant();
		}

		// Build formatted line
		var sb = new StringBuilder();

		// Label
		if (!string.IsNullOrEmpty(label))
		{
			sb.Append(label);
			if (label.EndsWith(':'))
			{
				// Label only line
				if (string.IsNullOrEmpty(opcode) && string.IsNullOrEmpty(comment))
				{
					return sb.ToString();
				}
				sb.AppendLine();
			}
		}

		// Opcode
		if (!string.IsNullOrEmpty(opcode))
		{
			PadToColumn(sb, options.OpcodeColumn, options);
			sb.Append(opcode);
		}

		// Operand
		if (!string.IsNullOrEmpty(operand))
		{
			PadToColumn(sb, options.OperandColumn, options);
			sb.Append(operand);
		}

		// Comment
		if (!string.IsNullOrEmpty(comment))
		{
			if (options.AlignComments)
			{
				PadToColumn(sb, options.CommentColumn, options);
			}
			else
			{
				sb.Append(' ');
			}
			if (!comment.StartsWith(options.CommentPrefix))
			{
				sb.Append(options.CommentPrefix);
				sb.Append(' ');
			}
			sb.Append(comment.TrimStart(';', ' '));
		}

		return sb.ToString().TrimEnd();
	}

	private static void PadToColumn(StringBuilder sb, int column, FormatOptions options)
	{
		int currentPos = GetVisualPosition(sb.ToString(), options.TabWidth);

		if (options.UseTabs)
		{
			while (currentPos < column)
			{
				sb.Append('\t');
				currentPos = ((currentPos / options.TabWidth) + 1) * options.TabWidth;
			}
		}
		else
		{
			while (sb.Length < column)
			{
				sb.Append(' ');
			}
		}
	}

	private static int GetVisualPosition(string text, int tabWidth)
	{
		int pos = 0;
		foreach (char c in text)
		{
			if (c == '\t')
			{
				pos = ((pos / tabWidth) + 1) * tabWidth;
			}
			else
			{
				pos++;
			}
		}
		return pos;
	}

	private static (string Label, string Opcode, string Operand, string Comment) ParseAsmLine(string line, string commentPrefix)
	{
		string label = "";
		string opcode = "";
		string operand = "";
		string comment = "";

		// Extract comment
		int commentIdx = line.IndexOf(commentPrefix);
		if (commentIdx >= 0)
		{
			comment = line[commentIdx..].Trim();
			line = line[..commentIdx];
		}

		line = line.TrimEnd();
		if (string.IsNullOrEmpty(line))
		{
			return (label, opcode, operand, comment);
		}

		// Check for label (starts at column 0, not whitespace)
		if (!char.IsWhiteSpace(line[0]))
		{
			// Find end of label
			int labelEnd = 0;
			while (labelEnd < line.Length && !char.IsWhiteSpace(line[labelEnd]) && line[labelEnd] != ':')
			{
				labelEnd++;
			}
			if (labelEnd < line.Length && line[labelEnd] == ':')
			{
				labelEnd++;
			}
			label = line[..labelEnd];
			line = line[labelEnd..].TrimStart();
		}
		else
		{
			line = line.TrimStart();
		}

		if (string.IsNullOrEmpty(line))
		{
			return (label, opcode, operand, comment);
		}

		// Extract opcode
		int opcodeEnd = 0;
		while (opcodeEnd < line.Length && !char.IsWhiteSpace(line[opcodeEnd]))
		{
			opcodeEnd++;
		}
		opcode = line[..opcodeEnd];
		operand = line[opcodeEnd..].Trim();

		return (label, opcode, operand, comment);
	}

	/// <summary>
	/// Format an entire assembly file.
	/// </summary>
	public static string FormatFile(string content, FormatOptions? options = null)
	{
		options ??= new FormatOptions();
		var lines = content.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
		var formatted = new List<string>();

		foreach (var line in lines)
		{
			var result = FormatLine(line, options);
			if (result != null)
			{
				formatted.Add(result);
			}
		}

		return string.Join(Environment.NewLine, formatted);
	}

	/// <summary>
	/// Validate assembly syntax (basic checks).
	/// </summary>
	public static List<(int Line, string Message)> ValidateSyntax(string content)
	{
		var errors = new List<(int Line, string Message)>();
		var lines = content.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);

		// Known 6502/65816 opcodes
		var validOpcodes = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
		{
			// 6502
			"adc", "and", "asl", "bcc", "bcs", "beq", "bit", "bmi", "bne", "bpl",
			"brk", "bvc", "bvs", "clc", "cld", "cli", "clv", "cmp", "cpx", "cpy",
			"dec", "dex", "dey", "eor", "inc", "inx", "iny", "jmp", "jsr", "lda",
			"ldx", "ldy", "lsr", "nop", "ora", "pha", "php", "pla", "plp", "rol",
			"ror", "rti", "rts", "sbc", "sec", "sed", "sei", "sta", "stx", "sty",
			"tax", "tay", "tsx", "txa", "txs", "tya",
			// 65816
			"bra", "brl", "cop", "jml", "jsl", "mvn", "mvp", "pea", "pei", "per",
			"phb", "phd", "phk", "phx", "phy", "plb", "pld", "plx", "ply", "rep",
			"rtl", "sep", "stp", "stz", "tcd", "tcs", "tdc", "trb", "tsb", "tsc",
			"txy", "tyx", "wai", "wdm", "xba", "xce",
			// Assembler directives
			".org", ".byte", ".db", ".word", ".dw", ".text", ".include", ".incbin",
			".macro", ".endm", ".if", ".else", ".endif", ".equ", ".define", ".segment",
			".proc", ".endproc", ".scope", ".endscope", ".res", ".ds", ".align",
		};

		for (int i = 0; i < lines.Length; i++)
		{
			var line = lines[i].Trim();
			if (string.IsNullOrEmpty(line) || line.StartsWith(";") || line.StartsWith("*"))
			{
				continue;
			}

			var (label, opcode, operand, _) = ParseAsmLine(lines[i], ";");

			// Check for valid opcode
			if (!string.IsNullOrEmpty(opcode) && !validOpcodes.Contains(opcode) && !opcode.StartsWith("."))
			{
				// Could be a label reference or custom directive
				if (!label.EndsWith(':') && !string.IsNullOrEmpty(label))
				{
					continue; // Might be a label-only line
				}
			}

			// Check for unclosed quotes
			int quoteCount = operand.Count(c => c == '"');
			if (quoteCount % 2 != 0)
			{
				errors.Add((i + 1, "Unclosed string literal"));
			}

			// Check for balanced parentheses
			int parenBalance = operand.Count(c => c == '(') - operand.Count(c => c == ')');
			if (parenBalance != 0)
			{
				errors.Add((i + 1, "Unbalanced parentheses"));
			}
		}

		return errors;
	}
}

/// <summary>
/// Symbol table management for assembly/disassembly.
/// </summary>
public class SymbolTable
{
	private readonly Dictionary<int, string> _addressToSymbol = new();
	private readonly Dictionary<string, int> _symbolToAddress = new(StringComparer.OrdinalIgnoreCase);
	private readonly Dictionary<string, string> _comments = new(StringComparer.OrdinalIgnoreCase);
	private readonly Dictionary<string, SymbolType> _symbolTypes = new(StringComparer.OrdinalIgnoreCase);

	public enum SymbolType
	{
		Unknown,
		Code,
		Data,
		Ram,
		Constant,
		Label,
		Subroutine,
		Table,
		Pointer,
	}

	/// <summary>
	/// Add or update a symbol.
	/// </summary>
	public void AddSymbol(string name, int address, SymbolType type = SymbolType.Unknown, string? comment = null)
	{
		_addressToSymbol[address] = name;
		_symbolToAddress[name] = address;
		_symbolTypes[name] = type;
		if (!string.IsNullOrEmpty(comment))
		{
			_comments[name] = comment;
		}
	}

	/// <summary>
	/// Get symbol by address.
	/// </summary>
	public string? GetSymbol(int address)
	{
		return _addressToSymbol.TryGetValue(address, out var name) ? name : null;
	}

	/// <summary>
	/// Get address by symbol name.
	/// </summary>
	public int? GetAddress(string name)
	{
		return _symbolToAddress.TryGetValue(name, out var addr) ? addr : null;
	}

	/// <summary>
	/// Get comment for a symbol.
	/// </summary>
	public string? GetComment(string name)
	{
		return _comments.TryGetValue(name, out var comment) ? comment : null;
	}

	/// <summary>
	/// Get type of a symbol.
	/// </summary>
	public SymbolType GetSymbolType(string name)
	{
		return _symbolTypes.TryGetValue(name, out var type) ? type : SymbolType.Unknown;
	}

	/// <summary>
	/// Check if address has a symbol.
	/// </summary>
	public bool HasSymbol(int address) => _addressToSymbol.ContainsKey(address);

	/// <summary>
	/// Get all symbols.
	/// </summary>
	public IEnumerable<(string Name, int Address, SymbolType Type)> GetAllSymbols()
	{
		foreach (var kvp in _symbolToAddress)
		{
			yield return (kvp.Key, kvp.Value, GetSymbolType(kvp.Key));
		}
	}

	/// <summary>
	/// Get symbols in an address range.
	/// </summary>
	public IEnumerable<(string Name, int Address)> GetSymbolsInRange(int start, int end)
	{
		return _addressToSymbol
			.Where(kvp => kvp.Key >= start && kvp.Key < end)
			.OrderBy(kvp => kvp.Key)
			.Select(kvp => (kvp.Value, kvp.Key));
	}

	/// <summary>
	/// Load symbols from MLB (Mesen Label) file.
	/// </summary>
	public void LoadMlb(string content)
	{
		var lines = content.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.RemoveEmptyEntries);

		foreach (var line in lines)
		{
			if (string.IsNullOrWhiteSpace(line) || line.StartsWith("#"))
			{
				continue;
			}

			// Format: TYPE:ADDRESS:NAME:COMMENT
			var parts = line.Split(':', 4);
			if (parts.Length >= 3)
			{
				var typeStr = parts[0].Trim();
				if (int.TryParse(parts[1], System.Globalization.NumberStyles.HexNumber, null, out int address))
				{
					var name = parts[2].Trim();
					var comment = parts.Length >= 4 ? parts[3].Trim() : "";

					var symbolType = typeStr.ToUpperInvariant() switch
					{
						"G" or "P" => SymbolType.Code,
						"R" => SymbolType.Ram,
						"W" => SymbolType.Ram,
						"S" => SymbolType.Data,
						_ => SymbolType.Unknown
					};

					AddSymbol(name, address, symbolType, comment);
				}
			}
		}
	}

	/// <summary>
	/// Load symbols from simple label file (address = name format).
	/// </summary>
	public void LoadLabels(string content)
	{
		var lines = content.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.RemoveEmptyEntries);

		foreach (var line in lines)
		{
			var trimmed = line.Trim();
			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith(";") || trimmed.StartsWith("#"))
			{
				continue;
			}

			// Try various formats
			// name = $address
			// $address name
			// address:name

			var match = Regex.Match(trimmed, @"^(\w+)\s*=\s*\$?([0-9a-fA-F]+)");
			if (match.Success)
			{
				var name = match.Groups[1].Value;
				var address = Convert.ToInt32(match.Groups[2].Value, 16);
				AddSymbol(name, address);
				continue;
			}

			match = Regex.Match(trimmed, @"^\$?([0-9a-fA-F]+)\s+(\w+)");
			if (match.Success)
			{
				var address = Convert.ToInt32(match.Groups[1].Value, 16);
				var name = match.Groups[2].Value;
				AddSymbol(name, address);
				continue;
			}

			match = Regex.Match(trimmed, @"^([0-9a-fA-F]+):(\w+)");
			if (match.Success)
			{
				var address = Convert.ToInt32(match.Groups[1].Value, 16);
				var name = match.Groups[2].Value;
				AddSymbol(name, address);
			}
		}
	}

	/// <summary>
	/// Export symbols to MLB format.
	/// </summary>
	public string ExportMlb()
	{
		var sb = new StringBuilder();
		sb.AppendLine("# Generated symbol file");

		foreach (var (name, address, type) in GetAllSymbols().OrderBy(s => s.Address))
		{
			var typeCode = type switch
			{
				SymbolType.Code or SymbolType.Subroutine => "P",
				SymbolType.Ram => "R",
				SymbolType.Data or SymbolType.Table => "S",
				_ => "G"
			};

			var comment = GetComment(name) ?? "";
			sb.AppendLine($"{typeCode}:{address:x6}:{name}:{comment}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Export to simple label format.
	/// </summary>
	public string ExportLabels()
	{
		var sb = new StringBuilder();

		foreach (var (name, address, _) in GetAllSymbols().OrderBy(s => s.Address))
		{
			sb.AppendLine($"{name} = ${address:x4}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Count of symbols.
	/// </summary>
	public int Count => _symbolToAddress.Count;

	/// <summary>
	/// Clear all symbols.
	/// </summary>
	public void Clear()
	{
		_addressToSymbol.Clear();
		_symbolToAddress.Clear();
		_comments.Clear();
		_symbolTypes.Clear();
	}
}
