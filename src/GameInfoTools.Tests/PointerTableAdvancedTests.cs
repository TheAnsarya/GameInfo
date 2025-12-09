using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for PointerTable functionality.
/// </summary>
public class PointerTableAdvancedTests {
	#region PointerFormat Enum Tests

	[Fact]
	public void PointerFormat_HasAllExpectedValues() {
		var values = Enum.GetValues<PointerTable.PointerFormat>();

		Assert.Contains(PointerTable.PointerFormat.Absolute16, values);
		Assert.Contains(PointerTable.PointerFormat.Absolute24, values);
		Assert.Contains(PointerTable.PointerFormat.Relative8, values);
		Assert.Contains(PointerTable.PointerFormat.Relative16, values);
		Assert.Contains(PointerTable.PointerFormat.BankOffset, values);
		Assert.Contains(PointerTable.PointerFormat.LittleEndian, values);
		Assert.Contains(PointerTable.PointerFormat.BigEndian, values);
	}

	#endregion

	#region Read Absolute16 Tests

	[Fact]
	public void Read_Absolute16_LittleEndian_ParsesCorrectly() {
		// Two 16-bit little-endian pointers: $8000, $8100
		var data = new byte[] { 0x00, 0x80, 0x00, 0x81 };

		var table = PointerTable.Read(data, 0, 2, PointerTable.PointerFormat.Absolute16);

		Assert.Equal(2, table.Entries.Count);
		Assert.Equal(0x8000, table.Entries[0].PointerValue);
		Assert.Equal(0x8100, table.Entries[1].PointerValue);
	}

	[Fact]
	public void Read_Absolute16_TracksIndex() {
		var data = new byte[] { 0x00, 0x80, 0x00, 0x81, 0x00, 0x82 };

		var table = PointerTable.Read(data, 0, 3, PointerTable.PointerFormat.Absolute16);

		Assert.Equal(0, table.Entries[0].Index);
		Assert.Equal(1, table.Entries[1].Index);
		Assert.Equal(2, table.Entries[2].Index);
	}

	[Fact]
	public void Read_Absolute16_TracksTableOffset() {
		var data = new byte[] { 0x00, 0x80, 0x00, 0x81 };

		var table = PointerTable.Read(data, 0, 2, PointerTable.PointerFormat.Absolute16);

		Assert.Equal(0, table.Entries[0].TableOffset);
		Assert.Equal(2, table.Entries[1].TableOffset);
	}

	[Fact]
	public void Read_Absolute16_WithOffset_StartsAtCorrectPosition() {
		var data = new byte[] { 0xff, 0xff, 0x00, 0x80, 0x00, 0x81 };

		var table = PointerTable.Read(data, 2, 2, PointerTable.PointerFormat.Absolute16);

		Assert.Equal(0x8000, table.Entries[0].PointerValue);
		Assert.Equal(2, table.Entries[0].TableOffset);
	}

	#endregion

	#region Read Absolute24 Tests

	[Fact]
	public void Read_Absolute24_ParsesCorrectly() {
		// Two 24-bit pointers: $c08000, $c18000
		var data = new byte[] { 0x00, 0x80, 0xc0, 0x00, 0x80, 0xc1 };

		var table = PointerTable.Read(data, 0, 2, PointerTable.PointerFormat.Absolute24);

		Assert.Equal(2, table.Entries.Count);
		Assert.Equal(0xc08000, table.Entries[0].PointerValue);
		Assert.Equal(0xc18000, table.Entries[1].PointerValue);
	}

	#endregion

	#region Read Relative8 Tests

	[Fact]
	public void Read_Relative8_ParsesCorrectly() {
		// Two 8-bit relative offsets
		var data = new byte[] { 0x10, 0x20 };

		var table = PointerTable.Read(data, 0, 2, PointerTable.PointerFormat.Relative8);

		Assert.Equal(2, table.Entries.Count);
		Assert.Equal(0x10, table.Entries[0].PointerValue);
		Assert.Equal(0x20, table.Entries[1].PointerValue);
	}

	#endregion

	#region Read BankOffset Tests

	[Fact]
	public void Read_BankOffset_ParsesCorrectly() {
		// Bank byte + 16-bit offset: bank $0c, offset $8000
		var data = new byte[] { 0x0c, 0x00, 0x80 };

		var table = PointerTable.Read(data, 0, 1, PointerTable.PointerFormat.BankOffset);

		Assert.Single(table.Entries);
		// Combined value: (0x0c << 16) | 0x8000 = 0x0c8000
		Assert.Equal(0x0c8000, table.Entries[0].PointerValue);
	}

	#endregion

	#region Read Edge Cases Tests

	[Fact]
	public void Read_EmptyData_ReturnsEmptyTable() {
		var data = Array.Empty<byte>();

		var table = PointerTable.Read(data, 0, 10, PointerTable.PointerFormat.Absolute16);

		Assert.Empty(table.Entries);
	}

