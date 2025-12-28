namespace GameInfoTools.Core.Build;

/// <summary>
/// Game Boy Advance asset extractor with platform-specific handling.
/// Supports 4bpp/8bpp tile graphics, palettes, and ROM region extraction.
/// </summary>
public class GbaAssetExtractor : IAssetExtractor {
	/// <summary>
	/// Extract assets from a GBA ROM.
	/// </summary>
	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig config,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var parser = new GbaRomParser(romData);
			var romInfo = parser.GetRomInfo();

			// Add ROM info to metadata
			result.Metadata["title"] = romInfo.Title;
			result.Metadata["gameCode"] = romInfo.GameCode;
			result.Metadata["makerCode"] = romInfo.MakerCode;
			result.Metadata["romSize"] = romInfo.RomSize;
			result.Metadata["saveType"] = romInfo.HasSaveType.ToString();

			var extractType = GetExtractType(asset);

			result = extractType.ToLowerInvariant() switch {
				"tiles" or "graphics" => await ExtractTilesAsync(romData, asset, outputPath, result, cancellationToken),
				"palette" => await ExtractPaletteAsync(romData, asset, outputPath, result, cancellationToken),
				"header" => await ExtractHeaderAsync(parser, outputPath, result, cancellationToken),
				"sprite" => await ExtractSpriteAsync(romData, asset, outputPath, result, cancellationToken),
				"map" or "tilemap" => await ExtractTilemapAsync(romData, asset, outputPath, result, cancellationToken),
				"audio" => await ExtractAudioAsync(romData, asset, outputPath, result, cancellationToken),
				"region" => await ExtractRegionAsync(romData, asset, outputPath, result, cancellationToken),
				_ => await ExtractRawAsync(romData, asset, outputPath, result, cancellationToken)
			};
		} catch (Exception ex) {
			result.Success = false;
			result.Error = ex.Message;
		}

		return result;
	}

	private static string GetExtractType(AssetDefinition asset) {
		if (asset.Options?.TryGetValue("extractType", out var extractType) == true) {
			return extractType?.ToString() ?? "raw";
		}

		return "raw";
	}

	private static int ParseOffset(string? offset) {
		if (string.IsNullOrEmpty(offset)) return 0;
		return offset.StartsWith("0x", StringComparison.OrdinalIgnoreCase)
			? Convert.ToInt32(offset, 16)
			: int.Parse(offset);
	}

	private static int ParseLength(string? length) {
		if (string.IsNullOrEmpty(length)) return 0;
		return length.StartsWith("0x", StringComparison.OrdinalIgnoreCase)
			? Convert.ToInt32(length, 16)
			: int.Parse(length);
	}

	/// <summary>
	/// Extract 4bpp or 8bpp tile graphics (GBA native formats).
	/// </summary>
	private async Task<AssetExtractionResult> ExtractTilesAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var length = ParseLength(asset.Source?.Length);
		var bpp = 4; // Default to 4bpp for GBA

		if (asset.Options?.TryGetValue("bpp", out var bppValue) == true) {
			bpp = Convert.ToInt32(bppValue);
		}

		// Calculate tile count
		// 4bpp: 32 bytes per 8x8 tile
		// 8bpp: 64 bytes per 8x8 tile
		var bytesPerTile = bpp * 8;
		var tileCount = length / bytesPerTile;

		if (tileCount <= 0 && length > 0) {
			tileCount = 1;
		}

		// Extract tile data
		var actualLength = Math.Min(length, romData.Length - offset);
		var tileData = new byte[actualLength];
		Array.Copy(romData, offset, tileData, 0, actualLength);

		// Delegate to graphics extractor for PNG conversion
		var graphicsExtractor = AssetExtractorFactory.GetExtractor(AssetType.Graphics, Platform.Gba);
		var graphicsResult = await graphicsExtractor.ExtractAsync(
			romData, asset, outputPath,
			new AssetsConfig(), cancellationToken);

		if (graphicsResult.Success) {
			result.Success = true;
			result.OutputPath = graphicsResult.OutputPath;
			result.BytesExtracted = actualLength;
		} else {
			// Fall back to binary extraction
			Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
			var binPath = Path.ChangeExtension(outputPath, ".bin");
			await File.WriteAllBytesAsync(binPath, tileData, cancellationToken);

			result.Success = true;
			result.OutputPath = binPath;
			result.BytesExtracted = actualLength;
		}

		result.Metadata["format"] = $"{bpp}bpp tiles";
		result.Metadata["tileCount"] = tileCount;
		result.Metadata["offset"] = $"0x{offset:x}";

		return result;
	}

	/// <summary>
	/// Extract GBA palette (15-bit RGB, same as GBC).
	/// </summary>
	private async Task<AssetExtractionResult> ExtractPaletteAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var colorCount = 16; // Default 16 colors per palette

		if (asset.Options?.TryGetValue("colors", out var colorsValue) == true) {
			colorCount = Convert.ToInt32(colorsValue);
		}

		// GBA palette: 2 bytes per color (15-bit RGB: 0bbbbbgg gggrrrrr)
		var bytesNeeded = colorCount * 2;
		var colors = new List<Dictionary<string, object>>();

		for (int i = 0; i < colorCount; i++) {
			var colorOffset = offset + (i * 2);
			if (colorOffset + 1 >= romData.Length) break;

			// Little-endian 16-bit value
			var rawColor = romData[colorOffset] | (romData[colorOffset + 1] << 8);

			// Extract 5-bit components (same as GBC)
			var r5 = rawColor & 0x1f;
			var g5 = (rawColor >> 5) & 0x1f;
			var b5 = (rawColor >> 10) & 0x1f;

			// Convert to 8-bit
			var r8 = (r5 << 3) | (r5 >> 2);
			var g8 = (g5 << 3) | (g5 >> 2);
			var b8 = (b5 << 3) | (b5 >> 2);

			colors.Add(new Dictionary<string, object> {
				["index"] = i,
				["raw"] = $"0x{rawColor:x4}",
				["r5"] = r5,
				["g5"] = g5,
				["b5"] = b5,
				["r"] = r8,
				["g"] = g8,
				["b"] = b8,
				["hex"] = $"#{r8:x2}{g8:x2}{b8:x2}"
			});
		}

		var palette = new Dictionary<string, object> {
			["name"] = asset.Name,
			["format"] = "GBA 15-bit RGB",
			["offset"] = $"0x{offset:x}",
			["colorCount"] = colorCount,
			["colors"] = colors
		};

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		var json = System.Text.Json.JsonSerializer.Serialize(palette,
			new System.Text.Json.JsonSerializerOptions { WriteIndented = true });
		await File.WriteAllTextAsync(outputPath, json, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = bytesNeeded;
		result.Metadata["format"] = "GBA 15-bit RGB";
		result.Metadata["colorCount"] = colorCount;

		return result;
	}

	/// <summary>
	/// Extract header information as JSON.
	/// </summary>
	private async Task<AssetExtractionResult> ExtractHeaderAsync(
		GbaRomParser parser,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var info = parser.GetRomInfo();

		var headerData = new Dictionary<string, object> {
			["title"] = info.Title,
			["gameCode"] = info.GameCode,
			["makerCode"] = info.MakerCode,
			["unitCode"] = info.UnitCode,
			["deviceType"] = info.DeviceType,
			["softwareVersion"] = info.SoftwareVersion,
			["entryPoint"] = $"0x{info.EntryPoint:x8}",
			["romSize"] = info.RomSize,
			["isMultiboot"] = info.IsMultiboot,
			["saveType"] = info.HasSaveType.ToString(),
			["headerChecksumValid"] = info.HeaderChecksumValid,
			["logoValid"] = info.LogoValid
		};

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		var json = System.Text.Json.JsonSerializer.Serialize(headerData,
			new System.Text.Json.JsonSerializerOptions { WriteIndented = true });
		await File.WriteAllTextAsync(outputPath, json, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = GbaRomParser.HeaderSize;
		result.Metadata["title"] = info.Title;

		return result;
	}

	/// <summary>
	/// Extract sprite data (OAM-style with attributes).
	/// </summary>
	private async Task<AssetExtractionResult> ExtractSpriteAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var length = ParseLength(asset.Source?.Length);

		if (length <= 0) {
			// Default to extracting some sprite data
			length = 0x400; // 1KB
		}

		var actualLength = Math.Min(length, romData.Length - offset);
		var spriteData = new byte[actualLength];
		Array.Copy(romData, offset, spriteData, 0, actualLength);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, spriteData, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = actualLength;
		result.Metadata["format"] = "sprite data";
		result.Metadata["offset"] = $"0x{offset:x}";

		return result;
	}

	/// <summary>
	/// Extract tilemap/background map data.
	/// </summary>
	private async Task<AssetExtractionResult> ExtractTilemapAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var length = ParseLength(asset.Source?.Length);

		// GBA tilemaps are typically 2 bytes per tile entry:
		// bits 0-9: tile number
		// bit 10: horizontal flip
		// bit 11: vertical flip
		// bits 12-15: palette number

		if (length <= 0) {
			// Default tilemap size (32x32 = 2KB)
			length = 0x800;
		}

		var actualLength = Math.Min(length, romData.Length - offset);
		var tilemapData = new byte[actualLength];
		Array.Copy(romData, offset, tilemapData, 0, actualLength);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, tilemapData, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = actualLength;
		result.Metadata["format"] = "GBA tilemap";
		result.Metadata["offset"] = $"0x{offset:x}";
		result.Metadata["entries"] = actualLength / 2;

		return result;
	}

	/// <summary>
	/// Extract audio data (typically Sappy/M4A format).
	/// </summary>
	private async Task<AssetExtractionResult> ExtractAudioAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var length = ParseLength(asset.Source?.Length);

		if (length <= 0) {
			result.Success = false;
			result.Error = "Audio extraction requires explicit length";
			return result;
		}

		var actualLength = Math.Min(length, romData.Length - offset);
		var audioData = new byte[actualLength];
		Array.Copy(romData, offset, audioData, 0, actualLength);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, audioData, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = actualLength;
		result.Metadata["format"] = "GBA audio";
		result.Metadata["offset"] = $"0x{offset:x}";

		return result;
	}

	/// <summary>
	/// Extract a named region of ROM data.
	/// </summary>
	private async Task<AssetExtractionResult> ExtractRegionAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var length = ParseLength(asset.Source?.Length);

		if (length <= 0) {
			length = romData.Length - offset;
		}

		var actualLength = Math.Min(length, romData.Length - offset);
		var regionData = new byte[actualLength];
		Array.Copy(romData, offset, regionData, 0, actualLength);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, regionData, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = actualLength;
		result.Metadata["offset"] = $"0x{offset:x}";
		result.Metadata["length"] = actualLength;

		return result;
	}

	/// <summary>
	/// Extract raw binary data.
	/// </summary>
	private async Task<AssetExtractionResult> ExtractRawAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var length = ParseLength(asset.Source?.Length);

		if (length <= 0) {
			length = romData.Length - offset;
		}

		var actualLength = Math.Min(length, romData.Length - offset);
		var data = new byte[actualLength];
		Array.Copy(romData, offset, data, 0, actualLength);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, data, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = actualLength;
		result.Metadata["offset"] = $"0x{offset:x}";
		result.Metadata["length"] = actualLength;

		return result;
	}
}
