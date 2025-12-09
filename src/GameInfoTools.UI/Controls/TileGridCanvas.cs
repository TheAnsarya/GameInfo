using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// A control that renders a grid of tiles.
/// </summary>
public class TileGridCanvas : Control {
	/// <summary>
	/// Defines the <see cref="Tiles"/> property.
	/// </summary>
	public static readonly StyledProperty<IReadOnlyList<byte[,]>?> TilesProperty =
		AvaloniaProperty.Register<TileGridCanvas, IReadOnlyList<byte[,]>?>(nameof(Tiles));

	/// <summary>
	/// Defines the <see cref="TilesPerRow"/> property.
	/// </summary>
	public static readonly StyledProperty<int> TilesPerRowProperty =
		AvaloniaProperty.Register<TileGridCanvas, int>(nameof(TilesPerRow), 16);

	/// <summary>
	/// Defines the <see cref="Palette"/> property.
	/// </summary>
	public static readonly StyledProperty<Color[]?> PaletteProperty =
		AvaloniaProperty.Register<TileGridCanvas, Color[]?>(nameof(Palette), TileCanvas.GetDefaultPalette());

	/// <summary>
	/// Defines the <see cref="Scale"/> property.
	/// </summary>
	public static readonly StyledProperty<int> ScaleProperty =
		AvaloniaProperty.Register<TileGridCanvas, int>(nameof(Scale), 2);

	/// <summary>
	/// Defines the <see cref="ShowGrid"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> ShowGridProperty =
		AvaloniaProperty.Register<TileGridCanvas, bool>(nameof(ShowGrid), true);

	/// <summary>
	/// Defines the <see cref="SelectedTileIndex"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectedTileIndexProperty =
		AvaloniaProperty.Register<TileGridCanvas, int>(nameof(SelectedTileIndex), -1);

	/// <summary>
	/// Defines the <see cref="TileSpacing"/> property.
	/// </summary>
	public static readonly StyledProperty<int> TileSpacingProperty =
		AvaloniaProperty.Register<TileGridCanvas, int>(nameof(TileSpacing), 1);

	/// <summary>
	/// Occurs when a tile is clicked.
	/// </summary>
	public event EventHandler<TileClickedEventArgs>? TileClicked;

	static TileGridCanvas() {
		AffectsRender<TileGridCanvas>(TilesProperty, TilesPerRowProperty, PaletteProperty, ScaleProperty, ShowGridProperty, SelectedTileIndexProperty, TileSpacingProperty);
		AffectsMeasure<TileGridCanvas>(TilesProperty, TilesPerRowProperty, ScaleProperty, TileSpacingProperty);
	}

	/// <summary>
	/// Gets or sets the list of tile data to render.
	/// </summary>
	public IReadOnlyList<byte[,]>? Tiles {
		get => GetValue(TilesProperty);
		set => SetValue(TilesProperty, value);
	}

	/// <summary>
	/// Gets or sets the number of tiles per row.
	/// </summary>
	public int TilesPerRow {
		get => GetValue(TilesPerRowProperty);
		set => SetValue(TilesPerRowProperty, value);
	}

	/// <summary>
	/// Gets or sets the color palette for rendering.
	/// </summary>
	public Color[]? Palette {
		get => GetValue(PaletteProperty);
		set => SetValue(PaletteProperty, value);
	}

	/// <summary>
	/// Gets or sets the scale factor for rendering.
	/// </summary>
	public int Scale {
		get => GetValue(ScaleProperty);
		set => SetValue(ScaleProperty, value);
	}

	/// <summary>
	/// Gets or sets whether to show a tile grid.
	/// </summary>
	public bool ShowGrid {
		get => GetValue(ShowGridProperty);
		set => SetValue(ShowGridProperty, value);
	}

	/// <summary>
	/// Gets or sets the currently selected tile index.
	/// </summary>
	public int SelectedTileIndex {
		get => GetValue(SelectedTileIndexProperty);
		set => SetValue(SelectedTileIndexProperty, value);
	}

	/// <summary>
	/// Gets or sets the spacing between tiles.
	/// </summary>
	public int TileSpacing {
		get => GetValue(TileSpacingProperty);
		set => SetValue(TileSpacingProperty, value);
	}

