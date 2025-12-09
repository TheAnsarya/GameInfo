using System.Collections.ObjectModel;
using System.Text;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

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

	public ObservableCollection<ScriptCommand> Commands { get; } = [];

	public ObservableCollection<ScriptOpcode> Opcodes { get; } = [];

	[ObservableProperty]
	private string _selectedScriptType = "Generic Event";

	public string[] ScriptTypes { get; } = [
		"Generic Event",
		"Dialog Script",
		"AI Script",
		"Shop Script",
		"Battle Script",
		"Movement Script"
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
		Opcodes.Add(new ScriptOpcode(0x00, "END", 1, "End script"));
		Opcodes.Add(new ScriptOpcode(0x01, "WAIT", 2, "Wait N frames"));
		Opcodes.Add(new ScriptOpcode(0x02, "JUMP", 3, "Jump to address"));
		Opcodes.Add(new ScriptOpcode(0x03, "CALL", 3, "Call subroutine"));
		Opcodes.Add(new ScriptOpcode(0x04, "RET", 1, "Return from call"));
		Opcodes.Add(new ScriptOpcode(0x05, "IF", 4, "Conditional branch"));
		Opcodes.Add(new ScriptOpcode(0x06, "SET", 3, "Set variable"));
		Opcodes.Add(new ScriptOpcode(0x07, "ADD", 3, "Add to variable"));
		Opcodes.Add(new ScriptOpcode(0x08, "SUB", 3, "Subtract from variable"));
		Opcodes.Add(new ScriptOpcode(0x09, "MSG", 3, "Display message"));
		Opcodes.Add(new ScriptOpcode(0x0a, "CHOICE", 4, "Show choice menu"));
		Opcodes.Add(new ScriptOpcode(0x0b, "GIVE", 2, "Give item"));
		Opcodes.Add(new ScriptOpcode(0x0c, "TAKE", 2, "Take item"));
		Opcodes.Add(new ScriptOpcode(0x0d, "FLAG", 2, "Set flag"));
		Opcodes.Add(new ScriptOpcode(0x0e, "CHECK", 3, "Check flag"));
		Opcodes.Add(new ScriptOpcode(0x0f, "MOVE", 4, "Move character"));
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
			int offset = ScriptOffset;

			while (offset < endOffset) {
				byte opcode = data[offset];
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

				if (opcode == 0x00) break; // END command

				offset += cmdLength;
			}

			ScriptName = $"Script at 0x{ScriptOffset:X6}";
			StatusText = $"Loaded {Commands.Count} commands";

			// Generate disassembly text
			var disasmBuilder = new StringBuilder();
			foreach (var cmd in Commands) {
				disasmBuilder.AppendLine(cmd.Disassembly);
			}

			DisassembledScript = disasmBuilder.ToString();

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

		StatusText = $"Loading opcode table from {Path.GetFileName(path)} - not yet fully implemented";
		// TODO: Implement actual opcode table loading
	}

	[RelayCommand]
	private void FindScripts() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		// Simple heuristic: find potential script starts (common patterns)
		var potentialScripts = new List<int>();
		var data = _rom.AsSpan();

		for (int i = 0; i < data.Length - 4; i++) {
			// Look for common script start patterns
			// Many games start scripts with specific opcodes
			if (data[i] == 0x09 || data[i] == 0x0a) { // MSG or CHOICE
				potentialScripts.Add(i);
			}
		}

		StatusText = $"Found {potentialScripts.Count} potential script locations";
	}
}

/// <summary>
/// Represents an opcode definition.
/// </summary>
public record ScriptOpcode(byte Code, string Name, int Length, string Description);

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
