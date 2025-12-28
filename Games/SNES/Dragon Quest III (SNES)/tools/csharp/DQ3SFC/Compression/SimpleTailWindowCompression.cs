using DQ3SFC.DataStructures;
using System;
using System.Collections.Generic;

namespace DQ3SFC.Compression;

// Not sure what else to call this
// Used by FFMQ
/*
 * source layout is:
 *		word offset to start of data[] array
 *		byte[] commands - read as stream
 *			1 or 2 bytes, start with byte #1
 *			if 0, end decompression
 *			if low nibble not 0, copy low nibble of bytes from data[] to output[]
 *			if high nibble not 0, copy high nibble + 2 bytes from output[] to output[]
 *				source address on output is current output address minus byte #2 minus 1
 *				so source address can't be larger than the last byte written
 *		byte[] data - read as stream
 */
class SimpleTailWindowCompression {

	// TODO: Need to get rid of outputSize as this compression has an ending command so no need
	public static Memory<byte> Decompress(byte[] source, int outputSize) {
		return Decompress(new ByteArrayStream(source), outputSize);
	}

	public static Memory<byte> Decompress(ByteArrayStream source, int outputSize) {
		var (comp, decomp) = DecompressFull(source, outputSize);
		return decomp;
	}

	public static (Memory<byte> comp, Memory<byte> decomp) DecompressFull(ByteArrayStream source, int outputSize) {
		var startAddress = source.Address;
		var dataSourceOffset = source.Word();
		var dataSource = source.Branch(source.Address + dataSourceOffset);

		var output = new ByteArrayStream(outputSize);

		byte command;

		while ((command = source.Byte()) != 0x00) {
			if ((command & 0x0f) != 0) {
				var length = command & 0x0f;
				dataSource.CopyTo(output, length);
			}

			if ((command & 0xf0) != 0) {
				var length = ((command & 0xf0) >> 4) + 2;

				var address = output.Address - source.Byte() - 1;
				if (address < 0) {
					throw new IndexOutOfRangeException($"{nameof(address)} cannot be less than 0");
				}

				output.Branch(address).CopyTo(output, length);
			}
		}

		var comp = source.GetBytes(dataSource.Address - startAddress, startAddress);
		var decomp = output.GetBytes(output.Address, 0);
		return (comp, decomp);
	}

	public static Memory<byte> Compress(byte[] target) {
		return Compress(new ByteArrayStream(target));
	}

	public static Memory<byte> Compress(ByteArrayStream target) {
		var commands = new List<byte>();
		var data = new List<byte>();
		var copyData = 0;

		while (!target.AtEnd) {
			var term = target.GetBytes(0x11);
			var copyOutput = 0;
			var copyOffset = -1;

			while (term.Length >= 3) {
				var (found, address) = target.FindLastInWindow(term, target.Address - 256, target.Address + term.Length - 1);

				if (found) {
					copyOutput = term.Length - 2;
					copyOffset = target.Address - address - 1;
					break;
				}

				term = target.GetBytes(term.Length - 1);
			}

			if (copyOutput == 0) {
				if (copyData == 0xf) {
					commands.Add((byte)copyData);
					copyData = 1;
				} else {
					copyData++;
				}

				data.Add(target.Byte());
			} else {
				commands.Add((byte)((copyOutput << 4) + copyData));
				commands.Add((byte)copyOffset);
				copyData = 0;
				target.Address += term.Length;
			}
		}

		// Add last copy data command
		if (copyData != 0) {
			commands.Add((byte)copyData);
		}

		// Add terminating command
		commands.Add(0);

		var output = new ByteArrayStream(commands.Count + data.Count + 2);

		var dataOffset = commands.Count;
		if (dataOffset > 0xffff) {
			throw new Exception($"{nameof(dataOffset)} cannot be larger than 0xffff. {nameof(commands)} is too large");
		}

		output.Word((ushort)dataOffset);
		output.Write(commands);
		output.Write(data);

		return output.Buffer;
	}
}

