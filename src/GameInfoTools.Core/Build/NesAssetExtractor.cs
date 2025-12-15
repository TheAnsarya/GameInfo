using System.Text.Json;

namespace GameInfoTools.Core.Build;

/// <summary>
/// NES-specific asset extractor that leverages mapper-aware bank extraction.
/// Supports mapper-specific PRG/CHR bank handling and NSF audio export.
/// </summary>
public class NesAssetExtractor : IAssetExtractor {
	/// <summary>
	/// Cached ROM parser for the current extraction
	/// </summary>
	private NesRomParser? _parser;

	/// <summary>
	/// Extract an asset from NES ROM data
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
			_parser ??= new NesRomParser(romData);

			// Determine extraction type from options
			var extractionType = GetExtractionType(asset);

			result = extractionType switch {
				NesExtractionType.PrgBank => await ExtractPrgBankAsync(asset, outputPath, cancellationToken),
				NesExtractionType.ChrBank => await ExtractChrBankAsync(asset, outputPath, cancellationToken),
				NesExtractionType.AllPrgBanks => await ExtractAllPrgBanksAsync(outputPath, cancellationToken),
				NesExtractionType.AllChrBanks => await ExtractAllChrBanksAsync(outputPath, cancellationToken),
				NesExtractionType.NsfAudio => await ExtractNsfAudioAsync(romData, asset, outputPath, cancellationToken),
				NesExtractionType.Tiles => await ExtractTilesAsync(romData, asset, outputPath, assetsConfig, cancellationToken),
				_ => await ExtractRawDataAsync(romData, asset, outputPath, cancellationToken)
			};

