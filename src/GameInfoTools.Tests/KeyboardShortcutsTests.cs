using Avalonia.Input;
using GameInfoTools.UI.Services;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for KeyboardShortcuts static class.
/// </summary>
public class KeyboardShortcutsTests {
	#region Common Shortcuts

	[Fact]
	public void Undo_IsCtrlZ() {
		Assert.Equal(Key.Z, KeyboardShortcuts.Undo.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Undo.KeyModifiers);
	}

	[Fact]
	public void Redo_IsCtrlY() {
		Assert.Equal(Key.Y, KeyboardShortcuts.Redo.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Redo.KeyModifiers);
	}

	[Fact]
	public void RedoAlt_IsCtrlShiftZ() {
		Assert.Equal(Key.Z, KeyboardShortcuts.RedoAlt.Key);
		Assert.Equal(KeyModifiers.Control | KeyModifiers.Shift, KeyboardShortcuts.RedoAlt.KeyModifiers);
	}

	[Fact]
	public void Save_IsCtrlS() {
		Assert.Equal(Key.S, KeyboardShortcuts.Save.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Save.KeyModifiers);
	}

	[Fact]
	public void SaveAs_IsCtrlShiftS() {
		Assert.Equal(Key.S, KeyboardShortcuts.SaveAs.Key);
		Assert.Equal(KeyModifiers.Control | KeyModifiers.Shift, KeyboardShortcuts.SaveAs.KeyModifiers);
	}

	[Fact]
	public void Open_IsCtrlO() {
		Assert.Equal(Key.O, KeyboardShortcuts.Open.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Open.KeyModifiers);
	}

	[Fact]
	public void Copy_IsCtrlC() {
		Assert.Equal(Key.C, KeyboardShortcuts.Copy.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Copy.KeyModifiers);
	}

	[Fact]
	public void Paste_IsCtrlV() {
		Assert.Equal(Key.V, KeyboardShortcuts.Paste.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Paste.KeyModifiers);
	}

	[Fact]
	public void Cut_IsCtrlX() {
		Assert.Equal(Key.X, KeyboardShortcuts.Cut.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Cut.KeyModifiers);
	}

	[Fact]
	public void SelectAll_IsCtrlA() {
		Assert.Equal(Key.A, KeyboardShortcuts.SelectAll.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.SelectAll.KeyModifiers);
	}

	[Fact]
	public void Delete_IsDeleteKey() {
		Assert.Equal(Key.Delete, KeyboardShortcuts.Delete.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.Delete.KeyModifiers);
	}

	[Fact]
	public void Find_IsCtrlF() {
		Assert.Equal(Key.F, KeyboardShortcuts.Find.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Find.KeyModifiers);
	}

	[Fact]
	public void FindNext_IsF3() {
		Assert.Equal(Key.F3, KeyboardShortcuts.FindNext.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.FindNext.KeyModifiers);
	}

	[Fact]
	public void FindPrevious_IsShiftF3() {
		Assert.Equal(Key.F3, KeyboardShortcuts.FindPrevious.Key);
		Assert.Equal(KeyModifiers.Shift, KeyboardShortcuts.FindPrevious.KeyModifiers);
	}

	[Fact]
	public void Replace_IsCtrlH() {
		Assert.Equal(Key.H, KeyboardShortcuts.Replace.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.Replace.KeyModifiers);
	}

	[Fact]
	public void GoTo_IsCtrlG() {
		Assert.Equal(Key.G, KeyboardShortcuts.GoTo.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.GoTo.KeyModifiers);
	}

	#endregion

	#region Navigation Shortcuts

	[Fact]
	public void NavigateBack_IsAltLeft() {
		Assert.Equal(Key.Left, KeyboardShortcuts.NavigateBack.Key);
		Assert.Equal(KeyModifiers.Alt, KeyboardShortcuts.NavigateBack.KeyModifiers);
	}

	[Fact]
	public void NavigateForward_IsAltRight() {
		Assert.Equal(Key.Right, KeyboardShortcuts.NavigateForward.Key);
		Assert.Equal(KeyModifiers.Alt, KeyboardShortcuts.NavigateForward.KeyModifiers);
	}

