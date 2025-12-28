using System.Collections.ObjectModel;
using System.Text;
using System.Text.Json;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
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
/// Represents a basic block in the control flow graph.
/// </summary>
public record ScriptBasicBlock(
	int Id,
	int StartOffset,
	int EndOffset,
	List<int> SuccessorIds,
	List<int> PredecessorIds,
	string Label,
	List<ScriptCommand> Commands,
	ScriptBlockType BlockType
);

/// <summary>
/// Type of basic block.
/// </summary>
public enum ScriptBlockType {
	Entry,          // First block of script
	Normal,         // Regular sequential block
	Conditional,    // Block ending with conditional branch
	Unconditional,  // Block ending with unconditional jump
	Call,           // Block ending with call instruction
	Return,         // Block ending with return
	Exit,           // Last block (END command)
	Loop            // Block that is part of a loop
}

/// <summary>
/// Control flow graph representation for visualization.
/// </summary>
public record ControlFlowGraph(
	List<ScriptBasicBlock> Blocks,
	List<ControlFlowEdge> Edges,
	int EntryBlockId,
	List<int> ExitBlockIds,
	List<List<int>> DetectedLoops
);

/// <summary>
/// Node position for graph layout.
/// </summary>
public record GraphNodePosition(int BlockId, double X, double Y, double Width, double Height);

/// <summary>
/// View model for viewing and editing game scripts/events.
/// </summary>
public partial class ScriptEditorViewModel : ViewModelBase, IKeyboardShortcutHandler {
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

	// === Control Flow Graph Visualization ===

	/// <summary>
	/// Whether the control flow graph panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showControlFlowGraph;

	/// <summary>
	/// Whether the basic blocks panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showBasicBlocks;

	/// <summary>
	/// The current control flow graph.
	/// </summary>
	[ObservableProperty]
	private ControlFlowGraph? _controlFlowGraph;

	/// <summary>
	/// Node positions for graph layout.
	/// </summary>
	public ObservableCollection<GraphNodePosition> NodePositions { get; } = [];

	/// <summary>
	/// Basic blocks from control flow analysis.
	/// </summary>
	public ObservableCollection<ScriptBasicBlock> BasicBlocks { get; } = [];

	/// <summary>
	/// Detected loops in the control flow.
	/// </summary>
	public ObservableCollection<string> DetectedLoops { get; } = [];

	/// <summary>
	/// Currently selected basic block.
	/// </summary>
	[ObservableProperty]
	private ScriptBasicBlock? _selectedBasicBlock;

	/// <summary>
	/// Graph layout algorithm.
	/// </summary>
	[ObservableProperty]
	private string _layoutAlgorithm = "Hierarchical";

	public string[] LayoutAlgorithms { get; } = [
		"Hierarchical",
		"Force-Directed",
		"Circular",
		"Tree"
	];

	/// <summary>
	/// Zoom level for the graph view.
	/// </summary>
	[ObservableProperty]
	private double _graphZoom = 1.0;

	/// <summary>
	/// Show edge labels on the graph.
	/// </summary>
	[ObservableProperty]
	private bool _showEdgeLabels = true;

	/// <summary>
	/// Show block addresses in graph nodes.
	/// </summary>
	[ObservableProperty]
	private bool _showBlockAddresses = true;

	/// <summary>
	/// Show command preview in graph nodes.
	/// </summary>
	[ObservableProperty]
	private bool _showCommandPreview = true;

	// === Search Properties ===

	/// <summary>
	/// Whether the search panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showSearchPanel;

	/// <summary>
	/// Current search text for command filtering.
	/// </summary>
	[ObservableProperty]
	private string _searchText = "";

	/// <summary>
	/// Current search result index in filtered commands.
	/// </summary>
	[ObservableProperty]
	private int _currentSearchIndex = -1;

	/// <summary>
	/// Total matches found.
	/// </summary>
	[ObservableProperty]
	private int _searchMatchCount;

	/// <summary>
	/// Filtered commands matching search.
	/// </summary>
	public ObservableCollection<ScriptCommand> SearchResults { get; } = [];

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

