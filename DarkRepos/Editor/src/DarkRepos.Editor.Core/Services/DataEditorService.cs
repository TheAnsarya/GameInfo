using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using DarkRepos.Editor.Core.Interfaces;

namespace DarkRepos.Editor.Core.Services;

/// <summary>
/// Implementation of IDataEditorService for editing structured game data.
/// </summary>
public class DataEditorService : IDataEditorService {
	private static readonly JsonSerializerOptions JsonOptions = new() {
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		Converters = { new JsonStringEnumConverter() }
	};

	/// <inheritdoc />
	public DataStructure LoadStructureDefinition(string jsonSchema) {
		if (string.IsNullOrWhiteSpace(jsonSchema))
			throw new ArgumentException("Schema cannot be empty", nameof(jsonSchema));

		var structure = JsonSerializer.Deserialize<DataStructure>(jsonSchema, JsonOptions)
			?? throw new InvalidOperationException("Failed to deserialize structure definition");

		return structure;
	}

	/// <inheritdoc />
	public DataTable LoadDataTable(byte[] data, int offset, DataStructure structure, int rowCount) {
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(structure);

		var table = new DataTable {
			Name = structure.Name,
			Offset = offset,
			Structure = structure
		};

		var recordSize = structure.RecordSize;

		for (int i = 0; i < rowCount; i++) {
			var recordOffset = offset + (i * recordSize);
			if (recordOffset + recordSize > data.Length)
				break;

			var record = LoadRecord(data, recordOffset, structure);
			record.Index = i;
			table.Records.Add(record);
		}

		return table;
	}

	/// <inheritdoc />
	public DataRecord LoadRecord(byte[] data, int offset, DataStructure structure) {
		var record = new DataRecord {
			Offset = offset,
			RawBytes = new byte[structure.RecordSize]
		};

		if (offset + structure.RecordSize <= data.Length) {
			Array.Copy(data, offset, record.RawBytes, 0, structure.RecordSize);
		}

		var pos = 0;
		foreach (var field in structure.Fields) {
			var value = ReadFieldValue(record.RawBytes, pos, field, structure.Endianness);
			record.Values[field.Name] = value;
			pos += field.GetByteSize();
		}

		return record;
	}

	/// <inheritdoc />
	public byte[] ExportTable(DataTable table) {
		var result = new byte[table.TotalSize];
		var pos = 0;

		foreach (var record in table.Records) {
			var recordBytes = ExportRecord(record, table.Structure);
			Array.Copy(recordBytes, 0, result, pos, recordBytes.Length);
			pos += recordBytes.Length;
		}

		return result;
	}

	/// <inheritdoc />
	public byte[] ExportRecord(DataRecord record, DataStructure structure) {
		var result = new byte[structure.RecordSize];
		var pos = 0;

		foreach (var field in structure.Fields) {
			if (record.Values.TryGetValue(field.Name, out var value)) {
				WriteFieldValue(result, pos, field, value, structure.Endianness);
			}

			pos += field.GetByteSize();
		}

		return result;
	}

	/// <inheritdoc />
	public string ExportToJson(DataTable table, bool pretty = true) {
		var options = new JsonSerializerOptions(JsonOptions) {
			WriteIndented = pretty
		};

		var exportData = new {
			table.Name,
			table.Structure.RecordSize,
			RecordCount = table.Records.Count,
			Records = table.Records.Select(r => new {
				r.Index,
				r.Label,
				r.Values
			})
		};

		return JsonSerializer.Serialize(exportData, options);
	}

	/// <inheritdoc />
	public string ExportToCsv(DataTable table, bool includeHeader = true) {
		var sb = new StringBuilder();

		if (includeHeader) {
			sb.AppendLine(string.Join(",", table.Structure.Fields.Select(f =>
				EscapeCsv(string.IsNullOrEmpty(f.Label) ? f.Name : f.Label))));
		}

		foreach (var record in table.Records) {
			var values = table.Structure.Fields.Select(f => {
				var val = record.Values.TryGetValue(f.Name, out var v) ? v : "";
				return EscapeCsv(FormatValue(val, f));
			});
			sb.AppendLine(string.Join(",", values));
		}

		return sb.ToString();
	}

