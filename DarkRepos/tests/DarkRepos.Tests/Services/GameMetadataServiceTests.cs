using DarkRepos.Core.Models;
using DarkRepos.Core.Services;
using FluentAssertions;

namespace DarkRepos.Tests.Services;

public class GameMetadataServiceTests
{
	private readonly IGameMetadataService _service;

	public GameMetadataServiceTests()
	{
		_service = new GameMetadataService();
	}

	[Fact]
	public void ParseGame_WithValidJson_ReturnsGame()
	{
		// Arrange
		var json = """
			{
				"slug": "dragon-warrior-nes",
				"title": "Dragon Warrior",
				"platform": "NES",
				"developer": "Chunsoft",
				"publisher": "Enix",
				"releaseYear": 1989,
				"genre": "RPG",
				"description": "The classic RPG that started it all."
			}
			""";

		// Act
		var game = _service.ParseGame(json);

		// Assert
		game.Should().NotBeNull();
		game!.Slug.Should().Be("dragon-warrior-nes");
		game.Title.Should().Be("Dragon Warrior");
		game.Platform.Should().Be(Platform.NES);
		game.Developer.Should().Be("Chunsoft");
		game.Publisher.Should().Be("Enix");
		game.ReleaseYear.Should().Be(1989);
		game.Genre.Should().Be("RPG");
		game.Description.Should().Be("The classic RPG that started it all.");
	}

	[Fact]
	public void ParseGame_WithMinimalJson_ReturnsGame()
	{
		// Arrange
		var json = """
			{
				"slug": "test-game",
				"title": "Test Game",
				"platform": "SNES"
			}
			""";

		// Act
		var game = _service.ParseGame(json);

		// Assert
		game.Should().NotBeNull();
		game!.Slug.Should().Be("test-game");
		game.Title.Should().Be("Test Game");
		game.Platform.Should().Be(Platform.SNES);
	}

	[Fact]
	public void ParseGame_WithWikiResources_ParsesCorrectly()
	{
		// Arrange
		var json = """
			{
				"slug": "soul-blazer-snes",
				"title": "Soul Blazer",
				"platform": "SNES",
				"wiki": {
					"hasRomMap": true,
					"hasRamMap": true,
					"hasDataStructures": true,
					"hasSystems": false,
					"hasNotes": true,
					"wikiBaseUrl": "https://games.darkrepos.com/wiki/Soul_Blazer_(SNES)"
				}
			}
			""";

		// Act
		var game = _service.ParseGame(json);

		// Assert
		game.Should().NotBeNull();
		game!.Wiki.HasRomMap.Should().BeTrue();
		game.Wiki.HasRamMap.Should().BeTrue();
		game.Wiki.HasDataStructures.Should().BeTrue();
		game.Wiki.HasSystems.Should().BeFalse();
		game.Wiki.HasNotes.Should().BeTrue();
		game.Wiki.WikiBaseUrl.Should().Be("https://games.darkrepos.com/wiki/Soul_Blazer_(SNES)");
	}

	[Fact]
	public void ParseGame_WithEmptyJson_ReturnsNull()
	{
		// Arrange & Act
		var game = _service.ParseGame(string.Empty);

		// Assert
		game.Should().BeNull();
	}

	[Fact]
	public void ParseGame_WithMissingRequiredFields_ReturnsNull()
	{
		// Arrange
		var json = """
			{
				"title": "Missing Slug and Platform"
			}
			""";

		// Act
		var game = _service.ParseGame(json);

		// Assert
		game.Should().BeNull();
	}

	[Fact]
	public void ParseGame_WithInvalidPlatform_ReturnsNull()
	{
		// Arrange
		var json = """
			{
				"slug": "test-game",
				"title": "Test Game",
				"platform": "InvalidPlatform"
			}
			""";

		// Act
		var game = _service.ParseGame(json);

		// Assert
		game.Should().BeNull();
	}

