using System.Collections.ObjectModel;
using System.Text;
using Avalonia;
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
					asciiParts.Add(rowData[i] is >= 0x20 and < 0x7f ? (char)rowData[i] : '.');
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

	// Internal clipboard for hex data
	private byte[]? _clipboard;

	/// <summary>
	/// Whether clipboard has hex data.
	/// </summary>
	public bool HasClipboard => _clipboard != null && _clipboard.Length > 0;

	[RelayCommand]
	private void CopySelection() {
		if (_rom is null) {
			StatusText = "No ROM loaded";
			return;
		}

		int start, length;
		if (HasRangeSelection) {
			start = SelectionStart;
			length = SelectionLength;
		} else if (SelectedOffset >= 0) {
			start = SelectedOffset;
			length = 1;
		} else {
			StatusText = "No selection to copy";
			return;
		}

		if (start < 0 || start + length > _rom.Length) {
			StatusText = "Invalid selection range";
			return;
		}

		_clipboard = new byte[length];
		Array.Copy(_rom.Data, start, _clipboard, 0, length);

		// Also format as hex string for display
		var hexString = BitConverter.ToString(_clipboard).Replace("-", " ");
		StatusText = $"Copied {length} bytes: {(hexString.Length > 50 ? hexString[..50] + "..." : hexString)}";
		OnPropertyChanged(nameof(HasClipboard));
	}

	/// <summary>
	/// Gets the clipboard from the current application's main window.
	/// </summary>
	private static Avalonia.Input.Platform.IClipboard? GetSystemClipboard() {
		if (Application.Current?.ApplicationLifetime is Avalonia.Controls.ApplicationLifetimes.IClassicDesktopStyleApplicationLifetime desktop) {
			return desktop.MainWindow?.Clipboard;
		}
		return null;
	}

	/// <summary>
	/// Copy selection to system clipboard as wikitext for Data Crystal.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsWikitext() {
		var clipboard = GetSystemClipboard();
		if (clipboard is null || _clipboard is null || _clipboard.Length == 0) {
			StatusText = "Nothing to copy";
			return;
		}

		var sb = new StringBuilder();
		var start = SelectionStart >= 0 ? SelectionStart : CurrentOffset;
		sb.AppendLine($"; Hex data from offset {{{{$|{start:x6}}}}} ({_clipboard.Length} bytes)");

		// Format as hex with Data Crystal {{$|xx}} notation
		for (int i = 0; i < _clipboard.Length; i += 16) {
			var lineBytes = Math.Min(16, _clipboard.Length - i);
			sb.Append($"; {{{{$|{(start + i):x6}}}}}  ");

			for (int j = 0; j < lineBytes; j++) {
				sb.Append($"{{{{$|{_clipboard[i + j]:x2}}}}} ");
			}

			sb.AppendLine();
		}

		await clipboard.SetTextAsync(sb.ToString());
		StatusText = $"Copied {_clipboard.Length} bytes as wikitext to clipboard";
	}

	/// <summary>
	/// Copy selection to system clipboard as hex string.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsHexString() {
		var clipboard = GetSystemClipboard();
		if (clipboard is null || _clipboard is null || _clipboard.Length == 0) {
			StatusText = "Nothing to copy";
			return;
		}

		var hexString = BitConverter.ToString(_clipboard).Replace("-", " ");
		await clipboard.SetTextAsync(hexString);
		StatusText = $"Copied {_clipboard.Length} bytes as hex string to clipboard";
	}

	/// <summary>
	/// Copy selection to system clipboard as assembly data bytes.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsAsmBytes() {
		var clipboard = GetSystemClipboard();
		if (clipboard is null || _clipboard is null || _clipboard.Length == 0) {
			StatusText = "Nothing to copy";
			return;
		}

		var sb = new StringBuilder();
		var start = SelectionStart >= 0 ? SelectionStart : CurrentOffset;
		sb.AppendLine($"; Data from offset ${start:X6} ({_clipboard.Length} bytes)");

		for (int i = 0; i < _clipboard.Length; i += 16) {
			var lineBytes = Math.Min(16, _clipboard.Length - i);
			sb.Append("\t.db ");

			for (int j = 0; j < lineBytes; j++) {
				if (j > 0) sb.Append(", ");
				sb.Append($"${_clipboard[i + j]:x2}");
			}

			sb.AppendLine();
		}

		await clipboard.SetTextAsync(sb.ToString());
		StatusText = $"Copied {_clipboard.Length} bytes as ASM data to clipboard";
	}

	[RelayCommand]
	private void PasteAtCursor() {
		if (_rom is null || _clipboard is null || _clipboard.Length == 0) {
			StatusText = "Nothing to paste";
			return;
		}

		int pasteOffset = SelectedOffset >= 0 ? SelectedOffset : CurrentOffset;
		if (pasteOffset < 0 || pasteOffset >= _rom.Length) {
			StatusText = "Invalid paste position";
			return;
		}

		int pasteLength = Math.Min(_clipboard.Length, _rom.Length - pasteOffset);
		if (pasteLength <= 0) {
			StatusText = "Cannot paste beyond ROM boundary";
			return;
		}

		var dataToPaste = new byte[pasteLength];
		Array.Copy(_clipboard, 0, dataToPaste, 0, pasteLength);

		var command = new SetBytesCommand(_rom.Data, pasteOffset, dataToPaste, $"Paste {pasteLength} bytes at 0x{pasteOffset:X6}");
		_undoRedo.Execute(command);

		RefreshView();
		UpdateUndoRedoState();
		StatusText = $"Pasted {pasteLength} bytes at 0x{pasteOffset:X6}";
	}

	/// <summary>
	/// Fill the current selection with a specific byte value.
	/// </summary>
	[RelayCommand]
	private void FillSelection(byte value) {
		if (_rom is null) {
			StatusText = "No ROM loaded";
			return;
		}

		if (!HasRangeSelection) {
			StatusText = "No range selected";
			return;
		}

		int start = SelectionStart;
		int length = SelectionLength;

		// Create fill data
		var fillData = new byte[length];
		Array.Fill(fillData, value);

		var command = new SetBytesCommand(_rom.Data, start, fillData, $"Fill {length} bytes with 0x{value:X2}");
		_undoRedo.Execute(command);

		RefreshView();
		UpdateUndoRedoState();
		StatusText = $"Filled {length} bytes with 0x{value:X2}";
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
		InspectorAscii = b is >= 0x20 and < 0x7f ? $"'{(char)b}'" : "(non-printable)";

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
	/// Toggle search panel visibility.
	/// </summary>
	[RelayCommand]
	private void ToggleSearchPanel() {
		ShowSearchPanel = !ShowSearchPanel;
		if (!ShowSearchPanel) {
			ShowGotoPanel = false; // Close goto panel too
		}
	}

	/// <summary>
	/// Close search panel.
	/// </summary>
	[RelayCommand]
	private void CloseSearchPanel() {
		ShowSearchPanel = false;
	}

	/// <summary>
	/// Toggle go to panel visibility.
	/// </summary>
	[RelayCommand]
	private void ToggleGotoPanel() {
		ShowGotoPanel = !ShowGotoPanel;
	}

	/// <summary>
	/// Close go to panel.
	/// </summary>
	[RelayCommand]
	private void CloseGotoPanel() {
		ShowGotoPanel = false;
	}

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

/// <summary>
/// Advanced hex search with wildcard and regex support.
/// </summary>
public class AdvancedHexSearch {
	/// <summary>
	/// Wildcard byte (matches any value).
	/// </summary>
	public const byte Wildcard = 0xff;

	/// <summary>
	/// Pattern element for search.
	/// </summary>
	public record PatternElement(byte? Value, byte? Mask = null) {
		public bool Matches(byte b) {
			if (!Value.HasValue) return true; // Wildcard
			if (Mask.HasValue) return (b & Mask.Value) == (Value.Value & Mask.Value);
			return b == Value.Value;
		}
	}

	/// <summary>
	/// Parse a wildcard pattern string (e.g., "A9 ?? B9 ??").
	/// </summary>
	public static List<PatternElement>? ParseWildcardPattern(string pattern) {
		if (string.IsNullOrWhiteSpace(pattern)) return null;

		var elements = new List<PatternElement>();
		var parts = pattern.Split(' ', StringSplitOptions.RemoveEmptyEntries);

		foreach (var part in parts) {
			var clean = part.Trim().Replace("0x", "").Replace("$", "");

			if (clean == "??" || clean == "**") {
				elements.Add(new PatternElement(null)); // Wildcard
			} else if (clean.Contains('?')) {
				// Partial wildcard like "A?" matches A0-AF
				string withZeros = clean.Replace('?', '0');
				string maskStr = clean.Replace('?', '0').Replace('0', 'F').Replace('1', 'F')
					.Replace('2', 'F').Replace('3', 'F').Replace('4', 'F')
					.Replace('5', 'F').Replace('6', 'F').Replace('7', 'F')
					.Replace('8', 'F').Replace('9', 'F').Replace('A', 'F')
					.Replace('B', 'F').Replace('C', 'F').Replace('D', 'F')
					.Replace('E', 'F');

				// Calculate actual mask
				byte mask = 0;
				for (int i = 0; i < clean.Length && i < 2; i++) {
					mask <<= 4;
					if (clean[i] != '?') mask |= 0xf;
				}

				if (byte.TryParse(withZeros, System.Globalization.NumberStyles.HexNumber, null, out byte value)) {
					elements.Add(new PatternElement(value, mask));
				} else {
					return null;
				}
			} else {
				if (byte.TryParse(clean, System.Globalization.NumberStyles.HexNumber, null, out byte value)) {
					elements.Add(new PatternElement(value));
				} else {
					return null;
				}
			}
		}

		return elements.Count > 0 ? elements : null;
	}

	/// <summary>
	/// Search for wildcard pattern in data.
	/// </summary>
	public static List<int> SearchWildcard(byte[] data, List<PatternElement> pattern, int maxResults = -1) {
		var results = new List<int>();
		if (pattern.Count == 0 || pattern.Count > data.Length) return results;

		for (int i = 0; i <= data.Length - pattern.Count; i++) {
			bool matches = true;
			for (int j = 0; j < pattern.Count; j++) {
				if (!pattern[j].Matches(data[i + j])) {
					matches = false;
					break;
				}
			}

			if (matches) {
				results.Add(i);
				if (maxResults > 0 && results.Count >= maxResults) break;
			}
		}

		return results;
	}

	/// <summary>
	/// Search using a value range (e.g., bytes between 0x80 and 0xff).
	/// </summary>
	public static List<int> SearchRange(byte[] data, byte minValue, byte maxValue) {
		var results = new List<int>();
		for (int i = 0; i < data.Length; i++) {
			if (data[i] >= minValue && data[i] <= maxValue) {
				results.Add(i);
			}
		}

		return results;
	}

	/// <summary>
	/// Search for a relative offset pattern (text pointer search).
	/// </summary>
	public static List<int> SearchRelativePointer(byte[] data, int targetOffset, int baseAddress = 0, bool littleEndian = true) {
		var results = new List<int>();
		int targetValue = targetOffset + baseAddress;

		if (targetValue < 0 || targetValue > 0xffff) return results;

		byte lowByte = (byte)(targetValue & 0xff);
		byte highByte = (byte)((targetValue >> 8) & 0xff);

		for (int i = 0; i < data.Length - 1; i++) {
			if (littleEndian) {
				if (data[i] == lowByte && data[i + 1] == highByte) {
					results.Add(i);
				}
			} else {
				if (data[i] == highByte && data[i + 1] == lowByte) {
					results.Add(i);
				}
			}
		}

		return results;
	}

	/// <summary>
	/// Search with alignment constraint (e.g., every 16 bytes).
	/// </summary>
	public static List<int> SearchAligned(byte[] data, byte[] pattern, int alignment) {
		var results = new List<int>();
		if (pattern.Length == 0 || alignment <= 0) return results;

		for (int i = 0; i <= data.Length - pattern.Length; i += alignment) {
			bool matches = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					matches = false;
					break;
				}
			}

			if (matches) results.Add(i);
		}

		return results;
	}

	/// <summary>
	/// Search for a sequence NOT present (find gaps in pattern).
	/// </summary>
	public static List<(int Start, int Length)> FindAbsenceOf(byte[] data, byte[] pattern, int minGapSize = 1) {
		var results = new List<(int Start, int Length)>();
		var occurrences = new HashSet<int>();

		// Find all occurrences
		for (int i = 0; i <= data.Length - pattern.Length; i++) {
			bool matches = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					matches = false;
					break;
				}
			}

			if (matches) {
				for (int j = 0; j < pattern.Length; j++) {
					occurrences.Add(i + j);
				}
			}
		}

		// Find gaps
		int gapStart = -1;
		for (int i = 0; i < data.Length; i++) {
			if (!occurrences.Contains(i)) {
				if (gapStart < 0) gapStart = i;
			} else if (gapStart >= 0) {
				int gapLength = i - gapStart;
				if (gapLength >= minGapSize) {
					results.Add((gapStart, gapLength));
				}

				gapStart = -1;
			}
		}

		// Handle trailing gap
		if (gapStart >= 0) {
			int gapLength = data.Length - gapStart;
			if (gapLength >= minGapSize) {
				results.Add((gapStart, gapLength));
			}
		}

		return results;
	}
}

