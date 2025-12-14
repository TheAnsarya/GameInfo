using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Interface for platform-specific asset extraction
/// </summary>
public interface IAssetExtractor {
	/// <summary>
	/// Extract and convert an asset from ROM data
	/// </summary>
	Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default);
}

/// <summary>
/// Result of asset extraction
/// </summary>
public class AssetExtractionResult {
	public bool Success { get; set; }
	public string? OutputPath { get; set; }
	public string? Error { get; set; }
	public int BytesExtracted { get; set; }
	public Dictionary<string, object> Metadata { get; set; } = [];
}

/// <summary>
/// Factory for creating platform-specific asset extractors
/// </summary>
public static class AssetExtractorFactory {
	/// <summary>
	/// Get the appropriate extractor for an asset type
	/// </summary>
	public static IAssetExtractor GetExtractor(AssetType assetType, Platform platform) {
		return assetType switch {
			AssetType.Graphics => new GraphicsExtractor(platform),
			AssetType.Palette => new PaletteExtractor(platform),
			AssetType.Tilemap => new TilemapExtractor(platform),
			AssetType.Text => new TextExtractor(),
			AssetType.Data => new DataExtractor(),
			AssetType.Audio => new AudioExtractor(platform),
			_ => new DataExtractor()
		};
	}

	/// <summary>
	/// Get a platform-specific extractor that handles all asset types for that platform
	/// </summary>
	public static IAssetExtractor? GetPlatformExtractor(Platform platform) {
		return platform switch {
			Platform.Nes => new NesAssetExtractor(),
			// Future: Platform.Snes => new SnesAssetExtractor(),
			// Future: Platform.Genesis => new GenesisAssetExtractor(),
			_ => null
		};
	}
}

/// <summary>
/// Graphics asset extractor - converts tiles to PNG images
/// </summary>
public class GraphicsExtractor : IAssetExtractor {
	private readonly Platform _platform;

	public GraphicsExtractor(Platform platform) {
		_platform = platform;
	}

	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var offset = asset.Source.GetOffset();
			var length = asset.Source.GetLength() ?? (romData.Length - offset);

			if (offset < 0 || offset >= romData.Length) {
				result.Error = $"Invalid offset: 0x{offset:x}";
				return result;
			}

			if (offset + length > romData.Length) {
				length = romData.Length - offset;
			}

			// Get tile format based on platform and options
			var tileFormat = GetTileFormat(asset.Options);
			var bytesPerTile = TileGraphics.GetBytesPerTile(tileFormat);
			var tileCount = length / bytesPerTile;

			// Extract tile data
			var tileData = new byte[length];
			Array.Copy(romData, offset, tileData, 0, length);

