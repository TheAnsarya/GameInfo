using GameInfoTools.Core.SaveData;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for SaveEditor and related types.
/// </summary>
public class SaveEditorTests {
	#region SaveFile Basic Tests

	[Fact]
	public void SaveFile_Constructor_SetsData() {
		var data = new byte[] { 0x01, 0x02, 0x03 };

		var save = new SaveFile(data);

		Assert.Equal(3, save.Data.Length);
	}

	[Fact]
	public void SaveFile_Constructor_NullData_ThrowsException() {
		Assert.Throws<ArgumentNullException>(() => new SaveFile(null!));
	}

	[Fact]
	public void SaveFile_DefaultValues_AreCorrect() {
		var save = new SaveFile(new byte[100]);

		Assert.Null(save.FilePath);
		Assert.Equal(SaveFormat.Raw, save.Format);
		Assert.Equal(SavePlatform.Unknown, save.Platform);
		Assert.Equal(1, save.SlotCount);
		Assert.Equal(ChecksumType.None, save.ChecksumType);
		Assert.False(save.IsModified);
	}

	#endregion

	#region Read Methods Tests

	[Fact]
	public void SaveFile_ReadByte_ReturnsCorrectValue() {
		var data = new byte[] { 0x00, 0x42, 0xff };
		var save = new SaveFile(data);

		Assert.Equal(0x42, save.ReadByte(1));
	}

	[Fact]
	public void SaveFile_ReadByte_OutOfRange_ThrowsException() {
		var save = new SaveFile(new byte[10]);

		Assert.Throws<ArgumentOutOfRangeException>(() => save.ReadByte(100));
	}

	[Fact]
	public void SaveFile_ReadUInt16_LittleEndian_ReturnsCorrectValue() {
		var data = new byte[] { 0x34, 0x12 }; // 0x1234 in LE
		var save = new SaveFile(data);

		Assert.Equal((ushort)0x1234, save.ReadUInt16(0));
	}

	[Fact]
	public void SaveFile_ReadUInt16BE_BigEndian_ReturnsCorrectValue() {
		var data = new byte[] { 0x12, 0x34 }; // 0x1234 in BE
		var save = new SaveFile(data);

		Assert.Equal((ushort)0x1234, save.ReadUInt16BE(0));
	}

	[Fact]
	public void SaveFile_ReadUInt32_LittleEndian_ReturnsCorrectValue() {
		var data = new byte[] { 0x78, 0x56, 0x34, 0x12 }; // 0x12345678 in LE
		var save = new SaveFile(data);

		Assert.Equal(0x12345678u, save.ReadUInt32(0));
	}

	[Fact]
	public void SaveFile_ReadBytes_ReturnsCorrectRange() {
		var data = new byte[] { 0x00, 0x01, 0x02, 0x03, 0x04 };
		var save = new SaveFile(data);

		var result = save.ReadBytes(1, 3);

		Assert.Equal(3, result.Length);
		Assert.Equal(0x01, result[0]);
		Assert.Equal(0x02, result[1]);
		Assert.Equal(0x03, result[2]);
	}

	[Fact]
	public void SaveFile_ReadString_ReadsUntilNull() {
		var data = new byte[] { 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x00, 0x58 }; // "Hello\0X"
		var save = new SaveFile(data);

		var result = save.ReadString(0, 7);

		Assert.Equal("Hello", result);
	}

	#endregion

	#region Write Methods Tests

	[Fact]
	public void SaveFile_WriteByte_SetsCorrectValue() {
		var save = new SaveFile(new byte[10]);

		save.WriteByte(5, 0x42);

		Assert.Equal(0x42, save.Data[5]);
	}

	[Fact]
	public void SaveFile_WriteByte_SetsModifiedFlag() {
		var save = new SaveFile(new byte[10]);

		save.WriteByte(0, 0x01);

		Assert.True(save.IsModified);
	}

	[Fact]
	public void SaveFile_WriteUInt16_LittleEndian_WritesCorrectly() {
		var save = new SaveFile(new byte[10]);

		save.WriteUInt16(0, 0x1234);

		Assert.Equal(0x34, save.Data[0]); // Low byte first
		Assert.Equal(0x12, save.Data[1]); // High byte second
	}

	[Fact]
	public void SaveFile_WriteUInt16BE_BigEndian_WritesCorrectly() {
		var save = new SaveFile(new byte[10]);

		save.WriteUInt16BE(0, 0x1234);

		Assert.Equal(0x12, save.Data[0]); // High byte first
		Assert.Equal(0x34, save.Data[1]); // Low byte second
	}

	[Fact]
	public void SaveFile_WriteUInt32_LittleEndian_WritesCorrectly() {
		var save = new SaveFile(new byte[10]);

		save.WriteUInt32(0, 0x12345678);

		Assert.Equal(0x78, save.Data[0]);
		Assert.Equal(0x56, save.Data[1]);
		Assert.Equal(0x34, save.Data[2]);
		Assert.Equal(0x12, save.Data[3]);
	}

