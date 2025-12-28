using System.Collections.ObjectModel;
using Avalonia.Controls;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Symbols;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for symbol/label management (Mesen labels, etc.)
/// </summary>
public partial class SymbolManagerViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private readonly SymbolManager _symbolManager;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _searchPattern = "";

	[ObservableProperty]
	private SymbolType? _filterType;

	[ObservableProperty]
	private Symbol? _selectedSymbol;

	[ObservableProperty]
	private int _symbolCount;

	[ObservableProperty]
	private int _codeSymbolCount;

	[ObservableProperty]
	private int _dataSymbolCount;

	[ObservableProperty]
	private int _ramSymbolCount;

	// New symbol entry fields
	[ObservableProperty]
	private string _newSymbolName = "";

	[ObservableProperty]
	private int _newSymbolAddress;

	[ObservableProperty]
	private SymbolType _newSymbolType = SymbolType.Code;

	[ObservableProperty]
	private string _newSymbolComment = "";

	public ObservableCollection<Symbol> Symbols { get; } = [];

	public ObservableCollection<Symbol> FilteredSymbols { get; } = [];

	public SymbolType[] AvailableTypes { get; } = Enum.GetValues<SymbolType>();

	public SymbolManagerViewModel() : this(null) { }

	public SymbolManagerViewModel(RomFile? rom) {
		_rom = rom;
		_symbolManager = new SymbolManager();
		HasRomLoaded = rom is not null && rom.IsLoaded;
		UpdateStatistics();
	}

	partial void OnSearchPatternChanged(string value) {
		ApplyFilter();
	}

	partial void OnFilterTypeChanged(SymbolType? value) {
		ApplyFilter();
	}

	private void ApplyFilter() {
		FilteredSymbols.Clear();

		IEnumerable<Symbol> results = _symbolManager.Symbols;

		if (FilterType.HasValue) {
			results = results.Where(s => s.Type == FilterType.Value);
		}

		if (!string.IsNullOrWhiteSpace(SearchPattern)) {
			results = _symbolManager.FindSymbols(SearchPattern);
			if (FilterType.HasValue) {
				results = results.Where(s => s.Type == FilterType.Value);
			}
		}

		foreach (var symbol in results.OrderBy(s => s.Address)) {
			FilteredSymbols.Add(symbol);
		}
	}

	private void UpdateStatistics() {
		var stats = _symbolManager.GetStatistics();
		SymbolCount = stats.TotalCount;
		CodeSymbolCount = stats.CodeCount;
		DataSymbolCount = stats.DataCount;
		RamSymbolCount = stats.RamCount;
	}

	private void RefreshList() {
		Symbols.Clear();
		foreach (var symbol in _symbolManager.Symbols.OrderBy(s => s.Address)) {
			Symbols.Add(symbol);
		}

		ApplyFilter();
		UpdateStatistics();
	}

	[RelayCommand]
	private void AddSymbol() {
		if (string.IsNullOrWhiteSpace(NewSymbolName)) {
			StatusText = "Symbol name is required";
			return;
		}

		var symbol = new Symbol {
			Name = NewSymbolName.Trim(),
			Address = NewSymbolAddress,
			Type = NewSymbolType,
			Comment = string.IsNullOrWhiteSpace(NewSymbolComment) ? null : NewSymbolComment.Trim()
		};

		_symbolManager.AddSymbol(symbol);
		RefreshList();

		// Clear fields
		NewSymbolName = "";
		NewSymbolComment = "";
		StatusText = $"Added symbol: {symbol.Name} at ${symbol.Address:x6}";
	}

	[RelayCommand]
	private void RemoveSymbol() {
		if (SelectedSymbol is null) {
			StatusText = "No symbol selected";
			return;
		}

		var name = SelectedSymbol.Name;
		_symbolManager.RemoveSymbol(SelectedSymbol);
		RefreshList();
		SelectedSymbol = null;
		StatusText = $"Removed symbol: {name}";
	}

	[RelayCommand]
	private void ClearFilter() {
		SearchPattern = "";
		FilterType = null;
		ApplyFilter();
	}

	[RelayCommand]
	private async Task LoadMesenLabels(Window window) {
		var files = await window.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Open Mesen Label File",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("Mesen Labels") { Patterns = ["*.mlb"] },
				new FilePickerFileType("All Files") { Patterns = ["*"] }
			]
		});

		if (files.Count == 0) return;

		var path = files[0].Path.LocalPath;
		_symbolManager.LoadMesenLabels(path);
		RefreshList();
		StatusText = $"Loaded {SymbolCount} symbols from {Path.GetFileName(path)}";
	}

	[RelayCommand]
	private async Task SaveMesenLabels(Window window) {
		var file = await window.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Save Mesen Label File",
			DefaultExtension = ".mlb",
			FileTypeChoices = [
				new FilePickerFileType("Mesen Labels") { Patterns = ["*.mlb"] }
			]
		});

		if (file is null) return;

		var path = file.Path.LocalPath;
		_symbolManager.SaveMesenLabels(path);
		StatusText = $"Saved {SymbolCount} symbols to {Path.GetFileName(path)}";
	}

	[RelayCommand]
	private async Task ImportJson(Window window) {
		var files = await window.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Import Symbols from JSON",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("JSON Files") { Patterns = ["*.json"] },
				new FilePickerFileType("All Files") { Patterns = ["*"] }
			]
		});

		if (files.Count == 0) return;

		var path = files[0].Path.LocalPath;
		var json = await File.ReadAllTextAsync(path);
		_symbolManager.ImportFromJson(json);
		RefreshList();
		StatusText = $"Imported symbols from {Path.GetFileName(path)}";
	}

	[RelayCommand]
	private async Task ExportJson(Window window) {
		var file = await window.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Export Symbols to JSON",
			DefaultExtension = ".json",
			FileTypeChoices = [
				new FilePickerFileType("JSON Files") { Patterns = ["*.json"] }
			]
		});

		if (file is null) return;

		var path = file.Path.LocalPath;
		var json = _symbolManager.ExportToJson();
		await File.WriteAllTextAsync(path, json);
		StatusText = $"Exported {SymbolCount} symbols to {Path.GetFileName(path)}";
	}

	[RelayCommand]
	private void GoToAddress() {
		if (SelectedSymbol is null) return;
		// This would integrate with HexEditorViewModel to navigate
		StatusText = $"Navigate to ${SelectedSymbol.Address:x6}";
	}
}
