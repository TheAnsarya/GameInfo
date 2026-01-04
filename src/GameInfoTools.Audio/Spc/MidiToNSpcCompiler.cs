namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Reads Standard MIDI Files (SMF) and parses them into a structured format.
/// </summary>
public class MidiReader {
	/// <summary>
	/// Load a MIDI file from disk.
	/// </summary>
	public MidiSequence Load(string path) {
		var data = File.ReadAllBytes(path);
		return Parse(data);
	}

	/// <summary>
	/// Parse MIDI data from a byte array.
	/// </summary>
	public MidiSequence Parse(byte[] data) {
		if (data.Length < 14) {
			throw new InvalidDataException("MIDI file too small");
		}

		int pos = 0;

		// Read header chunk
		var header = ReadChunk(data, ref pos);
		if (header.Id != "MThd" || header.Data.Length != 6) {
			throw new InvalidDataException("Invalid MIDI header");
		}

		int format = ReadBigEndian16(header.Data, 0);
		int numTracks = ReadBigEndian16(header.Data, 2);
		int division = ReadBigEndian16(header.Data, 4);

		var sequence = new MidiSequence {
			TicksPerBeat = division,
			Tracks = []
		};

		// Read track chunks
		for (int i = 0; i < numTracks && pos < data.Length; i++) {
			var trackChunk = ReadChunk(data, ref pos);
			if (trackChunk.Id != "MTrk") continue;

			var track = ParseTrack(trackChunk.Data, i);
			sequence.Tracks.Add(track);
		}

		return sequence;
	}

	private MidiTrack ParseTrack(byte[] data, int trackNumber) {
		var track = new MidiTrack {
			ChannelNumber = trackNumber,
			Events = []
		};

		int pos = 0;
		int absoluteTick = 0;
		byte runningStatus = 0;

		while (pos < data.Length) {
			// Read delta time
			int delta = ReadVariableLength(data, ref pos);
			absoluteTick += delta;

			if (pos >= data.Length) break;

			byte status = data[pos];

			// Check for running status
			if ((status & 0x80) == 0) {
				// Use running status
				status = runningStatus;
			} else {
				pos++;
				if ((status & 0xf0) != 0xf0) {
					runningStatus = status;
				}
			}

			var evt = ParseEvent(data, ref pos, status, absoluteTick, trackNumber);
			if (evt != null) {
				track.Events.Add(evt);
			}

			// End of track
			if (evt?.Type == MidiEventType.EndOfTrack) break;
		}

		return track;
	}

	private MidiEvent? ParseEvent(byte[] data, ref int pos, byte status, int tick, int trackNumber) {
		int channel = status & 0x0f;
		int command = status & 0xf0;

		switch (command) {
			case 0x80: // Note Off
				if (pos + 2 > data.Length) return null;
				return new MidiEvent {
					Tick = tick,
					Type = MidiEventType.NoteOff,
					Channel = channel,
					Note = data[pos++],
					Velocity = data[pos++]
				};

			case 0x90: // Note On
				if (pos + 2 > data.Length) return null;
				int note = data[pos++];
				int velocity = data[pos++];
				return new MidiEvent {
					Tick = tick,
					Type = velocity == 0 ? MidiEventType.NoteOff : MidiEventType.NoteOn,
					Channel = channel,
					Note = note,
					Velocity = velocity
				};

			case 0xa0: // Polyphonic Key Pressure
				pos += 2;
				return null; // Skip for now

			case 0xb0: // Control Change
				if (pos + 2 > data.Length) return null;
				return new MidiEvent {
					Tick = tick,
					Type = MidiEventType.ControlChange,
					Channel = channel,
					Controller = data[pos++],
					Value = data[pos++]
				};

			case 0xc0: // Program Change
				if (pos + 1 > data.Length) return null;
				return new MidiEvent {
					Tick = tick,
					Type = MidiEventType.ProgramChange,
					Channel = channel,
					Program = data[pos++]
				};

			case 0xd0: // Channel Pressure
				pos++;
				return null; // Skip for now

			case 0xe0: // Pitch Bend
				if (pos + 2 > data.Length) return null;
				int lsb = data[pos++];
				int msb = data[pos++];
				return new MidiEvent {
					Tick = tick,
					Type = MidiEventType.PitchBend,
					Channel = channel,
					Value = ((msb << 7) | lsb) - 0x2000
				};

			case 0xf0: // System messages
				return ParseSystemMessage(data, ref pos, status, tick);

			default:
				return null;
		}
	}

