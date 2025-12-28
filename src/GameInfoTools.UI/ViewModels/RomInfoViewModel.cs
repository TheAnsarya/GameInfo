using System.Text;
using Avalonia;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for displaying ROM information.
/// </summary>
public partial class RomInfoViewModel : ViewModelBase {
	private readonly RomFile? _rom;

	[ObservableProperty]
	private string _fileName = "";

	[ObservableProperty]
	private string _filePath = "";

	[ObservableProperty]
	private string _fileSize = "";

	[ObservableProperty]
	private string _systemType = "";

	[ObservableProperty]
	private string _title = "";

	[ObservableProperty]
	private string _headerSize = "";

	[ObservableProperty]
	private string _mapper = "";

	[ObservableProperty]
	private string _prgRomSize = "";

	[ObservableProperty]
	private string _chrRomSize = "";

	[ObservableProperty]
	private string _hasBattery = "";

	[ObservableProperty]
	private string _mirroring = "";

	[ObservableProperty]
	private string _crc32 = "";

	[ObservableProperty]
	private string _md5 = "";

	[ObservableProperty]
	private string _sha1 = "";

	[ObservableProperty]
	private bool _hasRomLoaded;

	public RomInfoViewModel(RomFile? rom = null) {
		_rom = rom;
		RefreshInfo();
	}

	[RelayCommand]
	public void Refresh() => RefreshInfo();

	public void RefreshInfo() {
		if (_rom is null || !_rom.IsLoaded) {
			HasRomLoaded = false;
			return;
		}

		HasRomLoaded = true;
		var info = _rom.GetInfo();
		var header = _rom.Header;

		FileName = Path.GetFileName(_rom.FilePath);
		FilePath = _rom.FilePath;
		FileSize = $"{_rom.Length:N0} bytes ({_rom.Length / 1024.0:N1} KB)";
		SystemType = info.System.ToString();
		Title = info.Title ?? "(Unknown)";
		HeaderSize = $"{info.HeaderSize} bytes";

		if (header is not null) {
			Mapper = $"{header.Mapper}";
			PrgRomSize = $"{header.PrgRomSize:N0} bytes ({header.PrgRomSize / 1024} KB)";
			ChrRomSize = $"{header.ChrRomSize:N0} bytes ({header.ChrRomSize / 1024} KB)";
			HasBattery = header.HasBattery ? "Yes" : "No";
			Mirroring = header.Mirroring.ToString();
		}

		// Calculate checksums
		var data = _rom.AsSpan().ToArray();
		Crc32 = $"{Checksum.Crc32(data):x8}";
		Md5 = Checksum.Md5(data);
		Sha1 = Checksum.Sha1(data);
	}

	/// <summary>
	/// Gets the clipboard from the current application's main window.
	/// </summary>
	private static Avalonia.Input.Platform.IClipboard? GetClipboard() {
		if (Application.Current?.ApplicationLifetime is Avalonia.Controls.ApplicationLifetimes.IClassicDesktopStyleApplicationLifetime desktop) {
			return desktop.MainWindow?.Clipboard;
		}

		return null;
	}

	/// <summary>
	/// Copies ROM info to clipboard as plain text.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsText() {
		var clipboard = GetClipboard();
		if (clipboard is null || !HasRomLoaded) return;

		var sb = new StringBuilder();
		sb.AppendLine($"File: {FileName}");
		sb.AppendLine($"Size: {FileSize}");
		sb.AppendLine($"System: {SystemType}");
		sb.AppendLine($"Title: {Title}");
		sb.AppendLine($"Header: {HeaderSize}");
		sb.AppendLine($"Mapper: {Mapper}");
		sb.AppendLine($"PRG ROM: {PrgRomSize}");
		sb.AppendLine($"CHR ROM: {ChrRomSize}");
		sb.AppendLine($"Battery: {HasBattery}");
		sb.AppendLine($"Mirroring: {Mirroring}");
		sb.AppendLine($"CRC32: {Crc32}");
		sb.AppendLine($"MD5: {Md5}");
		sb.AppendLine($"SHA1: {Sha1}");

