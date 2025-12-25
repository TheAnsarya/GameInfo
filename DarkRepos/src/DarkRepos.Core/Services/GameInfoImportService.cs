using DarkRepos.Core.Models;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service for importing game content from a GameInfo-style repository.
/// </summary>
public interface IGameInfoImportService {
	/// <summary>
	/// Discovers and imports all games from a repository path.
	/// </summary>
	/// <param name="repositoryPath">Root path to the GameInfo repository.</param>
	/// <returns>List of discovered games.</returns>
	Task<IReadOnlyList<Game>> ImportGamesAsync(string repositoryPath);

	/// <summary>
	/// Discovers games in the Games folder hierarchy.
	/// </summary>
	/// <param name="gamesPath">Path to the Games folder.</param>
	/// <returns>List of discovered games.</returns>
	Task<IReadOnlyList<Game>> DiscoverGamesAsync(string gamesPath);

	/// <summary>
	/// Discovers games from the docs folder structure.
	/// </summary>
	/// <param name="docsPath">Path to the docs folder.</param>
	/// <returns>List of games with documentation.</returns>
	Task<IReadOnlyList<Game>> DiscoverDocumentedGamesAsync(string docsPath);

	/// <summary>
	/// Parses a game folder name into game metadata.
	/// </summary>
	/// <param name="folderName">Folder name like "Dragon Warrior (NES)" or "dragon-warrior-nes".</param>
	/// <returns>Parsed game or null if invalid format.</returns>
	Game? ParseGameFolder(string folderName);
}

/// <summary>
/// Implementation of IGameInfoImportService.
/// </summary>
public class GameInfoImportService : IGameInfoImportService {
	private readonly IMarkdownService _markdownService;

	public GameInfoImportService(IMarkdownService markdownService) {
		_markdownService = markdownService;
	}

	public async Task<IReadOnlyList<Game>> ImportGamesAsync(string repositoryPath) {
		var games = new Dictionary<string, Game>();

		// Discover from Games folder
		var gamesPath = Path.Combine(repositoryPath, "Games");
		if (Directory.Exists(gamesPath)) {
			var gamesFromFolder = await DiscoverGamesAsync(gamesPath);
			foreach (var game in gamesFromFolder) {
				games[game.Slug] = game;
			}
		}

		// Enhance with documentation metadata
		var docsPath = Path.Combine(repositoryPath, "docs");
		if (Directory.Exists(docsPath)) {
			var gamesFromDocs = await DiscoverDocumentedGamesAsync(docsPath);
			foreach (var docGame in gamesFromDocs) {
				if (games.TryGetValue(docGame.Slug, out var existing)) {
					// Merge documentation info
					games[docGame.Slug] = MergeGameInfo(existing, docGame);
				} else {
					games[docGame.Slug] = docGame;
				}
			}
		}

		return games.Values.OrderBy(g => g.Title).ToList();
	}

	public Task<IReadOnlyList<Game>> DiscoverGamesAsync(string gamesPath) {
		var games = new List<Game>();

		// Platform folders: NES, SNES, GB, etc.
		foreach (var platformDir in Directory.EnumerateDirectories(gamesPath)) {
			var platformName = Path.GetFileName(platformDir);
			if (!TryParsePlatform(platformName, out var platform)) {
				continue;
			}

			// Game folders within platform
			foreach (var gameDir in Directory.EnumerateDirectories(platformDir)) {
				var gameFolderName = Path.GetFileName(gameDir);
				var game = ParseGameFolder(gameFolderName);
				if (game != null) {
					// Check for Wiki and Notes subfolders
					var wikiPath = Path.Combine(gameDir, "Wiki");
					var notesPath = Path.Combine(gameDir, "Notes");

					var hasRomMap = Directory.Exists(wikiPath) && HasWikiFile(wikiPath, "ROM");
					var hasRamMap = Directory.Exists(wikiPath) && HasWikiFile(wikiPath, "RAM");
					var hasDataStructures = Directory.Exists(wikiPath) && HasWikiFile(wikiPath, "Data", "Structure");
					var hasNotes = Directory.Exists(notesPath) && Directory.EnumerateFiles(notesPath).Any();

					games.Add(new Game {
						Slug = game.Slug,
						Title = game.Title,
						Platform = platform,
						Wiki = new WikiResources {
							HasRomMap = hasRomMap,
							HasRamMap = hasRamMap,
							HasDataStructures = hasDataStructures,
							HasNotes = hasNotes
						},
						DocumentationLevel = CalculateDocLevel(hasRomMap, hasRamMap, hasDataStructures, hasNotes)
					});
				}
			}
		}

		return Task.FromResult<IReadOnlyList<Game>>(games);
	}

