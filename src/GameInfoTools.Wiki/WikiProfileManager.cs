using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Wiki;

/// <summary>
/// Represents a wiki profile configuration.
/// Profiles allow connecting to different MediaWiki instances with different settings.
/// </summary>
public record WikiProfile {
	/// <summary>
	/// Unique profile identifier.
	/// </summary>
	public required string Id { get; init; }

	/// <summary>
	/// Display name for the profile.
	/// </summary>
	public required string Name { get; init; }

	/// <summary>
	/// Description of the wiki.
	/// </summary>
	public string? Description { get; init; }

	/// <summary>
	/// Base configuration for connecting to the wiki.
	/// </summary>
	public required MediaWikiConfig Config { get; init; }

	/// <summary>
	/// Content policy settings for this wiki.
	/// </summary>
	public WikiContentPolicy ContentPolicy { get; init; } = new();

	/// <summary>
	/// Custom settings specific to this wiki.
	/// </summary>
	public Dictionary<string, string> CustomSettings { get; init; } = [];

	/// <summary>
	/// Whether this is the default profile.
	/// </summary>
	public bool IsDefault { get; init; }

	/// <summary>
	/// When this profile was created.
	/// </summary>
	public DateTime CreatedAt { get; init; } = DateTime.UtcNow;

	/// <summary>
	/// When this profile was last used.
	/// </summary>
	public DateTime? LastUsedAt { get; init; }
}

/// <summary>
/// Content policy settings for a wiki.
/// </summary>
public record WikiContentPolicy {
	/// <summary>
	/// Whether AI-generated content is allowed on this wiki.
	/// If false, all content must be marked as reviewed before upload.
	/// </summary>
	public bool AllowsAiContent { get; init; } = true;

	/// <summary>
	/// Warning message to display when AI content is not allowed.
	/// </summary>
	public string AiContentWarning { get; init; } = "";

	/// <summary>
	/// Whether to require manual review before uploading any content.
	/// </summary>
	public bool RequireReviewBeforeUpload { get; init; }

	/// <summary>
	/// Minimum delay between edits in seconds (for rate limiting).
	/// </summary>
	public int MinEditDelaySeconds { get; init; }

	/// <summary>
	/// Maximum edits per hour (0 = unlimited).
	/// </summary>
	public int MaxEditsPerHour { get; init; }

	/// <summary>
	/// Required edit summary prefix.
	/// </summary>
	public string? RequiredSummaryPrefix { get; init; }

	/// <summary>
	/// Categories that content should be added to.
	/// </summary>
	public List<string> DefaultCategories { get; init; } = [];
}

/// <summary>
/// Manages wiki profiles for connecting to different wiki sites.
/// </summary>
public class WikiProfileManager {
	private readonly string _profilesPath;
	private readonly Dictionary<string, WikiProfile> _profiles = [];
	private string? _defaultProfileId;

	/// <summary>
	/// Event raised when profiles are changed.
	/// </summary>
	public event EventHandler? ProfilesChanged;

	/// <summary>
	/// Creates a new profile manager.
	/// </summary>
	/// <param name="storagePath">Path to store profile data.</param>
	public WikiProfileManager(string storagePath) {
		_profilesPath = Path.Combine(storagePath, "wiki-profiles.json");
		LoadProfiles();
	}

	/// <summary>
	/// All registered profiles.
	/// </summary>
	public IReadOnlyDictionary<string, WikiProfile> Profiles => _profiles;

	/// <summary>
	/// The default profile, if set.
	/// </summary>
	public WikiProfile? DefaultProfile =>
		_defaultProfileId != null && _profiles.TryGetValue(_defaultProfileId, out var p) ? p : null;

	/// <summary>
	/// Adds or updates a profile.
	/// </summary>
	public void SaveProfile(WikiProfile profile) {
		ArgumentNullException.ThrowIfNull(profile);
		if (string.IsNullOrEmpty(profile.Id))
			throw new ArgumentException("Profile ID is required");

		_profiles[profile.Id] = profile;

		if (profile.IsDefault || _defaultProfileId == null) {
			_defaultProfileId = profile.Id;
		}

		SaveProfiles();
		ProfilesChanged?.Invoke(this, EventArgs.Empty);
	}

