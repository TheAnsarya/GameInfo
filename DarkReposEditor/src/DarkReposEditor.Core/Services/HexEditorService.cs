using System.Globalization;
using System.Text;
using DarkReposEditor.Core.Interfaces;

namespace DarkReposEditor.Core.Services;

/// <summary>
/// Service for hex editing operations - reading, writing, searching, and formatting.
/// </summary>
public class HexEditorService : IHexEditorService
{
	/// <inheritdoc />
	public ReadOnlySpan<byte> ReadBytes(byte[] data, int offset, int length)
	{
		ArgumentNullException.ThrowIfNull(data);

		if (offset < 0 || offset >= data.Length)
			throw new ArgumentOutOfRangeException(nameof(offset), "Offset is out of range");

		// Clamp length to available data
		var actualLength = Math.Min(length, data.Length - offset);
		if (actualLength <= 0)
			return ReadOnlySpan<byte>.Empty;

		return data.AsSpan(offset, actualLength);
	}

	/// <inheritdoc />
	public void WriteBytes(byte[] data, int offset, ReadOnlySpan<byte> bytes)
	{
		ArgumentNullException.ThrowIfNull(data);

		if (offset < 0 || offset >= data.Length)
			throw new ArgumentOutOfRangeException(nameof(offset), "Offset is out of range");

		if (offset + bytes.Length > data.Length)
			throw new ArgumentOutOfRangeException(nameof(bytes), "Write would exceed data bounds");

		bytes.CopyTo(data.AsSpan(offset));
	}

	/// <inheritdoc />
	public IEnumerable<int> Search(byte[] data, byte[] pattern, int startOffset = 0)
	{
		ArgumentNullException.ThrowIfNull(data);
		ArgumentNullException.ThrowIfNull(pattern);

		if (pattern.Length == 0)
			yield break;

		if (startOffset < 0)
			startOffset = 0;

		// Use Boyer-Moore-Horspool algorithm for efficiency
		var skipTable = BuildSkipTable(pattern);

		var i = startOffset;
		while (i <= data.Length - pattern.Length)
		{
			var j = pattern.Length - 1;

			while (j >= 0 && data[i + j] == pattern[j])
				j--;

			if (j < 0)
			{
				yield return i;
				i++;
			}
			else
			{
				i += skipTable[data[i + pattern.Length - 1]];
			}
		}
	}

	/// <inheritdoc />
	public IEnumerable<int> SearchText(byte[] data, string text, int startOffset = 0)
	{
		if (string.IsNullOrEmpty(text))
			yield break;

		// Search for ASCII representation
		var asciiBytes = Encoding.ASCII.GetBytes(text);
		foreach (var offset in Search(data, asciiBytes, startOffset))
		{
			yield return offset;
		}
	}

	/// <inheritdoc />
	public void Replace(byte[] data, int offset, ReadOnlySpan<byte> oldBytes, ReadOnlySpan<byte> newBytes)
	{
		ArgumentNullException.ThrowIfNull(data);

		if (offset < 0 || offset >= data.Length)
			throw new ArgumentOutOfRangeException(nameof(offset), "Offset is out of range");

		// Verify old bytes match at offset
		var currentBytes = data.AsSpan(offset, Math.Min(oldBytes.Length, data.Length - offset));
		if (!currentBytes.SequenceEqual(oldBytes))
			throw new InvalidOperationException("Old bytes do not match at the specified offset");

		// For in-place replacement, sizes must match
		if (oldBytes.Length != newBytes.Length)
			throw new ArgumentException("Old and new bytes must be the same length for in-place replacement");

		WriteBytes(data, offset, newBytes);
	}

	/// <inheritdoc />
	public void Fill(byte[] data, int offset, int length, byte value)
	{
		ArgumentNullException.ThrowIfNull(data);

		if (offset < 0 || offset >= data.Length)
			throw new ArgumentOutOfRangeException(nameof(offset), "Offset is out of range");

		var actualLength = Math.Min(length, data.Length - offset);
		if (actualLength <= 0)
			return;

		data.AsSpan(offset, actualLength).Fill(value);
	}

	/// <inheritdoc />
	public string GetHexDump(byte[] data, int offset, int length, int bytesPerLine = 16)
	{
		ArgumentNullException.ThrowIfNull(data);

		if (bytesPerLine < 1)
			bytesPerLine = 16;

		var actualLength = Math.Min(length, data.Length - Math.Max(0, offset));
		if (actualLength <= 0 || offset < 0 || offset >= data.Length)
			return string.Empty;

		var sb = new StringBuilder();
		var currentOffset = offset;
		var endOffset = offset + actualLength;

		while (currentOffset < endOffset)
		{
			// Address column
			sb.Append($"{currentOffset:x8}  ");

			// Calculate bytes for this line
			var lineBytes = Math.Min(bytesPerLine, endOffset - currentOffset);

			// Hex bytes
			for (var i = 0; i < bytesPerLine; i++)
			{
				if (i < lineBytes)
				{
					sb.Append($"{data[currentOffset + i]:x2} ");
				}
				else
				{
					sb.Append("   ");
				}

				// Add extra space in middle
				if (i == 7)
					sb.Append(' ');
			}

			sb.Append(' ');

			// ASCII representation
			for (var i = 0; i < lineBytes; i++)
			{
				var b = data[currentOffset + i];
				sb.Append(b is >= 0x20 and < 0x7f ? (char)b : '.');
			}

			sb.AppendLine();
			currentOffset += lineBytes;
		}

		return sb.ToString();
	}

	/// <inheritdoc />
	public byte[] ParseHex(string hexString)
	{
		if (string.IsNullOrWhiteSpace(hexString))
			return [];

		// Remove common separators and whitespace
		var cleaned = new StringBuilder();
		foreach (var c in hexString)
		{
			if (char.IsAsciiHexDigit(c))
				cleaned.Append(c);
		}

		var hex = cleaned.ToString();
		if (hex.Length % 2 != 0)
			throw new FormatException("Hex string must have even number of digits");

		var bytes = new byte[hex.Length / 2];
		for (var i = 0; i < bytes.Length; i++)
		{
			bytes[i] = byte.Parse(hex.AsSpan(i * 2, 2), NumberStyles.HexNumber);
		}

		return bytes;
	}

	/// <inheritdoc />
	public string FormatHex(ReadOnlySpan<byte> bytes, string separator = " ")
	{
		if (bytes.IsEmpty)
			return string.Empty;

		var sb = new StringBuilder();
		for (var i = 0; i < bytes.Length; i++)
		{
			if (i > 0 && !string.IsNullOrEmpty(separator))
				sb.Append(separator);
			sb.Append($"{bytes[i]:x2}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Build skip table for Boyer-Moore-Horspool search algorithm.
	/// </summary>
	private static int[] BuildSkipTable(byte[] pattern)
	{
		var table = new int[256];
		Array.Fill(table, pattern.Length);

		for (var i = 0; i < pattern.Length - 1; i++)
		{
			table[pattern[i]] = pattern.Length - 1 - i;
		}

		return table;
	}
}
