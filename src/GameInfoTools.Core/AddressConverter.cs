namespace GameInfoTools.Core;

/// <summary>
/// Address conversion utilities for NES/SNES ROMs.
/// </summary>
public static class AddressConverter {
	/// <summary>
	/// Convert NES CPU address to file offset.
	/// </summary>
	public static int NesCpuToFile(int cpuAddress, int prgBankCount, int currentBank = 0) {
		const int headerSize = 16;
		const int bankSize = 0x4000; // 16KB PRG banks

		if (cpuAddress < 0x8000) {
			throw new ArgumentException("CPU address must be >= $8000 for PRG ROM", nameof(cpuAddress));
		}

		// $8000-$bfff: Switchable bank
		if (cpuAddress < 0xc000) {
			return headerSize + (currentBank * bankSize) + (cpuAddress - 0x8000);
		}

		// $c000-$ffff: Usually fixed to last bank
		var lastBank = prgBankCount - 1;
		return headerSize + (lastBank * bankSize) + (cpuAddress - 0xc000);
	}

	/// <summary>
	/// Convert file offset to NES CPU address.
	/// </summary>
	public static (int CpuAddress, int Bank) NesFileToCpu(int fileOffset, int headerSize = 16) {
		const int bankSize = 0x4000;
		var prgOffset = fileOffset - headerSize;
		var bank = prgOffset / bankSize;
		var bankOffset = prgOffset % bankSize;

		return (0x8000 + bankOffset, bank);
	}

	/// <summary>
	/// Convert SNES LoROM address to file offset.
	/// </summary>
	public static int SnesLoRomToFile(int snesAddress, int headerSize = 0) {
		var bank = (snesAddress >> 16) & 0xff;
		var offset = snesAddress & 0xffff;

		// LoROM: banks $00-$7d map to ROM
		if (bank <= 0x7d && offset >= 0x8000) {
			return headerSize + (bank * 0x8000) + (offset - 0x8000);
		}

		// Banks $80-$ff mirror $00-$7f
		if (bank >= 0x80) {
			bank -= 0x80;
			if (offset >= 0x8000) {
				return headerSize + (bank * 0x8000) + (offset - 0x8000);
			}
		}

		throw new ArgumentException($"Invalid LoROM address: ${snesAddress:x6}", nameof(snesAddress));
	}

	/// <summary>
	/// Convert file offset to SNES LoROM address.
	/// </summary>
	public static int SnesFileToLoRom(int fileOffset, int headerSize = 0) {
		var romOffset = fileOffset - headerSize;
		var bank = romOffset / 0x8000;
		var bankOffset = romOffset % 0x8000;

		return (bank << 16) | (0x8000 + bankOffset);
	}

	/// <summary>
	/// Convert SNES HiROM address to file offset.
	/// </summary>
	public static int SnesHiRomToFile(int snesAddress, int headerSize = 0) {
		var bank = (snesAddress >> 16) & 0xff;
		var offset = snesAddress & 0xffff;

		// HiROM: banks $c0-$ff map directly
		if (bank >= 0xc0) {
			return headerSize + ((bank - 0xc0) * 0x10000) + offset;
		}

		// Banks $40-$7d with offset $0000-$ffff
		if (bank >= 0x40 && bank <= 0x7d) {
			return headerSize + ((bank - 0x40) * 0x10000) + offset;
		}

		throw new ArgumentException($"Invalid HiROM address: ${snesAddress:x6}", nameof(snesAddress));
	}

	/// <summary>
	/// Convert file offset to SNES HiROM address.
	/// </summary>
	public static int SnesFileToHiRom(int fileOffset, int headerSize = 0) {
		var romOffset = fileOffset - headerSize;
		var bank = romOffset / 0x10000;
		var bankOffset = romOffset % 0x10000;

		return ((0xc0 + bank) << 16) | bankOffset;
	}

	/// <summary>
	/// Parse a hex string to integer (supports $ and 0x prefixes).
	/// </summary>
	public static int ParseHex(string hex) {
		var trimmed = hex.Trim();

		if (trimmed.StartsWith('$')) {
			trimmed = trimmed[1..];
		} else if (trimmed.StartsWith("0x", StringComparison.OrdinalIgnoreCase)) {
			trimmed = trimmed[2..];
		}

		return int.Parse(trimmed, System.Globalization.NumberStyles.HexNumber);
	}

	/// <summary>
	/// Format integer as lowercase hex with $ prefix.
	/// </summary>
	public static string ToHex(int value, int digits = 4) =>
		$"${value.ToString($"x{digits}")}";
}
