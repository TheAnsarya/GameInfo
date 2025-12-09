using System.Drawing;

namespace GameInfoTools.Core;

/// <summary>
/// Tile graphics extraction and manipulation.
/// Supports NES, SNES, Game Boy, and GBA tile formats.
/// </summary>
public static class TileGraphics
{
	/// <summary>
	/// Tile format/bit depth options.
	/// </summary>
	public enum TileFormat
	{
		Nes2Bpp,        // NES CHR format (2bpp planar)
		Snes2Bpp,       // SNES 2bpp
		Snes4Bpp,       // SNES 4bpp
		Snes8Bpp,       // SNES 8bpp (Mode 7)
		Gb2Bpp,         // Game Boy 2bpp
		Gba4Bpp,        // GBA 4bpp linear
		Gba8Bpp,        // GBA 8bpp linear
		Linear1Bpp,     // 1bpp linear
		Linear2Bpp,     // 2bpp linear
		Linear4Bpp,     // 4bpp linear
	}

	/// <summary>
	/// Get bytes per tile for a format.
	/// </summary>
	public static int GetBytesPerTile(TileFormat format)
	{
		return format switch
		{
			TileFormat.Linear1Bpp => 8,
			TileFormat.Nes2Bpp or TileFormat.Gb2Bpp or TileFormat.Snes2Bpp or TileFormat.Linear2Bpp => 16,
			TileFormat.Snes4Bpp or TileFormat.Gba4Bpp or TileFormat.Linear4Bpp => 32,
			TileFormat.Snes8Bpp or TileFormat.Gba8Bpp => 64,
			_ => 16
		};
	}

	/// <summary>
	/// Get colors per tile for a format.
	/// </summary>
	public static int GetColorsPerTile(TileFormat format)
	{
		return format switch
		{
			TileFormat.Linear1Bpp => 2,
			TileFormat.Nes2Bpp or TileFormat.Gb2Bpp or TileFormat.Snes2Bpp or TileFormat.Linear2Bpp => 4,
			TileFormat.Snes4Bpp or TileFormat.Gba4Bpp or TileFormat.Linear4Bpp => 16,
			TileFormat.Snes8Bpp or TileFormat.Gba8Bpp => 256,
			_ => 4
		};
	}

	/// <summary>
	/// Decode a single 8x8 tile to indexed pixel data.
	/// </summary>
	public static byte[,] DecodeTile(byte[] data, int offset, TileFormat format)
	{
		var tile = new byte[8, 8];

		switch (format)
		{
			case TileFormat.Nes2Bpp:
			case TileFormat.Gb2Bpp:
				DecodeNesTile(data, offset, tile);
				break;

			case TileFormat.Snes2Bpp:
				DecodeSnes2BppTile(data, offset, tile);
				break;

			case TileFormat.Snes4Bpp:
				DecodeSnes4BppTile(data, offset, tile);
				break;

			case TileFormat.Gba4Bpp:
				DecodeGba4BppTile(data, offset, tile);
				break;

			case TileFormat.Gba8Bpp:
				DecodeGba8BppTile(data, offset, tile);
				break;

			case TileFormat.Linear1Bpp:
				DecodeLinear1BppTile(data, offset, tile);
				break;

			default:
				DecodeNesTile(data, offset, tile);
				break;
		}

		return tile;
	}

