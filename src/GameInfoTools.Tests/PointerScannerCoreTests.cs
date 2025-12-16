using GameInfoTools.Core.Analysis;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for PointerScanner and related types.
/// </summary>
public class PointerScannerTests {
	#region PointerInfo Tests

	[Fact]
	public void PointerInfo_Constructor_SetsProperties() {
		var pointer = new PointerInfo {
			PointerAddress = 0x8000,
			TargetAddress = 0x9000,
			PointerSize = 2,
			Confidence = 80
		};

		Assert.Equal(0x8000, pointer.PointerAddress);
		Assert.Equal(0x9000, pointer.TargetAddress);
		Assert.Equal(2, pointer.PointerSize);
		Assert.Equal(80, pointer.Confidence);
	}

	[Fact]
	public void PointerInfo_DefaultValues_AreCorrect() {
		var pointer = new PointerInfo {
			PointerAddress = 0x8000,
			TargetAddress = 0x9000
		};

		Assert.Equal(2, pointer.PointerSize);
		Assert.Equal(50, pointer.Confidence);
		Assert.Equal(PointerType.Unknown, pointer.Type);
		Assert.Null(pointer.Bank);
	}

	[Theory]
	[InlineData(PointerType.CodeJump)]
	[InlineData(PointerType.DataTable)]
	[InlineData(PointerType.StringPointer)]
	[InlineData(PointerType.GraphicsPointer)]
	public void PointerInfo_AllTypes_CanBeAssigned(PointerType type) {
		var pointer = new PointerInfo {
			PointerAddress = 0x8000,
			TargetAddress = 0x9000,
			Type = type
		};
		Assert.Equal(type, pointer.Type);
	}

	#endregion

	#region PointerTable Tests

	[Fact]
	public void PointerTable_Constructor_SetsProperties() {
		var pointers = new List<PointerInfo> {
			new() { PointerAddress = 0x8000, TargetAddress = 0x9000 },
			new() { PointerAddress = 0x8002, TargetAddress = 0x9100 }
		};

		var table = new PointerTable {
			StartAddress = 0x8000,
			EntryCount = 2,
			Pointers = pointers
		};

		Assert.Equal(0x8000, table.StartAddress);
		Assert.Equal(2, table.EntryCount);
		Assert.Equal(2, table.Pointers.Count);
	}

	#endregion

	#region PointerScanner Basic Tests

	[Fact]
	public void PointerScanner_Constructor_WithData_CreatesInstance() {
		var data = new byte[100];
		var scanner = new PointerScanner(data);

		Assert.NotNull(scanner);
	}

	[Fact]
	public void PointerScanner_Constructor_WithNullData_ThrowsException() {
		Assert.Throws<ArgumentNullException>(() => new PointerScanner(null!));
	}

	[Fact]
	public void PointerScanner_TryReadPointer_LittleEndian16_ReadsCorrectly() {
		var data = new byte[] { 0x00, 0x90 }; // 0x9000 in little-endian
		var config = new PointerScanConfig {
			Format = PointerFormat.LittleEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xffff,
			HeaderSize = 0
		};
		var scanner = new PointerScanner(data, config);

		var pointer = scanner.TryReadPointer(0);

		Assert.NotNull(pointer);
		Assert.Equal(0x9000, pointer!.TargetAddress);
	}

	[Fact]
	public void PointerScanner_TryReadPointer_BigEndian16_ReadsCorrectly() {
		var data = new byte[] { 0x90, 0x00 }; // 0x9000 in big-endian
		var config = new PointerScanConfig {
			Format = PointerFormat.BigEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xffff,
			HeaderSize = 0
		};
		var scanner = new PointerScanner(data, config);

		var pointer = scanner.TryReadPointer(0);

		Assert.NotNull(pointer);
		Assert.Equal(0x9000, pointer!.TargetAddress);
	}

	[Fact]
	public void PointerScanner_TryReadPointer_OutOfRange_ReturnsNull() {
		var data = new byte[] { 0x00, 0x10 }; // 0x1000 - below valid range
		var config = new PointerScanConfig {
			Format = PointerFormat.LittleEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xffff,
			HeaderSize = 0
		};
		var scanner = new PointerScanner(data, config);

		var pointer = scanner.TryReadPointer(0);

		Assert.Null(pointer);
	}

	[Fact]
	public void PointerScanner_TryReadPointer_24Bit_ReadsCorrectly() {
		var data = new byte[] { 0x00, 0x90, 0x01 }; // 0x019000 in little-endian
		var config = new PointerScanConfig {
			Format = PointerFormat.LittleEndian24,
			MinTarget = 0x008000,
			MaxTarget = 0xffffff,
			HeaderSize = 0
		};
		var scanner = new PointerScanner(data, config);

		var pointer = scanner.TryReadPointer(0);

		Assert.NotNull(pointer);
		Assert.Equal(0x019000, pointer!.TargetAddress);
		Assert.Equal(1, pointer.Bank);
	}

	#endregion

	#region Scanning Tests