			// Determine output format
			var format = assetsConfig.Graphics?.Format ?? "png";
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir)) {
				Directory.CreateDirectory(outputDir);
			}

			// Generate palette for rendering
			var palette = GetPalette(romData, asset.Options, assetsConfig);

			if (format.Equals("png", StringComparison.OrdinalIgnoreCase)) {
				// Export as PNG tileset
				var pngPath = Path.ChangeExtension(outputPath, ".png");
				await ExportToPngAsync(tileData, tileFormat, palette, tileCount, pngPath, cancellationToken);
				result.OutputPath = pngPath;
			} else if (format.Equals("bin", StringComparison.OrdinalIgnoreCase)) {
				// Export raw binary
				await File.WriteAllBytesAsync(outputPath, tileData, cancellationToken);
				result.OutputPath = outputPath;
			} else {
				// Export as indexed JSON with metadata
				var jsonPath = Path.ChangeExtension(outputPath, ".json");
				await ExportToJsonAsync(tileData, tileFormat, tileCount, jsonPath, cancellationToken);
				result.OutputPath = jsonPath;
			}

			result.Success = true;
			result.BytesExtracted = length;
			result.Metadata["tileCount"] = tileCount;
			result.Metadata["tileFormat"] = tileFormat.ToString();
			result.Metadata["bytesPerTile"] = bytesPerTile;
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}

	private TileGraphics.TileFormat GetTileFormat(Dictionary<string, object>? options) {
		// Check for explicit format in options
		if (options?.TryGetValue("bpp", out var bppObj) == true) {
			var bpp = Convert.ToInt32(bppObj);
			return (_platform, bpp) switch {
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

		// Default format per platform
		return _platform switch {
			Platform.Nes => TileGraphics.TileFormat.Nes2Bpp,
			Platform.Snes => TileGraphics.TileFormat.Snes4Bpp,
			Platform.Genesis => TileGraphics.TileFormat.Linear4Bpp,
			Platform.Gb or Platform.Gbc => TileGraphics.TileFormat.Gb2Bpp,
			Platform.Gba => TileGraphics.TileFormat.Gba4Bpp,
			_ => TileGraphics.TileFormat.Nes2Bpp
		};
	}

	private (byte R, byte G, byte B)[] GetPalette(byte[] romData, Dictionary<string, object>? options, AssetsConfig assetsConfig) {
		// Check for palette offset in options
		if (options?.TryGetValue("paletteOffset", out var palOffsetObj) == true) {
			var palOffset = Convert.ToInt32(palOffsetObj);
			var colorCount = 16;
			if (options.TryGetValue("colorCount", out var countObj))
				colorCount = Convert.ToInt32(countObj);

			return _platform switch {
				Platform.Nes => ReadNesPalette(romData, palOffset, colorCount),
				Platform.Snes or Platform.Gbc or Platform.Gba => Palette.ReadSnesPalette(romData, palOffset, colorCount),
				Platform.Genesis => Palette.ReadGenesisPalette(romData, palOffset, colorCount),
				_ => Palette.CreateGrayscale(colorCount)
			};
		}

		// Return default grayscale palette
		return Palette.CreateGrayscale(TileGraphics.GetColorsPerTile(GetTileFormat(options)));
	}

	private static (byte R, byte G, byte B)[] ReadNesPalette(byte[] romData, int offset, int count) {
		var palette = new (byte R, byte G, byte B)[count];
		for (int i = 0; i < count && offset + i < romData.Length; i++) {
			palette[i] = Palette.NesToRgb(romData[offset + i]);
		}

		return palette;
	}

	private static async Task ExportToPngAsync(
		byte[] tileData,
		TileGraphics.TileFormat format,
		(byte R, byte G, byte B)[] palette,
		int tileCount,
		string outputPath,
		CancellationToken cancellationToken) {
		var bytesPerTile = TileGraphics.GetBytesPerTile(format);

		// Calculate tileset dimensions (16 tiles wide)
		var tilesPerRow = 16;
		var rows = (tileCount + tilesPerRow - 1) / tilesPerRow;
		var width = tilesPerRow * 8;
		var height = rows * 8;

		// Create pixel data (RGBA)
		var pixels = new byte[width * height * 4];

		for (int t = 0; t < tileCount; t++) {
			cancellationToken.ThrowIfCancellationRequested();

			var tileX = t % tilesPerRow * 8;
			var tileY = t / tilesPerRow * 8;
			var tile = TileGraphics.DecodeTile(tileData, t * bytesPerTile, format);

			for (int y = 0; y < 8; y++) {
				for (int x = 0; x < 8; x++) {
					var colorIndex = tile[y, x];
					var (r, g, b) = colorIndex < palette.Length
						? palette[colorIndex]
						: ((byte)colorIndex, (byte)colorIndex, (byte)colorIndex);

					var pixelOffset = (((tileY + y) * width) + tileX + x) * 4;
					pixels[pixelOffset] = r;
					pixels[pixelOffset + 1] = g;
					pixels[pixelOffset + 2] = b;
					pixels[pixelOffset + 3] = colorIndex == 0 ? (byte)0 : (byte)255; // Transparency for color 0
				}
			}
		}

		// Write PNG using basic implementation
		var pngData = EncodePng(pixels, width, height);
		await File.WriteAllBytesAsync(outputPath, pngData, cancellationToken);
	}

	private static async Task ExportToJsonAsync(
		byte[] tileData,
		TileGraphics.TileFormat format,
		int tileCount,
		string outputPath,
		CancellationToken cancellationToken) {
		var bytesPerTile = TileGraphics.GetBytesPerTile(format);
		var tiles = new List<int[][]>();

		for (int t = 0; t < tileCount; t++) {
			var tile = TileGraphics.DecodeTile(tileData, t * bytesPerTile, format);
			var tileArray = new int[8][];

			for (int y = 0; y < 8; y++) {
				tileArray[y] = new int[8];
				for (int x = 0; x < 8; x++) {
					tileArray[y][x] = tile[y, x];
				}
			}

			tiles.Add(tileArray);
		}

		var graphicsData = new GraphicsAssetData {
			TileCount = tileCount,
			Format = format.ToString(),
			TileSize = [8, 8],
			Tiles = tiles
		};

		var json = JsonSerializer.Serialize(graphicsData, new JsonSerializerOptions {
			WriteIndented = true
		});

		await File.WriteAllTextAsync(outputPath, json, cancellationToken);
	}

	/// <summary>
	/// Basic PNG encoder (produces valid but uncompressed PNGs)
	/// </summary>
	private static byte[] EncodePng(byte[] rgba, int width, int height) {
		using var ms = new MemoryStream();
		using var writer = new BinaryWriter(ms);

		// PNG signature
		writer.Write(new byte[] { 0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a });

		// IHDR chunk
		WriteChunk(writer, "IHDR", BitConverter.IsLittleEndian
			? [
				(byte)(width >> 24), (byte)(width >> 16), (byte)(width >> 8), (byte)width,
				(byte)(height >> 24), (byte)(height >> 16), (byte)(height >> 8), (byte)height,
				8, // bit depth
				6, // color type (RGBA)
				0, // compression
				0, // filter
				0  // interlace
			]
			: [
				(byte)width, (byte)(width >> 8), (byte)(width >> 16), (byte)(width >> 24),
				(byte)height, (byte)(height >> 8), (byte)(height >> 16), (byte)(height >> 24),
				8, 6, 0, 0, 0
			]);

		// IDAT chunk (raw data with filter byte per row)
		var rawData = new byte[height * (1 + (width * 4))];
		for (int y = 0; y < height; y++) {
			rawData[y * (1 + (width * 4))] = 0; // Filter: None
			Array.Copy(rgba, y * width * 4, rawData, (y * (1 + (width * 4))) + 1, width * 4);
		}

		// Compress with deflate
		using var compressedStream = new MemoryStream();
		compressedStream.WriteByte(0x78); // zlib header
		compressedStream.WriteByte(0x9c);

		// Use deflate compression
		using (var deflate = new System.IO.Compression.DeflateStream(compressedStream, System.IO.Compression.CompressionLevel.Optimal, true)) {
			deflate.Write(rawData, 0, rawData.Length);
		}

		// Add Adler32 checksum
		var adler = ComputeAdler32(rawData);
		compressedStream.WriteByte((byte)(adler >> 24));
		compressedStream.WriteByte((byte)(adler >> 16));
		compressedStream.WriteByte((byte)(adler >> 8));
		compressedStream.WriteByte((byte)adler);

		WriteChunk(writer, "IDAT", compressedStream.ToArray());

		// IEND chunk
		WriteChunk(writer, "IEND", []);

		return ms.ToArray();
	}

	private static void WriteChunk(BinaryWriter writer, string type, byte[] data) {
		// Length (big endian)
		var length = data.Length;
		writer.Write(new byte[] { (byte)(length >> 24), (byte)(length >> 16), (byte)(length >> 8), (byte)length });

		// Type
		var typeBytes = System.Text.Encoding.ASCII.GetBytes(type);
		writer.Write(typeBytes);

		// Data
		writer.Write(data);

		// CRC
		var crcData = new byte[4 + data.Length];
		Array.Copy(typeBytes, crcData, 4);
		Array.Copy(data, 0, crcData, 4, data.Length);
		var crc = ComputeCrc32(crcData);
		writer.Write(new byte[] { (byte)(crc >> 24), (byte)(crc >> 16), (byte)(crc >> 8), (byte)crc });
	}

	private static uint ComputeCrc32(byte[] data) {
		uint crc = 0xffffffff;
		foreach (byte b in data) {
			crc ^= b;
			for (int i = 0; i < 8; i++) {
				crc = (crc >> 1) ^ ((crc & 1) != 0 ? 0xedb88320 : 0);
			}
		}

		return crc ^ 0xffffffff;
	}

	private static uint ComputeAdler32(byte[] data) {
		uint a = 1, b = 0;
		foreach (byte c in data) {
			a = (a + c) % 65521;
			b = (b + a) % 65521;
		}

		return (b << 16) | a;
	}
}

/// <summary>
/// JSON structure for graphics asset data
/// </summary>
public class GraphicsAssetData {
	[JsonPropertyName("tileCount")]
	public int TileCount { get; set; }

	[JsonPropertyName("format")]
	public string Format { get; set; } = "";

	[JsonPropertyName("tileSize")]
	public int[] TileSize { get; set; } = [8, 8];

	[JsonPropertyName("tiles")]
	public List<int[][]> Tiles { get; set; } = [];
}

/// <summary>
/// Palette asset extractor - converts palettes to JSON
/// </summary>
public class PaletteExtractor : IAssetExtractor {
	private readonly Platform _platform;

	public PaletteExtractor(Platform platform) {
		_platform = platform;
	}

	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var offset = asset.Source.GetOffset();
			var length = asset.Source.GetLength();

			if (offset < 0 || offset >= romData.Length) {
				result.Error = $"Invalid offset: 0x{offset:x}";
				return result;
			}

			// Determine color count and format
			var colorFormat = assetsConfig.Palettes?.ColorFormat ?? ColorFormat.Rgb24;
			int colorCount;

			if (asset.Options?.TryGetValue("colorCount", out var countObj) == true) {
				colorCount = Convert.ToInt32(countObj);
			} else {
				// Calculate based on length and platform
				var bytesPerColor = GetBytesPerColor(_platform);
				colorCount = length.HasValue ? length.Value / bytesPerColor : 16;
			}

			// Read palette
			var colors = ReadPalette(romData, offset, colorCount);

			// Create output
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir)) {
				Directory.CreateDirectory(outputDir);
			}

			var format = assetsConfig.Palettes?.Format ?? "json";
			if (format.Equals("json", StringComparison.OrdinalIgnoreCase)) {
				var jsonPath = Path.ChangeExtension(outputPath, ".json");
				await ExportToJsonAsync(colors, jsonPath, cancellationToken);
				result.OutputPath = jsonPath;
			} else if (format.Equals("pal", StringComparison.OrdinalIgnoreCase)) {
				var palPath = Path.ChangeExtension(outputPath, ".pal");
				await ExportToPalAsync(colors, palPath, cancellationToken);
				result.OutputPath = palPath;
			} else {
				// Raw binary
				var bytesPerColor = GetBytesPerColor(_platform);
				var rawData = new byte[colorCount * bytesPerColor];
				Array.Copy(romData, offset, rawData, 0, Math.Min(rawData.Length, romData.Length - offset));
				await File.WriteAllBytesAsync(outputPath, rawData, cancellationToken);
				result.OutputPath = outputPath;
			}

			result.Success = true;
			result.BytesExtracted = colorCount * GetBytesPerColor(_platform);
			result.Metadata["colorCount"] = colorCount;
			result.Metadata["platform"] = _platform.ToString();
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}

	private int GetBytesPerColor(Platform platform) {
		return platform switch {
			Platform.Nes => 1, // Index into master palette
			Platform.Snes or Platform.Gbc or Platform.Gba => 2, // 15-bit BGR
			Platform.Genesis => 2, // 9-bit BGR
			Platform.Gb => 1, // 2-bit grayscale encoded in byte
			_ => 2
		};
	}

	private (byte R, byte G, byte B)[] ReadPalette(byte[] romData, int offset, int colorCount) {
		return _platform switch {
			Platform.Nes => ReadNesPalette(romData, offset, colorCount),
			Platform.Snes or Platform.Gbc or Platform.Gba => Palette.ReadSnesPalette(romData, offset, colorCount),
			Platform.Genesis => Palette.ReadGenesisPalette(romData, offset, colorCount),
			Platform.Gb => ReadGbPalette(colorCount),
			_ => Palette.CreateGrayscale(colorCount)
		};
	}

	private static (byte R, byte G, byte B)[] ReadNesPalette(byte[] romData, int offset, int count) {
		var palette = new (byte R, byte G, byte B)[count];
		for (int i = 0; i < count && offset + i < romData.Length; i++) {
			palette[i] = Palette.NesToRgb(romData[offset + i]);
		}

		return palette;
	}

	private static (byte R, byte G, byte B)[] ReadGbPalette(int count) {
		// Standard Game Boy 4-shade palette
		return
		[
			(0xff, 0xff, 0xff),
			(0xaa, 0xaa, 0xaa),
			(0x55, 0x55, 0x55),
			(0x00, 0x00, 0x00)
		];
	}

	private static async Task ExportToJsonAsync(
		(byte R, byte G, byte B)[] colors,
		string outputPath,
		CancellationToken cancellationToken) {
		var paletteData = new PaletteAssetData {
			ColorCount = colors.Length,
			Colors = colors.Select(c => new ColorData {
				R = c.R,
				G = c.G,
				B = c.B,
				Hex = $"#{c.R:x2}{c.G:x2}{c.B:x2}"
			}).ToList()
		};

		var json = JsonSerializer.Serialize(paletteData, new JsonSerializerOptions {
			WriteIndented = true
		});

		await File.WriteAllTextAsync(outputPath, json, cancellationToken);
	}

	private static async Task ExportToPalAsync(
		(byte R, byte G, byte B)[] colors,
		string outputPath,
		CancellationToken cancellationToken) {
		// JASC-PAL format (compatible with many graphics programs)
		var lines = new List<string>
		{
			"JASC-PAL",
			"0100",
			colors.Length.ToString()
		};

		foreach (var (r, g, b) in colors) {
			lines.Add($"{r} {g} {b}");
		}

		await File.WriteAllLinesAsync(outputPath, lines, cancellationToken);
	}
}