	[Fact]
	public void GoToDefinition_IsF12() {
		Assert.Equal(Key.F12, KeyboardShortcuts.GoToDefinition.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.GoToDefinition.KeyModifiers);
	}

	[Fact]
	public void FindReferences_IsShiftF12() {
		Assert.Equal(Key.F12, KeyboardShortcuts.FindReferences.Key);
		Assert.Equal(KeyModifiers.Shift, KeyboardShortcuts.FindReferences.KeyModifiers);
	}

	#endregion

	#region Hex Editor Shortcuts

	[Fact]
	public void FillSelection_IsCtrlL() {
		Assert.Equal(Key.L, KeyboardShortcuts.FillSelection.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.FillSelection.KeyModifiers);
	}

	[Fact]
	public void ToggleCompare_IsCtrlD() {
		Assert.Equal(Key.D, KeyboardShortcuts.ToggleCompare.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.ToggleCompare.KeyModifiers);
	}

	#endregion

	#region Disassembler Shortcuts

	[Fact]
	public void FollowAddress_IsEnter() {
		Assert.Equal(Key.Enter, KeyboardShortcuts.FollowAddress.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.FollowAddress.KeyModifiers);
	}

	[Fact]
	public void AddLabel_IsCtrlL() {
		Assert.Equal(Key.L, KeyboardShortcuts.AddLabel.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.AddLabel.KeyModifiers);
	}

	[Fact]
	public void AddBookmark_IsCtrlB() {
		Assert.Equal(Key.B, KeyboardShortcuts.AddBookmark.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.AddBookmark.KeyModifiers);
	}

	[Fact]
	public void ToggleSymbols_IsCtrlAltS() {
		Assert.Equal(Key.S, KeyboardShortcuts.ToggleSymbols.Key);
		Assert.Equal(KeyModifiers.Control | KeyModifiers.Alt, KeyboardShortcuts.ToggleSymbols.KeyModifiers);
	}

	[Fact]
	public void ToggleCrossReferences_IsCtrlAltX() {
		Assert.Equal(Key.X, KeyboardShortcuts.ToggleCrossReferences.Key);
		Assert.Equal(KeyModifiers.Control | KeyModifiers.Alt, KeyboardShortcuts.ToggleCrossReferences.KeyModifiers);
	}

	[Fact]
	public void Disassemble_IsF5() {
		Assert.Equal(Key.F5, KeyboardShortcuts.Disassemble.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.Disassemble.KeyModifiers);
	}

	#endregion

	#region CHR Editor Shortcuts

	[Fact]
	public void FlipHorizontal_IsH() {
		Assert.Equal(Key.H, KeyboardShortcuts.FlipHorizontal.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.FlipHorizontal.KeyModifiers);
	}

	[Fact]
	public void FlipVertical_IsV() {
		Assert.Equal(Key.V, KeyboardShortcuts.FlipVertical.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.FlipVertical.KeyModifiers);
	}

	[Fact]
	public void Rotate90_IsR() {
		Assert.Equal(Key.R, KeyboardShortcuts.Rotate90.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.Rotate90.KeyModifiers);
	}

	[Fact]
	public void ToggleMultiSelect_IsM() {
		Assert.Equal(Key.M, KeyboardShortcuts.ToggleMultiSelect.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.ToggleMultiSelect.KeyModifiers);
	}

	[Fact]
	public void PreviousTile_IsComma() {
		Assert.Equal(Key.OemComma, KeyboardShortcuts.PreviousTile.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.PreviousTile.KeyModifiers);
	}

	[Fact]
	public void NextTile_IsPeriod() {
		Assert.Equal(Key.OemPeriod, KeyboardShortcuts.NextTile.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.NextTile.KeyModifiers);
	}

	[Fact]
	public void PreviousBank_IsOpenBracket() {
		Assert.Equal(Key.OemOpenBrackets, KeyboardShortcuts.PreviousBank.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.PreviousBank.KeyModifiers);
	}

	[Fact]
	public void NextBank_IsCloseBracket() {
		Assert.Equal(Key.OemCloseBrackets, KeyboardShortcuts.NextBank.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.NextBank.KeyModifiers);
	}

	#endregion