	private MidiEvent? ParseSystemMessage(byte[] data, ref int pos, byte status, int tick) {
		if (status == 0xff) {
			// Meta event
			if (pos + 2 > data.Length) return null;

			byte metaType = data[pos++];
			int length = ReadVariableLength(data, ref pos);

			if (pos + length > data.Length) return null;

			switch (metaType) {
				case 0x51: // Tempo
					if (length >= 3) {
						int tempo = (data[pos] << 16) | (data[pos + 1] << 8) | data[pos + 2];
						pos += length;
						return new MidiEvent {
							Tick = tick,
							Type = MidiEventType.Tempo,
							Tempo = tempo
						};
					}
					break;

				case 0x2f: // End of Track
					pos += length;
					return new MidiEvent {
						Tick = tick,
						Type = MidiEventType.EndOfTrack
					};

				default:
					pos += length;
					break;
			}
		} else if (status == 0xf0 || status == 0xf7) {
			// SysEx
			int length = ReadVariableLength(data, ref pos);
			pos += length;
		}

		return null;
	}

	private static (string Id, byte[] Data) ReadChunk(byte[] data, ref int pos) {
		if (pos + 8 > data.Length) {
			throw new InvalidDataException("Unexpected end of file");
		}

		string id = System.Text.Encoding.ASCII.GetString(data, pos, 4);
		pos += 4;

		int length = ReadBigEndian32(data, pos);
		pos += 4;

		if (pos + length > data.Length) {
			throw new InvalidDataException("Chunk extends beyond file");
		}

		byte[] chunkData = new byte[length];
		Array.Copy(data, pos, chunkData, 0, length);
		pos += length;

		return (id, chunkData);
	}

	private static int ReadVariableLength(byte[] data, ref int pos) {
		int value = 0;
		while (pos < data.Length) {
			byte b = data[pos++];
			value = (value << 7) | (b & 0x7f);
			if ((b & 0x80) == 0) break;
		}
		return value;
	}

	private static int ReadBigEndian16(byte[] data, int offset) {
		return (data[offset] << 8) | data[offset + 1];
	}

	private static int ReadBigEndian32(byte[] data, int offset) {
		return (data[offset] << 24) | (data[offset + 1] << 16) |
			   (data[offset + 2] << 8) | data[offset + 3];
	}
}

/// <summary>
/// Compiles MIDI sequences to N-SPC format for SNES playback.
/// </summary>
public class MidiToNSpcCompiler {
	private readonly CompilerOptions _options;

	public MidiToNSpcCompiler(CompilerOptions? options = null) {
		_options = options ?? new CompilerOptions();
	}

	/// <summary>
	/// Compile a MIDI file to N-SPC sequence data.
	/// </summary>
	public NSpcSequence Compile(MidiSequence midi) {
		var sequence = new NSpcSequence {
			StartAddress = _options.SequenceBaseAddress,
			Tracks = []
		};

		// Process up to 8 MIDI channels (SNES limit)
		var channelTracks = GroupByChannel(midi);

		for (int ch = 0; ch < 8 && ch < channelTracks.Count; ch++) {
			var midiEvents = channelTracks.ElementAtOrDefault(ch);
			if (midiEvents == null || midiEvents.Count == 0) continue;

			var track = CompileTrack(midiEvents, ch, midi.TicksPerBeat);
			sequence.Tracks.Add(track);
		}

		return sequence;
	}

