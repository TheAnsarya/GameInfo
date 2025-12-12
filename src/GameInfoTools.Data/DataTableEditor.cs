using System.Text;
using System.Text.Json;

namespace GameInfoTools.Data;

/// <summary>
/// Generic data table extraction and editing.
/// </summary>
public class DataTableEditor {
	/// <summary>
	/// Field type in a data table.
	/// </summary>
	public enum FieldType {
		Byte,
		Word,
		Long,          // 24-bit
		SignedByte,
		SignedWord,
		BitFlags,
		FixedString,
		Pointer,
	}

	/// <summary>
	/// Field definition.
	/// </summary>
	public record FieldDef(string Name, FieldType Type, int Offset, int Size = 0, Dictionary<int, string>? ValueNames = null);

	/// <summary>
	/// Table definition.
	/// </summary>
	public class TableDef {
		public string Name { get; set; } = "";
		public int BaseOffset { get; set; }
		public int RecordSize { get; set; }
		public int RecordCount { get; set; }
		public List<FieldDef> Fields { get; } = new();

		/// <summary>
		/// Calculate total table size.
		/// </summary>
		public int TotalSize => RecordSize * RecordCount;
	}

	private readonly byte[] _data;

	public DataTableEditor(byte[] data) {
		_data = data;
	}

	/// <summary>
	/// Read a single field value.
	/// </summary>
	public object ReadField(int offset, FieldDef field) {
		int pos = offset + field.Offset;
		if (pos >= _data.Length) {
			return 0;
		}

		return field.Type switch {
			FieldType.Byte => _data[pos],
			FieldType.Word => ReadWord(pos),
			FieldType.Long => ReadLong(pos),
			FieldType.SignedByte => (sbyte)_data[pos],
			FieldType.SignedWord => (short)ReadWord(pos),
			FieldType.BitFlags => _data[pos],
			FieldType.FixedString => ReadFixedString(pos, field.Size),
			FieldType.Pointer => ReadWord(pos),
			_ => _data[pos]
		};
	}

	/// <summary>
	/// Write a field value.
	/// </summary>
	public void WriteField(int offset, FieldDef field, object value) {
		int pos = offset + field.Offset;
		if (pos >= _data.Length) {
			return;
		}

		switch (field.Type) {
			case FieldType.Byte:
			case FieldType.BitFlags:
				_data[pos] = Convert.ToByte(value);
				break;

			case FieldType.Word:
			case FieldType.Pointer:
				WriteWord(pos, Convert.ToUInt16(value));
				break;

			case FieldType.Long:
				WriteLong(pos, Convert.ToUInt32(value));
				break;

			case FieldType.SignedByte:
				_data[pos] = (byte)Convert.ToSByte(value);
				break;

			case FieldType.SignedWord:
				WriteWord(pos, (ushort)Convert.ToInt16(value));
				break;

			case FieldType.FixedString:
				WriteFixedString(pos, value.ToString() ?? "", field.Size);
				break;
		}
	}

	/// <summary>
	/// Read an entire record.
	/// </summary>
	public Dictionary<string, object> ReadRecord(TableDef table, int index) {
		var record = new Dictionary<string, object>();
		int offset = table.BaseOffset + (index * table.RecordSize);

		foreach (var field in table.Fields) {
			record[field.Name] = ReadField(offset, field);
		}

		return record;
	}

	/// <summary>
	/// Write an entire record.
	/// </summary>
	public void WriteRecord(TableDef table, int index, Dictionary<string, object> record) {
		int offset = table.BaseOffset + (index * table.RecordSize);

		foreach (var field in table.Fields) {
			if (record.TryGetValue(field.Name, out var value)) {
				WriteField(offset, field, value);
			}
		}
	}

	/// <summary>
	/// Read all records from a table.
	/// </summary>
	public List<Dictionary<string, object>> ReadAllRecords(TableDef table) {
		var records = new List<Dictionary<string, object>>();

		for (int i = 0; i < table.RecordCount; i++) {
			records.Add(ReadRecord(table, i));
		}

		return records;
	}

