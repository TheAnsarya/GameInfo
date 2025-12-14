using System.Text.Json;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Interface for converting editable assets back to binary format
/// </summary>
public interface IAssetConverter
{
	/// <summary>
	/// Convert editable asset to binary format
	/// </summary>
	Task<AssetConversionResult> ConvertAsync(
		string inputPath,
		string outputPath,
		Platform platform,
		Dictionary<string, object>? options = null,
		CancellationToken cancellationToken = default);
}

/// <summary>
/// Result of asset conversion
/// </summary>
public class AssetConversionResult
{
	public bool Success { get; set; }
	public string? OutputPath { get; set; }
	public string? Error { get; set; }
	public int BytesGenerated { get; set; }
}

/// <summary>
/// Factory for creating asset converters
/// </summary>
public static class AssetConverterFactory
{
	/// <summary>
	/// Get the appropriate converter based on file extension
	/// </summary>
	public static IAssetConverter GetConverter(string inputPath)
	{
		var ext = Path.GetExtension(inputPath).ToLowerInvariant();
		return ext switch
		{
			".png" => new PngToTilesConverter(),
			".json" => new JsonToAssetConverter(),
			".pal" => new PalToAssetConverter(),
			_ => new RawAssetConverter()
		};
	}
}

/// <summary>
/// Converts PNG images to tile data
/// </summary>
public class PngToTilesConverter : IAssetConverter
{
	public async Task<AssetConversionResult> ConvertAsync(
		string inputPath,
		string outputPath,
		Platform platform,
		Dictionary<string, object>? options = null,
		CancellationToken cancellationToken = default)
	{
		var result = new AssetConversionResult();

		try
		{
			if (!File.Exists(inputPath))
			{
				result.Error = $"Input file not found: {inputPath}";
				return result;
			}

			// Read PNG file
			var pngData = await File.ReadAllBytesAsync(inputPath, cancellationToken);
			var (pixels, width, height) = DecodePng(pngData);

			if (pixels == null)
			{
				result.Error = "Failed to decode PNG file";
				return result;
			}

			// Get tile format
			var tileFormat = GetTileFormat(platform, options);
			var bytesPerTile = TileGraphics.GetBytesPerTile(tileFormat);
			var colorsPerTile = TileGraphics.GetColorsPerTile(tileFormat);

			// Calculate tile count (assuming 8x8 tiles, 16 tiles per row)
			var tilesX = width / 8;
			var tilesY = height / 8;
			var tileCount = tilesX * tilesY;

			// Build palette from image colors if needed
			var palette = BuildPalette(pixels, width, height, colorsPerTile);

			// Convert pixels to tile data
			var tileData = new byte[tileCount * bytesPerTile];

			for (int ty = 0; ty < tilesY; ty++)
			{
				for (int tx = 0; tx < tilesX; tx++)
				{
					cancellationToken.ThrowIfCancellationRequested();

					var tileIndex = ty * tilesX + tx;
					var tile = new byte[8, 8];

					// Extract tile pixels and map to palette indices
					for (int y = 0; y < 8; y++)
					{
						for (int x = 0; x < 8; x++)
						{
							var pixelX = tx * 8 + x;
							var pixelY = ty * 8 + y;
							var pixelOffset = (pixelY * width + pixelX) * 4;

							var r = pixels[pixelOffset];
							var g = pixels[pixelOffset + 1];
							var b = pixels[pixelOffset + 2];
							var a = pixels[pixelOffset + 3];

							// Map to palette index
							tile[y, x] = (byte)FindClosestPaletteIndex(r, g, b, a, palette);
						}
					}

					// Encode tile
					var encodedTile = TileGraphics.EncodeTile(tile, tileFormat);
					Array.Copy(encodedTile, 0, tileData, tileIndex * bytesPerTile, bytesPerTile);
				}
			}

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir))
			{
				Directory.CreateDirectory(outputDir);
			}

