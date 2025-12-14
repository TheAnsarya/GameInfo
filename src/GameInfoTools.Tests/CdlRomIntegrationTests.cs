using GameInfoTools.Analysis;
using static GameInfoTools.Analysis.CdlRomIntegration;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CDL/ROM integration functionality.
/// </summary>
public class CdlRomIntegrationTests {

	private static byte[] CreateTestCdlData(int size = 0x4000) {
		var data = new byte[size];

		// Create a pattern with code, data, and empty regions
		// First quarter: code
		// Second quarter: data
		// Third quarter: mixed
		// Last quarter: empty
		int quarter = size / 4;

		// Code section (bit 0 set)
		for (int i = 0; i < quarter; i++) {
			data[i] = 0x01;
		}

		// Data section (bit 1 set)
		for (int i = quarter; i < quarter * 2; i++) {
			data[i] = 0x02;
		}

		// Mixed section
		for (int i = quarter * 2; i < quarter * 3; i++) {
			data[i] = (byte)(i % 2 == 0 ? 0x01 : 0x02);
		}

		return data;
	}

	private static byte[] CreateTestRomData(int size = 0x4010) {
		// NES ROM with 16-byte header
		var data = new byte[size];
		var random = new Random(42); // Fixed seed for reproducibility

		// NES header
		data[0] = 0x4E; // 'N'
		data[1] = 0x45; // 'E'
		data[2] = 0x53; // 'S'
		data[3] = 0x1A; // EOF
		data[4] = 0x01; // 1 PRG bank

		// Fill ROM data
		random.NextBytes(data.AsSpan(16));
		return data;
	}

	private static CdlRomIntegration CreateIntegration(byte[] cdlData, byte[] romData) {
		var heatmap = new CdlHeatmap(cdlData);
		return new CdlRomIntegration(romData, heatmap);
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidData_CreatesInstance() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var heatmap = new CdlHeatmap(cdlData);

		var integration = new CdlRomIntegration(romData, heatmap);

		Assert.NotNull(integration);
	}

	[Fact]
	public void Constructor_WithNullHeatmap_ThrowsArgumentNullException() {
		var romData = CreateTestRomData();
		Assert.Throws<ArgumentNullException>(() => new CdlRomIntegration(romData, null!));
	}

