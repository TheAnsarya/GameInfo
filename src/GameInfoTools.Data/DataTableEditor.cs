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
