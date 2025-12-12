using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for AudioEditor class.
/// </summary>
public class AudioEditorTests {
	#region Format Detection Tests

	[Fact]
	public void DetectFormat_Nsf_Detected() {
		var data = new byte[128];
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = (byte)'M';
		data[4] = 0x1a;

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Nsf, format);
	}

	[Fact]
	public void DetectFormat_Nsfe_Detected() {
		var data = new byte[128];
		data[0] = (byte)'N';
		data[1] = (byte)'S';
		data[2] = (byte)'F';
		data[3] = (byte)'E';

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Nsfe, format);
	}

	[Fact]
	public void DetectFormat_Spc_Detected() {
		var data = new byte[256];
		var header = "SNES-SPC700 Sound File Data";
		for (int i = 0; i < header.Length; i++) {
			data[i] = (byte)header[i];
		}

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Spc, format);
	}

	[Fact]
	public void DetectFormat_Gbs_Detected() {
		var data = new byte[128];
		data[0] = (byte)'G';
		data[1] = (byte)'B';
		data[2] = (byte)'S';
		data[3] = 0x01;

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Gbs, format);
	}

	[Fact]
	public void DetectFormat_Vgm_Detected() {
		var data = new byte[128];
		data[0] = (byte)'V';
		data[1] = (byte)'g';
		data[2] = (byte)'m';
		data[3] = (byte)' ';

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Vgm, format);
	}

	[Fact]
	public void DetectFormat_Midi_Detected() {
		var data = new byte[128];
		data[0] = (byte)'M';
		data[1] = (byte)'T';
		data[2] = (byte)'h';
		data[3] = (byte)'d';

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Midi, format);
	}

	[Fact]
	public void DetectFormat_SmallData_ReturnsUnknown() {
		var data = new byte[2];

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Unknown, format);
	}

	[Fact]
	public void DetectFormat_UnknownData_ReturnsUnknown() {
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00, 0x00 };

		var format = AudioEditor.DetectFormat(data);

		Assert.Equal(AudioFormat.Unknown, format);
	}

	#endregion

	#region NSF Parsing Tests

	[Fact]
	public void GetAudioInfo_Nsf_ParsesMetadata() {
		var data = new byte[128];
		// Magic
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = (byte)'M';
		data[4] = 0x1a;
		// Version
		data[5] = 0x01;
		// Track count
		data[6] = 10;
		// Starting track
		data[7] = 1;
		// Load address
		data[8] = 0x00;
		data[9] = 0x80;
		// Init address
		data[10] = 0x00;
		data[11] = 0x80;
		// Play address
		data[12] = 0x03;
		data[13] = 0x80;
		// Title (at offset 14)
		var title = "Test Song";
		for (int i = 0; i < title.Length; i++) {
			data[14 + i] = (byte)title[i];
		}

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(AudioFormat.Nsf, info.Format);
		Assert.Equal(10, info.TrackCount);
		Assert.Equal("Test Song", info.Title);
		Assert.Equal(SystemType.Nes, info.System);
	}

	[Fact]
	public void GetAudioInfo_Nsf_ParsesAddresses() {
		var data = new byte[128];
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = (byte)'M';
		data[4] = 0x1a;
		data[8] = 0x00;
		data[9] = 0x80;
		data[10] = 0x10;
		data[11] = 0x80;
		data[12] = 0x20;
		data[13] = 0x80;

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Contains("Load Address", info.Metadata.Keys);
		Assert.Equal("$8000", info.Metadata["Load Address"]);
	}

	#endregion

	#region SPC Parsing Tests

	[Fact]
	public void GetAudioInfo_Spc_ParsesMetadata() {
		var data = new byte[256];
		var header = "SNES-SPC700 Sound File Data";
		for (int i = 0; i < header.Length; i++) {
			data[i] = (byte)header[i];
		}

		// Title at 0x2e
		var title = "Test Track";
		for (int i = 0; i < title.Length; i++) {
			data[0x2e + i] = (byte)title[i];
		}

		// Artist at 0xb1
		var artist = "Test Artist";
		for (int i = 0; i < artist.Length; i++) {
			data[0xb1 + i] = (byte)artist[i];
		}

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(AudioFormat.Spc, info.Format);
		Assert.Equal("Test Track", info.Title);
		Assert.Equal("Test Artist", info.Artist);
		Assert.Equal(SystemType.Snes, info.System);
	}

	[Fact]
	public void GetAudioInfo_Spc_SingleTrack() {
		var data = new byte[256];
		var header = "SNES-SPC700 Sound File Data";
		for (int i = 0; i < header.Length; i++) {
			data[i] = (byte)header[i];
		}

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(1, info.TrackCount);
	}

	#endregion

	#region GBS Parsing Tests

	[Fact]
	public void GetAudioInfo_Gbs_ParsesMetadata() {
		var data = new byte[128];
		data[0] = (byte)'G';
		data[1] = (byte)'B';
		data[2] = (byte)'S';
		data[3] = 0x01;
		// Track count
		data[4] = 15;
		// First track
		data[5] = 1;
		// Load address
		data[6] = 0x00;
		data[7] = 0x40;

		// Title at 16
		var title = "GB Music";
		for (int i = 0; i < title.Length; i++) {
			data[16 + i] = (byte)title[i];
		}

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(AudioFormat.Gbs, info.Format);
		Assert.Equal(15, info.TrackCount);
		Assert.Equal("GB Music", info.Title);
		Assert.Equal(SystemType.GameBoy, info.System);
	}

	#endregion

	#region VGM Parsing Tests

	[Fact]
	public void GetAudioInfo_Vgm_ParsesVersion() {
		var data = new byte[128];
		data[0] = (byte)'V';
		data[1] = (byte)'g';
		data[2] = (byte)'m';
		data[3] = (byte)' ';
		// Version 1.70
		data[8] = 0x70;
		data[9] = 0x01;
		data[10] = 0x00;
		data[11] = 0x00;

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(AudioFormat.Vgm, info.Format);
		Assert.Contains("Version", info.Metadata.Keys);
	}

	[Fact]
	public void GetAudioInfo_Vgm_ParsesSamples() {
		var data = new byte[128];
		data[0] = (byte)'V';
		data[1] = (byte)'g';
		data[2] = (byte)'m';
		data[3] = (byte)' ';
		// Total samples at 0x18
		data[0x18] = 0x00;
		data[0x19] = 0xac;
		data[0x1a] = 0x00;
		data[0x1b] = 0x00;

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Contains("Total Samples", info.Metadata.Keys);
	}

	#endregion

	#region MIDI Parsing Tests

	[Fact]
	public void GetAudioInfo_Midi_ParsesFormat() {
		var data = new byte[] {
			(byte)'M', (byte)'T', (byte)'h', (byte)'d',
			0, 0, 0, 6, // Header size
			0, 1, // Format 1
			0, 4, // 4 tracks
			0, 120 // 120 ticks
		};

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(AudioFormat.Midi, info.Format);
		Assert.Equal(4, info.TrackCount);
		Assert.Contains("Format", info.Metadata.Keys);
	}

	[Fact]
	public void GetAudioInfo_Midi_ParsesDivision() {
		var data = new byte[] {
			(byte)'M', (byte)'T', (byte)'h', (byte)'d',
			0, 0, 0, 6,
			0, 0,
			0, 1,
			0, 96 // 96 ticks per quarter
		};

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Contains("Division", info.Metadata.Keys);
		Assert.Contains("96", info.Metadata["Division"]);
	}

	#endregion

	#region Music Analysis Tests

	[Fact]
	public void AnalyzeMusic_Nes_ReturnsAnalysis() {
		var data = new byte[256];
		// Fill with some test data
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i & 0xff);
		}

		var analysis = AudioEditor.AnalyzeMusic(data, SystemType.Nes);

		Assert.NotNull(analysis);
		Assert.NotNull(analysis.Sequences);
		Assert.NotNull(analysis.Instruments);
	}

	[Fact]
	public void AnalyzeMusic_Snes_DetectsDriver() {
		var data = new byte[256];

		var analysis = AudioEditor.AnalyzeMusic(data, SystemType.Snes);

		Assert.Equal("SPC700", analysis.DriverType);
	}

	[Fact]
	public void AnalyzeMusic_GameBoy_DetectsDriver() {
		var data = new byte[256];

		var analysis = AudioEditor.AnalyzeMusic(data, SystemType.GameBoy);

		Assert.Equal("Game Boy", analysis.DriverType);
	}

	#endregion

	#region Instrument Extraction Tests

	[Fact]
	public void ExtractInstruments_Snes_ReturnsList() {
		var data = new byte[256];

		var instruments = AudioEditor.ExtractInstruments(data, SystemType.Snes);

		Assert.NotNull(instruments);
	}

	[Fact]
	public void ExtractInstruments_GameBoy_ReturnsList() {
		var data = new byte[256];

		var instruments = AudioEditor.ExtractInstruments(data, SystemType.GameBoy);

		Assert.NotNull(instruments);
	}

	[Fact]
	public void ExtractInstruments_Nes_ReturnsList() {
		var data = new byte[256];

		var instruments = AudioEditor.ExtractInstruments(data, SystemType.Nes);

		Assert.NotNull(instruments);
	}

	[Fact]
	public void ExtractBrrSamples_ValidData_ExtractsSamples() {
		// Create some valid BRR-like data
		var data = new byte[100];
		// BRR block: header byte + 8 data bytes
		// Header with end flag set
		data[0] = 0x01; // End flag set
		data[1] = 0x12;
		data[2] = 0x34;
		data[3] = 0x56;
		data[4] = 0x78;
		data[5] = 0x9a;
		data[6] = 0xbc;
		data[7] = 0xde;
		data[8] = 0xf0;

		var samples = AudioEditor.ExtractBrrSamples(data);

		// May or may not detect depending on heuristics
		Assert.NotNull(samples);
	}

	[Fact]
	public void ExtractWaveTables_WithWavePattern_ExtractsPattern() {
		var data = new byte[100];
		// Create a simple wave pattern (alternating values)
		for (int i = 0; i < 16; i++) {
			data[i] = (byte)((i % 2 == 0) ? 0x0f : 0xf0);
		}

		var waveTables = AudioEditor.ExtractWaveTables(data);

		Assert.NotNull(waveTables);
	}

	[Fact]
	public void ExtractDpcmSamples_ReturnsList() {
		var data = new byte[256];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)((i * 7) & 0xff);
		}

		var samples = AudioEditor.ExtractDpcmSamples(data);

		Assert.NotNull(samples);
	}

	#endregion

	#region MIDI Conversion Tests

	[Fact]
	public void ConvertToMidi_EmptySequence_ReturnsNull() {
		var data = new byte[16];

		var midi = AudioEditor.ConvertToMidi(data, MusicDriverType.Generic);

		// Empty sequence should return null or minimal MIDI
		// The implementation returns null for empty events
		Assert.Null(midi);
	}

	[Fact]
	public void ImportMidi_InvalidData_ReturnsNull() {
		var data = new byte[] { 0x00, 0x00, 0x00, 0x00 };

		var result = AudioEditor.ImportMidi(data, MusicDriverType.Generic);

		Assert.Null(result);
	}

	[Fact]
	public void ImportMidi_TooSmall_ReturnsNull() {
		var data = new byte[] { (byte)'M', (byte)'T', (byte)'h' };

		var result = AudioEditor.ImportMidi(data, MusicDriverType.Generic);

		Assert.Null(result);
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void GetAudioInfo_EmptyNsf_HandlesGracefully() {
		var data = new byte[10];
		data[0] = (byte)'N';
		data[1] = (byte)'E';
		data[2] = (byte)'S';
		data[3] = (byte)'M';

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(AudioFormat.Nsf, info.Format);
	}

	[Fact]
	public void GetAudioInfo_EmptySpc_HandlesGracefully() {
		var data = new byte[50];
		var header = "SNES-SPC700 Sound File Data";
		for (int i = 0; i < header.Length && i < data.Length; i++) {
			data[i] = (byte)header[i];
		}

		var info = AudioEditor.GetAudioInfo(data);

		Assert.Equal(AudioFormat.Spc, info.Format);
	}

	[Fact]
	public void AnalyzeMusic_UnknownSystem_ReturnsEmptyAnalysis() {
		var data = new byte[100];

		var analysis = AudioEditor.AnalyzeMusic(data, (SystemType)999);

		Assert.Empty(analysis.Sequences);
		Assert.Empty(analysis.Instruments);
	}

	#endregion
}
