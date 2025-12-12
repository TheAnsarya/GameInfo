using System.Text;
using GameInfoTools.Core;

namespace GameInfoTools.Analysis;

/// <summary>
/// Integrates CDL coverage data with ROM analysis for enhanced disassembly.
/// </summary>
public class CdlRomIntegration {
	private readonly byte[] _romData;
	private readonly CdlHeatmap _cdl;
	private readonly RomInfo _romInfo;

	/// <summary>
	/// Generated label information.
	/// </summary>
	public record LabelInfo(
		int Address,
		string Name,
		LabelType Type,
		string? Comment = null
	) {
		public string AddressHex => $"${Address:X4}";
	}

	/// <summary>
	/// Types of labels that can be generated.
	/// </summary>
	public enum LabelType {
		Code,
		SubRoutine,
		Data,
		Pointer,
		JumpTarget,
		DataTable,
		Unknown
	}

	/// <summary>
	/// Function boundary information.
	/// </summary>
	public record FunctionBoundary(
		int StartAddress,
		int EndAddress,
		string Name,
		int CallCount,
		bool IsSubEntry
	) {
		public string StartHex => $"${StartAddress:X4}";
		public string EndHex => $"${EndAddress:X4}";
		public int Size => EndAddress - StartAddress;
	}

	/// <summary>
	/// Data table detection result.
	/// </summary>
	public record DataTableInfo(
		int Address,
		int Size,
		DataTableType Type,
		int EntryCount,
		int EntrySize,
		string? Description = null
	) {
		public string AddressHex => $"${Address:X4}";
	}

	/// <summary>
	/// Types of data tables.
	/// </summary>
	public enum DataTableType {
		Unknown,
		ByteArray,
		WordArray,
		PointerTable,
		StructArray,
		StringTable
	}

	/// <summary>
	/// Creates a new CDL/ROM integration analyzer.
	/// </summary>
	/// <param name="romData">ROM file data.</param>
	/// <param name="cdl">CDL coverage data.</param>
	public CdlRomIntegration(byte[] romData, CdlHeatmap cdl) {
		_romData = romData ?? throw new ArgumentNullException(nameof(romData));
		_cdl = cdl ?? throw new ArgumentNullException(nameof(cdl));
		_romInfo = RomFile.GetRomInfo(romData);
	}

	/// <summary>
	/// Creates from file paths.
	/// </summary>
	public static CdlRomIntegration FromFiles(string romPath, string cdlPath) {
		var romData = File.ReadAllBytes(romPath);
		var cdl = CdlHeatmap.FromFile(cdlPath);
		return new CdlRomIntegration(romData, cdl);
	}

	#region Label Generation

	/// <summary>
	/// Generates labels from CDL code regions.
	/// </summary>
	/// <param name="bankSize">Size of each bank (default 16KB for NES).</param>
	/// <returns>List of generated labels.</returns>
	public List<LabelInfo> GenerateLabelsFromCdl(int bankSize = 0x4000) {
		var labels = new List<LabelInfo>();
		int headerSize = _romInfo.HeaderSize;

		// Find sub-entry points from CDL
		var subEntries = _cdl.FindSubEntryPoints(1000);
		foreach (var entry in subEntries) {
			int romOffset = entry.Offset;
			int address = OffsetToAddress(romOffset, bankSize);
			labels.Add(new LabelInfo(address, $"sub_{address:x4}", LabelType.SubRoutine,
				"CDL-detected sub-entry point"));
		}

		// Find indirect code targets
		var indirectTargets = _cdl.FindIndirectCode(500);
		foreach (var target in indirectTargets) {
			int address = OffsetToAddress(target.Offset, bankSize);
			if (!labels.Any(l => l.Address == address)) {
				labels.Add(new LabelInfo(address, $"indirect_{address:x4}", LabelType.JumpTarget,
					"CDL-detected indirect code target"));
			}
		}

		// Find data regions and create data labels
		var dataRegions = _cdl.FindCoveredRegions(16)
			.Where(r => !r.IsCode)
			.Take(500);
		foreach (var (offset, length, _) in dataRegions) {
			int address = OffsetToAddress(offset, bankSize);
			if (!labels.Any(l => l.Address == address)) {
				labels.Add(new LabelInfo(address, $"data_{address:x4}", LabelType.Data,
					$"Data region ({length} bytes)"));
			}
		}

		// Sort by address
		return labels.OrderBy(l => l.Address).ToList();
	}

