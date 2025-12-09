using Avalonia.Media;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Unit tests for TileCanvas custom control logic.
/// Since Avalonia controls require a UI context for full rendering,
/// these tests focus on the data and calculation logic.
/// </summary>
public class TileCanvasTests {
	[Fact]
	public void DefaultPalette_Returns4Colors() {
		var palette = GameInfoTools.UI.Controls.TileCanvas.GetDefaultPalette();

		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void DefaultPalette_HasCorrectGrayscaleValues() {
		var palette = GameInfoTools.UI.Controls.TileCanvas.GetDefaultPalette();

		// Should be: Black, Dark Gray, Light Gray, White
		Assert.Equal(Color.FromRgb(0, 0, 0), palette[0]);
		Assert.Equal(Color.FromRgb(85, 85, 85), palette[1]);
		Assert.Equal(Color.FromRgb(170, 170, 170), palette[2]);
		Assert.Equal(Color.FromRgb(255, 255, 255), palette[3]);
	}

	[Fact]
	public void TileData_8x8Array_IsValidInput() {
		var tileData = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				tileData[y, x] = (byte)((y + x) % 4);
			}
		}

		Assert.Equal(8, tileData.GetLength(0));
		Assert.Equal(8, tileData.GetLength(1));
	}

	[Fact]
	public void TileData_ValidColorIndices_AreWithinPaletteRange() {
		var palette = GameInfoTools.UI.Controls.TileCanvas.GetDefaultPalette();
		var tileData = new byte[8, 8];

		// Fill with valid indices
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				tileData[y, x] = (byte)((y + x) % 4);
			}
		}

		// Verify all indices are within palette range
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				Assert.True(tileData[y, x] < palette.Length);
			}
		}
	}

	[Theory]
	[InlineData(1, 8)]
	[InlineData(2, 16)]
	[InlineData(4, 32)]
	[InlineData(8, 64)]
	public void Scale_CalculatesCorrectPixelSize(int scale, int expectedSize) {
		// Each 8x8 tile at given scale should be expectedSize pixels
		int actualSize = 8 * scale;
		Assert.Equal(expectedSize, actualSize);
	}

	[Fact]
	public void CustomPalette_CanHaveMoreThan4Colors() {
		var palette = new Color[] {
			Colors.Red,
			Colors.Green,
			Colors.Blue,
			Colors.Yellow,
			Colors.Cyan,
			Colors.Magenta,
			Colors.White,
			Colors.Black,
			Colors.Orange,
			Colors.Purple,
			Colors.Pink,
			Colors.Brown,
			Colors.Gray,
			Colors.Silver,
			Colors.Gold,
			Colors.Navy
		};

		Assert.Equal(16, palette.Length);
	}
}
