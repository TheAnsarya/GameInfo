using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Unit tests for Callout component.
/// </summary>
public class CalloutTests : TestContext {
	#region Basic Rendering Tests

	[Fact]
	public void Callout_RendersCorrectly() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test message"));

		// Assert
		cut.Find(".callout").Should().NotBeNull();
		cut.Find(".callout-body").TextContent.Should().Be("Test message");
	}

	[Fact]
	public void Callout_WithTitle_RendersTitle() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Title, "Important Notice")
			.Add(p => p.Message, "Content here"));

		// Assert
		cut.Find(".callout-title").TextContent.Should().Be("Important Notice");
	}

	[Fact]
	public void Callout_WithoutTitle_DoesNotRenderTitleElement() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Just content"));

		// Assert
		cut.FindAll(".callout-title").Should().BeEmpty();
	}

	[Fact]
	public void Callout_WithChildContent_RendersRichContent() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.AddChildContent("<strong>Bold text</strong> and more"));

		// Assert
		cut.Find(".callout-body").InnerHtml.Should().Contain("<strong>Bold text</strong>");
	}

	[Fact]
	public void Callout_ChildContentTakesPrecedenceOverMessage() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Simple message")
			.AddChildContent("<em>Rich content</em>"));

		// Assert
		cut.Find(".callout-body").InnerHtml.Should().Contain("<em>Rich content</em>");
		cut.Find(".callout-body").TextContent.Should().NotContain("Simple message");
	}

	#endregion

	#region Type Tests

	[Theory]
	[InlineData(CalloutType.Info, "callout-info")]
	[InlineData(CalloutType.Note, "callout-note")]
	[InlineData(CalloutType.Tip, "callout-tip")]
	[InlineData(CalloutType.Warning, "callout-warning")]
	[InlineData(CalloutType.Caution, "callout-caution")]
	[InlineData(CalloutType.Important, "callout-important")]
	[InlineData(CalloutType.Success, "callout-success")]
	public void Callout_WithType_HasCorrectClass(CalloutType type, string expectedClass) {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Type, type)
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".callout").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Callout_DefaultType_IsInfo() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".callout").ClassList.Should().Contain("callout-info");
	}

	#endregion

	#region Icon Tests

	[Fact]
	public void Callout_ShowsIconByDefault() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.FindAll(".callout-icon").Should().NotBeEmpty();
	}

	[Fact]
	public void Callout_WithShowIconFalse_HidesIcon() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.ShowIcon, false));

		// Assert
		cut.FindAll(".callout-icon").Should().BeEmpty();
	}

	[Theory]
	[InlineData(CalloutType.Info, "ℹ️")]
	[InlineData(CalloutType.Note, "📝")]
	[InlineData(CalloutType.Tip, "💡")]
	[InlineData(CalloutType.Warning, "⚠️")]
	[InlineData(CalloutType.Caution, "🔴")]
	[InlineData(CalloutType.Important, "❗")]
	[InlineData(CalloutType.Success, "✅")]
	public void Callout_WithType_ShowsCorrectDefaultIcon(CalloutType type, string expectedIcon) {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Type, type)
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".callout-icon").TextContent.Should().Be(expectedIcon);
	}

	[Fact]
	public void Callout_WithCustomIcon_OverridesDefault() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Type, CalloutType.Info)
			.Add(p => p.CustomIcon, "🎉")
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".callout-icon").TextContent.Should().Be("🎉");
	}

	[Fact]
	public void Callout_IconHasAriaHidden() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".callout-icon").GetAttribute("aria-hidden").Should().Be("true");
	}

	#endregion

	#region Accessibility Tests

	[Theory]
	[InlineData(CalloutType.Info, "note")]
	[InlineData(CalloutType.Note, "note")]
	[InlineData(CalloutType.Tip, "note")]
	[InlineData(CalloutType.Success, "note")]
	[InlineData(CalloutType.Warning, "alert")]
	[InlineData(CalloutType.Caution, "alert")]
	public void Callout_WithType_HasCorrectAriaRole(CalloutType type, string expectedRole) {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Type, type)
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".callout").GetAttribute("role").Should().Be(expectedRole);
	}

	#endregion

	#region Dismissible Tests

	[Fact]
	public void Callout_NotDismissibleByDefault() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.FindAll(".callout-dismiss").Should().BeEmpty();
	}

	[Fact]
	public void Callout_WhenDismissible_ShowsDismissButton() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.Dismissible, true));

		// Assert
		cut.Find(".callout-dismiss").Should().NotBeNull();
	}

	[Fact]
	public void Callout_DismissButton_HasAccessibilityAttributes() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.Dismissible, true));

		// Assert
		var button = cut.Find(".callout-dismiss");
		button.GetAttribute("aria-label").Should().Be("Dismiss");
		button.GetAttribute("title").Should().Be("Dismiss");
	}

	[Fact]
	public async Task Callout_WhenDismissClicked_InvokesCallback() {
		// Arrange
		var dismissed = false;
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.Dismissible, true)
			.Add(p => p.OnDismiss, () => dismissed = true));

		// Act
		await cut.Find(".callout-dismiss").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert
		dismissed.Should().BeTrue();
	}

	#endregion

	#region CSS Class Tests

	[Fact]
	public void Callout_WithCssClass_IncludesCustomClass() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.CssClass, "my-custom-class"));

		// Assert
		cut.Find(".callout").ClassList.Should().Contain("my-custom-class");
	}

	[Fact]
	public void Callout_CombinesAllClasses() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.Type, CalloutType.Warning)
			.Add(p => p.CssClass, "extra"));

		// Assert
		var classList = cut.Find(".callout").ClassList;
		classList.Should().Contain("callout");
		classList.Should().Contain("callout-warning");
		classList.Should().Contain("extra");
	}

	#endregion

	#region Structure Tests

	[Fact]
	public void Callout_HasCorrectStructure() {
		// Arrange & Act
		var cut = RenderComponent<Callout>(parameters => parameters
			.Add(p => p.Title, "Title")
			.Add(p => p.Message, "Message"));

		// Assert
		cut.Find(".callout-icon").Should().NotBeNull();
		cut.Find(".callout-content").Should().NotBeNull();
		cut.Find(".callout-title").Should().NotBeNull();
		cut.Find(".callout-body").Should().NotBeNull();
	}

	[Fact]
	public void Callout_EmptyContent_StillRenders() {
		// Arrange & Act
		var cut = RenderComponent<Callout>();

		// Assert
		cut.Find(".callout").Should().NotBeNull();
		cut.Find(".callout-body").Should().NotBeNull();
	}

	#endregion
}
