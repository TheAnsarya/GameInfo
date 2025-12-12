using System.Text;

namespace GameInfoTools.Analysis;

/// <summary>
/// CDL (Code/Data Log) coverage analysis and heatmap generation.
/// </summary>
public class CdlHeatmap {
	private readonly byte[] _cdlData;
	private readonly CdlFormat _format;

	/// <summary>
	/// CDL file format type.
	/// </summary>
	public enum CdlFormat {
		/// <summary>FCEUX CDL format (NES).</summary>
		Fceux,
		/// <summary>Mesen CDL format (NES/SNES).</summary>
		Mesen,
		/// <summary>bsnes CDL format (SNES).</summary>
		Bsnes,
		/// <summary>Generic CDL format.</summary>
		Generic
	}

	/// <summary>
	/// CDL byte classification.
	/// </summary>
	[Flags]
	public enum CdlFlags : byte {
		None = 0x00,
		Code = 0x01,
		Data = 0x02,
		PcmData = 0x04,
		SubEntryPoint = 0x08,
		ExternalOperand = 0x10,
		IndirectCode = 0x20,
		IndirectData = 0x40,
		DrawnToScreen = 0x80
	}

	/// <summary>
	/// Coverage statistics for a region.
	/// </summary>
	public record CoverageStats(
		int TotalBytes,
		int CodeBytes,
		int DataBytes,
		int UnknownBytes,
		double CodePercentage,
		double DataPercentage,
		double CoveragePercentage
	);

	/// <summary>
	/// Bank coverage information.
	/// </summary>
	public record BankCoverage(
		int BankIndex,
		int StartOffset,
		int EndOffset,
		CoverageStats Stats
	);

	/// <summary>
	/// Heatmap cell for visualization.
	/// </summary>
	public record HeatmapCell(
		int Offset,
		int Size,
		CdlFlags Flags,
		double Intensity // 0.0 = no coverage, 1.0 = full coverage
	);

	/// <summary>
	/// Creates a new CDL heatmap analyzer.
	/// </summary>
	/// <param name="cdlData">Raw CDL file data.</param>
	/// <param name="format">CDL format type.</param>
	public CdlHeatmap(byte[] cdlData, CdlFormat format = CdlFormat.Generic) {
		_cdlData = cdlData ?? throw new ArgumentNullException(nameof(cdlData));
		_format = format;
	}

	/// <summary>
	/// Creates a new CDL heatmap analyzer from file.
	/// </summary>
	/// <param name="cdlPath">Path to CDL file.</param>
	/// <param name="format">CDL format type (auto-detected if not specified).</param>
	public static CdlHeatmap FromFile(string cdlPath, CdlFormat? format = null) {
		var data = File.ReadAllBytes(cdlPath);
		var detectedFormat = format ?? DetectFormat(cdlPath, data);
		return new CdlHeatmap(data, detectedFormat);
	}

	/// <summary>
	/// Auto-detect CDL format from file extension and content.
	/// </summary>
	private static CdlFormat DetectFormat(string path, byte[] data) {
		var ext = Path.GetExtension(path).ToLowerInvariant();

		// Try to detect by extension
		if (ext == ".cdl") {
			// Check for FCEUX format (PRG + CHR sections)
			if (data.Length > 0 && data.Length % 0x4000 == 0) {
				return CdlFormat.Fceux;
			}
		}

		if (ext == ".mcdl") {
			return CdlFormat.Mesen;
		}

		// Check for bsnes usage map format
		if (path.Contains("usage", StringComparison.OrdinalIgnoreCase)) {
			return CdlFormat.Bsnes;
		}

		return CdlFormat.Generic;
	}

	/// <summary>
	/// Gets the total size of the CDL data.
	/// </summary>
	public int Size => _cdlData.Length;

	/// <summary>
	/// Gets the CDL format.
	/// </summary>
	public CdlFormat Format => _format;

	/// <summary>
	/// Gets the CDL flags for a specific offset.
	/// </summary>
	public CdlFlags GetFlags(int offset) {
		if (offset < 0 || offset >= _cdlData.Length)
			return CdlFlags.None;

		return (CdlFlags)_cdlData[offset];
	}

	/// <summary>
	/// Checks if an offset has been covered (code or data).
	/// </summary>
	public bool IsCovered(int offset) {
		var flags = GetFlags(offset);
		return flags != CdlFlags.None;
	}

	/// <summary>
	/// Checks if an offset is marked as code.
	/// </summary>
	public bool IsCode(int offset) {
		return (GetFlags(offset) & CdlFlags.Code) != 0;
	}

	/// <summary>
	/// Checks if an offset is marked as data.
	/// </summary>
	public bool IsData(int offset) {
		var flags = GetFlags(offset);
		return flags != CdlFlags.None && (flags & CdlFlags.Code) == 0;
	}

	/// <summary>
	/// Calculates coverage statistics for a range.
	/// </summary>
	public CoverageStats GetCoverageStats(int startOffset = 0, int length = -1) {
		if (length < 0) length = _cdlData.Length - startOffset;

		int endOffset = Math.Min(startOffset + length, _cdlData.Length);
		int total = endOffset - startOffset;
		int code = 0, data = 0, unknown = 0;

		for (int i = startOffset; i < endOffset; i++) {
			var flags = (CdlFlags)_cdlData[i];
			if (flags == CdlFlags.None) {
				unknown++;
			} else if ((flags & CdlFlags.Code) != 0) {
				code++;
			} else {
				data++;
			}
		}

		double codePercent = total > 0 ? (double)code / total * 100 : 0;
		double dataPercent = total > 0 ? (double)data / total * 100 : 0;
		double coveragePercent = total > 0 ? (double)(code + data) / total * 100 : 0;

		return new CoverageStats(total, code, data, unknown, codePercent, dataPercent, coveragePercent);
	}

