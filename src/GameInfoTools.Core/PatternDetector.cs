namespace GameInfoTools.Core;

/// <summary>
/// Pattern detection utilities for finding data structures in ROMs.
/// </summary>
public static class PatternDetector
{
	/// <summary>
	/// A detected pattern with location and confidence.
	/// </summary>
	public record PatternMatch(
		int Offset,
		int Length,
		string PatternType,
		double Confidence,
		Dictionary<string, object>? Metadata = null
	);

	/// <summary>
	/// Find pointer tables in ROM data.
	/// </summary>
	public static List<PatternMatch> FindPointerTables(byte[] data, SystemType system)
	{
		var results = new List<PatternMatch>();
		int pointerSize = system == SystemType.Snes ? 3 : 2;
		int minEntries = 4;

		for (int i = 0; i < data.Length - (pointerSize * minEntries); i++)
		{
			int count = CountConsecutivePointers(data, i, pointerSize, system);
			if (count >= minEntries)
			{
				results.Add(new PatternMatch(
					i,
					count * pointerSize,
					"PointerTable",
					Math.Min(1.0, count / 20.0),
					new Dictionary<string, object>
					{
						["entries"] = count,
						["pointerSize"] = pointerSize
					}
				));

				// Skip past this table
				i += count * pointerSize - 1;
			}
		}

		return results;
	}

	private static int CountConsecutivePointers(byte[] data, int start, int pointerSize, SystemType system)
	{
		int count = 0;
		int pos = start;

		while (pos + pointerSize <= data.Length)
		{
			int pointer = 0;
			for (int j = 0; j < pointerSize; j++)
			{
				pointer |= data[pos + j] << (j * 8);
			}

			if (!IsValidPointer(pointer, data.Length, system))
				break;

			count++;
			pos += pointerSize;

			if (count > 256) // Reasonable limit
				break;
		}

		return count;
	}

	private static bool IsValidPointer(int pointer, int romSize, SystemType system)
	{
		return system switch
		{
			SystemType.Nes => pointer >= 0x8000 && pointer <= 0xffff,
			SystemType.Snes => (pointer & 0xffff) >= 0x8000 || (pointer >> 16) >= 0x40,
			SystemType.Gb or SystemType.Gbc => pointer >= 0x0000 && pointer <= 0x7fff,
			SystemType.Gba => pointer >= 0x08000000 && pointer < 0x08000000 + romSize,
			_ => pointer > 0 && pointer < romSize
		};
	}

	/// <summary>
	/// Find text data in ROM.
	/// </summary>
	public static List<PatternMatch> FindTextRegions(byte[] data, int minLength = 8)
	{
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length; i++)
		{
			int textLen = MeasureTextLength(data, i);
			if (textLen >= minLength)
			{
				results.Add(new PatternMatch(
					i,
					textLen,
					"Text",
					Math.Min(1.0, textLen / 50.0),
					new Dictionary<string, object>
					{
						["encoding"] = DetectTextEncoding(data, i, textLen)
					}
				));

				i += textLen - 1;
			}
		}

