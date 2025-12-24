using System.Text.Json;
using DarkRepos.Core.Models;

namespace DarkRepos.Core.Data;

/// <summary>
/// Extension methods for mapping between database entities and domain models.
/// </summary>
public static class EntityMappingExtensions
{
	private static readonly JsonSerializerOptions JsonOptions = new()
	{
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase
	};

	/// <summary>
	/// Converts a GameEntity to a Game model.
	/// </summary>
	public static Game ToModel(this GameEntity entity)
	{
		return new Game
		{
			Slug = entity.Slug,
			Title = entity.Title,
			Platform = Enum.TryParse<Platform>(entity.Platform, true, out var platform)
				? platform
				: Platform.Unknown,
			JapaneseTitle = entity.JapaneseTitle,
			AlternateTitles = DeserializeArray(entity.AlternateTitlesJson),
			Developer = entity.Developer,
			Publisher = entity.Publisher,
			ReleaseYear = entity.ReleaseYear,
			Genre = entity.Genre,
			Description = entity.Description,
			CoverImage = entity.CoverImage,
			Series = entity.Series,
			DocumentationLevel = (DocumentationLevel)entity.DocumentationLevel,
			Tags = DeserializeArray(entity.TagsJson),
			DocumentationPaths = DeserializeArray(entity.DocumentationPathsJson),
			RelatedTools = DeserializeArray(entity.RelatedToolsJson),
			Wiki = new WikiResources
			{
				HasRomMap = entity.HasRomMap,
				HasRamMap = entity.HasRamMap,
				HasDataStructures = entity.HasDataStructures,
				HasSystems = entity.HasSystems,
				HasNotes = entity.HasNotes,
				WikiBaseUrl = entity.WikiBaseUrl
			},
			LastUpdated = entity.LastUpdated
		};
	}

	/// <summary>
	/// Converts a Game model to a GameEntity.
	/// </summary>
	public static GameEntity ToEntity(this Game game, int? existingId = null)
	{
		return new GameEntity
		{
			Id = existingId ?? 0,
			Slug = game.Slug,
			Title = game.Title,
			Platform = game.Platform.ToString(),
			JapaneseTitle = game.JapaneseTitle,
			AlternateTitlesJson = SerializeArray(game.AlternateTitles),
			Developer = game.Developer,
			Publisher = game.Publisher,
			ReleaseYear = game.ReleaseYear,
			Genre = game.Genre,
			Description = game.Description,
			CoverImage = game.CoverImage,
			Series = game.Series,
			DocumentationLevel = (int)game.DocumentationLevel,
			TagsJson = SerializeArray(game.Tags),
			DocumentationPathsJson = SerializeArray(game.DocumentationPaths),
			RelatedToolsJson = SerializeArray(game.RelatedTools),
			HasRomMap = game.Wiki.HasRomMap,
			HasRamMap = game.Wiki.HasRamMap,
			HasDataStructures = game.Wiki.HasDataStructures,
			HasSystems = game.Wiki.HasSystems,
			HasNotes = game.Wiki.HasNotes,
			WikiBaseUrl = game.Wiki.WikiBaseUrl,
			LastUpdated = game.LastUpdated
		};
	}

	/// <summary>
	/// Converts a ToolEntity to a Tool model.
	/// </summary>
	public static Tool ToModel(this ToolEntity entity)
	{
		return new Tool
		{
			Slug = entity.Slug,
			Name = entity.Name,
			Description = entity.Description,
			Category = Enum.TryParse<ToolCategory>(entity.Category, true, out var category)
				? category
				: ToolCategory.General,
			Version = entity.Version,
			Author = entity.Author,
			RepositoryUrl = entity.RepositoryUrl,
			DownloadUrl = entity.DownloadUrl,
			DocumentationPath = entity.DocumentationPath,
			SupportedPlatforms = DeserializeArray(entity.SupportedPlatformsJson),
			Tags = DeserializeArray(entity.TagsJson),
			IsActive = entity.IsInternal, // Note: IsInternal in entity maps to IsActive in model
			LastUpdated = entity.LastUpdated
		};
	}

	/// <summary>
	/// Converts a Tool model to a ToolEntity.
	/// </summary>
	public static ToolEntity ToEntity(this Tool tool, int? existingId = null)
	{
		return new ToolEntity
		{
			Id = existingId ?? 0,
			Slug = tool.Slug,
			Name = tool.Name,
			Description = tool.Description,
			Category = tool.Category.ToString(),
			Version = tool.Version,
			Author = tool.Author,
			RepositoryUrl = tool.RepositoryUrl,
			DownloadUrl = tool.DownloadUrl,
			DocumentationPath = tool.DocumentationPath,
			SupportedPlatformsJson = SerializeArray(tool.SupportedPlatforms),
			TagsJson = SerializeArray(tool.Tags),
			IsInternal = tool.IsActive, // Note: IsActive in model maps to IsInternal in entity
			LastUpdated = tool.LastUpdated
		};
	}

	/// <summary>
	/// Converts a SearchIndexEntry to a SearchDocument.
	/// </summary>
	public static SearchDocument ToModel(this SearchIndexEntry entry)
	{
		return new SearchDocument
		{
			Id = entry.DocumentId,
			Type = Enum.TryParse<SearchDocumentType>(entry.DocumentType, true, out var type)
				? type
				: SearchDocumentType.Documentation,
			Title = entry.Title,
			Description = entry.Description,
			Content = entry.Content,
			Url = entry.Url,
			Platform = entry.Platform,
			Category = entry.Category,
			Tags = entry.Tags,
			Boost = entry.Boost,
			IndexedAt = entry.IndexedAt
		};
	}

	/// <summary>
	/// Converts a SearchDocument to a SearchIndexEntry.
	/// </summary>
	public static SearchIndexEntry ToEntity(this SearchDocument document, int? existingId = null)
	{
		return new SearchIndexEntry
		{
			Id = existingId ?? 0,
			DocumentId = document.Id,
			DocumentType = document.Type.ToString(),
			Title = document.Title,
			Description = document.Description,
			Content = document.Content,
			Url = document.Url,
			Platform = document.Platform,
			Category = document.Category,
			Tags = document.Tags,
			Boost = document.Boost,
			IndexedAt = document.IndexedAt
		};
	}

	private static string[] DeserializeArray(string? json)
	{
		if (string.IsNullOrWhiteSpace(json))
			return [];

		try
		{
			return JsonSerializer.Deserialize<string[]>(json, JsonOptions) ?? [];
		}
		catch
		{
			return [];
		}
	}

	private static string? SerializeArray(string[]? array)
	{
		if (array == null || array.Length == 0)
			return null;

		return JsonSerializer.Serialize(array, JsonOptions);
	}
}
