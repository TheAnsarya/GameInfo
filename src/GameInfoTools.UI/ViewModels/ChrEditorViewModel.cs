using System.Collections.ObjectModel;
using System.Text;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media;
using Avalonia.Media.Imaging;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Commands;
using GameInfoTools.Graphics;
using GameInfoTools.UI.Controls;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for CHR tile editing.
/// </summary>
public partial class ChrEditorViewModel : ViewModelBase, IKeyboardShortcutHandler {
	private readonly RomFile? _rom;
	private ChrEditor? _chrEditor;
	private readonly UndoRedoManager _undoRedo = new(maxHistorySize: 100);

	/// <summary>
	/// Clipboard for tile copy/paste operations.
	/// </summary>
	private byte[,]? _clipboardTile;

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

	[ObservableProperty]
	private string _undoDescription = "";

	[ObservableProperty]
	private string _redoDescription = "";

	[ObservableProperty]
	private bool _hasClipboard;

	/// <summary>
	/// Whether pixel editing mode is active.
	/// </summary>
	[ObservableProperty]
	private bool _isPixelEditMode;

	/// <summary>
	/// Current drawing tool.
	/// </summary>
	[ObservableProperty]
	private DrawingTool _currentDrawingTool = DrawingTool.Pencil;

	/// <summary>
	/// Whether animation is playing.
	/// </summary>
	[ObservableProperty]
	private bool _isAnimationPlaying;

	/// <summary>
	/// Animation frames for the tile animation preview.
	/// </summary>
	[ObservableProperty]
	private ObservableCollection<byte[,]> _animationFrames = [];

	/// <summary>
	/// Current animation frame index.
	/// </summary>
	[ObservableProperty]
	private int _animationFrameIndex;

	/// <summary>
	/// Animation speed in milliseconds per frame.
	/// </summary>
	[ObservableProperty]
	private int _animationSpeedMs = 200;

	/// <summary>
	/// Whether undo history panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showUndoHistory;

	/// <summary>
	/// List of undo history entries.
	/// </summary>
	[ObservableProperty]
	private ObservableCollection<string> _undoHistoryList = [];

	/// <summary>
	/// List of redo history entries.
	/// </summary>
	[ObservableProperty]
	private ObservableCollection<string> _redoHistoryList = [];

	/// <summary>
	/// Whether comparison view is enabled.
	/// </summary>
	[ObservableProperty]
	private bool _showComparisonView;

	/// <summary>
	/// Original tile data for comparison (before any edits).
	/// </summary>
	[ObservableProperty]
	private byte[,]? _originalTileData;

	/// <summary>
	/// Whether multi-select mode is enabled.
	/// </summary>
	[ObservableProperty]
	private bool _allowMultiSelect;

	/// <summary>
	/// Grid overlay mode for the tile grid.
	/// </summary>
	[ObservableProperty]
	private GridOverlayMode _gridOverlayMode = GridOverlayMode.None;

	/// <summary>
	/// List of selected tile indices in multi-select mode.
	/// </summary>
	[ObservableProperty]
	private ObservableCollection<int> _selectedTileIndices = [];

	/// <summary>
	/// Pixel selection in the current tile (for copy/paste regions).
	/// </summary>
	[ObservableProperty]
	private Rect? _pixelSelection;

	/// <summary>
	/// Clipboard for pixel region copy/paste.
	/// </summary>
	private byte[,]? _pixelClipboard;

	/// <summary>
	/// Whether pixel clipboard has content.
	/// </summary>
	[ObservableProperty]
	private bool _hasPixelClipboard;

	/// <summary>
	/// Whether tile search panel is visible.
	/// </summary>
	[ObservableProperty]
	private bool _showTileSearch;

	/// <summary>
	/// Tile search results.
	/// </summary>
	[ObservableProperty]
	private ObservableCollection<int> _tileSearchResults = [];

	/// <summary>
	/// Search by dominant color index (0-3, or -1 for any).
	/// </summary>
	[ObservableProperty]
	private int _searchColorIndex = -1;

	/// <summary>
	/// Search for tiles similar to current tile.
	/// </summary>
	[ObservableProperty]
	private int _searchSimilarityThreshold = 80;

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
	/// Gets whether undo is available.
	/// </summary>
	public bool CanUndo => _undoRedo.CanUndo;

