namespace GameInfoTools.Core;

/// <summary>
/// Compression algorithm detection and decompression.
/// </summary>
public static class CompressionDetector {
	/// <summary>
	/// Common compression types found in retro games.
	/// </summary>
	public enum CompressionType {
		None,
		Lz77,          // Generic LZ77
		Lzss,          // LZSS variant
		Rle,           // Run-length encoding
		Huffman,       // Huffman coding
		LzNintendo,    // Nintendo's LZ (GBA/DS)
		LzKonami,      // Konami's compression
		LzSquare,      // Square's compression
		LzCapcom,      // Capcom's compression
		Dte,           // Dual-tile encoding (text)
		Custom         // Unknown/custom
	}

	/// <summary>
	/// Detection result with confidence score.
	/// </summary>
	public record DetectionResult(CompressionType Type, double Confidence, int HeaderOffset, string Description);

	/// <summary>
	/// Detect compression type at a specific offset.
	/// </summary>
	public static DetectionResult Detect(byte[] data, int offset) {
		if (offset + 4 > data.Length)
			return new DetectionResult(CompressionType.None, 0, offset, "Insufficient data");

		// Check for Nintendo LZ (0x10 header)
		if (data[offset] == 0x10) {
			int size = data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16);
			if (size > 0 && size < 0x100000) {
				return new DetectionResult(CompressionType.LzNintendo, 0.9, offset, $"Nintendo LZ77, decompressed size: {size}");
			}
		}

		// Check for RLE patterns
		double rleScore = CheckRlePattern(data, offset);
		if (rleScore > 0.7) {
			return new DetectionResult(CompressionType.Rle, rleScore, offset, "RLE compression detected");
		}

		// Check for LZSS-style back-references
		double lzScore = CheckLzPattern(data, offset);
		if (lzScore > 0.6) {
			return new DetectionResult(CompressionType.Lzss, lzScore, offset, "LZSS-style compression");
		}

		// Check entropy for possible Huffman
		double entropy = CalculateEntropy(data, offset, Math.Min(256, data.Length - offset));
		if (entropy > 7.5) {
			return new DetectionResult(CompressionType.Huffman, 0.5, offset, $"High entropy ({entropy:f2}), possibly Huffman or encrypted");
		}

