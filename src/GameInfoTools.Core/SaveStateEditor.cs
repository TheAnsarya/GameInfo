using System.IO.Compression;
using System.Text;

namespace GameInfoTools.Core;

/// <summary>
/// Editor for game save states and SRAM files.
/// </summary>
public static class SaveStateEditor {
	#region Format Detection

	/// <summary>
	/// Detect save file format from data.
	/// </summary>
	public static SaveFormat DetectFormat(byte[] data) {
		if (data.Length < 4) {
			return SaveFormat.Unknown;
		}

		// Check for common save state signatures
		var magic = Encoding.ASCII.GetString(data, 0, Math.Min(4, data.Length));

		// SNES9x
		if (magic.StartsWith("#!s9") || magic.StartsWith("#!zs")) {
			return SaveFormat.Snes9x;
		}

		// ZSNES
		if (magic == "ZSNE" || data.Length >= 5 && Encoding.ASCII.GetString(data, 0, 5) == "ZSNES") {
			return SaveFormat.Zsnes;
		}

		// bsnes/higan
		if (magic == "BST1") {
			return SaveFormat.Bsnes;
		}

		// Nestopia
		if (magic == "NST\x1a" || magic == "NstS") {
			return SaveFormat.Nestopia;
		}

		// FCEUX
		if (magic == "FCSX" || magic == "FCS\x1a") {
			return SaveFormat.Fceux;
		}

		// VisualBoyAdvance
		if (magic == "VBA-" || magic == "VBAs") {
			return SaveFormat.Vba;
		}

		// mGBA
		if (magic == "mGBA" || (data.Length > 8 && Encoding.ASCII.GetString(data, 0, 8).Contains("mGBA"))) {
			return SaveFormat.Mgba;
		}

		// RetroArch (.state)
		if (magic == "RZIP" || magic == "RART") {
			return SaveFormat.RetroArch;
		}

		// Check if it's gzipped
		if (data[0] == 0x1f && data[1] == 0x8b) {
			return SaveFormat.GzipCompressed;
		}

		// Check for common SRAM sizes
		if (IsPowerOfTwo(data.Length) && data.Length is >= 0x100 and <= 0x80000) {
			return SaveFormat.Sram;
		}

		return SaveFormat.Unknown;
	}

	/// <summary>
	/// Get detailed information about a save file.
	/// </summary>
	public static SaveFileInfo GetSaveInfo(byte[] data) {
		var format = DetectFormat(data);

		return format switch {
			SaveFormat.Snes9x => ParseSnes9xState(data),
			SaveFormat.Zsnes => ParseZsnesState(data),
			SaveFormat.Bsnes => ParseBsnesState(data),
			SaveFormat.Nestopia => ParseNestopiaState(data),
			SaveFormat.Fceux => ParseFceuxState(data),
			SaveFormat.Vba => ParseVbaState(data),
			SaveFormat.GzipCompressed => GetCompressedInfo(data),
			SaveFormat.Sram => ParseSramFile(data),
			_ => new SaveFileInfo(format, data.Length, null, null, null, [])
		};
	}

	#endregion

	#region SRAM Editing

	/// <summary>
	/// Read a value from SRAM at the specified offset.
	/// </summary>
	public static int ReadValue(byte[] sram, int offset, SramValueType type) {
		if (offset < 0 || offset >= sram.Length) {
			throw new ArgumentOutOfRangeException(nameof(offset));
		}

		return type switch {
			SramValueType.Byte => sram[offset],
			SramValueType.Word => offset + 1 < sram.Length
				? sram[offset] | (sram[offset + 1] << 8)
				: throw new ArgumentException("Insufficient data for word"),
			SramValueType.WordBE => offset + 1 < sram.Length
				? (sram[offset] << 8) | sram[offset + 1]
				: throw new ArgumentException("Insufficient data for word"),
			SramValueType.DWord => offset + 3 < sram.Length
				? sram[offset] | (sram[offset + 1] << 8) | (sram[offset + 2] << 16) | (sram[offset + 3] << 24)
				: throw new ArgumentException("Insufficient data for dword"),
			SramValueType.DWordBE => offset + 3 < sram.Length
				? (sram[offset] << 24) | (sram[offset + 1] << 16) | (sram[offset + 2] << 8) | sram[offset + 3]
				: throw new ArgumentException("Insufficient data for dword"),
			_ => throw new ArgumentException($"Unknown value type: {type}")
		};
	}

