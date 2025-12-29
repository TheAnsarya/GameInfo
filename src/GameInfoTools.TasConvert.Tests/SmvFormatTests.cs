using GameInfoTools.TasConvert.Core;
using GameInfoTools.TasConvert.Formats.Snes;

namespace GameInfoTools.TasConvert.Tests;

/// <summary>
/// Tests for Snes9x SMV format reader/writer.
/// </summary>
public class SmvFormatTests {
	private readonly SmvFormat _format = new();

	[Fact]
	public void Name_ReturnsSMV() {
		Assert.Equal("SMV", _format.Name);
	}

	[Fact]
	public void EmulatorName_ReturnsSnes9x() {
		Assert.Equal("Snes9x", _format.EmulatorName);
	}

	[Fact]
	public void MatchesExtension_SmvFile_ReturnsTrue() {
		Assert.True(_format.MatchesExtension(".smv"));
		Assert.True(_format.MatchesExtension(".SMV"));
		Assert.True(_format.MatchesExtension("smv"));
	}

	[Fact]
	public void MatchesExtension_NonSmvFile_ReturnsFalse() {
		Assert.False(_format.MatchesExtension(".fm2"));
		Assert.False(_format.MatchesExtension(".bk2"));
		Assert.False(_format.MatchesExtension(".txt"));
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_InvalidSignature_ThrowsException() {
		// SMV files must start with "SMV\x1A"
		var invalidData = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		using var stream = new MemoryStream(invalidData);

		await Assert.ThrowsAsync<InvalidDataException>(() => _format.ReadAsync(stream));
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_ValidSignature_ParsesHeader() {
		// Create minimal valid SMV header
		// Header structure (version 1.51+, 64 bytes):
		// 0-3: Signature "SMV\x1A"
		// 4-7: Version (uint32)
		// 8-11: UID (uint32)
		// 12-15: Rerecord count (uint32)
		// 16-19: Frame count (uint32)
		// 20: Controller flags (byte)
		// 21: Movie flags (byte)
		// 22: Sync flags (byte)
		// 23: Reserved (byte)
		// 24-27: Savestate offset (uint32)
		// 28-31: Controller data offset (uint32)
		// 32-63: Extended header (unused here)

		var header = new byte[64];

		// Signature: "SMV\x1A"
		header[0] = (byte)'S';
		header[1] = (byte)'M';
		header[2] = (byte)'V';
		header[3] = 0x1A;

		// Version: 4 (for 64-byte header)
		BitConverter.GetBytes(4u).CopyTo(header, 4);

		// UID (4 bytes at offset 8) - not used
		BitConverter.GetBytes(0u).CopyTo(header, 8);

		// Rerecord count: 100 at offset 12
		BitConverter.GetBytes(100u).CopyTo(header, 12);

		// Frame count: 10 at offset 16
		BitConverter.GetBytes(10u).CopyTo(header, 16);

		// Controller flags at offset 20
		header[20] = 1; // Controller 1 enabled

		// Movie flags at offset 21
		header[21] = 0;

		// Sync flags at offset 22
		header[22] = 0;

		// Reserved at offset 23
		header[23] = 0;

		// Save state offset at offset 24
		BitConverter.GetBytes(0u).CopyTo(header, 24);

		// Controller data offset at offset 28 - after 64-byte header
		BitConverter.GetBytes(64u).CopyTo(header, 28);

		// Add 10 frames of input data (2 bytes per frame for 1 controller)
		var data = new byte[64 + 20];
		Array.Copy(header, data, 64);

		using var stream = new MemoryStream(data);
		var movie = await _format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.Equal(100, movie.Metadata.RerecordCount);
	}

	[Fact]
	public void SupportedSystems_ContainsSNES() {
		Assert.Contains(GameSystem.Snes, _format.SupportedSystems);
	}

	[Fact]
	public void CanRead_ReturnsTrue() {
		Assert.True(_format.CanRead);
	}

	[Fact]
	public void CanWrite_ReturnsTrue() {
		Assert.True(_format.CanWrite);
	}
}
