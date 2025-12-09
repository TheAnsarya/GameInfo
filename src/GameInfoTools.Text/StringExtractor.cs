using System.Text;
using System.Text.RegularExpressions;

namespace GameInfoTools.Text;

/// <summary>
/// String extraction and searching from ROM data.
/// </summary>
public class StringExtractor
{
	private readonly Core.TextTable _table;

	public StringExtractor(Core.TextTable table)
	{
		_table = table;
	}

	/// <summary>
	/// Extracted string result.
	/// </summary>
	public record ExtractedString(int Offset, string Text, int Length, float Confidence);

	/// <summary>
	/// Extract all strings from ROM using text table.
	/// </summary>
	public List<ExtractedString> ExtractAllStrings(byte[] data, int minLength = 3, float minConfidence = 0.7f)
	{
		var results = new List<ExtractedString>();
		int offset = 0;

		while (offset < data.Length)
		{
			var (text, bytesConsumed) = _table.DecodeBlock(data, offset, data.Length - offset);

			if (bytesConsumed > 0 && text.Length >= minLength)
			{
				float confidence = CalculateConfidence(text);
				if (confidence >= minConfidence)
				{
					results.Add(new ExtractedString(offset, text, bytesConsumed, confidence));
				}
			}

			// Move forward (skip non-text data byte by byte)
			offset += bytesConsumed > 0 ? bytesConsumed : 1;
		}

		return results;
	}

	/// <summary>
	/// Extract strings from a pointer table.
	/// </summary>
	public List<ExtractedString> ExtractFromPointerTable(
		byte[] data,
		int tableOffset,
		int count,
		int bank = 0,
		int bankOffset = 0x8000)
	{
		var results = new List<ExtractedString>();

		for (int i = 0; i < count; i++)
		{
			int ptrOffset = tableOffset + i * 2;
			if (ptrOffset + 2 > data.Length)
			{
				break;
			}

			int pointer = data[ptrOffset] | (data[ptrOffset + 1] << 8);

			// Convert CPU address to file offset
			int fileOffset = pointer - bankOffset + (bank * 0x4000);
			if (fileOffset < 0 || fileOffset >= data.Length)
			{
				continue;
			}

			var (text, bytesConsumed) = _table.DecodeBlock(data, fileOffset, data.Length - fileOffset);
			if (bytesConsumed > 0)
			{
				float confidence = CalculateConfidence(text);
				results.Add(new ExtractedString(fileOffset, text, bytesConsumed, confidence));
			}
		}

		return results;
	}

	/// <summary>
	/// Search for a specific string in ROM.
	/// </summary>
	public List<int> SearchString(byte[] data, string searchText, bool caseSensitive = false)
	{
		var results = new List<int>();
		var encoded = _table.Encode(searchText);

		if (encoded.Length == 0)
		{
			return results;
		}

		// Search for encoded bytes
		for (int offset = 0; offset <= data.Length - encoded.Length; offset++)
		{
			bool match = true;
			for (int i = 0; i < encoded.Length; i++)
			{
				if (data[offset + i] != encoded[i])
				{
					match = false;
					break;
				}
			}

			if (match)
			{
				results.Add(offset);
			}
		}

		return results;
	}

	/// <summary>
	/// Search using regex pattern on decoded text.
	/// </summary>
	public List<ExtractedString> SearchPattern(byte[] data, string pattern, RegexOptions options = RegexOptions.IgnoreCase)
	{
		var results = new List<ExtractedString>();
		var regex = new Regex(pattern, options);

		// First extract all strings, then filter by pattern
		var allStrings = ExtractAllStrings(data, minLength: 1, minConfidence: 0.5f);

		foreach (var str in allStrings)
		{
			if (regex.IsMatch(str.Text))
			{
				results.Add(str);
			}
		}

		return results;
	}

	/// <summary>
	/// Calculate confidence that extracted data is actually text.
	/// </summary>
	private float CalculateConfidence(string text)
	{
		if (string.IsNullOrEmpty(text))
		{
			return 0;
		}

		float score = 0;

		// Score based on character types
		int letters = 0, spaces = 0, punctuation = 0, control = 0;

		foreach (char c in text)
		{
			if (char.IsLetter(c)) letters++;
			else if (char.IsWhiteSpace(c)) spaces++;
			else if (char.IsPunctuation(c)) punctuation++;
			else if (c == '{' || c == '}') control++; // Control codes
		}

		int total = text.Length;

		// Text should be mostly letters
		if (letters > 0)
		{
			score += 0.4f * Math.Min(1.0f, (float)letters / total);
		}

		// Some spaces are expected
		if (spaces > 0 && spaces < total * 0.5f)
		{
			score += 0.2f;
		}

		// Punctuation is okay but not too much
		if (punctuation < total * 0.2f)
		{
			score += 0.1f;
		}

		// Control codes are normal for game text
		if (control > 0 && control < total * 0.3f)
		{
			score += 0.1f;
		}

		// Length bonus (longer strings are more likely real text)
		if (text.Length >= 10) score += 0.1f;
		if (text.Length >= 20) score += 0.1f;

		return Math.Min(1.0f, score);
	}

