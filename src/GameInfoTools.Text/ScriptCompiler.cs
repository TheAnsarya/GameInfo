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

/// <summary>
/// Custom scripting language definition for game scripts.
/// </summary>
public class ScriptLanguageDefinition {
	/// <summary>
	/// Control code definition.
	/// </summary>
	public record ControlCode(string Name, byte[] Bytes, List<ControlCodeParam> Parameters);

	/// <summary>
	/// Parameter for a control code.
	/// </summary>
	public record ControlCodeParam(string Name, ControlCodeParamType Type, int? MinValue = null, int? MaxValue = null);

	/// <summary>
	/// Parameter types for control codes.
	/// </summary>
	public enum ControlCodeParamType {
		Byte,
		Word,
		String,
		Label,
		Variable
	}

	/// <summary>
	/// Name of the language/script format.
	/// </summary>
	public string Name { get; set; } = "Custom";

	/// <summary>
	/// Description of the format.
	/// </summary>
	public string Description { get; set; } = "";

	/// <summary>
	/// File extension for script files.
	/// </summary>
	public string FileExtension { get; set; } = ".script";

	/// <summary>
	/// Defined control codes.
	/// </summary>
	public Dictionary<string, ControlCode> ControlCodes { get; } = new(StringComparer.OrdinalIgnoreCase);

	/// <summary>
	/// Character encoding table.
	/// </summary>
	public Core.TextTable? TextTable { get; set; }

	/// <summary>
	/// Comment prefix (default: semicolon).
	/// </summary>
	public string CommentPrefix { get; set; } = ";";

	/// <summary>
	/// String terminator byte(s).
	/// </summary>
	public byte[] StringTerminator { get; set; } = [0x00];

	/// <summary>
	/// Register a control code.
	/// </summary>
	public void AddControlCode(string name, byte[] bytes, params ControlCodeParam[] parameters) {
		ControlCodes[name] = new ControlCode(name, bytes, parameters.ToList());
	}

	/// <summary>
	/// Load language definition from JSON.
	/// </summary>
	public static ScriptLanguageDefinition LoadFromJson(string json) {
		var def = new ScriptLanguageDefinition();

		// Parse JSON and populate definition
		// Using simple manual parsing to avoid external dependencies
		if (json.Contains("\"name\"")) {
			var nameMatch = Regex.Match(json, "\"name\"\\s*:\\s*\"([^\"]+)\"");
			if (nameMatch.Success)
				def.Name = nameMatch.Groups[1].Value;
		}

		if (json.Contains("\"description\"")) {
			var descMatch = Regex.Match(json, "\"description\"\\s*:\\s*\"([^\"]+)\"");
			if (descMatch.Success)
				def.Description = descMatch.Groups[1].Value;
		}

		if (json.Contains("\"commentPrefix\"")) {
			var commentMatch = Regex.Match(json, "\"commentPrefix\"\\s*:\\s*\"([^\"]+)\"");
			if (commentMatch.Success)
				def.CommentPrefix = commentMatch.Groups[1].Value;
		}

		return def;
	}

	/// <summary>
	/// Export language definition to JSON.
	/// </summary>
	public string ExportToJson() {
		var sb = new StringBuilder();
		sb.AppendLine("{");
		sb.AppendLine($"  \"name\": \"{Name}\",");
		sb.AppendLine($"  \"description\": \"{Description}\",");
		sb.AppendLine($"  \"fileExtension\": \"{FileExtension}\",");
		sb.AppendLine($"  \"commentPrefix\": \"{CommentPrefix}\",");
		sb.AppendLine($"  \"stringTerminator\": \"{string.Join(" ", StringTerminator.Select(b => $"${b:x2}"))}\",");
		sb.AppendLine("  \"controlCodes\": [");

		var codes = ControlCodes.Values.ToList();
		for (int i = 0; i < codes.Count; i++) {
			var code = codes[i];
			sb.AppendLine("    {");
			sb.AppendLine($"      \"name\": \"{code.Name}\",");
			sb.AppendLine($"      \"bytes\": \"{string.Join(" ", code.Bytes.Select(b => $"${b:x2}"))}\",");
			sb.AppendLine($"      \"params\": [{string.Join(", ", code.Parameters.Select(p => $"{{\"name\": \"{p.Name}\", \"type\": \"{p.Type}\"}}"))}]");
			sb.Append("    }");
			sb.AppendLine(i < codes.Count - 1 ? "," : "");
		}

