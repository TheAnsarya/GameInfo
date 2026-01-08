using System.Collections.ObjectModel;
using Avalonia.Controls;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Core.Project;
using GameInfoTools.UI.Views;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Main window view model for the GameInfo Tools application.
/// </summary>
public partial class MainWindowViewModel : ViewModelBase {
	private readonly IProjectService _projectService;
	private readonly IAssetExtractorRegistry _extractorRegistry;
	private RomFile? _loadedRom;

	[ObservableProperty]
	private string _statusText = "Ready";

	[ObservableProperty]
	private string _romInfo = "No ROM loaded";

	[ObservableProperty]
	private int _currentOffset;

	[ObservableProperty]
	private string _romSize = "";

	[ObservableProperty]
	private ToolCategory? _selectedCategory;

	[ObservableProperty]
	private object? _currentView;

	public ObservableCollection<ToolCategory> ToolCategories { get; } = [
		new ToolCategory("�", "Project", "project"),
		new ToolCategory("�📁", "ROM Info", "rominfo"),
		new ToolCategory("🔢", "Checksum", "checksum"),
		new ToolCategory("📝", "Text Extractor", "text"),
		new ToolCategory("🎨", "CHR Editor", "chr"),
		new ToolCategory("⚙️", "Disassembler", "disasm"),
		new ToolCategory("📊", "Data Tables", "data"),
		new ToolCategory("🔍", "Pointer Scanner", "pointers"),
		new ToolCategory("💾", "Hex Editor", "hex"),
		new ToolCategory("🗂️", "Bank View", "banks"),
		new ToolCategory("🗺️", "Map Editor", "maps"),
		new ToolCategory("📜", "Script Editor", "scripts"),
		new ToolCategory("🔥", "CDL Viewer", "cdl"),
		new ToolCategory("🔨", "Build Pipeline", "build"),
		new ToolCategory("📖", "Wiki Editor", "wiki"),
		new ToolCategory("🌐", "Data Crystal", "datacrystal"),
		new ToolCategory("🏷️", "Symbol Manager", "symbols"),
		new ToolCategory("📐", "Memory Layout", "memory"),
		new ToolCategory("🎨", "Palette Editor", "palette"),
		new ToolCategory("💽", "Save Editor", "saves"),
		new ToolCategory("🎮", "TAS Converter", "tas"),
	];

	/// <summary>
	/// Creates a new MainWindowViewModel with injected dependencies.
	/// </summary>
	public MainWindowViewModel(IProjectService projectService, IAssetExtractorRegistry extractorRegistry) {
		_projectService = projectService;
		_extractorRegistry = extractorRegistry;
		SelectedCategory = ToolCategories[0];
		CurrentView = new WelcomeViewModel();
	}

	/// <summary>
	/// Design-time constructor. Not for production use.
	/// </summary>
	public MainWindowViewModel() : this(
		App.Services?.GetService(typeof(IProjectService)) as IProjectService
			?? throw new InvalidOperationException("ProjectService not available"),
		App.Services?.GetService(typeof(IAssetExtractorRegistry)) as IAssetExtractorRegistry
			?? throw new InvalidOperationException("ExtractorRegistry not available")
	) { }

	partial void OnSelectedCategoryChanged(ToolCategory? value) {
		if (value is null) return;

		CurrentView = value.Id switch {
			"project" => new WelcomeViewModel(), // TODO: Create ProjectViewModel
			"rominfo" => new RomInfoViewModel(_loadedRom),
			"checksum" => new ChecksumViewModel(_loadedRom),
			"text" => new TextExtractorViewModel(_loadedRom),
			"chr" => new ChrEditorViewModel(_loadedRom),
			"disasm" => new DisassemblerViewModel(_loadedRom),
			"data" => new DataTableViewModel(_loadedRom),
			"pointers" => new PointerScannerViewModel(_loadedRom),
			"hex" => new HexEditorViewModel(_loadedRom),
			"banks" => new BankViewViewModel(_loadedRom),
			"maps" => new MapEditorViewModel(_loadedRom),
			"scripts" => new ScriptEditorViewModel(_loadedRom),
			"cdl" => new CdlViewerViewModel(),
			"build" => new BuildPipelineViewModel(_loadedRom),
			"wiki" => new WikiEditorViewModel(_loadedRom),
			"darkrepos" => new DarkReposViewModel(),
			"symbols" => new SymbolManagerViewModel(_loadedRom),
			"memory" => new MemoryLayoutViewModel(_loadedRom),
			"palette" => new PaletteEditorViewModel(_loadedRom),
			"saves" => new SaveEditorViewModel(),
			"tas" => new TasConverterViewModel(),
			_ => new WelcomeViewModel()
		};
	}

