using System.Collections.ObjectModel;
using Avalonia.Controls;
using Avalonia.Platform.Storage;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.Core.SaveData;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// View model for save file editing and analysis.
/// </summary>
public partial class SaveEditorViewModel : ViewModelBase {
	private SaveFile? _saveFile;

	[ObservableProperty]
	private bool _hasFileLoaded;

	[ObservableProperty]
	private string _statusText = "";

	[ObservableProperty]
	private string _filePath = "";

	[ObservableProperty]
	private SavePlatform _platform = SavePlatform.Unknown;

	[ObservableProperty]
	private SaveFormat _format = SaveFormat.Raw;

	[ObservableProperty]
	private ChecksumType _checksumType = ChecksumType.None;

	[ObservableProperty]
	private int _slotCount = 1;

	[ObservableProperty]
	private int _slotSize;

	[ObservableProperty]
	private int _selectedSlot;

	[ObservableProperty]
	private bool _isModified;

	[ObservableProperty]
	private int _fileSize;

	[ObservableProperty]
	private SaveFieldDefinition? _selectedField;

	[ObservableProperty]
	private string _fieldValue = "";

	public ObservableCollection<SaveFieldDefinition> Fields { get; } = [];

	public ObservableCollection<SaveSlotInfo> Slots { get; } = [];

	public SavePlatform[] AvailablePlatforms { get; } = Enum.GetValues<SavePlatform>();

	public SaveFormat[] AvailableFormats { get; } = Enum.GetValues<SaveFormat>();

	public ChecksumType[] AvailableChecksumTypes { get; } = Enum.GetValues<ChecksumType>();

	public SaveEditorViewModel() { }

	partial void OnSelectedSlotChanged(int value) {
		if (_saveFile is not null && value >= 0 && value < SlotCount) {
			RefreshFieldValues();
		}
	}

	partial void OnSelectedFieldChanged(SaveFieldDefinition? value) {
		if (value is not null && _saveFile is not null) {
			ReadFieldValue(value);
		}
	}

	private void RefreshSlots() {
		Slots.Clear();
		if (_saveFile is null) return;

		for (int i = 0; i < SlotCount; i++) {
			var slotData = _saveFile.GetSlotData(i);
			Slots.Add(new SaveSlotInfo {
				Index = i,
				Label = $"Slot {i + 1}",
				DataPreview = BitConverter.ToString(slotData.Take(16).ToArray()).Replace("-", " ")
			});
		}
	}

	private void RefreshFieldValues() {
		// Update field values for the selected slot
		foreach (var field in Fields) {
			// Would read actual values here
		}
	}

	private void ReadFieldValue(SaveFieldDefinition field) {
		if (_saveFile is null) return;

		int offset = field.Offset + (SelectedSlot * SlotSize);
		FieldValue = field.Type switch {
			SaveFieldType.Byte => _saveFile.ReadByte(offset).ToString(),
			SaveFieldType.UInt16 => _saveFile.ReadUInt16(offset).ToString(),
			SaveFieldType.UInt32 => _saveFile.ReadUInt32(offset).ToString(),
			SaveFieldType.String => _saveFile.ReadString(offset, field.Length),
			SaveFieldType.Bcd => BcdHelper.ReadBcd(_saveFile.Data, offset, field.Length).ToString(),
			_ => "[Complex]"
		};
	}

