using System.IO.Compression;
using System.Text;
using System.Text.Json;
using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Formats;

/// <summary>
/// BizHawk BK2 format reader/writer.
/// </summary>
/// <remarks>
/// BK2 is BizHawk's native format. It's a ZIP archive containing:
/// - Header.txt: Key-value metadata
/// - Input Log.txt: Input data in pipe-delimited format
/// - SyncSettings.json: Emulator sync settings
/// - Comments.txt (optional): User comments
/// - Subtitles.txt (optional): Subtitle data
/// - Core.bin (optional): Savestate/state data
/// </remarks>
public class Bk2Format : TasFormatBase {
	/// <inheritdoc/>
	public override string Name => "BK2";

	/// <inheritdoc/>
	public override string Description => "BizHawk movie file";

	/// <inheritdoc/>
	public override string EmulatorName => "BizHawk";

	/// <inheritdoc/>
	public override IReadOnlyList<string> Extensions => ["bk2"];

	/// <inheritdoc/>
	public override IReadOnlyList<GameSystem> SupportedSystems => [
		GameSystem.Nes,
		GameSystem.Snes,
		GameSystem.GameBoy,
		GameSystem.GameBoyColor,
		GameSystem.GameBoyAdvance,
		GameSystem.Genesis,
		GameSystem.MasterSystem,
		GameSystem.GameGear,
		GameSystem.N64,
		GameSystem.PlayStation,
		GameSystem.Atari2600,
		GameSystem.Atari7800,
		GameSystem.TurboGrafx16,
	];

	/// <inheritdoc/>
	public override bool CanHandle(Stream stream) {
		// BK2 files are ZIP archives
		if (stream.Length < 4) return false;

		Span<byte> header = stackalloc byte[4];
		stream.ReadExactly(header);

		// Check for ZIP signature
		if (header[0] != 0x50 || header[1] != 0x4B || header[2] != 0x03 || header[3] != 0x04) {
			return false;
		}

		stream.Position = 0;
		try {
			using var archive = new ZipArchive(stream, ZipArchiveMode.Read, leaveOpen: true);
			// Must have Header.txt
			return archive.GetEntry("Header.txt") is not null;
		} catch {
			return false;
		}
	}

