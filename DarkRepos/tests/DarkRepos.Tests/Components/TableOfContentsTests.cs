using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Xunit;
using static DarkRepos.Web.Components.Shared.TableOfContents;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the TableOfContents component.
/// </summary>
public class TableOfContentsTests : TestContext {
	[Fact]
	public void TableOfContents_RendersNothing_WhenItemsIsNull() {
		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, null));

		// Assert
		cut.Markup.Trim().Should().BeEmpty();
	}

	[Fact]
	public void TableOfContents_RendersNothing_WhenItemsIsEmpty() {
		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, new List<TocItem>()));

		// Assert
		cut.Markup.Trim().Should().BeEmpty();
	}

	[Fact]
	public void TableOfContents_RendersTocItems() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "intro", Text = "Introduction", Level = 2 },
			new() { Id = "setup", Text = "Setup", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var links = cut.FindAll(".toc-link");
		links.Should().HaveCount(2);
		links[0].TextContent.Should().Be("Introduction");
		links[1].TextContent.Should().Be("Setup");
	}

	[Fact]
	public void TableOfContents_RendersCorrectHrefs() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "my-section", Text = "My Section", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.Find(".toc-link").GetAttribute("href").Should().Be("#my-section");
	}

	[Fact]
	public void TableOfContents_ShowsCustomTitle() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Title, "Contents"));

		// Assert
		cut.Find(".toc-title").TextContent.Should().Be("Contents");
	}

	[Fact]
	public void TableOfContents_HighlightsActiveItem() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "intro", Text = "Introduction", Level = 2 },
			new() { Id = "setup", Text = "Setup", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.ActiveId, "setup"));

		// Assert
		var activeItems = cut.FindAll(".toc-item.active");
		activeItems.Should().HaveCount(1);
		activeItems[0].TextContent.Should().Contain("Setup");
	}

	[Fact]
	public void TableOfContents_RendersChildItems() {
		// Arrange
		var items = new List<TocItem>
		{
			new()
			{
				Id = "getting-started",
				Text = "Getting Started",
				Level = 2,
				Children =
				[
					new() { Id = "prerequisites", Text = "Prerequisites", Level = 3 },
					new() { Id = "installation", Text = "Installation", Level = 3 }
				]
			}
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var links = cut.FindAll(".toc-link");
		links.Should().HaveCount(3);
		links[1].TextContent.Should().Be("Prerequisites");
		links[2].TextContent.Should().Be("Installation");
	}

	[Fact]
	public void TableOfContents_RendersGrandchildItems() {
		// Arrange
		var items = new List<TocItem>
		{
			new()
			{
				Id = "api",
				Text = "API",
				Level = 2,
				Children =
				[
					new()
					{
						Id = "methods",
						Text = "Methods",
						Level = 3,
						Children =
						[
							new() { Id = "get", Text = "GET", Level = 4 },
							new() { Id = "post", Text = "POST", Level = 4 }
						]
					}
				]
			}
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var links = cut.FindAll(".toc-link");
		links.Should().HaveCount(4);
		links[2].TextContent.Should().Be("GET");
		links[3].TextContent.Should().Be("POST");
	}

	[Fact]
	public void TableOfContents_HasStickyClass_WhenStickyIsTrue() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Sticky, true));

		// Assert
		cut.Find(".toc").ClassList.Should().Contain("sticky");
	}

	[Fact]
	public void TableOfContents_NoStickyClass_WhenStickyIsFalse() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Sticky, false));

		// Assert
		cut.Find(".toc").ClassList.Should().NotContain("sticky");
	}

	[Fact]
	public void TableOfContents_ShowsToggleButton_WhenCollapsible() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Collapsible, true));

		// Assert
		cut.FindAll(".toc-toggle").Should().HaveCount(1);
	}

	[Fact]
	public void TableOfContents_HidesToggleButton_WhenNotCollapsible() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Collapsible, false));

		// Assert
		cut.FindAll(".toc-toggle").Should().BeEmpty();
	}

	[Fact]
	public void TableOfContents_CollapsesOnToggleClick() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Collapsible, true));

		// Act
		cut.Find(".toc-toggle").Click();

		// Assert
		cut.FindAll(".toc-list").Should().BeEmpty();
	}

	[Fact]
	public void TableOfContents_ExpandsOnSecondToggleClick() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Collapsible, true));

		// Act
		cut.Find(".toc-toggle").Click();
		cut.Find(".toc-toggle").Click();

		// Assert
		cut.FindAll(".toc-list").Should().HaveCount(1);
	}

	[Fact]
	public void TableOfContents_InvokesCallback_OnItemClick() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};
		string? clickedId = null;

		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.OnItemClicked, EventCallback.Factory.Create<string>(this, id => clickedId = id)));

		// Act
		cut.Find(".toc-link").Click();

		// Assert
		clickedId.Should().Be("test");
	}

	[Fact]
	public void TableOfContents_HasAriaLabel() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.Find(".toc").GetAttribute("aria-label").Should().Be("Table of contents");
	}

	[Fact]
	public void TableOfContents_AppliesLevelClasses() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "l2", Text = "Level 2", Level = 2 },
			new() { Id = "l3", Text = "Level 3", Level = 3 },
			new() { Id = "l4", Text = "Level 4", Level = 4 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.FindAll(".toc-level-2").Should().HaveCount(1);
		cut.FindAll(".toc-level-3").Should().HaveCount(1);
		cut.FindAll(".toc-level-4").Should().HaveCount(1);
	}

	[Fact]
	public void TableOfContents_ToggleHasAriaExpandedAttribute() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.Collapsible, true));

		// Assert - verify aria-expanded exists and list is visible
		var toggle = cut.Find(".toc-toggle");
		toggle.HasAttribute("aria-expanded").Should().BeTrue();

		// List should be visible initially
		cut.FindAll(".toc-list").Should().HaveCount(1);

		// Click to collapse - list should be hidden
		toggle.Click();
		cut.FindAll(".toc-list").Should().BeEmpty();
	}

	[Fact]
	public void TableOfContents_ListsHaveRoleAttribute() {
		// Arrange
		var items = new List<TocItem>
		{
			new() { Id = "test", Text = "Test", Level = 2 }
		};

		// Act
		var cut = RenderComponent<TableOfContents>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.Find(".toc-list").GetAttribute("role").Should().Be("list");
	}
}
