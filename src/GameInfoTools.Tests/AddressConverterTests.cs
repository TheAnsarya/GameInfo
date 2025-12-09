using GameInfoTools.Core;

namespace GameInfoTools.Tests;

public class AddressConverterTests
{
	[Theory]
	[InlineData(0x8000, 1, 0, 0x10)] // Bank 0, PRG $8000
	[InlineData(0x8000, 2, 0, 0x10)] // Bank 0 with 2 banks
	[InlineData(0x8000, 2, 1, 0x4010)] // Bank 1 with 2 banks
	public void NesCpuToFile_ConvertsCorrectly(int cpuAddr, int bankCount, int currentBank, int expected)
	{
		int result = AddressConverter.NesCpuToFile(cpuAddr, bankCount, currentBank);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0x10, 16, 0x8000, 0)] // Start of ROM data
	public void NesFileToCpu_ConvertsCorrectly(int fileOffset, int headerSize, int expectedCpu, int expectedBank)
	{
		var (cpuAddr, bank) = AddressConverter.NesFileToCpu(fileOffset, headerSize);
		Assert.Equal(expectedCpu, cpuAddr);
		Assert.Equal(expectedBank, bank);
	}

	[Theory]
	[InlineData(0x008000, 0, 0x0000)] // Bank 0
	[InlineData(0x018000, 0, 0x8000)] // Bank 1
	[InlineData(0x008000, 0x200, 0x0200)] // With header
	public void SnesLoRomToFile_ConvertsCorrectly(int snesAddr, int headerSize, int expected)
	{
		int result = AddressConverter.SnesLoRomToFile(snesAddr, headerSize);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0x0000, 0, 0x008000)] // Start
	[InlineData(0x8000, 0, 0x018000)] // Bank 1
	public void SnesFileToLoRom_ConvertsCorrectly(int fileOffset, int headerSize, int expected)
	{
		int result = AddressConverter.SnesFileToLoRom(fileOffset, headerSize);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(0xC00000, 0, 0x0000)] // HiROM Bank 0
	[InlineData(0xC08000, 0, 0x8000)] // HiROM offset
	public void SnesHiRomToFile_ConvertsCorrectly(int snesAddr, int headerSize, int expected)
	{
		int result = AddressConverter.SnesHiRomToFile(snesAddr, headerSize);
		Assert.Equal(expected, result);
	}

	[Fact]
	public void ParseHex_ParsesVariousFormats()
	{
		Assert.Equal(0xCAFE, AddressConverter.ParseHex("$cafe"));
		Assert.Equal(0xDEAD, AddressConverter.ParseHex("0xdead"));
		Assert.Equal(0xBEEF, AddressConverter.ParseHex("beef"));
	}

	[Theory]
	[InlineData(0x1234, 4, "$1234")]
	[InlineData(0xAB, 2, "$ab")]
	[InlineData(0x1, 4, "$0001")]
	public void ToHex_FormatsCorrectly(int value, int digits, string expected)
	{
		string result = AddressConverter.ToHex(value, digits);
		Assert.Equal(expected, result);
	}
}
