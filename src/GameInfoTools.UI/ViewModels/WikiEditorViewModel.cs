using System.Collections.ObjectModel;
using System.IO;
using System.Text;
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
		WikiDocumentType.Graphics,
		WikiDocumentType.Maps,
		WikiDocumentType.Audio,
		WikiDocumentType.DataStructures,
		WikiDocumentType.ScriptCommands,
		WikiDocumentType.EnemyStats,
		WikiDocumentType.ItemList,
		WikiDocumentType.Custom
	];

	public ObservableCollection<WikiTemplate> Templates { get; } = [
		new WikiTemplate("RAM Map", WikiDocumentType.RamMap, GetRamMapTemplate()),
		new WikiTemplate("ROM Map", WikiDocumentType.RomMap, GetRomMapTemplate()),
		new WikiTemplate("SRAM Map", WikiDocumentType.SramMap, GetSramMapTemplate()),
		new WikiTemplate("Text Table (TBL)", WikiDocumentType.TextTable, GetTextTableTemplate()),
		new WikiTemplate("Values Table", WikiDocumentType.Values, GetValuesTemplate()),
		new WikiTemplate("Sub-pages", WikiDocumentType.SubPages, GetSubPagesTemplate()),
		new WikiTemplate("Graphics/CHR", WikiDocumentType.Graphics, GetGraphicsTemplate()),
		new WikiTemplate("Maps/Levels", WikiDocumentType.Maps, GetMapsTemplate()),
		new WikiTemplate("Music/Sound", WikiDocumentType.Audio, GetAudioTemplate()),
		new WikiTemplate("Data Structures", WikiDocumentType.DataStructures, GetDataStructuresTemplate()),
		new WikiTemplate("Script Commands", WikiDocumentType.ScriptCommands, GetScriptCommandsTemplate()),
		new WikiTemplate("Enemy Stats", WikiDocumentType.EnemyStats, GetEnemyStatsTemplate()),
		new WikiTemplate("Item List", WikiDocumentType.ItemList, GetItemListTemplate()),
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
	/// Generates a comprehensive analysis wiki document from the loaded ROM.
	/// </summary>
	[RelayCommand]
	private void GenerateRomAnalysis() {
		if (_romFile is null) {
			StatusMessage = "No ROM loaded";
			return;
		}

		var info = _romFile.GetInfo();
		var sb = new StringBuilder();

		var gameTitle = info.Title ?? "Unknown Game";
		var platform = info.System.ToString();

		sb.AppendLine($$$"""
			{{Game|
			|title={{{gameTitle}}}
			|platform={{{platform}}}
			}}

			This page was auto-generated from ROM analysis.

			== ROM Information ==
			{| class="wikitable" border="1"
			|-
			! Property !! Value
			|-
			| '''Title''' || {{{gameTitle}}}
			|-
			| '''Platform''' || {{{platform}}}
			|-
			| '''File Size''' || {{{info.Size:N0}}} bytes ({{$|{{{info.Size:x6}}}}})
			|-
			| '''Header Size''' || {{{info.HeaderSize}}} bytes
			|-
			| '''Mapper''' || {{{info.Mapper}}}
			|}

			""");

		// Add ROM structure analysis
		sb.AppendLine("== ROM Structure ==");
		sb.AppendLine();

		if (info.System is SystemType.Nes) {
			var prgSize = Math.Max(0, info.Size - info.HeaderSize - (info.Size > 0x8000 ? 0x2000 : 0));
			var chrSize = info.Size > prgSize + info.HeaderSize ? info.Size - prgSize - info.HeaderSize : 0;

			sb.AppendLine($$$"""
				{| class="wikitable" border="1"
				|-
				! Section !! Offset !! Size !! Description
				|-
				| Header || {{$|000000}} || {{{info.HeaderSize}}} || iNES/NES 2.0 header
				|-
				| PRG ROM || {{$|{{{info.HeaderSize:x6}}}}} || ~{{{prgSize:N0}}} || Program code and data
				|-
				| CHR ROM || (varies) || ~{{{chrSize:N0}}} || Graphics/tile data
				|}

				""");
		} else if (info.System is SystemType.Snes) {
			sb.AppendLine($$$"""
				{| class="wikitable" border="1"
				|-
				! Section !! Description
				|-
				| Header || SMC/SFC header (if present)
				|-
				| Internal Header || At $00FFB0-$00FFFF (LoROM) or $00FFB0-$00FFFF (HiROM)
				|-
				| PRG || Program code
				|-
				| Data || Graphics, maps, text
				|}

				""");
		}

		// Memory map sections
		sb.AppendLine("== Memory Map (Template) ==");
		sb.AppendLine();
		sb.AppendLine($$$"""
			=== Zero Page ({{$|00}}-{{$|FF}}) ===
			{| class="wikitable" border="1"
			|-
			! Address !! Size !! Description
			|-
			| {{$|00}} || 1 || (to be documented)
			|}

			=== RAM ({{$|0100}}-{{$|07FF}}) ===
			{| class="wikitable" border="1"
			|-
			! Address !! Size !! Description
			|-
			| {{$|0100}} || $100 || Stack
			|}

			""");

		// Bank structure
		sb.AppendLine("== Bank Structure ==");
		sb.AppendLine();

		var bankSize = info.System switch {
			SystemType.Nes => 0x4000, // 16KB banks typical
			SystemType.Snes => 0x8000, // 32KB banks typical
			_ => 0x4000
		};

		var bankCount = Math.Max(1, (info.Size - info.HeaderSize) / bankSize);
		sb.AppendLine($$$"""
			{| class="wikitable" border="1"
			|-
			! Bank !! File Offset !! Size !! Description
			""");

		for (int i = 0; i < Math.Min(bankCount, 32); i++) {
			var offset = info.HeaderSize + (i * bankSize);
			sb.AppendLine($$$"""
				|-
				| {{{i}}} || {{$|{{{offset:x6}}}}} || {{$|{{{bankSize:x4}}}}} ||
				""");
		}

		if (bankCount > 32) {
			sb.AppendLine($"|-\n| colspan=\"4\" | ''... and {bankCount - 32} more banks''");
		}

		sb.AppendLine("|}");
		sb.AppendLine();

		// Sub-pages links
		sb.AppendLine("== Related Pages ==");
		sb.AppendLine($"* [[{gameTitle} ({platform}) - RAM map|RAM Map]]");
		sb.AppendLine($"* [[{gameTitle} ({platform}) - ROM map|ROM Map]]");
		sb.AppendLine($"* [[{gameTitle} ({platform}) - SRAM map|SRAM Map]]");
		sb.AppendLine($"* [[{gameTitle} ({platform}) - TBL|Text Table]]");
		sb.AppendLine($"* [[{gameTitle} ({platform}) - Values|Values]]");
		sb.AppendLine();

		sb.AppendLine("[[Category:Games]]");
		sb.AppendLine($"[[Category:{platform} games]]");

		DocumentContent = sb.ToString();
		DocumentTitle = $"{gameTitle} ({platform}) - Analysis";
		SelectedDocumentType = WikiDocumentType.MainPage;
		HasUnsavedChanges = true;
		StatusMessage = "Generated ROM analysis wiki page";
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

	private static string GetGraphicsTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the graphics/CHR data layout.

		== CHR Banks ==
		{| class="wikitable" border="1"
		|-
		! Bank !! Offset !! Size !! Description
		|-
		| 0 || {{$|000000}} || $2000 || Background tiles
		|-
		| 1 || {{$|002000}} || $2000 || Sprite tiles
		|}

		== Sprite Table ==
		{| class="wikitable" border="1"
		|-
		! ID !! Tile !! Palette !! Size !! Description
		|-
		| {{$|00}} || {{$|00}} || 0 || 8x8 || Player idle
		|}

		== Palette Data ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Palette !! Colors !! Usage
		|-
		| {{$|xxxxxx}} || BG 0 || $0F,$00,$10,$30 || Main background
		|}
		""";

	private static string GetMapsTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the map/level data layout.

		== Map Pointer Table ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Description
		|-
		| {{$|xxxxxx}} || Pointer table start
		|}

		== Map Data Format ==
		{| class="wikitable" border="1"
		|-
		! Byte !! Description
		|-
		| 0 || Width
		|-
		| 1 || Height
		|-
		| 2+ || Tile data (row-major)
		|}

		== Map List ==
		{| class="wikitable" border="1"
		|-
		! ID !! Name !! Width !! Height !! Offset
		|-
		| {{$|00}} || Map 1 || 16 || 16 || {{$|xxxxxx}}
		|}

		== Tileset References ==
		{| class="wikitable" border="1"
		|-
		! Map ID !! Tileset !! Palette
		|}
		""";

	private static string GetAudioTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the music and sound data.

		== Music Tracks ==
		{| class="wikitable" border="1"
		|-
		! ID !! Name !! Offset !! Length
		|-
		| {{$|00}} || Title Screen || {{$|xxxxxx}} ||
		|-
		| {{$|01}} || Overworld || {{$|xxxxxx}} ||
		|}

		== Sound Effects ==
		{| class="wikitable" border="1"
		|-
		! ID !! Name !! Description
		|-
		| {{$|00}} || Confirm || Menu selection
		|-
		| {{$|01}} || Cancel || Back/Cancel
		|}

		== Audio Engine ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Description
		|-
		| {{$|xxxxxx}} || || Sound engine code
		|-
		| {{$|xxxxxx}} || || Instrument data
		|}
		""";

	private static string GetDataStructuresTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents data structures used in the game.

		== Structure Name ==

		Size: X bytes per entry

		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Type !! Description
		|-
		| +0 || 1 || byte || Field 1
		|-
		| +1 || 2 || word || Field 2
		|-
		| +3 || 1 || byte || Flags (see below)
		|}

		=== Flags ===
		{| class="wikitable" border="1"
		|-
		! Bit !! Description
		|-
		| 0 || Flag 1
		|-
		| 1 || Flag 2
		|-
		| 7 || Flag 8
		|}

		== Pointer Tables ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Description !! Entry Size !! Count
		|}
		""";

	private static string GetScriptCommandsTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page documents the script/event command system.

		== Script Engine ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Description
		|-
		| {{$|xxxxxx}} || Script interpreter
		|-
		| {{$|xxxxxx}} || Command table
		|}

		== Commands ==
		{| class="wikitable" border="1"
		|-
		! Opcode !! Mnemonic !! Args !! Description
		|-
		| {{$|00}} || END || 0 || End script
		|-
		| {{$|01}} || WAIT || 1 || Wait N frames
		|-
		| {{$|02}} || JUMP || 2 || Jump to address
		|-
		| {{$|03}} || CALL || 2 || Call subroutine
		|-
		| {{$|04}} || RET || 0 || Return from call
		|-
		| {{$|05}} || MSG || 2 || Display message
		|}

		== Text Commands ==
		{| class="wikitable" border="1"
		|-
		! Code !! Description
		|-
		| {{$|FE}} || Line break
		|-
		| {{$|FF}} || End of text
		|}
		""";

	private static string GetEnemyStatsTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page lists enemy statistics.

		== Enemy Data Format ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Description
		|-
		| +0 || 2 || HP
		|-
		| +2 || 1 || Attack
		|-
		| +3 || 1 || Defense
		|-
		| +4 || 2 || Experience
		|-
		| +6 || 2 || Gold
		|}

		== Enemy List ==
		{| class="wikitable sortable" border="1"
		|-
		! ID !! Name !! HP !! ATK !! DEF !! EXP !! Gold
		|-
		| {{$|00}} || Enemy 1 || 10 || 5 || 3 || 5 || 2
		|-
		| {{$|01}} || Enemy 2 || 20 || 8 || 5 || 10 || 5
		|}

		== Boss Data ==
		{| class="wikitable" border="1"
		|-
		! ID !! Name !! HP !! Location
		|}
		""";

	private static string GetItemListTemplate() => """
		{{Game|
		|title=Game Title
		|platform=NES/SNES/etc
		}}

		This page lists items and equipment.

		== Item Data Format ==
		{| class="wikitable" border="1"
		|-
		! Offset !! Size !! Description
		|-
		| +0 || 1 || Type (0=consumable, 1=weapon, 2=armor, etc.)
		|-
		| +1 || 1 || Effect value
		|-
		| +2 || 2 || Price
		|}

		== Consumable Items ==
		{| class="wikitable sortable" border="1"
		|-
		! ID !! Name !! Effect !! Price
		|-
		| {{$|00}} || Herb || Restore 30 HP || 8
		|}

		== Weapons ==
		{| class="wikitable sortable" border="1"
		|-
		! ID !! Name !! Attack !! Price !! Usable By
		|-
		| {{$|00}} || Wooden Sword || +5 || 50 || Hero
		|}

		== Armor ==
		{| class="wikitable sortable" border="1"
		|-
		! ID !! Name !! Defense !! Price !! Usable By
		|}

		== Key Items ==
		{| class="wikitable" border="1"
		|-
		! ID !! Name !! Description
		|}
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
	Graphics,
	Maps,
	Audio,
	DataStructures,
	ScriptCommands,
	EnemyStats,
	ItemList,
	Custom
}

/// <summary>
/// Represents a wiki document template.
/// </summary>
public record WikiTemplate(string Name, WikiDocumentType Type, string Content);
