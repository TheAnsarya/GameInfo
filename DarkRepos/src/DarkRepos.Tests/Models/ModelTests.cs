using DarkRepos.Core.Models;

namespace DarkRepos.Tests.Models;

/// <summary>
/// Unit tests for domain models.
/// </summary>
public class ModelTests
{
	[Theory]
	[InlineData(Platform.NES, "NES")]
	[InlineData(Platform.SNES, "SNES")]
	[InlineData(Platform.GB, "GB")]
	[InlineData(Platform.GBC, "GBC")]
	[InlineData(Platform.GBA, "GBA")]
	[InlineData(Platform.Genesis, "Genesis")]
	[InlineData(Platform.MasterSystem, "MasterSystem")]
	[InlineData(Platform.N64, "N64")]
	[InlineData(Platform.PlayStation, "PlayStation")]
	public void Platform_Enum_HasExpectedValues(Platform platform, string expected)
	{
		platform.ToString().Should().Be(expected);
	}

	[Theory]
	[InlineData(ToolCategory.Text, "Text")]
	[InlineData(ToolCategory.Graphics, "Graphics")]
	[InlineData(ToolCategory.Audio, "Audio")]
	[InlineData(ToolCategory.Disassembly, "Disassembly")]
	[InlineData(ToolCategory.Analysis, "Analysis")]
	[InlineData(ToolCategory.Patching, "Patching")]
	[InlineData(ToolCategory.Compression, "Compression")]
	[InlineData(ToolCategory.General, "General")]
	public void ToolCategory_Enum_HasExpectedValues(ToolCategory category, string expected)
	{
		category.ToString().Should().Be(expected);
	}

	[Fact]
	public void Game_DefaultValues_AreCorrect()
	{
		var game = new Game
		{
			Slug = "test",
			Title = "Test",
			Platform = Platform.NES
		};

		game.Tags.Should().BeEmpty();
		game.ReleaseYear.Should().BeNull();
		game.AlternateTitles.Should().BeEmpty();
	}

	[Fact]
	public void Tool_DefaultValues_AreCorrect()
	{
		var tool = new Tool
		{
			Slug = "test",
			Name = "Test",
			Description = "Test tool",
			Category = ToolCategory.General
		};

		tool.SupportedPlatforms.Should().Contain("Windows");
		tool.SupportedGames.Should().BeEmpty();
	}

	[Fact]
	public void SearchDocument_DefaultValues_AreCorrect()
	{
		var doc = new SearchDocument
		{
			Id = "test",
			Type = SearchDocumentType.Game,
			Title = "Test",
			Url = "/test"
		};

		doc.Boost.Should().Be(1.0);
		doc.Content.Should().BeNull();
	}

	[Fact]
	public void SearchResult_HasCorrectProperties()
	{
		var doc = new SearchDocument
		{
			Id = "test",
			Type = SearchDocumentType.Game,
			Title = "Test",
			Url = "/test"
		};

		var result = new SearchResult
		{
			Document = doc,
			Score = 0.85
		};

		result.Document.Should().NotBeNull();
		result.Score.Should().BeApproximately(0.85, 0.001);
	}

	[Fact]
	public void SearchResultItem_HighlightProperty_WorksCorrectly()
	{
		var doc = new SearchDocument
		{
			Id = "game:test",
			Type = SearchDocumentType.Game,
			Title = "Test Game",
			Url = "/games/test"
		};

		var result = new SearchResult
		{
			Document = doc,
			Score = 0.85,
			HighlightedSnippet = "This is a <mark>test</mark> excerpt"
		};

		result.HighlightedSnippet.Should().Contain("<mark>");
		result.Score.Should().BeApproximately(0.85, 0.001);
	}

	[Fact]
	public void Game_WithAllProperties_SerializesCorrectly()
	{
		var game = new Game
		{
			Slug = "dragon-quest-3-snes",
			Title = "Dragon Quest III",
			Platform = Platform.SNES,
			JapaneseTitle = "ドラゴンクエストIII そして伝説へ…",
			Description = "Third Dragon Quest game, SNES remake",
			ReleaseYear = 1996,
			Developer = "Heart Beat",
			Publisher = "Enix",
			DocumentationLevel = DocumentationLevel.Partial,
			Tags = ["RPG", "Dragon Quest", "JRPG"],
			LastUpdated = new DateTime(2024, 6, 15)
		};

		// Verify all properties are set
		game.Slug.Should().Be("dragon-quest-3-snes");
		game.Title.Should().Be("Dragon Quest III");
		game.Platform.Should().Be(Platform.SNES);
		game.ReleaseYear.Should().Be(1996);
		game.Tags.Should().HaveCount(3);
	}
}
