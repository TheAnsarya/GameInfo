using System.CommandLine;
using GameInfoTools.Core.Build;
using Spectre.Console;

namespace GameInfoTools.Cli;

/// <summary>
/// Build pipeline CLI commands
/// </summary>
public static class BuildCommands {
	/// <summary>
	/// Create the build command with all subcommands
	/// </summary>
	public static Command CreateBuildCommand() {
		var buildCommand = new Command("build", "Build pipeline operations");

		// build project
		var projectCommand = new Command("project", "Build a project from configuration");
		var configArg = new Argument<FileInfo>("config", () => new FileInfo("build.config.json"), "Build configuration file");
		var cleanOption = new Option<bool>("--clean", "Clean before building");
		var verifyOption = new Option<bool>("--verify", () => true, "Verify against original ROM");
		projectCommand.AddArgument(configArg);
		projectCommand.AddOption(cleanOption);
		projectCommand.AddOption(verifyOption);
		projectCommand.SetHandler(BuildProjectAsync, configArg, cleanOption, verifyOption);
		buildCommand.AddCommand(projectCommand);

		// build extract
		var extractCommand = new Command("extract", "Extract assets from ROM");
		extractCommand.AddArgument(configArg);
		var assetsOption = new Option<string[]>("--assets", "Specific assets to extract (default: all)") { AllowMultipleArgumentsPerToken = true };
		extractCommand.AddOption(assetsOption);
		extractCommand.SetHandler(ExtractAssetsAsync, configArg, assetsOption);
		buildCommand.AddCommand(extractCommand);

		// build clean
		var cleanCommand = new Command("clean", "Clean build artifacts");
		cleanCommand.AddArgument(configArg);
		cleanCommand.SetHandler(CleanBuildAsync, configArg);
		buildCommand.AddCommand(cleanCommand);

		// build init
		var initCommand = new Command("init", "Initialize a new build configuration");
		var platformArg = new Argument<string>("platform", "Target platform (nes, snes, genesis, gb, gbc, gba)");
		var outputOption = new Option<FileInfo>("--output", () => new FileInfo("build.config.json"), "Output file path");
		initCommand.AddArgument(platformArg);
		initCommand.AddOption(outputOption);
		initCommand.SetHandler(InitConfigAsync, platformArg, outputOption);
		buildCommand.AddCommand(initCommand);

		// build validate
		var validateCommand = new Command("validate", "Validate a build configuration");
		validateCommand.AddArgument(configArg);
		validateCommand.SetHandler(ValidateConfigAsync, configArg);
		buildCommand.AddCommand(validateCommand);

		return buildCommand;
	}

	private static async Task BuildProjectAsync(FileInfo configFile, bool clean, bool verify) {
		if (!configFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Configuration file not found:[/] {configFile.FullName}");
			return;
		}

		var logger = new SpectreBuildLogger();

		try {
			var service = await BuildPipelineService.LoadAsync(configFile.FullName, logger);

			if (clean) {
				await service.CleanAsync();
			}

			await AnsiConsole.Status()
				.StartAsync("Building...", async ctx => {
					var result = await service.BuildAsync();

					if (result.Success) {
						AnsiConsole.MarkupLine($"[green]✓[/] Build succeeded: {result.OutputPath}");

						if (result.Warnings.Count > 0) {
							AnsiConsole.MarkupLine($"[yellow]Warnings:[/]");
							foreach (var warning in result.Warnings) {
								AnsiConsole.MarkupLine($"  [yellow]•[/] {warning}");
							}
						}
					} else {
						AnsiConsole.MarkupLine("[red]✗[/] Build failed");
						foreach (var error in result.Errors) {
							AnsiConsole.MarkupLine($"  [red]•[/] {error}");
						}
					}
				});
		} catch (Exception ex) {
			AnsiConsole.WriteException(ex);
		}
	}

	private static async Task ExtractAssetsAsync(FileInfo configFile, string[]? assets) {
		if (!configFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Configuration file not found:[/] {configFile.FullName}");
			return;
		}

		var logger = new SpectreBuildLogger();

		try {
			var service = await BuildPipelineService.LoadAsync(configFile.FullName, logger);

			await AnsiConsole.Status()
				.StartAsync("Extracting assets...", async ctx => {
					var result = await service.ExtractAssetsAsync();

					if (result.ExtractedAssets.Count > 0) {
						AnsiConsole.MarkupLine($"[green]✓[/] Extracted {result.ExtractedAssets.Count} assets:");
						foreach (var asset in result.ExtractedAssets) {
							AnsiConsole.MarkupLine($"  [cyan]•[/] {asset}");
						}
					}

					if (result.Errors.Count > 0) {
						AnsiConsole.MarkupLine("[red]Errors:[/]");
						foreach (var error in result.Errors) {
							AnsiConsole.MarkupLine($"  [red]•[/] {error}");
						}
					}
				});
		} catch (Exception ex) {
			AnsiConsole.WriteException(ex);
		}
	}

	private static async Task CleanBuildAsync(FileInfo configFile) {
		if (!configFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Configuration file not found:[/] {configFile.FullName}");
			return;
		}

		var logger = new SpectreBuildLogger();

		try {
			var service = await BuildPipelineService.LoadAsync(configFile.FullName, logger);

			await AnsiConsole.Status()
				.StartAsync("Cleaning...", async ctx => {
					await service.CleanAsync();
					AnsiConsole.MarkupLine("[green]✓[/] Clean complete");
				});
		} catch (Exception ex) {
			AnsiConsole.WriteException(ex);
		}
	}

