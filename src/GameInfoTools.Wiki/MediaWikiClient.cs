using System.Net;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Wiki;

/// <summary>
/// Client for interacting with MediaWiki API.
/// Supports reading pages, comparing revisions, and (with proper review) editing.
///
/// Content policy is configurable per wiki - some wikis forbid AI content,
/// others allow it. Use WikiProfileManager to configure policies.
/// </summary>
public class MediaWikiClient : IDisposable {
	private readonly HttpClient _httpClient;
	private readonly MediaWikiConfig _config;
	private readonly WikiContentPolicy _contentPolicy;
	private readonly CookieContainer _cookies;
	private string? _csrfToken;
	private bool _isLoggedIn;
	private bool _disposed;
	private DateTime _lastEditTime = DateTime.MinValue;
	private int _editsThisHour;
	private DateTime _editHourStart = DateTime.UtcNow;

	/// <summary>
	/// Event raised when an operation is about to upload content.
	/// Handlers should verify the content has been manually reviewed.
	/// </summary>
	public event EventHandler<UploadVerificationEventArgs>? UploadRequested;

	/// <summary>
	/// Creates a new MediaWiki client with default (permissive) content policy.
	/// </summary>
	public MediaWikiClient(MediaWikiConfig config) : this(config, new WikiContentPolicy { AllowsAiContent = true }) {
	}

	/// <summary>
	/// Creates a new MediaWiki client with the specified content policy.
	/// </summary>
	public MediaWikiClient(MediaWikiConfig config, WikiContentPolicy contentPolicy) {
		_config = config ?? throw new ArgumentNullException(nameof(config));
		_contentPolicy = contentPolicy ?? throw new ArgumentNullException(nameof(contentPolicy));
		_cookies = new CookieContainer();

		var handler = new HttpClientHandler {
			CookieContainer = _cookies,
			UseCookies = true
		};

		_httpClient = new HttpClient(handler) {
			Timeout = TimeSpan.FromSeconds(config.TimeoutSeconds)
		};

		_httpClient.DefaultRequestHeaders.UserAgent.ParseAdd(config.UserAgent);
		_httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
	}

	/// <summary>
	/// Whether the client is currently logged in.
	/// </summary>
	public bool IsLoggedIn => _isLoggedIn;

	/// <summary>
	/// The wiki configuration.
	/// </summary>
	public MediaWikiConfig Config => _config;

	/// <summary>
	/// The content policy for this wiki.
	/// </summary>
	public WikiContentPolicy ContentPolicy => _contentPolicy;

	/// <summary>
	/// Whether this wiki allows AI-generated content.
	/// </summary>
	public bool AllowsAiContent => _contentPolicy.AllowsAiContent;

	/// <summary>
	/// Gets the AI content warning message for this wiki, if applicable.
	/// </summary>
	public string? AiContentWarning =>
		!_contentPolicy.AllowsAiContent && !string.IsNullOrEmpty(_contentPolicy.AiContentWarning)
			? _contentPolicy.AiContentWarning
			: null;

	#region Read Operations (Safe)

	/// <summary>
	/// Gets a wiki page by title.
	/// </summary>
	public async Task<WikiPage?> GetPageAsync(string title, CancellationToken cancellationToken = default) {
		var parameters = new Dictionary<string, string> {
			["action"] = "query",
			["titles"] = title,
			["prop"] = "revisions",
			["rvprop"] = "ids|timestamp|user|content",
			["rvslots"] = "main",
			["format"] = "json",
			["formatversion"] = "2"
		};

		var response = await GetAsync(parameters, cancellationToken);
		var pages = response.RootElement
			.GetProperty("query")
			.GetProperty("pages");

		if (pages.GetArrayLength() == 0) return null;

		var page = pages[0];

		if (page.TryGetProperty("missing", out _)) {
			return new WikiPage {
				Title = title,
				PageId = 0,
				Content = ""
			};
		}

		var revision = page.GetProperty("revisions")[0];
		var content = revision.GetProperty("slots").GetProperty("main").GetProperty("content").GetString() ?? "";

		return new WikiPage {
			Title = page.GetProperty("title").GetString() ?? title,
			PageId = page.GetProperty("pageid").GetInt32(),
			RevisionId = revision.GetProperty("revid").GetInt32(),
			LastModified = DateTime.Parse(revision.GetProperty("timestamp").GetString()!),
			LastEditor = revision.GetProperty("user").GetString(),
			Content = content
		};
	}

