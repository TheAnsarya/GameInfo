namespace GameInfoTools.Core.Commands;

/// <summary>
/// Interface for undoable commands.
/// </summary>
public interface IUndoableCommand {
	/// <summary>
	/// Gets a description of the command for display.
	/// </summary>
	string Description { get; }

	/// <summary>
	/// Executes the command.
	/// </summary>
	void Execute();

	/// <summary>
	/// Undoes the command, restoring the previous state.
	/// </summary>
	void Undo();
}

/// <summary>
/// Manages undo/redo history for a sequence of commands.
/// </summary>
public class UndoRedoManager {
	private readonly Stack<IUndoableCommand> _undoStack = new();
	private readonly Stack<IUndoableCommand> _redoStack = new();
	private readonly int _maxHistorySize;

	/// <summary>
	/// Occurs when the undo/redo state changes.
	/// </summary>
	public event EventHandler? StateChanged;

	/// <summary>
	/// Creates a new undo/redo manager.
	/// </summary>
	/// <param name="maxHistorySize">Maximum number of commands to keep in history.</param>
	public UndoRedoManager(int maxHistorySize = 100) {
		_maxHistorySize = maxHistorySize;
	}

	/// <summary>
	/// Gets whether there are commands that can be undone.
	/// </summary>
	public bool CanUndo => _undoStack.Count > 0;

	/// <summary>
	/// Gets whether there are commands that can be redone.
	/// </summary>
	public bool CanRedo => _redoStack.Count > 0;

	/// <summary>
	/// Gets the description of the next undo command, or null if none.
	/// </summary>
	public string? NextUndoDescription => CanUndo ? _undoStack.Peek().Description : null;

	/// <summary>
	/// Gets the description of the next redo command, or null if none.
	/// </summary>
	public string? NextRedoDescription => CanRedo ? _redoStack.Peek().Description : null;

	/// <summary>
	/// Gets the current undo stack depth.
	/// </summary>
	public int UndoCount => _undoStack.Count;

	/// <summary>
	/// Gets the current redo stack depth.
	/// </summary>
	public int RedoCount => _redoStack.Count;

	/// <summary>
	/// Gets the list of undo command descriptions (most recent first).
	/// </summary>
	public IReadOnlyList<string> UndoHistory =>
		_undoStack.Select(c => c.Description).ToList();

	/// <summary>
	/// Gets the list of redo command descriptions (most recent first).
	/// </summary>
	public IReadOnlyList<string> RedoHistory =>
		_redoStack.Select(c => c.Description).ToList();

	/// <summary>
	/// Executes a command and adds it to the undo history.
	/// </summary>
	/// <param name="command">The command to execute.</param>
	public void Execute(IUndoableCommand command) {
		command.Execute();
		_undoStack.Push(command);
		_redoStack.Clear(); // Clear redo stack when new command is executed

		// Trim history if needed
		while (_undoStack.Count > _maxHistorySize) {
			// Remove oldest items (convert to list, remove first, rebuild stack)
			var items = _undoStack.ToList();
			items.RemoveAt(items.Count - 1);
			_undoStack.Clear();
			foreach (var item in items.AsEnumerable().Reverse()) {
				_undoStack.Push(item);
			}
		}

		StateChanged?.Invoke(this, EventArgs.Empty);
	}

	/// <summary>
	/// Undoes the most recent command.
	/// </summary>
	/// <returns>True if a command was undone, false if history is empty.</returns>
	public bool Undo() {
		if (!CanUndo) return false;

		var command = _undoStack.Pop();
		command.Undo();
		_redoStack.Push(command);

		StateChanged?.Invoke(this, EventArgs.Empty);
		return true;
	}

	/// <summary>
	/// Redoes the most recently undone command.
	/// </summary>
	/// <returns>True if a command was redone, false if redo history is empty.</returns>
	public bool Redo() {
		if (!CanRedo) return false;

		var command = _redoStack.Pop();
		command.Execute();
		_undoStack.Push(command);

		StateChanged?.Invoke(this, EventArgs.Empty);
		return true;
	}

	/// <summary>
	/// Clears all undo/redo history.
	/// </summary>
	public void Clear() {
		_undoStack.Clear();
		_redoStack.Clear();
		StateChanged?.Invoke(this, EventArgs.Empty);
	}
}

