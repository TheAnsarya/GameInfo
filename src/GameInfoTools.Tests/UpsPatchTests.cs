using GameInfoTools.Rom;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for UPS patch format support.
/// </summary>
public class UpsPatchTests {
	#region UPS Record Tests

	[Fact]
	public void UpsRecord_Properties_Preserved() {
		var xorData = new byte[] { 0x01, 0x02, 0x03 };
		var record = new UpsPatch.UpsRecord(100, xorData);

		Assert.Equal(100, record.RelativeOffset);
		Assert.Equal(xorData, record.XorData);
	}

	[Fact]
	public void UpsRecord_EmptyXorData_Allowed() {
		var record = new UpsPatch.UpsRecord(0, []);

		Assert.Empty(record.XorData);
	}

	#endregion

	#region CRC32 Tests

	[Fact]
	public void Crc32_EmptyData_ReturnsZero() {
		uint crc = Crc32.Calculate([]);

		Assert.Equal(0u, crc);
	}

	[Fact]
	public void Crc32_KnownData_CorrectCrc() {
		// CRC32 of "123456789" is 0xCBF43926
		byte[] data = "123456789"u8.ToArray();
		uint crc = Crc32.Calculate(data);

		Assert.Equal(0xCBF43926u, crc);
	}

	[Fact]
	public void Crc32_AllZeros_CorrectCrc() {
		byte[] data = new byte[16];
		uint crc = Crc32.Calculate(data);

		// CRC32 of 16 zero bytes
		Assert.NotEqual(0u, crc); // Should not be zero for non-empty data
	}

	[Fact]
	public void Crc32_SameDataProducesSameCrc() {
		byte[] data1 = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] data2 = [0x01, 0x02, 0x03, 0x04, 0x05];

		uint crc1 = Crc32.Calculate(data1);
		uint crc2 = Crc32.Calculate(data2);

