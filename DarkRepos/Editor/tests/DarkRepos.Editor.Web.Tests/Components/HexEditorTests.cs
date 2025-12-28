using Bunit;
using FluentAssertions;
using NSubstitute;
using Xunit;
using DarkRepos.Editor.Core.Interfaces;
using DarkRepos.Editor.Shared.Components.Editors.HexEditor;
using Microsoft.Extensions.DependencyInjection;

namespace DarkRepos.Editor.Web.Tests.Components;

public class HexEditorTests : TestContext
{
	private readonly IHexEditorService _mockHexService;

	public HexEditorTests()
	{
		_mockHexService = Substitute.For<IHexEditorService>();
		Services.AddScoped(_ => _mockHexService);
	}

	#region Rendering Tests

	[Fact]
	public void HexEditor_RendersEmptyState_WhenNoDataLoaded()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		cut.Find(".empty-state").Should().NotBeNull();
		cut.Find(".empty-state h3").TextContent.Should().Contain("No ROM Loaded");
	}

	[Fact]
	public void HexEditor_RendersToolbar_Always()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		cut.Find(".hex-toolbar").Should().NotBeNull();
	}

	[Fact]
	public void HexEditor_RendersStatusBar_Always()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		cut.Find(".hex-status").Should().NotBeNull();
	}

	[Fact]
	public void HexEditor_HasOpenButton_InToolbar()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var openButton = cut.Find("button[title*='Open ROM']");
		openButton.Should().NotBeNull();
	}

	#endregion

	#region Toolbar Tests

	[Fact]
	public void HexEditor_SaveButton_IsDisabled_WhenNoData()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var saveButton = cut.Find("button[title*='Save']");
		saveButton.HasAttribute("disabled").Should().BeTrue();
	}

	[Fact]
	public void HexEditor_UndoButton_IsDisabled_Initially()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var undoButton = cut.Find("button[title*='Undo']");
		undoButton.HasAttribute("disabled").Should().BeTrue();
	}

	[Fact]
	public void HexEditor_RedoButton_IsDisabled_Initially()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var redoButton = cut.Find("button[title*='Redo']");
		redoButton.HasAttribute("disabled").Should().BeTrue();
	}

	[Fact]
	public void HexEditor_SearchButton_IsDisabled_WhenNoData()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var searchButton = cut.Find("button[title*='Search']");
		searchButton.HasAttribute("disabled").Should().BeTrue();
	}

	[Fact]
	public void HexEditor_ViewModeSelect_Exists()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var viewSelect = cut.Find(".view-mode-select");
		viewSelect.Should().NotBeNull();
	}

	[Fact]
	public void HexEditor_ViewModeSelect_HasThreeOptions()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var options = cut.FindAll(".view-mode-select option");
		options.Count.Should().Be(3);
	}

	#endregion

	#region Open File Tests

	[Fact]
	public void HexEditor_ClickOpenButton_LoadsSampleData()
	{
		// Arrange
		var cut = RenderComponent<HexEditor>();

		// Act
		var openButton = cut.Find("button[title*='Open ROM']");
		openButton.Click();

		// Assert - should now show hex grid instead of empty state
		var exists = cut.Markup.Contains("hex-grid");
		exists.Should().BeTrue();
	}

	[Fact]
	public void HexEditor_AfterOpen_ShowsFileName()
	{
		// Arrange
		var cut = RenderComponent<HexEditor>();

		// Act
		cut.Find("button[title*='Open ROM']").Click();

		// Assert
		cut.Find(".file-info").TextContent.Should().Contain("Sample Data");
	}

	[Fact]
	public void HexEditor_AfterOpen_ShowsFileSize()
	{
		// Arrange
		var cut = RenderComponent<HexEditor>();

		// Act
		cut.Find("button[title*='Open ROM']").Click();

		// Assert
		cut.Find(".size-info").TextContent.Should().Contain("bytes");
	}

	#endregion

	#region Panel Tests

	    [Fact]
	public void HexEditor_SearchPanel_NotVisible_Initially()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		cut.Markup.Contains("search-panel").Should().BeFalse();
	}

	[Fact]
	public void HexEditor_GoToPanel_NotVisible_Initially()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		cut.Markup.Contains("goto-panel").Should().BeFalse();
	}

	#endregion

	#region Status Bar Tests

	[Fact]
	public void HexEditor_StatusBar_ShowsOffset()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		cut.Find(".hex-status").TextContent.Should().Contain("Offset:");
	}

	[Fact]
	public void HexEditor_StatusBar_ShowsValue()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		cut.Find(".hex-status").TextContent.Should().Contain("Value:");
	}

	#endregion

	#region Accessibility Tests

	[Fact]
	public void HexEditor_HasTabIndex_ForKeyboardNavigation()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var editor = cut.Find(".hex-editor");
		editor.GetAttribute("tabindex").Should().Be("0");
	}

	[Fact]
	public void HexEditor_Buttons_HaveTitles_ForAccessibility()
	{
		// Act
		var cut = RenderComponent<HexEditor>();

		// Assert
		var buttons = cut.FindAll(".hex-toolbar button");
		buttons.Should().AllSatisfy(b => b.HasAttribute("title").Should().BeTrue());
	}

	#endregion
}
