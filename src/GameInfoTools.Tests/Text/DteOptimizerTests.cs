using GameInfoTools.Text;

namespace GameInfoTools.Tests.Text;

public class DteOptimizerTests {
	[Fact]
	public void GenerateOptimalTable_FindsCommonPairs() {
		var optimizer = new DteOptimizer();

		// Text with common pairs
		var text = "the the the this this that that there there";

		var result = optimizer.GenerateOptimalTable(text);

		Assert.NotEmpty(result.Pairs);
		// "th" should be one of the most common pairs
		Assert.Contains(result.Pairs, p => p.Text.Contains("th"));
	}

	[Fact]
	public void GenerateOptimalTable_CalculatesSavings() {
		var optimizer = new DteOptimizer();
		optimizer.Config = new DteConfig(MinOccurrences: 2);

		var text = "aa bb aa bb aa bb cc dd";

		var result = optimizer.GenerateOptimalTable(text);

		Assert.True(result.TotalSavings > 0);
		Assert.True(result.CompressedSize < result.OriginalSize);
	}

	[Fact]
	public void GenerateOptimalTable_RespectsConfig() {
		var optimizer = new DteOptimizer {
			Config = new DteConfig(
				StartByte: 0xA0,
				EndByte: 0xA5,
				MinLength: 2,
				MaxLength: 3,
				MinOccurrences: 2
			)
		};

		var text = "abc abc abc def def def ghi ghi ghi";

		var result = optimizer.GenerateOptimalTable(text);

		// Should only have up to 6 pairs (0xA0-0xA5)
		Assert.True(result.Pairs.Count <= 6);
		Assert.All(result.Pairs, p => Assert.InRange(p.ByteValue, 0xA0, 0xA5));
	}

	[Fact]
	public void Compress_UsesGreedyMatching() {
		var optimizer = new DteOptimizer();
		optimizer.SetDteEntry(0x80, "th");
		optimizer.SetDteEntry(0x81, "the");

		// Load basic char table
		optimizer.LoadTbl("65=e\n68=h\n74=t");

		var compressed = optimizer.Compress("the");

		// Should use "the" (0x81) rather than "th" + "e"
		Assert.Equal([0x81], compressed);
	}

	[Fact]
	public void CompressOptimal_FindsMinimalEncoding() {
		var optimizer = new DteOptimizer();
		optimizer.SetDteEntry(0x80, "ab");
		optimizer.SetDteEntry(0x81, "bc");
		optimizer.SetDteEntry(0x82, "abc");

		// Load basic char table
		optimizer.LoadTbl("61=a\n62=b\n63=c");

		var compressed = optimizer.CompressOptimal("abc");

		// Should use "abc" (1 byte) rather than "ab" + "c" (2 bytes)
		Assert.Single(compressed);
		Assert.Equal(0x82, compressed[0]);
	}

	[Fact]
	public void Decompress_ExpandsDtePairs() {
		var optimizer = new DteOptimizer();
		optimizer.SetDteEntry(0x80, "th");
		optimizer.SetDteEntry(0x81, "e ");
		optimizer.LoadTbl("74=t\n68=h\n65=e\n20= ");

		var compressed = new byte[] { 0x80, 0x81, 0x74, 0x65, 0x78, 0x74 };
		var text = optimizer.Decompress(compressed);

		Assert.Equal("the text", text);
	}

	[Fact]
	public void LoadTbl_ParsesStandardFormat() {
		var optimizer = new DteOptimizer();

		// Note: Can't use raw string literal for space entry - formatter trims trailing space
		var tblContent = "; Comment line\n41=A\n42=B\n43=C\n20= ";

		optimizer.LoadTbl(tblContent);

		Assert.Equal('A', optimizer.CharTable[0x41]);
		Assert.Equal('B', optimizer.CharTable[0x42]);
		Assert.Equal('C', optimizer.CharTable[0x43]);
		Assert.Equal(' ', optimizer.CharTable[0x20]);
	}

	[Fact]
	public void LoadDteTable_ParsesFormat() {
		var optimizer = new DteOptimizer();

		var dteContent = """
			; DTE Table
			80=th
			81=he
			82=in
			""";

		optimizer.LoadDteTable(dteContent);

		Assert.Equal("th", optimizer.DteTable[0x80]);
		Assert.Equal("he", optimizer.DteTable[0x81]);
		Assert.Equal("in", optimizer.DteTable[0x82]);
	}

	[Fact]
	public void ExportTbl_GeneratesValidFormat() {
		var optimizer = new DteOptimizer();
		optimizer.SetDteEntry(0x80, "th");
		optimizer.SetDteEntry(0x81, "he");

		var tbl = optimizer.ExportTbl();

		Assert.Contains("80=th", tbl);
		Assert.Contains("81=he", tbl);
	}

	[Fact]
	public void ExportAsm_GeneratesValidFormat() {
		var optimizer = new DteOptimizer();
		optimizer.SetDteEntry(0x80, "th");

		var asm = optimizer.ExportAsm("MyDteTable");

		Assert.Contains("MyDteTable:", asm);
		Assert.Contains(".byte", asm);
		Assert.Contains("$80", asm);
	}

	[Fact]
	public void ExportJson_ContainsStats() {
		var optimizer = new DteOptimizer();
		var result = optimizer.GenerateOptimalTable("the the the");

		var json = DteOptimizer.ExportJson(result);

		Assert.Contains("original_size", json);
		Assert.Contains("compressed_size", json);
		Assert.Contains("pairs", json);
	}

