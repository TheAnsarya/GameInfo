using System.Security.Cryptography;
using System.Text;
using System.Text.Json;

namespace GameInfoTools.Core.Project.Extractors;

/// <summary>
/// Asset extractor for Final Fantasy Mystic Quest (SNES).
/// </summary>
/// <remarks>
/// Extracts the following asset types:
/// - data: Monster stats, items, weapons, armor, spells
/// - text: All game text (items, spells, monsters, locations, dialogs)
/// - graphics: (planned) Tilesets, sprites, palettes
/// - audio: (planned) SPC music and sound effects
/// - source: Assembly source files
/// - symbols: Debug symbol files
/// </remarks>
public class FfmqExtractor : IAssetExtractor {
	private static readonly JsonSerializerOptions JsonOptions = new() {
		WriteIndented = true,
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase
	};

	/// <inheritdoc/>
	public string GameId => "ffmq-snes-us";

	/// <inheritdoc/>
	public string GameName => "Final Fantasy Mystic Quest (US)";

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedExtensions => [".sfc", ".smc"];

	/// <inheritdoc/>
	public IReadOnlyList<string> SupportedAssetTypes => [
		"graphics", "text", "data", "maps", "audio", "source", "symbols"
	];

	/// <summary>Expected ROM size (1MB)</summary>
	private const int ExpectedRomSize = 0x100000;

	/// <summary>Known good US ROM CRC32</summary>
	private const string KnownCrc32 = "e9bc3b5a";

	// ROM addresses for data tables
	private const int MonsterStatsAddress = 0x14275;  // 14 bytes per monster
	private const int MonsterLevelAddress = 0x1417C;  // 3 bytes per monster
	private const int WeaponTableAddress = 0x66000;   // 16 bytes per weapon
	private const int ArmorTableAddress = 0x66100;    // 16 bytes per armor
	private const int SpellTableAddress = 0x66F00;    // 16 bytes per spell

	// Text table addresses (PC file offsets)
	private const int ItemNamesAddress = 0x64120;      // 232 entries × 12 bytes
	private const int SpellNamesAddress = 0x64210;     // 32 entries × 12 bytes
	private const int WeaponNamesAddress = 0x642a0;    // 57 entries × 12 bytes
	private const int HelmetNamesAddress = 0x64354;    // 10 entries × 12 bytes
	private const int ArmorNamesAddress = 0x64378;     // 20 entries × 12 bytes
	private const int ShieldNamesAddress = 0x643cc;    // 10 entries × 12 bytes
	private const int AccessoryNamesAddress = 0x643fc; // 24 entries × 12 bytes
	private const int AttackNamesAddress = 0x64420;    // 128 entries × 12 bytes
	private const int MonsterNamesAddress = 0x64ba0;   // 256 entries × 16 bytes
	private const int LocationNamesAddress = 0x63ed0;  // 37 entries × 16 bytes

	private const int MonsterCount = 83;
	private const int WeaponCount = 15;
	private const int ArmorCount = 7;
	private const int SpellCount = 16;

	/// <inheritdoc/>
	public Task<bool> CanExtractAsync(byte[] romData) {
		// Must be 1MB SNES ROM (or with 512-byte header)
		if (romData.Length != ExpectedRomSize && romData.Length != ExpectedRomSize + 512) {
			return Task.FromResult(false);
		}

		// Get ROM data without header if present
		var rom = GetRomWithoutHeader(romData);
		if (rom.Length != ExpectedRomSize) {
			return Task.FromResult(false);
		}

		// Check for FFMQ ROM title at SNES header location (0x7FC0)
		// "FINAL FANTASY USA    " (21 bytes)
		var title = Encoding.ASCII.GetString(rom, 0x7FC0, 21).TrimEnd();
		return Task.FromResult(title.StartsWith("FINAL FANTASY USA"));
	}

