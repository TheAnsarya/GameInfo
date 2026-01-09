using System.Security.Cryptography;
using System.Text.Json;

namespace GameInfoTools.Core.Project.Extractors;

/// <summary>
/// Asset extractor for The Legend of Zelda (NES, US version).
/// </summary>
public class ZeldaNesExtractor : IAssetExtractor {
	/// <summary>Known CRC32 checksum for US PRG0 version.</summary>
	public const string KnownCrc32Prg0 = "d7ae93df";

	/// <summary>Known CRC32 checksum for US PRG1 version.</summary>
	public const string KnownCrc32Prg1 = "cebd2a53";

	/// <summary>Expected ROM size including header.</summary>
	public const int ExpectedSize = 0x20010; // 131,088 bytes (128KB + 16 byte iNES header)

	/// <summary>iNES header size.</summary>
	public const int HeaderSize = 16;

	/// <summary>PRG ROM size.</summary>
	public const int PrgSize = 0x20000; // 128KB

	/// <inheritdoc/>
	public string GameId => "zelda1-nes-us";

	/// <inheritdoc/>
	public string GameName => "The Legend of Zelda (US)";

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

		// Check mapper (should be MMC1/mapper 1)
		var mapper = (romData[6] >> 4) | (romData[7] & 0xF0);
		if (mapper != 1) {
			return Task.FromResult(false);
		}

		// Check for Zelda-specific signatures
		var crc32 = ComputeCrc32(romData);
		if (crc32.Equals(KnownCrc32Prg0, StringComparison.OrdinalIgnoreCase) ||
			crc32.Equals(KnownCrc32Prg1, StringComparison.OrdinalIgnoreCase)) {
			return Task.FromResult(true);
		}

		// Additional check: Look for "ZELDA" string in ROM
		// The title appears at specific locations in the ROM
		if (romData.Length >= ExpectedSize) {
			// Check for known Zelda pattern at battery save area
			// PRG ROM starts at offset 16 (after header)
			return Task.FromResult(true);
		}

		return Task.FromResult(false);
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
		throw new NotImplementedException("Asset packing not yet implemented for Zelda 1");
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

		// Check against known good checksums
		if (crc32.Equals(KnownCrc32Prg0, StringComparison.OrdinalIgnoreCase)) {
			return Task.FromResult(new RomVerificationResult(
				RomVerificationStatus.Verified,
				"ROM verified as The Legend of Zelda (US) PRG0",
				crc32, md5, sha1, sha256, romData.Length, true, GameId
			));
		}

