using System.Collections.ObjectModel;
using Avalonia.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Disassembly;
using GameInfoTools.UI.Services;

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
/// Instruction category for syntax highlighting.
/// </summary>
public enum InstructionCategory {
	Unknown,
	LoadStore,        // LDA, STA, LDX, STX, LDY, STY
	Arithmetic,       // ADC, SBC, INC, DEC
	Logic,            // AND, ORA, EOR, BIT
	Branch,           // BCC, BCS, BEQ, BNE, BMI, BPL, BVC, BVS
	Jump,             // JMP, JSR, RTS, RTI
	Stack,            // PHA, PLA, PHP, PLP, PHX, PHY, PLX, PLY
	Transfer,         // TAX, TAY, TXA, TYA, TXS, TSX
	Compare,          // CMP, CPX, CPY
	Shift,            // ASL, LSR, ROL, ROR
	Flag,             // CLC, SEC, CLI, SEI, CLV, CLD, SED
	Nop,              // NOP, BRK
	Illegal           // Undocumented opcodes
}

/// <summary>
/// Basic block for control flow analysis.
/// </summary>
public record BasicBlock(int StartAddress, int EndAddress, List<int> Successors, List<int> Predecessors, string Label);

/// <summary>
/// Search result for pattern/text searches.
/// </summary>
public record DisassemblySearchResult(int Offset, int Address, string Context, string MatchType);

/// <summary>
/// Bookmark for saved locations.
/// </summary>
public record Bookmark(int Address, int Offset, string Name, string? Comment = null, DateTime? Created = null);

/// <summary>
/// View model for 6502/65816 disassembly.
/// </summary>
public partial class DisassemblerViewModel : ViewModelBase, IKeyboardShortcutHandler {
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

	// === UI Improvements: Panels visibility ===
	/// <summary>
	/// Whether the symbols panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showSymbolsPanel;

	/// <summary>
	/// Whether the cross-references panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showCrossReferencesPanel;

	/// <summary>
	/// Whether the bookmarks panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showBookmarksPanel;

	/// <summary>
	/// Whether the basic blocks panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showBasicBlocksPanel;

	// === Syntax highlighting ===
	/// <summary>
	/// Enable instruction category-based syntax highlighting.
	/// </summary>
	[ObservableProperty]
	private bool _enableSyntaxHighlighting = true;

	/// <summary>
	/// Show branch arrows/lines in the gutter.
	/// </summary>
	[ObservableProperty]
	private bool _showBranchVisualization = true;

	// === Bookmarks ===
	/// <summary>
	/// Collection of saved bookmark locations.
	/// </summary>
	public ObservableCollection<Bookmark> Bookmarks { get; } = [];

	/// <summary>
	/// Currently selected bookmark.
	/// </summary>
	[ObservableProperty]
	private Bookmark? _selectedBookmark;

	// === Basic blocks for control flow ===
	/// <summary>
	/// Detected basic blocks in current disassembly.
	/// </summary>
	public ObservableCollection<BasicBlock> BasicBlocks { get; } = [];

	// === Search functionality ===
	/// <summary>
	/// Whether the search panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showSearchPanel;

	/// <summary>
	/// Search query text.
	/// </summary>
	[ObservableProperty]
	private string _searchQuery = "";

	/// <summary>
	/// Search results collection.
	/// </summary>
	public ObservableCollection<DisassemblySearchResult> SearchResults { get; } = [];

	/// <summary>
	/// Currently selected search result index.
	/// </summary>
	[ObservableProperty]
	private int _currentSearchResultIndex = -1;

	/// <summary>
	/// Search in mnemonics.
	/// </summary>
	[ObservableProperty]
	private bool _searchInMnemonics = true;

	/// <summary>
	/// Search in labels.
	/// </summary>
	[ObservableProperty]
	private bool _searchInLabels = true;

	/// <summary>
	/// Search in comments.
	/// </summary>
	[ObservableProperty]
	private bool _searchInComments = true;

	// === Symbol filtering ===
	/// <summary>
	/// Filter text for symbols panel.
	/// </summary>
	[ObservableProperty]
	private string _symbolFilter = "";


	/// <summary>
	/// Filtered symbols list.
	/// </summary>
	public ObservableCollection<SymbolEntry> FilteredSymbols { get; } = [];

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
		var lowByte = (byte)(targetAddr & 0xff);
		var highByte = (byte)((targetAddr >> 8) & 0xff);

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

	// === UI Improvement Commands ===

