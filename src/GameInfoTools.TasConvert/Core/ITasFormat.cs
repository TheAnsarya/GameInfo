namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Interface for TAS format readers/writers.
/// </summary>
public interface ITasFormat {
	/// <summary>
	/// Gets the format name (e.g., "SMV", "FM2", "LSMV").
	/// </summary>
	string Name { get; }

	/// <summary>
	/// Gets the format description.
	/// </summary>
	string Description { get; }

	/// <summary>
	/// Gets the emulator name associated with this format.
	/// </summary>
	string EmulatorName { get; }

	/// <summary>
	/// Gets the file extensions supported by this format.
	/// </summary>
	IReadOnlyList<string> Extensions { get; }

	/// <summary>
	/// Gets the systems supported by this format.
	/// </summary>
	IReadOnlyList<GameSystem> SupportedSystems { get; }

	/// <summary>
	/// Gets whether this format can be read.
	/// </summary>
	bool CanRead { get; }

	/// <summary>
	/// Gets whether this format can be written.
	/// </summary>
	bool CanWrite { get; }

	/// <summary>
	/// Checks if the given file is likely in this format.
	/// </summary>
	/// <param name="stream">Stream to check.</param>
	/// <returns>True if the file appears to be in this format.</returns>
	bool CanHandle(Stream stream);

	/// <summary>
	/// Checks if the given file extension matches this format.
	/// </summary>
	/// <param name="extension">File extension (with or without leading dot).</param>
	/// <returns>True if the extension matches.</returns>
	bool MatchesExtension(string extension);

	/// <summary>
	/// Reads a TAS movie from a stream.
	/// </summary>
	/// <param name="stream">Stream to read from.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	/// <returns>The parsed TAS movie.</returns>
	Task<ITasMovie> ReadAsync(Stream stream, CancellationToken cancellationToken = default);

	/// <summary>
	/// Writes a TAS movie to a stream.
	/// </summary>
	/// <param name="movie">Movie to write.</param>
	/// <param name="stream">Stream to write to.</param>
	/// <param name="cancellationToken">Cancellation token.</param>
	Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken cancellationToken = default);
}

/// <summary>
/// Base class for TAS format implementations.
/// </summary>
public abstract class TasFormatBase : ITasFormat {
	/// <inheritdoc/>
	public abstract string Name { get; }

	/// <inheritdoc/>
	public abstract string Description { get; }

	/// <inheritdoc/>
	public abstract string EmulatorName { get; }

	/// <inheritdoc/>
	public abstract IReadOnlyList<string> Extensions { get; }

	/// <inheritdoc/>
	public abstract IReadOnlyList<GameSystem> SupportedSystems { get; }

	/// <inheritdoc/>
	public virtual bool CanRead => true;

	/// <inheritdoc/>
	public virtual bool CanWrite => true;

	/// <inheritdoc/>
	public abstract bool CanHandle(Stream stream);

	/// <inheritdoc/>
	public bool MatchesExtension(string extension) {
		if (string.IsNullOrEmpty(extension)) return false;

		var ext = extension.StartsWith('.') ? extension[1..] : extension;
		return Extensions.Any(e => string.Equals(e, ext, StringComparison.OrdinalIgnoreCase));
	}

	/// <inheritdoc/>
	public abstract Task<ITasMovie> ReadAsync(Stream stream, CancellationToken cancellationToken = default);

	/// <inheritdoc/>
	public abstract Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken cancellationToken = default);

	/// <summary>
	/// Reads a 16-bit little-endian integer from a stream.
	/// </summary>
	protected static ushort ReadUInt16LE(Stream stream) {
		Span<byte> buffer = stackalloc byte[2];
		stream.ReadExactly(buffer);
		return BitConverter.ToUInt16(buffer);
	}

	/// <summary>
	/// Reads a 32-bit little-endian integer from a stream.
	/// </summary>
	protected static uint ReadUInt32LE(Stream stream) {
		Span<byte> buffer = stackalloc byte[4];
		stream.ReadExactly(buffer);
		return BitConverter.ToUInt32(buffer);
	}

	/// <summary>
	/// Reads a 64-bit little-endian integer from a stream.
	/// </summary>
	protected static ulong ReadUInt64LE(Stream stream) {
		Span<byte> buffer = stackalloc byte[8];
		stream.ReadExactly(buffer);
		return BitConverter.ToUInt64(buffer);
	}

	/// <summary>
	/// Writes a 16-bit little-endian integer to a stream.
	/// </summary>
	protected static void WriteUInt16LE(Stream stream, ushort value) {
		Span<byte> buffer = stackalloc byte[2];
		BitConverter.TryWriteBytes(buffer, value);
		stream.Write(buffer);
	}

	/// <summary>
	/// Writes a 32-bit little-endian integer to a stream.
	/// </summary>
	protected static void WriteUInt32LE(Stream stream, uint value) {
		Span<byte> buffer = stackalloc byte[4];
		BitConverter.TryWriteBytes(buffer, value);
		stream.Write(buffer);
	}

	/// <summary>
	/// Writes a 64-bit little-endian integer to a stream.
	/// </summary>
	protected static void WriteUInt64LE(Stream stream, ulong value) {
		Span<byte> buffer = stackalloc byte[8];
		BitConverter.TryWriteBytes(buffer, value);
		stream.Write(buffer);
	}

	/// <summary>
	/// Reads a null-terminated ASCII string from a stream.
	/// </summary>
	protected static string ReadNullTerminatedString(Stream stream, int maxLength) {
		Span<byte> buffer = stackalloc byte[maxLength];
		stream.ReadExactly(buffer);
		var nullIndex = buffer.IndexOf((byte)0);
		return System.Text.Encoding.ASCII.GetString(buffer[..(nullIndex >= 0 ? nullIndex : maxLength)]);
	}
}
