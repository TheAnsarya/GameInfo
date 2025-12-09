namespace GameInfoTools.Core;

/// <summary>
/// Pointer table detection, parsing, and manipulation.
/// </summary>
public class PointerTable {
	/// <summary>
	/// Type of pointer format.
	/// </summary>
	public enum PointerFormat {
		Absolute16,     // 16-bit absolute address (NES common)
		Absolute24,     // 24-bit absolute address (SNES)
		Relative8,      // 8-bit relative offset
		Relative16,     // 16-bit relative offset
		BankOffset,     // Bank byte + 16-bit offset
		LittleEndian,   // Default: little endian
		BigEndian,      // Big endian pointers (rare)
	}

	/// <summary>
	/// Detected pointer entry.
	/// </summary>
	public record PointerEntry(int TableOffset, int PointerValue, int TargetAddress, int Index);

	public int BaseAddress { get; set; }
	public int Bank { get; set; }
	public PointerFormat Format { get; set; } = PointerFormat.Absolute16;
	public bool IsLittleEndian { get; set; } = true;
	public List<PointerEntry> Entries { get; } = new();

	/// <summary>
	/// Read a pointer table from ROM data.
	/// </summary>
	public static PointerTable Read(byte[] data, int offset, int count, PointerFormat format, int bank = 0, int baseAddress = 0) {
		var table = new PointerTable {
			BaseAddress = baseAddress,
			Bank = bank,
			Format = format,
		};

		int pointerSize = format switch {
			PointerFormat.Relative8 => 1,
			PointerFormat.Absolute16 or PointerFormat.Relative16 => 2,
			PointerFormat.Absolute24 or PointerFormat.BankOffset => 3,
			_ => 2
		};

		for (int i = 0; i < count && offset + pointerSize <= data.Length; i++) {
			int pointerValue = ReadPointer(data, offset, format, table.IsLittleEndian);
			int targetAddress = CalculateTarget(pointerValue, format, bank, baseAddress, offset);

			table.Entries.Add(new PointerEntry(offset, pointerValue, targetAddress, i));
			offset += pointerSize;
		}

		return table;
	}

	/// <summary>
	/// Auto-detect a pointer table at a location.
	/// </summary>
	public static PointerTable? DetectTable(byte[] data, int offset, int maxEntries, int bank = 0) {
		// Try to detect based on pattern analysis
		if (offset + 4 > data.Length) {
			return null;
		}

		// Read first few potential pointers
		var potentialPointers = new List<int>();
		for (int i = 0; i < Math.Min(maxEntries, 16); i++) {
			if (offset + (i * 2) + 2 > data.Length)
				break;

			int ptr16 = data[offset + (i * 2)] | (data[offset + (i * 2) + 1] << 8);
			potentialPointers.Add(ptr16);
		}

		if (potentialPointers.Count < 2) {
			return null;
		}

		// Check if pointers look valid (within reasonable range)
		int validCount = 0;
		int bankStart = bank * 0x4000;  // NES bank size
		int bankEnd = bankStart + 0x4000;

		foreach (var ptr in potentialPointers) {
			// For NES, valid ROM pointers typically in $8000-$FFFF range
			if (ptr >= 0x8000 && ptr <= 0xffff) {
				validCount++;
			}
		}

		// If most pointers look valid, create table
		if (validCount >= potentialPointers.Count * 0.75) {
			return Read(data, offset, potentialPointers.Count, PointerFormat.Absolute16, bank);
		}

		return null;
	}

