using DarkRepos.Editor.Core.Services;
using DarkRepos.Editor.Core.Services.Games;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Services.Games;

public class DQ3rTraceServiceTests {
	private readonly DQ3rTraceService _service;
	private readonly TraceAnalyzerService _traceAnalyzer;

	public DQ3rTraceServiceTests() {
		_traceAnalyzer = new TraceAnalyzerService();
		_service = new DQ3rTraceService(_traceAnalyzer);
	}

	[Fact]
	public void KnownFunctions_ContainsExpectedEntries() {
		// Assert - verify key function addresses are present
		Assert.Contains(0xc0936f, DQ3rTraceService.KnownFunctions.Keys);
		Assert.Contains(0xc600bd, DQ3rTraceService.KnownFunctions.Keys);
		Assert.Contains(0xc90717, DQ3rTraceService.KnownFunctions.Keys);
	}

	[Fact]
	public void KnownFunctions_UpdateStateMachine_HasCorrectAddress() {
		// Assert
		Assert.Equal("UpdateStateMachine", DQ3rTraceService.KnownFunctions[0xc0936f]);
	}

	[Fact]
	public void KnownFunctions_MenuSizeHandler_HasCorrectAddress() {
		// Assert
		Assert.Equal("MenuSizeHandler", DQ3rTraceService.KnownFunctions[0xc90717]);
	}

	[Fact]
	public void KnownRamAddresses_ContainsGameState() {
		// Assert
		Assert.Contains(0x7e3696, DQ3rTraceService.KnownRamAddresses.Keys);
		Assert.Equal("CurrentGold", DQ3rTraceService.KnownRamAddresses[0x7e3696]);
	}

	[Fact]
	public void KnownRamAddresses_ContainsHeroStats() {
		// Assert
		Assert.Contains(0x7e3925, DQ3rTraceService.KnownRamAddresses.Keys);
		Assert.Equal("HeroStats", DQ3rTraceService.KnownRamAddresses[0x7e3925]);
	}

	[Fact]
	public void KnownRamAddresses_ContainsJoypad() {
		// Assert
		Assert.Contains(0x7e7ff8, DQ3rTraceService.KnownRamAddresses.Keys);
		Assert.Equal("JoypadButtons", DQ3rTraceService.KnownRamAddresses[0x7e7ff8]);
	}

	[Fact]
	public void BankDescriptions_ContainsMainLoop() {
		// Assert
		Assert.Contains(0xc0, DQ3rTraceService.BankDescriptions.Keys);
		Assert.Contains("Main game loop", DQ3rTraceService.BankDescriptions[0xc0]);
	}

	[Fact]
	public void BankDescriptions_ContainsGraphics() {
		// Assert
		Assert.Contains(0xc6, DQ3rTraceService.BankDescriptions.Keys);
		Assert.Contains("Graphics", DQ3rTraceService.BankDescriptions[0xc6]);
	}

	[Fact]
	public void BankDescriptions_ContainsMenuSystem() {
		// Assert
		Assert.Contains(0xc9, DQ3rTraceService.BankDescriptions.Keys);
		Assert.Contains("Menu", DQ3rTraceService.BankDescriptions[0xc9]);
	}

	[Fact]
	public void GetFunctionName_WithKnownAddress_ReturnsName() {
		// Act
		var name = _service.GetFunctionName(0xc0936f);

		// Assert
		Assert.Equal("UpdateStateMachine", name);
	}

	[Fact]
	public void GetFunctionName_WithUnknownAddress_ReturnsNull() {
		// Act
		var name = _service.GetFunctionName(0x000000);

		// Assert
		Assert.Null(name);
	}

	[Fact]
	public void GetRamLabel_WithKnownAddress_ReturnsLabel() {
		// Act
		var label = _service.GetRamLabel(0x7e3696);

		// Assert
		Assert.Equal("CurrentGold", label);
	}

	[Fact]
	public void GetRamLabel_WithUnknownAddress_ReturnsNull() {
		// Act
		var label = _service.GetRamLabel(0x000000);

		// Assert
		Assert.Null(label);
	}

	[Fact]
	public void GetBankDescription_WithKnownBank_ReturnsDescription() {
		// Act
		var desc = _service.GetBankDescription(0xc0);

		// Assert
		Assert.NotNull(desc);
		Assert.Contains("Main game loop", desc);
	}

	[Fact]
	public void GetBankDescription_WithUnknownBank_ReturnsNull() {
		// Act
		var desc = _service.GetBankDescription(0xFF);

		// Assert
		Assert.Null(desc);
	}

	[Fact]
	public void AnalyzeTableRegion_WithNoCdlData_ReturnsNull() {
		// Act
		var summary = _service.AnalyzeTableRegion(0x500000, 1024);

		// Assert
		Assert.Null(summary);
	}

	[Fact]
	public void ExportLabeledReport_ProducesValidReport() {
		// Act
		var report = _service.ExportLabeledReport();

		// Assert
		Assert.Contains("DQ3r Trace Analysis Report", report);
		Assert.Contains("Known Functions:", report);
		Assert.Contains("Bank Descriptions:", report);
	}

	[Fact]
	public void ExportLabeledReport_ContainsKnownFunctions() {
		// Act
		var report = _service.ExportLabeledReport();

		// Assert
		Assert.Contains("UpdateStateMachine", report);
		Assert.Contains("$c0936f", report);
	}

	[Fact]
	public void ExportLabeledReport_ContainsBankInfo() {
		// Act
		var report = _service.ExportLabeledReport();

		// Assert
		Assert.Contains("Bank $c0:", report);
		Assert.Contains("Bank $c6:", report);
	}

	[Theory]
	[InlineData(0xd0, "Item/Equipment")]
	[InlineData(0xd1, "Monster")]
	[InlineData(0xd2, "Magic/Class")]
	[InlineData(0xfc, "Dialog")]
	public void BankDescriptions_DataBanks_HaveCorrectDescriptions(int bank, string expectedContent) {
		// Assert
		Assert.True(DQ3rTraceService.BankDescriptions.TryGetValue(bank, out var desc));
		Assert.Contains(expectedContent, desc!);
	}

	[Theory]
	[InlineData(0xc600bd, "MainLoopJsl_C6061F")]
	[InlineData(0xc600c9, "AudioAndJoypad")]
	[InlineData(0xc600d9, "LoadTiles")]
	[InlineData(0xc02b70, "MenuPaddingRoutine")]
	[InlineData(0xc0539b, "DecompressOverworldMap")]
	public void KnownFunctions_VariousFunctions_HaveCorrectNames(int address, string expectedName) {
		// Assert
		Assert.Equal(expectedName, DQ3rTraceService.KnownFunctions[address]);
	}

	[Theory]
	[InlineData(0x7e3725, "BagItems")]
	[InlineData(0x7e3825, "BagItemCounts")]
	[InlineData(0x7edb1f, "OamSpriteData")]
	[InlineData(0x7e8bae, "DmaSourceAddresses")]
	[InlineData(0x7e93ae, "DmaTransferCount")]
	public void KnownRamAddresses_VariousAddresses_HaveCorrectLabels(int address, string expectedLabel) {
		// Assert
		Assert.Equal(expectedLabel, DQ3rTraceService.KnownRamAddresses[address]);
	}
}
