using System.Text;

namespace GameInfoTools.Analysis.Games.DQ3r;

/// <summary>
/// DQ3r text extraction and processing.
/// Handles dialog scripts, item names, monster names, and other text data.
/// </summary>
public class DQ3rTextExtractor {
	private readonly byte[] _romData;
	private readonly int _headerOffset;

	/// <summary>
	/// Known text table locations from research.
	/// </summary>
	public static class TextLocations {
		/// <summary>Dialog script pointer table.</summary>
		public const int DialogPointers = 0x15331;
		/// <summary>Number of dialog script entries.</summary>
		public const int DialogPointerCount = 506;

		/// <summary>Huffman tree left node table.</summary>
		public const int HuffmanLeftTable = 0x159d3;
		/// <summary>Huffman tree right node table.</summary>
		public const int HuffmanRightTable = 0x161a7;
		/// <summary>Number of Huffman table entries.</summary>
		public const int HuffmanTableEntries = 0x3ea;

		/// <summary>Main dialog script data (from datamap.json).</summary>
		public const int DialogScriptStart = 0x3cc258; // SNES $FC:C258
		/// <summary>Dialog script end.</summary>
		public const int DialogScriptEnd = 0x3ecfb5;   // SNES $FE:CFB5

		/// <summary>Dialog font metadata table.</summary>
		public const int FontMetadataStart = 0x0151aa; // SNES $C1:51AA
		/// <summary>Font metadata entries.</summary>
		public const int FontMetadataCount = 50;
		/// <summary>Font metadata entry size.</summary>
		public const int FontMetadataEntrySize = 5;

		/// <summary>Dialog font data.</summary>
		public const int FontDataStart = 0x010ed3;  // SNES $C1:0ED3
		/// <summary>Font data end.</summary>
		public const int FontDataEnd = 0x0151a9;    // SNES $C1:51A9
	}

	public DQ3rTextExtractor(byte[] romData) {
		_romData = romData;
		// Detect SMC header
		_headerOffset = romData.Length % 1024 == 512 ? 512 : 0;
	}

	/// <summary>
	/// Extract dialog script pointers.
	/// </summary>
	/// <returns>Array of 24-bit SNES addresses.</returns>
	public int[] ExtractDialogPointers() {
		var pointers = new int[TextLocations.DialogPointerCount];
		int offset = TextLocations.DialogPointers + _headerOffset;

		for (int i = 0; i < TextLocations.DialogPointerCount; i++) {
			if (offset + 3 > _romData.Length) break;

			// Read 24-bit little-endian pointer
			pointers[i] = _romData[offset] |
						  (_romData[offset + 1] << 8) |
						  (_romData[offset + 2] << 16);
			offset += 3;
		}

		return pointers;
	}

	/// <summary>
	/// Extract Huffman decompression tables.
	/// </summary>
	/// <returns>Left and right node tables for Huffman tree.</returns>
	public (byte[] leftTable, byte[] rightTable) ExtractHuffmanTables() {
		int leftOffset = TextLocations.HuffmanLeftTable + _headerOffset;
		int rightOffset = TextLocations.HuffmanRightTable + _headerOffset;
		int size = TextLocations.HuffmanTableEntries;

		var leftTable = new byte[size];
		var rightTable = new byte[size];

		if (leftOffset + size <= _romData.Length) {
			Array.Copy(_romData, leftOffset, leftTable, 0, size);
		}

		if (rightOffset + size <= _romData.Length) {
			Array.Copy(_romData, rightOffset, rightTable, 0, size);
		}

		return (leftTable, rightTable);
	}

	/// <summary>
	/// Extract raw dialog script data.
	/// </summary>
	/// <returns>Dialog script bytes.</returns>
	public byte[] ExtractDialogScriptData() {
		int start = TextLocations.DialogScriptStart + _headerOffset;
		int end = TextLocations.DialogScriptEnd + _headerOffset;
		int size = Math.Min(end - start, _romData.Length - start);

		if (start >= _romData.Length || size <= 0) {
			return [];
		}

		var data = new byte[size];
		Array.Copy(_romData, start, data, 0, size);
		return data;
	}

	/// <summary>
	/// Extract font metadata entries.
	/// </summary>
	/// <returns>List of font character metadata.</returns>
	public List<FontMetadata> ExtractFontMetadata() {
		var entries = new List<FontMetadata>();
		int offset = TextLocations.FontMetadataStart + _headerOffset;

		for (int i = 0; i < TextLocations.FontMetadataCount; i++) {
			if (offset + TextLocations.FontMetadataEntrySize > _romData.Length) break;

			entries.Add(new FontMetadata {
				Index = i,
				Byte0 = _romData[offset],
				Byte1 = _romData[offset + 1],
				Byte2 = _romData[offset + 2],
				Byte3 = _romData[offset + 3],
				Byte4 = _romData[offset + 4]
			});

			offset += TextLocations.FontMetadataEntrySize;
		}

		return entries;
	}