	/// <summary>
	/// Gets the clipboard from the current application's main window.
	/// </summary>
	private static Avalonia.Input.Platform.IClipboard? GetClipboard() {
		if (Application.Current?.ApplicationLifetime is Avalonia.Controls.ApplicationLifetimes.IClassicDesktopStyleApplicationLifetime desktop) {
			return desktop.MainWindow?.Clipboard;
		}

		return null;
	}

	/// <summary>
	/// Copy script as wikitext for Data Crystal documentation.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsWikitext() {
		var clipboard = GetClipboard();
		if (clipboard is null || Commands.Count == 0) {
			StatusText = "Nothing to copy";
			return;
		}

		var sb = new StringBuilder();
		sb.AppendLine($"=== Script at {{{{$|{ScriptOffset:x6}}}}} ===");
		sb.AppendLine($"; Type: {SelectedScriptType}");
		sb.AppendLine($"; Commands: {Commands.Count}");
		sb.AppendLine();
		sb.AppendLine("<pre>");

		foreach (var cmd in Commands) {
			sb.AppendLine(cmd.Disassembly);
		}

		sb.AppendLine("</pre>");

		// Add opcodes table if available
		if (Opcodes.Count > 0) {
			sb.AppendLine();
			sb.AppendLine("==== Opcodes ====");
			sb.AppendLine("{| class=\"wikitable\" border=\"1\"");
			sb.AppendLine("|-");
			sb.AppendLine("! Opcode !! Name !! Length !! Description");

			foreach (var op in Opcodes.Take(20)) { // Limit to first 20 for readability
				sb.AppendLine("|-");
				sb.AppendLine($"| {{{{$|{op.Code:x2}}}}} || {op.Name} || {op.Length} || {op.Description}");
			}

			if (Opcodes.Count > 20) {
				sb.AppendLine("|-");
				sb.AppendLine($"| colspan=\"4\" | ''... and {Opcodes.Count - 20} more opcodes''");
			}

			sb.AppendLine("|}");
		}

		await clipboard.SetTextAsync(sb.ToString());
		StatusText = $"Copied {Commands.Count} commands as wikitext";
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

	// === Control Flow Graph Commands ===

