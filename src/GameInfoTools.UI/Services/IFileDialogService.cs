using Avalonia.Controls;
using Avalonia.Platform.Storage;

namespace GameInfoTools.UI.Services;

/// <summary>
/// Service interface for file dialog operations.
/// </summary>
public interface IFileDialogService {
	/// <summary>
	/// Shows an open file dialog.
	/// </summary>
	/// <param name="title">Dialog title.</param>
	/// <param name="filters">File type filters.</param>
	/// <returns>Selected file path or null if cancelled.</returns>
	Task<string?> OpenFileAsync(string title, params FilePickerFileType[] filters);

	/// <summary>
	/// Shows a save file dialog.
	/// </summary>
	/// <param name="title">Dialog title.</param>
	/// <param name="defaultExtension">Default file extension.</param>
	/// <param name="suggestedFileName">Suggested file name.</param>
	/// <param name="filters">File type filters.</param>
	/// <returns>Selected file path or null if cancelled.</returns>
	Task<string?> SaveFileAsync(string title, string? defaultExtension = null, string? suggestedFileName = null, params FilePickerFileType[] filters);

	/// <summary>
	/// Shows a folder picker dialog.
	/// </summary>
	/// <param name="title">Dialog title.</param>
	/// <returns>Selected folder path or null if cancelled.</returns>
	Task<string?> SelectFolderAsync(string title);
}

/// <summary>
/// Implementation of file dialog service using Avalonia storage provider.
/// </summary>
public class FileDialogService : IFileDialogService {
	private readonly TopLevel? _topLevel;

	/// <summary>
	/// Common file type filters for ROM files.
	/// </summary>
	public static FilePickerFileType RomFiles { get; } = new("ROM Files") {
		Patterns = ["*.nes", "*.sfc", "*.smc", "*.gb", "*.gbc", "*.gba"]
	};

	/// <summary>
	/// Common file type filters for text table files.
	/// </summary>
	public static FilePickerFileType TblFiles { get; } = new("Text Table Files") {
		Patterns = ["*.tbl"]
	};

	/// <summary>
	/// Common file type filters for JSON files.
	/// </summary>
	public static FilePickerFileType JsonFiles { get; } = new("JSON Files") {
		Patterns = ["*.json"]
	};

	/// <summary>
	/// Common file type filters for PNG files.
	/// </summary>
	public static FilePickerFileType PngFiles { get; } = new("PNG Images") {
		Patterns = ["*.png"]
	};

	/// <summary>
	/// Common file type filters for BMP files.
	/// </summary>
	public static FilePickerFileType BmpFiles { get; } = new("BMP Images") {
		Patterns = ["*.bmp"]
	};

	/// <summary>
	/// Common file type filters for image files.
	/// </summary>
	public static FilePickerFileType ImageFiles { get; } = new("Image Files") {
		Patterns = ["*.png", "*.bmp", "*.jpg", "*.jpeg", "*.gif"]
	};

	/// <summary>
	/// Common file type filters for text files.
	/// </summary>
	public static FilePickerFileType TextFiles { get; } = new("Text Files") {
		Patterns = ["*.txt"]
	};

	/// <summary>
	/// All files filter.
	/// </summary>
	public static FilePickerFileType AllFiles { get; } = new("All Files") {
		Patterns = ["*.*"]
	};

	public FileDialogService(TopLevel? topLevel = null) {
		_topLevel = topLevel;
	}

	/// <summary>
	/// Gets the storage provider from a window reference.
	/// </summary>
	public static FileDialogService FromWindow(Window? window) {
		return new FileDialogService(TopLevel.GetTopLevel(window));
	}

	public async Task<string?> OpenFileAsync(string title, params FilePickerFileType[] filters) {
		if (_topLevel is null) return null;

		var options = new FilePickerOpenOptions {
			Title = title,
			AllowMultiple = false,
			FileTypeFilter = filters.Length > 0 ? filters : [AllFiles]
		};

		var files = await _topLevel.StorageProvider.OpenFilePickerAsync(options);
		return files.Count > 0 ? files[0].Path.LocalPath : null;
	}

	public async Task<string?> SaveFileAsync(string title, string? defaultExtension = null, string? suggestedFileName = null, params FilePickerFileType[] filters) {
		if (_topLevel is null) return null;

		var options = new FilePickerSaveOptions {
			Title = title,
			DefaultExtension = defaultExtension,
			SuggestedFileName = suggestedFileName,
			FileTypeChoices = filters.Length > 0 ? filters : [AllFiles]
		};

		var file = await _topLevel.StorageProvider.SaveFilePickerAsync(options);
		return file?.Path.LocalPath;
	}

	public async Task<string?> SelectFolderAsync(string title) {
		if (_topLevel is null) return null;

		var options = new FolderPickerOpenOptions {
			Title = title,
			AllowMultiple = false
		};

		var folders = await _topLevel.StorageProvider.OpenFolderPickerAsync(options);
		return folders.Count > 0 ? folders[0].Path.LocalPath : null;
	}
}
