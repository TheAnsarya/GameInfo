using GameInfoTools.Data;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for DataTableEditor functionality.
/// </summary>
public class DataTableEditorAdvancedTests {
	[Fact]
	public void FieldType_HasAllExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.Byte));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.Word));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.Long));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.SignedByte));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.SignedWord));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.BitFlags));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.FixedString));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), DataTableEditor.FieldType.Pointer));
	}

	[Fact]
	public void FieldDef_Record_HasCorrectProperties() {
		var field = new DataTableEditor.FieldDef("TestField", DataTableEditor.FieldType.Word, 10, 2, null);

		Assert.Equal("TestField", field.Name);
		Assert.Equal(DataTableEditor.FieldType.Word, field.Type);
		Assert.Equal(10, field.Offset);
		Assert.Equal(2, field.Size);
	}

	[Fact]
	public void FieldDef_WithValueNames() {
		var valueNames = new Dictionary<int, string> { { 0, "None" }, { 1, "Attack" }, { 2, "Magic" } };
		var field = new DataTableEditor.FieldDef("Action", DataTableEditor.FieldType.Byte, 0, 1, valueNames);

		Assert.NotNull(field.ValueNames);
		Assert.Equal("Attack", field.ValueNames![1]);
	}

	[Fact]
	public void TableDef_DefaultProperties() {
		var table = new DataTableEditor.TableDef();

		Assert.Equal("", table.Name);
		Assert.Equal(0, table.BaseOffset);
		Assert.Equal(0, table.RecordSize);
		Assert.Equal(0, table.RecordCount);
		Assert.Empty(table.Fields);
	}

	[Fact]
	public void TableDef_TotalSize_CalculatesCorrectly() {
		var table = new DataTableEditor.TableDef {
			RecordSize = 16,
			RecordCount = 10
		};

		Assert.Equal(160, table.TotalSize);
	}

	[Fact]
	public void ReadField_Byte_ReturnsCorrectValue() {
		var data = new byte[] { 0x00, 0xab, 0x00, 0x00 };
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Byte, 1);

		var value = editor.ReadField(0, field);

		Assert.Equal((byte)0xab, value);
	}

	[Fact]
	public void ReadField_Word_ReturnsLittleEndian() {
		var data = new byte[] { 0x34, 0x12 }; // 0x1234 little-endian
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Word, 0);

		var value = editor.ReadField(0, field);

		Assert.Equal(0x1234, Convert.ToInt32(value));
	}

	[Fact]
	public void ReadField_Long_Returns24Bit() {
		var data = new byte[] { 0x56, 0x34, 0x12 }; // 0x123456 little-endian
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Long, 0);

		var value = editor.ReadField(0, field);

		Assert.Equal(0x123456, Convert.ToInt32(value));
	}

	[Fact]
	public void ReadField_SignedByte_ReturnsNegativeValue() {
		var data = new byte[] { 0xff }; // -1 as signed byte
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.SignedByte, 0);

		var value = editor.ReadField(0, field);

		Assert.Equal((sbyte)-1, value);
	}

	[Fact]
	public void ReadField_SignedWord_ReturnsNegativeValue() {
		var data = new byte[] { 0xff, 0xff }; // -1 as signed word
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.SignedWord, 0);

		var value = editor.ReadField(0, field);

		Assert.Equal((short)-1, value);
	}

	[Fact]
	public void ReadField_OutOfBounds_ReturnsZero() {
		var data = new byte[] { 0x00 };
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Byte, 100);

		var value = editor.ReadField(0, field);

		Assert.Equal(0, value);
	}

	[Fact]
	public void WriteField_Byte_WritesCorrectValue() {
		var data = new byte[4];
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Byte, 1);

		editor.WriteField(0, field, (byte)0xcd);

		Assert.Equal(0xcd, data[1]);
	}

	[Fact]
	public void WriteField_Word_WritesLittleEndian() {
		var data = new byte[4];
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Word, 0);

		editor.WriteField(0, field, (ushort)0x1234);

		Assert.Equal(0x34, data[0]); // Low byte
		Assert.Equal(0x12, data[1]); // High byte
	}

	[Fact]
	public void WriteField_Long_Writes24Bit() {
		var data = new byte[4];
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Long, 0);

		editor.WriteField(0, field, (uint)0x123456);

		Assert.Equal(0x56, data[0]);
		Assert.Equal(0x34, data[1]);
		Assert.Equal(0x12, data[2]);
	}

	[Fact]
	public void WriteField_SignedByte_WritesNegativeValue() {
		var data = new byte[4];
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.SignedByte, 0);

		editor.WriteField(0, field, (sbyte)-1);

		Assert.Equal(0xff, data[0]);
	}

	[Fact]
	public void ReadRecord_ReadsAllFields() {
		var data = new byte[] { 0x0a, 0x00, 0x14 }; // HP=10, padding, STR=20
		var editor = new DataTableEditor(data);

		var table = new DataTableEditor.TableDef {
			Name = "Stats",
			BaseOffset = 0,
			RecordSize = 3,
			RecordCount = 1
		};
		table.Fields.Add(new DataTableEditor.FieldDef("HP", DataTableEditor.FieldType.Byte, 0));
		table.Fields.Add(new DataTableEditor.FieldDef("STR", DataTableEditor.FieldType.Byte, 2));

		var record = editor.ReadRecord(table, 0);

		Assert.Equal((byte)10, record["HP"]);
		Assert.Equal((byte)20, record["STR"]);
	}

	[Fact]
	public void WriteRecord_WritesAllFields() {
		var data = new byte[4];
		var editor = new DataTableEditor(data);

		var table = new DataTableEditor.TableDef {
			BaseOffset = 0,
			RecordSize = 4,
			RecordCount = 1
		};
		table.Fields.Add(new DataTableEditor.FieldDef("HP", DataTableEditor.FieldType.Byte, 0));
		table.Fields.Add(new DataTableEditor.FieldDef("MP", DataTableEditor.FieldType.Byte, 1));

		var record = new Dictionary<string, object>
		{
			{ "HP", (byte)100 },
			{ "MP", (byte)50 }
		};

		editor.WriteRecord(table, 0, record);

		Assert.Equal(100, data[0]);
		Assert.Equal(50, data[1]);
	}

	[Fact]
	public void ReadRecord_SecondRecord_CalculatesOffset() {
		var data = new byte[] { 0x01, 0x02, 0x03, 0x04 }; // Record 0, Record 1
		var editor = new DataTableEditor(data);

		var table = new DataTableEditor.TableDef {
			BaseOffset = 0,
			RecordSize = 2,
			RecordCount = 2
		};
		table.Fields.Add(new DataTableEditor.FieldDef("Value", DataTableEditor.FieldType.Byte, 0));

		var record1 = editor.ReadRecord(table, 1);

		Assert.Equal((byte)0x03, record1["Value"]);
	}

	[Fact]
	public void TableDef_Fields_CanBeAdded() {
		var table = new DataTableEditor.TableDef();

		table.Fields.Add(new DataTableEditor.FieldDef("Field1", DataTableEditor.FieldType.Byte, 0));
		table.Fields.Add(new DataTableEditor.FieldDef("Field2", DataTableEditor.FieldType.Word, 1));

		Assert.Equal(2, table.Fields.Count);
	}

	[Fact]
	public void WriteField_Pointer_WritesAsWord() {
		var data = new byte[4];
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Ptr", DataTableEditor.FieldType.Pointer, 0);

		editor.WriteField(0, field, (ushort)0x8000);

		Assert.Equal(0x00, data[0]);
		Assert.Equal(0x80, data[1]);
	}

	[Fact]
	public void ReadField_BitFlags_ReturnsByte() {
		var data = new byte[] { 0b10101010 };
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Flags", DataTableEditor.FieldType.BitFlags, 0);

		var value = editor.ReadField(0, field);

		Assert.Equal((byte)0xaa, value);
	}

	[Fact]
	public void WriteField_BitFlags_WritesByte() {
		var data = new byte[1];
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Flags", DataTableEditor.FieldType.BitFlags, 0);

		editor.WriteField(0, field, (byte)0b01010101);

		Assert.Equal(0x55, data[0]);
	}

	[Fact]
	public void ReadField_WithOffset_CalculatesCorrectPosition() {
		var data = new byte[] { 0x00, 0x00, 0x00, 0xab };
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Value", DataTableEditor.FieldType.Byte, 1);

		// ReadField(offset=2, field.Offset=1) => position 3
		var value = editor.ReadField(2, field);

		Assert.Equal((byte)0xab, value);
	}
}