	/// <summary>
	/// Export table to JSON.
	/// </summary>
	public string ExportToJson(TableDef table, bool prettyPrint = true) {
		var records = ReadAllRecords(table);
		var options = new JsonSerializerOptions {
			WriteIndented = prettyPrint
		};
		return JsonSerializer.Serialize(records, options);
	}

	/// <summary>
	/// Import table from JSON.
	/// </summary>
	public void ImportFromJson(TableDef table, string json) {
		var records = JsonSerializer.Deserialize<List<Dictionary<string, object>>>(json);
		if (records == null) {
			return;
		}

		for (int i = 0; i < Math.Min(records.Count, table.RecordCount); i++) {
			// Convert JsonElement values to proper types
			var convertedRecord = ConvertJsonRecord(records[i], table);
			WriteRecord(table, i, convertedRecord);
		}
	}

	private Dictionary<string, object> ConvertJsonRecord(Dictionary<string, object> record, TableDef table) {
		var result = new Dictionary<string, object>();

		foreach (var kvp in record) {
			var field = table.Fields.FirstOrDefault(f => f.Name == kvp.Key);
			if (field == null) {
				continue;
			}

			object value = kvp.Value;

			// Handle JsonElement from deserialization
			if (value is JsonElement element) {
				value = field.Type switch {
					FieldType.Byte or FieldType.BitFlags => element.GetByte(),
					FieldType.Word or FieldType.Pointer => element.GetUInt16(),
					FieldType.Long => element.GetUInt32(),
					FieldType.SignedByte => element.GetSByte(),
					FieldType.SignedWord => element.GetInt16(),
					FieldType.FixedString => element.GetString() ?? "",
					_ => element.GetByte()
				};
			}

			result[kvp.Key] = value;
		}

		return result;
	}

	/// <summary>
	/// Export table to CSV.
	/// </summary>
	public string ExportToCsv(TableDef table) {
		var sb = new StringBuilder();
		var records = ReadAllRecords(table);

		// Header
		sb.AppendLine(string.Join(",", table.Fields.Select(f => f.Name)));

		// Data
		foreach (var record in records) {
			var values = table.Fields.Select(f => {
				if (record.TryGetValue(f.Name, out var value)) {
					if (f.Type == FieldType.FixedString) {
						return $"\"{value}\"";
					}

					return value.ToString() ?? "";
				}

				return "";
			});
			sb.AppendLine(string.Join(",", values));
		}

		return sb.ToString();
	}

	/// <summary>
	/// Generate assembly data for table.
	/// </summary>
	public string GenerateAsm(TableDef table, string label) {
		var sb = new StringBuilder();
		sb.AppendLine($"; {table.Name} - {table.RecordCount} entries, {table.RecordSize} bytes each");
		sb.AppendLine($"{label}:");

		var records = ReadAllRecords(table);

		for (int i = 0; i < records.Count; i++) {
			sb.Append($"\t.byte ");

			var values = new List<string>();
			int offset = table.BaseOffset + (i * table.RecordSize);

			for (int b = 0; b < table.RecordSize; b++) {
				values.Add($"${_data[offset + b]:x2}");
			}

			sb.Append(string.Join(", ", values));

			// Add comment with field values
			var fieldComments = table.Fields.Select(f => {
				if (records[i].TryGetValue(f.Name, out var value)) {
					if (f.ValueNames != null && f.ValueNames.TryGetValue(Convert.ToInt32(value), out var name)) {
						return $"{f.Name}={name}";
					}

					return $"{f.Name}={value}";
				}

				return "";
			}).Where(s => !string.IsNullOrEmpty(s));

			sb.AppendLine($"\t; {string.Join(", ", fieldComments)}");
		}

		return sb.ToString();
	}

	private int ReadWord(int offset) {
		if (offset + 1 >= _data.Length) {
			return 0;
		}

		return _data[offset] | (_data[offset + 1] << 8);
	}

