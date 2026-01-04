namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Detailed memory inspector for SPC RAM analysis.
/// Helps visualize memory layout, find patterns, and identify data structures.
/// </summary>
public class SpcMemoryInspector {
	private readonly SpcFile _spc;

	public SpcMemoryInspector(SpcFile spc) {
		_spc = spc;
	}

	/// <summary>
	/// Get a complete memory map of the SPC file.
	/// </summary>
	public MemoryMap GetMemoryMap() {
		var map = new MemoryMap();

		// Reserved/Hardware area (boot ROM, IPL, etc.)
		map.Regions.Add(new MemoryRegion {
			Start = 0xffc0,
			End = 0xffff,
			Type = RegionType.Reserved,
			Name = "IPL ROM / Boot Code"
		});

		// Sample directory
		int dirStart = _spc.Dsp.DirectoryAddress;
		int dirEnd = dirStart + (_spc.SampleDirectory.Count * 4);
		map.Regions.Add(new MemoryRegion {
			Start = dirStart,
			End = dirEnd,
			Type = RegionType.SampleDirectory,
			Name = $"Sample Directory ({_spc.SampleDirectory.Count} entries)"
		});

		// Sample data
		var samples = _spc.ExtractSamples();
		foreach (var sample in samples) {
			map.Regions.Add(new MemoryRegion {
				Start = sample.StartAddress,
				End = sample.StartAddress + sample.Data.Length,
				Type = RegionType.SampleData,
				Name = $"Sample {sample.Index} ({sample.Data.Length} bytes)"
			});
		}

		// Echo buffer
		var echo = _spc.GetEchoConfig();
		if (echo.DelayMs > 0) {
			map.Regions.Add(new MemoryRegion {
				Start = echo.BufferAddress,
				End = echo.BufferAddress + echo.BufferSize,
				Type = RegionType.EchoBuffer,
				Name = $"Echo Buffer ({echo.DelayMs}ms)"
			});
		}

		// Detect code region (heuristic: starts at 0x0000 or low address)
		map.Regions.Add(new MemoryRegion {
			Start = 0x0000,
			End = Math.Min(dirStart, 0x0200),
			Type = RegionType.Code,
			Name = "Player Code (estimated)"
		});

		// Sort regions
		map.Regions = map.Regions.OrderBy(r => r.Start).ToList();

		// Find gaps (unknown regions)
		var gaps = new List<MemoryRegion>();
		int lastEnd = 0;
		foreach (var region in map.Regions.Where(r => r.Type != RegionType.Reserved)) {
			if (region.Start > lastEnd) {
				gaps.Add(new MemoryRegion {
					Start = lastEnd,
					End = region.Start,
					Type = RegionType.Unknown,
					Name = "Unknown"
				});
			}
			lastEnd = Math.Max(lastEnd, region.End);
		}

		// Add gap to end
		if (lastEnd < 0xffc0) {
			gaps.Add(new MemoryRegion {
				Start = lastEnd,
				End = 0xffc0,
				Type = RegionType.Unknown,
				Name = "Unknown / Free"
			});
		}

		map.Regions.AddRange(gaps);
		map.Regions = map.Regions.OrderBy(r => r.Start).ToList();

		// Calculate statistics
		map.TotalRam = SpcFile.RamSize;
		map.UsedByCode = map.Regions.Where(r => r.Type == RegionType.Code).Sum(r => r.Size);
		map.UsedBySamples = map.Regions.Where(r => r.Type == RegionType.SampleData).Sum(r => r.Size);
		map.UsedByDirectory = map.Regions.Where(r => r.Type == RegionType.SampleDirectory).Sum(r => r.Size);
		map.UsedByEcho = map.Regions.Where(r => r.Type == RegionType.EchoBuffer).Sum(r => r.Size);
		map.Free = map.Regions.Where(r => r.Type == RegionType.Unknown).Sum(r => r.Size);

		return map;
	}

