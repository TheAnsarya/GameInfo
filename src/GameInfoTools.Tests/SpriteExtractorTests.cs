using GameInfoTools.Graphics;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for SpriteExtractor functionality.
/// </summary>
public class SpriteExtractorTests {
	[Fact]
	public void NesSprite_Record_HasCorrectProperties() {
		var sprite = new SpriteExtractor.NesSprite(0x10, 0x20, 0xE3, 0x40);

		Assert.Equal(0x10, sprite.Y);
		Assert.Equal(0x20, sprite.TileIndex);
		Assert.Equal(0xE3, sprite.Attributes);
		Assert.Equal(0x40, sprite.X);
	}

	[Fact]
	public void NesSprite_Palette_ExtractsLower2Bits() {
		var sprite = new SpriteExtractor.NesSprite(0, 0, 0x03, 0);
		Assert.Equal(3, sprite.Palette);

		sprite = new SpriteExtractor.NesSprite(0, 0, 0xFC, 0); // Upper bits set
		Assert.Equal(0, sprite.Palette);
	}

	[Fact]
	public void NesSprite_BehindBackground_ChecksBit5() {
		var sprite = new SpriteExtractor.NesSprite(0, 0, 0x20, 0);
		Assert.True(sprite.BehindBackground);

		sprite = new SpriteExtractor.NesSprite(0, 0, 0xDF, 0); // All but bit 5
		Assert.False(sprite.BehindBackground);
	}

	[Fact]
	public void NesSprite_FlipH_ChecksBit6() {
		var sprite = new SpriteExtractor.NesSprite(0, 0, 0x40, 0);
		Assert.True(sprite.FlipH);

		sprite = new SpriteExtractor.NesSprite(0, 0, 0xBF, 0); // All but bit 6
		Assert.False(sprite.FlipH);
	}

	[Fact]
	public void NesSprite_FlipV_ChecksBit7() {
		var sprite = new SpriteExtractor.NesSprite(0, 0, 0x80, 0);
		Assert.True(sprite.FlipV);

		sprite = new SpriteExtractor.NesSprite(0, 0, 0x7F, 0); // All but bit 7
		Assert.False(sprite.FlipV);
	}

	[Fact]
	public void ParseNesOam_ParsesCorrectFormat() {
		var data = new byte[]
		{
			// Sprite 0: Y=10, Tile=20, Attr=03, X=40
			10, 20, 0x03, 40,
			// Sprite 1: Y=50, Tile=60, Attr=C0, X=70
			50, 60, 0xC0, 70,
		};

		var sprites = SpriteExtractor.ParseNesOam(data, 0, 2);

		Assert.Equal(2, sprites.Count);
		Assert.Equal(10, sprites[0].Y);
		Assert.Equal(20, sprites[0].TileIndex);
		Assert.Equal(0x03, sprites[0].Attributes);
		Assert.Equal(40, sprites[0].X);

		Assert.Equal(50, sprites[1].Y);
		Assert.Equal(60, sprites[1].TileIndex);
		Assert.Equal(0xC0, sprites[1].Attributes);
		Assert.Equal(70, sprites[1].X);
	}

	[Fact]
	public void ParseNesOam_RespectsCount() {
		var data = new byte[16]; // 4 sprites worth
		var sprites = SpriteExtractor.ParseNesOam(data, 0, 2);

		Assert.Equal(2, sprites.Count);
	}

	[Fact]
	public void ParseNesOam_StopsAtDataEnd() {
		var data = new byte[6]; // Less than 2 full sprites
		var sprites = SpriteExtractor.ParseNesOam(data, 0, 2);

		Assert.Single(sprites);
	}

