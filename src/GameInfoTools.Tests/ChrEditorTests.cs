using GameInfoTools.Graphics;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for ChrEditor including tile manipulation,
/// CHR bank operations, and NES graphics handling.
/// </summary>
public class ChrEditorTests {
	private byte[] CreateTestChrData(int tileCount = 16) {
		// Each tile is 16 bytes for NES 2bpp format
		byte[] data = new byte[tileCount * ChrEditor.TileSize];

		// Fill with identifiable pattern for testing
		for (int tile = 0; tile < tileCount; tile++) {
			for (int i = 0; i < ChrEditor.TileSize; i++) {
				data[(tile * ChrEditor.TileSize) + i] = (byte)((tile * 16) + i);
			}
		}

		return data;
	}

	[Fact]
	public void Constructor_CreatesInstanceFromData() {
		byte[] data = CreateTestChrData();
		var editor = new ChrEditor(data);

		Assert.NotNull(editor);
	}

	[Fact]
	public void TileCount_ReturnsCorrectCount() {
		byte[] data = CreateTestChrData(8);
		var editor = new ChrEditor(data);

		Assert.Equal(8, editor.TileCount);
	}

	[Fact]
	public void BankCount_ReturnsCorrectCount() {
		// 512 tiles per 8KB bank
		byte[] data = CreateTestChrData(512);
		var editor = new ChrEditor(data);

		Assert.Equal(1, editor.BankCount);
	}

	[Fact]
	public void GetTileBytes_ReturnsCorrectBytes() {
		byte[] data = CreateTestChrData(4);
		var editor = new ChrEditor(data);

		byte[] tileBytes = editor.GetTileBytes(1);

		Assert.Equal(16, tileBytes.Length);
		// First byte of tile 1 should be 16 (1 * 16 + 0)
		Assert.Equal(16, tileBytes[0]);
	}

	[Fact]
	public void GetTile_Returns8x8Array() {
		byte[] data = CreateTestChrData(4);
		var editor = new ChrEditor(data);

		byte[,] tile = editor.GetTile(0);

		Assert.Equal(8, tile.GetLength(0));
		Assert.Equal(8, tile.GetLength(1));
	}

	[Fact]
	public void SetTileBytes_UpdatesData() {
		byte[] data = CreateTestChrData(4);
		var editor = new ChrEditor(data);

		byte[] newBytes = new byte[16];
		for (int i = 0; i < 16; i++)
			newBytes[i] = 0xFF;

		editor.SetTileBytes(0, newBytes);

		byte[] readBack = editor.GetTileBytes(0);
		Assert.Equal(0xFF, readBack[0]);
	}

	[Fact]
	public void FlipHorizontal_ReturnsCorrectDimensions() {
		byte[,] tile = new byte[8, 8];
		tile[0, 0] = 1;
		tile[0, 7] = 2;

		byte[,] flipped = ChrEditor.FlipHorizontal(tile);

		Assert.Equal(8, flipped.GetLength(0));
		Assert.Equal(8, flipped.GetLength(1));
		// Value at (0,0) should now be at (0,7)
		Assert.Equal(1, flipped[0, 7]);
		Assert.Equal(2, flipped[0, 0]);
	}

	[Fact]
	public void FlipVertical_ReturnsCorrectDimensions() {
		byte[,] tile = new byte[8, 8];
		tile[0, 0] = 1;
		tile[7, 0] = 2;

		byte[,] flipped = ChrEditor.FlipVertical(tile);

		Assert.Equal(8, flipped.GetLength(0));
		Assert.Equal(8, flipped.GetLength(1));
		// Value at (0,0) should now be at (7,0)
		Assert.Equal(1, flipped[7, 0]);
		Assert.Equal(2, flipped[0, 0]);
	}

	[Fact]
	public void Rotate90_ReturnsCorrectDimensions() {
		byte[,] tile = new byte[8, 8];
		tile[0, 0] = 1;

		byte[,] rotated = ChrEditor.Rotate90(tile);

		Assert.Equal(8, rotated.GetLength(0));
		Assert.Equal(8, rotated.GetLength(1));
	}

	[Fact]
	public void GetTile_ThrowsOnInvalidIndex() {
		byte[] data = CreateTestChrData(4);
		var editor = new ChrEditor(data);

		Assert.Throws<ArgumentOutOfRangeException>(() => editor.GetTile(100));
	}

	[Fact]
	public void TileSize_IsCorrectConstant() {
		Assert.Equal(16, ChrEditor.TileSize);
	}

