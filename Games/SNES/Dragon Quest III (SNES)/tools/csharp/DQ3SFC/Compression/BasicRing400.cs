using DQ3SFC.DataStructures;
using DQ3SFC.Extensions;
using DQ3SFC.Sys;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DQ3SFC.Compression;

public static class BasicRing400 {
	// All known decompressions use 0x03be
	private const int StartWriteAddress = 0x03be;

	// This value can't change without changing the bit packing as address field is 10 bits
	private const int RingSize = 0x400;

	// These values can't change without changing the bit packing as copy size field is 6 bits + 3
	private const int MaxCopySize = 66;
	private const int MinCopySize = 3;

	public static Memory<byte> Decompress(Memory<byte> source, int outputSize) {
		return Decompress(new ByteArrayStream(source), outputSize);
	}

	public static Memory<byte> Decompress(ByteArrayStream source, int outputSize) {
		ArgumentNullException.ThrowIfNull(source, nameof(source));

		var output = new ByteArrayStream(outputSize);
		var work = new ByteRingBuffer(RingSize, StartWriteAddress);
		Queue<bool> commands = source.Byte().ToBooleanQueue();

		while (output.HasSpace) {
			if (commands.Count == 0) {
				commands = source.Byte().ToBooleanQueue();
			}

			if (commands.Dequeue()) {
				var b = source.Byte();

				work.Byte(b);
				output.Byte(b);
			} else {
				var d1 = source.Byte();
				var d2 = source.Byte();

				var address = d1 + ((d2 << 2) & 0x0300);
				var counter = (d2 & 0x3f) + 3;
				var copySource = work.Branch(address);

				while (output.HasSpace && (counter != 0)) {
					var copy = copySource.Byte();
					counter--;

					work.Byte(copy);
					output.Byte(copy);
				}
			}
		}

		return output.Buffer;
	}

	public static byte[] Compress(Memory<byte> target) {
		var commands = new List<Command>();
		var address = target.Length - 1;
		var data = new ReverseWindowReader(target, address);

		while (address >= 0) {
			Command? cmd = null;
			var offset = 1;
			while ((offset <= RingSize) && (cmd == null || cmd.CopySize < MaxCopySize)) {
				var testCommand = TestCandidate(data, address, address - offset);
				if ((testCommand != null) && ((cmd == null) || (testCommand.CopySize > cmd.CopySize))) {
					cmd = testCommand;
				}

				offset++;
			}

			if (cmd == null) {
				cmd = new Command { Simple = true, Value = data[address] };
				address--;
			} else {
				address -= cmd.CopySize;
			}

			commands.Add(cmd);
		}

		return CommandsToBytes(commands);
	}

	public static byte[] CompressMax(Memory<byte> target) {
		var data = new ReverseWindowReader(target, 0);
		var states = new State[target.Length];

		for (int i = 0; i < target.Length; i++) {
			var candidates = GetStates(data, i);
			State? best = null;

			if (candidates.Count == 0) {
				throw new DataAccessException($"{nameof(candidates)} is empty: i == {i} -- {nameof(target.Length)}: {target.Length}");
			}

			foreach (var current in candidates) {
				if (current.NextAddress < 0) {
					current.PathLength = current.Size;
				} else {
					// TODO: not checking states[] access for null because we want it to throw exception
					current.PathLength = states[current.NextAddress].PathLength + current.Size;
				}

				if ((best == null) || (current.PathLength < best.PathLength)) {
					best = current;
				}
			}

			states[i] = best;
		}

		var step = states[^1];
		var commands = new List<Command> { step.Command };
		while (step.NextAddress >= 0) {
			step = states[step.NextAddress];
			commands.Add(step.Command);
		}

		return CommandsToBytes(commands);
	}

	private static List<State> GetStates(ReverseWindowReader data, int address) {
		List<State> states = [
			new() {
				Command = new() { Simple = true, Value = data[address], CopySize = 1 },
				Address = address
			}
		];

		for (int offset = 1; offset <= RingSize; offset++) {
			var cmd = TestCandidate(data, address, address - offset);

			if (cmd != null) {
				states.Add(new State { Command = cmd, Address = address });
			}
		}

		return states;
	}

	private static byte[] CommandsToBytes(List<Command> commands) {
		commands.Reverse();
		var output = new List<byte>();
		foreach (var batch in commands.Chunk(8)) {
			byte command = 0;
			var batchData = new List<byte>();
			var count = 0;
			foreach (var cmd in batch) {
				if (cmd.Simple) {
					command += (byte)(1 << count);
					batchData.Add(cmd.Value);
				} else {
					var (high, low) = cmd.GetCopyData();
					batchData.Add(low);
					batchData.Add(high);
				}

				count++;
			}

			output.Add(command);
			output.AddRange(batchData);
		}

		return [.. output];
	}

	private static Command? TestCandidate(ReverseWindowReader data, int targetAddress, int sourceAddress) {
		if (data[targetAddress] != data[sourceAddress]) {
			return null;
		}

		var target = data.Branch(targetAddress);
		var source = data.Branch(sourceAddress);

		var count = 0;

		while (count < MaxCopySize) {
			if (target.Byte() != source.Byte()) {
				break;
			}

			count++;
		}

		return count < MinCopySize
			? null
			: new Command {
				Simple = false,
				CopySize = count,
				Address = (sourceAddress - count + 1 + StartWriteAddress) % RingSize
			};
	}

	private class Command {
		public const int MIN_COPY_SIZE = 3;
		public const int MAX_COPY_SIZE = 66;
		public bool Simple { get; set; }
		public byte Value { get; set; }

		private int _address;
		public int Address {
			get {
				return _address;
			}
			set {
				if (value is < 0 or >= RingSize) {
					throw new ArgumentOutOfRangeException($"{nameof(Address)} must be between 0x000 and 0x{RingSize:x3}: 0x{value:x3}");
				}

				_address = value;
			}
		}

		private int _copySize;
		public int CopySize {
			get {
				return _copySize;
			}
			set {
				if ((!Simple && (value < MIN_COPY_SIZE)) || (value > MAX_COPY_SIZE)) {
					// Range is (6 bits) + 3
					throw new ArgumentOutOfRangeException($"{nameof(CopySize)} must be between {MIN_COPY_SIZE} and {MAX_COPY_SIZE}: {value}");
				}

				_copySize = value;
			}
		}

		public (byte H, byte L) GetCopyData() {
			var low = (byte)(Address & 0xff);
			var high = (byte)(((Address & 0x300) >> 2) + (CopySize - 3));

			return (high, low);
		}
	}

	private class State {
		public required Command Command { get; set; }

		public int Address { get; set; }

		public int NextAddress => Address - Command.CopySize;

		// 1 command bit plus 1 or 2 data bytes
		public int Size => Command.Simple ? 9 : 17;

		public int PathLength { get; set; }
	}
}