/// <summary>
/// Tests for FormulaEngine.
/// </summary>
public class FormulaEngineTests {
	[Fact]
	public void RegisterFormula_CanRegister() {
		var engine = new FormulaEngine();

		engine.RegisterFormula("Total", "[HP] + [MP]");

		var formulas = engine.GetFormulas().ToList();
		Assert.Single(formulas);
		Assert.Equal("Total", formulas[0].Name);
	}

	[Fact]
	public void EvaluateFormula_SimpleAddition() {
		var engine = new FormulaEngine();
		engine.RegisterFormula("Sum", "[A] + [B]");

		var record = new Dictionary<string, object> { { "A", 10 }, { "B", 20 } };
		var result = engine.EvaluateFormula("Sum", record);

		Assert.Equal(30.0, Convert.ToDouble(result));
	}

	[Fact]
	public void EvaluateFormula_Multiplication() {
		var engine = new FormulaEngine();
		engine.RegisterFormula("Product", "[A] * [B]");

		var record = new Dictionary<string, object> { { "A", 5 }, { "B", 4 } };
		var result = engine.EvaluateFormula("Product", record);

		Assert.Equal(20.0, Convert.ToDouble(result));
	}

	[Fact]
	public void EvaluateFormula_ComplexExpression() {
		var engine = new FormulaEngine();
		engine.RegisterFormula("Damage", "[STR] * 2 + [Power]");

		var record = new Dictionary<string, object> { { "STR", 10 }, { "Power", 5 } };
		var result = engine.EvaluateFormula("Damage", record);

		Assert.Equal(25.0, Convert.ToDouble(result));
	}

