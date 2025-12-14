using System.Collections.ObjectModel;
using GameInfoTools.UI.Controls;
using GameInfoTools.UI.ViewModels;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Tests for the HeatmapControl.
/// </summary>
public class HeatmapControlTests {
	[Fact]
	public void HeatmapControl_DefaultColumns_Is64() {
		var control = new HeatmapControl();
		Assert.Equal(64, control.Columns);
	}

	[Fact]
	public void HeatmapControl_Cells_InitiallyNull() {
		var control = new HeatmapControl();
		Assert.Null(control.Cells);
	}

	[Fact]
	public void HeatmapControl_SetCells_UpdatesProperty() {
		var control = new HeatmapControl();
		var cells = new ObservableCollection<HeatmapCellInfo> {
			new HeatmapCellInfo(0, 256, 0.5, true, false),
			new HeatmapCellInfo(256, 256, 0.75, false, true)
		};

		control.Cells = cells;

		Assert.Equal(cells, control.Cells);
		Assert.Equal(2, control.Cells.Count);
	}

	[Fact]
	public void HeatmapControl_SetColumns_UpdatesProperty() {
		var control = new HeatmapControl();

		control.Columns = 32;

		Assert.Equal(32, control.Columns);
	}

	[Fact]
	public void HeatmapCellInfo_HasCode_ReturnsCodeType() {
		var cell = new HeatmapCellInfo(0, 256, 1.0, true, false);

		Assert.Equal("Code", cell.Type);
		Assert.True(cell.HasCode);
		Assert.False(cell.HasData);
	}

	[Fact]
	public void HeatmapCellInfo_HasData_ReturnsDataType() {
		var cell = new HeatmapCellInfo(0, 256, 1.0, false, true);

		Assert.Equal("Data", cell.Type);
		Assert.False(cell.HasCode);
		Assert.True(cell.HasData);
	}

	[Fact]
	public void HeatmapCellInfo_NoCodeOrData_ReturnsUnknownType() {
		var cell = new HeatmapCellInfo(0, 256, 0.0, false, false);

		Assert.Equal("Unknown", cell.Type);
	}

	[Fact]
	public void HeatmapCellInfo_OffsetHex_FormatsCorrectly() {
		var cell = new HeatmapCellInfo(0x1234, 256, 1.0, true, false);

		Assert.Equal("$001234", cell.OffsetHex);
	}

	[Fact]
	public void HeatmapCellInfo_IntensityDisplay_FormatsAsPercent() {
		var cell = new HeatmapCellInfo(0, 256, 0.75, true, false);

		Assert.Equal("75%", cell.IntensityDisplay);
	}
}