	/// <summary>
	/// Gets page revisions/history.
	/// </summary>
	public async Task<IReadOnlyList<WikiRevision>> GetPageHistoryAsync(
		string title,
		int limit = 50,
		CancellationToken cancellationToken = default) {

		var parameters = new Dictionary<string, string> {
			["action"] = "query",
			["titles"] = title,
			["prop"] = "revisions",
			["rvprop"] = "ids|timestamp|user|comment|size",
			["rvlimit"] = limit.ToString(),
			["format"] = "json",
			["formatversion"] = "2"
		};

		var response = await GetAsync(parameters, cancellationToken);
		var pages = response.RootElement
			.GetProperty("query")
			.GetProperty("pages");

		if (pages.GetArrayLength() == 0) return [];

		var page = pages[0];
		if (!page.TryGetProperty("revisions", out var revisions)) return [];

		var result = new List<WikiRevision>();
		foreach (var rev in revisions.EnumerateArray()) {
			result.Add(new WikiRevision {
				RevisionId = rev.GetProperty("revid").GetInt32(),
				ParentId = rev.TryGetProperty("parentid", out var pid) ? pid.GetInt32() : 0,
				User = rev.GetProperty("user").GetString() ?? "Unknown",
				Timestamp = DateTime.Parse(rev.GetProperty("timestamp").GetString()!),
				Comment = rev.TryGetProperty("comment", out var comment) ? comment.GetString() ?? "" : "",
				Size = rev.TryGetProperty("size", out var size) ? size.GetInt32() : 0
			});
		}

		return result;
	}

	/// <summary>
	/// Gets a specific revision's content.
	/// </summary>
	public async Task<WikiRevision?> GetRevisionAsync(int revisionId, CancellationToken cancellationToken = default) {
		var parameters = new Dictionary<string, string> {
			["action"] = "query",
			["revids"] = revisionId.ToString(),
			["prop"] = "revisions",
			["rvprop"] = "ids|timestamp|user|comment|content",
			["rvslots"] = "main",
			["format"] = "json",
			["formatversion"] = "2"
		};

		var response = await GetAsync(parameters, cancellationToken);
		var pages = response.RootElement
			.GetProperty("query")
			.GetProperty("pages");

		if (pages.GetArrayLength() == 0) return null;

		var page = pages[0];
		if (!page.TryGetProperty("revisions", out var revisions) || revisions.GetArrayLength() == 0)
			return null;

		var rev = revisions[0];
		var content = rev.GetProperty("slots").GetProperty("main").GetProperty("content").GetString();

		return new WikiRevision {
			RevisionId = rev.GetProperty("revid").GetInt32(),
			ParentId = rev.TryGetProperty("parentid", out var pid) ? pid.GetInt32() : 0,
			User = rev.GetProperty("user").GetString() ?? "Unknown",
			Timestamp = DateTime.Parse(rev.GetProperty("timestamp").GetString()!),
			Comment = rev.TryGetProperty("comment", out var c) ? c.GetString() ?? "" : "",
			Content = content
		};
	}

	/// <summary>
	/// Compares two revisions and returns the diff.
	/// </summary>
	public async Task<WikiDiff> CompareRevisionsAsync(
		int fromRevId,
		int toRevId,
		CancellationToken cancellationToken = default) {

		var parameters = new Dictionary<string, string> {
			["action"] = "compare",
			["fromrev"] = fromRevId.ToString(),
			["torev"] = toRevId.ToString(),
			["format"] = "json",
			["formatversion"] = "2"
		};

		var response = await GetAsync(parameters, cancellationToken);
		var compare = response.RootElement.GetProperty("compare");

		// Get both revision contents
		var fromRev = await GetRevisionAsync(fromRevId, cancellationToken);
		var toRev = await GetRevisionAsync(toRevId, cancellationToken);

		return new WikiDiff {
			FromRevisionId = fromRevId,
			ToRevisionId = toRevId,
			FromContent = fromRev?.Content ?? "",
			ToContent = toRev?.Content ?? "",
			HtmlDiff = compare.TryGetProperty("body", out var body) ? body.GetString() : null
		};
	}

