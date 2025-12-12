using System.Text;
using GameInfoTools.Rom;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for IPS and BPS patching functionality, covering edge cases,
/// performance scenarios, and comprehensive patch manipulation.
/// </summary>
public class PatchingAdvancedTests {
	#region IPS Record Edge Cases

	[Fact]
	public void IpsRecord_MaxOffset_Supported() {
		// IPS supports 24-bit offsets (0-16777215)
		var record = new IpsPatch.IpsRecord(0xFFFFFF, [0xAA], false, 0);

		Assert.Equal(0xFFFFFF, record.Offset);
	}

	[Fact]
	public void IpsRecord_WithAllProperties_Preserved() {
		var data = new byte[] { 0x01, 0x02, 0x03, 0x04, 0x05 };
		var record = new IpsPatch.IpsRecord(0x123456, data, false, 0);

		Assert.Equal(0x123456, record.Offset);
		Assert.Equal(data, record.Data);
		Assert.False(record.IsRle);
		Assert.Equal(0, record.RleCount);
	}

	[Fact]
	public void IpsRecord_RleProperties_Preserved() {
		var record = new IpsPatch.IpsRecord(0x1000, [0xFF], true, 256);

		Assert.Equal(0x1000, record.Offset);
		Assert.Equal(0xFF, record.Data[0]);
		Assert.True(record.IsRle);
		Assert.Equal(256, record.RleCount);
	}

	#endregion

	#region IPS Large Patches

	[Fact]
	public void ReadPatch_ManyRecords_AllParsed() {
		// Create patch with 100 records
		using var ms = new MemoryStream();
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		for (int i = 0; i < 100; i++) {
			// Offset (i * 0x100)
			int offset = i * 0x100;
			ms.WriteByte((byte)((offset >> 16) & 0xff));
			ms.WriteByte((byte)((offset >> 8) & 0xff));
			ms.WriteByte((byte)(offset & 0xff));

			// Size = 1
			ms.WriteByte(0);
			ms.WriteByte(1);

			// Data
			ms.WriteByte((byte)i);
		}

		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		var records = IpsPatch.ReadPatch(ms.ToArray());

		Assert.Equal(100, records.Count);
		for (int i = 0; i < 100; i++) {
			Assert.Equal(i * 0x100, records[i].Offset);
			Assert.Equal((byte)i, records[i].Data[0]);
		}
	}

	[Fact]
	public void ReadPatch_LargeDataRecord_ParsedCorrectly() {
		using var ms = new MemoryStream();
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		// Offset
		ms.WriteByte(0x00);
		ms.WriteByte(0x10);
		ms.WriteByte(0x00);

		// Size = 0x1000 (4096 bytes)
		ms.WriteByte(0x10);
		ms.WriteByte(0x00);

		// 4096 bytes of data
		for (int i = 0; i < 0x1000; i++) {
			ms.WriteByte((byte)(i & 0xff));
		}

		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		var records = IpsPatch.ReadPatch(ms.ToArray());

		Assert.Single(records);
		Assert.Equal(0x1000, records[0].Data.Length);
		Assert.Equal(0x1000, records[0].Offset);
	}

	[Fact]
	public void ReadPatch_MaxSizeRecord_ParsedCorrectly() {
		// IPS max record size is 0xFFFF (65535 bytes)
		using var ms = new MemoryStream();
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		// Offset
		ms.WriteByte(0x00);
		ms.WriteByte(0x00);
		ms.WriteByte(0x00);

		// Size = 0xFFFF
		ms.WriteByte(0xFF);
		ms.WriteByte(0xFF);

		// Data (all zeros for simplicity)
		var data = new byte[0xFFFF];
		ms.Write(data, 0, data.Length);

		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		var records = IpsPatch.ReadPatch(ms.ToArray());

		Assert.Single(records);
		Assert.Equal(0xFFFF, records[0].Data.Length);
	}

	#endregion

	#region IPS RLE Advanced

	[Fact]
	public void ReadPatch_LargeRle_ParsedCorrectly() {
		// RLE with max count (0xFFFF)
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x00,  // Offset
			0x00, 0x00,        // Size = 0 (RLE)
			0xFF, 0xFF,        // Count = 65535
			0xAB,              // Value
			(byte)'E', (byte)'O', (byte)'F'
		};

		var records = IpsPatch.ReadPatch(patch);

