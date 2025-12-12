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

	#region Game Boy Address Conversion

	/// <summary>
	/// Convert Game Boy ROM address to file offset.
	/// </summary>
	public static int GameBoyToFile(int gbAddress, int currentBank = 1) {
		const int bankSize = 0x4000; // 16KB banks

		// Bank 0 ($0000-$3FFF) is always mapped
		if (gbAddress < 0x4000) {
			return gbAddress;
		}

		// Bank 1-N ($4000-$7FFF) is switchable
		if (gbAddress >= 0x4000 && gbAddress < 0x8000) {
			return (currentBank * bankSize) + (gbAddress - 0x4000);
		}

		throw new ArgumentException($"Invalid Game Boy ROM address: ${gbAddress:x4}", nameof(gbAddress));
	}

	/// <summary>
	/// Convert file offset to Game Boy ROM address.
	/// </summary>
	public static (int GbAddress, int Bank) GameBoyFileToAddress(int fileOffset) {
		const int bankSize = 0x4000;

		// Bank 0
		if (fileOffset < bankSize) {
			return (fileOffset, 0);
		}

		// Banked area
		var bank = fileOffset / bankSize;
		var bankOffset = fileOffset % bankSize;

		return (0x4000 + bankOffset, bank);
	}

	/// <summary>
	/// Get the ROM bank for a given file offset in Game Boy.
	/// </summary>
	public static int GameBoyGetBank(int fileOffset) {
		return fileOffset / 0x4000;
	}

	/// <summary>
	/// Calculate total number of banks in a Game Boy ROM.
	/// </summary>
	public static int GameBoyBankCount(int romSize) {
		return romSize / 0x4000;
	}

	/// <summary>
	/// Get MBC type name from cartridge type byte.
	/// </summary>
	public static string GameBoyMbcType(byte cartridgeType) {
		return cartridgeType switch {
			0x00 => "ROM Only",
			0x01 => "MBC1",
			0x02 => "MBC1+RAM",
			0x03 => "MBC1+RAM+Battery",
			0x05 => "MBC2",
			0x06 => "MBC2+Battery",
			0x08 => "ROM+RAM",
			0x09 => "ROM+RAM+Battery",
			0x0B => "MMM01",
			0x0C => "MMM01+RAM",
			0x0D => "MMM01+RAM+Battery",
			0x0F => "MBC3+Timer+Battery",
			0x10 => "MBC3+Timer+RAM+Battery",
			0x11 => "MBC3",
			0x12 => "MBC3+RAM",
			0x13 => "MBC3+RAM+Battery",
			0x19 => "MBC5",
			0x1A => "MBC5+RAM",
			0x1B => "MBC5+RAM+Battery",
			0x1C => "MBC5+Rumble",
			0x1D => "MBC5+Rumble+RAM",
			0x1E => "MBC5+Rumble+RAM+Battery",
			0x20 => "MBC6",
			0x22 => "MBC7+Sensor+Rumble+RAM+Battery",
			0xFC => "Pocket Camera",
			0xFD => "Bandai TAMA5",
			0xFE => "HuC3",
			0xFF => "HuC1+RAM+Battery",
			_ => $"Unknown (${cartridgeType:x2})"
		};
	}

	#endregion

	#region Game Boy Advance Address Conversion

	/// <summary>
	/// GBA memory regions.
	/// </summary>
	public enum GbaMemoryRegion {
		Bios,       // 0x00000000-0x00003FFF
		Ewram,      // 0x02000000-0x0203FFFF
		Iwram,      // 0x03000000-0x03007FFF
		IoRegs,     // 0x04000000-0x040003FE
		Palette,    // 0x05000000-0x050003FF
		Vram,       // 0x06000000-0x06017FFF
		Oam,        // 0x07000000-0x070003FF
		Rom,        // 0x08000000-0x09FFFFFF (and mirrors)
		Sram,       // 0x0E000000-0x0E00FFFF
		Unknown
	}

	/// <summary>
	/// Get the memory region for a GBA address.
	/// </summary>
	public static GbaMemoryRegion GbaGetRegion(uint address) {
		var region = (address >> 24) & 0xFF;

		return region switch {
			0x00 => GbaMemoryRegion.Bios,
			0x02 => GbaMemoryRegion.Ewram,
			0x03 => GbaMemoryRegion.Iwram,
			0x04 => GbaMemoryRegion.IoRegs,
			0x05 => GbaMemoryRegion.Palette,
			0x06 => GbaMemoryRegion.Vram,
			0x07 => GbaMemoryRegion.Oam,
			0x08 or 0x09 or 0x0A or 0x0B or 0x0C or 0x0D => GbaMemoryRegion.Rom,
			0x0E or 0x0F => GbaMemoryRegion.Sram,
			_ => GbaMemoryRegion.Unknown
		};
	}

	/// <summary>
	/// Convert GBA ROM address to file offset.
	/// </summary>
	public static int GbaRomToFile(uint gbaAddress) {
		var region = GbaGetRegion(gbaAddress);

		if (region != GbaMemoryRegion.Rom) {
			throw new ArgumentException($"Address ${gbaAddress:x8} is not in ROM region", nameof(gbaAddress));
		}

		// ROM starts at 0x08000000, mirrors at 0x0A, 0x0C
		return (int)(gbaAddress & 0x01FFFFFF);
	}

	/// <summary>
	/// Convert file offset to GBA ROM address.
	/// </summary>
	public static uint GbaFileToRom(int fileOffset) {
		return 0x08000000u + (uint)fileOffset;
	}

	/// <summary>
	/// Convert GBA EWRAM address to offset within EWRAM.
	/// </summary>
	public static int GbaEwramToOffset(uint address) {
		if (GbaGetRegion(address) != GbaMemoryRegion.Ewram) {
			throw new ArgumentException($"Address ${address:x8} is not in EWRAM", nameof(address));
		}

		return (int)(address & 0x3FFFF);
	}

	/// <summary>
	/// Convert GBA IWRAM address to offset within IWRAM.
	/// </summary>
	public static int GbaIwramToOffset(uint address) {
		if (GbaGetRegion(address) != GbaMemoryRegion.Iwram) {
			throw new ArgumentException($"Address ${address:x8} is not in IWRAM", nameof(address));
		}

		return (int)(address & 0x7FFF);
	}

	/// <summary>
	/// Convert GBA VRAM address to offset within VRAM.
	/// </summary>
	public static int GbaVramToOffset(uint address) {
		if (GbaGetRegion(address) != GbaMemoryRegion.Vram) {
			throw new ArgumentException($"Address ${address:x8} is not in VRAM", nameof(address));
		}

		return (int)(address & 0x1FFFF);
	}

	/// <summary>
	/// Get the size of a GBA memory region.
	/// </summary>
	public static int GbaRegionSize(GbaMemoryRegion region) {
		return region switch {
			GbaMemoryRegion.Bios => 0x4000,       // 16KB
			GbaMemoryRegion.Ewram => 0x40000,     // 256KB
			GbaMemoryRegion.Iwram => 0x8000,      // 32KB
			GbaMemoryRegion.IoRegs => 0x400,      // 1KB
			GbaMemoryRegion.Palette => 0x400,     // 1KB
			GbaMemoryRegion.Vram => 0x18000,      // 96KB
			GbaMemoryRegion.Oam => 0x400,         // 1KB
			GbaMemoryRegion.Rom => 0x2000000,     // 32MB max
			GbaMemoryRegion.Sram => 0x10000,      // 64KB
			_ => 0
		};
	}

	/// <summary>
	/// Get the base address of a GBA memory region.
	/// </summary>
	public static uint GbaRegionBase(GbaMemoryRegion region) {
		return region switch {
			GbaMemoryRegion.Bios => 0x00000000,
			GbaMemoryRegion.Ewram => 0x02000000,
			GbaMemoryRegion.Iwram => 0x03000000,
			GbaMemoryRegion.IoRegs => 0x04000000,
			GbaMemoryRegion.Palette => 0x05000000,
			GbaMemoryRegion.Vram => 0x06000000,
			GbaMemoryRegion.Oam => 0x07000000,
			GbaMemoryRegion.Rom => 0x08000000,
			GbaMemoryRegion.Sram => 0x0E000000,
			_ => 0
		};
	}

	/// <summary>
	/// Format GBA address with region prefix.
	/// </summary>
	public static string GbaFormatAddress(uint address) {
		var region = GbaGetRegion(address);
		var regionName = region switch {
			GbaMemoryRegion.Bios => "BIOS",
			GbaMemoryRegion.Ewram => "EWRAM",
			GbaMemoryRegion.Iwram => "IWRAM",
			GbaMemoryRegion.IoRegs => "IO",
			GbaMemoryRegion.Palette => "PAL",
			GbaMemoryRegion.Vram => "VRAM",
			GbaMemoryRegion.Oam => "OAM",
			GbaMemoryRegion.Rom => "ROM",
			GbaMemoryRegion.Sram => "SRAM",
			_ => "???"
		};

		return $"{regionName}:${address:x8}";
	}

	#endregion

	#region Generic Conversion

	/// <summary>
	/// Result of address conversion.
	/// </summary>
	public record AddressConversionResult(
		int FileOffset,
		int CpuAddress,
		int Bank,
		string FormattedAddress,
		SystemType System
	);

	/// <summary>
	/// Convert address for any supported system.
	/// </summary>
	public static AddressConversionResult ConvertAddress(
		int address,
		SystemType system,
		bool isFileOffset,
		int? bank = null,
		bool isHiRom = false
	) {
		return system switch {
			SystemType.Nes => ConvertNesAddress(address, isFileOffset, bank ?? 0),
			SystemType.Snes => ConvertSnesAddress(address, isFileOffset, isHiRom),
			SystemType.GameBoy or SystemType.GameBoyColor => ConvertGameBoyAddress(address, isFileOffset, bank ?? 1),
			SystemType.GameBoyAdvance => ConvertGbaAddress((uint)address, isFileOffset),
			_ => throw new ArgumentException($"Unsupported system: {system}")
		};
	}

	private static AddressConversionResult ConvertNesAddress(int address, bool isFileOffset, int bank) {
		if (isFileOffset) {
			var (cpu, b) = NesFileToCpu(address);
			return new AddressConversionResult(address, cpu, b, ToHex(cpu, 4), SystemType.Nes);
		} else {
			var file = NesCpuToFile(address, 32, bank); // Assume 32 banks max
			return new AddressConversionResult(file, address, bank, ToHex(address, 4), SystemType.Nes);
		}
	}

	private static AddressConversionResult ConvertSnesAddress(int address, bool isFileOffset, bool isHiRom) {
		if (isFileOffset) {
			var cpu = isHiRom ? SnesFileToHiRom(address) : SnesFileToLoRom(address);
			var bank = (cpu >> 16) & 0xFF;
			return new AddressConversionResult(address, cpu, bank, ToHex(cpu, 6), SystemType.Snes);
		} else {
			var file = isHiRom ? SnesHiRomToFile(address) : SnesLoRomToFile(address);
			var bank = (address >> 16) & 0xFF;
			return new AddressConversionResult(file, address, bank, ToHex(address, 6), SystemType.Snes);
		}
	}

	private static AddressConversionResult ConvertGameBoyAddress(int address, bool isFileOffset, int bank) {
		if (isFileOffset) {
			var (gb, b) = GameBoyFileToAddress(address);
			return new AddressConversionResult(address, gb, b, ToHex(gb, 4), SystemType.GameBoy);
		} else {
			var file = GameBoyToFile(address, bank);
			return new AddressConversionResult(file, address, bank, ToHex(address, 4), SystemType.GameBoy);
		}
	}

	private static AddressConversionResult ConvertGbaAddress(uint address, bool isFileOffset) {
		if (isFileOffset) {
			var gba = GbaFileToRom((int)address);
			return new AddressConversionResult((int)address, (int)gba, 0, $"${gba:x8}", SystemType.GameBoyAdvance);
		} else {
			var file = GbaRomToFile(address);
			return new AddressConversionResult(file, (int)address, 0, $"${address:x8}", SystemType.GameBoyAdvance);
		}
	}

	#endregion
}