	[Fact]
	public void Metasprite_GetBounds_CalculatesCorrectly() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((0, 0, 0, 0));     // Top-left at 0,0
		meta.Sprites.Add((8, 0, 0, 0));     // Right of first
		meta.Sprites.Add((0, 8, 0, 0));     // Below first

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);

		Assert.Equal(0, MinX);
		Assert.Equal(0, MinY);
		Assert.Equal(16, MaxX); // 8 + 8
		Assert.Equal(16, MaxY); // 8 + 8
	}

	[Fact]
	public void Metasprite_GetBounds_HandlesNegativeOffsets() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Sprites.Add((-8, -8, 0, 0));  // Negative offsets
		meta.Sprites.Add((0, 0, 0, 0));    // Origin

		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds(tileHeight: 8);

		Assert.Equal(-8, MinX);
		Assert.Equal(-8, MinY);
		Assert.Equal(8, MaxX);
		Assert.Equal(8, MaxY);
	}

	[Fact]
	public void Metasprite_GetBounds_ReturnsZeroForEmpty() {
		var meta = new SpriteExtractor.Metasprite();
		var (MinX, MinY, MaxX, MaxY) = meta.GetBounds();

		Assert.Equal(0, MinX);
		Assert.Equal(0, MinY);
		Assert.Equal(0, MaxX);
		Assert.Equal(0, MaxY);
	}

	[Fact]
	public void ExtractMetasprite_ExtractsCorrectData() {
		// Metasprite with 2 sprites
		var data = new byte[]
		{
			// Sprite 0: X offset=0, Y offset=0, Tile=0x10, Attr=0x00
			0x00, 0x00, 0x10, 0x00,
			// Sprite 1: X offset=8, Y offset=0, Tile=0x11, Attr=0x00
			0x08, 0x00, 0x11, 0x00,
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 2);

		Assert.Equal(2, meta.Sprites.Count);
		Assert.Equal(0, meta.Sprites[0].OffsetX);
		Assert.Equal(0, meta.Sprites[0].OffsetY);
		Assert.Equal(0x10, meta.Sprites[0].TileIndex);
		Assert.Equal(8, meta.Sprites[1].OffsetX);
	}

	[Fact]
	public void ExtractMetasprite_HandlesSignedOffsets() {
		// Sprite with negative offsets (signed bytes)
		var data = new byte[]
		{
			0xF8, 0xFC, 0x10, 0x00, // X=-8, Y=-4
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 1);

		Assert.Equal(-8, meta.Sprites[0].OffsetX);
		Assert.Equal(-4, meta.Sprites[0].OffsetY);
	}

	[Fact]
	public void ExtractMetasprite_CalculatesSize() {
		var data = new byte[]
		{
			0x00, 0x00, 0x10, 0x00,
			0x08, 0x00, 0x11, 0x00,
		};

		var meta = SpriteExtractor.ExtractMetasprite(data, 0, 2, is8x16: false);

		Assert.Equal(16, meta.Width);  // 2 tiles wide
		Assert.Equal(8, meta.Height);  // 1 tile tall
	}

	[Fact]
	public void SnesSprite_Record_StoresAllProperties() {
		var sprite = new SpriteExtractor.SnesSprite(
			X: 100, Y: 50, TileIndex: 0x200,
			Palette: 3, Priority0: true, Priority1: false,
			FlipH: true, FlipV: false, LargeSize: true);

		Assert.Equal(100, sprite.X);
		Assert.Equal(50, sprite.Y);
		Assert.Equal(0x200, sprite.TileIndex);
		Assert.Equal(3, sprite.Palette);
		Assert.True(sprite.Priority0);
		Assert.False(sprite.Priority1);
		Assert.True(sprite.FlipH);
		Assert.False(sprite.FlipV);
		Assert.True(sprite.LargeSize);
	}

	[Fact]
	public void Metasprite_Name_CanBeSetAndRetrieved() {
		var meta = new SpriteExtractor.Metasprite();
		meta.Name = "Player_Walk_01";

		Assert.Equal("Player_Walk_01", meta.Name);
	}

	[Fact]
	public void Metasprite_Dimensions_CanBeSet() {
		var meta = new SpriteExtractor.Metasprite {
			Width = 32,
			Height = 48
		};

		Assert.Equal(32, meta.Width);
		Assert.Equal(48, meta.Height);
	}
}

/// <summary>
/// Tests for advanced sprite detection.
/// </summary>
public class AdvancedSpriteDetectorTests {
	private ChrEditor CreateTestChr() {
		// Create a simple CHR editor with test data
		var chrData = new byte[16 * 16]; // 1 tile, all zeros (empty)

		// Add one tile with content at index 0
		for (int i = 0; i < 8; i++) {
			chrData[i] = 0xff; // Plane 0
			chrData[i + 8] = 0x00; // Plane 1
		}

		return new ChrEditor(chrData);
	}

