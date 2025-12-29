using System.CommandLine;
using System.CommandLine.Builder;
using System.CommandLine.Parsing;
using System.IO.Compression;
using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Cli;

/// <summary>
/// TAS Converter CLI entry point.
/// </summary>
public static class Program {
	public static async Task<int> Main(string[] args) {
		// Register all default formats
		DefaultFormats.Register();

		// Build command tree
		var rootCommand = BuildRootCommand();

		// Build parser with middleware
		var parser = new CommandLineBuilder(rootCommand)
			.UseDefaults()
			.UseExceptionHandler((ex, context) => {
				Console.ForegroundColor = ConsoleColor.Red;
				Console.Error.WriteLine($"Error: {ex.Message}");
				Console.ResetColor();

				if (Environment.GetEnvironmentVariable("TAS_DEBUG") == "1") {
					Console.Error.WriteLine(ex.StackTrace);
				}
			})
			.Build();

		return await parser.InvokeAsync(args);
	}

	private static RootCommand BuildRootCommand() {
		var rootCommand = new RootCommand("TAS Replay File Format Converter");

		rootCommand.AddCommand(BuildConvertCommand());
		rootCommand.AddCommand(BuildBatchConvertCommand());
		rootCommand.AddCommand(BuildInfoCommand());
		rootCommand.AddCommand(BuildListCommand());
		rootCommand.AddCommand(BuildValidateCommand());
		rootCommand.AddCommand(BuildDownloadCommand());

		return rootCommand;
	}

	private static Command BuildConvertCommand() {
		var inputArg = new Argument<FileInfo>("input", "Input TAS file path");
		var outputArg = new Argument<FileInfo>("output", "Output TAS file path");

		var formatOption = new Option<string?>(
			["--format", "-f"],
			"Target format (auto-detected from extension if not specified)");

		var forceOption = new Option<bool>(
			["--force", "-y"],
			"Overwrite output file if it exists");

		var stripSavestateOption = new Option<bool>(
			"--strip-savestate",
			"Remove embedded savestate from output");

		var stripSramOption = new Option<bool>(
			"--strip-sram",
			"Remove embedded SRAM from output");

		var command = new Command("convert", "Convert TAS file to another format") {
			inputArg,
			outputArg,
			formatOption,
			forceOption,
			stripSavestateOption,
			stripSramOption,
		};

		command.SetHandler(async (input, output, format, force, stripSavestate, stripSram) => {
			await ConvertAsync(input, output, format, force, stripSavestate, stripSram);
		}, inputArg, outputArg, formatOption, forceOption, stripSavestateOption, stripSramOption);

		return command;
	}

	private static Command BuildBatchConvertCommand() {
		var inputDirArg = new Argument<DirectoryInfo>("input-dir", "Input directory containing TAS files");
		var outputDirArg = new Argument<DirectoryInfo>("output-dir", "Output directory for converted files");

		var formatOption = new Option<string>(
			["--format", "-f"],
			"Target format (required)") { IsRequired = true };

		var patternOption = new Option<string>(
			["--pattern", "-p"],
			() => "*.*",
			"File pattern to match (e.g., *.smv, *.bk2)");

		var recursiveOption = new Option<bool>(
			["--recursive", "-r"],
			"Include subdirectories");

		var forceOption = new Option<bool>(
			["--force", "-y"],
			"Overwrite existing output files");

		var continueOnErrorOption = new Option<bool>(
			["--continue-on-error"],
			"Continue processing remaining files if one fails");

		var command = new Command("batch", "Batch convert multiple TAS files") {
			inputDirArg,
			outputDirArg,
			formatOption,
			patternOption,
			recursiveOption,
			forceOption,
			continueOnErrorOption,
		};

		command.SetHandler(async (inputDir, outputDir, format, pattern, recursive, force, continueOnError) => {
			await BatchConvertAsync(inputDir, outputDir, format, pattern, recursive, force, continueOnError);
		}, inputDirArg, outputDirArg, formatOption, patternOption, recursiveOption, forceOption, continueOnErrorOption);

		return command;
	}

