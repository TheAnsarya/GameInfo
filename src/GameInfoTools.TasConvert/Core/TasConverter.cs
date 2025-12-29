namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Main converter engine for TAS movies.
/// </summary>
public class TasConverter {
	private readonly TasFormatRegistry _registry;

	/// <summary>
	/// Creates a new converter using the default format registry.
	/// </summary>
	public TasConverter() : this(TasFormatRegistry.Instance) { }

	/// <summary>
	/// Creates a new converter using a custom format registry.
	/// </summary>
	/// <param name="registry">Format registry to use.</param>
	public TasConverter(TasFormatRegistry registry) {
		_registry = registry ?? throw new ArgumentNullException(nameof(registry));
	}

	/// <summary>
	/// Converts a TAS movie from one format to another.
	/// </summary>
	/// <param name="inputPath">Input file path.</param>
	/// <param name="outputPath">Output file path.</param>
	/// <param name="targetFormat">Target format (auto-detected from extension if null).</param>
	/// <param name="options">Conversion options.</param>
	/// <param name="progress">Progress reporter.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Conversion result.</returns>
	public async Task<ConversionResult> ConvertAsync(
		string inputPath,
		string outputPath,
		ITasFormat? targetFormat = null,
		ConversionOptions? options = null,
		IProgress<ConversionProgress>? progress = null,
		CancellationToken cancellationToken = default) {
		options ??= new ConversionOptions();

		var result = new ConversionResult { SourcePath = inputPath, TargetPath = outputPath };
		var stopwatch = System.Diagnostics.Stopwatch.StartNew();

		try {
			progress?.Report(new ConversionProgress { Stage = ConversionStage.DetectingFormat, Percent = 0 });

			// Detect source format
			var sourceFormat = _registry.DetectFormat(inputPath);
			if (sourceFormat is null) {
				result.Success = false;
				result.Error = "Could not detect source format.";
				return result;
			}
			result.SourceFormat = sourceFormat.Name;

			// Determine target format
			targetFormat ??= _registry.GetByExtension(Path.GetExtension(outputPath)).FirstOrDefault();
			if (targetFormat is null) {
				result.Success = false;
				result.Error = "Could not determine target format. Please specify explicitly.";
				return result;
			}
			result.TargetFormat = targetFormat.Name;

			// Check compatibility
			if (!targetFormat.SupportedSystems.Intersect(sourceFormat.SupportedSystems).Any()) {
				result.Success = false;
				result.Error = $"Formats are incompatible: {sourceFormat.Name} ({string.Join(", ", sourceFormat.SupportedSystems)}) " +
					$"and {targetFormat.Name} ({string.Join(", ", targetFormat.SupportedSystems)}) have no common systems.";
				return result;
			}

			progress?.Report(new ConversionProgress { Stage = ConversionStage.Reading, Percent = 10 });

			// Read source movie
			ITasMovie movie;
			await using (var inputStream = File.OpenRead(inputPath)) {
				movie = await sourceFormat.ReadAsync(inputStream, cancellationToken);
			}
			result.FrameCount = movie.Frames.Count;

			progress?.Report(new ConversionProgress { Stage = ConversionStage.Processing, Percent = 50 });

			// Apply any transformations
			movie = ApplyTransformations(movie, sourceFormat, targetFormat, options);

			progress?.Report(new ConversionProgress { Stage = ConversionStage.Writing, Percent = 70 });

			// Write target movie
			var outputDir = Path.GetDirectoryName(outputPath);
			if (!string.IsNullOrEmpty(outputDir)) {
				Directory.CreateDirectory(outputDir);
			}

			await using (var outputStream = File.Create(outputPath)) {
				await targetFormat.WriteAsync(movie, outputStream, cancellationToken);
			}

			progress?.Report(new ConversionProgress { Stage = ConversionStage.Complete, Percent = 100 });

			stopwatch.Stop();
			result.Success = true;
			result.Duration = stopwatch.Elapsed;
			result.OutputSize = new FileInfo(outputPath).Length;

			// Add any warnings
			if (movie.SavestateData is not null && !options.IncludeSavestate) {
				result.Warnings.Add("Source movie uses savestate; savestate data was not included in output.");
			}

			return result;
		} catch (OperationCanceledException) {
			result.Success = false;
			result.Error = "Conversion was cancelled.";
			return result;
		} catch (Exception ex) {
			result.Success = false;
			result.Error = ex.Message;
			return result;
		}
	}

