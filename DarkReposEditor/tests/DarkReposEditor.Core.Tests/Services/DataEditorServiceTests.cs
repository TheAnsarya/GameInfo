using DarkReposEditor.Core.Interfaces;
using DarkReposEditor.Core.Services;
using FluentAssertions;
using Xunit;

namespace DarkReposEditor.Core.Tests.Services;

public class DataEditorServiceTests
{
	private readonly DataEditorService _service;

	public DataEditorServiceTests()
	{
		_service = new DataEditorService();
	}

	#region LoadStructureDefinition Tests

	[Fact]
	public void LoadStructureDefinition_ValidJson_ReturnsStructure()
	{
		// Arrange
		var json = """
		{
			"name": "TestStructure",
			"description": "Test description",
			"endianness": "Little",
			"fields": [
				{ "name": "id", "type": "Byte", "size": 1 },
				{ "name": "value", "type": "Word", "size": 2 }
			]
		}
		""";

		// Act
		var structure = _service.LoadStructureDefinition(json);

		// Assert
		structure.Should().NotBeNull();
		structure.Name.Should().Be("TestStructure");
		structure.Description.Should().Be("Test description");
		structure.Endianness.Should().Be(Endianness.Little);
		structure.Fields.Should().HaveCount(2);
		structure.RecordSize.Should().Be(3);
	}

	[Fact]
	public void LoadStructureDefinition_EmptyJson_ThrowsArgumentException()
	{
		// Act & Assert
		var act = () => _service.LoadStructureDefinition("");
		act.Should().Throw<ArgumentException>();
	}

	[Fact]
	public void LoadStructureDefinition_NullJson_ThrowsArgumentException()
	{
		// Act & Assert
		var act = () => _service.LoadStructureDefinition(null!);
		act.Should().Throw<ArgumentException>();
	}

	[Theory]
	[InlineData(DataFieldType.Byte, 1)]
	[InlineData(DataFieldType.Word, 2)]
	[InlineData(DataFieldType.DWord, 4)]
	public void LoadStructureDefinition_FieldTypes_CorrectSize(DataFieldType type, int expectedSize)
	{
		// Arrange
		var json = $$"""
		{
			"name": "Test",
			"fields": [{ "name": "field", "type": "{{type}}" }]
		}
		""";

		// Act
		var structure = _service.LoadStructureDefinition(json);

		// Assert
		structure.RecordSize.Should().Be(expectedSize);
	}

	#endregion

	#region LoadDataTable Tests

	[Fact]
	public void LoadDataTable_ValidData_ReturnsTable()
	{
		// Arrange
		var structure = CreateTestStructure();
		byte[] data = [0x01, 0x10, 0x00, 0x02, 0x20, 0x00, 0x03, 0x30, 0x00];

		// Act
		var table = _service.LoadDataTable(data, 0, structure, 3);

		// Assert
		table.Should().NotBeNull();
		table.Records.Should().HaveCount(3);
		table.Records[0].Values["id"].Should().Be((byte)0x01);
		table.Records[0].Values["value"].Should().Be((ushort)0x0010);
		table.Records[1].Values["id"].Should().Be((byte)0x02);
		table.Records[2].Values["id"].Should().Be((byte)0x03);
	}

	[Fact]
	public void LoadDataTable_WithOffset_LoadsFromOffset()
	{
		// Arrange
		var structure = CreateTestStructure();
		byte[] data = [0xff, 0xff, 0x01, 0x10, 0x00, 0x02, 0x20, 0x00];

		// Act
		var table = _service.LoadDataTable(data, 2, structure, 2);

		// Assert
		table.Records.Should().HaveCount(2);
		table.Records[0].Values["id"].Should().Be((byte)0x01);
		table.Offset.Should().Be(2);
	}

	[Fact]
	public void LoadDataTable_MoreRowsThanData_LoadsAvailableRows()
	{
		// Arrange
		var structure = CreateTestStructure();
		byte[] data = [0x01, 0x10, 0x00];

		// Act
		var table = _service.LoadDataTable(data, 0, structure, 10);

		// Assert
		table.Records.Should().HaveCount(1);
	}

	[Fact]
	public void LoadDataTable_NullData_ThrowsArgumentNullException()
	{
		// Arrange
		var structure = CreateTestStructure();

		// Act & Assert
		var act = () => _service.LoadDataTable(null!, 0, structure, 1);
		act.Should().Throw<ArgumentNullException>();
	}

	#endregion

	#region LoadRecord Tests

	[Fact]
	public void LoadRecord_ValidData_ReturnsRecord()
	{
		// Arrange
		var structure = CreateTestStructure();
		byte[] data = [0x42, 0xcd, 0xab];

		// Act
		var record = _service.LoadRecord(data, 0, structure);

		// Assert
		record.Should().NotBeNull();
		record.Values["id"].Should().Be((byte)0x42);
		record.Values["value"].Should().Be((ushort)0xabcd); // Little endian
	}