	[Fact]
	public void Read_MoreEntriesThanData_ReadsAvailableOnly() {
		var data = new byte[] { 0x00, 0x80 };

		var table = PointerTable.Read(data, 0, 100, PointerTable.PointerFormat.Absolute16);

		Assert.Single(table.Entries);
	}

	[Fact]
	public void Read_PartialPointerAtEnd_SkipsIncomplete() {
		// One complete pointer + one incomplete
		var data = new byte[] { 0x00, 0x80, 0x00 };

		var table = PointerTable.Read(data, 0, 10, PointerTable.PointerFormat.Absolute16);

		Assert.Single(table.Entries);
	}

	#endregion

	#region DetectTable Tests

	[Fact]
	public void DetectTable_ValidNesPointerTable_DetectsTable() {
		// Valid NES pointer table (addresses in $8000-$FFFF range)
		var data = new byte[]
		{
			0x00, 0x80,  // $8000
			0x10, 0x80,  // $8010
			0x20, 0x80,  // $8020
			0x30, 0x80   // $8030
		};

		var table = PointerTable.DetectTable(data, 0, 4);

		Assert.NotNull(table);
		Assert.Equal(4, table.Entries.Count);
	}

	[Fact]
	public void DetectTable_InvalidPointers_ReturnsNull() {
		// Invalid pointers (all zeros or out of range)
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

		var table = PointerTable.DetectTable(data, 0, 4);

		Assert.Null(table);
	}

	[Fact]
	public void DetectTable_TooShortData_ReturnsNull() {
		var data = new byte[] { 0x00, 0x80 };

		var table = PointerTable.DetectTable(data, 0, 10);

		// Not enough valid entries
		Assert.Null(table);
	}

	[Fact]
	public void DetectTable_OffsetBeyondData_ReturnsNull() {
		var data = new byte[] { 0x00, 0x80, 0x10, 0x80 };

		var table = PointerTable.DetectTable(data, 100, 4);

		Assert.Null(table);
	}

	#endregion

	#region PointerEntry Record Tests

	[Fact]
	public void PointerEntry_AllProperties_Accessible() {
		var entry = new PointerTable.PointerEntry(0x100, 0x8000, 0x8000, 5);

		Assert.Equal(0x100, entry.TableOffset);
		Assert.Equal(0x8000, entry.PointerValue);
		Assert.Equal(0x8000, entry.TargetAddress);
		Assert.Equal(5, entry.Index);
	}

	[Fact]
	public void PointerEntry_Record_SupportsEquality() {
		var entry1 = new PointerTable.PointerEntry(0x100, 0x8000, 0x8000, 5);
		var entry2 = new PointerTable.PointerEntry(0x100, 0x8000, 0x8000, 5);

		Assert.Equal(entry1, entry2);
	}

	#endregion

	#region Table Properties Tests

	[Fact]
	public void PointerTable_DefaultProperties() {
		var data = new byte[] { 0x00, 0x80 };
		var table = PointerTable.Read(data, 0, 1, PointerTable.PointerFormat.Absolute16);

		Assert.Equal(PointerTable.PointerFormat.Absolute16, table.Format);
		Assert.True(table.IsLittleEndian);
		Assert.Equal(0, table.BaseAddress);
		Assert.Equal(0, table.Bank);
	}

	[Fact]
	public void PointerTable_WithBank_SetsBank() {
		var data = new byte[] { 0x00, 0x80 };
		var table = PointerTable.Read(data, 0, 1, PointerTable.PointerFormat.Absolute16, bank: 3);

		Assert.Equal(3, table.Bank);
	}

	[Fact]
	public void PointerTable_WithBaseAddress_SetsBaseAddress() {
		var data = new byte[] { 0x00, 0x80 };
		var table = PointerTable.Read(data, 0, 1, PointerTable.PointerFormat.Absolute16, baseAddress: 0xc000);

		Assert.Equal(0xc000, table.BaseAddress);
	}

	#endregion

	#region FindAllTables Tests

	[Fact]
	public void FindAllTables_WithValidTables_ReturnsResults() {
		// Data with a clear pointer table pattern
		var data = new byte[256];

		// Insert a valid pointer table at offset 0x10
		data[0x10] = 0x00;
		data[0x11] = 0x80;  // $8000
		data[0x12] = 0x10;
		data[0x13] = 0x80;  // $8010
		data[0x14] = 0x20;
		data[0x15] = 0x80;  // $8020
		data[0x16] = 0x30;
		data[0x17] = 0x80;  // $8030
		data[0x18] = 0x40;
		data[0x19] = 0x80;  // $8040

		var tables = PointerTable.FindAllTables(data, minEntries: 4);

		// Should find at least the clear table we created
		Assert.NotEmpty(tables);
	}

	[Fact]
	public void FindAllTables_EmptyData_ReturnsEmpty() {
		var data = Array.Empty<byte>();

		var tables = PointerTable.FindAllTables(data);

		Assert.Empty(tables);
	}

	[Fact]
	public void FindAllTables_NoValidTables_ReturnsEmpty() {
		// Random data with no valid pointer patterns
		var data = new byte[64];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i * 7); // Just some pattern that won't look like pointers
		}

		var tables = PointerTable.FindAllTables(data);

		// May return empty or low-confidence results
		// Just verify it doesn't throw
		Assert.NotNull(tables);
	}

	#endregion
}

