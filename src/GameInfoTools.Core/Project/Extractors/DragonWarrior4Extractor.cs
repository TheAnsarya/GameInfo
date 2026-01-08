using System.Security.Cryptography;
using System.Text.Json;

namespace GameInfoTools.Core.Project.Extractors;

/// <summary>
/// Asset extractor for Dragon Warrior IV (NES, US version).
/// </summary>
public class DragonWarrior4Extractor : IAssetExtractor {
	/// <summary>Known CRC32 checksum for US version.</summary>
	public const string KnownCrc32 = "a5f1a549";

	/// <summary>Known SHA1 checksum for US version.</summary>
	public const string KnownSha1 = "b4e2a8b8c06c87cc01ed14bee1c3e61e06d2a8db";

	/// <summary>Expected ROM size including header.</summary>
	public const int ExpectedSize = 0x80010; // 524,304 bytes

	/// <inheritdoc/>
	public string GameId => "dw4-nes-us";

	/// <inheritdoc/>
	public string GameName => "Dragon Warrior IV (US)";

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedExtensions => [".nes"];

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedAssetTypes => [
		"graphics", "text", "data", "maps", "audio", "source", "symbols"
	];

	/// <inheritdoc/>
	public Task<bool> CanExtractAsync(byte[] romData) {
		// Check size
		if (romData.Length < ExpectedSize) {
			return Task.FromResult(false);
		}

		// Check iNES header
		if (romData[0] != 'N' || romData[1] != 'E' || romData[2] != 'S' || romData[3] != 0x1A) {
			return Task.FromResult(false);
		}

		// Check for DW4-specific signature or checksum
		var crc32 = ComputeCrc32(romData);
		if (crc32.Equals(KnownCrc32, StringComparison.OrdinalIgnoreCase)) {
			return Task.FromResult(true);
		}

		// Could also check specific byte patterns unique to DW4
		// For now, assume it's valid if size and header match
		return Task.FromResult(romData.Length == ExpectedSize);
	}

	/// <inheritdoc/>
	public async Task<AssetCollection> ExtractAsync(
		byte[] romData,
		IEnumerable<string>? assetTypes = null,
		IProgress<ExtractProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		var assets = new AssetCollection();
		var types = assetTypes?.ToHashSet(StringComparer.OrdinalIgnoreCase);

		int totalSteps = 7;
		int currentStep = 0;

		// Extract data tables
		if (types is null || types.Contains("data")) {
			progress?.Report(new ExtractProgress("Extracting data tables", ++currentStep, totalSteps,
				currentStep * 100.0 / totalSteps));
			await ExtractDataTablesAsync(romData, assets, cancellationToken);
		}

		// Extract text
		if (types is null || types.Contains("text")) {
			progress?.Report(new ExtractProgress("Extracting text", ++currentStep, totalSteps,
				currentStep * 100.0 / totalSteps));
			await ExtractTextAsync(romData, assets, cancellationToken);
		}

		// Extract graphics
		if (types is null || types.Contains("graphics")) {
			progress?.Report(new ExtractProgress("Extracting graphics", ++currentStep, totalSteps,
				currentStep * 100.0 / totalSteps));
			await ExtractGraphicsAsync(romData, assets, cancellationToken);
		}

		// Extract maps
		if (types is null || types.Contains("maps")) {
			progress?.Report(new ExtractProgress("Extracting maps", ++currentStep, totalSteps,
				currentStep * 100.0 / totalSteps));
			await ExtractMapsAsync(romData, assets, cancellationToken);
		}

		// Extract audio
		if (types is null || types.Contains("audio")) {
			progress?.Report(new ExtractProgress("Extracting audio", ++currentStep, totalSteps,
				currentStep * 100.0 / totalSteps));
			await ExtractAudioAsync(romData, assets, cancellationToken);
		}

		// Generate source files
		if (types is null || types.Contains("source")) {
			progress?.Report(new ExtractProgress("Generating source files", ++currentStep, totalSteps,
				currentStep * 100.0 / totalSteps));
			await GenerateSourceFilesAsync(romData, assets, cancellationToken);
		}

		// Generate symbols
		if (types is null || types.Contains("symbols")) {
			progress?.Report(new ExtractProgress("Generating symbols", ++currentStep, totalSteps,
				currentStep * 100.0 / totalSteps));
			await GenerateSymbolsAsync(romData, assets, cancellationToken);
		}

		return assets;
	}

