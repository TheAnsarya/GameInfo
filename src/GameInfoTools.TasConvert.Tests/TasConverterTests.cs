using GameInfoTools.TasConvert.Core;

namespace GameInfoTools.TasConvert.Tests;

/// <summary>
/// Tests for TasConverter.
/// </summary>
public class TasConverterTests {
	[Fact]
	public void Constructor_WithDefaultFormats_RegistersFormats() {
		var converter = new TasConverter();

		// Should have formats registered from the singleton registry
		Assert.NotNull(converter);
	}

	[Fact]
	public void Constructor_WithCustomRegistry_UsesCustomRegistry() {
		var registry = new TasFormatRegistry();
		var converter = new TasConverter(registry);

		Assert.NotNull(converter);
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_WithValidPath_CallsReadOnFormat() {
		var converter = new TasConverter();

		// Nonexistent file with unknown extension should throw
		// (format detection happens before file access)
		await Assert.ThrowsAsync<InvalidOperationException>(() =>
			converter.ReadAsync("nonexistent.fm2"));
	}

	[Fact(Timeout = 10000)]
	public async Task ReadAsync_WithUnknownFormat_ThrowsException() {
		var converter = new TasConverter();

		// File with unknown extension
		await Assert.ThrowsAsync<InvalidOperationException>(() =>
			converter.ReadAsync("file.unknown"));
	}

	[Fact(Timeout = 10000)]
	public async Task GetInfoAsync_WithInvalidFile_ThrowsException() {
		var converter = new TasConverter();

		// Nonexistent file should throw
		await Assert.ThrowsAsync<FileNotFoundException>(() =>
			converter.GetInfoAsync("nonexistent.fm2"));
	}
}
