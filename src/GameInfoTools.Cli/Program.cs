using System.CommandLine;
using Spectre.Console;
using GameInfoTools.Core;

namespace GameInfoTools.Cli;

/// <summary>
/// GameInfo Tools - Main CLI entry point and meta-tool launcher.
/// </summary>
public class Program
{
	public static async Task<int> Main(string[] args)
	{
		var rootCommand = new RootCommand("GameInfo Tools - ROM hacking and documentation toolkit")
		{
			Name = "git"
		};

		// Add subcommands for each tool category
		rootCommand.AddCommand(CreateRomCommand());
		rootCommand.AddCommand(CreateTextCommand());
		rootCommand.AddCommand(CreateGraphicsCommand());
		rootCommand.AddCommand(CreateAnalysisCommand());
		rootCommand.AddCommand(CreateDataCommand());
		rootCommand.AddCommand(CreateDisasmCommand());
		rootCommand.AddCommand(CreateListCommand());

		// Show banner if no args
		if (args.Length == 0)
		{
			ShowBanner();
			ShowHelp();
			return 0;
		}

		return await rootCommand.InvokeAsync(args);
	}

	private static void ShowBanner()
	{
		AnsiConsole.Write(
			new FigletText("GameInfo Tools")
				.LeftJustified()
				.Color(Color.Cyan1));

		AnsiConsole.MarkupLine("[grey]ROM Hacking & Documentation Toolkit[/]");
		AnsiConsole.MarkupLine("[grey]Version 1.0.0 | .NET 9.0[/]");
		AnsiConsole.WriteLine();
	}

	private static void ShowHelp()
	{
		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Category")
			.AddColumn("Description")
			.AddColumn("Example");

		table.AddRow("[cyan]rom[/]", "ROM file operations", "git rom info game.nes");
		table.AddRow("[cyan]text[/]", "Text extraction/insertion", "git text extract game.nes");
		table.AddRow("[cyan]graphics[/]", "Graphics/tile operations", "git graphics chr game.nes");
		table.AddRow("[cyan]analysis[/]", "ROM analysis tools", "git analysis opcodes game.nes");
		table.AddRow("[cyan]data[/]", "Game data editing", "git data monsters game.nes");
		table.AddRow("[cyan]disasm[/]", "Disassembly tools", "git disasm bank game.nes 0");
		table.AddRow("[cyan]list[/]", "List available tools", "git list");

		AnsiConsole.Write(table);
		AnsiConsole.WriteLine();
		AnsiConsole.MarkupLine("Use [cyan]git <category> --help[/] for more information.");
	}

	private static Command CreateRomCommand()
	{
		var romCommand = new Command("rom", "ROM file operations");

		// rom info
		var infoCommand = new Command("info", "Display ROM information");
		var romArg = new Argument<FileInfo>("rom", "ROM file path");
		infoCommand.AddArgument(romArg);
		infoCommand.SetHandler(RomCommands.ShowInfo, romArg);
		romCommand.AddCommand(infoCommand);

		// rom checksum
		var checksumCommand = new Command("checksum", "Calculate/verify ROM checksum");
		checksumCommand.AddArgument(romArg);
		var fixOption = new Option<bool>("--fix", "Fix checksum if incorrect");
		checksumCommand.AddOption(fixOption);
		checksumCommand.SetHandler(RomCommands.Checksum, romArg, fixOption);
		romCommand.AddCommand(checksumCommand);

		// rom expand
		var expandCommand = new Command("expand", "Expand ROM size");
		expandCommand.AddArgument(romArg);
		var sizeArg = new Argument<string>("size", "New size (e.g., 512KB, 1MB)");
		expandCommand.AddArgument(sizeArg);
		expandCommand.SetHandler(RomCommands.Expand, romArg, sizeArg);
		romCommand.AddCommand(expandCommand);

		// rom header
		var headerCommand = new Command("header", "View/edit ROM header");
		headerCommand.AddArgument(romArg);
		headerCommand.SetHandler(RomCommands.Header, romArg);
		romCommand.AddCommand(headerCommand);

		return romCommand;
	}