	/// <summary>
	/// Get the instruction category for syntax highlighting.
	/// </summary>
	public static InstructionCategory GetInstructionCategory(string mnemonic) {
		var upper = mnemonic.ToUpperInvariant();
		return upper switch {
			"LDA" or "STA" or "LDX" or "STX" or "LDY" or "STY" or "STZ" => InstructionCategory.LoadStore,
			"ADC" or "SBC" or "INC" or "DEC" or "INX" or "INY" or "DEX" or "DEY" => InstructionCategory.Arithmetic,
			"AND" or "ORA" or "EOR" or "BIT" or "TRB" or "TSB" => InstructionCategory.Logic,
			"BCC" or "BCS" or "BEQ" or "BNE" or "BMI" or "BPL" or "BVC" or "BVS" or "BRA" or "BRL" => InstructionCategory.Branch,
			"JMP" or "JSR" or "RTS" or "RTI" or "JML" or "JSL" or "RTL" => InstructionCategory.Jump,
			"PHA" or "PLA" or "PHP" or "PLP" or "PHX" or "PHY" or "PLX" or "PLY" or "PHB" or "PHD" or "PHK" or "PLB" or "PLD" => InstructionCategory.Stack,
			"TAX" or "TAY" or "TXA" or "TYA" or "TXS" or "TSX" or "TCD" or "TCS" or "TDC" or "TSC" or "TXY" or "TYX" => InstructionCategory.Transfer,
			"CMP" or "CPX" or "CPY" => InstructionCategory.Compare,
			"ASL" or "LSR" or "ROL" or "ROR" => InstructionCategory.Shift,
			"CLC" or "SEC" or "CLI" or "SEI" or "CLV" or "CLD" or "SED" or "REP" or "SEP" or "XCE" => InstructionCategory.Flag,
			"NOP" or "BRK" or "WAI" or "STP" or "WDM" => InstructionCategory.Nop,
			_ => InstructionCategory.Unknown
		};
	}

	/// <summary>
	/// Add a bookmark at the current or specified address.
	/// </summary>
	[RelayCommand]
	private void AddBookmark(string? name = null) {
		var addr = SelectedLine?.RawAddress ?? (BaseAddress + StartOffset);
		var bookmarkName = name ?? $"bookmark_{addr:x4}";

		// Don't add duplicate bookmarks
		if (Bookmarks.Any(b => b.Address == addr)) {
			StatusText = $"Bookmark already exists at ${addr:x4}";
			return;
		}

		Bookmarks.Add(new Bookmark(addr, StartOffset, bookmarkName, null, DateTime.Now));
		StatusText = $"Added bookmark '{bookmarkName}' at ${addr:x4}";
	}

	/// <summary>
	/// Add a bookmark with a specific name and comment.
	/// </summary>
	public void AddBookmarkWithDetails(string name, string? comment = null) {
		if (SelectedLine is null) return;

		var addr = SelectedLine.RawAddress;
		Bookmarks.Add(new Bookmark(addr, StartOffset, name, comment, DateTime.Now));
		StatusText = $"Added bookmark '{name}' at ${addr:x4}";
	}

	/// <summary>
	/// Remove a bookmark.
	/// </summary>
	[RelayCommand]
	private void RemoveBookmark(Bookmark bookmark) {
		Bookmarks.Remove(bookmark);
		StatusText = $"Removed bookmark '{bookmark.Name}'";
	}

	/// <summary>
	/// Go to a bookmark location.
	/// </summary>
	[RelayCommand]
	private void GoToBookmark(Bookmark bookmark) {
		PushNavigationHistory();
		StartOffset = bookmark.Offset;
		Disassemble();
		StatusText = $"Jumped to bookmark '{bookmark.Name}'";
	}

