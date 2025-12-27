using Microsoft.Extensions.Logging;

namespace DarkRepos.Core.Services;

/// <summary>
/// Implementation of IDocumentationService that loads markdown files from a docs folder.
/// </summary>
public class DocumentationService : IDocumentationService
{
	private readonly IMarkdownService _markdownService;
	private readonly ILogger<DocumentationService>? _logger;
	private readonly string _docsPath;

	// Category configuration
	private static readonly Dictionary<string, (string Title, string Description, string Icon)> CategoryInfo = new()
	{
		["guides"] = ("Guides & Tutorials", "Step-by-step guides for common ROM hacking tasks.", "📖"),
		["formats"] = ("Format Specifications", "Technical documentation for ROM formats and data structures.", "📋"),
		["tools"] = ("Tool Documentation", "Detailed documentation for ROM hacking tools.", "🔧"),
		["platforms"] = ("Platform References", "Technical references for NES, SNES, and other platforms.", "🎮"),
		["getting-started"] = ("Getting Started", "New to ROM hacking? Start here with beginner-friendly guides.", "🚀"),
		["contributing"] = ("Contributing", "Learn how to contribute to Dark Repos documentation.", "🤝"),
		["api"] = ("API Reference", "API documentation for developers.", "💻"),
	};

	public DocumentationService(IMarkdownService markdownService, string docsPath, ILogger<DocumentationService>? logger = null)
	{
		_markdownService = markdownService;
		_docsPath = docsPath;
		_logger = logger;
	}

	public async Task<DocumentationPage?> GetPageAsync(string path)
	{
		var filePath = GetFilePath(path);
		if (filePath == null || !File.Exists(filePath))
		{
			_logger?.LogWarning("Documentation page not found: {Path}", path);
			return null;
		}

		try
		{
			var markdown = await File.ReadAllTextAsync(filePath);
			return await ParseDocumentationPageAsync(path, markdown, filePath);
		}
		catch (Exception ex)
		{
			_logger?.LogError(ex, "Error loading documentation page: {Path}", path);
			return null;
		}
	}

	public async Task<IReadOnlyList<DocumentationPage>> GetCategoryPagesAsync(string category)
	{
		var categoryPath = Path.Combine(_docsPath, category);
		if (!Directory.Exists(categoryPath))
		{
			_logger?.LogWarning("Documentation category not found: {Category}", category);
			return [];
		}

		var pages = new List<DocumentationPage>();
		var files = Directory.GetFiles(categoryPath, "*.md", SearchOption.TopDirectoryOnly);

		foreach (var file in files.OrderBy(f => f))
		{
			var relativePath = GetRelativePath(file);
			var page = await GetPageAsync(relativePath);
			if (page != null)
			{
				pages.Add(page);
			}
		}

		return pages;
	}

	public Task<DocumentationToc> GetTableOfContentsAsync()
	{
		var categories = new List<DocumentationCategory>();

		// Scan for directories
		if (Directory.Exists(_docsPath))
		{
			foreach (var dir in Directory.GetDirectories(_docsPath))
			{
				var dirName = Path.GetFileName(dir);
				// Skip hidden and special directories
				if (dirName.StartsWith('.') || dirName.StartsWith('~') || dirName.StartsWith('_'))
				{
					continue;
				}

				var pages = GetCategoryPageSummaries(dir);
				if (pages.Count == 0) continue;

				var (title, description, icon) = CategoryInfo.GetValueOrDefault(
					dirName,
					(ToTitleCase(dirName), $"Documentation for {dirName}.", "📄"));

				categories.Add(new DocumentationCategory
				{
					Path = dirName,
					Title = title,
					Description = description,
					Icon = icon,
					Pages = pages
				});
			}

			// Also add root-level markdown files
			var rootPages = GetRootPageSummaries();
			if (rootPages.Count > 0)
			{
				categories.Insert(0, new DocumentationCategory
				{
					Path = "",
					Title = "Overview",
					Description = "Main documentation pages.",
					Icon = "📚",
					Pages = rootPages
				});
			}
		}

		return Task.FromResult(new DocumentationToc { Categories = categories });
	}

	public async Task<IReadOnlyList<DocumentationPage>> SearchAsync(string query)
	{
		if (string.IsNullOrWhiteSpace(query) || !Directory.Exists(_docsPath))
		{
			return [];
		}

		var results = new List<DocumentationPage>();
		var queryLower = query.ToLowerInvariant();
		var files = Directory.GetFiles(_docsPath, "*.md", SearchOption.AllDirectories);

		foreach (var file in files)
		{
			try
			{
				var content = await File.ReadAllTextAsync(file);
				if (content.Contains(query, StringComparison.OrdinalIgnoreCase))
				{
					var path = GetRelativePath(file);
					var page = await ParseDocumentationPageAsync(path, content, file);
					if (page != null)
					{
						results.Add(page);
					}
				}
			}
			catch
			{
				// Skip files that can't be read
			}
		}

		// Sort by title match then content match
		return results
			.OrderByDescending(p => p.Title.Contains(query, StringComparison.OrdinalIgnoreCase))
			.ThenBy(p => p.Title)
			.ToList();
	}

