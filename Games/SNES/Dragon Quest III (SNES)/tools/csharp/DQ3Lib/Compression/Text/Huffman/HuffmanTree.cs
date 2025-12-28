using DQ3Lib.Extensions;

namespace DQ3Lib.Compression.Text.Huffman;

internal class HuffmanTree {
	public HuffmanNode Root { get; set; } = null!;

	public EncodingTable Encoding { get; set; } = null!;

	public HuffmanTree(HuffmanNode root, EncodingTable encoding) {
		Root = root;
		Encoding = encoding;
	}

	public static PriorityQueue<HuffmanNode, int> SortedQueue(Frequencies frequencies) {
		frequencies.ThrowIfNullOrEmpty(nameof(frequencies));

		var sorted =
			frequencies
				.OrderBy(x => x.Value)
				.Select(x => new HuffmanNode { Character = x.Key, Frequency = x.Value })
				.ToPriorityQueue(x => x.Frequency);

		return sorted;
	}

	public static HuffmanNode BuildTree(Frequencies frequencies) {
		frequencies.ThrowIfNullOrEmpty(nameof(frequencies));

		var queue = SortedQueue(frequencies);

		while (queue.Count > 1) {
			var left = queue.Dequeue();
			var right = queue.Dequeue();
			HuffmanNode parent = new() { Left = left, Right = right, Frequency = left.Frequency + right.Frequency };

			queue.Enqueue(parent, parent.Frequency);
		}

		return queue.Dequeue();
	}
}