	[Fact]
	public void TilesPerBank_IsCorrectConstant() {
		Assert.Equal(512, ChrEditor.TilesPerBank);
	}
}

/// <summary>
/// Unit tests for TileCodec static methods for encoding/decoding tiles.
/// </summary>
public class TileCodecTests {
	[Fact]
	public void DecodeNes2bpp_ReturnsCorrectLength() {
		var tileData = new byte[16];

		var pixels = TileCodec.DecodeNes2bpp(tileData);

		Assert.Equal(64, pixels.Length);
	}

	[Fact]
	public void EncodeNes2bpp_ReturnsCorrectLength() {
		var pixels = new byte[64];

		var tileData = TileCodec.EncodeNes2bpp(pixels);

		Assert.Equal(16, tileData.Length);
	}

	[Fact]
	public void RoundTrip_Nes2bpp_PreservesData() {
		var original = new byte[16];
		for (int i = 0; i < 16; i++) {
			original[i] = (byte)(i * 17);
		}

		var pixels = TileCodec.DecodeNes2bpp(original);
		var reencoded = TileCodec.EncodeNes2bpp(pixels);

		Assert.Equal(original, reencoded);
	}

	[Fact]
	public void DecodeNes2bpp_CorrectPixelValues() {
		// All zeroes should give all 0 pixels
		var tileData = new byte[16];
		var pixels = TileCodec.DecodeNes2bpp(tileData);

		Assert.All(pixels, p => Assert.Equal(0, p));

		// All 0xFF should give all 3 pixels
		for (int i = 0; i < 16; i++) tileData[i] = 0xff;
		pixels = TileCodec.DecodeNes2bpp(tileData);

		Assert.All(pixels, p => Assert.Equal(3, p));
	}

	[Fact]
	public void DecodeSnes4bpp_ReturnsCorrectLength() {
		var tileData = new byte[32];

		var pixels = TileCodec.DecodeSnes4bpp(tileData);

		Assert.Equal(64, pixels.Length);
	}

	[Fact]
	public void EncodeSnes4bpp_ReturnsCorrectLength() {
		var pixels = new byte[64];

		var tileData = TileCodec.EncodeSnes4bpp(pixels);

		Assert.Equal(32, tileData.Length);
	}

	[Fact]
	public void RoundTrip_Snes4bpp_PreservesData() {
		var original = new byte[32];
		for (int i = 0; i < 32; i++) {
			original[i] = (byte)(i * 8);
		}

		var pixels = TileCodec.DecodeSnes4bpp(original);
		var reencoded = TileCodec.EncodeSnes4bpp(pixels);

		Assert.Equal(original, reencoded);
	}

	[Fact]
	public void FlipHorizontal_ReversesColumns() {
		var pixels = new byte[64];
		// Fill first column with 1s
		for (int row = 0; row < 8; row++) {
			pixels[row * 8] = 1;
		}

		var flipped = TileCodec.FlipHorizontal(pixels);

		// After flip, last column should have 1s
		for (int row = 0; row < 8; row++) {
			Assert.Equal(1, flipped[row * 8 + 7]);
			Assert.Equal(0, flipped[row * 8]);
		}
	}

	[Fact]
	public void FlipVertical_ReversesRows() {
		var pixels = new byte[64];
		// Fill first row with 1s
		for (int col = 0; col < 8; col++) {
			pixels[col] = 1;
		}

		var flipped = TileCodec.FlipVertical(pixels);

		// After flip, last row should have 1s
		for (int col = 0; col < 8; col++) {
			Assert.Equal(1, flipped[56 + col]);
			Assert.Equal(0, flipped[col]);
		}
	}

	[Fact]
	public void RotateClockwise_RotatesCorrectly() {
		var pixels = new byte[64];
		// Put a 1 at top-left (0,0)
		pixels[0] = 1;

		var rotated = TileCodec.RotateClockwise(pixels);

		// After 90° CW rotation, top-left should go to top-right (0,7)
		Assert.Equal(1, rotated[7]);
		Assert.Equal(0, rotated[0]);
	}

	[Fact]
	public void DecodeNes2bpp_ThrowsOnShortData() {
		var tileData = new byte[8]; // Too short

		Assert.Throws<ArgumentException>(() => TileCodec.DecodeNes2bpp(tileData));
	}

	[Fact]
	public void EncodeNes2bpp_ThrowsOnShortPixels() {
		var pixels = new byte[32]; // Too short

		Assert.Throws<ArgumentException>(() => TileCodec.EncodeNes2bpp(pixels));
	}
}
