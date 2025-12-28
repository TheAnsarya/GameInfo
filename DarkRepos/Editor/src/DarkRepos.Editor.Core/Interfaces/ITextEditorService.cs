namespace DarkRepos.Editor.Core.Interfaces;

/// <summary>
/// Service for game text editing operations.
/// </summary>
public interface ITextEditorService {
	/// <summary>
	/// Loads a table file defining character mappings.
	/// </summary>
	/// <param name="tableContent">Content of the .tbl file.</param>
	/// <returns>Parsed table file.</returns>
	TableFile LoadTableFile(string tableContent);

	/// <summary>
	/// Generates a table file from character mappings.
	/// </summary>
	/// <param name="tableFile">Table file to serialize.</param>
	/// <returns>TBL file content.</returns>
	string GenerateTableFile(TableFile tableFile);

	/// <summary>
	/// Decodes binary data to text using the provided table.
	/// </summary>
	/// <param name="data">Raw binary data.</param>
	/// <param name="offset">Starting offset.</param>
	/// <param name="length">Length to decode.</param>
	/// <param name="table">Character mapping table.</param>
	/// <returns>Decoded text.</returns>
	string DecodeText(byte[] data, int offset, int length, TableFile table);

	/// <summary>
	/// Encodes text to binary using the provided table.
	/// </summary>
	/// <param name="text">Text to encode.</param>
	/// <param name="table">Character mapping table.</param>
	/// <returns>Encoded bytes.</returns>
	byte[] EncodeText(string text, TableFile table);

	/// <summary>
	/// Finds text blocks in ROM data.
	/// </summary>
	/// <param name="data">ROM data to search.</param>
	/// <param name="table">Character mapping table.</param>
	/// <param name="options">Search options.</param>
	/// <returns>Found text blocks.</returns>
	IEnumerable<TextBlock> FindTextBlocks(byte[] data, TableFile table, TextSearchOptions? options = null);

	/// <summary>
	/// Extracts a script (all text) from ROM data.
	/// </summary>
	/// <param name="data">ROM data.</param>
	/// <param name="blocks">Text blocks to extract.</param>
	/// <param name="table">Character mapping table.</param>
	/// <returns>Extracted script.</returns>
	Script ExtractScript(byte[] data, IEnumerable<TextBlock> blocks, TableFile table);

	/// <summary>
	/// Exports a script to the specified format.
	/// </summary>
	/// <param name="script">Script to export.</param>
	/// <param name="format">Export format.</param>
	/// <returns>Formatted script content.</returns>
	string ExportScript(Script script, ScriptExportFormat format);

	/// <summary>
	/// Imports a script from formatted content.
	/// </summary>
	/// <param name="content">Formatted content.</param>
	/// <param name="format">Content format.</param>
	/// <returns>Imported script.</returns>
	Script ImportScript(string content, ScriptExportFormat format);

	/// <summary>
	/// Reads pointer table entries.
	/// </summary>
	/// <param name="data">ROM data.</param>
	/// <param name="tableOffset">Start of pointer table.</param>
	/// <param name="count">Number of pointers.</param>
	/// <param name="pointerSize">Size of each pointer (2 or 3 bytes).</param>
	/// <param name="baseAddress">Base address to add to pointers.</param>
	/// <returns>List of pointer addresses.</returns>
	IEnumerable<int> ReadPointerTable(byte[] data, int tableOffset, int count, int pointerSize = 2, int baseAddress = 0);

	/// <summary>
	/// Writes updated pointer table.
	/// </summary>
	/// <param name="pointers">Pointer addresses.</param>
	/// <param name="pointerSize">Size of each pointer.</param>
	/// <param name="baseAddress">Base address to subtract.</param>
	/// <returns>Encoded pointer bytes.</returns>
	byte[] WritePointerTable(IEnumerable<int> pointers, int pointerSize = 2, int baseAddress = 0);
}

/// <summary>
/// Character mapping table for text encoding/decoding.
/// </summary>
public class TableFile {
	/// <summary>
	/// Name of the table file.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Single-byte character mappings (hex value -> character).
	/// </summary>
	public Dictionary<byte, string> SingleByteMappings { get; set; } = new();

	/// <summary>
	/// Multi-byte character mappings (hex values -> character).
	/// </summary>
	public Dictionary<byte[], string> MultiByteMappings { get; set; } = new(new ByteArrayComparer());

	/// <summary>
	/// Reverse mapping for encoding (character -> bytes).
	/// </summary>
	public Dictionary<string, byte[]> ReverseMappings { get; set; } = new();

	/// <summary>
	/// Control codes and their descriptions.
	/// </summary>
	public Dictionary<byte[], string> ControlCodes { get; set; } = new(new ByteArrayComparer());

	/// <summary>
	/// End of string marker bytes.
	/// </summary>
	public byte[] EndOfStringMarker { get; set; } = new byte[] { 0x00 };