		await clipboard.SetTextAsync(sb.ToString());
	}

	/// <summary>
	/// Copies ROM info to clipboard as wikitext for Data Crystal.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsWikitext() {
		var clipboard = GetClipboard();
		if (clipboard is null || !HasRomLoaded) return;

		var sb = new StringBuilder();
		sb.AppendLine("{{Game|");
		sb.AppendLine($"|title={Title}");
		sb.AppendLine($"|platform={SystemType}");
		sb.AppendLine($"|size={_rom?.Length:N0} bytes");
		sb.AppendLine($"|mapper={Mapper}");
		sb.AppendLine("}}");
		sb.AppendLine();
		sb.AppendLine("== ROM Information ==");
		sb.AppendLine("{| class=\"wikitable\" border=\"1\"");
		sb.AppendLine("|-");
		sb.AppendLine("! Property !! Value");
		sb.AppendLine("|-");
		sb.AppendLine($"| File Name || {FileName}");
		sb.AppendLine("|-");
		sb.AppendLine($"| File Size || {FileSize}");
		sb.AppendLine("|-");
		sb.AppendLine($"| Header Size || {HeaderSize}");
		sb.AppendLine("|-");
		sb.AppendLine($"| PRG ROM || {PrgRomSize}");
		sb.AppendLine("|-");
		sb.AppendLine($"| CHR ROM || {ChrRomSize}");
		sb.AppendLine("|-");
		sb.AppendLine($"| Mapper || {Mapper}");
		sb.AppendLine("|-");
		sb.AppendLine($"| Battery || {HasBattery}");
		sb.AppendLine("|-");
		sb.AppendLine($"| Mirroring || {Mirroring}");
		sb.AppendLine("|}");
		sb.AppendLine();
		sb.AppendLine("== Checksums ==");
		sb.AppendLine("{| class=\"wikitable\" border=\"1\"");
		sb.AppendLine("|-");
		sb.AppendLine("! Algorithm !! Value");
		sb.AppendLine("|-");
		sb.AppendLine($"| CRC32 || <code>{Crc32}</code>");
		sb.AppendLine("|-");
		sb.AppendLine($"| MD5 || <code>{Md5}</code>");
		sb.AppendLine("|-");
		sb.AppendLine($"| SHA1 || <code>{Sha1}</code>");
		sb.AppendLine("|}");

		await clipboard.SetTextAsync(sb.ToString());
	}

	/// <summary>
	/// Copies ROM info to clipboard as Markdown.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsMarkdown() {
		var clipboard = GetClipboard();
		if (clipboard is null || !HasRomLoaded) return;

		var sb = new StringBuilder();
		sb.AppendLine($"# {Title}");
		sb.AppendLine();
		sb.AppendLine("## ROM Information");
		sb.AppendLine();
		sb.AppendLine("| Property | Value |");
		sb.AppendLine("|----------|-------|");
		sb.AppendLine($"| File Name | {FileName} |");
		sb.AppendLine($"| File Size | {FileSize} |");
		sb.AppendLine($"| System | {SystemType} |");
		sb.AppendLine($"| Header Size | {HeaderSize} |");
		sb.AppendLine($"| PRG ROM | {PrgRomSize} |");
		sb.AppendLine($"| CHR ROM | {ChrRomSize} |");
		sb.AppendLine($"| Mapper | {Mapper} |");
		sb.AppendLine($"| Battery | {HasBattery} |");
		sb.AppendLine($"| Mirroring | {Mirroring} |");
		sb.AppendLine();
		sb.AppendLine("## Checksums");
		sb.AppendLine();
		sb.AppendLine("| Algorithm | Value |");
		sb.AppendLine("|-----------|-------|");
		sb.AppendLine($"| CRC32 | `{Crc32}` |");
		sb.AppendLine($"| MD5 | `{Md5}` |");
		sb.AppendLine($"| SHA1 | `{Sha1}` |");

		await clipboard.SetTextAsync(sb.ToString());
	}

	/// <summary>
	/// Copies ROM info to clipboard as JSON.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsJson() {
		var clipboard = GetClipboard();
		if (clipboard is null || !HasRomLoaded) return;

		var json = System.Text.Json.JsonSerializer.Serialize(new {
			fileName = FileName,
			filePath = FilePath,
			fileSize = _rom?.Length,
			system = SystemType,
			title = Title,
			headerSize = HeaderSize,
			mapper = Mapper,
			prgRomSize = PrgRomSize,
			chrRomSize = ChrRomSize,
			hasBattery = HasBattery,
			mirroring = Mirroring,
			checksums = new {
				crc32 = Crc32,
				md5 = Md5,
				sha1 = Sha1
			}
		}, new System.Text.Json.JsonSerializerOptions { WriteIndented = true });

		await clipboard.SetTextAsync(json);
	}
}