	private void WriteWord(int offset, ushort value) {
		if (offset + 1 >= _data.Length) {
			return;
		}

		_data[offset] = (byte)(value & 0xff);
		_data[offset + 1] = (byte)((value >> 8) & 0xff);
	}

	private int ReadLong(int offset) {
		if (offset + 2 >= _data.Length) {
			return 0;
		}

		return _data[offset] | (_data[offset + 1] << 8) | (_data[offset + 2] << 16);
	}

	private void WriteLong(int offset, uint value) {
		if (offset + 2 >= _data.Length) {
			return;
		}

		_data[offset] = (byte)(value & 0xff);
		_data[offset + 1] = (byte)((value >> 8) & 0xff);
		_data[offset + 2] = (byte)((value >> 16) & 0xff);
	}

	private string ReadFixedString(int offset, int length) {
		var sb = new StringBuilder();
		for (int i = 0; i < length && offset + i < _data.Length; i++) {
			byte b = _data[offset + i];
			if (b == 0) {
				break;
			}

			sb.Append((char)b);
		}

		return sb.ToString();
	}

	private void WriteFixedString(int offset, string value, int length) {
		for (int i = 0; i < length && offset + i < _data.Length; i++) {
			_data[offset + i] = i < value.Length ? (byte)value[i] : (byte)0;
		}
	}
}

/// <summary>
/// Monster/enemy data specific editor.
/// </summary>
public class MonsterEditor : DataTableEditor {
	public MonsterEditor(byte[] data) : base(data) {
	}

	/// <summary>
	/// Create a standard NES Dragon Warrior style monster table definition.
	/// </summary>
	public static TableDef CreateDragonWarriorMonsterTable(int baseOffset, int count) {
		return new TableDef {
			Name = "Monster Stats",
			BaseOffset = baseOffset,
			RecordSize = 16,
			RecordCount = count,
			Fields =
			{
				new FieldDef("HP", FieldType.Byte, 0),
				new FieldDef("STR", FieldType.Byte, 1),
				new FieldDef("DEF", FieldType.Byte, 2),
				new FieldDef("AGI", FieldType.Byte, 3),
				new FieldDef("EXP", FieldType.Word, 4),
				new FieldDef("Gold", FieldType.Word, 6),
				new FieldDef("Flags", FieldType.BitFlags, 8),
				new FieldDef("ResistFire", FieldType.Byte, 9),
				new FieldDef("ResistIce", FieldType.Byte, 10),
				new FieldDef("Attack1", FieldType.Byte, 11),
				new FieldDef("Attack2", FieldType.Byte, 12),
			}
		};
	}
}

/// <summary>
/// Item data specific editor.
/// </summary>
public class ItemEditor : DataTableEditor {
	public ItemEditor(byte[] data) : base(data) {
	}

	/// <summary>
	/// Create a standard RPG item table definition.
	/// </summary>
	public static TableDef CreateItemTable(int baseOffset, int count, int recordSize = 8) {
		return new TableDef {
			Name = "Item Data",
			BaseOffset = baseOffset,
			RecordSize = recordSize,
			RecordCount = count,
			Fields =
			{
				new FieldDef("Type", FieldType.Byte, 0),
				new FieldDef("Effect", FieldType.Byte, 1),
				new FieldDef("Power", FieldType.Byte, 2),
				new FieldDef("Price", FieldType.Word, 3),
				new FieldDef("Flags", FieldType.BitFlags, 5),
				new FieldDef("Target", FieldType.Byte, 6),
			}
		};
	}
}

/// <summary>
/// Formula support for calculated columns.
/// </summary>
public class FormulaEngine {
	/// <summary>
	/// Formula definition for a calculated column.
	/// </summary>
	public record FormulaColumn(string Name, string Expression, DataTableEditor.FieldType ResultType);

	private readonly Dictionary<string, FormulaColumn> _formulas = new();

	/// <summary>
	/// Register a formula column.
	/// </summary>
	public void RegisterFormula(string name, string expression, DataTableEditor.FieldType resultType = DataTableEditor.FieldType.Word) {
		_formulas[name] = new FormulaColumn(name, expression, resultType);
	}

