namespace DQ3Lib.Compression.DataStructures;

internal class ReverseReader {
	private byte[] Buffer { get; set; }

	private int Address { get; set; }

	public byte this[int address] => (address >= 0) ? Buffer[address] : throw new IndexOutOfRangeException($"{nameof(address)} cannot be less than zero");

	public ReverseReader(byte[] buffer, int startAddress) {
		Buffer = buffer;
		Address = startAddress;
	}

	public ReverseReader Branch(int address) => new(Buffer, address);

	public byte Byte() => this[Address--];
}
