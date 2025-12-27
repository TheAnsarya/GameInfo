using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;
using static DarkRepos.Web.Components.Shared.Alert;

namespace DarkRepos.Tests.Components;

public class AlertTests : TestContext
{
	[Fact]
	public void Alert_RendersMessage()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test message"));

		// Assert
		cut.Markup.Should().Contain("Test message");
	}

	[Fact]
	public void Alert_RendersTitle()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Title, "Test Title")
			.Add(p => p.Message, "Test message"));

		// Assert
		cut.Find(".alert-title").TextContent.Should().Be("Test Title");
	}

	[Fact]
	public void Alert_RendersChildContent()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.AddChildContent("<p>Custom content</p>"));

		// Assert
		cut.Markup.Should().Contain("<p>Custom content</p>");
	}

	[Fact]
	public void Alert_HasRoleAlert()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".alert").GetAttribute("role").Should().Be("alert");
	}

	[Fact]
	public void Alert_DefaultVariantIsInfo()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".alert").ClassList.Should().Contain("alert--info");
	}

	[Theory]
	[InlineData(AlertVariant.Info, "alert--info")]
	[InlineData(AlertVariant.Success, "alert--success")]
	[InlineData(AlertVariant.Warning, "alert--warning")]
	[InlineData(AlertVariant.Error, "alert--error")]
	public void Alert_AppliesVariantClass(AlertVariant variant, string expectedClass)
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.Variant, variant));

		// Assert
		cut.Find(".alert").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Alert_ShowsIcon_ByDefault()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.Find(".alert-icon").Should().NotBeNull();
	}

	[Fact]
	public void Alert_HidesIcon_WhenShowIconFalse()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.ShowIcon, false));

		// Assert
		cut.FindAll(".alert-icon").Should().BeEmpty();
	}

	[Fact]
	public void Alert_ShowsDismissButton_WhenDismissible()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.Dismissible, true));

		// Assert
		cut.Find(".alert-dismiss").Should().NotBeNull();
	}

	[Fact]
	public void Alert_HidesDismissButton_ByDefault()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test"));

		// Assert
		cut.FindAll(".alert-dismiss").Should().BeEmpty();
	}

	[Fact]
	public void Alert_DismissButton_InvokesCallback()
	{
		// Arrange
		var dismissed = false;

		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.Dismissible, true)
			.Add(p => p.OnDismiss, () => dismissed = true));

		cut.Find(".alert-dismiss").Click();

		// Assert
		dismissed.Should().BeTrue();
	}

	[Fact]
	public void Alert_AppliesCustomCssClass()
	{
		// Act
		var cut = RenderComponent<Alert>(parameters => parameters
			.Add(p => p.Message, "Test")
			.Add(p => p.CssClass, "my-custom-alert"));

		// Assert
		cut.Find(".alert").ClassList.Should().Contain("my-custom-alert");
	}
}