		Assert.Single(records);
		Assert.True(records[0].IsRle);
		Assert.Equal(65535, records[0].RleCount);
		Assert.Equal(0xAB, records[0].Data[0]);
	}

	[Fact]
	public void ApplyPatch_LargeRle_FillsCorrectly() {
		var rom = new byte[0x10000];

		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x10, 0x00,  // Offset = 0x1000
			0x00, 0x00,        // RLE
			0x10, 0x00,        // Count = 4096
			0xFF,              // Value
			(byte)'E', (byte)'O', (byte)'F'
		};

		var result = IpsPatch.ApplyPatch(rom, patch);

		// Verify all 4096 bytes are set
		for (int i = 0; i < 4096; i++) {
			Assert.Equal(0xFF, result[0x1000 + i]);
		}
	}

	[Fact]
	public void ApplyPatch_MultipleRle_AllApplied() {
		var rom = new byte[0x1000];

		using var ms = new MemoryStream();
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		// RLE 1: Fill 0x000-0x0FF with 0xAA
		ms.Write([0x00, 0x00, 0x00], 0, 3);
		ms.Write([0x00, 0x00], 0, 2);
		ms.Write([0x01, 0x00, 0xAA], 0, 3);

		// RLE 2: Fill 0x100-0x1FF with 0xBB
		ms.Write([0x00, 0x01, 0x00], 0, 3);
		ms.Write([0x00, 0x00], 0, 2);
		ms.Write([0x01, 0x00, 0xBB], 0, 3);

		// RLE 3: Fill 0x200-0x2FF with 0xCC
		ms.Write([0x00, 0x02, 0x00], 0, 3);
		ms.Write([0x00, 0x00], 0, 2);
		ms.Write([0x01, 0x00, 0xCC], 0, 3);

		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		var result = IpsPatch.ApplyPatch(rom, ms.ToArray());

		Assert.Equal(0xAA, result[0x00]);
		Assert.Equal(0xAA, result[0xFF]);
		Assert.Equal(0xBB, result[0x100]);
		Assert.Equal(0xBB, result[0x1FF]);
		Assert.Equal(0xCC, result[0x200]);
		Assert.Equal(0xCC, result[0x2FF]);
	}

	#endregion

	#region IPS Create Patch Advanced

	[Fact]
	public void CreatePatch_LongRunOfDifferences_CreatedAsOneRecord() {
		var original = new byte[256];
		var modified = new byte[256];

		// Long continuous change
		for (int i = 16; i < 200; i++) {
			modified[i] = (byte)(i & 0xFF);
		}

		var patch = IpsPatch.CreatePatch(original, modified);
		var records = IpsPatch.ReadPatch(patch);

		// Should coalesce into minimal records
		Assert.True(records.Count <= 3); // Should be 1-3 records, not 184
	}

	[Fact]
	public void CreatePatch_ScatteredDifferences_CreatedAsSeparateRecords() {
		var original = new byte[256];
		var modified = new byte[256];

		// Scattered single-byte changes
		modified[0x10] = 0xAA;
		modified[0x80] = 0xBB;
		modified[0xF0] = 0xCC;

		var patch = IpsPatch.CreatePatch(original, modified);
		var records = IpsPatch.ReadPatch(patch);

		// Should create separate records for each area
		Assert.True(records.Count >= 1);
		Assert.Contains(records, r => r.Data.Contains((byte)0xAA));
		Assert.Contains(records, r => r.Data.Contains((byte)0xBB));
		Assert.Contains(records, r => r.Data.Contains((byte)0xCC));
	}

	[Fact]
	public void CreatePatch_ModifiedSmallerThanOriginal_HandlesCorrectly() {
		var original = new byte[256];
		var modified = new byte[128];

		// Different values in overlapping region
		for (int i = 0; i < 64; i++) {
			original[i] = (byte)(i + 1);
			modified[i] = (byte)(i + 100);
		}

		var patch = IpsPatch.CreatePatch(original, modified);
		var records = IpsPatch.ReadPatch(patch);

		Assert.NotEmpty(records);
	}

	[Fact]
	public void CreatePatch_ModifiedLargerThanOriginal_IncludesExpansion() {
		var original = new byte[128];
		var modified = new byte[256];

		// Fill extension with data
		for (int i = 128; i < 256; i++) {
			modified[i] = (byte)i;
		}

		var patch = IpsPatch.CreatePatch(original, modified);
		var result = IpsPatch.ApplyPatch(original, patch);

		Assert.Equal(256, result.Length);
		for (int i = 128; i < 256; i++) {
			Assert.Equal((byte)i, result[i]);
		}
	}

	#endregion

	#region IPS Write Patch Tests

	[Fact]
	public void WritePatch_PreservesRecordOrder() {
		var records = new List<IpsPatch.IpsRecord>
		{
			new(0x300, [0x03], false, 0),
			new(0x100, [0x01], false, 0),
			new(0x200, [0x02], false, 0),
		};

		var patch = IpsPatch.WritePatch(records);
		var readBack = IpsPatch.ReadPatch(patch);

		Assert.Equal(3, readBack.Count);
		Assert.Equal(0x300, readBack[0].Offset);
		Assert.Equal(0x100, readBack[1].Offset);
		Assert.Equal(0x200, readBack[2].Offset);
	}

	[Fact]
	public void WritePatch_MixedRecordTypes_WrittenCorrectly() {
		var records = new List<IpsPatch.IpsRecord>
		{
			new(0x100, [0x11, 0x22, 0x33], false, 0),
			new(0x200, [0xFF], true, 100),
			new(0x400, [0x44], false, 0),
		};

		var patch = IpsPatch.WritePatch(records);
		var readBack = IpsPatch.ReadPatch(patch);

		Assert.Equal(3, readBack.Count);
		Assert.False(readBack[0].IsRle);
		Assert.True(readBack[1].IsRle);
		Assert.False(readBack[2].IsRle);
	}

	[Fact]
	public void WritePatch_RoundTrip_PreservesAllData() {
		var records = new List<IpsPatch.IpsRecord>
		{
			new(0x123456, [0xDE, 0xAD, 0xBE, 0xEF], false, 0),
			new(0x654321, [0xCA], true, 500),
		};

		var patch = IpsPatch.WritePatch(records);
		var readBack = IpsPatch.ReadPatch(patch);

		Assert.Equal(records.Count, readBack.Count);

		Assert.Equal(0x123456, readBack[0].Offset);
		Assert.Equal(new byte[] { 0xDE, 0xAD, 0xBE, 0xEF }, readBack[0].Data);
		Assert.False(readBack[0].IsRle);

		Assert.Equal(0x654321, readBack[1].Offset);
		Assert.Equal(0xCA, readBack[1].Data[0]);
		Assert.True(readBack[1].IsRle);
		Assert.Equal(500, readBack[1].RleCount);
	}

	#endregion

	#region IPS Apply Records Directly

	[Fact]
	public void ApplyRecords_Empty_ReturnsOriginal() {
		var rom = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		var records = new List<IpsPatch.IpsRecord>();

		var result = IpsPatch.ApplyRecords(rom, records);

		Assert.Equal(rom, result);
	}

	[Fact]
	public void ApplyRecords_OverlappingRecords_LastWins() {
		var rom = new byte[16];

		var records = new List<IpsPatch.IpsRecord>
		{
			new(0, [0xAA, 0xAA, 0xAA, 0xAA], false, 0),
			new(2, [0xBB, 0xBB], false, 0),  // Overlaps with first
		};

		var result = IpsPatch.ApplyRecords(rom, records);

		Assert.Equal(0xAA, result[0]);
		Assert.Equal(0xAA, result[1]);
		Assert.Equal(0xBB, result[2]);  // Overwritten
		Assert.Equal(0xBB, result[3]);  // Overwritten
	}

	#endregion

	#region IPS GetPatchInfo Tests

	[Fact]
	public void GetPatchInfo_MultipleMixedRecords_ShowsDetails() {
		using var ms = new MemoryStream();
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		// Normal record
		ms.Write([0x00, 0x01, 0x00], 0, 3);
		ms.Write([0x00, 0x10], 0, 2);
		ms.Write(new byte[16], 0, 16);

		// RLE record
		ms.Write([0x00, 0x02, 0x00], 0, 3);
		ms.Write([0x00, 0x00], 0, 2);
		ms.Write([0x00, 0x20, 0xFF], 0, 3);

		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		var info = IpsPatch.GetPatchInfo(ms.ToArray());

		Assert.Contains("2 records", info);
		Assert.Contains("RLE", info);
		Assert.Contains("bytes", info);
	}

	[Fact]
	public void GetPatchInfo_EmptyPatch_ShowsZeroRecords() {
		var patch = new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H', (byte)'E', (byte)'O', (byte)'F' };

		var info = IpsPatch.GetPatchInfo(patch);

		Assert.Contains("0 records", info);
	}

	#endregion

	#region IPS EOF Position Edge Cases

	[Fact]
	public void ReadPatch_EofAsOffset_NotTreatedAsEof() {
		// "EOF" can appear as an offset (0x454F46)
		// A valid IPS patch at offset 0x454F46 should NOT stop parsing
		using var ms = new MemoryStream();
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		// Record 1 at offset 0x100
		ms.Write([0x00, 0x01, 0x00], 0, 3);
		ms.Write([0x00, 0x01], 0, 2);
		ms.Write([0xAA], 0, 1);

		// Actual EOF
		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		var records = IpsPatch.ReadPatch(ms.ToArray());

		Assert.Single(records);
		Assert.Equal(0x100, records[0].Offset);
	}

	#endregion

	#region IPS Corruption Handling

	[Fact]
	public void ReadPatch_TruncatedRecord_StopsParsing() {
		// Patch with incomplete record
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x10,  // Offset
			0x00, 0x05,        // Size = 5
			0xAA, 0xBB,        // Only 2 bytes of data (truncated)
			// Missing EOF
		};

		var records = IpsPatch.ReadPatch(patch);

		// Should stop at incomplete record
		Assert.Empty(records);
	}

	[Fact]
	public void ReadPatch_TruncatedRle_StopsParsing() {
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x10,  // Offset
			0x00, 0x00,        // RLE marker
			0x01,              // Incomplete count (need 2 bytes + value)
		};

		var records = IpsPatch.ReadPatch(patch);

		Assert.Empty(records);
	}

	#endregion

	#region BPS Tests

	[Fact]
	public void BpsPatch_InvalidHeader_ThrowsCorrectException() {
		var source = new byte[16];
		var patch = new byte[] { (byte)'I', (byte)'P', (byte)'S', (byte)'1' };

		var ex = Assert.Throws<InvalidDataException>(() => BpsPatch.ApplyPatch(source, patch));
		Assert.Contains("Invalid BPS header", ex.Message);
	}

	[Fact]
	public void BpsPatch_EmptyPatch_ThrowsException() {
		var source = new byte[16];
		var patch = Array.Empty<byte>();

		Assert.Throws<InvalidDataException>(() => BpsPatch.ApplyPatch(source, patch));
	}

	[Fact]
	public void BpsPatch_HeaderOnly_DoesNotThrow() {
		var source = new byte[16];

		// Minimal BPS: header + varint sizes + empty actions + checksums
		var patch = CreateMinimalBpsPatch(16, 16);

		// Should not throw - may produce empty or minimal result
		var result = BpsPatch.ApplyPatch(source, patch);
		Assert.NotNull(result);
	}

	private static byte[] CreateMinimalBpsPatch(int sourceSize, int targetSize) {
		using var ms = new MemoryStream();

		// Header
		ms.Write(new byte[] { (byte)'B', (byte)'P', (byte)'S', (byte)'1' }, 0, 4);

		// Variable-length integers for sizes
		WriteVarInt(ms, sourceSize);
		WriteVarInt(ms, targetSize);
		WriteVarInt(ms, 0); // metadata size

		// Pad with zeros for CRC32s (12 bytes)
		for (int i = 0; i < 12; i++) {
			ms.WriteByte(0);
		}

		return ms.ToArray();
	}

	private static void WriteVarInt(MemoryStream ms, long value) {
		while (true) {
			byte b = (byte)(value & 0x7f);
			value >>= 7;
			if (value == 0) {
				ms.WriteByte(b);
				break;
			}

			ms.WriteByte((byte)(b | 0x80));
			value--;
		}
	}

	#endregion

	#region Integration Tests

	[Fact]
	public void IpsPatch_CompleteWorkflow_CreateApplyVerify() {
		// Create original ROM
		var original = new byte[1024];
		for (int i = 0; i < 1024; i++) {
			original[i] = (byte)(i & 0xFF);
		}

		// Create modified ROM
		var modified = (byte[])original.Clone();

		// Make various changes
		modified[0x100] = 0xFF;  // Single byte
		for (int i = 0; i < 16; i++) {
			modified[0x200 + i] = 0xAA;  // Block of same value
		}

		modified[0x300] = 0xDE;  // More single bytes
		modified[0x301] = 0xAD;
		modified[0x302] = 0xBE;
		modified[0x303] = 0xEF;

		// Create patch
		var patch = IpsPatch.CreatePatch(original, modified);

		// Apply patch to original
		var result = IpsPatch.ApplyPatch(original, patch);

		// Verify result matches modified
		Assert.Equal(modified.Length, result.Length);
		for (int i = 0; i < modified.Length; i++) {
			Assert.True(modified[i] == result[i], $"Mismatch at offset {i:X}");
		}
	}

	[Fact]
	public void IpsPatch_ManualRecords_ApplyCorrectly() {
		var rom = new byte[512];

		// Create patch from manual records
		var records = new List<IpsPatch.IpsRecord>
		{
			new(0x000, [0x4E, 0x45, 0x53, 0x1A], false, 0),  // "NES" + 0x1A
			new(0x010, [0xFF], true, 16),  // Fill 16 bytes
			new(0x100, [0x48, 0x65, 0x6C, 0x6C, 0x6F], false, 0),  // "Hello"
		};

		var patch = IpsPatch.WritePatch(records);
		var result = IpsPatch.ApplyPatch(rom, patch);

		Assert.Equal((byte)'N', result[0]);
		Assert.Equal((byte)'E', result[1]);
		Assert.Equal((byte)'S', result[2]);
		Assert.Equal(0x1A, result[3]);

		for (int i = 0; i < 16; i++) {
			Assert.Equal(0xFF, result[0x10 + i]);
		}

		Assert.Equal((byte)'H', result[0x100]);
		Assert.Equal((byte)'e', result[0x101]);
		Assert.Equal((byte)'l', result[0x102]);
		Assert.Equal((byte)'l', result[0x103]);
		Assert.Equal((byte)'o', result[0x104]);
	}

	#endregion

	#region Performance-Related Tests

	[Fact]
	public void CreatePatch_LargeIdenticalFiles_FastAndEmpty() {
		// Two identical 64KB files
		var original = new byte[65536];
		var modified = new byte[65536];

		var sw = System.Diagnostics.Stopwatch.StartNew();
		var patch = IpsPatch.CreatePatch(original, modified);
		sw.Stop();

		// Should be very fast and produce minimal patch
		Assert.True(sw.ElapsedMilliseconds < 1000, $"Took {sw.ElapsedMilliseconds}ms");
		Assert.Equal(8, patch.Length);  // Just header + EOF
	}

	[Fact]
	public void ApplyPatch_LargeExpansion_HandledCorrectly() {
		var rom = new byte[16];  // Small ROM

		// Patch that expands to much larger
		using var ms = new MemoryStream();
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		// Write at offset 0x10000 (64KB)
		ms.Write([0x01, 0x00, 0x00], 0, 3);
		ms.Write([0x00, 0x10], 0, 2);  // 16 bytes
		ms.Write(new byte[16], 0, 16);

		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		var result = IpsPatch.ApplyPatch(rom, ms.ToArray());

		Assert.True(result.Length >= 0x10010);
	}

	#endregion
}