	/// <summary>
	/// Gets coverage statistics per bank.
	/// </summary>
	/// <param name="bankSize">Size of each bank in bytes.</param>
	public List<BankCoverage> GetBankCoverage(int bankSize = 0x4000) {
		var banks = new List<BankCoverage>();
		int bankIndex = 0;
		int offset = 0;

		while (offset < _cdlData.Length) {
			int size = Math.Min(bankSize, _cdlData.Length - offset);
			var stats = GetCoverageStats(offset, size);
			banks.Add(new BankCoverage(bankIndex, offset, offset + size - 1, stats));
			bankIndex++;
			offset += bankSize;
		}

		return banks;
	}

	/// <summary>
	/// Generates heatmap cells for visualization.
	/// </summary>
	/// <param name="cellSize">Size of each cell in bytes.</param>
	public List<HeatmapCell> GenerateHeatmap(int cellSize = 256) {
		var cells = new List<HeatmapCell>();

		for (int offset = 0; offset < _cdlData.Length; offset += cellSize) {
			int size = Math.Min(cellSize, _cdlData.Length - offset);
			int covered = 0;
			CdlFlags combinedFlags = CdlFlags.None;

			for (int i = 0; i < size; i++) {
				var flags = (CdlFlags)_cdlData[offset + i];
				if (flags != CdlFlags.None) {
					covered++;
					combinedFlags |= flags;
				}
			}

			double intensity = (double)covered / size;
			cells.Add(new HeatmapCell(offset, size, combinedFlags, intensity));
		}

		return cells;
	}

	/// <summary>
	/// Generates an ASCII art heatmap.
	/// </summary>
	/// <param name="width">Width in characters.</param>
	/// <param name="height">Height in characters.</param>
	public string GenerateAsciiHeatmap(int width = 64, int height = 16) {
		var sb = new StringBuilder();
		int cellsPerRow = (_cdlData.Length + height - 1) / height;
		int bytesPerCell = (cellsPerRow + width - 1) / width;

		// Header
		sb.AppendLine($"CDL Coverage Heatmap ({_cdlData.Length:N0} bytes)");
		sb.AppendLine(new string('─', width + 4));

		for (int row = 0; row < height; row++) {
			int rowStart = row * cellsPerRow;
			if (rowStart >= _cdlData.Length) break;

			sb.Append("│ ");
			for (int col = 0; col < width; col++) {
				int cellStart = rowStart + (col * bytesPerCell);
				if (cellStart >= _cdlData.Length) {
					sb.Append(' ');
					continue;
				}

				int cellEnd = Math.Min(cellStart + bytesPerCell, _cdlData.Length);
				int covered = 0;
				bool hasCode = false;
				bool hasData = false;

				for (int i = cellStart; i < cellEnd; i++) {
					var flags = (CdlFlags)_cdlData[i];
					if (flags != CdlFlags.None) {
						covered++;
						hasCode |= (flags & CdlFlags.Code) != 0;
						hasData |= flags != CdlFlags.None && (flags & CdlFlags.Code) == 0;
					}
				}

				double intensity = (double)covered / (cellEnd - cellStart);
				char c = GetHeatmapChar(intensity, hasCode, hasData);
				sb.Append(c);
			}
			sb.AppendLine(" │");
		}

		sb.AppendLine(new string('─', width + 4));

		// Legend
		sb.AppendLine("Legend: ░ 0-25% │ ▒ 25-50% │ ▓ 50-75% │ █ 75-100% │ · no coverage");

		return sb.ToString();
	}

	private static char GetHeatmapChar(double intensity, bool hasCode, bool hasData) {
		if (intensity < 0.01) return '·';
		if (intensity < 0.25) return '░';
		if (intensity < 0.50) return '▒';
		if (intensity < 0.75) return '▓';
		return '█';
	}