	private static Command CreateTextCommand()
	{
		var textCommand = new Command("text", "Text extraction and insertion");

		// text extract
		var extractCommand = new Command("extract", "Extract text from ROM");
		var romArg = new Argument<FileInfo>("rom", "ROM file path");
		extractCommand.AddArgument(romArg);
		var tableOption = new Option<FileInfo?>("--table", "Table file (.tbl)");
		extractCommand.AddOption(tableOption);
		var outputOption = new Option<FileInfo?>("--output", "Output file");
		extractCommand.AddOption(outputOption);
		extractCommand.SetHandler(TextCommands.Extract, romArg, tableOption, outputOption);
		textCommand.AddCommand(extractCommand);

		// text insert
		var insertCommand = new Command("insert", "Insert text into ROM");
		insertCommand.AddArgument(romArg);
		var scriptArg = new Argument<FileInfo>("script", "Script file to insert");
		insertCommand.AddArgument(scriptArg);
		insertCommand.AddOption(tableOption);
		insertCommand.SetHandler(TextCommands.Insert, romArg, scriptArg, tableOption);
		textCommand.AddCommand(insertCommand);

		// text dte
		var dteCommand = new Command("dte", "DTE compression analysis");
		dteCommand.AddArgument(romArg);
		dteCommand.SetHandler(TextCommands.AnalyzeDte, romArg);
		textCommand.AddCommand(dteCommand);

		return textCommand;
	}

	private static Command CreateGraphicsCommand()
	{
		var graphicsCommand = new Command("graphics", "Graphics and tile operations");

		// graphics chr
		var chrCommand = new Command("chr", "Extract CHR/tile data");
		var romArg = new Argument<FileInfo>("rom", "ROM file path");
		chrCommand.AddArgument(romArg);
		var outputOption = new Option<DirectoryInfo?>("--output", "Output directory");
		chrCommand.AddOption(outputOption);
		chrCommand.SetHandler(GraphicsCommands.ExtractChr, romArg, outputOption);
		graphicsCommand.AddCommand(chrCommand);

		// graphics palette
		var paletteCommand = new Command("palette", "Extract/convert palettes");
		paletteCommand.AddArgument(romArg);
		paletteCommand.SetHandler(GraphicsCommands.ExtractPalette, romArg);
		graphicsCommand.AddCommand(paletteCommand);

		return graphicsCommand;
	}

	private static Command CreateAnalysisCommand()
	{
		var analysisCommand = new Command("analysis", "ROM analysis tools");

		// analysis opcodes
		var opcodesCommand = new Command("opcodes", "Analyze opcode usage");
		var romArg = new Argument<FileInfo>("rom", "ROM file path");
		opcodesCommand.AddArgument(romArg);
		var bankOption = new Option<int?>("--bank", "Specific bank to analyze");
		opcodesCommand.AddOption(bankOption);
		opcodesCommand.SetHandler(AnalysisCommands.Opcodes, romArg, bankOption);
		analysisCommand.AddCommand(opcodesCommand);

		// analysis compression
		var compressionCommand = new Command("compression", "Detect compression");
		compressionCommand.AddArgument(romArg);
		compressionCommand.SetHandler(AnalysisCommands.DetectCompression, romArg);
		analysisCommand.AddCommand(compressionCommand);

		// analysis xref
		var xrefCommand = new Command("xref", "Build cross-reference database");
		xrefCommand.AddArgument(romArg);
		var outputOption = new Option<FileInfo?>("--output", "Output database file");
		xrefCommand.AddOption(outputOption);
		xrefCommand.SetHandler(AnalysisCommands.BuildXref, romArg, outputOption);
		analysisCommand.AddCommand(xrefCommand);

		return analysisCommand;
	}

