namespace GameInfoTools.Core.SaveData;

/// <summary>
/// Represents a save file with its metadata
/// </summary>
public class SaveFile {
	/// <summary>
	/// Raw save data bytes
	/// </summary>
	public byte[] Data { get; private set; }

	/// <summary>
	/// File path (if loaded from disk)
	/// </summary>
	public string? FilePath { get; set; }

	/// <summary>
	/// Save format type
	/// </summary>
	public SaveFormat Format { get; set; } = SaveFormat.Raw;

	/// <summary>
	/// Platform this save is from
	/// </summary>
	public SavePlatform Platform { get; set; } = SavePlatform.Unknown;

	/// <summary>
	/// Number of save slots detected
	/// </summary>
	public int SlotCount { get; set; } = 1;

	/// <summary>
	/// Size of each save slot
	/// </summary>
	public int SlotSize { get; set; }

	/// <summary>
	/// Checksum algorithm used (if any)
	/// </summary>
	public ChecksumType ChecksumType { get; set; } = ChecksumType.None;

	/// <summary>
	/// Whether the save has been modified
	/// </summary>
	public bool IsModified { get; private set; }

	public SaveFile(byte[] data) {
		Data = data ?? throw new ArgumentNullException(nameof(data));
		SlotSize = data.Length;
	}

	/// <summary>
	/// Read a byte at offset
	/// </summary>
	public byte ReadByte(int offset) {
		ValidateOffset(offset, 1);
		return Data[offset];
	}

	/// <summary>
	/// Write a byte at offset
	/// </summary>
	public void WriteByte(int offset, byte value) {
		ValidateOffset(offset, 1);
		Data[offset] = value;
		IsModified = true;
	}

	/// <summary>
	/// Read a 16-bit value (little-endian)
	/// </summary>
	public ushort ReadUInt16(int offset) {
		ValidateOffset(offset, 2);
		return (ushort)(Data[offset] | (Data[offset + 1] << 8));
	}

	/// <summary>
	/// Write a 16-bit value (little-endian)
	/// </summary>
	public void WriteUInt16(int offset, ushort value) {
		ValidateOffset(offset, 2);
		Data[offset] = (byte)(value & 0xFF);
		Data[offset + 1] = (byte)((value >> 8) & 0xFF);
		IsModified = true;
	}

	/// <summary>
	/// Read a 16-bit value (big-endian)
	/// </summary>
	public ushort ReadUInt16BE(int offset) {
		ValidateOffset(offset, 2);
		return (ushort)((Data[offset] << 8) | Data[offset + 1]);
	}

	/// <summary>
	/// Write a 16-bit value (big-endian)
	/// </summary>
	public void WriteUInt16BE(int offset, ushort value) {
		ValidateOffset(offset, 2);
		Data[offset] = (byte)((value >> 8) & 0xFF);
		Data[offset + 1] = (byte)(value & 0xFF);
		IsModified = true;
	}

	/// <summary>
	/// Read a 32-bit value (little-endian)
	/// </summary>
	public uint ReadUInt32(int offset) {
		ValidateOffset(offset, 4);
		return (uint)(Data[offset] | (Data[offset + 1] << 8) |
					  (Data[offset + 2] << 16) | (Data[offset + 3] << 24));
	}

	/// <summary>
	/// Write a 32-bit value (little-endian)
	/// </summary>
	public void WriteUInt32(int offset, uint value) {
		ValidateOffset(offset, 4);
		Data[offset] = (byte)(value & 0xFF);
		Data[offset + 1] = (byte)((value >> 8) & 0xFF);
		Data[offset + 2] = (byte)((value >> 16) & 0xFF);
		Data[offset + 3] = (byte)((value >> 24) & 0xFF);
		IsModified = true;
	}

	/// <summary>
	/// Read a range of bytes
	/// </summary>
	public byte[] ReadBytes(int offset, int length) {
		ValidateOffset(offset, length);
		var result = new byte[length];
		Array.Copy(Data, offset, result, 0, length);
		return result;
	}

	/// <summary>
	/// Write a range of bytes
	/// </summary>
	public void WriteBytes(int offset, byte[] values) {
		ValidateOffset(offset, values.Length);
		Array.Copy(values, 0, Data, offset, values.Length);
		IsModified = true;
	}

	/// <summary>
	/// Read a string with specified encoding
	/// </summary>
	public string ReadString(int offset, int maxLength, System.Text.Encoding? encoding = null) {
		ValidateOffset(offset, maxLength);
		encoding ??= System.Text.Encoding.ASCII;

		var length = 0;
		for (var i = 0; i < maxLength && Data[offset + i] != 0; i++) {
			length++;
		}

		return encoding.GetString(Data, offset, length);
	}

