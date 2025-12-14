using GameInfoTools.UI.ViewModels;
using Xunit;

namespace GameInfoTools.Tests.ViewModels;

/// <summary>
/// Tests for MapEditorViewModel layer system features (Issue #31).
/// </summary>
public class MapEditorLayerTests {
	#region Layer Management Tests

	[Fact]
	public void AddLayer_CreatesNewLayerWithCorrectIndex() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		var initialCount = vm.Layers.Count;

		// Act
		vm.AddLayerCommand.Execute(null);

		// Assert
		Assert.Equal(initialCount + 1, vm.Layers.Count);
		Assert.Equal(initialCount, vm.Layers[^1].Index);
	}

	[Fact]
	public void RemoveLayer_RemovesLayerAtIndex() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.AddLayerCommand.Execute(null);
		vm.AddLayerCommand.Execute(null);
		var initialCount = vm.Layers.Count;

		// Act
		vm.RemoveLayerCommand.Execute(1);

		// Assert
		Assert.Equal(initialCount - 1, vm.Layers.Count);
	}

	[Fact]
	public void RemoveLayer_DoesNotRemoveLastLayer() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.RemoveLayerCommand.Execute(0);

		// Assert - Should still have 1 layer
		Assert.Single(vm.Layers);
	}

	[Fact]
	public void MoveLayerUp_MovesLayerToHigherPosition() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.AddLayerCommand.Execute(null);
		var layer1Name = vm.Layers[1].Name;

		// Act
		vm.MoveLayerUpCommand.Execute(1);

		// Assert
		Assert.Equal(layer1Name, vm.Layers[0].Name);
	}

	[Fact]
	public void MoveLayerDown_MovesLayerToLowerPosition() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.AddLayerCommand.Execute(null);
		var layer0Name = vm.Layers[0].Name;

		// Act
		vm.MoveLayerDownCommand.Execute(0);

		// Assert
		Assert.Equal(layer0Name, vm.Layers[1].Name);
	}

	[Fact]
	public void DuplicateLayer_CreatesExactCopy() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		var originalName = vm.Layers[0].Name;

		// Act
		vm.DuplicateLayerCommand.Execute(0);

		// Assert
		Assert.Equal(2, vm.Layers.Count);
		Assert.Contains("Copy", vm.Layers[1].Name);
		Assert.Equal(vm.Layers[0].Opacity, vm.Layers[1].Opacity);
	}

	#endregion

	#region Layer Visibility Tests

	[Fact]
	public void ToggleLayerVisibility_TogglesVisibleState() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		var initialVisibility = vm.Layers[0].IsVisible;

		// Act
		vm.ToggleLayerVisibilityCommand.Execute(0);

		// Assert
		Assert.NotEqual(initialVisibility, vm.Layers[0].IsVisible);
	}

	[Fact]
	public void ToggleLayerLock_TogglesLockedState() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		var initialLock = vm.Layers[0].IsLocked;

		// Act
		vm.ToggleLayerLockCommand.Execute(0);

		// Assert
		Assert.NotEqual(initialLock, vm.Layers[0].IsLocked);
	}

	[Fact]
	public void SetLayerOpacity_UpdatesOpacity() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.SetLayerOpacity(0, 0.5);

		// Assert
		Assert.Equal(0.5, vm.Layers[0].Opacity, precision: 2);
	}

	[Fact]
	public void SetLayerOpacity_ClampsToValidRange() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.SetLayerOpacity(0, 1.5);

		// Assert
		Assert.Equal(1.0, vm.Layers[0].Opacity, precision: 2);
	}

	#endregion

	#region Layer Properties Tests

	[Fact]
	public void RenameLayer_UpdatesLayerName() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.RenameLayer(0, "Custom Name");

		// Assert
		Assert.Equal("Custom Name", vm.Layers[0].Name);
	}

	[Fact]
	public void SetLayerDataOffset_UpdatesOffset() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.SetLayerDataOffset(0, 0x8000);

		// Assert
		Assert.Equal(0x8000, vm.Layers[0].DataOffset);
	}

	[Fact]
	public void SetLayerTileFormat_UpdatesFormat() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.SetLayerTileFormat(0, LayerTileFormat.TileAndAttribute);

		// Assert
		Assert.Equal(LayerTileFormat.TileAndAttribute, vm.Layers[0].TileFormat);
		Assert.Equal(2, vm.Layers[0].BytesPerTile); // TileAndAttribute uses 2 bytes
	}

	[Fact]
	public void SetLayerBlendMode_UpdatesBlendMode() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.SetLayerBlendMode(0, LayerBlendMode.Multiply);

		// Assert
		Assert.Equal(LayerBlendMode.Multiply, vm.Layers[0].BlendMode);
	}

	[Fact]
	public void SetLayerZOrder_UpdatesZOrder() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.SetLayerZOrder(0, 10);

		// Assert
		Assert.Equal(10, vm.Layers[0].ZOrder);
	}

	#endregion

	#region Layer Data Tests

	[Fact]
	public void GetCompositeMapData_BlendsSingleLayer() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 4;
		vm.MapHeight = 4;

		// Manually set layer data
		var layerData = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };
		vm.SetLayerData(0, layerData);

		// Act
		var composite = vm.GetCompositeMapData();

		// Assert
		Assert.Equal(16, composite.Length);
		Assert.Equal(1, composite[0]);
		Assert.Equal(16, composite[15]);
	}

	[Fact]
	public void GetCompositeMapData_MultipleLayersWithTransparency() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.AddLayerCommand.Execute(null);

		// Layer 0: background
		var bg = new byte[] { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };
		vm.SetLayerData(0, bg);

		// Layer 1: sparse (0 = transparent when opacity < 1.0)
		var fg = new byte[] { 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2 };
		vm.SetLayerData(1, fg);
		vm.SetLayerOpacity(1, 0.5); // Must be < 1.0 for transparency to work

		// Act
		var composite = vm.GetCompositeMapData();

		// Assert - Non-zero values from fg should override bg, zero allows bg through
		Assert.Equal(1, composite[0]); // bg shows through (0 is transparent at < 1.0 opacity)
		Assert.Equal(2, composite[1]); // fg value
	}

	[Fact]
	public void GetLayerDiffData_IdenticalLayers_AllZero() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.AddLayerCommand.Execute(null);

		var data = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };
		vm.SetLayerData(0, data);
		vm.SetLayerData(1, (byte[])data.Clone());

		// Act
		var diff = vm.GetLayerDiffData(0, 1);

		// Assert - All zeros means all same
		Assert.All(diff, b => Assert.Equal(0, b));
	}

	[Fact]
	public void GetLayerDiffData_DifferentLayers_ShowsDifferences() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.AddLayerCommand.Execute(null);

		var data1 = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };
		var data2 = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8, 99, 99, 99, 99, 13, 14, 15, 16 };
		vm.SetLayerData(0, data1);
		vm.SetLayerData(1, data2);

		// Act
		var diff = vm.GetLayerDiffData(0, 1);

		// Assert
		Assert.Equal(0, diff[0]); // Same
		Assert.Equal(0, diff[7]); // Same
		Assert.Equal(255, diff[8]); // Different
		Assert.Equal(255, diff[9]); // Different
		Assert.Equal(0, diff[12]); // Same
	}

	#endregion

	#region Layer Operations Tests

	[Fact]
	public void MergeLayers_CombinesSpecificLayers() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 4;
		vm.MapHeight = 1;
		vm.AddLayerCommand.Execute(null);
		vm.AddLayerCommand.Execute(null);

		vm.SetLayerData(0, [1, 0, 1, 0]);
		vm.SetLayerData(1, [0, 2, 0, 2]);
		vm.SetLayerData(2, [0, 0, 3, 3]);

		// Act - merge layers 0 and 2 only
		var merged = vm.MergeLayers(0, 2);

		// Assert
		Assert.Equal(4, merged.Length);
		Assert.Equal(1, merged[0]); // From layer 0
		Assert.Equal(0, merged[1]); // Transparent (neither 0 nor 2 has data)
		Assert.Equal(3, merged[2]); // From layer 2 (higher z-order)
		Assert.Equal(3, merged[3]); // From layer 2
	}

	[Fact]
	public void FlattenLayers_CombinesAllIntoOne() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 2;
		vm.MapHeight = 2;
		vm.AddLayerCommand.Execute(null);

		vm.SetLayerData(0, [1, 1, 1, 1]);
		vm.SetLayerData(1, [0, 2, 0, 2]);

		// Act
		vm.FlattenLayersCommand.Execute(null);

		// Assert
		Assert.Single(vm.Layers);
		Assert.Equal("Flattened", vm.Layers[0].Name);
		Assert.NotNull(vm.Layers[0].Data);
	}

	[Fact]
	public void CreateLayerFromSelection_CreatesNewLayer() {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 4;
		vm.MapHeight = 4;
		vm.MapDataArray = new byte[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16 };

		// Set selection
		vm.SelectionStartX = 1;
		vm.SelectionStartY = 1;
		vm.SelectionEndX = 2;
		vm.SelectionEndY = 2;

		var initialCount = vm.Layers.Count;

		// Act
		vm.CreateLayerFromSelectionCommand.Execute(null);

		// Assert
		Assert.Equal(initialCount + 1, vm.Layers.Count);
		Assert.Contains("Selection", vm.Layers[^1].Name);
	}

	#endregion

	#region Layer Blend Mode Tests

	[Theory]
	[InlineData(LayerBlendMode.Normal)]
	[InlineData(LayerBlendMode.Multiply)]
	[InlineData(LayerBlendMode.Screen)]
	[InlineData(LayerBlendMode.Overlay)]
	[InlineData(LayerBlendMode.Difference)]
	public void GetCompositeMapData_AppliesBlendMode(LayerBlendMode mode) {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();
		vm.MapWidth = 2;
		vm.MapHeight = 2;
		vm.AddLayerCommand.Execute(null);

		vm.SetLayerData(0, [128, 128, 128, 128]);
		vm.SetLayerData(1, [64, 64, 64, 64]);
		vm.SetLayerBlendMode(1, mode);

		// Act
		var composite = vm.GetCompositeMapData();

		// Assert - Just verify it produces output without crashing
		Assert.Equal(4, composite.Length);
	}

	#endregion

	#region Tile Format Tests

	[Theory]
	[InlineData(LayerTileFormat.TileIndex, 1)]
	[InlineData(LayerTileFormat.TileAndAttribute, 2)]
	[InlineData(LayerTileFormat.Metatile, 1)]
	[InlineData(LayerTileFormat.CompressedRle, 1)]
	public void SetLayerTileFormat_SetsBytesPerTileCorrectly(LayerTileFormat format, int expectedBytes) {
		// Arrange
		var vm = new MapEditorViewModel();
		vm.InitializeForTesting();

		// Act
		vm.SetLayerTileFormat(0, format);

		// Assert
		Assert.Equal(expectedBytes, vm.Layers[0].BytesPerTile);
	}

	#endregion

	#region Record Tests

	[Fact]
	public void MapLayer_Record_WithExpression_PreservesValues() {
		// Arrange
		var original = new MapLayer(
			"Test",
			0,
			true,
			false,
			0.8,
			0x1000,
			[1, 2, 3],
			LayerTileFormat.TileAndAttribute,
			LayerBlendMode.Screen,
			5,
			2
		);

		// Act
		var modified = original with { Name = "Modified" };

		// Assert
		Assert.Equal("Modified", modified.Name);
		Assert.Equal(original.Index, modified.Index);
		Assert.Equal(original.IsVisible, modified.IsVisible);
		Assert.Equal(original.Opacity, modified.Opacity);
		Assert.Equal(original.TileFormat, modified.TileFormat);
		Assert.Equal(original.BlendMode, modified.BlendMode);
	}

	[Fact]
	public void LayerTileFormat_AllValuesAreDefined() {
		// Assert
		Assert.Equal(5, Enum.GetValues<LayerTileFormat>().Length);
	}

	[Fact]
	public void LayerBlendMode_AllValuesAreDefined() {
		// Assert
		Assert.Equal(5, Enum.GetValues<LayerBlendMode>().Length);
	}

	#endregion
}

/// <summary>
/// Extension methods for testing MapEditorViewModel.
/// </summary>
public static class MapEditorViewModelTestExtensions {
	/// <summary>
	/// Initialize the view model for testing (without ROM).
	/// </summary>
	public static void InitializeForTesting(this MapEditorViewModel vm) {
		// Trigger initialization by setting map dimensions
		vm.MapWidth = 16;
		vm.MapHeight = 16;
		vm.MapDataOffset = 0;

		// Ensure at least one layer exists
		if (vm.Layers.Count == 0) {
			vm.AddLayerCommand.Execute(null);
		}
	}

	/// <summary>
	/// Set layer data directly for testing.
	/// </summary>
	public static void SetLayerData(this MapEditorViewModel vm, int index, byte[] data) {
		if (index < 0 || index >= vm.Layers.Count) return;
		var layer = vm.Layers[index];
		vm.Layers[index] = layer with { Data = data };
	}
}
