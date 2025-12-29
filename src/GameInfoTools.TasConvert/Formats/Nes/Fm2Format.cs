using System.Text;
using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Formats.Nes;

/// <summary>
/// FCEUX FM2 format reader/writer.
/// </summary>
/// <remarks>
/// FM2 is a text-based format used by FCEUX emulator.
/// It has a header section with key-value pairs followed by
/// pipe-delimited input lines: |commands|port0|port1|port2|
///
/// Commands: R=reset, P=power, F=FDS insert, D=FDS disk, etc.
/// NES buttons (per port): RLDUTSBA (Right Left Down Up sTart Select B A)
/// </remarks>
public class Fm2Format : TasFormatBase {
	/// <inheritdoc/>
	public override string Name => "FM2";

	/// <inheritdoc/>
	public override string Description => "FCEUX movie file";

	/// <inheritdoc/>
	public override string EmulatorName => "FCEUX";

	/// <inheritdoc/>
	public override IReadOnlyList<string> Extensions => ["fm2", "fm3"];

	/// <inheritdoc/>
	public override IReadOnlyList<GameSystem> SupportedSystems => [GameSystem.Nes];

	/// <inheritdoc/>
	public override bool CanHandle(Stream stream) {
		// FM2 is text-based, look for header keys
		if (stream.Length < 10) return false;

		using var reader = new StreamReader(stream, Encoding.UTF8, detectEncodingFromByteOrderMarks: true, leaveOpen: true);

		// Read first few lines looking for FM2/FM3 header keys
		for (var i = 0; i < 20 && !reader.EndOfStream; i++) {
			var line = reader.ReadLine();
			if (string.IsNullOrEmpty(line)) continue;

			// Look for common FM2 header keys
			if (line.StartsWith("version ", StringComparison.OrdinalIgnoreCase) ||
				line.StartsWith("emuVersion ", StringComparison.OrdinalIgnoreCase) ||
				line.StartsWith("fds ", StringComparison.OrdinalIgnoreCase) ||
				line.StartsWith("fourscore ", StringComparison.OrdinalIgnoreCase) ||
				line.StartsWith("port0 ", StringComparison.OrdinalIgnoreCase)) {
				return true;
			}

			// Also accept if we see pipe-delimited input format
			if (line.StartsWith('|')) {
				return true;
			}
		}

		return false;
	}

	/// <inheritdoc/>
	public override async Task<ITasMovie> ReadAsync(Stream stream, CancellationToken cancellationToken = default) {
		using var reader = new StreamReader(stream, Encoding.UTF8, detectEncodingFromByteOrderMarks: true, leaveOpen: true);

		var header = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
		var frames = new List<TasFrame>();
		var frameNumber = 0;

		string? line;
		while ((line = await reader.ReadLineAsync(cancellationToken)) is not null) {
			line = line.Trim();

			// Skip empty lines
			if (string.IsNullOrEmpty(line)) continue;

			// Input lines start with |
			if (line.StartsWith('|')) {
				var frame = ParseInputLine(line, frameNumber++);
				if (frame is not null) {
					frames.Add(frame);
				}
				continue;
			}

			// Header lines are key-value pairs
			var spaceIndex = line.IndexOf(' ');
			if (spaceIndex > 0) {
				var key = line[..spaceIndex];
				var value = line[(spaceIndex + 1)..];
				header[key] = value;
			}
		}

		// Determine controller configuration
		var port0 = header.GetValueOrDefault("port0", "1");
		var port1 = header.GetValueOrDefault("port1", "1");
		var fourscore = header.GetValueOrDefault("fourscore", "0") == "1";

		var controllers = new List<ControllerInfo>();
		if (port0 != "0") controllers.Add(new ControllerInfo { Port = 0, Type = ParsePortType(port0) });
		if (port1 != "0") controllers.Add(new ControllerInfo { Port = 1, Type = ParsePortType(port1) });
		if (fourscore) {
			controllers.Add(new ControllerInfo { Port = 2, Type = ControllerType.Gamepad });
			controllers.Add(new ControllerInfo { Port = 3, Type = ControllerType.Gamepad });
		}

		// Build metadata
		var metadata = new TasMetadata {
			EmulatorName = "FCEUX",
			EmulatorVersion = header.GetValueOrDefault("emuVersion"),
			FormatName = "FM2",
			FormatVersion = int.TryParse(header.GetValueOrDefault("version", "3"), out var ver) ? ver : 3,
			Author = header.GetValueOrDefault("comment author"),
			RerecordCount = int.TryParse(header.GetValueOrDefault("rerecordCount", "0"), out var rr) ? rr : 0,
			FrameCount = frames.Count,
			Region = header.GetValueOrDefault("palFlag", "0") == "1" ? GameRegion.Pal : GameRegion.Ntsc,
			StartType = header.GetValueOrDefault("savestate") is not null ? MovieStartType.Savestate : MovieStartType.PowerOn,
			RomFilename = header.GetValueOrDefault("romFilename"),
			RomChecksum = header.GetValueOrDefault("romChecksum"),
			RomChecksumType = header.ContainsKey("romChecksum") ? ChecksumType.Md5 : ChecksumType.Unknown,
			Comments = BuildComments(header),
		};

		return new TasMovie {
			Metadata = metadata,
			Frames = frames,
			System = GameSystem.Nes,
			Controllers = controllers,
		};
	}

