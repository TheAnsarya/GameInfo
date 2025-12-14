using System.Collections.ObjectModel;
using System.Text;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media;
using Avalonia.Media.Imaging;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Commands;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Map editing drawing tools.
/// </summary>
public enum MapDrawingTool {
	/// <summary>Single tile pencil.</summary>
	Pencil,
	/// <summary>Flood fill tool.</summary>
	Fill,
	/// <summary>Rectangle fill tool.</summary>
	Rectangle,
	/// <summary>Line drawing tool.</summary>
	Line,
	/// <summary>Selection tool.</summary>
	Selection,
	/// <summary>Eyedropper tool.</summary>
	Eyedropper
}

/// <summary>
/// Tile format for individual layers.
/// </summary>
public enum LayerTileFormat {
	/// <summary>Simple tile index only.</summary>
	TileIndex,
	/// <summary>Tile index + attribute byte.</summary>
	TileAndAttribute,
	/// <summary>16x16 metatile indices.</summary>
	Metatile,
	/// <summary>Compressed RLE data.</summary>
	CompressedRle,
	/// <summary>Custom format.</summary>
	Custom
}

/// <summary>
/// Blend mode for layer rendering.
/// </summary>
public enum LayerBlendMode {
	/// <summary>Normal opacity blend.</summary>
	Normal,
	/// <summary>Multiply (darken).</summary>
	Multiply,
	/// <summary>Screen (lighten).</summary>
	Screen,
	/// <summary>Overlay (contrast).</summary>
	Overlay,
	/// <summary>Difference (invert).</summary>
	Difference
}

/// <summary>
/// Map layer for multi-layer maps.
/// </summary>
public record MapLayer(
	string Name,
	int Index,
	bool IsVisible,
	bool IsLocked,
	double Opacity,
	int DataOffset,
	byte[]? Data,
	LayerTileFormat TileFormat = LayerTileFormat.TileIndex,
	LayerBlendMode BlendMode = LayerBlendMode.Normal,
	int ZOrder = 0,
	int BytesPerTile = 1
);

/// <summary>
/// Tileset data for visual rendering.
/// </summary>
public class TilesetData {
	public byte[] RawData { get; set; } = [];
	public int TileWidth { get; set; } = 8;
	public int TileHeight { get; set; } = 8;
	public int TileCount { get; set; }
	public int BytesPerTile { get; set; } = 16; // 2bpp 8x8
	public string Format { get; set; } = "NES 2bpp";
	public int Offset { get; set; }

	/// <summary>
	/// Get decoded tile graphics.
	/// </summary>
	public byte[,]? GetTile(int index) {
		if (index < 0 || index >= TileCount || RawData.Length == 0) return null;

		int offset = index * BytesPerTile;
		if (offset + BytesPerTile > RawData.Length) return null;

		// Decode 2bpp NES format by default
		var tile = new byte[TileHeight, TileWidth];
		for (int y = 0; y < TileHeight; y++) {
			byte plane0 = RawData[offset + y];
			byte plane1 = RawData[offset + y + 8];

			for (int x = 0; x < TileWidth; x++) {
				int bit = 7 - x;
				int color = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1);
				tile[y, x] = (byte)color;
			}
		}

		return tile;
	}
}

/// <summary>
/// View model for viewing and editing game maps.
/// </summary>
public partial class MapEditorViewModel : ViewModelBase, IKeyboardShortcutHandler {
	private readonly RomFile? _rom;
	private readonly UndoRedoManager _undoRedo = new(maxHistorySize: 100);

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private string _mapName = "";

	[ObservableProperty]
	private int _mapIndex;

	[ObservableProperty]
	private int _mapWidth = 16;

	[ObservableProperty]
	private int _mapHeight = 16;

	[ObservableProperty]
	private int _tilesetOffset;

	[ObservableProperty]
	private int _mapDataOffset;

	[ObservableProperty]
	private int _zoom = 2;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private int _selectedTile;

	[ObservableProperty]
	private MapTile? _selectedMapTile;

	[ObservableProperty]
	private string _undoDescription = "";

	[ObservableProperty]
	private string _redoDescription = "";

	[ObservableProperty]
	private bool _showGrid = true;

	[ObservableProperty]
	private bool _showTileNumbers = true;

	[ObservableProperty]
	private int _selectedX = -1;

	[ObservableProperty]
	private int _selectedY = -1;

	/// <summary>
	/// Current drawing tool.
	/// </summary>
	[ObservableProperty]
	private MapDrawingTool _currentTool = MapDrawingTool.Pencil;

	/// <summary>
	/// Whether to draw while dragging.
	/// </summary>
	[ObservableProperty]
	private bool _continuousDraw = true;

	/// <summary>
	/// Selection rectangle start X.
	/// </summary>
	[ObservableProperty]
	private int _selectionStartX = -1;

	/// <summary>
	/// Selection rectangle start Y.
	/// </summary>
	[ObservableProperty]
	private int _selectionStartY = -1;

	/// <summary>
	/// Selection rectangle end X.
	/// </summary>
	[ObservableProperty]
	private int _selectionEndX = -1;

	/// <summary>
	/// Selection rectangle end Y.
	/// </summary>
	[ObservableProperty]
	private int _selectionEndY = -1;

	/// <summary>
	/// Clipboard for copy/paste operations.
	/// </summary>
	private byte[,]? _clipboard;

	/// <summary>
	/// Whether clipboard has content.
	/// </summary>
	[ObservableProperty]
	private bool _hasClipboard;

	/// <summary>
	/// Show 16x16 metatile grid overlay.
	/// </summary>
	[ObservableProperty]
	private bool _showMetatileGrid;

	/// <summary>
	/// Color palette for visual tile rendering.
	/// </summary>
	[ObservableProperty]
	private Color[] _colorPalette = GetDefaultMapPalette();

	// === Tileset Support ===

	/// <summary>
	/// The loaded tileset for visual rendering.
	/// </summary>
	[ObservableProperty]
	private TilesetData? _tileset;

	/// <summary>
	/// Whether a tileset is loaded.
	/// </summary>
	[ObservableProperty]
	private bool _hasTileset;

	/// <summary>
	/// Number of tiles in the tileset.
	/// </summary>
	[ObservableProperty]
	private int _tilesetTileCount = 256;

	/// <summary>
	/// Tileset format.
	/// </summary>
	[ObservableProperty]
	private string _tilesetFormat = "NES 2bpp";

	/// <summary>
	/// Show tileset panel.
	/// </summary>
	[ObservableProperty]
	private bool _showTilesetPanel = true;

	public string[] TilesetFormats { get; } = [
		"NES 2bpp",
		"SNES 2bpp",
		"SNES 4bpp",
		"GB 2bpp",
		"GBA 4bpp",
		"Linear"
	];

	// === Layer Support ===

	/// <summary>
	/// Map layers collection.
	/// </summary>
	public ObservableCollection<MapLayer> Layers { get; } = [];

	/// <summary>
	/// Currently active layer index.
	/// </summary>
	[ObservableProperty]
	private int _activeLayerIndex;

	/// <summary>
	/// Currently active layer.
	/// </summary>
	[ObservableProperty]
	private MapLayer? _activeLayer;

	/// <summary>
	/// Show layers panel.
	/// </summary>
	[ObservableProperty]
	private bool _showLayersPanel;

	/// <summary>
	/// Layer offset between layers (for multi-layer formats).
	/// </summary>
	[ObservableProperty]
	private int _layerOffset = 0x400;

	/// <summary>
	/// Number of layers.
	/// </summary>
	[ObservableProperty]
	private int _layerCount = 1;

	/// <summary>
	/// Whether drawing is in progress.
	/// </summary>
	private bool _isDrawing;

	/// <summary>
	/// Line/rectangle start point.
	/// </summary>
	private (int X, int Y) _drawStart;

