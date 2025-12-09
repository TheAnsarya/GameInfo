using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for TextTable parsing, encoding, and decoding functionality
/// including TBL file format support and control code handling.
/// </summary>
public class TextTableTests {
	[Fact]
	public void CreateAscii_GeneratesValidTable() {
		var table = TextTable.CreateAscii();

		Assert.Equal("ASCII", table.Name);
		Assert.True(table.EntryCount > 0);

		// Check standard ASCII mapping
		Assert.Equal("A", table.GetCharacter(0x41));
		Assert.Equal("Z", table.GetCharacter(0x5A));
		Assert.Equal(" ", table.GetCharacter(0x20));
	}

	[Fact]
	public void CreateDragonQuest_GeneratesValidTable() {
		var table = TextTable.CreateDragonQuest();

		Assert.Equal("Dragon Quest", table.Name);
		Assert.True(table.EntryCount > 0);

		// Check typical DQ mappings
		Assert.Equal("A", table.GetCharacter(0x80));
		Assert.Equal("[END]", table.GetCharacter(0xFF));
	}

	[Fact]
	public void FromString_ParsesTableCorrectly() {
		string tblContent = "; Test table\n80=A\n81=B\n82=C\nFF=[END]";
		var table = TextTable.FromString(tblContent);

		Assert.Equal("A", table.GetCharacter(0x80));
		Assert.Equal("B", table.GetCharacter(0x81));
		Assert.Equal("C", table.GetCharacter(0x82));
		Assert.Equal("[END]", table.GetCharacter(0xFF));
	}

	[Fact]
	public void Encode_EncodesTextCorrectly() {
		var table = TextTable.FromString("80=A\n81=B\n82=C");
		var encoded = table.Encode("ABC");

		Assert.Equal(3, encoded.Length);
		Assert.Equal(0x80, encoded[0]);
		Assert.Equal(0x81, encoded[1]);
		Assert.Equal(0x82, encoded[2]);
	}

	[Fact]
	public void Decode_DecodesCorrectly() {
		var table = TextTable.FromString("80=A\n81=B\n82=C");
		byte[] data = [0x80, 0x81, 0x82];
		string decoded = table.Decode(data);

		Assert.Equal("ABC", decoded);
	}

	[Fact]
	public void DecodeBlock_StopsAtEndMarker() {
		var table = TextTable.FromString("80=A\n81=B\n82=C\nFF=[END]");
		byte[] data = [0x80, 0x81, 0x82, 0xFF, 0x80, 0x80];
		var (text, bytesConsumed) = table.DecodeBlock(data, 0, data.Length);

		Assert.Equal("ABC[END]", text);
		Assert.Equal(4, bytesConsumed);
	}

	[Fact]
	public void DecodeBlock_ReturnsEmptyForUnknownFirstByte() {
		var table = TextTable.FromString("80=A\n81=B");
		byte[] data = [0x50, 0x80, 0x81]; // 0x50 is unknown
		var (text, bytesConsumed) = table.DecodeBlock(data, 0, data.Length);

		Assert.Equal(string.Empty, text);
		Assert.Equal(0, bytesConsumed);
	}

	[Fact]
	public void DecodeUntil_StopsAtSpecifiedMarker() {
		var table = TextTable.FromString("80=H\n81=i\n82=!\nFE=[STOP]");
		byte[] data = [0x80, 0x81, 0x82, 0xFE, 0x80];
		string decoded = table.DecodeUntil(data, 0, 0xFE, out int bytesRead);

		Assert.Equal("Hi!", decoded);
		Assert.Equal(4, bytesRead); // Includes the stop marker
	}

	[Fact]
	public void Encode_HandlesControlCodes() {
		var table = TextTable.FromString("80=A\nFF=[END]");
		var encoded = table.Encode("A[END]");

		Assert.Equal(2, encoded.Length);
		Assert.Equal(0x80, encoded[0]);
		Assert.Equal(0xFF, encoded[1]);
	}

	[Fact]
	public void Encode_HandlesHexLiterals() {
		var table = TextTable.FromString("80=A");
		var encoded = table.Encode("A[ff]A");

		Assert.Equal(3, encoded.Length);
		Assert.Equal(0x80, encoded[0]);
		Assert.Equal(0xFF, encoded[1]);
		Assert.Equal(0x80, encoded[2]);
	}

	[Fact]
	public void AddEntry_AddsNewMapping() {
		var table = new TextTable();
		table.AddEntry(0x42, "X");

		Assert.Equal("X", table.GetCharacter(0x42));
		Assert.Equal((byte?)0x42, table.GetByte("X"));
	}

	[Fact]
	public void GetCharacter_ReturnsNullForUnknown() {
		var table = new TextTable();
		Assert.Null(table.GetCharacter(0x99));
	}

	[Fact]
	public void GetByte_ReturnsNullForUnknown() {
		var table = new TextTable();
		Assert.Null(table.GetByte("unknown"));
	}
}
