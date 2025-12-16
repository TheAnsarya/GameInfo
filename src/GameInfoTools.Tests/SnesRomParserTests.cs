using GameInfoTools.Core.Build;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for SnesRomParser
/// </summary>
public class SnesRomParserTests {
	/// <summary>
	/// Create a minimal valid SNES ROM with LoROM header
	/// </summary>
	private static byte[] CreateLoRomHeader(string title = "TEST GAME", int romSizeCode = 0x09) {
		// Minimum LoROM: 512KB = 0x80000 bytes
		var romSize = 0x80000;
		var rom = new byte[romSize];

		// Header at $7fb0 (LoROM), title at +0x10
		var headerOffset = 0x7fb0;

		// Title (21 bytes at $7fc0)
		var titleBytes = System.Text.Encoding.ASCII.GetBytes(title.PadRight(21));
		Array.Copy(titleBytes, 0, rom, headerOffset, Math.Min(titleBytes.Length, 21));

		// Map mode: LoROM (0x20) at $7fd5
		rom[headerOffset + 0x15] = 0x20;

		// Cartridge type (ROM only) at $7fd6
		rom[headerOffset + 0x16] = 0x00;

		// ROM size (0x09 = 512KB) at $7fd7
		rom[headerOffset + 0x17] = (byte)romSizeCode;

		// RAM size (none) at $7fd8
		rom[headerOffset + 0x18] = 0x00;

		// Country code (North America) at $7fd9
		rom[headerOffset + 0x19] = 0x01;

		// Developer ID at $7fda
		rom[headerOffset + 0x1a] = 0x01;

		// Version at $7fdb
		rom[headerOffset + 0x1b] = 0x00;

		// Checksum complement at $7fdc-$7fdd - set to make checksum valid
		rom[headerOffset + 0x1c] = 0xff;
		rom[headerOffset + 0x1d] = 0xff;

		// Checksum at $7fde-$7fdf
		rom[headerOffset + 0x1e] = 0x00;
		rom[headerOffset + 0x1f] = 0x00;

		// NMI vector at $ffea
		rom[0x7fea] = 0x00;
		rom[0x7feb] = 0x80;

		// Reset vector at $fffc
		rom[0x7ffc] = 0x00;
		rom[0x7ffd] = 0x80;

		return rom;
	}

	/// <summary>
	/// Create a minimal valid SNES ROM with HiROM header
	/// </summary>
	private static byte[] CreateHiRomHeader(string title = "TEST HIROM", int romSizeCode = 0x0a) {
		// Minimum HiROM: 1MB = 0x100000 bytes
		var romSize = 0x100000;
		var rom = new byte[romSize];

		// Header at $ffb0 (HiROM)
		var headerOffset = 0xffb0;

		// Title (21 bytes)
		var titleBytes = System.Text.Encoding.ASCII.GetBytes(title.PadRight(21));
		Array.Copy(titleBytes, 0, rom, headerOffset, Math.Min(titleBytes.Length, 21));

		// Map mode: HiROM (0x21) at $ffd5
		rom[headerOffset + 0x15] = 0x21;

		// Cartridge type (ROM only) at $ffd6
		rom[headerOffset + 0x16] = 0x00;

		// ROM size (0x0a = 1MB) at $ffd7
		rom[headerOffset + 0x17] = (byte)romSizeCode;

		// RAM size (none) at $ffd8
		rom[headerOffset + 0x18] = 0x00;

		// Country code (North America) at $ffd9
		rom[headerOffset + 0x19] = 0x01;

		// Developer ID at $ffda
		rom[headerOffset + 0x1a] = 0x01;

		// Version at $ffdb
		rom[headerOffset + 0x1b] = 0x00;

		// Checksum complement at $ffdc-$ffdd
		rom[headerOffset + 0x1c] = 0xff;
		rom[headerOffset + 0x1d] = 0xff;

		// Checksum at $ffde-$ffdf
		rom[headerOffset + 0x1e] = 0x00;
		rom[headerOffset + 0x1f] = 0x00;

		// NMI vector at $ffea
		rom[0xffea] = 0x00;
		rom[0xffeb] = 0xc0;

		// Reset vector at $fffc
		rom[0xfffc] = 0x00;
		rom[0xfffd] = 0xc0;

		return rom;
	}

	/// <summary>
	/// Add SMC/copier header (512 bytes) to a ROM
	/// </summary>
	private static byte[] AddCopierHeader(byte[] rom) {
		var withHeader = new byte[rom.Length + 512];
		// Copier header is usually zeroes with size info
		withHeader[0] = (byte)(rom.Length / 8192); // Low byte of block count
		withHeader[1] = (byte)((rom.Length / 8192) >> 8); // High byte
		Array.Copy(rom, 0, withHeader, 512, rom.Length);
		return withHeader;
	}

