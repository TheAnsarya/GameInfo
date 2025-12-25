using System.Collections.Concurrent;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service for caching content to reduce file system and parsing operations.
/// </summary>
public interface IContentCacheService
{
	/// <summary>
	/// Gets an item from cache, or creates it using the factory if not present.
	/// </summary>
	/// <typeparam name="T">The type of cached item.</typeparam>
	/// <param name="key">The cache key.</param>
	/// <param name="factory">Factory function to create the item if not cached.</param>
	/// <param name="expiration">Optional cache expiration.</param>
	/// <returns>The cached or newly created item.</returns>
	Task<T> GetOrCreateAsync<T>(string key, Func<Task<T>> factory, TimeSpan? expiration = null);

	/// <summary>
	/// Gets an item from cache, or creates it synchronously.
	/// </summary>
	T GetOrCreate<T>(string key, Func<T> factory, TimeSpan? expiration = null);

	/// <summary>
	/// Tries to get an item from cache.
	/// </summary>
	/// <typeparam name="T">The type of cached item.</typeparam>
	/// <param name="key">The cache key.</param>
	/// <param name="value">The cached value, if found.</param>
	/// <returns>True if found in cache.</returns>
	bool TryGet<T>(string key, out T? value);

	/// <summary>
	/// Sets an item in cache.
	/// </summary>
	void Set<T>(string key, T value, TimeSpan? expiration = null);

	/// <summary>
	/// Removes an item from cache.
	/// </summary>
	/// <param name="key">The cache key.</param>
	void Remove(string key);

	/// <summary>
	/// Removes all items with keys matching the prefix.
	/// </summary>
	/// <param name="keyPrefix">The key prefix to match.</param>
	void RemoveByPrefix(string keyPrefix);

	/// <summary>
	/// Clears all cached items.
	/// </summary>
	void Clear();

	/// <summary>
	/// Gets cache statistics.
	/// </summary>
	CacheStatistics GetStatistics();
}

/// <summary>
/// Cache statistics information.
/// </summary>
public record CacheStatistics(
	int TotalItems,
	int Hits,
	int Misses,
	double HitRatio,
	long EstimatedSizeBytes
);

/// <summary>
/// In-memory content cache implementation.
/// </summary>
public class ContentCacheService : IContentCacheService
{
	private readonly ConcurrentDictionary<string, CacheEntry> _cache = new();
	private readonly TimeSpan _defaultExpiration = TimeSpan.FromMinutes(30);
	private int _hits;
	private int _misses;

	/// <inheritdoc />
	public async Task<T> GetOrCreateAsync<T>(string key, Func<Task<T>> factory, TimeSpan? expiration = null)
	{
		if (TryGet<T>(key, out var cached) && cached != null)
		{
			return cached;
		}

		var value = await factory();
		Set(key, value, expiration);
		return value;
	}

	/// <inheritdoc />
	public T GetOrCreate<T>(string key, Func<T> factory, TimeSpan? expiration = null)
	{
		if (TryGet<T>(key, out var cached) && cached != null)
		{
			return cached;
		}

		var value = factory();
		Set(key, value, expiration);
		return value;
	}

	/// <inheritdoc />
	public bool TryGet<T>(string key, out T? value)
	{
		CleanupExpired();

		if (_cache.TryGetValue(key, out var entry) && !entry.IsExpired)
		{
			Interlocked.Increment(ref _hits);
			entry.LastAccessed = DateTimeOffset.UtcNow;
			value = (T)entry.Value;
			return true;
		}

		Interlocked.Increment(ref _misses);
		value = default;
		return false;
	}

	/// <inheritdoc />
	public void Set<T>(string key, T value, TimeSpan? expiration = null)
	{
		if (value == null)
			return;

		var entry = new CacheEntry(
			value,
			DateTimeOffset.UtcNow,
			DateTimeOffset.UtcNow,
			expiration ?? _defaultExpiration
		);

		_cache.AddOrUpdate(key, entry, (_, _) => entry);
	}

