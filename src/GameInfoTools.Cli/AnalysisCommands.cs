using GameInfoTools.Analysis;
using GameInfoTools.Core;
using Spectre.Console;

namespace GameInfoTools.Cli;

/// <summary>
/// ROM analysis commands.
/// </summary>
public static class AnalysisCommands {
	// 6502 opcode table
	private static readonly Dictionary<byte, (string Mnemonic, string Mode, int Length)> Opcodes6502 = new() {
		[0x00] = ("BRK", "impl", 1),
		[0x01] = ("ORA", "indx", 2),
		[0x05] = ("ORA", "zpg", 2),
		[0x06] = ("ASL", "zpg", 2),
		[0x08] = ("PHP", "impl", 1),
		[0x09] = ("ORA", "imm", 2),
		[0x0a] = ("ASL", "acc", 1),
		[0x0d] = ("ORA", "abs", 3),
		[0x0e] = ("ASL", "abs", 3),
		[0x10] = ("BPL", "rel", 2),
		[0x18] = ("CLC", "impl", 1),
		[0x20] = ("JSR", "abs", 3),
		[0x24] = ("BIT", "zpg", 2),
		[0x25] = ("AND", "zpg", 2),
		[0x28] = ("PLP", "impl", 1),
		[0x29] = ("AND", "imm", 2),
		[0x2a] = ("ROL", "acc", 1),
		[0x2c] = ("BIT", "abs", 3),
		[0x30] = ("BMI", "rel", 2),
		[0x38] = ("SEC", "impl", 1),
		[0x40] = ("RTI", "impl", 1),
		[0x45] = ("EOR", "zpg", 2),
		[0x48] = ("PHA", "impl", 1),
		[0x49] = ("EOR", "imm", 2),
		[0x4a] = ("LSR", "acc", 1),
		[0x4c] = ("JMP", "abs", 3),
		[0x50] = ("BVC", "rel", 2),
		[0x58] = ("CLI", "impl", 1),
		[0x60] = ("RTS", "impl", 1),
		[0x65] = ("ADC", "zpg", 2),
		[0x68] = ("PLA", "impl", 1),
		[0x69] = ("ADC", "imm", 2),
		[0x6a] = ("ROR", "acc", 1),
		[0x6c] = ("JMP", "ind", 3),
		[0x70] = ("BVS", "rel", 2),
		[0x78] = ("SEI", "impl", 1),
		[0x84] = ("STY", "zpg", 2),
		[0x85] = ("STA", "zpg", 2),
		[0x86] = ("STX", "zpg", 2),
		[0x88] = ("DEY", "impl", 1),
		[0x8a] = ("TXA", "impl", 1),
		[0x8c] = ("STY", "abs", 3),
		[0x8d] = ("STA", "abs", 3),
		[0x8e] = ("STX", "abs", 3),
		[0x90] = ("BCC", "rel", 2),
		[0x98] = ("TYA", "impl", 1),
		[0x9a] = ("TXS", "impl", 1),
		[0xa0] = ("LDY", "imm", 2),
		[0xa2] = ("LDX", "imm", 2),
		[0xa4] = ("LDY", "zpg", 2),
		[0xa5] = ("LDA", "zpg", 2),
		[0xa6] = ("LDX", "zpg", 2),
		[0xa8] = ("TAY", "impl", 1),
		[0xa9] = ("LDA", "imm", 2),
		[0xaa] = ("TAX", "impl", 1),
		[0xac] = ("LDY", "abs", 3),
		[0xad] = ("LDA", "abs", 3),
		[0xae] = ("LDX", "abs", 3),
		[0xb0] = ("BCS", "rel", 2),
		[0xb1] = ("LDA", "indy", 2),
		[0xb8] = ("CLV", "impl", 1),
		[0xba] = ("TSX", "impl", 1),
		[0xc0] = ("CPY", "imm", 2),
		[0xc5] = ("CMP", "zpg", 2),
		[0xc6] = ("DEC", "zpg", 2),
		[0xc8] = ("INY", "impl", 1),
		[0xc9] = ("CMP", "imm", 2),
		[0xca] = ("DEX", "impl", 1),
		[0xcd] = ("CMP", "abs", 3),
		[0xce] = ("DEC", "abs", 3),
		[0xd0] = ("BNE", "rel", 2),
		[0xd8] = ("CLD", "impl", 1),
		[0xe0] = ("CPX", "imm", 2),
		[0xe5] = ("SBC", "zpg", 2),
		[0xe6] = ("INC", "zpg", 2),
		[0xe8] = ("INX", "impl", 1),
		[0xe9] = ("SBC", "imm", 2),
		[0xea] = ("NOP", "impl", 1),
		[0xed] = ("SBC", "abs", 3),
		[0xee] = ("INC", "abs", 3),
		[0xf0] = ("BEQ", "rel", 2),
		[0xf8] = ("SED", "impl", 1),
	};

