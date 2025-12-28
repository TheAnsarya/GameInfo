using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Unit tests for ProgressCircle component.
/// </summary>
public class ProgressCircleTests : TestContext
{
	#region Basic Rendering Tests

	[Fact]
	public void ProgressCircle_RendersCorrectly()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50));

		// Assert
		cut.Find(".progress-circle").Should().NotBeNull();
		cut.Find("svg.circular-chart").Should().NotBeNull();
	}

	[Fact]
	public void ProgressCircle_HasCorrectAriaAttributes()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 75));

		// Assert
		var element = cut.Find(".progress-circle");
		element.GetAttribute("role").Should().Be("progressbar");
		element.GetAttribute("aria-valuenow").Should().Be("75");
		element.GetAttribute("aria-valuemin").Should().Be("0");
		element.GetAttribute("aria-valuemax").Should().Be("100");
	}

	[Theory]
	[InlineData(0)]
	[InlineData(25)]
	[InlineData(50)]
	[InlineData(75)]
	[InlineData(100)]
	public void ProgressCircle_WithValue_RendersCorrectStrokeDasharray(double value)
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, value));

		// Assert
		var circlePath = cut.Find("path.circle");
		circlePath.GetAttribute("stroke-dasharray").Should().Be($"{value}, 100");
	}

	#endregion

	#region Value Clamping Tests

	[Theory]
	[InlineData(-10, 0)]
	[InlineData(-1, 0)]
	[InlineData(101, 100)]
	[InlineData(150, 100)]
	public void ProgressCircle_ClampsValueToValidRange(double input, double expectedClamped)
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, input));

		// Assert
		var circlePath = cut.Find("path.circle");
		circlePath.GetAttribute("stroke-dasharray").Should().Be($"{expectedClamped}, 100");
	}

	#endregion

	#region Label Tests

	[Fact]
	public void ProgressCircle_ShowsLabelByDefault()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 42));

		// Assert
		cut.Find(".percentage").TextContent.Should().Be("42%");
	}

	[Fact]
	public void ProgressCircle_WithShowLabelFalse_HidesLabel()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.ShowLabel, false));

		// Assert
		cut.FindAll(".percentage").Should().BeEmpty();
	}

	[Fact]
	public void ProgressCircle_WithCustomLabel_UsesCustomText()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 75)
			.Add(p => p.CustomLabel, "3/4"));

		// Assert
		cut.Find(".percentage").TextContent.Should().Be("3/4");
	}

	[Theory]
	[InlineData(33.3, "33%")]
	[InlineData(66.7, "67%")]
	[InlineData(0.4, "0%")]
	[InlineData(99.9, "100%")]
	public void ProgressCircle_RoundsPercentageLabel(double value, string expected)
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, value));

		// Assert
		cut.Find(".percentage").TextContent.Should().Be(expected);
	}

	#endregion

	#region Size Tests

	[Theory]
	[InlineData(ProgressCircleSize.Small, "progress-circle-sm")]
	[InlineData(ProgressCircleSize.Medium, "progress-circle-md")]
	[InlineData(ProgressCircleSize.Large, "progress-circle-lg")]
	[InlineData(ProgressCircleSize.ExtraLarge, "progress-circle-xl")]
	public void ProgressCircle_WithSize_HasCorrectClass(ProgressCircleSize size, string expectedClass)
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Size, size));

		// Assert
		cut.Find(".progress-circle").ClassList.Should().Contain(expectedClass);
	}

	#endregion

	#region Color Tests

	[Theory]
	[InlineData(ProgressCircleColor.Primary, "circle-primary")]
	[InlineData(ProgressCircleColor.Success, "circle-success")]
	[InlineData(ProgressCircleColor.Warning, "circle-warning")]
	[InlineData(ProgressCircleColor.Danger, "circle-danger")]
	[InlineData(ProgressCircleColor.Info, "circle-info")]
	[InlineData(ProgressCircleColor.Secondary, "circle-secondary")]
	public void ProgressCircle_WithColor_HasCorrectClass(ProgressCircleColor color, string expectedClass)
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Color, color));

		// Assert
		cut.Find("path.circle").ClassList.Should().Contain(expectedClass);
	}

	#endregion

	#region Tooltip Tests

	[Fact]
	public void ProgressCircle_DefaultTooltip_ShowsPercentageComplete()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 45));

		// Assert
		cut.Find(".progress-circle").GetAttribute("title").Should().Be("45% complete");
	}

	[Fact]
	public void ProgressCircle_WithCustomTooltip_UsesCustomText()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Tooltip, "Halfway done!"));

		// Assert
		cut.Find(".progress-circle").GetAttribute("title").Should().Be("Halfway done!");
	}

	#endregion

	#region CSS Class Tests

	[Fact]
	public void ProgressCircle_WithCssClass_IncludesCustomClass()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.CssClass, "my-custom-class"));

		// Assert
		cut.Find(".progress-circle").ClassList.Should().Contain("my-custom-class");
	}

	[Fact]
	public void ProgressCircle_CombinesAllClasses()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50)
			.Add(p => p.Size, ProgressCircleSize.Large)
			.Add(p => p.CssClass, "extra"));

		// Assert
		var classList = cut.Find(".progress-circle").ClassList;
		classList.Should().Contain("progress-circle");
		classList.Should().Contain("progress-circle-lg");
		classList.Should().Contain("extra");
	}

	#endregion

	#region SVG Structure Tests

	[Fact]
	public void ProgressCircle_HasBackgroundCircle()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50));

		// Assert
		cut.Find("path.circle-bg").Should().NotBeNull();
	}

	[Fact]
	public void ProgressCircle_HasProgressCircle()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50));

		// Assert
		cut.Find("path.circle").Should().NotBeNull();
	}

	[Fact]
	public void ProgressCircle_SvgHasCorrectViewBox()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 50));

		// Assert
		cut.Find("svg").GetAttribute("viewBox").Should().Be("0 0 36 36");
	}

	#endregion

	#region Edge Case Tests

	[Fact]
	public void ProgressCircle_WithZeroValue_RendersEmpty()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 0));

		// Assert
		cut.Find("path.circle").GetAttribute("stroke-dasharray").Should().Be("0, 100");
		cut.Find(".percentage").TextContent.Should().Be("0%");
	}

	[Fact]
	public void ProgressCircle_WithFullValue_RendersFull()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 100));

		// Assert
		cut.Find("path.circle").GetAttribute("stroke-dasharray").Should().Be("100, 100");
		cut.Find(".percentage").TextContent.Should().Be("100%");
	}

	[Fact]
	public void ProgressCircle_WithDecimalValue_WorksCorrectly()
	{
		// Arrange & Act
		var cut = RenderComponent<ProgressCircle>(parameters => parameters
			.Add(p => p.Value, 33.33));

		// Assert
		cut.Find("path.circle").GetAttribute("stroke-dasharray").Should().Be("33.33, 100");
	}

	#endregion
}
