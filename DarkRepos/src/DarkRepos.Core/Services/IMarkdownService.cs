namespace DarkRepos.Core.Services;

/// <summary>
/// Service for parsing and rendering Markdown content.
/// </summary>
public interface IMarkdownService {
	/// <summary>
	/// Converts Markdown text to HTML.
	/// </summary>
	/// <param name="markdown">The Markdown text to convert.</param>
	/// <returns>The rendered HTML string.</returns>
	string ToHtml(string markdown);

	/// <summary>
	/// Converts Markdown text to HTML with custom options.
	/// </summary>
	/// <param name="markdown">The Markdown text to convert.</param>
	/// <param name="options">The rendering options.</param>
	/// <returns>The rendered HTML string.</returns>
	string ToHtml(string markdown, MarkdownRenderOptions options);

	/// <summary>
	/// Extracts plain text from Markdown content (strips formatting).
	/// </summary>
	/// <param name="markdown">The Markdown text to process.</param>
	/// <returns>Plain text without Markdown formatting.</returns>
	string ToPlainText(string markdown);

	/// <summary>
	/// Extracts the first heading from Markdown content.
	/// </summary>
	/// <param name="markdown">The Markdown text to process.</param>
	/// <returns>The text of the first heading, or null if no heading found.</returns>
	string? ExtractTitle(string markdown);

	/// <summary>
	/// Extracts the first paragraph as a summary/excerpt.
	/// </summary>
	/// <param name="markdown">The Markdown text to process.</param>
	/// <param name="maxLength">Maximum length of the excerpt.</param>
	/// <returns>The excerpt text.</returns>
	string ExtractExcerpt(string markdown, int maxLength = 200);

	/// <summary>
	/// Extracts all headings from Markdown content for table of contents.
	/// </summary>
	/// <param name="markdown">The Markdown text to process.</param>
	/// <returns>List of headings with their level and text.</returns>
	IReadOnlyList<MarkdownHeading> ExtractHeadings(string markdown);

	/// <summary>
	/// Parses YAML front matter from Markdown content.
	/// </summary>
	/// <param name="markdown">The Markdown text with optional front matter.</param>
	/// <returns>Tuple of (front matter dictionary, content without front matter).</returns>
	(Dictionary<string, string> FrontMatter, string Content) ParseFrontMatter(string markdown);
}

/// <summary>
/// Options for Markdown rendering.
/// </summary>
public class MarkdownRenderOptions {
	/// <summary>
	/// Whether to enable syntax highlighting for code blocks.
	/// </summary>
	public bool EnableSyntaxHighlighting { get; set; } = true;

	/// <summary>
	/// Whether to enable automatic linking of URLs.
	/// </summary>
	public bool EnableAutoLinks { get; set; } = true;

	/// <summary>
	/// Whether to enable task lists (checkboxes).
	/// </summary>
	public bool EnableTaskLists { get; set; } = true;

	/// <summary>
	/// Whether to enable tables.
	/// </summary>
	public bool EnableTables { get; set; } = true;

	/// <summary>
	/// Whether to add IDs to headings for anchor links.
	/// </summary>
	public bool EnableHeadingIds { get; set; } = true;

	/// <summary>
	/// Whether to open external links in a new tab.
	/// </summary>
	public bool ExternalLinksInNewTab { get; set; } = true;

	/// <summary>
	/// Base URL for relative links.
	/// </summary>
	public string? BaseUrl { get; set; }

	/// <summary>
	/// CSS class prefix for code blocks.
	/// </summary>
	public string CodeBlockClass { get; set; } = "language-";

	/// <summary>
	/// Default render options.
	/// </summary>
	public static MarkdownRenderOptions Default => new();
}

/// <summary>
/// Represents a heading extracted from Markdown content.
/// </summary>
public record MarkdownHeading(int Level, string Text, string Id);
