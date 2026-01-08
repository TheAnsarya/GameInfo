using System.Security.Cryptography;
using System.Text;
using System.Text.Json;

namespace GameInfoTools.Core.Project.Extractors;

/// <summary>
/// Asset extractor for Dragon Quest III (SNES).
/// </summary>
public class Dq3SnesExtractor : IAssetExtractor {
	private static readonly JsonSerializerOptions JsonOptions = new() {
		WriteIndented = true,
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase
	};

	/// <inheritdoc/>
	public string GameId => "dq3-snes-jp";

	/// <inheritdoc/>
	public string GameName => "Dragon Quest III (SNES)";

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedExtensions => [".sfc", ".smc"];

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedAssetTypes => [
		"graphics", "text", "data", "maps", "audio", "source", "symbols"
	];

	/// <summary>Expected ROM size (4MB)</summary>
	private const int ExpectedRomSize = 0x400000;

	/// <summary>Known good ROM CRC32 values</summary>
	private static readonly HashSet<string> KnownCrc32s = [
		"a2c50e2c", // Japanese version
	];

	// ROM addresses for data tables
	private const int HuffLeftTreeAddress = 0x159d3;
	private const int HuffRightTreeAddress = 0x161a7;
	private const int HuffTableEntries = 0x3ea;
	private const int ScriptPointersAddress = 0x15331;
	private const int ScriptPointerEntries = 506;

	// Monster data
	private const int MonsterDataAddress = 0x0e0000;  // Approximate
	private const int MonsterCount = 180;

	// Item data
	private const int ItemDataAddress = 0x0f0000;  // Approximate
	private const int ItemCount = 256;

	/// <inheritdoc/>
	public Task<bool> CanExtractAsync(byte[] romData) {
		// Must be 4MB SNES ROM (or with 512-byte header)
		if (romData.Length != ExpectedRomSize && romData.Length != ExpectedRomSize + 512) {
			return Task.FromResult(false);
		}

		// Get ROM data without header if present
		var rom = GetRomWithoutHeader(romData);
		if (rom.Length != ExpectedRomSize) {
			return Task.FromResult(false);
		}

		// Check for DQ3 ROM title at SNES header location (0x7FC0)
		// "DRAGON QUEST3         " or similar
		var title = Encoding.ASCII.GetString(rom, 0x7FC0, 21).TrimEnd();
		return Task.FromResult(
			title.Contains("DRAGON QUEST") ||
			title.Contains("DRAGONQUEST") ||
			title.Contains("DQ3")
		);
	}

	/// <inheritdoc/>
	public Task<RomVerificationResult> VerifyRomAsync(byte[] romData) {
		var rom = GetRomWithoutHeader(romData);
		var hasHeader = romData.Length != rom.Length;

		var crc32 = ComputeCrc32(rom);
		var md5 = Convert.ToHexStringLower(MD5.HashData(rom));
		var sha1 = Convert.ToHexStringLower(SHA1.HashData(rom));
		var sha256 = Convert.ToHexStringLower(SHA256.HashData(rom));

		var status = KnownCrc32s.Contains(crc32)
			? RomVerificationStatus.Verified
			: RomVerificationStatus.Unknown;

		var message = status == RomVerificationStatus.Verified
			? "Verified: Dragon Quest III (SNES)"
			: $"Unknown ROM version (CRC: {crc32})";

		return Task.FromResult(new RomVerificationResult(
			status, message, crc32, md5, sha1, sha256, rom.Length, hasHeader, GameId
		));
	}

	/// <inheritdoc/>
	public GameDefinition GetGameDefinition() => new() {
		Id = GameId,
		Name = GameName,
		Platform = "SNES",
		Region = "JP",
		Developer = "Enix/Heart Beat",
		Publisher = "Enix",
		Year = 1996,
		ExtractorType = nameof(Dq3SnesExtractor),
		Assembler = "asar",
		Description = "Dragon Quest III remake for Super Famicom with improved graphics and content",
		Tags = ["rpg", "jrpg", "snes", "enix", "dragonquest"],
		KnownChecksums = new RomChecksums {
			Size = ExpectedRomSize,
			Crc32 = "a2c50e2c"
		}
	};

	/// <inheritdoc/>
	public async Task<AssetCollection> ExtractAsync(
		byte[] romData,
		IEnumerable<string>? assetTypes = null,
		IProgress<ExtractProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		var rom = GetRomWithoutHeader(romData);
		var collection = new AssetCollection();
		var types = assetTypes?.ToHashSet(StringComparer.OrdinalIgnoreCase);
		var totalSteps = 5;

		// Data extraction
		if (types is null || types.Contains("data")) {
			progress?.Report(new ExtractProgress("Extracting script pointers", 0, totalSteps, 10));
			ExtractScriptPointers(rom, collection);

			progress?.Report(new ExtractProgress("Extracting huffman tree", 1, totalSteps, 30));
			ExtractHuffmanTree(rom, collection);
		}

		// Text extraction
		if (types is null || types.Contains("text")) {
			progress?.Report(new ExtractProgress("Extracting text data", 2, totalSteps, 50));
			ExtractTextData(rom, collection);
		}

		// Source extraction
		progress?.Report(new ExtractProgress("Generating source files", 3, totalSteps, 70));
		GenerateSourceFiles(collection);

		// Symbols
		progress?.Report(new ExtractProgress("Generating symbol files", 4, totalSteps, 90));
		GenerateSymbolFiles(collection);

		progress?.Report(new ExtractProgress("Complete", totalSteps, totalSteps, 100));

		await Task.CompletedTask;
		return collection;
	}

