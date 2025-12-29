namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Metadata associated with a TAS movie.
/// </summary>
public record TasMetadata {
	/// <summary>
	/// Gets or sets the movie title.
	/// </summary>
	public string? Title { get; init; }

	/// <summary>
	/// Gets or sets the movie author(s).
	/// </summary>
	public string? Author { get; init; }

	/// <summary>
	/// Gets or sets the ROM name.
	/// </summary>
	public string? RomName { get; init; }

	/// <summary>
	/// Gets or sets the ROM filename.
	/// </summary>
	public string? RomFilename { get; init; }

	/// <summary>
	/// Gets or sets the ROM checksum (CRC32 or SHA-1).
	/// </summary>
	public string? RomChecksum { get; init; }

	/// <summary>
	/// Gets or sets the ROM checksum type.
	/// </summary>
	public ChecksumType RomChecksumType { get; init; }

	/// <summary>
	/// Gets or sets the emulator used to create the movie.
	/// </summary>
	public string? EmulatorName { get; init; }

	/// <summary>
	/// Gets or sets the emulator version.
	/// </summary>
	public string? EmulatorVersion { get; init; }

	/// <summary>
	/// Gets or sets the movie format name.
	/// </summary>
	public string? FormatName { get; init; }

	/// <summary>
	/// Gets or sets the movie format version.
	/// </summary>
	public int? FormatVersion { get; init; }

	/// <summary>
	/// Gets or sets when the movie was created.
	/// </summary>
	public DateTimeOffset? CreatedAt { get; init; }

	/// <summary>
	/// Gets or sets when the movie was last modified.
	/// </summary>
	public DateTimeOffset? ModifiedAt { get; init; }

	/// <summary>
	/// Gets or sets the total frame count.
	/// </summary>
	public int FrameCount { get; init; }

	/// <summary>
	/// Gets or sets the rerecord count.
	/// </summary>
	public int RerecordCount { get; init; }

	/// <summary>
	/// Gets or sets movie comments/description.
	/// </summary>
	public string? Comments { get; init; }

	/// <summary>
	/// Gets or sets the movie category (any%, 100%, etc.).
	/// </summary>
	public string? Category { get; init; }

	/// <summary>
	/// Gets or sets the movie region.
	/// </summary>
	public GameRegion Region { get; init; }

	/// <summary>
	/// Gets or sets the source type (power-on, savestate, SRAM).
	/// </summary>
	public MovieStartType StartType { get; init; }

	/// <summary>
	/// Gets or sets additional custom metadata.
	/// </summary>
	public IReadOnlyDictionary<string, string> CustomFields { get; init; } = new Dictionary<string, string>();
}

/// <summary>
/// Type of checksum used for ROM verification.
/// </summary>
public enum ChecksumType {
	/// <summary>Unknown or no checksum.</summary>
	Unknown = 0,

	/// <summary>CRC32 checksum.</summary>
	Crc32,

	/// <summary>MD5 hash.</summary>
	Md5,

	/// <summary>SHA-1 hash.</summary>
	Sha1,

	/// <summary>SHA-256 hash.</summary>
	Sha256,
}

/// <summary>
/// How the movie begins playback.
/// </summary>
public enum MovieStartType {
	/// <summary>Starts from power-on/reset.</summary>
	PowerOn = 0,

	/// <summary>Starts from an embedded savestate.</summary>
	Savestate,

	/// <summary>Starts from SRAM/battery save.</summary>
	Sram,
}

/// <summary>
/// Game region for timing calculations.
/// </summary>
public enum GameRegion {
	/// <summary>Unknown region.</summary>
	Unknown = 0,

	/// <summary>NTSC (60Hz, 60.0988fps for NES, 60.0988fps for SNES).</summary>
	Ntsc,

	/// <summary>PAL (50Hz, 50.0070fps for NES, 50.0070fps for SNES).</summary>
	Pal,

	/// <summary>Japan NTSC.</summary>
	Japan,
}
