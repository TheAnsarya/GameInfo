namespace GameInfoTools.Core.Interfaces;

/// <summary>
/// ROM header information.
/// </summary>
public record RomHeader(
	string Format,           // iNES, SNES, GB, etc.
	string? Title,
	int PrgSize,
	int ChrSize,
	int Mapper,
	string? Region,
	Dictionary<string, object>? Extra
);

/// <summary>
/// ROM checksum information.
/// </summary>
public record RomChecksums(
	uint Crc32,
	string Md5,
	string Sha1,
	ushort? InternalChecksum,
	ushort? InternalComplement
);

/// <summary>
/// Interface for ROM file services.
/// </summary>
public interface IRomService
{
	/// <summary>Whether a ROM is currently loaded.</summary>
	bool IsLoaded { get; }

	/// <summary>Path to the loaded ROM file.</summary>
	string? FilePath { get; }

	/// <summary>Total size of the ROM in bytes.</summary>
	int Size { get; }

	/// <summary>Parsed header information.</summary>
	RomHeader? Header { get; }

	/// <summary>Calculated checksums.</summary>
	RomChecksums? Checksums { get; }

	/// <summary>Loads a ROM from a file path.</summary>
	Task LoadAsync(string path);

	/// <summary>Loads a ROM from a byte array (for web uploads).</summary>
	void LoadFromBytes(byte[] data, string fileName);

	/// <summary>Saves the ROM to the original path.</summary>
	Task SaveAsync();

	/// <summary>Saves the ROM to a new path.</summary>
	Task SaveAsAsync(string path);

	/// <summary>Gets a byte array of the entire ROM.</summary>
	byte[] GetAllBytes();

	/// <summary>Detects the ROM format automatically.</summary>
	string DetectFormat();

	/// <summary>Validates the ROM header.</summary>
	bool ValidateHeader();

	/// <summary>Recalculates and fixes internal checksums.</summary>
	void FixChecksums();

	/// <summary>Expands the ROM to a new size.</summary>
	void Expand(int newSize);

	/// <summary>Creates a backup of the current ROM.</summary>
	Task CreateBackupAsync();

	/// <summary>Reverts to the last backup.</summary>
	Task RevertToBackupAsync();

	/// <summary>Gets hex editor service for this ROM.</summary>
	IHexEditorService GetHexEditor();

	/// <summary>Gets CHR editor service for this ROM.</summary>
	IChrEditorService? GetChrEditor();

	/// <summary>Fired when the ROM is loaded.</summary>
	event EventHandler? RomLoaded;

	/// <summary>Fired when the ROM is modified.</summary>
	event EventHandler? RomModified;

	/// <summary>Fired when the ROM is saved.</summary>
	event EventHandler? RomSaved;
}
