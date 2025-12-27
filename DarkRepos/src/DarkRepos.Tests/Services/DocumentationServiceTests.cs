using DarkRepos.Core.Services;
using FluentAssertions;
using NSubstitute;

namespace DarkRepos.Tests.Services;

public class DocumentationServiceTests : IDisposable
{
	private readonly IMarkdownService _markdownService;
	private readonly DocumentationService _service;
	private readonly string _testDocsPath;

	public DocumentationServiceTests()
	{
		_markdownService = Substitute.For<IMarkdownService>();
		_testDocsPath = Path.Combine(Path.GetTempPath(), "darkrepos-test-docs-" + Guid.NewGuid().ToString("N"));
		Directory.CreateDirectory(_testDocsPath);

		// Setup default markdown service behavior
		_markdownService.ToHtml(Arg.Any<string>()).Returns(x => $"<p>{x.Arg<string>()}</p>");
		_markdownService.ExtractTitle(Arg.Any<string>()).Returns(x =>
		{
			var md = x.Arg<string>();
			var firstLine = md.Split('\n').FirstOrDefault(l => l.StartsWith("# "));
			return firstLine?[2..].Trim();
		});
		_markdownService.ExtractExcerpt(Arg.Any<string>(), Arg.Any<int>()).Returns("Test excerpt");
		_markdownService.ExtractHeadings(Arg.Any<string>()).Returns([]);
		_markdownService.ParseFrontMatter(Arg.Any<string>())
			.Returns((new Dictionary<string, string>(), "content"));

		_service = new DocumentationService(_markdownService, _testDocsPath, null);
	}

	public void Dispose()
	{
		try
		{
			if (Directory.Exists(_testDocsPath))
			{
				Directory.Delete(_testDocsPath, true);
			}
		}
		catch
		{
			// Ignore cleanup errors
		}
	}

	[Fact]
	public async Task GetPageAsync_ExistingPage_ReturnsPage()
	{
		// Arrange
		var markdown = "# Test Page\n\nThis is test content.";
		File.WriteAllText(Path.Combine(_testDocsPath, "test-page.md"), markdown);

		// Act
		var result = await _service.GetPageAsync("test-page");

		// Assert
		result.Should().NotBeNull();
		result!.Path.Should().Be("test-page");
		result.Title.Should().Be("Test Page");
	}

	[Fact]
	public async Task GetPageAsync_NonExistentPage_ReturnsNull()
	{
		// Act
		var result = await _service.GetPageAsync("nonexistent");

		// Assert
		result.Should().BeNull();
	}

	[Fact]
	public async Task GetPageAsync_NestedPath_ReturnsPage()
	{
		// Arrange
		var categoryPath = Path.Combine(_testDocsPath, "guides");
		Directory.CreateDirectory(categoryPath);
		File.WriteAllText(Path.Combine(categoryPath, "getting-started.md"), "# Getting Started");

		// Act
		var result = await _service.GetPageAsync("guides/getting-started");

		// Assert
		result.Should().NotBeNull();
		result!.Path.Should().Be("guides/getting-started");
		result.Category.Should().Be("guides");
	}

	[Fact]
	public async Task GetPageAsync_DirectoryWithReadme_ReturnsReadme()
	{
		// Arrange
		var categoryPath = Path.Combine(_testDocsPath, "formats");
		Directory.CreateDirectory(categoryPath);
		File.WriteAllText(Path.Combine(categoryPath, "README.md"), "# Format Overview");

		// Act
		var result = await _service.GetPageAsync("formats");

		// Assert
		result.Should().NotBeNull();
		result!.Title.Should().Be("Format Overview");
	}

	[Fact]
	public async Task GetCategoryPagesAsync_ExistingCategory_ReturnsPages()
	{
		// Arrange
		var categoryPath = Path.Combine(_testDocsPath, "guides");
		Directory.CreateDirectory(categoryPath);
		File.WriteAllText(Path.Combine(categoryPath, "page1.md"), "# Page 1");
		File.WriteAllText(Path.Combine(categoryPath, "page2.md"), "# Page 2");

		// Act
		var result = await _service.GetCategoryPagesAsync("guides");

		// Assert
		result.Should().HaveCount(2);
	}

	[Fact]
	public async Task GetCategoryPagesAsync_NonExistentCategory_ReturnsEmpty()
	{
		// Act
		var result = await _service.GetCategoryPagesAsync("nonexistent");

		// Assert
		result.Should().BeEmpty();
	}

	[Fact]
	public async Task GetTableOfContentsAsync_WithCategories_ReturnsStructure()
	{
		// Arrange
		var guidesPath = Path.Combine(_testDocsPath, "guides");
		Directory.CreateDirectory(guidesPath);
		File.WriteAllText(Path.Combine(guidesPath, "getting-started.md"), "# Getting Started");

		var formatsPath = Path.Combine(_testDocsPath, "formats");
		Directory.CreateDirectory(formatsPath);
		File.WriteAllText(Path.Combine(formatsPath, "nes-rom.md"), "# NES ROM Format");

		// Act
		var result = await _service.GetTableOfContentsAsync();

		// Assert
		result.Should().NotBeNull();
		result.Categories.Should().HaveCountGreaterThanOrEqualTo(2);
	}

