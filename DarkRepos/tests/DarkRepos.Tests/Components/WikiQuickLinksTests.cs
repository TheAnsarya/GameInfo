using Bunit;
using DarkRepos.Core.Models;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Web.Tests.Components;

/// <summary>
/// Unit tests for the WikiQuickLinks component.
/// </summary>
public class WikiQuickLinksTests : TestContext
{
	[Fact]
	public void WikiQuickLinks_RendersContainerAndGrid()
	{
		// Arrange
		var wiki = new WikiResources { HasRomMap = true };

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
			p.Add(w => w.Wiki, wiki));

		// Assert
		cut.Find(".wiki-quick-links").Should().NotBeNull();
		cut.Find(".wiki-links-grid").Should().NotBeNull();
	}

	[Fact]
	public void WikiQuickLinks_ShowsHeader_WhenShowHeaderIsTrue()
	{
		// Arrange
		var wiki = new WikiResources { HasRomMap = true };

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.ShowHeader, true);
		});

		// Assert
		cut.Find(".wiki-links-title").TextContent.Should().Be("Wiki Resources");
	}

	[Fact]
	public void WikiQuickLinks_HidesHeader_WhenShowHeaderIsFalse()
	{
		// Arrange
		var wiki = new WikiResources { HasRomMap = true };

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.ShowHeader, false);
		});

		// Assert
		cut.FindAll(".wiki-links-title").Should().BeEmpty();
	}

	[Theory]
	[InlineData(true, false, false, false, false, "ROM Map")]
	[InlineData(false, true, false, false, false, "RAM Map")]
	[InlineData(false, false, true, false, false, "Data")]
	[InlineData(false, false, false, true, false, "Systems")]
	[InlineData(false, false, false, false, true, "Notes")]
	public void WikiQuickLinks_RendersAvailableLink_ForEachResource(
		bool hasRomMap, bool hasRamMap, bool hasDataStructures, bool hasSystems, bool hasNotes,
		string expectedText)
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = hasRomMap,
			HasRamMap = hasRamMap,
			HasDataStructures = hasDataStructures,
			HasSystems = hasSystems,
			HasNotes = hasNotes
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.ShowUnavailable, false);
		});

		// Assert
		var links = cut.FindAll("a.wiki-link");
		links.Should().ContainSingle();
		links[0].QuerySelector(".wiki-link-text")!.TextContent.Should().Be(expectedText);
	}

	[Fact]
	public void WikiQuickLinks_RendersAllAvailableLinks_WhenAllResourcesExist()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = true,
			HasRamMap = true,
			HasDataStructures = true,
			HasSystems = true,
			HasNotes = true,
			WikiBaseUrl = "https://games.darkrepos.com/wiki/test-game"
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
			p.Add(w => w.Wiki, wiki));

		// Assert
		var links = cut.FindAll("a.wiki-link");
		links.Count.Should().Be(5);
	}

	[Fact]
	public void WikiQuickLinks_ShowsUnavailableResources_WhenShowUnavailableIsTrue()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = true,
			HasRamMap = false,
			HasDataStructures = false,
			HasSystems = false,
			HasNotes = false
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.ShowUnavailable, true);
		});

		// Assert
		var unavailable = cut.FindAll(".wiki-link-unavailable");
		unavailable.Count.Should().Be(4); // RAM, Data, Systems, Notes
	}

	[Fact]
	public void WikiQuickLinks_HidesUnavailableResources_WhenShowUnavailableIsFalse()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = true,
			HasRamMap = false,
			HasDataStructures = false,
			HasSystems = false,
			HasNotes = false
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.ShowUnavailable, false);
		});

		// Assert
		var unavailable = cut.FindAll(".wiki-link-unavailable");
		unavailable.Should().BeEmpty();
	}

	[Fact]
	public void WikiQuickLinks_GeneratesCorrectUrl_WithWikiBaseUrl()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = true,
			WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_IV"
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
			p.Add(w => w.Wiki, wiki));

		// Assert
		var romMapLink = cut.Find("a.wiki-link-rom");
		romMapLink.GetAttribute("href").Should().Be("https://games.darkrepos.com/wiki/Dragon_Warrior_IV:ROM_Map");
	}

	[Fact]
	public void WikiQuickLinks_GeneratesCorrectUrl_WithGameSlug()
	{
		// Arrange
		var wiki = new WikiResources { HasRomMap = true };

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.GameSlug, "dragon-warrior-iv-nes");
		});

		// Assert
		var romMapLink = cut.Find("a.wiki-link-rom");
		romMapLink.GetAttribute("href").Should().Be("https://games.darkrepos.com/wiki/dragon-warrior-iv-nes:ROM_Map");
	}

	[Fact]
	public void WikiQuickLinks_ShowsViewAllLink_WhenEnabledAndHasBaseUrl()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = true,
			WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_IV"
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.ShowViewAllLink, true);
		});

		// Assert
		var viewAllLink = cut.Find(".wiki-view-all");
		viewAllLink.Should().NotBeNull();
		viewAllLink.TextContent.Should().Contain("View all");
	}

	[Fact]
	public void WikiQuickLinks_HidesViewAllLink_WhenDisabled()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = true,
			WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_IV"
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.ShowViewAllLink, false);
		});

		// Assert
		cut.FindAll(".wiki-view-all").Should().BeEmpty();
	}

	[Fact]
	public void WikiQuickLinks_AppliesCompactClass_WhenCompactIsTrue()
	{
		// Arrange
		var wiki = new WikiResources { HasRomMap = true };

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.Compact, true);
		});

		// Assert
		var container = cut.Find(".wiki-quick-links");
		container.ClassList.Should().Contain("compact");
	}

	[Fact]
	public void WikiQuickLinks_HidesHeader_InCompactMode()
	{
		// Arrange
		var wiki = new WikiResources { HasRomMap = true };

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
		{
			p.Add(w => w.Wiki, wiki);
			p.Add(w => w.Compact, true);
			p.Add(w => w.ShowHeader, true); // Would normally show, but compact hides it
		});

		// Assert
		cut.FindAll(".wiki-links-title").Should().BeEmpty();
	}

	[Fact]
	public void WikiQuickLinks_LinksOpenInNewTab()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasRomMap = true,
			WikiBaseUrl = "https://games.darkrepos.com/wiki/test"
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
			p.Add(w => w.Wiki, wiki));

		// Assert
		var link = cut.Find("a.wiki-link");
		link.GetAttribute("target").Should().Be("_blank");
		link.GetAttribute("rel").Should().Be("noopener");
	}

	[Fact]
	public void WikiQuickLinks_NotesLink_UsesBaseUrlWithoutSubpage()
	{
		// Arrange
		var wiki = new WikiResources
		{
			HasNotes = true,
			WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_IV"
		};

		// Act
		var cut = RenderComponent<WikiQuickLinks>(p =>
			p.Add(w => w.Wiki, wiki));

		// Assert
		var notesLink = cut.Find("a.wiki-link-notes");
		notesLink.GetAttribute("href").Should().Be("https://games.darkrepos.com/wiki/Dragon_Warrior_IV");
	}
}
