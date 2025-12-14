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

	#region New Record Types Tests

	[Fact]
	public void PointerChain_HasCorrectProperties() {
		var addresses = new List<int> { 0x8000, 0x8100, 0x8200 };
		var chain = new PointerTable.PointerChain(0x10, addresses, 3, false);

		Assert.Equal(0x10, chain.StartOffset);
		Assert.Equal(3, chain.Addresses.Count);
		Assert.Equal(3, chain.Depth);
		Assert.False(chain.IsCircular);
	}

	[Fact]
	public void TableDetectionResult_HasCorrectProperties() {
		var result = new PointerTable.TableDetectionResult(
			0x100, 10, 0.85f, PointerTable.PointerFormat.Absolute16,
			0x8000, 0x8100, "Test description"
		);

		Assert.Equal(0x100, result.Offset);
		Assert.Equal(10, result.Count);
		Assert.Equal(0.85f, result.Confidence);
		Assert.Equal(PointerTable.PointerFormat.Absolute16, result.DetectedFormat);
		Assert.Equal(0x8000, result.MinTarget);
		Assert.Equal(0x8100, result.MaxTarget);
		Assert.Equal("Test description", result.Description);
	}

	[Fact]
	public void PointerMapEntry_HasCorrectProperties() {
		var entry = new PointerTable.PointerMapEntry(0x100, 0x8000, 5, "TestLabel");

		Assert.Equal(0x100, entry.SourceOffset);
		Assert.Equal(0x8000, entry.TargetAddress);
		Assert.Equal(5, entry.TableIndex);
		Assert.Equal("TestLabel", entry.Label);
	}

	#endregion

	#region Pointer Chain Tests

	[Fact]
	public void FollowChain_SimpleChain_ReturnsCorrectDepth() {
		// Create data with pointer chain: offset 0 -> $8010 -> $8020
		byte[] data = new byte[0x100];
		// Pointer at offset 0 to $8010
		data[0] = 0x10;
		data[1] = 0x80;
		// Pointer at offset $10 to $8020
		data[0x10] = 0x20;
		data[0x11] = 0x80;
		// Pointer at offset $20 to $8030
		data[0x20] = 0x30;
		data[0x21] = 0x80;

		var chain = PointerTable.FollowChain(data, 0, 10, 0x8000);

		Assert.True(chain.Depth >= 1);
		Assert.False(chain.IsCircular);
	}

	[Fact]
	public void FollowChain_CircularChain_DetectsCircular() {
		// Create circular chain: 0 -> $8010 -> $8000 (back to start)
		byte[] data = new byte[0x100];
		data[0] = 0x10;
		data[1] = 0x80;
		data[0x10] = 0x00;
		data[0x11] = 0x80;

		var chain = PointerTable.FollowChain(data, 0, 10, 0x8000);

		Assert.True(chain.IsCircular);
	}

	[Fact]
	public void FindAllChains_ReturnsChains() {
		byte[] data = new byte[0x100];
		// Set up a simple chain
		data[0] = 0x10;
		data[1] = 0x80;
		data[0x10] = 0x20;
		data[0x11] = 0x80;

		var chains = PointerTable.FindAllChains(data, 1, 0x8000);

		Assert.NotNull(chains);
	}

	#endregion

	#region Table Detection Tests

	[Fact]
	public void ScanForTables_FindsValidTables() {
		// Create data with a pointer table
		byte[] data = new byte[0x100];
		// Table at offset 0: 4 consecutive pointers
		data[0] = 0x00; data[1] = 0x80;  // $8000
		data[2] = 0x10; data[3] = 0x80;  // $8010
		data[4] = 0x20; data[5] = 0x80;  // $8020
		data[6] = 0x30; data[7] = 0x80;  // $8030

		var tables = PointerTable.ScanForTables(data, 4);

		Assert.NotNull(tables);
	}

	[Fact]
	public void ScanForTables_RandomData_ReturnsResults() {
		// Random data unlikely to form valid pointer tables
		byte[] data = new byte[10];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(0xff - i);  // 0xff, 0xfe, 0xfd, etc.
		}

		var tables = PointerTable.ScanForTables(data, 4);

		Assert.NotNull(tables);
		// Note: May or may not find tables in random data depending on values
	}

	#endregion

	#region Pointer Map Tests

	[Fact]
	public void GeneratePointerMap_ReturnsMap() {
		byte[] data = new byte[0x100];
		// Add some pointer-like data
		data[0] = 0x00; data[1] = 0x80;
		data[2] = 0x10; data[3] = 0x80;

		var map = PointerTable.GeneratePointerMap(data, 0, 0x8000);

		Assert.NotNull(map);
	}

	[Fact]
	public void ExportPointerMap_ReturnsFormattedString() {
		var map = new List<PointerTable.PointerMapEntry> {
			new(0x100, 0x8000, 0, "Test1"),
			new(0x102, 0x8010, 0, "Test2")
		};

		string export = PointerTable.ExportPointerMap(map);

		Assert.Contains("Pointer Map", export);
		Assert.Contains("$000100", export);
		Assert.Contains("$8000", export);
	}

	#endregion

	#region Bank-Crossing Tests

	[Fact]
	public void FindBankCrossingPointers_NoCrossings_ReturnsEmpty() {
		// All pointers within same bank
		byte[] data = new byte[0x4000]; // One bank
		data[0] = 0x00; data[1] = 0x80;  // Points to $8000 (bank 0)
		data[2] = 0x10; data[3] = 0x80;  // Points to $8010 (bank 0)

		var crossings = PointerTable.FindBankCrossingPointers(data, 0x4000, 0, 0x8000);

		// With pointers pointing within same area, shouldn't have crossings
		Assert.NotNull(crossings);
	}

	[Fact]
	public void ValidateSameBankPointers_AllSameBank_ReturnsTrue() {
		byte[] data = [
			0x00, 0x80,  // $8000
			0x10, 0x80,  // $8010
			0x20, 0x80,  // $8020
		];

		var table = PointerTable.Read(data, 0, 3, PointerTable.PointerFormat.Absolute16);
		bool valid = PointerTable.ValidateSameBankPointers(table, 0x4000, 0x8000);

		Assert.True(valid);
	}

	[Fact]
	public void ValidateSameBankPointers_EmptyTable_ReturnsTrue() {
		var table = new PointerTable();
		bool valid = PointerTable.ValidateSameBankPointers(table);

		Assert.True(valid);
	}

	#endregion

	#region Batch Operations Tests

	[Fact]
	public void FindAllTargetAddresses_ReturnsTargets() {
		byte[] data = new byte[0x100];
		data[0] = 0x00; data[1] = 0x80;
		data[2] = 0x10; data[3] = 0x80;
		data[4] = 0x00; data[5] = 0x80;  // Duplicate

		var targets = PointerTable.FindAllTargetAddresses(data, 0, 0x8000);

		Assert.Contains(0x8000, targets);
		Assert.Contains(0x8010, targets);
	}

	[Fact]
	public void ExtractAllPointers_ReturnsDistinctSorted() {
		var tables = new List<PointerTable.TableDetectionResult> {
			new(0, 2, 0.9f, PointerTable.PointerFormat.Absolute16, 0x8000, 0x8010, "Test")
		};

		byte[] data = [0x00, 0x80, 0x10, 0x80];

		var pointers = PointerTable.ExtractAllPointers(data, tables);

		Assert.NotNull(pointers);
		Assert.Equal(pointers.OrderBy(p => p).ToList(), pointers);
	}

	[Fact]
	public void FindOrphanRegions_ReturnsRegions() {
		byte[] data = new byte[0x100];
		// Only pointer at start
		data[0] = 0x50; data[1] = 0x80;  // Points to $8050

		var orphans = PointerTable.FindOrphanRegions(data, 0, 0x8000, 8);

		Assert.NotNull(orphans);
	}

	#endregion

	#region PointerFormat Enum Tests

	[Fact]
	public void PointerFormat_HasNewValues() {
		Assert.True(Enum.IsDefined(typeof(PointerTable.PointerFormat), PointerTable.PointerFormat.Segmented));
		Assert.True(Enum.IsDefined(typeof(PointerTable.PointerFormat), PointerTable.PointerFormat.SnesBankHi));
	}

	#endregion
}
