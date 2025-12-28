using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for GameBoyRomParser functionality.
/// </summary>
public class GameBoyRomParserTests {
	/// <summary>
	/// Creates a minimal valid Game Boy ROM for testing.
	/// </summary>
	private static byte[] CreateMinimalGameBoyRom(
		string title = "TEST",
		bool isCgb = false,
		bool isSgb = false,
		byte mbcType = 0x00,
		byte romSizeCode = 0x00,
		byte ramSizeCode = 0x00,
		byte region = 0x01) {
		// Minimum ROM size is 32KB (2 banks)
		var romData = new byte[0x8000];

		// Entry point at $100
		romData[0x100] = 0x00; // NOP
		romData[0x101] = 0xc3; // JP
		romData[0x102] = 0x50; // Low byte of $0150
		romData[0x103] = 0x01; // High byte of $0150

		// Nintendo logo at $104-$133 (48 bytes)
		var nintendoLogo = new byte[] {
			0xce, 0xed, 0x66, 0x66, 0xcc, 0x0d, 0x00, 0x0b,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0c, 0x00, 0x0d,
			0x00, 0x08, 0x11, 0x1f, 0x88, 0x89, 0x00, 0x0e,
			0xdc, 0xcc, 0x6e, 0xe6, 0xdd, 0xdd, 0xd9, 0x99,
			0xbb, 0xbb, 0x67, 0x63, 0x6e, 0x0e, 0xec, 0xcc,
			0xdd, 0xdc, 0x99, 0x9f, 0xbb, 0xb9, 0x33, 0x3e
		};
		Array.Copy(nintendoLogo, 0, romData, 0x104, nintendoLogo.Length);

		// Title at $134-$143 (16 bytes for DMG, 11 for CGB)
		var titleBytes = System.Text.Encoding.ASCII.GetBytes(title);
		var titleLength = Math.Min(titleBytes.Length, isCgb ? 11 : 16);
		Array.Copy(titleBytes, 0, romData, 0x134, titleLength);

		// CGB flag at $143
		if (isCgb) {
			romData[0x143] = 0x80; // CGB compatible
		}

		// New licensee code at $144-$145
		romData[0x144] = 0x00;
		romData[0x145] = 0x00;

		// SGB flag at $146
		if (isSgb) {
			romData[0x146] = 0x03; // SGB supported
		}

		// Cartridge type at $147
		romData[0x147] = mbcType;

		// ROM size at $148
		romData[0x148] = romSizeCode;

		// RAM size at $149
		romData[0x149] = ramSizeCode;

		// Destination code at $14A
		romData[0x14A] = region;

		// Old licensee code at $14B
		romData[0x14B] = 0x33; // Use new licensee

		// Mask ROM version at $14C
		romData[0x14C] = 0x00;

		// Calculate and set header checksum at $14D
		int checksum = 0;
		for (int i = 0x134; i <= 0x14C; i++) {
			checksum = checksum - romData[i] - 1;
		}

		romData[0x14D] = (byte)(checksum & 0xff);

		// Global checksum at $14E-$14F (calculated later if needed)
		// For now, leave as zero - the parser should detect invalid checksum

		return romData;
	}

	[Fact]
	public void Constructor_WithValidRom_Succeeds() {
		var romData = CreateMinimalGameBoyRom();
		var parser = new GameBoyRomParser(romData);

		Assert.NotNull(parser);
	}

	[Fact]
	public void Constructor_WithNullData_ThrowsArgumentNullException() {
		Assert.Throws<ArgumentNullException>(() => new GameBoyRomParser(null!));
	}

	[Fact]
	public void Constructor_WithTooSmallData_StillParses() {
		// The parser doesn't require minimum size validation -
		// it will parse what it can from the provided data
		var smallData = new byte[0x200]; // Small but has some header space
		var parser = new GameBoyRomParser(smallData);

		// Should parse without throwing, even with minimal data
		var info = parser.GetRomInfo();
		Assert.NotNull(info);
	}

