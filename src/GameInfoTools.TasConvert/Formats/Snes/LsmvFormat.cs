using System.IO.Compression;
using System.Text;
using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Formats.Snes;

/// <summary>
/// lsnes LSMV format reader/writer.
/// </summary>
/// <remarks>
/// LSMV is a ZIP archive containing:
/// - input: The input log (text)
/// - gametype: System type identifier
/// - authors: Author information
/// - systemid: System identifier
/// - coreversion: Emulator core version
/// - movietime: Movie timestamp
/// - rerecords: Rerecord count
/// - rrdata: Binary rerecord data
/// - savestate (optional): Embedded savestate
/// - sram.* (optional): SRAM files
/// </remarks>
public class LsmvFormat : TasFormatBase {
	/// <inheritdoc/>
	public override string Name => "LSMV";

	/// <inheritdoc/>
	public override string Description => "lsnes movie file";

	/// <inheritdoc/>
	public override string EmulatorName => "lsnes";

	/// <inheritdoc/>
	public override IReadOnlyList<string> Extensions => ["lsmv"];

	/// <inheritdoc/>
	public override IReadOnlyList<GameSystem> SupportedSystems => [GameSystem.Snes, GameSystem.GameBoy, GameSystem.GameBoyColor];

	/// <inheritdoc/>
	public override bool CanHandle(Stream stream) {
		// LSMV files are ZIP archives
		if (stream.Length < 4) return false;

		Span<byte> header = stackalloc byte[4];
		stream.ReadExactly(header);

		// Check for ZIP signature (PK\x03\x04)
		if (header[0] != 0x50 || header[1] != 0x4B || header[2] != 0x03 || header[3] != 0x04) {
			return false;
		}

		// Reset and try to open as ZIP
		stream.Position = 0;
		try {
			using var archive = new ZipArchive(stream, ZipArchiveMode.Read, leaveOpen: true);
			// Must have at least an input file
			return archive.GetEntry("input") is not null;
		} catch {
			return false;
		}
	}

	/// <inheritdoc/>
	public override async Task<ITasMovie> ReadAsync(Stream stream, CancellationToken cancellationToken = default) {
		using var archive = new ZipArchive(stream, ZipArchiveMode.Read, leaveOpen: true);

		// Read gametype
		var gametype = await ReadEntryTextAsync(archive, "gametype", cancellationToken) ?? "snes_ntsc";
		var system = ParseGameType(gametype);
		var region = gametype.Contains("pal") ? GameRegion.Pal : GameRegion.Ntsc;

		// Read metadata
		var authors = await ReadEntryTextAsync(archive, "authors", cancellationToken);
		var rerecords = await ReadEntryTextAsync(archive, "rerecords", cancellationToken);
		var movietime = await ReadEntryTextAsync(archive, "movietime", cancellationToken);
		var projectid = await ReadEntryTextAsync(archive, "projectid", cancellationToken);
		var romFilename = await ReadEntryTextAsync(archive, "romfilename", cancellationToken);
		var romSha256 = await ReadEntryTextAsync(archive, "romsha256", cancellationToken);

		// Read input log
		var inputText = await ReadEntryTextAsync(archive, "input", cancellationToken)
			?? throw new InvalidDataException("LSMV file missing input entry.");

		var (frames, controllers) = ParseInputLog(inputText);

		// Read savestate if present
		byte[]? savestateData = null;
		var savestateEntry = archive.GetEntry("savestate");
		if (savestateEntry is not null) {
			using var savestateStream = savestateEntry.Open();
			using var memoryStream = new MemoryStream();
			await savestateStream.CopyToAsync(memoryStream, cancellationToken);
			savestateData = memoryStream.ToArray();
		}

		// Build metadata
		var metadata = new TasMetadata {
			EmulatorName = "lsnes",
			FormatName = "LSMV",
			Author = authors?.Split('\n').FirstOrDefault()?.Trim(),
			RerecordCount = int.TryParse(rerecords, out var rr) ? rr : 0,
			FrameCount = frames.Count,
			Region = region,
			StartType = savestateData is not null ? MovieStartType.Savestate : MovieStartType.PowerOn,
			RomFilename = romFilename,
			RomChecksum = romSha256,
			RomChecksumType = romSha256 is not null ? ChecksumType.Sha256 : ChecksumType.Unknown,
		};

		return new TasMovie {
			Metadata = metadata,
			Frames = frames,
			System = system,
			Controllers = controllers,
			SavestateData = savestateData,
		};
	}