	/// <summary>
	/// End of line marker bytes.
	/// </summary>
	public byte[] EndOfLineMarker { get; set; } = Array.Empty<byte>();

	/// <summary>
	/// DTE (Dual Tile Encoding) mappings for compression.
	/// </summary>
	public Dictionary<byte, string> DteMappings { get; set; } = new();

	/// <summary>
	/// MTE (Multiple Tile Encoding) mappings for compression.
	/// </summary>
	public Dictionary<byte, string> MteMappings { get; set; } = new();

	/// <summary>
	/// Gets the maximum byte sequence length in the table.
	/// </summary>
	public int MaxSequenceLength { get; set; } = 1;

	/// <summary>
	/// Builds reverse mappings for encoding.
	/// </summary>
	public void BuildReverseMappings() {
		ReverseMappings.Clear();

		// Add single-byte mappings
		foreach (var kvp in SingleByteMappings) {
			if (!ReverseMappings.ContainsKey(kvp.Value)) {
				ReverseMappings[kvp.Value] = new byte[] { kvp.Key };
			}
		}

		// Add multi-byte mappings
		foreach (var kvp in MultiByteMappings) {
			if (!ReverseMappings.ContainsKey(kvp.Value)) {
				ReverseMappings[kvp.Value] = kvp.Key;
			}
		}
	}
}

/// <summary>
/// Represents a block of text found in ROM data.
/// </summary>
public class TextBlock {
	/// <summary>
	/// Starting offset of the text block.
	/// </summary>
	public int Offset { get; set; }

	/// <summary>
	/// Length in bytes.
	/// </summary>
	public int Length { get; set; }

	/// <summary>
	/// Decoded text content.
	/// </summary>
	public string Text { get; set; } = string.Empty;

	/// <summary>
	/// Raw bytes of the text.
	/// </summary>
	public byte[] RawBytes { get; set; } = Array.Empty<byte>();

	/// <summary>
	/// Whether this block is referenced by a pointer.
	/// </summary>
	public bool HasPointer { get; set; }

	/// <summary>
	/// Address of pointer referencing this block (if any).
	/// </summary>
	public int? PointerAddress { get; set; }

	/// <summary>
	/// Optional label/identifier for this block.
	/// </summary>
	public string? Label { get; set; }

	/// <summary>
	/// Optional comment about this text.
	/// </summary>
	public string? Comment { get; set; }
}

/// <summary>
/// Complete game script containing all text blocks.
/// </summary>
public class Script {
	/// <summary>
	/// Game/ROM name.
	/// </summary>
	public string GameName { get; set; } = string.Empty;

	/// <summary>
	/// Table file used for encoding/decoding.
	/// </summary>
	public string TableName { get; set; } = string.Empty;

	/// <summary>
	/// All text blocks in the script.
	/// </summary>
	public List<TextBlock> Blocks { get; set; } = new();

	/// <summary>
	/// Metadata about the extraction.
	/// </summary>
	public Dictionary<string, string> Metadata { get; set; } = new();
}

/// <summary>
/// Options for text search operations.
/// </summary>
public class TextSearchOptions {
	/// <summary>
	/// Minimum text length to consider valid.
	/// </summary>
	public int MinLength { get; set; } = 3;

	/// <summary>
	/// Maximum text length (0 = no limit).
	/// </summary>
	public int MaxLength { get; set; } = 0;

	/// <summary>
	/// Require end-of-string marker.
	/// </summary>
	public bool RequireTerminator { get; set; } = true;

	/// <summary>
	/// Start offset for search.
	/// </summary>
	public int StartOffset { get; set; } = 0;

	/// <summary>
	/// End offset for search (0 = end of data).
	/// </summary>
	public int EndOffset { get; set; } = 0;

	/// <summary>
	/// Minimum ratio of valid characters.
	/// </summary>
	public double MinValidRatio { get; set; } = 0.7;
}

/// <summary>
/// Script export formats.
/// </summary>
public enum ScriptExportFormat {
	/// <summary>Plain text format.</summary>
	PlainText,

	/// <summary>CSV format with columns.</summary>
	Csv,

	/// <summary>JSON format.</summary>
	Json,

	/// <summary>Atlas script format.</summary>
	Atlas,

	/// <summary>Markdown table format.</summary>
	Markdown
}

/// <summary>
/// Comparer for byte arrays.
/// </summary>
public class ByteArrayComparer : IEqualityComparer<byte[]> {
	public bool Equals(byte[]? x, byte[]? y) {
		if (x == null || y == null)
			return x == y;
		if (x.Length != y.Length)
			return false;
		for (int i = 0; i < x.Length; i++) {
			if (x[i] != y[i])
				return false;
		}

		return true;
	}

	public int GetHashCode(byte[] obj) {
		if (obj == null || obj.Length == 0)
			return 0;
		int hash = 17;
		foreach (var b in obj) {
			hash = (hash * 31) + b;
		}

		return hash;
	}
}