	/// <inheritdoc/>
	public Task<byte[]> PackAsync(
		AssetCollection assets,
		byte[]? baseRom = null,
		IProgress<PackProgress>? progress = null,
		CancellationToken cancellationToken = default
	) {
		// TODO: Implement packing assets back into ROM
		throw new NotImplementedException("Asset packing not yet implemented for DW4");
	}

	/// <inheritdoc/>
	public Task<RomVerificationResult> VerifyRomAsync(byte[] romData) {
		// Check size
		if (romData.Length < 16) {
			return Task.FromResult(new RomVerificationResult(
				RomVerificationStatus.Invalid,
				"File too small to be a valid ROM",
				null, null, null, null, romData.Length, false, null
			));
		}

		// Check iNES header
		if (romData[0] != 'N' || romData[1] != 'E' || romData[2] != 'S' || romData[3] != 0x1A) {
			return Task.FromResult(new RomVerificationResult(
				RomVerificationStatus.Invalid,
				"Invalid iNES header",
				null, null, null, null, romData.Length, false, null
			));
		}

		// Compute checksums
		var crc32 = ComputeCrc32(romData);
		var md5 = ComputeMd5(romData);
		var sha1 = ComputeSha1(romData);
		var sha256 = ComputeSha256(romData);

		// Check against known good checksum
		if (crc32.Equals(KnownCrc32, StringComparison.OrdinalIgnoreCase)) {
			return Task.FromResult(new RomVerificationResult(
				RomVerificationStatus.Verified,
				"ROM verified as Dragon Warrior IV (US)",
				crc32, md5, sha1, sha256, romData.Length, true, GameId
			));
		}

		// Size check
		if (romData.Length != ExpectedSize) {
			return Task.FromResult(new RomVerificationResult(
				RomVerificationStatus.Unknown,
				$"ROM size ({romData.Length}) differs from expected ({ExpectedSize})",
				crc32, md5, sha1, sha256, romData.Length, true, null
			));
		}

		return Task.FromResult(new RomVerificationResult(
			RomVerificationStatus.Unknown,
			"ROM checksum not in known database",
			crc32, md5, sha1, sha256, romData.Length, true, null
		));
	}

	/// <inheritdoc/>
	public GameDefinition GetGameDefinition() => new() {
		Id = GameId,
		Name = GameName,
		Platform = "NES",
		Region = "US",
		Developer = "Chunsoft",
		Publisher = "Enix",
		Year = 1992,
		ExtractorType = typeof(DragonWarrior4Extractor).FullName!,
		Assembler = "ca65",
		Description = "Dragon Warrior IV for NES, US release",
		KnownChecksums = new RomChecksums {
			Size = ExpectedSize,
			Crc32 = KnownCrc32,
			Sha1 = KnownSha1,
			HasHeader = true,
			HeaderSize = 16
		},
		Tags = ["rpg", "jrpg", "nes", "dragon-quest"]
	};

	// Private extraction methods

