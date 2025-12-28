namespace GameInfoTools.Analysis.Games.DQ3r;

/// <summary>
/// DQ3r compression detection and handling.
/// Supports the Ring400 LZ-style compression used in DQ3 SNES.
/// </summary>
public class DQ3rCompressionHandler {
	/// <summary>
	/// Ring buffer size (1024 bytes).
	/// </summary>
	private const int RingSize = 0x400;

	/// <summary>
	/// Initial write position in ring buffer.
	/// </summary>
	private const int StartWriteAddress = 0x3be;

	/// <summary>
	/// Minimum copy length.
	/// </summary>
	private const int MinCopySize = 3;

	/// <summary>
	/// Maximum copy length (6 bits + 3 = 66).
	/// </summary>
	private const int MaxCopySize = 66;

	/// <summary>
	/// Decompress Ring400 compressed data.
	/// </summary>
	/// <param name="source">Compressed data.</param>
	/// <param name="outputSize">Expected decompressed size.</param>
	/// <returns>Decompressed data.</returns>
	public static byte[] DecompressRing400(byte[] source, int outputSize) {
		var output = new byte[outputSize];
		var outputPos = 0;

		var ring = new byte[RingSize];
		var ringPos = StartWriteAddress;

		var sourcePos = 0;
		var commandByte = 0;
		var commandBit = 0;

		while (outputPos < outputSize && sourcePos < source.Length) {
			// Load new command byte when needed
			if (commandBit == 0) {
				if (sourcePos >= source.Length) break;
				commandByte = source[sourcePos++];
				commandBit = 8;
			}

			commandBit--;
			bool isLiteral = ((commandByte >> (7 - commandBit)) & 1) == 1;

			if (isLiteral) {
				// Literal byte
				if (sourcePos >= source.Length) break;
				byte b = source[sourcePos++];

				if (outputPos < outputSize) {
					output[outputPos++] = b;
				}
				ring[ringPos] = b;
				ringPos = (ringPos + 1) % RingSize;
			} else {
				// Copy from ring buffer
				if (sourcePos + 1 >= source.Length) break;
				byte d1 = source[sourcePos++];
				byte d2 = source[sourcePos++];

				int address = d1 + ((d2 << 2) & 0x300);
				int length = (d2 & 0x3f) + 3;

				for (int i = 0; i < length && outputPos < outputSize; i++) {
					byte b = ring[(address + i) % RingSize];
					output[outputPos++] = b;
					ring[ringPos] = b;
					ringPos = (ringPos + 1) % RingSize;
				}
			}
		}

		return output;
	}

	/// <summary>
	/// Compress data using Ring400 algorithm.
	/// </summary>
	/// <param name="data">Data to compress.</param>
	/// <returns>Compressed data.</returns>
	public static byte[] CompressRing400(byte[] data) {
		var commands = new List<CompressionCommand>();
		var pos = 0;

		while (pos < data.Length) {
			// Try to find a match in the sliding window
			var bestMatch = FindBestMatch(data, pos);

			if (bestMatch.Length >= MinCopySize) {
				commands.Add(new CompressionCommand {
					IsLiteral = false,
					Length = bestMatch.Length,
					Offset = bestMatch.Offset
				});
				pos += bestMatch.Length;
			} else {
				commands.Add(new CompressionCommand {
					IsLiteral = true,
					LiteralByte = data[pos]
				});
				pos++;
			}
		}

		return EncodeCommands(commands);
	}

	/// <summary>
	/// Find best match in sliding window.
	/// </summary>
	private static (int Offset, int Length) FindBestMatch(byte[] data, int pos) {
		int bestOffset = 0;
		int bestLength = 0;

		int windowStart = Math.Max(0, pos - RingSize);

		for (int i = windowStart; i < pos; i++) {
			int length = 0;
			while (pos + length < data.Length &&
				   length < MaxCopySize &&
				   data[i + length] == data[pos + length]) {
				length++;
			}

			if (length > bestLength) {
				bestLength = length;
				bestOffset = i;
			}
		}

		return (bestOffset, bestLength);
	}

