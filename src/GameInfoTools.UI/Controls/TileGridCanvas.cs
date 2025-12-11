using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media;
using System.Collections.ObjectModel;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// Grid overlay display modes for the tile grid.
/// </summary>
public enum GridOverlayMode {
	/// <summary>No grid overlay.</summary>
	None,
	/// <summary>8x8 pixel grid (single tile boundaries).</summary>
	Grid8x8,
	/// <summary>16x16 pixel grid (2x2 tile groups).</summary>
	Grid16x16,
	/// <summary>Both 8x8 and 16x16 grid overlays.</summary>
	Both
}

/// <summary>
/// A control that renders a grid of tiles with optional multi-selection support.
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
	/// Defines the <see cref="AllowMultiSelect"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> AllowMultiSelectProperty =
		AvaloniaProperty.Register<TileGridCanvas, bool>(nameof(AllowMultiSelect), false);

	/// <summary>
	/// Defines the <see cref="GridOverlay"/> property.
	/// </summary>
	public static readonly StyledProperty<GridOverlayMode> GridOverlayProperty =
		AvaloniaProperty.Register<TileGridCanvas, GridOverlayMode>(nameof(GridOverlay), GridOverlayMode.None);

	/// <summary>
	/// Occurs when a tile is clicked.
	/// </summary>
	public event EventHandler<TileClickedEventArgs>? TileClicked;

	/// <summary>
	/// Occurs when the selected tiles change.
	/// </summary>
	public event EventHandler<MultiSelectChangedEventArgs>? MultiSelectChanged;

	/// <summary>
	/// Selected tile indices for multi-select mode.
	/// </summary>
	private readonly HashSet<int> _selectedIndices = [];

	static TileGridCanvas() {
		AffectsRender<TileGridCanvas>(TilesProperty, TilesPerRowProperty, PaletteProperty, ScaleProperty, ShowGridProperty, SelectedTileIndexProperty, TileSpacingProperty, AllowMultiSelectProperty, GridOverlayProperty);
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

	/// <summary>
	/// Gets or sets whether multi-select mode is enabled.
	/// </summary>
	public bool AllowMultiSelect {
		get => GetValue(AllowMultiSelectProperty);
		set => SetValue(AllowMultiSelectProperty, value);
	}

	/// <summary>
	/// Gets or sets the grid overlay display mode.
	/// </summary>
	public GridOverlayMode GridOverlay {
		get => GetValue(GridOverlayProperty);
		set => SetValue(GridOverlayProperty, value);
	}

	/// <summary>
	/// Gets the list of selected tile indices (in multi-select mode).
	/// </summary>
	public IReadOnlySet<int> SelectedIndices => _selectedIndices;

	/// <summary>
	/// Selects multiple tiles.
	/// </summary>
	public void SelectTiles(IEnumerable<int> indices) {
		_selectedIndices.Clear();
		foreach (var idx in indices) {
			_selectedIndices.Add(idx);
		}
		InvalidateVisual();
		MultiSelectChanged?.Invoke(this, new MultiSelectChangedEventArgs([.. _selectedIndices]));
	}

	/// <summary>
	/// Clears all selected tiles.
	/// </summary>
	public void ClearSelection() {
		_selectedIndices.Clear();
		InvalidateVisual();
		MultiSelectChanged?.Invoke(this, new MultiSelectChangedEventArgs([]));
	}

	/// <summary>
	/// Toggles selection of a tile.
	/// </summary>
	public void ToggleSelection(int index) {
		if (_selectedIndices.Contains(index)) {
			_selectedIndices.Remove(index);
		} else {
			_selectedIndices.Add(index);
		}
		InvalidateVisual();
		MultiSelectChanged?.Invoke(this, new MultiSelectChangedEventArgs([.. _selectedIndices]));
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

			// Draw multi-selection highlight
			if (AllowMultiSelect && _selectedIndices.Contains(i)) {
				var multiSelectPen = new Pen(new SolidColorBrush(Color.FromArgb(200, 0, 200, 255)), 2);
				var multiSelectFill = new SolidColorBrush(Color.FromArgb(50, 0, 200, 255));
				var tileRect = new Rect(x, y, tileSize, tileSize);
				context.FillRectangle(multiSelectFill, tileRect);
				context.DrawRectangle(multiSelectPen, tileRect.Deflate(1));
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

		// Draw grid overlays (8x8 and/or 16x16)
		var gridOverlay = GridOverlay;
		if (gridOverlay != GridOverlayMode.None) {
			int columns = Math.Min(tilesPerRow, tiles.Count);
			int rows = (tiles.Count + tilesPerRow - 1) / tilesPerRow;
			int totalWidth = columns * cellSize;
			int totalHeight = rows * cellSize;

			// 8x8 overlay (every tile)
			if (gridOverlay == GridOverlayMode.Grid8x8 || gridOverlay == GridOverlayMode.Both) {
				var overlay8Pen = new Pen(new SolidColorBrush(Color.FromArgb(100, 255, 255, 0)), 1);

				for (int col = 0; col <= columns; col++) {
					int lineX = col * cellSize;
					context.DrawLine(overlay8Pen, new Point(lineX, 0), new Point(lineX, totalHeight));
				}
				for (int row = 0; row <= rows; row++) {
					int lineY = row * cellSize;
					context.DrawLine(overlay8Pen, new Point(0, lineY), new Point(totalWidth, lineY));
				}
			}

			// 16x16 overlay (every 2 tiles)
			if (gridOverlay == GridOverlayMode.Grid16x16 || gridOverlay == GridOverlayMode.Both) {
				var overlay16Pen = new Pen(new SolidColorBrush(Color.FromArgb(180, 0, 255, 255)), 2);

				for (int col = 0; col <= columns; col += 2) {
					int lineX = col * cellSize;
					context.DrawLine(overlay16Pen, new Point(lineX, 0), new Point(lineX, totalHeight));
				}
				for (int row = 0; row <= rows; row += 2) {
					int lineY = row * cellSize;
					context.DrawLine(overlay16Pen, new Point(0, lineY), new Point(totalWidth, lineY));
				}
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
		bool ctrlPressed = e.KeyModifiers.HasFlag(KeyModifiers.Control);
		bool shiftPressed = e.KeyModifiers.HasFlag(KeyModifiers.Shift);
		int scale = Scale;
		int spacing = TileSpacing;
		int tilesPerRow = TilesPerRow;
		int cellSize = (8 * scale) + spacing;

		int gridX = (int)(point.X / cellSize);
		int gridY = (int)(point.Y / cellSize);
		int index = (gridY * tilesPerRow) + gridX;

		if (index >= 0 && index < tiles.Count) {
			// Handle multi-select with Ctrl key
			if (AllowMultiSelect && ctrlPressed) {
				ToggleSelection(index);
			} else if (AllowMultiSelect && shiftPressed && SelectedTileIndex >= 0) {
				// Range selection with Shift
				int start = Math.Min(SelectedTileIndex, index);
				int end = Math.Max(SelectedTileIndex, index);
				var range = Enumerable.Range(start, end - start + 1);
				SelectTiles(range);
			} else {
				// Normal single selection
				_selectedIndices.Clear();
				SelectedTileIndex = index;
			}

			TileClicked?.Invoke(this, new TileClickedEventArgs(index, gridX, gridY, ctrlPressed, shiftPressed));
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
	public bool CtrlPressed { get; }
	public bool ShiftPressed { get; }

	public TileClickedEventArgs(int tileIndex, int gridX, int gridY, bool ctrlPressed = false, bool shiftPressed = false) {
		TileIndex = tileIndex;
		GridX = gridX;
		GridY = gridY;
		CtrlPressed = ctrlPressed;
		ShiftPressed = shiftPressed;
	}
}

/// <summary>
/// Event args for multi-select change events.
/// </summary>
public class MultiSelectChangedEventArgs : EventArgs {
	public IReadOnlyList<int> SelectedIndices { get; }

	public MultiSelectChangedEventArgs(IReadOnlyList<int> selectedIndices) {
		SelectedIndices = selectedIndices;
	}
}
