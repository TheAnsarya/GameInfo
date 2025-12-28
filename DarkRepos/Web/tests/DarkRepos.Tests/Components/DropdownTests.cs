using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class DropdownTests : TestContext {
	private readonly List<string> _items = ["Option 1", "Option 2", "Option 3"];

	[Fact]
	public void Dropdown_RendersPlaceholder_WhenNoSelection() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.Placeholder, "Select option"));

		// Assert
		cut.Find(".dropdown-placeholder").TextContent.Should().Be("Select option");
	}

	[Fact]
	public void Dropdown_RendersSelectedValue() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.SelectedItem, "Option 2"));

		// Assert
		cut.Find(".dropdown-value").TextContent.Should().Contain("Option 2");
	}

	[Fact]
	public void Dropdown_IsClosedByDefault() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items));

		// Assert
		cut.FindAll(".dropdown-menu").Should().BeEmpty();
	}

	[Fact]
	public void Dropdown_OpensOnTriggerClick() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items));

		cut.Find(".dropdown-trigger").Click();

		// Assert
		cut.Find(".dropdown-menu").Should().NotBeNull();
	}

	[Fact]
	public void Dropdown_ShowsAllItems_WhenOpen() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.IsOpen, true));

		// Assert
		var items = cut.FindAll(".dropdown-item");
		items.Should().HaveCount(3);
	}

	[Fact]
	public void Dropdown_HasAriaExpanded() {
		// Arrange
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items));

		// Assert closed - Blazor renders boolean as lowercase "false"
		cut.Find(".dropdown-trigger").GetAttribute("aria-expanded").Should().Be("false");

		// Act - open
		cut.Find(".dropdown-trigger").Click();

		// Assert open
		cut.Find(".dropdown-trigger").GetAttribute("aria-expanded").Should().Be("true");
	}

	[Fact]
	public void Dropdown_SelectsItem_OnClick() {
		// Arrange
		string? selected = null;
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.IsOpen, true)
			.Add(p => p.SelectedItemChanged, (string? item) => selected = item));

		// Act
		cut.FindAll(".dropdown-item")[1].Click();

		// Assert
		selected.Should().Be("Option 2");
	}

	[Fact]
	public void Dropdown_ClosesAfterSelection() {
		// Arrange
		var isOpen = true;
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.IsOpen, isOpen)
			.Add(p => p.IsOpenChanged, (bool value) => isOpen = value));

		// Act
		cut.FindAll(".dropdown-item")[0].Click();

		// Assert
		isOpen.Should().BeFalse();
	}

	[Fact]
	public void Dropdown_SelectedItem_HasSelectedClass() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.SelectedItem, "Option 2")
			.Add(p => p.IsOpen, true));

		// Assert
		var selectedItem = cut.FindAll(".dropdown-item")[1];
		selectedItem.ClassList.Should().Contain("dropdown-item--selected");
	}

	[Fact]
	public void Dropdown_HasListboxRole() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.IsOpen, true));

		// Assert
		cut.Find(".dropdown-menu").GetAttribute("role").Should().Be("listbox");
	}

	[Fact]
	public void Dropdown_ItemsHaveOptionRole() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.IsOpen, true));

		// Assert
		foreach (var item in cut.FindAll(".dropdown-item")) {
			item.GetAttribute("role").Should().Be("option");
		}
	}

	[Fact]
	public void Dropdown_HasOpenClass_WhenOpen() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.IsOpen, true));

		// Assert
		cut.Find(".dropdown").ClassList.Should().Contain("dropdown--open");
	}

	[Fact]
	public void Dropdown_AppliesCustomCssClass() {
		// Act
		var cut = RenderComponent<Dropdown<string>>(parameters => parameters
			.Add(p => p.Items, _items)
			.Add(p => p.CssClass, "my-dropdown"));

		// Assert
		cut.Find(".dropdown").ClassList.Should().Contain("my-dropdown");
	}
}