		sb.AppendLine("  ]");
		sb.AppendLine("}");
		return sb.ToString();
	}

	/// <summary>
	/// Create a common NES RPG language definition.
	/// </summary>
	public static ScriptLanguageDefinition CreateNesRpgLanguage() {
		var def = new ScriptLanguageDefinition {
			Name = "NES RPG Script",
			Description = "Common NES RPG text format",
			FileExtension = ".txt"
		};

		def.AddControlCode("END", [0x00]);
		def.AddControlCode("NEWLINE", [0xfe]);
		def.AddControlCode("WAIT", [0xfd], new ControlCodeParam("frames", ControlCodeParamType.Byte, 0, 255));
		def.AddControlCode("CHOICE", [0xfc]);
		def.AddControlCode("NAME", [0xfb], new ControlCodeParam("index", ControlCodeParamType.Byte, 0, 7));
		def.AddControlCode("ITEM", [0xfa], new ControlCodeParam("index", ControlCodeParamType.Byte));
		def.AddControlCode("NUMBER", [0xf9], new ControlCodeParam("variable", ControlCodeParamType.Variable));

		return def;
	}
}

/// <summary>
/// Macro processor for script compilation.
/// </summary>
public class MacroProcessor {
	/// <summary>
	/// Defined macro.
	/// </summary>
	public record Macro(string Name, List<string> Parameters, string Body);

	private readonly Dictionary<string, Macro> _macros = new(StringComparer.OrdinalIgnoreCase);
	private readonly Dictionary<string, string> _defines = new(StringComparer.OrdinalIgnoreCase);

	/// <summary>
	/// Define a simple text replacement.
	/// </summary>
	public void Define(string name, string value) {
		_defines[name] = value;
	}

	/// <summary>
	/// Undefine a symbol.
	/// </summary>
	public void Undefine(string name) {
		_defines.Remove(name);
		_macros.Remove(name);
	}

	/// <summary>
	/// Check if a symbol is defined.
	/// </summary>
	public bool IsDefined(string name) => _defines.ContainsKey(name) || _macros.ContainsKey(name);

	/// <summary>
	/// Define a macro with parameters.
	/// </summary>
	public void DefineMacro(string name, List<string> parameters, string body) {
		_macros[name] = new Macro(name, parameters, body);
	}

	/// <summary>
	/// Expand all macros in text.
	/// </summary>
	public string Expand(string text) {
		// First expand simple defines
		foreach (var (name, value) in _defines) {
			text = Regex.Replace(text, $@"\b{Regex.Escape(name)}\b", value);
		}

		// Then expand parameterized macros
		foreach (var (name, macro) in _macros) {
			var pattern = $@"{Regex.Escape(name)}\s*\(([^)]*)\)";
			text = Regex.Replace(text, pattern, m => ExpandMacro(macro, m.Groups[1].Value));
		}

		return text;
	}

	private string ExpandMacro(Macro macro, string argsString) {
		var args = argsString.Split(',').Select(a => a.Trim()).ToList();
		var result = macro.Body;

		for (int i = 0; i < macro.Parameters.Count && i < args.Count; i++) {
			result = Regex.Replace(result, $@"\b{Regex.Escape(macro.Parameters[i])}\b", args[i]);
		}

		return result;
	}

	/// <summary>
	/// Process preprocessor directives in a script.
	/// </summary>
	public List<string> ProcessDirectives(IEnumerable<string> lines) {
		var result = new List<string>();
		var conditionalStack = new Stack<bool>(); // true = currently including, false = skipping
		conditionalStack.Push(true); // Start including

		foreach (var line in lines) {
			var trimmed = line.TrimStart();

			// Check for preprocessor directives
			if (trimmed.StartsWith("#")) {
				ProcessPreprocessorDirective(trimmed, conditionalStack);
				continue;
			}

			// Include line if we're in an active conditional block
			if (conditionalStack.Peek()) {
				result.Add(Expand(line));
			}
		}

		return result;
	}