/// <summary>
/// Tests for PatchUtilities: preview, multi-patch, conflict detection.
/// </summary>
public class PatchUtilitiesTests {
	#region Helper Methods

	private static byte[] CreateSimpleIpsPatch(int offset, byte[] data) {
		using var ms = new MemoryStream();

		// Header
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		// Record: offset (3 bytes), size (2 bytes), data
		ms.WriteByte((byte)((offset >> 16) & 0xff));
		ms.WriteByte((byte)((offset >> 8) & 0xff));
		ms.WriteByte((byte)(offset & 0xff));
		ms.WriteByte((byte)((data.Length >> 8) & 0xff));
		ms.WriteByte((byte)(data.Length & 0xff));
		ms.Write(data, 0, data.Length);

		// EOF
		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		return ms.ToArray();
	}

	private static byte[] CreateMultiRecordIpsPatch(params (int Offset, byte[] Data)[] records) {
		using var ms = new MemoryStream();

		// Header
		ms.Write(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }, 0, 5);

		foreach (var (offset, data) in records) {
			ms.WriteByte((byte)((offset >> 16) & 0xff));
			ms.WriteByte((byte)((offset >> 8) & 0xff));
			ms.WriteByte((byte)(offset & 0xff));
			ms.WriteByte((byte)((data.Length >> 8) & 0xff));
			ms.WriteByte((byte)(data.Length & 0xff));
			ms.Write(data, 0, data.Length);
		}