	/// <summary>
	/// Get all registered formulas.
	/// </summary>
	public IEnumerable<FormulaColumn> GetFormulas() => _formulas.Values;

	/// <summary>
	/// Evaluate a formula for a record.
	/// </summary>
	public object EvaluateFormula(string name, Dictionary<string, object> record) {
		if (!_formulas.TryGetValue(name, out var formula)) {
			throw new ArgumentException($"Formula '{name}' not found");
		}

		return EvaluateExpression(formula.Expression, record);
	}

	/// <summary>
	/// Evaluate all formulas for a record.
	/// </summary>
	public Dictionary<string, object> EvaluateAllFormulas(Dictionary<string, object> record) {
		var results = new Dictionary<string, object>();

		foreach (var formula in _formulas.Values) {
			results[formula.Name] = EvaluateExpression(formula.Expression, record);
		}

		return results;
	}

	/// <summary>
	/// Simple expression evaluator supporting basic math and field references.
	/// </summary>
	private object EvaluateExpression(string expression, Dictionary<string, object> record) {
		// Replace field references with values
		var expr = expression;
		foreach (var kvp in record) {
			var value = Convert.ToDouble(kvp.Value);
			expr = expr.Replace($"[{kvp.Key}]", value.ToString(System.Globalization.CultureInfo.InvariantCulture));
		}

		// Simple expression parser for basic operations
		return EvaluateMathExpression(expr);
	}

	/// <summary>
	/// Evaluate a simple math expression.
	/// </summary>
	private static double EvaluateMathExpression(string expr) {
		expr = expr.Trim();

		// Handle parentheses
		while (expr.Contains('(')) {
			int start = expr.LastIndexOf('(');
			int end = expr.IndexOf(')', start);
			if (end < 0) {
				break;
			}

			string inner = expr.Substring(start + 1, end - start - 1);
			double result = EvaluateMathExpression(inner);
			expr = expr[..start] + result.ToString(System.Globalization.CultureInfo.InvariantCulture) + expr[(end + 1)..];
		}

		// Handle operations in order of precedence
		// First: * and /
		var parts = SplitByOperator(expr, ['+', '-']);
		if (parts.Count > 1) {
			double result = EvaluateMathExpression(parts[0].Item1);
			for (int i = 1; i < parts.Count; i++) {
				double operand = EvaluateMathExpression(parts[i].Item1);
				result = parts[i].Item2 switch {
					'+' => result + operand,
					'-' => result - operand,
					_ => result
				};
			}

			return result;
		}

		parts = SplitByOperator(expr, ['*', '/']);
		if (parts.Count > 1) {
			double result = EvaluateMathExpression(parts[0].Item1);
			for (int i = 1; i < parts.Count; i++) {
				double operand = EvaluateMathExpression(parts[i].Item1);
				result = parts[i].Item2 switch {
					'*' => result * operand,
					'/' => operand != 0 ? result / operand : 0,
					_ => result
				};
			}

			return result;
		}

		// Try to parse as number
		if (double.TryParse(expr.Trim(), System.Globalization.NumberStyles.Any,
			System.Globalization.CultureInfo.InvariantCulture, out double num)) {
			return num;
		}

		return 0;
	}

	private static List<(string, char)> SplitByOperator(string expr, char[] operators) {
		var parts = new List<(string, char)>();
		int start = 0;
		char lastOp = '\0';

		for (int i = 0; i < expr.Length; i++) {
			if (operators.Contains(expr[i])) {
				parts.Add((expr[start..i], lastOp));
				lastOp = expr[i];
				start = i + 1;
			}
		}

		parts.Add((expr[start..], lastOp));
		return parts;
	}
}

/// <summary>
/// Data validation for table fields.
/// </summary>
public class DataValidator {
	/// <summary>
	/// Validation rule.
	/// </summary>
	public record ValidationRule(string FieldName, ValidationType Type, object? MinValue = null,
		object? MaxValue = null, IEnumerable<object>? AllowedValues = null, string? CustomMessage = null);

