using Bunit;
using DarkRepos.Core.Models;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class GameCardTests : TestContext
{
	[Fact]
	public void GameCard_DisplaysGameTitle()
	{
		// Arrange
		var game = CreateTestGame();

		// Act
		var cut = RenderComponent<GameCard>(parameters => parameters
			.Add(p => p.Game, game));

		// Assert
		cut.Find(".game-card-title").TextContent.Should().Contain("Dragon Quest IV");
	}

	[Fact]
	public void GameCard_DisplaysPlatformBadge()
	{
		// Arrange
		var game = CreateTestGame();

		// Act
		var cut = RenderComponent<GameCard>(parameters => parameters
			.Add(p => p.Game, game));

		// Assert
		cut.Find(".badge").Should().NotBeNull();
	}

	[Fact]
	public void GameCard_LinksToGameDetail()
	{
		// Arrange
		var game = CreateTestGame();

		// Act
		var cut = RenderComponent<GameCard>(parameters => parameters
			.Add(p => p.Game, game));

		// Assert
		var link = cut.Find("a");
		link.GetAttribute("href").Should().Be("/games/dragon-quest-iv");
	}

	[Fact]
	public void GameCard_ShowsMeta_WhenShowMetaIsTrue()
	{
		// Arrange
		var game = CreateTestGame();

		// Act
		var cut = RenderComponent<GameCard>(parameters => parameters
			.Add(p => p.Game, game)
			.Add(p => p.ShowMeta, true));

		// Assert
		cut.Markup.Should().Contain("Enix");
		cut.Markup.Should().Contain("1992");
	}

	[Fact]
	public void GameCard_HidesMeta_WhenShowMetaIsFalse()
	{
		// Arrange
		var game = CreateTestGame();

		// Act
		var cut = RenderComponent<GameCard>(parameters => parameters
			.Add(p => p.Game, game)
			.Add(p => p.ShowMeta, false));

		// Assert
		cut.Markup.Should().NotContain("Enix");
	}

	private static Game CreateTestGame()
	{
		return new Game
		{
			Slug = "dragon-quest-iv",
			Title = "Dragon Quest IV",
			Platform = Platform.NES,
			Developer = "Enix",
			ReleaseYear = 1992,
			Description = "The fourth installment in the Dragon Quest series.",
			DocumentationLevel = DocumentationLevel.Complete
		};
	}
}