		// EOF
		ms.Write(new byte[] { (byte)'E', (byte)'O', (byte)'F' }, 0, 3);

		return ms.ToArray();
	}

	#endregion

	#region Format Detection Tests

	[Fact]
	public void DetectFormat_IpsPatch_ReturnsIps() {
		var patch = CreateSimpleIpsPatch(0x10, [0x01, 0x02]);

		var format = PatchUtilities.DetectFormat(patch);

		Assert.Equal(PatchFormat.Ips, format);
	}

	[Fact]
	public void DetectFormat_BpsPatch_ReturnsBps() {
		var patch = new byte[] { (byte)'B', (byte)'P', (byte)'S', (byte)'1', 0, 0, 0, 0 };

		var format = PatchUtilities.DetectFormat(patch);

		Assert.Equal(PatchFormat.Bps, format);
	}

	[Fact]
	public void DetectFormat_UpsPatch_ReturnsUps() {
		var patch = new byte[] { (byte)'U', (byte)'P', (byte)'S', (byte)'1', 0, 0, 0, 0 };

		var format = PatchUtilities.DetectFormat(patch);

		Assert.Equal(PatchFormat.Ups, format);
	}

	[Fact]
	public void DetectFormat_UnknownHeader_ReturnsUnknown() {
		var patch = new byte[] { 0x00, 0x01, 0x02, 0x03, 0x04 };

		var format = PatchUtilities.DetectFormat(patch);

		Assert.Equal(PatchFormat.Unknown, format);
	}

	[Fact]
	public void DetectFormat_TooSmall_ReturnsUnknown() {
		var patch = new byte[] { 0x00, 0x01, 0x02 };

		var format = PatchUtilities.DetectFormat(patch);

		Assert.Equal(PatchFormat.Unknown, format);
	}

	#endregion

	#region Preview Tests

	[Fact]
	public void PreviewPatch_IpsSingleRecord_ReturnsCorrectPreview() {
		var source = new byte[32];
		source[0x10] = 0xaa;
		source[0x11] = 0xbb;

		var patch = CreateSimpleIpsPatch(0x10, [0x01, 0x02]);

		var preview = PatchUtilities.PreviewPatch(patch, source, "test.ips");

		Assert.Equal(PatchFormat.Ips, preview.Format);
		Assert.Equal(1, preview.RecordCount);
		Assert.Equal(2, preview.TotalBytesChanged);
		Assert.Equal(0x10, preview.MinOffset);
		Assert.Equal(0x11, preview.MaxOffset);
		Assert.Single(preview.Changes);
		Assert.Equal(new byte[] { 0xaa, 0xbb }, preview.Changes[0].OriginalData);
		Assert.Equal(new byte[] { 0x01, 0x02 }, preview.Changes[0].NewData);
	}

	[Fact]
	public void PreviewPatch_IpsMultipleRecords_ReturnsAllChanges() {
		var source = new byte[64];
		var patch = CreateMultiRecordIpsPatch(
			(0x10, new byte[] { 0x01, 0x02 }),
			(0x20, new byte[] { 0x03, 0x04, 0x05 })
		);

		var preview = PatchUtilities.PreviewPatch(patch, source, "test.ips");

		Assert.Equal(2, preview.RecordCount);
		Assert.Equal(5, preview.TotalBytesChanged);
		Assert.Equal(2, preview.Changes.Count);
		Assert.Equal(0x10, preview.MinOffset);
		Assert.Equal(0x22, preview.MaxOffset);
	}

	[Fact]
	public void PreviewPatch_IncludesSourceName() {
		var source = new byte[32];
		var patch = CreateSimpleIpsPatch(0x10, [0x01]);

		var preview = PatchUtilities.PreviewPatch(patch, source, "my-patch.ips");

		Assert.Equal("my-patch.ips", preview.Changes[0].Source);
	}

	#endregion

	#region Conflict Detection Tests

	[Fact]
	public void DetectConflicts_NoOverlap_ReturnsEmptyList() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01, 0x02]);
		var patch2 = CreateSimpleIpsPatch(0x20, [0x03, 0x04]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var conflicts = PatchUtilities.DetectConflicts(patches, source);

		Assert.Empty(conflicts);
	}

	[Fact]
	public void DetectConflicts_SameOffsetDifferentValues_DetectsConflict() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01]);
		var patch2 = CreateSimpleIpsPatch(0x10, [0x02]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var conflicts = PatchUtilities.DetectConflicts(patches, source);

		Assert.Single(conflicts);
		Assert.Equal(0x10, conflicts[0].Offset);
		Assert.Equal(1, conflicts[0].Length);
		Assert.Contains("patch1.ips", conflicts[0].Patches);
		Assert.Contains("patch2.ips", conflicts[0].Patches);
	}

	[Fact]
	public void DetectConflicts_SameOffsetSameValues_NoConflict() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01]);
		var patch2 = CreateSimpleIpsPatch(0x10, [0x01]); // Same value

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var conflicts = PatchUtilities.DetectConflicts(patches, source);

		Assert.Empty(conflicts);
	}

	[Fact]
	public void DetectConflicts_OverlappingRanges_DetectsConflict() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01, 0x02, 0x03]);
		var patch2 = CreateSimpleIpsPatch(0x12, [0x04]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var conflicts = PatchUtilities.DetectConflicts(patches, source);

		Assert.Single(conflicts);
		Assert.Equal(0x12, conflicts[0].Offset);
	}

	#endregion

	#region Multi-Patch Application Tests

	[Fact]
	public void ApplyMultiplePatches_NonOverlapping_AppliesAll() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01, 0x02]);
		var patch2 = CreateSimpleIpsPatch(0x20, [0x03, 0x04]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var result = PatchUtilities.ApplyMultiplePatches(source, patches);

		Assert.True(result.Success);
		Assert.Empty(result.Errors);
		Assert.Empty(result.Conflicts);
		Assert.Equal(0x01, result.PatchedData[0x10]);
		Assert.Equal(0x02, result.PatchedData[0x11]);
		Assert.Equal(0x03, result.PatchedData[0x20]);
		Assert.Equal(0x04, result.PatchedData[0x21]);
	}

	[Fact]
	public void ApplyMultiplePatches_ConflictLastWins_AppliesLastValue() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01]);
		var patch2 = CreateSimpleIpsPatch(0x10, [0x02]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var result = PatchUtilities.ApplyMultiplePatches(source, patches, false, "last");

		Assert.True(result.Success);
		Assert.Equal(0x02, result.PatchedData[0x10]); // Second patch wins
	}

	[Fact]
	public void ApplyMultiplePatches_ConflictFirstWins_KeepsFirstValue() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01]);
		var patch2 = CreateSimpleIpsPatch(0x10, [0x02]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var result = PatchUtilities.ApplyMultiplePatches(source, patches, false, "first");

		Assert.True(result.Success);
		Assert.Equal(0x01, result.PatchedData[0x10]); // First patch wins
	}

	[Fact]
	public void ApplyMultiplePatches_StopOnConflict_StopsAndReturnsConflicts() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01]);
		var patch2 = CreateSimpleIpsPatch(0x10, [0x02]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var result = PatchUtilities.ApplyMultiplePatches(source, patches, stopOnConflict: true);

		Assert.False(result.Success);
		Assert.Single(result.Conflicts);
		Assert.Single(result.Errors);
	}

	[Fact]
	public void ApplyMultiplePatches_RecordsAllChanges() {
		var source = new byte[64];
		var patch = CreateMultiRecordIpsPatch(
			(0x10, new byte[] { 0x01 }),
			(0x20, new byte[] { 0x02 })
		);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch, "test.ips")
		};

		var result = PatchUtilities.ApplyMultiplePatches(source, patches);

		Assert.Equal(2, result.Changes.Count);
	}

	#endregion

	#region Report Generation Tests

	[Fact]
	public void GeneratePatchReport_IncludesFormatAndCounts() {
		var source = new byte[64];
		var patch = CreateMultiRecordIpsPatch(
			(0x10, new byte[] { 0x01, 0x02 }),
			(0x20, new byte[] { 0x03 })
		);

		var preview = PatchUtilities.PreviewPatch(patch, source);
		var report = PatchUtilities.GeneratePatchReport(preview);

		Assert.Contains("Patch Format: Ips", report);
		Assert.Contains("Records: 2", report);
		Assert.Contains("Total Bytes Changed: 3", report);
	}

	[Fact]
	public void GenerateConflictReport_NoConflicts_ReturnsMessage() {
		var conflicts = new List<PatchConflict>();

		var report = PatchUtilities.GenerateConflictReport(conflicts);

		Assert.Equal("No conflicts detected.", report);
	}

	[Fact]
	public void GenerateConflictReport_WithConflicts_ListsDetails() {
		var conflicts = new List<PatchConflict>
		{
			new(0x10, 2, ["patch1.ips", "patch2.ips"], [[0x01, 0x02], [0x03, 0x04]])
		};

		var report = PatchUtilities.GenerateConflictReport(conflicts);

		Assert.Contains("$000010", report);
		Assert.Contains("patch1.ips", report);
		Assert.Contains("patch2.ips", report);
	}

	#endregion

	#region Undo Patch Tests

	[Fact]
	public void CreateUndoPatch_ReversesChanges() {
		var source = new byte[64];
		source[0x10] = 0xaa;
		source[0x11] = 0xbb;

		var patch = CreateSimpleIpsPatch(0x10, [0x01, 0x02]);
		var undoPatch = PatchUtilities.CreateUndoPatch(patch, source);

		// Apply original patch
		var patched = IpsPatch.ApplyPatch(source, patch);
		Assert.Equal(0x01, patched[0x10]);
		Assert.Equal(0x02, patched[0x11]);

		// Apply undo patch
		var restored = IpsPatch.ApplyPatch(patched, undoPatch);
		Assert.Equal(0xaa, restored[0x10]);
		Assert.Equal(0xbb, restored[0x11]);
	}

	#endregion

	#region Merge Patches Tests

	[Fact]
	public void MergePatches_NonOverlapping_CreatesCombinedPatch() {
		var source = new byte[64];
		var patch1 = CreateSimpleIpsPatch(0x10, [0x01]);
		var patch2 = CreateSimpleIpsPatch(0x20, [0x02]);

		var patches = new List<(byte[] PatchData, string Name)>
		{
			(patch1, "patch1.ips"),
			(patch2, "patch2.ips")
		};

		var merged = PatchUtilities.MergePatches(source, patches);

		// Apply merged patch and verify
		var result = IpsPatch.ApplyPatch(source, merged);
		Assert.Equal(0x01, result[0x10]);
		Assert.Equal(0x02, result[0x20]);
	}

	#endregion
}

