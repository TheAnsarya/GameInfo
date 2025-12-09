using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Graphics;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for CHR tile editing.
/// </summary>
public partial class ChrEditorViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private ChrEditor? _chrEditor;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private int _tileCount;

	[ObservableProperty]
	private int _bankCount;

	[ObservableProperty]
	private int _selectedTileIndex;

	[ObservableProperty]
	private int _selectedBank;

	[ObservableProperty]
	private int _chrOffset;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _tileFormat = "NES 2bpp";

	[ObservableProperty]
	private int _zoom = 2;

	public ObservableCollection<TileInfo> Tiles { get; } = [];

	public string[] AvailableFormats { get; } = [
		"NES 2bpp",
		"SNES 4bpp",
		"GB 2bpp",
		"Linear 4bpp",
		"GBA 8bpp"
	];

	public ChrEditorViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded) {
			InitializeChrEditor();
		}
	}

	private void InitializeChrEditor() {
		if (_rom is null || !_rom.IsLoaded) return;

		var info = _rom.GetInfo();
		var header = _rom.Header;

		// Determine CHR offset based on system
		if (info.System == SystemType.Nes && header is not null) {
			// NES CHR ROM starts after header and PRG ROM
			ChrOffset = header.HeaderSize + header.PrgRomSize;
			var chrSize = header.ChrRomSize;
			if (chrSize > 0) {
				_chrEditor = new ChrEditor(_rom.Data, ChrOffset, chrSize);
				TileCount = _chrEditor.TileCount;
				BankCount = _chrEditor.BankCount;
				StatusText = $"Loaded {TileCount} tiles in {BankCount} banks";
				LoadTilePreview();
			} else {
				StatusText = "No CHR ROM found (CHR RAM game)";
			}
		} else {
			// For other systems, start at offset 0 and let user adjust
			_chrEditor = new ChrEditor(_rom.Data, 0);
			TileCount = _chrEditor.TileCount;
			BankCount = _chrEditor.BankCount;
			StatusText = $"Loaded {TileCount} tiles";
			LoadTilePreview();
		}
	}

	private void LoadTilePreview() {
		Tiles.Clear();

		if (_chrEditor is null) return;

		// Load first 256 tiles (or less if not available)
		int count = Math.Min(256, TileCount);
		for (int i = 0; i < count; i++) {
			var tile = _chrEditor.GetTile(i);
			Tiles.Add(new TileInfo(i, $"Tile {i:X2}", GetTilePreviewString(tile)));
		}
	}

	private static string GetTilePreviewString(byte[,] tile) {
		// Create a simple ASCII representation of the tile
		var sb = new System.Text.StringBuilder();
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				sb.Append(tile[y, x] switch {
					0 => '.',
					1 => '░',
					2 => '▒',
					_ => '█'
				});
			}
			if (y < 7) sb.Append('\n');
		}
		return sb.ToString();
	}

	[RelayCommand]
	private void SetChrOffset(int offset) {
		if (_rom is null || !_rom.IsLoaded) return;

		ChrOffset = offset;
		var maxLength = _rom.Length - offset;
		if (maxLength > 0) {
			_chrEditor = new ChrEditor(_rom.Data, offset, maxLength);
			TileCount = _chrEditor.TileCount;
			BankCount = _chrEditor.BankCount;
			LoadTilePreview();
			StatusText = $"CHR offset set to 0x{offset:X6}";
		}
	}

	[RelayCommand]
	private void NextBank() {
		if (SelectedBank < BankCount - 1) {
			SelectedBank++;
			LoadBankTiles();
		}
	}

	[RelayCommand]
	private void PreviousBank() {
		if (SelectedBank > 0) {
			SelectedBank--;
			LoadBankTiles();
		}
	}

	private void LoadBankTiles() {
		if (_chrEditor is null) return;

		Tiles.Clear();
		int startTile = SelectedBank * ChrEditor.TilesPerBank;
		int endTile = Math.Min(startTile + ChrEditor.TilesPerBank, TileCount);

		for (int i = startTile; i < endTile; i++) {
			var tile = _chrEditor.GetTile(i);
			Tiles.Add(new TileInfo(i, $"Tile {i:X2}", GetTilePreviewString(tile)));
		}

		StatusText = $"Bank {SelectedBank}: Tiles {startTile:X3} - {endTile - 1:X3}";
	}

	[RelayCommand]
	private void ZoomIn() {
		if (Zoom < 8) Zoom++;
	}

	[RelayCommand]
	private void ZoomOut() {
		if (Zoom > 1) Zoom--;
	}

	[RelayCommand]
	private void FlipTileHorizontal() {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;

		var tile = _chrEditor.GetTile(SelectedTileIndex);
		var flipped = FlipHorizontal(tile);
		_chrEditor.SetTile(SelectedTileIndex, flipped);
		LoadTilePreview();
		StatusText = $"Flipped tile {SelectedTileIndex:X2} horizontally";
	}

	[RelayCommand]
	private void FlipTileVertical() {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;

		var tile = _chrEditor.GetTile(SelectedTileIndex);
		var flipped = FlipVertical(tile);
		_chrEditor.SetTile(SelectedTileIndex, flipped);
		LoadTilePreview();
		StatusText = $"Flipped tile {SelectedTileIndex:X2} vertically";
	}

	[RelayCommand]
	private void RotateTile() {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;

		var tile = _chrEditor.GetTile(SelectedTileIndex);
		var rotated = Rotate90(tile);
		_chrEditor.SetTile(SelectedTileIndex, rotated);
		LoadTilePreview();
		StatusText = $"Rotated tile {SelectedTileIndex:X2} 90°";
	}

	// Local tile transformation helpers (TODO: move to TileGraphics)
	private static byte[,] FlipHorizontal(byte[,] tile) {
		var result = new byte[8, 8];
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				result[y, 7 - x] = tile[y, x];
		return result;
	}

	private static byte[,] FlipVertical(byte[,] tile) {
		var result = new byte[8, 8];
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				result[7 - y, x] = tile[y, x];
		return result;
	}

	private static byte[,] Rotate90(byte[,] tile) {
		var result = new byte[8, 8];
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				result[x, 7 - y] = tile[y, x];
		return result;
	}
}

/// <summary>
/// Represents a tile for display.
/// </summary>
public record TileInfo(int Index, string Name, string Preview);