/// <summary>
/// JSON structure for palette asset data
/// </summary>
public class PaletteAssetData {
	[JsonPropertyName("colorCount")]
	public int ColorCount { get; set; }

	[JsonPropertyName("colors")]
	public List<ColorData> Colors { get; set; } = [];
}

/// <summary>
/// Individual color data
/// </summary>
public class ColorData {
	[JsonPropertyName("r")]
	public int R { get; set; }

	[JsonPropertyName("g")]
	public int G { get; set; }

	[JsonPropertyName("b")]
	public int B { get; set; }

	[JsonPropertyName("hex")]
	public string Hex { get; set; } = "";
}

/// <summary>
/// Tilemap asset extractor
/// </summary>
public class TilemapExtractor : IAssetExtractor {
	private readonly Platform _platform;

	public TilemapExtractor(Platform platform) {
		_platform = platform;
	}

	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var offset = asset.Source.GetOffset();
			var length = asset.Source.GetLength() ?? (romData.Length - offset);

			if (offset < 0 || offset >= romData.Length) {
				result.Error = $"Invalid offset: 0x{offset:x}";
				return result;
			}

			if (offset + length > romData.Length) {
				length = romData.Length - offset;
			}

			// Get tilemap dimensions from options
			var width = 32;
			var height = 32;

