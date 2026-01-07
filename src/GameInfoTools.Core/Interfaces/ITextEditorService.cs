namespace GameInfoTools.Core.Interfaces;

/// <summary>
/// Represents an extracted text string from a ROM.
/// </summary>
public record TextEntry(int Index, int Offset, string Text, int ByteLength, string? Label = null);

/// <summary>
/// Interface for text editor services.
/// </summary>
public interface ITextEditorService
{
	/// <summary>All extracted text entries.</summary>
	IReadOnlyList<TextEntry> Entries { get; }

	/// <summary>The text table used for encoding/decoding.</summary>
	ITextTable? TextTable { get; set; }

	/// <summary>Loads a text table from a .tbl file.</summary>
	void LoadTextTable(string path);

	/// <summary>Extracts text entries from a ROM region.</summary>
	void ExtractText(int startOffset, int endOffset, byte terminator = 0x00);

	/// <summary>Extracts text using a pointer table.</summary>
	void ExtractTextFromPointers(int pointerTableOffset, int count, int baseAddress);

	/// <summary>Gets a text entry by index.</summary>
	TextEntry? GetEntry(int index);

	/// <summary>Updates a text entry.</summary>
	void SetEntry(int index, string newText);

	/// <summary>Searches for entries containing text.</summary>
	IEnumerable<TextEntry> Search(string searchText, bool caseSensitive = false);

	/// <summary>Exports all text to a file (JSON, CSV, or plain text).</summary>
	string Export(string format = "json");

	/// <summary>Imports text from a file.</summary>
	void Import(string data, string format = "json");

	/// <summary>Calculates the byte length of a string using the current table.</summary>
	int CalculateByteLength(string text);

	/// <summary>Checks if new text fits in the original space.</summary>
	bool WillFit(int index, string newText);

	/// <summary>Undoes the last edit.</summary>
	void Undo();

	/// <summary>Redoes the last undone edit.</summary>
	void Redo();

	/// <summary>Whether an undo operation is available.</summary>
	bool CanUndo { get; }

	/// <summary>Whether a redo operation is available.</summary>
	bool CanRedo { get; }

	/// <summary>Fired when a text entry changes.</summary>
	event EventHandler<int>? EntryChanged;
}
