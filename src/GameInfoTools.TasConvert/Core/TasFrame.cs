namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Represents a single frame of TAS input.
/// </summary>
public record TasFrame {
	/// <summary>
	/// Gets the frame number (0-based).
	/// </summary>
	public int FrameNumber { get; init; }

	/// <summary>
	/// Gets whether this frame is a lag frame.
	/// </summary>
	public bool IsLagFrame { get; init; }

	/// <summary>
	/// Gets the input for each controller this frame.
	/// </summary>
	public IReadOnlyList<ControllerInput> Inputs { get; init; } = [];

	/// <summary>
	/// Gets the commands executed this frame (reset, etc.).
	/// </summary>
	public FrameCommands Commands { get; init; }
}

/// <summary>
/// Represents input for a single controller on a single frame.
/// </summary>
public record ControllerInput {
	/// <summary>
	/// Gets the port number (0-based).
	/// </summary>
	public int Port { get; init; }

	/// <summary>
	/// Gets the raw button state as a 32-bit value.
	/// </summary>
	public uint RawButtons { get; init; }

	/// <summary>
	/// Gets the analog X position (for mouse/lightgun).
	/// </summary>
	public int? AnalogX { get; init; }

	/// <summary>
	/// Gets the analog Y position (for mouse/lightgun).
	/// </summary>
	public int? AnalogY { get; init; }

	/// <summary>
	/// Gets additional data specific to the input device.
	/// </summary>
	public byte[]? ExtraData { get; init; }
}

/// <summary>
/// Commands that can be executed on a frame.
/// </summary>
[Flags]
public enum FrameCommands {
	/// <summary>No commands.</summary>
	None = 0,

	/// <summary>Soft reset (NES/SNES).</summary>
	SoftReset = 1 << 0,

	/// <summary>Hard reset / power cycle.</summary>
	HardReset = 1 << 1,

	/// <summary>FDS disk insert.</summary>
	FdsDiskInsert = 1 << 2,

	/// <summary>FDS disk select/side change.</summary>
	FdsDiskSelect = 1 << 3,

	/// <summary>VS System coin insert.</summary>
	VsInsertCoin = 1 << 4,
}
