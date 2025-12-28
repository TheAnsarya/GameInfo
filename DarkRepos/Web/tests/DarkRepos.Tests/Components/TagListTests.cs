using Bunit;
using DarkRepos.Web.Components.Shared;
using FluentAssertions;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Xunit;

namespace DarkRepos.Tests.Components;

/// <summary>
/// Tests for the TagList component.
/// </summary>
public class TagListTests : TestContext {
	[Fact]
	public void TagList_RendersTags() {
		// Arrange
		var tags = new[] { "tag1", "tag2", "tag3" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags));

		// Assert
		cut.FindAll(".tag").Should().HaveCount(3);
	}

	[Fact]
	public void TagList_ShowsTagText() {
		// Arrange
		var tags = new[] { "Test Tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags));

		// Assert
		cut.Find(".tag-text").TextContent.Should().Be("Test Tag");
	}

	[Fact]
	public void TagList_ShowsHashIcon_ByDefault() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags));

		// Assert
		cut.Find(".tag-icon").TextContent.Should().Be("#");
	}

	[Fact]
	public void TagList_HidesIcon_WhenShowIconFalse() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.ShowIcon, false));

		// Assert
		cut.FindAll(".tag-icon").Should().BeEmpty();
	}

	[Fact]
	public void TagList_ShowsRemoveButton_WhenRemovable() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.Removable, true));

		// Assert
		cut.Find(".tag-remove").Should().NotBeNull();
	}

	[Fact]
	public void TagList_HidesRemoveButton_WhenNotRemovable() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.Removable, false));

		// Assert
		cut.FindAll(".tag-remove").Should().BeEmpty();
	}

	[Fact]
	public void TagList_HasCompactClass_WhenCompact() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.Compact, true));

		// Assert
		cut.Find(".tag-list").ClassList.Should().Contain("compact");
	}

	[Fact]
	public void TagList_HasWrapClass_ByDefault() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags));

		// Assert
		cut.Find(".tag-list").ClassList.Should().Contain("wrap");
	}

	[Fact]
	public void TagList_NoWrapClass_WhenWrapFalse() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.Wrap, false));

		// Assert
		cut.Find(".tag-list").ClassList.Should().NotContain("wrap");
	}

	[Fact]
	public async Task TagList_InvokesOnTagClick() {
		// Arrange
		var tags = new[] { "clickable" };
		string? clickedTag = null;

		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.OnTagClick, EventCallback.Factory.Create<string>(this, t => clickedTag = t)));

		// Act
		await cut.Find(".tag").ClickAsync(new MouseEventArgs());

		// Assert
		clickedTag.Should().Be("clickable");
	}

	[Fact]
	public async Task TagList_InvokesOnTagRemove() {
		// Arrange
		var tags = new[] { "removable" };
		string? removedTag = null;

		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.Removable, true)
			.Add(p => p.OnTagRemove, EventCallback.Factory.Create<string>(this, t => removedTag = t)));

		// Act
		await cut.Find(".tag-remove").ClickAsync(new MouseEventArgs());

		// Assert
		removedTag.Should().Be("removable");
	}

	[Fact]
	public void TagList_HasRoleButton() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags));

		// Assert
		cut.Find(".tag").GetAttribute("role").Should().Be("button");
	}

	[Fact]
	public void TagList_HasTabIndex() {
		// Arrange
		var tags = new[] { "tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags));

		// Assert
		cut.Find(".tag").GetAttribute("tabindex").Should().Be("0");
	}

	[Fact]
	public void TagList_RemoveButton_HasAriaLabel() {
		// Arrange
		var tags = new[] { "test-tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.Removable, true));

		// Assert
		cut.Find(".tag-remove").GetAttribute("aria-label").Should().Be("Remove test-tag");
	}

	[Fact]
	public void TagList_ShowsOverflow_WhenMaxVisibleSet() {
		// Arrange
		var tags = new[] { "tag1", "tag2", "tag3", "tag4", "tag5" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.MaxVisible, 3));

		// Assert
		cut.Find(".tag-overflow").TextContent.Should().Contain("+2 more");
	}

	[Fact]
	public void TagList_NoOverflow_WhenAllTagsVisible() {
		// Arrange
		var tags = new[] { "tag1", "tag2" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.MaxVisible, 5));

		// Assert
		cut.FindAll(".tag-overflow").Should().BeEmpty();
	}

	[Fact]
	public void TagList_NoOverflow_WhenMaxVisibleZero() {
		// Arrange
		var tags = new[] { "tag1", "tag2", "tag3" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.MaxVisible, 0));

		// Assert
		cut.FindAll(".tag-overflow").Should().BeEmpty();
	}

	[Theory]
	[InlineData("nes", "tag-red")]
	[InlineData("snes", "tag-purple")]
	[InlineData("gb", "tag-green")]
	[InlineData("gba", "tag-blue")]
	[InlineData("genesis", "tag-cyan")]
	[InlineData("rpg", "tag-gold")]
	[InlineData("action", "tag-red")]
	[InlineData("puzzle", "tag-green")]
	[InlineData("platformer", "tag-orange")]
	[InlineData("rom hack", "tag-pink")]
	[InlineData("translation", "tag-teal")]
	[InlineData("tool", "tag-gray")]
	[InlineData("documentation", "tag-indigo")]
	public void TagList_AppliesCorrectColorClass(string tag, string expectedClass) {
		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, new[] { tag }));

		// Assert
		cut.Find(".tag").ClassList.Should().Contain(expectedClass);
	}

	[Fact]
	public void TagList_AppliesDefaultColorClass_ForUnknownTag() {
		// Arrange
		var tags = new[] { "unknown-tag" };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags));

		// Assert
		cut.Find(".tag").ClassList.Should().Contain("tag-default");
	}

	[Fact]
	public void TagList_UsesCustomColorFromDictionary() {
		// Arrange
		var tags = new[] { "custom" };
		var colors = new Dictionary<string, string> { { "custom", "tag-pink" } };

		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.TagColors, colors));

		// Assert
		cut.Find(".tag").ClassList.Should().Contain("tag-pink");
	}

	[Fact]
	public void TagList_HandlesNullTags() {
		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, null));

		// Assert
		cut.FindAll(".tag").Should().BeEmpty();
	}

	[Fact]
	public void TagList_HandlesEmptyTags() {
		// Act
		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, Array.Empty<string>()));

		// Assert
		cut.FindAll(".tag").Should().BeEmpty();
	}

	[Fact]
	public async Task TagList_InvokesOnTagClick_OnEnterKey() {
		// Arrange
		var tags = new[] { "keyboard" };
		string? clickedTag = null;

		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.OnTagClick, EventCallback.Factory.Create<string>(this, t => clickedTag = t)));

		// Act
		await cut.Find(".tag").KeyDownAsync(new KeyboardEventArgs { Key = "Enter" });

		// Assert
		clickedTag.Should().Be("keyboard");
	}

	[Fact]
	public async Task TagList_InvokesOnTagClick_OnSpaceKey() {
		// Arrange
		var tags = new[] { "keyboard" };
		string? clickedTag = null;

		var cut = RenderComponent<TagList>(parameters => parameters
			.Add(p => p.Tags, tags)
			.Add(p => p.OnTagClick, EventCallback.Factory.Create<string>(this, t => clickedTag = t)));

		// Act
		await cut.Find(".tag").KeyDownAsync(new KeyboardEventArgs { Key = " " });

		// Assert
		clickedTag.Should().Be("keyboard");
	}
}
