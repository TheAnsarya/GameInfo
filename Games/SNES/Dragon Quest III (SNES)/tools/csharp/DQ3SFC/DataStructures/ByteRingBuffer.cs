using System;

namespace DQ3SFC.DataStructures;

class ByteRingBuffer : ByteArrayStream {
	private int _address;
	public override int Address {
		get {
			return _address;
		}
		set {
			_address = value % Size;
		}
	}

	public ByteRingBuffer(int size, int startAddress) : base(size, startAddress) {
	}

	public ByteRingBuffer(Memory<byte> buffer, int startAddress) : base(buffer, startAddress) {
	}

	// TODO: get rid of the new modifier?
	public new ByteRingBuffer Branch() => Branch(0);

	// TODO: get rid of the new modifier?
	public new ByteRingBuffer Branch(int startAddress) {
		return new ByteRingBuffer(Buffer, startAddress);
	}
}

