using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Windows.Input;

namespace GameInfoTools.Core.Project.ViewModels;

/// <summary>
/// View model for the Project Explorer panel.
/// Shows the hierarchical structure of project assets.
/// </summary>
public class ProjectExplorerViewModel : INotifyPropertyChanged {
	private readonly IProjectService _projectService;
	private ProjectTreeNode? _selectedNode;
	private string _searchFilter = "";

	/// <summary>Event raised when a property changes.</summary>
	public event PropertyChangedEventHandler? PropertyChanged;

	/// <summary>Event raised when a file should be opened.</summary>
	public event EventHandler<string>? OpenFileRequested;

	/// <summary>Event raised when user wants to open a project.</summary>
	public event EventHandler? OpenProjectRequested;

	/// <summary>Event raised when user wants to create a new project.</summary>
	public event EventHandler? NewProjectRequested;

	/// <summary>
	/// Creates a new project explorer view model.
	/// </summary>
	public ProjectExplorerViewModel(IProjectService projectService) {
		_projectService = projectService;
		RootNodes = [];

		// Initialize commands
		OpenProjectCommand = new RelayCommand(() => OpenProjectRequested?.Invoke(this, EventArgs.Empty));
		NewProjectCommand = new RelayCommand(() => NewProjectRequested?.Invoke(this, EventArgs.Empty));
		RefreshCommand = new RelayCommand(RefreshTree, () => HasProject);
		AddAssetCommand = new RelayCommand(AddAsset, () => HasProject);

		_projectService.ProjectChanged += OnProjectChanged;

		if (_projectService.CurrentProject is not null) {
			RefreshTree();
		}
	}

	// Commands for UI binding
	/// <summary>Command to open a project.</summary>
	public ICommand OpenProjectCommand { get; }

	/// <summary>Command to create a new project.</summary>
	public ICommand NewProjectCommand { get; }

	/// <summary>Command to refresh the tree.</summary>
	public ICommand RefreshCommand { get; }

	/// <summary>Command to add an asset.</summary>
	public ICommand AddAssetCommand { get; }

	/// <summary>Root nodes of the tree.</summary>
	public ObservableCollection<ProjectTreeNode> RootNodes { get; }

