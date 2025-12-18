using GameInfoTools.Graphics;

namespace GameInfoTools.Tests.Graphics;

/// <summary>
/// Tests for FontEditor.
/// </summary>
public class FontEditorTests {
	[Fact]
	public void Constructor_Default_CreatesEmptyEditor() {
		var editor = new FontEditor();
		Assert.NotNull(editor);
		Assert.Equal(0, editor.GlyphCount);
	}

	[Fact]
	public void Constructor_WithConfig_InitializesGlyphs() {
		var config = new FontEditor.FontConfig {
			CharCount = 128,
			TileWidth = 8,
			TileHeight = 8
		};
		var editor = new FontEditor(config);

		Assert.Equal(128, editor.GlyphCount);
	}

	[Fact]
	public void LoadFromData_Nes2bpp_LoadsCorrectCount() {
		var editor = new FontEditor();
		var data = new byte[16 * 10]; // 10 tiles, 16 bytes each

		int count = editor.LoadFromData(data, FontEditor.TileFormat.Nes2bpp);

		Assert.Equal(10, count);
		Assert.Equal(10, editor.GlyphCount);
	}

	[Fact]
	public void LoadFromData_Snes4bpp_LoadsCorrectCount() {
		var editor = new FontEditor();
		var data = new byte[32 * 5]; // 5 tiles, 32 bytes each (4bpp)

		int count = editor.LoadFromData(data, FontEditor.TileFormat.Snes4bpp);

		Assert.Equal(5, count);
	}

	[Fact]
	public void GetGlyph_ValidIndex_ReturnsGlyph() {
		var config = new FontEditor.FontConfig { CharCount = 10 };
		var editor = new FontEditor(config);

		var glyph = editor.GetGlyph(5);

		Assert.NotNull(glyph);
		Assert.Equal(5, glyph.CharCode);
	}

	[Fact]
	public void GetGlyph_InvalidIndex_ReturnsNull() {
		var config = new FontEditor.FontConfig { CharCount = 10 };
		var editor = new FontEditor(config);

		var glyph = editor.GetGlyph(100);

		Assert.Null(glyph);
	}

