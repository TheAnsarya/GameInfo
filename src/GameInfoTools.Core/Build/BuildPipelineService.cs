using System.Diagnostics;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Orchestrates the build pipeline for ROM projects
/// </summary>
public class BuildPipelineService {
	private readonly string _projectRoot;
	private readonly BuildConfig _config;
	private readonly IBuildLogger _logger;

	public BuildPipelineService(string projectRoot, BuildConfig config, IBuildLogger? logger = null) {
		_projectRoot = projectRoot;
		_config = config;
		_logger = logger ?? new ConsoleBuildLogger();
	}

	/// <summary>
	/// Load a build pipeline from a configuration file
	/// </summary>
	public static async Task<BuildPipelineService> LoadAsync(string configPath, IBuildLogger? logger = null) {
		var projectRoot = Path.GetDirectoryName(configPath)
			?? throw new ArgumentException("Invalid config path");
		var config = await BuildConfig.LoadAsync(configPath);
		return new BuildPipelineService(projectRoot, config, logger);
	}

	/// <summary>
	/// Execute the full build pipeline
	/// </summary>
	public async Task<BuildResult> BuildAsync(CancellationToken cancellationToken = default) {
		var result = new BuildResult();
		var startTime = DateTime.Now;

		try {
			_logger.Info($"Starting build for {_config.Project.Name}");
			_logger.Info($"Platform: {_config.Project.Platform}");

			// Validate configuration
			var errors = _config.Validate().ToList();
			if (errors.Count > 0) {
				foreach (var error in errors) {
					_logger.Error($"Config error: {error}");
					result.Errors.Add(error);
				}

				result.Success = false;
				return result;
			}

			// Run pre-build commands
			if (_config.Build.PreBuild?.Count > 0) {
				_logger.Info("Running pre-build commands...");
				foreach (var cmd in _config.Build.PreBuild) {
					cancellationToken.ThrowIfCancellationRequested();
					var (success, output) = await RunCommandAsync(cmd, cancellationToken);
					if (!success) {
						result.Errors.Add($"Pre-build command failed: {cmd}");
						result.Success = false;
						return result;
					}

					_logger.Debug(output);
				}
			}

			// Convert assets to binary
			if (_config.Assets.EditableDir != null && _config.Assets.BuildDir != null) {
				_logger.Info("Converting assets to binary...");
				await ConvertAssetsToBinaryAsync(cancellationToken);
			}

			// Run assembler
			_logger.Info($"Assembling with {_config.Source.Assembler}...");
			var assembleResult = await AssembleAsync(cancellationToken);
			if (!assembleResult.Success) {
				result.Errors.AddRange(assembleResult.Errors);
				result.Success = false;
				return result;
			}

			// Fix checksum if needed
			if (_config.Build.ChecksumFix) {
				_logger.Info("Fixing ROM checksum...");
				await FixChecksumAsync(cancellationToken);
			}

			// Verify against original
			if (_config.Build.Verify && _config.Source.BaseRom != null) {
				_logger.Info("Verifying ROM...");
				var verifyResult = await VerifyRomAsync(cancellationToken);
				if (!verifyResult.Success) {
					result.Warnings.AddRange(verifyResult.Warnings);
				}
			}

			// Run post-build commands
			if (_config.Build.PostBuild?.Count > 0) {
				_logger.Info("Running post-build commands...");
				foreach (var cmd in _config.Build.PostBuild) {
					cancellationToken.ThrowIfCancellationRequested();
					var (success, output) = await RunCommandAsync(cmd, cancellationToken);
					if (!success) {
						result.Warnings.Add($"Post-build command failed: {cmd}");
					}

					_logger.Debug(output);
				}
			}

			result.Success = true;
			result.OutputPath = ResolvePath(_config.Source.OutputRom);

			var elapsed = DateTime.Now - startTime;
			_logger.Info($"Build completed in {elapsed.TotalSeconds:F2}s");
			_logger.Info($"Output: {result.OutputPath}");
		} catch (OperationCanceledException) {
			result.Success = false;
			result.Errors.Add("Build cancelled");
			_logger.Warning("Build cancelled by user");
		} catch (Exception ex) {
			result.Success = false;
			result.Errors.Add($"Build failed: {ex.Message}");
			_logger.Error($"Build failed: {ex}");
		}

		return result;
	}