	private static void DecodeNesTile(byte[] data, int offset, byte[,] tile)
	{
		// NES/GB 2bpp planar format
		// 8 bytes for bit plane 0, 8 bytes for bit plane 1
		for (int y = 0; y < 8; y++)
		{
			byte plane0 = offset + y < data.Length ? data[offset + y] : (byte)0;
			byte plane1 = offset + y + 8 < data.Length ? data[offset + y + 8] : (byte)0;

			for (int x = 0; x < 8; x++)
			{
				int bit = 7 - x;
				int color = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1);
				tile[y, x] = (byte)color;
			}
		}
	}

	private static void DecodeSnes2BppTile(byte[] data, int offset, byte[,] tile)
	{
		// SNES 2bpp: interleaved bitplanes
		for (int y = 0; y < 8; y++)
		{
			byte plane0 = offset + y * 2 < data.Length ? data[offset + y * 2] : (byte)0;
			byte plane1 = offset + y * 2 + 1 < data.Length ? data[offset + y * 2 + 1] : (byte)0;

			for (int x = 0; x < 8; x++)
			{
				int bit = 7 - x;
				int color = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1);
				tile[y, x] = (byte)color;
			}
		}
	}

	private static void DecodeSnes4BppTile(byte[] data, int offset, byte[,] tile)
	{
		// SNES 4bpp: two sets of interleaved bitplanes
		for (int y = 0; y < 8; y++)
		{
			byte plane0 = offset + y * 2 < data.Length ? data[offset + y * 2] : (byte)0;
			byte plane1 = offset + y * 2 + 1 < data.Length ? data[offset + y * 2 + 1] : (byte)0;
			byte plane2 = offset + 16 + y * 2 < data.Length ? data[offset + 16 + y * 2] : (byte)0;
			byte plane3 = offset + 16 + y * 2 + 1 < data.Length ? data[offset + 16 + y * 2 + 1] : (byte)0;

			for (int x = 0; x < 8; x++)
			{
				int bit = 7 - x;
				int color = ((plane0 >> bit) & 1) |
							(((plane1 >> bit) & 1) << 1) |
							(((plane2 >> bit) & 1) << 2) |
							(((plane3 >> bit) & 1) << 3);
				tile[y, x] = (byte)color;
			}
		}
	}

	private static void DecodeGba4BppTile(byte[] data, int offset, byte[,] tile)
	{
		// GBA 4bpp: linear nibbles
		int idx = 0;
		for (int y = 0; y < 8; y++)
		{
			for (int x = 0; x < 8; x += 2)
			{
				byte b = offset + idx < data.Length ? data[offset + idx] : (byte)0;
				tile[y, x] = (byte)(b & 0x0f);
				tile[y, x + 1] = (byte)((b >> 4) & 0x0f);
				idx++;
			}
		}
	}

	private static void DecodeGba8BppTile(byte[] data, int offset, byte[,] tile)
	{
		// GBA 8bpp: one byte per pixel
		int idx = 0;
		for (int y = 0; y < 8; y++)
		{
			for (int x = 0; x < 8; x++)
			{
				tile[y, x] = offset + idx < data.Length ? data[offset + idx] : (byte)0;
				idx++;
			}
		}
	}

	private static void DecodeLinear1BppTile(byte[] data, int offset, byte[,] tile)
	{
		for (int y = 0; y < 8; y++)
		{
			byte row = offset + y < data.Length ? data[offset + y] : (byte)0;
			for (int x = 0; x < 8; x++)
			{
				tile[y, x] = (byte)((row >> (7 - x)) & 1);
			}
		}
	}

	/// <summary>
	/// Encode tile back to ROM format.
	/// </summary>
	public static byte[] EncodeTile(byte[,] tile, TileFormat format)
	{
		int size = GetBytesPerTile(format);
		var data = new byte[size];

		switch (format)
		{
			case TileFormat.Nes2Bpp:
			case TileFormat.Gb2Bpp:
				EncodeNesTile(tile, data);
				break;

			case TileFormat.Snes2Bpp:
				EncodeSnes2BppTile(tile, data);
				break;

			case TileFormat.Snes4Bpp:
				EncodeSnes4BppTile(tile, data);
				break;

			case TileFormat.Gba4Bpp:
				EncodeGba4BppTile(tile, data);
				break;

			default:
				EncodeNesTile(tile, data);
				break;
		}

		return data;
	}

	private static void EncodeNesTile(byte[,] tile, byte[] data)
	{
		for (int y = 0; y < 8; y++)
		{
			byte plane0 = 0;
			byte plane1 = 0;

			for (int x = 0; x < 8; x++)
			{
				int bit = 7 - x;
				int color = tile[y, x];
				plane0 |= (byte)(((color >> 0) & 1) << bit);
				plane1 |= (byte)(((color >> 1) & 1) << bit);
			}

			data[y] = plane0;
			data[y + 8] = plane1;
		}
	}

	private static void EncodeSnes2BppTile(byte[,] tile, byte[] data)
	{
		for (int y = 0; y < 8; y++)
		{
			byte plane0 = 0;
			byte plane1 = 0;

			for (int x = 0; x < 8; x++)
			{
				int bit = 7 - x;
				int color = tile[y, x];
				plane0 |= (byte)(((color >> 0) & 1) << bit);
				plane1 |= (byte)(((color >> 1) & 1) << bit);
			}

			data[y * 2] = plane0;
			data[y * 2 + 1] = plane1;
		}
	}

	private static void EncodeSnes4BppTile(byte[,] tile, byte[] data)
	{
		for (int y = 0; y < 8; y++)
		{
			byte plane0 = 0, plane1 = 0, plane2 = 0, plane3 = 0;

			for (int x = 0; x < 8; x++)
			{
				int bit = 7 - x;
				int color = tile[y, x];
				plane0 |= (byte)(((color >> 0) & 1) << bit);
				plane1 |= (byte)(((color >> 1) & 1) << bit);
				plane2 |= (byte)(((color >> 2) & 1) << bit);
				plane3 |= (byte)(((color >> 3) & 1) << bit);
			}

			data[y * 2] = plane0;
			data[y * 2 + 1] = plane1;
			data[16 + y * 2] = plane2;
			data[16 + y * 2 + 1] = plane3;
		}
	}

	private static void EncodeGba4BppTile(byte[,] tile, byte[] data)
	{
		int idx = 0;
		for (int y = 0; y < 8; y++)
		{
			for (int x = 0; x < 8; x += 2)
			{
				data[idx] = (byte)((tile[y, x] & 0x0f) | ((tile[y, x + 1] & 0x0f) << 4));
				idx++;
			}
		}
	}

	/// <summary>
	/// Extract multiple tiles from ROM data.
	/// </summary>
	public static List<byte[,]> ExtractTiles(byte[] data, int offset, int count, TileFormat format)
	{
		var tiles = new List<byte[,]>();
		int bytesPerTile = GetBytesPerTile(format);

		for (int i = 0; i < count && offset + bytesPerTile <= data.Length; i++)
		{
			tiles.Add(DecodeTile(data, offset, format));
			offset += bytesPerTile;
		}

		return tiles;
	}

	/// <summary>
	/// Count how many tiles fit in a data range.
	/// </summary>
	public static int CountTiles(int dataLength, TileFormat format)
	{
		return dataLength / GetBytesPerTile(format);
	}
}

