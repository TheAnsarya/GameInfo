using DarkRepos.Core.Data;
using DarkRepos.Core.Models;
using Microsoft.EntityFrameworkCore;

namespace DarkRepos.Core.Services;

/// <summary>
/// Implementation of IContentService that retrieves game and tool content from the database.
/// </summary>
public class ContentService : IContentService {
	private readonly DarkReposDbContext _context;

	public ContentService(DarkReposDbContext context) {
		_context = context;
	}

	public async Task<IReadOnlyList<Game>> GetAllGamesAsync(CancellationToken cancellationToken = default) {
		var entities = await _context.Games
			.OrderBy(g => g.Title)
			.ToListAsync(cancellationToken);

		return entities.Select(e => e.ToModel()).ToList();
	}

	public async Task<Game?> GetGameBySlugAsync(string slug, CancellationToken cancellationToken = default) {
		var entity = await _context.Games
			.FirstOrDefaultAsync(g => g.Slug == slug, cancellationToken);

		return entity?.ToModel();
	}

	public async Task<IReadOnlyList<Game>> GetGamesByPlatformAsync(Platform platform, CancellationToken cancellationToken = default) {
		var platformString = platform.ToString();
		var entities = await _context.Games
			.Where(g => g.Platform == platformString)
			.OrderBy(g => g.Title)
			.ToListAsync(cancellationToken);

		return entities.Select(e => e.ToModel()).ToList();
	}

	public async Task<IReadOnlyList<Game>> GetGamesBySeriesAsync(string series, CancellationToken cancellationToken = default) {
		var entities = await _context.Games
			.Where(g => g.Series == series)
			.OrderBy(g => g.ReleaseYear)
			.ThenBy(g => g.Title)
			.ToListAsync(cancellationToken);

		return entities.Select(e => e.ToModel()).ToList();
	}

	public async Task<IReadOnlyList<Tool>> GetAllToolsAsync(CancellationToken cancellationToken = default) {
		var entities = await _context.Tools
			.OrderBy(t => t.Name)
			.ToListAsync(cancellationToken);

		return entities.Select(e => e.ToModel()).ToList();
	}

	public async Task<Tool?> GetToolBySlugAsync(string slug, CancellationToken cancellationToken = default) {
		var entity = await _context.Tools
			.FirstOrDefaultAsync(t => t.Slug == slug, cancellationToken);

		return entity?.ToModel();
	}

	public async Task<IReadOnlyList<Tool>> GetToolsByCategoryAsync(ToolCategory category, CancellationToken cancellationToken = default) {
		var categoryString = category.ToString();
		var entities = await _context.Tools
			.Where(t => t.Category == categoryString)
			.OrderBy(t => t.Name)
			.ToListAsync(cancellationToken);

		return entities.Select(e => e.ToModel()).ToList();
	}

	public async Task<IReadOnlyList<Tool>> GetToolsForGameAsync(string gameSlug, CancellationToken cancellationToken = default) {
		// Get the game first to find its platform
		var game = await _context.Games
			.FirstOrDefaultAsync(g => g.Slug == gameSlug, cancellationToken);

		if (game == null)
			return [];

		// Find tools that support this game's platform
		// The supported platforms are stored as JSON, so we need to check if it contains the platform
		var entities = await _context.Tools
			.Where(t => t.SupportedPlatformsJson != null && t.SupportedPlatformsJson.Contains(game.Platform))
			.OrderBy(t => t.Name)
			.ToListAsync(cancellationToken);

		return entities.Select(e => e.ToModel()).ToList();
	}

	public async Task<IReadOnlyList<Game>> GetFeaturedGamesAsync(int count = 6, CancellationToken cancellationToken = default) {
		// Get games with the most complete documentation
		var entities = await _context.Games
			.OrderByDescending(g => g.DocumentationLevel)
			.ThenByDescending(g => g.HasRomMap)
			.ThenByDescending(g => g.HasRamMap)
			.ThenBy(g => g.Title)
			.Take(count)
			.ToListAsync(cancellationToken);

		return entities.Select(e => e.ToModel()).ToList();
	}

	public async Task<IReadOnlyList<object>> GetRecentUpdatesAsync(int count = 10, CancellationToken cancellationToken = default) {
		// Get recently updated games and tools, combined and sorted
		var recentGames = await _context.Games
			.Where(g => g.LastUpdated != null)
			.OrderByDescending(g => g.LastUpdated)
			.Take(count)
			.ToListAsync(cancellationToken);

		var recentTools = await _context.Tools
			.Where(t => t.LastUpdated != null)
			.OrderByDescending(t => t.LastUpdated)
			.Take(count)
			.ToListAsync(cancellationToken);

		// Combine and sort by update time
		var combined = recentGames.Select(g => new { Item = (object)g.ToModel(), Time = g.LastUpdated })
			.Concat(recentTools.Select(t => new { Item = (object)t.ToModel(), Time = t.LastUpdated }))
			.OrderByDescending(x => x.Time)
			.Take(count)
			.Select(x => x.Item)
			.ToList();

		return combined;
	}

	/// <summary>
	/// Adds or updates a game in the database.
	/// </summary>
	public async Task<Game> SaveGameAsync(Game game, CancellationToken cancellationToken = default) {
		var existing = await _context.Games
			.FirstOrDefaultAsync(g => g.Slug == game.Slug, cancellationToken);

		if (existing != null) {
			// Update existing
			var updated = game.ToEntity(existing.Id);
			_context.Entry(existing).CurrentValues.SetValues(updated);
		} else {
			// Add new
			var entity = game.ToEntity();
			_context.Games.Add(entity);
		}

		await _context.SaveChangesAsync(cancellationToken);
		return game;
	}

	/// <summary>
	/// Adds or updates a tool in the database.
	/// </summary>
	public async Task<Tool> SaveToolAsync(Tool tool, CancellationToken cancellationToken = default) {
		var existing = await _context.Tools
			.FirstOrDefaultAsync(t => t.Slug == tool.Slug, cancellationToken);

		if (existing != null) {
			// Update existing
			var updated = tool.ToEntity(existing.Id);
			_context.Entry(existing).CurrentValues.SetValues(updated);
		} else {
			// Add new
			var entity = tool.ToEntity();
			_context.Tools.Add(entity);
		}

		await _context.SaveChangesAsync(cancellationToken);
		return tool;
	}

	/// <summary>
	/// Deletes a game from the database.
	/// </summary>
	public async Task DeleteGameAsync(string slug, CancellationToken cancellationToken = default) {
		var existing = await _context.Games
			.FirstOrDefaultAsync(g => g.Slug == slug, cancellationToken);

		if (existing != null) {
			_context.Games.Remove(existing);
			await _context.SaveChangesAsync(cancellationToken);
		}
	}

	/// <summary>
	/// Deletes a tool from the database.
	/// </summary>
	public async Task DeleteToolAsync(string slug, CancellationToken cancellationToken = default) {
		var existing = await _context.Tools
			.FirstOrDefaultAsync(t => t.Slug == slug, cancellationToken);

		if (existing != null) {
			_context.Tools.Remove(existing);
			await _context.SaveChangesAsync(cancellationToken);
		}
	}
}
