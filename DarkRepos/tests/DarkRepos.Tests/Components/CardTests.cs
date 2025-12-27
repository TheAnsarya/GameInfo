using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Xunit;

namespace DarkRepos.Tests.Components;

public class CardTests : TestContext
{
	[Fact]
	public void Card_RendersChildContent()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.AddChildContent("<p>Card content</p>"));

		// Assert
		cut.Find(".card-body").InnerHtml.Should().Contain("<p>Card content</p>");
	}

	[Fact]
	public void Card_RendersTitle()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.Title, "Card Title")
			.AddChildContent("Content"));

		// Assert
		cut.Find(".card-title").TextContent.Should().Be("Card Title");
	}

	[Fact]
	public void Card_RendersSubtitle()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.Title, "Title")
			.Add(p => p.Subtitle, "Subtitle text")
			.AddChildContent("Content"));

		// Assert
		cut.Find(".card-subtitle").TextContent.Should().Be("Subtitle text");
	}

	[Fact]
	public void Card_RendersHeader_WhenTitleProvided()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.Title, "Title")
			.AddChildContent("Content"));

		// Assert
		cut.FindAll(".card-header").Should().HaveCount(1);
	}

	[Fact]
	public void Card_DoesNotRenderHeader_WhenNoTitleOrHeaderContent()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.AddChildContent("Content only"));

		// Assert
		cut.FindAll(".card-header").Should().BeEmpty();
	}

	[Fact]
	public void Card_RendersFooter_WhenFooterContentProvided()
	{
		// Arrange
		RenderFragment footerContent = builder => builder.AddContent(0, "Footer text");

		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.AddChildContent("Content")
			.Add(p => p.FooterContent, footerContent));

		// Assert
		cut.Find(".card-footer").TextContent.Should().Contain("Footer text");
	}

	[Fact]
	public void Card_DoesNotRenderFooter_WhenNoFooterContent()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.AddChildContent("Content"));

		// Assert
		cut.FindAll(".card-footer").Should().BeEmpty();
	}

	[Fact]
	public void Card_RendersImage_WhenImageUrlProvided()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.ImageUrl, "/images/test.jpg")
			.AddChildContent("Content"));

		// Assert
		var img = cut.Find(".card-image img");
		img.GetAttribute("src").Should().Be("/images/test.jpg");
	}

	[Fact]
	public void Card_ImageHasAltText()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.ImageUrl, "/images/test.jpg")
			.Add(p => p.ImageAlt, "Test image")
			.AddChildContent("Content"));

		// Assert
		cut.Find(".card-image img").GetAttribute("alt").Should().Be("Test image");
	}

	[Fact]
	public void Card_AppliesHoverableClass()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.Hoverable, true)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".card").ClassList.Should().Contain("card--hoverable");
	}

	[Fact]
	public void Card_AppliesClickableClass()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.Clickable, true)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".card").ClassList.Should().Contain("card--clickable");
	}

	[Fact]
	public void Card_AppliesCompactClass()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.Compact, true)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".card-body").ClassList.Should().Contain("card-body--compact");
	}

	[Fact]
	public void Card_AppliesCustomCssClass()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.Add(p => p.CssClass, "my-card")
			.AddChildContent("Content"));

		// Assert
		cut.Find(".card").ClassList.Should().Contain("my-card");
	}

	[Fact]
	public void Card_IsArticleElement()
	{
		// Act
		var cut = RenderComponent<Card>(parameters => parameters
			.AddChildContent("Content"));

		// Assert
		cut.Find("article.card").Should().NotBeNull();
	}
}
