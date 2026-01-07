namespace GameInfoTools.Core.Interfaces;

/// <summary>
/// Event arguments for data change notifications.
/// </summary>
public class DataChangedEventArgs : EventArgs {
	/// <summary>Starting offset of the changed region.</summary>
	public int Offset { get; init; }

	/// <summary>Length of the changed region in bytes.</summary>
	public int Length { get; init; }

	/// <summary>The old data before the change.</summary>
	public byte[] OldData { get; init; } = [];

	/// <summary>The new data after the change.</summary>
	public byte[] NewData { get; init; } = [];
}

/// <summary>
/// Search result from a hex search operation.
/// </summary>
public record SearchResult(int Offset, int Length, string? Context = null);

/// <summary>
/// Interface for hex editor services shared between Avalonia and Blazor UIs.
/// </summary>
public interface IHexEditorService {
	/// <summary>Total length of loaded data in bytes.</summary>
	int Length { get; }

	/// <summary>Whether data has been modified since last save.</summary>
	bool IsModified { get; }

	/// <summary>Gets a span of bytes from the loaded data.</summary>
	/// <param name="offset">Starting offset.</param>
	/// <param name="length">Number of bytes to read.</param>
	/// <returns>Read-only span of bytes.</returns>
	ReadOnlySpan<byte> GetBytes(int offset, int length);

	/// <summary>Gets bytes as a new array (for async/Blazor scenarios).</summary>
	byte[] GetBytesArray(int offset, int length);

	/// <summary>Sets bytes at the specified offset.</summary>
	/// <param name="offset">Starting offset.</param>
	/// <param name="data">Data to write.</param>
	void SetBytes(int offset, ReadOnlySpan<byte> data);

	/// <summary>Searches for a byte pattern in the data.</summary>
	/// <param name="pattern">Pattern to search for.</param>
	/// <param name="startOffset">Offset to start searching from.</param>
	/// <returns>Enumerable of matching offsets.</returns>
	IEnumerable<SearchResult> Search(ReadOnlySpan<byte> pattern, int startOffset = 0);

	/// <summary>Searches for text using a text table.</summary>
	/// <param name="text">Text to search for.</param>
	/// <param name="table">Text table for encoding.</param>
	/// <returns>Enumerable of matching offsets.</returns>
	IEnumerable<SearchResult> SearchText(string text, ITextTable? table = null);

	/// <summary>Undoes the last edit operation.</summary>
	void Undo();

	/// <summary>Redoes the last undone operation.</summary>
	void Redo();

	/// <summary>Whether an undo operation is available.</summary>
	bool CanUndo { get; }

	/// <summary>Whether a redo operation is available.</summary>
	bool CanRedo { get; }

	/// <summary>Fired when data is modified.</summary>
	event EventHandler<DataChangedEventArgs>? DataChanged;
}

/// <summary>
/// Interface for text table operations.
/// </summary>
public interface ITextTable {
	/// <summary>Encodes a string to bytes using the table.</summary>
	byte[] Encode(string text);

	/// <summary>Decodes bytes to a string using the table.</summary>
	string Decode(ReadOnlySpan<byte> data);

	/// <summary>Loads a table from a .tbl file.</summary>
	void LoadFromFile(string path);
}
