using DarkRepos.Core.Models;
using DarkRepos.Core.Services;
using FluentAssertions;
using NSubstitute;
using Xunit;

namespace DarkRepos.Tests.Services;

public class CachedContentServiceTests {
	private readonly IContentService _innerService;
	private readonly IContentCacheService _cacheService;
	private readonly CachedContentService _sut;

	public CachedContentServiceTests() {
		_innerService = Substitute.For<IContentService>();
		_cacheService = new ContentCacheService();
		_sut = new CachedContentService(_innerService, _cacheService);
	}

	[Fact]
	public async Task GetAllGamesAsync_FirstCall_CallsInnerService() {
		// Arrange
		var games = new List<Game> { CreateTestGame("dragon-quest") };
		_innerService.GetAllGamesAsync(Arg.Any<CancellationToken>()).Returns(games);

		// Act
		var result = await _sut.GetAllGamesAsync();

		// Assert
		result.Should().BeEquivalentTo(games);
		await _innerService.Received(1).GetAllGamesAsync(Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetAllGamesAsync_SecondCall_ReturnsCached() {
		// Arrange
		var games = new List<Game> { CreateTestGame("dragon-quest") };
		_innerService.GetAllGamesAsync(Arg.Any<CancellationToken>()).Returns(games);

		// Act
		await _sut.GetAllGamesAsync();
		await _sut.GetAllGamesAsync();

		// Assert - inner service should only be called once
		await _innerService.Received(1).GetAllGamesAsync(Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetGameBySlugAsync_FirstCall_CallsInnerService() {
		// Arrange
		var game = CreateTestGame("dragon-quest");
		_innerService.GetGameBySlugAsync("dragon-quest", Arg.Any<CancellationToken>()).Returns(game);

		// Act
		var result = await _sut.GetGameBySlugAsync("dragon-quest");

		// Assert
		result.Should().BeEquivalentTo(game);
		await _innerService.Received(1).GetGameBySlugAsync("dragon-quest", Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetGameBySlugAsync_SecondCall_ReturnsCached() {
		// Arrange
		var game = CreateTestGame("dragon-quest");
		_innerService.GetGameBySlugAsync("dragon-quest", Arg.Any<CancellationToken>()).Returns(game);

		// Act
		await _sut.GetGameBySlugAsync("dragon-quest");
		await _sut.GetGameBySlugAsync("dragon-quest");

		// Assert
		await _innerService.Received(1).GetGameBySlugAsync("dragon-quest", Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetGameBySlugAsync_DifferentSlugs_CallsInnerServiceForEach() {
		// Arrange
		var game1 = CreateTestGame("dragon-quest");
		var game2 = CreateTestGame("final-fantasy");
		_innerService.GetGameBySlugAsync("dragon-quest", Arg.Any<CancellationToken>()).Returns(game1);
		_innerService.GetGameBySlugAsync("final-fantasy", Arg.Any<CancellationToken>()).Returns(game2);

		// Act
		await _sut.GetGameBySlugAsync("dragon-quest");
		await _sut.GetGameBySlugAsync("final-fantasy");

		// Assert
		await _innerService.Received(1).GetGameBySlugAsync("dragon-quest", Arg.Any<CancellationToken>());
		await _innerService.Received(1).GetGameBySlugAsync("final-fantasy", Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetGamesByPlatformAsync_Caches() {
		// Arrange
		var games = new List<Game> { CreateTestGame("dragon-quest") };
		_innerService.GetGamesByPlatformAsync(Platform.NES, Arg.Any<CancellationToken>()).Returns(games);

		// Act
		await _sut.GetGamesByPlatformAsync(Platform.NES);
		await _sut.GetGamesByPlatformAsync(Platform.NES);

		// Assert
		await _innerService.Received(1).GetGamesByPlatformAsync(Platform.NES, Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetGamesBySeriesAsync_Caches() {
		// Arrange
		var games = new List<Game> { CreateTestGame("dragon-quest") };
		_innerService.GetGamesBySeriesAsync("Dragon Quest", Arg.Any<CancellationToken>()).Returns(games);

		// Act
		await _sut.GetGamesBySeriesAsync("Dragon Quest");
		await _sut.GetGamesBySeriesAsync("Dragon Quest");

		// Assert
		await _innerService.Received(1).GetGamesBySeriesAsync("Dragon Quest", Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetAllToolsAsync_Caches() {
		// Arrange
		var tools = new List<Tool> { CreateTestTool("hex-editor") };
		_innerService.GetAllToolsAsync(Arg.Any<CancellationToken>()).Returns(tools);

		// Act
		await _sut.GetAllToolsAsync();
		await _sut.GetAllToolsAsync();

		// Assert
		await _innerService.Received(1).GetAllToolsAsync(Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetToolBySlugAsync_Caches() {
		// Arrange
		var tool = CreateTestTool("hex-editor");
		_innerService.GetToolBySlugAsync("hex-editor", Arg.Any<CancellationToken>()).Returns(tool);

		// Act
		await _sut.GetToolBySlugAsync("hex-editor");
		await _sut.GetToolBySlugAsync("hex-editor");

		// Assert
		await _innerService.Received(1).GetToolBySlugAsync("hex-editor", Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetToolsByCategoryAsync_Caches() {
		// Arrange
		var tools = new List<Tool> { CreateTestTool("hex-editor") };
		_innerService.GetToolsByCategoryAsync(ToolCategory.Analysis, Arg.Any<CancellationToken>()).Returns(tools);

		// Act
		await _sut.GetToolsByCategoryAsync(ToolCategory.Analysis);
		await _sut.GetToolsByCategoryAsync(ToolCategory.Analysis);

		// Assert
		await _innerService.Received(1).GetToolsByCategoryAsync(ToolCategory.Analysis, Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetToolsForGameAsync_Caches() {
		// Arrange
		var tools = new List<Tool> { CreateTestTool("hex-editor") };
		_innerService.GetToolsForGameAsync("dragon-quest", Arg.Any<CancellationToken>()).Returns(tools);

		// Act
		await _sut.GetToolsForGameAsync("dragon-quest");
		await _sut.GetToolsForGameAsync("dragon-quest");

		// Assert
		await _innerService.Received(1).GetToolsForGameAsync("dragon-quest", Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetFeaturedGamesAsync_Caches() {
		// Arrange
		var games = new List<Game> { CreateTestGame("dragon-quest") };
		_innerService.GetFeaturedGamesAsync(6, Arg.Any<CancellationToken>()).Returns(games);

		// Act
		await _sut.GetFeaturedGamesAsync();
		await _sut.GetFeaturedGamesAsync();

		// Assert
		await _innerService.Received(1).GetFeaturedGamesAsync(6, Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task GetRecentUpdatesAsync_Caches() {
		// Arrange
		var updates = new List<object> { CreateTestGame("dragon-quest") };
		_innerService.GetRecentUpdatesAsync(10, Arg.Any<CancellationToken>()).Returns(updates);

		// Act
		await _sut.GetRecentUpdatesAsync();
		await _sut.GetRecentUpdatesAsync();

		// Assert
		await _innerService.Received(1).GetRecentUpdatesAsync(10, Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task InvalidateGameCache_ClearsGameCaches() {
		// Arrange
		var games = new List<Game> { CreateTestGame("dragon-quest") };
		_innerService.GetAllGamesAsync(Arg.Any<CancellationToken>()).Returns(games);

		// Act
		await _sut.GetAllGamesAsync();
		_sut.InvalidateGameCache();
		await _sut.GetAllGamesAsync();

		// Assert - should be called twice due to invalidation
		await _innerService.Received(2).GetAllGamesAsync(Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task InvalidateToolCache_ClearsToolCaches() {
		// Arrange
		var tools = new List<Tool> { CreateTestTool("hex-editor") };
		_innerService.GetAllToolsAsync(Arg.Any<CancellationToken>()).Returns(tools);

		// Act
		await _sut.GetAllToolsAsync();
		_sut.InvalidateToolCache();
		await _sut.GetAllToolsAsync();

		// Assert - should be called twice due to invalidation
		await _innerService.Received(2).GetAllToolsAsync(Arg.Any<CancellationToken>());
	}

	[Fact]
	public async Task InvalidateAll_ClearsAllCaches() {
		// Arrange
		var games = new List<Game> { CreateTestGame("dragon-quest") };
		var tools = new List<Tool> { CreateTestTool("hex-editor") };
		_innerService.GetAllGamesAsync(Arg.Any<CancellationToken>()).Returns(games);
		_innerService.GetAllToolsAsync(Arg.Any<CancellationToken>()).Returns(tools);

		// Act
		await _sut.GetAllGamesAsync();
		await _sut.GetAllToolsAsync();
		_sut.InvalidateAll();
		await _sut.GetAllGamesAsync();
		await _sut.GetAllToolsAsync();

		// Assert - both should be called twice
		await _innerService.Received(2).GetAllGamesAsync(Arg.Any<CancellationToken>());
		await _innerService.Received(2).GetAllToolsAsync(Arg.Any<CancellationToken>());
	}

	private static Game CreateTestGame(string slug) {
		return new Game {
			Slug = slug,
			Title = slug.Replace("-", " ").ToUpperInvariant(),
			Platform = Platform.NES,
			Series = "Test Series",
			Developer = "Test Developer",
			Publisher = "Test Publisher",
			ReleaseYear = 1990,
			Wiki = new WikiResources {
				HasRomMap = true,
				HasRamMap = false
			},
			DocumentationLevel = DocumentationLevel.Substantial
		};
	}

	private static Tool CreateTestTool(string slug) {
		return new Tool {
			Slug = slug,
			Name = slug.Replace("-", " ").ToUpperInvariant(),
			Category = ToolCategory.Analysis,
			Description = "Test tool",
			Version = "1.0",
			Author = "Test Author",
			License = "MIT",
			SupportedPlatforms = ["Windows"]
		};
	}
}
