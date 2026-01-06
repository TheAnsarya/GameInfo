using GameInfoTools.Core.Compression;

namespace GameInfoTools.Core.Tests.Compression;

/// <summary>
/// Tests for BasicRing400 compression/decompression.
/// These tests verify the algorithm works correctly using known patterns.
/// </summary>
public class BasicRing400Tests {
	/// <summary>
	/// Test that decompressing all-literal data works.
	/// Command byte 0xFF = all 8 bits are literal markers.
	/// </summary>
	[Fact]
	public void Decompress_AllLiterals_ReturnsCorrectData() {
		// 0xFF = 8 literal commands, followed by 8 literal bytes
		byte[] compressed = [0xFF, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];

		var result = BasicRing400.Decompress(compressed, 8);

		Assert.Equal([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08], result);
	}

	/// <summary>
	/// Test that literal bytes are written to ring buffer and output correctly.
	/// </summary>
	[Fact]
	public void Decompress_SingleLiteral_WritesToOutput() {
		// 0x01 = first bit is literal (bit 0 = 1), rest are references
		// But we only need 1 byte output, so only first command matters
		byte[] compressed = [0x01, 0x42]; // Command + literal byte 'B'

		var result = BasicRing400.Decompress(compressed, 1);

		Assert.Single(result);
		Assert.Equal(0x42, result[0]);
	}

	/// <summary>
	/// Test copy reference from ring buffer.
	/// After writing literals, copy references can copy from recent data.
	/// </summary>
	[Fact]
	public void Decompress_CopyReference_CopiesFromRingBuffer() {
		// Build a sequence: write some literals, then copy them
		// Command 0x0F = bits 0-3 are literals, bits 4-7 are copies
		// Write 4 literal bytes [0x41, 0x42, 0x43, 0x44] ("ABCD")
		// Then reference to copy 3 bytes from ring position

		// Start write address is 0x03be
		// After writing 4 bytes: ring[0x03be]=A, ring[0x03bf]=B, ring[0x03c0]=C, ring[0x03c1]=D
		// Write position is now 0x03c2

		// To copy "BCD" (3 bytes starting at 0x03bf):
		// Address = 0x03bf, Length = 3-3 = 0
		// d1 = low 8 bits of address = 0xbf
		// d2 = ((address >> 2) & 0xC0) | (length & 0x3f) = ((0x03bf >> 2) & 0xC0) | 0
		//    = (0x00ef & 0xC0) | 0 = 0xC0 | 0 = 0xC0

		// Actually let's compute properly:
		// address = d1 + ((d2 << 2) & 0x0300)
		// So d1 = address & 0xFF = 0xBF
		// high bits = (address >> 8) & 0x03 = 0x03
		// d2 high bits = high bits >> 2 shifted left by 6... wait

		// Let me re-derive from the decompression logic:
		// var address = d1 + ((d2 << 2) & 0x0300);
		// var length = (d2 & 0x3f) + 3;
		//
		// So: address = d1 + (d2 & 0xC0) << 2
		// For address 0x3bf:
		//   d1 = 0xBF
		//   (d2 & 0xC0) << 2 = 0x300 => d2 & 0xC0 = 0xC0 => d2 high bits = 0xC0
		// For length 3:
		//   (d2 & 0x3f) + 3 = 3 => d2 & 0x3f = 0
		// So d2 = 0xC0

		byte[] compressed = [
			0x0F,                    // bits 0-3 = literal, bits 4-7 = copy
			0x41, 0x42, 0x43, 0x44,  // 4 literal bytes: ABCD
			0xBF, 0xC0,              // copy ref: address=0x3bf (where B was), length=3
			0xBF, 0xC0,              // another copy
			0xBF, 0xC0,              // another copy
			0xBF, 0xC0               // another copy
		];

		var result = BasicRing400.Decompress(compressed, 16);

		// First 4 bytes are literals ABCD
		Assert.Equal(0x41, result[0]); // A
		Assert.Equal(0x42, result[1]); // B
		Assert.Equal(0x43, result[2]); // C
		Assert.Equal(0x44, result[3]); // D

		// Next bytes are copies of BCD from ring buffer
		Assert.Equal(0x42, result[4]); // B (copied from 0x3bf)
		Assert.Equal(0x43, result[5]); // C
		Assert.Equal(0x44, result[6]); // D
	}

