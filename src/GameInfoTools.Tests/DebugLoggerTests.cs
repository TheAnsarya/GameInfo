using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for <see cref="DebugLogger"/>.
/// </summary>
public class DebugLoggerTests : IDisposable {
	private readonly DebugLogger _logger;

	public DebugLoggerTests() {
		_logger = new DebugLogger();
	}

	public void Dispose() {
		_logger.Dispose();
		GC.SuppressFinalize(this);
	}

	#region Basic Logging

	[Fact]
	public void Log_AddsEntryToBuffer() {
		// Act
		_logger.Log(LogLevel.Info, "Test message");

		// Assert
		Assert.Single(_logger.Entries);
		Assert.Equal("Test message", _logger.Entries.First().Message);
	}

	[Fact]
	public void Log_WithCategory_SetsCategory() {
		// Act
		_logger.Log(LogLevel.Info, "Test message", "TestCategory");

		// Assert
		var entry = _logger.Entries.First();
		Assert.Equal("TestCategory", entry.Category);
	}

	[Fact]
	public void Log_WithData_AttachesData() {
		// Act
		_logger.Log(LogLevel.Info, "Test message", data: new { Key = "Value" });

		// Assert
		var entry = _logger.Entries.First();
		Assert.NotNull(entry.Data);
	}

	[Fact]
	public void Log_BelowMinimumLevel_DoesNotAdd() {
		// Arrange
		_logger.MinimumLevel = LogLevel.Warning;

		// Act
		_logger.Log(LogLevel.Debug, "Debug message");
		_logger.Log(LogLevel.Info, "Info message");

		// Assert
		Assert.Empty(_logger.Entries);
	}

	[Fact]
	public void Log_AtMinimumLevel_Adds() {
		// Arrange
		_logger.MinimumLevel = LogLevel.Warning;

		// Act
		_logger.Log(LogLevel.Warning, "Warning message");

		// Assert
		Assert.Single(_logger.Entries);
	}

	#endregion

	#region Convenience Methods

	[Fact]
	public void Debug_LogsAtDebugLevel() {
		// Act
		_logger.Debug("Debug message");

		// Assert
		Assert.Equal(LogLevel.Debug, _logger.Entries.First().Level);
	}

	[Fact]
	public void Info_LogsAtInfoLevel() {
		// Act
		_logger.Info("Info message");

		// Assert
		Assert.Equal(LogLevel.Info, _logger.Entries.First().Level);
	}

	[Fact]
	public void Warn_LogsAtWarningLevel() {
		// Act
		_logger.Warn("Warning message");

		// Assert
		Assert.Equal(LogLevel.Warning, _logger.Entries.First().Level);
	}

	[Fact]
	public void Error_LogsAtErrorLevel() {
		// Act
		_logger.Error("Error message");

		// Assert
		Assert.Equal(LogLevel.Error, _logger.Entries.First().Level);
	}

	[Fact]
	public void Error_WithException_LogsExceptionDetails() {
		// Arrange
		var exception = new InvalidOperationException("Test exception");

		// Act
		_logger.Error(exception, "Something went wrong");

		// Assert
		var entry = _logger.Entries.First();
		Assert.Contains("Test exception", entry.Message);
		Assert.NotNull(entry.Data);
	}

	[Fact]
	public void Critical_LogsAtCriticalLevel() {
		// Act
		_logger.Critical("Critical message");

		// Assert
		Assert.Equal(LogLevel.Critical, _logger.Entries.First().Level);
	}

	[Fact]
	public void Trace_LogsAtTraceLevel() {
		// Arrange
		_logger.MinimumLevel = LogLevel.Trace;

		// Act
		_logger.Trace("Trace message");

		// Assert
		Assert.Equal(LogLevel.Trace, _logger.Entries.First().Level);
	}

	[Fact]
	public void LogFormat_FormatsMessage() {
		// Act
		_logger.LogFormat(LogLevel.Info, "Value: {0}, Count: {1}", null, 42, 100);

		// Assert
		Assert.Contains("Value: 42", _logger.Entries.First().Message);
		Assert.Contains("Count: 100", _logger.Entries.First().Message);
	}

	#endregion

	#region Special Logging

	[Fact]
	public void Marker_LogsWithMarkerFormat() {
		// Act
		_logger.Marker("Checkpoint1");

		// Assert
		var entry = _logger.Entries.First();
		Assert.Contains("[MARKER]", entry.Message);
		Assert.Contains("Checkpoint1", entry.Message);
	}

	[Fact]
	public void Performance_LogsPerformanceData() {
		// Act
		_logger.Performance("Database Query", 45.5);

		// Assert
		var entry = _logger.Entries.First();
		Assert.Contains("[PERF]", entry.Message);
		Assert.Contains("45.50ms", entry.Message);
	}

