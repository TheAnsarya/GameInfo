using GameInfoTools.Graphics;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for SpriteExtractor functionality including complex sprite parsing,
/// metasprite table detection, rendering, and data export.
/// </summary>
public class SpriteExtractorAdvancedTests {
	#region NesSprite Advanced Tests

	[Theory]
	[InlineData(0x00, 0, false, false, false)]
	[InlineData(0x01, 1, false, false, false)]
	[InlineData(0x02, 2, false, false, false)]
	[InlineData(0x03, 3, false, false, false)]
	[InlineData(0x20, 0, true, false, false)]
	[InlineData(0x40, 0, false, true, false)]
	[InlineData(0x80, 0, false, false, true)]
	[InlineData(0xe3, 3, true, true, true)]
	public void NesSprite_AllAttributeBits_ParsedCorrectly(
		byte attributes, int expectedPalette, bool expectedBehind, bool expectedFlipH, bool expectedFlipV) {
		var sprite = new SpriteExtractor.NesSprite(0, 0, attributes, 0);

		Assert.Equal(expectedPalette, sprite.Palette);
		Assert.Equal(expectedBehind, sprite.BehindBackground);
		Assert.Equal(expectedFlipH, sprite.FlipH);
		Assert.Equal(expectedFlipV, sprite.FlipV);
	}

	[Fact]
	public void NesSprite_FullOamEntry_ParsedCorrectly() {
		// Test common NES sprite configurations
		var sprite = new SpriteExtractor.NesSprite(Y: 0x78, TileIndex: 0x42, Attributes: 0xa3, X: 0x80);

		Assert.Equal(0x78, sprite.Y);      // Y = 120
		Assert.Equal(0x42, sprite.TileIndex);
		Assert.Equal(0x80, sprite.X);       // X = 128
		Assert.Equal(3, sprite.Palette);   // Palette 3
		Assert.True(sprite.BehindBackground);  // Behind background
		Assert.False(sprite.FlipH);
		Assert.True(sprite.FlipV);
	}

	[Fact]
	public void NesSprite_BoundaryValues_Handled() {
		// Test boundary Y values
		var offscreen = new SpriteExtractor.NesSprite(Y: 0xef, TileIndex: 0, Attributes: 0, X: 0);
		Assert.Equal(239, offscreen.Y);  // Just visible at bottom

		var hidden = new SpriteExtractor.NesSprite(Y: 0xf0, TileIndex: 0, Attributes: 0, X: 0);
		Assert.Equal(240, hidden.Y);  // Effectively hidden (scanline 0)

		// Test max values
		var maxSprite = new SpriteExtractor.NesSprite(Y: 0xff, TileIndex: 0xff, Attributes: 0xff, X: 0xff);
		Assert.Equal(255, maxSprite.Y);
		Assert.Equal(255, maxSprite.TileIndex);
		Assert.Equal(255, maxSprite.X);
		Assert.Equal(3, maxSprite.Palette);
		Assert.True(maxSprite.BehindBackground);
		Assert.True(maxSprite.FlipH);
		Assert.True(maxSprite.FlipV);
	}

	#endregion

	#region SnesSprite Advanced Tests

	[Fact]
	public void SnesSprite_FullRange_XCoordinate() {
		// SNES sprites can have negative X (signed 9-bit)
		var leftEdge = new SpriteExtractor.SnesSprite(X: -256, Y: 0, TileIndex: 0, Palette: 0,
			Priority0: false, Priority1: false, FlipH: false, FlipV: false, LargeSize: false);
		Assert.Equal(-256, leftEdge.X);

		var rightEdge = new SpriteExtractor.SnesSprite(X: 511, Y: 0, TileIndex: 0, Palette: 0,
			Priority0: false, Priority1: false, FlipH: false, FlipV: false, LargeSize: false);
		Assert.Equal(511, rightEdge.X);
	}

	[Fact]
	public void SnesSprite_AllPriorityCombinations() {
		var p00 = new SpriteExtractor.SnesSprite(0, 0, 0, 0, false, false, false, false, false);
		Assert.False(p00.Priority0);
		Assert.False(p00.Priority1);

		var p01 = new SpriteExtractor.SnesSprite(0, 0, 0, 0, true, false, false, false, false);
		Assert.True(p01.Priority0);
		Assert.False(p01.Priority1);

		var p10 = new SpriteExtractor.SnesSprite(0, 0, 0, 0, false, true, false, false, false);
		Assert.False(p10.Priority0);
		Assert.True(p10.Priority1);

		var p11 = new SpriteExtractor.SnesSprite(0, 0, 0, 0, true, true, false, false, false);
		Assert.True(p11.Priority0);
		Assert.True(p11.Priority1);
	}

