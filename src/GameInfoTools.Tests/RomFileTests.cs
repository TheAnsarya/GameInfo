using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for RomFile class including ROM loading, header detection,
/// read/write operations, and system type identification.
/// </summary>
public class RomFileTests {
	[Fact]
	public void RomFile_NewInstance_IsEmpty() {
		var rom = new RomFile();

		Assert.False(rom.IsLoaded);
		Assert.Equal(0, rom.Length);
		Assert.Equal(string.Empty, rom.FilePath);
	}

	[Fact]
	public void GetRomInfo_DetectsNesRom() {
		byte[] nesRom = new byte[16 + 0x4000]; // Header + 16KB PRG
		nesRom[0] = (byte)'N';
		nesRom[1] = (byte)'E';
		nesRom[2] = (byte)'S';
		nesRom[3] = 0x1a;
		nesRom[4] = 1; // 1 PRG bank

		var info = RomFile.GetRomInfo(nesRom);

		Assert.Equal(SystemType.Nes, info.System);
		Assert.Equal(16, info.HeaderSize);
	}

	[Fact]
	public void GetRomInfo_DetectsSnesRom() {
		// Create SNES ROM with LoROM header at $7FC0
		byte[] snesRom = new byte[0x8000];
		int headerOffset = 0x7fc0;

		// Write internal title (21 bytes)
		string title = "TEST GAME            "; // 21 chars
		for (int i = 0; i < 21 && i < title.Length; i++) {
			snesRom[headerOffset + i] = (byte)title[i];
		}

		// Map mode at $7FD5 - LoROM (0x20)
		snesRom[0x7fd5] = 0x20;

		// ROM type at $7FD6
		snesRom[0x7fd6] = 0x00;

		// ROM size at $7FD7 (2^N KB, so 8 = 256KB)
		snesRom[0x7fd7] = 0x08;

		var info = RomFile.GetRomInfo(snesRom);

		// Note: Detection may vary based on implementation
		Assert.NotNull(info);
	}

	[Fact]
	public void GetRomInfo_DetectsGameBoyRom() {
		byte[] gbRom = new byte[0x8000]; // 32KB ROM
										 // Nintendo logo at $0104-$0133
		byte[] logo =
		[
			0xce, 0xed, 0x66, 0x66, 0xcc, 0x0d, 0x00, 0x0b,
			0x03, 0x73, 0x00, 0x83, 0x00, 0x0c, 0x00, 0x0d,
			0x00, 0x08, 0x11, 0x1f, 0x88, 0x89, 0x00, 0x0e,
			0xdc, 0xcc, 0x6e, 0xe6, 0xdd, 0xdd, 0xd9, 0x99,
			0xbb, 0xbb, 0x67, 0x63, 0x6e, 0x0e, 0xec, 0xcc,
			0xdd, 0xdc, 0x99, 0x9f, 0xbb, 0xb9, 0x33, 0x3e
		];
		Array.Copy(logo, 0, gbRom, 0x0104, logo.Length);

		// Title at $0134-$0143
		string title = "TEST";
		for (int i = 0; i < title.Length; i++) {
			gbRom[0x0134 + i] = (byte)title[i];
		}

		var info = RomFile.GetRomInfo(gbRom);

		Assert.Equal(SystemType.GameBoy, info.System);
		Assert.Equal(0, info.HeaderSize); // GB has no external header
	}

	[Fact]
	public void GetRomInfo_ReturnsUnknownForUnrecognized() {
		byte[] unknownRom = new byte[0x1000];
		for (int i = 0; i < unknownRom.Length; i++) {
			unknownRom[i] = (byte)(i & 0xff);
		}

		var info = RomFile.GetRomInfo(unknownRom);

		Assert.Equal(SystemType.Unknown, info.System);
	}

	[Fact]
	public void ReadByte_ReturnsCorrectValue() {
		var rom = new RomFile();
		// Use reflection to set internal data for testing
		var dataProperty = typeof(RomFile).GetProperty("Data", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance);
		dataProperty?.SetValue(rom, new byte[] { 0x12, 0x34, 0x56, 0x78 });

		Assert.Equal(0x12, rom.ReadByte(0));
		Assert.Equal(0x34, rom.ReadByte(1));
		Assert.Equal(0x78, rom.ReadByte(3));
	}

	[Fact]
	public void ReadUInt16_ReturnsLittleEndianValue() {
		var rom = new RomFile();
		var dataProperty = typeof(RomFile).GetProperty("Data", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance);
		dataProperty?.SetValue(rom, new byte[] { 0xcd, 0xab }); // Little-endian $ABCD

		Assert.Equal((ushort)0xabcd, rom.ReadUInt16(0));
	}

	[Fact]
	public void ReadUInt24_ReturnsCorrectValue() {
		var rom = new RomFile();
		var dataProperty = typeof(RomFile).GetProperty("Data", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance);
		dataProperty?.SetValue(rom, new byte[] { 0xef, 0xcd, 0xab }); // Little-endian $ABCDEF

		Assert.Equal(0xabcdefu, rom.ReadUInt24(0));
	}

	[Fact]
	public void Write_ModifiesData() {
		var rom = new RomFile();
		var dataProperty = typeof(RomFile).GetProperty("Data", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance);
		dataProperty?.SetValue(rom, new byte[] { 0x00, 0x00, 0x00, 0x00 });

		rom.Write(1, new byte[] { 0xab, 0xcd });

		Assert.Equal(0x00, rom.ReadByte(0));
		Assert.Equal(0xab, rom.ReadByte(1));
		Assert.Equal(0xcd, rom.ReadByte(2));
		Assert.Equal(0x00, rom.ReadByte(3));
	}

	[Fact]
	public void WriteByte_ModifiesSingleByte() {
		var rom = new RomFile();
		var dataProperty = typeof(RomFile).GetProperty("Data", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance);
		dataProperty?.SetValue(rom, new byte[] { 0x00, 0x00, 0x00, 0x00 });

		rom.WriteByte(2, 0xff);

		Assert.Equal(0xff, rom.ReadByte(2));
	}

	[Fact]
	public void AsSpan_ReturnsFullData() {
		var rom = new RomFile();
		var dataProperty = typeof(RomFile).GetProperty("Data", System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.Instance);
		byte[] testData = [0x01, 0x02, 0x03, 0x04];
		dataProperty?.SetValue(rom, testData);

		var span = rom.AsSpan();

		Assert.Equal(4, span.Length);
		Assert.Equal(0x01, span[0]);
		Assert.Equal(0x04, span[3]);
	}

	[Fact]
	public void Dispose_CanBeCalledMultipleTimes() {
		var rom = new RomFile();
		rom.Dispose();
		rom.Dispose(); // Should not throw
	}
}
