using System.Collections.Concurrent;
using System.Diagnostics;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Core;

/// <summary>
/// Service for runtime logging and debugging.
/// Provides structured logging with filtering, formatting, and output targets.
/// </summary>
public class DebugLogger : IDisposable {
	private readonly ConcurrentQueue<LogEntry> _entries = new();
	private readonly List<ILogTarget> _targets = [];
	private readonly object _targetsLock = new();
	private readonly Stopwatch _sessionTimer = Stopwatch.StartNew();

	private LogLevel _minimumLevel = LogLevel.Debug;
	private int _maxBufferSize = 10000;
	private bool _disposed;
	private string _sessionId = Guid.NewGuid().ToString("N")[..8];

	/// <summary>
	/// Current session ID.
	/// </summary>
	public string SessionId => _sessionId;

	/// <summary>
	/// Session elapsed time.
	/// </summary>
	public TimeSpan SessionElapsed => _sessionTimer.Elapsed;

	/// <summary>
	/// Minimum log level to record.
	/// </summary>
	public LogLevel MinimumLevel {
		get => _minimumLevel;
		set => _minimumLevel = value;
	}

	/// <summary>
	/// Maximum entries to buffer.
	/// </summary>
	public int MaxBufferSize {
		get => _maxBufferSize;
		set => _maxBufferSize = Math.Max(100, value);
	}

	/// <summary>
	/// All buffered log entries.
	/// </summary>
	public IReadOnlyCollection<LogEntry> Entries => _entries.ToArray();

	/// <summary>
	/// Entry count.
	/// </summary>
	public int EntryCount => _entries.Count;

	#region Log Methods

	/// <summary>
	/// Log a message at the specified level.
	/// </summary>
	public void Log(LogLevel level, string message, string? category = null, object? data = null) {
		if (level < _minimumLevel) return;

		var entry = new LogEntry {
			Timestamp = DateTime.UtcNow,
			SessionTime = _sessionTimer.Elapsed,
			Level = level,
			Category = category ?? "General",
			Message = message,
			Data = data,
			ThreadId = Environment.CurrentManagedThreadId
		};

		AddEntry(entry);
	}

	/// <summary>
	/// Log a debug message.
	/// </summary>
	public void Debug(string message, string? category = null, object? data = null) {
		Log(LogLevel.Debug, message, category, data);
	}

	/// <summary>
	/// Log an info message.
	/// </summary>
	public void Info(string message, string? category = null, object? data = null) {
		Log(LogLevel.Info, message, category, data);
	}

	/// <summary>
	/// Log a warning message.
	/// </summary>
	public void Warn(string message, string? category = null, object? data = null) {
		Log(LogLevel.Warning, message, category, data);
	}

	/// <summary>
	/// Log an error message.
	/// </summary>
	public void Error(string message, string? category = null, object? data = null) {
		Log(LogLevel.Error, message, category, data);
	}

	/// <summary>
	/// Log an exception.
	/// </summary>
	public void Error(Exception exception, string? message = null, string? category = null) {
		var fullMessage = message != null
			? $"{message}: {exception.Message}"
			: exception.Message;

		Log(LogLevel.Error, fullMessage, category, new {
			ExceptionType = exception.GetType().Name,
			exception.StackTrace,
			InnerException = exception.InnerException?.Message
		});
	}

	/// <summary>
	/// Log a critical/fatal message.
	/// </summary>
	public void Critical(string message, string? category = null, object? data = null) {
		Log(LogLevel.Critical, message, category, data);
	}

	/// <summary>
	/// Log a trace/verbose message.
	/// </summary>
	public void Trace(string message, string? category = null, object? data = null) {
		Log(LogLevel.Trace, message, category, data);
	}

	/// <summary>
	/// Log with formatted message.
	/// </summary>
	public void LogFormat(LogLevel level, string format, string? category, params object[] args) {
		if (level < _minimumLevel) return;
		Log(level, string.Format(format, args), category);
	}

	/// <summary>
	/// Begin a timed operation scope.
	/// </summary>
	public LogScope BeginScope(string scopeName, string? category = null) {
		return new LogScope(this, scopeName, category);
	}

