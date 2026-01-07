namespace GameInfoTools.Core.Interfaces;

/// <summary>
/// Represents a data table column definition.
/// </summary>
public record DataColumn(
	string Name,
	string Type,          // byte, word, string, pointer, etc.
	int Size,             // Size in bytes
	string? Format = null // Display format (hex, decimal, enum name)
);

/// <summary>
/// Represents a data table definition.
/// </summary>
public record DataTableDefinition(
	string Name,
	int Offset,
	int RecordCount,
	int RecordSize,
	DataColumn[] Columns
);

/// <summary>
/// Interface for data table editor services.
/// </summary>
public interface IDataEditorService
{
	/// <summary>All defined data tables.</summary>
	IReadOnlyList<DataTableDefinition> Tables { get; }

	/// <summary>Defines a new data table.</summary>
	void DefineTable(DataTableDefinition definition);

	/// <summary>Gets a table by name.</summary>
	DataTableDefinition? GetTable(string name);

	/// <summary>Removes a table definition.</summary>
	void RemoveTable(string name);

	/// <summary>Gets all records from a table.</summary>
	IEnumerable<Dictionary<string, object>> GetRecords(string tableName);

	/// <summary>Gets a specific record from a table.</summary>
	Dictionary<string, object>? GetRecord(string tableName, int index);

	/// <summary>Sets a field value in a record.</summary>
	void SetField(string tableName, int recordIndex, string fieldName, object value);

	/// <summary>Adds a new record to a table.</summary>
	void AddRecord(string tableName, Dictionary<string, object> values);

	/// <summary>Removes a record from a table.</summary>
	void RemoveRecord(string tableName, int index);

	/// <summary>Exports a table to JSON.</summary>
	string ExportTableToJson(string tableName);

	/// <summary>Imports a table from JSON.</summary>
	void ImportTableFromJson(string tableName, string json);

	/// <summary>Exports a table to CSV.</summary>
	string ExportTableToCsv(string tableName);

	/// <summary>Loads table definitions from a JSON schema.</summary>
	void LoadSchema(string schemaJson);

	/// <summary>Saves table definitions to a JSON schema.</summary>
	string SaveSchema();

	/// <summary>Undoes the last edit.</summary>
	void Undo();

	/// <summary>Redoes the last undone edit.</summary>
	void Redo();

	/// <summary>Whether an undo operation is available.</summary>
	bool CanUndo { get; }

	/// <summary>Whether a redo operation is available.</summary>
	bool CanRedo { get; }

	/// <summary>Fired when table data changes.</summary>
	event EventHandler<string>? TableChanged;
}