	private static Command BuildDownloadCommand() {
		var outputDirOption = new Option<DirectoryInfo?>(
			["--output", "-o"],
			"Output directory (defaults to ~tas-files in repo root)");

		var formatOption = new Option<string?>(
			["--format", "-f"],
			"Only download files of this format (smv, bk2, lsmv, fm2, vbm)");

		var gameOption = new Option<string?>(
			["--game", "-g"],
			"Only download files for games matching this string");

		var forceOption = new Option<bool>(
			["--force", "-y"],
			"Re-download files even if they exist");

		var dryRunOption = new Option<bool>(
			["--dry-run", "-n"],
			"Show what would be downloaded without downloading");

		var command = new Command("download", "Download TAS test files from TASVideos.org") {
			outputDirOption,
			formatOption,
			gameOption,
			forceOption,
			dryRunOption,
		};

		command.SetHandler(async (outputDir, format, game, force, dryRun) => {
			await DownloadTasFilesAsync(outputDir, format, game, force, dryRun);
		}, outputDirOption, formatOption, gameOption, forceOption, dryRunOption);

		return command;
	}

	private static Command BuildInfoCommand() {
		var inputArg = new Argument<FileInfo>("input", "TAS file to analyze");

		var jsonOption = new Option<bool>(
			["--json", "-j"],
			"Output as JSON");

		var command = new Command("info", "Display information about a TAS file") {
			inputArg,
			jsonOption,
		};

		command.SetHandler(async (input, json) => {
			await ShowInfoAsync(input, json);
		}, inputArg, jsonOption);

		return command;
	}

	private static Command BuildListCommand() {
		var systemOption = new Option<string?>(
			["--system", "-s"],
			"Filter formats by system (nes, snes, gb, gba)");

		var command = new Command("list", "List supported TAS formats") {
			systemOption,
		};

		command.SetHandler((system) => {
			ListFormats(system);
		}, systemOption);

		return command;
	}

	private static Command BuildValidateCommand() {
		var inputArg = new Argument<FileInfo>("input", "TAS file to validate");

		var command = new Command("validate", "Validate a TAS file") {
			inputArg,
		};

		command.SetHandler(async (input) => {
			await ValidateAsync(input);
		}, inputArg);

		return command;
	}

	private static async Task ConvertAsync(
		FileInfo input,
		FileInfo output,
		string? format,
		bool force,
		bool stripSavestate,
		bool stripSram) {
		// Check input exists
		if (!input.Exists) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Error: Input file not found: {input.FullName}");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		// Check output doesn't exist (unless force)
		if (output.Exists && !force) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Error: Output file already exists: {output.FullName}");
			Console.Error.WriteLine("Use --force to overwrite.");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		// Get target format
		ITasFormat? targetFormat = null;
		if (!string.IsNullOrEmpty(format)) {
			targetFormat = TasFormatRegistry.Instance.GetByName(format);
			if (targetFormat is null) {
				Console.ForegroundColor = ConsoleColor.Red;
				Console.Error.WriteLine($"Error: Unknown format: {format}");
				Console.ResetColor();
				Environment.ExitCode = 1;
				return;
			}
		}

		// Convert
		var converter = new TasConverter();
		var options = new ConversionOptions {
			IncludeSavestate = !stripSavestate,
			IncludeSram = !stripSram,
		};

		var progress = new Progress<ConversionProgress>(p => {
			Console.Write($"\r{p.Stage}: {p.Percent}%   ");
		});

		Console.WriteLine($"Converting: {input.Name} -> {output.Name}");
		var result = await converter.ConvertAsync(
			input.FullName,
			output.FullName,
			targetFormat,
			options,
			progress);

		Console.WriteLine();

		if (result.Success) {
			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine($"Success!");
			Console.ResetColor();
			Console.WriteLine($"  Source format: {result.SourceFormat}");
			Console.WriteLine($"  Target format: {result.TargetFormat}");
			Console.WriteLine($"  Frames: {result.FrameCount:N0}");
			Console.WriteLine($"  Output size: {result.OutputSize:N0} bytes");
			Console.WriteLine($"  Duration: {result.Duration.TotalMilliseconds:F1}ms");

			foreach (var warning in result.Warnings) {
				Console.ForegroundColor = ConsoleColor.Yellow;
				Console.WriteLine($"  Warning: {warning}");
				Console.ResetColor();
			}
		} else {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Conversion failed: {result.Error}");
			Console.ResetColor();
			Environment.ExitCode = 1;
		}
	}

