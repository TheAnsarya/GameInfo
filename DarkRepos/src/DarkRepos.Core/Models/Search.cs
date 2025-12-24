namespace DarkRepos.Core.Models;

/// <summary>
/// Represents a searchable document in the FTS5 index.
/// </summary>
public class SearchDocument
{
	/// <summary>
	/// Unique document identifier
	/// </summary>
	public required string Id { get; init; }

	/// <summary>
	/// Type of document (game, tool, doc, wiki)
	/// </summary>
	public required SearchDocumentType Type { get; init; }

	/// <summary>
	/// Document title (high relevance in search)
	/// </summary>
	public required string Title { get; init; }

	/// <summary>
	/// Document description or summary
	/// </summary>
	public string? Description { get; init; }

	/// <summary>
	/// Full text content for searching
	/// </summary>
	public string? Content { get; init; }

	/// <summary>
	/// URL path to the document
	/// </summary>
	public required string Url { get; init; }

	/// <summary>
	/// Platform if applicable (for games)
	/// </summary>
	public string? Platform { get; init; }

	/// <summary>
	/// Category if applicable (for tools)
	/// </summary>
	public string? Category { get; init; }

	/// <summary>
	/// Space-separated tags for filtering
	/// </summary>
	public string? Tags { get; init; }

	/// <summary>
	/// Search relevance boost factor
	/// </summary>
	public double Boost { get; init; } = 1.0;

	/// <summary>
	/// Last time the document was indexed
	/// </summary>
	public DateTimeOffset IndexedAt { get; init; } = DateTimeOffset.UtcNow;
}

/// <summary>
/// Type of searchable document
/// </summary>
public enum SearchDocumentType
{
	/// <summary>Game catalog entry</summary>
	Game = 1,

	/// <summary>Tool entry</summary>
	Tool = 2,

	/// <summary>Documentation page</summary>
	Documentation = 3,

	/// <summary>Wiki page content</summary>
	Wiki = 4,

	/// <summary>Guide or tutorial</summary>
	Guide = 5
}

/// <summary>
/// Represents a search result with relevance information.
/// </summary>
public class SearchResult
{
	/// <summary>
	/// The matching document
	/// </summary>
	public required SearchDocument Document { get; init; }

	/// <summary>
	/// Search relevance score
	/// </summary>
	public double Score { get; init; }

	/// <summary>
	/// Highlighted title with search term matches
	/// </summary>
	public string? HighlightedTitle { get; init; }

	/// <summary>
	/// Highlighted snippet with search term matches
	/// </summary>
	public string? HighlightedSnippet { get; init; }
}

/// <summary>
/// Search query parameters.
/// </summary>
public class SearchQuery
{
	/// <summary>
	/// The search terms
	/// </summary>
	public required string Terms { get; init; }

	/// <summary>
	/// Filter by document type
	/// </summary>
	public SearchDocumentType? Type { get; init; }

	/// <summary>
	/// Filter by platform
	/// </summary>
	public string? Platform { get; init; }

	/// <summary>
	/// Filter by category
	/// </summary>
	public string? Category { get; init; }

	/// <summary>
	/// Maximum results to return
	/// </summary>
	public int Limit { get; init; } = 20;

	/// <summary>
	/// Number of results to skip
	/// </summary>
	public int Offset { get; init; } = 0;
}

/// <summary>
/// Search results container with pagination info.
/// </summary>
public class SearchResults
{
	/// <summary>
	/// The matching results
	/// </summary>
	public required IReadOnlyList<SearchResult> Results { get; init; }

	/// <summary>
	/// Total number of matching documents
	/// </summary>
	public int TotalCount { get; init; }

	/// <summary>
	/// The original query
	/// </summary>
	public required SearchQuery Query { get; init; }

	/// <summary>
	/// Time taken to execute the search
	/// </summary>
	public TimeSpan Duration { get; init; }
}
