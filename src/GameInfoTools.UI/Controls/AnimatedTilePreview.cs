using Avalonia;
using Avalonia.Controls;
using Avalonia.Media;
using Avalonia.Threading;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// A control that displays animated tile sequences.
/// </summary>
public class AnimatedTilePreview : Control {
	private readonly DispatcherTimer _animationTimer;
	private int _currentFrameIndex;

	/// <summary>
	/// Defines the <see cref="Frames"/> property.
	/// </summary>
	public static readonly StyledProperty<IReadOnlyList<byte[,]>?> FramesProperty =
		AvaloniaProperty.Register<AnimatedTilePreview, IReadOnlyList<byte[,]>?>(nameof(Frames));

	/// <summary>
	/// Defines the <see cref="Palette"/> property.
	/// </summary>
	public static readonly StyledProperty<Color[]?> PaletteProperty =
		AvaloniaProperty.Register<AnimatedTilePreview, Color[]?>(nameof(Palette), TileCanvas.GetDefaultPalette());

	/// <summary>
	/// Defines the <see cref="Scale"/> property.
	/// </summary>
	public static readonly StyledProperty<int> ScaleProperty =
		AvaloniaProperty.Register<AnimatedTilePreview, int>(nameof(Scale), 4);

	/// <summary>
	/// Defines the <see cref="FrameDelayMs"/> property.
	/// </summary>
	public static readonly StyledProperty<int> FrameDelayMsProperty =
		AvaloniaProperty.Register<AnimatedTilePreview, int>(nameof(FrameDelayMs), 200);

	/// <summary>
	/// Defines the <see cref="IsPlaying"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> IsPlayingProperty =
		AvaloniaProperty.Register<AnimatedTilePreview, bool>(nameof(IsPlaying), false);

	/// <summary>
	/// Defines the <see cref="ShowGrid"/> property.
	/// </summary>
	public static readonly StyledProperty<bool> ShowGridProperty =
		AvaloniaProperty.Register<AnimatedTilePreview, bool>(nameof(ShowGrid), false);

	/// <summary>
	/// Defines the <see cref="CurrentFrameIndex"/> property.
	/// </summary>
	public static readonly StyledProperty<int> CurrentFrameIndexProperty =
		AvaloniaProperty.Register<AnimatedTilePreview, int>(nameof(CurrentFrameIndex), 0);

	static AnimatedTilePreview() {
		AffectsRender<AnimatedTilePreview>(FramesProperty, PaletteProperty, ScaleProperty, ShowGridProperty, CurrentFrameIndexProperty);
		AffectsMeasure<AnimatedTilePreview>(ScaleProperty);
	}

	public AnimatedTilePreview() {
		_animationTimer = new DispatcherTimer {
			Interval = TimeSpan.FromMilliseconds(200)
		};
		_animationTimer.Tick += OnAnimationTick;
	}

	/// <summary>
	/// Gets or sets the animation frames (list of tile data).
	/// </summary>
	public IReadOnlyList<byte[,]>? Frames {
		get => GetValue(FramesProperty);
		set => SetValue(FramesProperty, value);
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
	/// Gets or sets the delay between frames in milliseconds.
	/// </summary>
	public int FrameDelayMs {
		get => GetValue(FrameDelayMsProperty);
		set => SetValue(FrameDelayMsProperty, value);
	}

	/// <summary>
	/// Gets or sets whether the animation is playing.
	/// </summary>
	public bool IsPlaying {
		get => GetValue(IsPlayingProperty);
		set => SetValue(IsPlayingProperty, value);
	}

	/// <summary>
	/// Gets or sets whether to show a pixel grid.
	/// </summary>
	public bool ShowGrid {
		get => GetValue(ShowGridProperty);
		set => SetValue(ShowGridProperty, value);
	}

	/// <summary>
	/// Gets or sets the current frame index.
	/// </summary>
	public int CurrentFrameIndex {
		get => GetValue(CurrentFrameIndexProperty);
		set => SetValue(CurrentFrameIndexProperty, value);
	}

	protected override void OnPropertyChanged(AvaloniaPropertyChangedEventArgs change) {
		base.OnPropertyChanged(change);

		if (change.Property == IsPlayingProperty) {
			if (IsPlaying) {
				_animationTimer.Interval = TimeSpan.FromMilliseconds(FrameDelayMs);
				_animationTimer.Start();
			} else {
				_animationTimer.Stop();
			}
		} else if (change.Property == FrameDelayMsProperty) {
			_animationTimer.Interval = TimeSpan.FromMilliseconds(FrameDelayMs);
		} else if (change.Property == FramesProperty) {
			_currentFrameIndex = 0;
			CurrentFrameIndex = 0;
		}
	}

	private void OnAnimationTick(object? sender, EventArgs e) {
		var frames = Frames;
		if (frames is null || frames.Count == 0) return;

		_currentFrameIndex = (_currentFrameIndex + 1) % frames.Count;
		CurrentFrameIndex = _currentFrameIndex;
		InvalidateVisual();
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

		var frames = Frames;
		var palette = Palette ?? TileCanvas.GetDefaultPalette();

		if (frames is null || frames.Count == 0) {
			// Draw "no frames" indicator
			var text = new FormattedText(
				"?",
				System.Globalization.CultureInfo.InvariantCulture,
				FlowDirection.LeftToRight,
				new Typeface("Consolas"),
				size / 2,
				Brushes.Gray);
			context.DrawText(text, new Point((size - text.Width) / 2, (size - text.Height) / 2));
			return;
		}

		// Get current frame
		int frameIndex = Math.Clamp(_currentFrameIndex, 0, frames.Count - 1);
		var tileData = frames[frameIndex];

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

		// Draw border
		var borderPen = new Pen(Brushes.Gray, 1);
		context.DrawRectangle(borderPen, bounds);
	}

	protected override void OnDetachedFromVisualTree(VisualTreeAttachmentEventArgs e) {
		base.OnDetachedFromVisualTree(e);
		_animationTimer.Stop();
	}
}