	[RelayCommand]
	private async Task OpenRom(Window window) {
		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Open ROM File",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("ROM Files") { Patterns = ["*.nes", "*.sfc", "*.smc", "*.gb", "*.gbc", "*.gba"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			]
		});

		if (files.Count > 0) {
			var file = files[0];
			await LoadRomFile(file.Path.LocalPath);
		}
	}

	private async Task LoadRomFile(string path) {
		try {
			StatusText = $"Loading {Path.GetFileName(path)}...";
			_loadedRom = new RomFile();
			await _loadedRom.LoadAsync(path);

			var info = _loadedRom.GetInfo();
			RomInfo = $"{info.System} | {info.Title ?? Path.GetFileName(path)}";
			RomSize = $"{_loadedRom.Length:N0} bytes";
			StatusText = $"Loaded: {path}";

			// Refresh current view
			OnSelectedCategoryChanged(SelectedCategory);
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task SaveRom() {
		if (_loadedRom is null || string.IsNullOrEmpty(_loadedRom.FilePath)) return;

		try {
			await _loadedRom.SaveAsync();
			StatusText = "ROM saved successfully";
		} catch (Exception ex) {
			StatusText = $"Save error: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task SaveRomAs(Window window) {
		if (_loadedRom is null) return;

		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		var file = await topLevel.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Save ROM As",
			DefaultExtension = Path.GetExtension(_loadedRom.FilePath),
			SuggestedFileName = Path.GetFileName(_loadedRom.FilePath)
		});

		if (file is not null) {
			try {
				await _loadedRom.SaveAsync(file.Path.LocalPath);
				StatusText = $"Saved: {file.Path.LocalPath}";
			} catch (Exception ex) {
				StatusText = $"Save error: {ex.Message}";
			}
		}
	}

	[RelayCommand]
	private void ShowRomInfo() => SelectedCategory = ToolCategories[1];

	[RelayCommand]
	private void ShowChecksum() => SelectedCategory = ToolCategories[2];

	[RelayCommand]
	private void ShowTextExtractor() => SelectedCategory = ToolCategories[3];

	[RelayCommand]
	private void ShowChrEditor() => SelectedCategory = ToolCategories[4];

	[RelayCommand]
	private void ShowDisassembler() => SelectedCategory = ToolCategories[5];

	[RelayCommand]
	private void ShowDataEditor() => SelectedCategory = ToolCategories[6];

	[RelayCommand]
	private void ShowPointerScanner() => SelectedCategory = ToolCategories[7];

	[RelayCommand]
	private void ShowHexEditor() => SelectedCategory = ToolCategories[8];

	[RelayCommand]
	private void ShowBankView() => SelectedCategory = ToolCategories[9];

	[RelayCommand]
	private void ShowCdlViewer() => SelectedCategory = ToolCategories[12];

	[RelayCommand]
	private void ShowBuildPipeline() => SelectedCategory = ToolCategories[13];

	[RelayCommand]
	private void ShowWikiEditor() => SelectedCategory = ToolCategories[14];

	[RelayCommand]
	private void ShowSymbolManager() => SelectedCategory = ToolCategories[16];

	[RelayCommand]
	private void ShowMemoryLayout() => SelectedCategory = ToolCategories[17];

	[RelayCommand]
	private void ShowPaletteEditor() => SelectedCategory = ToolCategories[18];

	[RelayCommand]
	private void ShowSaveEditor() => SelectedCategory = ToolCategories[19];

	[RelayCommand]
	private void ShowTasConverter() => SelectedCategory = ToolCategories[20];

	[RelayCommand]
	private async Task NewProject(Window window) {
		var wizard = new CreateProjectWizardWindow(_projectService, _extractorRegistry);
		var result = await wizard.ShowDialog<Project?>(window);

		if (result is not null) {
			StatusText = $"Created project: {result.Metadata.Name}";
			OnProjectOpened(result);
		}
	}

	[RelayCommand]
	private async Task OpenProject(Window window) {
		var topLevel = TopLevel.GetTopLevel(window);
		if (topLevel is null) return;

		var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Open Project",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("GameInfo Project") { Patterns = ["*.giproj"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			]
		});

		if (files.Count > 0) {
			var file = files[0];
			try {
				StatusText = $"Opening project: {file.Path.LocalPath}...";
				var project = await _projectService.OpenProjectAsync(file.Path.LocalPath);
				OnProjectOpened(project);
				StatusText = $"Opened: {project.Metadata.Name}";
			} catch (Exception ex) {
				StatusText = $"Error opening project: {ex.Message}";
			}
		}
	}

	private void OnProjectOpened(Core.Project.Project project) {
		// Update title to show project name
		RomInfo = $"Project: {project.Metadata.Name} | {project.Metadata.Game.Platform}";
		RomSize = $"{project.Metadata.ReferenceRom.Size:N0} bytes";

		// TODO: Refresh views with project data
		// TODO: Enable project-specific menu items
	}

	[RelayCommand]
	private void ShowAbout() {
		StatusText = "GameInfo Tools v1.0.0 - Cross-platform ROM hacking suite";
	}

	[RelayCommand]
	private void ShowDocumentation() {
		StatusText = "Opening documentation...";
	}

	[RelayCommand]
	private static void Exit() {
		Environment.Exit(0);
	}
}

/// <summary>
/// Represents a tool category in the navigation panel.
/// </summary>
public record ToolCategory(string Icon, string Name, string Id);
