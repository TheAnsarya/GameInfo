using Xunit;

namespace GameInfoTools.Audio.Tests.Spc;

using GameInfoTools.Audio.Spc;

public class MidiImportTests {
	#region MidiReader Tests

	[Fact]
	public void MidiReader_Parse_NullData_ThrowsException() {
		var reader = new MidiReader();
		Assert.Throws<NullReferenceException>(() => reader.Parse(null!));
	}

	[Fact]
	public void MidiReader_Parse_TooSmallData_ThrowsException() {
		var reader = new MidiReader();
		var data = new byte[] { 0x4d, 0x54, 0x68, 0x64 }; // Just "MThd"
		Assert.Throws<InvalidDataException>(() => reader.Parse(data));
	}

	[Fact]
	public void MidiReader_Parse_InvalidHeader_ThrowsException() {
		var reader = new MidiReader();
		var data = new byte[14];
		// Not a valid MIDI header
		Assert.Throws<InvalidDataException>(() => reader.Parse(data));
	}

	[Fact]
	public void MidiReader_Parse_ValidMinimalMidi_ReturnsSequence() {
		var reader = new MidiReader();
		var data = CreateMinimalMidiFile();

		var sequence = reader.Parse(data);

		Assert.NotNull(sequence);
		Assert.True(sequence.TicksPerBeat > 0);
	}

	[Fact]
	public void MidiReader_Parse_ExtractsTicksPerBeat() {
		var reader = new MidiReader();
		var data = CreateMidiWithDivision(480);

		var sequence = reader.Parse(data);

		Assert.Equal(480, sequence.TicksPerBeat);
	}

	[Fact]
	public void MidiReader_Parse_ParsesMultipleTracks() {
		var reader = new MidiReader();
		var data = CreateMultiTrackMidi(4);

		var sequence = reader.Parse(data);

		Assert.Equal(4, sequence.Tracks.Count);
	}

	[Fact]
	public void MidiReader_Parse_NoteOnEvent_Parsed() {
		var reader = new MidiReader();
		var data = CreateMidiWithNotes();

		var sequence = reader.Parse(data);

		Assert.NotEmpty(sequence.Tracks);
		var noteEvents = sequence.Tracks[0].Events.Where(e => e.Type == MidiEventType.NoteOn).ToList();
		Assert.NotEmpty(noteEvents);
	}

	[Fact]
	public void MidiReader_Parse_NoteOffEvent_Parsed() {
		var reader = new MidiReader();
		var data = CreateMidiWithNotes();

		var sequence = reader.Parse(data);

		Assert.NotEmpty(sequence.Tracks);
		var noteOffEvents = sequence.Tracks[0].Events.Where(e => e.Type == MidiEventType.NoteOff).ToList();
		Assert.NotEmpty(noteOffEvents);
	}

	[Fact]
	public void MidiReader_Parse_TempoEvent_Parsed() {
		var reader = new MidiReader();
		var data = CreateMidiWithTempo(120); // 120 BPM

		var sequence = reader.Parse(data);

		Assert.NotEmpty(sequence.Tracks);
		var tempoEvents = sequence.Tracks[0].Events.Where(e => e.Type == MidiEventType.Tempo).ToList();
		Assert.NotEmpty(tempoEvents);
		Assert.Equal(500000, tempoEvents[0].Tempo); // 120 BPM = 500,000 microseconds per beat
	}

	[Fact]
	public void MidiReader_Parse_ProgramChange_Parsed() {
		var reader = new MidiReader();
		var data = CreateMidiWithProgramChange(42);

		var sequence = reader.Parse(data);

		Assert.NotEmpty(sequence.Tracks);
		var programEvents = sequence.Tracks[0].Events.Where(e => e.Type == MidiEventType.ProgramChange).ToList();
		Assert.NotEmpty(programEvents);
		Assert.Equal(42, programEvents[0].Program);
	}

	#endregion

	#region MidiToNSpcCompiler Tests

	[Fact]
	public void MidiToNSpcCompiler_Compile_NullSequence_ThrowsException() {
		var compiler = new MidiToNSpcCompiler();
		Assert.Throws<NullReferenceException>(() => compiler.Compile(null!));
	}

	[Fact]
	public void MidiToNSpcCompiler_Compile_EmptySequence_ReturnsEmptyTracks() {
		var compiler = new MidiToNSpcCompiler();
		var midi = new MidiSequence {
			TicksPerBeat = 48,
			Tracks = []
		};

		var result = compiler.Compile(midi);

		Assert.NotNull(result);
		Assert.Empty(result.Tracks);
	}

	[Fact]
	public void MidiToNSpcCompiler_Compile_SingleNoteTrack_ProducesEvents() {
		var compiler = new MidiToNSpcCompiler();
		var midi = CreateMidiSequenceWithNotes(1, 1);

		var result = compiler.Compile(midi);

		Assert.NotNull(result);
		Assert.NotEmpty(result.Tracks);
		Assert.NotEmpty(result.Tracks[0].Events);
	}

