using System.CommandLine;
using GameInfoTools.Audio;
using GameInfoTools.Audio.Brr;
using GameInfoTools.Audio.Spc;

namespace GameInfoTools.Audio.Cli;

/// <summary>
/// SPC Tool - Command-line interface for SNES audio manipulation.
/// </summary>
public class Program {
	public static int Main(string[] args) {
		var rootCommand = new RootCommand("SPC Tool - SNES audio manipulation utility");
		rootCommand.Subcommands.Add(CreateInfoCommand());
		rootCommand.Subcommands.Add(CreateExtractCommand());
		rootCommand.Subcommands.Add(CreateConvertCommand());
		rootCommand.Subcommands.Add(CreateAbletonCommand());

		return rootCommand.Parse(args).Invoke();
	}

	private static Command CreateInfoCommand() {
		var spcArg = new Argument<FileInfo>("spc-file") {
			Description = "Path to the SPC file"
		};

		var command = new Command("info", "Display information about an SPC file");
		command.Arguments.Add(spcArg);

		command.SetAction((ParseResult parseResult) => {
			var spcFile = parseResult.GetValue(spcArg)!;
			if (!spcFile.Exists) {
				Console.Error.WriteLine($"Error: File not found: {spcFile.FullName}");
				return 1;
			}

			try {
				var info = SpcAbletonWorkflow.GetSpcInfo(spcFile.FullName);

				Console.WriteLine($"SPC File: {spcFile.Name}");
				Console.WriteLine(new string('=', 50));
				Console.WriteLine($"Song:     {info.SongTitle}");
				Console.WriteLine($"Game:     {info.GameTitle}");
				Console.WriteLine($"Artist:   {info.Artist}");
				Console.WriteLine($"Dumper:   {info.DumperName}");
				Console.WriteLine($"Date:     {info.DumpDate}");
				Console.WriteLine($"Length:   {info.SongLengthSeconds}s (fade: {info.FadeLengthMs}ms)");
				Console.WriteLine($"Comments: {info.Comments}");
				Console.WriteLine();
				Console.WriteLine($"Samples:  {info.SampleCount}");
				Console.WriteLine($"Dir Addr: ${info.DirectoryAddress:X4}");
				Console.WriteLine();
				Console.WriteLine("Voice Configuration:");
				Console.WriteLine("  Ch  Vol L  Vol R  Pitch   Src  Echo  Noise");
				Console.WriteLine("  --  -----  -----  ------  ---  ----  -----");

				foreach (var voice in info.Voices) {
					Console.WriteLine($"  {voice.Index + 1}   {voice.VolumeLeft,5}  {voice.VolumeRight,5}  ${voice.Pitch:X4}  {voice.SourceNumber,3}  {(voice.EchoEnabled ? "Yes" : "No"),4}  {(voice.NoiseEnabled ? "Yes" : "No"),5}");
				}
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error reading SPC file: {ex.Message}");
				return 1;
			}
		});

		return command;
	}

	private static Command CreateExtractCommand() {
		var spcArg = new Argument<FileInfo>("spc-file") {
			Description = "Path to the SPC file"
		};
		var outputOption = new Option<DirectoryInfo>("--output", "-o") {
			Description = "Output directory for extracted files",
			DefaultValueFactory = _ => new DirectoryInfo(".")
		};
		var formatOption = new Option<string>("--format", "-f") {
			Description = "Output format: wav or brr",
			DefaultValueFactory = _ => "wav"
		};

		var command = new Command("extract", "Extract samples from an SPC file");
		command.Arguments.Add(spcArg);
		command.Options.Add(outputOption);
		command.Options.Add(formatOption);

		command.SetAction((ParseResult parseResult) => {
			var spcFile = parseResult.GetValue(spcArg)!;
			var output = parseResult.GetValue(outputOption)!;
			var format = parseResult.GetValue(formatOption)!;

			if (!spcFile.Exists) {
				Console.Error.WriteLine($"Error: File not found: {spcFile.FullName}");
				return 1;
			}

			try {
				Console.WriteLine($"Extracting samples from: {spcFile.Name}");

				List<string> files;
				if (format.Equals("brr", StringComparison.OrdinalIgnoreCase)) {
					files = SpcAbletonWorkflow.ExtractSamplesToBrr(spcFile.FullName, output.FullName);
					Console.WriteLine($"Extracted {files.Count} BRR samples to {output.FullName}");
				} else {
					files = SpcAbletonWorkflow.ExtractSamplesToWav(spcFile.FullName, output.FullName);
					Console.WriteLine($"Extracted {files.Count} WAV samples to {output.FullName}");
				}

				foreach (var file in files) {
					Console.WriteLine($"  - {Path.GetFileName(file)}");
				}
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error extracting samples: {ex.Message}");
				return 1;
			}
		});

		return command;
	}