	/// <summary>
	/// Type of validation.
	/// </summary>
	public enum ValidationType {
		Range,          // Value must be within min/max
		AllowedValues,  // Value must be in list
		NotNull,        // Value cannot be null/empty
		Custom,         // Custom validation
	}

	/// <summary>
	/// Validation result.
	/// </summary>
	public record ValidationResult(bool IsValid, string? ErrorMessage, string? FieldName, int? RecordIndex);

	private readonly List<ValidationRule> _rules = [];

	/// <summary>
	/// Add a range validation rule.
	/// </summary>
	public void AddRangeRule(string fieldName, int min, int max, string? message = null) {
		_rules.Add(new ValidationRule(fieldName, ValidationType.Range, min, max, null, message));
	}

	/// <summary>
	/// Add an allowed values rule.
	/// </summary>
	public void AddAllowedValuesRule(string fieldName, IEnumerable<object> values, string? message = null) {
		_rules.Add(new ValidationRule(fieldName, ValidationType.AllowedValues, null, null, values, message));
	}

	/// <summary>
	/// Add a not-null rule.
	/// </summary>
	public void AddNotNullRule(string fieldName, string? message = null) {
		_rules.Add(new ValidationRule(fieldName, ValidationType.NotNull, null, null, null, message));
	}

	/// <summary>
	/// Validate a single record.
	/// </summary>
	public List<ValidationResult> ValidateRecord(Dictionary<string, object> record, int recordIndex = -1) {
		var results = new List<ValidationResult>();

		foreach (var rule in _rules) {
			if (!record.TryGetValue(rule.FieldName, out var value)) {
				if (rule.Type == ValidationType.NotNull) {
					results.Add(new ValidationResult(false, rule.CustomMessage ?? $"Field '{rule.FieldName}' is required",
						rule.FieldName, recordIndex >= 0 ? recordIndex : null));
				}

				continue;
			}

			switch (rule.Type) {
				case ValidationType.Range:
					double numValue = Convert.ToDouble(value);
					double min = Convert.ToDouble(rule.MinValue);
					double max = Convert.ToDouble(rule.MaxValue);
					if (numValue < min || numValue > max) {
						results.Add(new ValidationResult(false,
							rule.CustomMessage ?? $"Field '{rule.FieldName}' must be between {min} and {max}",
							rule.FieldName, recordIndex >= 0 ? recordIndex : null));
					}

					break;

				case ValidationType.AllowedValues:
					if (rule.AllowedValues != null && !rule.AllowedValues.Contains(value)) {
						results.Add(new ValidationResult(false,
							rule.CustomMessage ?? $"Field '{rule.FieldName}' has invalid value",
							rule.FieldName, recordIndex >= 0 ? recordIndex : null));
					}

					break;

				case ValidationType.NotNull:
					if (value == null || (value is string s && string.IsNullOrEmpty(s))) {
						results.Add(new ValidationResult(false,
							rule.CustomMessage ?? $"Field '{rule.FieldName}' cannot be empty",
							rule.FieldName, recordIndex >= 0 ? recordIndex : null));
					}

					break;
			}
		}

		return results;
	}

	/// <summary>
	/// Validate all records.
	/// </summary>
	public List<ValidationResult> ValidateAll(List<Dictionary<string, object>> records) {
		var allResults = new List<ValidationResult>();

		for (int i = 0; i < records.Count; i++) {
			allResults.AddRange(ValidateRecord(records[i], i));
		}

		return allResults;
	}

	/// <summary>
	/// Get all validation rules.
	/// </summary>
	public IEnumerable<ValidationRule> GetRules() => _rules;
}

/// <summary>
/// Table schema definition.
/// </summary>
public class TableSchema {
	/// <summary>
	/// Schema version.
	/// </summary>
	public string Version { get; set; } = "1.0";

	/// <summary>
	/// Schema name.
	/// </summary>
	public string Name { get; set; } = "";

