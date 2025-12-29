using GameInfoTools.TasConvert.Core;
using GameInfoTools.TasConvert.Formats;
using GameInfoTools.TasConvert.Formats.Snes;

namespace GameInfoTools.TasConvert.Tests;

/// <summary>
/// Integration tests using real TAS files from TASVideos.org.
/// Files are stored in ~tas-files/uncompressed/ (gitignored).
/// Tests are skipped if files aren't present.
/// </summary>
public class RealFileIntegrationTests {
	// Path to uncompressed TAS files (relative to repo root)
	private static readonly string TasFilesPath = FindTasFilesPath();

	private static string FindTasFilesPath() {
		// Search upward from test assembly location to find ~tas-files
		var directory = AppContext.BaseDirectory;

		for (int i = 0; i < 10; i++) {
			var tasPath = Path.Combine(directory, "~tas-files", "uncompressed");
			if (Directory.Exists(tasPath)) {
				return tasPath;
			}

			var parent = Directory.GetParent(directory);
			if (parent is null) {
				break;
			}

			directory = parent.FullName;
		}

		// Fallback: try repo root directly
		var repoRoot = Path.GetFullPath(Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "..", ".."));
		return Path.Combine(repoRoot, "~tas-files", "uncompressed");
	}

	private static string? GetTasFile(string filename) {
		var fullPath = Path.Combine(TasFilesPath, filename);
		return File.Exists(fullPath) ? fullPath : null;
	}

	#region SMV Format Tests

	[SkippableFact(Timeout = 10000)]
	public async Task SmvFormat_ArdyLightfoot_ParsesCorrectly() {
		var filePath = GetTasFile("ferretwarlord-ardylightfoot.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new SmvFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.Equal(71816, movie.Frames.Count);
		Assert.True(movie.Controllers.Count >= 1);
		Assert.True(movie.Metadata.RerecordCount > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task SmvFormat_Aladdin_ParsesCorrectly() {
		var filePath = GetTasFile("jaysmad3-aladdin.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new SmvFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.Equal(55723, movie.Frames.Count);
		Assert.True(movie.Controllers.Count >= 1);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task SmvFormat_Bubsy2_ParsesCorrectly() {
		var filePath = GetTasFile("bubsy2-acmlm.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new SmvFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
		Assert.True(movie.Controllers.Count >= 1);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task SmvFormat_GoofTroop_ParsesCorrectly() {
		var filePath = GetTasFile("randil,mmbossman-gooftroop.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new SmvFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
		// Goof Troop is 2-player - verify controller count
		Assert.True(movie.Controllers.Count >= 1);
	}

	[SkippableFact(Timeout = 30000)]
	public async Task SmvFormat_ChronoTrigger_ParsesCorrectly() {
		var filePath = GetTasFile("saturn-chronotrigger-alltechmaxequip.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new SmvFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
		// Long movie - verify it parsed
		Assert.True(movie.Metadata.RerecordCount > 0);
	}

	[SkippableFact(Timeout = 30000)]
	public async Task SmvFormat_SecretOfMana_ParsesCorrectly() {
		var filePath = GetTasFile("touchme1-secretofmana.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new SmvFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	#endregion

	#region BK2 Format Tests

	[SkippableFact(Timeout = 60000)]
	public async Task Bk2Format_ChronoTrigger_ParsesCorrectly() {
		var filePath = GetTasFile("arandomgametaser_keylie-chronotrigger.bk2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Bk2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.Equal(490911, movie.Frames.Count);
		Assert.True(movie.Controllers.Count >= 1);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Bk2Format_DonkeyKongCountry101_ParsesCorrectly() {
		var filePath = GetTasFile("tompa-donkeykongcountry-101p.bk2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Bk2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Bk2Format_DonkeyKongCountry_ParsesCorrectly() {
		var filePath = GetTasFile("hidaigai,tompa-donkeykongcountry.bk2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Bk2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Bk2Format_DonkeyKongCountry3_ParsesCorrectly() {
		var filePath = GetTasFile("doomsday31415,des-donkeykongcountry3dkdtj.bk2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Bk2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 30000)]
	public async Task Bk2Format_EarthBound_ParsesCorrectly() {
		var filePath = GetTasFile("illayaya-earthbound.bk2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Bk2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Bk2Format_SecretOfManaGlitched_ParsesCorrectly() {
		var filePath = GetTasFile("hhs-secretofmana-glitched.bk2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Bk2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Snes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	#endregion

	#region Roundtrip Tests

	[SkippableFact(Timeout = 10000)]
	public async Task SmvFormat_Roundtrip_PreservesData() {
		var filePath = GetTasFile("bubsy2-acmlm.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new SmvFormat();

		// Read original
		ITasMovie original;
		using (var stream = File.OpenRead(filePath)) {
			original = await format.ReadAsync(stream);
		}

		// Write to memory
		using var outputStream = new MemoryStream();
		await format.WriteAsync(original, outputStream);

		// Read back
		outputStream.Position = 0;
		var roundtripped = await format.ReadAsync(outputStream);

		// Verify key properties match
		Assert.Equal(original.Frames.Count, roundtripped.Frames.Count);
		Assert.Equal(original.Controllers.Count, roundtripped.Controllers.Count);
		Assert.Equal(original.System, roundtripped.System);
	}

	#endregion
}