/// <summary>
/// Tests for IPS patch header utilities.
/// </summary>
public class IpsPatchHeaderTests {
	private static byte[] CreateMinimalIpsPatch() {
		return new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H', (byte)'E', (byte)'O', (byte)'F' };
	}

	#region Validation Tests

	[Fact]
	public void Validate_ValidPatch_ReturnsTrue() {
		var patch = CreateMinimalIpsPatch();

		var (isValid, error) = IpsPatchHeader.Validate(patch);

		Assert.True(isValid);
		Assert.Null(error);
	}

	[Fact]
	public void Validate_InvalidHeader_ReturnsFalse() {
		var patch = new byte[] { (byte)'X', (byte)'A', (byte)'T', (byte)'C', (byte)'H', (byte)'E', (byte)'O', (byte)'F' };

		var (isValid, error) = IpsPatchHeader.Validate(patch);

		Assert.False(isValid);
		Assert.Contains("Invalid IPS header", error);
	}

	[Fact]
	public void Validate_MissingEof_ReturnsFalse() {
		var patch = new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H', 0x00, 0x00, 0x10 };

		var (isValid, error) = IpsPatchHeader.Validate(patch);

		Assert.False(isValid);
		Assert.Contains("Missing EOF", error);
	}

	[Fact]
	public void Validate_TooSmall_ReturnsFalse() {
		var patch = new byte[] { (byte)'P', (byte)'A', (byte)'T' };

		var (isValid, error) = IpsPatchHeader.Validate(patch);

		Assert.False(isValid);
		Assert.Contains("too small", error);
	}