	/// <inheritdoc />
	public void Remove(string key)
	{
		_cache.TryRemove(key, out _);
	}

	/// <inheritdoc />
	public void RemoveByPrefix(string keyPrefix)
	{
		var keysToRemove = _cache.Keys
			.Where(k => k.StartsWith(keyPrefix, StringComparison.OrdinalIgnoreCase))
			.ToList();

		foreach (var key in keysToRemove)
		{
			_cache.TryRemove(key, out _);
		}
	}

	/// <inheritdoc />
	public void Clear()
	{
		_cache.Clear();
		Interlocked.Exchange(ref _hits, 0);
		Interlocked.Exchange(ref _misses, 0);
	}

	/// <inheritdoc />
	public CacheStatistics GetStatistics()
	{
		var hits = _hits;
		var misses = _misses;
		var total = hits + misses;
		var hitRatio = total > 0 ? (double)hits / total : 0;

		// Estimate size based on key lengths and rough value size estimate
		var estimatedSize = _cache.Sum(kvp =>
			kvp.Key.Length * 2 + // Key size (UTF-16)
			EstimateObjectSize(kvp.Value.Value));

		return new CacheStatistics(
			_cache.Count,
			hits,
			misses,
			hitRatio,
			estimatedSize
		);
	}

	private void CleanupExpired()
	{
		// Cleanup every ~100 operations to avoid overhead
		if (_cache.Count < 100)
			return;

		var expiredKeys = _cache
			.Where(kvp => kvp.Value.IsExpired)
			.Select(kvp => kvp.Key)
			.ToList();

		foreach (var key in expiredKeys)
		{
			_cache.TryRemove(key, out _);
		}
	}

	private static long EstimateObjectSize(object obj)
	{
		return obj switch
		{
			string s => s.Length * 2,
			byte[] b => b.Length,
			ICollection<object> c => c.Count * 100, // Rough estimate
			_ => 100 // Default estimate
		};
	}

	private sealed class CacheEntry
	{
		public object Value { get; }
		public DateTimeOffset Created { get; }
		public DateTimeOffset LastAccessed { get; set; }
		public TimeSpan Expiration { get; }

		public bool IsExpired => DateTimeOffset.UtcNow - Created > Expiration;

		public CacheEntry(object value, DateTimeOffset created, DateTimeOffset lastAccessed, TimeSpan expiration)
		{
			Value = value;
			Created = created;
			LastAccessed = lastAccessed;
			Expiration = expiration;
		}
	}
}

/// <summary>
/// Cache key builders for common content types.
/// </summary>
public static class CacheKeys {
	// Game keys
	public static string Game(string slug) => $"game:{slug}";
	public static string GameBySlug(string slug) => $"game:{slug}";
	public static string AllGames() => "games:all";
	public static string GameList(string? platform = null) => platform == null ? "games:all" : $"games:platform:{platform}";
	public static string GamesByPlatform(string platform) => $"games:platform:{platform}";
	public static string GamesBySeries(string series) => $"games:series:{series}";
	public static string FeaturedGames(int count) => $"featured:games:{count}";

	// Tool keys
	public static string Tool(string slug) => $"tool:{slug}";
	public static string ToolBySlug(string slug) => $"tool:{slug}";
	public static string AllTools() => "tools:all";
	public static string ToolList(string? category = null) => category == null ? "tools:all" : $"tools:category:{category}";
	public static string ToolsByCategory(string category) => $"tools:category:{category}";
	public static string ToolsForGame(string gameSlug) => $"tools:game:{gameSlug}";

	// Content keys
	public static string Markdown(string path) => $"markdown:{path}";
	public static string Search(string query) => $"search:{query.ToLowerInvariant()}";
	public static string WikiUrl(string gameSlug, string resourceType) => $"wiki:{gameSlug}:{resourceType}";

	// Aggregate keys
	public static string RecentUpdates(int count) => $"recent:updates:{count}";
}