	[Fact]
	public void SetPixel_ValidCoordinates_SetsValue() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);

		bool result = editor.SetPixel(0, 3, 4, 2);

		Assert.True(result);
		Assert.Equal(2, editor.GetPixel(0, 3, 4));
	}

	[Fact]
	public void SetPixel_InvalidCoordinates_ReturnsFalse() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);

		bool result = editor.SetPixel(0, 100, 100, 1);

		Assert.False(result);
	}

	[Fact]
	public void GetPixel_InvalidCoordinates_ReturnsNegative() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);

		int value = editor.GetPixel(0, 100, 100);

		Assert.Equal(-1, value);
	}

	[Fact]
	public void CopyGlyph_ValidIndices_CopiesData() {
		var config = new FontEditor.FontConfig { CharCount = 10 };
		var editor = new FontEditor(config);
		editor.SetPixel(0, 3, 3, 2);

		bool result = editor.CopyGlyph(0, 5);

		Assert.True(result);
		Assert.Equal(2, editor.GetPixel(5, 3, 3));
	}

	[Fact]
	public void ClearGlyph_ValidIndex_ClearsAllPixels() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);
		editor.SetPixel(0, 3, 3, 2);
		editor.SetPixel(0, 4, 4, 3);

		bool result = editor.ClearGlyph(0);

		Assert.True(result);
		Assert.Equal(0, editor.GetPixel(0, 3, 3));
		Assert.Equal(0, editor.GetPixel(0, 4, 4));
	}

	[Fact]
	public void FlipHorizontal_ReversesPixelsInRow() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);
		editor.SetPixel(0, 0, 0, 1);
		editor.SetPixel(0, 7, 0, 2);

		editor.FlipHorizontal(0);

		Assert.Equal(2, editor.GetPixel(0, 0, 0));
		Assert.Equal(1, editor.GetPixel(0, 7, 0));
	}

	[Fact]
	public void FlipVertical_ReversesPixelsInColumn() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);
		editor.SetPixel(0, 0, 0, 1);
		editor.SetPixel(0, 0, 7, 2);

		editor.FlipVertical(0);

		Assert.Equal(2, editor.GetPixel(0, 0, 0));
		Assert.Equal(1, editor.GetPixel(0, 0, 7));
	}

	[Fact]
	public void InvertColors_InvertsAllPixels() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);
		editor.SetPixel(0, 0, 0, 0);
		editor.SetPixel(0, 1, 0, 3);

		editor.InvertColors(0, maxColorIndex: 3);

		Assert.Equal(3, editor.GetPixel(0, 0, 0));
		Assert.Equal(0, editor.GetPixel(0, 1, 0));
	}

	[Fact]
	public void CalculateGlyphWidth_EmptyGlyph_ReturnsZero() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);

		int width = editor.CalculateGlyphWidth(0);

		Assert.Equal(0, width);
	}

	[Fact]
	public void CalculateGlyphWidth_WithPixels_ReturnsCorrectWidth() {
		var config = new FontEditor.FontConfig { CharCount = 1 };
		var editor = new FontEditor(config);
		editor.SetPixel(0, 5, 3, 1); // Rightmost pixel at x=5

		int width = editor.CalculateGlyphWidth(0);

		Assert.Equal(6, width); // 0-5 inclusive = 6 pixels
	}

	[Fact]
	public void CalculateVwfWidths_ReturnsArrayOfWidths() {
		var config = new FontEditor.FontConfig { CharCount = 3 };
		var editor = new FontEditor(config);
		editor.SetPixel(0, 3, 0, 1);  // Width = 4 (0-3) + 1 spacing = 5
		editor.SetPixel(1, 5, 0, 1);  // Width = 6 (0-5) + 1 spacing = 7
		editor.SetPixel(2, 7, 0, 1);  // Width = 8 (0-7) + 1 spacing = 9

		var widths = editor.CalculateVwfWidths(minWidth: 1, spacing: 1);

		Assert.Equal(3, widths.Length);
		Assert.Equal(5, widths[0]);  // 4 + 1 spacing
		Assert.Equal(7, widths[1]);  // 6 + 1 spacing
		Assert.Equal(9, widths[2]);  // 8 + 1 spacing
	}

	[Fact]
	public void ApplyCharacterMapping_ParsesTblFormat() {
		var config = new FontEditor.FontConfig { CharCount = 256 };
		var editor = new FontEditor(config);
		var tbl = "00=A\n01=B\n02=C";

		editor.ApplyCharacterMapping(tbl);

		var glyph0 = editor.GetGlyph(0);
		Assert.Equal('A', glyph0?.Character);
	}

	[Fact]
	public void ApplyCharacterMapping_IgnoresComments() {
		var config = new FontEditor.FontConfig { CharCount = 256 };
		var editor = new FontEditor(config);
		var tbl = "# Comment\n00=X\n# Another comment\n01=Y";

		editor.ApplyCharacterMapping(tbl);

		Assert.Equal('X', editor.GetGlyph(0)?.Character);
		Assert.Equal('Y', editor.GetGlyph(1)?.Character);
	}

	[Fact]
	public void ExportToData_Nes2bpp_CorrectSize() {
		var config = new FontEditor.FontConfig {
			Format = FontEditor.TileFormat.Nes2bpp,
			CharCount = 5
		};
		var editor = new FontEditor(config);

		var data = editor.ExportToData();

		Assert.Equal(5 * 16, data.Length); // 16 bytes per NES 2bpp tile
	}

	[Fact]
	public void ExportToData_Snes4bpp_CorrectSize() {
		var config = new FontEditor.FontConfig {
			Format = FontEditor.TileFormat.Snes4bpp,
			CharCount = 5
		};
		var editor = new FontEditor(config);

		var data = editor.ExportToData();

		Assert.Equal(5 * 32, data.Length); // 32 bytes per SNES 4bpp tile
	}

	[Fact]
	public void RoundTrip_Nes2bpp_PreservesData() {
		var editor = new FontEditor();
		var original = new byte[16]; // 1 tile
		original[0] = 0xFF; // Plane 0 = all 1s
		original[8] = 0x00; // Plane 1 = all 0s

		editor.LoadFromData(original, FontEditor.TileFormat.Nes2bpp);
		var exported = editor.ExportToData(FontEditor.TileFormat.Nes2bpp);

		Assert.Equal(original, exported);
	}

	[Fact]
	public void RenderText_EmptyString_ReturnsEmptyArray() {
		var config = new FontEditor.FontConfig {
			CharCount = 256,
			CharMap = new Dictionary<int, char> { { 65, 'A' } }
		};
		var editor = new FontEditor(config);

		var result = editor.RenderText("");

		Assert.Equal(0, result.GetLength(0));
	}

	[Fact]
	public void RenderText_SingleChar_ReturnsCorrectDimensions() {
		var config = new FontEditor.FontConfig {
			CharCount = 256,
			TileWidth = 8,
			TileHeight = 8,
			CharMap = new Dictionary<int, char> { { 65, 'A' } }
		};
		var editor = new FontEditor(config);
		editor.SetPixel(65, 3, 3, 1);

		var result = editor.RenderText("A");

		Assert.Equal(8, result.GetLength(0)); // Height
		Assert.Equal(8, result.GetLength(1)); // Width
		Assert.Equal(1, result[3, 3]);
	}

	[Fact]
	public void ExportConfigJson_ReturnsValidJson() {
		var config = new FontEditor.FontConfig {
			Name = "TestFont",
			Format = FontEditor.TileFormat.Nes2bpp,
			CharCount = 128
		};
		var editor = new FontEditor(config);

		var json = editor.ExportConfigJson();

		Assert.Contains("TestFont", json);
		Assert.Contains("Nes2bpp", json);
	}

	[Fact]
	public void CalculateBytesPerTile_Nes2bpp_Returns16() {
		int bytes = FontEditor.CalculateBytesPerTile(FontEditor.TileFormat.Nes2bpp, 8, 8);
		Assert.Equal(16, bytes);
	}

	[Fact]
	public void CalculateBytesPerTile_Snes4bpp_Returns32() {
		int bytes = FontEditor.CalculateBytesPerTile(FontEditor.TileFormat.Snes4bpp, 8, 8);
		Assert.Equal(32, bytes);
	}

	[Fact]
	public void CalculateBytesPerTile_Mono1bpp_Returns8() {
		int bytes = FontEditor.CalculateBytesPerTile(FontEditor.TileFormat.Mono1bpp, 8, 8);
		Assert.Equal(8, bytes);
	}

	[Fact]
	public void CreateNesPreset_ReturnsCorrectConfig() {
		var preset = FontEditor.CreateNesPreset("My NES Font");

		Assert.Equal("My NES Font", preset.Name);
		Assert.Equal(FontEditor.TileFormat.Nes2bpp, preset.Format);
		Assert.Equal(8, preset.TileWidth);
		Assert.Equal(8, preset.TileHeight);
	}

	[Fact]
	public void CreateSnesPreset_2bpp_ReturnsCorrectFormat() {
		var preset = FontEditor.CreateSnesPreset(is4bpp: false);
		Assert.Equal(FontEditor.TileFormat.Snes2bpp, preset.Format);
	}

	[Fact]
	public void CreateSnesPreset_4bpp_ReturnsCorrectFormat() {
		var preset = FontEditor.CreateSnesPreset(is4bpp: true);
		Assert.Equal(FontEditor.TileFormat.Snes4bpp, preset.Format);
	}

	[Fact]
	public void CreateGameBoyPreset_ReturnsCorrectConfig() {
		var preset = FontEditor.CreateGameBoyPreset();

		Assert.Equal(FontEditor.TileFormat.GameBoy2bpp, preset.Format);
		Assert.Equal(256, preset.CharCount);
	}

	[Fact]
	public void DecodeTile_Nes2bpp_DecodesCorrectly() {
		var data = new byte[16];
		data[0] = 0x80; // Bit 7 set in plane 0
		data[8] = 0x00; // All clear in plane 1
						// This should give pixel[0,0] = 1

		var pixels = FontEditor.DecodeTile(data, FontEditor.TileFormat.Nes2bpp, 8, 8);

		Assert.Equal(1, pixels[0, 0]);
		Assert.Equal(0, pixels[0, 1]);
	}

	[Fact]
	public void DecodeTile_GameBoy2bpp_DecodesCorrectly() {
		var data = new byte[16];
		data[0] = 0x80; // Plane 0, row 0
		data[1] = 0x80; // Plane 1, row 0
						// Pixel[0,0] should be 3 (both bits set)

		var pixels = FontEditor.DecodeTile(data, FontEditor.TileFormat.GameBoy2bpp, 8, 8);

		Assert.Equal(3, pixels[0, 0]);
	}

	[Theory]
	[InlineData(FontEditor.TileFormat.Nes2bpp)]
	[InlineData(FontEditor.TileFormat.Snes2bpp)]
	[InlineData(FontEditor.TileFormat.Snes4bpp)]
	[InlineData(FontEditor.TileFormat.GameBoy2bpp)]
	[InlineData(FontEditor.TileFormat.Mono1bpp)]
	[InlineData(FontEditor.TileFormat.Linear8bpp)]
	[InlineData(FontEditor.TileFormat.Gba4bpp)]
	public void RoundTrip_AllFormats_PreservesPixelData(FontEditor.TileFormat format) {
		int bytesPerTile = FontEditor.CalculateBytesPerTile(format, 8, 8);
		var editor = new FontEditor(new FontEditor.FontConfig {
			Format = format,
			CharCount = 1
		});

		// Set some pixels based on bit depth
		int maxColor = format switch {
			FontEditor.TileFormat.Mono1bpp => 1,
			FontEditor.TileFormat.Snes4bpp or FontEditor.TileFormat.Gba4bpp => 15,
			FontEditor.TileFormat.Linear8bpp => 255,
			_ => 3
		};

		editor.SetPixel(0, 0, 0, (byte)(maxColor > 0 ? 1 : 0));
		editor.SetPixel(0, 4, 4, (byte)Math.Min(2, maxColor));

		var exported = editor.ExportToData(format);
		var editor2 = new FontEditor();
		editor2.LoadFromData(exported, format);

		Assert.Equal(editor.GetPixel(0, 0, 0), editor2.GetPixel(0, 0, 0));
		Assert.Equal(editor.GetPixel(0, 4, 4), editor2.GetPixel(0, 4, 4));
	}
}