	[Fact]
	public void SaveFile_WriteBytes_WritesCorrectRange() {
		var save = new SaveFile(new byte[10]);

		save.WriteBytes(2, [0xaa, 0xbb, 0xcc]);

		Assert.Equal(0xaa, save.Data[2]);
		Assert.Equal(0xbb, save.Data[3]);
		Assert.Equal(0xcc, save.Data[4]);
	}

	[Fact]
	public void SaveFile_WriteString_WritesWithPadding() {
		var save = new SaveFile(new byte[10]);

		save.WriteString(0, "Hi", 5, 0x00);

		Assert.Equal((byte)'H', save.Data[0]);
		Assert.Equal((byte)'i', save.Data[1]);
		Assert.Equal(0x00, save.Data[2]); // Padding
		Assert.Equal(0x00, save.Data[3]);
		Assert.Equal(0x00, save.Data[4]);
	}

	#endregion

	#region Slot Operations Tests

	[Fact]
	public void SaveFile_GetSlotData_ReturnsCorrectSlot() {
		var data = new byte[30];
		for (int i = 0; i < 30; i++) data[i] = (byte)i;

		var save = new SaveFile(data) {
			SlotCount = 3,
			SlotSize = 10
		};

		var slot1 = save.GetSlotData(1);

		Assert.Equal(10, slot1.Length);
		Assert.Equal(10, slot1[0]); // First byte of slot 1
	}

	[Fact]
	public void SaveFile_GetSlotData_InvalidSlot_ThrowsException() {
		var save = new SaveFile(new byte[30]) {
			SlotCount = 3,
			SlotSize = 10
		};

		Assert.Throws<ArgumentOutOfRangeException>(() => save.GetSlotData(5));
	}

	[Fact]
	public void SaveFile_CopySlot_CopiesData() {
		var data = new byte[20];
		data[0] = 0xAA;
		data[1] = 0xBB;

		var save = new SaveFile(data) {
			SlotCount = 2,
			SlotSize = 10
		};

		save.CopySlot(0, 1);

		Assert.Equal(0xAA, save.Data[10]);
		Assert.Equal(0xBB, save.Data[11]);
	}

	[Fact]
	public void SaveFile_ClearSlot_FillsWithByte() {
		var data = new byte[20];
		Array.Fill<byte>(data, 0xAA);

		var save = new SaveFile(data) {
			SlotCount = 2,
			SlotSize = 10
		};

		save.ClearSlot(0, 0x00);

		for (int i = 0; i < 10; i++) {
			Assert.Equal(0x00, save.Data[i]);
		}
		Assert.Equal(0xAA, save.Data[10]); // Slot 1 unchanged
	}

	#endregion

	#region SaveFormat Tests

	[Fact]
	public void SaveFormat_AllValues_Exist() {
		var formats = Enum.GetValues<SaveFormat>();

		Assert.Contains(SaveFormat.Raw, formats);
		Assert.Contains(SaveFormat.Srm, formats);
		Assert.Contains(SaveFormat.Sav, formats);
		Assert.Contains(SaveFormat.Eep, formats);
		Assert.Contains(SaveFormat.State, formats);
	}

	#endregion

	#region SavePlatform Tests

	[Fact]
	public void SavePlatform_AllValues_Exist() {
		var platforms = Enum.GetValues<SavePlatform>();

		Assert.Contains(SavePlatform.Unknown, platforms);
		Assert.Contains(SavePlatform.Nes, platforms);
		Assert.Contains(SavePlatform.Snes, platforms);
		Assert.Contains(SavePlatform.Genesis, platforms);
		Assert.Contains(SavePlatform.GameBoy, platforms);
		Assert.Contains(SavePlatform.Gba, platforms);
	}

	#endregion

	#region ChecksumType Tests

	[Fact]
	public void ChecksumType_AllValues_Exist() {
		var types = Enum.GetValues<ChecksumType>();

		Assert.Contains(ChecksumType.None, types);
		Assert.Contains(ChecksumType.Sum8, types);
		Assert.Contains(ChecksumType.Sum16, types);
		Assert.Contains(ChecksumType.Xor8, types);
		Assert.Contains(ChecksumType.Crc16, types);
	}

	#endregion

	#region SaveEditor Checksum Tests

	[Fact]
	public void SaveEditor_CalculateSum8_CalculatesCorrectly() {
		var data = new byte[] { 0x10, 0x20, 0x30, 0x40 };

		var sum = SaveEditor.CalculateSum8(data, 0, 4);

		Assert.Equal((byte)0xa0, sum); // 0x10 + 0x20 + 0x30 + 0x40 = 0xa0
	}

	[Fact]
	public void SaveEditor_CalculateSum16_CalculatesCorrectly() {
		var data = new byte[] { 0xff, 0xff, 0xff, 0xff };

		var sum = SaveEditor.CalculateSum16(data, 0, 4);

		Assert.Equal((ushort)(0xff * 4), sum);
	}

	[Fact]
	public void SaveEditor_CalculateXor8_CalculatesCorrectly() {
		var data = new byte[] { 0xaa, 0x55, 0xff };

		var xor = SaveEditor.CalculateXor8(data, 0, 3);

		Assert.Equal((byte)(0xaa ^ 0x55 ^ 0xff), xor);
	}

