namespace DarkRepos.Core.Models;

/// <summary>
/// Represents a ROM hacking or game research tool.
/// </summary>
public class Tool {
	/// <summary>
	/// URL-friendly unique identifier (e.g., "rom-analyzer")
	/// </summary>
	public required string Slug { get; init; }

	/// <summary>
	/// Display name of the tool
	/// </summary>
	public required string Name { get; init; }

	/// <summary>
	/// Brief description of what the tool does
	/// </summary>
	public required string Description { get; init; }

	/// <summary>
	/// Tool category
	/// </summary>
	public required ToolCategory Category { get; init; }

	/// <summary>
	/// Current version string
	/// </summary>
	public string? Version { get; init; }

	/// <summary>
	/// Tool author or maintainer
	/// </summary>
	public string? Author { get; init; }

	/// <summary>
	/// GitHub repository URL
	/// </summary>
	public string? RepositoryUrl { get; init; }

	/// <summary>
	/// Direct download URL
	/// </summary>
	public string? DownloadUrl { get; init; }

	/// <summary>
	/// Path to documentation file (relative to docs)
	/// </summary>
	public string? DocumentationPath { get; init; }

	/// <summary>
	/// Full HTML content of documentation (rendered from markdown)
	/// </summary>
	public string? DocumentationHtml { get; init; }

	/// <summary>
	/// Platforms this tool runs on
	/// </summary>
	public string[] SupportedPlatforms { get; init; } = ["Windows"];

	/// <summary>
	/// Games or game platforms this tool supports
	/// </summary>
	public string[] SupportedGames { get; init; } = [];

	/// <summary>
	/// Programming language the tool is written in
	/// </summary>
	public string? Language { get; init; }

	/// <summary>
	/// License type (MIT, GPL, etc.)
	/// </summary>
	public string? License { get; init; }

	/// <summary>
	/// Tags for categorization and search
	/// </summary>
	public string[] Tags { get; init; } = [];

	/// <summary>
	/// Whether the tool is actively maintained
	/// </summary>
	public bool IsActive { get; init; } = true;

	/// <summary>
	/// Last time the tool was updated
	/// </summary>
	public DateTimeOffset? LastUpdated { get; init; }

	/// <summary>
	/// Path to icon image (relative to assets)
	/// </summary>
	public string? IconPath { get; init; }
}

/// <summary>
/// Tool category enumeration
/// </summary>
public enum ToolCategory {
	/// <summary>General purpose tools</summary>
	General = 0,

	/// <summary>Disassembly and reverse engineering</summary>
	Disassembly,

	/// <summary>Graphics viewing and editing</summary>
	Graphics,

	/// <summary>Text extraction and editing</summary>
	Text,

	/// <summary>Audio/music tools</summary>
	Audio,

	/// <summary>Map editing tools</summary>
	MapEditor,

	/// <summary>ROM analysis and examination</summary>
	Analysis,

	/// <summary>Patching and distribution</summary>
	Patching,

	/// <summary>Save file editing</summary>
	SaveEditor,

	/// <summary>Compression/decompression</summary>
	Compression,

	/// <summary>Development utilities</summary>
	Development
}
