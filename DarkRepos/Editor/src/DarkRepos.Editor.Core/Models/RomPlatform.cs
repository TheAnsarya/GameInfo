namespace DarkRepos.Editor.Core.Models;

/// <summary>
/// Supported ROM platforms/consoles.
/// </summary>
public enum RomPlatform {
	/// <summary>Unknown platform.</summary>
	Unknown = 0,

	/// <summary>Nintendo Entertainment System (NES/Famicom).</summary>
	Nes = 1,

	/// <summary>Super Nintendo Entertainment System (SNES/Super Famicom).</summary>
	Snes = 2,

	/// <summary>Game Boy (original).</summary>
	GameBoy = 3,

	/// <summary>Game Boy Color.</summary>
	GameBoyColor = 4,

	/// <summary>Game Boy Advance.</summary>
	GameBoyAdvance = 5,

	/// <summary>Sega Genesis / Mega Drive.</summary>
	Genesis = 6,

	/// <summary>Sega Master System.</summary>
	MasterSystem = 7,

	/// <summary>Nintendo 64.</summary>
	Nintendo64 = 8,

	/// <summary>Nintendo DS.</summary>
	NintendoDs = 9,

	/// <summary>Sony PlayStation.</summary>
	PlayStation = 10,

	/// <summary>Atari 2600.</summary>
	Atari2600 = 11,

	/// <summary>PC Engine / TurboGrafx-16.</summary>
	PcEngine = 12,

	/// <summary>Neo Geo.</summary>
	NeoGeo = 13,

	/// <summary>MSX computer.</summary>
	Msx = 14,

	/// <summary>Commodore 64.</summary>
	Commodore64 = 15
}
