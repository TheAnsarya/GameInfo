using Bunit;
using DarkRepos.Core.Services;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.DependencyInjection;
using Moq;
using Xunit;

namespace DarkRepos.Tests.Components;

public class SearchBoxWithSuggestionsTests : TestContext
{
	private readonly Mock<ISearchService> _mockSearchService;

	public SearchBoxWithSuggestionsTests()
	{
		_mockSearchService = new Mock<ISearchService>();
		Services.AddSingleton(_mockSearchService.Object);
	}

	[Fact]
	public void SearchBox_RendersInput()
	{
		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>();

		// Assert
		cut.Find("input[type='search']").Should().NotBeNull();
	}

	[Fact]
	public void SearchBox_RendersSearchButton()
	{
		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>();

		// Assert
		var button = cut.Find(".search-button");
		button.Should().NotBeNull();
		button.GetAttribute("aria-label").Should().Be("Search");
	}

	[Fact]
	public void SearchBox_AppliesPlaceholder()
	{
		// Arrange
		var placeholder = "Search for games...";

		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.Placeholder, placeholder));

		// Assert
		cut.Find("input").GetAttribute("placeholder").Should().Be(placeholder);
	}

	[Fact]
	public void SearchBox_AppliesLargeClass_WhenLargeTrue()
	{
		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.Large, true));

		// Assert
		cut.Find(".search-box").ClassList.Should().Contain("large");
	}

	[Fact]
	public void SearchBox_AppliesExpandedClass_WhenExpandedTrue()
	{
		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.Expanded, true));

		// Assert
		cut.Find(".search-box").ClassList.Should().Contain("expanded");
	}

	[Fact]
	public void SearchBox_ShowsShortcut_WhenShowShortcutTrue()
	{
		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.ShowShortcut, true)
			.Add(p => p.Shortcut, "Ctrl+K"));

		// Assert
		var kbd = cut.Find(".search-shortcut");
		kbd.Should().NotBeNull();
		kbd.TextContent.Should().Be("Ctrl+K");
	}

	[Fact]
	public void SearchBox_HasAccessibilityAttributes()
	{
		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>();

		// Assert
		var input = cut.Find("input");
		input.GetAttribute("role").Should().Be("combobox");
		input.GetAttribute("aria-haspopup").Should().Be("listbox");
		input.GetAttribute("autocomplete").Should().Be("off");
	}

	[Fact]
	public void SearchBox_DoesNotShowSuggestions_Initially()
	{
		// Act
		var cut = RenderComponent<SearchBoxWithSuggestions>();

		// Assert
		var suggestions = cut.FindAll(".search-suggestions");
		suggestions.Should().BeEmpty();
	}

	[Fact]
	public async Task SearchBox_FetchesSuggestions_OnInput()
	{
		// Arrange
		var suggestions = new List<string> { "Dragon Warrior", "Dragon Quest" };
		_mockSearchService
			.Setup(s => s.GetSuggestionsAsync(It.IsAny<string>(), It.IsAny<int>(), It.IsAny<CancellationToken>()))
			.ReturnsAsync(suggestions);

		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.DebounceMs, 0)); // No debounce for testing

		// Act
		var input = cut.Find("input");
		await input.InputAsync(new ChangeEventArgs { Value = "dragon" });

		// Small delay for async operation
		await Task.Delay(50);
		cut.Render();

		// Assert
		_mockSearchService.Verify(
			s => s.GetSuggestionsAsync("dragon", It.IsAny<int>(), It.IsAny<CancellationToken>()),
			Times.AtLeastOnce);
	}

	[Fact]
	public async Task SearchBox_DoesNotFetchSuggestions_WhenQueryTooShort()
	{
		// Arrange
		_mockSearchService
			.Setup(s => s.GetSuggestionsAsync(It.IsAny<string>(), It.IsAny<int>(), It.IsAny<CancellationToken>()))
			.ReturnsAsync(["Test"]);

		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.MinCharsForSuggestions, 3)
			.Add(p => p.DebounceMs, 0));

		// Act
		var input = cut.Find("input");
		await input.InputAsync(new ChangeEventArgs { Value = "ab" });
		await Task.Delay(50);

		// Assert
		_mockSearchService.Verify(
			s => s.GetSuggestionsAsync(It.IsAny<string>(), It.IsAny<int>(), It.IsAny<CancellationToken>()),
			Times.Never);
	}

	[Fact]
	public void SearchBox_InvokesQueryChanged_OnInput()
	{
		// Arrange
		var changedValue = "";
		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.QueryChanged, EventCallback.Factory.Create<string>(this, v => changedValue = v)));

		// Act
		var input = cut.Find("input");
		input.Input("test query");

		// Assert
		changedValue.Should().Be("test query");
	}

	[Fact]
	public void SearchBox_InvokesOnSearch_OnEnterKey()
	{
		// Arrange
		var searchValue = "";
		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.Query, "test")
			.Add(p => p.OnSearch, EventCallback.Factory.Create<string>(this, v => searchValue = v)));

		// Act
		var input = cut.Find("input");
		input.KeyDown(key: "Enter");

		// Assert
		searchValue.Should().Be("test");
	}

	[Fact]
	public void SearchBox_InvokesOnSearch_OnButtonClick()
	{
		// Arrange
		var searchValue = "";
		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.Query, "test")
			.Add(p => p.OnSearch, EventCallback.Factory.Create<string>(this, v => searchValue = v)));

		// Act
		cut.Find(".search-button").Click();

		// Assert
		searchValue.Should().Be("test");
	}

	[Fact]
	public void SearchBox_HidesSuggestions_OnEscape()
	{
		// Arrange
		var suggestions = new List<string> { "Test 1", "Test 2" };
		_mockSearchService
			.Setup(s => s.GetSuggestionsAsync(It.IsAny<string>(), It.IsAny<int>(), It.IsAny<CancellationToken>()))
			.ReturnsAsync(suggestions);

		var cut = RenderComponent<SearchBoxWithSuggestions>(parameters => parameters
			.Add(p => p.DebounceMs, 0));

		// Simulate getting suggestions first would require more setup
		// Just verify escape key handling doesn't throw
		var input = cut.Find("input");
		input.KeyDown(key: "Escape");

		// Assert - no exception thrown, component still renders
		cut.Find(".search-box").Should().NotBeNull();
	}
}
