using System.Diagnostics;
using System.Text;

namespace GameInfoTools.Core.Project.Assemblers;

/// <summary>
/// Ophis assembler - Python-based 6502 assembler.
/// </summary>
public class OphisAssembler : IAssembler {
	private string? _cachedPath;
	private string? _cachedVersion;

	/// <inheritdoc/>
	public string Name => "ophis";

	/// <inheritdoc/>
	public string? Version => _cachedVersion;

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedExtensions => [".oph", ".asm", ".s"];

	/// <inheritdoc/>
	public async Task<bool> IsAvailableAsync() {
		var path = await GetExecutablePathAsync();
		return path is not null;
	}

	/// <inheritdoc/>
	public async Task<string?> GetExecutablePathAsync() {
		if (_cachedPath is not null) {
			return _cachedPath;
		}

		// Check common locations
		var candidates = new List<string>();

		if (OperatingSystem.IsWindows()) {
			// Windows - check for Python script or installed command
			candidates.AddRange([
				@"C:\Python\Scripts\ophis.exe",
				@"C:\Python311\Scripts\ophis.exe",
				@"C:\Python312\Scripts\ophis.exe",
				Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), "AppData", "Local", "Programs", "Python", "Python312", "Scripts", "ophis.exe"),
				Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), ".local", "bin", "ophis.exe")
			]);

			// Check PATH for ophis.exe or ophis.py
			var pathEnv = Environment.GetEnvironmentVariable("PATH") ?? "";
			foreach (var dir in pathEnv.Split(';')) {
				candidates.Add(Path.Combine(dir, "ophis.exe"));
				candidates.Add(Path.Combine(dir, "ophis.py"));
				candidates.Add(Path.Combine(dir, "ophis"));
			}
		} else {
			// Unix paths
			candidates.AddRange([
				"/usr/bin/ophis",
				"/usr/local/bin/ophis",
				Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), ".local", "bin", "ophis")
			]);

			// Check PATH
			var pathEnv = Environment.GetEnvironmentVariable("PATH") ?? "";
			foreach (var dir in pathEnv.Split(':')) {
				candidates.Add(Path.Combine(dir, "ophis"));
			}
		}

		// Also check pip-installed location
		try {
			var (exitCode, output, _) = await RunProcessAsync("python", "-m ophis --version", ".", default);
			if (exitCode == 0) {
				_cachedPath = "python -m ophis";
				_cachedVersion = ParseVersion(output);
				return _cachedPath;
			}
		} catch { }

		foreach (var candidate in candidates.Where(File.Exists).Distinct()) {
			try {
				var version = await GetVersionAsync(candidate);
				if (version is not null) {
					_cachedPath = candidate;
					_cachedVersion = version;
					return _cachedPath;
				}
			} catch { }
		}

		return null;
	}

	/// <inheritdoc/>
	public async Task<BuildResult> BuildAsync(
		BuildContext context,
		IProgress<BuildProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		var startTime = DateTime.UtcNow;
		var errors = new List<string>();
		var warnings = new List<string>();

		try {
			// Get assembler path
			var ophisPath = await GetExecutablePathAsync()
				?? throw new ProjectException(ProjectErrorCode.AssemblerNotFound, "Ophis not found");

			// Ensure output directory exists
			var outputDir = Path.GetDirectoryName(context.OutputPath);
			if (outputDir is not null) {
				Directory.CreateDirectory(outputDir);
			}

			progress?.Report(new BuildProgress("Assembling", context.MainSourceFile, 1, 2, 20));

			// Build arguments
			var args = BuildOphisArguments(context);

			// Determine how to run Ophis
			string fileName;
			string arguments;

			if (ophisPath.StartsWith("python")) {
				fileName = "python";
				arguments = $"-m ophis {args}";
			} else {
				fileName = ophisPath;
				arguments = args;
			}

			var sourceDir = Path.GetDirectoryName(context.MainSourceFile) ?? context.WorkingDirectory;
			var (exitCode, output, error) = await RunProcessAsync(fileName, arguments, sourceDir, cancellationToken);

			if (!string.IsNullOrEmpty(output)) {
				ParseAssemblerOutput(output, errors, warnings);
			}

			if (!string.IsNullOrEmpty(error)) {
				ParseAssemblerOutput(error, errors, warnings);
			}

			if (exitCode != 0) {
				if (errors.Count == 0) {
					errors.Add($"Ophis exited with code {exitCode}");
				}
				return new BuildResult(false, null, null, errors, warnings, DateTime.UtcNow - startTime);
			}

			progress?.Report(new BuildProgress("Finalizing", context.OutputPath, 2, 2, 90));

			// Read output
			if (!File.Exists(context.OutputPath)) {
				errors.Add($"Output file not created: {context.OutputPath}");
				return new BuildResult(false, null, null, errors, warnings, DateTime.UtcNow - startTime);
			}

			var romData = await File.ReadAllBytesAsync(context.OutputPath, cancellationToken);

			progress?.Report(new BuildProgress("Complete", context.OutputPath, 2, 2, 100));

			return new BuildResult(true, romData, context.OutputPath, errors, warnings, DateTime.UtcNow - startTime);
		} catch (OperationCanceledException) {
			throw new ProjectException(ProjectErrorCode.Cancelled, "Build cancelled");
		} catch (ProjectException) {
			throw;
		} catch (Exception ex) {
			errors.Add($"Build failed: {ex.Message}");
			return new BuildResult(false, null, null, errors, warnings, DateTime.UtcNow - startTime);
		}
	}

	private string BuildOphisArguments(BuildContext context) {
		var args = new StringBuilder();

		// Output file
		args.Append($"-o \"{context.OutputPath}\" ");

		// Add defines
		foreach (var (name, value) in context.Defines) {
			if (string.IsNullOrEmpty(value)) {
				args.Append($"-D{name} ");
			} else {
				args.Append($"-D{name}={value} ");
			}
		}

		// Add additional args
		foreach (var arg in context.AdditionalArgs) {
			args.Append($"{arg} ");
		}

		// Input file
		args.Append($"\"{context.MainSourceFile}\"");

		return args.ToString();
	}

	private static async Task<string?> GetVersionAsync(string path) {
		try {
			var (exitCode, output, _) = await RunProcessAsync(path, "--version", ".", default);
			if (exitCode == 0) {
				return ParseVersion(output);
			}
		} catch { }
		return null;
	}

	private static string? ParseVersion(string output) {
		// Ophis output: "Ophis 6502 cross-assembler, version 2.1"
		var match = System.Text.RegularExpressions.Regex.Match(output, @"version\s+(\d+\.\d+(\.\d+)?)", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
		return match.Success ? match.Groups[1].Value : "unknown";
	}

	private static async Task<(int exitCode, string output, string error)> RunProcessAsync(
		string fileName, string arguments, string workingDir, CancellationToken ct) {
		var psi = new ProcessStartInfo {
			FileName = fileName,
			Arguments = arguments,
			WorkingDirectory = workingDir,
			RedirectStandardOutput = true,
			RedirectStandardError = true,
			UseShellExecute = false,
			CreateNoWindow = true
		};

		using var process = Process.Start(psi)
			?? throw new InvalidOperationException($"Failed to start {fileName}");

		var outputTask = process.StandardOutput.ReadToEndAsync(ct);
		var errorTask = process.StandardError.ReadToEndAsync(ct);

		await process.WaitForExitAsync(ct);

		return (process.ExitCode, await outputTask, await errorTask);
	}

	private static void ParseAssemblerOutput(string output, List<string> errors, List<string> warnings) {
		foreach (var line in output.Split('\n', StringSplitOptions.RemoveEmptyEntries)) {
			var trimmed = line.Trim();
			if (trimmed.Contains("error", StringComparison.OrdinalIgnoreCase)) {
				errors.Add(trimmed);
			} else if (trimmed.Contains("warning", StringComparison.OrdinalIgnoreCase)) {
				warnings.Add(trimmed);
			}
		}
	}
}
