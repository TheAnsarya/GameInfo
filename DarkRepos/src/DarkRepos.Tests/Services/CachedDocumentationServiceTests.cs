using DarkRepos.Core.Services;
using FluentAssertions;
using Microsoft.Extensions.Logging;
using NSubstitute;
using Xunit;

namespace DarkRepos.Tests.Services;

public class CachedDocumentationServiceTests
{
	private readonly IDocumentationService _innerService;
	private readonly IContentCacheService _cacheService;
	private readonly ILogger<CachedDocumentationService> _logger;
	private readonly CachedDocumentationService _sut;

	public CachedDocumentationServiceTests()
	{
		_innerService = Substitute.For<IDocumentationService>();
		_cacheService = new ContentCacheService();  // Use real cache for integration testing
		_logger = Substitute.For<ILogger<CachedDocumentationService>>();
		_sut = new CachedDocumentationService(_innerService, _cacheService, _logger, TimeSpan.FromMinutes(5));
	}

	[Fact]
	public async Task GetPageAsync_CachesResult()
	{
		// Arrange
		var path = "guides/getting-started";
		var page = new DocumentationPage
		{
			Path = path,
			Title = "Getting Started",
			Description = "A guide",
			Markdown = "# Getting Started",
			Html = "<h1>Getting Started</h1>"
		};
		_innerService.GetPageAsync(path).Returns(page);

		// Act
		var result1 = await _sut.GetPageAsync(path);
		var result2 = await _sut.GetPageAsync(path);

		// Assert
		result1.Should().Be(page);
		result2.Should().Be(page);
		await _innerService.Received(1).GetPageAsync(path);  // Only called once
	}

	[Fact]
	public async Task GetPageAsync_CacheKeyIsCaseInsensitive()
	{
		// Arrange
		var path = "Guides/Getting-Started";
		var page = new DocumentationPage
		{
			Path = path,
			Title = "Getting Started",
			Description = "A guide",
			Markdown = "# Getting Started",
			Html = "<h1>Getting Started</h1>"
		};
		_innerService.GetPageAsync(Arg.Any<string>()).Returns(page);

		// Act
		var result1 = await _sut.GetPageAsync("guides/getting-started");
		var result2 = await _sut.GetPageAsync("GUIDES/GETTING-STARTED");
		var result3 = await _sut.GetPageAsync("Guides/Getting-Started");

		// Assert
		await _innerService.Received(1).GetPageAsync(Arg.Any<string>());
	}

	[Fact]
	public async Task GetCategoryPagesAsync_CachesResult()
	{
		// Arrange
		var category = "guides";
		var pages = new List<DocumentationPage> {
			new() { Path = "guides/page1", Title = "Page 1", Markdown = "", Html = "", Description = "" },
			new() { Path = "guides/page2", Title = "Page 2", Markdown = "", Html = "", Description = "" }
		};
		_innerService.GetCategoryPagesAsync(category).Returns(pages);

		// Act
		var result1 = await _sut.GetCategoryPagesAsync(category);
		var result2 = await _sut.GetCategoryPagesAsync(category);

		// Assert
		result1.Should().BeEquivalentTo(pages);
		result2.Should().BeEquivalentTo(pages);
		await _innerService.Received(1).GetCategoryPagesAsync(category);
	}

	[Fact]
	public async Task GetTableOfContentsAsync_CachesResult()
	{
		// Arrange
		var toc = new DocumentationToc
		{
			Categories = [
				new DocumentationCategory { Path = "guides", Title = "Guides", Description = "", Icon = "📖" }
			]
		};
		_innerService.GetTableOfContentsAsync().Returns(toc);

		// Act
		var result1 = await _sut.GetTableOfContentsAsync();
		var result2 = await _sut.GetTableOfContentsAsync();

		// Assert
		result1.Should().Be(toc);
		result2.Should().Be(toc);
		await _innerService.Received(1).GetTableOfContentsAsync();
	}

	[Fact]
	public async Task SearchAsync_CachesResult()
	{
		// Arrange
		var query = "getting started";
		var results = new List<DocumentationPage> {
			new() { Path = "guides/getting-started", Title = "Getting Started", Markdown = "", Html = "", Description = "" }
		};
		_innerService.SearchAsync(query).Returns(results);

		// Act
		var result1 = await _sut.SearchAsync(query);
		var result2 = await _sut.SearchAsync(query);

		// Assert
		result1.Should().BeEquivalentTo(results);
		result2.Should().BeEquivalentTo(results);
		await _innerService.Received(1).SearchAsync(query);
	}

