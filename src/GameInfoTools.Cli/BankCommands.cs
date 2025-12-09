using GameInfoTools.Core;
using Spectre.Console;

namespace GameInfoTools.Cli;

/// <summary>
/// Bank-related commands for managing ROM banks.
/// </summary>
public static class BankCommands {
	public static void List(FileInfo romFile) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var info = rom.GetInfo();
		int bankSize = GetBankSize(info.System);
		int bankCount = rom.Data.Length / bankSize;

		AnsiConsole.MarkupLine($"[cyan]Bank Information for {romFile.Name}[/]");
		AnsiConsole.MarkupLine($"[grey]System: {info.System}, Mapper: {info.Mapper}[/]");
		AnsiConsole.MarkupLine($"[grey]Bank Size: 0x{bankSize:x4} ({bankSize} bytes)[/]");
		AnsiConsole.MarkupLine($"[grey]Total Banks: {bankCount}[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Bank #")
			.AddColumn("ROM Offset")
			.AddColumn("Size")
			.AddColumn("Usage")
			.AddColumn("Content Type");

		for (int i = 0; i < Math.Min(bankCount, 32); i++) {
			int offset = i * bankSize;
			string usage = AnalyzeBankUsage(rom, i, bankSize);
			string contentType = DetectBankContent(rom, offset, bankSize);

			table.AddRow(
				$"{i:d2} (0x{i:x2})",
				$"0x{offset:x6}",
				$"0x{bankSize:x4}",
				usage,
				contentType
			);
		}

		if (bankCount > 32) {
			table.AddRow("...", "...", "...", "...", "...");
			table.AddRow($"{bankCount - 1:d2}", $"0x{(bankCount - 1) * bankSize:x6}", $"0x{bankSize:x4}", "...", "...");
		}

