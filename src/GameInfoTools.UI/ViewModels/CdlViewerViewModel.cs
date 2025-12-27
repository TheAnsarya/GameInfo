using System.Collections.ObjectModel;
using System.Text;
using Avalonia;
using Avalonia.Input;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Analysis;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for CDL (Code/Data Log) file visualization.
/// </summary>
public partial class CdlViewerViewModel : ViewModelBase, IKeyboardShortcutHandler {
	private readonly IFileDialogService _fileDialogService;
	private CdlHeatmap? _cdlHeatmap;
	private CdlLabelIntegration? _labelIntegration;

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

	[ObservableProperty]
	private string _searchQuery = "";

	[ObservableProperty]
	private int _currentOffset;

	[ObservableProperty]
	private string _bookmarkLabel = "";

	[ObservableProperty]
	private string _bookmarkDescription = "";

	[ObservableProperty]
	private string _selectedSearchType = "Code";

	[ObservableProperty]
	private bool _hasLabelsLoaded;

	[ObservableProperty]
	private string _labelFilePath = "";

	[ObservableProperty]
	private int _totalLabels;

	[ObservableProperty]
	private int _coveredLabels;

	[ObservableProperty]
	private double _labelCoveragePercentage;

	[ObservableProperty]
	private bool _canUndo;

	[ObservableProperty]
	private bool _canRedo;

	[ObservableProperty]
	private string _undoDescription = "";

	[ObservableProperty]
	private string _redoDescription = "";

	/// <summary>
	/// Available search types.
	/// </summary>
	public static string[] SearchTypes => ["Code", "Data", "SubEntry", "IndirectCode", "Boundaries", "All Coverage"];

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
	/// Search results.
	/// </summary>
	public ObservableCollection<SearchResultInfo> SearchResults { get; } = [];

	/// <summary>
	/// Bookmarks.
	/// </summary>
	public ObservableCollection<BookmarkInfo> Bookmarks { get; } = [];

	/// <summary>
	/// Labels with CDL coverage info.
	/// </summary>
	public ObservableCollection<LabelDisplayInfo> Labels { get; } = [];

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
			// Use editable version with undo support
			_cdlHeatmap = CdlHeatmap.FromFileEditable(path, enableUndo: true);
			CdlFilePath = path;
			FormatName = _cdlHeatmap.Format.ToString();
			HasCdlLoaded = true;

			UpdateStatistics();
			UpdateBankCoverage();
			UpdateRegions();
			UpdateHeatmap();
			UpdateUndoRedoState();

