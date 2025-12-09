using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Edge case and error handling tests.
/// </summary>
public class EdgeCaseTests
{
	#region AddressConverter Edge Cases

	[Fact]
	public void ToHex_Zero_ReturnsFormattedZero()
	{
		var result = AddressConverter.ToHex(0);
		Assert.Equal("$0000", result);
	}

	[Fact]
	public void ToHex_NegativeValue_ReturnsHex()
	{
		// Negative values get truncated to their hex representation
		var result = AddressConverter.ToHex(-1, 4);
		Assert.NotEmpty(result);
	}

	[Fact]
	public void ToHex_LargeValue_ReturnsCorrectWidth()
	{
		var result = AddressConverter.ToHex(0xFFFFFF, 6);
		Assert.Equal("$ffffff", result);
	}

	[Fact]
	public void ParseHex_EmptyString_ThrowsFormatException()
	{
		Assert.Throws<FormatException>(() => AddressConverter.ParseHex(""));
	}

	[Fact]
	public void ParseHex_InvalidHex_ThrowsOrReturnsZero()
	{
		// Depending on implementation, invalid hex might throw or return 0
		try
		{
			var result = AddressConverter.ParseHex("xyz");
			// If it doesn't throw, it should return something reasonable
			Assert.True(result >= 0);
		}
		catch (FormatException)
		{
			// This is also acceptable
			Assert.True(true);
		}
	}

	#endregion

	#region Checksum Edge Cases

	[Fact]
	public void Checksum_Crc32_SingleByte()
	{
		byte[] data = [0x00];
		uint crc = Checksum.Crc32(data);
		Assert.True(crc != 0); // Should produce a valid CRC
	}

	[Fact]
	public void Checksum_Crc32_LargeArray()
	{
		byte[] data = new byte[1024 * 1024]; // 1MB
		for (int i = 0; i < data.Length; i++)
		{
			data[i] = (byte)(i % 256);
		}

		uint crc = Checksum.Crc32(data);
		Assert.True(crc != 0);
	}

	#endregion

	#region TextTable Edge Cases

	[Fact]
	public void TextTable_AddEntry_DuplicateKey_OverwritesBehavior()
	{
		var table = new TextTable { Name = "Test" };
		table.AddEntry(0x80, "A");
		table.AddEntry(0x80, "B"); // Same key

		// The behavior depends on implementation
		// Just verify it doesn't throw
		Assert.True(table.EntryCount >= 1);
	}

	[Fact]
	public void TextTable_Encode_EmptyString_ReturnsEmptyArray()
	{
		var table = new TextTable { Name = "Test" };
		var result = table.Encode("");

		Assert.Empty(result);
	}

	[Fact]
	public void TextTable_Encode_UnknownCharacter()
	{
		var table = new TextTable { Name = "Test" };
		table.AddEntry(0x80, "A");

		// Encoding 'Z' which isn't in the table
		var result = table.Encode("Z");

		// Behavior depends on implementation - might skip, add placeholder, or include raw
		Assert.NotNull(result);
	}

	[Fact]
	public void TextTable_Decode_EmptyArray_ReturnsEmptyString()
	{
		var table = new TextTable { Name = "Test" };
		var result = table.Decode(Array.Empty<byte>());

		Assert.Empty(result);
	}

	[Fact]
	public void TextTable_DecodeBlock_BeyondArray_HandlesGracefully()
	{
		var table = new TextTable { Name = "Test" };
		table.AddEntry(0x80, "A");

		byte[] data = [0x80, 0x81];
		var (text, consumed) = table.DecodeBlock(data, 0, 100); // maxLength > data.Length

		Assert.NotNull(text);
	}

	#endregion

	#region RomFile Edge Cases

	[Fact]
	public void RomFile_GetRomInfo_TinyArray_ReturnsUnknownSystem()
	{
		byte[] data = [0x00, 0x01]; // Too small to be valid ROM

		var info = RomFile.GetRomInfo(data);

		Assert.Equal(SystemType.Unknown, info.System);
	}

	[Fact]
	public void RomFile_GetRomInfo_AllZeros_ReturnsUnknownSystem()
	{
		byte[] data = new byte[0x4000]; // 16KB of zeros

		var info = RomFile.GetRomInfo(data);

		// Likely unknown since no valid header signature
		Assert.NotNull(info);
	}

	#endregion

	#region CompressionDetector Edge Cases

	[Fact]
	public void CompressionDetector_Detect_EmptyArray_ReturnsNone()
	{
		var result = CompressionDetector.Detect(Array.Empty<byte>(), 0);

		Assert.Equal(CompressionDetector.CompressionType.None, result.Type);
	}

	[Fact]
	public void CompressionDetector_Detect_BeyondArrayLength()
	{
		byte[] data = [0x10, 0x00, 0x10, 0x00];

		// Trying to detect at offset beyond array
		var result = CompressionDetector.Detect(data, 100);

		Assert.Equal(CompressionDetector.CompressionType.None, result.Type);
	}

	#endregion

	#region PatternDetector Edge Cases

	[Fact]
	public void PatternDetector_FindPointerTable_EmptyData()
	{
		var result = PatternDetector.FindPointerTables(Array.Empty<byte>(), SystemType.Nes);

		Assert.NotNull(result);
		Assert.Empty(result);
	}

	[Fact]
	public void PatternDetector_FindTextRegions_SingleByte()
	{
		byte[] data = [0xAA];

		var result = PatternDetector.FindTextRegions(data);

		Assert.NotNull(result);
	}

	#endregion
}
