using System.Text.Json;
using DarkRepos.Core.Models;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service for loading and parsing game metadata from JSON files.
/// </summary>
public interface IGameMetadataService
{
	/// <summary>
	/// Loads game metadata from a JSON file.
	/// </summary>
	/// <param name="jsonPath">Path to the JSON file.</param>
	/// <returns>The parsed Game object.</returns>
	Task<Game?> LoadGameAsync(string jsonPath);

	/// <summary>
	/// Loads all games from a directory containing JSON metadata files.
	/// </summary>
	/// <param name="directoryPath">Path to the directory.</param>
	/// <returns>List of parsed Game objects.</returns>
	Task<IReadOnlyList<Game>> LoadAllGamesAsync(string directoryPath);

	/// <summary>
	/// Loads game metadata from JSON content.
	/// </summary>
	/// <param name="jsonContent">The JSON content string.</param>
	/// <returns>The parsed Game object.</returns>
	Game? ParseGame(string jsonContent);

	/// <summary>
	/// Validates game metadata JSON against expected schema.
	/// </summary>
	/// <param name="jsonContent">The JSON content to validate.</param>
	/// <returns>Tuple of (isValid, errors).</returns>
	(bool IsValid, List<string> Errors) ValidateGameJson(string jsonContent);

	/// <summary>
	/// Exports a Game object to JSON.
	/// </summary>
	/// <param name="game">The game to export.</param>
	/// <param name="indented">Whether to format with indentation.</param>
	/// <returns>JSON string representation.</returns>
	string ExportToJson(Game game, bool indented = true);
}

/// <summary>
/// Implementation of game metadata loading and parsing.
/// </summary>
public class GameMetadataService : IGameMetadataService
{
	private static readonly JsonSerializerOptions s_jsonOptions = new()
	{
		PropertyNameCaseInsensitive = true,
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		AllowTrailingCommas = true,
		ReadCommentHandling = JsonCommentHandling.Skip,
		Converters = { new System.Text.Json.Serialization.JsonStringEnumConverter() }
	};

	/// <inheritdoc />
	public async Task<Game?> LoadGameAsync(string jsonPath)
	{
		if (!File.Exists(jsonPath))
			return null;

		var jsonContent = await File.ReadAllTextAsync(jsonPath);
		return ParseGame(jsonContent);
	}

	/// <inheritdoc />
	public async Task<IReadOnlyList<Game>> LoadAllGamesAsync(string directoryPath)
	{
		var games = new List<Game>();

		if (!Directory.Exists(directoryPath))
			return games;

		var jsonFiles = Directory.GetFiles(directoryPath, "*.json", SearchOption.AllDirectories);

		foreach (var file in jsonFiles)
		{
			try
			{
				var game = await LoadGameAsync(file);
				if (game != null)
				{
					games.Add(game);
				}
			}
			catch (JsonException)
			{
				// Log and skip invalid files
				continue;
			}
		}

		return games.OrderBy(g => g.Title).ToList();
	}

	/// <inheritdoc />
	public Game? ParseGame(string jsonContent)
	{
		if (string.IsNullOrWhiteSpace(jsonContent))
			return null;

		try
		{
			var dto = JsonSerializer.Deserialize<GameMetadataDto>(jsonContent, s_jsonOptions);
			return dto?.ToGame();
		}
		catch (JsonException)
		{
			return null;
		}
	}

	/// <inheritdoc />
	public (bool IsValid, List<string> Errors) ValidateGameJson(string jsonContent)
	{
		var errors = new List<string>();

		if (string.IsNullOrWhiteSpace(jsonContent))
		{
			errors.Add("JSON content is empty");
			return (false, errors);
		}

		try
		{
			var dto = JsonSerializer.Deserialize<GameMetadataDto>(jsonContent, s_jsonOptions);

			if (dto == null)
			{
				errors.Add("Failed to parse JSON");
				return (false, errors);
			}

			// Validate required fields
			if (string.IsNullOrWhiteSpace(dto.Slug))
				errors.Add("'slug' is required");

			if (string.IsNullOrWhiteSpace(dto.Title))
				errors.Add("'title' is required");

			if (string.IsNullOrWhiteSpace(dto.Platform))
				errors.Add("'platform' is required");
			else if (!Enum.TryParse<Platform>(dto.Platform, true, out _))
				errors.Add($"Invalid platform: '{dto.Platform}'");

			// Validate slug format
			if (!string.IsNullOrWhiteSpace(dto.Slug) && !IsValidSlug(dto.Slug))
				errors.Add($"Invalid slug format: '{dto.Slug}'. Use lowercase letters, numbers, and hyphens only.");

			// Validate release year if provided
			if (dto.ReleaseYear.HasValue && (dto.ReleaseYear < 1970 || dto.ReleaseYear > DateTime.Now.Year + 1))
				errors.Add($"Invalid release year: {dto.ReleaseYear}");

			return (errors.Count == 0, errors);
		}
		catch (JsonException ex)
		{
			errors.Add($"JSON parsing error: {ex.Message}");
			return (false, errors);
		}
	}

