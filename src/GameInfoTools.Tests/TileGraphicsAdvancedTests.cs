using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for TileGraphics tile encoding/decoding across multiple formats.
/// </summary>
public class TileGraphicsAdvancedTests {
	#region GetBytesPerTile Tests

	[Theory]
	[InlineData(TileGraphics.TileFormat.Linear1Bpp, 8)]
	[InlineData(TileGraphics.TileFormat.Nes2Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Gb2Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Snes2Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Linear2Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Snes4Bpp, 32)]
	[InlineData(TileGraphics.TileFormat.Gba4Bpp, 32)]
	[InlineData(TileGraphics.TileFormat.Linear4Bpp, 32)]
	[InlineData(TileGraphics.TileFormat.Snes8Bpp, 64)]
	[InlineData(TileGraphics.TileFormat.Gba8Bpp, 64)]
	public void GetBytesPerTile_AllFormats_ReturnsCorrectSize(TileGraphics.TileFormat format, int expected) {
		var result = TileGraphics.GetBytesPerTile(format);

		Assert.Equal(expected, result);
	}

	#endregion

	#region GetColorsPerTile Tests

	[Theory]
	[InlineData(TileGraphics.TileFormat.Linear1Bpp, 2)]
	[InlineData(TileGraphics.TileFormat.Nes2Bpp, 4)]
	[InlineData(TileGraphics.TileFormat.Gb2Bpp, 4)]
	[InlineData(TileGraphics.TileFormat.Snes2Bpp, 4)]
	[InlineData(TileGraphics.TileFormat.Linear2Bpp, 4)]
	[InlineData(TileGraphics.TileFormat.Snes4Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Gba4Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Linear4Bpp, 16)]
	[InlineData(TileGraphics.TileFormat.Snes8Bpp, 256)]
	[InlineData(TileGraphics.TileFormat.Gba8Bpp, 256)]
	public void GetColorsPerTile_AllFormats_ReturnsCorrectCount(TileGraphics.TileFormat format, int expected) {
		var result = TileGraphics.GetColorsPerTile(format);

		Assert.Equal(expected, result);
	}

	#endregion

	#region NES 2bpp Decoding Tests

	[Fact]
	public void DecodeTile_Nes2Bpp_DecodesCorrectly() {
		// Create a simple NES tile: all pixel color 0
		var data = new byte[16];

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(8, tile.GetLength(0));
		Assert.Equal(8, tile.GetLength(1));
		Assert.Equal(0, tile[0, 0]);
	}

	[Fact]
	public void DecodeTile_Nes2Bpp_AllOnes_Color3() {
		// All bytes 0xff = all pixels color 3
		var data = new byte[16];
		for (int i = 0; i < 16; i++) {
			data[i] = 0xff;
		}

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(3, tile[0, 0]);
		Assert.Equal(3, tile[7, 7]);
	}

	[Fact]
	public void DecodeTile_Nes2Bpp_Plane0Only_Color1() {
		// Plane 0 = 0xff, Plane 1 = 0x00 = all pixels color 1
		var data = new byte[16];
		for (int i = 0; i < 8; i++) {
			data[i] = 0xff;     // Plane 0
			data[i + 8] = 0x00; // Plane 1
		}

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(1, tile[0, 0]);
	}

	[Fact]
	public void DecodeTile_Nes2Bpp_Plane1Only_Color2() {
		// Plane 0 = 0x00, Plane 1 = 0xff = all pixels color 2
		var data = new byte[16];
		for (int i = 0; i < 8; i++) {
			data[i] = 0x00;     // Plane 0
			data[i + 8] = 0xff; // Plane 1
		}

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(2, tile[0, 0]);
	}

	[Fact]
	public void DecodeTile_Nes2Bpp_CheckerPattern() {
		// Create a checker pattern
		var data = new byte[16];
		data[0] = 0xaa; // 10101010 - plane 0
		data[8] = 0x55; // 01010101 - plane 1

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);