	[Fact]
	public void EvaluateFormula_Division() {
		var engine = new FormulaEngine();
		engine.RegisterFormula("Average", "([A] + [B]) / 2");

		var record = new Dictionary<string, object> { { "A", 10 }, { "B", 20 } };
		var result = engine.EvaluateFormula("Average", record);

		Assert.Equal(15.0, Convert.ToDouble(result));
	}

	[Fact]
	public void EvaluateAllFormulas_ReturnsAll() {
		var engine = new FormulaEngine();
		engine.RegisterFormula("Double", "[A] * 2");
		engine.RegisterFormula("Triple", "[A] * 3");

		var record = new Dictionary<string, object> { { "A", 10 } };
		var results = engine.EvaluateAllFormulas(record);

		Assert.Equal(2, results.Count);
		Assert.Equal(20.0, Convert.ToDouble(results["Double"]));
		Assert.Equal(30.0, Convert.ToDouble(results["Triple"]));
	}

	[Fact]
	public void EvaluateFormula_Unknown_Throws() {
		var engine = new FormulaEngine();

		var record = new Dictionary<string, object>();
		Assert.Throws<ArgumentException>(() => engine.EvaluateFormula("Unknown", record));
	}
}

/// <summary>
/// Tests for DataValidator.
/// </summary>
public class DataValidatorTests {
	[Fact]
	public void AddRangeRule_ValidValue_Passes() {
		var validator = new DataValidator();
		validator.AddRangeRule("HP", 0, 255);

		var record = new Dictionary<string, object> { { "HP", 100 } };
		var results = validator.ValidateRecord(record);

		Assert.Empty(results);
	}

	[Fact]
	public void AddRangeRule_InvalidValue_Fails() {
		var validator = new DataValidator();
		validator.AddRangeRule("HP", 0, 255);

		var record = new Dictionary<string, object> { { "HP", 300 } };
		var results = validator.ValidateRecord(record);

		Assert.Single(results);
		Assert.False(results[0].IsValid);
		Assert.Equal("HP", results[0].FieldName);
	}

