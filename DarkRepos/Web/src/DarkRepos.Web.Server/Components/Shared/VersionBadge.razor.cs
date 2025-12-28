using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;

namespace DarkRepos.Web.Components.Shared;

/// <summary>
/// Base class for VersionBadge component - Display version numbers with styling.
/// Usage: &lt;VersionBadge Version="1.0.0" Type="Release" /&gt;
/// </summary>
public class VersionBadgeBase : ComponentBase
{
	[Inject]
	private IJSRuntime? JSRuntime { get; set; }

	/// <summary>
	/// The version string to display.
	/// </summary>
	[Parameter, EditorRequired]
	public string Version { get; set; } = string.Empty;

	/// <summary>
	/// The type of version (affects styling).
	/// </summary>
	[Parameter]
	public VersionType Type { get; set; } = VersionType.Default;

	/// <summary>
	/// Size of the badge.
	/// </summary>
	[Parameter]
	public VersionBadgeSize Size { get; set; } = VersionBadgeSize.Medium;

	/// <summary>
	/// Show the version prefix (e.g., "v").
	/// </summary>
	[Parameter]
	public bool ShowPrefix { get; set; } = true;

	/// <summary>
	/// The prefix text to show before the version.
	/// </summary>
	[Parameter]
	public string Prefix { get; set; } = "v";

	/// <summary>
	/// Show a copy-to-clipboard button.
	/// </summary>
	[Parameter]
	public bool ShowCopyButton { get; set; }

	/// <summary>
	/// Custom tooltip text. If not set, shows the full version.
	/// </summary>
	[Parameter]
	public string? Tooltip { get; set; }

	/// <summary>
	/// Additional CSS classes.
	/// </summary>
	[Parameter]
	public string? CssClass { get; set; }

	/// <summary>
	/// Release date for the version (optional).
	/// </summary>
	[Parameter]
	public DateTime? ReleaseDate { get; set; }

	protected string FormattedVersion => Version;

	protected string TooltipText
	{
		get
		{
			if (!string.IsNullOrEmpty(Tooltip))
				return Tooltip;

			var text = $"Version {Version}";
			if (ReleaseDate.HasValue)
				text += $" (Released: {ReleaseDate.Value:yyyy-MM-dd})";

			return text;
		}
	}

	protected string TypeClass => Type switch
	{
		VersionType.Release => "version-release",
		VersionType.Beta => "version-beta",
		VersionType.Alpha => "version-alpha",
		VersionType.Preview => "version-preview",
		VersionType.Stable => "version-stable",
		VersionType.LTS => "version-lts",
		VersionType.Deprecated => "version-deprecated",
		_ => "version-default"
	};

	protected string SizeClass => Size switch
	{
		VersionBadgeSize.Small => "badge-sm",
		VersionBadgeSize.Large => "badge-lg",
		_ => "badge-md"
	};

	protected async Task CopyToClipboard()
	{
		if (JSRuntime is not null)
		{
			var textToCopy = ShowPrefix ? $"{Prefix}{Version}" : Version;
			await JSRuntime.InvokeVoidAsync("navigator.clipboard.writeText", textToCopy);
		}
	}
}

/// <summary>
/// Types of version releases.
/// </summary>
public enum VersionType
{
	Default,
	Release,
	Beta,
	Alpha,
	Preview,
	Stable,
	LTS,
	Deprecated
}

/// <summary>
/// Badge size options for VersionBadge.
/// </summary>
public enum VersionBadgeSize
{
	Small,
	Medium,
	Large
}
