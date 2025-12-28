using System.Collections.ObjectModel;
using Avalonia.Controls;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using GameInfoTools.UI.Services;
using GameInfoTools.Wiki;

namespace GameInfoTools.UI.ViewModels;

/// <summary>
/// Sync status display item for the UI.
/// </summary>
public partial class WikiSyncItem : ObservableObject {
	[ObservableProperty]
	private string _localPath = "";

	[ObservableProperty]
	private string _wikiTitle = "";

	[ObservableProperty]
	private WikiSyncStatus _status = WikiSyncStatus.Unknown;

	[ObservableProperty]
	private bool _reviewedForUpload;

	[ObservableProperty]
	private string? _reviewedBy;

	[ObservableProperty]
	private DateTime? _lastSyncTimestamp;

	[ObservableProperty]
	private bool _isSelected;

	/// <summary>
	/// Status icon for display.
	/// </summary>
	public string StatusIcon => Status switch {
		WikiSyncStatus.InSync => "✓",
		WikiSyncStatus.LocalOnly => "📄",
		WikiSyncStatus.RemoteOnly => "☁️",
		WikiSyncStatus.LocalModified => "📝",
		WikiSyncStatus.RemoteModified => "⬇️",
		WikiSyncStatus.Conflict => "⚠️",
		_ => "?"
	};

	/// <summary>
	/// Status text for display.
	/// </summary>
	public string StatusText => Status switch {
		WikiSyncStatus.InSync => "In Sync",
		WikiSyncStatus.LocalOnly => "Local Only",
		WikiSyncStatus.RemoteOnly => "Remote Only",
		WikiSyncStatus.LocalModified => "Local Modified",
		WikiSyncStatus.RemoteModified => "Remote Modified",
		WikiSyncStatus.Conflict => "Conflict",
		_ => "Unknown"
	};

	/// <summary>
	/// Review status icon.
	/// </summary>
	public string ReviewIcon => ReviewedForUpload ? "✅" : "⛔";

	/// <summary>
	/// Whether this item can be uploaded.
	/// </summary>
	public bool CanUpload => ReviewedForUpload && Status is WikiSyncStatus.LocalModified or WikiSyncStatus.LocalOnly;

	public static WikiSyncItem FromState(WikiSyncState state) => new() {
		LocalPath = state.LocalPath,
		WikiTitle = state.WikiTitle,
		Status = state.Status,
		ReviewedForUpload = state.ReviewedForUpload,
		ReviewedBy = state.ReviewedBy,
		LastSyncTimestamp = state.LastSyncTimestamp
	};
}

/// <summary>
/// View model for the DarkRepos Wiki integration panel.
/// DarkRepos allows AI-generated content, making it the primary wiki for GameInfoTools.
/// </summary>
public partial class DarkReposViewModel : ViewModelBase {
	private MediaWikiClient? _client;
	private WikiSyncManager? _syncManager;
	private string? _wikiDirectory;

	[ObservableProperty]
	private string _statusText = "Not connected";

	[ObservableProperty]
	private bool _isConnected;

	[ObservableProperty]
	private bool _isLoggedIn;

	[ObservableProperty]
	private string _username = "";

	[ObservableProperty]
	private string _botPassword = "";

	[ObservableProperty]
	private bool _isBusy;

	[ObservableProperty]
	private string _currentPage = "";

	[ObservableProperty]
	private string _pageContent = "";

	[ObservableProperty]
	private string _localContent = "";

	[ObservableProperty]
	private string _diffText = "";

	[ObservableProperty]
	private WikiSyncItem? _selectedItem;

	[ObservableProperty]
	private string _reviewerName = "";

	[ObservableProperty]
	private string _reviewNotes = "";

	/// <summary>
	/// List of tracked wiki files.
	/// </summary>
	public ObservableCollection<WikiSyncItem> SyncItems { get; } = [];

	/// <summary>
	/// Configuration for DarkRepos Games Wiki.
	/// </summary>
	public static MediaWikiConfig DarkReposConfig => new() {
		BaseUrl = "https://games.darkrepos.com",
		ApiPath = "/w/api.php",
		UserAgent = "GameInfoTools/1.0 (https://github.com/TheAnsarya/GameInfo; Contact: via GitHub issues)"
	};

	public DarkReposViewModel() {
		// Create client on construction (read-only operations don't need login)
		_client = new MediaWikiClient(DarkReposConfig);
	}

	/// <summary>
	/// Sets the wiki directory to track.
	/// </summary>
	public void SetWikiDirectory(string directory) {
		_wikiDirectory = directory;
		_syncManager = new WikiSyncManager(directory);

		// Scan for existing wikitext files
		RefreshFileList();
	}