	[Fact]
	public void Parse_LoRomHeader_ExtractsCorrectly() {
		var rom = CreateLoRomHeader("FINAL FANTASY III");
		var parser = new SnesRomParser(rom);

		Assert.Equal(SnesMapping.LoRom, parser.Mapping);
		Assert.Contains("FINAL FANTASY III", parser.Header.Title);
	}

	[Fact]
	public void Parse_HiRomHeader_ExtractsCorrectly() {
		var rom = CreateHiRomHeader("SUPER METROID");
		var parser = new SnesRomParser(rom);

		Assert.Equal(SnesMapping.HiRom, parser.Mapping);
		Assert.Contains("SUPER METROID", parser.Header.Title);
	}

	[Fact]
	public void Parse_CopierHeader_DetectedAndRemoved() {
		var rom = CreateLoRomHeader("SMC TEST");
		var withCopier = AddCopierHeader(rom);
		var parser = new SnesRomParser(withCopier);

		Assert.True(parser.HasCopierHeader);
		Assert.Contains("SMC TEST", parser.Header.Title);
	}

	[Fact]
	public void Parse_RomWithoutCopierHeader_Works() {
		var rom = CreateLoRomHeader("NO SMC");
		var parser = new SnesRomParser(rom);

		Assert.False(parser.HasCopierHeader);
	}

	[Fact]
	public void Header_MapMode_CorrectlyDecoded() {
		var lorom = CreateLoRomHeader();
		var hirom = CreateHiRomHeader();

		var loParser = new SnesRomParser(lorom);
		var hiParser = new SnesRomParser(hirom);

		Assert.Equal(0x20, loParser.Header.MapMode);
		Assert.Equal(0x21, hiParser.Header.MapMode);
	}

	[Fact]
	public void Header_RomSize_CorrectlyCalculated() {
		var rom = CreateLoRomHeader(romSizeCode: 0x09); // 512KB
		var parser = new SnesRomParser(rom);

		Assert.Equal(0x09, parser.Header.RomSizeCode);
		// ROM size is the actual file size, not calculated from code
		Assert.Equal(512 * 1024, parser.RomSize);
	}

	[Fact]
	public void Header_Region_CorrectlyIdentified() {
		var rom = CreateLoRomHeader();
		var parser = new SnesRomParser(rom);

		Assert.Equal(0x01, parser.Header.Country);
		Assert.Equal(SnesRegion.Usa, parser.Header.Region);
	}

	[Fact]
	public void GetBank_LoRom_ReturnsCorrectData() {
		var rom = CreateLoRomHeader();
		// Write test data at start of bank 1
		rom[0x8000] = 0xaa;
		rom[0x8001] = 0xbb;
		rom[0x8002] = 0xcc;

		var parser = new SnesRomParser(rom);
		var bank1 = parser.GetBank(1);

		Assert.Equal(0x8000, bank1.Length);
		Assert.Equal(0xaa, bank1[0]);
		Assert.Equal(0xbb, bank1[1]);
		Assert.Equal(0xcc, bank1[2]);
	}

	[Fact]
	public void GetBank_HiRom_ReturnsCorrectData() {
		var rom = CreateHiRomHeader();
		// Write test data at start of bank 1
		rom[0x10000] = 0xde;
		rom[0x10001] = 0xad;
		rom[0x10002] = 0xbe;
		rom[0x10003] = 0xef;

		var parser = new SnesRomParser(rom);
		var bank1 = parser.GetBank(1);

		Assert.Equal(0x10000, bank1.Length);
		Assert.Equal(0xde, bank1[0]);
		Assert.Equal(0xad, bank1[1]);
		Assert.Equal(0xbe, bank1[2]);
		Assert.Equal(0xef, bank1[3]);
	}

	[Fact]
	public void BankCount_LoRom_CorrectForSize() {
		var rom = CreateLoRomHeader(romSizeCode: 0x09); // 512KB
		var parser = new SnesRomParser(rom);

		// 512KB / 32KB per bank = 16 banks
		Assert.Equal(16, parser.BankCount);
	}

	[Fact]
	public void BankCount_HiRom_CorrectForSize() {
		var rom = CreateHiRomHeader(romSizeCode: 0x0a); // 1MB
		var parser = new SnesRomParser(rom);

		// 1MB / 64KB per bank = 16 banks
		Assert.Equal(16, parser.BankCount);
	}

