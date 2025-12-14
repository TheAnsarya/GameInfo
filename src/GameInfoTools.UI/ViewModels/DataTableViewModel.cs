using System.Collections.ObjectModel;
using System.Text;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Data;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for game data table editing.
/// </summary>
public partial class DataTableViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private DataTableEditor? _editor;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private string _tableName = "";

	[ObservableProperty]
	private int _tableOffset;

	[ObservableProperty]
	private int _recordSize = 16;

	[ObservableProperty]
	private int _recordCount = 10;

	[ObservableProperty]
	private int _selectedRecordIndex;

	[ObservableProperty]
	private string _statusText = "";

	public ObservableCollection<DataRecord> Records { get; } = [];

	public ObservableCollection<FieldDefinition> Fields { get; } = [];

	public string[] CommonTableTypes { get; } = [
		"Monster Stats",
		"Item Data",
		"Weapon Stats",
		"Spell Data",
		"Shop Inventory",
		"Character Stats",
		"Custom"
	];

	public DataTableViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded) {
			_editor = new DataTableEditor(rom!.Data);
		}
	}

	[RelayCommand]
	private void LoadMonsterTable() {
		TableName = "Monster Stats";
		Fields.Clear();
		Fields.Add(new FieldDefinition("HP", DataTableEditor.FieldType.Word, 0));
		Fields.Add(new FieldDefinition("Attack", DataTableEditor.FieldType.Byte, 2));
		Fields.Add(new FieldDefinition("Defense", DataTableEditor.FieldType.Byte, 3));
		Fields.Add(new FieldDefinition("Agility", DataTableEditor.FieldType.Byte, 4));
		Fields.Add(new FieldDefinition("EXP", DataTableEditor.FieldType.Word, 5));
		Fields.Add(new FieldDefinition("Gold", DataTableEditor.FieldType.Word, 7));
		RecordSize = 16;
		StatusText = "Monster table template loaded - set offset and record count";
	}

	[RelayCommand]
	private void LoadItemTable() {
		TableName = "Item Data";
		Fields.Clear();
		Fields.Add(new FieldDefinition("Price", DataTableEditor.FieldType.Word, 0));
		Fields.Add(new FieldDefinition("Effect", DataTableEditor.FieldType.Byte, 2));
		Fields.Add(new FieldDefinition("Power", DataTableEditor.FieldType.Byte, 3));
		Fields.Add(new FieldDefinition("Flags", DataTableEditor.FieldType.BitFlags, 4));
		RecordSize = 8;
		StatusText = "Item table template loaded - set offset and record count";
	}

	[RelayCommand]
	private void LoadWeaponTable() {
		TableName = "Weapon Stats";
		Fields.Clear();
		Fields.Add(new FieldDefinition("Attack", DataTableEditor.FieldType.Byte, 0));
		Fields.Add(new FieldDefinition("Price", DataTableEditor.FieldType.Word, 1));
		Fields.Add(new FieldDefinition("Element", DataTableEditor.FieldType.Byte, 3));
		Fields.Add(new FieldDefinition("Equip Flags", DataTableEditor.FieldType.BitFlags, 4));
		RecordSize = 8;
		StatusText = "Weapon table template loaded - set offset and record count";
	}

	[RelayCommand]
	private void ReadTable() {
		if (_editor is null || Fields.Count == 0) {
			StatusText = "No table definition loaded";
			return;
		}

		Records.Clear();

		var tableDef = new DataTableEditor.TableDef {
			Name = TableName,
			BaseOffset = TableOffset,
			RecordSize = RecordSize,
			RecordCount = RecordCount
		};

		foreach (var field in Fields) {
			tableDef.Fields.Add(new DataTableEditor.FieldDef(
				field.Name,
				field.Type,
				field.Offset,
				field.Size
			));
		}

		try {
			for (int i = 0; i < RecordCount; i++) {
				var record = _editor.ReadRecord(tableDef, i);
				var values = new Dictionary<string, string>();

				foreach (var kvp in record) {
					values[kvp.Key] = FormatValue(kvp.Value, Fields.First(f => f.Name == kvp.Key).Type);
				}

				Records.Add(new DataRecord(i, values));
			}

			StatusText = $"Read {Records.Count} records from offset 0x{TableOffset:X6}";
		} catch (Exception ex) {
			StatusText = $"Error reading table: {ex.Message}";
		}
	}

	private static string FormatValue(object value, DataTableEditor.FieldType type) {
		return type switch {
			DataTableEditor.FieldType.Word or DataTableEditor.FieldType.Long =>
				$"{value} (0x{value:X})",
			DataTableEditor.FieldType.BitFlags =>
				$"0x{value:X2} ({Convert.ToString(Convert.ToInt32(value), 2).PadLeft(8, '0')})",
			DataTableEditor.FieldType.Pointer =>
				$"${value:X4}",
			_ => value.ToString() ?? ""
		};
	}

	[RelayCommand]
	private void AddField() {
		Fields.Add(new FieldDefinition($"Field{Fields.Count}", DataTableEditor.FieldType.Byte, Fields.Count));
		StatusText = "Added new field";
	}

	[RelayCommand]
	private void RemoveField(FieldDefinition? field) {
		if (field is not null && Fields.Contains(field)) {
			Fields.Remove(field);
			StatusText = $"Removed field '{field.Name}'";
		}
	}

	[RelayCommand]
	private async Task ExportToJson(Window? window) {
		if (Records.Count == 0) {
			StatusText = "No records to export";
			return;
		}

		if (window is null) {
			StatusText = "Unable to open file dialog";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Data Table",
			".json",
			$"{TableName.Replace(" ", "_").ToLowerInvariant()}.json",
			FileDialogService.JsonFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var json = System.Text.Json.JsonSerializer.Serialize(
				new {
					tableName = TableName,
					offset = TableOffset,
					recordSize = RecordSize,
					recordCount = RecordCount,
					fields = Fields.Select(f => new {
						name = f.Name,
						type = f.Type.ToString(),
						offset = f.Offset,
						size = f.Size
					}),
					records = Records.Select(r => r.Values)
				},
				new System.Text.Json.JsonSerializerOptions { WriteIndented = true }
			);

			await File.WriteAllTextAsync(path, json);
			StatusText = $"Exported {Records.Count} records to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task ImportFromJson(Window? window) {
		if (window is null) {
			StatusText = "Unable to open file dialog";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Import Data Table Definition",
			FileDialogService.JsonFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var json = await File.ReadAllTextAsync(path);
			using var doc = System.Text.Json.JsonDocument.Parse(json);
			var root = doc.RootElement;

			// Read table metadata
			if (root.TryGetProperty("tableName", out var tableNameElem)) {
				TableName = tableNameElem.GetString() ?? "";
			}

			if (root.TryGetProperty("offset", out var offsetElem)) {
				TableOffset = offsetElem.GetInt32();
			}

			if (root.TryGetProperty("recordSize", out var sizeElem)) {
				RecordSize = sizeElem.GetInt32();
			}

			if (root.TryGetProperty("recordCount", out var countElem)) {
				RecordCount = countElem.GetInt32();
			}

			// Read field definitions if present
			if (root.TryGetProperty("fields", out var fieldsElem) && fieldsElem.ValueKind == System.Text.Json.JsonValueKind.Array) {
				Fields.Clear();
				foreach (var fieldElem in fieldsElem.EnumerateArray()) {
					var fieldName = fieldElem.GetProperty("name").GetString() ?? "Unknown";
					var fieldType = Enum.TryParse<DataTableEditor.FieldType>(
						fieldElem.GetProperty("type").GetString(),
						out var parsed) ? parsed : DataTableEditor.FieldType.Byte;
					var fieldOffset = fieldElem.GetProperty("offset").GetInt32();
					var fieldSize = fieldElem.TryGetProperty("size", out var sizeVal) ? sizeVal.GetInt32() : 0;

					Fields.Add(new FieldDefinition(fieldName, fieldType, fieldOffset, fieldSize));
				}
			}

			// Read records if present
			if (root.TryGetProperty("records", out var recordsElem) && recordsElem.ValueKind == System.Text.Json.JsonValueKind.Array) {
				Records.Clear();
				int index = 0;
				foreach (var recordElem in recordsElem.EnumerateArray()) {
					var values = new Dictionary<string, string>();
					foreach (var prop in recordElem.EnumerateObject()) {
						values[prop.Name] = prop.Value.ToString();
					}

					Records.Add(new DataRecord(index++, values));
				}
			}

			StatusText = $"Imported table '{TableName}' from {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Import error: {ex.Message}";
		}
	}

	[RelayCommand]
	private void ClearTable() {
		Records.Clear();
		Fields.Clear();
		TableName = "";
		StatusText = "Table cleared";
	}
}

/// <summary>
/// Represents a field definition for a data table.
/// </summary>
public partial class FieldDefinition : ObservableObject {
	[ObservableProperty]
	private string _name;

	[ObservableProperty]
	private DataTableEditor.FieldType _type;

	[ObservableProperty]
	private int _offset;

	[ObservableProperty]
	private int _size;

	public FieldDefinition(string name, DataTableEditor.FieldType type, int offset, int size = 0) {
		_name = name;
		_type = type;
		_offset = offset;
		_size = size;
	}
}

/// <summary>
/// Represents a data record from a table.
/// </summary>
public record DataRecord(int Index, Dictionary<string, string> Values) {
	public string DisplayText => string.Join(", ", Values.Select(kv => $"{kv.Key}: {kv.Value}"));
}