	[Fact]
	public void MemorySnapshot_LogsMemoryInfo() {
		// Act
		_logger.MemorySnapshot("After load");

		// Assert
		var entry = _logger.Entries.First();
		Assert.Contains("[MEM]", entry.Message);
		Assert.Contains("After load", entry.Message);
	}

	#endregion

	#region Buffer Management

	[Fact]
	public void MaxBufferSize_LimitsEntries() {
		// Arrange - Minimum buffer size is 100
		_logger.MaxBufferSize = 100;

		// Act - Add more entries than buffer allows
		for (var i = 0; i < 150; i++) {
			_logger.Info($"Message {i}");
		}

		// Assert - Should be capped at MaxBufferSize
		Assert.True(_logger.Entries.Count <= 100);
	}

	[Fact]
	public void Clear_RemovesAllEntries() {
		// Arrange
		_logger.Info("Message 1");
		_logger.Info("Message 2");

		// Act
		_logger.Clear();

		// Assert
		Assert.Empty(_logger.Entries);
	}

	[Fact]
	public void NewSession_ClearsAndResetsSessionId() {
		// Arrange
		var originalSessionId = _logger.SessionId;
		_logger.Info("Old message");

		// Act
		_logger.NewSession();

		// Assert
		Assert.NotEqual(originalSessionId, _logger.SessionId);
		Assert.Single(_logger.Entries); // Only the "new session" message
	}

	#endregion

	#region Scope

	[Fact]
	public void BeginScope_LogsBeginAndEnd() {
		// Act
		using (_logger.BeginScope("TestOperation")) {
			// Scope active
		}

		// Assert
		Assert.Equal(2, _logger.Entries.Count);
		Assert.Contains("[BEGIN]", _logger.Entries.First().Message);
		Assert.Contains("[END]", _logger.Entries.Last().Message);
	}

	[Fact]
	public void BeginScope_MeasuresElapsedTime() {
		// Act
		using (var scope = _logger.BeginScope("TestOperation")) {
			Thread.Sleep(10);
			Assert.True(scope.Elapsed.TotalMilliseconds >= 10);
		}
	}

	[Fact]
	public void BeginScope_AllowsIntermediateLogging() {
		// Act
		using (var scope = _logger.BeginScope("TestOperation")) {
			scope.Log("Intermediate step");
		}

		// Assert
		Assert.Equal(3, _logger.Entries.Count);
	}

	#endregion

	#region Targets

	[Fact]
	public void AddTarget_ReceivesLogEntries() {
		// Arrange
		var target = new MemoryLogTarget();
		_logger.AddTarget(target);

		// Act
		_logger.Info("Test message");

		// Assert
		Assert.Single(target.Entries);
	}

	[Fact]
	public void RemoveTarget_StopsReceivingEntries() {
		// Arrange
		var target = new MemoryLogTarget();
		_logger.AddTarget(target);
		_logger.Info("First message");

		// Act
		_logger.RemoveTarget(target);
		_logger.Info("Second message");

		// Assert
		Assert.Single(target.Entries);
	}

	[Fact]
	public void ClearTargets_RemovesAllTargets() {
		// Arrange
		var target1 = new MemoryLogTarget();
		var target2 = new MemoryLogTarget();
		_logger.AddTarget(target1);
		_logger.AddTarget(target2);
		_logger.Info("First message");

		// Act
		_logger.ClearTargets();
		_logger.Info("Second message");

		// Assert
		Assert.Single(target1.Entries);
		Assert.Single(target2.Entries);
	}

	[Fact]
	public void AddMemoryTarget_ReturnsUsableTarget() {
		// Act
		var target = _logger.AddMemoryTarget();
		_logger.Info("Test message");

		// Assert
		Assert.Single(target.Entries);
	}

	#endregion

	#region Querying

	[Fact]
	public void GetByLevel_ReturnsMatchingEntries() {
		// Arrange
		_logger.Info("Info 1");
		_logger.Warn("Warning 1");
		_logger.Error("Error 1");
		_logger.Info("Info 2");

		// Act
		var infoEntries = _logger.GetByLevel(LogLevel.Info).ToList();

		// Assert
		Assert.Equal(2, infoEntries.Count);
		Assert.All(infoEntries, e => Assert.Equal(LogLevel.Info, e.Level));
	}

	[Fact]
	public void GetByCategory_ReturnsMatchingEntries() {
		// Arrange
		_logger.Log(LogLevel.Info, "Message 1", "CategoryA");
		_logger.Log(LogLevel.Info, "Message 2", "CategoryB");
		_logger.Log(LogLevel.Info, "Message 3", "CategoryA");

		// Act
		var catAEntries = _logger.GetByCategory("CategoryA").ToList();

		// Assert
		Assert.Equal(2, catAEntries.Count);
	}

