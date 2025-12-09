using GameInfoTools.Analysis;
using GameInfoTools.Core;
using GameInfoTools.Text;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Performance and stress tests for GameInfo tools.
/// </summary>
public class PerformanceTests {
	[Fact]
	public void Checksum_LargeData_CompletesQuickly() {
		// Arrange - 1MB of data
		var data = new byte[1024 * 1024];
		var rng = new Random(42);
		rng.NextBytes(data);

		// Act & Assert - Should complete without timeout
		var crc32 = Checksum.Crc32(data);
		var md5 = Checksum.Md5(data);
		var sha1 = Checksum.Sha1(data);

		Assert.NotEqual(0u, crc32);
		Assert.Equal(32, md5.Length);
		Assert.Equal(40, sha1.Length);
	}

	[Fact]
	public void TextTable_LargeTable_LoadsQuickly() {
		// Arrange - Create table with 256 entries
		var table = new TextTable();

		// Act
		for (int i = 0; i < 256; i++) {
			table.AddEntry((byte)i, $"CHAR_{i:X2}");
		}

		// Assert
		Assert.Equal(256, table.EntryCount);
	}

	[Fact]
	public void TextTable_LargeEncode_CompletesQuickly() {
		// Arrange
		var table = new TextTable();
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0x80 + i), ((char)('A' + i)).ToString());
		}
		table.AddEntry(0xff, " ");

		// Create 10KB of text
		var text = string.Join(" ", Enumerable.Repeat("HELLO WORLD", 1000));

		// Act
		var encoded = table.Encode(text);

		// Assert
		Assert.True(encoded.Length > 0);
	}

	[Fact]
	public void CrossReferenceDb_ManyReferences_HandlesWell() {
		// Arrange
		var db = new CrossReferenceDb();

		// Act - Add 1000 references
		for (int i = 0; i < 1000; i++) {
			db.AddRef(0x8000 + i, 0x9000 + (i % 100), CrossReferenceDb.RefType.Call);
		}

		// Assert
		var refs = db.GetRefsTo(0x9000).ToList();
		Assert.Equal(10, refs.Count); // 1000 / 100 = 10 refs to 0x9000
	}

	[Fact]
	public void PointerTable_LargeTable_ParsesCorrectly() {
		// Arrange - 256 entry pointer table
		var data = new byte[512];
		for (int i = 0; i < 256; i++) {
			int addr = 0x8000 + (i * 0x10);
			data[i * 2] = (byte)(addr & 0xff);
			data[i * 2 + 1] = (byte)((addr >> 8) & 0xff);
		}

		// Act
		var table = PointerTable.Read(data, 0, 256, PointerTable.PointerFormat.Absolute16);

		// Assert
		Assert.Equal(256, table.Entries.Count);
	}

	[Fact]
	public void PatternDetector_LargeRom_FindsPatterns() {
		// Arrange - Create ROM-like data with pointer tables
		var data = new byte[32768]; // 32KB
		var rng = new Random(42);
		rng.NextBytes(data);

		// Insert a valid pointer table
		for (int i = 0; i < 16; i++) {
			int addr = 0x8000 + (i * 0x100);
			data[0x100 + i * 2] = (byte)(addr & 0xff);
			data[0x100 + i * 2 + 1] = (byte)((addr >> 8) & 0xff);
		}

		// Act
		var patterns = PatternDetector.FindPointerTables(data, SystemType.Nes);

		// Assert - Should find at least some pattern
		Assert.NotNull(patterns);
	}

	[Fact]
	public void AsmFormatter_LargeFile_FormatsQuickly() {
		// Arrange - Generate large ASM content
		var sb = new System.Text.StringBuilder();
		for (int i = 0; i < 1000; i++) {
			sb.AppendLine($"Label_{i:X4}:");
			sb.AppendLine($"    LDA #${i:X2}");
			sb.AppendLine($"    STA $10");
			sb.AppendLine($"    RTS");
			sb.AppendLine();
		}
		var content = sb.ToString();

		// Act
		var formatted = AsmFormatter.FormatFile(content);

		// Assert
		Assert.NotNull(formatted);
		Assert.True(formatted.Length > 0);
	}

	[Fact]
	public void AddressConverter_ManyConversions_CompletesQuickly() {
		// Act & Assert - Convert 10000 addresses
		for (int i = 0; i < 10000; i++) {
			var hex = AddressConverter.ToHex(i);
			var back = AddressConverter.ParseHex(hex);
			Assert.Equal(i, back);
		}
	}
}

