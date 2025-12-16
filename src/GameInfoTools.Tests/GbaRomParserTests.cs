using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for GbaRomParser functionality.
/// </summary>
public class GbaRomParserTests {
	/// <summary>
	/// Creates a minimal valid GBA ROM for testing.
	/// </summary>
	private static byte[] CreateMinimalGbaRom(
		string title = "TESTGAME",
		string gameCode = "TEST",
		string makerCode = "01",
		byte softwareVersion = 0x00) {
		// Minimum practical ROM size
		var romData = new byte[0x100];

		// Entry point at $00-$03 (ARM branch to $08000100)
		// b $08000100 = 0xEA00003E
		romData[0x00] = 0x3E;
		romData[0x01] = 0x00;
		romData[0x02] = 0x00;
		romData[0x03] = 0xEA;

		// Nintendo logo at $04-$9F (156 bytes)
		var nintendoLogo = new byte[] {
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
		};
		Array.Copy(nintendoLogo, 0, romData, 0x04, nintendoLogo.Length);

		// Game title at $A0-$AB (12 bytes)
		var titleBytes = System.Text.Encoding.ASCII.GetBytes(title);
		var titleLength = Math.Min(titleBytes.Length, 12);
		Array.Copy(titleBytes, 0, romData, 0xA0, titleLength);

		// Game code at $AC-$AF (4 bytes)
		var gameCodeBytes = System.Text.Encoding.ASCII.GetBytes(gameCode);
		var gameCodeLength = Math.Min(gameCodeBytes.Length, 4);
		Array.Copy(gameCodeBytes, 0, romData, 0xAC, gameCodeLength);

		// Maker code at $B0-$B1 (2 bytes)
		var makerCodeBytes = System.Text.Encoding.ASCII.GetBytes(makerCode);
		var makerCodeLength = Math.Min(makerCodeBytes.Length, 2);
		Array.Copy(makerCodeBytes, 0, romData, 0xB0, makerCodeLength);

		// Fixed value at $B2 (must be 0x96)
		romData[0xB2] = 0x96;

		// Unit code at $B3 (0x00 for GBA)
		romData[0xB3] = 0x00;

		// Device type at $B4
		romData[0xB4] = 0x00;

		// Reserved area at $B5-$BB (zero)
		// Already zero

		// Software version at $BC
		romData[0xBC] = softwareVersion;

		// Calculate header checksum and store at $BD
		int sum = 0;
		for (int i = 0xA0; i <= 0xBC; i++) {
			sum += romData[i];
		}
		romData[0xBD] = (byte)(-(sum + 0x19));

		return romData;
	}

