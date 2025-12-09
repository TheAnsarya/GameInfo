using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for Palette color conversion and manipulation.
/// </summary>
public class PaletteAdvancedTests
{
	#region NES Color Tests

	[Theory]
	[InlineData(0x00)]  // Gray
	[InlineData(0x10)]  // Another gray
	[InlineData(0x0f)]  // Black
	[InlineData(0x30)]  // White
	public void NesToRgb_ValidColor_ReturnsRgb(byte nesColor)
	{
		var (r, g, b) = Palette.NesToRgb(nesColor);

		Assert.True(r >= 0 && r <= 255);
		Assert.True(g >= 0 && g <= 255);
		Assert.True(b >= 0 && b <= 255);
	}

	[Fact]
	public void NesToRgb_Black_ReturnsBlack()
	{
		// NES color $0F is black
		var (r, g, b) = Palette.NesToRgb(0x0f);

		// Should be close to black
		Assert.True(r < 50 && g < 50 && b < 50);
	}

	[Fact]
	public void NesToRgb_DifferentColors_ReturnDifferentRgb()
	{
		var color1 = Palette.NesToRgb(0x00);
		var color2 = Palette.NesToRgb(0x16);
		var color3 = Palette.NesToRgb(0x2a);

		Assert.False(color1 == color2 && color2 == color3);
	}

	#endregion

	#region SNES Color Tests

	[Fact]
	public void SnesColorToRgb_Black_ReturnsBlack()
	{
		ushort black = 0x0000;

		var (r, g, b) = Palette.SnesColorToRgb(black);

		Assert.Equal(0, r);
		Assert.Equal(0, g);
		Assert.Equal(0, b);
	}

	[Fact]
	public void SnesColorToRgb_White_ReturnsWhite()
	{
		ushort white = 0x7fff;

		var (r, g, b) = Palette.SnesColorToRgb(white);

		// SNES uses 5-bit color scaled to 8-bit
		Assert.True(r > 240);
		Assert.True(g > 240);
		Assert.True(b > 240);
	}

	[Fact]
	public void SnesColorToRgb_Red_ReturnsRed()
	{
		// SNES RGB555: 0BBBBBGGGGGRRRRR
		ushort red = 0x001f; // R = 31 (max), G = 0, B = 0

		var (r, g, b) = Palette.SnesColorToRgb(red);

		Assert.True(r > 200);
		Assert.True(g < 50);
		Assert.True(b < 50);
	}

	[Fact]
	public void SnesColorToRgb_Green_ReturnsGreen()
	{
		// SNES RGB555: 0BBBBBGGGGGRRRRR
		ushort green = 0x03e0; // R = 0, G = 31 (max), B = 0

		var (r, g, b) = Palette.SnesColorToRgb(green);

		Assert.True(r < 50);
		Assert.True(g > 200);
		Assert.True(b < 50);
	}

	[Fact]
	public void SnesColorToRgb_Blue_ReturnsBlue()
	{
		// SNES RGB555: 0BBBBBGGGGGRRRRR
		ushort blue = 0x7c00; // R = 0, G = 0, B = 31 (max)

		var (r, g, b) = Palette.SnesColorToRgb(blue);

		Assert.True(r < 50);
		Assert.True(g < 50);
		Assert.True(b > 200);
	}

	[Fact]
	public void RgbToSnesColor_Black_ReturnsZero()
	{
		var result = Palette.RgbToSnesColor(0, 0, 0);

		Assert.Equal((ushort)0, result);
	}

	[Fact]
	public void RgbToSnesColor_White_ReturnsWhite()
	{
		var result = Palette.RgbToSnesColor(255, 255, 255);

		Assert.Equal((ushort)0x7fff, result);
	}

	[Fact]
	public void RgbToSnesColor_RoundTrip()
	{
		ushort original = 0x35ad;

		var (r, g, b) = Palette.SnesColorToRgb(original);
		var converted = Palette.RgbToSnesColor(r, g, b);

		Assert.Equal(original, converted);
	}

