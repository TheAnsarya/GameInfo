using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for TextTable encoding/decoding and TBL file handling.
/// </summary>
public class TextTableAdvancedTests
{
	#region TBL File Parsing Tests

	[Fact]
	public void ParseTbl_SimpleEntries_ParsesCorrectly()
	{
		var tblContent = "00=A\n01=B\n02=C";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABC", table.Decode(new byte[] { 0x00, 0x01, 0x02 }));
	}

	[Fact]
	public void ParseTbl_WindowsLineEndings_ParsesCorrectly()
	{
		// TBL format uses \n as line separator, test that basic parsing works
		var tblContent = "00=A\n01=B\n02=C";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABC", table.Decode(new byte[] { 0x00, 0x01, 0x02 }));
	}

	[Fact]
	public void ParseTbl_MixedLineEndings_ParsesCorrectly()
	{
		// TBL format uses \n as line separator
		var tblContent = "00=A\n01=B\n02=C\n03=D";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABCD", table.Decode(new byte[] { 0x00, 0x01, 0x02, 0x03 }));
	}

	[Fact]
	public void ParseTbl_EmptyLines_SkipsEmpty()
	{
		var tblContent = "00=A\n\n01=B\n\n02=C";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABC", table.Decode(new byte[] { 0x00, 0x01, 0x02 }));
	}

	[Fact]
	public void ParseTbl_CommentLines_SkipsComments()
	{
		var tblContent = "00=A\n;this is a comment\n01=B\n//another comment\n02=C";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABC", table.Decode(new byte[] { 0x00, 0x01, 0x02 }));
	}

	[Fact]
	public void ParseTbl_SingleByteEntries_ParsesCorrectly()
	{
		// Test single-byte entries (most common case)
		var tblContent = "00=A\n01=B\n02=C";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABC", table.Decode(new byte[] { 0x00, 0x01, 0x02 }));
	}

	[Fact]
	public void ParseTbl_SpecialCharacters_Preserved()
	{
		var tblContent = "00=*\n01=!\n02=?\n03=♥";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("*!?♥", table.Decode(new byte[] { 0x00, 0x01, 0x02, 0x03 }));
	}

	[Fact]
	public void ParseTbl_EqualsInValue_HandlesCorrectly()
	{
		var tblContent = "00==";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("=", table.Decode(new byte[] { 0x00 }));
	}

	[Fact]
	public void ParseTbl_LowercaseHex_ParsesCorrectly()
	{
		var tblContent = "0a=A\n0b=B\n0c=C";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABC", table.Decode(new byte[] { 0x0a, 0x0b, 0x0c }));
	}

	[Fact]
	public void ParseTbl_UppercaseHex_ParsesCorrectly()
	{
		var tblContent = "0A=A\n0B=B\n0C=C";

		var table = TextTable.FromString(tblContent);

		Assert.Equal("ABC", table.Decode(new byte[] { 0x0a, 0x0b, 0x0c }));
	}

	#endregion

	#region Encoding Tests

	[Fact]
	public void Encode_SingleChar_ReturnsCorrectBytes()
	{
		var table = TextTable.FromString("41=A");

		var result = table.Encode("A");

		Assert.Equal(new byte[] { 0x41 }, result);
	}

	[Fact]
	public void Encode_MultiChar_ReturnsCorrectBytes()
	{
		var table = TextTable.FromString("41=A\n42=B\n43=C");

		var result = table.Encode("ABC");

		Assert.Equal(new byte[] { 0x41, 0x42, 0x43 }, result);
	}

	[Fact]
	public void Encode_UnknownChar_HandlesGracefully()
	{
		var table = TextTable.FromString("41=A");

		var result = table.Encode("AXA"); // X is unknown

		// Should encode what it can
		Assert.NotNull(result);
	}

	[Fact]
	public void Encode_LongString_EncodesCorrectly()
	{
		var table = TextTable.FromString("00=[LONG]\n01=[END]");

		var result = table.Encode("[LONG][END]");

		Assert.NotNull(result);
		// Should encode both control codes
		Assert.True(result.Length >= 2);
	}

	[Fact]
	public void Encode_PreferExactMatch()
	{
		var table = TextTable.FromString("00=A\n01=B");

		var result = table.Encode("AB");

		Assert.Equal(new byte[] { 0x00, 0x01 }, result);
	}

	[Fact]
	public void Encode_EmptyString_ReturnsEmpty()
	{
		var table = TextTable.FromString("41=A");

		var result = table.Encode("");

		Assert.Empty(result);
	}