	/// <summary>
	/// Log a marker/milestone.
	/// </summary>
	public void Marker(string name, string? category = null) {
		Log(LogLevel.Info, $"[MARKER] {name}", category ?? "Markers", new {
			MarkerName = name,
			SessionTimeMs = _sessionTimer.ElapsedMilliseconds
		});
	}

	/// <summary>
	/// Log a performance measurement.
	/// </summary>
	public void Performance(string operation, double milliseconds, string? category = null) {
		Log(LogLevel.Debug, $"[PERF] {operation}: {milliseconds:F2}ms", category ?? "Performance", new {
			Operation = operation,
			Milliseconds = milliseconds
		});
	}

	/// <summary>
	/// Log memory usage.
	/// </summary>
	public void MemorySnapshot(string label = "Memory", string? category = null) {
		var process = Process.GetCurrentProcess();
		var workingSet = process.WorkingSet64 / (1024 * 1024);
		var managed = GC.GetTotalMemory(false) / (1024 * 1024);

		Log(LogLevel.Debug, $"[MEM] {label}: {workingSet}MB working, {managed}MB managed", category ?? "Memory", new {
			Label = label,
			WorkingSetMB = workingSet,
			ManagedMB = managed
		});
	}

	#endregion

	#region Entry Management

	private void AddEntry(LogEntry entry) {
		_entries.Enqueue(entry);

		// Trim buffer if needed
		while (_entries.Count > _maxBufferSize && _entries.TryDequeue(out _)) {
			// Remove oldest entries
		}

		// Notify targets
		NotifyTargets(entry);
	}

	private void NotifyTargets(LogEntry entry) {
		List<ILogTarget> targetsCopy;
		lock (_targetsLock) {
			targetsCopy = [.. _targets];
		}

		foreach (var target in targetsCopy) {
			try {
				target.Write(entry);
			}
			catch {
				// Don't let target failures break logging
			}
		}
	}

	/// <summary>
	/// Clear all buffered entries.
	/// </summary>
	public void Clear() {
		while (_entries.TryDequeue(out _)) { }
	}

	/// <summary>
	/// Start a new session.
	/// </summary>
	public void NewSession() {
		Clear();
		_sessionId = Guid.NewGuid().ToString("N")[..8];
		_sessionTimer.Restart();
		Info("New logging session started", "Session");
	}

	#endregion

	#region Targets

	/// <summary>
	/// Add a log target.
	/// </summary>
	public void AddTarget(ILogTarget target) {
		ArgumentNullException.ThrowIfNull(target);
		lock (_targetsLock) {
			_targets.Add(target);
		}
	}

	/// <summary>
	/// Remove a log target.
	/// </summary>
	public bool RemoveTarget(ILogTarget target) {
		lock (_targetsLock) {
			return _targets.Remove(target);
		}
	}

	/// <summary>
	/// Clear all targets.
	/// </summary>
	public void ClearTargets() {
		lock (_targetsLock) {
			foreach (var target in _targets) {
				(target as IDisposable)?.Dispose();
			}
			_targets.Clear();
		}
	}

	/// <summary>
	/// Add console target.
	/// </summary>
	public ConsoleLogTarget AddConsoleTarget(bool useColors = true) {
		var target = new ConsoleLogTarget { UseColors = useColors };
		AddTarget(target);
		return target;
	}

	/// <summary>
	/// Add file target.
	/// </summary>
	public FileLogTarget AddFileTarget(string filePath, bool append = true) {
		var target = new FileLogTarget(filePath, append);
		AddTarget(target);
		return target;
	}

	/// <summary>
	/// Add memory target for testing.
	/// </summary>
	public MemoryLogTarget AddMemoryTarget() {
		var target = new MemoryLogTarget();
		AddTarget(target);
		return target;
	}

	#endregion

	#region Filtering & Querying

	/// <summary>
	/// Get entries by level.
	/// </summary>
	public IEnumerable<LogEntry> GetByLevel(LogLevel level) {
		return _entries.Where(e => e.Level == level);
	}

	/// <summary>
	/// Get entries by category.
	/// </summary>
	public IEnumerable<LogEntry> GetByCategory(string category) {
		return _entries.Where(e =>
			e.Category.Equals(category, StringComparison.OrdinalIgnoreCase));
	}

	/// <summary>
	/// Get entries in time range.
	/// </summary>
	public IEnumerable<LogEntry> GetByTimeRange(DateTime start, DateTime end) {
		return _entries.Where(e => e.Timestamp >= start && e.Timestamp <= end);
	}

