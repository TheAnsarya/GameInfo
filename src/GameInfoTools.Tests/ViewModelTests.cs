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

	#endregion
}
