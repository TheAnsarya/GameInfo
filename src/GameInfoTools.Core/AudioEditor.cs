using System.Text;

namespace GameInfoTools.Core;

/// <summary>
/// Editor for game audio data including NSF, SPC, and raw audio extraction.
/// </summary>
public static class AudioEditor {
	#region Format Detection

	/// <summary>
	/// Detect audio format from data.
	/// </summary>
	public static AudioFormat DetectFormat(byte[] data) {
		if (data.Length < 4) {
			return AudioFormat.Unknown;
		}

		var magic = Encoding.ASCII.GetString(data, 0, Math.Min(4, data.Length));

		// NSF - NES Sound Format
		if (magic.StartsWith("NESM")) {
			return AudioFormat.Nsf;
		}

		// NSFe - Extended NSF
		if (magic.StartsWith("NSFE")) {
			return AudioFormat.Nsfe;
		}

		// SPC - SNES SPC700 sound
		if (magic.StartsWith("SNES") && data.Length > 33 && Encoding.ASCII.GetString(data, 0, 33).Contains("SPC700")) {
			return AudioFormat.Spc;
		}

		// GBS - Game Boy Sound
		if (magic == "GBS\x01") {
			return AudioFormat.Gbs;
		}

		// VGM - Video Game Music
		if (magic == "Vgm ") {
			return AudioFormat.Vgm;
		}

		// HES - PC Engine sound
		if (magic == "HESM") {
			return AudioFormat.Hes;
		}

		// GSF - GBA Sound
		if (magic == "PSF\x22") {
			return AudioFormat.Gsf;
		}

		// MIDI
		if (magic == "MThd") {
			return AudioFormat.Midi;
		}

		return AudioFormat.Unknown;
	}

	/// <summary>
	/// Get detailed information about an audio file.
	/// </summary>
	public static AudioFileInfo GetAudioInfo(byte[] data) {
		var format = DetectFormat(data);

		return format switch {
			AudioFormat.Nsf => ParseNsfInfo(data),
			AudioFormat.Nsfe => ParseNsfeInfo(data),
			AudioFormat.Spc => ParseSpcInfo(data),
			AudioFormat.Gbs => ParseGbsInfo(data),
			AudioFormat.Vgm => ParseVgmInfo(data),
			AudioFormat.Midi => ParseMidiInfo(data),
			_ => new AudioFileInfo(format, data.Length, null, null, null, 0, null, [])
		};
	}

	#endregion

	#region NSF Parsing

	private static AudioFileInfo ParseNsfInfo(byte[] data) {
		if (data.Length < 128) {
			return new AudioFileInfo(AudioFormat.Nsf, data.Length, null, null, null, 0, null, []);
		}

		int version = data[5];
		int trackCount = data[6];
		int startTrack = data[7];
		ushort loadAddress = (ushort)(data[8] | (data[9] << 8));
		ushort initAddress = (ushort)(data[10] | (data[11] << 8));
		ushort playAddress = (ushort)(data[12] | (data[13] << 8));

		string title = Encoding.ASCII.GetString(data, 14, 32).TrimEnd('\0');
		string artist = Encoding.ASCII.GetString(data, 46, 32).TrimEnd('\0');
		string copyright = Encoding.ASCII.GetString(data, 78, 32).TrimEnd('\0');

		ushort ntscSpeed = (ushort)(data[110] | (data[111] << 8));
		byte[] bankswitch = new byte[8];
		Array.Copy(data, 112, bankswitch, 0, 8);
		ushort palSpeed = (ushort)(data[120] | (data[121] << 8));
		int region = data[122] & 0x03;
		int expansion = data[123];

		var metadata = new Dictionary<string, string> {
			["Load Address"] = $"${loadAddress:x4}",
			["Init Address"] = $"${initAddress:x4}",
			["Play Address"] = $"${playAddress:x4}",
			["Region"] = region switch { 0 => "NTSC", 1 => "PAL", 2 => "Dual", _ => "Unknown" },
			["Expansion"] = GetNsfExpansion(expansion),
			["NTSC Speed"] = $"{ntscSpeed} µs",
			["PAL Speed"] = $"{palSpeed} µs"
		};

		return new AudioFileInfo(
			AudioFormat.Nsf,
			data.Length,
			title,
			artist,
			copyright,
			trackCount,
			SystemType.Nes,
			metadata
		);
	}