	/// <summary>
	/// Extract assets from the base ROM
	/// </summary>
	public async Task<ExtractionResult> ExtractAssetsAsync(CancellationToken cancellationToken = default) {
		var result = new ExtractionResult();

		if (_config.Source.BaseRom == null) {
			result.Errors.Add("No base ROM specified");
			return result;
		}

		var romPath = ResolvePath(_config.Source.BaseRom);
		if (!File.Exists(romPath)) {
			result.Errors.Add($"Base ROM not found: {romPath}");
			return result;
		}

		_logger.Info($"Extracting assets from {Path.GetFileName(romPath)}");

		var romData = await File.ReadAllBytesAsync(romPath, cancellationToken);

		if (_config.Extraction?.Assets == null || _config.Extraction.Assets.Count == 0) {
			_logger.Warning("No assets defined for extraction");
			return result;
		}

		foreach (var asset in _config.Extraction.Assets) {
			cancellationToken.ThrowIfCancellationRequested();

			try {
				_logger.Info($"Extracting {asset.Name} ({asset.Type})...");

				var outputPath = ResolvePath(asset.Output);

				// Use type-specific extractor for intelligent conversion
				var extractor = AssetExtractorFactory.GetExtractor(asset.Type, _config.Project.Platform);
				var extractResult = await extractor.ExtractAsync(
					romData,
					asset,
					outputPath,
					_config.Assets,
					cancellationToken);

				if (extractResult.Success) {
					result.ExtractedAssets.Add(asset.Name);
					_logger.Debug($"Extracted {extractResult.BytesExtracted} bytes to {extractResult.OutputPath}");

					// Log any metadata
					foreach (var (key, value) in extractResult.Metadata) {
						_logger.Debug($"  {key}: {value}");
					}
				} else {
					result.Errors.Add($"Failed to extract {asset.Name}: {extractResult.Error}");
					_logger.Error($"Failed to extract {asset.Name}: {extractResult.Error}");
				}
			} catch (Exception ex) {
				result.Errors.Add($"Failed to extract {asset.Name}: {ex.Message}");
				_logger.Error($"Failed to extract {asset.Name}: {ex}");
			}
		}

		_logger.Info($"Extracted {result.ExtractedAssets.Count} assets");
		return result;
	}

	/// <summary>
	/// Clean build artifacts
	/// </summary>
	public async Task CleanAsync(CancellationToken cancellationToken = default) {
		_logger.Info("Cleaning build artifacts...");

		var patterns = _config.Build.Clean ?? ["build/**/*"];

		foreach (var pattern in patterns) {
			cancellationToken.ThrowIfCancellationRequested();

			var fullPattern = ResolvePath(pattern);
			var directory = Path.GetDirectoryName(fullPattern) ?? _projectRoot;
			var searchPattern = Path.GetFileName(fullPattern);

			if (Directory.Exists(directory)) {
				try {
					var files = Directory.GetFiles(directory, searchPattern, SearchOption.AllDirectories);
					foreach (var file in files) {
						File.Delete(file);
						_logger.Debug($"Deleted: {file}");
					}
				} catch (Exception ex) {
					_logger.Warning($"Failed to clean {pattern}: {ex.Message}");
				}
			}
		}

		_logger.Info("Clean complete");
	}

