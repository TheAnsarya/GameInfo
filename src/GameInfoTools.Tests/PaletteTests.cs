using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for Palette conversion utilities.
/// </summary>
public class PaletteTests {
	// NES palette tests

	[Fact]
	public void NesToRgb_Color0_ReturnsGray() {
		var color = Palette.NesToRgb(0x00);

		Assert.Equal(0x7c, color.R);
		Assert.Equal(0x7c, color.G);
		Assert.Equal(0x7c, color.B);
	}

	[Fact]
	public void NesToRgb_MasksUpperBits() {
		// Color 0x00 and 0x40 should be the same (only lower 6 bits matter)
		var color1 = Palette.NesToRgb(0x00);
		var color2 = Palette.NesToRgb(0x40);

		Assert.Equal(color1, color2);
	}

	[Fact]
	public void NesToRgb_Black_ReturnsBlack() {
		// 0x0D, 0x0E, 0x0F, 0x1D, etc. are all black on NES
		var color = Palette.NesToRgb(0x0D);
		Assert.Equal((byte)0, color.R);
		Assert.Equal((byte)0, color.G);
		Assert.Equal((byte)0, color.B);
	}

	[Fact]
	public void NesToRgb_PureBlue_ReturnsBlue() {
		var color = Palette.NesToRgb(0x01);

		Assert.Equal((byte)0x00, color.R);
		Assert.Equal((byte)0x00, color.G);
		Assert.Equal((byte)0xfc, color.B);
	}

	// SNES palette tests

	[Fact]
	public void SnesColorToRgb_Black_ReturnsBlack() {
		var color = Palette.SnesColorToRgb(0x0000);

		Assert.Equal((byte)0, color.R);
		Assert.Equal((byte)0, color.G);
		Assert.Equal((byte)0, color.B);
	}

	[Fact]
	public void SnesColorToRgb_PureRed_ReturnsRed() {
		// SNES format: 0BBBBBGG GGGRRRRR
		// Pure red (5 bits) = 0x001F
		var color = Palette.SnesColorToRgb(0x001F);

		Assert.Equal((byte)0xF8, color.R); // 31 << 3 = 248
		Assert.Equal((byte)0, color.G);
		Assert.Equal((byte)0, color.B);
	}

	[Fact]
	public void SnesColorToRgb_PureGreen_ReturnsGreen() {
		// Pure green = 0x03E0 (bits 5-9)
		var color = Palette.SnesColorToRgb(0x03E0);

		Assert.Equal((byte)0, color.R);
		Assert.Equal((byte)0xF8, color.G);
		Assert.Equal((byte)0, color.B);
	}

	[Fact]
	public void SnesColorToRgb_PureBlue_ReturnsBlue() {
		// Pure blue = 0x7C00 (bits 10-14)
		var color = Palette.SnesColorToRgb(0x7C00);

		Assert.Equal((byte)0, color.R);
		Assert.Equal((byte)0, color.G);
		Assert.Equal((byte)0xF8, color.B);
	}

	[Fact]
	public void SnesColorToRgb_White_ReturnsWhite() {
		// White = 0x7FFF
		var color = Palette.SnesColorToRgb(0x7FFF);

		Assert.Equal((byte)0xF8, color.R);
		Assert.Equal((byte)0xF8, color.G);
		Assert.Equal((byte)0xF8, color.B);
	}

	[Fact]
	public void RgbToSnesColor_Black_ReturnsZero() {
		var snes = Palette.RgbToSnesColor(0, 0, 0);
		Assert.Equal((ushort)0, snes);
	}

	[Fact]
	public void RgbToSnesColor_White_ReturnsMaxValue() {
		var snes = Palette.RgbToSnesColor(0xFF, 0xFF, 0xFF);
		Assert.Equal((ushort)0x7FFF, snes);
	}

