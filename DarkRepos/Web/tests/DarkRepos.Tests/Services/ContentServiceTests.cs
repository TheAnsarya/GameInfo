using DarkRepos.Core.Data;
using DarkRepos.Core.Models;
using DarkRepos.Core.Services;
using Microsoft.EntityFrameworkCore;

namespace DarkRepos.Tests.Services;

/// <summary>
/// Unit tests for the ContentService class.
/// </summary>
public class ContentServiceTests : IDisposable {
	private readonly DarkReposDbContext _context;
	private readonly ContentService _service;

	public ContentServiceTests() {
		var options = new DbContextOptionsBuilder<DarkReposDbContext>()
			.UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
			.Options;

		_context = new DarkReposDbContext(options);
		_service = new ContentService(_context);

		SeedTestData();
	}

	private void SeedTestData() {
		var games = new List<GameEntity>
		{
			new()
			{
				Id = 1,
				Slug = "dragon-warrior-4-nes",
				Title = "Dragon Warrior IV",
				Platform = "NES",
				Description = "Fourth installment in the Dragon Quest series",
				ReleaseYear = 1992,
				Developer = "Chunsoft",
				Publisher = "Enix",
				DocumentationLevel = 4,
				WikiBaseUrl = "/wiki/Dragon_Warrior_IV",
				TagsJson = "[\"RPG\", \"Dragon Quest\"]",
				HasRomMap = true,
				HasRamMap = true
			},
			new()
			{
				Id = 2,
				Slug = "final-fantasy-mystic-quest-snes",
				Title = "Final Fantasy Mystic Quest",
				Platform = "SNES",
				Description = "Simplified RPG for Western audiences",
				ReleaseYear = 1992,
				Developer = "Square",
				Publisher = "Square",
				DocumentationLevel = 2,
				WikiBaseUrl = "/wiki/Final_Fantasy_Mystic_Quest",
				TagsJson = "[\"RPG\", \"Final Fantasy\"]",
				HasRamMap = true
			},
			new()
			{
				Id = 3,
				Slug = "soul-blazer-snes",
				Title = "Soul Blazer",
				Platform = "SNES",
				Description = "Action RPG by Quintet",
				ReleaseYear = 1992,
				Developer = "Quintet",
				Publisher = "Enix",
				DocumentationLevel = 4,
				WikiBaseUrl = "/wiki/Soul_Blazer",
				TagsJson = "[\"Action RPG\", \"Quintet\"]",
				HasRomMap = true,
				HasRamMap = true
			}
		};

		_context.Games.AddRange(games);
		_context.SaveChanges();
	}

	public void Dispose() {
		_context.Dispose();
		GC.SuppressFinalize(this);
	}

	[Fact]
	public async Task GetAllGamesAsync_ReturnsAllGames() {
		// Act
		var result = await _service.GetAllGamesAsync();

		// Assert
		result.Should().HaveCount(3);
	}

	[Fact]
	public async Task GetGameBySlugAsync_ExistingSlug_ReturnsGame() {
		// Act
		var result = await _service.GetGameBySlugAsync("dragon-warrior-4-nes");

		// Assert
		result.Should().NotBeNull();
		result!.Title.Should().Be("Dragon Warrior IV");
		result.Platform.Should().Be(Platform.NES);
	}

	[Fact]
	public async Task GetGameBySlugAsync_NonExistingSlug_ReturnsNull() {
		// Act
		var result = await _service.GetGameBySlugAsync("nonexistent-game");

		// Assert
		result.Should().BeNull();
	}

	[Fact]
	public async Task GetGamesByPlatformAsync_NES_ReturnsNESGames() {
		// Act
		var result = await _service.GetGamesByPlatformAsync(Platform.NES);

		// Assert
		result.Should().HaveCount(1);
		result.First().Title.Should().Be("Dragon Warrior IV");
	}

	[Fact]
	public async Task GetGamesByPlatformAsync_SNES_ReturnsSNESGames() {
		// Act
		var result = await _service.GetGamesByPlatformAsync(Platform.SNES);

		// Assert
		result.Should().HaveCount(2);
		result.Should().Contain(g => g.Title == "Final Fantasy Mystic Quest");
		result.Should().Contain(g => g.Title == "Soul Blazer");
	}

	[Fact]
	public async Task GetFeaturedGamesAsync_ReturnsGamesOrderedByDocLevel() {
		// Act
		var result = await _service.GetFeaturedGamesAsync(2);

		// Assert
		result.Should().HaveCount(2);
		// Complete documentation (level 4) games should come first
		result.First().DocumentationLevel.Should().Be(DocumentationLevel.Complete);
	}

	[Fact]
	public async Task SaveGameAsync_NewGame_AddsToDatabase() {
		// Arrange
		var newGame = new Game {
			Slug = "robotrek-snes",
			Title = "Robotrek",
			Platform = Platform.SNES,
			Description = "Build robots and solve puzzles",
			ReleaseYear = 1994,
			Developer = "Quintet",
			Publisher = "Enix"
		};

		// Act
		await _service.SaveGameAsync(newGame);

		// Assert
		var saved = await _context.Games.FirstOrDefaultAsync(g => g.Slug == "robotrek-snes");
		saved.Should().NotBeNull();
		saved!.Title.Should().Be("Robotrek");
	}

	[Fact]
	public async Task DeleteGameAsync_ExistingGame_RemovesFromDatabase() {
		// Arrange
		var initialCount = await _context.Games.CountAsync();

		// Act
		await _service.DeleteGameAsync("dragon-warrior-4-nes");

		// Assert
		var afterCount = await _context.Games.CountAsync();
		afterCount.Should().Be(initialCount - 1);
	}

	[Fact]
	public async Task DeleteGameAsync_NonExistingGame_DoesNothing() {
		// Arrange
		var initialCount = await _context.Games.CountAsync();

		// Act
		await _service.DeleteGameAsync("nonexistent-game");

		// Assert
		var afterCount = await _context.Games.CountAsync();
		afterCount.Should().Be(initialCount);
	}
}
