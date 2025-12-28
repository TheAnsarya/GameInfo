using System.Security.Cryptography;
using System.Text;
using System.Text.Json;

namespace GameInfoTools.Wiki;

/// <summary>
/// Manages synchronization state between local wiki documents and remote wikis.
/// Tracks which files have been reviewed for upload and their sync status.
///
/// Content policies are wiki-specific and configured through WikiProfileManager.
/// Some wikis forbid AI-generated content, while others (like DarkRepos) allow it.
/// </summary>
public class WikiSyncManager {
	private readonly string _syncStatePath;
	private readonly Dictionary<string, WikiSyncState> _syncStates;
	private readonly object _lock = new();

	/// <summary>
	/// File extension for wikitext files.
	/// </summary>
	public const string WikitextExtension = ".wikitext";

	/// <summary>
	/// File name for sync state storage.
	/// </summary>
	public const string SyncStateFileName = ".wiki-sync-state.json";

	/// <summary>
	/// Creates a new sync manager for the specified directory.
	/// </summary>
	/// <param name="wikiDirectory">Directory containing wiki files.</param>
	public WikiSyncManager(string wikiDirectory) {
		if (string.IsNullOrEmpty(wikiDirectory))
			throw new ArgumentNullException(nameof(wikiDirectory));

		_syncStatePath = Path.Combine(wikiDirectory, SyncStateFileName);
		_syncStates = new Dictionary<string, WikiSyncState>(StringComparer.OrdinalIgnoreCase);

		LoadSyncState();
	}

	/// <summary>
	/// Gets the sync state for a local file.
	/// </summary>
	public WikiSyncState? GetSyncState(string localPath) {
		lock (_lock) {
			return _syncStates.TryGetValue(NormalizePath(localPath), out var state) ? state : null;
		}
	}

	/// <summary>
	/// Gets all tracked sync states.
	/// </summary>
	public IReadOnlyList<WikiSyncState> GetAllSyncStates() {
		lock (_lock) {
			return _syncStates.Values.ToList();
		}
	}

	/// <summary>
	/// Registers a local file with a wiki page title.
	/// </summary>
	public WikiSyncState TrackFile(string localPath, string wikiTitle) {
		lock (_lock) {
			var normalizedPath = NormalizePath(localPath);
			var state = new WikiSyncState {
				LocalPath = normalizedPath,
				WikiTitle = wikiTitle,
				Status = WikiSyncStatus.LocalOnly
			};

			_syncStates[normalizedPath] = state;
			SaveSyncState();
			return state;
		}
	}

	/// <summary>
	/// Updates sync state after pulling from wiki.
	/// </summary>
	public WikiSyncState UpdateFromPull(string localPath, int revisionId, string contentHash) {
		lock (_lock) {
			var normalizedPath = NormalizePath(localPath);

			if (!_syncStates.TryGetValue(normalizedPath, out var existing)) {
				throw new InvalidOperationException($"File not tracked: {localPath}");
			}

			var updated = existing with {
				LastSyncedRevisionId = revisionId,
				LastSyncedContentHash = contentHash,
				LastSyncTimestamp = DateTime.UtcNow,
				Status = WikiSyncStatus.InSync
			};

			_syncStates[normalizedPath] = updated;
			SaveSyncState();
			return updated;
		}
	}

	/// <summary>
	/// Marks a file as reviewed and ready for upload.
	///
	/// For wikis that forbid AI content, only mark as reviewed after a human has
	/// manually verified and edited the content. For wikis that allow AI content
	/// (like DarkRepos), review is optional but recommended.
	/// Check the wiki's content policy via WikiProfileManager.
	/// </summary>
	/// <param name="localPath">Path to the local file.</param>
	/// <param name="reviewedBy">Name/username of the reviewer.</param>
	/// <param name="notes">Review notes or comments.</param>
	public WikiSyncState MarkAsReviewed(string localPath, string reviewedBy, string? notes = null) {
		lock (_lock) {
			var normalizedPath = NormalizePath(localPath);

			if (!_syncStates.TryGetValue(normalizedPath, out var existing)) {
				throw new InvalidOperationException($"File not tracked: {localPath}");
			}

			var updated = existing with {
				ReviewedForUpload = true,
				ReviewedBy = reviewedBy,
				ReviewNotes = notes,
				ReviewTimestamp = DateTime.UtcNow
			};

			_syncStates[normalizedPath] = updated;
			SaveSyncState();
			return updated;
		}
	}

	/// <summary>
	/// Clears the review status for a file (e.g., after content changes).
	/// </summary>
	public WikiSyncState ClearReview(string localPath) {
		lock (_lock) {
			var normalizedPath = NormalizePath(localPath);

			if (!_syncStates.TryGetValue(normalizedPath, out var existing)) {
				throw new InvalidOperationException($"File not tracked: {localPath}");
			}

			var updated = existing with {
				ReviewedForUpload = false,
				ReviewedBy = null,
				ReviewNotes = null,
				ReviewTimestamp = null,
				Status = WikiSyncStatus.LocalModified
			};

			_syncStates[normalizedPath] = updated;
			SaveSyncState();
			return updated;
		}
	}

