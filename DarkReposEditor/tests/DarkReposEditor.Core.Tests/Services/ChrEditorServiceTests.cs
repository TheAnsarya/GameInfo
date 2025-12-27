using FluentAssertions;
using Xunit;
using DarkReposEditor.Core.Interfaces;
using DarkReposEditor.Core.Services;

namespace DarkReposEditor.Core.Tests.Services;

public class ChrEditorServiceTests
{
	private readonly ChrEditorService _service = new();

	#region Tile Decoding Tests

	[Fact]
	public void DecodeNesTile_ShouldDecodeCorrectly()
	{
		// Arrange - Simple tile with all pixels set to specific values
		var data = new byte[16];
		// Row 0: all 0s
		// Row 1: all 1s (low bit set)
		data[1] = 0xff;
		// Row 2: all 2s (high bit set)
		data[10] = 0xff;
		// Row 3: all 3s (both bits set)
		data[3] = 0xff;
		data[11] = 0xff;

		// Act
		var tile = _service.GetTile(data, TileFormat.Nes, 0);

		// Assert
		tile.GetPixel(0, 0).Should().Be(0);
		tile.GetPixel(0, 1).Should().Be(1);
		tile.GetPixel(0, 2).Should().Be(2);
		tile.GetPixel(0, 3).Should().Be(3);
	}

	[Fact]
	public void DecodeGameBoyTile_ShouldDecodeCorrectly()
	{
		// Arrange - GB uses interleaved format
		var data = new byte[16];
		// Row 0: pixel 0 = 3 (both bits), rest 0
		data[0] = 0x80; // low bit of pixel 0
		data[1] = 0x80; // high bit of pixel 0

		// Act
		var tile = _service.GetTile(data, TileFormat.GameBoy, 0);

		// Assert
		tile.GetPixel(0, 0).Should().Be(3);
		tile.GetPixel(1, 0).Should().Be(0);
	}

	[Fact]
	public void DecodeSnes4BppTile_ShouldDecodeCorrectly()
	{
		// Arrange
		var data = new byte[32];
		// Set pixel (0,0) to value 15 (all 4 bits)
		data[0] = 0x80;   // bp0
		data[8] = 0x80;   // bp1
		data[16] = 0x80;  // bp2
		data[24] = 0x80;  // bp3

		// Act
		var tile = _service.GetTile(data, TileFormat.Snes4Bpp, 0);

		// Assert
		tile.GetPixel(0, 0).Should().Be(15);
		tile.GetPixel(1, 0).Should().Be(0);
	}

	[Fact]
	public void DecodeGenesisTile_ShouldDecodeCorrectly()
	{
		// Arrange - Genesis 4bpp packed (high nibble first)
		var data = new byte[32];
		data[0] = 0xa5; // pixel 0 = 10, pixel 1 = 5

		// Act
		var tile = _service.GetTile(data, TileFormat.Genesis, 0);

		// Assert
		tile.GetPixel(0, 0).Should().Be(10);
		tile.GetPixel(1, 0).Should().Be(5);
	}

	[Fact]
	public void DecodeGba4BppTile_ShouldDecodeCorrectly()
	{
		// Arrange - GBA 4bpp packed (low nibble first!)
		var data = new byte[32];
		data[0] = 0x52; // pixel 0 = 2, pixel 1 = 5

		// Act
		var tile = _service.GetTile(data, TileFormat.Gba4Bpp, 0);

		// Assert
		tile.GetPixel(0, 0).Should().Be(2);
		tile.GetPixel(1, 0).Should().Be(5);
	}

	[Fact]
	public void DecodeGba8BppTile_ShouldDecodeCorrectly()
	{
		// Arrange
		var data = new byte[64];
		data[0] = 42;  // pixel (0,0)
		data[8] = 100; // pixel (0,1)

		// Act
		var tile = _service.GetTile(data, TileFormat.Gba8Bpp, 0);

		// Assert
		tile.GetPixel(0, 0).Should().Be(42);
		tile.GetPixel(0, 1).Should().Be(100);
	}

	[Fact]
	public void DecodeTiles_ShouldDecodeMultipleTiles()
	{
		// Arrange
		var data = new byte[32]; // 2 NES tiles

		// Act
		var tiles = _service.DecodeTiles(data, TileFormat.Nes);

		// Assert
		tiles.Should().HaveCount(2);
	}

	[Fact]
	public void DecodeTiles_WithCount_ShouldLimitTiles()
	{
		// Arrange
		var data = new byte[48]; // 3 NES tiles worth

		// Act
		var tiles = _service.DecodeTiles(data, TileFormat.Nes, 0, 2);

		// Assert
		tiles.Should().HaveCount(2);
	}

