using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media;
using Avalonia.Threading;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// Available drawing tools for the editable tile canvas.
/// </summary>
public enum DrawingTool {
	/// <summary>Single pixel pencil.</summary>
	Pencil,
	/// <summary>Flood fill tool.</summary>
	Fill,
	/// <summary>Line drawing tool.</summary>
	Line,
	/// <summary>Rectangle outline tool.</summary>
	Rectangle,
	/// <summary>Color picker/eyedropper tool.</summary>
	Eyedropper,
	/// <summary>Selection tool for rectangular regions.</summary>
	Selection
}

/// <summary>
/// A control that renders and allows pixel-level editing of an 8x8 tile.
/// </summary>
public class EditableTileCanvas : Control {
	/// <summary>
	/// Defines the <see cref="TileData"/> property.
	/// </summary>
	public static readonly StyledProperty<byte[,]?> TileDataProperty =
		AvaloniaProperty.Register<EditableTileCanvas, byte[,]?>(nameof(TileData));

	/// <summary>
	/// Defines the <see cref="Palette"/> property.
	/// </summary>
	public static readonly StyledProperty<Color[]?> PaletteProperty =
		AvaloniaProperty.Register<EditableTileCanvas, Color[]?>(nameof(Palette), TileCanvas.GetDefaultPalette());

	/// <summary>
	/// Defines the <see cref="Scale"/> property.
	/// </summary>
	public static readonly StyledProperty<int> ScaleProperty =
		AvaloniaProperty.Register<EditableTileCanvas, int>(nameof(Scale), 8);

	/// <summary>
	/// Defines the <see cref="ShowGrid"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> ShowGridProperty =
		AvaloniaProperty.Register<EditableTileCanvas, bool>(nameof(ShowGrid), true);

	/// <summary>
	/// Defines the <see cref="SelectedColorIndex"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectedColorIndexProperty =
		AvaloniaProperty.Register<EditableTileCanvas, int>(nameof(SelectedColorIndex), 0);

	/// <summary>
	/// Defines the <see cref="IsEditable"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> IsEditableProperty =
		AvaloniaProperty.Register<EditableTileCanvas, bool>(nameof(IsEditable), true);

	/// <summary>
	/// Defines the <see cref="CurrentTool"/> property.
	/// </summary>
	public static readonly StyledProperty<DrawingTool> CurrentToolProperty =
		AvaloniaProperty.Register<EditableTileCanvas, DrawingTool>(nameof(CurrentTool), DrawingTool.Pencil);

	/// <summary>
	/// Defines the <see cref="Selection"/> property.
	/// </summary>
	public static readonly DirectProperty<EditableTileCanvas, Rect?> SelectionProperty =
		AvaloniaProperty.RegisterDirect<EditableTileCanvas, Rect?>(
			nameof(Selection),
			o => o._selection,
			(o, v) => o.Selection = v);

	/// <summary>
	/// Occurs when a pixel is changed.
	/// </summary>
	public event EventHandler<PixelChangedEventArgs>? PixelChanged;

	/// <summary>
	/// Occurs when a color is picked via the eyedropper tool.
	/// </summary>
	public event EventHandler<ColorPickedEventArgs>? ColorPicked;

	/// <summary>
	/// Occurs when a selection changes.
	/// </summary>
	public event EventHandler<PixelSelectionChangedEventArgs>? SelectionChanged;

	private bool _isDrawing;
	private Point _lastDrawPoint = new(-1, -1);
	private Point _lineStartPoint = new(-1, -1);
	private Rect? _selection;
	private Point _selectionStart = new(-1, -1);

	static EditableTileCanvas() {
		AffectsRender<EditableTileCanvas>(TileDataProperty, PaletteProperty, ScaleProperty, ShowGridProperty, SelectedColorIndexProperty, CurrentToolProperty);
		AffectsMeasure<EditableTileCanvas>(ScaleProperty);
	}

