using System.Text;
using System.Text.RegularExpressions;
using Markdig;
using Markdig.Extensions.AutoIdentifiers;
using Markdig.Renderers;
using Markdig.Syntax;
using Markdig.Syntax.Inlines;

namespace DarkRepos.Core.Services;

/// <summary>
/// Markdown parsing and rendering service using Markdig.
/// </summary>
public partial class MarkdownService : IMarkdownService
{
	private readonly MarkdownPipeline _defaultPipeline;

	public MarkdownService()
	{
		_defaultPipeline = CreatePipeline(MarkdownRenderOptions.Default);
	}

	/// <inheritdoc />
	public string ToHtml(string markdown)
	{
		if (string.IsNullOrEmpty(markdown))
			return string.Empty;

		return Markdig.Markdown.ToHtml(markdown, _defaultPipeline);
	}

	/// <inheritdoc />
	public string ToHtml(string markdown, MarkdownRenderOptions options)
	{
		if (string.IsNullOrEmpty(markdown))
			return string.Empty;

		var pipeline = CreatePipeline(options);
		var html = Markdig.Markdown.ToHtml(markdown, pipeline);

		// Post-process for external links if needed
		if (options.ExternalLinksInNewTab)
		{
			html = ProcessExternalLinks(html, options.BaseUrl);
		}

		return html;
	}

	/// <inheritdoc />
	public string ToPlainText(string markdown)
	{
		if (string.IsNullOrEmpty(markdown))
			return string.Empty;

		var document = Markdig.Markdown.Parse(markdown, _defaultPipeline);
		var sb = new StringBuilder();

		ExtractPlainText(document, sb);

		return sb.ToString().Trim();
	}

	/// <inheritdoc />
	public string? ExtractTitle(string markdown)
	{
		if (string.IsNullOrEmpty(markdown))
			return null;

		var document = Markdig.Markdown.Parse(markdown, _defaultPipeline);

		foreach (var block in document)
		{
			if (block is HeadingBlock heading)
			{
				return GetHeadingText(heading);
			}
		}

		return null;
	}

	/// <inheritdoc />
	public string ExtractExcerpt(string markdown, int maxLength = 200)
	{
		if (string.IsNullOrEmpty(markdown))
			return string.Empty;

		// Remove front matter first
		var (_, content) = ParseFrontMatter(markdown);

		var document = Markdig.Markdown.Parse(content, _defaultPipeline);

		foreach (var block in document)
		{
			// Skip headings, look for first paragraph
			if (block is ParagraphBlock paragraph)
			{
				var sb = new StringBuilder();
				ExtractPlainTextFromInlines(paragraph.Inline, sb);
				var text = sb.ToString().Trim();

				if (string.IsNullOrWhiteSpace(text))
					continue;

				if (text.Length <= maxLength)
					return text;

				// Truncate at word boundary
				var truncated = text[..maxLength];
				var lastSpace = truncated.LastIndexOf(' ');
				if (lastSpace > 0)
					truncated = truncated[..lastSpace];

				return truncated + "…";
			}
		}

		return string.Empty;
	}

	/// <inheritdoc />
	public IReadOnlyList<MarkdownHeading> ExtractHeadings(string markdown)
	{
		if (string.IsNullOrEmpty(markdown))
			return [];

		var document = Markdig.Markdown.Parse(markdown, _defaultPipeline);
		var headings = new List<MarkdownHeading>();

		foreach (var block in document.Descendants<HeadingBlock>())
		{
			var text = GetHeadingText(block);
			var id = GenerateHeadingId(text);
			headings.Add(new MarkdownHeading(block.Level, text, id));
		}

		return headings;
	}