	[Fact]
	public void Search_FindsMatchingEntries() {
		// Arrange
		_logger.Info("User logged in");
		_logger.Info("Data processed");
		_logger.Info("User logged out");

		// Act
		var userEntries = _logger.Search("logged").ToList();

		// Assert
		Assert.Equal(2, userEntries.Count);
	}

	[Fact]
	public void GetProblems_ReturnsWarningsAndErrors() {
		// Arrange
		_logger.Info("Info message");
		_logger.Warn("Warning message");
		_logger.Error("Error message");
		_logger.Debug("Debug message");

		// Act
		var problems = _logger.GetProblems().ToList();

		// Assert
		Assert.Equal(2, problems.Count);
		Assert.All(problems, p => Assert.True(p.Level >= LogLevel.Warning));
	}

	[Fact]
	public void GetRecent_ReturnsLastNEntries() {
		// Arrange
		for (var i = 0; i < 10; i++) {
			_logger.Info($"Message {i}");
		}

		// Act
		var recent = _logger.GetRecent(3).ToList();

		// Assert
		Assert.Equal(3, recent.Count);
		Assert.Equal("Message 9", recent.Last().Message);
	}

	[Fact]
	public void GetCategories_ReturnsDistinctCategories() {
		// Arrange
		_logger.Log(LogLevel.Info, "M1", "Cat1");
		_logger.Log(LogLevel.Info, "M2", "Cat2");
		_logger.Log(LogLevel.Info, "M3", "Cat1");
		_logger.Log(LogLevel.Info, "M4", "Cat3");

		// Act
		var categories = _logger.GetCategories().ToList();

		// Assert
		Assert.Equal(3, categories.Count);
		Assert.Contains("Cat1", categories);
		Assert.Contains("Cat2", categories);
		Assert.Contains("Cat3", categories);
	}

	#endregion

	#region Statistics

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		// Arrange
		_logger.Log(LogLevel.Info, "Info 1", "CatA");
		_logger.Log(LogLevel.Info, "Info 2", "CatB");
		_logger.Log(LogLevel.Warning, "Warn", "CatA");
		_logger.Log(LogLevel.Error, "Error", "CatA");

		// Act
		var stats = _logger.GetStatistics();