	/// <summary>
	/// Write a string with padding
	/// </summary>
	public void WriteString(int offset, string value, int fixedLength, byte padByte = 0, System.Text.Encoding? encoding = null) {
		ValidateOffset(offset, fixedLength);
		encoding ??= System.Text.Encoding.ASCII;

		var bytes = encoding.GetBytes(value);
		var copyLength = Math.Min(bytes.Length, fixedLength);
		Array.Copy(bytes, 0, Data, offset, copyLength);

		// Pad remaining space
		for (var i = copyLength; i < fixedLength; i++) {
			Data[offset + i] = padByte;
		}

		IsModified = true;
	}

	/// <summary>
	/// Get data for a specific save slot
	/// </summary>
	public byte[] GetSlotData(int slotIndex) {
		if (slotIndex < 0 || slotIndex >= SlotCount) {
			throw new ArgumentOutOfRangeException(nameof(slotIndex));
		}

		var slotOffset = slotIndex * SlotSize;
		return ReadBytes(slotOffset, SlotSize);
	}

	/// <summary>
	/// Copy one slot to another
	/// </summary>
	public void CopySlot(int sourceSlot, int destSlot) {
		var slotData = GetSlotData(sourceSlot);
		var destOffset = destSlot * SlotSize;
		WriteBytes(destOffset, slotData);
	}

	/// <summary>
	/// Clear a save slot
	/// </summary>
	public void ClearSlot(int slotIndex, byte fillByte = 0) {
		if (slotIndex < 0 || slotIndex >= SlotCount) {
			throw new ArgumentOutOfRangeException(nameof(slotIndex));
		}

		var slotOffset = slotIndex * SlotSize;
		for (var i = 0; i < SlotSize; i++) {
			Data[slotOffset + i] = fillByte;
		}
		IsModified = true;
	}

	/// <summary>
	/// Recalculate checksum if applicable
	/// </summary>
	public void UpdateChecksum() {
		if (ChecksumType == ChecksumType.None) return;

		// Checksum calculation depends on format - override in derived classes
	}

	private void ValidateOffset(int offset, int length) {
		if (offset < 0 || offset + length > Data.Length) {
			throw new ArgumentOutOfRangeException(nameof(offset),
				$"Offset {offset:X} with length {length} is out of bounds (file size: {Data.Length:X})");
		}
	}
}

/// <summary>
/// Save file format types
/// </summary>
public enum SaveFormat {
	Raw,
	Srm,           // SRAM
	Sav,           // Generic save
	Eep,           // EEPROM
	Fla,           // Flash
	State,         // Save state
	Compressed,    // Compressed save
	EmulatorState  // Full emulator state
}

/// <summary>
/// Platform identifiers for saves
/// </summary>
public enum SavePlatform {
	Unknown,
	Nes,
	Snes,
	Genesis,
	GameBoy,
	GameBoyColor,
	Gba,
	N64,
	Psx
}

/// <summary>
/// Checksum algorithms used in save files
/// </summary>
public enum ChecksumType {
	None,
	Sum8,          // Simple 8-bit sum
	Sum16,         // 16-bit sum
	Xor8,          // XOR of all bytes
	Crc16,         // CRC-16
	Crc32,         // CRC-32
	Custom         // Game-specific
}

/// <summary>
/// Manager for editing save files
/// </summary>
public class SaveEditor {
	/// <summary>
	/// Load a save file from disk
	/// </summary>
	public static SaveFile Load(string path) {
		var data = File.ReadAllBytes(path);
		var save = new SaveFile(data) {
			FilePath = path,
			Format = DetectFormat(path),
			Platform = DetectPlatform(data)
		};

		DetectSlots(save);
		return save;
	}

	/// <summary>
	/// Save the save file to disk
	/// </summary>
	public static void Save(SaveFile save, string? path = null) {
		path ??= save.FilePath ?? throw new InvalidOperationException("No file path specified");

		save.UpdateChecksum();
		File.WriteAllBytes(path, save.Data);
	}

	/// <summary>
	/// Create a backup of a save file
	/// </summary>
	public static void CreateBackup(string path) {
		var backupPath = $"{path}.bak.{DateTime.Now:yyyyMMdd_HHmmss}";
		File.Copy(path, backupPath);
	}

	/// <summary>
	/// Calculate simple 8-bit checksum
	/// </summary>
	public static byte CalculateSum8(byte[] data, int start, int length) {
		byte sum = 0;
		for (var i = start; i < start + length; i++) {
			sum += data[i];
		}
		return sum;
	}

	/// <summary>
	/// Calculate simple 16-bit checksum
	/// </summary>
	public static ushort CalculateSum16(byte[] data, int start, int length) {
		ushort sum = 0;
		for (var i = start; i < start + length; i++) {
			sum += data[i];
		}
		return sum;
	}

	/// <summary>
	/// Calculate XOR checksum
	/// </summary>
	public static byte CalculateXor8(byte[] data, int start, int length) {
		byte result = 0;
		for (var i = start; i < start + length; i++) {
			result ^= data[i];
		}
		return result;
	}

