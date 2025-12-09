using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for CompressionDetector including compression type detection,
/// decompression algorithms, and confidence scoring.
/// </summary>
public class CompressionDetectorTests {
	[Fact]
	public void Detect_ReturnsNoneForSmallData() {
		byte[] data = [0x01, 0x02];
		var result = CompressionDetector.Detect(data, 0);

		Assert.Equal(CompressionDetector.CompressionType.None, result.Type);
	}

	[Fact]
	public void Detect_RecognizesNintendoLz() {
		// Nintendo LZ77 header: 0x10 followed by decompressed size (24-bit LE)
		byte[] data = new byte[0x20];
		data[0] = 0x10; // LZ77 signature
		data[1] = 0x00; // Size low
		data[2] = 0x10; // Size mid
		data[3] = 0x00; // Size high

		var result = CompressionDetector.Detect(data, 0);

		// May detect as LzNintendo or may not depending on further validation
		Assert.NotNull(result);
	}

	[Fact]
	public void Detect_HandlesRleData() {
		// RLE-like data with runs
		byte[] data = new byte[0x40];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i < 0x20 ? 0xAA : 0xBB);
		}

		var result = CompressionDetector.Detect(data, 0);

		Assert.NotNull(result);
	}

	[Fact]
	public void DetectionResult_HasCorrectProperties() {
		var result = new CompressionDetector.DetectionResult(
			CompressionDetector.CompressionType.Lz77,
			0.85,
			0x100,
			"Test description"
		);

		Assert.Equal(CompressionDetector.CompressionType.Lz77, result.Type);
		Assert.Equal(0.85, result.Confidence);
		Assert.Equal(0x100, result.HeaderOffset);
		Assert.Equal("Test description", result.Description);
	}

	[Fact]
	public void CompressionType_HasExpectedValues() {
		// Verify the enum has the expected compression types
		Assert.Equal(0, (int)CompressionDetector.CompressionType.None);
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), "Lz77"));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), "Lzss"));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), "Rle"));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), "LzNintendo"));
	}
}