			if (asset.Options?.TryGetValue("width", out var widthObj) == true)
				width = Convert.ToInt32(widthObj);
			if (asset.Options?.TryGetValue("height", out var heightObj) == true)
				height = Convert.ToInt32(heightObj);

			// Extract tilemap data
			var tilemapData = new byte[length];
			Array.Copy(romData, offset, tilemapData, 0, length);

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir)) {
				Directory.CreateDirectory(outputDir);
			}

			// Parse tilemap entries
			var entries = ParseTilemapEntries(tilemapData, width, height);

			// Export as JSON
			var jsonPath = Path.ChangeExtension(outputPath, ".json");
			var tilemapAsset = new TilemapAssetData {
				Width = width,
				Height = height,
				Platform = _platform.ToString(),
				Entries = entries
			};

			var json = JsonSerializer.Serialize(tilemapAsset, new JsonSerializerOptions {
				WriteIndented = true
			});

			await File.WriteAllTextAsync(jsonPath, json, cancellationToken);

			result.Success = true;
			result.OutputPath = jsonPath;
			result.BytesExtracted = length;
			result.Metadata["width"] = width;
			result.Metadata["height"] = height;
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}

	private List<TilemapEntry> ParseTilemapEntries(byte[] data, int width, int height) {
		var entries = new List<TilemapEntry>();
		var bytesPerEntry = GetBytesPerEntry();
		var maxEntries = Math.Min(width * height, data.Length / bytesPerEntry);

		for (int i = 0; i < maxEntries; i++) {
			var offset = i * bytesPerEntry;
			entries.Add(ParseEntry(data, offset));
		}

		return entries;
	}

	private int GetBytesPerEntry() {
		return _platform switch {
			Platform.Nes => 1, // Just tile index
			Platform.Snes => 2, // Tile + attributes
			Platform.Genesis => 2, // Tile + attributes
			Platform.Gb or Platform.Gbc => 1, // Tile index (attributes in separate table for GBC)
			Platform.Gba => 2, // Tile + attributes
			_ => 1
		};
	}

	private TilemapEntry ParseEntry(byte[] data, int offset) {
		return _platform switch {
			Platform.Nes => new TilemapEntry { TileIndex = data[offset] },
			Platform.Snes => ParseSnesEntry(data, offset),
			Platform.Genesis => ParseGenesisEntry(data, offset),
			Platform.Gba => ParseGbaEntry(data, offset),
			_ => new TilemapEntry { TileIndex = data[offset] }
		};
	}

	private static TilemapEntry ParseSnesEntry(byte[] data, int offset) {
		// SNES: vhopppcc cccccccc
		var word = (ushort)(data[offset] | (data[offset + 1] << 8));
		return new TilemapEntry {
			TileIndex = word & 0x3ff,
			Palette = (word >> 10) & 0x7,
			Priority = (word >> 13) & 0x1,
			FlipH = ((word >> 14) & 0x1) != 0,
			FlipV = ((word >> 15) & 0x1) != 0
		};
	}

	private static TilemapEntry ParseGenesisEntry(byte[] data, int offset) {
		// Genesis: pccvhttt tttttttt (big endian)
		var word = (ushort)((data[offset] << 8) | data[offset + 1]);
		return new TilemapEntry {
			TileIndex = word & 0x7ff,
			FlipH = ((word >> 11) & 0x1) != 0,
			FlipV = ((word >> 12) & 0x1) != 0,
			Palette = (word >> 13) & 0x3,
			Priority = (word >> 15) & 0x1
		};
	}

	private static TilemapEntry ParseGbaEntry(byte[] data, int offset) {
		// GBA: ppppvhtt tttttttt
		var word = (ushort)(data[offset] | (data[offset + 1] << 8));
		return new TilemapEntry {
			TileIndex = word & 0x3ff,
			FlipH = ((word >> 10) & 0x1) != 0,
			FlipV = ((word >> 11) & 0x1) != 0,
			Palette = (word >> 12) & 0xf
		};
	}
}

