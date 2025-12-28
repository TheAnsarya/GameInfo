namespace DarkRepos.Editor.Core.Interfaces;

/// <summary>
/// Service for editing structured game data like stats tables, item definitions, etc.
/// Supports defining data structures and editing them in a type-safe manner.
/// </summary>
public interface IDataEditorService {
	/// <summary>
	/// Loads a data structure definition from JSON schema.
	/// </summary>
	DataStructure LoadStructureDefinition(string jsonSchema);

	/// <summary>
	/// Parses ROM data using a structure definition.
	/// </summary>
	DataTable LoadDataTable(byte[] data, int offset, DataStructure structure, int rowCount);

	/// <summary>
	/// Loads a single data record.
	/// </summary>
	DataRecord LoadRecord(byte[] data, int offset, DataStructure structure);

	/// <summary>
	/// Exports a data table back to binary format.
	/// </summary>
	byte[] ExportTable(DataTable table);

	/// <summary>
	/// Exports a single record to binary.
	/// </summary>
	byte[] ExportRecord(DataRecord record, DataStructure structure);

	/// <summary>
	/// Exports table to JSON.
	/// </summary>
	string ExportToJson(DataTable table, bool pretty = true);

	/// <summary>
	/// Exports table to CSV.
	/// </summary>
	string ExportToCsv(DataTable table, bool includeHeader = true);

	/// <summary>
	/// Imports data from JSON.
	/// </summary>
	DataTable ImportFromJson(string json, DataStructure structure);

	/// <summary>
	/// Imports data from CSV.
	/// </summary>
	DataTable ImportFromCsv(string csv, DataStructure structure);

	/// <summary>
	/// Calculates checksum of data table.
	/// </summary>
	uint CalculateChecksum(DataTable table, ChecksumType type);

	/// <summary>
	/// Validates data against structure constraints.
	/// </summary>
	DataValidationResult ValidateTable(DataTable table);

	/// <summary>
	/// Validates a single record.
	/// </summary>
	DataValidationResult ValidateRecord(DataRecord record, DataStructure structure);

	/// <summary>
	/// Gets predefined structure templates for common game data.
	/// </summary>
	IReadOnlyList<StructureTemplate> GetTemplates();

	/// <summary>
	/// Auto-detects potential data tables in ROM.
	/// </summary>
	IReadOnlyList<DetectedTable> DetectTables(byte[] data, DataTableDetectionOptions options);

	/// <summary>
	/// Gets a value from a record by field name.
	/// </summary>
	object? GetFieldValue(DataRecord record, string fieldName);

	/// <summary>
	/// Sets a value in a record by field name.
	/// </summary>
	void SetFieldValue(DataRecord record, string fieldName, object value);

	/// <summary>
	/// Finds records matching a predicate.
	/// </summary>
	IReadOnlyList<DataRecord> FindRecords(DataTable table, Func<DataRecord, bool> predicate);

	/// <summary>
	/// Sorts table by a field.
	/// </summary>
	void SortTable(DataTable table, string fieldName, bool ascending = true);
}

/// <summary>
/// Defines the structure of a data record.
/// </summary>
public class DataStructure {
	/// <summary>
	/// Name of this structure.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Description of what this structure represents.
	/// </summary>
	public string Description { get; set; } = string.Empty;

	/// <summary>
	/// Fields in this structure.
	/// </summary>
	public List<DataField> Fields { get; set; } = [];

	/// <summary>
	/// Total size of one record in bytes.
	/// </summary>
	public int RecordSize => Fields.Sum(f => f.GetByteSize());

	/// <summary>
	/// Endianness for multi-byte values.
	/// </summary>
	public Endianness Endianness { get; set; } = Endianness.Little;

	/// <summary>
	/// Optional pointer table info.
	/// </summary>
	public PointerTableInfo? PointerTable { get; set; }
}

/// <summary>
/// A field within a data structure.
/// </summary>
public class DataField {
	/// <summary>
	/// Field name (used as identifier).
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Display label.
	/// </summary>
	public string Label { get; set; } = string.Empty;

	/// <summary>
	/// Data type of this field.
	/// </summary>
	public DataFieldType Type { get; set; } = DataFieldType.Byte;

	/// <summary>
	/// Size in bytes (for fixed-width types).
	/// </summary>
	public int Size { get; set; } = 1;

	/// <summary>
	/// Bit offset within byte (for bit fields).
	/// </summary>
	public int BitOffset { get; set; }

	/// <summary>
	/// Bit width (for bit fields).
	/// </summary>
	public int BitWidth { get; set; }

