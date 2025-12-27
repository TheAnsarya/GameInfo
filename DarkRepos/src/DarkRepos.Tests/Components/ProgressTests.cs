using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;
using static DarkRepos.Web.Components.Shared.Progress;

namespace DarkRepos.Tests.Components;

public class ProgressTests : TestContext
{
	[Fact]
	public void Progress_RendersWithValue()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Max, 100));

		// Assert
		cut.Find(".progress-bar").Should().NotBeNull();
	}

	[Fact]
	public void Progress_HasCorrectAriaAttributes()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 30)
			.Add(p => p.Max, 100));

		// Assert
		var progress = cut.Find(".progress");
		progress.GetAttribute("role").Should().Be("progressbar");
		progress.GetAttribute("aria-valuenow").Should().Be("30");
		progress.GetAttribute("aria-valuemin").Should().Be("0");
		progress.GetAttribute("aria-valuemax").Should().Be("100");
	}

	[Fact]
	public void Progress_CalculatesPercentageCorrectly()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 25)
			.Add(p => p.Max, 100));

		// Assert
		var bar = cut.Find(".progress-bar");
		bar.GetAttribute("style").Should().Contain("width: 25%");
	}

	[Fact]
	public void Progress_ClampsValueToRange()
	{
		// Act - Value exceeds max
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 150)
			.Add(p => p.Max, 100));

		// Assert
		var bar = cut.Find(".progress-bar");
		bar.GetAttribute("style").Should().Contain("width: 100%");
	}

	[Fact]
	public void Progress_HandlesNegativeValue()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, -10)
			.Add(p => p.Max, 100));

		// Assert
		var bar = cut.Find(".progress-bar");
		bar.GetAttribute("style").Should().Contain("width: 0%");
	}

	[Theory]
	[InlineData(ProgressVariant.Primary, "progress-bar--primary")]
	[InlineData(ProgressVariant.Success, "progress-bar--success")]
	[InlineData(ProgressVariant.Warning, "progress-bar--warning")]
	[InlineData(ProgressVariant.Error, "progress-bar--error")]
	[InlineData(ProgressVariant.Info, "progress-bar--info")]
	public void Progress_AppliesVariantClass(ProgressVariant variant, string expectedClass)
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Variant, variant));

		// Assert
		cut.Find(".progress-bar").ClassList.Should().Contain(expectedClass);
	}

	[Theory]
	[InlineData(ProgressSize.Small, "progress--small")]
	[InlineData(ProgressSize.Large, "progress--large")]
	public void Progress_AppliesSizeClass(ProgressSize size, string expectedClass)
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Size, size));

		// Assert
		cut.Find(".progress").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Progress_AppliesStripedClass()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Striped, true));

		// Assert
		cut.Find(".progress-bar").ClassList.Should().Contain("progress-bar--striped");
	}

	[Fact]
	public void Progress_AppliesAnimatedClass()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Animated, true));

		// Assert
		cut.Find(".progress-bar").ClassList.Should().Contain("progress-bar--animated");
	}

	[Fact]
	public void Progress_ShowsValue_WhenShowValueTrue()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 75)
			.Add(p => p.ShowValue, true));

		// Assert
		cut.Find(".progress-value").TextContent.Should().Be("75%");
	}

	[Fact]
	public void Progress_HidesValue_WhenShowValueFalse()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 75)
			.Add(p => p.ShowValue, false));

		// Assert
		cut.FindAll(".progress-value").Should().BeEmpty();
	}

	[Fact]
	public void Progress_RendersLabel()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Label, "Loading..."));

		// Assert
		cut.Find(".progress-label").TextContent.Should().Be("Loading...");
	}

	[Fact]
	public void Progress_AppliesCustomCssClass()
	{
		// Act
		var cut = RenderComponent<Progress>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.CssClass, "my-progress"));

		// Assert
		cut.Find(".progress").ClassList.Should().Contain("my-progress");
	}
}