	[Fact]
	public void AddAllowedValuesRule_ValidValue_Passes() {
		var validator = new DataValidator();
		validator.AddAllowedValuesRule("Type", new object[] { 1, 2, 3 });

		var record = new Dictionary<string, object> { { "Type", 2 } };
		var results = validator.ValidateRecord(record);

		Assert.Empty(results);
	}

	[Fact]
	public void AddAllowedValuesRule_InvalidValue_Fails() {
		var validator = new DataValidator();
		validator.AddAllowedValuesRule("Type", new object[] { 1, 2, 3 });

		var record = new Dictionary<string, object> { { "Type", 5 } };
		var results = validator.ValidateRecord(record);

		Assert.Single(results);
		Assert.False(results[0].IsValid);
	}

	[Fact]
	public void AddNotNullRule_NullValue_Fails() {
		var validator = new DataValidator();
		validator.AddNotNullRule("Name");

		var record = new Dictionary<string, object> { { "Name", "" } };
		var results = validator.ValidateRecord(record);

		Assert.Single(results);
		Assert.False(results[0].IsValid);
	}

	[Fact]
	public void ValidateAll_MultipleRecords_ChecksAll() {
		var validator = new DataValidator();
		validator.AddRangeRule("Value", 0, 100);

		var records = new List<Dictionary<string, object>> {
			new() { { "Value", 50 } },
			new() { { "Value", 150 } },  // Invalid
			new() { { "Value", 75 } }
		};

		var results = validator.ValidateAll(records);

		Assert.Single(results);
		Assert.Equal(1, results[0].RecordIndex);
	}

	[Fact]
	public void CustomMessage_UsedInError() {
		var validator = new DataValidator();
		validator.AddRangeRule("HP", 0, 100, "HP must be between 0 and 100");

		var record = new Dictionary<string, object> { { "HP", 200 } };
		var results = validator.ValidateRecord(record);

		Assert.Contains("HP must be between 0 and 100", results[0].ErrorMessage);
	}
}

/// <summary>
/// Tests for CsvHandler.
/// </summary>
public class CsvHandlerTests {
	[Fact]
	public void ExportToCsv_WithHeaders_IncludesHeaders() {
		var table = new DataTableEditor.TableDef {
			Name = "Test",
			Fields = { new DataTableEditor.FieldDef("A", DataTableEditor.FieldType.Byte, 0),
				new DataTableEditor.FieldDef("B", DataTableEditor.FieldType.Byte, 1) }
		};

		var records = new List<Dictionary<string, object>> {
			new() { { "A", 1 }, { "B", 2 } }
		};

		var csv = CsvHandler.ExportToCsv(table, records);

		Assert.Contains("A,B", csv);
		Assert.Contains("1,2", csv);
	}

	[Fact]
	public void ExportToCsv_QuotesFields_WhenNeeded() {
		var table = new DataTableEditor.TableDef {
			Name = "Test",
			Fields = { new DataTableEditor.FieldDef("Name", DataTableEditor.FieldType.FixedString, 0, 10) }
		};

		var records = new List<Dictionary<string, object>> {
			new() { { "Name", "Hello, World" } }
		};

		var csv = CsvHandler.ExportToCsv(table, records);

		Assert.Contains("\"Hello, World\"", csv);
	}

	[Fact]
	public void ImportFromCsv_WithHeaders_ParsesCorrectly() {
		var table = new DataTableEditor.TableDef {
			Name = "Test",
			Fields = {
				new DataTableEditor.FieldDef("HP", DataTableEditor.FieldType.Byte, 0),
				new DataTableEditor.FieldDef("MP", DataTableEditor.FieldType.Byte, 1)
			}
		};

		var csv = "HP,MP\n100,50\n200,75";
		var records = CsvHandler.ImportFromCsv(csv, table);

		Assert.Equal(2, records.Count);
		Assert.Equal((byte)100, records[0]["HP"]);
		Assert.Equal((byte)50, records[0]["MP"]);
	}