	/// <summary>
	/// Refreshes the list of tracked files.
	/// </summary>
	[RelayCommand]
	private void RefreshFileList() {
		if (_syncManager is null || string.IsNullOrEmpty(_wikiDirectory)) return;

		SyncItems.Clear();

		var states = _syncManager.ScanDirectory(_wikiDirectory, path => {
			// Convert file path to wiki title
			var relativePath = Path.GetRelativePath(_wikiDirectory, path);
			var title = Path.GetFileNameWithoutExtension(relativePath);
			return title.Replace('\\', '/').Replace('_', ' ');
		});

		foreach (var state in states) {
			SyncItems.Add(WikiSyncItem.FromState(state));
		}

		StatusText = $"Found {SyncItems.Count} wiki file(s)";
	}

	/// <summary>
	/// Logs in to DarkRepos Wiki.
	/// </summary>
	[RelayCommand]
	private async Task Login() {
		if (string.IsNullOrWhiteSpace(Username) || string.IsNullOrWhiteSpace(BotPassword)) {
			StatusText = "Username and bot password required";
			return;
		}

		IsBusy = true;
		StatusText = "Logging in...";

		try {
			// Create new client with credentials
			_client?.Dispose();
			_client = new MediaWikiClient(DarkReposConfig with {
				Username = Username,
				BotPassword = BotPassword
			});

			var result = await _client.LoginAsync();

			if (result.Success) {
				IsLoggedIn = true;
				StatusText = $"Logged in as {result.Username}";
			} else {
				StatusText = $"Login failed: {result.Error}";
			}
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		} finally {
			IsBusy = false;
		}
	}

	/// <summary>
	/// Logs out from DarkRepos Wiki.
	/// </summary>
	[RelayCommand]
	private async Task Logout() {
		if (_client is null) return;

		IsBusy = true;
		try {
			await _client.LogoutAsync();
			IsLoggedIn = false;
			StatusText = "Logged out";
		} catch (Exception ex) {
			StatusText = $"Logout error: {ex.Message}";
		} finally {
			IsBusy = false;
		}
	}

	/// <summary>
	/// Fetches a page from DarkRepos Wiki.
	/// </summary>
	[RelayCommand]
	private async Task FetchPage(string? title = null) {
		if (_client is null) return;

		var pageTitle = title ?? CurrentPage;
		if (string.IsNullOrWhiteSpace(pageTitle)) {
			StatusText = "Enter a page title";
			return;
		}

		IsBusy = true;
		StatusText = $"Fetching {pageTitle}...";

		try {
			var page = await _client.GetPageAsync(pageTitle);

			if (page is null || !page.Exists) {
				StatusText = $"Page not found: {pageTitle}";
				PageContent = "";
			} else {
				PageContent = page.Content;
				StatusText = $"Fetched: {page.Title} (rev {page.RevisionId})";
			}
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		} finally {
			IsBusy = false;
		}
	}

	/// <summary>
	/// Pulls remote changes for selected file.
	/// </summary>
	[RelayCommand]
	private async Task PullChanges() {
		if (_client is null || SelectedItem is null || _syncManager is null) return;

		IsBusy = true;
		StatusText = $"Pulling {SelectedItem.WikiTitle}...";

		try {
			var page = await _client.GetPageAsync(SelectedItem.WikiTitle);

			if (page is null || !page.Exists) {
				StatusText = $"Page not found on wiki: {SelectedItem.WikiTitle}";
				return;
			}

			// Save to local file
			var localPath = SelectedItem.LocalPath;
			var dir = Path.GetDirectoryName(localPath);
			if (!string.IsNullOrEmpty(dir) && !Directory.Exists(dir)) {
				Directory.CreateDirectory(dir);
			}

			// Mark as imported content
			var content = $"{ChangeTracker.CreateMarker(ChangeTracker.ChangeType.Imported, $"Pulled from DarkRepos rev {page.RevisionId}")}\n{page.Content}";
			await File.WriteAllTextAsync(localPath, content);

			// Update sync state
			var hash = MediaWikiClient.ComputeContentHash(page.Content);
			_syncManager.UpdateFromPull(localPath, page.RevisionId, hash);

			// Refresh display
			SelectedItem.Status = WikiSyncStatus.InSync;
			SelectedItem.LastSyncTimestamp = DateTime.UtcNow;

			StatusText = $"Pulled {SelectedItem.WikiTitle} (rev {page.RevisionId})";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		} finally {
			IsBusy = false;
		}
	}

	/// <summary>
	/// Checks sync status for all files.
	/// </summary>
	[RelayCommand]
	private async Task CheckAllStatus() {
		if (_client is null || _syncManager is null) return;

		IsBusy = true;
		StatusText = "Checking status...";

		try {
			var tasks = SyncItems.Select(async item => {
				try {
					var state = await _syncManager.CheckSyncStatusAsync(item.LocalPath, _client);
					item.Status = state.Status;
					item.ReviewedForUpload = state.ReviewedForUpload;
				} catch {
					item.Status = WikiSyncStatus.Unknown;
				}
			});

			await Task.WhenAll(tasks);
			StatusText = "Status check complete";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		} finally {
			IsBusy = false;
		}
	}

