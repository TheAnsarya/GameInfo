namespace GameInfoTools.Audio.Spc;

/// <summary>
/// Parser for Nintendo's N-SPC music format.
/// Used in Super Mario World, Zelda: LTTP, Donkey Kong Country, and many first-party SNES games.
/// </summary>
public class NSpcParser {
	private readonly SpcFile _spc;
	private readonly byte[] _ram;

	/// <summary>
	/// N-SPC command types.
	/// </summary>
	public enum CommandType {
		Note,
		Rest,
		Tie,
		SetInstrument,
		SetPan,
		SetVolume,
		SetTempo,
		SetTranspose,
		LoopStart,
		LoopEnd,
		CallSubroutine,
		Return,
		EndTrack,
		SetVibrato,
		SetPortamento,
		SetEcho,
		Unknown
	}

	public NSpcParser(SpcFile spc) {
		_spc = spc ?? throw new ArgumentNullException(nameof(spc));
		_ram = spc.Ram;
	}

	/// <summary>
	/// Attempts to parse N-SPC sequence data starting at the given address.
	/// </summary>
	public NSpcSequence? ParseSequence(int startAddress) {
		if (startAddress < 0 || startAddress >= _ram.Length) return null;

		var sequence = new NSpcSequence {
			StartAddress = startAddress,
			Tracks = []
		};

		// Try to read track pointers (usually 8 channels)
		for (int ch = 0; ch < 8; ch++) {
			int ptrAddr = startAddress + ch * 2;
			if (ptrAddr + 1 >= _ram.Length) break;

			int trackAddr = _ram[ptrAddr] | (_ram[ptrAddr + 1] << 8);
			if (trackAddr == 0 || trackAddr >= _ram.Length) continue;

			var track = ParseTrack(trackAddr, ch);
			if (track != null && track.Events.Count > 0) {
				sequence.Tracks.Add(track);
			}
		}

		return sequence.Tracks.Count > 0 ? sequence : null;
	}

	/// <summary>
	/// Parse a single track from N-SPC data.
	/// </summary>
	public NSpcTrack? ParseTrack(int startAddress, int channelNumber) {
		if (startAddress < 0 || startAddress >= _ram.Length) return null;

		var track = new NSpcTrack {
			ChannelNumber = channelNumber,
			StartAddress = startAddress,
			Events = []
		};

		int addr = startAddress;
		int tick = 0;
		int maxBytes = 2000; // Safety limit
		int bytesRead = 0;

		while (addr < _ram.Length && bytesRead < maxBytes) {
			byte cmd = _ram[addr];
			var evt = ParseCommand(addr, ref addr, ref tick);

			if (evt == null) break;
			track.Events.Add(evt);
			bytesRead = addr - startAddress;

			if (evt.Type == CommandType.EndTrack || evt.Type == CommandType.Return) {
				break;
			}
		}

		track.EndAddress = addr;
		track.TotalTicks = tick;

		return track;
	}