		// Assert
		Assert.Equal(4, stats.TotalEntries);
		Assert.Equal(_logger.SessionId, stats.SessionId);
		Assert.Equal(2, stats.ByLevel[LogLevel.Info]);
		Assert.Equal(1, stats.ErrorCount);
		Assert.Equal(1, stats.WarningCount);
		Assert.Equal(3, stats.ByCategory["CatA"]);
	}

	#endregion

	#region Export

	[Fact]
	public async Task ExportToJson_CreatesValidFile() {
		// Arrange
		_logger.Info("Test message");
		var tempPath = Path.GetTempFileName();

		try {
			// Act
			await _logger.ExportToJsonAsync(tempPath);

			// Assert
			Assert.True(File.Exists(tempPath));
			var content = await File.ReadAllTextAsync(tempPath);
			Assert.Contains("Test message", content);
			Assert.Contains(_logger.SessionId, content);
		}
		finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public async Task ExportToJson_WithMinimumLevel_FiltersEntries() {
		// Arrange
		_logger.Debug("Debug message");
		_logger.Info("Info message");
		_logger.Error("Error message");
		var tempPath = Path.GetTempFileName();

		try {
			// Act
			await _logger.ExportToJsonAsync(tempPath, LogLevel.Warning);

			// Assert
			var content = await File.ReadAllTextAsync(tempPath);
			Assert.DoesNotContain("Debug message", content);
			Assert.DoesNotContain("Info message", content);
			Assert.Contains("Error message", content);
		}
		finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public async Task ExportToText_CreatesReadableFile() {
		// Arrange
		_logger.Info("Test message");
		var tempPath = Path.GetTempFileName();

		try {
			// Act
			await _logger.ExportToTextAsync(tempPath);

			// Assert
			Assert.True(File.Exists(tempPath));
			var content = await File.ReadAllTextAsync(tempPath);
			Assert.Contains("Test message", content);
			Assert.Contains("# Log Export", content);
		}
		finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public void FormatEntry_CreatesReadableString() {
		// Arrange
		var entry = new LogEntry {
			Timestamp = new DateTime(2024, 1, 15, 10, 30, 45, 123, DateTimeKind.Utc),
			SessionTime = TimeSpan.FromSeconds(5),
			Level = LogLevel.Info,
			Category = "Test",
			Message = "Hello world",
			ThreadId = 1
		};

		// Act
		var formatted = DebugLogger.FormatEntry(entry);

		// Assert
		Assert.Contains("INFO", formatted);
		Assert.Contains("[Test]", formatted);
		Assert.Contains("Hello world", formatted);
	}

	#endregion

	#region Memory Target Tests

	[Fact]
	public void MemoryTarget_Count_ReturnsCorrectCount() {
		// Arrange
		var target = new MemoryLogTarget();
		_logger.AddTarget(target);

		// Act
		_logger.Info("Message 1");
		_logger.Info("Message 2");
		_logger.Info("Message 3");

		// Assert
		Assert.Equal(3, target.Count);
	}

	[Fact]
	public void MemoryTarget_Clear_RemovesEntries() {
		// Arrange
		var target = new MemoryLogTarget();
		_logger.AddTarget(target);
		_logger.Info("Message");

		// Act
		target.Clear();

		// Assert
		Assert.Empty(target.Entries);
	}

	[Fact]
	public void MemoryTarget_Search_FindsMatchingEntries() {
		// Arrange
		var target = new MemoryLogTarget();
		_logger.AddTarget(target);
		_logger.Info("User logged in");
		_logger.Info("Data processed");

		// Act
		var results = target.Search("logged").ToList();

		// Assert
		Assert.Single(results);
	}

	[Fact]
	public void MemoryTarget_MinimumLevel_FiltersEntries() {
		// Arrange
		var target = new MemoryLogTarget { MinimumLevel = LogLevel.Warning };
		_logger.MinimumLevel = LogLevel.Debug; // Logger allows all
		_logger.AddTarget(target);

		// Act
		_logger.Debug("Debug");
		_logger.Info("Info");
		_logger.Warn("Warning");
		_logger.Error("Error");

		// Assert
		Assert.Equal(2, target.Count);
	}

	#endregion

	#region Callback Target Tests

	[Fact]
	public void CallbackTarget_InvokesCallback() {
		// Arrange
		var callCount = 0;
		var target = new CallbackLogTarget(entry => callCount++);
		_logger.AddTarget(target);

		// Act
		_logger.Info("Message 1");
		_logger.Info("Message 2");

		// Assert
		Assert.Equal(2, callCount);
	}

	[Fact]
	public void CallbackTarget_MinimumLevel_FiltersEntries() {
		// Arrange
		var callCount = 0;
		var target = new CallbackLogTarget(entry => callCount++) { MinimumLevel = LogLevel.Error };
		_logger.AddTarget(target);

		// Act
		_logger.Info("Info");
		_logger.Warn("Warning");
		_logger.Error("Error");

		// Assert
		Assert.Equal(1, callCount);
	}

	#endregion

	#region File Target Tests

	[Fact]
	public void FileTarget_WritesToFile() {
		// Arrange
		var tempPath = Path.GetTempFileName();

		try {
			using (var target = new FileLogTarget(tempPath)) {
				_logger.AddTarget(target);

				// Act
				_logger.Info("Test message");
				target.Flush();
			}

			// Assert
			var content = File.ReadAllText(tempPath);
			Assert.Contains("Test message", content);
		}
		finally {
			File.Delete(tempPath);
		}
	}

	[Fact]
	public void FileTarget_CreatesDirectory() {
		// Arrange
		var tempDir = Path.Combine(Path.GetTempPath(), Guid.NewGuid().ToString());
		var tempPath = Path.Combine(tempDir, "log.txt");

		try {
			// Act
			using var target = new FileLogTarget(tempPath);
			_logger.AddTarget(target);
			_logger.Info("Test");
			target.Flush();

			// Assert
			Assert.True(Directory.Exists(tempDir));
			Assert.True(File.Exists(tempPath));
		}
		finally {
			if (Directory.Exists(tempDir)) {
				Directory.Delete(tempDir, true);
			}
		}
	}

	#endregion

	#region Session Properties

	[Fact]
	public void SessionId_IsNotEmpty() {
		Assert.NotEmpty(_logger.SessionId);
		Assert.Equal(8, _logger.SessionId.Length);
	}

	[Fact]
	public void SessionElapsed_IncreaseOverTime() {
		var initial = _logger.SessionElapsed;
		Thread.Sleep(10);
		var later = _logger.SessionElapsed;

		Assert.True(later > initial);
	}

	[Fact]
	public void EntryCount_ReflectsBufferedEntries() {
		// Arrange
		_logger.Info("One");
		_logger.Info("Two");
		_logger.Info("Three");

		// Assert
		Assert.Equal(3, _logger.EntryCount);
	}

	#endregion
}
