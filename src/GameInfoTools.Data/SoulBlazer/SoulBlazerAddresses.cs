namespace GameInfoTools.Data.SoulBlazer;

/// <summary>
/// Address conversion utilities for Soul Blazer (SNES LoROM).
/// </summary>
public static class SoulBlazerAddresses {
	/// <summary>
	/// Convert LoROM CPU address to file offset.
	/// </summary>
	/// <remarks>
	/// Soul Blazer uses LoROM mapping:
	/// - Banks $00-$3F: ROM at $8000-$FFFF, mirrors at $0000-$7FFF (registers/RAM)
	/// - Banks $80-$BF: Same as $00-$3F (mirror)
	/// - Each bank is 32KB of ROM ($8000 bytes)
	/// </remarks>
	public static int SnesAddressToFileOffset(int snesAddress) {
		int bank = (snesAddress >> 16) & 0xFF;
		int address = snesAddress & 0xFFFF;

		// Handle mirrored banks
		if (bank >= 0x80) {
			bank -= 0x80;
		}

		// LoROM: ROM starts at $8000 in each bank
		if (address < 0x8000) {
			// Low addresses map to same bank's high addresses for ROM
			address += 0x8000;
		}

		return bank * 0x8000 + (address - 0x8000);
	}

	/// <summary>
	/// Convert file offset to LoROM CPU address.
	/// </summary>
	public static int FileOffsetToSnesAddress(int fileOffset) {
		int bank = fileOffset / 0x8000;
		int address = 0x8000 + (fileOffset % 0x8000);
		return (bank << 16) | address;
	}

	/// <summary>
	/// Format an address for display.
	/// </summary>
	public static string FormatAddress(int fileOffset) {
		int snesAddr = FileOffsetToSnesAddress(fileOffset);
		return $"${snesAddr >> 16:X2}:{snesAddr & 0xFFFF:X4} (0x{fileOffset:x6})";
	}

	/// <summary>
	/// Read a 24-bit LoROM pointer (little-endian).
	/// </summary>
	public static int ReadPointer24(ReadOnlySpan<byte> data, int offset) {
		return data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16);
	}

	/// <summary>
	/// Read a 16-bit pointer and combine with bank.
	/// </summary>
	public static int ReadPointer16(ReadOnlySpan<byte> data, int offset, int bank) {
		return (bank << 16) | (data[offset] | (data[offset + 1] << 8));
	}

	/// <summary>
	/// Write a 24-bit pointer (little-endian).
	/// </summary>
	public static void WritePointer24(Span<byte> data, int offset, int pointer) {
		data[offset] = (byte)(pointer & 0xFF);
		data[offset + 1] = (byte)((pointer >> 8) & 0xFF);
		data[offset + 2] = (byte)((pointer >> 16) & 0xFF);
	}

	/// <summary>
	/// Write a 16-bit pointer (little-endian).
	/// </summary>
	public static void WritePointer16(Span<byte> data, int offset, int pointer) {
		data[offset] = (byte)(pointer & 0xFF);
		data[offset + 1] = (byte)((pointer >> 8) & 0xFF);
	}
}

/// <summary>
/// Known ROM regions for Soul Blazer.
/// </summary>
public static class SoulBlazerRegions {
	// Header and vectors
	public const int HeaderOffset = 0x7FC0;
	public const int ChecksumOffset = 0x7FDE;
	public const int ChecksumComplementOffset = 0x7FDC;
	public const int ResetVectorOffset = 0x7FFC;
	public const int NmiVectorOffset = 0x7FEA;
	public const int IrqVectorOffset = 0x7FEE;

	// Data tables (offsets need verification with actual ROM analysis)
	public const int EnemyTableOffset = 0x030000;
	public const int ItemTableOffset = 0x038000;
	public const int SoulLairTableOffset = 0x040000;
	public const int MapTableOffset = 0x048000;
	public const int TextTableOffset = 0x050000;
	public const int GraphicsOffset = 0x080000;

	// ROM info
	public const int RomSize = 0x100000; // 1MB
	public const int HeaderSize = 0x200;  // Optional 512-byte copier header
}

/// <summary>
/// Data table constants for Soul Blazer.
/// </summary>
public static class SoulBlazerData {
	// Enemy data
	public const int EnemyEntrySize = 16;
	public const int EnemyCount = 100; // Approximate, needs verification

	// Item data
	public const int ItemEntrySize = 8;
	public const int ItemCount = 50; // Approximate, needs verification

	// Soul lair data
	public const int SoulLairEntrySize = 12;
	public const int SoulLairCount = 200; // Approximate, needs verification

	// Map data
	public const int MapWidth = 32;
	public const int MapHeight = 32;
	public const int TileSize = 16;

	/// <summary>
	/// Calculate file offset for LoROM address.
	/// </summary>
	public static int ToFileOffset(int bank, int address, bool hasHeader = false) {
		int headerOffset = hasHeader ? SoulBlazerRegions.HeaderSize : 0;
		return headerOffset + (bank * 0x8000) + (address - 0x8000);
	}
}