			await File.WriteAllBytesAsync(outputPath, tileData, cancellationToken);

			result.Success = true;
			result.OutputPath = outputPath;
			result.BytesGenerated = tileData.Length;
		}
		catch (Exception ex)
		{
			result.Error = ex.Message;
		}

		return result;
	}

	private static TileGraphics.TileFormat GetTileFormat(Platform platform, Dictionary<string, object>? options)
	{
		if (options?.TryGetValue("bpp", out var bppObj) == true)
		{
			var bpp = Convert.ToInt32(bppObj);
			return (platform, bpp) switch
			{
				(Platform.Nes, 2) => TileGraphics.TileFormat.Nes2Bpp,
				(Platform.Snes, 2) => TileGraphics.TileFormat.Snes2Bpp,
				(Platform.Snes, 4) => TileGraphics.TileFormat.Snes4Bpp,
				(Platform.Snes, 8) => TileGraphics.TileFormat.Snes8Bpp,
				(Platform.Gb or Platform.Gbc, 2) => TileGraphics.TileFormat.Gb2Bpp,
				(Platform.Gba, 4) => TileGraphics.TileFormat.Gba4Bpp,
				(Platform.Gba, 8) => TileGraphics.TileFormat.Gba8Bpp,
				(Platform.Genesis, 4) => TileGraphics.TileFormat.Linear4Bpp,
				_ => TileGraphics.TileFormat.Nes2Bpp
			};
		}

		return platform switch
		{
			Platform.Nes => TileGraphics.TileFormat.Nes2Bpp,
			Platform.Snes => TileGraphics.TileFormat.Snes4Bpp,
			Platform.Genesis => TileGraphics.TileFormat.Linear4Bpp,
			Platform.Gb or Platform.Gbc => TileGraphics.TileFormat.Gb2Bpp,
			Platform.Gba => TileGraphics.TileFormat.Gba4Bpp,
			_ => TileGraphics.TileFormat.Nes2Bpp
		};
	}

	private static (byte R, byte G, byte B)[] BuildPalette(byte[] pixels, int width, int height, int maxColors)
	{
		// Collect unique colors (respecting order they appear)
		var colors = new List<(byte R, byte G, byte B)>();
		var seen = new HashSet<int>();

		for (int i = 0; i < pixels.Length; i += 4)
		{
			var r = pixels[i];
			var g = pixels[i + 1];
			var b = pixels[i + 2];
			var a = pixels[i + 3];

			// Treat transparent as color 0
			if (a < 128)
			{
				if (!seen.Contains(0))
				{
					seen.Add(0);
					colors.Insert(0, (0, 0, 0));
				}
				continue;
			}

			var hash = (r << 16) | (g << 8) | b;
			if (!seen.Contains(hash))
			{
				seen.Add(hash);
				colors.Add((r, g, b));
			}

			if (colors.Count >= maxColors)
				break;
		}

		// Pad with grayscale if needed
		while (colors.Count < maxColors)
		{
			var shade = (byte)(255 * colors.Count / maxColors);
			colors.Add((shade, shade, shade));
		}

		return [.. colors];
	}

	private static int FindClosestPaletteIndex(byte r, byte g, byte b, byte a, (byte R, byte G, byte B)[] palette)
	{
		// Transparent pixels map to index 0
		if (a < 128)
			return 0;

		int bestIndex = 0;
		int bestDistance = int.MaxValue;

		for (int i = 0; i < palette.Length; i++)
		{
			var dr = r - palette[i].R;
			var dg = g - palette[i].G;
			var db = b - palette[i].B;
			var distance = dr * dr + dg * dg + db * db;

			if (distance < bestDistance)
			{
				bestDistance = distance;
				bestIndex = i;
			}

			if (distance == 0)
				break;
		}

		return bestIndex;
	}

	/// <summary>
	/// Basic PNG decoder
	/// </summary>
	private static (byte[]? pixels, int width, int height) DecodePng(byte[] data)
	{
		try
		{
			// Verify PNG signature
			if (data.Length < 8 ||
				data[0] != 0x89 || data[1] != 0x50 || data[2] != 0x4e || data[3] != 0x47 ||
				data[4] != 0x0d || data[5] != 0x0a || data[6] != 0x1a || data[7] != 0x0a)
			{
				return (null, 0, 0);
			}

			int width = 0, height = 0;
			int bitDepth = 0, colorType = 0;
			var compressedData = new List<byte>();

			int pos = 8;
			while (pos < data.Length)
			{
				// Read chunk length (big endian)
				var chunkLength = (data[pos] << 24) | (data[pos + 1] << 16) | (data[pos + 2] << 8) | data[pos + 3];
				pos += 4;

				// Read chunk type
				var chunkType = System.Text.Encoding.ASCII.GetString(data, pos, 4);
				pos += 4;

				if (chunkType == "IHDR")
				{
					width = (data[pos] << 24) | (data[pos + 1] << 16) | (data[pos + 2] << 8) | data[pos + 3];
					height = (data[pos + 4] << 24) | (data[pos + 5] << 16) | (data[pos + 6] << 8) | data[pos + 7];
					bitDepth = data[pos + 8];
					colorType = data[pos + 9];
				}
				else if (chunkType == "IDAT")
				{
					for (int i = 0; i < chunkLength; i++)
					{
						compressedData.Add(data[pos + i]);
					}
				}
				else if (chunkType == "IEND")
				{
					break;
				}

				pos += chunkLength + 4; // Skip data and CRC
			}

			if (width == 0 || height == 0 || compressedData.Count == 0)
			{
				return (null, 0, 0);
			}

			// Decompress IDAT data (skip zlib header)
			var compressed = compressedData.ToArray();
			byte[] decompressed;

			using (var ms = new MemoryStream(compressed, 2, compressed.Length - 6)) // Skip zlib header and Adler32
			using (var deflate = new System.IO.Compression.DeflateStream(ms, System.IO.Compression.CompressionMode.Decompress))
			using (var output = new MemoryStream())
			{
				deflate.CopyTo(output);
				decompressed = output.ToArray();
			}

			// Convert to RGBA
			var bytesPerPixel = colorType switch
			{
				0 => 1, // Grayscale
				2 => 3, // RGB
				3 => 1, // Indexed
				4 => 2, // Grayscale + Alpha
				6 => 4, // RGBA
				_ => 4
			};

			var scanlineLength = width * bytesPerPixel + 1; // +1 for filter byte
			var pixels = new byte[width * height * 4];

			for (int y = 0; y < height; y++)
			{
				var scanlineOffset = y * scanlineLength;
				var filterType = decompressed[scanlineOffset];

				for (int x = 0; x < width; x++)
				{
					var srcOffset = scanlineOffset + 1 + x * bytesPerPixel;
					var dstOffset = (y * width + x) * 4;

					// Apply filter (basic None filter support)
					byte r, g, b, a;

					if (colorType == 6)
					{
						// RGBA
						r = decompressed[srcOffset];
						g = decompressed[srcOffset + 1];
						b = decompressed[srcOffset + 2];
						a = decompressed[srcOffset + 3];
					}
					else if (colorType == 2)
					{
						// RGB
						r = decompressed[srcOffset];
						g = decompressed[srcOffset + 1];
						b = decompressed[srcOffset + 2];
						a = 255;
					}
					else if (colorType == 0)
					{
						// Grayscale
						r = g = b = decompressed[srcOffset];
						a = 255;
					}
					else if (colorType == 4)
					{
						// Grayscale + Alpha
						r = g = b = decompressed[srcOffset];
						a = decompressed[srcOffset + 1];
					}
					else
					{
						// Indexed (would need palette)
						var idx = decompressed[srcOffset];
						r = g = b = idx;
						a = 255;
					}

					pixels[dstOffset] = r;
					pixels[dstOffset + 1] = g;
					pixels[dstOffset + 2] = b;
					pixels[dstOffset + 3] = a;
				}
			}

			return (pixels, width, height);
		}
		catch
		{
			return (null, 0, 0);
		}
	}
}

