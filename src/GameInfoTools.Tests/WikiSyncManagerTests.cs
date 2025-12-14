using GameInfoTools.Wiki;

namespace GameInfoTools.Tests;

public class WikiSyncManagerTests : IDisposable {
	private readonly string _testDir;
	private readonly WikiSyncManager _manager;

	public WikiSyncManagerTests() {
		_testDir = Path.Combine(Path.GetTempPath(), $"WikiSyncTest_{Guid.NewGuid():N}");
		Directory.CreateDirectory(_testDir);
		_manager = new WikiSyncManager(_testDir);
	}

	public void Dispose() {
		try {
			if (Directory.Exists(_testDir)) {
				Directory.Delete(_testDir, true);
			}
		} catch {
			// Best effort cleanup
		}
		GC.SuppressFinalize(this);
	}

	[Fact]
	public void Constructor_NullDirectory_ThrowsArgumentNull() {
		Assert.Throws<ArgumentNullException>(() => new WikiSyncManager(null!));
	}

	[Fact]
	public void Constructor_EmptyDirectory_ThrowsArgumentNull() {
		Assert.Throws<ArgumentNullException>(() => new WikiSyncManager(""));
	}

	[Fact]
	public void TrackFile_CreatesNewState() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");

		var state = _manager.TrackFile(filePath, "Test:Page");