	[Fact]
	public void MidiToNSpcCompiler_Compile_MultipleChannels_LimitedTo8() {
		var compiler = new MidiToNSpcCompiler();
		var midi = CreateMidiSequenceWithNotes(16, 1);

		var result = compiler.Compile(midi);

		// SNES can only have 8 channels
		Assert.True(result.Tracks.Count <= 8);
	}

	[Fact]
	public void MidiToNSpcCompiler_Compile_EndTrackMarker_Present() {
		var compiler = new MidiToNSpcCompiler();
		var midi = CreateMidiSequenceWithNotes(1, 1);

		var result = compiler.Compile(midi);

		Assert.NotEmpty(result.Tracks);
		var lastEvent = result.Tracks[0].Events.Last();
		Assert.Equal(NSpcParser.CommandType.EndTrack, lastEvent.Type);
	}

	[Fact]
	public void MidiToNSpcCompiler_CompileToBytes_ReturnsValidData() {
		var compiler = new MidiToNSpcCompiler();
		var midi = CreateMidiSequenceWithNotes(1, 4);

		var data = compiler.CompileToBytes(midi);

		Assert.NotNull(data);
		Assert.True(data.Length >= 16); // At least track pointer table
	}

	[Fact]
	public void MidiToNSpcCompiler_CompileToBytes_TrackPointerTable_Valid() {
		var compiler = new MidiToNSpcCompiler();
		var midi = CreateMidiSequenceWithNotes(2, 2);

		var data = compiler.CompileToBytes(midi);

		// First track pointer should point after the header (16 bytes)
		int ptr1 = data[0] | (data[1] << 8);
		Assert.Equal(0x1010, ptr1); // Base address 0x1000 + 16 = 0x1010
	}

	[Fact]
	public void MidiToNSpcCompiler_Options_BaseAddressRespected() {
		var options = new CompilerOptions { SequenceBaseAddress = 0x2000 };
		var compiler = new MidiToNSpcCompiler(options);
		var midi = CreateMidiSequenceWithNotes(1, 2);

		var data = compiler.CompileToBytes(midi);

		int ptr1 = data[0] | (data[1] << 8);
		Assert.Equal(0x2010, ptr1); // Base address 0x2000 + 16 = 0x2010
	}

	[Fact]
	public void MidiToNSpcCompiler_Compile_InstrumentChange_ProducesSetInstrumentEvent() {
		var compiler = new MidiToNSpcCompiler();
		var midi = new MidiSequence {
			TicksPerBeat = 48,
			Tracks = [
				new MidiTrack {
					ChannelNumber = 0,
					Events = [
						new MidiEvent { Tick = 0, Type = MidiEventType.ProgramChange, Channel = 0, Program = 5 },
						new MidiEvent { Tick = 48, Type = MidiEventType.NoteOn, Channel = 0, Note = 60, Velocity = 100 },
						new MidiEvent { Tick = 96, Type = MidiEventType.NoteOff, Channel = 0, Note = 60 },
						new MidiEvent { Tick = 96, Type = MidiEventType.EndOfTrack }
					]
				}
			]
		};

		var result = compiler.Compile(midi);

		var instrumentEvents = result.Tracks[0].Events.Where(e => e.Type == NSpcParser.CommandType.SetInstrument);
		Assert.NotEmpty(instrumentEvents);
		Assert.Equal(5, instrumentEvents.First().Parameter1);
	}

	#endregion

	#region Helper Methods

	private static byte[] CreateMinimalMidiFile() {
		var data = new List<byte>();

		// Header chunk
		data.AddRange("MThd"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 6 }); // Chunk length
		data.AddRange(new byte[] { 0, 0 }); // Format 0
		data.AddRange(new byte[] { 0, 1 }); // 1 track
		data.AddRange(new byte[] { 0, 96 }); // 96 ticks per beat

