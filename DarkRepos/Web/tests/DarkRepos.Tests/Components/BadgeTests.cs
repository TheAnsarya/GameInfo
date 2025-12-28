using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;
using static DarkRepos.Web.Components.Shared.Badge;

namespace DarkRepos.Tests.Components;

public class BadgeTests : TestContext {
	[Fact]
	public void Badge_RendersText() {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Test Badge"));

		// Assert
		cut.Markup.Should().Contain("Test Badge");
	}

	[Fact]
	public void Badge_RendersChildContent() {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.AddChildContent("<strong>Custom</strong>"));

		// Assert
		cut.Markup.Should().Contain("<strong>Custom</strong>");
	}

	[Fact]
	public void Badge_HasDefaultVariantClass() {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Default"));

		// Assert
		cut.Find(".badge").ClassList.Should().Contain("badge--default");
	}

	[Theory]
	[InlineData(BadgeVariant.Primary, "badge--primary")]
	[InlineData(BadgeVariant.Secondary, "badge--secondary")]
	[InlineData(BadgeVariant.Success, "badge--success")]
	[InlineData(BadgeVariant.Warning, "badge--warning")]
	[InlineData(BadgeVariant.Error, "badge--error")]
	[InlineData(BadgeVariant.Info, "badge--info")]
	public void Badge_AppliesVariantClass(BadgeVariant variant, string expectedClass) {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Test")
			.Add(p => p.Variant, variant));

		// Assert
		cut.Find(".badge").ClassList.Should().Contain(expectedClass);
	}

	[Theory]
	[InlineData(BadgeSize.Small, "badge--small")]
	[InlineData(BadgeSize.Large, "badge--large")]
	public void Badge_AppliesSizeClass(BadgeSize size, string expectedClass) {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Test")
			.Add(p => p.Size, size));

		// Assert
		cut.Find(".badge").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Badge_MediumSizeHasNoSizeClass() {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Test")
			.Add(p => p.Size, BadgeSize.Medium));

		// Assert
		cut.Find(".badge").ClassList.Should().NotContain("badge--medium");
		cut.Find(".badge").ClassList.Should().NotContain("badge--small");
		cut.Find(".badge").ClassList.Should().NotContain("badge--large");
	}

	[Fact]
	public void Badge_ShowsDismissButton_WhenDismissible() {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Dismissible")
			.Add(p => p.Dismissible, true));

		// Assert
		cut.Find(".badge-dismiss").Should().NotBeNull();
	}

	[Fact]
	public void Badge_DismissButton_InvokesCallback() {
		// Arrange
		var dismissed = false;

		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Dismissible")
			.Add(p => p.Dismissible, true)
			.Add(p => p.OnDismiss, () => dismissed = true));

		cut.Find(".badge-dismiss").Click();

		// Assert
		dismissed.Should().BeTrue();
	}

	[Fact]
	public void Badge_AppliesCustomCssClass() {
		// Act
		var cut = RenderComponent<Badge>(parameters => parameters
			.Add(p => p.Text, "Custom")
			.Add(p => p.CssClass, "my-custom-class"));

		// Assert
		cut.Find(".badge").ClassList.Should().Contain("my-custom-class");
	}
}
