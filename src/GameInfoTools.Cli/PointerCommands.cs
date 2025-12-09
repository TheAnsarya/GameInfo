using GameInfoTools.Core;
using Spectre.Console;

namespace GameInfoTools.Cli;

/// <summary>
/// Pointer table management commands.
/// </summary>
public static class PointerCommands {
	public static void Scan(FileInfo romFile, int startAddress, int endAddress, SystemType system) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		AnsiConsole.MarkupLine($"[cyan]Scanning for pointers in {romFile.Name}[/]");
		AnsiConsole.MarkupLine($"[grey]Range: 0x{startAddress:x6} - 0x{endAddress:x6}[/]");
		AnsiConsole.MarkupLine($"[grey]System: {system}[/]");

		var pointers = new List<(int Address, int Target, string Type)>();

		switch (system) {
			case SystemType.Nes:
				ScanNesPointers(rom, startAddress, endAddress, pointers);
				break;

			case SystemType.Snes:
				ScanSnesPointers(rom, startAddress, endAddress, pointers);
				break;

			default:
				ScanGenericPointers(rom, startAddress, endAddress, pointers);
				break;
		}

		if (pointers.Count == 0) {
			AnsiConsole.MarkupLine("[yellow]No pointers found in the specified range[/]");
			return;
		}

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title($"[cyan]Found {pointers.Count} Potential Pointers[/]")
			.AddColumn("Address")
			.AddColumn("Target")
			.AddColumn("Type")
			.AddColumn("Target Content");

		foreach (var (addr, target, type) in pointers.Take(50)) {
			string preview = GetTargetPreview(rom, target, 8);
			table.AddRow(
				$"0x{addr:x6}",
				$"0x{target:x6}",
				type,
				preview
			);
		}

		if (pointers.Count > 50) {
			table.AddRow("...", "...", "...", $"... and {pointers.Count - 50} more");
		}

