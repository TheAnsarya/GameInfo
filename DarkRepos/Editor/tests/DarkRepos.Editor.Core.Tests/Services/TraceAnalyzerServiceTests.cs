using DarkRepos.Editor.Core.Services;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Services;

public class TraceAnalyzerServiceTests
{
	private readonly TraceAnalyzerService _service;

	public TraceAnalyzerServiceTests()
	{
		_service = new TraceAnalyzerService();
	}

	[Fact]
	public void LoadCdl_WithValidData_SetsFlagsCorrectly()
	{
		// Arrange - Create test CDL data
		var cdlData = new byte[] {
			0x01, // Code
			0x02, // Data
			0x04, // Drawn (Graphics)
			0x03, // Code + Data
			0x00  // Unknown
		};

		// Act
		_service.LoadCdl(cdlData);

		// Assert
		Assert.Equal(TraceAnalyzerService.CdlFlags.Code, _service.GetFlags(0));
		Assert.Equal(TraceAnalyzerService.CdlFlags.Data, _service.GetFlags(1));
		Assert.Equal(TraceAnalyzerService.CdlFlags.Drawn, _service.GetFlags(2));
		Assert.Equal(TraceAnalyzerService.CdlFlags.Code | TraceAnalyzerService.CdlFlags.Data, _service.GetFlags(3));
		Assert.Equal(TraceAnalyzerService.CdlFlags.None, _service.GetFlags(4));
	}

	[Fact]
	public void IsCode_WithCodeByte_ReturnsTrue()
	{
		// Arrange
		_service.LoadCdl(new byte[] { 0x01 });

		// Assert
		Assert.True(_service.IsCode(0));
		Assert.False(_service.IsData(0));
		Assert.False(_service.IsDrawn(0));
	}

	[Fact]
	public void IsData_WithDataByte_ReturnsTrue()
	{
		// Arrange
		_service.LoadCdl(new byte[] { 0x02 });

		// Assert
		Assert.False(_service.IsCode(0));
		Assert.True(_service.IsData(0));
		Assert.False(_service.IsDrawn(0));
	}

	[Fact]
	public void IsDrawn_WithDrawnByte_ReturnsTrue()
	{
		// Arrange
		_service.LoadCdl(new byte[] { 0x04 });

		// Assert
		Assert.False(_service.IsCode(0));
		Assert.False(_service.IsData(0));
		Assert.True(_service.IsDrawn(0));
	}

	[Fact]
	public void GetSummary_WithMixedData_ReturnsCorrectCounts()
	{
		// Arrange
		var cdlData = new byte[] {
			0x01, 0x01, 0x01, // 3 code
			0x02, 0x02,       // 2 data
			0x04,             // 1 drawn
			0x00, 0x00, 0x00, 0x00 // 4 unknown
		};
		_service.LoadCdl(cdlData);

		// Act
		var summary = _service.GetSummary();

		// Assert
		Assert.NotNull(summary);
		Assert.Equal(10, summary.TotalBytes);
		Assert.Equal(3, summary.CodeBytes);
		Assert.Equal(2, summary.DataBytes);
		Assert.Equal(1, summary.DrawnBytes);
		Assert.Equal(4, summary.UnknownBytes);
	}

	[Fact]
	public void GetSummary_WithNoCdlData_ReturnsNull()
	{
		// Act
		var summary = _service.GetSummary();

		// Assert
		Assert.Null(summary);
	}

	[Fact]
	public void GetFlags_WithOutOfRangeAddress_ReturnsNone()
	{
		// Arrange
		_service.LoadCdl(new byte[] { 0x01, 0x02 });

		// Assert
		Assert.Equal(TraceAnalyzerService.CdlFlags.None, _service.GetFlags(-1));
		Assert.Equal(TraceAnalyzerService.CdlFlags.None, _service.GetFlags(999));
	}