	private static string GetNsfExpansion(int expansion) {
		var chips = new List<string>();
		if ((expansion & 0x01) != 0) chips.Add("VRC6");
		if ((expansion & 0x02) != 0) chips.Add("VRC7");
		if ((expansion & 0x04) != 0) chips.Add("FDS");
		if ((expansion & 0x08) != 0) chips.Add("MMC5");
		if ((expansion & 0x10) != 0) chips.Add("Namco 163");
		if ((expansion & 0x20) != 0) chips.Add("Sunsoft 5B");

		return chips.Count > 0 ? string.Join(", ", chips) : "None";
	}

	private static AudioFileInfo ParseNsfeInfo(byte[] data) {
		// NSFe uses chunked format - parse basic info
		var info = new AudioFileInfo(AudioFormat.Nsfe, data.Length, null, null, null, 0, SystemType.Nes, []);

		int offset = 4; // Skip magic
		while (offset + 8 <= data.Length) {
			int chunkSize = data[offset] | (data[offset + 1] << 8) | (data[offset + 2] << 16) | (data[offset + 3] << 24);
			string chunkType = Encoding.ASCII.GetString(data, offset + 4, 4);

			if (chunkType == "INFO" && offset + 8 + chunkSize <= data.Length) {
				// Parse INFO chunk for track count
				if (chunkSize >= 1) {
					info = info with { TrackCount = data[offset + 8] + 1 };
				}
			} else if (chunkType == "auth" && offset + 8 + chunkSize <= data.Length) {
				// Parse auth chunk for metadata
				var strings = ParseNullTerminatedStrings(data, offset + 8, chunkSize);
				if (strings.Count >= 1) info = info with { Title = strings[0] };
				if (strings.Count >= 2) info = info with { Artist = strings[1] };
				if (strings.Count >= 3) info = info with { Copyright = strings[2] };
			} else if (chunkType == "NEND") {
				break; // End of file
			}

			offset += 8 + chunkSize;
		}

		return info;
	}

	private static List<string> ParseNullTerminatedStrings(byte[] data, int offset, int length) {
		var result = new List<string>();
		var sb = new StringBuilder();

		for (int i = 0; i < length && offset + i < data.Length; i++) {
			if (data[offset + i] == 0) {
				result.Add(sb.ToString());
				sb.Clear();
			} else {
				sb.Append((char)data[offset + i]);
			}
		}

		return result;
	}

	#endregion

	#region SPC Parsing

	private static AudioFileInfo ParseSpcInfo(byte[] data) {
		if (data.Length < 256) {
			return new AudioFileInfo(AudioFormat.Spc, data.Length, null, null, null, 0, SystemType.Snes, []);
		}

		// ID666 tag parsing (text format at offset 0x2e)
		string title = Encoding.ASCII.GetString(data, 0x2e, 32).TrimEnd('\0');
		string game = Encoding.ASCII.GetString(data, 0x4e, 32).TrimEnd('\0');
		string dumper = Encoding.ASCII.GetString(data, 0x6e, 16).TrimEnd('\0');
		string comments = Encoding.ASCII.GetString(data, 0x7e, 32).TrimEnd('\0');
		string date = Encoding.ASCII.GetString(data, 0x9e, 11).TrimEnd('\0');
		string lengthStr = Encoding.ASCII.GetString(data, 0xa9, 3).TrimEnd('\0');
		string fadeStr = Encoding.ASCII.GetString(data, 0xac, 5).TrimEnd('\0');
		string artist = Encoding.ASCII.GetString(data, 0xb1, 32).TrimEnd('\0');

		var metadata = new Dictionary<string, string> {
			["Game"] = game,
			["Dumper"] = dumper,
			["Comments"] = comments,
			["Date"] = date,
			["Length"] = lengthStr,
			["Fade"] = fadeStr
		};

		// Filter empty entries
		metadata = metadata.Where(kvp => !string.IsNullOrWhiteSpace(kvp.Value))
			.ToDictionary(kvp => kvp.Key, kvp => kvp.Value);

		return new AudioFileInfo(
			AudioFormat.Spc,
			data.Length,
			title,
			artist,
			null,
			1, // SPCs are single-track
			SystemType.Snes,
			metadata
		);
	}