	#region Map Editor Shortcuts

	[Fact]
	public void PencilTool_IsP() {
		Assert.Equal(Key.P, KeyboardShortcuts.PencilTool.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.PencilTool.KeyModifiers);
	}

	[Fact]
	public void FillTool_IsF() {
		Assert.Equal(Key.F, KeyboardShortcuts.FillTool.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.FillTool.KeyModifiers);
	}

	[Fact]
	public void RectangleTool_IsR() {
		Assert.Equal(Key.R, KeyboardShortcuts.RectangleTool.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.RectangleTool.KeyModifiers);
	}

	[Fact]
	public void LineTool_IsL() {
		Assert.Equal(Key.L, KeyboardShortcuts.LineTool.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.LineTool.KeyModifiers);
	}

	[Fact]
	public void SelectionTool_IsS() {
		Assert.Equal(Key.S, KeyboardShortcuts.SelectionTool.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.SelectionTool.KeyModifiers);
	}

	[Fact]
	public void EyedropperTool_IsE() {
		Assert.Equal(Key.E, KeyboardShortcuts.EyedropperTool.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.EyedropperTool.KeyModifiers);
	}

	[Fact]
	public void ToggleGrid_IsG() {
		Assert.Equal(Key.G, KeyboardShortcuts.ToggleGrid.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.ToggleGrid.KeyModifiers);
	}

	[Fact]
	public void ZoomIn_IsCtrlPlus() {
		Assert.Equal(Key.OemPlus, KeyboardShortcuts.ZoomIn.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.ZoomIn.KeyModifiers);
	}

	[Fact]
	public void ZoomOut_IsCtrlMinus() {
		Assert.Equal(Key.OemMinus, KeyboardShortcuts.ZoomOut.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.ZoomOut.KeyModifiers);
	}

	[Fact]
	public void ResetZoom_IsCtrl0() {
		Assert.Equal(Key.D0, KeyboardShortcuts.ResetZoom.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.ResetZoom.KeyModifiers);
	}

	#endregion

	#region Script Editor Shortcuts

	[Fact]
	public void BuildCFG_IsCtrlShiftG() {
		Assert.Equal(Key.G, KeyboardShortcuts.BuildCFG.Key);
		Assert.Equal(KeyModifiers.Control | KeyModifiers.Shift, KeyboardShortcuts.BuildCFG.KeyModifiers);
	}

	[Fact]
	public void ValidateScript_IsF5() {
		Assert.Equal(Key.F5, KeyboardShortcuts.ValidateScript.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.ValidateScript.KeyModifiers);
	}

	[Fact]
	public void LoadScript_IsCtrlEnter() {
		Assert.Equal(Key.Enter, KeyboardShortcuts.LoadScript.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.LoadScript.KeyModifiers);
	}

	#endregion

	#region CDL Viewer Shortcuts

	[Fact]
	public void MarkAsCode_IsC() {
		Assert.Equal(Key.C, KeyboardShortcuts.MarkAsCode.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.MarkAsCode.KeyModifiers);
	}

	[Fact]
	public void MarkAsData_IsD() {
		Assert.Equal(Key.D, KeyboardShortcuts.MarkAsData.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.MarkAsData.KeyModifiers);
	}

	[Fact]
	public void ClearFlags_IsX() {
		Assert.Equal(Key.X, KeyboardShortcuts.ClearFlags.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.ClearFlags.KeyModifiers);
	}

	[Fact]
	public void ToggleLabelsPanel_IsL() {
		Assert.Equal(Key.L, KeyboardShortcuts.ToggleLabelsPanel.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.ToggleLabelsPanel.KeyModifiers);
	}

	[Fact]
	public void ToggleRegionsPanel_IsR() {
		Assert.Equal(Key.R, KeyboardShortcuts.ToggleRegionsPanel.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.ToggleRegionsPanel.KeyModifiers);
	}

	[Fact]
	public void ToggleCdlComparison_IsCtrlD() {
		Assert.Equal(Key.D, KeyboardShortcuts.ToggleCdlComparison.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.ToggleCdlComparison.KeyModifiers);
	}

