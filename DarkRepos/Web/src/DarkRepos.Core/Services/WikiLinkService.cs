using DarkRepos.Core.Models;

namespace DarkRepos.Core.Services;

/// <summary>
/// Service for generating wiki links and wikitext content.
/// </summary>
public interface IWikiLinkService {
	/// <summary>
	/// Generates the wiki page URL for a game.
	/// </summary>
	/// <param name="game">The game to generate URL for.</param>
	/// <returns>The wiki page URL.</returns>
	string GetWikiUrl(Game game);

	/// <summary>
	/// Generates the ROM map wiki URL for a game.
	/// </summary>
	/// <param name="game">The game.</param>
	/// <returns>The ROM map wiki URL, or null if not available.</returns>
	string? GetRomMapUrl(Game game);

	/// <summary>
	/// Generates the RAM map wiki URL for a game.
	/// </summary>
	/// <param name="game">The game.</param>
	/// <returns>The RAM map wiki URL, or null if not available.</returns>
	string? GetRamMapUrl(Game game);

	/// <summary>
	/// Generates the data structures wiki URL for a game.
	/// </summary>
	/// <param name="game">The game.</param>
	/// <returns>The data structures wiki URL, or null if not available.</returns>
	string? GetDataStructuresUrl(Game game);

	/// <summary>
	/// Generates the systems wiki URL for a game.
	/// </summary>
	/// <param name="game">The game.</param>
	/// <returns>The systems wiki URL, or null if not available.</returns>
	string? GetSystemsUrl(Game game);

	/// <summary>
	/// Generates the notes wiki URL for a game.
	/// </summary>
	/// <param name="game">The game.</param>
	/// <returns>The notes wiki URL, or null if not available.</returns>
	string? GetNotesUrl(Game game);

	/// <summary>
	/// Gets all available wiki resource URLs for a game.
	/// </summary>
	/// <param name="game">The game.</param>
	/// <returns>Dictionary of resource type to URL.</returns>
	Dictionary<WikiResourceType, string> GetAllWikiUrls(Game game);

	/// <summary>
	/// Generates a wikitext internal link.
	/// </summary>
	/// <param name="pageName">The wiki page name.</param>
	/// <param name="displayText">Optional display text.</param>
	/// <returns>Wikitext link markup.</returns>
	string GenerateWikiLink(string pageName, string? displayText = null);

	/// <summary>
	/// Generates a wikitext external link.
	/// </summary>
	/// <param name="url">The external URL.</param>
	/// <param name="displayText">Optional display text.</param>
	/// <returns>Wikitext external link markup.</returns>
	string GenerateExternalLink(string url, string? displayText = null);

	/// <summary>
	/// Converts a game title to wiki page name format.
	/// </summary>
	/// <param name="title">The game title.</param>
	/// <param name="platform">The platform.</param>
	/// <returns>Wiki page name.</returns>
	string ToWikiPageName(string title, Platform platform);
}

/// <summary>
/// Types of wiki resources available for games.
/// </summary>
public enum WikiResourceType {
	Main,
	RomMap,
	RamMap,
	DataStructures,
	Systems,
	Notes
}

/// <summary>
/// Implementation of wiki link generation service.
/// </summary>
public class WikiLinkService : IWikiLinkService {
	private const string WikiBaseUrl = "https://games.darkrepos.com/wiki";

	/// <inheritdoc />
	public string GetWikiUrl(Game game) {
		var pageName = ToWikiPageName(game.Title, game.Platform);
		return $"{WikiBaseUrl}/{Uri.EscapeDataString(pageName)}";
	}

	/// <inheritdoc />
	public string? GetRomMapUrl(Game game) {
		if (!game.Wiki.HasRomMap)
			return null;

		var pageName = ToWikiPageName(game.Title, game.Platform);
		return $"{WikiBaseUrl}/{Uri.EscapeDataString(pageName)}:ROM_map";
	}

	/// <inheritdoc />
	public string? GetRamMapUrl(Game game) {
		if (!game.Wiki.HasRamMap)
			return null;

		var pageName = ToWikiPageName(game.Title, game.Platform);
		return $"{WikiBaseUrl}/{Uri.EscapeDataString(pageName)}:RAM_map";
	}

	/// <inheritdoc />
	public string? GetDataStructuresUrl(Game game) {
		if (!game.Wiki.HasDataStructures)
			return null;

		var pageName = ToWikiPageName(game.Title, game.Platform);
		return $"{WikiBaseUrl}/{Uri.EscapeDataString(pageName)}:Data_structures";
	}

	/// <inheritdoc />
	public string? GetSystemsUrl(Game game) {
		if (!game.Wiki.HasSystems)
			return null;

		var pageName = ToWikiPageName(game.Title, game.Platform);
		return $"{WikiBaseUrl}/{Uri.EscapeDataString(pageName)}:Systems";
	}

	/// <inheritdoc />
	public string? GetNotesUrl(Game game) {
		if (!game.Wiki.HasNotes)
			return null;

		var pageName = ToWikiPageName(game.Title, game.Platform);
		return $"{WikiBaseUrl}/{Uri.EscapeDataString(pageName)}:Notes";
	}

