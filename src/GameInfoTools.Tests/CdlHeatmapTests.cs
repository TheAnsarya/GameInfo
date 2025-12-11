using GameInfoTools.Analysis;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for the CDL Heatmap functionality.
/// </summary>
public class CdlHeatmapTests {

	private static byte[] CreateTestCdlData(int size = 0x4000) {
		var data = new byte[size];

		// Fill with test pattern:
		// First 25% = code
		// Next 25% = data
		// Next 25% = mixed
		// Last 25% = empty
		int quarter = size / 4;

		// Code section (bit 0 set)
		for (int i = 0; i < quarter; i++) {
			data[i] = 0x01;
		}

		// Data section (bits 1+ set, bit 0 clear)
		for (int i = quarter; i < quarter * 2; i++) {
			data[i] = 0x02;
		}

		// Mixed section (some code, some data)
		for (int i = quarter * 2; i < quarter * 3; i++) {
			data[i] = (byte)(i % 2 == 0 ? 0x01 : 0x02);
		}

		// Empty section (all zeros) - already initialized

		return data;
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidData_CreatesInstance() {
		var data = CreateTestCdlData();
		var heatmap = new CdlHeatmap(data);

		Assert.NotNull(heatmap);
		Assert.Equal(data.Length, heatmap.Size);
	}

	[Fact]
	public void Constructor_WithNullData_ThrowsArgumentNullException() {
		Assert.Throws<ArgumentNullException>(() => new CdlHeatmap(null!));
	}

	[Fact]
	public void Constructor_WithFormat_SetsFormat() {
		var data = CreateTestCdlData();
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		Assert.Equal(CdlHeatmap.CdlFormat.Fceux, heatmap.Format);
	}

	#endregion

	#region GetFlags Tests

	[Fact]
	public void GetFlags_ForCodeByte_ReturnsCodeFlag() {
		var data = new byte[] { 0x01, 0x00, 0x02 };
		var heatmap = new CdlHeatmap(data);

		var flags = heatmap.GetFlags(0);

		Assert.Equal(CdlHeatmap.CdlFlags.Code, flags);
	}

	[Fact]
	public void GetFlags_ForDataByte_ReturnsDataFlag() {
		var data = new byte[] { 0x01, 0x00, 0x02 };
		var heatmap = new CdlHeatmap(data);

		var flags = heatmap.GetFlags(2);

		Assert.Equal(CdlHeatmap.CdlFlags.Data, flags);
	}

	[Fact]
	public void GetFlags_OutOfRange_ReturnsNone() {
		var data = new byte[] { 0x01, 0x02 };
		var heatmap = new CdlHeatmap(data);

		var flags = heatmap.GetFlags(100);

		Assert.Equal(CdlHeatmap.CdlFlags.None, flags);
	}

	[Fact]
	public void GetFlags_NegativeOffset_ReturnsNone() {
		var data = new byte[] { 0x01, 0x02 };
		var heatmap = new CdlHeatmap(data);

		var flags = heatmap.GetFlags(-1);

		Assert.Equal(CdlHeatmap.CdlFlags.None, flags);
	}

	#endregion

	#region Coverage Check Tests

	[Fact]
	public void IsCovered_ForCodeByte_ReturnsTrue() {
		var data = new byte[] { 0x01, 0x00 };
		var heatmap = new CdlHeatmap(data);

		Assert.True(heatmap.IsCovered(0));
	}

	[Fact]
	public void IsCovered_ForDataByte_ReturnsTrue() {
		var data = new byte[] { 0x02, 0x00 };
		var heatmap = new CdlHeatmap(data);

		Assert.True(heatmap.IsCovered(0));
	}

	[Fact]
	public void IsCovered_ForUnknownByte_ReturnsFalse() {
		var data = new byte[] { 0x00, 0x01 };
		var heatmap = new CdlHeatmap(data);

		Assert.False(heatmap.IsCovered(0));
	}

	[Fact]
	public void IsCode_ForCodeByte_ReturnsTrue() {
		var data = new byte[] { 0x01 };
		var heatmap = new CdlHeatmap(data);

		Assert.True(heatmap.IsCode(0));
	}

	[Fact]
	public void IsCode_ForDataByte_ReturnsFalse() {
		var data = new byte[] { 0x02 };
		var heatmap = new CdlHeatmap(data);

		Assert.False(heatmap.IsCode(0));
	}

	[Fact]
	public void IsData_ForDataByte_ReturnsTrue() {
		var data = new byte[] { 0x02 };
		var heatmap = new CdlHeatmap(data);

		Assert.True(heatmap.IsData(0));
	}

	[Fact]
	public void IsData_ForCodeByte_ReturnsFalse() {
		var data = new byte[] { 0x01 };
		var heatmap = new CdlHeatmap(data);

		Assert.False(heatmap.IsData(0));
	}

	#endregion

	#region Coverage Statistics Tests

	[Fact]
	public void GetCoverageStats_FullData_ReturnsCorrectStats() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);

