namespace GameInfoTools.Core.Build;

/// <summary>
/// Parser for Game Boy Advance ROMs.
/// Handles header parsing, validation, and bank extraction.
/// </summary>
public class GbaRomParser {
	private readonly byte[] _romData;
	private readonly GbaHeader _header;

	/// <summary>
	/// GBA ROM header offset (starts at address 0).
	/// </summary>
	public const int HeaderOffset = 0x00;

	/// <summary>
	/// GBA ROM header size.
	/// </summary>
	public const int HeaderSize = 0xC0;

	/// <summary>
	/// Nintendo logo expected data (156 bytes at $04-$9F).
	/// </summary>
	private static readonly byte[] NintendoLogo = [
		0x24, 0xff, 0xae, 0x51, 0x69, 0x9a, 0xa2, 0x21,
		0x3d, 0x84, 0x82, 0x0a, 0x84, 0xe4, 0x09, 0xad,
		0x11, 0x24, 0x8b, 0x98, 0xc0, 0x81, 0x7f, 0x21,
		0xa3, 0x52, 0xbe, 0x19, 0x93, 0x09, 0xce, 0x20,
		0x10, 0x46, 0x4a, 0x4a, 0xf8, 0x27, 0x31, 0xec,
		0x58, 0xc7, 0xe8, 0x33, 0x82, 0xe3, 0xce, 0xbf,
		0x85, 0xf4, 0xdf, 0x94, 0xce, 0x4b, 0x09, 0xc1,
		0x94, 0x56, 0x8a, 0xc0, 0x13, 0x72, 0xa7, 0xfc,
		0x9f, 0x84, 0x4d, 0x73, 0xa3, 0xca, 0x9a, 0x61,
		0x58, 0x97, 0xa3, 0x27, 0xfc, 0x03, 0x98, 0x76,
		0x23, 0x1d, 0xc7, 0x61, 0x03, 0x04, 0xae, 0x56,
		0xbf, 0x38, 0x84, 0x00, 0x40, 0xa7, 0x0e, 0xfd,
		0xff, 0x52, 0xfe, 0x03, 0x6f, 0x95, 0x30, 0xf1,
		0x97, 0xfb, 0xc0, 0x85, 0x60, 0xd6, 0x80, 0x25,
		0xa9, 0x63, 0xbe, 0x03, 0x01, 0x4e, 0x38, 0xe2,
		0xf9, 0xa2, 0x34, 0xff, 0xbb, 0x3e, 0x03, 0x44,
		0x78, 0x00, 0x90, 0xcb, 0x88, 0x11, 0x3a, 0x94,
		0x65, 0xc0, 0x7c, 0x63, 0x87, 0xf0, 0x3c, 0xaf,
		0xd6, 0x25, 0xe4, 0x8b, 0x38, 0x0a, 0xac, 0x72,
		0x21, 0xd4, 0xf8, 0x07
	];

	public GbaRomParser(byte[] romData) {
		_romData = romData ?? throw new ArgumentNullException(nameof(romData));
		_header = ParseHeader();
	}

	/// <summary>
	/// Gets the parsed GBA header.
	/// </summary>
	public GbaHeader Header => _header;

	/// <summary>
	/// Gets the ROM size in bytes.
	/// </summary>
	public int RomSize => _romData.Length;

	/// <summary>
	/// Gets summary information about the ROM.
	/// </summary>
	public GbaRomInfo GetRomInfo() {
		return new GbaRomInfo {
			Title = _header.Title,
			GameCode = _header.GameCode,
			MakerCode = _header.MakerCode,
			UnitCode = _header.UnitCode,
			DeviceType = _header.DeviceType,
			SoftwareVersion = _header.SoftwareVersion,
			HeaderChecksumValid = ValidateHeaderChecksum(),
			LogoValid = ValidateLogo(),
			RomSize = _romData.Length,
			EntryPoint = _header.EntryPoint,
			IsMultiboot = _header.IsMultiboot,
			HasSaveType = DetectSaveType()
		};
	}

