using Avalonia.Platform.Storage;
using GameInfoTools.Analysis;
using GameInfoTools.UI.Services;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.Tests;

/// <summary>
/// Simple mock file dialog service for testing.
/// </summary>
internal class MockFileDialogService : IFileDialogService {
	public string? NextOpenResult { get; set; }
	public string? NextSaveResult { get; set; }
	public string? NextFolderResult { get; set; }

	public Task<string?> OpenFileAsync(string title, params FilePickerFileType[] filters) {
		return Task.FromResult(NextOpenResult);
	}

	public Task<string?> SaveFileAsync(string title, string? defaultExtension = null, string? suggestedFileName = null, params FilePickerFileType[] filters) {
		return Task.FromResult(NextSaveResult);
	}

	public Task<string?> SelectFolderAsync(string title) {
		return Task.FromResult(NextFolderResult);
	}
}

/// <summary>
/// Tests for CdlViewerViewModel.
/// </summary>
public class CdlViewerViewModelTests {

	private static byte[] CreateTestCdlData(int size = 0x4000) {
		var data = new byte[size];

		// Fill with test pattern:
		// First 25% = code (0x01)
		// Next 25% = data (0x02)
		// Next 25% = mixed
		// Last 25% = empty
		int quarter = size / 4;

		for (int i = 0; i < quarter; i++) {
			data[i] = 0x01; // Code
		}

		for (int i = quarter; i < quarter * 2; i++) {
			data[i] = 0x02; // Data
		}

		for (int i = quarter * 2; i < quarter * 3; i++) {
			data[i] = (byte)(i % 2 == 0 ? 0x01 : 0x02); // Mixed
		}

		// Last quarter is empty (zeros)

		return data;
	}

	#region Initial State Tests