	/// <inheritdoc />
	public DataTable ImportFromJson(string json, DataStructure structure) {
		using var doc = JsonDocument.Parse(json);
		var root = doc.RootElement;

		var table = new DataTable {
			Name = structure.Name,
			Structure = structure
		};

		if (root.TryGetProperty("records", out var records) || root.TryGetProperty("Records", out records)) {
			var index = 0;
			foreach (var recordElement in records.EnumerateArray()) {
				var record = new DataRecord { Index = index++ };

				if (recordElement.TryGetProperty("values", out var values) || recordElement.TryGetProperty("Values", out values)) {
					foreach (var field in structure.Fields) {
						if (values.TryGetProperty(field.Name, out var fieldValue)) {
							record.Values[field.Name] = ParseJsonValue(fieldValue, field);
						}
					}
				}

				if (recordElement.TryGetProperty("label", out var label) || recordElement.TryGetProperty("Label", out label)) {
					record.Label = label.GetString();
				}

				table.Records.Add(record);
			}
		}

		return table;
	}

	/// <inheritdoc />
	public DataTable ImportFromCsv(string csv, DataStructure structure) {
		var lines = csv.Split('\n', StringSplitOptions.RemoveEmptyEntries)
			.Select(l => l.TrimEnd('\r'))
			.ToList();

		if (lines.Count == 0)
			return new DataTable { Structure = structure };

		// Assume first line is header
		var headers = ParseCsvLine(lines[0]);

		var table = new DataTable {
			Name = structure.Name,
			Structure = structure
		};

		for (int i = 1; i < lines.Count; i++) {
			var values = ParseCsvLine(lines[i]);
			var record = new DataRecord { Index = i - 1 };

			for (int j = 0; j < Math.Min(headers.Count, values.Count); j++) {
				var field = structure.Fields.FirstOrDefault(f =>
					f.Name.Equals(headers[j], StringComparison.OrdinalIgnoreCase) ||
					(f.Label?.Equals(headers[j], StringComparison.OrdinalIgnoreCase) ?? false));

				if (field != null) {
					record.Values[field.Name] = ParseStringValue(values[j], field);
				}
			}

			table.Records.Add(record);
		}

		return table;
	}

	/// <inheritdoc />
	public uint CalculateChecksum(DataTable table, ChecksumType type) {
		var data = ExportTable(table);
		return CalculateChecksum(data, type);
	}

	private static uint CalculateChecksum(byte[] data, ChecksumType type) {
		return type switch {
			ChecksumType.Sum8 => (uint)data.Sum(b => b) & 0xff,
			ChecksumType.Sum16 => (uint)data.Sum(b => b) & 0xffff,
			ChecksumType.Xor => data.Aggregate(0u, (acc, b) => acc ^ b),
			ChecksumType.Crc16 => CalculateCrc16(data),
			ChecksumType.Crc32 => CalculateCrc32(data),
			_ => 0
		};
	}

	private static uint CalculateCrc16(byte[] data) {
		uint crc = 0xffff;
		foreach (var b in data) {
			crc ^= b;
			for (int i = 0; i < 8; i++) {
				if ((crc & 1) != 0)
					crc = (crc >> 1) ^ 0xa001;
				else
					crc >>= 1;
			}
		}

		return crc;
	}

	private static uint CalculateCrc32(byte[] data) {
		uint crc = 0xffffffff;
		foreach (var b in data) {
			crc ^= b;
			for (int i = 0; i < 8; i++) {
				if ((crc & 1) != 0)
					crc = (crc >> 1) ^ 0xedb88320;
				else
					crc >>= 1;
			}
		}

		return ~crc;
	}

	/// <inheritdoc />
	public DataValidationResult ValidateTable(DataTable table) {
		var result = new DataValidationResult { IsValid = true };

		foreach (var record in table.Records) {
			var recordResult = ValidateRecord(record, table.Structure);
			result.Errors.AddRange(recordResult.Errors);
			result.Warnings.AddRange(recordResult.Warnings);
		}

		result.IsValid = result.Errors.Count == 0;
		return result;
	}