		// First pixel: plane0[bit7]=1, plane1[bit7]=0 = color 1
		Assert.Equal(1, tile[0, 0]);
		// Second pixel: plane0[bit6]=0, plane1[bit6]=1 = color 2
		Assert.Equal(2, tile[0, 1]);
	}

	#endregion

	#region SNES 4bpp Decoding Tests

	[Fact]
	public void DecodeTile_Snes4Bpp_DecodesCorrectly() {
		var data = new byte[32];

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Snes4Bpp);

		Assert.Equal(8, tile.GetLength(0));
		Assert.Equal(8, tile.GetLength(1));
	}

	[Fact]
	public void DecodeTile_Snes4Bpp_AllOnes_Color15() {
		var data = new byte[32];
		for (int i = 0; i < 32; i++) {
			data[i] = 0xff;
		}

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Snes4Bpp);

		Assert.Equal(15, tile[0, 0]);
	}

	#endregion

	#region GBA 4bpp Decoding Tests

	[Fact]
	public void DecodeTile_Gba4Bpp_DecodesCorrectly() {
		// GBA 4bpp: each byte = 2 pixels (low nibble first)
		var data = new byte[32];
		data[0] = 0x21; // Pixel 0 = 1, Pixel 1 = 2

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Gba4Bpp);

		Assert.Equal(1, tile[0, 0]);
		Assert.Equal(2, tile[0, 1]);
	}

	[Fact]
	public void DecodeTile_Gba4Bpp_AllNibbles() {
		var data = new byte[32];
		for (int i = 0; i < 32; i++) {
			data[i] = 0xff; // Both nibbles = 15
		}

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Gba4Bpp);

		Assert.Equal(15, tile[0, 0]);
		Assert.Equal(15, tile[0, 1]);
	}

	#endregion

	#region GBA 8bpp Decoding Tests

	[Fact]
	public void DecodeTile_Gba8Bpp_OneBytePerPixel() {
		var data = new byte[64];
		for (int i = 0; i < 64; i++) {
			data[i] = (byte)i;
		}

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Gba8Bpp);

		Assert.Equal(0, tile[0, 0]);
		Assert.Equal(1, tile[0, 1]);
		Assert.Equal(8, tile[1, 0]);
	}

	#endregion

	#region Linear 1bpp Tests

	[Fact]
	public void DecodeTile_Linear1Bpp_DecodesCorrectly() {
		var data = new byte[8];
		data[0] = 0x80; // First pixel set

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Linear1Bpp);

		Assert.Equal(1, tile[0, 0]);
		Assert.Equal(0, tile[0, 1]);
	}

	[Fact]
	public void DecodeTile_Linear1Bpp_AllSet() {
		var data = new byte[8];
		for (int i = 0; i < 8; i++) {
			data[i] = 0xff;
		}

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Linear1Bpp);

		Assert.Equal(1, tile[0, 0]);
		Assert.Equal(1, tile[7, 7]);
	}

	#endregion

	#region Round-Trip Encoding Tests

	[Fact]
	public void EncodeDecode_Nes2Bpp_RoundTrips() {
		// Create a tile with various colors
		var original = new byte[,]
		{
			{ 0, 1, 2, 3, 0, 1, 2, 3 },
			{ 1, 2, 3, 0, 1, 2, 3, 0 },
			{ 2, 3, 0, 1, 2, 3, 0, 1 },
			{ 3, 0, 1, 2, 3, 0, 1, 2 },
			{ 0, 1, 2, 3, 0, 1, 2, 3 },
			{ 1, 2, 3, 0, 1, 2, 3, 0 },
			{ 2, 3, 0, 1, 2, 3, 0, 1 },
			{ 3, 0, 1, 2, 3, 0, 1, 2 },
		};

		var encoded = TileGraphics.EncodeTile(original, TileGraphics.TileFormat.Nes2Bpp);
		var decoded = TileGraphics.DecodeTile(encoded, 0, TileGraphics.TileFormat.Nes2Bpp);

		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				Assert.Equal(original[y, x], decoded[y, x]);
			}
		}
	}

	[Fact]
	public void EncodeDecode_Gba4Bpp_RoundTrips() {
		var original = new byte[,]
		{
			{ 0, 1, 2, 3, 4, 5, 6, 7 },
			{ 8, 9, 10, 11, 12, 13, 14, 15 },
			{ 0, 1, 2, 3, 4, 5, 6, 7 },
			{ 8, 9, 10, 11, 12, 13, 14, 15 },
			{ 0, 1, 2, 3, 4, 5, 6, 7 },
			{ 8, 9, 10, 11, 12, 13, 14, 15 },
			{ 0, 1, 2, 3, 4, 5, 6, 7 },
			{ 8, 9, 10, 11, 12, 13, 14, 15 },
		};

		var encoded = TileGraphics.EncodeTile(original, TileGraphics.TileFormat.Gba4Bpp);
		var decoded = TileGraphics.DecodeTile(encoded, 0, TileGraphics.TileFormat.Gba4Bpp);

		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				Assert.Equal(original[y, x], decoded[y, x]);
			}
		}
	}

	#endregion

	#region Tile Offset Tests

	[Fact]
	public void DecodeTile_WithOffset_StartsFromOffset() {
		var data = new byte[32];
		// First tile (offset 0) = all zeros
		// Second tile (offset 16) = all ones in plane 0
		for (int i = 16; i < 24; i++) {
			data[i] = 0xff;
		}

		var tile0 = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);
		var tile1 = TileGraphics.DecodeTile(data, 16, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(0, tile0[0, 0]);
		Assert.Equal(1, tile1[0, 0]);
	}

	#endregion

	#region CountTiles Tests

	[Theory]
	[InlineData(16, TileGraphics.TileFormat.Nes2Bpp, 1)]
	[InlineData(32, TileGraphics.TileFormat.Nes2Bpp, 2)]
	[InlineData(32, TileGraphics.TileFormat.Snes4Bpp, 1)]
	[InlineData(64, TileGraphics.TileFormat.Gba8Bpp, 1)]
	[InlineData(128, TileGraphics.TileFormat.Gba8Bpp, 2)]
	public void CountTiles_ReturnsCorrectCount(int dataSize, TileGraphics.TileFormat format, int expected) {
		var result = TileGraphics.CountTiles(dataSize, format);

		Assert.Equal(expected, result);
	}

	[Fact]
	public void CountTiles_PartialTile_Truncates() {
		// 20 bytes with 16 bytes per tile = 1 complete tile
		var result = TileGraphics.CountTiles(20, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(1, result);
	}

	#endregion

	#region ExtractTiles Tests

	[Fact]
	public void ExtractTiles_SingleTile_ReturnsOneTile() {
		var data = new byte[16];

		var tiles = TileGraphics.ExtractTiles(data, 0, 1, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Single(tiles);
	}

	[Fact]
	public void ExtractTiles_MultipleTiles_ReturnsAll() {
		var data = new byte[48]; // 3 NES tiles

		var tiles = TileGraphics.ExtractTiles(data, 0, 3, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(3, tiles.Count);
	}

	[Fact]
	public void ExtractTiles_WithOffset_StartsFromOffset() {
		var data = new byte[32];
		data[16] = 0xff; // Mark second tile's first byte

		var tiles = TileGraphics.ExtractTiles(data, 16, 1, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Single(tiles);
		// First row of first tile should have plane0 = 0xff
		Assert.Equal(1, tiles[0][0, 0]); // Color 1 (only plane0 set)
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void DecodeTile_InsufficientData_HandlesGracefully() {
		var data = new byte[8]; // Only half of NES tile

		var tile = TileGraphics.DecodeTile(data, 0, TileGraphics.TileFormat.Nes2Bpp);

		// Should decode what it can
		Assert.Equal(8, tile.GetLength(0));
		Assert.Equal(8, tile.GetLength(1));
	}

	[Fact]
	public void DecodeTile_OffsetBeyondData_ReturnsZeros() {
		var data = new byte[16];

		var tile = TileGraphics.DecodeTile(data, 100, TileGraphics.TileFormat.Nes2Bpp);

		Assert.Equal(0, tile[0, 0]);
	}

	[Fact]
	public void EncodeTile_NullTile_Throws() {
		// NullReferenceException is acceptable since there's no explicit null check
		Assert.ThrowsAny<Exception>(() =>
			TileGraphics.EncodeTile(null!, TileGraphics.TileFormat.Nes2Bpp));
	}

	[Fact]
	public void EncodeTile_WrongSize_Throws() {
		var tile = new byte[4, 4]; // Wrong size

		// IndexOutOfRangeException is thrown since it accesses indices beyond bounds
		Assert.ThrowsAny<Exception>(() =>
			TileGraphics.EncodeTile(tile, TileGraphics.TileFormat.Nes2Bpp));
	}

	#endregion

	#region Performance Tests

	[Fact]
	public void DecodeTiles_LargeData_CompletesQuickly() {
		// Decode 1000 tiles (16KB of NES CHR data)
		var data = new byte[16000];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i & 0xff);
		}

		var sw = System.Diagnostics.Stopwatch.StartNew();
		for (int i = 0; i < 1000; i++) {
			TileGraphics.DecodeTile(data, i * 16, TileGraphics.TileFormat.Nes2Bpp);
		}
		sw.Stop();

		Assert.True(sw.ElapsedMilliseconds < 1000, $"Decoding 1000 tiles took {sw.ElapsedMilliseconds}ms");
	}

	#endregion
}
