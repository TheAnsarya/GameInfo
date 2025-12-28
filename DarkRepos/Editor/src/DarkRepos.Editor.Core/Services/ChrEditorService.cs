using DarkRepos.Editor.Core.Interfaces;

namespace DarkRepos.Editor.Core.Services;

/// <summary>
/// Service for CHR/graphics tile editing operations.
/// </summary>
public class ChrEditorService : IChrEditorService
{
	#region Tile Decoding

	public Tile[] DecodeTiles(byte[] data, TileFormat format, int offset = 0, int count = -1)
	{
		var bytesPerTile = GetBytesPerTile(format);
		var maxTiles = (data.Length - offset) / bytesPerTile;

		if (count < 0 || count > maxTiles)
			count = maxTiles;

		var tiles = new Tile[count];
		for (var i = 0; i < count; i++)
		{
			tiles[i] = DecodeTile(data, format, offset + i * bytesPerTile);
		}

		return tiles;
	}

	public Tile GetTile(byte[] data, TileFormat format, int index)
	{
		var bytesPerTile = GetBytesPerTile(format);
		var offset = index * bytesPerTile;

		if (offset + bytesPerTile > data.Length)
			throw new ArgumentOutOfRangeException(nameof(index), "Tile index out of range");

		return DecodeTile(data, format, offset);
	}

	private Tile DecodeTile(byte[] data, TileFormat format, int offset)
	{
		return format switch
		{
			TileFormat.Nes or TileFormat.Bpp2Planar => DecodeNesTile(data, offset),
			TileFormat.GameBoy => DecodeGameBoyTile(data, offset),
			TileFormat.Snes4Bpp or TileFormat.Bpp4Planar => DecodeSnes4BppTile(data, offset),
			TileFormat.Genesis => DecodeGenesisTile(data, offset),
			TileFormat.Gba4Bpp or TileFormat.Bpp4Interleaved => DecodeGba4BppTile(data, offset),
			TileFormat.Gba8Bpp or TileFormat.Bpp8 => DecodeGba8BppTile(data, offset),
			TileFormat.Bpp1 => Decode1BppTile(data, offset),
			_ => throw new NotSupportedException($"Tile format {format} not supported")
		};
	}

	private static Tile DecodeNesTile(byte[] data, int offset)
	{
		// NES: 2bpp planar, 16 bytes per tile
		// First 8 bytes = low bit plane, next 8 bytes = high bit plane
		var tile = new Tile();

		for (var y = 0; y < 8; y++)
		{
			var low = data[offset + y];
			var high = data[offset + y + 8];

			for (var x = 0; x < 8; x++)
			{
				var bit = 7 - x;
				var pixel = ((low >> bit) & 1) | (((high >> bit) & 1) << 1);
				tile.SetPixel(x, y, (byte)pixel);
			}
		}

		return tile;
	}

	private static Tile DecodeGameBoyTile(byte[] data, int offset)
	{
		// Game Boy: 2bpp interleaved, 16 bytes per tile
		// Each row: low byte, high byte (2 bytes per row)
		var tile = new Tile();

		for (var y = 0; y < 8; y++)
		{
			var low = data[offset + y * 2];
			var high = data[offset + y * 2 + 1];

			for (var x = 0; x < 8; x++)
			{
				var bit = 7 - x;
				var pixel = ((low >> bit) & 1) | (((high >> bit) & 1) << 1);
				tile.SetPixel(x, y, (byte)pixel);
			}
		}

		return tile;
	}

	private static Tile DecodeSnes4BppTile(byte[] data, int offset)
	{
		// SNES 4bpp: 32 bytes per tile
		// Bitplanes 0,1 in first 16 bytes (like NES), bitplanes 2,3 in next 16 bytes
		var tile = new Tile();

		for (var y = 0; y < 8; y++)
		{
			var bp0 = data[offset + y];
			var bp1 = data[offset + y + 8];
			var bp2 = data[offset + y + 16];
			var bp3 = data[offset + y + 24];

			for (var x = 0; x < 8; x++)
			{
				var bit = 7 - x;
				var pixel = ((bp0 >> bit) & 1) |
							(((bp1 >> bit) & 1) << 1) |
							(((bp2 >> bit) & 1) << 2) |
							(((bp3 >> bit) & 1) << 3);
				tile.SetPixel(x, y, (byte)pixel);
			}
		}

		return tile;
	}

