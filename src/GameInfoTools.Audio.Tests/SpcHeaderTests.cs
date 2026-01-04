using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class SpcHeaderTests {
	[Fact]
	public void Parse_ValidHeader_ReturnsCorrectData() {
		var data = CreateValidSpcHeader();

		var header = SpcHeader.Parse(data);

		Assert.True(header.IsValid);
		Assert.Equal(0x0400, header.PC);
		Assert.Equal(0x00, header.A);
		Assert.Equal(0x01, header.X);
		Assert.Equal(0x02, header.Y);
		Assert.Equal(0xEF, header.SP);
	}

	[Fact]
	public void Parse_TooShort_ThrowsArgumentException() {
		var data = new byte[100]; // Less than 256 bytes

		Assert.Throws<ArgumentException>(() => SpcHeader.Parse(data));
	}

	[Fact]
	public void Parse_WithId666_ParsesMetadata() {
		var data = CreateValidSpcHeader();

		// Add song title at offset 0x2E
		var title = "Test Song";
		var titleBytes = System.Text.Encoding.ASCII.GetBytes(title);
		Array.Copy(titleBytes, 0, data, 0x2E, titleBytes.Length);

		// Add game title at offset 0x4E
		var game = "Test Game";
		var gameBytes = System.Text.Encoding.ASCII.GetBytes(game);
		Array.Copy(gameBytes, 0, data, 0x4E, gameBytes.Length);

		var header = SpcHeader.Parse(data);

		Assert.True(header.HasId666);
		Assert.Equal("Test Song", header.SongTitle);
		Assert.Equal("Test Game", header.GameTitle);
	}

	[Fact]
	public void ToBytes_RoundTrips_Correctly() {
		var original = new SpcHeader {
			PC = 0x0500,
			A = 0x10,
			X = 0x20,
			Y = 0x30,
			PSW = 0x00,
			SP = 0xEF,
			HasId666 = true,
			SongTitle = "My Song",
			GameTitle = "My Game",
			Artist = "Artist Name"
		};

		var bytes = original.ToBytes();
		var parsed = SpcHeader.Parse(bytes);

		Assert.Equal(original.PC, parsed.PC);
		Assert.Equal(original.A, parsed.A);
		Assert.Equal(original.X, parsed.X);
		Assert.Equal(original.Y, parsed.Y);
		Assert.Equal(original.SP, parsed.SP);
		Assert.Equal(original.SongTitle, parsed.SongTitle);
		Assert.Equal(original.GameTitle, parsed.GameTitle);
		Assert.Equal(original.Artist, parsed.Artist);
	}

	[Fact]
	public void IsValid_CorrectSignature_ReturnsTrue() {
		var data = CreateValidSpcHeader();

		var header = SpcHeader.Parse(data);

		Assert.True(header.IsValid);
	}

	[Fact]
	public void IsValid_WrongSignature_ReturnsFalse() {
		var data = new byte[256];
		System.Text.Encoding.ASCII.GetBytes("INVALID HEADER").CopyTo(data, 0);

		var header = SpcHeader.Parse(data);

		Assert.False(header.IsValid);
	}

	private static byte[] CreateValidSpcHeader() {
		var data = new byte[256];

		// Signature
		var signature = "SNES-SPC700 Sound File Data v0.30";
		System.Text.Encoding.ASCII.GetBytes(signature).CopyTo(data, 0);

		// Version
		data[0x21] = 0x1A;
		data[0x22] = 0x1A;

		// Has ID666
		data[0x23] = 0x1A;

		// PC = 0x0400
		data[0x25] = 0x00;
		data[0x26] = 0x04;

		// Registers
		data[0x27] = 0x00; // A
		data[0x28] = 0x01; // X
		data[0x29] = 0x02; // Y
		data[0x2A] = 0x00; // PSW
		data[0x2B] = 0xEF; // SP

		return data;
	}
}
