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
}
