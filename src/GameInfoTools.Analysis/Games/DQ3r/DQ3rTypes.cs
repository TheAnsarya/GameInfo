namespace GameInfoTools.Analysis.Games.DQ3r;

/// <summary>
/// Dragon Quest III SNES (DQ3r) data types and structures.
/// </summary>
public static class DQ3rTypes {
	/// <summary>
	/// DQ3r ROM specifications.
	/// </summary>
	public static class RomSpec {
		/// <summary>ROM size without header (6MB HiROM).</summary>
		public const int RomSize = 6_291_456;

		/// <summary>SMC header size (512 bytes if present).</summary>
		public const int SmcHeaderSize = 512;

		/// <summary>HiROM base address offset.</summary>
		public const int HiRomOffset = 0xc00000;

		/// <summary>Bank size (64KB).</summary>
		public const int BankSize = 0x10000;

		/// <summary>Total number of banks ($C0-$FF = 64 banks).</summary>
		public const int TotalBanks = 64;

		/// <summary>First bank number in HiROM.</summary>
		public const int FirstBank = 0xc0;

		/// <summary>Last bank number in HiROM.</summary>
		public const int LastBank = 0xff;

		/// <summary>SNES header location (FFB0-FFDF).</summary>
		public const int SnesHeaderOffset = 0xffb0;
	}

	/// <summary>
	/// Known ROM checksums for validation.
	/// </summary>
	public static class Checksums {
		/// <summary>CRC32 for Japanese ROM.</summary>
		public const uint JapaneseCrc32 = 0xb1c4b50f;

		/// <summary>MD5 for Japanese ROM.</summary>
		public const string JapaneseMd5 = "a1b2c3d4e5f6..."; // TODO: Add actual value
	}
}

/// <summary>
/// Types of data regions in DQ3r ROM.
/// </summary>
public enum DQ3rDataType {
	Unknown,
	Code,
	Graphics,
	Audio,
	Text,
	DataTables,
	Palettes,
	Compressed,
	MapData,
	EventScript,
	BattleData,
	DialogPointers
}

/// <summary>
/// Compression types used in DQ3r.
/// </summary>
public enum DQ3rCompressionType {
	None,
	Lz77,
	Rle,
	Huffman,
	Custom
}

/// <summary>
/// Known data table types in DQ3r.
/// </summary>
public enum DQ3rTableType {
	Unknown,
	Characters,
	Classes,
	Monsters,
	Items,
	Spells,
	Equipment,
	Shops,
	Maps,
	Treasure,
	Encounters
}

/// <summary>
/// Represents a region within the DQ3r ROM.
/// </summary>
public record DQ3rRomRegion {
	/// <summary>File offset (PC address).</summary>
	public required int FileOffset { get; init; }

	/// <summary>End offset (exclusive).</summary>
	public required int EndOffset { get; init; }

	/// <summary>SNES address string (e.g., "$C0:0000").</summary>
	public required string SnesAddress { get; init; }

	/// <summary>Size in bytes.</summary>
	public int Size => EndOffset - FileOffset;

	/// <summary>Bank number.</summary>
	public int Bank => (FileOffset / DQ3rTypes.RomSpec.BankSize) + DQ3rTypes.RomSpec.FirstBank;

	/// <summary>Data type classification.</summary>
	public DQ3rDataType DataType { get; init; } = DQ3rDataType.Unknown;

	/// <summary>Compression type.</summary>
	public DQ3rCompressionType Compression { get; init; } = DQ3rCompressionType.None;

	/// <summary>Analysis confidence (0.0 - 1.0).</summary>
	public double Confidence { get; init; } = 0.0;

	/// <summary>Description of the region.</summary>
	public string Description { get; init; } = string.Empty;

	/// <summary>Additional metadata.</summary>
	public Dictionary<string, object> Metadata { get; init; } = [];

	/// <summary>Analysis notes.</summary>
	public List<string> Notes { get; init; } = [];
}

/// <summary>
/// Represents a game data entry (monster, item, spell, etc.).
/// </summary>
public record DQ3rGameDataEntry {
	/// <summary>Entry ID.</summary>
	public required int Id { get; init; }

	/// <summary>Entry name (if known).</summary>
	public string Name { get; init; } = string.Empty;

	/// <summary>Table type.</summary>
	public DQ3rTableType TableType { get; init; } = DQ3rTableType.Unknown;

	/// <summary>ROM file offset.</summary>
	public required int FileOffset { get; init; }

	/// <summary>SNES address.</summary>
	public required string SnesAddress { get; init; }

	/// <summary>Entry size in bytes.</summary>
	public required int Size { get; init; }

	/// <summary>Parsed data fields.</summary>
	public Dictionary<string, object> Fields { get; init; } = [];
}

/// <summary>
/// Represents a code region with disassembly information.
/// </summary>
public record DQ3rCodeRegion {
	/// <summary>Start file offset.</summary>
	public required int StartOffset { get; init; }

	/// <summary>End file offset.</summary>
	public required int EndOffset { get; init; }

	/// <summary>SNES start address.</summary>
	public required string SnesStart { get; init; }

	/// <summary>SNES end address.</summary>
	public required string SnesEnd { get; init; }

	/// <summary>Size in bytes.</summary>
	public int Size => EndOffset - StartOffset;

	/// <summary>Known entry points.</summary>
	public List<int> EntryPoints { get; init; } = [];

	/// <summary>Subroutine information.</summary>
	public List<DQ3rSubroutine> Subroutines { get; init; } = [];

	/// <summary>Whether analysis is complete.</summary>
	public bool AnalysisComplete { get; init; }
}

/// <summary>
/// Represents a subroutine within DQ3r code.
/// </summary>
public record DQ3rSubroutine {
	/// <summary>Subroutine start address.</summary>
	public required int Address { get; init; }

	/// <summary>Subroutine name/label.</summary>
	public string Label { get; init; } = string.Empty;

	/// <summary>Size estimate.</summary>
	public int Size { get; init; }

	/// <summary>Addresses that call this subroutine.</summary>
	public List<int> CalledFrom { get; init; } = [];

	/// <summary>Addresses this subroutine calls.</summary>
	public List<int> CallsTo { get; init; } = [];

	/// <summary>Data references.</summary>
	public List<int> DataReferences { get; init; } = [];
}
