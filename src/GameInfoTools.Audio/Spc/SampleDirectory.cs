namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Entry in the SPC sample directory.
/// Each entry is 4 bytes: 2-byte start address, 2-byte loop address.
/// </summary>
public readonly record struct SampleDirectoryEntry(ushort StartAddress, ushort LoopAddress) {
	/// <summary>
	/// Size of a directory entry in bytes.
	/// </summary>
	public const int EntrySize = 4;

	/// <summary>
	/// Parse an entry from raw bytes.
	/// </summary>
	public static SampleDirectoryEntry Parse(ReadOnlySpan<byte> data) {
		if (data.Length < EntrySize) {
			throw new ArgumentException($"Sample directory entry requires {EntrySize} bytes", nameof(data));
		}

		return new SampleDirectoryEntry(
			StartAddress: (ushort)(data[0] | (data[1] << 8)),
			LoopAddress: (ushort)(data[2] | (data[3] << 8))
		);
	}

	/// <summary>
	/// Serialize to bytes.
	/// </summary>
	public byte[] ToBytes() => [
		(byte)(StartAddress & 0xff),
		(byte)((StartAddress >> 8) & 0xff),
		(byte)(LoopAddress & 0xff),
		(byte)((LoopAddress >> 8) & 0xff)
	];
}

/// <summary>
/// Sample directory containing pointers to all BRR samples in the SPC.
/// </summary>
public class SampleDirectory {
	/// <summary>
	/// Maximum number of entries in the directory.
	/// The SRCN register is 8-bit, so max 256 samples.
	/// </summary>
	public const int MaxEntries = 256;

	/// <summary>
	/// Directory entries.
	/// </summary>
	public List<SampleDirectoryEntry> Entries { get; } = [];

	/// <summary>
	/// RAM address where the directory starts.
	/// </summary>
	public ushort BaseAddress { get; set; }

	/// <summary>
	/// Parse sample directory from SPC RAM at the given offset.
	/// </summary>
	public static SampleDirectory Parse(ReadOnlySpan<byte> ram, ushort directoryAddress, int maxEntries = MaxEntries) {
		var directory = new SampleDirectory { BaseAddress = directoryAddress };

		// Read entries until we hit invalid data or max entries
		for (int i = 0; i < maxEntries; i++) {
			int offset = directoryAddress + (i * SampleDirectoryEntry.EntrySize);
			if (offset + SampleDirectoryEntry.EntrySize > ram.Length) {
				break;
			}

			var entry = SampleDirectoryEntry.Parse(ram.Slice(offset, SampleDirectoryEntry.EntrySize));

			// Stop if we hit an invalid entry (address 0 or outside RAM)
			if (entry.StartAddress == 0 || entry.StartAddress >= ram.Length) {
				break;
			}

			directory.Entries.Add(entry);
		}

		return directory;
	}

	/// <summary>
	/// Get sample data for a specific entry index.
	/// Returns the BRR data from start to end (detected by end flag in BRR block).
	/// </summary>
	public ReadOnlySpan<byte> GetSampleData(int index, ReadOnlySpan<byte> ram) {
		if (index < 0 || index >= Entries.Count) {
			throw new ArgumentOutOfRangeException(nameof(index));
		}

		var entry = Entries[index];
		return ExtractBrrSample(ram, entry.StartAddress);
	}

	/// <summary>
	/// Extract BRR sample data starting at the given address.
	/// Reads 9-byte blocks until the end flag is set.
	/// </summary>
	private static ReadOnlySpan<byte> ExtractBrrSample(ReadOnlySpan<byte> ram, ushort startAddress) {
		const int blockSize = 9;
		int currentAddress = startAddress;
		int blocksRead = 0;

		// Find end of sample
		while (currentAddress + blockSize <= ram.Length) {
			byte header = ram[currentAddress];
			blocksRead++;
			currentAddress += blockSize;

			// Check end flag (bit 0 of header)
			if ((header & 0x01) != 0) {
				break;
			}

			// Safety limit to prevent infinite loops
			if (blocksRead > 10000) {
				break;
			}
		}

		int totalBytes = blocksRead * blockSize;
		return ram.Slice(startAddress, Math.Min(totalBytes, ram.Length - startAddress));
	}

	/// <summary>
	/// Get the number of samples in the directory.
	/// </summary>
	public int Count => Entries.Count;

	/// <summary>
	/// Serialize directory to bytes.
	/// </summary>
	public byte[] ToBytes() {
		var data = new byte[Entries.Count * SampleDirectoryEntry.EntrySize];
		for (int i = 0; i < Entries.Count; i++) {
			var entryBytes = Entries[i].ToBytes();
			Array.Copy(entryBytes, 0, data, i * SampleDirectoryEntry.EntrySize, entryBytes.Length);
		}
		return data;
	}
}