	[Fact]
	public void PointerScanner_ScanRange_FindsPointers() {
		// Create ROM with some valid pointers
		var data = new byte[100];
		// Add a valid pointer at offset 20 pointing to 0x8100
		data[20] = 0x00;
		data[21] = 0x81;
		// Add another at offset 40 pointing to 0x8200
		data[40] = 0x00;
		data[41] = 0x82;

		var config = new PointerScanConfig {
			Format = PointerFormat.LittleEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xffff,
			HeaderSize = 0
		};
		var scanner = new PointerScanner(data, config);

		var pointers = scanner.ScanRange(0, 50);

		Assert.True(pointers.Count >= 2);
	}

	[Fact]
	public void PointerScanner_FindReferencesTo_FindsAllReferences() {
		var data = new byte[100];
		// Multiple pointers to same address
		data[10] = 0x00;
		data[11] = 0x90;
		data[30] = 0x00;
		data[31] = 0x90;
		data[50] = 0x00;
		data[51] = 0x90;

		var config = new PointerScanConfig {
			Format = PointerFormat.LittleEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xffff,
			HeaderSize = 0
		};
		var scanner = new PointerScanner(data, config);

		var refs = scanner.FindReferencesTo(0x9000);

		Assert.Equal(3, refs.Count);
	}

	#endregion

	#region Table Detection Tests

	[Fact]
	public void PointerScanner_DetectTables_FindsConsecutivePointers() {
		var data = new byte[100];
		// Create a pointer table with 5 entries starting at offset 20
		for (int i = 0; i < 5; i++) {
			var offset = 20 + (i * 2);
			var target = 0x8000 + (i * 0x100);
			data[offset] = (byte)(target & 0xff);
			data[offset + 1] = (byte)((target >> 8) & 0xff);
		}

		var config = new PointerScanConfig {
			Format = PointerFormat.LittleEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xffff,
			HeaderSize = 0,
			MinTableSize = 4
		};
		var scanner = new PointerScanner(data, config);

		var tables = scanner.DetectTables(0, 100);

		Assert.NotEmpty(tables);
		Assert.Contains(tables, t => t.EntryCount >= 4);
	}

	[Fact]
	public void PointerScanner_DetectTables_IgnoresSmallGroups() {
		var data = new byte[100];
		// Create only 2 consecutive pointers - below min table size
		data[20] = 0x00;
		data[21] = 0x80;
		data[22] = 0x00;
		data[23] = 0x81;

		var config = new PointerScanConfig {
			Format = PointerFormat.LittleEndian16,
			MinTarget = 0x8000,
			MaxTarget = 0xffff,
			HeaderSize = 0,
			MinTableSize = 4
		};
		var scanner = new PointerScanner(data, config);

		var tables = scanner.DetectTables(0, 100);

		Assert.Empty(tables);
	}

	#endregion

	#region Address Conversion Tests

	[Fact]
	public void PointerScanner_FileOffsetToCpuAddress_ConvertsCorrectly() {
		var data = new byte[0x8000];
		var config = new PointerScanConfig {
			HeaderSize = 16,
			BankSize = 0x4000,
			BaseAddress = 0x8000
		};
		var scanner = new PointerScanner(data, config);

		var cpuAddr = scanner.FileOffsetToCpuAddress(16); // First byte after header

		Assert.Equal(0x8000, cpuAddr);
	}

	[Fact]
	public void PointerScanner_CpuAddressToFileOffset_ConvertsCorrectly() {
		var data = new byte[0x8000];
		var config = new PointerScanConfig {
			HeaderSize = 16,
			BankSize = 0x4000,
			BaseAddress = 0x8000
		};
		var scanner = new PointerScanner(data, config);

		var fileOffset = scanner.CpuAddressToFileOffset(0x8000, 0);

		Assert.Equal(16, fileOffset);
	}

	#endregion

	#region Write Pointer Tests

	[Fact]
	public void PointerScanner_WritePointer_LittleEndian16_WritesCorrectly() {
		var data = new byte[10];
		var config = new PointerScanConfig { Format = PointerFormat.LittleEndian16 };
		var scanner = new PointerScanner(data, config);

		scanner.WritePointer(0, 0x9000);

		Assert.Equal(0x00, data[0]);
		Assert.Equal(0x90, data[1]);
	}

	[Fact]
	public void PointerScanner_WritePointer_BigEndian16_WritesCorrectly() {
		var data = new byte[10];
		var config = new PointerScanConfig { Format = PointerFormat.BigEndian16 };
		var scanner = new PointerScanner(data, config);

		scanner.WritePointer(0, 0x9000);

		Assert.Equal(0x90, data[0]);
		Assert.Equal(0x00, data[1]);
	}

	#endregion

	#region Platform Presets Tests

	[Fact]
	public void PointerExtensions_CreateNesScanner_ConfiguresCorrectly() {
		var data = new byte[0x8000];
		var scanner = PointerExtensions.CreateNesScanner(data);

		Assert.NotNull(scanner);
	}

	[Fact]
	public void PointerExtensions_CreateSnesScanner_ConfiguresCorrectly() {
		var data = new byte[0x40000];
		var scanner = PointerExtensions.CreateSnesScanner(data);

		Assert.NotNull(scanner);
	}

	[Fact]
	public void PointerExtensions_CreateGenesisScanner_ConfiguresCorrectly() {
		var data = new byte[0x80000];
		var scanner = PointerExtensions.CreateGenesisScanner(data);

		Assert.NotNull(scanner);
	}

	#endregion
}