/// <summary>
/// Converts JSON asset files back to binary
/// </summary>
public class JsonToAssetConverter : IAssetConverter
{
	public async Task<AssetConversionResult> ConvertAsync(
		string inputPath,
		string outputPath,
		Platform platform,
		Dictionary<string, object>? options = null,
		CancellationToken cancellationToken = default)
	{
		var result = new AssetConversionResult();

		try
		{
			if (!File.Exists(inputPath))
			{
				result.Error = $"Input file not found: {inputPath}";
				return result;
			}

			var json = await File.ReadAllTextAsync(inputPath, cancellationToken);
			var doc = JsonDocument.Parse(json);
			var root = doc.RootElement;

			byte[] outputData;

			// Determine asset type from JSON structure
			if (root.TryGetProperty("tiles", out _))
			{
				// Graphics asset
				outputData = ConvertGraphicsJson(root, platform, options);
			}
			else if (root.TryGetProperty("colors", out _))
			{
				// Palette asset
				outputData = ConvertPaletteJson(root, platform);
			}
			else if (root.TryGetProperty("entries", out _))
			{
				// Tilemap asset
				outputData = ConvertTilemapJson(root, platform);
			}
			else if (root.TryGetProperty("data", out var dataElement))
			{
				// Raw data asset
				outputData = Convert.FromHexString(dataElement.GetString() ?? "");
			}
			else if (root.TryGetProperty("strings", out _))
			{
				// Text asset - needs text table to convert
				result.Error = "Text conversion requires a text table file";
				return result;
			}
			else
			{
				result.Error = "Unknown JSON asset format";
				return result;
			}

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir))
			{
				Directory.CreateDirectory(outputDir);
			}