		var stats = heatmap.GetCoverageStats();

		Assert.Equal(100, stats.TotalBytes);
		Assert.True(stats.CodeBytes > 0);
		Assert.True(stats.DataBytes > 0);
		Assert.True(stats.UnknownBytes > 0);
	}

	[Fact]
	public void GetCoverageStats_AllCode_Returns100PercentCode() {
		var data = new byte[] { 0x01, 0x01, 0x01, 0x01 };
		var heatmap = new CdlHeatmap(data);

		var stats = heatmap.GetCoverageStats();

		Assert.Equal(4, stats.CodeBytes);
		Assert.Equal(0, stats.DataBytes);
		Assert.Equal(0, stats.UnknownBytes);
		Assert.Equal(100.0, stats.CodePercentage);
	}

	[Fact]
	public void GetCoverageStats_AllEmpty_Returns0PercentCoverage() {
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		var heatmap = new CdlHeatmap(data);

		var stats = heatmap.GetCoverageStats();

		Assert.Equal(0, stats.CodeBytes);
		Assert.Equal(0, stats.DataBytes);
		Assert.Equal(4, stats.UnknownBytes);
		Assert.Equal(0.0, stats.CoveragePercentage);
	}

	[Fact]
	public void GetCoverageStats_WithRange_ReturnsStatsForRange() {
		// Create data: [code, code, data, data, empty, empty]
		var data = new byte[] { 0x01, 0x01, 0x02, 0x02, 0x00, 0x00 };
		var heatmap = new CdlHeatmap(data);

		// Get stats for just the code section
		var stats = heatmap.GetCoverageStats(0, 2);

		Assert.Equal(2, stats.TotalBytes);
		Assert.Equal(2, stats.CodeBytes);
		Assert.Equal(0, stats.DataBytes);
	}

	#endregion

	#region Bank Coverage Tests

	[Fact]
	public void GetBankCoverage_ReturnsCorrectBankCount() {
		var data = CreateTestCdlData(0x8000); // 32KB = 2 banks
		var heatmap = new CdlHeatmap(data);

		var banks = heatmap.GetBankCoverage(0x4000); // 16KB banks

		Assert.Equal(2, banks.Count);
	}

	[Fact]
	public void GetBankCoverage_HasCorrectOffsets() {
		var data = CreateTestCdlData(0x8000);
		var heatmap = new CdlHeatmap(data);

		var banks = heatmap.GetBankCoverage(0x4000);

		Assert.Equal(0, banks[0].StartOffset);
		Assert.Equal(0x3FFF, banks[0].EndOffset);
		Assert.Equal(0x4000, banks[1].StartOffset);
		Assert.Equal(0x7FFF, banks[1].EndOffset);
	}

	[Fact]
	public void GetBankCoverage_HasCorrectBankIndices() {
		var data = CreateTestCdlData(0xC000); // 48KB = 3 banks
		var heatmap = new CdlHeatmap(data);

		var banks = heatmap.GetBankCoverage(0x4000);

		Assert.Equal(0, banks[0].BankIndex);
		Assert.Equal(1, banks[1].BankIndex);
		Assert.Equal(2, banks[2].BankIndex);
	}

	#endregion

	#region Heatmap Generation Tests

	[Fact]
	public void GenerateHeatmap_ReturnsCells() {
		var data = CreateTestCdlData(1024);
		var heatmap = new CdlHeatmap(data);

		var cells = heatmap.GenerateHeatmap(256);

		Assert.NotEmpty(cells);
		Assert.Equal(4, cells.Count); // 1024 / 256 = 4 cells
	}

	[Fact]
	public void GenerateHeatmap_CellsHaveCorrectOffsets() {
		var data = CreateTestCdlData(512);
		var heatmap = new CdlHeatmap(data);

		var cells = heatmap.GenerateHeatmap(256);

		Assert.Equal(0, cells[0].Offset);
		Assert.Equal(256, cells[1].Offset);
	}

	[Fact]
	public void GenerateHeatmap_FullCoverage_ReturnsIntensity1() {
		var data = new byte[256];
		Array.Fill<byte>(data, 0x01); // All code
		var heatmap = new CdlHeatmap(data);

		var cells = heatmap.GenerateHeatmap(256);

		Assert.Equal(1.0, cells[0].Intensity);
	}

	[Fact]
	public void GenerateHeatmap_NoCoverage_ReturnsIntensity0() {
		var data = new byte[256]; // All zeros
		var heatmap = new CdlHeatmap(data);

		var cells = heatmap.GenerateHeatmap(256);

		Assert.Equal(0.0, cells[0].Intensity);
	}

	[Fact]
	public void GenerateHeatmap_HalfCoverage_ReturnsIntensityPoint5() {
		var data = new byte[256];
		// Fill first half with code
		for (int i = 0; i < 128; i++) data[i] = 0x01;
		var heatmap = new CdlHeatmap(data);

		var cells = heatmap.GenerateHeatmap(256);

		Assert.Equal(0.5, cells[0].Intensity);
	}

	#endregion

	#region ASCII Heatmap Tests

	[Fact]
	public void GenerateAsciiHeatmap_ReturnsString() {
		var data = CreateTestCdlData(1024);
		var heatmap = new CdlHeatmap(data);

		var ascii = heatmap.GenerateAsciiHeatmap(16, 4);

		Assert.NotNull(ascii);
		Assert.NotEmpty(ascii);
	}

	[Fact]
	public void GenerateAsciiHeatmap_ContainsLegend() {
		var data = CreateTestCdlData(1024);
		var heatmap = new CdlHeatmap(data);

		var ascii = heatmap.GenerateAsciiHeatmap(16, 4);

		Assert.Contains("Legend", ascii);
	}

	#endregion

	#region Report Generation Tests

	[Fact]
	public void GenerateReport_ReturnsReport() {
		var data = CreateTestCdlData(0x4000);
		var heatmap = new CdlHeatmap(data);

		var report = heatmap.GenerateReport();

		Assert.NotNull(report);
		Assert.NotEmpty(report);
	}

	[Fact]
	public void GenerateReport_ContainsCoverageInfo() {
		var data = CreateTestCdlData(0x4000);
		var heatmap = new CdlHeatmap(data);

		var report = heatmap.GenerateReport();

		Assert.Contains("Coverage", report);
		Assert.Contains("Code", report);
		Assert.Contains("Data", report);
	}

	[Fact]
	public void GenerateReport_ContainsBankInfo() {
		var data = CreateTestCdlData(0x4000);
		var heatmap = new CdlHeatmap(data);

		var report = heatmap.GenerateReport();

		Assert.Contains("Bank", report);
	}

	#endregion

	#region Uncovered Regions Tests

	[Fact]
	public void FindUncoveredRegions_FindsEmptyRegions() {
		// Create data with large empty region in middle
		var data = new byte[100];
		for (int i = 0; i < 20; i++) data[i] = 0x01; // Code
		// 20-80 is empty
		for (int i = 80; i < 100; i++) data[i] = 0x01; // Code

		var heatmap = new CdlHeatmap(data);
		var regions = heatmap.FindUncoveredRegions(16);

		Assert.Single(regions);
		Assert.Equal(20, regions[0].Offset);
		Assert.Equal(60, regions[0].Length);
	}

	[Fact]
	public void FindUncoveredRegions_RespectsMinSize() {
		// Create data with small and large empty regions
		var data = new byte[100];
		Array.Fill<byte>(data, 0x01); // All code
		// Small gap (5 bytes)
		for (int i = 10; i < 15; i++) data[i] = 0x00;
		// Large gap (30 bytes)
		for (int i = 40; i < 70; i++) data[i] = 0x00;

		var heatmap = new CdlHeatmap(data);
		var regions = heatmap.FindUncoveredRegions(16);

		// Should only find the large gap
		Assert.Single(regions);
		Assert.Equal(40, regions[0].Offset);
	}

	#endregion

	#region Covered Regions Tests

	[Fact]
	public void FindCoveredRegions_FindsCodeAndDataRegions() {
		var data = new byte[] { 0x01, 0x01, 0x00, 0x02, 0x02, 0x00 };
		var heatmap = new CdlHeatmap(data);

		var regions = heatmap.FindCoveredRegions();

		Assert.Equal(2, regions.Count);
		Assert.True(regions[0].IsCode);
		Assert.False(regions[1].IsCode);
	}

	#endregion

	#region Export Tests

	[Fact]
	public void ExportAsCsv_ReturnsCsvData() {
		var data = CreateTestCdlData(512);
		var heatmap = new CdlHeatmap(data);

		var csv = heatmap.ExportAsCsv(256);

		Assert.Contains("Offset,Size,Intensity", csv);
		Assert.Contains("0x", csv);
	}

	[Fact]
	public void ExportAsJson_ReturnsJsonData() {
		var data = CreateTestCdlData(512);
		var heatmap = new CdlHeatmap(data);

		var json = heatmap.ExportAsJson(256);

		Assert.Contains("{", json);
		Assert.Contains("\"format\"", json);
		Assert.Contains("\"stats\"", json);
		Assert.Contains("\"cells\"", json);
	}

	#endregion

	#region CdlFlags Tests

	[Fact]
	public void CdlFlags_Code_HasCorrectValue() {
		Assert.Equal(0x01, (byte)CdlHeatmap.CdlFlags.Code);
	}

	[Fact]
	public void CdlFlags_Data_HasCorrectValue() {
		Assert.Equal(0x02, (byte)CdlHeatmap.CdlFlags.Data);
	}

	[Fact]
	public void CdlFlags_CanCombine() {
		var combined = CdlHeatmap.CdlFlags.Code | CdlHeatmap.CdlFlags.SubEntryPoint;
		Assert.True((combined & CdlHeatmap.CdlFlags.Code) != 0);
		Assert.True((combined & CdlHeatmap.CdlFlags.SubEntryPoint) != 0);
	}

	#endregion
}
