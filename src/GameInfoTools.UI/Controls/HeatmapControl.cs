using System.Collections.ObjectModel;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Media;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// A custom control that renders a graphical heatmap with colored cells.
/// Green = Code, Yellow = Data, Gray = Unknown/Uncovered.
/// </summary>
public class HeatmapControl : Control {
	private const int CellSize = 8;
	private const int CellSpacing = 1;

	/// <summary>
	/// The heatmap cells to display.
	/// </summary>
	public static readonly StyledProperty<ObservableCollection<HeatmapCellInfo>?> CellsProperty =
		AvaloniaProperty.Register<HeatmapControl, ObservableCollection<HeatmapCellInfo>?>(nameof(Cells));

	/// <summary>
	/// Number of columns in the heatmap.
	/// </summary>
	public static readonly StyledProperty<int> ColumnsProperty =
		AvaloniaProperty.Register<HeatmapControl, int>(nameof(Columns), 64);

	/// <summary>
	/// Gets or sets the heatmap cells.
	/// </summary>
	public ObservableCollection<HeatmapCellInfo>? Cells {
		get => GetValue(CellsProperty);
		set => SetValue(CellsProperty, value);
	}

	/// <summary>
	/// Gets or sets the number of columns.
	/// </summary>
	public int Columns {
		get => GetValue(ColumnsProperty);
		set => SetValue(ColumnsProperty, value);
	}

	// Color palette
	private static readonly Color CodeColor = Color.FromRgb(0x4c, 0xaf, 0x50);      // Green
	private static readonly Color DataColor = Color.FromRgb(0xff, 0xc1, 0x07);      // Yellow/Amber
	private static readonly Color UnknownColor = Color.FromRgb(0x42, 0x42, 0x42);   // Dark gray
	private static readonly Color BackgroundColor = Color.FromRgb(0x1e, 0x1e, 0x1e); // Background

	static HeatmapControl() {
		AffectsRender<HeatmapControl>(CellsProperty, ColumnsProperty);
		AffectsMeasure<HeatmapControl>(CellsProperty, ColumnsProperty);
	}

	protected override Size MeasureOverride(Size availableSize) {
		var cells = Cells;
		if (cells is null || cells.Count == 0)
			return new Size(0, 0);

		var columns = Math.Max(1, Columns);
		var rows = (cells.Count + columns - 1) / columns;
		var width = columns * (CellSize + CellSpacing);
		var height = rows * (CellSize + CellSpacing);

		return new Size(width, height);
	}

	public override void Render(DrawingContext context) {
		base.Render(context);

		var cells = Cells;
		if (cells is null || cells.Count == 0)
			return;

		var columns = Math.Max(1, Columns);

		// Draw background
		context.FillRectangle(new SolidColorBrush(BackgroundColor), new Rect(0, 0, Bounds.Width, Bounds.Height));

		for (int i = 0; i < cells.Count; i++) {
			var cell = cells[i];
			var col = i % columns;
			var row = i / columns;

			var x = col * (CellSize + CellSpacing);
			var y = row * (CellSize + CellSpacing);

			// Determine cell color based on type and intensity
			var color = GetCellColor(cell);
			var brush = new SolidColorBrush(color);

			context.FillRectangle(brush, new Rect(x, y, CellSize, CellSize));
		}
	}

	private static Color GetCellColor(HeatmapCellInfo cell) {
		if (cell.Intensity < 0.01) {
			return UnknownColor;
		}

		// Base color depends on content type
		Color baseColor;
		if (cell.HasCode && cell.HasData) {
			// Mixed: blend green and yellow
			baseColor = Color.FromRgb(0x8b, 0xc3, 0x4a); // Lime green
		} else {
			baseColor = cell.HasCode ? CodeColor : cell.HasData ? DataColor : UnknownColor;
		}

		// Adjust brightness based on intensity
		var intensity = Math.Clamp(cell.Intensity, 0.0, 1.0);
		var r = (byte)(baseColor.R * (0.3 + (0.7 * intensity)));
		var g = (byte)(baseColor.G * (0.3 + (0.7 * intensity)));
		var b = (byte)(baseColor.B * (0.3 + (0.7 * intensity)));

		return Color.FromRgb(r, g, b);
	}
}
