using DarkRepos.Core.Services;
using FluentAssertions;

namespace DarkRepos.Tests.Services;

public class ContentCacheServiceTests {
	private readonly IContentCacheService _cache;

	public ContentCacheServiceTests() {
		_cache = new ContentCacheService();
	}

	[Fact]
	public void Set_AndTryGet_ReturnsValue() {
		// Arrange
		const string key = "test-key";
		const string value = "test-value";

		// Act
		_cache.Set(key, value);
		var found = _cache.TryGet<string>(key, out var retrieved);

		// Assert
		found.Should().BeTrue();
		retrieved.Should().Be(value);
	}

	[Fact]
	public void TryGet_WithMissingKey_ReturnsFalse() {
		// Arrange & Act
		var found = _cache.TryGet<string>("nonexistent", out var value);

		// Assert
		found.Should().BeFalse();
		value.Should().BeNull();
	}

	[Fact]
	public void GetOrCreate_WithMissingKey_CallsFactory() {
		// Arrange
		var factoryCalled = false;
		const string key = "factory-test";

		// Act
		var result = _cache.GetOrCreate(key, () => {
			factoryCalled = true;
			return "created-value";
		});

		// Assert
		factoryCalled.Should().BeTrue();
		result.Should().Be("created-value");
	}

	[Fact]
	public void GetOrCreate_WithExistingKey_DoesNotCallFactory() {
		// Arrange
		const string key = "existing-key";
		_cache.Set(key, "existing-value");
		var factoryCalled = false;

		// Act
		var result = _cache.GetOrCreate(key, () => {
			factoryCalled = true;
			return "new-value";
		});

		// Assert
		factoryCalled.Should().BeFalse();
		result.Should().Be("existing-value");
	}

	[Fact]
	public async Task GetOrCreateAsync_WithMissingKey_CallsFactory() {
		// Arrange
		var factoryCalled = false;
		const string key = "async-factory-test";

		// Act
		var result = await _cache.GetOrCreateAsync(key, async () => {
			factoryCalled = true;
			await Task.Delay(1);
			return "async-created-value";
		});

		// Assert
		factoryCalled.Should().BeTrue();
		result.Should().Be("async-created-value");
	}

	[Fact]
	public void Remove_RemovesKey() {
		// Arrange
		const string key = "remove-test";
		_cache.Set(key, "value");

		// Act
		_cache.Remove(key);
		var found = _cache.TryGet<string>(key, out _);

		// Assert
		found.Should().BeFalse();
	}

	[Fact]
	public void RemoveByPrefix_RemovesMatchingKeys() {
		// Arrange
		_cache.Set("game:dragon-warrior", "dw");
		_cache.Set("game:soul-blazer", "sb");
		_cache.Set("tool:atlas", "atlas");

		// Act
		_cache.RemoveByPrefix("game:");

		// Assert
		_cache.TryGet<string>("game:dragon-warrior", out _).Should().BeFalse();
		_cache.TryGet<string>("game:soul-blazer", out _).Should().BeFalse();
		_cache.TryGet<string>("tool:atlas", out _).Should().BeTrue();
	}

	[Fact]
	public void Clear_RemovesAllKeys() {
		// Arrange
		_cache.Set("key1", "value1");
		_cache.Set("key2", "value2");
		_cache.Set("key3", "value3");

		// Act
		_cache.Clear();

		// Assert
		_cache.TryGet<string>("key1", out _).Should().BeFalse();
		_cache.TryGet<string>("key2", out _).Should().BeFalse();
		_cache.TryGet<string>("key3", out _).Should().BeFalse();
	}

	[Fact]
	public void GetStatistics_ReturnsCorrectStats() {
		// Arrange
		_cache.Clear();
		_cache.Set("stat-test", "value");
		_cache.TryGet<string>("stat-test", out _); // hit
		_cache.TryGet<string>("nonexistent", out _); // miss

		// Act
		var stats = _cache.GetStatistics();

		// Assert
		stats.TotalItems.Should().Be(1);
		stats.Hits.Should().Be(1);
		stats.Misses.Should().Be(1);
		stats.HitRatio.Should().Be(0.5);
	}

	[Fact]
	public void CacheKeys_Game_ReturnsCorrectFormat() {
		// Act
		var key = CacheKeys.Game("dragon-warrior-nes");

		// Assert
		key.Should().Be("game:dragon-warrior-nes");
	}

	[Fact]
	public void CacheKeys_GameList_WithPlatform_ReturnsCorrectFormat() {
		// Act
		var key = CacheKeys.GameList("NES");

		// Assert
		key.Should().Be("games:platform:NES");
	}

	[Fact]
	public void CacheKeys_GameList_WithoutPlatform_ReturnsAllGames() {
		// Act
		var key = CacheKeys.GameList();

		// Assert
		key.Should().Be("games:all");
	}

	[Fact]
	public void CacheKeys_Search_NormalizesQuery() {
		// Act
		var key = CacheKeys.Search("Dragon Warrior");

		// Assert
		key.Should().Be("search:dragon warrior");
	}
}