	/// <summary>
	/// Get entries matching search term.
	/// </summary>
	public IEnumerable<LogEntry> Search(string searchTerm, bool caseSensitive = false) {
		var comparison = caseSensitive ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;
		return _entries.Where(e => e.Message.Contains(searchTerm, comparison));
	}

	/// <summary>
	/// Get errors and warnings.
	/// </summary>
	public IEnumerable<LogEntry> GetProblems() {
		return _entries.Where(e => e.Level >= LogLevel.Warning);
	}

	/// <summary>
	/// Get recent entries.
	/// </summary>
	public IEnumerable<LogEntry> GetRecent(int count = 100) {
		return _entries.TakeLast(count);
	}

	/// <summary>
	/// Get all categories.
	/// </summary>
	public IEnumerable<string> GetCategories() {
		return _entries.Select(e => e.Category).Distinct().OrderBy(c => c);
	}

	#endregion

	#region Statistics

	/// <summary>
	/// Get logging statistics.
	/// </summary>
	public LogStatistics GetStatistics() {
		var entries = _entries.ToArray();

		return new LogStatistics {
			TotalEntries = entries.Length,
			SessionId = _sessionId,
			SessionDuration = _sessionTimer.Elapsed,
			ByLevel = entries
				.GroupBy(e => e.Level)
				.ToDictionary(g => g.Key, g => g.Count()),
			ByCategory = entries
				.GroupBy(e => e.Category)
				.ToDictionary(g => g.Key, g => g.Count()),
			ErrorCount = entries.Count(e => e.Level >= LogLevel.Error),
			WarningCount = entries.Count(e => e.Level == LogLevel.Warning),
			FirstEntry = entries.FirstOrDefault()?.Timestamp,
			LastEntry = entries.LastOrDefault()?.Timestamp
		};
	}

	#endregion

	#region Export

	/// <summary>
	/// Export entries to JSON.
	/// </summary>
	public async Task ExportToJsonAsync(string path, LogLevel? minimumLevel = null) {
		var entries = minimumLevel.HasValue
			? _entries.Where(e => e.Level >= minimumLevel.Value).ToList()
			: _entries.ToList();

		var export = new LogExport {
			SessionId = _sessionId,
			ExportTime = DateTime.UtcNow,
			EntryCount = entries.Count,
			Entries = entries
		};

		var json = JsonSerializer.Serialize(export, GetJsonOptions());
		await File.WriteAllTextAsync(path, json);
	}

	/// <summary>
	/// Export entries to text file.
	/// </summary>
	public async Task ExportToTextAsync(string path, LogLevel? minimumLevel = null) {
		var entries = minimumLevel.HasValue
			? _entries.Where(e => e.Level >= minimumLevel.Value)
			: _entries;

		var sb = new StringBuilder();
		sb.AppendLine($"# Log Export - Session {_sessionId}");
		sb.AppendLine($"# Exported: {DateTime.UtcNow:O}");
		sb.AppendLine();

		foreach (var entry in entries) {
			sb.AppendLine(FormatEntry(entry));
		}

		await File.WriteAllTextAsync(path, sb.ToString());
	}

	/// <summary>
	/// Format a single entry.
	/// </summary>
	public static string FormatEntry(LogEntry entry, bool includeData = false) {
		var levelStr = entry.Level.ToString().ToUpperInvariant().PadRight(8);
		var time = entry.Timestamp.ToString("HH:mm:ss.fff");
		var formatted = $"[{time}] {levelStr} [{entry.Category}] {entry.Message}";

		if (includeData && entry.Data != null) {
			formatted += $" | Data: {JsonSerializer.Serialize(entry.Data)}";
		}

		return formatted;
	}

	#endregion

	#region Disposal

	/// <summary>
	/// Dispose resources.
	/// </summary>
	public void Dispose() {
		if (_disposed) return;
		_disposed = true;

		ClearTargets();
		GC.SuppressFinalize(this);
	}

	#endregion

	private static JsonSerializerOptions GetJsonOptions() => new() {
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		WriteIndented = true,
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
		Converters = { new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) }
	};
}

#region Data Types

/// <summary>
/// A single log entry.
/// </summary>
public record LogEntry {
	/// <summary>Entry timestamp (UTC).</summary>
	public DateTime Timestamp { get; init; }