	/// <summary>
	/// Build the control flow graph from the current commands.
	/// </summary>
	[RelayCommand]
	private void BuildControlFlowGraph() {
		if (Commands.Count == 0) {
			StatusText = "No script loaded";
			return;
		}

		BasicBlocks.Clear();
		NodePositions.Clear();
		DetectedLoops.Clear();

		// Step 1: Identify block boundaries
		var blockStarts = new HashSet<int> { Commands[0].Offset };
		var blockEnds = new HashSet<int>();

		foreach (var cmd in Commands) {
			var opcodeInfo = Opcodes.FirstOrDefault(o => o.Code == cmd.Opcode);

			// Commands that end blocks
			if (opcodeInfo?.TerminatesBlock == true || opcodeInfo?.HasTarget == true) {
				blockEnds.Add(cmd.Offset);

				// Target of a branch/jump starts a new block
				if (opcodeInfo?.HasTarget == true && cmd.Operands.Length >= 2) {
					int target = cmd.Operands[0] | (cmd.Operands[1] << 8);
					blockStarts.Add(target);
				}

				// Instruction after a branch/jump starts a new block (for conditional branches)
				var cmdIndex = Commands.IndexOf(cmd);
				if (cmdIndex < Commands.Count - 1) {
					var nextCmd = Commands[cmdIndex + 1];
					if (opcodeInfo?.Name is not "JUMP" and not "END" and not "RET") {
						blockStarts.Add(nextCmd.Offset);
					}
				}
			}
		}

		// Step 2: Create basic blocks
		var sortedStarts = blockStarts.Where(s => Commands.Any(c => c.Offset == s)).OrderBy(s => s).ToList();
		int blockId = 0;

		for (int i = 0; i < sortedStarts.Count; i++) {
			var start = sortedStarts[i];
			var end = i < sortedStarts.Count - 1 ? sortedStarts[i + 1] : Commands.Last().Offset + 1;

			var blockCommands = Commands.Where(c => c.Offset >= start && c.Offset < end).ToList();
			if (blockCommands.Count == 0) continue;

			var lastCmd = blockCommands.Last();
			var lastOpcodeInfo = Opcodes.FirstOrDefault(o => o.Code == lastCmd.Opcode);

			var blockType = DetermineBlockType(lastOpcodeInfo, blockId == 0);
			var label = blockId == 0 ? "entry" : $"block_{start:x4}";

			BasicBlocks.Add(new ScriptBasicBlock(
				blockId,
				start,
				blockCommands.Last().Offset,
				new List<int>(),
				new List<int>(),
				label,
				blockCommands,
				blockType
			));

			blockId++;
		}

		// Step 3: Build edges between blocks
		var edges = new List<ControlFlowEdge>();

		foreach (var block in BasicBlocks) {
			var lastCmd = block.Commands.LastOrDefault();
			if (lastCmd is null) continue;

			var opcodeInfo = Opcodes.FirstOrDefault(o => o.Code == lastCmd.Opcode);

			// Find target block for branches/jumps
			if (opcodeInfo?.HasTarget == true && lastCmd.Operands.Length >= 2) {
				int targetOffset = lastCmd.Operands[0] | (lastCmd.Operands[1] << 8);
				var targetBlock = BasicBlocks.FirstOrDefault(b => b.StartOffset == targetOffset);

				if (targetBlock != null) {
					var edgeType = opcodeInfo.Name switch {
						"JUMP" => "Unconditional",
						"CALL" => "Call",
						_ => "Conditional"
					};

					edges.Add(new ControlFlowEdge(block.EndOffset, targetOffset, edgeType));

					// Update successors and predecessors
					UpdateBlockSuccessors(block.Id, targetBlock.Id);
				}
			}

			// Fall-through to next block (for conditional branches and calls)
			if (opcodeInfo is null || (!opcodeInfo.TerminatesBlock && opcodeInfo.Name != "JUMP")) {
				var nextBlock = BasicBlocks.FirstOrDefault(b => b.StartOffset > block.EndOffset);
				if (nextBlock != null) {
					edges.Add(new ControlFlowEdge(block.EndOffset, nextBlock.StartOffset, "Fallthrough"));
					UpdateBlockSuccessors(block.Id, nextBlock.Id);
				}
			}
		}

		// Step 4: Detect loops
		var loops = DetectLoopsInGraph();
		foreach (var loop in loops) {
			var loopStr = string.Join(" -> ", loop.Select(id => BasicBlocks.FirstOrDefault(b => b.Id == id)?.Label ?? $"block_{id}"));
			DetectedLoops.Add($"Loop: {loopStr}");
		}

		// Step 5: Layout the graph
		LayoutGraph();

		// Create the graph object
		ControlFlowGraph = new ControlFlowGraph(
			BasicBlocks.ToList(),
			edges,
			BasicBlocks.FirstOrDefault()?.Id ?? 0,
			BasicBlocks.Where(b => b.BlockType == ScriptBlockType.Exit).Select(b => b.Id).ToList(),
			loops
		);

		ShowControlFlowGraph = true;
		StatusText = $"Built CFG with {BasicBlocks.Count} blocks, {edges.Count} edges, {loops.Count} loops";
	}

	private static ScriptBlockType DetermineBlockType(ScriptOpcode? opcodeInfo, bool isEntry) {
		if (isEntry) return ScriptBlockType.Entry;
		if (opcodeInfo is null) return ScriptBlockType.Normal;

		return opcodeInfo.Name switch {
			"END" => ScriptBlockType.Exit,
			"RET" => ScriptBlockType.Return,
			"JUMP" => ScriptBlockType.Unconditional,
			"CALL" => ScriptBlockType.Call,
			"IF" or "CHECK" => ScriptBlockType.Conditional,
			_ when opcodeInfo.TerminatesBlock => ScriptBlockType.Exit,
			_ => ScriptBlockType.Normal
		};
	}

	private void UpdateBlockSuccessors(int fromId, int toId) {
		var fromBlock = BasicBlocks.FirstOrDefault(b => b.Id == fromId);
		var toBlock = BasicBlocks.FirstOrDefault(b => b.Id == toId);

		if (fromBlock != null && toBlock != null) {
			if (!fromBlock.SuccessorIds.Contains(toId)) {
				fromBlock.SuccessorIds.Add(toId);
			}

			if (!toBlock.PredecessorIds.Contains(fromId)) {
				toBlock.PredecessorIds.Add(fromId);
			}
		}
	}

