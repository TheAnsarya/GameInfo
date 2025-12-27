using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;
using static DarkRepos.Web.Components.Shared.StatusBadge;

namespace DarkRepos.Web.Tests.Components;

/// <summary>
/// Unit tests for the StatusBadge component.
/// </summary>
public class StatusBadgeTests : TestContext
{
	[Fact]
	public void StatusBadge_RendersContainer()
	{
		// Act
		var cut = RenderComponent<StatusBadge>();

		// Assert
		cut.Find(".status-badge").Should().NotBeNull();
	}

	[Theory]
	[InlineData(StatusType.Complete, "complete")]
	[InlineData(StatusType.InProgress, "in-progress")]
	[InlineData(StatusType.Planned, "planned")]
	[InlineData(StatusType.Available, "available")]
	[InlineData(StatusType.Unavailable, "unavailable")]
	[InlineData(StatusType.Success, "success")]
	[InlineData(StatusType.Warning, "warning")]
	[InlineData(StatusType.Error, "error")]
	[InlineData(StatusType.Info, "info")]
	[InlineData(StatusType.Unknown, "unknown")]
	public void StatusBadge_AppliesCorrectStatusClass(StatusType status, string expectedClass)
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
			p.Add(s => s.Status, status));

		// Assert
		var badge = cut.Find(".status-badge");
		badge.ClassList.Should().Contain($"status-{expectedClass}");
	}

	[Fact]
	public void StatusBadge_ShowsIcon_WhenShowIconIsTrue()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
		{
			p.Add(s => s.Status, StatusType.Complete);
			p.Add(s => s.ShowIcon, true);
		});

		// Assert
		cut.Find(".status-icon").Should().NotBeNull();
	}

	[Fact]
	public void StatusBadge_HidesIcon_WhenShowIconIsFalse()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
		{
			p.Add(s => s.Status, StatusType.Complete);
			p.Add(s => s.ShowIcon, false);
		});

		// Assert
		cut.FindAll(".status-icon").Should().BeEmpty();
	}

	[Fact]
	public void StatusBadge_ShowsLabel_WhenShowLabelIsTrue()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
		{
			p.Add(s => s.Status, StatusType.Complete);
			p.Add(s => s.ShowLabel, true);
		});

		// Assert
		cut.Find(".status-label").Should().NotBeNull();
	}

	[Fact]
	public void StatusBadge_HidesLabel_WhenShowLabelIsFalse()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
		{
			p.Add(s => s.Status, StatusType.Complete);
			p.Add(s => s.ShowLabel, false);
		});

		// Assert
		cut.FindAll(".status-label").Should().BeEmpty();
	}

	[Fact]
	public void StatusBadge_UsesDefaultLabel_ForStatus()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
			p.Add(s => s.Status, StatusType.InProgress));

		// Assert
		cut.Find(".status-label").TextContent.Should().Be("In Progress");
	}

	[Fact]
	public void StatusBadge_UsesCustomLabel_WhenProvided()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
		{
			p.Add(s => s.Status, StatusType.InProgress);
			p.Add(s => s.Label, "Building...");
		});

		// Assert
		cut.Find(".status-label").TextContent.Should().Be("Building...");
	}

	[Fact]
	public void StatusBadge_HasCorrectIcon_ForCompleteStatus()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
			p.Add(s => s.Status, StatusType.Complete));

		// Assert
		cut.Find(".status-icon").TextContent.Should().Be("✓");
	}

	[Fact]
	public void StatusBadge_HasCorrectIcon_ForErrorStatus()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
			p.Add(s => s.Status, StatusType.Error));

		// Assert
		cut.Find(".status-icon").TextContent.Should().Be("✗");
	}

	[Fact]
	public void StatusBadge_HasRoleStatus()
	{
		// Act
		var cut = RenderComponent<StatusBadge>();

		// Assert
		cut.Find(".status-badge").GetAttribute("role").Should().Be("status");
	}

	[Fact]
	public void StatusBadge_HasAriaLabel()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
			p.Add(s => s.Status, StatusType.Complete));

		// Assert
		cut.Find(".status-badge").GetAttribute("aria-label").Should().Be("Status: Complete");
	}

	[Fact]
	public void StatusBadge_IconHasAriaHidden()
	{
		// Act
		var cut = RenderComponent<StatusBadge>(p =>
			p.Add(s => s.ShowIcon, true));

		// Assert
		cut.Find(".status-icon").GetAttribute("aria-hidden").Should().Be("true");
	}
}