	/// <inheritdoc />
	public Dictionary<WikiResourceType, string> GetAllWikiUrls(Game game) {
		var urls = new Dictionary<WikiResourceType, string> {
			[WikiResourceType.Main] = GetWikiUrl(game)
		};

		var romMapUrl = GetRomMapUrl(game);
		if (romMapUrl != null)
			urls[WikiResourceType.RomMap] = romMapUrl;

		var ramMapUrl = GetRamMapUrl(game);
		if (ramMapUrl != null)
			urls[WikiResourceType.RamMap] = ramMapUrl;

		var dataStructuresUrl = GetDataStructuresUrl(game);
		if (dataStructuresUrl != null)
			urls[WikiResourceType.DataStructures] = dataStructuresUrl;

		var systemsUrl = GetSystemsUrl(game);
		if (systemsUrl != null)
			urls[WikiResourceType.Systems] = systemsUrl;

		var notesUrl = GetNotesUrl(game);
		if (notesUrl != null)
			urls[WikiResourceType.Notes] = notesUrl;

		return urls;
	}

	/// <inheritdoc />
	public string GenerateWikiLink(string pageName, string? displayText = null) {
		if (string.IsNullOrWhiteSpace(displayText) || displayText == pageName)
			return $"[[{pageName}]]";

		return $"[[{pageName}|{displayText}]]";
	}

	/// <inheritdoc />
	public string GenerateExternalLink(string url, string? displayText = null) {
		if (string.IsNullOrWhiteSpace(displayText))
			return $"[{url}]";

		return $"[{url} {displayText}]";
	}

	/// <inheritdoc />
	public string ToWikiPageName(string title, Platform platform) {
		// Format: "Game_Title_(Platform)"
		// e.g., "Dragon_Warrior_(NES)", "Soul_Blazer_(SNES)"

		// Replace spaces with underscores (MediaWiki style)
		var normalizedTitle = title.Replace(' ', '_');

		// Remove characters not allowed in wiki page names
		normalizedTitle = NormalizeForWiki(normalizedTitle);

		// Append platform
		return $"{normalizedTitle}_({platform})";
	}

	/// <summary>
	/// Generates wikitext for a game info box.
	/// </summary>
	public string GenerateInfoBox(Game game) {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("{{Infobox game");
		sb.AppendLine($"|title = {game.Title}");
		sb.AppendLine($"|platform = {game.Platform}");

		if (!string.IsNullOrEmpty(game.JapaneseTitle))
			sb.AppendLine($"|japanese_title = {game.JapaneseTitle}");

		if (!string.IsNullOrEmpty(game.Developer))
			sb.AppendLine($"|developer = {game.Developer}");

		if (!string.IsNullOrEmpty(game.Publisher))
			sb.AppendLine($"|publisher = {game.Publisher}");

		if (game.ReleaseYear.HasValue)
			sb.AppendLine($"|year = {game.ReleaseYear}");

		if (!string.IsNullOrEmpty(game.Genre))
			sb.AppendLine($"|genre = {game.Genre}");

		if (!string.IsNullOrEmpty(game.Series))
			sb.AppendLine($"|series = {game.Series}");

		// Wiki resources
		sb.AppendLine($"|rom_map = {(game.Wiki.HasRomMap ? "yes" : "no")}");
		sb.AppendLine($"|ram_map = {(game.Wiki.HasRamMap ? "yes" : "no")}");
		sb.AppendLine($"|data_structures = {(game.Wiki.HasDataStructures ? "yes" : "no")}");
		sb.AppendLine($"|systems = {(game.Wiki.HasSystems ? "yes" : "no")}");

		sb.AppendLine("}}");

		return sb.ToString();
	}

	/// <summary>
	/// Generates wikitext for wiki resource navigation.
	/// </summary>
	public string GenerateResourceNavigation(Game game) {
		var pageName = ToWikiPageName(game.Title, game.Platform);
		var sb = new System.Text.StringBuilder();

		sb.AppendLine("==Wiki Resources==");
		sb.AppendLine("{| class=\"wikitable\"");
		sb.AppendLine("|-");
		sb.AppendLine("! Resource !! Status");

		var resources = new[]
		{
			("ROM Map", game.Wiki.HasRomMap, "ROM_map"),
			("RAM Map", game.Wiki.HasRamMap, "RAM_map"),
			("Data Structures", game.Wiki.HasDataStructures, "Data_structures"),
			("Systems", game.Wiki.HasSystems, "Systems"),
			("Notes", game.Wiki.HasNotes, "Notes")
		};

		foreach (var (name, available, suffix) in resources) {
			sb.AppendLine("|-");
			var link = available
				? $"[[{pageName}:{suffix}|{name}]]"
				: name;
			var status = available ? "{{yes}}" : "{{no}}";
			sb.AppendLine($"| {link} || {status}");
		}

		sb.AppendLine("|}");

		return sb.ToString();
	}

	/// <summary>
	/// Generates a category tag for a game.
	/// </summary>
	public string GenerateCategory(Game game) {
		var categories = new List<string>
		{
			$"[[Category:{game.Platform} games]]"
		};

		if (!string.IsNullOrEmpty(game.Series))
			categories.Add($"[[Category:{game.Series}]]");

		if (!string.IsNullOrEmpty(game.Genre))
			categories.Add($"[[Category:{game.Genre} games]]");

		if (!string.IsNullOrEmpty(game.Developer))
			categories.Add($"[[Category:Games developed by {game.Developer}]]");

		return string.Join("\n", categories);
	}

	private static string NormalizeForWiki(string input) {
		// Remove characters that are problematic in wiki page names
		var invalidChars = new[] { '[', ']', '{', '}', '|', '#', '<', '>' };

		foreach (var c in invalidChars) {
			input = input.Replace(c.ToString(), "");
		}

		// Convert multiple underscores to single
		while (input.Contains("__")) {
			input = input.Replace("__", "_");
		}

		return input.Trim('_');
	}
}
