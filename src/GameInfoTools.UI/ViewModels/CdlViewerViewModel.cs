using System.Collections.ObjectModel;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Analysis;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for CDL (Code/Data Log) file visualization.
/// </summary>
public partial class CdlViewerViewModel : ViewModelBase {
	private readonly IFileDialogService _fileDialogService;
	private CdlHeatmap? _cdlHeatmap;

	[ObservableProperty]
	private bool _hasCdlLoaded;

	[ObservableProperty]
	private string _cdlFilePath = "";

	[ObservableProperty]
	private string _formatName = "None";

	[ObservableProperty]
	private int _totalBytes;

	[ObservableProperty]
	private int _codeBytes;

	[ObservableProperty]
	private int _dataBytes;

	[ObservableProperty]
	private int _unknownBytes;

	[ObservableProperty]
	private double _codePercentage;

	[ObservableProperty]
	private double _dataPercentage;

	[ObservableProperty]
	private double _coveragePercentage;

	[ObservableProperty]
	private string _statusText = "No CDL file loaded";

	[ObservableProperty]
	private string _asciiHeatmap = "";

	[ObservableProperty]
	private int _heatmapWidth = 64;

	[ObservableProperty]
	private int _selectedBankIndex = -1;

	[ObservableProperty]
	private int _bankSize = 0x4000;

	/// <summary>
	/// Bank-level coverage information.
	/// </summary>
	public ObservableCollection<BankCoverageInfo> Banks { get; } = [];

	/// <summary>
	/// Covered code/data regions.
	/// </summary>
	public ObservableCollection<CdlRegionInfo> CoveredRegions { get; } = [];

	/// <summary>
	/// Uncovered regions.
	/// </summary>
	public ObservableCollection<CdlRegionInfo> UncoveredRegions { get; } = [];

	/// <summary>
	/// Heatmap cells for visualization.
	/// </summary>
	public ObservableCollection<HeatmapCellInfo> HeatmapCells { get; } = [];

	/// <summary>
	/// Event raised when user wants to navigate to a specific offset.
	/// </summary>
	public event Action<int>? NavigateToOffset;

	/// <summary>
	/// File type filter for CDL files.
	/// </summary>
	public static FilePickerFileType CdlFiles { get; } = new("CDL Files") {
		Patterns = ["*.cdl", "*.mcdl"]
	};

	public CdlViewerViewModel() : this(new FileDialogService()) { }

	public CdlViewerViewModel(IFileDialogService fileDialogService) {
		_fileDialogService = fileDialogService;
	}

	/// <summary>
	/// Opens a file dialog to load a CDL file.
	/// </summary>
	[RelayCommand]
	public async Task LoadCdlFile() {
		var path = await _fileDialogService.OpenFileAsync("Open CDL File", CdlFiles);
		if (!string.IsNullOrEmpty(path)) {
			LoadFromFile(path);
		}
	}

	/// <summary>
	/// Loads a CDL file from the specified path.
	/// </summary>
	public void LoadFromFile(string path) {
		try {
			_cdlHeatmap = CdlHeatmap.FromFile(path);
			CdlFilePath = path;
			FormatName = _cdlHeatmap.Format.ToString();
			HasCdlLoaded = true;

			UpdateStatistics();
			UpdateBankCoverage();
			UpdateRegions();
			UpdateHeatmap();

			StatusText = $"Loaded: {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
			HasCdlLoaded = false;
		}
	}

	/// <summary>
	/// Loads CDL data directly from a byte array.
	/// </summary>
	public void LoadFromData(byte[] data, CdlHeatmap.CdlFormat format = CdlHeatmap.CdlFormat.Generic) {
		_cdlHeatmap = new CdlHeatmap(data, format);
		CdlFilePath = "(loaded from data)";
		FormatName = format.ToString();
		HasCdlLoaded = true;

		UpdateStatistics();
		UpdateBankCoverage();
		UpdateRegions();
		UpdateHeatmap();

		StatusText = $"Loaded {data.Length:N0} bytes";
	}

	private void UpdateStatistics() {
		if (_cdlHeatmap is null) return;

		var stats = _cdlHeatmap.GetCoverageStats();
		TotalBytes = stats.TotalBytes;
		CodeBytes = stats.CodeBytes;
		DataBytes = stats.DataBytes;
		UnknownBytes = stats.UnknownBytes;
		CodePercentage = stats.CodePercentage;
		DataPercentage = stats.DataPercentage;
		CoveragePercentage = stats.CoveragePercentage;
	}

	private void UpdateBankCoverage() {
		if (_cdlHeatmap is null) return;

		Banks.Clear();
		var banks = _cdlHeatmap.GetBankCoverage(BankSize);

		foreach (var bank in banks) {
			Banks.Add(new BankCoverageInfo(
				bank.BankIndex,
				bank.StartOffset,
				bank.EndOffset,
				bank.Stats.CodePercentage,
				bank.Stats.DataPercentage,
				bank.Stats.CoveragePercentage
			));
		}
	}