	#endregion

	#region GBS Parsing

	private static AudioFileInfo ParseGbsInfo(byte[] data) {
		if (data.Length < 112) {
			return new AudioFileInfo(AudioFormat.Gbs, data.Length, null, null, null, 0, SystemType.GameBoy, []);
		}

		int trackCount = data[4];
		int firstTrack = data[5];
		ushort loadAddress = (ushort)(data[6] | (data[7] << 8));
		ushort initAddress = (ushort)(data[8] | (data[9] << 8));
		ushort playAddress = (ushort)(data[10] | (data[11] << 8));
		ushort stackPointer = (ushort)(data[12] | (data[13] << 8));

		string title = Encoding.ASCII.GetString(data, 16, 32).TrimEnd('\0');
		string artist = Encoding.ASCII.GetString(data, 48, 32).TrimEnd('\0');
		string copyright = Encoding.ASCII.GetString(data, 80, 32).TrimEnd('\0');

		var metadata = new Dictionary<string, string> {
			["Load Address"] = $"${loadAddress:x4}",
			["Init Address"] = $"${initAddress:x4}",
			["Play Address"] = $"${playAddress:x4}",
			["Stack Pointer"] = $"${stackPointer:x4}",
			["First Track"] = firstTrack.ToString()
		};

		return new AudioFileInfo(
			AudioFormat.Gbs,
			data.Length,
			title,
			artist,
			copyright,
			trackCount,
			SystemType.GameBoy,
			metadata
		);
	}

	#endregion

	#region VGM Parsing

	private static AudioFileInfo ParseVgmInfo(byte[] data) {
		if (data.Length < 64) {
			return new AudioFileInfo(AudioFormat.Vgm, data.Length, null, null, null, 1, null, []);
		}

		uint version = (uint)(data[8] | (data[9] << 8) | (data[10] << 16) | (data[11] << 24));
		uint totalSamples = (uint)(data[0x18] | (data[0x19] << 8) | (data[0x1a] << 16) | (data[0x1b] << 24));
		uint loopOffset = (uint)(data[0x1c] | (data[0x1d] << 8) | (data[0x1e] << 16) | (data[0x1f] << 24));
		uint loopSamples = (uint)(data[0x20] | (data[0x21] << 8) | (data[0x22] << 16) | (data[0x23] << 24));

		var chips = DetectVgmChips(data);

		double durationSeconds = totalSamples / 44100.0;
		string duration = $"{(int)(durationSeconds / 60)}:{(int)(durationSeconds % 60):d2}";

		var metadata = new Dictionary<string, string> {
			["Version"] = $"{(version >> 8) & 0xff}.{version & 0xff:x2}",
			["Duration"] = duration,
			["Total Samples"] = totalSamples.ToString("N0"),
			["Loop Offset"] = loopOffset > 0 ? $"0x{loopOffset:x8}" : "None",
			["Loop Samples"] = loopSamples.ToString("N0"),
			["Chips"] = string.Join(", ", chips)
		};

		return new AudioFileInfo(
			AudioFormat.Vgm,
			data.Length,
			null,
			null,
			null,
			1,
			null,
			metadata
		);
	}

	private static List<string> DetectVgmChips(byte[] data) {
		var chips = new List<string>();

		if (data.Length >= 0x10 && (data[0x0c] | (data[0x0d] << 8) | (data[0x0e] << 16) | (data[0x0f] << 24)) > 0) {
			chips.Add("SN76489");
		}

		if (data.Length >= 0x14 && (data[0x10] | (data[0x11] << 8) | (data[0x12] << 16) | (data[0x13] << 24)) > 0) {
			chips.Add("YM2413");
		}

		if (data.Length >= 0x30 && (data[0x2c] | (data[0x2d] << 8) | (data[0x2e] << 16) | (data[0x2f] << 24)) > 0) {
			chips.Add("YM2612");
		}

		if (data.Length >= 0x34 && (data[0x30] | (data[0x31] << 8) | (data[0x32] << 16) | (data[0x33] << 24)) > 0) {
			chips.Add("YM2151");
		}

		return chips;
	}

