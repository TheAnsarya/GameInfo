using DarkRepos.Core.Models;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service for accessing game and tool content.
/// </summary>
public interface IContentService
{
	/// <summary>
	/// Get all games in the catalog.
	/// </summary>
	Task<IReadOnlyList<Game>> GetAllGamesAsync(CancellationToken cancellationToken = default);

	/// <summary>
	/// Get a game by its slug.
	/// </summary>
	Task<Game?> GetGameBySlugAsync(string slug, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get games filtered by platform.
	/// </summary>
	Task<IReadOnlyList<Game>> GetGamesByPlatformAsync(Platform platform, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get games in a series.
	/// </summary>
	Task<IReadOnlyList<Game>> GetGamesBySeriesAsync(string series, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get all tools in the catalog.
	/// </summary>
	Task<IReadOnlyList<Tool>> GetAllToolsAsync(CancellationToken cancellationToken = default);

	/// <summary>
	/// Get a tool by its slug.
	/// </summary>
	Task<Tool?> GetToolBySlugAsync(string slug, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get tools filtered by category.
	/// </summary>
	Task<IReadOnlyList<Tool>> GetToolsByCategoryAsync(ToolCategory category, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get tools for a specific game or platform.
	/// </summary>
	Task<IReadOnlyList<Tool>> GetToolsForGameAsync(string gameSlug, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get featured games for the home page.
	/// </summary>
	Task<IReadOnlyList<Game>> GetFeaturedGamesAsync(int count = 6, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get recently updated content.
	/// </summary>
	Task<IReadOnlyList<object>> GetRecentUpdatesAsync(int count = 10, CancellationToken cancellationToken = default);
}