	private List<List<int>> DetectLoopsInGraph() {
		var loops = new List<List<int>>();
		var visited = new HashSet<int>();
		var inStack = new HashSet<int>();
		var path = new List<int>();

		void Dfs(int blockId) {
			if (inStack.Contains(blockId)) {
				// Found a back edge - this is a loop
				var loopStart = path.IndexOf(blockId);
				if (loopStart >= 0) {
					var loop = path.Skip(loopStart).ToList();
					loop.Add(blockId); // Complete the cycle
					loops.Add(loop);
				}

				return;
			}

			if (visited.Contains(blockId)) return;

			visited.Add(blockId);
			inStack.Add(blockId);
			path.Add(blockId);

			var block = BasicBlocks.FirstOrDefault(b => b.Id == blockId);
			if (block != null) {
				foreach (var successorId in block.SuccessorIds) {
					Dfs(successorId);
				}
			}

			path.RemoveAt(path.Count - 1);
			inStack.Remove(blockId);
		}

		if (BasicBlocks.Count > 0) {
			Dfs(BasicBlocks[0].Id);
		}

		return loops;
	}

	/// <summary>
	/// Layout the graph nodes.
	/// </summary>
	[RelayCommand]
	private void LayoutGraph() {
		NodePositions.Clear();

		if (BasicBlocks.Count == 0) return;

		switch (LayoutAlgorithm) {
			case "Hierarchical":
				LayoutHierarchical();
				break;
			case "Force-Directed":
				LayoutForceDirected();
				break;
			case "Circular":
				LayoutCircular();
				break;
			case "Tree":
				LayoutTree();
				break;
			default:
				LayoutHierarchical();
				break;
		}
	}

	private void LayoutHierarchical() {
		// Simple hierarchical layout based on depth-first traversal
		const double nodeWidth = 150;
		const double nodeHeight = 80;
		const double horizontalSpacing = 50;
		const double verticalSpacing = 100;

		var visited = new HashSet<int>();
		var levels = new Dictionary<int, int>();
		var levelCounts = new Dictionary<int, int>();

		void AssignLevels(int blockId, int level) {
			if (visited.Contains(blockId)) {
				// Ensure we're at the deeper level
				if (levels.ContainsKey(blockId) && levels[blockId] < level) {
					levels[blockId] = level;
				}

				return;
			}

			visited.Add(blockId);
			levels[blockId] = level;

			if (!levelCounts.ContainsKey(level)) {
				levelCounts[level] = 0;
			}

			levelCounts[level]++;

			var block = BasicBlocks.FirstOrDefault(b => b.Id == blockId);
			if (block != null) {
				foreach (var successorId in block.SuccessorIds) {
					AssignLevels(successorId, level + 1);
				}
			}
		}

		if (BasicBlocks.Count > 0) {
			AssignLevels(BasicBlocks[0].Id, 0);
		}

		// Position nodes
		var levelPositions = new Dictionary<int, int>();
		foreach (var block in BasicBlocks) {
			int level = levels.ContainsKey(block.Id) ? levels[block.Id] : 0;
			int levelIndex = levelPositions.ContainsKey(level) ? levelPositions[level]++ : (levelPositions[level] = 1) - 1;

			double x = levelIndex * (nodeWidth + horizontalSpacing);
			double y = level * (nodeHeight + verticalSpacing);

			NodePositions.Add(new GraphNodePosition(block.Id, x, y, nodeWidth, nodeHeight));
		}
	}