	#endregion

	#region MIDI Parsing

	private static AudioFileInfo ParseMidiInfo(byte[] data) {
		if (data.Length < 14) {
			return new AudioFileInfo(AudioFormat.Midi, data.Length, null, null, null, 1, null, []);
		}

		// MIDI header chunk
		int format = (data[8] << 8) | data[9];
		int trackCount = (data[10] << 8) | data[11];
		int division = (data[12] << 8) | data[13];

		string formatStr = format switch {
			0 => "Single track",
			1 => "Multiple tracks",
			2 => "Multiple songs",
			_ => $"Unknown ({format})"
		};

		string divisionStr;
		if ((division & 0x8000) != 0) {
			int smpte = (division >> 8) & 0x7f;
			int ticksPerFrame = division & 0xff;
			divisionStr = $"SMPTE {smpte}, {ticksPerFrame} ticks/frame";
		} else {
			divisionStr = $"{division} ticks/quarter note";
		}

		var metadata = new Dictionary<string, string> {
			["Format"] = formatStr,
			["Division"] = divisionStr
		};

		return new AudioFileInfo(
			AudioFormat.Midi,
			data.Length,
			null,
			null,
			null,
			trackCount,
			null,
			metadata
		);
	}

	#endregion

	#region Music Sequence Analysis

	/// <summary>
	/// Analyze music data to identify sequences and patterns.
	/// </summary>
	public static MusicAnalysis AnalyzeMusic(byte[] data, SystemType system) {
		return system switch {
			SystemType.Nes => AnalyzeNesMusic(data),
			SystemType.Snes => AnalyzeSnesMusic(data),
			SystemType.GameBoy or SystemType.GameBoyColor => AnalyzeGameBoyMusic(data),
			_ => new MusicAnalysis([], [], null, [])
		};
	}

	private static MusicAnalysis AnalyzeNesMusic(byte[] data) {
		var sequences = new List<MusicSequence>();
		var instruments = new List<InstrumentData>();
		var notes = new List<string>();

		// Look for common NES music driver patterns
		// Many games use similar sequence formats with pointer tables

		// Look for potential song pointer tables (pairs of addresses)
		for (int i = 0; i < data.Length - 16; i++) {
			if (IsPointerTable(data, i, 8)) {
				sequences.Add(new MusicSequence($"Seq_{i:x4}", i, DetectSequenceLength(data, i)));
			}
		}

		// Detect envelope/instrument data
		for (int i = 0; i < data.Length - 8; i++) {
			if (IsEnvelopeData(data, i)) {
				instruments.Add(new InstrumentData($"Inst_{i:x4}", i, InstrumentType.DutyEnvelope, []));
			}
		}

		return new MusicAnalysis(sequences, instruments, "Generic NES", notes);
	}

	private static MusicAnalysis AnalyzeSnesMusic(byte[] data) {
		var sequences = new List<MusicSequence>();
		var instruments = new List<InstrumentData>();
		var notes = new List<string>();

		// SNES commonly uses SPC700 driver
		// Look for BRR sample data (encoded 9 bytes per block)
		for (int i = 0; i < data.Length - 9; i++) {
			if (IsBrrSample(data, i)) {
				instruments.Add(new InstrumentData($"BRR_{i:x4}", i, InstrumentType.BrrSample, []));
				i += 8; // Skip to next potential sample
			}
		}

		// Look for sequence data (common SNES driver patterns)
		for (int i = 0; i < data.Length - 4; i++) {
			if (IsSequenceMarker(data, i)) {
				sequences.Add(new MusicSequence($"Seq_{i:x4}", i, DetectSequenceLength(data, i)));
			}
		}

		return new MusicAnalysis(sequences, instruments, "SPC700", notes);
	}