	/// <summary>
	/// Generate a hex dump of a memory region.
	/// </summary>
	public string HexDump(int start, int length, int bytesPerLine = 16) {
		var sb = new System.Text.StringBuilder();
		int end = Math.Min(start + length, _spc.Ram.Length);

		for (int addr = start; addr < end; addr += bytesPerLine) {
			sb.Append($"{addr:X4}: ");

			// Hex bytes
			for (int i = 0; i < bytesPerLine; i++) {
				if (addr + i < end) {
					sb.Append($"{_spc.Ram[addr + i]:X2} ");
				} else {
					sb.Append("   ");
				}
				if (i == 7) sb.Append(' ');
			}

			sb.Append(" |");

			// ASCII representation
			for (int i = 0; i < bytesPerLine && addr + i < end; i++) {
				byte b = _spc.Ram[addr + i];
				sb.Append(b >= 0x20 && b < 0x7f ? (char)b : '.');
			}

			sb.AppendLine("|");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Find all occurrences of a byte pattern in RAM.
	/// </summary>
	public List<int> FindPattern(byte[] pattern) {
		var results = new List<int>();

		for (int i = 0; i <= _spc.Ram.Length - pattern.Length; i++) {
			bool match = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (_spc.Ram[i + j] != pattern[j]) {
					match = false;
					break;
				}
			}
			if (match) results.Add(i);
		}

		return results;
	}

	/// <summary>
	/// Find pointers to a given address in RAM.
	/// </summary>
	public List<int> FindPointersTo(int targetAddress) {
		var results = new List<int>();
		byte lo = (byte)(targetAddress & 0xff);
		byte hi = (byte)((targetAddress >> 8) & 0xff);

		for (int i = 0; i < _spc.Ram.Length - 1; i++) {
			if (_spc.Ram[i] == lo && _spc.Ram[i + 1] == hi) {
				results.Add(i);
			}
		}

		return results;
	}

	/// <summary>
	/// Analyze a range of RAM for data patterns.
	/// </summary>
	public DataPatternAnalysis AnalyzeRange(int start, int length) {
		var analysis = new DataPatternAnalysis {
			Start = start,
			Length = length
		};

		int end = Math.Min(start + length, _spc.Ram.Length);
		var data = _spc.Ram.AsSpan(start, end - start);

		// Count byte frequencies
		var frequencies = new int[256];
		foreach (byte b in data) {
			frequencies[b]++;
		}

		// Find most common bytes
		analysis.MostCommonBytes = frequencies
			.Select((count, value) => (Byte: value, Count: count))
			.OrderByDescending(x => x.Count)
			.Take(5)
			.Select(x => ((byte)x.Byte, x.Count))
			.ToList();

		// Calculate entropy
		double entropy = 0;
		foreach (int count in frequencies) {
			if (count > 0) {
				double p = (double)count / data.Length;
				entropy -= p * Math.Log2(p);
			}
		}
		analysis.Entropy = entropy;

		// Detect data type based on patterns
		if (entropy < 1.0) {
			analysis.ProbableType = DataType.Sparse;
		} else if (entropy > 7.5) {
			analysis.ProbableType = DataType.Random;
		} else if (AllBrrBlocks(data)) {
			analysis.ProbableType = DataType.BrrSample;
		} else if (LooksLikeCode(data)) {
			analysis.ProbableType = DataType.Code;
		} else if (LooksLikeSequence(data)) {
			analysis.ProbableType = DataType.SequenceData;
		} else {
			analysis.ProbableType = DataType.Unknown;
		}

		return analysis;
	}

	/// <summary>
	/// Read a 16-bit little-endian value.
	/// </summary>
	public ushort ReadWord(int address) {
		return (ushort)(_spc.Ram[address] | (_spc.Ram[address + 1] << 8));
	}

	/// <summary>
	/// Get DSP register state summary.
	/// </summary>
	public string GetDspSummary() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("DSP Register Summary:");
		sb.AppendLine($"  Directory:    ${_spc.Dsp.DirectoryAddress:X4}");
		sb.AppendLine($"  Main Volume:  L={_spc.Dsp.MainVolumeLeft,4} R={_spc.Dsp.MainVolumeRight,4}");
		sb.AppendLine($"  Echo Volume:  L={_spc.Dsp.EchoVolumeLeft,4} R={_spc.Dsp.EchoVolumeRight,4}");
		sb.AppendLine($"  Key On:       {ToBinary(_spc.Dsp.KeyOn)}");
		sb.AppendLine($"  Key Off:      {ToBinary(_spc.Dsp.KeyOff)}");
		sb.AppendLine($"  Echo Enable:  {ToBinary(_spc.Dsp.EchoEnable)}");
		sb.AppendLine($"  Noise Enable: {ToBinary(_spc.Dsp.NoiseEnable)}");
		sb.AppendLine($"  Pitch Mod:    {ToBinary(_spc.Dsp.PitchModulation)}");
		sb.AppendLine($"  Noise Clock:  {_spc.Dsp.NoiseClock} ({_spc.Dsp.NoiseFrequencyHz} Hz)");
		sb.AppendLine($"  Flags:        Reset={_spc.Dsp.IsReset} Muted={_spc.Dsp.IsMuted} NoEchoWrite={_spc.Dsp.EchoWriteDisabled}");
		return sb.ToString();
	}

	private static string ToBinary(byte value) => Convert.ToString(value, 2).PadLeft(8, '0');

