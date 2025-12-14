using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Advanced tests for RomFile read/write operations.
/// </summary>
public class RomFileAdvancedTests : IDisposable {
	private readonly string _tempFile;

	public RomFileAdvancedTests() {
		_tempFile = Path.GetTempFileName();
	}

	public void Dispose() {
		if (File.Exists(_tempFile)) {
			File.Delete(_tempFile);
		}
	}

	[Fact]
	public void Length_ReturnsCorrectValue() {
		var data = new byte[] { 0x00, 0x01, 0x02, 0x03 };
		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Equal(4, rom.Length);
	}

	[Fact]
	public void IsLoaded_IsTrueAfterLoad() {
		File.WriteAllBytes(_tempFile, new byte[] { 0x00 });

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.True(rom.IsLoaded);
	}

	[Fact]
	public void FilePath_IsSetAfterLoad() {
		File.WriteAllBytes(_tempFile, new byte[] { 0x00 });

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Equal(_tempFile, rom.FilePath);
	}

	[Fact]
	public void Data_ReturnsRomBytes() {
		var data = new byte[] { 0xab, 0xcd, 0xef };
		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Equal(data, rom.Data);
	}

	[Fact]
	public void ReadByte_ReturnsCorrectValue() {
		var data = new byte[] { 0x00, 0x11, 0x22, 0x33 };
		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Equal(0x22, rom.ReadByte(2));
	}

	[Fact]
	public void ReadByte_ThrowsOnNegativeOffset() {
		File.WriteAllBytes(_tempFile, new byte[] { 0x00 });

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Throws<ArgumentOutOfRangeException>(() => rom.ReadByte(-1));
	}

	[Fact]
	public void ReadByte_ThrowsOnOutOfRange() {
		File.WriteAllBytes(_tempFile, new byte[] { 0x00 });

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Throws<ArgumentOutOfRangeException>(() => rom.ReadByte(1));
	}

	[Fact]
	public void ReadUInt16_ReturnsLittleEndianValue() {
		// 0x1234 stored as little-endian: 34 12
		var data = new byte[] { 0x34, 0x12 };
		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Equal((ushort)0x1234, rom.ReadUInt16(0));
	}

	[Fact]
	public void ReadUInt24_ReturnsLittleEndianValue() {
		// 0x123456 stored as little-endian: 56 34 12
		var data = new byte[] { 0x56, 0x34, 0x12 };
		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.Equal((uint)0x123456, rom.ReadUInt24(0));
	}

	[Fact]
	public void Read_ReturnsCorrectSpan() {
		var data = new byte[] { 0x00, 0x11, 0x22, 0x33, 0x44 };
		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		var span = rom.Read(1, 3);

		Assert.Equal(3, span.Length);
		Assert.Equal(0x11, span[0]);
		Assert.Equal(0x22, span[1]);
		Assert.Equal(0x33, span[2]);
	}

	[Fact]
	public void WriteByte_ModifiesData() {
		File.WriteAllBytes(_tempFile, new byte[] { 0x00, 0x00, 0x00 });

		var rom = new RomFile();
		rom.Load(_tempFile);
		rom.WriteByte(1, 0xff);

		Assert.Equal(0xff, rom.ReadByte(1));
	}

	[Fact]
	public void Write_ModifiesData() {
		File.WriteAllBytes(_tempFile, new byte[] { 0x00, 0x00, 0x00, 0x00 });

		var rom = new RomFile();
		rom.Load(_tempFile);
		rom.Write(1, new byte[] { 0xaa, 0xbb });

		Assert.Equal(0x00, rom.ReadByte(0));
		Assert.Equal(0xaa, rom.ReadByte(1));
		Assert.Equal(0xbb, rom.ReadByte(2));
		Assert.Equal(0x00, rom.ReadByte(3));
	}

	[Fact]
	public void AsSpan_ReturnsEntireData() {
		var data = new byte[] { 0x01, 0x02, 0x03 };
		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		var span = rom.AsSpan();

		Assert.Equal(data.Length, span.Length);
		Assert.True(span.SequenceEqual(data));
	}

	[Fact]
	public void Save_WritesDataToFile() {
		var originalData = new byte[] { 0x01, 0x02, 0x03 };
		File.WriteAllBytes(_tempFile, originalData);

		var rom = new RomFile();
		rom.Load(_tempFile);
		rom.WriteByte(1, 0xff);
		rom.Save();

		var savedData = File.ReadAllBytes(_tempFile);
		Assert.Equal(0xff, savedData[1]);
	}

	[Fact]
	public void Save_WritesToNewPath() {
		var tempFile2 = Path.GetTempFileName();
		try {
			File.WriteAllBytes(_tempFile, new byte[] { 0xab, 0xcd });

			var rom = new RomFile();
			rom.Load(_tempFile);
			rom.Save(tempFile2);

			Assert.True(File.Exists(tempFile2));
			Assert.Equal(rom.Data, File.ReadAllBytes(tempFile2));
		} finally {
			if (File.Exists(tempFile2))
				File.Delete(tempFile2);
		}
	}

	[Fact]
	public void DetectsInesHeader() {
		// iNES header: NES\x1a + PRG count + CHR count + flags
		var data = new byte[32];
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = 0x1a;
		data[4] = 2;  // 2 * 16KB PRG
		data[5] = 1;  // 1 * 8KB CHR
		data[6] = 0x10; // Mapper 1 (low nibble)

		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		Assert.NotNull(rom.Header);
		Assert.Equal(SystemType.Nes, rom.Header.System);
		Assert.Equal(16, rom.Header.HeaderSize);
		Assert.Equal(32768, rom.Header.PrgRomSize); // 2 * 16KB
		Assert.Equal(8192, rom.Header.ChrRomSize);  // 1 * 8KB
	}

	[Fact]
	public void GetInfo_ReturnsSystemType() {
		// Create iNES header
		var data = new byte[32];
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = 0x1a;

		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		var info = rom.GetInfo();
		Assert.Equal(SystemType.Nes, info.System);
	}

	[Fact]
	public async Task LoadAsync_LoadsRom() {
		File.WriteAllBytes(_tempFile, new byte[] { 0xab, 0xcd });

		var rom = new RomFile();
		await rom.LoadAsync(_tempFile);

		Assert.True(rom.IsLoaded);
		Assert.Equal(2, rom.Length);
	}

	[Fact]
	public async Task SaveAsync_SavesRom() {
		File.WriteAllBytes(_tempFile, new byte[] { 0x00 });

		var rom = new RomFile();
		rom.Load(_tempFile);
		rom.WriteByte(0, 0xff);
		await rom.SaveAsync();

		var saved = File.ReadAllBytes(_tempFile);
		Assert.Equal(0xff, saved[0]);
	}

	[Fact]
	public void GetDataWithoutHeader_ReturnsDataAfterHeader() {
		// Create NES ROM with 16-byte header + data
		var data = new byte[32];
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = 0x1a;
		data[16] = 0xab; // First byte after header
		data[17] = 0xcd;

		File.WriteAllBytes(_tempFile, data);

		var rom = new RomFile();
		rom.Load(_tempFile);

		var withoutHeader = rom.GetDataWithoutHeader();

		Assert.Equal(16, withoutHeader.Length); // 32 - 16
		Assert.Equal(0xab, withoutHeader[0]);
		Assert.Equal(0xcd, withoutHeader[1]);
	}
}