	/// <inheritdoc/>
	public override async Task<ITasMovie> ReadAsync(Stream stream, CancellationToken cancellationToken = default) {
		using var archive = new ZipArchive(stream, ZipArchiveMode.Read, leaveOpen: true);

		// Read header
		var headerText = await ReadEntryTextAsync(archive, "Header.txt", cancellationToken)
			?? throw new InvalidDataException("BK2 file missing Header.txt");
		var headerDict = ParseKeyValueText(headerText);

		// Parse system
		var system = ParsePlatform(headerDict.GetValueOrDefault("Platform", ""));

		// Read input log
		var inputText = await ReadEntryTextAsync(archive, "Input Log.txt", cancellationToken)
			?? throw new InvalidDataException("BK2 file missing Input Log.txt");

		var (frames, controllers, inputFormat) = ParseInputLog(inputText, system);

		// Read comments
		var commentsText = await ReadEntryTextAsync(archive, "Comments.txt", cancellationToken);

		// Read savestate if present
		byte[]? savestateData = null;
		var stateEntry = archive.GetEntry("Core.bin") ?? archive.GetEntry("greenzone");
		if (stateEntry is not null) {
			using var stateStream = stateEntry.Open();
			using var memoryStream = new MemoryStream();
			await stateStream.CopyToAsync(memoryStream, cancellationToken);
			savestateData = memoryStream.ToArray();
		}

		// Build metadata
		var metadata = new TasMetadata {
			EmulatorName = "BizHawk",
			EmulatorVersion = headerDict.GetValueOrDefault("EmulatorVersion"),
			FormatName = "BK2",
			Author = headerDict.GetValueOrDefault("Author"),
			RerecordCount = int.TryParse(headerDict.GetValueOrDefault("rerecordCount", "0"), out var rr) ? rr : 0,
			FrameCount = frames.Count,
			Region = headerDict.GetValueOrDefault("PAL", "0") == "1" ? GameRegion.Pal : GameRegion.Ntsc,
			StartType = savestateData is not null ? MovieStartType.Savestate : MovieStartType.PowerOn,
			RomName = headerDict.GetValueOrDefault("GameName"),
			RomChecksum = headerDict.GetValueOrDefault("SHA1"),
			RomChecksumType = headerDict.ContainsKey("SHA1") ? ChecksumType.Sha1 : ChecksumType.Unknown,
			Comments = commentsText,
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

		// Write Header.txt
		var headerText = GenerateHeader(movie);
		await WriteEntryTextAsync(archive, "Header.txt", headerText, cancellationToken);

		// Write Input Log.txt
		var inputLog = GenerateInputLog(movie);
		await WriteEntryTextAsync(archive, "Input Log.txt", inputLog, cancellationToken);

		// Write Comments.txt if present
		if (!string.IsNullOrEmpty(movie.Metadata.Comments)) {
			await WriteEntryTextAsync(archive, "Comments.txt", movie.Metadata.Comments, cancellationToken);
		}

		// Write SyncSettings.json (minimal default)
		var syncSettings = new { };
		var syncJson = JsonSerializer.Serialize(syncSettings);
		await WriteEntryTextAsync(archive, "SyncSettings.json", syncJson, cancellationToken);

		// Write savestate if present
		if (movie.SavestateData is not null) {
			var entry = archive.CreateEntry("Core.bin", CompressionLevel.Optimal);
			await using var entryStream = entry.Open();
			await entryStream.WriteAsync(movie.SavestateData, cancellationToken);
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

	private static Dictionary<string, string> ParseKeyValueText(string text) {
		var dict = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

		foreach (var line in text.Split('\n')) {
			var trimmed = line.Trim();
			var index = trimmed.IndexOf(' ');
			if (index > 0) {
				var key = trimmed[..index];
				var value = trimmed[(index + 1)..];
				dict[key] = value;
			}
		}

		return dict;
	}

	private static GameSystem ParsePlatform(string platform) {
		return platform.ToUpperInvariant() switch {
			"NES" => GameSystem.Nes,
			"SNES" or "BSX" => GameSystem.Snes,
			"GB" => GameSystem.GameBoy,
			"GBC" or "SGB" => GameSystem.GameBoyColor,
			"GBA" => GameSystem.GameBoyAdvance,
			"GEN" or "GENESIS" => GameSystem.Genesis,
			"SMS" => GameSystem.MasterSystem,
			"GG" => GameSystem.GameGear,
			"N64" => GameSystem.N64,
			"PSX" => GameSystem.PlayStation,
			"A26" => GameSystem.Atari2600,
			"A78" => GameSystem.Atari7800,
			"PCE" or "PCECD" => GameSystem.TurboGrafx16,
			_ => GameSystem.Unknown,
		};
	}

	private static (List<TasFrame>, List<ControllerInfo>, string) ParseInputLog(
		string inputText,
		GameSystem system) {
		var frames = new List<TasFrame>();
		var controllers = new List<ControllerInfo>();
		string inputFormat = "";

		var lines = inputText.Split('\n');
		var frameNumber = 0;
		var headerParsed = false;

		foreach (var line in lines) {
			var trimmed = line.Trim();

			// Skip empty lines
			if (string.IsNullOrEmpty(trimmed)) continue;

			// Parse header line - two formats:
			// Older: [Input Log]\n[...|#|buttons|buttons|]
			// Newer: LogKey:#Reset|Power|#P1 Up|P1 Down|...
			if (trimmed.StartsWith('[') || trimmed.StartsWith("LogKey:")) {
				inputFormat = trimmed;
				headerParsed = true;

				// Determine controller count from format
				// Count groups separated by #P or standalone port sections
				if (trimmed.StartsWith("LogKey:")) {
					// Newer format: count #P followed by number
					var portMatches = System.Text.RegularExpressions.Regex.Matches(trimmed, @"#P(\d+)");
					var portCount = portMatches.Cast<System.Text.RegularExpressions.Match>()
						.Select(m => int.Parse(m.Groups[1].Value))
						.Distinct()
						.Count();
					for (var i = 0; i < Math.Max(1, portCount); i++) {
						controllers.Add(new ControllerInfo { Port = i, Type = ControllerType.Gamepad });
					}
				} else {
					// Older format: count pipe-separated sections
					var portCount = trimmed.Count(c => c == '|') - 1;
					for (var i = 0; i < portCount; i++) {
						controllers.Add(new ControllerInfo { Port = i, Type = ControllerType.Gamepad });
					}
				}
				continue;
			}

			// Skip if header not parsed
			if (!headerParsed) continue;

			// Parse input line (starts with |)
			if (!trimmed.StartsWith('|')) continue;

			var parts = trimmed.Split('|');
			if (parts.Length < 2) continue;

			var inputs = new List<ControllerInput>();
			var commands = FrameCommands.None;

			// Parts: empty | commands | port0 | port1 | ... | empty
			for (var i = 1; i < parts.Length - 1; i++) {
				if (i == 1) {
					// Commands section
					if (parts[i].Contains('r')) commands |= FrameCommands.SoftReset;
					if (parts[i].Contains('P')) commands |= FrameCommands.HardReset;
					continue;
				}

				var port = i - 2;
				var buttons = system switch {
					GameSystem.Nes => ParseNesInput(parts[i]),
					GameSystem.Snes => ParseSnesInput(parts[i]),
					GameSystem.GameBoy or GameSystem.GameBoyColor => ParseGbInput(parts[i]),
					_ => ParseGenericInput(parts[i]),
				};

				inputs.Add(new ControllerInput {
					Port = port,
					RawButtons = buttons,
				});
			}

			frames.Add(new TasFrame {
				FrameNumber = frameNumber++,
				Inputs = inputs,
				Commands = commands,
			});
		}

		if (controllers.Count == 0) {
			controllers.Add(new ControllerInfo { Port = 0, Type = ControllerType.Gamepad });
		}

		return (frames, controllers, inputFormat);
	}

	private static uint ParseNesInput(string input) {
		// BizHawk NES: UDLRSsBA
		uint buttons = 0;

		if (input.Length >= 1 && input[0] != '.') buttons |= (uint)NesButtons.Up;
		if (input.Length >= 2 && input[1] != '.') buttons |= (uint)NesButtons.Down;
		if (input.Length >= 3 && input[2] != '.') buttons |= (uint)NesButtons.Left;
		if (input.Length >= 4 && input[3] != '.') buttons |= (uint)NesButtons.Right;
		if (input.Length >= 5 && input[4] != '.') buttons |= (uint)NesButtons.Start;
		if (input.Length >= 6 && input[5] != '.') buttons |= (uint)NesButtons.Select;
		if (input.Length >= 7 && input[6] != '.') buttons |= (uint)NesButtons.B;
		if (input.Length >= 8 && input[7] != '.') buttons |= (uint)NesButtons.A;

		return buttons;
	}

	private static uint ParseSnesInput(string input) {
		// BizHawk SNES: UDLRSsYBAXLR
		uint buttons = 0;

		if (input.Length >= 1 && input[0] != '.') buttons |= (uint)SnesButtons.Up;
		if (input.Length >= 2 && input[1] != '.') buttons |= (uint)SnesButtons.Down;
		if (input.Length >= 3 && input[2] != '.') buttons |= (uint)SnesButtons.Left;
		if (input.Length >= 4 && input[3] != '.') buttons |= (uint)SnesButtons.Right;
		if (input.Length >= 5 && input[4] != '.') buttons |= (uint)SnesButtons.Start;
		if (input.Length >= 6 && input[5] != '.') buttons |= (uint)SnesButtons.Select;
		if (input.Length >= 7 && input[6] != '.') buttons |= (uint)SnesButtons.Y;
		if (input.Length >= 8 && input[7] != '.') buttons |= (uint)SnesButtons.B;
		if (input.Length >= 9 && input[8] != '.') buttons |= (uint)SnesButtons.A;
		if (input.Length >= 10 && input[9] != '.') buttons |= (uint)SnesButtons.X;
		if (input.Length >= 11 && input[10] != '.') buttons |= (uint)SnesButtons.L;
		if (input.Length >= 12 && input[11] != '.') buttons |= (uint)SnesButtons.R;

		return buttons;
	}

	private static uint ParseGbInput(string input) {
		// BizHawk GB: UDLRSsBA
		uint buttons = 0;

		if (input.Length >= 1 && input[0] != '.') buttons |= (uint)GbButtons.Up;
		if (input.Length >= 2 && input[1] != '.') buttons |= (uint)GbButtons.Down;
		if (input.Length >= 3 && input[2] != '.') buttons |= (uint)GbButtons.Left;
		if (input.Length >= 4 && input[3] != '.') buttons |= (uint)GbButtons.Right;
		if (input.Length >= 5 && input[4] != '.') buttons |= (uint)GbButtons.Start;
		if (input.Length >= 6 && input[5] != '.') buttons |= (uint)GbButtons.Select;
		if (input.Length >= 7 && input[6] != '.') buttons |= (uint)GbButtons.B;
		if (input.Length >= 8 && input[7] != '.') buttons |= (uint)GbButtons.A;

		return buttons;
	}

	private static uint ParseGenericInput(string input) {
		// Generic: count set bits
		uint buttons = 0;
		for (var i = 0; i < input.Length && i < 32; i++) {
			if (input[i] != '.') buttons |= 1u << i;
		}
		return buttons;
	}

	private static string GenerateHeader(ITasMovie movie) {
		var sb = new StringBuilder();

		sb.AppendLine($"Platform {GetPlatformString(movie.System)}");
		sb.AppendLine($"MovieVersion BizHawk v2.0");
		sb.AppendLine($"Author {movie.Metadata.Author ?? ""}");
		sb.AppendLine($"rerecordCount {movie.Metadata.RerecordCount}");

		if (!string.IsNullOrEmpty(movie.Metadata.RomName)) {
			sb.AppendLine($"GameName {movie.Metadata.RomName}");
		}
		if (!string.IsNullOrEmpty(movie.Metadata.RomChecksum)) {
			sb.AppendLine($"SHA1 {movie.Metadata.RomChecksum}");
		}
		if (movie.Metadata.Region == GameRegion.Pal) {
			sb.AppendLine("PAL 1");
		}

		return sb.ToString();
	}

	private static string GetPlatformString(GameSystem system) {
		return system switch {
			GameSystem.Nes => "NES",
			GameSystem.Snes => "SNES",
			GameSystem.GameBoy => "GB",
			GameSystem.GameBoyColor => "GBC",
			GameSystem.GameBoyAdvance => "GBA",
			GameSystem.Genesis => "GEN",
			GameSystem.MasterSystem => "SMS",
			GameSystem.GameGear => "GG",
			GameSystem.N64 => "N64",
			GameSystem.PlayStation => "PSX",
			GameSystem.Atari2600 => "A26",
			GameSystem.Atari7800 => "A78",
			GameSystem.TurboGrafx16 => "PCE",
			_ => "Unknown",
		};
	}

	private static string GenerateInputLog(ITasMovie movie) {
		var sb = new StringBuilder();

		// Generate header based on system
		var inputFormat = movie.System switch {
			GameSystem.Nes => "[Input Log]\n[...|#|UDLRSsBA|UDLRSsBA|]",
			GameSystem.Snes => "[Input Log]\n[...|#|UDLRSsYBAXLR|UDLRSsYBAXLR|]",
			GameSystem.GameBoy or GameSystem.GameBoyColor => "[Input Log]\n[...|#|UDLRSsBA|]",
			_ => "[Input Log]\n[...|#|........|........|]",
		};
		sb.AppendLine(inputFormat);

		foreach (var frame in movie.Frames) {
			sb.Append('|');

			// Commands
			sb.Append(frame.Commands.HasFlag(FrameCommands.SoftReset) ? "r" : ".");
			sb.Append('|');

			// Controller inputs
			foreach (var input in frame.Inputs) {
				sb.Append(FormatInput(input.RawButtons, movie.System));
				sb.Append('|');
			}

			sb.AppendLine();
		}

		return sb.ToString();
	}

	private static string FormatInput(uint buttons, GameSystem system) {
		return system switch {
			GameSystem.Nes => ((NesButtons)buttons).ToDisplayString(),
			GameSystem.Snes => ((SnesButtons)buttons).ToDisplayString(),
			GameSystem.GameBoy or GameSystem.GameBoyColor => ((GbButtons)buttons).ToDisplayString(),
			_ => FormatGenericInput(buttons, 8),
		};
	}

	private static string FormatGenericInput(uint buttons, int count) {
		var chars = new char[count];
		for (var i = 0; i < count; i++) {
			chars[i] = (buttons & (1 << i)) != 0 ? '?' : '.';
		}
		return new string(chars);
	}
}
