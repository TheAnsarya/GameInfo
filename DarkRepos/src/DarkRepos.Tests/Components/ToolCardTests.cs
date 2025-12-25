using Bunit;
using DarkRepos.Core.Models;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class ToolCardTests : TestContext
{
	[Fact]
	public void ToolCard_DisplaysToolName()
	{
		// Arrange
		var tool = CreateTestTool();

		// Act
		var cut = RenderComponent<ToolCard>(parameters => parameters
			.Add(p => p.Tool, tool));

		// Assert
		cut.Markup.Should().Contain("Atlas");
	}

	[Fact]
	public void ToolCard_DisplaysDescription()
	{
		// Arrange
		var tool = CreateTestTool();

		// Act
		var cut = RenderComponent<ToolCard>(parameters => parameters
			.Add(p => p.Tool, tool));

		// Assert
		cut.Markup.Should().Contain("text insertion utility");
	}

	[Fact]
	public void ToolCard_LinksToToolDetail()
	{
		// Arrange
		var tool = CreateTestTool();

		// Act
		var cut = RenderComponent<ToolCard>(parameters => parameters
			.Add(p => p.Tool, tool));

		// Assert
		var link = cut.Find("a");
		link.GetAttribute("href").Should().Be("/tools/atlas");
	}

	[Fact]
	public void ToolCard_DisplaysCategoryBadge()
	{
		// Arrange
		var tool = CreateTestTool();

		// Act
		var cut = RenderComponent<ToolCard>(parameters => parameters
			.Add(p => p.Tool, tool));

		// Assert
		cut.Find(".badge").Should().NotBeNull();
	}

	private static Tool CreateTestTool()
	{
		return new Tool
		{
			Slug = "atlas",
			Name = "Atlas",
			Description = "A text insertion utility for ROM translation.",
			Category = ToolCategory.Text,
			Author = "Klarth",
			Version = "1.0"
		};
	}
}
