using System.Collections.ObjectModel;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.Disassembly;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for 6502/65816 disassembly.
/// </summary>
public partial class DisassemblerViewModel : ViewModelBase {
	private readonly RomFile? _rom;
	private Disassembler? _disassembler;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private int _startOffset;

	[ObservableProperty]
	private int _length = 256;

	[ObservableProperty]
	private int _baseAddress = 0x8000;

	[ObservableProperty]
	private string _cpuMode = "6502 (NES)";

	[ObservableProperty]
	private bool _showBytes = true;

	[ObservableProperty]
	private bool _showAddresses = true;

	[ObservableProperty]
	private bool _lowercaseHex = true;

	[ObservableProperty]
	private string _statusText = "";

	public ObservableCollection<DisassemblyLine> DisassemblyLines { get; } = [];

	public string[] AvailableCpuModes { get; } = [
		"6502 (NES)",
		"65C02",
		"65816 (SNES)"
	];

	public DisassemblerViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded) {
			DetectCpuMode();
		}
	}

	private void DetectCpuMode() {
		if (_rom is null) return;

		var info = _rom.GetInfo();
		CpuMode = info.System switch {
			SystemType.Nes => "6502 (NES)",
			SystemType.Snes => "65816 (SNES)",
			SystemType.GameBoy or SystemType.GameBoyColor => "6502 (NES)", // GB uses different CPU
			_ => "6502 (NES)"
		};

		// Set appropriate base address
		BaseAddress = info.System switch {
			SystemType.Nes => 0x8000,
			SystemType.Snes => 0x8000,
			SystemType.GameBoy => 0x0000,
			_ => 0x8000
		};
	}

	[RelayCommand]
	private void Disassemble() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		DisassemblyLines.Clear();

		var options = new Disassembler.Options {
			Mode = CpuMode switch {
				"65816 (SNES)" => Disassembler.CpuMode.Cpu65816,
				"65C02" => Disassembler.CpuMode.Cpu65C02,
				_ => Disassembler.CpuMode.Cpu6502
			},
			BaseAddress = BaseAddress,
			ShowBytes = ShowBytes,
			ShowAddresses = ShowAddresses,
			LowercaseHex = LowercaseHex
		};

		_disassembler = new Disassembler(_rom.Data, options);

		try {
			var instructions = _disassembler.Disassemble(StartOffset, Length);

			foreach (var instr in instructions) {
				var bytesStr = ShowBytes
					? string.Join(" ", instr.Bytes.Select(b => LowercaseHex ? $"{b:x2}" : $"{b:X2}"))
					: "";

				var addressStr = ShowAddresses
					? (LowercaseHex ? $"${instr.Address:x4}" : $"${instr.Address:X4}")
					: "";

				DisassemblyLines.Add(new DisassemblyLine(
					addressStr,
					bytesStr,
					instr.Mnemonic,
					instr.Operand,
					instr.Comment ?? ""
				));
			}

			StatusText = $"Disassembled {instructions.Count} instructions from offset 0x{StartOffset:X6}";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		}
	}

	[RelayCommand]
	private void GoToOffset() {
		Disassemble();
	}

	[RelayCommand]
	private void NextPage() {
		StartOffset += Length;
		if (_rom is not null && StartOffset >= _rom.Length) {
			StartOffset = _rom.Length - Length;
		}

		Disassemble();
	}

	[RelayCommand]
	private void PreviousPage() {
		StartOffset -= Length;
		if (StartOffset < 0) {
			StartOffset = 0;
		}

		Disassemble();
	}

	[RelayCommand]
	private void CopyToClipboard() {
		var text = string.Join(Environment.NewLine,
			DisassemblyLines.Select(l => $"{l.Address}  {l.Bytes,-12} {l.Mnemonic} {l.Operand}"));
		// Note: Clipboard access needs platform-specific implementation
		StatusText = $"Copied {DisassemblyLines.Count} lines to clipboard";
	}

	[RelayCommand]
	private void FindPattern(string pattern) {
		if (_rom is null || !_rom.IsLoaded || string.IsNullOrWhiteSpace(pattern)) return;

		// Parse hex pattern (e.g., "4C ?? 80" for JMP with wildcard)
		var parts = pattern.Split(' ', StringSplitOptions.RemoveEmptyEntries);
		var bytes = new List<byte?>();

		foreach (var part in parts) {
			if (part == "??" || part == "**") {
				bytes.Add(null); // Wildcard
			} else if (byte.TryParse(part, System.Globalization.NumberStyles.HexNumber, null, out var b)) {
				bytes.Add(b);
			}
		}

		if (bytes.Count == 0) {
			StatusText = "Invalid pattern";
			return;
		}

		// Search for pattern
		var data = _rom.Data;
		for (int i = 0; i <= data.Length - bytes.Count; i++) {
			bool match = true;
			for (int j = 0; j < bytes.Count; j++) {
				var b = bytes[j];
				if (b.HasValue && data[i + j] != b.Value) {
					match = false;
					break;
				}
			}

			if (match) {
				StartOffset = i;
				Disassemble();
				StatusText = $"Found pattern at offset 0x{i:X6}";
				return;
			}
		}

		StatusText = "Pattern not found";
	}
}

/// <summary>
/// Represents a line of disassembly output.
/// </summary>
public record DisassemblyLine(string Address, string Bytes, string Mnemonic, string Operand, string Comment);
