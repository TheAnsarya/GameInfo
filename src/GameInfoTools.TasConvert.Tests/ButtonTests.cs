using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Tests;

public class ButtonTests {
	[Fact]
	public void SnesButtons_ToDisplayString_AllPressed() {
		var buttons = SnesButtons.B | SnesButtons.Y | SnesButtons.Select | SnesButtons.Start |
			SnesButtons.Up | SnesButtons.Down | SnesButtons.Left | SnesButtons.Right |
			SnesButtons.A | SnesButtons.X | SnesButtons.L | SnesButtons.R;

		var result = buttons.ToDisplayString();

		Assert.Equal("BYsSUDLRAXlr", result);
	}

	[Fact]
	public void SnesButtons_ToDisplayString_None() {
		var result = SnesButtons.None.ToDisplayString();

		Assert.Equal(".............", result);
	}

	[Fact]
	public void NesButtons_ToDisplayString_AllPressed() {
		var buttons = NesButtons.A | NesButtons.B | NesButtons.Select | NesButtons.Start |
			NesButtons.Up | NesButtons.Down | NesButtons.Left | NesButtons.Right;

		var result = buttons.ToDisplayString();

		Assert.Equal("ABsSUDLR", result);
	}

	[Fact]
	public void NesButtons_ToDisplayString_None() {
		var result = NesButtons.None.ToDisplayString();

		Assert.Equal("........", result);
	}

	[Fact]
	public void GbButtons_ToDisplayString_AllPressed() {
		var buttons = GbButtons.A | GbButtons.B | GbButtons.Select | GbButtons.Start |
			GbButtons.Up | GbButtons.Down | GbButtons.Left | GbButtons.Right;

		var result = buttons.ToDisplayString();

		// GB uses same format as NES
		Assert.Equal(8, result.Length);
	}

	[Fact]
	public void GbButtons_ToDisplayString_None() {
		var result = GbButtons.None.ToDisplayString();

		Assert.Equal("........", result);
	}
}
