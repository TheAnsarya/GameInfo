using System.Collections.ObjectModel;

namespace DQ3Lib.Compression.Text.Huffman;

// Because of the way the dictionary is built, keys and values are both guaranteed to be unique.
internal class EncodingTable : ReadOnlyDictionary<char, string> {
	private EncodingTable(Dictionary<char, string> dictionary) : base(dictionary) { }

	public static EncodingTable Build(DecodingTable decoding) {
		ArgumentNullException.ThrowIfNull(decoding, nameof(decoding));

		Dictionary<char, string> builder = [];

		foreach (var pair in decoding) {
			builder[pair.Value] = pair.Key;
		}

		EncodingTable encoding = new(builder);

		return encoding;
	}

	public static EncodingTable Build(HuffmanNode node) {
		ArgumentNullException.ThrowIfNull(node, nameof(node));

		Dictionary<char, string> builder = [];

		BuildRecursive(builder, node, string.Empty);

		EncodingTable encoding = new(builder);

		return encoding;
	}

	// TODO: remove/flatten recursive calls, although it shouldn't go more than 5 or 6 levels deep it is a lot of method calls (or make local method?)
	private static void BuildRecursive(Dictionary<char, string> builder, HuffmanNode node, string prefix) {
		if (node.IsLeaf) {
			builder[node.Character] = prefix;
			return;
		}

		if (node.Left != null) {
			BuildRecursive(builder, node.Left, prefix + "0");
		}

		if (node.Right != null) {
			BuildRecursive(builder, node.Right, prefix + "1");
		}
	}
}
