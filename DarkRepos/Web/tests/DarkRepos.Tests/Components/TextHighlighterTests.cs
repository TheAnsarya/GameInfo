using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the TextHighlighter component.
/// </summary>
public class TextHighlighterTests : TestContext {
	[Fact]
	public void TextHighlighter_RendersEmptySpan_WhenTextIsEmpty() {
		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, "")
			.Add(p => p.SearchTerms, "test"));

		// Assert - Note: Blazor adds CSS isolation attributes, so check for span element
		cut.Find("span").TextContent.Should().BeEmpty();
	}

	[Fact]
	public void TextHighlighter_RendersPlainText_WhenSearchTermsEmpty() {
		// Arrange
		var text = "Hello World";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, ""));

		// Assert - Note: Blazor adds CSS isolation attributes
		cut.Find("span").TextContent.Should().Be("Hello World");
	}

	[Fact]
	public void TextHighlighter_RendersPlainText_WhenNoMatches() {
		// Arrange
		var text = "Hello World";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "xyz"));

		// Assert
		cut.Markup.Should().Contain("Hello World");
		cut.Markup.Should().NotContain("<mark");
	}

	[Fact]
	public void TextHighlighter_HighlightsSingleTerm() {
		// Arrange
		var text = "Hello World";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "World"));

		// Assert
		cut.Markup.Should().Contain("<mark");
		cut.Markup.Should().Contain("World</mark>");
	}

	[Fact]
	public void TextHighlighter_HighlightsCaseInsensitive() {
		// Arrange
		var text = "Hello World";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "world"));

		// Assert
		cut.Markup.Should().Contain("<mark");
		cut.Markup.Should().Contain("World</mark>");
	}

	[Fact]
	public void TextHighlighter_HighlightsMultipleTerms() {
		// Arrange
		var text = "Hello World from the Test";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "Hello Test"));

		// Assert
		cut.Markup.Should().Contain("Hello</mark>");
		cut.Markup.Should().Contain("Test</mark>");
	}

	[Fact]
	public void TextHighlighter_HighlightsAllOccurrences() {
		// Arrange
		var text = "test this test and that test";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "test"));

		// Assert
		var markup = cut.Markup;
		var markCount = markup.Split("<mark").Length - 1;
		markCount.Should().Be(3);
	}

	[Fact]
	public void TextHighlighter_IgnoresShortTerms() {
		// Arrange
		var text = "A B C test";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "A B test"));

		// Assert
		// Only "test" should be highlighted (2+ chars)
		var markup = cut.Markup;
		var markCount = markup.Split("<mark").Length - 1;
		markCount.Should().Be(1);
		cut.Markup.Should().Contain("test</mark>");
	}

	[Fact]
	public void TextHighlighter_UsesCustomHighlightClass() {
		// Arrange
		var text = "Hello World";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "World")
			.Add(p => p.HighlightClass, "custom-highlight"));

		// Assert
		cut.Markup.Should().Contain("class=\"custom-highlight\"");
	}

	[Fact]
	public void TextHighlighter_TruncatesLongText() {
		// Arrange
		var text = new string('a', 100) + " searchterm " + new string('b', 100);

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "searchterm")
			.Add(p => p.MaxLength, 100)
			.Add(p => p.ShowContext, true));

		// Assert
		cut.Markup.Should().Contain("...");
		cut.Markup.Should().Contain("searchterm</mark>");
	}

	[Fact]
	public void TextHighlighter_EncodesHtmlInText() {
		// Arrange
		var text = "<script>alert('xss')</script> test";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "test"));

		// Assert
		cut.Markup.Should().NotContain("<script>");
		cut.Markup.Should().Contain("&lt;script&gt;");
	}

	[Fact]
	public void TextHighlighter_EncodesHtmlInSearchTerms() {
		// Arrange
		var text = "Hello World";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "World<script>"));

		// Assert
		cut.Markup.Should().NotContain("<script>");
	}

	[Fact]
	public void TextHighlighter_HandlesOverlappingTerms() {
		// Arrange
		var text = "testing tested test";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "test testing"));

		// Assert
		// Should not create nested marks
		cut.Markup.Should().NotContain("<mark><mark");
	}

	[Fact]
	public void TextHighlighter_WorksWithDuplicateSearchTerms() {
		// Arrange
		var text = "Hello World";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "World World WORLD"));

		// Assert
		// Should only highlight once (deduplicated)
		var markup = cut.Markup;
		var markCount = markup.Split("<mark").Length - 1;
		markCount.Should().Be(1);
	}

	[Fact]
	public void TextHighlighter_HandlesNullText() {
		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, null!)
			.Add(p => p.SearchTerms, "test"));

		// Assert - Note: Blazor adds CSS isolation attributes
		cut.Find("span").TextContent.Should().BeEmpty();
	}

	[Fact]
	public void TextHighlighter_HandlesNullSearchTerms() {
		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, "Hello World")
			.Add(p => p.SearchTerms, null!));

		// Assert - Note: Blazor adds CSS isolation attributes
		cut.Find("span").TextContent.Should().Be("Hello World");
	}

	[Fact]
	public void TextHighlighter_NoTruncation_WhenMaxLengthIsZero() {
		// Arrange
		var text = new string('a', 500);

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "xyz")
			.Add(p => p.MaxLength, 0));

		// Assert
		cut.Markup.Should().NotContain("...");
		cut.Find("span").TextContent.Length.Should().Be(500);
	}

	[Fact]
	public void TextHighlighter_PreservesOriginalCase() {
		// Arrange
		var text = "HELLO hello Hello";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "hello"));

		// Assert
		cut.Markup.Should().Contain("HELLO</mark>");
		cut.Markup.Should().Contain(">hello</mark>");
		cut.Markup.Should().Contain("Hello</mark>");
	}

	[Fact]
	public void TextHighlighter_HandlesSpecialRegexCharacters() {
		// Arrange
		var text = "test (value) and [array] or $100";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "(value)"));

		// Assert
		// Should treat search term literally, not as regex
		cut.Markup.Should().Contain("(value)</mark>");
	}

	[Fact]
	public void TextHighlighter_CustomContextLength() {
		// Arrange
		var text = new string('a', 200) + " match " + new string('b', 200);

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "match")
			.Add(p => p.MaxLength, 100)
			.Add(p => p.ContextLength, 20));

		// Assert
		cut.Markup.Should().Contain("...");
		cut.Markup.Should().Contain("match</mark>");
	}

	[Fact]
	public void TextHighlighter_ShowContext_False() {
		// Arrange
		var text = "Short text with match in it";

		// Act
		var cut = RenderComponent<TextHighlighter>(parameters => parameters
			.Add(p => p.Text, text)
			.Add(p => p.SearchTerms, "match")
			.Add(p => p.MaxLength, 100)
			.Add(p => p.ShowContext, false));

		// Assert - ShowContext=false still shows matches, just doesn't try to center around them
		cut.Markup.Should().Contain("match</mark>");
	}
}
