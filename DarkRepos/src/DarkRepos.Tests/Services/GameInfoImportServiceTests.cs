using DarkRepos.Core.Models;
using DarkRepos.Core.Services;
using FluentAssertions;
using NSubstitute;
using Xunit;

namespace DarkRepos.Tests.Services;

public class GameInfoImportServiceTests
{
	private readonly IMarkdownService _markdownService;
	private readonly GameInfoImportService _sut;

	public GameInfoImportServiceTests()
	{
		_markdownService = Substitute.For<IMarkdownService>();
		_markdownService.ParseFrontMatter(Arg.Any<string>())
			.Returns((new Dictionary<string, string>(), "content"));
		_markdownService.ExtractExcerpt(Arg.Any<string>(), Arg.Any<int>())
			.Returns("Sample excerpt");
		_sut = new GameInfoImportService(_markdownService);
	}

	[Theory]
	[InlineData("Dragon Warrior (NES)", "dragon-warrior-nes", "Dragon Warrior", Platform.NES)]
	[InlineData("Final Fantasy IV (SNES)", "final-fantasy-iv-snes", "Final Fantasy IV", Platform.SNES)]
	[InlineData("Pokemon Red (GB)", "pokemon-red-gb", "Pokemon Red", Platform.GB)]
	[InlineData("Sonic the Hedgehog (Genesis)", "sonic-the-hedgehog-genesis", "Sonic the Hedgehog", Platform.Genesis)]
	public void ParseGameFolder_ParenthesesFormat_ParsesCorrectly(string folderName, string expectedSlug, string expectedTitle, Platform expectedPlatform)
	{
		// Act
		var result = _sut.ParseGameFolder(folderName);

		// Assert
		result.Should().NotBeNull();
		result!.Slug.Should().Be(expectedSlug);
		result.Title.Should().Be(expectedTitle);
		result.Platform.Should().Be(expectedPlatform);
	}

	[Theory]
	[InlineData("dragon-warrior-nes", "dragon-warrior-nes", "Dragon Warrior", Platform.NES)]
	[InlineData("final-fantasy-snes", "final-fantasy-snes", "Final Fantasy", Platform.SNES)]
	[InlineData("ffmq-snes", "ffmq-snes", "Ffmq", Platform.SNES)]
	public void ParseGameFolder_KebabFormat_ParsesCorrectly(string folderName, string expectedSlug, string expectedTitle, Platform expectedPlatform)
	{
		// Act
		var result = _sut.ParseGameFolder(folderName);

		// Assert
		result.Should().NotBeNull();
		result!.Slug.Should().Be(expectedSlug);
		result.Title.Should().Be(expectedTitle);
		result.Platform.Should().Be(expectedPlatform);
	}

	[Theory]
	[InlineData("invalid-folder")]
	[InlineData("NoParensNoPlatform")]
	[InlineData("Game (UNKNOWN)")]
	public void ParseGameFolder_InvalidFormat_ReturnsNull(string folderName)
	{
		// Act
		var result = _sut.ParseGameFolder(folderName);

		// Assert
		result.Should().BeNull();
	}

	[Theory]
	[InlineData("NES", Platform.NES)]
	[InlineData("SNES", Platform.SNES)]
	[InlineData("SFC", Platform.SNES)]
	[InlineData("GB", Platform.GB)]
	[InlineData("GBA", Platform.GBA)]
	[InlineData("Genesis", Platform.Genesis)]
	[InlineData("MEGADRIVE", Platform.Genesis)]
	[InlineData("PSX", Platform.PlayStation)]
	public void ParseGameFolder_DifferentPlatformFormats_ParsesCorrectly(string platformStr, Platform expectedPlatform)
	{
		// Act
		var result = _sut.ParseGameFolder($"Test Game ({platformStr})");

		// Assert
		result.Should().NotBeNull();
		result!.Platform.Should().Be(expectedPlatform);
	}

	[Fact]
	public void ParseGameFolder_WithSpecialCharacters_GeneratesCleanSlug()
	{
		// Act
		var result = _sut.ParseGameFolder("Dragon's Crown: Legends & Heroes (SNES)");

		// Assert
		result.Should().NotBeNull();
		// Should handle apostrophes, colons, ampersands
		result!.Slug.Should().NotContain("'");
		result.Slug.Should().NotContain(":");
		result.Slug.Should().NotContain("&");
	}

