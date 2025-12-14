using GameInfoTools.Data;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for DataTableEditor including record manipulation,
/// field access, and JSON import/export functionality.
/// </summary>
public class DataTableEditorTests {
	private byte[] CreateTestData() {
		// Create test data with known values
		// 4 records of 8 bytes each
		return new byte[]
		{
			// Record 0: ID=1, HP=100, MP=50, Status=0x01
			0x01, 0x64, 0x00, 0x32, 0x00, 0x01, 0x00, 0x00,
			// Record 1: ID=2, HP=200, MP=75, Status=0x02
			0x02, 0xc8, 0x00, 0x4b, 0x00, 0x02, 0x00, 0x00,
			// Record 2: ID=3, HP=150, MP=60, Status=0x04
			0x03, 0x96, 0x00, 0x3c, 0x00, 0x04, 0x00, 0x00,
			// Record 3: ID=4, HP=255, MP=99, Status=0x08
			0x04, 0xff, 0x00, 0x63, 0x00, 0x08, 0x00, 0x00,
		};
	}

	private DataTableEditor.TableDef CreateTestTableDef() {
		return new DataTableEditor.TableDef {
			Name = "TestTable",
			BaseOffset = 0,
			RecordSize = 8,
			RecordCount = 4,
			Fields =
			{
				new DataTableEditor.FieldDef("ID", DataTableEditor.FieldType.Byte, 0),
				new DataTableEditor.FieldDef("HP", DataTableEditor.FieldType.Word, 1),
				new DataTableEditor.FieldDef("MP", DataTableEditor.FieldType.Word, 3),
				new DataTableEditor.FieldDef("Status", DataTableEditor.FieldType.BitFlags, 5)
			}
		};
	}

	[Fact]
	public void Constructor_CreatesInstanceFromData() {
		byte[] data = CreateTestData();
		var editor = new DataTableEditor(data);

		Assert.NotNull(editor);
	}

	[Fact]
	public void ReadField_ByteType() {
		byte[] data = CreateTestData();
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("ID", DataTableEditor.FieldType.Byte, 0);

		var value = editor.ReadField(0, field);

		Assert.Equal((byte)1, value);
	}

	[Fact]
	public void ReadField_WordType() {
		byte[] data = CreateTestData();
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("HP", DataTableEditor.FieldType.Word, 1);

		var value = editor.ReadField(0, field);

		// Word returns ushort which is 100
		Assert.Equal(100, Convert.ToInt32(value));
	}

	[Fact]
	public void ReadField_BitFlagsType() {
		byte[] data = CreateTestData();
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("Status", DataTableEditor.FieldType.BitFlags, 5);

		var value = editor.ReadField(0, field);

		Assert.Equal((byte)0x01, value);
	}

	[Fact]
	public void ReadField_SecondRecord() {
		byte[] data = CreateTestData();
		var editor = new DataTableEditor(data);
		var field = new DataTableEditor.FieldDef("ID", DataTableEditor.FieldType.Byte, 0);

		// Read from offset 8 (second record)
		var value = editor.ReadField(8, field);

		Assert.Equal((byte)2, value);
	}

	[Fact]
	public void TableDef_HasCorrectTotalSize() {
		var tableDef = CreateTestTableDef();

		Assert.Equal(32, tableDef.TotalSize); // 8 bytes * 4 records
	}

	[Fact]
	public void TableDef_HasCorrectRecordCount() {
		var tableDef = CreateTestTableDef();

		Assert.Equal(4, tableDef.RecordCount);
	}

	[Fact]
	public void FieldDef_HasCorrectProperties() {
		var field = new DataTableEditor.FieldDef("TestField", DataTableEditor.FieldType.Word, 5, 2);

		Assert.Equal("TestField", field.Name);
		Assert.Equal(DataTableEditor.FieldType.Word, field.Type);
		Assert.Equal(5, field.Offset);
		Assert.Equal(2, field.Size);
	}

	[Fact]
	public void FieldType_HasExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), "Byte"));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), "Word"));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), "Long"));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), "SignedByte"));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), "SignedWord"));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), "BitFlags"));
		Assert.True(Enum.IsDefined(typeof(DataTableEditor.FieldType), "Pointer"));
	}
}
