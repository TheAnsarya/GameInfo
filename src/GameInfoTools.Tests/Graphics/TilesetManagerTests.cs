using GameInfoTools.Graphics;

namespace GameInfoTools.Tests.Graphics;

/// <summary>
/// Tests for the TilesetManager service.
/// </summary>
public class TilesetManagerTests {
	private static byte[] CreateTestRomData() {
		var data = new byte[0x1000];

		// Create 4 tiles in NES 2BPP planar format at offset 0x100
		// Each tile is 16 bytes (8 rows x 2 bytes per row)
		int offset = 0x100;

		// Tile 0: Solid color 0 (empty)
		// All zeros - already initialized

		// Tile 1: Solid color 1 at offset 0x110
		offset = 0x110;
		for (int row = 0; row < 8; row++) {
			data[offset + row * 2] = 0xff;     // Plane 0 all set
			data[offset + row * 2 + 1] = 0x00; // Plane 1 all clear
		}

		// Tile 2: Solid color 2 at offset 0x120
		offset = 0x120;
		for (int row = 0; row < 8; row++) {
			data[offset + row * 2] = 0x00;     // Plane 0 all clear
			data[offset + row * 2 + 1] = 0xff; // Plane 1 all set
		}

		// Tile 3: Checkerboard pattern at offset 0x130
		offset = 0x130;
		for (int row = 0; row < 8; row++) {
			byte pattern = (row % 2 == 0) ? (byte)0xaa : (byte)0x55;
			data[offset + row * 2] = pattern;
			data[offset + row * 2 + 1] = 0x00;
		}

		// Create palette data at offset 0x200
		// NES palette: 4 colors x 2 bytes (15-bit RGB)
		offset = 0x200;
		// Color 0: Black (transparent)
		data[offset] = 0x00;
		data[offset + 1] = 0x00;
		// Color 1: Red
		data[offset + 2] = 0x1f;  // R = 31
		data[offset + 3] = 0x00;
		// Color 2: Green
		data[offset + 4] = 0xe0;  // G = 31 << 5
		data[offset + 5] = 0x03;
		// Color 3: Blue
		data[offset + 6] = 0x00;
		data[offset + 7] = 0x7c;  // B = 31 << 10

		// Create metatile data at offset 0x300
		// 4 bytes per metatile (2x2 tiles)
		offset = 0x300;
		// MetaTile 0: All tile 0
		data[offset] = 0;
		data[offset + 1] = 0;
		data[offset + 2] = 0;
		data[offset + 3] = 0;
		// MetaTile 1: Tiles 0,1,2,3
		offset += 4;
		data[offset] = 0;
		data[offset + 1] = 1;
		data[offset + 2] = 2;
		data[offset + 3] = 3;

		// Create collision data at offset 0x400
		// 1 byte per metatile
		offset = 0x400;
		data[offset] = 0;     // None
		data[offset + 1] = 1; // Solid

		return data;
	}

	private static TilesetManager CreateManagerWithSchema() {
		var data = CreateTestRomData();
		var manager = new TilesetManager(data);

		var schema = new TilesetManager.TilesetSchema {
			Name = "Test Tileset",
			TileDataOffset = 0x100,
			TileCount = 4,
			Format = TilesetManager.TileFormat.Planar2BPP,
			BitsPerPixel = 2,
			TileWidth = 8,
			TileHeight = 8,
			PaletteOffset = 0x200,
			PaletteCount = 1,
			ColorsPerPalette = 4,
			MetaTileOffset = 0x300,
			MetaTileCount = 2,
			MetaTileSize = 4,
			CollisionOffset = 0x400
		};

		manager.SetSchema(schema);
		return manager;
	}

	#region Constructor Tests

	[Fact]
	public void Constructor_WithValidData_CreatesInstance() {
		var data = new byte[100];
		var manager = new TilesetManager(data);
		Assert.NotNull(manager);
		Assert.Empty(manager.Tilesets);
	}

	[Fact]
	public void Constructor_WithEmptyData_CreatesInstance() {
		var data = Array.Empty<byte>();
		var manager = new TilesetManager(data);
		Assert.NotNull(manager);
	}

	#endregion

	#region Schema Tests

	[Fact]
	public void SetSchema_StoresSchema() {
		var data = new byte[100];
		var manager = new TilesetManager(data);
		var schema = new TilesetManager.TilesetSchema {
			Name = "Test",
			TileCount = 10
		};

		manager.SetSchema(schema);

		Assert.Equal(schema, manager.Schema);
	}

