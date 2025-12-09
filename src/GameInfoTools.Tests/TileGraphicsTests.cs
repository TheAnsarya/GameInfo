using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for TileGraphics - tile encoding/decoding and palette operations.
/// </summary>
public class TileGraphicsTests {
	#region Tile Format Properties

	[Theory]
	[InlineData(TileGraphics.TileFormat.Nes2Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Snes4Bpp, 32)]
	[InlineData(TileGraphics.TileFormat.Linear4Bpp, 32)]
	[InlineData(TileGraphics.TileFormat.Gb2Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Gba8Bpp, 64)]
	public void GetBytesPerTile_ReturnsCorrectSize(TileGraphics.TileFormat format, int expected) {
		int result = TileGraphics.GetBytesPerTile(format);
		Assert.Equal(expected, result);
	}

	[Theory]
	[InlineData(TileGraphics.TileFormat.Nes2Bpp, 4)]
	[InlineData(TileGraphics.TileFormat.Snes4Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Linear4Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Gb2Bpp, 4)]
	[InlineData(TileGraphics.TileFormat.Gba8Bpp, 256)]
	public void GetColorsPerTile_ReturnsCorrectCount(TileGraphics.TileFormat format, int expected) {
		int result = TileGraphics.GetColorsPerTile(format);
		Assert.Equal(expected, result);
	}

	[Fact]
	public void CountTiles_ReturnsCorrectCount() {
		// 32 bytes = 2 NES tiles (16 bytes each)
		int count = TileGraphics.CountTiles(32, TileGraphics.TileFormat.Nes2Bpp);
		Assert.Equal(2, count);
	}

	#endregion

	#region Tile Encoding/Decoding

	[Fact]
	public void DecodeTile_Returns8x8Array() {
		byte[] data = new byte[16]; // NES 2bpp tile
		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(8, tile.GetLength(0));
		Assert.Equal(8, tile.GetLength(1));
	}

	[Fact]
	public void DecodeTile_EncodeTile_RoundTrip() {
		// Create a test tile with known data
		byte[] original = new byte[16];
		for (int i = 0; i < 8; i++) {
			original[i] = (byte)i;       // Plane 0
			original[i + 8] = (byte)(i * 2); // Plane 1
		}

		// Decode and re-encode
		var decoded = TileGraphics.DecodeTile(original, 0, TileGraphics.TileFormat.Nes2Bpp);
		var reencoded = TileGraphics.EncodeTile(decoded, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(16, reencoded.Length);
		// The data should round-trip correctly
		Assert.Equal(original, reencoded);
	}

	[Fact]
	public void ExtractTiles_ReturnsCorrectCount() {
		byte[] data = new byte[48]; // 3 NES tiles
		var tiles = TileGraphics.ExtractTiles(data, 0, 3, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(3, tiles.Count);
	}

	#endregion

	#region TileFormat Enum

	[Fact]
	public void TileFormat_HasExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(TileGraphics.TileFormat), "Nes2Bpp"));
		Assert.True(Enum.IsDefined(typeof(TileGraphics.TileFormat), "Snes4Bpp"));
		Assert.True(Enum.IsDefined(typeof(TileGraphics.TileFormat), "Gb2Bpp"));
		Assert.True(Enum.IsDefined(typeof(TileGraphics.TileFormat), "Linear4Bpp"));
		Assert.True(Enum.IsDefined(typeof(TileGraphics.TileFormat), "Gba8Bpp"));
	}

	#endregion
}
