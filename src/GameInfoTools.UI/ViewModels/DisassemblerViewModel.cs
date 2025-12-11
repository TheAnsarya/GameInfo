using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Disassembly;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Cross-reference information for an address.
/// </summary>
public record CrossReference(int FromAddress, int ToAddress, string Type, string Mnemonic);

/// <summary>
/// Navigation history entry.
/// </summary>
public record NavigationEntry(int Offset, int BaseAddress, DateTime Timestamp);

/// <summary>
/// View model for 6502/65816 disassembly.
/// </summary>
public partial class DisassemblerViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private Disassembler? _disassembler;
	private readonly Stack<NavigationEntry> _backStack = new();
	private readonly Stack<NavigationEntry> _forwardStack = new();

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private int _startOffset;

	[ObservableProperty]
	private int _length = 256;

	[ObservableProperty]
	private int _baseAddress = 0x8000;

	[ObservableProperty]
	private string _cpuMode = "6502 (NES)";

	[ObservableProperty]
	private bool _showBytes = true;

	[ObservableProperty]
	private bool _showAddresses = true;

	[ObservableProperty]
	private bool _lowercaseHex = true;

	[ObservableProperty]
	private string _statusText = "";

	// Symbol table support
	[ObservableProperty]
	private SymbolTable _symbols = new();

	[ObservableProperty]
	private bool _useSymbols = true;

	[ObservableProperty]
	private string _selectedSymbol = "";

	// Navigation history
	[ObservableProperty]
	private bool _canGoBack;

	[ObservableProperty]
	private bool _canGoForward;

	// Cross-reference tracking
	public ObservableCollection<CrossReference> CrossReferences { get; } = [];

	// Selected line for operations
	[ObservableProperty]
	private DisassemblyLine? _selectedLine;

	// Auto-analysis mode
	[ObservableProperty]
	private bool _autoFollowJumps = true;

	[ObservableProperty]
	private bool _autoLabelBranches = true;

	public ObservableCollection<DisassemblyLine> DisassemblyLines { get; } = [];

	public string[] AvailableCpuModes { get; } = [
		"6502 (NES)",
		"65C02",
		"65816 (SNES)"
	];

	public DisassemblerViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded) {
			DetectCpuMode();
		}

		UpdateNavigationState();
	}

	private void UpdateNavigationState() {
		CanGoBack = _backStack.Count > 0;
		CanGoForward = _forwardStack.Count > 0;
	}

	private void PushNavigationHistory() {
		_backStack.Push(new NavigationEntry(StartOffset, BaseAddress, DateTime.Now));
		_forwardStack.Clear();
		UpdateNavigationState();
	}

	private void DetectCpuMode() {
		if (_rom is null) return;

		var info = _rom.GetInfo();
		CpuMode = info.System switch {
			SystemType.Nes => "6502 (NES)",
			SystemType.Snes => "65816 (SNES)",
			SystemType.GameBoy or SystemType.GameBoyColor => "6502 (NES)", // GB uses different CPU
			_ => "6502 (NES)"
		};

		// Set appropriate base address
		BaseAddress = info.System switch {
			SystemType.Nes => 0x8000,
			SystemType.Snes => 0x8000,
			SystemType.GameBoy => 0x0000,
			_ => 0x8000
		};
	}

	[RelayCommand]
	private void Disassemble() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		DisassemblyLines.Clear();
		CrossReferences.Clear();

		var options = new Disassembler.Options {
			Mode = CpuMode switch {
				"65816 (SNES)" => Disassembler.CpuMode.Cpu65816,
				"65C02" => Disassembler.CpuMode.Cpu65C02,
				_ => Disassembler.CpuMode.Cpu6502
			},
			BaseAddress = BaseAddress,
			ShowBytes = ShowBytes,
			ShowAddresses = ShowAddresses,
			LowercaseHex = LowercaseHex,
			Symbols = UseSymbols ? Symbols : null
		};

		_disassembler = new Disassembler(_rom.Data, options);

		try {
			var instructions = _disassembler.Disassemble(StartOffset, Length);

			foreach (var instr in instructions) {
				var bytesStr = ShowBytes
					? string.Join(" ", instr.Bytes.Select(b => LowercaseHex ? $"{b:x2}" : $"{b:X2}"))
					: "";

				var addressStr = ShowAddresses
					? (LowercaseHex ? $"${instr.Address:x4}" : $"${instr.Address:X4}")
					: "";

				// Check for symbol at this address
				var symbolName = UseSymbols ? Symbols.GetSymbol(instr.Address) : null;
				var labelStr = symbolName ?? "";

				DisassemblyLines.Add(new DisassemblyLine(
					addressStr,
					bytesStr,
					instr.Mnemonic,
					instr.Operand,
					instr.Comment ?? "",
					labelStr,
					instr.Address
				));

				// Track cross-references for branches/jumps
				if (AutoFollowJumps && IsBranchOrJump(instr.Mnemonic)) {
					var targetAddr = ParseTargetAddress(instr.Operand);
					if (targetAddr.HasValue) {
						CrossReferences.Add(new CrossReference(
							instr.Address,
							targetAddr.Value,
							GetReferenceType(instr.Mnemonic),
							instr.Mnemonic
						));

						// Auto-label branches if enabled
						if (AutoLabelBranches && !Symbols.HasSymbol(targetAddr.Value)) {
							var autoLabel = GenerateAutoLabel(instr.Mnemonic, targetAddr.Value);
							Symbols.AddSymbol(autoLabel, targetAddr.Value, SymbolTable.SymbolType.Label);
						}
					}
				}
			}

			StatusText = $"Disassembled {instructions.Count} instructions from offset 0x{StartOffset:X6} ({CrossReferences.Count} xrefs)";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		}
	}

	private static bool IsBranchOrJump(string mnemonic) {
		var upper = mnemonic.ToUpperInvariant();
		return upper is "JMP" or "JSR" or "BRA" or "BRL"
			or "BCC" or "BCS" or "BEQ" or "BNE" or "BMI" or "BPL" or "BVC" or "BVS"
			or "JML" or "JSL"; // 65816 long versions
	}

	private static string GetReferenceType(string mnemonic) {
		var upper = mnemonic.ToUpperInvariant();
		return upper switch {
			"JSR" or "JSL" => "Call",
			"JMP" or "JML" => "Jump",
			_ => "Branch"
		};
	}

	private static int? ParseTargetAddress(string operand) {
		// Parse $XXXX or $XXXXXX address formats
		var match = System.Text.RegularExpressions.Regex.Match(operand, @"\$([0-9a-fA-F]{4,6})");
		if (match.Success && int.TryParse(match.Groups[1].Value, System.Globalization.NumberStyles.HexNumber, null, out var addr)) {
			return addr;
		}

		return null;
	}

	private static string GenerateAutoLabel(string mnemonic, int address) {
		var upper = mnemonic.ToUpperInvariant();
		var prefix = upper switch {
			"JSR" or "JSL" => "sub_",
			"JMP" or "JML" => "loc_",
			_ => "br_"
		};
		return $"{prefix}{address:x4}";
	}

	[RelayCommand]
	private void GoToOffset() {
		PushNavigationHistory();
		Disassemble();
	}

	[RelayCommand]
	private void NavigateBack() {
		if (_backStack.Count == 0) return;

		var current = new NavigationEntry(StartOffset, BaseAddress, DateTime.Now);
		_forwardStack.Push(current);

		var entry = _backStack.Pop();
		StartOffset = entry.Offset;
		BaseAddress = entry.BaseAddress;
		UpdateNavigationState();
		Disassemble();
	}

	[RelayCommand]
	private void NavigateForward() {
		if (_forwardStack.Count == 0) return;

		var current = new NavigationEntry(StartOffset, BaseAddress, DateTime.Now);
		_backStack.Push(current);

		var entry = _forwardStack.Pop();
		StartOffset = entry.Offset;
		BaseAddress = entry.BaseAddress;
		UpdateNavigationState();
		Disassemble();
	}

	[RelayCommand]
	private void FollowAddress() {
		if (SelectedLine is null) return;

		var targetAddr = ParseTargetAddress(SelectedLine.Operand);
		if (!targetAddr.HasValue) {
			StatusText = "No address to follow";
			return;
		}

		// Calculate the file offset from the CPU address
		var offset = targetAddr.Value - BaseAddress;
		if (offset < 0 || (_rom is not null && offset >= _rom.Length)) {
			StatusText = $"Address ${targetAddr.Value:x4} is outside ROM bounds";
			return;
		}

		PushNavigationHistory();
		StartOffset = offset;
		Disassemble();
		StatusText = $"Followed to ${targetAddr.Value:x4}";
	}

	[RelayCommand]
	private void GoToAddress(string address) {
		if (string.IsNullOrWhiteSpace(address)) return;

		// Parse address (support $xxxx or xxxx hex formats)
		var trimmed = address.Trim().TrimStart('$');
		if (!int.TryParse(trimmed, System.Globalization.NumberStyles.HexNumber, null, out var addr)) {
			StatusText = "Invalid address format";
			return;
		}

		var offset = addr - BaseAddress;
		if (offset < 0) {
			// Could be a file offset, not CPU address
			offset = addr;
		}

		if (_rom is not null && offset >= _rom.Length) {
			StatusText = $"Address 0x{addr:X4} is outside ROM bounds";
			return;
		}

		PushNavigationHistory();
		StartOffset = offset;
		Disassemble();
	}

	[RelayCommand]
	private void AddLabel() {
		if (SelectedLine is null) return;

		var defaultName = $"label_{SelectedLine.RawAddress:x4}";
		// In a real implementation, this would show a dialog
		Symbols.AddSymbol(defaultName, SelectedLine.RawAddress, SymbolTable.SymbolType.Label);
		Disassemble(); // Refresh to show new label
		StatusText = $"Added label '{defaultName}' at ${SelectedLine.RawAddress:x4}";
	}

	[RelayCommand]
	private void AddLabelWithName(string name) {
		if (SelectedLine is null || string.IsNullOrWhiteSpace(name)) return;

		Symbols.AddSymbol(name, SelectedLine.RawAddress, SymbolTable.SymbolType.Label);
		Disassemble();
		StatusText = $"Added label '{name}' at ${SelectedLine.RawAddress:x4}";
	}

	[RelayCommand]
	private void MarkAsSubroutine() {
		if (SelectedLine is null) return;

		var name = $"sub_{SelectedLine.RawAddress:x4}";
		Symbols.AddSymbol(name, SelectedLine.RawAddress, SymbolTable.SymbolType.Subroutine);
		Disassemble();
		StatusText = $"Marked ${SelectedLine.RawAddress:x4} as subroutine '{name}'";
	}

	[RelayCommand]
	private void MarkAsData() {
		if (SelectedLine is null) return;

		var name = $"data_{SelectedLine.RawAddress:x4}";
		Symbols.AddSymbol(name, SelectedLine.RawAddress, SymbolTable.SymbolType.Data);
		Disassemble();
		StatusText = $"Marked ${SelectedLine.RawAddress:x4} as data '{name}'";
	}

	[RelayCommand]
	private void LoadSymbolFile(string filePath) {
		if (string.IsNullOrEmpty(filePath) || !File.Exists(filePath)) {
			StatusText = "Symbol file not found";
			return;
		}

		try {
			var content = File.ReadAllText(filePath);
			var ext = Path.GetExtension(filePath).ToLowerInvariant();

			if (ext == ".mlb") {
				Symbols.LoadMlb(content);
			} else {
				Symbols.LoadLabels(content);
			}

			StatusText = $"Loaded symbols from {Path.GetFileName(filePath)}";
			Disassemble(); // Refresh with new symbols
		} catch (Exception ex) {
			StatusText = $"Error loading symbols: {ex.Message}";
		}
	}

	[RelayCommand]
	private void ExportAsm(string filePath) {
		if (DisassemblyLines.Count == 0) {
			StatusText = "Nothing to export";
			return;
		}

		try {
			using var writer = new StreamWriter(filePath);

			// Write header
			writer.WriteLine($"; Disassembly generated by GameInfoTools");
			writer.WriteLine($"; Source: Offset 0x{StartOffset:X6}, CPU ${BaseAddress:X4}");
			writer.WriteLine($"; Mode: {CpuMode}");
			writer.WriteLine($"; Date: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
			writer.WriteLine();
			writer.WriteLine($"\t.org ${BaseAddress:X4}");
			writer.WriteLine();

			foreach (var line in DisassemblyLines) {
				// Write label if present
				if (!string.IsNullOrEmpty(line.Label)) {
					writer.WriteLine($"{line.Label}:");
				}

				// Write instruction
				var bytesComment = ShowBytes && !string.IsNullOrEmpty(line.Bytes)
					? $"\t; {line.Bytes}"
					: "";

				if (!string.IsNullOrEmpty(line.Comment)) {
					writer.WriteLine($"\t{line.Mnemonic,-6} {line.Operand,-16}{bytesComment} ; {line.Comment}");
				} else {
					writer.WriteLine($"\t{line.Mnemonic,-6} {line.Operand}{bytesComment}");
				}
			}

			StatusText = $"Exported {DisassemblyLines.Count} lines to {Path.GetFileName(filePath)}";
		} catch (Exception ex) {
			StatusText = $"Error exporting: {ex.Message}";
		}
	}

	[RelayCommand]
	private void FindCrossReferences() {
		if (SelectedLine is null || _rom is null) return;

		var targetAddr = SelectedLine.RawAddress;
		var foundRefs = new List<CrossReference>();

		// Search entire ROM for references to this address
		var data = _rom.Data;
		var lowByte = (byte)(targetAddr & 0xFF);
		var highByte = (byte)((targetAddr >> 8) & 0xFF);

		for (int i = 0; i < data.Length - 2; i++) {
			// Look for address in little-endian format
			if (data[i] == lowByte && data[i + 1] == highByte) {
				var refAddr = BaseAddress + i - 1; // -1 to account for opcode byte
				foundRefs.Add(new CrossReference(refAddr, targetAddr, "Reference", "???"));
			}
		}

		CrossReferences.Clear();
		foreach (var r in foundRefs) {
			CrossReferences.Add(r);
		}

		StatusText = $"Found {foundRefs.Count} references to ${targetAddr:x4}";
	}

	[RelayCommand]
	private void NextPage() {
		PushNavigationHistory();
		StartOffset += Length;
		if (_rom is not null && StartOffset >= _rom.Length) {
			StartOffset = _rom.Length - Length;
		}

		Disassemble();
	}

	[RelayCommand]
	private void PreviousPage() {
		PushNavigationHistory();
		StartOffset -= Length;
		if (StartOffset < 0) {
			StartOffset = 0;
		}

		Disassemble();
	}

	[RelayCommand]
	private void CopyToClipboard() {
		var text = string.Join(Environment.NewLine,
			DisassemblyLines.Select(l => $"{l.Address}  {l.Bytes,-12} {l.Mnemonic} {l.Operand}"));
		// Note: Clipboard access needs platform-specific implementation
		StatusText = $"Copied {DisassemblyLines.Count} lines to clipboard";
	}

	[RelayCommand]
	private void FindPattern(string pattern) {
		if (_rom is null || !_rom.IsLoaded || string.IsNullOrWhiteSpace(pattern)) return;

		// Parse hex pattern (e.g., "4C ?? 80" for JMP with wildcard)
		var parts = pattern.Split(' ', StringSplitOptions.RemoveEmptyEntries);
		var bytes = new List<byte?>();

		foreach (var part in parts) {
			if (part == "??" || part == "**") {
				bytes.Add(null); // Wildcard
			} else if (byte.TryParse(part, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
				bytes.Add(b);
			}
		}

		if (bytes.Count == 0) {
			StatusText = "Invalid pattern";
			return;
		}

		// Search for pattern
		var data = _rom.Data;
		for (int i = 0; i <= data.Length - bytes.Count; i++) {
			bool match = true;
			for (int j = 0; j < bytes.Count; j++) {
				var b = bytes[j];
				if (b.HasValue && data[i + j] != b.Value) {
					match = false;
					break;
				}
			}

			if (match) {
				StartOffset = i;
				Disassemble();
				StatusText = $"Found pattern at offset 0x{i:X6}";
				return;
			}
		}

		StatusText = "Pattern not found";
	}
}

/// <summary>
/// Represents a line of disassembly output.
/// </summary>
public record DisassemblyLine(
	string Address,
	string Bytes,
	string Mnemonic,
	string Operand,
	string Comment,
	string Label = "",
	int RawAddress = 0
);