	private async Task ConvertAssetsToBinaryAsync(CancellationToken cancellationToken) {
		var editableDir = ResolvePath(_config.Assets.EditableDir!);
		var buildDir = ResolvePath(_config.Assets.BuildDir!);

		if (!Directory.Exists(editableDir)) {
			_logger.Warning($"Editable assets directory not found: {editableDir}");
			return;
		}

		Directory.CreateDirectory(buildDir);

		// Convert all editable asset files to binary format
		var files = Directory.GetFiles(editableDir, "*.*", SearchOption.AllDirectories);
		foreach (var file in files) {
			cancellationToken.ThrowIfCancellationRequested();

			var relativePath = Path.GetRelativePath(editableDir, file);
			var ext = Path.GetExtension(file).ToLowerInvariant();

			// Determine output path (change extension to .bin for converted files)
			var destPath = ext switch {
				".png" or ".json" or ".pal" => Path.Combine(buildDir, Path.ChangeExtension(relativePath, ".bin")),
				_ => Path.Combine(buildDir, relativePath)
			};

			var destDir = Path.GetDirectoryName(destPath);
			if (destDir != null && !Directory.Exists(destDir)) {
				Directory.CreateDirectory(destDir);
			}

			try {
				// Use appropriate converter based on file type
				var converter = AssetConverterFactory.GetConverter(file);
				var result = await converter.ConvertAsync(
					file,
					destPath,
					_config.Project.Platform,
					null,
					cancellationToken);

				if (result.Success) {
					_logger.Debug($"Converted: {relativePath} -> {Path.GetFileName(destPath)} ({result.BytesGenerated} bytes)");
				} else {
					_logger.Warning($"Failed to convert {relativePath}: {result.Error}");
				}
			} catch (Exception ex) {
				_logger.Warning($"Failed to convert {relativePath}: {ex.Message}");
			}
		}
	}

	private async Task<BuildResult> AssembleAsync(CancellationToken cancellationToken) {
		var result = new BuildResult();

		var command = _config.Source.Assembler switch {
			Assembler.Ca65 => BuildCa65Command(),
			Assembler.Asar => BuildAsarCommand(),
			Assembler.Asm68k => BuildAsm68kCommand(),
			Assembler.Rgbds => BuildRgbdsCommand(),
			Assembler.DevkitArm => BuildDevkitArmCommand(),
			_ => throw new NotSupportedException($"Assembler {_config.Source.Assembler} not supported")
		};

		var (success, output) = await RunCommandAsync(command, cancellationToken);

		if (!success) {
			result.Errors.Add($"Assembly failed: {output}");
		} else {
			_logger.Debug(output);
		}

		result.Success = success;
		return result;
	}

	private string BuildCa65Command() {
		var mainFile = ResolvePath(_config.Source.MainFile);
		var outputRom = ResolvePath(_config.Source.OutputRom);
		var objFile = Path.ChangeExtension(outputRom, ".o");

		var includes = _config.Source.Includes?
			.Select(i => $"-I \"{ResolvePath(i)}\"")
			.Aggregate((a, b) => $"{a} {b}") ?? "";

		var defines = _config.Source.Defines?
			.Select(kv => $"-D {kv.Key}={kv.Value}")
			.Aggregate((a, b) => $"{a} {b}") ?? "";

		var linkerConfig = _config.Source.LinkerConfig != null
			? $"-C \"{ResolvePath(_config.Source.LinkerConfig)}\""
			: "";

		return $"ca65 {includes} {defines} -o \"{objFile}\" \"{mainFile}\" && ld65 {linkerConfig} -o \"{outputRom}\" \"{objFile}\"";
	}

	private string BuildAsarCommand() {
		var mainFile = ResolvePath(_config.Source.MainFile);
		var outputRom = ResolvePath(_config.Source.OutputRom);

		var defines = _config.Source.Defines?
			.Select(kv => $"-D{kv.Key}={kv.Value}")
			.Aggregate((a, b) => $"{a} {b}") ?? "";

		// If we have a base ROM, copy it to output first
		if (_config.Source.BaseRom != null) {
			var baseRom = ResolvePath(_config.Source.BaseRom);
			return $"copy \"{baseRom}\" \"{outputRom}\" && asar {defines} \"{mainFile}\" \"{outputRom}\"";
		}

		return $"asar {defines} \"{mainFile}\" \"{outputRom}\"";
	}

	private string BuildAsm68kCommand() {
		var mainFile = ResolvePath(_config.Source.MainFile);
		var outputRom = ResolvePath(_config.Source.OutputRom);

		var includes = _config.Source.Includes?
			.Select(i => $"/i \"{ResolvePath(i)}\"")
			.Aggregate((a, b) => $"{a} {b}") ?? "";

		return $"asm68k {includes} /p \"{mainFile}\", \"{outputRom}\"";
	}

