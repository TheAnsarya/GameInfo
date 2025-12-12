using System.Text;
using GameInfoTools.Core;

namespace GameInfoTools.Analysis;

/// <summary>
/// ROM analysis and mapping tool.
/// </summary>
public class RomAnalyzer {
	private readonly byte[] _data;
	private readonly RomInfo _romInfo;

	public RomAnalyzer(byte[] data) {
		_data = data;
		_romInfo = Core.RomFile.GetRomInfo(data);
	}

	/// <summary>
	/// Data block type classification.
	/// </summary>
	public enum BlockType {
		Unknown,
		Code,
		Graphics,
		Text,
		Audio,
		PointerTable,
		DataTable,
		Empty,
		Compressed,
	}

	/// <summary>
	/// Analyzed data block.
	/// </summary>
	public record DataBlock(int Offset, int Length, BlockType Type, float Confidence, string? Description = null);

	/// <summary>
	/// Bank information for multi-bank ROMs.
	/// </summary>
	public record BankInfo(int Index, int Offset, int Size, BlockType DominantType, Dictionary<BlockType, int> TypeBreakdown);

	/// <summary>
	/// ROM comparison result.
	/// </summary>
	public record ComparisonResult(
		int TotalBytes,
		int DifferentBytes,
		double SimilarityPercent,
		List<DiffRegion> Differences
	);

	/// <summary>
	/// A region where two ROMs differ.
	/// </summary>
	public record DiffRegion(int Offset, int Length, byte[] Data1, byte[] Data2);

	/// <summary>
	/// Detected mapper information.
	/// </summary>
	public record MapperInfo(int MapperId, string Name, string Description, int PrgBanks, int ChrBanks);

	/// <summary>
	/// Analyze the entire ROM and identify data blocks.
	/// </summary>
	public List<DataBlock> AnalyzeRom(int blockSize = 256) {
		var blocks = new List<DataBlock>();
		int offset = _romInfo.HeaderSize;

		while (offset < _data.Length) {
			int remaining = _data.Length - offset;
			int size = Math.Min(blockSize, remaining);

			var (type, confidence) = ClassifyBlock(offset, size);
			blocks.Add(new DataBlock(offset, size, type, confidence));

			offset += size;
		}

		// Merge adjacent blocks of same type
		return MergeBlocks(blocks);
	}

	private (BlockType Type, float Confidence) ClassifyBlock(int offset, int length) {
		if (length < 4) {
			return (BlockType.Unknown, 0);
		}

		// Check for empty/padding
		if (IsEmpty(offset, length)) {
			return (BlockType.Empty, 1.0f);
		}

		// Check for compressed data
		var compressionResult = CompressionDetector.Detect(_data, offset);
		if (compressionResult.Type != CompressionDetector.CompressionType.None && compressionResult.Confidence > 0.7) {
			return (BlockType.Compressed, (float)compressionResult.Confidence);
		}

		// Calculate various heuristics
		float codeScore = ScoreAsCode(offset, length);
		float graphicsScore = ScoreAsGraphics(offset, length);
		float textScore = ScoreAsText(offset, length);
		float pointerScore = ScoreAsPointerTable(offset, length);
		float dataTableScore = ScoreAsDataTable(offset, length);

		// Return highest scoring type
		var scores = new (BlockType Type, float Score)[]
		{
			(BlockType.Code, codeScore),
			(BlockType.Graphics, graphicsScore),
			(BlockType.Text, textScore),
			(BlockType.PointerTable, pointerScore),
			(BlockType.DataTable, dataTableScore),
		};

		var best = scores.OrderByDescending(s => s.Score).First();
		return best.Score > 0.4f ? (best.Type, best.Score) : (BlockType.Unknown, 0);
	}

	private bool IsEmpty(int offset, int length) {
		byte first = _data[offset];
		if (first != 0x00 && first != 0xff) {
			return false;
		}

		for (int i = 1; i < length && offset + i < _data.Length; i++) {
			if (_data[offset + i] != first) {
				return false;
			}
		}

		return true;
	}