	[Fact]
	public async Task SearchAsync_ReturnsEmptyForWhitespaceQuery()
	{
		// Act
		var result1 = await _sut.SearchAsync("");
		var result2 = await _sut.SearchAsync("   ");

		// Assert
		result1.Should().BeEmpty();
		result2.Should().BeEmpty();
		await _innerService.DidNotReceive().SearchAsync(Arg.Any<string>());
	}

	[Fact]
	public async Task SearchAsync_NormalizesQueryForCacheKey()
	{
		// Arrange
		var results = new List<DocumentationPage> {
			new() { Path = "guides/test", Title = "Test", Markdown = "", Html = "", Description = "" }
		};
		_innerService.SearchAsync("test query").Returns(results);

		// Act - Same query with different casing/whitespace
		var result1 = await _sut.SearchAsync("test query");
		var result2 = await _sut.SearchAsync("  TEST QUERY  ");
		var result3 = await _sut.SearchAsync("Test Query");

		// Assert
		await _innerService.Received(1).SearchAsync(Arg.Any<string>());
	}

	[Fact]
	public void InvalidateAll_ClearsAllDocsCacheEntries()
	{
		// Arrange - populate cache
		_cacheService.Set("docs:page:test", "value");
		_cacheService.Set("docs:category:guides", "value");
		_cacheService.Set("docs:toc", "value");
		_cacheService.Set("other:key", "other-value");

		// Act
		_sut.InvalidateAll();

		// Assert
		_cacheService.TryGet<string>("docs:page:test", out _).Should().BeFalse();
		_cacheService.TryGet<string>("docs:category:guides", out _).Should().BeFalse();
		_cacheService.TryGet<string>("docs:toc", out _).Should().BeFalse();
		_cacheService.TryGet<string>("other:key", out var other).Should().BeTrue();
		other.Should().Be("other-value");
	}

	[Fact]
	public void InvalidatePage_ClearsPageAndRelatedCaches()
	{
		// Arrange
		_cacheService.Set("docs:page:guides/test", "page-value");
		_cacheService.Set("docs:search:test", "search-value");
		_cacheService.Set("docs:toc", "toc-value");
		_cacheService.Set("docs:category:guides", "category-value");

		// Act
		_sut.InvalidatePage("guides/test");

		// Assert
		_cacheService.TryGet<string>("docs:page:guides/test", out _).Should().BeFalse();
		_cacheService.TryGet<string>("docs:search:test", out _).Should().BeFalse();
		_cacheService.TryGet<string>("docs:toc", out _).Should().BeFalse();
		// Category should not be affected
		_cacheService.TryGet<string>("docs:category:guides", out _).Should().BeTrue();
	}

	[Fact]
	public void InvalidateCategory_ClearsCategoryAndRelatedCaches()
	{
		// Arrange
		_cacheService.Set("docs:category:guides", "category-value");
		_cacheService.Set("docs:search:test", "search-value");
		_cacheService.Set("docs:toc", "toc-value");
		_cacheService.Set("docs:page:guides/test", "page-value");

		// Act
		_sut.InvalidateCategory("guides");

		// Assert
		_cacheService.TryGet<string>("docs:category:guides", out _).Should().BeFalse();
		_cacheService.TryGet<string>("docs:search:test", out _).Should().BeFalse();
		_cacheService.TryGet<string>("docs:toc", out _).Should().BeFalse();
		// Individual pages should not be affected
		_cacheService.TryGet<string>("docs:page:guides/test", out _).Should().BeTrue();
	}

	[Fact]
	public async Task GetPageAsync_ReturnsNullWhenInnerReturnsNull()
	{
		// Arrange
		_innerService.GetPageAsync("nonexistent").Returns((DocumentationPage?)null);

		// Act
		var result = await _sut.GetPageAsync("nonexistent");

		// Assert
		result.Should().BeNull();
	}

	[Fact]
	public async Task CacheExpiration_IsRespected()
	{
		// Arrange
		var shortCache = new CachedDocumentationService(
			_innerService, _cacheService, _logger, TimeSpan.FromMilliseconds(50));

		var page = new DocumentationPage
		{
			Path = "test",
			Title = "Test",
			Markdown = "",
			Html = "",
			Description = ""
		};
		_innerService.GetPageAsync("expiration-test").Returns(page);

		// Act
		await shortCache.GetPageAsync("expiration-test");
		await Task.Delay(100);  // Wait for cache to expire
		await shortCache.GetPageAsync("expiration-test");

		// Assert - should have been called twice (once for initial, once after expiration)
		await _innerService.Received(2).GetPageAsync("expiration-test");
	}
}
