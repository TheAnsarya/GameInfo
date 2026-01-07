using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace GameInfoTools.Core.Project.ViewModels;

/// <summary>
/// View model for the Build Panel.
/// Shows build output and controls build operations.
/// </summary>
public class BuildPanelViewModel : INotifyPropertyChanged {
	private readonly IProjectService _projectService;
	private string _selectedProfile = "default";
	private bool _isBuilding;
	private double _progress;
	private string _progressMessage = "";
	private BuildStatus _lastBuildStatus = BuildStatus.None;
	private string? _lastBuildTime;
	private string? _lastBuildDuration;
	private bool _autoVerify = true;

	/// <summary>Event raised when a property changes.</summary>
	public event PropertyChangedEventHandler? PropertyChanged;

	/// <summary>
	/// Creates a new build panel view model.
	/// </summary>
	public BuildPanelViewModel(IProjectService projectService) {
		_projectService = projectService;
		Output = [];
		Errors = [];
		Warnings = [];

		// Initialize commands
		BuildCommand = new AsyncRelayCommand(BuildAsync, () => CanBuild);
		RebuildCommand = new AsyncRelayCommand(RebuildAsync, () => CanBuild);
		CleanCommand = new RelayCommand(Clean);

		_projectService.ProjectChanged += OnProjectChanged;
		RefreshProfiles();
	}

	// Commands for UI binding
	/// <summary>Command to start a build.</summary>
	public ICommand BuildCommand { get; }

	/// <summary>Command to rebuild (clean + build).</summary>
	public ICommand RebuildCommand { get; }

	/// <summary>Command to clean build outputs.</summary>
	public ICommand CleanCommand { get; }

	/// <summary>Available build profiles.</summary>
	public ObservableCollection<string> Profiles { get; } = [];

