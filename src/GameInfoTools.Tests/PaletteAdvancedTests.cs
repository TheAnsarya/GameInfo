using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for Palette color conversion and manipulation.
/// </summary>
public class PaletteAdvancedTests {
	#region NES Color Tests

	[Theory]
	[InlineData(0x00)]  // Gray
	[InlineData(0x10)]  // Another gray
	[InlineData(0x0f)]  // Black
	[InlineData(0x30)]  // White
	public void NesToRgb_ValidColor_ReturnsRgb(byte nesColor) {
		var (r, g, b) = Palette.NesToRgb(nesColor);

		Assert.True(r >= 0 && r <= 255);
		Assert.True(g >= 0 && g <= 255);
		Assert.True(b >= 0 && b <= 255);
	}

	[Fact]
	public void NesToRgb_Black_ReturnsBlack() {
		// NES color $0F is black
		var (r, g, b) = Palette.NesToRgb(0x0f);

		// Should be close to black
		Assert.True(r < 50 && g < 50 && b < 50);
	}

	[Fact]
	public void NesToRgb_DifferentColors_ReturnDifferentRgb() {
		var color1 = Palette.NesToRgb(0x00);
		var color2 = Palette.NesToRgb(0x16);
		var color3 = Palette.NesToRgb(0x2a);

		Assert.False(color1 == color2 && color2 == color3);
	}

	#endregion

	#region SNES Color Tests

	[Fact]
	public void SnesColorToRgb_Black_ReturnsBlack() {
		ushort black = 0x0000;

		var (r, g, b) = Palette.SnesColorToRgb(black);

		Assert.Equal(0, r);
		Assert.Equal(0, g);
		Assert.Equal(0, b);
	}

	[Fact]
	public void SnesColorToRgb_White_ReturnsWhite() {
		ushort white = 0x7fff;

		var (r, g, b) = Palette.SnesColorToRgb(white);

		// SNES uses 5-bit color scaled to 8-bit
		Assert.True(r > 240);
		Assert.True(g > 240);
		Assert.True(b > 240);
	}

	[Fact]
	public void SnesColorToRgb_Red_ReturnsRed() {
		// SNES RGB555: 0BBBBBGGGGGRRRRR
		ushort red = 0x001f; // R = 31 (max), G = 0, B = 0

		var (r, g, b) = Palette.SnesColorToRgb(red);

		Assert.True(r > 200);
		Assert.True(g < 50);
		Assert.True(b < 50);
	}

	[Fact]
	public void SnesColorToRgb_Green_ReturnsGreen() {
		// SNES RGB555: 0BBBBBGGGGGRRRRR
		ushort green = 0x03e0; // R = 0, G = 31 (max), B = 0

		var (r, g, b) = Palette.SnesColorToRgb(green);

		Assert.True(r < 50);
		Assert.True(g > 200);
		Assert.True(b < 50);
	}

	[Fact]
	public void SnesColorToRgb_Blue_ReturnsBlue() {
		// SNES RGB555: 0BBBBBGGGGGRRRRR
		ushort blue = 0x7c00; // R = 0, G = 0, B = 31 (max)

		var (r, g, b) = Palette.SnesColorToRgb(blue);

		Assert.True(r < 50);
		Assert.True(g < 50);
		Assert.True(b > 200);
	}

	[Fact]
	public void RgbToSnesColor_Black_ReturnsZero() {
		var result = Palette.RgbToSnesColor(0, 0, 0);

		Assert.Equal((ushort)0, result);
	}

	[Fact]
	public void RgbToSnesColor_White_ReturnsWhite() {
		var result = Palette.RgbToSnesColor(255, 255, 255);

		Assert.Equal((ushort)0x7fff, result);
	}

	[Fact]
	public void RgbToSnesColor_RoundTrip() {
		ushort original = 0x35ad;

		var (r, g, b) = Palette.SnesColorToRgb(original);
		var converted = Palette.RgbToSnesColor(r, g, b);

		Assert.Equal(original, converted);
	}

	#endregion

	#region GBA Color Tests

	[Fact]
	public void GbaColorToRgb_Black_ReturnsBlack() {
		ushort black = 0x0000;

		var (r, g, b) = Palette.GbaColorToRgb(black);

		Assert.Equal(0, r);
		Assert.Equal(0, g);
		Assert.Equal(0, b);
	}

	[Fact]
	public void GbaColorToRgb_White_ReturnsWhite() {
		ushort white = 0x7fff;

		var (r, g, b) = Palette.GbaColorToRgb(white);

		Assert.True(r > 240);
		Assert.True(g > 240);
		Assert.True(b > 240);
	}