	private static async Task ShowInfoAsync(FileInfo input, bool json) {
		if (!input.Exists) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Error: File not found: {input.FullName}");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		var converter = new TasConverter();
		var info = await converter.GetInfoAsync(input.FullName);

		if (json) {
			var options = new System.Text.Json.JsonSerializerOptions {
				WriteIndented = true,
				PropertyNamingPolicy = System.Text.Json.JsonNamingPolicy.CamelCase,
			};
			Console.WriteLine(System.Text.Json.JsonSerializer.Serialize(info, options));
		} else {
			Console.WriteLine($"File: {info.FileName}");
			Console.WriteLine($"Size: {info.FileSize:N0} bytes");
			Console.WriteLine();
			Console.WriteLine($"Format: {info.FormatName ?? "Unknown"}");
			Console.WriteLine($"Emulator: {info.EmulatorName ?? "Unknown"}");
			Console.WriteLine($"System: {info.System.GetDisplayName()}");
			Console.WriteLine();
			Console.WriteLine($"Frames: {info.FrameCount:N0}");
			Console.WriteLine($"Controllers: {info.ControllerCount}");

			if (info.Duration.HasValue) {
				Console.WriteLine($"Duration: {info.Duration.Value:hh\\:mm\\:ss\\.fff}");
			}

			Console.WriteLine($"Has Savestate: {info.HasSavestate}");
			Console.WriteLine($"Has SRAM: {info.HasSram}");

			if (info.Metadata is not null) {
				Console.WriteLine();
				Console.WriteLine("Metadata:");
				if (!string.IsNullOrEmpty(info.Metadata.Title)) {
					Console.WriteLine($"  Title: {info.Metadata.Title}");
				}
				if (!string.IsNullOrEmpty(info.Metadata.Author)) {
					Console.WriteLine($"  Author: {info.Metadata.Author}");
				}
				if (!string.IsNullOrEmpty(info.Metadata.RomName)) {
					Console.WriteLine($"  ROM: {info.Metadata.RomName}");
				}
				if (info.Metadata.RerecordCount > 0) {
					Console.WriteLine($"  Rerecords: {info.Metadata.RerecordCount:N0}");
				}
				Console.WriteLine($"  Region: {info.Metadata.Region}");
				Console.WriteLine($"  Start Type: {info.Metadata.StartType}");
			}
		}
	}

	private static void ListFormats(string? system) {
		var formats = TasFormatRegistry.Instance.Formats;

		// Filter by system if specified
		if (!string.IsNullOrEmpty(system)) {
			var targetSystem = system.ToLowerInvariant() switch {
				"nes" => GameSystem.Nes,
				"snes" => GameSystem.Snes,
				"gb" or "gameboy" => GameSystem.GameBoy,
				"gbc" => GameSystem.GameBoyColor,
				"gba" => GameSystem.GameBoyAdvance,
				"genesis" or "gen" => GameSystem.Genesis,
				"n64" => GameSystem.N64,
				_ => GameSystem.Unknown,
			};

			if (targetSystem == GameSystem.Unknown) {
				Console.ForegroundColor = ConsoleColor.Yellow;
				Console.WriteLine($"Warning: Unknown system '{system}'");
				Console.ResetColor();
			} else {
				formats = TasFormatRegistry.Instance.GetBySystem(targetSystem);
			}
		}

		Console.WriteLine("Supported TAS Formats:");
		Console.WriteLine("═══════════════════════════════════════════════════════════════");
		Console.WriteLine();

		foreach (var format in formats.OrderBy(f => f.Name)) {
			Console.ForegroundColor = ConsoleColor.Cyan;
			Console.Write($"{format.Name,-8}");
			Console.ResetColor();

			Console.Write($" ({format.EmulatorName})");
			Console.WriteLine();

			Console.WriteLine($"         {format.Description}");
			Console.Write("         Extensions: ");
			Console.ForegroundColor = ConsoleColor.Yellow;
			Console.WriteLine(string.Join(", ", format.Extensions.Select(e => $".{e}")));
			Console.ResetColor();

			Console.Write("         Systems: ");
			Console.WriteLine(string.Join(", ", format.SupportedSystems.Select(s => s.GetDisplayName())));

			Console.Write("         Capabilities: ");
			var caps = new List<string>();
			if (format.CanRead) caps.Add("Read");
			if (format.CanWrite) caps.Add("Write");
			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine(string.Join(", ", caps));
			Console.ResetColor();

			Console.WriteLine();
		}

		Console.WriteLine($"Total: {formats.Count} format(s)");
	}