	private static async Task InitConfigAsync(string platform, FileInfo outputFile) {
		var platformEnum = platform.ToLowerInvariant() switch {
			"nes" => Platform.Nes,
			"snes" => Platform.Snes,
			"genesis" or "megadrive" or "md" => Platform.Genesis,
			"gb" or "gameboy" => Platform.Gb,
			"gbc" => Platform.Gbc,
			"gba" => Platform.Gba,
			_ => Platform.Unknown
		};

		if (platformEnum == Platform.Unknown) {
			AnsiConsole.MarkupLine($"[red]Unknown platform:[/] {platform}");
			AnsiConsole.MarkupLine("Supported platforms: nes, snes, genesis, gb, gbc, gba");
			return;
		}

		var assembler = platformEnum switch {
			Platform.Nes => Assembler.Ca65,
			Platform.Snes => Assembler.Asar,
			Platform.Genesis => Assembler.Asm68k,
			Platform.Gb or Platform.Gbc => Assembler.Rgbds,
			Platform.Gba => Assembler.DevkitArm,
			_ => Assembler.Unknown
		};

		var extension = platformEnum switch {
			Platform.Nes => ".nes",
			Platform.Snes => ".sfc",
			Platform.Genesis => ".bin",
			Platform.Gb => ".gb",
			Platform.Gbc => ".gbc",
			Platform.Gba => ".gba",
			_ => ".bin"
		};

		var config = new BuildConfig {
			Schema = "https://gameinfo.example.com/schemas/build-config.json",
			Project = new ProjectConfig {
				Name = "My Project",
				Platform = platformEnum,
				Version = "1.0.0",
				Description = $"A {platform.ToUpperInvariant()} ROM hacking project"
			},
			Source = new SourceConfig {
				BaseRom = $"roms/original{extension}",
				Assembler = assembler,
				MainFile = "src/main.asm",
				Includes = ["src/", "include/"],
				OutputRom = $"build/game{extension}"
			},
			Assets = new AssetsConfig {
				ExtractDir = "assets/binary",
				EditableDir = "assets/json",
				BuildDir = "build/assets",
				Graphics = new GraphicsConfig {
					Format = "png",
					TileSize = [8, 8],
					DefaultBpp = platformEnum == Platform.Nes || platformEnum == Platform.Gb || platformEnum == Platform.Gbc ? 2 : 4
				},
				Palettes = new PalettesConfig {
					Format = "json",
					ColorFormat = platformEnum switch {
						Platform.Nes => ColorFormat.Indexed,
						Platform.Genesis => ColorFormat.Bgr9,
						_ => ColorFormat.Bgr15
					}
				}
			},
			Build = new BuildOptions {
				Verify = true,
				ChecksumFix = true
			}
		};

		await config.SaveAsync(outputFile.FullName);
		AnsiConsole.MarkupLine($"[green]✓[/] Created configuration: {outputFile.FullName}");
		AnsiConsole.MarkupLine($"  Platform: [cyan]{platformEnum}[/]");
		AnsiConsole.MarkupLine($"  Assembler: [cyan]{assembler}[/]");
	}

	private static async Task ValidateConfigAsync(FileInfo configFile) {
		if (!configFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Configuration file not found:[/] {configFile.FullName}");
			return;
		}

		try {
			var config = await BuildConfig.LoadAsync(configFile.FullName);
			var errors = config.Validate().ToList();

			if (errors.Count == 0) {
				AnsiConsole.MarkupLine("[green]✓[/] Configuration is valid");

				var table = new Table()
					.Border(TableBorder.Rounded)
					.AddColumn("Property")
					.AddColumn("Value");

				table.AddRow("Project", config.Project.Name);
				table.AddRow("Platform", config.Project.Platform.ToString());
				table.AddRow("Assembler", config.Source.Assembler.ToString());
				table.AddRow("Main File", config.Source.MainFile);
				table.AddRow("Output", config.Source.OutputRom);

				if (config.Source.BaseRom != null)
					table.AddRow("Base ROM", config.Source.BaseRom);

				if (config.Extraction?.Assets != null)
					table.AddRow("Assets", $"{config.Extraction.Assets.Count} defined");

				AnsiConsole.Write(table);
			} else {
				AnsiConsole.MarkupLine("[red]✗[/] Configuration has errors:");
				foreach (var error in errors) {
					AnsiConsole.MarkupLine($"  [red]•[/] {error}");
				}
			}
		} catch (Exception ex) {
			AnsiConsole.MarkupLine($"[red]Failed to parse configuration:[/] {ex.Message}");
		}
	}

	/// <summary>
	/// Spectre.Console-based build logger
	/// </summary>
	private class SpectreBuildLogger : IBuildLogger {
		public void Debug(string message) => AnsiConsole.MarkupLine($"[grey]{Markup.Escape(message)}[/]");
		public void Info(string message) => AnsiConsole.MarkupLine($"[white]{Markup.Escape(message)}[/]");
		public void Warning(string message) => AnsiConsole.MarkupLine($"[yellow]{Markup.Escape(message)}[/]");
		public void Error(string message) => AnsiConsole.MarkupLine($"[red]{Markup.Escape(message)}[/]");
	}
}