	/// <summary>
	/// Extract font graphics data.
	/// </summary>
	/// <returns>Raw font tile data.</returns>
	public byte[] ExtractFontData() {
		int start = TextLocations.FontDataStart + _headerOffset;
		int end = TextLocations.FontDataEnd + _headerOffset;
		int size = Math.Min(end - start, _romData.Length - start);

		if (start >= _romData.Length || size <= 0) {
			return [];
		}

		var data = new byte[size];
		Array.Copy(_romData, start, data, 0, size);
		return data;
	}

	/// <summary>
	/// Analyze text region to detect encoding and strings.
	/// </summary>
	/// <param name="start">Start file offset.</param>
	/// <param name="length">Length in bytes.</param>
	/// <returns>Text analysis result.</returns>
	public TextAnalysisResult AnalyzeRegion(int start, int length) {
		int actualStart = start + _headerOffset;
		int actualLength = Math.Min(length, _romData.Length - actualStart);

		if (actualStart >= _romData.Length || actualLength <= 0) {
			return new TextAnalysisResult { IsValid = false };
		}

		var data = _romData.AsSpan(actualStart, actualLength);
		var result = new TextAnalysisResult { IsValid = true };

		// Count potential control codes
		int controlCodes = 0;
		int printableBytes = 0;
		int nullBytes = 0;

		foreach (byte b in data) {
			if (b == 0x00) nullBytes++;
			else if (b >= 0xf0) controlCodes++;
			else if (b >= 0x20 && b < 0x80) printableBytes++;
		}

		result.ControlCodeCount = controlCodes;
		result.PrintableByteCount = printableBytes;
		result.NullByteCount = nullBytes;
		result.TotalBytes = actualLength;

		// Estimate encoding
		result.LikelyEncoding = (controlCodes > actualLength * 0.05 &&
								 nullBytes < actualLength * 0.3)
			? TextEncoding.Custom
			: TextEncoding.Raw;

		// Estimate string count (rough heuristic)
		result.EstimatedStrings = EstimateStringCount(data);

		return result;
	}

	/// <summary>
	/// Estimate number of strings in text data.
	/// </summary>
	private int EstimateStringCount(ReadOnlySpan<byte> data) {
		int count = 0;
		bool inString = false;

		foreach (byte b in data) {
			if (b == 0x00 || b >= 0xfe) {
				if (inString) {
					count++;
					inString = false;
				}
			} else {
				inString = true;
			}
		}

		return count;
	}

	/// <summary>
	/// Get text extraction summary.
	/// </summary>
	public DQ3rTextSummary GetSummary() {
		var pointers = ExtractDialogPointers();
		var fontMeta = ExtractFontMetadata();
		var scriptData = ExtractDialogScriptData();

		return new DQ3rTextSummary {
			DialogPointerCount = pointers.Length,
			FontMetadataCount = fontMeta.Count,
			ScriptDataSize = scriptData.Length,
			FirstPointer = pointers.Length > 0 ? pointers[0] : 0,
			LastPointer = pointers.Length > 0 ? pointers[^1] : 0
		};
	}
}

/// <summary>
/// Font character metadata.
/// </summary>
public class FontMetadata {
	public int Index { get; init; }
	public byte Byte0 { get; init; }
	public byte Byte1 { get; init; }
	public byte Byte2 { get; init; }
	public byte Byte3 { get; init; }
	public byte Byte4 { get; init; }

	// Interpret bytes based on structure analysis
	public int Width => Byte0;
	public int Height => Byte1;
	public int DataOffset => Byte2 | (Byte3 << 8);
	public int Flags => Byte4;
}

/// <summary>
/// Text region analysis result.
/// </summary>
public class TextAnalysisResult {
	public bool IsValid { get; set; }
	public int TotalBytes { get; set; }
	public int ControlCodeCount { get; set; }
	public int PrintableByteCount { get; set; }
	public int NullByteCount { get; set; }
	public int EstimatedStrings { get; set; }
	public TextEncoding LikelyEncoding { get; set; }
}

/// <summary>
/// Text encoding types.
/// </summary>
public enum TextEncoding {
	Raw,
	Custom,
	ShiftJis,
	Huffman,
	Unknown
}

/// <summary>
/// DQ3r text extraction summary.
/// </summary>
public class DQ3rTextSummary {
	public int DialogPointerCount { get; init; }
	public int FontMetadataCount { get; init; }
	public int ScriptDataSize { get; init; }
	public int FirstPointer { get; init; }
	public int LastPointer { get; init; }

	public override string ToString() {
		var sb = new StringBuilder();
		sb.AppendLine("=== DQ3r Text Summary ===");
		sb.AppendLine($"Dialog Pointers: {DialogPointerCount}");
		sb.AppendLine($"First Pointer: ${FirstPointer:x6}");
		sb.AppendLine($"Last Pointer: ${LastPointer:x6}");
		sb.AppendLine($"Font Metadata Entries: {FontMetadataCount}");
		sb.AppendLine($"Script Data Size: {ScriptDataSize:N0} bytes");
		return sb.ToString();
	}
}