	[Fact]
	public void CreateNesSchema_ReturnsCorrectFormat() {
		var schema = TilesetManager.CreateNesSchema(0x1000, 256);

		Assert.Equal("NES CHR", schema.Name);
		Assert.Equal(0x1000, schema.TileDataOffset);
		Assert.Equal(256, schema.TileCount);
		Assert.Equal(TilesetManager.TileFormat.Planar2BPP, schema.Format);
		Assert.Equal(2, schema.BitsPerPixel);
		Assert.Equal(8, schema.TileWidth);
		Assert.Equal(8, schema.TileHeight);
	}

	[Fact]
	public void CreateSnesSchema_ReturnsCorrectFormat() {
		var schema = TilesetManager.CreateSnesSchema(0x10000, 512, paletteOffset: 0x20000);

		Assert.Equal("SNES Tileset", schema.Name);
		Assert.Equal(TilesetManager.TileFormat.Planar4BPP, schema.Format);
		Assert.Equal(4, schema.BitsPerPixel);
		Assert.Equal(0x20000, schema.PaletteOffset);
		Assert.Equal(16, schema.ColorsPerPalette);
	}

	[Fact]
	public void CreateGameBoySchema_ReturnsCorrectFormat() {
		var schema = TilesetManager.CreateGameBoySchema(0x4000, 384);

		Assert.Equal("Game Boy Tileset", schema.Name);
		Assert.Equal(TilesetManager.TileFormat.Planar2BPP, schema.Format);
		Assert.Equal(2, schema.BitsPerPixel);
	}

	[Fact]
	public void CreateGbaSchema_ReturnsCorrectFormat() {
		var schema = TilesetManager.CreateGbaSchema(0x6000000, 1024, is8bpp: false);

		Assert.Equal("GBA Tileset", schema.Name);
		Assert.Equal(TilesetManager.TileFormat.Linear4BPP, schema.Format);
		Assert.Equal(4, schema.BitsPerPixel);
	}

	[Fact]
	public void CreateGbaSchema_8BPP_ReturnsCorrectFormat() {
		var schema = TilesetManager.CreateGbaSchema(0x6000000, 1024, is8bpp: true);

		Assert.Equal(TilesetManager.TileFormat.Linear8BPP, schema.Format);
		Assert.Equal(8, schema.BitsPerPixel);
		Assert.Equal(256, schema.ColorsPerPalette);
	}

	#endregion

	#region Load Tileset Tests

	[Fact]
	public void LoadTileset_LoadsAllTiles() {
		var manager = CreateManagerWithSchema();

		var tileset = manager.LoadTileset();

		Assert.Equal(4, tileset.Tiles.Count);
	}

	[Fact]
	public void LoadTileset_WithoutSchema_ThrowsException() {
		var data = new byte[100];
		var manager = new TilesetManager(data);

		Assert.Throws<InvalidOperationException>(() => manager.LoadTileset());
	}

	[Fact]
	public void LoadTileset_SetsCorrectProperties() {
		var manager = CreateManagerWithSchema();

		var tileset = manager.LoadTileset();

		Assert.Equal("Test Tileset", tileset.Name);
		Assert.Equal(TilesetManager.TileFormat.Planar2BPP, tileset.Format);
		Assert.Equal(8, tileset.TileWidth);
		Assert.Equal(8, tileset.TileHeight);
		Assert.Equal(2, tileset.BitsPerPixel);
	}

	[Fact]
	public void LoadTileset_LoadsPalettes() {
		var manager = CreateManagerWithSchema();

		var tileset = manager.LoadTileset();

		Assert.Single(tileset.Palettes);
		Assert.Equal(4, tileset.Palettes[0].ColorCount);
	}

	[Fact]
	public void LoadTileset_LoadsMetaTiles() {
		var manager = CreateManagerWithSchema();

		var tileset = manager.LoadTileset();

		Assert.Equal(2, tileset.MetaTiles.Count);
	}

	[Fact]
	public void LoadTileset_LoadsCollisionData() {
		var manager = CreateManagerWithSchema();

		var tileset = manager.LoadTileset();

		Assert.Equal(TilesetManager.CollisionType.None, tileset.MetaTiles[0].Collision);
		Assert.Equal(TilesetManager.CollisionType.Solid, tileset.MetaTiles[1].Collision);
	}

