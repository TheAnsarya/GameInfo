namespace GameInfoTools.Wiki;

/// <summary>
/// Represents a MediaWiki page.
/// </summary>
public record WikiPage {
	/// <summary>Page ID on the wiki.</summary>
	public int PageId { get; init; }

	/// <summary>Page title.</summary>
	public required string Title { get; init; }

	/// <summary>Full wikitext content.</summary>
	public string Content { get; init; } = "";

	/// <summary>Last revision ID.</summary>
	public int RevisionId { get; init; }

	/// <summary>Timestamp of last edit.</summary>
	public DateTime? LastModified { get; init; }

	/// <summary>User who made the last edit.</summary>
	public string? LastEditor { get; init; }

	/// <summary>Whether the page exists on the wiki.</summary>
	public bool Exists => PageId > 0;
}

/// <summary>
/// Represents a revision/edit of a wiki page.
/// </summary>
public record WikiRevision {
	/// <summary>Revision ID.</summary>
	public int RevisionId { get; init; }

	/// <summary>Parent revision ID (previous version).</summary>
	public int ParentId { get; init; }

	/// <summary>User who made this edit.</summary>
	public required string User { get; init; }

	/// <summary>Edit timestamp.</summary>
	public DateTime Timestamp { get; init; }

	/// <summary>Edit summary/comment.</summary>
	public string Comment { get; init; } = "";

	/// <summary>Size in bytes after this edit.</summary>
	public int Size { get; init; }

	/// <summary>Full wikitext at this revision.</summary>
	public string? Content { get; init; }
}

/// <summary>
/// Result of comparing two wiki page versions.
/// </summary>
public record WikiDiff {
	/// <summary>From revision ID.</summary>
	public int FromRevisionId { get; init; }

	/// <summary>To revision ID.</summary>
	public int ToRevisionId { get; init; }

	/// <summary>From revision content.</summary>
	public string FromContent { get; init; } = "";

	/// <summary>To revision content.</summary>
	public string ToContent { get; init; } = "";

	/// <summary>HTML diff (if available from API).</summary>
	public string? HtmlDiff { get; init; }

	/// <summary>Computed unified diff.</summary>
	public string? UnifiedDiff { get; init; }
}

/// <summary>
/// Status of a local wiki document compared to the remote wiki.
/// </summary>
public enum WikiSyncStatus {
	/// <summary>Local version only, not on wiki.</summary>
	LocalOnly,

	/// <summary>Wiki version only, not saved locally.</summary>
	RemoteOnly,

	/// <summary>Local and remote are identical.</summary>
	InSync,

	/// <summary>Local has changes not on wiki.</summary>
	LocalModified,

	/// <summary>Wiki has changes not saved locally.</summary>
	RemoteModified,

	/// <summary>Both local and remote have different changes.</summary>
	Conflict,

	/// <summary>Status unknown (not yet checked).</summary>
	Unknown
}

/// <summary>
/// Tracks synchronization state between local file and wiki page.
/// </summary>
public record WikiSyncState {
	/// <summary>Local file path.</summary>
	public required string LocalPath { get; init; }

	/// <summary>Wiki page title.</summary>
	public required string WikiTitle { get; init; }

	/// <summary>Last known revision ID from wiki.</summary>
	public int LastSyncedRevisionId { get; init; }

	/// <summary>MD5 hash of last synced content.</summary>
	public string? LastSyncedContentHash { get; init; }

	/// <summary>Timestamp of last sync.</summary>
	public DateTime? LastSyncTimestamp { get; init; }

	/// <summary>Current sync status.</summary>
	public WikiSyncStatus Status { get; init; } = WikiSyncStatus.Unknown;

	/// <summary>Whether this content has been manually reviewed for upload.</summary>
	public bool ReviewedForUpload { get; init; }

	/// <summary>Review notes/comments.</summary>
	public string? ReviewNotes { get; init; }

	/// <summary>Who reviewed this content.</summary>
	public string? ReviewedBy { get; init; }

	/// <summary>When the review was done.</summary>
	public DateTime? ReviewTimestamp { get; init; }
}

/// <summary>
/// Configuration for connecting to a MediaWiki instance.
/// </summary>
public record MediaWikiConfig {
	/// <summary>
	/// Base URL of the wiki (e.g., "https://datacrystal.tcrf.net").
	/// </summary>
	public required string BaseUrl { get; init; }

	/// <summary>
	/// API path (default: "/w/api.php").
	/// </summary>
	public string ApiPath { get; init; } = "/w/api.php";

	/// <summary>
	/// Full API URL.
	/// </summary>
	public string ApiUrl => BaseUrl.TrimEnd('/') + ApiPath;

	/// <summary>
	/// Username for authentication (optional).
	/// </summary>
	public string? Username { get; init; }

	/// <summary>
	/// Bot password or API token (optional, never store real passwords).
	/// </summary>
	public string? BotPassword { get; init; }

	/// <summary>
	/// User-Agent string to send with requests.
	/// </summary>
	public string UserAgent { get; init; } = "GameInfoTools/1.0 (https://github.com/TheAnsarya/GameInfo)";

	/// <summary>
	/// Request timeout in seconds.
	/// </summary>
	public int TimeoutSeconds { get; init; } = 30;
}

/// <summary>
/// Login result from the wiki.
/// </summary>
public record LoginResult {
	/// <summary>Whether login was successful.</summary>
	public bool Success { get; init; }

	/// <summary>Username of logged-in user.</summary>
	public string? Username { get; init; }

	/// <summary>Error message if login failed.</summary>
	public string? Error { get; init; }
}

/// <summary>
/// Result of an edit operation.
/// </summary>
public record EditResult {
	/// <summary>Whether the edit was successful.</summary>
	public bool Success { get; init; }

	/// <summary>Page title that was edited.</summary>
	public string? Title { get; init; }

	/// <summary>New revision ID after edit.</summary>
	public int? NewRevisionId { get; init; }

	/// <summary>Error code if edit failed.</summary>
	public string? ErrorCode { get; init; }

	/// <summary>Error message if edit failed.</summary>
	public string? ErrorMessage { get; init; }

	/// <summary>Whether the edit was blocked (e.g., spam filter).</summary>
	public bool Blocked { get; init; }
}
