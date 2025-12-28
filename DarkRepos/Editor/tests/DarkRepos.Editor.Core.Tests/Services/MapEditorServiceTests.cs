using DarkRepos.Editor.Core.Interfaces;
using DarkRepos.Editor.Core.Services;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Services;

public class MapEditorServiceTests
{
	private readonly MapEditorService _service;

	public MapEditorServiceTests()
	{
		_service = new MapEditorService();
	}

	#region LoadTileset Tests

	[Fact]
	public void LoadTileset_Nes2Bpp_ParsesTilesCorrectly()
	{
		// Create a simple 2 tile tileset (32 bytes)
		var data = new byte[32];
		// First tile: all pixels = 1
		for (int i = 0; i < 8; i++)
		{
			data[i] = 0xff;      // Plane 0 all set
			data[i + 8] = 0x00;  // Plane 1 all clear
		}
		// Second tile: all pixels = 3
		for (int i = 0; i < 8; i++)
		{
			data[i + 16] = 0xff; // Plane 0 all set
			data[i + 24] = 0xff; // Plane 1 all set
		}

		var tileset = _service.LoadTileset(data, 0, 2, MapTileFormat.Nes2Bpp);

		tileset.Tiles.Should().HaveCount(2);
		tileset.Format.Should().Be(MapTileFormat.Nes2Bpp);
		tileset.Tiles[0].PixelData.Should().AllSatisfy(p => p.Should().Be(1));
		tileset.Tiles[1].PixelData.Should().AllSatisfy(p => p.Should().Be(3));
	}

	[Fact]
	public void LoadTileset_RespectsOffset()
	{
		var data = new byte[48];
		// Put tile at offset 16
		for (int i = 0; i < 8; i++)
		{
			data[i + 16] = 0xff;
			data[i + 24] = 0x00;
		}

		var tileset = _service.LoadTileset(data, 16, 1, MapTileFormat.Nes2Bpp);

		tileset.Tiles.Should().HaveCount(1);
		tileset.Offset.Should().Be(16);
		tileset.Tiles[0].PixelData.Should().AllSatisfy(p => p.Should().Be(1));
	}

	#endregion

	#region LoadMap Tests

	[Fact]
	public void LoadMap_Linear_ParsesCorrectly()
	{
		var data = new byte[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };

		var map = _service.LoadMap(data, 0, 4, 4, MapFormat.Linear);

		map.Width.Should().Be(4);
		map.Height.Should().Be(4);
		map.Tiles[0, 0].TileIndex.Should().Be(0);
		map.Tiles[1, 0].TileIndex.Should().Be(1);
		map.Tiles[0, 1].TileIndex.Should().Be(4);
		map.Tiles[3, 3].TileIndex.Should().Be(15);
	}

	[Fact]
	public void LoadMap_SnesTilemap_ParsesTileAttributes()
	{
		// SNES tilemap is 2 bytes per tile (little endian word)
		// bits 0-9: tile index
		// bits 10-12: palette
		// bit 13: priority
		// bit 14: flip X
		// bit 15: flip Y
		var data = new byte[]
		{
			0x42, 0b01100100,  // word 0x6442: tile 0x42, palette 1, priority 0, flipX, flipY
			0x00, 0b10000000,  // word 0x8000: tile 0, flipY only
		};

		var map = _service.LoadMap(data, 0, 2, 1, MapFormat.SnesTilemap);

		// First tile: 0x6442 = 0110 0100 0100 0010
		// tile = 0x42, palette = (0x6442 >> 10) & 7 = 1, priority = 1, flipX = true, flipY = false
		map.Tiles[0, 0].TileIndex.Should().Be(0x42);
		map.Tiles[0, 0].PaletteIndex.Should().Be(1);
		map.Tiles[0, 0].Priority.Should().Be(1);
		map.Tiles[0, 0].FlipX.Should().BeTrue();
		map.Tiles[0, 0].FlipY.Should().BeFalse();

		map.Tiles[1, 0].TileIndex.Should().Be(0);
		map.Tiles[1, 0].FlipY.Should().BeTrue();
		map.Tiles[1, 0].FlipX.Should().BeFalse();
	}

	[Fact]
	public void LoadMap_ColumnMajor_ParsesCorrectly()
	{
		var data = new byte[] { 0, 1, 2, 3, 4, 5 };  // 2x3 map, column major

		var map = _service.LoadMap(data, 0, 2, 3, MapFormat.ColumnMajor);

		map.Tiles[0, 0].TileIndex.Should().Be(0);
		map.Tiles[0, 1].TileIndex.Should().Be(1);
		map.Tiles[0, 2].TileIndex.Should().Be(2);
		map.Tiles[1, 0].TileIndex.Should().Be(3);
		map.Tiles[1, 1].TileIndex.Should().Be(4);
		map.Tiles[1, 2].TileIndex.Should().Be(5);
	}

