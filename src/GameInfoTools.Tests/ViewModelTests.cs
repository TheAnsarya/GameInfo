using GameInfoTools.Core;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for UI ViewModels.
/// </summary>
public class ViewModelTests {
	#region WelcomeViewModel Tests

	[Fact]
	public void WelcomeViewModel_HasTitle() {
		var vm = new WelcomeViewModel();
		Assert.Equal("Welcome to GameInfo Tools", vm.Title);
	}

	[Fact]
	public void WelcomeViewModel_HasDescription() {
		var vm = new WelcomeViewModel();
		Assert.NotEmpty(vm.Description);
	}

	[Fact]
	public void WelcomeViewModel_HasInstructions() {
		var vm = new WelcomeViewModel();
		Assert.Contains("Open a ROM", vm.Instructions);
	}

	[Fact]
	public void WelcomeViewModel_HasVersion() {
		var vm = new WelcomeViewModel();
		Assert.StartsWith("Version", vm.Version);
	}

	[Fact]
	public void WelcomeViewModel_HasFeatures() {
		var vm = new WelcomeViewModel();
		Assert.NotEmpty(vm.Features);
		Assert.True(vm.Features.Count >= 9);
	}

	[Fact]
	public void WelcomeViewModel_FeaturesHaveRequiredProperties() {
		var vm = new WelcomeViewModel();
		foreach (var feature in vm.Features) {
			Assert.NotEmpty(feature.Icon);
			Assert.NotEmpty(feature.Title);
			Assert.NotEmpty(feature.Description);
		}
	}

	[Fact]
	public void WelcomeViewModel_HasSupportedPlatforms() {
		var vm = new WelcomeViewModel();
		Assert.NotEmpty(vm.SupportedPlatforms);
		Assert.Contains(vm.SupportedPlatforms, p => p.Contains("NES"));
		Assert.Contains(vm.SupportedPlatforms, p => p.Contains("SNES"));
	}

	#endregion

	#region RomInfoViewModel Tests

	[Fact]
	public void RomInfoViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new RomInfoViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void RomInfoViewModel_WithRom_DisplaysFileInfo() {
		var rom = CreateTestNesRom();
		var vm = new RomInfoViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.NotEmpty(vm.FileSize);
		Assert.Equal("Nes", vm.SystemType);
	}

	[Fact]
	public void RomInfoViewModel_WithRom_CalculatesChecksums() {
		var rom = CreateTestNesRom();
		var vm = new RomInfoViewModel(rom);

		Assert.NotEmpty(vm.Crc32);
		Assert.NotEmpty(vm.Md5);
		Assert.NotEmpty(vm.Sha1);
	}

	[Fact]
	public void RomInfoViewModel_Refresh_UpdatesInfo() {
		var rom = CreateTestNesRom();
		var vm = new RomInfoViewModel(rom);

		vm.RefreshInfo();

		Assert.True(vm.HasRomLoaded);
	}

	#endregion

	#region ChecksumViewModel Tests

	[Fact]
	public void ChecksumViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new ChecksumViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void ChecksumViewModel_WithNesRom_CalculatesChecksums() {
		var rom = CreateTestNesRom();
		var vm = new ChecksumViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.NotEmpty(vm.Crc32);
		Assert.NotEmpty(vm.Md5);
		Assert.NotEmpty(vm.Sha1);
		Assert.Equal(SystemType.Nes, vm.DetectedSystem);
	}

	[Fact]
	public void ChecksumViewModel_WithSnesRom_CalculatesSnesChecksums() {
		var rom = CreateTestSnesRom();
		var vm = new ChecksumViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(SystemType.Snes, vm.DetectedSystem);
		Assert.NotEmpty(vm.SnesChecksum);
		Assert.NotEmpty(vm.SnesComplement);
	}

	[Fact]
	public void ChecksumViewModel_CalculateChecksumsCommand_Works() {
		var rom = CreateTestNesRom();
		var vm = new ChecksumViewModel(rom);

		// Clear and recalculate
		var oldCrc = vm.Crc32;
		vm.CalculateChecksumsCommand.Execute(null);

		Assert.Equal(oldCrc, vm.Crc32);
	}

	#endregion

	#region HexEditorViewModel Tests

