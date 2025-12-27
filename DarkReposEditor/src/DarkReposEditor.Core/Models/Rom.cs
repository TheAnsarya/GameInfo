namespace DarkReposEditor.Core.Models;

/// <summary>
/// Represents a ROM file with metadata and content.
/// </summary>
public class Rom
{
	/// <summary>
	/// Unique identifier for the ROM.
	/// </summary>
	public Guid Id { get; set; }

	/// <summary>
	/// Display name of the ROM.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Original filename of the ROM.
	/// </summary>
	public string FileName { get; set; } = string.Empty;

	/// <summary>
	/// Platform/console (NES, SNES, GB, etc.).
	/// </summary>
	public RomPlatform Platform { get; set; }

	/// <summary>
	/// File size in bytes.
	/// </summary>
	public long Size { get; set; }

	/// <summary>
	/// SHA-256 hash of the ROM data.
	/// </summary>
	public string Sha256 { get; set; } = string.Empty;

	/// <summary>
	/// CRC32 checksum of the ROM.
	/// </summary>
	public string Crc32 { get; set; } = string.Empty;

	/// <summary>
	/// Internal ROM header title if available.
	/// </summary>
	public string? InternalTitle { get; set; }

	/// <summary>
	/// Mapper type for the ROM.
	/// </summary>
	public int? Mapper { get; set; }

	/// <summary>
	/// ROM data bytes (may be stored externally).
	/// </summary>
	public byte[]? Data { get; set; }

	/// <summary>
	/// When the ROM was added to the system.
	/// </summary>
	public DateTime AddedAt { get; set; } = DateTime.UtcNow;

	/// <summary>
	/// When the ROM was last accessed.
	/// </summary>
	public DateTime? LastAccessedAt { get; set; }
}