	private void LayoutForceDirected() {
		// Simplified force-directed layout
		const double nodeWidth = 150;
		const double nodeHeight = 80;
		const int iterations = 50;
		const double repulsion = 10000;
		const double attraction = 0.05;

		var positions = BasicBlocks.ToDictionary(
			b => b.Id,
			b => (X: Random.Shared.NextDouble() * 500, Y: Random.Shared.NextDouble() * 500)
		);

		for (int iter = 0; iter < iterations; iter++) {
			var forces = BasicBlocks.ToDictionary(b => b.Id, _ => (X: 0.0, Y: 0.0));

			// Repulsion between all nodes
			foreach (var b1 in BasicBlocks) {
				foreach (var b2 in BasicBlocks) {
					if (b1.Id == b2.Id) continue;

					var dx = positions[b1.Id].X - positions[b2.Id].X;
					var dy = positions[b1.Id].Y - positions[b2.Id].Y;
					var dist = Math.Sqrt((dx * dx) + (dy * dy)) + 0.1;

					var force = repulsion / (dist * dist);
					forces[b1.Id] = (forces[b1.Id].X + (force * dx / dist), forces[b1.Id].Y + (force * dy / dist));
				}
			}

			// Attraction along edges
			foreach (var block in BasicBlocks) {
				foreach (var successorId in block.SuccessorIds) {
					var dx = positions[successorId].X - positions[block.Id].X;
					var dy = positions[successorId].Y - positions[block.Id].Y;

					forces[block.Id] = (forces[block.Id].X + (attraction * dx), forces[block.Id].Y + (attraction * dy));
					forces[successorId] = (forces[successorId].X - (attraction * dx), forces[successorId].Y - (attraction * dy));
				}
			}

			// Apply forces
			foreach (var block in BasicBlocks) {
				positions[block.Id] = (
					positions[block.Id].X + (forces[block.Id].X * 0.1),
					positions[block.Id].Y + (forces[block.Id].Y * 0.1)
				);
			}
		}

		// Normalize positions to positive coordinates
		var minX = positions.Values.Min(p => p.X);
		var minY = positions.Values.Min(p => p.Y);

		foreach (var block in BasicBlocks) {
			NodePositions.Add(new GraphNodePosition(
				block.Id,
				positions[block.Id].X - minX,
				positions[block.Id].Y - minY,
				nodeWidth,
				nodeHeight
			));
		}
	}

	private void LayoutCircular() {
		const double nodeWidth = 150;
		const double nodeHeight = 80;
		double radius = Math.Max(BasicBlocks.Count * 50, 200);
		double centerX = radius + (nodeWidth / 2);
		double centerY = radius + (nodeHeight / 2);

		for (int i = 0; i < BasicBlocks.Count; i++) {
			var angle = (2 * Math.PI * i / BasicBlocks.Count) - (Math.PI / 2);
			var x = centerX + (radius * Math.Cos(angle)) - (nodeWidth / 2);
			var y = centerY + (radius * Math.Sin(angle)) - (nodeHeight / 2);

			NodePositions.Add(new GraphNodePosition(BasicBlocks[i].Id, x, y, nodeWidth, nodeHeight));
		}
	}

	private void LayoutTree() {
		// Tree layout - similar to hierarchical but with different spacing
		const double nodeWidth = 150;
		const double nodeHeight = 80;
		const double verticalSpacing = 100;

		var visited = new HashSet<int>();
		var positions = new Dictionary<int, (double X, double Y)>();
		double nextX = 0;

		void LayoutSubtree(int blockId, int depth) {
			if (visited.Contains(blockId)) return;
			visited.Add(blockId);

			var block = BasicBlocks.FirstOrDefault(b => b.Id == blockId);
			if (block is null) return;

			var children = block.SuccessorIds.Where(id => !visited.Contains(id)).ToList();

			if (children.Count == 0) {
				positions[blockId] = (nextX, depth * (nodeHeight + verticalSpacing));
				nextX += nodeWidth + 30;
			} else {
				double startX = nextX;
				foreach (var childId in children) {
					LayoutSubtree(childId, depth + 1);
				}

				double endX = nextX;
				positions[blockId] = ((startX + endX - nodeWidth - 30) / 2, depth * (nodeHeight + verticalSpacing));
			}
		}

		if (BasicBlocks.Count > 0) {
			LayoutSubtree(BasicBlocks[0].Id, 0);
		}

		foreach (var kvp in positions) {
			NodePositions.Add(new GraphNodePosition(kvp.Key, kvp.Value.X, kvp.Value.Y, nodeWidth, nodeHeight));
		}
	}

	/// <summary>
	/// Select a basic block.
	/// </summary>
	[RelayCommand]
	private void SelectBasicBlock(ScriptBasicBlock? block) {
		SelectedBasicBlock = block;

		if (block != null) {
			// Also select the first command in the block
			SelectedCommand = block.Commands.FirstOrDefault();
			StatusText = $"Selected block '{block.Label}' with {block.Commands.Count} commands";
		}
	}

