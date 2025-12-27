using Microsoft.Extensions.Logging;

namespace DarkRepos.Core.Services;

/// <summary>
/// Cached wrapper for DocumentationService that uses IContentCacheService.
/// </summary>
public class CachedDocumentationService : IDocumentationService
{
	private readonly IDocumentationService _inner;
	private readonly IContentCacheService _cache;
	private readonly ILogger<CachedDocumentationService>? _logger;
	private readonly TimeSpan _cacheExpiration;

	private const string CacheKeyPrefix = "docs:";
	private const string PageCacheKey = "page:";
	private const string CategoryCacheKey = "category:";
	private const string TocCacheKey = "toc";
	private const string SearchCacheKey = "search:";

	public CachedDocumentationService(
		IDocumentationService inner,
		IContentCacheService cache,
		ILogger<CachedDocumentationService>? logger = null,
		TimeSpan? cacheExpiration = null)
	{
		_inner = inner;
		_cache = cache;
		_logger = logger;
		_cacheExpiration = cacheExpiration ?? TimeSpan.FromMinutes(30);
	}

	public async Task<DocumentationPage?> GetPageAsync(string path)
	{
		var cacheKey = $"{CacheKeyPrefix}{PageCacheKey}{path.ToLowerInvariant()}";

		return await _cache.GetOrCreateAsync(cacheKey, async () =>
		{
			_logger?.LogDebug("Cache miss for documentation page: {Path}", path);
			return await _inner.GetPageAsync(path);
		}, _cacheExpiration);
	}

	public async Task<IReadOnlyList<DocumentationPage>> GetCategoryPagesAsync(string category)
	{
		var cacheKey = $"{CacheKeyPrefix}{CategoryCacheKey}{category.ToLowerInvariant()}";

		return await _cache.GetOrCreateAsync(cacheKey, async () =>
		{
			_logger?.LogDebug("Cache miss for documentation category: {Category}", category);
			return await _inner.GetCategoryPagesAsync(category);
		}, _cacheExpiration);
	}

	public async Task<DocumentationToc> GetTableOfContentsAsync()
	{
		var cacheKey = $"{CacheKeyPrefix}{TocCacheKey}";

		return await _cache.GetOrCreateAsync(cacheKey, async () =>
		{
			_logger?.LogDebug("Cache miss for documentation table of contents");
			return await _inner.GetTableOfContentsAsync();
		}, _cacheExpiration);
	}

	public async Task<IReadOnlyList<DocumentationPage>> SearchAsync(string query)
	{
		if (string.IsNullOrWhiteSpace(query))
		{
			return [];
		}

		// Normalize query for cache key
		var normalizedQuery = query.Trim().ToLowerInvariant();
		var cacheKey = $"{CacheKeyPrefix}{SearchCacheKey}{normalizedQuery}";

		return await _cache.GetOrCreateAsync(cacheKey, async () =>
		{
			_logger?.LogDebug("Cache miss for documentation search: {Query}", query);
			return await _inner.SearchAsync(query);
		}, _cacheExpiration);
	}

	/// <summary>
	/// Invalidates all cached documentation.
	/// </summary>
	public void InvalidateAll()
	{
		_cache.RemoveByPrefix(CacheKeyPrefix);
		_logger?.LogInformation("Invalidated all documentation cache");
	}

	/// <summary>
	/// Invalidates a specific page from cache.
	/// </summary>
	public void InvalidatePage(string path)
	{
		var cacheKey = $"{CacheKeyPrefix}{PageCacheKey}{path.ToLowerInvariant()}";
		_cache.Remove(cacheKey);
		// Also invalidate search results since they might contain this page
		_cache.RemoveByPrefix($"{CacheKeyPrefix}{SearchCacheKey}");
		// And TOC in case it references the page
		_cache.Remove($"{CacheKeyPrefix}{TocCacheKey}");
		_logger?.LogDebug("Invalidated documentation page cache: {Path}", path);
	}

	/// <summary>
	/// Invalidates a category from cache.
	/// </summary>
	public void InvalidateCategory(string category)
	{
		var cacheKey = $"{CacheKeyPrefix}{CategoryCacheKey}{category.ToLowerInvariant()}";
		_cache.Remove(cacheKey);
		// Also invalidate TOC and search
		_cache.Remove($"{CacheKeyPrefix}{TocCacheKey}");
		_cache.RemoveByPrefix($"{CacheKeyPrefix}{SearchCacheKey}");
		_logger?.LogDebug("Invalidated documentation category cache: {Category}", category);
	}
}
