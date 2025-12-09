using GameInfoTools.Core;
using GameInfoTools.Text;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Tests for TextDictionary compression/decompression.
/// </summary>
public class TextDictionaryTests {
	[Fact]
	public void Count_IsZeroWhenEmpty() {
		var dict = new TextDictionary();
		Assert.Equal(0, dict.Count);
	}

	[Fact]
	public void GetEntry_ReturnsNullForUnknownIndex() {
		var dict = new TextDictionary();
		var entry = dict.GetEntry(0);
		Assert.Null(entry);
	}

	[Fact]
	public void FindEntry_ReturnsNullForUnknownText() {
		var dict = new TextDictionary();
		var index = dict.FindEntry("unknown");
		Assert.Null(index);
	}

	[Fact]
	public void GetAllEntries_ReturnsEmptyWhenEmpty() {
		var dict = new TextDictionary();
		var entries = dict.GetAllEntries().ToList();
		Assert.Empty(entries);
	}

	[Fact]
	public void ExportToJson_ReturnsEmptyJsonWhenEmpty() {
		var dict = new TextDictionary();
		var json = dict.ExportToJson();

		Assert.Contains("{", json);
		Assert.Contains("}", json);
	}
}
