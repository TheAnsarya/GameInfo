using System.Collections.ObjectModel;

namespace DQ3Lib.Compression.Text.Huffman;

// Because of the way the dictionary is built, keys and values are both guaranteed to be unique.
internal class DecodingTable : ReadOnlyDictionary<string, char> {
	public DecodingTable(Dictionary<string, char> dictionary) : base(dictionary) { }

	public static DecodingTable Build(EncodingTable encoding) {
		ArgumentNullException.ThrowIfNull(encoding, nameof(encoding));

		Dictionary<string, char> builder = [];

		foreach (var pair in encoding) {
			builder[pair.Value] = pair.Key;
		}

		DecodingTable decoding = new(builder);

		return decoding;
	}
}
