using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for AddressConverter, verifying address space conversions
/// between file offsets and CPU addresses for NES, SNES, and other systems.
/// </summary>
public class AddressConverterTests {
	[Theory]
	[InlineData(0x8000, 1, 0, 0x10)] // Bank 0, PRG $8000
	[InlineData(0x8000, 2, 0, 0x10)] // Bank 0 with 2 banks
	[InlineData(0x8000, 2, 1, 0x4010)] // Bank 1 with 2 banks
	public void NesCpuToFile_ConvertsCorrectly(int cpuAddr, int bankCount, int currentBank, int expected) {
		int result = AddressConverter.NesCpuToFile(cpuAddr, bankCount, currentBank);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0x10, 16, 0x8000, 0)] // Start of ROM data
	public void NesFileToCpu_ConvertsCorrectly(int fileOffset, int headerSize, int expectedCpu, int expectedBank) {
		var (cpuAddr, bank) = AddressConverter.NesFileToCpu(fileOffset, headerSize);
		Assert.Equal(expectedCpu, cpuAddr);
		Assert.Equal(expectedBank, bank);
	}

	[Theory]
	[InlineData(0x008000, 0, 0x0000)] // Bank 0
	[InlineData(0x018000, 0, 0x8000)] // Bank 1
	[InlineData(0x008000, 0x200, 0x0200)] // With header
	public void SnesLoRomToFile_ConvertsCorrectly(int snesAddr, int headerSize, int expected) {
		int result = AddressConverter.SnesLoRomToFile(snesAddr, headerSize);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0x0000, 0, 0x008000)] // Start
	[InlineData(0x8000, 0, 0x018000)] // Bank 1
	public void SnesFileToLoRom_ConvertsCorrectly(int fileOffset, int headerSize, int expected) {
		int result = AddressConverter.SnesFileToLoRom(fileOffset, headerSize);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0xc00000, 0, 0x0000)] // HiROM Bank 0
	[InlineData(0xc08000, 0, 0x8000)] // HiROM offset
	public void SnesHiRomToFile_ConvertsCorrectly(int snesAddr, int headerSize, int expected) {
		int result = AddressConverter.SnesHiRomToFile(snesAddr, headerSize);
		Assert.Equal(expected, result);
	}

	[Fact]
	public void ParseHex_ParsesVariousFormats() {
		Assert.Equal(0xcafe, AddressConverter.ParseHex("$cafe"));
		Assert.Equal(0xdead, AddressConverter.ParseHex("0xdead"));
		Assert.Equal(0xbeef, AddressConverter.ParseHex("beef"));
	}

	[Theory]
	[InlineData(0x1234, 4, "$1234")]
	[InlineData(0xab, 2, "$ab")]
	[InlineData(0x1, 4, "$0001")]
	public void ToHex_FormatsCorrectly(int value, int digits, string expected) {
		string result = AddressConverter.ToHex(value, digits);
		Assert.Equal(expected, result);
	}

	#region Game Boy Tests

	[Theory]
	[InlineData(0x0000, 1, 0x0000)]  // Bank 0 start
	[InlineData(0x3fff, 1, 0x3fff)]  // Bank 0 end
	[InlineData(0x4000, 1, 0x4000)]  // Bank 1 start
	[InlineData(0x7fff, 1, 0x7fff)]  // Bank 1 end
	[InlineData(0x4000, 2, 0x8000)]  // Bank 2 start
	[InlineData(0x7fff, 2, 0xbfff)]  // Bank 2 end
	public void GameBoyToFile_ConvertsCorrectly(int gbAddress, int bank, int expectedFile) {
		int result = AddressConverter.GameBoyToFile(gbAddress, bank);
		Assert.Equal(expectedFile, result);
	}

	[Theory]
	[InlineData(0x0000, 0x0000, 0)]  // Bank 0
	[InlineData(0x3fff, 0x3fff, 0)]  // Bank 0 end
	[InlineData(0x4000, 0x4000, 1)]  // Bank 1
	[InlineData(0x8000, 0x4000, 2)]  // Bank 2
	[InlineData(0xc000, 0x4000, 3)]  // Bank 3
	public void GameBoyFileToAddress_ConvertsCorrectly(int fileOffset, int expectedGb, int expectedBank) {
		var (gbAddr, bank) = AddressConverter.GameBoyFileToAddress(fileOffset);
		Assert.Equal(expectedGb, gbAddr);
		Assert.Equal(expectedBank, bank);
	}

	[Theory]
	[InlineData(0x0000, 0)]
	[InlineData(0x3fff, 0)]
	[InlineData(0x4000, 1)]
	[InlineData(0x8000, 2)]
	[InlineData(0xffff, 3)]
	public void GameBoyGetBank_ReturnsCorrectBank(int fileOffset, int expectedBank) {
		int result = AddressConverter.GameBoyGetBank(fileOffset);
		Assert.Equal(expectedBank, result);
	}

	[Theory]
	[InlineData(0x8000, 2)]    // 32KB = 2 banks
	[InlineData(0x10000, 4)]   // 64KB = 4 banks
	[InlineData(0x80000, 32)]  // 512KB = 32 banks
	public void GameBoyBankCount_CalculatesCorrectly(int romSize, int expectedBanks) {
		int result = AddressConverter.GameBoyBankCount(romSize);
		Assert.Equal(expectedBanks, result);
	}

	[Theory]
	[InlineData(0x00, "ROM Only")]
	[InlineData(0x01, "MBC1")]
	[InlineData(0x03, "MBC1+RAM+Battery")]
	[InlineData(0x13, "MBC3+RAM+Battery")]
	[InlineData(0x19, "MBC5")]
	public void GameBoyMbcType_ReturnsCorrectName(byte cartridgeType, string expectedName) {
		string result = AddressConverter.GameBoyMbcType(cartridgeType);
		Assert.Equal(expectedName, result);
	}

	[Fact]
	public void GameBoyToFile_ThrowsForInvalidAddress() {
		Assert.Throws<ArgumentException>(() => AddressConverter.GameBoyToFile(0x8000, 1));
	}

	#endregion

	#region GBA Tests

	[Theory]
	[InlineData(0x00000000u, AddressConverter.GbaMemoryRegion.Bios)]
	[InlineData(0x02000000u, AddressConverter.GbaMemoryRegion.Ewram)]
	[InlineData(0x03000000u, AddressConverter.GbaMemoryRegion.Iwram)]
	[InlineData(0x04000000u, AddressConverter.GbaMemoryRegion.IoRegs)]
	[InlineData(0x05000000u, AddressConverter.GbaMemoryRegion.Palette)]
	[InlineData(0x06000000u, AddressConverter.GbaMemoryRegion.Vram)]
	[InlineData(0x07000000u, AddressConverter.GbaMemoryRegion.Oam)]
	[InlineData(0x08000000u, AddressConverter.GbaMemoryRegion.Rom)]
	[InlineData(0x09000000u, AddressConverter.GbaMemoryRegion.Rom)]
	[InlineData(0x0a000000u, AddressConverter.GbaMemoryRegion.Rom)]
	[InlineData(0x0e000000u, AddressConverter.GbaMemoryRegion.Sram)]
	public void GbaGetRegion_IdentifiesRegionCorrectly(uint address, AddressConverter.GbaMemoryRegion expectedRegion) {
		var result = AddressConverter.GbaGetRegion(address);
		Assert.Equal(expectedRegion, result);
	}

	[Theory]
	[InlineData(0x08000000u, 0x00000000)]
	[InlineData(0x08001234u, 0x00001234)]
	[InlineData(0x09000000u, 0x01000000)]
	[InlineData(0x0a123456u, 0x00123456)]
	public void GbaRomToFile_ConvertsCorrectly(uint gbaAddress, int expectedFile) {
		int result = AddressConverter.GbaRomToFile(gbaAddress);
		Assert.Equal(expectedFile, result);
	}

	[Theory]
	[InlineData(0x00000000, 0x08000000u)]
	[InlineData(0x00001234, 0x08001234u)]
	[InlineData(0x01000000, 0x09000000u)]
	public void GbaFileToRom_ConvertsCorrectly(int fileOffset, uint expectedGba) {
		uint result = AddressConverter.GbaFileToRom(fileOffset);
		Assert.Equal(expectedGba, result);
	}

	[Fact]
	public void GbaRomToFile_ThrowsForNonRomAddress() {
		Assert.Throws<ArgumentException>(() => AddressConverter.GbaRomToFile(0x02000000));
	}

	[Theory]
	[InlineData(0x02000000u, 0x00000)]
	[InlineData(0x02012345u, 0x12345)]
	public void GbaEwramToOffset_ConvertsCorrectly(uint address, int expectedOffset) {
		int result = AddressConverter.GbaEwramToOffset(address);
		Assert.Equal(expectedOffset, result);
	}

	[Theory]
	[InlineData(0x03000000u, 0x0000)]
	[InlineData(0x03001234u, 0x1234)]
	public void GbaIwramToOffset_ConvertsCorrectly(uint address, int expectedOffset) {
		int result = AddressConverter.GbaIwramToOffset(address);
		Assert.Equal(expectedOffset, result);
	}

	[Theory]
	[InlineData(0x06000000u, 0x00000)]
	[InlineData(0x06012345u, 0x12345)]
	public void GbaVramToOffset_ConvertsCorrectly(uint address, int expectedOffset) {
		int result = AddressConverter.GbaVramToOffset(address);
		Assert.Equal(expectedOffset, result);
	}

	[Theory]
	[InlineData(AddressConverter.GbaMemoryRegion.Bios, 0x4000)]
	[InlineData(AddressConverter.GbaMemoryRegion.Ewram, 0x40000)]
	[InlineData(AddressConverter.GbaMemoryRegion.Iwram, 0x8000)]
	[InlineData(AddressConverter.GbaMemoryRegion.Rom, 0x2000000)]
	public void GbaRegionSize_ReturnsCorrectSize(AddressConverter.GbaMemoryRegion region, int expectedSize) {
		int result = AddressConverter.GbaRegionSize(region);
		Assert.Equal(expectedSize, result);
	}

	[Theory]
	[InlineData(AddressConverter.GbaMemoryRegion.Bios, 0x00000000u)]
	[InlineData(AddressConverter.GbaMemoryRegion.Rom, 0x08000000u)]
	[InlineData(AddressConverter.GbaMemoryRegion.Sram, 0x0e000000u)]
	public void GbaRegionBase_ReturnsCorrectBase(AddressConverter.GbaMemoryRegion region, uint expectedBase) {
		uint result = AddressConverter.GbaRegionBase(region);
		Assert.Equal(expectedBase, result);
	}

	[Theory]
	[InlineData(0x08001234u, "ROM:$08001234")]
	[InlineData(0x02000000u, "EWRAM:$02000000")]
	[InlineData(0x03007fffu, "IWRAM:$03007fff")]
	public void GbaFormatAddress_FormatsCorrectly(uint address, string expected) {
		string result = AddressConverter.GbaFormatAddress(address);
		Assert.Equal(expected, result);
	}

	#endregion

	#region Generic Conversion Tests

	[Fact]
	public void ConvertAddress_NES_FileToAddress() {
		var result = AddressConverter.ConvertAddress(0x10, SystemType.Nes, isFileOffset: true);

		Assert.Equal(0x10, result.FileOffset);
		Assert.Equal(0x8000, result.CpuAddress);
		Assert.Equal(SystemType.Nes, result.System);
	}

	[Fact]
	public void ConvertAddress_GameBoy_FileToAddress() {
		var result = AddressConverter.ConvertAddress(0x4000, SystemType.GameBoy, isFileOffset: true);

		Assert.Equal(0x4000, result.FileOffset);
		Assert.Equal(0x4000, result.CpuAddress);
		Assert.Equal(1, result.Bank);
	}

	[Fact]
	public void ConvertAddress_GBA_FileToAddress() {
		var result = AddressConverter.ConvertAddress(0x1234, SystemType.GameBoyAdvance, isFileOffset: true);

		Assert.Equal(0x1234, result.FileOffset);
		Assert.Equal(0x08001234, result.CpuAddress);
	}

	[Fact]
	public void ConvertAddress_SNES_LoRom() {
		var result = AddressConverter.ConvertAddress(0x8000, SystemType.Snes, isFileOffset: true, isHiRom: false);

		Assert.Equal(0x8000, result.FileOffset);
		Assert.Equal(0x018000, result.CpuAddress);
	}

	[Fact]
	public void ConvertAddress_SNES_HiRom() {
		var result = AddressConverter.ConvertAddress(0x0000, SystemType.Snes, isFileOffset: true, isHiRom: true);

		Assert.Equal(0x0000, result.FileOffset);
		Assert.Equal(0xc00000, result.CpuAddress);
	}

	#endregion
}