		Assert.Equal(crc1, crc2);
	}

	[Fact]
	public void Crc32_DifferentDataProducesDifferentCrc() {
		byte[] data1 = [0x01, 0x02, 0x03];
		byte[] data2 = [0x01, 0x02, 0x04];

		uint crc1 = Crc32.Calculate(data1);
		uint crc2 = Crc32.Calculate(data2);

		Assert.NotEqual(crc1, crc2);
	}

	[Fact]
	public void Crc32_Span_MatchesArray() {
		byte[] data = [0xAA, 0xBB, 0xCC, 0xDD, 0xEE];

		uint arrayCrc = Crc32.Calculate(data);
		uint spanCrc = Crc32.Calculate(data.AsSpan());

		Assert.Equal(arrayCrc, spanCrc);
	}

	#endregion

	#region CreatePatch Tests

	[Fact]
	public void CreatePatch_IdenticalFiles_MinimalPatch() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] modified = [0x01, 0x02, 0x03, 0x04, 0x05];

		var patchData = UpsPatch.CreatePatch(original, modified);

		// Patch should have header (4) + sizes (varies) + CRCs (12) at minimum
		Assert.True(patchData.Length >= 16);
		Assert.Equal((byte)'U', patchData[0]);
		Assert.Equal((byte)'P', patchData[1]);
		Assert.Equal((byte)'S', patchData[2]);
		Assert.Equal((byte)'1', patchData[3]);
	}

	[Fact]
	public void CreatePatch_SingleByteChange_CreatesPatch() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] modified = [0x01, 0x02, 0xFF, 0x04, 0x05];

		var patchData = UpsPatch.CreatePatch(original, modified);

		var (sourceSize, targetSize, records, _, _, _) = UpsPatch.ReadPatch(patchData);

		Assert.Equal(5, sourceSize);
		Assert.Equal(5, targetSize);
		Assert.Single(records);
	}

	[Fact]
	public void CreatePatch_MultipleChanges_CreatesMultipleRecords() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		byte[] modified = [0xFF, 0x02, 0x03, 0x04, 0xEE, 0x06, 0x07, 0xDD];

		var patchData = UpsPatch.CreatePatch(original, modified);

		var (_, _, records, _, _, _) = UpsPatch.ReadPatch(patchData);

		Assert.Equal(3, records.Count);
	}

	[Fact]
	public void CreatePatch_FileExpansion_Handled() {
		byte[] original = [0x01, 0x02, 0x03];
		byte[] modified = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06];

		var patchData = UpsPatch.CreatePatch(original, modified);

		var (sourceSize, targetSize, _, _, _, _) = UpsPatch.ReadPatch(patchData);

		Assert.Equal(3, sourceSize);
		Assert.Equal(6, targetSize);
	}

	[Fact]
	public void CreatePatch_FileTruncation_Handled() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06];
		byte[] modified = [0x01, 0x02, 0x03];

		var patchData = UpsPatch.CreatePatch(original, modified);

		var (sourceSize, targetSize, _, _, _, _) = UpsPatch.ReadPatch(patchData);

		Assert.Equal(6, sourceSize);
		Assert.Equal(3, targetSize);
	}

	#endregion

	#region ApplyPatch Tests

	[Fact]
	public void ApplyPatch_ValidPatch_ReturnsModifiedData() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] modified = [0x01, 0x02, 0xFF, 0x04, 0x05];

		var patchData = UpsPatch.CreatePatch(original, modified);
		var result = UpsPatch.ApplyPatch(original, patchData);

		Assert.Equal(modified, result);
	}

	[Fact]
	public void ApplyPatch_MultipleChanges_AllApplied() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		byte[] modified = [0xFF, 0x02, 0x03, 0xEE, 0x05, 0x06, 0xDD, 0x08];

		var patchData = UpsPatch.CreatePatch(original, modified);
		var result = UpsPatch.ApplyPatch(original, patchData);

		Assert.Equal(modified, result);
	}

	[Fact]
	public void ApplyPatch_FileExpansion_ExpandsCorrectly() {
		byte[] original = [0x01, 0x02, 0x03];
		byte[] modified = [0x01, 0x02, 0x03, 0xAA, 0xBB, 0xCC];

		var patchData = UpsPatch.CreatePatch(original, modified);
		var result = UpsPatch.ApplyPatch(original, patchData);

		Assert.Equal(modified, result);
	}

	[Fact]
	public void ApplyPatch_WrongSourceSize_ThrowsException() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] modified = [0x01, 0x02, 0xFF, 0x04, 0x05];
		byte[] wrongSource = [0x01, 0x02, 0x03]; // Different size

		var patchData = UpsPatch.CreatePatch(original, modified);

		Assert.Throws<InvalidDataException>(() => UpsPatch.ApplyPatch(wrongSource, patchData));
	}

	[Fact]
	public void ApplyPatch_WrongSourceCrc_ThrowsException() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] modified = [0x01, 0x02, 0xFF, 0x04, 0x05];
		byte[] wrongSource = [0xAA, 0xBB, 0xCC, 0xDD, 0xEE]; // Same size, different content

		var patchData = UpsPatch.CreatePatch(original, modified);

		Assert.Throws<InvalidDataException>(() => UpsPatch.ApplyPatch(wrongSource, patchData));
	}

	[Fact]
	public void ApplyPatch_RoundTrip_PreservesData() {
		byte[] original = Enumerable.Range(0, 256).Select(i => (byte)i).ToArray();
		byte[] modified = original.ToArray();

		// Make random changes
		modified[10] = 0xFF;
		modified[50] = 0xAA;
		modified[100] = 0xBB;
		modified[200] = 0xCC;

		var patchData = UpsPatch.CreatePatch(original, modified);
		var result = UpsPatch.ApplyPatch(original, patchData);

		Assert.Equal(modified, result);
	}

	#endregion

	#region ReadPatch Tests

	[Fact]
	public void ReadPatch_InvalidHeader_ThrowsException() {
		byte[] invalidPatch = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

		Assert.Throws<InvalidDataException>(() => UpsPatch.ReadPatch(invalidPatch));
	}

	[Fact]
	public void ReadPatch_TooSmall_ThrowsException() {
		byte[] tinyPatch = [0x55, 0x50, 0x53]; // "UPS" only

		Assert.Throws<InvalidDataException>(() => UpsPatch.ReadPatch(tinyPatch));
	}

	[Fact]
	public void ReadPatch_ValidPatch_ParsesCorrectly() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] modified = [0x01, 0x02, 0xFF, 0x04, 0x05];

		var patchData = UpsPatch.CreatePatch(original, modified);
		var (sourceSize, targetSize, records, sourceCrc, targetCrc, patchCrc) = UpsPatch.ReadPatch(patchData);

		Assert.Equal(5, sourceSize);
		Assert.Equal(5, targetSize);
		Assert.Single(records);
		Assert.Equal(Crc32.Calculate(original), sourceCrc);
		Assert.Equal(Crc32.Calculate(modified), targetCrc);
	}

	#endregion

	#region GetPatchInfo Tests

	[Fact]
	public void GetPatchInfo_ValidPatch_ReturnsInfoString() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05];
		byte[] modified = [0x01, 0x02, 0xFF, 0x04, 0x05];

		var patchData = UpsPatch.CreatePatch(original, modified);
		string info = UpsPatch.GetPatchInfo(patchData);

		Assert.Contains("UPS Patch:", info);
		Assert.Contains("Source size:", info);
		Assert.Contains("Target size:", info);
		Assert.Contains("5 bytes", info);
	}

	[Fact]
	public void GetPatchInfo_MultipleRecords_ListsAll() {
		byte[] original = [0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];
		byte[] modified = [0xFF, 0x02, 0x03, 0x04, 0xEE, 0x06, 0x07, 0x08];

		var patchData = UpsPatch.CreatePatch(original, modified);
		string info = UpsPatch.GetPatchInfo(patchData);

		Assert.Contains("2 records", info);
	}

	#endregion

	#region WritePatch Tests

	[Fact]
	public void WritePatch_EmptyRecords_WritesValidPatch() {
		var records = new List<UpsPatch.UpsRecord>();
		var patchData = UpsPatch.WritePatch(100, 100, records, 0x12345678, 0x12345678);

		// Should have valid header
		Assert.Equal((byte)'U', patchData[0]);
		Assert.Equal((byte)'P', patchData[1]);
		Assert.Equal((byte)'S', patchData[2]);
		Assert.Equal((byte)'1', patchData[3]);
	}

	[Fact]
	public void WritePatch_WithRecords_Readable() {
		var records = new List<UpsPatch.UpsRecord> {
			new(5, [0xAA, 0xBB]),
			new(10, [0xCC])
		};

		var patchData = UpsPatch.WritePatch(50, 50, records, 0x11111111, 0x22222222);
		var (_, _, readRecords, _, _, _) = UpsPatch.ReadPatch(patchData);

		Assert.Equal(2, readRecords.Count);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void CreateAndApply_LargeFile_Works() {
		byte[] original = new byte[10000];
		byte[] modified = new byte[10000];

		// Fill with different patterns
		for (int i = 0; i < original.Length; i++) {
			original[i] = (byte)(i & 0xFF);
		}

		Array.Copy(original, modified, original.Length);

		// Make scattered changes
		for (int i = 0; i < 100; i++) {
			modified[i * 100] = 0xFF;
		}

		var patchData = UpsPatch.CreatePatch(original, modified);
		var result = UpsPatch.ApplyPatch(original, patchData);

		Assert.Equal(modified, result);
	}

	[Fact]
	public void CreateAndApply_AllBytesChanged_Works() {
		byte[] original = [0x00, 0x00, 0x00, 0x00, 0x00];
		byte[] modified = [0xFF, 0xFF, 0xFF, 0xFF, 0xFF];

		var patchData = UpsPatch.CreatePatch(original, modified);
		var result = UpsPatch.ApplyPatch(original, patchData);

		Assert.Equal(modified, result);
	}

	[Fact]
	public void CreateAndApply_XorWithZero_HandledCorrectly() {
		// When original byte is same as modified, XOR is 0
		// UPS uses 0 as terminator, so we need to handle this edge case
		byte[] original = [0x00, 0x01, 0x02, 0x03, 0x04];
		byte[] modified = [0xFF, 0x01, 0x02, 0x03, 0x04]; // Only first byte changes

		var patchData = UpsPatch.CreatePatch(original, modified);
		var result = UpsPatch.ApplyPatch(original, patchData);

		Assert.Equal(modified, result);
	}

	#endregion
}
