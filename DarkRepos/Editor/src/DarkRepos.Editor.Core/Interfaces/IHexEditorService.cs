namespace DarkRepos.Editor.Core.Interfaces;

/// <summary>
/// Service for hex editing operations.
/// </summary>
public interface IHexEditorService
{
	/// <summary>
	/// Read bytes from a ROM.
	/// </summary>
	ReadOnlySpan<byte> ReadBytes(byte[] data, int offset, int length);

	/// <summary>
	/// Write bytes to a ROM.
	/// </summary>
	void WriteBytes(byte[] data, int offset, ReadOnlySpan<byte> bytes);

	/// <summary>
	/// Search for a byte pattern in the ROM.
	/// </summary>
	IEnumerable<int> Search(byte[] data, byte[] pattern, int startOffset = 0);

	/// <summary>
	/// Search for a text string in the ROM.
	/// </summary>
	IEnumerable<int> SearchText(byte[] data, string text, int startOffset = 0);

	/// <summary>
	/// Replace bytes at a specific offset.
	/// </summary>
	void Replace(byte[] data, int offset, ReadOnlySpan<byte> oldBytes, ReadOnlySpan<byte> newBytes);

	/// <summary>
	/// Fill a range with a byte value.
	/// </summary>
	void Fill(byte[] data, int offset, int length, byte value);

	/// <summary>
	/// Get a formatted hex dump of a range.
	/// </summary>
	string GetHexDump(byte[] data, int offset, int length, int bytesPerLine = 16);

	/// <summary>
	/// Parse a hex string to bytes.
	/// </summary>
	byte[] ParseHex(string hexString);

	/// <summary>
	/// Format bytes as hex string.
	/// </summary>
	string FormatHex(ReadOnlySpan<byte> bytes, string separator = " ");
}