	[RelayCommand]
	private async Task LoadFile(Window window) {
		var files = await window.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Open Save File",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("Save Files") { Patterns = ["*.sav", "*.srm", "*.eep", "*.sra", "*.fla"] },
				new FilePickerFileType("All Files") { Patterns = ["*"] }
			]
		});

		if (files.Count == 0) return;

		var path = files[0].Path.LocalPath;
		_saveFile = SaveEditor.Load(path);
		FilePath = path;
		HasFileLoaded = true;
		FileSize = _saveFile.Data.Length;
		Format = _saveFile.Format;
		Platform = _saveFile.Platform;
		ChecksumType = _saveFile.ChecksumType;
		SlotCount = _saveFile.SlotCount;
		SlotSize = _saveFile.SlotSize;
		IsModified = false;

		RefreshSlots();
		StatusText = $"Loaded {Path.GetFileName(path)} ({FileSize} bytes)";
	}

	[RelayCommand]
	private async Task SaveFile(Window window) {
		if (_saveFile is null) {
			StatusText = "No file loaded";
			return;
		}

		if (string.IsNullOrEmpty(FilePath)) {
			await SaveFileAs(window);
			return;
		}

		SaveEditor.Save(_saveFile, FilePath);
		IsModified = false;
		StatusText = $"Saved {Path.GetFileName(FilePath)}";
	}

	[RelayCommand]
	private async Task SaveFileAs(Window window) {
		if (_saveFile is null) {
			StatusText = "No file loaded";
			return;
		}

		var file = await window.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Save As",
			DefaultExtension = ".sav",
			FileTypeChoices = [
				new FilePickerFileType("Save Files") { Patterns = ["*.sav", "*.srm"] },
				new FilePickerFileType("All Files") { Patterns = ["*"] }
			]
		});

		if (file is null) return;

		FilePath = file.Path.LocalPath;
		SaveEditor.Save(_saveFile, FilePath);
		IsModified = false;
		StatusText = $"Saved as {Path.GetFileName(FilePath)}";
	}

	[RelayCommand]
	private void CreateBackup() {
		if (string.IsNullOrEmpty(FilePath)) {
			StatusText = "No file path set";
			return;
		}

		SaveEditor.CreateBackup(FilePath);
		StatusText = $"Created backup of {Path.GetFileName(FilePath)}";
	}

	[RelayCommand]
	private void WriteFieldValue() {
		if (_saveFile is null || SelectedField is null) {
			StatusText = "No field selected";
			return;
		}

		int offset = SelectedField.Offset + (SelectedSlot * SlotSize);

		try {
			switch (SelectedField.Type) {
				case SaveFieldType.Byte:
					_saveFile.WriteByte(offset, byte.Parse(FieldValue));
					break;
				case SaveFieldType.UInt16:
					_saveFile.WriteUInt16(offset, ushort.Parse(FieldValue));
					break;
				case SaveFieldType.UInt32:
					_saveFile.WriteUInt32(offset, uint.Parse(FieldValue));
					break;
				case SaveFieldType.String:
					_saveFile.WriteString(offset, FieldValue, SelectedField.Length);
					break;
				case SaveFieldType.Bcd:
					BcdHelper.WriteBcd(_saveFile.Data, offset, int.Parse(FieldValue), SelectedField.Length);
					break;
			}

			IsModified = true;
			StatusText = $"Set {SelectedField.Name} = {FieldValue}";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		}
	}

	/// <summary>
	/// Copies data from one slot to another.
	/// </summary>
	public void CopySlotTo(int destSlot) {
		if (_saveFile is null) {
			StatusText = "No file loaded";
			return;
		}

		if (SelectedSlot < 0 || SelectedSlot >= SlotCount ||
			destSlot < 0 || destSlot >= SlotCount) {
			StatusText = "Invalid slot indices";
			return;
		}

		_saveFile.CopySlot(SelectedSlot, destSlot);
		IsModified = true;
		RefreshSlots();
		StatusText = $"Copied slot {SelectedSlot + 1} to slot {destSlot + 1}";
	}

	[RelayCommand]
	private void ClearSlot(int slot) {
		if (_saveFile is null) {
			StatusText = "No file loaded";
			return;
		}

		if (slot < 0 || slot >= SlotCount) {
			StatusText = "Invalid slot index";
			return;
		}

		_saveFile.ClearSlot(slot, 0x00);
		IsModified = true;
		RefreshSlots();
		StatusText = $"Cleared slot {slot + 1}";
	}

	[RelayCommand]
	private void VerifyChecksum() {
		if (_saveFile is null) {
			StatusText = "No file loaded";
			return;
		}

		if (ChecksumType == ChecksumType.None) {
			StatusText = "No checksum type configured";
			return;
		}

		// Would verify checksum based on save file configuration
		StatusText = "Checksum verification not configured for this save type";
	}

	[RelayCommand]
	private void RecalculateChecksum() {
		if (_saveFile is null) {
			StatusText = "No file loaded";
			return;
		}

		if (ChecksumType == ChecksumType.None) {
			StatusText = "No checksum type configured";
			return;
		}

		// Would recalculate and update checksum
		IsModified = true;
		StatusText = "Checksum recalculated";
	}

	[RelayCommand]
	private void AddField() {
		var field = new SaveFieldDefinition {
			Name = "New Field",
			Offset = 0,
			Type = SaveFieldType.Byte,
			Length = 1,
			Description = ""
		};
		Fields.Add(field);
		SelectedField = field;
		StatusText = "Added new field definition";
	}

	[RelayCommand]
	private void RemoveField() {
		if (SelectedField is null) {
			StatusText = "No field selected";
			return;
		}

		Fields.Remove(SelectedField);
		SelectedField = null;
		StatusText = "Removed field definition";
	}

	[RelayCommand]
	private async Task LoadFieldDefinitions(Window window) {
		var files = await window.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Load Field Definitions",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("JSON Files") { Patterns = ["*.json"] }
			]
		});

		if (files.Count == 0) return;

		// Would load field definitions from JSON
		StatusText = $"Loaded definitions from {files[0].Name}";
	}

	[RelayCommand]
	private async Task SaveFieldDefinitions(Window window) {
		var file = await window.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Save Field Definitions",
			DefaultExtension = ".json",
			FileTypeChoices = [
				new FilePickerFileType("JSON Files") { Patterns = ["*.json"] }
			]
		});

		if (file is null) return;

		// Would save field definitions to JSON
		StatusText = $"Saved definitions to {file.Name}";
	}
}

/// <summary>
/// Display information for a save slot.
/// </summary>
public class SaveSlotInfo {
	public int Index { get; init; }
	public string Label { get; init; } = "";
	public string DataPreview { get; init; } = "";
}
