using System.Drawing;
using GameInfoTools.Core.Graphics;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for PaletteAnalyzer and related types.
/// </summary>
public class PaletteAnalyzerTests {
	#region GamePalette Tests

	[Fact]
	public void GamePalette_Constructor_CreatesEmpty() {
		var palette = new GamePalette();

		Assert.Equal(0, palette.Count);
		Assert.Equal("Untitled", palette.Name);
	}

	[Fact]
	public void GamePalette_AddColor_IncreasesCount() {
		var palette = new GamePalette();

		palette.AddColor(Color.Red);

		Assert.Equal(1, palette.Count);
	}

	[Fact]
	public void GamePalette_GetColor_ReturnsCorrectColor() {
		var palette = new GamePalette();
		palette.AddColor(Color.Red);
		palette.AddColor(Color.Green);
		palette.AddColor(Color.Blue);

		Assert.Equal(Color.Red.ToArgb(), palette.GetColor(0).ToArgb());
		Assert.Equal(Color.Green.ToArgb(), palette.GetColor(1).ToArgb());
		Assert.Equal(Color.Blue.ToArgb(), palette.GetColor(2).ToArgb());
	}

	[Fact]
	public void GamePalette_GetColor_OutOfRange_ReturnsMagenta() {
		var palette = new GamePalette();

		var color = palette.GetColor(100);

		Assert.Equal(Color.Magenta.ToArgb(), color.ToArgb());
	}

	[Fact]
	public void GamePalette_SetColor_UpdatesColor() {
		var palette = new GamePalette();
		palette.AddColor(Color.Red);

		palette.SetColor(0, Color.Blue);

		Assert.Equal(Color.Blue.ToArgb(), palette.GetColor(0).ToArgb());
	}

	[Fact]
	public void GamePalette_SetColor_ExpandsIfNeeded() {
		var palette = new GamePalette();

		palette.SetColor(5, Color.Red);

		Assert.Equal(6, palette.Count);
		Assert.Equal(Color.Red.ToArgb(), palette.GetColor(5).ToArgb());
	}

	[Fact]
	public void GamePalette_Clear_RemovesAllColors() {
		var palette = new GamePalette();
		palette.AddColor(Color.Red);
		palette.AddColor(Color.Green);

		palette.Clear();

		Assert.Equal(0, palette.Count);
	}

	[Fact]
	public void GamePalette_Clone_CreatesDeepCopy() {
		var original = new GamePalette { Name = "Original" };
		original.AddColor(Color.Red);
		original.AddColor(Color.Green);

		var clone = original.Clone();
		clone.Name = "Clone";
		clone.SetColor(0, Color.Blue);

		Assert.Equal("Original", original.Name);
		Assert.Equal(Color.Red.ToArgb(), original.GetColor(0).ToArgb());
		Assert.Equal("Clone", clone.Name);
		Assert.Equal(Color.Blue.ToArgb(), clone.GetColor(0).ToArgb());
	}

	#endregion

	#region PaletteFormat Tests

	[Fact]
	public void PaletteFormat_AllValues_Exist() {
		var formats = Enum.GetValues<PaletteFormat>();

		Assert.Contains(PaletteFormat.Rgb888, formats);
		Assert.Contains(PaletteFormat.Bgr888, formats);
		Assert.Contains(PaletteFormat.Rgb555, formats);
		Assert.Contains(PaletteFormat.Genesis, formats);
		Assert.Contains(PaletteFormat.Nes, formats);
		Assert.Contains(PaletteFormat.GameBoy, formats);
		Assert.Contains(PaletteFormat.GameBoyColor, formats);
	}

	#endregion

	#region ParseFromBytes Tests

	[Fact]
	public void PaletteAnalyzer_ParseFromBytes_Rgb888_ParsesCorrectly() {
		var data = new byte[] { 255, 0, 0, 0, 255, 0, 0, 0, 255 }; // R, G, B

		var palette = PaletteAnalyzer.ParseFromBytes(data, PaletteFormat.Rgb888, 3);

		Assert.Equal(3, palette.Count);
		Assert.Equal(255, palette.GetColor(0).R);
		Assert.Equal(255, palette.GetColor(1).G);
		Assert.Equal(255, palette.GetColor(2).B);
	}