	public async Task<IReadOnlyList<Game>> DiscoverDocumentedGamesAsync(string docsPath) {
		var games = new List<Game>();

		// Look for game-specific folders like "dragon-warrior-nes", "ffmq-snes"
		foreach (var docDir in Directory.EnumerateDirectories(docsPath)) {
			var folderName = Path.GetFileName(docDir);

			// Skip non-game folders
			if (folderName is "formats" or "guides" or "Build-Pipeline") {
				continue;
			}

			var game = ParseGameFolder(folderName);
			if (game != null) {
				// Check for README.md to get more info
				var readmePath = Path.Combine(docDir, "README.md");
				if (File.Exists(readmePath)) {
					var content = await File.ReadAllTextAsync(readmePath);
					game = EnrichFromMarkdown(game, content);
				}

				// Check for documentation files
				var hasRomMap = File.Exists(Path.Combine(docDir, "rom-map.md"));
				var hasRamMap = File.Exists(Path.Combine(docDir, "ram-map.md"));
				var hasDataStructures = File.Exists(Path.Combine(docDir, "data-structures.md"));
				var hasText = File.Exists(Path.Combine(docDir, "text-system.md"));

				games.Add(new Game {
					Slug = game.Slug,
					Title = game.Title,
					Platform = game.Platform,
					Developer = game.Developer,
					Publisher = game.Publisher,
					ReleaseYear = game.ReleaseYear,
					Series = game.Series,
					Genre = game.Genre,
					Description = game.Description,
					Wiki = new WikiResources {
						HasRomMap = hasRomMap,
						HasRamMap = hasRamMap,
						HasDataStructures = hasDataStructures,
						HasNotes = hasText
					},
					DocumentationPaths = GetDocumentationPaths(docDir),
					DocumentationLevel = CalculateDocLevel(hasRomMap, hasRamMap, hasDataStructures, hasText)
				});
			}
		}

		return games;
	}

	public Game? ParseGameFolder(string folderName) {
		// Try format: "Game Name (Platform)"
		var parenMatch = System.Text.RegularExpressions.Regex.Match(
			folderName, @"^(.+?)\s*\((\w+)\)$");

		if (parenMatch.Success) {
			var title = parenMatch.Groups[1].Value.Trim();
			var platformStr = parenMatch.Groups[2].Value;

			if (TryParsePlatform(platformStr, out var platform)) {
				return new Game {
					Slug = GenerateSlug(title, platform),
					Title = title,
					Platform = platform
				};
			}
		}

		// Try format: "game-name-platform" (kebab-case)
		var parts = folderName.Split('-');
		if (parts.Length >= 2) {
			var platformStr = parts[^1];
			if (TryParsePlatform(platformStr, out var platform)) {
				var titleParts = parts[..^1];
				var title = string.Join(" ", titleParts.Select(p =>
					char.ToUpper(p[0]) + p[1..]));

				return new Game {
					Slug = folderName.ToLowerInvariant(),
					Title = title,
					Platform = platform
				};
			}
		}

		return null;
	}

	private static bool TryParsePlatform(string str, out Platform platform) {
		str = str.ToUpperInvariant();
		platform = str switch {
			"NES" or "FAMICOM" => Platform.NES,
			"SNES" or "SFC" or "SUPERFAMICOM" => Platform.SNES,
			"GB" or "GAMEBOY" => Platform.GB,
			"GBC" => Platform.GBC,
			"GBA" => Platform.GBA,
			"N64" => Platform.N64,
			"GENESIS" or "MEGADRIVE" or "MD" => Platform.Genesis,
			"SMS" or "MASTERSYSTEM" => Platform.MasterSystem,
			"GG" or "GAMEGEAR" => Platform.GameGear,
			"PCE" or "PCENGINE" or "TURBOGRAFX" => Platform.PCEngine,
			"PSX" or "PS1" or "PLAYSTATION" => Platform.PlayStation,
			"PS2" or "PLAYSTATION2" => Platform.PlayStation2,
			"PSP" => Platform.PSP,
			"SATURN" => Platform.Saturn,
			"DREAMCAST" or "DC" => Platform.Dreamcast,
			"NEOGEO" or "MVS" or "AES" => Platform.NeoGeo,
			"ARCADE" => Platform.Arcade,
			_ => Platform.Unknown
		};
		return platform != Platform.Unknown;
	}

