using System.CommandLine;
using System.CommandLine.Builder;
using System.CommandLine.Parsing;
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
		rootCommand.AddCommand(BuildInfoCommand());
		rootCommand.AddCommand(BuildListCommand());
		rootCommand.AddCommand(BuildValidateCommand());

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
}