	private static Tile DecodeGenesisTile(byte[] data, int offset)
	{
		// Genesis: 4bpp packed, 32 bytes per tile
		// Each byte = 2 pixels (high nibble first)
		var tile = new Tile();

		for (var y = 0; y < 8; y++)
		{
			for (var x = 0; x < 8; x += 2)
			{
				var b = data[offset + y * 4 + x / 2];
				tile.SetPixel(x, y, (byte)((b >> 4) & 0x0f));
				tile.SetPixel(x + 1, y, (byte)(b & 0x0f));
			}
		}

		return tile;
	}

	private static Tile DecodeGba4BppTile(byte[] data, int offset)
	{
		// GBA 4bpp: 32 bytes per tile
		// Each byte = 2 pixels (low nibble first!)
		var tile = new Tile();

		for (var y = 0; y < 8; y++)
		{
			for (var x = 0; x < 8; x += 2)
			{
				var b = data[offset + y * 4 + x / 2];
				tile.SetPixel(x, y, (byte)(b & 0x0f));
				tile.SetPixel(x + 1, y, (byte)((b >> 4) & 0x0f));
			}
		}

		return tile;
	}

	private static Tile DecodeGba8BppTile(byte[] data, int offset)
	{
		// GBA 8bpp: 64 bytes per tile, 1 byte per pixel
		var tile = new Tile();

		for (var y = 0; y < 8; y++)
		{
			for (var x = 0; x < 8; x++)
			{
				tile.SetPixel(x, y, data[offset + y * 8 + x]);
			}
		}

		return tile;
	}

	private static Tile Decode1BppTile(byte[] data, int offset)
	{
		// 1bpp: 8 bytes per tile, 1 bit per pixel
		var tile = new Tile();

		for (var y = 0; y < 8; y++)
		{
			var row = data[offset + y];
			for (var x = 0; x < 8; x++)
			{
				var pixel = (row >> (7 - x)) & 1;
				tile.SetPixel(x, y, (byte)pixel);
			}
		}

		return tile;
	}

	#endregion

	#region Tile Encoding

	public byte[] EncodeTiles(Tile[] tiles, TileFormat format)
	{
		var bytesPerTile = GetBytesPerTile(format);
		var data = new byte[tiles.Length * bytesPerTile];

		for (var i = 0; i < tiles.Length; i++)
		{
			EncodeTile(tiles[i], data, format, i * bytesPerTile);
		}

		return data;
	}

	public void SetTile(byte[] data, TileFormat format, int index, Tile tile)
	{
		var bytesPerTile = GetBytesPerTile(format);
		var offset = index * bytesPerTile;

		if (offset + bytesPerTile > data.Length)
			throw new ArgumentOutOfRangeException(nameof(index), "Tile index out of range");

		EncodeTile(tile, data, format, offset);
	}

	private void EncodeTile(Tile tile, byte[] data, TileFormat format, int offset)
	{
		switch (format)
		{
			case TileFormat.Nes:
			case TileFormat.Bpp2Planar:
				EncodeNesTile(tile, data, offset);
				break;
			case TileFormat.GameBoy:
				EncodeGameBoyTile(tile, data, offset);
				break;
			case TileFormat.Snes4Bpp:
			case TileFormat.Bpp4Planar:
				EncodeSnes4BppTile(tile, data, offset);
				break;
			case TileFormat.Genesis:
				EncodeGenesisTile(tile, data, offset);
				break;
			case TileFormat.Gba4Bpp:
			case TileFormat.Bpp4Interleaved:
				EncodeGba4BppTile(tile, data, offset);
				break;
			case TileFormat.Gba8Bpp:
			case TileFormat.Bpp8:
				EncodeGba8BppTile(tile, data, offset);
				break;
			case TileFormat.Bpp1:
				Encode1BppTile(tile, data, offset);
				break;
			default:
				throw new NotSupportedException($"Tile format {format} not supported");
		}
	}

	private static void EncodeNesTile(Tile tile, byte[] data, int offset)
	{
		for (var y = 0; y < 8; y++)
		{
			byte low = 0, high = 0;

			for (var x = 0; x < 8; x++)
			{
				var pixel = tile.GetPixel(x, y);
				var bit = 7 - x;
				low |= (byte)((pixel & 1) << bit);
				high |= (byte)(((pixel >> 1) & 1) << bit);
			}

			data[offset + y] = low;
			data[offset + y + 8] = high;
		}
	}

