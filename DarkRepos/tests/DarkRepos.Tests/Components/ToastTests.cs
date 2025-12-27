using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Xunit;

namespace DarkRepos.Tests.Components;

public class ToastTests : TestContext {
	[Fact]
	public void Toast_DisplaysMessage() {
		// Arrange
		const string message = "Operation completed successfully";

		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, message));

		// Assert
		cut.Markup.Should().Contain(message);
	}

	[Fact]
	public void Toast_DisplaysTitle_WhenProvided() {
		// Arrange
		const string title = "Success";
		const string message = "Operation completed";

		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Title, title)
			.Add(p => p.Message, message));

		// Assert
		cut.Markup.Should().Contain(title);
		cut.Find(".toast-title").Should().NotBeNull();
	}

	[Fact]
	public void Toast_OmitsTitle_WhenNull() {
		// Arrange
		const string message = "Operation completed";

		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, message));

		// Assert
		cut.FindAll(".toast-title").Should().BeEmpty();
	}

	[Fact]
	public void Toast_HasCorrectTypeClass_ForSuccess() {
		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Success message")
			.Add(p => p.Type, Toast.ToastType.Success));

		// Assert
		cut.Find(".toast").ClassList.Should().Contain("toast-success");
	}

	[Fact]
	public void Toast_HasCorrectTypeClass_ForError() {
		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Error message")
			.Add(p => p.Type, Toast.ToastType.Error));

		// Assert
		cut.Find(".toast").ClassList.Should().Contain("toast-error");
	}

	[Fact]
	public void Toast_HasCorrectTypeClass_ForWarning() {
		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Warning message")
			.Add(p => p.Type, Toast.ToastType.Warning));

		// Assert
		cut.Find(".toast").ClassList.Should().Contain("toast-warning");
	}

	[Fact]
	public void Toast_HasCorrectTypeClass_ForInfo() {
		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Info message")
			.Add(p => p.Type, Toast.ToastType.Info));

		// Assert
		cut.Find(".toast").ClassList.Should().Contain("toast-info");
	}

	[Fact]
	public void Toast_ShowsCloseButton_WhenDismissible() {
		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Message")
			.Add(p => p.Dismissible, true));

		// Assert
		cut.Find(".toast-close").Should().NotBeNull();
	}

	[Fact]
	public void Toast_HidesCloseButton_WhenNotDismissible() {
		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Message")
			.Add(p => p.Dismissible, false));

		// Assert
		cut.FindAll(".toast-close").Should().BeEmpty();
	}

	[Fact]
	public void Toast_HasAlertRole() {
		// Act
		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Message"));

		// Assert
		cut.Find(".toast").GetAttribute("role").Should().Be("alert");
	}

	[Fact]
	public async Task Toast_InvokesOnClose_WhenDismissed() {
		// Arrange
		var closedCalled = false;

		var cut = RenderComponent<Toast>(parameters => parameters
			.Add(p => p.Message, "Message")
			.Add(p => p.AutoClose, false)
			.Add(p => p.OnClose, EventCallback.Factory.Create(this, () => closedCalled = true)));

		// Act
		cut.Find(".toast-close").Click();
		await Task.Delay(350);

		// Assert
		closedCalled.Should().BeTrue();
	}
}