/// <summary>
/// Search history management.
/// </summary>
public class SearchHistory {
	private readonly List<SearchHistoryEntry> _entries = [];

	public IReadOnlyList<SearchHistoryEntry> Entries => _entries;

	public int MaxEntries {
		get;
		set => field = Math.Max(1, value);
	} = 50;

	public void Add(string pattern, SearchType type, int resultCount) {
		// Remove if already exists
		_entries.RemoveAll(e => e.Pattern == pattern && e.Type == type);

		// Add to front
		_entries.Insert(0, new SearchHistoryEntry(pattern, type, DateTime.Now, resultCount));

		// Trim if needed
		while (_entries.Count > MaxEntries) {
			_entries.RemoveAt(_entries.Count - 1);
		}
	}

	public void Clear() => _entries.Clear();

	public List<SearchHistoryEntry> GetRecent(int count) => _entries.Take(count).ToList();
}

public record SearchHistoryEntry(string Pattern, SearchType Type, DateTime Timestamp, int ResultCount);

public enum SearchType {
	Hex,
	Text,
	Wildcard,
	Relative,
	Structure
}

/// <summary>
/// Data structure template for hex editor.
/// </summary>
public class DataStructureTemplate {
	public string Name { get; set; } = "";
	public string Description { get; set; } = "";
	public List<StructureField> Fields { get; } = [];
	public int TotalSize => Fields.Sum(f => f.Size);