	/// <summary>
	/// Searches for pages matching a query.
	/// </summary>
	public async Task<IReadOnlyList<WikiPage>> SearchPagesAsync(
		string query,
		int limit = 20,
		CancellationToken cancellationToken = default) {

		var parameters = new Dictionary<string, string> {
			["action"] = "query",
			["list"] = "search",
			["srsearch"] = query,
			["srlimit"] = limit.ToString(),
			["format"] = "json",
			["formatversion"] = "2"
		};

		var response = await GetAsync(parameters, cancellationToken);
		var search = response.RootElement
			.GetProperty("query")
			.GetProperty("search");

		var results = new List<WikiPage>();
		foreach (var item in search.EnumerateArray()) {
			results.Add(new WikiPage {
				Title = item.GetProperty("title").GetString() ?? "",
				PageId = item.GetProperty("pageid").GetInt32()
			});
		}

		return results;
	}

	#endregion

	#region Authentication

	/// <summary>
	/// Logs in to the wiki using bot password authentication.
	/// </summary>
	public async Task<LoginResult> LoginAsync(CancellationToken cancellationToken = default) {
		if (string.IsNullOrEmpty(_config.Username) || string.IsNullOrEmpty(_config.BotPassword)) {
			return new LoginResult {
				Success = false,
				Error = "Username and bot password are required"
			};
		}

		// Step 1: Get login token
		var tokenParams = new Dictionary<string, string> {
			["action"] = "query",
			["meta"] = "tokens",
			["type"] = "login",
			["format"] = "json",
			["formatversion"] = "2"
		};

		var tokenResponse = await GetAsync(tokenParams, cancellationToken);
		var loginToken = tokenResponse.RootElement
			.GetProperty("query")
			.GetProperty("tokens")
			.GetProperty("logintoken")
			.GetString();

		// Step 2: Perform login
		var loginParams = new Dictionary<string, string> {
			["action"] = "login",
			["lgname"] = _config.Username,
			["lgpassword"] = _config.BotPassword,
			["lgtoken"] = loginToken!,
			["format"] = "json",
			["formatversion"] = "2"
		};

		var loginResponse = await PostAsync(loginParams, cancellationToken);
		var login = loginResponse.RootElement.GetProperty("login");
		var result = login.GetProperty("result").GetString();

		if (result == "Success") {
			_isLoggedIn = true;
			// Get CSRF token for editing
			await RefreshCsrfTokenAsync(cancellationToken);

			return new LoginResult {
				Success = true,
				Username = login.GetProperty("lgusername").GetString()
			};
		}

		return new LoginResult {
			Success = false,
			Error = login.TryGetProperty("reason", out var reason) ? reason.GetString() : "Login failed"
		};
	}

	/// <summary>
	/// Logs out from the wiki.
	/// </summary>
	public async Task LogoutAsync(CancellationToken cancellationToken = default) {
		if (!_isLoggedIn) return;

		var parameters = new Dictionary<string, string> {
			["action"] = "logout",
			["token"] = _csrfToken ?? "+\\",
			["format"] = "json"
		};

		await PostAsync(parameters, cancellationToken);
		_isLoggedIn = false;
		_csrfToken = null;
	}

	private async Task RefreshCsrfTokenAsync(CancellationToken cancellationToken) {
		var parameters = new Dictionary<string, string> {
			["action"] = "query",
			["meta"] = "tokens",
			["type"] = "csrf",
			["format"] = "json",
			["formatversion"] = "2"
		};

		var response = await GetAsync(parameters, cancellationToken);
		_csrfToken = response.RootElement
			.GetProperty("query")
			.GetProperty("tokens")
			.GetProperty("csrftoken")
			.GetString();
	}

	#endregion

	#region Write Operations (Requires Review)