	[Fact]
	public void GetRomInfo_ReturnsCorrectTitle() {
		var romData = CreateMinimalGameBoyRom(title: "POKEMON");
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal("POKEMON", info.Title);
	}

	[Fact]
	public void GetRomInfo_DetectsGameBoyColorRom() {
		var romData = CreateMinimalGameBoyRom(isCgb: true);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.True(info.IsGameBoyColor);
	}

	[Fact]
	public void GetRomInfo_DetectsDmgOnlyRom() {
		var romData = CreateMinimalGameBoyRom(isCgb: false);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.False(info.IsGameBoyColor);
	}

	[Fact]
	public void GetRomInfo_DetectsSuperGameBoySupport() {
		var romData = CreateMinimalGameBoyRom(isSgb: true);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.True(info.IsSuperGameBoy);
	}

	[Fact]
	public void GetRomInfo_DetectsNoMbc() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x00);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.None, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc1() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x01);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC1, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc1WithRam() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x02);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC1, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc1WithBattery() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x03);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC1, info.MBC);
		Assert.True(info.HasBattery);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc3() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x11);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC3, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc3WithTimerAndBattery() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x0F);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC3, info.MBC);
		Assert.True(info.HasTimer);
		Assert.True(info.HasBattery);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc5() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x19);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC5, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc5WithRumble() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x1C);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC5, info.MBC);
		Assert.True(info.HasRumble);
	}

	[Fact]
	public void GetRomInfo_CalculatesRomBankCount_32KB() {
		var romData = CreateMinimalGameBoyRom(romSizeCode: 0x00);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(2, info.RomBankCount); // 32KB = 2 banks
	}

	[Fact]
	public void GetRomInfo_CalculatesRomBankCount_64KB() {
		var romData = CreateMinimalGameBoyRom(romSizeCode: 0x01);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(4, info.RomBankCount); // 64KB = 4 banks
	}

	[Fact]
	public void GetRomInfo_CalculatesRomBankCount_2MB() {
		var romData = CreateMinimalGameBoyRom(romSizeCode: 0x06);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(128, info.RomBankCount); // 2MB = 128 banks
	}

	[Fact]
	public void GetRomInfo_DetectsRamSize_None() {
		var romData = CreateMinimalGameBoyRom(ramSizeCode: 0x00);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(0, info.RamBankCount);
		Assert.Equal(0, info.RamSize);
	}

	[Fact]
	public void GetRomInfo_DetectsRamSize_8KB() {
		var romData = CreateMinimalGameBoyRom(ramSizeCode: 0x02);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(1, info.RamBankCount); // 8KB = 1 bank
		Assert.Equal(0x2000, info.RamSize);
	}

	[Fact]
	public void GetRomInfo_DetectsRamSize_32KB() {
		var romData = CreateMinimalGameBoyRom(ramSizeCode: 0x03);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(4, info.RamBankCount); // 32KB = 4 banks
		Assert.Equal(0x8000, info.RamSize);
	}

	[Fact]
	public void GetRomInfo_DetectsJapaneseRegion() {
		var romData = CreateMinimalGameBoyRom(region: 0x00);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(GameBoyRegion.Japan, info.Region);
	}

	[Fact]
	public void GetRomInfo_DetectsNonJapaneseRegion() {
		var romData = CreateMinimalGameBoyRom(region: 0x01);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(GameBoyRegion.Overseas, info.Region);
	}

	[Fact]
	public void GetRomInfo_ValidatesNintendoLogo() {
		var romData = CreateMinimalGameBoyRom();
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.True(info.LogoValid);
	}

	[Fact]
	public void GetRomInfo_DetectsInvalidLogo() {
		var romData = CreateMinimalGameBoyRom();
		// Corrupt the logo
		romData[0x104] = 0xFF;
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.False(info.LogoValid);
	}

	[Fact]
	public void GetRomInfo_ValidatesHeaderChecksum() {
		var romData = CreateMinimalGameBoyRom();
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.True(info.HeaderChecksumValid);
	}

	[Fact]
	public void GetRomInfo_DetectsInvalidHeaderChecksum() {
		var romData = CreateMinimalGameBoyRom();
		// Corrupt the header checksum
		romData[0x14D] = 0xFF;
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.False(info.HeaderChecksumValid);
	}

	[Fact]
	public void RomBankCount_ReturnsCorrectCount() {
		var romData = CreateMinimalGameBoyRom();
		var parser = new GameBoyRomParser(romData);

		Assert.Equal(2, parser.RomBankCount);
	}

	[Fact]
	public void RomBankSize_Is16KB() {
		Assert.Equal(0x4000, GameBoyRomParser.RomBankSize);
	}

	[Fact]
	public void RamBankSize_Is8KB() {
		Assert.Equal(0x2000, GameBoyRomParser.RamBankSize);
	}

	[Fact]
	public void GetRomBank_ReturnsCorrectData() {
		var romData = CreateMinimalGameBoyRom();
		// Put some test data in bank 0
		romData[0x150] = 0xAB;
		romData[0x151] = 0xCD;
		var parser = new GameBoyRomParser(romData);

		var bank0 = parser.GetRomBank(0);

		Assert.Equal(0x4000, bank0.Length);
		Assert.Equal(0xAB, bank0[0x150]);
		Assert.Equal(0xCD, bank0[0x151]);
	}

	[Fact]
	public void GetRomBank_ReturnsBank1Data() {
		var romData = CreateMinimalGameBoyRom();
		// Put some test data in bank 1
		romData[0x4000] = 0x12;
		romData[0x4001] = 0x34;
		var parser = new GameBoyRomParser(romData);

		var bank1 = parser.GetRomBank(1);

		Assert.Equal(0x4000, bank1.Length);
		Assert.Equal(0x12, bank1[0]);
		Assert.Equal(0x34, bank1[1]);
	}

	[Fact]
	public void GetRomBank_WithInvalidIndex_ThrowsArgumentOutOfRangeException() {
		var romData = CreateMinimalGameBoyRom();
		var parser = new GameBoyRomParser(romData);

		Assert.Throws<ArgumentOutOfRangeException>(() => parser.GetRomBank(99));
	}

	[Fact]
	public void CalculateHeaderChecksum_ReturnsCorrectValue() {
		var romData = CreateMinimalGameBoyRom();
		var parser = new GameBoyRomParser(romData);

		var calculatedChecksum = parser.CalculateHeaderChecksum();
		var storedChecksum = romData[0x14D];

		Assert.Equal(storedChecksum, calculatedChecksum);
	}

	[Fact]
	public void FixHeaderChecksum_CorrectsBadChecksum() {
		var romData = CreateMinimalGameBoyRom();
		// Corrupt the header checksum
		romData[0x14D] = 0x00;

		var fixedRom = GameBoyRomParser.FixHeaderChecksum(romData);

		// Verify the checksum is now valid
		var fixedParser = new GameBoyRomParser(fixedRom);
		var info = fixedParser.GetRomInfo();
		Assert.True(info.HeaderChecksumValid);
	}

	[Fact]
	public void GetRomInfo_DetectsMbc2() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0x05);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.MBC2, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsHuC1() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0xFF);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.HuC1, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsHuC3() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0xFE);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.HuC3, info.MBC);
	}

	[Fact]
	public void GetRomInfo_DetectsPocketCamera() {
		var romData = CreateMinimalGameBoyRom(mbcType: 0xFC);
		var parser = new GameBoyRomParser(romData);

		var info = parser.GetRomInfo();

		Assert.Equal(MbcType.PocketCamera, info.MBC);
	}
}
