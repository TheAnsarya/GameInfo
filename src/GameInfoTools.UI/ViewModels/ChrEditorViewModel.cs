using System.Collections.ObjectModel;
using System.Text;
using Avalonia.Controls;
using Avalonia.Media;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Graphics;
using GameInfoTools.UI.Services;

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

	[ObservableProperty]
	private bool _showGrid = true;

	[ObservableProperty]
	private Color[] _currentPalette = GetDefaultPalette();

	[ObservableProperty]
	private int _selectedPaletteIndex;

	[ObservableProperty]
	private int _selectedColorIndex;

	/// <summary>
	/// Tile preview transformations for flip/rotate preview.
	/// </summary>
	[ObservableProperty]
	private byte[,]? _previewFlipH;

	[ObservableProperty]
	private byte[,]? _previewFlipV;

	[ObservableProperty]
	private byte[,]? _previewRotate90;

	[ObservableProperty]
	private byte[,]? _previewRotate180;

	[ObservableProperty]
	private byte[,]? _previewRotate270;

	public ObservableCollection<TileInfo> Tiles { get; } = [];

	/// <summary>
	/// Gets the tile data for visual rendering.
	/// </summary>
	public ObservableCollection<byte[,]> TileGraphics { get; } = [];

	/// <summary>
	/// Gets the currently selected tile data for the enlarged preview.
	/// </summary>
	[ObservableProperty]
	private byte[,]? _selectedTileData;

	/// <summary>
	/// Available preset palettes.
	/// </summary>
	public ObservableCollection<PalettePreset> PalettePresets { get; } = [
		new PalettePreset("Grayscale", GetDefaultPalette()),
		new PalettePreset("NES Default", GetNesPalette()),
		new PalettePreset("Game Boy", GetGameBoyPalette()),
		new PalettePreset("Game Boy Pocket", GetGameBoyPocketPalette()),
		new PalettePreset("Virtual Boy", GetVirtualBoyPalette()),
		new PalettePreset("Sepia", GetSepiaPalette()),
		new PalettePreset("Inverted", GetInvertedPalette()),
	];

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
		TileGraphics.Clear();

		if (_chrEditor is null) return;

		// Load first 256 tiles (or less if not available)
		int count = Math.Min(256, TileCount);
		for (int i = 0; i < count; i++) {
			var tile = _chrEditor.GetTile(i);
			Tiles.Add(new TileInfo(i, $"Tile {i:X2}", GetTilePreviewString(tile)));
			TileGraphics.Add(tile);
		}

		// Set selected tile data if valid
		if (SelectedTileIndex >= 0 && SelectedTileIndex < TileGraphics.Count) {
			SelectedTileData = TileGraphics[SelectedTileIndex];
			UpdateTransformPreviews();
		}
	}

	partial void OnSelectedTileIndexChanged(int value) {
		if (value >= 0 && value < TileGraphics.Count) {
			SelectedTileData = TileGraphics[value];
			UpdateTransformPreviews();
		}
	}

	private void UpdateTransformPreviews() {
		if (SelectedTileData is null) {
			PreviewFlipH = null;
			PreviewFlipV = null;
			PreviewRotate90 = null;
			PreviewRotate180 = null;
			PreviewRotate270 = null;
			return;
		}

		PreviewFlipH = FlipHorizontal(SelectedTileData);
		PreviewFlipV = FlipVertical(SelectedTileData);
		PreviewRotate90 = Rotate90(SelectedTileData);
		PreviewRotate180 = Rotate90(PreviewRotate90);
		PreviewRotate270 = Rotate90(PreviewRotate180);
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
		TileGraphics.Clear();
		int startTile = SelectedBank * ChrEditor.TilesPerBank;
		int endTile = Math.Min(startTile + ChrEditor.TilesPerBank, TileCount);

		for (int i = startTile; i < endTile; i++) {
			var tile = _chrEditor.GetTile(i);
			Tiles.Add(new TileInfo(i, $"Tile {i:X2}", GetTilePreviewString(tile)));
			TileGraphics.Add(tile);
		}

		StatusText = $"Bank {SelectedBank}: Tiles {startTile:X3} - {endTile - 1:X3}";
	}

	[RelayCommand]
	private void SelectTile(int index) {
		if (index >= 0 && index < TileGraphics.Count) {
			// Adjust for bank offset
			int startTile = SelectedBank * ChrEditor.TilesPerBank;
			SelectedTileIndex = startTile + index;
			SelectedTileData = TileGraphics[index];
			StatusText = $"Selected tile {SelectedTileIndex:X2}";
		}
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

	[RelayCommand]
	private async Task ExportTileset(Window? window) {
		if (window is null || _chrEditor is null) {
			StatusText = "Unable to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Tileset",
			".png",
			$"tileset_bank{SelectedBank:D2}.png",
			FileDialogService.PngFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			// Export current bank to raw pixel data (16x16 tiles = 128x128 pixels)
			int tilesPerRow = 16;
			int tilesPerColumn = 16;
			int imageWidth = tilesPerRow * 8;
			int imageHeight = tilesPerColumn * 8;

			var pixels = new byte[imageWidth * imageHeight];

			int startTile = SelectedBank * ChrEditor.TilesPerBank;
			int endTile = Math.Min(startTile + ChrEditor.TilesPerBank, TileCount);

			for (int tileIdx = startTile; tileIdx < endTile; tileIdx++) {
				var tile = _chrEditor.GetTile(tileIdx);
				int localIdx = tileIdx - startTile;
				int tileX = localIdx % tilesPerRow;
				int tileY = localIdx / tilesPerRow;

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						int px = (tileX * 8) + x;
						int py = (tileY * 8) + y;
						pixels[(py * imageWidth) + px] = (byte)(tile[y, x] * 85); // Scale 0-3 to grayscale
					}
				}
			}

			// Create PGM file (grayscale, simple format)
			var pgmPath = Path.ChangeExtension(path, ".pgm");
			await using var fs = File.Create(pgmPath);
			await using var sw = new StreamWriter(fs, Encoding.ASCII);
			await sw.WriteLineAsync("P5"); // PGM binary format
			await sw.WriteLineAsync($"{imageWidth} {imageHeight}");
			await sw.WriteLineAsync("255");
			await sw.FlushAsync();
			await fs.WriteAsync(pixels);

			StatusText = $"Exported tileset to {Path.GetFileName(pgmPath)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task ImportTileset(Window? window) {
		if (window is null || _chrEditor is null) {
			StatusText = "Unable to import";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Import Tileset",
			FileDialogService.PngFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		StatusText = $"Import from {Path.GetFileName(path)} - not yet fully implemented";
		// TODO: Implement actual import when we have proper image loading
	}

	[RelayCommand]
	private void SelectPalette(PalettePreset? preset) {
		if (preset is null) return;
		CurrentPalette = preset.Colors;
		StatusText = $"Palette changed to {preset.Name}";
	}

	[RelayCommand]
	private void ApplyFlipHorizontal() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewFlipH is null) return;
		_chrEditor.SetTile(SelectedTileIndex, PreviewFlipH);
		LoadTilePreview();
		StatusText = $"Applied horizontal flip to tile {SelectedTileIndex:X2}";
	}

	[RelayCommand]
	private void ApplyFlipVertical() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewFlipV is null) return;
		_chrEditor.SetTile(SelectedTileIndex, PreviewFlipV);
		LoadTilePreview();
		StatusText = $"Applied vertical flip to tile {SelectedTileIndex:X2}";
	}

	[RelayCommand]
	private void ApplyRotate90() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewRotate90 is null) return;
		_chrEditor.SetTile(SelectedTileIndex, PreviewRotate90);
		LoadTilePreview();
		StatusText = $"Applied 90° rotation to tile {SelectedTileIndex:X2}";
	}

	[RelayCommand]
	private void ApplyRotate180() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewRotate180 is null) return;
		_chrEditor.SetTile(SelectedTileIndex, PreviewRotate180);
		LoadTilePreview();
		StatusText = $"Applied 180° rotation to tile {SelectedTileIndex:X2}";
	}

	[RelayCommand]
	private void ApplyRotate270() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewRotate270 is null) return;
		_chrEditor.SetTile(SelectedTileIndex, PreviewRotate270);
		LoadTilePreview();
		StatusText = $"Applied 270° rotation to tile {SelectedTileIndex:X2}";
	}

	#region Palette Presets

	/// <summary>
	/// Gets the default grayscale palette.
	/// </summary>
	public static Color[] GetDefaultPalette() => [
		Color.FromRgb(0, 0, 0),       // Black
		Color.FromRgb(85, 85, 85),    // Dark gray
		Color.FromRgb(170, 170, 170), // Light gray
		Color.FromRgb(255, 255, 255)  // White
	];

	/// <summary>
	/// Gets an NES-inspired palette (using common NES colors).
	/// </summary>
	public static Color[] GetNesPalette() => [
		Color.FromRgb(0, 0, 0),       // Black
		Color.FromRgb(188, 0, 0),     // Red
		Color.FromRgb(0, 120, 0),     // Green
		Color.FromRgb(252, 216, 168)  // Skin tone
	];

	/// <summary>
	/// Gets the classic Game Boy green palette.
	/// </summary>
	public static Color[] GetGameBoyPalette() => [
		Color.FromRgb(15, 56, 15),    // Darkest green
		Color.FromRgb(48, 98, 48),    // Dark green
		Color.FromRgb(139, 172, 15),  // Light green
		Color.FromRgb(155, 188, 15)   // Lightest green
	];

	/// <summary>
	/// Gets the Game Boy Pocket grayscale palette.
	/// </summary>
	public static Color[] GetGameBoyPocketPalette() => [
		Color.FromRgb(0, 0, 0),       // Black
		Color.FromRgb(86, 86, 86),    // Dark gray
		Color.FromRgb(172, 172, 172), // Light gray
		Color.FromRgb(255, 255, 255)  // White
	];

	/// <summary>
	/// Gets a Virtual Boy-inspired red palette.
	/// </summary>
	public static Color[] GetVirtualBoyPalette() => [
		Color.FromRgb(0, 0, 0),       // Black
		Color.FromRgb(85, 0, 0),      // Dark red
		Color.FromRgb(170, 0, 0),     // Medium red
		Color.FromRgb(255, 0, 0)      // Bright red
	];

	/// <summary>
	/// Gets a sepia-toned palette.
	/// </summary>
	public static Color[] GetSepiaPalette() => [
		Color.FromRgb(44, 28, 12),    // Dark sepia
		Color.FromRgb(100, 72, 44),   // Medium-dark sepia
		Color.FromRgb(180, 148, 108), // Medium-light sepia
		Color.FromRgb(252, 236, 200)  // Light sepia
	];

	/// <summary>
	/// Gets an inverted grayscale palette.
	/// </summary>
	public static Color[] GetInvertedPalette() => [
		Color.FromRgb(255, 255, 255), // White
		Color.FromRgb(170, 170, 170), // Light gray
		Color.FromRgb(85, 85, 85),    // Dark gray
		Color.FromRgb(0, 0, 0)        // Black
	];

	#endregion
}

/// <summary>
/// Represents a tile for display.
/// </summary>
public record TileInfo(int Index, string Name, string Preview);

/// <summary>
/// Represents a palette preset.
/// </summary>
public record PalettePreset(string Name, Color[] Colors);