	private string BuildRgbdsCommand() {
		var mainFile = ResolvePath(_config.Source.MainFile);
		var outputRom = ResolvePath(_config.Source.OutputRom);
		var objFile = Path.ChangeExtension(outputRom, ".o");

		var includes = _config.Source.Includes?
			.Select(i => $"-I \"{ResolvePath(i)}\"")
			.Aggregate((a, b) => $"{a} {b}") ?? "";

		var defines = _config.Source.Defines?
			.Select(kv => $"-D {kv.Key}={kv.Value}")
			.Aggregate((a, b) => $"{a} {b}") ?? "";

		return $"rgbasm {includes} {defines} -o \"{objFile}\" \"{mainFile}\" && rgblink -o \"{outputRom}\" \"{objFile}\" && rgbfix -v -p 0xFF \"{outputRom}\"";
	}

	private string BuildDevkitArmCommand() {
		var mainFile = ResolvePath(_config.Source.MainFile);
		var outputRom = ResolvePath(_config.Source.OutputRom);
		var elfFile = Path.ChangeExtension(outputRom, ".elf");
		var objFile = Path.ChangeExtension(outputRom, ".o");

		var linkerScript = _config.Source.LinkerConfig != null
			? $"-T \"{ResolvePath(_config.Source.LinkerConfig)}\""
			: "";

		return $"arm-none-eabi-gcc -mthumb -mthumb-interwork -c -o \"{objFile}\" \"{mainFile}\" && " +
			   $"arm-none-eabi-ld {linkerScript} -o \"{elfFile}\" \"{objFile}\" && " +
			   $"arm-none-eabi-objcopy -O binary \"{elfFile}\" \"{outputRom}\" && " +
			   $"gbafix \"{outputRom}\"";
	}

	private async Task FixChecksumAsync(CancellationToken cancellationToken) {
		var outputRom = ResolvePath(_config.Source.OutputRom);

		if (!File.Exists(outputRom)) {
			_logger.Warning("Output ROM not found, skipping checksum fix");
			return;
		}

		var romData = await File.ReadAllBytesAsync(outputRom, cancellationToken);

		// Platform-specific checksum calculation
		switch (_config.Project.Platform) {
			case Platform.Nes:
				// NES doesn't typically need checksum fixing
				break;
			case Platform.Snes:
				FixSnesChecksum(romData);
				break;
			case Platform.Genesis:
				FixGenesisChecksum(romData);
				break;
			case Platform.Gb:
			case Platform.Gbc:
				// RGBDS rgbfix handles this
				break;
			case Platform.Gba:
				// gbafix handles this
				break;
		}

		await File.WriteAllBytesAsync(outputRom, romData, cancellationToken);
	}

	private static void FixSnesChecksum(byte[] romData) {
		// Determine header location based on ROM mapping
		var headerOffset = romData.Length > 0x8000 && (romData[0x7FD5] & 0x01) == 0
			? 0x7FC0 // LoROM
			: 0xFFC0; // HiROM

		if (headerOffset + 0x30 > romData.Length)
			return;

		// Calculate checksum
		var checksum = 0;
		for (var i = 0; i < romData.Length; i++) {
			checksum += romData[i];
		}

		// Subtract current checksum bytes
		checksum -= romData[headerOffset + 0x2C];
		checksum -= romData[headerOffset + 0x2D];
		checksum -= romData[headerOffset + 0x2E];
		checksum -= romData[headerOffset + 0x2F];

		// Set complement and checksum
		var checksumWord = (ushort)(checksum & 0xFFFF);
		var complementWord = (ushort)(checksumWord ^ 0xFFFF);

		romData[headerOffset + 0x2C] = (byte)(complementWord & 0xFF);
		romData[headerOffset + 0x2D] = (byte)(complementWord >> 8);
		romData[headerOffset + 0x2E] = (byte)(checksumWord & 0xFF);
		romData[headerOffset + 0x2F] = (byte)(checksumWord >> 8);
	}