/// <summary>
/// JSON structure for tilemap asset data
/// </summary>
public class TilemapAssetData {
	[JsonPropertyName("width")]
	public int Width { get; set; }

	[JsonPropertyName("height")]
	public int Height { get; set; }

	[JsonPropertyName("platform")]
	public string Platform { get; set; } = "";

	[JsonPropertyName("entries")]
	public List<TilemapEntry> Entries { get; set; } = [];
}

/// <summary>
/// Single tilemap entry
/// </summary>
public class TilemapEntry {
	[JsonPropertyName("tile")]
	public int TileIndex { get; set; }

	[JsonPropertyName("palette")]
	[JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
	public int Palette { get; set; }

	[JsonPropertyName("priority")]
	[JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
	public int Priority { get; set; }

	[JsonPropertyName("flipH")]
	[JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
	public bool FlipH { get; set; }

	[JsonPropertyName("flipV")]
	[JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingDefault)]
	public bool FlipV { get; set; }
}

/// <summary>
/// Text asset extractor
/// </summary>
public class TextExtractor : IAssetExtractor {
	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var offset = asset.Source.GetOffset();
			var length = asset.Source.GetLength() ?? (romData.Length - offset);

			if (offset < 0 || offset >= romData.Length) {
				result.Error = $"Invalid offset: 0x{offset:x}";
				return result;
			}

			if (offset + length > romData.Length) {
				length = romData.Length - offset;
			}

			// Extract raw text data
			var textData = new byte[length];
			Array.Copy(romData, offset, textData, 0, length);

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir)) {
				Directory.CreateDirectory(outputDir);
			}

