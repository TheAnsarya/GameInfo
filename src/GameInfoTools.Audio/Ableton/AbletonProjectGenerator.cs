using System.IO.Compression;
using System.Text;
using System.Xml;

namespace GameInfoTools.Audio.Ableton;

/// <summary>
/// Generates Ableton Live project files (.als) from SNES audio data.
/// ALS files are gzip-compressed XML.
/// </summary>
public class AbletonProjectGenerator {
	/// <summary>
	/// Ableton Live version to target.
	/// </summary>
	public string AbletonVersion { get; set; } = "11.0";

	/// <summary>
	/// Project tempo in BPM.
	/// </summary>
	public double Tempo { get; set; } = 120.0;

	/// <summary>
	/// Time signature numerator.
	/// </summary>
	public int TimeSignatureNumerator { get; set; } = 4;

	/// <summary>
	/// Time signature denominator.
	/// </summary>
	public int TimeSignatureDenominator { get; set; } = 4;

	/// <summary>
	/// Project name.
	/// </summary>
	public string ProjectName { get; set; } = "SNES Music";

	/// <summary>
	/// Sample rate.
	/// </summary>
	public int SampleRate { get; set; } = 32000;

	/// <summary>
	/// MIDI tracks to add.
	/// </summary>
	public List<AbletonMidiTrack> MidiTracks { get; } = [];

	/// <summary>
	/// Audio samples to include.
	/// </summary>
	public List<AbletonSample> Samples { get; } = [];

	/// <summary>
	/// Generate the Ableton project and save to disk.
	/// </summary>
	public void Generate(string outputPath) {
		var projectDir = Path.GetDirectoryName(outputPath) ?? ".";
		var samplesDir = Path.Combine(projectDir, "Samples", "Processed");

		// Create directories
		Directory.CreateDirectory(projectDir);
		Directory.CreateDirectory(samplesDir);

		// Export samples
		foreach (var sample in Samples) {
			var samplePath = Path.Combine(samplesDir, sample.FileName);
			sample.WavData?.Save(samplePath);
		}

		// Generate XML
		var xml = GenerateXml();

		// Compress with gzip and save
		using var fileStream = File.Create(outputPath);
		using var gzipStream = new GZipStream(fileStream, CompressionLevel.Optimal);
		var bytes = Encoding.UTF8.GetBytes(xml);
		gzipStream.Write(bytes, 0, bytes.Length);
	}

	/// <summary>
	/// Generate the XML content for the ALS file.
	/// </summary>
	private string GenerateXml() {
		var settings = new XmlWriterSettings {
			Indent = true,
			IndentChars = "\t",
			Encoding = Encoding.UTF8
		};

		using var stringWriter = new StringWriter();
		using var writer = XmlWriter.Create(stringWriter, settings);

		writer.WriteStartDocument();

		// Root Ableton element
		writer.WriteStartElement("Ableton");
		writer.WriteAttributeString("MajorVersion", "5");
		writer.WriteAttributeString("MinorVersion", $"{AbletonVersion.Replace(".", "_")}");
		writer.WriteAttributeString("SchemaChangeCount", "3");
		writer.WriteAttributeString("Creator", $"GameInfoTools Audio Exporter");
		writer.WriteAttributeString("Revision", Guid.NewGuid().ToString("N")[..16]);

		// LiveSet
		writer.WriteStartElement("LiveSet");

		// Tracks
		WriteTracks(writer);

		// Master Track
		WriteMasterTrack(writer);

		// Transport
		WriteTransport(writer);

		// Locators (markers)
		WriteLocators(writer);

		writer.WriteEndElement(); // LiveSet
		writer.WriteEndElement(); // Ableton
		writer.WriteEndDocument();

		return stringWriter.ToString();
	}

	private void WriteTracks(XmlWriter writer) {
		writer.WriteStartElement("Tracks");

		int trackId = 0;
		foreach (var track in MidiTracks) {
			WriteMidiTrack(writer, track, trackId++);
		}

		writer.WriteEndElement(); // Tracks
	}