	/// <summary>
	/// Write a value to SRAM at the specified offset.
	/// </summary>
	public static void WriteValue(byte[] sram, int offset, int value, SramValueType type) {
		if (offset < 0 || offset >= sram.Length) {
			throw new ArgumentOutOfRangeException(nameof(offset));
		}

		switch (type) {
			case SramValueType.Byte:
				sram[offset] = (byte)(value & 0xff);
				break;
			case SramValueType.Word:
				if (offset + 1 >= sram.Length)
					throw new ArgumentException("Insufficient space for word");
				sram[offset] = (byte)(value & 0xff);
				sram[offset + 1] = (byte)((value >> 8) & 0xff);
				break;
			case SramValueType.WordBE:
				if (offset + 1 >= sram.Length)
					throw new ArgumentException("Insufficient space for word");
				sram[offset] = (byte)((value >> 8) & 0xff);
				sram[offset + 1] = (byte)(value & 0xff);
				break;
			case SramValueType.DWord:
				if (offset + 3 >= sram.Length)
					throw new ArgumentException("Insufficient space for dword");
				sram[offset] = (byte)(value & 0xff);
				sram[offset + 1] = (byte)((value >> 8) & 0xff);
				sram[offset + 2] = (byte)((value >> 16) & 0xff);
				sram[offset + 3] = (byte)((value >> 24) & 0xff);
				break;
			case SramValueType.DWordBE:
				if (offset + 3 >= sram.Length)
					throw new ArgumentException("Insufficient space for dword");
				sram[offset] = (byte)((value >> 24) & 0xff);
				sram[offset + 1] = (byte)((value >> 16) & 0xff);
				sram[offset + 2] = (byte)((value >> 8) & 0xff);
				sram[offset + 3] = (byte)(value & 0xff);
				break;
		}
	}

	/// <summary>
	/// Find a value in SRAM data.
	/// </summary>
	public static List<int> FindValue(byte[] sram, int value, SramValueType type) {
		var results = new List<int>();
		int maxOffset = type switch {
			SramValueType.Byte => sram.Length,
			SramValueType.Word or SramValueType.WordBE => sram.Length - 1,
			SramValueType.DWord or SramValueType.DWordBE => sram.Length - 3,
			_ => sram.Length
		};

		for (int i = 0; i < maxOffset; i++) {
			try {
				if (ReadValue(sram, i, type) == value) {
					results.Add(i);
				}
			} catch {
				// Skip invalid offsets
			}
		}

		return results;
	}

	/// <summary>
	/// Find changed values between two SRAM snapshots.
	/// </summary>
	public static List<SramChange> FindChanges(byte[] before, byte[] after, SramValueType type) {
		var changes = new List<SramChange>();

		int maxOffset = Math.Min(before.Length, after.Length);
		int step = type switch {
			SramValueType.Byte => 1,
			SramValueType.Word or SramValueType.WordBE => 2,
			SramValueType.DWord or SramValueType.DWordBE => 4,
			_ => 1
		};

		maxOffset -= step - 1;

		for (int i = 0; i < maxOffset; i += step) {
			try {
				int valueBefore = ReadValue(before, i, type);
				int valueAfter = ReadValue(after, i, type);

				if (valueBefore != valueAfter) {
					changes.Add(new SramChange(i, valueBefore, valueAfter, type));
				}
			} catch {
				// Skip invalid offsets
			}
		}

		return changes;
	}

	/// <summary>
	/// Filter candidate addresses that changed by a specific amount.
	/// </summary>
	public static List<int> FilterByChange(byte[] before, byte[] after, List<int> candidates, int delta, SramValueType type) {
		return candidates.Where(offset => {
			try {
				int valueBefore = ReadValue(before, offset, type);
				int valueAfter = ReadValue(after, offset, type);
				return valueAfter - valueBefore == delta;
			} catch {
				return false;
			}
		}).ToList();
	}

