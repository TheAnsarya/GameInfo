using GameInfoTools.Wiki;

namespace GameInfoTools.Tests.Wiki;

/// <summary>
/// Unit tests for WikiProfileManager.
/// </summary>
public class WikiProfileManagerTests : IDisposable {
	private readonly string _tempDir;
	private readonly WikiProfileManager _manager;

	public WikiProfileManagerTests() {
		_tempDir = Path.Combine(Path.GetTempPath(), $"WikiProfileTests_{Guid.NewGuid():N}");
		Directory.CreateDirectory(_tempDir);
		_manager = new WikiProfileManager(_tempDir);
	}

	public void Dispose() {
		if (Directory.Exists(_tempDir)) {
			Directory.Delete(_tempDir, true);
		}
		GC.SuppressFinalize(this);
	}

	#region Profile Management Tests

	[Fact]
	public void NewManager_HasDefaultProfiles() {
		// The manager should initialize with Data Crystal and TCRF presets
		Assert.True(_manager.Profiles.Count >= 2);
		Assert.Contains("datacrystal", _manager.Profiles.Keys);
		Assert.Contains("tcrf", _manager.Profiles.Keys);
	}

	[Fact]
	public void NewManager_HasDefaultProfile() {
		Assert.NotNull(_manager.DefaultProfile);
		Assert.True(_manager.DefaultProfile.IsDefault);
	}

	[Fact]
	public void SaveProfile_AddsNewProfile() {
		// Arrange
		var profile = WikiProfileManager.CreateCustomProfile(
			"test-wiki",
			"Test Wiki",
			"https://test.example.com");

		// Act
		_manager.SaveProfile(profile);

		// Assert
		Assert.Contains("test-wiki", _manager.Profiles.Keys);
		Assert.Equal("Test Wiki", _manager.Profiles["test-wiki"].Name);
	}

	[Fact]
	public void SaveProfile_UpdatesExistingProfile() {
		// Arrange
		var profile1 = WikiProfileManager.CreateCustomProfile("test", "Test 1", "https://test1.com");
		var profile2 = WikiProfileManager.CreateCustomProfile("test", "Test 2", "https://test2.com");

		// Act
		_manager.SaveProfile(profile1);
		_manager.SaveProfile(profile2);

		// Assert
		Assert.Equal("Test 2", _manager.Profiles["test"].Name);
		Assert.Equal("https://test2.com", _manager.Profiles["test"].Config.BaseUrl);
	}

	[Fact]
	public void RemoveProfile_RemovesExistingProfile() {
		// Arrange
		var profile = WikiProfileManager.CreateCustomProfile("removable", "Removable", "https://remove.com");
		_manager.SaveProfile(profile);

		// Act
		var result = _manager.RemoveProfile("removable");

		// Assert
		Assert.True(result);
		Assert.DoesNotContain("removable", _manager.Profiles.Keys);
	}

	[Fact]
	public void RemoveProfile_NonExistent_ReturnsFalse() {
		var result = _manager.RemoveProfile("nonexistent");
		Assert.False(result);
	}

	[Fact]
	public void GetProfile_ReturnsProfile() {
		var profile = _manager.GetProfile("datacrystal");
		Assert.NotNull(profile);
		Assert.Equal("Data Crystal", profile.Name);
	}

	[Fact]
	public void GetProfile_NonExistent_ReturnsNull() {
		var profile = _manager.GetProfile("nonexistent");
		Assert.Null(profile);
	}

	[Fact]
	public void SetDefaultProfile_ChangesDefault() {
		// Arrange
		var custom = WikiProfileManager.CreateCustomProfile("custom", "Custom", "https://custom.com");
		_manager.SaveProfile(custom);
		var oldDefault = _manager.DefaultProfile!.Id;

		// Act
		_manager.SetDefaultProfile("custom");

		// Assert
		Assert.Equal("custom", _manager.DefaultProfile!.Id);
		Assert.True(_manager.Profiles["custom"].IsDefault);
		Assert.False(_manager.Profiles[oldDefault].IsDefault);
	}

	[Fact]
	public void SetDefaultProfile_NonExistent_ThrowsException() {
		Assert.Throws<KeyNotFoundException>(() => _manager.SetDefaultProfile("nonexistent"));
	}

	#endregion

	#region Preset Profile Tests

	[Fact]
	public void CreateDataCrystalProfile_HasCorrectSettings() {
		var profile = WikiProfileManager.CreateDataCrystalProfile();

		Assert.Equal("datacrystal", profile.Id);
		Assert.Equal("https://datacrystal.tcrf.net", profile.Config.BaseUrl);
		Assert.False(profile.ContentPolicy.AllowsAiContent);
		Assert.True(profile.ContentPolicy.RequireReviewBeforeUpload);
		Assert.NotEmpty(profile.ContentPolicy.AiContentWarning);
	}

	[Fact]
	public void CreateTcrfProfile_HasCorrectSettings() {
		var profile = WikiProfileManager.CreateTcrfProfile();

		Assert.Equal("tcrf", profile.Id);
		Assert.Equal("https://tcrf.net", profile.Config.BaseUrl);
		Assert.False(profile.ContentPolicy.AllowsAiContent);
	}

	[Fact]
	public void CreateCustomProfile_HasCorrectSettings() {
		var profile = WikiProfileManager.CreateCustomProfile(
			"mywiki",
			"My Wiki",
			"https://wiki.example.com",
			"My personal wiki",
			allowsAiContent: true);

		Assert.Equal("mywiki", profile.Id);
		Assert.Equal("My Wiki", profile.Name);
		Assert.Equal("https://wiki.example.com", profile.Config.BaseUrl);
		Assert.True(profile.ContentPolicy.AllowsAiContent);
		Assert.False(profile.ContentPolicy.RequireReviewBeforeUpload);
	}