	/// <summary>
	/// Generates labels from analyzing jump/call instructions in covered code.
	/// </summary>
	public List<LabelInfo> GenerateLabelsFromJumps(int bankSize = 0x4000) {
		var labels = new List<LabelInfo>();
		var jumpTargets = new Dictionary<int, int>(); // address -> call count
		int headerSize = _romInfo.HeaderSize;

		// Scan covered code regions for jump/call instructions
		for (int i = headerSize; i < _romData.Length - 2; i++) {
			// Only analyze bytes marked as code in CDL
			if ((_cdl.GetFlags(i - headerSize) & CdlHeatmap.CdlFlags.Code) == 0) {
				continue;
			}

			byte opcode = _romData[i];

			// JSR (absolute) - $20
			if (opcode == 0x20 && i + 2 < _romData.Length) {
				int targetAddr = _romData[i + 1] | (_romData[i + 2] << 8);
				if (targetAddr >= 0x8000) {
					jumpTargets.TryAdd(targetAddr, 0);
					jumpTargets[targetAddr]++;
				}
			}

			// JMP (absolute) - $4C
			if (opcode == 0x4c && i + 2 < _romData.Length) {
				int targetAddr = _romData[i + 1] | (_romData[i + 2] << 8);
				if (targetAddr >= 0x8000) {
					jumpTargets.TryAdd(targetAddr, 0);
					jumpTargets[targetAddr]++;
				}
			}
		}

		// Create labels for jump targets
		foreach (var (address, count) in jumpTargets.OrderBy(kv => kv.Key)) {
			string prefix = count > 5 ? "sub" : "loc";
			var type = count > 5 ? LabelType.SubRoutine : LabelType.JumpTarget;
			labels.Add(new LabelInfo(address, $"{prefix}_{address:x4}", type,
				$"Referenced {count} times"));
		}

		return labels;
	}

	/// <summary>
	/// Converts a ROM file offset to a CPU address.
	/// </summary>
	private int OffsetToAddress(int offset, int bankSize) {
		// For NES: PRG starts at $8000, banked
		int bank = offset / bankSize;
		int bankOffset = offset % bankSize;

		// Simplified: assume mapper 0 style ($8000 base)
		return 0x8000 + bankOffset;
	}

	#endregion

	#region Function Boundary Detection

	/// <summary>
	/// Identifies potential function boundaries using CDL and code analysis.
	/// </summary>
	public List<FunctionBoundary> DetectFunctionBoundaries(int bankSize = 0x4000) {
		var functions = new List<FunctionBoundary>();
		int headerSize = _romInfo.HeaderSize;

		// Get all CDL-detected sub-entry points
		var entryPoints = _cdl.FindSubEntryPoints(1000)
			.Select(e => e.Offset)
			.ToHashSet();

		// Also find JSR targets as potential function starts
		var jsrTargets = new HashSet<int>();
		for (int i = headerSize; i < _romData.Length - 2; i++) {
			if ((_cdl.GetFlags(i - headerSize) & CdlHeatmap.CdlFlags.Code) == 0) continue;

			if (_romData[i] == 0x20) { // JSR
				int targetAddr = _romData[i + 1] | (_romData[i + 2] << 8);
				if (targetAddr >= 0x8000) {
					int targetOffset = AddressToOffset(targetAddr, bankSize) - headerSize;
					if (targetOffset >= 0 && targetOffset < _cdl.Size) {
						jsrTargets.Add(targetOffset);
					}
				}
			}
		}

		// Combine entry points
		var allEntries = entryPoints.Union(jsrTargets).OrderBy(e => e).ToList();

		// Detect function boundaries by finding RTS/RTI instructions
		for (int i = 0; i < allEntries.Count; i++) {
			int startOffset = allEntries[i];
			int startAddr = OffsetToAddress(startOffset, bankSize);

			// Find the end of this function (next RTS/RTI or next function start)
			int endOffset = i + 1 < allEntries.Count ? allEntries[i + 1] : _cdl.Size;
			int actualEnd = startOffset;

			for (int j = startOffset; j < endOffset && j < _cdl.Size; j++) {
				if ((_cdl.GetFlags(j) & CdlHeatmap.CdlFlags.Code) == 0) {
					continue;
				}

				int romOffset = j + headerSize;
				if (romOffset >= _romData.Length) break;

				byte opcode = _romData[romOffset];

				// RTS ($60) or RTI ($40)
				if (opcode == 0x60 || opcode == 0x40) {
					actualEnd = j + 1;
				}
			}

			if (actualEnd > startOffset) {
				int endAddr = OffsetToAddress(actualEnd, bankSize);
				bool isSubEntry = entryPoints.Contains(startOffset);
				int callCount = jsrTargets.Contains(startOffset) ? 1 : 0;

				functions.Add(new FunctionBoundary(
					startAddr,
					endAddr,
					$"func_{startAddr:x4}",
					callCount,
					isSubEntry
				));
			}
		}

		return functions;
	}