	#endregion

	#region Checksum Calculation

	/// <summary>
	/// Calculate SRAM checksum for various systems.
	/// </summary>
	public static ushort CalculateSramChecksum(byte[] sram, SramChecksumType type) {
		return type switch {
			SramChecksumType.SimpleSum => CalculateSimpleSum(sram),
			SramChecksumType.Xor => CalculateXor(sram),
			SramChecksumType.Complement => CalculateComplement(sram),
			SramChecksumType.DragonQuest => CalculateDragonQuestChecksum(sram),
			SramChecksumType.FinalFantasy => CalculateFinalFantasyChecksum(sram),
			SramChecksumType.Zelda => CalculateZeldaChecksum(sram),
			_ => 0
		};
	}

	/// <summary>
	/// Fix SRAM checksum at specified location.
	/// </summary>
	public static void FixSramChecksum(byte[] sram, int checksumOffset, SramChecksumType type, int dataStart = 0, int dataEnd = -1) {
		if (dataEnd < 0) {
			dataEnd = checksumOffset;
		}

		// Calculate over specified range
		var dataRange = new byte[dataEnd - dataStart];
		Array.Copy(sram, dataStart, dataRange, 0, dataEnd - dataStart);

		ushort checksum = CalculateSramChecksum(dataRange, type);

		// Write checksum (little endian)
		sram[checksumOffset] = (byte)(checksum & 0xff);
		if (checksumOffset + 1 < sram.Length) {
			sram[checksumOffset + 1] = (byte)((checksum >> 8) & 0xff);
		}
	}

	/// <summary>
	/// Verify SRAM checksum.
	/// </summary>
	public static bool VerifySramChecksum(byte[] sram, int checksumOffset, SramChecksumType type, int dataStart = 0, int dataEnd = -1) {
		if (dataEnd < 0) {
			dataEnd = checksumOffset;
		}

		if (checksumOffset + 1 >= sram.Length) {
			return false;
		}

		// Read stored checksum
		ushort stored = (ushort)(sram[checksumOffset] | (sram[checksumOffset + 1] << 8));

		// Calculate over specified range
		var dataRange = new byte[dataEnd - dataStart];
		Array.Copy(sram, dataStart, dataRange, 0, dataEnd - dataStart);

		ushort calculated = CalculateSramChecksum(dataRange, type);

		return stored == calculated;
	}

	private static ushort CalculateSimpleSum(byte[] data) {
		uint sum = 0;
		foreach (byte b in data) {
			sum += b;
		}

		return (ushort)(sum & 0xffff);
	}

	private static ushort CalculateXor(byte[] data) {
		ushort result = 0;
		for (int i = 0; i < data.Length - 1; i += 2) {
			ushort word = (ushort)(data[i] | (data[i + 1] << 8));
			result ^= word;
		}

		if (data.Length % 2 == 1) {
			result ^= data[^1];
		}

		return result;
	}

	private static ushort CalculateComplement(byte[] data) {
		uint sum = 0;
		foreach (byte b in data) {
			sum += b;
		}

		return (ushort)(~sum & 0xffff);
	}

	private static ushort CalculateDragonQuestChecksum(byte[] data) {
		// Dragon Quest games use a specific algorithm
		uint sum = 0;
		for (int i = 0; i < data.Length; i++) {
			sum += (uint)(data[i] * (i + 1));
		}

		return (ushort)(sum & 0xffff);
	}

	private static ushort CalculateFinalFantasyChecksum(byte[] data) {
		// Final Fantasy uses CRC-like checksum
		ushort crc = 0xffff;
		foreach (byte b in data) {
			crc ^= (ushort)(b << 8);
			for (int i = 0; i < 8; i++) {
				if ((crc & 0x8000) != 0) {
					crc = (ushort)((crc << 1) ^ 0x1021);
				} else {
					crc <<= 1;
				}
			}
		}

		return crc;
	}