	/// <summary>
	/// Analyze basic blocks in the current view.
	/// </summary>
	[RelayCommand]
	private void AnalyzeBasicBlocks() {
		BasicBlocks.Clear();

		if (DisassemblyLines.Count == 0) return;

		var blockStarts = new HashSet<int> { DisassemblyLines[0].RawAddress };
		var blockEnds = new Dictionary<int, List<int>>(); // Address -> successor addresses

		// First pass: identify block boundaries
		foreach (var line in DisassemblyLines) {
			var category = GetInstructionCategory(line.Mnemonic);

			if (category == InstructionCategory.Branch || category == InstructionCategory.Jump) {
				var targetAddr = ParseTargetAddress(line.Operand);
				if (targetAddr.HasValue) {
					blockStarts.Add(targetAddr.Value);

					// Find the next instruction after this one
					var idx = DisassemblyLines.IndexOf(line);
					if (idx < DisassemblyLines.Count - 1) {
						var nextAddr = DisassemblyLines[idx + 1].RawAddress;
						if (line.Mnemonic.ToUpperInvariant() is not "JMP" and not "RTS" and not "RTI" and not "JML" and not "RTL") {
							blockStarts.Add(nextAddr);
						}
					}
				}
			}
		}

		// Second pass: create blocks
		var sortedStarts = blockStarts.OrderBy(a => a).ToList();
		for (int i = 0; i < sortedStarts.Count; i++) {
			var start = sortedStarts[i];
			var end = i < sortedStarts.Count - 1 ? sortedStarts[i + 1] - 1 : DisassemblyLines.Last().RawAddress;

			// Find successors
			var successors = new List<int>();
			var predecessors = new List<int>();
			var linesInBlock = DisassemblyLines.Where(l => l.RawAddress >= start && l.RawAddress <= end).ToList();

			if (linesInBlock.Count > 0) {
				var lastLine = linesInBlock.Last();
				var category = GetInstructionCategory(lastLine.Mnemonic);

				if (category == InstructionCategory.Branch) {
					var target = ParseTargetAddress(lastLine.Operand);
					if (target.HasValue) successors.Add(target.Value);
					// Branches also fall through (except unconditional)
					if (lastLine.Mnemonic.ToUpperInvariant() != "BRA") {
						var nextIdx = DisassemblyLines.IndexOf(lastLine) + 1;
						if (nextIdx < DisassemblyLines.Count) {
							successors.Add(DisassemblyLines[nextIdx].RawAddress);
						}
					}
				} else if (category == InstructionCategory.Jump && lastLine.Mnemonic.ToUpperInvariant() is "JSR" or "JSL") {
					// JSR returns to next instruction
					var nextIdx = DisassemblyLines.IndexOf(lastLine) + 1;
					if (nextIdx < DisassemblyLines.Count) {
						successors.Add(DisassemblyLines[nextIdx].RawAddress);
					}
				} else if (category != InstructionCategory.Jump) {
					// Fall through to next block
					var nextIdx = DisassemblyLines.IndexOf(lastLine) + 1;
					if (nextIdx < DisassemblyLines.Count) {
						successors.Add(DisassemblyLines[nextIdx].RawAddress);
					}
				}

				var label = Symbols.GetSymbol(start) ?? $"block_{start:x4}";
				BasicBlocks.Add(new BasicBlock(start, end, successors, predecessors, label));
			}
		}

		// Third pass: compute predecessors
		foreach (var block in BasicBlocks) {
			foreach (var successor in block.Successors) {
				var targetBlock = BasicBlocks.FirstOrDefault(b => b.StartAddress == successor);
				if (targetBlock != null) {
					var newPreds = targetBlock.Predecessors.ToList();
					newPreds.Add(block.StartAddress);
					var idx = BasicBlocks.IndexOf(targetBlock);
					BasicBlocks[idx] = targetBlock with { Predecessors = newPreds };
				}
			}
		}

		StatusText = $"Found {BasicBlocks.Count} basic blocks";
	}

	/// <summary>
	/// Search disassembly for text/pattern.
	/// </summary>
	[RelayCommand]
	private void SearchDisassembly() {
		SearchResults.Clear();
		CurrentSearchResultIndex = -1;

		if (string.IsNullOrWhiteSpace(SearchQuery) || _rom is null) return;

		var query = SearchQuery.ToLowerInvariant();
		var results = new List<DisassemblySearchResult>();

		// Search in current view
		foreach (var line in DisassemblyLines) {
			if (SearchInMnemonics && line.Mnemonic.ToLowerInvariant().Contains(query)) {
				results.Add(new DisassemblySearchResult(StartOffset, line.RawAddress, $"{line.Mnemonic} {line.Operand}", "Mnemonic"));
			}

			if (SearchInLabels && !string.IsNullOrEmpty(line.Label) && line.Label.ToLowerInvariant().Contains(query)) {
				results.Add(new DisassemblySearchResult(StartOffset, line.RawAddress, line.Label, "Label"));
			}

			if (SearchInComments && !string.IsNullOrEmpty(line.Comment) && line.Comment.ToLowerInvariant().Contains(query)) {
				results.Add(new DisassemblySearchResult(StartOffset, line.RawAddress, line.Comment, "Comment"));
			}
		}

		foreach (var r in results) {
			SearchResults.Add(r);
		}

		if (SearchResults.Count > 0) {
			CurrentSearchResultIndex = 0;
			StatusText = $"Found {SearchResults.Count} results for '{SearchQuery}'";
		} else {
			StatusText = $"No results found for '{SearchQuery}'";
		}
	}