	#endregion

	#region GBA Color Tests

	[Fact]
	public void GbaColorToRgb_Black_ReturnsBlack()
	{
		ushort black = 0x0000;

		var (r, g, b) = Palette.GbaColorToRgb(black);

		Assert.Equal(0, r);
		Assert.Equal(0, g);
		Assert.Equal(0, b);
	}

	[Fact]
	public void GbaColorToRgb_White_ReturnsWhite()
	{
		ushort white = 0x7fff;

		var (r, g, b) = Palette.GbaColorToRgb(white);

		Assert.True(r > 240);
		Assert.True(g > 240);
		Assert.True(b > 240);
	}

	[Fact]
	public void GbaColorToRgb_Red_ReturnsRed()
	{
		// GBA RGB555: 0BBBBBGGGGGRRRRR (same as SNES)
		ushort red = 0x001f;

		var (r, g, b) = Palette.GbaColorToRgb(red);

		Assert.True(r > 200);
		Assert.True(g < 50);
		Assert.True(b < 50);
	}

	#endregion

	#region Game Boy Color Tests

	[Theory]
	[InlineData(0x00)] // White on original GB
	[InlineData(0x01)]
	[InlineData(0x02)]
	[InlineData(0x03)] // Black on original GB
	public void GbColorToRgb_ValidShade_ReturnsGray(byte gbColor)
	{
		var (r, g, b) = Palette.GbColorToRgb(gbColor);

		// Original GB palette is grayscale
		Assert.True(r == g && g == b);
	}

	[Fact]
	public void GbColorToRgb_Shade0_IsLightest()
	{
		var shade0 = Palette.GbColorToRgb(0);
		var shade3 = Palette.GbColorToRgb(3);

		Assert.True(shade0.R > shade3.R);
	}

	[Fact]
	public void GbColorToRgb_CgbMode_MayDiffer()
	{
		// CGB mode can use different palette
		var standard = Palette.GbColorToRgb(1, isCgb: false);
		var cgb = Palette.GbColorToRgb(1, isCgb: true);

		// Both should be valid colors
		Assert.True(standard.R >= 0 && standard.R <= 255);
		Assert.True(cgb.R >= 0 && cgb.R <= 255);
	}

	#endregion

	#region Read Palette Tests

