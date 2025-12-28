namespace GameInfoTools.Core.Build;

/// <summary>
/// Game Boy / Game Boy Color ROM parsing and bank extraction utilities.
/// Supports MBC1, MBC2, MBC3, MBC5, and other memory bank controllers.
/// </summary>
public class GameBoyRomParser {
	private readonly byte[] _romData;

	/// <summary>
	/// Game Boy ROM bank size (16KB)
	/// </summary>
	public const int RomBankSize = 0x4000;

	/// <summary>
	/// Game Boy RAM bank size (8KB)
	/// </summary>
	public const int RamBankSize = 0x2000;

	/// <summary>
	/// Game Boy tile size (8x8 pixels)
	/// </summary>
	public const int TileSize = 8;

	/// <summary>
	/// Header offset in ROM
	/// </summary>
	public const int HeaderOffset = 0x100;

	public GameBoyRomParser(byte[] romData) {
		_romData = romData ?? throw new ArgumentNullException(nameof(romData));
		Header = ParseHeader();
	}

	/// <summary>
	/// Gets the parsed Game Boy header.
	/// </summary>
	public GameBoyHeader Header { get; }

	/// <summary>
	/// Gets the ROM size in bytes.
	/// </summary>
	public int RomSize => _romData.Length;

	/// <summary>
	/// Gets whether this is a Game Boy Color ROM.
	/// </summary>
	public bool IsGameBoyColor => Header.CgbFlag == CgbSupport.CgbOnly ||
								   Header.CgbFlag == CgbSupport.CgbEnhanced;

	/// <summary>
	/// Gets whether this is a Super Game Boy enhanced ROM.
	/// </summary>
	public bool IsSuperGameBoy => Header.SgbFlag;

	/// <summary>
	/// Gets the number of ROM banks.
	/// </summary>
	public int RomBankCount => Header.RomBanks;

	/// <summary>
	/// Gets the number of RAM banks.
	/// </summary>
	public int RamBankCount => Header.RamBanks;

	/// <summary>
	/// Parse the Game Boy ROM header.
	/// </summary>
	private GameBoyHeader ParseHeader() {
		var header = new GameBoyHeader();

		if (_romData.Length < 0x150) {
			return header;
		}

		// Entry point at $100-$103 (usually NOP; JP $150)
		header.EntryPoint = new byte[4];
		Array.Copy(_romData, 0x100, header.EntryPoint, 0, 4);

		// Nintendo logo at $104-$133 (48 bytes)
		header.NintendoLogo = new byte[48];
		Array.Copy(_romData, 0x104, header.NintendoLogo, 0, 48);

		// Verify Nintendo logo
		header.LogoValid = VerifyNintendoLogo(header.NintendoLogo);

		// Title at $134-$143 (16 bytes, or 11 if CGB)
		// Check CGB flag first
		header.CgbFlag = GetCgbSupport(_romData[0x143]);

		// Title length depends on CGB flag usage
		var titleLength = header.CgbFlag != CgbSupport.None ? 11 : 16;
		var titleBytes = new byte[titleLength];
		Array.Copy(_romData, 0x134, titleBytes, 0, titleLength);
		header.Title = System.Text.Encoding.ASCII.GetString(titleBytes).TrimEnd('\0', ' ');

		// Manufacturer code at $13f-$142 (4 bytes, CGB only)
		if (header.CgbFlag != CgbSupport.None) {
			var mfgBytes = new byte[4];
			Array.Copy(_romData, 0x13f, mfgBytes, 0, 4);
			header.ManufacturerCode = System.Text.Encoding.ASCII.GetString(mfgBytes).TrimEnd('\0');
		}

		// New licensee code at $144-$145
		header.NewLicenseeCode = System.Text.Encoding.ASCII.GetString(
			new[] { _romData[0x144], _romData[0x145] });

		// SGB flag at $146
		header.SgbFlag = _romData[0x146] == 0x03;

		// Cartridge type at $147
		header.CartridgeType = _romData[0x147];
		header.MBC = GetMbcType(header.CartridgeType);
		header.HasRam = HasCartridgeRam(header.CartridgeType);
		header.HasBattery = HasCartridgeBattery(header.CartridgeType);
		header.HasTimer = HasCartridgeTimer(header.CartridgeType);
		header.HasRumble = HasCartridgeRumble(header.CartridgeType);

		// ROM size at $148
		header.RomSizeCode = _romData[0x148];
		header.RomBanks = GetRomBankCount(header.RomSizeCode);

		// RAM size at $149
		header.RamSizeCode = _romData[0x149];
		header.RamBanks = GetRamBankCount(header.RamSizeCode);
		header.RamSize = header.RamBanks * RamBankSize;

		// Destination code at $14a
		header.DestinationCode = _romData[0x14a];
		header.Region = header.DestinationCode == 0 ? GameBoyRegion.Japan : GameBoyRegion.Overseas;

		// Old licensee code at $14b
		header.OldLicenseeCode = _romData[0x14b];

		// Mask ROM version at $14c
		header.Version = _romData[0x14c];

		// Header checksum at $14d
		header.HeaderChecksum = _romData[0x14d];
		header.HeaderChecksumValid = VerifyHeaderChecksum();

		// Global checksum at $14e-$14f (big-endian)
		header.GlobalChecksum = (ushort)((_romData[0x14e] << 8) | _romData[0x14f]);

		return header;
	}