			// Try to load text table if specified
			TextTable? textTable = null;
			var tableFile = assetsConfig.Text?.TableFile;
			if (tableFile != null && File.Exists(tableFile)) {
				textTable = TextTable.Load(tableFile);
			}           // Export as JSON with decoded text

			var jsonPath = Path.ChangeExtension(outputPath, ".json");
			var textAsset = new TextAssetData {
				Offset = offset,
				Length = length,
				Encoding = assetsConfig.Text?.Encoding ?? "custom"
			};

			if (textTable != null) {
				// Decode using text table
				var strings = new List<TextEntry>();
				var stringBuilder = new System.Text.StringBuilder();
				var stringOffset = 0;

				for (int i = 0; i < textData.Length; i++) {
					var decoded = textTable.GetCharacter(textData[i]);
					if (decoded == null || decoded == "[END]") {
						if (stringBuilder.Length > 0) {
							strings.Add(new TextEntry {
								Offset = offset + stringOffset,
								Text = stringBuilder.ToString()
							});
							stringBuilder.Clear();
						}

						stringOffset = i + 1;
					} else {
						if (stringBuilder.Length == 0) {
							stringOffset = i;
						}

						stringBuilder.Append(decoded);
					}
				}

				if (stringBuilder.Length > 0) {
					strings.Add(new TextEntry {
						Offset = offset + stringOffset,
						Text = stringBuilder.ToString()
					});
				}

				textAsset.Strings = strings;
			} else {
				// Export raw bytes as hex
				textAsset.RawData = Convert.ToHexString(textData).ToLowerInvariant();
			}