	/// <summary>
	/// Generates a summary report.
	/// </summary>
	public string GenerateReport(int bankSize = 0x4000) {
		var sb = new StringBuilder();
		var stats = GetCoverageStats();
		var banks = GetBankCoverage(bankSize);

		sb.AppendLine("╔══════════════════════════════════════════════════════════════╗");
		sb.AppendLine("║               CDL COVERAGE ANALYSIS REPORT                   ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ Format: {_format,-20} Size: {_cdlData.Length,12:N0} bytes   ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ Total Coverage: {stats.CoveragePercentage,7:F2}%                                 ║");
		sb.AppendLine($"║ Code:           {stats.CodePercentage,7:F2}% ({stats.CodeBytes,10:N0} bytes)          ║");
		sb.AppendLine($"║ Data:           {stats.DataPercentage,7:F2}% ({stats.DataBytes,10:N0} bytes)          ║");
		sb.AppendLine($"║ Unknown:        {100 - stats.CoveragePercentage,7:F2}% ({stats.UnknownBytes,10:N0} bytes)          ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine("║ BANK COVERAGE                                                ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");

		foreach (var bank in banks) {
			string bar = GenerateProgressBar(bank.Stats.CoveragePercentage, 20);
			sb.AppendLine($"║ Bank {bank.BankIndex,2}: {bar} {bank.Stats.CoveragePercentage,5:F1}% (C:{bank.Stats.CodePercentage,4:F0}% D:{bank.Stats.DataPercentage,4:F0}%) ║");
		}

		sb.AppendLine("╚══════════════════════════════════════════════════════════════╝");

		return sb.ToString();
	}

	private static string GenerateProgressBar(double percentage, int width) {
		int filled = (int)(percentage / 100 * width);
		filled = Math.Clamp(filled, 0, width);
		return new string('█', filled) + new string('░', width - filled);
	}

	/// <summary>
	/// Finds uncovered regions larger than a threshold.
	/// </summary>
	/// <param name="minSize">Minimum size of uncovered region to report.</param>
	public List<(int Offset, int Length)> FindUncoveredRegions(int minSize = 16) {
		var regions = new List<(int Offset, int Length)>();
		int regionStart = -1;

		for (int i = 0; i <= _cdlData.Length; i++) {
			bool uncovered = i < _cdlData.Length && _cdlData[i] == 0;

			if (uncovered && regionStart < 0) {
				regionStart = i;
			} else if (!uncovered && regionStart >= 0) {
				int length = i - regionStart;
				if (length >= minSize) {
					regions.Add((regionStart, length));
				}
				regionStart = -1;
			}
		}

		return regions;
	}

	/// <summary>
	/// Finds covered regions.
	/// </summary>
	public List<(int Offset, int Length, bool IsCode)> FindCoveredRegions(int minSize = 1) {
		var regions = new List<(int Offset, int Length, bool IsCode)>();
		int regionStart = -1;
		bool isCode = false;

		for (int i = 0; i <= _cdlData.Length; i++) {
			bool covered = i < _cdlData.Length && _cdlData[i] != 0;
			bool currentIsCode = i < _cdlData.Length && (_cdlData[i] & 0x01) != 0;

			if (covered && regionStart < 0) {
				regionStart = i;
				isCode = currentIsCode;
			} else if ((!covered || currentIsCode != isCode) && regionStart >= 0) {
				int length = i - regionStart;
				if (length >= minSize) {
					regions.Add((regionStart, length, isCode));
				}
				regionStart = covered ? i : -1;
				isCode = currentIsCode;
			}
		}

		return regions;
	}

	/// <summary>
	/// Exports heatmap data as CSV.
	/// </summary>
	public string ExportAsCsv(int cellSize = 256) {
		var sb = new StringBuilder();
		sb.AppendLine("Offset,Size,Intensity,HasCode,HasData");

		var cells = GenerateHeatmap(cellSize);
		foreach (var cell in cells) {
			bool hasCode = (cell.Flags & CdlFlags.Code) != 0;
			bool hasData = cell.Flags != CdlFlags.None && !hasCode;
			sb.AppendLine($"0x{cell.Offset:X6},{cell.Size},{cell.Intensity:F4},{hasCode},{hasData}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Exports heatmap data as JSON.
	/// </summary>
	public string ExportAsJson(int cellSize = 256) {
		var sb = new StringBuilder();
		var stats = GetCoverageStats();
		var cells = GenerateHeatmap(cellSize);

		sb.AppendLine("{");
		sb.AppendLine($"  \"format\": \"{_format}\",");
		sb.AppendLine($"  \"size\": {_cdlData.Length},");
		sb.AppendLine($"  \"cellSize\": {cellSize},");
		sb.AppendLine("  \"stats\": {");
		sb.AppendLine($"    \"totalBytes\": {stats.TotalBytes},");
		sb.AppendLine($"    \"codeBytes\": {stats.CodeBytes},");
		sb.AppendLine($"    \"dataBytes\": {stats.DataBytes},");
		sb.AppendLine($"    \"unknownBytes\": {stats.UnknownBytes},");
		sb.AppendLine($"    \"codePercentage\": {stats.CodePercentage:F2},");
		sb.AppendLine($"    \"dataPercentage\": {stats.DataPercentage:F2},");
		sb.AppendLine($"    \"coveragePercentage\": {stats.CoveragePercentage:F2}");
		sb.AppendLine("  },");
		sb.AppendLine("  \"cells\": [");

		for (int i = 0; i < cells.Count; i++) {
			var cell = cells[i];
			string comma = i < cells.Count - 1 ? "," : "";
			sb.AppendLine($"    {{\"offset\": {cell.Offset}, \"intensity\": {cell.Intensity:F4}}}{comma}");
		}

		sb.AppendLine("  ]");
		sb.AppendLine("}");

		return sb.ToString();
	}

	/// <summary>
	/// Merges multiple CDL files into one, combining coverage from all sessions.
	/// </summary>
	/// <param name="cdlFiles">CDL heatmaps to merge.</param>
	/// <returns>A new CDL heatmap with combined coverage.</returns>
	public static CdlHeatmap Merge(params CdlHeatmap[] cdlFiles) {
		if (cdlFiles == null || cdlFiles.Length == 0)
			throw new ArgumentException("At least one CDL file is required for merge", nameof(cdlFiles));

		if (cdlFiles.Length == 1)
			return cdlFiles[0];

		// Use the largest size
		int maxSize = cdlFiles.Max(c => c.Size);
		byte[] merged = new byte[maxSize];

		// OR all flags together
		foreach (var cdl in cdlFiles) {
			for (int i = 0; i < cdl.Size; i++) {
				merged[i] |= cdl._cdlData[i];
			}
		}

		// Use format of first file
		return new CdlHeatmap(merged, cdlFiles[0].Format);
	}

	/// <summary>
	/// Merges CDL files from disk.
	/// </summary>
	/// <param name="paths">Paths to CDL files.</param>
	/// <returns>A new merged CDL heatmap.</returns>
	public static CdlHeatmap MergeFiles(params string[] paths) {
		var cdlFiles = paths.Select(p => FromFile(p)).ToArray();
		return Merge(cdlFiles);
	}

	/// <summary>
	/// Computes the difference between two CDL files.
	/// </summary>
	/// <param name="other">The CDL to compare against.</param>
	/// <returns>Diff result showing what's unique to each and what's common.</returns>
	public CdlDiff Diff(CdlHeatmap other) {
		if (other == null)
			throw new ArgumentNullException(nameof(other));

		int size = Math.Max(Size, other.Size);
		byte[] onlyThis = new byte[size];
		byte[] onlyOther = new byte[size];
		byte[] common = new byte[size];

		for (int i = 0; i < size; i++) {
			byte thisFlags = i < Size ? _cdlData[i] : (byte)0;
			byte otherFlags = i < other.Size ? other._cdlData[i] : (byte)0;

			common[i] = (byte)(thisFlags & otherFlags);
			onlyThis[i] = (byte)(thisFlags & ~otherFlags);
			onlyOther[i] = (byte)(otherFlags & ~thisFlags);
		}

		return new CdlDiff(
			new CdlHeatmap(onlyThis, _format),
			new CdlHeatmap(onlyOther, other._format),
			new CdlHeatmap(common, _format)
		);
	}

	/// <summary>
	/// Generates a diff report between this CDL and another.
	/// </summary>
	/// <param name="other">The CDL to compare against.</param>
	/// <param name="thisName">Name for this CDL file.</param>
	/// <param name="otherName">Name for the other CDL file.</param>
	public string GenerateDiffReport(CdlHeatmap other, string thisName = "File A", string otherName = "File B") {
		var diff = Diff(other);
		var sb = new StringBuilder();

		var thisStats = GetCoverageStats();
		var otherStats = other.GetCoverageStats();
		var commonStats = diff.Common.GetCoverageStats();
		var onlyThisStats = diff.OnlyInFirst.GetCoverageStats();
		var onlyOtherStats = diff.OnlyInSecond.GetCoverageStats();

		sb.AppendLine("╔══════════════════════════════════════════════════════════════╗");
		sb.AppendLine("║                   CDL DIFF COMPARISON                        ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ {thisName,-30} Coverage: {thisStats.CoveragePercentage,6:F2}%    ║");
		sb.AppendLine($"║ {otherName,-30} Coverage: {otherStats.CoveragePercentage,6:F2}%    ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ Common coverage:        {commonStats.CodeBytes + commonStats.DataBytes,10:N0} bytes              ║");
		sb.AppendLine($"║ Only in {thisName,-16}:  {onlyThisStats.CodeBytes + onlyThisStats.DataBytes,10:N0} bytes              ║");
		sb.AppendLine($"║ Only in {otherName,-16}:  {onlyOtherStats.CodeBytes + onlyOtherStats.DataBytes,10:N0} bytes              ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");

		// Show code breakdown
		sb.AppendLine($"║ Common code:            {commonStats.CodeBytes,10:N0} bytes              ║");
		sb.AppendLine($"║ {thisName,-16} only code:   {onlyThisStats.CodeBytes,10:N0} bytes              ║");
		sb.AppendLine($"║ {otherName,-16} only code:   {onlyOtherStats.CodeBytes,10:N0} bytes              ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");

		// Show data breakdown
		sb.AppendLine($"║ Common data:            {commonStats.DataBytes,10:N0} bytes              ║");
		sb.AppendLine($"║ {thisName,-16} only data:   {onlyThisStats.DataBytes,10:N0} bytes              ║");
		sb.AppendLine($"║ {otherName,-16} only data:   {onlyOtherStats.DataBytes,10:N0} bytes              ║");
		sb.AppendLine("╚══════════════════════════════════════════════════════════════╝");

		return sb.ToString();
	}

	/// <summary>
	/// Result of comparing two CDL files.
	/// </summary>
	public record CdlDiff(
		CdlHeatmap OnlyInFirst,
		CdlHeatmap OnlyInSecond,
		CdlHeatmap Common
	);

	/// <summary>
	/// Exports covered code regions as MLB (Mesen Label) file format.
	/// </summary>
	/// <param name="minRegionSize">Minimum region size to export as a label.</param>
	/// <param name="labelPrefix">Prefix for auto-generated labels.</param>
	/// <param name="baseAddress">Base address for PRG ROM (e.g., 0x8000 for NES).</param>
	public string ExportAsMlb(int minRegionSize = 8, string labelPrefix = "cdl", int baseAddress = 0x8000) {
		var sb = new StringBuilder();
		sb.AppendLine("# MLB Labels generated from CDL coverage data");
		sb.AppendLine($"# Format: {_format}");
		sb.AppendLine($"# Coverage: {GetCoverageStats().CoveragePercentage:F1}%");
		sb.AppendLine();

		var codeRegions = FindCoveredRegions(minRegionSize);
		int labelIndex = 0;

		foreach (var (offset, length, isCode) in codeRegions) {
			string type = isCode ? "P" : "P"; // Both code and data go to PRG for now
			int address = baseAddress + (offset % 0x8000); // Handle banking
			string label = $"{labelPrefix}_{(isCode ? "code" : "data")}_{labelIndex:D4}";
			string comment = $"CDL: {(isCode ? "Code" : "Data")} region, {length} bytes at file offset 0x{offset:X6}";

			sb.AppendLine($"{type}:{address:X4}:{label}:{comment}");
			labelIndex++;
		}

		return sb.ToString();
	}

	/// <summary>
	/// Exports covered regions as SYM (Symbol) file format.
	/// Compatible with various emulators and debuggers.
	/// </summary>
	/// <param name="minRegionSize">Minimum region size to export.</param>
	/// <param name="labelPrefix">Prefix for auto-generated labels.</param>
	/// <param name="bankSize">Size of each bank for address calculation.</param>
	public string ExportAsSym(int minRegionSize = 8, string labelPrefix = "cdl", int bankSize = 0x4000) {
		var sb = new StringBuilder();
		sb.AppendLine("; SYM Labels generated from CDL coverage data");
		sb.AppendLine($"; Format: {_format}");
		sb.AppendLine($"; Coverage: {GetCoverageStats().CoveragePercentage:F1}%");
		sb.AppendLine();
		sb.AppendLine("[labels]");

		var regions = FindCoveredRegions(minRegionSize);
		int labelIndex = 0;

		foreach (var (offset, length, isCode) in regions) {
			// Calculate bank and offset within bank
			int bank = offset / bankSize;
			int bankOffset = offset % bankSize;
			int address = 0x8000 + bankOffset; // NES PRG ROM starts at $8000

			string label = $"{labelPrefix}_{(isCode ? "code" : "data")}_{labelIndex:D4}";
			string comment = isCode ? "Code" : "Data";

			sb.AppendLine($"{bank:X2}:{address:X4} {label} ; {comment}, {length} bytes");
			labelIndex++;
		}

		return sb.ToString();
	}

	/// <summary>
	/// Exports uncovered regions for investigation.
	/// </summary>
	/// <param name="minSize">Minimum size of uncovered region to report.</param>
	/// <param name="format">Output format: "mlb", "sym", or "txt".</param>
	public string ExportUncoveredRegions(int minSize = 64, string format = "txt") {
		var regions = FindUncoveredRegions(minSize);
		var sb = new StringBuilder();

		if (format == "mlb") {
			sb.AppendLine("# MLB Labels for uncovered regions");
			sb.AppendLine("# These areas were not accessed during gameplay");
			sb.AppendLine();
			int index = 0;
			foreach (var (offset, length) in regions) {
				int address = 0x8000 + (offset % 0x8000);
				sb.AppendLine($"P:{address:X4}:unknown_{index:D4}:Uncovered region, {length} bytes at 0x{offset:X6}");
				index++;
			}
		} else if (format == "sym") {
			sb.AppendLine("; Uncovered regions for investigation");
			sb.AppendLine("[labels]");
			int index = 0;
			foreach (var (offset, length) in regions) {
				int bank = offset / 0x4000;
				int address = 0x8000 + (offset % 0x4000);
				sb.AppendLine($"{bank:X2}:{address:X4} unknown_{index:D4} ; {length} bytes uncovered");
				index++;
			}
		} else {
			sb.AppendLine("Uncovered Regions Report");
			sb.AppendLine("========================");
			sb.AppendLine();
			foreach (var (offset, length) in regions) {
				sb.AppendLine($"Offset: 0x{offset:X6}  Length: {length,6:N0} bytes  (0x{length:X4})");
			}
			sb.AppendLine();
			sb.AppendLine($"Total uncovered regions: {regions.Count}");
			sb.AppendLine($"Total uncovered bytes: {regions.Sum(r => r.Length):N0}");
		}

		return sb.ToString();
	}

	#region Format Conversion

	/// <summary>
	/// Gets the raw CDL data for export or conversion.
	/// </summary>
	public byte[] GetRawData() => (byte[])_cdlData.Clone();

	/// <summary>
	/// Converts CDL data to a different emulator format.
	/// </summary>
	/// <param name="targetFormat">Target CDL format.</param>
	/// <returns>New CdlHeatmap with converted data.</returns>
	public CdlHeatmap ConvertTo(CdlFormat targetFormat) {
		if (_format == targetFormat)
			return this;

		var convertedData = _format switch {
			CdlFormat.Fceux => targetFormat switch {
				CdlFormat.Mesen => ConvertFceuxToMesen(_cdlData),
				CdlFormat.Bsnes => ConvertFceuxToBsnes(_cdlData),
				_ => _cdlData
			},
			CdlFormat.Mesen => targetFormat switch {
				CdlFormat.Fceux => ConvertMesenToFceux(_cdlData),
				CdlFormat.Bsnes => ConvertMesenToBsnes(_cdlData),
				_ => _cdlData
			},
			CdlFormat.Bsnes => targetFormat switch {
				CdlFormat.Fceux => ConvertBsnesToFceux(_cdlData),
				CdlFormat.Mesen => ConvertBsnesToMesen(_cdlData),
				_ => _cdlData
			},
			_ => _cdlData
		};

		return new CdlHeatmap(convertedData, targetFormat);
	}

	/// <summary>
	/// Saves the CDL data to a file in the specified format.
	/// </summary>
	/// <param name="path">Output file path.</param>
	/// <param name="targetFormat">Target format (uses current format if not specified).</param>
	public void SaveToFile(string path, CdlFormat? targetFormat = null) {
		var format = targetFormat ?? _format;
		var dataToSave = format == _format ? _cdlData : ConvertTo(format).GetRawData();
		File.WriteAllBytes(path, dataToSave);
	}

	/// <summary>
	/// Converts FCEUX CDL format to Mesen CDL format.
	/// FCEUX and Mesen use similar byte layouts but Mesen may have additional header data.
	/// </summary>
	private static byte[] ConvertFceuxToMesen(byte[] fceuxData) {
		// Mesen CDL format is very similar to FCEUX for basic coverage
		// The main difference is Mesen includes header information
		// For NES: Both use 1 byte per ROM byte with similar flag meanings
		var result = new byte[fceuxData.Length];
		for (int i = 0; i < fceuxData.Length; i++) {
			// FCEUX flags: 0x01=Code, 0x02=Data, 0x10=SubEntryPoint, 0x20=ExternalOperand
			// Mesen flags: 0x01=Code, 0x02=Data, 0x04=JumpTarget, 0x08=SubEntryPoint
			byte fceux = fceuxData[i];
			byte mesen = 0;

			// Direct mappings
			if ((fceux & 0x01) != 0) mesen |= 0x01; // Code
			if ((fceux & 0x02) != 0) mesen |= 0x02; // Data
			if ((fceux & 0x10) != 0) mesen |= 0x08; // SubEntryPoint -> SubEntryPoint

			result[i] = mesen;
		}
		return result;
	}

	/// <summary>
	/// Converts Mesen CDL format to FCEUX CDL format.
	/// </summary>
	private static byte[] ConvertMesenToFceux(byte[] mesenData) {
		var result = new byte[mesenData.Length];
		for (int i = 0; i < mesenData.Length; i++) {
			byte mesen = mesenData[i];
			byte fceux = 0;

			// Mesen flags: 0x01=Code, 0x02=Data, 0x04=JumpTarget, 0x08=SubEntryPoint
			// FCEUX flags: 0x01=Code, 0x02=Data, 0x10=SubEntryPoint, 0x20=ExternalOperand
			if ((mesen & 0x01) != 0) fceux |= 0x01; // Code
			if ((mesen & 0x02) != 0) fceux |= 0x02; // Data
			if ((mesen & 0x08) != 0) fceux |= 0x10; // SubEntryPoint

			result[i] = fceux;
		}
		return result;
	}

	/// <summary>
	/// Converts FCEUX CDL format to bsnes/usage map format.
	/// bsnes uses different flag values for SNES coverage.
	/// </summary>
	private static byte[] ConvertFceuxToBsnes(byte[] fceuxData) {
		// bsnes usage map: 0x80=Executed, 0x40=Read, 0x20=Written
		var result = new byte[fceuxData.Length];
		for (int i = 0; i < fceuxData.Length; i++) {
			byte fceux = fceuxData[i];
			byte bsnes = 0;

			if ((fceux & 0x01) != 0) bsnes |= 0x80; // Code -> Executed
			if ((fceux & 0x02) != 0) bsnes |= 0x40; // Data -> Read

			result[i] = bsnes;
		}
		return result;
	}

	/// <summary>
	/// Converts bsnes usage map format to FCEUX CDL format.
	/// </summary>
	private static byte[] ConvertBsnesToFceux(byte[] bsnesData) {
		var result = new byte[bsnesData.Length];
		for (int i = 0; i < bsnesData.Length; i++) {
			byte bsnes = bsnesData[i];
			byte fceux = 0;

			// bsnes: 0x80=Executed, 0x40=Read, 0x20=Written
			if ((bsnes & 0x80) != 0) fceux |= 0x01; // Executed -> Code
			if ((bsnes & 0x40) != 0) fceux |= 0x02; // Read -> Data

			result[i] = fceux;
		}
		return result;
	}

	/// <summary>
	/// Converts Mesen CDL format to bsnes usage map format.
	/// </summary>
	private static byte[] ConvertMesenToBsnes(byte[] mesenData) {
		var result = new byte[mesenData.Length];
		for (int i = 0; i < mesenData.Length; i++) {
			byte mesen = mesenData[i];
			byte bsnes = 0;

			if ((mesen & 0x01) != 0) bsnes |= 0x80; // Code -> Executed
			if ((mesen & 0x02) != 0) bsnes |= 0x40; // Data -> Read

			result[i] = bsnes;
		}
		return result;
	}

	/// <summary>
	/// Converts bsnes usage map format to Mesen CDL format.
	/// </summary>
	private static byte[] ConvertBsnesToMesen(byte[] bsnesData) {
		var result = new byte[bsnesData.Length];
		for (int i = 0; i < bsnesData.Length; i++) {
			byte bsnes = bsnesData[i];
			byte mesen = 0;

			if ((bsnes & 0x80) != 0) mesen |= 0x01; // Executed -> Code
			if ((bsnes & 0x40) != 0) mesen |= 0x02; // Read -> Data

			result[i] = mesen;
		}
		return result;
	}

	/// <summary>
	/// Generates a conversion report between two formats.
	/// </summary>
	/// <param name="targetFormat">Target format for conversion.</param>
	public string GenerateConversionReport(CdlFormat targetFormat) {
		var converted = ConvertTo(targetFormat);
		var originalStats = GetCoverageStats();
		var convertedStats = converted.GetCoverageStats();

		var sb = new StringBuilder();
		sb.AppendLine("╔══════════════════════════════════════════════════════════════╗");
		sb.AppendLine("║              CDL FORMAT CONVERSION REPORT                    ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ Source Format:   {_format,-20} Size: {Size,10:N0}    ║");
		sb.AppendLine($"║ Target Format:   {targetFormat,-20} Size: {converted.Size,10:N0}    ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ Original Coverage: {originalStats.CoveragePercentage,7:F2}%                           ║");
		sb.AppendLine($"║   Code:            {originalStats.CodePercentage,7:F2}% ({originalStats.CodeBytes,10:N0} bytes)    ║");
		sb.AppendLine($"║   Data:            {originalStats.DataPercentage,7:F2}% ({originalStats.DataBytes,10:N0} bytes)    ║");
		sb.AppendLine("╠══════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ Converted Coverage: {convertedStats.CoveragePercentage,6:F2}%                           ║");
		sb.AppendLine($"║   Code:             {convertedStats.CodePercentage,6:F2}% ({convertedStats.CodeBytes,10:N0} bytes)    ║");
		sb.AppendLine($"║   Data:             {convertedStats.DataPercentage,6:F2}% ({convertedStats.DataBytes,10:N0} bytes)    ║");
		sb.AppendLine("╚══════════════════════════════════════════════════════════════╝");

		return sb.ToString();
	}

	#endregion

	#region Search and Pattern Matching

	/// <summary>
	/// Search result for pattern matching.
	/// </summary>
	public record SearchResult(
		int Offset,
		CdlFlags Flags,
		string Type
	) {
		public string OffsetHex => $"${Offset:X6}";
	}

	/// <summary>
	/// Searches for offsets that match specific CDL flags.
	/// </summary>
	/// <param name="flags">Flags to search for.</param>
	/// <param name="matchAll">If true, offset must have all flags; if false, any matching flag.</param>
	/// <param name="maxResults">Maximum number of results to return.</param>
	/// <returns>List of matching offsets.</returns>
	public List<SearchResult> SearchByFlags(CdlFlags flags, bool matchAll = false, int maxResults = 1000) {
		var results = new List<SearchResult>();

		for (int i = 0; i < _cdlData.Length && results.Count < maxResults; i++) {
			var currentFlags = (CdlFlags)_cdlData[i];

			bool matches = matchAll
				? (currentFlags & flags) == flags
				: (currentFlags & flags) != CdlFlags.None;

			if (matches) {
				string type = (currentFlags & CdlFlags.Code) != 0 ? "Code" :
							  (currentFlags & CdlFlags.Data) != 0 ? "Data" : "Unknown";
				results.Add(new SearchResult(i, currentFlags, type));
			}
		}

		return results;
	}

	/// <summary>
	/// Searches for transitions between covered and uncovered regions.
	/// </summary>
	/// <param name="maxResults">Maximum number of results to return.</param>
	/// <returns>List of boundary offsets.</returns>
	public List<SearchResult> FindCoverageBoundaries(int maxResults = 1000) {
		var results = new List<SearchResult>();
		if (_cdlData.Length == 0) return results;

		bool wasCovered = _cdlData[0] != 0;

		for (int i = 1; i < _cdlData.Length && results.Count < maxResults; i++) {
			bool isCovered = _cdlData[i] != 0;

			if (isCovered != wasCovered) {
				var flags = (CdlFlags)_cdlData[i];
				string type = isCovered ? "Start of coverage" : "End of coverage";
				results.Add(new SearchResult(i, flags, type));
			}

			wasCovered = isCovered;
		}

		return results;
	}

	/// <summary>
	/// Searches for sub-entry points (function entry points that aren't main entry).
	/// </summary>
	/// <param name="maxResults">Maximum number of results to return.</param>
	public List<SearchResult> FindSubEntryPoints(int maxResults = 1000) {
		return SearchByFlags(CdlFlags.SubEntryPoint, matchAll: true, maxResults);
	}

	/// <summary>
	/// Searches for indirect code jumps (computed jump targets).
	/// </summary>
	/// <param name="maxResults">Maximum number of results to return.</param>
	public List<SearchResult> FindIndirectCode(int maxResults = 1000) {
		return SearchByFlags(CdlFlags.IndirectCode, matchAll: true, maxResults);
	}

	/// <summary>
	/// Searches for bytes at a specific offset range.
	/// </summary>
	/// <param name="startOffset">Start of range.</param>
	/// <param name="endOffset">End of range (exclusive).</param>
	public List<SearchResult> SearchRange(int startOffset, int endOffset) {
		var results = new List<SearchResult>();
		startOffset = Math.Max(0, startOffset);
		endOffset = Math.Min(_cdlData.Length, endOffset);

		for (int i = startOffset; i < endOffset; i++) {
			var flags = (CdlFlags)_cdlData[i];
			string type = (flags & CdlFlags.Code) != 0 ? "Code" :
						  (flags & CdlFlags.Data) != 0 ? "Data" : "Unknown";
			results.Add(new SearchResult(i, flags, type));
		}

		return results;
	}

	/// <summary>
	/// Finds the next occurrence of a flag pattern starting from an offset.
	/// </summary>
	/// <param name="startOffset">Starting offset for search.</param>
	/// <param name="flags">Flags to search for.</param>
	/// <param name="searchBackward">Search backward from start offset.</param>
	/// <returns>Offset of match, or -1 if not found.</returns>
	public int FindNext(int startOffset, CdlFlags flags, bool searchBackward = false) {
		if (searchBackward) {
			for (int i = Math.Min(startOffset - 1, _cdlData.Length - 1); i >= 0; i--) {
				if (((CdlFlags)_cdlData[i] & flags) != CdlFlags.None) {
					return i;
				}
			}
		} else {
			for (int i = Math.Max(startOffset + 1, 0); i < _cdlData.Length; i++) {
				if (((CdlFlags)_cdlData[i] & flags) != CdlFlags.None) {
					return i;
				}
			}
		}

		return -1;
	}

	#endregion

	#region Bookmarks

	/// <summary>
	/// A bookmark for marking interesting offsets.
	/// </summary>
	public record Bookmark(
		int Offset,
		string Label,
		string? Description = null,
		string? Category = null
	) {
		public string OffsetHex => $"${Offset:X6}";
	}

	/// <summary>
	/// Collection of bookmarks for this CDL data.
	/// </summary>
	private readonly List<Bookmark> _bookmarks = [];

	/// <summary>
	/// Gets all bookmarks.
	/// </summary>
	public IReadOnlyList<Bookmark> Bookmarks => _bookmarks.AsReadOnly();

	/// <summary>
	/// Adds a new bookmark.
	/// </summary>
	/// <param name="offset">Offset to bookmark.</param>
	/// <param name="label">Label for the bookmark.</param>
	/// <param name="description">Optional description.</param>
	/// <param name="category">Optional category for grouping.</param>
	public void AddBookmark(int offset, string label, string? description = null, string? category = null) {
		if (offset < 0 || offset >= _cdlData.Length) {
			throw new ArgumentOutOfRangeException(nameof(offset), "Offset is outside CDL data range");
		}

		// Remove existing bookmark at same offset
		_bookmarks.RemoveAll(b => b.Offset == offset);

		_bookmarks.Add(new Bookmark(offset, label, description, category));
		_bookmarks.Sort((a, b) => a.Offset.CompareTo(b.Offset));
	}

	/// <summary>
	/// Removes a bookmark at the specified offset.
	/// </summary>
	public bool RemoveBookmark(int offset) {
		return _bookmarks.RemoveAll(b => b.Offset == offset) > 0;
	}

	/// <summary>
	/// Clears all bookmarks.
	/// </summary>
	public void ClearBookmarks() {
		_bookmarks.Clear();
	}

	/// <summary>
	/// Gets bookmarks in a specific category.
	/// </summary>
	public IEnumerable<Bookmark> GetBookmarksByCategory(string category) {
		return _bookmarks.Where(b => b.Category == category);
	}

	/// <summary>
	/// Gets the next bookmark after the specified offset.
	/// </summary>
	public Bookmark? GetNextBookmark(int currentOffset) {
		return _bookmarks.FirstOrDefault(b => b.Offset > currentOffset);
	}

	/// <summary>
	/// Gets the previous bookmark before the specified offset.
	/// </summary>
	public Bookmark? GetPreviousBookmark(int currentOffset) {
		return _bookmarks.LastOrDefault(b => b.Offset < currentOffset);
	}

	/// <summary>
	/// Auto-generates bookmarks for interesting locations.
	/// </summary>
	/// <param name="includeSubEntryPoints">Include sub-entry points as bookmarks.</param>
	/// <param name="includeCoverageBoundaries">Include coverage start/end boundaries.</param>
	/// <param name="maxBookmarks">Maximum bookmarks to generate.</param>
	public void AutoGenerateBookmarks(bool includeSubEntryPoints = true, bool includeCoverageBoundaries = true, int maxBookmarks = 100) {
		int count = 0;

		if (includeSubEntryPoints) {
			var entryPoints = FindSubEntryPoints(maxBookmarks / 2);
			foreach (var ep in entryPoints) {
				if (count >= maxBookmarks) break;
				AddBookmark(ep.Offset, $"sub_{ep.Offset:X6}", "Sub-entry point", "EntryPoint");
				count++;
			}
		}

		if (includeCoverageBoundaries) {
			var boundaries = FindCoverageBoundaries(maxBookmarks / 2);
			foreach (var boundary in boundaries) {
				if (count >= maxBookmarks) break;
				if (boundary.Type == "Start of coverage") {
					AddBookmark(boundary.Offset, $"coverage_start_{boundary.Offset:X6}", "Start of covered region", "Boundary");
				}
				count++;
			}
		}
	}

	/// <summary>
	/// Exports bookmarks to a text file format.
	/// </summary>
	public string ExportBookmarks() {
		var sb = new StringBuilder();
		sb.AppendLine("; CDL Bookmarks");
		sb.AppendLine($"; Total: {_bookmarks.Count}");
		sb.AppendLine();

		foreach (var category in _bookmarks.Select(b => b.Category).Distinct()) {
			sb.AppendLine($"; === {category ?? "Uncategorized"} ===");
			foreach (var bookmark in _bookmarks.Where(b => b.Category == category)) {
				sb.Append($"{bookmark.OffsetHex} = {bookmark.Label}");
				if (!string.IsNullOrEmpty(bookmark.Description)) {
					sb.Append($" ; {bookmark.Description}");
				}
				sb.AppendLine();
			}
			sb.AppendLine();
		}

		return sb.ToString();
	}

	/// <summary>
	/// Imports bookmarks from a text file format.
	/// </summary>
	public void ImportBookmarks(string content) {
		var lines = content.Split('\n', StringSplitOptions.RemoveEmptyEntries);
		string? currentCategory = null;

		foreach (var line in lines) {
			var trimmed = line.Trim();

			// Skip empty lines
			if (string.IsNullOrEmpty(trimmed)) continue;

			// Check for category header
			if (trimmed.StartsWith("; ===") && trimmed.EndsWith("===")) {
				currentCategory = trimmed.Trim(';', '=', ' ');
				if (currentCategory == "Uncategorized") currentCategory = null;
				continue;
			}

			// Skip other comments
			if (trimmed.StartsWith(';')) continue;

			// Parse bookmark: $OFFSET = Label ; Description
			var parts = trimmed.Split('=', 2);
			if (parts.Length != 2) continue;

			var offsetStr = parts[0].Trim().TrimStart('$');
			if (!int.TryParse(offsetStr, System.Globalization.NumberStyles.HexNumber, null, out int offset)) {
				continue;
			}

			var labelPart = parts[1].Trim();
			string label;
			string? description = null;

			var commentIndex = labelPart.IndexOf(';');
			if (commentIndex >= 0) {
				label = labelPart[..commentIndex].Trim();
				description = labelPart[(commentIndex + 1)..].Trim();
			} else {
				label = labelPart;
			}

			if (offset >= 0 && offset < _cdlData.Length) {
				AddBookmark(offset, label, description, currentCategory);
			}
		}
	}

	#endregion
}