	private static int ReadPointer(byte[] data, int offset, PointerFormat format, bool littleEndian) =>
		format switch {
			PointerFormat.Relative8 => data[offset],
			PointerFormat.Absolute16 or PointerFormat.Relative16 when littleEndian
				=> data[offset] | (data[offset + 1] << 8),
			PointerFormat.Absolute16 or PointerFormat.Relative16
				=> (data[offset] << 8) | data[offset + 1],
			PointerFormat.Absolute24 when littleEndian
				=> data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16),
			PointerFormat.Absolute24
				=> (data[offset] << 16) | (data[offset + 1] << 8) | data[offset + 2],
			PointerFormat.BankOffset
				=> (data[offset] << 16) | data[offset + 1] | (data[offset + 2] << 8),
			_ => data[offset] | (data[offset + 1] << 8)
		};

	private static int CalculateTarget(int pointerValue, PointerFormat format, int bank, int baseAddress, int tableOffset) {
		return format switch {
			PointerFormat.Relative8 => tableOffset + (sbyte)pointerValue,
			PointerFormat.Relative16 => tableOffset + (short)pointerValue,
			PointerFormat.Absolute16 => pointerValue,
			PointerFormat.Absolute24 => pointerValue,
			PointerFormat.BankOffset => pointerValue, // Already combined
			_ => pointerValue
		};
	}

	/// <summary>
	/// Find all potential pointer tables in ROM.
	/// </summary>
	public static List<(int Offset, int Count, float Confidence)> FindAllTables(byte[] data, int minEntries = 4) {
		var results = new List<(int Offset, int Count, float Confidence)>();
		var checked_ = new HashSet<int>();

		for (int offset = 0; offset < data.Length - 4; offset += 2) {
			if (checked_.Contains(offset)) {
				continue;
			}

			var result = AnalyzePotentialTable(data, offset, minEntries);
			if (result.HasValue) {
				results.Add(result.Value);
				// Mark this range as checked
				for (int i = offset; i < offset + (result.Value.Count * 2); i++) {
					checked_.Add(i);
				}
			}
		}

		return results.OrderByDescending(r => r.Confidence * r.Count).ToList();
	}

	private static (int Offset, int Count, float Confidence)? AnalyzePotentialTable(byte[] data, int offset, int minEntries) {
		if (offset + (minEntries * 2) > data.Length) {
			return null;
		}

		var pointers = new List<int>();
		int currentOffset = offset;

		// Read potential pointers
		while (currentOffset + 2 <= data.Length && pointers.Count < 256) {
			int ptr = data[currentOffset] | (data[currentOffset + 1] << 8);
			pointers.Add(ptr);
			currentOffset += 2;

			// Stop if we hit something that looks like end of table
			if (pointers.Count >= minEntries) {
				// Check if recent pointers are drastically different from earlier ones
				var recent = pointers.Skip(pointers.Count - 2).ToList();
				var earlier = pointers.Take(pointers.Count - 2).ToList();

				if (earlier.Count > 0) {
					int avgEarlier = (int)earlier.Average();
					int avgRecent = (int)recent.Average();

					// If there's a huge jump, might be end of table
					if (Math.Abs(avgRecent - avgEarlier) > 0x4000) {
						pointers.RemoveRange(pointers.Count - 2, 2);
						break;
					}
				}
			}
		}

		if (pointers.Count < minEntries) {
			return null;
		}

		// Calculate confidence based on pointer characteristics
		float confidence = CalculateTableConfidence(pointers, data);

		if (confidence < 0.5f) {
			return null;
		}

		return (offset, pointers.Count, confidence);
	}

	private static float CalculateTableConfidence(List<int> pointers, byte[] data) {
		if (pointers.Count == 0) {
			return 0;
		}

		float score = 0;

		// Check 1: Are pointers in valid ROM range ($8000-$FFFF for NES)?
		int validRangeCount = pointers.Count(p => p >= 0x8000 && p <= 0xffff);
		score += (float)validRangeCount / pointers.Count * 0.4f;

		// Check 2: Are pointers close to each other (same general area)?
		int min = pointers.Min();
		int max = pointers.Max();
		int spread = max - min;
		if (spread < 0x2000) {
			score += 0.2f;
		} else if (spread < 0x4000) {
			score += 0.1f;
		}

		// Check 3: Do pointers point to valid-looking data?
		int validTargets = 0;
		foreach (var ptr in pointers.Take(8)) // Check first 8
		{
			// Convert to file offset (rough approximation)
			int fileOffset = ptr - 0x8000;
			if (fileOffset >= 0 && fileOffset < data.Length) {
				validTargets++;
			}
		}

		score += (float)validTargets / Math.Min(8, pointers.Count) * 0.3f;

		// Check 4: Sequential or near-sequential pointers
		int sequential = 0;
		for (int i = 1; i < pointers.Count; i++) {
			if (pointers[i] > pointers[i - 1] && pointers[i] - pointers[i - 1] < 0x100) {
				sequential++;
			}
		}

		if (sequential > pointers.Count * 0.7) {
			score += 0.1f;
		}

		return score;
	}

	/// <summary>
	/// Update pointers when data is relocated.
	/// </summary>
	public static byte[] RelocatePointers(byte[] data, int tableOffset, int count, int delta, PointerFormat format = PointerFormat.Absolute16) {
		var result = (byte[])data.Clone();
		int pointerSize = format == PointerFormat.Absolute24 ? 3 : 2;

		for (int i = 0; i < count; i++) {
			int offset = tableOffset + (i * pointerSize);
			if (offset + pointerSize > result.Length) {
				break;
			}

			int currentValue = format == PointerFormat.Absolute24
				? result[offset] | (result[offset + 1] << 8) | (result[offset + 2] << 16)
				: result[offset] | (result[offset + 1] << 8);
			int newValue = currentValue + delta;

			result[offset] = (byte)(newValue & 0xff);
			result[offset + 1] = (byte)((newValue >> 8) & 0xff);
			if (format == PointerFormat.Absolute24) {
				result[offset + 2] = (byte)((newValue >> 16) & 0xff);
			}
		}

		return result;
	}

	/// <summary>
	/// Write a new pointer table to data.
	/// </summary>
	public byte[] WriteTable(byte[] data) {
		var result = (byte[])data.Clone();
		int pointerSize = Format switch {
			PointerFormat.Relative8 => 1,
			PointerFormat.Absolute24 or PointerFormat.BankOffset => 3,
			_ => 2
		};

		foreach (var entry in Entries) {
			if (entry.TableOffset + pointerSize > result.Length) {
				break;
			}

			WritePointer(result, entry.TableOffset, entry.PointerValue, Format, IsLittleEndian);
		}

		return result;
	}

	private static void WritePointer(byte[] data, int offset, int value, PointerFormat format, bool littleEndian) {
		switch (format) {
			case PointerFormat.Relative8:
				data[offset] = (byte)value;
				break;

			case PointerFormat.Absolute16:
			case PointerFormat.Relative16:
				if (littleEndian) {
					data[offset] = (byte)(value & 0xff);
					data[offset + 1] = (byte)((value >> 8) & 0xff);
				} else {
					data[offset] = (byte)((value >> 8) & 0xff);
					data[offset + 1] = (byte)(value & 0xff);
				}

				break;

			case PointerFormat.Absolute24:
			case PointerFormat.BankOffset:
				if (littleEndian) {
					data[offset] = (byte)(value & 0xff);
					data[offset + 1] = (byte)((value >> 8) & 0xff);
					data[offset + 2] = (byte)((value >> 16) & 0xff);
				} else {
					data[offset] = (byte)((value >> 16) & 0xff);
					data[offset + 1] = (byte)((value >> 8) & 0xff);
					data[offset + 2] = (byte)(value & 0xff);
				}

				break;
		}
	}
}
