using Avalonia;
using Avalonia.Controls;
using Avalonia.Media;
using Avalonia.Media.Imaging;
using Avalonia.Platform;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// A control that renders a single 8x8 tile with indexed colors.
/// </summary>
public class TileCanvas : Control {
	/// <summary>
	/// Defines the <see cref="TileData"/> property.
	/// </summary>
	public static readonly StyledProperty<byte[,]?> TileDataProperty =
		AvaloniaProperty.Register<TileCanvas, byte[,]?>(nameof(TileData));

	/// <summary>
	/// Defines the <see cref="Palette"/> property.
	/// </summary>
	public static readonly StyledProperty<Color[]?> PaletteProperty =
		AvaloniaProperty.Register<TileCanvas, Color[]?>(nameof(Palette), GetDefaultPalette());

	/// <summary>
	/// Defines the <see cref="Scale"/> property.
	/// </summary>
	public static readonly StyledProperty<int> ScaleProperty =
		AvaloniaProperty.Register<TileCanvas, int>(nameof(Scale), 2);

	/// <summary>
	/// Defines the <see cref="ShowGrid"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> ShowGridProperty =
		AvaloniaProperty.Register<TileCanvas, bool>(nameof(ShowGrid), false);

	/// <summary>
	/// Defines the <see cref="IsSelected"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> IsSelectedProperty =
		AvaloniaProperty.Register<TileCanvas, bool>(nameof(IsSelected), false);

	static TileCanvas() {
		AffectsRender<TileCanvas>(TileDataProperty, PaletteProperty, ScaleProperty, ShowGridProperty, IsSelectedProperty);
		AffectsMeasure<TileCanvas>(ScaleProperty);
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
	/// Gets or sets whether this tile is selected.
	/// </summary>
	public bool IsSelected {
		get => GetValue(IsSelectedProperty);
		set => SetValue(IsSelectedProperty, value);
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
		var palette = Palette ?? GetDefaultPalette();

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
		if (ShowGrid && scale >= 2) {
			var gridPen = new Pen(new SolidColorBrush(Color.FromArgb(64, 128, 128, 128)), 1);
			for (int i = 1; i < 8; i++) {
				context.DrawLine(gridPen, new Point(i * scale, 0), new Point(i * scale, size));
				context.DrawLine(gridPen, new Point(0, i * scale), new Point(size, i * scale));
			}
		}

		// Draw selection border
		if (IsSelected) {
			var selectionPen = new Pen(Brushes.Yellow, 2);
			context.DrawRectangle(selectionPen, bounds.Deflate(1));
		}
	}

	/// <summary>
	/// Gets the default NES-style 4-color grayscale palette.
	/// </summary>
	public static Color[] GetDefaultPalette() => [
		Color.FromRgb(0, 0, 0),       // Black
		Color.FromRgb(85, 85, 85),    // Dark gray
		Color.FromRgb(170, 170, 170), // Light gray
		Color.FromRgb(255, 255, 255)  // White
	];
}