	private static ushort CalculateZeldaChecksum(byte[] data) {
		// Zelda uses a specific checksum at the end of save slots
		ushort sum = 0;
		for (int i = 0; i < data.Length; i += 2) {
			if (i + 1 < data.Length) {
				sum += (ushort)(data[i] | (data[i + 1] << 8));
			} else {
				sum += data[i];
			}
		}

		return sum;
	}

	#endregion

	#region Save File Comparison

	/// <summary>
	/// Compare two save files and return differences.
	/// </summary>
	public static SaveComparison CompareSaves(byte[] save1, byte[] save2) {
		var differences = new List<SaveDifference>();

		int minLength = Math.Min(save1.Length, save2.Length);
		int maxLength = Math.Max(save1.Length, save2.Length);

		int diffStart = -1;
		for (int i = 0; i < minLength; i++) {
			if (save1[i] != save2[i]) {
				if (diffStart < 0) {
					diffStart = i;
				}
			} else if (diffStart >= 0) {
				// End of difference block
				var block1 = new byte[i - diffStart];
				var block2 = new byte[i - diffStart];
				Array.Copy(save1, diffStart, block1, 0, block1.Length);
				Array.Copy(save2, diffStart, block2, 0, block2.Length);
				differences.Add(new SaveDifference(diffStart, i - diffStart, block1, block2));
				diffStart = -1;
			}
		}

		// Handle trailing difference
		if (diffStart >= 0) {
			var block1 = new byte[minLength - diffStart];
			var block2 = new byte[minLength - diffStart];
			Array.Copy(save1, diffStart, block1, 0, block1.Length);
			Array.Copy(save2, diffStart, block2, 0, block2.Length);
			differences.Add(new SaveDifference(diffStart, minLength - diffStart, block1, block2));
		}

		// Handle size difference
		if (save1.Length != save2.Length) {
			var longer = save1.Length > save2.Length ? save1 : save2;
			var extra = new byte[maxLength - minLength];
			Array.Copy(longer, minLength, extra, 0, extra.Length);
			differences.Add(new SaveDifference(minLength, extra.Length, save1.Length > save2.Length ? extra : [], save1.Length > save2.Length ? [] : extra));
		}

		int bytesChanged = differences.Sum(d => d.Length);
		double similarity = 1.0 - ((double)bytesChanged / maxLength);

		return new SaveComparison(save1.Length, save2.Length, differences, similarity);
	}

	#endregion

	#region Save State Extraction

	/// <summary>
	/// Extract SRAM from a save state file.
	/// </summary>
	public static byte[]? ExtractSram(byte[] saveState) {
		var format = DetectFormat(saveState);

		return format switch {
			SaveFormat.Snes9x => ExtractSnes9xSram(saveState),
			SaveFormat.Zsnes => ExtractZsnesSram(saveState),
			SaveFormat.Bsnes => ExtractBsnesSram(saveState),
			SaveFormat.Fceux => ExtractFceuxSram(saveState),
			SaveFormat.GzipCompressed => ExtractFromCompressed(saveState),
			_ => null
		};
	}

	/// <summary>
	/// Decompress a gzipped save state.
	/// </summary>
	public static byte[] DecompressSaveState(byte[] data) {
		if (data[0] != 0x1f || data[1] != 0x8b) {
			return data; // Not gzipped
		}

		using var compressedStream = new MemoryStream(data);
		using var gzipStream = new GZipStream(compressedStream, CompressionMode.Decompress);
		using var resultStream = new MemoryStream();
		gzipStream.CopyTo(resultStream);
		return resultStream.ToArray();
	}

	/// <summary>
	/// Compress a save state with gzip.
	/// </summary>
	public static byte[] CompressSaveState(byte[] data) {
		using var resultStream = new MemoryStream();
		using (var gzipStream = new GZipStream(resultStream, CompressionLevel.Optimal)) {
			gzipStream.Write(data, 0, data.Length);
		}

		return resultStream.ToArray();
	}

	#endregion

	#region Private Helpers

