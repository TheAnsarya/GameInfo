using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.Extensions.DependencyInjection;
using Xunit;
using static DarkRepos.Web.Components.Shared.Skeleton;

namespace DarkRepos.Web.Tests.Components;

/// <summary>
/// Unit tests for the Skeleton and SkeletonCard components.
/// </summary>
public class SkeletonTests : TestContext
{
	[Fact]
	public void Skeleton_RendersWithDefaultVariant()
	{
		// Act
		var cut = RenderComponent<Skeleton>();

		// Assert
		var element = cut.Find(".skeleton");
		element.ClassList.Should().Contain("skeleton-text");
		element.ClassList.Should().Contain("animated");
	}

	[Theory]
	[InlineData(SkeletonVariant.Text, "skeleton-text")]
	[InlineData(SkeletonVariant.Circle, "skeleton-circle")]
	[InlineData(SkeletonVariant.Rectangle, "skeleton-rect")]
	[InlineData(SkeletonVariant.Card, "skeleton-card")]
	[InlineData(SkeletonVariant.Avatar, "skeleton-avatar")]
	[InlineData(SkeletonVariant.Button, "skeleton-button")]
	public void Skeleton_RendersCorrectVariantClass(SkeletonVariant variant, string expectedClass)
	{
		// Act
		var cut = RenderComponent<Skeleton>(p =>
			p.Add(s => s.Variant, variant));

		// Assert
		var element = cut.Find(".skeleton");
		element.ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Skeleton_AppliesCustomWidth()
	{
		// Act
		var cut = RenderComponent<Skeleton>(p =>
			p.Add(s => s.Width, "200px"));

		// Assert
		var element = cut.Find(".skeleton");
		element.GetAttribute("style").Should().Contain("width: 200px");
	}

	[Fact]
	public void Skeleton_AppliesCustomHeight()
	{
		// Act
		var cut = RenderComponent<Skeleton>(p =>
			p.Add(s => s.Height, "100px"));

		// Assert
		var element = cut.Find(".skeleton");
		element.GetAttribute("style").Should().Contain("height: 100px");
	}

	[Fact]
	public void Skeleton_AppliesCustomWidthAndHeight()
	{
		// Act
		var cut = RenderComponent<Skeleton>(p =>
		{
			p.Add(s => s.Width, "50%");
			p.Add(s => s.Height, "2rem");
		});

		// Assert
		var element = cut.Find(".skeleton");
		var style = element.GetAttribute("style");
		style.Should().Contain("width: 50%");
		style.Should().Contain("height: 2rem");
	}

	[Fact]
	public void Skeleton_DisablesAnimation_WhenAnimatedIsFalse()
	{
		// Act
		var cut = RenderComponent<Skeleton>(p =>
			p.Add(s => s.Animated, false));

		// Assert
		var element = cut.Find(".skeleton");
		element.ClassList.Should().NotContain("animated");
	}

	[Fact]
	public void Skeleton_HasCorrectAccessibilityAttributes()
	{
		// Act
		var cut = RenderComponent<Skeleton>();

		// Assert
		var element = cut.Find(".skeleton");
		element.GetAttribute("role").Should().Be("presentation");
		element.GetAttribute("aria-hidden").Should().Be("true");
	}

	[Fact]
	public void SkeletonCard_RendersContainerAndSections()
	{
		// Act
		var cut = RenderComponent<SkeletonCard>();

		// Assert
		cut.Find(".skeleton-card-container").Should().NotBeNull();
		cut.Find(".skeleton-card-image").Should().NotBeNull();
		cut.Find(".skeleton-card-content").Should().NotBeNull();
		cut.Find(".skeleton-card-badges").Should().NotBeNull();
		cut.Find(".skeleton-card-description").Should().NotBeNull();
	}

	[Fact]
	public void SkeletonCard_RendersTwoChildSkeletons_WhenShowSecondBadgeIsTrue()
	{
		// Act
		var cut = RenderComponent<SkeletonCard>(p =>
			p.Add(s => s.ShowSecondBadge, true));

		// Assert
		var badges = cut.FindAll(".skeleton-card-badges .skeleton");
		badges.Count.Should().Be(2);
	}

	[Fact]
	public void SkeletonCard_RendersOneBadge_WhenShowSecondBadgeIsFalse()
	{
		// Act
		var cut = RenderComponent<SkeletonCard>(p =>
			p.Add(s => s.ShowSecondBadge, false));

		// Assert
		var badges = cut.FindAll(".skeleton-card-badges .skeleton");
		badges.Count.Should().Be(1);
	}

	[Fact]
	public void SkeletonCard_ShowsThirdLine_WhenEnabled()
	{
		// Act
		var cut = RenderComponent<SkeletonCard>(p =>
			p.Add(s => s.ShowThirdLine, true));

		// Assert
		var descriptionLines = cut.FindAll(".skeleton-card-description .skeleton");
		descriptionLines.Count.Should().Be(3);
	}

	[Fact]
	public void SkeletonCard_HideThirdLine_ByDefault()
	{
		// Act
		var cut = RenderComponent<SkeletonCard>();

		// Assert
		var descriptionLines = cut.FindAll(".skeleton-card-description .skeleton");
		descriptionLines.Count.Should().Be(2);
	}
}