	[Fact]
	public void GetRegions_WithContiguousData_IdentifiesRegions()
	{
		// Arrange - Create CDL with distinct regions
		var cdlData = new byte[64];
		// First 32 bytes are code
		for (int i = 0; i < 32; i++) cdlData[i] = 0x01;
		// Next 32 bytes are data
		for (int i = 32; i < 64; i++) cdlData[i] = 0x02;

		_service.LoadCdl(cdlData);

		// Act
		var regions = _service.GetRegions(minSize: 16);

		// Assert
		Assert.Equal(2, regions.Count);
		Assert.Equal("Code", regions[0].Type);
		Assert.Equal(0, regions[0].StartAddress);
		Assert.Equal(31, regions[0].EndAddress);
		Assert.Equal("Data", regions[1].Type);
		Assert.Equal(32, regions[1].StartAddress);
		Assert.Equal(63, regions[1].EndAddress);
	}

	[Fact]
	public void GetRegions_WithSmallRegions_FiltersCorrectly()
	{
		// Arrange - Create CDL with small regions
		var cdlData = new byte[20];
		for (int i = 0; i < 10; i++) cdlData[i] = 0x01; // 10 bytes code
		for (int i = 10; i < 20; i++) cdlData[i] = 0x02; // 10 bytes data

		_service.LoadCdl(cdlData);

		// Act - min size 16 should filter out these small regions
		var regions = _service.GetRegions(minSize: 16);

		// Assert
		Assert.Empty(regions);

		// Act - min size 8 should include both
		var smallerRegions = _service.GetRegions(minSize: 8);
		Assert.Equal(2, smallerRegions.Count);
	}

	[Fact]
	public void GetUniqueAddresses_WithNoTraceData_ReturnsEmpty()
	{
		// Act
		var addresses = _service.GetUniqueAddresses();

		// Assert
		Assert.Empty(addresses);
	}

	[Fact]
	public void GetMnemonicHistogram_WithNoTraceData_ReturnsEmpty()
	{
		// Act
		var histogram = _service.GetMnemonicHistogram();

		// Assert
		Assert.Empty(histogram);
	}

	[Fact]
	public void GetEntriesInRange_WithNoTraceData_ReturnsEmpty()
	{
		// Act
		var entries = _service.GetEntriesInRange(0, 0xFFFFFF);

		// Assert
		Assert.Empty(entries);
	}

	[Fact]
	public void ExportCdlReport_WithData_ProducesReport()
	{
		// Arrange
		var cdlData = new byte[] { 0x01, 0x02, 0x04, 0x00 };
		_service.LoadCdl(cdlData);

		// Act
		var report = _service.ExportCdlReport();

		// Assert
		Assert.Contains("CDL Analysis Report", report);
		Assert.Contains("Total bytes:", report);
		Assert.Contains("Code bytes:", report);
	}

	[Fact]
	public void ExportCdlReport_WithNoCdlData_ReturnsMessage()
	{
		// Act
		var report = _service.ExportCdlReport();

		// Assert
		Assert.Equal("No CDL data loaded.", report);
	}

	[Theory]
	[InlineData(0x00, TraceAnalyzerService.CdlFlags.None)]
	[InlineData(0x01, TraceAnalyzerService.CdlFlags.Code)]
	[InlineData(0x02, TraceAnalyzerService.CdlFlags.Data)]
	[InlineData(0x04, TraceAnalyzerService.CdlFlags.Drawn)]
	[InlineData(0x10, TraceAnalyzerService.CdlFlags.IndexMode8)]
	[InlineData(0x20, TraceAnalyzerService.CdlFlags.MemoryMode8)]
	[InlineData(0x31, TraceAnalyzerService.CdlFlags.Code | TraceAnalyzerService.CdlFlags.IndexMode8 | TraceAnalyzerService.CdlFlags.MemoryMode8)]
	public void CdlFlags_ParseCorrectly(byte input, TraceAnalyzerService.CdlFlags expected)
	{
		// Arrange
		_service.LoadCdl(new byte[] { input });

		// Assert
		Assert.Equal(expected, _service.GetFlags(0));
	}
}
