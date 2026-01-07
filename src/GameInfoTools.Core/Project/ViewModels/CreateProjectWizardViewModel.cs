using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace GameInfoTools.Core.Project.ViewModels;

/// <summary>
/// View model for the Create New Project wizard.
/// Shared between Avalonia and Blazor UIs.
/// </summary>
public class CreateProjectWizardViewModel : INotifyPropertyChanged {
	private readonly IProjectService _projectService;
	private readonly IAssetExtractorRegistry _extractorRegistry;

	private WizardStep _currentStep = WizardStep.SelectGame;
	private GameDefinition? _selectedGame;
	private string? _romPath;
	private RomVerificationResult? _verificationResult;
	private string? _projectName;
	private string? _projectPath;
	private bool _isExtracting;
	private double _progress;
	private string _progressMessage = "";
	private bool _canGoBack;
	private bool _canGoNext;
	private bool _canCreate;
	private string? _errorMessage;

	/// <summary>Event raised when a property changes.</summary>
	public event PropertyChangedEventHandler? PropertyChanged;

	/// <summary>Event raised when the wizard completes successfully.</summary>
	public event EventHandler<Project>? ProjectCreated;

	/// <summary>Event raised when the wizard is cancelled.</summary>
	public event EventHandler? Cancelled;

	/// <summary>
	/// Creates a new wizard view model.
	/// </summary>
	public CreateProjectWizardViewModel(
		IProjectService projectService,
		IAssetExtractorRegistry extractorRegistry
	) {
		_projectService = projectService;
		_extractorRegistry = extractorRegistry;

		AvailableGames = new ObservableCollection<GameDefinition>(_extractorRegistry.GetGameDefinitions());
		Log = new ObservableCollection<string>();
		Options = new ProjectCreationOptionsViewModel();

		UpdateNavigationState();
	}

	/// <summary>Current wizard step.</summary>
	public WizardStep CurrentStep {
		get => _currentStep;
		set {
			if (_currentStep != value) {
				_currentStep = value;
				OnPropertyChanged();
				UpdateNavigationState();
			}
		}
	}

	/// <summary>Available games for selection.</summary>
	public ObservableCollection<GameDefinition> AvailableGames { get; }

	/// <summary>Selected game definition.</summary>
	public GameDefinition? SelectedGame {
		get => _selectedGame;
		set {
			if (_selectedGame != value) {
				_selectedGame = value;
				OnPropertyChanged();
				UpdateNavigationState();
			}
		}
	}

	/// <summary>Path to the ROM file.</summary>
	public string? RomPath {
		get => _romPath;
		set {
			if (_romPath != value) {
				_romPath = value;
				OnPropertyChanged();
				_verificationResult = null;
				OnPropertyChanged(nameof(VerificationResult));
				UpdateNavigationState();
			}
		}
	}

	/// <summary>Result of ROM verification.</summary>
	public RomVerificationResult? VerificationResult {
		get => _verificationResult;
		private set {
			_verificationResult = value;
			OnPropertyChanged();
			UpdateNavigationState();
		}
	}

	/// <summary>Project name.</summary>
	public string? ProjectName {
		get => _projectName;
		set {
			if (_projectName != value) {
				_projectName = value;
				OnPropertyChanged();
				UpdateNavigationState();
			}
		}
	}

	/// <summary>Path where the project will be saved.</summary>
	public string? ProjectPath {
		get => _projectPath;
		set {
			if (_projectPath != value) {
				_projectPath = value;
				OnPropertyChanged();
				UpdateNavigationState();
			}
		}
	}

	/// <summary>Project creation options.</summary>
	public ProjectCreationOptionsViewModel Options { get; }

	/// <summary>Whether extraction is in progress.</summary>
	public bool IsExtracting {
		get => _isExtracting;
		private set {
			if (_isExtracting != value) {
				_isExtracting = value;
				OnPropertyChanged();
				UpdateNavigationState();
			}
		}
	}