	[Fact]
	public void PaletteAnalyzer_ParseFromBytes_Bgr888_ParsesCorrectly() {
		var data = new byte[] { 0, 0, 255, 0, 255, 0, 255, 0, 0 }; // B, G, R swapped

		var palette = PaletteAnalyzer.ParseFromBytes(data, PaletteFormat.Bgr888, 3);

		Assert.Equal(3, palette.Count);
		Assert.Equal(255, palette.GetColor(0).R);
		Assert.Equal(255, palette.GetColor(1).G);
		Assert.Equal(255, palette.GetColor(2).B);
	}

	[Fact]
	public void PaletteAnalyzer_ParseFromBytes_Rgb555_ParsesCorrectly() {
		// RGB555: 0BBBBBGG GGGRRRRR
		// Pure red (31 in low 5 bits): 0x001F
		var data = new byte[] { 0x1f, 0x00 };

		var palette = PaletteAnalyzer.ParseFromBytes(data, PaletteFormat.Rgb555, 1);

		Assert.Equal(1, palette.Count);
		Assert.Equal(255, palette.GetColor(0).R); // 31 * 255 / 31 = 255
		Assert.Equal(0, palette.GetColor(0).G);
		Assert.Equal(0, palette.GetColor(0).B);
	}

	[Fact]
	public void PaletteAnalyzer_ParseFromBytes_Genesis_ParsesCorrectly() {
		// Genesis: 0000BBB0 GGG0RRR0 (big endian, 9-bit color)
		// Pure red (7 in bits 1-3): 0x000E
		var data = new byte[] { 0x00, 0x0e };

		var palette = PaletteAnalyzer.ParseFromBytes(data, PaletteFormat.Genesis, 1);

		Assert.Equal(1, palette.Count);
		Assert.Equal(255, palette.GetColor(0).R); // 7 * 255 / 7 = 255
	}

	[Fact]
	public void PaletteAnalyzer_ParseFromBytes_Nes_UsesLookupTable() {
		var data = new byte[] { 0x00, 0x16, 0x27 };

		var palette = PaletteAnalyzer.ParseFromBytes(data, PaletteFormat.Nes, 3);

		Assert.Equal(3, palette.Count);
		// NES colors come from lookup table
		Assert.NotEqual(Color.Empty, palette.GetColor(0));
	}

	[Fact]
	public void PaletteAnalyzer_ParseFromBytes_GameBoy_Parses4Shades() {
		var data = new byte[] { 0xe4 }; // BGP register: 11 10 01 00

		var palette = PaletteAnalyzer.ParseFromBytes(data, PaletteFormat.GameBoy, 4);

		Assert.Equal(4, palette.Count);
		// Should be grayscale colors
		Assert.Equal(palette.GetColor(0).R, palette.GetColor(0).G);
		Assert.Equal(palette.GetColor(0).G, palette.GetColor(0).B);
	}

	#endregion

	#region ToBytes Tests

	[Fact]
	public void PaletteAnalyzer_ToBytes_Rgb888_EncodesCorrectly() {
		var palette = new GamePalette { Format = PaletteFormat.Rgb888 };
		palette.AddColor(Color.FromArgb(255, 0, 0));
		palette.AddColor(Color.FromArgb(0, 255, 0));

		var bytes = PaletteAnalyzer.ToBytes(palette);

		Assert.Equal(6, bytes.Length); // 2 colors * 3 bytes
		Assert.Equal(255, bytes[0]); // R
		Assert.Equal(0, bytes[1]);   // G
		Assert.Equal(0, bytes[2]);   // B
		Assert.Equal(0, bytes[3]);   // R
		Assert.Equal(255, bytes[4]); // G
		Assert.Equal(0, bytes[5]);   // B
	}

	[Fact]
	public void PaletteAnalyzer_ToBytes_Rgb555_EncodesCorrectly() {
		var palette = new GamePalette { Format = PaletteFormat.Rgb555 };
		palette.AddColor(Color.FromArgb(255, 0, 0)); // Pure red

		var bytes = PaletteAnalyzer.ToBytes(palette);

		Assert.Equal(2, bytes.Length);
		Assert.Equal(0x1f, bytes[0]); // 31 in low byte
		Assert.Equal(0x00, bytes[1]); // 0 in high byte
	}

	#endregion

	#region Analysis Tests

