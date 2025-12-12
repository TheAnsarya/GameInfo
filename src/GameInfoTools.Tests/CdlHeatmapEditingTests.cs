using GameInfoTools.Analysis;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for CdlHeatmap editing functionality with undo support.
/// </summary>
public class CdlHeatmapEditingTests {

	private static byte[] CreateTestCdlData(int size = 0x1000) {
		var data = new byte[size];
		// First half: code
		for (int i = 0; i < size / 2; i++) {
			data[i] = 0x01;
		}
		// Second half: data
		for (int i = size / 2; i < size; i++) {
			data[i] = 0x02;
		}
		return data;
	}

	#region Constructor with Undo Tests

	[Fact]
	public void Constructor_WithUndoEnabled_HasUndoManager() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		Assert.NotNull(cdl.UndoManager);
		Assert.False(cdl.CanUndo);
		Assert.False(cdl.CanRedo);
	}

	[Fact]
	public void Constructor_WithoutUndo_NoUndoManager() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic);

		Assert.Null(cdl.UndoManager);
		Assert.False(cdl.CanUndo);
	}

	#endregion

	#region SetFlags Tests

	[Fact]
	public void SetFlags_ChangesFlag() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);

		Assert.Equal(CdlHeatmap.CdlFlags.Data, cdl.GetFlags(0));
	}

	[Fact]
	public void SetFlags_RecordsUndo() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);

		Assert.True(cdl.CanUndo);
	}

	[Fact]
	public void SetFlags_SameValue_DoesNotRecordUndo() {
		var data = CreateTestCdlData();
		data[0] = (byte)CdlHeatmap.CdlFlags.Code;
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Code);

		Assert.False(cdl.CanUndo);
	}

	[Fact]
	public void SetFlags_OutOfRange_ThrowsArgumentOutOfRangeException() {
		var data = CreateTestCdlData(0x100);
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		Assert.Throws<ArgumentOutOfRangeException>(() => cdl.SetFlags(-1, CdlHeatmap.CdlFlags.Code));
		Assert.Throws<ArgumentOutOfRangeException>(() => cdl.SetFlags(0x100, CdlHeatmap.CdlFlags.Code));
	}

	#endregion

	#region SetFlagsRange Tests

	[Fact]
	public void SetFlagsRange_ChangesMultipleBytes() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlagsRange(0x10, 0x10, CdlHeatmap.CdlFlags.None);

		for (int i = 0x10; i < 0x20; i++) {
			Assert.Equal(CdlHeatmap.CdlFlags.None, cdl.GetFlags(i));
		}
	}

	[Fact]
	public void SetFlagsRange_RecordsUndo() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlagsRange(0, 0x10, CdlHeatmap.CdlFlags.Data);

		Assert.True(cdl.CanUndo);
	}

	#endregion

	#region AddFlags/RemoveFlags Tests

	[Fact]
	public void AddFlags_CombinesWithExisting() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.AddFlags(0, CdlHeatmap.CdlFlags.Data);

		var flags = cdl.GetFlags(0);
		Assert.True((flags & CdlHeatmap.CdlFlags.Code) != 0);
		Assert.True((flags & CdlHeatmap.CdlFlags.Data) != 0);
	}

	[Fact]
	public void RemoveFlags_ClearsSpecificFlag() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.RemoveFlags(0, CdlHeatmap.CdlFlags.Code);

		Assert.Equal(CdlHeatmap.CdlFlags.None, cdl.GetFlags(0));
	}

	#endregion

	#region ClearOffset/ClearRange Tests

	[Fact]
	public void ClearOffset_SetsToNone() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.ClearOffset(0);

		Assert.Equal(CdlHeatmap.CdlFlags.None, cdl.GetFlags(0));
	}

	[Fact]
	public void ClearRange_SetsRangeToNone() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.ClearRange(0, 0x100);

		for (int i = 0; i < 0x100; i++) {
			Assert.Equal(CdlHeatmap.CdlFlags.None, cdl.GetFlags(i));
		}
	}

	#endregion

	#region MarkAsCode/MarkAsData Tests

	[Fact]
	public void MarkAsCode_SetsCodeFlag() {
		var data = new byte[0x100];
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.MarkAsCode(0);

		Assert.True(cdl.IsCode(0));
	}

	[Fact]
	public void MarkAsData_SetsDataFlag() {
		var data = new byte[0x100];
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.MarkAsData(0);

		Assert.True(cdl.IsData(0));
	}

	[Fact]
	public void MarkRangeAsCode_SetsCodeFlagForRange() {
		var data = new byte[0x100];
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.MarkRangeAsCode(0x10, 0x20);

		for (int i = 0x10; i < 0x30; i++) {
			Assert.True(cdl.IsCode(i));
		}
	}

	[Fact]
	public void MarkRangeAsData_SetsDataFlagForRange() {
		var data = new byte[0x100];
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.MarkRangeAsData(0x10, 0x20);

		for (int i = 0x10; i < 0x30; i++) {
			Assert.True(cdl.IsData(i));
		}
	}

	#endregion

	#region Undo Tests

	[Fact]
	public void Undo_RevertsSingleByteEdit() {
		var data = CreateTestCdlData();
		var originalFlag = (CdlHeatmap.CdlFlags)data[0];
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.None);
		cdl.Undo();

		Assert.Equal(originalFlag, cdl.GetFlags(0));
	}

	[Fact]
	public void Undo_RevertsRangeEdit() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.ClearRange(0, 0x10);
		cdl.Undo();

		Assert.Equal(CdlHeatmap.CdlFlags.Code, cdl.GetFlags(0));
	}

	[Fact]
	public void Undo_ReturnsDescription() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);
		var description = cdl.Undo();

		Assert.NotNull(description);
		Assert.Contains("$000000", description);
	}

	[Fact]
	public void Undo_NoHistory_ReturnsNull() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		var result = cdl.Undo();

		Assert.Null(result);
	}

	[Fact]
	public void Undo_MultipleEdits_RevertsInOrder() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);
		cdl.SetFlags(1, CdlHeatmap.CdlFlags.None);

		cdl.Undo(); // Revert offset 1
		cdl.Undo(); // Revert offset 0

		Assert.Equal(CdlHeatmap.CdlFlags.Code, cdl.GetFlags(0));
		Assert.Equal(CdlHeatmap.CdlFlags.Code, cdl.GetFlags(1));
	}

	#endregion

	#region Redo Tests

	[Fact]
	public void Redo_ReappliesEdit() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.None);
		cdl.Undo();
		cdl.Redo();

		Assert.Equal(CdlHeatmap.CdlFlags.None, cdl.GetFlags(0));
	}

	[Fact]
	public void Redo_NoHistory_ReturnsNull() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		var result = cdl.Redo();

		Assert.Null(result);
	}

	[Fact]
	public void Redo_AfterNewEdit_NotAvailable() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.None);
		cdl.Undo();
		cdl.SetFlags(1, CdlHeatmap.CdlFlags.None); // New edit clears redo

		Assert.False(cdl.CanRedo);
	}

	#endregion

	#region GetDescription Tests

	[Fact]
	public void GetUndoDescription_ReturnsNextUndoDescription() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);
		var desc = cdl.GetUndoDescription();

		Assert.NotNull(desc);
		Assert.Contains("$000000", desc);
	}

	[Fact]
	public void GetRedoDescription_AfterUndo_ReturnsDescription() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);
		cdl.Undo();
		var desc = cdl.GetRedoDescription();

		Assert.NotNull(desc);
	}

	#endregion

	#region ClearUndoHistory Tests

	[Fact]
	public void ClearUndoHistory_ClearsAll() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);
		cdl.Undo();
		cdl.ClearUndoHistory();

		Assert.False(cdl.CanUndo);
		Assert.False(cdl.CanRedo);
	}

	#endregion

	#region RecordUndo Parameter Tests

	[Fact]
	public void SetFlags_RecordUndoFalse_DoesNotRecordUndo() {
		var data = CreateTestCdlData();
		var cdl = new CdlHeatmap(data, CdlHeatmap.CdlFormat.Generic, enableUndo: true);

		cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data, recordUndo: false);

		Assert.False(cdl.CanUndo);
		Assert.Equal(CdlHeatmap.CdlFlags.Data, cdl.GetFlags(0));
	}

	#endregion

	#region FromFileEditable Tests

	[Fact]
	public void FromFileEditable_CreatesEditableInstance() {
		// Create a temp file
		var tempFile = Path.GetTempFileName();
		try {
			var data = CreateTestCdlData(0x100);
			File.WriteAllBytes(tempFile, data);

			var cdl = CdlHeatmap.FromFileEditable(tempFile, enableUndo: true);

			Assert.NotNull(cdl.UndoManager);
			cdl.SetFlags(0, CdlHeatmap.CdlFlags.Data);
			Assert.True(cdl.CanUndo);
		} finally {
			File.Delete(tempFile);
		}
	}

	#endregion
}
