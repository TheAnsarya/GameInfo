using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for the UndoRedoManager class.
/// </summary>
public class UndoRedoManagerTests {

	#region Constructor Tests

	[Fact]
	public void Constructor_Default_CreatesEmptyManager() {
		var manager = new UndoRedoManager<string>();

		Assert.False(manager.CanUndo);
		Assert.False(manager.CanRedo);
		Assert.Equal(0, manager.UndoCount);
		Assert.Equal(0, manager.RedoCount);
	}

	[Fact]
	public void Constructor_WithMaxHistory_LimitsStackSize() {
		var manager = new UndoRedoManager<string>(maxHistory: 3);

		manager.Push("1");
		manager.Push("2");
		manager.Push("3");
		manager.Push("4"); // Should trim oldest

		Assert.Equal(3, manager.UndoCount);
	}

	#endregion

	#region Push Tests

	[Fact]
	public void Push_SingleItem_CanUndo() {
		var manager = new UndoRedoManager<string>();

		manager.Push("action");

		Assert.True(manager.CanUndo);
		Assert.Equal(1, manager.UndoCount);
	}

	[Fact]
	public void Push_ClearsRedoStack() {
		var manager = new UndoRedoManager<string>();

		manager.Push("action1");
		manager.Undo();
		Assert.True(manager.CanRedo);

		manager.Push("action2");
		Assert.False(manager.CanRedo);
	}

	[Fact]
	public void Push_NullAction_ThrowsArgumentNullException() {
		var manager = new UndoRedoManager<string>();

		Assert.Throws<ArgumentNullException>(() => manager.Push(null!));
	}

	[Fact]
	public void Push_RaisesActionPushedEvent() {
		var manager = new UndoRedoManager<string>();
		string? pushedAction = null;
		manager.ActionPushed += a => pushedAction = a;

		manager.Push("test");

		Assert.Equal("test", pushedAction);
	}

	#endregion

	#region Undo Tests

	[Fact]
	public void Undo_WithItems_ReturnsAction() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");

		var result = manager.Undo();

		Assert.Equal("action", result);
		Assert.False(manager.CanUndo);
		Assert.True(manager.CanRedo);
	}

	[Fact]
	public void Undo_EmptyStack_ReturnsNull() {
		var manager = new UndoRedoManager<string>();

		var result = manager.Undo();

		Assert.Null(result);
	}

	[Fact]
	public void Undo_MovesToRedoStack() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");

		manager.Undo();

		Assert.Equal(1, manager.RedoCount);
		Assert.Equal(0, manager.UndoCount);
	}

	[Fact]
	public void Undo_RaisesUndoneEvent() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		string? undoneAction = null;
		manager.Undone += a => undoneAction = a;

		manager.Undo();

		Assert.Equal("action", undoneAction);
	}

	#endregion

	#region Redo Tests

	[Fact]
	public void Redo_AfterUndo_ReturnsAction() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		manager.Undo();

		var result = manager.Redo();

		Assert.Equal("action", result);
		Assert.True(manager.CanUndo);
		Assert.False(manager.CanRedo);
	}

	[Fact]
	public void Redo_EmptyStack_ReturnsNull() {
		var manager = new UndoRedoManager<string>();

		var result = manager.Redo();

		Assert.Null(result);
	}

	[Fact]
	public void Redo_MovesToUndoStack() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		manager.Undo();

		manager.Redo();

		Assert.Equal(1, manager.UndoCount);
		Assert.Equal(0, manager.RedoCount);
	}

	[Fact]
	public void Redo_RaisesRedoneEvent() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		manager.Undo();
		string? redoneAction = null;
		manager.Redone += a => redoneAction = a;

		manager.Redo();

		Assert.Equal("action", redoneAction);
	}

	#endregion

	#region Peek Tests

	[Fact]
	public void PeekUndo_ReturnsNextUndoAction() {
		var manager = new UndoRedoManager<string>();
		manager.Push("first");
		manager.Push("second");

		var peek = manager.PeekUndo();

		Assert.Equal("second", peek);
		Assert.Equal(2, manager.UndoCount); // Stack unchanged
	}

	[Fact]
	public void PeekRedo_ReturnsNextRedoAction() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		manager.Undo();

		var peek = manager.PeekRedo();

		Assert.Equal("action", peek);
		Assert.Equal(1, manager.RedoCount); // Stack unchanged
	}

	#endregion

	#region Clear Tests

	[Fact]
	public void Clear_RemovesAllHistory() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action1");
		manager.Push("action2");
		manager.Undo();

		manager.Clear();

		Assert.False(manager.CanUndo);
		Assert.False(manager.CanRedo);
	}

	[Fact]
	public void ClearUndo_OnlyClearsUndoStack() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		manager.Undo();

		manager.ClearUndo();

		Assert.False(manager.CanUndo);
		Assert.True(manager.CanRedo);
	}

	[Fact]
	public void ClearRedo_OnlyClearsRedoStack() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		manager.Undo();

		manager.ClearRedo();

		Assert.False(manager.CanRedo);
	}

	#endregion

	#region History Tests

	[Fact]
	public void GetUndoHistory_ReturnsActionsInOrder() {
		var manager = new UndoRedoManager<string>();
		manager.Push("first");
		manager.Push("second");
		manager.Push("third");

		var history = manager.GetUndoHistory();

		Assert.Equal(3, history.Count);
		Assert.Equal("third", history[0]); // Most recent first
		Assert.Equal("second", history[1]);
		Assert.Equal("first", history[2]);
	}

	[Fact]
	public void GetRedoHistory_ReturnsActionsInOrder() {
		var manager = new UndoRedoManager<string>();
		manager.Push("first");
		manager.Push("second");
		manager.Undo();
		manager.Undo();

		var history = manager.GetRedoHistory();

		Assert.Equal(2, history.Count);
		Assert.Equal("first", history[0]); // Most recently undone first
		Assert.Equal("second", history[1]);
	}

	#endregion

	#region StateChanged Event Tests

	[Fact]
	public void StateChanged_RaisedOnPush() {
		var manager = new UndoRedoManager<string>();
		bool stateChanged = false;
		manager.StateChanged += () => stateChanged = true;

		manager.Push("action");

		Assert.True(stateChanged);
	}

	[Fact]
	public void StateChanged_RaisedOnUndo() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		bool stateChanged = false;
		manager.StateChanged += () => stateChanged = true;

		manager.Undo();

		Assert.True(stateChanged);
	}

	[Fact]
	public void StateChanged_RaisedOnRedo() {
		var manager = new UndoRedoManager<string>();
		manager.Push("action");
		manager.Undo();
		bool stateChanged = false;
		manager.StateChanged += () => stateChanged = true;

		manager.Redo();

		Assert.True(stateChanged);
	}

	#endregion
}

