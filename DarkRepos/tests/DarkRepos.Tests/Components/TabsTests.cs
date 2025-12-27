using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Rendering;
using Xunit;
using static DarkRepos.Web.Components.Shared.Tabs;

namespace DarkRepos.Tests.Components;

public class TabsTests : TestContext {
	[Fact]
	public void Tabs_RendersTabList() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs)
			.Add(p => p.AriaLabel, "Tabs"));

		// Assert
		cut.Find("[role='tablist']").Should().NotBeNull();
	}

	[Fact]
	public void Tabs_RendersAllTabs() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs));

		// Assert
		var tabButtons = cut.FindAll("[role='tab']");
		tabButtons.Should().HaveCount(3);
	}

	[Fact]
	public void Tabs_FirstTabIsActiveByDefault() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs));

		// Assert
		var activeTab = cut.Find("[role='tab'].active");
		activeTab.TextContent.Should().Contain("Tab 1");
	}

	[Fact]
	public void Tabs_ShowsCorrectPanelContent() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs));

		// Assert
		var activePanel = cut.Find("[role='tabpanel'].active");
		activePanel.TextContent.Should().Contain("Content 1");
	}

	[Fact]
	public void Tabs_HasAriaLabel() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs)
			.Add(p => p.AriaLabel, "My tabs"));

		// Assert
		cut.Find("[role='tablist']").GetAttribute("aria-label").Should().Be("My tabs");
	}

	[Fact]
	public void Tabs_TabHasAriaSelected() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs));

		// Assert
		var activeTab = cut.Find("[role='tab'].active");
		activeTab.GetAttribute("aria-selected").Should().Be("true");
	}

	[Fact]
	public void Tabs_InactiveTabsHaveAriaSelectedFalse() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs));

		// Assert
		var inactiveTabs = cut.FindAll("[role='tab']:not(.active)");
		foreach (var tab in inactiveTabs) {
			tab.GetAttribute("aria-selected").Should().Be("false");
		}
	}

	[Fact]
	public void Tabs_PanelHasAriaLabelledby() {
		// Arrange
		var tabs = CreateTestTabs();

		// Act
		var cut = RenderComponent<Tabs>(parameters => parameters
			.Add(p => p.Items, tabs));

		// Assert
		var panel = cut.Find("[role='tabpanel']");
		panel.GetAttribute("aria-labelledby").Should().StartWith("tab-");
	}

	private static List<TabItem> CreateTestTabs() {
		return [
			new() { Label = "Tab 1", Content = (RenderTreeBuilder builder) => builder.AddContent(0, "Content 1") },
			new() { Label = "Tab 2", Content = (RenderTreeBuilder builder) => builder.AddContent(0, "Content 2") },
			new() { Label = "Tab 3", Content = (RenderTreeBuilder builder) => builder.AddContent(0, "Content 3") }
		];
	}
}