	/// <summary>
	/// Marks selected file as reviewed for upload.
	/// </summary>
	[RelayCommand]
	private void MarkAsReviewed() {
		if (SelectedItem is null || _syncManager is null) return;

		if (string.IsNullOrWhiteSpace(ReviewerName)) {
			StatusText = "Enter reviewer name";
			return;
		}

		try {
			var state = _syncManager.MarkAsReviewed(
				SelectedItem.LocalPath,
				ReviewerName,
				ReviewNotes
			);

			SelectedItem.ReviewedForUpload = true;
			SelectedItem.ReviewedBy = ReviewerName;

			StatusText = $"Marked as reviewed by {ReviewerName}";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		}
	}

	/// <summary>
	/// Clears review status for selected file.
	/// </summary>
	[RelayCommand]
	private void ClearReview() {
		if (SelectedItem is null || _syncManager is null) return;

		try {
			_syncManager.ClearReview(SelectedItem.LocalPath);
			SelectedItem.ReviewedForUpload = false;
			SelectedItem.ReviewedBy = null;

			StatusText = "Review status cleared";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		}
	}

	/// <summary>
	/// Compares local content with remote wiki page.
	/// </summary>
	[RelayCommand]
	private async Task CompareWithRemote() {
		if (_client is null || SelectedItem is null) return;

		IsBusy = true;
		StatusText = "Comparing...";

		try {
			// Read local content
			var localContent = File.Exists(SelectedItem.LocalPath)
				? await File.ReadAllTextAsync(SelectedItem.LocalPath)
				: "";

			// Strip change markers for comparison
			var cleanLocal = ChangeTracker.StripMarkers(localContent);
			LocalContent = cleanLocal;

			// Fetch remote
			var remotePage = await _client.GetPageAsync(SelectedItem.WikiTitle);
			var remoteContent = remotePage?.Content ?? "";
			PageContent = remoteContent;

			// Create diff
			DiffText = MediaWikiClient.CreateUnifiedDiff(cleanLocal, remoteContent, "Local", "Remote");

			StatusText = "Comparison complete";
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		} finally {
			IsBusy = false;
		}
	}

	/// <summary>
	/// Pushes local changes to DarkRepos Wiki.
	/// </summary>
	[RelayCommand]
	private async Task PushChanges() {
		if (_client is null || SelectedItem is null || _syncManager is null) return;

		if (!IsLoggedIn) {
			StatusText = "Must be logged in to push changes";
			return;
		}

		IsBusy = true;
		StatusText = $"Pushing {SelectedItem.WikiTitle}...";

		try {
			// Read and clean local content
			var localContent = await File.ReadAllTextAsync(SelectedItem.LocalPath);
			var cleanContent = ChangeTracker.StripMarkers(localContent);

			// Get sync state
			var syncState = _syncManager.GetSyncState(SelectedItem.LocalPath);
			if (syncState is null) {
				StatusText = "File not tracked";
				return;
			}

			// Attempt edit
			var result = await _client.EditPageAsync(
				SelectedItem.WikiTitle,
				cleanContent,
				"Updated via GameInfoTools",
				syncState
			);

			if (result.Success) {
				var hash = MediaWikiClient.ComputeContentHash(cleanContent);
				_syncManager.UpdateFromPush(SelectedItem.LocalPath, result.NewRevisionId ?? 0, hash);

				SelectedItem.Status = WikiSyncStatus.InSync;
				SelectedItem.LastSyncTimestamp = DateTime.UtcNow;

				StatusText = $"✓ Pushed {SelectedItem.WikiTitle} (rev {result.NewRevisionId})";
			} else {
				StatusText = $"⛔ Push failed: {result.ErrorMessage}";
			}
		} catch (Exception ex) {
			StatusText = $"Error: {ex.Message}";
		} finally {
			IsBusy = false;
		}
	}

	/// <summary>
	/// Selects wiki directory.
	/// </summary>
	[RelayCommand]
	private async Task SelectDirectory(Window? window) {
		if (window is null) return;

		var dialogService = FileDialogService.FromWindow(window);
		var folder = await dialogService.SelectFolderAsync("Select Wiki Files Directory");

		if (!string.IsNullOrEmpty(folder)) {
			SetWikiDirectory(folder);
		}
	}

	/// <summary>
	/// Opens the selected file in the Wiki Editor.
	/// </summary>
	[RelayCommand]
	private void OpenInEditor() {
		if (SelectedItem is null) return;

		// This would need to be wired up to the main window's navigation
		StatusText = $"Open in editor: {SelectedItem.LocalPath}";
		// TODO: Emit event for main window to handle
	}
}
