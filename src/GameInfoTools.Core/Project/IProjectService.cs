namespace GameInfoTools.Core.Project;

/// <summary>
/// Progress information for asset extraction operations.
/// </summary>
public record ExtractProgress(
	string CurrentOperation,
	int CurrentItem,
	int TotalItems,
	double Percentage
);

/// <summary>
/// Progress information for build operations.
/// </summary>
public record BuildProgress(
	string CurrentOperation,
	string? CurrentFile,
	int CurrentStep,
	int TotalSteps,
	double Percentage
);

/// <summary>
/// Result of a build operation.
/// </summary>
public record BuildResult(
	bool Success,
	byte[]? RomData,
	string? OutputPath,
	IReadOnlyList<string> Errors,
	IReadOnlyList<string> Warnings,
	TimeSpan Duration
);

/// <summary>
/// Result of build verification.
/// </summary>
public record VerifyResult(
	bool IsMatch,
	int BytesDifferent,
	IReadOnlyList<(int Offset, byte Expected, byte Actual)> Differences,
	string ExpectedChecksum,
	string ActualChecksum
);

/// <summary>
/// Interface for managing .giproj project files.
/// </summary>
/// <remarks>
/// Projects are ZIP archives containing extracted assets, source code,
/// and metadata for ROM hacking. They can be edited and built back
/// into a ROM that matches the original.
/// </remarks>
public interface IProjectService {
	/// <summary>Event raised when project state changes.</summary>
	event EventHandler<ProjectChangedEventArgs>? ProjectChanged;

	/// <summary>The currently open project, if any.</summary>
	Project? CurrentProject { get; }

	/// <summary>Whether a project is currently open.</summary>
	bool HasOpenProject { get; }

	/// <summary>
	/// Creates a new project from a ROM file.
	/// </summary>
	/// <param name="game">Game definition to use.</param>
	/// <param name="romPath">Path to the ROM file.</param>
	/// <param name="projectPath">Path where the .giproj file will be saved.</param>
	/// <param name="options">Project creation options.</param>
	/// <param name="progress">Optional progress reporter.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>The created project.</returns>
	Task<Project> CreateProjectAsync(
		GameDefinition game,
		string romPath,
		string projectPath,
		ProjectCreationOptions? options = null,
		IProgress<ExtractProgress>? progress = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Opens an existing project file.
	/// </summary>
	/// <param name="projectPath">Path to the .giproj file.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>The opened project.</returns>
	Task<Project> OpenProjectAsync(
		string projectPath,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Saves the current project.
	/// </summary>
	/// <param name="path">Optional new path to save to (Save As).</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	Task SaveProjectAsync(
		string? path = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Closes the current project.
	/// </summary>
	/// <param name="save">Whether to save before closing.</param>
	Task CloseProjectAsync(bool save = false);

	/// <summary>
	/// Extracts or re-extracts assets from the reference ROM.
	/// </summary>
	/// <param name="romPath">Path to the ROM file.</param>
	/// <param name="assetTypes">Specific asset types to extract, or null for all.</param>
	/// <param name="progress">Optional progress reporter.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	Task ExtractAssetsAsync(
		string romPath,
		IEnumerable<string>? assetTypes = null,
		IProgress<ExtractProgress>? progress = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Builds a ROM from the project.
	/// </summary>
	/// <param name="profile">Build profile to use.</param>
	/// <param name="progress">Optional progress reporter.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Build result with ROM data if successful.</returns>
	Task<BuildResult> BuildAsync(
		string profile = "default",
		IProgress<BuildProgress>? progress = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Verifies a built ROM against the reference checksums.
	/// </summary>
	/// <param name="romData">ROM data to verify.</param>
	/// <returns>Verification result.</returns>
	Task<VerifyResult> VerifyAsync(byte[] romData);

	/// <summary>
	/// Gets available build profiles for the current project.
	/// </summary>
	IReadOnlyList<string> GetBuildProfiles();

	/// <summary>
	/// Exports project assets to a directory.
	/// </summary>
	/// <param name="outputPath">Directory to export to.</param>
	/// <param name="assetTypes">Specific asset types to export, or null for all.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	Task ExportAssetsAsync(
		string outputPath,
		IEnumerable<string>? assetTypes = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Imports assets from a directory into the project.
	/// </summary>
	/// <param name="inputPath">Directory to import from.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	Task ImportAssetsAsync(
		string inputPath,
		CancellationToken cancellationToken = default
	);
}

/// <summary>
/// Event arguments for project state changes.
/// </summary>
public class ProjectChangedEventArgs : EventArgs {
	/// <summary>Type of change that occurred.</summary>
	public ProjectChangeType ChangeType { get; init; }

	/// <summary>The project involved in the change.</summary>
	public Project? Project { get; init; }
}

/// <summary>
/// Types of project state changes.
/// </summary>
public enum ProjectChangeType {
	/// <summary>Project was opened.</summary>
	Opened,

	/// <summary>Project was closed.</summary>
	Closed,

	/// <summary>Project was saved.</summary>
	Saved,

	/// <summary>Project was modified.</summary>
	Modified,

	/// <summary>Build completed.</summary>
	Built
}