	/// <summary>
	/// Removes a profile.
	/// </summary>
	public bool RemoveProfile(string profileId) {
		if (!_profiles.Remove(profileId))
			return false;

		if (_defaultProfileId == profileId) {
			_defaultProfileId = _profiles.Keys.FirstOrDefault();
		}

		SaveProfiles();
		ProfilesChanged?.Invoke(this, EventArgs.Empty);
		return true;
	}

	/// <summary>
	/// Gets a profile by ID.
	/// </summary>
	public WikiProfile? GetProfile(string profileId) {
		return _profiles.GetValueOrDefault(profileId);
	}

	/// <summary>
	/// Sets the default profile.
	/// </summary>
	public void SetDefaultProfile(string profileId) {
		if (!_profiles.ContainsKey(profileId))
			throw new KeyNotFoundException($"Profile '{profileId}' not found");

		// Update old default
		if (_defaultProfileId != null && _profiles.TryGetValue(_defaultProfileId, out var oldDefault)) {
			_profiles[_defaultProfileId] = oldDefault with { IsDefault = false };
		}

		// Update new default
		_profiles[profileId] = _profiles[profileId] with { IsDefault = true };
		_defaultProfileId = profileId;

		SaveProfiles();
		ProfilesChanged?.Invoke(this, EventArgs.Empty);
	}

	/// <summary>
	/// Records that a profile was used.
	/// </summary>
	public void RecordProfileUsage(string profileId) {
		if (_profiles.TryGetValue(profileId, out var profile)) {
			_profiles[profileId] = profile with { LastUsedAt = DateTime.UtcNow };
			SaveProfiles();
		}
	}

	/// <summary>
	/// Creates a MediaWikiClient for the specified profile.
	/// </summary>
	public MediaWikiClient CreateClient(string profileId) {
		var profile = GetProfile(profileId)
			?? throw new KeyNotFoundException($"Profile '{profileId}' not found");

		RecordProfileUsage(profileId);
		return new MediaWikiClient(profile.Config, profile.ContentPolicy);
	}

	/// <summary>
	/// Creates a MediaWikiClient for the default profile.
	/// </summary>
	public MediaWikiClient CreateDefaultClient() {
		var profile = DefaultProfile
			?? throw new InvalidOperationException("No default profile configured");

		RecordProfileUsage(profile.Id);
		return new MediaWikiClient(profile.Config, profile.ContentPolicy);
	}

	#region Preset Profiles

	/// <summary>
	/// Creates a profile for Data Crystal wiki.
	/// </summary>
	public static WikiProfile CreateDataCrystalProfile(string? username = null, string? botPassword = null) =>
		new() {
			Id = "datacrystal",
			Name = "Data Crystal",
			Description = "The ROM Hacking wiki - Technical documentation for retro games",
			Config = new MediaWikiConfig {
				BaseUrl = "https://datacrystal.tcrf.net",
				ApiPath = "/w/api.php",
				Username = username,
				BotPassword = botPassword,
				UserAgent = "GameInfoTools/1.0 (https://github.com/TheAnsarya/GameInfo)"
			},
			ContentPolicy = new WikiContentPolicy {
				AllowsAiContent = false,
				AiContentWarning = "⚠️ Data Crystal FORBIDS AI-generated content. All content MUST be manually " +
					"reviewed and edited by a human before uploading. Violations will result in a permanent ban.",
				RequireReviewBeforeUpload = true,
				MinEditDelaySeconds = 5,
				MaxEditsPerHour = 30
			}
		};

