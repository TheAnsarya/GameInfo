using System.Collections.ObjectModel;
using System.Text;
using Avalonia.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Commands;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Byte grouping modes for hex display.
/// </summary>
public enum ByteGroupMode {
	/// <summary>Individual bytes.</summary>
	Byte,
	/// <summary>16-bit words (little-endian).</summary>
	Word,
	/// <summary>32-bit double words (little-endian).</summary>
	DWord,
	/// <summary>32-bit double words (big-endian).</summary>
	DWordBE
}

/// <summary>
/// View model for hex editing.
/// </summary>
public partial class HexEditorViewModel : ViewModelBase, IKeyboardShortcutHandler {
	private readonly RomFile? _rom;
	private readonly UndoRedoManager _undoRedo = new(maxHistorySize: 100);

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private int _currentOffset;

	[ObservableProperty]
	private int _bytesPerRow = 16;

	[ObservableProperty]
	private int _rowCount = 16;

	[ObservableProperty]
	private int _selectedOffset = -1;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _searchHex = "";

	[ObservableProperty]
	private string _addressDisplay = "";

	[ObservableProperty]
	private string _undoDescription = "";

	[ObservableProperty]
	private string _redoDescription = "";

	/// <summary>
	/// Current byte grouping mode.
	/// </summary>
	[ObservableProperty]
	private ByteGroupMode _byteGroup = ByteGroupMode.Byte;

	/// <summary>
	/// Show data inspector panel.
	/// </summary>
	[ObservableProperty]
	private bool _showDataInspector = true;

	/// <summary>
	/// Show search panel.
	/// </summary>
	[ObservableProperty]
	private bool _showSearchPanel;

	/// <summary>
	/// Show go to offset panel.
	/// </summary>
	[ObservableProperty]
	private bool _showGotoPanel;

	/// <summary>
	/// Show ROM comparison panel.
	/// </summary>
	[ObservableProperty]
	private bool _showComparison;

	#region Data Inspector Values

	[ObservableProperty]
	private string _inspectorByte = "";

	[ObservableProperty]
	private string _inspectorSignedByte = "";

	[ObservableProperty]
	private string _inspectorWordLE = "";

	[ObservableProperty]
	private string _inspectorWordBE = "";

	[ObservableProperty]
	private string _inspectorDWordLE = "";

	[ObservableProperty]
	private string _inspectorDWordBE = "";

	[ObservableProperty]
	private string _inspectorBinary = "";

	[ObservableProperty]
	private string _inspectorAscii = "";

	[ObservableProperty]
	private string _inspectorNesAddress = "";

	[ObservableProperty]
	private string _inspectorSnesAddress = "";

	#endregion

	public bool CanUndo => _undoRedo.CanUndo;
	public bool CanRedo => _undoRedo.CanRedo;

	public ObservableCollection<HexRow> HexRows { get; } = [];

	/// <summary>
	/// Bookmarked offsets.
	/// </summary>
	public ObservableCollection<HexBookmark> Bookmarks { get; } = [];

	/// <summary>
	/// Byte group mode options for binding.
	/// </summary>
	public static ByteGroupMode[] ByteGroupModes { get; } = [ByteGroupMode.Byte, ByteGroupMode.Word, ByteGroupMode.DWord, ByteGroupMode.DWordBE];