	private static bool IsPowerOfTwo(int x) => x > 0 && (x & (x - 1)) == 0;

	private static SaveFileInfo ParseSnes9xState(byte[] data) {
		// SNES9x save state header parsing
		string version = "";
		if (data.Length > 11) {
			version = Encoding.ASCII.GetString(data, 4, 4).TrimEnd('\0');
		}

		var blocks = new List<SaveBlock>();

		// Look for common block markers
		int offset = 64; // Skip header
		while (offset < data.Length - 8) {
			var marker = Encoding.ASCII.GetString(data, offset, 4);
			if (char.IsLetter(marker[0]) && marker.All(c => char.IsLetterOrDigit(c) || c == '\0')) {
				// Found a potential block
				int blockSize = data[offset + 4] | (data[offset + 5] << 8) | (data[offset + 6] << 16) | (data[offset + 7] << 24);
				if (blockSize > 0 && blockSize < data.Length - offset) {
					blocks.Add(new SaveBlock(marker.TrimEnd('\0'), offset, blockSize));
					offset += 8 + blockSize;
					continue;
				}
			}

			offset++;
		}

		return new SaveFileInfo(SaveFormat.Snes9x, data.Length, "SNES9x", version, SystemType.Snes, blocks);
	}

	private static SaveFileInfo ParseZsnesState(byte[] data) {
		string version = "";
		if (data.Length > 9) {
			version = $"{data[5]}.{data[6]}{data[7]}";
		}

		return new SaveFileInfo(SaveFormat.Zsnes, data.Length, "ZSNES", version, SystemType.Snes, []);
	}

	private static SaveFileInfo ParseBsnesState(byte[] data) {
		return new SaveFileInfo(SaveFormat.Bsnes, data.Length, "bsnes/higan", null, SystemType.Snes, []);
	}

	private static SaveFileInfo ParseNestopiaState(byte[] data) {
		return new SaveFileInfo(SaveFormat.Nestopia, data.Length, "Nestopia", null, SystemType.Nes, []);
	}

	private static SaveFileInfo ParseFceuxState(byte[] data) {
		return new SaveFileInfo(SaveFormat.Fceux, data.Length, "FCEUX", null, SystemType.Nes, []);
	}

	private static SaveFileInfo ParseVbaState(byte[] data) {
		string version = "";
		if (data.Length > 8) {
			version = Encoding.ASCII.GetString(data, 4, 4).TrimEnd('\0');
		}

		return new SaveFileInfo(SaveFormat.Vba, data.Length, "VisualBoyAdvance", version, SystemType.GameBoyAdvance, []);
	}

	private static SaveFileInfo GetCompressedInfo(byte[] data) {
		try {
			var decompressed = DecompressSaveState(data);
			var innerInfo = GetSaveInfo(decompressed);
			return new SaveFileInfo(
				SaveFormat.GzipCompressed,
				data.Length,
				$"Compressed ({innerInfo.Emulator})",
				innerInfo.Version,
				innerInfo.System,
				innerInfo.Blocks
			);
		} catch {
			return new SaveFileInfo(SaveFormat.GzipCompressed, data.Length, "Compressed", null, null, []);
		}
	}

	private static SaveFileInfo ParseSramFile(byte[] data) {
		// Try to identify SRAM by size and content patterns
		SystemType? system = data.Length switch {
			0x2000 => SystemType.Nes, // 8KB NES SRAM
			0x8000 => HasGameBoySramPattern(data) ? SystemType.GameBoy : SystemType.Snes, // 32KB - GB or SNES
			0x10000 => HasGameBoySramPattern(data) ? SystemType.GameBoyColor : SystemType.Snes, // 64KB - GBC or SNES
			0x20000 => SystemType.Snes, // 128KB SNES SRAM
			_ => null
		};

		return new SaveFileInfo(SaveFormat.Sram, data.Length, null, null, system, []);
	}

