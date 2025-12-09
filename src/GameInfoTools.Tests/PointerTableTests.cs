using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for PointerTable class.
/// </summary>
public class PointerTableTests {
	[Fact]
	public void Read_Absolute16_ParsesCorrectly() {
		// Arrange: 3 little-endian 16-bit pointers
		byte[] data =
		[
			0x00, 0x80,  // $8000
			0x10, 0x80,  // $8010
			0xff, 0x9f,  // $9fff
		];

		// Act
		var table = PointerTable.Read(data, 0, 3, PointerTable.PointerFormat.Absolute16);

		// Assert
		Assert.Equal(3, table.Entries.Count);
		Assert.Equal(0x8000, table.Entries[0].PointerValue);
		Assert.Equal(0x8010, table.Entries[1].PointerValue);
		Assert.Equal(0x9fff, table.Entries[2].PointerValue);
	}

	[Fact]
	public void Read_Absolute24_ParsesCorrectly() {
		// Arrange: 24-bit pointer (SNES style)
		byte[] data =
		[
			0x00, 0x80, 0x0c,  // $0c8000
		];

		// Act
		var table = PointerTable.Read(data, 0, 1, PointerTable.PointerFormat.Absolute24);

		// Assert
		Assert.Single(table.Entries);
		Assert.Equal(0x0c8000, table.Entries[0].PointerValue);
	}

	[Fact]
	public void Read_Relative8_ParsesCorrectly() {
		// Arrange: 8-bit relative offsets
		byte[] data = [0x10, 0x20, 0x30];

		// Act
		var table = PointerTable.Read(data, 0, 3, PointerTable.PointerFormat.Relative8);

		// Assert
		Assert.Equal(3, table.Entries.Count);
		Assert.Equal(0x10, table.Entries[0].PointerValue);
		Assert.Equal(0x20, table.Entries[1].PointerValue);
		Assert.Equal(0x30, table.Entries[2].PointerValue);
	}

	[Fact]
	public void Read_BankOffset_ParsesCorrectly() {
		// Arrange: Bank byte + 16-bit offset
		byte[] data = [0x02, 0x00, 0x80];  // Bank $02, offset $8000

		// Act
		var table = PointerTable.Read(data, 0, 1, PointerTable.PointerFormat.BankOffset);

		// Assert
		Assert.Single(table.Entries);
		Assert.Equal(0x028000, table.Entries[0].PointerValue);
	}

	[Fact]
	public void Read_WithOffset_StartsAtCorrectPosition() {
		// Arrange
		byte[] data =
		[
			0xff, 0xff,  // Skip these
			0x00, 0x80,  // $8000
			0x10, 0x80,  // $8010
		];

		// Act
		var table = PointerTable.Read(data, 2, 2, PointerTable.PointerFormat.Absolute16);

		// Assert
		Assert.Equal(2, table.Entries.Count);
		Assert.Equal(2, table.Entries[0].TableOffset);
		Assert.Equal(4, table.Entries[1].TableOffset);
	}

	[Fact]
	public void DetectTable_ValidPointerTable_ReturnsTable() {
		// Arrange: Valid NES pointer table ($8000-$FFFF range)
		byte[] data =
		[
			0x00, 0x80,  // $8000
			0x20, 0x80,  // $8020
			0x40, 0x80,  // $8040
			0x60, 0x80,  // $8060
		];

		// Act
		var result = PointerTable.DetectTable(data, 0, 4);

		// Assert
		Assert.NotNull(result);
		Assert.Equal(4, result.Entries.Count);
	}

	[Fact]
	public void DetectTable_InvalidData_ReturnsNull() {
		// Arrange: Random data that doesn't look like pointers
		byte[] data = [0x01, 0x02, 0x03, 0x04];

		// Act
		var result = PointerTable.DetectTable(data, 0, 4);

		// Assert
		Assert.Null(result);
	}

	[Fact]
	public void DetectTable_TooShort_ReturnsNull() {
		// Arrange: Data too short
		byte[] data = [0x00, 0x80];

		// Act
		var result = PointerTable.DetectTable(data, 0, 10);

		// Assert
		Assert.Null(result);
	}

	[Fact]
	public void Read_RecordsCorrectIndex() {
		// Arrange
		byte[] data =
		[
			0x00, 0x80,
			0x10, 0x80,
			0x20, 0x80,
		];

		// Act
		var table = PointerTable.Read(data, 0, 3, PointerTable.PointerFormat.Absolute16);

		// Assert
		Assert.Equal(0, table.Entries[0].Index);
		Assert.Equal(1, table.Entries[1].Index);
		Assert.Equal(2, table.Entries[2].Index);
	}

	[Fact]
	public void DefaultFormat_IsLittleEndian() {
		// Arrange & Act
		var table = new PointerTable();

		// Assert
		Assert.True(table.IsLittleEndian);
		Assert.Equal(PointerTable.PointerFormat.Absolute16, table.Format);
	}

	[Fact]
	public void Read_LimitsToAvailableData() {
		// Arrange: Request more entries than available
		byte[] data = [0x00, 0x80, 0x10, 0x80];  // Only 2 pointers

		// Act
		var table = PointerTable.Read(data, 0, 10, PointerTable.PointerFormat.Absolute16);

		// Assert
		Assert.Equal(2, table.Entries.Count);
	}
}
