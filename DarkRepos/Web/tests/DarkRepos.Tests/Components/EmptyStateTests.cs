using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class EmptyStateTests : TestContext {
	[Fact]
	public void EmptyState_DisplaysIcon() {
		// Arrange
		const string icon = "🎮";

		// Act
		var cut = RenderComponent<EmptyState>(parameters => parameters
			.Add(p => p.Icon, icon)
			.Add(p => p.Title, "No games"));

		// Assert
		cut.Markup.Should().Contain(icon);
	}

	[Fact]
	public void EmptyState_DisplaysTitle() {
		// Arrange
		const string title = "No Games Found";

		// Act
		var cut = RenderComponent<EmptyState>(parameters => parameters
			.Add(p => p.Icon, "📚")
			.Add(p => p.Title, title));

		// Assert
		cut.Find(".empty-title").TextContent.Trim().Should().Be(title);
	}

	[Fact]
	public void EmptyState_DisplaysMessage() {
		// Arrange
		const string message = "Try adjusting your search filters.";

		// Act
		var cut = RenderComponent<EmptyState>(parameters => parameters
			.Add(p => p.Icon, "📚")
			.Add(p => p.Title, "No Results")
			.Add(p => p.Message, message));

		// Assert
		cut.Markup.Should().Contain(message);
	}

	[Fact]
	public void EmptyState_RendersChildContent() {
		// Act
		var cut = RenderComponent<EmptyState>(parameters => parameters
			.Add(p => p.Icon, "📚")
			.Add(p => p.Title, "No Results")
			.AddChildContent("<button class=\"test-button\">Action</button>"));

		// Assert
		cut.Find(".test-button").Should().NotBeNull();
	}
}