	[Fact]
	public void AnalyzeSequences_CountsCorrectly() {
		var optimizer = new DteOptimizer {
			Config = new DteConfig(MinLength: 2, MaxLength: 3)
		};

		var sequences = optimizer.AnalyzeSequences("abcabc");

		// "ab" appears twice
		Assert.Equal(2, sequences["ab"]);
		// "bc" appears twice
		Assert.Equal(2, sequences["bc"]);
		// "abc" appears twice
		Assert.Equal(2, sequences["abc"]);
	}

	[Fact]
	public void AnalyzeSequences_SkipsControlCodes() {
		var optimizer = new DteOptimizer {
			Config = new DteConfig(PreserveControlCodes: true)
		};

		var sequences = optimizer.AnalyzeSequences("test[END]test");

		// Should not contain any sequence with brackets
		Assert.DoesNotContain(sequences, kvp => kvp.Key.Contains('[') || kvp.Key.Contains(']'));
	}

	[Fact]
	public void GenerateOptimalTableIterative_HandlesLongerSequences() {
		var optimizer = new DteOptimizer {
			Config = new DteConfig(MinLength: 2, MaxLength: 4, MinOccurrences: 2)
		};

		var text = "test test test word word word long long long";

		var result = optimizer.GenerateOptimalTableIterative(text);

		Assert.NotEmpty(result.Pairs);
		Assert.True(result.TotalSavings > 0);
	}

	[Fact]
	public void ValidateEncodable_FindsUnrepresentableChars() {
		var optimizer = new DteOptimizer();
		optimizer.LoadTbl("41=A\n42=B\n43=C");

		var unrepresentable = optimizer.ValidateEncodable("ABC日本語");

		// Japanese characters should be unrepresentable
		Assert.Contains('日', unrepresentable);
		Assert.Contains('本', unrepresentable);
		Assert.Contains('語', unrepresentable);
	}

	[Fact]
	public void GetPreset_ReturnsCorrectConfigs() {
		var nes = DteOptimizer.GetPreset("nes");
		Assert.Equal(0x80, nes.StartByte);
		Assert.Equal(0xFE, nes.EndByte);

		var snes = DteOptimizer.GetPreset("snes");
		Assert.Equal(0xFF, snes.EndByte);

		var mte = DteOptimizer.GetPreset("mte");
		Assert.Equal(8, mte.MaxLength);
	}

	[Fact]
	public void Config_DefaultValues() {
		var config = new DteConfig();

		Assert.Equal(0x80, config.StartByte);
		Assert.Equal(0xFE, config.EndByte);
		Assert.Equal(2, config.MinLength);
		Assert.Equal(2, config.MaxLength);
		Assert.Equal(3, config.MinOccurrences);
		Assert.True(config.PreserveControlCodes);
	}

	[Fact]
	public void DtePair_ToTblLine_FormatsCorrectly() {
		var pair = new DtePair(0x80, "th", 10, 10);

		Assert.Equal("80=th", pair.ToTblLine());
		Assert.Contains("used 10x", pair.ToTblLineWithComment());
		Assert.Contains("saves 10 bytes", pair.ToTblLineWithComment());
	}

	[Fact]
	public void DteAnalysisResult_CalculatesPercentSaved() {
		var result = new DteAnalysisResult(
			[],
			OriginalSize: 100,
			CompressedSize: 75,
			TotalSavings: 25,
			CompressionRatio: 0.75
		);

		Assert.Equal(25.0, result.PercentSaved);
	}

	[Fact]
	public void AnalyzeMultiple_CombinesTexts() {
		var optimizer = new DteOptimizer {
			Config = new DteConfig(MinOccurrences: 2)
		};

		var texts = new[] { "hello world", "hello there", "world peace" };

		var result = optimizer.AnalyzeMultiple(texts);

		Assert.NotEmpty(result.Pairs);
		// "hello" or "world" should appear multiple times across texts
	}

	[Fact]
	public void SetDteEntry_UpdatesReverseLookup() {
		var optimizer = new DteOptimizer();

		optimizer.SetDteEntry(0x80, "ab");
		optimizer.SetDteEntry(0x80, "cd"); // Replace

		Assert.Equal("cd", optimizer.DteTable[0x80]);
		Assert.Single(optimizer.DteTable);
	}

	[Fact]
	public void ClearDteTable_RemovesAllEntries() {
		var optimizer = new DteOptimizer();
		optimizer.SetDteEntry(0x80, "ab");
		optimizer.SetDteEntry(0x81, "cd");

		optimizer.ClearDteTable();

		Assert.Empty(optimizer.DteTable);
	}

	[Fact]
	public void Compress_HandlesEmptyText() {
		var optimizer = new DteOptimizer();

		var result = optimizer.Compress("");

		Assert.Empty(result);
	}

	[Fact]
	public void CompressOptimal_HandlesEmptyText() {
		var optimizer = new DteOptimizer();

		var result = optimizer.CompressOptimal("");

		Assert.Empty(result);
	}

	[Fact]
	public void Decompress_HandlesUnknownBytes() {
		var optimizer = new DteOptimizer();

		var data = new byte[] { 0xFF };
		var text = optimizer.Decompress(data);

		// Should produce placeholder for unknown byte
		Assert.Contains("[FF]", text);
	}

	[Fact]
	public void RoundTrip_CompressDecompress() {
		var optimizer = new DteOptimizer();

		// Set up encoding
		optimizer.LoadTbl(string.Join("\n",
			Enumerable.Range(0x20, 95).Select(i => $"{i:X2}={(char)i}")
		));

		optimizer.SetDteEntry(0x80, "th");
		optimizer.SetDteEntry(0x81, "he");
		optimizer.SetDteEntry(0x82, "in");
		optimizer.SetDteEntry(0x83, "er");

		var original = "the there in her";
		var compressed = optimizer.Compress(original);
		var decompressed = optimizer.Decompress(compressed);

		Assert.Equal(original, decompressed);
	}
}
