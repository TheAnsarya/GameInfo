using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for the Wiki Editor tool.
/// Provides editing capabilities for Data Crystal wikitext files.
/// </summary>
public partial class WikiEditorViewModel : ViewModelBase {
	private readonly RomFile? _romFile;

	[ObservableProperty]
	private string _documentTitle = "New Document";

	[ObservableProperty]
	private string _documentContent = "";

	[ObservableProperty]
	private string _filePath = "";

	[ObservableProperty]
	private WikiDocumentType _selectedDocumentType = WikiDocumentType.RamMap;

	[ObservableProperty]
	private bool _hasUnsavedChanges;

	[ObservableProperty]
	private string _previewHtml = "";

	[ObservableProperty]
	private bool _showPreview;

	/// <summary>
	/// Indicates whether generation from ROM is available (ROM is loaded).
	/// </summary>
	public bool CanGenerateFromRom => _romFile != null;

	public ObservableCollection<WikiDocumentType> DocumentTypes { get; } = [
		WikiDocumentType.RamMap,
		WikiDocumentType.RomMap,
		WikiDocumentType.SramMap,
		WikiDocumentType.TextTable,
		WikiDocumentType.Values,
		WikiDocumentType.SubPages,
		WikiDocumentType.MainPage,
		WikiDocumentType.Notes,
		WikiDocumentType.Custom
	];

	public ObservableCollection<WikiTemplate> Templates { get; } = [
		new WikiTemplate("RAM Map", WikiDocumentType.RamMap, GetRamMapTemplate()),
		new WikiTemplate("ROM Map", WikiDocumentType.RomMap, GetRomMapTemplate()),
		new WikiTemplate("SRAM Map", WikiDocumentType.SramMap, GetSramMapTemplate()),
		new WikiTemplate("Text Table (TBL)", WikiDocumentType.TextTable, GetTextTableTemplate()),
		new WikiTemplate("Values Table", WikiDocumentType.Values, GetValuesTemplate()),
		new WikiTemplate("Sub-pages", WikiDocumentType.SubPages, GetSubPagesTemplate()),
	];

	[ObservableProperty]
	private WikiTemplate? _selectedTemplate;

	public WikiEditorViewModel(RomFile? romFile = null) {
		_romFile = romFile;

		// Set initial content based on ROM info if available
		if (_romFile?.GetInfo() is { } info) {
			DocumentTitle = $"{info.Title ?? "Unknown"} ({info.System})";
		}
	}

	partial void OnSelectedTemplateChanged(WikiTemplate? value) {
		if (value is not null && string.IsNullOrWhiteSpace(DocumentContent)) {
			DocumentContent = value.Content;
			SelectedDocumentType = value.Type;
			HasUnsavedChanges = true;
		}
	}

	partial void OnDocumentContentChanged(string value) {
		HasUnsavedChanges = true;
		if (ShowPreview) {
			UpdatePreview();
		}
	}

	[RelayCommand]
	private void InsertTable() {
		var table = """
			{| class="wikitable" border="1"
			|-
			! Header 1 !! Header 2 !! Description
			|-
			| Value 1 || Value 2 || Description here
			|-
			| Value 1 || Value 2 || Description here
			|}
			""";
		InsertText(table);
	}

	[RelayCommand]
	private void InsertRamEntry() {
		var entry = """
			|-
			| {{$|0000}} || 1 || Description
			""";
		InsertText(entry);
	}

	[RelayCommand]
	private void InsertRomEntry() {
		var entry = """
			|-
			| {{$|00000}} || Size || Description || Notes
			""";
		InsertText(entry);
	}

	[RelayCommand]
	private void InsertTextTableEntry() {
		var entry = """
			|-
			| {{$|00}} || A
			""";
		InsertText(entry);
	}

	[RelayCommand]
	private void InsertHexValue() {
		InsertText("{{$|00}}");
	}

	[RelayCommand]
	private void InsertLink() {
		InsertText("[[Page Name|Display Text]]");
	}

	[RelayCommand]
	private void InsertSection() {
		InsertText("\n== Section Name ==\n");
	}

	[RelayCommand]
	private void InsertSubSection() {
		InsertText("\n=== SubSection Name ===\n");
	}

	[RelayCommand]
	private void TogglePreview() {
		ShowPreview = !ShowPreview;
		if (ShowPreview) {
			UpdatePreview();
		}
	}

	[RelayCommand]
	private void NewDocument() {
		DocumentContent = "";
		DocumentTitle = "New Document";
		FilePath = "";
		HasUnsavedChanges = false;
	}

	[RelayCommand]
	private void GenerateFromRom() {
		if (_romFile is null) return;

		var info = _romFile.GetInfo();
		var content = SelectedDocumentType switch {
			WikiDocumentType.RamMap => GenerateRamMapFromRom(info),
			WikiDocumentType.RomMap => GenerateRomMapFromRom(info),
			_ => DocumentContent
		};

		DocumentContent = content;
	}

	private void InsertText(string text) {
		// In a real implementation, this would insert at cursor position
		DocumentContent += "\n" + text;
	}