	private static bool AllBrrBlocks(ReadOnlySpan<byte> data) {
		if (data.Length < 9 || data.Length % 9 != 0) return false;

		// Check for valid BRR headers (range/filter should be reasonable)
		for (int i = 0; i < data.Length; i += 9) {
			byte header = data[i];
			int range = (header >> 4) & 0x0f;
			int filter = (header >> 2) & 0x03;

			// Range > 12 is usually invalid, filter > 3 is always invalid
			if (range > 12 || filter > 3) return false;
		}

		return true;
	}

	private static bool LooksLikeCode(ReadOnlySpan<byte> data) {
		if (data.Length < 10) return false;

		// SPC700 opcodes that commonly appear in music player code
		int codeOpcodes = 0;
		byte[] commonOpcodes = [0x8f, 0xc4, 0xcd, 0xe8, 0xba, 0xda, 0x2f, 0xd0];

		foreach (byte b in data) {
			if (Array.IndexOf(commonOpcodes, b) >= 0) codeOpcodes++;
		}

		return (double)codeOpcodes / data.Length > 0.1;
	}

	private static bool LooksLikeSequence(ReadOnlySpan<byte> data) {
		if (data.Length < 20) return false;

		// Sequence data often has many values in the $00-$7F range (notes)
		int noteValues = 0;
		foreach (byte b in data) {
			if (b >= 0x10 && b <= 0x7f) noteValues++;
		}

		return (double)noteValues / data.Length > 0.4;
	}
}

/// <summary>
/// Memory map of SPC RAM.
/// </summary>
public class MemoryMap {
	public List<MemoryRegion> Regions { get; set; } = [];
	public int TotalRam { get; set; }
	public int UsedByCode { get; set; }
	public int UsedBySamples { get; set; }
	public int UsedByDirectory { get; set; }
	public int UsedByEcho { get; set; }
	public int Free { get; set; }

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine("=== SPC Memory Map ===");
		sb.AppendLine();
		sb.AppendLine($"{"Region",-30} {"Start",-8} {"End",-8} {"Size",-8} {"Type"}");
		sb.AppendLine(new string('-', 70));

		foreach (var region in Regions) {
			sb.AppendLine($"{region.Name,-30} ${region.Start:X4}    ${region.End:X4}    {region.Size,6}   {region.Type}");
		}

		sb.AppendLine();
		sb.AppendLine("Summary:");
		sb.AppendLine($"  Code:       {UsedByCode,6} bytes ({UsedByCode * 100.0 / TotalRam:F1}%)");
		sb.AppendLine($"  Samples:    {UsedBySamples,6} bytes ({UsedBySamples * 100.0 / TotalRam:F1}%)");
		sb.AppendLine($"  Directory:  {UsedByDirectory,6} bytes ({UsedByDirectory * 100.0 / TotalRam:F1}%)");
		sb.AppendLine($"  Echo:       {UsedByEcho,6} bytes ({UsedByEcho * 100.0 / TotalRam:F1}%)");
		sb.AppendLine($"  Free/Other: {Free,6} bytes ({Free * 100.0 / TotalRam:F1}%)");

		return sb.ToString();
	}
}

/// <summary>
/// Memory region in SPC RAM.
/// </summary>
public class MemoryRegion {
	public int Start { get; init; }
	public int End { get; init; }
	public RegionType Type { get; init; }
	public string Name { get; init; } = "";

	public int Size => End - Start;
}

/// <summary>
/// Types of memory regions.
/// </summary>
public enum RegionType {
	Unknown,
	Code,
	SampleDirectory,
	SampleData,
	SequenceData,
	EchoBuffer,
	Reserved
}

/// <summary>
/// Analysis of data patterns in a memory range.
/// </summary>
public class DataPatternAnalysis {
	public int Start { get; init; }
	public int Length { get; init; }
	public double Entropy { get; set; }
	public DataType ProbableType { get; set; }
	public List<(byte Byte, int Count)> MostCommonBytes { get; set; } = [];

	public override string ToString() {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"Analysis: ${Start:X4} - ${Start + Length:X4} ({Length} bytes)");
		sb.AppendLine($"  Entropy: {Entropy:F2} bits/byte");
		sb.AppendLine($"  Type:    {ProbableType}");
		sb.AppendLine($"  Common bytes: {string.Join(", ", MostCommonBytes.Select(x => $"${x.Byte:X2}({x.Count})"))}");
		return sb.ToString();
	}
}

/// <summary>
/// Detected data type.
/// </summary>
public enum DataType {
	Unknown,
	Code,
	BrrSample,
	SequenceData,
	Sparse,
	Random
}