	/// <summary>
	/// Verify the Nintendo logo bytes.
	/// </summary>
	private static bool VerifyNintendoLogo(byte[] logo) {
		byte[] expectedLogo = [
			0xce, 0xed, 0x66, 0x66, 0xcc, 0x0d, 0x00, 0x0b,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0c, 0x00, 0x0d,
			0x00, 0x08, 0x11, 0x1f, 0x88, 0x89, 0x00, 0x0e,
			0xdc, 0xcc, 0x6e, 0xe6, 0xdd, 0xdd, 0xd9, 0x99,
			0xbb, 0xbb, 0x67, 0x63, 0x6e, 0x0e, 0xec, 0xcc,
			0xdd, 0xdc, 0x99, 0x9f, 0xbb, 0xb9, 0x33, 0x3e
		];

		if (logo.Length != expectedLogo.Length) return false;

		for (int i = 0; i < logo.Length; i++) {
			if (logo[i] != expectedLogo[i]) return false;
		}

		return true;
	}

	/// <summary>
	/// Verify the header checksum.
	/// </summary>
	public bool VerifyHeaderChecksum() {
		byte checksum = 0;
		for (int i = 0x134; i <= 0x14c; i++) {
			checksum = (byte)(checksum - _romData[i] - 1);
		}

		return checksum == _romData[0x14d];
	}

	/// <summary>
	/// Calculate the header checksum.
	/// </summary>
	public byte CalculateHeaderChecksum() {
		byte checksum = 0;
		for (int i = 0x134; i <= 0x14c; i++) {
			checksum = (byte)(checksum - _romData[i] - 1);
		}

		return checksum;
	}

	/// <summary>
	/// Calculate the global checksum.
	/// </summary>
	public ushort CalculateGlobalChecksum() {
		uint sum = 0;
		for (int i = 0; i < _romData.Length; i++) {
			// Exclude checksum bytes themselves
			if (i != 0x14e && i != 0x14f) {
				sum += _romData[i];
			}
		}

		return (ushort)(sum & 0xffff);
	}

	/// <summary>
	/// Verify the global checksum.
	/// </summary>
	public bool VerifyGlobalChecksum() {
		return Header.GlobalChecksum == CalculateGlobalChecksum();
	}

	/// <summary>
	/// Get CGB support level.
	/// </summary>
	private static CgbSupport GetCgbSupport(byte flag) {
		return flag switch {
			0x80 => CgbSupport.CgbEnhanced,
			0xc0 => CgbSupport.CgbOnly,
			_ => CgbSupport.None
		};
	}

	/// <summary>
	/// Get MBC type from cartridge type byte.
	/// </summary>
	private static MbcType GetMbcType(byte cartType) {
		return cartType switch {
			0x00 => MbcType.None,
			0x01 or 0x02 or 0x03 => MbcType.MBC1,
			0x05 or 0x06 => MbcType.MBC2,
			0x08 or 0x09 => MbcType.None, // ROM+RAM
			0x0b or 0x0c or 0x0d => MbcType.MMM01,
			0x0f or 0x10 or 0x11 or 0x12 or 0x13 => MbcType.MBC3,
			0x19 or 0x1a or 0x1b or 0x1c or 0x1d or 0x1e => MbcType.MBC5,
			0x20 => MbcType.MBC6,
			0x22 => MbcType.MBC7,
			0xfc => MbcType.PocketCamera,
			0xfd => MbcType.BandaiTama5,
			0xfe => MbcType.HuC3,
			0xff => MbcType.HuC1,
			_ => MbcType.Unknown
		};
	}

