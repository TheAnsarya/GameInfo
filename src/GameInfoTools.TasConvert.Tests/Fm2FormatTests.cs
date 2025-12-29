using System.Text;
using GameInfoTools.TasConvert.Core;
using GameInfoTools.TasConvert.Formats.Nes;

namespace GameInfoTools.TasConvert.Tests;

public class Fm2FormatTests {
	private readonly Fm2Format _format = new();

	[Fact]
	public void Name_IsFM2() {
		Assert.Equal("FM2", _format.Name);
	}

	[Fact]
	public void EmulatorName_IsFCEUX() {
		Assert.Equal("FCEUX", _format.EmulatorName);
	}

	[Fact]
	public void Extensions_IncludesFm2AndFm3() {
		Assert.Contains("fm2", _format.Extensions);
		Assert.Contains("fm3", _format.Extensions);
	}

	[Fact]
	public void SupportedSystems_IncludesNes() {
		Assert.Contains(GameSystem.Nes, _format.SupportedSystems);
	}

	[Fact]
	public void CanHandle_ValidFm2_ReturnsTrue() {
		var content =
"""
version 3
emuVersion 20500
port0 1
port1 1
|0|........|........||
""";

		using var stream = new MemoryStream(Encoding.UTF8.GetBytes(content));
		var result = _format.CanHandle(stream);

		Assert.True(result);
	}

	[Fact]
	public void CanHandle_InvalidContent_ReturnsFalse() {
		var content = "This is not an FM2 file";

		using var stream = new MemoryStream(Encoding.UTF8.GetBytes(content));
		var result = _format.CanHandle(stream);

		Assert.False(result);
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_ParsesHeader() {
		var content =
"""
version 3
emuVersion 20500
rerecordCount 100
palFlag 0
romFilename test.nes
port0 1
port1 1
|0|........|........||
|0|R......A|........||
|0|........|........||
""";

		using var stream = new MemoryStream(Encoding.UTF8.GetBytes(content));
		var movie = await _format.ReadAsync(stream);

		Assert.Equal("FM2", movie.Metadata.FormatName);
		Assert.Equal(100, movie.Metadata.RerecordCount);
		Assert.Equal(GameRegion.Ntsc, movie.Metadata.Region);
		Assert.Equal("test.nes", movie.Metadata.RomFilename);
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_ParsesFrames() {
		// FM2 format: RLDUTSBA (positions 0-7)
		// R=Right, L=Left, D=Down, U=Up, T=Start, S=Select, B, A
		var content = "version 3\nport0 1\nport1 0\n|0|........||\n|0|R......A||\n|0|.L....B.||\n";

		using var stream = new MemoryStream(Encoding.UTF8.GetBytes(content));
		var movie = await _format.ReadAsync(stream);

		Assert.Equal(3, movie.Frames.Count);

		// Frame 0 - no buttons
		Assert.Equal(0u, movie.Frames[0].Inputs[0].RawButtons);

		// Frame 1 - Right + A (R at position 0, A at position 7)
		var frame1Buttons = (NesButtons)movie.Frames[1].Inputs[0].RawButtons;
		Assert.True(frame1Buttons.HasFlag(NesButtons.Right), $"Expected Right, got {frame1Buttons} ({movie.Frames[1].Inputs[0].RawButtons})");
		Assert.True(frame1Buttons.HasFlag(NesButtons.A), $"Expected A, got {frame1Buttons}");

		// Frame 2 - Left + B (L at position 1, B at position 6)
		var frame2Buttons = (NesButtons)movie.Frames[2].Inputs[0].RawButtons;
		Assert.True(frame2Buttons.HasFlag(NesButtons.Left), $"Expected Left, got {frame2Buttons}");
		Assert.True(frame2Buttons.HasFlag(NesButtons.B), $"Expected B, got {frame2Buttons}");
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_ParsesResetCommand() {
		var content =
"""
version 3
port0 1
|0|........||
|R|........||
|0|........||
""";

		using var stream = new MemoryStream(Encoding.UTF8.GetBytes(content));
		var movie = await _format.ReadAsync(stream);

		Assert.Equal(FrameCommands.None, movie.Frames[0].Commands);
		Assert.Equal(FrameCommands.SoftReset, movie.Frames[1].Commands);
		Assert.Equal(FrameCommands.None, movie.Frames[2].Commands);
	}

	[Fact(Timeout = 10000)]
	public async Task WriteAsync_RoundTrips() {
		var original = new TasMovie {
			Metadata = new TasMetadata {
				RerecordCount = 42,
				RomFilename = "test.nes",
				Region = GameRegion.Ntsc,
			},
			System = GameSystem.Nes,
			Controllers = [
				new ControllerInfo { Port = 0, Type = ControllerType.Gamepad },
				new ControllerInfo { Port = 1, Type = ControllerType.Gamepad },
			],
			Frames = [
				new TasFrame {
					FrameNumber = 0,
					Inputs = [
						new ControllerInput { Port = 0, RawButtons = 0 },
						new ControllerInput { Port = 1, RawButtons = 0 },
					],
				},
				new TasFrame {
					FrameNumber = 1,
					Inputs = [
						new ControllerInput { Port = 0, RawButtons = (uint)(NesButtons.A | NesButtons.Right) },
						new ControllerInput { Port = 1, RawButtons = 0 },
					],
				},
			],
		};

		// Write
		using var writeStream = new MemoryStream();
		await _format.WriteAsync(original, writeStream);

		// Read back
		writeStream.Position = 0;
		var roundTripped = await _format.ReadAsync(writeStream);

		Assert.Equal(original.Frames.Count, roundTripped.Frames.Count);
		Assert.Equal(
			original.Frames[1].Inputs[0].RawButtons,
			roundTripped.Frames[1].Inputs[0].RawButtons);
	}
}