	/// <summary>
	/// Gets whether redo is available.
	/// </summary>
	public bool CanRedo => _undoRedo.CanRedo;

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
		"SNES 2bpp",
		"SNES 4bpp",
		"SNES 8bpp",
		"GB 2bpp",
		"GBA 4bpp",
		"GBA 8bpp",
		"Linear 1bpp",
		"Linear 2bpp",
		"Linear 4bpp"
	];

	/// <summary>
	/// Current tile format for decoding/encoding.
	/// </summary>
	[ObservableProperty]
	private Core.TileGraphics.TileFormat _currentTileFormat = Core.TileGraphics.TileFormat.Nes2Bpp;

	/// <summary>
	/// Number of colors available in current format.
	/// </summary>
	public int FormatColorCount => Core.TileGraphics.GetColorsPerTile(CurrentTileFormat);

	/// <summary>
	/// Bytes per tile in current format.
	/// </summary>
	public int FormatBytesPerTile => Core.TileGraphics.GetBytesPerTile(CurrentTileFormat);

	/// <summary>
	/// Sprite sheet configuration: tiles per row.
	/// </summary>
	[ObservableProperty]
	private int _spriteSheetTilesPerRow = 16;

	/// <summary>
	/// Sprite sheet configuration: spacing between tiles.
	/// </summary>
	[ObservableProperty]
	private int _spriteSheetSpacing;

	/// <summary>
	/// Sprite sheet configuration: include grid lines.
	/// </summary>
	[ObservableProperty]
	private bool _spriteSheetShowGrid;

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

	/// <summary>
	/// Called when tile format changes - recalculate tile count and reload.
	/// </summary>
	partial void OnCurrentTileFormatChanged(Core.TileGraphics.TileFormat value) {
		OnPropertyChanged(nameof(FormatColorCount));
		OnPropertyChanged(nameof(FormatBytesPerTile));

		// Update the string representation
		TileFormat = value switch {
			Core.TileGraphics.TileFormat.Nes2Bpp => "NES 2bpp",
			Core.TileGraphics.TileFormat.Snes2Bpp => "SNES 2bpp",
			Core.TileGraphics.TileFormat.Snes4Bpp => "SNES 4bpp",
			Core.TileGraphics.TileFormat.Snes8Bpp => "SNES 8bpp",
			Core.TileGraphics.TileFormat.Gb2Bpp => "GB 2bpp",
			Core.TileGraphics.TileFormat.Gba4Bpp => "GBA 4bpp",
			Core.TileGraphics.TileFormat.Gba8Bpp => "GBA 8bpp",
			Core.TileGraphics.TileFormat.Linear1Bpp => "Linear 1bpp",
			Core.TileGraphics.TileFormat.Linear2Bpp => "Linear 2bpp",
			Core.TileGraphics.TileFormat.Linear4Bpp => "Linear 4bpp",
			_ => "NES 2bpp"
		};

		// Recalculate tile count based on new format
		RecalculateTileCount();
		LoadTilePreviewWithFormat();
		StatusText = $"Switched to {TileFormat} ({FormatColorCount} colors, {FormatBytesPerTile} bytes/tile)";
	}

	/// <summary>
	/// Sets tile format from string name.
	/// </summary>
	[RelayCommand]
	private void SetTileFormat(string formatName) {
		CurrentTileFormat = formatName switch {
			"NES 2bpp" => Core.TileGraphics.TileFormat.Nes2Bpp,
			"SNES 2bpp" => Core.TileGraphics.TileFormat.Snes2Bpp,
			"SNES 4bpp" => Core.TileGraphics.TileFormat.Snes4Bpp,
			"SNES 8bpp" => Core.TileGraphics.TileFormat.Snes8Bpp,
			"GB 2bpp" => Core.TileGraphics.TileFormat.Gb2Bpp,
			"GBA 4bpp" => Core.TileGraphics.TileFormat.Gba4Bpp,
			"GBA 8bpp" => Core.TileGraphics.TileFormat.Gba8Bpp,
			"Linear 1bpp" => Core.TileGraphics.TileFormat.Linear1Bpp,
			"Linear 2bpp" => Core.TileGraphics.TileFormat.Linear2Bpp,
			"Linear 4bpp" => Core.TileGraphics.TileFormat.Linear4Bpp,
			_ => Core.TileGraphics.TileFormat.Nes2Bpp
		};
	}

	/// <summary>
	/// Recalculates tile count based on current format.
	/// </summary>
	private void RecalculateTileCount() {
		if (_rom is null || !_rom.IsLoaded) return;

		int dataLength = _rom.Length - ChrOffset;
		int bytesPerTile = FormatBytesPerTile;
		TileCount = dataLength / bytesPerTile;
		BankCount = (TileCount + ChrEditor.TilesPerBank - 1) / ChrEditor.TilesPerBank;
	}

	/// <summary>
	/// Loads tile preview using current format.
	/// </summary>
	private void LoadTilePreviewWithFormat() {
		Tiles.Clear();
		TileGraphics.Clear();

		if (_rom is null || !_rom.IsLoaded) return;

		int bytesPerTile = FormatBytesPerTile;
		int count = Math.Min(256, TileCount);

		for (int i = 0; i < count; i++) {
			int offset = ChrOffset + (i * bytesPerTile);
			var tile = Core.TileGraphics.DecodeTile(_rom.Data, offset, CurrentTileFormat);
			Tiles.Add(new TileInfo(i, $"Tile {i:X2}", GetTilePreviewString(tile)));
			TileGraphics.Add(tile);
		}

		if (SelectedTileIndex >= 0 && SelectedTileIndex < TileGraphics.Count) {
			SelectedTileData = TileGraphics[SelectedTileIndex];
			UpdateTransformPreviews();
		}
	}

	/// <summary>
	/// Gets a tile using current format.
	/// </summary>
	private byte[,] GetTileWithFormat(int index) {
		if (_rom is null || !_rom.IsLoaded || index < 0 || index >= TileCount) {
			return new byte[8, 8];
		}

		int bytesPerTile = FormatBytesPerTile;
		int offset = ChrOffset + (index * bytesPerTile);
		return Core.TileGraphics.DecodeTile(_rom.Data, offset, CurrentTileFormat);
	}

	/// <summary>
	/// Sets a tile using current format.
	/// </summary>
	private void SetTileWithFormat(int index, byte[,] tile) {
		if (_rom is null || !_rom.IsLoaded || index < 0 || index >= TileCount) return;

		int bytesPerTile = FormatBytesPerTile;
		int offset = ChrOffset + (index * bytesPerTile);
		var encoded = Core.TileGraphics.EncodeTile(tile, CurrentTileFormat);
		Array.Copy(encoded, 0, _rom.Data, offset, bytesPerTile);
	}

	#region Sprite Sheet Export

	/// <summary>
	/// Exports selected tiles as a sprite sheet PNG.
	/// </summary>
	[RelayCommand]
	private async Task ExportSpriteSheet(Window? window) {
		if (window is null || _rom is null || !_rom.IsLoaded) {
			StatusText = "Unable to export sprite sheet";
			return;
		}

		// Use selected tiles if multi-select active, otherwise use current bank
		var tilesToExport = SelectedTileIndices.Count > 0
			? SelectedTileIndices.Select(i => (SelectedBank * ChrEditor.TilesPerBank) + i).ToList()
			: Enumerable.Range(SelectedBank * ChrEditor.TilesPerBank, Math.Min(ChrEditor.TilesPerBank, TileCount - (SelectedBank * ChrEditor.TilesPerBank))).ToList();

		if (tilesToExport.Count == 0) {
			StatusText = "No tiles to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Sprite Sheet",
			".png",
			$"spritesheet_{tilesToExport.Count}tiles.png",
			FileDialogService.PngFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			int tilesPerRow = SpriteSheetTilesPerRow;
			int spacing = SpriteSheetSpacing;
			int tileSize = 8;
			int cellSize = tileSize + spacing;

			int rows = (tilesToExport.Count + tilesPerRow - 1) / tilesPerRow;
			int imageWidth = (tilesPerRow * cellSize) - spacing;
			int imageHeight = (rows * cellSize) - spacing;

			var pixels = new byte[imageWidth * imageHeight * 4];
			var palette = CurrentPalette;

			// Fill with transparency or background
			for (int i = 0; i < pixels.Length; i += 4) {
				pixels[i + 0] = 0;     // B
				pixels[i + 1] = 0;     // G
				pixels[i + 2] = 0;     // R
				pixels[i + 3] = 0;     // A (transparent)
			}

			// Draw tiles
			for (int idx = 0; idx < tilesToExport.Count; idx++) {
				int tileIndex = tilesToExport[idx];
				var tile = GetTileWithFormat(tileIndex);

				int tileX = idx % tilesPerRow;
				int tileY = idx / tilesPerRow;
				int baseX = tileX * cellSize;
				int baseY = tileY * cellSize;

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						int px = baseX + x;
						int py = baseY + y;
						if (px >= imageWidth || py >= imageHeight) continue;

						int pixelOffset = ((py * imageWidth) + px) * 4;
						byte colorIndex = tile[y, x];
						var color = colorIndex < palette.Length ? palette[colorIndex] : Colors.Magenta;

						pixels[pixelOffset + 0] = color.B;
						pixels[pixelOffset + 1] = color.G;
						pixels[pixelOffset + 2] = color.R;
						pixels[pixelOffset + 3] = colorIndex == 0 ? (byte)0 : (byte)255; // Color 0 = transparent
					}
				}
			}

			// Draw grid lines if enabled
			if (SpriteSheetShowGrid && spacing > 0) {
				for (int i = 0; i < pixels.Length; i += 4) {
					int pixelIndex = i / 4;
					int px = pixelIndex % imageWidth;
					int py = pixelIndex / imageWidth;

					// Check if this pixel is in a grid line area
					bool inGridX = (px + 1) % cellSize < spacing && px < imageWidth;
					bool inGridY = (py + 1) % cellSize < spacing && py < imageHeight;

					if ((inGridX || inGridY) && pixels[i + 3] == 0) {
						pixels[i + 0] = 64;  // B - dark gray grid
						pixels[i + 1] = 64;  // G
						pixels[i + 2] = 64;  // R
						pixels[i + 3] = 255; // A
					}
				}
			}

			var bitmap = new WriteableBitmap(
				new Avalonia.PixelSize(imageWidth, imageHeight),
				new Avalonia.Vector(96, 96),
				Avalonia.Platform.PixelFormat.Bgra8888,
				Avalonia.Platform.AlphaFormat.Unpremul);

			using (var fb = bitmap.Lock()) {
				System.Runtime.InteropServices.Marshal.Copy(pixels, 0, fb.Address, pixels.Length);
			}

			bitmap.Save(path);
			StatusText = $"Exported {tilesToExport.Count} tiles to sprite sheet: {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	/// <summary>
	/// Exports tiles as individual PNG files.
	/// </summary>
	[RelayCommand]
	private async Task ExportTilesIndividually(Window? window) {
		if (window is null || _rom is null || !_rom.IsLoaded) {
			StatusText = "Unable to export tiles";
			return;
		}

		var tilesToExport = SelectedTileIndices.Count > 0
			? SelectedTileIndices.Select(i => (SelectedBank * ChrEditor.TilesPerBank) + i).ToList()
			: [SelectedTileIndex];

		if (tilesToExport.Count == 0 || tilesToExport[0] < 0) {
			StatusText = "No tiles selected";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var folder = await dialogService.SelectFolderAsync("Select Export Folder");

		if (folder is null) return;

		try {
			int zoom = Math.Max(1, Zoom);
			int tileSize = 8 * zoom;
			var palette = CurrentPalette;

			foreach (var tileIndex in tilesToExport) {
				var tile = GetTileWithFormat(tileIndex);
				var pixels = new byte[tileSize * tileSize * 4];

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						byte colorIndex = tile[y, x];
						var color = colorIndex < palette.Length ? palette[colorIndex] : Colors.Magenta;

						// Scale up by zoom factor
						for (int zy = 0; zy < zoom; zy++) {
							for (int zx = 0; zx < zoom; zx++) {
								int px = (x * zoom) + zx;
								int py = (y * zoom) + zy;
								int pixelOffset = ((py * tileSize) + px) * 4;

								pixels[pixelOffset + 0] = color.B;
								pixels[pixelOffset + 1] = color.G;
								pixels[pixelOffset + 2] = color.R;
								pixels[pixelOffset + 3] = 255;
							}
						}
					}
				}

				var bitmap = new WriteableBitmap(
					new Avalonia.PixelSize(tileSize, tileSize),
					new Avalonia.Vector(96, 96),
					Avalonia.Platform.PixelFormat.Bgra8888,
					Avalonia.Platform.AlphaFormat.Unpremul);

				using (var fb = bitmap.Lock()) {
					System.Runtime.InteropServices.Marshal.Copy(pixels, 0, fb.Address, pixels.Length);
				}

				var tilePath = Path.Combine(folder, $"tile_{tileIndex:X4}.png");
				bitmap.Save(tilePath);
			}

			StatusText = $"Exported {tilesToExport.Count} tiles to {folder}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	#endregion

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
			// Export current bank to PNG (16x16 tiles = 128x128 pixels)
			int tilesPerRow = 16;
			int tilesPerColumn = 16;
			int imageWidth = tilesPerRow * 8;
			int imageHeight = tilesPerColumn * 8;

			// Create BGRA pixel data using current palette
			var pixels = new byte[imageWidth * imageHeight * 4];
			var palette = CurrentPalette;

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
						int pixelOffset = ((py * imageWidth) + px) * 4;

						byte colorIndex = tile[y, x];
						var color = colorIndex < palette.Length ? palette[colorIndex] : Colors.Magenta;

						pixels[pixelOffset + 0] = color.B;
						pixels[pixelOffset + 1] = color.G;
						pixels[pixelOffset + 2] = color.R;
						pixels[pixelOffset + 3] = 255; // Alpha
					}
				}
			}

			// Create WriteableBitmap and save as PNG
			var bitmap = new WriteableBitmap(
				new Avalonia.PixelSize(imageWidth, imageHeight),
				new Avalonia.Vector(96, 96),
				Avalonia.Platform.PixelFormat.Bgra8888,
				Avalonia.Platform.AlphaFormat.Unpremul);

			using (var fb = bitmap.Lock()) {
				System.Runtime.InteropServices.Marshal.Copy(pixels, 0, fb.Address, pixels.Length);
			}

			bitmap.Save(path);
			StatusText = $"Exported tileset to {Path.GetFileName(path)}";
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
			FileDialogService.BmpFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			// Load image using Avalonia's built-in bitmap loading
			using var stream = File.OpenRead(path);
			var bitmap = new Bitmap(stream);

			// Convert image to tiles
			int imageWidth = bitmap.PixelSize.Width;
			int imageHeight = bitmap.PixelSize.Height;
			int tilesWide = imageWidth / 8;
			int tilesHigh = imageHeight / 8;
			int totalTiles = tilesWide * tilesHigh;

			if (totalTiles == 0) {
				StatusText = "Image too small (must be at least 8x8 pixels)";
				return;
			}

			// Convert bitmap to a WriteableBitmap to read pixel data
			var writeableBitmap = new Avalonia.Media.Imaging.WriteableBitmap(
				bitmap.PixelSize,
				bitmap.Dpi,
				Avalonia.Platform.PixelFormat.Bgra8888,
				Avalonia.Platform.AlphaFormat.Unpremul);

			using (var fb = writeableBitmap.Lock()) {
				// Copy from source bitmap - render it to our writable bitmap
				using var drawContext = new Avalonia.Media.Imaging.RenderTargetBitmap(bitmap.PixelSize, bitmap.Dpi);
				using var ctx = drawContext.CreateDrawingContext();
				ctx.DrawImage(bitmap, new Avalonia.Rect(0, 0, imageWidth, imageHeight));
			}

			// Read pixel data from the writable bitmap
			int stride = imageWidth * 4; // BGRA = 4 bytes per pixel
			var pixels = new byte[imageHeight * stride];

			using (var lockedBitmap = writeableBitmap.Lock()) {
				System.Runtime.InteropServices.Marshal.Copy(lockedBitmap.Address, pixels, 0, pixels.Length);
			}

			// Import tiles
			int startTile = SelectedBank * ChrEditor.TilesPerBank;
			int importedCount = 0;

			for (int tileY = 0; tileY < tilesHigh && (startTile + importedCount) < TileCount; tileY++) {
				for (int tileX = 0; tileX < tilesWide && (startTile + importedCount) < TileCount; tileX++) {
					var tile = new byte[8, 8];

					for (int y = 0; y < 8; y++) {
						for (int x = 0; x < 8; x++) {
							int px = (tileX * 8) + x;
							int py = (tileY * 8) + y;
							int pixelOffset = (py * stride) + (px * 4);

							// BGRA format
							byte b = pixels[pixelOffset];
							byte g = pixels[pixelOffset + 1];
							byte r = pixels[pixelOffset + 2];

							// Convert to grayscale
							byte gray = (byte)((r + g + b) / 3);

							// Convert to 2-bit value (0-3)
							tile[y, x] = (byte)(gray / 85);
						}
					}

					int tileIndex = startTile + importedCount;
					var oldTile = CloneTile(_chrEditor.GetTile(tileIndex));
					var command = new SetTileCommand(_chrEditor, tileIndex, oldTile, tile, $"Import tile {tileIndex:X2}");
					_undoRedo.Execute(command);
					importedCount++;
				}
			}

			UpdateUndoRedoState();
			LoadTilePreview();
			StatusText = $"Imported {importedCount} tiles from {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Import error: {ex.Message}";
		}
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
		ExecuteTileChange(SelectedTileIndex, PreviewFlipH, $"Flip tile {SelectedTileIndex:X2} horizontal");
	}

	[RelayCommand]
	private void ApplyFlipVertical() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewFlipV is null) return;
		ExecuteTileChange(SelectedTileIndex, PreviewFlipV, $"Flip tile {SelectedTileIndex:X2} vertical");
	}

	[RelayCommand]
	private void ApplyRotate90() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewRotate90 is null) return;
		ExecuteTileChange(SelectedTileIndex, PreviewRotate90, $"Rotate tile {SelectedTileIndex:X2} 90°");
	}

	[RelayCommand]
	private void ApplyRotate180() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewRotate180 is null) return;
		ExecuteTileChange(SelectedTileIndex, PreviewRotate180, $"Rotate tile {SelectedTileIndex:X2} 180°");
	}

	[RelayCommand]
	private void ApplyRotate270() {
		if (_chrEditor is null || SelectedTileIndex < 0 || PreviewRotate270 is null) return;
		ExecuteTileChange(SelectedTileIndex, PreviewRotate270, $"Rotate tile {SelectedTileIndex:X2} 270°");
	}

	#region Copy/Paste

	[RelayCommand]
	private void CopyTile() {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;

		_clipboardTile = CloneTile(_chrEditor.GetTile(SelectedTileIndex));
		HasClipboard = true;
		StatusText = $"Copied tile {SelectedTileIndex:X2} to clipboard";
	}

	[RelayCommand]
	private void PasteTile() {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount || _clipboardTile is null) return;

		ExecuteTileChange(SelectedTileIndex, _clipboardTile, $"Paste tile to {SelectedTileIndex:X2}");
	}

	[RelayCommand]
	private void SwapTiles(int otherIndex) {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;
		if (otherIndex < 0 || otherIndex >= TileCount || otherIndex == SelectedTileIndex) return;

		var tile1 = CloneTile(_chrEditor.GetTile(SelectedTileIndex));
		var tile2 = CloneTile(_chrEditor.GetTile(otherIndex));

		var command = new SwapTilesCommand(_chrEditor, SelectedTileIndex, otherIndex, tile1, tile2,
			$"Swap tiles {SelectedTileIndex:X2} and {otherIndex:X2}");
		_undoRedo.Execute(command);
		UpdateUndoRedoState();
		LoadTilePreview();
		StatusText = $"Swapped tiles {SelectedTileIndex:X2} and {otherIndex:X2}";
	}

	[RelayCommand]
	private void ClearTile() {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;

		var emptyTile = new byte[8, 8];
		ExecuteTileChange(SelectedTileIndex, emptyTile, $"Clear tile {SelectedTileIndex:X2}");
	}

	[RelayCommand]
	private void FillTile(byte colorIndex) {
		if (_chrEditor is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;

		var filledTile = new byte[8, 8];
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				filledTile[y, x] = colorIndex;

		ExecuteTileChange(SelectedTileIndex, filledTile, $"Fill tile {SelectedTileIndex:X2} with color {colorIndex}");
	}

	#endregion

	#region Pixel Editing

	/// <summary>
	/// Sets a single pixel in the selected tile.
	/// </summary>
	[RelayCommand]
	private void SetPixel(object? parameter) {
		if (_chrEditor is null || SelectedTileData is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;

		// Parameter should be (x, y, colorIndex) tuple
		if (parameter is not (int x, int y, int colorIndex)) return;
		if (x < 0 || x >= 8 || y < 0 || y >= 8) return;

		var newTile = CloneTile(SelectedTileData);
		byte oldValue = newTile[y, x];
		newTile[y, x] = (byte)colorIndex;

		if (oldValue != colorIndex) {
			ExecuteTileChange(SelectedTileIndex, newTile, $"Set pixel ({x},{y}) to color {colorIndex}");
		}
	}

	/// <summary>
	/// Called when a pixel is changed via the EditableTileCanvas.
	/// </summary>
	public void OnPixelChanged(int x, int y, byte oldValue, byte newValue) {
		if (_chrEditor is null || SelectedTileData is null || SelectedTileIndex < 0 || SelectedTileIndex >= TileCount) return;
		if (x < 0 || x >= 8 || y < 0 || y >= 8) return;

		var newTile = CloneTile(SelectedTileData);
		newTile[y, x] = newValue;
		ExecuteTileChange(SelectedTileIndex, newTile, $"Set pixel ({x},{y}) to color {newValue}");
	}

	/// <summary>
	/// Toggles pixel editing mode.
	/// </summary>
	[RelayCommand]
	private void TogglePixelEditMode() {
		IsPixelEditMode = !IsPixelEditMode;
		StatusText = IsPixelEditMode ? "Pixel edit mode enabled" : "Pixel edit mode disabled";
	}

	/// <summary>
	/// Sets the current drawing tool.
	/// </summary>
	[RelayCommand]
	private void SetDrawingTool(DrawingTool tool) {
		CurrentDrawingTool = tool;
		StatusText = $"Drawing tool: {tool}";
	}

	/// <summary>
	/// Called when a color is picked via the eyedropper tool.
	/// </summary>
	public void OnColorPicked(int colorIndex) {
		SelectedColorIndex = colorIndex;
		// Switch back to pencil after picking
		CurrentDrawingTool = DrawingTool.Pencil;
		StatusText = $"Color {colorIndex} selected";
	}

	#endregion

	#region Animation

	/// <summary>
	/// Adds the current tile to the animation frames.
	/// </summary>
	[RelayCommand]
	private void AddAnimationFrame() {
		if (SelectedTileData is null) return;

		AnimationFrames.Add(CloneTile(SelectedTileData));
		StatusText = $"Added frame {AnimationFrames.Count}";
	}

	/// <summary>
	/// Adds a specific tile to the animation frames.
	/// </summary>
	[RelayCommand]
	private void AddTileToAnimation(int tileIndex) {
		if (_chrEditor is null || tileIndex < 0 || tileIndex >= TileCount) return;

		var tile = _chrEditor.GetTile(tileIndex);
		AnimationFrames.Add(CloneTile(tile));
		StatusText = $"Added tile {tileIndex:X2} as frame {AnimationFrames.Count}";
	}

	/// <summary>
	/// Removes the last frame from the animation.
	/// </summary>
	[RelayCommand]
	private void RemoveAnimationFrame() {
		if (AnimationFrames.Count == 0) return;

		AnimationFrames.RemoveAt(AnimationFrames.Count - 1);
		StatusText = $"Removed frame, {AnimationFrames.Count} frames remaining";
	}

	/// <summary>
	/// Clears all animation frames.
	/// </summary>
	[RelayCommand]
	private void ClearAnimationFrames() {
		AnimationFrames.Clear();
		AnimationFrameIndex = 0;
		IsAnimationPlaying = false;
		StatusText = "Animation frames cleared";
	}

	/// <summary>
	/// Toggles animation playback.
	/// </summary>
	[RelayCommand]
	private void ToggleAnimation() {
		IsAnimationPlaying = !IsAnimationPlaying;
		StatusText = IsAnimationPlaying ? "Animation playing" : "Animation paused";
	}

	/// <summary>
	/// Creates animation from a range of consecutive tiles.
	/// </summary>
	[RelayCommand]
	private void CreateAnimationFromRange(object? parameter) {
		if (_chrEditor is null) return;

		// Parameter should be (startIndex, count) tuple
		if (parameter is not (int startIndex, int count)) {
			// If no parameter, use selected tile and next 3 tiles
			startIndex = SelectedTileIndex;
			count = 4;
		}

		if (startIndex < 0 || startIndex >= TileCount) return;

		AnimationFrames.Clear();
		for (int i = 0; i < count && (startIndex + i) < TileCount; i++) {
			var tile = _chrEditor.GetTile(startIndex + i);
			AnimationFrames.Add(CloneTile(tile));
		}

		AnimationFrameIndex = 0;
		StatusText = $"Created animation with {AnimationFrames.Count} frames from tile {startIndex:X2}";
	}

	/// <summary>
	/// Moves an animation frame up in the list.
	/// </summary>
	[RelayCommand]
	private void MoveAnimationFrameUp(int index) {
		if (index <= 0 || index >= AnimationFrames.Count) return;

		var frame = AnimationFrames[index];
		AnimationFrames.RemoveAt(index);
		AnimationFrames.Insert(index - 1, frame);
		StatusText = $"Moved frame {index + 1} up";
	}

	/// <summary>
	/// Moves an animation frame down in the list.
	/// </summary>
	[RelayCommand]
	private void MoveAnimationFrameDown(int index) {
		if (index < 0 || index >= AnimationFrames.Count - 1) return;

		var frame = AnimationFrames[index];
		AnimationFrames.RemoveAt(index);
		AnimationFrames.Insert(index + 1, frame);
		StatusText = $"Moved frame {index + 1} down";
	}

	/// <summary>
	/// Removes a specific animation frame by index.
	/// </summary>
	[RelayCommand]
	private void RemoveAnimationFrameAt(int index) {
		if (index < 0 || index >= AnimationFrames.Count) return;

		AnimationFrames.RemoveAt(index);
		StatusText = $"Removed frame {index + 1}";
	}

	/// <summary>
	/// Duplicates an animation frame.
	/// </summary>
	[RelayCommand]
	private void DuplicateAnimationFrame(int index) {
		if (index < 0 || index >= AnimationFrames.Count) return;

		var frame = CloneTile(AnimationFrames[index]);
		AnimationFrames.Insert(index + 1, frame);
		StatusText = $"Duplicated frame {index + 1}";
	}

	/// <summary>
	/// Reverses the animation frame order.
	/// </summary>
	[RelayCommand]
	private void ReverseAnimationFrames() {
		if (AnimationFrames.Count < 2) return;

		var reversed = AnimationFrames.Reverse().ToList();
		AnimationFrames.Clear();
		foreach (var frame in reversed) {
			AnimationFrames.Add(frame);
		}
		StatusText = "Reversed animation frame order";
	}

	#endregion

	#region Undo/Redo

	[RelayCommand]
	private void Undo() {
		if (!_undoRedo.CanUndo) return;

		string description = _undoRedo.NextUndoDescription ?? "last change";
		_undoRedo.Undo();
		UpdateUndoRedoState();
		LoadTilePreview();
		StatusText = $"Undid: {description}";
	}

	[RelayCommand]
	private void Redo() {
		if (!_undoRedo.CanRedo) return;

		string description = _undoRedo.NextRedoDescription ?? "previous change";
		_undoRedo.Redo();
		UpdateUndoRedoState();
		LoadTilePreview();
		StatusText = $"Redid: {description}";
	}

	/// <summary>
	/// Toggles visibility of the undo history panel.
	/// </summary>
	[RelayCommand]
	private void ToggleUndoHistory() {
		ShowUndoHistory = !ShowUndoHistory;
		if (ShowUndoHistory) {
			RefreshUndoHistoryLists();
		}
	}

	/// <summary>
	/// Refreshes the undo/redo history display lists.
	/// </summary>
	private void RefreshUndoHistoryLists() {
		UndoHistoryList.Clear();
		RedoHistoryList.Clear();

		foreach (var desc in _undoRedo.UndoHistory) {
			UndoHistoryList.Add(desc);
		}
		foreach (var desc in _undoRedo.RedoHistory) {
			RedoHistoryList.Add(desc);
		}
	}

	private void ExecuteTileChange(int tileIndex, byte[,] newTile, string description) {
		if (_chrEditor is null) return;

		var oldTile = CloneTile(_chrEditor.GetTile(tileIndex));
		var command = new SetTileCommand(_chrEditor, tileIndex, oldTile, CloneTile(newTile), description);
		_undoRedo.Execute(command);
		UpdateUndoRedoState();
		LoadTilePreview();
		StatusText = description;
	}

	private void UpdateUndoRedoState() {
		UndoDescription = _undoRedo.NextUndoDescription ?? "";
		RedoDescription = _undoRedo.NextRedoDescription ?? "";
		OnPropertyChanged(nameof(CanUndo));
		OnPropertyChanged(nameof(CanRedo));

		if (ShowUndoHistory) {
			RefreshUndoHistoryLists();
		}
	}

	private static byte[,] CloneTile(byte[,] source) {
		var clone = new byte[8, 8];
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				clone[y, x] = source[y, x];
		return clone;
	}

	#endregion

	#region Comparison View

	/// <summary>
	/// Toggles the comparison view.
	/// </summary>
	[RelayCommand]
	private void ToggleComparisonView() {
		ShowComparisonView = !ShowComparisonView;
		if (ShowComparisonView && SelectedTileData is not null) {
			// Store original state when comparison view is enabled
			OriginalTileData = CloneTile(SelectedTileData);
		}
		StatusText = ShowComparisonView ? "Comparison view enabled" : "Comparison view disabled";
	}

	/// <summary>
	/// Resets the current tile to the original (comparison) state.
	/// </summary>
	[RelayCommand]
	private void ResetToOriginal() {
		if (_chrEditor is null || OriginalTileData is null || SelectedTileIndex < 0) return;

		ExecuteTileChange(SelectedTileIndex, OriginalTileData, $"Reset tile {SelectedTileIndex:X2} to original");
	}

	/// <summary>
	/// Updates the original tile reference to current state.
	/// </summary>
	[RelayCommand]
	private void SetOriginalAsCurrent() {
		if (SelectedTileData is null) return;

		OriginalTileData = CloneTile(SelectedTileData);
		StatusText = "Original reference updated to current state";
	}

	#endregion

	#region Grid Overlay

	/// <summary>
	/// Cycles through grid overlay modes.
	/// </summary>
	[RelayCommand]
	private void CycleGridOverlay() {
		GridOverlayMode = GridOverlayMode switch {
			GridOverlayMode.None => GridOverlayMode.Grid8x8,
			GridOverlayMode.Grid8x8 => GridOverlayMode.Grid16x16,
			GridOverlayMode.Grid16x16 => GridOverlayMode.Both,
			GridOverlayMode.Both => GridOverlayMode.None,
			_ => GridOverlayMode.None
		};
		StatusText = GridOverlayMode switch {
			GridOverlayMode.None => "Grid overlay: Off",
			GridOverlayMode.Grid8x8 => "Grid overlay: 8×8",
			GridOverlayMode.Grid16x16 => "Grid overlay: 16×16",
			GridOverlayMode.Both => "Grid overlay: 8×8 + 16×16",
			_ => "Grid overlay: Off"
		};
	}

	/// <summary>
	/// Sets a specific grid overlay mode.
	/// </summary>
	[RelayCommand]
	private void SetGridOverlay(GridOverlayMode mode) {
		GridOverlayMode = mode;
	}

	#endregion

	#region Multi-Tile Operations

	/// <summary>
	/// Toggles multi-select mode.
	/// </summary>
	[RelayCommand]
	private void ToggleMultiSelect() {
		AllowMultiSelect = !AllowMultiSelect;
		if (!AllowMultiSelect) {
			SelectedTileIndices.Clear();
		}
		StatusText = AllowMultiSelect ? "Multi-select enabled (Ctrl+Click)" : "Multi-select disabled";
	}

	/// <summary>
	/// Updates the selected tile indices from the grid control.
	/// </summary>
	public void OnMultiSelectChanged(IReadOnlyList<int> indices) {
		SelectedTileIndices.Clear();
		foreach (var idx in indices) {
			SelectedTileIndices.Add(idx);
		}
	}

	/// <summary>
	/// Selection start point for rectangular selection.
	/// </summary>
	private int? _rectangularSelectionStart;

	/// <summary>
	/// Number of tiles per row in the grid (for rectangular selection).
	/// </summary>
	[ObservableProperty]
	private int _tilesPerRow = 16;

	/// <summary>
	/// Start a rectangular selection at the given tile index.
	/// </summary>
	public void StartRectangularSelection(int tileIndex) {
		_rectangularSelectionStart = tileIndex;
		SelectedTileIndices.Clear();
		SelectedTileIndices.Add(tileIndex);
	}

	/// <summary>
	/// Extend rectangular selection to the given tile index.
	/// </summary>
	public void ExtendRectangularSelection(int endIndex) {
		if (_rectangularSelectionStart is null) return;

		int startIdx = _rectangularSelectionStart.Value;
		SelectedTileIndices.Clear();

		// Calculate rectangular selection
		int startRow = startIdx / TilesPerRow;
		int startCol = startIdx % TilesPerRow;
		int endRow = endIndex / TilesPerRow;
		int endCol = endIndex % TilesPerRow;

		int minRow = Math.Min(startRow, endRow);
		int maxRow = Math.Max(startRow, endRow);
		int minCol = Math.Min(startCol, endCol);
		int maxCol = Math.Max(startCol, endCol);

		for (int row = minRow; row <= maxRow; row++) {
			for (int col = minCol; col <= maxCol; col++) {
				int idx = row * TilesPerRow + col;
				if (idx < Tiles.Count) {
					SelectedTileIndices.Add(idx);
				}
			}
		}

		StatusText = $"Selected {SelectedTileIndices.Count} tiles ({maxRow - minRow + 1}x{maxCol - minCol + 1})";
	}

	/// <summary>
	/// End rectangular selection.
	/// </summary>
	public void EndRectangularSelection() {
		_rectangularSelectionStart = null;
	}

	/// <summary>
	/// Select all tiles in the current bank.
	/// </summary>
	[RelayCommand]
	private void SelectAllTiles() {
		if (!AllowMultiSelect) AllowMultiSelect = true;

		SelectedTileIndices.Clear();
		for (int i = 0; i < Tiles.Count; i++) {
			SelectedTileIndices.Add(i);
		}
		StatusText = $"Selected all {Tiles.Count} tiles";
	}

	/// <summary>
	/// Invert the current selection.
	/// </summary>
	[RelayCommand]
	private void InvertSelection() {
		if (!AllowMultiSelect) AllowMultiSelect = true;

		var currentSelection = SelectedTileIndices.ToHashSet();
		SelectedTileIndices.Clear();

		for (int i = 0; i < Tiles.Count; i++) {
			if (!currentSelection.Contains(i)) {
				SelectedTileIndices.Add(i);
			}
		}
		StatusText = $"Inverted selection: {SelectedTileIndices.Count} tiles selected";
	}

	/// <summary>
	/// Select a row of tiles.
	/// </summary>
	[RelayCommand]
	private void SelectRow(int row) {
		if (!AllowMultiSelect) AllowMultiSelect = true;

		SelectedTileIndices.Clear();
		int startIdx = row * TilesPerRow;
		for (int col = 0; col < TilesPerRow; col++) {
			int idx = startIdx + col;
			if (idx < Tiles.Count) {
				SelectedTileIndices.Add(idx);
			}
		}
		StatusText = $"Selected row {row}: {SelectedTileIndices.Count} tiles";
	}

	/// <summary>
	/// Select a column of tiles.
	/// </summary>
	[RelayCommand]
	private void SelectColumn(int col) {
		if (!AllowMultiSelect) AllowMultiSelect = true;

		SelectedTileIndices.Clear();
		int maxRows = (Tiles.Count + TilesPerRow - 1) / TilesPerRow;
		for (int row = 0; row < maxRows; row++) {
			int idx = row * TilesPerRow + col;
			if (idx < Tiles.Count) {
				SelectedTileIndices.Add(idx);
			}
		}
		StatusText = $"Selected column {col}: {SelectedTileIndices.Count} tiles";
	}

	/// <summary>
	/// Select tiles by color (tiles containing the specified color index).
	/// </summary>
	[RelayCommand]
	private void SelectByColor(int colorIndex) {
		if (_chrEditor is null) return;
		if (!AllowMultiSelect) AllowMultiSelect = true;

		SelectedTileIndices.Clear();
		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;

		for (int i = 0; i < Tiles.Count; i++) {
			int actualIndex = bankOffset + i;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				bool hasColor = false;
				for (int y = 0; y < 8 && !hasColor; y++) {
					for (int x = 0; x < 8; x++) {
						if (tile[y, x] == colorIndex) {
							hasColor = true;
							break;
						}
					}
				}
				if (hasColor) {
					SelectedTileIndices.Add(i);
				}
			}
		}
		StatusText = $"Selected {SelectedTileIndices.Count} tiles containing color {colorIndex}";
	}

	/// <summary>
	/// Select non-empty tiles.
	/// </summary>
	[RelayCommand]
	private void SelectNonEmptyTiles() {
		if (_chrEditor is null) return;
		if (!AllowMultiSelect) AllowMultiSelect = true;

		SelectedTileIndices.Clear();
		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;

		for (int i = 0; i < Tiles.Count; i++) {
			int actualIndex = bankOffset + i;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				bool isEmpty = true;
				for (int y = 0; y < 8 && isEmpty; y++) {
					for (int x = 0; x < 8; x++) {
						if (tile[y, x] != 0) {
							isEmpty = false;
							break;
						}
					}
				}
				if (!isEmpty) {
					SelectedTileIndices.Add(i);
				}
			}
		}
		StatusText = $"Selected {SelectedTileIndices.Count} non-empty tiles";
	}

	/// <summary>
	/// Select similar tiles (tiles similar to the current selection).
	/// </summary>
	[RelayCommand]
	private void SelectSimilarTiles() {
		if (_chrEditor is null || SelectedTileData is null) return;
		if (!AllowMultiSelect) AllowMultiSelect = true;

		var referenceTile = SelectedTileData;
		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;
		var threshold = SearchSimilarityThreshold / 100.0;

		SelectedTileIndices.Clear();

		for (int i = 0; i < Tiles.Count; i++) {
			int actualIndex = bankOffset + i;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				int matchCount = 0;
				int totalPixels = 64;

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						if (tile[y, x] == referenceTile[y, x]) {
							matchCount++;
						}
					}
				}

				if ((double)matchCount / totalPixels >= threshold) {
					SelectedTileIndices.Add(i);
				}
			}
		}
		StatusText = $"Selected {SelectedTileIndices.Count} tiles similar to current ({SearchSimilarityThreshold}% threshold)";
	}

	/// <summary>
	/// Copy selected tiles to clipboard.
	/// </summary>
	private List<(int Index, byte[,] Data)>? _tileClipboard;

	[RelayCommand]
	private void CopySelectedTiles() {
		if (_chrEditor is null || SelectedTileIndices.Count == 0) return;

		_tileClipboard = [];
		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;

		foreach (var idx in SelectedTileIndices.OrderBy(i => i)) {
			int actualIndex = bankOffset + idx;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				var copy = new byte[8, 8];
				Array.Copy(tile, copy, tile.Length);
				_tileClipboard.Add((idx, copy));
			}
		}
		StatusText = $"Copied {_tileClipboard.Count} tiles to clipboard";
	}

	/// <summary>
	/// Paste tiles from clipboard.
	/// </summary>
	[RelayCommand]
	private void PasteSelectedTiles() {
		if (_chrEditor is null || _tileClipboard is null || _tileClipboard.Count == 0) return;

		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;
		int baseIndex = SelectedTileIndices.Count > 0 ? SelectedTileIndices.Min() : 0;

		// Calculate offset from the first tile in clipboard
		int clipboardBase = _tileClipboard[0].Index;

		foreach (var (relIdx, data) in _tileClipboard) {
			int targetIdx = baseIndex + (relIdx - clipboardBase);
			int actualIndex = bankOffset + targetIdx;

			if (actualIndex >= 0 && actualIndex < TileCount) {
				ExecuteTileChange(actualIndex, data, $"Paste tile at {actualIndex:X2}");
			}
		}
		StatusText = $"Pasted {_tileClipboard.Count} tiles";
	}

	/// <summary>
	/// Delete (clear) selected tiles.
	/// </summary>
	[RelayCommand]
	private void DeleteSelectedTiles() {
		ClearSelectedTiles();
	}

	/// <summary>
	/// Swap two selected tiles.
	/// </summary>
	[RelayCommand]
	private void SwapSelectedTiles() {
		if (_chrEditor is null || SelectedTileIndices.Count != 2) {
			StatusText = "Select exactly 2 tiles to swap";
			return;
		}

		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;
		int idx1 = bankOffset + SelectedTileIndices[0];
		int idx2 = bankOffset + SelectedTileIndices[1];

		if (idx1 >= TileCount || idx2 >= TileCount) return;

		var tile1 = _chrEditor.GetTile(idx1);
		var tile2 = _chrEditor.GetTile(idx2);

		// Copy tiles
		var tile1Copy = new byte[8, 8];
		var tile2Copy = new byte[8, 8];
		Array.Copy(tile1, tile1Copy, tile1.Length);
		Array.Copy(tile2, tile2Copy, tile2.Length);

		ExecuteTileChange(idx1, tile2Copy, $"Swap tile {idx1:X2} with {idx2:X2}");
		ExecuteTileChange(idx2, tile1Copy, $"Swap tile {idx2:X2} with {idx1:X2}");

		StatusText = $"Swapped tiles {idx1:X2} and {idx2:X2}";
	}

	/// <summary>
	/// Shift colors in selected tiles (remap color indices).
	/// </summary>
	[RelayCommand]
	private void ShiftColorsInSelected(int shift) {
		if (_chrEditor is null || SelectedTileIndices.Count == 0) return;

		int maxColor = FormatColorCount - 1;
		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;

		foreach (var idx in SelectedTileIndices.ToList()) {
			int actualIndex = bankOffset + idx;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				var modified = new byte[8, 8];

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						int newColor = (tile[y, x] + shift + maxColor + 1) % (maxColor + 1);
						modified[y, x] = (byte)newColor;
					}
				}

				ExecuteTileChange(actualIndex, modified, $"Shift colors in tile {actualIndex:X2}");
			}
		}
		StatusText = $"Shifted colors by {shift} in {SelectedTileIndices.Count} tiles";
	}

	/// <summary>
	/// Apply brightness adjustment to selected tiles.
	/// </summary>
	[RelayCommand]
	private void AdjustBrightnessInSelected(int adjustment) {
		if (_chrEditor is null || SelectedTileIndices.Count == 0) return;

		int maxColor = FormatColorCount - 1;
		int bankOffset = SelectedBank * ChrEditor.TilesPerBank;

		foreach (var idx in SelectedTileIndices.ToList()) {
			int actualIndex = bankOffset + idx;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				var modified = new byte[8, 8];

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						int newColor = Math.Clamp(tile[y, x] + adjustment, 0, maxColor);
						modified[y, x] = (byte)newColor;
					}
				}

				ExecuteTileChange(actualIndex, modified, $"Adjust brightness in tile {actualIndex:X2}");
			}
		}
		StatusText = $"Adjusted brightness by {adjustment} in {SelectedTileIndices.Count} tiles";
	}

	/// <summary>
	/// Applies horizontal flip to all selected tiles.
	/// </summary>
	[RelayCommand]
	private void FlipSelectedTilesHorizontal() {
		if (_chrEditor is null || SelectedTileIndices.Count == 0) return;

		foreach (var idx in SelectedTileIndices.ToList()) {
			int actualIndex = (SelectedBank * ChrEditor.TilesPerBank) + idx;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				var flipped = FlipHorizontal(tile);
				ExecuteTileChange(actualIndex, flipped, $"Flip tile {actualIndex:X2} horizontal");
			}
		}
		StatusText = $"Flipped {SelectedTileIndices.Count} tiles horizontally";
	}

	/// <summary>
	/// Applies vertical flip to all selected tiles.
	/// </summary>
	[RelayCommand]
	private void FlipSelectedTilesVertical() {
		if (_chrEditor is null || SelectedTileIndices.Count == 0) return;

		foreach (var idx in SelectedTileIndices.ToList()) {
			int actualIndex = (SelectedBank * ChrEditor.TilesPerBank) + idx;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				var flipped = FlipVertical(tile);
				ExecuteTileChange(actualIndex, flipped, $"Flip tile {actualIndex:X2} vertical");
			}
		}
		StatusText = $"Flipped {SelectedTileIndices.Count} tiles vertically";
	}

	/// <summary>
	/// Applies 90° rotation to all selected tiles.
	/// </summary>
	[RelayCommand]
	private void RotateSelectedTiles() {
		if (_chrEditor is null || SelectedTileIndices.Count == 0) return;

		foreach (var idx in SelectedTileIndices.ToList()) {
			int actualIndex = (SelectedBank * ChrEditor.TilesPerBank) + idx;
			if (actualIndex < TileCount) {
				var tile = _chrEditor.GetTile(actualIndex);
				var rotated = Rotate90(tile);
				ExecuteTileChange(actualIndex, rotated, $"Rotate tile {actualIndex:X2} 90°");
			}
		}
		StatusText = $"Rotated {SelectedTileIndices.Count} tiles 90°";
	}

	/// <summary>
	/// Clears all selected tiles.
	/// </summary>
	[RelayCommand]
	private void ClearSelectedTiles() {
		if (_chrEditor is null || SelectedTileIndices.Count == 0) return;

		var emptyTile = new byte[8, 8];
		foreach (var idx in SelectedTileIndices.ToList()) {
			int actualIndex = (SelectedBank * ChrEditor.TilesPerBank) + idx;
			if (actualIndex < TileCount) {
				ExecuteTileChange(actualIndex, emptyTile, $"Clear tile {actualIndex:X2}");
			}
		}
		StatusText = $"Cleared {SelectedTileIndices.Count} tiles";
	}

	#endregion

	#region Pixel Selection

	/// <summary>
	/// Called when the pixel selection changes from the UI.
	/// </summary>
	public void SetPixelSelection(Rect? selection) {
		PixelSelection = selection;
	}

	/// <summary>
	/// Copies the selected pixel region.
	/// </summary>
	[RelayCommand]
	private void CopyPixelSelection() {
		if (PixelSelection is null || SelectedTileData is null) return;

		var sel = PixelSelection.Value;
		int x = (int)sel.X;
		int y = (int)sel.Y;
		int width = (int)sel.Width;
		int height = (int)sel.Height;

		_pixelClipboard = new byte[height, width];
		for (int py = 0; py < height; py++) {
			for (int px = 0; px < width; px++) {
				_pixelClipboard[py, px] = SelectedTileData[y + py, x + px];
			}
		}
		HasPixelClipboard = true;
		StatusText = $"Copied {width}x{height} pixel region";
	}

	/// <summary>
	/// Pastes the pixel clipboard into the selection.
	/// </summary>
	[RelayCommand]
	private void PastePixelSelection() {
		if (_chrEditor is null || SelectedTileData is null || _pixelClipboard is null || SelectedTileIndex < 0) return;

		var newTile = CloneTile(SelectedTileData);
		int startX = PixelSelection.HasValue ? (int)PixelSelection.Value.X : 0;
		int startY = PixelSelection.HasValue ? (int)PixelSelection.Value.Y : 0;
		int height = _pixelClipboard.GetLength(0);
		int width = _pixelClipboard.GetLength(1);

		for (int py = 0; py < height && (startY + py) < 8; py++) {
			for (int px = 0; px < width && (startX + px) < 8; px++) {
				newTile[startY + py, startX + px] = _pixelClipboard[py, px];
			}
		}

		ExecuteTileChange(SelectedTileIndex, newTile, $"Paste {width}x{height} pixels to tile {SelectedTileIndex:X2}");
	}

	/// <summary>
	/// Clears the pixel selection.
	/// </summary>
	[RelayCommand]
	private void ClearPixelSelection() {
		PixelSelection = null;
		StatusText = "Selection cleared";
	}

	/// <summary>
	/// Fills the selected pixel region with the current color.
	/// </summary>
	[RelayCommand]
	private void FillPixelSelection() {
		if (_chrEditor is null || SelectedTileData is null || PixelSelection is null || SelectedTileIndex < 0) return;

		var sel = PixelSelection.Value;
		var newTile = CloneTile(SelectedTileData);
		int x = (int)sel.X;
		int y = (int)sel.Y;
		int width = (int)sel.Width;
		int height = (int)sel.Height;

		for (int py = 0; py < height; py++) {
			for (int px = 0; px < width; px++) {
				newTile[y + py, x + px] = (byte)SelectedColorIndex;
			}
		}

		ExecuteTileChange(SelectedTileIndex, newTile, $"Fill selection with color {SelectedColorIndex}");
	}

	#endregion

	#region Tile Search

	/// <summary>
	/// Toggles tile search panel visibility.
	/// </summary>
	[RelayCommand]
	private void ToggleTileSearch() {
		ShowTileSearch = !ShowTileSearch;
		if (!ShowTileSearch) {
			TileSearchResults.Clear();
		}
		StatusText = ShowTileSearch ? "Tile search enabled" : "Tile search disabled";
	}

	/// <summary>
	/// Searches for tiles by dominant color.
	/// </summary>
	[RelayCommand]
	private void SearchByColor(int colorIndex) {
		if (_chrEditor is null) return;

		TileSearchResults.Clear();
		int searchColor = colorIndex >= 0 && colorIndex <= 3 ? colorIndex : SearchColorIndex;
		if (searchColor < 0 || searchColor > 3) {
			StatusText = "Select a color (0-3) to search";
			return;
		}

		int startTile = SelectedBank * ChrEditor.TilesPerBank;
		int endTile = Math.Min(startTile + ChrEditor.TilesPerBank, TileCount);

		for (int i = startTile; i < endTile; i++) {
			var tile = _chrEditor.GetTile(i);
			int colorCount = CountColor(tile, (byte)searchColor);
			// Consider a tile dominant in this color if > 25% of pixels
			if (colorCount > 16) {
				TileSearchResults.Add(i - startTile); // Local index within bank
			}
		}

		StatusText = $"Found {TileSearchResults.Count} tiles with dominant color {searchColor}";
	}

	/// <summary>
	/// Searches for tiles similar to the current tile.
	/// </summary>
	[RelayCommand]
	private void SearchSimilarTiles() {
		if (_chrEditor is null || SelectedTileData is null) return;

		TileSearchResults.Clear();
		int threshold = SearchSimilarityThreshold;

		int startTile = SelectedBank * ChrEditor.TilesPerBank;
		int endTile = Math.Min(startTile + ChrEditor.TilesPerBank, TileCount);

		for (int i = startTile; i < endTile; i++) {
			if (i == SelectedTileIndex) continue; // Skip self

			var tile = _chrEditor.GetTile(i);
			int similarity = CalculateSimilarity(SelectedTileData, tile);

			if (similarity >= threshold) {
				TileSearchResults.Add(i - startTile); // Local index within bank
			}
		}

		StatusText = $"Found {TileSearchResults.Count} tiles {threshold}%+ similar";
	}

	/// <summary>
	/// Searches for empty (all color 0) tiles.
	/// </summary>
	[RelayCommand]
	private void SearchEmptyTiles() {
		if (_chrEditor is null) return;

		TileSearchResults.Clear();

		int startTile = SelectedBank * ChrEditor.TilesPerBank;
		int endTile = Math.Min(startTile + ChrEditor.TilesPerBank, TileCount);

		for (int i = startTile; i < endTile; i++) {
			var tile = _chrEditor.GetTile(i);
			if (IsTileEmpty(tile)) {
				TileSearchResults.Add(i - startTile);
			}
		}

		StatusText = $"Found {TileSearchResults.Count} empty tiles";
	}

	/// <summary>
	/// Searches for duplicate tiles.
	/// </summary>
	[RelayCommand]
	private void SearchDuplicateTiles() {
		if (_chrEditor is null) return;

		TileSearchResults.Clear();
		var seen = new HashSet<string>();
		var duplicates = new HashSet<int>();

		int startTile = SelectedBank * ChrEditor.TilesPerBank;
		int endTile = Math.Min(startTile + ChrEditor.TilesPerBank, TileCount);

		for (int i = startTile; i < endTile; i++) {
			var tile = _chrEditor.GetTile(i);
			var hash = GetTileHash(tile);

			if (!seen.Add(hash)) {
				duplicates.Add(i - startTile);
			}
		}

		foreach (var idx in duplicates) {
			TileSearchResults.Add(idx);
		}

		StatusText = $"Found {TileSearchResults.Count} duplicate tiles";
	}

	/// <summary>
	/// Selects all search results in multi-select mode.
	/// </summary>
	[RelayCommand]
	private void SelectSearchResults() {
		if (TileSearchResults.Count == 0) return;

		AllowMultiSelect = true;
		SelectedTileIndices.Clear();
		foreach (var idx in TileSearchResults) {
			SelectedTileIndices.Add(idx);
		}
		StatusText = $"Selected {TileSearchResults.Count} tiles from search";
	}

	private static int CountColor(byte[,] tile, byte color) {
		int count = 0;
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				if (tile[y, x] == color) count++;
		return count;
	}

	private static int CalculateSimilarity(byte[,] tile1, byte[,] tile2) {
		int matching = 0;
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				if (tile1[y, x] == tile2[y, x]) matching++;
		return (matching * 100) / 64;
	}

	private static bool IsTileEmpty(byte[,] tile) {
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				if (tile[y, x] != 0) return false;
		return true;
	}

	private static string GetTileHash(byte[,] tile) {
		var sb = new StringBuilder(64);
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				sb.Append(tile[y, x]);
		return sb.ToString();
	}

	#endregion

	#region Export Selection

	/// <summary>
	/// Exports selected tiles to a CHR file.
	/// </summary>
	[RelayCommand]
	private async Task ExportSelectedTiles(Window? window) {
		if (window is null || _chrEditor is null) {
			StatusText = "Unable to export";
			return;
		}

		var tilesToExport = SelectedTileIndices.Count > 0
			? SelectedTileIndices.Select(i => (SelectedBank * ChrEditor.TilesPerBank) + i).ToList()
			: [SelectedTileIndex];

		if (tilesToExport.Count == 0 || tilesToExport[0] < 0) {
			StatusText = "No tiles selected to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Selected Tiles",
			".chr",
			$"tiles_selection.chr",
			new FilePickerFileType("CHR File") { Patterns = ["*.chr"] },
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			// Each tile is 16 bytes in NES 2bpp format
			var chrData = new byte[tilesToExport.Count * 16];
			int offset = 0;

			foreach (var tileIdx in tilesToExport.OrderBy(i => i)) {
				var tile = _chrEditor.GetTile(tileIdx);
				var tileBytes = EncodeTileTo2bpp(tile);
				Array.Copy(tileBytes, 0, chrData, offset, 16);
				offset += 16;
			}

			await File.WriteAllBytesAsync(path, chrData);
			StatusText = $"Exported {tilesToExport.Count} tiles to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	/// <summary>
	/// Exports selected tiles to a PNG image.
	/// </summary>
	[RelayCommand]
	private async Task ExportSelectedTilesToPng(Window? window) {
		if (window is null || _chrEditor is null) {
			StatusText = "Unable to export";
			return;
		}

		var tilesToExport = SelectedTileIndices.Count > 0
			? SelectedTileIndices.Select(i => (SelectedBank * ChrEditor.TilesPerBank) + i).ToList()
			: [SelectedTileIndex];

		if (tilesToExport.Count == 0 || tilesToExport[0] < 0) {
			StatusText = "No tiles selected to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Selected Tiles as PNG",
			".png",
			$"tiles_selection.png",
			FileDialogService.PngFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			// Arrange tiles in a row
			int count = tilesToExport.Count;
			int imageWidth = count * 8;
			int imageHeight = 8;

			var pixels = new byte[imageWidth * imageHeight * 4];
			var palette = CurrentPalette;

			int tileX = 0;
			foreach (var tileIdx in tilesToExport.OrderBy(i => i)) {
				var tile = _chrEditor.GetTile(tileIdx);

				for (int y = 0; y < 8; y++) {
					for (int x = 0; x < 8; x++) {
						int px = (tileX * 8) + x;
						int pixelOffset = ((y * imageWidth) + px) * 4;

						byte colorIndex = tile[y, x];
						var color = colorIndex < palette.Length ? palette[colorIndex] : Colors.Magenta;

						pixels[pixelOffset + 0] = color.B;
						pixels[pixelOffset + 1] = color.G;
						pixels[pixelOffset + 2] = color.R;
						pixels[pixelOffset + 3] = 255;
					}
				}
				tileX++;
			}

			var bitmap = new WriteableBitmap(
				new Avalonia.PixelSize(imageWidth, imageHeight),
				new Avalonia.Vector(96, 96),
				Avalonia.Platform.PixelFormat.Bgra8888,
				Avalonia.Platform.AlphaFormat.Unpremul);

			using (var fb = bitmap.Lock()) {
				System.Runtime.InteropServices.Marshal.Copy(pixels, 0, fb.Address, pixels.Length);
			}

			bitmap.Save(path);
			StatusText = $"Exported {tilesToExport.Count} tiles to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	/// <summary>
	/// Encodes a tile to NES 2bpp format.
	/// </summary>
	private static byte[] EncodeTileTo2bpp(byte[,] tile) {
		var bytes = new byte[16];
		for (int y = 0; y < 8; y++) {
			byte plane0 = 0;
			byte plane1 = 0;
			for (int x = 0; x < 8; x++) {
				byte pixel = tile[y, x];
				if ((pixel & 1) != 0) plane0 |= (byte)(0x80 >> x);
				if ((pixel & 2) != 0) plane1 |= (byte)(0x80 >> x);
			}
			bytes[y] = plane0;
			bytes[y + 8] = plane1;
		}
		return bytes;
	}

	#endregion

	#region Palette Editing

	/// <summary>
	/// Edits a palette color.
	/// </summary>
	[RelayCommand]
	private void EditPaletteColor(int colorIndex) {
		if (colorIndex < 0 || colorIndex >= CurrentPalette.Length) return;

		// Toggle simple color presets for the selected index
		// For a full implementation, you'd show a color picker dialog
		var color = CurrentPalette[colorIndex];
		var newPalette = (Color[])CurrentPalette.Clone();

		// Cycle through basic colors
		newPalette[colorIndex] = color switch {
			{ R: 0, G: 0, B: 0 } => Color.FromRgb(255, 0, 0),
			{ R: 255, G: 0, B: 0 } => Color.FromRgb(0, 255, 0),
			{ R: 0, G: 255, B: 0 } => Color.FromRgb(0, 0, 255),
			{ R: 0, G: 0, B: 255 } => Color.FromRgb(255, 255, 0),
			{ R: 255, G: 255, B: 0 } => Color.FromRgb(255, 0, 255),
			{ R: 255, G: 0, B: 255 } => Color.FromRgb(0, 255, 255),
			{ R: 0, G: 255, B: 255 } => Color.FromRgb(255, 255, 255),
			{ R: 255, G: 255, B: 255 } => Color.FromRgb(0, 0, 0),
			_ => Color.FromRgb(0, 0, 0)
		};

		CurrentPalette = newPalette;
		StatusText = $"Changed color {colorIndex} to RGB({newPalette[colorIndex].R},{newPalette[colorIndex].G},{newPalette[colorIndex].B})";
	}

	/// <summary>
	/// Sets a specific color in the palette via RGB values.
	/// </summary>
	public void SetPaletteColor(int colorIndex, byte r, byte g, byte b) {
		if (colorIndex < 0 || colorIndex >= CurrentPalette.Length) return;

		var newPalette = (Color[])CurrentPalette.Clone();
		newPalette[colorIndex] = Color.FromRgb(r, g, b);
		CurrentPalette = newPalette;
		StatusText = $"Set color {colorIndex} to RGB({r},{g},{b})";
	}

	#endregion

	#region Import with Palette Matching

	/// <summary>
	/// Imports tiles from PNG with intelligent palette matching.
	/// </summary>
	[RelayCommand]
	private async Task ImportWithPaletteMatch(Window? window) {
		if (window is null || _chrEditor is null) {
			StatusText = "Unable to import";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Import Tileset with Palette Matching",
			FileDialogService.PngFiles,
			FileDialogService.BmpFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			using var stream = File.OpenRead(path);
			var bitmap = new Bitmap(stream);

			int imageWidth = bitmap.PixelSize.Width;
			int imageHeight = bitmap.PixelSize.Height;
			int tilesWide = imageWidth / 8;
			int tilesHigh = imageHeight / 8;

			if (tilesWide == 0 || tilesHigh == 0) {
				StatusText = "Image too small (must be at least 8x8 pixels)";
				return;
			}

			// Create WriteableBitmap and draw source onto it
			var writeableBitmap = new WriteableBitmap(
				bitmap.PixelSize,
				bitmap.Dpi,
				Avalonia.Platform.PixelFormat.Bgra8888,
				Avalonia.Platform.AlphaFormat.Unpremul);

			// Use RenderTargetBitmap to draw the source image, then copy to writable
			using var renderTarget = new RenderTargetBitmap(bitmap.PixelSize, bitmap.Dpi);
			using (var ctx = renderTarget.CreateDrawingContext()) {
				ctx.DrawImage(bitmap, new Avalonia.Rect(0, 0, imageWidth, imageHeight));
			}

			// Read pixel data - for simplicity use the same approach as existing import
			// by creating a WriteableBitmap and drawing to it
			int stride = imageWidth * 4;
			var pixels = new byte[imageHeight * stride];

			// Use Marshal to get pointer for CopyPixels
			var handle = System.Runtime.InteropServices.GCHandle.Alloc(pixels, System.Runtime.InteropServices.GCHandleType.Pinned);
			try {
				renderTarget.CopyPixels(new Avalonia.PixelRect(0, 0, imageWidth, imageHeight), handle.AddrOfPinnedObject(), pixels.Length, stride);
			} finally {
				handle.Free();
			}

			// Build color frequency map and find best palette mapping
			var palette = CurrentPalette;

			int startTile = SelectedBank * ChrEditor.TilesPerBank;
			int importedCount = 0;

			for (int tileY = 0; tileY < tilesHigh && (startTile + importedCount) < TileCount; tileY++) {
				for (int tileX = 0; tileX < tilesWide && (startTile + importedCount) < TileCount; tileX++) {
					var tile = new byte[8, 8];

					for (int y = 0; y < 8; y++) {
						for (int x = 0; x < 8; x++) {
							int px = (tileX * 8) + x;
							int py = (tileY * 8) + y;
							int pixelOffset = (py * stride) + (px * 4);

							byte b = pixels[pixelOffset];
							byte g = pixels[pixelOffset + 1];
							byte r = pixels[pixelOffset + 2];

							// Find closest palette color
							tile[y, x] = FindClosestPaletteColor(r, g, b, palette);
						}
					}

					int tileIndex = startTile + importedCount;
					var oldTile = CloneTile(_chrEditor.GetTile(tileIndex));
					var command = new SetTileCommand(_chrEditor, tileIndex, oldTile, tile, $"Import tile {tileIndex:X2}");
					_undoRedo.Execute(command);
					importedCount++;
				}
			}

			UpdateUndoRedoState();
			LoadTilePreview();
			StatusText = $"Imported {importedCount} tiles with palette matching from {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Import error: {ex.Message}";
		}
	}

	/// <summary>
	/// Finds the closest palette color to the given RGB values.
	/// </summary>
	private static byte FindClosestPaletteColor(byte r, byte g, byte b, Color[] palette) {
		int bestIndex = 0;
		int bestDistance = int.MaxValue;

		for (int i = 0; i < palette.Length; i++) {
			var pc = palette[i];
			int dr = r - pc.R;
			int dg = g - pc.G;
			int db = b - pc.B;
			int distance = (dr * dr) + (dg * dg) + (db * db);

			if (distance < bestDistance) {
				bestDistance = distance;
				bestIndex = i;
			}
		}

		return (byte)bestIndex;
	}

	#endregion

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

	/// <summary>
	/// Handle keyboard shortcuts.
	/// </summary>
	public bool HandleKeyDown(KeyEventArgs e) {
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Undo)) {
			if (CanUndo) {
				Undo();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Redo) ||
				   KeyboardShortcuts.Matches(e, KeyboardShortcuts.RedoAlt)) {
			if (CanRedo) {
				Redo();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Copy)) {
			if (AllowMultiSelect && SelectedTileIndices.Count > 0) {
				CopySelectedTiles();
				return true;
			} else if (PixelSelection.HasValue) {
				CopyPixelSelection();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Paste)) {
			if (_tileClipboard is not null) {
				PasteSelectedTiles();
				return true;
			} else if (HasPixelClipboard) {
				PastePixelSelection();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Delete)) {
			if (AllowMultiSelect && SelectedTileIndices.Count > 0) {
				ClearSelectedTiles();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.SelectAll)) {
			SelectAllTiles();
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FlipHorizontal)) {
			if (SelectedTileIndex >= 0) {
				ApplyFlipHorizontal();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FlipVertical)) {
			if (SelectedTileIndex >= 0) {
				ApplyFlipVertical();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Rotate90)) {
			if (SelectedTileIndex >= 0) {
				ApplyRotate90();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ToggleMultiSelect)) {
			ToggleMultiSelect();
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.PreviousTile)) {
			if (SelectedTileIndex > 0) {
				SelectedTileIndex--;
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.NextTile)) {
			if (SelectedTileIndex < TileCount - 1) {
				SelectedTileIndex++;
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.PreviousBank)) {
			if (SelectedBank > 0) {
				SelectedBank--;
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.NextBank)) {
			if (SelectedBank < BankCount - 1) {
				SelectedBank++;
				return true;
			}
		}

		return false;
	}
}

