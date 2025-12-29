using GameInfoTools.TasConvert.Core;
using GameInfoTools.TasConvert.Formats;

namespace GameInfoTools.TasConvert.Tests;

/// <summary>
/// Tests for BizHawk BK2 format reader/writer.
/// </summary>
public class Bk2FormatTests {
	private readonly Bk2Format _format = new();

	[Fact]
	public void Name_ReturnsBK2() {
		Assert.Equal("BK2", _format.Name);
	}

	[Fact]
	public void EmulatorName_ReturnsBizHawk() {
		Assert.Equal("BizHawk", _format.EmulatorName);
	}

	[Fact]
	public void MatchesExtension_Bk2File_ReturnsTrue() {
		Assert.True(_format.MatchesExtension(".bk2"));
		Assert.True(_format.MatchesExtension(".BK2"));
		Assert.True(_format.MatchesExtension("bk2"));
	}

	[Fact]
	public void MatchesExtension_NonBk2File_ReturnsFalse() {
		Assert.False(_format.MatchesExtension(".fm2"));
		Assert.False(_format.MatchesExtension(".smv"));
		Assert.False(_format.MatchesExtension(".vbm"));
	}

	[Fact]
	public void SupportedSystems_ContainsMultipleSystems() {
		Assert.Contains(GameSystem.Nes, _format.SupportedSystems);
		Assert.Contains(GameSystem.Snes, _format.SupportedSystems);
		Assert.Contains(GameSystem.GameBoy, _format.SupportedSystems);
		Assert.Contains(GameSystem.GameBoyColor, _format.SupportedSystems);
		Assert.Contains(GameSystem.GameBoyAdvance, _format.SupportedSystems);
		Assert.Contains(GameSystem.Genesis, _format.SupportedSystems);
		Assert.Contains(GameSystem.N64, _format.SupportedSystems);
	}

	[Fact]
	public void CanRead_ReturnsTrue() {
		Assert.True(_format.CanRead);
	}

	[Fact]
	public void CanWrite_ReturnsTrue() {
		Assert.True(_format.CanWrite);
	}

	[Fact]
	public void Extensions_ContainsBk2() {
		Assert.Contains("bk2", _format.Extensions);
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_InvalidArchive_ThrowsException() {
		// BK2 files are ZIP archives
		var invalidData = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		using var stream = new MemoryStream(invalidData);

		await Assert.ThrowsAsync<InvalidDataException>(() => _format.ReadAsync(stream));
	}
}
