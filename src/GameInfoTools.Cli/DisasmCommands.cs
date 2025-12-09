using System.Text;
using GameInfoTools.Core;
using GameInfoTools.Disassembly;
using Spectre.Console;

namespace GameInfoTools.Cli;

/// <summary>
/// Disassembly commands for the CLI.
/// </summary>
public static class DisasmCommands {
	/// <summary>
	/// Disassemble a specific bank from a ROM.
	/// </summary>
	public static void Bank(FileInfo romFile, int bankNum) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		AnsiConsole.Status()
			.Spinner(Spinner.Known.Dots)
			.Start($"Loading ROM...", ctx => {
				var rom = new RomFile();
				rom.Load(romFile.FullName);
				var info = rom.GetInfo();

				ctx.Status("Disassembling...");

				int bankSize = info.System switch {
					SystemType.Nes => 0x4000,
					SystemType.Snes => 0x8000,
					SystemType.GameBoy or SystemType.GameBoyColor => 0x4000,
					SystemType.GameBoyAdvance => 0x10000,
					_ => 0x4000
				};

				int offset = info.HeaderSize + (bankNum * bankSize);
				if (offset >= rom.Data.Length) {
					AnsiConsole.MarkupLine($"[red]Error: Bank {bankNum} is beyond ROM size[/]");
					return;
				}

				int length = Math.Min(bankSize, rom.Data.Length - offset);

				var disassembler = new Disassembler(rom.Data);
				var instructions = disassembler.Disassemble(offset, length);
				var result = disassembler.FormatAsText(instructions);

				// Output results
				var panel = new Panel(result) {
					Header = new PanelHeader($"Bank ${bankNum:X2} (Offset: ${offset:X6}, Length: ${length:X4})")
				};
				AnsiConsole.Write(panel);
			});
	}

	/// <summary>
	/// Manage debug labels for a ROM.
	/// </summary>
	public static void Labels(FileInfo romFile, string format) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		var labelPath = Path.ChangeExtension(romFile.FullName, $".{format}");

		if (File.Exists(labelPath)) {
			// Load and display existing labels
			AnsiConsole.MarkupLine($"[green]Loading labels from: {labelPath}[/]");

			var lines = File.ReadAllLines(labelPath);
			var table = new Table();
			table.AddColumn("Address");
			table.AddColumn("Label");
			table.AddColumn("Comment");

			int count = 0;
			foreach (var line in lines) {
				if (string.IsNullOrWhiteSpace(line) || line.StartsWith(";") || line.StartsWith("#"))
					continue;

				var parts = ParseLabelLine(line, format);
				if (parts.Address != null) {
					table.AddRow(parts.Address, parts.Label ?? "", parts.Comment ?? "");
					count++;
				}

				if (count >= 50) {
					table.AddRow("...", $"({lines.Length - 50} more)", "");
					break;
				}
			}

			AnsiConsole.Write(table);
			AnsiConsole.MarkupLine($"[blue]Total labels: {lines.Length}[/]");
		} else {
			AnsiConsole.MarkupLine($"[yellow]No label file found at: {labelPath}[/]");
			AnsiConsole.MarkupLine($"[dim]Supported formats: mlb (Mesen), nl (FCEUX), sym (generic)[/]");
		}
	}

	private static (string? Address, string? Label, string? Comment) ParseLabelLine(string line, string format) {
		try {
			switch (format.ToLowerInvariant()) {
				case "mlb":
					// MLB format: P:ADDR:LABEL or similar
					var mlbParts = line.Split(':');
					if (mlbParts.Length >= 3) {
						return (mlbParts[1], mlbParts[2], mlbParts.Length > 3 ? mlbParts[3] : null);
					}

					break;

				case "nl":
					// NL format: $ADDR#LABEL#COMMENT
					var nlParts = line.Split('#');
					if (nlParts.Length >= 2) {
						return (nlParts[0], nlParts[1], nlParts.Length > 2 ? nlParts[2] : null);
					}

					break;

				case "sym":
					// SYM format: ADDR LABEL or LABEL = ADDR
					if (line.Contains('=')) {
						var symParts = line.Split('=');
						return (symParts[1].Trim(), symParts[0].Trim(), null);
					} else {
						var symParts = line.Split(' ', 2, StringSplitOptions.RemoveEmptyEntries);
						if (symParts.Length >= 2) {
							return (symParts[0], symParts[1], null);
						}
					}

					break;
			}
		} catch {
			// Ignore parse errors
		}

		return (null, null, null);
	}

	/// <summary>
	/// Process a Code/Data Log (CDL) file.
	/// </summary>
	public static void ProcessCdl(FileInfo cdlFile) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var data = File.ReadAllBytes(cdlFile.FullName);
		AnsiConsole.MarkupLine($"[green]CDL file loaded: {cdlFile.Name}[/]");
		AnsiConsole.MarkupLine($"[blue]Size: {data.Length:N0} bytes[/]");

		// Analyze CDL data
		// CDL format typically uses bit flags per byte to indicate Code/Data/etc.
		int codeBytes = 0;
		int dataBytes = 0;
		int unknownBytes = 0;

		foreach (var b in data) {
			if (b == 0) {
				unknownBytes++;
			} else if ((b & 0x01) != 0) // Common flag for code
			  {
				codeBytes++;
			} else {
				dataBytes++;
			}
		}

		var chart = new BreakdownChart()
			.AddItem("Code", codeBytes, Color.Green)
			.AddItem("Data", dataBytes, Color.Blue)
			.AddItem("Unknown", unknownBytes, Color.Grey);

		AnsiConsole.Write(chart);

		// Summary table
		var table = new Table();
		table.AddColumn("Type");
		table.AddColumn("Bytes");
		table.AddColumn("Percentage");

		double total = data.Length;
		table.AddRow("Code", $"{codeBytes:N0}", $"{codeBytes / total:P1}");
		table.AddRow("Data", $"{dataBytes:N0}", $"{dataBytes / total:P1}");
		table.AddRow("Unknown", $"{unknownBytes:N0}", $"{unknownBytes / total:P1}");
		table.AddRow("[bold]Total[/]", $"[bold]{data.Length:N0}[/]", "[bold]100%[/]");

		AnsiConsole.Write(table);
	}
}