		// Track chunk (minimal)
		data.AddRange("MTrk"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 4 }); // Chunk length
		data.AddRange(new byte[] { 0, 0xff, 0x2f, 0x00 }); // End of track

		return [.. data];
	}

	private static byte[] CreateMidiWithDivision(int division) {
		var data = new List<byte>();

		// Header chunk
		data.AddRange("MThd"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 6 });
		data.AddRange(new byte[] { 0, 0 });
		data.AddRange(new byte[] { 0, 1 });
		data.Add((byte)(division >> 8));
		data.Add((byte)division);

		// Track chunk
		data.AddRange("MTrk"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 4 });
		data.AddRange(new byte[] { 0, 0xff, 0x2f, 0x00 });

		return [.. data];
	}

	private static byte[] CreateMultiTrackMidi(int trackCount) {
		var data = new List<byte>();

		// Header chunk
		data.AddRange("MThd"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 6 });
		data.AddRange(new byte[] { 0, 1 }); // Format 1
		data.Add((byte)(trackCount >> 8));
		data.Add((byte)trackCount);
		data.AddRange(new byte[] { 0, 96 });

		// Add empty tracks
		for (int i = 0; i < trackCount; i++) {
			data.AddRange("MTrk"u8.ToArray());
			data.AddRange(new byte[] { 0, 0, 0, 4 });
			data.AddRange(new byte[] { 0, 0xff, 0x2f, 0x00 });
		}

		return [.. data];
	}

	private static byte[] CreateMidiWithNotes() {
		var data = new List<byte>();

		// Header chunk
		data.AddRange("MThd"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 6 });
		data.AddRange(new byte[] { 0, 0 });
		data.AddRange(new byte[] { 0, 1 });
		data.AddRange(new byte[] { 0, 96 });

		// Track chunk with notes
		var trackData = new List<byte>();
		trackData.AddRange(new byte[] { 0, 0x90, 60, 100 }); // Delta=0, Note On, C4, vel 100
		trackData.AddRange(new byte[] { 96, 0x80, 60, 0 }); // Delta=96, Note Off, C4
		trackData.AddRange(new byte[] { 0, 0xff, 0x2f, 0x00 }); // End of track

		data.AddRange("MTrk"u8.ToArray());
		data.Add(0);
		data.Add(0);
		data.Add((byte)(trackData.Count >> 8));
		data.Add((byte)trackData.Count);
		data.AddRange(trackData);

		return [.. data];
	}

	private static byte[] CreateMidiWithTempo(int bpm) {
		int microsecondsPerBeat = 60000000 / bpm;

		var data = new List<byte>();

		// Header chunk
		data.AddRange("MThd"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 6 });
		data.AddRange(new byte[] { 0, 0 });
		data.AddRange(new byte[] { 0, 1 });
		data.AddRange(new byte[] { 0, 96 });

		// Track chunk with tempo
		var trackData = new List<byte>();
		trackData.AddRange(new byte[] { 0, 0xff, 0x51, 0x03 }); // Tempo meta event
		trackData.Add((byte)((microsecondsPerBeat >> 16) & 0xff));
		trackData.Add((byte)((microsecondsPerBeat >> 8) & 0xff));
		trackData.Add((byte)(microsecondsPerBeat & 0xff));
		trackData.AddRange(new byte[] { 0, 0xff, 0x2f, 0x00 }); // End of track

		data.AddRange("MTrk"u8.ToArray());
		data.Add(0);
		data.Add(0);
		data.Add((byte)(trackData.Count >> 8));
		data.Add((byte)trackData.Count);
		data.AddRange(trackData);

		return [.. data];
	}

	private static byte[] CreateMidiWithProgramChange(int program) {
		var data = new List<byte>();

		// Header chunk
		data.AddRange("MThd"u8.ToArray());
		data.AddRange(new byte[] { 0, 0, 0, 6 });
		data.AddRange(new byte[] { 0, 0 });
		data.AddRange(new byte[] { 0, 1 });
		data.AddRange(new byte[] { 0, 96 });

		// Track chunk with program change
		var trackData = new List<byte>();
		trackData.AddRange(new byte[] { 0, 0xc0, (byte)program }); // Program change
		trackData.AddRange(new byte[] { 0, 0xff, 0x2f, 0x00 }); // End of track

		data.AddRange("MTrk"u8.ToArray());
		data.Add(0);
		data.Add(0);
		data.Add((byte)(trackData.Count >> 8));
		data.Add((byte)trackData.Count);
		data.AddRange(trackData);

		return [.. data];
	}

	private static MidiSequence CreateMidiSequenceWithNotes(int channels, int notesPerChannel) {
		var tracks = new List<MidiTrack>();

		for (int ch = 0; ch < channels; ch++) {
			var events = new List<MidiEvent>();
			int tick = 0;

			for (int n = 0; n < notesPerChannel; n++) {
				events.Add(new MidiEvent {
					Tick = tick,
					Type = MidiEventType.NoteOn,
					Channel = ch,
					Note = 60 + (n % 12),
					Velocity = 100
				});

				tick += 48;

				events.Add(new MidiEvent {
					Tick = tick,
					Type = MidiEventType.NoteOff,
					Channel = ch,
					Note = 60 + (n % 12),
					Velocity = 0
				});
			}

			events.Add(new MidiEvent {
				Tick = tick,
				Type = MidiEventType.EndOfTrack,
				Channel = ch
			});

			tracks.Add(new MidiTrack {
				ChannelNumber = ch,
				Events = events
			});
		}

		return new MidiSequence {
			TicksPerBeat = 48,
			Tracks = tracks
		};
	}

	#endregion
}
