namespace GameInfoTools.Data.SecretOfMana;

/// <summary>
/// Address conversion utilities for Secret of Mana (SNES HiROM).
/// </summary>
public static class SecretOfManaAddresses {
	/// <summary>
	/// ROM size in bytes (2 MB).
	/// </summary>
	public const int RomSize = 0x200000;

	/// <summary>
	/// Convert HiROM CPU address to file offset.
	/// </summary>
	/// <remarks>
	/// Secret of Mana uses HiROM mapping:
	/// - Banks $c0-$ff: Direct ROM access ($c0:0000 = ROM $000000)
	/// - Banks $40-$7d: Mirror of ROM (shadow access)
	/// - Bank size is 64KB ($10000 bytes)
	/// </remarks>
	public static int SnesAddressToFileOffset(int snesAddress) {
		int bank = (snesAddress >> 16) & 0xff;
		int address = snesAddress & 0xffff;

		// HiROM direct mapping ($c0-$ff)
		if (bank >= 0xc0) {
			return ((bank - 0xc0) << 16) | address;
		}

		// HiROM mirror mapping ($40-$7d)
		if (bank >= 0x40 && bank <= 0x7d) {
			return ((bank - 0x40) << 16) | address;
		}

		// Banks $00-$3f: Only $8000-$ffff is ROM (first half of ROM)
		if (bank <= 0x3f && address >= 0x8000) {
			return (bank << 15) | (address - 0x8000);
		}

		// Banks $80-$bf: Mirror of $00-$3f
		if (bank >= 0x80 && bank <= 0xbf && address >= 0x8000) {
			return ((bank - 0x80) << 15) | (address - 0x8000);
		}

		throw new ArgumentException($"Invalid HiROM address: ${snesAddress:x6}");
	}

	/// <summary>
	/// Convert file offset to HiROM CPU address.
	/// </summary>
	public static int FileOffsetToSnesAddress(int fileOffset) {
		if (fileOffset < 0 || fileOffset >= RomSize) {
			throw new ArgumentOutOfRangeException(nameof(fileOffset),
				$"File offset 0x{fileOffset:x6} out of range");
		}

		// Return the standard HiROM address ($c0-$ff banks)
		int bank = 0xc0 + (fileOffset >> 16);
		int address = fileOffset & 0xffff;
		return (bank << 16) | address;
	}

	/// <summary>
	/// Format an address for display.
	/// </summary>
	public static string FormatAddress(int fileOffset) {
		int snesAddr = FileOffsetToSnesAddress(fileOffset);
		return $"${snesAddr >> 16:x2}:{snesAddr & 0xffff:x4} (0x{fileOffset:x6})";
	}

	/// <summary>
	/// Format a CPU address as string.
	/// </summary>
	public static string FormatCpuAddress(int snesAddress) {
		return $"${snesAddress >> 16:x2}:{snesAddress & 0xffff:x4}";
	}

	/// <summary>
	/// Read a 24-bit HiROM pointer (little-endian).
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
		data[offset] = (byte)(pointer & 0xff);
		data[offset + 1] = (byte)((pointer >> 8) & 0xff);
		data[offset + 2] = (byte)((pointer >> 16) & 0xff);
	}

	/// <summary>
	/// Write a 16-bit pointer (little-endian).
	/// </summary>
	public static void WritePointer16(Span<byte> data, int offset, int pointer) {
		data[offset] = (byte)(pointer & 0xff);
		data[offset + 1] = (byte)((pointer >> 8) & 0xff);
	}

	/// <summary>
	/// Read a 16-bit little-endian value.
	/// </summary>
	public static ushort ReadWord(ReadOnlySpan<byte> data, int offset) {
		return (ushort)(data[offset] | (data[offset + 1] << 8));
	}

	/// <summary>
	/// Write a 16-bit little-endian value.
	/// </summary>
	public static void WriteWord(Span<byte> data, int offset, ushort value) {
		data[offset] = (byte)(value & 0xff);
		data[offset + 1] = (byte)((value >> 8) & 0xff);
	}
}
