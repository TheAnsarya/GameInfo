namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Registry of available TAS formats.
/// </summary>
public class TasFormatRegistry {
	private readonly List<ITasFormat> _formats = [];
	private readonly object _lock = new();

	/// <summary>
	/// Gets the singleton instance of the registry.
	/// </summary>
	public static TasFormatRegistry Instance { get; } = new();

	/// <summary>
	/// Gets all registered formats.
	/// </summary>
	public IReadOnlyList<ITasFormat> Formats {
		get {
			lock (_lock) {
				return _formats.ToList();
			}
		}
	}

	/// <summary>
	/// Registers a TAS format.
	/// </summary>
	/// <param name="format">Format to register.</param>
	public void Register(ITasFormat format) {
		ArgumentNullException.ThrowIfNull(format);
		lock (_lock) {
			if (!_formats.Any(f => f.Name == format.Name)) {
				_formats.Add(format);
			}
		}
	}

	/// <summary>
	/// Unregisters a TAS format by name.
	/// </summary>
	/// <param name="name">Format name to unregister.</param>
	/// <returns>True if the format was removed.</returns>
	public bool Unregister(string name) {
		lock (_lock) {
			var format = _formats.FirstOrDefault(f => f.Name == name);
			if (format is not null) {
				_formats.Remove(format);
				return true;
			}
			return false;
		}
	}

	/// <summary>
	/// Gets a format by name.
	/// </summary>
	/// <param name="name">Format name.</param>
	/// <returns>The format, or null if not found.</returns>
	public ITasFormat? GetByName(string name) {
		lock (_lock) {
			return _formats.FirstOrDefault(f =>
				string.Equals(f.Name, name, StringComparison.OrdinalIgnoreCase));
		}
	}

	/// <summary>
	/// Gets formats by file extension.
	/// </summary>
	/// <param name="extension">File extension (with or without leading dot).</param>
	/// <returns>Matching formats.</returns>
	public IReadOnlyList<ITasFormat> GetByExtension(string extension) {
		lock (_lock) {
			return _formats.Where(f => f.MatchesExtension(extension)).ToList();
		}
	}

	/// <summary>
	/// Gets formats that support a specific game system.
	/// </summary>
	/// <param name="system">Game system.</param>
	/// <returns>Matching formats.</returns>
	public IReadOnlyList<ITasFormat> GetBySystem(GameSystem system) {
		lock (_lock) {
			return _formats.Where(f => f.SupportedSystems.Contains(system)).ToList();
		}
	}

	/// <summary>
	/// Detects the format of a file by examining its contents.
	/// </summary>
	/// <param name="filePath">Path to the file.</param>
	/// <returns>The detected format, or null if unknown.</returns>
	public ITasFormat? DetectFormat(string filePath) {
		if (!File.Exists(filePath)) return null;

		// First try by extension
		var extension = Path.GetExtension(filePath);
		var extensionMatches = GetByExtension(extension);

		using var stream = File.OpenRead(filePath);

		// Check each extension-matched format first
		foreach (var format in extensionMatches) {
			stream.Position = 0;
			if (format.CanHandle(stream)) {
				return format;
			}
		}

		// Then check all formats
		lock (_lock) {
			foreach (var format in _formats) {
				stream.Position = 0;
				if (format.CanHandle(stream)) {
					return format;
				}
			}
		}

		return null;
	}

	/// <summary>
	/// Detects the format of a stream by examining its contents.
	/// </summary>
	/// <param name="stream">Stream to examine (must be seekable).</param>
	/// <param name="extension">Optional file extension hint.</param>
	/// <returns>The detected format, or null if unknown.</returns>
	public ITasFormat? DetectFormat(Stream stream, string? extension = null) {
		if (!stream.CanSeek) {
			throw new ArgumentException("Stream must be seekable for format detection.", nameof(stream));
		}

		var startPosition = stream.Position;

		// If extension provided, check those formats first
		if (!string.IsNullOrEmpty(extension)) {
			var extensionMatches = GetByExtension(extension);
			foreach (var format in extensionMatches) {
				stream.Position = startPosition;
				if (format.CanHandle(stream)) {
					stream.Position = startPosition;
					return format;
				}
			}
		}

		// Check all formats
		lock (_lock) {
			foreach (var format in _formats) {
				stream.Position = startPosition;
				if (format.CanHandle(stream)) {
					stream.Position = startPosition;
					return format;
				}
			}
		}

		stream.Position = startPosition;
		return null;
	}

	/// <summary>
	/// Gets formats that can read files.
	/// </summary>
	public IReadOnlyList<ITasFormat> GetReadableFormats() {
		lock (_lock) {
			return _formats.Where(f => f.CanRead).ToList();
		}
	}

	/// <summary>
	/// Gets formats that can write files.
	/// </summary>
	public IReadOnlyList<ITasFormat> GetWritableFormats() {
		lock (_lock) {
			return _formats.Where(f => f.CanWrite).ToList();
		}
	}

	/// <summary>
	/// Gets formats that can convert to/from a specific format.
	/// </summary>
	/// <param name="sourceFormat">Source format.</param>
	/// <returns>Formats that support at least one common system.</returns>
	public IReadOnlyList<ITasFormat> GetCompatibleFormats(ITasFormat sourceFormat) {
		lock (_lock) {
			return _formats
				.Where(f => f != sourceFormat &&
					f.CanWrite &&
					f.SupportedSystems.Intersect(sourceFormat.SupportedSystems).Any())
				.ToList();
		}
	}
}