			var json = JsonSerializer.Serialize(textAsset, new JsonSerializerOptions {
				WriteIndented = true
			});

			await File.WriteAllTextAsync(jsonPath, json, cancellationToken);

			result.Success = true;
			result.OutputPath = jsonPath;
			result.BytesExtracted = length;
			result.Metadata["stringCount"] = textAsset.Strings?.Count ?? 0;
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}
}

/// <summary>
/// JSON structure for text asset data
/// </summary>
public class TextAssetData {
	[JsonPropertyName("offset")]
	public int Offset { get; set; }

	[JsonPropertyName("length")]
	public int Length { get; set; }

	[JsonPropertyName("encoding")]
	public string Encoding { get; set; } = "";

	[JsonPropertyName("strings")]
	[JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
	public List<TextEntry>? Strings { get; set; }

	[JsonPropertyName("rawData")]
	[JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
	public string? RawData { get; set; }
}

/// <summary>
/// Single text entry
/// </summary>
public class TextEntry {
	[JsonPropertyName("offset")]
	public int Offset { get; set; }

	[JsonPropertyName("text")]
	public string Text { get; set; } = "";
}

/// <summary>
/// Generic data extractor
/// </summary>
public class DataExtractor : IAssetExtractor {
	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var offset = asset.Source.GetOffset();
			var length = asset.Source.GetLength() ?? (romData.Length - offset);

			if (offset < 0 || offset >= romData.Length) {
				result.Error = $"Invalid offset: 0x{offset:x}";
				return result;
			}

			if (offset + length > romData.Length) {
				length = romData.Length - offset;
			}

			// Extract raw data
			var data = new byte[length];
			Array.Copy(romData, offset, data, 0, length);

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir)) {
				Directory.CreateDirectory(outputDir);
			}

