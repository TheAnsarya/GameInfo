using System.Diagnostics;
using DarkRepos.Core.Data;
using DarkRepos.Core.Models;
using Microsoft.EntityFrameworkCore;

namespace DarkRepos.Core.Services;

/// <summary>
/// Implementation of ISearchService that uses SQLite FTS5 for full-text search.
/// </summary>
public class SearchService : ISearchService {
	private readonly DarkReposDbContext _context;

	public SearchService(DarkReposDbContext context) {
		_context = context;
	}

	public async Task<SearchResults> SearchAsync(SearchQuery query, CancellationToken cancellationToken = default) {
		var stopwatch = Stopwatch.StartNew();

		// Sanitize and prepare search terms for FTS5
		var sanitizedTerms = SanitizeSearchTerms(query.Terms);

		if (string.IsNullOrWhiteSpace(sanitizedTerms)) {
			return new SearchResults {
				Results = [],
				TotalCount = 0,
				Query = query,
				Duration = stopwatch.Elapsed
			};
		}

		// Build the FTS5 query
		// Use MATCH with proper escaping for FTS5 syntax
		var ftsQuery = BuildFts5Query(sanitizedTerms);

		// Get matching document IDs from FTS5 with scores
		var matchingIds = await GetFtsMatchesAsync(ftsQuery, cancellationToken);

		// Get the actual entries and apply filters
		var entriesQuery = _context.SearchIndex.AsQueryable();

		// Apply type filter
		if (query.Type.HasValue) {
			var typeString = query.Type.Value.ToString();
			entriesQuery = entriesQuery.Where(e => e.DocumentType == typeString);
		}

		// Apply platform filter
		if (!string.IsNullOrEmpty(query.Platform)) {
			entriesQuery = entriesQuery.Where(e => e.Platform == query.Platform);
		}

		// Apply category filter
		if (!string.IsNullOrEmpty(query.Category)) {
			entriesQuery = entriesQuery.Where(e => e.Category == query.Category);
		}

		// Get entries that match the FTS query
		var entries = await entriesQuery
			.Where(e => matchingIds.Keys.Contains(e.Id))
			.ToListAsync(cancellationToken);

		// Convert to results with scores
		var results = entries
			.Select(e => new SearchResult {
				Document = e.ToModel(),
				Score = matchingIds.GetValueOrDefault(e.Id, 0) * e.Boost,
				HighlightedTitle = HighlightMatches(e.Title, query.Terms),
				HighlightedSnippet = HighlightMatches(e.Description ?? e.Content ?? "", query.Terms)
			})
			.OrderByDescending(r => r.Score)
			.ToList();

		var totalCount = results.Count;

		// Apply pagination
		var pagedResults = results
			.Skip(query.Offset)
			.Take(query.Limit)
			.ToList();

		stopwatch.Stop();

		return new SearchResults {
			Results = pagedResults,
			TotalCount = totalCount,
			Query = query,
			Duration = stopwatch.Elapsed
		};
	}

	public async Task<IReadOnlyList<string>> GetSuggestionsAsync(string prefix, int limit = 5, CancellationToken cancellationToken = default) {
		if (string.IsNullOrWhiteSpace(prefix) || prefix.Length < 2)
			return [];

		var sanitizedPrefix = SanitizeSearchTerms(prefix);

		// Get unique titles that start with the prefix
		var suggestions = await _context.SearchIndex
			.Where(e => EF.Functions.Like(e.Title, $"{sanitizedPrefix}%"))
			.Select(e => e.Title)
			.Distinct()
			.Take(limit)
			.ToListAsync(cancellationToken);

		return suggestions;
	}

	public async Task IndexDocumentAsync(SearchDocument document, CancellationToken cancellationToken = default) {
		var existing = await _context.SearchIndex
			.FirstOrDefaultAsync(e => e.DocumentId == document.Id, cancellationToken);

		if (existing != null) {
			// Update existing entry
			var updated = document.ToEntity(existing.Id);
			_context.Entry(existing).CurrentValues.SetValues(updated);
		} else {
			// Add new entry
			var entity = document.ToEntity();
			_context.SearchIndex.Add(entity);
		}

		await _context.SaveChangesAsync(cancellationToken);
	}

	public async Task IndexDocumentsAsync(IEnumerable<SearchDocument> documents, CancellationToken cancellationToken = default) {
		var documentList = documents.ToList();
		var documentIds = documentList.Select(d => d.Id).ToHashSet();

		// Get existing entries
		var existing = await _context.SearchIndex
			.Where(e => documentIds.Contains(e.DocumentId))
			.ToDictionaryAsync(e => e.DocumentId, cancellationToken);

		foreach (var document in documentList) {
			if (existing.TryGetValue(document.Id, out var existingEntry)) {
				// Update existing
				var updated = document.ToEntity(existingEntry.Id);
				_context.Entry(existingEntry).CurrentValues.SetValues(updated);
			} else {
				// Add new
				var entity = document.ToEntity();
				_context.SearchIndex.Add(entity);
			}
		}

		await _context.SaveChangesAsync(cancellationToken);
	}