			await File.WriteAllBytesAsync(outputPath, outputData, cancellationToken);

			result.Success = true;
			result.OutputPath = outputPath;
			result.BytesGenerated = outputData.Length;
		}
		catch (Exception ex)
		{
			result.Error = ex.Message;
		}

		return result;
	}

	private static byte[] ConvertGraphicsJson(JsonElement root, Platform platform, Dictionary<string, object>? options)
	{
		var tiles = root.GetProperty("tiles").EnumerateArray().ToList();
		var formatStr = root.TryGetProperty("format", out var formatEl) ? formatEl.GetString() : null;

		TileGraphics.TileFormat format;
		if (!string.IsNullOrEmpty(formatStr) && Enum.TryParse<TileGraphics.TileFormat>(formatStr, true, out var parsedFormat))
		{
			format = parsedFormat;
		}
		else
		{
			format = platform switch
			{
				Platform.Nes => TileGraphics.TileFormat.Nes2Bpp,
				Platform.Snes => TileGraphics.TileFormat.Snes4Bpp,
				Platform.Genesis => TileGraphics.TileFormat.Linear4Bpp,
				Platform.Gb or Platform.Gbc => TileGraphics.TileFormat.Gb2Bpp,
				Platform.Gba => TileGraphics.TileFormat.Gba4Bpp,
				_ => TileGraphics.TileFormat.Nes2Bpp
			};
		}

		var bytesPerTile = TileGraphics.GetBytesPerTile(format);
		var output = new byte[tiles.Count * bytesPerTile];

		for (int t = 0; t < tiles.Count; t++)
		{
			var tileRows = tiles[t].EnumerateArray().ToList();
			var tile = new byte[8, 8];

			for (int y = 0; y < 8 && y < tileRows.Count; y++)
			{
				var row = tileRows[y].EnumerateArray().ToList();
				for (int x = 0; x < 8 && x < row.Count; x++)
				{
					tile[y, x] = (byte)row[x].GetInt32();
				}
			}

			var encoded = TileGraphics.EncodeTile(tile, format);
			Array.Copy(encoded, 0, output, t * bytesPerTile, bytesPerTile);
		}

		return output;
	}

	private static byte[] ConvertPaletteJson(JsonElement root, Platform platform)
	{
		var colors = root.GetProperty("colors").EnumerateArray().ToList();

		return platform switch
		{
			Platform.Nes => ConvertNesPalette(colors),
			Platform.Snes or Platform.Gbc or Platform.Gba => ConvertSnesPalette(colors),
			Platform.Genesis => ConvertGenesisPalette(colors),
			Platform.Gb => ConvertGbPalette(colors),
			_ => ConvertSnesPalette(colors)
		};
	}

	private static byte[] ConvertNesPalette(List<JsonElement> colors)
	{
		// NES palettes are indices into the master palette
		// We'd need to find the closest match - for now, return indices based on luminance
		var output = new byte[colors.Count];
		for (int i = 0; i < colors.Count; i++)
		{
			var color = colors[i];
			var r = color.GetProperty("r").GetInt32();
			var g = color.GetProperty("g").GetInt32();
			var b = color.GetProperty("b").GetInt32();

			// Find closest NES color
			output[i] = FindClosestNesColor((byte)r, (byte)g, (byte)b);
		}
		return output;
	}

	private static byte FindClosestNesColor(byte r, byte g, byte b)
	{
		int bestIndex = 0;
		int bestDistance = int.MaxValue;

		for (byte i = 0; i < 64; i++)
		{
			var (nr, ng, nb) = Palette.NesToRgb(i);
			var dr = r - nr;
			var dg = g - ng;
			var db = b - nb;
			var distance = dr * dr + dg * dg + db * db;

			if (distance < bestDistance)
			{
				bestDistance = distance;
				bestIndex = i;
			}
		}

		return (byte)bestIndex;
	}

	private static byte[] ConvertSnesPalette(List<JsonElement> colors)
	{
		var output = new byte[colors.Count * 2];
		for (int i = 0; i < colors.Count; i++)
		{
			var color = colors[i];
			var r = (byte)color.GetProperty("r").GetInt32();
			var g = (byte)color.GetProperty("g").GetInt32();
			var b = (byte)color.GetProperty("b").GetInt32();

			var snesColor = Palette.RgbToSnesColor(r, g, b);
			output[i * 2] = (byte)(snesColor & 0xff);
			output[i * 2 + 1] = (byte)((snesColor >> 8) & 0xff);
		}
		return output;
	}

	private static byte[] ConvertGenesisPalette(List<JsonElement> colors)
	{
		var output = new byte[colors.Count * 2];
		for (int i = 0; i < colors.Count; i++)
		{
			var color = colors[i];
			var r = (byte)color.GetProperty("r").GetInt32();
			var g = (byte)color.GetProperty("g").GetInt32();
			var b = (byte)color.GetProperty("b").GetInt32();

			var genesisColor = Palette.RgbToGenesisColor(r, g, b);
			// Big endian
			output[i * 2] = (byte)((genesisColor >> 8) & 0xff);
			output[i * 2 + 1] = (byte)(genesisColor & 0xff);
		}
		return output;
	}

	private static byte[] ConvertGbPalette(List<JsonElement> colors)
	{
		// GB uses 2-bit values packed in a byte for BGP register
		// Typically 4 colors per palette
		var output = new byte[1];
		for (int i = 0; i < Math.Min(4, colors.Count); i++)
		{
			var color = colors[i];
			var r = color.GetProperty("r").GetInt32();
			var g = color.GetProperty("g").GetInt32();
			var b = color.GetProperty("b").GetInt32();

			// Convert to 2-bit grayscale
			var luminance = (r * 299 + g * 587 + b * 114) / 1000;
			var shade = luminance switch
			{
				> 192 => 0, // White
				> 128 => 1, // Light gray
				> 64 => 2,  // Dark gray
				_ => 3      // Black
			};

			output[0] |= (byte)(shade << (i * 2));
		}
		return output;
	}

	private static byte[] ConvertTilemapJson(JsonElement root, Platform platform)
	{
		var entries = root.GetProperty("entries").EnumerateArray().ToList();

		var bytesPerEntry = platform switch
		{
			Platform.Nes => 1,
			Platform.Snes => 2,
			Platform.Genesis => 2,
			Platform.Gb or Platform.Gbc => 1,
			Platform.Gba => 2,
			_ => 1
		};

		var output = new byte[entries.Count * bytesPerEntry];

		for (int i = 0; i < entries.Count; i++)
		{
			var entry = entries[i];
			var tileIndex = entry.GetProperty("tile").GetInt32();
			var palette = entry.TryGetProperty("palette", out var palEl) ? palEl.GetInt32() : 0;
			var priority = entry.TryGetProperty("priority", out var priEl) ? priEl.GetInt32() : 0;
			var flipH = entry.TryGetProperty("flipH", out var flipHEl) && flipHEl.GetBoolean();
			var flipV = entry.TryGetProperty("flipV", out var flipVEl) && flipVEl.GetBoolean();

			var offset = i * bytesPerEntry;

			switch (platform)
			{
				case Platform.Nes:
				case Platform.Gb:
				case Platform.Gbc:
					output[offset] = (byte)tileIndex;
					break;

				case Platform.Snes:
					// vhopppcc cccccccc
					var snesWord = (ushort)(
						(tileIndex & 0x3ff) |
						((palette & 0x7) << 10) |
						((priority & 0x1) << 13) |
						((flipH ? 1 : 0) << 14) |
						((flipV ? 1 : 0) << 15));
					output[offset] = (byte)(snesWord & 0xff);
					output[offset + 1] = (byte)((snesWord >> 8) & 0xff);
					break;

				case Platform.Genesis:
					// pccvhttt tttttttt (big endian)
					var genWord = (ushort)(
						(tileIndex & 0x7ff) |
						((flipH ? 1 : 0) << 11) |
						((flipV ? 1 : 0) << 12) |
						((palette & 0x3) << 13) |
						((priority & 0x1) << 15));
					output[offset] = (byte)((genWord >> 8) & 0xff);
					output[offset + 1] = (byte)(genWord & 0xff);
					break;

				case Platform.Gba:
					// ppppvhtt tttttttt
					var gbaWord = (ushort)(
						(tileIndex & 0x3ff) |
						((flipH ? 1 : 0) << 10) |
						((flipV ? 1 : 0) << 11) |
						((palette & 0xf) << 12));
					output[offset] = (byte)(gbaWord & 0xff);
					output[offset + 1] = (byte)((gbaWord >> 8) & 0xff);
					break;
			}
		}

		return output;
	}
}

