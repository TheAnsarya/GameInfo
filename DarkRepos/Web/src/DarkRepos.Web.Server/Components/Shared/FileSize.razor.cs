using Microsoft.AspNetCore.Components;

namespace DarkRepos.Web.Components.Shared;

/// <summary>
/// Base class for FileSize component - Display file sizes in human-readable format.
/// Usage: &lt;FileSize Bytes="@sizeInBytes" /&gt;
/// </summary>
public class FileSizeBase : ComponentBase
{
	private static readonly string[] DecimalUnits = new[] { "B", "KB", "MB", "GB", "TB", "PB", "EB" };
	private static readonly string[] BinaryUnits = new[] { "B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB" };
	private static readonly string[] AbbreviatedBinaryUnits = new[] { "B", "KB", "MB", "GB", "TB", "PB", "EB" };

	/// <summary>
	/// The file size in bytes.
	/// </summary>
	[Parameter, EditorRequired]
	public long Bytes { get; set; }

	/// <summary>
	/// Number of decimal places to display.
	/// </summary>
	[Parameter]
	public int Precision { get; set; } = 2;

	/// <summary>
	/// Use binary units (KiB, MiB) instead of decimal (KB, MB).
	/// </summary>
	[Parameter]
	public bool UseBinaryUnits { get; set; }

	/// <summary>
	/// Show file icon before the size.
	/// </summary>
	[Parameter]
	public bool ShowIcon { get; set; }

	/// <summary>
	/// Show exact byte count in tooltip.
	/// </summary>
	[Parameter]
	public bool ShowTooltip { get; set; } = true;

	/// <summary>
	/// Custom CSS class to apply.
	/// </summary>
	[Parameter]
	public string? CssClass { get; set; }

	/// <summary>
	/// Use abbreviated units (KB instead of KiB, etc.).
	/// </summary>
	[Parameter]
	public bool UseAbbreviatedUnits { get; set; } = true;

	protected int Divisor => UseBinaryUnits ? 1024 : 1000;

	protected string SizeClass => CssClass ?? GetSizeClass();

	protected string FormattedSize => GetFormattedSize();

	protected string TooltipText => GetTooltipText();

	protected string GetSizeClass()
	{
		return Bytes switch
		{
			< 1024 => "size-tiny",
			< 1024 * 1024 => "size-small",
			< 1024 * 1024 * 1024 => "size-medium",
			< 1024L * 1024 * 1024 * 1024 => "size-large",
			_ => "size-huge"
		};
	}

	protected string GetFormattedSize()
	{
		if (Bytes == 0)
			return "0 B";

		var absoluteBytes = Math.Abs(Bytes);
		var sign = Bytes < 0 ? "-" : "";

		if (absoluteBytes < Divisor)
			return $"{sign}{absoluteBytes} B";

		var units = GetUnits();
		var unitIndex = (int)Math.Floor(Math.Log(absoluteBytes) / Math.Log(Divisor));

		// Clamp to available units
		unitIndex = Math.Min(unitIndex, units.Length - 1);

		var size = absoluteBytes / Math.Pow(Divisor, unitIndex);
		var format = Precision > 0 ? $"N{Precision}" : "N0";

		return $"{sign}{size.ToString(format)} {units[unitIndex]}";
	}

	protected string[] GetUnits()
	{
		if (!UseBinaryUnits)
			return DecimalUnits;

		return UseAbbreviatedUnits ? AbbreviatedBinaryUnits : BinaryUnits;
	}

	protected string GetTooltipText()
	{
		if (!ShowTooltip)
			return string.Empty;

		return $"{Bytes:N0} bytes";
	}
}
