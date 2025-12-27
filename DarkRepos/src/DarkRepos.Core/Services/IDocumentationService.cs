using DarkRepos.Core.Models;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service for loading and managing documentation content.
/// </summary>
public interface IDocumentationService
{
	/// <summary>
	/// Gets a documentation page by its path.
	/// </summary>
	/// <param name="path">Path relative to docs folder (e.g., "guides/getting-started").</param>
	/// <returns>Documentation page or null if not found.</returns>
	Task<DocumentationPage?> GetPageAsync(string path);

	/// <summary>
	/// Gets all documentation pages for a category.
	/// </summary>
	/// <param name="category">Category path (e.g., "guides", "formats").</param>
	/// <returns>List of pages in the category.</returns>
	Task<IReadOnlyList<DocumentationPage>> GetCategoryPagesAsync(string category);

	/// <summary>
	/// Gets the documentation table of contents.
	/// </summary>
	/// <returns>Hierarchical table of contents.</returns>
	Task<DocumentationToc> GetTableOfContentsAsync();

	/// <summary>
	/// Searches documentation content.
	/// </summary>
	/// <param name="query">Search query.</param>
	/// <returns>Matching documentation pages.</returns>
	Task<IReadOnlyList<DocumentationPage>> SearchAsync(string query);
}

/// <summary>
/// A documentation page with rendered content.
/// </summary>
public class DocumentationPage
{
	/// <summary>
	/// Path to the page (without extension).
	/// </summary>
	public string Path { get; init; } = "";

	/// <summary>
	/// Page title extracted from front matter or first heading.
	/// </summary>
	public string Title { get; init; } = "";

	/// <summary>
	/// Page description/excerpt.
	/// </summary>
	public string Description { get; init; } = "";

	/// <summary>
	/// Raw markdown content.
	/// </summary>
	public string Markdown { get; init; } = "";

	/// <summary>
	/// Rendered HTML content.
	/// </summary>
	public string Html { get; init; } = "";

	/// <summary>
	/// Table of contents for the page.
	/// </summary>
	public IReadOnlyList<HeadingInfo> Headings { get; init; } = [];

	/// <summary>
	/// Category this page belongs to.
	/// </summary>
	public string Category { get; init; } = "";

	/// <summary>
	/// Last modified date.
	/// </summary>
	public DateTime? LastModified { get; init; }

	/// <summary>
	/// Front matter metadata.
	/// </summary>
	public Dictionary<string, string> Metadata { get; init; } = [];
}

/// <summary>
/// Table of contents for documentation.
/// </summary>
public class DocumentationToc
{
	/// <summary>
	/// Root categories in the documentation.
	/// </summary>
	public IReadOnlyList<DocumentationCategory> Categories { get; init; } = [];
}

/// <summary>
/// A documentation category with pages.
/// </summary>
public class DocumentationCategory
{
	/// <summary>
	/// Category path/slug.
	/// </summary>
	public string Path { get; init; } = "";

	/// <summary>
	/// Display title.
	/// </summary>
	public string Title { get; init; } = "";

	/// <summary>
	/// Category description.
	/// </summary>
	public string Description { get; init; } = "";

	/// <summary>
	/// Icon emoji or class.
	/// </summary>
	public string Icon { get; init; } = "📄";

	/// <summary>
	/// Pages in this category.
	/// </summary>
	public IReadOnlyList<DocumentationPageSummary> Pages { get; init; } = [];
}

/// <summary>
/// Summary of a documentation page for listings.
/// </summary>
public class DocumentationPageSummary
{
	/// <summary>
	/// Page path.
	/// </summary>
	public string Path { get; init; } = "";

	/// <summary>
	/// Page title.
	/// </summary>
	public string Title { get; init; } = "";

	/// <summary>
	/// Short description.
	/// </summary>
	public string Description { get; init; } = "";

	/// <summary>
	/// Sort order.
	/// </summary>
	public int Order { get; init; }
}

/// <summary>
/// Information about a heading for table of contents.
/// </summary>
public class HeadingInfo
{
	/// <summary>
	/// Heading level (1-6).
	/// </summary>
	public int Level { get; init; }

	/// <summary>
	/// Heading text.
	/// </summary>
	public string Text { get; init; } = "";

	/// <summary>
	/// Generated ID for anchor links.
	/// </summary>
	public string Id { get; init; } = "";
}
