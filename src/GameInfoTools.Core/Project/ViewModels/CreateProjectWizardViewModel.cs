using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

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
	private bool _isVerifying;
	private double _progress;
	private string _progressMessage = "";
	private bool _canGoBack;
	private bool _canGoNext;
	private bool _canCreate;
	private string? _errorMessage;
	private string? _validationMessage;

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

		// Initialize commands
		GoBackCommand = new RelayCommand(GoBack, () => CanGoBack);
		GoNextCommand = new AsyncRelayCommand(GoNextAsync, () => CanGoNext);
		CancelCommand = new RelayCommand(Cancel);
		CreateProjectCommand = new AsyncRelayCommand(CreateProjectAsync, () => CanCreate);
		BrowseForRomCommand = new RelayCommand(BrowseForRom);
		BrowseForProjectCommand = new RelayCommand(BrowseForProject);

		UpdateNavigationState();
	}

	// Commands for UI binding
	/// <summary>Command to go back a step.</summary>
	public ICommand GoBackCommand { get; }

	/// <summary>Command to go to next step.</summary>
	public ICommand GoNextCommand { get; }

	/// <summary>Command to cancel the wizard.</summary>
	public ICommand CancelCommand { get; }

	/// <summary>Command to create the project.</summary>
	public ICommand CreateProjectCommand { get; }

	/// <summary>Command to browse for ROM file.</summary>
	public ICommand BrowseForRomCommand { get; }

	/// <summary>Command to browse for project location.</summary>
	public ICommand BrowseForProjectCommand { get; }

	/// <summary>Event raised when user wants to browse for ROM.</summary>
	public event EventHandler? BrowseForRomRequested;

	/// <summary>Event raised when user wants to browse for project path.</summary>
	public event EventHandler? BrowseForProjectRequested;

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

	// Extraction options (bound directly for simpler UI)
	/// <summary>Whether to extract graphics.</summary>
	public bool ExtractGraphics { get; set; } = true;

	/// <summary>Whether to extract text.</summary>
	public bool ExtractText { get; set; } = true;

	/// <summary>Whether to extract data.</summary>
	public bool ExtractData { get; set; } = true;

	/// <summary>Whether to extract maps.</summary>
	public bool ExtractMaps { get; set; } = true;

	/// <summary>Whether to extract audio.</summary>
	public bool ExtractAudio { get; set; } = true;

	/// <summary>Available assemblers.</summary>
	public ObservableCollection<string> AvailableAssemblers { get; } = ["ca65", "Ophis", "bass", "asar"];

	/// <summary>Selected assembler.</summary>
	public string SelectedAssembler { get; set; } = "ca65";

	/// <summary>Available build profiles.</summary>
	public ObservableCollection<string> BuildProfiles { get; } = ["default", "debug", "release"];

	/// <summary>Selected build profile.</summary>
	public string SelectedProfile { get; set; } = "default";

	/// <summary>Extraction progress (0-100).</summary>
	public double ExtractionProgress => Progress;

	/// <summary>Extraction log entries.</summary>
	public ObservableCollection<string> ExtractionLog => Log;

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

	/// <summary>Validation message for current step.</summary>
	public string? ValidationMessage {
		get => _validationMessage;
		set {
			if (_validationMessage != value) {
				_validationMessage = value;
				OnPropertyChanged();
				OnPropertyChanged(nameof(HasValidationMessage));
			}
		}
	}

	/// <summary>Whether there is a validation message.</summary>
	public bool HasValidationMessage => !string.IsNullOrEmpty(ValidationMessage);

	/// <summary>Whether ROM verification is in progress.</summary>
	public bool IsVerifying {
		get => _isVerifying;
		private set {
			if (_isVerifying != value) {
				_isVerifying = value;
				OnPropertyChanged();
			}
		}
	}

	// Step visibility properties for UI binding
	/// <summary>Whether currently on SelectGame step.</summary>
	public bool IsSelectGameStep => CurrentStep == WizardStep.SelectGame;

	/// <summary>Whether currently on SelectRom step.</summary>
	public bool IsSelectRomStep => CurrentStep == WizardStep.SelectRom;

	/// <summary>Whether currently on VerifyRom step.</summary>
	public bool IsVerifyRomStep => CurrentStep == WizardStep.VerifyRom;

	/// <summary>Whether currently on Configure step.</summary>
	public bool IsConfigureStep => CurrentStep == WizardStep.Configure;

	/// <summary>Whether currently on Extract step.</summary>
	public bool IsExtractStep => CurrentStep == WizardStep.Extract;

	/// <summary>Whether ROM path is set.</summary>
	public bool HasRomPath => !string.IsNullOrEmpty(RomPath);

	/// <summary>Whether extraction is complete.</summary>
	public bool IsExtractionComplete { get; private set; }

	/// <summary>Whether there is an extraction log.</summary>
	public bool HasExtractionLog => Log.Count > 0;

	/// <summary>Whether advancement is possible (for UI binding).</summary>
	public bool CanAdvance => CanGoNext;

	// Display properties for ROM info
	/// <summary>ROM file size display.</summary>
	public string RomSizeDisplay => RomPath is not null && File.Exists(RomPath)
		? $"{new FileInfo(RomPath).Length:N0} bytes"
		: "";

	/// <summary>ROM format display.</summary>
	public string RomFormatDisplay => SelectedGame?.Platform ?? "";

	/// <summary>ROM header display.</summary>
	public string RomHeaderDisplay => RomPath is not null && File.Exists(RomPath)
		? (new FileInfo(RomPath).Length % 0x400 == 0x200 ? "Yes (512 bytes)" : "No header")
		: "";

	/// <summary>ROM file info display.</summary>
	public string RomFileInfo => RomPath is not null
		? Path.GetFileName(RomPath)
		: "";

	/// <summary>Verification status text.</summary>
	public string VerificationStatusText => VerificationResult?.Status switch {
		RomVerificationStatus.Verified => "ROM Verified ✓",
		RomVerificationStatus.Unknown => "ROM not in database (may work)",
		RomVerificationStatus.Invalid => "Invalid ROM",
		_ => "Not verified"
	};

	/// <summary>Extraction summary text.</summary>
	public string ExtractionSummary => $"Extracted assets to {ProjectPath}";

	/// <summary>Extraction status text.</summary>
	public string ExtractionStatus => ProgressMessage;

	/// <summary>Step names for the progress indicator.</summary>
	public IReadOnlyList<WizardStepInfo> StepNames { get; } = [
		new(1, "Select Game"),
		new(2, "Select ROM"),
		new(3, "Verify"),
		new(4, "Configure"),
		new(5, "Create")
	];

	// Browse command handlers
	private void BrowseForRom() => BrowseForRomRequested?.Invoke(this, EventArgs.Empty);
	private void BrowseForProject() => BrowseForProjectRequested?.Invoke(this, EventArgs.Empty);

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

			// Build list of asset types to extract
			var assetTypes = new List<string>();
			if (ExtractGraphics) assetTypes.Add("graphics");
			if (ExtractText) assetTypes.Add("text");
			if (ExtractData) assetTypes.Add("data");
			if (ExtractMaps) assetTypes.Add("maps");
			if (ExtractAudio) assetTypes.Add("audio");

			var options = new ProjectCreationOptions {
				Name = ProjectName,
				Description = Options.Description,
				Authors = [.. Options.Authors.Split(',', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries)],
				AssetTypes = assetTypes.Count > 0 ? assetTypes : null,
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

		// Update step visibility
		OnPropertyChanged(nameof(IsSelectGameStep));
		OnPropertyChanged(nameof(IsSelectRomStep));
		OnPropertyChanged(nameof(IsVerifyRomStep));
		OnPropertyChanged(nameof(IsConfigureStep));
		OnPropertyChanged(nameof(IsExtractStep));
		OnPropertyChanged(nameof(CanAdvance));
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

/// <summary>
/// Information about a wizard step.
/// </summary>
public record WizardStepInfo(int Index, string Name);

/// <summary>
/// Simple relay command implementation.
/// </summary>
public class RelayCommand : ICommand {
	private readonly Action _execute;
	private readonly Func<bool>? _canExecute;

	/// <summary>Creates a new relay command.</summary>
	public RelayCommand(Action execute, Func<bool>? canExecute = null) {
		_execute = execute;
		_canExecute = canExecute;
	}

	/// <summary>Event raised when can execute changes.</summary>
	public event EventHandler? CanExecuteChanged;

	/// <summary>Whether the command can execute.</summary>
	public bool CanExecute(object? parameter) => _canExecute?.Invoke() ?? true;

	/// <summary>Execute the command.</summary>
	public void Execute(object? parameter) => _execute();

	/// <summary>Raise CanExecuteChanged.</summary>
	public void RaiseCanExecuteChanged() => CanExecuteChanged?.Invoke(this, EventArgs.Empty);
}

/// <summary>
/// Simple async relay command implementation.
/// </summary>
public class AsyncRelayCommand : ICommand {
	private readonly Func<Task> _execute;
	private readonly Func<bool>? _canExecute;
	private bool _isExecuting;

	/// <summary>Creates a new async relay command.</summary>
	public AsyncRelayCommand(Func<Task> execute, Func<bool>? canExecute = null) {
		_execute = execute;
		_canExecute = canExecute;
	}

	/// <summary>Event raised when can execute changes.</summary>
	public event EventHandler? CanExecuteChanged;

	/// <summary>Whether the command can execute.</summary>
	public bool CanExecute(object? parameter) => !_isExecuting && (_canExecute?.Invoke() ?? true);

	/// <summary>Execute the command.</summary>
	public async void Execute(object? parameter) {
		if (_isExecuting) return;
		_isExecuting = true;
		CanExecuteChanged?.Invoke(this, EventArgs.Empty);

		try {
			await _execute();
		} finally {
			_isExecuting = false;
			CanExecuteChanged?.Invoke(this, EventArgs.Empty);
		}
	}

	/// <summary>Raise CanExecuteChanged.</summary>
	public void RaiseCanExecuteChanged() => CanExecuteChanged?.Invoke(this, EventArgs.Empty);
}
