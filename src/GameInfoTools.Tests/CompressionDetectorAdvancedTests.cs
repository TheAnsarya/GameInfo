using GameInfoTools.Core;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CompressionDetector functionality.
/// </summary>
public class CompressionDetectorAdvancedTests {
	[Fact]
	public void Detect_UncompressedData_ReturnsNone() {
		// Random-looking data without compression patterns
		var data = new byte[100];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(((i * 7) + 13) % 256);
		}

		var result = CompressionDetector.Detect(data, 0);

		Assert.Equal(CompressionDetector.CompressionType.None, result.Type);
	}

	[Fact]
	public void Detect_InsufficientData_ReturnsNone() {
		var data = new byte[] { 0x01, 0x02, 0x03 };
		var result = CompressionDetector.Detect(data, 0);
		Assert.Equal(CompressionDetector.CompressionType.None, result.Type);
	}

	[Fact]
	public void Detect_NintendoLz_DetectsCorrectly() {
		// Nintendo LZ header: 0x10 + 24-bit decompressed size
		var data = new byte[] { 0x10, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00 };

		var result = CompressionDetector.Detect(data, 0);

		Assert.Equal(CompressionDetector.CompressionType.Lz10, result.Type);
		Assert.True(result.Confidence > 0.5);
	}

	[Fact]
	public void Detect_ReturnsDescriptiveMessage() {
		var data = new byte[100];
		var result = CompressionDetector.Detect(data, 0);

		Assert.NotNull(result.Description);
		Assert.NotEmpty(result.Description);
	}

	[Fact]
	public void DetectionResult_HasCorrectOffset() {
		var data = new byte[100];
		var result = CompressionDetector.Detect(data, 50);

		Assert.Equal(50, result.HeaderOffset);
	}

	[Fact]
	public void ScanForCompression_ReturnsListOfResults() {
		var data = new byte[1000];

		var results = CompressionDetector.ScanForCompression(data);

		Assert.NotNull(results);
	}

	[Fact]
	public void ScanForCompression_EmptyData_ReturnsEmpty() {
		var data = new byte[10]; // Less than minSize

		var results = CompressionDetector.ScanForCompression(data);

		Assert.Empty(results);
	}

	[Fact]
	public void CompressionType_HasExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.None));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Rle));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Lz77));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Huffman));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.LzNintendo));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Lzss));
	}

	[Fact]
	public void DecompressNintendoLz_InvalidHeader_ReturnsNull() {
		// Not a Nintendo LZ header
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00 };

		var result = CompressionDetector.DecompressNintendoLz(data, 0);

		Assert.Null(result);
	}

	[Fact]
	public void DecompressNintendoLz_ValidHeader_ReturnsData() {
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
	public void DecompressNintendoLz_OffsetOutOfBounds_ReturnsNull() {
		var data = new byte[] { 0x10 };

		var result = CompressionDetector.DecompressNintendoLz(data, 0);

		Assert.Null(result);
	}

	[Fact]
	public void Detect_HighEntropyData_ReturnsResult() {
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
	public void DetectionResult_Record_HasAllProperties() {
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

	#region LZ11 Tests

	[Fact]
	public void Detect_Lz11Header_DetectsCorrectly() {
		// Nintendo LZ11 header: 0x11 + 24-bit decompressed size
		var data = new byte[] { 0x11, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00 };

		var result = CompressionDetector.Detect(data, 0);

		Assert.Equal(CompressionDetector.CompressionType.Lz11, result.Type);
	}

	[Fact]
	public void IsNintendoLz10_ValidHeader_ReturnsTrue() {
		var data = new byte[] { 0x10, 0x00, 0x10, 0x00 };
		Assert.True(CompressionDetector.IsNintendoLz10(data, 0));
	}

	[Fact]
	public void IsNintendoLz10_InvalidHeader_ReturnsFalse() {
		var data = new byte[] { 0x11, 0x00, 0x10, 0x00 };
		Assert.False(CompressionDetector.IsNintendoLz10(data, 0));
	}

	[Fact]
	public void IsNintendoLz11_ValidHeader_ReturnsTrue() {
		var data = new byte[] { 0x11, 0x00, 0x10, 0x00 };
		Assert.True(CompressionDetector.IsNintendoLz11(data, 0));
	}

	[Fact]
	public void IsNintendoLz11_InvalidHeader_ReturnsFalse() {
		var data = new byte[] { 0x10, 0x00, 0x10, 0x00 };
		Assert.False(CompressionDetector.IsNintendoLz11(data, 0));
	}

	[Fact]
	public void DecompressLz11_InvalidHeader_ReturnsNull() {
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00 };
		Assert.Null(CompressionDetector.DecompressLz11(data, 0));
	}

	#endregion

	#region LZSS Tests

	[Fact]
	public void DecompressLzss_LiteralData_ReturnsOriginal() {
		// All literal bytes (no back-references)
		var data = new byte[] { 0x00, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48 };

		var result = CompressionDetector.DecompressLzss(data, 0, 100);

		Assert.NotNull(result);
		Assert.Equal(8, result.Length);
	}

	[Fact]
	public void CompressLzss_RoundTrip_PreservesData() {
		var original = new byte[100];
		for (int i = 0; i < 100; i++) {
			original[i] = (byte)(i % 16); // Repetitive data for better compression
		}

		var compressed = CompressionDetector.CompressLzss(original);
		var decompressed = CompressionDetector.DecompressLzss(compressed, 0, original.Length);

		Assert.NotNull(decompressed);
		Assert.Equal(original.Length, decompressed.Length);
		Assert.Equal(original, decompressed);
	}

	#endregion

	#region RLE Tests

	[Fact]
	public void CompressRle_RoundTrip_PreservesData() {
		var original = new byte[] { 0x41, 0x41, 0x41, 0x41, 0x41, 0x42, 0x43, 0x44 };

		var compressed = CompressionDetector.CompressRle(original);
		var decompressed = CompressionDetector.DecompressRle(compressed, 0);

		Assert.NotNull(decompressed);
		Assert.Equal(original, decompressed);
	}

	[Fact]
	public void CompressRle_AllSameByte_CompressesEfficiently() {
		var original = new byte[100];
		for (int i = 0; i < 100; i++) original[i] = 0xAA;

		var compressed = CompressionDetector.CompressRle(original);

		// Should be much smaller than original
		Assert.True(compressed.Length < original.Length / 2);
	}

	[Fact]
	public void DecompressRle_EmptyMarker_StopsCorrectly() {
		// RLE data ending with 0x00 marker
		var data = new byte[] { 0x03, 0x41, 0x42, 0x43, 0x44, 0x00 };

		var result = CompressionDetector.DecompressRle(data, 0);

		Assert.NotNull(result);
		Assert.Equal(4, result.Length);
	}

	#endregion

	#region Analysis Tests

	[Fact]
	public void Analyze_ReturnsStats() {
		var data = new byte[256];
		for (int i = 0; i < 256; i++) data[i] = (byte)i;

		var stats = CompressionDetector.Analyze(data, 0, 256);

		Assert.NotNull(stats);
		Assert.True(stats.Entropy > 0);
	}

	[Fact]
	public void Analyze_HighRepetition_HasLowEntropy() {
		var data = new byte[256];
		for (int i = 0; i < 256; i++) data[i] = 0xAA;

		var stats = CompressionDetector.Analyze(data, 0, 256);

		Assert.Equal(0, stats.Entropy);
	}

	[Fact]
	public void Analyze_HighVariation_HasHighEntropy() {
		var data = new byte[256];
		for (int i = 0; i < 256; i++) data[i] = (byte)i;

		var stats = CompressionDetector.Analyze(data, 0, 256);

		Assert.True(stats.Entropy > 7);
	}

	[Fact]
	public void CompressionStats_HasAllProperties() {
		var stats = new CompressionDetector.CompressionStats(5.5, 10, 100, 20, 0.75);

		Assert.Equal(5.5, stats.Entropy);
		Assert.Equal(10, stats.RunCount);
		Assert.Equal(100, stats.LiteralCount);
		Assert.Equal(20, stats.BackRefCount);
		Assert.Equal(0.75, stats.EstimatedRatio);
	}

	#endregion

	#region AutoDecompress Tests

	[Fact]
	public void AutoDecompress_Lz10_Decompresses() {
		// Valid Nintendo LZ10: 0x10 + size + literal flags
		var data = new byte[] {
			0x10, 0x04, 0x00, 0x00, // Header: type 0x10, size = 4
			0x00,                   // Flags: all literals
			0x41, 0x42, 0x43, 0x44  // Data: ABCD
		};

		var result = CompressionDetector.AutoDecompress(data, 0);

		Assert.NotNull(result);
		Assert.Equal(4, result.DecompressedSize);
	}

	[Fact]
	public void AutoDecompress_UnrecognizedFormat_ReturnsNull() {
		var data = new byte[100];
		for (int i = 0; i < 100; i++) data[i] = (byte)((i * 7 + 13) % 256);

		var result = CompressionDetector.AutoDecompress(data, 0);

		Assert.Null(result);
	}

	[Fact]
	public void DecompressionResult_HasAllProperties() {
		var result = new CompressionDetector.DecompressionResult(
			new byte[] { 1, 2, 3, 4 },
			10,
			4,
			0.4,
			"TestFormat"
		);

		Assert.Equal(4, result.Data.Length);
		Assert.Equal(10, result.CompressedSize);
		Assert.Equal(4, result.DecompressedSize);
		Assert.Equal(0.4, result.Ratio);
		Assert.Equal("TestFormat", result.Format);
	}

	#endregion

	#region Format Description Tests

	[Theory]
	[InlineData(CompressionDetector.CompressionType.None, "No compression")]
	[InlineData(CompressionDetector.CompressionType.Lz10, "Nintendo LZ10")]
	[InlineData(CompressionDetector.CompressionType.Lz11, "Nintendo LZ11")]
	[InlineData(CompressionDetector.CompressionType.Rle, "RLE")]
	[InlineData(CompressionDetector.CompressionType.Huffman, "Huffman")]
	public void GetFormatDescription_ReturnsDescription(CompressionDetector.CompressionType type, string expectedSubstring) {
		string description = CompressionDetector.GetFormatDescription(type);
		Assert.Contains(expectedSubstring, description);
	}

	#endregion

	#region New CompressionType Enum Values

	[Fact]
	public void CompressionType_HasNewValues() {
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Lz10));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Lz11));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Rle8));
		Assert.True(Enum.IsDefined(typeof(CompressionDetector.CompressionType), CompressionDetector.CompressionType.Lz4));
	}

	#endregion
}
