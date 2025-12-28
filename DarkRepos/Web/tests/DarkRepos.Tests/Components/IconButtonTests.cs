using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components.Web;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Unit tests for IconButton component.
/// </summary>
public class IconButtonTests : TestContext
{
	#region Basic Rendering Tests

	[Fact]
	public void IconButton_WithIcon_RendersCorrectly()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "🔍"));

		// Assert
		cut.Find("button").Should().NotBeNull();
		cut.Find(".icon").TextContent.Should().Be("🔍");
	}

	[Fact]
	public void IconButton_WithIconAndText_RendersBoth()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "📁")
			.Add(p => p.Text, "Open File"));

		// Assert
		cut.Find(".icon").TextContent.Should().Be("📁");
		cut.Find(".btn-text").TextContent.Should().Be("Open File");
	}

	[Fact]
	public void IconButton_WithoutText_DoesNotRenderTextSpan()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "❌"));

		// Assert
		cut.FindAll(".btn-text").Should().BeEmpty();
	}

	[Fact]
	public void IconButton_WithEmptyText_DoesNotRenderTextSpan()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "✓")
			.Add(p => p.Text, ""));

		// Assert
		cut.FindAll(".btn-text").Should().BeEmpty();
	}

	#endregion

	#region Variant Tests

	[Theory]
	[InlineData(IconButtonVariant.Default, "icon-btn-default")]
	[InlineData(IconButtonVariant.Primary, "icon-btn-primary")]
	[InlineData(IconButtonVariant.Secondary, "icon-btn-secondary")]
	[InlineData(IconButtonVariant.Success, "icon-btn-success")]
	[InlineData(IconButtonVariant.Danger, "icon-btn-danger")]
	[InlineData(IconButtonVariant.Warning, "icon-btn-warning")]
	[InlineData(IconButtonVariant.Info, "icon-btn-info")]
	[InlineData(IconButtonVariant.Ghost, "icon-btn-ghost")]
	public void IconButton_WithVariant_HasCorrectClass(IconButtonVariant variant, string expectedClass)
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.Variant, variant));

		// Assert
		cut.Find("button").ClassList.Should().Contain(expectedClass);
	}

	#endregion

	#region Size Tests

	[Theory]
	[InlineData(IconButtonSize.Small, "icon-btn-sm")]
	[InlineData(IconButtonSize.Medium, "icon-btn-md")]
	[InlineData(IconButtonSize.Large, "icon-btn-lg")]
	public void IconButton_WithSize_HasCorrectClass(IconButtonSize size, string expectedClass)
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.Size, size));

		// Assert
		cut.Find("button").ClassList.Should().Contain(expectedClass);
	}

	#endregion

	#region Button Type Tests

	[Fact]
	public void IconButton_DefaultType_IsButton()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★"));

		// Assert
		cut.Find("button").GetAttribute("type").Should().Be("button");
	}

	[Theory]
	[InlineData("button")]
	[InlineData("submit")]
	[InlineData("reset")]
	public void IconButton_WithType_SetsTypeAttribute(string buttonType)
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.ButtonType, buttonType));

		// Assert
		cut.Find("button").GetAttribute("type").Should().Be(buttonType);
	}

	#endregion

	#region Disabled Tests

	[Fact]
	public void IconButton_WhenDisabled_HasDisabledAttribute()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.Disabled, true));

		// Assert
		cut.Find("button").HasAttribute("disabled").Should().BeTrue();
	}

	[Fact]
	public void IconButton_WhenNotDisabled_DoesNotHaveDisabledAttribute()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.Disabled, false));

		// Assert
		cut.Find("button").HasAttribute("disabled").Should().BeFalse();
	}

	[Fact]
	public async Task IconButton_WhenDisabled_ClickDoesNotTrigger()
	{
		// Arrange
		var clicked = false;
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.Disabled, true)
			.Add(p => p.OnClick, (MouseEventArgs _) => clicked = true));

		// Act
		await cut.Find("button").ClickAsync(new MouseEventArgs());

		// Assert
		clicked.Should().BeFalse();
	}

	#endregion

	#region Tooltip Tests

	[Fact]
	public void IconButton_WithTooltip_SetsTitleAttribute()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "💾")
			.Add(p => p.Tooltip, "Save file"));

		// Assert
		cut.Find("button").GetAttribute("title").Should().Be("Save file");
	}

	[Fact]
	public void IconButton_WithoutTooltip_NoTitleAttribute()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★"));

		// Assert
		cut.Find("button").GetAttribute("title").Should().BeNullOrEmpty();
	}

	#endregion

	#region CSS Class Tests

	[Fact]
	public void IconButton_AlwaysHasBaseClass()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★"));

		// Assert
		cut.Find("button").ClassList.Should().Contain("icon-button");
	}

	[Fact]
	public void IconButton_WithCssClass_IncludesCustomClass()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.CssClass, "my-custom-class"));

		// Assert
		cut.Find("button").ClassList.Should().Contain("my-custom-class");
	}

	[Fact]
	public void IconButton_WithMultipleClasses_IncludesAll()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.Variant, IconButtonVariant.Primary)
			.Add(p => p.Size, IconButtonSize.Large)
			.Add(p => p.CssClass, "extra-class"));

		// Assert
		var classList = cut.Find("button").ClassList;
		classList.Should().Contain("icon-button");
		classList.Should().Contain("icon-btn-primary");
		classList.Should().Contain("icon-btn-lg");
		classList.Should().Contain("extra-class");
	}

	#endregion

	#region Click Event Tests

	[Fact]
	public async Task IconButton_WhenClicked_TriggersOnClick()
	{
		// Arrange
		var clicked = false;
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.OnClick, (MouseEventArgs _) => clicked = true));

		// Act
		await cut.Find("button").ClickAsync(new MouseEventArgs());

		// Assert
		clicked.Should().BeTrue();
	}

	[Fact]
	public async Task IconButton_WhenClicked_PassesEventArgs()
	{
		// Arrange
		MouseEventArgs? receivedArgs = null;
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.Add(p => p.OnClick, (MouseEventArgs args) => receivedArgs = args));

		// Act
		var clickArgs = new MouseEventArgs { ClientX = 100, ClientY = 200 };
		await cut.Find("button").ClickAsync(clickArgs);

		// Assert
		receivedArgs.Should().NotBeNull();
		receivedArgs!.ClientX.Should().Be(100);
		receivedArgs.ClientY.Should().Be(200);
	}

	#endregion

	#region Additional Attributes Tests

	[Fact]
	public void IconButton_WithAdditionalAttributes_PassesThrough()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★")
			.AddUnmatched("data-testid", "my-button")
			.AddUnmatched("aria-label", "Star button"));

		// Assert
		cut.Find("button").GetAttribute("data-testid").Should().Be("my-button");
		cut.Find("button").GetAttribute("aria-label").Should().Be("Star button");
	}

	#endregion

	#region Accessibility Tests

	[Fact]
	public void IconButton_IconHasAriaHidden()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "★"));

		// Assert
		cut.Find(".icon").GetAttribute("aria-hidden").Should().Be("true");
	}

	[Fact]
	public void IconButton_IconOnlyWithTooltip_IsAccessible()
	{
		// Arrange & Act
		var cut = RenderComponent<IconButton>(parameters => parameters
			.Add(p => p.Icon, "🔍")
			.Add(p => p.Tooltip, "Search"));

		// Assert - title provides accessible name for icon-only buttons
		cut.Find("button").GetAttribute("title").Should().Be("Search");
	}

	#endregion
}