/// <summary>
/// Palette handling for retro consoles.
/// </summary>
public static class Palette
{
	/// <summary>
	/// Convert NES palette index to RGB color.
	/// </summary>
	public static (byte R, byte G, byte B) NesToRgb(byte nesColor)
	{
		// Standard NES palette (2C02)
		var nesPalette = new (byte R, byte G, byte B)[]
		{
			(0x7c, 0x7c, 0x7c), (0x00, 0x00, 0xfc), (0x00, 0x00, 0xbc), (0x44, 0x28, 0xbc),
			(0x94, 0x00, 0x84), (0xa8, 0x00, 0x20), (0xa8, 0x10, 0x00), (0x88, 0x14, 0x00),
			(0x50, 0x30, 0x00), (0x00, 0x78, 0x00), (0x00, 0x68, 0x00), (0x00, 0x58, 0x00),
			(0x00, 0x40, 0x58), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),

			(0xbc, 0xbc, 0xbc), (0x00, 0x78, 0xf8), (0x00, 0x58, 0xf8), (0x68, 0x44, 0xfc),
			(0xd8, 0x00, 0xcc), (0xe4, 0x00, 0x58), (0xf8, 0x38, 0x00), (0xe4, 0x5c, 0x10),
			(0xac, 0x7c, 0x00), (0x00, 0xb8, 0x00), (0x00, 0xa8, 0x00), (0x00, 0xa8, 0x44),
			(0x00, 0x88, 0x88), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),

