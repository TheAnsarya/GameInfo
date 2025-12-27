using System.CommandLine;
using DarkRepos.Core.Data;
using DarkRepos.Core.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Spectre.Console;

namespace DarkRepos.Build;

/// <summary>
/// DarkRepos CLI - Database and content management tools.
/// </summary>
public class Program {
	public static async Task<int> Main(string[] args) {
		var rootCommand = new RootCommand("DarkRepos CLI - Database and content management") {
			Name = "darkrepos"
		};

		rootCommand.AddCommand(CreateImportCommand());
		rootCommand.AddCommand(CreateSeedCommand());
		rootCommand.AddCommand(CreateInfoCommand());

		if (args.Length == 0) {
			ShowBanner();
			ShowHelp();
			return 0;
		}

		return await rootCommand.InvokeAsync(args);
	}

	private static void ShowBanner() {
		AnsiConsole.Write(
			new FigletText("DarkRepos")
				.LeftJustified()
				.Color(Color.Cyan1));

		var version = typeof(Program).Assembly.GetName().Version?.ToString(3) ?? "1.0.0";
		AnsiConsole.MarkupLine("[grey]Wiki Database & Content Management[/]");
		AnsiConsole.MarkupLine($"[grey]Version {version}[/]");
		AnsiConsole.WriteLine();
	}

	private static void ShowHelp() {
		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Command")
			.AddColumn("Description")
			.AddColumn("Example");

		table.AddRow("[cyan]import[/]", "Import games from GameInfo repository", "darkrepos import -r C:\\repos\\GameInfo");
		table.AddRow("[cyan]seed[/]", "Seed database with sample data", "darkrepos seed -d wiki.db");
		table.AddRow("[cyan]info[/]", "Show database information", "darkrepos info -d wiki.db");

		AnsiConsole.Write(table);
		AnsiConsole.WriteLine();
		AnsiConsole.MarkupLine("Use [cyan]darkrepos <command> --help[/] for more information.");
	}

	private static Command CreateImportCommand() {
		var command = new Command("import", "Import games from GameInfo repository");

		var repoOption = new Option<DirectoryInfo>(
			aliases: ["-r", "--repo"],
			description: "Path to GameInfo repository") {
			IsRequired = true
		};

		var dbOption = new Option<FileInfo>(
			aliases: ["-d", "--database"],
			description: "Path to SQLite database file",
			getDefaultValue: () => new FileInfo("wiki.db"));

		var clearOption = new Option<bool>(
			aliases: ["-c", "--clear"],
			description: "Clear existing data before import",
			getDefaultValue: () => false);

		command.AddOption(repoOption);
		command.AddOption(dbOption);
		command.AddOption(clearOption);

		command.SetHandler(async (repoPath, dbPath, clear) => await ImportFromRepository(repoPath, dbPath, clear), repoOption, dbOption, clearOption);

		return command;
	}

	private static Command CreateSeedCommand() {
		var command = new Command("seed", "Seed database with sample data");

		var dbOption = new Option<FileInfo>(
			aliases: ["-d", "--database"],
			description: "Path to SQLite database file",
			getDefaultValue: () => new FileInfo("wiki.db"));

		var clearOption = new Option<bool>(
			aliases: ["-c", "--clear"],
			description: "Clear existing data before seeding",
			getDefaultValue: () => false);

		command.AddOption(dbOption);
		command.AddOption(clearOption);

		command.SetHandler(async (dbPath, clear) => await SeedDatabase(dbPath, clear), dbOption, clearOption);

		return command;
	}

	private static Command CreateInfoCommand() {
		var command = new Command("info", "Show database information");

		var dbOption = new Option<FileInfo>(
			aliases: ["-d", "--database"],
			description: "Path to SQLite database file",
			getDefaultValue: () => new FileInfo("wiki.db"));

		command.AddOption(dbOption);

		command.SetHandler(async (dbPath) => await ShowDatabaseInfo(dbPath), dbOption);

		return command;
	}