	[Fact]
	public void DecodeTiles_WithOffset_ShouldStartAtOffset()
	{
		// Arrange
		var data = new byte[32];
		data[16] = 0xff; // Set low bits of row 0 in second tile

		// Act
		var tiles = _service.DecodeTiles(data, TileFormat.Nes, 16, 1);

		// Assert
		tiles.Should().HaveCount(1);
		tiles[0].GetPixel(0, 0).Should().Be(1);
	}

	#endregion

	#region Tile Encoding Tests

	[Fact]
	public void EncodeNesTile_RoundTrip_ShouldPreserveData()
	{
		// Arrange
		var original = new Tile();
		original.SetPixel(0, 0, 3);
		original.SetPixel(7, 7, 2);
		original.SetPixel(3, 4, 1);

		// Act
		var encoded = _service.EncodeTiles([original], TileFormat.Nes);
		var decoded = _service.GetTile(encoded, TileFormat.Nes, 0);

		// Assert
		decoded.GetPixel(0, 0).Should().Be(3);
		decoded.GetPixel(7, 7).Should().Be(2);
		decoded.GetPixel(3, 4).Should().Be(1);
	}

	[Fact]
	public void EncodeGameBoyTile_RoundTrip_ShouldPreserveData()
	{
		// Arrange
		var original = new Tile();
		for (var i = 0; i < 8; i++)
			original.SetPixel(i, 0, (byte)(i % 4));

		// Act
		var encoded = _service.EncodeTiles([original], TileFormat.GameBoy);
		var decoded = _service.GetTile(encoded, TileFormat.GameBoy, 0);

		// Assert
		for (var i = 0; i < 8; i++)
			decoded.GetPixel(i, 0).Should().Be((byte)(i % 4));
	}

	[Fact]
	public void EncodeSnes4BppTile_RoundTrip_ShouldPreserveData()
	{
		// Arrange
		var original = new Tile();
		original.SetPixel(0, 0, 15);
		original.SetPixel(1, 0, 8);
		original.SetPixel(2, 0, 4);

		// Act
		var encoded = _service.EncodeTiles([original], TileFormat.Snes4Bpp);
		var decoded = _service.GetTile(encoded, TileFormat.Snes4Bpp, 0);

		// Assert
		decoded.GetPixel(0, 0).Should().Be(15);
		decoded.GetPixel(1, 0).Should().Be(8);
		decoded.GetPixel(2, 0).Should().Be(4);
	}

	[Fact]
	public void SetTile_ShouldModifyData()
	{
		// Arrange
		var data = new byte[32];
		var tile = new Tile();
		tile.SetPixel(0, 0, 3);

		// Act
		_service.SetTile(data, TileFormat.Nes, 1, tile);

		// Assert
		var decoded = _service.GetTile(data, TileFormat.Nes, 1);
		decoded.GetPixel(0, 0).Should().Be(3);
	}

	#endregion

	#region Palette Tests

	[Fact]
	public void ApplyPalette_ShouldMapPixelsToColors()
	{
		// Arrange
		var tile = new Tile();
		tile.SetPixel(0, 0, 0);
		tile.SetPixel(1, 0, 1);

		var palette = new Palette([
			new Color(0, 0, 0),
			new Color(255, 255, 255)
		]);

		// Act
		var colors = _service.ApplyPalette(tile, palette);

		// Assert
		colors[0].Should().Be(new Color(0, 0, 0));
		colors[1].Should().Be(new Color(255, 255, 255));
	}

	[Fact]
	public void CreateGrayscalePalette_2Bpp_ShouldCreate4Colors()
	{
		// Act
		var palette = _service.CreateGrayscalePalette(2);

		// Assert
		palette.Count.Should().Be(4);
		palette[0].Should().Be(new Color(0, 0, 0));
		palette[3].Should().Be(new Color(255, 255, 255));
	}

	[Fact]
	public void CreateGrayscalePalette_4Bpp_ShouldCreate16Colors()
	{
		// Act
		var palette = _service.CreateGrayscalePalette(4);

		// Assert
		palette.Count.Should().Be(16);
	}

	[Fact]
	public void GetDefaultPalette_Nes_ShouldReturn4Colors()
	{
		// Act
		var palette = _service.GetDefaultPalette(TilePlatform.Nes);

		// Assert
		palette.Count.Should().Be(4);
	}

	[Fact]
	public void GetDefaultPalette_GameBoy_ShouldReturnGreenPalette()
	{
		// Act
		var palette = _service.GetDefaultPalette(TilePlatform.GameBoy);

		// Assert
		palette.Count.Should().Be(4);
		palette.Name.Should().Contain("Game Boy");
	}

	#endregion

	#region Image Rendering Tests

