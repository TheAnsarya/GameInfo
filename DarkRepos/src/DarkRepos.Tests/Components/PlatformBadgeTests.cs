using Bunit;
using DarkRepos.Core.Models;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class PlatformBadgeTests : TestContext
{
	[Theory]
	[InlineData(Platform.NES, "NES")]
	[InlineData(Platform.SNES, "SNES")]
	[InlineData(Platform.GB, "GB")]
	[InlineData(Platform.GBA, "GBA")]
	[InlineData(Platform.Genesis, "GEN")]
	public void PlatformBadge_DisplaysCorrectText(Platform platform, string expectedText)
	{
		// Act
		var cut = RenderComponent<PlatformBadge>(parameters => parameters
			.Add(p => p.Platform, platform));

		// Assert
		cut.Find(".badge").TextContent.Trim().Should().Be(expectedText);
	}

	[Theory]
	[InlineData(Platform.NES, "badge-nes")]
	[InlineData(Platform.SNES, "badge-snes")]
	[InlineData(Platform.GB, "badge-gb")]
	[InlineData(Platform.GBA, "badge-gba")]
	[InlineData(Platform.Genesis, "badge-genesis")]
	public void PlatformBadge_HasCorrectCssClass(Platform platform, string expectedClass)
	{
		// Act
		var cut = RenderComponent<PlatformBadge>(parameters => parameters
			.Add(p => p.Platform, platform));

		// Assert
		cut.Find(".badge").ClassList.Should().Contain(expectedClass);
	}
}
