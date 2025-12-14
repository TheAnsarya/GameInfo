namespace GameInfoTools.Core.Build;

/// <summary>
/// Game Boy / Game Boy Color asset extractor with platform-specific handling.
/// Supports 2bpp tile graphics, palettes, and ROM bank extraction.
/// </summary>
public class GameBoyAssetExtractor : IAssetExtractor {
	/// <summary>
	/// Extract assets from a Game Boy ROM.
	/// </summary>
	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig config,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			var parser = new GameBoyRomParser(romData);
			var romInfo = parser.GetRomInfo();

			// Add ROM info to metadata
			result.Metadata["title"] = romInfo.Title;
			result.Metadata["isGameBoyColor"] = romInfo.IsGameBoyColor;
			result.Metadata["mbc"] = romInfo.MBC.ToString();
			result.Metadata["romBankCount"] = romInfo.RomBankCount;
			result.Metadata["ramBankCount"] = romInfo.RamBankCount;

			var extractType = GetExtractType(asset);

			result = extractType.ToLowerInvariant() switch {
				"bank" => await ExtractBankAsync(parser, asset, outputPath, result, cancellationToken),
				"allbanks" => await ExtractAllBanksAsync(parser, asset, outputPath, result, cancellationToken),
				"tiles" or "graphics" => await ExtractTilesAsync(romData, asset, outputPath, result, cancellationToken),
				"palette" => await ExtractPaletteAsync(romData, asset, outputPath, result, cancellationToken),
				"header" => await ExtractHeaderAsync(parser, outputPath, result, cancellationToken),
				"vram" => await ExtractVramTilesAsync(romData, asset, outputPath, result, cancellationToken),
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
	/// Extract a single ROM bank.
	/// </summary>
	private async Task<AssetExtractionResult> ExtractBankAsync(
		GameBoyRomParser parser,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var bankIndex = 0;
		if (asset.Options?.TryGetValue("bank", out var bankValue) == true) {
			bankIndex = Convert.ToInt32(bankValue);
		}

		if (bankIndex < 0 || bankIndex >= parser.RomBankCount) {
			result.Success = false;
			result.Error = $"Bank {bankIndex} out of range (0-{parser.RomBankCount - 1})";
			return result;
		}

		var bankData = parser.GetRomBank(bankIndex);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, bankData, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = bankData.Length;
		result.Metadata["bankIndex"] = bankIndex;
		result.Metadata["bankSize"] = GameBoyRomParser.RomBankSize;

		return result;
	}

	/// <summary>
	/// Extract all ROM banks as separate files.
	/// </summary>
	private async Task<AssetExtractionResult> ExtractAllBanksAsync(
		GameBoyRomParser parser,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var outputDir = Path.GetDirectoryName(outputPath)!;
		var baseName = Path.GetFileNameWithoutExtension(outputPath);
		Directory.CreateDirectory(outputDir);

		int totalBytes = 0;
		for (int i = 0; i < parser.RomBankCount; i++) {
			cancellationToken.ThrowIfCancellationRequested();

			var bankData = parser.GetRomBank(i);
			var bankPath = Path.Combine(outputDir, $"{baseName}_bank_{i:d2}.bin");
			await File.WriteAllBytesAsync(bankPath, bankData, cancellationToken);
			totalBytes += bankData.Length;
		}

		result.Success = true;
		result.OutputPath = outputDir;
		result.BytesExtracted = totalBytes;
		result.Metadata["bankCount"] = parser.RomBankCount;
		result.Metadata["bankSize"] = GameBoyRomParser.RomBankSize;

		return result;
	}

	/// <summary>
	/// Extract 2bpp tile graphics (Game Boy native format).
	/// </summary>
	private async Task<AssetExtractionResult> ExtractTilesAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var length = ParseLength(asset.Source?.Length);
		var bpp = 2; // Default to 2bpp for Game Boy

		if (asset.Options?.TryGetValue("bpp", out var bppValue) == true) {
			bpp = Convert.ToInt32(bppValue);
		}

		// Calculate tile count
		var bytesPerTile = bpp * 8; // 2bpp = 16 bytes, 4bpp = 32 bytes
		var tileCount = length / bytesPerTile;

		if (tileCount <= 0) {
			result.Success = false;
			result.Error = "Invalid tile data length";
			return result;
		}

		// Extract tile data
		var tileData = new byte[length];
		Array.Copy(romData, offset, tileData, 0, length);

		// Delegate to graphics extractor for PNG conversion
		var graphicsExtractor = AssetExtractorFactory.GetExtractor(AssetType.Graphics, Platform.Gb);
		var graphicsResult = await graphicsExtractor.ExtractAsync(
			romData, asset, outputPath,
			new AssetsConfig(), cancellationToken);

		if (graphicsResult.Success) {
			result.Success = true;
			result.OutputPath = graphicsResult.OutputPath;
			result.BytesExtracted = length;
		} else {
			// Fall back to binary extraction
			Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
			var binPath = Path.ChangeExtension(outputPath, ".bin");
			await File.WriteAllBytesAsync(binPath, tileData, cancellationToken);

			result.Success = true;
			result.OutputPath = binPath;
			result.BytesExtracted = length;
		}

		result.Metadata["format"] = $"{bpp}bpp tiles";
		result.Metadata["tileCount"] = tileCount;
		result.Metadata["offset"] = offset;

		return result;
	}

