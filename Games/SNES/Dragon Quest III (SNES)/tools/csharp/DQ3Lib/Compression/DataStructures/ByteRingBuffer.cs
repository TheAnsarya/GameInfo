using DQ3Lib.Streams;

namespace DQ3Lib.Compression.DataStructures;

public class ByteRingBuffer : ByteArrayStream {
	private int _address;

	public override int Address {
		get => _address;
		set => _address = value % Size;
	}

	public ByteRingBuffer(int size, int startAddress) : base(size, startAddress) {
	}

	public ByteRingBuffer(byte[] buffer, int startAddress) : base(buffer, startAddress) {
	}

	// TODO: get rid of the new modifier?
	public new ByteRingBuffer Branch() => Branch(0);

	// TODO: get rid of the new modifier?
	public new ByteRingBuffer Branch(int startAddress) => new(Buffer, startAddress);
}