		return results;
	}

	private static int MeasureTextLength(byte[] data, int start)
	{
		int length = 0;
		int textChars = 0;

		for (int i = start; i < data.Length; i++)
		{
			byte b = data[i];

			// Common text byte ranges
			bool isText = (b >= 0x20 && b <= 0x7e) ||  // ASCII printable
						  (b >= 0x80 && b <= 0xdf) ||  // Common Japanese/custom
						  (b >= 0xa0 && b <= 0xff);    // Extended

			if (isText)
			{
				textChars++;
				length++;
			}
			else if (b == 0x00 || b == 0xff)
			{
				// Potential end marker
				if (textChars > 0)
				{
					length++;
					break;
				}
				break;
			}
			else if (textChars > 0 && length - textChars < 5)
			{
				// Allow some control codes
				length++;
			}
			else
			{
				break;
			}
		}

		return textChars > length / 2 ? length : 0;
	}

	private static string DetectTextEncoding(byte[] data, int start, int length)
	{
		int asciiCount = 0;
		int jpCount = 0;
		int customCount = 0;

		for (int i = 0; i < length && start + i < data.Length; i++)
		{
			byte b = data[start + i];
			if (b >= 0x20 && b <= 0x7e) asciiCount++;
			else if (b >= 0x80 && b <= 0x9f) jpCount++;
			else if (b >= 0xa0 && b <= 0xdf) customCount++;
		}

		if (asciiCount > length * 0.8) return "ASCII";
		if (jpCount > length * 0.3) return "ShiftJIS";
		return "Custom";
	}

	/// <summary>
	/// Find graphics data (CHR/tiles).
	/// </summary>
	public static List<PatternMatch> FindGraphicsRegions(byte[] data, int tileSize = 16)
	{
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length - tileSize * 8; i += tileSize)
		{
			double graphicsScore = ScoreAsGraphics(data, i, tileSize * 16);
			if (graphicsScore > 0.6)
			{
				// Find extent of graphics region
				int length = tileSize;
				while (i + length + tileSize <= data.Length)
				{
					if (ScoreAsGraphics(data, i + length, tileSize * 4) < 0.5)
						break;
					length += tileSize;
				}

				if (length >= tileSize * 4)
				{
					results.Add(new PatternMatch(
						i,
						length,
						"Graphics",
						graphicsScore,
						new Dictionary<string, object>
						{
							["tileCount"] = length / tileSize,
							["format"] = tileSize == 16 ? "2bpp" : "unknown"
						}
					));

					i += length - tileSize;
				}
			}
		}

		return results;
	}

	private static double ScoreAsGraphics(byte[] data, int start, int length)
	{
		if (start + length > data.Length)
			return 0;

		// Graphics typically have:
		// - Bit patterns (not all 0x00 or 0xff)
		// - Some repetition within tiles
		// - Distinct patterns from code

		int empty = 0;
		int full = 0;
		int varied = 0;

		for (int i = 0; i < length; i++)
		{
			byte b = data[start + i];
			if (b == 0x00) empty++;
			else if (b == 0xff) full++;
			else varied++;
		}

		// Good graphics have a mix of values
		double emptyRatio = (double)empty / length;
		double fullRatio = (double)full / length;
		double variedRatio = (double)varied / length;

		// Penalize if too uniform
		if (emptyRatio > 0.9 || fullRatio > 0.9)
			return 0.1;

		// Good score if varied with some empty/full
		return Math.Min(1.0, variedRatio * 0.5 + (1 - Math.Abs(emptyRatio - 0.3)) * 0.5);
	}

	/// <summary>
	/// Find data tables with consistent structure.
	/// </summary>
	public static List<PatternMatch> FindDataTables(byte[] data, int entrySize, int minEntries = 4)
	{
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length - entrySize * minEntries; i++)
		{
			double score = ScoreAsDataTable(data, i, entrySize, minEntries);
			if (score > 0.6)
			{
				// Count entries
				int count = minEntries;
				while (i + (count + 1) * entrySize <= data.Length)
				{
					if (ScoreAsDataTable(data, i + count * entrySize, entrySize, 1) < 0.4)
						break;
					count++;
					if (count > 256)
						break;
				}

				results.Add(new PatternMatch(
					i,
					count * entrySize,
					"DataTable",
					score,
					new Dictionary<string, object>
					{
						["entrySize"] = entrySize,
						["entryCount"] = count
					}
				));

				i += count * entrySize - 1;
			}
		}

		return results;
	}

	private static double ScoreAsDataTable(byte[] data, int start, int entrySize, int minEntries)
	{
		if (start + entrySize * minEntries > data.Length)
			return 0;

		// Data tables often have:
		// - Similar byte patterns at same offsets
		// - Values within expected ranges
		// - Some variation between entries

		double similarityScore = 0;

		for (int field = 0; field < entrySize; field++)
		{
			var values = new List<byte>();
			for (int entry = 0; entry < minEntries; entry++)
			{
				values.Add(data[start + entry * entrySize + field]);
			}

			// Check if field has reasonable variation
			int distinct = values.Distinct().Count();
			if (distinct == 1)
				similarityScore += 0.3; // All same (could be padding or type field)
			else if (distinct == minEntries)
				similarityScore += 0.8; // All different (ID or unique data)
			else
				similarityScore += 1.0; // Some variation (realistic data)
		}

		return similarityScore / entrySize;
	}

	/// <summary>
	/// Find code regions (6502/65816).
	/// </summary>
	public static List<PatternMatch> FindCodeRegions(byte[] data, SystemType system)
	{
		var results = new List<PatternMatch>();

		for (int i = 0; i < data.Length - 16; i++)
		{
			double codeScore = ScoreAsCode(data, i, 32, system);
			if (codeScore > 0.7)
			{
				// Find extent
				int length = 32;
				while (i + length + 16 <= data.Length)
				{
					if (ScoreAsCode(data, i + length, 16, system) < 0.5)
						break;
					length += 16;
				}

				if (length >= 32)
				{
					results.Add(new PatternMatch(
						i,
						length,
						"Code",
						codeScore,
						null
					));

					i += length - 1;
				}
			}
		}

		return results;
	}

	private static double ScoreAsCode(byte[] data, int start, int length, SystemType system)
	{
		if (start + length > data.Length)
			return 0;

		// Common 6502 opcodes
		var commonOpcodes = new HashSet<byte>
		{
			0xa9, 0xa5, 0xad, // LDA
			0x85, 0x8d,       // STA
			0xa2, 0xa6, 0xae, // LDX
			0xa0, 0xa4, 0xac, // LDY
			0x86, 0x8e,       // STX
			0x84, 0x8c,       // STY
			0x20, 0x4c, 0x6c, // JSR, JMP
			0x60, 0x40,       // RTS, RTI
			0xd0, 0xf0, 0x90, 0xb0, 0x10, 0x30, // Branches
			0xe8, 0xca, 0xc8, 0x88, // INX, DEX, INY, DEY
			0x18, 0x38, 0xd8, 0xf8, // CLC, SEC, CLD, SED
			0x48, 0x68, 0x08, 0x28, // PHA, PLA, PHP, PLP
			0xc9, 0xc5, 0xcd, // CMP
			0xe0, 0xe4, 0xec, // CPX
			0xc0, 0xc4, 0xcc, // CPY
			0x29, 0x25, 0x2d, // AND
			0x09, 0x05, 0x0d, // ORA
			0x49, 0x45, 0x4d, // EOR
			0x69, 0x65, 0x6d, // ADC
			0xe9, 0xe5, 0xed, // SBC
			0xea,             // NOP
		};

		int opcodeHits = 0;
		for (int i = 0; i < length; i++)
		{
			if (commonOpcodes.Contains(data[start + i]))
				opcodeHits++;
		}

		return (double)opcodeHits / length;
	}
}