	[Fact]
	public void Constructor_WithValidRom_Succeeds() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		Assert.NotNull(parser);
	}

	[Fact]
	public void Constructor_WithNullData_ThrowsArgumentNullException() {
		Assert.Throws<ArgumentNullException>(() => new GbaRomParser(null!));
	}

	[Fact]
	public void GetRomInfo_ReturnsCorrectTitle() {
		var romData = CreateMinimalGbaRom(title: "POKEMON");
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal("POKEMON", info.Title);
	}

	[Fact]
	public void GetRomInfo_ReturnsCorrectGameCode() {
		var romData = CreateMinimalGbaRom(gameCode: "AXVE");
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal("AXVE", info.GameCode);
	}

	[Fact]
	public void GetRomInfo_ReturnsCorrectMakerCode() {
		var romData = CreateMinimalGbaRom(makerCode: "01");
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal("01", info.MakerCode);
	}

	[Fact]
	public void GetRomInfo_ReturnsCorrectSoftwareVersion() {
		var romData = CreateMinimalGbaRom(softwareVersion: 0x02);
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(0x02, info.SoftwareVersion);
	}

	[Fact]
	public void GetRomInfo_ValidatesNintendoLogo() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.True(info.LogoValid);
	}

	[Fact]
	public void GetRomInfo_DetectsInvalidLogo() {
		var romData = CreateMinimalGbaRom();
		// Corrupt the logo
		romData[0x04] = 0xFF;
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.False(info.LogoValid);
	}

	[Fact]
	public void GetRomInfo_ValidatesHeaderChecksum() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.True(info.HeaderChecksumValid);
	}

	[Fact]
	public void GetRomInfo_DetectsInvalidHeaderChecksum() {
		var romData = CreateMinimalGbaRom();
		// Corrupt the header checksum
		romData[0xBD] = 0xFF;
		var parser = new GbaRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.False(info.HeaderChecksumValid);
	}

	[Fact]
	public void CalculateHeaderChecksum_ReturnsCorrectValue() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		var calculatedChecksum = parser.CalculateHeaderChecksum();
		var storedChecksum = romData[0xBD];

		Assert.Equal(storedChecksum, calculatedChecksum);
	}

	[Fact]
	public void FixHeaderChecksum_CorrectsBadChecksum() {
		var romData = CreateMinimalGbaRom();
		// Corrupt the header checksum
		romData[0xBD] = 0x00;

		var fixedRom = GbaRomParser.FixHeaderChecksum(romData);

		// Verify the checksum is now valid
		var fixedParser = new GbaRomParser(fixedRom);
		var info = fixedParser.GetRomInfo();
		Assert.True(info.HeaderChecksumValid);
	}

	[Fact]
	public void RomSize_ReturnsCorrectSize() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		Assert.Equal(romData.Length, parser.RomSize);
	}

	[Fact]
	public void ExtractRegion_ReturnsCorrectData() {
		var romData = CreateMinimalGbaRom();
		// Put some test data
		romData[0xE0] = 0xAB;
		romData[0xE1] = 0xCD;
		var parser = new GbaRomParser(romData);

		var region = parser.ExtractRegion(0xE0, 2);

		Assert.Equal(2, region.Length);
		Assert.Equal(0xAB, region[0]);
		Assert.Equal(0xCD, region[1]);
	}

	[Fact]
	public void ExtractRegion_WithInvalidOffset_ThrowsException() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		Assert.Throws<ArgumentOutOfRangeException>(() => parser.ExtractRegion(0x1000, 10));
	}

	[Fact]
	public void AddressToOffset_ConvertsRomAddress() {
		// ROM address $08001234 -> offset $1234
		var offset = GbaRomParser.AddressToOffset(0x08001234);
		Assert.Equal(0x1234, offset);
	}

	[Fact]
	public void AddressToOffset_ConvertsMirroredAddress() {
		// Mirrored ROM at $0A001234 -> offset $1234
		var offset = GbaRomParser.AddressToOffset(0x0A001234);
		Assert.Equal(0x1234, offset);
	}

	[Fact]
	public void OffsetToAddress_ConvertsToRomAddress() {
		// Offset $1234 -> ROM address $08001234
		var address = GbaRomParser.OffsetToAddress(0x1234);
		Assert.Equal(0x08001234u, address);
	}

	[Fact]
	public void DetectSaveType_DetectsEEPROM() {
		var romData = new byte[0x200];
		// Set up minimal header
		Array.Copy(CreateMinimalGbaRom(), romData, 0x100);
		// Add EEPROM string
		var eepromStr = System.Text.Encoding.ASCII.GetBytes("EEPROM_V124");
		Array.Copy(eepromStr, 0, romData, 0x100, eepromStr.Length);

		var parser = new GbaRomParser(romData);
		Assert.Equal(GbaSaveType.EEPROM, parser.DetectSaveType());
	}

	[Fact]
	public void DetectSaveType_DetectsSRAM() {
		var romData = new byte[0x200];
		Array.Copy(CreateMinimalGbaRom(), romData, 0x100);
		var sramStr = System.Text.Encoding.ASCII.GetBytes("SRAM_V113");
		Array.Copy(sramStr, 0, romData, 0x100, sramStr.Length);

		var parser = new GbaRomParser(romData);
		Assert.Equal(GbaSaveType.SRAM, parser.DetectSaveType());
	}

	[Fact]
	public void DetectSaveType_DetectsFlash512K() {
		var romData = new byte[0x200];
		Array.Copy(CreateMinimalGbaRom(), romData, 0x100);
		var flashStr = System.Text.Encoding.ASCII.GetBytes("FLASH512_V131");
		Array.Copy(flashStr, 0, romData, 0x100, flashStr.Length);

		var parser = new GbaRomParser(romData);
		Assert.Equal(GbaSaveType.Flash512K, parser.DetectSaveType());
	}

	[Fact]
	public void DetectSaveType_DetectsFlash1M() {
		var romData = new byte[0x200];
		Array.Copy(CreateMinimalGbaRom(), romData, 0x100);
		var flashStr = System.Text.Encoding.ASCII.GetBytes("FLASH1M_V103");
		Array.Copy(flashStr, 0, romData, 0x100, flashStr.Length);

		var parser = new GbaRomParser(romData);
		Assert.Equal(GbaSaveType.Flash1M, parser.DetectSaveType());
	}

	[Fact]
	public void DetectSaveType_ReturnsNoneWhenNotFound() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		Assert.Equal(GbaSaveType.None, parser.DetectSaveType());
	}

	[Fact]
	public void Header_IsNotMultiboot_ForNormalRom() {
		var romData = CreateMinimalGbaRom();
		var parser = new GbaRomParser(romData);

		Assert.False(parser.Header.IsMultiboot);
	}
}