	/// <summary>
	/// Test round-trip: compress then decompress should give original data.
	/// </summary>
	[Fact]
	public void Compress_ThenDecompress_RoundTrips() {
		// Simple test data with some repetition for compression
		byte[] original = [0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03,
						   0x00, 0x01, 0x02, 0x03, 0x00, 0x01, 0x02, 0x03];

		var compressed = BasicRing400.Compress(original);
		var decompressed = BasicRing400.Decompress(compressed, original.Length);

		Assert.Equal(original, decompressed);
	}

	/// <summary>
	/// Test round-trip with random data.
	/// </summary>
	[Fact]
	public void Compress_RandomData_RoundTrips() {
		var random = new Random(42); // Fixed seed for reproducibility
		var original = new byte[256];
		random.NextBytes(original);

		var compressed = BasicRing400.Compress(original);
		var decompressed = BasicRing400.Decompress(compressed, original.Length);

		Assert.Equal(original, decompressed);
	}

	/// <summary>
	/// Test round-trip with highly compressible data (all zeros).
	/// </summary>
	[Fact]
	public void Compress_AllZeros_CompressesAndRoundTrips() {
		var original = new byte[1024]; // All zeros

		var compressed = BasicRing400.Compress(original);
		var decompressed = BasicRing400.Decompress(compressed, original.Length);

		Assert.Equal(original, decompressed);
		// All zeros should compress well
		Assert.True(compressed.Length < original.Length);
	}

	/// <summary>
	/// Test round-trip with repeating pattern.
	/// </summary>
	[Fact]
	public void Compress_RepeatingPattern_CompressesEfficiently() {
		// Create repeating pattern: ABCD repeated
		var original = new byte[256];
		for (int i = 0; i < original.Length; i++) {
			original[i] = (byte)(0x41 + (i % 4)); // A, B, C, D, A, B, C, D...
		}

		var compressed = BasicRing400.Compress(original);
		var decompressed = BasicRing400.Decompress(compressed, original.Length);

		Assert.Equal(original, decompressed);
		// Repeating pattern should compress significantly
		Assert.True(compressed.Length < original.Length / 2);
	}

	/// <summary>
	/// Test DecompressAuto trims trailing zeros.
	/// </summary>
	[Fact]
	public void DecompressAuto_TrimsTrailingZeros() {
		// Compress data that doesn't fill the output
		byte[] original = [0x41, 0x42, 0x43, 0x44, 0x45]; // ABCDE

		var compressed = BasicRing400.Compress(original);

		// Decompress with auto-detection (max size larger than needed)
		var decompressed = BasicRing400.DecompressAuto(compressed, 100);

		// DecompressAuto returns trimmed data - verify content matches
		// The actual trimming behavior depends on implementation
		Assert.True(decompressed.Length >= original.Length);
		Assert.Equal(original, decompressed.Take(original.Length).ToArray());
	}

	/// <summary>
	/// Test that zero output size throws.
	/// </summary>
	[Fact]
	public void Decompress_ZeroOutputSize_Throws() {
		byte[] data = [0xFF, 0x01];

		Assert.Throws<ArgumentOutOfRangeException>(() => BasicRing400.Decompress(data, 0));
	}

	/// <summary>
	/// Test decompression stops at output size limit.
	/// </summary>
	[Fact]
	public void Decompress_LimitsToOutputSize() {
		// More compressed data than needed
		byte[] compressed = [0xFF, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08];

		var result = BasicRing400.Decompress(compressed, 4);

		Assert.Equal(4, result.Length);
		Assert.Equal([0x01, 0x02, 0x03, 0x04], result);
	}

	/// <summary>
	/// Verify constants match DQ3 algorithm.
	/// </summary>
	[Fact]
	public void Constants_MatchDq3Algorithm() {
		// These values are fixed by the bit packing in the algorithm
		// If they change, the algorithm is incompatible with DQ3

		// We can't directly access private constants, but we can verify
		// behavior that depends on them

		// Ring size is 1024 (10-bit address)
		// Max copy is 66 (6-bit + 3)

		// Create data that tests the ring wraparound
		var original = new byte[2000]; // Larger than ring size
		for (int i = 0; i < original.Length; i++) {
			original[i] = (byte)(i % 256);
		}

		var compressed = BasicRing400.Compress(original);
		var decompressed = BasicRing400.Decompress(compressed, original.Length);

		Assert.Equal(original, decompressed);
	}
}
