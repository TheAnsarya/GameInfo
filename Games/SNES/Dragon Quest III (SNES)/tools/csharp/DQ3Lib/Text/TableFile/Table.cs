namespace DQ3Lib.Text.TableFile;

// WARNING: This is a naïve implementation. It assumes that the file is well-formed and that the keys are unique.
// Examples of lines in the table file. Last line is blank:
// 0201=愛
// 00AB=[CODE AB]
// Commands start with 00, characters start with 02-06
// 00AC is <end of string>
internal class Table : Dictionary<int, TableFileEntry> {
	public Table() { }

	public Table(string[] lines) {
		BuildFromLines(this, lines);
	}

	private static void BuildFromLines(Table dictionary, string[] lines) {
		var entries =
			lines
				.Where(x => !string.IsNullOrWhiteSpace(x))
				.Select(static x => {
					// Splitting on the first equals sign allows for the key to be any length
					var split = x.IndexOf('=');

					// Pull key/value before entry creation so they can be reviewed if necessary
					var keyString = x[..split];
					var key = int.Parse(keyString, System.Globalization.NumberStyles.HexNumber);
					var value = x[(split + 1)..];

					return new TableFileEntry(key, keyString, value);
				});

		// Build actual dictionary
		foreach (var entry in entries) {
			dictionary[entry.Key] = entry;
		}
	}
}
