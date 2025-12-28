using System;
using System.Collections.Generic;

namespace DQ3SFC.DataStructures;

public class ByteArrayStream {
	public Memory<byte> Buffer { get; set; }

	public virtual int Address { get; set; }

	public int Size { get => Buffer.Length; }

	public bool HasSpace { get => Address < Size; }

	public bool AtEnd { get => Address >= Size; }

	public ByteArrayStream(int size) : this(size, 0) { }

	public ByteArrayStream(int size, int startAddress) {
		Buffer = new byte[size];
		Address = startAddress;
	}

	public ByteArrayStream(Memory<byte> buffer) : this(buffer, 0) { }

	public ByteArrayStream(Memory<byte> buffer, int startAddress) {
		Buffer = buffer;
		Address = startAddress;
	}

	public byte Byte() {
		return Buffer.Span[Address++];
	}

	public void Byte(byte value) {
		Buffer.Span[Address++] = value;
	}

	public byte ByteAt(int offset) {
		return Buffer.Span[Address + offset];
	}

	public ushort Word() {
		byte a = Buffer.Span[Address++];
		byte b = Buffer.Span[Address++];
		return (ushort)((b << 8) + a);
	}

	public void Word(ushort value) {
		Buffer.Span[Address++] = (byte)(value & 0x00ff);
		Buffer.Span[Address++] = (byte)((value & 0xff00) >> 8);
	}

	public ushort WordAt(int offset) {
		byte a = Buffer.Span[Address + offset];
		byte b = Buffer.Span[Address + offset + 1];
		return (ushort)((b << 8) + a);
	}

	public int Long() {
		byte a = Buffer.Span[Address++];
		byte b = Buffer.Span[Address++];
		byte c = Buffer.Span[Address++];
		return (c << 16) + (b << 8) + a;
	}

	public void Long(int value) {
		Buffer.Span[Address++] = (byte)(value & 0x0000ff);
		Buffer.Span[Address++] = (byte)((value & 0x00ff00) >> 8);
		Buffer.Span[Address++] = (byte)((value & 0xff0000) >> 16);
	}

	public int LongAt(int offset) {
		byte a = Buffer.Span[Address + offset];
		byte b = Buffer.Span[Address + offset + 1];
		byte c = Buffer.Span[Address + offset + 2];
		return (c << 16) + (b << 8) + a;
	}

	public void Skip(int length) => Address += length;

	public ByteArrayStream Branch() => Branch(0);

	public ByteArrayStream Branch(int startAddress) {
		return new ByteArrayStream(Buffer, startAddress);
	}

	public List<ByteArrayStream> FindAll(byte[] searchTerm) {
		ArgumentNullException.ThrowIfNull(searchTerm, nameof(searchTerm));

		var found = new List<ByteArrayStream>();

		var lastIndex = Buffer.Length - searchTerm.Length;
		var span = Buffer.Span;
		for (int i = 0; i <= lastIndex; i++) {
			var matches = true;

			for (int j = 0; j < searchTerm.Length; j++) {
				if (span[i + j] != searchTerm[j]) {
					matches = false;
					break;
				}
			}

			if (matches) {
				found.Add(Branch(i));
			}
		}

		return found;
	}

	// clamps to [0, Buffer.Length]
	// TODO: test & verify
	public (bool found, int address) FindLastInWindow(Memory<byte> searchTerm, int start, int end) {
		//			ArgumentNullException.ThrowIfNull(searchTerm, nameof(searchTerm));

		// TODO: check for off by one
		start = Math.Max(0, start);
		end = Math.Min(Buffer.Length, end);

		var lastIndex = end - searchTerm.Length;
		var span = Buffer.Span;
		for (int i = lastIndex; i >= start; i--) {
			var matches = true;

			for (int j = 0; j < searchTerm.Length; j++) {
				if (span[i + j] != searchTerm.Span[j]) {
					matches = false;
					break;
				}
			}

			if (matches) {
				return (true, i);
			}
		}

		return (false, -1);
	}

	public Memory<byte> GetBytes(int length) => GetBytes(length, Address);

	public Memory<byte> GetBytes(int length, int address) {
		if ((address + length) > Buffer.Length) {
			length = Buffer.Length - address;
		}

		//var output = new byte[length];
		//Array.Copy(Buffer, address, output, 0, length);

		var output = Buffer.Slice(address, length);

		return output;
	}

	public Memory<byte> GetBytesAt(int length, int offset) {
		var from = Address + offset;
		if ((from + length) > Buffer.Length) {
			length = Buffer.Length - from;
		}

		//var output = new byte[length];
		//Array.Copy(Buffer, from, output, 0, length);

		var output = Buffer.Slice(from, length);

		return output;
	}

	public Memory<byte> ReadUntil(byte endValue, int? maxLength = null) {
		var startAddress = Address;
		var length = 0;
		byte value = Byte();

		while (value != endValue && HasSpace && (maxLength == null || (length < maxLength))) {
			length++;
			value = Byte();
		}

		var output = Buffer.Slice(startAddress, length);
		return output;
	}

	// TODO: Add error checking
	public void CopyTo(ByteArrayStream destination, int length) {
		// Array.Copy() is not copying one byte at a time so copying within the same array doesn't update correctly.
		//Array.Copy(Buffer, Address, destination.Buffer, destination.Address, length);
		//Address += length;
		//destination.Address += length;
		ArgumentNullException.ThrowIfNull(destination, nameof(destination));

		for (int i = 0; i < length; i++) {
			destination.Byte(Byte());
		}
	}

	// TODO: Add error checking
	public void Write(IEnumerable<byte> data) {
		ArgumentNullException.ThrowIfNull(data, nameof(data));

		foreach (var b in data) {
			Byte(b);
		}
	}
}