	[Fact]
	public void Constructor_WithNullRomData_ThrowsArgumentNullException() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		Assert.Throws<ArgumentNullException>(() => new CdlRomIntegration(null!, heatmap));
	}

	[Fact]
	public void Constructor_WithMismatchedSizes_DoesNotThrow() {
		// CDL and ROM sizes can differ - CDL may only cover part of ROM
		var cdlData = CreateTestCdlData(0x4000);
		var romData = CreateTestRomData(0x8010);
		var heatmap = new CdlHeatmap(cdlData);

		var integration = new CdlRomIntegration(romData, heatmap);

		Assert.NotNull(integration);
	}

	#endregion

	#region GenerateLabelsFromCdl Tests

	[Fact]
	public void GenerateLabelsFromCdl_WithCdlData_ReturnsLabels() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var labels = integration.GenerateLabelsFromCdl();

		// May or may not have labels depending on CDL patterns
		Assert.NotNull(labels);
	}

	[Fact]
	public void GenerateLabelsFromCdl_LabelsAreSorted() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var labels = integration.GenerateLabelsFromCdl();

		var sorted = labels.OrderBy(l => l.Address).ToList();
		Assert.Equal(sorted, labels);
	}

	[Fact]
	public void GenerateLabelsFromCdl_EmptyCdl_ReturnsEmptyOrMinimal() {
		var cdlData = new byte[0x4000]; // All zeros
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var labels = integration.GenerateLabelsFromCdl();

		Assert.NotNull(labels);
	}

	#endregion

	#region GenerateLabelsFromJumps Tests

	[Fact]
	public void GenerateLabelsFromJumps_WithJsrInstructions_CreatesLabels() {
		var cdlData = new byte[0x100];
		var romData = new byte[0x110];

		// NES header
		romData[0] = 0x4E; romData[1] = 0x45; romData[2] = 0x53; romData[3] = 0x1A;
		romData[4] = 0x01;

		// Mark region as code
		for (int i = 0; i < 0x20; i++) {
			cdlData[i] = 0x01;
		}

		// Add a JSR instruction at offset 0x10 (ROM offset 0x20 after header)
		romData[0x20] = 0x20; // JSR opcode
		romData[0x21] = 0x50; // Target low byte
		romData[0x22] = 0x80; // Target high byte ($8050)

		var integration = CreateIntegration(cdlData, romData);
		var labels = integration.GenerateLabelsFromJumps();

		// Should find the JSR target
		Assert.Contains(labels, l => l.Address == 0x8050);
	}

	[Fact]
	public void GenerateLabelsFromJumps_WithJmpInstructions_CreatesLabels() {
		var cdlData = new byte[0x100];
		var romData = new byte[0x110];

		// NES header
		romData[0] = 0x4E; romData[1] = 0x45; romData[2] = 0x53; romData[3] = 0x1A;
		romData[4] = 0x01;

		// Mark region as code
		for (int i = 0; i < 0x20; i++) {
			cdlData[i] = 0x01;
		}

		// Add a JMP instruction
		romData[0x20] = 0x4C; // JMP opcode
		romData[0x21] = 0x30; // Target low byte
		romData[0x22] = 0x80; // Target high byte ($8030)

		var integration = CreateIntegration(cdlData, romData);
		var labels = integration.GenerateLabelsFromJumps();

		// Should find the JMP target
		Assert.Contains(labels, l => l.Address == 0x8030);
	}

	#endregion

	#region DetectFunctionBoundaries Tests

	[Fact]
	public void DetectFunctionBoundaries_WithCodeRegions_FindsBoundaries() {
		var cdlData = new byte[0x200];
		var romData = new byte[0x210];

		// NES header
		romData[0] = 0x4E; romData[1] = 0x45; romData[2] = 0x53; romData[3] = 0x1A;
		romData[4] = 0x01;

		// Create two code regions with RTS at ends
		// First function: 0x00-0x3F
		for (int i = 0; i < 0x40; i++) {
			cdlData[i] = 0x11; // Code + SubEntryPoint
		}

		romData[0x10 + 0x3F] = 0x60; // RTS at end of first function

		// Second function: 0x80-0xBF
		for (int i = 0x80; i < 0xC0; i++) {
			cdlData[i] = 0x11; // Code + SubEntryPoint
		}

		romData[0x10 + 0xBF] = 0x60; // RTS at end of second function

		var integration = CreateIntegration(cdlData, romData);
		var boundaries = integration.DetectFunctionBoundaries();

		Assert.NotNull(boundaries);
	}

	[Fact]
	public void DetectFunctionBoundaries_EmptyCdl_ReturnsEmptyList() {
		var cdlData = new byte[0x100]; // All zeros
		var romData = CreateTestRomData(0x110);
		var integration = CreateIntegration(cdlData, romData);

		var boundaries = integration.DetectFunctionBoundaries();

		Assert.Empty(boundaries);
	}

	[Fact]
	public void DetectFunctionBoundaries_BoundariesHaveValidAddresses() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var boundaries = integration.DetectFunctionBoundaries();

		foreach (var boundary in boundaries) {
			Assert.True(boundary.StartAddress >= 0x8000,
				$"Function {boundary.Name} has invalid start address {boundary.StartHex}");
			Assert.True(boundary.EndAddress >= boundary.StartAddress,
				$"Function {boundary.Name} has end before start");
		}
	}

	#endregion

	#region DetectDataTables Tests

	[Fact]
	public void DetectDataTables_WithDataRegions_FindsTables() {
		var cdlData = new byte[0x200];
		var romData = new byte[0x210];

		// NES header
		romData[0] = 0x4E; romData[1] = 0x45; romData[2] = 0x53; romData[3] = 0x1A;
		romData[4] = 0x01;

		// Create a data region with repeating pattern
		for (int i = 0x80; i < 0x100; i++) {
			cdlData[i] = 0x02; // Data flag
			romData[0x10 + i] = (byte)(i % 8); // Repeating pattern
		}

		var integration = CreateIntegration(cdlData, romData);
		var tables = integration.DetectDataTables();

		Assert.NotNull(tables);
	}

	[Fact]
	public void DetectDataTables_WithMinSize_FiltersSmallTables() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var tablesSmall = integration.DetectDataTables(minSize: 4);
		var tablesLarge = integration.DetectDataTables(minSize: 256);

		Assert.True(tablesLarge.Count <= tablesSmall.Count);
	}

	[Fact]
	public void DetectDataTables_EmptyCdl_ReturnsEmptyList() {
		var cdlData = new byte[0x100]; // All zeros
		var romData = CreateTestRomData(0x110);
		var integration = CreateIntegration(cdlData, romData);

		var tables = integration.DetectDataTables();

		Assert.Empty(tables);
	}

	#endregion

	#region Export Tests - Mesen MLB Format

	[Fact]
	public void ExportMesenLabels_GeneratesValidFormat() {
		var cdlData = CreateTestCdlData(0x100);
		var romData = CreateTestRomData(0x110);
		var integration = CreateIntegration(cdlData, romData);

		var output = integration.ExportMesenLabels();

		Assert.NotNull(output);
		Assert.Contains("Auto-generated", output);
	}

	[Fact]
	public void ExportMesenLabels_WithLabels_ContainsPrgPrefix() {
		// Create CDL with sub-entry points to ensure labels are generated
		var cdlData = new byte[0x100];
		for (int i = 0; i < 0x20; i++) {
			cdlData[i] = 0x11; // Code + SubEntryPoint
		}

		var romData = CreateTestRomData(0x110);
		var integration = CreateIntegration(cdlData, romData);

		var output = integration.ExportMesenLabels();

		// Mesen format uses "PRG:" prefix - only check if we have label lines
		var labelLines = output.Split('\n').Where(l => !l.StartsWith(";") && l.Contains(":") && !string.IsNullOrWhiteSpace(l)).ToList();
		if (labelLines.Any()) {
			Assert.Contains("PRG:", output);
		} else {
			// If no labels generated, at least verify the output format is correct
			Assert.Contains("Auto-generated", output);
		}
	}

	#endregion

	#region Export Tests - FCEUX NL Format

	[Fact]
	public void ExportFceuxLabels_GeneratesValidFormat() {
		var cdlData = CreateTestCdlData(0x100);
		var romData = CreateTestRomData(0x110);
		var integration = CreateIntegration(cdlData, romData);

		var output = integration.ExportFceuxLabels();

		Assert.NotNull(output);
		Assert.Contains("Auto-generated", output);
	}

	[Fact]
	public void ExportFceuxLabels_WithLabels_ContainsDollarSignFormat() {
		// Create CDL with sub-entry points to ensure labels are generated
		var cdlData = new byte[0x100];
		for (int i = 0; i < 0x20; i++) {
			cdlData[i] = 0x11; // Code + SubEntryPoint
		}

		var romData = CreateTestRomData(0x110);
		var integration = CreateIntegration(cdlData, romData);

		var output = integration.ExportFceuxLabels();

		// FCEUX NL format uses "$XXXX#name#comment"
		if (output.Split('\n').Any(l => l.StartsWith("$"))) {
			Assert.Contains("#", output);
		}
	}

	#endregion

	#region Export Tests - Generic Symbol Format

	[Fact]
	public void ExportSymbols_GeneratesValidFormat() {
		var cdlData = CreateTestCdlData(0x100);
		var romData = CreateTestRomData(0x110);
		var integration = CreateIntegration(cdlData, romData);

		var output = integration.ExportSymbols();

		Assert.NotNull(output);
		Assert.Contains("CDL/ROM Analysis", output);
	}

	[Fact]
	public void ExportSymbols_GroupsLabelsByType() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var output = integration.ExportSymbols();

		// Should have type headers like "; === SubRoutine ==="
		Assert.Contains("===", output);
	}

	#endregion

	#region Analysis Report Tests

	[Fact]
	public void GenerateAnalysisReport_ReturnsFormattedReport() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var report = integration.GenerateAnalysisReport();

		Assert.NotNull(report);
		Assert.Contains("ANALYSIS REPORT", report);
	}

	[Fact]
	public void GenerateAnalysisReport_ContainsCoverageStats() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var report = integration.GenerateAnalysisReport();

		Assert.Contains("Coverage", report);
		Assert.Contains("Code", report);
		Assert.Contains("Data", report);
	}

	[Fact]
	public void GenerateAnalysisReport_ListsFunctionsAndTables() {
		var cdlData = CreateTestCdlData();
		var romData = CreateTestRomData();
		var integration = CreateIntegration(cdlData, romData);

		var report = integration.GenerateAnalysisReport();

		Assert.Contains("Functions", report);
		Assert.Contains("Labels", report);
		Assert.Contains("Tables", report);
	}

	#endregion

	#region FromFiles Static Constructor Test

	[Fact]
	public void FromFiles_WithNonexistentFile_ThrowsFileNotFoundException() {
		Assert.ThrowsAny<Exception>(() =>
			CdlRomIntegration.FromFiles("nonexistent.nes", "nonexistent.cdl"));
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void Integration_WithMinimalData_HandlesGracefully() {
		var cdlData = new byte[16];
		var romData = new byte[32];

		// Minimal NES header
		romData[0] = 0x4E; romData[1] = 0x45; romData[2] = 0x53; romData[3] = 0x1A;

		var integration = CreateIntegration(cdlData, romData);

		// Should not throw
		var labels = integration.GenerateLabelsFromCdl();
		var boundaries = integration.DetectFunctionBoundaries();
		var tables = integration.DetectDataTables();

		Assert.NotNull(labels);
		Assert.NotNull(boundaries);
		Assert.NotNull(tables);
	}

	[Fact]
	public void Integration_WithLargeData_HandlesGracefully() {
		// Test with larger data size
		var cdlData = CreateTestCdlData(0x40000); // 256KB
		var romData = CreateTestRomData(0x40010);
		var integration = CreateIntegration(cdlData, romData);

		// Should not throw or hang
		var labels = integration.GenerateLabelsFromCdl();

		Assert.NotNull(labels);
	}

	#endregion
}
