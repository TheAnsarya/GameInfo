namespace GameInfoTools.Core.Project;

/// <summary>
/// Defines a supported game for project creation.
/// </summary>
public class GameDefinition {
	/// <summary>Unique game identifier (e.g., "dw4-nes-us").</summary>
	public required string Id { get; init; }

	/// <summary>Display name of the game.</summary>
	public required string Name { get; init; }

	/// <summary>Alias for Name for UI binding.</summary>
	public string DisplayName => Name;

	/// <summary>Platform/system (e.g., "NES", "SNES", "GB").</summary>
	public required string Platform { get; init; }

	/// <summary>Region (e.g., "US", "JP", "EU").</summary>
	public required string Region { get; init; }

	/// <summary>Developer name.</summary>
	public string? Developer { get; init; }

	/// <summary>Publisher name.</summary>
	public string? Publisher { get; init; }

	/// <summary>Release year.</summary>
	public int? Year { get; init; }

	/// <summary>Known good ROM checksums for verification.</summary>
	public RomChecksums? KnownChecksums { get; init; }

	/// <summary>Asset extractor type to use for this game.</summary>
	public required string ExtractorType { get; init; }

	/// <summary>Default assembler to use for building.</summary>
	public string Assembler { get; init; } = "ca65";

	/// <summary>Optional path to game icon.</summary>
	public string? IconPath { get; init; }

	/// <summary>Description of the game.</summary>
	public string? Description { get; init; }

	/// <summary>Tags for filtering (e.g., "rpg", "action", "puzzle").</summary>
	public List<string> Tags { get; init; } = [];
}

/// <summary>
/// Known checksums for a ROM.
/// </summary>
public class RomChecksums {
	/// <summary>Expected file size in bytes.</summary>
	public long? Size { get; init; }

	/// <summary>CRC32 checksum.</summary>
	public string? Crc32 { get; init; }

	/// <summary>MD5 hash.</summary>
	public string? Md5 { get; init; }

	/// <summary>SHA1 hash.</summary>
	public string? Sha1 { get; init; }

	/// <summary>SHA256 hash.</summary>
	public string? Sha256 { get; init; }

	/// <summary>Whether the ROM has a header to skip for checksum calculation.</summary>
	public bool HasHeader { get; init; }

	/// <summary>Header size to skip.</summary>
	public int HeaderSize { get; init; }
}

/// <summary>
/// Options for creating a new project.
/// </summary>
public class ProjectCreationOptions {
	/// <summary>Project name. Defaults to game name if not specified.</summary>
	public string? Name { get; init; }

	/// <summary>Project description.</summary>
	public string? Description { get; init; }

	/// <summary>Author names.</summary>
	public List<string> Authors { get; init; } = [];

	/// <summary>Asset types to extract. Null means all available.</summary>
	public IEnumerable<string>? AssetTypes { get; init; }

	/// <summary>Whether to include source/disassembly files.</summary>
	public bool IncludeSource { get; init; } = true;

	/// <summary>Whether to include symbol files.</summary>
	public bool IncludeSymbols { get; init; } = true;

	/// <summary>Whether to generate analysis files.</summary>
	public bool IncludeAnalysis { get; init; } = true;

	/// <summary>Build profiles to create.</summary>
	public List<string> BuildProfiles { get; init; } = ["default"];

	/// <summary>Custom settings to include in project.json.</summary>
	public Dictionary<string, object>? CustomSettings { get; init; }
}

/// <summary>
/// Result of ROM verification.
/// </summary>
public enum RomVerificationStatus {
	/// <summary>ROM matches known good checksum.</summary>
	Verified,

	/// <summary>ROM checksum not in known database (may still be valid).</summary>
	Unknown,

	/// <summary>ROM appears to be modified or bad dump.</summary>
	Modified,

	/// <summary>ROM is corrupted or invalid.</summary>
	Invalid
}

/// <summary>
/// Result of verifying a ROM against known checksums.
/// </summary>
public record RomVerificationResult(
	RomVerificationStatus Status,
	string Message,
	string? Crc32,
	string? Md5,
	string? Sha1,
	string? Sha256,
	long Size,
	bool HasHeader,
	string? DetectedGame
) {
	/// <summary>Whether the ROM is verified against a known dump.</summary>
	public bool IsVerified => Status == RomVerificationStatus.Verified;

	/// <summary>Status message for display.</summary>
	public string StatusMessage => Message;
}
