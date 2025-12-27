using DarkRepos.Core.Models;
using DarkRepos.Core.Services;
using FluentAssertions;

namespace DarkRepos.Tests.Services;

public class WikiLinkServiceTests
{
	private readonly IWikiLinkService _service;

	public WikiLinkServiceTests()
	{
		_service = new WikiLinkService();
	}

	[Fact]
	public void GetWikiUrl_WithGame_ReturnsCorrectUrl()
	{
		// Arrange
		var game = new Game
		{
			Slug = "dragon-warrior-nes",
			Title = "Dragon Warrior",
			Platform = Platform.NES
		};

		// Act
		var url = _service.GetWikiUrl(game);

		// Assert
		url.Should().Contain("games.darkrepos.com/wiki");
		url.Should().Contain("Dragon_Warrior"); // URL encoded, so parens are escaped
	}

	[Fact]
	public void GetRomMapUrl_WhenAvailable_ReturnsUrl()
	{
		// Arrange
		var game = new Game
		{
			Slug = "soul-blazer-snes",
			Title = "Soul Blazer",
			Platform = Platform.SNES,
			Wiki = new WikiResources { HasRomMap = true }
		};

		// Act
		var url = _service.GetRomMapUrl(game);

		// Assert
		url.Should().NotBeNull();
		url.Should().Contain("Soul_Blazer"); // URL encoded
		url.Should().Contain("ROM_map");
	}

	[Fact]
	public void GetRomMapUrl_WhenNotAvailable_ReturnsNull()
	{
		// Arrange
		var game = new Game
		{
			Slug = "test-game",
			Title = "Test Game",
			Platform = Platform.NES,
			Wiki = new WikiResources { HasRomMap = false }
		};

		// Act
		var url = _service.GetRomMapUrl(game);

		// Assert
		url.Should().BeNull();
	}

	[Fact]
	public void GetRamMapUrl_WhenAvailable_ReturnsUrl()
	{
		// Arrange
		var game = new Game
		{
			Slug = "test-game",
			Title = "Test Game",
			Platform = Platform.SNES,
			Wiki = new WikiResources { HasRamMap = true }
		};

		// Act
		var url = _service.GetRamMapUrl(game);

		// Assert
		url.Should().NotBeNull();
		url.Should().Contain("RAM_map");
	}

	[Fact]
	public void GetAllWikiUrls_WithAllResources_ReturnsAllUrls()
	{
		// Arrange
		var game = new Game
		{
			Slug = "full-game",
			Title = "Full Game",
			Platform = Platform.SNES,
			Wiki = new WikiResources
			{
				HasRomMap = true,
				HasRamMap = true,
				HasDataStructures = true,
				HasSystems = true,
				HasNotes = true
			}
		};

		// Act
		var urls = _service.GetAllWikiUrls(game);

		// Assert
		urls.Should().HaveCount(6);
		urls.Should().ContainKey(WikiResourceType.Main);
		urls.Should().ContainKey(WikiResourceType.RomMap);
		urls.Should().ContainKey(WikiResourceType.RamMap);
		urls.Should().ContainKey(WikiResourceType.DataStructures);
		urls.Should().ContainKey(WikiResourceType.Systems);
		urls.Should().ContainKey(WikiResourceType.Notes);
	}

	[Fact]
	public void GetAllWikiUrls_WithNoResources_ReturnsOnlyMainUrl()
	{
		// Arrange
		var game = new Game
		{
			Slug = "minimal-game",
			Title = "Minimal Game",
			Platform = Platform.NES,
			Wiki = new WikiResources()
		};

		// Act
		var urls = _service.GetAllWikiUrls(game);

		// Assert
		urls.Should().HaveCount(1);
		urls.Should().ContainKey(WikiResourceType.Main);
	}

	[Fact]
	public void GenerateWikiLink_WithDisplayText_ReturnsFormattedLink()
	{
		// Arrange & Act
		var link = _service.GenerateWikiLink("Dragon_Warrior_(NES)", "Dragon Warrior");

		// Assert
		link.Should().Be("[[Dragon_Warrior_(NES)|Dragon Warrior]]");
	}

	[Fact]
	public void GenerateWikiLink_WithoutDisplayText_ReturnsSimpleLink()
	{
		// Arrange & Act
		var link = _service.GenerateWikiLink("Dragon_Warrior_(NES)");

		// Assert
		link.Should().Be("[[Dragon_Warrior_(NES)]]");
	}

	[Fact]
	public void GenerateExternalLink_WithDisplayText_ReturnsFormattedLink()
	{
		// Arrange & Act
		var link = _service.GenerateExternalLink("https://example.com", "Example");

		// Assert
		link.Should().Be("[https://example.com Example]");
	}

	[Fact]
	public void GenerateExternalLink_WithoutDisplayText_ReturnsSimpleLink()
	{
		// Arrange & Act
		var link = _service.GenerateExternalLink("https://example.com");

		// Assert
		link.Should().Be("[https://example.com]");
	}

	[Fact]
	public void ToWikiPageName_WithSpaces_ReplacesWithUnderscores()
	{
		// Arrange & Act
		var pageName = _service.ToWikiPageName("Final Fantasy Mystic Quest", Platform.SNES);

		// Assert
		pageName.Should().Be("Final_Fantasy_Mystic_Quest_(SNES)");
	}

	[Fact]
	public void ToWikiPageName_WithSpecialCharacters_RemovesThem()
	{
		// Arrange & Act
		var pageName = _service.ToWikiPageName("Test [Game] {Version}", Platform.NES);

		// Assert
		pageName.Should().NotContain("[");
		pageName.Should().NotContain("]");
		pageName.Should().NotContain("{");
		pageName.Should().NotContain("}");
		pageName.Should().Contain("_(NES)");
	}
}
