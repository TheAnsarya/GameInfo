
using DQ3SFC.DataStructures;
using System;
using System.Collections.Generic;

namespace DQ3SFC.Compression;

// Used in FFMQ
// Splits each byte into two, each nibble is masked with 0x07 (bottom three bits)
class ExpandNibblesMasked {

	public static byte[] Decompress(byte[] source) {
		return Decompress(new ByteArrayStream(source), source.Length);
	}

	public static byte[] Decompress(ByteArrayStream source, int compressedSize) {
		var output = new List<byte>(compressedSize * 2);

		for (int i = 0; i < compressedSize; i++) {
			var data = source.Byte();
			output.Add((byte)(data & 0x07));
			output.Add((byte)((data >> 4) & 0x07));
		}

		return output.ToArray();
	}


	public static byte[] Compress(byte[] target) {
		return Compress(new ByteArrayStream(target));
	}

	public static byte[] Compress(ByteArrayStream target) {
		if (target.Address != 0) {
			throw new ArgumentException($"{nameof(target)} address must be 0");
		}

		if (target.Size % 2 != 0) {
			throw new ArgumentException($"size is wrong ({target.Size:x2}), {nameof(target)} needs to be in 2 byte chunks (words)");
		}

		var output = new List<byte>(target.Size / 2);

		while (!target.AtEnd) {
			var low = target.Byte();
			var high = target.Byte();

			if ((low & 0x07) != low) {
				throw new Exception($"{nameof(low)} byte should be lower three bits only. value: ${low:x2}  address: ${target.Address - 2:x2}");
			}

			if ((high & 0x07) != low) {
				throw new Exception($"{nameof(high)} byte should be lower three bits only. value: ${high:x2}  address: ${target.Address - 1:x2}");
			}

			var data = (byte)(low + (high << 4));
			output.Add(data);
		}

		return output.ToArray();
	}
}

