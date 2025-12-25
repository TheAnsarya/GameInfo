using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Xunit;

namespace DarkRepos.Tests.Components;

public class PaginationTests : TestContext {
	[Fact]
	public void Pagination_RendersAllPageButtons() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 1)
			.Add(p => p.TotalPages, 5));

		// Assert
		var buttons = cut.FindAll(".pagination-btn:not(.pagination-prev):not(.pagination-next)");
		buttons.Should().HaveCount(5);
	}

	[Fact]
	public void Pagination_HighlightsCurrentPage() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 3)
			.Add(p => p.TotalPages, 5));

		// Assert
		var activeButton = cut.Find(".pagination-btn.active");
		activeButton.TextContent.Should().Be("3");
	}

	[Fact]
	public void Pagination_DisablesPrevious_OnFirstPage() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 1)
			.Add(p => p.TotalPages, 5));

		// Assert
		var prevButton = cut.Find(".pagination-prev");
		prevButton.HasAttribute("disabled").Should().BeTrue();
	}

	[Fact]
	public void Pagination_DisablesNext_OnLastPage() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 5)
			.Add(p => p.TotalPages, 5));

		// Assert
		var nextButton = cut.Find(".pagination-next");
		nextButton.HasAttribute("disabled").Should().BeTrue();
	}

	[Fact]
	public void Pagination_ShowsPageInfo_WhenEnabled() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 2)
			.Add(p => p.TotalPages, 10)
			.Add(p => p.ShowPageInfo, true));

		// Assert
		cut.Markup.Should().Contain("Page 2 of 10");
	}

	[Fact]
	public void Pagination_ShowsTotalItems_WhenProvided() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 1)
			.Add(p => p.TotalPages, 5)
			.Add(p => p.TotalItems, 100)
			.Add(p => p.ShowPageInfo, true));

		// Assert
		cut.Markup.Should().Contain("100 items");
	}

	[Fact]
	public void Pagination_HasNavigationRole() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 1)
			.Add(p => p.TotalPages, 5));

		// Assert
		cut.Find("nav").GetAttribute("role").Should().Be("navigation");
	}

	[Fact]
	public async Task Pagination_InvokesCallback_OnPageClick() {
		// Arrange
		var clickedPage = 0;

		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 1)
			.Add(p => p.TotalPages, 5)
			.Add(p => p.OnPageChanged, EventCallback.Factory.Create<int>(this, p => clickedPage = p)));

		// Act
		var button = cut.FindAll(".pagination-btn").First(b => b.TextContent == "3");
		await cut.InvokeAsync(() => button.Click());

		// Assert
		clickedPage.Should().Be(3);
	}

	[Fact]
	public void Pagination_ShowsEllipsis_ForManyPages() {
		// Act
		var cut = RenderComponent<Pagination>(parameters => parameters
			.Add(p => p.CurrentPage, 5)
			.Add(p => p.TotalPages, 20)
			.Add(p => p.MaxVisiblePages, 5)
			.Add(p => p.ShowFirstLast, true));

		// Assert
		cut.FindAll(".pagination-ellipsis").Should().HaveCount(2);
	}
}
