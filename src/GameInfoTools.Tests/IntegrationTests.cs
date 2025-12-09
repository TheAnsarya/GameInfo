using GameInfoTools.Core;
using GameInfoTools.Text;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Integration tests that verify multiple components work together.
/// </summary>
public class IntegrationTests {
	[Fact]
	public void TextTable_ScriptCompiler_RoundTrip() {
		// Arrange - Create table with character mappings
		var table = new TextTable();
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0x80 + i), ((char)('A' + i)).ToString());
		}
		table.AddEntry(0x00, "{END}");

		// Create compiler and decompiler
		var compiler = new ScriptCompiler(table);

		// Act - Compile bytes
		var script = @".byte $80, $81, $82
.end";
		var result = compiler.Compile(script);

		// Assert - Should have ABC + end byte
		Assert.Empty(result.Errors);
		Assert.Equal(4, result.Data.Length);
		Assert.Equal(0x80, result.Data[0]); // A
		Assert.Equal(0x81, result.Data[1]); // B
		Assert.Equal(0x82, result.Data[2]); // C
		Assert.Equal(0x00, result.Data[3]); // END
	}

	[Fact]
	public void PointerTable_WithRomData_ParsesCorrectly() {
		// Arrange - Create simulated ROM with pointer table
		byte[] romData = new byte[256];

		// Pointer table at offset 0x00
		romData[0x00] = 0x20;
		romData[0x01] = 0x80; // $8020
		romData[0x02] = 0x40;
		romData[0x03] = 0x80; // $8040
		romData[0x04] = 0x60;
		romData[0x05] = 0x80; // $8060

		// Data at the pointer targets
		romData[0x20] = 0xaa;
		romData[0x40] = 0xbb;
		romData[0x60] = 0xcc;

		// Act
		var table = PointerTable.Read(romData, 0, 3, PointerTable.PointerFormat.Absolute16);

		// Assert
		Assert.Equal(3, table.Entries.Count);
		Assert.Equal(0x8020, table.Entries[0].PointerValue);
		Assert.Equal(0x8040, table.Entries[1].PointerValue);
		Assert.Equal(0x8060, table.Entries[2].PointerValue);
	}

	[Fact]
	public void AddressConverter_WithChecksum_CombinedOperations() {
		// Arrange
		byte[] testData = [0x48, 0x65, 0x6c, 0x6c, 0x6f];  // "Hello"

		// Act - Convert address and calculate checksum
		var hexAddr = AddressConverter.ToHex(0x8000);
		var crc = Checksum.Crc32(testData);

		// Assert
		Assert.Equal("$8000", hexAddr);
		Assert.NotEqual(0u, crc);
	}

	[Fact]
	public void TextTable_Encode_Decode_RoundTrip() {
		// Arrange
		var table = new TextTable();
		for (int i = 0; i < 26; i++) {
			table.AddEntry((byte)(0x80 + i), ((char)('A' + i)).ToString());
		}
		table.AddEntry(0xff, " ");

		// Act - Encode then decode
		var text = "HELLO";
		var encoded = table.Encode(text);
		var decoded = table.Decode(encoded);

		// Assert
		Assert.Equal(text, decoded);
	}

	[Fact]
	public void PatternDetector_WithRealPatterns() {
		// Arrange - Data with pointer table pattern
		byte[] data = new byte[256];
		// Create valid NES pointer table
		for (int i = 0; i < 8; i++) {
			data[i * 2] = (byte)((0x8000 + i * 0x100) & 0xff);
			data[i * 2 + 1] = (byte)(((0x8000 + i * 0x100) >> 8) & 0xff);
		}

		// Act
		var patterns = PatternDetector.FindPointerTables(data, SystemType.Nes);

		// Assert - Should find pointer table pattern
		Assert.NotEmpty(patterns);
	}

	[Fact]
	public void CompressionDetector_WithPlainData() {
		// Arrange - Uncompressed data
		byte[] data = new byte[100];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i * 7 % 256);  // Semi-random data
		}

		// Act
		var result = CompressionDetector.Detect(data, 0);

		// Assert - Should detect as uncompressed or no specific format
		Assert.NotNull(result);
	}

	[Fact]
	public void AsmFormatter_ValidateSyntax_MultipleStatements() {
		// Arrange
		var content = @"MyLabel:
    lda #$00        ; Load accumulator
    sta $10         ; Store to zero page
    jsr DoSomething ; Call subroutine
    rts             ; Return";

		// Act
		var errors = AsmFormatter.ValidateSyntax(content);

		// Assert
		Assert.Empty(errors);
	}

	[Fact]
	public void ScriptCompiler_WithLabels_ResolvesReferences() {
		// Arrange
		var table = new TextTable();
		table.AddEntry(0x00, "{END}");

		var compiler = new ScriptCompiler(table);
		var script = @"Start:
.byte $01
Middle:
.byte $02
.ref Start";

		// Act
		var result = compiler.Compile(script);

		// Assert
		Assert.Empty(result.Errors);
		Assert.Equal(0, result.Labels["Start"]);
		Assert.Equal(1, result.Labels["Middle"]);
		// The .ref should write $0000 (address of Start)
		Assert.True(result.Data.Length >= 4);
	}

	[Fact]
	public void AddressConverter_AllFormats_ParseCorrectly() {
		// Test various hex formats
		Assert.Equal(0x8000, AddressConverter.ParseHex("$8000"));
		Assert.Equal(0x8000, AddressConverter.ParseHex("0x8000"));
		Assert.Equal(0x8000, AddressConverter.ParseHex("8000"));
	}

	[Fact]
	public void Checksum_MultipleAlgorithms_SameData() {
		// Arrange
		byte[] data = [0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64];

		// Act
		var crc32 = Checksum.Crc32(data);
		var md5 = Checksum.Md5(data);
		var sha1 = Checksum.Sha1(data);

		// Assert - All should produce valid results
		Assert.NotEqual(0u, crc32);
		Assert.Equal(32, md5.Length);
		Assert.Equal(40, sha1.Length);

		// Verify deterministic - same data = same hash
		Assert.Equal(crc32, Checksum.Crc32(data));
		Assert.Equal(md5, Checksum.Md5(data));
		Assert.Equal(sha1, Checksum.Sha1(data));
	}

	[Fact]
	public void PointerTable_AutoDetect_WithValidTable() {
		// Arrange - Valid pointer table pointing to NES ROM addresses
		byte[] data =
		[
			0x00, 0x80,  // $8000
			0x20, 0x80,  // $8020
			0x40, 0x80,  // $8040
			0x60, 0x80,  // $8060
			0x80, 0x80,  // $8080
			0xa0, 0x80,  // $80a0
			0xc0, 0x80,  // $80c0
			0xe0, 0x80,  // $80e0
		];

		// Act
		var detected = PointerTable.DetectTable(data, 0, 8);

		// Assert
		Assert.NotNull(detected);
		Assert.Equal(8, detected.Entries.Count);
	}
}
