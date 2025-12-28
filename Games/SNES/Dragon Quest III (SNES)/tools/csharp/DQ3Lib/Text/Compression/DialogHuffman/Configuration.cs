namespace DQ3Lib.Text.Compression.DialogHuffman;

// Using file addresses, not ROM addresses ($00, not $c0)
internal class Configuration {
	private int LeftTableAddress { get; init; } = 0x159d3;

	private int RightTableAddress { get; init; } = 0x161a7;

	private int NumberOfEntries { get; init; } = 0x3ea;
}