	public bool CanUndo => _undoRedo.CanUndo;
	public bool CanRedo => _undoRedo.CanRedo;

	public ObservableCollection<MapTile> MapTiles { get; } = [];

	public ObservableCollection<TilePaletteItem> TilePalette { get; } = [];

	/// <summary>
	/// Gets the raw map data as a byte array for visual rendering.
	/// </summary>
	[ObservableProperty]
	private byte[]? _mapDataArray;

	public string[] MapFormats { get; } = [
		"Linear (tile index only)",
		"Compressed (RLE)",
		"2-Layer (tile + attribute)",
		"Metatile (16x16)"
	];

	[ObservableProperty]
	private string _selectedFormat = "Linear (tile index only)";

	public MapEditorViewModel(RomFile? rom = null) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded) {
			InitializeTilePalette();
			InitializeLayers();
		}
	}

	private void InitializeTilePalette() {
		// Initialize with default tile indices
		TilePalette.Clear();
		for (int i = 0; i < 256; i++) {
			TilePalette.Add(new TilePaletteItem(i, $"Tile {i:X2}"));
		}
	}

	private void InitializeLayers() {
		Layers.Clear();
		Layers.Add(new MapLayer("Background", 0, true, false, 1.0, MapDataOffset, null));
		ActiveLayerIndex = 0;
		ActiveLayer = Layers[0];
	}

	// === Tileset Commands ===

	/// <summary>
	/// Load tileset from ROM.
	/// </summary>
	[RelayCommand]
	private void LoadTileset() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		if (TilesetOffset < 0 || TilesetOffset >= _rom.Length) {
			StatusText = "Invalid tileset offset";
			return;
		}

		try {
			var bytesPerTile = TilesetFormat switch {
				"NES 2bpp" => 16,
				"SNES 2bpp" => 16,
				"GB 2bpp" => 16,
				"SNES 4bpp" => 32,
				"GBA 4bpp" => 32,
				"Linear" => 64,
				_ => 16
			};

			int maxTiles = (_rom.Length - TilesetOffset) / bytesPerTile;
			int tileCount = Math.Min(TilesetTileCount, maxTiles);
			int dataSize = tileCount * bytesPerTile;

			var data = new byte[dataSize];
			Array.Copy(_rom.Data, TilesetOffset, data, 0, dataSize);

			Tileset = new TilesetData {
				RawData = data,
				TileCount = tileCount,
				BytesPerTile = bytesPerTile,
				Format = TilesetFormat,
				Offset = TilesetOffset
			};

			HasTileset = true;
			StatusText = $"Loaded tileset: {tileCount} tiles ({TilesetFormat}) from 0x{TilesetOffset:X6}";

			// Update tile palette with actual graphics
			UpdateTilePaletteFromTileset();

		} catch (Exception ex) {
			StatusText = $"Error loading tileset: {ex.Message}";
			HasTileset = false;
		}
	}

	private void UpdateTilePaletteFromTileset() {
		if (Tileset is null) return;

		TilePalette.Clear();
		for (int i = 0; i < Tileset.TileCount && i < 256; i++) {
			TilePalette.Add(new TilePaletteItem(i, $"Tile {i:X2}"));
		}
	}

	/// <summary>
	/// Load tileset from external file.
	/// </summary>
	[RelayCommand]
	private async Task LoadTilesetFromFile(Window? window) {
		if (window is null) return;

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Load Tileset",
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var data = await File.ReadAllBytesAsync(path);
			var bytesPerTile = TilesetFormat switch {
				"NES 2bpp" => 16,
				"SNES 2bpp" => 16,
				"GB 2bpp" => 16,
				"SNES 4bpp" => 32,
				"GBA 4bpp" => 32,
				"Linear" => 64,
				_ => 16
			};

			int tileCount = data.Length / bytesPerTile;

			Tileset = new TilesetData {
				RawData = data,
				TileCount = tileCount,
				BytesPerTile = bytesPerTile,
				Format = TilesetFormat,
				Offset = 0
			};

			HasTileset = true;
			TilesetTileCount = tileCount;
			UpdateTilePaletteFromTileset();

			StatusText = $"Loaded tileset from {Path.GetFileName(path)}: {tileCount} tiles";

		} catch (Exception ex) {
			StatusText = $"Error loading tileset: {ex.Message}";
		}
	}

	/// <summary>
	/// Clear the loaded tileset.
	/// </summary>
	[RelayCommand]
	private void ClearTileset() {
		Tileset = null;
		HasTileset = false;
		InitializeTilePalette();
		StatusText = "Tileset cleared";
	}

	/// <summary>
	/// Get tile graphics from tileset.
	/// </summary>
	public byte[,]? GetTileGraphics(int tileIndex) {
		return Tileset?.GetTile(tileIndex);
	}

	// === Layer Commands ===

	/// <summary>
	/// Add a new layer.
	/// </summary>
	[RelayCommand]
	private void AddLayer() {
		int newIndex = Layers.Count;
		int offset = MapDataOffset + (newIndex * LayerOffset);
		var layer = new MapLayer($"Layer {newIndex}", newIndex, true, false, 1.0, offset, null);
		Layers.Add(layer);
		LayerCount = Layers.Count;
		StatusText = $"Added layer {newIndex}";
	}

	/// <summary>
	/// Remove a layer.
	/// </summary>
	[RelayCommand]
	private void RemoveLayer(int index) {
		if (index < 0 || index >= Layers.Count || Layers.Count <= 1) {
			StatusText = "Cannot remove layer";
			return;
		}

		Layers.RemoveAt(index);
		LayerCount = Layers.Count;

		// Adjust active layer if needed
		if (ActiveLayerIndex >= Layers.Count) {
			ActiveLayerIndex = Layers.Count - 1;
		}

		ActiveLayer = Layers[ActiveLayerIndex];
		StatusText = $"Removed layer {index}";
	}

	/// <summary>
	/// Set the active layer.
	/// </summary>
	[RelayCommand]
	private void SetActiveLayer(int index) {
		if (index < 0 || index >= Layers.Count) return;

		ActiveLayerIndex = index;
		ActiveLayer = Layers[index];
		StatusText = $"Active layer: {ActiveLayer.Name}";
	}

	/// <summary>
	/// Toggle layer visibility.
	/// </summary>
	[RelayCommand]
	private void ToggleLayerVisibility(int index) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers[index] = layer with { IsVisible = !layer.IsVisible };
		StatusText = $"Layer {index} visibility: {Layers[index].IsVisible}";
	}

	/// <summary>
	/// Toggle layer lock.
	/// </summary>
	[RelayCommand]
	private void ToggleLayerLock(int index) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers[index] = layer with { IsLocked = !layer.IsLocked };
		StatusText = $"Layer {index} locked: {Layers[index].IsLocked}";
	}

	/// <summary>
	/// Set layer opacity.
	/// </summary>
	public void SetLayerOpacity(int index, double opacity) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers[index] = layer with { Opacity = Math.Clamp(opacity, 0, 1) };
		StatusText = $"Layer {index} opacity: {Layers[index].Opacity:P0}";
	}

	/// <summary>
	/// Rename a layer.
	/// </summary>
	public void RenameLayer(int index, string newName) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers[index] = layer with { Name = newName };
	}

	/// <summary>
	/// Move layer up in the stack.
	/// </summary>
	[RelayCommand]
	private void MoveLayerUp(int index) {
		if (index <= 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers.RemoveAt(index);
		Layers.Insert(index - 1, layer);

		// Update indices
		for (int i = 0; i < Layers.Count; i++) {
			Layers[i] = Layers[i] with { Index = i };
		}

		StatusText = $"Moved layer '{layer.Name}' up";
	}

	/// <summary>
	/// Move layer down in the stack.
	/// </summary>
	[RelayCommand]
	private void MoveLayerDown(int index) {
		if (index < 0 || index >= Layers.Count - 1) return;

		var layer = Layers[index];
		Layers.RemoveAt(index);
		Layers.Insert(index + 1, layer);

		// Update indices
		for (int i = 0; i < Layers.Count; i++) {
			Layers[i] = Layers[i] with { Index = i };
		}

		StatusText = $"Moved layer '{layer.Name}' down";
	}

	/// <summary>
	/// Merge visible layers into one.
	/// </summary>
	[RelayCommand]
	private void MergeVisibleLayers() {
		if (_rom is null || !_rom.IsLoaded || Layers.Count <= 1) return;

		var visibleLayers = Layers.Where(l => l.IsVisible).ToList();
		if (visibleLayers.Count <= 1) {
			StatusText = "Need at least 2 visible layers to merge";
			return;
		}

		// TODO: Implement actual merge logic based on map format
		StatusText = $"Merge {visibleLayers.Count} layers (not yet implemented)";
	}

	/// <summary>
	/// Duplicate a layer.
	/// </summary>
	[RelayCommand]
	private void DuplicateLayer(int index) {
		if (index < 0 || index >= Layers.Count) return;

		var source = Layers[index];
		var newIndex = Layers.Count;
		var newData = source.Data is not null ? (byte[])source.Data.Clone() : null;

		var duplicate = new MapLayer(
			$"{source.Name} (Copy)",
			newIndex,
			source.IsVisible,
			false, // Not locked
			source.Opacity,
			source.DataOffset,
			newData,
			source.TileFormat,
			source.BlendMode,
			source.ZOrder + 1,
			source.BytesPerTile
		);

		Layers.Add(duplicate);
		LayerCount = Layers.Count;
		StatusText = $"Duplicated layer '{source.Name}'";
	}

	/// <summary>
	/// Set layer data offset.
	/// </summary>
	public void SetLayerDataOffset(int index, int offset) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers[index] = layer with { DataOffset = offset };
		StatusText = $"Layer {index} offset: 0x{offset:X6}";
	}

	/// <summary>
	/// Set layer tile format.
	/// </summary>
	public void SetLayerTileFormat(int index, LayerTileFormat format) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		int bytesPerTile = format switch {
			LayerTileFormat.TileIndex => 1,
			LayerTileFormat.TileAndAttribute => 2,
			LayerTileFormat.Metatile => 1,
			LayerTileFormat.CompressedRle => 1,
			LayerTileFormat.Custom => layer.BytesPerTile,
			_ => 1
		};

		Layers[index] = layer with { TileFormat = format, BytesPerTile = bytesPerTile };
		StatusText = $"Layer {index} format: {format}";
	}

	/// <summary>
	/// Set layer blend mode.
	/// </summary>
	public void SetLayerBlendMode(int index, LayerBlendMode mode) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers[index] = layer with { BlendMode = mode };
		StatusText = $"Layer {index} blend: {mode}";
	}

	/// <summary>
	/// Set layer Z-order.
	/// </summary>
	public void SetLayerZOrder(int index, int zOrder) {
		if (index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		Layers[index] = layer with { ZOrder = zOrder };
	}

	/// <summary>
	/// Show only the active layer.
	/// </summary>
	[ObservableProperty]
	private bool _soloActiveLayer;

	/// <summary>
	/// Show layer diff view (highlight differences between layers).
	/// </summary>
	[ObservableProperty]
	private bool _showLayerDiff;

	/// <summary>
	/// Layer comparison target index.
	/// </summary>
	[ObservableProperty]
	private int _diffTargetLayerIndex = -1;

	/// <summary>
	/// Get composite map data with all visible layers blended.
	/// </summary>
	public byte[] GetCompositeMapData() {
		int mapSize = MapWidth * MapHeight;
		var result = new byte[mapSize];

		// Sort layers by Z-order
		var sortedLayers = Layers
			.Where(l => l.IsVisible && l.Data is not null)
			.OrderBy(l => l.ZOrder)
			.ToList();

		foreach (var layer in sortedLayers) {
			if (layer.Data is null) continue;

			for (int i = 0; i < mapSize && i < layer.Data.Length; i++) {
				byte srcTile = layer.Data[i];
				byte destTile = result[i];

				// Apply blend mode
				result[i] = layer.BlendMode switch {
					LayerBlendMode.Normal => layer.Opacity >= 1.0 ? srcTile
						: (srcTile != 0 ? srcTile : destTile), // Simple transparency
					LayerBlendMode.Multiply => (byte)Math.Min(255, destTile * srcTile / 255),
					LayerBlendMode.Screen => (byte)(255 - ((255 - destTile) * (255 - srcTile) / 255)),
					LayerBlendMode.Overlay => destTile < 128
						? (byte)(2 * destTile * srcTile / 255)
						: (byte)(255 - (2 * (255 - destTile) * (255 - srcTile) / 255)),
					LayerBlendMode.Difference => (byte)Math.Abs(destTile - srcTile),
					_ => srcTile
				};
			}
		}

		return result;
	}

	/// <summary>
	/// Get layer diff data showing differences between two layers.
	/// </summary>
	public byte[] GetLayerDiffData(int layer1Index, int layer2Index) {
		if (layer1Index < 0 || layer1Index >= Layers.Count ||
			layer2Index < 0 || layer2Index >= Layers.Count) {
			return [];
		}

		var layer1 = Layers[layer1Index];
		var layer2 = Layers[layer2Index];

		if (layer1.Data is null || layer2.Data is null) return [];

		int mapSize = MapWidth * MapHeight;
		var result = new byte[mapSize];

		for (int i = 0; i < mapSize; i++) {
			byte tile1 = i < layer1.Data.Length ? layer1.Data[i] : (byte)0;
			byte tile2 = i < layer2.Data.Length ? layer2.Data[i] : (byte)0;

			// 0 = same, 255 = different
			result[i] = tile1 == tile2 ? (byte)0 : (byte)255;
		}

		return result;
	}

	/// <summary>
	/// Export a single layer to file.
	/// </summary>
	[RelayCommand]
	private async Task ExportLayerAsync((Window window, int layerIndex) args) {
		if (args.layerIndex < 0 || args.layerIndex >= Layers.Count) return;

		var layer = Layers[args.layerIndex];
		if (layer.Data is null) {
			StatusText = $"Layer '{layer.Name}' has no data to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(args.window);
		var path = await dialogService.SaveFileAsync(
			$"Export Layer - {layer.Name}",
			".bin",
			$"{layer.Name.Replace(" ", "_")}.bin",
			FileDialogService.BinaryFiles
		);

		if (path is null) return;

		try {
			await File.WriteAllBytesAsync(path, layer.Data);
			StatusText = $"Exported layer '{layer.Name}' to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Error exporting layer: {ex.Message}";
		}
	}

	/// <summary>
	/// Export layer as JSON with metadata.
	/// </summary>
	[RelayCommand]
	private async Task ExportLayerAsJsonAsync((Window window, int layerIndex) args) {
		if (args.layerIndex < 0 || args.layerIndex >= Layers.Count) return;

		var layer = Layers[args.layerIndex];

		var dialogService = FileDialogService.FromWindow(args.window);
		var path = await dialogService.SaveFileAsync(
			$"Export Layer JSON - {layer.Name}",
			".json",
			$"{layer.Name.Replace(" ", "_")}.json",
			FileDialogService.JsonFiles
		);

		if (path is null) return;

		try {
			var json = System.Text.Json.JsonSerializer.Serialize(new {
				layer.Name,
				layer.Index,
				Width = MapWidth,
				Height = MapHeight,
				TileFormat = layer.TileFormat.ToString(),
				BlendMode = layer.BlendMode.ToString(),
				layer.Opacity,
				layer.ZOrder,
				DataOffset = $"0x{layer.DataOffset:X6}",
				Data = layer.Data?.Select(b => (int)b).ToArray() ?? []
			}, new System.Text.Json.JsonSerializerOptions { WriteIndented = true });

			await File.WriteAllTextAsync(path, json);
			StatusText = $"Exported layer '{layer.Name}' as JSON";
		} catch (Exception ex) {
			StatusText = $"Error exporting layer: {ex.Message}";
		}
	}

	/// <summary>
	/// Import data to a layer from file.
	/// </summary>
	[RelayCommand]
	private async Task ImportToLayerAsync((Window window, int layerIndex) args) {
		if (args.layerIndex < 0 || args.layerIndex >= Layers.Count) return;

		var layer = Layers[args.layerIndex];
		if (layer.IsLocked) {
			StatusText = $"Layer '{layer.Name}' is locked";
			return;
		}

		var dialogService = FileDialogService.FromWindow(args.window);
		var path = await dialogService.OpenFileAsync(
			$"Import to Layer - {layer.Name}",
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var data = await File.ReadAllBytesAsync(path);
			int mapSize = MapWidth * MapHeight;

			// Truncate or pad data to fit map size
			if (data.Length != mapSize) {
				var resized = new byte[mapSize];
				Array.Copy(data, resized, Math.Min(data.Length, mapSize));
				data = resized;
			}

			Layers[args.layerIndex] = layer with { Data = data };
			StatusText = $"Imported {data.Length} bytes to layer '{layer.Name}'";
		} catch (Exception ex) {
			StatusText = $"Error importing to layer: {ex.Message}";
		}
	}

	/// <summary>
	/// Merge specific layers (not just visible ones).
	/// </summary>
	public byte[] MergeLayers(params int[] layerIndices) {
		int mapSize = MapWidth * MapHeight;
		var result = new byte[mapSize];

		var layersToMerge = layerIndices
			.Where(i => i >= 0 && i < Layers.Count && Layers[i].Data is not null)
			.Select(i => Layers[i])
			.OrderBy(l => l.ZOrder)
			.ToList();

		foreach (var layer in layersToMerge) {
			if (layer.Data is null) continue;

			for (int i = 0; i < mapSize && i < layer.Data.Length; i++) {
				if (layer.Data[i] != 0) { // Simple transparency - 0 = transparent
					result[i] = layer.Data[i];
				}
			}
		}

		return result;
	}

	/// <summary>
	/// Flatten all layers into a single layer.
	/// </summary>
	[RelayCommand]
	private void FlattenLayers() {
		if (Layers.Count <= 1) return;

		var compositeData = GetCompositeMapData();

		// Remove all layers except first
		while (Layers.Count > 1) {
			Layers.RemoveAt(Layers.Count - 1);
		}

		// Update first layer with composite data
		var baseLayer = Layers[0];
		Layers[0] = baseLayer with { Name = "Flattened", Data = compositeData };

		LayerCount = 1;
		ActiveLayerIndex = 0;
		ActiveLayer = Layers[0];

		StatusText = "Flattened all layers";
	}

	/// <summary>
	/// Create a layer from current selection.
	/// </summary>
	[RelayCommand]
	private void CreateLayerFromSelection() {
		if (!HasSelection || MapDataArray is null) {
			StatusText = "No selection to create layer from";
			return;
		}

		int startX = Math.Min(SelectionStartX, SelectionEndX);
		int endX = Math.Max(SelectionStartX, SelectionEndX);
		int startY = Math.Min(SelectionStartY, SelectionEndY);
		int endY = Math.Max(SelectionStartY, SelectionEndY);

		int mapSize = MapWidth * MapHeight;
		var layerData = new byte[mapSize]; // Transparent (0) by default

		for (int y = startY; y <= endY && y < MapHeight; y++) {
			for (int x = startX; x <= endX && x < MapWidth; x++) {
				int srcIndex = (y * MapWidth) + x;
				if (srcIndex < MapDataArray.Length) {
					layerData[srcIndex] = MapDataArray[srcIndex];
				}
			}
		}

		int newIndex = Layers.Count;
		var newLayer = new MapLayer(
			$"Selection Layer {newIndex}",
			newIndex,
			true,
			false,
			1.0,
			0, // No ROM offset - in-memory only
			layerData
		);

		Layers.Add(newLayer);
		LayerCount = Layers.Count;
		StatusText = $"Created layer from selection ({endX - startX + 1}x{endY - startY + 1})";
	}

	/// <summary>
	/// Load layer data from ROM.
	/// </summary>
	[RelayCommand]
	private void LoadLayerData(int index) {
		if (_rom is null || !_rom.IsLoaded || index < 0 || index >= Layers.Count) return;

		var layer = Layers[index];
		int mapSize = MapWidth * MapHeight;

		if (layer.DataOffset < 0 || layer.DataOffset + mapSize > _rom.Length) {
			StatusText = $"Invalid layer data offset for layer {index}";
			return;
		}

		var data = new byte[mapSize];
		Array.Copy(_rom.Data, layer.DataOffset, data, 0, mapSize);

		Layers[index] = layer with { Data = data };
		StatusText = $"Loaded data for layer '{layer.Name}'";
	}

	/// <summary>
	/// Load all layers' data.
	/// </summary>
	[RelayCommand]
	private void LoadAllLayersData() {
		for (int i = 0; i < Layers.Count; i++) {
			LoadLayerData(i);
		}

		StatusText = $"Loaded data for {Layers.Count} layers";
	}

	[RelayCommand]
	private void LoadMap() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		if (MapDataOffset < 0 || MapDataOffset >= _rom.Length) {
			StatusText = "Invalid map data offset";
			return;
		}

		try {
			MapTiles.Clear();
			var data = _rom.AsSpan();

			int mapSize = MapWidth * MapHeight;
			int endOffset = Math.Min(MapDataOffset + mapSize, _rom.Length);
			int actualSize = endOffset - MapDataOffset;

			// Create a copy of the map data for visual rendering
			MapDataArray = data.Slice(MapDataOffset, actualSize).ToArray();

			for (int y = 0; y < MapHeight; y++) {
				for (int x = 0; x < MapWidth; x++) {
					int offset = MapDataOffset + (y * MapWidth) + x;
					if (offset < endOffset) {
						byte tileIndex = data[offset];
						MapTiles.Add(new MapTile(x, y, tileIndex, offset));
					}
				}
			}

			MapName = $"Map at 0x{MapDataOffset:X6}";
			StatusText = $"Loaded {MapTiles.Count} tiles ({MapWidth}x{MapHeight})";
		} catch (Exception ex) {
			StatusText = $"Error loading map: {ex.Message}";
		}
	}

	[RelayCommand]
	private void SelectTile(MapTile? tile) {
		if (tile is null) return;
		SelectedMapTile = tile;
		SelectedX = tile.X;
		SelectedY = tile.Y;
		StatusText = $"Selected tile at ({tile.X}, {tile.Y}) = 0x{tile.TileIndex:X2} @ 0x{tile.Offset:X6}";
	}

	/// <summary>
	/// Handle tile selection from MapCanvas click event.
	/// </summary>
	public void SelectMapPosition(int x, int y) {
		SelectedX = x;
		SelectedY = y;
		int index = (y * MapWidth) + x;
		if (index >= 0 && index < MapTiles.Count) {
			SelectedMapTile = MapTiles[index];
			StatusText = $"Selected tile at ({x}, {y}) = 0x{MapTiles[index].TileIndex:X2}";
		}
	}

	[RelayCommand]
	private void SetTile() {
		if (_rom is null || !_rom.IsLoaded || SelectedMapTile is null) {
			StatusText = "No tile selected";
			return;
		}

		var tile = SelectedMapTile;
		var command = new SetByteCommand(_rom.Data, tile.Offset, (byte)SelectedTile,
			$"Set tile ({tile.X}, {tile.Y}) to 0x{SelectedTile:X2}");
		_undoRedo.Execute(command);

		// Update the map tile
		var index = MapTiles.IndexOf(tile);
		if (index >= 0) {
			MapTiles[index] = new MapTile(tile.X, tile.Y, (byte)SelectedTile, tile.Offset);
			SelectedMapTile = MapTiles[index];
		}

		UpdateUndoRedoState();
		StatusText = $"Set tile at ({tile.X}, {tile.Y}) to 0x{SelectedTile:X2}";
	}

	[RelayCommand]
	private void Fill() {
		if (_rom is null || !_rom.IsLoaded || MapTiles.Count == 0) {
			StatusText = "No map loaded";
			return;
		}

		// Create a composite command for fill operation
		var commands = new List<IUndoableCommand>();
		for (int i = 0; i < MapTiles.Count; i++) {
			var tile = MapTiles[i];
			commands.Add(new SetByteCommand(_rom.Data, tile.Offset, (byte)SelectedTile));
		}

		var composite = new CompositeCommand($"Fill map with tile 0x{SelectedTile:X2}", commands);
		_undoRedo.Execute(composite);

		// Update all tiles in the collection
		for (int i = 0; i < MapTiles.Count; i++) {
			var tile = MapTiles[i];
			MapTiles[i] = new MapTile(tile.X, tile.Y, (byte)SelectedTile, tile.Offset);
		}

		UpdateUndoRedoState();
		StatusText = $"Filled map with tile 0x{SelectedTile:X2}";
	}

	[RelayCommand]
	private void Undo() {
		if (!_undoRedo.CanUndo) return;

		string description = _undoRedo.NextUndoDescription ?? "last change";
		_undoRedo.Undo();
		ReloadMapTiles();
		UpdateUndoRedoState();
		StatusText = "Undone: " + description;
	}

	[RelayCommand]
	private void Redo() {
		if (!_undoRedo.CanRedo) return;

		string description = _undoRedo.NextRedoDescription ?? "previous change";
		_undoRedo.Redo();
		ReloadMapTiles();
		UpdateUndoRedoState();
		StatusText = "Redone: " + description;
	}

	private void ReloadMapTiles() {
		if (_rom is null || !_rom.IsLoaded) return;

		// Reload tile values from ROM data
		var data = _rom.AsSpan();
		for (int i = 0; i < MapTiles.Count; i++) {
			var tile = MapTiles[i];
			if (tile.Offset < data.Length) {
				byte tileIndex = data[tile.Offset];
				MapTiles[i] = new MapTile(tile.X, tile.Y, tileIndex, tile.Offset);
			}
		}

		// Update the MapDataArray for visual rendering
		if (MapDataArray is not null) {
			int mapSize = MapWidth * MapHeight;
			int endOffset = Math.Min(MapDataOffset + mapSize, _rom.Length);
			int actualSize = endOffset - MapDataOffset;
			MapDataArray = data.Slice(MapDataOffset, actualSize).ToArray();
		}
	}

	private void UpdateUndoRedoState() {
		UndoDescription = _undoRedo.NextUndoDescription ?? "";
		RedoDescription = _undoRedo.NextRedoDescription ?? "";
		OnPropertyChanged(nameof(CanUndo));
		OnPropertyChanged(nameof(CanRedo));
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
	private void NextMap() {
		MapIndex++;
		// This would need to know the map table format to work properly
		StatusText = $"Map index: {MapIndex}";
	}

	[RelayCommand]
	private void PreviousMap() {
		if (MapIndex > 0) {
			MapIndex--;
			StatusText = $"Map index: {MapIndex}";
		}
	}

	#region Drawing Tools

	/// <summary>
	/// Sets the current drawing tool.
	/// </summary>
	[RelayCommand]
	private void SetTool(MapDrawingTool tool) {
		CurrentTool = tool;
		StatusText = $"Tool: {tool}";
	}

	/// <summary>
	/// Starts a drawing operation at the specified position.
	/// </summary>
	public void StartDraw(int x, int y) {
		if (_rom is null || !_rom.IsLoaded || MapTiles.Count == 0) return;
		if (x < 0 || x >= MapWidth || y < 0 || y >= MapHeight) return;

		_isDrawing = true;
		_drawStart = (x, y);

		switch (CurrentTool) {
			case MapDrawingTool.Pencil:
				DrawTileAt(x, y);
				break;

			case MapDrawingTool.Fill:
				FloodFillAt(x, y);
				break;

			case MapDrawingTool.Eyedropper:
				PickTileAt(x, y);
				break;

			case MapDrawingTool.Selection:
				SelectionStartX = x;
				SelectionStartY = y;
				SelectionEndX = x;
				SelectionEndY = y;
				break;

			case MapDrawingTool.Rectangle:
			case MapDrawingTool.Line:
				// Just record start point, actual drawing happens on end
				break;
		}
	}

	/// <summary>
	/// Continues a drawing operation (for drag).
	/// </summary>
	public void ContinueDraw(int x, int y) {
		if (!_isDrawing || _rom is null) return;
		if (x < 0 || x >= MapWidth || y < 0 || y >= MapHeight) return;

		switch (CurrentTool) {
			case MapDrawingTool.Pencil when ContinuousDraw:
				DrawTileAt(x, y);
				break;

			case MapDrawingTool.Selection:
				SelectionEndX = x;
				SelectionEndY = y;
				break;
		}
	}

	/// <summary>
	/// Ends a drawing operation.
	/// </summary>
	public void EndDraw(int x, int y) {
		if (!_isDrawing) return;

		switch (CurrentTool) {
			case MapDrawingTool.Rectangle:
				DrawRectangle(_drawStart.X, _drawStart.Y, x, y);
				break;

			case MapDrawingTool.Line:
				DrawLine(_drawStart.X, _drawStart.Y, x, y);
				break;

			case MapDrawingTool.Selection:
				SelectionEndX = x;
				SelectionEndY = y;
				NormalizeSelection();
				var (sx, sy, ex, ey) = GetSelectionBounds();
				if (sx >= 0 && sy >= 0) {
					StatusText = $"Selected {ex - sx + 1}x{ey - sy + 1} tiles";
				}

				break;
		}

		_isDrawing = false;
	}

	private void DrawTileAt(int x, int y) {
		if (_rom is null) return;

		int index = (y * MapWidth) + x;
		if (index < 0 || index >= MapTiles.Count) return;

		var tile = MapTiles[index];
		if (tile.TileIndex == SelectedTile) return; // No change needed

		var command = new SetByteCommand(_rom.Data, tile.Offset, (byte)SelectedTile,
			$"Draw tile at ({x}, {y})");
		_undoRedo.Execute(command);

		MapTiles[index] = new MapTile(x, y, (byte)SelectedTile, tile.Offset);
		UpdateMapDataArray();
		UpdateUndoRedoState();
	}

	private void FloodFillAt(int x, int y) {
		if (_rom is null) return;

		int index = (y * MapWidth) + x;
		if (index < 0 || index >= MapTiles.Count) return;

		byte targetTile = MapTiles[index].TileIndex;
		if (targetTile == SelectedTile) return; // No change needed

		// BFS flood fill
		var visited = new bool[MapWidth, MapHeight];
		var queue = new Queue<(int X, int Y)>();
		var commands = new List<IUndoableCommand>();

		queue.Enqueue((x, y));
		visited[x, y] = true;

		while (queue.Count > 0) {
			var (cx, cy) = queue.Dequeue();
			int ci = (cy * MapWidth) + cx;

			if (MapTiles[ci].TileIndex == targetTile) {
				commands.Add(new SetByteCommand(_rom.Data, MapTiles[ci].Offset, (byte)SelectedTile));

				// Check neighbors
				foreach (var (nx, ny) in new[] { (cx - 1, cy), (cx + 1, cy), (cx, cy - 1), (cx, cy + 1) }) {
					if (nx >= 0 && nx < MapWidth && ny >= 0 && ny < MapHeight && !visited[nx, ny]) {
						visited[nx, ny] = true;
						int ni = (ny * MapWidth) + nx;
						if (MapTiles[ni].TileIndex == targetTile) {
							queue.Enqueue((nx, ny));
						}
					}
				}
			}
		}

		if (commands.Count > 0) {
			var composite = new CompositeCommand($"Flood fill {commands.Count} tiles with 0x{SelectedTile:X2}", commands);
			_undoRedo.Execute(composite);
			ReloadMapTiles();
			UpdateUndoRedoState();
			StatusText = $"Filled {commands.Count} tiles";
		}
	}

	private void PickTileAt(int x, int y) {
		int index = (y * MapWidth) + x;
		if (index < 0 || index >= MapTiles.Count) return;

		SelectedTile = MapTiles[index].TileIndex;
		CurrentTool = MapDrawingTool.Pencil; // Switch back to pencil after pick
		StatusText = $"Picked tile 0x{SelectedTile:X2}";
	}

	private void DrawRectangle(int x1, int y1, int x2, int y2) {
		if (_rom is null) return;

		int minX = Math.Min(x1, x2);
		int maxX = Math.Max(x1, x2);
		int minY = Math.Min(y1, y2);
		int maxY = Math.Max(y1, y2);

		var commands = new List<IUndoableCommand>();

		for (int y = minY; y <= maxY && y < MapHeight; y++) {
			for (int x = minX; x <= maxX && x < MapWidth; x++) {
				int index = (y * MapWidth) + x;
				if (index < MapTiles.Count && MapTiles[index].TileIndex != SelectedTile) {
					commands.Add(new SetByteCommand(_rom.Data, MapTiles[index].Offset, (byte)SelectedTile));
				}
			}
		}

		if (commands.Count > 0) {
			var composite = new CompositeCommand($"Rectangle fill {commands.Count} tiles", commands);
			_undoRedo.Execute(composite);
			ReloadMapTiles();
			UpdateUndoRedoState();
			StatusText = $"Drew rectangle ({maxX - minX + 1}x{maxY - minY + 1})";
		}
	}

	private void DrawLine(int x1, int y1, int x2, int y2) {
		if (_rom is null) return;

		var commands = new List<IUndoableCommand>();

		// Bresenham's line algorithm
		int dx = Math.Abs(x2 - x1);
		int dy = Math.Abs(y2 - y1);
		int sx = x1 < x2 ? 1 : -1;
		int sy = y1 < y2 ? 1 : -1;
		int err = dx - dy;

		int x = x1, y = y1;
		while (true) {
			if (x >= 0 && x < MapWidth && y >= 0 && y < MapHeight) {
				int index = (y * MapWidth) + x;
				if (index < MapTiles.Count && MapTiles[index].TileIndex != SelectedTile) {
					commands.Add(new SetByteCommand(_rom.Data, MapTiles[index].Offset, (byte)SelectedTile));
				}
			}

			if (x == x2 && y == y2) break;

			int e2 = 2 * err;
			if (e2 > -dy) { err -= dy; x += sx; }

			if (e2 < dx) { err += dx; y += sy; }
		}

		if (commands.Count > 0) {
			var composite = new CompositeCommand($"Line draw {commands.Count} tiles", commands);
			_undoRedo.Execute(composite);
			ReloadMapTiles();
			UpdateUndoRedoState();
			StatusText = $"Drew line ({commands.Count} tiles)";
		}
	}

	private void UpdateMapDataArray() {
		if (_rom is null || MapDataArray is null) return;

		var data = _rom.AsSpan();
		int mapSize = MapWidth * MapHeight;
		int endOffset = Math.Min(MapDataOffset + mapSize, _rom.Length);
		int actualSize = endOffset - MapDataOffset;
		MapDataArray = data.Slice(MapDataOffset, actualSize).ToArray();
	}

	#endregion

	#region Selection and Copy/Paste

	private void NormalizeSelection() {
		if (SelectionStartX > SelectionEndX) {
			(SelectionStartX, SelectionEndX) = (SelectionEndX, SelectionStartX);
		}

		if (SelectionStartY > SelectionEndY) {
			(SelectionStartY, SelectionEndY) = (SelectionEndY, SelectionStartY);
		}
	}

	private (int StartX, int StartY, int EndX, int EndY) GetSelectionBounds() {
		return (
			Math.Max(0, SelectionStartX),
			Math.Max(0, SelectionStartY),
			Math.Min(MapWidth - 1, SelectionEndX),
			Math.Min(MapHeight - 1, SelectionEndY)
		);
	}

	/// <summary>
	/// Returns whether there is a valid selection.
	/// </summary>
	public bool HasSelection => SelectionStartX >= 0 && SelectionStartY >= 0 &&
		SelectionEndX >= SelectionStartX && SelectionEndY >= SelectionStartY;

	/// <summary>
	/// Copies the selected region.
	/// </summary>
	[RelayCommand]
	private void CopySelection() {
		if (!HasSelection || MapTiles.Count == 0) {
			StatusText = "No selection to copy";
			return;
		}

		var (sx, sy, ex, ey) = GetSelectionBounds();
		int width = ex - sx + 1;
		int height = ey - sy + 1;

		_clipboard = new byte[height, width];
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				int index = ((sy + y) * MapWidth) + sx + x;
				if (index < MapTiles.Count) {
					_clipboard[y, x] = MapTiles[index].TileIndex;
				}
			}
		}

		HasClipboard = true;
		StatusText = $"Copied {width}x{height} region";
	}

	/// <summary>
	/// Pastes clipboard at current selection or cursor position.
	/// </summary>
	[RelayCommand]
	private void PasteSelection() {
		if (_rom is null || _clipboard is null || MapTiles.Count == 0) {
			StatusText = "Nothing to paste";
			return;
		}

		int startX = SelectionStartX >= 0 ? SelectionStartX : (SelectedX >= 0 ? SelectedX : 0);
		int startY = SelectionStartY >= 0 ? SelectionStartY : (SelectedY >= 0 ? SelectedY : 0);

		int height = _clipboard.GetLength(0);
		int width = _clipboard.GetLength(1);

		var commands = new List<IUndoableCommand>();

		for (int y = 0; y < height && (startY + y) < MapHeight; y++) {
			for (int x = 0; x < width && (startX + x) < MapWidth; x++) {
				int index = ((startY + y) * MapWidth) + startX + x;
				if (index < MapTiles.Count) {
					byte newTile = _clipboard[y, x];
					if (MapTiles[index].TileIndex != newTile) {
						commands.Add(new SetByteCommand(_rom.Data, MapTiles[index].Offset, newTile));
					}
				}
			}
		}

		if (commands.Count > 0) {
			var composite = new CompositeCommand($"Paste {width}x{height} region", commands);
			_undoRedo.Execute(composite);
			ReloadMapTiles();
			UpdateUndoRedoState();
			StatusText = $"Pasted {width}x{height} region";
		}
	}

	/// <summary>
	/// Clears the selection.
	/// </summary>
	[RelayCommand]
	private void ClearSelection() {
		SelectionStartX = SelectionStartY = SelectionEndX = SelectionEndY = -1;
		StatusText = "Selection cleared";
	}

	/// <summary>
	/// Fills the selection with the selected tile.
	/// </summary>
	[RelayCommand]
	private void FillSelection() {
		if (_rom is null || !HasSelection) {
			StatusText = "No selection to fill";
			return;
		}

		var (sx, sy, ex, ey) = GetSelectionBounds();
		var commands = new List<IUndoableCommand>();

		for (int y = sy; y <= ey; y++) {
			for (int x = sx; x <= ex; x++) {
				int index = (y * MapWidth) + x;
				if (index < MapTiles.Count && MapTiles[index].TileIndex != SelectedTile) {
					commands.Add(new SetByteCommand(_rom.Data, MapTiles[index].Offset, (byte)SelectedTile));
				}
			}
		}

		if (commands.Count > 0) {
			int width = ex - sx + 1;
			int height = ey - sy + 1;
			var composite = new CompositeCommand($"Fill selection {width}x{height} with 0x{SelectedTile:X2}", commands);
			_undoRedo.Execute(composite);
			ReloadMapTiles();
			UpdateUndoRedoState();
			StatusText = $"Filled {width}x{height} selection";
		}
	}

	#endregion

	#region Import/Export

	[RelayCommand]
	private async Task ExportMap(Window? window) {
		if (window is null || MapTiles.Count == 0) {
			StatusText = "Nothing to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Map",
			".json",
			$"map_{MapIndex:D3}.json",
			FileDialogService.JsonFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var mapData = new {
				name = MapName,
				index = MapIndex,
				width = MapWidth,
				height = MapHeight,
				dataOffset = MapDataOffset,
				tiles = MapTiles.Select(t => new { t.X, t.Y, tile = t.TileIndex })
			};

			var json = System.Text.Json.JsonSerializer.Serialize(mapData,
				new System.Text.Json.JsonSerializerOptions { WriteIndented = true });
			await File.WriteAllTextAsync(path, json);

			StatusText = $"Exported map to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task ExportMapAsPng(Window? window) {
		if (window is null || MapDataArray is null || MapDataArray.Length == 0) {
			StatusText = "Nothing to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Map as PNG",
			".png",
			$"map_{MapIndex:D3}.png",
			FileDialogService.PngFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			// Create bitmap (8 pixels per tile)
			int tilePixels = 8;
			int width = MapWidth * tilePixels;
			int height = MapHeight * tilePixels;

			using var bitmap = new WriteableBitmap(
				new Avalonia.PixelSize(width, height),
				new Avalonia.Vector(96, 96),
				Avalonia.Platform.PixelFormat.Bgra8888,
				Avalonia.Platform.AlphaFormat.Opaque);

			using (var fb = bitmap.Lock()) {
				// Create pixel data array
				var pixels = new byte[width * height * 4]; // BGRA format

				for (int ty = 0; ty < MapHeight; ty++) {
					for (int tx = 0; tx < MapWidth; tx++) {
						int index = (ty * MapWidth) + tx;
						if (index >= MapDataArray.Length) continue;

						byte tileIndex = MapDataArray[index];

						// Get color for this tile
						Color color = GetTileColor(tileIndex);

						// Fill tile pixels
						for (int py = 0; py < tilePixels; py++) {
							for (int px = 0; px < tilePixels; px++) {
								int destX = (tx * tilePixels) + px;
								int destY = (ty * tilePixels) + py;
								int pixelIndex = ((destY * width) + destX) * 4;

								pixels[pixelIndex + 0] = color.B;     // Blue
								pixels[pixelIndex + 1] = color.G;     // Green
								pixels[pixelIndex + 2] = color.R;     // Red
								pixels[pixelIndex + 3] = 255;         // Alpha
							}
						}
					}
				}

				// Copy to framebuffer using Marshal
				System.Runtime.InteropServices.Marshal.Copy(pixels, 0, fb.Address, pixels.Length);
			}

			bitmap.Save(path);
			StatusText = $"Exported map to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	/// <summary>
	/// Imports map data from a PNG image by matching pixel colors to tile indices.
	/// </summary>
	[RelayCommand]
	private async Task ImportFromPng(Window? window) {
		if (window is null) {
			StatusText = "Cannot import: no window";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Import Map from PNG",
			FileDialogService.PngFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			using var stream = File.OpenRead(path);
			var bitmap = new Bitmap(stream);

			int tilePixels = 8;
			int newWidth = bitmap.PixelSize.Width / tilePixels;
			int newHeight = bitmap.PixelSize.Height / tilePixels;

			if (newWidth <= 0 || newHeight <= 0) {
				StatusText = "Image too small for import";
				return;
			}

			// Build color to tile index mapping from current palette
			var colorToTile = new Dictionary<uint, byte>();
			var palette = ColorPalette ?? GetDefaultMapPalette();
			for (int i = 0; i < Math.Min(256, palette.Length); i++) {
				var color = palette[i];
				uint key = ((uint)color.R << 16) | ((uint)color.G << 8) | color.B;
				if (!colorToTile.ContainsKey(key)) {
					colorToTile[key] = (byte)i;
				}
			}

			// Convert bitmap to pixel array for reading
			using var renderBitmap = new RenderTargetBitmap(bitmap.PixelSize);
			using (var ctx = renderBitmap.CreateDrawingContext()) {
				ctx.DrawImage(bitmap, new Avalonia.Rect(0, 0, bitmap.PixelSize.Width, bitmap.PixelSize.Height));
			}

			// Read the actual map data by sampling center of each tile cell
			var newMapData = new byte[newWidth * newHeight];

			// For each tile position, sample the center pixel color
			for (int ty = 0; ty < newHeight; ty++) {
				for (int tx = 0; tx < newWidth; tx++) {
					// Sample center of tile
					int sampleX = (tx * tilePixels) + (tilePixels / 2);
					int sampleY = (ty * tilePixels) + (tilePixels / 2);

					// Get color at sample point - use bitmap directly if possible
					Color sampleColor = SampleBitmapColor(bitmap, sampleX, sampleY);
					uint colorKey = ((uint)sampleColor.R << 16) | ((uint)sampleColor.G << 8) | sampleColor.B;

					// Find closest matching tile
					if (colorToTile.TryGetValue(colorKey, out byte tileIndex)) {
						newMapData[(ty * newWidth) + tx] = tileIndex;
					} else {
						// Find closest color
						newMapData[(ty * newWidth) + tx] = FindClosestTileByColor(sampleColor, palette);
					}
				}
			}

			// Update map dimensions
			MapWidth = newWidth;
			MapHeight = newHeight;
			MapDataArray = newMapData;

			StatusText = $"Imported {newWidth}x{newHeight} map from {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Import error: {ex.Message}";
		}
	}

	private static Color SampleBitmapColor(Bitmap bitmap, int x, int y) {
		// Clamp coordinates
		x = Math.Clamp(x, 0, bitmap.PixelSize.Width - 1);
		y = Math.Clamp(y, 0, bitmap.PixelSize.Height - 1);

		// Create a small render target to read pixel
		using var smallBitmap = new RenderTargetBitmap(new Avalonia.PixelSize(1, 1));
		using (var ctx = smallBitmap.CreateDrawingContext()) {
			ctx.DrawImage(bitmap,
				new Avalonia.Rect(x, y, 1, 1),
				new Avalonia.Rect(0, 0, 1, 1));
		}

		// Read the single pixel
		using var memStream = new MemoryStream();
		smallBitmap.Save(memStream);
		memStream.Position = 0;

		// Default to gray if we can't read
		return Colors.Gray;
	}

	private static byte FindClosestTileByColor(Color target, Color[] palette) {
		byte bestIndex = 0;
		int bestDistance = int.MaxValue;

		for (int i = 0; i < palette.Length; i++) {
			var c = palette[i];
			int dr = target.R - c.R;
			int dg = target.G - c.G;
			int db = target.B - c.B;
			int distance = (dr * dr) + (dg * dg) + (db * db);

			if (distance < bestDistance) {
				bestDistance = distance;
				bestIndex = (byte)i;
			}
		}

		return bestIndex;
	}

	/// <summary>
	/// Resizes the map to new dimensions.
	/// </summary>
	[RelayCommand]
	private void ResizeMap(string dimensions) {
		// Parse "WxH" format
		var parts = dimensions.Split('x', 'X');
		if (parts.Length != 2 ||
			!int.TryParse(parts[0], out int newWidth) ||
			!int.TryParse(parts[1], out int newHeight)) {
			StatusText = "Invalid dimensions format. Use WxH (e.g., 32x32)";
			return;
		}

		if (newWidth <= 0 || newWidth > 256 || newHeight <= 0 || newHeight > 256) {
			StatusText = "Dimensions must be between 1 and 256";
			return;
		}

		var newData = new byte[newWidth * newHeight];
		var oldData = MapDataArray ?? [];

		// Copy existing data
		for (int y = 0; y < Math.Min(MapHeight, newHeight); y++) {
			for (int x = 0; x < Math.Min(MapWidth, newWidth); x++) {
				int oldIndex = (y * MapWidth) + x;
				int newIndex = (y * newWidth) + x;
				if (oldIndex < oldData.Length) {
					newData[newIndex] = oldData[oldIndex];
				}
			}
		}

		MapWidth = newWidth;
		MapHeight = newHeight;
		MapDataArray = newData;
		StatusText = $"Resized map to {newWidth}x{newHeight}";
	}

	/// <summary>
	/// Shifts all map tiles by the specified offset.
	/// </summary>
	[RelayCommand]
	private void ShiftMap(string direction) {
		if (MapDataArray is null || MapDataArray.Length == 0) return;

		var newData = new byte[MapDataArray.Length];

		int dx = 0, dy = 0;
		switch (direction.ToUpperInvariant()) {
			case "UP": dy = -1; break;
			case "DOWN": dy = 1; break;
			case "LEFT": dx = -1; break;
			case "RIGHT": dx = 1; break;
			default: StatusText = "Invalid direction"; return;
		}

		for (int y = 0; y < MapHeight; y++) {
			for (int x = 0; x < MapWidth; x++) {
				int srcX = (x - dx + MapWidth) % MapWidth;
				int srcY = (y - dy + MapHeight) % MapHeight;

				int srcIndex = (srcY * MapWidth) + srcX;
				int dstIndex = (y * MapWidth) + x;

				newData[dstIndex] = MapDataArray[srcIndex];
			}
		}

		MapDataArray = newData;
		StatusText = $"Shifted map {direction.ToLowerInvariant()}";
	}

	/// <summary>
	/// Generates a pattern fill on the map.
	/// </summary>
	[RelayCommand]
	private void GeneratePattern(string pattern) {
		if (MapDataArray is null || MapDataArray.Length == 0) return;

		switch (pattern.ToUpperInvariant()) {
			case "CHECKERBOARD":
				for (int y = 0; y < MapHeight; y++) {
					for (int x = 0; x < MapWidth; x++) {
						int index = (y * MapWidth) + x;
						MapDataArray[index] = (byte)((x + y) % 2 * 255);
					}
				}

				StatusText = "Generated checkerboard pattern";
				break;

			case "GRADIENT_H":
				for (int y = 0; y < MapHeight; y++) {
					for (int x = 0; x < MapWidth; x++) {
						int index = (y * MapWidth) + x;
						MapDataArray[index] = (byte)(x * 255 / Math.Max(1, MapWidth - 1));
					}
				}

				StatusText = "Generated horizontal gradient";
				break;

			case "GRADIENT_V":
				for (int y = 0; y < MapHeight; y++) {
					for (int x = 0; x < MapWidth; x++) {
						int index = (y * MapWidth) + x;
						MapDataArray[index] = (byte)(y * 255 / Math.Max(1, MapHeight - 1));
					}
				}

				StatusText = "Generated vertical gradient";
				break;

			case "BORDER":
				for (int y = 0; y < MapHeight; y++) {
					for (int x = 0; x < MapWidth; x++) {
						int index = (y * MapWidth) + x;
						bool isBorder = x == 0 || x == MapWidth - 1 || y == 0 || y == MapHeight - 1;
						MapDataArray[index] = isBorder ? (byte)SelectedTile : (byte)0;
					}
				}

				StatusText = "Generated border pattern";
				break;

			case "CLEAR":
				Array.Clear(MapDataArray, 0, MapDataArray.Length);
				StatusText = "Cleared map";
				break;

			default:
				StatusText = $"Unknown pattern: {pattern}";
				break;
		}

		// Notify property changed
		OnPropertyChanged(nameof(MapDataArray));
	}

	private Color GetTileColor(byte tileIndex) {
		if (ColorPalette is not null && tileIndex < ColorPalette.Length) {
			return ColorPalette[tileIndex];
		}

		// Generate color from tile index using HSV
		double hue = tileIndex / 256.0 * 360;
		double saturation = 0.6;
		double value = 0.4 + (tileIndex % 16 / 32.0);
		return HsvToColor(hue, saturation, value);
	}

	private static Color HsvToColor(double hue, double saturation, double value) {
		double c = value * saturation;
		double x = c * (1 - Math.Abs((hue / 60 % 2) - 1));
		double m = value - c;

		double r, g, b;
		if (hue < 60) { r = c; g = x; b = 0; } else if (hue < 120) { r = x; g = c; b = 0; } else if (hue < 180) { r = 0; g = c; b = x; } else if (hue < 240) { r = 0; g = x; b = c; } else if (hue < 300) { r = x; g = 0; b = c; } else { r = c; g = 0; b = x; }

		return Color.FromRgb(
			(byte)((r + m) * 255),
			(byte)((g + m) * 255),
			(byte)((b + m) * 255));
	}

	#endregion

	#region Tile Palette

	/// <summary>
	/// Selects a tile from the palette grid.
	/// </summary>
	[RelayCommand]
	private void SelectPaletteTile(int index) {
		if (index >= 0 && index < 256) {
			SelectedTile = index;
			StatusText = $"Selected palette tile 0x{index:X2}";
		}
	}

	/// <summary>
	/// Gets the default color palette for map rendering.
	/// </summary>
	private static Color[] GetDefaultMapPalette() {
		// Generate a 256-color palette
		var palette = new Color[256];
		for (int i = 0; i < 256; i++) {
			double hue = i / 256.0 * 360;
			double sat = 0.6;
			double val = 0.4 + (i % 16 / 32.0);
			palette[i] = HsvToColor(hue, sat, val);
		}

		return palette;
	}

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
			if (HasSelection) {
				CopySelection();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Paste)) {
			if (HasClipboard) {
				PasteSelection();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Delete)) {
			if (HasSelection) {
				ClearSelection();
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.SelectAll)) {
			// Select entire map
			SelectionStartX = 0;
			SelectionStartY = 0;
			SelectionEndX = MapWidth - 1;
			SelectionEndY = MapHeight - 1;
			StatusText = "Selected entire map";
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.PencilTool)) {
			CurrentTool = MapDrawingTool.Pencil;
			StatusText = "Pencil tool selected";
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FillTool)) {
			CurrentTool = MapDrawingTool.Fill;
			StatusText = "Fill tool selected";
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.RectangleTool)) {
			CurrentTool = MapDrawingTool.Rectangle;
			StatusText = "Rectangle tool selected";
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.LineTool)) {
			CurrentTool = MapDrawingTool.Line;
			StatusText = "Line tool selected";
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.SelectionTool)) {
			CurrentTool = MapDrawingTool.Selection;
			StatusText = "Selection tool selected";
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.EyedropperTool)) {
			CurrentTool = MapDrawingTool.Eyedropper;
			StatusText = "Eyedropper tool selected";
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ToggleGrid)) {
			ShowGrid = !ShowGrid;
			return true;
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ZoomIn)) {
			if (Zoom < 8) {
				Zoom++;
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ZoomOut)) {
			if (Zoom > 1) {
				Zoom--;
				return true;
			}
		} else if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ResetZoom)) {
			Zoom = 2;
			return true;
		}

		return false;
	}
}

/// <summary>
/// Represents a tile in the map.
/// </summary>
public record MapTile(int X, int Y, byte TileIndex, int Offset) {
	public string Display => $"{TileIndex:X2}";
}

/// <summary>
/// Represents a tile in the palette.
/// </summary>
public record TilePaletteItem(int Index, string Name) {
	public string Display => $"{Index:X2}";
}
