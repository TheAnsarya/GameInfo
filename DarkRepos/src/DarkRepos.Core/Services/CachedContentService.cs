using DarkRepos.Core.Models;

namespace DarkRepos.Core.Services;

/// <summary>
/// Decorator that adds caching to IContentService operations.
/// </summary>
public class CachedContentService : IContentService {
	private readonly IContentService _inner;
	private readonly IContentCacheService _cache;

	public CachedContentService(IContentService inner, IContentCacheService cache) {
		_inner = inner;
		_cache = cache;
	}

	public async Task<IReadOnlyList<Game>> GetAllGamesAsync(CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.AllGames(),
			() => _inner.GetAllGamesAsync(cancellationToken),
			TimeSpan.FromMinutes(15)
		);
	}

	public async Task<Game?> GetGameBySlugAsync(string slug, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.GameBySlug(slug),
			() => _inner.GetGameBySlugAsync(slug, cancellationToken),
			TimeSpan.FromMinutes(30)
		);
	}

	public async Task<IReadOnlyList<Game>> GetGamesByPlatformAsync(Platform platform, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.GamesByPlatform(platform.ToString()),
			() => _inner.GetGamesByPlatformAsync(platform, cancellationToken),
			TimeSpan.FromMinutes(15)
		);
	}

	public async Task<IReadOnlyList<Game>> GetGamesBySeriesAsync(string series, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.GamesBySeries(series),
			() => _inner.GetGamesBySeriesAsync(series, cancellationToken),
			TimeSpan.FromMinutes(15)
		);
	}

	public async Task<IReadOnlyList<Tool>> GetAllToolsAsync(CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.AllTools(),
			() => _inner.GetAllToolsAsync(cancellationToken),
			TimeSpan.FromMinutes(15)
		);
	}

	public async Task<Tool?> GetToolBySlugAsync(string slug, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.ToolBySlug(slug),
			() => _inner.GetToolBySlugAsync(slug, cancellationToken),
			TimeSpan.FromMinutes(30)
		);
	}

	public async Task<IReadOnlyList<Tool>> GetToolsByCategoryAsync(ToolCategory category, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.ToolsByCategory(category.ToString()),
			() => _inner.GetToolsByCategoryAsync(category, cancellationToken),
			TimeSpan.FromMinutes(15)
		);
	}

	public async Task<IReadOnlyList<Tool>> GetToolsForGameAsync(string gameSlug, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.ToolsForGame(gameSlug),
			() => _inner.GetToolsForGameAsync(gameSlug, cancellationToken),
			TimeSpan.FromMinutes(15)
		);
	}

	public async Task<IReadOnlyList<Game>> GetFeaturedGamesAsync(int count = 6, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.FeaturedGames(count),
			() => _inner.GetFeaturedGamesAsync(count, cancellationToken),
			TimeSpan.FromMinutes(5)  // Shorter cache for featured items
		);
	}

	public async Task<IReadOnlyList<object>> GetRecentUpdatesAsync(int count = 10, CancellationToken cancellationToken = default) {
		return await _cache.GetOrCreateAsync(
			CacheKeys.RecentUpdates(count),
			() => _inner.GetRecentUpdatesAsync(count, cancellationToken),
			TimeSpan.FromMinutes(5)  // Shorter cache for recent items
		);
	}

	/// <summary>
	/// Invalidates all game-related caches.
	/// </summary>
	public void InvalidateGameCache() {
		_cache.RemoveByPrefix("game:");
		_cache.Remove(CacheKeys.AllGames());
		_cache.RemoveByPrefix("games:");
		_cache.RemoveByPrefix("featured:");
		_cache.RemoveByPrefix("recent:");
	}

	/// <summary>
	/// Invalidates all tool-related caches.
	/// </summary>
	public void InvalidateToolCache() {
		_cache.RemoveByPrefix("tool:");
		_cache.Remove(CacheKeys.AllTools());
		_cache.RemoveByPrefix("tools:");
		_cache.RemoveByPrefix("recent:");
	}

	/// <summary>
	/// Invalidates all caches.
	/// </summary>
	public void InvalidateAll() {
		_cache.Clear();
	}
}