	/// <summary>Selected build profile.</summary>
	public string SelectedProfile {
		get => _selectedProfile;
		set {
			if (_selectedProfile != value) {
				_selectedProfile = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether a build is in progress.</summary>
	public bool IsBuilding {
		get => _isBuilding;
		private set {
			if (_isBuilding != value) {
				_isBuilding = value;
				OnPropertyChanged();
				OnPropertyChanged(nameof(CanBuild));
			}
		}
	}

	/// <summary>Whether building is possible.</summary>
	public bool CanBuild => _projectService.HasOpenProject && !IsBuilding;

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

	/// <summary>Build output lines.</summary>
	public ObservableCollection<BuildOutputLine> Output { get; }

	/// <summary>Build errors.</summary>
	public ObservableCollection<BuildMessage> Errors { get; }

	/// <summary>Build warnings.</summary>
	public ObservableCollection<BuildMessage> Warnings { get; }

	/// <summary>Status of the last build.</summary>
	public BuildStatus LastBuildStatus {
		get => _lastBuildStatus;
		private set {
			if (_lastBuildStatus != value) {
				_lastBuildStatus = value;
				OnPropertyChanged();
				OnPropertyChanged(nameof(LastBuildStatusText));
				OnPropertyChanged(nameof(LastBuildStatusColor));
			}
		}
	}

	/// <summary>Text for last build status.</summary>
	public string LastBuildStatusText => LastBuildStatus switch {
		BuildStatus.None => "No build",
		BuildStatus.Success => "Build succeeded",
		BuildStatus.SuccessVerified => "Build verified ✓",
		BuildStatus.SuccessNotVerified => "Build succeeded (not verified)",
		BuildStatus.Failed => "Build failed",
		_ => "Unknown"
	};

	/// <summary>Color for last build status.</summary>
	public string LastBuildStatusColor => LastBuildStatus switch {
		BuildStatus.Success or BuildStatus.SuccessVerified => "Green",
		BuildStatus.SuccessNotVerified => "Orange",
		BuildStatus.Failed => "Red",
		_ => "Gray"
	};

	/// <summary>Time of last build.</summary>
	public string? LastBuildTime {
		get => _lastBuildTime;
		private set {
			if (_lastBuildTime != value) {
				_lastBuildTime = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Duration of last build.</summary>
	public string? LastBuildDuration {
		get => _lastBuildDuration;
		private set {
			if (_lastBuildDuration != value) {
				_lastBuildDuration = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether to automatically verify after build.</summary>
	public bool AutoVerify {
		get => _autoVerify;
		set {
			if (_autoVerify != value) {
				_autoVerify = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Start a build.</summary>
	public async Task BuildAsync() {
		if (!CanBuild) return;

		IsBuilding = true;
		Output.Clear();
		Errors.Clear();
		Warnings.Clear();
		Progress = 0;
		ProgressMessage = "Starting build...";

		AddOutput("Build started", OutputType.Info);
		AddOutput($"Profile: {SelectedProfile}", OutputType.Info);

		try {
			var progress = new Progress<BuildProgress>(p => {
				Progress = p.Percentage;
				ProgressMessage = p.CurrentOperation;
				AddOutput($"{p.CurrentOperation}: {p.CurrentFile}", OutputType.Info);
			});

			var result = await _projectService.BuildAsync(SelectedProfile, progress);

			// Process results
			foreach (var error in result.Errors) {
				Errors.Add(ParseBuildMessage(error));
				AddOutput(error, OutputType.Error);
			}

			foreach (var warning in result.Warnings) {
				Warnings.Add(ParseBuildMessage(warning));
				AddOutput(warning, OutputType.Warning);
			}

			LastBuildTime = DateTime.Now.ToString("HH:mm:ss");
			LastBuildDuration = $"{result.Duration.TotalSeconds:F1}s";

			if (result.Success) {
				AddOutput($"Build completed in {result.Duration.TotalSeconds:F1}s", OutputType.Success);

				if (AutoVerify && result.RomData is not null) {
					AddOutput("Verifying build...", OutputType.Info);
					var verifyResult = await _projectService.VerifyAsync(result.RomData);

					if (verifyResult.IsMatch) {
						AddOutput("✓ ROM verified - matches original", OutputType.Success);
						LastBuildStatus = BuildStatus.SuccessVerified;
					} else {
						AddOutput($"✗ ROM differs - {verifyResult.BytesDifferent} bytes different", OutputType.Warning);
						LastBuildStatus = BuildStatus.SuccessNotVerified;
					}
				} else {
					LastBuildStatus = BuildStatus.Success;
				}
			} else {
				AddOutput($"Build failed with {result.Errors.Count} error(s)", OutputType.Error);
				LastBuildStatus = BuildStatus.Failed;
			}
		} catch (Exception ex) {
			AddOutput($"Build error: {ex.Message}", OutputType.Error);
			LastBuildStatus = BuildStatus.Failed;
		} finally {
			IsBuilding = false;
			Progress = 100;
			ProgressMessage = "";
		}
	}

	/// <summary>Clean build outputs.</summary>
	public void Clean() {
		Output.Clear();
		Errors.Clear();
		Warnings.Clear();
		AddOutput("Build outputs cleaned", OutputType.Info);
	}

	/// <summary>Rebuild (clean + build).</summary>
	public async Task RebuildAsync() {
		Clean();
		await BuildAsync();
	}

	private void RefreshProfiles() {
		Profiles.Clear();
		foreach (var profile in _projectService.GetBuildProfiles()) {
			Profiles.Add(profile);
		}

		if (Profiles.Count > 0 && !Profiles.Contains(SelectedProfile)) {
			SelectedProfile = Profiles[0];
		}
	}

	private void OnProjectChanged(object? sender, ProjectChangedEventArgs e) {
		RefreshProfiles();
		OnPropertyChanged(nameof(CanBuild));
	}

	private void AddOutput(string message, OutputType type) {
		Output.Add(new BuildOutputLine {
			Timestamp = DateTime.Now.ToString("HH:mm:ss"),
			Message = message,
			Type = type
		});
	}

	private static BuildMessage ParseBuildMessage(string message) {
		// Try to parse file:line:column format
		var match = System.Text.RegularExpressions.Regex.Match(
			message,
			@"^(.+?):(\d+):(\d+)?:?\s*(.*)$"
		);

		if (match.Success) {
			return new BuildMessage {
				File = match.Groups[1].Value,
				Line = int.TryParse(match.Groups[2].Value, out var line) ? line : null,
				Column = int.TryParse(match.Groups[3].Value, out var col) ? col : null,
				Text = match.Groups[4].Value
			};
		}

		return new BuildMessage { Text = message };
	}

	/// <summary>Raises the PropertyChanged event.</summary>
	protected void OnPropertyChanged([CallerMemberName] string? propertyName = null) {
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}
}

/// <summary>
/// Status of a build.
/// </summary>
public enum BuildStatus {
	/// <summary>No build has been performed.</summary>
	None,

	/// <summary>Build succeeded.</summary>
	Success,

	/// <summary>Build succeeded and verified against original.</summary>
	SuccessVerified,

	/// <summary>Build succeeded but does not match original.</summary>
	SuccessNotVerified,

	/// <summary>Build failed.</summary>
	Failed
}

/// <summary>
/// Type of output line.
/// </summary>
public enum OutputType {
	/// <summary>Informational message.</summary>
	Info,

	/// <summary>Warning message.</summary>
	Warning,

	/// <summary>Error message.</summary>
	Error,

	/// <summary>Success message.</summary>
	Success
}

/// <summary>
/// A line of build output.
/// </summary>
public class BuildOutputLine {
	/// <summary>Timestamp.</summary>
	public required string Timestamp { get; init; }

	/// <summary>Message text.</summary>
	public required string Message { get; init; }

	/// <summary>Output type.</summary>
	public required OutputType Type { get; init; }

	/// <summary>Color for the output type.</summary>
	public string Color => Type switch {
		OutputType.Error => "Red",
		OutputType.Warning => "Orange",
		OutputType.Success => "Green",
		_ => "White"
	};
}

/// <summary>
/// A build error or warning message.
/// </summary>
public class BuildMessage {
	/// <summary>Source file.</summary>
	public string? File { get; init; }

	/// <summary>Line number.</summary>
	public int? Line { get; init; }

	/// <summary>Column number.</summary>
	public int? Column { get; init; }

	/// <summary>Message text.</summary>
	public required string Text { get; init; }

	/// <summary>Location string.</summary>
	public string Location => File is not null
		? $"{File}:{Line}:{Column}"
		: "";
}