			StatusText = $"Loaded: {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
			HasCdlLoaded = false;
		}
	}

	/// <summary>
	/// Loads CDL data directly from a byte array.
	/// </summary>
	public void LoadFromData(byte[] data, CdlHeatmap.CdlFormat format = CdlHeatmap.CdlFormat.Generic, bool enableUndo = true) {
		_cdlHeatmap = new CdlHeatmap(data, format, enableUndo);
		CdlFilePath = "(loaded from data)";
		FormatName = format.ToString();
		HasCdlLoaded = true;

		UpdateStatistics();
		UpdateBankCoverage();
		UpdateRegions();
		UpdateHeatmap();
		UpdateUndoRedoState();

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
	/// Gets the clipboard from the current application's main window.
	/// </summary>
	private static Avalonia.Input.Platform.IClipboard? GetClipboard() {
		if (Application.Current?.ApplicationLifetime is Avalonia.Controls.ApplicationLifetimes.IClassicDesktopStyleApplicationLifetime desktop) {
			return desktop.MainWindow?.Clipboard;
		}

		return null;
	}

	/// <summary>
	/// Copy CDL coverage summary as wikitext.
	/// </summary>
	[RelayCommand]
	public async Task CopyAsWikitext() {
		var clipboard = GetClipboard();
		if (clipboard is null || _cdlHeatmap is null) {
			StatusText = "No CDL data to copy";
			return;
		}

		var sb = new StringBuilder();
		sb.AppendLine("== CDL Coverage Analysis ==");
		sb.AppendLine();
		sb.AppendLine("{| class=\"wikitable\" border=\"1\"");
		sb.AppendLine("|-");
		sb.AppendLine("! Metric !! Value !! Percentage");
		sb.AppendLine("|-");
		sb.AppendLine($"| Total Bytes || {TotalBytes:N0} ||  ");
		sb.AppendLine("|-");
		sb.AppendLine($"| Code Bytes || {CodeBytes:N0} || {CodePercentage:F1}%");
		sb.AppendLine("|-");
		sb.AppendLine($"| Data Bytes || {DataBytes:N0} || {DataPercentage:F1}%");
		sb.AppendLine("|-");
		sb.AppendLine($"| Unknown Bytes || {UnknownBytes:N0} || {(TotalBytes > 0 ? UnknownBytes * 100.0 / TotalBytes : 0):F1}%");
		sb.AppendLine("|-");
		sb.AppendLine($"| Coverage || || {CoveragePercentage:F1}%");
		sb.AppendLine("|}");

		// Add region summary if available
		if (CoveredRegions.Count > 0) {
			sb.AppendLine();
			sb.AppendLine("=== Covered Regions ===");
			sb.AppendLine("{| class=\"wikitable\" border=\"1\"");
			sb.AppendLine("|-");
			sb.AppendLine("! Start !! End !! Size !! Type");

			foreach (var region in CoveredRegions.Take(50)) { // Limit to first 50
				sb.AppendLine("|-");
				sb.AppendLine($"| {{{{$|{region.Offset:x6}}}}} || {{{{$|{region.Offset + region.Length - 1:x6}}}}} || {region.Length} || {region.Type}");
			}

			if (CoveredRegions.Count > 50) {
				sb.AppendLine("|-");
				sb.AppendLine($"| colspan=\"4\" | ''... and {CoveredRegions.Count - 50} more regions''");
			}

			sb.AppendLine("|}");
		}

		await clipboard.SetTextAsync(sb.ToString());
		StatusText = "Copied CDL coverage as wikitext";
	}

	/// <summary>
	/// Navigates to a region's offset in the hex editor.
	/// </summary>
	[RelayCommand]
	public void GoToOffset(int offset) {
		NavigateToOffset?.Invoke(offset);
	}

	#region Search Commands

	/// <summary>
	/// Executes a search based on the selected search type.
	/// </summary>
	[RelayCommand]
	public void ExecuteSearch() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		SearchResults.Clear();
		List<CdlHeatmap.SearchResult> results = SelectedSearchType switch {
			"Code" => _cdlHeatmap.SearchByFlags(CdlHeatmap.CdlFlags.Code),
			"Data" => _cdlHeatmap.SearchByFlags(CdlHeatmap.CdlFlags.Data),
			"SubEntry" => _cdlHeatmap.FindSubEntryPoints(),
			"IndirectCode" => _cdlHeatmap.FindIndirectCode(),
			"Boundaries" => _cdlHeatmap.FindCoverageBoundaries(),
			"All Coverage" => _cdlHeatmap.SearchByFlags(CdlHeatmap.CdlFlags.Code | CdlHeatmap.CdlFlags.Data, matchAll: false),
			_ => []
		};

		foreach (var result in results.Take(500)) {
			SearchResults.Add(new SearchResultInfo(result.Offset, result.Type, result.Flags.ToString()));
		}

		StatusText = $"Found {results.Count} matches for '{SelectedSearchType}'";
	}

	/// <summary>
	/// Navigates to the next occurrence of the selected search type.
	/// </summary>
	[RelayCommand]
	public void FindNext() {
		if (_cdlHeatmap is null) return;

		var flags = SelectedSearchType switch {
			"Code" => CdlHeatmap.CdlFlags.Code,
			"Data" => CdlHeatmap.CdlFlags.Data,
			"SubEntry" => CdlHeatmap.CdlFlags.SubEntryPoint,
			"IndirectCode" => CdlHeatmap.CdlFlags.IndirectCode,
			_ => CdlHeatmap.CdlFlags.Code | CdlHeatmap.CdlFlags.Data
		};

		int nextOffset = _cdlHeatmap.FindNext(CurrentOffset, flags);
		if (nextOffset >= 0) {
			CurrentOffset = nextOffset;
			NavigateToOffset?.Invoke(nextOffset);
			StatusText = $"Found at ${nextOffset:X6}";
		} else {
			StatusText = "No more matches found";
		}
	}

	/// <summary>
	/// Navigates to the previous occurrence of the selected search type.
	/// </summary>
	[RelayCommand]
	public void FindPrevious() {
		if (_cdlHeatmap is null) return;

		var flags = SelectedSearchType switch {
			"Code" => CdlHeatmap.CdlFlags.Code,
			"Data" => CdlHeatmap.CdlFlags.Data,
			"SubEntry" => CdlHeatmap.CdlFlags.SubEntryPoint,
			"IndirectCode" => CdlHeatmap.CdlFlags.IndirectCode,
			_ => CdlHeatmap.CdlFlags.Code | CdlHeatmap.CdlFlags.Data
		};

		int prevOffset = _cdlHeatmap.FindNext(CurrentOffset, flags, searchBackward: true);
		if (prevOffset >= 0) {
			CurrentOffset = prevOffset;
			NavigateToOffset?.Invoke(prevOffset);
			StatusText = $"Found at ${prevOffset:X6}";
		} else {
			StatusText = "No more matches found";
		}
	}

	/// <summary>
	/// Navigates to a search result.
	/// </summary>
	[RelayCommand]
	public void GoToSearchResult(SearchResultInfo result) {
		CurrentOffset = result.Offset;
		NavigateToOffset?.Invoke(result.Offset);
	}

	#endregion

	#region Bookmark Commands

	/// <summary>
	/// Adds a bookmark at the current offset.
	/// </summary>
	[RelayCommand]
	public void AddBookmark() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		if (string.IsNullOrWhiteSpace(BookmarkLabel)) {
			BookmarkLabel = $"bookmark_{CurrentOffset:X6}";
		}

		try {
			_cdlHeatmap.AddBookmark(CurrentOffset, BookmarkLabel, BookmarkDescription);
			UpdateBookmarks();
			StatusText = $"Bookmark added at ${CurrentOffset:X6}";
			BookmarkLabel = "";
			BookmarkDescription = "";
		} catch (ArgumentOutOfRangeException) {
			StatusText = "Invalid offset for bookmark";
		}
	}

	/// <summary>
	/// Removes a bookmark.
	/// </summary>
	[RelayCommand]
	public void RemoveBookmark(BookmarkInfo bookmark) {
		if (_cdlHeatmap is null) return;

		if (_cdlHeatmap.RemoveBookmark(bookmark.Offset)) {
			UpdateBookmarks();
			StatusText = $"Bookmark removed from ${bookmark.Offset:X6}";
		}
	}

	/// <summary>
	/// Navigates to a bookmark.
	/// </summary>
	[RelayCommand]
	public void GoToBookmark(BookmarkInfo bookmark) {
		CurrentOffset = bookmark.Offset;
		NavigateToOffset?.Invoke(bookmark.Offset);
	}

	/// <summary>
	/// Navigates to the next bookmark.
	/// </summary>
	[RelayCommand]
	public void NextBookmark() {
		if (_cdlHeatmap is null) return;

		var next = _cdlHeatmap.GetNextBookmark(CurrentOffset);
		if (next is not null) {
			CurrentOffset = next.Offset;
			NavigateToOffset?.Invoke(next.Offset);
			StatusText = $"Bookmark: {next.Label}";
		} else {
			StatusText = "No more bookmarks";
		}
	}

	/// <summary>
	/// Navigates to the previous bookmark.
	/// </summary>
	[RelayCommand]
	public void PreviousBookmark() {
		if (_cdlHeatmap is null) return;

		var prev = _cdlHeatmap.GetPreviousBookmark(CurrentOffset);
		if (prev is not null) {
			CurrentOffset = prev.Offset;
			NavigateToOffset?.Invoke(prev.Offset);
			StatusText = $"Bookmark: {prev.Label}";
		} else {
			StatusText = "No more bookmarks";
		}
	}

	/// <summary>
	/// Auto-generates bookmarks for interesting locations.
	/// </summary>
	[RelayCommand]
	public void AutoGenerateBookmarks() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		_cdlHeatmap.AutoGenerateBookmarks(includeSubEntryPoints: true, includeCoverageBoundaries: true);
		UpdateBookmarks();
		StatusText = $"Generated {_cdlHeatmap.Bookmarks.Count} bookmarks";
	}

	/// <summary>
	/// Clears all bookmarks.
	/// </summary>
	[RelayCommand]
	public void ClearBookmarks() {
		if (_cdlHeatmap is null) return;

		_cdlHeatmap.ClearBookmarks();
		UpdateBookmarks();
		StatusText = "Bookmarks cleared";
	}

	/// <summary>
	/// Exports bookmarks to a file.
	/// </summary>
	[RelayCommand]
	public async Task ExportBookmarks() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Export Bookmarks", ".txt", "bookmarks.txt", FileDialogService.TextFiles);
		if (!string.IsNullOrEmpty(path)) {
			var content = _cdlHeatmap.ExportBookmarks();
			await File.WriteAllTextAsync(path, content);
			StatusText = $"Bookmarks exported to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Imports bookmarks from a file.
	/// </summary>
	[RelayCommand]
	public async Task ImportBookmarks() {
		if (_cdlHeatmap is null) {
			StatusText = "No CDL loaded";
			return;
		}

		var path = await _fileDialogService.OpenFileAsync("Import Bookmarks", FileDialogService.TextFiles);
		if (!string.IsNullOrEmpty(path)) {
			var content = await File.ReadAllTextAsync(path);
			_cdlHeatmap.ImportBookmarks(content);
			UpdateBookmarks();
			StatusText = $"Imported {_cdlHeatmap.Bookmarks.Count} bookmarks";
		}
	}

	private void UpdateBookmarks() {
		Bookmarks.Clear();
		if (_cdlHeatmap is null) return;

		foreach (var bookmark in _cdlHeatmap.Bookmarks) {
			Bookmarks.Add(new BookmarkInfo(
				bookmark.Offset,
				bookmark.Label,
				bookmark.Description,
				bookmark.Category
			));
		}
	}

	#endregion

	#region Label Commands

	/// <summary>
	/// File type filter for label files.
	/// </summary>
	public static FilePickerFileType LabelFiles { get; } = new("Label Files") {
		Patterns = ["*.mlb", "*.nl", "*.lbl", "*.sym", "*.txt"]
	};

	/// <summary>
	/// Loads a label file.
	/// </summary>
	[RelayCommand]
	public async Task LoadLabelFile() {
		if (_cdlHeatmap is null) {
			StatusText = "Load a CDL file first";
			return;
		}

		var path = await _fileDialogService.OpenFileAsync("Open Label File", LabelFiles);
		if (!string.IsNullOrEmpty(path)) {
			LoadLabelsFromFile(path);
		}
	}

	/// <summary>
	/// Loads labels from a specific file path.
	/// </summary>
	public void LoadLabelsFromFile(string path) {
		if (_cdlHeatmap is null) return;

		try {
			_labelIntegration = new CdlLabelIntegration(_cdlHeatmap);
			_labelIntegration.LoadAuto(path);

			LabelFilePath = path;
			HasLabelsLoaded = true;
			UpdateLabelStatistics();
			UpdateLabels();

			StatusText = $"Loaded labels from {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Error loading labels: {ex.Message}";
			HasLabelsLoaded = false;
		}
	}

	/// <summary>
	/// Exports labels to Mesen MLB format.
	/// </summary>
	[RelayCommand]
	public async Task ExportLabelsToMlb() {
		if (_labelIntegration is null || !HasLabelsLoaded) {
			StatusText = "No labels loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Export Labels (Mesen)", ".mlb", "labels.mlb", LabelFiles);
		if (!string.IsNullOrEmpty(path)) {
			var content = _labelIntegration.ExportToMlb();
			await File.WriteAllTextAsync(path, content);
			StatusText = $"Labels exported to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Exports labels to FCEUX NL format.
	/// </summary>
	[RelayCommand]
	public async Task ExportLabelsToNl() {
		if (_labelIntegration is null || !HasLabelsLoaded) {
			StatusText = "No labels loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Export Labels (FCEUX)", ".nl", "labels.nl", LabelFiles);
		if (!string.IsNullOrEmpty(path)) {
			var content = _labelIntegration.ExportToFceuxNl();
			await File.WriteAllTextAsync(path, content);
			StatusText = $"Labels exported to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Gets the label at a specific offset.
	/// </summary>
	public string? GetLabelAtOffset(int offset) {
		return _labelIntegration?.GetLabelAtOffset(offset);
	}

	/// <summary>
	/// Gets labels in a range.
	/// </summary>
	public List<CdlLabelIntegration.LabelWithCoverage> GetLabelsInRange(int startOffset, int endOffset) {
		return _labelIntegration?.GetLabelsInRange(startOffset, endOffset) ?? [];
	}

	/// <summary>
	/// Filters labels by coverage type.
	/// </summary>
	[RelayCommand]
	public void FilterLabelsByCode() {
		UpdateLabels(isCode: true);
	}

	[RelayCommand]
	public void FilterLabelsByData() {
		UpdateLabels(isData: true);
	}

	[RelayCommand]
	public void FilterLabelsByUncovered() {
		UpdateLabels(isCovered: false);
	}

	[RelayCommand]
	public void ShowAllLabels() {
		UpdateLabels();
	}

	private void UpdateLabelStatistics() {
		if (_labelIntegration is null) return;

		var summary = _labelIntegration.GetCoverageSummary();
		TotalLabels = summary.TotalLabels;
		CoveredLabels = summary.CoveredLabels;
		LabelCoveragePercentage = summary.CoveredPercentage;
	}

	private void UpdateLabels(bool? isCode = null, bool? isData = null, bool? isCovered = null) {
		Labels.Clear();
		if (_labelIntegration is null) return;

		var labels = _labelIntegration.GetLabelsByCoverage(isCode, isData, isCovered);
		foreach (var label in labels) {
			Labels.Add(new LabelDisplayInfo(
				label.Address,
				label.Name,
				label.Type.ToString(),
				label.CoverageStatus,
				label.Comment ?? "",
				label.IsCode,
				label.IsData
			));
		}
	}

	#endregion

	#region CDL Comparison

	private CdlComparison? _comparison;
	private CdlHeatmap? _comparisonCdl;

	[ObservableProperty]
	private bool _hasComparisonLoaded;

	[ObservableProperty]
	private string _comparisonFilePath = "";

	[ObservableProperty]
	private int _diffCount;

	[ObservableProperty]
	private double _similarityPercentage;

	[ObservableProperty]
	private int _leftOnlyCount;

	[ObservableProperty]
	private int _rightOnlyCount;

	[ObservableProperty]
	private int _flagsDifferCount;

	[ObservableProperty]
	private string _selectedDiffFilter = "All";

	/// <summary>
	/// Available diff type filters.
	/// </summary>
	public static string[] DiffFilters => ["All", "Left Only", "Right Only", "Flags Differ"];

	/// <summary>
	/// Comparison differences.
	/// </summary>
	public ObservableCollection<ComparisonDiffInfo> ComparisonDiffs { get; } = [];

	/// <summary>
	/// Comparison diff regions.
	/// </summary>
	public ObservableCollection<ComparisonRegionInfo> ComparisonRegions { get; } = [];

	/// <summary>
	/// Loads a second CDL file for comparison.
	/// </summary>
	[RelayCommand]
	public async Task LoadComparisonFile() {
		if (_cdlHeatmap is null) {
			StatusText = "Load a CDL file first";
			return;
		}

		var path = await _fileDialogService.OpenFileAsync("Open CDL for Comparison", CdlFiles);
		if (!string.IsNullOrEmpty(path)) {
			LoadComparisonFromFile(path);
		}
	}

	/// <summary>
	/// Loads comparison CDL from a specific file.
	/// </summary>
	public void LoadComparisonFromFile(string path) {
		if (_cdlHeatmap is null) return;

		try {
			_comparisonCdl = CdlHeatmap.FromFile(path);
			_comparison = new CdlComparison(_cdlHeatmap, _comparisonCdl);

			ComparisonFilePath = path;
			HasComparisonLoaded = true;
			UpdateComparisonStatistics();
			UpdateComparisonDiffs();

			StatusText = $"Comparison loaded: {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Error loading comparison: {ex.Message}";
			HasComparisonLoaded = false;
		}
	}

	/// <summary>
	/// Clears the comparison CDL.
	/// </summary>
	[RelayCommand]
	public void ClearComparison() {
		_comparison = null;
		_comparisonCdl = null;
		HasComparisonLoaded = false;
		ComparisonFilePath = "";
		ComparisonDiffs.Clear();
		ComparisonRegions.Clear();
		DiffCount = 0;
		SimilarityPercentage = 0;
		LeftOnlyCount = 0;
		RightOnlyCount = 0;
		FlagsDifferCount = 0;
		StatusText = "Comparison cleared";
	}

	/// <summary>
	/// Creates a merged CDL from the comparison.
	/// </summary>
	[RelayCommand]
	public async Task ExportMergedCdl() {
		if (_comparison is null) {
			StatusText = "No comparison loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Export Merged CDL", ".cdl", "merged.cdl", CdlFiles);
		if (!string.IsNullOrEmpty(path)) {
			var merged = _comparison.CreateMerged();
			merged.SaveToFile(path);
			StatusText = $"Merged CDL saved to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Creates a CDL with only intersecting coverage.
	/// </summary>
	[RelayCommand]
	public async Task ExportIntersectionCdl() {
		if (_comparison is null) {
			StatusText = "No comparison loaded";
			return;
		}

		var path = await _fileDialogService.SaveFileAsync("Export Intersection CDL", ".cdl", "intersection.cdl", CdlFiles);
		if (!string.IsNullOrEmpty(path)) {
			var intersection = _comparison.CreateIntersection();
			intersection.SaveToFile(path);
			StatusText = $"Intersection CDL saved to {Path.GetFileName(path)}";
		}
	}

	/// <summary>
	/// Navigates to the next difference.
	/// </summary>
	[RelayCommand]
	public void NextDifference() {
		if (_comparison is null) return;

		var next = _comparison.FindNextDifference(CurrentOffset);
		if (next.HasValue) {
			CurrentOffset = next.Value;
			NavigateToOffset?.Invoke(next.Value);
			StatusText = $"Navigated to difference at ${next.Value:X6}";
		} else {
			StatusText = "No more differences found";
		}
	}

	/// <summary>
	/// Navigates to the previous difference.
	/// </summary>
	[RelayCommand]
	public void PreviousDifference() {
		if (_comparison is null) return;

		var prev = _comparison.FindPreviousDifference(CurrentOffset);
		if (prev.HasValue) {
			CurrentOffset = prev.Value;
			NavigateToOffset?.Invoke(prev.Value);
			StatusText = $"Navigated to difference at ${prev.Value:X6}";
		} else {
			StatusText = "No more differences found";
		}
	}

	/// <summary>
	/// Filters comparison diffs by type.
	/// </summary>
	[RelayCommand]
	public void FilterDiffs() {
		UpdateComparisonDiffs();
	}

	/// <summary>
	/// Gets the comparison entry at a specific offset.
	/// </summary>
	public CdlComparison.DiffEntry? GetComparisonEntryAt(int offset) {
		return _comparison?.GetEntryAt(offset);
	}

	private void UpdateComparisonStatistics() {
		if (_comparison is null) return;

		var summary = _comparison.GetSummary();
		DiffCount = summary.LeftOnlyBytes + summary.RightOnlyBytes + summary.FlagsDifferBytes;
		SimilarityPercentage = summary.SimilarityPercentage;
		LeftOnlyCount = summary.LeftOnlyBytes;
		RightOnlyCount = summary.RightOnlyBytes;
		FlagsDifferCount = summary.FlagsDifferBytes;
	}

	private void UpdateComparisonDiffs() {
		ComparisonDiffs.Clear();
		ComparisonRegions.Clear();
		if (_comparison is null) return;

		// Get diffs based on filter
		var diffs = SelectedDiffFilter switch {
			"Left Only" => _comparison.GetDifferencesByType(CdlComparison.DiffType.LeftOnly),
			"Right Only" => _comparison.GetDifferencesByType(CdlComparison.DiffType.RightOnly),
			"Flags Differ" => _comparison.GetDifferencesByType(CdlComparison.DiffType.FlagsDiffer),
			_ => _comparison.GetAllDifferences()
		};

		// Limit to first 1000 for UI performance
		foreach (var diff in diffs.Take(1000)) {
			ComparisonDiffs.Add(new ComparisonDiffInfo(
				diff.Offset,
				diff.LeftFlagsString,
				diff.RightFlagsString,
				diff.Type.ToString()
			));
		}

		// Get diff regions
		var regions = _comparison.GetDiffRegions(mergeGap: 16);
		foreach (var region in regions.Take(500)) {
			ComparisonRegions.Add(new ComparisonRegionInfo(
				region.StartOffset,
				region.EndOffset,
				region.PrimaryType.ToString(),
				region.Count
			));
		}
	}

	#endregion

	#region Undo/Redo

	/// <summary>
	/// Performs an undo operation.
	/// </summary>
	[RelayCommand]
	public void PerformUndo() {
		if (_cdlHeatmap is null || !CanUndo) return;

		var description = _cdlHeatmap.Undo();
		if (description is not null) {
			UpdateUndoRedoState();
			UpdateStatistics();
			UpdateHeatmap();
			StatusText = $"Undo: {description}";
		}
	}

	/// <summary>
	/// Performs a redo operation.
	/// </summary>
	[RelayCommand]
	public void PerformRedo() {
		if (_cdlHeatmap is null || !CanRedo) return;

		var description = _cdlHeatmap.Redo();
		if (description is not null) {
			UpdateUndoRedoState();
			UpdateStatistics();
			UpdateHeatmap();
			StatusText = $"Redo: {description}";
		}
	}

	/// <summary>
	/// Marks the current offset as code.
	/// </summary>
	[RelayCommand]
	public void MarkAsCode() {
		if (_cdlHeatmap is null) return;
		_cdlHeatmap.MarkAsCode(CurrentOffset);
		UpdateUndoRedoState();
		UpdateStatistics();
		UpdateHeatmap();
		StatusText = $"Marked ${CurrentOffset:X6} as code";
	}

	/// <summary>
	/// Marks the current offset as data.
	/// </summary>
	[RelayCommand]
	public void MarkAsData() {
		if (_cdlHeatmap is null) return;
		_cdlHeatmap.MarkAsData(CurrentOffset);
		UpdateUndoRedoState();
		UpdateStatistics();
		UpdateHeatmap();
		StatusText = $"Marked ${CurrentOffset:X6} as data";
	}

	/// <summary>
	/// Clears coverage at the current offset.
	/// </summary>
	[RelayCommand]
	public void ClearOffset() {
		if (_cdlHeatmap is null) return;
		_cdlHeatmap.ClearOffset(CurrentOffset);
		UpdateUndoRedoState();
		UpdateStatistics();
		UpdateHeatmap();
		StatusText = $"Cleared ${CurrentOffset:X6}";
	}

	/// <summary>
	/// Sets flags at current offset.
	/// </summary>
	public void SetFlagsAt(int offset, CdlHeatmap.CdlFlags flags) {
		if (_cdlHeatmap is null) return;
		_cdlHeatmap.SetFlags(offset, flags);
		UpdateUndoRedoState();
		UpdateStatistics();
		UpdateHeatmap();
	}

	/// <summary>
	/// Sets flags for a range.
	/// </summary>
	public void SetFlagsRange(int startOffset, int length, CdlHeatmap.CdlFlags flags) {
		if (_cdlHeatmap is null) return;
		_cdlHeatmap.SetFlagsRange(startOffset, length, flags);
		UpdateUndoRedoState();
		UpdateStatistics();
		UpdateHeatmap();
	}

	/// <summary>
	/// Clears the undo history.
	/// </summary>
	[RelayCommand]
	public void ClearUndoHistory() {
		_cdlHeatmap?.ClearUndoHistory();
		UpdateUndoRedoState();
		StatusText = "Undo history cleared";
	}

	private void UpdateUndoRedoState() {
		CanUndo = _cdlHeatmap?.CanUndo ?? false;
		CanRedo = _cdlHeatmap?.CanRedo ?? false;
		UndoDescription = _cdlHeatmap?.GetUndoDescription() ?? "";
		RedoDescription = _cdlHeatmap?.GetRedoDescription() ?? "";
	}

	#endregion

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

	#region IKeyboardShortcutHandler

	/// <summary>
	/// Handle keyboard shortcuts for the CDL viewer.
	/// </summary>
	public bool HandleKeyDown(KeyEventArgs e) {
		// Undo (Ctrl+Z)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Undo)) {
			if (CanUndo) {
				PerformUndo();
				e.Handled = true;
				return true;
			}
		}

		// Redo (Ctrl+Y or Ctrl+Shift+Z)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Redo) ||
			KeyboardShortcuts.Matches(e, KeyboardShortcuts.RedoAlt)) {
			if (CanRedo) {
				PerformRedo();
				e.Handled = true;
				return true;
			}
		}

		// Find (Ctrl+F)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Find)) {
			// Execute search to show results
			ExecuteSearch();
			e.Handled = true;
			return true;
		}

		// Find next (F3)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindNext)) {
			FindNext();
			e.Handled = true;
			return true;
		}

		// Find previous (Shift+F3)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.FindPrevious)) {
			FindPrevious();
			e.Handled = true;
			return true;
		}

		// Go to offset (Ctrl+G)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.GoTo)) {
			StatusText = "Go to offset - enter address in search box";
			e.Handled = true;
			return true;
		}

		// Mark as Code (C) - no modifier
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.MarkAsCode)) {
			if (HasCdlLoaded) {
				MarkAsCode();
				e.Handled = true;
				return true;
			}
		}

		// Mark as Data (D) - no modifier
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.MarkAsData)) {
			if (HasCdlLoaded) {
				MarkAsData();
				e.Handled = true;
				return true;
			}
		}

		// Clear Flags (X) - no modifier
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.ClearFlags)) {
			if (HasCdlLoaded) {
				ClearOffset();
				e.Handled = true;
				return true;
			}
		}

		// Next Bank (])
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.CdlNextBank)) {
			if (SelectedBankIndex < Banks.Count - 1) {
				SelectedBankIndex++;
				e.Handled = true;
				return true;
			}
		}

		// Previous Bank ([)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.CdlPreviousBank)) {
			if (SelectedBankIndex > 0) {
				SelectedBankIndex--;
				e.Handled = true;
				return true;
			}
		}

		// Add Bookmark (Ctrl+B)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.AddCdlBookmark)) {
			if (HasCdlLoaded) {
				AddBookmark();
				e.Handled = true;
				return true;
			}
		}

		// Refresh (F5)
		if (KeyboardShortcuts.Matches(e, KeyboardShortcuts.Refresh)) {
			if (HasCdlLoaded) {
				Refresh();
				e.Handled = true;
				return true;
			}
		}

		return false;
	}

	#endregion
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

