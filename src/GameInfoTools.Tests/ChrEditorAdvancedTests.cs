using GameInfoTools.Graphics;
using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for ChrEditor and sprite manipulation.
/// </summary>
public class ChrEditorAdvancedTests
{
	[Fact]
	public void TileSize_IsCorrect()
	{
		Assert.Equal(16, ChrEditor.TileSize);
	}

	[Fact]
	public void TilesPerBank_IsCorrect()
	{
		Assert.Equal(512, ChrEditor.TilesPerBank);
	}

	[Fact]
	public void Constructor_CalculatesTileCount()
	{
		// 64 bytes = 4 tiles
		var data = new byte[64];
		var editor = new ChrEditor(data);

		Assert.Equal(4, editor.TileCount);
	}

	[Fact]
	public void Constructor_WithOffset_CalculatesTileCount()
	{
		var data = new byte[100];
		var editor = new ChrEditor(data, offset: 16, length: 32);

		// 32 bytes / 16 = 2 tiles
		Assert.Equal(2, editor.TileCount);
	}

	[Fact]
	public void BankCount_CalculatesCorrectly()
	{
		// 512 tiles = 1 bank
		var data = new byte[512 * 16];
		var editor = new ChrEditor(data);

		Assert.Equal(1, editor.BankCount);
	}

	[Fact]
	public void BankCount_RoundsUp()
	{
		// 600 tiles = 2 banks (rounds up from 1.17)
		var data = new byte[600 * 16];
		var editor = new ChrEditor(data);

		Assert.Equal(2, editor.BankCount);
	}

	[Fact]
	public void GetTile_ReturnsCorrectDimensions()
	{
		var data = new byte[16];
		var editor = new ChrEditor(data);

		var tile = editor.GetTile(0);

		Assert.Equal(8, tile.GetLength(0)); // height
		Assert.Equal(8, tile.GetLength(1)); // width
	}

	[Fact]
	public void GetTile_ThrowsOnInvalidIndex()
	{
		var data = new byte[16];
		var editor = new ChrEditor(data);

		Assert.Throws<ArgumentOutOfRangeException>(() => editor.GetTile(-1));
		Assert.Throws<ArgumentOutOfRangeException>(() => editor.GetTile(1));
	}

	[Fact]
	public void SetTile_AndGetTile_RoundTrip()
	{
		var data = new byte[16];
		var editor = new ChrEditor(data);

		// Create a simple pattern
		var tile = new byte[8, 8];
		tile[0, 0] = 3; // Top-left pixel = color 3
		tile[7, 7] = 2; // Bottom-right pixel = color 2

		editor.SetTile(0, tile);
		var retrieved = editor.GetTile(0);

		Assert.Equal(3, retrieved[0, 0]);
		Assert.Equal(2, retrieved[7, 7]);
	}

	[Fact]
	public void SetTile_ThrowsOnInvalidIndex()
	{
		var data = new byte[16];
		var editor = new ChrEditor(data);
		var tile = new byte[8, 8];

		Assert.Throws<ArgumentOutOfRangeException>(() => editor.SetTile(-1, tile));
		Assert.Throws<ArgumentOutOfRangeException>(() => editor.SetTile(1, tile));
	}

	[Fact]
	public void GetTileBytes_ReturnsCorrectLength()
	{
		var data = new byte[32];
		for (int i = 0; i < data.Length; i++)
		{
			data[i] = (byte)i;
		}

		var editor = new ChrEditor(data);
		var bytes = editor.GetTileBytes(0);

		Assert.Equal(16, bytes.Length);
	}

	[Fact]
	public void GetTileBytes_ReturnsCorrectData()
	{
		var data = new byte[32];
		for (int i = 0; i < 16; i++)
		{
			data[i] = (byte)(i + 1);
		}

		var editor = new ChrEditor(data);
		var bytes = editor.GetTileBytes(0);

		for (int i = 0; i < 16; i++)
		{
			Assert.Equal((byte)(i + 1), bytes[i]);
		}
	}

	[Fact]
	public void SetTileBytes_ThrowsOnInvalidLength()
	{
		var data = new byte[16];
		var editor = new ChrEditor(data);

		Assert.Throws<ArgumentException>(() => editor.SetTileBytes(0, new byte[15]));
		Assert.Throws<ArgumentException>(() => editor.SetTileBytes(0, new byte[17]));
	}

	[Fact]
	public void GetTiles_ReturnsCorrectCount()
	{
		var data = new byte[64]; // 4 tiles
		var editor = new ChrEditor(data);

		var tiles = editor.GetTiles(0, 2);

		Assert.Equal(2, tiles.Count);
	}

