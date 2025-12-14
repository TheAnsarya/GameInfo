namespace GameInfoTools.Core.Build;

/// <summary>
/// Compression and decompression utilities for retro game ROMs.
/// Supports common algorithms used in NES, SNES, Genesis, and other platforms.
/// </summary>
public static class CompressionUtils {
	/// <summary>
	/// Decompress data using the specified algorithm
	/// </summary>
	public static byte[] Decompress(byte[] data, CompressionAlgorithm algorithm, CompressionOptions? options = null) {
		return algorithm switch {
			CompressionAlgorithm.None => data,
			CompressionAlgorithm.Lzss => DecompressLzss(data, options),
			CompressionAlgorithm.Rle => DecompressRle(data, options),
			CompressionAlgorithm.Huffman => DecompressHuffman(data),
			_ => data
		};
	}

	/// <summary>
	/// Compress data using the specified algorithm
	/// </summary>
	public static byte[] Compress(byte[] data, CompressionAlgorithm algorithm, CompressionOptions? options = null) {
		return algorithm switch {
			CompressionAlgorithm.None => data,
			CompressionAlgorithm.Lzss => CompressLzss(data, options),
			CompressionAlgorithm.Rle => CompressRle(data, options),
			CompressionAlgorithm.Huffman => CompressHuffman(data),
			_ => data
		};
	}

	#region LZSS Compression

	/// <summary>
	/// Decompress LZSS-compressed data.
	/// LZSS is commonly used in SNES, GBA, and many other systems.
	/// </summary>
	public static byte[] DecompressLzss(byte[] data, CompressionOptions? options = null) {
		var opts = options ?? new CompressionOptions();
		var output = new List<byte>();
		var slidingWindow = new byte[opts.LzssWindowSize];
		var windowPos = opts.LzssWindowStart;

		int pos = 0;

		// Check for header if expected
		if (opts.HasHeader && pos < data.Length) {
			// GBA-style header: first byte is compression type, next 3 bytes are decompressed size
			var headerByte = data[pos++];
			if ((headerByte & 0xf0) == 0x10) // LZSS marker
			{
				var decompressedSize = data[pos] | (data[pos + 1] << 8) | (data[pos + 2] << 16);
				pos += 3;
				opts.ExpectedSize = decompressedSize;
			}
		}

		while (pos < data.Length) {
			if (opts.ExpectedSize > 0 && output.Count >= opts.ExpectedSize)
				break;

			var flags = data[pos++];

			for (int i = 0; i < 8 && pos < data.Length; i++) {
				if (opts.ExpectedSize > 0 && output.Count >= opts.ExpectedSize)
					break;

				bool isCompressed = opts.LzssFlagBitOrder
					? ((flags >> (7 - i)) & 1) != 0
					: ((flags >> i) & 1) != 0;

				if (isCompressed) {
					// Compressed: read offset and length
					if (pos + 1 >= data.Length)
						break;

					var byte1 = data[pos++];
					var byte2 = data[pos++];

					int offset, length;
					if (opts.LzssOffsetBytesFirst) {
						// Format: OOOO OOOO | LLLL OOOO (GBA style)
						length = ((byte1 >> 4) & 0x0f) + opts.LzssMinMatchLength;
						offset = ((byte1 & 0x0f) << 8) | byte2;
					} else {
						// Format: LLLL OOOO | OOOO OOOO (SNES style)
						length = ((byte1 >> 4) & 0x0f) + opts.LzssMinMatchLength;
						offset = ((byte1 & 0x0f) << 8) | byte2;
					}

					// Copy from sliding window
					for (int j = 0; j < length; j++) {
						var windowOffset = (windowPos - offset - 1) & (opts.LzssWindowSize - 1);
						var b = slidingWindow[windowOffset];
						output.Add(b);
						slidingWindow[windowPos] = b;
						windowPos = (windowPos + 1) & (opts.LzssWindowSize - 1);
					}
				} else {
					// Literal byte
					var b = data[pos++];
					output.Add(b);
					slidingWindow[windowPos] = b;
					windowPos = (windowPos + 1) & (opts.LzssWindowSize - 1);
				}
			}
		}

		return [.. output];
	}

