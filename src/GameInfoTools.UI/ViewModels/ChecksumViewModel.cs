using System.Text;
using Avalonia;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for checksum calculation.
/// </summary>
public partial class ChecksumViewModel : ViewModelBase {
	private readonly RomFile? _rom;

	[ObservableProperty]
	private string _crc32 = "";

	[ObservableProperty]
	private string _md5 = "";

	[ObservableProperty]
	private string _sha1 = "";

	[ObservableProperty]
	private string _nesChecksum = "";

	[ObservableProperty]
	private string _snesChecksum = "";

	[ObservableProperty]
	private string _snesComplement = "";

	[ObservableProperty]
	private string _gbHeaderChecksum = "";

	[ObservableProperty]
	private string _gbGlobalChecksum = "";

	[ObservableProperty]
	private string _verificationResult = "";

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private SystemType _detectedSystem;

	public ChecksumViewModel(RomFile? rom) {
		_rom = rom;
		CalculateChecksums();
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
	/// Copy checksums to clipboard as MediaWiki wikitext.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsWikitext() {
		var clipboard = GetClipboard();
		if (clipboard is null || !HasRomLoaded) return;

		var sb = new StringBuilder();
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

		if (!string.IsNullOrEmpty(NesChecksum)) {
			sb.AppendLine("|-");
			sb.AppendLine($"| NES Checksum || <code>{NesChecksum}</code>");
		}
		if (!string.IsNullOrEmpty(SnesChecksum)) {
			sb.AppendLine("|-");
			sb.AppendLine($"| SNES Checksum || <code>{SnesChecksum}</code>");
			sb.AppendLine("|-");
			sb.AppendLine($"| SNES Complement || <code>{SnesComplement}</code>");
		}
		if (!string.IsNullOrEmpty(GbHeaderChecksum)) {
			sb.AppendLine("|-");
			sb.AppendLine($"| GB Header Checksum || <code>{GbHeaderChecksum}</code>");
			sb.AppendLine("|-");
			sb.AppendLine($"| GB Global Checksum || <code>{GbGlobalChecksum}</code>");
		}

		sb.AppendLine("|}");

		await clipboard.SetTextAsync(sb.ToString());
	}

	/// <summary>
	/// Copy checksums to clipboard as plain text.
	/// </summary>
	[RelayCommand]
	private async Task CopyAsText() {
		var clipboard = GetClipboard();
		if (clipboard is null || !HasRomLoaded) return;

		var sb = new StringBuilder();
		sb.AppendLine($"CRC32: {Crc32}");
		sb.AppendLine($"MD5:   {Md5}");
		sb.AppendLine($"SHA1:  {Sha1}");

		if (!string.IsNullOrEmpty(NesChecksum))
			sb.AppendLine($"NES:   {NesChecksum}");
		if (!string.IsNullOrEmpty(SnesChecksum)) {
			sb.AppendLine($"SNES:  {SnesChecksum}");
			sb.AppendLine($"Comp:  {SnesComplement}");
		}
		if (!string.IsNullOrEmpty(GbHeaderChecksum)) {
			sb.AppendLine($"GB Hdr: {GbHeaderChecksum}");
			sb.AppendLine($"GB Gbl: {GbGlobalChecksum}");
		}

		await clipboard.SetTextAsync(sb.ToString());
	}

	[RelayCommand]
	private void CalculateChecksums() {
		if (_rom is null || !_rom.IsLoaded) {
			HasRomLoaded = false;
			return;
		}

		HasRomLoaded = true;
		var data = _rom.AsSpan().ToArray();
		var info = _rom.GetInfo();
		DetectedSystem = info.System;

		// Universal checksums
		Crc32 = $"{Checksum.Crc32(data):x8}";
		Md5 = Checksum.Md5(data);
		Sha1 = Checksum.Sha1(data);

		// System-specific checksums
		switch (info.System) {
			case SystemType.Nes:
				var header = _rom.Header;
				if (header is not null) {
					var nesSum = Checksum.NesChecksum(data, header.HeaderSize, header.PrgRomSize);
					NesChecksum = $"${nesSum:x4}";
				}

				break;

			case SystemType.Snes:
				var snesSum = Checksum.SnesChecksum(data);
				var snesComp = Checksum.SnesComplement(snesSum);
				SnesChecksum = $"${snesSum:x4}";
				SnesComplement = $"${snesComp:x4}";
				break;

			case SystemType.GameBoy:
			case SystemType.GameBoyColor:
				var gbHeader = Checksum.GameBoyHeaderChecksum(data);
				var gbGlobal = Checksum.GameBoyGlobalChecksum(data);
				GbHeaderChecksum = $"${gbHeader:x2}";
				GbGlobalChecksum = $"${gbGlobal:x4}";
				break;
		}

		// Verify checksums
		var result = Checksum.Verify(data, info.System);
		VerificationResult = result.IsValid ? $"✓ {result.Details}" : $"✗ {result.Details}";
	}

	[RelayCommand]
	private void FixChecksum() {
		if (_rom is null || !_rom.IsLoaded) return;

		var data = _rom.AsSpan().ToArray();
		var info = _rom.GetInfo();

		switch (info.System) {
			case SystemType.Snes:
				bool isHiRom = info.HeaderSize > 0x8000;
				Checksum.FixSnesChecksum(data, isHiRom);
				VerificationResult = "SNES checksum fixed";
				break;

			case SystemType.GameBoy:
			case SystemType.GameBoyColor:
				Checksum.FixGameBoyChecksum(data);
				VerificationResult = "Game Boy checksum fixed";
				break;

			default:
				VerificationResult = "Checksum fix not available for this system";
				break;
		}

		CalculateChecksums();
	}
}