	private void WriteMidiTrack(XmlWriter writer, AbletonMidiTrack track, int trackId) {
		writer.WriteStartElement("MidiTrack");
		writer.WriteAttributeString("Id", trackId.ToString());

		// Track name
		WriteValueElement(writer, "Name", track.Name);

		// Color
		WriteValueElement(writer, "Color", track.Color.ToString());

		// Device chain (Simpler instrument)
		writer.WriteStartElement("DeviceChain");
		WriteSimpler(writer, track);
		writer.WriteEndElement();

		// Clips
		if (track.Clips.Count > 0) {
			writer.WriteStartElement("ClipSlotList");
			int clipId = 0;
			foreach (var clip in track.Clips) {
				WriteMidiClip(writer, clip, clipId++);
			}
			writer.WriteEndElement();
		}

		writer.WriteEndElement(); // MidiTrack
	}

	private void WriteSimpler(XmlWriter writer, AbletonMidiTrack track) {
		if (track.SampleIndex < 0 || track.SampleIndex >= Samples.Count) {
			return;
		}

		var sample = Samples[track.SampleIndex];

		writer.WriteStartElement("DeviceChain");
		writer.WriteStartElement("Devices");

		writer.WriteStartElement("OriginalSimpler");
		writer.WriteAttributeString("Id", "0");

		// Sample reference
		writer.WriteStartElement("Player");
		writer.WriteStartElement("MultiSampleMap");
		writer.WriteStartElement("SampleParts");

		writer.WriteStartElement("MultiSamplePart");
		writer.WriteAttributeString("Id", "0");

		// Sample path (relative)
		writer.WriteStartElement("SampleRef");
		writer.WriteStartElement("FileRef");
		WriteValueElement(writer, "RelativePath", $"Samples/Processed/{sample.FileName}");
		WriteValueElement(writer, "Name", sample.FileName);
		writer.WriteEndElement(); // FileRef
		writer.WriteEndElement(); // SampleRef

		// Loop settings
		if (sample.LoopEnabled) {
			WriteValueElement(writer, "SustainLoop/Start", sample.LoopStart.ToString());
			WriteValueElement(writer, "SustainLoop/End", sample.LoopEnd.ToString());
			WriteValueElement(writer, "SustainLoop/Mode", "1"); // Loop on
		}

		writer.WriteEndElement(); // MultiSamplePart
		writer.WriteEndElement(); // SampleParts
		writer.WriteEndElement(); // MultiSampleMap
		writer.WriteEndElement(); // Player

		// Volume/envelope
		WriteValueElement(writer, "Volume", "1");

		writer.WriteEndElement(); // OriginalSimpler
		writer.WriteEndElement(); // Devices
		writer.WriteEndElement(); // DeviceChain
	}

	private void WriteMidiClip(XmlWriter writer, AbletonMidiClip clip, int clipId) {
		writer.WriteStartElement("ClipSlot");
		writer.WriteAttributeString("Id", clipId.ToString());

		writer.WriteStartElement("MidiClip");
		writer.WriteAttributeString("Id", clipId.ToString());

		WriteValueElement(writer, "Name", clip.Name);
		WriteValueElement(writer, "Start", clip.StartTime.ToString("F6"));
		WriteValueElement(writer, "End", clip.EndTime.ToString("F6"));

		// Notes
		writer.WriteStartElement("Notes");
		writer.WriteStartElement("KeyTracks");

		// Group notes by pitch
		var notesByPitch = clip.Notes.GroupBy(n => n.Pitch);
		foreach (var group in notesByPitch) {
			writer.WriteStartElement("KeyTrack");
			writer.WriteAttributeString("Id", group.Key.ToString());

			WriteValueElement(writer, "MidiKey", group.Key.ToString());

			writer.WriteStartElement("Notes");
			foreach (var note in group) {
				writer.WriteStartElement("MidiNoteEvent");
				writer.WriteAttributeString("Time", note.Time.ToString("F6"));
				writer.WriteAttributeString("Duration", note.Duration.ToString("F6"));
				writer.WriteAttributeString("Velocity", note.Velocity.ToString());
				writer.WriteEndElement();
			}
			writer.WriteEndElement(); // Notes

			writer.WriteEndElement(); // KeyTrack
		}

		writer.WriteEndElement(); // KeyTracks
		writer.WriteEndElement(); // Notes

		writer.WriteEndElement(); // MidiClip
		writer.WriteEndElement(); // ClipSlot
	}

