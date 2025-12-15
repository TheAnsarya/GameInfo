using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for NesRomParser
/// </summary>
public class NesRomParserTests {
	/// <summary>
	/// Creates a minimal valid iNES ROM for testing
	/// </summary>
	private static byte[] CreateTestRom(int prgBanks = 2, int chrBanks = 1, int mapper = 0, bool trainer = false) {
		var prgSize = prgBanks * 0x4000;
		var chrSize = chrBanks * 0x2000;
		var trainerSize = trainer ? 512 : 0;
		var totalSize = 16 + trainerSize + prgSize + chrSize;

		var rom = new byte[totalSize];

		// iNES magic
		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;

		// PRG and CHR counts
		rom[4] = (byte)prgBanks;
		rom[5] = (byte)chrBanks;

		// Flags 6: lower mapper nibble + trainer flag
		rom[6] = (byte)(((mapper & 0x0f) << 4) | (trainer ? 0x04 : 0));

		// Flags 7: upper mapper nibble
		rom[7] = (byte)(mapper & 0xf0);

		// Fill PRG with pattern
		var prgStart = 16 + trainerSize;
		for (int i = 0; i < prgSize; i++) {
			rom[prgStart + i] = (byte)(i & 0xff);
		}

		// Fill CHR with pattern
		var chrStart = prgStart + prgSize;
		for (int i = 0; i < chrSize; i++) {
			rom[chrStart + i] = (byte)((i + 0x80) & 0xff);
		}

		return rom;
	}

	[Fact]
	public void ParseHeader_ValidRom_ParsesCorrectly() {
		var rom = CreateTestRom(prgBanks: 2, chrBanks: 1);
		var parser = new NesRomParser(rom);

		Assert.Equal(2, parser.PrgBankCount);
		Assert.Equal(1, parser.ChrBankCount);
		Assert.Equal(0, parser.Mapper);
		Assert.False(parser.UsesChrRam);
	}

	[Fact]
	public void ParseHeader_ChrRam_DetectedCorrectly() {
		var rom = CreateTestRom(prgBanks: 2, chrBanks: 0);
		var parser = new NesRomParser(rom);

		Assert.Equal(0, parser.ChrBankCount);
		Assert.True(parser.UsesChrRam);
	}

	[Fact]
	public void ParseHeader_MapperNumber_ParsedCorrectly() {
		// Test mapper 4 (MMC3)
		var rom = CreateTestRom(mapper: 4);
		var parser = new NesRomParser(rom);
		Assert.Equal(4, parser.Mapper);

		// Test mapper 1 (MMC1)
		rom = CreateTestRom(mapper: 1);
		parser = new NesRomParser(rom);
		Assert.Equal(1, parser.Mapper);
	}

	[Fact]
	public void ParseHeader_InvalidMagic_ThrowsException() {
		var rom = new byte[16];
		rom[0] = (byte)'B';
		rom[1] = (byte)'A';
		rom[2] = (byte)'D';
		rom[3] = 0x00;

		Assert.Throws<InvalidDataException>(() => new NesRomParser(rom));
	}

	[Fact]
	public void ParseHeader_TooSmall_ThrowsException() {
		var rom = new byte[10];
		Assert.Throws<InvalidDataException>(() => new NesRomParser(rom));
	}

	[Fact]
	public void GetPrgBank_ValidIndex_ReturnsCorrectData() {
		var rom = CreateTestRom(prgBanks: 4);
		var parser = new NesRomParser(rom);

		var bank0 = parser.GetPrgBank(0);
		var bank1 = parser.GetPrgBank(1);

		Assert.Equal(0x4000, bank0.Length);
		Assert.Equal(0x4000, bank1.Length);

		// Bank 0 should start with 0x00
		Assert.Equal(0x00, bank0[0]);
		// Bank 1 should start with 0x00 (wraps after 0xff)
		Assert.Equal(0x00, bank1[0]);
	}

	[Fact]
	public void GetPrgBank_InvalidIndex_ThrowsException() {
		var rom = CreateTestRom(prgBanks: 2);
		var parser = new NesRomParser(rom);

		Assert.Throws<ArgumentOutOfRangeException>(() => parser.GetPrgBank(-1));
		Assert.Throws<ArgumentOutOfRangeException>(() => parser.GetPrgBank(2));
	}

	[Fact]
	public void GetChrBank_ValidIndex_ReturnsCorrectData() {
		var rom = CreateTestRom(chrBanks: 2);
		var parser = new NesRomParser(rom);

		var bank0 = parser.GetChrBank(0);

		Assert.Equal(0x2000, bank0.Length);
		// CHR data starts with 0x80 pattern
		Assert.Equal(0x80, bank0[0]);
	}

	[Fact]
	public void GetChrBank_ChrRam_ThrowsException() {
		var rom = CreateTestRom(chrBanks: 0);
		var parser = new NesRomParser(rom);

		Assert.Throws<InvalidOperationException>(() => parser.GetChrBank(0));
	}

	[Fact]
	public void GetPrgRom_ReturnsAllPrgData() {
		var rom = CreateTestRom(prgBanks: 2);
		var parser = new NesRomParser(rom);

		var prg = parser.GetPrgRom();

		Assert.Equal(0x8000, prg.Length); // 2 * 16KB
	}

