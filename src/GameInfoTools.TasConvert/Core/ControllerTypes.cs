namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Types of input controllers/devices.
/// </summary>
public enum ControllerType {
	/// <summary>No controller connected.</summary>
	None = 0,

	// Standard controllers
	/// <summary>Standard gamepad/joypad.</summary>
	Gamepad,

	/// <summary>Multitap with multiple controllers.</summary>
	Multitap,

	// Mouse/pointing devices
	/// <summary>Mouse (SNES Mouse, etc.).</summary>
	Mouse,

	/// <summary>Super Scope / lightgun.</summary>
	SuperScope,

	/// <summary>Justifier lightgun.</summary>
	Justifier,

	/// <summary>NES Zapper.</summary>
	Zapper,

	// Special controllers
	/// <summary>NES Power Pad / Family Fun Fitness.</summary>
	PowerPad,

	/// <summary>NES Arkanoid Vaus controller.</summary>
	ArkanoidVaus,

	/// <summary>NES Family Keyboard.</summary>
	FamilyKeyboard,

	/// <summary>SNES Super Game Boy.</summary>
	SuperGameBoy,

	/// <summary>Satellaview.</summary>
	Satellaview,

	/// <summary>Sufami Turbo.</summary>
	SufamiTurbo,

	// Famicom-specific
	/// <summary>Famicom Disk System.</summary>
	FamicomDiskSystem,

	/// <summary>Famicom expansion port device.</summary>
	FamicomExpansion,

	// Other
	/// <summary>VS System controls.</summary>
	VsSystem,

	/// <summary>Other/custom controller type.</summary>
	Other,
}

/// <summary>
/// SNES button flags.
/// </summary>
[Flags]
public enum SnesButtons : ushort {
	/// <summary>No buttons pressed.</summary>
	None = 0,

	/// <summary>B button.</summary>
	B = 1 << 0,

	/// <summary>Y button.</summary>
	Y = 1 << 1,

	/// <summary>Select button.</summary>
	Select = 1 << 2,

	/// <summary>Start button.</summary>
	Start = 1 << 3,

	/// <summary>D-pad Up.</summary>
	Up = 1 << 4,

	/// <summary>D-pad Down.</summary>
	Down = 1 << 5,

	/// <summary>D-pad Left.</summary>
	Left = 1 << 6,

	/// <summary>D-pad Right.</summary>
	Right = 1 << 7,

	/// <summary>A button.</summary>
	A = 1 << 8,

	/// <summary>X button.</summary>
	X = 1 << 9,

	/// <summary>L shoulder button.</summary>
	L = 1 << 10,

	/// <summary>R shoulder button.</summary>
	R = 1 << 11,
}

/// <summary>
/// NES button flags.
/// </summary>
[Flags]
public enum NesButtons : byte {
	/// <summary>No buttons pressed.</summary>
	None = 0,

	/// <summary>A button.</summary>
	A = 1 << 0,

	/// <summary>B button.</summary>
	B = 1 << 1,

	/// <summary>Select button.</summary>
	Select = 1 << 2,

	/// <summary>Start button.</summary>
	Start = 1 << 3,

	/// <summary>D-pad Up.</summary>
	Up = 1 << 4,

	/// <summary>D-pad Down.</summary>
	Down = 1 << 5,

	/// <summary>D-pad Left.</summary>
	Left = 1 << 6,

	/// <summary>D-pad Right.</summary>
	Right = 1 << 7,
}

/// <summary>
/// Game Boy button flags.
/// </summary>
[Flags]
public enum GbButtons : byte {
	/// <summary>No buttons pressed.</summary>
	None = 0,

	/// <summary>A button.</summary>
	A = 1 << 0,

	/// <summary>B button.</summary>
	B = 1 << 1,

	/// <summary>Select button.</summary>
	Select = 1 << 2,

	/// <summary>Start button.</summary>
	Start = 1 << 3,

	/// <summary>D-pad Right.</summary>
	Right = 1 << 4,

	/// <summary>D-pad Left.</summary>
	Left = 1 << 5,

	/// <summary>D-pad Up.</summary>
	Up = 1 << 6,

	/// <summary>D-pad Down.</summary>
	Down = 1 << 7,
}

/// <summary>
/// Genesis/Mega Drive button flags (6-button controller).
/// </summary>
[Flags]
public enum GenesisButtons : ushort {
	/// <summary>No buttons pressed.</summary>
	None = 0,

	/// <summary>D-pad Up.</summary>
	Up = 1 << 0,

	/// <summary>D-pad Down.</summary>
	Down = 1 << 1,

	/// <summary>D-pad Left.</summary>
	Left = 1 << 2,

	/// <summary>D-pad Right.</summary>
	Right = 1 << 3,

	/// <summary>A button.</summary>
	A = 1 << 4,

	/// <summary>B button.</summary>
	B = 1 << 5,

	/// <summary>C button.</summary>
	C = 1 << 6,

	/// <summary>Start button.</summary>
	Start = 1 << 7,

	/// <summary>X button (6-button).</summary>
	X = 1 << 8,