	[Fact]
	public void CdlNextBank_IsCloseBracket() {
		Assert.Equal(Key.OemCloseBrackets, KeyboardShortcuts.CdlNextBank.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.CdlNextBank.KeyModifiers);
	}

	[Fact]
	public void CdlPreviousBank_IsOpenBracket() {
		Assert.Equal(Key.OemOpenBrackets, KeyboardShortcuts.CdlPreviousBank.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.CdlPreviousBank.KeyModifiers);
	}

	[Fact]
	public void AddCdlBookmark_IsCtrlB() {
		Assert.Equal(Key.B, KeyboardShortcuts.AddCdlBookmark.Key);
		Assert.Equal(KeyModifiers.Control, KeyboardShortcuts.AddCdlBookmark.KeyModifiers);
	}

	[Fact]
	public void NextDifference_IsN() {
		Assert.Equal(Key.N, KeyboardShortcuts.NextDifference.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.NextDifference.KeyModifiers);
	}

	[Fact]
	public void PreviousDifference_IsShiftN() {
		Assert.Equal(Key.N, KeyboardShortcuts.PreviousDifference.Key);
		Assert.Equal(KeyModifiers.Shift, KeyboardShortcuts.PreviousDifference.KeyModifiers);
	}

	#endregion

	#region View Shortcuts

	[Fact]
	public void ToggleFullScreen_IsF11() {
		Assert.Equal(Key.F11, KeyboardShortcuts.ToggleFullScreen.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.ToggleFullScreen.KeyModifiers);
	}

	[Fact]
	public void Refresh_IsF5() {
		Assert.Equal(Key.F5, KeyboardShortcuts.Refresh.Key);
		Assert.Equal(KeyModifiers.None, KeyboardShortcuts.Refresh.KeyModifiers);
	}

	#endregion

	#region GetDisplayString Tests

	[Fact]
	public void GetDisplayString_CtrlZ_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.Undo);
		Assert.Equal("Ctrl+Z", result);
	}

	[Fact]
	public void GetDisplayString_CtrlShiftZ_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.RedoAlt);
		Assert.Equal("Ctrl+Shift+Z", result);
	}

	[Fact]
	public void GetDisplayString_AltLeft_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.NavigateBack);
		Assert.Equal("Alt+Left", result);
	}

	[Fact]
	public void GetDisplayString_F3_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.FindNext);
		Assert.Equal("F3", result);
	}

	[Fact]
	public void GetDisplayString_CtrlPlus_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.ZoomIn);
		Assert.Equal("Ctrl++", result);
	}

	[Fact]
	public void GetDisplayString_CtrlMinus_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.ZoomOut);
		Assert.Equal("Ctrl+-", result);
	}

	[Fact]
	public void GetDisplayString_OpenBracket_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.PreviousBank);
		Assert.Equal("[", result);
	}

	[Fact]
	public void GetDisplayString_CloseBracket_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.NextBank);
		Assert.Equal("]", result);
	}

	[Fact]
	public void GetDisplayString_Comma_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.PreviousTile);
		Assert.Equal(",", result);
	}

	[Fact]
	public void GetDisplayString_Period_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.NextTile);
		Assert.Equal(".", result);
	}

	[Fact]
	public void GetDisplayString_Ctrl0_ReturnsCorrectString() {
		var result = KeyboardShortcuts.GetDisplayString(KeyboardShortcuts.ResetZoom);
		Assert.Equal("Ctrl+0", result);
	}

	#endregion

	#region Alias Tests (Same shortcuts used in different contexts)

	[Fact]
	public void GoToOffset_SameAsGoTo() {
		Assert.Equal(KeyboardShortcuts.GoTo.Key, KeyboardShortcuts.GoToOffset.Key);
		Assert.Equal(KeyboardShortcuts.GoTo.KeyModifiers, KeyboardShortcuts.GoToOffset.KeyModifiers);
	}

	[Fact]
	public void ValidateScript_SameAsDisassemble() {
		Assert.Equal(KeyboardShortcuts.Disassemble.Key, KeyboardShortcuts.ValidateScript.Key);
		Assert.Equal(KeyboardShortcuts.Disassemble.KeyModifiers, KeyboardShortcuts.ValidateScript.KeyModifiers);
	}

	#endregion
}
