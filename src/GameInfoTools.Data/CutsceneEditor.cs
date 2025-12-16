using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Data;

/// <summary>
/// Service for editing cutscene and event sequence data.
/// Handles cutscene definitions, commands, timing, and playback logic.
/// </summary>
public class CutsceneEditor {
	private readonly Dictionary<string, Cutscene> _cutscenes = [];
	private readonly Dictionary<string, CutsceneCommand> _commandTemplates = [];
	private CutsceneSchema _schema = new();

	/// <summary>
	/// Current schema configuration.
	/// </summary>
	public CutsceneSchema Schema => _schema;

	/// <summary>
	/// All loaded cutscenes.
	/// </summary>
	public IReadOnlyDictionary<string, Cutscene> Cutscenes => _cutscenes;

	/// <summary>
	/// All command templates.
	/// </summary>
	public IReadOnlyDictionary<string, CutsceneCommand> CommandTemplates => _commandTemplates;

	#region Cutscene Management

	/// <summary>
	/// Add a new cutscene.
	/// </summary>
	public void AddCutscene(Cutscene cutscene) {
		ArgumentNullException.ThrowIfNull(cutscene);
		if (string.IsNullOrEmpty(cutscene.Id))
			throw new ArgumentException("Cutscene ID is required");

		_cutscenes[cutscene.Id] = cutscene;
	}

	/// <summary>
	/// Remove a cutscene.
	/// </summary>
	public bool RemoveCutscene(string cutsceneId) {
		return _cutscenes.Remove(cutsceneId);
	}

	/// <summary>
	/// Get a cutscene by ID.
	/// </summary>
	public Cutscene? GetCutscene(string cutsceneId) {
		return _cutscenes.GetValueOrDefault(cutsceneId);
	}

	/// <summary>
	/// Update a cutscene.
	/// </summary>
	public void UpdateCutscene(Cutscene cutscene) {
		ArgumentNullException.ThrowIfNull(cutscene);
		if (!_cutscenes.ContainsKey(cutscene.Id))
			throw new KeyNotFoundException($"Cutscene '{cutscene.Id}' not found");

		_cutscenes[cutscene.Id] = cutscene;
	}

	/// <summary>
	/// Search cutscenes by name or description.
	/// </summary>
	public IEnumerable<Cutscene> Search(string searchTerm, bool caseSensitive = false) {
		var comparison = caseSensitive ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;
		return _cutscenes.Values.Where(c =>
			c.Name.Contains(searchTerm, comparison) ||
			(c.Description?.Contains(searchTerm, comparison) ?? false));
	}

	/// <summary>
	/// Get cutscenes by type.
	/// </summary>
	public IEnumerable<Cutscene> GetByType(CutsceneType type) {
		return _cutscenes.Values.Where(c => c.Type == type);
	}

	/// <summary>
	/// Get cutscenes by trigger type.
	/// </summary>
	public IEnumerable<Cutscene> GetByTrigger(CutsceneTrigger trigger) {
		return _cutscenes.Values.Where(c => c.Trigger == trigger);
	}

	#endregion

	#region Command Management

	/// <summary>
	/// Add a command to a cutscene.
	/// </summary>
	public void AddCommand(string cutsceneId, CutsceneCommand command) {
		var cutscene = GetCutscene(cutsceneId)
			?? throw new KeyNotFoundException($"Cutscene '{cutsceneId}' not found");

		var commands = cutscene.Commands.ToList();
		commands.Add(command);

		_cutscenes[cutsceneId] = cutscene with { Commands = commands };
	}

	/// <summary>
	/// Insert a command at a specific index.
	/// </summary>
	public void InsertCommand(string cutsceneId, int index, CutsceneCommand command) {
		var cutscene = GetCutscene(cutsceneId)
			?? throw new KeyNotFoundException($"Cutscene '{cutsceneId}' not found");

		var commands = cutscene.Commands.ToList();
		if (index < 0 || index > commands.Count)
			throw new IndexOutOfRangeException("Command index out of range");

		commands.Insert(index, command);
		_cutscenes[cutsceneId] = cutscene with { Commands = commands };
	}

