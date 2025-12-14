using System.Text.Json;

namespace GameInfoTools.Core.Build;

/// <summary>
/// Sega Genesis/Mega Drive specific asset extractor.
/// Supports 4bpp tiles, VGM audio, and palette extraction.
/// </summary>
public class GenesisAssetExtractor : IAssetExtractor {
	/// <summary>
	/// Cached ROM parser for the current extraction
	/// </summary>
	private GenesisRomParser? _parser;

	/// <summary>
	/// Extract an asset from Genesis ROM data
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
			_parser ??= new GenesisRomParser(romData);

			// Determine extraction type from options
			var extractionType = GetExtractionType(asset);

			result = extractionType switch {
				GenesisExtractionType.Bank => await ExtractBankAsync(asset, outputPath, cancellationToken),
				GenesisExtractionType.AllBanks => await ExtractAllBanksAsync(outputPath, cancellationToken),
				GenesisExtractionType.VgmAudio => await ExtractVgmAudioAsync(romData, asset, outputPath, cancellationToken),
				GenesisExtractionType.Tiles => await ExtractTilesAsync(romData, asset, outputPath, assetsConfig, cancellationToken),
				GenesisExtractionType.Palette => await ExtractPaletteAsync(romData, asset, outputPath, cancellationToken),
				GenesisExtractionType.Header => await ExtractHeaderAsync(outputPath, cancellationToken),
				_ => await ExtractRawDataAsync(romData, asset, outputPath, cancellationToken)
			};