	/// <summary>
	/// Verify if checksum matches expected value
	/// </summary>
	public static bool VerifyChecksum(SaveFile save, int checksumOffset, int dataStart, int dataLength) {
		return save.ChecksumType switch {
			ChecksumType.Sum8 => save.ReadByte(checksumOffset) == CalculateSum8(save.Data, dataStart, dataLength),
			ChecksumType.Sum16 => save.ReadUInt16(checksumOffset) == CalculateSum16(save.Data, dataStart, dataLength),
			ChecksumType.Xor8 => save.ReadByte(checksumOffset) == CalculateXor8(save.Data, dataStart, dataLength),
			_ => true
		};
	}

	private static SaveFormat DetectFormat(string path) {
		var ext = Path.GetExtension(path).ToLowerInvariant();
		return ext switch {
			".srm" => SaveFormat.Srm,
			".sav" => SaveFormat.Sav,
			".eep" => SaveFormat.Eep,
			".fla" => SaveFormat.Fla,
			".state" or ".ss0" or ".ss1" => SaveFormat.State,
			_ => SaveFormat.Raw
		};
	}

	private static SavePlatform DetectPlatform(byte[] data) {
		// Try to detect based on file size and content patterns
		return data.Length switch {
			0x2000 => SavePlatform.Nes,       // 8KB battery RAM
			0x8000 => SavePlatform.Snes,      // 32KB SRAM
			0x10000 => SavePlatform.Snes,     // 64KB SRAM
			0x800 => SavePlatform.GameBoy,    // 2KB
			0x2000 when HasGameBoyPattern(data) => SavePlatform.GameBoy, // 8KB
			0x8000 when HasGameBoyPattern(data) => SavePlatform.GameBoyColor, // 32KB
			0x10000 when IsGbaFlash(data) => SavePlatform.Gba,
			_ => SavePlatform.Unknown
		};
	}

	private static bool HasGameBoyPattern(byte[] data) {
		// Game Boy saves often have specific patterns
		// This is a simplified heuristic
		return data.Length >= 4 && data[0] != 0xFF;
	}

	private static bool IsGbaFlash(byte[] data) {
		// GBA flash saves have specific sizes
		return data.Length is 0x10000 or 0x20000;
	}

	private static void DetectSlots(SaveFile save) {
		// Detect save slots based on platform and file size
		switch (save.Platform) {
			case SavePlatform.Nes:
				// NES games typically have 1-3 slots
				if (save.Data.Length >= 0x2000) {
					save.SlotCount = 3;
					save.SlotSize = save.Data.Length / 3;
				}
				break;

			case SavePlatform.Snes:
				// SNES games vary widely
				save.SlotCount = 1;
				save.SlotSize = save.Data.Length;
				break;

			case SavePlatform.GameBoy:
			case SavePlatform.GameBoyColor:
				// GB/GBC often have 1-3 slots
				save.SlotCount = 1;
				save.SlotSize = save.Data.Length;
				break;

			default:
				save.SlotCount = 1;
				save.SlotSize = save.Data.Length;
				break;
		}
	}
}

/// <summary>
/// Field definition for structured save editing
/// </summary>
public record SaveFieldDefinition {
	public required string Name { get; init; }
	public required int Offset { get; init; }
	public required SaveFieldType Type { get; init; }
	public int Length { get; init; } = 1;
	public int MinValue { get; init; } = 0;
	public int MaxValue { get; init; } = int.MaxValue;
	public string? Description { get; init; }
}

/// <summary>
/// Save field data types
/// </summary>
public enum SaveFieldType {
	Byte,
	UInt16,
	UInt16BE,
	UInt32,
	UInt32BE,
	String,
	Bytes,
	BitFlags,
	Bcd      // Binary-coded decimal
}

/// <summary>
/// Helper for reading BCD (binary-coded decimal) values
/// </summary>
public static class BcdHelper {
	/// <summary>
	/// Convert BCD byte to decimal
	/// </summary>
	public static int FromBcd(byte bcd) {
		return ((bcd >> 4) * 10) + (bcd & 0x0F);
	}

	/// <summary>
	/// Convert decimal to BCD byte
	/// </summary>
	public static byte ToBcd(int value) {
		if (value is < 0 or > 99) {
			throw new ArgumentOutOfRangeException(nameof(value), "BCD value must be 0-99");
		}
		return (byte)(((value / 10) << 4) | (value % 10));
	}

	/// <summary>
	/// Read multi-byte BCD value
	/// </summary>
	public static int ReadBcd(byte[] data, int offset, int byteCount) {
		var result = 0;
		var multiplier = 1;
		for (var i = byteCount - 1; i >= 0; i--) {
			result += FromBcd(data[offset + i]) * multiplier;
			multiplier *= 100;
		}
		return result;
	}

	/// <summary>
	/// Write multi-byte BCD value
	/// </summary>
	public static void WriteBcd(byte[] data, int offset, int value, int byteCount) {
		for (var i = byteCount - 1; i >= 0; i--) {
			data[offset + i] = ToBcd(value % 100);
			value /= 100;
		}
	}
}