	/// <summary>
	/// Parse a single N-SPC command.
	/// </summary>
	private NSpcEvent? ParseCommand(int addr, ref int nextAddr, ref int tick) {
		if (addr >= _ram.Length) return null;

		byte cmd = _ram[addr];
		var evt = new NSpcEvent {
			Address = addr,
			Command = cmd
		};

		// N-SPC uses $00-$7F for notes with duration encoded separately
		// $80-$C7 are durations
		// $C8-$FF are control commands

		if (cmd <= 0x7f) {
			// Note or duration prefix
			// In N-SPC, notes and durations can be interleaved
			if (cmd >= 0x80 && cmd <= 0xc7) {
				// Duration value: (cmd - 0x80) gives duration units
				evt.Type = CommandType.Note;
				evt.Duration = (cmd - 0x80) + 1;
				evt.Note = cmd;
				nextAddr = addr + 1;
				tick += evt.Duration;
			} else if (cmd < 0x80) {
				// This could be a note with implied duration or part of data
				evt.Type = CommandType.Note;
				evt.Note = cmd;
				evt.Duration = 1;
				nextAddr = addr + 1;
				tick += 1;
			}
		} else if (cmd >= 0xc8) {
			// Control command
			switch (cmd) {
				case 0xc8: // Set instrument
					evt.Type = CommandType.SetInstrument;
					evt.Parameter1 = SafeReadByte(addr + 1);
					nextAddr = addr + 2;
					break;

				case 0xc9: // Set pan
					evt.Type = CommandType.SetPan;
					evt.Parameter1 = SafeReadByte(addr + 1);
					nextAddr = addr + 2;
					break;

				case 0xca: // Set volume
					evt.Type = CommandType.SetVolume;
					evt.Parameter1 = SafeReadByte(addr + 1);
					nextAddr = addr + 2;
					break;

				case 0xcb: // Set tempo (alternate)
				case 0xcc: // Set tempo
					evt.Type = CommandType.SetTempo;
					evt.Parameter1 = SafeReadByte(addr + 1);
					nextAddr = addr + 2;
					break;

				case 0xcd: // Set transpose
					evt.Type = CommandType.SetTranspose;
					evt.Parameter1 = (sbyte)SafeReadByte(addr + 1);
					nextAddr = addr + 2;
					break;

				case 0xce: // Loop start
					evt.Type = CommandType.LoopStart;
					evt.Parameter1 = SafeReadByte(addr + 1); // Loop count
					nextAddr = addr + 2;
					break;

				case 0xcf: // Loop end
					evt.Type = CommandType.LoopEnd;
					nextAddr = addr + 1;
					break;

				case 0xd0: // Call subroutine
					evt.Type = CommandType.CallSubroutine;
					evt.Parameter1 = SafeReadByte(addr + 1);
					evt.Parameter2 = SafeReadByte(addr + 2);
					nextAddr = addr + 3;
					break;

				case 0xd1: // Return from subroutine
					evt.Type = CommandType.Return;
					nextAddr = addr + 1;
					break;

				case 0xd2: // Set vibrato
					evt.Type = CommandType.SetVibrato;
					evt.Parameter1 = SafeReadByte(addr + 1); // Delay
					evt.Parameter2 = SafeReadByte(addr + 2); // Rate
					evt.Parameter3 = SafeReadByte(addr + 3); // Depth
					nextAddr = addr + 4;
					break;

				case 0xd3: // Set echo
					evt.Type = CommandType.SetEcho;
					evt.Parameter1 = SafeReadByte(addr + 1);
					nextAddr = addr + 2;
					break;

				case 0xd4: // Portamento
					evt.Type = CommandType.SetPortamento;
					evt.Parameter1 = SafeReadByte(addr + 1);
					evt.Parameter2 = SafeReadByte(addr + 2);
					nextAddr = addr + 3;
					break;

				case 0x00: // End track / Rest
					evt.Type = CommandType.EndTrack;
					nextAddr = addr + 1;
					break;

				case 0xff: // End marker
					evt.Type = CommandType.EndTrack;
					nextAddr = addr + 1;
					break;

				default:
					// Unknown command - try to continue
					evt.Type = CommandType.Unknown;
					evt.Description = $"Unknown command ${cmd:X2}";
					nextAddr = addr + 1;
					break;
			}
		} else {
			// Duration value range (0x80-0xC7)
			evt.Type = CommandType.Rest;
			evt.Duration = (cmd - 0x80) + 1;
			tick += evt.Duration;
			nextAddr = addr + 1;
		}

		return evt;
	}

	private byte SafeReadByte(int addr) {
		return addr < _ram.Length ? _ram[addr] : (byte)0;
	}

	/// <summary>
	/// Attempts to find the sequence header in RAM.
	/// </summary>
	public int FindSequenceHeader() {
		// N-SPC typically stores the song header pointer in a known location
		// Common locations: $0000, $0100, after driver code

		// Look for track pointer table pattern (8 consecutive pointers)
		for (int addr = 0x100; addr < 0x8000; addr += 2) {
			if (IsValidTrackPointerTable(addr)) {
				return addr;
			}
		}

		return -1;
	}

	private bool IsValidTrackPointerTable(int addr) {
		if (addr + 16 > _ram.Length) return false;

		int validPtrs = 0;
		int prevPtr = 0;

		for (int i = 0; i < 8; i++) {
			int ptr = _ram[addr + i * 2] | (_ram[addr + i * 2 + 1] << 8);

			// Valid pointer should be in reasonable range
			if (ptr > 0 && ptr < 0xffc0 && ptr > addr) {
				// Pointers should be somewhat sequential or at least ordered
				if (prevPtr == 0 || Math.Abs(ptr - prevPtr) < 0x1000) {
					validPtrs++;
				}
				prevPtr = ptr;
			}
		}

		return validPtrs >= 3; // At least 3 valid track pointers
	}