	/// <summary>
	/// Description.
	/// </summary>
	public string Description { get; set; } = "";

	/// <summary>
	/// Table definitions in this schema.
	/// </summary>
	public List<DataTableEditor.TableDef> Tables { get; } = [];

	/// <summary>
	/// Cross-references between tables.
	/// </summary>
	public List<TableCrossRef> CrossReferences { get; } = [];

	/// <summary>
	/// Export schema to JSON.
	/// </summary>
	public string ToJson() {
		var options = new JsonSerializerOptions { WriteIndented = true };
		return JsonSerializer.Serialize(this, options);
	}

	/// <summary>
	/// Load schema from JSON.
	/// </summary>
	public static TableSchema? FromJson(string json) {
		return JsonSerializer.Deserialize<TableSchema>(json);
	}
}

/// <summary>
/// Cross-reference definition between tables.
/// </summary>
public record TableCrossRef(string SourceTable, string SourceField, string TargetTable, string TargetField, CrossRefType Type);

/// <summary>
/// Type of cross-reference.
/// </summary>
public enum CrossRefType {
	ForeignKey,     // Value in source references index in target
	Lookup,         // Value is looked up in target
	OneToMany,      // One source record references many target records
}

/// <summary>
/// Enhanced CSV import/export with headers.
/// </summary>
public class CsvHandler {
	/// <summary>
	/// CSV options.
	/// </summary>
	public record CsvOptions(char Delimiter = ',', bool HasHeader = true, string Quote = "\"", string Encoding = "UTF-8");

	/// <summary>
	/// Export table to CSV with headers.
	/// </summary>
	public static string ExportToCsv(DataTableEditor.TableDef table, List<Dictionary<string, object>> records, CsvOptions? options = null) {
		options ??= new CsvOptions();
		var sb = new StringBuilder();

		// Header row
		if (options.HasHeader) {
			var headers = table.Fields.Select(f => EscapeCsvField(f.Name, options));
			sb.AppendLine(string.Join(options.Delimiter, headers));
		}

		// Data rows
		foreach (var record in records) {
			var values = table.Fields.Select(f => {
				if (record.TryGetValue(f.Name, out var value)) {
					return EscapeCsvField(value?.ToString() ?? "", options);
				}

				return "";
			});
			sb.AppendLine(string.Join(options.Delimiter, values));
		}

		return sb.ToString();
	}

	/// <summary>
	/// Import from CSV with headers.
	/// </summary>
	public static List<Dictionary<string, object>> ImportFromCsv(string csv, DataTableEditor.TableDef table, CsvOptions? options = null) {
		options ??= new CsvOptions();
		var records = new List<Dictionary<string, object>>();
		var lines = csv.Split(['\r', '\n'], StringSplitOptions.RemoveEmptyEntries);

		if (lines.Length == 0) {
			return records;
		}

		string[]? headers = null;
		int startLine = 0;

		if (options.HasHeader) {
			headers = ParseCsvLine(lines[0], options);
			startLine = 1;
		} else {
			headers = table.Fields.Select(f => f.Name).ToArray();
		}

		for (int i = startLine; i < lines.Length; i++) {
			var values = ParseCsvLine(lines[i], options);
			var record = new Dictionary<string, object>();

			for (int j = 0; j < Math.Min(headers.Length, values.Length); j++) {
				var field = table.Fields.FirstOrDefault(f => f.Name == headers[j]);
				if (field != null) {
					record[headers[j]] = ConvertValue(values[j], field.Type);
				}
			}

			records.Add(record);
		}

		return records;
	}

	private static string EscapeCsvField(string value, CsvOptions options) {
		if (value.Contains(options.Delimiter) || value.Contains('\n') || value.Contains(options.Quote)) {
			return options.Quote + value.Replace(options.Quote, options.Quote + options.Quote) + options.Quote;
		}

		return value;
	}