	/// <inheritdoc/>
	public Task<byte[]> PackAsync(
		AssetCollection assets,
		byte[]? baseRom = null,
		IProgress<PackProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		// For now, just return the base ROM unchanged
		// Full packing implementation would apply asset changes back to ROM
		if (baseRom is null) {
			throw new ProjectException(ProjectErrorCode.BuildFailed, "Base ROM required for packing");
		}

		return Task.FromResult(baseRom);
	}

	private void ExtractScriptPointers(byte[] rom, AssetCollection collection) {
		var pointers = new List<object>();

		for (var i = 0; i < ScriptPointerEntries; i++) {
			var offset = ScriptPointersAddress + (i * 3);
			// 3-byte pointer (24-bit)
			var ptr = rom[offset] | (rom[offset + 1] << 8) | (rom[offset + 2] << 16);
			pointers.Add(new {
				Index = i,
				Pointer = $"0x{ptr:x6}",
				RomOffset = ptr
			});
		}

		var json = JsonSerializer.Serialize(pointers, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "data/script_pointers.json",
			Type = "data",
			Name = "Script Pointers",
			Data = Encoding.UTF8.GetBytes(json),
			Format = "json",
			RomOffset = ScriptPointersAddress,
			Metadata = new Dictionary<string, object> {
				["count"] = ScriptPointerEntries,
				["entrySize"] = 3
			}
		});
	}

	private void ExtractHuffmanTree(byte[] rom, AssetCollection collection) {
		// Extract the huffman trees for text decompression
		var leftTree = new byte[HuffTableEntries];
		var rightTree = new byte[HuffTableEntries];

		Array.Copy(rom, HuffLeftTreeAddress, leftTree, 0, HuffTableEntries);
		Array.Copy(rom, HuffRightTreeAddress, rightTree, 0, HuffTableEntries);

		collection.Add(new ExtractedAsset {
			Path = "data/huffman_left.bin",
			Type = "data",
			Name = "Huffman Left Tree",
			Data = leftTree,
			Format = "bin",
			RomOffset = HuffLeftTreeAddress,
			Metadata = new Dictionary<string, object> {
				["entries"] = HuffTableEntries
			}
		});

		collection.Add(new ExtractedAsset {
			Path = "data/huffman_right.bin",
			Type = "data",
			Name = "Huffman Right Tree",
			Data = rightTree,
			Format = "bin",
			RomOffset = HuffRightTreeAddress,
			Metadata = new Dictionary<string, object> {
				["entries"] = HuffTableEntries
			}
		});
	}

	private static void ExtractTextData(byte[] rom, AssetCollection collection) {
		// Basic text table extraction info
		// Full implementation would use DQ3Lib's huffman decompression
		var textInfo = new {
			Note = "Dragon Quest III uses Huffman compression for dialog",
			HuffmanLeftTree = $"0x{HuffLeftTreeAddress:x6}",
			HuffmanRightTree = $"0x{HuffRightTreeAddress:x6}",
			ScriptPointers = $"0x{ScriptPointersAddress:x6}",
			ScriptCount = ScriptPointerEntries
		};

		var json = JsonSerializer.Serialize(textInfo, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "text/text_info.json",
			Type = "text",
			Name = "Text System Info",
			Data = Encoding.UTF8.GetBytes(json),
			Format = "json"
		});
	}

	private static void GenerateSourceFiles(AssetCollection collection) {
		var mainAsm = """
			; Dragon Quest III (SNES) - Main Assembly File
			; Auto-generated by GameInfoTools

			hirom

			org $C00000
				; Reset vector points here
				; Main code start

			; Include data files
			;incsrc "data/tables.asm"
			;incsrc "data/text.asm"

			""";

		collection.Add(new ExtractedAsset {
			Path = "source/main.asm",
			Type = "source",
			Name = "Main Assembly",
			Data = Encoding.UTF8.GetBytes(mainAsm),
			Format = "asm"
		});
	}

	private static void GenerateSymbolFiles(AssetCollection collection) {
		var symbols = $"""
			; Dragon Quest III (SNES) Symbol Definitions
			; Format: LABEL = $ADDRESS

			; ROM Addresses (PC addresses)
			HuffmanLeftTree     = ${HuffLeftTreeAddress:x6}    ; {HuffTableEntries} entries
			HuffmanRightTree    = ${HuffRightTreeAddress:x6}    ; {HuffTableEntries} entries
			ScriptPointerTable  = ${ScriptPointersAddress:x6}    ; {ScriptPointerEntries} entries, 3 bytes each

			; RAM Addresses
			; TODO: Add RAM addresses

			""";

		collection.Add(new ExtractedAsset {
			Path = "symbols/dq3.sym",
			Type = "symbols",
			Name = "DQ3 Symbols",
			Data = Encoding.UTF8.GetBytes(symbols),
			Format = "sym"
		});
	}

	private static byte[] GetRomWithoutHeader(byte[] romData) {
		// SNES ROMs sometimes have a 512-byte SMC header
		if (romData.Length % 0x8000 == 512 && romData.Length > 512) {
			return romData[512..];
		}

		return romData;
	}

	private static string ComputeCrc32(byte[] data) {
		uint crc = 0xFFFFFFFF;
		foreach (var b in data) {
			crc ^= b;
			for (var j = 0; j < 8; j++) {
				crc = (crc & 1) != 0 ? (crc >> 1) ^ 0xEDB88320 : crc >> 1;
			}
		}

		return (~crc).ToString("x8");
	}
}