	/// <summary>
	/// Compress data using LZSS algorithm.
	/// </summary>
	public static byte[] CompressLzss(byte[] data, CompressionOptions? options = null) {
		var opts = options ?? new CompressionOptions();
		var output = new List<byte>();
		var slidingWindow = new byte[opts.LzssWindowSize];
		var windowPos = opts.LzssWindowStart;

		// Add header if needed (GBA style)
		if (opts.HasHeader) {
			output.Add(0x10); // LZSS marker
			output.Add((byte)(data.Length & 0xff));
			output.Add((byte)((data.Length >> 8) & 0xff));
			output.Add((byte)((data.Length >> 16) & 0xff));
		}

		int pos = 0;
		while (pos < data.Length) {
			var flagByte = 0;
			var flagPos = output.Count;
			output.Add(0); // Placeholder for flag byte

			var chunk = new List<byte>();

			for (int i = 0; i < 8 && pos < data.Length; i++) {
				// Try to find a match in the sliding window
				var (matchOffset, matchLength) = FindBestMatch(data, pos, slidingWindow, windowPos, opts);

				if (matchLength >= opts.LzssMinMatchLength) {
					// Compressed reference
					if (opts.LzssFlagBitOrder)
						flagByte |= 1 << (7 - i);
					else
						flagByte |= 1 << i;

					// Encode offset and length
					var length = matchLength - opts.LzssMinMatchLength;
					if (opts.LzssOffsetBytesFirst) {
						chunk.Add((byte)(((length & 0x0f) << 4) | ((matchOffset >> 8) & 0x0f)));
						chunk.Add((byte)(matchOffset & 0xff));
					} else {
						chunk.Add((byte)(((length & 0x0f) << 4) | ((matchOffset >> 8) & 0x0f)));
						chunk.Add((byte)(matchOffset & 0xff));
					}

					// Update sliding window
					for (int j = 0; j < matchLength; j++) {
						slidingWindow[windowPos] = data[pos++];
						windowPos = (windowPos + 1) & (opts.LzssWindowSize - 1);
					}
				} else {
					// Literal byte
					var b = data[pos++];
					chunk.Add(b);
					slidingWindow[windowPos] = b;
					windowPos = (windowPos + 1) & (opts.LzssWindowSize - 1);
				}
			}

			output[flagPos] = (byte)flagByte;
			output.AddRange(chunk);
		}

		return [.. output];
	}

	private static (int offset, int length) FindBestMatch(byte[] data, int pos, byte[] window, int windowPos, CompressionOptions opts) {
		var maxLength = Math.Min(opts.LzssMaxMatchLength, data.Length - pos);
		var bestOffset = 0;
		var bestLength = 0;

		for (int offset = 1; offset < opts.LzssWindowSize && offset <= pos; offset++) {
			var windowOffset = (windowPos - offset) & (opts.LzssWindowSize - 1);
			var length = 0;

			while (length < maxLength && window[(windowOffset + length) & (opts.LzssWindowSize - 1)] == data[pos + length]) {
				length++;
			}

			if (length > bestLength) {
				bestLength = length;
				bestOffset = offset;
			}
		}

		return (bestOffset, bestLength);
	}

	#endregion

	#region RLE Compression

