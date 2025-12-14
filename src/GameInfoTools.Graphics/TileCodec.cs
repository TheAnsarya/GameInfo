namespace GameInfoTools.Graphics;

/// <summary>
/// Supported tile formats for encoding and decoding.
/// </summary>
public enum TileFormat {
	/// <summary>NES 2bpp planar format (16 bytes per 8x8 tile).</summary>
	Nes2Bpp,
	/// <summary>SNES 4bpp planar format (32 bytes per 8x8 tile).</summary>
	Snes4Bpp,
	/// <summary>SNES 8bpp planar format (64 bytes per 8x8 tile).</summary>
	Snes8Bpp,
	/// <summary>SNES Mode 7 linear format (64 bytes per 8x8 tile).</summary>
	SnesMode7,
	/// <summary>Game Boy 2bpp format (same as NES 2bpp, 16 bytes per 8x8 tile).</summary>
	GameBoy2Bpp,
	/// <summary>Sega Genesis/Mega Drive 4bpp linear format (32 bytes per 8x8 tile).</summary>
	Genesis4Bpp,
	/// <summary>GBA 4bpp linear format (32 bytes per 8x8 tile).</summary>
	Gba4Bpp,
	/// <summary>GBA 8bpp linear format (64 bytes per 8x8 tile).</summary>
	Gba8Bpp,
	/// <summary>Linear 1bpp format (8 bytes per 8x8 tile).</summary>
	Linear1Bpp,
	/// <summary>Linear 2bpp format (16 bytes per 8x8 tile).</summary>
	Linear2Bpp,
	/// <summary>Linear 4bpp format (32 bytes per 8x8 tile).</summary>
	Linear4Bpp,
	/// <summary>Linear 8bpp format (64 bytes per 8x8 tile).</summary>
	Linear8Bpp
}

/// <summary>
/// Tile encoding/decoding utilities for various formats.
/// Provides convenient static methods for tile conversions.
/// </summary>
public static class TileCodec {
	/// <summary>
	/// Size of one 8x8 NES 2bpp tile in bytes.
	/// </summary>
	public const int Nes2BppTileSize = 16;

	/// <summary>Size of one 8x8 tile at 4bpp (32 bytes).</summary>
	public const int Tile4BppSize = 32;

	/// <summary>Size of one 8x8 tile at 8bpp (64 bytes).</summary>
	public const int Tile8BppSize = 64;

	/// <summary>Size of one 8x8 Genesis 4bpp tile (32 bytes).</summary>
	public const int Genesis4BppTileSize = 32;

	/// <summary>Size of one 8x8 Mode 7 tile (64 bytes).</summary>
	public const int Mode7TileSize = 64;

	/// <summary>
	/// Decode an 8x8 NES 2bpp tile to pixel indices (0-3).
	/// </summary>
	/// <param name="data">Tile data (16 bytes).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeNes2bpp(byte[] data) {
		if (data.Length < Nes2BppTileSize) {
			throw new ArgumentException($"Data must be at least {Nes2BppTileSize} bytes", nameof(data));
		}

		var pixels = new byte[64];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			byte plane0 = data[row];
			byte plane1 = data[row + 8];