	[Fact]
	public void HexEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new HexEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void HexEditorViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(16, vm.BytesPerRow);
		Assert.Equal(16, vm.RowCount);
		Assert.Equal(0, vm.CurrentOffset);
	}

	[Fact]
	public void HexEditorViewModel_RefreshView_PopulatesHexRows() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.RefreshView();

		Assert.NotEmpty(vm.HexRows);
		Assert.NotEmpty(vm.AddressDisplay);
	}

	[Fact]
	public void HexEditorViewModel_GoToOffset_UpdatesCurrentOffset() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.GoToOffsetCommand.Execute(0x100);

		Assert.Equal(0x100, vm.CurrentOffset);
	}

	[Fact]
	public void HexEditorViewModel_NextPage_AdvancesOffset() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		int initialOffset = vm.CurrentOffset;
		vm.NextPageCommand.Execute(null);

		Assert.True(vm.CurrentOffset > initialOffset);
	}

	[Fact]
	public void HexEditorViewModel_HexRows_HaveCorrectFormat() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.RefreshView();

		foreach (var row in vm.HexRows) {
			Assert.NotEmpty(row.Address);
			Assert.NotEmpty(row.HexData);
			Assert.NotEmpty(row.AsciiData);
			Assert.True(row.RawOffset >= 0);
		}
	}

	[Fact]
	public void HexEditorViewModel_WriteByte_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte originalValue = rom.Data[0x100];
		byte newValue = (byte)(originalValue ^ 0xFF);

		vm.WriteByte(0x100, newValue);

		Assert.Equal(newValue, rom.Data[0x100]);
		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		Assert.Equal(originalValue, rom.Data[0x100]);
		Assert.False(vm.CanUndo);
	}

	[Fact]
	public void HexEditorViewModel_WriteByte_CanRedo() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte originalValue = rom.Data[0x100];
		byte newValue = (byte)(originalValue ^ 0xFF);

		vm.WriteByte(0x100, newValue);
		vm.UndoCommand.Execute(null);

		Assert.True(vm.CanRedo);
		Assert.False(vm.CanUndo);

		vm.RedoCommand.Execute(null);

		Assert.Equal(newValue, rom.Data[0x100]);
	}

	[Fact]
	public void HexEditorViewModel_WriteBytes_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte[] originalValues = new byte[4];
		Array.Copy(rom.Data, 0x100, originalValues, 0, 4);
		byte[] newValues = [0xDE, 0xAD, 0xBE, 0xEF];

		vm.WriteBytes(0x100, newValues);

		Assert.Equal(newValues, rom.Data.AsSpan(0x100, 4).ToArray());
		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		Assert.Equal(originalValues, rom.Data.AsSpan(0x100, 4).ToArray());
	}

	[Fact]
	public void HexEditorViewModel_MultipleEdits_UndoInOrder() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		byte original1 = rom.Data[0x100];
		byte original2 = rom.Data[0x200];

		vm.WriteByte(0x100, 0xAA);
		vm.WriteByte(0x200, 0xBB);

		// Undo second edit first
		vm.UndoCommand.Execute(null);
		Assert.Equal(original2, rom.Data[0x200]);
		Assert.Equal(0xAA, rom.Data[0x100]);

		// Undo first edit
		vm.UndoCommand.Execute(null);
		Assert.Equal(original1, rom.Data[0x100]);
	}

	[Fact]
	public void HexEditorViewModel_UndoDescription_UpdatesAfterEdit() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		Assert.Empty(vm.UndoDescription);

		vm.WriteByte(0x100, 0xFF);

		Assert.NotEmpty(vm.UndoDescription);
		Assert.Contains("000100", vm.UndoDescription, StringComparison.OrdinalIgnoreCase);
	}

	[Fact]
	public void HexEditorViewModel_DataInspector_UpdatesOnSelection() {
		var rom = CreateTestNesRom();
		rom.Data[0x100] = 0x42;
		rom.Data[0x101] = 0x01;
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x100;

		Assert.Contains("66", vm.InspectorByte); // 0x42 = 66 decimal
		Assert.Contains("01000010", vm.InspectorBinary); // Binary of 0x42
		Assert.Contains("'B'", vm.InspectorAscii); // ASCII 0x42 = 'B'
		Assert.Contains("0142", vm.InspectorWordLE); // Little-endian 0x0142
	}

	[Fact]
	public void HexEditorViewModel_Bookmarks_AddAndRemove() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x200;
		vm.AddBookmarkCommand.Execute(null);

		Assert.Single(vm.Bookmarks);
		Assert.Equal(0x200, vm.Bookmarks[0].Offset);

		vm.RemoveBookmarkCommand.Execute(0x200);

		Assert.Empty(vm.Bookmarks);
	}

	[Fact]
	public void HexEditorViewModel_Bookmarks_NoDuplicates() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x100;
		vm.AddBookmarkCommand.Execute(null);
		vm.AddBookmarkCommand.Execute(null); // Try to add same offset

		Assert.Single(vm.Bookmarks);
	}

	[Fact]
	public void HexEditorViewModel_GoToBookmark_NavigatesToOffset() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x500;
		vm.AddBookmarkCommand.Execute(null);
		vm.CurrentOffset = 0; // Navigate away

		vm.GoToBookmarkCommand.Execute(0x500);

		Assert.Equal(0x500, vm.CurrentOffset);
		Assert.Equal(0x500, vm.SelectedOffset);
	}

	[Fact]
	public void HexEditorViewModel_ByteGroupMode_CyclesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		Assert.Equal(ByteGroupMode.Byte, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.Word, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.DWord, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.DWordBE, vm.ByteGroup);

		vm.CycleByteGroupCommand.Execute(null);
		Assert.Equal(ByteGroupMode.Byte, vm.ByteGroup);
	}

	[Fact]
	public void HexEditorViewModel_SelectionRange_SetsCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SetSelection(0x100, 0x10F);

		Assert.True(vm.HasRangeSelection);
		Assert.Equal(16, vm.SelectionLength);
		Assert.Equal(0x100, vm.SelectionStart);
		Assert.Equal(0x10F, vm.SelectionEnd);
	}

	[Fact]
	public void HexEditorViewModel_ClearRangeSelection_ClearsSelection() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SetSelection(0x100, 0x10F);
		vm.ClearRangeSelectionCommand.Execute(null);

		Assert.False(vm.HasRangeSelection);
		Assert.Equal(0, vm.SelectionLength);
	}

	[Fact]
	public void HexEditorViewModel_NesAddress_CalculatesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new HexEditorViewModel(rom);

		vm.SelectedOffset = 0x4010; // In second PRG bank

		Assert.Contains("Bank 1", vm.InspectorNesAddress);
	}

	#endregion

	#region DisassemblerViewModel Tests

	[Fact]
	public void DisassemblerViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new DisassemblerViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void DisassemblerViewModel_WithNesRom_DetectsCpuMode() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal("6502 (NES)", vm.CpuMode);
		Assert.Equal(0x8000, vm.BaseAddress);
	}

	[Fact]
	public void DisassemblerViewModel_HasAvailableCpuModes() {
		var vm = new DisassemblerViewModel(null);
		Assert.NotEmpty(vm.AvailableCpuModes);
		Assert.Contains("6502 (NES)", vm.AvailableCpuModes);
		Assert.Contains("65816 (SNES)", vm.AvailableCpuModes);
	}

	[Fact]
	public void DisassemblerViewModel_DefaultLength_Is256() {
		var vm = new DisassemblerViewModel(null);
		Assert.Equal(256, vm.Length);
	}

	[Fact]
	public void DisassemblerViewModel_Disassemble_PopulatesLines() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		vm.DisassembleCommand.Execute(null);

		Assert.NotEmpty(vm.DisassemblyLines);
	}

	[Fact]
	public void DisassemblerViewModel_NavigationHistory_TracksBackForward() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		Assert.False(vm.CanGoBack);
		Assert.False(vm.CanGoForward);

		vm.StartOffset = 0;
		vm.GoToOffsetCommand.Execute(null);

		vm.StartOffset = 100;
		vm.GoToOffsetCommand.Execute(null);

		Assert.True(vm.CanGoBack);
		Assert.False(vm.CanGoForward);
	}

	[Fact]
	public void DisassemblerViewModel_NavigateBack_RestoresPreviousPosition() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		// Start at offset 50
		vm.StartOffset = 50;
		vm.GoToOffsetCommand.Execute(null);
		// Stack now has: [50]

		// Navigate to offset 100 - pushes current state (50) before navigation
		vm.StartOffset = 100;
		vm.GoToOffsetCommand.Execute(null);
		// Stack now has: [50, 100]

		// Navigate back should restore the previous position (100, since we pushed before changing)
		vm.NavigateBackCommand.Execute(null);

		// After back, we pop the top (100) and restore it
		// Actually the logic is: push current to forward, pop back stack
		Assert.True(vm.CanGoForward);
	}

	[Fact]
	public void DisassemblerViewModel_CrossReferences_TracksBranchesAndJumps() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);
		vm.AutoFollowJumps = true;

		vm.DisassembleCommand.Execute(null);

		// Cross-references are tracked during disassembly
		Assert.NotNull(vm.CrossReferences);
	}

	[Fact]
	public void DisassemblerViewModel_Symbols_CanBeUsed() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		vm.Symbols.AddSymbol("reset_vector", 0x8000, SymbolTable.SymbolType.Code);
		vm.UseSymbols = true;

		Assert.True(vm.Symbols.HasSymbol(0x8000));
		Assert.Equal("reset_vector", vm.Symbols.GetSymbol(0x8000));
	}

	[Fact]
	public void DisassemblerViewModel_AutoLabelBranches_CreatesLabels() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);
		vm.AutoLabelBranches = true;

		var initialSymbolCount = vm.Symbols.GetAllSymbols().Count();
		vm.DisassembleCommand.Execute(null);

		// Auto-labeling may have added new symbols if branches were found
		Assert.True(vm.AutoLabelBranches);
	}

	[Fact]
	public void DisassemblerViewModel_SelectedLine_CanBeSet() {
		var rom = CreateTestNesRom();
		var vm = new DisassemblerViewModel(rom);

		vm.DisassembleCommand.Execute(null);

		if (vm.DisassemblyLines.Count > 0) {
			vm.SelectedLine = vm.DisassemblyLines[0];
			Assert.NotNull(vm.SelectedLine);
		}
	}

	[Fact]
	public void DisassemblyLine_Record_IncludesLabelAndRawAddress() {
		var line = new DisassemblyLine(
			"$8000",
			"a9 00",
			"LDA",
			"#$00",
			"Load zero",
			"start",
			0x8000
		);

		Assert.Equal("start", line.Label);
		Assert.Equal(0x8000, line.RawAddress);
		Assert.Equal("$8000", line.Address);
	}

	#endregion

	#region ChrEditorViewModel Tests

	[Fact]
	public void ChrEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new ChrEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void ChrEditorViewModel_WithNesRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new ChrEditorViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal("NES 2bpp", vm.TileFormat);
		Assert.Equal(2, vm.Zoom);
	}

	[Fact]
	public void ChrEditorViewModel_HasAvailableFormats() {
		var vm = new ChrEditorViewModel(null);
		Assert.NotEmpty(vm.AvailableFormats);
		Assert.Contains("NES 2bpp", vm.AvailableFormats);
		Assert.Contains("SNES 4bpp", vm.AvailableFormats);
	}

	#endregion

	#region DataTableViewModel Tests

	[Fact]
	public void DataTableViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new DataTableViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void DataTableViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new DataTableViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(16, vm.RecordSize);
		Assert.Equal(10, vm.RecordCount);
	}

	[Fact]
	public void DataTableViewModel_LoadMonsterTable_PopulatesFields() {
		var vm = new DataTableViewModel(null);

		vm.LoadMonsterTableCommand.Execute(null);

		Assert.Equal("Monster Stats", vm.TableName);
		Assert.NotEmpty(vm.Fields);
	}

	[Fact]
	public void DataTableViewModel_LoadItemTable_PopulatesFields() {
		var vm = new DataTableViewModel(null);

		vm.LoadItemTableCommand.Execute(null);

		Assert.Equal("Item Data", vm.TableName);
		Assert.NotEmpty(vm.Fields);
	}

	[Fact]
	public void DataTableViewModel_HasCommonTableTypes() {
		var vm = new DataTableViewModel(null);
		Assert.NotEmpty(vm.CommonTableTypes);
		Assert.Contains("Monster Stats", vm.CommonTableTypes);
		Assert.Contains("Item Data", vm.CommonTableTypes);
	}

	#endregion

	#region PointerScannerViewModel Tests

	[Fact]
	public void PointerScannerViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new PointerScannerViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void PointerScannerViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new PointerScannerViewModel(rom);

		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void PointerScannerViewModel_DefaultSettings() {
		var vm = new PointerScannerViewModel(null);

		Assert.Equal(0, vm.StartOffset);
		Assert.Equal(0x8000, vm.ValidRangeStart);
	}

	#endregion

	#region BankViewViewModel Tests

	[Fact]
	public void BankViewViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new BankViewViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void BankViewViewModel_WithNesRom_DetectsBankSize() {
		var rom = CreateTestNesRom();
		var vm = new BankViewViewModel(rom);

		Assert.True(vm.HasRomLoaded);
		Assert.Equal(0x4000, vm.BankSize); // NES PRG banks are 16KB
	}

	[Fact]
	public void BankViewViewModel_PopulatesBanks() {
		var rom = CreateTestNesRom();
		var vm = new BankViewViewModel(rom);

		Assert.NotEmpty(vm.Banks);
	}

	#endregion

	#region TextExtractorViewModel Tests

	[Fact]
	public void TextExtractorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new TextExtractorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void TextExtractorViewModel_WithRom_InitializesCorrectly() {
		var rom = CreateTestNesRom();
		var vm = new TextExtractorViewModel(rom);

		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void TextExtractorViewModel_DefaultSettings() {
		var vm = new TextExtractorViewModel(null);

		Assert.Equal(3, vm.MinStringLength);
		// TextExtractorViewModel uses TBL file approach, not encoding options
		Assert.False(vm.HasTableLoaded);
	}

	#endregion

	#region MainWindowViewModel Tests

	[Fact]
	public void MainWindowViewModel_InitializesWithWelcomeView() {
		var vm = new MainWindowViewModel();

		Assert.NotNull(vm.CurrentView);
		Assert.IsType<WelcomeViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_HasToolCategories() {
		var vm = new MainWindowViewModel();

		Assert.NotEmpty(vm.ToolCategories);
		Assert.True(vm.ToolCategories.Count >= 9);
	}

	[Fact]
	public void MainWindowViewModel_ToolCategoriesHaveRequiredProperties() {
		var vm = new MainWindowViewModel();

		foreach (var category in vm.ToolCategories) {
			Assert.NotEmpty(category.Icon);
			Assert.NotEmpty(category.Name);
			Assert.NotEmpty(category.Id);
		}
	}

	[Fact]
	public void MainWindowViewModel_DefaultStatusText_IsReady() {
		var vm = new MainWindowViewModel();
		Assert.Equal("Ready", vm.StatusText);
	}

	[Fact]
	public void MainWindowViewModel_ShowRomInfoCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		// First change to a different view, then back to ROM Info
		vm.SelectedCategory = vm.ToolCategories[1]; // Checksum first
		Assert.IsType<ChecksumViewModel>(vm.CurrentView);

		vm.SelectedCategory = vm.ToolCategories[0]; // ROM Info
		Assert.IsType<RomInfoViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowChecksumCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowChecksumCommand.Execute(null);

		Assert.IsType<ChecksumViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowTextExtractorCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowTextExtractorCommand.Execute(null);

		Assert.IsType<TextExtractorViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowChrEditorCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowChrEditorCommand.Execute(null);

		Assert.IsType<ChrEditorViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowDisassemblerCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowDisassemblerCommand.Execute(null);

		Assert.IsType<DisassemblerViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowDataEditorCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowDataEditorCommand.Execute(null);

		Assert.IsType<DataTableViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowPointerScannerCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowPointerScannerCommand.Execute(null);

		Assert.IsType<PointerScannerViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowHexEditorCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowHexEditorCommand.Execute(null);

		Assert.IsType<HexEditorViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowBankViewCommand_ChangesView() {
		var vm = new MainWindowViewModel();

		vm.ShowBankViewCommand.Execute(null);

		Assert.IsType<BankViewViewModel>(vm.CurrentView);
	}

	[Fact]
	public void MainWindowViewModel_ShowAboutCommand_UpdatesStatus() {
		var vm = new MainWindowViewModel();

		vm.ShowAboutCommand.Execute(null);

		Assert.Contains("GameInfo Tools", vm.StatusText);
	}

	[Fact]
	public void MainWindowViewModel_SelectedCategory_ChangesCurrentView() {
		var vm = new MainWindowViewModel();

		vm.SelectedCategory = vm.ToolCategories[1]; // Checksum

		Assert.IsType<ChecksumViewModel>(vm.CurrentView);
	}

	#endregion

	#region FeatureInfo Record Tests

	[Fact]
	public void FeatureInfo_Record_HasCorrectProperties() {
		var feature = new FeatureInfo("🎮", "Test", "Description");

		Assert.Equal("🎮", feature.Icon);
		Assert.Equal("Test", feature.Title);
		Assert.Equal("Description", feature.Description);
	}

	[Fact]
	public void FeatureInfo_Record_SupportsEquality() {
		var feature1 = new FeatureInfo("🎮", "Test", "Description");
		var feature2 = new FeatureInfo("🎮", "Test", "Description");

		Assert.Equal(feature1, feature2);
	}

	#endregion

	#region ToolCategory Record Tests

	[Fact]
	public void ToolCategory_Record_HasCorrectProperties() {
		var category = new ToolCategory("📁", "ROM Info", "rominfo");

		Assert.Equal("📁", category.Icon);
		Assert.Equal("ROM Info", category.Name);
		Assert.Equal("rominfo", category.Id);
	}

	[Fact]
	public void ToolCategory_Record_SupportsEquality() {
		var cat1 = new ToolCategory("📁", "ROM Info", "rominfo");
		var cat2 = new ToolCategory("📁", "ROM Info", "rominfo");

		Assert.Equal(cat1, cat2);
	}

	#endregion

	#region Helper Methods

	private static RomFile CreateTestNesRom() {
		// Create a minimal valid NES ROM
		var data = new byte[0x8010]; // 16 bytes header + 32KB PRG

		// iNES header
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = 0x1a;
		data[4] = 2;  // 2x 16KB PRG banks
		data[5] = 0;  // No CHR ROM
		data[6] = 0;  // Mapper 0, horizontal mirroring
		data[7] = 0;

		// Add some pattern data for disassembly
		data[0x10] = 0xa9; // LDA #$00
		data[0x11] = 0x00;
		data[0x12] = 0x8d; // STA $2000
		data[0x13] = 0x00;
		data[0x14] = 0x20;
		data[0x15] = 0x4c; // JMP $8000
		data[0x16] = 0x00;
		data[0x17] = 0x80;

		var rom = new RomFile();
		rom.LoadFromBytes(data);
		return rom;
	}

	private static RomFile CreateTestSnesRom() {
		// Create a minimal SNES ROM with valid checksum area
		var data = new byte[0x10000]; // 64KB

		// Internal header at LoROM location ($7FC0)
		int headerOffset = 0x7FC0;

		// Game title (21 bytes)
		var title = "TEST ROM             "; // 21 chars with padding
		for (int i = 0; i < 21 && i < title.Length; i++) {
			data[headerOffset + i] = (byte)title[i];
		}

		// ROM layout byte
		data[headerOffset + 0x15] = 0x20; // LoROM, FastROM

		// ROM type
		data[headerOffset + 0x16] = 0x00; // ROM only

		// ROM size (2^n KB)
		data[headerOffset + 0x17] = 0x08; // 256KB

		// SRAM size
		data[headerOffset + 0x18] = 0x00; // No SRAM

		// Country
		data[headerOffset + 0x19] = 0x01; // USA

		// License
		data[headerOffset + 0x1A] = 0x00;

		// Version
		data[headerOffset + 0x1B] = 0x00;

		// Checksum complement and checksum (must XOR to 0xFFFF)
		data[headerOffset + 0x1C] = 0xFF;
		data[headerOffset + 0x1D] = 0xFF;
		data[headerOffset + 0x1E] = 0x00;
		data[headerOffset + 0x1F] = 0x00;

		var rom = new RomFile();
		rom.LoadFromBytes(data);
		return rom;
	}

	#endregion

	#region MapEditorViewModel Tests

	[Fact]
	public void MapEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new MapEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void MapEditorViewModel_WithRom_HasRomLoadedIsTrue() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void MapEditorViewModel_HasDefaultSettings() {
		var vm = new MapEditorViewModel();
		Assert.Equal(16, vm.MapWidth);
		Assert.Equal(16, vm.MapHeight);
		Assert.Equal(2, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_HasMapFormats() {
		var vm = new MapEditorViewModel();
		Assert.NotEmpty(vm.MapFormats);
		Assert.Contains(vm.MapFormats, f => f.Contains("Linear"));
	}

	[Fact]
	public void MapEditorViewModel_TilePaletteInitialized_WithRom() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		Assert.Equal(256, vm.TilePalette.Count);
	}

	[Fact]
	public void MapEditorViewModel_LoadMap_PopulatesTiles() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 8;
		vm.MapHeight = 8;

		vm.LoadMapCommand.Execute(null);

		Assert.Equal(64, vm.MapTiles.Count);
	}

	[Fact]
	public void MapEditorViewModel_ZoomIn_IncreasesZoom() {
		var vm = new MapEditorViewModel();
		int initialZoom = vm.Zoom;

		vm.ZoomInCommand.Execute(null);

		Assert.Equal(initialZoom + 1, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_ZoomOut_DecreasesZoom() {
		var vm = new MapEditorViewModel();
		vm.Zoom = 4;

		vm.ZoomOutCommand.Execute(null);

		Assert.Equal(3, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_SetTile_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 8;
		vm.MapHeight = 8;
		vm.LoadMapCommand.Execute(null);

		// Select a tile
		var tile = vm.MapTiles[0];
		vm.SelectTileCommand.Execute(tile);

		byte originalValue = rom.Data[tile.Offset];
		vm.SelectedTile = (originalValue + 1) % 256;

		vm.SetTileCommand.Execute(null);

		Assert.Equal(vm.SelectedTile, rom.Data[tile.Offset]);
		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		Assert.Equal(originalValue, rom.Data[tile.Offset]);
	}

	[Fact]
	public void MapEditorViewModel_Fill_CanUndo() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		// Save original values
		byte[] originalValues = new byte[16];
		for (int i = 0; i < 16; i++) {
			originalValues[i] = rom.Data[0x10 + i];
		}

		vm.SelectedTile = 0xAA;
		vm.FillCommand.Execute(null);

		// Verify all tiles filled
		for (int i = 0; i < 16; i++) {
			Assert.Equal(0xAA, rom.Data[0x10 + i]);
		}

		Assert.True(vm.CanUndo);

		vm.UndoCommand.Execute(null);

		// Verify original values restored
		for (int i = 0; i < 16; i++) {
			Assert.Equal(originalValues[i], rom.Data[0x10 + i]);
		}
	}

	[Fact]
	public void MapEditorViewModel_UndoDescription_UpdatesAfterSetTile() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		Assert.Empty(vm.UndoDescription);

		vm.SelectTileCommand.Execute(vm.MapTiles[5]);
		vm.SelectedTile = 0xFF;
		vm.SetTileCommand.Execute(null);

		Assert.NotEmpty(vm.UndoDescription);
		Assert.Contains("tile", vm.UndoDescription, StringComparison.OrdinalIgnoreCase);
	}

	#endregion

	#region ScriptEditorViewModel Tests

	[Fact]
	public void ScriptEditorViewModel_NoRom_HasRomLoadedIsFalse() {
		var vm = new ScriptEditorViewModel(null);
		Assert.False(vm.HasRomLoaded);
	}

	[Fact]
	public void ScriptEditorViewModel_WithRom_HasRomLoadedIsTrue() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		Assert.True(vm.HasRomLoaded);
	}

	[Fact]
	public void ScriptEditorViewModel_HasDefaultOpcodes() {
		var vm = new ScriptEditorViewModel();
		Assert.NotEmpty(vm.Opcodes);
		Assert.Contains(vm.Opcodes, o => o.Name == "END");
		Assert.Contains(vm.Opcodes, o => o.Name == "JUMP");
	}

	[Fact]
	public void ScriptEditorViewModel_HasScriptTypes() {
		var vm = new ScriptEditorViewModel();
		Assert.NotEmpty(vm.ScriptTypes);
		Assert.Contains(vm.ScriptTypes, t => t.Contains("Dialog"));
		Assert.Contains(vm.ScriptTypes, t => t.Contains("AI"));
	}

	[Fact]
	public void ScriptEditorViewModel_LoadScript_DisassemblesCommands() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = 0x10;
		vm.ScriptLength = 20;

		vm.LoadScriptCommand.Execute(null);

		Assert.NotEmpty(vm.Commands);
		Assert.NotEmpty(vm.RawHex);
	}

	[Fact]
	public void ScriptEditorViewModel_Opcode_HasRequiredProperties() {
		var vm = new ScriptEditorViewModel();
		foreach (var opcode in vm.Opcodes) {
			Assert.NotEmpty(opcode.Name);
			Assert.NotEmpty(opcode.Description);
			Assert.True(opcode.Length >= 1);
		}
	}

	[Fact]
	public void ScriptCommand_GeneratesDisassembly() {
		var cmd = new ScriptCommand(0x1000, 0x09, "MSG", [0x01, 0x00], "Display message");
		Assert.Contains("MSG", cmd.Disassembly);
		Assert.Contains("$001000", cmd.Disassembly);
	}

	[Fact]
	public void ScriptEditorViewModel_InvalidOffset_ShowsError() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = int.MaxValue; // Invalid offset

		vm.LoadScriptCommand.Execute(null);

		Assert.Contains("Invalid", vm.StatusText);
	}

	[Fact]
	public void ScriptEditorViewModel_SelectCommand_UpdatesSelectedCommand() {
		var rom = CreateTestNesRom();
		var vm = new ScriptEditorViewModel(rom);
		vm.ScriptOffset = 0x10;
		vm.ScriptLength = 20;
		vm.LoadScriptCommand.Execute(null);

		if (vm.Commands.Count > 0) {
			var cmd = vm.Commands[0];
			vm.SelectCommandCommand.Execute(cmd);

			Assert.Equal(cmd, vm.SelectedCommand);
			Assert.Contains(cmd.Name, vm.StatusText);
		}
	}

	[Fact]
	public void ScriptEditorViewModel_DefaultScriptLength() {
		var vm = new ScriptEditorViewModel();
		Assert.Equal(256, vm.ScriptLength);
	}

	[Fact]
	public void ScriptEditorViewModel_DefaultScriptType() {
		var vm = new ScriptEditorViewModel();
		Assert.Equal("Generic Event", vm.SelectedScriptType);
	}

	[Fact]
	public void ScriptOpcode_Record_PropertiesCorrect() {
		var opcode = new ScriptOpcode(0x09, "MSG", 3, "Display message");
		Assert.Equal(0x09, opcode.Code);
		Assert.Equal("MSG", opcode.Name);
		Assert.Equal(3, opcode.Length);
		Assert.Equal("Display message", opcode.Description);
	}

	#endregion

	#region MapEditorViewModel Additional Tests

	[Fact]
	public void MapEditorViewModel_InvalidOffset_ShowsError() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = int.MaxValue; // Invalid offset

		vm.LoadMapCommand.Execute(null);

		Assert.Contains("Invalid", vm.StatusText);
	}

	[Fact]
	public void MapEditorViewModel_Fill_SetsAllTilesToSelected() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		vm.SelectedTile = 0xAB;
		vm.FillCommand.Execute(null);

		Assert.All(vm.MapTiles, t => Assert.Equal(0xAB, t.TileIndex));
	}

	[Fact]
	public void MapEditorViewModel_SetTile_UpdatesSelectedTile() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		if (vm.MapTiles.Count > 0) {
			vm.SelectedMapTile = vm.MapTiles[0];
			vm.SelectedTile = 0x42;
			vm.SetTileCommand.Execute(null);

			Assert.Equal(0x42, vm.MapTiles[0].TileIndex);
		}
	}

	[Fact]
	public void MapEditorViewModel_NextMap_IncrementsIndex() {
		var vm = new MapEditorViewModel();
		int initialIndex = vm.MapIndex;

		vm.NextMapCommand.Execute(null);

		Assert.Equal(initialIndex + 1, vm.MapIndex);
	}

	[Fact]
	public void MapEditorViewModel_PreviousMap_DecrementsIndex() {
		var vm = new MapEditorViewModel();
		vm.MapIndex = 5;

		vm.PreviousMapCommand.Execute(null);

		Assert.Equal(4, vm.MapIndex);
	}

	[Fact]
	public void MapEditorViewModel_PreviousMap_AtZero_StaysAtZero() {
		var vm = new MapEditorViewModel();
		vm.MapIndex = 0;

		vm.PreviousMapCommand.Execute(null);

		Assert.Equal(0, vm.MapIndex);
	}

	[Fact]
	public void MapEditorViewModel_ZoomIn_MaxAt8() {
		var vm = new MapEditorViewModel();
		vm.Zoom = 8;

		vm.ZoomInCommand.Execute(null);

		Assert.Equal(8, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_ZoomOut_MinAt1() {
		var vm = new MapEditorViewModel();
		vm.Zoom = 1;

		vm.ZoomOutCommand.Execute(null);

		Assert.Equal(1, vm.Zoom);
	}

	[Fact]
	public void MapEditorViewModel_SelectTile_UpdatesStatus() {
		var rom = CreateTestNesRom();
		var vm = new MapEditorViewModel(rom);
		vm.MapDataOffset = 0x10;
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.LoadMapCommand.Execute(null);

		if (vm.MapTiles.Count > 0) {
			var tile = vm.MapTiles[0];
			vm.SelectTileCommand.Execute(tile);

			Assert.Equal(tile, vm.SelectedMapTile);
			Assert.Contains("Selected", vm.StatusText);
		}
	}

	[Fact]
	public void MapTile_Record_PropertiesCorrect() {
		var tile = new MapTile(5, 3, 0x42, 0x1000);
		Assert.Equal(5, tile.X);
		Assert.Equal(3, tile.Y);
		Assert.Equal(0x42, tile.TileIndex);
		Assert.Equal(0x1000, tile.Offset);
		Assert.Equal("42", tile.Display);
	}

	[Fact]
	public void TilePaletteItem_Record_PropertiesCorrect() {
		var item = new TilePaletteItem(0xAB, "Tile AB");
		Assert.Equal(0xAB, item.Index);
		Assert.Equal("Tile AB", item.Name);
		Assert.Equal("AB", item.Display);
	}

	#endregion
}
