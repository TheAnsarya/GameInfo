using System.Collections.ObjectModel;

namespace DQ3Lib.Compression.Text.Huffman;

internal class Frequencies : ReadOnlyDictionary<char, int> {
	public Frequencies(Dictionary<char, int> dictionary) : base(dictionary) { }

	public static Frequencies CalculateFrequencies(string text) {
		ArgumentNullException.ThrowIfNull(text, nameof(text));

		Dictionary<char, int> frequencies = [];

		foreach (var character in text) {
			if (!frequencies.ContainsKey(character)) {
				frequencies[character] = 0;
			}

			frequencies[character]++;
		}

		return new Frequencies(frequencies);
	}
}
