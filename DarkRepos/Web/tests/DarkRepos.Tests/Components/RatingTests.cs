using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the Rating component.
/// </summary>
public class RatingTests : TestContext {
	[Fact]
	public void Rating_RendersCorrectNumberOfStars() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.MaxValue, 5));

		// Assert
		cut.FindAll(".star").Should().HaveCount(5);
	}

	[Fact]
	public void Rating_RendersCustomMaxValue() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.MaxValue, 10));

		// Assert
		cut.FindAll(".star").Should().HaveCount(10);
	}

	[Fact]
	public void Rating_ShowsFilledStars_ForValue() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 3)
			.Add(p => p.MaxValue, 5));

		// Assert
		cut.FindAll(".star.filled").Should().HaveCount(3);
		cut.FindAll(".star.empty").Should().HaveCount(2);
	}

	[Fact]
	public void Rating_ShowsEmptyStars_ForZeroValue() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 0)
			.Add(p => p.MaxValue, 5));

		// Assert
		cut.FindAll(".star.empty").Should().HaveCount(5);
	}

	[Fact]
	public void Rating_ShowsAllFilledStars_ForMaxValue() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 5)
			.Add(p => p.MaxValue, 5));

		// Assert
		cut.FindAll(".star.filled").Should().HaveCount(5);
	}

	[Fact]
	public void Rating_ShowsHalfStar_WhenAllowHalf() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 3.5)
			.Add(p => p.MaxValue, 5)
			.Add(p => p.AllowHalf, true));

		// Assert
		cut.FindAll(".star.filled").Should().HaveCount(3);
		cut.FindAll(".star.half").Should().HaveCount(1);
		cut.FindAll(".star.empty").Should().HaveCount(1);
	}

	[Fact]
	public void Rating_ShowsValue_WhenShowValueTrue() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 4.5)
			.Add(p => p.MaxValue, 5)
			.Add(p => p.ShowValue, true));

		// Assert
		cut.Find(".rating-value").TextContent.Should().Contain("4.5");
	}

	[Fact]
	public void Rating_HidesValue_WhenShowValueFalse() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 4)
			.Add(p => p.ShowValue, false));

		// Assert
		cut.FindAll(".rating-value").Should().BeEmpty();
	}

	[Fact]
	public void Rating_ShowsCount_WhenProvided() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 4)
			.Add(p => p.Count, 1234)
			.Add(p => p.ShowCount, true));

		// Assert
		cut.Find(".rating-count").TextContent.Should().Contain("1,234");
	}

	[Fact]
	public void Rating_HidesCount_WhenNotProvided() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 4)
			.Add(p => p.ShowCount, true));

		// Assert
		cut.FindAll(".rating-count").Should().BeEmpty();
	}

	[Fact]
	public void Rating_HasReadonlyClass_WhenReadonly() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 3)
			.Add(p => p.Readonly, true));

		// Assert
		cut.Find(".rating").ClassList.Should().Contain("readonly");
	}

	[Fact]
	public void Rating_HasInteractiveClass_WhenNotReadonly() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 3)
			.Add(p => p.Readonly, false));

		// Assert
		cut.Find(".rating").ClassList.Should().Contain("interactive");
	}

	[Fact]
	public void Rating_IsReadonly_ByDefault() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 3));

		// Assert
		cut.Find(".rating").ClassList.Should().Contain("readonly");
	}

	[Fact]
	public void Rating_HasAriaLabel() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 4)
			.Add(p => p.MaxValue, 5));

		// Assert
		cut.Find(".rating").GetAttribute("aria-label").Should().Contain("4");
		cut.Find(".rating").GetAttribute("aria-label").Should().Contain("5");
	}

	[Fact]
	public void Rating_HasAriaValueNow() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 3.5));

		// Assert
		cut.Find(".rating").GetAttribute("aria-valuenow").Should().Be("3.5");
	}

	[Fact]
	public void Rating_HasAriaValueMax() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.MaxValue, 10));

		// Assert
		cut.Find(".rating").GetAttribute("aria-valuemax").Should().Be("10");
	}

	[Fact]
	public void Rating_HasRoleImg_WhenReadonly() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Readonly, true));

		// Assert
		cut.Find(".rating").GetAttribute("role").Should().Be("img");
	}

	[Fact]
	public void Rating_HasRoleSlider_WhenInteractive() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Readonly, false));

		// Assert
		cut.Find(".rating").GetAttribute("role").Should().Be("slider");
	}

	[Fact]
	public async Task Rating_InvokesCallback_OnClick() {
		// Arrange
		double? newValue = null;
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 2)
			.Add(p => p.Readonly, false)
			.Add(p => p.OnValueChanged, EventCallback.Factory.Create<double>(this, v => newValue = v)));

		// Act
		await cut.FindAll(".star")[3].ClickAsync(new MouseEventArgs()); // Click 4th star

		// Assert
		newValue.Should().Be(4);
	}

	[Fact]
	public async Task Rating_DoesNotInvokeCallback_WhenReadonly() {
		// Arrange
		double? newValue = null;
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 2)
			.Add(p => p.Readonly, true)
			.Add(p => p.OnValueChanged, EventCallback.Factory.Create<double>(this, v => newValue = v)));

		// Act
		await cut.FindAll(".star")[3].ClickAsync(new MouseEventArgs());

		// Assert
		newValue.Should().BeNull();
	}

	[Fact]
	public void Rating_HasTabIndex_WhenInteractive() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Readonly, false));

		// Assert
		cut.Find(".rating").GetAttribute("tabindex").Should().Be("0");
	}

	[Fact]
	public void Rating_HasNegativeTabIndex_WhenReadonly() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Readonly, true));

		// Assert
		cut.Find(".rating").GetAttribute("tabindex").Should().Be("-1");
	}

	[Theory]
	[InlineData("small")]
	[InlineData("medium")]
	[InlineData("large")]
	public void Rating_HasSizeClass(string size) {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Size, size));

		// Assert
		cut.Find(".rating").ClassList.Should().Contain(size);
	}

	[Fact]
	public void Rating_DefaultsToMediumSize() {
		// Act
		var cut = RenderComponent<Rating>();

		// Assert
		cut.Find(".rating").ClassList.Should().Contain("medium");
	}

	[Fact]
	public void Rating_IncludesCountInAriaLabel() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 4)
			.Add(p => p.Count, 100));

		// Assert
		cut.Find(".rating").GetAttribute("aria-label").Should().Contain("100");
		cut.Find(".rating").GetAttribute("aria-label").Should().Contain("reviews");
	}

	[Fact]
	public void Rating_StarsAreHiddenFromAria() {
		// Act
		var cut = RenderComponent<Rating>(parameters => parameters
			.Add(p => p.Value, 3));

		// Assert
		cut.FindAll(".star").Should().AllSatisfy(star =>
			star.GetAttribute("aria-hidden").Should().Be("true"));
	}
}
