using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Rendering;
using Xunit;
using static DarkRepos.Web.Components.Shared.Accordion;

namespace DarkRepos.Tests.Components;

public class AccordionTests : TestContext
{
	[Fact]
	public void Accordion_RendersAllItems()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.FindAll(".accordion-item").Count.Should().Be(3);
	}

	[Fact]
	public void Accordion_RendersItemTitles()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var titles = cut.FindAll(".accordion-title");
		titles[0].TextContent.Should().Be("Section 1");
		titles[1].TextContent.Should().Be("Section 2");
		titles[2].TextContent.Should().Be("Section 3");
	}

	[Fact]
	public void Accordion_AllPanelsCollapsedByDefault()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		cut.FindAll(".accordion-item--expanded").Should().BeEmpty();
	}

	[Fact]
	public void Accordion_TriggerHasAriaExpanded()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var trigger = cut.Find(".accordion-trigger");
		trigger.GetAttribute("aria-expanded").Should().Be("false");
	}

	[Fact]
	public async Task Accordion_ClickExpands()
	{
		// Arrange
		var items = CreateTestItems();
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items));

		// Act
		await cut.Find(".accordion-trigger").ClickAsync(new());

		// Assert
		cut.FindAll(".accordion-item--expanded").Count.Should().Be(1);
	}

	[Fact]
	public async Task Accordion_ClickCollapses()
	{
		// Arrange
		var items = CreateTestItems();
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.DefaultExpanded, new[] { 0 }));

		// Act
		await cut.Find(".accordion-trigger").ClickAsync(new());

		// Assert
		cut.FindAll(".accordion-item--expanded").Should().BeEmpty();
	}

	[Fact]
	public void Accordion_DefaultExpandedWorks()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.DefaultExpanded, new[] { 1 }));

		// Assert
		var expandedItems = cut.FindAll(".accordion-item--expanded");
		expandedItems.Count.Should().Be(1);
	}

	[Fact]
	public async Task Accordion_SingleMode_CollapsesOthers()
	{
		// Arrange
		var items = CreateTestItems();
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.AllowMultiple, false)
			.Add(p => p.DefaultExpanded, new[] { 0 }));

		// Act - Click second item
		var triggers = cut.FindAll(".accordion-trigger");
		await triggers[1].ClickAsync(new());

		// Assert - Only second item expanded
		var expandedItems = cut.FindAll(".accordion-item--expanded");
		expandedItems.Count.Should().Be(1);
	}

	[Fact]
	public async Task Accordion_MultipleMode_KeepsOthersOpen()
	{
		// Arrange
		var items = CreateTestItems();
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.AllowMultiple, true)
			.Add(p => p.DefaultExpanded, new[] { 0 }));

		// Act - Click second item
		var triggers = cut.FindAll(".accordion-trigger");
		await triggers[1].ClickAsync(new());

		// Assert - Both items expanded
		var expandedItems = cut.FindAll(".accordion-item--expanded");
		expandedItems.Count.Should().Be(2);
	}

	[Fact]
	public void Accordion_PanelHasRegionRole()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.DefaultExpanded, new[] { 0 }));

		// Assert
		var panel = cut.Find(".accordion-panel");
		panel.GetAttribute("role").Should().Be("region");
	}

	[Fact]
	public void Accordion_TriggerControlsPanel()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var trigger = cut.Find(".accordion-trigger");
		var panel = cut.Find(".accordion-panel");
		trigger.GetAttribute("aria-controls").Should().Be(panel.Id);
	}

	[Fact]
	public void Accordion_PanelLabelledByTrigger()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items));

		// Assert
		var trigger = cut.Find(".accordion-trigger");
		var panel = cut.Find(".accordion-panel");
		panel.GetAttribute("aria-labelledby").Should().Be(trigger.Id);
	}

	[Fact]
	public async Task Accordion_InvokesOnToggleCallback()
	{
		// Arrange
		var items = CreateTestItems();
		var toggledIndex = -1;

		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.OnToggle, index => toggledIndex = index));

		// Act
		var triggers = cut.FindAll(".accordion-trigger");
		await triggers[1].ClickAsync(new());

		// Assert
		toggledIndex.Should().Be(1);
	}

	[Fact]
	public void Accordion_AppliesCustomCssClass()
	{
		// Arrange
		var items = CreateTestItems();

		// Act
		var cut = RenderComponent<Accordion>(parameters => parameters
			.Add(p => p.Items, items)
			.Add(p => p.CssClass, "my-accordion"));

		// Assert
		cut.Find(".accordion").ClassList.Should().Contain("my-accordion");
	}

	private static List<AccordionItem> CreateTestItems()
	{
		return [
			new() { Title = "Section 1", Content = (RenderTreeBuilder builder) => builder.AddContent(0, "Content 1") },
			new() { Title = "Section 2", Content = (RenderTreeBuilder builder) => builder.AddContent(0, "Content 2") },
			new() { Title = "Section 3", Content = (RenderTreeBuilder builder) => builder.AddContent(0, "Content 3") },
		];
	}
}
