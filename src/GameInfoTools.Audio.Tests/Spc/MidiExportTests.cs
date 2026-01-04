using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests.Spc;

/// <summary>
/// Tests for N-SPC sequence parser and MIDI export.
/// </summary>
public class NSpcParserTests {
	[Fact]
	public void Constructor_WithNullSpc_ThrowsArgumentNullException() {
		Assert.Throws<ArgumentNullException>(() => new NSpcParser(null!));
	}

	[Fact]
	public void ParseSequence_WithInvalidAddress_ReturnsNull() {
		// Create minimal SPC with empty RAM
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);

		var result = parser.ParseSequence(-1);

		Assert.Null(result);
	}

	[Fact]
	public void ParseSequence_WithAddressBeyondRam_ReturnsNull() {
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);

		var result = parser.ParseSequence(0x10000);

		Assert.Null(result);
	}

	[Fact]
	public void ParseTrack_WithInvalidAddress_ReturnsNull() {
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);

		var result = parser.ParseTrack(-1, 0);

		Assert.Null(result);
	}

	[Fact]
	public void ParseTrack_WithEndMarker_StopsAtEndMarker() {
		var spc = CreateTestSpc();
		// Put some note data followed by end marker
		spc.Ram[0x1000] = 0x30; // Note
		spc.Ram[0x1001] = 0x40; // Note
		spc.Ram[0x1002] = 0xff; // End marker

		var parser = new NSpcParser(spc);
		var track = parser.ParseTrack(0x1000, 0);

		Assert.NotNull(track);
		Assert.True(track.Events.Count >= 2);
	}

	[Fact]
	public void FindSequenceHeader_WithNoValidPointers_ReturnsNegative() {
		var spc = CreateTestSpc();
		// Leave RAM as zeros - no valid pointer table

		var parser = new NSpcParser(spc);
		var result = parser.FindSequenceHeader();

		Assert.True(result < 0);
	}

	[Fact]
	public void ToMidi_WithEmptySequence_ReturnsEmptyMidi() {
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);
		var sequence = new NSpcSequence { StartAddress = 0, Tracks = [] };

		var midi = parser.ToMidi(sequence);

		Assert.NotNull(midi);
		Assert.Empty(midi.Tracks);
	}

	[Fact]
	public void ToMidi_WithNotes_CreatesMidiEvents() {
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);

		// Create a sequence with some notes
		var sequence = new NSpcSequence {
			StartAddress = 0x1000,
			Tracks = [
				new NSpcTrack {
					ChannelNumber = 0,
					StartAddress = 0x1000,
					Events = [
						new NSpcEvent {
							Type = NSpcParser.CommandType.Note,
							Note = 60,
							Duration = 12
						},
						new NSpcEvent {
							Type = NSpcParser.CommandType.Note,
							Note = 64,
							Duration = 12
						}
					]
				}
			]
		};

		var midi = parser.ToMidi(sequence);

		Assert.NotNull(midi);
		Assert.Single(midi.Tracks);
		Assert.True(midi.Tracks[0].Events.Count >= 4); // 2 notes = 4 events (on/off each)
	}

	[Fact]
	public void ToMidi_WithInstrumentChange_CreatesProgramChange() {
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);

		var sequence = new NSpcSequence {
			StartAddress = 0x1000,
			Tracks = [
				new NSpcTrack {
					ChannelNumber = 0,
					StartAddress = 0x1000,
					Events = [
						new NSpcEvent {
							Type = NSpcParser.CommandType.SetInstrument,
							Parameter1 = 5
						}
					]
				}
			]
		};

		var midi = parser.ToMidi(sequence);

		Assert.NotNull(midi);
		var programChange = midi.Tracks[0].Events.FirstOrDefault(e => e.Type == MidiEventType.ProgramChange);
		Assert.NotNull(programChange);
		Assert.Equal(5, programChange.Program);
	}

	[Fact]
	public void ToMidi_WithVolumeChange_CreatesControlChange() {
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);

		var sequence = new NSpcSequence {
			StartAddress = 0x1000,
			Tracks = [
				new NSpcTrack {
					ChannelNumber = 0,
					StartAddress = 0x1000,
					Events = [
						new NSpcEvent {
							Type = NSpcParser.CommandType.SetVolume,
							Parameter1 = 100
						}
					]
				}
			]
		};

		var midi = parser.ToMidi(sequence);

		Assert.NotNull(midi);
		var cc = midi.Tracks[0].Events.FirstOrDefault(e => e.Type == MidiEventType.ControlChange);
		Assert.NotNull(cc);
		Assert.Equal(7, cc.Controller); // Volume CC
	}

	[Fact]
	public void ToMidi_WithTempoChange_CreatesTempoEvent() {
		var spc = CreateTestSpc();
		var parser = new NSpcParser(spc);

		var sequence = new NSpcSequence {
			StartAddress = 0x1000,
			Tracks = [
				new NSpcTrack {
					ChannelNumber = 0,
					StartAddress = 0x1000,
					Events = [
						new NSpcEvent {
							Type = NSpcParser.CommandType.SetTempo,
							Parameter1 = 60 // Will be converted to 120 BPM
						}
					]
				}
			]
		};

		var midi = parser.ToMidi(sequence);

		Assert.NotNull(midi);
		var tempo = midi.Tracks[0].Events.FirstOrDefault(e => e.Type == MidiEventType.Tempo);
		Assert.NotNull(tempo);
		Assert.True(tempo.Tempo > 0);
	}

	private static SpcFile CreateTestSpc() {
		var spc = new SpcFile();

		// Set up valid header
		spc.Header.HasId666 = true;

		// Set directory address
		spc.Dsp.Data[0x5d] = 0x02; // Directory at $0200

		return spc;
	}
}