/// <summary>
/// Represents a tile for display.
/// </summary>
public record TileInfo(int Index, string Name, string Preview);

/// <summary>
/// Represents a palette preset.
/// </summary>
public record PalettePreset(string Name, Color[] Colors);

/// <summary>
/// Command for setting tile data with undo support.
/// </summary>
internal class SetTileCommand : IUndoableCommand {
	private readonly ChrEditor _editor;
	private readonly int _tileIndex;
	private readonly byte[,] _oldTile;
	private readonly byte[,] _newTile;

	public string Description { get; }

	public SetTileCommand(ChrEditor editor, int tileIndex, byte[,] oldTile, byte[,] newTile, string description) {
		_editor = editor;
		_tileIndex = tileIndex;
		_oldTile = oldTile;
		_newTile = newTile;
		Description = description;
	}

	public void Execute() => _editor.SetTile(_tileIndex, _newTile);
	public void Undo() => _editor.SetTile(_tileIndex, _oldTile);
}

/// <summary>
/// Command for swapping two tiles with undo support.
/// </summary>
internal class SwapTilesCommand : IUndoableCommand {
	private readonly ChrEditor _editor;
	private readonly int _index1;
	private readonly int _index2;
	private readonly byte[,] _tile1;
	private readonly byte[,] _tile2;

	public string Description { get; }

	public SwapTilesCommand(ChrEditor editor, int index1, int index2, byte[,] tile1, byte[,] tile2, string description) {
		_editor = editor;
		_index1 = index1;
		_index2 = index2;
		_tile1 = tile1;
		_tile2 = tile2;
		Description = description;
	}

	public void Execute() {
		_editor.SetTile(_index1, _tile2);
		_editor.SetTile(_index2, _tile1);
	}

	public void Undo() {
		_editor.SetTile(_index1, _tile1);
		_editor.SetTile(_index2, _tile2);
	}
}
