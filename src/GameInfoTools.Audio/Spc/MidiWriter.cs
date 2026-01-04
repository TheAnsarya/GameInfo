using System.Text;

namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Writes Standard MIDI Files (SMF) from parsed sequence data.
/// Supports Type 0 (single track) and Type 1 (multi-track) formats.
/// </summary>
public class MidiWriter {
	/// <summary>
	/// Export a MIDI sequence to a Standard MIDI File.
	/// </summary>
	public byte[] Export(MidiSequence sequence) {
		using var stream = new MemoryStream();
		using var writer = new BinaryWriter(stream);

		// MIDI Header
		WriteChunk(writer, "MThd", WriteHeader(sequence));

		// Track chunks
		foreach (var track in sequence.Tracks) {
			WriteChunk(writer, "MTrk", WriteTrack(track));
		}

		return stream.ToArray();
	}

	/// <summary>
	/// Export a MIDI sequence directly to a file.
	/// </summary>
	public void ExportToFile(MidiSequence sequence, string path) {
		var data = Export(sequence);
		File.WriteAllBytes(path, data);
	}

	private static byte[] WriteHeader(MidiSequence sequence) {
		using var stream = new MemoryStream();
		using var writer = new BinaryWriter(stream);

		// Format: 0 = single track, 1 = multiple tracks
		int format = sequence.Tracks.Count > 1 ? 1 : 0;
		writer.Write(ToBigEndian16((ushort)format));

		// Number of tracks
		writer.Write(ToBigEndian16((ushort)sequence.Tracks.Count));

		// Division (ticks per quarter note)
		writer.Write(ToBigEndian16((ushort)sequence.TicksPerBeat));

		return stream.ToArray();
	}

	private static byte[] WriteTrack(MidiTrack track) {
		using var stream = new MemoryStream();

		var sortedEvents = track.Events.OrderBy(e => e.Tick).ToList();
		int lastTick = 0;

		foreach (var evt in sortedEvents) {
			int delta = evt.Tick - lastTick;
			lastTick = evt.Tick;

			WriteVariableLength(stream, delta);
			WriteEvent(stream, evt);
		}

		// End of track
		WriteVariableLength(stream, 0);
		stream.WriteByte(0xff); // Meta event
		stream.WriteByte(0x2f); // End of track
		stream.WriteByte(0x00); // Length

		return stream.ToArray();
	}

	private static void WriteEvent(Stream stream, MidiEvent evt) {
		switch (evt.Type) {
			case MidiEventType.NoteOn:
				stream.WriteByte((byte)(0x90 | (evt.Channel & 0x0f)));
				stream.WriteByte((byte)(evt.Note & 0x7f));
				stream.WriteByte((byte)(evt.Velocity & 0x7f));
				break;

			case MidiEventType.NoteOff:
				stream.WriteByte((byte)(0x80 | (evt.Channel & 0x0f)));
				stream.WriteByte((byte)(evt.Note & 0x7f));
				stream.WriteByte((byte)(evt.Velocity & 0x7f));
				break;

			case MidiEventType.ProgramChange:
				stream.WriteByte((byte)(0xc0 | (evt.Channel & 0x0f)));
				stream.WriteByte((byte)(evt.Program & 0x7f));
				break;

			case MidiEventType.ControlChange:
				stream.WriteByte((byte)(0xb0 | (evt.Channel & 0x0f)));
				stream.WriteByte((byte)(evt.Controller & 0x7f));
				stream.WriteByte((byte)(evt.Value & 0x7f));
				break;

			case MidiEventType.PitchBend:
				int bend = evt.Value + 0x2000; // Center at 8192
				stream.WriteByte((byte)(0xe0 | (evt.Channel & 0x0f)));
				stream.WriteByte((byte)(bend & 0x7f));
				stream.WriteByte((byte)((bend >> 7) & 0x7f));
				break;

			case MidiEventType.Tempo:
				stream.WriteByte(0xff); // Meta event
				stream.WriteByte(0x51); // Tempo
				stream.WriteByte(0x03); // Length
				int tempo = evt.Tempo;
				stream.WriteByte((byte)((tempo >> 16) & 0xff));
				stream.WriteByte((byte)((tempo >> 8) & 0xff));
				stream.WriteByte((byte)(tempo & 0xff));
				break;

			case MidiEventType.EndOfTrack:
				stream.WriteByte(0xff);
				stream.WriteByte(0x2f);
				stream.WriteByte(0x00);
				break;
		}
	}

	private static void WriteChunk(BinaryWriter writer, string id, byte[] data) {
		writer.Write(Encoding.ASCII.GetBytes(id));
		writer.Write(ToBigEndian32((uint)data.Length));
		writer.Write(data);
	}

	private static void WriteVariableLength(Stream stream, int value) {
		if (value < 0) value = 0;

		var bytes = new List<byte>();
		bytes.Add((byte)(value & 0x7f));
		value >>= 7;

		while (value > 0) {
			bytes.Add((byte)((value & 0x7f) | 0x80));
			value >>= 7;
		}

		// Write in reverse order
		for (int i = bytes.Count - 1; i >= 0; i--) {
			stream.WriteByte(bytes[i]);
		}
	}

	private static byte[] ToBigEndian16(ushort value) {
		return [(byte)(value >> 8), (byte)(value & 0xff)];
	}

	private static byte[] ToBigEndian32(uint value) {
		return [
			(byte)(value >> 24),
			(byte)((value >> 16) & 0xff),
			(byte)((value >> 8) & 0xff),
			(byte)(value & 0xff)
		];
	}
}

/// <summary>
/// High-level converter from SPC files to MIDI.
/// </summary>
public class SpcToMidiConverter {
	/// <summary>
	/// Convert an SPC file to MIDI.
	/// Returns null if no sequence data could be parsed.
	/// </summary>
	public MidiSequence? Convert(SpcFile spc) {
		// Detect driver type
		var driverInfo = SequenceDetector.DetectDriver(spc);

		string driverName = driverInfo?.DetectedDriver?.Name ?? "Unknown";

		if (driverName == "N-SPC" || driverName == "Unknown") {
			// Try N-SPC parser
			var parser = new NSpcParser(spc);
			int headerAddr = parser.FindSequenceHeader();

			if (headerAddr >= 0) {
				var sequence = parser.ParseSequence(headerAddr);
				if (sequence != null) {
					return parser.ToMidi(sequence);
				}
			}
		}

		// Could add other parsers here (Akao, Konami, etc.)

		return null;
	}

	/// <summary>
	/// Convert an SPC file directly to a MIDI file.
	/// </summary>
	public bool ConvertToFile(string spcPath, string midiPath) {
		var spc = SpcFile.Load(spcPath);
		var midi = Convert(spc);

		if (midi == null || midi.Tracks.Count == 0) {
			return false;
		}

		var writer = new MidiWriter();
		writer.ExportToFile(midi, midiPath);
		return true;
	}

	/// <summary>
	/// Convert an SPC file to MIDI bytes.
	/// </summary>
	public byte[]? ConvertToBytes(SpcFile spc) {
		var midi = Convert(spc);
		if (midi == null || midi.Tracks.Count == 0) {
			return null;
		}

		var writer = new MidiWriter();
		return writer.Export(midi);
	}
}