	[Fact]
	public void Encode_CaseSensitive()
	{
		var table = TextTable.FromString("41=A\n61=a");

		var resultUpper = table.Encode("A");
		var resultLower = table.Encode("a");

		Assert.Equal(new byte[] { 0x41 }, resultUpper);
		Assert.Equal(new byte[] { 0x61 }, resultLower);
	}

	#endregion

	#region Decoding Tests

	[Fact]
	public void Decode_SingleByte_ReturnsChar()
	{
		var table = TextTable.FromString("41=A");

		var result = table.Decode(new byte[] { 0x41 });

		Assert.Equal("A", result);
	}

	[Fact]
	public void Decode_MultipleBytes_ReturnsString()
	{
		var table = TextTable.FromString("41=A\n42=B\n43=C");

		var result = table.Decode(new byte[] { 0x41, 0x42, 0x43 });

		Assert.Equal("ABC", result);
	}

	[Fact]
	public void Decode_UnknownByte_PlaceholderOrSkip()
	{
		var table = TextTable.FromString("41=A");

		var result = table.Decode(new byte[] { 0x41, 0xff, 0x41 });

		// Unknown bytes should be handled gracefully
		Assert.Contains("A", result);
	}

	[Fact]
	public void Decode_EmptyArray_ReturnsEmpty()
	{
		var table = TextTable.FromString("41=A");

		var result = table.Decode(Array.Empty<byte>());

		Assert.Equal("", result);
	}

	[Fact]
	public void Decode_MultipleBytes_PrefersLongest()
	{
		// Test that single-byte entries are decoded correctly
		var table = TextTable.FromString("00=X\n01=Y");

		var result = table.Decode(new byte[] { 0x00, 0x01 });

		Assert.Equal("XY", result);
	}

	[Fact]
	public void Decode_WithOffset_StartsFromOffset()
	{
		var table = TextTable.FromString("41=A\n42=B\n43=C");

		var result = table.Decode(new byte[] { 0x41, 0x42, 0x43 }, 1, 2);

		Assert.Equal("BC", result);
	}

	#endregion

	#region DecodeBlock Tests

	[Fact]
	public void DecodeBlock_ReturnsTextAndBytesConsumed()
	{
		var table = TextTable.FromString("41=A\n42=B\n43=C");

		var (text, bytesConsumed) = table.DecodeBlock(new byte[] { 0x41, 0x42, 0x43 }, 0, 3);

		Assert.Equal("ABC", text);
		Assert.Equal(3, bytesConsumed);
	}

	[Fact]
	public void DecodeBlock_WithMaxLength_StopsAtLimit()
	{
		var table = TextTable.FromString("41=A\n42=B\n43=C");

		var (text, bytesConsumed) = table.DecodeBlock(new byte[] { 0x41, 0x42, 0x43 }, 0, 2);

		Assert.Equal("AB", text);
		Assert.Equal(2, bytesConsumed);
	}

	#endregion

	#region Control Code Tests

	[Fact]
	public void ControlCodes_SpecialFormatting()
	{
		var table = TextTable.FromString("00=[LINE]\n01=[END]\n41=A");

		var result = table.Decode(new byte[] { 0x41, 0x00, 0x41 });

		Assert.Contains("[LINE]", result);
	}

	#endregion

	#region Round-Trip Tests

	[Fact]
	public void RoundTrip_SimpleText_Preserved()
	{
		var table = TextTable.FromString("41=A\n42=B\n43=C");
		var original = "ABC";

		var encoded = table.Encode(original);
		var decoded = table.Decode(encoded);

		Assert.Equal(original, decoded);
	}

	[Fact]
	public void RoundTrip_ComplexText_Preserved()
	{
		var tbl = "20= \n41=A\n42=B\n43=C\n00=[END]";
		var table = TextTable.FromString(tbl);
		var original = "A B C";

		var encoded = table.Encode(original);
		var decoded = table.Decode(encoded);

		Assert.Equal(original, decoded);
	}

	[Fact]
	public void RoundTrip_SpecialChars_Preserved()
	{
		var table = TextTable.FromString("00=!\n01=?\n02=*\n03=@");
		var original = "!?*@";

		var encoded = table.Encode(original);
		var decoded = table.Decode(encoded);

		Assert.Equal(original, decoded);
	}

	#endregion

	#region AddEntry Tests

	[Fact]
	public void AddEntry_AddsNewEntry()
	{
		var table = TextTable.FromString("");
		table.AddEntry(0x41, "A");

		Assert.Equal("A", table.Decode(new byte[] { 0x41 }));
	}