	[Fact]
	public void PaletteAnalyzer_Analyze_EmptyPalette_ReturnsDefaultResult() {
		var palette = new GamePalette();

		var result = PaletteAnalyzer.Analyze(palette);

		Assert.Equal(0, result.ColorCount);
	}

	[Fact]
	public void PaletteAnalyzer_Analyze_CalculatesColorCount() {
		var palette = new GamePalette();
		palette.AddColor(Color.Red);
		palette.AddColor(Color.Green);
		palette.AddColor(Color.Blue);

		var result = PaletteAnalyzer.Analyze(palette);

		Assert.Equal(3, result.ColorCount);
		Assert.Equal(3, result.UniqueColorCount);
	}

	[Fact]
	public void PaletteAnalyzer_Analyze_DetectsDuplicates() {
		var palette = new GamePalette();
		palette.AddColor(Color.Red);
		palette.AddColor(Color.Red);
		palette.AddColor(Color.Blue);

		var result = PaletteAnalyzer.Analyze(palette);

		Assert.Equal(3, result.ColorCount);
		Assert.Equal(2, result.UniqueColorCount);
	}

	[Fact]
	public void PaletteAnalyzer_Analyze_FindsBrightestAndDarkest() {
		var palette = new GamePalette();
		palette.AddColor(Color.White);
		palette.AddColor(Color.Gray);
		palette.AddColor(Color.Black);

		var result = PaletteAnalyzer.Analyze(palette);

		Assert.Equal(Color.White.ToArgb(), result.BrightestColor.ToArgb());
		Assert.Equal(Color.Black.ToArgb(), result.DarkestColor.ToArgb());
	}

	[Fact]
	public void PaletteAnalyzer_Analyze_DetectsGrayscale() {
		var palette = new GamePalette();
		palette.AddColor(Color.FromArgb(255, 255, 255));
		palette.AddColor(Color.FromArgb(128, 128, 128));
		palette.AddColor(Color.FromArgb(0, 0, 0));

		var result = PaletteAnalyzer.Analyze(palette);

		Assert.True(result.IsGrayscale);
	}

	[Fact]
	public void PaletteAnalyzer_Analyze_DetectsColor() {
		var palette = new GamePalette();
		palette.AddColor(Color.Red);
		palette.AddColor(Color.Green);

		var result = PaletteAnalyzer.Analyze(palette);

		Assert.False(result.IsGrayscale);
	}

	#endregion

	#region FindClosestColor Tests

	[Fact]
	public void PaletteAnalyzer_FindClosestColor_FindsExactMatch() {
		var palette = new GamePalette();
		palette.AddColor(Color.Red);
		palette.AddColor(Color.Green);
		palette.AddColor(Color.Blue);

		var index = PaletteAnalyzer.FindClosestColor(palette, Color.Green);

		Assert.Equal(1, index);
	}

	[Fact]
	public void PaletteAnalyzer_FindClosestColor_FindsClosestMatch() {
		var palette = new GamePalette();
		palette.AddColor(Color.Black);
		palette.AddColor(Color.White);

		// Dark gray should be closer to black
		var index = PaletteAnalyzer.FindClosestColor(palette, Color.FromArgb(50, 50, 50));

		Assert.Equal(0, index);
	}

	#endregion

	#region Preset Palette Tests

	[Fact]
	public void PaletteAnalyzer_CreateGrayscaleRamp_CreatesCorrectCount() {
		var palette = PaletteAnalyzer.CreateGrayscaleRamp(16);

		Assert.Equal(16, palette.Count);
	}

	[Fact]
	public void PaletteAnalyzer_CreateGrayscaleRamp_StartsWithBlackEndsWithWhite() {
		var palette = PaletteAnalyzer.CreateGrayscaleRamp(16);

		Assert.Equal(0, palette.GetColor(0).R);
		Assert.Equal(255, palette.GetColor(15).R);
	}

	[Fact]
	public void PaletteAnalyzer_CreateGameBoyPalette_Creates4Colors() {
		var palette = PaletteAnalyzer.CreateGameBoyPalette();

		Assert.Equal(4, palette.Count);
		Assert.Equal("Game Boy", palette.Name);
		Assert.Equal(PaletteFormat.GameBoy, palette.Format);
		Assert.Equal(2, palette.BitsPerPixel);
	}

	#endregion
}
