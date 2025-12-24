namespace DarkRepos.Core.Models;

/// <summary>
/// Represents a documented retro game in the Dark Repos catalog.
/// </summary>
public class Game
{
	/// <summary>
	/// URL-friendly unique identifier (e.g., "dragon-warrior-nes")
	/// </summary>
	public required string Slug { get; init; }

	/// <summary>
	/// Display title of the game
	/// </summary>
	public required string Title { get; init; }

	/// <summary>
	/// Gaming platform (NES, SNES, GB, GBA, Genesis, etc.)
	/// </summary>
	public required Platform Platform { get; init; }

	/// <summary>
	/// Original Japanese title if different
	/// </summary>
	public string? JapaneseTitle { get; init; }

	/// <summary>
	/// Alternate titles or regional variations
	/// </summary>
	public string[] AlternateTitles { get; init; } = [];

	/// <summary>
	/// Game developer
	/// </summary>
	public string? Developer { get; init; }

	/// <summary>
	/// Game publisher
	/// </summary>
	public string? Publisher { get; init; }

	/// <summary>
	/// Original release year
	/// </summary>
	public int? ReleaseYear { get; init; }

	/// <summary>
	/// Game genre (RPG, Action, Platformer, etc.)
	/// </summary>
	public string? Genre { get; init; }

	/// <summary>
	/// Brief description of the game
	/// </summary>
	public string? Description { get; init; }

	/// <summary>
	/// Path to cover art image (relative to assets)
	/// </summary>
	public string? CoverImage { get; init; }

	/// <summary>
	/// Available wiki resources for this game
	/// </summary>
	public WikiResources Wiki { get; init; } = new();

	/// <summary>
	/// Links to related documentation pages
	/// </summary>
	public string[] DocumentationPaths { get; init; } = [];

	/// <summary>
	/// Related tools applicable to this game
	/// </summary>
	public string[] RelatedTools { get; init; } = [];

	/// <summary>
	/// Series this game belongs to (e.g., "Dragon Quest", "Final Fantasy")
	/// </summary>
	public string? Series { get; init; }

	/// <summary>
	/// Level of documentation completeness
	/// </summary>
	public DocumentationLevel DocumentationLevel { get; init; } = DocumentationLevel.Minimal;

	/// <summary>
	/// Tags for categorization and search
	/// </summary>
	public string[] Tags { get; init; } = [];

	/// <summary>
	/// Last time the game information was updated
	/// </summary>
	public DateTimeOffset? LastUpdated { get; init; }
}

/// <summary>
/// Available wiki resources for a game
/// </summary>
public class WikiResources
{
	/// <summary>
	/// Whether a ROM map exists
	/// </summary>
	public bool HasRomMap { get; init; }

	/// <summary>
	/// Whether a RAM map exists
	/// </summary>
	public bool HasRamMap { get; init; }

	/// <summary>
	/// Whether data structures are documented
	/// </summary>
	public bool HasDataStructures { get; init; }

	/// <summary>
	/// Whether system descriptions exist
	/// </summary>
	public bool HasSystems { get; init; }

	/// <summary>
	/// Whether notes/general documentation exists
	/// </summary>
	public bool HasNotes { get; init; }

	/// <summary>
	/// Base URL for wiki pages on games.darkrepos.com
	/// </summary>
	public string? WikiBaseUrl { get; init; }
}

/// <summary>
/// Gaming platform enumeration
/// </summary>
public enum Platform
{
	Unknown = 0,
	NES,
	SNES,
	GB,
	GBC,
	GBA,
	N64,
	GameCube,
	Genesis,
	MasterSystem,
	GameGear,
	Saturn,
	Dreamcast,
	PlayStation,
	PlayStation2,
	PSP,
	PCEngine,
	NeoGeo,
	Arcade,
	DOS,
	Windows
}

/// <summary>
/// Level of documentation completeness
/// </summary>
public enum DocumentationLevel
{
	/// <summary>No documentation available</summary>
	None = 0,

	/// <summary>Basic information only</summary>
	Minimal = 1,

	/// <summary>Partial documentation (some maps/structures)</summary>
	Partial = 2,

	/// <summary>Substantial documentation</summary>
	Substantial = 3,

	/// <summary>Comprehensive documentation</summary>
	Complete = 4
}