	/// <inheritdoc />
	public (Dictionary<string, string> FrontMatter, string Content) ParseFrontMatter(string markdown)
	{
		var frontMatter = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

		if (string.IsNullOrEmpty(markdown))
			return (frontMatter, markdown);

		// Check for YAML front matter (starts with ---)
		if (!markdown.StartsWith("---"))
			return (frontMatter, markdown);

		var endIndex = markdown.IndexOf("\n---", 3);
		if (endIndex < 0)
			return (frontMatter, markdown);

		var yamlContent = markdown[3..endIndex].Trim();
		var content = markdown[(endIndex + 4)..].TrimStart();

		// Simple YAML parsing (key: value format)
		foreach (var line in yamlContent.Split('\n'))
		{
			var trimmedLine = line.Trim();
			if (string.IsNullOrEmpty(trimmedLine) || trimmedLine.StartsWith('#'))
				continue;

			var colonIndex = trimmedLine.IndexOf(':');
			if (colonIndex > 0)
			{
				var key = trimmedLine[..colonIndex].Trim();
				var value = trimmedLine[(colonIndex + 1)..].Trim();

				// Remove quotes if present
				if (value.Length >= 2 && ((value.StartsWith('"') && value.EndsWith('"')) ||
										  (value.StartsWith('\'') && value.EndsWith('\''))))
				{
					value = value[1..^1];
				}

				frontMatter[key] = value;
			}
		}

		return (frontMatter, content);
	}

	private static MarkdownPipeline CreatePipeline(MarkdownRenderOptions options)
	{
		var builder = new MarkdownPipelineBuilder();

		if (options.EnableTables)
			builder.UseAdvancedExtensions();

		if (options.EnableTaskLists)
			builder.UseTaskLists();

		if (options.EnableAutoLinks)
			builder.UseAutoLinks();

		if (options.EnableHeadingIds)
			builder.UseAutoIdentifiers(AutoIdentifierOptions.GitHub);

		// Always add these useful extensions
		builder.UseEmphasisExtras();
		builder.UseGenericAttributes();

		return builder.Build();
	}

	private static string ProcessExternalLinks(string html, string? baseUrl)
	{
		// Add target="_blank" and rel="noopener" to external links
		return ExternalLinkRegex().Replace(html, match =>
		{
			var href = match.Groups["href"].Value;

			// Check if it's an external link
			if (Uri.TryCreate(href, UriKind.Absolute, out var uri))
			{
				if (!string.IsNullOrEmpty(baseUrl) &&
					Uri.TryCreate(baseUrl, UriKind.Absolute, out var baseUri) &&
					uri.Host.Equals(baseUri.Host, StringComparison.OrdinalIgnoreCase))
				{
					return match.Value; // Same domain, don't modify
				}

				// External link - add attributes
				var existingAttrs = match.Groups["attrs"].Value;
				return $"<a href=\"{href}\"{existingAttrs} target=\"_blank\" rel=\"noopener noreferrer\">";
			}

			return match.Value;
		});
	}

	private static void ExtractPlainText(MarkdownObject obj, StringBuilder sb)
	{
		switch (obj)
		{
			case LeafBlock leaf:
				if (leaf.Inline != null)
				{
					ExtractPlainTextFromInlines(leaf.Inline, sb);
				}
				sb.AppendLine();
				break;

			case ContainerBlock container:
				foreach (var child in container)
				{
					ExtractPlainText(child, sb);
				}
				break;
		}
	}

	private static void ExtractPlainTextFromInlines(Inline? inline, StringBuilder sb)
	{
		while (inline != null)
		{
			switch (inline)
			{
				case LiteralInline literal:
					sb.Append(literal.Content);
					break;

				case ContainerInline container:
					ExtractPlainTextFromInlines(container.FirstChild, sb);
					break;

				case LineBreakInline:
					sb.Append(' ');
					break;

				case CodeInline code:
					sb.Append(code.Content);
					break;
			}

			inline = inline.NextSibling;
		}
	}

	private static string GetHeadingText(HeadingBlock heading)
	{
		var sb = new StringBuilder();
		ExtractPlainTextFromInlines(heading.Inline, sb);
		return sb.ToString().Trim();
	}

	private static string GenerateHeadingId(string text)
	{
		// GitHub-style heading ID generation
		var id = text.ToLowerInvariant();
		id = HeadingIdInvalidCharsRegex().Replace(id, "");
		id = HeadingIdSpacesRegex().Replace(id, "-");
		id = id.Trim('-');
		return id;
	}

	[GeneratedRegex("<a href=\"(?<href>[^\"]+)\"(?<attrs>[^>]*)>")]
	private static partial Regex ExternalLinkRegex();

	[GeneratedRegex("[^a-z0-9\\s-]")]
	private static partial Regex HeadingIdInvalidCharsRegex();

	[GeneratedRegex("\\s+")]
	private static partial Regex HeadingIdSpacesRegex();
}