	/// <summary>
	/// Apply template to data and extract values.
	/// </summary>
	public Dictionary<string, object> ExtractValues(byte[] data, int offset) {
		var values = new Dictionary<string, object>();
		int currentOffset = offset;

		foreach (var field in Fields) {
			if (currentOffset + field.Size > data.Length) break;

			object value = field.Type switch {
				FieldType.Byte => data[currentOffset],
				FieldType.SignedByte => (sbyte)data[currentOffset],
				FieldType.Word => (ushort)(data[currentOffset] | (data[currentOffset + 1] << 8)),
				FieldType.WordBE => (ushort)((data[currentOffset] << 8) | data[currentOffset + 1]),
				FieldType.DWord => (uint)(data[currentOffset] |
										  (data[currentOffset + 1] << 8) |
										  (data[currentOffset + 2] << 16) |
										  (data[currentOffset + 3] << 24)),
				FieldType.Pointer16 => (ushort)(data[currentOffset] | (data[currentOffset + 1] << 8)),
				FieldType.String => ExtractString(data, currentOffset, field.Size),
				FieldType.ByteArray => ExtractByteArray(data, currentOffset, field.Size),
				_ => data[currentOffset]
			};

			values[field.Name] = value;
			currentOffset += field.Size;
		}

		return values;
	}