	private static void EncodeGameBoyTile(Tile tile, byte[] data, int offset)
	{
		for (var y = 0; y < 8; y++)
		{
			byte low = 0, high = 0;

			for (var x = 0; x < 8; x++)
			{
				var pixel = tile.GetPixel(x, y);
				var bit = 7 - x;
				low |= (byte)((pixel & 1) << bit);
				high |= (byte)(((pixel >> 1) & 1) << bit);
			}

			data[offset + y * 2] = low;
			data[offset + y * 2 + 1] = high;
		}
	}

	private static void EncodeSnes4BppTile(Tile tile, byte[] data, int offset)
	{
		for (var y = 0; y < 8; y++)
		{
			byte bp0 = 0, bp1 = 0, bp2 = 0, bp3 = 0;

			for (var x = 0; x < 8; x++)
			{
				var pixel = tile.GetPixel(x, y);
				var bit = 7 - x;
				bp0 |= (byte)((pixel & 1) << bit);
				bp1 |= (byte)(((pixel >> 1) & 1) << bit);
				bp2 |= (byte)(((pixel >> 2) & 1) << bit);
				bp3 |= (byte)(((pixel >> 3) & 1) << bit);
			}

			data[offset + y] = bp0;
			data[offset + y + 8] = bp1;
			data[offset + y + 16] = bp2;
			data[offset + y + 24] = bp3;
		}
	}

	private static void EncodeGenesisTile(Tile tile, byte[] data, int offset)
	{
		for (var y = 0; y < 8; y++)
		{
			for (var x = 0; x < 8; x += 2)
			{
				var high = tile.GetPixel(x, y) & 0x0f;
				var low = tile.GetPixel(x + 1, y) & 0x0f;
				data[offset + y * 4 + x / 2] = (byte)((high << 4) | low);
			}
		}
	}

	private static void EncodeGba4BppTile(Tile tile, byte[] data, int offset)
	{
		for (var y = 0; y < 8; y++)
		{
			for (var x = 0; x < 8; x += 2)
			{
				var low = tile.GetPixel(x, y) & 0x0f;
				var high = tile.GetPixel(x + 1, y) & 0x0f;
				data[offset + y * 4 + x / 2] = (byte)(low | (high << 4));
			}
		}
	}

	private static void EncodeGba8BppTile(Tile tile, byte[] data, int offset)
	{
		for (var y = 0; y < 8; y++)
		{
			for (var x = 0; x < 8; x++)
			{
				data[offset + y * 8 + x] = tile.GetPixel(x, y);
			}
		}
	}

	private static void Encode1BppTile(Tile tile, byte[] data, int offset)
	{
		for (var y = 0; y < 8; y++)
		{
			byte row = 0;
			for (var x = 0; x < 8; x++)
			{
				row |= (byte)((tile.GetPixel(x, y) & 1) << (7 - x));
			}
			data[offset + y] = row;
		}
	}

	#endregion

	#region Palette Operations

	public Color[] ApplyPalette(Tile tile, Palette palette)
	{
		var colors = new Color[tile.Width * tile.Height];

		for (var i = 0; i < tile.Pixels.Length; i++)
		{
			var index = tile.Pixels[i];
			colors[i] = index < palette.Count ? palette[index] : Color.Black;
		}

		return colors;
	}

	public Palette GetDefaultPalette(TilePlatform platform)
	{
		return platform switch
		{
			TilePlatform.Nes => CreateNesPalette(),
			TilePlatform.GameBoy => CreateGameBoyPalette(),
			TilePlatform.GameBoyColor => CreateGrayscalePalette(2),
			TilePlatform.Snes => CreateGrayscalePalette(4),
			TilePlatform.GameBoyAdvance => CreateGrayscalePalette(4),
			TilePlatform.Genesis => CreateGrayscalePalette(4),
			_ => CreateGrayscalePalette(4)
		};
	}

	public Palette CreateGrayscalePalette(int bitsPerPixel)
	{
		var colorCount = 1 << bitsPerPixel;
		var colors = new Color[colorCount];

		for (var i = 0; i < colorCount; i++)
		{
			var intensity = (byte)(i * 255 / (colorCount - 1));
			colors[i] = new Color(intensity, intensity, intensity);
		}

		return new Palette(colors, $"Grayscale {bitsPerPixel}bpp");
	}