	private static string GenerateSlug(string title, Platform platform) {
		var slug = title.ToLowerInvariant()
			.Replace("'", "")
			.Replace("&", "and")
			.Replace(" - ", "-")
			.Replace(":", "")
			.Replace(" ", "-");

		// Remove consecutive dashes
		while (slug.Contains("--")) {
			slug = slug.Replace("--", "-");
		}

		return $"{slug}-{platform.ToString().ToLowerInvariant()}";
	}

	private static bool HasWikiFile(string wikiPath, params string[] keywords) {
		return Directory.EnumerateFiles(wikiPath, "*.wikitxt")
			.Concat(Directory.EnumerateFiles(wikiPath, "*.wikitext"))
			.Any(f => {
				var name = Path.GetFileName(f).ToLowerInvariant();
				return keywords.Any(k => name.Contains(k.ToLowerInvariant()));
			});
	}

	private Game EnrichFromMarkdown(Game game, string markdownContent) {
		// Extract metadata from markdown front matter or content
		var (frontMatter, _) = _markdownService.ParseFrontMatter(markdownContent);

		string? developer = game.Developer;
		string? publisher = game.Publisher;
		int? releaseYear = game.ReleaseYear;
		string? series = game.Series;
		string? genre = game.Genre;
		string? description = game.Description;

		if (frontMatter.TryGetValue("developer", out var dev)) {
			developer = dev;
		}
		if (frontMatter.TryGetValue("publisher", out var pub)) {
			publisher = pub;
		}
		if (frontMatter.TryGetValue("year", out var yearStr) && int.TryParse(yearStr, out var year)) {
			releaseYear = year;
		}
		if (frontMatter.TryGetValue("series", out var seriesVal)) {
			series = seriesVal;
		}
		if (frontMatter.TryGetValue("genre", out var genreVal)) {
			genre = genreVal;
		}

		// Try to extract description from content
		var excerpt = _markdownService.ExtractExcerpt(markdownContent, 200);
		if (!string.IsNullOrEmpty(excerpt)) {
			description = excerpt;
		}

		return new Game {
			Slug = game.Slug,
			Title = game.Title,
			Platform = game.Platform,
			Developer = developer,
			Publisher = publisher,
			ReleaseYear = releaseYear,
			Series = series,
			Genre = genre,
			Description = description
		};
	}

	private static string[] GetDocumentationPaths(string docDir) {
		return Directory.EnumerateFiles(docDir, "*.md")
			.Select(f => Path.GetFileName(f))
			.Where(f => f != "README.md")
			.ToArray();
	}

	private static DocumentationLevel CalculateDocLevel(bool hasRomMap, bool hasRamMap, bool hasDataStructures, bool hasNotes) {
		var score = 0;
		if (hasRomMap) score += 2;
		if (hasRamMap) score += 2;
		if (hasDataStructures) score += 1;
		if (hasNotes) score += 1;

		return score switch {
			0 => DocumentationLevel.None,
			1 => DocumentationLevel.Minimal,
			2 or 3 => DocumentationLevel.Partial,
			4 or 5 => DocumentationLevel.Substantial,
			_ => DocumentationLevel.Complete
		};
	}

	private static Game MergeGameInfo(Game existing, Game fromDocs) {
		return new Game {
			Slug = existing.Slug,
			Title = existing.Title,
			Platform = existing.Platform,
			Developer = fromDocs.Developer ?? existing.Developer,
			Publisher = fromDocs.Publisher ?? existing.Publisher,
			ReleaseYear = fromDocs.ReleaseYear ?? existing.ReleaseYear,
			Series = fromDocs.Series ?? existing.Series,
			Genre = fromDocs.Genre ?? existing.Genre,
			Description = fromDocs.Description ?? existing.Description,
			DocumentationPaths = existing.DocumentationPaths.Union(fromDocs.DocumentationPaths).ToArray(),
			Wiki = new WikiResources {
				HasRomMap = existing.Wiki.HasRomMap || fromDocs.Wiki.HasRomMap,
				HasRamMap = existing.Wiki.HasRamMap || fromDocs.Wiki.HasRamMap,
				HasDataStructures = existing.Wiki.HasDataStructures || fromDocs.Wiki.HasDataStructures,
				HasNotes = existing.Wiki.HasNotes || fromDocs.Wiki.HasNotes,
				HasSystems = existing.Wiki.HasSystems || fromDocs.Wiki.HasSystems
			},
			DocumentationLevel = (DocumentationLevel)Math.Max((int)existing.DocumentationLevel, (int)fromDocs.DocumentationLevel)
		};
	}
}
