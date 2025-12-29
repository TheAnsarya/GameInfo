namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Represents a TAS (Tool-Assisted Speedrun) movie file.
/// </summary>
public interface ITasMovie {
	/// <summary>
	/// Gets the metadata for this movie.
	/// </summary>
	TasMetadata Metadata { get; }

	/// <summary>
	/// Gets all frames in this movie.
	/// </summary>
	IReadOnlyList<TasFrame> Frames { get; }

	/// <summary>
	/// Gets the system this movie is for.
	/// </summary>
	GameSystem System { get; }

	/// <summary>
	/// Gets information about controllers used in this movie.
	/// </summary>
	IReadOnlyList<ControllerInfo> Controllers { get; }

	/// <summary>
	/// Gets the raw savestate data if the movie starts from a savestate.
	/// </summary>
	byte[]? SavestateData { get; }

	/// <summary>
	/// Gets the raw SRAM data if the movie starts from SRAM.
	/// </summary>
	byte[]? SramData { get; }
}

/// <summary>
/// Concrete implementation of ITasMovie.
/// </summary>
public class TasMovie : ITasMovie {
	/// <inheritdoc />
	public TasMetadata Metadata { get; init; } = new();

	/// <inheritdoc />
	public IReadOnlyList<TasFrame> Frames { get; init; } = [];

	/// <inheritdoc />
	public GameSystem System { get; init; }

	/// <inheritdoc />
	public IReadOnlyList<ControllerInfo> Controllers { get; init; } = [];

	/// <inheritdoc />
	public byte[]? SavestateData { get; init; }

	/// <inheritdoc />
	public byte[]? SramData { get; init; }
}

/// <summary>
/// Information about a controller used in a TAS movie.
/// </summary>
public record ControllerInfo {
	/// <summary>
	/// Gets the port number (0-based).
	/// </summary>
	public int Port { get; init; }

	/// <summary>
	/// Gets the type of controller.
	/// </summary>
	public ControllerType Type { get; init; }

	/// <summary>
	/// Gets the controller ID within the port (for multitap).
	/// </summary>
	public int SubIndex { get; init; }

	/// <summary>
	/// Gets whether this controller is active/connected.
	/// </summary>
	public bool IsConnected { get; init; } = true;
}
