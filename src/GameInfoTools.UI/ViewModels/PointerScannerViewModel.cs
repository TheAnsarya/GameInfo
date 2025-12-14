using System.Collections.ObjectModel;
using System.IO;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core;
using GameInfoTools.UI.Services;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for pointer table scanning and analysis.
/// </summary>
public partial class PointerScannerViewModel : ViewModelBase {
	private readonly RomFile? _rom;

	[ObservableProperty]
	private bool _hasRomLoaded;

	[ObservableProperty]
	private int _startOffset;

	[ObservableProperty]
	private int _endOffset;

	[ObservableProperty]
	private int _pointerSize = 2;

	[ObservableProperty]
	private int _minPointers = 4;

	[ObservableProperty]
	private bool _littleEndian = true;

	[ObservableProperty]
	private int _validRangeStart = 0x8000;

	[ObservableProperty]
	private int _validRangeEnd = 0xffff;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private PointerTableInfo? _selectedTable;

	[ObservableProperty]
	private int _minTableSize = 4;

	[ObservableProperty]
	private double _minConfidence = 0.7;

	public ObservableCollection<PointerTableInfo> PointerTables { get; } = [];

	public ObservableCollection<string> SelectedPointers { get; } = [];

	public ObservableCollection<PointerTableResult> FoundTables { get; } = [];

	public ObservableCollection<PointerEntry> SelectedTablePointers { get; } = [];

	public string[] PointerFormats { get; } = ["16-bit LE", "16-bit BE", "24-bit LE", "24-bit BE"];

	[ObservableProperty]
	private string _selectedFormat = "16-bit LE";

	public int TableCount => PointerTables.Count;

	public PointerScannerViewModel(RomFile? rom) {
		_rom = rom;
		HasRomLoaded = rom is not null && rom.IsLoaded;

		if (HasRomLoaded && rom is not null) {
			EndOffset = rom.Length;
			DetectSystemDefaults();
		}
	}

	private void DetectSystemDefaults() {
		if (_rom is null) return;

		var info = _rom.GetInfo();
		switch (info.System) {
			case SystemType.Nes:
				PointerSize = 2;
				ValidRangeStart = 0x8000;
				ValidRangeEnd = 0xffff;
				break;
			case SystemType.Snes:
				PointerSize = 3;
				ValidRangeStart = 0x8000;
				ValidRangeEnd = 0xffffff;
				break;
			case SystemType.GameBoy:
				PointerSize = 2;
				ValidRangeStart = 0x0000;
				ValidRangeEnd = 0x7fff;
				break;
			default:
				PointerSize = 2;
				ValidRangeStart = 0x0000;
				ValidRangeEnd = 0xffff;
				break;
		}
	}

	[RelayCommand]
	private void ScanForPointerTables() {
		if (_rom is null || !_rom.IsLoaded) {
			StatusText = "No ROM loaded";
			return;
		}

		FoundTables.Clear();
		StatusText = "Scanning for pointer tables...";

		var data = _rom.Data;
		int end = Math.Min(EndOffset, data.Length);

		for (int i = StartOffset; i < end - (PointerSize * MinPointers); i++) {
			int count = CountConsecutivePointers(data, i);

			if (count >= MinPointers) {
				var targetAddresses = new List<int>();
				for (int j = 0; j < count; j++) {
					targetAddresses.Add(ReadPointer(data, i + (j * PointerSize)));
				}

				FoundTables.Add(new PointerTableResult(
					$"0x{i:X6}",
					count,
					PointerSize * count,
					$"0x{targetAddresses.Min():X4} - 0x{targetAddresses.Max():X4}",
					i
				));

				// Skip past this table
				i += (count * PointerSize) - 1;
			}
		}

		StatusText = $"Found {FoundTables.Count} potential pointer tables";
	}

	private int CountConsecutivePointers(byte[] data, int start) {
		int count = 0;
		int pos = start;

		while (pos + PointerSize <= data.Length) {
			int pointer = ReadPointer(data, pos);

			if (!IsValidPointer(pointer)) {
				break;
			}

			count++;
			pos += PointerSize;

			// Limit to reasonable table size
			if (count >= 256) break;
		}

		return count;
	}

	private int ReadPointer(byte[] data, int offset) {
		if (offset + PointerSize > data.Length) return -1;

		int value = 0;
		if (LittleEndian) {
			for (int i = 0; i < PointerSize; i++) {
				value |= data[offset + i] << (i * 8);
			}
		} else {
			for (int i = 0; i < PointerSize; i++) {
				value = (value << 8) | data[offset + i];
			}
		}

		return value;
	}

	private bool IsValidPointer(int pointer) {
		return pointer >= ValidRangeStart && pointer <= ValidRangeEnd;
	}