	[Fact]
	public void Constructor_InitialState_HasNoCdlLoaded() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		Assert.False(vm.HasCdlLoaded);
		Assert.Equal("No CDL file loaded", vm.StatusText);
		Assert.Empty(vm.Banks);
	}

	#endregion

	#region LoadFromData Tests

	[Fact]
	public void LoadFromData_ValidData_SetsCdlLoaded() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var data = CreateTestCdlData();
		vm.LoadFromData(data);

		Assert.True(vm.HasCdlLoaded);
		Assert.Equal("Generic", vm.FormatName);
	}

	[Fact]
	public void LoadFromData_ValidData_CalculatesStatistics() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var data = CreateTestCdlData(0x4000);
		vm.LoadFromData(data);

		Assert.Equal(0x4000, vm.TotalBytes);
		Assert.True(vm.CodeBytes > 0);
		Assert.True(vm.DataBytes > 0);
		Assert.True(vm.UnknownBytes > 0);
	}

	[Fact]
	public void LoadFromData_ValidData_PopulatesBankCoverage() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);
		vm.BankSize = 0x1000; // 4KB banks

		var data = CreateTestCdlData(0x4000);
		vm.LoadFromData(data);

		Assert.NotEmpty(vm.Banks);
		Assert.Equal(4, vm.Banks.Count); // 16KB / 4KB = 4 banks
	}

	[Fact]
	public void LoadFromData_ValidData_PopulatesRegions() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var data = CreateTestCdlData();
		vm.LoadFromData(data);

		Assert.NotEmpty(vm.CoveredRegions);
		Assert.NotEmpty(vm.UncoveredRegions);
	}

	[Fact]
	public void LoadFromData_ValidData_GeneratesAsciiHeatmap() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var data = CreateTestCdlData();
		vm.LoadFromData(data);

		Assert.False(string.IsNullOrEmpty(vm.AsciiHeatmap));
	}

	[Fact]
	public void LoadFromData_WithFormat_SetsFormat() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var data = CreateTestCdlData();
		vm.LoadFromData(data, CdlHeatmap.CdlFormat.Fceux);

		Assert.Equal("Fceux", vm.FormatName);
	}

	#endregion

	#region BankCoverageInfo Tests

	[Fact]
	public void BankCoverageInfo_FormatsLabelsCorrectly() {
		var info = new BankCoverageInfo(
			BankIndex: 5,
			StartOffset: 0x14000,
			EndOffset: 0x17fff,
			CodePercentage: 25.5,
			DataPercentage: 35.2,
			CoveragePercentage: 60.7
		);

		Assert.Equal("Bank $05", info.BankLabel);
		Assert.Equal("$014000-$017FFF", info.OffsetRange);
		Assert.Equal("25.5%", info.CodeDisplay);
		Assert.Equal("35.2%", info.DataDisplay);
		Assert.Equal("60.7%", info.CoverageDisplay);
	}

	#endregion

	#region CdlRegionInfo Tests

	[Fact]
	public void CdlRegionInfo_FormatsCorrectly() {
		var info = new CdlRegionInfo(
			Offset: 0x1234,
			Length: 256,
			Type: "Code"
		);

		Assert.Equal("$001234", info.OffsetHex);
		Assert.Equal("$001333", info.EndOffsetHex);
		Assert.Equal("256", info.LengthDisplay);
	}

	#endregion

	#region HeatmapCellInfo Tests

	[Fact]
	public void HeatmapCellInfo_FormatsCorrectly() {
		var cellCode = new HeatmapCellInfo(0x1000, 256, 0.75, true, false);
		var cellData = new HeatmapCellInfo(0x2000, 256, 0.5, false, true);
		var cellUnknown = new HeatmapCellInfo(0x3000, 256, 0.0, false, false);

		Assert.Equal("Code", cellCode.Type);
		Assert.Equal("Data", cellData.Type);
		Assert.Equal("Unknown", cellUnknown.Type);
		Assert.Equal("$001000", cellCode.OffsetHex);
	}

	#endregion

	#region PropertyChange Tests

	[Fact]
	public void BankSizeChanged_RefreshesBankCoverage() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);
		vm.BankSize = 0x4000; // 16KB banks

		var data = CreateTestCdlData(0x8000); // 32KB
		vm.LoadFromData(data);

		int initialBankCount = vm.Banks.Count;

		// Change to 8KB banks
		vm.BankSize = 0x2000;

		Assert.Equal(initialBankCount * 2, vm.Banks.Count);
	}

	[Fact]
	public void HeatmapWidthChanged_RegeneratesHeatmap() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var data = CreateTestCdlData();
		vm.LoadFromData(data);

		string originalHeatmap = vm.AsciiHeatmap;

		vm.HeatmapWidth = 32; // Change from default 64

		// Heatmap should be different with different width
		Assert.NotEqual(originalHeatmap, vm.AsciiHeatmap);
	}

	#endregion

	#region Navigation Tests

	[Fact]
	public void GoToOffset_RaisesNavigateToOffsetEvent() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		int navigatedOffset = -1;
		vm.NavigateToOffset += offset => navigatedOffset = offset;

		vm.GoToOffsetCommand.Execute(0x1234);

		Assert.Equal(0x1234, navigatedOffset);
	}

	#endregion

	#region Refresh Tests

	[Fact]
	public void Refresh_WithoutCdl_DoesNotThrow() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var exception = Record.Exception(() => vm.RefreshCommand.Execute(null));

		Assert.Null(exception);
	}

	[Fact]
	public void Refresh_WithCdl_UpdatesAllCollections() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		var data = CreateTestCdlData();
		vm.LoadFromData(data);

		// Store initial counts to verify refresh maintains them
		var initialBankCount = vm.Banks.Count;
		var initialCoveredCount = vm.CoveredRegions.Count;

		vm.RefreshCommand.Execute(null);

		Assert.Equal(initialBankCount, vm.Banks.Count);
		Assert.Equal(initialCoveredCount, vm.CoveredRegions.Count);
	}

	#endregion

	#region Export Tests

	[Fact]
	public async Task ExportToCsv_WithoutCdl_ShowsError() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		await vm.ExportToCsvCommand.ExecuteAsync(null);

		Assert.Equal("No CDL loaded", vm.StatusText);
	}

	[Fact]
	public async Task ExportToJson_WithoutCdl_ShowsError() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		await vm.ExportToJsonCommand.ExecuteAsync(null);

		Assert.Equal("No CDL loaded", vm.StatusText);
	}

	[Fact]
	public async Task GenerateReport_WithoutCdl_ShowsError() {
		var mockService = new MockFileDialogService();
		var vm = new CdlViewerViewModel(mockService);

		await vm.GenerateReportCommand.ExecuteAsync(null);

		Assert.Equal("No CDL loaded", vm.StatusText);
	}

	#endregion
}
