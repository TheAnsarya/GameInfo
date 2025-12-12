using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for SaveStateEditor class.
/// </summary>
public class SaveStateEditorTests {
	#region Format Detection Tests

	[Fact]
	public void DetectFormat_Snes9x_Detected() {
		var data = new byte[100];
		data[0] = (byte)'#';
		data[1] = (byte)'!';
		data[2] = (byte)'s';
		data[3] = (byte)'9';

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Snes9x, format);
	}

	[Fact]
	public void DetectFormat_Zsnes_Detected() {
		var data = new byte[100];
		data[0] = (byte)'Z';
		data[1] = (byte)'S';
		data[2] = (byte)'N';
		data[3] = (byte)'E';
		data[4] = (byte)'S';

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Zsnes, format);
	}

	[Fact]
	public void DetectFormat_Bsnes_Detected() {
		var data = new byte[100];
		data[0] = (byte)'B';
		data[1] = (byte)'S';
		data[2] = (byte)'T';
		data[3] = (byte)'1';

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Bsnes, format);
	}

	[Fact]
	public void DetectFormat_Nestopia_Detected() {
		var data = new byte[100];
		data[0] = (byte)'N';
		data[1] = (byte)'S';
		data[2] = (byte)'T';
		data[3] = 0x1a;

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Nestopia, format);
	}

	[Fact]
	public void DetectFormat_Fceux_Detected() {
		var data = new byte[100];
		data[0] = (byte)'F';
		data[1] = (byte)'C';
		data[2] = (byte)'S';
		data[3] = (byte)'X';

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Fceux, format);
	}

	[Fact]
	public void DetectFormat_Vba_Detected() {
		var data = new byte[100];
		data[0] = (byte)'V';
		data[1] = (byte)'B';
		data[2] = (byte)'A';
		data[3] = (byte)'-';

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Vba, format);
	}

	[Fact]
	public void DetectFormat_GzipCompressed_Detected() {
		var data = new byte[100];
		data[0] = 0x1f;
		data[1] = 0x8b;

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.GzipCompressed, format);
	}

	[Fact]
	public void DetectFormat_Sram_Detected() {
		var data = new byte[0x2000]; // 8KB - typical NES SRAM
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i & 0xff);
		}

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Sram, format);
	}

	[Fact]
	public void DetectFormat_SmallData_ReturnsUnknown() {
		var data = new byte[2];

		var format = SaveStateEditor.DetectFormat(data);

		Assert.Equal(SaveFormat.Unknown, format);
	}

	#endregion

	#region SRAM Read/Write Tests

	[Fact]
	public void ReadValue_Byte_ReturnsCorrectValue() {
		var sram = new byte[] { 0x12, 0x34, 0x56, 0x78 };

		int value = SaveStateEditor.ReadValue(sram, 0, SramValueType.Byte);

		Assert.Equal(0x12, value);
	}

	[Fact]
	public void ReadValue_Word_ReturnsLittleEndian() {
		var sram = new byte[] { 0x12, 0x34, 0x56, 0x78 };

		int value = SaveStateEditor.ReadValue(sram, 0, SramValueType.Word);

		Assert.Equal(0x3412, value);
	}

	[Fact]
	public void ReadValue_WordBE_ReturnsBigEndian() {
		var sram = new byte[] { 0x12, 0x34, 0x56, 0x78 };

		int value = SaveStateEditor.ReadValue(sram, 0, SramValueType.WordBE);

		Assert.Equal(0x1234, value);
	}

	[Fact]
	public void ReadValue_DWord_ReturnsLittleEndian() {
		var sram = new byte[] { 0x12, 0x34, 0x56, 0x78 };

		int value = SaveStateEditor.ReadValue(sram, 0, SramValueType.DWord);

		Assert.Equal(0x78563412, value);
	}

	[Fact]
	public void ReadValue_DWordBE_ReturnsBigEndian() {
		var sram = new byte[] { 0x12, 0x34, 0x56, 0x78 };

		int value = SaveStateEditor.ReadValue(sram, 0, SramValueType.DWordBE);

		Assert.Equal(0x12345678, value);
	}

	[Fact]
	public void WriteValue_Byte_WritesCorrectly() {
		var sram = new byte[4];

		SaveStateEditor.WriteValue(sram, 0, 0x42, SramValueType.Byte);

		Assert.Equal(0x42, sram[0]);
	}

	[Fact]
	public void WriteValue_Word_WritesLittleEndian() {
		var sram = new byte[4];

		SaveStateEditor.WriteValue(sram, 0, 0x1234, SramValueType.Word);

		Assert.Equal(0x34, sram[0]);
		Assert.Equal(0x12, sram[1]);
	}

	[Fact]
	public void WriteValue_WordBE_WritesBigEndian() {
		var sram = new byte[4];

		SaveStateEditor.WriteValue(sram, 0, 0x1234, SramValueType.WordBE);

		Assert.Equal(0x12, sram[0]);
		Assert.Equal(0x34, sram[1]);
	}

	[Fact]
	public void ReadValue_InvalidOffset_ThrowsException() {
		var sram = new byte[4];

		Assert.Throws<ArgumentOutOfRangeException>(() =>
			SaveStateEditor.ReadValue(sram, 10, SramValueType.Byte));
	}

	[Fact]
	public void WriteValue_InvalidOffset_ThrowsException() {
		var sram = new byte[4];

		Assert.Throws<ArgumentOutOfRangeException>(() =>
			SaveStateEditor.WriteValue(sram, 10, 0x42, SramValueType.Byte));
	}

	#endregion

	#region Find Value Tests

	[Fact]
	public void FindValue_FindsSingleMatch() {
		var sram = new byte[] { 0x00, 0x42, 0x00, 0x00 };

		var results = SaveStateEditor.FindValue(sram, 0x42, SramValueType.Byte);

		Assert.Single(results);
		Assert.Equal(1, results[0]);
	}

	[Fact]
	public void FindValue_FindsMultipleMatches() {
		var sram = new byte[] { 0x42, 0x00, 0x42, 0x42 };

		var results = SaveStateEditor.FindValue(sram, 0x42, SramValueType.Byte);

		Assert.Equal(3, results.Count);
	}

	[Fact]
	public void FindValue_NoMatches_ReturnsEmpty() {
		var sram = new byte[] { 0x00, 0x00, 0x00, 0x00 };

		var results = SaveStateEditor.FindValue(sram, 0x42, SramValueType.Byte);

		Assert.Empty(results);
	}

	[Fact]
	public void FindValue_Word_FindsMatch() {
		var sram = new byte[] { 0x34, 0x12, 0x00, 0x00 };

		var results = SaveStateEditor.FindValue(sram, 0x1234, SramValueType.Word);

		Assert.Single(results);
		Assert.Equal(0, results[0]);
	}

	#endregion

	#region Find Changes Tests

	[Fact]
	public void FindChanges_DetectsChangedByte() {
		var before = new byte[] { 0x10, 0x20, 0x30, 0x40 };
		var after = new byte[] { 0x10, 0x25, 0x30, 0x40 };

		var changes = SaveStateEditor.FindChanges(before, after, SramValueType.Byte);

		Assert.Single(changes);
		Assert.Equal(1, changes[0].Offset);
		Assert.Equal(0x20, changes[0].OldValue);
		Assert.Equal(0x25, changes[0].NewValue);
	}

	[Fact]
	public void FindChanges_DetectsMultipleChanges() {
		var before = new byte[] { 0x10, 0x20, 0x30, 0x40 };
		var after = new byte[] { 0x11, 0x20, 0x31, 0x40 };

		var changes = SaveStateEditor.FindChanges(before, after, SramValueType.Byte);

		Assert.Equal(2, changes.Count);
	}

	[Fact]
	public void FilterByChange_FiltersCorrectly() {
		var before = new byte[] { 0x10, 0x20, 0x30, 0x40 };
		var after = new byte[] { 0x11, 0x21, 0x35, 0x40 };
		var candidates = new List<int> { 0, 1, 2 };

		// Filter for delta of +1
		var results = SaveStateEditor.FilterByChange(before, after, candidates, 1, SramValueType.Byte);

		Assert.Equal(2, results.Count);
		Assert.Contains(0, results);
		Assert.Contains(1, results);
	}

	#endregion

	#region Checksum Tests

	[Fact]
	public void CalculateSramChecksum_SimpleSum_CalculatesCorrectly() {
		var sram = new byte[] { 0x10, 0x20, 0x30, 0x40 };

		var checksum = SaveStateEditor.CalculateSramChecksum(sram, SramChecksumType.SimpleSum);

		Assert.Equal(0xa0, checksum); // 0x10 + 0x20 + 0x30 + 0x40
	}

	[Fact]
	public void CalculateSramChecksum_Xor_CalculatesCorrectly() {
		var sram = new byte[] { 0x12, 0x34, 0x56, 0x78 };

		var checksum = SaveStateEditor.CalculateSramChecksum(sram, SramChecksumType.Xor);

		// (0x3412) XOR (0x7856) = 0x4c44
		Assert.Equal(0x4c44, checksum);
	}

	[Fact]
	public void CalculateSramChecksum_Complement_CalculatesCorrectly() {
		var sram = new byte[] { 0x10, 0x20, 0x30, 0x40 };

		var checksum = SaveStateEditor.CalculateSramChecksum(sram, SramChecksumType.Complement);

		// ~0xa0 = 0xff5f
		Assert.Equal(0xff5f, checksum);
	}

	[Fact]
	public void VerifySramChecksum_ValidChecksum_ReturnsTrue() {
		// Create data with checksum at offset 4
		var sram = new byte[] { 0x10, 0x20, 0x30, 0x40, 0xa0, 0x00 };

		bool valid = SaveStateEditor.VerifySramChecksum(sram, 4, SramChecksumType.SimpleSum);

		Assert.True(valid);
	}

	[Fact]
	public void VerifySramChecksum_InvalidChecksum_ReturnsFalse() {
		var sram = new byte[] { 0x10, 0x20, 0x30, 0x40, 0xff, 0x00 };

		bool valid = SaveStateEditor.VerifySramChecksum(sram, 4, SramChecksumType.SimpleSum);

		Assert.False(valid);
	}

	[Fact]
	public void FixSramChecksum_FixesCorrectly() {
		var sram = new byte[] { 0x10, 0x20, 0x30, 0x40, 0x00, 0x00 };

		SaveStateEditor.FixSramChecksum(sram, 4, SramChecksumType.SimpleSum);

		Assert.Equal(0xa0, sram[4]);
		Assert.Equal(0x00, sram[5]);
	}

	#endregion

	#region Save Comparison Tests

	[Fact]
	public void CompareSaves_IdenticalSaves_NoDifferences() {
		var save1 = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		var save2 = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var comparison = SaveStateEditor.CompareSaves(save1, save2);

		Assert.Empty(comparison.Differences);
		Assert.Equal(1.0, comparison.Similarity);
	}

	[Fact]
	public void CompareSaves_SingleByteDifference_DetectsDifference() {
		var save1 = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		var save2 = new byte[] { 0x01, 0xff, 0x03, 0x04 };

		var comparison = SaveStateEditor.CompareSaves(save1, save2);

		Assert.Single(comparison.Differences);
		Assert.Equal(1, comparison.Differences[0].Offset);
	}

	[Fact]
	public void CompareSaves_DifferentSizes_DetectsSizeDifference() {
		var save1 = new byte[] { 0x01, 0x02 };
		var save2 = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var comparison = SaveStateEditor.CompareSaves(save1, save2);

		Assert.Equal(2, comparison.Size1);
		Assert.Equal(4, comparison.Size2);
	}

	[Fact]
	public void CompareSaves_MultipleBlocks_DetectsAll() {
		var save1 = new byte[] { 0x01, 0x02, 0x03, 0x04, 0x05 };
		var save2 = new byte[] { 0xff, 0x02, 0x03, 0xff, 0x05 };

		var comparison = SaveStateEditor.CompareSaves(save1, save2);

		Assert.Equal(2, comparison.Differences.Count);
	}

	#endregion

	#region Compression Tests

	[Fact]
	public void DecompressSaveState_NonGzipped_ReturnsOriginal() {
		var data = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var result = SaveStateEditor.DecompressSaveState(data);

		Assert.Equal(data, result);
	}

	[Fact]
	public void CompressDecompress_Roundtrip_PreservesData() {
		var original = new byte[1000];
		for (int i = 0; i < original.Length; i++) {
			original[i] = (byte)(i & 0xff);
		}

		var compressed = SaveStateEditor.CompressSaveState(original);
		var decompressed = SaveStateEditor.DecompressSaveState(compressed);

		Assert.Equal(original, decompressed);
	}

	[Fact]
	public void CompressSaveState_ProducesGzip() {
		var data = new byte[100];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i & 0xff);
		}

		var compressed = SaveStateEditor.CompressSaveState(data);

		Assert.Equal(0x1f, compressed[0]);
		Assert.Equal(0x8b, compressed[1]);
	}

	#endregion

	#region GetSaveInfo Tests

	[Fact]
	public void GetSaveInfo_Snes9x_ReturnsCorrectInfo() {
		var data = new byte[100];
		data[0] = (byte)'#';
		data[1] = (byte)'!';
		data[2] = (byte)'s';
		data[3] = (byte)'9';
		data[4] = (byte)'0';
		data[5] = (byte)'1';
		data[6] = (byte)'6';
		data[7] = (byte)'0';

		var info = SaveStateEditor.GetSaveInfo(data);

		Assert.Equal(SaveFormat.Snes9x, info.Format);
		Assert.Equal("SNES9x", info.Emulator);
		Assert.Equal(SystemType.Snes, info.System);
	}

	[Fact]
	public void GetSaveInfo_Vba_ReturnsCorrectInfo() {
		var data = new byte[100];
		data[0] = (byte)'V';
		data[1] = (byte)'B';
		data[2] = (byte)'A';
		data[3] = (byte)'-';
		data[4] = (byte)'2';
		data[5] = (byte)'.';
		data[6] = (byte)'4';
		data[7] = (byte)'\0';

		var info = SaveStateEditor.GetSaveInfo(data);

		Assert.Equal(SaveFormat.Vba, info.Format);
		Assert.Equal("VisualBoyAdvance", info.Emulator);
		Assert.Equal(SystemType.GameBoyAdvance, info.System);
	}

	[Fact]
	public void GetSaveInfo_Sram_ReturnsCorrectSize() {
		var data = new byte[0x2000]; // 8KB
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i & 0xff);
		}

		var info = SaveStateEditor.GetSaveInfo(data);

		Assert.Equal(SaveFormat.Sram, info.Format);
		Assert.Equal(0x2000, info.Size);
	}

	#endregion
}