	[Fact]
	public void SaveEditor_VerifyChecksum_Sum8_VerifiesCorrectly() {
		var data = new byte[] { 0x10, 0x20, 0x30, 0xa0 }; // Last byte is checksum
		var save = new SaveFile(data) {
			ChecksumType = ChecksumType.Sum8
		};

		var result = SaveEditor.VerifyChecksum(save, 3, 0, 3);

		Assert.False(result); // 0x10 + 0x20 + 0x30 = 0x60, not 0xa0
	}

	#endregion

	#region BcdHelper Tests

	[Fact]
	public void BcdHelper_FromBcd_ConvertsCorrectly() {
		Assert.Equal(0, BcdHelper.FromBcd(0x00));
		Assert.Equal(15, BcdHelper.FromBcd(0x15));
		Assert.Equal(42, BcdHelper.FromBcd(0x42));
		Assert.Equal(99, BcdHelper.FromBcd(0x99));
	}

	[Fact]
	public void BcdHelper_ToBcd_ConvertsCorrectly() {
		Assert.Equal((byte)0x00, BcdHelper.ToBcd(0));
		Assert.Equal((byte)0x15, BcdHelper.ToBcd(15));
		Assert.Equal((byte)0x42, BcdHelper.ToBcd(42));
		Assert.Equal((byte)0x99, BcdHelper.ToBcd(99));
	}

	[Fact]
	public void BcdHelper_ToBcd_OutOfRange_ThrowsException() {
		Assert.Throws<ArgumentOutOfRangeException>(() => BcdHelper.ToBcd(-1));
		Assert.Throws<ArgumentOutOfRangeException>(() => BcdHelper.ToBcd(100));
	}

	[Fact]
	public void BcdHelper_ReadBcd_MultiByteValue() {
		var data = new byte[] { 0x12, 0x34 }; // 1234 in BCD

		var value = BcdHelper.ReadBcd(data, 0, 2);

		Assert.Equal(1234, value);
	}

	[Fact]
	public void BcdHelper_WriteBcd_MultiByteValue() {
		var data = new byte[2];

		BcdHelper.WriteBcd(data, 0, 1234, 2);

		Assert.Equal(0x12, data[0]);
		Assert.Equal(0x34, data[1]);
	}

	[Fact]
	public void BcdHelper_RoundTrip_PreservesValue() {
		var original = 42;

		var bcd = BcdHelper.ToBcd(original);
		var result = BcdHelper.FromBcd(bcd);

		Assert.Equal(original, result);
	}

	#endregion

	#region SaveFieldDefinition Tests

	[Fact]
	public void SaveFieldDefinition_Constructor_SetsProperties() {
		var field = new SaveFieldDefinition {
			Name = "Gold",
			Offset = 0x100,
			Type = SaveFieldType.UInt16,
			Length = 2,
			MinValue = 0,
			MaxValue = 65535,
			Description = "Player's gold amount"
		};

		Assert.Equal("Gold", field.Name);
		Assert.Equal(0x100, field.Offset);
		Assert.Equal(SaveFieldType.UInt16, field.Type);
		Assert.Equal(2, field.Length);
		Assert.Equal("Player's gold amount", field.Description);
	}

	[Fact]
	public void SaveFieldType_AllValues_Exist() {
		var types = Enum.GetValues<SaveFieldType>();

		Assert.Contains(SaveFieldType.Byte, types);
		Assert.Contains(SaveFieldType.UInt16, types);
		Assert.Contains(SaveFieldType.UInt32, types);
		Assert.Contains(SaveFieldType.String, types);
		Assert.Contains(SaveFieldType.Bcd, types);
		Assert.Contains(SaveFieldType.BitFlags, types);
	}

	#endregion

	#region File Operations Tests

	[Fact]
	public void SaveEditor_SaveAndLoad_PreservesData() {
		var originalData = new byte[] { 0x01, 0x02, 0x03, 0x04, 0x05 };
		var save = new SaveFile(originalData);

		var tempFile = Path.GetTempFileName();
		try {
			SaveEditor.Save(save, tempFile);
			var loaded = SaveEditor.Load(tempFile);

			Assert.Equal(originalData.Length, loaded.Data.Length);
			for (int i = 0; i < originalData.Length; i++) {
				Assert.Equal(originalData[i], loaded.Data[i]);
			}
		} finally {
			File.Delete(tempFile);
		}
	}

	[Fact]
	public void SaveEditor_CreateBackup_CreatesFile() {
		var tempFile = Path.GetTempFileName();
		try {
			File.WriteAllBytes(tempFile, [0x01, 0x02, 0x03]);

			SaveEditor.CreateBackup(tempFile);

			var backups = Directory.GetFiles(Path.GetDirectoryName(tempFile)!,
				$"{Path.GetFileName(tempFile)}.bak.*");
			Assert.NotEmpty(backups);

			// Cleanup backups
			foreach (var backup in backups) {
				File.Delete(backup);
			}
		} finally {
			File.Delete(tempFile);
		}
	}

	#endregion
}