	private static MusicAnalysis AnalyzeGameBoyMusic(byte[] data) {
		var sequences = new List<MusicSequence>();
		var instruments = new List<InstrumentData>();
		var notes = new List<string>();

		// Game Boy uses 4 channels: 2 pulse, wave, noise
		// Look for wave pattern data (16 bytes of waveform)
		for (int i = 0; i < data.Length - 16; i++) {
			if (IsWavePattern(data, i)) {
				instruments.Add(new InstrumentData($"Wave_{i:x4}", i, InstrumentType.WaveTable, data.Skip(i).Take(16).ToArray()));
			}
		}

		return new MusicAnalysis(sequences, instruments, "Game Boy", notes);
	}

	private static bool IsPointerTable(byte[] data, int offset, int minEntries) {
		// Check if this looks like a table of pointers
		// NES pointers typically point to addresses in $8000-$FFFF range
		for (int i = 0; i < minEntries; i++) {
			int ptrOffset = offset + (i * 2);
			if (ptrOffset + 1 >= data.Length)
				return false;

			int ptr = data[ptrOffset] | (data[ptrOffset + 1] << 8);
			if (ptr < 0x8000 || ptr > 0xffff)
				return false;
		}

		return true;
	}

	private static bool IsEnvelopeData(byte[] data, int offset) {
		// NES duty/volume envelopes are typically short sequences
		// with values 0-15 for volume, ending with loop or terminator
		if (offset + 8 >= data.Length)
			return false;

		// Check for reasonable envelope values
		int validCount = 0;
		for (int i = 0; i < 8; i++) {
			if (data[offset + i] <= 15) {
				validCount++;
			}
		}

		return validCount >= 6;
	}

	private static bool IsBrrSample(byte[] data, int offset) {
		// BRR samples have header byte followed by 8 bytes of data
		// Header bit 0 = end flag, bit 1 = loop flag
		// Valid headers typically have specific patterns
		if (offset + 9 >= data.Length)
			return false;

		byte header = data[offset];
		// Check for valid filter and shift values
		int shift = header >> 4;
		int filter = (header >> 2) & 0x03;

		// Reasonable shift values are 0-12
		if (shift > 12)
			return false;

		// Check that the sample data isn't all zeros or all 0xFF
		bool hasData = false;
		for (int i = 1; i <= 8; i++) {
			if (data[offset + i] != 0 && data[offset + i] != 0xff) {
				hasData = true;
				break;
			}
		}

		return hasData;
	}

	private static bool IsSequenceMarker(byte[] data, int offset) {
		// Look for common sequence start patterns
		// Many drivers use specific byte patterns to mark sequence headers
		if (offset + 4 >= data.Length)
			return false;

		// Example pattern: tempo byte followed by channel enables
		byte b1 = data[offset];
		byte b2 = data[offset + 1];

		// Common tempo ranges and channel masks
		return b1 >= 0x40 && b1 <= 0xff && (b2 & 0xf0) == 0;
	}

	private static bool IsWavePattern(byte[] data, int offset) {
		// Game Boy wave patterns are 16 bytes with nibble-packed samples
		// Values should have reasonable variation but not be random
		if (offset + 16 >= data.Length)
			return false;

		int variation = 0;
		for (int i = 1; i < 16; i++) {
			if (data[offset + i] != data[offset + i - 1]) {
				variation++;
			}
		}

		// Should have some variation but not be completely random
		return variation >= 4 && variation <= 14;
	}

	private static int DetectSequenceLength(byte[] data, int offset) {
		// Try to detect sequence length by looking for terminator
		int length = 0;
		for (int i = offset; i < data.Length && length < 0x1000; i++, length++) {
			if (data[i] == 0xff || data[i] == 0x00) {
				// Potential terminator
				if (i + 1 < data.Length && data[i + 1] == 0x00) {
					return length;
				}
			}
		}

		return Math.Min(length, 256);
	}

	#endregion

	#region Instrument Extraction