	[Fact]
	public void DetectionOptions_DefaultValues() {
		var options = new DetectionOptions();

		Assert.Equal(8, options.MinWidth);
		Assert.Equal(8, options.MinHeight);
		Assert.Equal(0.3f, options.MinConfidence);
		Assert.True(options.DetectAnimations);
	}

	[Fact]
	public void SpriteType_HasExpectedValues() {
		Assert.Equal(0, (int)AdvancedSpriteDetector.SpriteType.Static);
		Assert.Equal(1, (int)AdvancedSpriteDetector.SpriteType.Character);
		Assert.Equal(2, (int)AdvancedSpriteDetector.SpriteType.Enemy);
	}

	[Fact]
	public void DetectedSprite_Record_StoresAllProperties() {
		var sprite = new AdvancedSpriteDetector.DetectedSprite(
			StartTile: 0,
			Width: 16,
			Height: 16,
			TileIndices: [0, 1, 16, 17],
			Type: AdvancedSpriteDetector.SpriteType.Character,
			Confidence: 0.85f
		);

		Assert.Equal(0, sprite.StartTile);
		Assert.Equal(16, sprite.Width);
		Assert.Equal(16, sprite.Height);
		Assert.Equal(4, sprite.TileIndices.Count);
		Assert.Equal(AdvancedSpriteDetector.SpriteType.Character, sprite.Type);
		Assert.Equal(0.85f, sprite.Confidence);
	}
}

/// <summary>
/// Tests for sprite sheet generation.
/// </summary>
public class SpriteSheetGeneratorTests {
	[Fact]
	public void PackingAlgorithm_HasExpectedValues() {
		Assert.Equal(0, (int)SpriteSheetGenerator.PackingAlgorithm.RowBased);
		Assert.Equal(1, (int)SpriteSheetGenerator.PackingAlgorithm.BestFit);
		Assert.Equal(2, (int)SpriteSheetGenerator.PackingAlgorithm.MaxRects);
	}

	[Fact]
	public void GenerateOptimized_EmptyList_ReturnsEmptySheet() {
		var sprites = new List<(string Name, byte[,] Pixels)>();

		var result = SpriteSheetGenerator.GenerateOptimized(sprites);

		Assert.Equal(0, result.Width);
		Assert.Equal(0, result.Height);
		Assert.Empty(result.Placements);
	}

	[Fact]
	public void GenerateOptimized_SingleSprite_CreatesSheet() {
		var pixels = new byte[8, 8];
		pixels[0, 0] = 1;
		var sprites = new List<(string Name, byte[,] Pixels)> { ("test", pixels) };

		var result = SpriteSheetGenerator.GenerateOptimized(sprites, maxWidth: 32, powerOfTwo: false);

		Assert.NotEmpty(result.Placements);
		Assert.Single(result.Placements);
		Assert.Equal("test", result.Placements[0].Name);
	}

	[Fact]
	public void GenerateOptimized_MultipleSprites_PacksCorrectly() {
		var sprites = new List<(string Name, byte[,] Pixels)> {
			("sprite1", new byte[8, 8]),
			("sprite2", new byte[8, 8]),
			("sprite3", new byte[8, 8])
		};

		var result = SpriteSheetGenerator.GenerateOptimized(sprites, maxWidth: 64, powerOfTwo: false);

		Assert.Equal(3, result.Placements.Count);
	}

	[Fact]
	public void GenerateOptimized_PowerOfTwo_RoundsDimensions() {
		var pixels = new byte[10, 10];
		var sprites = new List<(string Name, byte[,] Pixels)> { ("test", pixels) };

		var result = SpriteSheetGenerator.GenerateOptimized(sprites, maxWidth: 64, powerOfTwo: true);

		// Should be power of 2
		Assert.True(IsPowerOfTwo(result.Width));
		Assert.True(IsPowerOfTwo(result.Height));
	}

