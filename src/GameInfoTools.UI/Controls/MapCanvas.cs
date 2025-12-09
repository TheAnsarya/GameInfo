using Avalonia;
using Avalonia.Controls;
using Avalonia.Data.Converters;
using Avalonia.Input;
using Avalonia.Media;
using System.Globalization;

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
	/// Occurs when a map tile is clicked.
	/// </summary>
	public event EventHandler<MapTileClickedEventArgs>? MapTileClicked;

	static MapCanvas() {
		AffectsRender<MapCanvas>(MapDataProperty, MapWidthProperty, MapHeightProperty, TileSizeProperty,
			ShowGridProperty, ShowTileNumbersProperty, SelectedXProperty, SelectedYProperty,
			TilePaletteProperty, TilesetProperty, ColorPaletteProperty);
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
			double hue = (tileIndex / 256.0) * 360;
			double saturation = 0.6;
			double value = 0.4 + ((tileIndex % 16) / 32.0);
			color = HsvToColor(hue, saturation, value);
		}

		var brush = new SolidColorBrush(color);
		context.FillRectangle(brush, rect);
	}

	private static Color HsvToColor(double hue, double saturation, double value) {
		double c = value * saturation;
		double x = c * (1 - Math.Abs(((hue / 60) % 2) - 1));
		double m = value - c;

		double r, g, b;
		if (hue < 60) { r = c; g = x; b = 0; }
		else if (hue < 120) { r = x; g = c; b = 0; }
		else if (hue < 180) { r = 0; g = c; b = x; }
		else if (hue < 240) { r = 0; g = x; b = c; }
		else if (hue < 300) { r = x; g = 0; b = c; }
		else { r = c; g = 0; b = x; }

		return Color.FromRgb(
			(byte)((r + m) * 255),
			(byte)((g + m) * 255),
			(byte)((b + m) * 255));
	}

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
				MapTileClicked?.Invoke(this, new MapTileClickedEventArgs(gridX, gridY, index, mapData[index]));
				InvalidateVisual();
			}
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
