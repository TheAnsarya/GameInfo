using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the RelativeTime component.
/// </summary>
public class RelativeTimeTests : TestContext
{
	[Fact]
	public void RelativeTime_RendersTimeElement()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddMinutes(-5);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").Should().NotBeNull();
	}

	[Fact]
	public void RelativeTime_HasDateTimeAttribute()
	{
		// Arrange
		var dateTime = new DateTime(2025, 12, 27, 10, 30, 0, DateTimeKind.Utc);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").GetAttribute("datetime").Should().Contain("2025-12-27");
	}

	[Fact]
	public void RelativeTime_HasTitleWithFullDateTime()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddHours(-2);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").GetAttribute("title").Should().NotBeNullOrEmpty();
	}

	[Fact]
	public void RelativeTime_ShowsJustNow_ForRecentTimes()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddSeconds(-2);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("just now");
	}

	[Fact]
	public void RelativeTime_ShowsSeconds()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddSeconds(-30);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("second");
		cut.Find("time").TextContent.Should().Contain("ago");
	}

	[Fact]
	public void RelativeTime_ShowsMinutes()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddMinutes(-15);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("minute");
		cut.Find("time").TextContent.Should().Contain("ago");
	}

	[Fact]
	public void RelativeTime_ShowsHours()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddHours(-5);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("hour");
		cut.Find("time").TextContent.Should().Contain("ago");
	}

	[Fact]
	public void RelativeTime_ShowsYesterday()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(-1).AddHours(-2);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("yesterday");
	}

	[Fact]
	public void RelativeTime_ShowsDays()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(-4);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("day");
		cut.Find("time").TextContent.Should().Contain("ago");
	}

	[Fact]
	public void RelativeTime_ShowsLastWeek()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(-10);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("last week");
	}

	[Fact]
	public void RelativeTime_ShowsWeeks()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(-20);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("week");
		cut.Find("time").TextContent.Should().Contain("ago");
	}

	[Fact]
	public void RelativeTime_ShowsLastMonth()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(-45);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("last month");
	}

	[Fact]
	public void RelativeTime_ShowsMonths()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddMonths(-5);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("month");
		cut.Find("time").TextContent.Should().Contain("ago");
	}

	[Fact]
	public void RelativeTime_ShowsLastYear()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(-400);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("last year");
	}

	[Fact]
	public void RelativeTime_ShowsYears()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddYears(-3);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("year");
		cut.Find("time").TextContent.Should().Contain("ago");
	}

	[Fact]
	public void RelativeTime_ShowsTomorrow_ForFutureDates()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(1).AddHours(2);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("tomorrow");
	}

	[Fact]
	public void RelativeTime_ShowsFutureMinutes()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddMinutes(30);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Contain("in");
		cut.Find("time").TextContent.Should().Contain("minute");
	}

	[Fact]
	public void RelativeTime_ShowsNextWeek()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddDays(10);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("next week");
	}

	[Fact]
	public void RelativeTime_HasFutureClass_ForFutureDates()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddHours(5);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").ClassList.Should().Contain("future");
	}

	[Fact]
	public void RelativeTime_HasPastClass_ForPastDates()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddHours(-5);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").ClassList.Should().Contain("past");
	}

	[Fact]
	public void RelativeTime_UsesSingular_ForOneUnit()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddMinutes(-1);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("1 minute ago");
	}

	[Fact]
	public void RelativeTime_UsesPlural_ForMultipleUnits()
	{
		// Arrange
		var dateTime = DateTime.UtcNow.AddMinutes(-5);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").TextContent.Should().Be("5 minutes ago");
	}

	[Fact]
	public void RelativeTime_AcceptsCustomTooltipFormat()
	{
		// Arrange
		var dateTime = new DateTime(2025, 12, 27, 10, 30, 0, DateTimeKind.Utc);

		// Act
		var cut = RenderComponent<RelativeTime>(parameters => parameters
			.Add(p => p.DateTime, dateTime)
			.Add(p => p.TooltipFormat, "yyyy-MM-dd")
			.Add(p => p.AutoUpdate, false));

		// Assert
		cut.Find("time").GetAttribute("title").Should().Be("2025-12-27");
	}
}
