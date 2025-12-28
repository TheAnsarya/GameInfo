namespace DQ3Lib.Text;

internal class DialogTableFile : Dictionary<int, TableFileEntry> {
	// Examples of lines in the table file. Last line is blank:
	// 0201=愛
	// 00AB=[CODE AB]
	// Commands start with 00, characters start with 02-06
	// 00AC is <end of string>

	public string? OriginalFileName { get; set; }

	public DialogTableFile() { }

	public DialogTableFile(string fileName) {
		var lines = File.ReadAllLines(fileName);
		DictionaryFromLines(this, lines);
	}

	public DialogTableFile(string[] lines) {
		DictionaryFromLines(this, lines);
	}

	private static void DictionaryFromLines(DialogTableFile dictionary, string[] lines) {
		var entries =
			lines
				.Where(x => !string.IsNullOrWhiteSpace(x))
				.Select(x => new TableFileEntry(int.Parse(x[..4], System.Globalization.NumberStyles.HexNumber), x[..4], x[5..]));

		foreach (var entry in entries) {
			dictionary[entry.Key] = entry;
		}
	}
}