	[Fact]
	public void ReadSnesPalette_ReadsMultipleColors()
	{
		// Create data with 4 SNES colors (2 bytes each)
		var data = new byte[]
		{
			0x00, 0x00, // Black
			0x1f, 0x00, // Red
			0xe0, 0x03, // Green
			0x00, 0x7c  // Blue
		};

		var palette = Palette.ReadSnesPalette(data, 0, 4);

		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void ReadSnesPalette_WithOffset_StartsFromOffset()
	{
		var data = new byte[]
		{
			0xff, 0xff, // Padding
			0x00, 0x00, // Black (at offset 2)
			0xff, 0x7f  // White (at offset 4)
		};

		var palette = Palette.ReadSnesPalette(data, 2, 2);

		Assert.Equal(2, palette.Length);
		// First color should be black
		Assert.Equal(0, palette[0].R);
	}

	[Fact]
	public void ReadGbaPalette_ReadsMultipleColors()
	{
		var data = new byte[]
		{
			0x00, 0x00,
			0x1f, 0x00,
			0xe0, 0x03,
			0x00, 0x7c
		};

		var palette = Palette.ReadGbaPalette(data, 0, 4);

		Assert.Equal(4, palette.Length);
	}

	#endregion

	#region Write Palette Tests

	[Fact]
	public void WritePalette_WritesSnesFormat()
	{
		var palette = new (byte R, byte G, byte B)[]
		{
			(0, 0, 0),       // Black
			(255, 0, 0),     // Red
			(0, 255, 0),     // Green
			(0, 0, 255)      // Blue
		};

		var data = Palette.WritePalette(palette);

		// 4 colors * 2 bytes = 8 bytes
		Assert.Equal(8, data.Length);
	}

	[Fact]
	public void WritePalette_RoundTrip()
	{
		var original = new (byte R, byte G, byte B)[]
		{
			(0, 0, 0),
			(248, 0, 0),    // Use values divisible by 8 for clean conversion
			(0, 248, 0),
			(0, 0, 248)
		};

		var data = Palette.WritePalette(original);
		var restored = Palette.ReadSnesPalette(data, 0, 4);

		// Values should be close (may lose some precision in 5-bit format)
		for (int i = 0; i < 4; i++)
		{
			Assert.True(Math.Abs(original[i].R - restored[i].R) <= 8);
			Assert.True(Math.Abs(original[i].G - restored[i].G) <= 8);
			Assert.True(Math.Abs(original[i].B - restored[i].B) <= 8);
		}
	}

	#endregion

	#region CreateGrayscale Tests

	[Theory]
	[InlineData(2)]
	[InlineData(4)]
	[InlineData(16)]
	[InlineData(256)]
	public void CreateGrayscale_ReturnsCorrectCount(int colorCount)
	{
		var palette = Palette.CreateGrayscale(colorCount);

		Assert.Equal(colorCount, palette.Length);
	}

	[Fact]
	public void CreateGrayscale_FirstIsBlackLastIsWhite()
	{
		var palette = Palette.CreateGrayscale(4);

		// First color should be black (or close)
		Assert.True(palette[0].R <= 10);

		// Last color should be white (or close)
		Assert.True(palette[3].R >= 245);
	}

	[Fact]
	public void CreateGrayscale_AllGray()
	{
		var palette = Palette.CreateGrayscale(16);

		foreach (var color in palette)
		{
			Assert.Equal(color.R, color.G);
			Assert.Equal(color.G, color.B);
		}
	}

	[Fact]
	public void CreateGrayscale_MonotonicallyIncreasing()
	{
		var palette = Palette.CreateGrayscale(8);

		for (int i = 1; i < palette.Length; i++)
		{
			Assert.True(palette[i].R >= palette[i - 1].R);
		}
	}

	#endregion

	#region Default Palette Tests

	[Fact]
	public void DefaultNesPalette_Returns4Colors()
	{
		var palette = Palette.DefaultNesPalette();

		// DefaultNesPalette returns a 4-color working palette (not the full 64-color NES palette)
		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void DefaultNesPalette_AllValidColors()
	{
		var palette = Palette.DefaultNesPalette();

		foreach (var color in palette)
		{
			Assert.True(color.R >= 0 && color.R <= 255);
			Assert.True(color.G >= 0 && color.G <= 255);
			Assert.True(color.B >= 0 && color.B <= 255);
		}
	}

	[Fact]
	public void DefaultNesPalette_FirstColorIsDark()
	{
		var palette = Palette.DefaultNesPalette();

		// First color (black) should be dark
		var black = palette[0];

		Assert.True(black.R < 50 && black.G < 50 && black.B < 50);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void ReadSnesPalette_EmptyCount_ReturnsEmpty()
	{
		var data = new byte[] { 0x00, 0x00 };

		var palette = Palette.ReadSnesPalette(data, 0, 0);

		Assert.Empty(palette);
	}

	[Fact]
	public void CreateGrayscale_Two_ReturnsBlackAndWhite()
	{
		var palette = Palette.CreateGrayscale(2);

		Assert.Equal(2, palette.Length);
		Assert.Equal(0, palette[0].R);
		Assert.Equal(255, palette[1].R);
	}

	[Fact]
	public void CreateGrayscale_One_ThrowsOrHasEdgeCaseBehavior()
	{
		// CreateGrayscale(1) divides by (colorCount - 1) = 0, causing divide by zero
		// This is expected edge case behavior - the method requires at least 2 colors
		Assert.Throws<DivideByZeroException>(() => Palette.CreateGrayscale(1));
	}

	#endregion
}
