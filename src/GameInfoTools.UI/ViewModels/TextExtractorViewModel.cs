using System.Collections.ObjectModel;
using System.Text;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Text;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for text extraction and searching.
/// </summary>
public partial class TextExtractorViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private TextTable? _textTable;
	private StringExtractor? _extractor;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private string _searchPattern = "";

	[ObservableProperty]
	private int _minStringLength = 3;

	[ObservableProperty]
	private double _minConfidence = 0.7;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _tableInfo = "No table loaded";

	[ObservableProperty]
	private bool _hasTableLoaded;

	public ObservableCollection<ExtractedStringItem> ExtractedStrings { get; } = [];

	public TextExtractorViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;
	}

	[RelayCommand]
	private void LoadDefaultTable() {
		// Create a basic ASCII table
		var tableContent = """
			20=
			21=!
			22="
			23=#
			24=$
			25=%
			26=&
			27='
			28=(
			29=)
			2a=*
			2b=+
			2c=,
			2d=-
			2e=.
			2f=/
			30=0
			31=1
			32=2
			33=3
			34=4
			35=5
			36=6
			37=7
			38=8
			39=9
			3a=:
			3b=;
			3c=<
			3d==
			3e=>
			3f=?
			40=@
			41=A
			42=B
			43=C
			44=D
			45=E
			46=F
			47=G
			48=H
			49=I
			4a=J
			4b=K
			4c=L
			4d=M
			4e=N
			4f=O
			50=P
			51=Q
			52=R
			53=S
			54=T
			55=U
			56=V
			57=W
			58=X
			59=Y
			5a=Z
			5b=[
			5c=\
			5d=]
			5e=^
			5f=_
			60=`
			61=a
			62=b
			63=c
			64=d
			65=e
			66=f
			67=g
			68=h
			69=i
			6a=j
			6b=k
			6c=l
			6d=m
			6e=n
			6f=o
			70=p
			71=q
			72=r
			73=s
			74=t
			75=u
			76=v
			77=w
			78=x
			79=y
			7a=z
			""";

		_textTable = TextTable.FromString(tableContent);
		_extractor = new StringExtractor(_textTable);
		HasTableLoaded = true;
		TableInfo = $"ASCII table loaded ({_textTable.EntryCount} entries)";
		StatusText = "Default ASCII table loaded";
	}

	[RelayCommand]
	private void ExtractStrings() {
		if (_rom is null || !_rom.IsLoaded || _extractor is null) {
			StatusText = "No ROM or table loaded";
			return;
		}

		ExtractedStrings.Clear();
		StatusText = "Extracting strings...";

		var data = _rom.AsSpan().ToArray();
		var results = _extractor.ExtractAllStrings(data, MinStringLength, (float)MinConfidence);

		foreach (var result in results) {
			ExtractedStrings.Add(new ExtractedStringItem(
				$"0x{result.Offset:x6}",
				result.Text,
				result.Length,
				$"{result.Confidence:P0}"
			));
		}

		StatusText = $"Found {ExtractedStrings.Count} strings";
	}

	[RelayCommand]
	private void Search() {
		if (_rom is null || !_rom.IsLoaded || string.IsNullOrWhiteSpace(SearchPattern)) {
			return;
		}

		ExtractedStrings.Clear();
		StatusText = $"Searching for '{SearchPattern}'...";

		var data = _rom.AsSpan().ToArray();

		// Simple byte search for ASCII pattern
		var pattern = System.Text.Encoding.ASCII.GetBytes(SearchPattern);
		var matches = new List<int>();

		for (int i = 0; i <= data.Length - pattern.Length; i++) {
			bool found = true;
			for (int j = 0; j < pattern.Length; j++) {
				if (data[i + j] != pattern[j]) {
					found = false;
					break;
				}
			}

			if (found) {
				matches.Add(i);
			}
		}

		foreach (var offset in matches) {
			// Extract context around match
			int start = Math.Max(0, offset - 10);
			int end = Math.Min(data.Length, offset + SearchPattern.Length + 10);
			var context = System.Text.Encoding.ASCII.GetString(data.AsSpan(start, end - start));

			ExtractedStrings.Add(new ExtractedStringItem(
				$"0x{offset:x6}",
				context.Replace('\0', '.'),
				end - start,
				"100%"
			));
		}

		StatusText = $"Found {matches.Count} matches for '{SearchPattern}'";
	}

	[RelayCommand]
	private void ClearResults() {
		ExtractedStrings.Clear();
		StatusText = "Results cleared";
	}

	[RelayCommand]
	private async Task LoadTable(Window? window) {
		if (window is null) {
			StatusText = "Unable to open file dialog";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Load Text Table",
			FileDialogService.TblFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var content = await File.ReadAllTextAsync(path);
			_textTable = TextTable.FromString(content);
			_extractor = new StringExtractor(_textTable);
			HasTableLoaded = true;
			TableInfo = $"{Path.GetFileName(path)} ({_textTable.EntryCount} entries)";
			StatusText = $"Loaded table: {path}";
		} catch (Exception ex) {
			StatusText = $"Error loading table: {ex.Message}";
		}
	}

	[RelayCommand]
	private async Task Export(Window? window) {
		if (window is null) {
			StatusText = "Unable to open file dialog";
			return;
		}

		if (ExtractedStrings.Count == 0) {
			StatusText = "No strings to export";
			return;
		}

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Extracted Strings",
			".txt",
			"extracted_strings.txt",
			FileDialogService.TextFiles,
			FileDialogService.JsonFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			var sb = new StringBuilder();

			if (path.EndsWith(".json", StringComparison.OrdinalIgnoreCase)) {
				// Export as JSON
				sb.AppendLine("[");
				for (int i = 0; i < ExtractedStrings.Count; i++) {
					var item = ExtractedStrings[i];
					sb.Append($"  {{ \"offset\": \"{item.Offset}\", \"text\": \"{EscapeJson(item.Text)}\", \"length\": {item.Length}, \"confidence\": \"{item.Confidence}\" }}");
					sb.AppendLine(i < ExtractedStrings.Count - 1 ? "," : "");
				}

				sb.AppendLine("]");
			} else {
				// Export as plain text
				sb.AppendLine($"# Extracted Strings from ROM");
				sb.AppendLine($"# Total: {ExtractedStrings.Count} strings");
				sb.AppendLine();

				foreach (var item in ExtractedStrings) {
					sb.AppendLine($"{item.Offset}: {item.Text}");
				}
			}

			await File.WriteAllTextAsync(path, sb.ToString());
			StatusText = $"Exported {ExtractedStrings.Count} strings to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	private static string EscapeJson(string text) {
		return text
			.Replace("\\", "\\\\")
			.Replace("\"", "\\\"")
			.Replace("\n", "\\n")
			.Replace("\r", "\\r")
			.Replace("\t", "\\t");
	}
}

/// <summary>
/// Represents an extracted string result.
/// </summary>
public record ExtractedStringItem(string Offset, string Text, int Length, string Confidence);