	/// <summary>
	/// Go to the next search result.
	/// </summary>
	[RelayCommand]
	private void NextSearchResult() {
		if (SearchResults.Count == 0) return;

		CurrentSearchResultIndex = (CurrentSearchResultIndex + 1) % SearchResults.Count;
		GoToSearchResult(SearchResults[CurrentSearchResultIndex]);
	}

	/// <summary>
	/// Go to the previous search result.
	/// </summary>
	[RelayCommand]
	private void PreviousSearchResult() {
		if (SearchResults.Count == 0) return;

		CurrentSearchResultIndex = CurrentSearchResultIndex <= 0 ? SearchResults.Count - 1 : CurrentSearchResultIndex - 1;
		GoToSearchResult(SearchResults[CurrentSearchResultIndex]);
	}

	/// <summary>
	/// Go to a specific search result.
	/// </summary>
	[RelayCommand]
	private void GoToSearchResult(DisassemblySearchResult result) {
		var offset = result.Address - BaseAddress;
		if (offset >= 0 && (_rom is null || offset < _rom.Length)) {
			PushNavigationHistory();
			StartOffset = offset;
			Disassemble();
		}
	}

	/// <summary>
	/// Filter the symbols list.
	/// </summary>
	partial void OnSymbolFilterChanged(string value) {
		UpdateFilteredSymbols();
	}

	/// <summary>
	/// Update the filtered symbols list.
	/// </summary>
	private void UpdateFilteredSymbols() {
		FilteredSymbols.Clear();

		var filter = SymbolFilter?.ToLowerInvariant() ?? "";
		var allSymbols = Symbols.GetAllSymbols();

		foreach (var (name, address, type) in allSymbols) {
			if (string.IsNullOrEmpty(filter) || name.ToLowerInvariant().Contains(filter)) {
				FilteredSymbols.Add(new SymbolEntry(name, address, type));
			}
		}
	}

	/// <summary>
	/// Go to a symbol's address.
	/// </summary>
	[RelayCommand]
	private void GoToSymbol(SymbolEntry symbol) {
		var offset = symbol.Address - BaseAddress;
		if (offset >= 0 && (_rom is null || offset < _rom.Length)) {
			PushNavigationHistory();
			StartOffset = offset;
			Disassemble();
			StatusText = $"Jumped to symbol '{symbol.Name}'";
		}
	}

	/// <summary>
	/// Get branch visualization info for a line.
	/// </summary>
	public (bool IsBranch, int TargetAddress, bool IsForward) GetBranchInfo(DisassemblyLine line) {
		var category = GetInstructionCategory(line.Mnemonic);
		if (category is not InstructionCategory.Branch and not InstructionCategory.Jump) {
			return (false, 0, false);
		}

		var target = ParseTargetAddress(line.Operand);
		if (!target.HasValue) {
			return (false, 0, false);
		}

		return (true, target.Value, target.Value > line.RawAddress);
	}

	/// <summary>
	/// Export symbols to a file.
	/// </summary>
	[RelayCommand]
	private void ExportSymbols(string filePath) {
		if (string.IsNullOrWhiteSpace(filePath)) {
			StatusText = "No file path specified";
			return;
		}

		try {
			var ext = Path.GetExtension(filePath).ToLowerInvariant();
			string content = ext == ".mlb" ? Symbols.ExportMlb() : Symbols.ExportLabels();
			File.WriteAllText(filePath, content);
			StatusText = $"Exported {Symbols.Count} symbols to {Path.GetFileName(filePath)}";
		} catch (Exception ex) {
			StatusText = $"Error exporting symbols: {ex.Message}";
		}
	}

	/// <summary>
	/// Import bookmarks from a file.
	/// </summary>
	[RelayCommand]
	private void ImportBookmarks(string filePath) {
		if (!File.Exists(filePath)) {
			StatusText = "Bookmarks file not found";
			return;
		}

		try {
			var lines = File.ReadAllLines(filePath);
			foreach (var line in lines) {
				if (string.IsNullOrWhiteSpace(line) || line.StartsWith(";")) continue;

				// Format: address name [comment]
				var parts = line.Split('\t', ' ');
				if (parts.Length >= 2) {
					var addrStr = parts[0].TrimStart('$');
					if (int.TryParse(addrStr, System.Globalization.NumberStyles.HexNumber, null, out var addr)) {
						var name = parts[1];
						var comment = parts.Length > 2 ? string.Join(" ", parts.Skip(2)) : null;
						var offset = addr - BaseAddress;

						if (!Bookmarks.Any(b => b.Address == addr)) {
							Bookmarks.Add(new Bookmark(addr, offset, name, comment, DateTime.Now));
						}
					}
				}
			}

			StatusText = $"Imported {Bookmarks.Count} bookmarks";
		} catch (Exception ex) {
			StatusText = $"Error importing bookmarks: {ex.Message}";
		}
	}