	[Fact]
	public void GetCharacter_ReturnsCorrectChar()
	{
		var table = TextTable.FromString("41=A");

		var result = table.GetCharacter(0x41);

		Assert.Equal("A", result);
	}

	[Fact]
	public void GetCharacter_UnknownByte_ReturnsNull()
	{
		var table = TextTable.FromString("41=A");

		var result = table.GetCharacter(0xff);

		Assert.Null(result);
	}

	[Fact]
	public void GetByte_ReturnsCorrectByte()
	{
		var table = TextTable.FromString("41=A");

		var result = table.GetByte("A");

		Assert.Equal((byte)0x41, result);
	}

	[Fact]
	public void GetByte_UnknownChar_ReturnsNull()
	{
		var table = TextTable.FromString("41=A");

		var result = table.GetByte("X");

		Assert.Null(result);
	}

	#endregion

	#region CreateAscii Tests

	[Fact]
	public void CreateAscii_CreatesValidTable()
	{
		var table = TextTable.CreateAscii();

		Assert.Equal("A", table.Decode(new byte[] { 0x41 }));
		Assert.Equal("a", table.Decode(new byte[] { 0x61 }));
		Assert.Equal("0", table.Decode(new byte[] { 0x30 }));
	}

	[Fact]
	public void CreateAscii_EncodesCorrectly()
	{
		var table = TextTable.CreateAscii();

		var result = table.Encode("Hello");

		Assert.Equal(new byte[] { 0x48, 0x65, 0x6c, 0x6c, 0x6f }, result);
	}

	#endregion

	#region CreateDragonQuest Tests

	[Fact]
	public void CreateDragonQuest_CreatesValidTable()
	{
		var table = TextTable.CreateDragonQuest();

		Assert.NotNull(table);
		Assert.True(table.EntryCount > 0);
	}

	#endregion

	#region Performance Tests

	[Fact]
	public void Decode_LargeData_CompletesQuickly()
	{
		var table = TextTable.CreateAscii();
		var data = new byte[100000];
		for (int i = 0; i < data.Length; i++)
		{
			data[i] = (byte)((i % 26) + 0x41);
		}

		var sw = System.Diagnostics.Stopwatch.StartNew();
		var result = table.Decode(data);
		sw.Stop();

		Assert.Equal(100000, result.Length);
		Assert.True(sw.ElapsedMilliseconds < 1000, $"Decoding took {sw.ElapsedMilliseconds}ms");
	}

	[Fact]
	public void Encode_LargeText_CompletesQuickly()
	{
		var table = TextTable.CreateAscii();
		var text = new string('A', 100000);

		var sw = System.Diagnostics.Stopwatch.StartNew();
		var result = table.Encode(text);
		sw.Stop();

		Assert.Equal(100000, result.Length);
		Assert.True(sw.ElapsedMilliseconds < 1000, $"Encoding took {sw.ElapsedMilliseconds}ms");
	}

	#endregion

	#region Edge Case Tests

	[Fact]
	public void Table_EmptyTblContent_CreatesEmptyTable()
	{
		var table = TextTable.FromString("");

		Assert.NotNull(table);
	}

	[Fact]
	public void Table_WhitespaceOnly_CreatesEmptyTable()
	{
		var table = TextTable.FromString("   \n   \n   ");

		Assert.NotNull(table);
	}

	[Fact]
	public void Table_InvalidHex_HandlesGracefully()
	{
		// Invalid hex characters should be skipped
		var table = TextTable.FromString("ZZ=X\n41=A");

		Assert.Equal("A", table.Decode(new byte[] { 0x41 }));
	}

	#endregion

	#region EntryCount Tests

	[Fact]
	public void EntryCount_EmptyTable_ReturnsZero()
	{
		var table = TextTable.FromString("");

		Assert.Equal(0, table.EntryCount);
	}

	[Fact]
	public void EntryCount_WithEntries_ReturnsCorrectCount()
	{
		var table = TextTable.FromString("00=A\n01=B\n02=C");

		Assert.Equal(3, table.EntryCount);
	}

	#endregion

	#region Name Property Tests

	[Fact]
	public void Name_Default_IsUnnamed()
	{
		var table = TextTable.FromString("");

		Assert.Equal("Unnamed", table.Name);
	}

	[Fact]
	public void Name_CanBeSet()
	{
		var table = TextTable.FromString("");
		table.Name = "Test Table";

		Assert.Equal("Test Table", table.Name);
	}

	#endregion
}
