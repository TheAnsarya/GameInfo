using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;
using static DarkRepos.Web.Components.Shared.Avatar;

namespace DarkRepos.Tests.Components;

public class AvatarTests : TestContext {
	[Fact]
	public void Avatar_RendersImage_WhenImageUrlProvided() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.ImageUrl, "/avatar.jpg"));

		// Assert
		cut.Find(".avatar-image").GetAttribute("src").Should().Be("/avatar.jpg");
	}

	[Fact]
	public void Avatar_ImageHasAltText() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.ImageUrl, "/avatar.jpg")
			.Add(p => p.AltText, "User avatar"));

		// Assert
		cut.Find(".avatar-image").GetAttribute("alt").Should().Be("User avatar");
	}

	[Fact]
	public void Avatar_ShowsInitials_WhenNameProvided() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.Name, "John Doe"));

		// Assert
		cut.Find(".avatar-initials").TextContent.Should().Be("JD");
	}

	[Fact]
	public void Avatar_ShowsInitials_SingleName() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.Name, "Admin"));

		// Assert
		cut.Find(".avatar-initials").TextContent.Should().Be("AD");
	}

	[Fact]
	public void Avatar_ShowsPlaceholder_WhenNoImageOrName() {
		// Act
		var cut = RenderComponent<Avatar>();

		// Assert
		cut.Find(".avatar-placeholder").Should().NotBeNull();
	}

	[Theory]
	[InlineData(AvatarSize.Small, "avatar--small")]
	[InlineData(AvatarSize.Medium, "avatar--medium")]
	[InlineData(AvatarSize.Large, "avatar--large")]
	[InlineData(AvatarSize.XLarge, "avatar--xlarge")]
	public void Avatar_AppliesSizeClass(AvatarSize size, string expectedClass) {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.Size, size));

		// Assert
		cut.Find(".avatar").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Avatar_ShowsStatus_WhenShowStatusTrue() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.ShowStatus, true)
			.Add(p => p.Status, AvatarStatus.Online));

		// Assert
		cut.Find(".avatar-status").Should().NotBeNull();
		cut.Find(".avatar-status").ClassList.Should().Contain("avatar-status--online");
	}

	[Fact]
	public void Avatar_HidesStatus_WhenShowStatusFalse() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.ShowStatus, false)
			.Add(p => p.Status, AvatarStatus.Online));

		// Assert
		cut.FindAll(".avatar-status").Should().BeEmpty();
	}

	[Theory]
	[InlineData(AvatarStatus.Online, "avatar-status--online")]
	[InlineData(AvatarStatus.Away, "avatar-status--away")]
	[InlineData(AvatarStatus.Busy, "avatar-status--busy")]
	[InlineData(AvatarStatus.Offline, "avatar-status--offline")]
	public void Avatar_AppliesStatusClass(AvatarStatus status, string expectedClass) {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.ShowStatus, true)
			.Add(p => p.Status, status));

		// Assert
		cut.Find(".avatar-status").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void Avatar_HasTitle_WhenNameProvided() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.Name, "John Doe"));

		// Assert
		cut.Find(".avatar").GetAttribute("title").Should().Be("John Doe");
	}

	[Fact]
	public void Avatar_AppliesCustomCssClass() {
		// Act
		var cut = RenderComponent<Avatar>(parameters => parameters
			.Add(p => p.CssClass, "my-avatar"));

		// Assert
		cut.Find(".avatar").ClassList.Should().Contain("my-avatar");
	}
}
