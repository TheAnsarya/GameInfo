using System.Collections.ObjectModel;
using System.IO;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.UI.Services;

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

	[ObservableProperty]
	private string _statusMessage = "";

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
	private async Task SaveDocumentAsync(Window? window) {
		if (window is null) return;

		// If we have a file path, save to it; otherwise prompt for location
		var path = FilePath;
		if (string.IsNullOrEmpty(path)) {
			var dialogService = FileDialogService.FromWindow(window);
			var suggestedName = DocumentTitle.Replace(":", " -").Replace(" - ", " - ") + ".wikitext";
			path = await dialogService.SaveFileAsync(
				"Save Wiki Document",
				".wikitext",
				suggestedName,
				FileDialogService.WikitextFiles,
				FileDialogService.AllFiles);

			if (string.IsNullOrEmpty(path)) return;
			FilePath = path;
		}

		await File.WriteAllTextAsync(path, DocumentContent);
		HasUnsavedChanges = false;
		StatusMessage = $"Saved to {Path.GetFileName(path)}";
	}

	[RelayCommand]
	private async Task SaveDocumentAsAsync(Window? window) {
		if (window is null) return;

		var dialogService = FileDialogService.FromWindow(window);
		var suggestedName = DocumentTitle.Replace(":", " -") + ".wikitext";
		var path = await dialogService.SaveFileAsync(
			"Save Wiki Document As",
			".wikitext",
			suggestedName,
			FileDialogService.WikitextFiles,
			FileDialogService.AllFiles);

		if (string.IsNullOrEmpty(path)) return;

		FilePath = path;
		DocumentTitle = Path.GetFileNameWithoutExtension(path);
		await File.WriteAllTextAsync(path, DocumentContent);
		HasUnsavedChanges = false;
		StatusMessage = $"Saved to {Path.GetFileName(path)}";
	}

	[RelayCommand]
	private async Task OpenDocumentAsync(Window? window) {
		if (window is null) return;

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.OpenFileAsync(
			"Open Wiki Document",
			FileDialogService.WikitextFiles,
			FileDialogService.AllFiles);

		if (string.IsNullOrEmpty(path)) return;

		await LoadDocumentFromPath(path);
	}

	/// <summary>
	/// Loads a document from the specified file path.
	/// </summary>
	public async Task LoadDocumentFromPath(string path) {
		if (!File.Exists(path)) {
			StatusMessage = $"File not found: {path}";
			return;
		}

		DocumentContent = await File.ReadAllTextAsync(path);
		FilePath = path;
		DocumentTitle = Path.GetFileNameWithoutExtension(path);
		HasUnsavedChanges = false;
		DetectDocumentType();
		StatusMessage = $"Loaded {Path.GetFileName(path)}";
	}

	/// <summary>
	/// Batch creates all standard wiki pages for a game in a selected folder.
	/// </summary>
	[RelayCommand]
	private async Task BatchCreatePagesAsync(Window? window) {
		if (window is null || _romFile is null) return;

		var dialogService = FileDialogService.FromWindow(window);
		var folder = await dialogService.SelectFolderAsync("Select Output Folder for Wiki Pages");
		if (string.IsNullOrEmpty(folder)) return;

		var info = _romFile.GetInfo();
		var gameTitle = info.Title ?? "Unknown Game";
		var platform = info.System;
		var prefix = $"{gameTitle} ({platform})";

		// Create standard pages
		var pages = new Dictionary<string, string> {
			[$"{prefix} - RAM map.wikitext"] = GenerateRamMapFromRom(info),
			[$"{prefix} - ROM map.wikitext"] = GenerateRomMapFromRom(info),
			[$"{prefix} - SRAM map.wikitext"] = GenerateSramMapFromRom(info),
			[$"{prefix} - TBL.wikitext"] = GenerateTextTableFromRom(info),
			[$"{prefix} - Values.wikitext"] = GenerateValuesFromRom(info),
			[$"{prefix} - Sub-pages.wikitext"] = GenerateSubPagesFromRom(info),
		};

		var created = 0;
		foreach (var (filename, content) in pages) {
			var path = Path.Combine(folder, filename);
			if (!File.Exists(path)) {
				await File.WriteAllTextAsync(path, content);
				created++;
			}
		}

		// Create Images subfolder
		var imagesFolder = Path.Combine(folder, "Images");
		if (!Directory.Exists(imagesFolder)) {
			Directory.CreateDirectory(imagesFolder);
		}

		StatusMessage = $"Created {created} wiki pages in {folder}";
	}

	/// <summary>
	/// Detects the document type based on content.
	/// </summary>
	private void DetectDocumentType() {
		if (DocumentContent.Contains("RAM map", StringComparison.OrdinalIgnoreCase) ||
			DocumentContent.Contains("Zero Page", StringComparison.OrdinalIgnoreCase)) {
			SelectedDocumentType = WikiDocumentType.RamMap;
		} else if (DocumentContent.Contains("ROM map", StringComparison.OrdinalIgnoreCase) ||
			DocumentContent.Contains("ROM layout", StringComparison.OrdinalIgnoreCase)) {
			SelectedDocumentType = WikiDocumentType.RomMap;
		} else if (DocumentContent.Contains("SRAM", StringComparison.OrdinalIgnoreCase) ||
			DocumentContent.Contains("Save", StringComparison.OrdinalIgnoreCase)) {
			SelectedDocumentType = WikiDocumentType.SramMap;
		} else if (DocumentContent.Contains("Character Table", StringComparison.OrdinalIgnoreCase) ||
			DocumentContent.Contains("text encoding", StringComparison.OrdinalIgnoreCase)) {
			SelectedDocumentType = WikiDocumentType.TextTable;
		}
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

	private string GenerateSramMapFromRom(RomInfo info) {
		return $$$"""
			{{Game|
			|title={{{info.Title ?? "Unknown"}}}
			|platform={{{info.System}}}
			}}

			This page documents the SRAM (save data) layout for {{{info.Title ?? "the game"}}}.

			== Save Slot Structure ==
			{| class="wikitable" border="1"
			|-
			! Offset !! Size !! Description
			|-
			| {{$|0000}} || ? || Save slot 1
			|-
			| {{$|????}} || ? || Save slot 2
			|-
			| {{$|????}} || ? || Save slot 3
			|}

			== Save Slot Contents ==
			{| class="wikitable" border="1"
			|-
			! Offset !! Size !! Description
			|-
			| {{$|00}} || 2 || Checksum
			|}

			== See Also ==
			* [[{{{info.Title}}} - RAM map|RAM Map]]
			* [[{{{info.Title}}} - ROM map|ROM Map]]
			""";
	}

	private string GenerateTextTableFromRom(RomInfo info) {
		return $$$"""
			{{Game|
			|title={{{info.Title ?? "Unknown"}}}
			|platform={{{info.System}}}
			}}

			This page documents the text encoding table for {{{info.Title ?? "the game"}}}.

			== Character Table ==
			{| class="wikitable" border="1"
			|-
			! Value !! Character !! Notes
			|-
			| {{$|00}} || (space) ||
			|-
			| {{$|0A}} || A ||
			|-
			| {{$|0B}} || B ||
			|-
			| {{$|0C}} || C ||
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

			== See Also ==
			* [[{{{info.Title}}} - ROM map|ROM Map]]
			* [[{{{info.Title}}} - Values|Values]]
			""";
	}

	private string GenerateValuesFromRom(RomInfo info) {
		return $$$"""
			{{Game|
			|title={{{info.Title ?? "Unknown"}}}
			|platform={{{info.System}}}
			}}

			This page lists game values and IDs for {{{info.Title ?? "the game"}}}.

			== Items ==
			{| class="wikitable" border="1"
			|-
			! ID !! Name !! Description
			|-
			| {{$|00}} || (None) ||
			|-
			| {{$|01}} || Item 1 ||
			|}

			== Enemies ==
			{| class="wikitable" border="1"
			|-
			! ID !! Name !! HP !! Attack !! Defense
			|-
			| {{$|00}} || Enemy 1 || ? || ? || ?
			|}

			== Spells/Abilities ==
			{| class="wikitable" border="1"
			|-
			! ID !! Name !! MP Cost !! Effect
			|}

			== See Also ==
			* [[{{{info.Title}}} - TBL|Text Table]]
			* [[{{{info.Title}}} - ROM map|ROM Map]]
			""";
	}

	private string GenerateSubPagesFromRom(RomInfo info) {
		return $$$"""
			{{Game|
			|title={{{info.Title ?? "Unknown"}}}
			|platform={{{info.System}}}
			}}

			== {{{info.Title ?? "Game"}}} Sub-pages ==

			=== Data Maps ===
			* [[{{{info.Title}}} - RAM map|RAM Map]] - Memory layout
			* [[{{{info.Title}}} - ROM map|ROM Map]] - ROM structure
			* [[{{{info.Title}}} - SRAM map|SRAM Map]] - Save data format

			=== Reference Tables ===
			* [[{{{info.Title}}} - TBL|Text Table]] - Character encoding
			* [[{{{info.Title}}} - Values|Values]] - IDs and constants

			=== Resources ===
			* [[Category:{{{info.Title}}}|All {{{info.Title}}} pages]]
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