	private void ProcessPreprocessorDirective(string directive, Stack<bool> conditionalStack) {
		var parts = directive.Split(' ', 2, StringSplitOptions.RemoveEmptyEntries);
		var command = parts[0].ToLowerInvariant();
		var args = parts.Length > 1 ? parts[1].Trim() : "";

		switch (command) {
			case "#define":
				if (conditionalStack.Peek()) {
					var defParts = args.Split(' ', 2);
					var defName = defParts[0];
					var defValue = defParts.Length > 1 ? defParts[1] : "1";
					Define(defName, defValue);
				}

				break;

			case "#undef":
				if (conditionalStack.Peek()) {
					Undefine(args);
				}

				break;

			case "#ifdef":
				conditionalStack.Push(conditionalStack.Peek() && IsDefined(args));
				break;

			case "#ifndef":
				conditionalStack.Push(conditionalStack.Peek() && !IsDefined(args));
				break;

			case "#if":
				// Simple numeric evaluation
				conditionalStack.Push(conditionalStack.Peek() && EvaluateCondition(args));
				break;

			case "#else":
				if (conditionalStack.Count > 1) {
					var current = conditionalStack.Pop();
					var parent = conditionalStack.Peek();
					conditionalStack.Push(parent && !current);
				}

				break;

			case "#elif":
				if (conditionalStack.Count > 1) {
					var current = conditionalStack.Pop();
					var parent = conditionalStack.Peek();
					conditionalStack.Push(parent && !current && EvaluateCondition(args));
				}

				break;

			case "#endif":
				if (conditionalStack.Count > 1) {
					conditionalStack.Pop();
				}

				break;

			case "#macro":
				if (conditionalStack.Peek()) {
					ParseMacroDefinition(args);
				}

				break;
		}
	}

	private bool EvaluateCondition(string condition) {
		// Expand any defined symbols
		condition = Expand(condition);

		// Handle defined() checks
		condition = Regex.Replace(condition, @"defined\s*\(\s*(\w+)\s*\)",
			m => IsDefined(m.Groups[1].Value) ? "1" : "0");

		// Simple numeric comparison
		var compareMatch = Regex.Match(condition, @"(\d+)\s*(==|!=|<=|>=|<|>)\s*(\d+)");
		if (compareMatch.Success) {
			var left = int.Parse(compareMatch.Groups[1].Value);
			var op = compareMatch.Groups[2].Value;
			var right = int.Parse(compareMatch.Groups[3].Value);

			return op switch {
				"==" => left == right,
				"!=" => left != right,
				"<" => left < right,
				">" => left > right,
				"<=" => left <= right,
				">=" => left >= right,
				_ => false
			};
		}

		// Try to parse as a simple number (non-zero = true)
		if (int.TryParse(condition, out int value)) {
			return value != 0;
		}

		return false;
	}

	private void ParseMacroDefinition(string args) {
		// Format: NAME(param1, param2) body
		var match = Regex.Match(args, @"(\w+)\s*\(([^)]*)\)\s*(.*)");
		if (match.Success) {
			var name = match.Groups[1].Value;
			var paramStr = match.Groups[2].Value;
			var body = match.Groups[3].Value;

			var parameters = paramStr.Split(',').Select(p => p.Trim()).ToList();
			DefineMacro(name, parameters, body);
		}
	}

	/// <summary>
	/// Get all defined symbols.
	/// </summary>
	public Dictionary<string, string> GetDefines() => new(_defines);

	/// <summary>
	/// Get all defined macros.
	/// </summary>
	public Dictionary<string, Macro> GetMacros() => new(_macros);
}

/// <summary>
/// Include file resolver for script compilation.
/// </summary>
public class IncludeResolver {
	private readonly List<string> _searchPaths = [];
	private readonly Dictionary<string, string> _fileCache = new(StringComparer.OrdinalIgnoreCase);
	private readonly HashSet<string> _includeStack = new(StringComparer.OrdinalIgnoreCase);

	/// <summary>
	/// Maximum include depth to prevent infinite recursion.
	/// </summary>
	public int MaxIncludeDepth { get; set; } = 10;

	/// <summary>
	/// Add a search path for include files.
	/// </summary>
	public void AddSearchPath(string path) {
		if (!_searchPaths.Contains(path, StringComparer.OrdinalIgnoreCase)) {
			_searchPaths.Add(path);
		}
	}

