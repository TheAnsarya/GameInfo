using System;
using System.Threading.Tasks;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Platform.Storage;
using GameInfoTools.Core.Project;
using GameInfoTools.Core.Project.ViewModels;

namespace GameInfoTools.UI.Views;

/// <summary>
/// Window container for the Create Project Wizard.
/// Handles file dialogs and wizard completion events.
/// </summary>
public partial class CreateProjectWizardWindow : Window {
	private readonly CreateProjectWizardViewModel _viewModel;

	/// <summary>
	/// Gets the created project, if the wizard completed successfully.
	/// </summary>
	public Project? CreatedProject { get; private set; }

	/// <summary>
	/// Creates a new wizard window with the specified dependencies.
	/// </summary>
	public CreateProjectWizardWindow(IProjectService projectService, IAssetExtractorRegistry extractorRegistry) {
		InitializeComponent();

		_viewModel = new CreateProjectWizardViewModel(projectService, extractorRegistry);
		DataContext = _viewModel;

		// Wire up events
		_viewModel.BrowseForRomRequested += OnBrowseForRomRequested;
		_viewModel.BrowseForProjectRequested += OnBrowseForProjectRequested;
		_viewModel.ProjectCreated += OnProjectCreated;
		_viewModel.Cancelled += OnCancelled;
	}

	/// <summary>
	/// Required parameterless constructor for XAML preview.
	/// </summary>
	public CreateProjectWizardWindow() : this(
		new DummyProjectService(),
		new DummyExtractorRegistry()
	) {
		// Design-time only
	}

	private async void OnBrowseForRomRequested(object? sender, EventArgs e) {
		var topLevel = GetTopLevel(this);
		if (topLevel is null) return;

		var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Select ROM File",
			AllowMultiple = false,
			FileTypeFilter = GetRomFileFilters()
		});

		if (files.Count > 0) {
			_viewModel.RomPath = files[0].Path.LocalPath;
		}
	}

	private async void OnBrowseForProjectRequested(object? sender, EventArgs e) {
		var topLevel = GetTopLevel(this);
		if (topLevel is null) return;

		var folder = await topLevel.StorageProvider.OpenFolderPickerAsync(new FolderPickerOpenOptions {
			Title = "Select Project Location",
			AllowMultiple = false
		});

		if (folder.Count > 0) {
			_viewModel.ProjectPath = folder[0].Path.LocalPath;
		}
	}

	private void OnProjectCreated(object? sender, Project project) {
		CreatedProject = project;
		Close(project);
	}

	private void OnCancelled(object? sender, EventArgs e) {
		Close(null);
	}

	/// <summary>
	/// Gets file type filters appropriate for the selected game.
	/// </summary>
	private FilePickerFileType[] GetRomFileFilters() {
		var selectedGame = _viewModel.SelectedGame;
		if (selectedGame is null) {
			return [
				new FilePickerFileType("All ROM Files") {
					Patterns = ["*.nes", "*.sfc", "*.smc", "*.gb", "*.gbc", "*.gba", "*.bin"]
				},
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			];
		}

		return selectedGame.Platform switch {
			"NES" => [
				new FilePickerFileType("NES ROM") { Patterns = ["*.nes"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			],
			"SNES" => [
				new FilePickerFileType("SNES ROM") { Patterns = ["*.sfc", "*.smc"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			],
			"GB" => [
				new FilePickerFileType("Game Boy ROM") { Patterns = ["*.gb", "*.gbc"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			],
			"GBA" => [
				new FilePickerFileType("GBA ROM") { Patterns = ["*.gba"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			],
			_ => [
				new FilePickerFileType("ROM Files") { Patterns = ["*.bin", "*.*"] }
			]
		};
	}

	/// <summary>
	/// Dummy project service for design-time support.
	/// </summary>
	private class DummyProjectService : IProjectService {
#pragma warning disable CS0067 // Event is never used - required for interface
		public event EventHandler<ProjectChangedEventArgs>? ProjectChanged;
#pragma warning restore CS0067
		public Project? CurrentProject => null;
		public bool HasOpenProject => false;

		public Task<Project> CreateProjectAsync(GameDefinition game, string romPath, string projectPath,
			ProjectCreationOptions? options = null, IProgress<ExtractProgress>? progress = null,
			CancellationToken cancellationToken = default) =>
			Task.FromResult<Project>(null!);

		public Task<Project> OpenProjectAsync(string projectPath, CancellationToken cancellationToken = default) =>
			Task.FromResult<Project>(null!);

		public Task SaveProjectAsync(string? path = null, CancellationToken cancellationToken = default) =>
			Task.CompletedTask;

		public Task CloseProjectAsync(bool save = false) => Task.CompletedTask;

		public Task ExtractAssetsAsync(string romPath, IEnumerable<string>? assetTypes = null,
			IProgress<ExtractProgress>? progress = null, CancellationToken cancellationToken = default) =>
			Task.CompletedTask;

		public Task<BuildResult> BuildAsync(string profile = "default", IProgress<BuildProgress>? progress = null,
			CancellationToken cancellationToken = default) =>
			Task.FromResult(new BuildResult(false, null, null, [], [], TimeSpan.Zero));

		public Task<VerifyResult> VerifyAsync(byte[] romData) =>
			Task.FromResult(new VerifyResult(false, 0, [], "", ""));

		public IReadOnlyList<string> GetBuildProfiles() => [];

		public Task ExportAssetsAsync(string outputPath, IEnumerable<string>? assetTypes = null,
			CancellationToken cancellationToken = default) =>
			Task.CompletedTask;

		public Task ImportAssetsAsync(string inputPath, CancellationToken cancellationToken = default) =>
			Task.CompletedTask;
	}

	/// <summary>
	/// Dummy extractor registry for design-time support.
	/// </summary>
	private class DummyExtractorRegistry : IAssetExtractorRegistry {
		public IReadOnlyList<IAssetExtractor> Extractors => [];
		public IAssetExtractor? GetExtractor(string gameId) => null;
		public IReadOnlyList<GameDefinition> GetGameDefinitions() => [
			new GameDefinition {
				Id = "dragon-warrior-4",
				Name = "Dragon Warrior IV",
				Platform = "NES",
				Region = "USA",
				ExtractorType = "DragonWarrior4Extractor",
				Assembler = "ca65"
			}
		];
		public Task<IAssetExtractor?> DetectExtractorAsync(byte[] romData) => Task.FromResult<IAssetExtractor?>(null);
		public void Register(IAssetExtractor extractor) { }
	}
}
