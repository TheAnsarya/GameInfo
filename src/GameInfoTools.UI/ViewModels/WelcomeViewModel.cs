namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Welcome screen view model shown when no ROM is loaded.
/// </summary>
public partial class WelcomeViewModel : ViewModelBase {
	public string Title => "Welcome to GameInfo Tools";
	public string Description => "A cross-platform ROM hacking and analysis toolkit.";
	public string Instructions => "Open a ROM file to get started (File → Open ROM or Ctrl+O)";

	public string[] Features { get; } = [
		"📁 ROM Info - View header information, checksums, and metadata",
		"🔢 Checksum Calculator - Calculate and verify ROM checksums",
		"📝 Text Extractor - Extract and search game text using TBL files",
		"🎨 CHR Editor - View and edit tile graphics (NES/SNES/GB)",
		"⚙️ Disassembler - Disassemble 6502/65816 code",
		"📊 Data Tables - Edit game data (monsters, items, etc.)",
		"🔍 Pointer Scanner - Find and analyze pointer tables",
		"💾 Hex Editor - Low-level hex editing",
		"🗂️ Bank View - View ROM banks and their contents"
	];

	public string[] SupportedPlatforms { get; } = [
		"NES (.nes)",
		"SNES (.sfc, .smc)",
		"Game Boy (.gb, .gbc)",
		"Game Boy Advance (.gba)"
	];
}