	/// <summary>
	/// Decompress RLE-compressed data.
	/// RLE is commonly used for simple graphics compression.
	/// </summary>
	public static byte[] DecompressRle(byte[] data, CompressionOptions? options = null) {
		var opts = options ?? new CompressionOptions();
		var output = new List<byte>();
		int pos = 0;

		// Check for header
		int expectedSize = -1;
		if (opts.HasHeader && pos < data.Length) {
			var headerByte = data[pos++];
			if ((headerByte & 0xf0) == 0x30) // RLE marker
			{
				expectedSize = data[pos] | (data[pos + 1] << 8) | (data[pos + 2] << 16);
				pos += 3;
			}
		}

		while (pos < data.Length) {
			if (expectedSize > 0 && output.Count >= expectedSize)
				break;

			var flag = data[pos++];

			if ((flag & opts.RleRunMask) != 0) {
				// Run of identical bytes
				var count = (flag & ~opts.RleRunMask) + opts.RleMinRunLength;
				if (pos >= data.Length)
					break;
				var value = data[pos++];

				for (int i = 0; i < count; i++)
					output.Add(value);
			} else {
				// Literal bytes
				var count = (flag & ~opts.RleRunMask) + 1;

				for (int i = 0; i < count && pos < data.Length; i++)
					output.Add(data[pos++]);
			}
		}

		return [.. output];
	}

	/// <summary>
	/// Compress data using RLE algorithm.
	/// </summary>
	public static byte[] CompressRle(byte[] data, CompressionOptions? options = null) {
		var opts = options ?? new CompressionOptions();
		var output = new List<byte>();

		// Add header if needed
		if (opts.HasHeader) {
			output.Add(0x30); // RLE marker
			output.Add((byte)(data.Length & 0xff));
			output.Add((byte)((data.Length >> 8) & 0xff));
			output.Add((byte)((data.Length >> 16) & 0xff));
		}

		int pos = 0;
		while (pos < data.Length) {
			// Count run length
			var runStart = pos;
			var runValue = data[pos];
			var runLength = 1;

			while (pos + runLength < data.Length &&
				   data[pos + runLength] == runValue &&
				   runLength < opts.RleMaxRunLength) {
				runLength++;
			}

			if (runLength >= opts.RleMinRunLength) {
				// Encode as run
				var count = runLength - opts.RleMinRunLength;
				output.Add((byte)(opts.RleRunMask | count));
				output.Add(runValue);
				pos += runLength;
			} else {
				// Find literal sequence
				var literalStart = pos;
				var literalLength = 0;

				while (pos + literalLength < data.Length && literalLength < opts.RleMaxLiteralLength) {
					// Check if a run starts here
					var checkValue = data[pos + literalLength];
					var checkLength = 1;
					while (pos + literalLength + checkLength < data.Length &&
						   data[pos + literalLength + checkLength] == checkValue &&
						   checkLength < opts.RleMinRunLength) {
						checkLength++;
					}

					if (checkLength >= opts.RleMinRunLength)
						break;

					literalLength++;
				}

				if (literalLength == 0)
					literalLength = 1;

				// Encode as literals
				var count = literalLength - 1;
				output.Add((byte)count);
				for (int i = 0; i < literalLength; i++)
					output.Add(data[pos++]);
			}
		}

		return [.. output];
	}

	#endregion

	#region Huffman Compression

	/// <summary>
	/// Decompress Huffman-encoded data (simplified GBA-style).
	/// </summary>
	public static byte[] DecompressHuffman(byte[] data) {
		var output = new List<byte>();

		if (data.Length < 5)
			return [.. output];

		// Read header
		var headerByte = data[0];
		var bitSize = headerByte & 0x0f; // 4 or 8 bit
		var decompressedSize = data[1] | (data[2] << 8) | (data[3] << 16);

		int pos = 4;

		// Read tree
		var treeSize = data[pos++] + 1;
		var tree = new byte[treeSize * 2];
		for (int i = 0; i < treeSize * 2 && pos < data.Length; i++)
			tree[i] = data[pos++];

		// Decode data
		int bitPos = 0;
		int currentNode = 0;
		int nibbleBuffer = 0;
		bool hasNibble = false;

		while (output.Count < decompressedSize && pos < data.Length) {
			// Read next bit
			var bit = (data[pos] >> (7 - bitPos)) & 1;
			bitPos++;
			if (bitPos >= 8) {
				bitPos = 0;
				pos++;
			}

			// Navigate tree
			var nodeIndex = currentNode * 2;
			if (nodeIndex >= tree.Length - 1)
				break;

			var nodeData = tree[nodeIndex + bit];
			var isLeaf = (nodeData & 0x80) != 0;
			var value = nodeData & 0x3f;

			if (isLeaf) {
				if (bitSize == 4) {
					if (!hasNibble) {
						nibbleBuffer = value;
						hasNibble = true;
					} else {
						output.Add((byte)((nibbleBuffer << 4) | value));
						hasNibble = false;
					}
				} else {
					output.Add((byte)value);
				}

				currentNode = 0;
			} else {
				currentNode = value + 1;
			}
		}

		return [.. output];
	}