	/// <summary>
	/// Resolve an include file path.
	/// </summary>
	public string? ResolveInclude(string filename, string? currentFile = null) {
		// First check relative to current file
		if (!string.IsNullOrEmpty(currentFile)) {
			var dir = Path.GetDirectoryName(currentFile);
			if (!string.IsNullOrEmpty(dir)) {
				var relativePath = Path.Combine(dir, filename);
				if (File.Exists(relativePath)) {
					return Path.GetFullPath(relativePath);
				}
			}
		}

		// Then check search paths
		foreach (var searchPath in _searchPaths) {
			var fullPath = Path.Combine(searchPath, filename);
			if (File.Exists(fullPath)) {
				return Path.GetFullPath(fullPath);
			}
		}

		// Check if it's an absolute path
		if (Path.IsPathRooted(filename) && File.Exists(filename)) {
			return Path.GetFullPath(filename);
		}

		return null;
	}

	/// <summary>
	/// Process a script file with includes.
	/// </summary>
	public ProcessedScript ProcessFile(string filename) {
		var errors = new List<string>();
		var processedLines = new List<ProcessedLine>();

		try {
			ProcessFileInternal(filename, processedLines, errors, 0);
		} catch (Exception ex) {
			errors.Add($"Error processing {filename}: {ex.Message}");
		}

		return new ProcessedScript(processedLines, errors);
	}

	private void ProcessFileInternal(string filename, List<ProcessedLine> output, List<string> errors, int depth) {
		if (depth >= MaxIncludeDepth) {
			errors.Add($"Include depth exceeded ({MaxIncludeDepth}) at {filename}");
			return;
		}

		var fullPath = Path.GetFullPath(filename);

		// Check for circular includes
		if (_includeStack.Contains(fullPath)) {
			errors.Add($"Circular include detected: {filename}");
			return;
		}

		_includeStack.Add(fullPath);

		try {
			// Read file (cached)
			string content;
			if (_fileCache.TryGetValue(fullPath, out var cached)) {
				content = cached;
			} else {
				content = File.ReadAllText(fullPath);
				_fileCache[fullPath] = content;
			}

			var lines = content.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
			int lineNum = 0;

			foreach (var line in lines) {
				lineNum++;
				var trimmed = line.TrimStart();

				// Check for include directive
				var includeMatch = Regex.Match(trimmed, @"^\s*(?:#include|\.include)\s+[""<]([^"">]+)["">\s]*", RegexOptions.IgnoreCase);
				if (includeMatch.Success) {
					var includeFile = includeMatch.Groups[1].Value;
					var resolvedPath = ResolveInclude(includeFile, fullPath);

					if (resolvedPath != null) {
						ProcessFileInternal(resolvedPath, output, errors, depth + 1);
					} else {
						errors.Add($"{filename}:{lineNum}: Include file not found: {includeFile}");
					}

					continue;
				}

				output.Add(new ProcessedLine(line, fullPath, lineNum));
			}
		} finally {
			_includeStack.Remove(fullPath);
		}
	}

	/// <summary>
	/// Process script content (string) with includes.
	/// </summary>
	public ProcessedScript ProcessContent(string content, string virtualFilename = "<input>") {
		var errors = new List<string>();
		var processedLines = new List<ProcessedLine>();

		var lines = content.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
		int lineNum = 0;

		foreach (var line in lines) {
			lineNum++;
			var trimmed = line.TrimStart();

			// Check for include directive
			var includeMatch = Regex.Match(trimmed, @"^\s*(?:#include|\.include)\s+[""<]([^"">]+)["">\s]*", RegexOptions.IgnoreCase);
			if (includeMatch.Success) {
				var includeFile = includeMatch.Groups[1].Value;
				var resolvedPath = ResolveInclude(includeFile);

				if (resolvedPath != null) {
					ProcessFileInternal(resolvedPath, processedLines, errors, 1);
				} else {
					errors.Add($"{virtualFilename}:{lineNum}: Include file not found: {includeFile}");
				}

				continue;
			}

			processedLines.Add(new ProcessedLine(line, virtualFilename, lineNum));
		}

		return new ProcessedScript(processedLines, errors);
	}

	/// <summary>
	/// Clear the file cache.
	/// </summary>
	public void ClearCache() {
		_fileCache.Clear();
	}
}