	/// <summary>
	/// Check if cartridge has RAM.
	/// </summary>
	private static bool HasCartridgeRam(byte cartType) {
		return cartType is 0x02 or 0x03 or 0x08 or 0x09 or 0x0c or 0x0d
			or 0x10 or 0x12 or 0x13 or 0x1a or 0x1b or 0x1d or 0x1e
			or 0x22 or 0xff;
	}

	/// <summary>
	/// Check if cartridge has battery.
	/// </summary>
	private static bool HasCartridgeBattery(byte cartType) {
		return cartType is 0x03 or 0x06 or 0x09 or 0x0d or 0x0f or 0x10
			or 0x13 or 0x1b or 0x1e or 0x22 or 0xff;
	}

	/// <summary>
	/// Check if cartridge has timer.
	/// </summary>
	private static bool HasCartridgeTimer(byte cartType) {
		return cartType is 0x0f or 0x10;
	}

	/// <summary>
	/// Check if cartridge has rumble.
	/// </summary>
	private static bool HasCartridgeRumble(byte cartType) {
		return cartType is 0x1c or 0x1d or 0x1e;
	}

	/// <summary>
	/// Get ROM bank count from size code.
	/// </summary>
	private static int GetRomBankCount(byte sizeCode) {
		return sizeCode switch {
			0x00 => 2,   // 32KB
			0x01 => 4,   // 64KB
			0x02 => 8,   // 128KB
			0x03 => 16,  // 256KB
			0x04 => 32,  // 512KB
			0x05 => 64,  // 1MB
			0x06 => 128, // 2MB
			0x07 => 256, // 4MB
			0x08 => 512, // 8MB
			0x52 => 72,  // 1.1MB
			0x53 => 80,  // 1.2MB
			0x54 => 96,  // 1.5MB
			_ => 2
		};
	}

	/// <summary>
	/// Get RAM bank count from size code.
	/// </summary>
	private static int GetRamBankCount(byte sizeCode) {
		return sizeCode switch {
			0x00 => 0,   // No RAM
			0x01 => 1,   // 2KB (unused)
			0x02 => 1,   // 8KB
			0x03 => 4,   // 32KB
			0x04 => 16,  // 128KB
			0x05 => 8,   // 64KB
			_ => 0
		};
	}

	/// <summary>
	/// Get a specific ROM bank.
	/// </summary>
	public byte[] GetRomBank(int bankIndex) {
		if (bankIndex < 0 || bankIndex >= RomBankCount) {
			throw new ArgumentOutOfRangeException(nameof(bankIndex),
				$"Bank index {bankIndex} out of range (0-{RomBankCount - 1})");
		}

		var offset = bankIndex * RomBankSize;
		var length = Math.Min(RomBankSize, _romData.Length - offset);
		var bank = new byte[length];
		Array.Copy(_romData, offset, bank, 0, length);
		return bank;
	}

	/// <summary>
	/// Get all ROM data.
	/// </summary>
	public byte[] GetRomData() {
		var data = new byte[_romData.Length];
		Array.Copy(_romData, data, _romData.Length);
		return data;
	}

	/// <summary>
	/// Fix the header checksum.
	/// </summary>
	public static byte[] FixHeaderChecksum(byte[] romData) {
		var parser = new GameBoyRomParser(romData);
		var checksum = parser.CalculateHeaderChecksum();

		var result = new byte[romData.Length];
		Array.Copy(romData, result, romData.Length);
		result[0x14d] = checksum;

		return result;
	}

	/// <summary>
	/// Fix both header and global checksums.
	/// </summary>
	public static byte[] FixChecksums(byte[] romData) {
		var result = new byte[romData.Length];
		Array.Copy(romData, result, romData.Length);

		// Fix header checksum first
		var parser = new GameBoyRomParser(result);
		result[0x14d] = parser.CalculateHeaderChecksum();

		// Recalculate global checksum
		parser = new GameBoyRomParser(result);
		var globalChecksum = parser.CalculateGlobalChecksum();
		result[0x14e] = (byte)((globalChecksum >> 8) & 0xff);
		result[0x14f] = (byte)(globalChecksum & 0xff);

		return result;
	}