			(0xf8, 0xf8, 0xf8), (0x3c, 0xbc, 0xfc), (0x68, 0x88, 0xfc), (0x98, 0x78, 0xf8),
			(0xf8, 0x78, 0xf8), (0xf8, 0x58, 0x98), (0xf8, 0x78, 0x58), (0xfc, 0xa0, 0x44),
			(0xf8, 0xb8, 0x00), (0xb8, 0xf8, 0x18), (0x58, 0xd8, 0x54), (0x58, 0xf8, 0x98),
			(0x00, 0xe8, 0xd8), (0x78, 0x78, 0x78), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),

			(0xfc, 0xfc, 0xfc), (0xa4, 0xe4, 0xfc), (0xb8, 0xb8, 0xf8), (0xd8, 0xb8, 0xf8),
			(0xf8, 0xb8, 0xf8), (0xf8, 0xa4, 0xc0), (0xf0, 0xd0, 0xb0), (0xfc, 0xe0, 0xa8),
			(0xf8, 0xd8, 0x78), (0xd8, 0xf8, 0x78), (0xb8, 0xf8, 0xb8), (0xb8, 0xf8, 0xd8),
			(0x00, 0xfc, 0xfc), (0xf8, 0xd8, 0xf8), (0x00, 0x00, 0x00), (0x00, 0x00, 0x00),
		};

		int index = nesColor & 0x3f;
		return nesPalette[index];
	}

	/// <summary>
	/// Convert SNES 15-bit color to RGB.
	/// </summary>
	public static (byte R, byte G, byte B) SnesColorToRgb(ushort snesColor)
	{
		// SNES: 0BBBBBGG GGGRRRRR
		int r = (snesColor & 0x1f) << 3;
		int g = ((snesColor >> 5) & 0x1f) << 3;
		int b = ((snesColor >> 10) & 0x1f) << 3;
		return ((byte)r, (byte)g, (byte)b);
	}

	/// <summary>
	/// Convert RGB to SNES 15-bit color.
	/// </summary>
	public static ushort RgbToSnesColor(byte r, byte g, byte b)
	{
		return (ushort)((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10));
	}

	/// <summary>
	/// Convert GBA 15-bit color to RGB.
	/// </summary>
	public static (byte R, byte G, byte B) GbaColorToRgb(ushort gbaColor)
	{
		// GBA: same as SNES but different byte order in ROM
		return SnesColorToRgb(gbaColor);
	}

	/// <summary>
	/// Convert Game Boy 2-bit color to grayscale RGB.
	/// </summary>
	public static (byte R, byte G, byte B) GbColorToRgb(byte gbColor, bool isCgb = false)
	{
		if (!isCgb)
		{
			// Original Game Boy grayscale
			var shades = new byte[] { 0xff, 0xaa, 0x55, 0x00 };
			byte shade = shades[gbColor & 3];
			return (shade, shade, shade);
		}
		else
		{
			// CGB uses SNES-style 15-bit colors
			return SnesColorToRgb((ushort)(gbColor & 0x7fff));
		}
	}

	/// <summary>
	/// Read a SNES palette from ROM data.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadSnesPalette(byte[] data, int offset, int colorCount)
	{
		var palette = new (byte R, byte G, byte B)[colorCount];

		for (int i = 0; i < colorCount && offset + 2 <= data.Length; i++)
		{
			ushort color = (ushort)(data[offset] | (data[offset + 1] << 8));
			palette[i] = SnesColorToRgb(color);
			offset += 2;
		}

		return palette;
	}

	/// <summary>
	/// Read a GBA palette from ROM data.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadGbaPalette(byte[] data, int offset, int colorCount)
	{
		return ReadSnesPalette(data, offset, colorCount); // Same format
	}

	/// <summary>
	/// Write a SNES/GBA palette to byte array.
	/// </summary>
	public static byte[] WritePalette((byte R, byte G, byte B)[] palette)
	{
		var data = new byte[palette.Length * 2];
		for (int i = 0; i < palette.Length; i++)
		{
			ushort color = RgbToSnesColor(palette[i].R, palette[i].G, palette[i].B);
			data[i * 2] = (byte)(color & 0xff);
			data[i * 2 + 1] = (byte)((color >> 8) & 0xff);
		}
		return data;
	}

	/// <summary>
	/// Generate a grayscale palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] CreateGrayscale(int colorCount)
	{
		var palette = new (byte R, byte G, byte B)[colorCount];
		for (int i = 0; i < colorCount; i++)
		{
			byte shade = (byte)(255 * i / (colorCount - 1));
			palette[i] = (shade, shade, shade);
		}
		return palette;
	}

	/// <summary>
	/// Create default NES-style 4-color palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] DefaultNesPalette()
	{
		return new (byte R, byte G, byte B)[]
		{
			NesToRgb(0x0f), // Black
			NesToRgb(0x00), // Gray
			NesToRgb(0x10), // Light gray
			NesToRgb(0x30), // White
		};
	}
}