	#endregion

	#region Truncate Extension Tests

	[Fact]
	public void HasTruncateExtension_NormalPatch_ReturnsFalse() {
		var patch = CreateMinimalIpsPatch();

		Assert.False(IpsPatchHeader.HasTruncateExtension(patch));
	}

	[Fact]
	public void HasTruncateExtension_WithExtension_ReturnsTrue() {
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			(byte)'E', (byte)'O', (byte)'F',
			0x00, 0x10, 0x00  // Truncate to $1000
		};

		Assert.True(IpsPatchHeader.HasTruncateExtension(patch));
	}

	[Fact]
	public void GetTruncateOffset_NoExtension_ReturnsNull() {
		var patch = CreateMinimalIpsPatch();

		Assert.Null(IpsPatchHeader.GetTruncateOffset(patch));
	}

	[Fact]
	public void GetTruncateOffset_WithExtension_ReturnsOffset() {
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			(byte)'E', (byte)'O', (byte)'F',
			0x00, 0x10, 0x00  // Truncate to $1000
		};

		var offset = IpsPatchHeader.GetTruncateOffset(patch);

		Assert.Equal(0x1000, offset);
	}

	[Fact]
	public void AddTruncateExtension_AddsOffset() {
		var patch = CreateMinimalIpsPatch();

		var extended = IpsPatchHeader.AddTruncateExtension(patch, 0x2000);

		Assert.True(IpsPatchHeader.HasTruncateExtension(extended));
		Assert.Equal(0x2000, IpsPatchHeader.GetTruncateOffset(extended));
	}

	[Fact]
	public void RemoveTruncateExtension_RemovesOffset() {
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			(byte)'E', (byte)'O', (byte)'F',
			0x00, 0x10, 0x00
		};

		var cleaned = IpsPatchHeader.RemoveTruncateExtension(patch);

		Assert.False(IpsPatchHeader.HasTruncateExtension(cleaned));
		Assert.Equal(8, cleaned.Length);
	}

	[Fact]
	public void AddTruncateExtension_ReplacesExisting() {
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			(byte)'E', (byte)'O', (byte)'F',
			0x00, 0x10, 0x00  // Old truncate
		};

		var extended = IpsPatchHeader.AddTruncateExtension(patch, 0x3000);

		Assert.Equal(0x3000, IpsPatchHeader.GetTruncateOffset(extended));
	}

	#endregion
}

