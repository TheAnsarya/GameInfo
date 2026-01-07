namespace GameInfoTools.Core.Project;

/// <summary>
/// Context for building a ROM from project source files.
/// </summary>
public class BuildContext {
	/// <summary>Project being built.</summary>
	public required Project Project { get; init; }

	/// <summary>Build profile to use.</summary>
	public required string Profile { get; init; }

	/// <summary>Working directory containing extracted project files.</summary>
	public required string WorkingDirectory { get; init; }

	/// <summary>Main source file to assemble.</summary>
	public required string MainSourceFile { get; init; }

	/// <summary>Output path for the built ROM.</summary>
	public required string OutputPath { get; init; }

	/// <summary>Symbol definitions from the build profile.</summary>
	public Dictionary<string, string> Defines { get; init; } = [];

	/// <summary>Additional arguments for the assembler.</summary>
	public List<string> AdditionalArgs { get; init; } = [];

	/// <summary>Include paths for the assembler.</summary>
	public List<string> IncludePaths { get; init; } = [];
}

/// <summary>
/// Interface for assembler implementations.
/// </summary>
public interface IAssembler {
	/// <summary>Name of the assembler (e.g., "ca65", "ophis").</summary>
	string Name { get; }

	/// <summary>Version string of the assembler, if available.</summary>
	string? Version { get; }

	/// <summary>
	/// Checks if the assembler is available on this system.
	/// </summary>
	Task<bool> IsAvailableAsync();

	/// <summary>
	/// Gets the path to the assembler executable.
	/// </summary>
	Task<string?> GetExecutablePathAsync();

	/// <summary>
	/// Builds a ROM using this assembler.
	/// </summary>
	/// <param name="context">Build context with all parameters.</param>
	/// <param name="progress">Optional progress reporter.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Build result.</returns>
	Task<BuildResult> BuildAsync(
		BuildContext context,
		IProgress<BuildProgress>? progress = null,
		CancellationToken cancellationToken = default
	);

	/// <summary>
	/// Gets supported file extensions for source files.
	/// </summary>
	IReadOnlyList<string> SupportedExtensions { get; }
}

/// <summary>
/// Registry of available assemblers.
/// </summary>
public interface IAssemblerRegistry {
	/// <summary>All registered assemblers.</summary>
	IReadOnlyList<IAssembler> Assemblers { get; }

	/// <summary>Gets an assembler by name.</summary>
	IAssembler? GetAssembler(string name);

	/// <summary>Gets all available (installed) assemblers.</summary>
	Task<IReadOnlyList<IAssembler>> GetAvailableAssemblersAsync();

	/// <summary>Registers a new assembler.</summary>
	void Register(IAssembler assembler);
}

/// <summary>
/// Verifies built ROMs against reference checksums.
/// </summary>
public interface IBuildVerifier {
	/// <summary>
	/// Verifies a built ROM against the project's reference ROM.
	/// </summary>
	/// <param name="builtRom">The ROM that was built.</param>
	/// <param name="project">Project containing reference checksums.</param>
	/// <returns>Verification result.</returns>
	Task<VerifyResult> VerifyAsync(byte[] builtRom, Project project);

	/// <summary>
	/// Verifies a built ROM against specific checksums.
	/// </summary>
	/// <param name="builtRom">The ROM that was built.</param>
	/// <param name="expectedChecksums">Expected checksums to verify against.</param>
	/// <returns>Verification result.</returns>
	Task<VerifyResult> VerifyAsync(byte[] builtRom, RomChecksums expectedChecksums);

	/// <summary>
	/// Compares two ROMs byte-by-byte.
	/// </summary>
	/// <param name="rom1">First ROM.</param>
	/// <param name="rom2">Second ROM.</param>
	/// <param name="maxDifferences">Maximum number of differences to report.</param>
	/// <returns>Verification result with byte differences.</returns>
	Task<VerifyResult> CompareAsync(byte[] rom1, byte[] rom2, int maxDifferences = 100);
}