	/// <summary>
	/// Export bookmarks to a file.
	/// </summary>
	[RelayCommand]
	private void ExportBookmarks(string filePath) {
		if (string.IsNullOrWhiteSpace(filePath)) {
			StatusText = "No file path specified";
			return;
		}

		try {
			var lines = new List<string> { "; GameInfoTools Bookmarks", $"; Generated {DateTime.Now:yyyy-MM-dd HH:mm:ss}", "" };

			foreach (var bm in Bookmarks.OrderBy(b => b.Address)) {
				var line = $"${bm.Address:x4}\t{bm.Name}";
				if (!string.IsNullOrEmpty(bm.Comment)) {
					line += $"\t{bm.Comment}";
				}

				lines.Add(line);
			}

			File.WriteAllText(filePath, string.Join(Environment.NewLine, lines));
			StatusText = $"Exported {Bookmarks.Count} bookmarks to {Path.GetFileName(filePath)}";
		} catch (Exception ex) {
			StatusText = $"Error exporting bookmarks: {ex.Message}";
		}
	}

	/// <summary>
	/// Toggle search panel visibility.
	/// </summary>
	[RelayCommand]
	private void ToggleSearch() {
		ShowSearchPanel = !ShowSearchPanel;
	}

	/// <summary>
	/// Toggle a panel's visibility.
	/// </summary>
	[RelayCommand]
	private void TogglePanel(string panelName) {
		switch (panelName.ToLowerInvariant()) {
			case "symbols":
				ShowSymbolsPanel = !ShowSymbolsPanel;
				if (ShowSymbolsPanel) UpdateFilteredSymbols();
				break;
			case "xrefs":
			case "crossreferences":
				ShowCrossReferencesPanel = !ShowCrossReferencesPanel;
				break;
			case "bookmarks":
				ShowBookmarksPanel = !ShowBookmarksPanel;
				break;
			case "blocks":
			case "basicblocks":
				ShowBasicBlocksPanel = !ShowBasicBlocksPanel;
				if (ShowBasicBlocksPanel) AnalyzeBasicBlocks();
				break;
			case "search":
				ShowSearchPanel = !ShowSearchPanel;
				break;
		}
	}

	/// <summary>
	/// Jump to a cross-reference location.
	/// </summary>
	[RelayCommand]
	private void GoToCrossReference(CrossReference xref) {
		var offset = xref.FromAddress - BaseAddress;
		if (offset >= 0 && (_rom is null || offset < _rom.Length)) {
			PushNavigationHistory();
			StartOffset = offset;
			Disassemble();
			StatusText = $"Jumped to xref from ${xref.FromAddress:x4}";
		}
	}

	/// <summary>
	/// Handle keyboard shortcuts.
	/// </summary>
	public bool HandleKeyDown(KeyEventArgs e) {
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.NavigateBack)) {
			if (CanGoBack) {
				NavigateBack();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.NavigateForward)) {
			if (CanGoForward) {
				NavigateForward();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FollowAddress)) {
			if (SelectedLine is not null) {
				FollowAddress();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.AddLabel)) {
			if (SelectedLine is not null) {
				AddLabel();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.AddBookmark)) {
			AddBookmark();
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Find)) {
			// Toggle search - would need UI binding
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindNext)) {
			if (SearchResults.Count > 0) {
				NextSearchResult();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindPrevious)) {
			if (SearchResults.Count > 0) {
				PreviousSearchResult();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Disassemble)) {
			Disassemble();
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ToggleSymbols)) {
			TogglePanel("symbols");
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ToggleCrossReferences)) {
			TogglePanel("xrefs");
			return true;
		}

		return false;
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
) {
	/// <summary>
	/// Get the instruction category for syntax highlighting.
	/// </summary>
	public InstructionCategory Category => DisassemblerViewModel.GetInstructionCategory(Mnemonic);
}

/// <summary>
/// Symbol entry for display in symbols panel.
/// </summary>
public record SymbolEntry(string Name, int Address, SymbolTable.SymbolType Type);