	[Fact]
	public void LoadTileset_TileHasCorrectRomOffset() {
		var manager = CreateManagerWithSchema();

		var tileset = manager.LoadTileset();

		Assert.Equal(0x100, tileset.Tiles[0].RomOffset);
		Assert.Equal(0x110, tileset.Tiles[1].RomOffset);
	}

	#endregion

	#region Tile Decoding Tests

	[Fact]
	public void DecodeTile_Planar2BPP_DecodesCorrectly() {
		// Create a simple pattern: first row has color 3 (both planes set)
		byte[] rawData = new byte[16];
		rawData[0] = 0xff; // Plane 0, row 0
		rawData[1] = 0xff; // Plane 1, row 0

		var manager = new TilesetManager([]);
		var pixels = manager.DecodeTile(rawData, 8, 8, TilesetManager.TileFormat.Planar2BPP);

		// First 8 pixels should be color 3
		for (int i = 0; i < 8; i++) {
			Assert.Equal(3, pixels[i]);
		}
	}

	[Fact]
	public void DecodeTile_Planar2BPP_HandlesCheckerboard() {
		byte[] rawData = new byte[16];
		rawData[0] = 0xaa; // 10101010 in plane 0
		rawData[1] = 0x00; // 00000000 in plane 1

		var manager = new TilesetManager([]);
		var pixels = manager.DecodeTile(rawData, 8, 8, TilesetManager.TileFormat.Planar2BPP);

		// Alternating 1,0,1,0,1,0,1,0
		Assert.Equal(1, pixels[0]);
		Assert.Equal(0, pixels[1]);
		Assert.Equal(1, pixels[2]);
		Assert.Equal(0, pixels[3]);
	}

	[Fact]
	public void DecodeTile_Linear4BPP_DecodesCorrectly() {
		byte[] rawData = new byte[32];
		rawData[0] = 0x12; // Pixel 0 = 2, Pixel 1 = 1

		var manager = new TilesetManager([]);
		var pixels = manager.DecodeTile(rawData, 8, 8, TilesetManager.TileFormat.Linear4BPP);

		Assert.Equal(2, pixels[0]);
		Assert.Equal(1, pixels[1]);
	}

	[Fact]
	public void DecodeTile_Linear8BPP_DecodesCorrectly() {
		byte[] rawData = new byte[64];
		rawData[0] = 0x42;
		rawData[1] = 0xff;

		var manager = new TilesetManager([]);
		var pixels = manager.DecodeTile(rawData, 8, 8, TilesetManager.TileFormat.Linear8BPP);

		Assert.Equal(0x42, pixels[0]);
		Assert.Equal(0xff, pixels[1]);
	}

	[Fact]
	public void DecodeTile_Interleaved_DecodesCorrectly() {
		byte[] rawData = new byte[32];
		rawData[0] = 0x12; // Pixel 0 = 1, Pixel 1 = 2 (high nibble first)

		var manager = new TilesetManager([]);
		var pixels = manager.DecodeTile(rawData, 8, 8, TilesetManager.TileFormat.Interleaved);

		Assert.Equal(1, pixels[0]);
		Assert.Equal(2, pixels[1]);
	}

	#endregion

	#region Tile Encoding Tests

	[Fact]
	public void EncodeTile_Planar2BPP_EncodesCorrectly() {
		// All pixels color 3
		byte[] pixels = new byte[64];
		for (int i = 0; i < 64; i++) pixels[i] = 3;

		var manager = new TilesetManager([]);
		var encoded = manager.EncodeTile(pixels, 8, 8, TilesetManager.TileFormat.Planar2BPP);

		Assert.Equal(16, encoded.Length);
		Assert.Equal(0xff, encoded[0]); // Plane 0
		Assert.Equal(0xff, encoded[1]); // Plane 1
	}

	[Fact]
	public void EncodeTile_Linear4BPP_EncodesCorrectly() {
		byte[] pixels = new byte[64];
		pixels[0] = 2;
		pixels[1] = 1;

		var manager = new TilesetManager([]);
		var encoded = manager.EncodeTile(pixels, 8, 8, TilesetManager.TileFormat.Linear4BPP);

		Assert.Equal(32, encoded.Length);
		Assert.Equal(0x12, encoded[0]); // (pixel1 << 4) | pixel0
	}

	[Fact]
	public void DecodeThenEncode_RoundTrips() {
		byte[] original = new byte[16];
		original[0] = 0xaa;
		original[1] = 0x55;

		var manager = new TilesetManager([]);
		var pixels = manager.DecodeTile(original, 8, 8, TilesetManager.TileFormat.Planar2BPP);
		var reEncoded = manager.EncodeTile(pixels, 8, 8, TilesetManager.TileFormat.Planar2BPP);

		Assert.Equal(original[0], reEncoded[0]);
		Assert.Equal(original[1], reEncoded[1]);
	}

