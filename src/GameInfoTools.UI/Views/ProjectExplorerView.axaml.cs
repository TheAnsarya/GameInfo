using Avalonia.Controls;
using Avalonia.Platform.Storage;
using GameInfoTools.Core.Project.ViewModels;

namespace GameInfoTools.UI.Views;

/// <summary>
/// Code-behind for the Project Explorer view.
/// </summary>
public partial class ProjectExplorerView : UserControl {
	/// <summary>
	/// Creates a new instance of the explorer view.
	/// </summary>
	public ProjectExplorerView() {
		InitializeComponent();
		DataContextChanged += OnDataContextChanged;
	}

	private void OnDataContextChanged(object? sender, EventArgs e) {
		if (DataContext is ProjectExplorerViewModel vm) {
			vm.OpenProjectRequested += OnOpenProjectRequested;
		}
	}

	private async void OnOpenProjectRequested(object? sender, EventArgs e) {
		if (DataContext is not ProjectExplorerViewModel) return;

		var topLevel = TopLevel.GetTopLevel(this);
		if (topLevel is null) return;

		var files = await topLevel.StorageProvider.OpenFilePickerAsync(new FilePickerOpenOptions {
			Title = "Open Project",
			AllowMultiple = false,
			FileTypeFilter = [
				new FilePickerFileType("GameInfo Projects") { Patterns = ["*.giproj"] },
				new FilePickerFileType("All Files") { Patterns = ["*.*"] }
			]
		});

		if (files.Count > 0) {
			// Get the project service from DI and open the project
			var projectService = App.Services.GetService(typeof(GameInfoTools.Core.Project.IProjectService))
				as GameInfoTools.Core.Project.IProjectService;

			if (projectService is not null) {
				try {
					await projectService.OpenProjectAsync(files[0].Path.LocalPath);
				} catch (Exception ex) {
					// TODO: Show error dialog
					System.Diagnostics.Debug.WriteLine($"Error opening project: {ex.Message}");
				}
			}
		}
	}
}