	/// <summary>
	/// Remove a command from a cutscene.
	/// </summary>
	public bool RemoveCommand(string cutsceneId, int commandIndex) {
		var cutscene = GetCutscene(cutsceneId);
		if (cutscene == null) return false;

		var commands = cutscene.Commands.ToList();
		if (commandIndex < 0 || commandIndex >= commands.Count) return false;

		commands.RemoveAt(commandIndex);
		_cutscenes[cutsceneId] = cutscene with { Commands = commands };
		return true;
	}

	/// <summary>
	/// Update a command in a cutscene.
	/// </summary>
	public void UpdateCommand(string cutsceneId, int commandIndex, CutsceneCommand command) {
		var cutscene = GetCutscene(cutsceneId)
			?? throw new KeyNotFoundException($"Cutscene '{cutsceneId}' not found");

		var commands = cutscene.Commands.ToList();
		if (commandIndex < 0 || commandIndex >= commands.Count)
			throw new IndexOutOfRangeException("Command index out of range");

		commands[commandIndex] = command;
		_cutscenes[cutsceneId] = cutscene with { Commands = commands };
	}

	/// <summary>
	/// Move a command within a cutscene.
	/// </summary>
	public void MoveCommand(string cutsceneId, int fromIndex, int toIndex) {
		var cutscene = GetCutscene(cutsceneId)
			?? throw new KeyNotFoundException($"Cutscene '{cutsceneId}' not found");

		var commands = cutscene.Commands.ToList();
		if (fromIndex < 0 || fromIndex >= commands.Count)
			throw new IndexOutOfRangeException("Source index out of range");
		if (toIndex < 0 || toIndex >= commands.Count)
			throw new IndexOutOfRangeException("Target index out of range");

		var command = commands[fromIndex];
		commands.RemoveAt(fromIndex);
		commands.Insert(toIndex, command);

		_cutscenes[cutsceneId] = cutscene with { Commands = commands };
	}

	/// <summary>
	/// Duplicate a command.
	/// </summary>
	public void DuplicateCommand(string cutsceneId, int commandIndex) {
		var cutscene = GetCutscene(cutsceneId)
			?? throw new KeyNotFoundException($"Cutscene '{cutsceneId}' not found");

		var commands = cutscene.Commands.ToList();
		if (commandIndex < 0 || commandIndex >= commands.Count)
			throw new IndexOutOfRangeException("Command index out of range");

		var original = commands[commandIndex];
		var duplicate = original with { };

		commands.Insert(commandIndex + 1, duplicate);
		_cutscenes[cutsceneId] = cutscene with { Commands = commands };
	}

	#endregion

	#region Command Templates

	/// <summary>
	/// Add a command template.
	/// </summary>
	public void AddCommandTemplate(string templateId, CutsceneCommand template) {
		ArgumentNullException.ThrowIfNull(template);
		_commandTemplates[templateId] = template;
	}

	/// <summary>
	/// Remove a command template.
	/// </summary>
	public bool RemoveCommandTemplate(string templateId) {
		return _commandTemplates.Remove(templateId);
	}

	/// <summary>
	/// Get a command template.
	/// </summary>
	public CutsceneCommand? GetCommandTemplate(string templateId) {
		return _commandTemplates.GetValueOrDefault(templateId);
	}

	/// <summary>
	/// Create a command from a template.
	/// </summary>
	public CutsceneCommand? CreateFromTemplate(string templateId, Dictionary<string, object>? overrides = null) {
		var template = GetCommandTemplate(templateId);
		if (template == null) return null;

		if (overrides == null || overrides.Count == 0)
			return template with { };

		var parameters = new Dictionary<string, object>(template.Parameters);
		foreach (var (key, value) in overrides) {
			parameters[key] = value;
		}

		return template with { Parameters = parameters };
	}

	#endregion

	#region Timing

	/// <summary>
	/// Calculate total cutscene duration.
	/// </summary>
	public TimeSpan CalculateDuration(string cutsceneId) {
		var cutscene = GetCutscene(cutsceneId);
		if (cutscene == null) return TimeSpan.Zero;

		return CalculateDuration(cutscene);
	}