	/// <inheritdoc />
	public string ExportToJson(Game game, bool indented = true)
	{
		var dto = GameMetadataDto.FromGame(game);
		var options = indented ? s_jsonOptions : new JsonSerializerOptions(s_jsonOptions) { WriteIndented = false };
		return JsonSerializer.Serialize(dto, options);
	}

	private static bool IsValidSlug(string slug)
	{
		return slug.All(c => char.IsLetterOrDigit(c) || c == '-') &&
			   slug == slug.ToLowerInvariant() &&
			   !slug.StartsWith('-') &&
			   !slug.EndsWith('-') &&
			   !slug.Contains("--");
	}
}

/// <summary>
/// Data transfer object for game JSON serialization/deserialization.
/// </summary>
internal class GameMetadataDto
{
	public string? Slug { get; set; }
	public string? Title { get; set; }
	public string? Platform { get; set; }
	public string? JapaneseTitle { get; set; }
	public string[]? AlternateTitles { get; set; }
	public string? Developer { get; set; }
	public string? Publisher { get; set; }
	public int? ReleaseYear { get; set; }
	public string? Genre { get; set; }
	public string? Description { get; set; }
	public string? CoverImage { get; set; }
	public WikiResourcesDto? Wiki { get; set; }
	public string[]? DocumentationPaths { get; set; }
	public string[]? RelatedTools { get; set; }
	public string? Series { get; set; }
	public string? DocumentationLevel { get; set; }
	public string[]? Tags { get; set; }
	public DateTimeOffset? LastUpdated { get; set; }

	public Game? ToGame()
	{
		if (string.IsNullOrWhiteSpace(Slug) || string.IsNullOrWhiteSpace(Title) || string.IsNullOrWhiteSpace(Platform))
			return null;

		if (!Enum.TryParse<Models.Platform>(Platform, true, out var platform))
			return null;

		var docLevel = Models.DocumentationLevel.Minimal;
		if (!string.IsNullOrWhiteSpace(DocumentationLevel))
			Enum.TryParse(DocumentationLevel, true, out docLevel);

		return new Game
		{
			Slug = Slug,
			Title = Title,
			Platform = platform,
			JapaneseTitle = JapaneseTitle,
			AlternateTitles = AlternateTitles ?? [],
			Developer = Developer,
			Publisher = Publisher,
			ReleaseYear = ReleaseYear,
			Genre = Genre,
			Description = Description,
			CoverImage = CoverImage,
			Wiki = Wiki?.ToWikiResources() ?? new WikiResources(),
			DocumentationPaths = DocumentationPaths ?? [],
			RelatedTools = RelatedTools ?? [],
			Series = Series,
			DocumentationLevel = docLevel,
			Tags = Tags ?? [],
			LastUpdated = LastUpdated
		};
	}

	public static GameMetadataDto FromGame(Game game)
	{
		return new GameMetadataDto
		{
			Slug = game.Slug,
			Title = game.Title,
			Platform = game.Platform.ToString(),
			JapaneseTitle = game.JapaneseTitle,
			AlternateTitles = game.AlternateTitles.Length > 0 ? game.AlternateTitles : null,
			Developer = game.Developer,
			Publisher = game.Publisher,
			ReleaseYear = game.ReleaseYear,
			Genre = game.Genre,
			Description = game.Description,
			CoverImage = game.CoverImage,
			Wiki = WikiResourcesDto.FromWikiResources(game.Wiki),
			DocumentationPaths = game.DocumentationPaths.Length > 0 ? game.DocumentationPaths : null,
			RelatedTools = game.RelatedTools.Length > 0 ? game.RelatedTools : null,
			Series = game.Series,
			DocumentationLevel = game.DocumentationLevel != Models.DocumentationLevel.Minimal ? game.DocumentationLevel.ToString() : null,
			Tags = game.Tags.Length > 0 ? game.Tags : null,
			LastUpdated = game.LastUpdated
		};
	}
}

internal class WikiResourcesDto
{
	public bool HasRomMap { get; set; }
	public bool HasRamMap { get; set; }
	public bool HasDataStructures { get; set; }
	public bool HasSystems { get; set; }
	public bool HasNotes { get; set; }
	public string? WikiBaseUrl { get; set; }

	public WikiResources ToWikiResources()
	{
		return new WikiResources
		{
			HasRomMap = HasRomMap,
			HasRamMap = HasRamMap,
			HasDataStructures = HasDataStructures,
			HasSystems = HasSystems,
			HasNotes = HasNotes,
			WikiBaseUrl = WikiBaseUrl
		};
	}

	public static WikiResourcesDto? FromWikiResources(WikiResources wiki)
	{
		if (!wiki.HasRomMap && !wiki.HasRamMap && !wiki.HasDataStructures &&
			!wiki.HasSystems && !wiki.HasNotes && string.IsNullOrEmpty(wiki.WikiBaseUrl))
			return null;

		return new WikiResourcesDto
		{
			HasRomMap = wiki.HasRomMap,
			HasRamMap = wiki.HasRamMap,
			HasDataStructures = wiki.HasDataStructures,
			HasSystems = wiki.HasSystems,
			HasNotes = wiki.HasNotes,
			WikiBaseUrl = wiki.WikiBaseUrl
		};
	}
}