	/// <summary>
	/// Format extracted values as text.
	/// </summary>
	public string FormatValues(Dictionary<string, object> values) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"=== {Name} ===");

		foreach (var field in Fields) {
			if (values.TryGetValue(field.Name, out var value)) {
				string formatted = field.Type switch {
					FieldType.Byte => $"0x{(byte)value:X2} ({value})",
					FieldType.SignedByte => $"{value}",
					FieldType.Word or FieldType.WordBE => $"0x{(ushort)value:X4} ({value})",
					FieldType.DWord => $"0x{(uint)value:X8} ({value})",
					FieldType.Pointer16 => $"0x{(ushort)value:X4}",
					FieldType.String => $"\"{value}\"",
					FieldType.ByteArray => FormatByteArray((byte[])value),
					_ => value.ToString() ?? ""
				};

				sb.AppendLine($"  {field.Name}: {formatted}");
			}
		}

		return sb.ToString();
	}

	private static string ExtractString(byte[] data, int offset, int maxLength) {
		var chars = new List<char>();
		for (int i = 0; i < maxLength && offset + i < data.Length; i++) {
			byte b = data[offset + i];
			if (b == 0) break;
			chars.Add(b >= 0x20 && b < 0x7f ? (char)b : '.');
		}

		return new string(chars.ToArray());
	}

	private static byte[] ExtractByteArray(byte[] data, int offset, int length) {
		var result = new byte[Math.Min(length, data.Length - offset)];
		Array.Copy(data, offset, result, 0, result.Length);
		return result;
	}

	private static string FormatByteArray(byte[] data) {
		return string.Join(" ", data.Select(b => $"{b:X2}"));
	}

	/// <summary>
	/// Create a common NES enemy structure template.
	/// </summary>
	public static DataStructureTemplate CreateNesEnemy() {
		return new DataStructureTemplate {
			Name = "NES Enemy",
			Description = "Common NES enemy data structure",
			Fields = {
				new StructureField("HP", FieldType.Byte, 1),
				new StructureField("Attack", FieldType.Byte, 1),
				new StructureField("Defense", FieldType.Byte, 1),
				new StructureField("Speed", FieldType.Byte, 1),
				new StructureField("EXP", FieldType.Word, 2),
				new StructureField("Gold", FieldType.Word, 2),
				new StructureField("SpriteID", FieldType.Byte, 1),
				new StructureField("AI", FieldType.Byte, 1)
			}
		};
	}

	/// <summary>
	/// Create a common NES pointer table template.
	/// </summary>
	public static DataStructureTemplate CreateNesPointerTable(int entryCount) {
		var template = new DataStructureTemplate {
			Name = "NES Pointer Table",
			Description = $"Table of {entryCount} 16-bit pointers"
		};

		for (int i = 0; i < entryCount; i++) {
			template.Fields.Add(new StructureField($"Ptr_{i:D2}", FieldType.Pointer16, 2));
		}

		return template;
	}

	/// <summary>
	/// Create SNES header template.
	/// </summary>
	public static DataStructureTemplate CreateSnesHeader() {
		return new DataStructureTemplate {
			Name = "SNES Header",
			Description = "SNES internal ROM header",
			Fields = {
				new StructureField("Title", FieldType.String, 21),
				new StructureField("MapMode", FieldType.Byte, 1),
				new StructureField("CartType", FieldType.Byte, 1),
				new StructureField("ROMSize", FieldType.Byte, 1),
				new StructureField("RAMSize", FieldType.Byte, 1),
				new StructureField("Country", FieldType.Byte, 1),
				new StructureField("License", FieldType.Byte, 1),
				new StructureField("Version", FieldType.Byte, 1),
				new StructureField("ChecksumComplement", FieldType.Word, 2),
				new StructureField("Checksum", FieldType.Word, 2)
			}
		};
	}
}

