using System.Text;
using GameInfoTools.Core;

namespace GameInfoTools.Analysis;

/// <summary>
/// ROM analysis and mapping tool.
/// </summary>
public class RomAnalyzer
{
	private readonly byte[] _data;
	private readonly RomInfo _romInfo;

	public RomAnalyzer(byte[] data)
	{
		_data = data;
		_romInfo = Core.RomFile.GetRomInfo(data);
	}

	/// <summary>
	/// Data block type classification.
	/// </summary>
	public enum BlockType
	{
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
	/// Analyze the entire ROM and identify data blocks.
	/// </summary>
	public List<DataBlock> AnalyzeRom(int blockSize = 256)
	{
		var blocks = new List<DataBlock>();
		int offset = _romInfo.HeaderSize;

		while (offset < _data.Length)
		{
			int remaining = _data.Length - offset;
			int size = Math.Min(blockSize, remaining);

			var (type, confidence) = ClassifyBlock(offset, size);
			blocks.Add(new DataBlock(offset, size, type, confidence));

			offset += size;
		}

		// Merge adjacent blocks of same type
		return MergeBlocks(blocks);
	}

	private (BlockType Type, float Confidence) ClassifyBlock(int offset, int length)
	{
		if (length < 4)
		{
			return (BlockType.Unknown, 0);
		}

		// Check for empty/padding
		if (IsEmpty(offset, length))
		{
			return (BlockType.Empty, 1.0f);
		}

		// Check for compressed data
		var compressionResult = CompressionDetector.Detect(_data, offset);
		if (compressionResult.Type != CompressionDetector.CompressionType.None && compressionResult.Confidence > 0.7)
		{
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

	private bool IsEmpty(int offset, int length)
	{
		byte first = _data[offset];
		if (first != 0x00 && first != 0xff)
		{
			return false;
		}

		for (int i = 1; i < length && offset + i < _data.Length; i++)
		{
			if (_data[offset + i] != first)
			{
				return false;
			}
		}

		return true;
	}

	private float ScoreAsCode(int offset, int length)
	{
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

		for (int i = 0; i < length && offset + i < _data.Length; i++)
		{
			byte b = _data[offset + i];
			totalOpcodes++;

			if (common6502.Contains(b))
			{
				codeOpcodes++;
			}
		}

		if (totalOpcodes > 0)
		{
			score = (float)codeOpcodes / totalOpcodes;
		}

		// Bonus for seeing JMP/JSR followed by valid address
		int jumpCount = 0;
		for (int i = 0; i < length - 2 && offset + i + 2 < _data.Length; i++)
		{
			byte b = _data[offset + i];
			if (b == 0x4c || b == 0x20) // JMP or JSR
			{
				int addr = _data[offset + i + 1] | (_data[offset + i + 2] << 8);
				if (addr >= 0x8000 && addr < 0x10000)
				{
					jumpCount++;
				}
			}
		}

		if (jumpCount > length / 16)
		{
			score += 0.2f;
		}

		return Math.Min(1.0f, score);
	}

	private float ScoreAsGraphics(int offset, int length)
	{
		// CHR tile patterns often have:
		// - Bitplane patterns (bytes repeat with offset of 8)
		// - Low byte counts per tile

		int tilesAnalyzed = 0;
		float avgEntropyPerTile = 0;

		for (int tileStart = offset; tileStart + 16 <= offset + length && tileStart + 16 <= _data.Length; tileStart += 16)
		{
			// Calculate entropy of this 16-byte tile
			var counts = new int[256];
			for (int i = 0; i < 16; i++)
			{
				counts[_data[tileStart + i]]++;
			}

			int uniqueBytes = counts.Count(c => c > 0);
			avgEntropyPerTile += uniqueBytes;
			tilesAnalyzed++;
		}

		if (tilesAnalyzed == 0)
		{
			return 0;
		}

		avgEntropyPerTile /= tilesAnalyzed;

		// Graphics tiles typically have low entropy (2-6 unique bytes per tile)
		if (avgEntropyPerTile >= 2 && avgEntropyPerTile <= 8)
		{
			return 0.6f + 0.2f * (1 - (avgEntropyPerTile - 2) / 6);
		}

		return 0.2f;
	}

	private float ScoreAsText(int offset, int length)
	{
		// Check for ASCII-like patterns or common Japanese text encodings
		int printableCount = 0;
		int terminatorCount = 0;
		int controlCount = 0;

		for (int i = 0; i < length && offset + i < _data.Length; i++)
		{
			byte b = _data[offset + i];

			// ASCII printable range
			if (b >= 0x20 && b <= 0x7e)
			{
				printableCount++;
			}
			// Common terminators
			else if (b == 0x00 || b == 0xff || b == 0xfe)
			{
				terminatorCount++;
			}
			// Control characters
			else if (b < 0x20 && b != 0x00)
			{
				controlCount++;
			}
		}

		if (length == 0)
		{
			return 0;
		}

		float printableRatio = (float)printableCount / length;
		float terminatorRatio = (float)terminatorCount / length;

		// Good text has high printable ratio with occasional terminators
		if (printableRatio > 0.7f && terminatorRatio < 0.3f)
		{
			return printableRatio;
		}

		// Also score DTE/custom encoding patterns
		// Check for reasonable byte value distribution
		var counts = new int[256];
		for (int i = 0; i < length && offset + i < _data.Length; i++)
		{
			counts[_data[offset + i]]++;
		}

		int usedValues = counts.Count(c => c > 0);
		// Text typically uses 30-100 unique byte values
		if (usedValues >= 20 && usedValues <= 120)
		{
			return 0.5f;
		}

		return 0.2f;
	}

	private float ScoreAsPointerTable(int offset, int length)
	{
		if (length < 4)
		{
			return 0;
		}

		int validPointers = 0;
		int totalPointers = 0;

		// Check for consecutive 16-bit values that look like ROM pointers
		for (int i = 0; i + 2 <= length && offset + i + 2 <= _data.Length; i += 2)
		{
			int ptr = _data[offset + i] | (_data[offset + i + 1] << 8);
			totalPointers++;

			// Valid NES ROM pointer range
			if (ptr >= 0x8000 && ptr < 0x10000)
			{
				validPointers++;
			}
		}

		if (totalPointers < 2)
		{
			return 0;
		}

		float validRatio = (float)validPointers / totalPointers;

		// Check if pointers are sequential/close together (common for pointer tables)
		if (validRatio > 0.7f && totalPointers >= 4)
		{
			var pointers = new List<int>();
			for (int i = 0; i + 2 <= length && offset + i + 2 <= _data.Length; i += 2)
			{
				int ptr = _data[offset + i] | (_data[offset + i + 1] << 8);
				if (ptr >= 0x8000 && ptr < 0x10000)
				{
					pointers.Add(ptr);
				}
			}

			if (pointers.Count >= 2)
			{
				int spread = pointers.Max() - pointers.Min();
				// Pointer tables often point to nearby data
				if (spread < 0x4000)
				{
					return 0.8f;
				}
			}
		}

		return validRatio > 0.5f ? 0.5f : 0.2f;
	}

	private float ScoreAsDataTable(int offset, int length)
	{
		// Data tables often have:
		// - Repeating record sizes
		// - Similar value ranges across records

		// Try to detect record size by finding repeating patterns
		int bestRecordSize = 0;
		float bestScore = 0;

		for (int recordSize = 2; recordSize <= 16 && recordSize * 4 <= length; recordSize++)
		{
			int matchingRecords = 0;
			int totalRecords = length / recordSize;

			if (totalRecords < 4)
			{
				continue;
			}

			// Compare structure of consecutive records
			for (int r = 0; r < totalRecords - 1; r++)
			{
				int rec1 = offset + r * recordSize;
				int rec2 = offset + (r + 1) * recordSize;

				// Check if value ranges are similar
				int matches = 0;
				for (int b = 0; b < recordSize && rec1 + b < _data.Length && rec2 + b < _data.Length; b++)
				{
					int v1 = _data[rec1 + b];
					int v2 = _data[rec2 + b];

					// Similar if within 64 of each other or both in same quarter
					if (Math.Abs(v1 - v2) < 64 || (v1 >> 6) == (v2 >> 6))
					{
						matches++;
					}
				}

				if (matches > recordSize * 0.6f)
				{
					matchingRecords++;
				}
			}

			float score = (float)matchingRecords / (totalRecords - 1);
			if (score > bestScore)
			{
				bestScore = score;
				bestRecordSize = recordSize;
			}
		}

		return bestScore > 0.5f ? bestScore * 0.8f : 0;
	}

	private List<DataBlock> MergeBlocks(List<DataBlock> blocks)
	{
		if (blocks.Count == 0)
		{
			return blocks;
		}

		var merged = new List<DataBlock>();
		var current = blocks[0];

		for (int i = 1; i < blocks.Count; i++)
		{
			var next = blocks[i];

			// Merge if same type and adjacent
			if (next.Type == current.Type && next.Offset == current.Offset + current.Length)
			{
				current = current with
				{
					Length = current.Length + next.Length,
					Confidence = (current.Confidence + next.Confidence) / 2
				};
			}
			else
			{
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
	public string GenerateMap()
	{
		var sb = new StringBuilder();
		sb.AppendLine($"ROM Analysis: {_romInfo.System}");
		sb.AppendLine($"Size: {_data.Length:N0} bytes ({_data.Length / 1024} KB)");
		sb.AppendLine($"Header: {_romInfo.HeaderSize} bytes");
		sb.AppendLine();

		var blocks = AnalyzeRom();

		sb.AppendLine("=== Data Blocks ===");
		sb.AppendLine();

		foreach (var block in blocks)
		{
			string typeStr = block.Type.ToString().PadRight(12);
			sb.AppendLine($"${block.Offset:x6}-${block.Offset + block.Length - 1:x6}  {typeStr}  {block.Length,6} bytes  ({block.Confidence:P0})");
		}

		sb.AppendLine();
		sb.AppendLine("=== Summary ===");

		var summary = blocks.GroupBy(b => b.Type)
			.Select(g => new { Type = g.Key, TotalSize = g.Sum(b => b.Length), Count = g.Count() })
			.OrderByDescending(s => s.TotalSize);

		foreach (var s in summary)
		{
			sb.AppendLine($"{s.Type,-12}: {s.TotalSize,8:N0} bytes ({s.Count} blocks)");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Export analysis to JSON.
	/// </summary>
	public string ExportToJson()
	{
		var blocks = AnalyzeRom();
		var sb = new StringBuilder();

		sb.AppendLine("{");
		sb.AppendLine($"  \"system\": \"{_romInfo.System}\",");
		sb.AppendLine($"  \"size\": {_data.Length},");
		sb.AppendLine($"  \"headerSize\": {_romInfo.HeaderSize},");
		sb.AppendLine("  \"blocks\": [");

		for (int i = 0; i < blocks.Count; i++)
		{
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
}
