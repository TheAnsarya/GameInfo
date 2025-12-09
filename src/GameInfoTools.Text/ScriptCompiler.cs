using System.Text;
using System.Text.RegularExpressions;

namespace GameInfoTools.Text;

/// <summary>
/// Script extraction and compilation for game dialogue.
/// </summary>
public class ScriptCompiler {
	private readonly Core.TextTable _table;
	private readonly Dictionary<string, int> _labels = new(StringComparer.OrdinalIgnoreCase);
	private readonly List<(string Label, int Position)> _unresolvedRefs = new();

	public ScriptCompiler(Core.TextTable table) {
		_table = table;
	}

	/// <summary>
	/// Script parsing result.
	/// </summary>
	public record CompileResult(byte[] Data, List<string> Errors, Dictionary<string, int> Labels);

	/// <summary>
	/// Compile a script file to binary data.
	/// </summary>
	public CompileResult Compile(string script) {
		var errors = new List<string>();
		var output = new List<byte>();
		_labels.Clear();
		_unresolvedRefs.Clear();

		var lines = script.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
		int lineNum = 0;

		// First pass: collect labels
		foreach (var line in lines) {
			lineNum++;
			var trimmed = line.Trim();

			if (trimmed.EndsWith(':') && !trimmed.StartsWith(';')) {
				var labelName = trimmed[..^1].Trim();
				if (!string.IsNullOrEmpty(labelName)) {
					// Label will be resolved in second pass
					_labels[labelName] = -1;
				}
			}
		}

		// Second pass: compile
		lineNum = 0;
		foreach (var line in lines) {
			lineNum++;
			var trimmed = line.Trim();

			// Skip empty lines and comments
			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith(';') || trimmed.StartsWith("//")) {
				continue;
			}

			// Label definition
			if (trimmed.EndsWith(':')) {
				var labelName = trimmed[..^1].Trim();
				_labels[labelName] = output.Count;
				continue;
			}

			try {
				CompileLine(trimmed, output, lineNum, errors);
			} catch (Exception ex) {
				errors.Add($"Line {lineNum}: {ex.Message}");
			}
		}

		// Resolve forward references
		foreach (var (label, position) in _unresolvedRefs) {
			if (_labels.TryGetValue(label, out int address)) {
				// Write 16-bit address (little endian)
				output[position] = (byte)(address & 0xff);
				output[position + 1] = (byte)((address >> 8) & 0xff);
			} else {
				errors.Add($"Unresolved label: {label}");
			}
		}

		return new CompileResult(output.ToArray(), errors, new Dictionary<string, int>(_labels));
	}

	private void CompileLine(string line, List<byte> output, int lineNum, List<string> errors) {
		// Check for directives
		if (line.StartsWith('.')) {
			CompileDirective(line, output, lineNum, errors);
			return;
		}

		// Check for control codes {code}
		if (line.StartsWith('{')) {
			CompileControlCode(line, output, lineNum, errors);
			return;
		}

		// Plain text - encode using text table
		var encoded = _table.Encode(line);
		output.AddRange(encoded);
	}

	private void CompileDirective(string line, List<byte> output, int lineNum, List<string> errors) {
		var match = Regex.Match(line, @"^\.(\w+)\s*(.*)$");
		if (!match.Success) {
			errors.Add($"Line {lineNum}: Invalid directive syntax");
			return;
		}

		var directive = match.Groups[1].Value.ToLowerInvariant();
		var args = match.Groups[2].Value.Trim();

		switch (directive) {
			case "byte":
			case "db":
				CompileBytes(args, output, errors, lineNum);
				break;

			case "word":
			case "dw":
				CompileWords(args, output, errors, lineNum);
				break;

			case "text":
				var encoded = _table.Encode(args.Trim('"'));
				output.AddRange(encoded);
				break;

			case "end":
				// Add terminator byte(s) from table if defined
				var endBytes = _table.Encode("{END}");
				if (endBytes.Length > 0) {
					output.AddRange(endBytes);
				} else {
					output.Add(0x00); // Default terminator
				}
				break;

			case "newline":
			case "br":
				var nlBytes = _table.Encode("{NEWLINE}");
				if (nlBytes.Length > 0) {
					output.AddRange(nlBytes);
				} else {
					output.Add(0x0a); // Default newline
				}
				break;

			case "ref":
			case "ptr":
				// Reference to a label
				if (_labels.TryGetValue(args, out int address) && address >= 0) {
					output.Add((byte)(address & 0xff));
					output.Add((byte)((address >> 8) & 0xff));
				} else {
					// Forward reference
					_unresolvedRefs.Add((args, output.Count));
					output.Add(0x00);
					output.Add(0x00);
				}
				break;

			default:
				errors.Add($"Line {lineNum}: Unknown directive .{directive}");
				break;
		}
	}

	private void CompileBytes(string args, List<byte> output, List<string> errors, int lineNum) {
		var parts = args.Split(',');
		foreach (var part in parts) {
			var trimmed = part.Trim();
			if (trimmed.StartsWith('$')) {
				output.Add(Convert.ToByte(trimmed[1..], 16));
			} else if (trimmed.StartsWith("0x")) {
				output.Add(Convert.ToByte(trimmed[2..], 16));
			} else if (int.TryParse(trimmed, out int value)) {
				output.Add((byte)value);
			} else {
				errors.Add($"Line {lineNum}: Invalid byte value '{trimmed}'");
			}
		}
	}

	private void CompileWords(string args, List<byte> output, List<string> errors, int lineNum) {
		var parts = args.Split(',');
		foreach (var part in parts) {
			var trimmed = part.Trim();
			int value;

			if (trimmed.StartsWith('$')) {
				value = Convert.ToInt32(trimmed[1..], 16);
			} else if (trimmed.StartsWith("0x")) {
				value = Convert.ToInt32(trimmed[2..], 16);
			} else if (int.TryParse(trimmed, out int parsed)) {
				value = parsed;
			} else if (_labels.ContainsKey(trimmed)) {
				// Label reference
				if (_labels[trimmed] >= 0) {
					value = _labels[trimmed];
				} else {
					_unresolvedRefs.Add((trimmed, output.Count));
					output.Add(0x00);
					output.Add(0x00);
					continue;
				}
			} else {
				errors.Add($"Line {lineNum}: Invalid word value '{trimmed}'");
				continue;
			}

			output.Add((byte)(value & 0xff));
			output.Add((byte)((value >> 8) & 0xff));
		}
	}

	private void CompileControlCode(string line, List<byte> output, int lineNum, List<string> errors) {
		// Encode using text table's control code handling
		var encoded = _table.Encode(line);
		output.AddRange(encoded);
	}

	/// <summary>
	/// Decompile binary script data to text.
	/// </summary>
	public string Decompile(byte[] data, int offset = 0, int? length = null) {
		var sb = new StringBuilder();
		int end = length.HasValue ? offset + length.Value : data.Length;

		int pos = offset;
		while (pos < end) {
			// Decode one string/block
			var (text, bytesConsumed) = _table.DecodeBlock(data, pos, end - pos);
			sb.AppendLine(text);
			pos += bytesConsumed;

			if (bytesConsumed == 0) {
				break; // Prevent infinite loop
			}
		}

		return sb.ToString();
	}
}