	private static string[] ParseCsvLine(string line, CsvOptions options) {
		var values = new List<string>();
		bool inQuotes = false;
		var current = new StringBuilder();

		for (int i = 0; i < line.Length; i++) {
			char c = line[i];

			if (c == options.Quote[0]) {
				if (inQuotes && i + 1 < line.Length && line[i + 1] == options.Quote[0]) {
					current.Append(c);
					i++;
				} else {
					inQuotes = !inQuotes;
				}
			} else if (c == options.Delimiter && !inQuotes) {
				values.Add(current.ToString());
				current.Clear();
			} else {
				current.Append(c);
			}
		}

		values.Add(current.ToString());
		return [.. values];
	}

	private static object ConvertValue(string value, DataTableEditor.FieldType fieldType) {
		return fieldType switch {
			DataTableEditor.FieldType.Byte or DataTableEditor.FieldType.BitFlags =>
				byte.TryParse(value, out byte b) ? b : (byte)0,
			DataTableEditor.FieldType.Word or DataTableEditor.FieldType.Pointer =>
				ushort.TryParse(value, out ushort w) ? w : (ushort)0,
			DataTableEditor.FieldType.Long =>
				uint.TryParse(value, out uint l) ? l : 0u,
			DataTableEditor.FieldType.SignedByte =>
				sbyte.TryParse(value, out sbyte sb) ? sb : (sbyte)0,
			DataTableEditor.FieldType.SignedWord =>
				short.TryParse(value, out short sw) ? sw : (short)0,
			DataTableEditor.FieldType.FixedString => value,
			_ => value
		};
	}
}

/// <summary>
/// Undo/redo support for batch table edits.
/// </summary>
public class TableEditHistory {
	/// <summary>
	/// Edit operation type.
	/// </summary>
	public enum EditType {
		SetField,
		SetRecord,
		BatchEdit,
	}

	/// <summary>
	/// Single edit operation.
	/// </summary>
	public record EditOperation(EditType Type, int RecordIndex, string? FieldName, object? OldValue, object? NewValue,
		Dictionary<string, object>? OldRecord = null, Dictionary<string, object>? NewRecord = null);

	private readonly Stack<List<EditOperation>> _undoStack = new();
	private readonly Stack<List<EditOperation>> _redoStack = new();
	private List<EditOperation>? _currentBatch;

	/// <summary>
	/// Can undo.
	/// </summary>
	public bool CanUndo => _undoStack.Count > 0;

	/// <summary>
	/// Can redo.
	/// </summary>
	public bool CanRedo => _redoStack.Count > 0;

	/// <summary>
	/// Start a batch edit operation.
	/// </summary>
	public void BeginBatch() {
		_currentBatch = [];
	}

	/// <summary>
	/// End a batch edit operation.
	/// </summary>
	public void EndBatch() {
		if (_currentBatch != null && _currentBatch.Count > 0) {
			_undoStack.Push(_currentBatch);
			_redoStack.Clear();
		}

		_currentBatch = null;
	}

	/// <summary>
	/// Record a field edit.
	/// </summary>
	public void RecordFieldEdit(int recordIndex, string fieldName, object? oldValue, object? newValue) {
		var op = new EditOperation(EditType.SetField, recordIndex, fieldName, oldValue, newValue);
		RecordOperation(op);
	}

	/// <summary>
	/// Record a record edit.
	/// </summary>
	public void RecordRecordEdit(int recordIndex, Dictionary<string, object> oldRecord, Dictionary<string, object> newRecord) {
		var op = new EditOperation(EditType.SetRecord, recordIndex, null, null, null, oldRecord, newRecord);
		RecordOperation(op);
	}

	private void RecordOperation(EditOperation op) {
		if (_currentBatch != null) {
			_currentBatch.Add(op);
		} else {
			_undoStack.Push([op]);
			_redoStack.Clear();
		}
	}

	/// <summary>
	/// Undo last operation(s).
	/// </summary>
	public List<EditOperation>? Undo() {
		if (!CanUndo) {
			return null;
		}

		var operations = _undoStack.Pop();
		_redoStack.Push(operations);

		// Return reversed operations with swapped old/new values
		return operations.Select(op => op with {
			OldValue = op.NewValue,
			NewValue = op.OldValue,
			OldRecord = op.NewRecord,
			NewRecord = op.OldRecord
		}).Reverse().ToList();
	}