	/// <summary>
	/// Get ROM information summary.
	/// </summary>
	public GameBoyRomInfo GetRomInfo() {
		return new GameBoyRomInfo {
			Title = Header.Title,
			IsGameBoyColor = IsGameBoyColor,
			IsSuperGameBoy = IsSuperGameBoy,
			MBC = Header.MBC,
			RomSize = RomSize,
			RomBankCount = RomBankCount,
			RamSize = Header.RamSize,
			RamBankCount = RamBankCount,
			HasBattery = Header.HasBattery,
			HasTimer = Header.HasTimer,
			HasRumble = Header.HasRumble,
			Region = Header.Region,
			HeaderChecksumValid = Header.HeaderChecksumValid,
			GlobalChecksumValid = VerifyGlobalChecksum(),
			LogoValid = Header.LogoValid
		};
	}

	/// <summary>
	/// Extract all ROM banks as separate files.
	/// </summary>
	public async Task ExtractBanksAsync(string outputDir, CancellationToken cancellationToken = default) {
		Directory.CreateDirectory(outputDir);

		for (int i = 0; i < RomBankCount; i++) {
			cancellationToken.ThrowIfCancellationRequested();
			var bank = GetRomBank(i);
			var path = Path.Combine(outputDir, $"bank_{i:d2}.bin");
			await File.WriteAllBytesAsync(path, bank, cancellationToken);
		}

		// Extract header info
		var infoPath = Path.Combine(outputDir, "rom_info.json");
		var info = GetRomInfo();
		var json = System.Text.Json.JsonSerializer.Serialize(info, new System.Text.Json.JsonSerializerOptions {
			WriteIndented = true
		});
		await File.WriteAllTextAsync(infoPath, json, cancellationToken);
	}
}

/// <summary>
/// Parsed Game Boy ROM header.
/// </summary>
public class GameBoyHeader {
	public byte[] EntryPoint { get; set; } = [];
	public byte[] NintendoLogo { get; set; } = [];
	public bool LogoValid { get; set; }
	public string Title { get; set; } = "";
	public string ManufacturerCode { get; set; } = "";
	public CgbSupport CgbFlag { get; set; }
	public string NewLicenseeCode { get; set; } = "";
	public bool SgbFlag { get; set; }
	public byte CartridgeType { get; set; }
	public MbcType MBC { get; set; }
	public bool HasRam { get; set; }
	public bool HasBattery { get; set; }
	public bool HasTimer { get; set; }
	public bool HasRumble { get; set; }
	public byte RomSizeCode { get; set; }
	public int RomBanks { get; set; }
	public byte RamSizeCode { get; set; }
	public int RamBanks { get; set; }
	public int RamSize { get; set; }
	public byte DestinationCode { get; set; }
	public GameBoyRegion Region { get; set; }
	public byte OldLicenseeCode { get; set; }
	public byte Version { get; set; }
	public byte HeaderChecksum { get; set; }
	public bool HeaderChecksumValid { get; set; }
	public ushort GlobalChecksum { get; set; }
}

/// <summary>
/// Game Boy Color support levels.
/// </summary>
public enum CgbSupport {
	/// <summary>No CGB support (original GB)</summary>
	None,
	/// <summary>CGB enhanced (works on both)</summary>
	CgbEnhanced,
	/// <summary>CGB only (doesn't work on DMG)</summary>
	CgbOnly
}

/// <summary>
/// Memory Bank Controller types.
/// </summary>
public enum MbcType {
	None,
	MBC1,
	MBC2,
	MBC3,
	MBC5,
	MBC6,
	MBC7,
	MMM01,
	PocketCamera,
	BandaiTama5,
	HuC1,
	HuC3,
	Unknown
}

/// <summary>
/// Game Boy region codes.
/// </summary>
public enum GameBoyRegion {
	Japan,
	Overseas
}

/// <summary>
/// Summary information about a Game Boy ROM.
/// </summary>
public class GameBoyRomInfo {
	public string Title { get; init; } = "";
	public bool IsGameBoyColor { get; init; }
	public bool IsSuperGameBoy { get; init; }
	public MbcType MBC { get; init; }
	public int RomSize { get; init; }
	public int RomBankCount { get; init; }
	public int RamSize { get; init; }
	public int RamBankCount { get; init; }
	public bool HasBattery { get; init; }
	public bool HasTimer { get; init; }
	public bool HasRumble { get; init; }
	public GameBoyRegion Region { get; init; }
	public bool HeaderChecksumValid { get; init; }
	public bool GlobalChecksumValid { get; init; }
	public bool LogoValid { get; init; }
}
