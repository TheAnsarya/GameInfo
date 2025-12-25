using DarkRepos.Core.Data;
using DarkRepos.Core.Models;
using DarkRepos.Core.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service to seed the database with sample data for development and testing.
/// </summary>
public class DatabaseSeeder {
	private readonly DarkReposDbContext _context;
	private readonly IGameInfoImportService? _importService;
	private readonly ILogger<DatabaseSeeder>? _logger;

	public DatabaseSeeder(DarkReposDbContext context) {
		_context = context;
	}

	public DatabaseSeeder(
		DarkReposDbContext context,
		IGameInfoImportService importService,
		ILogger<DatabaseSeeder>? logger = null) {
		_context = context;
		_importService = importService;
		_logger = logger;
	}

	/// <summary>
	/// Seeds the database with sample games and tools if empty.
	/// </summary>
	public async Task SeedAsync(CancellationToken cancellationToken = default) {
		// Only seed if database is empty
		if (await _context.Games.AnyAsync(cancellationToken))
			return;

		var games = GetSampleGames();
		var tools = GetSampleTools();

		await SeedGamesAndTools(games, tools, cancellationToken);
	}

	/// <summary>
	/// Seeds the database from a GameInfo repository.
	/// </summary>
	/// <param name="repositoryPath">Path to the GameInfo repository root.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Number of games imported.</returns>
	public async Task<int> SeedFromRepositoryAsync(string repositoryPath, CancellationToken cancellationToken = default) {
		if (_importService == null) {
			throw new InvalidOperationException("GameInfoImportService is required to seed from repository");
		}

		_logger?.LogInformation("Importing games from repository: {Path}", repositoryPath);

		var games = await _importService.ImportGamesAsync(repositoryPath);
		var tools = GetSampleTools(); // Still use sample tools for now

		_logger?.LogInformation("Discovered {Count} games", games.Count);

		// Clear existing data if seeding from repo
		await ClearDatabaseAsync(cancellationToken);

		await SeedGamesAndTools(games.ToList(), tools, cancellationToken);

		_logger?.LogInformation("Seeded {Count} games and {ToolCount} tools", games.Count, tools.Count);

		return games.Count;
	}

	/// <summary>
	/// Clears all games, tools, and search index entries from the database.
	/// </summary>
	public async Task ClearDatabaseAsync(CancellationToken cancellationToken = default) {
		_context.SearchIndex.RemoveRange(_context.SearchIndex);
		_context.Games.RemoveRange(_context.Games);
		_context.Tools.RemoveRange(_context.Tools);
		await _context.SaveChangesAsync(cancellationToken);
	}

	private async Task SeedGamesAndTools(List<Game> games, List<Tool> tools, CancellationToken cancellationToken) {
		// Add games
		foreach (var game in games) {
			var entity = game.ToEntity();
			_context.Games.Add(entity);
		}

		// Add tools
		foreach (var tool in tools) {
			var entity = tool.ToEntity();
			_context.Tools.Add(entity);
		}

		await _context.SaveChangesAsync(cancellationToken);

		// Index games for search
		foreach (var game in games) {
			var searchDoc = new SearchIndexEntry
			{
				DocumentId = $"game:{game.Slug}",
				DocumentType = "Game",
				Title = game.Title,
				Description = game.Description,
				Content = $"{game.Title} {game.JapaneseTitle} {string.Join(" ", game.AlternateTitles)} {game.Developer} {game.Publisher} {game.Genre}",
				Url = $"/games/{game.Slug}",
				Platform = game.Platform.ToString(),
				Tags = string.Join(" ", game.Tags),
				Boost = game.DocumentationLevel switch
				{
					DocumentationLevel.Complete => 2.0,
					DocumentationLevel.Substantial => 1.5,
					DocumentationLevel.Partial => 1.2,
					_ => 1.0
				}
			};
			_context.SearchIndex.Add(searchDoc);
		}

		// Index tools for search
		foreach (var tool in tools)
		{
			var searchDoc = new SearchIndexEntry
			{
				DocumentId = $"tool:{tool.Slug}",
				DocumentType = "Tool",
				Title = tool.Name,
				Description = tool.Description,
				Content = $"{tool.Name} {tool.Description} {string.Join(" ", tool.Tags)}",
				Url = $"/tools/{tool.Slug}",
				Category = tool.Category.ToString(),
				Tags = string.Join(" ", tool.Tags),
				Boost = 1.0
			};
			_context.SearchIndex.Add(searchDoc);
		}

		await _context.SaveChangesAsync(cancellationToken);
	}