	[Fact]
	public void CreatePrivateWikiProfile_AllowsAiContent() {
		var profile = WikiProfileManager.CreatePrivateWikiProfile(
			"private",
			"Private Wiki",
			"https://private.local");

		Assert.True(profile.ContentPolicy.AllowsAiContent);
		Assert.False(profile.ContentPolicy.RequireReviewBeforeUpload);
	}

	[Fact]
	public void CreateDataCrystalProfile_WithCredentials() {
		var profile = WikiProfileManager.CreateDataCrystalProfile("testuser", "testpass");

		Assert.Equal("testuser", profile.Config.Username);
		Assert.Equal("testpass", profile.Config.BotPassword);
	}

	#endregion

	#region Client Creation Tests

	[Fact]
	public void CreateClient_ReturnsConfiguredClient() {
		var client = _manager.CreateClient("datacrystal");

		Assert.NotNull(client);
		Assert.Equal("https://datacrystal.tcrf.net", client.Config.BaseUrl);
		Assert.False(client.AllowsAiContent);
	}

	[Fact]
	public void CreateClient_NonExistent_ThrowsException() {
		Assert.Throws<KeyNotFoundException>(() => _manager.CreateClient("nonexistent"));
	}

	[Fact]
	public void CreateDefaultClient_ReturnsClient() {
		var client = _manager.CreateDefaultClient();

		Assert.NotNull(client);
		Assert.Equal(_manager.DefaultProfile!.Config.BaseUrl, client.Config.BaseUrl);
	}

	[Fact]
	public void CreateClient_UpdatesLastUsedAt() {
		// Get the profile before
		var beforeProfile = _manager.GetProfile("datacrystal");
		var beforeLastUsed = beforeProfile?.LastUsedAt;

		// Create client
		_ = _manager.CreateClient("datacrystal");

		// Get the profile after
		var afterProfile = _manager.GetProfile("datacrystal");

		Assert.NotNull(afterProfile?.LastUsedAt);
		if (beforeLastUsed.HasValue) {
			Assert.True(afterProfile.LastUsedAt > beforeLastUsed);
		}
	}

	#endregion

	#region Persistence Tests

	[Fact]
	public void Profiles_PersistedToDisk() {
		// Arrange - Add a custom profile
		var profile = WikiProfileManager.CreateCustomProfile("persist-test", "Persist Test", "https://persist.com");
		_manager.SaveProfile(profile);

		// Act - Create a new manager from the same directory
		var newManager = new WikiProfileManager(_tempDir);

		// Assert - The profile should still exist
		Assert.Contains("persist-test", newManager.Profiles.Keys);
		Assert.Equal("Persist Test", newManager.Profiles["persist-test"].Name);
	}

	[Fact]
	public void DefaultProfile_PersistedToDisk() {
		// Arrange
		var custom = WikiProfileManager.CreateCustomProfile("new-default", "New Default", "https://new.com");
		_manager.SaveProfile(custom);
		_manager.SetDefaultProfile("new-default");

		// Act - Create a new manager
		var newManager = new WikiProfileManager(_tempDir);

		// Assert
		Assert.Equal("new-default", newManager.DefaultProfile?.Id);
	}

	#endregion

	#region Event Tests

	[Fact]
	public void SaveProfile_RaisesProfilesChangedEvent() {
		var eventRaised = false;
		_manager.ProfilesChanged += (s, e) => eventRaised = true;

		var profile = WikiProfileManager.CreateCustomProfile("event-test", "Event Test", "https://event.com");
		_manager.SaveProfile(profile);

		Assert.True(eventRaised);
	}

	[Fact]
	public void RemoveProfile_RaisesProfilesChangedEvent() {
		var profile = WikiProfileManager.CreateCustomProfile("remove-event", "Remove Event", "https://remove.com");
		_manager.SaveProfile(profile);

		var eventRaised = false;
		_manager.ProfilesChanged += (s, e) => eventRaised = true;

		_manager.RemoveProfile("remove-event");

		Assert.True(eventRaised);
	}

	[Fact]
	public void SetDefaultProfile_RaisesProfilesChangedEvent() {
		var custom = WikiProfileManager.CreateCustomProfile("default-event", "Default Event", "https://default.com");
		_manager.SaveProfile(custom);

		var eventRaised = false;
		_manager.ProfilesChanged += (s, e) => eventRaised = true;

		_manager.SetDefaultProfile("default-event");

		Assert.True(eventRaised);
	}

	#endregion

	#region Content Policy Tests

	[Fact]
	public void DataCrystalClient_EnforcesContentPolicy() {
		// Arrange
		var client = _manager.CreateClient("datacrystal");

		// Assert
		Assert.False(client.AllowsAiContent);
		Assert.NotNull(client.AiContentWarning);
		Assert.Contains("Data Crystal", client.AiContentWarning);
	}

	[Fact]
	public void PrivateWikiClient_AllowsAiContent() {
		// Arrange
		var profile = WikiProfileManager.CreatePrivateWikiProfile("private-test", "Private", "https://private.local");
		_manager.SaveProfile(profile);

		// Act
		var client = _manager.CreateClient("private-test");

		// Assert
		Assert.True(client.AllowsAiContent);
		Assert.Null(client.AiContentWarning);
	}

	#endregion
}