	#endregion

	#region Tile Access Tests

	[Fact]
	public void GetTileset_ReturnsLoadedTileset() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset(id: 5);

		var tileset = manager.GetTileset(5);

		Assert.NotNull(tileset);
		Assert.Equal(5, tileset.Id);
	}

	[Fact]
	public void GetTileset_ReturnsNullForUnknownId() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		var tileset = manager.GetTileset(999);

		Assert.Null(tileset);
	}

	[Fact]
	public void GetTile_ReturnsTileFromTileset() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		var tile = manager.GetTile(0, 1);

		Assert.NotNull(tile);
		Assert.Equal(1, tile.Id);
	}

	[Fact]
	public void GetMetaTile_ReturnsMetaTileFromTileset() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		var metaTile = manager.GetMetaTile(0, 1);

		Assert.NotNull(metaTile);
		Assert.Equal(1, metaTile.Id);
	}

	#endregion

	#region Update Tests

	[Fact]
	public void UpdateTile_UpdatesPixelData() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		byte[] newPixels = new byte[64];
		for (int i = 0; i < 64; i++) newPixels[i] = 2;

		bool result = manager.UpdateTile(0, 0, newPixels);

		Assert.True(result);
		var tile = manager.GetTile(0, 0);
		Assert.NotNull(tile);
		Assert.Equal((byte)2, tile.PixelData[0]);
	}

	[Fact]
	public void UpdateTile_WrongSize_ReturnsFalse() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		byte[] wrongSize = new byte[10]; // Should be 64

		bool result = manager.UpdateTile(0, 0, wrongSize);

		Assert.False(result);
	}

	[Fact]
	public void UpdateMetaTile_UpdatesTileIds() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		int[] newTileIds = [3, 2, 1, 0];

		bool result = manager.UpdateMetaTile(0, 1, newTileIds);

		Assert.True(result);
		var metaTile = manager.GetMetaTile(0, 1);
		Assert.Equal(3, metaTile?.TileIds[0]);
	}

	[Fact]
	public void UpdateMetaTile_WrongLength_ReturnsFalse() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		int[] wrongLength = [1, 2]; // Should be 4

		bool result = manager.UpdateMetaTile(0, 1, wrongLength);

		Assert.False(result);
	}

	#endregion

	#region Render Tests

	[Fact]
	public void RenderTile_ReturnsRGBAArray() {
		var manager = CreateManagerWithSchema();
		var tileset = manager.LoadTileset();

		var tile = tileset.Tiles[1]; // Solid color 1
		var palette = tileset.Palettes[0];

		byte[] rgba = manager.RenderTile(tile, palette);

		// 8x8 tile = 64 pixels * 4 bytes (RGBA)
		Assert.Equal(256, rgba.Length);
	}

	[Fact]
	public void RenderTile_WithFlipH_MirrorsHorizontally() {
		// Create tile with left half set, right half clear
		byte[] pixels = new byte[64];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 4; x++) {
				pixels[y * 8 + x] = 1;
			}
		}

		var tile = new TilesetManager.TileDefinition {
			Id = 0,
			PixelData = pixels
		};
		var palette = new TilesetManager.PaletteEntry {
			Index = 0,
			ColorCount = 4,
			Colors = [0, 0, 0, 0, 255, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 0] // Color 1 = red
		};

		var data = new byte[100];
		var manager = new TilesetManager(data);
		manager.SetSchema(new TilesetManager.TilesetSchema {
			TileWidth = 8,
			TileHeight = 8,
			Format = TilesetManager.TileFormat.Planar2BPP
		});

		byte[] normal = manager.RenderTile(tile, palette, flipH: false);
		byte[] flipped = manager.RenderTile(tile, palette, flipH: true);

		// Check first row - pixel 0 in normal should be pixel 7 in flipped
		// Normal: [255,0,0,255, ...] (red)
		// Flipped: [..., 255,0,0,255] at end
		Assert.Equal(255, normal[0]); // First pixel red
		Assert.Equal(0, normal[7 * 4]); // Last pixel of first row black

		Assert.Equal(0, flipped[0]); // First pixel black (was last)
		Assert.Equal(255, flipped[7 * 4]); // Last pixel red (was first)
	}

	[Fact]
	public void RenderMetaTile_Returns16x16Array() {
		var manager = CreateManagerWithSchema();
		var tileset = manager.LoadTileset();

		var metaTile = tileset.MetaTiles[1];
		byte[] rgba = manager.RenderMetaTile(metaTile, tileset);

		// 16x16 = 256 pixels * 4 bytes (RGBA)
		Assert.Equal(1024, rgba.Length);
	}

	#endregion

	#region Export Tests

	[Fact]
	public void ExportToJson_ReturnsValidJson() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		string json = manager.ExportToJson(0);

		Assert.NotEmpty(json);
		Assert.Contains("Test Tileset", json);
		Assert.Contains("Tiles", json);
	}

	[Fact]
	public void ExportToJson_UnknownId_ReturnsEmptyObject() {
		var manager = CreateManagerWithSchema();

		string json = manager.ExportToJson(999);

		Assert.Equal("{}", json);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		var stats = manager.GetStatistics(0);

		Assert.Equal(4, stats.TileCount);
		Assert.Equal(2, stats.MetaTileCount);
		Assert.Equal(1, stats.PaletteCount);
		Assert.Equal(2, stats.BitsPerPixel);
	}

	[Fact]
	public void GetStatistics_CountsUniqueTiles() {
		var manager = CreateManagerWithSchema();
		manager.LoadTileset();

		var stats = manager.GetStatistics(0);

		// All 4 tiles should be unique
		Assert.True(stats.UniqueTiles <= stats.TileCount);
	}

	[Fact]
	public void GetStatistics_UnknownId_ReturnsZeros() {
		var manager = CreateManagerWithSchema();

		var stats = manager.GetStatistics(999);

		Assert.Equal(0, stats.TileCount);
		Assert.Equal(0, stats.UniqueTiles);
	}

	#endregion

	#region Enum Tests

	[Fact]
	public void TileFormat_AllValuesExist() {
		var values = Enum.GetValues<TilesetManager.TileFormat>();

		Assert.Contains(TilesetManager.TileFormat.Planar2BPP, values);
		Assert.Contains(TilesetManager.TileFormat.Planar4BPP, values);
		Assert.Contains(TilesetManager.TileFormat.Linear4BPP, values);
		Assert.Contains(TilesetManager.TileFormat.Linear8BPP, values);
		Assert.Contains(TilesetManager.TileFormat.Interleaved, values);
	}

	[Fact]
	public void CollisionType_AllValuesExist() {
		var values = Enum.GetValues<TilesetManager.CollisionType>();

		Assert.Contains(TilesetManager.CollisionType.None, values);
		Assert.Contains(TilesetManager.CollisionType.Solid, values);
		Assert.Contains(TilesetManager.CollisionType.SemiSolid, values);
		Assert.Contains(TilesetManager.CollisionType.Ladder, values);
		Assert.Contains(TilesetManager.CollisionType.Water, values);
		Assert.Contains(TilesetManager.CollisionType.Damage, values);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void LoadTileset_WithInvalidOffset_HandlesGracefully() {
		var data = new byte[100];
		var manager = new TilesetManager(data);
		manager.SetSchema(new TilesetManager.TilesetSchema {
			TileDataOffset = 0x10000, // Way out of bounds
			TileCount = 4,
			TileWidth = 8,
			TileHeight = 8,
			Format = TilesetManager.TileFormat.Planar2BPP
		});

		var tileset = manager.LoadTileset();

		// Should still create tiles with empty pixel data
		Assert.Equal(4, tileset.Tiles.Count);
	}

	[Fact]
	public void MetaTile_DefaultValues() {
		var metaTile = new TilesetManager.MetaTile();

		Assert.Equal(0, metaTile.Id);
		Assert.Equal("", metaTile.Name);
		Assert.Empty(metaTile.TileIds);
		Assert.Equal(2, metaTile.Width);
		Assert.Equal(2, metaTile.Height);
		Assert.Equal(TilesetManager.CollisionType.None, metaTile.Collision);
	}

	[Fact]
	public void TileDefinition_DefaultValues() {
		var tile = new TilesetManager.TileDefinition();

		Assert.Equal(0, tile.Id);
		Assert.Empty(tile.PixelData);
		Assert.Equal(0, tile.PaletteIndex);
		Assert.False(tile.FlipHorizontal);
		Assert.False(tile.FlipVertical);
		Assert.Equal(TilesetManager.CollisionType.None, tile.Collision);
	}

	#endregion
}
