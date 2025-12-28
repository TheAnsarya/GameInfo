using Microsoft.AspNetCore.Components;

namespace DarkRepos.Web.Components.Shared;

/// <summary>
/// Base class for ProgressCircle component - Circular progress indicator.
/// Usage: &lt;ProgressCircle Value="75" /&gt;
/// </summary>
public class ProgressCircleBase : ComponentBase
{
	/// <summary>
	/// Progress value (0-100).
	/// </summary>
	[Parameter]
	public double Value { get; set; }

	/// <summary>
	/// Whether to show the percentage label in the center.
	/// </summary>
	[Parameter]
	public bool ShowLabel { get; set; } = true;

	/// <summary>
	/// Custom label text. If null, shows percentage.
	/// </summary>
	[Parameter]
	public string? CustomLabel { get; set; }

	/// <summary>
	/// Circle size.
	/// </summary>
	[Parameter]
	public ProgressCircleSize Size { get; set; } = ProgressCircleSize.Medium;

	/// <summary>
	/// Circle color variant.
	/// </summary>
	[Parameter]
	public ProgressCircleColor Color { get; set; } = ProgressCircleColor.Primary;

	/// <summary>
	/// Additional CSS classes.
	/// </summary>
	[Parameter]
	public string? CssClass { get; set; }

	/// <summary>
	/// Custom tooltip text. If null, uses percentage.
	/// </summary>
	[Parameter]
	public string? Tooltip { get; set; }

	/// <summary>
	/// Thickness of the progress circle stroke.
	/// </summary>
	[Parameter]
	public ProgressCircleThickness Thickness { get; set; } = ProgressCircleThickness.Normal;

	/// <summary>
	/// Whether to animate the progress on mount.
	/// </summary>
	[Parameter]
	public bool Animated { get; set; } = true;

	protected double NormalizedValue => Math.Clamp(Value, 0, 100);

	protected string StrokeDasharray => $"{NormalizedValue}, 100";

	protected string FormattedLabel => CustomLabel ?? $"{Math.Round(NormalizedValue)}%";

	protected string TooltipText => Tooltip ?? $"{Math.Round(NormalizedValue)}% complete";

	protected string SizeClass => Size switch
	{
		ProgressCircleSize.Small => "progress-circle-sm",
		ProgressCircleSize.Large => "progress-circle-lg",
		ProgressCircleSize.ExtraLarge => "progress-circle-xl",
		_ => "progress-circle-md"
	};

	protected string ColorClass => Color switch
	{
		ProgressCircleColor.Success => "circle-success",
		ProgressCircleColor.Warning => "circle-warning",
		ProgressCircleColor.Danger => "circle-danger",
		ProgressCircleColor.Info => "circle-info",
		ProgressCircleColor.Secondary => "circle-secondary",
		_ => "circle-primary"
	};

	protected string ThicknessClass => Thickness switch
	{
		ProgressCircleThickness.Thin => "thickness-thin",
		ProgressCircleThickness.Thick => "thickness-thick",
		_ => "thickness-normal"
	};
}

/// <summary>
/// Size options for progress circle.
/// </summary>
public enum ProgressCircleSize
{
	Small,
	Medium,
	Large,
	ExtraLarge
}

/// <summary>
/// Color variants for progress circle.
/// </summary>
public enum ProgressCircleColor
{
	Primary,
	Success,
	Warning,
	Danger,
	Info,
	Secondary
}

/// <summary>
/// Stroke thickness options.
/// </summary>
public enum ProgressCircleThickness
{
	Thin,
	Normal,
	Thick
}