	/// <summary>
	/// Export the control flow graph as DOT format.
	/// </summary>
	[RelayCommand]
	private async Task ExportGraphAsDot(Window? window) {
		if (window is null || BasicBlocks.Count == 0) {
			StatusText = "No graph to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Control Flow Graph",
			".dot",
			$"cfg_{ScriptOffset:X6}.dot",
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var sb = new StringBuilder();
			sb.AppendLine("digraph ControlFlowGraph {");
			sb.AppendLine("  node [shape=box, fontname=\"Courier\"];");
			sb.AppendLine("  edge [fontname=\"Arial\"];");
			sb.AppendLine();

			// Nodes
			foreach (var block in BasicBlocks) {
				var color = block.BlockType switch {
					ScriptBlockType.Entry => "green",
					ScriptBlockType.Exit => "red",
					ScriptBlockType.Conditional => "yellow",
					ScriptBlockType.Loop => "orange",
					_ => "white"
				};

				var label = ShowBlockAddresses
					? $"{block.Label}\\n[{block.StartOffset:X4}-{block.EndOffset:X4}]"
					: block.Label;

				if (ShowCommandPreview && block.Commands.Count > 0) {
					var cmdPreview = block.Commands.Take(3).Select(c => c.Name).ToList();
					label += $"\\n{string.Join(", ", cmdPreview)}";
					if (block.Commands.Count > 3) label += "...";
				}

				sb.AppendLine($"  block_{block.Id} [label=\"{label}\", fillcolor=\"{color}\", style=\"filled\"];");
			}

			sb.AppendLine();

			// Edges
			if (ControlFlowGraph != null) {
				foreach (var edge in ControlFlowGraph.Edges) {
					var fromBlock = BasicBlocks.FirstOrDefault(b => b.EndOffset == edge.FromOffset);
					var toBlock = BasicBlocks.FirstOrDefault(b => b.StartOffset == edge.ToOffset);

					if (fromBlock != null && toBlock != null) {
						var edgeStyle = edge.Type switch {
							"Conditional" => "style=dashed",
							"Call" => "style=dotted",
							"Fallthrough" => "color=gray",
							_ => ""
						};

						var label = ShowEdgeLabels && edge.Type != "Fallthrough" ? $"label=\"{edge.Type}\"" : "";
						sb.AppendLine($"  block_{fromBlock.Id} -> block_{toBlock.Id} [{edgeStyle} {label}];");
					}
				}
			}

			sb.AppendLine("}");

			await File.WriteAllTextAsync(path, sb.ToString());
			StatusText = $"Exported CFG to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	/// <summary>
	/// Zoom in on the graph.
	/// </summary>
	[RelayCommand]
	private void ZoomIn() {
		GraphZoom = Math.Min(GraphZoom * 1.25, 4.0);
	}

	/// <summary>
	/// Zoom out on the graph.
	/// </summary>
	[RelayCommand]
	private void ZoomOut() {
		GraphZoom = Math.Max(GraphZoom / 1.25, 0.25);
	}

	/// <summary>
	/// Reset zoom to 100%.
	/// </summary>
	[RelayCommand]
	private void ResetZoom() {
		GraphZoom = 1.0;
	}

	/// <summary>
	/// Toggle the control flow graph panel.
	/// </summary>
	[RelayCommand]
	private void ToggleControlFlowGraph() {
		ShowControlFlowGraph = !ShowControlFlowGraph;

		if (ShowControlFlowGraph && BasicBlocks.Count == 0 && Commands.Count > 0) {
			BuildControlFlowGraph();
		}
	}

	#region Search

	/// <summary>
	/// Execute search on commands.
	/// </summary>
	[RelayCommand]
	private void ExecuteSearch() {
		SearchResults.Clear();
		CurrentSearchIndex = -1;

		if (string.IsNullOrWhiteSpace(SearchText)) {
			SearchMatchCount = 0;
			return;
		}

		var searchLower = SearchText.ToLowerInvariant();

		foreach (var cmd in Commands) {
			bool matches = cmd.Name.Contains(searchLower, StringComparison.OrdinalIgnoreCase)
				|| cmd.Description.Contains(searchLower, StringComparison.OrdinalIgnoreCase)
				|| $"${cmd.Offset:x4}".Contains(searchLower, StringComparison.OrdinalIgnoreCase)
				|| $"{cmd.Opcode:x2}".Contains(searchLower, StringComparison.OrdinalIgnoreCase);

			if (matches) {
				SearchResults.Add(cmd);
			}
		}

		SearchMatchCount = SearchResults.Count;

		if (SearchResults.Count > 0) {
			CurrentSearchIndex = 0;
			SelectedCommand = SearchResults[0];
			StatusText = $"Found {SearchMatchCount} matches";
		} else {
			StatusText = "No matches found";
		}
	}

	/// <summary>
	/// Go to next search result.
	/// </summary>
	[RelayCommand]
	private void SearchNext() {
		if (SearchResults.Count == 0) {
			ExecuteSearch();
			return;
		}

		CurrentSearchIndex = (CurrentSearchIndex + 1) % SearchResults.Count;
		SelectedCommand = SearchResults[CurrentSearchIndex];
		StatusText = $"Match {CurrentSearchIndex + 1} of {SearchMatchCount}";
	}

	/// <summary>
	/// Go to previous search result.
	/// </summary>
	[RelayCommand]
	private void SearchPrevious() {
		if (SearchResults.Count == 0) {
			ExecuteSearch();
			return;
		}

		CurrentSearchIndex = CurrentSearchIndex <= 0 ? SearchResults.Count - 1 : CurrentSearchIndex - 1;
		SelectedCommand = SearchResults[CurrentSearchIndex];
		StatusText = $"Match {CurrentSearchIndex + 1} of {SearchMatchCount}";
	}

	/// <summary>
	/// Close the search panel.
	/// </summary>
	[RelayCommand]
	private void CloseSearchPanel() {
		ShowSearchPanel = false;
	}

	/// <summary>
	/// Toggle the search panel visibility.
	/// </summary>
	[RelayCommand]
	private void ToggleSearchPanel() {
		ShowSearchPanel = !ShowSearchPanel;
	}

	/// <summary>
	/// Called when search text changes.
	/// </summary>
	partial void OnSearchTextChanged(string value) {
		// Auto-search on text change if panel is visible
		if (ShowSearchPanel && !string.IsNullOrEmpty(value)) {
			ExecuteSearch();
		}
	}

	#endregion

	#region IKeyboardShortcutHandler

	/// <summary>
	/// Handle keyboard shortcuts for the script editor.
	/// </summary>
	public bool HandleKeyDown(KeyEventArgs e) {
		// Find (Ctrl+F)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Find)) {
			ShowSearchPanel = true;
			e.Handled = true;
			return true;
		}

		// Go to offset (Ctrl+G)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.GoTo)) {
			// TODO: Open go to dialog
			StatusText = "Go to offset (Ctrl+G) - coming soon";
			e.Handled = true;
			return true;
		}

		// Load script (Ctrl+Enter)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.LoadScript)) {
			LoadScript();
			e.Handled = true;
			return true;
		}

