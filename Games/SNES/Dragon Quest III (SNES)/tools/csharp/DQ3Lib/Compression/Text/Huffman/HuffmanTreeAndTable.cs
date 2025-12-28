namespace DQ3Lib.Compression.Text.Huffman;

internal class HuffmanTreeAndTable {
	public required HuffmanNode Root { get; set; }

	public required EncodingTable EncodingTable { get; set; }
}