/// <summary>
/// Converts JASC-PAL files to binary palette data
/// </summary>
public class PalToAssetConverter : IAssetConverter
{
	public async Task<AssetConversionResult> ConvertAsync(
		string inputPath,
		string outputPath,
		Platform platform,
		Dictionary<string, object>? options = null,
		CancellationToken cancellationToken = default)
	{
		var result = new AssetConversionResult();

		try
		{
			if (!File.Exists(inputPath))
			{
				result.Error = $"Input file not found: {inputPath}";
				return result;
			}

			var lines = await File.ReadAllLinesAsync(inputPath, cancellationToken);

			// Verify JASC-PAL format
			if (lines.Length < 3 || lines[0] != "JASC-PAL")
			{
				result.Error = "Invalid JASC-PAL format";
				return result;
			}

			var colorCount = int.Parse(lines[2]);
			var colors = new List<(byte R, byte G, byte B)>();

			for (int i = 3; i < lines.Length && colors.Count < colorCount; i++)
			{
				var parts = lines[i].Split(' ', StringSplitOptions.RemoveEmptyEntries);
				if (parts.Length >= 3)
				{
					colors.Add((byte.Parse(parts[0]), byte.Parse(parts[1]), byte.Parse(parts[2])));
				}
			}

			// Convert to platform format
			var output = platform switch
			{
				Platform.Nes => ConvertToNesPalette(colors),
				Platform.Snes or Platform.Gbc or Platform.Gba => ConvertToSnesPalette(colors),
				Platform.Genesis => ConvertToGenesisPalette(colors),
				_ => ConvertToSnesPalette(colors)
			};

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir))
			{
				Directory.CreateDirectory(outputDir);
			}