			// Add ROM info to metadata
			if (result.Success && _parser != null) {
				var layout = _parser.GetMapperLayout();
				result.Metadata["mapper"] = _parser.Mapper;
				result.Metadata["mapperName"] = layout.Name;
				result.Metadata["prgSize"] = _parser.Header.PrgRomSize;
				result.Metadata["chrSize"] = _parser.Header.ChrRomSize;
			}
		} catch (Exception ex) {
			result.Error = ex.Message;
		}

		return result;
	}

	/// <summary>
	/// Extract a specific PRG bank
	/// </summary>
	private async Task<AssetExtractionResult> ExtractPrgBankAsync(
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
			result.Error = "PRG bank extraction requires 'bank' option";
			return result;
		}

		if (bankNumber < 0 || bankNumber >= _parser.PrgBankCount) {
			result.Error = $"PRG bank {bankNumber} out of range (0-{_parser.PrgBankCount - 1})";
			return result;
		}

		var bankData = _parser.GetPrgBank(bankNumber);

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
		result.Metadata["bankSize"] = NesRomParser.PrgBankSize;

		return result;
	}

	/// <summary>
	/// Extract a specific CHR bank
	/// </summary>
	private async Task<AssetExtractionResult> ExtractChrBankAsync(
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		if (_parser.UsesChrRam) {
			result.Error = "ROM uses CHR-RAM, no CHR banks to extract";
			return result;
		}

		// Get bank number from options
		if (!TryGetIntOption(asset.Options, "bank", out var bankNumber)) {
			result.Error = "CHR bank extraction requires 'bank' option";
			return result;
		}

		if (bankNumber < 0 || bankNumber >= _parser.ChrBankCount) {
			result.Error = $"CHR bank {bankNumber} out of range (0-{_parser.ChrBankCount - 1})";
			return result;
		}

		var bankData = _parser.GetChrBank(bankNumber);

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
		result.Metadata["bankSize"] = NesRomParser.ChrBankSize;

		return result;
	}

	/// <summary>
	/// Extract all PRG banks as separate files
	/// </summary>
	private async Task<AssetExtractionResult> ExtractAllPrgBanksAsync(
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
		for (int i = 0; i < _parser.PrgBankCount; i++) {
			cancellationToken.ThrowIfCancellationRequested();

			var bankData = _parser.GetPrgBank(i);
			var bankPath = Path.Combine(outputDir ?? ".", $"{baseName}_prg_{i:d2}.bin");
			await File.WriteAllBytesAsync(bankPath, bankData, cancellationToken);
			totalBytes += bankData.Length;
		}

		result.Success = true;
		result.OutputPath = outputDir;
		result.BytesExtracted = totalBytes;
		result.Metadata["bankCount"] = _parser.PrgBankCount;
		result.Metadata["bankSize"] = NesRomParser.PrgBankSize;

		return result;
	}

	/// <summary>
	/// Extract all CHR banks as separate files
	/// </summary>
	private async Task<AssetExtractionResult> ExtractAllChrBanksAsync(
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		if (_parser.UsesChrRam) {
			result.Error = "ROM uses CHR-RAM, no CHR banks to extract";
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
		for (int i = 0; i < _parser.ChrBankCount; i++) {
			cancellationToken.ThrowIfCancellationRequested();

			var bankData = _parser.GetChrBank(i);
			var bankPath = Path.Combine(outputDir ?? ".", $"{baseName}_chr_{i:d2}.bin");
			await File.WriteAllBytesAsync(bankPath, bankData, cancellationToken);
			totalBytes += bankData.Length;
		}

		result.Success = true;
		result.OutputPath = outputDir;
		result.BytesExtracted = totalBytes;
		result.Metadata["bankCount"] = _parser.ChrBankCount;
		result.Metadata["bankSize"] = NesRomParser.ChrBankSize;

		return result;
	}

	/// <summary>
	/// Extract and export audio data as NSF format
	/// </summary>
	private async Task<AssetExtractionResult> ExtractNsfAudioAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		CancellationToken cancellationToken) {
		var result = new AssetExtractionResult();

		if (_parser == null) {
			result.Error = "ROM not parsed";
			return result;
		}

		var header = _parser.Header;

		// NSF header is 128 bytes
		var nsfHeader = new byte[128];

		// NSF magic: "NESM\x1a"
		nsfHeader[0] = 0x4e; // N
		nsfHeader[1] = 0x45; // E
		nsfHeader[2] = 0x53; // S
		nsfHeader[3] = 0x4d; // M
		nsfHeader[4] = 0x1a;

		// Version
		nsfHeader[5] = 0x01;

		// Total songs (default 1, can be overridden)
		var songCount = 1;
		if (TryGetIntOption(asset.Options, "songCount", out var count)) {
			songCount = Math.Min(count, 256);
		}
		nsfHeader[6] = (byte)songCount;

		// Starting song
		nsfHeader[7] = 0x01;

		// Load address (default $8000)
		var loadAddress = 0x8000;
		if (TryGetIntOption(asset.Options, "loadAddress", out var load)) {
			loadAddress = load;
		}
		nsfHeader[8] = (byte)(loadAddress & 0xff);
		nsfHeader[9] = (byte)((loadAddress >> 8) & 0xff);

		// Init address
		var initAddress = loadAddress;
		if (TryGetIntOption(asset.Options, "initAddress", out var init)) {
			initAddress = init;
		}
		nsfHeader[0x0a] = (byte)(initAddress & 0xff);
		nsfHeader[0x0b] = (byte)((initAddress >> 8) & 0xff);

		// Play address
		var playAddress = loadAddress + 3;
		if (TryGetIntOption(asset.Options, "playAddress", out var play)) {
			playAddress = play;
		}
		nsfHeader[0x0c] = (byte)(playAddress & 0xff);
		nsfHeader[0x0d] = (byte)((playAddress >> 8) & 0xff);

		// Song name (32 bytes at 0x0e)
		var songName = "Extracted Audio";
		if (asset.Options?.TryGetValue("name", out var nameObj) == true && nameObj is string name) {
			songName = name;
		}
		var nameBytes = System.Text.Encoding.ASCII.GetBytes(songName);
		Array.Copy(nameBytes, 0, nsfHeader, 0x0e, Math.Min(nameBytes.Length, 31));

		// Artist (32 bytes at 0x2e)
		var artist = "Unknown";
		if (asset.Options?.TryGetValue("artist", out var artistObj) == true && artistObj is string art) {
			artist = art;
		}
		var artistBytes = System.Text.Encoding.ASCII.GetBytes(artist);
		Array.Copy(artistBytes, 0, nsfHeader, 0x2e, Math.Min(artistBytes.Length, 31));

		// Copyright (32 bytes at 0x4e)
		var copyright = "Unknown";
		if (asset.Options?.TryGetValue("copyright", out var copyObj) == true && copyObj is string copy) {
			copyright = copy;
		}
		var copyBytes = System.Text.Encoding.ASCII.GetBytes(copyright);
		Array.Copy(copyBytes, 0, nsfHeader, 0x4e, Math.Min(copyBytes.Length, 31));

		// NTSC speed (16667 microseconds = 60Hz)
		nsfHeader[0x6e] = 0x1a;
		nsfHeader[0x6f] = 0x41;

		// PAL speed (20000 microseconds = 50Hz)
		nsfHeader[0x78] = 0x20;
		nsfHeader[0x79] = 0x4e;

		// Region (0 = NTSC, 1 = PAL, 2 = Dual)
		nsfHeader[0x7a] = 0x00;

		// Expansion audio chips (none by default)
		nsfHeader[0x7b] = 0x00;

		// Bank switching values (0x70-0x77)
		// Default: no bank switching
		for (int i = 0x70; i < 0x78; i++) {
			nsfHeader[i] = 0x00;
		}

		// Get audio data - use full PRG ROM by default
		var offset = asset.Source.GetOffset();
		var length = asset.Source.GetLength() ?? header.PrgRomSize;

		if (offset == 0) {
			// Use full PRG data as audio source
			offset = header.PrgRomOffset;
			length = header.PrgRomSize;
		}

		if (offset + length > romData.Length) {
			length = romData.Length - offset;
		}

		var audioData = new byte[length];
		Array.Copy(romData, offset, audioData, 0, length);

		// Combine header and data
		var nsfData = new byte[128 + audioData.Length];
		Array.Copy(nsfHeader, 0, nsfData, 0, 128);
		Array.Copy(audioData, 0, nsfData, 128, audioData.Length);

		// Ensure output directory exists
		var outputDir = Path.GetDirectoryName(outputPath);
		if (outputDir != null && !Directory.Exists(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		// Write NSF file
		var nsfPath = Path.ChangeExtension(outputPath, ".nsf");
		await File.WriteAllBytesAsync(nsfPath, nsfData, cancellationToken);

		result.Success = true;
		result.OutputPath = nsfPath;
		result.BytesExtracted = nsfData.Length;
		result.Metadata["songCount"] = songCount;
		result.Metadata["loadAddress"] = $"0x{loadAddress:x4}";
		result.Metadata["initAddress"] = $"0x{initAddress:x4}";
		result.Metadata["playAddress"] = $"0x{playAddress:x4}";

		return result;
	}

	/// <summary>
	/// Extract tiles with NES-specific handling
	/// </summary>
	private async Task<AssetExtractionResult> ExtractTilesAsync(
		byte[] romData,
		AssetDefinition asset,
		string outputPath,
		AssetsConfig assetsConfig,
		CancellationToken cancellationToken) {
		// Delegate to standard graphics extractor for actual tile rendering
		var graphicsExtractor = new GraphicsExtractor(Platform.Nes);
		return await graphicsExtractor.ExtractAsync(romData, asset, outputPath, assetsConfig, cancellationToken);
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
	private static NesExtractionType GetExtractionType(AssetDefinition asset) {
		if (asset.Options?.TryGetValue("extractType", out var typeObj) == true) {
			var typeStr = typeObj?.ToString()?.ToLowerInvariant();
			return typeStr switch {
				"prg" or "prgbank" => NesExtractionType.PrgBank,
				"chr" or "chrbank" => NesExtractionType.ChrBank,
				"allprg" or "allprgbanks" => NesExtractionType.AllPrgBanks,
				"allchr" or "allchrbanks" => NesExtractionType.AllChrBanks,
				"nsf" or "audio" => NesExtractionType.NsfAudio,
				"tiles" or "graphics" => NesExtractionType.Tiles,
				_ => NesExtractionType.Raw
			};
		}

		// Infer from asset type
		return asset.Type switch {
			AssetType.Audio => NesExtractionType.NsfAudio,
			AssetType.Graphics => NesExtractionType.Tiles,
			_ => NesExtractionType.Raw
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
/// Types of NES-specific extractions
/// </summary>
public enum NesExtractionType {
	/// <summary>Extract raw data at offset</summary>
	Raw,

	/// <summary>Extract a specific PRG bank</summary>
	PrgBank,

	/// <summary>Extract a specific CHR bank</summary>
	ChrBank,

	/// <summary>Extract all PRG banks</summary>
	AllPrgBanks,

	/// <summary>Extract all CHR banks</summary>
	AllChrBanks,

	/// <summary>Extract audio data as NSF</summary>
	NsfAudio,

	/// <summary>Extract tiles/graphics</summary>
	Tiles
}
