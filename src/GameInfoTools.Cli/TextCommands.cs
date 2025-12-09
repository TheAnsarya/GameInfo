using Spectre.Console;
using GameInfoTools.Core;

namespace GameInfoTools.Cli;

/// <summary>
/// Text extraction and insertion commands.
/// </summary>
public static class TextCommands
{
	public static void Extract(FileInfo romFile, FileInfo? tableFile, FileInfo? outputFile)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Extracting text from {romFile.Name}...[/]");

		// Load table file if provided
		Dictionary<byte, string>? table = null;
		if (tableFile?.Exists == true)
		{
			table = LoadTableFile(tableFile.FullName);
			AnsiConsole.MarkupLine($"[green]Loaded table with {table.Count} entries[/]");
		}
		else
		{
			AnsiConsole.MarkupLine("[yellow]No table file specified, using ASCII[/]");
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		// Find text strings
		var strings = FindStrings(rom, table);

		AnsiConsole.MarkupLine($"[green]Found {strings.Count} potential strings[/]");

		// Output
		if (outputFile != null)
		{
			using var writer = new StreamWriter(outputFile.FullName);
			foreach (var (offset, text) in strings)
			{
				writer.WriteLine($"${offset:x6}: {text}");
			}
			AnsiConsole.MarkupLine($"[green]Saved to {outputFile.FullName}[/]");
		}
		else
		{
			// Display first 20 strings
			var table2 = new Table()
				.Border(TableBorder.Rounded)
				.AddColumn("Offset")
				.AddColumn("Text");

			foreach (var (offset, text) in strings.Take(20))
			{
				table2.AddRow($"${offset:x6}", Markup.Escape(text));
			}

			AnsiConsole.Write(table2);

			if (strings.Count > 20)
			{
				AnsiConsole.MarkupLine($"[grey]... and {strings.Count - 20} more strings[/]");
			}
		}
	}

	public static void Insert(FileInfo romFile, FileInfo scriptFile, FileInfo? tableFile)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		if (!scriptFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: Script file not found: {scriptFile.FullName}[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Inserting text into {romFile.Name}...[/]");
		AnsiConsole.MarkupLine("[yellow]Text insertion not yet fully implemented[/]");

		// TODO: Implement full text insertion
	}

	public static void AnalyzeDte(FileInfo romFile)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Analyzing DTE opportunities in {romFile.Name}...[/]");

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		// Find common byte pairs
		var pairs = new Dictionary<(byte, byte), int>();
		var data = rom.AsSpan();

		for (var i = 0; i < data.Length - 1; i++)
		{
			var pair = (data[i], data[i + 1]);

			// Only count printable ASCII-ish ranges
			if (data[i] >= 0x20 && data[i] < 0x80 &&
				data[i + 1] >= 0x20 && data[i + 1] < 0x80)
			{
				pairs.TryGetValue(pair, out var count);
				pairs[pair] = count + 1;
			}
		}

		// Sort by frequency
		var topPairs = pairs
			.OrderByDescending(p => p.Value)
			.Take(20)
			.ToList();

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Top 20 DTE Candidates[/]")
			.AddColumn("Pair")
			.AddColumn("Hex")
			.AddColumn("Count")
			.AddColumn("Savings");

		foreach (var (pair, count) in topPairs)
		{
			var c1 = pair.Item1 >= 0x20 && pair.Item1 < 0x7f ? (char)pair.Item1 : '.';
			var c2 = pair.Item2 >= 0x20 && pair.Item2 < 0x7f ? (char)pair.Item2 : '.';
			var savings = count; // Each DTE saves 1 byte per occurrence

			table.AddRow(
				$"{c1}{c2}",
				$"{pair.Item1:x2} {pair.Item2:x2}",
				count.ToString("N0"),
				$"{savings:N0} bytes");
		}

		AnsiConsole.Write(table);

		var totalSavings = topPairs.Sum(p => p.Value);
		AnsiConsole.MarkupLine($"\n[green]Potential savings with top 20 pairs: {totalSavings:N0} bytes[/]");
	}

	private static Dictionary<byte, string> LoadTableFile(string path)
	{
		var table = new Dictionary<byte, string>();
		var lines = File.ReadAllLines(path);

		foreach (var line in lines)
		{
			if (string.IsNullOrWhiteSpace(line) || line.StartsWith('#') || line.StartsWith(';'))
				continue;

			var eqIndex = line.IndexOf('=');
			if (eqIndex > 0)
			{
				var hexPart = line[..eqIndex].Trim();
				var charPart = line[(eqIndex + 1)..];

				if (byte.TryParse(hexPart, System.Globalization.NumberStyles.HexNumber, null, out var value))
				{
					table[value] = charPart;
				}
			}
		}

		return table;
	}

	private static List<(int Offset, string Text)> FindStrings(RomFile rom, Dictionary<byte, string>? table)
	{
		var strings = new List<(int, string)>();
		var data = rom.AsSpan();
		var headerSize = rom.Header?.HeaderSize ?? 0;

		var currentString = new System.Text.StringBuilder();
		var stringStart = -1;

		for (var i = headerSize; i < data.Length; i++)
		{
			var b = data[i];
			string? charStr = null;

			if (table != null && table.TryGetValue(b, out var mapped))
			{
				charStr = mapped;
			}
			else if (b >= 0x20 && b < 0x7f)
			{
				charStr = ((char)b).ToString();
			}

			if (charStr != null)
			{
				if (stringStart < 0)
					stringStart = i;
				currentString.Append(charStr);
			}
			else
			{
				// End of potential string
				if (currentString.Length >= 4) // Minimum string length
				{
					strings.Add((stringStart, currentString.ToString()));
				}
				currentString.Clear();
				stringStart = -1;
			}
		}

		return strings;
	}
}
