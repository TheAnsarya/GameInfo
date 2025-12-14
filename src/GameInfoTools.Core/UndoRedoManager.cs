namespace GameInfoTools.Core;

/// <summary>
/// Generic undo/redo manager supporting any operation type.
/// </summary>
/// <typeparam name="T">The type representing an undoable/redoable action.</typeparam>
public class UndoRedoManager<T> where T : class {
	private readonly Stack<T> _undoStack = new();
	private readonly Stack<T> _redoStack = new();
	private readonly int _maxHistory;

	/// <summary>
	/// Event raised when an action is pushed to the undo stack.
	/// </summary>
	public event Action<T>? ActionPushed;

	/// <summary>
	/// Event raised when an undo operation is performed.
	/// </summary>
	public event Action<T>? Undone;

	/// <summary>
	/// Event raised when a redo operation is performed.
	/// </summary>
	public event Action<T>? Redone;

	/// <summary>
	/// Event raised when the undo/redo state changes.
	/// </summary>
	public event Action? StateChanged;

	/// <summary>
	/// Creates a new undo/redo manager.
	/// </summary>
	/// <param name="maxHistory">Maximum number of actions to keep in history. 0 = unlimited.</param>
	public UndoRedoManager(int maxHistory = 100) {
		_maxHistory = maxHistory;
	}

	/// <summary>
	/// Gets whether an undo operation is available.
	/// </summary>
	public bool CanUndo => _undoStack.Count > 0;

	/// <summary>
	/// Gets whether a redo operation is available.
	/// </summary>
	public bool CanRedo => _redoStack.Count > 0;

	/// <summary>
	/// Gets the current undo stack depth.
	/// </summary>
	public int UndoCount => _undoStack.Count;

	/// <summary>
	/// Gets the current redo stack depth.
	/// </summary>
	public int RedoCount => _redoStack.Count;

	/// <summary>
	/// Gets the most recent undoable action (without removing it).
	/// </summary>
	public T? PeekUndo() => _undoStack.Count > 0 ? _undoStack.Peek() : null;

	/// <summary>
	/// Gets the most recent redoable action (without removing it).
	/// </summary>
	public T? PeekRedo() => _redoStack.Count > 0 ? _redoStack.Peek() : null;

	/// <summary>
	/// Pushes an action onto the undo stack.
	/// </summary>
	/// <param name="action">The action to record.</param>
	public void Push(T action) {
		if (action is null) {
			throw new ArgumentNullException(nameof(action));
		}

		_undoStack.Push(action);
		_redoStack.Clear(); // Clear redo stack when new action is performed

		// Trim history if needed
		if (_maxHistory > 0) {
			TrimStack(_undoStack, _maxHistory);
		}

		ActionPushed?.Invoke(action);
		StateChanged?.Invoke();
	}

	/// <summary>
	/// Performs an undo operation.
	/// </summary>
	/// <returns>The action that was undone, or null if nothing to undo.</returns>
	public T? Undo() {
		if (_undoStack.Count == 0) {
			return null;
		}

		var action = _undoStack.Pop();
		_redoStack.Push(action);

		Undone?.Invoke(action);
		StateChanged?.Invoke();

		return action;
	}

	/// <summary>
	/// Performs a redo operation.
	/// </summary>
	/// <returns>The action that was redone, or null if nothing to redo.</returns>
	public T? Redo() {
		if (_redoStack.Count == 0) {
			return null;
		}

		var action = _redoStack.Pop();
		_undoStack.Push(action);

		Redone?.Invoke(action);
		StateChanged?.Invoke();

		return action;
	}

	/// <summary>
	/// Clears all undo and redo history.
	/// </summary>
	public void Clear() {
		_undoStack.Clear();
		_redoStack.Clear();
		StateChanged?.Invoke();
	}

	/// <summary>
	/// Clears only the undo history.
	/// </summary>
	public void ClearUndo() {
		_undoStack.Clear();
		StateChanged?.Invoke();
	}

	/// <summary>
	/// Clears only the redo history.
	/// </summary>
	public void ClearRedo() {
		_redoStack.Clear();
		StateChanged?.Invoke();
	}

	/// <summary>
	/// Gets all actions in the undo stack (most recent first).
	/// </summary>
	public IReadOnlyList<T> GetUndoHistory() => _undoStack.ToList();

	/// <summary>
	/// Gets all actions in the redo stack (most recent first).
	/// </summary>
	public IReadOnlyList<T> GetRedoHistory() => _redoStack.ToList();

	private static void TrimStack(Stack<T> stack, int maxSize) {
		if (stack.Count <= maxSize) return;

		var items = stack.ToArray();
		stack.Clear();

		// Keep most recent items (at the beginning of the array since it's a stack)
		for (int i = maxSize - 1; i >= 0; i--) {
			stack.Push(items[i]);
		}
	}
}

