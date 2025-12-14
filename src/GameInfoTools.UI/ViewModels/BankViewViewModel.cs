using System.Collections.ObjectModel;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.UI.Services;
using SystemType = GameInfoTools.Core.SystemType;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for ROM bank visualization and navigation.
/// </summary>
public partial class BankViewViewModel : ViewModelBase {
	private readonly RomFile? _rom;

	/// <summary>
	/// Event raised when user wants to view an offset in hex editor.
	/// </summary>
	public event Action<int>? NavigateToHexEditor;

	/// <summary>
	/// Event raised when user wants to view an offset in disassembler.
	/// </summary>
	public event Action<int>? NavigateToDisassembler;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private int _selectedBankIndex = -1;

	[ObservableProperty]
	private int _bankSize = 0x4000; // Default 16KB banks (NES PRG-ROM)

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _bankDetails = "";

	[ObservableProperty]
	private string _cpuAddressRange = "";

	[ObservableProperty]
	private SystemType _selectedSystem = SystemType.Nes;

	public ObservableCollection<BankInfo> Banks { get; } = [];

	public BankInfo? SelectedBank => SelectedBankIndex >= 0 && SelectedBankIndex < Banks.Count
		? Banks[SelectedBankIndex]
		: null;

	public BankViewViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded) {
			DetectBankSize();
			RefreshBankList();
		}
	}

	private void DetectBankSize() {
		if (_rom is null) return;

		var info = _rom.GetInfo();
		// Try to detect system from ROM
		BankSize = info.System switch {
			SystemType.Nes => 0x4000, // 16KB PRG banks
			SystemType.Snes => 0x8000, // 32KB banks (LoROM)
			SystemType.GameBoy or SystemType.GameBoyColor => 0x4000, // 16KB banks
			SystemType.GameBoyAdvance => 0x10000, // 64KB (varies)
			SystemType.Genesis => 0x8000, // 32KB
			_ => 0x4000 // Default 16KB
		};

		SelectedSystem = info.System;
	}

	public void RefreshBankList() {
		if (_rom is null || !_rom.IsLoaded) return;

		Banks.Clear();

		var info = _rom.GetInfo();
		int headerSize = info.HeaderSize;
		int dataSize = _rom.Length - headerSize;
		int bankCount = (dataSize + BankSize - 1) / BankSize;

		for (int i = 0; i < bankCount; i++) {
			int offset = headerSize + (i * BankSize);
			int size = Math.Min(BankSize, _rom.Length - offset);

			// Calculate CPU address based on system
			string cpuAddress = SelectedSystem switch {
				SystemType.Nes => GetNesCpuAddress(i),
				SystemType.Snes => GetSnesCpuAddress(i),
				SystemType.GameBoy or SystemType.GameBoyColor => GetGbCpuAddress(i),
				_ => $"Bank {i}"
			};

			Banks.Add(new BankInfo(
				i,
				$"Bank {i:D2}",
				offset,
				size,
				cpuAddress,
				AnalyzeBankContent(offset, size)
			));
		}

		StatusText = $"Found {Banks.Count} banks ({BankSize / 1024}KB each)";
	}

	private static string GetNesCpuAddress(int bank) {
		// NES PRG banks typically map to $8000-$BFFF and $C000-$FFFF
		return bank % 2 == 0
			? $"$8000-$BFFF"
			: $"$C000-$FFFF";
	}

	private static string GetSnesCpuAddress(int bank) {
		// LoROM: banks map to $xx:8000-$xx:FFFF
		int hiBank = bank + 0x80; // Start at bank $80
		return $"${hiBank:X2}:8000-${hiBank:X2}:FFFF";
	}

	private static string GetGbCpuAddress(int bank) {
		// GB: Bank 0 at $0000-$3FFF, others at $4000-$7FFF
		return bank == 0
			? "$0000-$3FFF"
			: $"$4000-$7FFF (Bank {bank})";
	}

	private string AnalyzeBankContent(int offset, int size) {
		if (_rom is null) return "Unknown";

		var data = _rom.Data.AsSpan(offset, size);

		// Simple heuristics to identify bank content
		int zeroCount = 0;
		int ffCount = 0;
		int textLikeCount = 0;
		int codePatternCount = 0;

		for (int i = 0; i < data.Length; i++) {
			if (data[i] == 0x00) zeroCount++;
			else if (data[i] == 0xff) ffCount++;
			else if (data[i] is >= 0x20 and < 0x7f) textLikeCount++;

			// Look for 6502 code patterns (JSR, JMP, RTS, etc.)
			if (data[i] is 0x20 or 0x4c or 0x60 or 0xa9 or 0xa5 or 0x85) {
				codePatternCount++;
			}
		}

		float emptyRatio = (float)(zeroCount + ffCount) / size;
		float textRatio = (float)textLikeCount / size;
		float codeRatio = (float)codePatternCount / size;

		if (emptyRatio > 0.9f) return "Empty/Padding";
		if (textRatio > 0.5f) return "Text/Strings";
		if (codeRatio > 0.1f) return "Code";
		return "Data/Graphics";
	}

	[RelayCommand]
	private void SelectBank(int index) {
		if (index < 0 || index >= Banks.Count) return;

		SelectedBankIndex = index;
		var bank = Banks[index];

		BankDetails = $"""
			Bank: {bank.Name}
			File Offset: 0x{bank.FileOffset:X6}
			Size: {bank.Size:N0} bytes ({bank.Size / 1024}KB)
			CPU Address: {bank.CpuAddress}
			Content Type: {bank.ContentType}
			""";

		CpuAddressRange = bank.CpuAddress;
		StatusText = $"Selected {bank.Name}";
	}

	[RelayCommand]
	private void SetBankSize(int size) {
		BankSize = size;
		RefreshBankList();
		StatusText = $"Bank size set to {size / 1024}KB";
	}

	[RelayCommand]
	private void SetSystem(SystemType system) {
		SelectedSystem = system;
		BankSize = system switch {
			SystemType.Nes => 0x4000,
			SystemType.Snes => 0x8000,
			SystemType.GameBoy or SystemType.GameBoyColor => 0x4000,
			SystemType.GameBoyAdvance => 0x10000,
			SystemType.Genesis => 0x8000,
			_ => 0x4000
		};
		RefreshBankList();
	}

	[RelayCommand]
	private async Task ExportBank(Window? window) {
		if (SelectedBank is null || _rom is null) {
			StatusText = "No bank selected";
			return;
		}

		if (window is null) {
			StatusText = "Unable to open file dialog";
			return;
		}

		var bank = SelectedBank;
		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			$"Export {bank.Name}",
			".bin",
			$"bank{bank.Index:D2}.bin",
			FileDialogService.BinaryFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		try {
			// Extract bank data
			var bankData = new byte[bank.Size];
			int actualSize = Math.Min(bank.Size, _rom.Length - bank.FileOffset);
			if (actualSize > 0) {
				Array.Copy(_rom.Data, bank.FileOffset, bankData, 0, actualSize);
			}

			await File.WriteAllBytesAsync(path, bankData);
			StatusText = $"Exported {bank.Name} ({actualSize} bytes) to {Path.GetFileName(path)}";
		} catch (Exception ex) {
			StatusText = $"Export error: {ex.Message}";
		}
	}

	[RelayCommand]
	private void ViewInHexEditor() {
		if (SelectedBank is null) return;

		NavigateToHexEditor?.Invoke(SelectedBank.FileOffset);
		StatusText = $"Opening {SelectedBank.Name} in hex editor at offset 0x{SelectedBank.FileOffset:X6}";
	}

	[RelayCommand]
	private void ViewDisassembly() {
		if (SelectedBank is null) return;

		NavigateToDisassembler?.Invoke(SelectedBank.FileOffset);
		StatusText = $"Disassembling {SelectedBank.Name} from offset 0x{SelectedBank.FileOffset:X6}";
	}
}

/// <summary>
/// Information about a ROM bank.
/// </summary>
public record BankInfo(
	int Index,
	string Name,
	int FileOffset,
	int Size,
	string CpuAddress,
	string ContentType
);