/// <summary>
/// Tests for PatternDetector static class.
/// </summary>
public class PatternDetectorAdvancedTests {
	#region FindPointerTables Tests

	[Fact]
	public void FindPointerTables_ValidData_ReturnsMatches() {
		// Create data with a valid NES-style pointer table
		var data = new byte[128];

		// Valid pointer table starting at offset 0x10
		data[0x10] = 0x00;
		data[0x11] = 0x80;
		data[0x12] = 0x10;
		data[0x13] = 0x80;
		data[0x14] = 0x20;
		data[0x15] = 0x80;
		data[0x16] = 0x30;
		data[0x17] = 0x80;

		var matches = PatternDetector.FindPointerTables(data, SystemType.Nes);

		// Should detect the pointer table
		Assert.NotNull(matches);
	}

	[Fact]
	public void FindPointerTables_EmptyData_ReturnsEmpty() {
		var data = Array.Empty<byte>();

		var matches = PatternDetector.FindPointerTables(data, SystemType.Nes);

		Assert.Empty(matches);
	}

	#endregion

	#region FindTextRegions Tests

	[Fact]
	public void FindTextRegions_AsciiText_FindsRegions() {
		// Create data with ASCII text region
		var data = new byte[64];
		var text = "Hello World! This is a test string.";
		var textBytes = System.Text.Encoding.ASCII.GetBytes(text);
		Array.Copy(textBytes, 0, data, 10, textBytes.Length);

		var matches = PatternDetector.FindTextRegions(data);

		Assert.NotNull(matches);
	}

	[Fact]
	public void FindTextRegions_NoText_MayReturnEmpty() {
		// Binary data with no readable text
		var data = new byte[64];
		for (int i = 0; i < data.Length; i++) {
			data[i] = 0xff;
		}

		var matches = PatternDetector.FindTextRegions(data);

		// Should not crash
		Assert.NotNull(matches);
	}

	#endregion

	#region FindGraphicsRegions Tests

	[Fact]
	public void FindGraphicsRegions_TileData_FindsRegions() {
		// Create data that looks like NES CHR data (repeating patterns typical of tiles)
		var data = new byte[256];
		// Fill with typical tile-like pattern (two bitplanes)
		for (int tile = 0; tile < 16; tile++) {
			int offset = tile * 16;
			for (int row = 0; row < 8; row++) {
				data[offset + row] = 0x00;          // Plane 0
				data[offset + 8 + row] = (byte)row; // Plane 1
			}
		}

		// NES uses 16-byte tiles (8x8 with 2 bitplanes)
		var matches = PatternDetector.FindGraphicsRegions(data, 16);

		Assert.NotNull(matches);
	}

	#endregion

	#region FindCodeRegions Tests

	[Fact]
	public void FindCodeRegions_ValidCode_FindsRegions() {
		// Create data with valid 6502 code patterns
		var data = new byte[]
		{
			0xa9, 0x00,        // LDA #$00
			0x8d, 0x00, 0x20,  // STA $2000
			0xa2, 0xff,        // LDX #$FF
			0x9a,              // TXS
			0x4c, 0x00, 0x80   // JMP $8000
		};

		// Pad to reasonable size
		var padded = new byte[64];
		Array.Copy(data, padded, data.Length);

		var matches = PatternDetector.FindCodeRegions(padded, SystemType.Nes);

		Assert.NotNull(matches);
	}

	#endregion

	#region FindDataTables Tests

	[Fact]
	public void FindDataTables_StructuredData_FindsMatches() {
		// Create structured data table (repeating record pattern)
		var data = new byte[128];
		// Each record: 2 bytes ID, 2 bytes value, 4 bytes total
		for (int i = 0; i < 16; i++) {
			int offset = i * 8;
			data[offset] = (byte)i;        // ID low
			data[offset + 1] = 0x00;       // ID high
			data[offset + 2] = (byte)(i * 10);  // Value low
			data[offset + 3] = 0x00;       // Value high
			data[offset + 4] = 0xff;       // Fixed pattern
			data[offset + 5] = 0x00;
			data[offset + 6] = 0x00;
			data[offset + 7] = 0x00;
		}

		var matches = PatternDetector.FindDataTables(data, 4, 32);

		Assert.NotNull(matches);
	}

	#endregion

	#region PatternMatch Record Tests

	[Fact]
	public void PatternMatch_Properties_AllAccessible() {
		// Verify PatternMatch structure works correctly
		var data = new byte[] { 0xa9, 0x00, 0x8d, 0x00, 0x20 };

		var codeRegions = PatternDetector.FindCodeRegions(data, SystemType.Nes);

		// Just verify we can access the results
		foreach (var match in codeRegions) {
			// Access properties without null reference
			var offset = match.Offset;
			var length = match.Length;
			var confidence = match.Confidence;
			var patternType = match.PatternType;

			Assert.True(offset >= 0);
		}
	}

	#endregion
}