	/// <summary>Y button (6-button).</summary>
	Y = 1 << 9,

	/// <summary>Z button (6-button).</summary>
	Z = 1 << 10,

	/// <summary>Mode button (6-button).</summary>
	Mode = 1 << 11,
}

/// <summary>
/// N64 button flags.
/// </summary>
[Flags]
public enum N64Buttons : ushort {
	/// <summary>No buttons pressed.</summary>
	None = 0,

	/// <summary>D-pad Right.</summary>
	DRight = 1 << 0,

	/// <summary>D-pad Left.</summary>
	DLeft = 1 << 1,

	/// <summary>D-pad Down.</summary>
	DDown = 1 << 2,

	/// <summary>D-pad Up.</summary>
	DUp = 1 << 3,

	/// <summary>Start button.</summary>
	Start = 1 << 4,

	/// <summary>Z trigger.</summary>
	Z = 1 << 5,

	/// <summary>B button.</summary>
	B = 1 << 6,

	/// <summary>A button.</summary>
	A = 1 << 7,

	/// <summary>C-Right button.</summary>
	CRight = 1 << 8,

	/// <summary>C-Left button.</summary>
	CLeft = 1 << 9,

	/// <summary>C-Down button.</summary>
	CDown = 1 << 10,

	/// <summary>C-Up button.</summary>
	CUp = 1 << 11,

	/// <summary>R shoulder button.</summary>
	R = 1 << 12,

	/// <summary>L shoulder button.</summary>
	L = 1 << 13,
}

/// <summary>
/// Extension methods for button types.
/// </summary>
public static class ButtonExtensions {
	/// <summary>
	/// Gets the standard display string for SNES buttons.
	/// </summary>
	public static string ToDisplayString(this SnesButtons buttons) {
		if (buttons == SnesButtons.None) return ".............";

		Span<char> chars = stackalloc char[12];
		chars[0] = buttons.HasFlag(SnesButtons.B) ? 'B' : '.';
		chars[1] = buttons.HasFlag(SnesButtons.Y) ? 'Y' : '.';
		chars[2] = buttons.HasFlag(SnesButtons.Select) ? 's' : '.';
		chars[3] = buttons.HasFlag(SnesButtons.Start) ? 'S' : '.';
		chars[4] = buttons.HasFlag(SnesButtons.Up) ? 'U' : '.';
		chars[5] = buttons.HasFlag(SnesButtons.Down) ? 'D' : '.';
		chars[6] = buttons.HasFlag(SnesButtons.Left) ? 'L' : '.';
		chars[7] = buttons.HasFlag(SnesButtons.Right) ? 'R' : '.';
		chars[8] = buttons.HasFlag(SnesButtons.A) ? 'A' : '.';
		chars[9] = buttons.HasFlag(SnesButtons.X) ? 'X' : '.';
		chars[10] = buttons.HasFlag(SnesButtons.L) ? 'l' : '.';
		chars[11] = buttons.HasFlag(SnesButtons.R) ? 'r' : '.';
		return new string(chars);
	}

	/// <summary>
	/// Gets the standard display string for NES buttons.
	/// </summary>
	public static string ToDisplayString(this NesButtons buttons) {
		if (buttons == NesButtons.None) return "........";

		Span<char> chars = stackalloc char[8];
		chars[0] = buttons.HasFlag(NesButtons.A) ? 'A' : '.';
		chars[1] = buttons.HasFlag(NesButtons.B) ? 'B' : '.';
		chars[2] = buttons.HasFlag(NesButtons.Select) ? 's' : '.';
		chars[3] = buttons.HasFlag(NesButtons.Start) ? 'S' : '.';
		chars[4] = buttons.HasFlag(NesButtons.Up) ? 'U' : '.';
		chars[5] = buttons.HasFlag(NesButtons.Down) ? 'D' : '.';
		chars[6] = buttons.HasFlag(NesButtons.Left) ? 'L' : '.';
		chars[7] = buttons.HasFlag(NesButtons.Right) ? 'R' : '.';
		return new string(chars);
	}

	/// <summary>
	/// Gets the standard display string for Game Boy buttons.
	/// </summary>
	public static string ToDisplayString(this GbButtons buttons) {
		if (buttons == GbButtons.None) return "........";

		Span<char> chars = stackalloc char[8];
		chars[0] = buttons.HasFlag(GbButtons.A) ? 'A' : '.';
		chars[1] = buttons.HasFlag(GbButtons.B) ? 'B' : '.';
		chars[2] = buttons.HasFlag(GbButtons.Select) ? 's' : '.';
		chars[3] = buttons.HasFlag(GbButtons.Start) ? 'S' : '.';
		chars[4] = buttons.HasFlag(GbButtons.Up) ? 'U' : '.';
		chars[5] = buttons.HasFlag(GbButtons.Down) ? 'D' : '.';
		chars[6] = buttons.HasFlag(GbButtons.Left) ? 'L' : '.';
		chars[7] = buttons.HasFlag(GbButtons.Right) ? 'R' : '.';
		return new string(chars);
	}
}
