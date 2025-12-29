namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Supported game systems for TAS movies.
/// </summary>
public enum GameSystem {
	/// <summary>Unknown or unsupported system.</summary>
	Unknown = 0,

	// Nintendo consoles
	/// <summary>Nintendo Entertainment System / Famicom.</summary>
	Nes,

	/// <summary>Super Nintendo / Super Famicom.</summary>
	Snes,

	/// <summary>Nintendo 64.</summary>
	N64,

	/// <summary>Nintendo GameCube.</summary>
	GameCube,

	/// <summary>Nintendo Wii.</summary>
	Wii,

	// Nintendo handhelds
	/// <summary>Game Boy (original).</summary>
	GameBoy,

	/// <summary>Game Boy Color.</summary>
	GameBoyColor,

	/// <summary>Game Boy Advance.</summary>
	GameBoyAdvance,

	/// <summary>Nintendo DS.</summary>
	NintendoDs,

	// Sega consoles
	/// <summary>Sega Master System.</summary>
	MasterSystem,

	/// <summary>Sega Genesis / Mega Drive.</summary>
	Genesis,

	/// <summary>Sega CD / Mega CD.</summary>
	SegaCd,

	/// <summary>Sega Saturn.</summary>
	Saturn,

	/// <summary>Sega Dreamcast.</summary>
	Dreamcast,

	/// <summary>Sega Game Gear.</summary>
	GameGear,

	// Sony consoles
	/// <summary>PlayStation.</summary>
	PlayStation,

	/// <summary>PlayStation 2.</summary>
	PlayStation2,

	/// <summary>PlayStation Portable.</summary>
	Psp,

	// Other systems
	/// <summary>Atari 2600.</summary>
	Atari2600,

	/// <summary>Atari 7800.</summary>
	Atari7800,

	/// <summary>TurboGrafx-16 / PC Engine.</summary>
	TurboGrafx16,

	/// <summary>Neo Geo.</summary>
	NeoGeo,

	/// <summary>Arcade (various).</summary>
	Arcade,

	/// <summary>MSX.</summary>
	Msx,

	/// <summary>Commodore 64.</summary>
	Commodore64,

	/// <summary>ZX Spectrum.</summary>
	ZxSpectrum,

	/// <summary>DOS.</summary>
	Dos,
}

/// <summary>
/// Extension methods for GameSystem.
/// </summary>
public static class GameSystemExtensions {
	/// <summary>
	/// Gets the standard frame rate for a system and region.
	/// </summary>
	public static double GetFrameRate(this GameSystem system, GameRegion region) {
		return (system, region) switch {
			// NES frame rates
			(GameSystem.Nes, GameRegion.Ntsc or GameRegion.Japan) => 60.0988,
			(GameSystem.Nes, GameRegion.Pal) => 50.0070,

			// SNES frame rates
			(GameSystem.Snes, GameRegion.Ntsc or GameRegion.Japan) => 60.0988,
			(GameSystem.Snes, GameRegion.Pal) => 50.0070,

			// Game Boy (all regions run at same speed)
			(GameSystem.GameBoy, _) => 59.7275,
			(GameSystem.GameBoyColor, _) => 59.7275,
			(GameSystem.GameBoyAdvance, _) => 59.7275,

			// Genesis/Mega Drive
			(GameSystem.Genesis, GameRegion.Ntsc or GameRegion.Japan) => 59.9228,
			(GameSystem.Genesis, GameRegion.Pal) => 49.7014,

			// N64
			(GameSystem.N64, GameRegion.Ntsc or GameRegion.Japan) => 60.0,
			(GameSystem.N64, GameRegion.Pal) => 50.0,

			// Default to NTSC 60fps
			_ => 60.0,
		};
	}

	/// <summary>
	/// Gets a friendly display name for the system.
	/// </summary>
	public static string GetDisplayName(this GameSystem system) {
		return system switch {
			GameSystem.Nes => "NES",
			GameSystem.Snes => "SNES",
			GameSystem.N64 => "Nintendo 64",
			GameSystem.GameCube => "GameCube",
			GameSystem.Wii => "Wii",
			GameSystem.GameBoy => "Game Boy",
			GameSystem.GameBoyColor => "Game Boy Color",
			GameSystem.GameBoyAdvance => "Game Boy Advance",
			GameSystem.NintendoDs => "Nintendo DS",
			GameSystem.MasterSystem => "Master System",
			GameSystem.Genesis => "Genesis",
			GameSystem.SegaCd => "Sega CD",
			GameSystem.Saturn => "Saturn",
			GameSystem.Dreamcast => "Dreamcast",
			GameSystem.GameGear => "Game Gear",
			GameSystem.PlayStation => "PlayStation",
			GameSystem.PlayStation2 => "PlayStation 2",
			GameSystem.Psp => "PSP",
			GameSystem.Atari2600 => "Atari 2600",
			GameSystem.Atari7800 => "Atari 7800",
			GameSystem.TurboGrafx16 => "TurboGrafx-16",
			GameSystem.NeoGeo => "Neo Geo",
			GameSystem.Arcade => "Arcade",
			GameSystem.Msx => "MSX",
			GameSystem.Commodore64 => "Commodore 64",
			GameSystem.ZxSpectrum => "ZX Spectrum",
			GameSystem.Dos => "DOS",
			_ => system.ToString(),
		};
	}
}