	/// <summary>
	/// Edits a wiki page.
	///
	/// Content policy is determined by the wiki profile.
	/// For wikis that forbid AI content, all content must be marked as reviewed before uploading.
	/// </summary>
	/// <param name="title">Page title to edit.</param>
	/// <param name="content">New page content (wikitext).</param>
	/// <param name="summary">Edit summary.</param>
	/// <param name="syncState">Sync state with review confirmation.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>Edit result.</returns>
	public async Task<EditResult> EditPageAsync(
		string title,
		string content,
		string summary,
		WikiSyncState syncState,
		CancellationToken cancellationToken = default) {

		// Check content policy - if AI content not allowed, require review
		if (!_contentPolicy.AllowsAiContent && !syncState.ReviewedForUpload) {
			return new EditResult {
				Success = false,
				ErrorCode = "NOT_REVIEWED",
				ErrorMessage = _contentPolicy.AiContentWarning.Length > 0
					? _contentPolicy.AiContentWarning
					: "Content has not been marked as reviewed. " +
						"This wiki requires manual review before uploading."
			};
		}

		// Check if review is required regardless of AI policy
		if (_contentPolicy.RequireReviewBeforeUpload && !syncState.ReviewedForUpload) {
			return new EditResult {
				Success = false,
				ErrorCode = "NOT_REVIEWED",
				ErrorMessage = "This wiki requires all content to be reviewed before uploading."
			};
		}

		// Check rate limits
		var rateLimitResult = CheckRateLimits();
		if (rateLimitResult != null) return rateLimitResult;

		// Allow event handlers to abort upload
		var verifyArgs = new UploadVerificationEventArgs(title, content, syncState);
		UploadRequested?.Invoke(this, verifyArgs);

		if (verifyArgs.Cancel) {
			return new EditResult {
				Success = false,
				ErrorCode = "UPLOAD_CANCELLED",
				ErrorMessage = verifyArgs.CancelReason ?? "Upload cancelled by verification handler"
			};
		}

		if (!_isLoggedIn) {
			return new EditResult {
				Success = false,
				ErrorCode = "NOT_LOGGED_IN",
				ErrorMessage = "Must be logged in to edit pages"
			};
		}

		if (string.IsNullOrEmpty(_csrfToken)) {
			await RefreshCsrfTokenAsync(cancellationToken);
		}

		// Apply required summary prefix if configured
		var finalSummary = !string.IsNullOrEmpty(_contentPolicy.RequiredSummaryPrefix)
			? $"{_contentPolicy.RequiredSummaryPrefix} {summary}"
			: summary;

		var parameters = new Dictionary<string, string> {
			["action"] = "edit",
			["title"] = title,
			["text"] = content,
			["summary"] = finalSummary,
			["token"] = _csrfToken!,
			["format"] = "json",
			["formatversion"] = "2"
		};

		// If we have a known base revision, use it for edit conflict detection
		if (syncState.LastSyncedRevisionId > 0) {
			parameters["baserevid"] = syncState.LastSyncedRevisionId.ToString();
		}

		try {
			// Apply rate limit delay if needed
			await ApplyRateLimitDelayAsync(cancellationToken);

			var response = await PostAsync(parameters, cancellationToken);

			// Record edit for rate limiting
			RecordEdit();

			if (response.RootElement.TryGetProperty("error", out var error)) {
				return new EditResult {
					Success = false,
					ErrorCode = error.GetProperty("code").GetString(),
					ErrorMessage = error.GetProperty("info").GetString()
				};
			}

			var edit = response.RootElement.GetProperty("edit");
			var editResult = edit.GetProperty("result").GetString();

			if (editResult == "Success") {
				return new EditResult {
					Success = true,
					Title = title,
					NewRevisionId = edit.TryGetProperty("newrevid", out var newRev) ? newRev.GetInt32() : null
				};
			}

			return new EditResult {
				Success = false,
				ErrorCode = editResult,
				ErrorMessage = "Edit failed"
			};
		} catch (Exception ex) {
			return new EditResult {
				Success = false,
				ErrorCode = "EXCEPTION",
				ErrorMessage = ex.Message
			};
		}
	}

	private EditResult? CheckRateLimits() {
		// Reset hourly counter if needed
		if ((DateTime.UtcNow - _editHourStart).TotalHours >= 1) {
			_editsThisHour = 0;
			_editHourStart = DateTime.UtcNow;
		}

		// Check max edits per hour
		if (_contentPolicy.MaxEditsPerHour > 0 && _editsThisHour >= _contentPolicy.MaxEditsPerHour) {
			var resetTime = _editHourStart.AddHours(1);
			return new EditResult {
				Success = false,
				ErrorCode = "RATE_LIMITED",
				ErrorMessage = $"Rate limit reached ({_contentPolicy.MaxEditsPerHour} edits/hour). " +
					$"Try again after {resetTime:HH:mm:ss} UTC."
			};
		}

		return null;
	}