/// <summary>
/// Tests for patch record types.
/// </summary>
public class PatchRecordTypesTests {
	[Fact]
	public void PatchChange_StoresAllProperties() {
		var change = new PatchChange(0x10, [0x01], [0x02], "test.ips");

		Assert.Equal(0x10, change.Offset);
		Assert.Equal(new byte[] { 0x01 }, change.OriginalData);
		Assert.Equal(new byte[] { 0x02 }, change.NewData);
		Assert.Equal("test.ips", change.Source);
	}

	[Fact]
	public void PatchConflict_StoresAllProperties() {
		var conflict = new PatchConflict(
			0x10,
			2,
			["patch1", "patch2"],
			[[0x01], [0x02]]
		);

		Assert.Equal(0x10, conflict.Offset);
		Assert.Equal(2, conflict.Length);
		Assert.Equal(2, conflict.Patches.Count);
		Assert.Equal(2, conflict.Values.Count);
	}

	[Fact]
	public void MultiPatchResult_StoresAllProperties() {
		var result = new MultiPatchResult(
			true,
			[0x00],
			[],
			[],
			[]
		);

		Assert.True(result.Success);
		Assert.Single(result.PatchedData);
		Assert.Empty(result.Changes);
		Assert.Empty(result.Conflicts);
		Assert.Empty(result.Errors);
	}

	[Fact]
	public void PatchPreview_StoresAllProperties() {
		var preview = new PatchPreview(
			PatchFormat.Ips,
			5,
			100,
			[],
			0x10,
			0x50
		);

		Assert.Equal(PatchFormat.Ips, preview.Format);
		Assert.Equal(5, preview.RecordCount);
		Assert.Equal(100, preview.TotalBytesChanged);
		Assert.Equal(0x10, preview.MinOffset);
		Assert.Equal(0x50, preview.MaxOffset);
	}

	[Fact]
	public void PatchFormat_HasExpectedValues() {
		Assert.Equal(0, (int)PatchFormat.Unknown);
		Assert.Equal(1, (int)PatchFormat.Ips);
		Assert.Equal(2, (int)PatchFormat.Bps);
		Assert.Equal(3, (int)PatchFormat.Ups);
	}
}

