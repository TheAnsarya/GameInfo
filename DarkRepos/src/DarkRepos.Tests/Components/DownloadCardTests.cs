using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class DownloadCardTests : TestContext
{
	[Fact]
	public void DownloadCard_RendersTitle()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		cut.Find(".download-card-title").TextContent.Should().Be("Test Tool");
	}

	[Fact]
	public void DownloadCard_RendersDescription()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Description, "A useful tool for testing")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		cut.Find(".download-card-description").TextContent.Should().Be("A useful tool for testing");
	}

	[Fact]
	public void DownloadCard_RendersVersion()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Version, "2.0.0")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		cut.Markup.Should().Contain("2.0.0");
	}

	[Fact]
	public void DownloadCard_RendersPlatform()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Platform, ".NET 10")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		cut.Markup.Should().Contain(".NET 10");
	}

	[Fact]
	public void DownloadCard_RendersSize()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Size, "~25 MB")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		cut.Markup.Should().Contain("~25 MB");
	}

	[Fact]
	public void DownloadCard_RendersDownloadLink()
	{
		// Arrange
		var url = "https://github.com/example/releases";

		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Url, url));

		// Assert
		var link = cut.Find("a.btn-primary");
		link.GetAttribute("href").Should().Be(url);
		link.TextContent.Trim().Should().Be("Download");
	}

	[Fact]
	public void DownloadCard_RendersDefaultIcon()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		cut.Find(".download-card-icon").TextContent.Should().Be("📦");
	}

	[Fact]
	public void DownloadCard_RendersCustomIcon()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Icon, "🔧")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		cut.Find(".download-card-icon").TextContent.Should().Be("🔧");
	}

	[Fact]
	public void DownloadCard_HasExternalLinkAttributes()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Url, "https://example.com"));

		// Assert
		var link = cut.Find("a.btn-primary");
		link.GetAttribute("target").Should().Be("_blank");
		link.GetAttribute("rel").Should().Be("noopener");
	}

	[Fact]
	public void DownloadCard_HidesMetaItems_WhenNotProvided()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Url, "https://example.com"));

		// Assert - should not have any meta items if none are provided
		cut.FindAll(".download-meta-item").Count.Should().Be(0);
	}

	[Fact]
	public void DownloadCard_ShowsAllMetaItems_WhenProvided()
	{
		// Act
		var cut = RenderComponent<DownloadCard>(parameters => parameters
			.Add(p => p.Title, "Test Tool")
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.Platform, "Windows")
			.Add(p => p.Size, "10 MB")
			.Add(p => p.Url, "https://example.com"));

		// Assert - should have 3 meta items
		cut.FindAll(".download-meta-item").Count.Should().Be(3);
	}
}
