using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CompressionDetector functionality.
/// </summary>
public class CompressionDetectorAdvancedTests
{
	[Fact]
	public void Detect_UncompressedData_ReturnsNone()
	{
		// Random-looking data without compression patterns
		var data = new byte[100];
		for (int i = 0; i < data.Length; i++)
		{
			data[i] = (byte)((i * 7 + 13) % 256);
		}

		var result = CompressionDetector.Detect(data, 0);

		Assert.Equal(CompressionDetector.CompressionType.None, result.Type);
	}

	[Fact]
	public void Detect_InsufficientData_ReturnsNone()
	{
		var data = new byte[] { 0x01, 0x02, 0x03 };
		var result = CompressionDetector.Detect(data, 0);
		Assert.Equal(CompressionDetector.CompressionType.None, result.Type);
	}

	[Fact]
	public void Detect_NintendoLz_DetectsCorrectly()
	{
		// Nintendo LZ header: 0x10 + 24-bit decompressed size
		var data = new byte[] { 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00 };

		var result = CompressionDetector.Detect(data, 0);

		Assert.Equal(CompressionDetector.CompressionType.LzNintendo, result.Type);
		Assert.True(result.Confidence > 0.5);
	}

	[Fact]
	public void Detect_ReturnsDescriptiveMessage()
	{
		var data = new byte[100];
		var result = CompressionDetector.Detect(data, 0);

		Assert.NotNull(result.Description);
		Assert.NotEmpty(result.Description);
	}

	[Fact]
	public void DetectionResult_HasCorrectOffset()
	{
		var data = new byte[100];
		var result = CompressionDetector.Detect(data, 50);

		Assert.Equal(50, result.HeaderOffset);
	}

	[Fact]
	public void ScanForCompression_ReturnsListOfResults()
	{
		var data = new byte[1000];

		var results = CompressionDetector.ScanForCompression(data);

		Assert.NotNull(results);
	}

	[Fact]
	public void ScanForCompression_EmptyData_ReturnsEmpty()
	{
		var data = new byte[10]; // Less than minSize

		var results = CompressionDetector.ScanForCompression(data);

		Assert.Empty(results);
	}

	[Fact]
	public void CompressionType_HasExpectedValues()
	{
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.None));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Rle));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Lz77));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Huffman));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.LzNintendo));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Lzss));
	}

	[Fact]
	public void DecompressNintendoLz_InvalidHeader_ReturnsNull()
	{
		// Not a Nintendo LZ header
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00 };

		var result = CompressionDetector.DecompressNintendoLz(data, 0);

		Assert.Null(result);
	}

	[Fact]
	public void DecompressNintendoLz_ValidHeader_ReturnsData()
	{
		// Valid Nintendo LZ: 0x10 + size + literal flags
		var data = new byte[] {
			0x10, 0x04, 0x00, 0x00, // Header: type 0x10, size = 4
			0x00,                   // Flags: all literals
			0x41, 0x42, 0x43, 0x44  // Data: ABCD
		};

		var result = CompressionDetector.DecompressNintendoLz(data, 0);

		Assert.NotNull(result);
		Assert.Equal(4, result.Length);
	}

	[Fact]
	public void DecompressNintendoLz_OffsetOutOfBounds_ReturnsNull()
	{
		var data = new byte[] { 0x10 };

		var result = CompressionDetector.DecompressNintendoLz(data, 0);

		Assert.Null(result);
	}

	[Fact]
	public void Detect_HighEntropyData_ReturnsResult()
	{
		// Create high-entropy data (looks random/encrypted)
		var data = new byte[256];
		var random = new Random(42);
		random.NextBytes(data);

		var result = CompressionDetector.Detect(data, 0);

		// High entropy data should return some result
		Assert.NotNull(result);
		Assert.NotNull(result.Description);
	}

	[Fact]
	public void DetectionResult_Record_HasAllProperties()
	{
		var result = new CompressionDetector.DetectionResult(
			CompressionDetector.CompressionType.Rle,
			0.85,
			0x1000,
			"Test description"
		);

		Assert.Equal(CompressionDetector.CompressionType.Rle, result.Type);
		Assert.Equal(0.85, result.Confidence);
		Assert.Equal(0x1000, result.HeaderOffset);
		Assert.Equal("Test description", result.Description);
	}
}
