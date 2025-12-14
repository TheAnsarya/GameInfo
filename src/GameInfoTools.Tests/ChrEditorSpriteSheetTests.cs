using GameInfoTools.Graphics;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CHR Editor sprite sheet export and animation preview.
/// Issue #36: CHR Editor - Sprite sheet export and animation preview
/// </summary>
public class ChrEditorSpriteSheetTests {
	private static byte[] CreateTestChrData(int tileCount) {
		var data = new byte[tileCount * ChrEditor.TileSize];
		// Fill with recognizable patterns
		for (int t = 0; t < tileCount; t++) {
			for (int i = 0; i < ChrEditor.TileSize; i++) {
				data[t * ChrEditor.TileSize + i] = (byte)((t + i) & 0xff);
			}
		}
		return data;
	}

	#region Sprite Sheet Export Tests

	[Fact]
	public void ExportSpriteSheet_Horizontal_CreatesSingleRow() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(
			TileIndices: [0, 1, 2, 3],
			Layout: SpriteSheetLayout.Horizontal
		);

		var result = editor.ExportSpriteSheet(config);

		Assert.Equal(8, result.GetLength(0));  // Height = 1 tile
		Assert.Equal(32, result.GetLength(1)); // Width = 4 tiles
	}

	[Fact]
	public void ExportSpriteSheet_Vertical_CreatesSingleColumn() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(
			TileIndices: [0, 1, 2, 3],
			Layout: SpriteSheetLayout.Vertical
		);

		var result = editor.ExportSpriteSheet(config);

		Assert.Equal(32, result.GetLength(0)); // Height = 4 tiles
		Assert.Equal(8, result.GetLength(1));  // Width = 1 tile
	}

	[Fact]
	public void ExportSpriteSheet_Grid_CreatesGridLayout() {
		var data = CreateTestChrData(8);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(
			TileIndices: [0, 1, 2, 3, 4, 5, 6, 7],
			Layout: SpriteSheetLayout.Grid,
			TilesPerRow: 4
		);

		var result = editor.ExportSpriteSheet(config);

		Assert.Equal(16, result.GetLength(0)); // Height = 2 rows
		Assert.Equal(32, result.GetLength(1)); // Width = 4 tiles
	}

	[Fact]
	public void ExportSpriteSheet_WithSpacing_AddsPadding() {
		var data = CreateTestChrData(2);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(
			TileIndices: [0, 1],
			Layout: SpriteSheetLayout.Horizontal,
			TileSpacing: 2
		);

		var result = editor.ExportSpriteSheet(config);

		Assert.Equal(8, result.GetLength(0));   // Height
		Assert.Equal(18, result.GetLength(1));  // 8 + 2 + 8
	}

	[Fact]
	public void ExportSpriteSheet_WithFlippedVariants_CreatesFourRows() {
		var data = CreateTestChrData(2);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(
			TileIndices: [0, 1],
			Layout: SpriteSheetLayout.Horizontal,
			IncludeFlippedVariants: true
		);

		var result = editor.ExportSpriteSheet(config);

		Assert.Equal(32, result.GetLength(0)); // Height = 4 variants
	}

	[Fact]
	public void ExportSpriteSheet_EmptyTileList_ReturnsEmpty() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(TileIndices: []);

		var result = editor.ExportSpriteSheet(config);

		Assert.Equal(0, result.GetLength(0));
		Assert.Equal(0, result.GetLength(1));
	}

	[Fact]
	public void ExportSpriteSheetPng_ReturnsPngData() {
		var data = CreateTestChrData(2);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(TileIndices: [0, 1]);

		var png = editor.ExportSpriteSheetPng(config);

		// PNG signature
		Assert.True(png.Length > 8);
		Assert.Equal(0x89, png[0]);
		Assert.Equal(0x50, png[1]); // 'P'
		Assert.Equal(0x4e, png[2]); // 'N'
		Assert.Equal(0x47, png[3]); // 'G'
	}

	[Fact]
	public void ExportSpriteSheetBmp_ReturnsBmpData() {
		var data = CreateTestChrData(2);
		var editor = new ChrEditor(data);
		var config = new SpriteSheetConfig(TileIndices: [0, 1]);

		var bmp = editor.ExportSpriteSheetBmp(config);

		// BMP signature
		Assert.True(bmp.Length > 54);
		Assert.Equal(0x42, bmp[0]); // 'B'
		Assert.Equal(0x4d, bmp[1]); // 'M'
	}

	#endregion

	#region Animation Preview Tests

	[Fact]
	public void ComposeFrame_SingleTile_ReturnsCorrectSize() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);

		var frame = editor.ComposeFrame([0], 1, 1);

		Assert.Equal(8, frame.GetLength(0));
		Assert.Equal(8, frame.GetLength(1));
	}

	[Fact]
	public void ComposeFrame_MultiTile_ReturnsCorrectSize() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);

		var frame = editor.ComposeFrame([0, 1, 2, 3], 2, 2);

		Assert.Equal(16, frame.GetLength(0));
		Assert.Equal(16, frame.GetLength(1));
	}

	[Fact]
	public void ComposeFrame_WithFlipH_FlipsHorizontally() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);

		var normal = editor.ComposeFrame([0], 1, 1, flipH: false);
		var flipped = editor.ComposeFrame([0], 1, 1, flipH: true);

		// Should be mirrored
		Assert.Equal(normal[0, 0], flipped[0, 7]);
	}

	[Fact]
	public void GetAnimationFrames_ReturnsAllFrames() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);
		var animation = new SpriteAnimation(
			Name: "Walk",
			Frames: [
				new ChrAnimationFrame([0]),
				new ChrAnimationFrame([1]),
				new ChrAnimationFrame([2])
			],
			SpriteWidth: 1,
			SpriteHeight: 1
		);

		var frames = editor.GetAnimationFrames(animation);

		Assert.Equal(3, frames.Count);
	}

	[Fact]
	public void ExportAnimationStrip_Horizontal_CreatesStrip() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);
		var animation = new SpriteAnimation(
			Name: "Test",
			Frames: [
				new ChrAnimationFrame([0]),
				new ChrAnimationFrame([1])
			],
			SpriteWidth: 1,
			SpriteHeight: 1
		);

		var strip = editor.ExportAnimationStrip(animation, horizontal: true);

		Assert.Equal(8, strip.GetLength(0));   // Height
		Assert.Equal(16, strip.GetLength(1));  // 2 frames wide
	}

	[Fact]
	public void ExportAnimationStrip_Vertical_CreatesStrip() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);
		var animation = new SpriteAnimation(
			Name: "Test",
			Frames: [
				new ChrAnimationFrame([0]),
				new ChrAnimationFrame([1])
			],
			SpriteWidth: 1,
			SpriteHeight: 1
		);

		var strip = editor.ExportAnimationStrip(animation, horizontal: false);

		Assert.Equal(16, strip.GetLength(0));  // 2 frames tall
		Assert.Equal(8, strip.GetLength(1));   // Width
	}

	[Fact]
	public void ExportAnimationStrip_WithSpacing_AddsPadding() {
		var data = CreateTestChrData(4);
		var editor = new ChrEditor(data);
		var animation = new SpriteAnimation(
			Name: "Test",
			Frames: [
				new ChrAnimationFrame([0]),
				new ChrAnimationFrame([1])
			],
			SpriteWidth: 1,
			SpriteHeight: 1
		);

		var strip = editor.ExportAnimationStrip(animation, horizontal: true, spacing: 4);

		Assert.Equal(8, strip.GetLength(0));
		Assert.Equal(20, strip.GetLength(1));  // 8 + 4 + 8
	}

	[Fact]
	public void GetAnimationDuration_SumsFrameDurations() {
		var animation = new SpriteAnimation(
			Name: "Test",
			Frames: [
				new ChrAnimationFrame([0], DurationMs: 100),
				new ChrAnimationFrame([1], DurationMs: 200),
				new ChrAnimationFrame([2], DurationMs: 150)
			]
		);

		var duration = ChrEditor.GetAnimationDuration(animation);

		Assert.Equal(450, duration);
	}

	[Fact]
	public void GetFrameAtTime_ReturnsCorrectFrame() {
		var animation = new SpriteAnimation(
			Name: "Test",
			Frames: [
				new ChrAnimationFrame([0], DurationMs: 100),
				new ChrAnimationFrame([1], DurationMs: 100),
				new ChrAnimationFrame([2], DurationMs: 100)
			],
			Loop: true
		);

		Assert.Equal(0, ChrEditor.GetFrameAtTime(animation, 0));
		Assert.Equal(0, ChrEditor.GetFrameAtTime(animation, 50));
		Assert.Equal(1, ChrEditor.GetFrameAtTime(animation, 100));
		Assert.Equal(2, ChrEditor.GetFrameAtTime(animation, 250));
	}

	[Fact]
	public void GetFrameAtTime_WithLoop_WrapsAround() {
		var animation = new SpriteAnimation(
			Name: "Test",
			Frames: [
				new ChrAnimationFrame([0], DurationMs: 100),
				new ChrAnimationFrame([1], DurationMs: 100)
			],
			Loop: true
		);

		Assert.Equal(0, ChrEditor.GetFrameAtTime(animation, 200)); // Wrapped
		Assert.Equal(1, ChrEditor.GetFrameAtTime(animation, 300)); // Wrapped
	}

	[Fact]
	public void GetFrameAtTime_WithoutLoop_StaysOnLast() {
		var animation = new SpriteAnimation(
			Name: "Test",
			Frames: [
				new ChrAnimationFrame([0], DurationMs: 100),
				new ChrAnimationFrame([1], DurationMs: 100)
			],
			Loop: false
		);

		Assert.Equal(1, ChrEditor.GetFrameAtTime(animation, 500)); // Past end
	}

	#endregion

	#region Palette Cycling Tests

	[Fact]
	public void CyclePalette_ShiftsColors() {
		var palette = new (byte R, byte G, byte B)[] {
			(0, 0, 0),
			(255, 0, 0),
			(0, 255, 0),
			(0, 0, 255)
		};
		var config = new PaletteCycleConfig(StartIndex: 1, EndIndex: 3);

		var cycled = ChrEditor.CyclePalette(palette, config, step: 1);

		// Colors should shift: R->G, G->B, B->R
		Assert.Equal((0, 0, 0), cycled[0]);     // Unchanged
		Assert.Equal((0, 255, 0), cycled[1]);  // Was green at index 2
		Assert.Equal((0, 0, 255), cycled[2]);  // Was blue at index 3
		Assert.Equal((255, 0, 0), cycled[3]);  // Was red at index 1
	}

	[Fact]
	public void CyclePalette_Reverse_ShiftsBackward() {
		var palette = new (byte R, byte G, byte B)[] {
			(0, 0, 0),
			(255, 0, 0),
			(0, 255, 0),
			(0, 0, 255)
		};
		var config = new PaletteCycleConfig(StartIndex: 1, EndIndex: 3, Reverse: true);

		var cycled = ChrEditor.CyclePalette(palette, config, step: 1);

		Assert.Equal((0, 0, 255), cycled[1]);  // Was blue
		Assert.Equal((255, 0, 0), cycled[2]);  // Was red
		Assert.Equal((0, 255, 0), cycled[3]);  // Was green
	}

	[Fact]
	public void GeneratePaletteCycleFrames_GeneratesAllFrames() {
		var palette = new (byte R, byte G, byte B)[] {
			(0, 0, 0),
			(255, 0, 0),
			(0, 255, 0),
			(0, 0, 255)
		};
		var config = new PaletteCycleConfig(StartIndex: 1, EndIndex: 3);

		var frames = ChrEditor.GeneratePaletteCycleFrames(palette, config);

		Assert.Equal(3, frames.Count); // 3 colors in cycle = 3 frames
	}

	#endregion

	#region Transform Preview Tests

	[Fact]
	public void CreateTransformPreview_Creates2x4Grid() {
		var data = CreateTestChrData(1);
		var editor = new ChrEditor(data);

		var preview = editor.CreateTransformPreview(0, spacing: 0);

		Assert.Equal(16, preview.GetLength(0)); // 2 rows of 8 pixels
		Assert.Equal(32, preview.GetLength(1)); // 4 cols of 8 pixels
	}

	[Fact]
	public void CreateTransformPreview_InvalidTile_ReturnsEmpty() {
		var data = CreateTestChrData(1);
		var editor = new ChrEditor(data);

		var preview = editor.CreateTransformPreview(-1);

		Assert.Equal(0, preview.GetLength(0));
	}

	[Fact]
	public void Rotate180_RotatesCorrectly() {
		var tile = new byte[8, 8];
		tile[0, 0] = 1;
		tile[0, 7] = 2;
		tile[7, 0] = 3;
		tile[7, 7] = 4;

		var rotated = ChrEditor.Rotate180(tile);

		Assert.Equal(4, rotated[0, 0]);
		Assert.Equal(3, rotated[0, 7]);
		Assert.Equal(2, rotated[7, 0]);
		Assert.Equal(1, rotated[7, 7]);
	}

	[Fact]
	public void Rotate270_RotatesCorrectly() {
		var tile = new byte[8, 8];
		tile[0, 0] = 1;

		var rotated = ChrEditor.Rotate270(tile);

		// Rotating 270 degrees (or 90 counter-clockwise):
		// [0,0] goes to [7,0]
		Assert.Equal(1, rotated[7, 0]);
	}

	#endregion

	#region Image Export Tests

	[Fact]
	public void ToPngBytes_CreatesValidPng() {
		var data = new byte[16, 16];
		var palette = new (byte R, byte G, byte B)[] { (0, 0, 0), (255, 255, 255) };

		var png = ChrEditor.ToPngBytes(data, palette);

		// Verify PNG signature
		Assert.Equal(new byte[] { 0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a }, png[..8]);
	}

	[Fact]
	public void ToBmpBytes_CreatesValidBmp() {
		var data = new byte[16, 16];
		var palette = new (byte R, byte G, byte B)[] { (0, 0, 0), (255, 255, 255) };

		var bmp = ChrEditor.ToBmpBytes(data, palette);

		// Verify BMP signature
		Assert.Equal((byte)'B', bmp[0]);
		Assert.Equal((byte)'M', bmp[1]);
	}

	[Fact]
	public void ToBmpBytes_HasCorrectSize() {
		var data = new byte[16, 16];
		var palette = Enumerable.Range(0, 256).Select(i => ((byte)i, (byte)i, (byte)i)).ToArray();

		var bmp = ChrEditor.ToBmpBytes(data, palette);

		// 54 header + 1024 palette + 256 pixels
		Assert.Equal(54 + 1024 + 256, bmp.Length);
	}

	#endregion

	#region Record Tests

	[Fact]
	public void AnimationFrame_DefaultDuration_Is100ms() {
		var frame = new ChrAnimationFrame([0, 1]);

		Assert.Equal(100, frame.DurationMs);
	}

	[Fact]
	public void SpriteAnimation_DefaultValues() {
		var anim = new SpriteAnimation("Test", new List<ChrAnimationFrame>());

		Assert.Equal("Test", anim.Name);
		Assert.Equal(1, anim.SpriteWidth);
		Assert.Equal(1, anim.SpriteHeight);
		Assert.True(anim.Loop);
	}

	[Fact]
	public void SpriteSheetConfig_DefaultValues() {
		var config = new SpriteSheetConfig([0, 1, 2]);

		Assert.Equal(SpriteSheetLayout.Horizontal, config.Layout);
		Assert.Equal(16, config.TilesPerRow);
		Assert.Equal(0, config.TileSpacing);
		Assert.False(config.IncludeFlippedVariants);
	}

	[Fact]
	public void PaletteCycleConfig_DefaultValues() {
		var config = new PaletteCycleConfig(1, 5);

		Assert.Equal(1, config.StartIndex);
		Assert.Equal(5, config.EndIndex);
		Assert.Equal(100, config.SpeedMs);
		Assert.False(config.Reverse);
	}

	#endregion
}
