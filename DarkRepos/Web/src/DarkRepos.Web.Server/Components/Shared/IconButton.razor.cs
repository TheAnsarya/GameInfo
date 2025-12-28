using Microsoft.AspNetCore.Components;

namespace DarkRepos.Web.Components.Shared;

/// <summary>
/// Base class for IconButton component - Button with icon support.
/// Usage: &lt;IconButton Icon="🔍" OnClick="HandleSearch" /&gt;
/// </summary>
public class IconButtonBase : ComponentBase
{
	/// <summary>
	/// The icon to display (emoji or text).
	/// </summary>
	[Parameter, EditorRequired]
	public string Icon { get; set; } = string.Empty;

	/// <summary>
	/// Optional text to display next to the icon.
	/// </summary>
	[Parameter]
	public string? Text { get; set; }

	/// <summary>
	/// Click event callback.
	/// </summary>
	[Parameter]
	public EventCallback<Microsoft.AspNetCore.Components.Web.MouseEventArgs> OnClick { get; set; }

	/// <summary>
	/// Button style variant.
	/// </summary>
	[Parameter]
	public IconButtonVariant Variant { get; set; } = IconButtonVariant.Default;

	/// <summary>
	/// Button size.
	/// </summary>
	[Parameter]
	public IconButtonSize Size { get; set; } = IconButtonSize.Medium;

	/// <summary>
	/// Tooltip text for the button.
	/// </summary>
	[Parameter]
	public string? Tooltip { get; set; }

	/// <summary>
	/// Whether the button is disabled.
	/// </summary>
	[Parameter]
	public bool Disabled { get; set; }

	/// <summary>
	/// Button type (button, submit, reset).
	/// </summary>
	[Parameter]
	public string ButtonType { get; set; } = "button";

	/// <summary>
	/// Additional CSS classes.
	/// </summary>
	[Parameter]
	public string? CssClass { get; set; }

	/// <summary>
	/// Additional HTML attributes to pass through.
	/// </summary>
	[Parameter(CaptureUnmatchedValues = true)]
	public Dictionary<string, object>? AdditionalAttributes { get; set; }

	protected string VariantClass => Variant switch
	{
		IconButtonVariant.Primary => "icon-btn-primary",
		IconButtonVariant.Secondary => "icon-btn-secondary",
		IconButtonVariant.Success => "icon-btn-success",
		IconButtonVariant.Danger => "icon-btn-danger",
		IconButtonVariant.Warning => "icon-btn-warning",
		IconButtonVariant.Info => "icon-btn-info",
		IconButtonVariant.Ghost => "icon-btn-ghost",
		_ => "icon-btn-default"
	};

	protected string SizeClass => Size switch
	{
		IconButtonSize.Small => "icon-btn-sm",
		IconButtonSize.Large => "icon-btn-lg",
		_ => "icon-btn-md"
	};

	protected async Task HandleClick(Microsoft.AspNetCore.Components.Web.MouseEventArgs args)
	{
		if (!Disabled)
		{
			await OnClick.InvokeAsync(args);
		}
	}
}

/// <summary>
/// Button style variants.
/// </summary>
public enum IconButtonVariant
{
	Default,
	Primary,
	Secondary,
	Success,
	Danger,
	Warning,
	Info,
	Ghost
}

/// <summary>
/// Button size options.
/// </summary>
public enum IconButtonSize
{
	Small,
	Medium,
	Large
}
