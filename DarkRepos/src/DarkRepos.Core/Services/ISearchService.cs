using DarkRepos.Core.Models;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service for full-text search functionality.
/// </summary>
public interface ISearchService
{
	/// <summary>
	/// Search across all indexed content.
	/// </summary>
	Task<SearchResults> SearchAsync(SearchQuery query, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get search suggestions as user types.
	/// </summary>
	Task<IReadOnlyList<string>> GetSuggestionsAsync(string prefix, int limit = 5, CancellationToken cancellationToken = default);

	/// <summary>
	/// Index a document for searching.
	/// </summary>
	Task IndexDocumentAsync(SearchDocument document, CancellationToken cancellationToken = default);

	/// <summary>
	/// Index multiple documents at once.
	/// </summary>
	Task IndexDocumentsAsync(IEnumerable<SearchDocument> documents, CancellationToken cancellationToken = default);

	/// <summary>
	/// Remove a document from the index.
	/// </summary>
	Task RemoveDocumentAsync(string id, CancellationToken cancellationToken = default);

	/// <summary>
	/// Rebuild the entire search index.
	/// </summary>
	Task RebuildIndexAsync(CancellationToken cancellationToken = default);

	/// <summary>
	/// Get the total number of indexed documents.
	/// </summary>
	Task<int> GetIndexCountAsync(CancellationToken cancellationToken = default);
}
