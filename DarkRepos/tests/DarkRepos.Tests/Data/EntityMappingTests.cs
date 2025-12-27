using DarkRepos.Core.Data;
using DarkRepos.Core.Models;

namespace DarkRepos.Tests.Data;

/// <summary>
/// Unit tests for entity mapping extensions.
/// </summary>
public class EntityMappingTests {
	[Fact]
	public void GameEntity_ToModel_MapsCorrectly() {
		// Arrange
		var entity = new GameEntity {
			Id = 1,
			Slug = "dragon-warrior-4-nes",
			Title = "Dragon Warrior IV",
			Platform = "NES",
			Developer = "Chunsoft",
			Publisher = "Enix",
			Description = "Fourth installment in the Dragon Quest series",
			ReleaseYear = 1992,
			DocumentationLevel = 4,
			TagsJson = "[\"RPG\", \"Dragon Quest\"]",
			HasRomMap = true,
			HasRamMap = true,
			WikiBaseUrl = "/wiki/Dragon_Warrior_IV",
			LastUpdated = new DateTime(2024, 1, 15)
		};

		// Act
		var model = entity.ToModel();

		// Assert
		model.Slug.Should().Be("dragon-warrior-4-nes");
		model.Title.Should().Be("Dragon Warrior IV");
		model.Platform.Should().Be(Platform.NES);
		model.ReleaseYear.Should().Be(1992);
		model.Tags.Should().Contain("RPG");
		model.Tags.Should().Contain("Dragon Quest");
		model.Wiki.HasRomMap.Should().BeTrue();
		model.Wiki.HasRamMap.Should().BeTrue();
	}

	[Fact]
	public void Game_ToEntity_MapsCorrectly() {
		// Arrange
		var model = new Game {
			Slug = "soul-blazer-snes",
			Title = "Soul Blazer",
			Platform = Platform.SNES,
			Description = "Action RPG by Quintet",
			ReleaseYear = 1992,
			Developer = "Quintet",
			Publisher = "Enix",
			DocumentationLevel = DocumentationLevel.Complete,
			Tags = ["Action RPG", "Quintet"]
		};

		// Act
		var entity = model.ToEntity();

		// Assert
		entity.Slug.Should().Be("soul-blazer-snes");
		entity.Title.Should().Be("Soul Blazer");
		entity.Platform.Should().Be("SNES");
		entity.TagsJson.Should().Contain("Action RPG");
		entity.TagsJson.Should().Contain("Quintet");
	}

	[Fact]
	public void ToolEntity_ToModel_MapsCorrectly() {
		// Arrange
		var entity = new ToolEntity {
			Id = 1,
			Slug = "atlas",
			Name = "Atlas",
			Description = "Script insertion tool",
			Category = "Text",
			Version = "1.13",
			Author = "Klarth",
			DownloadUrl = "https://www.romhacking.net/utilities/224/",
			DocumentationPath = "/docs/atlas",
			SupportedPlatformsJson = "[\"Windows\"]",
			TagsJson = "[\"Script Insertion\", \"Pointer Calculation\"]"
		};

		// Act
		var model = entity.ToModel();

		// Assert
		model.Slug.Should().Be("atlas");
		model.Name.Should().Be("Atlas");
		model.Category.Should().Be(ToolCategory.Text);
		model.SupportedPlatforms.Should().Contain("Windows");
	}

	[Fact]
	public void Tool_ToEntity_MapsCorrectly() {
		// Arrange
		var model = new Tool {
			Slug = "yy-chr",
			Name = "YY-CHR",
			Description = "Tile editor for NES/SNES graphics",
			Category = ToolCategory.Graphics,
			Version = "0.98",
			Author = "YY",
			SupportedPlatforms = ["Windows"],
			Tags = ["Tile Editing", "Palette Support"]
		};

		// Act
		var entity = model.ToEntity();

		// Assert
		entity.Slug.Should().Be("yy-chr");
		entity.Category.Should().Be("Graphics");
		entity.SupportedPlatformsJson.Should().Contain("Windows");
	}

	[Fact]
	public void GameEntity_ToModel_HandlesNullArrays() {
		// Arrange
		var entity = new GameEntity {
			Id = 1,
			Slug = "test-game",
			Title = "Test Game",
			Platform = "NES",
			TagsJson = null
		};

		// Act
		var model = entity.ToModel();

		// Assert
		model.Tags.Should().BeEmpty();
	}

	[Fact]
	public void GameEntity_ToModel_HandlesMalformedJson() {
		// Arrange
		var entity = new GameEntity {
			Id = 1,
			Slug = "test-game",
			Title = "Test Game",
			Platform = "NES",
			TagsJson = "not valid json"
		};

		// Act
		var model = entity.ToModel();

		// Assert
		model.Tags.Should().BeEmpty();
	}

	[Fact]
	public void Platform_ParsesCorrectly() {
		// Test various platform string mappings
		var testCases = new Dictionary<string, Platform>
		{
			{ "NES", Platform.NES },
			{ "SNES", Platform.SNES },
			{ "GB", Platform.GB },
			{ "GBC", Platform.GBC },
			{ "GBA", Platform.GBA },
			{ "Genesis", Platform.Genesis },
			{ "MasterSystem", Platform.MasterSystem }
		};

		foreach (var (input, expected) in testCases) {
			var entity = new GameEntity {
				Id = 1,
				Slug = "test",
				Title = "Test",
				Platform = input
			};

			var model = entity.ToModel();
			model.Platform.Should().Be(expected, $"Platform '{input}' should map to {expected}");
		}
	}
}
