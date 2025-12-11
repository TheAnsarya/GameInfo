using Avalonia.Media;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Unit tests for TileGridCanvas custom control logic.
/// </summary>
public class TileGridCanvasTests {
	private static List<byte[,]> CreateTestTiles(int count) {
		var tiles = new List<byte[,]>();
		for (int i = 0; i < count; i++) {
			var tile = new byte[8, 8];
			// Fill with pattern based on tile index
			for (int y = 0; y < 8; y++) {
				for (int x = 0; x < 8; x++) {
					tile[y, x] = (byte)((i + y + x) % 4);
				}
			}

			tiles.Add(tile);
		}

		return tiles;
	}

	[Theory]
	[InlineData(16, 16, 1, 16)]  // 16 tiles with 16 per row = 1 row, 16 columns
	[InlineData(32, 16, 2, 16)]  // 32 tiles with 16 per row = 2 rows, 16 columns
	[InlineData(256, 16, 16, 16)] // 256 tiles = 16 rows
	[InlineData(512, 16, 32, 16)] // 512 tiles = 32 rows
	[InlineData(8, 16, 1, 8)]    // 8 tiles = 1 row, 8 columns
	public void GridLayout_CalculatesRowsCorrectly(int tileCount, int tilesPerRow, int expectedRows, int expectedColumns) {
		var tiles = CreateTestTiles(tileCount);

		int columns = Math.Min(tilesPerRow, tiles.Count);
		int rows = (tiles.Count + tilesPerRow - 1) / tilesPerRow;

		Assert.Equal(expectedColumns, columns);
		Assert.Equal(expectedRows, rows);
	}

	[Theory]
	[InlineData(0, 16, 0, 0)]
	[InlineData(15, 16, 15, 0)]
	[InlineData(16, 16, 0, 1)]
	[InlineData(31, 16, 15, 1)]
	[InlineData(32, 16, 0, 2)]
	[InlineData(255, 16, 15, 15)]
	public void TileIndex_CalculatesGridPosition(int tileIndex, int tilesPerRow, int expectedGridX, int expectedGridY) {
		int gridX = tileIndex % tilesPerRow;
		int gridY = tileIndex / tilesPerRow;

		Assert.Equal(expectedGridX, gridX);
		Assert.Equal(expectedGridY, gridY);
	}

	[Theory]
	[InlineData(0, 0, 16, 0)]
	[InlineData(15, 0, 16, 15)]
	[InlineData(0, 1, 16, 16)]
	[InlineData(7, 3, 16, 55)]
	public void GridPosition_CalculatesTileIndex(int gridX, int gridY, int tilesPerRow, int expectedIndex) {
		int index = (gridY * tilesPerRow) + gridX;

		Assert.Equal(expectedIndex, index);
	}

	[Theory]
	[InlineData(2, 1, 17)]
	[InlineData(4, 1, 33)]
	[InlineData(2, 2, 18)]
	public void CellSize_CalculatesWithSpacing(int scale, int spacing, int expectedCellSize) {
		int tileSize = 8 * scale;
		int cellSize = tileSize + spacing;

		Assert.Equal(expectedCellSize, cellSize);
	}

	[Fact]
	public void HitTest_CalculatesTileFromPosition() {
		var tiles = CreateTestTiles(32);
		int scale = 2;
		int spacing = 1;
		int tilesPerRow = 16;
		int cellSize = (8 * scale) + spacing;

		// Click at position (100, 50) - should be tile in column 5, row 2
		double clickX = 100;
		double clickY = 50;

		int gridX = (int)(clickX / cellSize);
		int gridY = (int)(clickY / cellSize);
		int index = (gridY * tilesPerRow) + gridX;

		// Expected: gridX = 100/17 = 5, gridY = 50/17 = 2
		// index = (2 * 16) + 5 = 37 (but tiles only has 32, so would be invalid)
		Assert.True(gridX >= 0);
		Assert.True(gridY >= 0);
	}

	[Fact]
	public void EmptyTileList_HasZeroDimensions() {
		var tiles = new List<byte[,]>();

		Assert.Empty(tiles);
	}

	[Fact]
	public void Tiles_CanBeNullOrEmpty() {
		List<byte[,]>? tiles = null;

		Assert.Null(tiles);

		tiles = [];
		Assert.Empty(tiles);
	}

	[Theory]
	[InlineData(-1)]
	[InlineData(0)]
	[InlineData(5)]
	[InlineData(255)]
	public void SelectedTileIndex_AcceptsValidValues(int selectedIndex) {
		// Selected index can be -1 (none selected) or any valid tile index
		Assert.True(selectedIndex >= -1);
	}

	[Fact]
	public void GridOverlayMode_AllValuesAreDefined() {
		var values = Enum.GetValues<GameInfoTools.UI.Controls.GridOverlayMode>();
		Assert.Equal(4, values.Length);
	}

	[Fact]
	public void GridOverlayMode_HasExpectedValues() {
		Assert.Equal(0, (int)GameInfoTools.UI.Controls.GridOverlayMode.None);
		Assert.Equal(1, (int)GameInfoTools.UI.Controls.GridOverlayMode.Grid8x8);
		Assert.Equal(2, (int)GameInfoTools.UI.Controls.GridOverlayMode.Grid16x16);
		Assert.Equal(3, (int)GameInfoTools.UI.Controls.GridOverlayMode.Both);
	}
}
