using System.Diagnostics;
using System.Text;

namespace GameInfoTools.Core.Project.Assemblers;

/// <summary>
/// ca65/ld65 assembler from the cc65 suite.
/// </summary>
public class Ca65Assembler : IAssembler {
	private string? _cachedPath;
	private string? _cachedVersion;

	/// <inheritdoc/>
	public string Name => "ca65";

	/// <inheritdoc/>
	public string? Version => _cachedVersion;

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedExtensions => [".asm", ".s", ".inc"];

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
			// Windows paths
			candidates.AddRange([
				@"C:\cc65\bin\ca65.exe",
				@"C:\Program Files\cc65\bin\ca65.exe",
				@"C:\Program Files (x86)\cc65\bin\ca65.exe",
				Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), "cc65", "bin", "ca65.exe")
			]);

			// Check PATH
			var pathEnv = Environment.GetEnvironmentVariable("PATH") ?? "";
			foreach (var dir in pathEnv.Split(';')) {
				candidates.Add(Path.Combine(dir, "ca65.exe"));
			}
		} else {
			// Unix paths
			candidates.AddRange([
				"/usr/bin/ca65",
				"/usr/local/bin/ca65",
				Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.UserProfile), ".local", "bin", "ca65")
			]);

			// Check PATH
			var pathEnv = Environment.GetEnvironmentVariable("PATH") ?? "";
			foreach (var dir in pathEnv.Split(':')) {
				candidates.Add(Path.Combine(dir, "ca65"));
			}
		}

		foreach (var candidate in candidates.Where(File.Exists).Distinct()) {
			try {
				var version = await GetVersionAsync(candidate);
				if (version is not null) {
					_cachedPath = candidate;
					_cachedVersion = version;
					return _cachedPath;
				}
			} catch {
				// Continue checking
			}
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
			var ca65Path = await GetExecutablePathAsync()
				?? throw new ProjectException(ProjectErrorCode.AssemblerNotFound, "ca65 not found");

			var ld65Path = ca65Path.Replace("ca65", "ld65");
			if (!File.Exists(ld65Path)) {
				throw new ProjectException(ProjectErrorCode.AssemblerNotFound, "ld65 not found");
			}

			// Ensure output directory exists
			var outputDir = Path.GetDirectoryName(context.OutputPath);
			if (outputDir is not null) {
				Directory.CreateDirectory(outputDir);
			}

			// Step 1: Assemble source files
			progress?.Report(new BuildProgress("Assembling source files", context.MainSourceFile, 1, 3, 10));

			var objFiles = new List<string>();
			var sourceDir = Path.GetDirectoryName(context.MainSourceFile) ?? context.WorkingDirectory;
			var sourceFiles = Directory.GetFiles(sourceDir, "*.asm", SearchOption.AllDirectories)
				.Concat(Directory.GetFiles(sourceDir, "*.s", SearchOption.AllDirectories))
				.ToList();

			if (!sourceFiles.Any()) {
				sourceFiles.Add(context.MainSourceFile);
			}

			int fileIndex = 0;
			foreach (var sourceFile in sourceFiles) {
				cancellationToken.ThrowIfCancellationRequested();

				var objFile = Path.ChangeExtension(sourceFile, ".o");
				objFiles.Add(objFile);

				var ca65Args = BuildCa65Arguments(sourceFile, objFile, context);
				var (ca65Exit, ca65Output, ca65Error) = await RunProcessAsync(ca65Path, ca65Args, sourceDir, cancellationToken);

				if (ca65Exit != 0) {
					errors.Add($"ca65 failed for {Path.GetFileName(sourceFile)}: {ca65Error}");
					// Continue to collect all errors
				}

				if (!string.IsNullOrEmpty(ca65Error)) {
					ParseAssemblerOutput(ca65Error, errors, warnings);
				}

				fileIndex++;
				progress?.Report(new BuildProgress(
					"Assembling",
					Path.GetFileName(sourceFile),
					1, 3,
					10 + (40.0 * fileIndex / sourceFiles.Count)
				));
			}

			if (errors.Count > 0) {
				return new BuildResult(false, null, null, errors, warnings, DateTime.UtcNow - startTime);
			}

			// Step 2: Link object files
			progress?.Report(new BuildProgress("Linking", context.OutputPath, 2, 3, 60));

			var cfgFile = FindConfigFile(context);
			var ld65Args = BuildLd65Arguments(objFiles, context.OutputPath, cfgFile, context);
			var (ld65Exit, ld65Output, ld65Error) = await RunProcessAsync(ld65Path, ld65Args, sourceDir, cancellationToken);

			if (ld65Exit != 0) {
				errors.Add($"ld65 failed: {ld65Error}");
				return new BuildResult(false, null, null, errors, warnings, DateTime.UtcNow - startTime);
			}

			if (!string.IsNullOrEmpty(ld65Error)) {
				ParseAssemblerOutput(ld65Error, errors, warnings);
			}

			// Step 3: Read output ROM
			progress?.Report(new BuildProgress("Finalizing", context.OutputPath, 3, 3, 90));

			if (!File.Exists(context.OutputPath)) {
				errors.Add($"Output file not created: {context.OutputPath}");
				return new BuildResult(false, null, null, errors, warnings, DateTime.UtcNow - startTime);
			}

			var romData = await File.ReadAllBytesAsync(context.OutputPath, cancellationToken);

			// Cleanup object files
			foreach (var objFile in objFiles.Where(File.Exists)) {
				try { File.Delete(objFile); } catch { }
			}

			progress?.Report(new BuildProgress("Complete", context.OutputPath, 3, 3, 100));

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

	private static string BuildCa65Arguments(string sourceFile, string objFile, BuildContext context) {
		var args = new StringBuilder();
		args.Append($"-o \"{objFile}\" ");

		// Add include paths
		foreach (var includePath in context.IncludePaths) {
			args.Append($"-I \"{includePath}\" ");
		}

		// Add defines
		foreach (var (name, value) in context.Defines) {
			if (string.IsNullOrEmpty(value)) {
				args.Append($"-D {name} ");
			} else {
				args.Append($"-D {name}={value} ");
			}
		}

		// Add additional args
		foreach (var arg in context.AdditionalArgs.Where(a => !a.StartsWith("-l"))) {
			args.Append($"{arg} ");
		}

		args.Append($"\"{sourceFile}\"");
		return args.ToString();
	}

	private static string BuildLd65Arguments(List<string> objFiles, string outputPath, string? cfgFile, BuildContext context) {
		var args = new StringBuilder();
		args.Append($"-o \"{outputPath}\" ");

		if (cfgFile is not null) {
			args.Append($"-C \"{cfgFile}\" ");
		}

		// Add linker args
		foreach (var arg in context.AdditionalArgs.Where(a => a.StartsWith("-l") || a.StartsWith("-L"))) {
			args.Append($"{arg} ");
		}

		foreach (var objFile in objFiles) {
			args.Append($"\"{objFile}\" ");
		}

		return args.ToString().TrimEnd();
	}

	private static string? FindConfigFile(BuildContext context) {
		// Look for .cfg file in source directory
		var sourceDir = Path.GetDirectoryName(context.MainSourceFile) ?? context.WorkingDirectory;

		var cfgFiles = Directory.GetFiles(sourceDir, "*.cfg", SearchOption.AllDirectories);
		if (cfgFiles.Length > 0) {
			// Prefer one matching the game name
			var gameName = context.Project.Metadata.Game.Id;
			var match = cfgFiles.FirstOrDefault(f =>
				Path.GetFileNameWithoutExtension(f).Contains(gameName, StringComparison.OrdinalIgnoreCase));

			return match ?? cfgFiles[0];
		}

		return null;
	}

	private static async Task<string?> GetVersionAsync(string path) {
		try {
			var psi = new ProcessStartInfo {
				FileName = path,
				Arguments = "--version",
				RedirectStandardOutput = true,
				RedirectStandardError = true,
				UseShellExecute = false,
				CreateNoWindow = true
			};

			using var process = Process.Start(psi);
			if (process is null) return null;

			var output = await process.StandardOutput.ReadToEndAsync();
			await process.WaitForExitAsync();

			// Parse version from output like "ca65 V2.19 - Ubuntu 2.19-1"
			var match = System.Text.RegularExpressions.Regex.Match(output, @"V?(\d+\.\d+(\.\d+)?)");
			return match.Success ? match.Groups[1].Value : "unknown";
		} catch {
			return null;
		}
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
			if (line.Contains("error:", StringComparison.OrdinalIgnoreCase) ||
				line.Contains("Error:", StringComparison.OrdinalIgnoreCase)) {
				errors.Add(line.Trim());
			} else if (line.Contains("warning:", StringComparison.OrdinalIgnoreCase) ||
				line.Contains("Warning:", StringComparison.OrdinalIgnoreCase)) {
				warnings.Add(line.Trim());
			}
		}
	}
}
