using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the VersionBadge component.
/// </summary>
public class VersionBadgeTests : TestContext
{
	[Fact]
	public void VersionBadge_RendersSpanElement()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0"));

		// Assert
		cut.Find("span.version-badge").Should().NotBeNull();
	}

	[Fact]
	public void VersionBadge_DisplaysVersion()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "2.1.3"));

		// Assert
		cut.Find(".version-number").TextContent.Should().Be("2.1.3");
	}

	[Fact]
	public void VersionBadge_ShowsPrefix_ByDefault()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0"));

		// Assert
		cut.Find(".version-prefix").TextContent.Should().Be("v");
	}

	[Fact]
	public void VersionBadge_HidesPrefix_WhenShowPrefixFalse()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.ShowPrefix, false));

		// Assert
		cut.FindAll(".version-prefix").Should().BeEmpty();
	}

	[Fact]
	public void VersionBadge_UsesCustomPrefix()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.Prefix, "ver"));

		// Assert
		cut.Find(".version-prefix").TextContent.Should().Be("ver");
	}

	// === Type tests ===

	[Fact]
	public void VersionBadge_HasDefaultClass_WhenNoType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0"));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-default");
	}

	[Fact]
	public void VersionBadge_HasReleaseClass_ForReleaseType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.Type, VersionType.Release));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-release");
	}

	[Fact]
	public void VersionBadge_HasBetaClass_ForBetaType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0-beta")
			.Add(p => p.Type, VersionType.Beta));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-beta");
	}

	[Fact]
	public void VersionBadge_HasAlphaClass_ForAlphaType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0-alpha")
			.Add(p => p.Type, VersionType.Alpha));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-alpha");
	}

	[Fact]
	public void VersionBadge_HasPreviewClass_ForPreviewType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0-preview")
			.Add(p => p.Type, VersionType.Preview));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-preview");
	}

	[Fact]
	public void VersionBadge_HasStableClass_ForStableType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.Type, VersionType.Stable));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-stable");
	}

	[Fact]
	public void VersionBadge_HasLTSClass_ForLTSType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "8.0.0")
			.Add(p => p.Type, VersionType.LTS));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-lts");
	}

	[Fact]
	public void VersionBadge_HasDeprecatedClass_ForDeprecatedType()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "0.9.0")
			.Add(p => p.Type, VersionType.Deprecated));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("version-deprecated");
	}

	// === Size tests ===

	[Fact]
	public void VersionBadge_HasMediumSizeClass_ByDefault()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0"));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("badge-md");
	}

	[Fact]
	public void VersionBadge_HasSmallSizeClass_ForSmallSize()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.Size, VersionBadgeSize.Small));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("badge-sm");
	}

	[Fact]
	public void VersionBadge_HasLargeSizeClass_ForLargeSize()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.Size, VersionBadgeSize.Large));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("badge-lg");
	}

	// === Tooltip tests ===

	[Fact]
	public void VersionBadge_HasDefaultTooltip()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.2.3"));

		// Assert
		cut.Find("span.version-badge").GetAttribute("title").Should().Be("Version 1.2.3");
	}

	[Fact]
	public void VersionBadge_HasCustomTooltip_WhenSet()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.Tooltip, "Custom tooltip text"));

		// Assert
		cut.Find("span.version-badge").GetAttribute("title").Should().Be("Custom tooltip text");
	}

	[Fact]
	public void VersionBadge_IncludesReleaseDate_InTooltip_WhenSet()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.ReleaseDate, new DateTime(2024, 1, 15)));

		// Assert
		cut.Find("span.version-badge").GetAttribute("title").Should().Be("Version 1.0.0 (Released: 2024-01-15)");
	}

	// === Copy button tests ===

	[Fact]
	public void VersionBadge_HidesCopyButton_ByDefault()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0"));

		// Assert
		cut.FindAll(".version-copy-btn").Should().BeEmpty();
	}

	[Fact]
	public void VersionBadge_ShowsCopyButton_WhenEnabled()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.ShowCopyButton, true));

		// Assert
		cut.Find(".version-copy-btn").Should().NotBeNull();
	}

	// === CSS class tests ===

	[Fact]
	public void VersionBadge_AppliesCustomCssClass()
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, "1.0.0")
			.Add(p => p.CssClass, "my-custom-class"));

		// Assert
		cut.Find("span.version-badge").ClassList.Should().Contain("my-custom-class");
	}

	// === Various version formats ===

	[Theory]
	[InlineData("1.0.0")]
	[InlineData("2.1.3-beta")]
	[InlineData("3.0.0-rc.1")]
	[InlineData("10.0.0-preview.5")]
	[InlineData("1.0.0+build.123")]
	public void VersionBadge_DisplaysVariousVersionFormats(string version)
	{
		// Act
		var cut = RenderComponent<VersionBadge>(parameters => parameters
			.Add(p => p.Version, version));

		// Assert
		cut.Find(".version-number").TextContent.Should().Be(version);
	}
}