	/// <summary>
	/// Converts a CPU address to ROM file offset.
	/// </summary>
	private int AddressToOffset(int address, int bankSize) {
		// Simplified: assume address $8000+ maps to ROM
		int romAddress = address - 0x8000;
		return romAddress + _romInfo.HeaderSize;
	}

	#endregion

	#region Data Table Detection

	/// <summary>
	/// Detects data table patterns in CDL-identified data regions.
	/// </summary>
	public List<DataTableInfo> DetectDataTables(int minSize = 8, int bankSize = 0x4000) {
		var tables = new List<DataTableInfo>();
		int headerSize = _romInfo.HeaderSize;

		// Get data regions from CDL
		var dataRegions = _cdl.FindCoveredRegions(minSize)
			.Where(r => !r.IsCode)
			.ToList();

		foreach (var (offset, length, _) in dataRegions) {
			int romOffset = offset + headerSize;
			if (romOffset + length > _romData.Length) continue;

			// Analyze the data pattern
			var tableInfo = AnalyzeDataRegion(romOffset, length, bankSize);
			if (tableInfo is not null) {
				tables.Add(tableInfo);
			}
		}

		return tables;
	}

	private DataTableInfo? AnalyzeDataRegion(int romOffset, int length, int bankSize) {
		if (length < 4) return null;

		int address = OffsetToAddress(romOffset - _romInfo.HeaderSize, bankSize);

		// Check for pointer table (sequence of valid addresses)
		if (length >= 4 && length % 2 == 0) {
			int validPointers = 0;
			for (int i = 0; i < length - 1; i += 2) {
				int ptr = _romData[romOffset + i] | (_romData[romOffset + i + 1] << 8);
				if (ptr >= 0x8000 && ptr < 0x10000) {
					validPointers++;
				}
			}

			if (validPointers >= length / 4) { // At least half are valid pointers
				return new DataTableInfo(
					address,
					length,
					DataTableType.PointerTable,
					length / 2,
					2,
					$"Pointer table with {length / 2} entries"
				);
			}
		}

		// Check for byte array (consistent value patterns)
		var byteCounts = new int[256];
		for (int i = 0; i < length; i++) {
			byteCounts[_romData[romOffset + i]]++;
		}
		int uniqueValues = byteCounts.Count(c => c > 0);

		// Check for word array (pairs of bytes with pattern)
		if (length >= 8 && length % 2 == 0) {
			// Check if high bytes follow a pattern
			bool isWordArray = true;
			for (int i = 2; i < length - 1; i += 2) {
				// Word arrays often have similar high bytes
				if (Math.Abs(_romData[romOffset + i + 1] - _romData[romOffset + 1]) > 0x10) {
					isWordArray = false;
					break;
				}
			}

			if (isWordArray && uniqueValues < length / 2) {
				return new DataTableInfo(
					address,
					length,
					DataTableType.WordArray,
					length / 2,
					2,
					$"Word array with {length / 2} entries"
				);
			}
		}

		// Check for struct array (repeating patterns)
		for (int structSize = 2; structSize <= Math.Min(16, length / 2); structSize++) {
			if (length % structSize != 0) continue;

			bool isStructArray = true;
			int entries = length / structSize;

			// Check if structure pattern repeats
			for (int entry = 1; entry < Math.Min(entries, 5); entry++) {
				// Compare byte distributions between entries
				int differences = 0;
				for (int b = 0; b < structSize; b++) {
					if (Math.Abs(_romData[romOffset + b] - _romData[romOffset + entry * structSize + b]) > 0x40) {
						differences++;
					}
				}
				if (differences > structSize / 2) {
					isStructArray = false;
					break;
				}
			}

			if (isStructArray && entries >= 4) {
				return new DataTableInfo(
					address,
					length,
					DataTableType.StructArray,
					entries,
					structSize,
					$"Struct array: {entries} entries × {structSize} bytes"
				);
			}
		}

		// Default: byte array
		if (uniqueValues <= length / 4 || length <= 32) {
			return new DataTableInfo(
				address,
				length,
				DataTableType.ByteArray,
				length,
				1,
				$"Byte array ({length} bytes)"
			);
		}

		return null;
	}

	#endregion

	#region Export