/// <summary>
/// A processed line with source information.
/// </summary>
public record ProcessedLine(string Content, string SourceFile, int LineNumber);

/// <summary>
/// Result of processing a script with includes.
/// </summary>
public record ProcessedScript(List<ProcessedLine> Lines, List<string> Errors);

/// <summary>
/// Advanced script compiler with macro and include support.
/// </summary>
public class AdvancedScriptCompiler {
	private readonly Core.TextTable _table;
	private readonly MacroProcessor _macroProcessor = new();
	private readonly IncludeResolver _includeResolver = new();
	private readonly ScriptLanguageDefinition? _language;

	/// <summary>
	/// Collected errors during compilation.
	/// </summary>
	public List<string> Errors { get; } = [];

	/// <summary>
	/// Collected warnings during compilation.
	/// </summary>
	public List<string> Warnings { get; } = [];

	/// <summary>
	/// Symbol table (labels and their addresses).
	/// </summary>
	public Dictionary<string, int> Symbols { get; } = new(StringComparer.OrdinalIgnoreCase);

	/// <summary>
	/// Source map for debugging.
	/// </summary>
	public List<SourceMapEntry> SourceMap { get; } = [];

	public AdvancedScriptCompiler(Core.TextTable table, ScriptLanguageDefinition? language = null) {
		_table = table;
		_language = language;
	}

	/// <summary>
	/// Add an include search path.
	/// </summary>
	public void AddIncludePath(string path) {
		_includeResolver.AddSearchPath(path);
	}

	/// <summary>
	/// Define a preprocessor symbol.
	/// </summary>
	public void Define(string name, string value = "1") {
		_macroProcessor.Define(name, value);
	}

	/// <summary>
	/// Compile a script file.
	/// </summary>
	public byte[] CompileFile(string filename) {
		var processed = _includeResolver.ProcessFile(filename);
		Errors.AddRange(processed.Errors);

		return CompileProcessedScript(processed.Lines);
	}

	/// <summary>
	/// Compile script content.
	/// </summary>
	public byte[] CompileContent(string content) {
		var processed = _includeResolver.ProcessContent(content);
		Errors.AddRange(processed.Errors);

		return CompileProcessedScript(processed.Lines);
	}

	private byte[] CompileProcessedScript(List<ProcessedLine> lines) {
		Errors.Clear();
		Warnings.Clear();
		Symbols.Clear();
		SourceMap.Clear();

		var output = new List<byte>();
		var unresolvedRefs = new List<(string Label, int Position, ProcessedLine Source)>();

		// Process macros
		var expandedLines = _macroProcessor.ProcessDirectives(lines.Select(l => l.Content));
		var processedWithSource = new List<(string Line, ProcessedLine? Source)>();

		for (int i = 0; i < expandedLines.Count; i++) {
			processedWithSource.Add((expandedLines[i], i < lines.Count ? lines[i] : null));
		}

		// First pass: collect labels
		foreach (var (line, source) in processedWithSource) {
			var trimmed = line.Trim();
			if (trimmed.EndsWith(':') && !IsComment(trimmed)) {
				var labelName = trimmed[..^1].Trim();
				if (!string.IsNullOrEmpty(labelName)) {
					Symbols[labelName] = -1; // Will be resolved in second pass
				}
			}
		}

		// Second pass: compile
		foreach (var (line, source) in processedWithSource) {
			var trimmed = line.Trim();

			// Skip empty lines and comments
			if (string.IsNullOrEmpty(trimmed) || IsComment(trimmed))
				continue;

			// Label definition
			if (trimmed.EndsWith(':')) {
				var labelName = trimmed[..^1].Trim();
				Symbols[labelName] = output.Count;
				continue;
			}

			// Record source mapping
			if (source != null) {
				SourceMap.Add(new SourceMapEntry(output.Count, source.SourceFile, source.LineNumber));
			}

			try {
				CompileLine(trimmed, output, unresolvedRefs, source);
			} catch (Exception ex) {
				var location = source != null ? $"{source.SourceFile}:{source.LineNumber}" : "unknown";
				Errors.Add($"{location}: {ex.Message}");
			}
		}

		// Resolve forward references
		foreach (var (label, position, source) in unresolvedRefs) {
			if (Symbols.TryGetValue(label, out int address) && address >= 0) {
				output[position] = (byte)(address & 0xff);
				output[position + 1] = (byte)((address >> 8) & 0xff);
			} else {
				var location = source != null ? $"{source.SourceFile}:{source.LineNumber}" : "unknown";
				Errors.Add($"{location}: Unresolved label: {label}");
			}
		}

		return output.ToArray();
	}