	protected override Size MeasureOverride(Size availableSize) {
		var tiles = Tiles;
		if (tiles is null || tiles.Count == 0) {
			return new Size(0, 0);
		}

		int scale = Scale;
		int spacing = TileSpacing;
		int tilesPerRow = TilesPerRow;
		int tileSize = 8 * scale;
		int cellSize = tileSize + spacing;

		int columns = Math.Min(tilesPerRow, tiles.Count);
		int rows = (tiles.Count + tilesPerRow - 1) / tilesPerRow;

		return new Size(columns * cellSize, rows * cellSize);
	}

	public override void Render(DrawingContext context) {
		base.Render(context);

		var tiles = Tiles;
		var palette = Palette ?? TileCanvas.GetDefaultPalette();

		if (tiles is null || tiles.Count == 0) {
			return;
		}

		int scale = Scale;
		int spacing = TileSpacing;
		int tilesPerRow = TilesPerRow;
		int tileSize = 8 * scale;
		int cellSize = tileSize + spacing;

		// Draw background
		context.FillRectangle(Brushes.Black, Bounds);

		for (int i = 0; i < tiles.Count; i++) {
			int gridX = i % tilesPerRow;
			int gridY = i / tilesPerRow;
			int x = gridX * cellSize;
			int y = gridY * cellSize;

			var tileData = tiles[i];
			if (tileData is null || tileData.GetLength(0) < 8 || tileData.GetLength(1) < 8) {
				continue;
			}

			// Render tile pixels
			for (int py = 0; py < 8; py++) {
				for (int px = 0; px < 8; px++) {
					byte colorIndex = tileData[py, px];
					if (colorIndex < palette.Length) {
						var color = palette[colorIndex];
						var brush = new SolidColorBrush(color);
						var pixelRect = new Rect(x + (px * scale), y + (py * scale), scale, scale);
						context.FillRectangle(brush, pixelRect);
					}
				}
			}

			// Draw selection highlight
			if (i == SelectedTileIndex) {
				var selectionPen = new Pen(Brushes.Yellow, 2);
				var tileRect = new Rect(x, y, tileSize, tileSize);
				context.DrawRectangle(selectionPen, tileRect.Deflate(1));
			}
		}

		// Draw grid
		if (ShowGrid && spacing > 0) {
			var gridPen = new Pen(new SolidColorBrush(Color.FromArgb(128, 64, 64, 64)), 1);
			int columns = Math.Min(tilesPerRow, tiles.Count);
			int rows = (tiles.Count + tilesPerRow - 1) / tilesPerRow;

			// Vertical lines
			for (int col = 1; col < columns; col++) {
				int lineX = col * cellSize - (spacing / 2);
				context.DrawLine(gridPen, new Point(lineX, 0), new Point(lineX, rows * cellSize));
			}

			// Horizontal lines
			for (int row = 1; row < rows; row++) {
				int lineY = row * cellSize - (spacing / 2);
				context.DrawLine(gridPen, new Point(0, lineY), new Point(columns * cellSize, lineY));
			}
		}
	}

	protected override void OnPointerPressed(PointerPressedEventArgs e) {
		base.OnPointerPressed(e);

		var tiles = Tiles;
		if (tiles is null || tiles.Count == 0) {
			return;
		}

		var point = e.GetPosition(this);
		int scale = Scale;
		int spacing = TileSpacing;
		int tilesPerRow = TilesPerRow;
		int cellSize = (8 * scale) + spacing;

		int gridX = (int)(point.X / cellSize);
		int gridY = (int)(point.Y / cellSize);
		int index = (gridY * tilesPerRow) + gridX;

		if (index >= 0 && index < tiles.Count) {
			SelectedTileIndex = index;
			TileClicked?.Invoke(this, new TileClickedEventArgs(index, gridX, gridY));
			InvalidateVisual();
		}
	}
}

/// <summary>
/// Event args for tile click events.
/// </summary>
public class TileClickedEventArgs : EventArgs {
	public int TileIndex { get; }
	public int GridX { get; }
	public int GridY { get; }

	public TileClickedEventArgs(int tileIndex, int gridX, int gridY) {
		TileIndex = tileIndex;
		GridX = gridX;
		GridY = gridY;
	}
}