	[Fact]
	public void LoadRecord_StoresRawBytes()
	{
		// Arrange
		var structure = CreateTestStructure();
		byte[] data = [0x01, 0x02, 0x03];

		// Act
		var record = _service.LoadRecord(data, 0, structure);

		// Assert
		record.RawBytes.Should().BeEquivalentTo([0x01, 0x02, 0x03]);
	}

	#endregion

	#region ExportTable Tests

	[Fact]
	public void ExportTable_ValidTable_ReturnsBinary()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable
		{
			Name = "Test",
			Structure = structure
		};
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));
		table.Records.Add(CreateRecord(structure, 0x02, 0x2000));

		// Act
		var result = _service.ExportTable(table);

		// Assert
		result.Should().HaveCount(6);
		result[0].Should().Be(0x01);
		result[1].Should().Be(0x00); // Low byte of 0x1000
		result[2].Should().Be(0x10); // High byte of 0x1000
		result[3].Should().Be(0x02);
	}

	#endregion

	#region ExportRecord Tests

	[Fact]
	public void ExportRecord_ValidRecord_ReturnsBinary()
	{
		// Arrange
		var structure = CreateTestStructure();
		var record = CreateRecord(structure, 0x42, 0xabcd);

		// Act
		var result = _service.ExportRecord(record, structure);

		// Assert
		result.Should().HaveCount(3);
		result[0].Should().Be(0x42);
		result[1].Should().Be(0xcd); // Low byte
		result[2].Should().Be(0xab); // High byte
	}

	#endregion

	#region ExportToJson Tests

	[Fact]
	public void ExportToJson_ValidTable_ReturnsJson()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable
		{
			Name = "Test",
			Structure = structure
		};
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));

		// Act
		var json = _service.ExportToJson(table);

		// Assert
		json.Should().Contain("\"name\"");
		json.Should().Contain("\"records\"");
		json.Should().Contain("Test");
	}

	[Fact]
	public void ExportToJson_PrettyFalse_ReturnsCompactJson()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));

		// Act
		var json = _service.ExportToJson(table, pretty: false);

		// Assert
		json.Should().NotContain("\n  ");
	}

	#endregion

	#region ExportToCsv Tests

	[Fact]
	public void ExportToCsv_ValidTable_ReturnsCsv()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));

		// Act
		var csv = _service.ExportToCsv(table);

		// Assert
		csv.Should().Contain("id");
		csv.Should().Contain("value");
	}

	[Fact]
	public void ExportToCsv_NoHeader_OmitsHeader()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));

		// Act
		var csv = _service.ExportToCsv(table, includeHeader: false);

		// Assert
		var lines = csv.Trim().Split('\n');
		lines[0].Should().NotContain("id");
	}

	#endregion

	#region ImportFromJson Tests

	[Fact]
	public void ImportFromJson_ValidJson_ReturnsTable()
	{
		// Arrange
		var structure = CreateTestStructure();
		var json = """
		{
			"name": "Test",
			"recordSize": 3,
			"recordCount": 2,
			"records": [
				{ "index": 0, "values": { "id": 1, "value": 256 } },
				{ "index": 1, "values": { "id": 2, "value": 512 } }
			]
		}
		""";

		// Act
		var table = _service.ImportFromJson(json, structure);

		// Assert
		table.Should().NotBeNull();
		table.Records.Should().HaveCount(2);
	}

	#endregion

	#region ImportFromCsv Tests

	[Fact]
	public void ImportFromCsv_ValidCsv_ReturnsTable()
	{
		// Arrange
		var structure = CreateTestStructure();
		var csv = "id,value\n1,256\n2,512";

		// Act
		var table = _service.ImportFromCsv(csv, structure);

		// Assert
		table.Should().NotBeNull();
		table.Records.Should().HaveCount(2);
	}

	[Fact]
	public void ImportFromCsv_NoHeader_UsesFieldOrder()
	{
		// Arrange
		var structure = CreateTestStructure();
		var csv = "1,256\n2,512";

		// Act
		var table = _service.ImportFromCsv(csv, structure);

		// Assert
		table.Records.Should().NotBeEmpty();
	}

	#endregion

	#region ValidateTable Tests

	[Fact]
	public void ValidateTable_ValidData_ReturnsNoErrors()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));

		// Act
		var result = _service.ValidateTable(table);

		// Assert
		result.IsValid.Should().BeTrue();
		result.Errors.Should().BeEmpty();
	}

	[Fact]
	public void ValidateTable_ValueOutOfRange_ReturnsError()
	{
		// Arrange
		var structure = CreateTestStructure();
		structure.Fields[0].MaxValue = 100;
		var table = new DataTable { Name = "Test", Structure = structure };
		var record = CreateRecord(structure, 0xff, 0x1000); // 255 > 100
		table.Records.Add(record);

		// Act
		var result = _service.ValidateTable(table);

		// Assert
		result.Errors.Should().NotBeEmpty();
	}

	#endregion

	#region ValidateRecord Tests

	[Fact]
	public void ValidateRecord_ValidData_ReturnsNoErrors()
	{
		// Arrange
		var structure = CreateTestStructure();
		var record = CreateRecord(structure, 0x01, 0x1000);

		// Act
		var result = _service.ValidateRecord(record, structure);

		// Assert
		result.IsValid.Should().BeTrue();
	}

	#endregion

	#region GetFieldValue Tests

	[Fact]
	public void GetFieldValue_ExistingField_ReturnsValue()
	{
		// Arrange
		var structure = CreateTestStructure();
		var record = CreateRecord(structure, 0x42, 0x1234);

		// Act
		var value = _service.GetFieldValue(record, "id");

		// Assert
		value.Should().Be((byte)0x42);
	}

	[Fact]
	public void GetFieldValue_NonExistingField_ReturnsNull()
	{
		// Arrange
		var structure = CreateTestStructure();
		var record = CreateRecord(structure, 0x42, 0x1234);

		// Act
		var value = _service.GetFieldValue(record, "nonexistent");

		// Assert
		value.Should().BeNull();
	}

	#endregion

	#region SetFieldValue Tests

	[Fact]
	public void SetFieldValue_ExistingField_UpdatesValue()
	{
		// Arrange
		var structure = CreateTestStructure();
		var record = CreateRecord(structure, 0x01, 0x1000);

		// Act
		_service.SetFieldValue(record, "id", (byte)0x99);

		// Assert
		record.Values["id"].Should().Be((byte)0x99);
	}

	[Fact]
	public void SetFieldValue_NonExistingField_AddsValue()
	{
		// Arrange
		var structure = CreateTestStructure();
		var record = new DataRecord();

		// Act
		_service.SetFieldValue(record, "newField", 123);

		// Assert
		record.Values.Should().ContainKey("newField");
		record.Values["newField"].Should().Be(123);
	}

	#endregion

	#region FindRecords Tests

	[Fact]
	public void FindRecords_MatchingPredicate_ReturnsRecords()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));
		table.Records.Add(CreateRecord(structure, 0x02, 0x2000));
		table.Records.Add(CreateRecord(structure, 0x01, 0x3000));

		// Act
		var results = _service.FindRecords(table, r =>
			r.Values.TryGetValue("id", out var v) && (byte)v == 0x01);

		// Assert
		results.Should().HaveCount(2);
	}

	[Fact]
	public void FindRecords_NoMatch_ReturnsEmpty()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));

		// Act
		var results = _service.FindRecords(table, r => false);

		// Assert
		results.Should().BeEmpty();
	}

	#endregion

	#region SortTable Tests

	[Fact]
	public void SortTable_Ascending_SortsCorrectly()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x03, 0x3000));
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));
		table.Records.Add(CreateRecord(structure, 0x02, 0x2000));

		// Act
		_service.SortTable(table, "id", ascending: true);

		// Assert
		table.Records[0].Values["id"].Should().Be((byte)0x01);
		table.Records[1].Values["id"].Should().Be((byte)0x02);
		table.Records[2].Values["id"].Should().Be((byte)0x03);
	}

	[Fact]
	public void SortTable_Descending_SortsCorrectly()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));
		table.Records.Add(CreateRecord(structure, 0x03, 0x3000));
		table.Records.Add(CreateRecord(structure, 0x02, 0x2000));

		// Act
		_service.SortTable(table, "id", ascending: false);

		// Assert
		table.Records[0].Values["id"].Should().Be((byte)0x03);
		table.Records[1].Values["id"].Should().Be((byte)0x02);
		table.Records[2].Values["id"].Should().Be((byte)0x01);
	}

	#endregion

	#region GetTemplates Tests

	[Fact]
	public void GetTemplates_ReturnsTemplates()
	{
		// Act
		var templates = _service.GetTemplates();

		// Assert
		templates.Should().NotBeEmpty();
	}

	#endregion

	#region CalculateChecksum Tests

	[Fact]
	public void CalculateChecksum_Crc32_ReturnsChecksum()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x1000));

		// Act
		var checksum = _service.CalculateChecksum(table, ChecksumType.Crc32);

		// Assert
		checksum.Should().NotBe(0);
	}

	[Fact]
	public void CalculateChecksum_Sum8_ReturnsSum()
	{
		// Arrange
		var structure = CreateTestStructure();
		var table = new DataTable { Name = "Test", Structure = structure };
		table.Records.Add(CreateRecord(structure, 0x01, 0x0000));

		// Act
		var checksum = _service.CalculateChecksum(table, ChecksumType.Sum8);

		// Assert
		checksum.Should().BeGreaterThanOrEqualTo(1);
	}

	#endregion

	#region Helper Methods

	private static DataStructure CreateTestStructure()
	{
		return new DataStructure
		{
			Name = "TestStructure",
			Endianness = Endianness.Little,
			Fields =
			[
				new DataField { Name = "id", Type = DataFieldType.Byte, Size = 1 },
				new DataField { Name = "value", Type = DataFieldType.Word, Size = 2 }
			]
		};
	}

	private static DataRecord CreateRecord(DataStructure structure, byte id, ushort value)
	{
		return new DataRecord
		{
			RawBytes = [(byte)id, (byte)(value & 0xff), (byte)(value >> 8)],
			Values = new Dictionary<string, object>
			{
				["id"] = id,
				["value"] = value
			}
		};
	}

	#endregion
}