	/// <inheritdoc/>
	public override async Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken cancellationToken = default) {
		using var archive = new ZipArchive(stream, ZipArchiveMode.Create, leaveOpen: true);

		// Write gametype
		var gametype = movie.System switch {
			GameSystem.Snes => movie.Metadata.Region == GameRegion.Pal ? "snes_pal" : "snes_ntsc",
			GameSystem.GameBoy => "sgb_ntsc",
			GameSystem.GameBoyColor => "sgb_ntsc",
			_ => "snes_ntsc",
		};
		await WriteEntryTextAsync(archive, "gametype", gametype, cancellationToken);

		// Write systemid
		await WriteEntryTextAsync(archive, "systemid", "lsnes-rr2", cancellationToken);

		// Write authors
		if (!string.IsNullOrEmpty(movie.Metadata.Author)) {
			await WriteEntryTextAsync(archive, "authors", movie.Metadata.Author, cancellationToken);
		}

		// Write rerecords
		await WriteEntryTextAsync(archive, "rerecords", movie.Metadata.RerecordCount.ToString(), cancellationToken);

		// Write projectid (generate random)
		await WriteEntryTextAsync(archive, "projectid", Guid.NewGuid().ToString("N"), cancellationToken);

		// Write ROM info
		if (!string.IsNullOrEmpty(movie.Metadata.RomFilename)) {
			await WriteEntryTextAsync(archive, "romfilename", movie.Metadata.RomFilename, cancellationToken);
		}
		if (!string.IsNullOrEmpty(movie.Metadata.RomChecksum) && movie.Metadata.RomChecksumType == ChecksumType.Sha256) {
			await WriteEntryTextAsync(archive, "romsha256", movie.Metadata.RomChecksum, cancellationToken);
		}

		// Write input log
		var inputLog = GenerateInputLog(movie);
		await WriteEntryTextAsync(archive, "input", inputLog, cancellationToken);

		// Write savestate if present
		if (movie.SavestateData is not null) {
			var entry = archive.CreateEntry("savestate", CompressionLevel.Optimal);
			await using var entryStream = entry.Open();
			await entryStream.WriteAsync(movie.SavestateData, cancellationToken);
		}

		// Write SRAM if present
		if (movie.SramData is not null) {
			var entry = archive.CreateEntry("sram.srm", CompressionLevel.Optimal);
			await using var entryStream = entry.Open();
			await entryStream.WriteAsync(movie.SramData, cancellationToken);
		}
	}

	private static async Task<string?> ReadEntryTextAsync(
		ZipArchive archive,
		string entryName,
		CancellationToken cancellationToken) {
		var entry = archive.GetEntry(entryName);
		if (entry is null) return null;

		using var stream = entry.Open();
		using var reader = new StreamReader(stream, Encoding.UTF8);
		return await reader.ReadToEndAsync(cancellationToken);
	}

	private static async Task WriteEntryTextAsync(
		ZipArchive archive,
		string entryName,
		string content,
		CancellationToken cancellationToken) {
		var entry = archive.CreateEntry(entryName, CompressionLevel.Optimal);
		await using var stream = entry.Open();
		await using var writer = new StreamWriter(stream, Encoding.UTF8, leaveOpen: true);
		await writer.WriteAsync(content);
	}

	private static GameSystem ParseGameType(string gametype) {
		return gametype.ToLowerInvariant() switch {
			var gt when gt.StartsWith("snes") => GameSystem.Snes,
			var gt when gt.StartsWith("bsnes") => GameSystem.Snes,
			var gt when gt.StartsWith("sgb") => GameSystem.GameBoy,
			var gt when gt.StartsWith("gb") => GameSystem.GameBoy,
			var gt when gt.StartsWith("gbc") => GameSystem.GameBoyColor,
			_ => GameSystem.Snes,
		};
	}

	private static (List<TasFrame> Frames, List<ControllerInfo> Controllers) ParseInputLog(string inputText) {
		var frames = new List<TasFrame>();
		var controllers = new List<ControllerInfo>();
		var controllersDetected = false;

		var lines = inputText.Split('\n', StringSplitOptions.RemoveEmptyEntries);
		var frameNumber = 0;

		foreach (var line in lines) {
			var trimmed = line.Trim();

			// Skip comments
			if (trimmed.StartsWith('#')) continue;

			// Skip empty lines
			if (string.IsNullOrEmpty(trimmed)) continue;

			// Parse frame line: |command|port0|port1|...
			if (!trimmed.StartsWith('|')) continue;

			var parts = trimmed.Split('|');
			if (parts.Length < 2) continue;

			// First part after | is commands
			var commands = ParseCommands(parts[1]);

			// Remaining parts are controller inputs
			var inputs = new List<ControllerInput>();

			for (var i = 2; i < parts.Length; i++) {
				if (string.IsNullOrEmpty(parts[i])) continue;

				var port = i - 2;
				var buttons = ParseSnesInput(parts[i]);

				if (!controllersDetected && buttons > 0) {
					controllers.Add(new ControllerInfo { Port = port, Type = ControllerType.Gamepad });
				}

				inputs.Add(new ControllerInput {
					Port = port,
					RawButtons = buttons,
				});
			}

			controllersDetected = true;

			frames.Add(new TasFrame {
				FrameNumber = frameNumber++,
				Inputs = inputs,
				Commands = commands,
			});
		}

		// Default to 2 controllers if none detected
		if (controllers.Count == 0) {
			controllers.Add(new ControllerInfo { Port = 0, Type = ControllerType.Gamepad });
			controllers.Add(new ControllerInfo { Port = 1, Type = ControllerType.Gamepad });
		}

		return (frames, controllers);
	}

	private static FrameCommands ParseCommands(string commandStr) {
		var commands = FrameCommands.None;

		if (commandStr.Contains('R')) commands |= FrameCommands.SoftReset;
		if (commandStr.Contains('P')) commands |= FrameCommands.HardReset;

		return commands;
	}

	private static uint ParseSnesInput(string input) {
		// LSMV format: BYsSUDLRAXlr (12 buttons)
		uint buttons = 0;

		if (input.Length >= 1 && input[0] != '.') buttons |= (uint)SnesButtons.B;
		if (input.Length >= 2 && input[1] != '.') buttons |= (uint)SnesButtons.Y;
		if (input.Length >= 3 && input[2] != '.') buttons |= (uint)SnesButtons.Select;
		if (input.Length >= 4 && input[3] != '.') buttons |= (uint)SnesButtons.Start;
		if (input.Length >= 5 && input[4] != '.') buttons |= (uint)SnesButtons.Up;
		if (input.Length >= 6 && input[5] != '.') buttons |= (uint)SnesButtons.Down;
		if (input.Length >= 7 && input[6] != '.') buttons |= (uint)SnesButtons.Left;
		if (input.Length >= 8 && input[7] != '.') buttons |= (uint)SnesButtons.Right;
		if (input.Length >= 9 && input[8] != '.') buttons |= (uint)SnesButtons.A;
		if (input.Length >= 10 && input[9] != '.') buttons |= (uint)SnesButtons.X;
		if (input.Length >= 11 && input[10] != '.') buttons |= (uint)SnesButtons.L;
		if (input.Length >= 12 && input[11] != '.') buttons |= (uint)SnesButtons.R;

		return buttons;
	}

	private static string GenerateInputLog(ITasMovie movie) {
		var sb = new StringBuilder();

		foreach (var frame in movie.Frames) {
			sb.Append('|');

			// Commands
			if (frame.Commands.HasFlag(FrameCommands.SoftReset)) sb.Append('R');
			else if (frame.Commands.HasFlag(FrameCommands.HardReset)) sb.Append('P');
			else sb.Append('.');

			// Controller inputs
			foreach (var input in frame.Inputs) {
				sb.Append('|');
				sb.Append(((SnesButtons)input.RawButtons).ToDisplayString());
			}

			sb.AppendLine("|");
		}

		return sb.ToString();
	}
}