	private bool IsComment(string line) {
		if (_language != null) {
			return line.StartsWith(_language.CommentPrefix);
		}

		return line.StartsWith(';') || line.StartsWith("//");
	}

	private void CompileLine(string line, List<byte> output, List<(string, int, ProcessedLine?)> unresolvedRefs, ProcessedLine? source) {
		// Handle directives
		if (line.StartsWith('.')) {
			CompileDirective(line, output, unresolvedRefs, source);
			return;
		}

		// Handle language-defined control codes
		if (_language != null && line.StartsWith('{')) {
			CompileControlCode(line, output, source);
			return;
		}

		// Plain text
		var encoded = _table.Encode(line);
		output.AddRange(encoded);
	}

	private void CompileDirective(string line, List<byte> output, List<(string, int, ProcessedLine?)> unresolvedRefs, ProcessedLine? source) {
		var match = Regex.Match(line, @"^\.(\w+)\s*(.*)$");
		if (!match.Success) {
			Errors.Add($"Invalid directive syntax: {line}");
			return;
		}

		var directive = match.Groups[1].Value.ToLowerInvariant();
		var args = match.Groups[2].Value.Trim();

		switch (directive) {
			case "byte":
			case "db":
				foreach (var part in args.Split(',')) {
					var trimmed = part.Trim();
					if (TryParseNumber(trimmed, out int value)) {
						output.Add((byte)value);
					} else {
						Errors.Add($"Invalid byte value: {trimmed}");
					}
				}

				break;

			case "word":
			case "dw":
				foreach (var part in args.Split(',')) {
					var trimmed = part.Trim();
					if (TryParseNumber(trimmed, out int value)) {
						output.Add((byte)(value & 0xff));
						output.Add((byte)((value >> 8) & 0xff));
					} else if (Symbols.ContainsKey(trimmed)) {
						if (Symbols[trimmed] >= 0) {
							output.Add((byte)(Symbols[trimmed] & 0xff));
							output.Add((byte)((Symbols[trimmed] >> 8) & 0xff));
						} else {
							unresolvedRefs.Add((trimmed, output.Count, source));
							output.Add(0x00);
							output.Add(0x00);
						}
					} else {
						Errors.Add($"Unknown symbol: {trimmed}");
					}
				}

				break;

			case "text":
				var text = args.Trim('"');
				output.AddRange(_table.Encode(text));
				break;

			case "end":
				if (_language != null) {
					output.AddRange(_language.StringTerminator);
				} else {
					var endBytes = _table.Encode("{END}");
					output.AddRange(endBytes.Length > 0 ? endBytes : [0x00]);
				}

				break;

			case "align":
				if (TryParseNumber(args, out int alignment) && alignment > 0) {
					while (output.Count % alignment != 0) {
						output.Add(0x00);
					}
				}

				break;

			case "org":
				if (TryParseNumber(args, out int origin)) {
					while (output.Count < origin) {
						output.Add(0x00);
					}
				}

				break;

			case "warning":
				Warnings.Add(args.Trim('"'));
				break;

			case "error":
				Errors.Add(args.Trim('"'));
				break;

			default:
				Errors.Add($"Unknown directive: .{directive}");
				break;
		}
	}