	/// <summary>
	/// Updates sync state after successful upload.
	/// </summary>
	public WikiSyncState UpdateFromPush(string localPath, int newRevisionId, string contentHash) {
		lock (_lock) {
			var normalizedPath = NormalizePath(localPath);

			if (!_syncStates.TryGetValue(normalizedPath, out var existing)) {
				throw new InvalidOperationException($"File not tracked: {localPath}");
			}

			var updated = existing with {
				LastSyncedRevisionId = newRevisionId,
				LastSyncedContentHash = contentHash,
				LastSyncTimestamp = DateTime.UtcNow,
				Status = WikiSyncStatus.InSync,
				// Keep review info but note it was uploaded
				ReviewNotes = $"{existing.ReviewNotes ?? ""}\n[Uploaded revision {newRevisionId} at {DateTime.UtcNow:u}]".Trim()
			};

			_syncStates[normalizedPath] = updated;
			SaveSyncState();
			return updated;
		}
	}

	/// <summary>
	/// Checks sync status for a file against the wiki.
	/// </summary>
	public async Task<WikiSyncState> CheckSyncStatusAsync(
		string localPath,
		MediaWikiClient client,
		CancellationToken cancellationToken = default) {

		WikiSyncState existing;
		string normalizedPath;
		string localContent;
		string localHash;
		bool localChanged;

		// First lock: Get current state and local info
		lock (_lock) {
			normalizedPath = NormalizePath(localPath);

			if (!_syncStates.TryGetValue(normalizedPath, out existing!)) {
				throw new InvalidOperationException($"File not tracked: {localPath}");
			}

			// Read local file
			if (!File.Exists(localPath)) {
				var notFound = existing with { Status = WikiSyncStatus.RemoteOnly };
				_syncStates[normalizedPath] = notFound;
				SaveSyncState();
				return notFound;
			}

			localContent = File.ReadAllText(localPath);
			localHash = MediaWikiClient.ComputeContentHash(localContent);
			localChanged = localHash != existing.LastSyncedContentHash;

			// If local changed and was reviewed, clear review status
			if (localChanged && existing.ReviewedForUpload) {
				existing = existing with {
					ReviewedForUpload = false,
					ReviewNotes = $"{existing.ReviewNotes ?? ""}\n[Review cleared - content modified]".Trim()
				};
				_syncStates[normalizedPath] = existing;
			}
		}

		// Async operation outside of lock
		var remotePage = await client.GetPageAsync(existing.WikiTitle, cancellationToken);
		var remoteChanged = remotePage?.RevisionId != existing.LastSyncedRevisionId;

		var status = (localChanged, remoteChanged, remotePage?.Exists ?? false) switch {
			(false, false, true) => WikiSyncStatus.InSync,
			(true, false, true) => WikiSyncStatus.LocalModified,
			(true, false, false) => WikiSyncStatus.LocalOnly,
			(false, true, true) => WikiSyncStatus.RemoteModified,
			(true, true, true) => WikiSyncStatus.Conflict,
			(false, false, false) => WikiSyncStatus.LocalOnly,
			_ => WikiSyncStatus.Unknown
		};

		// Second lock: Update state
		lock (_lock) {
			var updated = existing with {
				Status = status,
				LastSyncedContentHash = localHash
			};

			_syncStates[normalizedPath] = updated;
			SaveSyncState();
			return updated;
		}
	}

	/// <summary>
	/// Removes tracking for a file.
	/// </summary>
	public void UntrackFile(string localPath) {
		lock (_lock) {
			var normalizedPath = NormalizePath(localPath);
			_syncStates.Remove(normalizedPath);
			SaveSyncState();
		}
	}

	/// <summary>
	/// Scans a directory for wikitext files and auto-tracks them.
	/// </summary>
	public IReadOnlyList<WikiSyncState> ScanDirectory(string directory, Func<string, string> titleFromPath) {
		var files = Directory.GetFiles(directory, $"*{WikitextExtension}", SearchOption.AllDirectories);
		var results = new List<WikiSyncState>();

		lock (_lock) {
			foreach (var file in files) {
				var normalizedPath = NormalizePath(file);

				if (!_syncStates.ContainsKey(normalizedPath)) {
					var title = titleFromPath(file);
					var state = new WikiSyncState {
						LocalPath = normalizedPath,
						WikiTitle = title,
						Status = WikiSyncStatus.Unknown
					};
					_syncStates[normalizedPath] = state;
					results.Add(state);
				} else {
					results.Add(_syncStates[normalizedPath]);
				}
			}

			SaveSyncState();
		}

		return results;
	}

	#region Persistence

	private void LoadSyncState() {
		if (!File.Exists(_syncStatePath)) return;

		try {
			var json = File.ReadAllText(_syncStatePath);
			var states = JsonSerializer.Deserialize<List<WikiSyncState>>(json, JsonOptions);

			if (states is not null) {
				foreach (var state in states) {
					_syncStates[state.LocalPath] = state;
				}
			}
		} catch (Exception) {
			// If state file is corrupt, start fresh
			_syncStates.Clear();
		}
	}

	private void SaveSyncState() {
		try {
			var states = _syncStates.Values.ToList();
			var json = JsonSerializer.Serialize(states, JsonOptions);

			var dir = Path.GetDirectoryName(_syncStatePath);
			if (!string.IsNullOrEmpty(dir) && !Directory.Exists(dir)) {
				Directory.CreateDirectory(dir);
			}

			File.WriteAllText(_syncStatePath, json);
		} catch (Exception) {
			// Best effort save
		}
	}

	private static string NormalizePath(string path) {
		return Path.GetFullPath(path).Replace('\\', '/');
	}

	private static readonly JsonSerializerOptions JsonOptions = new() {
		WriteIndented = true,
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase
	};

	#endregion
}
