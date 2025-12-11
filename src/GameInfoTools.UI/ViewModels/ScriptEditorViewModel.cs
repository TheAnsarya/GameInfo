using System.Collections.ObjectModel;
using System.Text;
using System.Text.Json;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Represents a potential script location found during search.
/// </summary>
public record ScriptLocation(int Offset, string Description, int Confidence, string Preview);

/// <summary>
/// Represents a control flow edge in the script.
/// </summary>
public record ControlFlowEdge(int FromOffset, int ToOffset, string Type);

/// <summary>
/// Represents a script reference (call or jump).
/// </summary>
public record ScriptReference(int CallerOffset, int TargetOffset, string ReferenceType);

/// <summary>
/// View model for viewing and editing game scripts/events.
/// </summary>
public partial class ScriptEditorViewModel : ViewModelBase {
	private readonly RomFile? _rom;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private string _scriptName = "";

	[ObservableProperty]
	private int _scriptOffset;

	[ObservableProperty]
	private int _scriptLength = 256;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _rawHex = "";

	[ObservableProperty]
	private string _disassembledScript = "";

	[ObservableProperty]
	private ScriptCommand? _selectedCommand;

	// Script analysis
	[ObservableProperty]
	private int _totalBytes;

	[ObservableProperty]
	private int _uniqueOpcodes;

	[ObservableProperty]
	private bool _hasErrors;

	[ObservableProperty]
	private string _validationResult = "";

	// Search results
	public ObservableCollection<ScriptLocation> FoundScripts { get; } = [];

	// Control flow
	public ObservableCollection<ControlFlowEdge> ControlFlowEdges { get; } = [];

	// Script references (calls and jumps)
	public ObservableCollection<ScriptReference> ScriptReferences { get; } = [];

	public ObservableCollection<ScriptCommand> Commands { get; } = [];

	public ObservableCollection<ScriptOpcode> Opcodes { get; } = [];

	// Opcode table source
	[ObservableProperty]
	private string _opcodeTableSource = "Built-in Generic";

	[ObservableProperty]
	private string _selectedScriptType = "Generic Event";

	public string[] ScriptTypes { get; } = [
		"Generic Event",
		"Dialog Script",
		"AI Script",
		"Shop Script",
		"Battle Script",
		"Movement Script",
		"Custom"
	];