	[Fact]
	public void GetTiles_RespectsLimit()
	{
		var data = new byte[32]; // 2 tiles
		var editor = new ChrEditor(data);

		// Request 10 but only 2 exist
		var tiles = editor.GetTiles(0, 10);

		Assert.Equal(2, tiles.Count);
	}

	[Fact]
	public void ExportToGrid_ReturnsCorrectDimensions()
	{
		var data = new byte[64]; // 4 tiles
		var editor = new ChrEditor(data);

		// 4 tiles in 2 columns = 2 rows
		var grid = editor.ExportToGrid(tilesPerRow: 2);

		Assert.Equal(16, grid.GetLength(0)); // 2 rows * 8 pixels
		Assert.Equal(16, grid.GetLength(1)); // 2 columns * 8 pixels
	}

	[Fact]
	public void ExtractBank_ReturnsCorrectSize()
	{
		var data = new byte[1024 * 16]; // More than 1 bank
		var editor = new ChrEditor(data);

		var bank = editor.ExtractBank(0);

		// 1 bank = 512 tiles * 16 bytes
		Assert.Equal(512 * 16, bank.Length);
	}

	[Fact]
	public void FlipHorizontal_FlipsCorrectly()
	{
		var tile = new byte[8, 8];
		tile[0, 0] = 1;
		tile[0, 7] = 2;

		var flipped = ChrEditor.FlipHorizontal(tile);

		Assert.Equal(2, flipped[0, 0]);
		Assert.Equal(1, flipped[0, 7]);
	}

	[Fact]
	public void FlipVertical_FlipsCorrectly()
	{
		var tile = new byte[8, 8];
		tile[0, 0] = 1;
		tile[7, 0] = 2;

		var flipped = ChrEditor.FlipVertical(tile);

		Assert.Equal(2, flipped[0, 0]);
		Assert.Equal(1, flipped[7, 0]);
	}

	[Fact]
	public void Rotate90_RotatesCorrectly()
	{
		var tile = new byte[8, 8];
		tile[0, 0] = 1; // Top-left
		tile[0, 7] = 2; // Top-right
		tile[7, 0] = 3; // Bottom-left
		tile[7, 7] = 4; // Bottom-right

		var rotated = ChrEditor.Rotate90(tile);

		// After 90° CW rotation:
		// Top-left -> Top-right
		// Top-right -> Bottom-right
		// Bottom-left -> Top-left
		// Bottom-right -> Bottom-left
		Assert.Equal(3, rotated[0, 0]);
		Assert.Equal(1, rotated[0, 7]);
		Assert.Equal(4, rotated[7, 0]);
		Assert.Equal(2, rotated[7, 7]);
	}

	[Fact]
	public void FindDuplicates_FindsDuplicateTiles()
	{
		// Create data with two identical tiles
		var data = new byte[48]; // 3 tiles
		// Tile 0 and tile 2 are the same (all 0xff)
		for (int i = 0; i < 16; i++)
		{
			data[i] = 0xff;
			data[32 + i] = 0xff;
		}
		// Tile 1 is different
		data[16] = 0x00;

		var editor = new ChrEditor(data);
		var duplicates = editor.FindDuplicates();

		Assert.Single(duplicates);
		Assert.Equal(0, duplicates[0].Original);
		Assert.Contains(2, duplicates[0].Duplicates);
	}

	[Fact]
	public void FindDuplicates_ReturnsEmptyWhenNoDuplicates()
	{
		// Create data with all unique tiles
		var data = new byte[48]; // 3 tiles
		for (int i = 0; i < data.Length; i++)
		{
			data[i] = (byte)i;
		}

		var editor = new ChrEditor(data);
		var duplicates = editor.FindDuplicates();

		Assert.Empty(duplicates);
	}

	[Fact]
	public void ImportFromGrid_AndExportToGrid_RoundTrip()
	{
		var data = new byte[64]; // 4 tiles
		var editor = new ChrEditor(data);

		// Create a grid with known pattern
		var grid = new byte[16, 16];
		grid[0, 0] = 1;
		grid[8, 8] = 2;
		grid[0, 8] = 3;
		grid[8, 0] = 0;

		editor.ImportFromGrid(grid, tilesPerRow: 2);
		var exported = editor.ExportToGrid(tilesPerRow: 2);

		Assert.Equal(1, exported[0, 0]);
		Assert.Equal(2, exported[8, 8]);
		Assert.Equal(3, exported[0, 8]);
		Assert.Equal(0, exported[8, 0]);
	}
}
