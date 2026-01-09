using Avalonia.Controls;
using Avalonia.Platform.Storage;
using GameInfoTools.Core.Project.ViewModels;

namespace GameInfoTools.UI.Views;

/// <summary>
/// Code-behind for the Create Project Wizard view.
/// </summary>
public partial class CreateProjectWizard : UserControl {
	/// <summary>
	/// Creates a new instance of the wizard.
	/// </summary>
	public CreateProjectWizard() {
		InitializeComponent();
		DataContextChanged += OnDataContextChanged;
	}

	private void OnDataContextChanged(object? sender, EventArgs e) {
		if (DataContext is CreateProjectWizardViewModel vm) {
			vm.BrowseForRomRequested += OnBrowseForRomRequested;
			vm.BrowseForProjectRequested += OnBrowseForProjectRequested;
		}
	}

	private async void OnBrowseForRomRequested(object? sender, EventArgs e) {
		if (DataContext is not CreateProjectWizardViewModel vm) return;

		var topLevel = TopLevel.GetTopLevel(this);
		if (topLevel is null) return;

		var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Select ROM File",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("ROM Files") {
					Patterns = ["*.nes", "*.sfc", "*.smc", "*.gb", "*.gbc", "*.gba", "*.bin"]
				},
				new FilePickerFileType("NES ROMs") { Patterns = ["*.nes"] },
				new FilePickerFileType("SNES ROMs") { Patterns = ["*.sfc", "*.smc"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			]
		});

		if (files.Count > 0) {
			vm.RomPath = files[0].Path.LocalPath;
		}
	}

	private async void OnBrowseForProjectRequested(object? sender, EventArgs e) {
		if (DataContext is not CreateProjectWizardViewModel vm) return;

		var topLevel = TopLevel.GetTopLevel(this);
		if (topLevel is null) return;

		var file = await topLevel.StorageProvider.SaveFilePickerAsync(new FilePickerSaveOptions {
			Title = "Save Project As",
			DefaultExtension = ".giproj",
			SuggestedFileName = vm.ProjectName ?? "NewProject",
			FileTypeChoices = [
				new FilePickerFileType("GameInfo Project") { Patterns = ["*.giproj"] }
			]
		});

		if (file is not null) {
			vm.ProjectPath = file.Path.LocalPath;
		}
	}
}