	[Fact]
	public void GetChrRom_ReturnsAllChrData() {
		var rom = CreateTestRom(chrBanks: 2);
		var parser = new NesRomParser(rom);

		var chr = parser.GetChrRom();

		Assert.Equal(0x4000, chr.Length); // 2 * 8KB
	}

	[Fact]
	public void GetChrRom_ChrRam_ReturnsEmpty() {
		var rom = CreateTestRom(chrBanks: 0);
		var parser = new NesRomParser(rom);

		var chr = parser.GetChrRom();

		Assert.Empty(chr);
	}

	[Fact]
	public void GetMapperLayout_Mapper0_ReturnsNROM() {
		var rom = CreateTestRom(mapper: 0);
		var parser = new NesRomParser(rom);

		var layout = parser.GetMapperLayout();

		Assert.Equal("NROM", layout.Name);
		Assert.Equal(0x8000, layout.PrgBankSize);
	}

	[Fact]
	public void GetMapperLayout_Mapper1_ReturnsMMC1() {
		var rom = CreateTestRom(mapper: 1);
		var parser = new NesRomParser(rom);

		var layout = parser.GetMapperLayout();

		Assert.Equal("MMC1", layout.Name);
		Assert.Equal(0x4000, layout.PrgBankSize);
	}

	[Fact]
	public void GetMapperLayout_Mapper4_ReturnsMMC3() {
		var rom = CreateTestRom(mapper: 4);
		var parser = new NesRomParser(rom);

		var layout = parser.GetMapperLayout();

		Assert.Equal("MMC3", layout.Name);
		Assert.Equal(0x2000, layout.PrgBankSize);
	}

	[Fact]
	public void Header_TrainerFlag_DetectedCorrectly() {
		var romWithTrainer = CreateTestRom(trainer: true);
		var parserWithTrainer = new NesRomParser(romWithTrainer);

		var romWithoutTrainer = CreateTestRom(trainer: false);
		var parserWithoutTrainer = new NesRomParser(romWithoutTrainer);

		Assert.True(parserWithTrainer.Header.HasTrainer);
		Assert.False(parserWithoutTrainer.Header.HasTrainer);
	}

	[Fact]
	public void Header_MirroringFlag_DetectedCorrectly() {
		// Create ROM with vertical mirroring (flag bit set)
		var rom = CreateTestRom();
		rom[6] |= 0x01; // Set vertical mirroring flag
		var parser = new NesRomParser(rom);

		Assert.True(parser.Header.VerticalMirroring);
	}

	[Fact]
	public void Header_BatteryFlag_DetectedCorrectly() {
		var rom = CreateTestRom();
		rom[6] |= 0x02; // Set battery flag
		var parser = new NesRomParser(rom);

		Assert.True(parser.Header.HasBattery);
	}

	[Theory]
	[InlineData(0, "NROM")]
	[InlineData(1, "MMC1")]
	[InlineData(2, "UxROM")]
	[InlineData(3, "CNROM")]
	[InlineData(4, "MMC3")]
	[InlineData(5, "MMC5")]
	[InlineData(7, "AxROM")]
	public void GetMapperLayout_KnownMappers_ReturnsCorrectNames(int mapper, string expectedName) {
		var rom = CreateTestRom(mapper: mapper);
		var parser = new NesRomParser(rom);

		var layout = parser.GetMapperLayout();

		Assert.Equal(expectedName, layout.Name);
	}

	[Fact]
	public void GetTrainer_WithTrainer_ReturnsData() {
		var rom = CreateTestRom(trainer: true);
		// Fill trainer with pattern
		for (int i = 0; i < 512; i++) {
			rom[16 + i] = 0xaa;
		}

		var parser = new NesRomParser(rom);
		var trainer = parser.GetTrainer();

		Assert.NotNull(trainer);
		Assert.Equal(512, trainer.Length);
		Assert.Equal(0xaa, trainer[0]);
	}

	[Fact]
	public void GetTrainer_WithoutTrainer_ReturnsNull() {
		var rom = CreateTestRom(trainer: false);
		var parser = new NesRomParser(rom);

		var trainer = parser.GetTrainer();

		Assert.Null(trainer);
	}

	[Fact]
	public void BuildInesHeader_RoundTrip_PreservesData() {
		var originalRom = CreateTestRom(prgBanks: 4, chrBanks: 2, mapper: 4);
		originalRom[6] |= 0x03; // Add mirroring and battery flags

		var parser = new NesRomParser(originalRom);
		var rebuilt = NesRomParser.BuildInesHeader(parser.Header);

		// First 8 bytes should match
		for (int i = 0; i < 8; i++) {
			Assert.Equal(originalRom[i], rebuilt[i]);
		}
	}

	[Fact]
	public void PrgBankCount_CalculatedCorrectly() {
		var rom = CreateTestRom(prgBanks: 8);
		var parser = new NesRomParser(rom);

		Assert.Equal(8, parser.PrgBankCount);
	}

	[Fact]
	public void ChrBankCount_CalculatedCorrectly() {
		var rom = CreateTestRom(chrBanks: 4);
		var parser = new NesRomParser(rom);

		Assert.Equal(4, parser.ChrBankCount);
	}
}