	/// <summary>
	/// Compress data using Huffman encoding.
	/// </summary>
	public static byte[] CompressHuffman(byte[] data) {
		// Build frequency table
		var frequencies = new int[256];
		foreach (var b in data)
			frequencies[b]++;

		// Build Huffman tree
		var nodes = new List<HuffmanNode>();
		for (int i = 0; i < 256; i++) {
			if (frequencies[i] > 0) {
				nodes.Add(new HuffmanNode { Value = (byte)i, Frequency = frequencies[i], IsLeaf = true });
			}
		}

		if (nodes.Count == 0)
			return [0x20, (byte)data.Length, (byte)(data.Length >> 8), (byte)(data.Length >> 16), 0];

		// Build tree by combining lowest frequency nodes
		while (nodes.Count > 1) {
			nodes.Sort((a, b) => a.Frequency.CompareTo(b.Frequency));
			var left = nodes[0];
			var right = nodes[1];
			nodes.RemoveRange(0, 2);

			var parent = new HuffmanNode {
				Frequency = left.Frequency + right.Frequency,
				Left = left,
				Right = right,
				IsLeaf = false
			};
			nodes.Add(parent);
		}

		var root = nodes[0];

		// Build code table
		var codes = new Dictionary<byte, (int code, int bits)>();
		BuildCodeTable(root, 0, 0, codes);

		// Encode header
		var output = new List<byte>
		{
			0x28, // Huffman 8-bit marker
			(byte)(data.Length & 0xff),
			(byte)((data.Length >> 8) & 0xff),
			(byte)((data.Length >> 16) & 0xff)
		};

		// Serialize tree (simplified)
		var treeBytes = SerializeHuffmanTree(root);
		output.Add((byte)((treeBytes.Count / 2) - 1));
		output.AddRange(treeBytes);

		// Encode data
		int currentByte = 0;
		int bitCount = 0;

		foreach (var b in data) {
			var (code, bits) = codes[b];

			for (int i = bits - 1; i >= 0; i--) {
				currentByte = (currentByte << 1) | ((code >> i) & 1);
				bitCount++;

				if (bitCount >= 8) {
					output.Add((byte)currentByte);
					currentByte = 0;
					bitCount = 0;
				}
			}
		}

		// Flush remaining bits
		if (bitCount > 0) {
			currentByte <<= 8 - bitCount;
			output.Add((byte)currentByte);
		}

		return [.. output];
	}

	private static void BuildCodeTable(HuffmanNode node, int code, int bits, Dictionary<byte, (int code, int bits)> codes) {
		if (node.IsLeaf) {
			codes[node.Value] = (code, Math.Max(1, bits));
			return;
		}

		if (node.Left != null)
			BuildCodeTable(node.Left, code << 1, bits + 1, codes);
		if (node.Right != null)
			BuildCodeTable(node.Right, (code << 1) | 1, bits + 1, codes);
	}

	private static List<byte> SerializeHuffmanTree(HuffmanNode node) {
		var result = new List<byte>();

		void Serialize(HuffmanNode n, int index) {
			while (result.Count <= (index * 2) + 1) {
				result.Add(0);
			}

			if (n.IsLeaf) {
				result[index * 2] = (byte)(0x80 | n.Value);
				result[(index * 2) + 1] = (byte)(0x80 | n.Value);
			} else {
				var leftIndex = result.Count / 2;
				result[index * 2] = (byte)leftIndex;
				if (n.Left != null) Serialize(n.Left, leftIndex);

				var rightIndex = result.Count / 2;
				result[(index * 2) + 1] = (byte)rightIndex;
				if (n.Right != null) Serialize(n.Right, rightIndex);
			}
		}

		Serialize(node, 0);
		return result;
	}

