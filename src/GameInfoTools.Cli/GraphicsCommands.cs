using Spectre.Console;
using GameInfoTools.Core;

namespace GameInfoTools.Cli;

/// <summary>
/// Graphics and tile operation commands.
/// </summary>
public static class GraphicsCommands
{
	public static void ExtractChr(FileInfo romFile, DirectoryInfo? outputDir)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var header = rom.Header;

		if (header?.System == SystemType.Nes)
		{
			ExtractNesChr(rom, outputDir);
		}
		else if (header?.System == SystemType.Snes)
		{
			AnsiConsole.MarkupLine("[cyan]SNES graphics extraction...[/]");
			AnsiConsole.MarkupLine("[yellow]SNES CHR extraction not yet implemented[/]");
		}
		else
		{
			AnsiConsole.MarkupLine("[yellow]Unknown ROM type, attempting generic tile extraction...[/]");
			ExtractGenericTiles(rom, outputDir);
		}
	}

	private static void ExtractNesChr(RomFile rom, DirectoryInfo? outputDir)
	{
		var header = rom.Header!;

		if (header.ChrRomSize == 0)
		{
			AnsiConsole.MarkupLine("[yellow]This ROM uses CHR-RAM (no CHR-ROM to extract)[/]");
			return;
		}

		var chrOffset = header.HeaderSize + header.PrgRomSize;
		var chrData = rom.Read(chrOffset, header.ChrRomSize);

		AnsiConsole.MarkupLine($"[cyan]Extracting {header.ChrRomSize / 1024} KB of CHR data...[/]");

		var outPath = outputDir?.FullName ?? Path.GetDirectoryName(rom.FilePath) ?? ".";
		var baseName = Path.GetFileNameWithoutExtension(rom.FilePath);

		// Calculate number of 8KB CHR banks
		var bankCount = header.ChrRomSize / 8192;

		for (var bank = 0; bank < bankCount; bank++)
		{
			var bankOffset = bank * 8192;
			var bankData = chrData.Slice(bankOffset, Math.Min(8192, chrData.Length - bankOffset));

			// Save raw CHR bank
			var chrPath = Path.Combine(outPath, $"{baseName}_chr{bank:d2}.chr");
			File.WriteAllBytes(chrPath, bankData.ToArray());

			AnsiConsole.MarkupLine($"[green]Saved CHR bank {bank}: {chrPath}[/]");

			// Also convert to a simple text visualization
			var vizPath = Path.Combine(outPath, $"{baseName}_chr{bank:d2}.txt");
			SaveTileVisualization(bankData, vizPath);
		}

		AnsiConsole.MarkupLine($"[green]Extracted {bankCount} CHR bank(s)[/]");
	}

	private static void ExtractGenericTiles(RomFile rom, DirectoryInfo? outputDir)
	{
		var outPath = outputDir?.FullName ?? Path.GetDirectoryName(rom.FilePath) ?? ".";
		var baseName = Path.GetFileNameWithoutExtension(rom.FilePath);

		// Just save the raw data in chunks for manual analysis
		var data = rom.GetDataWithoutHeader();
		var chunkSize = 8192;
		var chunkCount = (data.Length + chunkSize - 1) / chunkSize;

		for (var i = 0; i < Math.Min(chunkCount, 10); i++) // Limit to first 10 chunks
		{
			var offset = i * chunkSize;
			var size = Math.Min(chunkSize, data.Length - offset);
			var chunk = data.Slice(offset, size);

			var chunkPath = Path.Combine(outPath, $"{baseName}_chunk{i:d2}.bin");
			File.WriteAllBytes(chunkPath, chunk.ToArray());
		}

		AnsiConsole.MarkupLine($"[green]Extracted {Math.Min(chunkCount, 10)} data chunks[/]");
	}

	private static void SaveTileVisualization(ReadOnlySpan<byte> chrData, string path)
	{
		using var writer = new StreamWriter(path);

		// Each 8x8 tile is 16 bytes in NES 2bpp format
		var tileCount = chrData.Length / 16;

		for (var tile = 0; tile < Math.Min(tileCount, 256); tile++)
		{
			writer.WriteLine($"Tile {tile:x2}:");

			var tileOffset = tile * 16;

			for (var y = 0; y < 8; y++)
			{
				var plane0 = chrData[tileOffset + y];
				var plane1 = chrData[tileOffset + y + 8];

				for (var x = 7; x >= 0; x--)
				{
					var bit0 = (plane0 >> x) & 1;
					var bit1 = (plane1 >> x) & 1;
					var pixel = bit0 | (bit1 << 1);

					writer.Write(pixel switch
					{
						0 => ' ',
						1 => '░',
						2 => '▒',
						3 => '█',
						_ => '?'
					});
				}
				writer.WriteLine();
			}
			writer.WriteLine();
		}
	}

	public static void ExtractPalette(FileInfo romFile)
	{
		if (!romFile.Exists)
		{
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var header = rom.Header;

		if (header?.System == SystemType.Nes)
		{
			AnsiConsole.MarkupLine("[cyan]NES Master Palette (2C02):[/]");
			DisplayNesPalette();
		}
		else if (header?.System == SystemType.Snes)
		{
			AnsiConsole.MarkupLine("[cyan]Searching for SNES palettes...[/]");
			FindSnesPalettes(rom);
		}
		else
		{
			AnsiConsole.MarkupLine("[yellow]Unknown system type[/]");
		}
	}

	private static void DisplayNesPalette()
	{
		// NES 2C02 palette (simplified representation)
		var nesPalette = new[]
		{
			"Gray", "Blue", "DarkBlue", "Purple",
			"Magenta", "Red", "DarkRed", "Brown",
			"Orange", "Yellow", "Green", "Cyan",
			"LightBlue", "Black", "Black", "Black"
		};

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Index")
			.AddColumn("Color");

		for (var i = 0; i < 16; i++)
		{
			table.AddRow($"${i:x2}", nesPalette[i]);
		}

		AnsiConsole.Write(table);
		AnsiConsole.MarkupLine("\n[grey]Note: NES palettes are defined in PPU registers, not ROM[/]");
	}

	private static void FindSnesPalettes(RomFile rom)
	{
		var data = rom.GetDataWithoutHeader();

		// SNES palettes are 15-bit BGR format (2 bytes per color)
		// Look for potential palette data patterns

		var candidates = new List<int>();

		for (var i = 0; i < data.Length - 32; i += 2)
		{
			// Check if this could be a 16-color palette (32 bytes)
			var couldBePalette = true;

			for (var j = 0; j < 32; j += 2)
			{
				var color = data[i + j] | (data[i + j + 1] << 8);
				// SNES colors have bit 15 clear
				if ((color & 0x8000) != 0)
				{
					couldBePalette = false;
					break;
				}
			}

			if (couldBePalette)
			{
				candidates.Add(i);
			}
		}

		AnsiConsole.MarkupLine($"[green]Found {candidates.Count} potential palette locations[/]");

		// Show first few
		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Offset")
			.AddColumn("First Colors (BGR555)");

		foreach (var offset in candidates.Take(10))
		{
			var colors = new System.Text.StringBuilder();
			for (var j = 0; j < 8; j += 2)
			{
				var color = data[offset + j] | (data[offset + j + 1] << 8);
				colors.Append($"{color:x4} ");
			}
			table.AddRow($"${offset:x6}", colors.ToString());
		}

		AnsiConsole.Write(table);
	}
}