	private static Palette CreateNesPalette()
	{
		// Standard NES grayscale for default viewing
		return new Palette(
		[
			new Color(0, 0, 0),       // 0: Black
			new Color(85, 85, 85),    // 1: Dark gray
			new Color(170, 170, 170), // 2: Light gray
			new Color(255, 255, 255)  // 3: White
		], "NES Default");
	}

	private static Palette CreateGameBoyPalette()
	{
		// Classic Game Boy green palette
		return new Palette(
		[
			new Color(155, 188, 15),  // 0: Lightest
			new Color(139, 172, 15),  // 1: Light
			new Color(48, 98, 48),    // 2: Dark
			new Color(15, 56, 15)     // 3: Darkest
		], "Game Boy Classic");
	}

	#endregion

	#region Image Rendering

	public byte[] RenderToImage(Tile[] tiles, Palette palette, int tilesPerRow, int scale = 1)
	{
		if (tiles.Length == 0)
			return [];

		var tileWidth = tiles[0].Width * scale;
		var tileHeight = tiles[0].Height * scale;
		var rows = (tiles.Length + tilesPerRow - 1) / tilesPerRow;
		var width = tilesPerRow * tileWidth;
		var height = rows * tileHeight;

		// RGBA buffer
		var buffer = new byte[width * height * 4];

		for (var i = 0; i < tiles.Length; i++)
		{
			var tileX = (i % tilesPerRow) * tileWidth;
			var tileY = (i / tilesPerRow) * tileHeight;
			var tile = tiles[i];

			for (var y = 0; y < tile.Height; y++)
			{
				for (var x = 0; x < tile.Width; x++)
				{
					var colorIndex = tile.GetPixel(x, y);
					var color = colorIndex < palette.Count ? palette[colorIndex] : Color.Black;

					// Apply scaling
					for (var sy = 0; sy < scale; sy++)
					{
						for (var sx = 0; sx < scale; sx++)
						{
							var px = tileX + x * scale + sx;
							var py = tileY + y * scale + sy;
							var offset = (py * width + px) * 4;

							buffer[offset] = color.R;
							buffer[offset + 1] = color.G;
							buffer[offset + 2] = color.B;
							buffer[offset + 3] = color.A;
						}
					}
				}
			}
		}

		return buffer;
	}

	public byte[] ExportToPng(Tile[] tiles, Palette palette, int tilesPerRow, int scale = 1)
	{
		// Get RGBA buffer
		var rgba = RenderToImage(tiles, palette, tilesPerRow, scale);

		if (rgba.Length == 0)
			return [];

		var tileWidth = tiles[0].Width * scale;
		var tileHeight = tiles[0].Height * scale;
		var rows = (tiles.Length + tilesPerRow - 1) / tilesPerRow;
		var width = tilesPerRow * tileWidth;
		var height = rows * tileHeight;

		// Simple PNG encoder (uncompressed for simplicity)
		// For production, use a proper PNG library
		return EncodePng(rgba, width, height);
	}

	private static byte[] EncodePng(byte[] rgba, int width, int height)
	{
		// This is a simplified PNG encoder
		// For production use, integrate SkiaSharp or ImageSharp
		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// PNG signature
		writer.Write(new byte[] { 0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a });

		// IHDR chunk
		WriteChunk(writer, "IHDR", [
			.. BitConverter.GetBytes(System.Net.IPAddress.HostToNetworkOrder(width)),
			.. BitConverter.GetBytes(System.Net.IPAddress.HostToNetworkOrder(height)),
			8,  // Bit depth
			6,  // Color type (RGBA)
			0,  // Compression
			0,  // Filter
			0   // Interlace
		]);

		// IDAT chunk (uncompressed)
		var rawData = new List<byte>();
		for (var y = 0; y < height; y++)
		{
			rawData.Add(0); // Filter type: None
			for (var x = 0; x < width; x++)
			{
				var offset = (y * width + x) * 4;
				rawData.Add(rgba[offset]);     // R
				rawData.Add(rgba[offset + 1]); // G
				rawData.Add(rgba[offset + 2]); // B
				rawData.Add(rgba[offset + 3]); // A
			}
		}

		// Compress with deflate
		var compressed = Compress([.. rawData]);
		WriteChunk(writer, "IDAT", compressed);

		// IEND chunk
		WriteChunk(writer, "IEND", []);

		return ms.ToArray();
	}