	/// <summary>
	/// Calculate total cutscene duration.
	/// </summary>
	public TimeSpan CalculateDuration(Cutscene cutscene) {
		if (cutscene.Commands.Count == 0) return TimeSpan.Zero;

		var totalFrames = 0;

		foreach (var command in cutscene.Commands) {
			// Commands with Wait execute after previous completes
			if (command.WaitForPrevious) {
				totalFrames += command.DelayFrames + command.DurationFrames;
			}
			else {
				// Parallel commands - track the longest path
				var commandEnd = command.DelayFrames + command.DurationFrames;
				if (commandEnd > totalFrames) {
					totalFrames = commandEnd;
				}
			}
		}

		// Convert frames to time (assuming 60fps)
		var fps = _schema.FramesPerSecond > 0 ? _schema.FramesPerSecond : 60;
		return TimeSpan.FromSeconds(totalFrames / (double)fps);
	}

	/// <summary>
	/// Get timeline representation of cutscene.
	/// </summary>
	public CutsceneTimeline GetTimeline(string cutsceneId) {
		var cutscene = GetCutscene(cutsceneId);
		if (cutscene == null)
			return new CutsceneTimeline { CutsceneId = cutsceneId };

		var entries = new List<TimelineEntry>();
		var currentFrame = 0;

		foreach (var command in cutscene.Commands) {
			var startFrame = command.WaitForPrevious
				? currentFrame + command.DelayFrames
				: command.DelayFrames;

			entries.Add(new TimelineEntry {
				CommandType = command.Type,
				StartFrame = startFrame,
				EndFrame = startFrame + command.DurationFrames,
				Label = command.Label ?? command.Type.ToString()
			});

			if (command.WaitForPrevious) {
				currentFrame = startFrame + command.DurationFrames;
			}
		}

		return new CutsceneTimeline {
			CutsceneId = cutsceneId,
			TotalFrames = entries.Count > 0 ? entries.Max(e => e.EndFrame) : 0,
			Entries = entries
		};
	}

	#endregion

	#region Validation

	/// <summary>
	/// Validate a cutscene.
	/// </summary>
	public CutsceneValidationResult Validate(string cutsceneId) {
		var cutscene = GetCutscene(cutsceneId);
		if (cutscene == null) {
			return new CutsceneValidationResult {
				CutsceneId = cutsceneId,
				IsValid = false,
				Errors = [new CutsceneValidationError {
					Type = CutsceneValidationErrorType.NotFound,
					Message = $"Cutscene '{cutsceneId}' not found"
				}]
			};
		}

		return Validate(cutscene);
	}

	/// <summary>
	/// Validate a cutscene.
	/// </summary>
	public CutsceneValidationResult Validate(Cutscene cutscene) {
		var errors = new List<CutsceneValidationError>();

		// Basic validation
		if (string.IsNullOrEmpty(cutscene.Name)) {
			errors.Add(new CutsceneValidationError {
				Type = CutsceneValidationErrorType.MissingRequired,
				Message = "Cutscene name is required"
			});
		}

		// Validate commands
		for (var i = 0; i < cutscene.Commands.Count; i++) {
			var command = cutscene.Commands[i];
			errors.AddRange(ValidateCommand(command, i));
		}

		// Check for label references
		var labelSet = new HashSet<string>(
			cutscene.Commands.Where(c => !string.IsNullOrEmpty(c.Label)).Select(c => c.Label!));

		foreach (var command in cutscene.Commands.Where(c => !string.IsNullOrEmpty(c.GotoLabel))) {
			if (!labelSet.Contains(command.GotoLabel!)) {
				errors.Add(new CutsceneValidationError {
					Type = CutsceneValidationErrorType.InvalidLabel,
					Message = $"Label '{command.GotoLabel}' not found",
					CommandIndex = cutscene.Commands.ToList().IndexOf(command)
				});
			}
		}

		return new CutsceneValidationResult {
			CutsceneId = cutscene.Id,
			IsValid = errors.Count == 0,
			Errors = errors
		};
	}

