using System.Globalization;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Data.Converters;
using Avalonia.Input;
using Avalonia.Media;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// A control that renders a 2D map grid with tile indices.
/// </summary>
public class MapCanvas : Control {
	/// <summary>
	/// Converter that multiplies zoom level by 8 to get tile size.
	/// </summary>
	public static readonly FuncValueConverter<int, int> ZoomToTileSizeConverter =
		new FuncValueConverter<int, int>(zoom => zoom * 8);

	/// <summary>
	/// Defines the <see cref="MapData"/> property.
	/// </summary>
	public static readonly StyledProperty<byte[]?> MapDataProperty =
		AvaloniaProperty.Register<MapCanvas, byte[]?>(nameof(MapData));

	/// <summary>
	/// Defines the <see cref="MapWidth"/> property.
	/// </summary>
	public static readonly StyledProperty<int> MapWidthProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(MapWidth), 16);

	/// <summary>
	/// Defines the <see cref="MapHeight"/> property.
	/// </summary>
	public static readonly StyledProperty<int> MapHeightProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(MapHeight), 16);

	/// <summary>
	/// Defines the <see cref="TileSize"/> property.
	/// </summary>
	public static readonly StyledProperty<int> TileSizeProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(TileSize), 16);

	/// <summary>
	/// Defines the <see cref="ShowGrid"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> ShowGridProperty =
		AvaloniaProperty.Register<MapCanvas, bool>(nameof(ShowGrid), true);

	/// <summary>
	/// Defines the <see cref="ShowTileNumbers"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> ShowTileNumbersProperty =
		AvaloniaProperty.Register<MapCanvas, bool>(nameof(ShowTileNumbers), true);

	/// <summary>
	/// Defines the <see cref="SelectedX"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectedXProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(SelectedX), -1);

	/// <summary>
	/// Defines the <see cref="SelectedY"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectedYProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(SelectedY), -1);

	/// <summary>
	/// Defines the <see cref="TilePalette"/> property.
	/// For visual tile rendering - maps tile indices to colors.
	/// </summary>
	public static readonly StyledProperty<Color[]?> TilePaletteProperty =
		AvaloniaProperty.Register<MapCanvas, Color[]?>(nameof(TilePalette));

	/// <summary>
	/// Defines the <see cref="Tileset"/> property.
	/// For visual tile rendering - the actual tile graphics.
	/// </summary>
	public static readonly StyledProperty<IReadOnlyList<byte[,]>?> TilesetProperty =
		AvaloniaProperty.Register<MapCanvas, IReadOnlyList<byte[,]>?>(nameof(Tileset));

	/// <summary>
	/// Defines the <see cref="ColorPalette"/> property.
	/// </summary>
	public static readonly StyledProperty<Color[]?> ColorPaletteProperty =
		AvaloniaProperty.Register<MapCanvas, Color[]?>(nameof(ColorPalette), TileCanvas.GetDefaultPalette());

	/// <summary>
	/// Defines the <see cref="SelectionStartX"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectionStartXProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(SelectionStartX), -1);

	/// <summary>
	/// Defines the <see cref="SelectionStartY"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectionStartYProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(SelectionStartY), -1);

	/// <summary>
	/// Defines the <see cref="SelectionEndX"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectionEndXProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(SelectionEndX), -1);

	/// <summary>
	/// Defines the <see cref="SelectionEndY"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectionEndYProperty =
		AvaloniaProperty.Register<MapCanvas, int>(nameof(SelectionEndY), -1);

	/// <summary>
	/// Defines the <see cref="ShowMetatileGrid"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> ShowMetatileGridProperty =
		AvaloniaProperty.Register<MapCanvas, bool>(nameof(ShowMetatileGrid), false);

	/// <summary>
	/// Occurs when a map tile is clicked.
	/// </summary>
	public event EventHandler<MapTileClickedEventArgs>? MapTileClicked;

	/// <summary>
	/// Occurs when drawing starts.
	/// </summary>
	public event EventHandler<MapTileClickedEventArgs>? DrawStarted;

	/// <summary>
	/// Occurs when drawing continues (drag).
	/// </summary>
	public event EventHandler<MapTileClickedEventArgs>? DrawContinued;

	/// <summary>
	/// Occurs when drawing ends.
	/// </summary>
	public event EventHandler<MapTileClickedEventArgs>? DrawEnded;

	static MapCanvas() {
		AffectsRender<MapCanvas>(MapDataProperty, MapWidthProperty, MapHeightProperty, TileSizeProperty,
			ShowGridProperty, ShowTileNumbersProperty, SelectedXProperty, SelectedYProperty,
			TilePaletteProperty, TilesetProperty, ColorPaletteProperty,
			SelectionStartXProperty, SelectionStartYProperty, SelectionEndXProperty, SelectionEndYProperty,
			ShowMetatileGridProperty);
		AffectsMeasure<MapCanvas>(MapWidthProperty, MapHeightProperty, TileSizeProperty);
	}

	/// <summary>
	/// Gets or sets the map data (array of tile indices).
	/// </summary>
	public byte[]? MapData {
		get => GetValue(MapDataProperty);
		set => SetValue(MapDataProperty, value);
	}

	/// <summary>
	/// Gets or sets the map width in tiles.
	/// </summary>
	public int MapWidth {
		get => GetValue(MapWidthProperty);
		set => SetValue(MapWidthProperty, value);
	}

	/// <summary>
	/// Gets or sets the map height in tiles.
	/// </summary>
	public int MapHeight {
		get => GetValue(MapHeightProperty);
		set => SetValue(MapHeightProperty, value);
	}

	/// <summary>
	/// Gets or sets the display size of each tile in pixels.
	/// </summary>
	public int TileSize {
		get => GetValue(TileSizeProperty);
		set => SetValue(TileSizeProperty, value);
	}

	/// <summary>
	/// Gets or sets whether to show a grid.
	/// </summary>
	public bool ShowGrid {
		get => GetValue(ShowGridProperty);
		set => SetValue(ShowGridProperty, value);
	}

	/// <summary>
	/// Gets or sets whether to show tile numbers.
	/// </summary>
	public bool ShowTileNumbers {
		get => GetValue(ShowTileNumbersProperty);
		set => SetValue(ShowTileNumbersProperty, value);
	}

	/// <summary>
	/// Gets or sets the selected X coordinate.
	/// </summary>
	public int SelectedX {
		get => GetValue(SelectedXProperty);
		set => SetValue(SelectedXProperty, value);
	}

	/// <summary>
	/// Gets or sets the selected Y coordinate.
	/// </summary>
	public int SelectedY {
		get => GetValue(SelectedYProperty);
		set => SetValue(SelectedYProperty, value);
	}

	/// <summary>
	/// Gets or sets the tile palette (maps tile indices to display colors).
	/// If null, uses default color mapping based on tile index.
	/// </summary>
	public Color[]? TilePalette {
		get => GetValue(TilePaletteProperty);
		set => SetValue(TilePaletteProperty, value);
	}

	/// <summary>
	/// Gets or sets the tileset for visual rendering.
	/// </summary>
	public IReadOnlyList<byte[,]>? Tileset {
		get => GetValue(TilesetProperty);
		set => SetValue(TilesetProperty, value);
	}

	/// <summary>
	/// Gets or sets the color palette for tile rendering.
	/// </summary>
	public Color[]? ColorPalette {
		get => GetValue(ColorPaletteProperty);
		set => SetValue(ColorPaletteProperty, value);
	}

	/// <summary>
	/// Gets or sets the selection start X coordinate.
	/// </summary>
	public int SelectionStartX {
		get => GetValue(SelectionStartXProperty);
		set => SetValue(SelectionStartXProperty, value);
	}

	/// <summary>
	/// Gets or sets the selection start Y coordinate.
	/// </summary>
	public int SelectionStartY {
		get => GetValue(SelectionStartYProperty);
		set => SetValue(SelectionStartYProperty, value);
	}

	/// <summary>
	/// Gets or sets the selection end X coordinate.
	/// </summary>
	public int SelectionEndX {
		get => GetValue(SelectionEndXProperty);
		set => SetValue(SelectionEndXProperty, value);
	}

	/// <summary>
	/// Gets or sets the selection end Y coordinate.
	/// </summary>
	public int SelectionEndY {
		get => GetValue(SelectionEndYProperty);
		set => SetValue(SelectionEndYProperty, value);
	}

	/// <summary>
	/// Gets or sets whether to show metatile (16x16) grid overlay.
	/// </summary>
	public bool ShowMetatileGrid {
		get => GetValue(ShowMetatileGridProperty);
		set => SetValue(ShowMetatileGridProperty, value);
	}

	protected override Size MeasureOverride(Size availableSize) {
		return new Size(MapWidth * TileSize, MapHeight * TileSize);
	}

	public override void Render(DrawingContext context) {
		base.Render(context);

		var mapData = MapData;
		int mapWidth = MapWidth;
		int mapHeight = MapHeight;
		int tileSize = TileSize;
		var tileset = Tileset;
		var colorPalette = ColorPalette ?? TileCanvas.GetDefaultPalette();
		var tilePalette = TilePalette;

		// Draw background
		context.FillRectangle(Brushes.DarkGray, new Rect(0, 0, mapWidth * tileSize, mapHeight * tileSize));

		if (mapData is null || mapData.Length == 0) {
			return;
		}

		// Render each map tile
		for (int y = 0; y < mapHeight; y++) {
			for (int x = 0; x < mapWidth; x++) {
				int index = (y * mapWidth) + x;
				if (index >= mapData.Length) break;

				byte tileIndex = mapData[index];
				int px = x * tileSize;
				int py = y * tileSize;
				var tileRect = new Rect(px, py, tileSize, tileSize);

				// Try to render actual tile graphics if tileset is available
				if (tileset is not null && tileIndex < tileset.Count) {
					var tileData = tileset[tileIndex];
					if (tileData is not null && tileData.GetLength(0) >= 8 && tileData.GetLength(1) >= 8) {
						RenderTile(context, tileData, px, py, tileSize, colorPalette);
					} else {
						// Fallback to color block
						RenderColorBlock(context, tileIndex, tileRect, tilePalette);
					}
				} else {
					// Render color block based on tile index
					RenderColorBlock(context, tileIndex, tileRect, tilePalette);
				}
			}
		}

		// Draw grid
		if (ShowGrid) {
			var gridPen = new Pen(new SolidColorBrush(Color.FromArgb(128, 0, 0, 0)), 1);

			for (int x = 0; x <= mapWidth; x++) {
				context.DrawLine(gridPen, new Point(x * tileSize, 0), new Point(x * tileSize, mapHeight * tileSize));
			}

			for (int y = 0; y <= mapHeight; y++) {
				context.DrawLine(gridPen, new Point(0, y * tileSize), new Point(mapWidth * tileSize, y * tileSize));
			}
		}

		// Draw tile numbers
		if (ShowTileNumbers && tileSize >= 16) {
			var typeface = new Typeface("Consolas");
			var fontSize = Math.Max(8, tileSize / 3);

			for (int y = 0; y < mapHeight; y++) {
				for (int x = 0; x < mapWidth; x++) {
					int index = (y * mapWidth) + x;
					if (index >= mapData.Length) break;

					byte tileIndex = mapData[index];
					var text = new FormattedText(
						$"{tileIndex:X2}",
						System.Globalization.CultureInfo.InvariantCulture,
						FlowDirection.LeftToRight,
						typeface,
						fontSize,
						Brushes.White);

					var textPoint = new Point(
						(x * tileSize) + ((tileSize - text.Width) / 2),
						(y * tileSize) + ((tileSize - text.Height) / 2));

					// Draw text shadow for readability
					var shadowText = new FormattedText(
						$"{tileIndex:X2}",
						System.Globalization.CultureInfo.InvariantCulture,
						FlowDirection.LeftToRight,
						typeface,
						fontSize,
						Brushes.Black);
					context.DrawText(shadowText, textPoint + new Vector(1, 1));
					context.DrawText(text, textPoint);
				}
			}
		}

		// Draw selection
		if (SelectedX >= 0 && SelectedX < mapWidth && SelectedY >= 0 && SelectedY < mapHeight) {
			var selectionPen = new Pen(Brushes.Yellow, 2);
			var selectionRect = new Rect(SelectedX * tileSize, SelectedY * tileSize, tileSize, tileSize);
			context.DrawRectangle(selectionPen, selectionRect.Deflate(1));
		}

		// Draw region selection
		int selStartX = SelectionStartX;
		int selStartY = SelectionStartY;
		int selEndX = SelectionEndX;
		int selEndY = SelectionEndY;

		if (selStartX >= 0 && selStartY >= 0 && selEndX >= selStartX && selEndY >= selStartY) {
			int minX = Math.Min(selStartX, selEndX);
			int maxX = Math.Max(selStartX, selEndX);
			int minY = Math.Min(selStartY, selEndY);
			int maxY = Math.Max(selStartY, selEndY);

			// Clamp to map bounds
			minX = Math.Max(0, Math.Min(minX, mapWidth - 1));
			maxX = Math.Max(0, Math.Min(maxX, mapWidth - 1));
			minY = Math.Max(0, Math.Min(minY, mapHeight - 1));
			maxY = Math.Max(0, Math.Min(maxY, mapHeight - 1));

			var selectionPen = new Pen(new SolidColorBrush(Color.FromRgb(0, 200, 255)), 2,
				new DashStyle([4, 2], 0));
			var fillBrush = new SolidColorBrush(Color.FromArgb(50, 0, 200, 255));

			var regionRect = new Rect(
				minX * tileSize,
				minY * tileSize,
				(maxX - minX + 1) * tileSize,
				(maxY - minY + 1) * tileSize);

			context.FillRectangle(fillBrush, regionRect);
			context.DrawRectangle(selectionPen, regionRect);
		}

		// Draw metatile grid (16x16)
		if (ShowMetatileGrid) {
			var metatilePen = new Pen(new SolidColorBrush(Color.FromRgb(255, 100, 100)), 2);

			for (int x = 0; x <= mapWidth; x += 2) {
				context.DrawLine(metatilePen, new Point(x * tileSize, 0), new Point(x * tileSize, mapHeight * tileSize));
			}

			for (int y = 0; y <= mapHeight; y += 2) {
				context.DrawLine(metatilePen, new Point(0, y * tileSize), new Point(mapWidth * tileSize, y * tileSize));
			}
		}
	}

	private void RenderTile(DrawingContext context, byte[,] tileData, int px, int py, int tileSize, Color[] palette) {
		int scale = tileSize / 8;
		if (scale < 1) scale = 1;

		for (int ty = 0; ty < 8; ty++) {
			for (int tx = 0; tx < 8; tx++) {
				byte colorIndex = tileData[ty, tx];
				if (colorIndex < palette.Length) {
					var color = palette[colorIndex];
					var brush = new SolidColorBrush(color);
					var pixelRect = new Rect(px + (tx * scale), py + (ty * scale), scale, scale);
					context.FillRectangle(brush, pixelRect);
				}
			}
		}
	}

	private static void RenderColorBlock(DrawingContext context, byte tileIndex, Rect rect, Color[]? tilePalette) {
		Color color;
		if (tilePalette is not null && tileIndex < tilePalette.Length) {
			color = tilePalette[tileIndex];
		} else {
			// Generate color from tile index using HSV
			double hue = tileIndex / 256.0 * 360;
			double saturation = 0.6;
			double value = 0.4 + (tileIndex % 16 / 32.0);
			color = HsvToColor(hue, saturation, value);
		}

		var brush = new SolidColorBrush(color);
		context.FillRectangle(brush, rect);
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

	private bool _isDrawing;

	protected override void OnPointerPressed(PointerPressedEventArgs e) {
		base.OnPointerPressed(e);

		var mapData = MapData;
		if (mapData is null || mapData.Length == 0) {
			return;
		}

		var point = e.GetPosition(this);
		int tileSize = TileSize;

		int gridX = (int)(point.X / tileSize);
		int gridY = (int)(point.Y / tileSize);

		if (gridX >= 0 && gridX < MapWidth && gridY >= 0 && gridY < MapHeight) {
			int index = (gridY * MapWidth) + gridX;
			if (index < mapData.Length) {
				SelectedX = gridX;
				SelectedY = gridY;
				_isDrawing = true;

				var args = new MapTileClickedEventArgs(gridX, gridY, index, mapData[index]);
				MapTileClicked?.Invoke(this, args);
				DrawStarted?.Invoke(this, args);
				InvalidateVisual();
			}
		}

		// Capture pointer for drag events
		e.Pointer.Capture(this);
	}

	protected override void OnPointerMoved(PointerEventArgs e) {
		base.OnPointerMoved(e);

		if (!_isDrawing) return;

		var mapData = MapData;
		if (mapData is null || mapData.Length == 0) return;

		var point = e.GetPosition(this);
		int tileSize = TileSize;

		int gridX = (int)(point.X / tileSize);
		int gridY = (int)(point.Y / tileSize);

		if (gridX >= 0 && gridX < MapWidth && gridY >= 0 && gridY < MapHeight) {
			int index = (gridY * MapWidth) + gridX;
			if (index < mapData.Length) {
				DrawContinued?.Invoke(this, new MapTileClickedEventArgs(gridX, gridY, index, mapData[index]));
			}
		}
	}

	protected override void OnPointerReleased(PointerReleasedEventArgs e) {
		base.OnPointerReleased(e);

		if (!_isDrawing) return;
		_isDrawing = false;

		e.Pointer.Capture(null);

		var mapData = MapData;
		if (mapData is null || mapData.Length == 0) return;

		var point = e.GetPosition(this);
		int tileSize = TileSize;

		int gridX = (int)(point.X / tileSize);
		int gridY = (int)(point.Y / tileSize);

		// Clamp to bounds
		gridX = Math.Clamp(gridX, 0, MapWidth - 1);
		gridY = Math.Clamp(gridY, 0, MapHeight - 1);

		int index = (gridY * MapWidth) + gridX;
		if (index < mapData.Length) {
			DrawEnded?.Invoke(this, new MapTileClickedEventArgs(gridX, gridY, index, mapData[index]));
		}
	}
}

/// <summary>
/// Event args for map tile click events.
/// </summary>
public class MapTileClickedEventArgs : EventArgs {
	public int X { get; }
	public int Y { get; }
	public int Index { get; }
	public byte TileValue { get; }

	public MapTileClickedEventArgs(int x, int y, int index, byte tileValue) {
		X = x;
		Y = y;
		Index = index;
		TileValue = tileValue;
	}
}
