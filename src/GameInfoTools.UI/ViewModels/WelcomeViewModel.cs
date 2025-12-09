using System.Collections.ObjectModel;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Welcome screen view model shown when no ROM is loaded.
/// </summary>
public partial class WelcomeViewModel : ViewModelBase {
	public string Title => "Welcome to GameInfo Tools";
	public string Description => "A cross-platform ROM hacking and analysis toolkit.";
	public string Instructions => "Open a ROM file to get started (File → Open ROM or Ctrl+O)";
	public string Version => "Version 1.0.0";

	public ObservableCollection<FeatureInfo> Features { get; } = [
		new("📁", "ROM Info", "View header information, checksums, and metadata"),
		new("🔢", "Checksum Calculator", "Calculate and verify ROM checksums"),
		new("📝", "Text Extractor", "Extract and search game text using TBL files"),
		new("🎨", "CHR Editor", "View and edit tile graphics (NES/SNES/GB)"),
		new("⚙️", "Disassembler", "Disassemble 6502/65816 code"),
		new("📊", "Data Tables", "Edit game data (monsters, items, etc.)"),
		new("🔍", "Pointer Scanner", "Find and analyze pointer tables"),
		new("💾", "Hex Editor", "Low-level hex editing"),
		new("🗂️", "Bank View", "View ROM banks and their contents")
	];

	public string[] SupportedPlatforms { get; } = [
		"NES (.nes)",
		"SNES (.sfc, .smc)",
		"Game Boy (.gb, .gbc)",
		"Game Boy Advance (.gba)"
	];
}

/// <summary>
/// Feature info for welcome screen display.
/// </summary>
public record FeatureInfo(string Icon, string Title, string Description);