	private IEnumerable<CutsceneValidationError> ValidateCommand(CutsceneCommand command, int index) {
		var errors = new List<CutsceneValidationError>();

		if (command.DurationFrames < 0) {
			errors.Add(new CutsceneValidationError {
				Type = CutsceneValidationErrorType.InvalidValue,
				Message = "Duration cannot be negative",
				CommandIndex = index
			});
		}

		if (command.DelayFrames < 0) {
			errors.Add(new CutsceneValidationError {
				Type = CutsceneValidationErrorType.InvalidValue,
				Message = "Delay cannot be negative",
				CommandIndex = index
			});
		}

		// Validate required parameters based on command type
		switch (command.Type) {
			case CommandType.Dialogue:
				if (!command.Parameters.ContainsKey("text")) {
					errors.Add(new CutsceneValidationError {
						Type = CutsceneValidationErrorType.MissingParameter,
						Message = "Dialogue command requires 'text' parameter",
						CommandIndex = index
					});
				}
				break;

			case CommandType.MoveActor:
				if (!command.Parameters.ContainsKey("actorId")) {
					errors.Add(new CutsceneValidationError {
						Type = CutsceneValidationErrorType.MissingParameter,
						Message = "MoveActor command requires 'actorId' parameter",
						CommandIndex = index
					});
				}
				break;

			case CommandType.PlaySound:
			case CommandType.PlayMusic:
				if (!command.Parameters.ContainsKey("soundId")) {
					errors.Add(new CutsceneValidationError {
						Type = CutsceneValidationErrorType.MissingParameter,
						Message = $"{command.Type} command requires 'soundId' parameter",
						CommandIndex = index
					});
				}
				break;

			case CommandType.Goto:
			case CommandType.GotoIf:
				if (string.IsNullOrEmpty(command.GotoLabel)) {
					errors.Add(new CutsceneValidationError {
						Type = CutsceneValidationErrorType.MissingParameter,
						Message = $"{command.Type} command requires 'gotoLabel'",
						CommandIndex = index
					});
				}
				break;
		}

		return errors;
	}

	/// <summary>
	/// Validate all cutscenes.
	/// </summary>
	public IEnumerable<CutsceneValidationResult> ValidateAll() {
		return _cutscenes.Values.Select(Validate);
	}

	#endregion

	#region Import/Export