	private void UpdatePreview() {
		// Basic wikitext to HTML conversion for preview
		PreviewHtml = ConvertWikitextToHtml(DocumentContent);
	}

	private static string ConvertWikitextToHtml(string wikitext) {
		// Basic conversion - in production use a proper parser
		var html = wikitext
			.Replace("{{$|", "<code>$")
			.Replace("}}", "</code>")
			.Replace("{|", "<table>")
			.Replace("|}", "</table>")
			.Replace("|-", "</tr><tr>")
			.Replace("!!", "</th><th>")
			.Replace("||", "</td><td>")
			.Replace("| ", "<td>")
			.Replace("! ", "<th>");

		// Handle headers
		html = System.Text.RegularExpressions.Regex.Replace(
			html, @"^===\s*(.+?)\s*===$", "<h3>$1</h3>",
			System.Text.RegularExpressions.RegexOptions.Multiline);
		html = System.Text.RegularExpressions.Regex.Replace(
			html, @"^==\s*(.+?)\s*==$", "<h2>$1</h2>",
			System.Text.RegularExpressions.RegexOptions.Multiline);

		return $"<html><body style='font-family: sans-serif;'>{html}</body></html>";
	}

	private string GenerateRamMapFromRom(RomInfo info) {
		return $$$"""
			{{Game|
			|title={{{info.Title ?? "Unknown"}}}
			|platform={{{info.System}}}
			}}

			This page documents the RAM layout for {{{info.Title ?? "the game"}}}.

			== Zero Page ($0000-$00FF) ==
			{| class="wikitable" border="1"
			|-
			! Address !! Size !! Description
			|-
			| {{$|0000}} || 1 || Game state
			|-
			| {{$|0001}} || 1 || Frame counter
			|}

			== Main RAM ==
			{| class="wikitable" border="1"
			|-
			! Address !! Size !! Description
			|}

			== See Also ==
			* [[{{{info.Title}}} - ROM map|ROM Map]]
			* [[{{{info.Title}}} - SRAM map|SRAM Map]]
			""";
	}

	private string GenerateRomMapFromRom(RomInfo info) {
		var banks = _romFile?.Length / 0x4000 ?? 0; // Assuming 16KB banks for NES

		return $$$"""
			{{Game|
			|title={{{info.Title ?? "Unknown"}}}
			|platform={{{info.System}}}
			|size={{{_romFile?.Length:N0}}} bytes
			}}

			This page documents the ROM layout for {{{info.Title ?? "the game"}}}.

			== Header ==
			{| class="wikitable" border="1"
			|-
			! Offset !! Size !! Description
			|-
			| {{$|00000}} || 16 || {{{info.System}}} Header
			|}

			== Banks ==
			ROM contains {{{banks}}} banks.

			=== Bank 0 ===
			{| class="wikitable" border="1"
			|-
			! Offset !! Size !! Description !! Notes
			|}

			== See Also ==
			* [[{{{info.Title}}} - RAM map|RAM Map]]
			* [[{{{info.Title}}} - TBL|Text Table]]
			""";
	}

	private static string GetRamMapTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the RAM layout.

		== Zero Page ==
		{| class="wikitable" border="1"
		|-
		! Address !! Size !! Description
		|}

		== Main RAM ==
		{| class="wikitable" border="1"
		|-
		! Address !! Size !! Description
		|}
		""";

	private static string GetRomMapTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the ROM layout.

		== Header ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Description
		|}

		== Data Sections ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Description !! Notes
		|}
		""";

	private static string GetSramMapTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the SRAM (save data) layout.

		== Save Slot 1 ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Description
		|}

		== Checksum ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Description
		|}
		""";

	private static string GetTextTableTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the text encoding table.

		== Character Table ==
		{| class="wikitable" border="1"
		|-
		! Value !! Character
		|-
		| {{$|00}} || (space)
		|-
		| {{$|0A}} || A
		|-
		| {{$|0B}} || B
		|}

		== Control Codes ==
		{| class="wikitable" border="1"
		|-
		! Value !! Description
		|-
		| {{$|FE}} || Line break
		|-
		| {{$|FF}} || End of string
		|}
		""";

	private static string GetValuesTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page lists game values and IDs.

		== Items ==
		{| class="wikitable" border="1"
		|-
		! ID !! Name !! Description
		|-
		| {{$|00}} || Item 1 || Description
		|}

		== Enemies ==
		{| class="wikitable" border="1"
		|-
		! ID !! Name !! HP !! Attack
		|}
		""";

	private static string GetSubPagesTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		== Sub-pages ==
		* [[Game Title - RAM map|RAM Map]]
		* [[Game Title - ROM map|ROM Map]]
		* [[Game Title - SRAM map|SRAM Map]]
		* [[Game Title - TBL|Text Table]]
		* [[Game Title - Values|Values]]
		""";
}

/// <summary>
/// Types of wiki documents that can be created.
/// </summary>
public enum WikiDocumentType {
	RamMap,
	RomMap,
	SramMap,
	TextTable,
	Values,
	SubPages,
	MainPage,
	Notes,
	Custom
}

/// <summary>
/// Represents a wiki document template.
/// </summary>
public record WikiTemplate(string Name, WikiDocumentType Type, string Content);