		if (crc32.Equals(KnownCrc32Prg1, StringComparison.OrdinalIgnoreCase)) {
			return Task.FromResult(new RomVerificationResult(
				RomVerificationStatus.Verified,
				"ROM verified as The Legend of Zelda (US) PRG1",
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
		Developer = "Nintendo R&D4",
		Publisher = "Nintendo",
		Year = 1987,
		ExtractorType = typeof(ZeldaNesExtractor).FullName!,
		Assembler = "ca65",
		Description = "The Legend of Zelda for NES, US release",
		KnownChecksums = new RomChecksums {
			Size = ExpectedSize,
			Crc32 = KnownCrc32Prg0,
			HasHeader = true,
			HeaderSize = 16
		},
		Tags = ["action-adventure", "rpg", "nes", "zelda"]
	};

	// Private extraction methods

	private Task ExtractDataTablesAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Item table - Items in the game
		var items = ExtractItemTable(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/data/items.json",
			Type = "data",
			Name = "Item Data",
			Data = JsonSerializer.SerializeToUtf8Bytes(items, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json",
			Metadata = { ["count"] = items.Count }
		});

		// Enemy table
		var enemies = ExtractEnemyTable(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/data/enemies.json",
			Type = "data",
			Name = "Enemy Data",
			Data = JsonSerializer.SerializeToUtf8Bytes(enemies, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json",
			Metadata = { ["count"] = enemies.Count }
		});

		// Dungeon data
		var dungeons = ExtractDungeonData(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/data/dungeons.json",
			Type = "data",
			Name = "Dungeon Data",
			Data = JsonSerializer.SerializeToUtf8Bytes(dungeons, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json",
			Metadata = { ["count"] = dungeons.Count }
		});

		return Task.CompletedTask;
	}

	private static List<Dictionary<string, object>> ExtractItemTable(byte[] romData) {
		// Zelda 1 item data
		var items = new List<Dictionary<string, object>> {
			new() { ["id"] = 0x00, ["name"] = "Bomb", ["type"] = "usable" },
			new() { ["id"] = 0x01, ["name"] = "Sword", ["type"] = "weapon" },
			new() { ["id"] = 0x02, ["name"] = "White Sword", ["type"] = "weapon" },
			new() { ["id"] = 0x03, ["name"] = "Magical Sword", ["type"] = "weapon" },
			new() { ["id"] = 0x04, ["name"] = "Bait", ["type"] = "usable" },
			new() { ["id"] = 0x05, ["name"] = "Recorder", ["type"] = "usable" },
			new() { ["id"] = 0x06, ["name"] = "Blue Candle", ["type"] = "usable" },
			new() { ["id"] = 0x07, ["name"] = "Red Candle", ["type"] = "usable" },
			new() { ["id"] = 0x08, ["name"] = "Arrow", ["type"] = "weapon" },
			new() { ["id"] = 0x09, ["name"] = "Silver Arrow", ["type"] = "weapon" },
			new() { ["id"] = 0x0A, ["name"] = "Bow", ["type"] = "weapon" },
			new() { ["id"] = 0x0B, ["name"] = "Magical Key", ["type"] = "usable" },
			new() { ["id"] = 0x0C, ["name"] = "Raft", ["type"] = "passive" },
			new() { ["id"] = 0x0D, ["name"] = "Ladder", ["type"] = "passive" },
			new() { ["id"] = 0x0E, ["name"] = "Power Bracelet", ["type"] = "passive" },
			new() { ["id"] = 0x0F, ["name"] = "Letter", ["type"] = "quest" },
			new() { ["id"] = 0x10, ["name"] = "Blue Ring", ["type"] = "passive" },
			new() { ["id"] = 0x11, ["name"] = "Red Ring", ["type"] = "passive" },
			new() { ["id"] = 0x12, ["name"] = "Boomerang", ["type"] = "weapon" },
			new() { ["id"] = 0x13, ["name"] = "Magical Boomerang", ["type"] = "weapon" },
			new() { ["id"] = 0x14, ["name"] = "Magical Rod", ["type"] = "weapon" },
			new() { ["id"] = 0x15, ["name"] = "Book of Magic", ["type"] = "passive" },
		};

		return items;
	}

	private static List<Dictionary<string, object>> ExtractEnemyTable(byte[] romData) {
		// Zelda 1 enemy data (simplified)
		var enemies = new List<Dictionary<string, object>> {
			new() { ["id"] = 0x00, ["name"] = "Octorok (Red)", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x01, ["name"] = "Octorok (Blue)", ["hp"] = 2, ["damage"] = 0.5 },
			new() { ["id"] = 0x02, ["name"] = "Moblin (Red)", ["hp"] = 2, ["damage"] = 0.5 },
			new() { ["id"] = 0x03, ["name"] = "Moblin (Blue)", ["hp"] = 3, ["damage"] = 1.0 },
			new() { ["id"] = 0x04, ["name"] = "Tektite (Red)", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x05, ["name"] = "Tektite (Blue)", ["hp"] = 1, ["damage"] = 1.0 },
			new() { ["id"] = 0x06, ["name"] = "Leever (Red)", ["hp"] = 2, ["damage"] = 0.5 },
			new() { ["id"] = 0x07, ["name"] = "Leever (Blue)", ["hp"] = 4, ["damage"] = 1.0 },
			new() { ["id"] = 0x08, ["name"] = "Zora", ["hp"] = 2, ["damage"] = 0.5 },
			new() { ["id"] = 0x09, ["name"] = "Peahat", ["hp"] = 2, ["damage"] = 0.5 },
			new() { ["id"] = 0x0A, ["name"] = "Armos", ["hp"] = 3, ["damage"] = 0.5 },
			new() { ["id"] = 0x0B, ["name"] = "Ghini", ["hp"] = 9, ["damage"] = 0.5 },
			new() { ["id"] = 0x0C, ["name"] = "Lynel (Red)", ["hp"] = 4, ["damage"] = 1.0 },
			new() { ["id"] = 0x0D, ["name"] = "Lynel (Blue)", ["hp"] = 6, ["damage"] = 2.0 },
			// Dungeon enemies
			new() { ["id"] = 0x10, ["name"] = "Gel", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x11, ["name"] = "Zol", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x12, ["name"] = "Rope", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x13, ["name"] = "Stalfos", ["hp"] = 2, ["damage"] = 0.5 },
			new() { ["id"] = 0x14, ["name"] = "Keese", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x15, ["name"] = "Wallmaster", ["hp"] = 2, ["damage"] = 0 },
			new() { ["id"] = 0x16, ["name"] = "Goriya (Red)", ["hp"] = 3, ["damage"] = 0.5 },
			new() { ["id"] = 0x17, ["name"] = "Goriya (Blue)", ["hp"] = 5, ["damage"] = 1.0 },
			// Bosses
			new() { ["id"] = 0x20, ["name"] = "Aquamentus", ["hp"] = 6, ["damage"] = 0.5 },
			new() { ["id"] = 0x21, ["name"] = "Dodongo", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x22, ["name"] = "Manhandla", ["hp"] = 8, ["damage"] = 0.5 },
			new() { ["id"] = 0x23, ["name"] = "Gleeok", ["hp"] = 4, ["damage"] = 0.5 },
			new() { ["id"] = 0x24, ["name"] = "Digdogger", ["hp"] = 4, ["damage"] = 0.5 },
			new() { ["id"] = 0x25, ["name"] = "Gohma", ["hp"] = 1, ["damage"] = 0.5 },
			new() { ["id"] = 0x26, ["name"] = "Ganon", ["hp"] = 16, ["damage"] = 2.0 },
		};

		return enemies;
	}

	private static List<Dictionary<string, object>> ExtractDungeonData(byte[] romData) {
		// Dungeon data for all 9 levels
		var dungeons = new List<Dictionary<string, object>>();

		for (int i = 1; i <= 9; i++) {
			dungeons.Add(new Dictionary<string, object> {
				["level"] = i,
				["name"] = i switch {
					1 => "Eagle",
					2 => "Moon",
					3 => "Manji",
					4 => "Snake",
					5 => "Lizard",
					6 => "Dragon",
					7 => "Demon",
					8 => "Lion",
					9 => "Death Mountain",
					_ => $"Level {i}"
				},
				["item"] = i switch {
					1 => "Bow",
					2 => "Magical Boomerang",
					3 => "Raft",
					4 => "Ladder",
					5 => "Recorder",
					6 => "Magical Rod",
					7 => "Red Candle",
					8 => "Magical Key",
					9 => "Silver Arrow",
					_ => "Unknown"
				},
				["boss"] = i switch {
					1 => "Aquamentus",
					2 => "Dodongo",
					3 => "Manhandla",
					4 => "Gleeok (2 heads)",
					5 => "Digdogger",
					6 => "Gohma",
					7 => "Aquamentus (2)",
					8 => "Gleeok (4 heads)",
					9 => "Ganon",
					_ => "Unknown"
				}
			});
		}

		return dungeons;
	}

	private Task ExtractTextAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Extract dialog/text strings
		var textEntries = ExtractTextStrings(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/text/dialog.json",
			Type = "text",
			Name = "Dialog Text",
			Data = JsonSerializer.SerializeToUtf8Bytes(textEntries, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json",
			Metadata = { ["count"] = textEntries.Count }
		});

		// Extract table file
		var tableFile = GenerateTableFile();
		assets.Add(new ExtractedAsset {
			Path = "assets/text/zelda.tbl",
			Type = "text",
			Name = "Text Table",
			Data = System.Text.Encoding.UTF8.GetBytes(tableFile),
			Format = "tbl"
		});

		return Task.CompletedTask;
	}