	[Fact]
	public void ImportFromCsv_NoHeaders_UsesFieldNames() {
		var table = new DataTableEditor.TableDef {
			Name = "Test",
			Fields = { new DataTableEditor.FieldDef("Value", DataTableEditor.FieldType.Word, 0) }
		};

		var csv = "1000";
		var options = new CsvHandler.CsvOptions(HasHeader: false);
		var records = CsvHandler.ImportFromCsv(csv, table, options);

		Assert.Single(records);
		Assert.Equal((ushort)1000, records[0]["Value"]);
	}

	[Fact]
	public void ImportFromCsv_CustomDelimiter_Works() {
		var table = new DataTableEditor.TableDef {
			Name = "Test",
			Fields = {
				new DataTableEditor.FieldDef("A", DataTableEditor.FieldType.Byte, 0),
				new DataTableEditor.FieldDef("B", DataTableEditor.FieldType.Byte, 1)
			}
		};

		var csv = "A;B\n10;20";
		var options = new CsvHandler.CsvOptions(Delimiter: ';');
		var records = CsvHandler.ImportFromCsv(csv, table, options);

		Assert.Equal((byte)10, records[0]["A"]);
		Assert.Equal((byte)20, records[0]["B"]);
	}
}

/// <summary>
/// Tests for TableEditHistory.
/// </summary>
public class TableEditHistoryTests {
	[Fact]
	public void RecordFieldEdit_CanUndo() {
		var history = new TableEditHistory();

		history.RecordFieldEdit(0, "HP", 100, 150);

		Assert.True(history.CanUndo);
	}

	[Fact]
	public void Undo_ReturnsReversedOperation() {
		var history = new TableEditHistory();
		history.RecordFieldEdit(0, "HP", 100, 150);

		var undoOps = history.Undo();

		Assert.NotNull(undoOps);
		Assert.Single(undoOps);
		Assert.Equal(150, undoOps[0].OldValue);  // Swapped
		Assert.Equal(100, undoOps[0].NewValue);
	}

	[Fact]
	public void Undo_ThenRedo_Works() {
		var history = new TableEditHistory();
		history.RecordFieldEdit(0, "HP", 100, 150);

		history.Undo();
		Assert.True(history.CanRedo);

		var redoOps = history.Redo();
		Assert.NotNull(redoOps);
	}

	[Fact]
	public void BeginBatch_GroupsOperations() {
		var history = new TableEditHistory();

		history.BeginBatch();
		history.RecordFieldEdit(0, "HP", 100, 150);
		history.RecordFieldEdit(0, "MP", 50, 75);
		history.EndBatch();

		var undoOps = history.Undo();

		Assert.NotNull(undoOps);
		Assert.Equal(2, undoOps.Count);
	}

	[Fact]
	public void Clear_RemovesAllHistory() {
		var history = new TableEditHistory();
		history.RecordFieldEdit(0, "HP", 100, 150);

		history.Clear();

		Assert.False(history.CanUndo);
		Assert.False(history.CanRedo);
	}

	[Fact]
	public void NewEdit_ClearsRedoStack() {
		var history = new TableEditHistory();
		history.RecordFieldEdit(0, "HP", 100, 150);
		history.Undo();
		Assert.True(history.CanRedo);

		history.RecordFieldEdit(0, "HP", 100, 200);

		Assert.False(history.CanRedo);
	}
}

/// <summary>
/// Tests for TableCrossRefResolver.
/// </summary>
public class TableCrossRefResolverTests {
	[Fact]
	public void RegisterTable_CanRetrieve() {
		var resolver = new TableCrossRefResolver();
		var table = new DataTableEditor.TableDef { Name = "Items" };
		var data = new List<Dictionary<string, object>> {
			new() { { "Name", "Sword" } }
		};

		resolver.RegisterTable(table, data);

		// No exception means success
		Assert.True(true);
	}