	private static Command CreateConvertCommand() {
		var convertCommand = new Command("convert", "Convert between audio formats");

		// BRR to WAV
		var brrInput = new Argument<FileInfo>("input") { Description = "Input BRR file" };
		var brrOutput = new Argument<FileInfo>("output") { Description = "Output WAV file" };
		var brrSampleRate = new Option<int>("--sample-rate", "-r") {
			Description = "Sample rate in Hz",
			DefaultValueFactory = _ => 32000
		};

		var brrToWavCommand = new Command("brr-to-wav", "Convert BRR file to WAV");
		brrToWavCommand.Arguments.Add(brrInput);
		brrToWavCommand.Arguments.Add(brrOutput);
		brrToWavCommand.Options.Add(brrSampleRate);

		brrToWavCommand.SetAction((ParseResult parseResult) => {
			var input = parseResult.GetValue(brrInput)!;
			var output = parseResult.GetValue(brrOutput)!;
			var sampleRate = parseResult.GetValue(brrSampleRate);

			if (!input.Exists) {
				Console.Error.WriteLine($"Error: File not found: {input.FullName}");
				return 1;
			}

			try {
				SpcAbletonWorkflow.BrrToWav(input.FullName, output.FullName, sampleRate);
				Console.WriteLine($"Converted: {input.Name} -> {output.Name}");
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error converting: {ex.Message}");
				return 1;
			}
		});

		// WAV to BRR
		var wavInput = new Argument<FileInfo>("input") { Description = "Input WAV file" };
		var wavOutput = new Argument<FileInfo>("output") { Description = "Output BRR file" };
		var wavSampleRate = new Option<int>("--sample-rate", "-r") {
			Description = "Target sample rate in Hz",
			DefaultValueFactory = _ => 16000
		};
		var loopStart = new Option<int>("--loop-start", "-l") {
			Description = "Loop start sample (-1 for no loop)",
			DefaultValueFactory = _ => -1
		};

		var wavToBrrCommand = new Command("wav-to-brr", "Convert WAV file to BRR");
		wavToBrrCommand.Arguments.Add(wavInput);
		wavToBrrCommand.Arguments.Add(wavOutput);
		wavToBrrCommand.Options.Add(wavSampleRate);
		wavToBrrCommand.Options.Add(loopStart);

		wavToBrrCommand.SetAction((ParseResult parseResult) => {
			var input = parseResult.GetValue(wavInput)!;
			var output = parseResult.GetValue(wavOutput)!;
			var sampleRate = parseResult.GetValue(wavSampleRate);
			var loop = parseResult.GetValue(loopStart);

			if (!input.Exists) {
				Console.Error.WriteLine($"Error: File not found: {input.FullName}");
				return 1;
			}

			try {
				SpcAbletonWorkflow.WavToBrr(input.FullName, output.FullName, sampleRate, loop);
				Console.WriteLine($"Converted: {input.Name} -> {output.Name}");

				var brrSize = new FileInfo(output.FullName).Length;
				var wavSize = input.Length;
				var ratio = (double)wavSize / brrSize;
				Console.WriteLine($"Compression: {wavSize} -> {brrSize} bytes ({ratio:F2}:1)");
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error converting: {ex.Message}");
				return 1;
			}
		});

		convertCommand.Subcommands.Add(brrToWavCommand);
		convertCommand.Subcommands.Add(wavToBrrCommand);

		return convertCommand;
	}

	private static Command CreateAbletonCommand() {
		var spcArg = new Argument<FileInfo>("spc-file") {
			Description = "Path to the SPC file"
		};
		var outputOption = new Option<DirectoryInfo>("--output", "-o") {
			Description = "Output directory for Ableton project",
			DefaultValueFactory = _ => new DirectoryInfo(".")
		};
		var nameOption = new Option<string?>("--name", "-n") {
			Description = "Project name (defaults to SPC filename)"
		};

		var command = new Command("ableton", "Generate an Ableton Live project from an SPC file");
		command.Arguments.Add(spcArg);
		command.Options.Add(outputOption);
		command.Options.Add(nameOption);

		command.SetAction((ParseResult parseResult) => {
			var spcFile = parseResult.GetValue(spcArg)!;
			var output = parseResult.GetValue(outputOption)!;
			var name = parseResult.GetValue(nameOption);

			if (!spcFile.Exists) {
				Console.Error.WriteLine($"Error: File not found: {spcFile.FullName}");
				return 1;
			}

			try {
				Console.WriteLine($"Converting SPC to Ableton project: {spcFile.Name}");

				var alsPath = SpcAbletonWorkflow.SpcToAbleton(spcFile.FullName, output.FullName, name);

				Console.WriteLine($"Created Ableton project: {alsPath}");
				Console.WriteLine($"Samples exported to: {Path.Combine(output.FullName, "Samples", "Processed")}");
				Console.WriteLine();
				Console.WriteLine("Open the .als file in Ableton Live 11 or later.");
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error creating Ableton project: {ex.Message}");
				return 1;
			}
		});

		return command;
	}
}
