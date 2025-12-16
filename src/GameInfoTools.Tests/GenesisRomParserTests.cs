using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for GenesisRomParser
/// </summary>
public class GenesisRomParserTests {
	/// <summary>
	/// Create a minimal valid Genesis ROM
	/// </summary>
	private static byte[] CreateGenesisRom(string domesticName = "TEST GAME", string overseasName = "TEST GAME OVERSEAS") {
		// Minimum Genesis ROM: 512KB
		var romSize = 0x80000;
		var rom = new byte[romSize];

		// Genesis header at $100-$1FF

		// Console name at $100 (16 bytes) - "SEGA GENESIS" or "SEGA MEGA DRIVE"
		var consoleName = "SEGA GENESIS    ";
		var consoleBytes = System.Text.Encoding.ASCII.GetBytes(consoleName);
		Array.Copy(consoleBytes, 0, rom, 0x100, Math.Min(consoleBytes.Length, 16));

		// Copyright at $110 (16 bytes)
		var copyright = "(C)SEGA 1993.NOV";
		var copyrightBytes = System.Text.Encoding.ASCII.GetBytes(copyright);
		Array.Copy(copyrightBytes, 0, rom, 0x110, Math.Min(copyrightBytes.Length, 16));

		// Domestic name at $120 (48 bytes)
		var domBytes = System.Text.Encoding.ASCII.GetBytes(domesticName.PadRight(48));
		Array.Copy(domBytes, 0, rom, 0x120, Math.Min(domBytes.Length, 48));

		// Overseas name at $150 (48 bytes)
		var overBytes = System.Text.Encoding.ASCII.GetBytes(overseasName.PadRight(48));
		Array.Copy(overBytes, 0, rom, 0x150, Math.Min(overBytes.Length, 48));

		// Product code at $180 (14 bytes)
		var productCode = "GM 00000000-00";
		var productBytes = System.Text.Encoding.ASCII.GetBytes(productCode);
		Array.Copy(productBytes, 0, rom, 0x180, Math.Min(productBytes.Length, 14));

		// Checksum at $18e (big-endian) - placeholder
		rom[0x18e] = 0x00;
		rom[0x18f] = 0x00;

		// I/O support at $190 (16 bytes)
		var ioSupport = "J               ";
		var ioBytes = System.Text.Encoding.ASCII.GetBytes(ioSupport);
		Array.Copy(ioBytes, 0, rom, 0x190, Math.Min(ioBytes.Length, 16));

		// ROM start at $1a0 (big-endian)
		rom[0x1a0] = 0x00;
		rom[0x1a1] = 0x00;
		rom[0x1a2] = 0x00;
		rom[0x1a3] = 0x00;

		// ROM end at $1a4 (big-endian)
		var romEnd = romSize - 1;
		rom[0x1a4] = (byte)((romEnd >> 24) & 0xff);
		rom[0x1a5] = (byte)((romEnd >> 16) & 0xff);
		rom[0x1a6] = (byte)((romEnd >> 8) & 0xff);
		rom[0x1a7] = (byte)(romEnd & 0xff);

		// RAM start at $1a8
		rom[0x1a8] = 0x00;
		rom[0x1a9] = 0xff;
		rom[0x1aa] = 0x00;
		rom[0x1ab] = 0x00;

		// RAM end at $1ac
		rom[0x1ac] = 0x00;
		rom[0x1ad] = 0xff;
		rom[0x1ae] = 0xff;
		rom[0x1af] = 0xff;

		// SRAM info at $1b0 (12 bytes) - no SRAM
		var sramInfo = "            ";
		var sramBytes = System.Text.Encoding.ASCII.GetBytes(sramInfo);
		Array.Copy(sramBytes, 0, rom, 0x1b0, Math.Min(sramBytes.Length, 12));

		// Region at $1f0 (16 bytes)
		var region = "JUE             ";
		var regionBytes = System.Text.Encoding.ASCII.GetBytes(region);
		Array.Copy(regionBytes, 0, rom, 0x1f0, Math.Min(regionBytes.Length, 16));

		// Vectors at start of ROM
		// Initial stack pointer at $000
		rom[0x00] = 0x00;
		rom[0x01] = 0xff;
		rom[0x02] = 0xff;
		rom[0x03] = 0xfe;

		// Reset vector at $004
		rom[0x04] = 0x00;
		rom[0x05] = 0x00;
		rom[0x06] = 0x02;
		rom[0x07] = 0x00;

		return rom;
	}

	[Fact]
	public void Parse_ValidHeader_ExtractsCorrectly() {
		var rom = CreateGenesisRom("SONIC THE HEDGEHOG");
		var parser = new GenesisRomParser(rom);

		Assert.True(parser.Header.IsValid);
		Assert.Contains("SEGA", parser.Header.ConsoleName);
		Assert.Contains("SONIC THE HEDGEHOG", parser.Header.DomesticName);
	}

