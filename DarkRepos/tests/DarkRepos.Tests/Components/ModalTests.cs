using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.JSInterop;
using NSubstitute;
using Xunit;
using static DarkRepos.Web.Components.Shared.Modal;

namespace DarkRepos.Tests.Components;

public class ModalTests : TestContext
{
	public ModalTests()
	{
		Services.AddSingleton(Substitute.For<IJSRuntime>());
	}

	[Fact]
	public void Modal_NotVisible_WhenIsOpenFalse()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, false)
			.AddChildContent("Content"));

		// Assert
		cut.FindAll(".modal").Should().BeEmpty();
	}

	[Fact]
	public void Modal_Visible_WhenIsOpenTrue()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".modal").Should().NotBeNull();
	}

	[Fact]
	public void Modal_RendersChildContent()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.AddChildContent("<p>Modal content</p>"));

		// Assert
		cut.Find(".modal-body").InnerHtml.Should().Contain("<p>Modal content</p>");
	}

	[Fact]
	public void Modal_RendersTitle()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.Add(p => p.Title, "Modal Title")
			.AddChildContent("Content"));

		// Assert
		cut.Find(".modal-title").TextContent.Should().Be("Modal Title");
	}

	[Fact]
	public void Modal_HasDialogRole()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".modal").GetAttribute("role").Should().Be("dialog");
	}

	[Fact]
	public void Modal_HasAriaModal()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".modal").GetAttribute("aria-modal").Should().Be("true");
	}

	[Fact]
	public void Modal_ShowsCloseButton_ByDefault()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".modal-close").Should().NotBeNull();
	}

	[Fact]
	public void Modal_HidesCloseButton_WhenShowCloseButtonFalse()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.Add(p => p.ShowCloseButton, false)
			.AddChildContent("Content"));

		// Assert
		cut.FindAll(".modal-close").Should().BeEmpty();
	}

	[Fact]
	public void Modal_HidesHeader_WhenShowHeaderFalse()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.Add(p => p.ShowHeader, false)
			.AddChildContent("Content"));

		// Assert
		cut.FindAll(".modal-header").Should().BeEmpty();
	}

	[Fact]
	public void Modal_RendersFooter_WhenFooterContentProvided()
	{
		// Arrange
		RenderFragment footerContent = builder => builder.AddContent(0, "Footer");

		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.AddChildContent("Content")
			.Add(p => p.FooterContent, footerContent));

		// Assert
		cut.Find(".modal-footer").TextContent.Should().Contain("Footer");
	}

	[Theory]
	[InlineData(ModalSize.Small, "modal--small")]
	[InlineData(ModalSize.Medium, "modal--medium")]
	[InlineData(ModalSize.Large, "modal--large")]
	[InlineData(ModalSize.FullScreen, "modal--fullscreen")]
	public void Modal_AppliesSizeClass(ModalSize size, string expectedClass)
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.Add(p => p.Size, size)
			.AddChildContent("Content"));

		// Assert
		cut.Find(".modal").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Modal_CloseButton_ClosesModal()
	{
		// Arrange
		var isOpen = true;

		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, isOpen)
			.Add(p => p.IsOpenChanged, (bool value) => isOpen = value)
			.AddChildContent("Content"));

		cut.Find(".modal-close").Click();

		// Assert
		isOpen.Should().BeFalse();
	}

	[Fact]
	public void Modal_OverlayClick_ClosesModal_WhenCloseOnOverlayClickTrue()
	{
		// Arrange
		var isOpen = true;

		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, isOpen)
			.Add(p => p.IsOpenChanged, (bool value) => isOpen = value)
			.Add(p => p.CloseOnOverlayClick, true)
			.AddChildContent("Content"));

		cut.Find(".modal-overlay").Click();

		// Assert
		isOpen.Should().BeFalse();
	}

	[Fact]
	public void Modal_AppliesCustomCssClass()
	{
		// Act
		var cut = RenderComponent<Modal>(parameters => parameters
			.Add(p => p.IsOpen, true)
			.Add(p => p.CssClass, "my-modal")
			.AddChildContent("Content"));

		// Assert
		cut.Find(".modal").ClassList.Should().Contain("my-modal");
	}
}
