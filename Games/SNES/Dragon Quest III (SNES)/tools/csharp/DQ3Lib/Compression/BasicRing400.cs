using DQ3Lib.Compression.DataStructures;
using DQ3Lib.Streams;
using System.Globalization;

namespace DQ3Lib.Compression;

public static class BasicRing400 {
	// All known decompressions use 0x03be
	private const int StartWriteAddress = 0x03be;

	// This value can't change without changing the bit packing as address field is 10 bits
	private const int RingSize = 0x400;

	// These values can't change without changing the bit packing as copy size field is 6 bits + 3
	private const int MaxCopySize = 66;
	private const int MinCopySize = 3;

	public static byte[] Decompress(byte[] source, int outputSize) {
		return Decompress(new ByteArrayStream(source), outputSize);
	}

	public static byte[] Decompress(ByteArrayStream source, int outputSize) {
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

				while (output.HasSpace && counter != 0) {
					var copy = copySource.Byte();
					counter--;

					work.Byte(copy);
					output.Byte(copy);
				}
			}
		}

		return output.Buffer;
	}

	public static byte[] Compress(byte[] target) {
		ArgumentNullException.ThrowIfNull(target, nameof(target));

		var commands = new List<Command>();
		var address = target.Length - 1;
		var data = new ReverseWindowReader(target, address);

		while (address >= 0) {
			Command? cmd = null;
			var offset = 1;
			while (offset <= RingSize && (cmd == null || cmd.CopySize < MaxCopySize)) {
				var testCommand = TestCandidate(data, address, address - offset);
				if (testCommand != null && (cmd == null || testCommand.CopySize > cmd.CopySize)) {
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

	public static byte[] CompressMax(byte[] target) {
		ArgumentNullException.ThrowIfNull(target, nameof(target));

		var data = new ReverseWindowReader(target, 0);
		var states = new State[target.Length];

		for (int i = 0; i < target.Length; i++) {
			var candidates = GetStates(data, i);
			State? best = null;
			foreach (var current in candidates) {
				if (current.NextAddress < 0) {
					current.PathLength = current.Size;
				} else {
					// TODO: not checking states[] access for null because we want it to throw exception
					current.PathLength = states[current.NextAddress].PathLength + current.Size;
				}

				if (best == null || current.PathLength < best.PathLength) {
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
		var states = new List<State>{
			new() {
				Command = new Command { Simple = true, Value = data[address], CopySize = 1 },
				Address = address
			}
		};

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

		return output.ToArray();
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
					throw new ArgumentOutOfRangeException($"{nameof(Address)} must be between 0x000 and 0x{RingSize.ToString("x3", CultureInfo.InvariantCulture)}: 0x{value.ToString("x3", CultureInfo.InvariantCulture)}");
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
				if ((!Simple && value < MIN_COPY_SIZE) || value > MAX_COPY_SIZE) {
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


	// TODO: Move to unit test project
	public static void TestLayout() {
		var compressed = TestData.StringToBytes(TestData.OverworldLayoutCompressed);
		var uncompressed = TestData.StringToBytes(TestData.OverworldLayout);

		var testDecomp = BasicRing400.Decompress(Rom.GetStream(0xed8a00), 0x2000);
		var decompPassed = testDecomp.SequenceEqual(uncompressed);

		var testComp = BasicRing400.Compress(uncompressed);
		var compPassed = testComp.SequenceEqual(compressed);

		var testReDecomp = Decompress(testComp, 0x2000);
		var reDecompPassed = testReDecomp.SequenceEqual(uncompressed);

		var testMaxComp = BasicRing400.CompressMax(uncompressed);
		var maxcompPassed = testMaxComp.SequenceEqual(compressed);

		var testMaxReDecomp = Decompress(testComp, 0x2000);
		var maxreDecompPassed = testMaxReDecomp.SequenceEqual(uncompressed);

		var folder = @"c:\working\test\";
		Directory.CreateDirectory(folder);
		WriteBytesToFile(compressed, Path.Combine(folder, "compressed.txt"));
		WriteBytesToFile(uncompressed, Path.Combine(folder, "uncompressed.txt"));
		WriteBytesToFile(testDecomp, Path.Combine(folder, "testDecomp.txt"));
		WriteBytesToFile(testComp, Path.Combine(folder, "testComp.txt"));
		WriteBytesToFile(testReDecomp, Path.Combine(folder, "testReDecomp.txt"));
		WriteBytesToFile(testMaxComp, Path.Combine(folder, "testMaxComp.txt"));
		WriteBytesToFile(testReDecomp, Path.Combine(folder, "testReDecomp.txt"));

		Console.WriteLine($"  Decompression: {(decompPassed ? "Passed" : "Failed")}");
		Console.WriteLine($"           size: 0x{testDecomp.Length.ToString("x4", CultureInfo.InvariantCulture)}");
		Console.WriteLine($"       realsize: 0x{uncompressed.Length.ToString("x4", CultureInfo.InvariantCulture)}");

		Console.WriteLine();

		Console.WriteLine($"    Compression: {(compPassed ? "Passed" : "Failed")}");
		Console.WriteLine($"           size: 0x{testComp.Length.ToString("x4", CultureInfo.InvariantCulture)}");
		Console.WriteLine($"       realsize: 0x{compressed.Length.ToString("x4", CultureInfo.InvariantCulture)}");

		Console.WriteLine();

		Console.WriteLine($"ReDecompression: {(reDecompPassed ? "Passed" : "Failed")}");
		Console.WriteLine($"           size: 0x{testReDecomp.Length.ToString("x4", CultureInfo.InvariantCulture)}");
		Console.WriteLine($"       realsize: 0x{uncompressed.Length.ToString("x4", CultureInfo.InvariantCulture)}");

		Console.WriteLine();

		Console.WriteLine($"Max Compression: {(maxcompPassed ? "Passed" : "Failed")}");
		Console.WriteLine($"           size: 0x{testMaxComp.Length.ToString("x4", CultureInfo.InvariantCulture)}");
		Console.WriteLine($"       realsize: 0x{compressed.Length.ToString("x4", CultureInfo.InvariantCulture)}");

		Console.WriteLine();

		Console.WriteLine($"Max ReDecompped: {(maxreDecompPassed ? "Passed" : "Failed")}");
		Console.WriteLine($"           size: 0x{testMaxReDecomp.Length.ToString("x4", CultureInfo.InvariantCulture)}");
		Console.WriteLine($"       realsize: 0x{uncompressed.Length.ToString("x4", CultureInfo.InvariantCulture)}");

		Console.ReadKey();
	}

	public static void WriteBytesToFile(byte[] data, string filename) {
		var lines = data.Chunk(16).Select(x => string.Join(" ", x.Select(y => y.ToString("x2", CultureInfo.InvariantCulture))));
		File.WriteAllLines(filename, lines);
	}
}
