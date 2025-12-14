using GameInfoTools.Wiki;

namespace GameInfoTools.Tests;

public class MediaWikiTypesTests {
	[Fact]
	public void WikiPage_Exists_TrueWhenPageIdPositive() {
		var page = new WikiPage {
			Title = "Test",
			PageId = 123
		};

		Assert.True(page.Exists);
	}

	[Fact]
	public void WikiPage_Exists_FalseWhenPageIdZero() {
		var page = new WikiPage {
			Title = "Test",
			PageId = 0
		};

		Assert.False(page.Exists);
	}

	[Fact]
	public void WikiPage_Exists_FalseWhenPageIdNegative() {
		var page = new WikiPage {
			Title = "Test",
			PageId = -1
		};

		Assert.False(page.Exists);
	}

	[Fact]
	public void WikiPage_DefaultContent_IsEmpty() {
		var page = new WikiPage { Title = "Test" };

		Assert.Equal("", page.Content);
	}

	[Fact]
	public void WikiRevision_DefaultComment_IsEmpty() {
		var revision = new WikiRevision {
			User = "TestUser"
		};

		Assert.Equal("", revision.Comment);
	}

	[Fact]
	public void WikiDiff_DefaultContent_IsEmpty() {
		var diff = new WikiDiff();

		Assert.Equal("", diff.FromContent);
		Assert.Equal("", diff.ToContent);
	}

	[Fact]
	public void WikiSyncState_DefaultStatus_IsUnknown() {
		var state = new WikiSyncState {
			LocalPath = "/test/path",
			WikiTitle = "Test"
		};

		Assert.Equal(WikiSyncStatus.Unknown, state.Status);
	}

	[Fact]
	public void WikiSyncState_DefaultReviewedForUpload_IsFalse() {
		var state = new WikiSyncState {
			LocalPath = "/test/path",
			WikiTitle = "Test"
		};

		Assert.False(state.ReviewedForUpload);
	}

	[Fact]
	public void MediaWikiConfig_ApiUrl_CombinesBaseUrlAndPath() {
		var config = new MediaWikiConfig {
			BaseUrl = "https://example.com",
			ApiPath = "/w/api.php"
		};

		Assert.Equal("https://example.com/w/api.php", config.ApiUrl);
	}

	[Fact]
	public void MediaWikiConfig_ApiUrl_TrimsTrailingSlash() {
		var config = new MediaWikiConfig {
			BaseUrl = "https://example.com/",
			ApiPath = "/w/api.php"
		};

		Assert.Equal("https://example.com/w/api.php", config.ApiUrl);
	}

	[Fact]
	public void MediaWikiConfig_DefaultApiPath_IsStandard() {
		var config = new MediaWikiConfig {
			BaseUrl = "https://example.com"
		};

		Assert.Equal("/w/api.php", config.ApiPath);
	}

	[Fact]
	public void MediaWikiConfig_DefaultTimeout_Is30Seconds() {
		var config = new MediaWikiConfig {
			BaseUrl = "https://example.com"
		};

		Assert.Equal(30, config.TimeoutSeconds);
	}

	[Fact]
	public void MediaWikiConfig_DefaultUserAgent_ContainsGameInfoTools() {
		var config = new MediaWikiConfig {
			BaseUrl = "https://example.com"
		};

		Assert.Contains("GameInfoTools", config.UserAgent);
	}

	[Fact]
	public void LoginResult_Success_DefaultFalse() {
		var result = new LoginResult();

		Assert.False(result.Success);
	}

	[Fact]
	public void EditResult_Success_DefaultFalse() {
		var result = new EditResult();

		Assert.False(result.Success);
	}

	[Fact]
	public void EditResult_Blocked_DefaultFalse() {
		var result = new EditResult();

		Assert.False(result.Blocked);
	}

