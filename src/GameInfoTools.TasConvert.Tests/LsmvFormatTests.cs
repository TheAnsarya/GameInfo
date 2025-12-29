using GameInfoTools.TasConvert.Core;
using GameInfoTools.TasConvert.Formats.Snes;

namespace GameInfoTools.TasConvert.Tests;

/// <summary>
/// Tests for lsnes LSMV format reader/writer.
/// </summary>
public class LsmvFormatTests {
	private readonly LsmvFormat _format = new();

	[Fact]
	public void Name_ReturnsLSMV() {
		Assert.Equal("LSMV", _format.Name);
	}

	[Fact]
	public void EmulatorName_ReturnsLsnes() {
		Assert.Equal("lsnes", _format.EmulatorName);
	}

	[Fact]
	public void MatchesExtension_LsmvFile_ReturnsTrue() {
		Assert.True(_format.MatchesExtension(".lsmv"));
		Assert.True(_format.MatchesExtension(".LSMV"));
		Assert.True(_format.MatchesExtension("lsmv"));
	}

	[Fact]
	public void MatchesExtension_NonLsmvFile_ReturnsFalse() {
		Assert.False(_format.MatchesExtension(".fm2"));
		Assert.False(_format.MatchesExtension(".bk2"));
		Assert.False(_format.MatchesExtension(".smv"));
	}

	[Fact]
	public void SupportedSystems_ContainsSNESAndGameBoy() {
		Assert.Contains(GameSystem.Snes, _format.SupportedSystems);
		Assert.Contains(GameSystem.GameBoy, _format.SupportedSystems);
		Assert.Contains(GameSystem.GameBoyColor, _format.SupportedSystems);
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
	public void Extensions_ContainsLsmv() {
		Assert.Contains("lsmv", _format.Extensions);
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_InvalidArchive_ThrowsException() {
		// LSMV files are ZIP archives
		var invalidData = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		using var stream = new MemoryStream(invalidData);

		await Assert.ThrowsAsync<InvalidDataException>(() => _format.ReadAsync(stream));
	}
}
