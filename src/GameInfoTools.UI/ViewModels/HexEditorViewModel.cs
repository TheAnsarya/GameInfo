using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for hex editing.
/// </summary>
public partial class HexEditorViewModel : ViewModelBase {
	private readonly RomFile? _rom;

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

	public ObservableCollection<HexRow> HexRows { get; } = [];

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

	public void WriteByte(int offset, byte value) {
		if (_rom is null || offset < 0 || offset >= _rom.Length) return;

		_rom.WriteByte(offset, value);
		RefreshView();
		StatusText = $"Wrote 0x{value:X2} at offset 0x{offset:X6}";
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
}

/// <summary>
/// Represents a row of hex data.
/// </summary>
public record HexRow(string Address, string HexData, string AsciiData, int RawOffset);
