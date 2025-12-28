using DQ3Lib.Streams;

namespace DQ3Lib.Text.Dialog;

internal class ScriptPointers {
	private const int PointerTableAddress = 0x15331;
	private const int NumberOfEntries = 506;
	private const int EntrySize = 3;

	// TODO: add checking?
	// ERROR: data.Size % EntrySize != 0
	// ERROR: `data` Length should be (NumberOfEntries * EntrySize)
	public static int[] GetTable(ByteArrayStream data) {
		var result = new List<int>();

		while (!data.AtEnd) {
			result.Add(data.Long());
		}

		return [.. result];
	}
}