	[Fact]
	public void RenderToImage_ShouldCreateCorrectSizeBuffer()
	{
		// Arrange
		var tiles = new Tile[4];
		for (var i = 0; i < 4; i++)
			tiles[i] = new Tile();

		var palette = _service.CreateGrayscalePalette(2);

		// Act
		var buffer = _service.RenderToImage(tiles, palette, tilesPerRow: 2);

		// Assert
		// 2 tiles wide * 8 pixels * 2 tiles high * 8 pixels * 4 bytes (RGBA)
		buffer.Should().HaveCount(16 * 16 * 4);
	}

	[Fact]
	public void RenderToImage_WithScale_ShouldScaleCorrectly()
	{
		// Arrange
		var tiles = new[] { new Tile() };
		var palette = _service.CreateGrayscalePalette(2);

		// Act
		var buffer = _service.RenderToImage(tiles, palette, tilesPerRow: 1, scale: 2);

		// Assert
		// 8*2 * 8*2 * 4 = 16 * 16 * 4
		buffer.Should().HaveCount(16 * 16 * 4);
	}

	[Fact]
	public void RenderToImage_EmptyTiles_ShouldReturnEmptyBuffer()
	{
		// Arrange
		var tiles = Array.Empty<Tile>();
		var palette = _service.CreateGrayscalePalette(2);

		// Act
		var buffer = _service.RenderToImage(tiles, palette, tilesPerRow: 1);

		// Assert
		buffer.Should().BeEmpty();
	}

	[Fact]
	public void ExportToPng_ShouldReturnValidPng()
	{
		// Arrange
		var tile = new Tile();
		tile.SetPixel(0, 0, 1);
		var palette = _service.CreateGrayscalePalette(2);

		// Act
		var png = _service.ExportToPng([tile], palette, tilesPerRow: 1);

		// Assert
		png.Should().NotBeEmpty();
		// PNG magic bytes
		png[0].Should().Be(0x89);
		png[1].Should().Be(0x50);
		png[2].Should().Be(0x4e);
		png[3].Should().Be(0x47);
	}

	#endregion

	#region Bytes Per Tile Tests

	[Theory]
	[InlineData(TileFormat.Bpp1, 8)]
	[InlineData(TileFormat.Nes, 16)]
	[InlineData(TileFormat.GameBoy, 16)]
	[InlineData(TileFormat.Bpp2Planar, 16)]
	[InlineData(TileFormat.Snes4Bpp, 32)]
	[InlineData(TileFormat.Bpp4Planar, 32)]
	[InlineData(TileFormat.Genesis, 32)]
	[InlineData(TileFormat.Gba4Bpp, 32)]
	[InlineData(TileFormat.Bpp8, 64)]
	[InlineData(TileFormat.Gba8Bpp, 64)]
	public void GetBytesPerTile_ShouldReturnCorrectValue(TileFormat format, int expected)
	{
		// Act
		var result = _service.GetBytesPerTile(format);

		// Assert
		result.Should().Be(expected);
	}

	#endregion

	#region Tile Class Tests

	[Fact]
	public void Tile_GetPixel_OutOfRange_ShouldThrow()
	{
		// Arrange
		var tile = new Tile();

		// Act & Assert
		var act = () => tile.GetPixel(8, 0);
		act.Should().Throw<ArgumentOutOfRangeException>();
	}

	[Fact]
	public void Tile_SetPixel_OutOfRange_ShouldThrow()
	{
		// Arrange
		var tile = new Tile();

		// Act & Assert
		var act = () => tile.SetPixel(0, 8, 0);
		act.Should().Throw<ArgumentOutOfRangeException>();
	}

	[Fact]
	public void Tile_Clone_ShouldCreateIndependentCopy()
	{
		// Arrange
		var original = new Tile();
		original.SetPixel(0, 0, 5);

		// Act
		var clone = original.Clone();
		clone.SetPixel(0, 0, 10);

		// Assert
		original.GetPixel(0, 0).Should().Be(5);
		clone.GetPixel(0, 0).Should().Be(10);
	}

	#endregion

	#region Color Tests

	[Fact]
	public void Color_FromRgb_ShouldParseCorrectly()
	{
		// Act
		var color = Color.FromRgb(0xff8040);

		// Assert
		color.R.Should().Be(0xff);
		color.G.Should().Be(0x80);
		color.B.Should().Be(0x40);
		color.A.Should().Be(255);
	}

	[Fact]
	public void Color_ToRgba_ShouldPackCorrectly()
	{
		// Arrange
		var color = new Color(0x12, 0x34, 0x56, 0x78);

		// Act
		var packed = color.ToRgba();

		// Assert
		packed.Should().Be(0x78123456);
	}

	#endregion
}