	/// <inheritdoc />
	public DataValidationResult ValidateRecord(DataRecord record, DataStructure structure) {
		var result = new DataValidationResult { IsValid = true };

		foreach (var field in structure.Fields) {
			if (!record.Values.TryGetValue(field.Name, out var value)) {
				if (field.DefaultValue == null) {
					result.Errors.Add(new DataValidationError {
						RecordIndex = record.Index,
						FieldName = field.Name,
						Message = $"Missing required field '{field.Name}'",
						Severity = ValidationSeverity.Error
					});
				}

				continue;
			}

			// Check numeric constraints
			if (value is long longValue || (value is int intValue && (longValue = intValue) == intValue) ||
				(value is uint uintValue && (longValue = uintValue) == uintValue) ||
				(value is byte byteValue && (longValue = byteValue) == byteValue)) {
				if (field.MinValue.HasValue && longValue < field.MinValue.Value) {
					result.Errors.Add(new DataValidationError {
						RecordIndex = record.Index,
						FieldName = field.Name,
						Message = $"Value {longValue} is below minimum {field.MinValue}",
						Severity = ValidationSeverity.Error
					});
				}

				if (field.MaxValue.HasValue && longValue > field.MaxValue.Value) {
					result.Errors.Add(new DataValidationError {
						RecordIndex = record.Index,
						FieldName = field.Name,
						Message = $"Value {longValue} exceeds maximum {field.MaxValue}",
						Severity = ValidationSeverity.Error
					});
				}
			}

			// Check enum values
			if (field.EnumValues != null && value is int enumInt && !field.EnumValues.ContainsKey(enumInt)) {
				result.Warnings.Add(new DataValidationError {
					RecordIndex = record.Index,
					FieldName = field.Name,
					Message = $"Value {enumInt} is not a defined enum value",
					Severity = ValidationSeverity.Warning
				});
			}
		}

		result.IsValid = result.Errors.Count == 0;
		return result;
	}

	/// <inheritdoc />
	public IReadOnlyList<StructureTemplate> GetTemplates() {
		return
		[
			CreateRpgCharacterTemplate(),
			CreateRpgItemTemplate(),
			CreateRpgMonsterTemplate(),
			CreateRpgSpellTemplate(),
			CreateRpgShopTemplate(),
			CreateActionEnemyTemplate(),
			CreateActionWeaponTemplate(),
			CreatePlatformerLevelTemplate()
		];
	}

	/// <inheritdoc />
	public IReadOnlyList<DetectedTable> DetectTables(byte[] data, DataTableDetectionOptions options) {
		var results = new List<DetectedTable>();

		// Look for pointer tables
		if (options.DetectPointerTables && options.RomSize > 0) {
			DetectPointerTables(data, options, results);
		}

		// Look for repeating patterns
		DetectRepeatingPatterns(data, options, results);

		return results.OrderByDescending(r => r.Confidence).ToList();
	}

	/// <inheritdoc />
	public object? GetFieldValue(DataRecord record, string fieldName) {
		return record.Values.TryGetValue(fieldName, out var value) ? value : null;
	}

	/// <inheritdoc />
	public void SetFieldValue(DataRecord record, string fieldName, object value) {
		record.Values[fieldName] = value;
		record.IsModified = true;
	}

	/// <inheritdoc />
	public IReadOnlyList<DataRecord> FindRecords(DataTable table, Func<DataRecord, bool> predicate) {
		return table.Records.Where(predicate).ToList();
	}

	/// <inheritdoc />
	public void SortTable(DataTable table, string fieldName, bool ascending = true) {
		var field = table.Structure.Fields.FirstOrDefault(f => f.Name == fieldName);
		if (field == null) return;

		var sorted = ascending
			? table.Records.OrderBy(r => r.Values.TryGetValue(fieldName, out var v) ? v : null).ToList()
			: table.Records.OrderByDescending(r => r.Values.TryGetValue(fieldName, out var v) ? v : null).ToList();

		table.Records.Clear();
		for (int i = 0; i < sorted.Count; i++) {
			sorted[i].Index = i;
			table.Records.Add(sorted[i]);
		}

		table.IsModified = true;
	}

	#region Private Helpers

	private static object ReadFieldValue(byte[] data, int offset, DataField field, Endianness endianness) {
		if (offset >= data.Length)
			return GetDefaultValue(field);

