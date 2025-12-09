using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// A control that displays and allows editing of color palettes.
/// </summary>
public class PaletteEditor : Control {
	/// <summary>
	/// Defines the <see cref="Colors"/> property.
	/// </summary>
	public static readonly StyledProperty<Color[]?> ColorsProperty =
		AvaloniaProperty.Register<PaletteEditor, Color[]?>(nameof(Colors), TileCanvas.GetDefaultPalette());

	/// <summary>
	/// Defines the <see cref="SelectedColorIndex"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SelectedColorIndexProperty =
		AvaloniaProperty.Register<PaletteEditor, int>(nameof(SelectedColorIndex), 0);

	/// <summary>
	/// Defines the <see cref="SwatchSize"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SwatchSizeProperty =
		AvaloniaProperty.Register<PaletteEditor, int>(nameof(SwatchSize), 32);

	/// <summary>
	/// Defines the <see cref="SwatchSpacing"/> property.
	/// </summary>
	public static readonly StyledProperty<int> SwatchSpacingProperty =
		AvaloniaProperty.Register<PaletteEditor, int>(nameof(SwatchSpacing), 4);

	/// <summary>
	/// Defines the <see cref="IsReadOnly"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> IsReadOnlyProperty =
		AvaloniaProperty.Register<PaletteEditor, bool>(nameof(IsReadOnly), false);

	/// <summary>
	/// Occurs when a color in the palette is selected.
	/// </summary>
	public event EventHandler<ColorSelectedEventArgs>? ColorSelected;

	/// <summary>
	/// Occurs when a color in the palette is double-clicked for editing.
	/// </summary>
	public event EventHandler<ColorEditRequestedEventArgs>? ColorEditRequested;

	static PaletteEditor() {
		AffectsRender<PaletteEditor>(ColorsProperty, SelectedColorIndexProperty, SwatchSizeProperty, SwatchSpacingProperty);
		AffectsMeasure<PaletteEditor>(ColorsProperty, SwatchSizeProperty, SwatchSpacingProperty);
	}

	/// <summary>
	/// Gets or sets the palette colors.
	/// </summary>
	public Color[]? Colors {
		get => GetValue(ColorsProperty);
		set => SetValue(ColorsProperty, value);
	}

	/// <summary>
	/// Gets or sets the selected color index.
	/// </summary>
	public int SelectedColorIndex {
		get => GetValue(SelectedColorIndexProperty);
		set => SetValue(SelectedColorIndexProperty, value);
	}

	/// <summary>
	/// Gets or sets the size of each color swatch.
	/// </summary>
	public int SwatchSize {
		get => GetValue(SwatchSizeProperty);
		set => SetValue(SwatchSizeProperty, value);
	}

	/// <summary>
	/// Gets or sets the spacing between swatches.
	/// </summary>
	public int SwatchSpacing {
		get => GetValue(SwatchSpacingProperty);
		set => SetValue(SwatchSpacingProperty, value);
	}

	/// <summary>
	/// Gets or sets whether the palette is read-only.
	/// </summary>
	public bool IsReadOnly {
		get => GetValue(IsReadOnlyProperty);
		set => SetValue(IsReadOnlyProperty, value);
	}

	protected override Size MeasureOverride(Size availableSize) {
		var colors = Colors;
		if (colors is null || colors.Length == 0) {
			return new Size(0, 0);
		}

		int swatchSize = SwatchSize;
		int spacing = SwatchSpacing;
		int cellSize = swatchSize + spacing;

		// Arrange in a horizontal line
		return new Size((colors.Length * cellSize) - spacing, swatchSize);
	}

	public override void Render(DrawingContext context) {
		base.Render(context);

		var colors = Colors;
		if (colors is null || colors.Length == 0) {
			return;
		}

		int swatchSize = SwatchSize;
		int spacing = SwatchSpacing;
		int cellSize = swatchSize + spacing;

		// Draw checkerboard background for transparency indication
		var checkerBrush = CreateCheckerboardBrush();

		for (int i = 0; i < colors.Length; i++) {
			int x = i * cellSize;
			var swatchRect = new Rect(x, 0, swatchSize, swatchSize);

			// Draw checkerboard background
			context.FillRectangle(checkerBrush, swatchRect);

			// Draw color
			var colorBrush = new SolidColorBrush(colors[i]);
			context.FillRectangle(colorBrush, swatchRect);

			// Draw border
			var borderPen = new Pen(Brushes.Gray, 1);
			context.DrawRectangle(borderPen, swatchRect);

			// Draw selection highlight
			if (i == SelectedColorIndex) {
				var selectionPen = new Pen(Brushes.Yellow, 2);
				context.DrawRectangle(selectionPen, swatchRect.Deflate(2));
			}

			// Draw index label
			if (swatchSize >= 24) {
				var typeface = new Typeface("Consolas");
				var fontSize = Math.Max(8, swatchSize / 4);
				var text = new FormattedText(
					i.ToString(),
					System.Globalization.CultureInfo.InvariantCulture,
					FlowDirection.LeftToRight,
					typeface,
					fontSize,
					GetContrastBrush(colors[i]));

				var textPoint = new Point(
					x + ((swatchSize - text.Width) / 2),
					(swatchSize - text.Height) / 2);
				context.DrawText(text, textPoint);
			}
		}
	}

	protected override void OnPointerPressed(PointerPressedEventArgs e) {
		base.OnPointerPressed(e);

		var colors = Colors;
		if (colors is null || colors.Length == 0) {
			return;
		}

		var point = e.GetPosition(this);
		int swatchSize = SwatchSize;
		int spacing = SwatchSpacing;
		int cellSize = swatchSize + spacing;

		int index = (int)(point.X / cellSize);

		if (index >= 0 && index < colors.Length) {
			SelectedColorIndex = index;
			ColorSelected?.Invoke(this, new ColorSelectedEventArgs(index, colors[index]));
			InvalidateVisual();

			// Check for double-click to edit
			if (e.ClickCount == 2 && !IsReadOnly) {
				ColorEditRequested?.Invoke(this, new ColorEditRequestedEventArgs(index, colors[index]));
			}
		}
	}

	private static IBrush CreateCheckerboardBrush() {
		// Create a simple gray checkerboard pattern for transparency indication
		return new SolidColorBrush(Color.FromRgb(200, 200, 200));
	}

	private static IBrush GetContrastBrush(Color color) {
		// Calculate luminance and return contrasting color
		double luminance = (0.299 * color.R) + (0.587 * color.G) + (0.114 * color.B);
		return luminance > 128 ? Brushes.Black : Brushes.White;
	}
}

/// <summary>
/// Event args for color selection.
/// </summary>
public class ColorSelectedEventArgs : EventArgs {
	public int ColorIndex { get; }
	public Color Color { get; }

	public ColorSelectedEventArgs(int colorIndex, Color color) {
		ColorIndex = colorIndex;
		Color = color;
	}
}

/// <summary>
/// Event args for color edit requests.
/// </summary>
public class ColorEditRequestedEventArgs : EventArgs {
	public int ColorIndex { get; }
	public Color CurrentColor { get; }

	public ColorEditRequestedEventArgs(int colorIndex, Color currentColor) {
		ColorIndex = colorIndex;
		CurrentColor = currentColor;
	}
}
