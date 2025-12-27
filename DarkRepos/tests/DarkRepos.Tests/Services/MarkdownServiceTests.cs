using DarkRepos.Core.Services;
using FluentAssertions;

namespace DarkRepos.Tests.Services;

public class MarkdownServiceTests
{
	private readonly IMarkdownService _service;

	public MarkdownServiceTests()
	{
		_service = new MarkdownService();
	}

	[Fact]
	public void ToHtml_WithSimpleText_ReturnsHtml()
	{
		// Arrange
		var markdown = "Hello **world**!";

		// Act
		var html = _service.ToHtml(markdown);

		// Assert
		html.Should().Contain("<strong>world</strong>");
		html.Should().Contain("Hello");
	}

	[Fact]
	public void ToHtml_WithEmptyString_ReturnsEmptyString()
	{
		// Arrange & Act
		var html = _service.ToHtml(string.Empty);

		// Assert
		html.Should().BeEmpty();
	}

	[Fact]
	public void ToHtml_WithNull_ReturnsEmptyString()
	{
		// Arrange & Act
		var html = _service.ToHtml(null!);

		// Assert
		html.Should().BeEmpty();
	}

	[Fact]
	public void ToHtml_WithCodeBlock_RendersCodeBlock()
	{
		// Arrange
		var markdown = "```csharp\nvar x = 1;\n```";

		// Act
		var html = _service.ToHtml(markdown);

		// Assert
		html.Should().Contain("<code");
		html.Should().Contain("var x = 1;");
	}

	[Fact]
	public void ToHtml_WithHeading_RendersHeading()
	{
		// Arrange
		var markdown = "# Title";

		// Act
		var html = _service.ToHtml(markdown);

		// Assert
		html.Should().Contain("<h1");
		html.Should().Contain("Title");
	}

	[Fact]
	public void ToHtml_WithTable_RendersTable()
	{
		// Arrange
		var markdown = """
			| Col1 | Col2 |
			|------|------|
			| A    | B    |
			""";

		// Act
		var html = _service.ToHtml(markdown);

		// Assert
		html.Should().Contain("<table");
		html.Should().Contain("Col1");
		html.Should().Contain("Col2");
	}

	[Fact]
	public void ToPlainText_WithFormatting_StripsFormatting()
	{
		// Arrange
		var markdown = "**Bold** and *italic* text";

		// Act
		var plainText = _service.ToPlainText(markdown);

		// Assert
		plainText.Should().Contain("Bold");
		plainText.Should().Contain("italic");
		plainText.Should().NotContain("**");
		plainText.Should().NotContain("*");
	}

	[Fact]
	public void ExtractTitle_WithHeading_ReturnsHeadingText()
	{
		// Arrange
		var markdown = """
			# My Title
			
			Some content here.
			""";

		// Act
		var title = _service.ExtractTitle(markdown);

		// Assert
		title.Should().Be("My Title");
	}

	[Fact]
	public void ExtractTitle_WithNoHeading_ReturnsNull()
	{
		// Arrange
		var markdown = "Just some text without a heading.";

		// Act
		var title = _service.ExtractTitle(markdown);

		// Assert
		title.Should().BeNull();
	}

	[Fact]
	public void ExtractExcerpt_WithLongParagraph_TruncatesAtWordBoundary()
	{
		// Arrange
		var markdown = "This is a very long paragraph that should be truncated somewhere in the middle to create a reasonable excerpt for display purposes on the website.";

		// Act
		var excerpt = _service.ExtractExcerpt(markdown, 50);

		// Assert
		excerpt.Length.Should().BeLessThanOrEqualTo(55); // Allow for ellipsis
		excerpt.Should().EndWith("…");
		excerpt.Should().NotContain("  "); // No double spaces from truncation
	}

	[Fact]
	public void ExtractExcerpt_WithShortParagraph_ReturnsFullText()
	{
		// Arrange
		var markdown = "Short text.";

		// Act
		var excerpt = _service.ExtractExcerpt(markdown, 200);

		// Assert
		excerpt.Should().Be("Short text.");
	}

	[Fact]
	public void ExtractHeadings_WithMultipleHeadings_ReturnsAllHeadings()
	{
		// Arrange
		var markdown = """
			# Main Title
			
			## Section 1
			
			Some content.
			
			## Section 2
			
			### Subsection 2.1
			
			More content.
			""";

		// Act
		var headings = _service.ExtractHeadings(markdown);

		// Assert
		headings.Should().HaveCount(4);
		headings[0].Level.Should().Be(1);
		headings[0].Text.Should().Be("Main Title");
		headings[1].Level.Should().Be(2);
		headings[1].Text.Should().Be("Section 1");
		headings[2].Level.Should().Be(2);
		headings[2].Text.Should().Be("Section 2");
		headings[3].Level.Should().Be(3);
		headings[3].Text.Should().Be("Subsection 2.1");
	}

	[Fact]
	public void ParseFrontMatter_WithYamlFrontMatter_ExtractsMetadata()
	{
		// Arrange
		var markdown = """
			---
			title: My Document
			author: John Doe
			date: 2024-01-01
			---
			
			# Content
			
			The actual content starts here.
			""";

		// Act
		var (frontMatter, content) = _service.ParseFrontMatter(markdown);

		// Assert
		frontMatter.Should().ContainKey("title");
		frontMatter["title"].Should().Be("My Document");
		frontMatter["author"].Should().Be("John Doe");
		frontMatter["date"].Should().Be("2024-01-01");
		content.Should().StartWith("# Content");
		content.Should().NotContain("---");
	}

	[Fact]
	public void ParseFrontMatter_WithNoFrontMatter_ReturnsOriginalContent()
	{
		// Arrange
		var markdown = "# Just Content";

		// Act
		var (frontMatter, content) = _service.ParseFrontMatter(markdown);

		// Assert
		frontMatter.Should().BeEmpty();
		content.Should().Be(markdown);
	}

	[Fact]
	public void ParseFrontMatter_WithQuotedValues_RemovesQuotes()
	{
		// Arrange
		var markdown = """
			---
			title: "Quoted Title"
			simple: 'Single quotes'
			---
			
			Content
			""";

		// Act
		var (frontMatter, _) = _service.ParseFrontMatter(markdown);

		// Assert
		frontMatter["title"].Should().Be("Quoted Title");
		frontMatter["simple"].Should().Be("Single quotes");
	}

	[Fact]
	public void ToHtml_WithCustomOptions_AppliesOptions()
	{
		// Arrange
		var markdown = "Check https://example.com for more info.";
		var options = new MarkdownRenderOptions
		{
			EnableAutoLinks = true
		};

		// Act
		var html = _service.ToHtml(markdown, options);

		// Assert
		html.Should().Contain("<a href=");
		html.Should().Contain("https://example.com");
	}
}
