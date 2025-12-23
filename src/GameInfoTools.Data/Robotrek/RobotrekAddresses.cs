namespace GameInfoTools.Data.Robotrek;

/// <summary>
/// ROM address utilities for Robotrek.
/// Uses HiROM mapping ($C0-$FF banks).
/// </summary>
public static class RobotrekAddresses {
	/// <summary>
	/// Convert LoROM SNES address to file offset.
	/// </summary>
	public static int SnesAddressToFileOffset(int snesAddress) {
		int bank = (snesAddress >> 16) & 0xFF;
		int offset = snesAddress & 0xFFFF;

		// HiROM: $C0-$FF banks
		if (bank >= 0xC0) {
			return ((bank - 0xC0) * 0x10000) + offset;
		}

		// Mirror: $00-$3F banks, high area ($8000-$FFFF)
		if (bank < 0x40 && offset >= 0x8000) {
			return (bank * 0x8000) + (offset - 0x8000);
		}

		throw new ArgumentException($"Invalid SNES address: ${snesAddress:X6}");
	}

	/// <summary>
	/// Convert file offset to HiROM SNES address.
	/// </summary>
	public static int FileOffsetToSnesAddress(int fileOffset) {
		int bank = fileOffset / 0x10000;
		int offset = fileOffset % 0x10000;
		return ((bank + 0xC0) << 16) | offset;
	}

	/// <summary>
	/// Format an address for display.
	/// </summary>
	public static string FormatAddress(int fileOffset) {
		int snesAddr = FileOffsetToSnesAddress(fileOffset);
		return $"${snesAddr:X6} (File: 0x{fileOffset:X6})";
	}

	/// <summary>
	/// Read a 24-bit pointer from ROM.
	/// </summary>
	public static int ReadPointer24(ReadOnlySpan<byte> rom, int offset) {
		return rom[offset] | (rom[offset + 1] << 8) | (rom[offset + 2] << 16);
	}

	/// <summary>
	/// Read a 16-bit pointer from ROM.
	/// </summary>
	public static int ReadPointer16(ReadOnlySpan<byte> rom, int offset, byte bank = 0xC0) {
		int ptr = rom[offset] | (rom[offset + 1] << 8);
		return (bank << 16) | ptr;
	}

	/// <summary>
	/// Write a 24-bit pointer to ROM.
	/// </summary>
	public static void WritePointer24(Span<byte> rom, int offset, int address) {
		rom[offset] = (byte)(address & 0xFF);
		rom[offset + 1] = (byte)((address >> 8) & 0xFF);
		rom[offset + 2] = (byte)((address >> 16) & 0xFF);
	}

	/// <summary>
	/// Write a 16-bit pointer to ROM.
	/// </summary>
	public static void WritePointer16(Span<byte> rom, int offset, int address) {
		rom[offset] = (byte)(address & 0xFF);
		rom[offset + 1] = (byte)((address >> 8) & 0xFF);
	}
}

/// <summary>
/// Known data region addresses for Robotrek.
/// </summary>
public static class RobotrekRegions {
	// Header and identification
	public const int HeaderOffset = 0x007FC0;
	public const int InternalNameOffset = 0x007FC0;
	public const int MapperOffset = 0x007FD5;
	public const int RomSizeOffset = 0x007FD7;
	public const int SramSizeOffset = 0x007FD8;
	public const int ChecksumOffset = 0x007FDC;
	public const int ComplementOffset = 0x007FDE;

	// Vectors
	public const int ResetVectorOffset = 0x007FFC;
	public const int NmiVectorOffset = 0x007FFA;
	public const int IrqVectorOffset = 0x007FFE;

	// Game data tables (approximate, need verification)
	public const int ItemTableOffset = 0x100000;          // Bank $D0
	public const int ItemTableBank = 0xD0;
	public const int ItemCount = 256;
	public const int ItemRecordSize = 16;

	public const int EnemyTableOffset = 0x110000;         // Bank $D1
	public const int EnemyTableBank = 0xD1;
	public const int EnemyCount = 256;
	public const int EnemyRecordSize = 32;

	public const int InventionTableOffset = 0x120000;     // Bank $D2
	public const int InventionTableBank = 0xD2;
	public const int InventionCount = 64;
	public const int InventionRecordSize = 8;

	// Graphics data (approximate, need verification)
	public const int SpriteDataOffset = 0x000000;         // Bank $C0-$C7
	public const int SpriteDataEnd = 0x080000;
	public const int TilesetDataOffset = 0x080000;        // Bank $C8-$CF
	public const int TilesetDataEnd = 0x100000;

	// Text data (approximate, need verification)
	public const int TextPointerTableOffset = 0x1A0000;   // Bank $E0
	public const int TextDataOffset = 0x1A8000;
	public const int TextDataEnd = 0x180000;

	// Script and event data (approximate)
	public const int ScriptDataOffset = 0x180000;
	public const int EventDataOffset = 0x188000;

	// Map data (approximate)
	public const int MapPointerTableOffset = 0x140000;
	public const int MapTilesetTableOffset = 0x148000;
	public const int MapEventTableOffset = 0x150000;

	// Music and SFX (approximate)
	public const int MusicDataOffset = 0x1C0000;
	public const int SfxDataOffset = 0x1D0000;
}
