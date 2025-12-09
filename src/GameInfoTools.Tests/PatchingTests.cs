using System.Text;
using GameInfoTools.Rom;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for IPS and BPS patching functionality.
/// </summary>
public class IpsPatchTests
{
	#region IPS Header Tests

	[Fact]
	public void ReadPatch_ValidHeader_ReturnsEmptyRecords()
	{
		// Minimal valid IPS file: header + EOF
		var patch = new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H', (byte)'E', (byte)'O', (byte)'F' };

		var records = IpsPatch.ReadPatch(patch);

		Assert.Empty(records);
	}

	[Fact]
	public void ReadPatch_InvalidHeader_ThrowsException()
	{
		var patch = new byte[] { (byte)'I', (byte)'P', (byte)'S', (byte)'X', (byte)'X' };

		Assert.Throws<InvalidDataException>(() => IpsPatch.ReadPatch(patch));
	}

	[Fact]
	public void ReadPatch_TooSmall_ThrowsException()
	{
		var patch = new byte[] { (byte)'P', (byte)'A', (byte)'T' };

		Assert.Throws<InvalidDataException>(() => IpsPatch.ReadPatch(patch));
	}

	#endregion

	#region Normal Record Tests

	[Fact]
	public void ReadPatch_SingleRecord_ParsesCorrectly()
	{
		// IPS patch: header + offset $000010, size 3, data [01 02 03] + EOF
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',  // Header
			0x00, 0x00, 0x10,                                        // Offset: $000010
			0x00, 0x03,                                              // Size: 3
			0x01, 0x02, 0x03,                                        // Data
			(byte)'E', (byte)'O', (byte)'F'                          // EOF
		};

		var records = IpsPatch.ReadPatch(patch);