	public ScriptEditorViewModel(RomFile? rom = null) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;
		InitializeOpcodes();
	}

	private void InitializeOpcodes() {
		// Initialize with common script opcodes (generic)
		Opcodes.Clear();

		// These are typical script command patterns
		Opcodes.Add(new ScriptOpcode(0x00, "END", 1, "End script", true));
		Opcodes.Add(new ScriptOpcode(0x01, "WAIT", 2, "Wait N frames", false));
		Opcodes.Add(new ScriptOpcode(0x02, "JUMP", 3, "Jump to address", true, true));
		Opcodes.Add(new ScriptOpcode(0x03, "CALL", 3, "Call subroutine", false, true));
		Opcodes.Add(new ScriptOpcode(0x04, "RET", 1, "Return from call", true));
		Opcodes.Add(new ScriptOpcode(0x05, "IF", 4, "Conditional branch", false, true));
		Opcodes.Add(new ScriptOpcode(0x06, "SET", 3, "Set variable", false));
		Opcodes.Add(new ScriptOpcode(0x07, "ADD", 3, "Add to variable", false));
		Opcodes.Add(new ScriptOpcode(0x08, "SUB", 3, "Subtract from variable", false));
		Opcodes.Add(new ScriptOpcode(0x09, "MSG", 3, "Display message", false));
		Opcodes.Add(new ScriptOpcode(0x0a, "CHOICE", 4, "Show choice menu", false));
		Opcodes.Add(new ScriptOpcode(0x0b, "GIVE", 2, "Give item", false));
		Opcodes.Add(new ScriptOpcode(0x0c, "TAKE", 2, "Take item", false));
		Opcodes.Add(new ScriptOpcode(0x0d, "FLAG", 2, "Set flag", false));
		Opcodes.Add(new ScriptOpcode(0x0e, "CHECK", 3, "Check flag", false, true));
		Opcodes.Add(new ScriptOpcode(0x0f, "MOVE", 4, "Move character", false));

		OpcodeTableSource = "Built-in Generic";
	}

	[RelayCommand]
	private void LoadScript() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		if (ScriptOffset < 0 || ScriptOffset >= _rom.Length) {
			StatusText = "Invalid script offset";
			return;
		}

		try {
			var data = _rom.AsSpan();
			int endOffset = Math.Min(ScriptOffset + ScriptLength, _rom.Length);
			int actualLength = endOffset - ScriptOffset;

			// Get raw hex
			var hexBuilder = new StringBuilder();
			for (int i = 0; i < actualLength; i++) {
				if (i > 0 && i % 16 == 0) hexBuilder.AppendLine();
				hexBuilder.Append($"{data[ScriptOffset + i]:x2} ");
			}

			RawHex = hexBuilder.ToString();

			// Disassemble script
			Commands.Clear();
			ControlFlowEdges.Clear();
			ScriptReferences.Clear();

			var usedOpcodes = new HashSet<byte>();
			int offset = ScriptOffset;
			int byteCount = 0;

			while (offset < endOffset) {
				byte opcode = data[offset];
				usedOpcodes.Add(opcode);

				var opcodeInfo = Opcodes.FirstOrDefault(o => o.Code == opcode);

				int cmdLength = opcodeInfo?.Length ?? 1;
				var operands = new List<byte>();

				for (int i = 1; i < cmdLength && offset + i < endOffset; i++) {
					operands.Add(data[offset + i]);
				}

				var cmd = new ScriptCommand(
					offset,
					opcode,
					opcodeInfo?.Name ?? $"UNK_{opcode:X2}",
					[.. operands],
					opcodeInfo?.Description ?? "Unknown command"
				);
				Commands.Add(cmd);
				byteCount += cmdLength;

				// Track control flow for branches and jumps
				if (opcodeInfo?.HasTarget == true && operands.Count >= 2) {
					int targetOffset = operands[0] | (operands[1] << 8);
					var edgeType = opcodeInfo.Name switch {
						"JUMP" => "Unconditional",
						"CALL" => "Call",
						"IF" or "CHECK" => "Conditional",
						_ => "Unknown"
					};

					ControlFlowEdges.Add(new ControlFlowEdge(offset, targetOffset, edgeType));
					ScriptReferences.Add(new ScriptReference(offset, targetOffset, opcodeInfo.Name));
				}

				if (opcodeInfo?.TerminatesBlock == true) {
					if (opcode == 0x00) break; // END command
				}

				offset += cmdLength;
			}

			// Update statistics
			TotalBytes = byteCount;
			UniqueOpcodes = usedOpcodes.Count;

			ScriptName = $"Script at 0x{ScriptOffset:X6}";
			StatusText = $"Loaded {Commands.Count} commands ({byteCount} bytes, {usedOpcodes.Count} unique opcodes)";

			// Generate disassembly text
			var disasmBuilder = new StringBuilder();
			foreach (var cmd in Commands) {
				disasmBuilder.AppendLine(cmd.Disassembly);
			}

			DisassembledScript = disasmBuilder.ToString();

			// Validate script
			ValidateScript();

		} catch (Exception ex) {
			StatusText = $"Error loading script: {ex.Message}";
		}
	}

	[RelayCommand]
	private void SelectCommand(ScriptCommand? command) {
		if (command is null) return;
		SelectedCommand = command;
		StatusText = $"Selected: {command.Name} @ 0x{command.Offset:X6}";
	}

	[RelayCommand]
	private void ValidateScript() {
		if (Commands.Count == 0) {
			ValidationResult = "No script loaded";
			HasErrors = false;
			return;
		}

		var errors = new List<string>();
		var warnings = new List<string>();

		// Check for valid termination
		var lastCmd = Commands[^1];
		var lastOpcode = Opcodes.FirstOrDefault(o => o.Code == lastCmd.Opcode);
		if (lastOpcode?.TerminatesBlock != true) {
			warnings.Add($"Script does not end with a terminating command");
		}

		// Check for unknown opcodes
		int unknownCount = Commands.Count(c => c.Name.StartsWith("UNK_"));
		if (unknownCount > 0) {
			warnings.Add($"{unknownCount} unknown opcode(s) found");
		}

		// Check for out-of-bounds jumps
		foreach (var edge in ControlFlowEdges) {
			if (edge.ToOffset < 0 || (_rom is not null && edge.ToOffset >= _rom.Length)) {
				errors.Add($"Invalid jump target at 0x{edge.FromOffset:X6} -> 0x{edge.ToOffset:X6}");
			}
		}

		// Check for self-referential jumps (infinite loops)
		var selfLoops = ControlFlowEdges.Where(e => e.FromOffset == e.ToOffset).ToList();
		if (selfLoops.Count > 0) {
			warnings.Add($"{selfLoops.Count} potential infinite loop(s) detected");
		}

		HasErrors = errors.Count > 0;

		var result = new StringBuilder();
		if (errors.Count == 0 && warnings.Count == 0) {
			result.AppendLine("✓ Script validation passed");
		} else {
			if (errors.Count > 0) {
				result.AppendLine("Errors:");
				foreach (var e in errors) result.AppendLine($"  ✗ {e}");
			}

			if (warnings.Count > 0) {
				result.AppendLine("Warnings:");
				foreach (var w in warnings) result.AppendLine($"  ⚠ {w}");
			}
		}

		ValidationResult = result.ToString();
	}

	[RelayCommand]
	private void GoToReference(ScriptReference? reference) {
		if (reference is null || _rom is null) return;

		ScriptOffset = reference.TargetOffset;
		LoadScript();
		StatusText = $"Navigated to reference target at 0x{reference.TargetOffset:X6}";
	}

	[RelayCommand]
	private async Task ExportScript(Window? window) {
		if (window is null || Commands.Count == 0) {
			StatusText = "Nothing to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Script",
			".txt",
			$"script_{ScriptOffset:X6}.txt",
			FileDialogService.TextFiles,
			FileDialogService.JsonFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var sb = new StringBuilder();
			sb.AppendLine($"; Script at 0x{ScriptOffset:X6}");
			sb.AppendLine($"; Type: {SelectedScriptType}");
			sb.AppendLine($"; Commands: {Commands.Count}");
			sb.AppendLine();

			foreach (var cmd in Commands) {
				sb.AppendLine(cmd.Disassembly);
			}

			await File.WriteAllTextAsync(path, sb.ToString());
			StatusText = $"Exported script to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task LoadOpcodeTable(Window? window) {
		if (window is null) {
			StatusText = "Unable to open file dialog";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Load Opcode Table",
			FileDialogService.JsonFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var json = await File.ReadAllTextAsync(path);
			var opcodeData = JsonSerializer.Deserialize<OpcodeTableData>(json, new JsonSerializerOptions {
				PropertyNameCaseInsensitive = true
			});

			if (opcodeData?.Opcodes is null) {
				StatusText = "Invalid opcode table format";
				return;
			}

			Opcodes.Clear();
			foreach (var op in opcodeData.Opcodes) {
				Opcodes.Add(new ScriptOpcode(
					(byte)op.Code,
					op.Name,
					op.Length,
					op.Description ?? "",
					op.TerminatesBlock,
					op.HasTarget
				));
			}

			OpcodeTableSource = Path.GetFileName(path);
			StatusText = $"Loaded {Opcodes.Count} opcodes from {OpcodeTableSource}";

			// Re-disassemble if we have a script loaded
			if (Commands.Count > 0) {
				LoadScript();
			}
		} catch (Exception ex) {
			StatusText = $"Error loading opcode table: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task SaveOpcodeTable(Window? window) {
		if (window is null || Opcodes.Count == 0) {
			StatusText = "No opcodes to save";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Save Opcode Table",
			".json",
			"opcode_table.json",
			FileDialogService.JsonFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var opcodeData = new OpcodeTableData {
				Name = SelectedScriptType,
				Description = $"Opcode table for {SelectedScriptType}",
				Opcodes = Opcodes.Select(o => new OpcodeDefinition {
					Code = o.Code,
					Name = o.Name,
					Length = o.Length,
					Description = o.Description,
					TerminatesBlock = o.TerminatesBlock,
					HasTarget = o.HasTarget
				}).ToList()
			};

			var json = JsonSerializer.Serialize(opcodeData, new JsonSerializerOptions {
				WriteIndented = true
			});

			await File.WriteAllTextAsync(path, json);
			StatusText = $"Saved opcode table to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Error saving opcode table: {ex.Message}";
		}
	}

	[RelayCommand]
	private void FindScripts() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		FoundScripts.Clear();
		var data = _rom.AsSpan();

		// Build a frequency map of opcodes for confidence scoring
		var opcodeSet = new HashSet<byte>(Opcodes.Select(o => o.Code));

		for (int i = 0; i < data.Length - 8; i++) {
			// Calculate confidence based on how many known opcodes appear in sequence
			int confidence = 0;
			int validCommands = 0;
			int offset = i;
			var preview = new StringBuilder();

			for (int j = 0; j < 8 && offset < data.Length; j++) {
				byte opcode = data[offset];
				var opcodeInfo = Opcodes.FirstOrDefault(o => o.Code == opcode);

				if (opcodeInfo is not null) {
					confidence += 10;
					validCommands++;
					if (j < 3) preview.Append($"{opcodeInfo.Name} ");
					offset += opcodeInfo.Length;
				} else if (opcodeSet.Contains(opcode)) {
					confidence += 5;
					offset++;
				} else {
					// Unknown opcode reduces confidence
					confidence -= 3;
					offset++;
				}

				// Early termination boost
				if (opcodeInfo?.TerminatesBlock == true && j > 0) {
					confidence += 15;
					break;
				}
			}

			// Only report high-confidence matches
			if (confidence >= 30 && validCommands >= 2) {
				var description = $"{validCommands} known commands";
				FoundScripts.Add(new ScriptLocation(i, description, confidence, preview.ToString().Trim()));
			}
		}

		// Sort by confidence
		var sorted = FoundScripts.OrderByDescending(s => s.Confidence).Take(100).ToList();
		FoundScripts.Clear();
		foreach (var s in sorted) {
			FoundScripts.Add(s);
		}

		StatusText = $"Found {FoundScripts.Count} potential script locations";
	}

	[RelayCommand]
	private void GoToScriptLocation(ScriptLocation? location) {
		if (location is null) return;

		ScriptOffset = location.Offset;
		LoadScript();
		StatusText = $"Loaded script at 0x{location.Offset:X6}";
	}

	[RelayCommand]
	private void FindScriptsByPattern(string pattern) {
		if (_rom is null || !_rom.IsLoaded || string.IsNullOrWhiteSpace(pattern)) return;

		FoundScripts.Clear();
		var data = _rom.AsSpan();

		// Parse command pattern (e.g., "MSG,WAIT,END" or "09,01,00")
		var parts = pattern.Split(',', StringSplitOptions.RemoveEmptyEntries);
		var searchOpcodes = new List<byte>();

		foreach (var part in parts) {
			var trimmed = part.Trim();
			// Try to match by name first
			var opcodeByName = Opcodes.FirstOrDefault(o =>
				o.Name.Equals(trimmed, StringComparison.OrdinalIgnoreCase));

			if (opcodeByName is not null) {
				searchOpcodes.Add(opcodeByName.Code);
			} else if (byte.TryParse(trimmed, System.Globalization.NumberStyles.HexNumber, null, out var hexCode)) {
				searchOpcodes.Add(hexCode);
			}
		}

		if (searchOpcodes.Count == 0) {
			StatusText = "Invalid pattern";
			return;
		}

		// Search for the pattern
		for (int i = 0; i <= data.Length - searchOpcodes.Count; i++) {
			int offset = i;
			bool match = true;

			foreach (var searchCode in searchOpcodes) {
				if (offset >= data.Length || data[offset] != searchCode) {
					match = false;
					break;
				}

				byte currentByte = data[offset];
				var opcodeInfo = Opcodes.FirstOrDefault(o => o.Code == currentByte);
				offset += opcodeInfo?.Length ?? 1;
			}

			if (match) {
				var previewParts = new List<string>();
				foreach (var c in searchOpcodes) {
					var info = Opcodes.FirstOrDefault(o => o.Code == c);
					previewParts.Add(info?.Name ?? $"${c:X2}");
				}

				var preview = string.Join(" ", previewParts);
				FoundScripts.Add(new ScriptLocation(i, $"Pattern match", 100, preview));
			}
		}

		StatusText = $"Found {FoundScripts.Count} scripts matching pattern";
	}

	[RelayCommand]
	private void AddCustomOpcode(string definition) {
		// Parse format: "XX,NAME,LENGTH,DESCRIPTION"
		var parts = definition.Split(',', 4);
		if (parts.Length < 3) {
			StatusText = "Invalid format. Use: XX,NAME,LENGTH[,DESCRIPTION]";
			return;
		}

		if (!byte.TryParse(parts[0].Trim(), System.Globalization.NumberStyles.HexNumber, null, out var code)) {
			StatusText = "Invalid opcode hex value";
			return;
		}

		if (!int.TryParse(parts[2].Trim(), out var length) || length < 1) {
			StatusText = "Invalid length";
			return;
		}

		var name = parts[1].Trim();
		var description = parts.Length >= 4 ? parts[3].Trim() : "";

		// Remove existing if present
		var existing = Opcodes.FirstOrDefault(o => o.Code == code);
		if (existing is not null) {
			Opcodes.Remove(existing);
		}

		Opcodes.Add(new ScriptOpcode(code, name, length, description, false, false));
		StatusText = $"Added opcode 0x{code:X2} = {name}";
	}
}