	private static async Task ImportFromRepository(DirectoryInfo repoPath, FileInfo dbPath, bool clear) {
		AnsiConsole.MarkupLine($"[cyan]Importing from:[/] {repoPath.FullName}");
		AnsiConsole.MarkupLine($"[cyan]Database:[/] {dbPath.FullName}");

		if (!repoPath.Exists) {
			AnsiConsole.MarkupLine("[red]Error:[/] Repository path does not exist.");
			return;
		}

		await AnsiConsole.Status()
			.StartAsync("Setting up database...", async ctx => {
				var options = new DbContextOptionsBuilder<DarkReposDbContext>()
					.UseSqlite($"Data Source={dbPath.FullName}")
					.Options;

				await using var context = new DarkReposDbContext(options);
				await context.Database.EnsureCreatedAsync();

				using var loggerFactory = LoggerFactory.Create(builder => builder.SetMinimumLevel(LogLevel.Information));
				var logger = loggerFactory.CreateLogger<DatabaseSeeder>();

				var markdownService = new MarkdownService();
				var importService = new GameInfoImportService(markdownService);
				var seeder = new DatabaseSeeder(context, importService, logger);

				if (clear) {
					ctx.Status("Clearing existing data...");
					await seeder.ClearDatabaseAsync();
					AnsiConsole.MarkupLine("[yellow]Existing data cleared.[/]");
				}

				ctx.Status("Importing games...");
				var count = await seeder.SeedFromRepositoryAsync(repoPath.FullName);
				AnsiConsole.MarkupLine($"[green]Imported {count} games.[/]");
			});

		await ShowDatabaseStats(dbPath);
		AnsiConsole.MarkupLine("[green]Import completed successfully![/]");
	}

	private static async Task SeedDatabase(FileInfo dbPath, bool clear) {
		AnsiConsole.MarkupLine($"[cyan]Database:[/] {dbPath.FullName}");

		await AnsiConsole.Status()
			.StartAsync("Setting up database...", async ctx => {
				var options = new DbContextOptionsBuilder<DarkReposDbContext>()
					.UseSqlite($"Data Source={dbPath.FullName}")
					.Options;

				await using var context = new DarkReposDbContext(options);
				await context.Database.EnsureCreatedAsync();

				var seeder = new DatabaseSeeder(context);

				if (clear) {
					ctx.Status("Clearing existing data...");
					await seeder.ClearDatabaseAsync();
					AnsiConsole.MarkupLine("[yellow]Existing data cleared.[/]");
				}

				ctx.Status("Seeding sample data...");
				await seeder.SeedAsync();
			});

		await ShowDatabaseStats(dbPath);
		AnsiConsole.MarkupLine("[green]Seeding completed successfully![/]");
	}

	private static async Task ShowDatabaseInfo(FileInfo dbPath) {
		AnsiConsole.MarkupLine($"[cyan]Database:[/] {dbPath.FullName}");

		if (!dbPath.Exists) {
			AnsiConsole.MarkupLine("[yellow]Database file does not exist yet.[/]");
			return;
		}

		await ShowDatabaseStats(dbPath);
	}

	private static async Task ShowDatabaseStats(FileInfo dbPath) {
		var options = new DbContextOptionsBuilder<DarkReposDbContext>()
			.UseSqlite($"Data Source={dbPath.FullName}")
			.Options;

		await using var context = new DarkReposDbContext(options);

		var gameCount = await context.Games.CountAsync();
		var toolCount = await context.Tools.CountAsync();
		var platformCount = await context.Games.Select(g => g.Platform).Distinct().CountAsync();
		var seriesCount = await context.Games.Where(g => g.Series != null).Select(g => g.Series).Distinct().CountAsync();

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Metric")
			.AddColumn("Count");

		table.AddRow("Games", gameCount.ToString());
		table.AddRow("Tools", toolCount.ToString());
		table.AddRow("Platforms", platformCount.ToString());
		table.AddRow("Series", seriesCount.ToString());

		var fileSize = dbPath.Exists ? new FileInfo(dbPath.FullName).Length : 0;
		table.AddRow("Database Size", FormatBytes(fileSize));

		AnsiConsole.WriteLine();
		AnsiConsole.Write(table);
	}

	private static string FormatBytes(long bytes) {
		string[] sizes = ["B", "KB", "MB", "GB"];
		int order = 0;
		double size = bytes;
		while (size >= 1024 && order < sizes.Length - 1) {
			order++;
			size /= 1024;
		}

		return $"{size:0.##} {sizes[order]}";
	}
}
