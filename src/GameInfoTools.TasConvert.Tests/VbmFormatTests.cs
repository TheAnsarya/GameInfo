using GameInfoTools.TasConvert.Core;
using GameInfoTools.TasConvert.Formats.GameBoy;

namespace GameInfoTools.TasConvert.Tests;

/// <summary>
/// Tests for VBA-RR VBM format reader/writer.
/// </summary>
public class VbmFormatTests {
	private readonly VbmFormat _format = new();

	[Fact]
	public void Name_ReturnsVBM() {
		Assert.Equal("VBM", _format.Name);
	}

	[Fact]
	public void EmulatorName_ReturnsVBA_RR() {
		Assert.Equal("VBA-RR", _format.EmulatorName);
	}

	[Fact]
	public void MatchesExtension_VbmFile_ReturnsTrue() {
		Assert.True(_format.MatchesExtension(".vbm"));
		Assert.True(_format.MatchesExtension(".VBM"));
		Assert.True(_format.MatchesExtension("vbm"));
	}

	[Fact]
	public void MatchesExtension_NonVbmFile_ReturnsFalse() {
		Assert.False(_format.MatchesExtension(".fm2"));
		Assert.False(_format.MatchesExtension(".bk2"));
		Assert.False(_format.MatchesExtension(".smv"));
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_InvalidSignature_ThrowsException() {
		// VBM files must start with "VBM\x1A"
		var invalidData = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		using var stream = new MemoryStream(invalidData);

		await Assert.ThrowsAsync<InvalidDataException>(() => _format.ReadAsync(stream));
	}

	[Fact]
	public void SupportedSystems_ContainsGameBoy() {
		Assert.Contains(GameSystem.GameBoy, _format.SupportedSystems);
		Assert.Contains(GameSystem.GameBoyColor, _format.SupportedSystems);
		Assert.Contains(GameSystem.GameBoyAdvance, _format.SupportedSystems);
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
	public void Extensions_ContainsVbm() {
		Assert.Contains("vbm", _format.Extensions);
	}
}
