using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;
using static DarkRepos.Web.Components.Shared.DataTable<DarkRepos.Tests.Components.DataTableTests.TestItem>;

namespace DarkRepos.Tests.Components;

public class DataTableTests : TestContext {
	public record TestItem(int Id, string Name, decimal Price);

	private static readonly List<TestItem> _testItems = [
		new(1, "Item A", 10.00m),
		new(2, "Item B", 20.00m),
		new(3, "Item C", 15.00m)
	];

	private static readonly List<DataTableColumn<TestItem>> _testColumns = [
		new() { Header = "ID", PropertyName = "Id" },
		new() { Header = "Name", PropertyName = "Name" },
		new() { Header = "Price", PropertyName = "Price" }
	];

	[Fact]
	public void DataTable_RendersAllItems() {
		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, _testColumns));

		// Assert
		cut.FindAll("tbody tr").Should().HaveCount(3);
	}

	[Fact]
	public void DataTable_RendersHeaders() {
		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, _testColumns));

		// Assert
		var headers = cut.FindAll("thead th");
		headers.Should().HaveCount(3);
		headers[0].TextContent.Should().Contain("ID");
		headers[1].TextContent.Should().Contain("Name");
		headers[2].TextContent.Should().Contain("Price");
	}

	[Fact]
	public void DataTable_HidesHeaders_WhenShowHeaderFalse() {
		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, _testColumns)
			.Add(p => p.ShowHeader, false));

		// Assert
		cut.FindAll("thead").Should().BeEmpty();
	}

	[Fact]
	public void DataTable_ShowsEmptyMessage_WhenNoItems() {
		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, Enumerable.Empty<TestItem>())
			.Add(p => p.Columns, _testColumns)
			.Add(p => p.EmptyMessage, "No items found"));

		// Assert
		cut.Markup.Should().Contain("No items found");
	}

	[Fact]
	public void DataTable_HasGridRole() {
		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, _testColumns));

		// Assert
		cut.Find("table").GetAttribute("role").Should().Be("grid");
	}

	[Fact]
	public void DataTable_HasAriaLabel() {
		// Arrange
		const string label = "Product list";

		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, _testColumns)
			.Add(p => p.AriaLabel, label));

		// Assert
		cut.Find("table").GetAttribute("aria-label").Should().Be(label);
	}

	[Fact]
	public void DataTable_SortableColumn_HasSortableClass() {
		// Arrange
		var columns = new List<DataTableColumn<TestItem>> {
			new() { Header = "Name", PropertyName = "Name", Sortable = true }
		};

		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, columns));

		// Assert
		cut.Find("thead th").ClassList.Should().Contain("sortable");
	}

	[Fact]
	public void DataTable_IsScrollable_HasScrollableClass() {
		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, _testColumns)
			.Add(p => p.IsScrollable, true));

		// Assert
		cut.Find(".data-table-container").ClassList.Should().Contain("scrollable");
	}

	[Fact]
	public void DataTable_RendersCellValues() {
		// Act
		var cut = RenderComponent<DataTable<TestItem>>(parameters => parameters
			.Add(p => p.Items, _testItems)
			.Add(p => p.Columns, _testColumns));

		// Assert
		var cells = cut.FindAll("tbody td");
		cells.Should().HaveCount(9);
		cut.Markup.Should().Contain("Item A");
		cut.Markup.Should().Contain("Item B");
		cut.Markup.Should().Contain("Item C");
	}
}