			// Determine output format from options or extension
			var outputFormat = Path.GetExtension(outputPath).TrimStart('.').ToLowerInvariant();
			if (asset.Options?.TryGetValue("format", out var formatObj) == true) {
				outputFormat = formatObj?.ToString() ?? "bin";
			}

			if (outputFormat == "json") {
				// Export as JSON with hex representation
				var jsonPath = Path.ChangeExtension(outputPath, ".json");
				var dataAsset = new DataAssetData {
					Offset = offset,
					Length = length,
					Data = Convert.ToHexString(data).ToLowerInvariant()
				};

				// Parse structured data if schema is provided
				if (asset.Options?.TryGetValue("schema", out var schemaObj) == true) {
					dataAsset.Schema = schemaObj?.ToString();
				}

				var json = JsonSerializer.Serialize(dataAsset, new JsonSerializerOptions {
					WriteIndented = true
				});

				await File.WriteAllTextAsync(jsonPath, json, cancellationToken);
				result.OutputPath = jsonPath;
			} else {
				// Export raw binary
				await File.WriteAllBytesAsync(outputPath, data, cancellationToken);
				result.OutputPath = outputPath;
			}

			result.Success = true;
			result.BytesExtracted = length;
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}
}

/// <summary>
/// JSON structure for data asset
/// </summary>
public class DataAssetData {
	[JsonPropertyName("offset")]
	public int Offset { get; set; }

	[JsonPropertyName("length")]
	public int Length { get; set; }

	[JsonPropertyName("data")]
	public string Data { get; set; } = "";

	[JsonPropertyName("schema")]
	[JsonIgnore(Condition = JsonIgnoreCondition.WhenWritingNull)]
	public string? Schema { get; set; }
}

/// <summary>
/// Audio asset extractor (placeholder for future audio support)
/// </summary>
public class AudioExtractor : IAssetExtractor {
	private readonly Platform _platform;

	public AudioExtractor(Platform platform) {
		_platform = platform;
	}

	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var offset = asset.Source.GetOffset();
			var length = asset.Source.GetLength() ?? (romData.Length - offset);

			if (offset < 0 || offset >= romData.Length) {
				result.Error = $"Invalid offset: 0x{offset:x}";
				return result;
			}

			if (offset + length > romData.Length) {
				length = romData.Length - offset;
			}

			// Extract raw audio data
			var data = new byte[length];
			Array.Copy(romData, offset, data, 0, length);

			// Create output directory
			var outputDir = Path.GetDirectoryName(outputPath);
			if (outputDir != null && !Directory.Exists(outputDir)) {
				Directory.CreateDirectory(outputDir);
			}

			// Export as JSON with metadata
			var jsonPath = Path.ChangeExtension(outputPath, ".json");
			var audioAsset = new AudioAssetData {
				Offset = offset,
				Length = length,
				Platform = _platform.ToString(),
				Format = GetAudioFormat(),
				Data = Convert.ToHexString(data).ToLowerInvariant()
			};

			var json = JsonSerializer.Serialize(audioAsset, new JsonSerializerOptions {
				WriteIndented = true
			});

			await File.WriteAllTextAsync(jsonPath, json, cancellationToken);

			result.Success = true;
			result.OutputPath = jsonPath;
			result.BytesExtracted = length;
			result.Metadata["format"] = audioAsset.Format;
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}

	private string GetAudioFormat() {
		return _platform switch {
			Platform.Nes => "2A03",
			Platform.Snes => "SPC700",
			Platform.Genesis => "YM2612",
			Platform.Gb or Platform.Gbc => "GB APU",
			Platform.Gba => "GBA Sound",
			_ => "Unknown"
		};
	}
}

/// <summary>
/// JSON structure for audio asset
/// </summary>
public class AudioAssetData {
	[JsonPropertyName("offset")]
	public int Offset { get; set; }

	[JsonPropertyName("length")]
	public int Length { get; set; }

	[JsonPropertyName("platform")]
	public string Platform { get; set; } = "";

	[JsonPropertyName("format")]
	public string Format { get; set; } = "";

	[JsonPropertyName("data")]
	public string Data { get; set; } = "";
}