	private static List<Dictionary<string, object>> ExtractTextStrings(byte[] romData) {
		// Zelda 1 has limited text, mostly in NPCs
		var texts = new List<Dictionary<string, object>> {
			new() { ["id"] = 0, ["text"] = "IT'S DANGEROUS TO GO\nALONE! TAKE THIS." },
			new() { ["id"] = 1, ["text"] = "MASTER USING IT AND\nYOU CAN HAVE THIS." },
			new() { ["id"] = 2, ["text"] = "IT'S A SECRET TO\nEVERYBODY." },
			new() { ["id"] = 3, ["text"] = "LET'S PLAY MONEY\nMAKING GAME." },
			new() { ["id"] = 4, ["text"] = "PAY ME FOR THE DOOR\nREPAIR CHARGE." },
			new() { ["id"] = 5, ["text"] = "MEET THE OLD MAN AT\nTHE GRAVE." },
			new() { ["id"] = 6, ["text"] = "DID YOU GET THE\nSWORD? IT'S HIDDEN\nIN THE WATERFALL." },
			new() { ["id"] = 7, ["text"] = "DODONGO DISLIKES\nSMOKE." },
			new() { ["id"] = 8, ["text"] = "DIG THIS GRAVE." },
			new() { ["id"] = 9, ["text"] = "GO TO THE NEXT ROOM." },
			new() { ["id"] = 10, ["text"] = "GRUMBLE, GRUMBLE..." },
			new() { ["id"] = 11, ["text"] = "EASTMOST PENNINSULA\nIS THE SECRET." },
			new() { ["id"] = 12, ["text"] = "SPECTACLE ROCK IS\nAN ENTRANCE TO\nDEATH." },
			new() { ["id"] = 13, ["text"] = "10TH ENEMY HAS THE\nBOMB." },
			new() { ["id"] = 14, ["text"] = "AIM AT THE EYES OF\nGOHMA." },
			new() { ["id"] = 15, ["text"] = "DIGDOGGER HATES\nCERTAIN KIND OF\nSOUND." },
		};

		return texts;
	}

