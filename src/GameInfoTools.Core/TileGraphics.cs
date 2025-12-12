using System.Drawing;

namespace GameInfoTools.Core;

/// <summary>
/// Tile graphics extraction and manipulation.
/// Supports NES, SNES, Game Boy, and GBA tile formats.
/// </summary>
public static class TileGraphics {
	/// <summary>
	/// Tile format/bit depth options.
	/// </summary>
	public enum TileFormat {
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
	public static int GetBytesPerTile(TileFormat format) {
		return format switch {
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
	public static int GetColorsPerTile(TileFormat format) {
		return format switch {
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
	public static byte[,] DecodeTile(byte[] data, int offset, TileFormat format) {
		var tile = new byte[8, 8];

		switch (format) {
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

	private static void DecodeNesTile(byte[] data, int offset, byte[,] tile) {
		// NES/GB 2bpp planar format
		// 8 bytes for bit plane 0, 8 bytes for bit plane 1
		for (int y = 0; y < 8; y++) {
			byte plane0 = offset + y < data.Length ? data[offset + y] : (byte)0;
			byte plane1 = offset + y + 8 < data.Length ? data[offset + y + 8] : (byte)0;

			for (int x = 0; x < 8; x++) {
				int bit = 7 - x;
				int color = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1);
				tile[y, x] = (byte)color;
			}
		}
	}

	private static void DecodeSnes2BppTile(byte[] data, int offset, byte[,] tile) {
		// SNES 2bpp: interleaved bitplanes
		for (int y = 0; y < 8; y++) {
			byte plane0 = offset + (y * 2) < data.Length ? data[offset + (y * 2)] : (byte)0;
			byte plane1 = offset + (y * 2) + 1 < data.Length ? data[offset + (y * 2) + 1] : (byte)0;

			for (int x = 0; x < 8; x++) {
				int bit = 7 - x;
				int color = ((plane0 >> bit) & 1) | (((plane1 >> bit) & 1) << 1);
				tile[y, x] = (byte)color;
			}
		}
	}

	private static void DecodeSnes4BppTile(byte[] data, int offset, byte[,] tile) {
		// SNES 4bpp: two sets of interleaved bitplanes
		for (int y = 0; y < 8; y++) {
			byte plane0 = offset + (y * 2) < data.Length ? data[offset + (y * 2)] : (byte)0;
			byte plane1 = offset + (y * 2) + 1 < data.Length ? data[offset + (y * 2) + 1] : (byte)0;
			byte plane2 = offset + 16 + (y * 2) < data.Length ? data[offset + 16 + (y * 2)] : (byte)0;
			byte plane3 = offset + 16 + (y * 2) + 1 < data.Length ? data[offset + 16 + (y * 2) + 1] : (byte)0;

			for (int x = 0; x < 8; x++) {
				int bit = 7 - x;
				int color = ((plane0 >> bit) & 1) |
							(((plane1 >> bit) & 1) << 1) |
							(((plane2 >> bit) & 1) << 2) |
							(((plane3 >> bit) & 1) << 3);
				tile[y, x] = (byte)color;
			}
		}
	}

	private static void DecodeGba4BppTile(byte[] data, int offset, byte[,] tile) {
		// GBA 4bpp: linear nibbles
		int idx = 0;
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x += 2) {
				byte b = offset + idx < data.Length ? data[offset + idx] : (byte)0;
				tile[y, x] = (byte)(b & 0x0f);
				tile[y, x + 1] = (byte)((b >> 4) & 0x0f);
				idx++;
			}
		}
	}

	private static void DecodeGba8BppTile(byte[] data, int offset, byte[,] tile) {
		// GBA 8bpp: one byte per pixel
		int idx = 0;
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				tile[y, x] = offset + idx < data.Length ? data[offset + idx] : (byte)0;
				idx++;
			}
		}
	}

	private static void DecodeLinear1BppTile(byte[] data, int offset, byte[,] tile) {
		for (int y = 0; y < 8; y++) {
			byte row = offset + y < data.Length ? data[offset + y] : (byte)0;
			for (int x = 0; x < 8; x++) {
				tile[y, x] = (byte)((row >> (7 - x)) & 1);
			}
		}
	}

	/// <summary>
	/// Encode tile back to ROM format.
	/// </summary>
	public static byte[] EncodeTile(byte[,] tile, TileFormat format) {
		int size = GetBytesPerTile(format);
		var data = new byte[size];

		switch (format) {
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

	private static void EncodeNesTile(byte[,] tile, byte[] data) {
		for (int y = 0; y < 8; y++) {
			byte plane0 = 0;
			byte plane1 = 0;

			for (int x = 0; x < 8; x++) {
				int bit = 7 - x;
				int color = tile[y, x];
				plane0 |= (byte)(((color >> 0) & 1) << bit);
				plane1 |= (byte)(((color >> 1) & 1) << bit);
			}

			data[y] = plane0;
			data[y + 8] = plane1;
		}
	}

	private static void EncodeSnes2BppTile(byte[,] tile, byte[] data) {
		for (int y = 0; y < 8; y++) {
			byte plane0 = 0;
			byte plane1 = 0;

			for (int x = 0; x < 8; x++) {
				int bit = 7 - x;
				int color = tile[y, x];
				plane0 |= (byte)(((color >> 0) & 1) << bit);
				plane1 |= (byte)(((color >> 1) & 1) << bit);
			}

			data[y * 2] = plane0;
			data[(y * 2) + 1] = plane1;
		}
	}

	private static void EncodeSnes4BppTile(byte[,] tile, byte[] data) {
		for (int y = 0; y < 8; y++) {
			byte plane0 = 0, plane1 = 0, plane2 = 0, plane3 = 0;

			for (int x = 0; x < 8; x++) {
				int bit = 7 - x;
				int color = tile[y, x];
				plane0 |= (byte)(((color >> 0) & 1) << bit);
				plane1 |= (byte)(((color >> 1) & 1) << bit);
				plane2 |= (byte)(((color >> 2) & 1) << bit);
				plane3 |= (byte)(((color >> 3) & 1) << bit);
			}

			data[y * 2] = plane0;
			data[(y * 2) + 1] = plane1;
			data[16 + (y * 2)] = plane2;
			data[16 + (y * 2) + 1] = plane3;
		}
	}

	private static void EncodeGba4BppTile(byte[,] tile, byte[] data) {
		int idx = 0;
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x += 2) {
				data[idx] = (byte)((tile[y, x] & 0x0f) | ((tile[y, x + 1] & 0x0f) << 4));
				idx++;
			}
		}
	}

	/// <summary>
	/// Extract multiple tiles from ROM data.
	/// </summary>
	public static List<byte[,]> ExtractTiles(byte[] data, int offset, int count, TileFormat format) {
		var tiles = new List<byte[,]>();
		int bytesPerTile = GetBytesPerTile(format);

		for (int i = 0; i < count && offset + bytesPerTile <= data.Length; i++) {
			tiles.Add(DecodeTile(data, offset, format));
			offset += bytesPerTile;
		}

		return tiles;
	}

	/// <summary>
	/// Count how many tiles fit in a data range.
	/// </summary>
	public static int CountTiles(int dataLength, TileFormat format) {
		return dataLength / GetBytesPerTile(format);
	}
}

/// <summary>
/// Palette handling for retro consoles.
/// </summary>
public static class Palette {
	/// <summary>
	/// Convert NES palette index to RGB color.
	/// </summary>
	public static (byte R, byte G, byte B) NesToRgb(byte nesColor) {
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
	public static (byte R, byte G, byte B) SnesColorToRgb(ushort snesColor) {
		// SNES: 0BBBBBGG GGGRRRRR
		int r = (snesColor & 0x1f) << 3;
		int g = ((snesColor >> 5) & 0x1f) << 3;
		int b = ((snesColor >> 10) & 0x1f) << 3;
		return ((byte)r, (byte)g, (byte)b);
	}

	/// <summary>
	/// Convert RGB to SNES 15-bit color.
	/// </summary>
	public static ushort RgbToSnesColor(byte r, byte g, byte b) {
		return (ushort)((r >> 3) | ((g >> 3) << 5) | ((b >> 3) << 10));
	}

	/// <summary>
	/// Convert GBA 15-bit color to RGB.
	/// </summary>
	public static (byte R, byte G, byte B) GbaColorToRgb(ushort gbaColor) {
		// GBA: same as SNES but different byte order in ROM
		return SnesColorToRgb(gbaColor);
	}

	/// <summary>
	/// Convert Game Boy 2-bit color to grayscale RGB.
	/// </summary>
	public static (byte R, byte G, byte B) GbColorToRgb(byte gbColor, bool isCgb = false) {
		if (!isCgb) {
			// Original Game Boy grayscale
			var shades = new byte[] { 0xff, 0xaa, 0x55, 0x00 };
			byte shade = shades[gbColor & 3];
			return (shade, shade, shade);
		} else {
			// CGB uses SNES-style 15-bit colors
			return SnesColorToRgb((ushort)(gbColor & 0x7fff));
		}
	}

	/// <summary>
	/// Read a SNES palette from ROM data.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadSnesPalette(byte[] data, int offset, int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];

		for (int i = 0; i < colorCount && offset + 2 <= data.Length; i++) {
			ushort color = (ushort)(data[offset] | (data[offset + 1] << 8));
			palette[i] = SnesColorToRgb(color);
			offset += 2;
		}

		return palette;
	}

