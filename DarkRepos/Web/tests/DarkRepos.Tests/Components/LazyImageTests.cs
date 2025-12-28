using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Xunit;

namespace DarkRepos.Web.Tests.Components;

/// <summary>
/// Unit tests for the LazyImage component.
/// </summary>
public class LazyImageTests : TestContext {
	[Fact]
	public void LazyImage_RendersContainer() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/images/test.png");
			p.Add(l => l.Alt, "Test image");
		});

		// Assert
		cut.Find(".lazy-image-container").Should().NotBeNull();
	}

	[Fact]
	public void LazyImage_RendersImgElement_WithCorrectSrc() {
		// Arrange
		const string src = "/images/game-cover.png";
		const string alt = "Game Cover";

		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, src);
			p.Add(l => l.Alt, alt);
		});

		// Assert
		var img = cut.Find("img.lazy-image");
		img.GetAttribute("src").Should().Be(src);
		img.GetAttribute("alt").Should().Be(alt);
	}

	[Fact]
	public void LazyImage_HasLazyLoadingAttribute() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
		});

		// Assert
		var img = cut.Find("img");
		img.GetAttribute("loading").Should().Be("lazy");
		img.GetAttribute("decoding").Should().Be("async");
	}

	[Fact]
	public void LazyImage_ShowsPlaceholder_WhenColorProvided() {
		// Arrange
		const string color = "#ff0000";

		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.PlaceholderColor, color);
		});

		// Assert
		var placeholder = cut.Find(".lazy-image-placeholder");
		placeholder.GetAttribute("style").Should().Contain(color);
	}

	[Fact]
	public void LazyImage_DoesNotShowPlaceholder_WhenColorIsNull() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.PlaceholderColor, null);
		});

		// Assert
		cut.FindAll(".lazy-image-placeholder").Should().BeEmpty();
	}

	[Fact]
	public void LazyImage_SetsWidthAndHeight() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.Width, "200");
			p.Add(l => l.Height, "150");
		});

		// Assert
		var img = cut.Find("img");
		img.GetAttribute("width").Should().Be("200");
		img.GetAttribute("height").Should().Be("150");
	}

	[Fact]
	public void LazyImage_AppliesAspectRatio() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.AspectRatio, "16/9");
		});

		// Assert
		var container = cut.Find(".lazy-image-container");
		container.GetAttribute("style").Should().Contain("aspect-ratio: 16/9");
	}

	[Fact]
	public void LazyImage_AppliesCustomClass() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.Class, "custom-class");
		});

		// Assert
		var img = cut.Find("img");
		img.ClassList.Should().Contain("custom-class");
	}

	[Fact]
	public void LazyImage_AppliesCustomStyle() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.Style, "border-radius: 50%");
		});

		// Assert
		var img = cut.Find("img");
		img.GetAttribute("style").Should().Contain("border-radius: 50%");
	}

	[Fact]
	public void LazyImage_HasLoadingClass_BeforeLoad() {
		// Act
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
		});

		// Assert
		var container = cut.Find(".lazy-image-container");
		container.ClassList.Should().Contain("loading");
	}

	[Fact]
	public void LazyImage_HasLoadedClass_AfterLoadEvent() {
		// Arrange
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
		});

		// Act
		cut.Find("img").TriggerEvent("onload", new EventArgs());

		// Assert
		var container = cut.Find(".lazy-image-container");
		container.ClassList.Should().Contain("loaded");
	}

	[Fact]
	public void LazyImage_ShowsErrorState_OnError() {
		// Arrange
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
		});

		// Act
		cut.Find("img").TriggerEvent("onerror", new EventArgs());

		// Assert
		cut.Find(".lazy-image-error").Should().NotBeNull();
	}

	[Fact]
	public void LazyImage_ShowsErrorMessage_WhenEnabled() {
		// Arrange
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.ShowErrorMessage, true);
		});

		// Act
		cut.Find("img").TriggerEvent("onerror", new EventArgs());

		// Assert
		cut.Find(".error-text").TextContent.Should().Be("Image unavailable");
	}

	[Fact]
	public async Task LazyImage_InvokesOnLoadCallback() {
		// Arrange
		var loadCalled = false;
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.OnLoad, EventCallback.Factory.Create(this, () => loadCalled = true));
		});

		// Act
		await cut.Find("img").TriggerEventAsync("onload", new EventArgs());

		// Assert
		loadCalled.Should().BeTrue();
	}

	[Fact]
	public async Task LazyImage_InvokesOnErrorCallback() {
		// Arrange
		var errorCalled = false;
		var cut = RenderComponent<LazyImage>(p => {
			p.Add(l => l.Src, "/test.png");
			p.Add(l => l.Alt, "Test");
			p.Add(l => l.OnError, EventCallback.Factory.Create(this, () => errorCalled = true));
		});

		// Act
		await cut.Find("img").TriggerEventAsync("onerror", new EventArgs());

		// Assert
		errorCalled.Should().BeTrue();
	}
}