			// Add ROM info to metadata
			if (result.Success && _parser != null) {
				result.Metadata["domesticName"] = _parser.Header.DomesticName;
				result.Metadata["region"] = _parser.Header.Region.ToString();
				result.Metadata["romSize"] = _parser.RomSize;
				if (_parser.WasSmdFormat) {
					result.Metadata["originalFormat"] = "SMD (interleaved)";
				}
			}
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}

	/// <summary>
	/// Extract a specific 64KB bank
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

		result.Success = true;
		result.OutputPath = binPath;
		result.BytesExtracted = bankData.Length;
		result.Metadata["bankNumber"] = bankNumber;
		result.Metadata["bankSize"] = 0x10000;

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

		result.Success = true;
		result.OutputPath = outputDir;
		result.BytesExtracted = totalBytes;
		result.Metadata["bankCount"] = _parser.BankCount;

		return result;
	}

	/// <summary>
	/// Extract VGM audio data (for YM2612/SN76489 sound)
	/// </summary>
	private async Task<AssetExtractionResult> ExtractVgmAudioAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		// VGM header
		var vgmData = new List<byte>();

		// VGM magic "Vgm "
		vgmData.AddRange(new byte[] { 0x56, 0x67, 0x6d, 0x20 });

		// EOF offset (placeholder, will update)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// Version 1.50
		vgmData.AddRange(new byte[] { 0x50, 0x01, 0x00, 0x00 });

		// SN76489 clock (3579545 Hz = NTSC)
		var psgClock = BitConverter.GetBytes(3579545);
		vgmData.AddRange(psgClock);

		// YM2413 clock (0 - not used)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// GD3 offset (0 - no GD3 tag)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// Total samples (placeholder)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// Loop offset (0 - no loop)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// Loop samples (0)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// Rate (0 for auto)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// SN FB (0x0009), SNW (16), SF (0)
		vgmData.AddRange(new byte[] { 0x09, 0x00, 0x10, 0x00 });

		// YM2612 clock (7670453 Hz = NTSC)
		var fm2612Clock = BitConverter.GetBytes(7670453);
		vgmData.AddRange(fm2612Clock);

		// YM2151 clock (0)
		vgmData.AddRange(new byte[] { 0x00, 0x00, 0x00, 0x00 });

		// VGM data offset (relative to 0x34)
		var dataOffset = 0x0c; // Point to start of data at 0x40
		vgmData.AddRange(BitConverter.GetBytes(dataOffset));

		// Fill rest of header up to 0x40
		while (vgmData.Count < 0x40) {
			vgmData.Add(0x00);
		}

		// Get audio data location from asset
		var offset = asset.Source.GetOffset();
		var length = asset.Source.GetLength() ?? Math.Min(0x10000, romData.Length - offset);

		if (offset < 0 || offset >= romData.Length) {
			result.Error = $"Invalid offset: 0x{offset:x}";
			return result;
		}

		if (offset + length > romData.Length) {
			length = romData.Length - offset;
		}

		// Copy raw data as data block
		// For a real implementation, we'd need to parse the actual sound driver format
		// This creates a basic VGM with the raw data embedded
		vgmData.Add(0x67); // Data block command
		vgmData.Add(0x66); // Compatibility
		vgmData.Add(0x00); // Data type (0 = YM2612 PCM)
		vgmData.AddRange(BitConverter.GetBytes(length)); // Size
		for (int i = 0; i < length; i++) {
			vgmData.Add(romData[offset + i]);
		}

		// End of sound data
		vgmData.Add(0x66);

		// Update EOF offset
		var eofOffset = vgmData.Count - 4;
		var eofBytes = BitConverter.GetBytes(eofOffset);
		vgmData[4] = eofBytes[0];
		vgmData[5] = eofBytes[1];
		vgmData[6] = eofBytes[2];
		vgmData[7] = eofBytes[3];

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		// Write VGM file
		var vgmPath = Path.ChangeExtension(outputPath, ".vgm");
		await File.WriteAllBytesAsync(vgmPath, vgmData.ToArray(), cancellationToken);

		result.Success = true;
		result.OutputPath = vgmPath;
		result.BytesExtracted = vgmData.Count;

		return result;
	}

	/// <summary>
	/// Extract tiles with Genesis-specific 4bpp format
	/// </summary>
	private async Task<AssetExtractionResult> ExtractTilesAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken) {
		// Delegate to standard graphics extractor for actual tile rendering
		var graphicsExtractor = new GraphicsExtractor(Platform.Genesis);
		return await graphicsExtractor.ExtractAsync(romData, asset, outputPath, assetsConfig, cancellationToken);
	}

	/// <summary>
	/// Extract Genesis palette (9-bit RGB format)
	/// </summary>
	private async Task<AssetExtractionResult> ExtractPaletteAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		var offset = asset.Source.GetOffset();
		var colorCount = 16; // Default to 16 colors (one palette line)

		if (TryGetIntOption(asset.Options, "colors", out var count)) {
			colorCount = count;
		}

		var length = colorCount * 2; // 2 bytes per color

		if (offset < 0 || offset >= romData.Length) {
			result.Error = $"Invalid offset: 0x{offset:x}";
			return result;
		}

		if (offset + length > romData.Length) {
			length = romData.Length - offset;
			colorCount = length / 2;
		}

		// Parse Genesis palette (0BGR format, big-endian)
		// Each color is 0x0BBB 0GGG 0RRR where each component is 3 bits (0-7)
		var colors = new List<object>();
		for (int i = 0; i < colorCount; i++) {
			var colorWord = (romData[offset + (i * 2)] << 8) | romData[offset + (i * 2) + 1];

			// Extract 3-bit components and scale to 8-bit
			var r = ((colorWord >> 1) & 0x07) * 36;
			var g = ((colorWord >> 5) & 0x07) * 36;
			var b = ((colorWord >> 9) & 0x07) * 36;

			colors.Add(new {
				index = i,
				raw = $"0x{colorWord:x4}",
				r,
				g,
				b,
				hex = $"#{r:x2}{g:x2}{b:x2}"
			});
		}

		var paletteData = new {
			format = "Genesis 9-bit RGB",
			platform = "Genesis",
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
		result.Metadata["format"] = "Genesis 9-bit RGB";

		return result;
	}

	/// <summary>
	/// Extract ROM header information
	/// </summary>
	private async Task<AssetExtractionResult> ExtractHeaderAsync(
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		var info = _parser.GetRomInfo();

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		var jsonPath = Path.ChangeExtension(outputPath, ".json");
		var json = JsonSerializer.Serialize(info, new JsonSerializerOptions { WriteIndented = true });
		await File.WriteAllTextAsync(jsonPath, json, cancellationToken);

		result.Success = true;
		result.OutputPath = jsonPath;
		result.BytesExtracted = json.Length;

		return result;
	}

	/// <summary>
	/// Extract raw data at an offset
	/// </summary>
	private async Task<AssetExtractionResult> ExtractRawDataAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		var offset = asset.Source.GetOffset();
		var length = asset.Source.GetLength() ?? (romData.Length - offset);

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
	private static GenesisExtractionType GetExtractionType(AssetDefinition asset) {
		if (asset.Options?.TryGetValue("extractType", out var typeObj) == true) {
			var typeStr = typeObj?.ToString()?.ToLowerInvariant();
			return typeStr switch {
				"bank" => GenesisExtractionType.Bank,
				"allbanks" => GenesisExtractionType.AllBanks,
				"vgm" or "audio" => GenesisExtractionType.VgmAudio,
				"tiles" or "graphics" => GenesisExtractionType.Tiles,
				"palette" or "colors" => GenesisExtractionType.Palette,
				"header" or "info" => GenesisExtractionType.Header,
				_ => GenesisExtractionType.Raw
			};
		}

		// Infer from asset type
		return asset.Type switch {
			AssetType.Audio => GenesisExtractionType.VgmAudio,
			AssetType.Graphics => GenesisExtractionType.Tiles,
			AssetType.Palette => GenesisExtractionType.Palette,
			_ => GenesisExtractionType.Raw
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
/// Types of Genesis-specific extractions
/// </summary>
public enum GenesisExtractionType {
	/// <summary>Extract raw data at offset</summary>
	Raw,

	/// <summary>Extract a specific bank</summary>
	Bank,

	/// <summary>Extract all banks</summary>
	AllBanks,

	/// <summary>Extract VGM audio data</summary>
	VgmAudio,

	/// <summary>Extract tiles/graphics</summary>
	Tiles,

	/// <summary>Extract palette data</summary>
	Palette,

	/// <summary>Extract ROM header info</summary>
	Header
}