	/// <summary>
	/// Convert parsed sequence to MIDI events.
	/// </summary>
	public MidiSequence ToMidi(NSpcSequence sequence, int ticksPerBeat = 48) {
		var midi = new MidiSequence {
			TicksPerBeat = ticksPerBeat,
			Tracks = []
		};

		foreach (var track in sequence.Tracks) {
			var midiTrack = new MidiTrack {
				ChannelNumber = track.ChannelNumber,
				Events = []
			};

			int tick = 0;
			int currentInstrument = 0;
			int currentVolume = 100;
			int transpose = 0;

			foreach (var evt in track.Events) {
				switch (evt.Type) {
					case CommandType.Note:
						// Convert N-SPC note to MIDI note
						int note = ConvertNote(evt.Note, transpose);
						if (note >= 0 && note <= 127) {
							midiTrack.Events.Add(new MidiEvent {
								Tick = tick,
								Type = MidiEventType.NoteOn,
								Note = note,
								Velocity = currentVolume,
								Channel = track.ChannelNumber
							});
							midiTrack.Events.Add(new MidiEvent {
								Tick = tick + evt.Duration * ticksPerBeat / 12,
								Type = MidiEventType.NoteOff,
								Note = note,
								Velocity = 0,
								Channel = track.ChannelNumber
							});
						}
						tick += evt.Duration * ticksPerBeat / 12;
						break;

					case CommandType.Rest:
						tick += evt.Duration * ticksPerBeat / 12;
						break;

					case CommandType.SetInstrument:
						midiTrack.Events.Add(new MidiEvent {
							Tick = tick,
							Type = MidiEventType.ProgramChange,
							Program = evt.Parameter1 % 128,
							Channel = track.ChannelNumber
						});
						currentInstrument = evt.Parameter1;
						break;

					case CommandType.SetVolume:
						currentVolume = Math.Min(127, evt.Parameter1);
						midiTrack.Events.Add(new MidiEvent {
							Tick = tick,
							Type = MidiEventType.ControlChange,
							Controller = 7, // Volume CC
							Value = currentVolume,
							Channel = track.ChannelNumber
						});
						break;

					case CommandType.SetTempo:
						// Tempo in BPM
						int bpm = evt.Parameter1 > 0 ? evt.Parameter1 * 2 : 120;
						midiTrack.Events.Add(new MidiEvent {
							Tick = tick,
							Type = MidiEventType.Tempo,
							Tempo = 60000000 / bpm // Microseconds per beat
						});
						break;

					case CommandType.SetTranspose:
						transpose = (sbyte)evt.Parameter1;
						break;

					case CommandType.SetPan:
						int pan = Math.Clamp(evt.Parameter1, 0, 127);
						midiTrack.Events.Add(new MidiEvent {
							Tick = tick,
							Type = MidiEventType.ControlChange,
							Controller = 10, // Pan CC
							Value = pan,
							Channel = track.ChannelNumber
						});
						break;
				}
			}

			midiTrack.Events.Sort((a, b) => a.Tick.CompareTo(b.Tick));
			midi.Tracks.Add(midiTrack);
		}

		return midi;
	}

	private static int ConvertNote(int nspcNote, int transpose) {
		// N-SPC notes are typically in a specific octave range
		// Map to MIDI note numbers (middle C = 60)
		int midiNote = nspcNote + transpose + 24; // Adjust base octave
		return Math.Clamp(midiNote, 0, 127);
	}
}

/// <summary>
/// Represents a complete N-SPC sequence.
/// </summary>
public class NSpcSequence {
	public int StartAddress { get; init; }
	public List<NSpcTrack> Tracks { get; init; } = [];
}

/// <summary>
/// A single track (channel) in an N-SPC sequence.
/// </summary>
public class NSpcTrack {
	public int ChannelNumber { get; init; }
	public int StartAddress { get; init; }
	public int EndAddress { get; set; }
	public int TotalTicks { get; set; }
	public List<NSpcEvent> Events { get; init; } = [];
}

/// <summary>
/// A single event in an N-SPC track.
/// </summary>
public class NSpcEvent {
	public int Address { get; init; }
	public byte Command { get; init; }
	public NSpcParser.CommandType Type { get; set; }
	public int Note { get; set; }
	public int Duration { get; set; }
	public int Parameter1 { get; set; }
	public int Parameter2 { get; set; }
	public int Parameter3 { get; set; }
	public string? Description { get; set; }
}

/// <summary>
/// Represents a MIDI sequence converted from N-SPC.
/// </summary>
public class MidiSequence {
	public int TicksPerBeat { get; init; }
	public List<MidiTrack> Tracks { get; init; } = [];
}

/// <summary>
/// A MIDI track.
/// </summary>
public class MidiTrack {
	public int ChannelNumber { get; init; }
	public List<MidiEvent> Events { get; init; } = [];
}

/// <summary>
/// A MIDI event.
/// </summary>
public class MidiEvent {
	public int Tick { get; init; }
	public MidiEventType Type { get; init; }
	public int Note { get; init; }
	public int Velocity { get; init; }
	public int Channel { get; init; }
	public int Program { get; init; }
	public int Controller { get; init; }
	public int Value { get; init; }
	public int Tempo { get; init; } // Microseconds per beat
}

/// <summary>
/// MIDI event types.
/// </summary>
public enum MidiEventType {
	NoteOn,
	NoteOff,
	ProgramChange,
	ControlChange,
	PitchBend,
	Tempo,
	EndOfTrack
}