	private class HuffmanNode {
		public byte Value { get; set; }
		public int Frequency { get; set; }
		public bool IsLeaf { get; set; }
		public HuffmanNode? Left { get; set; }
		public HuffmanNode? Right { get; set; }
	}

	#endregion

	#region Platform-Specific Compression

	/// <summary>
	/// Decompress Nintendo DTE (Dual Tile Encoding) used in some NES games.
	/// </summary>
	public static byte[] DecompressDte(byte[] data, byte[][] dictionary) {
		var output = new List<byte>();

		foreach (var b in data) {
			if (b < dictionary.Length && dictionary[b].Length > 1) {
				output.AddRange(dictionary[b]);
			} else {
				output.Add(b);
			}
		}

		return [.. output];
	}

	/// <summary>
	/// Detect compression algorithm from data header.
	/// </summary>
	public static CompressionAlgorithm DetectCompression(byte[] data) {
		if (data.Length < 4)
			return CompressionAlgorithm.None;

		var header = data[0];

		// GBA/DS compression markers
		return (header & 0xf0) switch {
			0x10 => CompressionAlgorithm.Lzss, // LZ77
			0x20 => CompressionAlgorithm.Huffman, // Huffman 8-bit
			0x28 => CompressionAlgorithm.Huffman, // Huffman 4-bit
			0x30 => CompressionAlgorithm.Rle, // RLE
			_ => CompressionAlgorithm.None
		};
	}

	/// <summary>
	/// Get decompressed size from header.
	/// </summary>
	public static int? GetDecompressedSize(byte[] data) {
		if (data.Length < 4)
			return null;

		var header = data[0];

		// Check for known compression headers
		if ((header & 0xf0) is 0x10 or 0x20 or 0x28 or 0x30) {
			return data[1] | (data[2] << 8) | (data[3] << 16);
		}

		return null;
	}

	#endregion
}

/// <summary>
/// Options for compression/decompression
/// </summary>
public class CompressionOptions {
	/// <summary>
	/// Whether the data has a header with size information
	/// </summary>
	public bool HasHeader { get; set; } = false;

	/// <summary>
	/// Expected decompressed size (if known)
	/// </summary>
	public int ExpectedSize { get; set; } = 0;

	#region LZSS Options

	/// <summary>
	/// Size of the sliding window (must be power of 2)
	/// </summary>
	public int LzssWindowSize { get; set; } = 4096;

	/// <summary>
	/// Initial window position
	/// </summary>
	public int LzssWindowStart { get; set; } = 0;

	/// <summary>
	/// Minimum match length to encode as reference
	/// </summary>
	public int LzssMinMatchLength { get; set; } = 3;

	/// <summary>
	/// Maximum match length
	/// </summary>
	public int LzssMaxMatchLength { get; set; } = 18;

	/// <summary>
	/// If true, flag bits are read MSB first (GBA style)
	/// </summary>
	public bool LzssFlagBitOrder { get; set; } = true;

	/// <summary>
	/// If true, offset bytes come before length in reference
	/// </summary>
	public bool LzssOffsetBytesFirst { get; set; } = true;

	#endregion

	#region RLE Options

	/// <summary>
	/// Mask to identify run vs literal
	/// </summary>
	public byte RleRunMask { get; set; } = 0x80;

	/// <summary>
	/// Minimum run length to encode
	/// </summary>
	public int RleMinRunLength { get; set; } = 3;

	/// <summary>
	/// Maximum run length
	/// </summary>
	public int RleMaxRunLength { get; set; } = 130;

	/// <summary>
	/// Maximum literal sequence length
	/// </summary>
	public int RleMaxLiteralLength { get; set; } = 128;

	#endregion
}