public record StructureField(string Name, FieldType Type, int Size);

public enum FieldType {
	Byte,
	SignedByte,
	Word,
	WordBE,
	DWord,
	DWordBE,
	Pointer16,
	Pointer24,
	String,
	ByteArray
}

/// <summary>
/// Multi-file search across multiple ROMs.
/// </summary>
public class MultiFileSearch {
	/// <summary>
	/// Result from a multi-file search.
	/// </summary>
	public record MultiSearchResult(string FilePath, int Offset, int Length, string ContextPreview);

	/// <summary>
	/// Search for pattern across multiple files.
	/// </summary>
	public static async Task<List<MultiSearchResult>> SearchFilesAsync(
		IEnumerable<string> filePaths,
		byte[] pattern,
		IProgress<(string File, int Progress)>? progress = null,
		CancellationToken cancellationToken = default) {
		var results = new List<MultiSearchResult>();

		foreach (var filePath in filePaths) {
			cancellationToken.ThrowIfCancellationRequested();
			progress?.Report((filePath, 0));

			try {
				var data = await File.ReadAllBytesAsync(filePath, cancellationToken);
				var fileResults = SearchInData(data, pattern, filePath);
				results.AddRange(fileResults);

				progress?.Report((filePath, 100));
			} catch (Exception) {
				// Skip files that can't be read
			}
		}

		return results;
	}

