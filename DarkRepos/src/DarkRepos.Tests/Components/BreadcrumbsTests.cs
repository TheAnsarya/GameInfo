using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class BreadcrumbsTests : TestContext
{
	[Fact]
	public void Breadcrumbs_RendersAllItems()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem> {
			new("Home", "/"),
			new("Games", "/games"),
			new("Dragon Quest", "/games/dragon-quest")
		};

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var breadcrumbItems = cut.FindAll(".breadcrumb-item");
		breadcrumbItems.Should().HaveCount(3);
	}

	[Fact]
	public void Breadcrumbs_LastItemIsCurrentPage()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem> {
			new("Home", "/"),
			new("Current Page", "/current")
		};

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var lastItem = cut.FindAll(".breadcrumb-item").Last();
		lastItem.GetAttribute("aria-current").Should().Be("page");
	}

	[Fact]
	public void Breadcrumbs_NonLastItemsAreLinks()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem> {
			new("Home", "/"),
			new("Games", "/games"),
			new("Current", "/current")
		};

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var links = cut.FindAll(".breadcrumb-item a");
		links.Should().HaveCount(2);
		links[0].GetAttribute("href").Should().Be("/");
		links[1].GetAttribute("href").Should().Be("/games");
	}

	[Fact]
	public void Breadcrumbs_RendersIcons_WhenProvided()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem> {
			new("Home", "/", "🏠"),
			new("Games", "/games", "🎮")
		};

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.Markup.Should().Contain("🏠");
		cut.Markup.Should().Contain("🎮");
	}

	[Fact]
	public void Breadcrumbs_UsesCustomSeparator()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem> {
			new("Home", "/"),
			new("Games", "/games")
		};

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Separator, "→"));

		// Assert
		cut.Find(".breadcrumb-separator").TextContent.Should().Be("→");
	}

	[Fact]
	public void Breadcrumbs_HasNavigationRole()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem> {
			new("Home", "/")
		};

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.Find("nav").GetAttribute("aria-label").Should().Be("Breadcrumb");
	}

	[Fact]
	public void Breadcrumbs_HandlesEmptyList()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem>();

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.FindAll(".breadcrumb-item").Should().BeEmpty();
	}

	[Fact]
	public void Breadcrumbs_HandlesSingleItem()
	{
		// Arrange
		var items = new List<Breadcrumbs.BreadcrumbItem> {
			new("Home", "/")
		};

		// Act
		var cut = RenderComponent<Breadcrumbs>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.FindAll(".breadcrumb-item").Should().HaveCount(1);
		cut.FindAll(".breadcrumb-separator").Should().BeEmpty();
	}
}
