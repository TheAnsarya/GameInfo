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