/// <summary>
/// Command for changing a single byte in ROM data.
/// </summary>
public class SetByteCommand : IUndoableCommand {
	private readonly byte[] _data;
	private readonly int _offset;
	private readonly byte _newValue;
	private readonly byte _oldValue;

	/// <inheritdoc/>
	public string Description { get; }

	/// <summary>
	/// Creates a new set byte command.
	/// </summary>
	/// <param name="data">The data array to modify.</param>
	/// <param name="offset">The offset to modify.</param>
	/// <param name="newValue">The new value to set.</param>
	/// <param name="description">Optional description override.</param>
	public SetByteCommand(byte[] data, int offset, byte newValue, string? description = null) {
		_data = data;
		_offset = offset;
		_newValue = newValue;
		_oldValue = data[offset];
		Description = description ?? $"Set byte at 0x{offset:X6} to 0x{newValue:X2}";
	}

	/// <inheritdoc/>
	public void Execute() => _data[_offset] = _newValue;

	/// <inheritdoc/>
	public void Undo() => _data[_offset] = _oldValue;
}

/// <summary>
/// Command for changing multiple bytes in ROM data.
/// </summary>
public class SetBytesCommand : IUndoableCommand {
	private readonly byte[] _data;
	private readonly int _offset;
	private readonly byte[] _newValues;
	private readonly byte[] _oldValues;

	/// <inheritdoc/>
	public string Description { get; }

	/// <summary>
	/// Creates a new set bytes command.
	/// </summary>
	/// <param name="data">The data array to modify.</param>
	/// <param name="offset">The starting offset.</param>
	/// <param name="newValues">The new values to write.</param>
	/// <param name="description">Optional description override.</param>
	public SetBytesCommand(byte[] data, int offset, byte[] newValues, string? description = null) {
		_data = data;
		_offset = offset;
		_newValues = (byte[])newValues.Clone();
		_oldValues = new byte[newValues.Length];
		Array.Copy(data, offset, _oldValues, 0, newValues.Length);
		Description = description ?? $"Set {newValues.Length} bytes at 0x{offset:X6}";
	}

	/// <inheritdoc/>
	public void Execute() => Array.Copy(_newValues, 0, _data, _offset, _newValues.Length);

	/// <inheritdoc/>
	public void Undo() => Array.Copy(_oldValues, 0, _data, _offset, _oldValues.Length);
}

/// <summary>
/// Command for setting a map tile.
/// </summary>
public class SetTileCommand : IUndoableCommand {
	private readonly byte[] _mapData;
	private readonly int _x;
	private readonly int _y;
	private readonly int _mapWidth;
	private readonly byte _newTile;
	private readonly byte _oldTile;

	/// <inheritdoc/>
	public string Description { get; }

	/// <summary>
	/// Creates a new set tile command.
	/// </summary>
	public SetTileCommand(byte[] mapData, int x, int y, int mapWidth, byte newTile) {
		_mapData = mapData;
		_x = x;
		_y = y;
		_mapWidth = mapWidth;
		_newTile = newTile;

		int offset = y * mapWidth + x;
		_oldTile = mapData[offset];
		Description = $"Set tile ({x}, {y}) to 0x{newTile:X2}";
	}

	/// <inheritdoc/>
	public void Execute() {
		int offset = _y * _mapWidth + _x;
		_mapData[offset] = _newTile;
	}

	/// <inheritdoc/>
	public void Undo() {
		int offset = _y * _mapWidth + _x;
		_mapData[offset] = _oldTile;
	}
}

/// <summary>
/// Command that groups multiple commands into a single undoable unit.
/// </summary>
public class CompositeCommand : IUndoableCommand {
	private readonly List<IUndoableCommand> _commands;

	/// <inheritdoc/>
	public string Description { get; }

	/// <summary>
	/// Creates a new composite command.
	/// </summary>
	/// <param name="description">Description for the composite operation.</param>
	/// <param name="commands">The commands to group.</param>
	public CompositeCommand(string description, IEnumerable<IUndoableCommand> commands) {
		Description = description;
		_commands = commands.ToList();
	}

	/// <inheritdoc/>
	public void Execute() {
		foreach (var command in _commands) {
			command.Execute();
		}
	}

	/// <inheritdoc/>
	public void Undo() {
		// Undo in reverse order
		for (int i = _commands.Count - 1; i >= 0; i--) {
			_commands[i].Undo();
		}
	}
}