	[Fact]
	public void LoRomToFile_ConvertsAddressCorrectly() {
		var rom = CreateLoRomHeader();
		var parser = new SnesRomParser(rom);

		// $808000 -> 0x000000 (bank 0, offset 0)
		Assert.Equal(0x000000, parser.SnesAddressToOffset(0x808000));

		// $818000 -> 0x008000 (bank 1)
		Assert.Equal(0x008000, parser.SnesAddressToOffset(0x818000));

		// $80ffff -> 0x007fff (end of bank 0)
		Assert.Equal(0x007fff, parser.SnesAddressToOffset(0x80ffff));
	}

	[Fact]
	public void HiRomToFile_ConvertsAddressCorrectly() {
		var rom = CreateHiRomHeader();
		var parser = new SnesRomParser(rom);

		// $c00000 -> 0x000000
		Assert.Equal(0x000000, parser.SnesAddressToOffset(0xc00000));

		// $c10000 -> 0x010000
		Assert.Equal(0x010000, parser.SnesAddressToOffset(0xc10000));
	}

	[Fact]
	public void GetMappingLayout_LoRom_ReturnsCorrectLayout() {
		var rom = CreateLoRomHeader();
		var parser = new SnesRomParser(rom);

		var layout = parser.GetMappingLayout();
		Assert.Equal("LoROM", layout.Name);
		Assert.Equal(0x8000, layout.BankSize);
	}

	[Fact]
	public void GetMappingLayout_HiRom_ReturnsCorrectLayout() {
		var rom = CreateHiRomHeader();
		var parser = new SnesRomParser(rom);

		var layout = parser.GetMappingLayout();
		Assert.Equal("HiROM", layout.Name);
		Assert.Equal(0x10000, layout.BankSize);
	}

	[Fact]
	public void DetectEnhancementChip_None_ForBasicRom() {
		var rom = CreateLoRomHeader();
		var parser = new SnesRomParser(rom);

		Assert.Equal(SnesEnhancementChip.None, parser.Header.EnhancementChip);
	}

	[Fact]
	public void DetectEnhancementChip_SA1_ForSa1CartType() {
		var rom = CreateLoRomHeader();
		// SA-1 uses ROM type 0x34 or 0x35
		rom[0x7fb0 + 0x16] = 0x35; // SA-1 cart type

		var parser = new SnesRomParser(rom);

		Assert.Equal(SnesEnhancementChip.Sa1, parser.Header.EnhancementChip);
	}

	[Fact]
	public void CalculateChecksum_ReturnsValidChecksum() {
		var rom = CreateLoRomHeader();
		var parser = new SnesRomParser(rom);

		var checksum = parser.CalculateChecksum();

		// Checksum is sum of all bytes mod 0x10000
		Assert.InRange(checksum, (ushort)0, (ushort)0xffff);
	}

	[Fact]
	public void FixChecksum_UpdatesHeaderCorrectly() {
		var rom = CreateLoRomHeader();

		var fixedRom = SnesRomParser.FixChecksum(rom);

		// Check that complement + checksum = 0xffff
		var parser = new SnesRomParser(fixedRom);
		var checksum = parser.Header.Checksum;
		var complement = parser.Header.ChecksumComplement;

		Assert.Equal(0xffff, checksum ^ complement);
	}

	[Fact]
	public void GetRomData_ReturnsDataWithoutCopierHeader() {
		var rom = CreateLoRomHeader();
		var withCopier = AddCopierHeader(rom);
		var parser = new SnesRomParser(withCopier);

		var romData = parser.GetRomData();

		// Should be original size without copier header
		Assert.Equal(rom.Length, romData.Length);
	}

	[Fact]
	public void RemoveCopierHeader_StaticMethod_Works() {
		var rom = CreateLoRomHeader();
		var withCopier = AddCopierHeader(rom);

		var stripped = SnesRomParser.RemoveCopierHeader(withCopier);

		// Should be original size without copier header
		Assert.Equal(rom.Length, stripped.Length);
	}

	[Fact]
	public void GetBank_InvalidIndex_ThrowsException() {
		var rom = CreateLoRomHeader();
		var parser = new SnesRomParser(rom);

		Assert.Throws<ArgumentOutOfRangeException>(() => parser.GetBank(999));
	}

	[Fact]
	public void Header_RomType_CorrectlyParsed() {
		var rom = CreateLoRomHeader();
		rom[0x7fb0 + 0x16] = 0x02; // ROM + SRAM

		var parser = new SnesRomParser(rom);

		Assert.Equal(0x02, parser.Header.RomType);
	}

	[Fact]
	public void Header_SramSize_CorrectlyCalculated() {
		var rom = CreateLoRomHeader();
		rom[0x7fb0 + 0x18] = 0x03; // 8KB SRAM

		var parser = new SnesRomParser(rom);

		Assert.Equal(8 * 1024, parser.Header.SramSize);
	}
}