	/// <summary>
	/// Encode compression commands to bytes.
	/// </summary>
	private static byte[] EncodeCommands(List<CompressionCommand> commands) {
		var output = new List<byte>();

		for (int i = 0; i < commands.Count; i += 8) {
			byte commandByte = 0;
			var dataBytes = new List<byte>();

			for (int j = 0; j < 8 && i + j < commands.Count; j++) {
				var cmd = commands[i + j];

				if (cmd.IsLiteral) {
					commandByte |= (byte)(1 << j);
					dataBytes.Add(cmd.LiteralByte);
				} else {
					int address = (cmd.Offset + StartWriteAddress) % RingSize;
					int length = cmd.Length - 3;

					byte d1 = (byte)(address & 0xff);
					byte d2 = (byte)(((address >> 2) & 0xc0) | (length & 0x3f));

					dataBytes.Add(d1);
					dataBytes.Add(d2);
				}
			}

			output.Add(commandByte);
			output.AddRange(dataBytes);
		}

		return [.. output];
	}

	/// <summary>
	/// Detect if data appears to be Ring400 compressed.
	/// </summary>
	/// <param name="data">Data to analyze.</param>
	/// <returns>True if likely compressed.</returns>
	public static bool DetectRing400Compression(byte[] data) {
		if (data.Length < 10) return false;

		// Analyze structure for Ring400 patterns
		int pos = 0;
		int validCommands = 0;
		int invalidCommands = 0;

		while (pos < Math.Min(100, data.Length - 2)) {
			byte commandByte = data[pos++];

			for (int bit = 0; bit < 8 && pos < data.Length; bit++) {
				bool isLiteral = ((commandByte >> bit) & 1) == 1;

				if (isLiteral) {
					pos++; // Skip literal byte
					validCommands++;
				} else {
					if (pos + 1 >= data.Length) break;

					byte d2 = data[pos + 1];
					int length = (d2 & 0x3f) + 3;

					if (length > MaxCopySize) {
						invalidCommands++;
					} else {
						validCommands++;
					}
					pos += 2;
				}
			}
		}

		// If most commands are valid, likely Ring400
		return validCommands > invalidCommands * 2;
	}

	/// <summary>
	/// Detect general compression type in data.
	/// </summary>
	/// <param name="data">Data to analyze.</param>
	/// <returns>Detected compression type.</returns>
	public static DQ3rCompressionType DetectCompressionType(byte[] data) {
		if (data.Length < 10) return DQ3rCompressionType.None;

		// Check for Ring400 patterns
		if (DetectRing400Compression(data)) {
			return DQ3rCompressionType.Lz77;
		}

		// Check entropy for general compression detection
		double entropy = CalculateEntropy(data);

		// High entropy (>7.5) suggests already compressed or encrypted
		if (entropy > 7.5) {
			return DQ3rCompressionType.Custom;
		}

		// Check for RLE patterns
		int rleScore = DetectRlePatterns(data);
		if (rleScore > data.Length / 10) {
			return DQ3rCompressionType.Rle;
		}

		return DQ3rCompressionType.None;
	}

	/// <summary>
	/// Detect RLE-style patterns.
	/// </summary>
	private static int DetectRlePatterns(byte[] data) {
		int score = 0;

		for (int i = 0; i < data.Length - 3; i++) {
			if (data[i] == data[i + 1] && data[i] == data[i + 2]) {
				score++;
				// Skip run
				while (i < data.Length - 1 && data[i] == data[i + 1]) i++;
			}
		}

		return score;
	}

	/// <summary>
	/// Calculate Shannon entropy.
	/// </summary>
	private static double CalculateEntropy(byte[] data) {
		var freq = new int[256];
		foreach (byte b in data) freq[b]++;

		double entropy = 0;
		foreach (int count in freq) {
			if (count > 0) {
				double p = (double)count / data.Length;
				entropy -= p * Math.Log2(p);
			}
		}
		return entropy;
	}

	/// <summary>
	/// Compression command for encoding.
	/// </summary>
	private class CompressionCommand {
		public bool IsLiteral { get; init; }
		public byte LiteralByte { get; init; }
		public int Length { get; init; }
		public int Offset { get; init; }
	}
}

/// <summary>
/// Compression analysis result.
/// </summary>
public record CompressionAnalysisResult {
	public bool IsCompressed { get; init; }
	public DQ3rCompressionType Type { get; init; }
	public int CompressedSize { get; init; }
	public int EstimatedDecompressedSize { get; init; }
	public double CompressionRatio => EstimatedDecompressedSize > 0
		? (double)CompressedSize / EstimatedDecompressedSize
		: 1.0;
}