	[Fact]
	public void SnesSprite_LargeSizeFlag_Preserved() {
		var small = new SpriteExtractor.SnesSprite(0, 0, 0, 0, false, false, false, false, LargeSize: false);
		Assert.False(small.LargeSize);

		var large = new SpriteExtractor.SnesSprite(0, 0, 0, 0, false, false, false, false, LargeSize: true);
		Assert.True(large.LargeSize);
	}

	[Fact]
	public void SnesSprite_HighTileIndex_Supported() {
		// SNES supports 10-bit tile index (0-1023)
		var highTile = new SpriteExtractor.SnesSprite(X: 0, Y: 0, TileIndex: 0x3ff, Palette: 7,
			Priority0: true, Priority1: true, FlipH: true, FlipV: true, LargeSize: true);

		Assert.Equal(0x3ff, highTile.TileIndex);
		Assert.Equal(7, highTile.Palette);
	}

	#endregion

	#region ParseNesOam Advanced Tests

	[Fact]
	public void ParseNesOam_Full64Sprites_Parsed() {
		// Create full NES OAM (64 sprites * 4 bytes = 256 bytes)
		var oam = new byte[256];
		for (int i = 0; i < 64; i++) {
			oam[(i * 4) + 0] = (byte)(i * 3);        // Y
			oam[(i * 4) + 1] = (byte)(i * 2);        // Tile
			oam[(i * 4) + 2] = (byte)(i & 0x03);     // Attributes
			oam[(i * 4) + 3] = (byte)(i * 4);        // X
		}

		var sprites = SpriteExtractor.ParseNesOam(oam, 0, 64);

		Assert.Equal(64, sprites.Count);
		Assert.Equal(0, sprites[0].Y);
		Assert.Equal(63 * 3, sprites[63].Y);
	}

	[Fact]
	public void ParseNesOam_WithOffset_StartsAtCorrectPosition() {
		var data = new byte[]
		{
			0xff, 0xff, 0xff, 0xff,  // Padding before OAM
			0x10, 0x20, 0x30, 0x40,  // First sprite at offset 4
			0x50, 0x60, 0x70, 0x80,  // Second sprite
		};

		var sprites = SpriteExtractor.ParseNesOam(data, offset: 4, count: 2);

		Assert.Equal(2, sprites.Count);
		Assert.Equal(0x10, sprites[0].Y);
		Assert.Equal(0x50, sprites[1].Y);
	}

	[Fact]
	public void ParseNesOam_ZeroCount_ReturnsEmpty() {
		var data = new byte[16];
		var sprites = SpriteExtractor.ParseNesOam(data, 0, 0);

		Assert.Empty(sprites);
	}

	[Fact]
	public void ParseNesOam_EmptyData_ReturnsEmpty() {
		var sprites = SpriteExtractor.ParseNesOam([], 0, 10);

		Assert.Empty(sprites);
	}

	[Fact]
	public void ParseNesOam_PartialLastSprite_NotIncluded() {
		// 7 bytes = 1 complete sprite + 3 bytes (incomplete second sprite)
		var data = new byte[] { 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70 };

		var sprites = SpriteExtractor.ParseNesOam(data, 0, 2);

		Assert.Single(sprites);
	}

	#endregion

	#region Metasprite Advanced Tests

	[Fact]
	public void Metasprite_AddMultipleSprites_AllPreserved() {
		var meta = new SpriteExtractor.Metasprite();

		for (int i = 0; i < 16; i++) {
			meta.Sprites.Add((i * 8, i * 4, i, (byte)(i & 0x03)));
		}

		Assert.Equal(16, meta.Sprites.Count);
		Assert.Equal(15 * 8, meta.Sprites[15].OffsetX);
	}