	private static List<MultiSearchResult> SearchInData(byte[] data, byte[] pattern, string filePath) {
		var results = new List<MultiSearchResult>();

		for (int i = 0; i <= data.Length - pattern.Length; i++) {
			bool matches = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					matches = false;
					break;
				}
			}

			if (matches) {
				string context = GetContext(data, i, pattern.Length, 4);
				results.Add(new MultiSearchResult(filePath, i, pattern.Length, context));
			}
		}

		return results;
	}

	private static string GetContext(byte[] data, int offset, int length, int contextBytes) {
		int start = Math.Max(0, offset - contextBytes);
		int end = Math.Min(data.Length, offset + length + contextBytes);

		var sb = new System.Text.StringBuilder();
		for (int i = start; i < end; i++) {
			if (i == offset) sb.Append('[');
			sb.Append($"{data[i]:X2}");
			if (i == offset + length - 1) sb.Append(']');
			if (i < end - 1) sb.Append(' ');
		}

		return sb.ToString();
	}

	/// <summary>
	/// Find files containing pattern.
	/// </summary>
	public static async Task<List<string>> FindFilesContaining(
		string directory,
		byte[] pattern,
		string searchPattern = "*.nes;*.sfc;*.smc;*.gba;*.gb;*.gbc",
		CancellationToken cancellationToken = default) {
		var matchingFiles = new List<string>();
		var extensions = searchPattern.Split(';').Select(p => p.TrimStart('*')).ToArray();

		var files = Directory.EnumerateFiles(directory, "*.*", SearchOption.AllDirectories)
			.Where(f => extensions.Any(ext => f.EndsWith(ext, StringComparison.OrdinalIgnoreCase)));

		foreach (var file in files) {
			cancellationToken.ThrowIfCancellationRequested();

			try {
				var data = await File.ReadAllBytesAsync(file, cancellationToken);
				if (ContainsPattern(data, pattern)) {
					matchingFiles.Add(file);
				}
			} catch {
				// Skip
			}
		}

		return matchingFiles;
	}

	private static bool ContainsPattern(byte[] data, byte[] pattern) {
		if (pattern.Length == 0 || pattern.Length > data.Length) return false;

		for (int i = 0; i <= data.Length - pattern.Length; i++) {
			bool matches = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					matches = false;
					break;
				}
			}

			if (matches) return true;
		}

		return false;
	}
}