	#endregion

	#region SetTile/GetTile Tests

	[Fact]
	public void SetTile_UpdatesMapAndSetsModified()
	{
		var map = _service.LoadMap(new byte[16], 0, 4, 4, MapFormat.Linear);
		var tile = new MapTile { TileIndex = 42, PaletteIndex = 3 };

		_service.SetTile(map, 2, 2, tile);

		var result = _service.GetTile(map, 2, 2);
		result.TileIndex.Should().Be(42);
		result.PaletteIndex.Should().Be(3);
		map.IsModified.Should().BeTrue();
	}

	[Fact]
	public void GetTile_OutOfBounds_ReturnsDefaultTile()
	{
		var map = _service.LoadMap(new byte[4], 0, 2, 2, MapFormat.Linear);

		var result = _service.GetTile(map, 10, 10);

		result.TileIndex.Should().Be(0);
	}

	#endregion

	#region FillRegion Tests

	[Fact]
	public void FillRegion_FillsRectangle()
	{
		var map = _service.LoadMap(new byte[16], 0, 4, 4, MapFormat.Linear);
		var tile = new MapTile { TileIndex = 99 };

		_service.FillRegion(map, 1, 1, 2, 2, tile);

		map.Tiles[1, 1].TileIndex.Should().Be(99);
		map.Tiles[2, 1].TileIndex.Should().Be(99);
		map.Tiles[1, 2].TileIndex.Should().Be(99);
		map.Tiles[2, 2].TileIndex.Should().Be(99);

		// Outside region should be unchanged
		map.Tiles[0, 0].TileIndex.Should().Be(0);
		map.Tiles[3, 3].TileIndex.Should().Be(0);
	}

	#endregion

	#region FloodFill Tests

	[Fact]
	public void FloodFill_FillsContiguousArea()
	{
		// Create a map with a bordered area
		var data = new byte[]
		{
			1, 1, 1, 1,
			1, 0, 0, 1,
			1, 0, 0, 1,
			1, 1, 1, 1
		};
		var map = _service.LoadMap(data, 0, 4, 4, MapFormat.Linear);
		var tile = new MapTile { TileIndex = 5 };

		_service.FloodFill(map, 1, 1, tile);

		// Center should be filled
		map.Tiles[1, 1].TileIndex.Should().Be(5);
		map.Tiles[2, 1].TileIndex.Should().Be(5);
		map.Tiles[1, 2].TileIndex.Should().Be(5);
		map.Tiles[2, 2].TileIndex.Should().Be(5);

		// Border should be unchanged
		map.Tiles[0, 0].TileIndex.Should().Be(1);
		map.Tiles[3, 3].TileIndex.Should().Be(1);
	}

	#endregion

	#region CopyRegion/PasteRegion Tests

	[Fact]
	public void CopyRegion_CopiesData()
	{
		var data = new byte[] { 0, 1, 2, 3, 4, 5, 6, 7, 8 };
		var map = _service.LoadMap(data, 0, 3, 3, MapFormat.Linear);

		var region = _service.CopyRegion(map, 0, 0, 2, 2);

		region.Width.Should().Be(2);
		region.Height.Should().Be(2);
		region.Tiles[0, 0].TileIndex.Should().Be(0);
		region.Tiles[1, 0].TileIndex.Should().Be(1);
		region.Tiles[0, 1].TileIndex.Should().Be(3);
		region.Tiles[1, 1].TileIndex.Should().Be(4);
	}

	[Fact]
	public void PasteRegion_PastesData()
	{
		var map = _service.LoadMap(new byte[9], 0, 3, 3, MapFormat.Linear);
		var region = new TileRegion
		{
			Width = 2,
			Height = 2,
			Tiles = new MapTile[,]
			{
				{ new MapTile { TileIndex = 10 }, new MapTile { TileIndex = 11 } },
				{ new MapTile { TileIndex = 12 }, new MapTile { TileIndex = 13 } }
			}
		};

		_service.PasteRegion(map, 1, 1, region);

		map.Tiles[1, 1].TileIndex.Should().Be(10);
		map.Tiles[2, 1].TileIndex.Should().Be(12);
		map.Tiles[1, 2].TileIndex.Should().Be(11);
		map.Tiles[2, 2].TileIndex.Should().Be(13);
	}

	#endregion

	#region ValidateMap Tests

