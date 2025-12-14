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
		Lz10,          // GBA LZ10 (same as LzNintendo)
		Lz11,          // GBA/DS LZ11 (extended)
		Rle8,          // 8-bit RLE variant
		Lz4,           // LZ4 format
		Custom         // Unknown/custom
	}

	/// <summary>
	/// Detection result with confidence score.
	/// </summary>
	public record DetectionResult(CompressionType Type, double Confidence, int HeaderOffset, string Description);

	/// <summary>
	/// Decompression result containing output and statistics.
	/// </summary>
	public record DecompressionResult(byte[] Data, int CompressedSize, int DecompressedSize, double Ratio, string Format);

	/// <summary>
	/// Compression statistics for analysis.
	/// </summary>
	public record CompressionStats(
		double Entropy,
		int RunCount,
		int LiteralCount,
		int BackRefCount,
		double EstimatedRatio
	);

	/// <summary>
	/// Detect compression type at a specific offset.
	/// </summary>
	public static DetectionResult Detect(byte[] data, int offset) {
		if (offset + 4 > data.Length)
			return new DetectionResult(CompressionType.None, 0, offset, "Insufficient data");

		// Check for Nintendo LZ10 (0x10 header)
		if (data[offset] == 0x10) {
			int size = data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16);
			if (size > 0 && size < 0x1000000) {
				return new DetectionResult(CompressionType.Lz10, 0.9, offset, $"Nintendo LZ10, decompressed size: {size} bytes");
			}
		}

		// Check for Nintendo LZ11 (0x11 header)
		if (data[offset] == 0x11) {
			int size = data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16);
			if (size > 0 && size < 0x1000000) {
				return new DetectionResult(CompressionType.Lz11, 0.9, offset, $"Nintendo LZ11, decompressed size: {size} bytes");
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

	#region LZSS Decompression

	/// <summary>
	/// Decompress generic LZSS data with configurable parameters.
	/// </summary>
	/// <param name="data">Compressed data.</param>
	/// <param name="offset">Start offset.</param>
	/// <param name="maxOutput">Maximum output size.</param>
	/// <param name="windowBits">Window size bits (default 12 = 4KB).</param>
	/// <param name="lengthBits">Length bits (default 4).</param>
	/// <param name="minMatch">Minimum match length (default 3).</param>
	/// <returns>Decompressed data or null if failed.</returns>
	public static byte[]? DecompressLzss(byte[] data, int offset, int maxOutput = 0x10000, int windowBits = 12, int lengthBits = 4, int minMatch = 3) {
		var output = new List<byte>();
		int pos = offset;
		int windowSize = 1 << windowBits;

		while (pos < data.Length && output.Count < maxOutput) {
			byte flags = data[pos++];

			for (int bit = 0; bit < 8 && pos < data.Length && output.Count < maxOutput; bit++) {
				if ((flags & (1 << bit)) == 0) {
					// Literal byte
					output.Add(data[pos++]);
				} else {
					// Back-reference
					if (pos + 2 > data.Length)
						break;

					int word = data[pos] | (data[pos + 1] << 8);
					pos += 2;

					int displacement = word & ((1 << windowBits) - 1);
					int length = ((word >> windowBits) & ((1 << lengthBits) - 1)) + minMatch;

					if (displacement == 0)
						displacement = windowSize;

					int srcPos = output.Count - displacement;
					if (srcPos < 0)
						return null; // Invalid reference

					for (int j = 0; j < length && output.Count < maxOutput; j++) {
						output.Add(output[srcPos + (j % displacement)]);
					}
				}
			}
		}

		return output.ToArray();
	}

	/// <summary>
	/// Compress data using LZSS algorithm.
	/// </summary>
	/// <param name="data">Data to compress.</param>
	/// <param name="windowBits">Window size bits (default 12).</param>
	/// <param name="lengthBits">Length bits (default 4).</param>
	/// <param name="minMatch">Minimum match length (default 3).</param>
	/// <returns>Compressed data.</returns>
	public static byte[] CompressLzss(byte[] data, int windowBits = 12, int lengthBits = 4, int minMatch = 3) {
		var output = new List<byte>();
		int windowSize = 1 << windowBits;
		int maxLength = (1 << lengthBits) - 1 + minMatch;
		int i = 0;

		while (i < data.Length) {
			var block = new List<byte>();
			byte flags = 0;

			for (int bit = 0; bit < 8 && i < data.Length; bit++) {
				// Find best match in window
				int bestOffset = 0;
				int bestLength = 0;

				int searchStart = Math.Max(0, i - windowSize);
				for (int j = searchStart; j < i; j++) {
					int matchLen = 0;
					while (matchLen < maxLength && i + matchLen < data.Length && data[j + (matchLen % (i - j))] == data[i + matchLen]) {
						matchLen++;
					}

					if (matchLen >= minMatch && matchLen > bestLength) {
						bestOffset = i - j;
						bestLength = matchLen;
					}
				}

				if (bestLength >= minMatch) {
					// Back-reference
					flags |= (byte)(1 << bit);
					int word = (bestOffset & ((1 << windowBits) - 1)) | (((bestLength - minMatch) & ((1 << lengthBits) - 1)) << windowBits);
					block.Add((byte)(word & 0xff));
					block.Add((byte)((word >> 8) & 0xff));
					i += bestLength;
				} else {
					// Literal
					block.Add(data[i++]);
				}
			}

			output.Add(flags);
			output.AddRange(block);
		}

		return output.ToArray();
	}

	#endregion

	#region LZ11 Support

	/// <summary>
	/// Decompress Nintendo LZ11 format (extended LZ).
	/// LZ11 uses 0x11 header and supports larger back-references.
	/// </summary>
	public static byte[]? DecompressLz11(byte[] data, int offset) {
		if (offset + 4 > data.Length || data[offset] != 0x11)
			return null;

		int size = data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16);
		if (size <= 0 || size > 0x1000000)
			return null;

		var output = new byte[size];
		int srcPos = offset + 4;
		int dstPos = 0;

		while (dstPos < size && srcPos < data.Length) {
			byte flags = data[srcPos++];

			for (int bit = 7; bit >= 0 && dstPos < size; bit--) {
				if ((flags & (1 << bit)) != 0) {
					// Compressed block
					if (srcPos >= data.Length)
						break;

					byte indicator = data[srcPos];

					int length, displacement;

					if ((indicator >> 4) == 0) {
						// Extended format (3 bytes)
						if (srcPos + 3 > data.Length)
							break;
						length = ((indicator & 0x0f) << 4) | (((data[srcPos + 1] >> 4) & 0x0f) + 0x11);
						displacement = ((data[srcPos + 1] & 0x0f) << 8) | (data[srcPos + 2] + 1);
						srcPos += 3;
					} else if ((indicator >> 4) == 1) {
						// Extra-extended format (4 bytes)
						if (srcPos + 4 > data.Length)
							break;
						length = ((indicator & 0x0f) << 12) | (data[srcPos + 1] << 4) | (((data[srcPos + 2] >> 4) & 0x0f) + 0x111);
						displacement = ((data[srcPos + 2] & 0x0f) << 8) | (data[srcPos + 3] + 1);
						srcPos += 4;
					} else {
						// Standard format (2 bytes)
						if (srcPos + 2 > data.Length)
							break;
						length = ((indicator >> 4) & 0x0f) + 1;
						displacement = ((indicator & 0x0f) << 8) | (data[srcPos + 1] + 1);
						srcPos += 2;
					}

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

	#endregion

	#region Analysis Methods

	/// <summary>
	/// Analyze data and return compression statistics.
	/// </summary>
	public static CompressionStats Analyze(byte[] data, int offset, int length) {
		if (offset + length > data.Length)
			length = data.Length - offset;

		double entropy = CalculateEntropy(data, offset, length);
		int runCount = CountRuns(data, offset, length);
		int backRefCount = CountPotentialBackRefs(data, offset, length);
		int literalCount = length - (runCount * 3); // Rough estimate

		// Estimate compression ratio based on patterns
		double estimatedRatio = EstimateCompressionRatio(entropy, runCount, backRefCount, length);

		return new CompressionStats(entropy, runCount, literalCount, backRefCount, estimatedRatio);
	}

	private static int CountRuns(byte[] data, int offset, int length) {
		int runs = 0;
		int i = 0;

		while (i < length - 2) {
			int runLen = 1;
			while (i + runLen < length && data[offset + i + runLen] == data[offset + i]) {
				runLen++;
			}

			if (runLen >= 3) {
				runs++;
				i += runLen;
			} else {
				i++;
			}
		}

		return runs;
	}

	private static int CountPotentialBackRefs(byte[] data, int offset, int length) {
		int refs = 0;

		for (int i = 3; i < length - 2; i++) {
			// Check for 3+ byte matches in the preceding data
			for (int j = Math.Max(0, i - 4096); j < i - 2; j++) {
				if (offset + j + 2 < data.Length &&
					offset + i + 2 < data.Length &&
					data[offset + j] == data[offset + i] &&
					data[offset + j + 1] == data[offset + i + 1] &&
					data[offset + j + 2] == data[offset + i + 2]) {
					refs++;
					break;
				}
			}
		}

		return refs;
	}

	private static double EstimateCompressionRatio(double entropy, int runs, int backRefs, int length) {
		// Low entropy and many patterns = good compression
		double entropyFactor = 1 - (entropy / 8.0);
		double patternFactor = (runs + backRefs) / (double)length * 10;

		return Math.Max(0.1, Math.Min(1.0, 0.5 + (entropyFactor * 0.3) + (patternFactor * 0.2)));
	}

	/// <summary>
	/// Try to auto-decompress data using detected format.
	/// </summary>
	public static DecompressionResult? AutoDecompress(byte[] data, int offset) {
		var detection = Detect(data, offset);

		byte[]? result = detection.Type switch {
			CompressionType.LzNintendo or CompressionType.Lz10 => DecompressNintendoLz(data, offset),
			CompressionType.Lz11 => DecompressLz11(data, offset),
			CompressionType.Rle or CompressionType.Rle8 => DecompressRle(data, offset),
			CompressionType.Lzss => DecompressLzss(data, offset),
			_ => null
		};

		if (result == null)
			return null;

		// Calculate compressed size (estimate based on decompressed size ratio)
		int compressedSize = FindCompressedEnd(data, offset, detection.Type);

		return new DecompressionResult(
			result,
			compressedSize,
			result.Length,
			(double)result.Length / compressedSize,
			detection.Type.ToString()
		);
	}

	private static int FindCompressedEnd(byte[] data, int offset, CompressionType type) {
		// Rough estimate - actual implementation would track decompression position
		return type switch {
			CompressionType.LzNintendo or CompressionType.Lz10 =>
				Math.Min(data.Length - offset, 4 + ((data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16)) / 2)),
			CompressionType.Lz11 =>
				Math.Min(data.Length - offset, 4 + ((data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16)) / 2)),
			_ => Math.Min(1024, data.Length - offset)
		};
	}

	#endregion

	#region Format Identification Helpers

	/// <summary>
	/// Check if data at offset looks like Nintendo LZ10.
	/// </summary>
	public static bool IsNintendoLz10(byte[] data, int offset) {
		if (offset + 4 > data.Length)
			return false;

		if (data[offset] != 0x10)
			return false;

		int size = data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16);
		return size > 0 && size < 0x1000000;
	}

	/// <summary>
	/// Check if data at offset looks like Nintendo LZ11.
	/// </summary>
	public static bool IsNintendoLz11(byte[] data, int offset) {
		if (offset + 4 > data.Length)
			return false;

		if (data[offset] != 0x11)
			return false;

		int size = data[offset + 1] | (data[offset + 2] << 8) | (data[offset + 3] << 16);
		return size > 0 && size < 0x1000000;
	}

	/// <summary>
	/// Get a description of the compression format.
	/// </summary>
	public static string GetFormatDescription(CompressionType type) {
		return type switch {
			CompressionType.None => "No compression detected",
			CompressionType.Lz77 => "LZ77 - Lempel-Ziv 77 sliding window compression",
			CompressionType.Lzss => "LZSS - Lempel-Ziv-Storer-Szymanski variant",
			CompressionType.Rle => "RLE - Run Length Encoding",
			CompressionType.Huffman => "Huffman - Variable-length entropy coding",
			CompressionType.LzNintendo or CompressionType.Lz10 => "Nintendo LZ10 - GBA/DS standard compression (0x10 header)",
			CompressionType.Lz11 => "Nintendo LZ11 - Extended LZ with larger references (0x11 header)",
			CompressionType.LzKonami => "Konami LZ - Custom Konami compression format",
			CompressionType.LzSquare => "Square LZ - Custom Square/Squaresoft compression",
			CompressionType.LzCapcom => "Capcom LZ - Custom Capcom compression format",
			CompressionType.Dte => "DTE - Dual Tile Encoding for text compression",
			CompressionType.Rle8 => "RLE8 - 8-bit Run Length Encoding variant",
			CompressionType.Lz4 => "LZ4 - Fast compression algorithm",
			CompressionType.Custom => "Custom or unknown compression format",
			_ => "Unknown format"
		};
	}

	#endregion
}
