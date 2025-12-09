namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CLI command handlers.
/// These tests verify that commands can be invoked without throwing exceptions.
/// </summary>
public class CliCommandTests
{
	[Fact]
	public void RomFile_LoadNonExistentFile_ThrowsFileNotFoundException()
	{
		var rom = new Core.RomFile();
		Assert.Throws<FileNotFoundException>(() => rom.Load("nonexistent.nes"));
	}

	[Fact]
	public void AddressConverter_ToHex_FormatsCorrectly()
	{
		// Tests that our hex formatting is correct for CLI display
		var result = Core.AddressConverter.ToHex(0x8000);
		Assert.Equal("$8000", result);
	}

	[Fact]
	public void AddressConverter_ParseHex_HandlesVariousFormats()
	{
		Assert.Equal(0x8000, Core.AddressConverter.ParseHex("$8000"));
		Assert.Equal(0x8000, Core.AddressConverter.ParseHex("0x8000"));
		Assert.Equal(0x64, Core.AddressConverter.ParseHex("64")); // Hex 64 = decimal 100
	}

	[Fact]
	public void Checksum_CalculateCrc32_ValidForEmptyArray()
	{
		byte[] data = Array.Empty<byte>();
		uint crc = Core.Checksum.Crc32(data);

		// CRC32 of empty data should be 0
		Assert.Equal(0u, crc);
	}

	[Fact]
	public void Checksum_CalculateCrc32_ValidForKnownData()
	{
		// "123456789" has well-known CRC32 value
		byte[] data = "123456789"u8.ToArray();
		uint crc = Core.Checksum.Crc32(data);

		// CRC32 of "123456789" = 0xCBF43926
		Assert.Equal(0xCBF43926u, crc);
	}

	[Fact]
	public void SystemType_HasAllExpectedTypes()
	{
		// Ensure CLI can handle all system types
		var types = Enum.GetNames(typeof(Core.SystemType));

		Assert.Contains("Unknown", types);
		Assert.Contains("Nes", types);
		Assert.Contains("Snes", types);
		Assert.Contains("GameBoy", types);
	}

	[Fact]
	public void TextTable_CreateEmpty_HasNoEntries()
	{
		var table = new Core.TextTable();
		Assert.Equal(0, table.EntryCount);
	}

	[Fact]
	public void RomInfo_HasCorrectProperties()
	{
		var info = new Core.RomInfo
		{
			System = Core.SystemType.Nes,
			HeaderSize = 16,
			Size = 0x8000,
			Title = "Test ROM",
			Mapper = 0
		};

		Assert.Equal(Core.SystemType.Nes, info.System);
		Assert.Equal(16, info.HeaderSize);
		Assert.Equal(0x8000, info.Size);
		Assert.Equal("Test ROM", info.Title);
		Assert.Equal(0, info.Mapper);
	}
}