			for (int col = 7; col >= 0; col--) {
				int bit0 = (plane0 >> col) & 1;
				int bit1 = (plane1 >> col) & 1;
				pixels[pixelIndex++] = (byte)((bit1 << 1) | bit0);
			}
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to NES 2bpp tile format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-3, row-major order).</param>
	/// <returns>Encoded tile data (16 bytes).</returns>
	public static byte[] EncodeNes2bpp(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[Nes2BppTileSize];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			byte plane0 = 0;
			byte plane1 = 0;

			for (int col = 7; col >= 0; col--) {
				int pixel = pixels[pixelIndex++] & 3;
				if ((pixel & 1) != 0) plane0 |= (byte)(1 << col);
				if ((pixel & 2) != 0) plane1 |= (byte)(1 << col);
			}

			data[row] = plane0;
			data[row + 8] = plane1;
		}

		return data;
	}

	/// <summary>
	/// Decode an 8x8 SNES 4bpp tile to pixel indices (0-15).
	/// </summary>
	/// <param name="data">Tile data (32 bytes).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeSnes4bpp(byte[] data) {
		if (data.Length < 32) {
			throw new ArgumentException("Data must be at least 32 bytes", nameof(data));
		}

		var pixels = new byte[64];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			byte plane0 = data[row * 2];
			byte plane1 = data[(row * 2) + 1];
			byte plane2 = data[16 + (row * 2)];
			byte plane3 = data[16 + (row * 2) + 1];

			for (int col = 7; col >= 0; col--) {
				int bit0 = (plane0 >> col) & 1;
				int bit1 = (plane1 >> col) & 1;
				int bit2 = (plane2 >> col) & 1;
				int bit3 = (plane3 >> col) & 1;
				pixels[pixelIndex++] = (byte)((bit3 << 3) | (bit2 << 2) | (bit1 << 1) | bit0);
			}
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to SNES 4bpp tile format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-15, row-major order).</param>
	/// <returns>Encoded tile data (32 bytes).</returns>
	public static byte[] EncodeSnes4bpp(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[32];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			byte plane0 = 0, plane1 = 0, plane2 = 0, plane3 = 0;

			for (int col = 7; col >= 0; col--) {
				int pixel = pixels[pixelIndex++] & 15;
				if ((pixel & 1) != 0) plane0 |= (byte)(1 << col);
				if ((pixel & 2) != 0) plane1 |= (byte)(1 << col);
				if ((pixel & 4) != 0) plane2 |= (byte)(1 << col);
				if ((pixel & 8) != 0) plane3 |= (byte)(1 << col);
			}

			data[row * 2] = plane0;
			data[(row * 2) + 1] = plane1;
			data[16 + (row * 2)] = plane2;
			data[16 + (row * 2) + 1] = plane3;
		}

		return data;
	}

	/// <summary>
	/// Flip tile pixels horizontally.
	/// </summary>
	/// <param name="pixels">64 pixel indices (row-major, 8x8).</param>
	/// <returns>Horizontally flipped pixels.</returns>
	public static byte[] FlipHorizontal(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var flipped = new byte[64];
		for (int row = 0; row < 8; row++) {
			for (int col = 0; col < 8; col++) {
				flipped[(row * 8) + col] = pixels[(row * 8) + (7 - col)];
			}
		}

		return flipped;
	}

	/// <summary>
	/// Flip tile pixels vertically.
	/// </summary>
	/// <param name="pixels">64 pixel indices (row-major, 8x8).</param>
	/// <returns>Vertically flipped pixels.</returns>
	public static byte[] FlipVertical(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var flipped = new byte[64];
		for (int row = 0; row < 8; row++) {
			for (int col = 0; col < 8; col++) {
				flipped[(row * 8) + col] = pixels[((7 - row) * 8) + col];
			}
		}

		return flipped;
	}

	/// <summary>
	/// Rotate tile 90 degrees clockwise.
	/// </summary>
	/// <param name="pixels">64 pixel indices (row-major, 8x8).</param>
	/// <returns>Rotated pixels.</returns>
	public static byte[] RotateClockwise(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var rotated = new byte[64];
		for (int row = 0; row < 8; row++) {
			for (int col = 0; col < 8; col++) {
				rotated[(col * 8) + (7 - row)] = pixels[(row * 8) + col];
			}
		}

		return rotated;
	}

	#region SNES Mode 7

	/// <summary>
	/// Decode an 8x8 SNES Mode 7 tile (linear 8bpp) to pixel indices (0-255).
	/// Mode 7 uses a simple linear 1 byte per pixel format.
	/// </summary>
	/// <param name="data">Tile data (64 bytes).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeMode7(byte[] data) {
		if (data.Length < Mode7TileSize) {
			throw new ArgumentException($"Data must be at least {Mode7TileSize} bytes", nameof(data));
		}

		var pixels = new byte[64];
		Array.Copy(data, 0, pixels, 0, 64);
		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to SNES Mode 7 tile format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-255, row-major order).</param>
	/// <returns>Encoded tile data (64 bytes).</returns>
	public static byte[] EncodeMode7(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[Mode7TileSize];
		Array.Copy(pixels, 0, data, 0, 64);
		return data;
	}

	#endregion

	#region SNES 8bpp

	/// <summary>
	/// Decode an 8x8 SNES 8bpp tile to pixel indices (0-255).
	/// SNES 8bpp uses 4 interleaved bitplanes (similar to 4bpp but doubled).
	/// </summary>
	/// <param name="data">Tile data (64 bytes).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeSnes8bpp(byte[] data) {
		if (data.Length < Tile8BppSize) {
			throw new ArgumentException($"Data must be at least {Tile8BppSize} bytes", nameof(data));
		}

		var pixels = new byte[64];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			// First 4 bitplanes (offset 0-31)
			byte plane0 = data[row * 2];
			byte plane1 = data[(row * 2) + 1];
			byte plane2 = data[16 + (row * 2)];
			byte plane3 = data[16 + (row * 2) + 1];
			// Second 4 bitplanes (offset 32-63)
			byte plane4 = data[32 + (row * 2)];
			byte plane5 = data[32 + (row * 2) + 1];
			byte plane6 = data[48 + (row * 2)];
			byte plane7 = data[48 + (row * 2) + 1];

			for (int col = 7; col >= 0; col--) {
				int bit0 = (plane0 >> col) & 1;
				int bit1 = (plane1 >> col) & 1;
				int bit2 = (plane2 >> col) & 1;
				int bit3 = (plane3 >> col) & 1;
				int bit4 = (plane4 >> col) & 1;
				int bit5 = (plane5 >> col) & 1;
				int bit6 = (plane6 >> col) & 1;
				int bit7 = (plane7 >> col) & 1;
				pixels[pixelIndex++] = (byte)(
					(bit7 << 7) | (bit6 << 6) | (bit5 << 5) | (bit4 << 4) |
					(bit3 << 3) | (bit2 << 2) | (bit1 << 1) | bit0
				);
			}
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to SNES 8bpp tile format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-255, row-major order).</param>
	/// <returns>Encoded tile data (64 bytes).</returns>
	public static byte[] EncodeSnes8bpp(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[Tile8BppSize];
		int pixelIndex = 0;

		for (int row = 0; row < 8; row++) {
			byte plane0 = 0, plane1 = 0, plane2 = 0, plane3 = 0;
			byte plane4 = 0, plane5 = 0, plane6 = 0, plane7 = 0;

			for (int col = 7; col >= 0; col--) {
				int pixel = pixels[pixelIndex++];
				if ((pixel & 0x01) != 0) plane0 |= (byte)(1 << col);
				if ((pixel & 0x02) != 0) plane1 |= (byte)(1 << col);
				if ((pixel & 0x04) != 0) plane2 |= (byte)(1 << col);
				if ((pixel & 0x08) != 0) plane3 |= (byte)(1 << col);
				if ((pixel & 0x10) != 0) plane4 |= (byte)(1 << col);
				if ((pixel & 0x20) != 0) plane5 |= (byte)(1 << col);
				if ((pixel & 0x40) != 0) plane6 |= (byte)(1 << col);
				if ((pixel & 0x80) != 0) plane7 |= (byte)(1 << col);
			}

			data[row * 2] = plane0;
			data[(row * 2) + 1] = plane1;
			data[16 + (row * 2)] = plane2;
			data[16 + (row * 2) + 1] = plane3;
			data[32 + (row * 2)] = plane4;
			data[32 + (row * 2) + 1] = plane5;
			data[48 + (row * 2)] = plane6;
			data[48 + (row * 2) + 1] = plane7;
		}

		return data;
	}

	#endregion

	#region Genesis/Mega Drive

	/// <summary>
	/// Decode an 8x8 Sega Genesis/Mega Drive 4bpp tile to pixel indices (0-15).
	/// Genesis uses linear 4bpp format with 2 pixels per byte.
	/// </summary>
	/// <param name="data">Tile data (32 bytes).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeGenesis4bpp(byte[] data) {
		if (data.Length < Genesis4BppTileSize) {
			throw new ArgumentException($"Data must be at least {Genesis4BppTileSize} bytes", nameof(data));
		}

		var pixels = new byte[64];

		for (int i = 0; i < 32; i++) {
			// Genesis stores 2 pixels per byte, high nibble first
			pixels[i * 2] = (byte)((data[i] >> 4) & 0x0f);
			pixels[(i * 2) + 1] = (byte)(data[i] & 0x0f);
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to Genesis/Mega Drive 4bpp tile format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-15, row-major order).</param>
	/// <returns>Encoded tile data (32 bytes).</returns>
	public static byte[] EncodeGenesis4bpp(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[Genesis4BppTileSize];

		for (int i = 0; i < 32; i++) {
			data[i] = (byte)(((pixels[i * 2] & 0x0f) << 4) | (pixels[(i * 2) + 1] & 0x0f));
		}

		return data;
	}

	#endregion

	#region GBA Formats

	/// <summary>
	/// Decode an 8x8 GBA 4bpp tile (linear) to pixel indices (0-15).
	/// GBA uses linear 4bpp format with 2 pixels per byte, low nibble first.
	/// </summary>
	/// <param name="data">Tile data (32 bytes).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeGba4bpp(byte[] data) {
		if (data.Length < Tile4BppSize) {
			throw new ArgumentException($"Data must be at least {Tile4BppSize} bytes", nameof(data));
		}

		var pixels = new byte[64];

		for (int i = 0; i < 32; i++) {
			// GBA stores 2 pixels per byte, LOW nibble first (opposite of Genesis)
			pixels[i * 2] = (byte)(data[i] & 0x0f);
			pixels[(i * 2) + 1] = (byte)((data[i] >> 4) & 0x0f);
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to GBA 4bpp tile format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-15, row-major order).</param>
	/// <returns>Encoded tile data (32 bytes).</returns>
	public static byte[] EncodeGba4bpp(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[Tile4BppSize];

		for (int i = 0; i < 32; i++) {
			// Low nibble first
			data[i] = (byte)((pixels[i * 2] & 0x0f) | ((pixels[(i * 2) + 1] & 0x0f) << 4));
		}

		return data;
	}

	/// <summary>
	/// Decode an 8x8 GBA 8bpp tile (linear) to pixel indices (0-255).
	/// GBA 8bpp uses simple linear 1 byte per pixel format.
	/// </summary>
	/// <param name="data">Tile data (64 bytes).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeGba8bpp(byte[] data) {
		if (data.Length < Tile8BppSize) {
			throw new ArgumentException($"Data must be at least {Tile8BppSize} bytes", nameof(data));
		}

		var pixels = new byte[64];
		Array.Copy(data, 0, pixels, 0, 64);
		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to GBA 8bpp tile format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-255, row-major order).</param>
	/// <returns>Encoded tile data (64 bytes).</returns>
	public static byte[] EncodeGba8bpp(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[Tile8BppSize];
		Array.Copy(pixels, 0, data, 0, 64);
		return data;
	}

	#endregion

	#region Linear Formats

	/// <summary>
	/// Decode 1bpp linear data to pixel indices (0-1).
	/// </summary>
	/// <param name="data">Tile data (8 bytes for 8x8).</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] DecodeLinear1bpp(byte[] data) {
		if (data.Length < 8) {
			throw new ArgumentException("Data must be at least 8 bytes", nameof(data));
		}

		var pixels = new byte[64];
		int pixelIndex = 0;

		for (int i = 0; i < 8; i++) {
			for (int col = 7; col >= 0; col--) {
				pixels[pixelIndex++] = (byte)((data[i] >> col) & 1);
			}
		}

		return pixels;
	}

	/// <summary>
	/// Encode pixel indices to 1bpp linear format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (0-1, row-major order).</param>
	/// <returns>Encoded tile data (8 bytes).</returns>
	public static byte[] EncodeLinear1bpp(byte[] pixels) {
		if (pixels.Length < 64) {
			throw new ArgumentException("Pixels array must have at least 64 elements", nameof(pixels));
		}

		var data = new byte[8];
		int pixelIndex = 0;

		for (int i = 0; i < 8; i++) {
			byte b = 0;
			for (int col = 7; col >= 0; col--) {
				if ((pixels[pixelIndex++] & 1) != 0) {
					b |= (byte)(1 << col);
				}
			}

			data[i] = b;
		}

		return data;
	}

	#endregion

	#region Generic Decode/Encode

	/// <summary>
	/// Decode a tile using the specified format.
	/// </summary>
	/// <param name="data">Tile data.</param>
	/// <param name="format">Tile format to use.</param>
	/// <returns>Array of 64 pixel indices (row-major order).</returns>
	public static byte[] Decode(byte[] data, TileFormat format) {
		return format switch {
			TileFormat.Nes2Bpp or TileFormat.GameBoy2Bpp => DecodeNes2bpp(data),
			TileFormat.Snes4Bpp => DecodeSnes4bpp(data),
			TileFormat.Snes8Bpp => DecodeSnes8bpp(data),
			TileFormat.SnesMode7 => DecodeMode7(data),
			TileFormat.Genesis4Bpp => DecodeGenesis4bpp(data),
			TileFormat.Gba4Bpp => DecodeGba4bpp(data),
			TileFormat.Gba8Bpp => DecodeGba8bpp(data),
			TileFormat.Linear1Bpp => DecodeLinear1bpp(data),
			TileFormat.Linear2Bpp => DecodeNes2bpp(data),  // Same as NES 2bpp
			TileFormat.Linear4Bpp => DecodeGba4bpp(data),   // GBA-style linear
			TileFormat.Linear8Bpp => DecodeGba8bpp(data),   // Linear 8bpp
			_ => throw new ArgumentException($"Unknown tile format: {format}", nameof(format))
		};
	}

	/// <summary>
	/// Encode pixel indices using the specified format.
	/// </summary>
	/// <param name="pixels">64 pixel indices (row-major order).</param>
	/// <param name="format">Tile format to use.</param>
	/// <returns>Encoded tile data.</returns>
	public static byte[] Encode(byte[] pixels, TileFormat format) {
		return format switch {
			TileFormat.Nes2Bpp or TileFormat.GameBoy2Bpp => EncodeNes2bpp(pixels),
			TileFormat.Snes4Bpp => EncodeSnes4bpp(pixels),
			TileFormat.Snes8Bpp => EncodeSnes8bpp(pixels),
			TileFormat.SnesMode7 => EncodeMode7(pixels),
			TileFormat.Genesis4Bpp => EncodeGenesis4bpp(pixels),
			TileFormat.Gba4Bpp => EncodeGba4bpp(pixels),
			TileFormat.Gba8Bpp => EncodeGba8bpp(pixels),
			TileFormat.Linear1Bpp => EncodeLinear1bpp(pixels),
			TileFormat.Linear2Bpp => EncodeNes2bpp(pixels),
			TileFormat.Linear4Bpp => EncodeGba4bpp(pixels),
			TileFormat.Linear8Bpp => EncodeGba8bpp(pixels),
			_ => throw new ArgumentException($"Unknown tile format: {format}", nameof(format))
		};
	}

	/// <summary>
	/// Get the size in bytes for a single 8x8 tile in the specified format.
	/// </summary>
	/// <param name="format">Tile format.</param>
	/// <returns>Size in bytes.</returns>
	public static int GetTileSize(TileFormat format) {
		return format switch {
			TileFormat.Linear1Bpp => 8,
			TileFormat.Nes2Bpp or TileFormat.GameBoy2Bpp or TileFormat.Linear2Bpp => 16,
			TileFormat.Snes4Bpp or TileFormat.Genesis4Bpp or TileFormat.Gba4Bpp or TileFormat.Linear4Bpp => 32,
			TileFormat.Snes8Bpp or TileFormat.SnesMode7 or TileFormat.Gba8Bpp or TileFormat.Linear8Bpp => 64,
			_ => throw new ArgumentException($"Unknown tile format: {format}", nameof(format))
		};
	}

	/// <summary>
	/// Get the bits per pixel for the specified format.
	/// </summary>
	/// <param name="format">Tile format.</param>
	/// <returns>Bits per pixel.</returns>
	public static int GetBitsPerPixel(TileFormat format) {
		return format switch {
			TileFormat.Linear1Bpp => 1,
			TileFormat.Nes2Bpp or TileFormat.GameBoy2Bpp or TileFormat.Linear2Bpp => 2,
			TileFormat.Snes4Bpp or TileFormat.Genesis4Bpp or TileFormat.Gba4Bpp or TileFormat.Linear4Bpp => 4,
			TileFormat.Snes8Bpp or TileFormat.SnesMode7 or TileFormat.Gba8Bpp or TileFormat.Linear8Bpp => 8,
			_ => throw new ArgumentException($"Unknown tile format: {format}", nameof(format))
		};
	}

	/// <summary>
	/// Get the maximum palette index for the specified format.
	/// </summary>
	/// <param name="format">Tile format.</param>
	/// <returns>Maximum palette index (e.g., 3 for 2bpp, 15 for 4bpp, 255 for 8bpp).</returns>
	public static int GetMaxPaletteIndex(TileFormat format) {
		return (1 << GetBitsPerPixel(format)) - 1;
	}

	#endregion

	#region Batch Operations

	/// <summary>
	/// Decode multiple tiles from raw data.
	/// </summary>
	/// <param name="data">Raw tile data.</param>
	/// <param name="format">Tile format.</param>
	/// <param name="count">Number of tiles to decode (-1 for all possible).</param>
	/// <returns>Array of decoded tiles (each is 64 pixel indices).</returns>
	public static byte[][] DecodeTiles(byte[] data, TileFormat format, int count = -1) {
		int tileSize = GetTileSize(format);
		int maxTiles = data.Length / tileSize;

		if (count < 0 || count > maxTiles) {
			count = maxTiles;
		}

		var tiles = new byte[count][];
		for (int i = 0; i < count; i++) {
			var tileData = new byte[tileSize];
			Array.Copy(data, i * tileSize, tileData, 0, tileSize);
			tiles[i] = Decode(tileData, format);
		}

		return tiles;
	}

	/// <summary>
	/// Encode multiple tiles to raw data.
	/// </summary>
	/// <param name="tiles">Array of tiles (each is 64 pixel indices).</param>
	/// <param name="format">Tile format.</param>
	/// <returns>Encoded tile data.</returns>
	public static byte[] EncodeTiles(byte[][] tiles, TileFormat format) {
		int tileSize = GetTileSize(format);
		var data = new byte[tiles.Length * tileSize];

		for (int i = 0; i < tiles.Length; i++) {
			var encoded = Encode(tiles[i], format);
			Array.Copy(encoded, 0, data, i * tileSize, tileSize);
		}

		return data;
	}

	/// <summary>
	/// Convert tiles between formats.
	/// </summary>
	/// <param name="data">Source tile data.</param>
	/// <param name="sourceFormat">Source format.</param>
	/// <param name="targetFormat">Target format.</param>
	/// <returns>Converted tile data.</returns>
	public static byte[] ConvertFormat(byte[] data, TileFormat sourceFormat, TileFormat targetFormat) {
		var tiles = DecodeTiles(data, sourceFormat);
		return EncodeTiles(tiles, targetFormat);
	}

	#endregion
}