	/// <summary>
	/// Compile MIDI to raw N-SPC bytes for injection into SPC RAM.
	/// </summary>
	public byte[] CompileToBytes(MidiSequence midi) {
		var sequence = Compile(midi);
		return EncodeSequence(sequence);
	}

	private List<List<MidiEvent>> GroupByChannel(MidiSequence midi) {
		var channelEvents = new Dictionary<int, List<MidiEvent>>();

		foreach (var track in midi.Tracks) {
			foreach (var evt in track.Events) {
				if (!channelEvents.ContainsKey(evt.Channel)) {
					channelEvents[evt.Channel] = [];
				}
				channelEvents[evt.Channel].Add(evt);
			}
		}

		// Sort each channel by tick
		foreach (var events in channelEvents.Values) {
			events.Sort((a, b) => a.Tick.CompareTo(b.Tick));
		}

		return channelEvents.Values.ToList();
	}

	private NSpcTrack CompileTrack(List<MidiEvent> events, int channelNumber, int ticksPerBeat) {
		var track = new NSpcTrack {
			ChannelNumber = channelNumber,
			StartAddress = 0,
			Events = []
		};

		int lastTick = 0;
		int currentInstrument = -1;
		int currentVolume = 100;

		foreach (var evt in events) {
			// Calculate duration since last event
			int deltaTicks = evt.Tick - lastTick;
			int duration = TicksToNSpcDuration(deltaTicks, ticksPerBeat);

			switch (evt.Type) {
				case MidiEventType.NoteOn when evt.Velocity > 0:
					// Add rest if there's a gap
					if (duration > 0 && track.Events.Count > 0) {
						AddRest(track, duration);
					}

					// Convert MIDI note to N-SPC note
					int nspcNote = MidiNoteToNSpc(evt.Note);
					track.Events.Add(new NSpcEvent {
						Type = NSpcParser.CommandType.Note,
						Note = nspcNote,
						Duration = 12 // Default duration, will be adjusted by next event
					});
					lastTick = evt.Tick;
					break;

				case MidiEventType.NoteOff:
				case MidiEventType.NoteOn when evt.Velocity == 0:
					// Update duration of previous note
					if (track.Events.Count > 0) {
						var lastNote = track.Events.LastOrDefault(e => e.Type == NSpcParser.CommandType.Note);
						if (lastNote != null) {
							lastNote.Duration = Math.Max(1, TicksToNSpcDuration(evt.Tick - lastTick, ticksPerBeat));
						}
					}
					break;

				case MidiEventType.ProgramChange:
					if (currentInstrument != evt.Program) {
						track.Events.Add(new NSpcEvent {
							Type = NSpcParser.CommandType.SetInstrument,
							Parameter1 = evt.Program % 16 // Limit to 16 SNES instruments
						});
						currentInstrument = evt.Program;
					}
					break;

				case MidiEventType.ControlChange:
					if (evt.Controller == 7) { // Volume
						int vol = evt.Value;
						if (vol != currentVolume) {
							track.Events.Add(new NSpcEvent {
								Type = NSpcParser.CommandType.SetVolume,
								Parameter1 = vol
							});
							currentVolume = vol;
						}
					} else if (evt.Controller == 10) { // Pan
						track.Events.Add(new NSpcEvent {
							Type = NSpcParser.CommandType.SetPan,
							Parameter1 = evt.Value
						});
					}
					break;

				case MidiEventType.Tempo:
					// Convert microseconds per beat to N-SPC tempo
					int bpm = 60000000 / evt.Tempo;
					track.Events.Add(new NSpcEvent {
						Type = NSpcParser.CommandType.SetTempo,
						Parameter1 = Math.Clamp(bpm / 2, 1, 255)
					});
					break;
			}
		}

		// Add end marker
		track.Events.Add(new NSpcEvent {
			Type = NSpcParser.CommandType.EndTrack
		});

		return track;
	}

