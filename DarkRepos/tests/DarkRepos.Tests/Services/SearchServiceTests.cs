using DarkRepos.Core.Data;
using DarkRepos.Core.Models;
using DarkRepos.Core.Services;
using Microsoft.EntityFrameworkCore;

namespace DarkRepos.Tests.Services;

/// <summary>
/// Unit tests for the SearchService class.
/// Note: FTS5 doesn't work with InMemory database, so search tests are limited.
/// For full search testing, use SQLite file-based database.
/// </summary>
public class SearchServiceTests : IDisposable {
	private readonly DarkReposDbContext _context;
	private readonly SearchService _service;

	public SearchServiceTests() {
		var options = new DbContextOptionsBuilder<DarkReposDbContext>()
			.UseInMemoryDatabase(databaseName: Guid.NewGuid().ToString())
			.Options;

		_context = new DarkReposDbContext(options);
		_service = new SearchService(_context);

		SeedTestData();
	}

	private void SeedTestData() {
		var entries = new List<SearchIndexEntry>
		{
			new()
			{
				Id = 1,
				DocumentId = "game:dragon-warrior-4-nes",
				DocumentType = "Game",
				Title = "Dragon Warrior IV",
				Description = "Fourth installment in Dragon Quest series",
				Content = "Dragon Warrior IV Dragon Quest NES RPG Chunsoft Enix disassembly ROM hacking",
				Url = "/games/dragon-warrior-4-nes",
				Platform = "NES"
			},
			new()
			{
				Id = 2,
				DocumentId = "game:soul-blazer-snes",
				DocumentType = "Game",
				Title = "Soul Blazer",
				Description = "Action RPG by Quintet",
				Content = "Soul Blazer SNES action RPG Quintet Enix disassembly graphics extraction",
				Url = "/games/soul-blazer-snes",
				Platform = "SNES"
			},
			new()
			{
				Id = 3,
				DocumentId = "tool:atlas",
				DocumentType = "Tool",
				Title = "Atlas",
				Description = "Script insertion tool",
				Content = "Atlas script inserter text insertion ROM hacking NES SNES",
				Url = "/tools/atlas",
				Category = "Text"
			},
			new()
			{
				Id = 4,
				DocumentId = "game:robotrek-snes",
				DocumentType = "Game",
				Title = "Robotrek",
				Description = "Build and fight with robots",
				Content = "Robotrek SNES RPG Quintet robots inventions combinations",
				Url = "/games/robotrek-snes",
				Platform = "SNES"
			}
		};

		_context.SearchIndex.AddRange(entries);
		_context.SaveChanges();
	}

	public void Dispose() {
		_context.Dispose();
		GC.SuppressFinalize(this);
	}

	[Fact]
	public async Task SearchAsync_EmptyQuery_ReturnsEmpty() {
		// Arrange
		var query = new SearchQuery { Terms = "" };

		// Act
		var result = await _service.SearchAsync(query);

		// Assert
		result.Results.Should().BeEmpty();
		result.TotalCount.Should().Be(0);
	}

	[Fact]
	public async Task SearchAsync_ReturnsDurationMetric() {
		// Arrange
		var query = new SearchQuery { Terms = "test" };

		// Act
		var result = await _service.SearchAsync(query);

		// Assert
		result.Duration.Should().BeGreaterThanOrEqualTo(TimeSpan.Zero);
		result.Query.Should().Be(query);
	}

	[Fact]
	public async Task GetSuggestionsAsync_EmptyPrefix_ReturnsEmpty() {
		// Act
		var result = await _service.GetSuggestionsAsync("");

		// Assert
		result.Should().BeEmpty();
	}

	[Fact]
	public async Task GetSuggestionsAsync_ShortPrefix_ReturnsEmpty() {
		// Act
		var result = await _service.GetSuggestionsAsync("D");

		// Assert
		result.Should().BeEmpty();
	}

	[Fact]
	public async Task GetSuggestionsAsync_ValidPrefix_ReturnsTitles() {
		// Act
		var result = await _service.GetSuggestionsAsync("Dragon");

		// Assert
		result.Should().NotBeEmpty();
		result.Should().Contain(s => s.Contains("Dragon"));
	}

	[Fact]
	public async Task IndexDocumentAsync_AddsToIndex() {
		// Arrange
		var document = new SearchDocument {
			Id = "game:new-game",
			Type = SearchDocumentType.Game,
			Title = "New Test Game",
			Description = "A new test game",
			Content = "This is a new test game for indexing",
			Url = "/games/new-game",
			Platform = "NES"
		};

		// Act
		await _service.IndexDocumentAsync(document);

		// Assert
		var indexed = await _context.SearchIndex
			.FirstOrDefaultAsync(s => s.DocumentId == "game:new-game");
		indexed.Should().NotBeNull();
		indexed!.Title.Should().Be("New Test Game");
	}

	[Fact]
	public async Task IndexDocumentAsync_UpdatesExisting() {
		// Arrange
		var document = new SearchDocument {
			Id = "game:dragon-warrior-4-nes",
			Type = SearchDocumentType.Game,
			Title = "Dragon Warrior IV - Updated",
			Description = "Updated description",
			Url = "/games/dragon-warrior-4-nes"
		};

		// Act
		await _service.IndexDocumentAsync(document);

		// Assert
		var indexed = await _context.SearchIndex
			.FirstOrDefaultAsync(s => s.DocumentId == "game:dragon-warrior-4-nes");
		indexed.Should().NotBeNull();
		indexed!.Title.Should().Be("Dragon Warrior IV - Updated");
	}

	[Fact]
	public async Task RemoveDocumentAsync_RemovesFromIndex() {
		// Arrange
		var initialCount = await _context.SearchIndex.CountAsync();

		// Act
		await _service.RemoveDocumentAsync("game:dragon-warrior-4-nes");

		// Assert
		var afterCount = await _context.SearchIndex.CountAsync();
		afterCount.Should().Be(initialCount - 1);
	}

	[Fact]
	public async Task GetIndexCountAsync_ReturnsCorrectCount() {
		// Act
		var count = await _service.GetIndexCountAsync();

		// Assert
		count.Should().Be(4);
	}

	[Fact]
	public async Task IndexDocumentsAsync_AddMultipleDocuments() {
		// Arrange
		var documents = new List<SearchDocument>
		{
			new()
			{
				Id = "game:batch-1",
				Type = SearchDocumentType.Game,
				Title = "Batch Game 1",
				Url = "/games/batch-1"
			},
			new()
			{
				Id = "game:batch-2",
				Type = SearchDocumentType.Game,
				Title = "Batch Game 2",
				Url = "/games/batch-2"
			}
		};

		var initialCount = await _context.SearchIndex.CountAsync();

		// Act
		await _service.IndexDocumentsAsync(documents);

		// Assert
		var afterCount = await _context.SearchIndex.CountAsync();
		afterCount.Should().Be(initialCount + 2);
	}
}