	/// <summary>
	/// Exports labels in Mesen MLB format.
	/// </summary>
	public string ExportMesenLabels(int bankSize = 0x4000) {
		var sb = new StringBuilder();
		sb.AppendLine("; Auto-generated from CDL/ROM analysis");
		sb.AppendLine($"; Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
		sb.AppendLine();

		var labels = GenerateLabelsFromCdl(bankSize)
			.Concat(GenerateLabelsFromJumps(bankSize))
			.DistinctBy(l => l.Address)
			.OrderBy(l => l.Address);

		foreach (var label in labels) {
			// Mesen MLB format: PRG:XXXX:Name or CPU:XXXX:Name
			string type = label.Type == LabelType.Data ? "PRG" : "PRG";
			sb.AppendLine($"{type}:{label.Address:X4}:{label.Name}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Exports labels in FCEUX NL format.
	/// </summary>
	public string ExportFceuxLabels(int bankSize = 0x4000) {
		var sb = new StringBuilder();
		sb.AppendLine("; Auto-generated from CDL/ROM analysis");
		sb.AppendLine();

		var labels = GenerateLabelsFromCdl(bankSize)
			.Concat(GenerateLabelsFromJumps(bankSize))
			.DistinctBy(l => l.Address)
			.OrderBy(l => l.Address);

		foreach (var label in labels) {
			// FCEUX NL format: $XXXX#name#comment
			string comment = label.Comment ?? "";
			sb.AppendLine($"${label.Address:X4}#{label.Name}#{comment}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Exports labels in generic symbol format.
	/// </summary>
	public string ExportSymbols(int bankSize = 0x4000) {
		var sb = new StringBuilder();
		sb.AppendLine("; CDL/ROM Analysis Symbol File");
		sb.AppendLine($"; Source ROM: {_romInfo.System}");
		sb.AppendLine($"; Generated: {DateTime.Now:yyyy-MM-dd}");
		sb.AppendLine();

		var labels = GenerateLabelsFromCdl(bankSize)
			.Concat(GenerateLabelsFromJumps(bankSize))
			.DistinctBy(l => l.Address)
			.OrderBy(l => l.Address);

		// Group by type
		var byType = labels.GroupBy(l => l.Type);

		foreach (var group in byType) {
			sb.AppendLine($"; === {group.Key} ===");
			foreach (var label in group) {
				sb.AppendLine($"{label.AddressHex} = {label.Name,-20} ; {label.Comment}");
			}
			sb.AppendLine();
		}

		return sb.ToString();
	}

	/// <summary>
	/// Generates a comprehensive analysis report.
	/// </summary>
	public string GenerateAnalysisReport(int bankSize = 0x4000) {
		var sb = new StringBuilder();

		sb.AppendLine("╔════════════════════════════════════════════════════════════════╗");
		sb.AppendLine("║           CDL/ROM INTEGRATION ANALYSIS REPORT                  ║");
		sb.AppendLine("╠════════════════════════════════════════════════════════════════╣");
		sb.AppendLine($"║ ROM System:     {_romInfo.System,-20}                      ║");
		sb.AppendLine($"║ ROM Size:       {_romData.Length,10:N0} bytes                       ║");
		sb.AppendLine($"║ CDL Size:       {_cdl.Size,10:N0} bytes                       ║");
		sb.AppendLine("╠════════════════════════════════════════════════════════════════╣");

		var cdlStats = _cdl.GetCoverageStats();
		sb.AppendLine($"║ CDL Coverage:   {cdlStats.CoveragePercentage,7:F2}%                              ║");
		sb.AppendLine($"║   Code:         {cdlStats.CodePercentage,7:F2}% ({cdlStats.CodeBytes,10:N0} bytes)      ║");
		sb.AppendLine($"║   Data:         {cdlStats.DataPercentage,7:F2}% ({cdlStats.DataBytes,10:N0} bytes)      ║");
		sb.AppendLine("╠════════════════════════════════════════════════════════════════╣");

		var functions = DetectFunctionBoundaries(bankSize);
		var labels = GenerateLabelsFromCdl(bankSize);
		var tables = DetectDataTables(8, bankSize);

		sb.AppendLine($"║ Functions Detected:  {functions.Count,5}                                  ║");
		sb.AppendLine($"║ Labels Generated:    {labels.Count,5}                                  ║");
		sb.AppendLine($"║ Data Tables Found:   {tables.Count,5}                                  ║");
		sb.AppendLine("╠════════════════════════════════════════════════════════════════╣");

		// Top functions by size
		sb.AppendLine("║ LARGEST FUNCTIONS:                                             ║");
		foreach (var func in functions.OrderByDescending(f => f.Size).Take(5)) {
			sb.AppendLine($"║   {func.StartHex,-8} - {func.EndHex,-8}  ({func.Size,4} bytes) {func.Name,-12} ║");
		}
		sb.AppendLine("╠════════════════════════════════════════════════════════════════╣");

		// Data tables
		sb.AppendLine("║ DATA TABLES:                                                   ║");
		foreach (var table in tables.Take(5)) {
			sb.AppendLine($"║   {table.AddressHex,-8} {table.Type,-14} {table.EntryCount,4}×{table.EntrySize} bytes    ║");
		}
		sb.AppendLine("╚════════════════════════════════════════════════════════════════╝");

		return sb.ToString();
	}

	#endregion
}