	private float ScoreAsCode(int offset, int length) {
		float score = 0;
		int codeOpcodes = 0;
		int totalOpcodes = 0;

		// 6502/65816 opcode analysis
		var common6502 = new HashSet<byte>
		{
			0x4c, 0x20, 0x60, 0xa9, 0xa5, 0x85, 0xad, 0x8d, // JMP, JSR, RTS, LDA, STA
			0xa2, 0x86, 0xa0, 0x84, 0xbd, 0xb9, 0x9d, 0x99, // LDX, STX, LDY, STY, indexed
			0xc9, 0xe9, 0x69, 0x29, 0x09, 0x49,             // CMP, SBC, ADC, AND, ORA, EOR
			0xf0, 0xd0, 0x10, 0x30, 0x90, 0xb0,             // branches
			0xe8, 0xca, 0xc8, 0x88, 0xea,                   // INX, DEX, INY, DEY, NOP
			0x48, 0x68, 0x08, 0x28,                         // PHA, PLA, PHP, PLP
			0x18, 0x38, 0xd8, 0x78,                         // CLC, SEC, CLD, SEI
		};

		for (int i = 0; i < length && offset + i < _data.Length; i++) {
			byte b = _data[offset + i];
			totalOpcodes++;

			if (common6502.Contains(b)) {
				codeOpcodes++;
			}
		}

		if (totalOpcodes > 0) {
			score = (float)codeOpcodes / totalOpcodes;
		}

		// Bonus for seeing JMP/JSR followed by valid address
		int jumpCount = 0;
		for (int i = 0; i < length - 2 && offset + i + 2 < _data.Length; i++) {
			byte b = _data[offset + i];
			if (b == 0x4c || b == 0x20) // JMP or JSR
			{
				int addr = _data[offset + i + 1] | (_data[offset + i + 2] << 8);
				if (addr >= 0x8000 && addr < 0x10000) {
					jumpCount++;
				}
			}
		}

		if (jumpCount > length / 16) {
			score += 0.2f;
		}

		return Math.Min(1.0f, score);
	}

	private float ScoreAsGraphics(int offset, int length) {
		// CHR tile patterns often have:
		// - Bitplane patterns (bytes repeat with offset of 8)
		// - Low byte counts per tile

		int tilesAnalyzed = 0;
		float avgEntropyPerTile = 0;

		for (int tileStart = offset; tileStart + 16 <= offset + length && tileStart + 16 <= _data.Length; tileStart += 16) {
			// Calculate entropy of this 16-byte tile
			var counts = new int[256];
			for (int i = 0; i < 16; i++) {
				counts[_data[tileStart + i]]++;
			}

			int uniqueBytes = counts.Count(c => c > 0);
			avgEntropyPerTile += uniqueBytes;
			tilesAnalyzed++;
		}

		if (tilesAnalyzed == 0) {
			return 0;
		}

		avgEntropyPerTile /= tilesAnalyzed;

		// Graphics tiles typically have low entropy (2-6 unique bytes per tile)
		if (avgEntropyPerTile >= 2 && avgEntropyPerTile <= 8) {
			return 0.6f + (0.2f * (1 - ((avgEntropyPerTile - 2) / 6)));
		}

		return 0.2f;
	}

	private float ScoreAsText(int offset, int length) {
		// Check for ASCII-like patterns or common Japanese text encodings
		int printableCount = 0;
		int terminatorCount = 0;
		int controlCount = 0;

		for (int i = 0; i < length && offset + i < _data.Length; i++) {
			byte b = _data[offset + i];

			// ASCII printable range
			if (b >= 0x20 && b <= 0x7e) {
				printableCount++;
			}
			// Common terminators
			else if (b == 0x00 || b == 0xff || b == 0xfe) {
				terminatorCount++;
			}
			// Control characters
			else if (b < 0x20 && b != 0x00) {
				controlCount++;
			}
		}

		if (length == 0) {
			return 0;
		}

		float printableRatio = (float)printableCount / length;
		float terminatorRatio = (float)terminatorCount / length;

		// Good text has high printable ratio with occasional terminators
		if (printableRatio > 0.7f && terminatorRatio < 0.3f) {
			return printableRatio;
		}

		// Also score DTE/custom encoding patterns
		// Check for reasonable byte value distribution
		var counts = new int[256];
		for (int i = 0; i < length && offset + i < _data.Length; i++) {
			counts[_data[offset + i]]++;
		}

		int usedValues = counts.Count(c => c > 0);
		// Text typically uses 30-100 unique byte values
		if (usedValues >= 20 && usedValues <= 120) {
			return 0.5f;
		}

		return 0.2f;
	}