	private string? GetFilePath(string path)
	{
		// Normalize path
		path = path.Replace('/', Path.DirectorySeparatorChar).TrimStart(Path.DirectorySeparatorChar);

		// Try with .md extension
		var withExtension = Path.Combine(_docsPath, path + ".md");
		if (File.Exists(withExtension)) return withExtension;

		// Try as-is (if extension already included)
		var asIs = Path.Combine(_docsPath, path);
		if (File.Exists(asIs)) return asIs;

		// Try as directory with README.md
		var readme = Path.Combine(_docsPath, path, "README.md");
		if (File.Exists(readme)) return readme;

		// Try as directory with index.md
		var index = Path.Combine(_docsPath, path, "index.md");
		if (File.Exists(index)) return index;

		return null;
	}

	private string GetRelativePath(string filePath)
	{
		var relative = Path.GetRelativePath(_docsPath, filePath);
		// Remove .md extension
		if (relative.EndsWith(".md", StringComparison.OrdinalIgnoreCase))
		{
			relative = relative[..^3];
		}
		// Use forward slashes
		return relative.Replace(Path.DirectorySeparatorChar, '/');
	}

	private async Task<DocumentationPage?> ParseDocumentationPageAsync(string path, string markdown, string filePath)
	{
		var html = _markdownService.ToHtml(markdown);
		var title = _markdownService.ExtractTitle(markdown) ?? ToTitleCase(Path.GetFileNameWithoutExtension(filePath));
		var excerpt = _markdownService.ExtractExcerpt(markdown, 200);
		var headings = _markdownService.ExtractHeadings(markdown);
		var (frontMatter, _) = _markdownService.ParseFrontMatter(markdown);

		// Use front matter title if available
		if (frontMatter.TryGetValue("title", out var fmTitle) && !string.IsNullOrWhiteSpace(fmTitle))
		{
			title = fmTitle;
		}

		// Use front matter description if available
		if (frontMatter.TryGetValue("description", out var fmDescription) && !string.IsNullOrWhiteSpace(fmDescription))
		{
			excerpt = fmDescription;
		}

		// Determine category from path
		var category = "";
		var pathParts = path.Split('/');
		if (pathParts.Length > 1)
		{
			category = pathParts[0];
		}

		DateTime? lastModified = null;
		try
		{
			lastModified = File.GetLastWriteTimeUtc(filePath);
		}
		catch
		{
			// Ignore
		}

		return new DocumentationPage
		{
			Path = path,
			Title = title,
			Description = excerpt,
			Markdown = markdown,
			Html = html,
			Headings = headings.Select(h => new HeadingInfo
			{
				Level = h.Level,
				Text = h.Text,
				Id = h.Id
			}).ToList(),
			Category = category,
			LastModified = lastModified,
			Metadata = frontMatter
		};
	}

	private List<DocumentationPageSummary> GetCategoryPageSummaries(string categoryPath)
	{
		var summaries = new List<DocumentationPageSummary>();
		if (!Directory.Exists(categoryPath)) return summaries;

		foreach (var file in Directory.GetFiles(categoryPath, "*.md").OrderBy(f => f))
		{
			var fileName = Path.GetFileNameWithoutExtension(file);
			// Skip README and index
			if (fileName.Equals("README", StringComparison.OrdinalIgnoreCase) ||
				fileName.Equals("index", StringComparison.OrdinalIgnoreCase))
			{
				continue;
			}

			var title = ToTitleCase(fileName);
			var description = "";

			// Try to extract title from file
			try
			{
				var firstLines = File.ReadLines(file).Take(10).ToList();
				var titleLine = firstLines.FirstOrDefault(l => l.StartsWith("# "));
				if (titleLine != null)
				{
					title = titleLine[2..].Trim();
				}
				// Get description from next paragraph
				var descStart = firstLines.FindIndex(l => !string.IsNullOrWhiteSpace(l) && !l.StartsWith("#"));
				if (descStart >= 0)
				{
					description = firstLines[descStart].Trim();
					if (description.Length > 100)
					{
						description = description[..97] + "...";
					}
				}
			}
			catch
			{
				// Use defaults
			}

			var categoryName = Path.GetFileName(categoryPath);
			summaries.Add(new DocumentationPageSummary
			{
				Path = $"{categoryName}/{fileName}",
				Title = title,
				Description = description,
				Order = summaries.Count
			});
		}

		return summaries;
	}

	private List<DocumentationPageSummary> GetRootPageSummaries()
	{
		var summaries = new List<DocumentationPageSummary>();
		if (!Directory.Exists(_docsPath)) return summaries;

		foreach (var file in Directory.GetFiles(_docsPath, "*.md").OrderBy(f => f))
		{
			var fileName = Path.GetFileNameWithoutExtension(file);
			// Skip README and hidden files
			if (fileName.Equals("README", StringComparison.OrdinalIgnoreCase) ||
				fileName.StartsWith('.'))
			{
				continue;
			}

			var title = ToTitleCase(fileName);
			try
			{
				var firstLine = File.ReadLines(file).FirstOrDefault(l => l.StartsWith("# "));
				if (firstLine != null)
				{
					title = firstLine[2..].Trim();
				}
			}
			catch
			{
				// Use default
			}

			summaries.Add(new DocumentationPageSummary
			{
				Path = fileName,
				Title = title,
				Description = "",
				Order = summaries.Count
			});
		}

		return summaries;
	}

	private static string ToTitleCase(string input)
	{
		if (string.IsNullOrEmpty(input)) return input;

		// Replace hyphens and underscores with spaces
		var words = input.Replace('-', ' ').Replace('_', ' ').Split(' ', StringSplitOptions.RemoveEmptyEntries);

		return string.Join(" ", words.Select(w =>
			char.ToUpperInvariant(w[0]) + (w.Length > 1 ? w[1..] : "")));
	}
}
