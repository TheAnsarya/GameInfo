using GameInfoTools.Audio.Spc;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class MusicModBundleTests {
	[Fact]
	public void Create_SetsBasicMetadata() {
		var bundle = MusicModBundle.Create("My Music Mod", "TestAuthor");

		Assert.Equal("My Music Mod", bundle.Manifest.Title);
		Assert.Equal("TestAuthor", bundle.Manifest.Author);
		Assert.Equal("1.0.0", bundle.Manifest.BundleVersion);
		Assert.True(bundle.Manifest.CreatedDate <= DateTime.UtcNow);
	}

	[Fact]
	public void SaveAndLoad_RoundTripsCorrectly() {
		// Arrange
		var bundle = MusicModBundle.Create("Test Mod", "Test Author");
		bundle.Manifest.Description = "A test mod";
		bundle.Manifest.GameTitle = "Test Game";
		bundle.Manifest.OriginalTrack = "Boss Battle";
		bundle.ModifiedSpc = CreateMinimalSpcData();
		bundle.OriginalSpc = CreateMinimalSpcData();

		using var stream = new MemoryStream();

		// Act
		bundle.Save(stream);
		stream.Position = 0;
		var loaded = MusicModBundle.Load(stream);

		// Assert
		Assert.Equal("Test Mod", loaded.Manifest.Title);
		Assert.Equal("Test Author", loaded.Manifest.Author);
		Assert.Equal("A test mod", loaded.Manifest.Description);
		Assert.Equal("Test Game", loaded.Manifest.GameTitle);
		Assert.Equal("Boss Battle", loaded.Manifest.OriginalTrack);
		Assert.NotNull(loaded.ModifiedSpc);
		Assert.NotNull(loaded.OriginalSpc);
	}

	[Fact]
	public void AddFile_IncludesInBundle() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.ModifiedSpc = CreateMinimalSpcData();
		bundle.AddFile("samples/kick.brr", [0x01, 0x02, 0x03], "Kick drum sample");

		using var stream = new MemoryStream();
		bundle.Save(stream);
		stream.Position = 0;

		var loaded = MusicModBundle.Load(stream);

		Assert.Contains("samples/kick.brr", loaded.AdditionalFiles.Keys);
		Assert.Equal([0x01, 0x02, 0x03], loaded.AdditionalFiles["samples/kick.brr"]);
	}

	[Fact]
	public void SetReadme_IncludesReadmeFile() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.ModifiedSpc = CreateMinimalSpcData();
		bundle.SetReadme("# My Mod\n\nThis is a test mod.");

		using var stream = new MemoryStream();
		bundle.Save(stream);
		stream.Position = 0;

		var loaded = MusicModBundle.Load(stream);

		Assert.Equal("# My Mod\n\nThis is a test mod.", loaded.Manifest.Readme);
	}

	[Fact]
	public void Validate_MissingTitle_ReturnsError() {
		var bundle = new MusicModBundle();
		bundle.Manifest.Author = "Author";
		bundle.ModifiedSpc = CreateMinimalSpcData();

		var result = bundle.Validate();

		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Contains("title"));
	}

	[Fact]
	public void Validate_MissingAuthor_ReturnsError() {
		var bundle = new MusicModBundle();
		bundle.Manifest.Title = "Title";
		bundle.ModifiedSpc = CreateMinimalSpcData();

		var result = bundle.Validate();

		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Contains("author"));
	}

	[Fact]
	public void Validate_MissingModifiedSpc_ReturnsError() {
		var bundle = MusicModBundle.Create("Test", "Author");

		var result = bundle.Validate();

		Assert.False(result.IsValid);
		Assert.Contains(result.Errors, e => e.Contains("modified SPC"));
	}

	[Fact]
	public void Validate_MissingOriginalSpc_ReturnsWarning() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.ModifiedSpc = CreateMinimalSpcData();

		var result = bundle.Validate();

		Assert.True(result.IsValid); // Still valid, just a warning
		Assert.Contains(result.Warnings, w => w.Contains("Original SPC"));
	}

	[Fact]
	public void Validate_CompleteBundle_ReturnsValid() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.Manifest.Description = "Description";
		bundle.ModifiedSpc = CreateMinimalSpcData();
		bundle.OriginalSpc = CreateMinimalSpcData();
		bundle.SetReadme("# README");

		var result = bundle.Validate();

		Assert.True(result.IsValid);
		Assert.Empty(result.Errors);
		Assert.Empty(result.Warnings);
	}

	[Fact]
	public void GetSummary_IncludesAllInfo() {
		var bundle = MusicModBundle.Create("Epic Boss Theme", "Composer");
		bundle.Manifest.Description = "An epic boss battle theme";
		bundle.Manifest.GameTitle = "Final Fantasy VI";
		bundle.Manifest.OriginalTrack = "Dancing Mad";
		bundle.ModifiedSpc = CreateMinimalSpcData();
		bundle.OriginalSpc = CreateMinimalSpcData();

		var summary = bundle.GetSummary();

		Assert.Contains("Epic Boss Theme", summary);
		Assert.Contains("Composer", summary);
		Assert.Contains("Final Fantasy VI", summary);
		Assert.Contains("Dancing Mad", summary);
		Assert.Contains("Modified SPC:", summary);
	}

	[Fact]
	public void FluentApi_ChainsCorrectly() {
		var spcData = CreateMinimalSpcData();

		var bundle = MusicModBundle.Create("Test", "Author")
			.SetReadme("# Test")
			.AddFile("extra.txt", [0x00], "Extra file");

		bundle.ModifiedSpc = spcData;
		bundle.OriginalSpc = spcData;

		Assert.Equal("# Test", bundle.Manifest.Readme);
		Assert.Single(bundle.AdditionalFiles);
	}

	[Fact]
	public void Manifest_Tags_CanBeAdded() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.Manifest.Tags.Add("boss");
		bundle.Manifest.Tags.Add("epic");
		bundle.Manifest.Tags.Add("orchestral");

		Assert.Equal(3, bundle.Manifest.Tags.Count);
		Assert.Contains("boss", bundle.Manifest.Tags);
	}

	[Fact]
	public void Manifest_Credits_CanBeAdded() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.Manifest.Credits.Add(new Credit {
			Name = "Sample Pack Creator",
			Role = "Samples",
			Url = "https://example.com"
		});

		Assert.Single(bundle.Manifest.Credits);
		Assert.Equal("Sample Pack Creator", bundle.Manifest.Credits[0].Name);
	}

	[Fact]
	public void Manifest_Compatibility_CanBeSet() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.Manifest.Compatibility = new CompatibilityInfo {
			RomHash = "ABC123",
			RomTitle = "Final Fantasy VI (USA)",
			InjectionOffset = 0x300000,
			TrackId = 42
		};

		Assert.Equal("ABC123", bundle.Manifest.Compatibility.RomHash);
		Assert.Equal(42, bundle.Manifest.Compatibility.TrackId);
	}

	[Fact]
	public void ValidationResult_ToString_FormatsCorrectly() {
		var bundle = new MusicModBundle();
		var result = bundle.Validate();
		var output = result.ToString();

		Assert.Contains("Invalid", output);
		Assert.Contains("ERROR", output);
	}

	[Fact]
	public void Save_CreatesValidZipArchive() {
		var bundle = MusicModBundle.Create("Test", "Author");
		bundle.ModifiedSpc = CreateMinimalSpcData();

		using var stream = new MemoryStream();
		bundle.Save(stream);
		stream.Position = 0;

		// Verify it's a valid ZIP
		using var archive = new System.IO.Compression.ZipArchive(stream, System.IO.Compression.ZipArchiveMode.Read);

		Assert.NotNull(archive.GetEntry("manifest.json"));
		Assert.NotNull(archive.GetEntry("modified.spc"));
	}

	private static byte[] CreateMinimalSpcData() {
		// Create minimal valid SPC data
		var data = new byte[SpcFile.MinFileSize];

		// Signature
		var sig = "SNES-SPC700 Sound File Data v0.30";
		System.Text.Encoding.ASCII.GetBytes(sig).CopyTo(data.AsSpan());

		// Version
		data[0x21] = 0x1a;
		data[0x22] = 0x1a;
		data[0x23] = 0x1a; // Has ID666

		return data;
	}
}

public class BundleManifestTests {
	[Fact]
	public void DefaultValues_AreCorrect() {
		var manifest = new BundleManifest();

		Assert.Equal("", manifest.Title);
		Assert.Equal("", manifest.Author);
		Assert.Equal("1.0.0", manifest.BundleVersion);
		Assert.Empty(manifest.Tags);
		Assert.Empty(manifest.Credits);
		Assert.Empty(manifest.AdditionalFiles);
	}

	[Fact]
	public void Serialization_RoundTrips() {
		var manifest = new BundleManifest {
			Title = "Test",
			Author = "Author",
			Description = "Description",
			Tags = ["tag1", "tag2"]
		};

		var json = System.Text.Json.JsonSerializer.Serialize(manifest);
		var deserialized = System.Text.Json.JsonSerializer.Deserialize<BundleManifest>(json);

		Assert.NotNull(deserialized);
		Assert.Equal("Test", deserialized.Title);
		Assert.Equal(2, deserialized.Tags.Count);
	}
}