	/// <summary>
	/// Gets or sets the 8x8 indexed tile data.
	/// </summary>
	public byte[,]? TileData {
		get => GetValue(TileDataProperty);
		set => SetValue(TileDataProperty, value);
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
	/// Gets or sets whether to show a pixel grid.
	/// </summary>
	public bool ShowGrid {
		get => GetValue(ShowGridProperty);
		set => SetValue(ShowGridProperty, value);
	}

	/// <summary>
	/// Gets or sets the color index to draw with.
	/// </summary>
	public int SelectedColorIndex {
		get => GetValue(SelectedColorIndexProperty);
		set => SetValue(SelectedColorIndexProperty, value);
	}

	/// <summary>
	/// Gets or sets whether pixel editing is enabled.
	/// </summary>
	public bool IsEditable {
		get => GetValue(IsEditableProperty);
		set => SetValue(IsEditableProperty, value);
	}

	/// <summary>
	/// Gets or sets the current drawing tool.
	/// </summary>
	public DrawingTool CurrentTool {
		get => GetValue(CurrentToolProperty);
		set => SetValue(CurrentToolProperty, value);
	}

	/// <summary>
	/// Gets or sets the current pixel selection (in pixel coordinates 0-7).
	/// </summary>
	public Rect? Selection {
		get => _selection;
		set {
			if (SetAndRaise(SelectionProperty, ref _selection, value)) {
				InvalidateVisual();
				SelectionChanged?.Invoke(this, new PixelSelectionChangedEventArgs(value));
			}
		}
	}

	protected override Size MeasureOverride(Size availableSize) {
		int size = 8 * Scale;
		return new Size(size, size);
	}

	public override void Render(DrawingContext context) {
		base.Render(context);

		int scale = Scale;
		int size = 8 * scale;
		var bounds = new Rect(0, 0, size, size);

		// Draw background
		context.FillRectangle(Brushes.Black, bounds);

		var tileData = TileData;
		var palette = Palette ?? TileCanvas.GetDefaultPalette();

		if (tileData is not null && tileData.GetLength(0) >= 8 && tileData.GetLength(1) >= 8) {
			// Render each pixel
			for (int y = 0; y < 8; y++) {
				for (int x = 0; x < 8; x++) {
					byte colorIndex = tileData[y, x];
					if (colorIndex < palette.Length) {
						var color = palette[colorIndex];
						var brush = new SolidColorBrush(color);
						var pixelRect = new Rect(x * scale, y * scale, scale, scale);
						context.FillRectangle(brush, pixelRect);
					}
				}
			}
		}

		// Draw grid if enabled
		if (ShowGrid && scale >= 4) {
			var gridPen = new Pen(new SolidColorBrush(Color.FromArgb(80, 128, 128, 128)), 1);
			for (int i = 1; i < 8; i++) {
				context.DrawLine(gridPen, new Point(i * scale, 0), new Point(i * scale, size));
				context.DrawLine(gridPen, new Point(0, i * scale), new Point(size, i * scale));
			}
		}

		// Draw border
		var borderPen = new Pen(Brushes.Gray, 1);
		context.DrawRectangle(borderPen, bounds);

		// Draw selection if present
		if (_selection.HasValue) {
			var sel = _selection.Value;
			var selectionRect = new Rect(
				sel.X * scale,
				sel.Y * scale,
				sel.Width * scale,
				sel.Height * scale);
			var selectionPen = new Pen(new SolidColorBrush(Color.FromArgb(200, 0, 150, 255)), 2);
			var selectionFill = new SolidColorBrush(Color.FromArgb(50, 0, 150, 255));
			context.FillRectangle(selectionFill, selectionRect);
			context.DrawRectangle(selectionPen, selectionRect);
		}
	}

	protected override void OnPointerPressed(PointerPressedEventArgs e) {
		base.OnPointerPressed(e);

		if (!IsEditable || TileData is null) return;

		var position = e.GetPosition(this);
		var isRightButton = e.GetCurrentPoint(this).Properties.IsRightButtonPressed;
		int scale = Scale;
		int pixelX = (int)(position.X / scale);
		int pixelY = (int)(position.Y / scale);

		if (pixelX < 0 || pixelX >= 8 || pixelY < 0 || pixelY >= 8) return;

		switch (CurrentTool) {
			case DrawingTool.Pencil:
				_isDrawing = true;
				DrawPixelAt(position, isRightButton);
				e.Pointer.Capture(this);
				break;

			case DrawingTool.Fill:
				FloodFill(pixelX, pixelY, isRightButton ? (byte)0 : (byte)SelectedColorIndex);
				break;

			case DrawingTool.Line:
				if (_lineStartPoint.X < 0) {
					_lineStartPoint = new Point(pixelX, pixelY);
				} else {
					DrawLine((int)_lineStartPoint.X, (int)_lineStartPoint.Y, pixelX, pixelY, isRightButton ? (byte)0 : (byte)SelectedColorIndex);
					_lineStartPoint = new Point(-1, -1);
				}
				break;

			case DrawingTool.Rectangle:
				if (_lineStartPoint.X < 0) {
					_lineStartPoint = new Point(pixelX, pixelY);
				} else {
					DrawRectangle((int)_lineStartPoint.X, (int)_lineStartPoint.Y, pixelX, pixelY, isRightButton ? (byte)0 : (byte)SelectedColorIndex);
					_lineStartPoint = new Point(-1, -1);
				}
				break;

			case DrawingTool.Eyedropper:
				var color = TileData![pixelY, pixelX];
				ColorPicked?.Invoke(this, new ColorPickedEventArgs(pixelX, pixelY, color));
				break;

			case DrawingTool.Selection:
				_isDrawing = true;
				_selectionStart = new Point(pixelX, pixelY);
				Selection = new Rect(pixelX, pixelY, 1, 1);
				e.Pointer.Capture(this);
				break;
		}
	}

	protected override void OnPointerMoved(PointerEventArgs e) {
		base.OnPointerMoved(e);

		if (!_isDrawing || !IsEditable || TileData is null) return;

		var point = e.GetPosition(this);
		int scale = Scale;
		int pixelX = Math.Clamp((int)(point.X / scale), 0, 7);
		int pixelY = Math.Clamp((int)(point.Y / scale), 0, 7);

		if (CurrentTool == DrawingTool.Pencil) {
			var props = e.GetCurrentPoint(this).Properties;
			DrawPixelAt(point, props.IsRightButtonPressed);
		} else if (CurrentTool == DrawingTool.Selection && _selectionStart.X >= 0) {
			int x1 = (int)_selectionStart.X;
			int y1 = (int)_selectionStart.Y;
			int x2 = pixelX;
			int y2 = pixelY;
			int minX = Math.Min(x1, x2);
			int minY = Math.Min(y1, y2);
			int maxX = Math.Max(x1, x2);
			int maxY = Math.Max(y1, y2);
			Selection = new Rect(minX, minY, maxX - minX + 1, maxY - minY + 1);
		}
	}

	protected override void OnPointerReleased(PointerReleasedEventArgs e) {
		base.OnPointerReleased(e);

		if (CurrentTool == DrawingTool.Selection) {
			_selectionStart = new Point(-1, -1);
		}
		_isDrawing = false;
		_lastDrawPoint = new Point(-1, -1);
		e.Pointer.Capture(null);
	}

	/// <summary>
	/// Clears the current selection.
	/// </summary>
	public void ClearSelection() {
		Selection = null;
	}

	/// <summary>
	/// Gets the selected pixel data as a 2D array.
	/// Returns null if no selection or no tile data.
	/// </summary>
	public byte[,]? GetSelectedPixels() {
		if (!_selection.HasValue || TileData is null) return null;

		var sel = _selection.Value;
		int x = (int)sel.X;
		int y = (int)sel.Y;
		int width = (int)sel.Width;
		int height = (int)sel.Height;

		var result = new byte[height, width];
		for (int py = 0; py < height; py++) {
			for (int px = 0; px < width; px++) {
				result[py, px] = TileData[y + py, x + px];
			}
		}
		return result;
	}

	/// <summary>
	/// Pastes pixel data into the selection or at position (0,0).
	/// </summary>
	public void PastePixels(byte[,] pixels) {
		if (TileData is null || pixels is null) return;

		int startX = _selection.HasValue ? (int)_selection.Value.X : 0;
		int startY = _selection.HasValue ? (int)_selection.Value.Y : 0;
		int height = pixels.GetLength(0);
		int width = pixels.GetLength(1);

		for (int py = 0; py < height && (startY + py) < 8; py++) {
			for (int px = 0; px < width && (startX + px) < 8; px++) {
				int x = startX + px;
				int y = startY + py;
				byte oldValue = TileData[y, x];
				byte newValue = pixels[py, px];
				if (oldValue != newValue) {
					TileData[y, x] = newValue;
					PixelChanged?.Invoke(this, new PixelChangedEventArgs(x, y, oldValue, newValue));
				}
			}
		}
		InvalidateVisual();
	}

	private void DrawPixelAt(Point position, bool eraseMode) {
		var tileData = TileData;
		if (tileData is null) return;

		int scale = Scale;
		int pixelX = (int)(position.X / scale);
		int pixelY = (int)(position.Y / scale);

		// Check bounds
		if (pixelX < 0 || pixelX >= 8 || pixelY < 0 || pixelY >= 8) return;

		// Skip if same position as last draw
		var currentPoint = new Point(pixelX, pixelY);
		if (currentPoint == _lastDrawPoint) return;
		_lastDrawPoint = currentPoint;

		// Determine color to draw
		byte colorIndex = eraseMode ? (byte)0 : (byte)SelectedColorIndex;
		byte oldValue = tileData[pixelY, pixelX];

		// Skip if no change
		if (oldValue == colorIndex) return;

		// Update the pixel
		tileData[pixelY, pixelX] = colorIndex;

		// Raise event
		PixelChanged?.Invoke(this, new PixelChangedEventArgs(pixelX, pixelY, oldValue, colorIndex));

		// Refresh display
		InvalidateVisual();
	}

	/// <summary>
	/// Performs a flood fill starting at the specified pixel.
	/// </summary>
	private void FloodFill(int startX, int startY, byte fillColor) {
		var tileData = TileData;
		if (tileData is null) return;

		byte targetColor = tileData[startY, startX];
		if (targetColor == fillColor) return;

		var stack = new Stack<(int x, int y)>();
		stack.Push((startX, startY));

		while (stack.Count > 0) {
			var (x, y) = stack.Pop();

			if (x < 0 || x >= 8 || y < 0 || y >= 8) continue;
			if (tileData[y, x] != targetColor) continue;

			byte oldValue = tileData[y, x];
			tileData[y, x] = fillColor;
			PixelChanged?.Invoke(this, new PixelChangedEventArgs(x, y, oldValue, fillColor));

			stack.Push((x + 1, y));
			stack.Push((x - 1, y));
			stack.Push((x, y + 1));
			stack.Push((x, y - 1));
		}

		InvalidateVisual();
	}

	/// <summary>
	/// Draws a line using Bresenham's algorithm.
	/// </summary>
	private void DrawLine(int x0, int y0, int x1, int y1, byte color) {
		var tileData = TileData;
		if (tileData is null) return;

		int dx = Math.Abs(x1 - x0);
		int dy = Math.Abs(y1 - y0);
		int sx = x0 < x1 ? 1 : -1;
		int sy = y0 < y1 ? 1 : -1;
		int err = dx - dy;

		while (true) {
			if (x0 >= 0 && x0 < 8 && y0 >= 0 && y0 < 8) {
				byte oldValue = tileData[y0, x0];
				if (oldValue != color) {
					tileData[y0, x0] = color;
					PixelChanged?.Invoke(this, new PixelChangedEventArgs(x0, y0, oldValue, color));
				}
			}

			if (x0 == x1 && y0 == y1) break;

			int e2 = 2 * err;
			if (e2 > -dy) {
				err -= dy;
				x0 += sx;
			}
			if (e2 < dx) {
				err += dx;
				y0 += sy;
			}
		}

		InvalidateVisual();
	}

	/// <summary>
	/// Draws a rectangle outline.
	/// </summary>
	private void DrawRectangle(int x0, int y0, int x1, int y1, byte color) {
		var tileData = TileData;
		if (tileData is null) return;

		int minX = Math.Min(x0, x1);
		int maxX = Math.Max(x0, x1);
		int minY = Math.Min(y0, y1);
		int maxY = Math.Max(y0, y1);

		// Draw horizontal lines
		for (int x = minX; x <= maxX; x++) {
			SetPixelIfValid(x, minY, color);
			SetPixelIfValid(x, maxY, color);
		}

		// Draw vertical lines
		for (int y = minY + 1; y < maxY; y++) {
			SetPixelIfValid(minX, y, color);
			SetPixelIfValid(maxX, y, color);
		}

		InvalidateVisual();
	}

	private void SetPixelIfValid(int x, int y, byte color) {
		var tileData = TileData;
		if (tileData is null || x < 0 || x >= 8 || y < 0 || y >= 8) return;

		byte oldValue = tileData[y, x];
		if (oldValue != color) {
			tileData[y, x] = color;
			PixelChanged?.Invoke(this, new PixelChangedEventArgs(x, y, oldValue, color));
		}
	}
}

/// <summary>
/// Event args for pixel change events.
/// </summary>
public class PixelChangedEventArgs : EventArgs {
	public int X { get; }
	public int Y { get; }
	public byte OldValue { get; }
	public byte NewValue { get; }

	public PixelChangedEventArgs(int x, int y, byte oldValue, byte newValue) {
		X = x;
		Y = y;
		OldValue = oldValue;
		NewValue = newValue;
	}
}

/// <summary>
/// Event args for color picker events.
/// </summary>
public class ColorPickedEventArgs : EventArgs {
	public int X { get; }
	public int Y { get; }
	public byte ColorIndex { get; }

	public ColorPickedEventArgs(int x, int y, byte colorIndex) {
		X = x;
		Y = y;
		ColorIndex = colorIndex;
	}
}

/// <summary>
/// Event args for pixel selection change events.
/// </summary>
public class PixelSelectionChangedEventArgs : EventArgs {
	/// <summary>
	/// The selection rectangle in pixel coordinates (0-7), or null if cleared.
	/// </summary>
	public Rect? Selection { get; }

	public PixelSelectionChangedEventArgs(Rect? selection) {
		Selection = selection;
	}
}