	private void WriteMasterTrack(XmlWriter writer) {
		writer.WriteStartElement("MasterTrack");

		// Tempo
		writer.WriteStartElement("Tempo");
		WriteValueElement(writer, "Manual", Tempo.ToString("F6"));
		writer.WriteEndElement();

		// Time signature
		writer.WriteStartElement("TimeSignature");
		writer.WriteStartElement("TimeSignatures");
		writer.WriteStartElement("RemoteableTimeSignature");
		writer.WriteAttributeString("Id", "0");
		WriteValueElement(writer, "Numerator", TimeSignatureNumerator.ToString());
		WriteValueElement(writer, "Denominator", TimeSignatureDenominator.ToString());
		writer.WriteEndElement();
		writer.WriteEndElement();
		writer.WriteEndElement();

		writer.WriteEndElement(); // MasterTrack
	}

	private void WriteTransport(XmlWriter writer) {
		writer.WriteStartElement("Transport");
		WriteValueElement(writer, "LoopOn", "false");
		WriteValueElement(writer, "LoopStart", "0");
		WriteValueElement(writer, "LoopEnd", "16");
		WriteValueElement(writer, "CurrentTime", "0");
		writer.WriteEndElement();
	}

	private void WriteLocators(XmlWriter writer) {
		writer.WriteStartElement("Locators");
		writer.WriteEndElement();
	}

	private static void WriteValueElement(XmlWriter writer, string path, string value) {
		var parts = path.Split('/');
		for (int i = 0; i < parts.Length - 1; i++) {
			writer.WriteStartElement(parts[i]);
		}

		writer.WriteStartElement(parts[^1]);
		writer.WriteAttributeString("Value", value);
		writer.WriteEndElement();

		for (int i = 0; i < parts.Length - 1; i++) {
			writer.WriteEndElement();
		}
	}

	/// <summary>
	/// Create a default 8-track project for SNES channels.
	/// </summary>
	public static AbletonProjectGenerator CreateSnesProject(string name, double tempo = 120.0) {
		var generator = new AbletonProjectGenerator {
			ProjectName = name,
			Tempo = tempo
		};

		// Create 8 tracks for SNES channels
		string[] channelNames = ["Lead", "Counter", "Bass", "Drums", "Pad", "Arp", "FX", "Extra"];
		int[] colors = [69, 17, 25, 3, 57, 41, 49, 33]; // Ableton color indices

		for (int i = 0; i < 8; i++) {
			generator.MidiTracks.Add(new AbletonMidiTrack {
				Name = $"Ch{i + 1} - {channelNames[i]}",
				SnesChannel = i,
				Color = colors[i],
				SampleIndex = i
			});
		}

		return generator;
	}
}

/// <summary>
/// MIDI track in an Ableton project.
/// </summary>
public class AbletonMidiTrack {
	public string Name { get; set; } = "Track";
	public int SnesChannel { get; set; }
	public int Color { get; set; } = 0;
	public int SampleIndex { get; set; } = -1;
	public List<AbletonMidiClip> Clips { get; } = [];
}

/// <summary>
/// MIDI clip containing notes.
/// </summary>
public class AbletonMidiClip {
	public string Name { get; set; } = "Clip";
	public double StartTime { get; set; }
	public double EndTime { get; set; }
	public List<AbletonMidiNote> Notes { get; } = [];
}

/// <summary>
/// Single MIDI note.
/// </summary>
public record struct AbletonMidiNote(int Pitch, double Time, double Duration, int Velocity = 100);

/// <summary>
/// Audio sample for use in Simpler/Sampler.
/// </summary>
public class AbletonSample {
	public string FileName { get; set; } = "sample.wav";
	public Wav.WavFile? WavData { get; set; }
	public bool LoopEnabled { get; set; }
	public int LoopStart { get; set; }
	public int LoopEnd { get; set; }
	public int RootNote { get; set; } = 60; // Middle C
}