/// <summary>
/// Represents a single undoable edit operation.
/// </summary>
public record EditAction {
	/// <summary>
	/// Type of edit operation.
	/// </summary>
	public enum ActionType {
		/// <summary>Single byte edit.</summary>
		SingleByte,
		/// <summary>Range of bytes edited.</summary>
		RangeEdit,
		/// <summary>Fill operation.</summary>
		Fill,
		/// <summary>Pattern replacement.</summary>
		Replace,
		/// <summary>Cut operation.</summary>
		Cut,
		/// <summary>Paste operation.</summary>
		Paste,
		/// <summary>Delete operation.</summary>
		Delete,
		/// <summary>Insert operation.</summary>
		Insert,
		/// <summary>Clear/reset operation.</summary>
		Clear,
		/// <summary>Custom operation.</summary>
		Custom
	}

	/// <summary>
	/// Gets the type of action.
	/// </summary>
	public ActionType Type { get; init; }

	/// <summary>
	/// Gets the starting offset of the edit.
	/// </summary>
	public int Offset { get; init; }

	/// <summary>
	/// Gets the length of the edit.
	/// </summary>
	public int Length { get; init; }

	/// <summary>
	/// Gets the original data before the edit.
	/// </summary>
	public byte[] OldData { get; init; } = [];

	/// <summary>
	/// Gets the new data after the edit.
	/// </summary>
	public byte[] NewData { get; init; } = [];

	/// <summary>
	/// Gets an optional description of the action.
	/// </summary>
	public string? Description { get; init; }

	/// <summary>
	/// Gets the timestamp when the action was performed.
	/// </summary>
	public DateTime Timestamp { get; init; } = DateTime.Now;

	/// <summary>
	/// Creates a single byte edit action.
	/// </summary>
	public static EditAction SingleByteEdit(int offset, byte oldValue, byte newValue, string? description = null) =>
		new() {
			Type = ActionType.SingleByte,
			Offset = offset,
			Length = 1,
			OldData = [oldValue],
			NewData = [newValue],
			Description = description ?? $"Set byte at ${offset:X6}"
		};

	/// <summary>
	/// Creates a range edit action.
	/// </summary>
	public static EditAction RangeEdit(int offset, byte[] oldData, byte[] newData, string? description = null) =>
		new() {
			Type = ActionType.RangeEdit,
			Offset = offset,
			Length = oldData.Length,
			OldData = oldData,
			NewData = newData,
			Description = description ?? $"Edit ${offset:X6}-${offset + oldData.Length - 1:X6}"
		};

	/// <summary>
	/// Creates a fill action.
	/// </summary>
	public static EditAction FillEdit(int offset, byte[] oldData, byte fillValue, string? description = null) =>
		new() {
			Type = ActionType.Fill,
			Offset = offset,
			Length = oldData.Length,
			OldData = oldData,
			NewData = Enumerable.Repeat(fillValue, oldData.Length).ToArray(),
			Description = description ?? $"Fill ${offset:X6}-${offset + oldData.Length - 1:X6} with ${fillValue:X2}"
		};
}

/// <summary>
/// Specialized undo/redo manager for edit operations.
/// </summary>
public class EditUndoRedoManager : UndoRedoManager<EditAction> {
	private readonly Action<EditAction, bool>? _applyAction;

	/// <summary>
	/// Creates a new edit undo/redo manager.
	/// </summary>
	/// <param name="applyAction">Callback to apply an action. Second parameter is true for redo, false for undo.</param>
	/// <param name="maxHistory">Maximum history size.</param>
	public EditUndoRedoManager(Action<EditAction, bool>? applyAction = null, int maxHistory = 100)
		: base(maxHistory) {
		_applyAction = applyAction;
	}

	/// <summary>
	/// Records and optionally applies a new edit action.
	/// </summary>
	public void RecordEdit(EditAction action, bool apply = false) {
		Push(action);
		if (apply && _applyAction is not null) {
			_applyAction(action, true);
		}
	}

	/// <summary>
	/// Undoes the last action and applies the reverse.
	/// </summary>
	public EditAction? UndoWithApply() {
		var action = Undo();
		if (action is not null && _applyAction is not null) {
			_applyAction(action, false);
		}

		return action;
	}

	/// <summary>
	/// Redoes the last undone action and applies it.
	/// </summary>
	public EditAction? RedoWithApply() {
		var action = Redo();
		if (action is not null && _applyAction is not null) {
			_applyAction(action, true);
		}

		return action;
	}

	/// <summary>
	/// Gets a description of the current undo action.
	/// </summary>
	public string? GetUndoDescription() => PeekUndo()?.Description;

	/// <summary>
	/// Gets a description of the current redo action.
	/// </summary>
	public string? GetRedoDescription() => PeekRedo()?.Description;
}
