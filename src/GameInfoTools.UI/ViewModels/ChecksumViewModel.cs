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