	private static List<Game> GetSampleGames()
	{
		return
		[
			new Game
			{
				Slug = "dragon-warrior-nes",
				Title = "Dragon Warrior",
				Platform = Platform.NES,
				JapaneseTitle = "ドラゴンクエスト",
				AlternateTitles = ["Dragon Quest"],
				Developer = "Chunsoft",
				Publisher = "Enix",
				ReleaseYear = 1986,
				Genre = "RPG",
				Description = "The legendary RPG that started the Dragon Quest series. Explore the land of Alefgard, defeat monsters, and rescue Princess Gwaelin from the Dragonlord.",
				Series = "Dragon Quest",
				DocumentationLevel = DocumentationLevel.Complete,
				Tags = ["rpg", "dragon-quest", "classic", "jrpg"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = true,
					HasDataStructures = true,
					HasSystems = true,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_(NES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-7)
			},
			new Game
			{
				Slug = "dragon-warrior-2-nes",
				Title = "Dragon Warrior II",
				Platform = Platform.NES,
				JapaneseTitle = "ドラゴンクエストII 悪霊の神々",
				AlternateTitles = ["Dragon Quest II: Luminaries of the Legendary Line"],
				Developer = "Chunsoft",
				Publisher = "Enix",
				ReleaseYear = 1987,
				Genre = "RPG",
				Description = "The sequel expands the adventure with a party of three heroes, descendants of the legendary hero Erdrick.",
				Series = "Dragon Quest",
				DocumentationLevel = DocumentationLevel.Substantial,
				Tags = ["rpg", "dragon-quest", "jrpg"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = true,
					HasDataStructures = false,
					HasSystems = false,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_II_(NES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-14)
			},
			new Game
			{
				Slug = "dragon-warrior-3-nes",
				Title = "Dragon Warrior III",
				Platform = Platform.NES,
				JapaneseTitle = "ドラゴンクエストIII そして伝説へ…",
				AlternateTitles = ["Dragon Quest III: The Seeds of Salvation"],
				Developer = "Chunsoft",
				Publisher = "Enix",
				ReleaseYear = 1988,
				Genre = "RPG",
				Description = "Often considered the best Dragon Quest on NES. Features a class system and vast world to explore.",
				Series = "Dragon Quest",
				DocumentationLevel = DocumentationLevel.Substantial,
				Tags = ["rpg", "dragon-quest", "jrpg", "class-system"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = true,
					HasDataStructures = true,
					HasSystems = false,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_III_(NES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-21)
			},
			new Game
			{
				Slug = "dragon-warrior-4-nes",
				Title = "Dragon Warrior IV",
				Platform = Platform.NES,
				JapaneseTitle = "ドラゴンクエストIV 導かれし者たち",
				AlternateTitles = ["Dragon Quest IV: Chapters of the Chosen"],
				Developer = "Chunsoft",
				Publisher = "Enix",
				ReleaseYear = 1990,
				Genre = "RPG",
				Description = "The chapter-based Dragon Quest with unique storytelling. Follow multiple heroes before uniting them against the ultimate evil.",
				Series = "Dragon Quest",
				DocumentationLevel = DocumentationLevel.Partial,
				Tags = ["rpg", "dragon-quest", "jrpg", "chapter-based"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = true,
					HasDataStructures = false,
					HasSystems = false,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Warrior_IV_(NES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-3)
			},
			new Game
			{
				Slug = "final-fantasy-mystic-quest-snes",
				Title = "Final Fantasy Mystic Quest",
				Platform = Platform.SNES,
				JapaneseTitle = "ファイナルファンタジーUSA ミスティッククエスト",
				AlternateTitles = ["Mystic Quest Legend"],
				Developer = "Square",
				Publisher = "Square",
				ReleaseYear = 1992,
				Genre = "RPG",
				Description = "An entry-level RPG designed for Western audiences. Simple mechanics and great music make it a cult classic.",
				Series = "Final Fantasy",
				DocumentationLevel = DocumentationLevel.Complete,
				Tags = ["rpg", "final-fantasy", "jrpg", "beginner-friendly"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = true,
					HasDataStructures = true,
					HasSystems = true,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Final_Fantasy_Mystic_Quest_(SNES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-1)
			},
			new Game
			{
				Slug = "soul-blazer-snes",
				Title = "Soul Blazer",
				Platform = Platform.SNES,
				JapaneseTitle = "ソウルブレイダー",
				AlternateTitles = [],
				Developer = "Quintet",
				Publisher = "Enix",
				ReleaseYear = 1992,
				Genre = "Action RPG",
				Description = "An action RPG where you revive towns by defeating monsters. Part of Quintet's loose trilogy with Illusion of Gaia and Terranigma.",
				Series = "Soul Blazer",
				DocumentationLevel = DocumentationLevel.Partial,
				Tags = ["action-rpg", "quintet", "restoration"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = false,
					HasDataStructures = false,
					HasSystems = false,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Soul_Blazer_(SNES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-30)
			},
			new Game
			{
				Slug = "robotrek-snes",
				Title = "Robotrek",
				Platform = Platform.SNES,
				JapaneseTitle = "スラップスティック",
				AlternateTitles = ["Slapstick"],
				Developer = "Quintet",
				Publisher = "Enix",
				ReleaseYear = 1994,
				Genre = "RPG",
				Description = "Build and customize robots to fight battles in this unique RPG. Features invention system and quirky humor.",
				Series = null,
				DocumentationLevel = DocumentationLevel.Minimal,
				Tags = ["rpg", "robots", "quintet", "invention"],
				Wiki = new WikiResources
				{
					HasRomMap = false,
					HasRamMap = false,
					HasDataStructures = false,
					HasSystems = false,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Robotrek_(SNES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-60)
			},
			new Game
			{
				Slug = "dragon-quest-1-2-snes",
				Title = "Dragon Quest I・II",
				Platform = Platform.SNES,
				JapaneseTitle = "ドラゴンクエストI・II",
				AlternateTitles = ["Dragon Quest I & II"],
				Developer = "Chunsoft",
				Publisher = "Enix",
				ReleaseYear = 1993,
				Genre = "RPG",
				Description = "SNES remake bundling the first two Dragon Quest games with enhanced graphics and quality-of-life improvements.",
				Series = "Dragon Quest",
				DocumentationLevel = DocumentationLevel.Partial,
				Tags = ["rpg", "dragon-quest", "jrpg", "remake"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = false,
					HasDataStructures = false,
					HasSystems = false,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Quest_I_II_(SNES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-45)
			},
			new Game
			{
				Slug = "dragon-quest-3-snes",
				Title = "Dragon Quest III",
				Platform = Platform.SNES,
				JapaneseTitle = "ドラゴンクエストIII そして伝説へ…",
				AlternateTitles = ["Dragon Quest III: The Seeds of Salvation"],
				Developer = "Heart Beat",
				Publisher = "Enix",
				ReleaseYear = 1996,
				Genre = "RPG",
				Description = "The definitive version of Dragon Quest III with beautiful SNES graphics, enhanced class system, and new dungeons.",
				Series = "Dragon Quest",
				DocumentationLevel = DocumentationLevel.Substantial,
				Tags = ["rpg", "dragon-quest", "jrpg", "remake", "class-system"],
				Wiki = new WikiResources
				{
					HasRomMap = true,
					HasRamMap = true,
					HasDataStructures = true,
					HasSystems = false,
					HasNotes = true,
					WikiBaseUrl = "https://games.darkrepos.com/wiki/Dragon_Quest_III_(SNES)"
				},
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-10)
			}
		];
	}

	private static List<Tool> GetSampleTools()
	{
		return
		[
			new Tool
			{
				Slug = "rom-analyzer",
				Name = "ROM Analyzer",
				Description = "Analyze ROM files to identify data structures, compression methods, and potential code/data boundaries. Supports NES, SNES, and GB/GBC/GBA formats.",
				Category = ToolCategory.Analysis,
				Version = "1.2.0",
				Author = "GameInfo Project",
				RepositoryUrl = "https://github.com/kaelari/GameInfo",
				SupportedPlatforms = ["Windows", "Linux", "macOS"],
				Tags = ["analysis", "rom", "structures"],
				IsActive = true,
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-5)
			},
			new Tool
			{
				Slug = "tile-viewer",
				Name = "Tile Viewer",
				Description = "View and export graphics tiles from ROM files. Supports multiple tile formats including 2bpp, 4bpp, and planar graphics.",
				Category = ToolCategory.Graphics,
				Version = "2.0.0",
				Author = "GameInfo Project",
				RepositoryUrl = "https://github.com/kaelari/GameInfo",
				SupportedPlatforms = ["Windows", "Linux", "macOS"],
				Tags = ["graphics", "tiles", "viewer", "export"],
				IsActive = true,
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-10)
			},
			new Tool
			{
				Slug = "text-extractor",
				Name = "Text Extractor",
				Description = "Extract and dump text/dialog from ROM files using table files. Supports pointer tables and various text encoding schemes.",
				Category = ToolCategory.Text,
				Version = "1.5.0",
				Author = "GameInfo Project",
				RepositoryUrl = "https://github.com/kaelari/GameInfo",
				SupportedPlatforms = ["Windows", "Linux", "macOS"],
				Tags = ["text", "dialog", "extraction", "translation"],
				IsActive = true,
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-15)
			},
			new Tool
			{
				Slug = "disassembler",
				Name = "Smart Disassembler",
				Description = "Disassemble 6502/65816/Z80 code with automatic label generation and cross-reference analysis. Outputs ca65/bass compatible assembly.",
				Category = ToolCategory.Disassembly,
				Version = "3.0.0",
				Author = "GameInfo Project",
				RepositoryUrl = "https://github.com/kaelari/GameInfo",
				SupportedPlatforms = ["Windows", "Linux", "macOS"],
				Tags = ["disassembly", "6502", "65816", "z80", "assembly"],
				IsActive = true,
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-2)
			},
			new Tool
			{
				Slug = "cdl-tools",
				Name = "CDL Tools",
				Description = "Code/Data Logger tools for analyzing emulator CDL files. Helps identify code vs data regions for disassembly projects.",
				Category = ToolCategory.Analysis,
				Version = "1.0.0",
				Author = "GameInfo Project",
				RepositoryUrl = "https://github.com/kaelari/GameInfo",
				SupportedPlatforms = ["Windows", "Linux", "macOS"],
				Tags = ["cdl", "analysis", "emulator", "mesen"],
				IsActive = true,
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-20)
			},
			new Tool
			{
				Slug = "compression-toolkit",
				Name = "Compression Toolkit",
				Description = "Compress and decompress data using common retro game compression formats including RLE, LZ77, LZSS, and Huffman variants.",
				Category = ToolCategory.Compression,
				Version = "1.3.0",
				Author = "GameInfo Project",
				RepositoryUrl = "https://github.com/kaelari/GameInfo",
				SupportedPlatforms = ["Windows", "Linux", "macOS"],
				Tags = ["compression", "rle", "lz77", "lzss"],
				IsActive = true,
				LastUpdated = DateTimeOffset.UtcNow.AddDays(-25)
			}
		];
	}
}