	private static bool IsPowerOfTwo(int n) => n > 0 && (n & (n - 1)) == 0;
}

/// <summary>
/// Tests for sprite exporter.
/// </summary>
public class SpriteExporterTests {
	[Fact]
	public void ExportToCHeader_GeneratesValidHeader() {
		var sheet = new SpriteSheet(
			new byte[16, 16],
			16, 16,
			[new SpritePlacement("sprite1", 0, 0, 8, 8, new byte[8, 8])]
		);

		var header = SpriteExporter.ExportToCHeader(sheet, "test_sprites");

		Assert.Contains("#ifndef _TEST_SPRITES_H_", header);
		Assert.Contains("#define _TEST_SPRITES_H_", header);
		Assert.Contains("TEST_SPRITES_WIDTH", header);
		Assert.Contains("TEST_SPRITES_HEIGHT", header);
		Assert.Contains("sprite1", header);
	}

	[Fact]
	public void ExportToNesChr_ProducesCorrectSize() {
		var pixels = new byte[8, 8]; // 1 tile

		var chr = SpriteExporter.ExportToNesChr(pixels);

		Assert.Equal(16, chr.Length); // 16 bytes per NES tile
	}

	[Fact]
	public void ExportToNesChr_TwoTiles_ProducesCorrectSize() {
		var pixels = new byte[8, 16]; // 2 tiles wide

		var chr = SpriteExporter.ExportToNesChr(pixels);

		Assert.Equal(32, chr.Length); // 16 bytes * 2 tiles
	}

	[Fact]
	public void ExportToSnes4bpp_ProducesCorrectSize() {
		var pixels = new byte[8, 8]; // 1 tile

		var data = SpriteExporter.ExportToSnes4bpp(pixels);

		Assert.Equal(32, data.Length); // 32 bytes per 4bpp tile
	}

	[Fact]
	public void ExportToNesChr_EncodesPixelData() {
		var pixels = new byte[8, 8];
		// Set first pixel to color 3 (bits 0 and 1 set)
		pixels[0, 0] = 3;

		var chr = SpriteExporter.ExportToNesChr(pixels);

		// In NES format, pixel 0,0 with color 3 should set MSB of both planes
		Assert.Equal(0x80, chr[0]); // Plane 0, row 0, bit 7 set
		Assert.Equal(0x80, chr[8]); // Plane 1, row 0, bit 7 set
	}
}

/// <summary>
/// Tests for animation extraction.
/// </summary>
public class AnimationExtractorTests {
	[Fact]
	public void AnimationBank_Record_StoresAllProperties() {
		var animations = new List<AnimationSequence> {
			new("Walk", [new AnimationFrame(0, 4, 0, 0)])
		};

		var bank = new AnimationExtractor.AnimationBank(
			"TestBank",
			animations,
			0x8000,
			Core.SystemType.Nes
		);

		Assert.Equal("TestBank", bank.Name);
		Assert.Single(bank.Animations);
		Assert.Equal(0x8000, bank.BaseAddress);
		Assert.Equal(Core.SystemType.Nes, bank.System);
	}

	[Fact]
	public void AnimationGroup_Record_StoresAnimations() {
		var animations = new List<AnimationSequence> {
			new("Walk1", []),
			new("Walk2", [])
		};

		var group = new AnimationGroup("Walk Cycles", animations);

		Assert.Equal("Walk Cycles", group.Name);
		Assert.Equal(2, group.Animations.Count);
	}

	[Fact]
	public void GroupAnimations_EmptyList_ReturnsEmpty() {
		var animations = new List<AnimationSequence>();

		var groups = AnimationExtractor.GroupAnimations(animations);

		Assert.Empty(groups);
	}

	[Fact]
	public void AnimationGifFrame_Record_StoresAllProperties() {
		var pixels = new byte[8, 8][];
		for (int y = 0; y < 8; y++)
			for (int x = 0; x < 8; x++)
				pixels[y, x] = [0, 0, 0];

		var frame = new AnimationGifFrame(pixels, 8, 8, 100);

		Assert.Equal(8, frame.Width);
		Assert.Equal(8, frame.Height);
		Assert.Equal(100, frame.DurationMs);
	}
}