		Assert.Equal("Test:Page", state.WikiTitle);
		Assert.Equal(WikiSyncStatus.LocalOnly, state.Status);
		Assert.False(state.ReviewedForUpload);
	}

	[Fact]
	public void GetSyncState_TrackedFile_ReturnsState() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Test:Page");

		var state = _manager.GetSyncState(filePath);

		Assert.NotNull(state);
		Assert.Equal("Test:Page", state.WikiTitle);
	}

	[Fact]
	public void GetSyncState_UntrackedFile_ReturnsNull() {
		var state = _manager.GetSyncState("/nonexistent/file.wikitext");

		Assert.Null(state);
	}

	[Fact]
	public void GetAllSyncStates_ReturnsAllTracked() {
		var file1 = Path.Combine(_testDir, "file1.wikitext");
		var file2 = Path.Combine(_testDir, "file2.wikitext");
		File.WriteAllText(file1, "Content 1");
		File.WriteAllText(file2, "Content 2");

		_manager.TrackFile(file1, "Page:One");
		_manager.TrackFile(file2, "Page:Two");

		var states = _manager.GetAllSyncStates();

		Assert.Equal(2, states.Count);
		Assert.Contains(states, s => s.WikiTitle == "Page:One");
		Assert.Contains(states, s => s.WikiTitle == "Page:Two");
	}

	[Fact]
	public void MarkAsReviewed_UpdatesReviewStatus() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Test:Page");

		var state = _manager.MarkAsReviewed(filePath, "TestReviewer", "Looks good");

		Assert.True(state.ReviewedForUpload);
		Assert.Equal("TestReviewer", state.ReviewedBy);
		Assert.Equal("Looks good", state.ReviewNotes);
		Assert.NotNull(state.ReviewTimestamp);
	}

	[Fact]
	public void MarkAsReviewed_UntrackedFile_ThrowsInvalidOperation() {
		Assert.Throws<InvalidOperationException>(() =>
			_manager.MarkAsReviewed("/nonexistent/file.wikitext", "Reviewer"));
	}

	[Fact]
	public void ClearReview_RemovesReviewStatus() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Test:Page");
		_manager.MarkAsReviewed(filePath, "Reviewer", "Notes");

		var state = _manager.ClearReview(filePath);

		Assert.False(state.ReviewedForUpload);
		Assert.Null(state.ReviewedBy);
		Assert.Null(state.ReviewTimestamp);
		Assert.Equal(WikiSyncStatus.LocalModified, state.Status);
	}

	[Fact]
	public void ClearReview_UntrackedFile_ThrowsInvalidOperation() {
		Assert.Throws<InvalidOperationException>(() =>
			_manager.ClearReview("/nonexistent/file.wikitext"));
	}

	[Fact]
	public void UpdateFromPull_UpdatesSyncInfo() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Test:Page");

		var state = _manager.UpdateFromPull(filePath, 12345, "hash123");

		Assert.Equal(12345, state.LastSyncedRevisionId);
		Assert.Equal("hash123", state.LastSyncedContentHash);
		Assert.Equal(WikiSyncStatus.InSync, state.Status);
		Assert.NotNull(state.LastSyncTimestamp);
	}

	[Fact]
	public void UpdateFromPull_UntrackedFile_ThrowsInvalidOperation() {
		Assert.Throws<InvalidOperationException>(() =>
			_manager.UpdateFromPull("/nonexistent/file.wikitext", 123, "hash"));
	}

	[Fact]
	public void UpdateFromPush_UpdatesSyncInfoAndAddsNote() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Test:Page");
		_manager.MarkAsReviewed(filePath, "Reviewer", "Original notes");

		var state = _manager.UpdateFromPush(filePath, 54321, "newhash");

		Assert.Equal(54321, state.LastSyncedRevisionId);
		Assert.Equal("newhash", state.LastSyncedContentHash);
		Assert.Equal(WikiSyncStatus.InSync, state.Status);
		Assert.Contains("Uploaded revision 54321", state.ReviewNotes);
	}

	[Fact]
	public void UpdateFromPush_UntrackedFile_ThrowsInvalidOperation() {
		Assert.Throws<InvalidOperationException>(() =>
			_manager.UpdateFromPush("/nonexistent/file.wikitext", 123, "hash"));
	}

	[Fact]
	public void UntrackFile_RemovesState() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Test:Page");

		_manager.UntrackFile(filePath);

		Assert.Null(_manager.GetSyncState(filePath));
	}

	[Fact]
	public void UntrackFile_NonexistentFile_DoesNotThrow() {
		// Should not throw for untracked file
		_manager.UntrackFile("/nonexistent/file.wikitext");
	}

	[Fact]
	public void ScanDirectory_FindsWikitextFiles() {
		var file1 = Path.Combine(_testDir, "file1.wikitext");
		var file2 = Path.Combine(_testDir, "file2.wikitext");
		var file3 = Path.Combine(_testDir, "file3.txt"); // Not wikitext
		File.WriteAllText(file1, "Content 1");
		File.WriteAllText(file2, "Content 2");
		File.WriteAllText(file3, "Not wikitext");

		var results = _manager.ScanDirectory(_testDir, path =>
			Path.GetFileNameWithoutExtension(path).Replace(' ', '_'));

		Assert.Equal(2, results.Count);
		Assert.Contains(results, s => s.WikiTitle == "file1");
		Assert.Contains(results, s => s.WikiTitle == "file2");
	}

	[Fact]
	public void ScanDirectory_RecursivelyFindsFiles() {
		var subDir = Path.Combine(_testDir, "subdir");
		Directory.CreateDirectory(subDir);
		var file1 = Path.Combine(_testDir, "root.wikitext");
		var file2 = Path.Combine(subDir, "nested.wikitext");
		File.WriteAllText(file1, "Root content");
		File.WriteAllText(file2, "Nested content");

		var results = _manager.ScanDirectory(_testDir, path =>
			Path.GetFileNameWithoutExtension(path));

		Assert.Equal(2, results.Count);
		Assert.Contains(results, s => s.WikiTitle == "root");
		Assert.Contains(results, s => s.WikiTitle == "nested");
	}

	[Fact]
	public void ScanDirectory_DoesNotDuplicateExistingFiles() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Original:Title");

		var results = _manager.ScanDirectory(_testDir, _ => "New:Title");

		Assert.Single(results);
		Assert.Equal("Original:Title", results[0].WikiTitle); // Keeps original title
	}

	[Fact]
	public void State_PersistsAcrossInstances() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");
		_manager.TrackFile(filePath, "Persistent:Page");
		_manager.MarkAsReviewed(filePath, "Reviewer", "Notes");

		// Create new manager instance
		var newManager = new WikiSyncManager(_testDir);
		var state = newManager.GetSyncState(filePath);

		Assert.NotNull(state);
		Assert.Equal("Persistent:Page", state.WikiTitle);
		Assert.True(state.ReviewedForUpload);
		Assert.Equal("Reviewer", state.ReviewedBy);
	}

	[Fact]
	public void TrackFile_OverwritesExisting() {
		var filePath = Path.Combine(_testDir, "test.wikitext");
		File.WriteAllText(filePath, "Test content");

		_manager.TrackFile(filePath, "First:Title");
		_manager.TrackFile(filePath, "Second:Title");

		var state = _manager.GetSyncState(filePath);

		Assert.NotNull(state);
		Assert.Equal("Second:Title", state.WikiTitle);
	}

	[Fact]
	public void PathNormalization_HandlesBackslashes() {
		var filePathWithBackslash = Path.Combine(_testDir, "test.wikitext");
		var filePathWithForwardSlash = filePathWithBackslash.Replace('\\', '/');

		File.WriteAllText(filePathWithBackslash, "Test content");
		_manager.TrackFile(filePathWithBackslash, "Test:Page");

		// Should find the file regardless of slash style
		var state1 = _manager.GetSyncState(filePathWithBackslash);
		var state2 = _manager.GetSyncState(filePathWithForwardSlash);

		Assert.NotNull(state1);
		Assert.NotNull(state2);
		Assert.Equal(state1.WikiTitle, state2.WikiTitle);
	}
}