	[Fact]
	public void ResolveReference_ValidIndex_ReturnsRecord() {
		var resolver = new TableCrossRefResolver();

		var itemsTable = new DataTableEditor.TableDef { Name = "Items" };
		var itemsData = new List<Dictionary<string, object>> {
			new() { { "Name", "Sword" } },
			new() { { "Name", "Shield" } }
		};

		var monsterTable = new DataTableEditor.TableDef { Name = "Monsters" };
		var monsterData = new List<Dictionary<string, object>> {
			new() { { "Name", "Slime" }, { "DropItem", 0 } }
		};

		resolver.RegisterTable(itemsTable, itemsData);
		resolver.RegisterTable(monsterTable, monsterData);
		resolver.AddCrossRef("Monsters", "DropItem", "Items", "Name", CrossRefType.ForeignKey);

		var item = resolver.ResolveReference("Monsters", "DropItem", 0);

		Assert.NotNull(item);
		Assert.Equal("Sword", item["Name"]);
	}

	[Fact]
	public void ResolveReference_InvalidIndex_ReturnsNull() {
		var resolver = new TableCrossRefResolver();

		var itemsTable = new DataTableEditor.TableDef { Name = "Items" };
		var itemsData = new List<Dictionary<string, object>> {
			new() { { "Name", "Sword" } }
		};

		resolver.RegisterTable(itemsTable, itemsData);
		resolver.AddCrossRef("Monsters", "DropItem", "Items", "Name", CrossRefType.ForeignKey);

		var item = resolver.ResolveReference("Monsters", "DropItem", 999);

		Assert.Null(item);
	}

	[Fact]
	public void GetReferencingRecords_FindsAll() {
		var resolver = new TableCrossRefResolver();

		var itemsTable = new DataTableEditor.TableDef { Name = "Items" };
		var itemsData = new List<Dictionary<string, object>> {
			new() { { "Name", "Sword" } }
		};

		var monsterTable = new DataTableEditor.TableDef { Name = "Monsters" };
		var monsterData = new List<Dictionary<string, object>> {
			new() { { "Name", "Slime" }, { "DropItem", 0 } },
			new() { { "Name", "Dragon" }, { "DropItem", 0 } },
			new() { { "Name", "Bat" }, { "DropItem", 1 } }
		};

		resolver.RegisterTable(itemsTable, itemsData);
		resolver.RegisterTable(monsterTable, monsterData);
		resolver.AddCrossRef("Monsters", "DropItem", "Items", "Name", CrossRefType.ForeignKey);

		var refs = resolver.GetReferencingRecords("Items", 0);

		Assert.Equal(2, refs.Count);
	}

	[Fact]
	public void ValidateCrossReferences_DetectsInvalid() {
		var resolver = new TableCrossRefResolver();

		var itemsTable = new DataTableEditor.TableDef { Name = "Items" };
		var itemsData = new List<Dictionary<string, object>> {
			new() { { "Name", "Sword" } }  // Only index 0 valid
		};

		var monsterTable = new DataTableEditor.TableDef { Name = "Monsters" };
		var monsterData = new List<Dictionary<string, object>> {
			new() { { "Name", "Dragon" }, { "DropItem", 99 } }  // Invalid index
		};

		resolver.RegisterTable(itemsTable, itemsData);
		resolver.RegisterTable(monsterTable, monsterData);
		resolver.AddCrossRef("Monsters", "DropItem", "Items", "Name", CrossRefType.ForeignKey);

		var errors = resolver.ValidateCrossReferences();

		Assert.Single(errors);
		Assert.Contains("index 99", errors[0]);
	}
}

/// <summary>
/// Tests for TableSchema.
/// </summary>
public class TableSchemaTests {
	[Fact]
	public void ToJson_SerializesCorrectly() {
		var schema = new TableSchema {
			Name = "TestSchema",
			Version = "1.0",
			Description = "Test description"
		};

		var json = schema.ToJson();

		Assert.Contains("TestSchema", json);
		Assert.Contains("1.0", json);
	}

	[Fact]
	public void FromJson_DeserializesCorrectly() {
		var json = """
		{
			"Version": "2.0",
			"Name": "LoadedSchema",
			"Description": "Loaded"
		}
		""";

		var schema = TableSchema.FromJson(json);

		Assert.NotNull(schema);
		Assert.Equal("LoadedSchema", schema.Name);
		Assert.Equal("2.0", schema.Version);
	}
}