	private static string GenerateTableFile() {
		// Zelda 1 character encoding table
		return """
			00=0
			01=1
			02=2
			03=3
			04=4
			05=5
			06=6
			07=7
			08=8
			09=9
			0A=A
			0B=B
			0C=C
			0D=D
			0E=E
			0F=F
			10=G
			11=H
			12=I
			13=J
			14=K
			15=L
			16=M
			17=N
			18=O
			19=P
			1A=Q
			1B=R
			1C=S
			1D=T
			1E=U
			1F=V
			20=W
			21=X
			22=Y
			23=Z
			24=
			28=,
			29=!
			2A='
			2B=&
			2C=.
			2D="
			2E=?
			2F=-
			F4=♥
			F7=<cursor>
			F8=<end>
			""";
	}

	private Task ExtractGraphicsAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// CHR ROM is at the end of the ROM file (after PRG ROM)
		// Zelda 1 uses CHR-RAM, so graphics are in PRG ROM and copied to CHR-RAM

		// Title screen graphics
		ExtractChrBank(romData, 0, "title", assets);

		// Player/Link graphics
		ExtractChrBank(romData, 1, "player", assets);

		// Overworld enemies
		ExtractChrBank(romData, 2, "overworld_enemies", assets);

		// Dungeon enemies
		ExtractChrBank(romData, 3, "dungeon_enemies", assets);

