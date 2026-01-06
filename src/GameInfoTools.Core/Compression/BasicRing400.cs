namespace GameInfoTools.Core.Compression;

/// <summary>
/// BasicRing400 compression/decompression used by DQ3/DQ6 SNES.
/// This is an LZ-style compression with a 1024-byte ring buffer.
/// </summary>
public static class BasicRing400 {
	/// <summary>
	/// Start write address in ring buffer (0x03be for DQ3).
	/// </summary>
	private const int StartWriteAddress = 0x03be;

	/// <summary>
	/// Ring buffer size (10-bit address = 1024 bytes).
	/// </summary>
	private const int RingSize = 0x400;

	/// <summary>
	/// Maximum copy size (6-bit field + 3 = 66 bytes).
	/// </summary>
	private const int MaxCopySize = 66;

	/// <summary>
	/// Minimum copy size for compression to be worthwhile.
	/// </summary>
	private const int MinCopySize = 3;

	/// <summary>
	/// Decompress BasicRing400 compressed data.
	/// </summary>
	/// <param name="source">Compressed data.</param>
	/// <param name="outputSize">Expected decompressed size.</param>
	/// <returns>Decompressed byte array.</returns>
	public static byte[] Decompress(byte[] source, int outputSize) {
		ArgumentNullException.ThrowIfNull(source);
		ArgumentOutOfRangeException.ThrowIfNegativeOrZero(outputSize);

		var output = new byte[outputSize];
		var ring = new byte[RingSize];
		var ringAddress = StartWriteAddress;
		var sourceIndex = 0;
		var outputIndex = 0;

		// Initialize ring buffer with zeros (default in C#)

		while (outputIndex < outputSize && sourceIndex < source.Length) {
			// Read command byte (8 commands per byte)
			var commands = source[sourceIndex++];

			for (int bit = 0; bit < 8 && outputIndex < outputSize; bit++) {
				var isLiteral = (commands & (1 << bit)) != 0;

				if (isLiteral) {
					// Literal byte - copy directly
					if (sourceIndex >= source.Length) break;

					var b = source[sourceIndex++];
					ring[ringAddress] = b;
					ringAddress = (ringAddress + 1) % RingSize;
					output[outputIndex++] = b;
				} else {
					// Copy reference - read 2 bytes for address and length
					if (sourceIndex + 1 >= source.Length) break;

					var d1 = source[sourceIndex++];
					var d2 = source[sourceIndex++];

					// Address: low 8 bits from d1, high 2 bits from d2
					var address = d1 + ((d2 << 2) & 0x0300);
					// Length: low 6 bits of d2 + 3
					var length = (d2 & 0x3f) + 3;

					// Copy from ring buffer
					var copyAddress = address;
					for (int i = 0; i < length && outputIndex < outputSize; i++) {
						var b = ring[copyAddress];
						copyAddress = (copyAddress + 1) % RingSize;

						ring[ringAddress] = b;
						ringAddress = (ringAddress + 1) % RingSize;
						output[outputIndex++] = b;
					}
				}
			}
		}

		return output;
	}

	/// <summary>
	/// Decompress with automatic size detection (reads until end marker or max size).
	/// </summary>
	/// <param name="source">Compressed data.</param>
	/// <param name="maxSize">Maximum expected output size.</param>
	/// <returns>Decompressed data.</returns>
	public static byte[] DecompressAuto(byte[] source, int maxSize = 0x10000) {
		// Decompress to max size, then trim trailing zeros
		var result = Decompress(source, maxSize);

		// Find actual end (last non-zero byte)
		var actualSize = result.Length;
		while (actualSize > 0 && result[actualSize - 1] == 0) {
			actualSize--;
		}

		// Round up to reasonable boundary
		actualSize = ((actualSize + 0xFF) / 0x100) * 0x100;

		if (actualSize < result.Length) {
			var trimmed = new byte[actualSize];
			Array.Copy(result, trimmed, actualSize);
			return trimmed;
		}

		return result;
	}

	/// <summary>
	/// Compress data using BasicRing400 algorithm.
	/// </summary>
	/// <param name="source">Uncompressed data.</param>
	/// <returns>Compressed byte array.</returns>
	public static byte[] Compress(byte[] source) {
		ArgumentNullException.ThrowIfNull(source);

		if (source.Length == 0) {
			return [];
		}

		var commands = new List<CompressionCommand>();
		var position = source.Length - 1;

		// Build commands from end to start (reversed)
		while (position >= 0) {
			CompressionCommand? bestMatch = null;

			// Search for best match in ring window
			for (int offset = 1; offset <= RingSize && offset <= position + 1; offset++) {
				var match = FindMatch(source, position, position - offset);
				if (match is not null) {
					if (bestMatch is null || match.Length > bestMatch.Length) {
						bestMatch = match;
					}

					// Early exit if we found max length
					if (bestMatch.Length >= MaxCopySize) break;
				}
			}

			if (bestMatch is not null && bestMatch.Length >= MinCopySize) {
				commands.Add(bestMatch);
				position -= bestMatch.Length;
			} else {
				// Literal byte
				commands.Add(new CompressionCommand {
					IsLiteral = true,
					LiteralValue = source[position],
					Length = 1
				});
				position--;
			}
		}

		// Reverse and encode to bytes
		commands.Reverse();
		return EncodeCommands(commands);
	}

	private static CompressionCommand? FindMatch(byte[] data, int targetPos, int sourcePos) {
		if (sourcePos < 0 || data[targetPos] != data[sourcePos]) {
			return null;
		}

		var length = 0;
		var t = targetPos;
		var s = sourcePos;

		while (length < MaxCopySize && t >= 0 && s >= 0 && data[t] == data[s]) {
			length++;
			t--;
			s--;
		}

		if (length < MinCopySize) {
			return null;
		}

		// Calculate ring buffer address
		var address = (sourcePos - length + 1 + StartWriteAddress) % RingSize;
		if (address < 0) address += RingSize;

		return new CompressionCommand {
			IsLiteral = false,
			Address = address,
			Length = length
		};
	}

	private static byte[] EncodeCommands(List<CompressionCommand> commands) {
		var output = new List<byte>();

		foreach (var batch in commands.Chunk(8)) {
			byte commandByte = 0;
			var batchData = new List<byte>();

			for (int i = 0; i < batch.Length; i++) {
				var cmd = batch[i];
				if (cmd.IsLiteral) {
					commandByte |= (byte)(1 << i);
					batchData.Add(cmd.LiteralValue);
				} else {
					// Encode address and length
					var low = (byte)(cmd.Address & 0xFF);
					var high = (byte)(((cmd.Address >> 2) & 0xC0) | ((cmd.Length - 3) & 0x3F));
					batchData.Add(low);
					batchData.Add(high);
				}
			}

			output.Add(commandByte);
			output.AddRange(batchData);
		}

		return output.ToArray();
	}

	private class CompressionCommand {
		public bool IsLiteral { get; init; }
		public byte LiteralValue { get; init; }
		public int Address { get; init; }
		public int Length { get; init; }
	}
}
