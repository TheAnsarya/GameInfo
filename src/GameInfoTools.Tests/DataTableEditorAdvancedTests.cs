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
		var data = new byte[] { 0x00, 0xAB, 0x00, 0x00 };
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.Byte, 1);

		var value = editor.ReadField(0, field);

		Assert.Equal((byte)0xAB, value);
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
		var data = new byte[] { 0xFF }; // -1 as signed byte
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Test", DataTableEditor.FieldType.SignedByte, 0);

		var value = editor.ReadField(0, field);

		Assert.Equal((sbyte)-1, value);
	}

	[Fact]
	public void ReadField_SignedWord_ReturnsNegativeValue() {
		var data = new byte[] { 0xFF, 0xFF }; // -1 as signed word
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

		editor.WriteField(0, field, (byte)0xCD);

		Assert.Equal(0xCD, data[1]);
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

		Assert.Equal(0xFF, data[0]);
	}

	[Fact]
	public void ReadRecord_ReadsAllFields() {
		var data = new byte[] { 0x0A, 0x00, 0x14 }; // HP=10, padding, STR=20
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

		Assert.Equal((byte)0xAA, value);
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
		var data = new byte[] { 0x00, 0x00, 0x00, 0xAB };
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Value", DataTableEditor.FieldType.Byte, 1);

		// ReadField(offset=2, field.Offset=1) => position 3
		var value = editor.ReadField(2, field);

		Assert.Equal((byte)0xAB, value);
	}
}
