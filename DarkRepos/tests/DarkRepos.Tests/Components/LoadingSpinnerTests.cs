using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class LoadingSpinnerTests : TestContext {
	[Fact]
	public void LoadingSpinner_HasSpinnerElement() {
		// Act
		var cut = RenderComponent<LoadingSpinner>();

		// Assert
		cut.Find(".loading-spinner").Should().NotBeNull();
	}

	[Fact]
	public void LoadingSpinner_HasLoadingStateClass() {
		// Act
		var cut = RenderComponent<LoadingSpinner>();

		// Assert
		cut.Find(".loading-state").Should().NotBeNull();
	}

	[Fact]
	public void LoadingSpinner_DisplaysCustomMessage() {
		// Arrange
		const string customMessage = "Loading games...";

		// Act
		var cut = RenderComponent<LoadingSpinner>(parameters => parameters
			.Add(p => p.Message, customMessage));

		// Assert
		cut.Markup.Should().Contain(customMessage);
	}

	[Fact]
	public void LoadingSpinner_OmitsMessageWhenNull() {
		// Act
		var cut = RenderComponent<LoadingSpinner>();

		// Assert
		// Should not have the loading-message paragraph when no message is set
		cut.FindAll(".loading-message").Should().BeEmpty();
	}
}