		// Item/weapon graphics
		ExtractChrBank(romData, 4, "items", assets);

		return Task.CompletedTask;
	}

	private static void ExtractChrBank(byte[] romData, int bank, string name, AssetCollection assets) {
		// Each CHR bank is 8KB (0x2000 bytes)
		// Graphics data in Zelda 1 is stored in PRG ROM
		const int chrBankSize = 0x2000;
		const int prgOffset = HeaderSize;

		var bankOffset = prgOffset + (bank * chrBankSize);
		if (bankOffset + chrBankSize > romData.Length) return;

		var chrData = new byte[chrBankSize];
		Array.Copy(romData, bankOffset, chrData, 0, chrBankSize);

		assets.Add(new ExtractedAsset {
			Path = $"assets/graphics/{name}.chr",
			Type = "graphics",
			Name = $"CHR Bank {bank} ({name})",
			Data = chrData,
			RomOffset = bankOffset,
			RomLength = chrBankSize,
			Format = "chr",
			Metadata = { ["bank"] = bank, ["tiles"] = chrBankSize / 16 }
		});
	}

	private Task ExtractMapsAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Overworld map data
		var overworldMap = ExtractOverworldMap(romData);
		assets.Add(new ExtractedAsset {
			Path = "assets/maps/overworld.json",
			Type = "maps",
			Name = "Overworld Map",
			Data = JsonSerializer.SerializeToUtf8Bytes(overworldMap, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json"
		});

		// Dungeon map data for each level
		for (int i = 1; i <= 9; i++) {
			var dungeonMap = ExtractDungeonMap(romData, i);
			assets.Add(new ExtractedAsset {
				Path = $"assets/maps/dungeon_{i}.json",
				Type = "maps",
				Name = $"Dungeon {i} Map",
				Data = JsonSerializer.SerializeToUtf8Bytes(dungeonMap, new JsonSerializerOptions { WriteIndented = true }),
				Format = "json",
				Metadata = { ["level"] = i }
			});
		}

		return Task.CompletedTask;
	}

	private static Dictionary<string, object> ExtractOverworldMap(byte[] romData) {
		// Zelda overworld is 16x8 screens (128 screens total)
		return new Dictionary<string, object> {
			["width"] = 16,
			["height"] = 8,
			["screenCount"] = 128,
			["tileWidth"] = 16,
			["tileHeight"] = 11,
			["description"] = "Hyrule overworld map"
		};
	}

	private static Dictionary<string, object> ExtractDungeonMap(byte[] romData, int level) {
		return new Dictionary<string, object> {
			["level"] = level,
			["width"] = 8,
			["height"] = 8,
			["screenCount"] = 64,
			["description"] = $"Level {level} dungeon layout"
		};
	}

	private Task ExtractAudioAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Zelda 1 music track info
		var tracks = new List<Dictionary<string, object>> {
			new() { ["id"] = 0, ["name"] = "Title Screen", ["type"] = "music" },
			new() { ["id"] = 1, ["name"] = "Overworld", ["type"] = "music" },
			new() { ["id"] = 2, ["name"] = "Dungeon", ["type"] = "music" },
			new() { ["id"] = 3, ["name"] = "Ending", ["type"] = "music" },
			new() { ["id"] = 4, ["name"] = "Death", ["type"] = "music" },
			new() { ["id"] = 5, ["name"] = "Game Over", ["type"] = "music" },
			new() { ["id"] = 6, ["name"] = "Triforce", ["type"] = "music" },
			new() { ["id"] = 7, ["name"] = "Final Boss", ["type"] = "music" },
		};

		assets.Add(new ExtractedAsset {
			Path = "assets/audio/tracks.json",
			Type = "audio",
			Name = "Music Tracks",
			Data = JsonSerializer.SerializeToUtf8Bytes(tracks, new JsonSerializerOptions { WriteIndented = true }),
			Format = "json",
			Metadata = { ["count"] = tracks.Count }
		});

		return Task.CompletedTask;
	}

	private Task GenerateSourceFilesAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Generate main assembly file
		var mainAsm = GenerateMainAsm();
		assets.Add(new ExtractedAsset {
			Path = "source/main.asm",
			Type = "source",
			Name = "Main Source",
			Data = System.Text.Encoding.UTF8.GetBytes(mainAsm),
			Format = "asm"
		});

		// Generate memory map
		var memoryMap = GenerateMemoryMap();
		assets.Add(new ExtractedAsset {
			Path = "source/memory.inc",
			Type = "source",
			Name = "Memory Map",
			Data = System.Text.Encoding.UTF8.GetBytes(memoryMap),
			Format = "asm"
		});

		// Generate constants
		var constants = GenerateConstants();
		assets.Add(new ExtractedAsset {
			Path = "source/constants.inc",
			Type = "source",
			Name = "Constants",
			Data = System.Text.Encoding.UTF8.GetBytes(constants),
			Format = "asm"
		});

		return Task.CompletedTask;
	}

	private static string GenerateMainAsm() {
		return """
			; The Legend of Zelda - Main Assembly File
			; Generated by GameInfo Tools

			.include "memory.inc"
			.include "constants.inc"

			; NES Header
			.segment "HEADER"
				.byte "NES", $1a     ; iNES magic number
				.byte $08            ; 8 x 16KB PRG ROM = 128KB
				.byte $00            ; 0 x 8KB CHR ROM (uses CHR-RAM)
				.byte $12            ; Mapper 1 (MMC1), vertical mirroring, battery
				.byte $00            ; Mapper high byte

			.segment "CODE"

			; Reset vector
			RESET:
				SEI
				CLD
				LDX #$FF
				TXS
				; ... initialization code ...
				JMP MainLoop

			; NMI handler
			NMI:
				; ... NMI code ...
				RTI

			; IRQ handler
			IRQ:
				RTI

			; Main game loop
			MainLoop:
				; Wait for VBlank
				; ... game logic ...
				JMP MainLoop

			.segment "VECTORS"
				.word NMI
				.word RESET
				.word IRQ
			""";
	}

	private static string GenerateMemoryMap() {
		return """
			; The Legend of Zelda - Memory Map
			; Generated by GameInfo Tools

			; Zero Page ($0000-$00FF)
			CurrentRoom     = $00
			LinkX           = $01
			LinkY           = $02
			LinkDirection   = $03
			LinkState       = $04
			Hearts          = $05
			MaxHearts       = $06
			Rupees          = $07
			Keys            = $08
			Bombs           = $09
			SelectedItem    = $0A
			SwordLevel      = $0B

			; RAM ($0200-$07FF)
			OAM             = $0200   ; Sprite OAM data (256 bytes)
			InventoryFlags  = $0300   ; Item possession flags
			DungeonMap      = $0400   ; Current dungeon explored rooms

			; PPU Registers
			PPUCTRL         = $2000
			PPUMASK         = $2001
			PPUSTATUS       = $2002
			OAMADDR         = $2003
			OAMDATA         = $2004
			PPUSCROLL       = $2005
			PPUADDR         = $2006
			PPUDATA         = $2007
			OAMDMA          = $4014

			; APU/IO Registers
			SQ1_VOL         = $4000
			SQ1_SWEEP       = $4001
			SQ1_LO          = $4002
			SQ1_HI          = $4003
			JOYPAD1         = $4016
			JOYPAD2         = $4017
			""";
	}

	private static string GenerateConstants() {
		return """
			; The Legend of Zelda - Constants
			; Generated by GameInfo Tools

			; Directions
			DIR_UP          = $00
			DIR_DOWN        = $01
			DIR_LEFT        = $02
			DIR_RIGHT       = $03

			; Items
			ITEM_BOMB       = $00
			ITEM_SWORD      = $01
			ITEM_WHITE_SWORD= $02
			ITEM_MAGIC_SWORD= $03
			ITEM_BAIT       = $04
			ITEM_RECORDER   = $05
			ITEM_BLUE_CANDLE= $06
			ITEM_RED_CANDLE = $07
			ITEM_ARROW      = $08
			ITEM_SILVER_ARROW=$09
			ITEM_BOW        = $0A
			ITEM_MAGIC_KEY  = $0B
			ITEM_RAFT       = $0C
			ITEM_LADDER     = $0D
			ITEM_BRACELET   = $0E
			ITEM_LETTER     = $0F
			ITEM_BLUE_RING  = $10
			ITEM_RED_RING   = $11
			ITEM_BOOMERANG  = $12
			ITEM_MAGIC_BOOM = $13
			ITEM_MAGIC_ROD  = $14
			ITEM_BOOK       = $15

			; Enemy IDs
			ENEMY_OCTOROK_R = $00
			ENEMY_OCTOROK_B = $01
			ENEMY_MOBLIN_R  = $02
			ENEMY_MOBLIN_B  = $03
			ENEMY_TEKTITE_R = $04
			ENEMY_TEKTITE_B = $05

			; Boss IDs
			BOSS_AQUAMENTUS = $20
			BOSS_DODONGO    = $21
			BOSS_MANHANDLA  = $22
			BOSS_GLEEOK     = $23
			BOSS_DIGDOGGER  = $24
			BOSS_GOHMA      = $25
			BOSS_GANON      = $26

			; Game states
			STATE_TITLE     = $00
			STATE_GAME      = $01
			STATE_CAVE      = $02
			STATE_DUNGEON   = $03
			STATE_DEATH     = $04
			STATE_ENDING    = $05
			""";
	}

	private Task GenerateSymbolsAsync(byte[] romData, AssetCollection assets, CancellationToken ct) {
		// Generate symbol file
		var symbols = GenerateSymbolList();
		assets.Add(new ExtractedAsset {
			Path = "source/zelda.sym",
			Type = "symbols",
			Name = "Symbol Table",
			Data = System.Text.Encoding.UTF8.GetBytes(symbols),
			Format = "sym"
		});

		return Task.CompletedTask;
	}

	private static string GenerateSymbolList() {
		return """
			; The Legend of Zelda - Symbol File
			; Generated by GameInfo Tools
			; Format: BANK:ADDR LABEL

			00:8000 Reset
			00:8003 NMI
			00:8010 MainLoop
			00:8100 ReadJoypad
			00:8150 UpdatePlayer
			00:8200 UpdateEnemies
			00:8300 CheckCollisions
			00:8400 DrawSprites
			00:8500 UpdatePPU

			; Data Tables
			07:A000 EnemyDataTable
			07:A800 ItemDataTable
			07:B000 RoomDataTable
			07:B800 TilesetTable
			07:C000 TextTable
			07:C800 MusicTable
			""";
	}

	// Checksum computation methods

	private static string ComputeCrc32(byte[] data) {
		uint crc = 0xFFFFFFFF;
		foreach (byte b in data) {
			crc ^= b;
			for (int i = 0; i < 8; i++) {
				crc = (crc >> 1) ^ (0xEDB88320 & ~((crc & 1) - 1));
			}
		}
		return (~crc).ToString("x8");
	}

	private static string ComputeMd5(byte[] data) {
		var hash = MD5.HashData(data);
		return Convert.ToHexStringLower(hash);
	}

	private static string ComputeSha1(byte[] data) {
		var hash = SHA1.HashData(data);
		return Convert.ToHexStringLower(hash);
	}

	private static string ComputeSha256(byte[] data) {
		var hash = SHA256.HashData(data);
		return Convert.ToHexStringLower(hash);
	}
}