	private static Command CreateDataCommand()
	{
		var dataCommand = new Command("data", "Game data editing");

		// data export
		var exportCommand = new Command("export", "Export game data to JSON");
		var romArg = new Argument<FileInfo>("rom", "ROM file path");
		exportCommand.AddArgument(romArg);
		var typeArg = new Argument<string>("type", "Data type (monsters, items, spells, etc.)");
		exportCommand.AddArgument(typeArg);
		exportCommand.SetHandler(DataCommands.Export, romArg, typeArg);
		dataCommand.AddCommand(exportCommand);

		// data import
		var importCommand = new Command("import", "Import game data from JSON");
		importCommand.AddArgument(romArg);
		var jsonArg = new Argument<FileInfo>("json", "JSON file to import");
		importCommand.AddArgument(jsonArg);
		importCommand.SetHandler(DataCommands.Import, romArg, jsonArg);
		dataCommand.AddCommand(importCommand);

		return dataCommand;
	}

	private static Command CreateDisasmCommand()
	{
		var disasmCommand = new Command("disasm", "Disassembly tools");

		// disasm bank
		var bankCommand = new Command("bank", "Disassemble a bank");
		var romArg = new Argument<FileInfo>("rom", "ROM file path");
		bankCommand.AddArgument(romArg);
		var bankArg = new Argument<int>("bank", "Bank number");
		bankCommand.AddArgument(bankArg);
		bankCommand.SetHandler(DisasmCommands.Bank, romArg, bankArg);
		disasmCommand.AddCommand(bankCommand);

		// disasm labels
		var labelsCommand = new Command("labels", "Manage debug labels");
		labelsCommand.AddArgument(romArg);
		var formatOption = new Option<string>("--format", () => "mlb", "Label format (mlb, nl, sym)");
		labelsCommand.AddOption(formatOption);
		labelsCommand.SetHandler(DisasmCommands.Labels, romArg, formatOption);
		disasmCommand.AddCommand(labelsCommand);

		// disasm cdl
		var cdlCommand = new Command("cdl", "Process CDL (Code/Data Log) file");
		var cdlArg = new Argument<FileInfo>("cdl", "CDL file path");
		cdlCommand.AddArgument(cdlArg);
		cdlCommand.SetHandler(DisasmCommands.ProcessCdl, cdlArg);
		disasmCommand.AddCommand(cdlCommand);

		return disasmCommand;
	}

	private static Command CreateListCommand()
	{
		var listCommand = new Command("list", "List available tools");

		listCommand.SetHandler(() =>
		{
			var table = new Table()
				.Border(TableBorder.Rounded)
				.Title("[cyan]Available Tools[/]")
				.AddColumn("Tool")
				.AddColumn("Category")
				.AddColumn("Description");

			// ROM Tools
			table.AddRow("rom info", "ROM", "Display ROM header and metadata");
			table.AddRow("rom checksum", "ROM", "Calculate/fix ROM checksum");
			table.AddRow("rom expand", "ROM", "Expand ROM to larger size");
			table.AddRow("rom header", "ROM", "View/edit ROM header");

			// Text Tools
			table.AddRow("text extract", "Text", "Extract text using table file");
			table.AddRow("text insert", "Text", "Insert translated text");
			table.AddRow("text dte", "Text", "DTE compression analysis");

			// Graphics Tools
			table.AddRow("graphics chr", "Graphics", "Extract CHR/tile data to PNG");
			table.AddRow("graphics palette", "Graphics", "Extract/convert palettes");

			// Analysis Tools
			table.AddRow("analysis opcodes", "Analysis", "Analyze opcode usage patterns");
			table.AddRow("analysis compression", "Analysis", "Detect compression algorithms");
			table.AddRow("analysis xref", "Analysis", "Build cross-reference database");

			// Data Tools
			table.AddRow("data export", "Data", "Export game data to JSON");
			table.AddRow("data import", "Data", "Import game data from JSON");

			// Disassembly Tools
			table.AddRow("disasm bank", "Disasm", "Disassemble a ROM bank");
			table.AddRow("disasm labels", "Disasm", "Manage debug labels");
			table.AddRow("disasm cdl", "Disasm", "Process CDL files");

			AnsiConsole.Write(table);
		});

		return listCommand;
	}
}
