namespace GameInfoTools.Graphics;

/// <summary>
/// Tile encoding/decoding utilities for various formats.
/// Provides convenient static methods for tile conversions.
/// </summary>
public static class TileCodec {
	/// <summary>
	/// Size of one 8x8 NES 2bpp tile in bytes.
	/// </summary>
	public const int Nes2BppTileSize = 16;

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
			byte plane1 = data[row * 2 + 1];
			byte plane2 = data[16 + row * 2];
			byte plane3 = data[16 + row * 2 + 1];

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
			data[row * 2 + 1] = plane1;
			data[16 + row * 2] = plane2;
			data[16 + row * 2 + 1] = plane3;
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
				flipped[row * 8 + col] = pixels[row * 8 + (7 - col)];
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
				flipped[row * 8 + col] = pixels[(7 - row) * 8 + col];
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
				rotated[col * 8 + (7 - row)] = pixels[row * 8 + col];
			}
		}

		return rotated;
	}
}
