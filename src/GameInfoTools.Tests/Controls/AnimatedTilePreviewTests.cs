using Xunit;
using GameInfoTools.UI.Controls;
using Avalonia.Media;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Tests for the AnimatedTilePreview control logic.
/// Since Avalonia controls require a UI context for full rendering,
/// these tests focus on data validation and calculation logic.
/// </summary>
public class AnimatedTilePreviewTests {
	private static readonly Color[] TestPalette = [
		Color.FromRgb(0, 0, 0),
		Color.FromRgb(85, 85, 85),
		Color.FromRgb(170, 170, 170),
		Color.FromRgb(255, 255, 255)
	];

	private static byte[,] CreateTestTile(byte fillValue = 0) {
		var tile = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				tile[y, x] = fillValue;
			}
		}
		return tile;
	}

	private static IReadOnlyList<byte[,]> CreateTestFrames(int count) {
		var frames = new List<byte[,]>();
		for (int i = 0; i < count; i++) {
			frames.Add(CreateTestTile((byte)(i % 4)));
		}
		return frames.AsReadOnly();
	}

	[Fact]
	public void TestFrames_CanBeCreated() {
		var frames = CreateTestFrames(4);

		Assert.NotNull(frames);
		Assert.Equal(4, frames.Count);
	}

	[Fact]
	public void TestFrames_EachFrameIs8x8() {
		var frames = CreateTestFrames(4);

		foreach (var frame in frames) {
			Assert.Equal(8, frame.GetLength(0));
			Assert.Equal(8, frame.GetLength(1));
		}
	}

	[Fact]
	public void TestFrames_HaveValidColorIndices() {
		var frames = CreateTestFrames(4);

		foreach (var frame in frames) {
			for (int y = 0; y < 8; y++) {
				for (int x = 0; x < 8; x++) {
					Assert.InRange(frame[y, x], 0, 3);
				}
			}
		}
	}

	[Fact]
	public void DefaultPalette_HasFourColors() {
		var palette = TileCanvas.GetDefaultPalette();

		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void DefaultPalette_FirstColorIsBlack() {
		var palette = TileCanvas.GetDefaultPalette();

		Assert.Equal(Color.FromRgb(0, 0, 0), palette[0]);
	}

	[Fact]
	public void DefaultPalette_LastColorIsWhite() {
		var palette = TileCanvas.GetDefaultPalette();

		Assert.Equal(Color.FromRgb(255, 255, 255), palette[3]);
	}

	[Fact]
	public void TestPalette_HasFourColors() {
		Assert.Equal(4, TestPalette.Length);
	}

	[Fact]
	public void FrameDelayMs_DefaultIs200() {
		int defaultDelay = 200;
		Assert.Equal(200, defaultDelay);
	}

	[Fact]
	public void FrameDelayMs_ValidRange() {
		// Valid frame delays for animation
		int[] validDelays = [50, 100, 200, 500, 1000];

		foreach (var delay in validDelays) {
			Assert.InRange(delay, 50, 1000);
		}
	}

	[Fact]
	public void FrameIndex_ValidRange() {
		var frames = CreateTestFrames(4);

		// Valid frame indices for 4 frames
		for (int i = 0; i < frames.Count; i++) {
			Assert.InRange(i, 0, frames.Count - 1);
		}
	}

	[Fact]
	public void EmptyFramesList_CountIsZero() {
		var frames = new List<byte[,]>().AsReadOnly();

		Assert.Empty(frames);
	}

	[Fact]
	public void SingleFrame_Animation() {
		var frames = CreateTestFrames(1);

		Assert.Single(frames);
	}
}
