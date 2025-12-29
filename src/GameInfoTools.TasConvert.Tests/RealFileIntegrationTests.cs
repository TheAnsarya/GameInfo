using GameInfoTools.TasConvert.Core;
using GameInfoTools.TasConvert.Formats;
using GameInfoTools.TasConvert.Formats.GameBoy;
using GameInfoTools.TasConvert.Formats.Nes;
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

	#region FM2 Format Tests (NES)

	[SkippableFact(Timeout = 10000)]
	public async Task Fm2Format_DragonWarrior3_ParsesCorrectly() {
		var filePath = GetTasFile("vaxherd-dragonwarrior3.fm2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Fm2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Nes, movie.System);
		Assert.True(movie.Frames.Count > 0, "Movie should have frames");
		Assert.True(movie.Controllers.Count >= 1, "Should have at least 1 controller");
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Fm2Format_DarkwingDuck_ParsesCorrectly() {
		var filePath = GetTasFile("feos-darkwingduck-pacifist.fm2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Fm2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Nes, movie.System);
		Assert.True(movie.Frames.Count > 0);
		// Pacifist run - should have substantial frame count
		Assert.True(movie.Frames.Count > 1000);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Fm2Format_SuperContra_ParsesCorrectly() {
		var filePath = GetTasFile("marx-supercontra7.fm2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Fm2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Nes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Fm2Format_NorthAndSouth_ParsesCorrectly() {
		var filePath = GetTasFile("chamale-northandsouth.fm2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Fm2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Nes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Fm2Format_JurassicPark_ParsesCorrectly() {
		var filePath = GetTasFile("meshuggah-jurassicparktlw.fm2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Fm2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Nes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Fm2Format_Goonies2_ParsesCorrectly() {
		var filePath = GetTasFile("mcbobx-goonies2.fm2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Fm2Format();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		Assert.Equal(GameSystem.Nes, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task Fm2Format_Roundtrip_PreservesData() {
		var filePath = GetTasFile("feos-darkwingduck-pacifist.fm2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new Fm2Format();

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

	#region VBM Format Tests (Game Boy)

	[SkippableFact(Timeout = 10000)]
	public async Task VbmFormat_ZeldaLinksAwakening_ParsesCorrectly() {
		var filePath = GetTasFile("bobmario2-zeldala.vbm");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new VbmFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		// Link's Awakening is Game Boy (or GBC depending on version)
		Assert.True(
			movie.System is GameSystem.GameBoy or GameSystem.GameBoyColor,
			$"Expected GB/GBC, got {movie.System}");
		Assert.True(movie.Frames.Count > 0, "Movie should have frames");
		Assert.True(movie.Controllers.Count >= 1, "Should have at least 1 controller");
	}

	[SkippableFact(Timeout = 10000)]
	public async Task VbmFormat_MegaManZero_ParsesCorrectly() {
		var filePath = GetTasFile("rolanmen1-megamanzero.vbm");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new VbmFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		// Mega Man Zero is GBA
		Assert.Equal(GameSystem.GameBoyAdvance, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task VbmFormat_FinalFantasyAdventure_ParsesCorrectly() {
		var filePath = GetTasFile("atomnium-finalfantasyadventure.vbm");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new VbmFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		// Final Fantasy Adventure is original Game Boy
		Assert.True(
			movie.System is GameSystem.GameBoy or GameSystem.GameBoyColor,
			$"Expected GB/GBC, got {movie.System}");
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task VbmFormat_SonicAdvance_ParsesCorrectly() {
		var filePath = GetTasFile("mukki-sonicadvance.vbm");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new VbmFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		// Sonic Advance is GBA
		Assert.Equal(GameSystem.GameBoyAdvance, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task VbmFormat_FireEmblem_ParsesCorrectly() {
		var filePath = GetTasFile("vykan12-v2-fesacredstones.vbm");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new VbmFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		// Fire Emblem: Sacred Stones is GBA
		Assert.Equal(GameSystem.GameBoyAdvance, movie.System);
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task VbmFormat_BubbleGhost_ParsesCorrectly() {
		var filePath = GetTasFile("mugg-bubbleghost.vbm");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new VbmFormat();
		using var stream = File.OpenRead(filePath);

		var movie = await format.ReadAsync(stream);

		// Bubble Ghost is original Game Boy
		Assert.True(
			movie.System is GameSystem.GameBoy or GameSystem.GameBoyColor,
			$"Expected GB/GBC, got {movie.System}");
		Assert.True(movie.Frames.Count > 0);
	}

	[SkippableFact(Timeout = 10000)]
	public async Task VbmFormat_Roundtrip_PreservesData() {
		var filePath = GetTasFile("mugg-bubbleghost.vbm");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var format = new VbmFormat();

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

	#region Cross-Format Conversion Tests

	[SkippableFact(Timeout = 30000)]
	public async Task Conversion_SmvToBk2_PreservesFrames() {
		var filePath = GetTasFile("ferretwarlord-ardylightfoot.smv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var smvFormat = new SmvFormat();
		var bk2Format = new Bk2Format();

		// Read SMV
		ITasMovie original;
		using (var stream = File.OpenRead(filePath)) {
			original = await smvFormat.ReadAsync(stream);
		}

		// Convert to BK2
		using var bk2Stream = new MemoryStream();
		await bk2Format.WriteAsync(original, bk2Stream);

		// Read back as BK2
		bk2Stream.Position = 0;
		var converted = await bk2Format.ReadAsync(bk2Stream);

		// Verify frames match
		Assert.Equal(original.Frames.Count, converted.Frames.Count);
		Assert.Equal(original.System, converted.System);

		// Spot check some frames
		for (int i = 0; i < Math.Min(100, original.Frames.Count); i++) {
			var origFrame = original.Frames[i];
			var convFrame = converted.Frames[i];
			Assert.Equal(origFrame.Inputs[0].RawButtons, convFrame.Inputs[0].RawButtons);
		}
	}

	[SkippableFact(Timeout = 30000)]
	public async Task Conversion_Bk2ToSmv_PreservesFrames() {
		var filePath = GetTasFile("tompa-donkeykongcountry-101p.bk2");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var bk2Format = new Bk2Format();
		var smvFormat = new SmvFormat();

		// Read BK2
		ITasMovie original;
		using (var stream = File.OpenRead(filePath)) {
			original = await bk2Format.ReadAsync(stream);
		}

		// Convert to SMV
		using var smvStream = new MemoryStream();
		await smvFormat.WriteAsync(original, smvStream);

		// Read back as SMV
		smvStream.Position = 0;
		var converted = await smvFormat.ReadAsync(smvStream);

		// Verify frames match
		Assert.Equal(original.Frames.Count, converted.Frames.Count);
		Assert.Equal(original.System, converted.System);
	}

	[SkippableFact(Timeout = 60000)]
	public async Task Conversion_LsmvToBk2_PreservesFrames() {
		var filePath = GetTasFile("xy2_-earthbound.lsmv");
		Skip.If(filePath is null, "TAS file not available - run 'download TAS files' task first");

		var lsmvFormat = new LsmvFormat();
		var bk2Format = new Bk2Format();

		// Read LSMV
		ITasMovie original;
		using (var stream = File.OpenRead(filePath)) {
			original = await lsmvFormat.ReadAsync(stream);
		}

		// Convert to BK2
		using var bk2Stream = new MemoryStream();
		await bk2Format.WriteAsync(original, bk2Stream);

		// Read back as BK2
		bk2Stream.Position = 0;
		var converted = await bk2Format.ReadAsync(bk2Stream);

		// Verify frames match
		Assert.Equal(original.Frames.Count, converted.Frames.Count);
		Assert.Equal(original.System, converted.System);
	}

	#endregion
}
