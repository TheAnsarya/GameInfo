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
		rootCommand.Subcommands.Add(CreateBatchCommand());

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
				Console.WriteLine("  Ch  Vol L  Vol R  Pitch    Rate   Src  Echo  Noise");
				Console.WriteLine("  --  -----  -----  ------  ------  ---  ----  -----");

				foreach (var voice in info.Voices) {
					var rateStr = voice.SampleRate > 0 ? $"{voice.SampleRate / 1000.0:F1}kHz" : "  -  ";
					Console.WriteLine($"  {voice.Index + 1}   {voice.VolumeLeft,5}  {voice.VolumeRight,5}  ${voice.Pitch:X4}  {rateStr,6}  {voice.SourceNumber,3}  {(voice.EchoEnabled ? "Yes" : "No"),4}  {(voice.NoiseEnabled ? "Yes" : "No"),5}");
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
		var preEmphasis = new Option<bool>("--pre-emphasis", "-p") {
			Description = "Apply pre-emphasis filter for better quality",
			DefaultValueFactory = _ => true
		};

		var wavToBrrCommand = new Command("wav-to-brr", "Convert WAV file to BRR");
		wavToBrrCommand.Arguments.Add(wavInput);
		wavToBrrCommand.Arguments.Add(wavOutput);
		wavToBrrCommand.Options.Add(wavSampleRate);
		wavToBrrCommand.Options.Add(loopStart);
		wavToBrrCommand.Options.Add(preEmphasis);

		wavToBrrCommand.SetAction((ParseResult parseResult) => {
			var input = parseResult.GetValue(wavInput)!;
			var output = parseResult.GetValue(wavOutput)!;
			var sampleRate = parseResult.GetValue(wavSampleRate);
			var loop = parseResult.GetValue(loopStart);
			var usePreEmphasis = parseResult.GetValue(preEmphasis);

			if (!input.Exists) {
				Console.Error.WriteLine($"Error: File not found: {input.FullName}");
				return 1;
			}

			try {
				SpcAbletonWorkflow.WavToBrr(input.FullName, output.FullName, sampleRate, loop, usePreEmphasis);
				Console.WriteLine($"Converted: {input.Name} -> {output.Name}");

				var brrSize = new FileInfo(output.FullName).Length;
				var wavSize = input.Length;
				var ratio = (double)wavSize / brrSize;
				Console.WriteLine($"Compression: {wavSize} -> {brrSize} bytes ({ratio:F2}:1)");
				if (usePreEmphasis) {
					Console.WriteLine("Pre-emphasis: enabled (for better quality)");
				}
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

	private static Command CreateBatchCommand() {
		var command = new Command("batch", "Process multiple SPC files at once");

		// Batch extract subcommand
		var batchExtractInputArg = new Argument<DirectoryInfo>("input-dir") {
			Description = "Directory containing SPC files"
		};
		var batchExtractOutputOption = new Option<DirectoryInfo>("--output", "-o") {
			Description = "Output directory (default: same as input)",
			DefaultValueFactory = _ => null!
		};
		var batchExtractFormatOption = new Option<string>("--format", "-f") {
			Description = "Output format: wav or brr",
			DefaultValueFactory = _ => "wav"
		};
		var batchExtractRecursiveOption = new Option<bool>("--recursive", "-r") {
			Description = "Search subdirectories",
			DefaultValueFactory = _ => false
		};

		var batchExtractCommand = new Command("extract", "Extract samples from all SPC files in a directory");
		batchExtractCommand.Arguments.Add(batchExtractInputArg);
		batchExtractCommand.Options.Add(batchExtractOutputOption);
		batchExtractCommand.Options.Add(batchExtractFormatOption);
		batchExtractCommand.Options.Add(batchExtractRecursiveOption);

		batchExtractCommand.SetAction((ParseResult parseResult) => {
			var inputDir = parseResult.GetValue(batchExtractInputArg)!;
			var outputDir = parseResult.GetValue(batchExtractOutputOption);
			var format = parseResult.GetValue(batchExtractFormatOption)!;
			var recursive = parseResult.GetValue(batchExtractRecursiveOption);

			if (!inputDir.Exists) {
				Console.Error.WriteLine($"Error: Directory not found: {inputDir.FullName}");
				return 1;
			}

			var searchOption = recursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
			var spcFiles = Directory.GetFiles(inputDir.FullName, "*.spc", searchOption);

			if (spcFiles.Length == 0) {
				Console.WriteLine("No SPC files found.");
				return 0;
			}

			Console.WriteLine($"Found {spcFiles.Length} SPC file(s)");
			int successCount = 0;
			int totalSamples = 0;

			foreach (var spcPath in spcFiles) {
				try {
					var spcName = Path.GetFileNameWithoutExtension(spcPath);
					var targetDir = outputDir?.FullName ?? Path.GetDirectoryName(spcPath)!;
					var spcOutputDir = Path.Combine(targetDir, spcName);
					Directory.CreateDirectory(spcOutputDir);

					List<string> files;
					if (format.Equals("brr", StringComparison.OrdinalIgnoreCase)) {
						files = SpcAbletonWorkflow.ExtractSamplesToBrr(spcPath, spcOutputDir);
					} else {
						files = SpcAbletonWorkflow.ExtractSamplesToWav(spcPath, spcOutputDir);
					}

					Console.WriteLine($"  {spcName}: {files.Count} samples");
					successCount++;
					totalSamples += files.Count;
				} catch (Exception ex) {
					Console.Error.WriteLine($"  Error processing {Path.GetFileName(spcPath)}: {ex.Message}");
				}
			}

			Console.WriteLine();
			Console.WriteLine($"Processed {successCount}/{spcFiles.Length} files, extracted {totalSamples} samples total");
			return successCount == spcFiles.Length ? 0 : 1;
		});

		// Batch info subcommand
		var batchInfoInputArg = new Argument<DirectoryInfo>("input-dir") {
			Description = "Directory containing SPC files"
		};
		var batchInfoRecursiveOption = new Option<bool>("--recursive", "-r") {
			Description = "Search subdirectories",
			DefaultValueFactory = _ => false
		};
		var batchInfoCsvOption = new Option<FileInfo?>("--csv") {
			Description = "Export to CSV file",
			DefaultValueFactory = _ => null
		};

		var batchInfoCommand = new Command("info", "Get info from all SPC files in a directory");
		batchInfoCommand.Arguments.Add(batchInfoInputArg);
		batchInfoCommand.Options.Add(batchInfoRecursiveOption);
		batchInfoCommand.Options.Add(batchInfoCsvOption);

		batchInfoCommand.SetAction((ParseResult parseResult) => {
			var inputDir = parseResult.GetValue(batchInfoInputArg)!;
			var recursive = parseResult.GetValue(batchInfoRecursiveOption);
			var csvFile = parseResult.GetValue(batchInfoCsvOption);

			if (!inputDir.Exists) {
				Console.Error.WriteLine($"Error: Directory not found: {inputDir.FullName}");
				return 1;
			}

			var searchOption = recursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
			var spcFiles = Directory.GetFiles(inputDir.FullName, "*.spc", searchOption);

			if (spcFiles.Length == 0) {
				Console.WriteLine("No SPC files found.");
				return 0;
			}

			var results = new List<(string File, SpcInfo? Info, string? Error)>();

			foreach (var spcPath in spcFiles) {
				try {
					var info = SpcAbletonWorkflow.GetSpcInfo(spcPath);
					results.Add((spcPath, info, null));
				} catch (Exception ex) {
					results.Add((spcPath, null, ex.Message));
				}
			}

			// Output to console
			Console.WriteLine($"{"File",-40} {"Title",-30} {"Game",-25} {"Samples",8}");
			Console.WriteLine(new string('-', 105));

			foreach (var (file, info, error) in results) {
				var filename = Path.GetFileName(file);
				if (info != null) {
					Console.WriteLine($"{TruncateString(filename, 40),-40} {TruncateString(info.SongTitle, 30),-30} {TruncateString(info.GameTitle, 25),-25} {info.SampleCount,8}");
				} else {
					Console.WriteLine($"{TruncateString(filename, 40),-40} ERROR: {error}");
				}
			}

			// Export to CSV if requested
			if (csvFile != null) {
				using var writer = new StreamWriter(csvFile.FullName);
				writer.WriteLine("File,Title,Game,Artist,Samples,Length,Date");
				foreach (var (file, info, error) in results) {
					if (info != null) {
						writer.WriteLine($"\"{Path.GetFileName(file)}\",\"{EscapeCsv(info.SongTitle)}\",\"{EscapeCsv(info.GameTitle)}\",\"{EscapeCsv(info.Artist)}\",{info.SampleCount},{info.SongLengthSeconds},\"{EscapeCsv(info.DumpDate)}\"");
					}
				}
				Console.WriteLine();
				Console.WriteLine($"Exported to: {csvFile.FullName}");
			}

			Console.WriteLine();
			Console.WriteLine($"Total: {results.Count} files, {results.Count(r => r.Error == null)} successful");
			return results.All(r => r.Error == null) ? 0 : 1;
		});

		command.Subcommands.Add(batchExtractCommand);
		command.Subcommands.Add(batchInfoCommand);

		return command;
	}

	private static string TruncateString(string value, int maxLength) {
		if (string.IsNullOrEmpty(value)) return "";
		return value.Length <= maxLength ? value : value[..(maxLength - 3)] + "...";
	}

	private static string EscapeCsv(string value) {
		if (string.IsNullOrEmpty(value)) return "";
		return value.Replace("\"", "\"\"");
	}
}