	/// <summary>Current progress (0-100).</summary>
	public double Progress {
		get => _progress;
		private set {
			if (Math.Abs(_progress - value) > 0.01) {
				_progress = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Current progress message.</summary>
	public string ProgressMessage {
		get => _progressMessage;
		private set {
			if (_progressMessage != value) {
				_progressMessage = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Log messages during extraction.</summary>
	public ObservableCollection<string> Log { get; }

	/// <summary>Whether the user can go back.</summary>
	public bool CanGoBack {
		get => _canGoBack;
		private set {
			if (_canGoBack != value) {
				_canGoBack = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether the user can go next.</summary>
	public bool CanGoNext {
		get => _canGoNext;
		private set {
			if (_canGoNext != value) {
				_canGoNext = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether the user can create the project.</summary>
	public bool CanCreate {
		get => _canCreate;
		private set {
			if (_canCreate != value) {
				_canCreate = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Current error message, if any.</summary>
	public string? ErrorMessage {
		get => _errorMessage;
		set {
			if (_errorMessage != value) {
				_errorMessage = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Go to the previous step.</summary>
	public void GoBack() {
		if (!CanGoBack) return;

		CurrentStep = CurrentStep switch {
			WizardStep.SelectRom => WizardStep.SelectGame,
			WizardStep.VerifyRom => WizardStep.SelectRom,
			WizardStep.Configure => WizardStep.VerifyRom,
			WizardStep.Extract => WizardStep.Configure,
			_ => CurrentStep
		};

		ErrorMessage = null;
	}

	/// <summary>Go to the next step.</summary>
	public async Task GoNextAsync() {
		if (!CanGoNext) return;

		ErrorMessage = null;

		try {
			switch (CurrentStep) {
				case WizardStep.SelectGame:
					CurrentStep = WizardStep.SelectRom;
					break;

				case WizardStep.SelectRom:
					await VerifyRomAsync();
					CurrentStep = WizardStep.VerifyRom;
					break;

				case WizardStep.VerifyRom:
					// Initialize project name from game if not set
					if (string.IsNullOrEmpty(ProjectName)) {
						ProjectName = SelectedGame?.Name ?? "New Project";
					}
					CurrentStep = WizardStep.Configure;
					break;

				case WizardStep.Configure:
					CurrentStep = WizardStep.Extract;
					await CreateProjectAsync();
					break;
			}
		} catch (Exception ex) {
			ErrorMessage = ex.Message;
		}
	}

	/// <summary>Cancel the wizard.</summary>
	public void Cancel() {
		Cancelled?.Invoke(this, EventArgs.Empty);
	}

	/// <summary>Verify the selected ROM.</summary>
	public async Task VerifyRomAsync() {
		if (string.IsNullOrEmpty(RomPath) || SelectedGame is null) {
			return;
		}

		var extractor = _extractorRegistry.GetExtractor(SelectedGame.Id);
		if (extractor is null) {
			ErrorMessage = $"No extractor available for {SelectedGame.Name}";
			return;
		}

		try {
			var romData = await File.ReadAllBytesAsync(RomPath);
			VerificationResult = await extractor.VerifyRomAsync(romData);
		} catch (Exception ex) {
			ErrorMessage = $"Failed to read ROM: {ex.Message}";
		}
	}

	/// <summary>Create the project.</summary>
	public async Task CreateProjectAsync() {
		if (SelectedGame is null || string.IsNullOrEmpty(RomPath) || string.IsNullOrEmpty(ProjectPath)) {
			return;
		}

		IsExtracting = true;
		Log.Clear();

		try {
			var progress = new Progress<ExtractProgress>(p => {
				Progress = p.Percentage;
				ProgressMessage = p.CurrentOperation;
				Log.Add($"[{p.Percentage:F0}%] {p.CurrentOperation}");
			});

			var options = new ProjectCreationOptions {
				Name = ProjectName,
				Description = Options.Description,
				Authors = [.. Options.Authors.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)],
				IncludeSource = Options.IncludeSource,
				IncludeSymbols = Options.IncludeSymbols,
				IncludeAnalysis = Options.IncludeAnalysis
			};

			var project = await _projectService.CreateProjectAsync(
				SelectedGame,
				RomPath,
				ProjectPath,
				options,
				progress
			);

			Log.Add("Project created successfully!");
			ProjectCreated?.Invoke(this, project);
		} catch (Exception ex) {
			ErrorMessage = ex.Message;
			Log.Add($"Error: {ex.Message}");
		} finally {
			IsExtracting = false;
		}
	}

	private void UpdateNavigationState() {
		CanGoBack = CurrentStep != WizardStep.SelectGame && !IsExtracting;

		CanGoNext = CurrentStep switch {
			WizardStep.SelectGame => SelectedGame is not null,
			WizardStep.SelectRom => !string.IsNullOrEmpty(RomPath) && File.Exists(RomPath),
			WizardStep.VerifyRom => VerificationResult?.Status != RomVerificationStatus.Invalid,
			WizardStep.Configure => !string.IsNullOrEmpty(ProjectPath),
			WizardStep.Extract => false,
			_ => false
		} && !IsExtracting;

		CanCreate = CurrentStep == WizardStep.Configure &&
			!string.IsNullOrEmpty(ProjectPath) &&
			!IsExtracting;
	}

	/// <summary>Raises the PropertyChanged event.</summary>
	protected void OnPropertyChanged([CallerMemberName] string? propertyName = null) {
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}
}

/// <summary>
/// Wizard steps.
/// </summary>
public enum WizardStep {
	/// <summary>Select a game from the list.</summary>
	SelectGame,

	/// <summary>Select the ROM file.</summary>
	SelectRom,

	/// <summary>Verify the ROM.</summary>
	VerifyRom,

	/// <summary>Configure project options.</summary>
	Configure,

	/// <summary>Extract assets and create project.</summary>
	Extract
}

/// <summary>
/// View model for project creation options.
/// </summary>
public class ProjectCreationOptionsViewModel : INotifyPropertyChanged {
	private string? _description;
	private string _authors = "";
	private bool _includeSource = true;
	private bool _includeSymbols = true;
	private bool _includeAnalysis = true;

	/// <summary>Event raised when a property changes.</summary>
	public event PropertyChangedEventHandler? PropertyChanged;

	/// <summary>Project description.</summary>
	public string? Description {
		get => _description;
		set {
			if (_description != value) {
				_description = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Author names (comma-separated).</summary>
	public string Authors {
		get => _authors;
		set {
			if (_authors != value) {
				_authors = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether to include source files.</summary>
	public bool IncludeSource {
		get => _includeSource;
		set {
			if (_includeSource != value) {
				_includeSource = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether to include symbol files.</summary>
	public bool IncludeSymbols {
		get => _includeSymbols;
		set {
			if (_includeSymbols != value) {
				_includeSymbols = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether to include analysis files.</summary>
	public bool IncludeAnalysis {
		get => _includeAnalysis;
		set {
			if (_includeAnalysis != value) {
				_includeAnalysis = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Raises the PropertyChanged event.</summary>
	protected void OnPropertyChanged([CallerMemberName] string? propertyName = null) {
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}
}