	/// <summary>
	/// Creates a profile for The Cutting Room Floor wiki.
	/// </summary>
	public static WikiProfile CreateTcrfProfile(string? username = null, string? botPassword = null) =>
		new() {
			Id = "tcrf",
			Name = "The Cutting Room Floor",
			Description = "Documenting unused and cut content in video games",
			Config = new MediaWikiConfig {
				BaseUrl = "https://tcrf.net",
				ApiPath = "/w/api.php",
				Username = username,
				BotPassword = botPassword,
				UserAgent = "GameInfoTools/1.0 (https://github.com/TheAnsarya/GameInfo)"
			},
			ContentPolicy = new WikiContentPolicy {
				AllowsAiContent = false,
				AiContentWarning = "⚠️ TCRF does not allow AI-generated content. All content must be written " +
					"by humans and verified from the actual game data.",
				RequireReviewBeforeUpload = true,
				MinEditDelaySeconds = 5,
				MaxEditsPerHour = 30
			}
		};

	/// <summary>
	/// Creates a profile for a custom self-hosted wiki.
	/// </summary>
	public static WikiProfile CreateCustomProfile(
		string id,
		string name,
		string baseUrl,
		string? description = null,
		bool allowsAiContent = true,
		string? username = null,
		string? botPassword = null) =>
		new() {
			Id = id,
			Name = name,
			Description = description,
			Config = new MediaWikiConfig {
				BaseUrl = baseUrl,
				Username = username,
				BotPassword = botPassword,
				UserAgent = "GameInfoTools/1.0"
			},
			ContentPolicy = new WikiContentPolicy {
				AllowsAiContent = allowsAiContent,
				RequireReviewBeforeUpload = !allowsAiContent
			}
		};

	/// <summary>
	/// Creates a profile for a private/personal wiki (allows AI content).
	/// </summary>
	public static WikiProfile CreatePrivateWikiProfile(
		string id,
		string name,
		string baseUrl,
		string? username = null,
		string? botPassword = null) =>
		new() {
			Id = id,
			Name = name,
			Description = "Private wiki - AI content allowed",
			Config = new MediaWikiConfig {
				BaseUrl = baseUrl,
				Username = username,
				BotPassword = botPassword,
				UserAgent = "GameInfoTools/1.0"
			},
			ContentPolicy = new WikiContentPolicy {
				AllowsAiContent = true,
				RequireReviewBeforeUpload = false
			}
		};

	#endregion

	#region Persistence

	private void LoadProfiles() {
		if (!File.Exists(_profilesPath)) {
			InitializeDefaultProfiles();
			return;
		}

		try {
			var json = File.ReadAllText(_profilesPath);
			var data = JsonSerializer.Deserialize<ProfileStorageData>(json, GetJsonOptions());

			if (data != null) {
				foreach (var profile in data.Profiles) {
					_profiles[profile.Id] = profile;
				}
				_defaultProfileId = data.DefaultProfileId;
			}
		} catch {
			InitializeDefaultProfiles();
		}
	}

	private void SaveProfiles() {
		var data = new ProfileStorageData {
			Profiles = _profiles.Values.ToList(),
			DefaultProfileId = _defaultProfileId
		};

		var json = JsonSerializer.Serialize(data, GetJsonOptions());

		var directory = Path.GetDirectoryName(_profilesPath);
		if (!string.IsNullOrEmpty(directory) && !Directory.Exists(directory)) {
			Directory.CreateDirectory(directory);
		}

		File.WriteAllText(_profilesPath, json);
	}

	private void InitializeDefaultProfiles() {
		// Add Data Crystal as default preset (without credentials)
		var dataCrystal = CreateDataCrystalProfile();
		_profiles[dataCrystal.Id] = dataCrystal with { IsDefault = true };
		_defaultProfileId = dataCrystal.Id;

		// Add TCRF preset
		var tcrf = CreateTcrfProfile();
		_profiles[tcrf.Id] = tcrf;

		SaveProfiles();
	}

	private static JsonSerializerOptions GetJsonOptions() => new() {
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
	};

	private record ProfileStorageData {
		public List<WikiProfile> Profiles { get; init; } = [];
		public string? DefaultProfileId { get; init; }
	}

	#endregion
}
