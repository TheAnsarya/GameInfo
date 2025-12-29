using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Tests;

public class TasFormatRegistryTests {
	[Fact]
	public void Register_AddsFormat() {
		var registry = new TasFormatRegistry();
		var format = new TestFormat();

		registry.Register(format);

		Assert.Contains(format, registry.Formats);
	}

	[Fact]
	public void Register_DoesNotDuplicate() {
		var registry = new TasFormatRegistry();
		var format = new TestFormat();

		registry.Register(format);
		registry.Register(format);

		Assert.Single(registry.Formats, f => f.Name == "TEST");
	}

	[Fact]
	public void GetByName_ReturnsFormat() {
		var registry = new TasFormatRegistry();
		var format = new TestFormat();
		registry.Register(format);

		var result = registry.GetByName("TEST");

		Assert.Same(format, result);
	}

	[Fact]
	public void GetByName_CaseInsensitive() {
		var registry = new TasFormatRegistry();
		registry.Register(new TestFormat());

		Assert.NotNull(registry.GetByName("test"));
		Assert.NotNull(registry.GetByName("Test"));
		Assert.NotNull(registry.GetByName("TEST"));
	}

	[Fact]
	public void GetByExtension_ReturnsMatchingFormats() {
		var registry = new TasFormatRegistry();
		var format = new TestFormat();
		registry.Register(format);

		var results = registry.GetByExtension("tst");

		Assert.Contains(format, results);
	}

	[Fact]
	public void GetByExtension_HandlesLeadingDot() {
		var registry = new TasFormatRegistry();
		registry.Register(new TestFormat());

		var results = registry.GetByExtension(".tst");

		Assert.Single(results);
	}

	[Fact]
	public void GetBySystem_ReturnsMatchingFormats() {
		var registry = new TasFormatRegistry();
		var format = new TestFormat();
		registry.Register(format);

		var results = registry.GetBySystem(GameSystem.Nes);

		Assert.Contains(format, results);
	}

	[Fact]
	public void Unregister_RemovesFormat() {
		var registry = new TasFormatRegistry();
		registry.Register(new TestFormat());

		var removed = registry.Unregister("TEST");

		Assert.True(removed);
		Assert.Empty(registry.Formats);
	}

	[Fact]
	public void Unregister_ReturnsFalseIfNotFound() {
		var registry = new TasFormatRegistry();

		var removed = registry.Unregister("NOTEXIST");

		Assert.False(removed);
	}

	[Fact]
	public void GetReadableFormats_FiltersCorrectly() {
		var registry = new TasFormatRegistry();
		registry.Register(new TestFormat());
		registry.Register(new WriteOnlyFormat());

		var readable = registry.GetReadableFormats();

		Assert.Single(readable);
		Assert.Equal("TEST", readable[0].Name);
	}

	[Fact]
	public void GetWritableFormats_FiltersCorrectly() {
		var registry = new TasFormatRegistry();
		registry.Register(new TestFormat());
		registry.Register(new ReadOnlyFormat());

		var writable = registry.GetWritableFormats();

		Assert.Single(writable);
		Assert.Equal("TEST", writable[0].Name);
	}

	private class TestFormat : TasFormatBase {
		public override string Name => "TEST";
		public override string Description => "Test format";
		public override string EmulatorName => "Test";
		public override IReadOnlyList<string> Extensions => ["tst"];
		public override IReadOnlyList<GameSystem> SupportedSystems => [GameSystem.Nes, GameSystem.Snes];

		public override bool CanHandle(Stream stream) => true;

		public override Task<ITasMovie> ReadAsync(Stream stream, CancellationToken ct = default) {
			return Task.FromResult<ITasMovie>(new TasMovie());
		}

		public override Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken ct = default) {
			return Task.CompletedTask;
		}
	}

	private class WriteOnlyFormat : TasFormatBase {
		public override string Name => "WRITEONLY";
		public override string Description => "Write-only format";
		public override string EmulatorName => "Test";
		public override IReadOnlyList<string> Extensions => ["wo"];
		public override IReadOnlyList<GameSystem> SupportedSystems => [GameSystem.Nes];
		public override bool CanRead => false;

		public override bool CanHandle(Stream stream) => false;

		public override Task<ITasMovie> ReadAsync(Stream stream, CancellationToken ct = default) {
			throw new NotSupportedException();
		}

		public override Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken ct = default) {
			return Task.CompletedTask;
		}
	}

	private class ReadOnlyFormat : TasFormatBase {
		public override string Name => "READONLY";
		public override string Description => "Read-only format";
		public override string EmulatorName => "Test";
		public override IReadOnlyList<string> Extensions => ["ro"];
		public override IReadOnlyList<GameSystem> SupportedSystems => [GameSystem.Nes];
		public override bool CanWrite => false;

		public override bool CanHandle(Stream stream) => true;

		public override Task<ITasMovie> ReadAsync(Stream stream, CancellationToken ct = default) {
			return Task.FromResult<ITasMovie>(new TasMovie());
		}

		public override Task WriteAsync(ITasMovie movie, Stream stream, CancellationToken ct = default) {
			throw new NotSupportedException();
		}
	}
}