	/// <summary>
	/// Parses the GBA ROM header.
	/// </summary>
	private GbaHeader ParseHeader() {
		// Entry point at $00-$03 (ARM branch instruction)
		var entryPointRaw = BitConverter.ToUInt32(_romData, 0x00);
		var entryPoint = ParseEntryPoint(entryPointRaw);

		// Nintendo logo at $04-$9F (156 bytes)
		var logo = new byte[156];
		if (_romData.Length >= 0xA0) {
			Array.Copy(_romData, 0x04, logo, 0, 156);
		}

		// Game title at $A0-$AB (12 bytes)
		var title = "";
		if (_romData.Length >= 0xAC) {
			title = System.Text.Encoding.ASCII.GetString(_romData, 0xA0, 12).TrimEnd('\0');
		}

		// Game code at $AC-$AF (4 bytes)
		var gameCode = "";
		if (_romData.Length >= 0xB0) {
			gameCode = System.Text.Encoding.ASCII.GetString(_romData, 0xAC, 4);
		}

		// Maker code at $B0-$B1 (2 bytes)
		var makerCode = "";
		if (_romData.Length >= 0xB2) {
			makerCode = System.Text.Encoding.ASCII.GetString(_romData, 0xB0, 2);
		}

		// Fixed value at $B2 (must be 0x96)
		var fixedValue = _romData.Length >= 0xB3 ? _romData[0xB2] : (byte)0;

		// Unit code at $B3 (0x00 for GBA)
		var unitCode = _romData.Length >= 0xB4 ? _romData[0xB3] : (byte)0;

		// Device type at $B4
		var deviceType = _romData.Length >= 0xB5 ? _romData[0xB4] : (byte)0;

		// Reserved area at $B5-$BB (7 bytes, should be zero)
		// Skip

		// Software version at $BC
		var softwareVersion = _romData.Length >= 0xBD ? _romData[0xBC] : (byte)0;

		// Header checksum at $BD
		var headerChecksum = _romData.Length >= 0xBE ? _romData[0xBD] : (byte)0;

		// Reserved at $BE-$BF (2 bytes)
		// Skip

		return new GbaHeader {
			EntryPoint = entryPoint,
			Logo = logo,
			Title = title,
			GameCode = gameCode,
			MakerCode = makerCode,
			FixedValue = fixedValue,
			UnitCode = unitCode,
			DeviceType = deviceType,
			SoftwareVersion = softwareVersion,
			HeaderChecksum = headerChecksum,
			IsMultiboot = DetectMultiboot(entryPointRaw)
		};
	}

	/// <summary>
	/// Parses the entry point from the ARM branch instruction.
	/// </summary>
	private static uint ParseEntryPoint(uint instruction) {
		// GBA entry point is typically an ARM B (branch) instruction
		// Format: 0xEA00xxxx where xxxx is the offset
		if ((instruction & 0xFF000000) == 0xEA000000) {
			// Extract offset and calculate target address
			var offset = (int)(instruction & 0x00FFFFFF);
			if ((offset & 0x00800000) != 0) {
				offset |= unchecked((int)0xFF000000); // Sign extend
			}
			return (uint)((offset + 2) * 4 + 8);
		}
		return instruction;
	}

	/// <summary>
	/// Detects if this is a multiboot ROM (starts at different address).
	/// </summary>
	private static bool DetectMultiboot(uint entryPointRaw) {
		// Multiboot ROMs have entry point branching to 0x02000000+ (EWRAM)
		// Regular ROMs branch within the ROM at 0x08000000+
		return (entryPointRaw & 0xFF000000) == 0xEA000000 &&
			   ((entryPointRaw & 0x00FFFFFF) > 0x00400000);
	}

	/// <summary>
	/// Validates the Nintendo logo against expected data.
	/// </summary>
	public bool ValidateLogo() {
		if (_romData.Length < 0xA0) return false;

		for (int i = 0; i < NintendoLogo.Length; i++) {
			if (_romData[0x04 + i] != NintendoLogo[i]) {
				return false;
			}
		}
		return true;
	}

	/// <summary>
	/// Validates the header checksum.
	/// </summary>
	public bool ValidateHeaderChecksum() {
		if (_romData.Length < 0xBE) return false;

		var calculated = CalculateHeaderChecksum();
		return calculated == _romData[0xBD];
	}

