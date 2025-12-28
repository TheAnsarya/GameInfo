using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.JSInterop;
using Moq;
using Xunit;
using static DarkRepos.Web.Components.Shared.CopyButton;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the CopyButton component.
/// </summary>
public class CopyButtonTests : TestContext {
	[Fact]
	public void CopyButton_RendersWithDefaultLabel() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test"));

		// Assert
		cut.Find(".copy-text").TextContent.Should().Be("Copy");
	}

	[Fact]
	public void CopyButton_RendersCustomLabel() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test")
			.Add(p => p.Label, "Copy Code"));

		// Assert
		cut.Find(".copy-text").TextContent.Should().Be("Copy Code");
	}

	[Fact]
	public void CopyButton_HasCopyIcon() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test"));

		// Assert
		cut.Find(".copy-icon").TextContent.Should().Contain("📋");
	}

	[Fact]
	public void CopyButton_HasReadyClass_Initially() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test"));

		// Assert
		cut.Find(".copy-button").ClassList.Should().Contain("ready");
	}

	[Fact]
	public void CopyButton_HasTitleAttribute() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test"));

		// Assert
		cut.Find(".copy-button").GetAttribute("title").Should().Contain("Copy to clipboard");
	}

	[Fact]
	public void CopyButton_HasAriaLabel() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test"));

		// Assert
		cut.Find(".copy-button").GetAttribute("aria-label").Should().Contain("Copy");
	}

	[Fact]
	public void CopyButton_TruncatesLongText_InTitle() {
		// Arrange
		SetupJsMock();
		var longText = new string('a', 100);

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, longText));

		// Assert
		var title = cut.Find(".copy-button").GetAttribute("title");
		title.Should().Contain("...");
		title!.Length.Should().BeLessThan(longText.Length + 30);
	}

	[Fact]
	public void CopyButton_HasCustomCopiedLabel() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test")
			.Add(p => p.CopiedLabel, "Done!"));

		// Assert - the label will show after clicking
		cut.Find(".copy-button").Should().NotBeNull();
	}

	[Fact]
	public void CopyButton_HasCustomErrorLabel() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test")
			.Add(p => p.ErrorLabel, "Error!"));

		// Assert
		cut.Find(".copy-button").Should().NotBeNull();
	}

	[Fact]
	public void CopyButton_HasButtonType() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test"));

		// Assert
		cut.Find(".copy-button").GetAttribute("type").Should().Be("button");
	}

	[Fact]
	public void CopyButton_AcceptsOnCopyCallback() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test")
			.Add(p => p.OnCopy, EventCallback.Factory.Create<bool>(this, _ => { })));

		// Assert
		cut.Find(".copy-button").Should().NotBeNull();
	}

	[Fact]
	public void CopyButton_HasFeedbackDurationParameter() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test")
			.Add(p => p.FeedbackDuration, 1000));

		// Assert
		cut.Find(".copy-button").Should().NotBeNull();
	}

	[Fact]
	public void CopyButton_IsNotDisabled_Initially() {
		// Arrange
		SetupJsMock();

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test"));

		// Assert
		cut.Find(".copy-button").HasAttribute("disabled").Should().BeFalse();
	}

	[Fact]
	public async Task CopyButton_ShowsCopied_AfterSuccessfulCopy() {
		// Arrange
		var jsMock = new Mock<IJSRuntime>();
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.ReturnsAsync((Microsoft.JSInterop.Infrastructure.IJSVoidResult)null!);
		Services.AddSingleton(jsMock.Object);

		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test text")
			.Add(p => p.FeedbackDuration, 5000)); // Long duration so we can check

		// Act
		await cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert - should be in copied state
		cut.WaitForState(() => cut.Find(".copy-button").ClassList.Contains("copied"), TimeSpan.FromSeconds(1));
		cut.Find(".copy-text").TextContent.Should().Be("Copied!");
		cut.Find(".copy-icon").TextContent.Should().Contain("✓");
	}

	[Fact]
	public async Task CopyButton_InvokesOnCopy_WithTrue_OnSuccess() {
		// Arrange
		var jsMock = new Mock<IJSRuntime>();
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.ReturnsAsync((Microsoft.JSInterop.Infrastructure.IJSVoidResult)null!);
		Services.AddSingleton(jsMock.Object);

		bool? callbackResult = null;
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test text")
			.Add(p => p.OnCopy, EventCallback.Factory.Create<bool>(this, result => callbackResult = result)));

		// Act
		await cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert
		cut.WaitForState(() => callbackResult.HasValue, TimeSpan.FromSeconds(1));
		callbackResult.Should().BeTrue();
	}

	[Fact]
	public async Task CopyButton_ShowsError_WhenClipboardFails() {
		// Arrange
		var jsMock = new Mock<IJSRuntime>();
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.ThrowsAsync(new JSException("Clipboard not available"));
		Services.AddSingleton(jsMock.Object);

		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test text")
			.Add(p => p.FeedbackDuration, 5000));

		// Act
		await cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert
		cut.WaitForState(() => cut.Find(".copy-button").ClassList.Contains("error"), TimeSpan.FromSeconds(1));
		cut.Find(".copy-text").TextContent.Should().Be("Failed");
		cut.Find(".copy-icon").TextContent.Should().Contain("✗");
	}

	[Fact]
	public async Task CopyButton_InvokesOnCopy_WithFalse_OnError() {
		// Arrange
		var jsMock = new Mock<IJSRuntime>();
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.ThrowsAsync(new JSException("Clipboard not available"));
		Services.AddSingleton(jsMock.Object);

		bool? callbackResult = null;
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test text")
			.Add(p => p.OnCopy, EventCallback.Factory.Create<bool>(this, result => callbackResult = result)));

		// Act
		await cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert
		cut.WaitForState(() => callbackResult.HasValue, TimeSpan.FromSeconds(1));
		callbackResult.Should().BeFalse();
	}

	[Fact]
	public async Task CopyButton_DoesNotInvokeClipboard_WhenTextIsEmpty() {
		// Arrange
		var jsMock = new Mock<IJSRuntime>();
		var invoked = false;
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.Callback(() => invoked = true)
			.ReturnsAsync((Microsoft.JSInterop.Infrastructure.IJSVoidResult)null!);
		Services.AddSingleton(jsMock.Object);

		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, ""));

		// Act
		await cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert - should still be in ready state and not have invoked clipboard
		cut.Find(".copy-button").ClassList.Should().Contain("ready");
		invoked.Should().BeFalse();
	}

	[Fact]
	public async Task CopyButton_ShowsCopyingState_DuringCopy() {
		// Arrange
		var tcs = new TaskCompletionSource<Microsoft.JSInterop.Infrastructure.IJSVoidResult>();
		var jsMock = new Mock<IJSRuntime>();
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.Returns(new ValueTask<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(tcs.Task));
		Services.AddSingleton(jsMock.Object);

		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test text"));

		// Act - click but don't complete the task yet
		var clickTask = cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert - should be in copying state
		cut.WaitForState(() => cut.Find(".copy-button").ClassList.Contains("copying"), TimeSpan.FromSeconds(1));
		cut.Find(".copy-text").TextContent.Should().Be("Copying...");
		cut.Find(".copy-icon").TextContent.Should().Contain("⏳");

		// Cleanup
		tcs.SetResult(null!);
		await clickTask;
	}

	[Fact]
	public async Task CopyButton_IsDisabled_DuringCopy() {
		// Arrange
		var tcs = new TaskCompletionSource<Microsoft.JSInterop.Infrastructure.IJSVoidResult>();
		var jsMock = new Mock<IJSRuntime>();
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.Returns(new ValueTask<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(tcs.Task));
		Services.AddSingleton(jsMock.Object);

		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test text"));

		// Act - click but don't complete the task yet
		var clickTask = cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert - should be disabled during copying
		cut.WaitForState(() => cut.Find(".copy-button").HasAttribute("disabled"), TimeSpan.FromSeconds(1));

		// Cleanup
		tcs.SetResult(null!);
		await clickTask;
	}

	[Fact]
	public async Task CopyButton_InvokesJsWithCorrectText() {
		// Arrange
		var expectedText = "Text to be copied!";
		string? actualText = null;
		var jsMock = new Mock<IJSRuntime>();
		jsMock.Setup(x => x.InvokeAsync<Microsoft.JSInterop.Infrastructure.IJSVoidResult>(
			"navigator.clipboard.writeText",
			It.IsAny<object?[]>()))
			.Callback<string, object?[]>((_, args) => actualText = args[0]?.ToString())
			.ReturnsAsync((Microsoft.JSInterop.Infrastructure.IJSVoidResult)null!);
		Services.AddSingleton(jsMock.Object);

		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, expectedText));

		// Act
		await cut.Find(".copy-button").ClickAsync(new Microsoft.AspNetCore.Components.Web.MouseEventArgs());

		// Assert
		cut.WaitForState(() => actualText != null, TimeSpan.FromSeconds(1));
		actualText.Should().Be(expectedText);
	}

	[Fact]
	public void CopyButton_UsesCustomCopiedLabel() {
		// Arrange - verify the custom label parameter is set
		SetupJsMock();
		var customLabel = "Custom Copied!";

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test")
			.Add(p => p.CopiedLabel, customLabel));

		// Assert - the component accepts the parameter
		cut.Instance.CopiedLabel.Should().Be(customLabel);
	}

	[Fact]
	public void CopyButton_UsesCustomErrorLabel() {
		// Arrange - verify the custom label parameter is set
		SetupJsMock();
		var customLabel = "Custom Error!";

		// Act
		var cut = RenderComponent<CopyButton>(parameters => parameters
			.Add(p => p.Text, "test")
			.Add(p => p.ErrorLabel, customLabel));

		// Assert - the component accepts the parameter
		cut.Instance.ErrorLabel.Should().Be(customLabel);
	}

	private Mock<IJSRuntime> SetupJsMock() {
		var jsMock = new Mock<IJSRuntime>();
		Services.AddSingleton(jsMock.Object);
		return jsMock;
	}
}