	/// <summary>Time since session start.</summary>
	public TimeSpan SessionTime { get; init; }

	/// <summary>Log level.</summary>
	public LogLevel Level { get; init; }

	/// <summary>Log category.</summary>
	public required string Category { get; init; }

	/// <summary>Log message.</summary>
	public required string Message { get; init; }

	/// <summary>Additional data.</summary>
	public object? Data { get; init; }

	/// <summary>Thread ID.</summary>
	public int ThreadId { get; init; }
}

/// <summary>
/// Log level.
/// </summary>
public enum LogLevel {
	/// <summary>Trace/verbose level.</summary>
	Trace = 0,
	/// <summary>Debug level.</summary>
	Debug = 1,
	/// <summary>Information level.</summary>
	Info = 2,
	/// <summary>Warning level.</summary>
	Warning = 3,
	/// <summary>Error level.</summary>
	Error = 4,
	/// <summary>Critical/fatal level.</summary>
	Critical = 5
}

/// <summary>
/// Logging statistics.
/// </summary>
public record LogStatistics {
	/// <summary>Total entries.</summary>
	public int TotalEntries { get; init; }

	/// <summary>Session ID.</summary>
	public required string SessionId { get; init; }

	/// <summary>Session duration.</summary>
	public TimeSpan SessionDuration { get; init; }

	/// <summary>Count by level.</summary>
	public Dictionary<LogLevel, int> ByLevel { get; init; } = [];

	/// <summary>Count by category.</summary>
	public Dictionary<string, int> ByCategory { get; init; } = [];

	/// <summary>Error count.</summary>
	public int ErrorCount { get; init; }

	/// <summary>Warning count.</summary>
	public int WarningCount { get; init; }

	/// <summary>First entry timestamp.</summary>
	public DateTime? FirstEntry { get; init; }

	/// <summary>Last entry timestamp.</summary>
	public DateTime? LastEntry { get; init; }
}

/// <summary>
/// Export format.
/// </summary>
internal record LogExport {
	public required string SessionId { get; init; }
	public DateTime ExportTime { get; init; }
	public int EntryCount { get; init; }
	public List<LogEntry> Entries { get; init; } = [];
}

#endregion

#region Scope

/// <summary>
/// Scoped logging context for timing operations.
/// </summary>
public sealed class LogScope : IDisposable {
	private readonly DebugLogger _logger;
	private readonly string _scopeName;
	private readonly string? _category;
	private readonly Stopwatch _stopwatch;
	private bool _disposed;

	internal LogScope(DebugLogger logger, string scopeName, string? category) {
		_logger = logger;
		_scopeName = scopeName;
		_category = category;
		_stopwatch = Stopwatch.StartNew();

		_logger.Debug($"[BEGIN] {_scopeName}", _category);
	}

	/// <summary>
	/// Elapsed time.
	/// </summary>
	public TimeSpan Elapsed => _stopwatch.Elapsed;

	/// <summary>
	/// Log an intermediate message within the scope.
	/// </summary>
	public void Log(string message) {
		_logger.Debug($"[{_scopeName}] {message}", _category);
	}

	/// <summary>
	/// End the scope.
	/// </summary>
	public void Dispose() {
		if (_disposed) return;
		_disposed = true;

		_stopwatch.Stop();
		_logger.Debug($"[END] {_scopeName} ({_stopwatch.ElapsedMilliseconds}ms)", _category);
	}
}

#endregion

#region Log Targets

/// <summary>
/// Interface for log output targets.
/// </summary>
public interface ILogTarget {
	/// <summary>
	/// Write a log entry.
	/// </summary>
	void Write(LogEntry entry);
}

/// <summary>
/// Console log target with optional colors.
/// </summary>
public class ConsoleLogTarget : ILogTarget {
	/// <summary>
	/// Whether to use colors.
	/// </summary>
	public bool UseColors { get; set; } = true;

	/// <summary>
	/// Minimum level to output.
	/// </summary>
	public LogLevel MinimumLevel { get; set; } = LogLevel.Debug;