	/// <summary>
	/// Reads a TAS movie from a file.
	/// </summary>
	/// <param name="path">File path.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>The parsed movie.</returns>
	public async Task<ITasMovie> ReadAsync(string path, CancellationToken cancellationToken = default) {
		var format = _registry.DetectFormat(path)
			?? throw new InvalidOperationException($"Could not detect format of '{path}'.");

		await using var stream = File.OpenRead(path);
		return await format.ReadAsync(stream, cancellationToken);
	}

	/// <summary>
	/// Writes a TAS movie to a file.
	/// </summary>
	/// <param name="movie">Movie to write.</param>
	/// <param name="path">Output file path.</param>
	/// <param name="format">Target format (auto-detected from extension if null).</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	public async Task WriteAsync(
		ITasMovie movie,
		string path,
		ITasFormat? format = null,
		CancellationToken cancellationToken = default) {
		format ??= _registry.GetByExtension(Path.GetExtension(path)).FirstOrDefault()
			?? throw new InvalidOperationException($"Could not determine format for '{path}'.");

		var outputDir = Path.GetDirectoryName(path);
		if (!string.IsNullOrEmpty(outputDir)) {
			Directory.CreateDirectory(outputDir);
		}

		await using var stream = File.Create(path);
		await format.WriteAsync(movie, stream, cancellationToken);
	}

	/// <summary>
	/// Gets information about a TAS movie file.
	/// </summary>
	/// <param name="path">File path.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Movie information.</returns>
	public async Task<TasMovieInfo> GetInfoAsync(string path, CancellationToken cancellationToken = default) {
		var format = _registry.DetectFormat(path);
		var fileInfo = new FileInfo(path);

		var info = new TasMovieInfo {
			FilePath = path,
			FileName = fileInfo.Name,
			FileSize = fileInfo.Length,
			FormatName = format?.Name,
			EmulatorName = format?.EmulatorName,
		};

		if (format is not null) {
			try {
				await using var stream = File.OpenRead(path);
				var movie = await format.ReadAsync(stream, cancellationToken);
				info.Metadata = movie.Metadata;
				info.FrameCount = movie.Frames.Count;
				info.System = movie.System;
				info.ControllerCount = movie.Controllers.Count;
				info.HasSavestate = movie.SavestateData is not null;
				info.HasSram = movie.SramData is not null;

				// Calculate duration
				if (movie.Frames.Count > 0) {
					var frameRate = movie.System.GetFrameRate(movie.Metadata.Region);
					info.Duration = TimeSpan.FromSeconds(movie.Frames.Count / frameRate);
				}
			} catch {
				// If we can't read the file, just return basic info
			}
		}

		return info;
	}

	private static ITasMovie ApplyTransformations(
		ITasMovie movie,
		ITasFormat sourceFormat,
		ITasFormat targetFormat,
		ConversionOptions options) {
		// Create a mutable copy if transformations are needed
		var result = movie;

		// Strip savestate if requested
		if (!options.IncludeSavestate && movie.SavestateData is not null) {
			result = new TasMovie {
				Metadata = result.Metadata,
				Frames = result.Frames,
				System = result.System,
				Controllers = result.Controllers,
				SavestateData = null,
				SramData = result.SramData,
			};
		}

		// Strip SRAM if requested
		if (!options.IncludeSram && movie.SramData is not null) {
			result = new TasMovie {
				Metadata = result.Metadata,
				Frames = result.Frames,
				System = result.System,
				Controllers = result.Controllers,
				SavestateData = result.SavestateData,
				SramData = null,
			};
		}

		return result;
	}
}