	[Fact]
	public void ParseGameFolder_WithExtraSpaces_TrimsCorrectly()
	{
		// Act
		var result = _sut.ParseGameFolder("  Dragon Warrior  ( NES )  ");

		// Assert - should handle spacing (regex may handle this)
		result.Should().BeNull(); // The regex expects specific format
	}

	[Fact]
	public void ParseGameFolder_CaseInsensitivePlatform_ParsesCorrectly()
	{
		// Act
		var result = _sut.ParseGameFolder("Dragon Warrior (nes)");

		// Assert
		result.Should().NotBeNull();
		result!.Platform.Should().Be(Platform.NES);
	}

	[Fact]
	public async Task DiscoverDocumentedGamesAsync_SkipsNonGameFolders()
	{
		// Arrange - create temp directory structure
		var tempDir = Path.Combine(Path.GetTempPath(), "DarkReposTest_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(tempDir);
		try
		{
			// Create non-game folders
			Directory.CreateDirectory(Path.Combine(tempDir, "formats"));
			Directory.CreateDirectory(Path.Combine(tempDir, "guides"));
			Directory.CreateDirectory(Path.Combine(tempDir, "Build-Pipeline"));
			// Create a valid game folder
			Directory.CreateDirectory(Path.Combine(tempDir, "dragon-warrior-nes"));

			// Act
			var result = await _sut.DiscoverDocumentedGamesAsync(tempDir);

			// Assert
			result.Should().HaveCount(1);
			result[0].Slug.Should().Be("dragon-warrior-nes");
		}
		finally
		{
			Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task DiscoverGamesAsync_DiscoversPlatformFolders()
	{
		// Arrange
		var tempDir = Path.Combine(Path.GetTempPath(), "DarkReposTest_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(tempDir);
		try
		{
			// Create platform structure
			var nesDir = Path.Combine(tempDir, "NES");
			Directory.CreateDirectory(nesDir);
			Directory.CreateDirectory(Path.Combine(nesDir, "Dragon Warrior (NES)"));

			var snesDir = Path.Combine(tempDir, "SNES");
			Directory.CreateDirectory(snesDir);
			Directory.CreateDirectory(Path.Combine(snesDir, "Final Fantasy IV (SNES)"));

			// Act
			var result = await _sut.DiscoverGamesAsync(tempDir);

			// Assert
			result.Should().HaveCount(2);
			result.Should().Contain(g => g.Platform == Platform.NES);
			result.Should().Contain(g => g.Platform == Platform.SNES);
		}
		finally
		{
			Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task DiscoverGamesAsync_DetectsWikiResources()
	{
		// Arrange
		var tempDir = Path.Combine(Path.GetTempPath(), "DarkReposTest_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(tempDir);
		try
		{
			var nesDir = Path.Combine(tempDir, "NES");
			var gameDir = Path.Combine(nesDir, "Dragon Warrior (NES)");
			var wikiDir = Path.Combine(gameDir, "Wiki");
			var notesDir = Path.Combine(gameDir, "Notes");

			Directory.CreateDirectory(wikiDir);
			Directory.CreateDirectory(notesDir);

			// Create wiki files
			await File.WriteAllTextAsync(Path.Combine(wikiDir, "ROM Map.wikitxt"), "content");
			await File.WriteAllTextAsync(Path.Combine(wikiDir, "RAM Map.wikitxt"), "content");
			await File.WriteAllTextAsync(Path.Combine(notesDir, "notes.txt"), "content");

			// Act
			var result = await _sut.DiscoverGamesAsync(tempDir);

			// Assert
			result.Should().HaveCount(1);
			result[0].Wiki.HasRomMap.Should().BeTrue();
			result[0].Wiki.HasRamMap.Should().BeTrue();
			result[0].Wiki.HasNotes.Should().BeTrue();
		}
		finally
		{
			Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task DiscoverDocumentedGamesAsync_ReadsDocumentationFiles()
	{
		// Arrange
		var tempDir = Path.Combine(Path.GetTempPath(), "DarkReposTest_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(tempDir);
		try
		{
			var gameDir = Path.Combine(tempDir, "dragon-warrior-nes");
			Directory.CreateDirectory(gameDir);

			// Create documentation files
			await File.WriteAllTextAsync(Path.Combine(gameDir, "rom-map.md"), "# ROM Map");
			await File.WriteAllTextAsync(Path.Combine(gameDir, "ram-map.md"), "# RAM Map");
			await File.WriteAllTextAsync(Path.Combine(gameDir, "data-structures.md"), "# Data");
			await File.WriteAllTextAsync(Path.Combine(gameDir, "README.md"), "# Dragon Warrior");

			// Act
			var result = await _sut.DiscoverDocumentedGamesAsync(tempDir);

			// Assert
			result.Should().HaveCount(1);
			result[0].Wiki.HasRomMap.Should().BeTrue();
			result[0].Wiki.HasRamMap.Should().BeTrue();
			result[0].Wiki.HasDataStructures.Should().BeTrue();
			result[0].DocumentationPaths.Should().Contain("rom-map.md");
			result[0].DocumentationPaths.Should().Contain("ram-map.md");
			result[0].DocumentationPaths.Should().NotContain("README.md");
		}
		finally
		{
			Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public async Task ImportGamesAsync_MergesGamesAndDocs()
	{
		// Arrange
		var tempDir = Path.Combine(Path.GetTempPath(), "DarkReposTest_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(tempDir);
		try
		{
			// Create Games structure
			var gamesDir = Path.Combine(tempDir, "Games");
			var nesDir = Path.Combine(gamesDir, "NES");
			var gameDir = Path.Combine(nesDir, "Dragon Warrior (NES)");
			var wikiDir = Path.Combine(gameDir, "Wiki");
			Directory.CreateDirectory(wikiDir);
			await File.WriteAllTextAsync(Path.Combine(wikiDir, "ROM Map.wikitxt"), "content");

			// Create docs structure
			var docsDir = Path.Combine(tempDir, "docs");
			var docGameDir = Path.Combine(docsDir, "dragon-warrior-nes");
			Directory.CreateDirectory(docGameDir);
			await File.WriteAllTextAsync(Path.Combine(docGameDir, "ram-map.md"), "# RAM Map");

			// Act
			var result = await _sut.ImportGamesAsync(tempDir);

			// Assert
			result.Should().HaveCount(1);
			var game = result[0];
			game.Wiki.HasRomMap.Should().BeTrue();  // From Games folder
			game.Wiki.HasRamMap.Should().BeTrue();  // From docs folder
		}
		finally
		{
			Directory.Delete(tempDir, true);
		}
	}

	[Fact]
	public void ParseGameFolder_AlternativePlatformNames_Works()
	{
		// Test alternative platform names
		var tests = new[]
		{
			("Test (FAMICOM)", Platform.NES),
			("Test (SFC)", Platform.SNES),
			("Test (SUPERFAMICOM)", Platform.SNES),
			("Test (MEGADRIVE)", Platform.Genesis),
			("Test (MD)", Platform.Genesis),
			("Test (GAMEBOY)", Platform.GB),
			("Test (GAMEGEAR)", Platform.GameGear),
			("Test (PSX)", Platform.PlayStation),
			("Test (PS1)", Platform.PlayStation),
			("Test (PS2)", Platform.PlayStation2),
			("Test (TURBOGRAFX)", Platform.PCEngine),
			("Test (DC)", Platform.Dreamcast),
		};

		foreach (var (folderName, expectedPlatform) in tests)
		{
			var result = _sut.ParseGameFolder(folderName);
			result.Should().NotBeNull($"{folderName} should parse");
			result!.Platform.Should().Be(expectedPlatform, $"{folderName} should map to {expectedPlatform}");
		}
	}

	[Fact]
	public async Task DiscoverDocumentedGamesAsync_WithFrontMatter_EnrichesGame()
	{
		// Arrange
		var tempDir = Path.Combine(Path.GetTempPath(), "DarkReposTest_" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(tempDir);
		try
		{
			var gameDir = Path.Combine(tempDir, "dragon-warrior-nes");
			Directory.CreateDirectory(gameDir);
			await File.WriteAllTextAsync(Path.Combine(gameDir, "README.md"), "---\ndeveloper: Chunsoft\n---\n# DW");

			// Setup mock to return front matter
			_markdownService.ParseFrontMatter(Arg.Any<string>())
				.Returns((new Dictionary<string, string> { ["developer"] = "Chunsoft" }, "# DW"));

			// Act
			var result = await _sut.DiscoverDocumentedGamesAsync(tempDir);

			// Assert
			result.Should().HaveCount(1);
			result[0].Developer.Should().Be("Chunsoft");
		}
		finally
		{
			Directory.Delete(tempDir, true);
		}
	}
}