	/// <inheritdoc/>
	public void Write(LogEntry entry) {
		if (entry.Level < MinimumLevel) return;

		var formatted = DebugLogger.FormatEntry(entry);

		if (UseColors) {
			var originalColor = Console.ForegroundColor;
			Console.ForegroundColor = GetColor(entry.Level);
			Console.WriteLine(formatted);
			Console.ForegroundColor = originalColor;
		}
		else {
			Console.WriteLine(formatted);
		}
	}

	private static ConsoleColor GetColor(LogLevel level) {
		return level switch {
			LogLevel.Trace => ConsoleColor.DarkGray,
			LogLevel.Debug => ConsoleColor.Gray,
			LogLevel.Info => ConsoleColor.White,
			LogLevel.Warning => ConsoleColor.Yellow,
			LogLevel.Error => ConsoleColor.Red,
			LogLevel.Critical => ConsoleColor.DarkRed,
			_ => ConsoleColor.White
		};
	}
}

/// <summary>
/// File log target.
/// </summary>
public class FileLogTarget : ILogTarget, IDisposable {
	private readonly StreamWriter _writer;
	private readonly object _writeLock = new();
	private bool _disposed;

	/// <summary>
	/// Minimum level to output.
	/// </summary>
	public LogLevel MinimumLevel { get; set; } = LogLevel.Debug;

	/// <summary>
	/// Create a new file target.
	/// </summary>
	public FileLogTarget(string filePath, bool append = true) {
		var directory = Path.GetDirectoryName(filePath);
		if (!string.IsNullOrEmpty(directory) && !Directory.Exists(directory)) {
			Directory.CreateDirectory(directory);
		}

		_writer = new StreamWriter(filePath, append, Encoding.UTF8) {
			AutoFlush = true
		};
	}

	/// <inheritdoc/>
	public void Write(LogEntry entry) {
		if (_disposed || entry.Level < MinimumLevel) return;

		var formatted = DebugLogger.FormatEntry(entry);

		lock (_writeLock) {
			_writer.WriteLine(formatted);
		}
	}

	/// <summary>
	/// Flush pending writes.
	/// </summary>
	public void Flush() {
		lock (_writeLock) {
			_writer.Flush();
		}
	}

	/// <inheritdoc/>
	public void Dispose() {
		if (_disposed) return;
		_disposed = true;

		lock (_writeLock) {
			_writer.Dispose();
		}

		GC.SuppressFinalize(this);
	}
}

/// <summary>
/// In-memory log target for testing.
/// </summary>
public class MemoryLogTarget : ILogTarget {
	private readonly List<LogEntry> _entries = [];
	private readonly object _lock = new();

	/// <summary>
	/// Minimum level to capture.
	/// </summary>
	public LogLevel MinimumLevel { get; set; } = LogLevel.Trace;

	/// <summary>
	/// Captured entries.
	/// </summary>
	public IReadOnlyList<LogEntry> Entries {
		get {
			lock (_lock) {
				return [.. _entries];
			}
		}
	}

	/// <summary>
	/// Entry count.
	/// </summary>
	public int Count {
		get {
			lock (_lock) {
				return _entries.Count;
			}
		}
	}

	/// <inheritdoc/>
	public void Write(LogEntry entry) {
		if (entry.Level < MinimumLevel) return;

		lock (_lock) {
			_entries.Add(entry);
		}
	}

	/// <summary>
	/// Clear captured entries.
	/// </summary>
	public void Clear() {
		lock (_lock) {
			_entries.Clear();
		}
	}

	/// <summary>
	/// Get entries containing text.
	/// </summary>
	public IEnumerable<LogEntry> Search(string text) {
		lock (_lock) {
			return _entries.Where(e =>
				e.Message.Contains(text, StringComparison.OrdinalIgnoreCase)).ToList();
		}
	}
}

/// <summary>
/// Callback log target for custom handling.
/// </summary>
public class CallbackLogTarget : ILogTarget {
	private readonly Action<LogEntry> _callback;

	/// <summary>
	/// Minimum level to output.
	/// </summary>
	public LogLevel MinimumLevel { get; set; } = LogLevel.Debug;

	/// <summary>
	/// Create a callback target.
	/// </summary>
	public CallbackLogTarget(Action<LogEntry> callback) {
		_callback = callback ?? throw new ArgumentNullException(nameof(callback));
	}

	/// <inheritdoc/>
	public void Write(LogEntry entry) {
		if (entry.Level < MinimumLevel) return;
		_callback(entry);
	}
}

#endregion