	/// <inheritdoc/>
	public override async Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken cancellationToken = default) {
		await using var writer = new StreamWriter(stream, Encoding.UTF8, leaveOpen: true);

		// Write header
		await writer.WriteLineAsync($"version 3");
		await writer.WriteLineAsync($"emuVersion 20500");
		await writer.WriteLineAsync($"rerecordCount {movie.Metadata.RerecordCount}");
		await writer.WriteLineAsync($"palFlag {(movie.Metadata.Region == GameRegion.Pal ? "1" : "0")}");

		if (!string.IsNullOrEmpty(movie.Metadata.RomFilename)) {
			await writer.WriteLineAsync($"romFilename {movie.Metadata.RomFilename}");
		}
		if (!string.IsNullOrEmpty(movie.Metadata.RomChecksum)) {
			await writer.WriteLineAsync($"romChecksum {movie.Metadata.RomChecksum}");
		}

		// Controller configuration
		await writer.WriteLineAsync($"port0 {(movie.Controllers.Any(c => c.Port == 0) ? "1" : "0")}");
		await writer.WriteLineAsync($"port1 {(movie.Controllers.Any(c => c.Port == 1) ? "1" : "0")}");
		await writer.WriteLineAsync($"port2 0");

		if (movie.Controllers.Count > 2) {
			await writer.WriteLineAsync($"fourscore 1");
		} else {
			await writer.WriteLineAsync($"fourscore 0");
		}

		// Write author comment
		if (!string.IsNullOrEmpty(movie.Metadata.Author)) {
			await writer.WriteLineAsync($"comment author {movie.Metadata.Author}");
		}

		// Write input frames
		foreach (var frame in movie.Frames) {
			var line = GenerateInputLine(frame, movie.Controllers.Count);
			await writer.WriteLineAsync(line);
		}
	}

	private static TasFrame? ParseInputLine(string line, int frameNumber) {
		// Format: |commands|port0|port1|port2|
		var parts = line.Split('|');
		if (parts.Length < 2) return null;

		// Parse commands (part after first |)
		var commands = ParseCommands(parts[1]);

		// Parse controller inputs
		var inputs = new List<ControllerInput>();

		for (var i = 2; i < parts.Length; i++) {
			var port = i - 2;
			var inputStr = parts[i];

			if (string.IsNullOrEmpty(inputStr) || inputStr.All(c => c == '.')) {
				// Empty or all-dots means no input
				inputs.Add(new ControllerInput { Port = port, RawButtons = 0 });
			} else {
				var buttons = ParseNesInput(inputStr);
				inputs.Add(new ControllerInput { Port = port, RawButtons = buttons });
			}
		}

		return new TasFrame {
			FrameNumber = frameNumber,
			Commands = commands,
			Inputs = inputs,
		};
	}

	private static FrameCommands ParseCommands(string commandStr) {
		var commands = FrameCommands.None;

		foreach (var c in commandStr) {
			switch (c) {
				case 'R':
					commands |= FrameCommands.SoftReset;
					break;
				case 'P':
					commands |= FrameCommands.HardReset;
					break;
				case 'F':
					commands |= FrameCommands.FdsDiskInsert;
					break;
				case 'D':
					commands |= FrameCommands.FdsDiskSelect;
					break;
				case 'I':
					commands |= FrameCommands.VsInsertCoin;
					break;
			}
		}

		return commands;
	}

	private static uint ParseNesInput(string input) {
		// FM2 format: RLDUTSBA
		// R=Right, L=Left, D=Down, U=Up, T=starT, S=Select, B, A
		uint buttons = 0;

		if (input.Length >= 1 && input[0] != '.') buttons |= (uint)NesButtons.Right;
		if (input.Length >= 2 && input[1] != '.') buttons |= (uint)NesButtons.Left;
		if (input.Length >= 3 && input[2] != '.') buttons |= (uint)NesButtons.Down;
		if (input.Length >= 4 && input[3] != '.') buttons |= (uint)NesButtons.Up;
		if (input.Length >= 5 && input[4] != '.') buttons |= (uint)NesButtons.Start;
		if (input.Length >= 6 && input[5] != '.') buttons |= (uint)NesButtons.Select;
		if (input.Length >= 7 && input[6] != '.') buttons |= (uint)NesButtons.B;
		if (input.Length >= 8 && input[7] != '.') buttons |= (uint)NesButtons.A;

		return buttons;
	}

	private static string GenerateInputLine(TasFrame frame, int controllerCount) {
		var sb = new StringBuilder();
		sb.Append('|');

		// Commands
		if (frame.Commands.HasFlag(FrameCommands.SoftReset)) sb.Append('R');
		else if (frame.Commands.HasFlag(FrameCommands.HardReset)) sb.Append('P');
		else if (frame.Commands.HasFlag(FrameCommands.FdsDiskInsert)) sb.Append('F');
		else if (frame.Commands.HasFlag(FrameCommands.FdsDiskSelect)) sb.Append('D');
		else if (frame.Commands.HasFlag(FrameCommands.VsInsertCoin)) sb.Append('I');

		sb.Append('|');

		// Controller inputs (up to 4)
		for (var i = 0; i < Math.Max(controllerCount, 2); i++) {
			var input = frame.Inputs.FirstOrDefault(inp => inp.Port == i);
			if (input is not null) {
				sb.Append(FormatNesInput((NesButtons)input.RawButtons));
			} else {
				sb.Append("........");
			}
			sb.Append('|');
		}

		// Port 2 for expansion (empty for now)
		sb.Append('|');

		return sb.ToString();
	}

	private static string FormatNesInput(NesButtons buttons) {
		// FM2 format: RLDUTSBA
		Span<char> chars = stackalloc char[8];

		chars[0] = buttons.HasFlag(NesButtons.Right) ? 'R' : '.';
		chars[1] = buttons.HasFlag(NesButtons.Left) ? 'L' : '.';
		chars[2] = buttons.HasFlag(NesButtons.Down) ? 'D' : '.';
		chars[3] = buttons.HasFlag(NesButtons.Up) ? 'U' : '.';
		chars[4] = buttons.HasFlag(NesButtons.Start) ? 'T' : '.';
		chars[5] = buttons.HasFlag(NesButtons.Select) ? 'S' : '.';
		chars[6] = buttons.HasFlag(NesButtons.B) ? 'B' : '.';
		chars[7] = buttons.HasFlag(NesButtons.A) ? 'A' : '.';

		return new string(chars);
	}

	private static ControllerType ParsePortType(string portValue) {
		return portValue switch {
			"0" => ControllerType.None,
			"1" => ControllerType.Gamepad,
			"2" => ControllerType.Zapper,
			"3" => ControllerType.PowerPad,
			"4" => ControllerType.ArkanoidVaus,
			_ => ControllerType.Gamepad,
		};
	}

	private static string? BuildComments(Dictionary<string, string> header) {
		var comments = header
			.Where(kv => kv.Key.StartsWith("comment ", StringComparison.OrdinalIgnoreCase))
			.Select(kv => $"{kv.Key[8..]}: {kv.Value}")
			.ToList();

		return comments.Count > 0 ? string.Join("\n", comments) : null;
	}
}
