using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the DiscordInvite component.
/// </summary>
public class DiscordInviteTests : TestContext
{
	[Fact]
	public void DiscordInvite_RendersWithServerName()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test Server")
			.Add(p => p.InviteCode, "abc123"));

		// Assert
		cut.Find(".discord-server-name").TextContent.Should().Be("Test Server");
	}

	[Fact]
	public void DiscordInvite_GeneratesCorrectInviteUrl()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "mycode123"));

		// Assert
		var joinButton = cut.Find(".discord-join-button");
		joinButton.GetAttribute("href").Should().Be("https://discord.gg/mycode123");
	}

	[Fact]
	public void DiscordInvite_ShowsDescription_WhenProvided()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.Description, "Join our community!"));

		// Assert
		cut.Find(".discord-server-description").TextContent.Should().Be("Join our community!");
	}

	[Fact]
	public void DiscordInvite_HidesDescription_WhenCompact()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.Description, "Join our community!")
			.Add(p => p.Compact, true));

		// Assert
		cut.FindAll(".discord-server-description").Should().BeEmpty();
	}

	[Fact]
	public void DiscordInvite_ShowsOnlineCount_WhenGreaterThanZero()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.OnlineCount, 42));

		// Assert
		cut.Find(".discord-online").TextContent.Should().Contain("42");
		cut.Find(".discord-online").TextContent.Should().Contain("Online");
	}

	[Fact]
	public void DiscordInvite_HidesOnlineCount_WhenZero()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.OnlineCount, 0));

		// Assert
		cut.FindAll(".discord-online").Should().BeEmpty();
	}

	[Fact]
	public void DiscordInvite_ShowsMemberCount_WhenGreaterThanZero()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.MemberCount, 150));

		// Assert
		cut.Find(".discord-members").TextContent.Should().Contain("150");
		cut.Find(".discord-members").TextContent.Should().Contain("Members");
	}

	[Fact]
	public void DiscordInvite_HidesMemberCount_WhenZero()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.MemberCount, 0));

		// Assert
		cut.FindAll(".discord-members").Should().BeEmpty();
	}

	[Fact]
	public void DiscordInvite_FormatsLargeCount_AsK()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.MemberCount, 1500));

		// Assert
		cut.Find(".discord-members").TextContent.Should().Contain("1.5K");
	}

	[Fact]
	public void DiscordInvite_FormatsVeryLargeCount_AsM()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.MemberCount, 2500000));

		// Assert
		cut.Find(".discord-members").TextContent.Should().Contain("2.5M");
	}

	[Fact]
	public void DiscordInvite_ShowsServerIcon_WhenUrlProvided()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.ServerIconUrl, "https://example.com/icon.png"));

		// Assert
		var img = cut.Find("img.discord-server-icon");
		img.GetAttribute("src").Should().Be("https://example.com/icon.png");
	}

	[Fact]
	public void DiscordInvite_ShowsPlaceholder_WhenNoIconUrl()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Dark Repos")
			.Add(p => p.InviteCode, "abc"));

		// Assert
		var placeholder = cut.Find(".discord-server-icon-placeholder");
		placeholder.TextContent.Should().Be("DR");
	}

	[Fact]
	public void DiscordInvite_GeneratesCorrectInitials_ForTwoWords()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Game Info")
			.Add(p => p.InviteCode, "abc"));

		// Assert
		cut.Find(".discord-server-icon-placeholder").TextContent.Should().Be("GI");
	}

	[Fact]
	public void DiscordInvite_GeneratesCorrectInitials_ForSingleWord()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Discord")
			.Add(p => p.InviteCode, "abc"));

		// Assert
		cut.Find(".discord-server-icon-placeholder").TextContent.Should().Be("DI");
	}

	[Fact]
	public void DiscordInvite_HasCompactClass_WhenCompactIsTrue()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.Compact, true));

		// Assert
		cut.Find(".discord-invite").ClassList.Should().Contain("compact");
	}

	[Fact]
	public void DiscordInvite_JoinButton_HasTargetBlank()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc"));

		// Assert
		var joinButton = cut.Find(".discord-join-button");
		joinButton.GetAttribute("target").Should().Be("_blank");
		joinButton.GetAttribute("rel").Should().Contain("noopener");
	}

	[Fact]
	public void DiscordInvite_HasDiscordLogo()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc"));

		// Assert
		cut.FindAll(".discord-logo svg").Should().NotBeEmpty();
	}

	[Fact]
	public void DiscordInvite_ShowsJoinLabel()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc"));

		// Assert
		cut.Find(".discord-label").TextContent.Should().Contain("Discord");
	}

	[Fact]
	public void DiscordInvite_ShowsOnlineStatusDot()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.OnlineCount, 10));

		// Assert
		cut.FindAll(".discord-status-dot.online").Should().NotBeEmpty();
	}

	[Fact]
	public void DiscordInvite_HandlesEmptyServerName()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "")
			.Add(p => p.InviteCode, "abc"));

		// Assert
		cut.Find(".discord-server-icon-placeholder").TextContent.Should().Be("?");
	}

	[Fact]
	public void DiscordInvite_ImageHasLazyLoading()
	{
		// Act
		var cut = RenderComponent<DiscordInvite>(parameters => parameters
			.Add(p => p.ServerName, "Test")
			.Add(p => p.InviteCode, "abc")
			.Add(p => p.ServerIconUrl, "https://example.com/icon.png"));

		// Assert
		var img = cut.Find("img.discord-server-icon");
		img.GetAttribute("loading").Should().Be("lazy");
	}
}