		switch (field.Type) {
			case DataFieldType.Byte:
				return data[offset];

			case DataFieldType.SByte:
				return (sbyte)data[offset];

			case DataFieldType.Word:
				return ReadWord(data, offset, endianness);

			case DataFieldType.SWord:
				return (short)ReadWord(data, offset, endianness);

			case DataFieldType.DWord:
				return ReadDWord(data, offset, endianness);

			case DataFieldType.SDWord:
				return (int)ReadDWord(data, offset, endianness);

			case DataFieldType.Bits:
				return ReadBits(data, offset, field.BitOffset, field.BitWidth);

			case DataFieldType.FixedString:
				return ReadString(data, offset, field.Size);

			case DataFieldType.Pointer:
				return field.Size == 3
					? Read24Bit(data, offset, endianness)
					: ReadWord(data, offset, endianness);

			case DataFieldType.Bool:
				return data[offset] != 0;

			case DataFieldType.Enum:
			case DataFieldType.Flags:
				return field.Size switch {
					1 => data[offset],
					2 => ReadWord(data, offset, endianness),
					4 => ReadDWord(data, offset, endianness),
					_ => data[offset]
				};

			default:
				return data[offset];
		}
	}

	private static void WriteFieldValue(byte[] data, int offset, DataField field, object value, Endianness endianness) {
		if (offset >= data.Length)
			return;

		switch (field.Type) {
			case DataFieldType.Byte:
			case DataFieldType.Bool:
				data[offset] = Convert.ToByte(value);
				break;

			case DataFieldType.SByte:
				data[offset] = (byte)Convert.ToSByte(value);
				break;

			case DataFieldType.Word:
			case DataFieldType.SWord:
				WriteWord(data, offset, Convert.ToUInt16(value), endianness);
				break;

			case DataFieldType.DWord:
			case DataFieldType.SDWord:
				WriteDWord(data, offset, Convert.ToUInt32(value), endianness);
				break;

			case DataFieldType.Bits:
				WriteBits(data, offset, field.BitOffset, field.BitWidth, Convert.ToInt32(value));
				break;

			case DataFieldType.FixedString:
				WriteString(data, offset, field.Size, value?.ToString() ?? "");
				break;

			case DataFieldType.Pointer:
				if (field.Size == 3)
					Write24Bit(data, offset, Convert.ToUInt32(value), endianness);
				else
					WriteWord(data, offset, Convert.ToUInt16(value), endianness);
				break;

			case DataFieldType.Enum:
			case DataFieldType.Flags:
				if (field.Size == 1)
					data[offset] = Convert.ToByte(value);
				else if (field.Size == 2)
					WriteWord(data, offset, Convert.ToUInt16(value), endianness);
				else if (field.Size == 4)
					WriteDWord(data, offset, Convert.ToUInt32(value), endianness);
				break;
		}
	}

	private static ushort ReadWord(byte[] data, int offset, Endianness endianness) {
		if (offset + 1 >= data.Length) return 0;
		return endianness == Endianness.Little
			? (ushort)(data[offset] | (data[offset + 1] << 8))
			: (ushort)((data[offset] << 8) | data[offset + 1]);
	}

	private static void WriteWord(byte[] data, int offset, ushort value, Endianness endianness) {
		if (offset + 1 >= data.Length) return;
		if (endianness == Endianness.Little) {
			data[offset] = (byte)(value & 0xff);
			data[offset + 1] = (byte)((value >> 8) & 0xff);
		} else {
			data[offset] = (byte)((value >> 8) & 0xff);
			data[offset + 1] = (byte)(value & 0xff);
		}
	}