	private static bool HasGameBoySramPattern(byte[] data) {
		// Game Boy SRAMs often have specific patterns
		// This is a heuristic check
		if (data.Length < 16)
			return false;

		// Check for common zero padding at the end
		int zeroCount = 0;
		for (int i = data.Length - 1; i >= data.Length - 16 && data[i] == 0; i--) {
			zeroCount++;
		}

		return zeroCount < 16; // Game Boy saves usually don't end with all zeros
	}

	private static byte[]? ExtractSnes9xSram(byte[] data) {
		// Look for SRA block in SNES9x state
		int offset = 64;
		while (offset < data.Length - 8) {
			var marker = Encoding.ASCII.GetString(data, offset, 3);
			if (marker == "SRA") {
				int size = data[offset + 4] | (data[offset + 5] << 8) | (data[offset + 6] << 16) | (data[offset + 7] << 24);
				if (size > 0 && offset + 8 + size <= data.Length) {
					var sram = new byte[size];
					Array.Copy(data, offset + 8, sram, 0, size);
					return sram;
				}
			}

			offset++;
		}

		return null;
	}

	private static byte[]? ExtractZsnesSram(byte[] data) {
		// ZSNES stores SRAM at a fixed offset
		const int sramOffset = 0x618;
		const int maxSramSize = 0x20000;

		if (data.Length < sramOffset)
			return null;

		int sramSize = Math.Min(maxSramSize, data.Length - sramOffset);
		var sram = new byte[sramSize];
		Array.Copy(data, sramOffset, sram, 0, sramSize);
		return sram;
	}

	private static byte[]? ExtractBsnesSram(byte[] data) {
		// bsnes uses a different format, would need proper parsing
		return null;
	}

	private static byte[]? ExtractFceuxSram(byte[] data) {
		// Look for SRAM section
		int offset = 16;
		while (offset < data.Length - 8) {
			var marker = Encoding.ASCII.GetString(data, offset, 4);
			if (marker == "SRAM") {
				int size = data[offset + 4] | (data[offset + 5] << 8) | (data[offset + 6] << 16) | (data[offset + 7] << 24);
				if (size > 0 && offset + 8 + size <= data.Length) {
					var sram = new byte[size];
					Array.Copy(data, offset + 8, sram, 0, size);
					return sram;
				}
			}

			offset++;
		}

		return null;
	}

	private static byte[]? ExtractFromCompressed(byte[] data) {
		try {
			var decompressed = DecompressSaveState(data);
			return ExtractSram(decompressed);
		} catch {
			return null;
		}
	}

	#endregion
}

#region Enums and Records

/// <summary>
/// Save file format types.
/// </summary>
public enum SaveFormat {
	Unknown,
	Sram,
	Snes9x,
	Zsnes,
	Bsnes,
	Nestopia,
	Fceux,
	Vba,
	Mgba,
	RetroArch,
	GzipCompressed
}

/// <summary>
/// SRAM value types for reading/writing.
/// </summary>
public enum SramValueType {
	Byte,
	Word,
	WordBE,
	DWord,
	DWordBE
}

/// <summary>
/// SRAM checksum algorithms.
/// </summary>
public enum SramChecksumType {
	SimpleSum,
	Xor,
	Complement,
	DragonQuest,
	FinalFantasy,
	Zelda
}

/// <summary>
/// Information about a save file.
/// </summary>
public record SaveFileInfo(
	SaveFormat Format,
	int Size,
	string? Emulator,
	string? Version,
	SystemType? System,
	List<SaveBlock> Blocks
);

/// <summary>
/// A block within a save state file.
/// </summary>
public record SaveBlock(
	string Name,
	int Offset,
	int Size
);

/// <summary>
/// A change detected in SRAM.
/// </summary>
public record SramChange(
	int Offset,
	int OldValue,
	int NewValue,
	SramValueType ValueType
);

/// <summary>
/// Result of comparing two save files.
/// </summary>
public record SaveComparison(
	int Size1,
	int Size2,
	List<SaveDifference> Differences,
	double Similarity
);

/// <summary>
/// A difference block between two save files.
/// </summary>
public record SaveDifference(
	int Offset,
	int Length,
	byte[] Data1,
	byte[] Data2
);

#endregion