	private static void WriteChunk(BinaryWriter writer, string type, byte[] data)
	{
		writer.Write(System.Net.IPAddress.HostToNetworkOrder(data.Length));
		var typeBytes = System.Text.Encoding.ASCII.GetBytes(type);
		writer.Write(typeBytes);
		writer.Write(data);

		// CRC32
		var crcData = new byte[4 + data.Length];
		Array.Copy(typeBytes, crcData, 4);
		Array.Copy(data, 0, crcData, 4, data.Length);
		var crc = CalculateCrc32(crcData);
		writer.Write(System.Net.IPAddress.HostToNetworkOrder((int)crc));
	}

	private static byte[] Compress(byte[] data)
	{
		using var output = new MemoryStream();
		using (var deflate = new System.IO.Compression.DeflateStream(output, System.IO.Compression.CompressionLevel.Optimal))
		{
			deflate.Write(data, 0, data.Length);
		}

		// Add zlib header and checksum
		var compressed = output.ToArray();
		var result = new byte[compressed.Length + 6];
		result[0] = 0x78; // zlib header
		result[1] = 0x9c; // default compression
		Array.Copy(compressed, 0, result, 2, compressed.Length);

		// Adler32 checksum
		var adler = CalculateAdler32(data);
		result[^4] = (byte)(adler >> 24);
		result[^3] = (byte)(adler >> 16);
		result[^2] = (byte)(adler >> 8);
		result[^1] = (byte)adler;

		return result;
	}

	private static uint CalculateCrc32(byte[] data)
	{
		uint crc = 0xffffffff;
		foreach (var b in data)
		{
			crc ^= b;
			for (var i = 0; i < 8; i++)
			{
				crc = (crc & 1) != 0 ? (crc >> 1) ^ 0xedb88320 : crc >> 1;
			}
		}
		return crc ^ 0xffffffff;
	}

	private static uint CalculateAdler32(byte[] data)
	{
		uint a = 1, b = 0;
		foreach (var d in data)
		{
			a = (a + d) % 65521;
			b = (b + a) % 65521;
		}
		return (b << 16) | a;
	}

	public Tile[] ImportFromImage(byte[] imageData, int width, int height, TileFormat format, Palette palette)
	{
		// Assumes RGBA input, converts to tiles
		var tilesX = width / 8;
		var tilesY = height / 8;
		var tiles = new Tile[tilesX * tilesY];

		for (var ty = 0; ty < tilesY; ty++)
		{
			for (var tx = 0; tx < tilesX; tx++)
			{
				var tile = new Tile();

				for (var y = 0; y < 8; y++)
				{
					for (var x = 0; x < 8; x++)
					{
						var px = tx * 8 + x;
						var py = ty * 8 + y;
						var offset = (py * width + px) * 4;

						var color = new Color(
							imageData[offset],
							imageData[offset + 1],
							imageData[offset + 2],
							imageData[offset + 3]);

						// Find closest palette color
						var paletteIndex = FindClosestColor(color, palette);
						tile.SetPixel(x, y, (byte)paletteIndex);
					}
				}

				tiles[ty * tilesX + tx] = tile;
			}
		}

		return tiles;
	}

	private static int FindClosestColor(Color color, Palette palette)
	{
		var bestIndex = 0;
		var bestDistance = int.MaxValue;

		for (var i = 0; i < palette.Count; i++)
		{
			var p = palette[i];
			var dr = color.R - p.R;
			var dg = color.G - p.G;
			var db = color.B - p.B;
			var distance = dr * dr + dg * dg + db * db;

			if (distance < bestDistance)
			{
				bestDistance = distance;
				bestIndex = i;
			}
		}

		return bestIndex;
	}

	#endregion

	#region Utility

	public int GetBytesPerTile(TileFormat format)
	{
		return format switch
		{
			TileFormat.Bpp1 => 8,
			TileFormat.Bpp2Planar or TileFormat.Bpp2Interleaved or TileFormat.Nes or TileFormat.GameBoy => 16,
			TileFormat.Bpp3Planar => 24,
			TileFormat.Bpp4Planar or TileFormat.Bpp4Interleaved or TileFormat.Snes4Bpp or TileFormat.Gba4Bpp or TileFormat.Genesis => 32,
			TileFormat.Bpp8 or TileFormat.Gba8Bpp => 64,
			_ => throw new NotSupportedException($"Unknown tile format: {format}")
		};
	}

	#endregion
}