		Assert.Single(records);
		Assert.Equal(0x10, records[0].Offset);
		Assert.Equal(new byte[] { 0x01, 0x02, 0x03 }, records[0].Data);
		Assert.False(records[0].IsRle);
	}

	[Fact]
	public void ReadPatch_MultipleRecords_ParsesAll()
	{
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x10, 0x00, 0x02, 0xaa, 0xbb,                 // Record 1
			0x00, 0x01, 0x00, 0x00, 0x01, 0xcc,                       // Record 2
			(byte)'E', (byte)'O', (byte)'F'
		};

		var records = IpsPatch.ReadPatch(patch);

		Assert.Equal(2, records.Count);
		Assert.Equal(0x10, records[0].Offset);
		Assert.Equal(0x100, records[1].Offset);
	}

	[Fact]
	public void ReadPatch_LargeOffset_ParsesCorrectly()
	{
		// Offset 0x123456 (big endian: 12 34 56)
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x12, 0x34, 0x56,                                        // Offset: $123456
			0x00, 0x01,                                              // Size: 1
			0xff,                                                    // Data
			(byte)'E', (byte)'O', (byte)'F'
		};

		var records = IpsPatch.ReadPatch(patch);

		Assert.Single(records);
		Assert.Equal(0x123456, records[0].Offset);
	}

	#endregion

	#region RLE Record Tests

	[Fact]
	public void ReadPatch_RleRecord_ParsesCorrectly()
	{
		// RLE record: size=0, count=10, value=0xff
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x20,                                        // Offset: $000020
			0x00, 0x00,                                              // Size: 0 (RLE)
			0x00, 0x0a,                                              // Count: 10
			0xff,                                                    // Value
			(byte)'E', (byte)'O', (byte)'F'
		};

		var records = IpsPatch.ReadPatch(patch);

		Assert.Single(records);
		Assert.Equal(0x20, records[0].Offset);
		Assert.True(records[0].IsRle);
		Assert.Equal(10, records[0].RleCount);
		Assert.Equal(0xff, records[0].Data[0]);
	}

	[Fact]
	public void ReadPatch_MixedRecords_ParsesCorrectly()
	{
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x10, 0x00, 0x02, 0x11, 0x22,                 // Normal record
			0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x05, 0xaa,           // RLE record
			(byte)'E', (byte)'O', (byte)'F'
		};

		var records = IpsPatch.ReadPatch(patch);

		Assert.Equal(2, records.Count);
		Assert.False(records[0].IsRle);
		Assert.True(records[1].IsRle);
	}

	#endregion

	#region Apply Patch Tests

	[Fact]
	public void ApplyPatch_NormalRecord_ModifiesData()
	{
		var rom = new byte[256];
		Array.Fill(rom, (byte)0x00);

		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x10,
			0x00, 0x03,
			0xaa, 0xbb, 0xcc,
			(byte)'E', (byte)'O', (byte)'F'
		};

		var result = IpsPatch.ApplyPatch(rom, patch);

		Assert.Equal(0xaa, result[0x10]);
		Assert.Equal(0xbb, result[0x11]);
		Assert.Equal(0xcc, result[0x12]);
		Assert.Equal(0x00, result[0x13]); // Unmodified
	}

	[Fact]
	public void ApplyPatch_RleRecord_FillsData()
	{
		var rom = new byte[256];

		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x20,
			0x00, 0x00,
			0x00, 0x10,                                              // Count: 16
			0xff,
			(byte)'E', (byte)'O', (byte)'F'
		};

		var result = IpsPatch.ApplyPatch(rom, patch);

		for (int i = 0; i < 16; i++)
		{
			Assert.Equal(0xff, result[0x20 + i]);
		}
	}

	[Fact]
	public void ApplyPatch_ExpansionNeeded_ExpandsRom()
	{
		var rom = new byte[16];

		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x20,                                        // Offset beyond ROM
			0x00, 0x04,
			0x01, 0x02, 0x03, 0x04,
			(byte)'E', (byte)'O', (byte)'F'
		};

		var result = IpsPatch.ApplyPatch(rom, patch);

		Assert.True(result.Length > 16);
		Assert.Equal(0x01, result[0x20]);
	}

	#endregion

	#region Create Patch Tests

	[Fact]
	public void CreatePatch_NoDifferences_ReturnsHeaderEofOnly()
	{
		var original = new byte[] { 0x01, 0x02, 0x03, 0x04 };
		var modified = new byte[] { 0x01, 0x02, 0x03, 0x04 };

		var patch = IpsPatch.CreatePatch(original, modified);

		// Should be just header + EOF
		Assert.Equal(8, patch.Length);
		Assert.Equal((byte)'P', patch[0]);
		Assert.Equal((byte)'E', patch[5]);
	}

	[Fact]
	public void CreatePatch_SingleDifference_CreatesRecord()
	{
		var original = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		var modified = new byte[] { 0x00, 0xff, 0x00, 0x00 };

		var patch = IpsPatch.CreatePatch(original, modified);
		var records = IpsPatch.ReadPatch(patch);

		Assert.Single(records);
		Assert.Contains(records, r => r.Offset == 1 && r.Data.Contains((byte)0xff));
	}

	[Fact]
	public void CreatePatch_RleOpportunity_UsesRle()
	{
		var original = new byte[100];
		var modified = new byte[100];
		Array.Fill(modified, (byte)0xff, 10, 20); // 20 bytes of 0xff

		var patch = IpsPatch.CreatePatch(original, modified);
		var records = IpsPatch.ReadPatch(patch);

		// Should detect RLE for repeated values
		var rleRecords = records.Where(r => r.IsRle).ToList();
		Assert.NotEmpty(rleRecords);
	}

	[Fact]
	public void CreatePatch_RoundTrip_PreservesData()
	{
		var original = new byte[256];
		for (int i = 0; i < 256; i++)
		{
			original[i] = (byte)i;
		}

		var modified = (byte[])original.Clone();
		modified[0x10] = 0xff;
		modified[0x20] = 0xaa;
		modified[0x30] = 0xbb;

		var patch = IpsPatch.CreatePatch(original, modified);
		var result = IpsPatch.ApplyPatch(original, patch);

		Assert.Equal(modified, result);
	}

	#endregion

	#region Write Patch Tests

	[Fact]
	public void WritePatch_EmptyRecords_WritesHeaderEof()
	{
		var records = new List<IpsPatch.IpsRecord>();

		var patch = IpsPatch.WritePatch(records);

		Assert.Equal(8, patch.Length);
		Assert.True(patch.Take(5).SequenceEqual(new byte[] { (byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H' }));
		Assert.True(patch.Skip(5).SequenceEqual(new byte[] { (byte)'E', (byte)'O', (byte)'F' }));
	}

	[Fact]
	public void WritePatch_NormalRecord_WritesCorrectFormat()
	{
		var records = new List<IpsPatch.IpsRecord>
		{
			new(0x100, new byte[] { 0xaa, 0xbb }, false, 0)
		};

		var patch = IpsPatch.WritePatch(records);

		// Header (5) + offset (3) + size (2) + data (2) + EOF (3) = 15
		Assert.Equal(15, patch.Length);
	}

	[Fact]
	public void WritePatch_RleRecord_WritesCorrectFormat()
	{
		var records = new List<IpsPatch.IpsRecord>
		{
			new(0x200, new byte[] { 0xff }, true, 100)
		};

		var patch = IpsPatch.WritePatch(records);

		// Header (5) + offset (3) + size=0 (2) + count (2) + value (1) + EOF (3) = 16
		Assert.Equal(16, patch.Length);
	}

	#endregion

	#region GetPatchInfo Tests

	[Fact]
	public void GetPatchInfo_ValidPatch_ReturnsInfo()
	{
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x00, 0x10, 0x00, 0x04, 0x01, 0x02, 0x03, 0x04,
			(byte)'E', (byte)'O', (byte)'F'
		};

		var info = IpsPatch.GetPatchInfo(patch);

		Assert.Contains("1 records", info);
		Assert.Contains("4 bytes", info);
	}

	[Fact]
	public void GetPatchInfo_RleRecord_ShowsRleInfo()
	{
		var patch = new byte[]
		{
			(byte)'P', (byte)'A', (byte)'T', (byte)'C', (byte)'H',
			0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x20, 0xff,
			(byte)'E', (byte)'O', (byte)'F'
		};

		var info = IpsPatch.GetPatchInfo(patch);

		Assert.Contains("RLE", info);
	}

	#endregion
}

/// <summary>
/// Tests for BPS patch format.
/// </summary>
public class BpsPatchTests
{
	[Fact]
	public void ApplyPatch_InvalidHeader_ThrowsException()
	{
		var source = new byte[16];
		var patch = new byte[] { (byte)'X', (byte)'P', (byte)'S', (byte)'1' };

		Assert.Throws<InvalidDataException>(() => BpsPatch.ApplyPatch(source, patch));
	}

	[Fact]
	public void ApplyPatch_TooSmall_ThrowsException()
	{
		var source = new byte[16];
		var patch = new byte[] { (byte)'B', (byte)'P', (byte)'S' };

		Assert.Throws<InvalidDataException>(() => BpsPatch.ApplyPatch(source, patch));
	}

	[Fact]
	public void ApplyPatch_ValidHeader_ProcessesPatch()
	{
		// Create minimal valid BPS patch
		// Header: BPS1
		// Source size: 16 (varint: 0x10)
		// Target size: 16 (varint: 0x10)
		// Metadata size: 0 (varint: 0x00)
		// Actions + CRC32s would follow

		var source = new byte[16];
		var patch = CreateMinimalBpsPatch(16, 16);

		// This should not throw
		var result = BpsPatch.ApplyPatch(source, patch);

		Assert.NotNull(result);
	}

	private static byte[] CreateMinimalBpsPatch(int sourceSize, int targetSize)
	{
		using var ms = new MemoryStream();

		// Header
		ms.Write(new byte[] { (byte)'B', (byte)'P', (byte)'S', (byte)'1' }, 0, 4);

		// Variable-length integers for sizes
		WriteVarInt(ms, sourceSize);
		WriteVarInt(ms, targetSize);
		WriteVarInt(ms, 0); // metadata size

		// Pad with zeros for CRC32s (normally would be real values)
		for (int i = 0; i < 12; i++)
		{
			ms.WriteByte(0);
		}

		return ms.ToArray();
	}

	private static void WriteVarInt(MemoryStream ms, long value)
	{
		while (true)
		{
			byte b = (byte)(value & 0x7f);
			value >>= 7;
			if (value == 0)
			{
				ms.WriteByte(b);
				break;
			}
			ms.WriteByte((byte)(b | 0x80));
			value--;
		}
	}
}