	private void CompileControlCode(string line, List<byte> output, ProcessedLine? source) {
		if (_language == null) {
			output.AddRange(_table.Encode(line));
			return;
		}

		// Parse {CODE} or {CODE:param1,param2}
		var match = Regex.Match(line, @"\{(\w+)(?::([^}]*))?\}");
		if (!match.Success) {
			output.AddRange(_table.Encode(line));
			return;
		}

		var codeName = match.Groups[1].Value;
		var paramStr = match.Groups[2].Value;

		if (_language.ControlCodes.TryGetValue(codeName, out var code)) {
			output.AddRange(code.Bytes);

			if (!string.IsNullOrEmpty(paramStr)) {
				var paramValues = paramStr.Split(',');
				for (int i = 0; i < code.Parameters.Count && i < paramValues.Length; i++) {
					var param = code.Parameters[i];
					var valueStr = paramValues[i].Trim();

					if (TryParseNumber(valueStr, out int value)) {
						switch (param.Type) {
							case ScriptLanguageDefinition.ControlCodeParamType.Byte:
								output.Add((byte)value);
								break;
							case ScriptLanguageDefinition.ControlCodeParamType.Word:
								output.Add((byte)(value & 0xff));
								output.Add((byte)((value >> 8) & 0xff));
								break;
							default:
								output.Add((byte)value);
								break;
						}
					}
				}
			}
		} else {
			// Fall back to text table encoding
			output.AddRange(_table.Encode(line));
		}
	}

	private static bool TryParseNumber(string s, out int value) {
		s = s.Trim();
		if (s.StartsWith('$')) {
			return int.TryParse(s[1..], System.Globalization.NumberStyles.HexNumber, null, out value);
		} else if (s.StartsWith("0x")) {
			return int.TryParse(s[2..], System.Globalization.NumberStyles.HexNumber, null, out value);
		} else {
			return int.TryParse(s, out value);
		}
	}

	/// <summary>
	/// Get syntax highlighting tokens for a script.
	/// </summary>
	public static List<SyntaxToken> GetSyntaxTokens(string content, ScriptLanguageDefinition? language = null) {
		var tokens = new List<SyntaxToken>();
		var lines = content.Split('\n');
		int offset = 0;

		foreach (var line in lines) {
			TokenizeLine(line, offset, tokens, language);
			offset += line.Length + 1; // +1 for newline
		}

		return tokens;
	}

	private static void TokenizeLine(string line, int lineOffset, List<SyntaxToken> tokens, ScriptLanguageDefinition? language) {
		var commentPrefix = language?.CommentPrefix ?? ";";

		// Check for comment
		var commentIndex = line.IndexOf(commentPrefix, StringComparison.Ordinal);
		if (commentIndex == 0) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.Comment, lineOffset, line.Length));
			return;
		}

		// Check for label
		var labelMatch = Regex.Match(line, @"^(\w+):");
		if (labelMatch.Success) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.Label, lineOffset, labelMatch.Length - 1));
		}

		// Check for directive
		var directiveMatch = Regex.Match(line, @"^\s*(\.?\w+)");
		if (directiveMatch.Success && directiveMatch.Groups[1].Value.StartsWith('.')) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.Directive,
				lineOffset + directiveMatch.Groups[1].Index,
				directiveMatch.Groups[1].Length));
		}

		// Check for preprocessor
		if (line.TrimStart().StartsWith('#')) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.Preprocessor, lineOffset, line.Length));
			return;
		}

		// Check for control codes {xxx}
		foreach (Match match in Regex.Matches(line, @"\{[^}]+\}")) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.ControlCode,
				lineOffset + match.Index,
				match.Length));
		}

		// Check for numbers
		foreach (Match match in Regex.Matches(line, @"(?<!\w)(\$[0-9a-fA-F]+|0x[0-9a-fA-F]+|\d+)(?!\w)")) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.Number,
				lineOffset + match.Index,
				match.Length));
		}

		// Check for strings
		foreach (Match match in Regex.Matches(line, @"""[^""]*""")) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.String,
				lineOffset + match.Index,
				match.Length));
		}

		// Add comment at end if present
		if (commentIndex > 0) {
			tokens.Add(new SyntaxToken(SyntaxTokenType.Comment,
				lineOffset + commentIndex,
				line.Length - commentIndex));
		}
	}
}

/// <summary>
/// Syntax token for highlighting.
/// </summary>
public record SyntaxToken(SyntaxTokenType Type, int Offset, int Length);

/// <summary>
/// Types of syntax tokens.
/// </summary>
public enum SyntaxTokenType {
	Comment,
	Label,
	Directive,
	Preprocessor,
	ControlCode,
	Number,
	String,
	Text
}

/// <summary>
/// Source map entry for debugging.
/// </summary>
public record SourceMapEntry(int OutputOffset, string SourceFile, int SourceLine);
