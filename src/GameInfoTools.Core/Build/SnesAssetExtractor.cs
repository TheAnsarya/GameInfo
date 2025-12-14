using System.Text.Json;

namespace GameInfoTools.Core.Build;

/// <summary>
/// SNES-specific asset extractor that leverages mapping-aware extraction.
/// Supports LoROM/HiROM addressing, multi-bpp graphics, and SPC audio.
/// </summary>
public class SnesAssetExtractor : IAssetExtractor {
	/// <summary>
	/// Cached ROM parser for the current extraction
	/// </summary>
	private SnesRomParser? _parser;

	/// <summary>
	/// Extract an asset from SNES ROM data
	/// </summary>
	public async Task<AssetExtractionResult> ExtractAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken = default) {
		var result = new AssetExtractionResult();

		try {
			// Parse ROM if not cached
			_parser ??= new SnesRomParser(romData);

			// Determine extraction type from options
			var extractionType = GetExtractionType(asset);

			result = extractionType switch {
				SnesExtractionType.Bank => await ExtractBankAsync(asset, outputPath, cancellationToken),
				SnesExtractionType.AllBanks => await ExtractAllBanksAsync(outputPath, cancellationToken),
				SnesExtractionType.SpcAudio => await ExtractSpcAudioAsync(romData, asset, outputPath, cancellationToken),
				SnesExtractionType.Tiles => await ExtractTilesAsync(romData, asset, outputPath, assetsConfig, cancellationToken),
				SnesExtractionType.Palette => await ExtractPaletteAsync(romData, asset, outputPath, cancellationToken),
				_ => await ExtractRawDataAsync(romData, asset, outputPath, cancellationToken)
			};

			// Add ROM info to metadata
			if (result.Success && _parser != null) {
				var layout = _parser.GetMappingLayout();
				result.Metadata["mapping"] = _parser.Mapping.ToString();
				result.Metadata["mappingName"] = layout.Name;
				result.Metadata["romSize"] = _parser.RomSize;
				result.Metadata["title"] = _parser.Header.Title;
				if (_parser.Header.EnhancementChip != SnesEnhancementChip.None) {
					result.Metadata["enhancementChip"] = _parser.Header.EnhancementChip.ToString();
				}
			}
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}

	/// <summary>
	/// Extract a specific bank
	/// </summary>
	private async Task<AssetExtractionResult> ExtractBankAsync(
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		// Get bank number from options
		if (!TryGetIntOption(asset.Options, "bank", out var bankNumber)) {
			result.Error = "Bank extraction requires 'bank' option";
			return result;
		}

		if (bankNumber < 0 || bankNumber >= _parser.BankCount) {
			result.Error = $"Bank {bankNumber} out of range (0-{_parser.BankCount - 1})";
			return result;
		}

		var bankData = _parser.GetBank(bankNumber);

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		// Write binary data
		var binPath = Path.ChangeExtension(outputPath, ".bin");
		await File.WriteAllBytesAsync(binPath, bankData, cancellationToken);

		var layout = _parser.GetMappingLayout();
		result.Success = true;
		result.OutputPath = binPath;
		result.BytesExtracted = bankData.Length;
		result.Metadata["bankNumber"] = bankNumber;
		result.Metadata["bankSize"] = layout.BankSize;

		return result;
	}

	/// <summary>
	/// Extract all banks as separate files
	/// </summary>
	private async Task<AssetExtractionResult> ExtractAllBanksAsync(
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		// Get base filename
		var baseName = Path.GetFileNameWithoutExtension(outputPath);

		var totalBytes = 0;
		for (int i = 0; i < _parser.BankCount; i++) {
			cancellationToken.ThrowIfCancellationRequested();

			var bankData = _parser.GetBank(i);
			var bankPath = Path.Combine(outputDir ?? ".", $"{baseName}_bank_{i:d2}.bin");
			await File.WriteAllBytesAsync(bankPath, bankData, cancellationToken);
			totalBytes += bankData.Length;
		}

		var layout = _parser.GetMappingLayout();
		result.Success = true;
		result.OutputPath = outputDir;
		result.BytesExtracted = totalBytes;
		result.Metadata["bankCount"] = _parser.BankCount;
		result.Metadata["bankSize"] = layout.BankSize;

		return result;
	}

	/// <summary>
	/// Extract SPC audio data
	/// </summary>
	private async Task<AssetExtractionResult> ExtractSpcAudioAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		// SPC700 header is 256 bytes
		var spcHeader = new byte[256];

		// SPC magic: "SNES-SPC700 Sound File Data v0.30"
		var magic = "SNES-SPC700 Sound File Data v0.30"u8;
		magic.CopyTo(spcHeader);
		spcHeader[0x21] = 0x1a; // End of header marker
		spcHeader[0x22] = 0x1a;

		// Has ID666 tag
		spcHeader[0x23] = 0x1a;

		// Version (minor)
		spcHeader[0x24] = 30;

		// PC (default to $0500)
		var pc = 0x0500;
		if (TryGetIntOption(asset.Options, "pc", out var customPc)) {
			pc = customPc;
		}
		spcHeader[0x25] = (byte)(pc & 0xff);
		spcHeader[0x26] = (byte)((pc >> 8) & 0xff);

		// A, X, Y, PSW, SP registers (default values)
		spcHeader[0x27] = 0x00; // A
		spcHeader[0x28] = 0x00; // X
		spcHeader[0x29] = 0x00; // Y
		spcHeader[0x2a] = 0x02; // PSW
		spcHeader[0x2b] = 0xef; // SP

		// Song title (32 bytes at 0x2e)
		var songTitle = "Extracted Audio";
		if (asset.Options?.TryGetValue("name", out var nameObj) == true && nameObj is string name) {
			songTitle = name;
		}
		var titleBytes = System.Text.Encoding.ASCII.GetBytes(songTitle);
		Array.Copy(titleBytes, 0, spcHeader, 0x2e, Math.Min(titleBytes.Length, 32));

		// Game title (32 bytes at 0x4e)
		var gameTitle = _parser.Header.Title;
		if (asset.Options?.TryGetValue("game", out var gameObj) == true && gameObj is string game) {
			gameTitle = game;
		}
		var gameBytes = System.Text.Encoding.ASCII.GetBytes(gameTitle);
		Array.Copy(gameBytes, 0, spcHeader, 0x4e, Math.Min(gameBytes.Length, 32));

		// Artist (32 bytes at 0x6e)
		var artist = "Unknown";
		if (asset.Options?.TryGetValue("artist", out var artistObj) == true && artistObj is string art) {
			artist = art;
		}
		var artistBytes = System.Text.Encoding.ASCII.GetBytes(artist);
		Array.Copy(artistBytes, 0, spcHeader, 0xb1, Math.Min(artistBytes.Length, 32));

		// Get audio data location
		var offset = asset.Source.GetOffset();
		var length = asset.Source.GetLength() ?? 0x10000; // Default 64KB for SPC RAM

		// Convert SNES address to file offset if needed
		if (offset >= 0x808000) {
			offset = _parser.SnesAddressToOffset(offset);
		}

		if (offset < 0 || offset >= romData.Length) {
			result.Error = $"Invalid offset: 0x{offset:x}";
			return result;
		}

		if (offset + length > romData.Length) {
			length = romData.Length - offset;
		}

		// SPC RAM is 64KB at offset 0x100
		var spcRam = new byte[0x10000];
		var copyLength = Math.Min(length, 0x10000);
		Array.Copy(romData, offset, spcRam, 0, copyLength);

		// DSP registers (128 bytes at 0x10100)
		var dspRegs = new byte[128];

		// Extra RAM (64 bytes at 0x101c0)
		var extraRam = new byte[64];

		// Combine all parts
		var spcData = new byte[0x10200];
		Array.Copy(spcHeader, 0, spcData, 0, 256);
		Array.Copy(spcRam, 0, spcData, 0x100, 0x10000);
		Array.Copy(dspRegs, 0, spcData, 0x10100, 128);

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		// Write SPC file
		var spcPath = Path.ChangeExtension(outputPath, ".spc");
		await File.WriteAllBytesAsync(spcPath, spcData, cancellationToken);

		result.Success = true;
		result.OutputPath = spcPath;
		result.BytesExtracted = spcData.Length;
		result.Metadata["songTitle"] = songTitle;
		result.Metadata["gameTitle"] = gameTitle;

		return result;
	}

	/// <summary>
	/// Extract tiles with SNES-specific handling (multi-bpp support)
	/// </summary>
	private async Task<AssetExtractionResult> ExtractTilesAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken) {
		// Delegate to standard graphics extractor for actual tile rendering
		var graphicsExtractor = new GraphicsExtractor(Platform.Snes);
		return await graphicsExtractor.ExtractAsync(romData, asset, outputPath, assetsConfig, cancellationToken);
	}

	/// <summary>
	/// Extract SNES palette (15-bit BGR format)
	/// </summary>
	private async Task<AssetExtractionResult> ExtractPaletteAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		var offset = asset.Source.GetOffset();
		var colorCount = 16; // Default to 16 colors

		// Convert SNES address to file offset if needed
		if (offset >= 0x808000) {
			offset = _parser.SnesAddressToOffset(offset);
		}

		if (TryGetIntOption(asset.Options, "colors", out var count)) {
			colorCount = count;
		}

		var length = colorCount * 2; // 2 bytes per color (BGR15)

		if (offset < 0 || offset >= romData.Length) {
			result.Error = $"Invalid offset: 0x{offset:x}";
			return result;
		}

		if (offset + length > romData.Length) {
			length = romData.Length - offset;
			colorCount = length / 2;
		}

		// Parse BGR15 colors to RGB
		var colors = new List<object>();
		for (int i = 0; i < colorCount; i++) {
			var bgr15 = romData[offset + (i * 2)] | (romData[offset + (i * 2) + 1] << 8);

			// BGR15: bbbbb ggggg rrrrr
			var r = (bgr15 & 0x1f) * 8;
			var g = ((bgr15 >> 5) & 0x1f) * 8;
			var b = ((bgr15 >> 10) & 0x1f) * 8;

			colors.Add(new {
				index = i,
				bgr15 = $"0x{bgr15:x4}",
				r,
				g,
				b,
				hex = $"#{r:x2}{g:x2}{b:x2}"
			});
		}

		var paletteData = new {
			format = "BGR15",
			platform = "SNES",
			offset = $"0x{offset:x}",
			colorCount,
			colors
		};

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		// Write JSON
		var jsonPath = Path.ChangeExtension(outputPath, ".json");
		var json = JsonSerializer.Serialize(paletteData, new JsonSerializerOptions { WriteIndented = true });
		await File.WriteAllTextAsync(jsonPath, json, cancellationToken);

		result.Success = true;
		result.OutputPath = jsonPath;
		result.BytesExtracted = length;
		result.Metadata["colorCount"] = colorCount;
		result.Metadata["format"] = "BGR15";

		return result;
	}

	/// <summary>
	/// Extract raw data at an offset (supports SNES addressing)
	/// </summary>
	private async Task<AssetExtractionResult> ExtractRawDataAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		var offset = asset.Source.GetOffset();
		var length = asset.Source.GetLength() ?? (romData.Length - offset);

		// Convert SNES address to file offset if needed
		if (offset >= 0x808000) {
			offset = _parser.SnesAddressToOffset(offset);
		}

		if (offset < 0 || offset >= romData.Length) {
			result.Error = $"Invalid offset: 0x{offset:x}";
			return result;
		}

		if (offset + length > romData.Length) {
			length = romData.Length - offset;
		}

		var data = new byte[length];
		Array.Copy(romData, offset, data, 0, length);

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		var binPath = Path.ChangeExtension(outputPath, ".bin");
		await File.WriteAllBytesAsync(binPath, data, cancellationToken);

		result.Success = true;
		result.OutputPath = binPath;
		result.BytesExtracted = length;

		return result;
	}

	/// <summary>
	/// Determine the extraction type from asset options
	/// </summary>
	private static SnesExtractionType GetExtractionType(AssetDefinition asset) {
		if (asset.Options?.TryGetValue("extractType", out var typeObj) == true) {
			var typeStr = typeObj?.ToString()?.ToLowerInvariant();
			return typeStr switch {
				"bank" => SnesExtractionType.Bank,
				"allbanks" => SnesExtractionType.AllBanks,
				"spc" or "audio" => SnesExtractionType.SpcAudio,
				"tiles" or "graphics" => SnesExtractionType.Tiles,
				"palette" or "colors" => SnesExtractionType.Palette,
				_ => SnesExtractionType.Raw
			};
		}

		// Infer from asset type
		return asset.Type switch {
			AssetType.Audio => SnesExtractionType.SpcAudio,
			AssetType.Graphics => SnesExtractionType.Tiles,
			AssetType.Palette => SnesExtractionType.Palette,
			_ => SnesExtractionType.Raw
		};
	}

	/// <summary>
	/// Helper to get integer options
	/// </summary>
	private static bool TryGetIntOption(Dictionary<string, object>? options, string key, out int value) {
		value = 0;
		if (options?.TryGetValue(key, out var obj) != true)
			return false;

		try {
			value = Convert.ToInt32(obj);
			return true;
		} catch {
			return false;
		}
	}
}

/// <summary>
/// Types of SNES-specific extractions
/// </summary>
public enum SnesExtractionType {
	/// <summary>Extract raw data at offset</summary>
	Raw,

	/// <summary>Extract a specific bank</summary>
	Bank,

	/// <summary>Extract all banks</summary>
	AllBanks,

	/// <summary>Extract SPC audio data</summary>
	SpcAudio,

	/// <summary>Extract tiles/graphics</summary>
	Tiles,

	/// <summary>Extract palette data</summary>
	Palette
}
