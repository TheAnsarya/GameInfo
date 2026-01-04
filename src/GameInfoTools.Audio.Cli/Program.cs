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
		rootCommand.Subcommands.Add(CreateBundleCommand());
		rootCommand.Subcommands.Add(CreateBuildCommand());
		rootCommand.Subcommands.Add(CreateAnalyzeCommand());
		rootCommand.Subcommands.Add(CreateValidateCommand());
		rootCommand.Subcommands.Add(CreateRenderCommand());

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
				Console.WriteLine("  Ch  Vol L  Vol R  Pitch    Rate   Src  Echo  Noise  ADSR");
				Console.WriteLine("  --  -----  -----  ------  ------  ---  ----  -----  ----------------");

				foreach (var voice in info.Voices) {
					var rateStr = voice.SampleRate > 0 ? $"{voice.SampleRate / 1000.0:F1}kHz" : "  -  ";
					var adsrStr = voice.AdsrEnvelope.Enabled
						? $"A:{voice.AdsrEnvelope.AttackRate} D:{voice.AdsrEnvelope.DecayRate} S:{voice.AdsrEnvelope.SustainLevel} R:{voice.AdsrEnvelope.ReleaseRate}"
						: "GAIN mode";
					Console.WriteLine($"  {voice.Index + 1}   {voice.VolumeLeft,5}  {voice.VolumeRight,5}  ${voice.Pitch:X4}  {rateStr,6}  {voice.SourceNumber,3}  {(voice.EchoEnabled ? "Yes" : "No"),4}  {(voice.NoiseEnabled ? "Yes" : "No"),5}  {adsrStr}");
				}

				// Display echo configuration
				if (info.Echo != null) {
					Console.WriteLine();
					Console.WriteLine("Echo Configuration:");
					Console.WriteLine($"  Delay:    {info.Echo.DelayMs}ms ({info.Echo.DelaySamples} samples)");
					Console.WriteLine($"  Volume:   L={info.Echo.VolumeLeft}, R={info.Echo.VolumeRight}");
					Console.WriteLine($"  Feedback: {info.Echo.Feedback} ({info.Echo.FeedbackDescription})");
					Console.WriteLine($"  Filter:   {info.Echo.FilterType}");
					Console.WriteLine($"  Buffer:   ${info.Echo.BufferAddress:X4} ({info.Echo.BufferSize} bytes)");
					Console.WriteLine($"  FIR:      [{string.Join(", ", info.Echo.FirCoefficients)}]");
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

	private static Command CreateBundleCommand() {
		var command = new Command("bundle", "Create and manage music mod bundles");

		// Create subcommand
		var createTitleArg = new Argument<string>("title") {
			Description = "Mod title"
		};
		var createAuthorArg = new Argument<string>("author") {
			Description = "Mod author"
		};
		var createModifiedSpcOption = new Option<FileInfo>("--modified", "-m") {
			Description = "Modified SPC file",
			Required = true
		};
		var createOriginalSpcOption = new Option<FileInfo?>("--original", "-o") {
			Description = "Original SPC file (for reference)"
		};
		var createAbletonOption = new Option<FileInfo?>("--ableton", "-a") {
			Description = "Ableton project file"
		};
		var createOutputOption = new Option<FileInfo?>("--output") {
			Description = "Output bundle path (default: title.spcmod)"
		};
		var createGameOption = new Option<string?>("--game", "-g") {
			Description = "Game title"
		};
		var createTrackOption = new Option<string?>("--track", "-t") {
			Description = "Original track name"
		};
		var createDescOption = new Option<string?>("--description", "-d") {
			Description = "Mod description"
		};

		var createCommand = new Command("create", "Create a new music mod bundle");
		createCommand.Arguments.Add(createTitleArg);
		createCommand.Arguments.Add(createAuthorArg);
		createCommand.Options.Add(createModifiedSpcOption);
		createCommand.Options.Add(createOriginalSpcOption);
		createCommand.Options.Add(createAbletonOption);
		createCommand.Options.Add(createOutputOption);
		createCommand.Options.Add(createGameOption);
		createCommand.Options.Add(createTrackOption);
		createCommand.Options.Add(createDescOption);

		createCommand.SetAction((ParseResult parseResult) => {
			var title = parseResult.GetValue(createTitleArg)!;
			var author = parseResult.GetValue(createAuthorArg)!;
			var modifiedSpc = parseResult.GetValue(createModifiedSpcOption)!;
			var originalSpc = parseResult.GetValue(createOriginalSpcOption);
			var ableton = parseResult.GetValue(createAbletonOption);
			var output = parseResult.GetValue(createOutputOption);
			var game = parseResult.GetValue(createGameOption);
			var track = parseResult.GetValue(createTrackOption);
			var desc = parseResult.GetValue(createDescOption);

			if (!modifiedSpc.Exists) {
				Console.Error.WriteLine($"Error: Modified SPC not found: {modifiedSpc.FullName}");
				return 1;
			}

			try {
				var bundle = MusicModBundle.Create(title, author);
				bundle.SetModifiedSpc(modifiedSpc.FullName);

				if (originalSpc?.Exists == true) {
					bundle.SetOriginalSpc(originalSpc.FullName);
				}

				if (ableton?.Exists == true) {
					bundle.SetAbletonProject(ableton.FullName);
				}

				if (game != null) bundle.Manifest.GameTitle = game;
				if (track != null) bundle.Manifest.OriginalTrack = track;
				if (desc != null) bundle.Manifest.Description = desc;

				// Validate
				var validation = bundle.Validate();
				if (!validation.IsValid) {
					Console.Error.WriteLine("Bundle validation failed:");
					Console.Error.WriteLine(validation);
					return 1;
				}

				// Save
				var outputPath = output?.FullName ?? $"{SanitizeFilename(title)}.spcmod";
				bundle.Save(outputPath);

				Console.WriteLine($"Created bundle: {outputPath}");
				Console.WriteLine(bundle.GetSummary());
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error creating bundle: {ex.Message}");
				return 1;
			}
		});

		// Info subcommand
		var infoFileArg = new Argument<FileInfo>("bundle") {
			Description = "Bundle file path"
		};

		var infoCommand = new Command("info", "Display bundle information");
		infoCommand.Arguments.Add(infoFileArg);

		infoCommand.SetAction((ParseResult parseResult) => {
			var bundleFile = parseResult.GetValue(infoFileArg)!;

			if (!bundleFile.Exists) {
				Console.Error.WriteLine($"Error: Bundle not found: {bundleFile.FullName}");
				return 1;
			}

			try {
				var bundle = MusicModBundle.Load(bundleFile.FullName);
				Console.WriteLine(bundle.GetSummary());

				var validation = bundle.Validate();
				Console.WriteLine();
				Console.WriteLine("Validation:");
				Console.WriteLine(validation);
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error reading bundle: {ex.Message}");
				return 1;
			}
		});

		// Extract subcommand
		var extractFileArg = new Argument<FileInfo>("bundle") {
			Description = "Bundle file path"
		};
		var extractOutputOption = new Option<DirectoryInfo>("--output", "-o") {
			Description = "Output directory",
			DefaultValueFactory = _ => new DirectoryInfo(".")
		};

		var extractCommand = new Command("extract", "Extract contents from a bundle");
		extractCommand.Arguments.Add(extractFileArg);
		extractCommand.Options.Add(extractOutputOption);

		extractCommand.SetAction((ParseResult parseResult) => {
			var bundleFile = parseResult.GetValue(extractFileArg)!;
			var outputDir = parseResult.GetValue(extractOutputOption)!;

			if (!bundleFile.Exists) {
				Console.Error.WriteLine($"Error: Bundle not found: {bundleFile.FullName}");
				return 1;
			}

			try {
				var bundle = MusicModBundle.Load(bundleFile.FullName);
				outputDir.Create();

				int fileCount = 0;

				if (bundle.ModifiedSpc != null) {
					var path = Path.Combine(outputDir.FullName, "modified.spc");
					File.WriteAllBytes(path, bundle.ModifiedSpc);
					Console.WriteLine($"Extracted: modified.spc");
					fileCount++;
				}

				if (bundle.OriginalSpc != null) {
					var path = Path.Combine(outputDir.FullName, "original.spc");
					File.WriteAllBytes(path, bundle.OriginalSpc);
					Console.WriteLine($"Extracted: original.spc");
					fileCount++;
				}

				if (bundle.AbletonProject != null) {
					var path = Path.Combine(outputDir.FullName, "project.als");
					File.WriteAllBytes(path, bundle.AbletonProject);
					Console.WriteLine($"Extracted: project.als");
					fileCount++;
				}

				foreach (var (name, data) in bundle.AdditionalFiles) {
					var path = Path.Combine(outputDir.FullName, name);
					Directory.CreateDirectory(Path.GetDirectoryName(path)!);
					File.WriteAllBytes(path, data);
					Console.WriteLine($"Extracted: {name}");
					fileCount++;
				}

				Console.WriteLine($"\nExtracted {fileCount} files to {outputDir.FullName}");
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error extracting bundle: {ex.Message}");
				return 1;
			}
		});

		command.Subcommands.Add(createCommand);
		command.Subcommands.Add(infoCommand);
		command.Subcommands.Add(extractCommand);

		return command;
	}

	private static Command CreateBuildCommand() {
		var command = new Command("build", "Build SPC files from components");

		// Build from samples
		var samplesArg = new Argument<DirectoryInfo>("samples-dir") {
			Description = "Directory containing BRR or WAV sample files"
		};
		var outputOption = new Option<FileInfo>("--output", "-o") {
			Description = "Output SPC file path",
			Required = true
		};
		var titleOption = new Option<string?>("--title", "-t") {
			Description = "Song title"
		};
		var gameOption = new Option<string?>("--game", "-g") {
			Description = "Game title"
		};
		var artistOption = new Option<string?>("--artist", "-a") {
			Description = "Artist name"
		};

		command.Arguments.Add(samplesArg);
		command.Options.Add(outputOption);
		command.Options.Add(titleOption);
		command.Options.Add(gameOption);
		command.Options.Add(artistOption);

		command.SetAction((ParseResult parseResult) => {
			var samplesDir = parseResult.GetValue(samplesArg)!;
			var output = parseResult.GetValue(outputOption)!;
			var title = parseResult.GetValue(titleOption);
			var game = parseResult.GetValue(gameOption);
			var artist = parseResult.GetValue(artistOption);

			if (!samplesDir.Exists) {
				Console.Error.WriteLine($"Error: Directory not found: {samplesDir.FullName}");
				return 1;
			}

			try {
				var builder = new SpcBuilder();

				// Set metadata
				builder.SetMetadata(
					songTitle: title,
					gameTitle: game,
					artistName: artist
				);

				// Find and add samples
				var brrFiles = Directory.GetFiles(samplesDir.FullName, "*.brr");
				var wavFiles = Directory.GetFiles(samplesDir.FullName, "*.wav");

				if (brrFiles.Length == 0 && wavFiles.Length == 0) {
					Console.Error.WriteLine("Error: No sample files found (*.brr or *.wav)");
					return 1;
				}

				Console.WriteLine($"Loading samples from: {samplesDir.FullName}");

				// Add BRR files
				foreach (var brrFile in brrFiles.OrderBy(f => f)) {
					var name = Path.GetFileNameWithoutExtension(brrFile);
					var data = File.ReadAllBytes(brrFile);
					var index = builder.AddSample(data, name: name);
					Console.WriteLine($"  [{index:D2}] {name} ({data.Length} bytes)");
				}

				// Add WAV files (encode to BRR)
				foreach (var wavFile in wavFiles.OrderBy(f => f)) {
					var name = Path.GetFileNameWithoutExtension(wavFile);
					var data = File.ReadAllBytes(wavFile);
					var (index, snr) = builder.AddWavSample(data, -1, true, name);
					Console.WriteLine($"  [{index:D2}] {name} (WAV->BRR, SNR: {snr:F1} dB)");
				}

				// Show memory analysis
				Console.WriteLine();
				Console.WriteLine(builder.GetMemoryAnalysis());

				// Validate
				var validation = builder.Validate();
				if (!validation.IsValid) {
					Console.Error.WriteLine("Build validation failed:");
					Console.Error.WriteLine(validation);
					return 1;
				}

				// Build and save
				var spc = builder.Build();
				spc.Save(output.FullName);

				Console.WriteLine($"Built SPC: {output.FullName}");
				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error building SPC: {ex.Message}");
				return 1;
			}
		});

		return command;
	}

	private static Command CreateAnalyzeCommand() {
		var command = new Command("analyze", "Analyze SPC file memory and structure");

		var spcArg = new Argument<FileInfo>("spc-file") {
			Description = "Path to the SPC file"
		};

		command.Arguments.Add(spcArg);

		command.SetAction((ParseResult parseResult) => {
			var spcFile = parseResult.GetValue(spcArg)!;

			if (!spcFile.Exists) {
				Console.Error.WriteLine($"Error: File not found: {spcFile.FullName}");
				return 1;
			}

			try {
				var spc = SpcFile.Load(spcFile.FullName);

				Console.WriteLine($"=== SPC Analysis: {spcFile.Name} ===");
				Console.WriteLine();

				// Header info
				Console.WriteLine("Header:");
				Console.WriteLine($"  Song:   {spc.Header.SongTitle}");
				Console.WriteLine($"  Game:   {spc.Header.GameTitle}");
				Console.WriteLine($"  Artist: {spc.Header.Artist}");
				Console.WriteLine();

				// Sample directory analysis
				Console.WriteLine("Sample Directory:");
				Console.WriteLine($"  Address: ${spc.Dsp.DirectoryAddress:X4}");
				Console.WriteLine($"  Count:   {spc.SampleDirectory.Count}");
				Console.WriteLine();

				Console.WriteLine("  Idx  Start   Loop    Size   Blocks   Samples  Flags");
				Console.WriteLine("  ---  ------  ------  ------  ------  --------  -----");

				var samples = spc.ExtractSamples();
				int totalSize = 0;

				foreach (var sample in samples) {
					var flags = "";
					if (sample.HasLoop) flags += "L";
					if (sample.Data.Length > 0 && (sample.Data[^1] & 0x01) != 0) flags += "E";

					Console.WriteLine($"  {sample.Index,3}  ${sample.StartAddress:X4}  ${sample.LoopAddress:X4}  {sample.Size,6}  {sample.BlockCount,6}  {sample.SampleCount,8}  {flags}");
					totalSize += sample.Size;
				}

				Console.WriteLine();
				Console.WriteLine($"  Total sample data: {totalSize:N0} bytes");
				Console.WriteLine($"  Directory size:    {samples.Count * 4} bytes");
				Console.WriteLine($"  RAM used:          {totalSize + samples.Count * 4:N0} bytes ({(totalSize + samples.Count * 4) * 100.0 / SpcFile.RamSize:F1}%)");
				Console.WriteLine();

				// DSP state analysis
				Console.WriteLine("DSP State:");
				Console.WriteLine($"  Main Volume: L={spc.Dsp.MainVolumeLeft}, R={spc.Dsp.MainVolumeRight}");
				Console.WriteLine($"  Echo Volume: L={spc.Dsp.EchoVolumeLeft}, R={spc.Dsp.EchoVolumeRight}");
				Console.WriteLine($"  Key On:      {Convert.ToString(spc.Dsp.KeyOn, 2).PadLeft(8, '0')}");
				Console.WriteLine($"  Key Off:     {Convert.ToString(spc.Dsp.KeyOff, 2).PadLeft(8, '0')}");
				Console.WriteLine($"  Echo Enable: {Convert.ToString(spc.Dsp.EchoEnable, 2).PadLeft(8, '0')}");
				Console.WriteLine($"  Noise Enable:{Convert.ToString(spc.Dsp.NoiseEnable, 2).PadLeft(8, '0')}");
				Console.WriteLine();

				// Echo analysis
				var echo = spc.GetEchoConfig();
				Console.WriteLine("Echo Configuration:");
				Console.WriteLine($"  Delay:    {echo.DelayMs}ms");
				Console.WriteLine($"  Feedback: {echo.Feedback} ({echo.FeedbackDescription})");
				Console.WriteLine($"  Buffer:   ${echo.BufferAddress:X4} ({echo.BufferSize} bytes)");
				Console.WriteLine($"  Filter:   {echo.FilterType}");

				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error analyzing SPC: {ex.Message}");
				return 1;
			}
		});

		return command;
	}

	private static Command CreateValidateCommand() {
		var spcArg = new Argument<FileInfo>("spc-file") {
			Description = "Path to the SPC file to validate"
		};

		var strictOption = new Option<bool>("--strict") {
			Description = "Treat warnings as errors",
			DefaultValueFactory = _ => false
		};

		var jsonOption = new Option<bool>("--json") {
			Description = "Output results as JSON",
			DefaultValueFactory = _ => false
		};

		var command = new Command("validate", "Validate an SPC file for correctness") {
			spcArg,
			strictOption,
			jsonOption
		};

		command.SetAction((ParseResult parseResult) => {
			var spcFile = parseResult.GetValue(spcArg)!;
			var strict = parseResult.GetValue(strictOption);
			var json = parseResult.GetValue(jsonOption);

			if (!spcFile.Exists) {
				Console.Error.WriteLine($"Error: File not found: {spcFile.FullName}");
				return 1;
			}

			try {
				var spc = SpcFile.Load(spcFile.FullName);
				var validator = new SpcValidator(spc);
				var report = validator.Validate();

				if (json) {
					OutputValidationJson(report, spcFile.Name);
				} else {
					Console.WriteLine($"Validating: {spcFile.Name}");
					Console.WriteLine(new string('=', 50));
					Console.WriteLine(report.ToString());
				}

				bool failed = !report.IsValid || (strict && report.WarningCount > 0);
				return failed ? 1 : 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error validating SPC: {ex.Message}");
				return 1;
			}
		});

		return command;
	}

	private static void OutputValidationJson(SpcValidationReport report, string filename) {
		Console.WriteLine("{");
		Console.WriteLine($"  \"file\": \"{filename}\",");
		Console.WriteLine($"  \"valid\": {report.IsValid.ToString().ToLowerInvariant()},");
		Console.WriteLine($"  \"errors\": {report.ErrorCount},");
		Console.WriteLine($"  \"warnings\": {report.WarningCount},");
		Console.WriteLine($"  \"info\": {report.InfoCount},");
		Console.WriteLine("  \"issues\": [");

		var issues = report.Issues.ToList();
		for (int i = 0; i < issues.Count; i++) {
			var issue = issues[i];
			var comma = i < issues.Count - 1 ? "," : "";
			Console.WriteLine($"    {{\"severity\": \"{issue.Severity}\", \"code\": \"{issue.Code}\", \"message\": \"{EscapeJson(issue.Message)}\"}}{comma}");
		}

		Console.WriteLine("  ]");
		Console.WriteLine("}");
	}

	private static string EscapeJson(string s) {
		return s.Replace("\\", "\\\\")
			.Replace("\"", "\\\"")
			.Replace("\n", "\\n")
			.Replace("\r", "\\r")
			.Replace("\t", "\\t");
	}

	private static Command CreateRenderCommand() {
		var spcArg = new Argument<FileInfo>("spc-file") {
			Description = "Path to the SPC file to render"
		};

		var outputOption = new Option<FileInfo>("--output", "-o") {
			Description = "Output WAV file",
			DefaultValueFactory = _ => new FileInfo("output.wav")
		};

		var durationOption = new Option<double>("--duration", "-d") {
			Description = "Duration in seconds",
			DefaultValueFactory = _ => 5.0
		};

		var sampleRateOption = new Option<int>("--rate", "-r") {
			Description = "Output sample rate",
			DefaultValueFactory = _ => 32000
		};

		var sampleOption = new Option<int?>("--sample", "-s") {
			Description = "Render only this sample number"
		};

		var command = new Command("render", "Render SPC audio to WAV file") {
			spcArg,
			outputOption,
			durationOption,
			sampleRateOption,
			sampleOption
		};

		command.SetAction((ParseResult parseResult) => {
			var spcFile = parseResult.GetValue(spcArg)!;
			var output = parseResult.GetValue(outputOption)!;
			var duration = parseResult.GetValue(durationOption);
			var sampleRate = parseResult.GetValue(sampleRateOption);
			var sampleNumber = parseResult.GetValue(sampleOption);

			if (!spcFile.Exists) {
				Console.Error.WriteLine($"Error: File not found: {spcFile.FullName}");
				return 1;
			}

			try {
				var spc = SpcFile.Load(spcFile.FullName);
				var renderer = new SpcRenderer(spc, sampleRate);

				Console.WriteLine($"Rendering: {spcFile.Name}");

				short[] samples;
				int channels;

				if (sampleNumber.HasValue) {
					Console.WriteLine($"Sample: {sampleNumber.Value}");
					samples = renderer.RenderSample(sampleNumber.Value, 4096, duration);
					channels = 1;
				} else {
					var info = renderer.GetRenderInfo();
					Console.WriteLine($"Active voices: {info.ActiveVoices}");
					Console.WriteLine($"Sample data: {info.TotalSampleDataBytes} bytes");
					samples = renderer.RenderStatic(duration);
					channels = 2;
				}

				Console.WriteLine($"Duration: {duration}s");
				Console.WriteLine($"Sample rate: {sampleRate} Hz");

				// Convert to bytes and save as WAV
				var wavData = new byte[44 + samples.Length * 2];
				WriteWavHeader(wavData, samples.Length, sampleRate, channels);
				for (int i = 0; i < samples.Length; i++) {
					wavData[44 + i * 2] = (byte)(samples[i] & 0xff);
					wavData[44 + i * 2 + 1] = (byte)((samples[i] >> 8) & 0xff);
				}

				File.WriteAllBytes(output.FullName, wavData);
				Console.WriteLine($"Output: {output.FullName}");
				Console.WriteLine($"Size: {wavData.Length:N0} bytes");

				return 0;
			} catch (Exception ex) {
				Console.Error.WriteLine($"Error rendering SPC: {ex.Message}");
				return 1;
			}
		});

		return command;
	}

	private static void WriteWavHeader(byte[] data, int sampleCount, int sampleRate, int channels) {
		int byteRate = sampleRate * channels * 2;
		int dataSize = sampleCount * 2;
		int fileSize = 36 + dataSize;

		// RIFF header
		data[0] = (byte)'R'; data[1] = (byte)'I'; data[2] = (byte)'F'; data[3] = (byte)'F';
		WriteInt32LE(data, 4, fileSize);
		data[8] = (byte)'W'; data[9] = (byte)'A'; data[10] = (byte)'V'; data[11] = (byte)'E';

		// fmt chunk
		data[12] = (byte)'f'; data[13] = (byte)'m'; data[14] = (byte)'t'; data[15] = (byte)' ';
		WriteInt32LE(data, 16, 16); // chunk size
		WriteInt16LE(data, 20, 1);  // audio format (PCM)
		WriteInt16LE(data, 22, (short)channels);
		WriteInt32LE(data, 24, sampleRate);
		WriteInt32LE(data, 28, byteRate);
		WriteInt16LE(data, 32, (short)(channels * 2)); // block align
		WriteInt16LE(data, 34, 16); // bits per sample

		// data chunk
		data[36] = (byte)'d'; data[37] = (byte)'a'; data[38] = (byte)'t'; data[39] = (byte)'a';
		WriteInt32LE(data, 40, dataSize);
	}

	private static void WriteInt16LE(byte[] data, int offset, short value) {
		data[offset] = (byte)(value & 0xff);
		data[offset + 1] = (byte)((value >> 8) & 0xff);
	}

	private static void WriteInt32LE(byte[] data, int offset, int value) {
		data[offset] = (byte)(value & 0xff);
		data[offset + 1] = (byte)((value >> 8) & 0xff);
		data[offset + 2] = (byte)((value >> 16) & 0xff);
		data[offset + 3] = (byte)((value >> 24) & 0xff);
	}

	private static string SanitizeFilename(string name) {
		var invalid = Path.GetInvalidFileNameChars();
		foreach (var c in invalid) {
			name = name.Replace(c, '_');
		}
		return name;
	}
}