	public static void Opcodes(FileInfo romFile, int? bank) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		var header = rom.Header;
		var headerSize = header?.HeaderSize ?? 0;
		var bankSize = 0x4000; // 16KB default for NES

		if (header?.System == SystemType.Snes) {
			bankSize = 0x8000; // 32KB for SNES
		}

		var data = rom.GetDataWithoutHeader();
		var bankCount = data.Length / bankSize;

		if (bank.HasValue) {
			if (bank.Value >= bankCount) {
				AnsiConsole.MarkupLine($"[red]Bank {bank.Value} out of range (max: {bankCount - 1})[/]");
				return;
			}

			var bankData = data.Slice(bank.Value * bankSize, bankSize);
			AnalyzeBankOpcodes(bankData, bank.Value);
		} else {
			AnsiConsole.MarkupLine($"[cyan]Analyzing {bankCount} banks...[/]");

			var globalCounts = new Dictionary<string, int>();

			for (var b = 0; b < bankCount; b++) {
				var bankData = data.Slice(b * bankSize, bankSize);
				var counts = CountOpcodes(bankData);

				foreach (var (mnem, count) in counts) {
					globalCounts.TryGetValue(mnem, out var existing);
					globalCounts[mnem] = existing + count;
				}
			}

			DisplayOpcodeSummary(globalCounts);
		}
	}

	private static void AnalyzeBankOpcodes(ReadOnlySpan<byte> data, int bankNum) {
		var counts = CountOpcodes(data);

		AnsiConsole.Write(new Rule($"[cyan]Bank {bankNum} Opcode Analysis[/]").LeftJustified());
		DisplayOpcodeSummary(counts);
	}

	private static Dictionary<string, int> CountOpcodes(ReadOnlySpan<byte> data) {
		var counts = new Dictionary<string, int>();
		var i = 0;

		while (i < data.Length) {
			var opcode = data[i];

			if (Opcodes6502.TryGetValue(opcode, out var info)) {
				counts.TryGetValue(info.Mnemonic, out var count);
				counts[info.Mnemonic] = count + 1;
				i += info.Length;
			} else {
				i++;
			}
		}

		return counts;
	}

	private static void DisplayOpcodeSummary(Dictionary<string, int> counts) {
		var total = counts.Values.Sum();

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Mnemonic")
			.AddColumn("Count")
			.AddColumn("Percentage");

		var sorted = counts.OrderByDescending(c => c.Value).Take(20);

		foreach (var (mnem, count) in sorted) {
			var pct = (double)count / total * 100;
			table.AddRow(mnem, count.ToString("N0"), $"{pct:F1}%");
		}

		AnsiConsole.Write(table);
		AnsiConsole.MarkupLine($"\n[grey]Total instructions: {total:N0}[/]");
	}

	public static void DetectCompression(FileInfo romFile) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		AnsiConsole.MarkupLine($"[cyan]Scanning for compressed data in {romFile.Name}...[/]");

		var data = rom.GetDataWithoutHeader();
		var candidates = new List<(int Offset, string Type, double Confidence)>();

		// Scan for compression signatures
		for (var i = 0; i < data.Length - 16; i += 64) {
			var window = data.Slice(i, Math.Min(256, data.Length - i));

			// Check entropy
			var entropy = CalculateEntropy(window);

			// Check for LZ77 patterns
			var lzScore = DetectLzPatterns(window);

			// Check for RLE patterns
			var rleScore = DetectRlePatterns(window);

			if (entropy > 6.5 && entropy < 7.8) {
				candidates.Add((i, "Compressed (high entropy)", entropy / 8.0));
			} else if (lzScore > 0.3) {
				candidates.Add((i, "LZ77/LZSS", lzScore));
			} else if (rleScore > 0.3) {
				candidates.Add((i, "RLE", rleScore));
			}
		}

		if (candidates.Count == 0) {
			AnsiConsole.MarkupLine("[yellow]No obvious compression patterns found[/]");
			return;
		}

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Potential Compressed Regions[/]")
			.AddColumn("Offset")
			.AddColumn("Type")
			.AddColumn("Confidence");

		foreach (var (offset, type, conf) in candidates.Take(20)) {
			table.AddRow($"${offset:x6}", type, $"{conf:P0}");
		}

		AnsiConsole.Write(table);

		if (candidates.Count > 20) {
			AnsiConsole.MarkupLine($"[grey]... and {candidates.Count - 20} more regions[/]");
		}
	}

	private static double CalculateEntropy(ReadOnlySpan<byte> data) {
		var counts = new int[256];
		foreach (var b in data) {
			counts[b]++;
		}

		var entropy = 0.0;
		var length = (double)data.Length;

		foreach (var count in counts) {
			if (count > 0) {
				var p = count / length;
				entropy -= p * Math.Log2(p);
			}
		}

		return entropy;
	}

	private static double DetectLzPatterns(ReadOnlySpan<byte> data) {
		// Look for back-reference patterns
		var backRefs = 0;

		for (var i = 0; i < data.Length - 2; i++) {
			// Common LZ flag byte patterns
			if ((data[i] & 0x80) != 0 && i > 0) {
				backRefs++;
			}
		}

		return (double)backRefs / data.Length;
	}

	private static double DetectRlePatterns(ReadOnlySpan<byte> data) {
		var runs = 0;
		var i = 0;

		while (i < data.Length - 1) {
			var runLength = 1;
			while (i + runLength < data.Length && data[i] == data[i + runLength] && runLength < 128) {
				runLength++;
			}

			if (runLength >= 3) {
				runs++;
			}

			i += Math.Max(1, runLength);
		}

		return (double)runs / (data.Length / 4);
	}

	public static void BuildXref(FileInfo romFile, FileInfo? outputFile) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		AnsiConsole.MarkupLine($"[cyan]Building cross-reference database for {romFile.Name}...[/]");

		var data = rom.GetDataWithoutHeader();
		var xrefs = new Dictionary<int, List<int>>(); // target -> list of sources

		// Find JSR/JMP instructions
		var i = 0;
		while (i < data.Length) {
			var opcode = data[i];

			// JSR absolute
			if (opcode == 0x20 && i + 2 < data.Length) {
				var target = data[i + 1] | (data[i + 2] << 8);
				var source = 0x8000 + i; // Assume standard NES mapping

				if (!xrefs.ContainsKey(target)) {
					xrefs[target] = [];
				}

				xrefs[target].Add(source);

				i += 3;
			}
			// JMP absolute
			else if (opcode == 0x4c && i + 2 < data.Length) {
				var target = data[i + 1] | (data[i + 2] << 8);
				var source = 0x8000 + i;

				if (!xrefs.ContainsKey(target)) {
					xrefs[target] = [];
				}

				xrefs[target].Add(source);

				i += 3;
			} else if (Opcodes6502.TryGetValue(opcode, out var info)) {
				i += info.Length;
			} else {
				i++;
			}
		}

		AnsiConsole.MarkupLine($"[green]Found {xrefs.Count} unique call/jump targets[/]");

		// Show most-called functions
		var topFunctions = xrefs
			.OrderByDescending(x => x.Value.Count)
			.Take(20)
			.ToList();

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Most Called Functions[/]")
			.AddColumn("Address")
			.AddColumn("Call Count")
			.AddColumn("Callers (first 5)");

		foreach (var (target, callers) in topFunctions) {
			var callerStr = string.Join(", ", callers.Take(5).Select(c => $"${c:x4}"));
			if (callers.Count > 5) {
				callerStr += $" +{callers.Count - 5} more";
			}

			table.AddRow($"${target:x4}", callers.Count.ToString(), callerStr);
		}

		AnsiConsole.Write(table);

		// Save to file if requested
		if (outputFile != null) {
			using var writer = new StreamWriter(outputFile.FullName);
			writer.WriteLine("; Cross-reference database");
			writer.WriteLine($"; Generated from: {romFile.Name}");
			writer.WriteLine();

			foreach (var (target, callers) in xrefs.OrderBy(x => x.Key)) {
				writer.WriteLine($"${target:x4}: ; Called from: {string.Join(", ", callers.Select(c => $"${c:x4}"))}");
			}

			AnsiConsole.MarkupLine($"[green]Saved to {outputFile.FullName}[/]");
		}
	}

	/// <summary>
	/// Show CDL file coverage statistics.
	/// </summary>
	public static void CdlStats(FileInfo cdlFile, string format) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var heatmap = LoadCdl(cdlFile, format);
		if (heatmap == null) return;

		var stats = heatmap.GetCoverageStats();

		AnsiConsole.MarkupLine($"[cyan]CDL Coverage Statistics[/]");
		AnsiConsole.MarkupLine($"[grey]File: {cdlFile.Name}[/]");
		AnsiConsole.WriteLine();

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Type")
			.AddColumn("Bytes")
			.AddColumn("Percentage");

		table.AddRow("[green]Code[/]", stats.CodeBytes.ToString("N0"), $"{stats.CodePercentage:F2}%");
		table.AddRow("[yellow]Data[/]", stats.DataBytes.ToString("N0"), $"{stats.DataPercentage:F2}%");
		table.AddRow("[grey]Unknown[/]", stats.UnknownBytes.ToString("N0"), $"{100 - stats.CoveragePercentage:F2}%");
		table.AddRow("[bold]Total[/]", stats.TotalBytes.ToString("N0"), "100%");

		AnsiConsole.Write(table);
	}

	/// <summary>
	/// Show bank-level CDL statistics.
	/// </summary>
	public static void CdlBanks(FileInfo cdlFile, string format, int bankSize) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var heatmap = LoadCdl(cdlFile, format);
		if (heatmap == null) return;

		var bankCoverage = heatmap.GetBankCoverage(bankSize);

		AnsiConsole.MarkupLine($"[cyan]Bank Coverage Statistics[/]");
		AnsiConsole.MarkupLine($"[grey]File: {cdlFile.Name} | Bank size: 0x{bankSize:X}[/]");
		AnsiConsole.WriteLine();

		var table = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Bank")
			.AddColumn("Offset")
			.AddColumn("Code%")
			.AddColumn("Data%")
			.AddColumn("Unknown%")
			.AddColumn("Coverage Bar");

		foreach (var bank in bankCoverage) {
			var stats = bank.Stats;
			var coverageBar = GenerateCoverageBar(stats.CodePercentage, stats.DataPercentage, 20);
			table.AddRow(
				$"[cyan]${bank.BankIndex:X2}[/]",
				$"${bank.StartOffset:X6}",
				$"[green]{stats.CodePercentage:F1}%[/]",
				$"[yellow]{stats.DataPercentage:F1}%[/]",
				$"[grey]{100 - stats.CoveragePercentage:F1}%[/]",
				coverageBar
			);
		}

		AnsiConsole.Write(table);
	}

	/// <summary>
	/// Generate ASCII heatmap visualization.
	/// </summary>
	public static void CdlAsciiHeatmap(FileInfo cdlFile, string format, int width) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var heatmap = LoadCdl(cdlFile, format);
		if (heatmap == null) return;

		AnsiConsole.MarkupLine($"[cyan]CDL Heatmap[/]");
		AnsiConsole.MarkupLine($"[grey]File: {cdlFile.Name} | Width: {width}[/]");
		AnsiConsole.MarkupLine($"[grey]Legend: █=100% ▓=75%+ ▒=50%+ ░=25%+ .=<25%[/]");
		AnsiConsole.WriteLine();

		var asciiMap = heatmap.GenerateAsciiHeatmap(width);
		AnsiConsole.WriteLine(asciiMap);
	}

	/// <summary>
	/// Export CDL data to CSV.
	/// </summary>
	public static void CdlExport(FileInfo cdlFile, string format, FileInfo outputFile) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var heatmap = LoadCdl(cdlFile, format);
		if (heatmap == null) return;

		var csv = heatmap.ExportAsCsv();
		File.WriteAllText(outputFile.FullName, csv);
		AnsiConsole.MarkupLine($"[green]Exported to {outputFile.FullName}[/]");
	}

	/// <summary>
	/// Show contiguous regions in CDL data.
	/// </summary>
	public static void CdlRegions(FileInfo cdlFile, string format, int minSize) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var heatmap = LoadCdl(cdlFile, format);
		if (heatmap == null) return;

		var coveredRegions = heatmap.FindCoveredRegions(minSize);
		var uncoveredRegions = heatmap.FindUncoveredRegions(minSize);

		AnsiConsole.MarkupLine($"[cyan]CDL Regions[/]");
		AnsiConsole.MarkupLine($"[grey]File: {cdlFile.Name} | Min size: {minSize} bytes[/]");
		AnsiConsole.WriteLine();

		// Show covered regions
		AnsiConsole.MarkupLine($"[green]Covered Regions ({coveredRegions.Count})[/]");
		var coveredTable = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Start")
			.AddColumn("End")
			.AddColumn("Length")
			.AddColumn("Type");

		foreach (var (offset, length, isCode) in coveredRegions.Take(50)) {
			var type = isCode ? "[green]Code[/]" : "[yellow]Data[/]";
			coveredTable.AddRow(
				$"${offset:X6}",
				$"${offset + length - 1:X6}",
				$"{length:N0}",
				type
			);
		}
		AnsiConsole.Write(coveredTable);

		if (coveredRegions.Count > 50) {
			AnsiConsole.MarkupLine($"[grey]... and {coveredRegions.Count - 50} more covered regions[/]");
		}

		// Show uncovered regions
		AnsiConsole.WriteLine();
		AnsiConsole.MarkupLine($"[grey]Uncovered Regions ({uncoveredRegions.Count})[/]");
		var uncoveredTable = new Table()
			.Border(TableBorder.Rounded)
			.AddColumn("Start")
			.AddColumn("End")
			.AddColumn("Length");

		foreach (var (offset, length) in uncoveredRegions.Take(50)) {
			uncoveredTable.AddRow(
				$"${offset:X6}",
				$"${offset + length - 1:X6}",
				$"{length:N0}"
			);
		}
		AnsiConsole.Write(uncoveredTable);

		if (uncoveredRegions.Count > 50) {
			AnsiConsole.MarkupLine($"[grey]... and {uncoveredRegions.Count - 50} more uncovered regions[/]");
		}
	}

	/// <summary>
	/// Load CDL file based on format.
	/// </summary>
	private static CdlHeatmap? LoadCdl(FileInfo cdlFile, string format) {
		try {
			var cdlFormat = format.ToLowerInvariant() switch {
				"fceux" => CdlHeatmap.CdlFormat.Fceux,
				"mesen" => CdlHeatmap.CdlFormat.Mesen,
				"bsnes" => CdlHeatmap.CdlFormat.Bsnes,
				_ => CdlHeatmap.CdlFormat.Generic
			};
			return CdlHeatmap.FromFile(cdlFile.FullName, cdlFormat);
		} catch (Exception ex) {
			AnsiConsole.MarkupLine($"[red]Error loading CDL: {ex.Message}[/]");
			return null;
		}
	}

	/// <summary>
	/// Generate a colored coverage bar.
	/// </summary>
	private static string GenerateCoverageBar(double codePercent, double dataPercent, int width) {
		var codeChars = (int)(codePercent / 100 * width);
		var dataChars = (int)(dataPercent / 100 * width);
		var unknownChars = width - codeChars - dataChars;

		return $"[green]{new string('█', codeChars)}[/]" +
			$"[yellow]{new string('▓', dataChars)}[/]" +
			$"[grey]{new string('░', unknownChars)}[/]";
	}

	/// <summary>
	/// Merge multiple CDL files.
	/// </summary>
	public static void CdlMerge(FileInfo[] cdlFiles, FileInfo outputFile) {
		if (cdlFiles.Length < 2) {
			AnsiConsole.MarkupLine("[red]Error: At least 2 CDL files are required for merge[/]");
			return;
		}

		foreach (var cdlFile in cdlFiles) {
			if (!cdlFile.Exists) {
				AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
				return;
			}
		}

		try {
			var merged = CdlHeatmap.MergeFiles(cdlFiles.Select(f => f.FullName).ToArray());
			var stats = merged.GetCoverageStats();

			// Write merged data (we need to get the raw data)
			// For now, generate a report
			var report = merged.GenerateReport();

			AnsiConsole.MarkupLine($"[cyan]Merged {cdlFiles.Length} CDL files[/]");
			AnsiConsole.MarkupLine($"[grey]Combined coverage: {stats.CoveragePercentage:F1}%[/]");
			AnsiConsole.MarkupLine($"[grey]Code: {stats.CodeBytes:N0} bytes | Data: {stats.DataBytes:N0} bytes[/]");

			// For actual binary merge, we'd need to expose the raw data
			// For now, export as a report
			File.WriteAllText(outputFile.FullName, report);
			AnsiConsole.MarkupLine($"[green]Merged report saved to {outputFile.FullName}[/]");
		} catch (Exception ex) {
			AnsiConsole.MarkupLine($"[red]Error merging CDL files: {ex.Message}[/]");
		}
	}

	/// <summary>
	/// Compare two CDL files.
	/// </summary>
	public static void CdlDiff(FileInfo cdlFile1, FileInfo cdlFile2) {
		if (!cdlFile1.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile1.FullName}[/]");
			return;
		}
		if (!cdlFile2.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile2.FullName}[/]");
			return;
		}

		try {
			var cdl1 = CdlHeatmap.FromFile(cdlFile1.FullName);
			var cdl2 = CdlHeatmap.FromFile(cdlFile2.FullName);

			var report = cdl1.GenerateDiffReport(cdl2, cdlFile1.Name, cdlFile2.Name);
			AnsiConsole.Write(new Panel(report).Header("CDL Diff Report"));
		} catch (Exception ex) {
			AnsiConsole.MarkupLine($"[red]Error comparing CDL files: {ex.Message}[/]");
		}
	}

	/// <summary>
	/// Export CDL regions as MLB label file.
	/// </summary>
	public static void CdlExportMlb(FileInfo cdlFile, string format, FileInfo outputFile, string prefix, int minSize) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var heatmap = LoadCdl(cdlFile, format);
		if (heatmap == null) return;

		var mlb = heatmap.ExportAsMlb(minSize, prefix);
		File.WriteAllText(outputFile.FullName, mlb);

		var regionCount = heatmap.FindCoveredRegions(minSize).Count;
		AnsiConsole.MarkupLine($"[green]Exported {regionCount} labels to {outputFile.FullName}[/]");
	}

	/// <summary>
	/// Export CDL regions as SYM label file.
	/// </summary>
	public static void CdlExportSym(FileInfo cdlFile, string format, FileInfo outputFile, string prefix, int minSize, int bankSize) {
		if (!cdlFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: CDL file not found: {cdlFile.FullName}[/]");
			return;
		}

		var heatmap = LoadCdl(cdlFile, format);
		if (heatmap == null) return;

		var sym = heatmap.ExportAsSym(minSize, prefix, bankSize);
		File.WriteAllText(outputFile.FullName, sym);

		var regionCount = heatmap.FindCoveredRegions(minSize).Count;
		AnsiConsole.MarkupLine($"[green]Exported {regionCount} labels to {outputFile.FullName}[/]");
	}
}
