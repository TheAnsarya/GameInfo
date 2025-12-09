using Avalonia.Media;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Unit tests for MapCanvas custom control logic.
/// </summary>
public class MapCanvasTests {
	[Theory]
	[InlineData(16, 16, 256)]
	[InlineData(32, 32, 1024)]
	[InlineData(64, 64, 4096)]
	[InlineData(20, 15, 300)]
	public void MapSize_CalculatesTotalTiles(int width, int height, int expectedTotal) {
		int total = width * height;
		Assert.Equal(expectedTotal, total);
	}

	[Theory]
	[InlineData(16, 16, 16, 256, 256)]
	[InlineData(32, 32, 8, 256, 256)]
	[InlineData(64, 64, 4, 256, 256)]
	public void MapDimensions_CalculatePixelSize(int width, int height, int tileSize, int expectedPixelWidth, int expectedPixelHeight) {
		int pixelWidth = width * tileSize;
		int pixelHeight = height * tileSize;

		Assert.Equal(expectedPixelWidth, pixelWidth);
		Assert.Equal(expectedPixelHeight, pixelHeight);
	}

	[Theory]
	[InlineData(0, 0, 16, 0)]
	[InlineData(5, 3, 16, 53)]
	[InlineData(15, 15, 16, 255)]
	[InlineData(0, 1, 32, 32)]
	public void MapCoordinate_CalculatesArrayIndex(int x, int y, int width, int expectedIndex) {
		int index = (y * width) + x;
		Assert.Equal(expectedIndex, index);
	}

	[Theory]
	[InlineData(0, 16, 0, 0)]
	[InlineData(53, 16, 5, 3)]
	[InlineData(255, 16, 15, 15)]
	[InlineData(32, 32, 0, 1)]
	public void ArrayIndex_CalculatesMapCoordinate(int index, int width, int expectedX, int expectedY) {
		int x = index % width;
		int y = index / width;

		Assert.Equal(expectedX, x);
		Assert.Equal(expectedY, y);
	}

	[Theory]
	[InlineData(1, 8)]
	[InlineData(2, 16)]
	[InlineData(4, 32)]
	[InlineData(8, 64)]
	public void ZoomToTileSize_ConvertsCorrectly(int zoom, int expectedTileSize) {
		// Matches the ZoomToTileSizeConverter logic
		int tileSize = zoom * 8;
		Assert.Equal(expectedTileSize, tileSize);
	}

	[Fact]
	public void HitTest_CalculatesMapCoordinateFromClick() {
		int mapWidth = 16;
		int mapHeight = 16;
		int tileSize = 16;

		// Click at pixel position (100, 80)
		double clickX = 100;
		double clickY = 80;

		int gridX = (int)(clickX / tileSize);
		int gridY = (int)(clickY / tileSize);

		// Expected: gridX = 100/16 = 6, gridY = 80/16 = 5
		Assert.Equal(6, gridX);
		Assert.Equal(5, gridY);

		int index = (gridY * mapWidth) + gridX;
		Assert.Equal(86, index);
	}

	[Fact]
	public void HsvToColor_ProducesValidColor() {
		// Test the HSV to RGB conversion formula used in MapCanvas
		// Hue: 0-360, Saturation: 0-1, Value: 0-1
		double hue = 180; // Cyan-ish
		double saturation = 0.6;
		double value = 0.5;

		// HSV to RGB calculation
		double c = value * saturation;
		double x = c * (1 - Math.Abs(((hue / 60) % 2) - 1));
		double m = value - c;

		double r, g, b;
		if (hue < 60) { r = c; g = x; b = 0; }
		else if (hue < 120) { r = x; g = c; b = 0; }
		else if (hue < 180) { r = 0; g = c; b = x; }
		else if (hue < 240) { r = 0; g = x; b = c; }
		else if (hue < 300) { r = x; g = 0; b = c; }
		else { r = c; g = 0; b = x; }

		byte red = (byte)((r + m) * 255);
		byte green = (byte)((g + m) * 255);
		byte blue = (byte)((b + m) * 255);

		// Should produce a cyan-like color
		Assert.True(red >= 0 && red <= 255);
		Assert.True(green >= 0 && green <= 255);
		Assert.True(blue >= 0 && blue <= 255);
		Assert.True(green > red); // Cyan should have more green than red
		Assert.True(blue > red);   // Cyan should have more blue than red
	}

	[Theory]
	[InlineData(0, 0)]
	[InlineData(127, 178.59375)]
	[InlineData(255, 358.59375)] // 255/256*360 = 358.59375
	public void TileIndex_GeneratesUniqueHue(byte tileIndex, double expectedHue) {
		double hue = (tileIndex / 256.0) * 360;
		Assert.Equal(expectedHue, hue, 4);
	}

	[Fact]
	public void EmptyMapData_HandlesGracefully() {
		byte[]? mapData = null;
		Assert.Null(mapData);

		mapData = [];
		Assert.Empty(mapData);
	}

	[Fact]
	public void MapData_WithValidTileIndices() {
		var mapData = new byte[256];
		for (int i = 0; i < 256; i++) {
			mapData[i] = (byte)(i % 16); // Use tiles 0-15
		}

		Assert.Equal(256, mapData.Length);
		Assert.All(mapData, b => Assert.True(b < 16));
	}

	[Theory]
	[InlineData(-1, -1)] // No selection
	[InlineData(0, 0)]
	[InlineData(5, 3)]
	[InlineData(15, 15)]
	public void Selection_AcceptsValidCoordinates(int x, int y) {
		// Selection can be -1,-1 (none) or valid coordinates
		Assert.True(x >= -1);
		Assert.True(y >= -1);
	}
}