	/// <summary>
	/// Calculates the header checksum.
	/// Checksum = -(sum of bytes from $A0 to $BC) - 0x19
	/// </summary>
	public byte CalculateHeaderChecksum() {
		int sum = 0;
		for (int i = 0xA0; i <= 0xBC; i++) {
			if (i < _romData.Length) {
				sum += _romData[i];
			}
		}
		return (byte)(-(sum + 0x19));
	}

	/// <summary>
	/// Detects the save type used by the ROM.
	/// </summary>
	public GbaSaveType DetectSaveType() {
		// Search for save type identifiers in the ROM
		var romString = System.Text.Encoding.ASCII.GetString(_romData);

		if (romString.Contains("EEPROM_V")) return GbaSaveType.EEPROM;
		if (romString.Contains("SRAM_V") || romString.Contains("SRAM_F_V")) return GbaSaveType.SRAM;
		if (romString.Contains("FLASH_V") || romString.Contains("FLASH512_V")) return GbaSaveType.Flash512K;
		if (romString.Contains("FLASH1M_V")) return GbaSaveType.Flash1M;

		return GbaSaveType.None;
	}

	/// <summary>
	/// Extracts a region of ROM data.
	/// </summary>
	public byte[] ExtractRegion(int offset, int length) {
		if (offset < 0 || offset >= _romData.Length) {
			throw new ArgumentOutOfRangeException(nameof(offset));
		}

		var actualLength = Math.Min(length, _romData.Length - offset);
		var result = new byte[actualLength];
		Array.Copy(_romData, offset, result, 0, actualLength);
		return result;
	}

	/// <summary>
	/// Fixes the header checksum in a ROM.
	/// </summary>
	public static byte[] FixHeaderChecksum(byte[] romData) {
		if (romData.Length < 0xBE) {
			throw new ArgumentException("ROM too small to contain valid header", nameof(romData));
		}

		var result = new byte[romData.Length];
		Array.Copy(romData, result, romData.Length);

		var parser = new GbaRomParser(result);
		result[0xBD] = parser.CalculateHeaderChecksum();

		return result;
	}

	/// <summary>
	/// Converts a GBA memory address to ROM file offset.
	/// </summary>
	public static int AddressToOffset(uint address) {
		// GBA ROM is mapped at $08000000-$09FFFFFF (Wait State 0)
		// and mirrored at $0A000000-$0BFFFFFF (Wait State 1)
		// and $0C000000-$0DFFFFFF (Wait State 2)
		if (address >= 0x08000000 && address < 0x0E000000) {
			return (int)((address - 0x08000000) % 0x02000000);
		}
		return (int)address;
	}

	/// <summary>
	/// Converts a ROM file offset to GBA memory address.
	/// </summary>
	public static uint OffsetToAddress(int offset) {
		return (uint)(0x08000000 + offset);
	}
}

/// <summary>
/// GBA ROM header structure.
/// </summary>
public class GbaHeader {
	public uint EntryPoint { get; init; }
	public byte[] Logo { get; init; } = [];
	public string Title { get; init; } = "";
	public string GameCode { get; init; } = "";
	public string MakerCode { get; init; } = "";
	public byte FixedValue { get; init; }
	public byte UnitCode { get; init; }
	public byte DeviceType { get; init; }
	public byte SoftwareVersion { get; init; }
	public byte HeaderChecksum { get; init; }
	public bool IsMultiboot { get; init; }
}

/// <summary>
/// GBA save types.
/// </summary>
public enum GbaSaveType {
	None,
	SRAM,
	EEPROM,
	Flash512K,
	Flash1M
}

/// <summary>
/// Summary information about a GBA ROM.
/// </summary>
public class GbaRomInfo {
	public string Title { get; init; } = "";
	public string GameCode { get; init; } = "";
	public string MakerCode { get; init; } = "";
	public byte UnitCode { get; init; }
	public byte DeviceType { get; init; }
	public byte SoftwareVersion { get; init; }
	public bool HeaderChecksumValid { get; init; }
	public bool LogoValid { get; init; }
	public int RomSize { get; init; }
	public uint EntryPoint { get; init; }
	public bool IsMultiboot { get; init; }
	public GbaSaveType HasSaveType { get; init; }
}