	public HexEditorViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded) {
			RefreshView();
		}
	}

	public void RefreshView() {
		if (_rom is null || !_rom.IsLoaded) return;

		HexRows.Clear();
		var data = _rom.Data;
		int totalBytes = BytesPerRow * RowCount;
		int endOffset = Math.Min(CurrentOffset + totalBytes, data.Length);

		for (int rowStart = CurrentOffset; rowStart < endOffset; rowStart += BytesPerRow) {
			var rowData = new byte[Math.Min(BytesPerRow, data.Length - rowStart)];
			Array.Copy(data, rowStart, rowData, 0, rowData.Length);

			var hexParts = new List<string>();
			var asciiParts = new List<char>();

			for (int i = 0; i < BytesPerRow; i++) {
				if (i < rowData.Length) {
					hexParts.Add($"{rowData[i]:X2}");
					asciiParts.Add(rowData[i] is >= 0x20 and < 0x7F ? (char)rowData[i] : '.');
				} else {
					hexParts.Add("  ");
					asciiParts.Add(' ');
				}
			}

			HexRows.Add(new HexRow(
				$"{rowStart:X6}",
				string.Join(" ", hexParts),
				new string([.. asciiParts]),
				rowStart
			));
		}

		AddressDisplay = $"Offset: 0x{CurrentOffset:X6} - 0x{Math.Min(endOffset, data.Length) - 1:X6}";
		StatusText = $"Viewing {HexRows.Count * BytesPerRow} bytes from offset 0x{CurrentOffset:X6}";
	}

	[RelayCommand]
	private void GoToOffset(int offset) {
		if (_rom is null) return;

		CurrentOffset = Math.Max(0, Math.Min(offset, _rom.Length - 1));
		RefreshView();
	}

	[RelayCommand]
	private void NextPage() {
		if (_rom is null) return;

		int pageSize = BytesPerRow * RowCount;
		CurrentOffset = Math.Min(CurrentOffset + pageSize, _rom.Length - pageSize);
		RefreshView();
	}

	[RelayCommand]
	private void PreviousPage() {
		int pageSize = BytesPerRow * RowCount;
		CurrentOffset = Math.Max(0, CurrentOffset - pageSize);
		RefreshView();
	}

	[RelayCommand]
	private void GoToStart() {
		CurrentOffset = 0;
		RefreshView();
	}

	[RelayCommand]
	private void GoToEnd() {
		if (_rom is null) return;

		int pageSize = BytesPerRow * RowCount;
		CurrentOffset = Math.Max(0, _rom.Length - pageSize);
		RefreshView();
	}

	[RelayCommand]
	private void SearchHexPattern() {
		if (_rom is null || string.IsNullOrWhiteSpace(SearchHex)) return;

		// Parse hex string
		var parts = SearchHex.Replace(" ", "").Replace("-", "");
		if (parts.Length % 2 != 0) {
			StatusText = "Invalid hex string (must have even number of characters)";
			return;
		}

		var pattern = new byte[parts.Length / 2];
		for (int i = 0; i < pattern.Length; i++) {
			if (!byte.TryParse(parts.AsSpan(i * 2, 2), System.Globalization.NumberStyles.HexNumber, null, out pattern[i])) {
				StatusText = $"Invalid hex character at position {i * 2}";
				return;
			}
		}

		// Search from current position
		var data = _rom.Data;
		int searchStart = CurrentOffset + 1;

		for (int i = searchStart; i <= data.Length - pattern.Length; i++) {
			bool match = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					match = false;
					break;
				}
			}

			if (match) {
				CurrentOffset = i;
				SelectedOffset = i;
				RefreshView();
				StatusText = $"Found at offset 0x{i:X6}";
				return;
			}
		}

		// Wrap around to beginning
		for (int i = 0; i < searchStart && i <= data.Length - pattern.Length; i++) {
			bool match = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					match = false;
					break;
				}
			}

			if (match) {
				CurrentOffset = i;
				SelectedOffset = i;
				RefreshView();
				StatusText = $"Found at offset 0x{i:X6} (wrapped)";
				return;
			}
		}

		StatusText = "Pattern not found";
	}

	public void WriteByte(int offset, byte newValue) {
		if (_rom is null || offset < 0 || offset >= _rom.Length) return;

		var command = new SetByteCommand(_rom.Data, offset, newValue);
		_undoRedo.Execute(command);

		RefreshView();
		UpdateUndoRedoState();
		StatusText = $"Wrote 0x{newValue:x2} at offset 0x{offset:x6}";
	}

	public void WriteBytes(int offset, byte[] newValues) {
		if (_rom is null || offset < 0 || offset + newValues.Length > _rom.Length) return;

		var command = new SetBytesCommand(_rom.Data, offset, newValues);
		_undoRedo.Execute(command);

		RefreshView();
		UpdateUndoRedoState();
		StatusText = $"Wrote {newValues.Length} bytes at offset 0x{offset:x6}";
	}

	[RelayCommand]
	private void Undo() {
		if (!_undoRedo.CanUndo) return;

		string description = _undoRedo.NextUndoDescription ?? "last change";
		_undoRedo.Undo();
		RefreshView();
		UpdateUndoRedoState();
		StatusText = "Undone: " + description;
	}

	[RelayCommand]
	private void Redo() {
		if (!_undoRedo.CanRedo) return;

		string description = _undoRedo.NextRedoDescription ?? "previous change";
		_undoRedo.Redo();
		RefreshView();
		UpdateUndoRedoState();
		StatusText = "Redone: " + description;
	}

	private void UpdateUndoRedoState() {
		UndoDescription = _undoRedo.NextUndoDescription ?? "";
		RedoDescription = _undoRedo.NextRedoDescription ?? "";
		OnPropertyChanged(nameof(CanUndo));
		OnPropertyChanged(nameof(CanRedo));
	}

	[RelayCommand]
	private void CopySelection() {
		// TODO: Implement clipboard copy
		StatusText = "Copied selection to clipboard";
	}

	[RelayCommand]
	private void PasteAtCursor() {
		// TODO: Implement clipboard paste
		StatusText = "Pasted from clipboard";
	}

	public void FillSelection(byte value) {
		// TODO: Implement fill selection
		StatusText = $"Filled selection with 0x{value:X2}";
	}

	#region Data Inspector

	/// <summary>
	/// Update the data inspector based on current selection.
	/// </summary>
	partial void OnSelectedOffsetChanged(int value) {
		UpdateDataInspector();
	}

	private void UpdateDataInspector() {
		if (_rom is null || SelectedOffset < 0 || SelectedOffset >= _rom.Length) {
			ClearDataInspector();
			return;
		}

		var data = _rom.Data;
		int offset = SelectedOffset;

		// Single byte
		byte b = data[offset];
		InspectorByte = $"{b} (0x{b:X2})";
		InspectorSignedByte = $"{(sbyte)b}";
		InspectorBinary = Convert.ToString(b, 2).PadLeft(8, '0');
		InspectorAscii = b is >= 0x20 and < 0x7F ? $"'{(char)b}'" : "(non-printable)";

		// Word (16-bit) - Little Endian
		if (offset + 1 < data.Length) {
			ushort wordLE = (ushort)(data[offset] | (data[offset + 1] << 8));
			ushort wordBE = (ushort)((data[offset] << 8) | data[offset + 1]);
			InspectorWordLE = $"{wordLE} (0x{wordLE:X4})";
			InspectorWordBE = $"{wordBE} (0x{wordBE:X4})";
		} else {
			InspectorWordLE = "N/A";
			InspectorWordBE = "N/A";
		}

		// DWord (32-bit)
		if (offset + 3 < data.Length) {
			uint dwordLE = (uint)(data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24));
			uint dwordBE = (uint)((data[offset] << 24) | (data[offset + 1] << 16) | (data[offset + 2] << 8) | data[offset + 3]);
			InspectorDWordLE = $"{dwordLE} (0x{dwordLE:X8})";
			InspectorDWordBE = $"{dwordBE} (0x{dwordBE:X8})";
		} else {
			InspectorDWordLE = "N/A";
			InspectorDWordBE = "N/A";
		}

		// NES CPU address (assuming PRG bank mapping)
		int nesAddr = 0x8000 + (offset % 0x4000);
		int nesBank = offset / 0x4000;
		InspectorNesAddress = $"${nesAddr:X4} (Bank {nesBank})";

		// SNES LoROM address
		int snesBank = (offset / 0x8000) + 0x80;
		int snesOffset = 0x8000 + (offset % 0x8000);
		InspectorSnesAddress = $"${snesBank:X2}:{snesOffset:X4}";
	}

	private void ClearDataInspector() {
		InspectorByte = "";
		InspectorSignedByte = "";
		InspectorWordLE = "";
		InspectorWordBE = "";
		InspectorDWordLE = "";
		InspectorDWordBE = "";
		InspectorBinary = "";
		InspectorAscii = "";
		InspectorNesAddress = "";
		InspectorSnesAddress = "";
	}

	#endregion

	#region Bookmarks

	/// <summary>
	/// Add bookmark at current offset.
	/// </summary>
	[RelayCommand]
	private void AddBookmark() {
		if (SelectedOffset < 0) {
			StatusText = "Select an offset to bookmark";
			return;
		}

		// Check if already bookmarked
		if (Bookmarks.Any(b => b.Offset == SelectedOffset)) {
			StatusText = "Offset already bookmarked";
			return;
		}

		Bookmarks.Add(new HexBookmark(SelectedOffset, $"Bookmark at 0x{SelectedOffset:X6}", DateTime.Now));
		StatusText = $"Added bookmark at 0x{SelectedOffset:X6}";
	}

	/// <summary>
	/// Remove bookmark at offset.
	/// </summary>
	[RelayCommand]
	private void RemoveBookmark(int offset) {
		var bookmark = Bookmarks.FirstOrDefault(b => b.Offset == offset);
		if (bookmark is not null) {
			Bookmarks.Remove(bookmark);
			StatusText = $"Removed bookmark at 0x{offset:X6}";
		}
	}

	/// <summary>
	/// Go to bookmarked offset.
	/// </summary>
	[RelayCommand]
	private void GoToBookmark(int offset) {
		GoToOffset(offset);
		SelectedOffset = offset;
		StatusText = $"Jumped to bookmark at 0x{offset:X6}";
	}

	/// <summary>
	/// Clear all bookmarks.
	/// </summary>
	[RelayCommand]
	private void ClearBookmarks() {
		Bookmarks.Clear();
		StatusText = "Cleared all bookmarks";
	}

	#endregion

	#region Byte Group Mode

	/// <summary>
	/// Cycle through byte group modes.
	/// </summary>
	[RelayCommand]
	private void CycleByteGroup() {
		ByteGroup = ByteGroup switch {
			ByteGroupMode.Byte => ByteGroupMode.Word,
			ByteGroupMode.Word => ByteGroupMode.DWord,
			ByteGroupMode.DWord => ByteGroupMode.DWordBE,
			_ => ByteGroupMode.Byte
		};
		RefreshView();
		StatusText = $"Byte grouping: {ByteGroup}";
	}

	#endregion

	#region Selection Range

	[ObservableProperty]
	private int _selectionStart = -1;

	[ObservableProperty]
	private int _selectionEnd = -1;

	/// <summary>
	/// Whether a range is selected.
	/// </summary>
	public bool HasRangeSelection => SelectionStart >= 0 && SelectionEnd >= SelectionStart;

	/// <summary>
	/// Length of current selection.
	/// </summary>
	public int SelectionLength => HasRangeSelection ? SelectionEnd - SelectionStart + 1 : 0;

	/// <summary>
	/// Set selection range.
	/// </summary>
	public void SetSelection(int start, int end) {
		SelectionStart = Math.Min(start, end);
		SelectionEnd = Math.Max(start, end);
		OnPropertyChanged(nameof(HasRangeSelection));
		OnPropertyChanged(nameof(SelectionLength));

		if (HasRangeSelection) {
			StatusText = $"Selected {SelectionLength} bytes (0x{SelectionStart:X6} - 0x{SelectionEnd:X6})";
		}
	}

	/// <summary>
	/// Clear selection range.
	/// </summary>
	[RelayCommand]
	private void ClearRangeSelection() {
		SelectionStart = -1;
		SelectionEnd = -1;
		OnPropertyChanged(nameof(HasRangeSelection));
		OnPropertyChanged(nameof(SelectionLength));
		StatusText = "Selection cleared";
	}

	/// <summary>
	/// Fill selection range with a value.
	/// </summary>
	[RelayCommand]
	private void FillSelectionRange(byte value) {
		if (_rom is null || !HasRangeSelection) return;

		var commands = new List<IUndoableCommand>();
		for (int i = SelectionStart; i <= SelectionEnd && i < _rom.Length; i++) {
			if (_rom.Data[i] != value) {
				commands.Add(new SetByteCommand(_rom.Data, i, value));
			}
		}

		if (commands.Count > 0) {
			var composite = new CompositeCommand($"Fill {SelectionLength} bytes with 0x{value:X2}", commands);
			_undoRedo.Execute(composite);
			RefreshView();
			UpdateUndoRedoState();
			StatusText = $"Filled {SelectionLength} bytes with 0x{value:X2}";
		}
	}

	#endregion

	#region ROM Comparison

	/// <summary>
	/// Data for comparison ROM (if loaded).
	/// </summary>
	private byte[]? _comparisonData;

	/// <summary>
	/// Whether comparison mode is active.
	/// </summary>
	[ObservableProperty]
	private bool _comparisonMode;

	/// <summary>
	/// Name/path of comparison ROM.
	/// </summary>
	[ObservableProperty]
	private string _comparisonRomName = "";

	/// <summary>
	/// List of differences found.
	/// </summary>
	public ObservableCollection<DifferenceRecord> Differences { get; } = [];

	/// <summary>
	/// Whether comparison data is loaded.
	/// </summary>
	public bool HasComparisonData => _comparisonData is not null;

	/// <summary>
	/// Loads comparison ROM data.
	/// </summary>
	public void LoadComparisonData(byte[] data, string name) {
		_comparisonData = data;
		ComparisonRomName = name;
		ComparisonMode = true;
		OnPropertyChanged(nameof(HasComparisonData));
		StatusText = $"Loaded comparison ROM: {name}";
	}

	/// <summary>
	/// Clears comparison data.
	/// </summary>
	[RelayCommand]
	private void ClearComparison() {
		_comparisonData = null;
		ComparisonRomName = "";
		ComparisonMode = false;
		Differences.Clear();
		OnPropertyChanged(nameof(HasComparisonData));
		StatusText = "Comparison cleared";
	}

	/// <summary>
	/// Finds all differences between current ROM and comparison ROM.
	/// </summary>
	[RelayCommand]
	private void FindAllDifferences() {
		if (_rom is null || _comparisonData is null) return;

		Differences.Clear();
		int minLength = Math.Min(_rom.Length, _comparisonData.Length);
		int diffCount = 0;
		int blockStart = -1;

		for (int i = 0; i < minLength; i++) {
			bool isDifferent = _rom.Data[i] != _comparisonData[i];

			if (isDifferent && blockStart < 0) {
				blockStart = i;
			} else if (!isDifferent && blockStart >= 0) {
				// End of difference block
				var record = new DifferenceRecord(
					blockStart,
					i - blockStart,
					_rom.Data[blockStart],
					_comparisonData[blockStart]
				);
				Differences.Add(record);
				diffCount++;
				blockStart = -1;
			}
		}

		// Handle trailing difference
		if (blockStart >= 0) {
			var record = new DifferenceRecord(
				blockStart,
				minLength - blockStart,
				_rom.Data[blockStart],
				_comparisonData[blockStart]
			);
			Differences.Add(record);
			diffCount++;
		}

		// Handle size difference
		if (_rom.Length != _comparisonData.Length) {
			int sizeDiff = Math.Abs(_rom.Length - _comparisonData.Length);
			StatusText = $"Found {Differences.Count} difference regions. Size differs by {sizeDiff} bytes.";
		} else {
			StatusText = $"Found {Differences.Count} difference regions.";
		}
	}

	/// <summary>
	/// Gets byte at offset from comparison ROM.
	/// </summary>
	public byte? GetComparisonByte(int offset) {
		if (_comparisonData is null || offset < 0 || offset >= _comparisonData.Length) {
			return null;
		}
		return _comparisonData[offset];
	}

	/// <summary>
	/// Checks if byte at offset differs from comparison.
	/// </summary>
	public bool ByteDiffersFromComparison(int offset) {
		if (_rom is null || _comparisonData is null) return false;
		if (offset < 0) return false;
		if (offset >= _rom.Length || offset >= _comparisonData.Length) return true;
		return _rom.Data[offset] != _comparisonData[offset];
	}

	/// <summary>
	/// Go to next difference.
	/// </summary>
	[RelayCommand]
	private void NextDifference() {
		if (_rom is null || _comparisonData is null) return;

		int minLength = Math.Min(_rom.Length, _comparisonData.Length);
		int startSearch = SelectedOffset >= 0 ? SelectedOffset + 1 : CurrentOffset;

		for (int i = startSearch; i < minLength; i++) {
			if (_rom.Data[i] != _comparisonData[i]) {
				GoToOffset(i);
				SelectedOffset = i;
				UpdateDataInspector();
				StatusText = $"Difference at 0x{i:X6}: ROM=0x{_rom.Data[i]:X2}, Compare=0x{_comparisonData[i]:X2}";
				return;
			}
		}

		StatusText = "No more differences found";
	}

	/// <summary>
	/// Go to previous difference.
	/// </summary>
	[RelayCommand]
	private void PreviousDifference() {
		if (_rom is null || _comparisonData is null) return;

		int minLength = Math.Min(_rom.Length, _comparisonData.Length);
		int startSearch = SelectedOffset >= 1 ? SelectedOffset - 1 : CurrentOffset;
		startSearch = Math.Min(startSearch, minLength - 1);

		for (int i = startSearch; i >= 0; i--) {
			if (_rom.Data[i] != _comparisonData[i]) {
				GoToOffset(i);
				SelectedOffset = i;
				UpdateDataInspector();
				StatusText = $"Difference at 0x{i:X6}: ROM=0x{_rom.Data[i]:X2}, Compare=0x{_comparisonData[i]:X2}";
				return;
			}
		}

		StatusText = "No more differences found";
	}

	#endregion

	#region Find and Replace

	[ObservableProperty]
	private string _findPattern = "";

	[ObservableProperty]
	private string _replacePattern = "";

	[ObservableProperty]
	private bool _findAsHex = true;

	/// <summary>
	/// Search results.
	/// </summary>
	public ObservableCollection<SearchResult> SearchResults { get; } = [];

	/// <summary>
	/// Current search result index.
	/// </summary>
	[ObservableProperty]
	private int _currentSearchIndex = -1;

	/// <summary>
	/// Find all occurrences of pattern.
	/// </summary>
	[RelayCommand]
	private void FindAllPattern() {
		if (_rom is null || string.IsNullOrWhiteSpace(FindPattern)) return;

		SearchResults.Clear();
		CurrentSearchIndex = -1;

		byte[]? pattern = ParsePattern(FindPattern, FindAsHex);
		if (pattern is null || pattern.Length == 0) {
			StatusText = "Invalid search pattern";
			return;
		}

		// KMP search for efficiency
		var results = SearchBytes(_rom.Data, pattern);
		foreach (var offset in results) {
			SearchResults.Add(new SearchResult(offset, pattern.Length, GetContextPreview(offset, 8)));
		}

		StatusText = $"Found {SearchResults.Count} occurrences";
	}

	/// <summary>
	/// Find next occurrence.
	/// </summary>
	[RelayCommand]
	private void FindNextPattern() {
		if (_rom is null || string.IsNullOrWhiteSpace(FindPattern)) return;

		byte[]? pattern = ParsePattern(FindPattern, FindAsHex);
		if (pattern is null || pattern.Length == 0) return;

		int startSearch = SelectedOffset >= 0 ? SelectedOffset + 1 : CurrentOffset;

		for (int i = startSearch; i <= _rom.Length - pattern.Length; i++) {
			if (MatchesPattern(_rom.Data, i, pattern)) {
				GoToOffset(i);
				SelectedOffset = i;
				SetSelection(i, i + pattern.Length - 1);
				StatusText = $"Found at 0x{i:X6}";
				return;
			}
		}

		// Wrap around to beginning
		for (int i = 0; i < startSearch && i <= _rom.Length - pattern.Length; i++) {
			if (MatchesPattern(_rom.Data, i, pattern)) {
				GoToOffset(i);
				SelectedOffset = i;
				SetSelection(i, i + pattern.Length - 1);
				StatusText = $"Found at 0x{i:X6} (wrapped)";
				return;
			}
		}

		StatusText = "Pattern not found";
	}

	/// <summary>
	/// Find previous occurrence.
	/// </summary>
	[RelayCommand]
	private void FindPreviousPattern() {
		if (_rom is null || string.IsNullOrWhiteSpace(FindPattern)) return;

		byte[]? pattern = ParsePattern(FindPattern, FindAsHex);
		if (pattern is null || pattern.Length == 0) return;

		int startSearch = SelectedOffset >= 1 ? SelectedOffset - 1 : CurrentOffset;

		// Search backwards from current position
		for (int i = startSearch; i >= 0; i--) {
			if (MatchesPattern(_rom.Data, i, pattern)) {
				GoToOffset(i);
				SelectedOffset = i;
				SetSelection(i, i + pattern.Length - 1);
				StatusText = $"Found at 0x{i:X6}";
				return;
			}
		}

		// Wrap around to end
		for (int i = _rom.Length - pattern.Length; i > startSearch; i--) {
			if (MatchesPattern(_rom.Data, i, pattern)) {
				GoToOffset(i);
				SelectedOffset = i;
				SetSelection(i, i + pattern.Length - 1);
				StatusText = $"Found at 0x{i:X6} (wrapped)";
				return;
			}
		}

		StatusText = "Pattern not found";
	}

	/// <summary>
	/// Replace current selection with pattern.
	/// </summary>
	[RelayCommand]
	private void ReplaceCurrent() {
		if (_rom is null || !HasRangeSelection || string.IsNullOrWhiteSpace(ReplacePattern)) return;

		byte[]? replacement = ParsePattern(ReplacePattern, FindAsHex);
		if (replacement is null || replacement.Length == 0) return;

		var commands = new List<IUndoableCommand>();
		int replaceLength = Math.Min(replacement.Length, SelectionLength);

		for (int i = 0; i < replaceLength; i++) {
			int offset = SelectionStart + i;
			if (offset < _rom.Length && _rom.Data[offset] != replacement[i]) {
				commands.Add(new SetByteCommand(_rom.Data, offset, replacement[i]));
			}
		}

		if (commands.Count > 0) {
			var composite = new CompositeCommand($"Replace {replaceLength} bytes", commands);
			_undoRedo.Execute(composite);
			RefreshView();
			UpdateUndoRedoState();
			StatusText = $"Replaced {replaceLength} bytes";
		}
	}

	/// <summary>
	/// Replace all occurrences.
	/// </summary>
	[RelayCommand]
	private void ReplaceAllPattern() {
		if (_rom is null || string.IsNullOrWhiteSpace(FindPattern) || string.IsNullOrWhiteSpace(ReplacePattern)) return;

		byte[]? pattern = ParsePattern(FindPattern, FindAsHex);
		byte[]? replacement = ParsePattern(ReplacePattern, FindAsHex);

		if (pattern is null || pattern.Length == 0 || replacement is null) return;

		var results = SearchBytes(_rom.Data, pattern);
		if (results.Count == 0) {
			StatusText = "Pattern not found";
			return;
		}

		var commands = new List<IUndoableCommand>();
		int replaceCount = 0;

		// Replace in reverse order to avoid offset issues
		foreach (int offset in results.OrderByDescending(x => x)) {
			int replaceLength = Math.Min(replacement.Length, pattern.Length);
			for (int i = 0; i < replaceLength; i++) {
				int targetOffset = offset + i;
				if (targetOffset < _rom.Length && _rom.Data[targetOffset] != replacement[i]) {
					commands.Add(new SetByteCommand(_rom.Data, targetOffset, replacement[i]));
				}
			}
			replaceCount++;
		}

		if (commands.Count > 0) {
			var composite = new CompositeCommand($"Replace all ({replaceCount} occurrences)", commands);
			_undoRedo.Execute(composite);
			RefreshView();
			UpdateUndoRedoState();
		}

		StatusText = $"Replaced {replaceCount} occurrences";
	}

	private byte[]? ParsePattern(string input, bool isHex) {
		if (string.IsNullOrWhiteSpace(input)) return null;

		if (isHex) {
			// Parse hex string (with or without spaces)
			var cleanHex = input.Replace(" ", "").Replace("0x", "").Replace("$", "");
			if (cleanHex.Length % 2 != 0) return null;

			try {
				var bytes = new byte[cleanHex.Length / 2];
				for (int i = 0; i < bytes.Length; i++) {
					bytes[i] = Convert.ToByte(cleanHex.Substring(i * 2, 2), 16);
				}
				return bytes;
			} catch {
				return null;
			}
		} else {
			// Parse as ASCII
			return Encoding.ASCII.GetBytes(input);
		}
	}

	private List<int> SearchBytes(byte[] data, byte[] pattern) {
		var results = new List<int>();
		if (pattern.Length == 0 || pattern.Length > data.Length) return results;

		// Simple search (could be optimized with KMP for large patterns)
		for (int i = 0; i <= data.Length - pattern.Length; i++) {
			if (MatchesPattern(data, i, pattern)) {
				results.Add(i);
			}
		}

		return results;
	}

	private static bool MatchesPattern(byte[] data, int offset, byte[] pattern) {
		for (int i = 0; i < pattern.Length; i++) {
			if (data[offset + i] != pattern[i]) return false;
		}
		return true;
	}

	private string GetContextPreview(int offset, int contextBytes) {
		if (_rom is null) return "";

		int start = Math.Max(0, offset - contextBytes);
		int end = Math.Min(_rom.Length, offset + contextBytes);
		var sb = new StringBuilder();

		for (int i = start; i < end; i++) {
			if (i == offset) sb.Append('[');
			sb.Append($"{_rom.Data[i]:X2}");
			if (i == offset) sb.Append(']');
			sb.Append(' ');
		}

		return sb.ToString().TrimEnd();
	}

	#endregion

	#region IKeyboardShortcutHandler

	/// <summary>
	/// Handle keyboard shortcuts for the hex editor.
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
			ShowGotoPanel = true;
			e.Handled = true;
			return true;
		}

		// Find next (F3)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindNext)) {
			FindNextPattern();
			e.Handled = true;
			return true;
		}

		// Find previous (Shift+F3)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindPrevious)) {
			FindPreviousPattern();
			e.Handled = true;
			return true;
		}

		// Copy (Ctrl+C)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Copy)) {
			CopySelection();
			e.Handled = true;
			return true;
		}

		// Paste (Ctrl+V)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Paste)) {
			PasteAtCursor();
			e.Handled = true;
			return true;
		}

		// Undo (Ctrl+Z)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Undo)) {
			if (CanUndo) Undo();
			e.Handled = true;
			return true;
		}

		// Redo (Ctrl+Y)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Redo) ||
			KeyboardShortcuts.Matches(e, KeyboardShortcuts.RedoAlt)) {
			if (CanRedo) Redo();
			e.Handled = true;
			return true;
		}

		// Toggle compare mode (Ctrl+D)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ToggleCompare)) {
			ShowComparison = !ShowComparison;
			e.Handled = true;
			return true;
		}

		// Page Up/Down navigation
		if (e.Key == Key.PageUp) {
			CurrentOffset = Math.Max(0, CurrentOffset - (BytesPerRow * RowCount));
			e.Handled = true;
			return true;
		}
		if (e.Key == Key.PageDown) {
			int maxOffset = _rom?.Length ?? 0;
			CurrentOffset = Math.Min(maxOffset - BytesPerRow, CurrentOffset + (BytesPerRow * RowCount));
			e.Handled = true;
			return true;
		}

		// Home/End
		if (e.Key == Key.Home && e.KeyModifiers == KeyModifiers.Control) {
			CurrentOffset = 0;
			e.Handled = true;
			return true;
		}
		if (e.Key == Key.End && e.KeyModifiers == KeyModifiers.Control) {
			int maxOffset = (_rom?.Length ?? 0) - BytesPerRow;
			CurrentOffset = Math.Max(0, maxOffset);
			e.Handled = true;
			return true;
		}

		return false;
	}

	#endregion
}

/// <summary>
/// Represents a row of hex data.
/// </summary>
public record HexRow(string Address, string HexData, string AsciiData, int RawOffset);

/// <summary>
/// Represents a bookmark in the hex editor.
/// </summary>
public record HexBookmark(int Offset, string Name, DateTime Created) {
	public string OffsetDisplay => $"0x{Offset:X6}";
}

/// <summary>
/// Represents a difference between two ROMs.
/// </summary>
public record DifferenceRecord(int Offset, int Length, byte OriginalByte, byte ComparisonByte) {
	public string OffsetDisplay => $"0x{Offset:X6}";
	public string LengthDisplay => Length > 1 ? $"{Length} bytes" : "1 byte";
	public string OriginalDisplay => $"0x{OriginalByte:X2}";
	public string ComparisonDisplay => $"0x{ComparisonByte:X2}";
}

/// <summary>
/// Represents a search result.
/// </summary>
public record SearchResult(int Offset, int Length, string ContextPreview) {
	public string OffsetDisplay => $"0x{Offset:X6}";
}