/// <summary>
/// Represents an opcode definition.
/// </summary>
public record ScriptOpcode(
	byte Code,
	string Name,
	int Length,
	string Description,
	bool TerminatesBlock = false,
	bool HasTarget = false
);

/// <summary>
/// JSON-serializable opcode table data.
/// </summary>
public class OpcodeTableData {
	public string Name { get; set; } = "";
	public string Description { get; set; } = "";
	public List<OpcodeDefinition> Opcodes { get; set; } = [];
}

/// <summary>
/// JSON-serializable opcode definition.
/// </summary>
public class OpcodeDefinition {
	public int Code { get; set; }
	public string Name { get; set; } = "";
	public int Length { get; set; }
	public string? Description { get; set; }
	public bool TerminatesBlock { get; set; }
	public bool HasTarget { get; set; }
}

/// <summary>
/// Represents a disassembled script command.
/// </summary>
public record ScriptCommand(int Offset, byte Opcode, string Name, byte[] Operands, string Description) {
	public string Disassembly {
		get {
			var sb = new StringBuilder();
			sb.Append($"${Offset:X6}:  {Opcode:X2}");

			foreach (var op in Operands) {
				sb.Append($" {op:X2}");
			}

			sb.Append($"  ; {Name}");

			if (Operands.Length > 0) {
				sb.Append(' ');
				if (Operands.Length == 1) {
					sb.Append($"#${Operands[0]:X2}");
				} else if (Operands.Length == 2) {
					sb.Append($"${Operands[1]:X2}{Operands[0]:X2}");
				} else {
					sb.Append(string.Join(", ", Operands.Select(o => $"${o:X2}")));
				}
			}

			return sb.ToString();
		}
	}
}