	[Fact]
	public void Parse_DomesticAndOverseasNames_Correct() {
		var rom = CreateGenesisRom("JAPANESE NAME", "OVERSEAS NAME");
		var parser = new GenesisRomParser(rom);

		Assert.Contains("JAPANESE NAME", parser.Header.DomesticName);
		Assert.Contains("OVERSEAS NAME", parser.Header.OverseasName);
	}

	[Fact]
	public void Parse_ProductCode_Correct() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		Assert.Contains("GM 00000000", parser.Header.ProductCode);
	}

	[Fact]
	public void Parse_Region_Correct() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		Assert.True(parser.Header.Region.HasFlag(GenesisRegion.Japan));
		Assert.True(parser.Header.Region.HasFlag(GenesisRegion.Usa));
		Assert.True(parser.Header.Region.HasFlag(GenesisRegion.Europe));
	}

	[Fact]
	public void RomSize_CorrectValue() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		Assert.Equal(0x80000, parser.RomSize);
	}

	[Fact]
	public void BankCount_Correct() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		// 512KB / 64KB = 8 banks
		Assert.Equal(8, parser.BankCount);
	}

	[Fact]
	public void GetBank_ReturnsCorrectData() {
		var rom = CreateGenesisRom();
		// Write test data at bank 1 start
		rom[0x10000] = 0xde;
		rom[0x10001] = 0xad;
		rom[0x10002] = 0xbe;
		rom[0x10003] = 0xef;

		var parser = new GenesisRomParser(rom);
		var bank1 = parser.GetBank(1);

		Assert.Equal(0x10000, bank1.Length);
		Assert.Equal(0xde, bank1[0]);
		Assert.Equal(0xad, bank1[1]);
		Assert.Equal(0xbe, bank1[2]);
		Assert.Equal(0xef, bank1[3]);
	}

	[Fact]
	public void GetBank_InvalidIndex_ThrowsException() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		Assert.Throws<ArgumentOutOfRangeException>(() => parser.GetBank(999));
	}

	[Fact]
	public void CalculateChecksum_ReturnsValue() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		var checksum = parser.CalculateChecksum();

		Assert.InRange(checksum, (ushort)0, (ushort)0xffff);
	}

	[Fact]
	public void FixChecksum_UpdatesHeader() {
		var rom = CreateGenesisRom();

		var fixedRom = GenesisRomParser.FixChecksum(rom);
		var parser = new GenesisRomParser(fixedRom);

		Assert.True(parser.VerifyChecksum());
	}

	[Fact]
	public void GetRomData_ReturnsCopy() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		var data = parser.GetRomData();

		Assert.Equal(rom.Length, data.Length);
		Assert.NotSame(rom, data);
	}

	[Fact]
	public void GetRomInfo_ReturnsCorrectInfo() {
		var rom = CreateGenesisRom("TEST GAME");
		var parser = new GenesisRomParser(rom);

		var info = parser.GetRomInfo();

		Assert.Contains("TEST GAME", info.DomesticName);
		Assert.Equal(0x80000, info.RomSize);
		Assert.Equal(8, info.BankCount);
		Assert.False(info.HasSram);
	}

	[Fact]
	public void Header_Sram_DetectedWhenPresent() {
		var rom = CreateGenesisRom();
		// Set SRAM info to indicate SRAM present
		var sramInfo = "RA F8200020";
		var sramBytes = System.Text.Encoding.ASCII.GetBytes(sramInfo);
		Array.Copy(sramBytes, 0, rom, 0x1b0, Math.Min(sramBytes.Length, 12));

		var parser = new GenesisRomParser(rom);

		Assert.True(parser.Header.HasSram);
	}

	[Fact]
	public void Header_NoSram_WhenNotPresent() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		Assert.False(parser.Header.HasSram);
	}

	[Fact]
	public void WasSmdFormat_FalseForStandardRom() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		Assert.False(parser.WasSmdFormat);
	}

	[Fact]
	public void ToSmdFormat_CreatesInterleavedRom() {
		var rom = CreateGenesisRom();
		var parser = new GenesisRomParser(rom);

		var smdRom = parser.ToSmdFormat();

		// SMD should have 512-byte header + interleaved data
		Assert.Equal(rom.Length + 512, smdRom.Length);

		// Check SMD markers
		Assert.Equal(0xaa, smdRom[8]);
		Assert.Equal(0xbb, smdRom[9]);
	}

	[Fact]
	public void Parse_InvalidRom_StillParses() {
		var rom = new byte[1000]; // Too small but should still try
		var parser = new GenesisRomParser(rom);

		// Should not throw, just have invalid header
		Assert.False(parser.Header.IsValid);
	}
}