	/// <summary>
	/// Export extracted strings to various formats.
	/// </summary>
	public string ExportToCsv(List<ExtractedString> strings)
	{
		var sb = new StringBuilder();
		sb.AppendLine("Offset,Length,Confidence,Text");

		foreach (var str in strings)
		{
			var escapedText = str.Text.Replace("\"", "\"\"");
			sb.AppendLine($"0x{str.Offset:x6},{str.Length},{str.Confidence:F2},\"{escapedText}\"");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Export to JSON format.
	/// </summary>
	public string ExportToJson(List<ExtractedString> strings)
	{
		var sb = new StringBuilder();
		sb.AppendLine("[");

		for (int i = 0; i < strings.Count; i++)
		{
			var str = strings[i];
			var escapedText = str.Text
				.Replace("\\", "\\\\")
				.Replace("\"", "\\\"")
				.Replace("\n", "\\n")
				.Replace("\r", "\\r");

			sb.AppendLine("  {");
			sb.AppendLine($"    \"offset\": \"0x{str.Offset:x6}\",");
			sb.AppendLine($"    \"length\": {str.Length},");
			sb.AppendLine($"    \"confidence\": {str.Confidence:F2},");
			sb.AppendLine($"    \"text\": \"{escapedText}\"");
			sb.Append("  }");
			sb.AppendLine(i < strings.Count - 1 ? "," : "");
		}

		sb.AppendLine("]");
		return sb.ToString();
	}

	/// <summary>
	/// Export to editable script format.
	/// </summary>
	public string ExportToScript(List<ExtractedString> strings)
	{
		var sb = new StringBuilder();
		sb.AppendLine("; Extracted text strings");
		sb.AppendLine("; Format: ; @OFFSET");
		sb.AppendLine(";         text content");
		sb.AppendLine();

		foreach (var str in strings)
		{
			sb.AppendLine($"; @{str.Offset:x6} ({str.Length} bytes)");
			sb.AppendLine(str.Text);
			sb.AppendLine();
		}

		return sb.ToString();
	}
}

/// <summary>
/// Dictionary-based text compression/decompression.
/// </summary>
public class TextDictionary
{
	private readonly Dictionary<int, string> _entries = new();
	private readonly Dictionary<string, int> _reverseEntries = new();

	/// <summary>
	/// Load dictionary from data.
	/// </summary>
	public void LoadFromPointerTable(byte[] data, int tableOffset, int count, Core.TextTable table, int bank = 0)
	{
		for (int i = 0; i < count; i++)
		{
			int ptrOffset = tableOffset + i * 2;
			if (ptrOffset + 2 > data.Length)
			{
				break;
			}

			int pointer = data[ptrOffset] | (data[ptrOffset + 1] << 8);
			int fileOffset = pointer - 0x8000 + (bank * 0x4000);

			if (fileOffset < 0 || fileOffset >= data.Length)
			{
				continue;
			}

			var (text, _) = table.DecodeBlock(data, fileOffset, data.Length - fileOffset);
			_entries[i] = text;
			_reverseEntries[text] = i;
		}
	}

	/// <summary>
	/// Get dictionary entry by index.
	/// </summary>
	public string? GetEntry(int index)
	{
		return _entries.TryGetValue(index, out var text) ? text : null;
	}

	/// <summary>
	/// Find index of a dictionary entry.
	/// </summary>
	public int? FindEntry(string text)
	{
		return _reverseEntries.TryGetValue(text, out var index) ? index : null;
	}

	/// <summary>
	/// Get all entries.
	/// </summary>
	public IEnumerable<(int Index, string Text)> GetAllEntries()
	{
		return _entries.Select(kvp => (kvp.Key, kvp.Value));
	}

	/// <summary>
	/// Entry count.
	/// </summary>
	public int Count => _entries.Count;

	/// <summary>
	/// Export dictionary to JSON.
	/// </summary>
	public string ExportToJson()
	{
		var sb = new StringBuilder();
		sb.AppendLine("{");

		var entries = _entries.OrderBy(e => e.Key).ToList();
		for (int i = 0; i < entries.Count; i++)
		{
			var (index, text) = entries[i];
			var escaped = text.Replace("\\", "\\\\").Replace("\"", "\\\"");
			sb.Append($"  \"{index}\": \"{escaped}\"");
			sb.AppendLine(i < entries.Count - 1 ? "," : "");
		}

		sb.AppendLine("}");
		return sb.ToString();
	}
}