		// Build CFG (Ctrl+Shift+G)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.BuildCFG)) {
			BuildControlFlowGraph();
			e.Handled = true;
			return true;
		}

		// Validate/Refresh (F5)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ValidateScript)) {
			ValidateScript();
			e.Handled = true;
			return true;
		}

		// Toggle control flow panel (Ctrl+Alt+G)
		if (e.Key == Key.G && e.KeyModifiers == (KeyModifiers.Control | KeyModifiers.Alt)) {
			ToggleControlFlowGraph();
			e.Handled = true;
			return true;
		}

		// Toggle basic blocks panel (Ctrl+Alt+B)
		if (e.Key == Key.B && e.KeyModifiers == (KeyModifiers.Control | KeyModifiers.Alt)) {
			ShowBasicBlocks = !ShowBasicBlocks;
			e.Handled = true;
			return true;
		}

		// Find next (F3)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindNext)) {
			SearchNext();
			e.Handled = true;
			return true;
		}

		// Find previous (Shift+F3)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindPrevious)) {
			SearchPrevious();
			e.Handled = true;
			return true;
		}

		// Escape - close search panel
		if (e.Key == Key.Escape) {
			if (ShowSearchPanel) {
				ShowSearchPanel = false;
				e.Handled = true;
				return true;
			}
		}

		return false;
	}

	#endregion
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
