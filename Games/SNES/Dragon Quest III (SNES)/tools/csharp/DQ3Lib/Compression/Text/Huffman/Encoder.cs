namespace DQ3Lib.Compression.Text.Huffman;

internal class Encoder {
	public static EncodedText Encode(string text) {
		ArgumentNullException.ThrowIfNull(text, nameof(text));

		Frequencies frequencies = Frequencies.CalculateFrequencies(text);

		HuffmanNode root = HuffmanTree.BuildTree(frequencies);

		EncodingTable encoding = EncodingTable.Build(root);

		var encoded = EncodeToData(text, encoding);

		return new EncodedText(text, encoded, encoding);
	}

	// Enumerate the characters in the text, convert to encoded values, and set the data output bytes, bit by bit
	private static byte[] EncodeToData(string text, EncodingTable encoding) {
		ArgumentNullException.ThrowIfNull(text, nameof(text));
		ArgumentNullException.ThrowIfNull(encoding, nameof(encoding));

		// Create and find length of encoded data
		var encodedLength = CalculateEncodedLength(text, encoding);
		// +7, /8 is a simple way to round up
		int length = (encodedLength + 7) / 8;
		byte[] data = new byte[length];

		// Indexes for accessing the data array
		var bitIndex = 0;
		var byteIndex = 0;

		foreach (char c in text) {
			var item = encoding[c];

			for (int i = 0; i < item.Length; i++) {
				if (item[i] == '1') {
					// TODO: make sure little endian is correct
					data[byteIndex] |= (byte)(1 << (7 - bitIndex));
				}

				bitIndex++;

				if (bitIndex == 8) {
					bitIndex = 0;
					byteIndex++;
				}
			}
		}

		return data;
	}

	private static int CalculateEncodedLength(string text, EncodingTable encoding) {
		ArgumentNullException.ThrowIfNull(text, nameof(text));
		ArgumentNullException.ThrowIfNull(encoding, nameof(encoding));

		//TODO: verify that int is long enough
		var length = 0;
		foreach (char c in text) {
			length += encoding[c].Length;
		}

		return length;
	}
}