	private static async Task ValidateAsync(FileInfo input) {
		if (!input.Exists) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Error: File not found: {input.FullName}");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		Console.WriteLine($"Validating: {input.Name}");

		// Try to detect format
		var format = TasFormatRegistry.Instance.DetectFormat(input.FullName);
		if (format is null) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine("Failed: Could not detect file format.");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		Console.WriteLine($"  Detected format: {format.Name}");

		// Try to read the file
		try {
			await using var stream = File.OpenRead(input.FullName);
			var movie = await format.ReadAsync(stream);

			Console.ForegroundColor = ConsoleColor.Green;
			Console.WriteLine("Valid!");
			Console.ResetColor();

			Console.WriteLine($"  Frames: {movie.Frames.Count:N0}");
			Console.WriteLine($"  Controllers: {movie.Controllers.Count}");
			Console.WriteLine($"  System: {movie.System.GetDisplayName()}");

			// Check for potential issues
			var issues = new List<string>();

			if (movie.Frames.Count == 0) {
				issues.Add("Movie has no frames");
			}

			if (movie.Controllers.Count == 0) {
				issues.Add("No controllers defined");
			}

			if (movie.Metadata.StartType == MovieStartType.Savestate && movie.SavestateData is null) {
				issues.Add("Movie starts from savestate but no savestate data found");
			}

			if (issues.Count > 0) {
				Console.ForegroundColor = ConsoleColor.Yellow;
				Console.WriteLine();
				Console.WriteLine("Warnings:");
				foreach (var issue in issues) {
					Console.WriteLine($"  - {issue}");
				}
				Console.ResetColor();
			}
		} catch (Exception ex) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Invalid: {ex.Message}");
			Console.ResetColor();
			Environment.ExitCode = 1;
		}
	}

	private static async Task BatchConvertAsync(
		DirectoryInfo inputDir,
		DirectoryInfo outputDir,
		string format,
		string pattern,
		bool recursive,
		bool force,
		bool continueOnError) {
		// Validate input directory
		if (!inputDir.Exists) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Error: Input directory not found: {inputDir.FullName}");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		// Get target format
		var targetFormat = TasFormatRegistry.Instance.GetByName(format);
		if (targetFormat is null) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine($"Error: Unknown target format: {format}");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		// Create output directory
		outputDir.Create();

		// Find input files
		var searchOption = recursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
		var inputFiles = inputDir.GetFiles(pattern, searchOption)
			.Where(f => TasFormatRegistry.Instance.DetectFormat(f.FullName) is not null)
			.ToList();

		if (inputFiles.Count == 0) {
			Console.ForegroundColor = ConsoleColor.Yellow;
			Console.WriteLine($"No TAS files found matching pattern '{pattern}' in {inputDir.FullName}");
			Console.ResetColor();
			return;
		}

		Console.WriteLine($"Found {inputFiles.Count} TAS file(s) to convert");
		Console.WriteLine($"Target format: {targetFormat.Name}");
		Console.WriteLine();

		var converter = new TasConverter();
		var options = new ConversionOptions();
		var targetExt = targetFormat.Extensions.First();

		var converted = 0;
		var skipped = 0;
		var failed = 0;

		foreach (var inputFile in inputFiles) {
			var outputName = Path.ChangeExtension(inputFile.Name, targetExt);
			var outputPath = Path.Combine(outputDir.FullName, outputName);

			Console.Write($"Converting: {inputFile.Name} -> {outputName}... ");

			// Check if output exists
			if (!force && File.Exists(outputPath)) {
				Console.ForegroundColor = ConsoleColor.Yellow;
				Console.WriteLine("SKIPPED (exists)");
				Console.ResetColor();
				skipped++;
				continue;
			}

			try {
				var result = await converter.ConvertAsync(
					inputFile.FullName,
					outputPath,
					targetFormat,
					options);

				if (result.Success) {
					Console.ForegroundColor = ConsoleColor.Green;
					Console.WriteLine($"OK ({result.FrameCount:N0} frames)");
					Console.ResetColor();
					converted++;
				} else {
					Console.ForegroundColor = ConsoleColor.Red;
					Console.WriteLine($"FAILED: {result.Error}");
					Console.ResetColor();
					failed++;

					if (!continueOnError) {
						Environment.ExitCode = 1;
						break;
					}
				}
			} catch (Exception ex) {
				Console.ForegroundColor = ConsoleColor.Red;
				Console.WriteLine($"ERROR: {ex.Message}");
				Console.ResetColor();
				failed++;

				if (!continueOnError) {
					Environment.ExitCode = 1;
					break;
				}
			}
		}

		// Summary
		Console.WriteLine();
		Console.WriteLine("═══════════════════════════════════════════════════════════════");
		Console.WriteLine($"Converted: {converted}");
		Console.WriteLine($"Skipped:   {skipped}");
		Console.WriteLine($"Failed:    {failed}");

		if (failed > 0) {
			Environment.ExitCode = 1;
		}
	}

	private static async Task DownloadTasFilesAsync(
		DirectoryInfo? outputDir,
		string? format,
		string? game,
		bool force,
		bool dryRun) {
		// Find tas-info.json
		var tasInfoPath = FindTasInfoPath();
		if (tasInfoPath is null) {
			Console.ForegroundColor = ConsoleColor.Red;
			Console.Error.WriteLine("Error: Could not find tas-info.json");
			Console.Error.WriteLine("Expected at: <repo>/~tas-files/tas-info.json");
			Console.ResetColor();
			Environment.ExitCode = 1;
			return;
		}

		// Parse manifest
		var tasInfo = await System.Text.Json.JsonSerializer.DeserializeAsync<TasInfoManifest>(
			File.OpenRead(tasInfoPath),
			new System.Text.Json.JsonSerializerOptions { PropertyNameCaseInsensitive = true });

		if (tasInfo?.Files is null || tasInfo.Files.Count == 0) {
			Console.ForegroundColor = ConsoleColor.Yellow;
			Console.WriteLine("No files found in tas-info.json");
			Console.ResetColor();
			return;
		}

		// Set output directories
		var tasDir = outputDir?.FullName ?? Path.GetDirectoryName(tasInfoPath)!;
		var compressedDir = Path.Combine(tasDir, "compressed");
		var uncompressedDir = Path.Combine(tasDir, "uncompressed");

		if (!dryRun) {
			Directory.CreateDirectory(compressedDir);
			Directory.CreateDirectory(uncompressedDir);
		}

		Console.WriteLine($"TAS Files Directory: {tasDir}");
		Console.WriteLine($"Total files in manifest: {tasInfo.Files.Count}");
		Console.WriteLine();

		// Filter files
		var files = tasInfo.Files.AsEnumerable();

		if (!string.IsNullOrEmpty(format)) {
			files = files.Where(f => f.Format?.Equals(format, StringComparison.OrdinalIgnoreCase) == true);
			Console.WriteLine($"Filtered to {format.ToUpper()} files");
		}

		if (!string.IsNullOrEmpty(game)) {
			files = files.Where(f => f.Game?.Contains(game, StringComparison.OrdinalIgnoreCase) == true);
			Console.WriteLine($"Filtered to files matching '{game}'");
		}

		var fileList = files.ToList();
		if (fileList.Count == 0) {
			Console.WriteLine("No files to download.");
			return;
		}

		Console.WriteLine();

		using var httpClient = new HttpClient();
		httpClient.DefaultRequestHeaders.Add("User-Agent", "GameInfo-TAS-Downloader/1.0");

		var downloaded = 0;
		var skipped = 0;
		var failed = 0;
		var extracted = 0;

		for (var i = 0; i < fileList.Count; i++) {
			var file = fileList[i];
			var fileName = file.File ?? "";
			var movieId = file.MovieId ?? "";

			if (string.IsNullOrEmpty(fileName) || string.IsNullOrEmpty(movieId)) {
				skipped++;
				continue;
			}

			Console.WriteLine($"[{i + 1}/{fileList.Count}] {file.Game} ({file.Format?.ToUpper()})");

			var zipFileName = Path.ChangeExtension(fileName, ".zip");
			var zipPath = Path.Combine(compressedDir, zipFileName);
			var uncompressedPath = Path.Combine(uncompressedDir, fileName);

			// Check if already exists
			if (!force && File.Exists(uncompressedPath)) {
				Console.WriteLine($"  Skipped: {fileName} already exists");
				skipped++;
				continue;
			}

			// Download URL
			var downloadUrl = $"https://tasvideos.org/{movieId}?handler=Download";

			if (dryRun) {
				Console.WriteLine($"  [DRY RUN] Would download: {downloadUrl}");
				downloaded++;
				continue;
			}

			try {
				Console.WriteLine($"  Downloading from {downloadUrl}");
				var response = await httpClient.GetAsync(downloadUrl);

				if (response.IsSuccessStatusCode) {
					var data = await response.Content.ReadAsByteArrayAsync();
					await File.WriteAllBytesAsync(zipPath, data);

					// Extract ZIP
					try {
						using var archive = System.IO.Compression.ZipFile.OpenRead(zipPath);
						foreach (var entry in archive.Entries) {
							if (!string.IsNullOrEmpty(entry.Name) && !entry.FullName.EndsWith('/')) {
								var destPath = Path.Combine(uncompressedDir, entry.Name);
								entry.ExtractToFile(destPath, overwrite: true);
								Console.WriteLine($"  Extracted: {entry.Name}");
								extracted++;
							}
						}
					} catch (Exception ex) {
						Console.ForegroundColor = ConsoleColor.Yellow;
						Console.WriteLine($"  Warning: Could not extract {zipFileName}: {ex.Message}");
						Console.ResetColor();
					}

					downloaded++;
				} else {
					Console.ForegroundColor = ConsoleColor.Red;
					Console.WriteLine($"  HTTP Error: {response.StatusCode}");
					Console.ResetColor();
					failed++;
				}

				// Rate limiting
				if (i < fileList.Count - 1) {
					await Task.Delay(500);
				}
			} catch (Exception ex) {
				Console.ForegroundColor = ConsoleColor.Red;
				Console.WriteLine($"  Error: {ex.Message}");
				Console.ResetColor();
				failed++;
			}
		}

		// Summary
		Console.WriteLine();
		Console.WriteLine("═══════════════════════════════════════════════════════════════");
		Console.WriteLine($"Downloaded: {downloaded}");
		Console.WriteLine($"Extracted:  {extracted}");
		Console.WriteLine($"Skipped:    {skipped}");
		Console.WriteLine($"Failed:     {failed}");

		if (failed > 0) {
			Environment.ExitCode = 1;
		}
	}

	private static string? FindTasInfoPath() {
		// Search for tas-info.json in expected locations
		var searchPaths = new[] {
			"~tas-files/tas-info.json",
			"../~tas-files/tas-info.json",
			"../../~tas-files/tas-info.json",
			"../../../~tas-files/tas-info.json",
			"../../../../~tas-files/tas-info.json",
		};

		foreach (var relativePath in searchPaths) {
			var fullPath = Path.GetFullPath(relativePath);
			if (File.Exists(fullPath)) {
				return fullPath;
			}
		}

		// Also check from assembly location
		var assemblyDir = Path.GetDirectoryName(typeof(Program).Assembly.Location) ?? ".";
		for (var i = 0; i < 6; i++) {
			var testPath = Path.Combine(assemblyDir, "~tas-files", "tas-info.json");
			if (File.Exists(testPath)) {
				return testPath;
			}
			assemblyDir = Path.GetDirectoryName(assemblyDir) ?? ".";
		}

		return null;
	}

	// Helper classes for JSON deserialization
	private class TasInfoManifest {
		public string? Description { get; set; }
		public string? DownloadDate { get; set; }
		public string? Source { get; set; }
		public int TotalFiles { get; set; }
		public List<TasFileEntry>? Files { get; set; }
	}

	private class TasFileEntry {
		public string? Game { get; set; }
		public string? System { get; set; }
		public string? Format { get; set; }
		public string? File { get; set; }
		public string? Link { get; set; }
		public string? MovieId { get; set; }
		public string? Author { get; set; }
		public string? Duration { get; set; }
		public string? Category { get; set; }
	}
}