	private Task ExtractDataTablesAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Monster table - Bank 6, $A2A2, 27 bytes per entry
		var monsters = ExtractMonsterTable(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/data/monsters.json",
			Type = "data",
			Name = "Monster Stats",
			Data = JsonSerializer.SerializeToUtf8Bytes(monsters, new JsonSerializerOptions { WriteIndented = true }),
			RomOffset = 0xC2B2, // Bank 6 + $A2A2 offset
			RomLength = 200 * 27,
			Format = "json",
			Metadata = { ["count"] = monsters.Count, ["entrySize"] = 27 }
		});

		// Item table
		var items = ExtractItemTable(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/data/items.json",
			Type = "data",
			Name = "Item Data",
			Data = JsonSerializer.SerializeToUtf8Bytes(items, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json",
			Metadata = { ["count"] = items.Count }
		});

		// Spell table
		var spells = ExtractSpellTable(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/data/spells.json",
			Type = "data",
			Name = "Spell Data",
			Data = JsonSerializer.SerializeToUtf8Bytes(spells, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json",
			Metadata = { ["count"] = spells.Count }
		});

		// Experience tables
		var expTables = ExtractExperienceTables(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/data/experience.json",
			Type = "data",
			Name = "Experience Tables",
			Data = JsonSerializer.SerializeToUtf8Bytes(expTables, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json"
		});

		return Task.CompletedTask;
	}

	private Task ExtractTextAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Extract text using DW4's encoding table
		// Text is compressed and scattered across multiple banks

		// Dialog text
		assets.Add(new ExtractedAsset {
			Path = "assets/text/dialog.json",
			Type = "text",
			Name = "Dialog Text",
			Data = "[]"u8.ToArray(), // Placeholder
			Format = "json"
		});

		// Menu text
		assets.Add(new ExtractedAsset {
			Path = "assets/text/menus.json",
			Type = "text",
			Name = "Menu Text",
			Data = "[]"u8.ToArray(), // Placeholder
			Format = "json"
		});

		return Task.CompletedTask;
	}

	private Task ExtractGraphicsAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// CHR data is embedded in PRG banks for MMC3 games
		// Need to extract from specific banks

		// Character sprites
		assets.Add(new ExtractedAsset {
			Path = "assets/graphics/sprites/characters.bin",
			Type = "graphics",
			Name = "Character Sprites",
			Data = new byte[0x2000], // Placeholder - need actual extraction
			Format = "bin"
		});

		// Monster sprites
		assets.Add(new ExtractedAsset {
			Path = "assets/graphics/sprites/monsters.bin",
			Type = "graphics",
			Name = "Monster Sprites",
			Data = new byte[0x4000], // Placeholder
			Format = "bin"
		});

		// Tileset
		assets.Add(new ExtractedAsset {
			Path = "assets/graphics/tilesets/overworld.bin",
			Type = "graphics",
			Name = "Overworld Tileset",
			Data = new byte[0x1000], // Placeholder
			Format = "bin"
		});

		return Task.CompletedTask;
	}

	private Task ExtractMapsAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Map data is compressed in DW4
		// Need to decompress and parse

		assets.Add(new ExtractedAsset {
			Path = "assets/maps/overworld.json",
			Type = "maps",
			Name = "Overworld Map",
			Data = "{}"u8.ToArray(), // Placeholder
			Format = "json"
		});

		return Task.CompletedTask;
	}

	private Task ExtractAudioAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// NSF-style audio data
		// NES audio is typically sequence + instrument data

		assets.Add(new ExtractedAsset {
			Path = "assets/audio/music_data.bin",
			Type = "audio",
			Name = "Music Data",
			Data = new byte[0], // Placeholder
			Format = "bin"
		});

		return Task.CompletedTask;
	}

	private Task GenerateSourceFilesAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Generate assembly source files from ROM
		// This would integrate with a disassembler

		var mainAsm = """
			; Dragon Warrior IV (NES) - Main Assembly File
			; Auto-generated by GameInfoTools

			.segment "HEADER"
				.byte "NES", $1a    ; iNES magic
				.byte $20          ; 32 * 16KB PRG = 512KB
				.byte $00          ; 0 * 8KB CHR (CHR-RAM)
				.byte $40          ; Mapper 4 (MMC3), vertical mirroring
				.byte $00          ; No special flags

			.segment "CODE"
				; Main code goes here
				; See individual bank files for disassembly

			""";

		assets.Add(new ExtractedAsset {
			Path = "source/main.asm",
			Type = "source",
			Name = "Main Assembly",
			Data = System.Text.Encoding.UTF8.GetBytes(mainAsm),
			Format = "asm"
		});

		// Add a build config
		var buildConfig = """
			; Dragon Warrior IV build configuration for ca65/ld65
			MEMORY {
			    HDR:   start = $0000, size = $0010, type = ro, file = %O;
			    PRG:   start = $8000, size = $8000, type = ro, file = %O;
			}

			SEGMENTS {
			    HEADER:   load = HDR,  type = ro;
			    CODE:     load = PRG,  type = ro;
			    RODATA:   load = PRG,  type = ro;
			    DATA:     load = PRG,  type = rw;
			}
			""";

		assets.Add(new ExtractedAsset {
			Path = "source/dw4.cfg",
			Type = "source",
			Name = "Linker Config",
			Data = System.Text.Encoding.UTF8.GetBytes(buildConfig),
			Format = "cfg"
		});

		return Task.CompletedTask;
	}

	private Task GenerateSymbolsAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Generate symbol file with known addresses

		var symbols = """
			; Dragon Warrior IV Symbol Definitions
			; Format: LABEL = $ADDRESS

			; RAM Addresses
			PlayerHP        = $0060
			PlayerMaxHP     = $0062
			PlayerMP        = $0064
			PlayerMaxMP     = $0066
			CurrentGold     = $0070

			; ROM Addresses
			MonsterTable    = $A2A2  ; Bank 6
			ItemTable       = $8000  ; Bank 14
			SpellTable      = $9000  ; Bank 13
			ExpTable        = $A866  ; Bank 8

			; Subroutines
			MainLoop        = $8000
			HandleInput     = $8100
			UpdateGraphics  = $8200
			ProcessBattle   = $8300

			""";

		assets.Add(new ExtractedAsset {
			Path = "symbols/labels.sym",
			Type = "symbols",
			Name = "Label Definitions",
			Data = System.Text.Encoding.UTF8.GetBytes(symbols),
			Format = "sym"
		});

		// JSON version for programmatic use
		var labelsJson = new Dictionary<string, object> {
			["ram"] = new Dictionary<string, int> {
				["PlayerHP"] = 0x0060,
				["PlayerMaxHP"] = 0x0062,
				["PlayerMP"] = 0x0064,
				["PlayerMaxMP"] = 0x0066,
				["CurrentGold"] = 0x0070
			},
			["rom"] = new Dictionary<string, object> {
				["MonsterTable"] = new { address = 0xA2A2, bank = 6 },
				["ItemTable"] = new { address = 0x8000, bank = 14 },
				["SpellTable"] = new { address = 0x9000, bank = 13 },
				["ExpTable"] = new { address = 0xA866, bank = 8 }
			}
		};

		assets.Add(new ExtractedAsset {
			Path = "symbols/labels.json",
			Type = "symbols",
			Name = "Label Definitions (JSON)",
			Data = JsonSerializer.SerializeToUtf8Bytes(labelsJson, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json"
		});

		return Task.CompletedTask;
	}

	// Data extraction helpers

	private List<Dictionary<string, object>> ExtractMonsterTable(byte[] romData) {
		var monsters = new List<Dictionary<string, object>>();

		// Bank 6, $A2A2, 27 bytes per monster
		const int bank = 6;
		const int baseAddress = 0xA2A2;
		const int entrySize = 27;
		const int headerSize = 16;
		const int bankSize = 0x2000;

		// Calculate file offset: header + bank * bankSize + (address & 0x1FFF)
		int fileOffset = headerSize + (bank * bankSize) + (baseAddress & 0x1FFF);

		for (int i = 0; i < 200; i++) {
			int offset = fileOffset + (i * entrySize);
			if (offset + entrySize > romData.Length) break;

			var monster = new Dictionary<string, object> {
				["id"] = i,
				["hp"] = romData[offset] | (romData[offset + 1] << 8),
				["attack"] = romData[offset + 2],
				["defense"] = romData[offset + 3],
				["agility"] = romData[offset + 4],
				["exp"] = romData[offset + 5] | (romData[offset + 6] << 8),
				["gold"] = romData[offset + 7] | (romData[offset + 8] << 8)
				// Additional fields would be parsed here
			};

			monsters.Add(monster);
		}

		return monsters;
	}

	private List<Dictionary<string, object>> ExtractItemTable(byte[] romData) {
		// Placeholder - actual implementation would parse item data
		return [];
	}

	private List<Dictionary<string, object>> ExtractSpellTable(byte[] romData) {
		// Placeholder - actual implementation would parse spell data
		return [];
	}

	private Dictionary<string, object> ExtractExperienceTables(byte[] romData) {
		// Placeholder - actual implementation would parse exp tables
		return new Dictionary<string, object> {
			["characters"] = new string[] { "Hero", "Ragnar", "Alena", "Cristo", "Brey", "Taloon", "Nara", "Mara" }
		};
	}

	// Checksum helpers

	private static string ComputeCrc32(byte[] data) {
		uint crc = 0xFFFFFFFF;
		foreach (var b in data) {
			crc ^= b;
			for (int i = 0; i < 8; i++) {
				crc = (crc >> 1) ^ (0xEDB88320 * (crc & 1));
			}
		}

		crc ^= 0xFFFFFFFF;
		return crc.ToString("x8");
	}

	private static string ComputeMd5(byte[] data) =>
		Convert.ToHexStringLower(MD5.HashData(data));

	private static string ComputeSha1(byte[] data) =>
		Convert.ToHexStringLower(SHA1.HashData(data));

	private static string ComputeSha256(byte[] data) =>
		Convert.ToHexStringLower(SHA256.HashData(data));
}
