using System.Security.Cryptography;
using System.Text;
using System.Text.Json;

namespace GameInfoTools.Core.Project.Extractors;

/// <summary>
/// Asset extractor for Dragon Quest IV (SNES).
/// </summary>
public class Dq4SnesExtractor : IAssetExtractor {
	private static readonly JsonSerializerOptions JsonOptions = new() {
		WriteIndented = true,
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase
	};

	/// <inheritdoc/>
	public string GameId => "dq4-snes-jp";

	/// <inheritdoc/>
	public string GameName => "Dragon Quest IV (SNES)";

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
		"bf1de78f", // Japanese version
	];

	// The SNES remake of DQ4 uses similar techniques to DQ3
	// ROM addresses may need verification against actual ROM

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

		// Check for DQ4 ROM title at SNES header location (0x7FC0)
		var title = Encoding.ASCII.GetString(rom, 0x7FC0, 21).TrimEnd();
		// Title check needs to be specific for DQ4 vs DQ3
		return Task.FromResult(
			(title.Contains("DRAGON QUEST") || title.Contains("DRAGONQUEST")) &&
			(title.Contains("4") || title.Contains("IV"))
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
			? "Verified: Dragon Quest IV (SNES)"
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
		Year = 1990,
		ExtractorType = nameof(Dq4SnesExtractor),
		Assembler = "asar",
		Description = "Dragon Quest IV remake for Super Famicom with improved graphics",
		Tags = ["rpg", "jrpg", "snes", "enix", "dragonquest"],
		KnownChecksums = new RomChecksums {
			Size = ExpectedRomSize,
			Crc32 = "bf1de78f"
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
		var totalSteps = 4;

		// Data extraction
		if (types is null || types.Contains("data")) {
			progress?.Report(new ExtractProgress("Extracting game info", 0, totalSteps, 10));
			ExtractGameInfo(rom, collection);
		}

		// Source extraction
		progress?.Report(new ExtractProgress("Generating source files", 2, totalSteps, 50));
		GenerateSourceFiles(collection);

		// Symbols
		progress?.Report(new ExtractProgress("Generating symbol files", 3, totalSteps, 75));
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
		if (baseRom is null) {
			throw new ProjectException(ProjectErrorCode.BuildFailed, "Base ROM required for packing");
		}

		return Task.FromResult(baseRom);
	}

	private static void ExtractGameInfo(byte[] rom, AssetCollection collection) {
		// Basic game info extraction
		// Specific addresses need verification with actual ROM analysis
		var gameInfo = new {
			Title = Encoding.ASCII.GetString(rom, 0x7FC0, 21).TrimEnd(),
			RomSize = rom.Length,
			MapperType = rom[0x7FD5],
			RomType = rom[0x7FD6],
			RomSizeCode = rom[0x7FD7],
			SramSizeCode = rom[0x7FD8],
			Region = rom[0x7FD9],
			Developer = rom[0x7FDA],
			Version = rom[0x7FDB],
			Note = "Dragon Quest IV SNES uses similar compression to DQ3"
		};

		var json = JsonSerializer.Serialize(gameInfo, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "data/rom_info.json",
			Type = "data",
			Name = "ROM Header Info",
			Data = Encoding.UTF8.GetBytes(json),
			Format = "json",
			RomOffset = 0x7FC0
		});
	}

	private static void GenerateSourceFiles(AssetCollection collection) {
		var mainAsm = """
			; Dragon Quest IV (SNES) - Main Assembly File
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
		var symbols = """
			; Dragon Quest IV (SNES) Symbol Definitions
			; Format: LABEL = $ADDRESS

			; SNES Header
			RomTitle            = $00FFC0
			MapperType          = $00FFD5
			RomType             = $00FFD6
			RomSizeCode         = $00FFD7
			SramSizeCode        = $00FFD8
			RegionCode          = $00FFD9

			; RAM Addresses
			; TODO: Add RAM addresses from analysis

			""";

		collection.Add(new ExtractedAsset {
			Path = "symbols/dq4.sym",
			Type = "symbols",
			Name = "DQ4 Symbols",
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