	/// <summary>
	/// Extract instruments/samples from audio data.
	/// </summary>
	public static List<InstrumentData> ExtractInstruments(byte[] data, SystemType system) {
		var instruments = new List<InstrumentData>();

		if (system == SystemType.Snes) {
			instruments.AddRange(ExtractBrrSamples(data));
		} else if (system is SystemType.GameBoy or SystemType.GameBoyColor) {
			instruments.AddRange(ExtractWaveTables(data));
		} else if (system == SystemType.Nes) {
			instruments.AddRange(ExtractDpcmSamples(data));
		}

		return instruments;
	}

	/// <summary>
	/// Extract BRR samples from SNES data.
	/// </summary>
	public static List<InstrumentData> ExtractBrrSamples(byte[] data) {
		var samples = new List<InstrumentData>();

		int sampleIndex = 0;
		for (int i = 0; i < data.Length - 9; i++) {
			if (IsBrrSample(data, i)) {
				// Find sample end (loop flag or end flag set)
				int sampleStart = i;
				int sampleLength = 9;

				while (i + sampleLength + 9 <= data.Length) {
					byte header = data[i + sampleLength];
					sampleLength += 9;

					if ((header & 0x01) != 0) {
						// End flag set
						break;
					}
				}

				var sampleData = new byte[sampleLength];
				Array.Copy(data, sampleStart, sampleData, 0, sampleLength);

				samples.Add(new InstrumentData(
					$"BRR_{sampleIndex++:d3}",
					sampleStart,
					InstrumentType.BrrSample,
					sampleData
				));

				i = sampleStart + sampleLength - 1;
			}
		}

		return samples;
	}

	/// <summary>
	/// Extract Game Boy wave tables from data.
	/// </summary>
	public static List<InstrumentData> ExtractWaveTables(byte[] data) {
		var waveTables = new List<InstrumentData>();

		int index = 0;
		for (int i = 0; i < data.Length - 16; i++) {
			if (IsWavePattern(data, i)) {
				var waveData = new byte[16];
				Array.Copy(data, i, waveData, 0, 16);

				waveTables.Add(new InstrumentData(
					$"Wave_{index++:d3}",
					i,
					InstrumentType.WaveTable,
					waveData
				));

				i += 15; // Move past this wave table
			}
		}

		return waveTables;
	}

	/// <summary>
	/// Extract NES DPCM samples from data.
	/// </summary>
	public static List<InstrumentData> ExtractDpcmSamples(byte[] data) {
		var samples = new List<InstrumentData>();

		// DPCM samples are at $C000+ and 16-byte aligned
		// Length is (L * 16) + 1 bytes
		// This is a heuristic detection

		int index = 0;
		for (int i = 0; i < data.Length - 17; i += 16) {
			// Check if this could be DPCM data
			int deltaCount = 0;
			for (int j = 0; j < 16 && i + j < data.Length; j++) {
				// DPCM samples have specific patterns
				if (data[i + j] != 0 && data[i + j] != 0xff) {
					deltaCount++;
				}
			}

			if (deltaCount >= 8) {
				// Potential DPCM sample
				int sampleLength = DetectDpcmLength(data, i);
				if (sampleLength > 16) {
					var sampleData = new byte[sampleLength];
					Array.Copy(data, i, sampleData, 0, Math.Min(sampleLength, data.Length - i));

					samples.Add(new InstrumentData(
						$"DPCM_{index++:d3}",
						i,
						InstrumentType.Dpcm,
						sampleData
					));

					i += sampleLength - 16;
				}
			}
		}

		return samples;
	}

	private static int DetectDpcmLength(byte[] data, int offset) {
		// Try to detect DPCM sample length
		// Samples often end with silence or a specific pattern
		int length = 16;
		while (offset + length < data.Length && length < 0x1000) {
			// Check for silence (many zeros or 0xAA pattern)
			int silenceCount = 0;
			for (int i = 0; i < 16 && offset + length + i < data.Length; i++) {
				if (data[offset + length + i] == 0 || data[offset + length + i] == 0xaa) {
					silenceCount++;
				}
			}

			if (silenceCount >= 12) {
				break;
			}

			length += 16;
		}

		return length;
	}

	#endregion

	#region MIDI Conversion