	/// <summary>
	/// Read a GBA palette from ROM data.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadGbaPalette(byte[] data, int offset, int colorCount) {
		return ReadSnesPalette(data, offset, colorCount); // Same format
	}

	/// <summary>
	/// Write a SNES/GBA palette to byte array.
	/// </summary>
	public static byte[] WritePalette((byte R, byte G, byte B)[] palette) {
		var data = new byte[palette.Length * 2];
		for (int i = 0; i < palette.Length; i++) {
			ushort color = RgbToSnesColor(palette[i].R, palette[i].G, palette[i].B);
			data[i * 2] = (byte)(color & 0xff);
			data[(i * 2) + 1] = (byte)((color >> 8) & 0xff);
		}

		return data;
	}

	/// <summary>
	/// Generate a grayscale palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] CreateGrayscale(int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];
		for (int i = 0; i < colorCount; i++) {
			byte shade = (byte)(255 * i / (colorCount - 1));
			palette[i] = (shade, shade, shade);
		}

		return palette;
	}

	/// <summary>
	/// Create default NES-style 4-color palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] DefaultNesPalette() {
		return new (byte R, byte G, byte B)[]
		{
			NesToRgb(0x0f), // Black
			NesToRgb(0x00), // Gray
			NesToRgb(0x10), // Light gray
			NesToRgb(0x30), // White
		};
	}

	#region Advanced Palette Features

	/// <summary>
	/// Palette format for different systems.
	/// </summary>
	public enum PaletteFormat {
		Nes,         // NES - indexed from 64-color master palette
		Snes,        // SNES - 15-bit BGR
		Gba,         // GBA - 15-bit BGR (same as SNES)
		Genesis,     // Genesis/Mega Drive - 9-bit BGR (3 bits per channel)
		Gb,          // Game Boy - 2-bit grayscale
		Cgb,         // Color Game Boy - 15-bit BGR per palette
		Rgb24,       // Standard 24-bit RGB
		Rgba32,      // 32-bit RGBA with alpha
		Bgr15,       // 15-bit BGR (generic)
		Bgr16,       // 16-bit BGR with 6-bit green
	}

	/// <summary>
	/// Result of palette analysis.
	/// </summary>
	public record PaletteInfo(
		int ColorCount,
		int UniqueColors,
		bool HasTransparency,
		(byte R, byte G, byte B) DominantColor,
		float Saturation,
		float Brightness
	);

	/// <summary>
	/// Palette animation frame.
	/// </summary>
	public record PaletteAnimationFrame(
		int FrameIndex,
		(byte R, byte G, byte B)[] Colors,
		int DurationMs
	);

	/// <summary>
	/// Convert Genesis 9-bit color to RGB.
	/// </summary>
	public static (byte R, byte G, byte B) GenesisColorToRgb(ushort genesisColor) {
		// Genesis: ----BBB- GGG-RRR-
		int b = ((genesisColor >> 9) & 0x7) << 5;
		int g = ((genesisColor >> 5) & 0x7) << 5;
		int r = ((genesisColor >> 1) & 0x7) << 5;
		return ((byte)r, (byte)g, (byte)b);
	}

	/// <summary>
	/// Convert RGB to Genesis 9-bit color.
	/// </summary>
	public static ushort RgbToGenesisColor(byte r, byte g, byte b) {
		return (ushort)(((b >> 5) << 9) | ((g >> 5) << 5) | ((r >> 5) << 1));
	}

	/// <summary>
	/// Read a Genesis palette from ROM data.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadGenesisPalette(byte[] data, int offset, int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];

		for (int i = 0; i < colorCount && offset + 2 <= data.Length; i++) {
			// Genesis uses big endian
			ushort color = (ushort)((data[offset] << 8) | data[offset + 1]);
			palette[i] = GenesisColorToRgb(color);
			offset += 2;
		}

		return palette;
	}

	/// <summary>
	/// Read palette from data based on format.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadPalette(byte[] data, int offset, int colorCount, PaletteFormat format) {
		return format switch {
			PaletteFormat.Snes or PaletteFormat.Gba or PaletteFormat.Cgb or PaletteFormat.Bgr15 =>
				ReadSnesPalette(data, offset, colorCount),
			PaletteFormat.Genesis => ReadGenesisPalette(data, offset, colorCount),
			PaletteFormat.Nes => ReadNesPalette(data, offset, colorCount),
			PaletteFormat.Gb => ReadGbPalette(data, offset, colorCount),
			PaletteFormat.Rgb24 => ReadRgb24Palette(data, offset, colorCount),
			PaletteFormat.Rgba32 => ReadRgba32Palette(data, offset, colorCount),
			PaletteFormat.Bgr16 => ReadBgr16Palette(data, offset, colorCount),
			_ => throw new ArgumentException($"Unknown palette format: {format}")
		};
	}

	/// <summary>
	/// Read NES palette indices and convert to RGB.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadNesPalette(byte[] data, int offset, int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];
		for (int i = 0; i < colorCount && offset < data.Length; i++) {
			palette[i] = NesToRgb(data[offset++]);
		}
		return palette;
	}

	/// <summary>
	/// Read Game Boy grayscale palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadGbPalette(byte[] data, int offset, int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];
		int colorsRead = 0;
		while (colorsRead < colorCount && offset < data.Length) {
			byte val = data[offset++];
			for (int j = 0; j < 4 && colorsRead < colorCount; j++) {
				byte shade = (byte)((val >> (j * 2)) & 3);
				palette[colorsRead++] = GbColorToRgb(shade);
			}
		}
		return palette;
	}

	/// <summary>
	/// Read 24-bit RGB palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadRgb24Palette(byte[] data, int offset, int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];
		for (int i = 0; i < colorCount && offset + 3 <= data.Length; i++) {
			palette[i] = (data[offset], data[offset + 1], data[offset + 2]);
			offset += 3;
		}
		return palette;
	}

	/// <summary>
	/// Read 32-bit RGBA palette (ignores alpha).
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadRgba32Palette(byte[] data, int offset, int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];
		for (int i = 0; i < colorCount && offset + 4 <= data.Length; i++) {
			palette[i] = (data[offset], data[offset + 1], data[offset + 2]);
			offset += 4;
		}
		return palette;
	}

	/// <summary>
	/// Read 16-bit BGR palette (5-6-5 format).
	/// </summary>
	public static (byte R, byte G, byte B)[] ReadBgr16Palette(byte[] data, int offset, int colorCount) {
		var palette = new (byte R, byte G, byte B)[colorCount];
		for (int i = 0; i < colorCount && offset + 2 <= data.Length; i++) {
			ushort color = (ushort)(data[offset] | (data[offset + 1] << 8));
			int r = (color & 0x1f) << 3;
			int g = ((color >> 5) & 0x3f) << 2;
			int b = ((color >> 11) & 0x1f) << 3;
			palette[i] = ((byte)r, (byte)g, (byte)b);
			offset += 2;
		}
		return palette;
	}

	/// <summary>
	/// Analyze a palette for statistics.
	/// </summary>
	public static PaletteInfo AnalyzePalette((byte R, byte G, byte B)[] palette) {
		if (palette.Length == 0) {
			return new PaletteInfo(0, 0, false, (0, 0, 0), 0, 0);
		}

		var unique = palette.Distinct().Count();
		bool hasTransparency = palette.Any(c => c.R == 0 && c.G == 0 && c.B == 0);

		// Find dominant color (most common)
		var dominant = palette.GroupBy(c => c)
			.OrderByDescending(g => g.Count())
			.First().Key;

		// Calculate average saturation and brightness
		float totalSat = 0, totalBright = 0;
		foreach (var c in palette) {
			var (h, s, v) = RgbToHsv(c.R, c.G, c.B);
			totalSat += s;
			totalBright += v;
		}

		return new PaletteInfo(
			palette.Length,
			unique,
			hasTransparency,
			dominant,
			totalSat / palette.Length,
			totalBright / palette.Length
		);
	}

	/// <summary>
	/// Convert RGB to HSV.
	/// </summary>
	public static (float H, float S, float V) RgbToHsv(byte r, byte g, byte b) {
		float rf = r / 255f, gf = g / 255f, bf = b / 255f;
		float max = Math.Max(rf, Math.Max(gf, bf));
		float min = Math.Min(rf, Math.Min(gf, bf));
		float delta = max - min;

		float h = 0;
		if (delta != 0) {
			if (max == rf) h = 60 * (((gf - bf) / delta) % 6);
			else if (max == gf) h = 60 * (((bf - rf) / delta) + 2);
			else h = 60 * (((rf - gf) / delta) + 4);
		}
		if (h < 0) h += 360;

		float s = max == 0 ? 0 : delta / max;
		return (h, s, max);
	}

	/// <summary>
	/// Convert HSV to RGB.
	/// </summary>
	public static (byte R, byte G, byte B) HsvToRgb(float h, float s, float v) {
		float c = v * s;
		float x = c * (1 - Math.Abs((h / 60) % 2 - 1));
		float m = v - c;

		float rf, gf, bf;
		if (h < 60) { rf = c; gf = x; bf = 0; }
		else if (h < 120) { rf = x; gf = c; bf = 0; }
		else if (h < 180) { rf = 0; gf = c; bf = x; }
		else if (h < 240) { rf = 0; gf = x; bf = c; }
		else if (h < 300) { rf = x; gf = 0; bf = c; }
		else { rf = c; gf = 0; bf = x; }

		return ((byte)((rf + m) * 255), (byte)((gf + m) * 255), (byte)((bf + m) * 255));
	}

	/// <summary>
	/// Reduce palette to target color count using median cut algorithm.
	/// </summary>
	public static (byte R, byte G, byte B)[] ReduceColors((byte R, byte G, byte B)[] palette, int targetCount) {
		if (palette.Length <= targetCount) return palette;

		// Simple median cut implementation
		var colors = palette.ToList();
		var buckets = new List<List<(byte R, byte G, byte B)>> { colors };

		while (buckets.Count < targetCount) {
			// Find bucket with most variance
			var maxBucket = buckets.OrderByDescending(b => CalculateColorVariance(b)).First();
			if (maxBucket.Count <= 1) break;

			buckets.Remove(maxBucket);

			// Find longest axis
			var rangeR = maxBucket.Max(c => c.R) - maxBucket.Min(c => c.R);
			var rangeG = maxBucket.Max(c => c.G) - maxBucket.Min(c => c.G);
			var rangeB = maxBucket.Max(c => c.B) - maxBucket.Min(c => c.B);

			List<(byte R, byte G, byte B)> sorted;
			if (rangeR >= rangeG && rangeR >= rangeB)
				sorted = maxBucket.OrderBy(c => c.R).ToList();
			else if (rangeG >= rangeB)
				sorted = maxBucket.OrderBy(c => c.G).ToList();
			else
				sorted = maxBucket.OrderBy(c => c.B).ToList();

			int mid = sorted.Count / 2;
			buckets.Add(sorted.Take(mid).ToList());
			buckets.Add(sorted.Skip(mid).ToList());
		}

		// Return average color from each bucket
		return buckets.Select(bucket => {
			int r = (int)bucket.Average(c => c.R);
			int g = (int)bucket.Average(c => c.G);
			int b = (int)bucket.Average(c => c.B);
			return ((byte)r, (byte)g, (byte)b);
		}).ToArray();
	}

	private static float CalculateColorVariance(List<(byte R, byte G, byte B)> colors) {
		if (colors.Count <= 1) return 0;
		float avgR = (float)colors.Average(c => c.R);
		float avgG = (float)colors.Average(c => c.G);
		float avgB = (float)colors.Average(c => c.B);
		return (float)colors.Sum(c =>
			(c.R - avgR) * (c.R - avgR) +
			(c.G - avgG) * (c.G - avgG) +
			(c.B - avgB) * (c.B - avgB));
	}

	/// <summary>
	/// Generate palette animation frames by cycling hues.
	/// </summary>
	public static List<PaletteAnimationFrame> GenerateCycleAnimation(
		(byte R, byte G, byte B)[] basePalette,
		int frameCount,
		float hueShiftPerFrame,
		int durationMs = 100) {

		var frames = new List<PaletteAnimationFrame>();
		for (int i = 0; i < frameCount; i++) {
			var frameColors = new (byte R, byte G, byte B)[basePalette.Length];
			for (int j = 0; j < basePalette.Length; j++) {
				var (h, s, v) = RgbToHsv(basePalette[j].R, basePalette[j].G, basePalette[j].B);
				h = (h + hueShiftPerFrame * i) % 360;
				frameColors[j] = HsvToRgb(h, s, v);
			}
			frames.Add(new PaletteAnimationFrame(i, frameColors, durationMs));
		}
		return frames;
	}

	/// <summary>
	/// Generate gradient between two colors.
	/// </summary>
	public static (byte R, byte G, byte B)[] GenerateGradient(
		(byte R, byte G, byte B) startColor,
		(byte R, byte G, byte B) endColor,
		int colorCount) {

		var palette = new (byte R, byte G, byte B)[colorCount];
		for (int i = 0; i < colorCount; i++) {
			float t = colorCount > 1 ? (float)i / (colorCount - 1) : 0;
			byte r = (byte)(startColor.R + (endColor.R - startColor.R) * t);
			byte g = (byte)(startColor.G + (endColor.G - startColor.G) * t);
			byte b = (byte)(startColor.B + (endColor.B - startColor.B) * t);
			palette[i] = (r, g, b);
		}
		return palette;
	}

	/// <summary>
	/// Find the closest color in a palette to a given color.
	/// </summary>
	public static int FindClosestColor((byte R, byte G, byte B)[] palette, (byte R, byte G, byte B) target) {
		int bestIndex = 0;
		int bestDist = int.MaxValue;
		for (int i = 0; i < palette.Length; i++) {
			int dr = palette[i].R - target.R;
			int dg = palette[i].G - target.G;
			int db = palette[i].B - target.B;
			int dist = dr * dr + dg * dg + db * db;
			if (dist < bestDist) {
				bestDist = dist;
				bestIndex = i;
			}
		}
		return bestIndex;
	}

	/// <summary>
	/// Convert palette between formats.
	/// </summary>
	public static byte[] ConvertPaletteFormat((byte R, byte G, byte B)[] palette, PaletteFormat targetFormat) {
		return targetFormat switch {
			PaletteFormat.Snes or PaletteFormat.Gba or PaletteFormat.Bgr15 =>
				WritePalette(palette),
			PaletteFormat.Genesis => WriteGenesisPalette(palette),
			PaletteFormat.Rgb24 => WriteRgb24Palette(palette),
			PaletteFormat.Rgba32 => WriteRgba32Palette(palette),
			_ => WritePalette(palette)
		};
	}

	/// <summary>
	/// Write Genesis palette to bytes.
	/// </summary>
	public static byte[] WriteGenesisPalette((byte R, byte G, byte B)[] palette) {
		var data = new byte[palette.Length * 2];
		for (int i = 0; i < palette.Length; i++) {
			ushort color = RgbToGenesisColor(palette[i].R, palette[i].G, palette[i].B);
			// Big endian
			data[i * 2] = (byte)(color >> 8);
			data[i * 2 + 1] = (byte)(color & 0xff);
		}
		return data;
	}

	/// <summary>
	/// Write 24-bit RGB palette.
	/// </summary>
	public static byte[] WriteRgb24Palette((byte R, byte G, byte B)[] palette) {
		var data = new byte[palette.Length * 3];
		for (int i = 0; i < palette.Length; i++) {
			data[i * 3] = palette[i].R;
			data[i * 3 + 1] = palette[i].G;
			data[i * 3 + 2] = palette[i].B;
		}
		return data;
	}

	/// <summary>
	/// Write 32-bit RGBA palette.
	/// </summary>
	public static byte[] WriteRgba32Palette((byte R, byte G, byte B)[] palette, byte alpha = 255) {
		var data = new byte[palette.Length * 4];
		for (int i = 0; i < palette.Length; i++) {
			data[i * 4] = palette[i].R;
			data[i * 4 + 1] = palette[i].G;
			data[i * 4 + 2] = palette[i].B;
			data[i * 4 + 3] = alpha;
		}
		return data;
	}

	/// <summary>
	/// Adjust palette brightness.
	/// </summary>
	public static (byte R, byte G, byte B)[] AdjustBrightness((byte R, byte G, byte B)[] palette, float factor) {
		return palette.Select(c => {
			var (h, s, v) = RgbToHsv(c.R, c.G, c.B);
			v = Math.Clamp(v * factor, 0, 1);
			return HsvToRgb(h, s, v);
		}).ToArray();
	}

	/// <summary>
	/// Adjust palette saturation.
	/// </summary>
	public static (byte R, byte G, byte B)[] AdjustSaturation((byte R, byte G, byte B)[] palette, float factor) {
		return palette.Select(c => {
			var (h, s, v) = RgbToHsv(c.R, c.G, c.B);
			s = Math.Clamp(s * factor, 0, 1);
			return HsvToRgb(h, s, v);
		}).ToArray();
	}

	/// <summary>
	/// Invert palette colors.
	/// </summary>
	public static (byte R, byte G, byte B)[] InvertColors((byte R, byte G, byte B)[] palette) {
		return palette.Select(c => ((byte)(255 - c.R), (byte)(255 - c.G), (byte)(255 - c.B))).ToArray();
	}

	/// <summary>
	/// Create sepia-toned version of palette.
	/// </summary>
	public static (byte R, byte G, byte B)[] ApplySepia((byte R, byte G, byte B)[] palette) {
		return palette.Select(c => {
			int gray = (int)(c.R * 0.299 + c.G * 0.587 + c.B * 0.114);
			return (
				(byte)Math.Min(255, gray + 40),
				(byte)Math.Min(255, gray + 20),
				(byte)Math.Max(0, gray - 20)
			);
		}).ToArray();
	}

	/// <summary>
	/// Detect palette format from data characteristics.
	/// </summary>
	public static PaletteFormat DetectPaletteFormat(byte[] data, int offset, int suspectedColors) {
		if (data.Length - offset < 2) return PaletteFormat.Rgb24;

		// Check if values look like NES palette indices (0-63)
		bool allNesRange = true;
		for (int i = 0; i < Math.Min(suspectedColors, data.Length - offset); i++) {
			if (data[offset + i] > 0x3f) { allNesRange = false; break; }
		}
		if (allNesRange && suspectedColors <= 32) return PaletteFormat.Nes;

		// Check for 15-bit color patterns
		if (data.Length - offset >= suspectedColors * 2) {
			bool valid15Bit = true;
			for (int i = 0; i < suspectedColors && valid15Bit; i++) {
				ushort val = (ushort)(data[offset + i * 2] | (data[offset + i * 2 + 1] << 8));
				if ((val & 0x8000) != 0) valid15Bit = false;
			}
			if (valid15Bit) return PaletteFormat.Snes;
		}

		// Default to RGB24
		return PaletteFormat.Rgb24;
	}

	#endregion
}