/// <summary>
/// Dialogue tree and branching script support.
/// </summary>
public class DialogueTree {
	/// <summary>
	/// A single dialogue node.
	/// </summary>
	public class DialogueNode {
		public int Id { get; set; }
		public string Text { get; set; } = "";
		public List<DialogueChoice> Choices { get; } = new();
		public int? NextNodeId { get; set; }
		public Dictionary<string, string> Metadata { get; } = new();
	}

	/// <summary>
	/// A choice within a dialogue node.
	/// </summary>
	public class DialogueChoice {
		public string Text { get; set; } = "";
		public int TargetNodeId { get; set; }
		public string? Condition { get; set; }
	}

	public Dictionary<int, DialogueNode> Nodes { get; } = new();

	/// <summary>
	/// Load dialogue from JSON format.
	/// </summary>
	public static DialogueTree LoadFromJson(string json) {
		var tree = new DialogueTree();
		// Would use System.Text.Json to deserialize
		// For now, provide a basic structure
		return tree;
	}

	/// <summary>
	/// Export to JSON format.
	/// </summary>
	public string ExportToJson() {
		var sb = new StringBuilder();
		sb.AppendLine("{");
		sb.AppendLine("  \"nodes\": [");

		var nodeList = Nodes.Values.ToList();
		for (int i = 0; i < nodeList.Count; i++) {
			var node = nodeList[i];
			sb.AppendLine("    {");
			sb.AppendLine($"      \"id\": {node.Id},");
			sb.AppendLine($"      \"text\": \"{EscapeJson(node.Text)}\",");

			if (node.Choices.Count > 0) {
				sb.AppendLine("      \"choices\": [");
				for (int j = 0; j < node.Choices.Count; j++) {
					var choice = node.Choices[j];
					sb.Append($"        {{ \"text\": \"{EscapeJson(choice.Text)}\", \"target\": {choice.TargetNodeId}");
					if (!string.IsNullOrEmpty(choice.Condition)) {
						sb.Append($", \"condition\": \"{EscapeJson(choice.Condition)}\"");
					}
					sb.Append(" }");
					sb.AppendLine(j < node.Choices.Count - 1 ? "," : "");
				}
				sb.AppendLine("      ]");
			} else if (node.NextNodeId.HasValue) {
				sb.AppendLine($"      \"next\": {node.NextNodeId}");
			}

			sb.Append("    }");
			sb.AppendLine(i < nodeList.Count - 1 ? "," : "");
		}

		sb.AppendLine("  ]");
		sb.AppendLine("}");
		return sb.ToString();
	}

	private static string EscapeJson(string s) {
		return s
			.Replace("\\", "\\\\")
			.Replace("\"", "\\\"")
			.Replace("\n", "\\n")
			.Replace("\r", "\\r")
			.Replace("\t", "\\t");
	}

	/// <summary>
	/// Validate dialogue tree for orphaned nodes and broken links.
	/// </summary>
	public List<string> Validate() {
		var errors = new List<string>();
		var referencedIds = new HashSet<int>();

		// Find all referenced node IDs
		foreach (var node in Nodes.Values) {
			if (node.NextNodeId.HasValue) {
				referencedIds.Add(node.NextNodeId.Value);
			}

			foreach (var choice in node.Choices) {
				referencedIds.Add(choice.TargetNodeId);
			}
		}

		// Check for broken references
		foreach (var id in referencedIds) {
			if (!Nodes.ContainsKey(id)) {
				errors.Add($"Broken reference to non-existent node {id}");
			}
		}

		// Check for orphaned nodes (except root node 0)
		foreach (var node in Nodes.Values) {
			if (node.Id != 0 && !referencedIds.Contains(node.Id)) {
				errors.Add($"Orphaned node {node.Id}: '{TruncateText(node.Text, 30)}'");
			}
		}

		// Check for empty nodes
		foreach (var node in Nodes.Values) {
			if (string.IsNullOrWhiteSpace(node.Text)) {
				errors.Add($"Node {node.Id} has empty text");
			}
		}

		return errors;
	}

	private static string TruncateText(string text, int maxLength) {
		if (text.Length <= maxLength) {
			return text;
		}
		return text[..(maxLength - 3)] + "...";
	}
}