	[Fact]
	public void Metasprite_GetBounds_8x16Mode_DoubleHeight() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((0, 0, 0, 0));  // Single sprite at origin

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);
		var bounds16 = meta.GetBounds(tileHeight: 16);

		Assert.Equal(8, MaxX);
		Assert.Equal(8, MaxY);

		Assert.Equal(8, bounds16.MaxX);
		Assert.Equal(16, bounds16.MaxY);  // Double height in 8x16 mode
	}

	[Fact]
	public void Metasprite_GetBounds_LargeMetasprite() {
		var meta = new SpriteExtractor.Metasprite();

		// Create 4x4 sprite grid (like a large character)
		for (int y = 0; y < 4; y++) {
			for (int x = 0; x < 4; x++) {
				meta.Sprites.Add((x * 8, y * 8, 0, 0));
			}
		}

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);

		Assert.Equal(0, MinX);
		Assert.Equal(0, MinY);
		Assert.Equal(32, MaxX);  // 4 * 8
		Assert.Equal(32, MaxY);  // 4 * 8
	}

	[Fact]
	public void Metasprite_GetBounds_CenteredSprite_NegativeCoords() {
		var meta = new SpriteExtractor.Metasprite();

		// Center-origin metasprite (common for rotation/scaling)
		meta.Sprites.Add((-4, -8, 0, 0));
		meta.Sprites.Add((0, -8, 0, 0));
		meta.Sprites.Add((-4, 0, 0, 0));
		meta.Sprites.Add((0, 0, 0, 0));

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);

		Assert.Equal(-4, MinX);
		Assert.Equal(-8, MinY);
		Assert.Equal(8, MaxX);
		Assert.Equal(8, MaxY);
	}

	[Fact]
	public void Metasprite_PropertiesInitialized() {
		var meta = new SpriteExtractor.Metasprite();

		Assert.NotNull(meta.Sprites);
		Assert.Empty(meta.Sprites);
		Assert.Null(meta.Name);
		Assert.Equal(0, meta.Width);
		Assert.Equal(0, meta.Height);
	}

	#endregion

	#region ExtractMetasprite Advanced Tests

	[Fact]
	public void ExtractMetasprite_MultiRowLayout() {
		// 2x2 sprite grid
		var data = new byte[]
		{
			0x00, 0x00, 0x00, 0x00,  // Top-left
			0x08, 0x00, 0x01, 0x00,  // Top-right
			0x00, 0x08, 0x10, 0x00,  // Bottom-left
			0x08, 0x08, 0x11, 0x00,  // Bottom-right
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 4, is8x16: false);

		Assert.Equal(4, meta.Sprites.Count);
		Assert.Equal(16, meta.Width);
		Assert.Equal(16, meta.Height);
	}

	[Fact]
	public void ExtractMetasprite_8x16Mode_CorrectDimensions() {
		var data = new byte[]
		{
			0x00, 0x00, 0x00, 0x00,  // Single 8x16 sprite
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 1, is8x16: true);

		Assert.Single(meta.Sprites);
		Assert.Equal(8, meta.Width);
		Assert.Equal(16, meta.Height);
	}

	[Fact]
	public void ExtractMetasprite_WithFlipAttributes() {
		var data = new byte[]
		{
			0x00, 0x00, 0x10, 0x00,  // No flip
			0x08, 0x00, 0x11, 0x40,  // Horizontal flip
			0x00, 0x08, 0x12, 0x80,  // Vertical flip
			0x08, 0x08, 0x13, 0xc0,  // Both flips
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 4);

		Assert.Equal(0x00, meta.Sprites[0].Attributes & 0xc0);
		Assert.Equal(0x40, meta.Sprites[1].Attributes & 0xc0);
		Assert.Equal(0x80, meta.Sprites[2].Attributes & 0xc0);
		Assert.Equal(0xc0, meta.Sprites[3].Attributes & 0xc0);
	}

	[Fact]
	public void ExtractMetasprite_FromOffset_CorrectlyPositioned() {
		var data = new byte[]
		{
			0xff, 0xff, 0xff, 0xff,  // Garbage before
			0xff, 0xff, 0xff, 0xff,
			0x04, 0x08, 0x42, 0x03,  // Actual sprite at offset 8
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, offset: 8, spriteCount: 1);

		Assert.Single(meta.Sprites);
		Assert.Equal(4, meta.Sprites[0].OffsetX);
		Assert.Equal(8, meta.Sprites[0].OffsetY);
		Assert.Equal(0x42, meta.Sprites[0].TileIndex);
	}

	[Fact]
	public void ExtractMetasprite_SignedByteConversion() {
		// Test the full range of signed byte offsets
		var data = new byte[]
		{
			0x7f, 0x7f, 0x00, 0x00,  // Max positive: +127, +127
			0x80, 0x80, 0x00, 0x00,  // Min negative: -128, -128
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 2);

		Assert.Equal(127, meta.Sprites[0].OffsetX);
		Assert.Equal(127, meta.Sprites[0].OffsetY);
		Assert.Equal(-128, meta.Sprites[1].OffsetX);
		Assert.Equal(-128, meta.Sprites[1].OffsetY);
	}

	[Fact]
	public void ExtractMetasprite_ZeroSpriteCount_EmptyResult() {
		var data = new byte[16];
		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 0);

		Assert.Empty(meta.Sprites);
	}

	#endregion

	#region GenerateMetaspriteAsm Tests

	[Fact]
	public void GenerateMetaspriteAsm_EmptyMetasprite_CountOnly() {
		var meta = new SpriteExtractor.Metasprite();

		var asm = SpriteExtractor.GenerateMetaspriteAsm(meta, "EmptySprite");

		Assert.Contains("EmptySprite:", asm);
		Assert.Contains(".byte 0", asm);  // sprite count
	}

	[Fact]
	public void GenerateMetaspriteAsm_SingleSprite_CorrectFormat() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((0x10, 0x20, 0x42, 0x03));

		var asm = SpriteExtractor.GenerateMetaspriteAsm(meta, "TestSprite");

		Assert.Contains("TestSprite:", asm);
		Assert.Contains(".byte 1", asm);  // sprite count
		Assert.Contains(".byte $10, $20, $42, $03", asm);
	}

	[Fact]
	public void GenerateMetaspriteAsm_MultipleSprites_AllIncluded() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((0x00, 0x00, 0x00, 0x00));
		meta.Sprites.Add((0x08, 0x00, 0x01, 0x00));
		meta.Sprites.Add((0x00, 0x08, 0x10, 0x40));

		var asm = SpriteExtractor.GenerateMetaspriteAsm(meta, "MultiSprite");

		Assert.Contains(".byte 3", asm);  // sprite count
		var lines = asm.Split('\n');
		// Should have label + count + 3 sprite lines
		Assert.True(lines.Length >= 4);
	}

	[Fact]
	public void GenerateMetaspriteAsm_NegativeOffsets_HandledAsUnsigned() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((-8, -16, 0x00, 0x00));  // -8 = 0xf8, -16 = 0xf0

		var asm = SpriteExtractor.GenerateMetaspriteAsm(meta, "NegOffset");

		// Negative offsets become unsigned bytes
		Assert.Contains("$f8", asm);  // -8 as unsigned byte
		Assert.Contains("$f0", asm);  // -16 as unsigned byte
	}

	[Fact]
	public void GenerateMetaspriteAsm_LowercaseHex() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((0xab, 0xcd, 0xef, 0xff));

		var asm = SpriteExtractor.GenerateMetaspriteAsm(meta, "HexTest");

		Assert.Contains("$ab", asm);
		Assert.Contains("$cd", asm);
		Assert.Contains("$ef", asm);
		Assert.Contains("$ff", asm);
		Assert.DoesNotContain("$AB", asm);
		Assert.DoesNotContain("$CD", asm);
	}

	#endregion

	#region ExportMetaspriteData Tests

	[Fact]
	public void ExportMetaspriteData_EmptyMetasprite_ValidStructure() {
		var meta = new SpriteExtractor.Metasprite { Name = "Empty" };

		var data = SpriteExtractor.ExportMetaspriteData(meta);

		Assert.NotNull(data);

		// Use reflection to verify structure
		var type = data.GetType();
		Assert.NotNull(type.GetProperty("name"));
		Assert.NotNull(type.GetProperty("sprites"));
	}

	[Fact]
	public void ExportMetaspriteData_WithSprites_CorrectData() {
		var meta = new SpriteExtractor.Metasprite {
			Name = "TestMeta",
			Width = 16,
			Height = 16
		};
		meta.Sprites.Add((0, 0, 0x10, 0x43));  // Palette 3, flipH, no flipV, priority

		var data = SpriteExtractor.ExportMetaspriteData(meta);

		// Use reflection to verify anonymous type properties
		var type = data.GetType();
		var nameProp = type.GetProperty("name");
		var widthProp = type.GetProperty("width");
		var heightProp = type.GetProperty("height");
		var spritesProp = type.GetProperty("sprites");

		Assert.Equal("TestMeta", nameProp?.GetValue(data));
		Assert.Equal(16, widthProp?.GetValue(data));
		Assert.Equal(16, heightProp?.GetValue(data));

		var sprites = spritesProp?.GetValue(data) as System.Collections.IList;
		Assert.NotNull(sprites);
		Assert.Single(sprites);
	}

	[Fact]
	public void ExportMetaspriteData_SpriteFlags_DecodedCorrectly() {
		var meta = new SpriteExtractor.Metasprite();
		// Attributes: palette 2 (0x02), behind background (0x20), flipH (0x40), flipV (0x80)
		meta.Sprites.Add((8, 16, 0x42, 0xe2));  // Combined: 0xe2

		var data = SpriteExtractor.ExportMetaspriteData(meta);

		// Use reflection to get sprites list
		var type = data.GetType();
		var spritesProp = type.GetProperty("sprites");
		var sprites = spritesProp?.GetValue(data) as System.Collections.IList;
		Assert.NotNull(sprites);
		Assert.Single(sprites);

		var sprite = sprites[0];
		var spriteType = sprite!.GetType();

		Assert.Equal(8, spriteType.GetProperty("x")?.GetValue(sprite));
		Assert.Equal(16, spriteType.GetProperty("y")?.GetValue(sprite));
		Assert.Equal(0x42, spriteType.GetProperty("tile")?.GetValue(sprite));
		Assert.Equal(2, spriteType.GetProperty("palette")?.GetValue(sprite));     // Lower 2 bits
		Assert.Equal(true, spriteType.GetProperty("flipH")?.GetValue(sprite));    // Bit 6
		Assert.Equal(true, spriteType.GetProperty("flipV")?.GetValue(sprite));    // Bit 7
		Assert.Equal(true, spriteType.GetProperty("priority")?.GetValue(sprite)); // Bit 5
	}

	#endregion

	#region FindMetaspriteTable Tests

	[Fact]
	public void FindMetaspriteTable_ValidPointers_ExtractsMetasprites() {
		// Create test data with pointer table and metasprite data
		// Pointer table starts at offset 0, points to data at 0x8010 (file offset 0x10)
		var data = new byte[0x100];

		// Pointer table at offset 0 (2 pointers)
		data[0] = 0x10;  // Low byte of $8010
		data[1] = 0x80;  // High byte of $8010
		data[2] = 0x20;  // Low byte of $8020
		data[3] = 0x80;  // High byte of $8020

		// Metasprite data at file offset 0x10 (CPU $8010)
		data[0x10] = 0x00;  // X offset
		data[0x11] = 0x00;  // Y offset
		data[0x12] = 0x01;  // Tile
		data[0x13] = 0x00;  // Attr
		data[0x14] = 0xf8;  // Terminator (Y >= 0xf8)

		// Metasprite data at file offset 0x20 (CPU $8020)
		data[0x20] = 0x00;
		data[0x21] = 0x00;
		data[0x22] = 0x02;
		data[0x23] = 0x00;
		data[0x24] = 0xff;  // Terminator
		data[0x25] = 0xff;

		var results = SpriteExtractor.FindMetaspriteTable(
			data, tableOffset: 0, count: 2,
			pointerFormat: Core.PointerTable.PointerFormat.Absolute16);

		Assert.NotEmpty(results);
	}

	[Fact]
	public void FindMetaspriteTable_InvalidPointers_Skipped() {
		var data = new byte[0x20];

		// Pointer pointing outside data
		data[0] = 0xff;
		data[1] = 0xff;  // $FFFF - way outside

		var results = SpriteExtractor.FindMetaspriteTable(
			data, tableOffset: 0, count: 1,
			pointerFormat: Core.PointerTable.PointerFormat.Absolute16);

		Assert.Empty(results);
	}

	#endregion

	#region DetectSpriteCount Tests (via FindMetaspriteTable)

	[Fact]
	public void DetectSpriteCount_TerminatorF8_StopsCorrectly() {
		// Create data with terminator pattern
		var data = new byte[0x30];

		// Pointer to $8010
		data[0] = 0x10;
		data[1] = 0x80;

		// 3 valid sprites followed by Y=0xf8 terminator
		// Format: X offset, Y offset, Tile, Attr - need non-zero values to avoid all-zeros terminator
		data[0x10] = 0x04;
		data[0x11] = 0x04;
		data[0x12] = 0x01;
		data[0x13] = 0x00;  // Sprite 1
		data[0x14] = 0x0c;
		data[0x15] = 0x04;
		data[0x16] = 0x02;
		data[0x17] = 0x00;  // Sprite 2
		data[0x18] = 0x14;
		data[0x19] = 0x04;
		data[0x1a] = 0x03;
		data[0x1b] = 0x00;  // Sprite 3
		data[0x1c] = 0xf8;
		data[0x1d] = 0x00;
		data[0x1e] = 0x00;
		data[0x1f] = 0x00;  // Terminator (first byte >= 0xf8)

		var results = SpriteExtractor.FindMetaspriteTable(
			data, tableOffset: 0, count: 1,
			pointerFormat: Core.PointerTable.PointerFormat.Absolute16);

		Assert.NotEmpty(results);
		Assert.Equal(3, results[0].Sprite.Sprites.Count);
	}

	[Fact]
	public void DetectSpriteCount_AllZeros_StopsCorrectly() {
		var data = new byte[0x30];

		// Pointer to $8010
		data[0] = 0x10;
		data[1] = 0x80;

		// 2 valid sprites followed by all zeros
		data[0x10] = 0x04;
		data[0x11] = 0x04;
		data[0x12] = 0x01;
		data[0x13] = 0x01;  // Sprite 1
		data[0x14] = 0x0c;
		data[0x15] = 0x04;
		data[0x16] = 0x02;
		data[0x17] = 0x01;  // Sprite 2
		data[0x18] = 0x00;
		data[0x19] = 0x00;
		data[0x1a] = 0x00;
		data[0x1b] = 0x00;  // All zeros = terminator

		var results = SpriteExtractor.FindMetaspriteTable(
			data, tableOffset: 0, count: 1,
			pointerFormat: Core.PointerTable.PointerFormat.Absolute16);

		Assert.NotEmpty(results);
		Assert.Equal(2, results[0].Sprite.Sprites.Count);
	}

	[Fact]
	public void DetectSpriteCount_FFFFPattern_StopsCorrectly() {
		var data = new byte[0x30];

		// Pointer to $8010
		data[0] = 0x10;
		data[1] = 0x80;

		// 1 valid sprite followed by $FF $FF
		data[0x10] = 0x04;
		data[0x11] = 0x04;
		data[0x12] = 0x05;
		data[0x13] = 0x01;  // Sprite 1
		data[0x14] = 0xff;
		data[0x15] = 0xff;
		data[0x16] = 0x00;
		data[0x17] = 0x00;  // $FF $FF terminator

		var results = SpriteExtractor.FindMetaspriteTable(
			data, tableOffset: 0, count: 1,
			pointerFormat: Core.PointerTable.PointerFormat.Absolute16);

		Assert.NotEmpty(results);
		Assert.Single(results[0].Sprite.Sprites);
	}

	#endregion

	#region Integration Tests

	[Fact]
	public void CompleteWorkflow_ParseRenderExport() {
		// Simulate complete metasprite workflow
		var meta = new SpriteExtractor.Metasprite { Name = "Hero_Stand" };
		meta.Sprites.Add((0, 0, 0x00, 0x00));
		meta.Sprites.Add((8, 0, 0x01, 0x00));
		meta.Sprites.Add((0, 8, 0x10, 0x00));
		meta.Sprites.Add((8, 8, 0x11, 0x00));

		// Verify bounds calculation
		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);
		Assert.Equal(0, MinX);
		Assert.Equal(0, MinY);
		Assert.Equal(16, MaxX);
		Assert.Equal(16, MaxY);

		// Generate ASM output
		var asm = SpriteExtractor.GenerateMetaspriteAsm(meta, "hero_stand");
		Assert.Contains("hero_stand:", asm);
		Assert.Contains(".byte 4", asm);

		// Export data and verify using reflection
		var exported = SpriteExtractor.ExportMetaspriteData(meta);
		var type = exported.GetType();
		Assert.Equal("Hero_Stand", type.GetProperty("name")?.GetValue(exported));

		var sprites = type.GetProperty("sprites")?.GetValue(exported) as System.Collections.IList;
		Assert.NotNull(sprites);
		Assert.Equal(4, sprites.Count);
	}

	[Fact]
	public void NesOam_ToMetasprite_Conversion() {
		// Parse OAM, then convert to metasprite-like structure
		var oam = new byte[]
		{
			50, 0x10, 0x00, 100,  // Y=50, Tile=$10, Attr=$00, X=100
			50, 0x11, 0x00, 108,  // Y=50, Tile=$11, Attr=$00, X=108 (adjacent)
			58, 0x20, 0x00, 100,  // Y=58, Tile=$20, Attr=$00, X=100 (below first)
			58, 0x21, 0x00, 108,  // Y=58, Tile=$21, Attr=$00, X=108 (below second)
		};

		var sprites = SpriteExtractor.ParseNesOam(oam, 0, 4);

		Assert.Equal(4, sprites.Count);

		// Verify sprite grouping makes sense (adjacent tiles)
		Assert.Equal(0x10, sprites[0].TileIndex);
		Assert.Equal(0x11, sprites[1].TileIndex);
		Assert.Equal(100, sprites[0].X);
		Assert.Equal(108, sprites[1].X);
	}

	[Fact]
	public void ExtractedMetasprite_CanBeReexported() {
		// Extract from binary
		var binaryData = new byte[]
		{
			0x00, 0x00, 0x42, 0x03,
			0x08, 0x00, 0x43, 0x03,
		};

		var meta = SpriteExtractor.ExtractMetasprite(binaryData, 0, 2);

		// Export to ASM
		meta.Name = "Reexported";
		var asm = SpriteExtractor.GenerateMetaspriteAsm(meta, "reexported");

		// Verify round-trip data
		Assert.Contains("$42", asm);
		Assert.Contains("$43", asm);
		Assert.Contains("$03", asm);  // Attributes preserved
	}

	#endregion

	#region Edge Cases and Boundary Tests

	[Fact]
	public void ExtractMetasprite_LargeSpriteCount_Handled() {
		// Create data for 32 sprites
		var data = new byte[32 * 4];
		for (int i = 0; i < 32; i++) {
			data[(i * 4) + 0] = (byte)(i % 4 * 8);   // X in 4-wide grid
			data[(i * 4) + 1] = (byte)(i / 4 * 8);   // Y in 8-tall grid
			data[(i * 4) + 2] = (byte)i;               // Tile index
			data[(i * 4) + 3] = 0x00;                  // Attributes
		}

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 32);

		Assert.Equal(32, meta.Sprites.Count);
	}

	[Fact]
	public void Metasprite_GetBounds_SingleSpriteAtOrigin() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((0, 0, 0, 0));

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);

		Assert.Equal(0, MinX);
		Assert.Equal(0, MinY);
		Assert.Equal(8, MaxX);
		Assert.Equal(8, MaxY);
	}

	[Fact]
	public void Metasprite_GetBounds_FarAwaySprites() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((-100, -100, 0, 0));
		meta.Sprites.Add((100, 100, 0, 0));

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);

		Assert.Equal(-100, MinX);
		Assert.Equal(-100, MinY);
		Assert.Equal(108, MaxX);  // 100 + 8
		Assert.Equal(108, MaxY);
	}

	[Fact]
	public void GenerateMetaspriteAsm_SpecialLabel_Preserved() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((0, 0, 0, 0));

		// Test various label styles
		var asm1 = SpriteExtractor.GenerateMetaspriteAsm(meta, "_underscore_label");
		Assert.Contains("_underscore_label:", asm1);

		var asm2 = SpriteExtractor.GenerateMetaspriteAsm(meta, "CamelCaseLabel");
		Assert.Contains("CamelCaseLabel:", asm2);

		var asm3 = SpriteExtractor.GenerateMetaspriteAsm(meta, "label123");
		Assert.Contains("label123:", asm3);
	}

	[Fact]
	public void SnesSprite_AllFlagsSet_Combined() {
		var sprite = new SpriteExtractor.SnesSprite(
			X: 256, Y: 128, TileIndex: 512,
			Palette: 7,
			Priority0: true, Priority1: true,
			FlipH: true, FlipV: true,
			LargeSize: true);

		Assert.Equal(256, sprite.X);
		Assert.Equal(128, sprite.Y);
		Assert.Equal(512, sprite.TileIndex);
		Assert.Equal(7, sprite.Palette);
		Assert.True(sprite.Priority0);
		Assert.True(sprite.Priority1);
		Assert.True(sprite.FlipH);
		Assert.True(sprite.FlipV);
		Assert.True(sprite.LargeSize);
	}

	#endregion
}