/// <summary>
/// Tests for MIDI writer.
/// </summary>
public class MidiWriterTests {
	[Fact]
	public void Export_WithEmptySequence_CreatesValidHeader() {
		var sequence = new MidiSequence {
			TicksPerBeat = 96,
			Tracks = []
		};

		var writer = new MidiWriter();
		var data = writer.Export(sequence);

		// Check MIDI header
		Assert.True(data.Length >= 14);
		Assert.Equal((byte)'M', data[0]);
		Assert.Equal((byte)'T', data[1]);
		Assert.Equal((byte)'h', data[2]);
		Assert.Equal((byte)'d', data[3]);
	}

	[Fact]
	public void Export_WithSingleTrack_CreatesType0Midi() {
		var sequence = new MidiSequence {
			TicksPerBeat = 96,
			Tracks = [
				new MidiTrack {
					ChannelNumber = 0,
					Events = [
						new MidiEvent {
							Tick = 0,
							Type = MidiEventType.NoteOn,
							Note = 60,
							Velocity = 100,
							Channel = 0
						}
					]
				}
			]
		};

		var writer = new MidiWriter();
		var data = writer.Export(sequence);

		// Header should indicate format 0 (single track)
		Assert.Equal(0, data[9]); // Format type low byte
	}

	[Fact]
	public void Export_WithMultipleTracks_CreatesType1Midi() {
		var sequence = new MidiSequence {
			TicksPerBeat = 96,
			Tracks = [
				new MidiTrack { ChannelNumber = 0, Events = [] },
				new MidiTrack { ChannelNumber = 1, Events = [] }
			]
		};

		var writer = new MidiWriter();
		var data = writer.Export(sequence);

		// Header should indicate format 1 (multiple tracks)
		Assert.Equal(1, data[9]);
	}

	[Fact]
	public void Export_PreservesTicksPerBeat() {
		var sequence = new MidiSequence {
			TicksPerBeat = 480,
			Tracks = []
		};

		var writer = new MidiWriter();
		var data = writer.Export(sequence);

		// Ticks per beat at bytes 12-13 (big endian)
		int ticks = (data[12] << 8) | data[13];
		Assert.Equal(480, ticks);
	}

	[Fact]
	public void Export_WithNoteEvents_WritesNoteData() {
		var sequence = new MidiSequence {
			TicksPerBeat = 96,
			Tracks = [
				new MidiTrack {
					ChannelNumber = 0,
					Events = [
						new MidiEvent {
							Tick = 0,
							Type = MidiEventType.NoteOn,
							Note = 60,
							Velocity = 100,
							Channel = 0
						},
						new MidiEvent {
							Tick = 96,
							Type = MidiEventType.NoteOff,
							Note = 60,
							Velocity = 0,
							Channel = 0
						}
					]
				}
			]
		};

		var writer = new MidiWriter();
		var data = writer.Export(sequence);

		// File should contain both note on and note off
		Assert.True(data.Length > 30);
	}

	[Fact]
	public void Export_IncludesEndOfTrackMarker() {
		var sequence = new MidiSequence {
			TicksPerBeat = 96,
			Tracks = [
				new MidiTrack {
					ChannelNumber = 0,
					Events = []
				}
			]
		};

		var writer = new MidiWriter();
		var data = writer.Export(sequence);

		// End of track marker: FF 2F 00
		bool hasEndMarker = false;
		for (int i = 0; i < data.Length - 2; i++) {
			if (data[i] == 0xff && data[i + 1] == 0x2f && data[i + 2] == 0x00) {
				hasEndMarker = true;
				break;
			}
		}
		Assert.True(hasEndMarker);
	}

	[Fact]
	public void ExportToFile_CreatesFile() {
		var sequence = new MidiSequence {
			TicksPerBeat = 96,
			Tracks = []
		};

		var tempFile = Path.GetTempFileName();
		try {
			var writer = new MidiWriter();
			writer.ExportToFile(sequence, tempFile);

			Assert.True(File.Exists(tempFile));
			var data = File.ReadAllBytes(tempFile);
			Assert.True(data.Length >= 14);
		} finally {
			if (File.Exists(tempFile)) {
				File.Delete(tempFile);
			}
		}
	}
}

/// <summary>
/// Tests for SPC to MIDI converter.
/// </summary>
public class SpcToMidiConverterTests {
	[Fact]
	public void Convert_WithEmptySpc_ReturnsNull() {
		var spc = CreateTestSpc();
		var converter = new SpcToMidiConverter();

		var result = converter.Convert(spc);

		// Empty SPC should return null or empty
		Assert.True(result == null || result.Tracks.Count == 0);
	}

	[Fact]
	public void ConvertToBytes_WithEmptySpc_ReturnsNullOrEmpty() {
		var spc = CreateTestSpc();
		var converter = new SpcToMidiConverter();

		var result = converter.ConvertToBytes(spc);

		Assert.True(result == null || result.Length == 0);
	}

	private static SpcFile CreateTestSpc() {
		var spc = new SpcFile();
		spc.Header.HasId666 = true;
		spc.Dsp.Data[0x5d] = 0x02;
		return spc;
	}
}
