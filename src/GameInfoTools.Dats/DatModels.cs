namespace GameInfoTools.Dats;

/// <summary>
/// Represents a ROM entry in a DAT file with all hash information.
/// </summary>
public sealed record RomEntry {
	/// <summary>Original filename from the DAT</summary>
	public required string Name { get; init; }

	/// <summary>ROM size in bytes</summary>
	public required long Size { get; init; }

	/// <summary>CRC32 checksum (lowercase hex, no prefix)</summary>
	public string? Crc32 { get; init; }

	/// <summary>MD5 hash (lowercase hex)</summary>
	public string? Md5 { get; init; }

	/// <summary>SHA1 hash (lowercase hex)</summary>
	public string? Sha1 { get; init; }

	/// <summary>SHA256 hash (lowercase hex)</summary>
	public string? Sha256 { get; init; }

	/// <summary>SNES internal checksum from ROM header (if applicable)</summary>
	public ushort? SnesChecksum { get; init; }

	/// <summary>SNES internal checksum complement from ROM header (if applicable)</summary>
	public ushort? SnesChecksumComplement { get; init; }

	/// <summary>Flags (verified, baddump, etc.)</summary>
	public RomFlags Flags { get; init; } = RomFlags.None;

	/// <summary>Serial/product code if available</summary>
	public string? Serial { get; init; }

	/// <summary>Header offset (512 bytes for SNES copier headers)</summary>
	public int HeaderOffset { get; init; }
}

/// <summary>
/// ROM flags from DAT files.
/// </summary>
[Flags]
public enum RomFlags {
	None = 0,
	Verified = 1 << 0,
	BadDump = 1 << 1,
	Overdump = 1 << 2,
	Underdump = 1 << 3,
	Pirate = 1 << 4,
	Alternate = 1 << 5,
	Hack = 1 << 6,
	Translation = 1 << 7,
	Homebrew = 1 << 8,
	Prototype = 1 << 9,
	Demo = 1 << 10,
	Beta = 1 << 11
}

/// <summary>
/// Represents a game entry containing one or more ROMs.
/// </summary>
public sealed record GameEntry {
	/// <summary>Game name/title</summary>
	public required string Name { get; init; }

	/// <summary>Game description</summary>
	public string? Description { get; init; }

	/// <summary>Region (USA, Europe, Japan, etc.)</summary>
	public string? Region { get; init; }

	/// <summary>Language codes</summary>
	public IReadOnlyList<string> Languages { get; init; } = [];

	/// <summary>ROMs associated with this game</summary>
	public IReadOnlyList<RomEntry> Roms { get; init; } = [];

	/// <summary>Release year if known</summary>
	public int? Year { get; init; }

	/// <summary>Publisher/developer</summary>
	public string? Publisher { get; init; }

	/// <summary>Category (commercial, translation, hack, etc.)</summary>
	public GameCategory Category { get; init; } = GameCategory.Commercial;

	/// <summary>Clone of (parent game name)</summary>
	public string? CloneOf { get; init; }

	/// <summary>ROM of (parent ROM name)</summary>
	public string? RomOf { get; init; }
}

/// <summary>
/// Game category for filtering.
/// </summary>
public enum GameCategory {
	Commercial,
	Licensed,
	Unlicensed,
	Pirate,
	Translation,
	Hack,
	Homebrew,
	Demo,
	Prototype,
	Beta,
	BIOS,
	Other
}

/// <summary>
/// Represents a complete DAT file.
/// </summary>
public sealed class DatFile {
	/// <summary>DAT file name</summary>
	public required string Name { get; init; }

	/// <summary>DAT description</summary>
	public string? Description { get; init; }

	/// <summary>System/platform name</summary>
	public required string System { get; init; }

	/// <summary>DAT version</summary>
	public string? Version { get; init; }

	/// <summary>DAT author/creator</summary>
	public string? Author { get; init; }

	/// <summary>Source organization (NoIntro, TOSEC, GoodSNES, etc.)</summary>
	public required DatSource Source { get; init; }

	/// <summary>Date of the DAT</summary>
	public DateOnly? Date { get; init; }

	/// <summary>URL for updates</summary>
	public string? Url { get; init; }

	/// <summary>All games in this DAT</summary>
	public List<GameEntry> Games { get; init; } = [];

	/// <summary>
	/// Gets total ROM count across all games.
	/// </summary>
	public int TotalRoms => Games.Sum(g => g.Roms.Count);

	/// <summary>
	/// Gets all unique ROMs by SHA1 hash.
	/// </summary>
	public IReadOnlyDictionary<string, RomEntry> GetUniqueRomsBySha1() {
		var result = new Dictionary<string, RomEntry>(StringComparer.OrdinalIgnoreCase);
		foreach (var game in Games) {
			foreach (var rom in game.Roms) {
				if (rom.Sha1 is not null && !result.ContainsKey(rom.Sha1)) {
					result[rom.Sha1] = rom;
				}
			}
		}
		return result;
	}
}

/// <summary>
/// Known DAT sources/organizations.
/// </summary>
public enum DatSource {
	Unknown,
	NoIntro,
	TOSEC,
	GoodTools,
	OpenGood,
	Redump,
	MAME,
	Custom
}