	private void UpdateRegions() {
		if (_cdlHeatmap is null) return;

		CoveredRegions.Clear();
		UncoveredRegions.Clear();

		var covered = _cdlHeatmap.FindCoveredRegions(16);
		var uncovered = _cdlHeatmap.FindUncoveredRegions(16);

		foreach (var (offset, length, isCode) in covered.Take(500)) {
			CoveredRegions.Add(new CdlRegionInfo(offset, length, isCode ? "Code" : "Data"));
		}

		foreach (var (offset, length) in uncovered.Take(500)) {
			UncoveredRegions.Add(new CdlRegionInfo(offset, length, "Unknown"));
		}
	}

	private void UpdateHeatmap() {
		if (_cdlHeatmap is null) return;

		AsciiHeatmap = _cdlHeatmap.GenerateAsciiHeatmap(HeatmapWidth);

		HeatmapCells.Clear();
		var cells = _cdlHeatmap.GenerateHeatmap(256);
		foreach (var cell in cells.Take(1000)) {
			HeatmapCells.Add(new HeatmapCellInfo(
				cell.Offset,
				cell.Size,
				cell.Intensity,
				(cell.Flags & CdlHeatmap.CdlFlags.Code) != 0,
				cell.Flags != CdlHeatmap.CdlFlags.None && (cell.Flags & CdlHeatmap.CdlFlags.Code) == 0
			));
		}
	}

	/// <summary>
	/// Refreshes the display with current settings.
	/// </summary>
	[RelayCommand]
	public void Refresh() {
		if (_cdlHeatmap is null) return;

		UpdateStatistics();
		UpdateBankCoverage();
		UpdateRegions();
		UpdateHeatmap();
	}

	/// <summary>
	/// Exports the CDL data to a CSV file.
	/// </summary>
	[RelayCommand]
	public async Task ExportToCsv() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Export to CSV", ".csv", "coverage.csv", FileDialogService.CsvFiles);
		if (!string.IsNullOrEmpty(path)) {
			var csv = _cdlHeatmap.ExportAsCsv();
			await File.WriteAllTextAsync(path, csv);
			StatusText = $"Exported to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Exports the CDL data to a JSON file.
	/// </summary>
	[RelayCommand]
	public async Task ExportToJson() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Export to JSON", ".json", "coverage.json", FileDialogService.JsonFiles);
		if (!string.IsNullOrEmpty(path)) {
			var json = _cdlHeatmap.ExportAsJson();
			await File.WriteAllTextAsync(path, json);
			StatusText = $"Exported to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Generates a text report.
	/// </summary>
	[RelayCommand]
	public async Task GenerateReport() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Save Report", ".txt", "cdl_report.txt", FileDialogService.TextFiles);
		if (!string.IsNullOrEmpty(path)) {
			var report = _cdlHeatmap.GenerateReport(BankSize);
			await File.WriteAllTextAsync(path, report);
			StatusText = $"Report saved to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Navigates to a region's offset in the hex editor.
	/// </summary>
	[RelayCommand]
	public void GoToOffset(int offset) {
		NavigateToOffset?.Invoke(offset);
	}

	partial void OnBankSizeChanged(int value) {
		if (_cdlHeatmap is not null) {
			UpdateBankCoverage();
		}
	}

	partial void OnHeatmapWidthChanged(int value) {
		if (_cdlHeatmap is not null) {
			AsciiHeatmap = _cdlHeatmap.GenerateAsciiHeatmap(value);
		}
	}
}

/// <summary>
/// Bank coverage display information.
/// </summary>
public record BankCoverageInfo(
	int BankIndex,
	int StartOffset,
	int EndOffset,
	double CodePercentage,
	double DataPercentage,
	double CoveragePercentage
) {
	public string BankLabel => $"Bank ${BankIndex:X2}";
	public string OffsetRange => $"${StartOffset:X6}-${EndOffset:X6}";
	public string CodeDisplay => $"{CodePercentage:F1}%";
	public string DataDisplay => $"{DataPercentage:F1}%";
	public string CoverageDisplay => $"{CoveragePercentage:F1}%";
}

/// <summary>
/// CDL region display information.
/// </summary>
public record CdlRegionInfo(
	int Offset,
	int Length,
	string Type
) {
	public string OffsetHex => $"${Offset:X6}";
	public string EndOffsetHex => $"${Offset + Length - 1:X6}";
	public string LengthDisplay => $"{Length:N0}";
}

/// <summary>
/// Heatmap cell display information.
/// </summary>
public record HeatmapCellInfo(
	int Offset,
	int Size,
	double Intensity,
	bool HasCode,
	bool HasData
) {
	public string OffsetHex => $"${Offset:X6}";
	public string IntensityDisplay => $"{Intensity:P0}";
	public string Type => HasCode ? "Code" : (HasData ? "Data" : "Unknown");
}