		return new DetectionResult(CompressionType.None, 0, offset, "No compression detected");
	}

	/// <summary>
	/// Scan ROM for compressed data regions.
	/// </summary>
	public static List<DetectionResult> ScanForCompression(byte[] data, int minSize = 64) {
		var results = new List<DetectionResult>();

		for (int i = 0; i < data.Length - minSize; i += 16) {
			var result = Detect(data, i);
			if (result.Confidence > 0.6) {
				results.Add(result);
				// Skip ahead to avoid duplicate detections
				i += minSize;
			}
		}

		return results;
	}

	private static double CheckRlePattern(byte[] data, int offset) {
		int length = Math.Min(128, data.Length - offset);
		int rleRuns = 0;
		int totalBytes = 0;

		int i = 0;
		while (i < length - 2) {
			// Look for RLE header patterns (length byte followed by data)
			byte potentialLength = data[offset + i];
			if (potentialLength >= 3 && potentialLength <= 127) {
				// Check if this could be a run
				if (i + 2 < length) {
					byte next1 = data[offset + i + 1];
					byte next2 = data[offset + i + 2];

					// Same byte repeated?
					if (next1 == next2) {
						rleRuns++;
						totalBytes += potentialLength;
					}
				}
			}
			i++;
		}

		return totalBytes > 0 ? Math.Min(1.0, (double)rleRuns / (length / 8)) : 0;
	}

	private static double CheckLzPattern(byte[] data, int offset) {
		int length = Math.Min(256, data.Length - offset);
		int backRefCount = 0;

		for (int i = 0; i < length - 2; i++) {
			// Look for typical LZSS flag bytes and back-references
			// Back-references often have high bits set
			int word = data[offset + i] | (data[offset + i + 1] << 8);

			// Check for patterns that look like offset/length pairs
			int possibleOffset = word & 0x0fff;
			int possibleLength = (word >> 12) + 3;

			if (possibleOffset > 0 && possibleOffset <= i && possibleLength >= 3 && possibleLength <= 18) {
				backRefCount++;
			}
		}

		return Math.Min(1.0, (double)backRefCount / (length / 16));
	}

	private static double CalculateEntropy(byte[] data, int offset, int length) {
		var counts = new int[256];
		for (int i = 0; i < length; i++) {
			counts[data[offset + i]]++;
		}

		double entropy = 0;
		for (int i = 0; i < 256; i++) {
			if (counts[i] > 0) {
				double p = (double)counts[i] / length;
				entropy -= p * Math.Log2(p);
			}
		}

		return entropy;
	}

	/// <summary>
	/// Decompress Nintendo LZ77 data.
	/// </summary>
	public static byte[]? DecompressNintendoLz(byte[] data, int offset) {
		if (offset + 4 > data.Length || data[offset] != 0x10)
			return null;

		int size = data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16);
		if (size <= 0 || size > 0x100000)
			return null;

		var output = new byte[size];
		int srcPos = offset + 4;
		int dstPos = 0;

		while (dstPos < size && srcPos < data.Length) {
			byte flags = data[srcPos++];

			for (int bit = 7; bit >= 0 && dstPos < size; bit--) {
				if ((flags & (1 << bit)) != 0) {
					// Compressed block (back-reference)
					if (srcPos + 2 > data.Length)
						break;

					int block = (data[srcPos] << 8) | data[srcPos + 1];
					srcPos += 2;

					int length = ((block >> 12) & 0xf) + 3;
					int displacement = (block & 0xfff) + 1;

					for (int j = 0; j < length && dstPos < size; j++) {
						output[dstPos] = output[dstPos - displacement];
						dstPos++;
					}
				} else {
					// Literal byte
					if (srcPos >= data.Length)
						break;
					output[dstPos++] = data[srcPos++];
				}
			}
		}

		return dstPos == size ? output : null;
	}

	/// <summary>
	/// Decompress simple RLE data.
	/// </summary>
	public static byte[]? DecompressRle(byte[] data, int offset, int maxOutput = 0x10000) {
		var output = new List<byte>();
		int pos = offset;

		while (pos < data.Length && output.Count < maxOutput) {
			byte header = data[pos++];

			if (header == 0)
				break; // End marker

			if ((header & 0x80) != 0) {
				// Run of same byte
				int length = (header & 0x7f) + 1;
				if (pos >= data.Length)
					break;
				byte value = data[pos++];

				for (int i = 0; i < length; i++)
					output.Add(value);
			} else {
				// Literal bytes
				int length = header + 1;
				for (int i = 0; i < length && pos < data.Length; i++)
					output.Add(data[pos++]);
			}
		}

		return output.ToArray();
	}

	/// <summary>
	/// Compress data with RLE.
	/// </summary>
	public static byte[] CompressRle(byte[] data) {
		var output = new List<byte>();
		int i = 0;

		while (i < data.Length) {
			// Check for run
			int runLength = 1;
			while (i + runLength < data.Length && data[i + runLength] == data[i] && runLength < 128) {
				runLength++;
			}

			if (runLength >= 3) {
				// Encode as run
				output.Add((byte)(0x80 | (runLength - 1)));
				output.Add(data[i]);
				i += runLength;
			} else {
				// Encode as literals
				int literalStart = i;
				int literalLength = 0;

				while (i < data.Length && literalLength < 128) {
					// Check if a run starts
					int nextRun = 1;
					while (i + nextRun < data.Length && data[i + nextRun] == data[i] && nextRun < 3) {
						nextRun++;
					}

					if (nextRun >= 3)
						break;

					i++;
					literalLength++;
				}

				if (literalLength > 0) {
					output.Add((byte)(literalLength - 1));
					for (int j = 0; j < literalLength; j++)
						output.Add(data[literalStart + j]);
				}
			}
		}

		output.Add(0); // End marker
		return output.ToArray();
	}
}
