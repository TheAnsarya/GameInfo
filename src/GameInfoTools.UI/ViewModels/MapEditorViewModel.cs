using System.Collections.ObjectModel;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Commands;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for viewing and editing game maps.
/// </summary>
public partial class MapEditorViewModel : ViewModelBase {
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
		}
	}

	private void InitializeTilePalette() {
		// Initialize with default tile indices
		TilePalette.Clear();
		for (int i = 0; i < 256; i++) {
			TilePalette.Add(new TilePaletteItem(i, $"Tile {i:X2}"));
		}
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