	[Theory]
	[InlineData(WikiSyncStatus.LocalOnly)]
	[InlineData(WikiSyncStatus.RemoteOnly)]
	[InlineData(WikiSyncStatus.InSync)]
	[InlineData(WikiSyncStatus.LocalModified)]
	[InlineData(WikiSyncStatus.RemoteModified)]
	[InlineData(WikiSyncStatus.Conflict)]
	[InlineData(WikiSyncStatus.Unknown)]
	public void WikiSyncStatus_AllValuesExist(WikiSyncStatus status) {
		Assert.True(Enum.IsDefined(status));
	}

	[Fact]
	public void WikiSyncState_WithReviewInfo_StoresAllFields() {
		var reviewTime = DateTime.UtcNow;
		var state = new WikiSyncState {
			LocalPath = "/test/path.wikitext",
			WikiTitle = "Test:Page",
			LastSyncedRevisionId = 12345,
			LastSyncedContentHash = "abc123",
			LastSyncTimestamp = reviewTime,
			Status = WikiSyncStatus.InSync,
			ReviewedForUpload = true,
			ReviewNotes = "Looks good",
			ReviewedBy = "Reviewer",
			ReviewTimestamp = reviewTime
		};

		Assert.Equal("/test/path.wikitext", state.LocalPath);
		Assert.Equal("Test:Page", state.WikiTitle);
		Assert.Equal(12345, state.LastSyncedRevisionId);
		Assert.Equal("abc123", state.LastSyncedContentHash);
		Assert.Equal(reviewTime, state.LastSyncTimestamp);
		Assert.Equal(WikiSyncStatus.InSync, state.Status);
		Assert.True(state.ReviewedForUpload);
		Assert.Equal("Looks good", state.ReviewNotes);
		Assert.Equal("Reviewer", state.ReviewedBy);
		Assert.Equal(reviewTime, state.ReviewTimestamp);
	}

	[Fact]
	public void WikiPage_WithAllFields_StoresCorrectly() {
		var modified = DateTime.UtcNow;
		var page = new WikiPage {
			PageId = 100,
			Title = "Dragon Warrior:ROM map",
			Content = "= ROM Map =",
			RevisionId = 5000,
			LastModified = modified,
			LastEditor = "WikiUser"
		};

		Assert.Equal(100, page.PageId);
		Assert.Equal("Dragon Warrior:ROM map", page.Title);
		Assert.Equal("= ROM Map =", page.Content);
		Assert.Equal(5000, page.RevisionId);
		Assert.Equal(modified, page.LastModified);
		Assert.Equal("WikiUser", page.LastEditor);
		Assert.True(page.Exists);
	}

	[Fact]
	public void WikiRevision_WithAllFields_StoresCorrectly() {
		var timestamp = DateTime.UtcNow;
		var revision = new WikiRevision {
			RevisionId = 12345,
			ParentId = 12344,
			User = "Editor",
			Timestamp = timestamp,
			Comment = "Fixed typo",
			Size = 1024,
			Content = "Page content here"
		};

		Assert.Equal(12345, revision.RevisionId);
		Assert.Equal(12344, revision.ParentId);
		Assert.Equal("Editor", revision.User);
		Assert.Equal(timestamp, revision.Timestamp);
		Assert.Equal("Fixed typo", revision.Comment);
		Assert.Equal(1024, revision.Size);
		Assert.Equal("Page content here", revision.Content);
	}

	[Fact]
	public void WikiDiff_WithAllFields_StoresCorrectly() {
		var diff = new WikiDiff {
			FromRevisionId = 100,
			ToRevisionId = 101,
			FromContent = "Old content",
			ToContent = "New content",
			HtmlDiff = "<table>...</table>",
			UnifiedDiff = "--- a\n+++ b\n@@ -1 +1 @@\n-Old\n+New"
		};

		Assert.Equal(100, diff.FromRevisionId);
		Assert.Equal(101, diff.ToRevisionId);
		Assert.Equal("Old content", diff.FromContent);
		Assert.Equal("New content", diff.ToContent);
		Assert.Equal("<table>...</table>", diff.HtmlDiff);
		Assert.Contains("-Old", diff.UnifiedDiff);
		Assert.Contains("+New", diff.UnifiedDiff);
	}
}