		AnsiConsole.Write(table);
	}

	private static void ScanNesPointers(RomFile rom, int start, int end, List<(int, int, string)> pointers) {
		// NES uses 16-bit little-endian pointers
		// Common pointer ranges: $8000-$FFFF (CPU addresses)
		for (int i = start; i < end - 1 && i < rom.Data.Length - 1; i++) {
			int lo = rom.Data[i];
			int hi = rom.Data[i + 1];
			int target = (hi << 8) | lo;

			// Valid NES ROM address range
			if (target >= 0x8000 && target <= 0xffff) {
				// Convert CPU address to ROM offset (simplified, doesn't account for mapper)
				int romTarget = target - 0x8000;
				if (romTarget >= 0 && romTarget < rom.Data.Length) {
					pointers.Add((i, target, "CPU"));
				}
			}
		}
	}

	private static void ScanSnesPointers(RomFile rom, int start, int end, List<(int, int, string)> pointers) {
		// SNES can have 16-bit or 24-bit pointers
		// Check for 24-bit long pointers first
		for (int i = start; i < end - 2 && i < rom.Data.Length - 2; i++) {
			int lo = rom.Data[i];
			int hi = rom.Data[i + 1];
			int bank = rom.Data[i + 2];

			int target24 = (bank << 16) | (hi << 8) | lo;

			// Check if it looks like a valid SNES address
			if (IsValidSnesAddress(target24)) {
				pointers.Add((i, target24, "Long"));
			}
		}

		// Also check for 16-bit pointers
		for (int i = start; i < end - 1 && i < rom.Data.Length - 1; i++) {
			int lo = rom.Data[i];
			int hi = rom.Data[i + 1];
			int target = (hi << 8) | lo;

			// Common SNES ROM addresses
			if (target >= 0x8000 && target <= 0xffff) {
				pointers.Add((i, target, "Near"));
			}
		}
	}

	private static bool IsValidSnesAddress(int addr) {
		int bank = (addr >> 16) & 0xff;
		int offset = addr & 0xffff;

		// LoROM mapping
		if (bank >= 0x00 && bank <= 0x3f && offset >= 0x8000)
			return true;
		if (bank >= 0x80 && bank <= 0xbf && offset >= 0x8000)
			return true;

		// HiROM mapping
		if (bank >= 0x40 && bank <= 0x7d)
			return true;
		if (bank >= 0xc0 && bank <= 0xff)
			return true;

		return false;
	}

	private static void ScanGenericPointers(RomFile rom, int start, int end, List<(int, int, string)> pointers) {
		// Generic 16-bit pointer scan
		for (int i = start; i < end - 1 && i < rom.Data.Length - 1; i++) {
			int lo = rom.Data[i];
			int hi = rom.Data[i + 1];
			int target = (hi << 8) | lo;

			// If target points within ROM
			if (target > 0 && target < rom.Data.Length) {
				pointers.Add((i, target, "Generic"));
			}
		}
	}

	private static string GetTargetPreview(RomFile rom, int target, int length) {
		// Convert CPU address to ROM offset if needed
		int offset = target;
		if (target >= 0x8000) {
			offset = target - 0x8000;
		}

		if (offset < 0 || offset >= rom.Data.Length) {
			return "[grey](out of range)[/]";
		}

		var sb = new System.Text.StringBuilder();
		for (int i = 0; i < length && offset + i < rom.Data.Length; i++) {
			sb.Append($"{rom.Data[offset + i]:x2} ");
		}

		return sb.ToString().Trim();
	}

	public static void Extract(FileInfo romFile, int tableAddress, int entryCount, string format, string outputPath) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		AnsiConsole.MarkupLine($"[cyan]Extracting pointer table from 0x{tableAddress:x6}[/]");
		AnsiConsole.MarkupLine($"[grey]Entries: {entryCount}, Format: {format}[/]");

		var pointers = new List<int>();
		int pointerSize = format.ToLowerInvariant() switch {
			"16bit" or "word" => 2,
			"24bit" or "long" => 3,
			"32bit" or "dword" => 4,
			_ => 2
		};

		for (int i = 0; i < entryCount; i++) {
			int addr = tableAddress + (i * pointerSize);
			if (addr + pointerSize > rom.Data.Length)
				break;

			int pointer = 0;
			for (int j = 0; j < pointerSize; j++) {
				pointer |= rom.Data[addr + j] << (j * 8);
			}

			pointers.Add(pointer);
		}

		// Write to file
		using var writer = new StreamWriter(outputPath);
		writer.WriteLine($"; Pointer table extracted from 0x{tableAddress:x6}");
		writer.WriteLine($"; Format: {format}, Count: {pointers.Count}");
		writer.WriteLine();

		for (int i = 0; i < pointers.Count; i++) {
			writer.WriteLine($"ptr_{i:d3} = 0x{pointers[i]:x6}");
		}

		AnsiConsole.MarkupLine($"[green]Extracted {pointers.Count} pointers to {outputPath}[/]");
	}

	public static void Repoint(FileInfo romFile, int oldPointer, int newPointer) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		AnsiConsole.MarkupLine($"[cyan]Searching for pointers to 0x{oldPointer:x4}...[/]");

		// Find all occurrences of the old pointer
		byte lo = (byte)(oldPointer & 0xff);
		byte hi = (byte)((oldPointer >> 8) & 0xff);

		var occurrences = new List<int>();
		for (int i = 0; i < rom.Data.Length - 1; i++) {
			if (rom.Data[i] == lo && rom.Data[i + 1] == hi) {
				occurrences.Add(i);
			}
		}

		if (occurrences.Count == 0) {
			AnsiConsole.MarkupLine($"[yellow]No occurrences of pointer 0x{oldPointer:x4} found[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Found {occurrences.Count} occurrences[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Address")
			.AddColumn("Context (before)")
			.AddColumn("Context (after)");

		foreach (var addr in occurrences.Take(20)) {
			string before = GetTargetPreview(rom, addr - 4, 12);
			table.AddRow($"0x{addr:x6}", before, "→ will update");
		}

		AnsiConsole.Write(table);

		// Ask for confirmation (in actual tool, would prompt)
		AnsiConsole.MarkupLine("[yellow]Repointing not applied - verify addresses before proceeding[/]");
		AnsiConsole.MarkupLine($"[grey]Would change {occurrences.Count} pointers from 0x{oldPointer:x4} to 0x{newPointer:x4}[/]");
	}

	public static void Analyze(FileInfo romFile, int tableAddress) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		AnsiConsole.MarkupLine($"[cyan]Analyzing pointer structure at 0x{tableAddress:x6}[/]");

		// Try to determine table structure
		var candidates = new List<(int Count, int Size, string Description)>();

		// Check for 16-bit pointer table
		int count16 = CountConsecutivePointers(rom, tableAddress, 2);
		if (count16 > 2) {
			candidates.Add((count16, 2, "16-bit word pointers"));
		}

		// Check for 24-bit pointer table
		int count24 = CountConsecutivePointers(rom, tableAddress, 3);
		if (count24 > 2) {
			candidates.Add((count24, 3, "24-bit long pointers"));
		}

		if (candidates.Count == 0) {
			AnsiConsole.MarkupLine("[yellow]Could not identify pointer table structure[/]");
			return;
		}

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Pointer Table Analysis[/]")
			.AddColumn("Type")
			.AddColumn("Entry Count")
			.AddColumn("Table Size");

		foreach (var (count, size, desc) in candidates) {
			table.AddRow(desc, count.ToString(), $"0x{count * size:x4}");
		}

		AnsiConsole.Write(table);
	}

	private static int CountConsecutivePointers(RomFile rom, int start, int pointerSize) {
		int count = 0;
		int addr = start;

		while (addr + pointerSize <= rom.Data.Length) {
			int pointer = 0;
			for (int j = 0; j < pointerSize; j++) {
				pointer |= rom.Data[addr + j] << (j * 8);
			}

			// Check if this looks like a valid pointer
			bool valid = pointerSize switch {
				2 => pointer >= 0x8000 && pointer <= 0xffff,
				3 => IsValidSnesAddress(pointer),
				_ => pointer > 0 && pointer < rom.Data.Length
			};

			if (!valid)
				break;

			count++;
			addr += pointerSize;

			// Limit to prevent runaway
			if (count > 1000)
				break;
		}

		return count;
	}
}
