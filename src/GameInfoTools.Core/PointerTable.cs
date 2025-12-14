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
		Segmented,      // Segment:Offset format
		SnesBankHi,     // SNES bank in high byte
	}

	/// <summary>
	/// Detected pointer entry.
	/// </summary>
	public record PointerEntry(int TableOffset, int PointerValue, int TargetAddress, int Index);

	/// <summary>
	/// Pointer chain for following chains of pointers.
	/// </summary>
	public record PointerChain(int StartOffset, List<int> Addresses, int Depth, bool IsCircular);

	/// <summary>
	/// Result of pointer table detection with analysis.
	/// </summary>
	public record TableDetectionResult(
		int Offset,
		int Count,
		float Confidence,
		PointerFormat DetectedFormat,
		int MinTarget,
		int MaxTarget,
		string Description
	);

	/// <summary>
	/// Pointer map entry for cross-referencing.
	/// </summary>
	public record PointerMapEntry(int SourceOffset, int TargetAddress, int TableIndex, string? Label);

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

	#region Advanced Pointer Detection

	/// <summary>
	/// Scan ROM for all pointer tables with detailed analysis.
	/// </summary>
	public static List<TableDetectionResult> ScanForTables(byte[] data, int minEntries = 4, int headerSize = 0) {
		var results = new List<TableDetectionResult>();
		var checked_ = new HashSet<int>();

		for (int offset = headerSize; offset < data.Length - 4; offset += 2) {
			if (checked_.Contains(offset)) {
				continue;
			}

			var result = AnalyzeTableDetailed(data, offset, minEntries);
			if (result != null) {
				results.Add(result);
				// Mark range as checked
				for (int i = offset; i < offset + (result.Count * GetPointerSize(result.DetectedFormat)); i++) {
					checked_.Add(i);
				}
			}
		}

		return results.OrderByDescending(r => r.Confidence * r.Count).ToList();
	}

	private static TableDetectionResult? AnalyzeTableDetailed(byte[] data, int offset, int minEntries) {
		// Try different formats and find best match
		var formats = new[] {
			PointerFormat.Absolute16,
			PointerFormat.Relative16,
			PointerFormat.Absolute24
		};

		TableDetectionResult? best = null;
		float bestScore = 0;

		foreach (var format in formats) {
			var result = TryDetectFormat(data, offset, minEntries, format);
			if (result != null && result.Confidence > bestScore) {
				best = result;
				bestScore = result.Confidence;
			}
		}

		return bestScore >= 0.5f ? best : null;
	}

	private static TableDetectionResult? TryDetectFormat(byte[] data, int offset, int minEntries, PointerFormat format) {
		int pointerSize = GetPointerSize(format);
		if (offset + (minEntries * pointerSize) > data.Length) {
			return null;
		}

		var pointers = new List<int>();
		int currentOffset = offset;

		// Read potential pointers
		while (currentOffset + pointerSize <= data.Length && pointers.Count < 256) {
			int ptr = ReadPointerValue(data, currentOffset, format);
			pointers.Add(ptr);
			currentOffset += pointerSize;

			// Stop if we've likely hit the end
			if (pointers.Count >= minEntries && !IsValidPointer(ptr, format, data.Length)) {
				pointers.RemoveAt(pointers.Count - 1);
				break;
			}
		}

		if (pointers.Count < minEntries) {
			return null;
		}

		// Calculate confidence
		float confidence = CalculateConfidence(pointers, format, data.Length);
		if (confidence < 0.5f) {
			return null;
		}

		int min = pointers.Min();
		int max = pointers.Max();
		string desc = $"{pointers.Count} {format} pointers, range ${min:x4}-${max:x4}";

		return new TableDetectionResult(offset, pointers.Count, confidence, format, min, max, desc);
	}

	private static int ReadPointerValue(byte[] data, int offset, PointerFormat format) {
		return format switch {
			PointerFormat.Relative8 => data[offset],
			PointerFormat.Absolute16 or PointerFormat.Relative16 =>
				data[offset] | (data[offset + 1] << 8),
			PointerFormat.Absolute24 =>
				data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16),
			_ => data[offset] | (data[offset + 1] << 8)
		};
	}

	private static bool IsValidPointer(int ptr, PointerFormat format, int dataLength) {
		if (format == PointerFormat.Relative16) {
			short shortPtr = (short)ptr;
			return shortPtr != short.MinValue && Math.Abs(shortPtr) < 0x4000;
		}

		return format switch {
			PointerFormat.Absolute16 => ptr >= 0x8000 && ptr <= 0xffff,
			PointerFormat.Absolute24 => ptr >= 0 && ptr < 0x1000000,
			_ => true
		};
	}

	private static float CalculateConfidence(List<int> pointers, PointerFormat format, int dataLength) {
		if (pointers.Count == 0) return 0;

		float score = 0;
		int validCount = 0;

		foreach (var ptr in pointers) {
			if (IsValidPointer(ptr, format, dataLength)) {
				validCount++;
			}
		}

		score += (float)validCount / pointers.Count * 0.5f;

		// Check clustering
		int min = pointers.Min();
		int max = pointers.Max();
		int spread = max - min;

		if (spread < 0x1000) score += 0.2f;
		else if (spread < 0x4000) score += 0.1f;

		// Check ordering (ascending is common for text/data)
		int ordered = 0;
		for (int i = 1; i < pointers.Count; i++) {
			if (pointers[i] >= pointers[i - 1]) ordered++;
		}

		score += (float)ordered / (pointers.Count - 1) * 0.2f;

		// Unique pointers (duplicate pointers less common)
		float uniqueRatio = (float)pointers.Distinct().Count() / pointers.Count;
		score += uniqueRatio * 0.1f;

		return score;
	}

	private static int GetPointerSize(PointerFormat format) {
		return format switch {
			PointerFormat.Relative8 => 1,
			PointerFormat.Absolute16 or PointerFormat.Relative16 => 2,
			PointerFormat.Absolute24 or PointerFormat.BankOffset => 3,
			_ => 2
		};
	}

	#endregion

	#region Pointer Chain Following

	/// <summary>
	/// Follow a chain of pointers from a starting address.
	/// </summary>
	public static PointerChain FollowChain(byte[] data, int startOffset, int maxDepth = 10, int baseAddress = 0x8000) {
		var addresses = new List<int>();
		var visited = new HashSet<int>();
		int currentOffset = startOffset;
		bool isCircular = false;

		for (int depth = 0; depth < maxDepth; depth++) {
			if (currentOffset < 0 || currentOffset + 2 > data.Length) {
				break;
			}

			if (visited.Contains(currentOffset)) {
				isCircular = true;
				break;
			}

			visited.Add(currentOffset);
			int ptr = data[currentOffset] | (data[currentOffset + 1] << 8);
			addresses.Add(ptr);

			// Convert pointer to file offset for next hop
			int nextOffset = ptr - baseAddress;
			if (nextOffset < 0 || nextOffset >= data.Length) {
				break;
			}

			currentOffset = nextOffset;
		}

		return new PointerChain(startOffset, addresses, addresses.Count, isCircular);
	}

	/// <summary>
	/// Find all pointer chains in the data.
	/// </summary>
	public static List<PointerChain> FindAllChains(byte[] data, int minDepth = 2, int baseAddress = 0x8000) {
		var chains = new List<PointerChain>();
		var startingPoints = new HashSet<int>();

		// Find all addresses that are pointed to
		for (int i = 0; i < data.Length - 2; i += 2) {
			int ptr = data[i] | (data[i + 1] << 8);
			if (ptr >= baseAddress && ptr < baseAddress + data.Length) {
				startingPoints.Add(ptr - baseAddress);
			}
		}

		// Follow chains from each starting point
		foreach (int start in startingPoints) {
			var chain = FollowChain(data, start, 10, baseAddress);
			if (chain.Depth >= minDepth) {
				chains.Add(chain);
			}
		}

		return chains.OrderByDescending(c => c.Depth).ToList();
	}

	#endregion

	#region Pointer Map Generation

	/// <summary>
	/// Generate a complete pointer map of the ROM.
	/// </summary>
	public static List<PointerMapEntry> GeneratePointerMap(byte[] data, int headerSize = 0, int baseAddress = 0x8000) {
		var map = new List<PointerMapEntry>();
		int tableIndex = 0;

		// Find all tables
		var tables = ScanForTables(data, 4, headerSize);

		foreach (var table in tables) {
			var pointerTable = Read(data, table.Offset, table.Count, table.DetectedFormat);

			foreach (var entry in pointerTable.Entries) {
				map.Add(new PointerMapEntry(
					entry.TableOffset,
					entry.TargetAddress,
					tableIndex,
					$"Table_{tableIndex}_Entry_{entry.Index}"
				));
			}

			tableIndex++;
		}

		// Also find standalone pointers (JSR/JMP targets)
		for (int i = headerSize; i < data.Length - 2; i++) {
			byte opcode = data[i];
			// JSR ($20) or JMP ($4c) absolute
			if (opcode == 0x20 || opcode == 0x4c) {
				int target = data[i + 1] | (data[i + 2] << 8);
				if (target >= baseAddress && target < 0x10000) {
					// Check if not already in a table
					if (!map.Any(m => m.SourceOffset == i + 1)) {
						map.Add(new PointerMapEntry(i + 1, target, -1, opcode == 0x20 ? "JSR" : "JMP"));
					}
				}
			}
		}

		return map.OrderBy(m => m.SourceOffset).ToList();
	}

	/// <summary>
	/// Export pointer map to text format.
	/// </summary>
	public static string ExportPointerMap(List<PointerMapEntry> map) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("; Pointer Map");
		sb.AppendLine("; Source     Target     Table  Label");
		sb.AppendLine(";-----------------------------------------");

		foreach (var entry in map) {
			string tableStr = entry.TableIndex >= 0 ? entry.TableIndex.ToString("D3") : "---";
			sb.AppendLine($"${entry.SourceOffset:x6}    ${entry.TargetAddress:x4}      {tableStr}    {entry.Label}");
		}

		return sb.ToString();
	}

	#endregion

	#region Bank-Crossing Detection

	/// <summary>
	/// Detect pointers that cross bank boundaries.
	/// </summary>
	public static List<(int Offset, int Pointer, int SourceBank, int TargetBank)> FindBankCrossingPointers(
		byte[] data, int bankSize = 0x4000, int headerSize = 0, int baseAddress = 0x8000) {
		var crossings = new List<(int, int, int, int)>();

		for (int i = headerSize; i < data.Length - 2; i += 2) {
			int ptr = data[i] | (data[i + 1] << 8);

			if (ptr >= baseAddress && ptr < 0x10000) {
				int fileOffset = i - headerSize;
				int sourceBank = fileOffset / bankSize;

				int targetFileOffset = ptr - baseAddress;
				int targetBank = targetFileOffset / bankSize;

				if (sourceBank != targetBank && targetFileOffset >= 0 && targetFileOffset < data.Length - headerSize) {
					crossings.Add((i, ptr, sourceBank, targetBank));
				}
			}
		}

		return crossings;
	}

	/// <summary>
	/// Validate that all pointers in a table point to the same bank.
	/// </summary>
	public static bool ValidateSameBankPointers(PointerTable table, int bankSize = 0x4000, int baseAddress = 0x8000) {
		if (table.Entries.Count == 0) return true;

		int firstBank = -1;
		foreach (var entry in table.Entries) {
			int targetFileOffset = entry.TargetAddress - baseAddress;
			if (targetFileOffset < 0) continue;

			int bank = targetFileOffset / bankSize;
			if (firstBank == -1) {
				firstBank = bank;
			} else if (bank != firstBank) {
				return false;
			}
		}

		return true;
	}

	#endregion

	#region Batch Operations

	/// <summary>
	/// Extract all pointer values from multiple tables.
	/// </summary>
	public static List<int> ExtractAllPointers(byte[] data, List<TableDetectionResult> tables) {
		var allPointers = new List<int>();

		foreach (var tableInfo in tables) {
			var table = Read(data, tableInfo.Offset, tableInfo.Count, tableInfo.DetectedFormat);
			allPointers.AddRange(table.Entries.Select(e => e.TargetAddress));
		}

		return allPointers.Distinct().OrderBy(p => p).ToList();
	}

	/// <summary>
	/// Find all addresses that are pointed to by any pointer.
	/// </summary>
	public static HashSet<int> FindAllTargetAddresses(byte[] data, int headerSize = 0, int baseAddress = 0x8000) {
		var targets = new HashSet<int>();

		for (int i = headerSize; i < data.Length - 2; i++) {
			int ptr = data[i] | (data[i + 1] << 8);

			if (ptr >= baseAddress && ptr < 0x10000) {
				targets.Add(ptr);
			}
		}

		return targets;
	}

	/// <summary>
	/// Find addresses that are NOT pointed to (potential orphan code/data).
	/// </summary>
	public static List<(int Start, int End)> FindOrphanRegions(byte[] data, int headerSize = 0, int baseAddress = 0x8000, int minSize = 16) {
		var targets = FindAllTargetAddresses(data, headerSize, baseAddress);
		var orphans = new List<(int, int)>();

		int dataLength = data.Length - headerSize;
		int regionStart = -1;

		for (int offset = 0; offset < dataLength; offset++) {
			int address = baseAddress + offset;

			if (!targets.Contains(address)) {
				if (regionStart == -1) {
					regionStart = offset;
				}
			} else {
				if (regionStart != -1) {
					int regionSize = offset - regionStart;
					if (regionSize >= minSize) {
						orphans.Add((regionStart + headerSize, offset + headerSize - 1));
					}

					regionStart = -1;
				}
			}
		}

		// Handle trailing orphan region
		if (regionStart != -1) {
			int regionSize = dataLength - regionStart;
			if (regionSize >= minSize) {
				orphans.Add((regionStart + headerSize, dataLength + headerSize - 1));
			}
		}

		return orphans;
	}

	#endregion
}