	[Fact]
	public void SnesColorToRgb_RoundTrip() {
		// Convert a color to RGB and back
		ushort original = 0x3DEF; // Some arbitrary color
		var rgb = Palette.SnesColorToRgb(original);
		var converted = Palette.RgbToSnesColor(rgb.R, rgb.G, rgb.B);

		// Should get same value back (within precision loss)
		Assert.Equal(original, converted);
	}

	// GBA palette tests (same format as SNES)

	[Fact]
	public void GbaColorToRgb_SameAsSnes() {
		ushort color = 0x3DEF;
		var gba = Palette.GbaColorToRgb(color);
		var snes = Palette.SnesColorToRgb(color);

		Assert.Equal(snes, gba);
	}

	// Game Boy palette tests

	[Fact]
	public void GbColorToRgb_Grayscale_Level0_IsWhite() {
		var color = Palette.GbColorToRgb(0, isCgb: false);

		Assert.Equal((byte)0xFF, color.R);
		Assert.Equal((byte)0xFF, color.G);
		Assert.Equal((byte)0xFF, color.B);
	}

	[Fact]
	public void GbColorToRgb_Grayscale_Level3_IsBlack() {
		var color = Palette.GbColorToRgb(3, isCgb: false);

		Assert.Equal((byte)0x00, color.R);
		Assert.Equal((byte)0x00, color.G);
		Assert.Equal((byte)0x00, color.B);
	}

	[Fact]
	public void GbColorToRgb_Grayscale_MasksLower2Bits() {
		// 0x00 and 0x04 should be the same (only bits 0-1 matter)
		var color1 = Palette.GbColorToRgb(0x00, isCgb: false);
		var color2 = Palette.GbColorToRgb(0x04, isCgb: false);

		Assert.Equal(color1, color2);
	}

	[Fact]
	public void GbColorToRgb_Cgb_UsesSnesFormat() {
		// In CGB mode, it uses SNES 15-bit color format
		byte gbColor = 0x1F; // Would be pure red in SNES format
		var color = Palette.GbColorToRgb(gbColor, isCgb: true);

		Assert.Equal((byte)0xF8, color.R);
		Assert.Equal((byte)0, color.G);
		Assert.Equal((byte)0, color.B);
	}

	// ReadSnesPalette tests

	[Fact]
	public void ReadSnesPalette_ReadsCorrectColorCount() {
		// 4 colors * 2 bytes each
		var data = new byte[8];

		var palette = Palette.ReadSnesPalette(data, 0, 4);

		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void ReadSnesPalette_ParsesLittleEndian() {
		// SNES color 0x7C00 (pure blue) stored little-endian
		var data = new byte[] { 0x00, 0x7C };

		var palette = Palette.ReadSnesPalette(data, 0, 1);

		Assert.Equal((byte)0, palette[0].R);
		Assert.Equal((byte)0, palette[0].G);
		Assert.Equal((byte)0xF8, palette[0].B);
	}

	[Fact]
	public void ReadSnesPalette_HandlesOffset() {
		var data = new byte[] { 0xFF, 0xFF, 0x00, 0x7C }; // First 2 bytes are garbage
		var palette = Palette.ReadSnesPalette(data, offset: 2, colorCount: 1);

		Assert.Equal((byte)0, palette[0].R);
		Assert.Equal((byte)0, palette[0].G);
		Assert.Equal((byte)0xF8, palette[0].B);
	}

	[Fact]
	public void ReadSnesPalette_AllocatesRequestedSize() {
		var data = new byte[4]; // Only 2 colors worth
		var palette = Palette.ReadSnesPalette(data, 0, colorCount: 10);

		// Returns requested size (may have default values for colors beyond data)
		Assert.Equal(10, palette.Length);
	}

	// DefaultNesPalette tests

	[Fact]
	public void DefaultNesPalette_Returns4Colors() {
		var palette = Palette.DefaultNesPalette();

		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void DefaultNesPalette_HasGrayscaleProgression() {
		var palette = Palette.DefaultNesPalette();

		// Default palette should go from light to dark
		// Check that colors are distinguishable
		Assert.NotEqual(palette[0], palette[3]);
	}
}
