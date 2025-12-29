using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Tests;

public class GameSystemTests {
	[Theory]
	[InlineData(GameSystem.Nes, GameRegion.Ntsc, 60.0988)]
	[InlineData(GameSystem.Nes, GameRegion.Pal, 50.0070)]
	[InlineData(GameSystem.Snes, GameRegion.Ntsc, 60.0988)]
	[InlineData(GameSystem.Snes, GameRegion.Pal, 50.0070)]
	[InlineData(GameSystem.GameBoy, GameRegion.Ntsc, 59.7275)]
	[InlineData(GameSystem.GameBoy, GameRegion.Pal, 59.7275)] // GB doesn't change with region
	public void GetFrameRate_ReturnsCorrectValue(GameSystem system, GameRegion region, double expected) {
		var actual = system.GetFrameRate(region);

		Assert.Equal(expected, actual, precision: 4);
	}

	[Theory]
	[InlineData(GameSystem.Nes, "NES")]
	[InlineData(GameSystem.Snes, "SNES")]
	[InlineData(GameSystem.GameBoy, "Game Boy")]
	[InlineData(GameSystem.GameBoyColor, "Game Boy Color")]
	[InlineData(GameSystem.GameBoyAdvance, "Game Boy Advance")]
	[InlineData(GameSystem.Genesis, "Genesis")]
	[InlineData(GameSystem.N64, "Nintendo 64")]
	[InlineData(GameSystem.PlayStation, "PlayStation")]
	public void GetDisplayName_ReturnsCorrectValue(GameSystem system, string expected) {
		var actual = system.GetDisplayName();

		Assert.Equal(expected, actual);
	}

	[Fact]
	public void GetFrameRate_UnknownSystem_ReturnsDefault60() {
		var actual = GameSystem.Unknown.GetFrameRate(GameRegion.Unknown);

		Assert.Equal(60.0, actual);
	}
}