	/// <inheritdoc/>
	public Task<RomVerificationResult> VerifyRomAsync(byte[] romData) {
		var rom = GetRomWithoutHeader(romData);
		var hasHeader = romData.Length != rom.Length;

		var crc32 = ComputeCrc32(rom);
		var md5 = Convert.ToHexStringLower(MD5.HashData(rom));
		var sha1 = Convert.ToHexStringLower(SHA1.HashData(rom));
		var sha256 = Convert.ToHexStringLower(SHA256.HashData(rom));

		var status = crc32 == KnownCrc32
			? RomVerificationStatus.Verified
			: RomVerificationStatus.Unknown;

		var message = status == RomVerificationStatus.Verified
			? "Verified: Final Fantasy Mystic Quest (US)"
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
		Region = "US",
		Developer = "Square",
		Publisher = "Square",
		Year = 1992,
		ExtractorType = nameof(FfmqExtractor),
		Assembler = "asar",
		Description = "Action RPG spinoff of the Final Fantasy series, designed for beginners",
		Tags = ["rpg", "action", "snes", "square"],
		KnownChecksums = new RomChecksums {
			Size = ExpectedRomSize,
			Crc32 = KnownCrc32
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
		var totalSteps = 7;

		// Data extraction
		if (types is null || types.Contains("data")) {
			progress?.Report(new ExtractProgress("Extracting monster data", 0, totalSteps, 10));
			ExtractMonsterData(rom, collection);

			progress?.Report(new ExtractProgress("Extracting item data", 1, totalSteps, 25));
			ExtractItemData(rom, collection);

			progress?.Report(new ExtractProgress("Extracting spell data", 2, totalSteps, 40));
			ExtractSpellData(rom, collection);
		}

		// Text extraction
		if (types is null || types.Contains("text")) {
			progress?.Report(new ExtractProgress("Extracting text data", 3, totalSteps, 55));
			ExtractTextData(rom, collection);
		}

		// Source extraction
		progress?.Report(new ExtractProgress("Generating source files", 4, totalSteps, 70));
		GenerateSourceFiles(collection);

		// Symbols
		progress?.Report(new ExtractProgress("Generating symbol files", 5, totalSteps, 85));
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

	private void ExtractMonsterData(byte[] rom, AssetCollection collection) {
		var monsters = new List<object>();

		for (var i = 0; i < MonsterCount; i++) {
			var statsOffset = MonsterStatsAddress + (i * 14);
			var levelOffset = MonsterLevelAddress + (i * 3);

			monsters.Add(new {
				Id = i,
				Hp = rom[statsOffset] | (rom[statsOffset + 1] << 8),
				Attack = rom[statsOffset + 2],
				Defense = rom[statsOffset + 3],
				Speed = rom[statsOffset + 4],
				MagicAttack = rom[statsOffset + 5],
				MagicDefense = rom[statsOffset + 6],
				ExpMultiplier = rom[levelOffset],
				GoldMultiplier = rom[levelOffset + 1],
				Level = rom[levelOffset + 2]
			});
		}

		var json = JsonSerializer.Serialize(monsters, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "data/monsters.json",
			Type = "data",
			Name = "Monster Stats",
			Data = Encoding.UTF8.GetBytes(json),
			Format = "json",
			RomOffset = MonsterStatsAddress,
			Metadata = new Dictionary<string, object> {
				["count"] = MonsterCount,
				["entrySize"] = 14
			}
		});
	}

	private void ExtractItemData(byte[] rom, AssetCollection collection) {
		// Weapons
		var weapons = new List<object>();
		for (var i = 0; i < WeaponCount; i++) {
			var offset = WeaponTableAddress + (i * 16);
			weapons.Add(new {
				Id = i,
				AttackPower = rom[offset],
				Element = rom[offset + 1],
				SpecialEffect = rom[offset + 2]
			});
		}

		var weaponsJson = JsonSerializer.Serialize(weapons, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "data/weapons.json",
			Type = "data",
			Name = "Weapons",
			Data = Encoding.UTF8.GetBytes(weaponsJson),
			Format = "json",
			RomOffset = WeaponTableAddress,
			Metadata = new Dictionary<string, object> {
				["count"] = WeaponCount,
				["entrySize"] = 16
			}
		});

		// Armor
		var armors = new List<object>();
		for (var i = 0; i < ArmorCount; i++) {
			var offset = ArmorTableAddress + (i * 16);
			armors.Add(new {
				Id = i,
				DefensePower = rom[offset],
				MagicDefense = rom[offset + 1],
				ElementResist = rom[offset + 2],
				StatusResist = rom[offset + 3]
			});
		}

		var armorJson = JsonSerializer.Serialize(armors, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "data/armor.json",
			Type = "data",
			Name = "Armor",
			Data = Encoding.UTF8.GetBytes(armorJson),
			Format = "json",
			RomOffset = ArmorTableAddress,
			Metadata = new Dictionary<string, object> {
				["count"] = ArmorCount,
				["entrySize"] = 16
			}
		});
	}

	private void ExtractSpellData(byte[] rom, AssetCollection collection) {
		var spells = new List<object>();

		for (var i = 0; i < SpellCount; i++) {
			var offset = SpellTableAddress + (i * 16);
			spells.Add(new {
				Id = i,
				BasePower = rom[offset],
				MpCost = rom[offset + 1],
				Element = rom[offset + 2],
				TargetType = rom[offset + 3],
				Animation = rom[offset + 4]
			});
		}

		var json = JsonSerializer.Serialize(spells, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "data/spells.json",
			Type = "data",
			Name = "Spells",
			Data = Encoding.UTF8.GetBytes(json),
			Format = "json",
			RomOffset = SpellTableAddress,
			Metadata = new Dictionary<string, object> {
				["count"] = SpellCount,
				["entrySize"] = 16
			}
		});
	}

	private void ExtractTextData(byte[] rom, AssetCollection collection) {
		// Character encoding table (FFMQ-specific)
		// 0x90-0x99 = digits, 0x9A-0xB3 = uppercase, 0xB4-0xCD = lowercase
		// 0xFF = space, 0x00 = terminator

		var textData = new Dictionary<string, object> {
			["itemNames"] = ExtractTextTable(rom, ItemNamesAddress, 232, 12),
			["spellNames"] = ExtractTextTable(rom, SpellNamesAddress, 32, 12),
			["weaponNames"] = ExtractTextTable(rom, WeaponNamesAddress, 57, 12),
			["helmetNames"] = ExtractTextTable(rom, HelmetNamesAddress, 10, 12),
			["armorNames"] = ExtractTextTable(rom, ArmorNamesAddress, 20, 12),
			["shieldNames"] = ExtractTextTable(rom, ShieldNamesAddress, 10, 12),
			["accessoryNames"] = ExtractTextTable(rom, AccessoryNamesAddress, 24, 12),
			["attackNames"] = ExtractTextTable(rom, AttackNamesAddress, 128, 12),
			["monsterNames"] = ExtractTextTable(rom, MonsterNamesAddress, 256, 16),
			["locationNames"] = ExtractTextTable(rom, LocationNamesAddress, 37, 16)
		};

		var json = JsonSerializer.Serialize(textData, JsonOptions);
		collection.Add(new ExtractedAsset {
			Path = "text/all_text.json",
			Type = "text",
			Name = "All Game Text",
			Data = Encoding.UTF8.GetBytes(json),
			Format = "json",
			Metadata = new Dictionary<string, object> {
				["encoding"] = "ffmq-simple",
				["totalEntries"] = 232 + 32 + 57 + 10 + 20 + 10 + 24 + 128 + 256 + 37
			}
		});

		// Also create individual text files for easier editing
		CreateTextFile(collection, "text/items.txt", ExtractTextTable(rom, ItemNamesAddress, 232, 12), "Item Names");
		CreateTextFile(collection, "text/spells.txt", ExtractTextTable(rom, SpellNamesAddress, 32, 12), "Spell Names");
		CreateTextFile(collection, "text/weapons.txt", ExtractTextTable(rom, WeaponNamesAddress, 57, 12), "Weapon Names");
		CreateTextFile(collection, "text/monsters.txt", ExtractTextTable(rom, MonsterNamesAddress, 256, 16), "Monster Names");
		CreateTextFile(collection, "text/locations.txt", ExtractTextTable(rom, LocationNamesAddress, 37, 16), "Location Names");
	}

	private static string[] ExtractTextTable(byte[] rom, int address, int count, int entryLength) {
		var entries = new string[count];

		for (var i = 0; i < count; i++) {
			var offset = address + (i * entryLength);
			entries[i] = DecodeText(rom, offset, entryLength);
		}

		return entries;
	}

	private static string DecodeText(byte[] rom, int offset, int maxLength) {
		var sb = new StringBuilder();

		for (var i = 0; i < maxLength; i++) {
			var b = rom[offset + i];

			if (b == 0x00) break;  // Terminator
			if (b == 0x03 || b == 0xFE) continue;  // Padding bytes

			var c = b switch {
				>= 0x90 and <= 0x99 => (char)('0' + (b - 0x90)),
				>= 0x9A and <= 0xB3 => (char)('A' + (b - 0x9A)),
				>= 0xB4 and <= 0xCD => (char)('a' + (b - 0xB4)),
				0xFF => ' ',
				0xCE => '\'',
				0xD0 => '.',
				0xD2 => ',',
				0xDA => '-',
				0xDB => '&',
				0xDC => ':',
				0xEB => '?',
				0xF7 => '!',
				_ => '?'  // Unknown character
			};

			sb.Append(c);
		}

		return sb.ToString().Trim();
	}

	private static void CreateTextFile(AssetCollection collection, string path, string[] entries, string name) {
		var sb = new StringBuilder();
		sb.AppendLine($"; {name}");
		sb.AppendLine($"; {entries.Length} entries");
		sb.AppendLine();

		for (var i = 0; i < entries.Length; i++) {
			sb.AppendLine($"{i:D3}: {entries[i]}");
		}

		collection.Add(new ExtractedAsset {
			Path = path,
			Type = "text",
			Name = name,
			Data = Encoding.UTF8.GetBytes(sb.ToString()),
			Format = "txt",
			Metadata = new Dictionary<string, object> {
				["count"] = entries.Length
			}
		});
	}

	private static void GenerateSourceFiles(AssetCollection collection) {
		var mainAsm = """
			; Final Fantasy Mystic Quest (SNES) - Main Assembly File
			; Auto-generated by GameInfoTools

			hirom

			org $008000
				; Reset vector points here
				; Main code start

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
			; Final Fantasy Mystic Quest Symbol Definitions
			; Format: LABEL = $ADDRESS

			; ROM Addresses (PC addresses)
			MonsterStatsTable   = $014275  ; 14 bytes per monster
			MonsterLevelTable   = $01417C  ; 3 bytes per monster
			WeaponTable         = $066000  ; 16 bytes per weapon
			ArmorTable          = $066100  ; 16 bytes per armor
			ItemTable           = $066380  ; 8 bytes per item
			SpellTable          = $066F00  ; 16 bytes per spell

			; RAM Addresses
			CurrentHp           = $7E0600
			MaxHp               = $7E0602
			CurrentMp           = $7E0604
			Gold                = $7E0650

			""";

		collection.Add(new ExtractedAsset {
			Path = "symbols/ffmq.sym",
			Type = "symbols",
			Name = "FFMQ Symbols",
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
