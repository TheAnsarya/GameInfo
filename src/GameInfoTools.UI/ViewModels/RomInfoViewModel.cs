using CommunityToolkit.Mvvm.ComponentModel;
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
	private string _system = "";

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
	private bool _hasBattery;

	[ObservableProperty]
	private bool _hasTrainer;

	[ObservableProperty]
	private string _crc32 = "";

	[ObservableProperty]
	private string _md5 = "";

	[ObservableProperty]
	private string _sha1 = "";

	[ObservableProperty]
	private bool _hasRomLoaded;

	public RomInfoViewModel(RomFile? rom) {
		_rom = rom;
		RefreshInfo();
	}

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
		System = info.System.ToString();
		Title = info.Title ?? "(Unknown)";
		HeaderSize = $"{info.HeaderSize} bytes";

		if (header is not null) {
			Mapper = header.Mapper.ToString();
			PrgRomSize = $"{header.PrgRomSize:N0} bytes ({header.PrgRomSize / 1024} KB)";
			ChrRomSize = $"{header.ChrRomSize:N0} bytes ({header.ChrRomSize / 1024} KB)";
			HasBattery = header.HasBattery;
			HasTrainer = header.HasTrainer;
		}

		// Calculate checksums
		var data = _rom.AsSpan().ToArray();
		Crc32 = $"{Checksum.Crc32(data):x8}";
		Md5 = Checksum.Md5(data);
		Sha1 = Checksum.Sha1(data);
	}
}
