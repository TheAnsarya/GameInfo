using Microsoft.AspNetCore.Components;

namespace DarkRepos.Web.Components.Shared;

/// <summary>
/// Base class for Callout component - Highlighted information box.
/// Usage: &lt;Callout Type="CalloutType.Warning" Title="Warning"&gt;Content&lt;/Callout&gt;
/// </summary>
public class CalloutBase : ComponentBase
{
	/// <summary>
	/// Callout type determines the styling and default icon.
	/// </summary>
	[Parameter]
	public CalloutType Type { get; set; } = CalloutType.Info;

	/// <summary>
	/// Optional title for the callout.
	/// </summary>
	[Parameter]
	public string? Title { get; set; }

	/// <summary>
	/// Simple text message. Use ChildContent for rich content.
	/// </summary>
	[Parameter]
	public string? Message { get; set; }

	/// <summary>
	/// Child content for rich content rendering.
	/// </summary>
	[Parameter]
	public RenderFragment? ChildContent { get; set; }

	/// <summary>
	/// Whether to show the icon.
	/// </summary>
	[Parameter]
	public bool ShowIcon { get; set; } = true;

	/// <summary>
	/// Custom icon to override the default type icon.
	/// </summary>
	[Parameter]
	public string? CustomIcon { get; set; }

	/// <summary>
	/// Whether the callout can be dismissed.
	/// </summary>
	[Parameter]
	public bool Dismissible { get; set; }

	/// <summary>
	/// Callback when the callout is dismissed.
	/// </summary>
	[Parameter]
	public EventCallback OnDismiss { get; set; }

	/// <summary>
	/// Additional CSS classes.
	/// </summary>
	[Parameter]
	public string? CssClass { get; set; }

	protected string TypeClass => Type switch
	{
		CalloutType.Note => "callout-note",
		CalloutType.Tip => "callout-tip",
		CalloutType.Warning => "callout-warning",
		CalloutType.Caution => "callout-caution",
		CalloutType.Important => "callout-important",
		CalloutType.Success => "callout-success",
		_ => "callout-info"
	};

	protected string IconText => CustomIcon ?? Type switch
	{
		CalloutType.Note => "📝",
		CalloutType.Tip => "💡",
		CalloutType.Warning => "⚠️",
		CalloutType.Caution => "🔴",
		CalloutType.Important => "❗",
		CalloutType.Success => "✅",
		_ => "ℹ️"
	};

	protected string AriaRole => Type switch
	{
		CalloutType.Warning or CalloutType.Caution => "alert",
		_ => "note"
	};

	protected async Task HandleDismiss()
	{
		await OnDismiss.InvokeAsync();
	}
}

/// <summary>
/// Callout type variants following GitHub-style admonitions.
/// </summary>
public enum CalloutType
{
	/// <summary>
	/// Generic information.
	/// </summary>
	Info,

	/// <summary>
	/// Additional notes.
	/// </summary>
	Note,

	/// <summary>
	/// Helpful tips.
	/// </summary>
	Tip,

	/// <summary>
	/// Warning messages.
	/// </summary>
	Warning,

	/// <summary>
	/// Critical/danger messages.
	/// </summary>
	Caution,

	/// <summary>
	/// Important information.
	/// </summary>
	Important,

	/// <summary>
	/// Success messages.
	/// </summary>
	Success
}