/// <summary>
/// Options for TAS movie conversion.
/// </summary>
public record ConversionOptions {
	/// <summary>
	/// Gets or sets whether to include savestate data in the output.
	/// </summary>
	public bool IncludeSavestate { get; init; } = true;

	/// <summary>
	/// Gets or sets whether to include SRAM data in the output.
	/// </summary>
	public bool IncludeSram { get; init; } = true;

	/// <summary>
	/// Gets or sets whether to strip lag frames from the output.
	/// </summary>
	public bool StripLagFrames { get; init; }

	/// <summary>
	/// Gets or sets the author name to use in the output (overrides source).
	/// </summary>
	public string? AuthorOverride { get; init; }

	/// <summary>
	/// Gets or sets comments to add to the output.
	/// </summary>
	public string? CommentsOverride { get; init; }
}

/// <summary>
/// Result of a TAS movie conversion.
/// </summary>
public record ConversionResult {
	/// <summary>Gets or sets whether the conversion succeeded.</summary>
	public bool Success { get; set; }

	/// <summary>Gets or sets the source file path.</summary>
	public string SourcePath { get; set; } = "";

	/// <summary>Gets or sets the target file path.</summary>
	public string TargetPath { get; set; } = "";

	/// <summary>Gets or sets the source format name.</summary>
	public string? SourceFormat { get; set; }

	/// <summary>Gets or sets the target format name.</summary>
	public string? TargetFormat { get; set; }

	/// <summary>Gets or sets the frame count.</summary>
	public int FrameCount { get; set; }

	/// <summary>Gets or sets the output file size.</summary>
	public long OutputSize { get; set; }

	/// <summary>Gets or sets the conversion duration.</summary>
	public TimeSpan Duration { get; set; }

	/// <summary>Gets or sets the error message if conversion failed.</summary>
	public string? Error { get; set; }

	/// <summary>Gets the warnings generated during conversion.</summary>
	public List<string> Warnings { get; } = [];
}

/// <summary>
/// Progress information during conversion.
/// </summary>
public record ConversionProgress {
	/// <summary>Gets or sets the current conversion stage.</summary>
	public ConversionStage Stage { get; set; }

	/// <summary>Gets or sets the completion percentage (0-100).</summary>
	public int Percent { get; set; }

	/// <summary>Gets or sets a status message.</summary>
	public string? Message { get; set; }
}

/// <summary>
/// Stages of the conversion process.
/// </summary>
public enum ConversionStage {
	/// <summary>Detecting input format.</summary>
	DetectingFormat,

	/// <summary>Reading input file.</summary>
	Reading,

	/// <summary>Processing/transforming data.</summary>
	Processing,

	/// <summary>Writing output file.</summary>
	Writing,

	/// <summary>Conversion complete.</summary>
	Complete,
}

/// <summary>
/// Information about a TAS movie file.
/// </summary>
public record TasMovieInfo {
	/// <summary>Gets or sets the file path.</summary>
	public string FilePath { get; set; } = "";

	/// <summary>Gets or sets the file name.</summary>
	public string FileName { get; set; } = "";

	/// <summary>Gets or sets the file size in bytes.</summary>
	public long FileSize { get; set; }

	/// <summary>Gets or sets the format name.</summary>
	public string? FormatName { get; set; }

	/// <summary>Gets or sets the emulator name.</summary>
	public string? EmulatorName { get; set; }

	/// <summary>Gets or sets the game system.</summary>
	public GameSystem System { get; set; }

	/// <summary>Gets or sets the movie metadata.</summary>
	public TasMetadata? Metadata { get; set; }

	/// <summary>Gets or sets the frame count.</summary>
	public int FrameCount { get; set; }

	/// <summary>Gets or sets the number of controllers.</summary>
	public int ControllerCount { get; set; }

	/// <summary>Gets or sets the movie duration.</summary>
	public TimeSpan? Duration { get; set; }

	/// <summary>Gets or sets whether the movie has embedded savestate.</summary>
	public bool HasSavestate { get; set; }

	/// <summary>Gets or sets whether the movie has embedded SRAM.</summary>
	public bool HasSram { get; set; }
}
