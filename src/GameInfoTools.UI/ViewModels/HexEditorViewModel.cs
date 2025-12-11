using System.Collections.ObjectModel;
using System.Text;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Commands;

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
public partial class HexEditorViewModel : ViewModelBase {
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