/// <summary>
/// Search result display information.
/// </summary>
public record SearchResultInfo(
	int Offset,
	string Type,
	string Flags
) {
	public string OffsetHex => $"${Offset:X6}";
}

/// <summary>
/// Bookmark display information.
/// </summary>
public record BookmarkInfo(
	int Offset,
	string Label,
	string? Description,
	string? Category
) {
	public string OffsetHex => $"${Offset:X6}";
	public string DisplayName => string.IsNullOrEmpty(Description) ? Label : $"{Label} - {Description}";
}

/// <summary>
/// Label display information with CDL coverage.
/// </summary>
public record LabelDisplayInfo(
	int Address,
	string Name,
	string Type,
	string CoverageStatus,
	string Comment,
	bool IsCode,
	bool IsData
) {
	public string AddressHex => $"${Address:X4}";
	public string DisplayName => string.IsNullOrEmpty(Comment) ? Name : $"{Name} - {Comment}";
}

/// <summary>
/// CDL comparison difference display information.
/// </summary>
public record ComparisonDiffInfo(
	int Offset,
	string LeftFlags,
	string RightFlags,
	string DiffType
) {
	public string OffsetHex => $"${Offset:X6}";
}

/// <summary>
/// CDL comparison region display information.
/// </summary>
public record ComparisonRegionInfo(
	int StartOffset,
	int EndOffset,
	string Type,
	int Count
) {
	public string StartHex => $"${StartOffset:X6}";
	public string EndHex => $"${EndOffset:X6}";
	public int Length => EndOffset - StartOffset;
	public string LengthDisplay => $"{Length:N0}";
}