/// <summary>
/// Additional boundary and edge case tests.
/// </summary>
public class BoundaryTests {
	[Fact]
	public void PointerTable_EmptyData_ReturnsEmptyTable() {
		// Arrange
		var data = Array.Empty<byte>();

		// Act
		var table = PointerTable.Read(data, 0, 10, PointerTable.PointerFormat.Absolute16);

		// Assert
		Assert.Empty(table.Entries);
	}

	[Fact]
	public void TextTable_DuplicateEntry_OverwritesPrevious() {
		// Arrange
		var table = new TextTable();
		table.AddEntry(0x80, "A");
		table.AddEntry(0x80, "B");

		// Act
		var decoded = table.Decode(new byte[] { 0x80 });

		// Assert
		Assert.Equal("B", decoded);
	}

	[Fact]
	public void CrossReferenceDb_Labels_GetSetCorrectly() {
		// Arrange
		var db = new CrossReferenceDb();

		// Act
		db.SetLabel(0x8000, "MainLoop");
		db.SetComment(0x8000, "Game main loop");

		// Assert
		Assert.Equal("MainLoop", db.GetLabel(0x8000));
		Assert.Equal("Game main loop", db.GetComment(0x8000));
	}

	[Fact]
	public void CrossReferenceDb_GetCalleesOf_ReturnsDistinct() {
		// Arrange
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call); // Duplicate
		db.AddRef(0x8000, 0xa000, CrossReferenceDb.RefType.Jump);

		// Act
		var callees = db.GetCalleesOf(0x8000).ToList();

		// Assert
		Assert.Equal(2, callees.Count); // Only 2 distinct targets
	}

	[Fact]
	public void AsmFormatter_NullInput_Handled() {
		// Arrange
		var options = new AsmFormatter.FormatOptions();

		// Act
		var result = AsmFormatter.FormatLine(null!, options);

		// Assert - Should not crash, returns empty or null
		Assert.True(result == "" || result == null);
	}

	[Fact]
	public void Checksum_EmptyData_ReturnsValidResult() {
		// Arrange
		var data = Array.Empty<byte>();

		// Act
		var crc32 = Checksum.Crc32(data);
		var md5 = Checksum.Md5(data);
		var sha1 = Checksum.Sha1(data);

		// Assert - Should return valid empty-data checksums
		Assert.Equal(32, md5.Length);
		Assert.Equal(40, sha1.Length);
	}

	[Fact]
	public void PatternDetector_EmptyData_ReturnsEmpty() {
		// Arrange
		var data = Array.Empty<byte>();

		// Act
		var patterns = PatternDetector.FindPointerTables(data, SystemType.Nes);

		// Assert
		Assert.Empty(patterns);
	}

	[Fact]
	public void CompressionDetector_SmallData_Handles() {
		// Arrange
		var data = new byte[] { 0x10, 0x00, 0x01, 0x00 };

		// Act
		var result = CompressionDetector.Detect(data, 0);

		// Assert
		Assert.NotNull(result);
	}

	[Fact]
	public void ScriptCompiler_EmptyLabels_Tracked() {
		// Arrange
		var table = new TextTable();
		var compiler = new ScriptCompiler(table);
		var script = @"Start:
End:";

		// Act
		var result = compiler.Compile(script);

		// Assert
		Assert.Equal(2, result.Labels.Count);
		Assert.Equal(0, result.Labels["Start"]);
		Assert.Equal(0, result.Labels["End"]); // Both at same position (0)
	}

	[Fact]
	public void PointerTable_ReadBeyondData_StopsGracefully() {
		// Arrange
		var data = new byte[] { 0x00, 0x80, 0x10, 0x80 };

		// Act - Try to read 100 entries from 4 bytes
		var table = PointerTable.Read(data, 0, 100, PointerTable.PointerFormat.Absolute16);

		// Assert - Should only read available entries
		Assert.Equal(2, table.Entries.Count);
	}
}
