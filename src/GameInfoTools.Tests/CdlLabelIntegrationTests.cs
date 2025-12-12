using GameInfoTools.Analysis;
using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CDL/Label integration functionality.
/// </summary>
public class CdlLabelIntegrationTests {

	private static byte[] CreateTestCdlData(int size = 0x4000) {
		var data = new byte[size];

		// First quarter: code
		int quarter = size / 4;
		for (int i = 0; i < quarter; i++) {
			data[i] = 0x01; // Code flag
		}

		// Second quarter: data
		for (int i = quarter; i < quarter * 2; i++) {
			data[i] = 0x02; // Data flag
		}

		// Third quarter: mixed
		for (int i = quarter * 2; i < quarter * 3; i++) {
			data[i] = (byte)(i % 2 == 0 ? 0x01 : 0x02);
		}

		// Last quarter: empty (no coverage)
		return data;
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidCdl_CreatesInstance() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);

		var integration = new CdlLabelIntegration(heatmap);

		Assert.NotNull(integration);
		Assert.False(integration.HasLabels);
	}

	[Fact]
	public void Constructor_WithNullCdl_ThrowsArgumentNullException() {
		Assert.Throws<ArgumentNullException>(() => new CdlLabelIntegration(null!));
	}

	[Fact]
	public void Constructor_WithCustomBaseAddress_UsesCorrectAddress() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);

		var integration = new CdlLabelIntegration(heatmap, baseAddress: 0xC000);

		// Offset 0 should map to address $C000
		Assert.Equal(0xC000, integration.OffsetToAddress(0));
		Assert.Equal(0, integration.AddressToOffset(0xC000));
	}

	#endregion

	#region LoadMlb Tests

	[Fact]
	public void LoadMlb_ValidFormat_LoadsLabels() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		string mlb = """
			G:8000:Reset:Entry point
			G:8100:NMI:NMI handler
			R:0000:ZeroPage1
			S:9000:DataTable1
			""";

		integration.LoadMlb(mlb);

		Assert.True(integration.HasLabels);
		Assert.Equal("Reset", integration.Symbols.GetSymbol(0x8000));
		Assert.Equal("NMI", integration.Symbols.GetSymbol(0x8100));
		Assert.Equal("ZeroPage1", integration.Symbols.GetSymbol(0x0000));
		Assert.Equal("DataTable1", integration.Symbols.GetSymbol(0x9000));
	}

	[Fact]
	public void LoadMlb_TypeCodes_MappedCorrectly() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		string mlb = """
			G:8000:CodeLabel
			P:8100:PrgLabel
			R:0000:RamLabel
			S:9000:DataLabel
			""";

		integration.LoadMlb(mlb);

		Assert.Equal(SymbolTable.SymbolType.Code, integration.Symbols.GetSymbolType("CodeLabel"));
		Assert.Equal(SymbolTable.SymbolType.Code, integration.Symbols.GetSymbolType("PrgLabel"));
		Assert.Equal(SymbolTable.SymbolType.Ram, integration.Symbols.GetSymbolType("RamLabel"));
		Assert.Equal(SymbolTable.SymbolType.Data, integration.Symbols.GetSymbolType("DataLabel"));
	}

	[Fact]
	public void LoadMlb_IgnoresComments() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		string mlb = """
			# This is a comment
			G:8000:ValidLabel
			""";

		integration.LoadMlb(mlb);

		Assert.True(integration.HasLabels);
		Assert.Equal("ValidLabel", integration.Symbols.GetSymbol(0x8000));
	}

	#endregion

	#region LoadFceuxNl Tests

	[Fact]
	public void LoadFceuxNl_ValidFormat_LoadsLabels() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		string nl = """
			$8000#Reset#Entry point
			$8100#NMI#NMI handler
			$9000#DataTable#
			""";

		integration.LoadFceuxNl(nl);

		Assert.True(integration.HasLabels);
		Assert.Equal("Reset", integration.Symbols.GetSymbol(0x8000));
		Assert.Equal("NMI", integration.Symbols.GetSymbol(0x8100));
		Assert.Equal("DataTable", integration.Symbols.GetSymbol(0x9000));
	}

	[Fact]
	public void LoadFceuxNl_WithComments_ExtractsComments() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		string nl = "$8000#Reset#This is the entry point";

		integration.LoadFceuxNl(nl);

		Assert.Equal("This is the entry point", integration.Symbols.GetComment("Reset"));
	}

	[Fact]
	public void LoadFceuxNl_IgnoresCommentLines() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		string nl = """
			; This is a comment
			$8000#ValidLabel#
			""";

		integration.LoadFceuxNl(nl);

		Assert.True(integration.HasLabels);
		Assert.Equal("ValidLabel", integration.Symbols.GetSymbol(0x8000));
	}

	#endregion

	#region LoadLabels Tests

	[Fact]
	public void LoadLabels_EqualsFormat_LoadsLabels() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		string labels = """
			Reset = $8000
			NMI = $8100
			""";

		integration.LoadLabels(labels);

		Assert.True(integration.HasLabels);
		Assert.Equal("Reset", integration.Symbols.GetSymbol(0x8000));
		Assert.Equal("NMI", integration.Symbols.GetSymbol(0x8100));
	}

	#endregion

	#region GetLabelsWithCoverage Tests

	[Fact]
	public void GetLabelsWithCoverage_ReturnsAllLabelsWithStatus() {
		var cdlData = CreateTestCdlData(0x4000);
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		// Add labels at different coverage locations
		// Offset 0x100 is in code region (first quarter)
		// Offset 0x1100 is in data region (second quarter)
		// Offset 0x3100 is in uncovered region (last quarter)
		integration.LoadLabels("""
			CodeLabel = $8100
			DataLabel = $9100
			UncoveredLabel = $B100
			""");

		var labels = integration.GetLabelsWithCoverage();

		Assert.Equal(3, labels.Count);

		var codeLabel = labels.First(l => l.Name == "CodeLabel");
		Assert.True(codeLabel.IsCovered);
		Assert.True(codeLabel.IsCode);

		var dataLabel = labels.First(l => l.Name == "DataLabel");
		Assert.True(dataLabel.IsCovered);
		Assert.True(dataLabel.IsData);

		var uncoveredLabel = labels.First(l => l.Name == "UncoveredLabel");
		Assert.False(uncoveredLabel.IsCovered);
	}

	[Fact]
	public void GetLabelsWithCoverage_SortsByAddress() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			Third = $9000
			First = $8000
			Second = $8500
			""");

		var labels = integration.GetLabelsWithCoverage();

		Assert.Equal("First", labels[0].Name);
		Assert.Equal("Second", labels[1].Name);
		Assert.Equal("Third", labels[2].Name);
	}

	#endregion

	#region GetLabelsByCoverage Tests

	[Fact]
	public void GetLabelsByCoverage_FilterByCode_ReturnsCodeOnly() {
		var cdlData = CreateTestCdlData(0x4000);
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			CodeLabel = $8100
			DataLabel = $9100
			""");

		var codeLabels = integration.GetLabelsByCoverage(isCode: true);

		Assert.Single(codeLabels);
		Assert.Equal("CodeLabel", codeLabels[0].Name);
	}

	[Fact]
	public void GetLabelsByCoverage_FilterByUncovered_ReturnsUncoveredOnly() {
		var cdlData = CreateTestCdlData(0x4000);
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			CoveredLabel = $8100
			UncoveredLabel = $B100
			""");

		var uncovered = integration.GetLabelsByCoverage(isCovered: false);

		Assert.Single(uncovered);
		Assert.Equal("UncoveredLabel", uncovered[0].Name);
	}

	#endregion

	#region GetCoverageSummary Tests

	[Fact]
	public void GetCoverageSummary_ReturnsCorrectCounts() {
		var cdlData = CreateTestCdlData(0x4000);
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			CodeLabel1 = $8100
			CodeLabel2 = $8200
			DataLabel = $9100
			UncoveredLabel = $B100
			""");

		var summary = integration.GetCoverageSummary();

		Assert.Equal(4, summary.TotalLabels);
		Assert.Equal(3, summary.CoveredLabels);
		Assert.Equal(1, summary.UncoveredLabels);
		Assert.Equal(2, summary.CodeLabels);
		Assert.Equal(1, summary.DataLabels);
	}

	[Fact]
	public void GetCoverageSummary_NoLabels_ReturnsZeros() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		var summary = integration.GetCoverageSummary();

		Assert.Equal(0, summary.TotalLabels);
		Assert.Equal(0, summary.CoveredLabels);
		Assert.Equal(0.0, summary.CoveredPercentage);
	}

	#endregion

	#region GetLabelAtOffset Tests

	[Fact]
	public void GetLabelAtOffset_WithLabel_ReturnsLabelName() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("TestLabel = $8100");

		var label = integration.GetLabelAtOffset(0x100); // 0x100 + 0x8000 = $8100

		Assert.Equal("TestLabel", label);
	}

	[Fact]
	public void GetLabelAtOffset_NoLabel_ReturnsNull() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("TestLabel = $8100");

		var label = integration.GetLabelAtOffset(0x200); // No label at $8200

		Assert.Null(label);
	}

	#endregion

	#region Export Tests

	[Fact]
	public void ExportToMlb_GeneratesValidFormat() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			Reset = $8000
			NMI = $8100
			""");

		var output = integration.ExportToMlb();

		Assert.Contains(":8000:", output);
		Assert.Contains(":Reset:", output);
		Assert.Contains(":8100:", output);
		Assert.Contains(":NMI:", output);
	}

	[Fact]
	public void ExportToFceuxNl_GeneratesValidFormat() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			Reset = $8000
			NMI = $8100
			""");

		var output = integration.ExportToFceuxNl();

		Assert.Contains("$8000#Reset#", output);
		Assert.Contains("$8100#NMI#", output);
	}

	[Fact]
	public void ExportToSymbols_GeneratesValidFormat() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			Reset = $8000
			NMI = $8100
			""");

		var output = integration.ExportToSymbols();

		Assert.Contains("Reset = $8000", output);
		Assert.Contains("NMI = $8100", output);
	}

	#endregion

	#region Address Conversion Tests

	[Fact]
	public void AddressToOffset_ConvertsCorrectly() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap, baseAddress: 0x8000);

		Assert.Equal(0, integration.AddressToOffset(0x8000));
		Assert.Equal(0x100, integration.AddressToOffset(0x8100));
		Assert.Equal(0x1000, integration.AddressToOffset(0x9000));
	}

	[Fact]
	public void OffsetToAddress_ConvertsCorrectly() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap, baseAddress: 0x8000);

		Assert.Equal(0x8000, integration.OffsetToAddress(0));
		Assert.Equal(0x8100, integration.OffsetToAddress(0x100));
		Assert.Equal(0x9000, integration.OffsetToAddress(0x1000));
	}

	#endregion

	#region GetLabelsInRange Tests

	[Fact]
	public void GetLabelsInRange_ReturnsLabelsInSpecifiedRange() {
		var cdlData = CreateTestCdlData();
		var heatmap = new CdlHeatmap(cdlData);
		var integration = new CdlLabelIntegration(heatmap);

		integration.LoadLabels("""
			Label1 = $8000
			Label2 = $8100
			Label3 = $8200
			Label4 = $9000
			""");

		// Get labels from offset 0x50 to 0x150 ($8050 to $8150)
		var labels = integration.GetLabelsInRange(0x50, 0x150);

		Assert.Single(labels);
		Assert.Equal("Label2", labels[0].Name);
	}

	#endregion
}