	private static void FixGenesisChecksum(byte[] romData) {
		if (romData.Length < 0x200)
			return;

		// Calculate checksum (sum of all words from 0x200 onwards)
		var checksum = 0;
		for (var i = 0x200; i < romData.Length - 1; i += 2) {
			checksum += (romData[i] << 8) | romData[i + 1];
		}

		// Store at 0x18E (big-endian)
		romData[0x18E] = (byte)((checksum >> 8) & 0xFF);
		romData[0x18F] = (byte)(checksum & 0xFF);
	}

	private async Task<VerificationResult> VerifyRomAsync(CancellationToken cancellationToken) {
		var result = new VerificationResult { Success = true };

		var originalPath = ResolvePath(_config.Source.BaseRom!);
		var builtPath = ResolvePath(_config.Source.OutputRom);

		if (!File.Exists(originalPath) || !File.Exists(builtPath)) {
			result.Success = false;
			result.Warnings.Add("Cannot verify: files not found");
			return result;
		}

		var originalData = await File.ReadAllBytesAsync(originalPath, cancellationToken);
		var builtData = await File.ReadAllBytesAsync(builtPath, cancellationToken);

		if (originalData.Length != builtData.Length) {
			result.Warnings.Add($"Size mismatch: original={originalData.Length}, built={builtData.Length}");
		}

		var differences = 0;
		var minLength = Math.Min(originalData.Length, builtData.Length);
		for (var i = 0; i < minLength; i++) {
			if (originalData[i] != builtData[i]) {
				differences++;
				if (differences <= 10) {
					_logger.Debug($"Difference at 0x{i:x6}: original=0x{originalData[i]:x2}, built=0x{builtData[i]:x2}");
				}
			}
		}

		if (differences > 0) {
			result.Warnings.Add($"Found {differences} byte differences");
		} else {
			_logger.Info("ROM verification passed - byte-perfect match!");
		}

		return result;
	}

	private async Task<(bool Success, string Output)> RunCommandAsync(string command, CancellationToken cancellationToken) {
		var psi = new ProcessStartInfo {
			FileName = OperatingSystem.IsWindows() ? "cmd.exe" : "/bin/bash",
			Arguments = OperatingSystem.IsWindows() ? $"/c {command}" : $"-c \"{command}\"",
			WorkingDirectory = _projectRoot,
			RedirectStandardOutput = true,
			RedirectStandardError = true,
			UseShellExecute = false,
			CreateNoWindow = true
		};

		using var process = new Process { StartInfo = psi };
		process.Start();

		var output = await process.StandardOutput.ReadToEndAsync(cancellationToken);
		var error = await process.StandardError.ReadToEndAsync(cancellationToken);

		await process.WaitForExitAsync(cancellationToken);

		var fullOutput = string.IsNullOrEmpty(error) ? output : $"{output}\n{error}";
		return (process.ExitCode == 0, fullOutput);
	}

	private string ResolvePath(string path) {
		if (Path.IsPathRooted(path))
			return path;
		return Path.Combine(_projectRoot, path);
	}
}

/// <summary>
/// Build result
/// </summary>
public class BuildResult {
	public bool Success { get; set; }
	public string? OutputPath { get; set; }
	public List<string> Errors { get; } = [];
	public List<string> Warnings { get; } = [];
}

/// <summary>
/// Asset extraction result
/// </summary>
public class ExtractionResult {
	public List<string> ExtractedAssets { get; } = [];
	public List<string> Errors { get; } = [];
}

/// <summary>
/// ROM verification result
/// </summary>
public class VerificationResult {
	public bool Success { get; set; }
	public List<string> Warnings { get; } = [];
}

/// <summary>
/// Build logging interface
/// </summary>
public interface IBuildLogger {
	void Debug(string message);
	void Info(string message);
	void Warning(string message);
	void Error(string message);
}

/// <summary>
/// Console logger implementation
/// </summary>
public class ConsoleBuildLogger : IBuildLogger {
	public void Debug(string message) => Console.WriteLine($"[DEBUG] {message}");
	public void Info(string message) => Console.WriteLine($"[INFO] {message}");
	public void Warning(string message) => Console.WriteLine($"[WARN] {message}");
	public void Error(string message) => Console.WriteLine($"[ERROR] {message}");
}