			await File.WriteAllBytesAsync(outputPath, output, cancellationToken);

			result.Success = true;
			result.OutputPath = outputPath;
			result.BytesGenerated = output.Length;
		}
		catch (Exception ex)
		{
			result.Error = ex.Message;
		}

		return result;
	}

	private static byte[] ConvertToNesPalette(List<(byte R, byte G, byte B)> colors)
	{
		var output = new byte[colors.Count];
		for (int i = 0; i < colors.Count; i++)
		{
			output[i] = FindClosestNesColor(colors[i].R, colors[i].G, colors[i].B);
		}
		return output;
	}

	private static byte FindClosestNesColor(byte r, byte g, byte b)
	{
		int bestIndex = 0;
		int bestDistance = int.MaxValue;

		for (byte i = 0; i < 64; i++)
		{
			var (nr, ng, nb) = Palette.NesToRgb(i);
			var dr = r - nr;
			var dg = g - ng;
			var db = b - nb;
			var distance = dr * dr + dg * dg + db * db;

			if (distance < bestDistance)
			{
				bestDistance = distance;
				bestIndex = i;
			}
		}

		return (byte)bestIndex;
	}

	private static byte[] ConvertToSnesPalette(List<(byte R, byte G, byte B)> colors)
	{
		var output = new byte[colors.Count * 2];
		for (int i = 0; i < colors.Count; i++)
		{
			var snesColor = Palette.RgbToSnesColor(colors[i].R, colors[i].G, colors[i].B);
			output[i * 2] = (byte)(snesColor & 0xff);
			output[i * 2 + 1] = (byte)((snesColor >> 8) & 0xff);
		}
		return output;
	}

	private static byte[] ConvertToGenesisPalette(List<(byte R, byte G, byte B)> colors)
	{
		var output = new byte[colors.Count * 2];
		for (int i = 0; i < colors.Count; i++)
		{
			var genesisColor = Palette.RgbToGenesisColor(colors[i].R, colors[i].G, colors[i].B);
			output[i * 2] = (byte)((genesisColor >> 8) & 0xff);
			output[i * 2 + 1] = (byte)(genesisColor & 0xff);
		}
		return output;
	}
}

/// <summary>
/// Pass-through converter for raw binary assets
/// </summary>
public class RawAssetConverter : IAssetConverter
{
	public async Task<AssetConversionResult> ConvertAsync(
		string inputPath,
		string outputPath,
		Platform platform,
		Dictionary<string, object>? options = null,
		CancellationToken cancellationToken = default)
	{
		var result = new AssetConversionResult();

		try
		{
			if (!File.Exists(inputPath))
			{
				result.Error = $"Input file not found: {inputPath}";
				return result;
			}

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir))
			{
				Directory.CreateDirectory(outputDir);
			}

			// Just copy the file
			var data = await File.ReadAllBytesAsync(inputPath, cancellationToken);
			await File.WriteAllBytesAsync(outputPath, data, cancellationToken);

			result.Success = true;
			result.OutputPath = outputPath;
			result.BytesGenerated = data.Length;
		}
		catch (Exception ex)
		{
			result.Error = ex.Message;
		}

		return result;
	}
}