	/// <summary>
	/// Extract GBC palette (15-bit RGB).
	/// </summary>
	private async Task<AssetExtractionResult> ExtractPaletteAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var offset = ParseOffset(asset.Source?.Offset);
		var colorCount = 4; // Default 4 colors per palette

		if (asset.Options?.TryGetValue("colors", out var colorsValue) == true) {
			colorCount = Convert.ToInt32(colorsValue);
		}

		// GBC palette: 2 bytes per color (15-bit RGB: 0bbbbbgg gggrrrrr)
		var bytesNeeded = colorCount * 2;
		var colors = new List<Dictionary<string, object>>();

		for (int i = 0; i < colorCount; i++) {
			var colorOffset = offset + (i * 2);
			if (colorOffset + 1 >= romData.Length) break;

			// Little-endian 16-bit value
			var rawColor = romData[colorOffset] | (romData[colorOffset + 1] << 8);

			// Extract 5-bit components
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
				["r5"] = r5, ["g5"] = g5, ["b5"] = b5,
				["r"] = r8, ["g"] = g8, ["b"] = b8,
				["hex"] = $"#{r8:x2}{g8:x2}{b8:x2}"
			});
		}

		var palette = new Dictionary<string, object> {
			["name"] = asset.Name,
			["format"] = "GBC 15-bit RGB",
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
		result.Metadata["format"] = "GBC 15-bit RGB";
		result.Metadata["colorCount"] = colorCount;

		return result;
	}

	/// <summary>
	/// Extract header information as JSON.
	/// </summary>
	private async Task<AssetExtractionResult> ExtractHeaderAsync(
		GameBoyRomParser parser,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		var info = parser.GetRomInfo();

		var headerData = new Dictionary<string, object> {
			["title"] = info.Title,
			["isGameBoyColor"] = info.IsGameBoyColor,
			["isSuperGameBoy"] = info.IsSuperGameBoy,
			["mbc"] = info.MBC.ToString(),
			["romSize"] = info.RomSize,
			["romBankCount"] = info.RomBankCount,
			["ramSize"] = info.RamSize,
			["ramBankCount"] = info.RamBankCount,
			["hasBattery"] = info.HasBattery,
			["hasTimer"] = info.HasTimer,
			["hasRumble"] = info.HasRumble,
			["region"] = info.Region.ToString(),
			["headerChecksumValid"] = info.HeaderChecksumValid,
			["globalChecksumValid"] = info.GlobalChecksumValid,
			["logoValid"] = info.LogoValid
		};

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		var json = System.Text.Json.JsonSerializer.Serialize(headerData,
			new System.Text.Json.JsonSerializerOptions { WriteIndented = true });
		await File.WriteAllTextAsync(outputPath, json, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = 0x50; // Header is $100-$14F
		result.Metadata["title"] = info.Title;

		return result;
	}

	/// <summary>
	/// Extract VRAM-mapped tiles ($8000-$97FF layout).
	/// </summary>
	private async Task<AssetExtractionResult> ExtractVramTilesAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetExtractionResult result,
		CancellationToken cancellationToken) {
		// VRAM tiles are organized in 3 blocks of 128 tiles each
		// Block 0: $8000-$87FF (used by OBJ and background)
		// Block 1: $8800-$8FFF (shared between BG addressing modes)
		// Block 2: $9000-$97FF (used by background)

		var offset = ParseOffset(asset.Source?.Offset);
		var blockCount = 3;

		if (asset.Options?.TryGetValue("blocks", out var blocksValue) == true) {
			blockCount = Convert.ToInt32(blocksValue);
		}

		var bytesPerBlock = 0x800; // 2KB per block
		var totalLength = blockCount * bytesPerBlock;

		if (offset + totalLength > romData.Length) {
			result.Success = false;
			result.Error = "VRAM tile data extends beyond ROM";
			return result;
		}

		// Extract all blocks as one binary file
		var tileData = new byte[totalLength];
		Array.Copy(romData, offset, tileData, 0, totalLength);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, tileData, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = totalLength;
		result.Metadata["blockCount"] = blockCount;
		result.Metadata["tilesPerBlock"] = 128;
		result.Metadata["totalTiles"] = blockCount * 128;

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

		if (offset + length > romData.Length) {
			length = romData.Length - offset;
		}

		var data = new byte[length];
		Array.Copy(romData, offset, data, 0, length);

		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		await File.WriteAllBytesAsync(outputPath, data, cancellationToken);

		result.Success = true;
		result.OutputPath = outputPath;
		result.BytesExtracted = length;
		result.Metadata["offset"] = $"0x{offset:x}";
		result.Metadata["length"] = length;

		return result;
	}
}