	[Fact]
	public void ParseGame_WithDocumentationLevel_ParsesCorrectly()
	{
		// Arrange
		var json = """
			{
				"slug": "test-game",
				"title": "Test Game",
				"platform": "SNES",
				"documentationLevel": "Complete"
			}
			""";

		// Act
		var game = _service.ParseGame(json);

		// Assert
		game.Should().NotBeNull();
		game!.DocumentationLevel.Should().Be(DocumentationLevel.Complete);
	}

	[Fact]
	public void ValidateGameJson_WithValidJson_ReturnsValid()
	{
		// Arrange
		var json = """
			{
				"slug": "valid-game",
				"title": "Valid Game",
				"platform": "NES"
			}
			""";

		// Act
		var (isValid, errors) = _service.ValidateGameJson(json);

		// Assert
		isValid.Should().BeTrue();
		errors.Should().BeEmpty();
	}

	[Fact]
	public void ValidateGameJson_WithMissingSlug_ReturnsError()
	{
		// Arrange
		var json = """
			{
				"title": "Missing Slug",
				"platform": "NES"
			}
			""";

		// Act
		var (isValid, errors) = _service.ValidateGameJson(json);

		// Assert
		isValid.Should().BeFalse();
		errors.Should().Contain("'slug' is required");
	}

	[Fact]
	public void ValidateGameJson_WithInvalidSlug_ReturnsError()
	{
		// Arrange
		var json = """
			{
				"slug": "Invalid Slug With Spaces",
				"title": "Test Game",
				"platform": "NES"
			}
			""";

		// Act
		var (isValid, errors) = _service.ValidateGameJson(json);

		// Assert
		isValid.Should().BeFalse();
		errors.Should().Contain(e => e.Contains("Invalid slug format"));
	}

	[Fact]
	public void ValidateGameJson_WithInvalidReleaseYear_ReturnsError()
	{
		// Arrange
		var json = """
			{
				"slug": "test-game",
				"title": "Test Game",
				"platform": "NES",
				"releaseYear": 1950
			}
			""";

		// Act
		var (isValid, errors) = _service.ValidateGameJson(json);

		// Assert
		isValid.Should().BeFalse();
		errors.Should().Contain(e => e.Contains("Invalid release year"));
	}

	[Fact]
	public void ExportToJson_WithGame_ReturnsValidJson()
	{
		// Arrange
		var game = new Game
		{
			Slug = "test-game",
			Title = "Test Game",
			Platform = Platform.SNES,
			Developer = "Test Dev",
			ReleaseYear = 1995
		};

		// Act
		var json = _service.ExportToJson(game);

		// Assert
		json.Should().Contain("\"slug\": \"test-game\"");
		json.Should().Contain("\"title\": \"Test Game\"");
		json.Should().Contain("\"platform\": \"SNES\"");
		json.Should().Contain("\"developer\": \"Test Dev\"");
		json.Should().Contain("\"releaseYear\": 1995");
	}

	[Fact]
	public void ExportToJson_AndParseBack_ReturnsEquivalentGame()
	{
		// Arrange
		var original = new Game
		{
			Slug = "round-trip-test",
			Title = "Round Trip Test",
			Platform = Platform.GBA,
			Developer = "Test",
			Publisher = "Test Publisher",
			ReleaseYear = 2004,
			Genre = "Action",
			Description = "A test game.",
			Series = "Test Series",
			DocumentationLevel = DocumentationLevel.Substantial,
			Tags = ["action", "test"],
			Wiki = new WikiResources
			{
				HasRomMap = true,
				HasRamMap = false
			}
		};

		// Act
		var json = _service.ExportToJson(original);
		var parsed = _service.ParseGame(json);

		// Assert
		parsed.Should().NotBeNull();
		parsed!.Slug.Should().Be(original.Slug);
		parsed.Title.Should().Be(original.Title);
		parsed.Platform.Should().Be(original.Platform);
		parsed.Developer.Should().Be(original.Developer);
		parsed.ReleaseYear.Should().Be(original.ReleaseYear);
		parsed.DocumentationLevel.Should().Be(original.DocumentationLevel);
		parsed.Wiki.HasRomMap.Should().Be(original.Wiki.HasRomMap);
	}
}