		AnsiConsole.Write(table);
	}

	private static int GetBankSize(SystemType system) {
		return system switch {
			SystemType.Nes => 0x4000,        // 16KB PRG banks (typical)
			SystemType.Snes => 0x8000,       // 32KB banks
			SystemType.GameBoy => 0x4000,    // 16KB banks
			SystemType.GameBoyColor => 0x4000, // 16KB banks
			SystemType.GameBoyAdvance => 0x10000, // 64KB (varies)
			SystemType.Genesis => 0x10000,   // 64KB
			_ => 0x4000
		};
	}

	private static string AnalyzeBankUsage(RomFile rom, int bankNum, int bankSize) {
		int offset = bankNum * bankSize;
		int end = Math.Min(offset + bankSize, rom.Data.Length);
		int usedBytes = 0;
		int ffBytes = 0;

		for (int i = offset; i < end; i++) {
			if (rom.Data[i] != 0x00 && rom.Data[i] != 0xff) {
				usedBytes++;
			}

			if (rom.Data[i] == 0xff) {
				ffBytes++;
			}
		}

		int totalBytes = end - offset;
		double usedPercent = (double)usedBytes / totalBytes * 100;

		if (ffBytes > totalBytes * 0.95)
			return "[grey]Empty (0xff)[/]";
		if (usedPercent < 10)
			return "[yellow]~Sparse[/]";
		if (usedPercent > 90)
			return "[green]Full[/]";

		return $"[cyan]{usedPercent:f0}%[/]";
	}

	private static string DetectBankContent(RomFile rom, int offset, int bankSize) {
		// Sample the bank content to guess its type
		int sampleSize = Math.Min(512, bankSize);
		var sample = new byte[sampleSize];
		Array.Copy(rom.Data, offset, sample, 0, sampleSize);

		// Check for common patterns
		int textLikeBytes = 0;
		int codePatterns = 0;

		for (int i = 0; i < sampleSize; i++) {
			byte b = sample[i];

			// Text-like bytes (common text encodings)
			if ((b >= 0x41 && b <= 0x5a) || (b >= 0x61 && b <= 0x7a) || (b >= 0x80 && b <= 0xdf)) {
				textLikeBytes++;
			}

			// Code patterns (6502)
			if (i < sampleSize - 1) {
				// JSR (0x20), JMP (0x4c), LDA (0xa9, 0xa5, 0xad)
				if (b == 0x20 || b == 0x4c || b == 0xa9 || b == 0xa5 || b == 0xad) {
					codePatterns++;
				}
			}
		}

		double textRatio = (double)textLikeBytes / sampleSize;
		double codeRatio = (double)codePatterns / sampleSize;

		if (textRatio > 0.3)
			return "[magenta]Text/Dialog[/]";
		if (codeRatio > 0.1)
			return "[blue]Code[/]";

		// Check for graphics patterns (repeating structures)
		bool hasRepeat = false;
		for (int i = 0; i < sampleSize - 16; i++) {
			if (sample[i] == sample[i + 8] && sample[i + 1] == sample[i + 9]) {
				hasRepeat = true;
				break;
			}
		}

		if (hasRepeat)
			return "[green]Graphics[/]";

		return "[grey]Unknown[/]";
	}

	public static void Extract(FileInfo romFile, int bankNumber, string outputPath) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var info = rom.GetInfo();
		int bankSize = GetBankSize(info.System);
		int bankCount = rom.Data.Length / bankSize;

		if (bankNumber < 0 || bankNumber >= bankCount) {
			AnsiConsole.MarkupLine($"[red]Error: Invalid bank number. Must be 0-{bankCount - 1}[/]");
			return;
		}

		int offset = bankNumber * bankSize;
		var bankData = new byte[bankSize];
		Array.Copy(rom.Data, offset, bankData, 0, bankSize);

		File.WriteAllBytes(outputPath, bankData);
		AnsiConsole.MarkupLine($"[green]Extracted bank {bankNumber} to {outputPath}[/]");
		AnsiConsole.MarkupLine($"[grey]{bankSize} bytes written[/]");
	}

	public static void Replace(FileInfo romFile, int bankNumber, FileInfo bankFile) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		if (!bankFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: Bank file not found: {bankFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var info = rom.GetInfo();
		int bankSize = GetBankSize(info.System);
		int bankCount = rom.Data.Length / bankSize;

		if (bankNumber < 0 || bankNumber >= bankCount) {
			AnsiConsole.MarkupLine($"[red]Error: Invalid bank number. Must be 0-{bankCount - 1}[/]");
			return;
		}

		var bankData = File.ReadAllBytes(bankFile.FullName);
		if (bankData.Length != bankSize) {
			AnsiConsole.MarkupLine($"[red]Error: Bank file size ({bankData.Length}) does not match expected size ({bankSize})[/]");
			return;
		}

		int offset = bankNumber * bankSize;
		Array.Copy(bankData, 0, rom.Data, offset, bankSize);

		rom.Save(romFile.FullName);
		AnsiConsole.MarkupLine($"[green]Replaced bank {bankNumber} in {romFile.Name}[/]");
	}

	public static void Compare(FileInfo rom1File, FileInfo rom2File) {
		if (!rom1File.Exists || !rom2File.Exists) {
			AnsiConsole.MarkupLine("[red]Error: One or both ROM files not found[/]");
			return;
		}

		using var rom1 = new RomFile();
		using var rom2 = new RomFile();
		rom1.Load(rom1File.FullName);
		rom2.Load(rom2File.FullName);

		var info1 = rom1.GetInfo();
		int bankSize = GetBankSize(info1.System);
		int bankCount1 = rom1.Data.Length / bankSize;
		int bankCount2 = rom2.Data.Length / bankSize;

		AnsiConsole.MarkupLine($"[cyan]Bank Comparison[/]");
		AnsiConsole.MarkupLine($"[grey]ROM 1: {rom1File.Name} ({bankCount1} banks)[/]");
		AnsiConsole.MarkupLine($"[grey]ROM 2: {rom2File.Name} ({bankCount2} banks)[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Bank")
			.AddColumn("Status")
			.AddColumn("Differences");

		int maxBanks = Math.Max(bankCount1, bankCount2);
		int identicalBanks = 0;
		int differentBanks = 0;

		for (int i = 0; i < maxBanks; i++) {
			int offset = i * bankSize;

			if (i >= bankCount1) {
				table.AddRow($"{i}", "[yellow]ROM 2 only[/]", "N/A");
				continue;
			}

			if (i >= bankCount2) {
				table.AddRow($"{i}", "[yellow]ROM 1 only[/]", "N/A");
				continue;
			}

			int differences = 0;
			for (int j = 0; j < bankSize && offset + j < rom1.Data.Length && offset + j < rom2.Data.Length; j++) {
				if (rom1.Data[offset + j] != rom2.Data[offset + j]) {
					differences++;
				}
			}

			if (differences == 0) {
				identicalBanks++;
				table.AddRow($"{i}", "[green]Identical[/]", "0");
			} else {
				differentBanks++;
				double pct = (double)differences / bankSize * 100;
				table.AddRow($"{i}", "[red]Different[/]", $"{differences} ({pct:f1}%)");
			}
		}

		AnsiConsole.Write(table);
		AnsiConsole.MarkupLine($"[grey]Summary: {identicalBanks} identical, {differentBanks} different[/]");
	}
}