	private async Task ApplyRateLimitDelayAsync(CancellationToken cancellationToken) {
		if (_contentPolicy.MinEditDelaySeconds > 0) {
			var timeSinceLastEdit = DateTime.UtcNow - _lastEditTime;
			var requiredDelay = TimeSpan.FromSeconds(_contentPolicy.MinEditDelaySeconds);

			if (timeSinceLastEdit < requiredDelay) {
				var delay = requiredDelay - timeSinceLastEdit;
				await Task.Delay(delay, cancellationToken);
			}
		}
	}

	private void RecordEdit() {
		_lastEditTime = DateTime.UtcNow;
		_editsThisHour++;
	}

	#endregion

	#region HTTP Helpers

	private async Task<JsonDocument> GetAsync(
		Dictionary<string, string> parameters,
		CancellationToken cancellationToken) {

		var query = string.Join("&", parameters.Select(p => $"{Uri.EscapeDataString(p.Key)}={Uri.EscapeDataString(p.Value)}"));
		var url = $"{_config.ApiUrl}?{query}";

		var response = await _httpClient.GetAsync(url, cancellationToken);
		response.EnsureSuccessStatusCode();

		var json = await response.Content.ReadAsStringAsync(cancellationToken);
		return JsonDocument.Parse(json);
	}

	private async Task<JsonDocument> PostAsync(
		Dictionary<string, string> parameters,
		CancellationToken cancellationToken) {

		var content = new FormUrlEncodedContent(parameters);
		var response = await _httpClient.PostAsync(_config.ApiUrl, content, cancellationToken);
		response.EnsureSuccessStatusCode();

		var json = await response.Content.ReadAsStringAsync(cancellationToken);
		return JsonDocument.Parse(json);
	}

	#endregion

	#region Utility Methods

	/// <summary>
	/// Computes MD5 hash of content for sync tracking.
	/// </summary>
	public static string ComputeContentHash(string content) {
		var bytes = Encoding.UTF8.GetBytes(content);
		var hash = MD5.HashData(bytes);
		return Convert.ToHexStringLower(hash);
	}

	/// <summary>
	/// Creates a diff between two strings.
	/// </summary>
	public static string CreateUnifiedDiff(string oldContent, string newContent, string oldLabel = "local", string newLabel = "remote") {
		var oldLines = oldContent.Split('\n');
		var newLines = newContent.Split('\n');

		var sb = new StringBuilder();
		sb.AppendLine($"--- {oldLabel}");
		sb.AppendLine($"+++ {newLabel}");

		// Simple line-by-line diff (not a full LCS algorithm)
		int oldIndex = 0, newIndex = 0;
		while (oldIndex < oldLines.Length || newIndex < newLines.Length) {
			if (oldIndex >= oldLines.Length) {
				sb.AppendLine($"+{newLines[newIndex++]}");
			} else if (newIndex >= newLines.Length) {
				sb.AppendLine($"-{oldLines[oldIndex++]}");
			} else if (oldLines[oldIndex] == newLines[newIndex]) {
				sb.AppendLine($" {oldLines[oldIndex++]}");
				newIndex++;
			} else {
				sb.AppendLine($"-{oldLines[oldIndex++]}");
				if (newIndex < newLines.Length) {
					sb.AppendLine($"+{newLines[newIndex++]}");
				}
			}
		}

		return sb.ToString();
	}

	#endregion

	#region IDisposable

	public void Dispose() {
		Dispose(true);
		GC.SuppressFinalize(this);
	}

	protected virtual void Dispose(bool disposing) {
		if (_disposed) return;

		if (disposing) {
			_httpClient.Dispose();
		}

		_disposed = true;
	}

	#endregion
}

/// <summary>
/// Event arguments for upload verification.
/// </summary>
public class UploadVerificationEventArgs : EventArgs {
	public string Title { get; }
	public string Content { get; }
	public WikiSyncState SyncState { get; }
	public bool Cancel { get; set; }
	public string? CancelReason { get; set; }

	public UploadVerificationEventArgs(string title, string content, WikiSyncState syncState) {
		Title = title;
		Content = content;
		SyncState = syncState;
	}
}