	private float ScoreAsPointerTable(int offset, int length) {
		if (length < 4) {
			return 0;
		}

		int validPointers = 0;
		int totalPointers = 0;

		// Check for consecutive 16-bit values that look like ROM pointers
		for (int i = 0; i + 2 <= length && offset + i + 2 <= _data.Length; i += 2) {
			int ptr = _data[offset + i] | (_data[offset + i + 1] << 8);
			totalPointers++;

			// Valid NES ROM pointer range
			if (ptr >= 0x8000 && ptr < 0x10000) {
				validPointers++;
			}
		}

		if (totalPointers < 2) {
			return 0;
		}

		float validRatio = (float)validPointers / totalPointers;

		// Check if pointers are sequential/close together (common for pointer tables)
		if (validRatio > 0.7f && totalPointers >= 4) {
			var pointers = new List<int>();
			for (int i = 0; i + 2 <= length && offset + i + 2 <= _data.Length; i += 2) {
				int ptr = _data[offset + i] | (_data[offset + i + 1] << 8);
				if (ptr >= 0x8000 && ptr < 0x10000) {
					pointers.Add(ptr);
				}
			}

			if (pointers.Count >= 2) {
				int spread = pointers.Max() - pointers.Min();
				// Pointer tables often point to nearby data
				if (spread < 0x4000) {
					return 0.8f;
				}
			}
		}

		return validRatio > 0.5f ? 0.5f : 0.2f;
	}

	private float ScoreAsDataTable(int offset, int length) {
		// Data tables often have:
		// - Repeating record sizes
		// - Similar value ranges across records

		// Try to detect record size by finding repeating patterns
		int bestRecordSize = 0;
		float bestScore = 0;

		for (int recordSize = 2; recordSize <= 16 && recordSize * 4 <= length; recordSize++) {
			int matchingRecords = 0;
			int totalRecords = length / recordSize;

			if (totalRecords < 4) {
				continue;
			}

			// Compare structure of consecutive records
			for (int r = 0; r < totalRecords - 1; r++) {
				int rec1 = offset + (r * recordSize);
				int rec2 = offset + ((r + 1) * recordSize);

				// Check if value ranges are similar
				int matches = 0;
				for (int b = 0; b < recordSize && rec1 + b < _data.Length && rec2 + b < _data.Length; b++) {
					int v1 = _data[rec1 + b];
					int v2 = _data[rec2 + b];

					// Similar if within 64 of each other or both in same quarter
					if (Math.Abs(v1 - v2) < 64 || (v1 >> 6) == (v2 >> 6)) {
						matches++;
					}
				}

				if (matches > recordSize * 0.6f) {
					matchingRecords++;
				}
			}

			float score = (float)matchingRecords / (totalRecords - 1);
			if (score > bestScore) {
				bestScore = score;
				bestRecordSize = recordSize;
			}
		}

		return bestScore > 0.5f ? bestScore * 0.8f : 0;
	}

	private List<DataBlock> MergeBlocks(List<DataBlock> blocks) {
		if (blocks.Count == 0) {
			return blocks;
		}

		var merged = new List<DataBlock>();
		var current = blocks[0];

		for (int i = 1; i < blocks.Count; i++) {
			var next = blocks[i];

			// Merge if same type and adjacent
			if (next.Type == current.Type && next.Offset == current.Offset + current.Length) {
				current = current with {
					Length = current.Length + next.Length,
					Confidence = (current.Confidence + next.Confidence) / 2
				};
			} else {
				merged.Add(current);
				current = next;
			}
		}

		merged.Add(current);
		return merged;
	}