	public async Task RemoveDocumentAsync(string id, CancellationToken cancellationToken = default) {
		var existing = await _context.SearchIndex
			.FirstOrDefaultAsync(e => e.DocumentId == id, cancellationToken);

		if (existing != null) {
			_context.SearchIndex.Remove(existing);
			await _context.SaveChangesAsync(cancellationToken);
		}
	}

	public async Task RebuildIndexAsync(CancellationToken cancellationToken = default) {
		// Clear all existing index entries
		_context.SearchIndex.RemoveRange(_context.SearchIndex);
		await _context.SaveChangesAsync(cancellationToken);

		// Rebuild FTS5 index
		await _context.Database.ExecuteSqlRawAsync(
			"INSERT INTO SearchFts(SearchFts) VALUES('rebuild')",
			cancellationToken);
	}

	public async Task<int> GetIndexCountAsync(CancellationToken cancellationToken = default) {
		return await _context.SearchIndex.CountAsync(cancellationToken);
	}

	/// <summary>
	/// Gets matching row IDs and scores from the FTS5 index.
	/// </summary>
	private async Task<Dictionary<int, double>> GetFtsMatchesAsync(string ftsQuery, CancellationToken cancellationToken) {
		var results = new Dictionary<int, double>();

		try {
			// Query the FTS5 table for matches with BM25 scores
			var sql = $@"
				SELECT rowid, bm25(SearchFts, 1.0, 0.75, 0.5, 0.25, 0.1) as score
				FROM SearchFts
				WHERE SearchFts MATCH @p0
				ORDER BY score
			";

			var connection = _context.Database.GetDbConnection();
			await connection.OpenAsync(cancellationToken);

			using var command = connection.CreateCommand();
			command.CommandText = sql;
			var parameter = command.CreateParameter();
			parameter.ParameterName = "@p0";
			parameter.Value = ftsQuery;
			command.Parameters.Add(parameter);

			using var reader = await command.ExecuteReaderAsync(cancellationToken);
			while (await reader.ReadAsync(cancellationToken)) {
				var rowId = reader.GetInt32(0);
				var score = Math.Abs(reader.GetDouble(1)); // BM25 returns negative scores
				results[rowId] = score;
			}
		} catch {
			// If FTS5 query fails, fall back to empty results
			// This can happen if the FTS5 table doesn't exist yet
		}

		return results;
	}

	/// <summary>
	/// Sanitizes search terms to prevent SQL injection and FTS5 syntax errors.
	/// </summary>
	private static string SanitizeSearchTerms(string terms) {
		if (string.IsNullOrWhiteSpace(terms))
			return string.Empty;

		// Remove any FTS5 operators and special characters
		var sanitized = terms
			.Replace("\"", "")
			.Replace("'", "")
			.Replace("*", "")
			.Replace("(", "")
			.Replace(")", "")
			.Replace("-", " ")
			.Replace("+", " ")
			.Replace(":", " ")
			.Replace("^", " ");

		return sanitized.Trim();
	}

	/// <summary>
	/// Builds an FTS5 query from sanitized search terms.
	/// </summary>
	private static string BuildFts5Query(string terms) {
		// Split into words and add prefix matching for the last word
		var words = terms.Split(' ', StringSplitOptions.RemoveEmptyEntries);

		if (words.Length == 0)
			return string.Empty;

		if (words.Length == 1) {
			// Single word: use prefix matching
			return $"\"{words[0]}\"*";
		}

		// Multiple words: quote each word, add prefix matching to last word
		var quotedWords = words.Take(words.Length - 1).Select(w => $"\"{w}\"");
		var lastWord = $"\"{words[^1]}\"*";

		return string.Join(" ", quotedWords.Append(lastWord));
	}

	/// <summary>
	/// Highlights matching terms in text.
	/// </summary>
	private static string HighlightMatches(string text, string searchTerms) {
		if (string.IsNullOrEmpty(text) || string.IsNullOrWhiteSpace(searchTerms))
			return text;

		var terms = searchTerms.Split(' ', StringSplitOptions.RemoveEmptyEntries);
		var result = text;

		foreach (var term in terms) {
			if (term.Length < 2)
				continue;

			// Simple case-insensitive highlight with <mark> tags
			var index = result.IndexOf(term, StringComparison.OrdinalIgnoreCase);
			if (index >= 0) {
				var matched = result.Substring(index, term.Length);
				result = result.Substring(0, index) + $"<mark>{matched}</mark>" + result.Substring(index + term.Length);
			}
		}

		// Truncate if too long and return snippet around first match
		if (result.Length > 200) {
			var markIndex = result.IndexOf("<mark>");
			if (markIndex > 50) {
				result = "..." + result.Substring(markIndex - 50);
			}

			if (result.Length > 200) {
				result = result.Substring(0, 200) + "...";
			}
		}

		return result;
	}
}