	private static uint ReadDWord(byte[] data, int offset, Endianness endianness) {
		if (offset + 3 >= data.Length) return 0;
		return endianness == Endianness.Little
			? (uint)(data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24))
			: (uint)((data[offset] << 24) | (data[offset + 1] << 16) | (data[offset + 2] << 8) | data[offset + 3]);
	}

	private static void WriteDWord(byte[] data, int offset, uint value, Endianness endianness) {
		if (offset + 3 >= data.Length) return;
		if (endianness == Endianness.Little) {
			data[offset] = (byte)(value & 0xff);
			data[offset + 1] = (byte)((value >> 8) & 0xff);
			data[offset + 2] = (byte)((value >> 16) & 0xff);
			data[offset + 3] = (byte)((value >> 24) & 0xff);
		} else {
			data[offset] = (byte)((value >> 24) & 0xff);
			data[offset + 1] = (byte)((value >> 16) & 0xff);
			data[offset + 2] = (byte)((value >> 8) & 0xff);
			data[offset + 3] = (byte)(value & 0xff);
		}
	}

	private static uint Read24Bit(byte[] data, int offset, Endianness endianness) {
		if (offset + 2 >= data.Length) return 0;
		return endianness == Endianness.Little
			? (uint)(data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16))
			: (uint)((data[offset] << 16) | (data[offset + 1] << 8) | data[offset + 2]);
	}

	private static void Write24Bit(byte[] data, int offset, uint value, Endianness endianness) {
		if (offset + 2 >= data.Length) return;
		if (endianness == Endianness.Little) {
			data[offset] = (byte)(value & 0xff);
			data[offset + 1] = (byte)((value >> 8) & 0xff);
			data[offset + 2] = (byte)((value >> 16) & 0xff);
		} else {
			data[offset] = (byte)((value >> 16) & 0xff);
			data[offset + 1] = (byte)((value >> 8) & 0xff);
			data[offset + 2] = (byte)(value & 0xff);
		}
	}

	private static int ReadBits(byte[] data, int offset, int bitOffset, int bitWidth) {
		if (offset >= data.Length) return 0;
		var value = data[offset];
		var mask = (1 << bitWidth) - 1;
		return (value >> bitOffset) & mask;
	}

	private static void WriteBits(byte[] data, int offset, int bitOffset, int bitWidth, int value) {
		if (offset >= data.Length) return;
		var mask = (1 << bitWidth) - 1;
		data[offset] = (byte)((data[offset] & ~(mask << bitOffset)) | ((value & mask) << bitOffset));
	}

	private static string ReadString(byte[] data, int offset, int length) {
		if (offset >= data.Length) return "";
		var actualLength = Math.Min(length, data.Length - offset);
		var bytes = new byte[actualLength];
		Array.Copy(data, offset, bytes, 0, actualLength);

		// Find null terminator
		var nullIndex = Array.IndexOf(bytes, (byte)0);
		if (nullIndex >= 0)
			return Encoding.ASCII.GetString(bytes, 0, nullIndex);

		return Encoding.ASCII.GetString(bytes);
	}

	private static void WriteString(byte[] data, int offset, int length, string value) {
		if (offset >= data.Length) return;
		var bytes = Encoding.ASCII.GetBytes(value);
		var writeLength = Math.Min(length, Math.Min(bytes.Length, data.Length - offset));
		Array.Copy(bytes, 0, data, offset, writeLength);

		// Zero-fill remainder
		for (int i = writeLength; i < length && offset + i < data.Length; i++)
			data[offset + i] = 0;
	}

	private static object GetDefaultValue(DataField field) {
		return field.Type switch {
			DataFieldType.Byte or DataFieldType.Bits or DataFieldType.Enum or DataFieldType.Flags => (byte)0,
			DataFieldType.SByte => (sbyte)0,
			DataFieldType.Word or DataFieldType.Pointer => (ushort)0,
			DataFieldType.SWord => (short)0,
			DataFieldType.DWord => (uint)0,
			DataFieldType.SDWord => 0,
			DataFieldType.Bool => false,
			DataFieldType.FixedString => "",
			_ => 0
		};
	}

	private static string EscapeCsv(string value) {
		if (value.Contains(',') || value.Contains('"') || value.Contains('\n')) {
			return $"\"{value.Replace("\"", "\"\"")}\"";
		}

		return value;
	}

	private static string FormatValue(object value, DataField field) {
		if (value == null) return "";

		if (field.DisplayFormat != null) {
			return string.Format($"{{0:{field.DisplayFormat}}}", value);
		}

		if (field.EnumValues != null && value is int intVal && field.EnumValues.TryGetValue(intVal, out var enumName)) {
			return enumName;
		}

		return value.ToString() ?? "";
	}

	private static List<string> ParseCsvLine(string line) {
		var result = new List<string>();
		var current = new StringBuilder();
		var inQuotes = false;

		for (int i = 0; i < line.Length; i++) {
			var c = line[i];

			if (c == '"') {
				if (inQuotes && i + 1 < line.Length && line[i + 1] == '"') {
					current.Append('"');
					i++;
				} else {
					inQuotes = !inQuotes;
				}
			} else if (c == ',' && !inQuotes) {
				result.Add(current.ToString());
				current.Clear();
			} else {
				current.Append(c);
			}
		}

		result.Add(current.ToString());
		return result;
	}

	private static object ParseJsonValue(JsonElement element, DataField field) {
		return field.Type switch {
			DataFieldType.Byte or DataFieldType.Bits or DataFieldType.Enum or DataFieldType.Flags
				=> element.TryGetByte(out var b) ? b : (byte)0,
			DataFieldType.SByte => element.TryGetSByte(out var sb) ? sb : (sbyte)0,
			DataFieldType.Word or DataFieldType.Pointer => element.TryGetUInt16(out var w) ? w : (ushort)0,
			DataFieldType.SWord => element.TryGetInt16(out var sw) ? sw : (short)0,
			DataFieldType.DWord => element.TryGetUInt32(out var dw) ? dw : 0u,
			DataFieldType.SDWord => element.TryGetInt32(out var sdw) ? sdw : 0,
			DataFieldType.Bool => element.GetBoolean(),
			DataFieldType.FixedString => element.GetString() ?? "",
			_ => element.TryGetInt32(out var i) ? i : 0
		};
	}

	private static object ParseStringValue(string value, DataField field) {
		if (string.IsNullOrEmpty(value))
			return GetDefaultValue(field);

		// Try to match enum name
		if (field.EnumValues != null) {
			var match = field.EnumValues.FirstOrDefault(kv =>
				kv.Value.Equals(value, StringComparison.OrdinalIgnoreCase));
			if (match.Value != null)
				return match.Key;
		}

		return field.Type switch {
			DataFieldType.Byte or DataFieldType.Bits or DataFieldType.Enum or DataFieldType.Flags
				=> byte.TryParse(value, out var b) ? b : (byte)0,
			DataFieldType.SByte => sbyte.TryParse(value, out var sb) ? sb : (sbyte)0,
			DataFieldType.Word or DataFieldType.Pointer => ushort.TryParse(value, out var w) ? w : (ushort)0,
			DataFieldType.SWord => short.TryParse(value, out var sw) ? sw : (short)0,
			DataFieldType.DWord => uint.TryParse(value, out var dw) ? dw : 0u,
			DataFieldType.SDWord => int.TryParse(value, out var sdw) ? sdw : 0,
			DataFieldType.Bool => value.Equals("true", StringComparison.OrdinalIgnoreCase) || value == "1",
			DataFieldType.FixedString => value,
			_ => int.TryParse(value, out var i) ? i : 0
		};
	}

	private static void DetectPointerTables(byte[] data, DataTableDetectionOptions options, List<DetectedTable> results) {
		// Look for sequences of valid pointers
		for (int offset = 0; offset < data.Length - 16; offset += 2) {
			var validPointers = 0;
			var lastPointer = 0;
			var increasing = true;

			for (int i = 0; i < 64 && offset + (i * 2) + 1 < data.Length; i++) {
				var pointer = data[offset + (i * 2)] | (data[offset + (i * 2) + 1] << 8);

				// Check if pointer is within ROM range
				if (pointer >= 0x8000 && pointer < options.RomSize + 0x8000) {
					validPointers++;
					if (pointer < lastPointer) increasing = false;
					lastPointer = pointer;
				} else if (validPointers >= options.MinRows) {
					break;
				} else {
					validPointers = 0;
				}
			}

			if (validPointers >= options.MinRows) {
				results.Add(new DetectedTable {
					Offset = offset,
					EstimatedRows = validPointers,
					EstimatedRowSize = 2,
					Confidence = Math.Min(100, 50 + validPointers + (increasing ? 20 : 0)),
					PatternDescription = $"Pointer table ({validPointers} entries{(increasing ? ", ascending" : "")})"
				});

				offset += validPointers * 2;
			}
		}
	}

	private static void DetectRepeatingPatterns(byte[] data, DataTableDetectionOptions options, List<DetectedTable> results) {
		for (int rowSize = options.MinRowSize; rowSize <= options.MaxRowSize; rowSize++) {
			for (int offset = 0; offset < data.Length - (rowSize * options.MinRows); offset++) {
				var matches = 0;
				var lastFirstByte = data[offset];

				for (int row = 1; row < 128 && offset + (row * rowSize) < data.Length; row++) {
					var currentFirstByte = data[offset + (row * rowSize)];

					// Look for patterns: sequential IDs, similar structure
					if (Math.Abs(currentFirstByte - lastFirstByte) <= 1) {
						matches++;
					} else {
						break;
					}

					lastFirstByte = currentFirstByte;
				}

				if (matches >= options.MinRows) {
					var confidence = Math.Min(100, 30 + matches + (100 / rowSize));
					if (confidence >= options.MinConfidence) {
						results.Add(new DetectedTable {
							Offset = offset,
							EstimatedRows = matches + 1,
							EstimatedRowSize = rowSize,
							Confidence = confidence,
							PatternDescription = $"Repeating {rowSize}-byte records ({matches + 1} rows)"
						});
					}

					offset += matches * rowSize;
				}
			}
		}
	}

	#endregion

	#region Templates

	private static StructureTemplate CreateRpgCharacterTemplate() {
		return new StructureTemplate {
			Name = "RPG Character Stats",
			Description = "Basic RPG character/party member stats",
			Category = "RPG",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "Character",
				Fields =
				[
					new DataField { Name = "hp", Label = "HP", Type = DataFieldType.Word, MinValue = 0, MaxValue = 999 },
					new DataField { Name = "maxHp", Label = "Max HP", Type = DataFieldType.Word, MinValue = 1, MaxValue = 999 },
					new DataField { Name = "mp", Label = "MP", Type = DataFieldType.Byte, MinValue = 0, MaxValue = 99 },
					new DataField { Name = "maxMp", Label = "Max MP", Type = DataFieldType.Byte, MinValue = 0, MaxValue = 99 },
					new DataField { Name = "attack", Label = "Attack", Type = DataFieldType.Byte },
					new DataField { Name = "defense", Label = "Defense", Type = DataFieldType.Byte },
					new DataField { Name = "agility", Label = "Agility", Type = DataFieldType.Byte },
					new DataField { Name = "luck", Label = "Luck", Type = DataFieldType.Byte },
					new DataField { Name = "level", Label = "Level", Type = DataFieldType.Byte, MinValue = 1, MaxValue = 99 },
					new DataField { Name = "exp", Label = "Experience", Type = DataFieldType.DWord }
				]
			}
		};
	}

	private static StructureTemplate CreateRpgItemTemplate() {
		return new StructureTemplate {
			Name = "RPG Item",
			Description = "Item/equipment definition",
			Category = "RPG",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "Item",
				Fields =
				[
					new DataField { Name = "nameIndex", Label = "Name Index", Type = DataFieldType.Byte },
					new DataField { Name = "price", Label = "Price", Type = DataFieldType.Word },
					new DataField { Name = "type", Label = "Type", Type = DataFieldType.Byte, EnumValues = new Dictionary<int, string>
					{
						{ 0, "Weapon" }, { 1, "Armor" }, { 2, "Accessory" }, { 3, "Consumable" }, { 4, "Key Item" }
					}},
					new DataField { Name = "attack", Label = "Attack", Type = DataFieldType.SByte },
					new DataField { Name = "defense", Label = "Defense", Type = DataFieldType.SByte },
					new DataField { Name = "usableBy", Label = "Usable By", Type = DataFieldType.Flags, Size = 1 }
				]
			}
		};
	}

	private static StructureTemplate CreateRpgMonsterTemplate() {
		return new StructureTemplate {
			Name = "RPG Monster",
			Description = "Enemy/monster definition",
			Category = "RPG",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "Monster",
				Fields =
				[
					new DataField { Name = "hp", Label = "HP", Type = DataFieldType.Word },
					new DataField { Name = "attack", Label = "Attack", Type = DataFieldType.Byte },
					new DataField { Name = "defense", Label = "Defense", Type = DataFieldType.Byte },
					new DataField { Name = "agility", Label = "Agility", Type = DataFieldType.Byte },
					new DataField { Name = "exp", Label = "Experience", Type = DataFieldType.Word },
					new DataField { Name = "gold", Label = "Gold", Type = DataFieldType.Word },
					new DataField { Name = "graphicsIndex", Label = "Graphics", Type = DataFieldType.Byte },
					new DataField { Name = "aiPattern", Label = "AI Pattern", Type = DataFieldType.Byte },
					new DataField { Name = "dropItem", Label = "Drop Item", Type = DataFieldType.Byte },
					new DataField { Name = "dropRate", Label = "Drop Rate", Type = DataFieldType.Byte, DisplayFormat = "P0" }
				]
			}
		};
	}

	private static StructureTemplate CreateRpgSpellTemplate() {
		return new StructureTemplate {
			Name = "RPG Spell/Ability",
			Description = "Magic spell or special ability",
			Category = "RPG",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "Spell",
				Fields =
				[
					new DataField { Name = "nameIndex", Label = "Name Index", Type = DataFieldType.Byte },
					new DataField { Name = "mpCost", Label = "MP Cost", Type = DataFieldType.Byte },
					new DataField { Name = "power", Label = "Power", Type = DataFieldType.Byte },
					new DataField { Name = "element", Label = "Element", Type = DataFieldType.Byte },
					new DataField { Name = "targetType", Label = "Target", Type = DataFieldType.Byte, EnumValues = new Dictionary<int, string>
					{
						{ 0, "One Enemy" }, { 1, "All Enemies" }, { 2, "One Ally" }, { 3, "All Allies" }, { 4, "Self" }
					}},
					new DataField { Name = "animation", Label = "Animation", Type = DataFieldType.Byte }
				]
			}
		};
	}

	private static StructureTemplate CreateRpgShopTemplate() {
		return new StructureTemplate {
			Name = "RPG Shop Inventory",
			Description = "Shop item list",
			Category = "RPG",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "ShopItem",
				Fields =
				[
					new DataField { Name = "itemId", Label = "Item ID", Type = DataFieldType.Byte },
					new DataField { Name = "quantity", Label = "Quantity", Type = DataFieldType.Byte, DefaultValue = (byte)255 }
				]
			}
		};
	}

	private static StructureTemplate CreateActionEnemyTemplate() {
		return new StructureTemplate {
			Name = "Action Game Enemy",
			Description = "Enemy spawn/properties for action games",
			Category = "Action",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "Enemy",
				Fields =
				[
					new DataField { Name = "type", Label = "Type", Type = DataFieldType.Byte },
					new DataField { Name = "x", Label = "X Position", Type = DataFieldType.Byte },
					new DataField { Name = "y", Label = "Y Position", Type = DataFieldType.Byte },
					new DataField { Name = "hp", Label = "HP", Type = DataFieldType.Byte },
					new DataField { Name = "damage", Label = "Damage", Type = DataFieldType.Byte },
					new DataField { Name = "behavior", Label = "Behavior", Type = DataFieldType.Byte }
				]
			}
		};
	}

	private static StructureTemplate CreateActionWeaponTemplate() {
		return new StructureTemplate {
			Name = "Action Game Weapon",
			Description = "Weapon properties for action games",
			Category = "Action",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "Weapon",
				Fields =
				[
					new DataField { Name = "damage", Label = "Damage", Type = DataFieldType.Byte },
					new DataField { Name = "range", Label = "Range", Type = DataFieldType.Byte },
					new DataField { Name = "speed", Label = "Speed", Type = DataFieldType.Byte },
					new DataField { Name = "ammo", Label = "Ammo", Type = DataFieldType.Byte },
					new DataField { Name = "graphicsId", Label = "Graphics ID", Type = DataFieldType.Byte }
				]
			}
		};
	}

	private static StructureTemplate CreatePlatformerLevelTemplate() {
		return new StructureTemplate {
			Name = "Platformer Level Header",
			Description = "Level header/properties for platformers",
			Category = "Platformer",
			Platform = "Generic",
			Structure = new DataStructure {
				Name = "LevelHeader",
				Fields =
				[
					new DataField { Name = "width", Label = "Width", Type = DataFieldType.Byte },
					new DataField { Name = "height", Label = "Height", Type = DataFieldType.Byte },
					new DataField { Name = "tilesetId", Label = "Tileset ID", Type = DataFieldType.Byte },
					new DataField { Name = "musicId", Label = "Music ID", Type = DataFieldType.Byte },
					new DataField { Name = "timeLimit", Label = "Time Limit", Type = DataFieldType.Word },
					new DataField { Name = "startX", Label = "Start X", Type = DataFieldType.Word },
					new DataField { Name = "startY", Label = "Start Y", Type = DataFieldType.Word },
					new DataField { Name = "scrollType", Label = "Scroll Type", Type = DataFieldType.Byte }
				]
			}
		};
	}

	#endregion
}
