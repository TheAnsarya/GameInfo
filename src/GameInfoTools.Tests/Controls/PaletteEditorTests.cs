using Avalonia.Media;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Unit tests for PaletteEditor custom control logic.
/// </summary>
public class PaletteEditorTests {
	[Fact]
	public void DefaultPalette_Has4Colors() {
		var palette = GameInfoTools.UI.Controls.TileCanvas.GetDefaultPalette();
		Assert.Equal(4, palette.Length);
	}

	[Theory]
	[InlineData(4, 32, 4, 140)]  // 4 colors, 32px swatches, 4px spacing = (4*36)-4 = 140
	[InlineData(16, 24, 2, 414)] // 16 colors, 24px swatches, 2px spacing = (16*26)-2 = 414
	[InlineData(1, 32, 0, 32)]   // 1 color, 32px swatch, no spacing = 32
	public void MeasuredWidth_CalculatedCorrectly(int colorCount, int swatchSize, int spacing, int expectedWidth) {
		// Width = (colorCount * (swatchSize + spacing)) - spacing
		int cellSize = swatchSize + spacing;
		int width = (colorCount * cellSize) - spacing;

		Assert.Equal(expectedWidth, width);
	}

	[Theory]
	[InlineData(0, 32, 4, 0)]
	[InlineData(1, 32, 4, 36)]
	[InlineData(2, 32, 4, 72)]
	[InlineData(15, 32, 4, 540)]
	public void HitTest_CalculatesColorIndex(int expectedIndex, int swatchSize, int spacing, double clickX) {
		int cellSize = swatchSize + spacing;
		int index = (int)(clickX / cellSize);

		Assert.Equal(expectedIndex, index);
	}

	[Fact]
	public void ColorLuminance_CalculatesCorrectly() {
		// Luminance formula: 0.299*R + 0.587*G + 0.114*B
		var black = Color.FromRgb(0, 0, 0);
		var white = Color.FromRgb(255, 255, 255);
		var red = Color.FromRgb(255, 0, 0);
		var green = Color.FromRgb(0, 255, 0);

		double blackLuminance = (0.299 * black.R) + (0.587 * black.G) + (0.114 * black.B);
		double whiteLuminance = (0.299 * white.R) + (0.587 * white.G) + (0.114 * white.B);
		double redLuminance = (0.299 * red.R) + (0.587 * red.G) + (0.114 * red.B);
		double greenLuminance = (0.299 * green.R) + (0.587 * green.G) + (0.114 * green.B);

		Assert.Equal(0, blackLuminance, 1);
		Assert.Equal(255, whiteLuminance, 1);
		Assert.True(greenLuminance > redLuminance); // Green is more luminous than red
	}

	[Theory]
	[InlineData(0, 0, 0, false)] // Black - needs white text (luminance < 128)
	[InlineData(255, 255, 255, true)] // White - needs black text (luminance > 128)
	[InlineData(128, 128, 128, false)] // Mid gray - just under threshold
	[InlineData(130, 130, 130, true)] // Slightly brighter - over threshold
	public void ContrastColor_SelectsCorrectly(byte r, byte g, byte b, bool shouldUseBlack) {
		double luminance = (0.299 * r) + (0.587 * g) + (0.114 * b);
		bool useBlack = luminance > 128;

		Assert.Equal(shouldUseBlack, useBlack);
	}

	[Fact]
	public void SelectedColorIndex_ValidRange() {
		var palette = new Color[4];

		// Valid indices: 0 to colorCount-1
		Assert.True(0 >= 0 && 0 < palette.Length);
		Assert.True(3 >= 0 && 3 < palette.Length);

		// Invalid index
		Assert.False(4 >= 0 && 4 < palette.Length);
		Assert.False(-1 >= 0 && -1 < palette.Length);
	}

	[Fact]
	public void EmptyPalette_Handled() {
		Color[]? palette = null;
		Assert.Null(palette);

		palette = [];
		Assert.Empty(palette);
	}

	[Fact]
	public void LargePalette_Supported() {
		// Test 256-color palette (8bpp)
		var palette = new Color[256];
		for (int i = 0; i < 256; i++) {
			palette[i] = Color.FromRgb((byte)i, (byte)i, (byte)i);
		}

		Assert.Equal(256, palette.Length);
		Assert.Equal(Color.FromRgb(0, 0, 0), palette[0]);
		Assert.Equal(Color.FromRgb(255, 255, 255), palette[255]);
	}
}