	/// <summary>
	/// Export cutscenes to JSON.
	/// </summary>
	public async Task ExportToJsonAsync(string path) {
		var export = new CutsceneExport {
			Schema = _schema,
			CommandTemplates = _commandTemplates.ToDictionary(kvp => kvp.Key, kvp => kvp.Value),
			Cutscenes = _cutscenes.Values.ToList()
		};

		var json = JsonSerializer.Serialize(export, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	/// <summary>
	/// Import cutscenes from JSON.
	/// </summary>
	public async Task ImportFromJsonAsync(string path) {
		var json = await File.ReadAllTextAsync(path);
		var import = JsonSerializer.Deserialize<CutsceneExport>(json, GetJsonOptions())
			?? throw new InvalidOperationException("Failed to parse cutscene data");

		_schema = import.Schema ?? new CutsceneSchema();

		_commandTemplates.Clear();
		_cutscenes.Clear();

		foreach (var (key, template) in import.CommandTemplates) {
			AddCommandTemplate(key, template);
		}

		foreach (var cutscene in import.Cutscenes) {
			AddCutscene(cutscene);
		}
	}

	/// <summary>
	/// Export cutscene to script format.
	/// </summary>
	public string ExportToScript(string cutsceneId) {
		var cutscene = GetCutscene(cutsceneId);
		if (cutscene == null) return "";

		return ExportToScript(cutscene);
	}

	/// <summary>
	/// Export cutscene to script format.
	/// </summary>
	public string ExportToScript(Cutscene cutscene) {
		var lines = new List<string> {
			$"# Cutscene: {cutscene.Name}",
			$"# ID: {cutscene.Id}",
			$"# Type: {cutscene.Type}",
			""
		};

		foreach (var command in cutscene.Commands) {
			var line = FormatCommandAsScript(command);
			lines.Add(line);
		}

		return string.Join(Environment.NewLine, lines);
	}

	private string FormatCommandAsScript(CutsceneCommand command) {
		var parts = new List<string>();

		if (!string.IsNullOrEmpty(command.Label)) {
			parts.Add($":{command.Label}");
		}

		parts.Add(command.Type.ToString().ToUpperInvariant());

		foreach (var (key, value) in command.Parameters) {
			parts.Add($"{key}={FormatParameterValue(value)}");
		}

		if (command.DelayFrames > 0) {
			parts.Add($"delay={command.DelayFrames}");
		}

		if (command.DurationFrames > 0) {
			parts.Add($"duration={command.DurationFrames}");
		}

		if (command.WaitForPrevious) {
			parts.Add("wait");
		}

		if (!string.IsNullOrEmpty(command.GotoLabel)) {
			parts.Add($"goto={command.GotoLabel}");
		}

		return string.Join(" ", parts);
	}

	private static string FormatParameterValue(object value) {
		return value switch {
			string s => $"\"{s}\"",
			bool b => b.ToString().ToLowerInvariant(),
			_ => value.ToString() ?? ""
		};
	}

	/// <summary>
	/// Parse cutscene from script format.
	/// </summary>
	public Cutscene? ParseFromScript(string script, string cutsceneId, string cutsceneName) {
		var commands = new List<CutsceneCommand>();
		var lines = script.Split(["\r\n", "\n"], StringSplitOptions.None);

		foreach (var rawLine in lines) {
			var line = rawLine.Trim();

			// Skip empty lines and comments
			if (string.IsNullOrEmpty(line) || line.StartsWith('#'))
				continue;

			var command = ParseScriptLine(line);
			if (command != null) {
				commands.Add(command);
			}
		}

		return new Cutscene {
			Id = cutsceneId,
			Name = cutsceneName,
			Commands = commands
		};
	}

	private CutsceneCommand? ParseScriptLine(string line) {
		var parts = ParseScriptParts(line);
		if (parts.Count == 0) return null;

		string? label = null;
		var startIndex = 0;

		// Check for label
		if (parts[0].StartsWith(':')) {
			label = parts[0][1..];
			startIndex = 1;
		}

		if (startIndex >= parts.Count) return null;

		// Parse command type
		if (!Enum.TryParse<CommandType>(parts[startIndex], true, out var commandType))
			return null;

		var parameters = new Dictionary<string, object>();
		var delayFrames = 0;
		var durationFrames = 0;
		var waitForPrevious = false;
		string? gotoLabel = null;

		// Parse parameters
		for (var i = startIndex + 1; i < parts.Count; i++) {
			var part = parts[i];

			if (part == "wait") {
				waitForPrevious = true;
				continue;
			}

			var eqIndex = part.IndexOf('=');
			if (eqIndex < 0) continue;

			var key = part[..eqIndex];
			var value = part[(eqIndex + 1)..];

			// Remove quotes from string values
			if (value.StartsWith('"') && value.EndsWith('"')) {
				value = value[1..^1];
			}

			switch (key.ToLowerInvariant()) {
				case "delay":
					int.TryParse(value, out delayFrames);
					break;
				case "duration":
					int.TryParse(value, out durationFrames);
					break;
				case "goto":
					gotoLabel = value;
					break;
				default:
					parameters[key] = ParseParameterValue(value);
					break;
			}
		}

		return new CutsceneCommand {
			Type = commandType,
			Label = label,
			Parameters = parameters,
			DelayFrames = delayFrames,
			DurationFrames = durationFrames,
			WaitForPrevious = waitForPrevious,
			GotoLabel = gotoLabel
		};
	}

	private static List<string> ParseScriptParts(string line) {
		var parts = new List<string>();
		var current = new System.Text.StringBuilder();
		var inQuotes = false;

		foreach (var c in line) {
			if (c == '"') {
				inQuotes = !inQuotes;
				current.Append(c);
			}
			else if (c == ' ' && !inQuotes) {
				if (current.Length > 0) {
					parts.Add(current.ToString());
					current.Clear();
				}
			}
			else {
				current.Append(c);
			}
		}

		if (current.Length > 0) {
			parts.Add(current.ToString());
		}

		return parts;
	}

	private static object ParseParameterValue(string value) {
		if (int.TryParse(value, out var intVal)) return intVal;
		if (bool.TryParse(value, out var boolVal)) return boolVal;
		if (double.TryParse(value, out var doubleVal)) return doubleVal;
		return value;
	}

	/// <summary>
	/// Export to binary format for ROM injection.
	/// </summary>
	public byte[] ExportToBinary(string cutsceneId) {
		var cutscene = GetCutscene(cutsceneId);
		if (cutscene == null) return [];

		return ExportToBinary(cutscene);
	}

	/// <summary>
	/// Export to binary format for ROM injection.
	/// </summary>
	public byte[] ExportToBinary(Cutscene cutscene) {
		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// Write header
		writer.Write((byte)0x43); // 'C'
		writer.Write((byte)0x55); // 'U'
		writer.Write((byte)0x54); // 'T'
		writer.Write((byte)1);    // Version

		// Write command count
		writer.Write((ushort)cutscene.Commands.Count);

		// Write commands
		foreach (var command in cutscene.Commands) {
			WriteCommand(writer, command);
		}

		return ms.ToArray();
	}

	private void WriteCommand(BinaryWriter writer, CutsceneCommand command) {
		writer.Write((byte)command.Type);
		writer.Write((ushort)command.DelayFrames);
		writer.Write((ushort)command.DurationFrames);
		writer.Write(command.WaitForPrevious);

		// Write parameter count and data
		writer.Write((byte)command.Parameters.Count);
		foreach (var (key, value) in command.Parameters) {
			WriteLengthPrefixedString(writer, key);
			WriteParameterValue(writer, value);
		}
	}

	private static void WriteLengthPrefixedString(BinaryWriter writer, string value) {
		var bytes = System.Text.Encoding.UTF8.GetBytes(value);
		writer.Write((byte)bytes.Length);
		writer.Write(bytes);
	}

	private static void WriteParameterValue(BinaryWriter writer, object value) {
		switch (value) {
			case string s:
				writer.Write((byte)0); // String type
				WriteLengthPrefixedString(writer, s);
				break;
			case int i:
				writer.Write((byte)1); // Int type
				writer.Write(i);
				break;
			case bool b:
				writer.Write((byte)2); // Bool type
				writer.Write(b);
				break;
			case double d:
				writer.Write((byte)3); // Double type
				writer.Write(d);
				break;
			default:
				writer.Write((byte)0);
				WriteLengthPrefixedString(writer, value.ToString() ?? "");
				break;
		}
	}

	#endregion

	#region Statistics

	/// <summary>
	/// Get cutscene statistics.
	/// </summary>
	public CutsceneStats GetStatistics() {
		var totalCommands = _cutscenes.Values.Sum(c => c.Commands.Count);
		var durations = _cutscenes.Values.Select(c => CalculateDuration(c).TotalSeconds).ToList();

		return new CutsceneStats {
			TotalCutscenes = _cutscenes.Count,
			TotalCommands = totalCommands,
			TotalTemplates = _commandTemplates.Count,
			ByType = _cutscenes.Values
				.GroupBy(c => c.Type)
				.ToDictionary(g => g.Key, g => g.Count()),
			ByTrigger = _cutscenes.Values
				.GroupBy(c => c.Trigger)
				.ToDictionary(g => g.Key, g => g.Count()),
			CommandsByType = _cutscenes.Values
				.SelectMany(c => c.Commands)
				.GroupBy(c => c.Type)
				.ToDictionary(g => g.Key, g => g.Count()),
			AverageDurationSeconds = durations.Count > 0 ? durations.Average() : 0,
			TotalDurationSeconds = durations.Sum()
		};
	}

	#endregion

	/// <summary>
	/// Clear all data.
	/// </summary>
	public void Clear() {
		_cutscenes.Clear();
		_commandTemplates.Clear();
		_schema = new CutsceneSchema();
	}

	/// <summary>
	/// Set the schema configuration.
	/// </summary>
	public void SetSchema(CutsceneSchema schema) {
		_schema = schema ?? new CutsceneSchema();
	}

	private static JsonSerializerOptions GetJsonOptions() => new() {
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
		Converters = { new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	};
}

#region Data Types

/// <summary>
/// Represents a cutscene/event sequence.
/// </summary>
public record Cutscene {
	/// <summary>Unique cutscene identifier.</summary>
	public required string Id { get; init; }

	/// <summary>Display name.</summary>
	public required string Name { get; init; }

	/// <summary>Cutscene description.</summary>
	public string? Description { get; init; }

	/// <summary>Cutscene type.</summary>
	public CutsceneType Type { get; init; } = CutsceneType.Standard;

	/// <summary>Trigger type.</summary>
	public CutsceneTrigger Trigger { get; init; } = CutsceneTrigger.Manual;

	/// <summary>Trigger condition (event flag, etc.).</summary>
	public string? TriggerCondition { get; init; }

	/// <summary>Whether cutscene can be skipped.</summary>
	public bool Skippable { get; init; } = true;

	/// <summary>Commands in execution order.</summary>
	public IReadOnlyList<CutsceneCommand> Commands { get; init; } = [];

	/// <summary>Tags for organization.</summary>
	public IReadOnlyList<string> Tags { get; init; } = [];
}

/// <summary>
/// A single command in a cutscene.
/// </summary>
public record CutsceneCommand {
	/// <summary>Command type.</summary>
	public CommandType Type { get; init; }

	/// <summary>Optional label for goto references.</summary>
	public string? Label { get; init; }

	/// <summary>Command parameters.</summary>
	public Dictionary<string, object> Parameters { get; init; } = [];

	/// <summary>Delay before execution (frames).</summary>
	public int DelayFrames { get; init; }

	/// <summary>Command duration (frames).</summary>
	public int DurationFrames { get; init; }

	/// <summary>Whether to wait for previous command.</summary>
	public bool WaitForPrevious { get; init; } = true;

	/// <summary>Label to jump to after execution.</summary>
	public string? GotoLabel { get; init; }

	/// <summary>Condition for conditional commands.</summary>
	public string? Condition { get; init; }
}

/// <summary>
/// Schema configuration for cutscenes.
/// </summary>
public record CutsceneSchema {
	/// <summary>Frames per second for timing.</summary>
	public int FramesPerSecond { get; init; } = 60;

	/// <summary>Maximum commands per cutscene.</summary>
	public int MaxCommands { get; init; } = 1000;

	/// <summary>Valid actor IDs.</summary>
	public HashSet<string> ValidActorIds { get; init; } = [];

	/// <summary>Valid sound IDs.</summary>
	public HashSet<string> ValidSoundIds { get; init; } = [];
}

#endregion

#region Enums

/// <summary>
/// Cutscene type.
/// </summary>
public enum CutsceneType {
	/// <summary>Standard cutscene.</summary>
	Standard,
	/// <summary>Opening/intro cutscene.</summary>
	Intro,
	/// <summary>Ending cutscene.</summary>
	Ending,
	/// <summary>Boss introduction.</summary>
	BossIntro,
	/// <summary>Game over sequence.</summary>
	GameOver,
	/// <summary>Tutorial sequence.</summary>
	Tutorial,
	/// <summary>Flashback sequence.</summary>
	Flashback
}

/// <summary>
/// Cutscene trigger type.
/// </summary>
public enum CutsceneTrigger {
	/// <summary>Triggered manually/by code.</summary>
	Manual,
	/// <summary>Triggered on map enter.</summary>
	MapEnter,
	/// <summary>Triggered on map exit.</summary>
	MapExit,
	/// <summary>Triggered by tile interaction.</summary>
	TileInteract,
	/// <summary>Triggered by NPC interaction.</summary>
	NpcInteract,
	/// <summary>Triggered by item use.</summary>
	ItemUse,
	/// <summary>Triggered by event flag.</summary>
	EventFlag,
	/// <summary>Triggered by battle end.</summary>
	BattleEnd
}

/// <summary>
/// Command type.
/// </summary>
public enum CommandType {
	/// <summary>No operation.</summary>
	Nop,
	/// <summary>Display dialogue text.</summary>
	Dialogue,
	/// <summary>Move an actor.</summary>
	MoveActor,
	/// <summary>Set actor facing direction.</summary>
	FaceActor,
	/// <summary>Show/hide an actor.</summary>
	ShowActor,
	/// <summary>Play an animation.</summary>
	PlayAnimation,
	/// <summary>Play a sound effect.</summary>
	PlaySound,
	/// <summary>Play background music.</summary>
	PlayMusic,
	/// <summary>Stop music.</summary>
	StopMusic,
	/// <summary>Fade music.</summary>
	FadeMusic,
	/// <summary>Screen fade.</summary>
	ScreenFade,
	/// <summary>Screen flash.</summary>
	ScreenFlash,
	/// <summary>Screen shake.</summary>
	ScreenShake,
	/// <summary>Camera pan.</summary>
	CameraPan,
	/// <summary>Camera zoom.</summary>
	CameraZoom,
	/// <summary>Wait for duration.</summary>
	Wait,
	/// <summary>Wait for input.</summary>
	WaitInput,
	/// <summary>Set event flag.</summary>
	SetFlag,
	/// <summary>Give item to player.</summary>
	GiveItem,
	/// <summary>Give gold to player.</summary>
	GiveGold,
	/// <summary>Change map.</summary>
	ChangeMap,
	/// <summary>Goto label.</summary>
	Goto,
	/// <summary>Conditional goto.</summary>
	GotoIf,
	/// <summary>Call another cutscene.</summary>
	CallCutscene,
	/// <summary>End cutscene.</summary>
	End
}

/// <summary>
/// Validation error type.
/// </summary>
public enum CutsceneValidationErrorType {
	/// <summary>Cutscene not found.</summary>
	NotFound,
	/// <summary>Missing required field.</summary>
	MissingRequired,
	/// <summary>Invalid value.</summary>
	InvalidValue,
	/// <summary>Missing required parameter.</summary>
	MissingParameter,
	/// <summary>Invalid label reference.</summary>
	InvalidLabel
}

#endregion

#region Result Types

/// <summary>
/// Timeline entry.
/// </summary>
public record TimelineEntry {
	/// <summary>Command type.</summary>
	public CommandType CommandType { get; init; }

	/// <summary>Start frame.</summary>
	public int StartFrame { get; init; }

	/// <summary>End frame.</summary>
	public int EndFrame { get; init; }

	/// <summary>Display label.</summary>
	public required string Label { get; init; }
}

/// <summary>
/// Cutscene timeline representation.
/// </summary>
public record CutsceneTimeline {
	/// <summary>Cutscene ID.</summary>
	public required string CutsceneId { get; init; }

	/// <summary>Total frames.</summary>
	public int TotalFrames { get; init; }

	/// <summary>Timeline entries.</summary>
	public IReadOnlyList<TimelineEntry> Entries { get; init; } = [];
}

/// <summary>
/// Validation error.
/// </summary>
public record CutsceneValidationError {
	/// <summary>Error type.</summary>
	public CutsceneValidationErrorType Type { get; init; }

	/// <summary>Error message.</summary>
	public required string Message { get; init; }

	/// <summary>Command index (if applicable).</summary>
	public int? CommandIndex { get; init; }
}

/// <summary>
/// Validation result.
/// </summary>
public record CutsceneValidationResult {
	/// <summary>Cutscene ID.</summary>
	public required string CutsceneId { get; init; }

	/// <summary>Whether validation passed.</summary>
	public bool IsValid { get; init; }

	/// <summary>Validation errors.</summary>
	public IReadOnlyList<CutsceneValidationError> Errors { get; init; } = [];
}

/// <summary>
/// Cutscene statistics.
/// </summary>
public record CutsceneStats {
	/// <summary>Total cutscenes.</summary>
	public int TotalCutscenes { get; init; }

	/// <summary>Total commands.</summary>
	public int TotalCommands { get; init; }

	/// <summary>Total templates.</summary>
	public int TotalTemplates { get; init; }

	/// <summary>Count by cutscene type.</summary>
	public Dictionary<CutsceneType, int> ByType { get; init; } = [];

	/// <summary>Count by trigger type.</summary>
	public Dictionary<CutsceneTrigger, int> ByTrigger { get; init; } = [];

	/// <summary>Count by command type.</summary>
	public Dictionary<CommandType, int> CommandsByType { get; init; } = [];

	/// <summary>Average duration in seconds.</summary>
	public double AverageDurationSeconds { get; init; }

	/// <summary>Total duration in seconds.</summary>
	public double TotalDurationSeconds { get; init; }
}

/// <summary>
/// Export format.
/// </summary>
internal record CutsceneExport {
	public CutsceneSchema? Schema { get; init; }
	public Dictionary<string, CutsceneCommand> CommandTemplates { get; init; } = [];
	public List<Cutscene> Cutscenes { get; init; } = [];
}

#endregion