	private static void AddRest(NSpcTrack track, int duration) {
		while (duration > 0) {
			int restLen = Math.Min(duration, 72); // Max N-SPC duration
			track.Events.Add(new NSpcEvent {
				Type = NSpcParser.CommandType.Rest,
				Duration = restLen
			});
			duration -= restLen;
		}
	}

	private static int MidiNoteToNSpc(int midiNote) {
		// MIDI note 60 = middle C
		// N-SPC typically uses 0-127 but with different octave mapping
		return Math.Clamp(midiNote - 24, 0, 127);
	}

	private static int TicksToNSpcDuration(int ticks, int ticksPerBeat) {
		// Convert MIDI ticks to N-SPC duration units
		// N-SPC typically uses 12 ticks per quarter note
		if (ticksPerBeat == 0) return 12;
		return Math.Max(1, ticks * 12 / ticksPerBeat);
	}

	/// <summary>
	/// Encode the sequence to raw bytes.
	/// </summary>
	private byte[] EncodeSequence(NSpcSequence sequence) {
		var output = new List<byte>();

		// Track pointer table (8 entries, 2 bytes each)
		int headerSize = 16;
		int trackDataStart = _options.SequenceBaseAddress + headerSize;

		var trackData = new List<byte[]>();
		foreach (var track in sequence.Tracks) {
			trackData.Add(EncodeTrack(track));
		}

		// Write track pointers
		int offset = trackDataStart;
		for (int i = 0; i < 8; i++) {
			if (i < trackData.Count) {
				output.Add((byte)(offset & 0xff));
				output.Add((byte)((offset >> 8) & 0xff));
				offset += trackData[i].Length;
			} else {
				output.Add(0);
				output.Add(0);
			}
		}

		// Write track data
		foreach (var data in trackData) {
			output.AddRange(data);
		}

		return [.. output];
	}

	private static byte[] EncodeTrack(NSpcTrack track) {
		var output = new List<byte>();

		foreach (var evt in track.Events) {
			switch (evt.Type) {
				case NSpcParser.CommandType.Note:
					// Duration prefix + note
					int dur = Math.Clamp(evt.Duration - 1, 0, 0x47);
					output.Add((byte)(0x80 + dur));
					output.Add((byte)Math.Clamp(evt.Note, 0, 0x7f));
					break;

				case NSpcParser.CommandType.Rest:
					int restDur = Math.Clamp(evt.Duration - 1, 0, 0x47);
					output.Add((byte)(0x80 + restDur));
					break;

				case NSpcParser.CommandType.SetInstrument:
					output.Add(0xc8);
					output.Add((byte)evt.Parameter1);
					break;

				case NSpcParser.CommandType.SetPan:
					output.Add(0xc9);
					output.Add((byte)evt.Parameter1);
					break;

				case NSpcParser.CommandType.SetVolume:
					output.Add(0xca);
					output.Add((byte)evt.Parameter1);
					break;

				case NSpcParser.CommandType.SetTempo:
					output.Add(0xcc);
					output.Add((byte)evt.Parameter1);
					break;

				case NSpcParser.CommandType.SetTranspose:
					output.Add(0xcd);
					output.Add((byte)evt.Parameter1);
					break;

				case NSpcParser.CommandType.EndTrack:
					output.Add(0xff);
					break;
			}
		}

		return [.. output];
	}
}

/// <summary>
/// Options for the MIDI to N-SPC compiler.
/// </summary>
public class CompilerOptions {
	/// <summary>
	/// Base address in SPC RAM for sequence data.
	/// </summary>
	public int SequenceBaseAddress { get; init; } = 0x1000;

	/// <summary>
	/// Maximum number of channels to compile.
	/// </summary>
	public int MaxChannels { get; init; } = 8;

	/// <summary>
	/// Whether to optimize repeated patterns.
	/// </summary>
	public bool OptimizeLoops { get; init; } = true;
}