	/// <summary>
	/// Generate a ROM map report.
	/// </summary>
	public string GenerateMap() {
		var sb = new StringBuilder();
		sb.AppendLine($"ROM Analysis: {_romInfo.System}");
		sb.AppendLine($"Size: {_data.Length:N0} bytes ({_data.Length / 1024} KB)");
		sb.AppendLine($"Header: {_romInfo.HeaderSize} bytes");
		sb.AppendLine();

		var blocks = AnalyzeRom();

		sb.AppendLine("=== Data Blocks ===");
		sb.AppendLine();

		foreach (var block in blocks) {
			string typeStr = block.Type.ToString().PadRight(12);
			sb.AppendLine($"${block.Offset:x6}-${block.Offset + block.Length - 1:x6}  {typeStr}  {block.Length,6} bytes  ({block.Confidence:P0})");
		}

		sb.AppendLine();
		sb.AppendLine("=== Summary ===");

		var summary = blocks.GroupBy(b => b.Type)
			.Select(g => new { Type = g.Key, TotalSize = g.Sum(b => b.Length), Count = g.Count() })
			.OrderByDescending(s => s.TotalSize);

		foreach (var s in summary) {
			sb.AppendLine($"{s.Type,-12}: {s.TotalSize,8:N0} bytes ({s.Count} blocks)");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Export analysis to JSON.
	/// </summary>
	public string ExportToJson() {
		var blocks = AnalyzeRom();
		var sb = new StringBuilder();

		sb.AppendLine("{");
		sb.AppendLine($"  \"system\": \"{_romInfo.System}\",");
		sb.AppendLine($"  \"size\": {_data.Length},");
		sb.AppendLine($"  \"headerSize\": {_romInfo.HeaderSize},");
		sb.AppendLine("  \"blocks\": [");

		for (int i = 0; i < blocks.Count; i++) {
			var b = blocks[i];
			sb.AppendLine("    {");
			sb.AppendLine($"      \"offset\": \"0x{b.Offset:x6}\",");
			sb.AppendLine($"      \"length\": {b.Length},");
			sb.AppendLine($"      \"type\": \"{b.Type}\",");
			sb.AppendLine($"      \"confidence\": {b.Confidence:F2}");
			sb.Append("    }");
			sb.AppendLine(i < blocks.Count - 1 ? "," : "");
		}

		sb.AppendLine("  ]");
		sb.AppendLine("}");

		return sb.ToString();
	}

	#region Mapper Detection

	/// <summary>
	/// Detect NES mapper from ROM header.
	/// </summary>
	public MapperInfo? DetectMapper() {
		if (_romInfo.System != SystemType.Nes || _data.Length < 16) {
			return null;
		}

		// Check for iNES header
		if (_data[0] != 0x4e || _data[1] != 0x45 || _data[2] != 0x53 || _data[3] != 0x1a) {
			return null;
		}

		int prgBanks = _data[4];
		int chrBanks = _data[5];
		int flags6 = _data[6];
		int flags7 = _data[7];

		// Extract mapper number
		int mapperLow = (flags6 >> 4) & 0x0f;
		int mapperHigh = flags7 & 0xf0;
		int mapperId = mapperLow | mapperHigh;

		// Check for NES 2.0 format
		if ((flags7 & 0x0c) == 0x08) {
			// NES 2.0 - mapper can be 12 bits
			mapperId |= (_data[8] & 0x0f) << 8;
		}

		string name = GetMapperName(mapperId);
		string description = GetMapperDescription(mapperId);

		return new MapperInfo(mapperId, name, description, prgBanks, chrBanks);
	}

	private static string GetMapperName(int mapperId) {
		return mapperId switch {
			0 => "NROM",
			1 => "MMC1/SxROM",
			2 => "UxROM",
			3 => "CNROM",
			4 => "MMC3/TxROM",
			5 => "MMC5/ExROM",
			7 => "AxROM",
			9 => "MMC2/PxROM",
			10 => "MMC4/FxROM",
			11 => "Color Dreams",
			16 => "Bandai",
			18 => "Jaleco SS 88006",
			19 => "Namco 163",
			21 => "VRC4a/VRC4c",
			22 => "VRC2a",
			23 => "VRC2b/VRC4e",
			24 => "VRC6a",
			25 => "VRC4b/VRC4d",
			26 => "VRC6b",
			34 => "BNROM/NINA-001",
			66 => "GxROM/MHROM",
			69 => "Sunsoft FME-7",
			71 => "Camerica/Codemasters",
			79 => "NINA-003/NINA-006",
			85 => "VRC7",
			118 => "TxSROM/MMC3",
			119 => "TQROM/MMC3",
			_ => $"Mapper {mapperId}"
		};
	}

	private static string GetMapperDescription(int mapperId) {
		return mapperId switch {
			0 => "No mapper, 16KB/32KB PRG, optional 8KB CHR",
			1 => "Nintendo MMC1, bank switching with serial register",
			2 => "Simple PRG bank switching, 16KB switchable",
			3 => "Simple CHR bank switching, 8KB switchable",
			4 => "Nintendo MMC3, popular mapper with IRQ counter",
			5 => "Nintendo MMC5, advanced mapper with expansion audio",
			7 => "32KB PRG bank switching",
			9 => "Nintendo MMC2, CHR latch for Punch-Out!!",
			10 => "Nintendo MMC4, CHR latch variant",
			24 or 26 => "Konami VRC6, expansion audio with pulse/sawtooth",
			85 => "Konami VRC7, expansion FM synthesis audio",
			69 => "Sunsoft FME-7, expansion audio support",
			_ => "Standard memory mapper"
		};
	}

	#endregion

	#region Bank Analysis

	/// <summary>
	/// Analyze ROM banks and their contents.
	/// </summary>
	/// <param name="bankSize">Size of each bank in bytes (default 16KB for NES PRG).</param>
	public List<BankInfo> AnalyzeBanks(int bankSize = 0x4000) {
		var banks = new List<BankInfo>();
		int dataStart = _romInfo.HeaderSize;
		int dataLength = _data.Length - dataStart;
		int bankCount = dataLength / bankSize;

		for (int i = 0; i < bankCount; i++) {
			int bankOffset = dataStart + (i * bankSize);
			var blocks = AnalyzeRegion(bankOffset, bankSize);

			var typeBreakdown = blocks
				.GroupBy(b => b.Type)
				.ToDictionary(g => g.Key, g => g.Sum(b => b.Length));

			var dominantType = typeBreakdown.OrderByDescending(kvp => kvp.Value).First().Key;

			banks.Add(new BankInfo(i, bankOffset, bankSize, dominantType, typeBreakdown));
		}

		return banks;
	}

	/// <summary>
	/// Analyze a specific region of the ROM.
	/// </summary>
	public List<DataBlock> AnalyzeRegion(int offset, int length, int blockSize = 256) {
		var blocks = new List<DataBlock>();
		int endOffset = Math.Min(offset + length, _data.Length);

		int currentOffset = offset;
		while (currentOffset < endOffset) {
			int remaining = endOffset - currentOffset;
			int size = Math.Min(blockSize, remaining);

			var (type, confidence) = ClassifyBlock(currentOffset, size);
			blocks.Add(new DataBlock(currentOffset, size, type, confidence));

			currentOffset += size;
		}

		return MergeBlocks(blocks);
	}

	/// <summary>
	/// Generate a bank-by-bank analysis report.
	/// </summary>
	public string GenerateBankReport(int bankSize = 0x4000) {
		var sb = new StringBuilder();
		var banks = AnalyzeBanks(bankSize);
		var mapper = DetectMapper();

		sb.AppendLine($"ROM Bank Analysis: {_romInfo.System}");
		sb.AppendLine($"Total Size: {_data.Length:N0} bytes");

		if (mapper != null) {
			sb.AppendLine($"Mapper: {mapper.Name} (#{mapper.MapperId})");
			sb.AppendLine($"PRG Banks: {mapper.PrgBanks}, CHR Banks: {mapper.ChrBanks}");
		}

		sb.AppendLine();
		sb.AppendLine("=== Bank Analysis ===");
		sb.AppendLine();

		foreach (var bank in banks) {
			sb.AppendLine($"Bank {bank.Index:D2}: ${bank.Offset:x6}-${bank.Offset + bank.Size - 1:x6}");
			sb.AppendLine($"  Dominant: {bank.DominantType}");

			foreach (var (type, size) in bank.TypeBreakdown.OrderByDescending(kvp => kvp.Value)) {
				double percent = (double)size / bank.Size * 100;
				sb.AppendLine($"    {type,-12}: {size,6} bytes ({percent:F1}%)");
			}

			sb.AppendLine();
		}

		return sb.ToString();
	}

	#endregion

	#region ROM Comparison

	/// <summary>
	/// Compare this ROM with another ROM.
	/// </summary>
	public ComparisonResult CompareWith(byte[] other) {
		int maxLength = Math.Max(_data.Length, other.Length);
		int minLength = Math.Min(_data.Length, other.Length);
		int differentBytes = 0;
		var differences = new List<DiffRegion>();

		int diffStart = -1;
		var data1Bytes = new List<byte>();
		var data2Bytes = new List<byte>();

		for (int i = 0; i < maxLength; i++) {
			byte b1 = i < _data.Length ? _data[i] : (byte)0;
			byte b2 = i < other.Length ? other[i] : (byte)0;

			if (b1 != b2) {
				differentBytes++;

				if (diffStart == -1) {
					diffStart = i;
				}

				data1Bytes.Add(b1);
				data2Bytes.Add(b2);
			} else if (diffStart != -1) {
				// End of difference region
				differences.Add(new DiffRegion(diffStart, i - diffStart, data1Bytes.ToArray(), data2Bytes.ToArray()));
				diffStart = -1;
				data1Bytes.Clear();
				data2Bytes.Clear();
			}
		}

		// Handle trailing difference
		if (diffStart != -1) {
			differences.Add(new DiffRegion(diffStart, maxLength - diffStart, data1Bytes.ToArray(), data2Bytes.ToArray()));
		}

		double similarity = maxLength > 0 ? (double)(maxLength - differentBytes) / maxLength * 100 : 100;

		return new ComparisonResult(maxLength, differentBytes, similarity, differences);
	}

	/// <summary>
	/// Generate a comparison report between two ROMs.
	/// </summary>
	public string GenerateComparisonReport(byte[] other) {
		var result = CompareWith(other);
		var sb = new StringBuilder();

		sb.AppendLine("=== ROM Comparison Report ===");
		sb.AppendLine();
		sb.AppendLine($"ROM 1 Size: {_data.Length:N0} bytes");
		sb.AppendLine($"ROM 2 Size: {other.Length:N0} bytes");
		sb.AppendLine($"Total Bytes Compared: {result.TotalBytes:N0}");
		sb.AppendLine($"Different Bytes: {result.DifferentBytes:N0}");
		sb.AppendLine($"Similarity: {result.SimilarityPercent:F2}%");
		sb.AppendLine();

		if (result.Differences.Count == 0) {
			sb.AppendLine("ROMs are identical.");
		} else {
			sb.AppendLine($"Difference Regions: {result.Differences.Count}");
			sb.AppendLine();

			int shown = 0;
			foreach (var diff in result.Differences.Take(20)) {
				sb.AppendLine($"${diff.Offset:x6}: {diff.Length} bytes differ");

				// Show first few bytes
				int previewLen = Math.Min(8, diff.Length);
				string hex1 = string.Join(" ", diff.Data1.Take(previewLen).Select(b => b.ToString("x2")));
				string hex2 = string.Join(" ", diff.Data2.Take(previewLen).Select(b => b.ToString("x2")));
				sb.AppendLine($"  ROM 1: {hex1}{(diff.Length > previewLen ? "..." : "")}");
				sb.AppendLine($"  ROM 2: {hex2}{(diff.Length > previewLen ? "..." : "")}");
				shown++;
			}

			if (result.Differences.Count > 20) {
				sb.AppendLine($"... and {result.Differences.Count - 20} more regions");
			}
		}

		return sb.ToString();
	}

	#endregion

	#region Code vs Data Heuristics

	/// <summary>
	/// Find likely code entry points in the ROM.
	/// </summary>
	public List<int> FindEntryPoints() {
		var entryPoints = new List<int>();
		int dataStart = _romInfo.HeaderSize;

		// Check standard vectors for NES
		if (_romInfo.System == SystemType.Nes && _data.Length >= dataStart + 0x4000) {
			// NMI, Reset, IRQ vectors at end of PRG
			int prgEnd = _data.Length - 6;
			if (prgEnd > 0) {
				int nmi = _data[prgEnd] | (_data[prgEnd + 1] << 8);
				int reset = _data[prgEnd + 2] | (_data[prgEnd + 3] << 8);
				int irq = _data[prgEnd + 4] | (_data[prgEnd + 5] << 8);

				if (nmi >= 0x8000 && nmi < 0x10000) entryPoints.Add(nmi);
				if (reset >= 0x8000 && reset < 0x10000 && !entryPoints.Contains(reset)) entryPoints.Add(reset);
				if (irq >= 0x8000 && irq < 0x10000 && !entryPoints.Contains(irq)) entryPoints.Add(irq);
			}
		}

		// Find JSR/JMP targets
		for (int i = dataStart; i < _data.Length - 2; i++) {
			byte opcode = _data[i];
			if (opcode == 0x20 || opcode == 0x4c) { // JSR or JMP absolute
				int target = _data[i + 1] | (_data[i + 2] << 8);
				if (target >= 0x8000 && target < 0x10000 && !entryPoints.Contains(target)) {
					entryPoints.Add(target);
				}
			}
		}

		return entryPoints.OrderBy(e => e).ToList();
	}

	/// <summary>
	/// Calculate the code density (ratio of code to total data).
	/// </summary>
	public double CalculateCodeDensity() {
		var blocks = AnalyzeRom();
		int totalSize = blocks.Sum(b => b.Length);
		int codeSize = blocks.Where(b => b.Type == BlockType.Code).Sum(b => b.Length);

		return totalSize > 0 ? (double)codeSize / totalSize : 0;
	}

	#endregion
}