	/// <summary>
	/// Redo last undone operation(s).
	/// </summary>
	public List<EditOperation>? Redo() {
		if (!CanRedo) {
			return null;
		}

		var operations = _redoStack.Pop();
		_undoStack.Push(operations);

		return [.. operations];
	}

	/// <summary>
	/// Clear all history.
	/// </summary>
	public void Clear() {
		_undoStack.Clear();
		_redoStack.Clear();
		_currentBatch = null;
	}
}

/// <summary>
/// Cross-reference resolver between tables.
/// </summary>
public class TableCrossRefResolver {
	private readonly Dictionary<string, DataTableEditor.TableDef> _tables = new();
	private readonly Dictionary<string, List<Dictionary<string, object>>> _tableData = new();
	private readonly List<TableCrossRef> _crossRefs = [];

	/// <summary>
	/// Register a table.
	/// </summary>
	public void RegisterTable(DataTableEditor.TableDef table, List<Dictionary<string, object>> data) {
		_tables[table.Name] = table;
		_tableData[table.Name] = data;
	}

	/// <summary>
	/// Add a cross-reference.
	/// </summary>
	public void AddCrossRef(string sourceTable, string sourceField, string targetTable, string targetField, CrossRefType type) {
		_crossRefs.Add(new TableCrossRef(sourceTable, sourceField, targetTable, targetField, type));
	}

	/// <summary>
	/// Resolve a foreign key reference.
	/// </summary>
	public Dictionary<string, object>? ResolveReference(string sourceTable, string sourceField, object value) {
		var xref = _crossRefs.FirstOrDefault(x => x.SourceTable == sourceTable && x.SourceField == sourceField);
		if (xref == null) {
			return null;
		}

		if (!_tableData.TryGetValue(xref.TargetTable, out var targetData)) {
			return null;
		}

		int index = Convert.ToInt32(value);
		if (index >= 0 && index < targetData.Count) {
			return targetData[index];
		}

		return null;
	}

	/// <summary>
	/// Get all records referencing a target.
	/// </summary>
	public List<(string Table, int RecordIndex, Dictionary<string, object> Record)> GetReferencingRecords(
		string targetTable, int targetIndex) {
		var results = new List<(string, int, Dictionary<string, object>)>();

		foreach (var xref in _crossRefs.Where(x => x.TargetTable == targetTable)) {
			if (!_tableData.TryGetValue(xref.SourceTable, out var sourceData)) {
				continue;
			}

			for (int i = 0; i < sourceData.Count; i++) {
				var record = sourceData[i];
				if (record.TryGetValue(xref.SourceField, out var value)) {
					if (Convert.ToInt32(value) == targetIndex) {
						results.Add((xref.SourceTable, i, record));
					}
				}
			}
		}

		return results;
	}

	/// <summary>
	/// Validate all cross-references.
	/// </summary>
	public List<string> ValidateCrossReferences() {
		var errors = new List<string>();

		foreach (var xref in _crossRefs) {
			if (!_tableData.TryGetValue(xref.SourceTable, out var sourceData)) {
				errors.Add($"Source table '{xref.SourceTable}' not found");
				continue;
			}

			if (!_tableData.TryGetValue(xref.TargetTable, out var targetData)) {
				errors.Add($"Target table '{xref.TargetTable}' not found");
				continue;
			}

			for (int i = 0; i < sourceData.Count; i++) {
				var record = sourceData[i];
				if (record.TryGetValue(xref.SourceField, out var value)) {
					int index = Convert.ToInt32(value);
					if (index < 0 || index >= targetData.Count) {
						errors.Add($"Invalid reference in {xref.SourceTable}[{i}].{xref.SourceField}: index {index} out of range");
					}
				}
			}
		}

		return errors;
	}
}