	[Fact]
	public void ValidateMap_ValidMap_ReturnsValid()
	{
		var tileset = _service.LoadTileset(new byte[32], 0, 2, MapTileFormat.Nes2Bpp);
		var map = _service.LoadMap(new byte[] { 0, 1, 0, 1 }, 0, 2, 2, MapFormat.Linear);

		var result = _service.ValidateMap(map, tileset);

		result.IsValid.Should().BeTrue();
		result.Errors.Should().BeEmpty();
		result.UniqueTilesUsed.Should().Be(2);
	}

	[Fact]
	public void ValidateMap_InvalidTileIndex_ReturnsError()
	{
		var tileset = _service.LoadTileset(new byte[16], 0, 1, MapTileFormat.Nes2Bpp);
		var map = _service.LoadMap(new byte[] { 0, 5, 0, 0 }, 0, 2, 2, MapFormat.Linear);

		var result = _service.ValidateMap(map, tileset);

		result.IsValid.Should().BeFalse();
		result.Errors.Should().ContainMatch("*invalid*index*");
	}

	#endregion

	#region RLE Compression Tests

	[Fact]
	public void DecompressRle_DecompressesCorrectly()
	{
		// 0x83 = run of 4 bytes, value 0xAA
		// 0x02 = 3 literal bytes
		var data = new byte[] { 0x83, 0xaa, 0x02, 0x11, 0x22, 0x33 };

		var result = _service.DecompressRle(data, 0, 7);

		result.Should().BeEquivalentTo(new byte[] { 0xaa, 0xaa, 0xaa, 0xaa, 0x11, 0x22, 0x33 });
	}

	[Fact]
	public void CompressRle_CompressesRuns()
	{
		var data = new byte[] { 0xaa, 0xaa, 0xaa, 0xaa, 0x11, 0x22 };

		var compressed = _service.CompressRle(data);
		var decompressed = _service.DecompressRle(compressed, 0, data.Length);

		decompressed.Should().BeEquivalentTo(data);
	}

	#endregion

	#region LZSS Compression Tests

	[Fact]
	public void CompressLzss_DecompressLzss_RoundTrips()
	{
		var original = new byte[] { 1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4, 5, 6, 7, 8 };

		var compressed = _service.CompressLzss(original);
		var decompressed = _service.DecompressLzss(compressed, 0);

		decompressed.Should().BeEquivalentTo(original);
	}

	#endregion

	#region ExportMap Tests

	[Fact]
	public void ExportMap_Linear_ExportsCorrectly()
	{
		var data = new byte[] { 0, 1, 2, 3 };
		var map = _service.LoadMap(data, 0, 2, 2, MapFormat.Linear);

		var exported = _service.ExportMap(map, MapFormat.Linear);

		exported.Should().BeEquivalentTo(data);
	}

	[Fact]
	public void ExportMap_SnesTilemap_PreservesAttributes()
	{
		var original = new byte[] { 0x42, 0b01001011 };
		var map = _service.LoadMap(original, 0, 1, 1, MapFormat.SnesTilemap);

		var exported = _service.ExportMap(map, MapFormat.SnesTilemap);

		exported.Should().BeEquivalentTo(original);
	}

	#endregion

	#region Render Tests

	[Fact]
	public void RenderMapToPng_ProducesValidPng()
	{
		var tileset = CreateSimpleTileset();
		var map = _service.LoadMap(new byte[] { 0, 1, 0, 1 }, 0, 2, 2, MapFormat.Linear);
		var palette = CreateGrayscalePalette();

		var png = _service.RenderMapToPng(map, tileset, palette);

		// PNG signature check
		png.Should().HaveCountGreaterThan(8);
		png[0].Should().Be(0x89);
		png[1].Should().Be(0x50); // P
		png[2].Should().Be(0x4e); // N
		png[3].Should().Be(0x47); // G
	}

	#endregion

	#region Helper Methods

	private Tileset CreateSimpleTileset()
	{
		// Create a tileset with 2 tiles
		var data = new byte[32];

		// Tile 0: all black (color index 0)
		// Tile 1: all white (color index 3)
		for (int i = 0; i < 8; i++)
		{
			data[i + 16] = 0xff;
			data[i + 24] = 0xff;
		}

		return _service.LoadTileset(data, 0, 2, MapTileFormat.Nes2Bpp);
	}

	private MapPalette CreateGrayscalePalette()
	{
		return new MapPalette
		{
			Name = "Grayscale",
			ColorCount = 4,
			Colors = new uint[]
			{
				0xff000000, // Black
				0xff555555, // Dark gray
				0xffaaaaaa, // Light gray
				0xffffffff  // White
			},
			TransparentIndex0 = false
		};
	}

	#endregion
}