	/// <summary>
	/// Minimum value constraint.
	/// </summary>
	public long? MinValue { get; set; }

	/// <summary>
	/// Maximum value constraint.
	/// </summary>
	public long? MaxValue { get; set; }

	/// <summary>
	/// Default value.
	/// </summary>
	public object? DefaultValue { get; set; }

	/// <summary>
	/// Whether this field is read-only.
	/// </summary>
	public bool ReadOnly { get; set; }

	/// <summary>
	/// Enumeration values for lookup fields.
	/// </summary>
	public Dictionary<int, string>? EnumValues { get; set; }

	/// <summary>
	/// Format string for display (e.g., "X2" for hex).
	/// </summary>
	public string? DisplayFormat { get; set; }

	/// <summary>
	/// Reference to another table (for foreign keys).
	/// </summary>
	public string? ReferenceTable { get; set; }

	/// <summary>
	/// Description/help text.
	/// </summary>
	public string? Description { get; set; }

	/// <summary>
	/// Array length (if this field is an array).
	/// </summary>
	public int ArrayLength { get; set; } = 1;

	/// <summary>
	/// Gets the byte size of this field.
	/// </summary>
	public int GetByteSize() {
		var baseSize = Type switch {
			DataFieldType.Byte or DataFieldType.SByte => 1,
			DataFieldType.Word or DataFieldType.SWord => 2,
			DataFieldType.DWord or DataFieldType.SDWord => 4,
			DataFieldType.QWord or DataFieldType.SQWord => 8,
			DataFieldType.Bits => (BitWidth + 7) / 8,
			DataFieldType.FixedString => Size,
			DataFieldType.Pointer => Size > 0 ? Size : 2,
			_ => Size > 0 ? Size : 1
		};
		return baseSize * ArrayLength;
	}
}

/// <summary>
/// Type of data field.
/// </summary>
public enum DataFieldType {
	/// <summary>
	/// Unsigned byte (8-bit).
	/// </summary>
	Byte,

	/// <summary>
	/// Signed byte (8-bit).
	/// </summary>
	SByte,

	/// <summary>
	/// Unsigned word (16-bit).
	/// </summary>
	Word,

	/// <summary>
	/// Signed word (16-bit).
	/// </summary>
	SWord,

	/// <summary>
	/// Unsigned dword (32-bit).
	/// </summary>
	DWord,

	/// <summary>
	/// Signed dword (32-bit).
	/// </summary>
	SDWord,

	/// <summary>
	/// Unsigned qword (64-bit).
	/// </summary>
	QWord,

	/// <summary>
	/// Signed qword (64-bit).
	/// </summary>
	SQWord,

	/// <summary>
	/// Bit field.
	/// </summary>
	Bits,

	/// <summary>
	/// Fixed-length string.
	/// </summary>
	FixedString,

	/// <summary>
	/// Pointer/address.
	/// </summary>
	Pointer,

	/// <summary>
	/// Boolean (stored as byte).
	/// </summary>
	Bool,

	/// <summary>
	/// Enumeration value.
	/// </summary>
	Enum,

	/// <summary>
	/// Flags (bitmask).
	/// </summary>
	Flags
}

/// <summary>
/// Byte order for multi-byte values.
/// </summary>
public enum Endianness {
	/// <summary>
	/// Little-endian (LSB first) - used by NES, SNES, GB, GBA.
	/// </summary>
	Little,

	/// <summary>
	/// Big-endian (MSB first) - used by Genesis/Mega Drive.
	/// </summary>
	Big
}

/// <summary>
/// Information about a pointer table.
/// </summary>
public class PointerTableInfo {
	/// <summary>
	/// Offset of the pointer table.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Number of pointers.
	/// </summary>
	public int Count { get; set; }

	/// <summary>
	/// Size of each pointer in bytes.
	/// </summary>
	public int PointerSize { get; set; } = 2;

	/// <summary>
	/// Base address to add to pointers.
	/// </summary>
	public int BaseAddress { get; set; }
}

/// <summary>
/// A table of data records.
/// </summary>
public class DataTable {
	/// <summary>
	/// Table name.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// ROM offset where table starts.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Structure definition.
	/// </summary>
	public DataStructure Structure { get; set; } = new();

	/// <summary>
	/// Records in the table.
	/// </summary>
	public List<DataRecord> Records { get; set; } = [];

	/// <summary>
	/// Whether the table has been modified.
	/// </summary>
	public bool IsModified { get; set; }

