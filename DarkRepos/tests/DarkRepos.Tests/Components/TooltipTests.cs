using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

public class TooltipTests : TestContext
{
	[Fact]
	public void Tooltip_RendersChildContent()
	{
		// Arrange
		const string buttonText = "Hover me";

		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip text")
			.AddChildContent($"<button>{buttonText}</button>"));

		// Assert
		cut.Markup.Should().Contain(buttonText);
	}

	[Fact]
	public void Tooltip_RendersTooltipText()
	{
		// Arrange
		const string tooltipText = "This is helpful information";

		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, tooltipText)
			.AddChildContent("<button>Button</button>"));

		// Assert
		cut.Find(".tooltip").TextContent.Should().Be(tooltipText);
	}

	[Fact]
	public void Tooltip_HasCorrectPositionClass_ForTop()
	{
		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip")
			.Add(p => p.Position, Tooltip.TooltipPosition.Top)
			.AddChildContent("<span>Content</span>"));

		// Assert
		cut.Find(".tooltip").ClassList.Should().Contain("top");
	}

	[Fact]
	public void Tooltip_HasCorrectPositionClass_ForBottom()
	{
		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip")
			.Add(p => p.Position, Tooltip.TooltipPosition.Bottom)
			.AddChildContent("<span>Content</span>"));

		// Assert
		cut.Find(".tooltip").ClassList.Should().Contain("bottom");
	}

	[Fact]
	public void Tooltip_HasCorrectPositionClass_ForLeft()
	{
		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip")
			.Add(p => p.Position, Tooltip.TooltipPosition.Left)
			.AddChildContent("<span>Content</span>"));

		// Assert
		cut.Find(".tooltip").ClassList.Should().Contain("left");
	}

	[Fact]
	public void Tooltip_HasCorrectPositionClass_ForRight()
	{
		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip")
			.Add(p => p.Position, Tooltip.TooltipPosition.Right)
			.AddChildContent("<span>Content</span>"));

		// Assert
		cut.Find(".tooltip").ClassList.Should().Contain("right");
	}

	[Fact]
	public void Tooltip_DefaultsToTopPosition()
	{
		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip")
			.AddChildContent("<span>Content</span>"));

		// Assert
		cut.Find(".tooltip").ClassList.Should().Contain("top");
	}

	[Fact]
	public void Tooltip_HasProperAriaAttributes()
	{
		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip text")
			.AddChildContent("<span>Content</span>"));

		// Assert
		cut.Find(".tooltip").GetAttribute("role").Should().Be("tooltip");
	}

	[Fact]
	public void Tooltip_WrapperHasTabIndex()
	{
		// Act
		var cut = RenderComponent<Tooltip>(parameters => parameters
			.Add(p => p.Text, "Tooltip")
			.AddChildContent("<span>Content</span>"));

		// Assert
		cut.Find(".tooltip-wrapper").GetAttribute("tabindex").Should().Be("0");
	}
}