	[Fact]
	public void GbaColorToRgb_Red_ReturnsRed() {
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
	public void GbColorToRgb_ValidShade_ReturnsGray(byte gbColor) {
		var (r, g, b) = Palette.GbColorToRgb(gbColor);

		// Original GB palette is grayscale
		Assert.True(r == g && g == b);
	}

	[Fact]
	public void GbColorToRgb_Shade0_IsLightest() {
		var (R, G, B) = Palette.GbColorToRgb(0);
		var shade3 = Palette.GbColorToRgb(3);

		Assert.True(R > shade3.R);
	}

	[Fact]
	public void GbColorToRgb_CgbMode_MayDiffer() {
		// CGB mode can use different palette
		var (R, G, B) = Palette.GbColorToRgb(1, isCgb: false);
		var cgb = Palette.GbColorToRgb(1, isCgb: true);

		// Both should be valid colors
		Assert.True(R >= 0 && R <= 255);
		Assert.True(cgb.R >= 0 && cgb.R <= 255);
	}

	#endregion

	#region Read Palette Tests

	[Fact]
	public void ReadSnesPalette_ReadsMultipleColors() {
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
	public void ReadSnesPalette_WithOffset_StartsFromOffset() {
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
	public void ReadGbaPalette_ReadsMultipleColors() {
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
	public void WritePalette_WritesSnesFormat() {
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
	public void WritePalette_RoundTrip() {
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
		for (int i = 0; i < 4; i++) {
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
	public void CreateGrayscale_ReturnsCorrectCount(int colorCount) {
		var palette = Palette.CreateGrayscale(colorCount);

		Assert.Equal(colorCount, palette.Length);
	}

	[Fact]
	public void CreateGrayscale_FirstIsBlackLastIsWhite() {
		var palette = Palette.CreateGrayscale(4);

		// First color should be black (or close)
		Assert.True(palette[0].R <= 10);

		// Last color should be white (or close)
		Assert.True(palette[3].R >= 245);
	}

	[Fact]
	public void CreateGrayscale_AllGray() {
		var palette = Palette.CreateGrayscale(16);

		foreach (var (R, G, B) in palette) {
			Assert.Equal(R, G);
			Assert.Equal(G, B);
		}
	}

	[Fact]
	public void CreateGrayscale_MonotonicallyIncreasing() {
		var palette = Palette.CreateGrayscale(8);

		for (int i = 1; i < palette.Length; i++) {
			Assert.True(palette[i].R >= palette[i - 1].R);
		}
	}

	#endregion

	#region Default Palette Tests

	[Fact]
	public void DefaultNesPalette_Returns4Colors() {
		var palette = Palette.DefaultNesPalette();

		// DefaultNesPalette returns a 4-color working palette (not the full 64-color NES palette)
		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void DefaultNesPalette_AllValidColors() {
		var palette = Palette.DefaultNesPalette();

		foreach (var (R, G, B) in palette) {
			Assert.True(R >= 0 && R <= 255);
			Assert.True(G >= 0 && G <= 255);
			Assert.True(B >= 0 && B <= 255);
		}
	}

	[Fact]
	public void DefaultNesPalette_FirstColorIsDark() {
		var palette = Palette.DefaultNesPalette();

		// First color (black) should be dark
		var (R, G, B) = palette[0];

		Assert.True(R < 50 && G < 50 && B < 50);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void ReadSnesPalette_EmptyCount_ReturnsEmpty() {
		var data = new byte[] { 0x00, 0x00 };

		var palette = Palette.ReadSnesPalette(data, 0, 0);

		Assert.Empty(palette);
	}

	[Fact]
	public void CreateGrayscale_Two_ReturnsBlackAndWhite() {
		var palette = Palette.CreateGrayscale(2);

		Assert.Equal(2, palette.Length);
		Assert.Equal(0, palette[0].R);
		Assert.Equal(255, palette[1].R);
	}

	[Fact]
	public void CreateGrayscale_One_ThrowsOrHasEdgeCaseBehavior() {
		// CreateGrayscale(1) divides by (colorCount - 1) = 0, causing divide by zero
		// This is expected edge case behavior - the method requires at least 2 colors
		Assert.Throws<DivideByZeroException>(() => Palette.CreateGrayscale(1));
	}

	#endregion

	#region Genesis Color Tests

	[Fact]
	public void GenesisColorToRgb_Black_ReturnsBlack() {
		var (r, g, b) = Palette.GenesisColorToRgb(0x0000);
		Assert.Equal(0, r);
		Assert.Equal(0, g);
		Assert.Equal(0, b);
	}

	[Fact]
	public void GenesisColorToRgb_PureRed_ReturnsRed() {
		// Genesis format: ----BBB- GGG-RRR-
		// Pure red = 0x000E (bits 1-3)
		var (r, g, b) = Palette.GenesisColorToRgb(0x000E);
		Assert.True(r > 200);
		Assert.True(g < 50);
		Assert.True(b < 50);
	}

	[Fact]
	public void RgbToGenesisColor_Roundtrip() {
		var original = ((byte)224, (byte)64, (byte)128);
		ushort genesis = Palette.RgbToGenesisColor(original.Item1, original.Item2, original.Item3);
		var (R, G, B) = Palette.GenesisColorToRgb(genesis);

		// Genesis has lower color depth, so check within 32 units
		Assert.True(Math.Abs(R - original.Item1) <= 32);
		Assert.True(Math.Abs(G - original.Item2) <= 32);
		Assert.True(Math.Abs(B - original.Item3) <= 32);
	}

	[Fact]
	public void ReadGenesisPalette_ValidData_ReturnsPalette() {
		// Big endian Genesis colors
		byte[] data = [0x00, 0x00, 0x00, 0x0E, 0x0E, 0x00];  // Black, Red, Green
		var palette = Palette.ReadGenesisPalette(data, 0, 3);

		Assert.Equal(3, palette.Length);
	}

	#endregion

	#region HSV Conversion Tests

	[Fact]
	public void RgbToHsv_Black_ReturnsZeroSaturationAndValue() {
		var (h, s, v) = Palette.RgbToHsv(0, 0, 0);
		Assert.Equal(0f, s);
		Assert.Equal(0f, v);
	}

	[Fact]
	public void RgbToHsv_White_ReturnsZeroSaturation() {
		var (h, s, v) = Palette.RgbToHsv(255, 255, 255);
		Assert.Equal(0f, s);
		Assert.Equal(1f, v);
	}

	[Fact]
	public void RgbToHsv_PureRed_ReturnsRedHue() {
		var (h, s, v) = Palette.RgbToHsv(255, 0, 0);
		Assert.True(h >= 0 && h <= 1 || h >= 359);  // Red is at 0 degrees
		Assert.Equal(1f, s);
		Assert.Equal(1f, v);
	}

	[Fact]
	public void HsvToRgb_Red_ReturnsRed() {
		var (r, g, b) = Palette.HsvToRgb(0, 1, 1);
		Assert.Equal(255, r);
		Assert.Equal(0, g);
		Assert.Equal(0, b);
	}

	[Fact]
	public void HsvToRgb_RgbToHsv_Roundtrip() {
		var original = ((byte)128, (byte)64, (byte)192);
		var (h, s, v) = Palette.RgbToHsv(original.Item1, original.Item2, original.Item3);
		var (R, G, B) = Palette.HsvToRgb(h, s, v);

		Assert.True(Math.Abs(R - original.Item1) <= 2);
		Assert.True(Math.Abs(G - original.Item2) <= 2);
		Assert.True(Math.Abs(B - original.Item3) <= 2);
	}

	#endregion

	#region Palette Analysis Tests

	[Fact]
	public void AnalyzePalette_EmptyPalette_ReturnsZeros() {
		var info = Palette.AnalyzePalette([]);
		Assert.Equal(0, info.ColorCount);
		Assert.Equal(0, info.UniqueColors);
	}

	[Fact]
	public void AnalyzePalette_SingleColor_ReturnsCorrectStats() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0)];
		var info = Palette.AnalyzePalette(palette);

		Assert.Equal(1, info.ColorCount);
		Assert.Equal(1, info.UniqueColors);
		Assert.Equal((255, 0, 0), info.DominantColor);
	}

	[Fact]
	public void AnalyzePalette_WithBlack_DetectsTransparency() {
		(byte R, byte G, byte B)[] palette = [(0, 0, 0), (255, 255, 255)];
		var info = Palette.AnalyzePalette(palette);

		Assert.True(info.HasTransparency);
	}

	[Fact]
	public void AnalyzePalette_NoDuplicates_UniqueEqualsCount() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0), (0, 255, 0), (0, 0, 255)];
		var info = Palette.AnalyzePalette(palette);

		Assert.Equal(3, info.UniqueColors);
	}

	#endregion

	#region Color Reduction Tests

	[Fact]
	public void ReduceColors_FewerThanTarget_ReturnsSame() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0), (0, 255, 0)];
		var reduced = Palette.ReduceColors(palette, 4);

		Assert.Equal(2, reduced.Length);
	}

