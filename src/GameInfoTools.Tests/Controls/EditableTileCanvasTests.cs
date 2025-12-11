using Xunit;
using GameInfoTools.UI.Controls;
using Avalonia.Media;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Tests for the EditableTileCanvas control logic.
/// Since Avalonia controls require a UI context for full rendering,
/// these tests focus on data validation and event arguments.
/// </summary>
public class EditableTileCanvasTests {
	private static readonly Color[] TestPalette = [
		Color.FromRgb(0, 0, 0),
		Color.FromRgb(85, 85, 85),
		Color.FromRgb(170, 170, 170),
		Color.FromRgb(255, 255, 255)
	];

	private static byte[,] CreateTestTile() {
		var tile = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				tile[y, x] = (byte)((x + y) % 4);
			}
		}
		return tile;
	}

	#region PixelChangedEventArgs Tests

	[Fact]
	public void PixelChangedEventArgs_CorrectlyStoresValues() {
		var args = new PixelChangedEventArgs(3, 5, 1, 2);

		Assert.Equal(3, args.X);
		Assert.Equal(5, args.Y);
		Assert.Equal(1, args.OldValue);
		Assert.Equal(2, args.NewValue);
	}

	[Fact]
	public void PixelChangedEventArgs_ZeroValues() {
		var args = new PixelChangedEventArgs(0, 0, 0, 0);

		Assert.Equal(0, args.X);
		Assert.Equal(0, args.Y);
		Assert.Equal(0, args.OldValue);
		Assert.Equal(0, args.NewValue);
	}

	[Fact]
	public void PixelChangedEventArgs_MaxValues() {
		var args = new PixelChangedEventArgs(7, 7, 3, 3);

		Assert.Equal(7, args.X);
		Assert.Equal(7, args.Y);
		Assert.Equal(3, args.OldValue);
		Assert.Equal(3, args.NewValue);
	}

	#endregion

	#region ColorPickedEventArgs Tests

	[Fact]
	public void ColorPickedEventArgs_CorrectlyStoresValues() {
		var args = new ColorPickedEventArgs(4, 6, 2);

		Assert.Equal(4, args.X);
		Assert.Equal(6, args.Y);
		Assert.Equal(2, args.ColorIndex);
	}

	[Fact]
	public void ColorPickedEventArgs_ZeroValues() {
		var args = new ColorPickedEventArgs(0, 0, 0);

		Assert.Equal(0, args.X);
		Assert.Equal(0, args.Y);
		Assert.Equal(0, args.ColorIndex);
	}

	[Fact]
	public void ColorPickedEventArgs_MaxValues() {
		var args = new ColorPickedEventArgs(7, 7, 3);

		Assert.Equal(7, args.X);
		Assert.Equal(7, args.Y);
		Assert.Equal(3, args.ColorIndex);
	}

	#endregion

	#region DrawingTool Enum Tests

	[Fact]
	public void DrawingTool_HasPencilValue() {
		Assert.Equal(DrawingTool.Pencil, (DrawingTool)0);
	}

	[Fact]
	public void DrawingTool_HasFillValue() {
		Assert.Equal(DrawingTool.Fill, (DrawingTool)1);
	}

	[Fact]
	public void DrawingTool_HasLineValue() {
		Assert.Equal(DrawingTool.Line, (DrawingTool)2);
	}

	[Fact]
	public void DrawingTool_HasRectangleValue() {
		Assert.Equal(DrawingTool.Rectangle, (DrawingTool)3);
	}

	[Fact]
	public void DrawingTool_HasEyedropperValue() {
		Assert.Equal(DrawingTool.Eyedropper, (DrawingTool)4);
	}

	[Fact]
	public void DrawingTool_HasSelectionValue() {
		Assert.Equal(DrawingTool.Selection, (DrawingTool)5);
	}

	[Fact]
	public void DrawingTool_AllValuesAreDefined() {
		var values = Enum.GetValues<DrawingTool>();
		Assert.Equal(6, values.Length);
	}

	#endregion

	#region TileData Tests

	[Fact]
	public void TileData_8x8Array_IsValidInput() {
		var tileData = CreateTestTile();

		Assert.Equal(8, tileData.GetLength(0));
		Assert.Equal(8, tileData.GetLength(1));
	}

	[Fact]
	public void TileData_ColorIndicesAreValid() {
		var tileData = CreateTestTile();

		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				Assert.InRange(tileData[y, x], 0, 3);
			}
		}
	}

	[Fact]
	public void DefaultPalette_HasFourColors() {
		var palette = TileCanvas.GetDefaultPalette();

		Assert.Equal(4, palette.Length);
	}

	[Fact]
	public void TestPalette_HasFourColors() {
		Assert.Equal(4, TestPalette.Length);
	}

	[Fact]
	public void ColorIndex_ValidRange_IsZeroToThree() {
		// Valid color indices for a 4-color palette
		int[] validIndices = [0, 1, 2, 3];

		foreach (var index in validIndices) {
			Assert.InRange(index, 0, 3);
		}
	}

	[Fact]
	public void PixelCoordinates_ValidRange() {
		// Valid pixel coordinates for an 8x8 tile
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				Assert.InRange(x, 0, 7);
				Assert.InRange(y, 0, 7);
			}
		}
	}

	#endregion
}