	[Fact]
	public async Task GetTableOfContentsAsync_IgnoresHiddenDirectories()
	{
		// Arrange
		Directory.CreateDirectory(Path.Combine(_testDocsPath, ".hidden"));
		Directory.CreateDirectory(Path.Combine(_testDocsPath, "_private"));
		Directory.CreateDirectory(Path.Combine(_testDocsPath, "~temp"));
		Directory.CreateDirectory(Path.Combine(_testDocsPath, "visible"));

		File.WriteAllText(Path.Combine(_testDocsPath, "visible", "page.md"), "# Test");

		// Act
		var result = await _service.GetTableOfContentsAsync();

		// Assert
		result.Categories.Should().NotContain(c => c.Path == ".hidden");
		result.Categories.Should().NotContain(c => c.Path == "_private");
		result.Categories.Should().NotContain(c => c.Path == "~temp");
	}

	[Fact]
	public async Task SearchAsync_MatchingContent_ReturnsResults()
	{
		// Arrange
		File.WriteAllText(Path.Combine(_testDocsPath, "search-test.md"), "# Search Test\n\nThis contains searchable content.");

		// Act
		var result = await _service.SearchAsync("searchable");

		// Assert
		result.Should().HaveCount(1);
		result.First().Path.Should().Be("search-test");
	}

	[Fact]
	public async Task SearchAsync_NoMatch_ReturnsEmpty()
	{
		// Arrange
		File.WriteAllText(Path.Combine(_testDocsPath, "test.md"), "# Test\n\nSome content here.");

		// Act
		var result = await _service.SearchAsync("nonexistent");

		// Assert
		result.Should().BeEmpty();
	}

	[Fact]
	public async Task SearchAsync_EmptyQuery_ReturnsEmpty()
	{
		// Act
		var result = await _service.SearchAsync("");

		// Assert
		result.Should().BeEmpty();
	}

	[Fact]
	public async Task GetPageAsync_WithFrontMatter_UsesMetadata()
	{
		// Arrange
		var markdown = "---\ntitle: Custom Title\ndescription: Custom description\n---\n\n# Heading";
		File.WriteAllText(Path.Combine(_testDocsPath, "frontmatter.md"), markdown);

		_markdownService.ParseFrontMatter(Arg.Any<string>())
			.Returns((new Dictionary<string, string>
			{
				["title"] = "Custom Title",
				["description"] = "Custom description"
			}, "# Heading"));
		_markdownService.ExtractTitle(Arg.Any<string>()).Returns("Heading");

		// Act
		var result = await _service.GetPageAsync("frontmatter");

		// Assert
		result.Should().NotBeNull();
		result!.Title.Should().Be("Custom Title");
		result.Description.Should().Be("Custom description");
	}

	[Fact]
	public async Task GetPageAsync_WithHeadings_IncludesTableOfContents()
	{
		// Arrange
		var markdown = "# Main\n## Section 1\n## Section 2";
		File.WriteAllText(Path.Combine(_testDocsPath, "headings.md"), markdown);

		_markdownService.ExtractHeadings(Arg.Any<string>())
			.Returns([
				new MarkdownHeading(1, "Main", "main"),
				new MarkdownHeading(2, "Section 1", "section-1"),
				new MarkdownHeading(2, "Section 2", "section-2")
			]);

		// Act
		var result = await _service.GetPageAsync("headings");

		// Assert
		result.Should().NotBeNull();
		result!.Headings.Should().HaveCount(3);
		result.Headings.First().Text.Should().Be("Main");
	}

	[Fact]
	public async Task GetPageAsync_SetsLastModified()
	{
		// Arrange
		var filePath = Path.Combine(_testDocsPath, "dated.md");
		File.WriteAllText(filePath, "# Test");

		// Act
		var result = await _service.GetPageAsync("dated");

		// Assert
		result.Should().NotBeNull();
		result!.LastModified.Should().NotBeNull();
		result.LastModified!.Value.Should().BeCloseTo(DateTime.UtcNow, TimeSpan.FromMinutes(1));
	}

	[Fact]
	public async Task GetTableOfContentsAsync_CategoryHasCorrectInfo()
	{
		// Arrange
		var guidesPath = Path.Combine(_testDocsPath, "guides");
		Directory.CreateDirectory(guidesPath);
		File.WriteAllText(Path.Combine(guidesPath, "test.md"), "# Test Guide");

		// Act
		var result = await _service.GetTableOfContentsAsync();

		// Assert
		var guidesCategory = result.Categories.FirstOrDefault(c => c.Path == "guides");
		guidesCategory.Should().NotBeNull();
		guidesCategory!.Title.Should().Be("Guides & Tutorials");
		guidesCategory.Icon.Should().Be("📖");
	}

	[Fact]
	public async Task SearchAsync_CaseInsensitive()
	{
		// Arrange
		File.WriteAllText(Path.Combine(_testDocsPath, "case-test.md"), "# UPPERCASE Content");

		// Act
		var result = await _service.SearchAsync("uppercase");

		// Assert
		result.Should().HaveCount(1);
	}
}