	/// <summary>
	/// Total size in bytes.
	/// </summary>
	public int TotalSize => Records.Count * Structure.RecordSize;
}

/// <summary>
/// A single data record.
/// </summary>
public class DataRecord {
	/// <summary>
	/// Record index in the table.
	/// </summary>
	public int Index { get; set; }

	/// <summary>
	/// ROM offset of this record.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Field values indexed by field name.
	/// </summary>
	public Dictionary<string, object> Values { get; set; } = [];

	/// <summary>
	/// Raw bytes for this record.
	/// </summary>
	public byte[] RawBytes { get; set; } = [];

	/// <summary>
	/// Whether this record has been modified.
	/// </summary>
	public bool IsModified { get; set; }

	/// <summary>
	/// Optional label/name for this record.
	/// </summary>
	public string? Label { get; set; }
}

/// <summary>
/// Result of data validation.
/// </summary>
public class DataValidationResult {
	/// <summary>
	/// Whether validation passed.
	/// </summary>
	public bool IsValid { get; set; }

	/// <summary>
	/// Validation errors.
	/// </summary>
	public List<DataValidationError> Errors { get; set; } = [];

	/// <summary>
	/// Validation warnings.
	/// </summary>
	public List<DataValidationError> Warnings { get; set; } = [];
}

/// <summary>
/// A validation error.
/// </summary>
public class DataValidationError {
	/// <summary>
	/// Record index (if applicable).
	/// </summary>
	public int? RecordIndex { get; set; }

	/// <summary>
	/// Field name (if applicable).
	/// </summary>
	public string? FieldName { get; set; }

	/// <summary>
	/// Error message.
	/// </summary>
	public string Message { get; set; } = string.Empty;

	/// <summary>
	/// Error severity.
	/// </summary>
	public ValidationSeverity Severity { get; set; } = ValidationSeverity.Error;
}

/// <summary>
/// Validation severity.
/// </summary>
public enum ValidationSeverity {
	Warning,
	Error
}

/// <summary>
/// Type of checksum calculation.
/// </summary>
public enum ChecksumType {
	/// <summary>
	/// Simple sum of all bytes.
	/// </summary>
	Sum8,

	/// <summary>
	/// 16-bit sum.
	/// </summary>
	Sum16,

	/// <summary>
	/// CRC-16.
	/// </summary>
	Crc16,

	/// <summary>
	/// CRC-32.
	/// </summary>
	Crc32,

	/// <summary>
	/// XOR of all bytes.
	/// </summary>
	Xor
}

/// <summary>
/// A predefined structure template.
/// </summary>
public class StructureTemplate {
	/// <summary>
	/// Template name.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Description.
	/// </summary>
	public string Description { get; set; } = string.Empty;

	/// <summary>
	/// Category (e.g., "RPG", "Action").
	/// </summary>
	public string Category { get; set; } = string.Empty;

	/// <summary>
	/// Target platform.
	/// </summary>
	public string Platform { get; set; } = string.Empty;

	/// <summary>
	/// The structure definition.
	/// </summary>
	public DataStructure Structure { get; set; } = new();
}

/// <summary>
/// A detected potential data table.
/// </summary>
public class DetectedTable {
	/// <summary>
	/// ROM offset.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Estimated row count.
	/// </summary>
	public int EstimatedRows { get; set; }

	/// <summary>
	/// Estimated row size.
	/// </summary>
	public int EstimatedRowSize { get; set; }

	/// <summary>
	/// Confidence score (0-100).
	/// </summary>
	public int Confidence { get; set; }

	/// <summary>
	/// Pattern description.
	/// </summary>
	public string PatternDescription { get; set; } = string.Empty;
}

/// <summary>
/// Options for table detection.
/// </summary>
public class DataTableDetectionOptions {
	/// <summary>
	/// Minimum row size to consider.
	/// </summary>
	public int MinRowSize { get; set; } = 4;

	/// <summary>
	/// Maximum row size to consider.
	/// </summary>
	public int MaxRowSize { get; set; } = 64;

	/// <summary>
	/// Minimum number of rows.
	/// </summary>
	public int MinRows { get; set; } = 8;

	/// <summary>
	/// Minimum confidence threshold (0-100).
	/// </summary>
	public int MinConfidence { get; set; } = 50;

	/// <summary>
	/// Look for pointer tables.
	/// </summary>
	public bool DetectPointerTables { get; set; } = true;

	/// <summary>
	/// ROM size for pointer validation.
	/// </summary>
	public int RomSize { get; set; }
}
