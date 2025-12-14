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

	#region Merge Tests

	[Fact]
	public void Merge_CombinesFlags_FromMultipleFiles() {
		// First file has code at offset 0
		var data1 = new byte[] { 0x01, 0x00, 0x00, 0x00 };
		var cdl1 = new CdlHeatmap(data1);

		// Second file has data at offset 1
		var data2 = new byte[] { 0x00, 0x02, 0x00, 0x00 };
		var cdl2 = new CdlHeatmap(data2);

		var merged = CdlHeatmap.Merge(cdl1, cdl2);

		// Should have both
		Assert.True(merged.IsCode(0));
		Assert.True(merged.IsData(1));
		Assert.False(merged.IsCovered(2));
	}

	[Fact]
	public void Merge_OrsFlagsAtSameOffset() {
		// First file has code flag at offset 0
		var data1 = new byte[] { 0x01, 0x00 };
		var cdl1 = new CdlHeatmap(data1);

		// Second file has indirect code flag at same offset
		var data2 = new byte[] { 0x21, 0x00 }; // Code + IndirectCode (0x01 | 0x20)
		var cdl2 = new CdlHeatmap(data2);

		var merged = CdlHeatmap.Merge(cdl1, cdl2);

		// Should have both flags ORed together
		var flags = merged.GetFlags(0);
		Assert.True((flags & CdlHeatmap.CdlFlags.Code) != 0);
		Assert.True((flags & CdlHeatmap.CdlFlags.IndirectCode) != 0);
	}

	[Fact]
	public void Merge_HandlesDifferentSizes() {
		var data1 = new byte[] { 0x01, 0x01, 0x01, 0x01 };
		var cdl1 = new CdlHeatmap(data1);

		var data2 = new byte[] { 0x02, 0x02 };
		var cdl2 = new CdlHeatmap(data2);

		var merged = CdlHeatmap.Merge(cdl1, cdl2);

		// Should use largest size
		Assert.Equal(4, merged.Size);
		// First two bytes should have both flags
		Assert.True(merged.IsCode(0)); // Has code from both
		Assert.True(merged.IsCode(2)); // Code from data1 only
	}

	[Fact]
	public void Merge_WithSingleFile_ReturnsSameFile() {
		var data = new byte[] { 0x01, 0x02, 0x03 };
		var cdl = new CdlHeatmap(data);

		var merged = CdlHeatmap.Merge(cdl);

		Assert.Same(cdl, merged);
	}

	[Fact]
	public void Merge_WithNoFiles_ThrowsArgumentException() {
		Assert.Throws<ArgumentException>(() => CdlHeatmap.Merge());
	}

	[Fact]
	public void Merge_PreservesFormat() {
		var data1 = new byte[] { 0x01 };
		var cdl1 = new CdlHeatmap(data1, CdlHeatmap.CdlFormat.Fceux);
		var data2 = new byte[] { 0x02 };
		var cdl2 = new CdlHeatmap(data2, CdlHeatmap.CdlFormat.Mesen);

		var merged = CdlHeatmap.Merge(cdl1, cdl2);

		// Should use format of first file
		Assert.Equal(CdlHeatmap.CdlFormat.Fceux, merged.Format);
	}

	[Fact]
	public void Merge_MultipleFiles_CombinesAll() {
		var data1 = new byte[] { 0x01, 0x00, 0x00, 0x00 };
		var data2 = new byte[] { 0x00, 0x02, 0x00, 0x00 };
		var data3 = new byte[] { 0x00, 0x00, 0x01, 0x00 };

		var merged = CdlHeatmap.Merge(
			new CdlHeatmap(data1),
			new CdlHeatmap(data2),
			new CdlHeatmap(data3)
		);

		Assert.True(merged.IsCode(0));
		Assert.True(merged.IsData(1));
		Assert.True(merged.IsCode(2));
		Assert.False(merged.IsCovered(3));
	}

	#endregion

	#region Diff Tests

	[Fact]
	public void Diff_CalculatesCommonCoverage() {
		// Both have code at offset 0
		var data1 = new byte[] { 0x01, 0x01, 0x00 };
		var cdl1 = new CdlHeatmap(data1);

		var data2 = new byte[] { 0x01, 0x00, 0x02 };
		var cdl2 = new CdlHeatmap(data2);

		var diff = cdl1.Diff(cdl2);

		// Common should only have offset 0
		Assert.True(diff.Common.IsCode(0));
		Assert.False(diff.Common.IsCovered(1));
		Assert.False(diff.Common.IsCovered(2));
	}

	[Fact]
	public void Diff_CalculatesOnlyInFirst() {
		var data1 = new byte[] { 0x01, 0x01, 0x00 };
		var cdl1 = new CdlHeatmap(data1);

		var data2 = new byte[] { 0x01, 0x00, 0x02 };
		var cdl2 = new CdlHeatmap(data2);

		var diff = cdl1.Diff(cdl2);

		// OnlyInFirst should have offset 1 (code in first, nothing in second)
		Assert.False(diff.OnlyInFirst.IsCovered(0)); // Common
		Assert.True(diff.OnlyInFirst.IsCode(1));      // Only in first
		Assert.False(diff.OnlyInFirst.IsCovered(2)); // Only in second
	}

	[Fact]
	public void Diff_CalculatesOnlyInSecond() {
		var data1 = new byte[] { 0x01, 0x01, 0x00 };
		var cdl1 = new CdlHeatmap(data1);

		var data2 = new byte[] { 0x01, 0x00, 0x02 };
		var cdl2 = new CdlHeatmap(data2);

		var diff = cdl1.Diff(cdl2);

		// OnlyInSecond should have offset 2
		Assert.False(diff.OnlyInSecond.IsCovered(0)); // Common
		Assert.False(diff.OnlyInSecond.IsCovered(1)); // Only in first
		Assert.True(diff.OnlyInSecond.IsData(2));      // Only in second
	}

	[Fact]
	public void Diff_HandlesDifferentSizes() {
		var data1 = new byte[] { 0x01, 0x01, 0x01, 0x01 };
		var cdl1 = new CdlHeatmap(data1);

		var data2 = new byte[] { 0x02, 0x02 };
		var cdl2 = new CdlHeatmap(data2);

		var diff = cdl1.Diff(cdl2);

		// Size should be max of both
		Assert.Equal(4, diff.Common.Size);
		Assert.Equal(4, diff.OnlyInFirst.Size);
		Assert.Equal(4, diff.OnlyInSecond.Size);

		// Offsets 2-3 should only be in first
		Assert.True(diff.OnlyInFirst.IsCode(2));
		Assert.True(diff.OnlyInFirst.IsCode(3));
	}

	[Fact]
	public void Diff_WithNull_ThrowsArgumentNullException() {
		var data = new byte[] { 0x01 };
		var cdl = new CdlHeatmap(data);

		Assert.Throws<ArgumentNullException>(() => cdl.Diff(null!));
	}

	[Fact]
	public void Diff_IdenticalFiles_HasNoUniqueContent() {
		var data = new byte[] { 0x01, 0x02, 0x03 };
		var cdl1 = new CdlHeatmap(data);
		var cdl2 = new CdlHeatmap(data);

		var diff = cdl1.Diff(cdl2);

		// Common should have all
		var commonStats = diff.Common.GetCoverageStats();
		Assert.Equal(3, commonStats.CodeBytes + commonStats.DataBytes);

		// OnlyInFirst and OnlyInSecond should be empty
		var onlyFirstStats = diff.OnlyInFirst.GetCoverageStats();
		Assert.Equal(0, onlyFirstStats.CodeBytes + onlyFirstStats.DataBytes);
	}

	[Fact]
	public void GenerateDiffReport_ProducesReport() {
		var data1 = new byte[] { 0x01, 0x01, 0x00, 0x00 };
		var cdl1 = new CdlHeatmap(data1);

		var data2 = new byte[] { 0x01, 0x00, 0x02, 0x02 };
		var cdl2 = new CdlHeatmap(data2);

		var report = cdl1.GenerateDiffReport(cdl2, "Session1", "Session2");

		Assert.Contains("CDL DIFF COMPARISON", report);
		Assert.Contains("Session1", report);
		Assert.Contains("Session2", report);
		Assert.Contains("Common", report);
	}

	#endregion

	#region MLB Export Tests

	[Fact]
	public void ExportAsMlb_GeneratesValidMlbFormat() {
		// Create CDL with code and data regions
		var data = new byte[32];
		for (int i = 0; i < 16; i++) data[i] = 0x01; // Code
		for (int i = 16; i < 32; i++) data[i] = 0x02; // Data

		var heatmap = new CdlHeatmap(data);
		var mlb = heatmap.ExportAsMlb(minRegionSize: 8);

		Assert.Contains("MLB Labels", mlb);
		Assert.Contains("P:", mlb);
		Assert.Contains("cdl_code", mlb);
		Assert.Contains("cdl_data", mlb);
	}

	[Fact]
	public void ExportAsMlb_IncludesComments() {
		var data = new byte[16];
		Array.Fill<byte>(data, 0x01);

		var heatmap = new CdlHeatmap(data);
		var mlb = heatmap.ExportAsMlb(minRegionSize: 8);

		Assert.Contains("CDL:", mlb);
		Assert.Contains("bytes", mlb);
	}

	[Fact]
	public void ExportAsMlb_UsesCustomPrefix() {
		var data = new byte[16];
		Array.Fill<byte>(data, 0x01);

		var heatmap = new CdlHeatmap(data);
		var mlb = heatmap.ExportAsMlb(minRegionSize: 8, labelPrefix: "myrom");

		Assert.Contains("myrom_code", mlb);
	}

	[Fact]
	public void ExportAsMlb_RespectsMinRegionSize() {
		var data = new byte[32];
		// Small region (4 bytes)
		for (int i = 0; i < 4; i++) data[i] = 0x01;
		// Gap
		// Larger region (16 bytes)
		for (int i = 10; i < 26; i++) data[i] = 0x01;

		var heatmap = new CdlHeatmap(data);
		var mlb = heatmap.ExportAsMlb(minRegionSize: 8);

		// Should only have one label (the larger region)
		var lines = mlb.Split('\n').Where(l => l.StartsWith("P:")).ToList();
		Assert.Single(lines);
	}

	#endregion

	#region SYM Export Tests

	[Fact]
	public void ExportAsSym_GeneratesValidSymFormat() {
		var data = new byte[32];
		Array.Fill<byte>(data, 0x01);

		var heatmap = new CdlHeatmap(data);
		var sym = heatmap.ExportAsSym(minRegionSize: 8);

		Assert.Contains("[labels]", sym);
		Assert.Contains("cdl_code", sym);
	}

	[Fact]
	public void ExportAsSym_IncludesBankNumber() {
		var data = new byte[0x8000]; // 2 banks
									 // First bank
		for (int i = 0; i < 32; i++) data[i] = 0x01;
		// Second bank
		for (int i = 0x4000; i < 0x4020; i++) data[i] = 0x01;

		var heatmap = new CdlHeatmap(data);
		var sym = heatmap.ExportAsSym(minRegionSize: 8, bankSize: 0x4000);

		Assert.Contains("00:", sym); // Bank 0
		Assert.Contains("01:", sym); // Bank 1
	}

	#endregion

	#region Uncovered Regions Export Tests

	[Fact]
	public void ExportUncoveredRegions_TxtFormat_ListsRegions() {
		var data = new byte[256];
		// Cover first 64 bytes, leave rest uncovered
		for (int i = 0; i < 64; i++) data[i] = 0x01;

		var heatmap = new CdlHeatmap(data);
		var txt = heatmap.ExportUncoveredRegions(minSize: 64, format: "txt");

		Assert.Contains("Uncovered Regions", txt);
		Assert.Contains("0x000040", txt); // Start of uncovered region
	}

	[Fact]
	public void ExportUncoveredRegions_MlbFormat_GeneratesLabels() {
		var data = new byte[256];
		for (int i = 0; i < 64; i++) data[i] = 0x01;

		var heatmap = new CdlHeatmap(data);
		var mlb = heatmap.ExportUncoveredRegions(minSize: 64, format: "mlb");

		Assert.Contains("unknown_", mlb);
		Assert.Contains("P:", mlb);
	}

	[Fact]
	public void ExportUncoveredRegions_SymFormat_GeneratesLabels() {
		var data = new byte[256];
		for (int i = 0; i < 64; i++) data[i] = 0x01;

		var heatmap = new CdlHeatmap(data);
		var sym = heatmap.ExportUncoveredRegions(minSize: 64, format: "sym");

		Assert.Contains("[labels]", sym);
		Assert.Contains("unknown_", sym);
	}

	#endregion

	#region Format Conversion Tests

	[Fact]
	public void GetRawData_ReturnsClone() {
		var data = new byte[] { 0x01, 0x02, 0x03 };
		var heatmap = new CdlHeatmap(data);

		var raw = heatmap.GetRawData();

		Assert.Equal(data, raw);
		Assert.NotSame(data, raw); // Should be a clone
	}

	[Fact]
	public void ConvertTo_SameFormat_ReturnsSame() {
		var data = new byte[] { 0x01, 0x02 };
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		var converted = heatmap.ConvertTo(CdlHeatmap.CdlFormat.Fceux);

		Assert.Same(heatmap, converted);
	}

	[Fact]
	public void ConvertTo_FceuxToMesen_PreservesCodeAndData() {
		// FCEUX: 0x01=Code, 0x02=Data
		var data = new byte[] { 0x01, 0x02, 0x00 };
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		var converted = heatmap.ConvertTo(CdlHeatmap.CdlFormat.Mesen);

		Assert.Equal(CdlHeatmap.CdlFormat.Mesen, converted.Format);
		Assert.True(converted.IsCode(0));
		Assert.True(converted.IsData(1));
		Assert.False(converted.IsCovered(2));
	}

	[Fact]
	public void ConvertTo_MesenToFceux_PreservesCodeAndData() {
		// Mesen: 0x01=Code, 0x02=Data
		var data = new byte[] { 0x01, 0x02, 0x00 };
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Mesen);

		var converted = heatmap.ConvertTo(CdlHeatmap.CdlFormat.Fceux);

		Assert.Equal(CdlHeatmap.CdlFormat.Fceux, converted.Format);
		Assert.True(converted.IsCode(0));
		Assert.True(converted.IsData(1));
		Assert.False(converted.IsCovered(2));
	}

	[Fact]
	public void ConvertTo_FceuxToBsnes_MapsFlags() {
		// FCEUX: 0x01=Code, 0x02=Data
		// bsnes: 0x80=Executed, 0x40=Read
		var data = new byte[] { 0x01, 0x02, 0x03 }; // Code, Data, Both
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		var converted = heatmap.ConvertTo(CdlHeatmap.CdlFormat.Bsnes);
		var rawConverted = converted.GetRawData();

		Assert.Equal(0x80, rawConverted[0]); // Code -> Executed
		Assert.Equal(0x40, rawConverted[1]); // Data -> Read
		Assert.Equal(0xC0, rawConverted[2]); // Both -> Executed | Read
	}

	[Fact]
	public void ConvertTo_BsnesToFceux_MapsFlags() {
		// bsnes: 0x80=Executed, 0x40=Read
		// FCEUX: 0x01=Code, 0x02=Data
		var data = new byte[] { 0x80, 0x40, 0xC0 };
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Bsnes);

		var converted = heatmap.ConvertTo(CdlHeatmap.CdlFormat.Fceux);
		var rawConverted = converted.GetRawData();

		// Check raw flags since IsData returns false when Code is set
		Assert.Equal(0x01, rawConverted[0]); // Executed -> Code
		Assert.Equal(0x02, rawConverted[1]); // Read -> Data
		Assert.Equal(0x03, rawConverted[2]); // Both -> Code | Data
	}

	[Fact]
	public void ConvertTo_RoundTrip_PreservesData() {
		var data = new byte[] { 0x01, 0x02, 0x00, 0x03 };
		var original = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		// Convert FCEUX -> Mesen -> FCEUX
		var mesen = original.ConvertTo(CdlHeatmap.CdlFormat.Mesen);
		var roundTrip = mesen.ConvertTo(CdlHeatmap.CdlFormat.Fceux);

		// Coverage should be preserved
		Assert.Equal(original.GetCoverageStats().CoveragePercentage, roundTrip.GetCoverageStats().CoveragePercentage);
	}

	[Fact]
	public void GenerateConversionReport_ProducesReport() {
		var data = new byte[] { 0x01, 0x02, 0x00, 0x00 };
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		var report = heatmap.GenerateConversionReport(CdlHeatmap.CdlFormat.Mesen);

		Assert.Contains("CDL FORMAT CONVERSION", report);
		Assert.Contains("Fceux", report);
		Assert.Contains("Mesen", report);
	}

	[Fact]
	public void SaveToFile_WritesData() {
		var data = new byte[] { 0x01, 0x02, 0x03 };
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		var tempFile = Path.GetTempFileName();
		try {
			heatmap.SaveToFile(tempFile);
			var saved = File.ReadAllBytes(tempFile);
			Assert.Equal(data, saved);
		} finally {
			File.Delete(tempFile);
		}
	}

	[Fact]
	public void SaveToFile_WithConversion_WritesConvertedData() {
		var data = new byte[] { 0x01, 0x02 };
		var heatmap = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Fceux);

		var tempFile = Path.GetTempFileName();
		try {
			heatmap.SaveToFile(tempFile, CdlHeatmap.CdlFormat.Bsnes);
			var saved = File.ReadAllBytes(tempFile);
			// bsnes format: Code(0x01) -> Executed(0x80), Data(0x02) -> Read(0x40)
			Assert.Equal(0x80, saved[0]);
			Assert.Equal(0x40, saved[1]);
		} finally {
			File.Delete(tempFile);
		}
	}

	#endregion

	#region Search Tests

	[Fact]
	public void SearchByFlags_Code_ReturnsCodeOffsets() {
		var data = new byte[] { 0x01, 0x00, 0x01, 0x02, 0x01 };
		var heatmap = new CdlHeatmap(data);

		var results = heatmap.SearchByFlags(CdlHeatmap.CdlFlags.Code);

		Assert.Equal(3, results.Count);
		Assert.Equal(0, results[0].Offset);
		Assert.Equal(2, results[1].Offset);
		Assert.Equal(4, results[2].Offset);
	}

	[Fact]
	public void SearchByFlags_Data_ReturnsDataOffsets() {
		var data = new byte[] { 0x01, 0x02, 0x00, 0x02 };
		var heatmap = new CdlHeatmap(data);

		var results = heatmap.SearchByFlags(CdlHeatmap.CdlFlags.Data);

		Assert.Equal(2, results.Count);
		Assert.Equal(1, results[0].Offset);
		Assert.Equal(3, results[1].Offset);
	}

	[Fact]
	public void SearchByFlags_MatchAll_RequiresAllFlags() {
		var data = new byte[] { 0x01, 0x03, 0x02, 0x03 }; // 0x03 = Code + Data
		var heatmap = new CdlHeatmap(data);

		var results = heatmap.SearchByFlags(CdlHeatmap.CdlFlags.Code | CdlHeatmap.CdlFlags.Data, matchAll: true);

		Assert.Equal(2, results.Count);
		Assert.Equal(1, results[0].Offset);
		Assert.Equal(3, results[1].Offset);
	}

	[Fact]
	public void SearchByFlags_WithMaxResults_LimitsResults() {
		var data = new byte[100];
		for (int i = 0; i < 100; i++) data[i] = 0x01;
		var heatmap = new CdlHeatmap(data);

		var results = heatmap.SearchByFlags(CdlHeatmap.CdlFlags.Code, maxResults: 10);

		Assert.Equal(10, results.Count);
	}

	[Fact]
	public void FindCoverageBoundaries_FindsTransitions() {
		var data = new byte[] { 0x00, 0x01, 0x01, 0x00, 0x02 };
		var heatmap = new CdlHeatmap(data);

		var results = heatmap.FindCoverageBoundaries();

		Assert.Equal(3, results.Count);
		Assert.Equal(1, results[0].Offset); // Start of coverage
		Assert.Equal(3, results[1].Offset); // End of coverage
		Assert.Equal(4, results[2].Offset); // Start of coverage again
	}

	[Fact]
	public void FindNext_FromStart_FindsFirstMatch() {
		var data = new byte[] { 0x00, 0x00, 0x01, 0x00 };
		var heatmap = new CdlHeatmap(data);

		var offset = heatmap.FindNext(-1, CdlHeatmap.CdlFlags.Code);

		Assert.Equal(2, offset);
	}

	[Fact]
	public void FindNext_Backward_FindsPreviousMatch() {
		var data = new byte[] { 0x01, 0x00, 0x00, 0x01 };
		var heatmap = new CdlHeatmap(data);

		var offset = heatmap.FindNext(3, CdlHeatmap.CdlFlags.Code, searchBackward: true);

		Assert.Equal(0, offset);
	}

	[Fact]
	public void FindNext_NoMatch_ReturnsNegativeOne() {
		var data = new byte[] { 0x00, 0x00, 0x00 };
		var heatmap = new CdlHeatmap(data);

		var offset = heatmap.FindNext(0, CdlHeatmap.CdlFlags.Code);

		Assert.Equal(-1, offset);
	}

	[Fact]
	public void SearchRange_ReturnsOffsetInfo() {
		var data = new byte[] { 0x01, 0x02, 0x00, 0x03 };
		var heatmap = new CdlHeatmap(data);

		var results = heatmap.SearchRange(1, 3);

		Assert.Equal(2, results.Count);
		Assert.Equal(1, results[0].Offset);
		Assert.Equal(2, results[1].Offset);
	}

	#endregion

	#region Bookmark Tests

	[Fact]
	public void AddBookmark_AddsToCollection() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);

		heatmap.AddBookmark(10, "test_label");

		Assert.Single(heatmap.Bookmarks);
		Assert.Equal(10, heatmap.Bookmarks[0].Offset);
		Assert.Equal("test_label", heatmap.Bookmarks[0].Label);
	}

	[Fact]
	public void AddBookmark_WithDescription_IncludesDescription() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);

		heatmap.AddBookmark(10, "label", "description", "category");

		Assert.Equal("description", heatmap.Bookmarks[0].Description);
		Assert.Equal("category", heatmap.Bookmarks[0].Category);
	}

	[Fact]
	public void AddBookmark_OutOfRange_ThrowsException() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);

		Assert.Throws<ArgumentOutOfRangeException>(() => heatmap.AddBookmark(200, "test"));
	}

	[Fact]
	public void AddBookmark_SameOffset_ReplacesExisting() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);

		heatmap.AddBookmark(10, "first");
		heatmap.AddBookmark(10, "second");

		Assert.Single(heatmap.Bookmarks);
		Assert.Equal("second", heatmap.Bookmarks[0].Label);
	}

	[Fact]
	public void RemoveBookmark_RemovesFromCollection() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);
		heatmap.AddBookmark(10, "test");

		var result = heatmap.RemoveBookmark(10);

		Assert.True(result);
		Assert.Empty(heatmap.Bookmarks);
	}

	[Fact]
	public void RemoveBookmark_NonExistent_ReturnsFalse() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);

		var result = heatmap.RemoveBookmark(10);

		Assert.False(result);
	}

	[Fact]
	public void ClearBookmarks_RemovesAll() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);
		heatmap.AddBookmark(10, "test1");
		heatmap.AddBookmark(20, "test2");

		heatmap.ClearBookmarks();

		Assert.Empty(heatmap.Bookmarks);
	}

	[Fact]
	public void GetNextBookmark_FindsNext() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);
		heatmap.AddBookmark(10, "first");
		heatmap.AddBookmark(30, "second");

		var next = heatmap.GetNextBookmark(15);

		Assert.NotNull(next);
		Assert.Equal(30, next.Offset);
	}

	[Fact]
	public void GetPreviousBookmark_FindsPrevious() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);
		heatmap.AddBookmark(10, "first");
		heatmap.AddBookmark(30, "second");

		var prev = heatmap.GetPreviousBookmark(25);

		Assert.NotNull(prev);
		Assert.Equal(10, prev.Offset);
	}

	[Fact]
	public void ExportBookmarks_ProducesValidFormat() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);
		heatmap.AddBookmark(10, "label1", "desc1", "cat1");
		heatmap.AddBookmark(20, "label2");

		var exported = heatmap.ExportBookmarks();

		Assert.Contains("$00000A = label1", exported);
		Assert.Contains("desc1", exported);
		Assert.Contains("$000014 = label2", exported);
	}

	[Fact]
	public void ImportBookmarks_ParsesContent() {
		var data = CreateTestCdlData(100);
		var heatmap = new CdlHeatmap(data);
		var content = "$0A = test1 ; description\n$14 = test2";

		heatmap.ImportBookmarks(content);

		Assert.Equal(2, heatmap.Bookmarks.Count);
		Assert.Equal(0x0A, heatmap.Bookmarks[0].Offset);
		Assert.Equal(0x14, heatmap.Bookmarks[1].Offset);
	}

	[Fact]
	public void AutoGenerateBookmarks_CreatesBookmarks() {
		// Create data with sub-entry points
		var data = new byte[100];
		data[10] = (byte)CdlHeatmap.CdlFlags.SubEntryPoint;
		data[50] = (byte)CdlHeatmap.CdlFlags.SubEntryPoint;
		var heatmap = new CdlHeatmap(data);

		heatmap.AutoGenerateBookmarks(includeSubEntryPoints: true, includeCoverageBoundaries: false);

		Assert.Equal(2, heatmap.Bookmarks.Count);
	}

	#endregion
}