	[RelayCommand]
	private void SelectTable(PointerTableResult? table) {
		if (table is null || _rom is null) return;

		SelectedTablePointers.Clear();

		var data = _rom.Data;
		int offset = table.RawOffset;
		int count = table.EntryCount;

		for (int i = 0; i < count; i++) {
			int pointer = ReadPointer(data, offset + (i * PointerSize));
			string preview = GetDataPreview(data, pointer);

			SelectedTablePointers.Add(new PointerEntry(
				i,
				$"0x{offset + (i * PointerSize):X6}",
				$"0x{pointer:X4}",
				preview
			));
		}

		StatusText = $"Selected table at {table.Offset} with {count} entries";
	}

	private string GetDataPreview(byte[] data, int address) {
		// Try to get a preview of data at the pointer target
		// This is system-dependent and simplified here
		if (_rom?.Header is not null) {
			int fileOffset = address - 0x8000 + _rom.Header.HeaderSize;
			if (fileOffset >= 0 && fileOffset < data.Length) {
				var preview = new byte[Math.Min(8, data.Length - fileOffset)];
				Array.Copy(data, fileOffset, preview, 0, preview.Length);
				return string.Join(" ", preview.Select(b => $"{b:X2}"));
			}
		}

		return "(cannot resolve)";
	}

	[RelayCommand]
	private async Task ExportResultsAsync(Window? window) {
		if (FoundTables.Count == 0) {
			StatusText = "No tables to export";
			return;
		}

		if (window is null) return;

		var dialogService = FileDialogService.FromWindow(window);
		var path = await dialogService.SaveFileAsync(
			"Export Pointer Tables",
			".txt",
			"pointer_tables.txt",
			FileDialogService.TextFiles,
			FileDialogService.WikitextFiles,
			FileDialogService.AllFiles
		);

		if (path is null) return;

		var sb = new System.Text.StringBuilder();

		if (path.EndsWith(".wikitext", StringComparison.OrdinalIgnoreCase) ||
			path.EndsWith(".wiki", StringComparison.OrdinalIgnoreCase)) {
			// Export as wikitext
			sb.AppendLine("== Pointer Tables ==");
			sb.AppendLine("{| class=\"wikitable sortable\" border=\"1\"");
			sb.AppendLine("|-");
			sb.AppendLine("! Offset !! Entries !! Size !! Target Range");

			foreach (var table in FoundTables) {
				var offsetHex = table.Offset.TrimStart('$', '0', 'x');
				sb.AppendLine("|-");
				sb.AppendLine($"| {{{{$|{offsetHex}}}}} || {table.EntryCount} || {table.Size} || {table.TargetRange}");
			}

			sb.AppendLine("|}");
		} else {
			// Export as markdown
			sb.AppendLine("# Pointer Table Scan Results");
			sb.AppendLine();

			foreach (var table in FoundTables) {
				sb.AppendLine($"## Table at {table.Offset}");
				sb.AppendLine($"- Entries: {table.EntryCount}");
				sb.AppendLine($"- Size: {table.Size} bytes");
				sb.AppendLine($"- Target Range: {table.TargetRange}");
				sb.AppendLine();
			}
		}

		await File.WriteAllTextAsync(path, sb.ToString());
		StatusText = $"Exported {FoundTables.Count} tables to {Path.GetFileName(path)}";
	}

	[RelayCommand]
	private void ClearResults() {
		FoundTables.Clear();
		SelectedTablePointers.Clear();
		PointerTables.Clear();
		SelectedPointers.Clear();
		StatusText = "Results cleared";
	}

	[RelayCommand]
	private void Scan() => ScanForPointerTables();

	[RelayCommand]
	private void ScanRange() {
		// TODO: Show dialog for range selection
		ScanForPointerTables();
	}

	[RelayCommand]
	private async Task ExportAsync(Window? window) => await ExportResultsAsync(window);

	partial void OnSelectedTableChanged(PointerTableInfo? value) {
		SelectedPointers.Clear();
		if (value is null || _rom is null) return;

		var data = _rom.Data;
		int offset = int.Parse(value.Offset.Replace("0x", ""), System.Globalization.NumberStyles.HexNumber);

		for (int i = 0; i < value.Count && i < 50; i++) {
			int ptr = ReadPointer(data, offset + (i * PointerSize));
			SelectedPointers.Add($"[{i:D3}] 0x{ptr:X4}");
		}
	}
}

/// <summary>
/// Represents a found pointer table.
/// </summary>
public record PointerTableResult(string Offset, int EntryCount, int Size, string TargetRange, int RawOffset);

/// <summary>
/// Represents a single pointer entry.
/// </summary>
public record PointerEntry(int Index, string TableOffset, string TargetAddress, string DataPreview);

/// <summary>
/// Pointer table info for UI display.
/// </summary>
public record PointerTableInfo(string Offset, int Count, string Format, double Confidence, string Description);