	/// <summary>Currently selected node.</summary>
	public ProjectTreeNode? SelectedNode {
		get => _selectedNode;
		set {
			if (_selectedNode != value) {
				_selectedNode = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Search/filter text.</summary>
	public string SearchFilter {
		get => _searchFilter;
		set {
			if (_searchFilter != value) {
				_searchFilter = value;
				OnPropertyChanged();
				FilterTree();
			}
		}
	}

	/// <summary>Event raised when user wants to add an asset.</summary>
	public event EventHandler? AddAssetRequested;

	private void AddAsset() => AddAssetRequested?.Invoke(this, EventArgs.Empty);

	/// <summary>Whether a project is loaded.</summary>
	public bool HasProject => _projectService.HasOpenProject;

	/// <summary>Project name.</summary>
	public string ProjectName => _projectService.CurrentProject?.Name ?? "No Project";

	/// <summary>Refresh the tree from the current project.</summary>
	public void RefreshTree() {
		RootNodes.Clear();

		var project = _projectService.CurrentProject;
		if (project is null) {
			OnPropertyChanged(nameof(HasProject));
			OnPropertyChanged(nameof(ProjectName));
			return;
		}

		// Build tree structure from asset paths
		var rootNode = new ProjectTreeNode {
			Name = project.Name,
			Path = "",
			NodeType = ProjectNodeType.Project,
			IsExpanded = true
		};

		var folders = new Dictionary<string, ProjectTreeNode> {
			[""] = rootNode
		};

		foreach (var assetPath in project.GetAssetPaths()) {
			var parts = assetPath.Split('/');
			var currentPath = "";
			var currentParent = rootNode;

			for (int i = 0; i < parts.Length; i++) {
				var part = parts[i];
				var newPath = string.IsNullOrEmpty(currentPath) ? part : $"{currentPath}/{part}";

				if (!folders.TryGetValue(newPath, out var node)) {
					var isFile = i == parts.Length - 1;

					node = new ProjectTreeNode {
						Name = part,
						Path = newPath,
						NodeType = isFile ? GetNodeType(newPath) : ProjectNodeType.Folder,
						IsExpanded = !isFile && i < 2 // Expand first two levels
					};

					folders[newPath] = node;
					currentParent.Children.Add(node);
				}

				currentParent = node;
			}
		}

		RootNodes.Add(rootNode);
		OnPropertyChanged(nameof(HasProject));
		OnPropertyChanged(nameof(ProjectName));
	}

	/// <summary>Open the selected node.</summary>
	public void OpenSelected() {
		if (SelectedNode?.NodeType != ProjectNodeType.Folder &&
			SelectedNode?.NodeType != ProjectNodeType.Project) {
			OpenFileRequested?.Invoke(this, SelectedNode!.Path);
		}
	}

	/// <summary>Delete the selected node.</summary>
	public async Task DeleteSelectedAsync() {
		if (SelectedNode is null || _projectService.CurrentProject is null) {
			return;
		}

		// TODO: Implement delete with confirmation
		await Task.CompletedTask;
	}

	/// <summary>Export the selected node.</summary>
	public async Task ExportSelectedAsync(string outputPath) {
		if (SelectedNode is null || _projectService.CurrentProject is null) {
			return;
		}

		var data = await _projectService.CurrentProject.ReadAssetAsync(SelectedNode.Path);
		await File.WriteAllBytesAsync(outputPath, data);
	}

	private void OnProjectChanged(object? sender, ProjectChangedEventArgs e) {
		RefreshTree();
	}

	private void FilterTree() {
		// TODO: Implement tree filtering based on SearchText
	}

	private static ProjectNodeType GetNodeType(string path) {
		var ext = Path.GetExtension(path).ToLowerInvariant();
		return ext switch {
			".json" => ProjectNodeType.Data,
			".asm" or ".s" or ".inc" => ProjectNodeType.Source,
			".sym" => ProjectNodeType.Symbol,
			".png" or ".bmp" or ".bin" when path.Contains("graphics") => ProjectNodeType.Graphics,
			".bin" when path.Contains("audio") => ProjectNodeType.Audio,
			".bin" when path.Contains("maps") => ProjectNodeType.Map,
			_ => ProjectNodeType.File
		};
	}

	/// <summary>Raises the PropertyChanged event.</summary>
	protected void OnPropertyChanged([CallerMemberName] string? propertyName = null) {
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}
}

/// <summary>
/// A node in the project tree.
/// </summary>
public class ProjectTreeNode : INotifyPropertyChanged {
	private bool _isExpanded;
	private bool _isSelected;

	/// <summary>Event raised when a property changes.</summary>
	public event PropertyChangedEventHandler? PropertyChanged;

	/// <summary>Display name of the node.</summary>
	public required string Name { get; init; }

	/// <summary>Full path within the project.</summary>
	public required string Path { get; init; }

	/// <summary>Type of node.</summary>
	public required ProjectNodeType NodeType { get; init; }

	/// <summary>Child nodes.</summary>
	public ObservableCollection<ProjectTreeNode> Children { get; } = [];

	/// <summary>Whether the node is expanded.</summary>
	public bool IsExpanded {
		get => _isExpanded;
		set {
			if (_isExpanded != value) {
				_isExpanded = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Whether the node is selected.</summary>
	public bool IsSelected {
		get => _isSelected;
		set {
			if (_isSelected != value) {
				_isSelected = value;
				OnPropertyChanged();
			}
		}
	}

	/// <summary>Icon for the node type.</summary>
	public string Icon => NodeType switch {
		ProjectNodeType.Project => "📁",
		ProjectNodeType.Folder => "📂",
		ProjectNodeType.Data => "📊",
		ProjectNodeType.Source => "📝",
		ProjectNodeType.Symbol => "🏷️",
		ProjectNodeType.Graphics => "🖼️",
		ProjectNodeType.Audio => "🎵",
		ProjectNodeType.Map => "🗺️",
		ProjectNodeType.Text => "📄",
		_ => "📄"
	};

	/// <summary>Whether this node has children.</summary>
	public bool HasChildren => Children.Count > 0;

	/// <summary>Number of children (for display).</summary>
	public int Count => Children.Count;

	/// <summary>Raises the PropertyChanged event.</summary>
	protected void OnPropertyChanged([CallerMemberName] string? propertyName = null) {
		PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
	}
}

/// <summary>
/// Types of nodes in the project tree.
/// </summary>
public enum ProjectNodeType {
	/// <summary>The project root.</summary>
	Project,

	/// <summary>A folder.</summary>
	Folder,

	/// <summary>A generic file.</summary>
	File,

	/// <summary>A data file (JSON).</summary>
	Data,

	/// <summary>A source code file.</summary>
	Source,

	/// <summary>A symbol/label file.</summary>
	Symbol,

	/// <summary>A graphics file.</summary>
	Graphics,

	/// <summary>An audio file.</summary>
	Audio,

	/// <summary>A map file.</summary>
	Map,

	/// <summary>A text file.</summary>
	Text
}