/// <summary>
/// Tests for the EditAction record.
/// </summary>
public class EditActionTests {

	[Fact]
	public void SingleByteEdit_CreatesCorrectAction() {
		var action = EditAction.SingleByteEdit(0x100, 0xAA, 0xBB, "test");

		Assert.Equal(EditAction.ActionType.SingleByte, action.Type);
		Assert.Equal(0x100, action.Offset);
		Assert.Equal(1, action.Length);
		Assert.Single(action.OldData);
		Assert.Single(action.NewData);
		Assert.Equal(0xAA, action.OldData[0]);
		Assert.Equal(0xBB, action.NewData[0]);
	}

	[Fact]
	public void RangeEdit_CreatesCorrectAction() {
		var oldData = new byte[] { 0x01, 0x02, 0x03 };
		var newData = new byte[] { 0x04, 0x05, 0x06 };
		var action = EditAction.RangeEdit(0x200, oldData, newData);

		Assert.Equal(EditAction.ActionType.RangeEdit, action.Type);
		Assert.Equal(0x200, action.Offset);
		Assert.Equal(3, action.Length);
		Assert.Equal(oldData, action.OldData);
		Assert.Equal(newData, action.NewData);
	}

	[Fact]
	public void FillEdit_CreatesCorrectAction() {
		var oldData = new byte[] { 0x01, 0x02, 0x03 };
		var action = EditAction.FillEdit(0x300, oldData, 0xFF);

		Assert.Equal(EditAction.ActionType.Fill, action.Type);
		Assert.Equal(0x300, action.Offset);
		Assert.Equal(3, action.Length);
		Assert.Equal(oldData, action.OldData);
		Assert.All(action.NewData, b => Assert.Equal(0xFF, b));
	}
}

/// <summary>
/// Tests for EditUndoRedoManager.
/// </summary>
public class EditUndoRedoManagerTests {

	[Fact]
	public void RecordEdit_PushesAction() {
		var manager = new EditUndoRedoManager();
		var action = EditAction.SingleByteEdit(0, 0, 1);

		manager.RecordEdit(action);

		Assert.True(manager.CanUndo);
		Assert.Equal("Set byte at $000000", manager.GetUndoDescription());
	}

	[Fact]
	public void GetUndoDescription_ReturnsCurrentDescription() {
		var manager = new EditUndoRedoManager();
		manager.RecordEdit(EditAction.SingleByteEdit(0x100, 0, 1, "Custom description"));

		Assert.Equal("Custom description", manager.GetUndoDescription());
	}

	[Fact]
	public void GetRedoDescription_AfterUndo_ReturnsDescription() {
		var manager = new EditUndoRedoManager();
		manager.RecordEdit(EditAction.SingleByteEdit(0x100, 0, 1, "Custom description"));
		manager.Undo();

		Assert.Equal("Custom description", manager.GetRedoDescription());
	}

	[Fact]
	public void UndoWithApply_CallsApplyAction() {
		bool applyCalled = false;
		bool wasRedo = true;
		var manager = new EditUndoRedoManager((action, isRedo) => {
			applyCalled = true;
			wasRedo = isRedo;
		});
		manager.RecordEdit(EditAction.SingleByteEdit(0, 0, 1));

		manager.UndoWithApply();

		Assert.True(applyCalled);
		Assert.False(wasRedo); // Should be undo, not redo
	}

	[Fact]
	public void RedoWithApply_CallsApplyAction() {
		bool applyCalled = false;
		bool wasRedo = false;
		var manager = new EditUndoRedoManager((action, isRedo) => {
			applyCalled = true;
			wasRedo = isRedo;
		});
		manager.RecordEdit(EditAction.SingleByteEdit(0, 0, 1));
		manager.Undo();
		applyCalled = false;

		manager.RedoWithApply();

		Assert.True(applyCalled);
		Assert.True(wasRedo);
	}
}