	/// <summary>
	/// Convert music sequence to MIDI format.
	/// </summary>
	public static byte[]? ConvertToMidi(byte[] sequenceData, MusicDriverType driver) {
		// This is a simplified conversion - real drivers need specific implementations
		var events = ParseSequenceEvents(sequenceData, driver);
		if (events.Count == 0)
			return null;

		return BuildMidiFile(events);
	}

	private static List<MidiEvent> ParseSequenceEvents(byte[] data, MusicDriverType driver) {
		var events = new List<MidiEvent>();
		// Basic parsing - would need driver-specific implementations
		// This is a placeholder for the framework
		return events;
	}

	private static byte[] BuildMidiFile(List<MidiEvent> events) {
		var output = new List<byte>();

		// MIDI header
		output.AddRange(Encoding.ASCII.GetBytes("MThd"));
		output.AddRange(new byte[] { 0, 0, 0, 6 }); // Header size
		output.AddRange(new byte[] { 0, 0 }); // Format 0
		output.AddRange(new byte[] { 0, 1 }); // 1 track
		output.AddRange(new byte[] { 0, 120 }); // 120 ticks per quarter

		// Track header
		var trackData = BuildMidiTrack(events);
		output.AddRange(Encoding.ASCII.GetBytes("MTrk"));
		int trackSize = trackData.Count;
		output.Add((byte)((trackSize >> 24) & 0xff));
		output.Add((byte)((trackSize >> 16) & 0xff));
		output.Add((byte)((trackSize >> 8) & 0xff));
		output.Add((byte)(trackSize & 0xff));
		output.AddRange(trackData);

		return [.. output];
	}

	private static List<byte> BuildMidiTrack(List<MidiEvent> events) {
		var track = new List<byte>();

		foreach (var evt in events) {
			// Write delta time (simplified - assumes small values)
			track.Add((byte)(evt.DeltaTime & 0x7f));

			// Write event
			track.AddRange(evt.Data);
		}

		// End of track
		track.AddRange([0x00, 0xff, 0x2f, 0x00]);

		return track;
	}

	/// <summary>
	/// Import MIDI file and convert to game format.
	/// </summary>
	public static byte[]? ImportMidi(byte[] midiData, MusicDriverType driver) {
		// Parse MIDI file
		if (midiData.Length < 14 || Encoding.ASCII.GetString(midiData, 0, 4) != "MThd")
			return null;

		// This would need driver-specific implementations
		// Placeholder for the framework
		return null;
	}

	#endregion
}

#region Enums and Records

/// <summary>
/// Audio file format types.
/// </summary>
public enum AudioFormat {
	Unknown,
	Nsf,
	Nsfe,
	Spc,
	Gbs,
	Vgm,
	Hes,
	Gsf,
	Midi,
	Raw
}

/// <summary>
/// Instrument/sample types.
/// </summary>
public enum InstrumentType {
	Unknown,
	BrrSample,
	Dpcm,
	WaveTable,
	DutyEnvelope,
	VolumeEnvelope,
	PitchEnvelope,
	FmPatch
}

/// <summary>
/// Music driver types.
/// </summary>
public enum MusicDriverType {
	Generic,
	Konami,
	Capcom,
	SquareSoft,
	Nintendo,
	Rare
}

/// <summary>
/// Audio file information.
/// </summary>
public record AudioFileInfo(
	AudioFormat Format,
	int Size,
	string? Title,
	string? Artist,
	string? Copyright,
	int TrackCount,
	SystemType? System,
	Dictionary<string, string> Metadata
);

/// <summary>
/// Music sequence data.
/// </summary>
public record MusicSequence(
	string Name,
	int Offset,
	int Length
);

/// <summary>
/// Instrument/sample data.
/// </summary>
public record InstrumentData(
	string Name,
	int Offset,
	InstrumentType Type,
	byte[] Data
);

/// <summary>
/// Music analysis result.
/// </summary>
public record MusicAnalysis(
	List<MusicSequence> Sequences,
	List<InstrumentData> Instruments,
	string? DriverType,
	List<string> Notes
);

/// <summary>
/// MIDI event.
/// </summary>
public record MidiEvent(
	int DeltaTime,
	byte[] Data
);

#endregion