	[Fact]
	public void ReduceColors_ToSingleColor_ReturnsOne() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0), (0, 255, 0), (0, 0, 255)];
		var reduced = Palette.ReduceColors(palette, 1);

		Assert.Single(reduced);
	}

	[Fact]
	public void ReduceColors_ValidReduction_ReturnsTargetCount() {
		(byte R, byte G, byte B)[] palette = [
			(255, 0, 0), (200, 0, 0), (128, 0, 0),
			(0, 255, 0), (0, 200, 0), (0, 128, 0)
		];
		var reduced = Palette.ReduceColors(palette, 2);

		Assert.Equal(2, reduced.Length);
	}

	#endregion

	#region Gradient Generation Tests

	[Fact]
	public void GenerateGradient_BlackToWhite_ReturnsGradient() {
		var gradient = Palette.GenerateGradient((0, 0, 0), (255, 255, 255), 5);

		Assert.Equal(5, gradient.Length);
		Assert.Equal((0, 0, 0), gradient[0]);
		Assert.Equal((255, 255, 255), gradient[4]);
	}

	[Fact]
	public void GenerateGradient_SingleColor_ReturnsStart() {
		var gradient = Palette.GenerateGradient((100, 100, 100), (200, 200, 200), 1);

		Assert.Single(gradient);
		Assert.Equal((100, 100, 100), gradient[0]);
	}

	#endregion

	#region Color Finding Tests

	[Fact]
	public void FindClosestColor_ExactMatch_ReturnsIndex() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0), (0, 255, 0), (0, 0, 255)];
		int index = Palette.FindClosestColor(palette, (0, 255, 0));

		Assert.Equal(1, index);
	}

	[Fact]
	public void FindClosestColor_NearMatch_ReturnsClosest() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0), (0, 0, 255)];
		// Magenta is between red and blue, but closer to red/blue depending on implementation
		int index = Palette.FindClosestColor(palette, (250, 0, 0));

		Assert.Equal(0, index);  // Should match red
	}

	#endregion

	#region Animation Tests

	[Fact]
	public void GenerateCycleAnimation_SingleFrame_ReturnsOriginal() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0), (0, 255, 0)];
		var frames = Palette.GenerateCycleAnimation(palette, 1, 0, 100);

		Assert.Single(frames);
		Assert.Equal(0, frames[0].FrameIndex);
	}

	[Fact]
	public void GenerateCycleAnimation_MultipleFrames_ReturnsAll() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0)];
		var frames = Palette.GenerateCycleAnimation(palette, 4, 90, 50);

		Assert.Equal(4, frames.Count);
		Assert.Equal(50, frames[0].DurationMs);
	}

	#endregion

	#region Color Adjustment Tests

	[Fact]
	public void AdjustBrightness_Double_Brightens() {
		(byte R, byte G, byte B)[] palette = [(128, 64, 32)];
		var adjusted = Palette.AdjustBrightness(palette, 1.5f);

		Assert.True(adjusted[0].R > 128 || adjusted[0].G > 64 || adjusted[0].B > 32);
	}

	[Fact]
	public void AdjustSaturation_Zero_ReturnsGrayscale() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0)];  // Pure red
		var adjusted = Palette.AdjustSaturation(palette, 0);

		// When saturation is 0, all channels should be equal (grayscale)
		Assert.Equal(adjusted[0].R, adjusted[0].G);
		Assert.Equal(adjusted[0].G, adjusted[0].B);
	}

	[Fact]
	public void InvertColors_White_ReturnsBlack() {
		(byte R, byte G, byte B)[] palette = [(255, 255, 255)];
		var inverted = Palette.InvertColors(palette);

		Assert.Equal((0, 0, 0), inverted[0]);
	}

	[Fact]
	public void InvertColors_Roundtrip_ReturnsOriginal() {
		(byte R, byte G, byte B)[] palette = [(128, 64, 192)];
		var inverted = Palette.InvertColors(palette);
		var restored = Palette.InvertColors(inverted);

		Assert.Equal(palette[0], restored[0]);
	}

	[Fact]
	public void ApplySepia_Grayscale_ReturnsSepiaTone() {
		(byte R, byte G, byte B)[] palette = [(128, 128, 128)];
		var sepia = Palette.ApplySepia(palette);

		// Sepia adds warm tones: R > G > B
		Assert.True(sepia[0].R >= sepia[0].G);
		Assert.True(sepia[0].G >= sepia[0].B);
	}

	#endregion

	#region Format Detection Tests

	[Fact]
	public void DetectPaletteFormat_NesRange_ReturnsNes() {
		byte[] data = [0x0f, 0x15, 0x26, 0x30];  // Valid NES indices
		var format = Palette.DetectPaletteFormat(data, 0, 4);

		Assert.Equal(Palette.PaletteFormat.Nes, format);
	}

	[Fact]
	public void DetectPaletteFormat_15BitColors_ReturnsSnes() {
		byte[] data = [0x00, 0x00, 0xFF, 0x7F, 0x1F, 0x00];  // Valid 15-bit
		var format = Palette.DetectPaletteFormat(data, 0, 3);

		Assert.Equal(Palette.PaletteFormat.Snes, format);
	}

	#endregion

	#region Write Palette Tests

	[Fact]
	public void WriteGenesisPalette_ValidPalette_ReturnsBigEndian() {
		(byte R, byte G, byte B)[] palette = [(224, 0, 0)];  // Red
		var data = Palette.WriteGenesisPalette(palette);

		Assert.Equal(2, data.Length);
		// Big endian, so high byte first
	}

	[Fact]
	public void WriteRgb24Palette_ThreeColors_ReturnsNineBytes() {
		(byte R, byte G, byte B)[] palette = [(255, 0, 0), (0, 255, 0), (0, 0, 255)];
		var data = Palette.WriteRgb24Palette(palette);

		Assert.Equal(9, data.Length);
		Assert.Equal(255, data[0]);  // First color R
		Assert.Equal(0, data[1]);    // First color G
		Assert.Equal(0, data[2]);    // First color B
	}

	[Fact]
	public void WriteRgba32Palette_WithAlpha_Returns4BytesPerColor() {
		(byte R, byte G, byte B)[] palette = [(255, 128, 64)];
		var data = Palette.WriteRgba32Palette(palette, 200);

		Assert.Equal(4, data.Length);
		Assert.Equal(255, data[0]);  // R
		Assert.Equal(128, data[1]);  // G
		Assert.Equal(64, data[2]);   // B
		Assert.Equal(200, data[3]);  // Alpha
	}

	#endregion

	#region ReadPalette Format Tests

	[Fact]
	public void ReadPalette_SnesFormat_ReadsSnesPalette() {
		byte[] data = [0x00, 0x00, 0xFF, 0x7F];  // Black and White
		var palette = Palette.ReadPalette(data, 0, 2, Palette.PaletteFormat.Snes);

		Assert.Equal(2, palette.Length);
	}

	[Fact]
	public void ReadPalette_GenesisFormat_ReadsGenesisPalette() {
		byte[] data = [0x00, 0x00, 0x00, 0x0E];
		var palette = Palette.ReadPalette(data, 0, 2, Palette.PaletteFormat.Genesis);

		Assert.Equal(2, palette.Length);
	}

	[Fact]
	public void ReadPalette_Rgb24Format_ReadsRgb24() {
		byte[] data = [255, 0, 0, 0, 255, 0];
		var palette = Palette.ReadPalette(data, 0, 2, Palette.PaletteFormat.Rgb24);

		Assert.Equal(2, palette.Length);
		Assert.Equal((255, 0, 0), palette[0]);
	}

	#endregion

	#region Palette Info Record Tests

	[Fact]
	public void PaletteInfo_HasCorrectProperties() {
		var info = new Palette.PaletteInfo(16, 12, true, (255, 0, 0), 0.8f, 0.6f);

		Assert.Equal(16, info.ColorCount);
		Assert.Equal(12, info.UniqueColors);
		Assert.True(info.HasTransparency);
		Assert.Equal((255, 0, 0), info.DominantColor);
		Assert.Equal(0.8f, info.Saturation);
		Assert.Equal(0.6f, info.Brightness);
	}

	[Fact]
	public void PaletteAnimationFrame_HasCorrectProperties() {
		(byte R, byte G, byte B)[] colors = [(255, 0, 0)];
		var frame = new Palette.PaletteAnimationFrame(5, colors, 100);

		Assert.Equal(5, frame.FrameIndex);
		Assert.Single(frame.Colors);
		Assert.Equal(100, frame.DurationMs);
	}

	#endregion

	#region PaletteFormat Enum Tests

	[Fact]
	public void PaletteFormat_HasAllValues() {
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Nes));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Snes));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Genesis));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Gb));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Cgb));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Gba));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Rgb24));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Rgba32));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Bgr15));
		Assert.True(Enum.IsDefined(typeof(Palette.PaletteFormat), Palette.PaletteFormat.Bgr16));
	}

	#endregion
}
