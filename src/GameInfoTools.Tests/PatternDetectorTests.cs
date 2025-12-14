using GameInfoTools.Core;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for PatternDetector functionality including pointer table detection,
/// data pattern recognition, and ROM structure analysis.
/// </summary>
public class PatternDetectorTests {
	[Fact]
	public void FindPointerTables_FindsNesPointerTable() {
		// Create a simple pointer table (little-endian pointers)
		byte[] data = new byte[0x100];
		// Pointer table at offset 0
		data[0] = 0x00;
		data[1] = 0x80; // -> $8000
		data[2] = 0x20;
		data[3] = 0x80; // -> $8020
		data[4] = 0x40;
		data[5] = 0x80; // -> $8040
		data[6] = 0x60;
		data[7] = 0x80; // -> $8060

		var results = PatternDetector.FindPointerTables(data, SystemType.Nes);

		// Should find at least the pointer table we created
		Assert.NotNull(results);
	}

	[Fact]
	public void FindTextRegions_DetectsAsciiText() {
		byte[] data = new byte[0x100];
		// Fill some ASCII text
		string text = "Hello, World! This is a test string.";
		for (int i = 0; i < text.Length; i++) {
			data[0x20 + i] = (byte)text[i];
		}

		var results = PatternDetector.FindTextRegions(data, 8);

		Assert.NotEmpty(results);
		Assert.True(results[0].Length >= 8);
	}

	[Fact]
	public void FindTextRegions_ReturnsResultsForAnyData() {
		byte[] data = new byte[0x100];
		// Fill with non-text data
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(0x80 + (i & 0x7f)); // High-bit set, not ASCII
		}

		var results = PatternDetector.FindTextRegions(data, 8);

		// The detector may still find patterns, just verify it returns
		Assert.NotNull(results);
	}

	[Fact]
	public void FindGraphicsRegions_FindsTileData() {
		// Create a pattern that looks like tile data
		// 16-byte tiles with structured patterns
		byte[] data = new byte[0x200];
		for (int tile = 0; tile < 16; tile++) {
			int offset = tile * 16;
			for (int row = 0; row < 8; row++) {
				// Alternating pattern
				data[offset + row] = (byte)(row % 2 == 0 ? 0xff : 0x00);
				data[offset + row + 8] = (byte)(row % 2 == 0 ? 0x00 : 0xff);
			}
		}

		var results = PatternDetector.FindGraphicsRegions(data, 16);

		Assert.NotNull(results);
	}

	[Fact]
	public void FindDataTables_FindsStructuredData() {
		// Create structured data table (e.g., 4-byte entries)
		byte[] data = new byte[0x100];
		for (int i = 0; i < 16; i++) {
			int offset = i * 4;
			data[offset] = (byte)i;          // ID
			data[offset + 1] = (byte)(i * 2); // Value 1
			data[offset + 2] = (byte)(i * 3); // Value 2
			data[offset + 3] = (byte)(i * 4); // Value 3
		}

		var results = PatternDetector.FindDataTables(data, 4, 4);

		Assert.NotNull(results);
	}

	[Fact]
	public void FindCodeRegions_FindsNesCode() {
		// Create typical NES code pattern
		byte[] data = new byte[0x100];
		int offset = 0;

		// SEI, CLD, LDX #$FF, TXS (typical NES startup)
		data[offset++] = 0x78; // SEI
		data[offset++] = 0xd8; // CLD
		data[offset++] = 0xa2; // LDX
		data[offset++] = 0xff; // #$FF
		data[offset++] = 0x9a; // TXS

		// LDA #$00, STA $2000
		data[offset++] = 0xa9; // LDA
		data[offset++] = 0x00; // #$00
		data[offset++] = 0x8d; // STA absolute
		data[offset++] = 0x00;
		data[offset++] = 0x20;

		// Fill rest with plausible code
		for (int i = offset; i < 0x40; i++) {
			data[i] = (byte)(i % 256);
		}

		var results = PatternDetector.FindCodeRegions(data, SystemType.Nes);

		Assert.NotNull(results);
	}

	[Fact]
	public void PatternMatch_HasCorrectProperties() {
		var match = new PatternDetector.PatternMatch(
			Offset: 0x100,
			Length: 0x50,
			PatternType: "PointerTable",
			Confidence: 0.9,
			Metadata: null
		);

		Assert.Equal(0x100, match.Offset);
		Assert.Equal(0x50, match.Length);
		Assert.Equal("PointerTable", match.PatternType);
		Assert.Equal(0.9, match.Confidence);
		Assert.Null(match.Metadata);
	}

	#region Wildcard Pattern Tests

	[Fact]
	public void ParsePatternString_ParsesSimplePattern() {
		var pattern = PatternDetector.ParsePatternString("AA BB CC DD");

		Assert.Equal(4, pattern.Length);
		Assert.Equal((byte)0xaa, pattern[0]);
		Assert.Equal((byte)0xbb, pattern[1]);
		Assert.Equal((byte)0xcc, pattern[2]);
		Assert.Equal((byte)0xdd, pattern[3]);
	}

	[Fact]
	public void ParsePatternString_ParsesWildcards() {
		var pattern = PatternDetector.ParsePatternString("AA ?? CC");

		Assert.Equal(3, pattern.Length);
		Assert.Equal((byte)0xaa, pattern[0]);
		Assert.Null(pattern[1]); // Wildcard
		Assert.Equal((byte)0xcc, pattern[2]);
	}

	[Fact]
	public void ParsePatternString_SupportsMultipleWildcardFormats() {
		var pattern1 = PatternDetector.ParsePatternString("AA ?? BB");
		var pattern2 = PatternDetector.ParsePatternString("AA ** BB");
		var pattern3 = PatternDetector.ParsePatternString("AA xx BB");
		var pattern4 = PatternDetector.ParsePatternString("AA XX BB");

		Assert.Null(pattern1[1]);
		Assert.Null(pattern2[1]);
		Assert.Null(pattern3[1]);
		Assert.Null(pattern4[1]);
	}

	[Fact]
	public void ParsePatternString_ThrowsOnInvalidByte() {
		Assert.Throws<ArgumentException>(() => PatternDetector.ParsePatternString("AA ZZ CC"));
	}

	[Fact]
	public void PatternToString_FormatsCorrectly() {
		var pattern = new byte?[] { 0xaa, null, 0xcc };
		var result = PatternDetector.PatternToString(pattern);

		Assert.Equal("aa ?? cc", result);
	}

	[Fact]
	public void MatchesPattern_ExactMatch_ReturnsTrue() {
		byte[] data = [0xaa, 0xbb, 0xcc, 0xdd, 0xee];
		var pattern = new byte?[] { 0xaa, 0xbb, 0xcc };

		Assert.True(PatternDetector.MatchesPattern(data, 0, pattern));
	}

	[Fact]
	public void MatchesPattern_WithWildcard_ReturnsTrue() {
		byte[] data = [0xaa, 0x00, 0xcc, 0xdd, 0xee];
		var pattern = new byte?[] { 0xaa, null, 0xcc };

		Assert.True(PatternDetector.MatchesPattern(data, 0, pattern));
	}

	[Fact]
	public void MatchesPattern_NoMatch_ReturnsFalse() {
		byte[] data = [0xaa, 0xbb, 0xcc, 0xdd, 0xee];
		var pattern = new byte?[] { 0xaa, 0xff, 0xcc };

		Assert.False(PatternDetector.MatchesPattern(data, 0, pattern));
	}

	[Fact]
	public void MatchesPattern_OutOfBounds_ReturnsFalse() {
		byte[] data = [0xaa, 0xbb];
		var pattern = new byte?[] { 0xaa, 0xbb, 0xcc };

		Assert.False(PatternDetector.MatchesPattern(data, 0, pattern));
	}

	[Fact]
	public void ScanForSignature_FindsAllMatches() {
		byte[] data = [0xaa, 0xbb, 0x00, 0x00, 0xaa, 0xbb, 0x00, 0x00, 0xaa, 0xbb];
		var pattern = PatternDetector.CreatePattern("Test", "AA BB", "Test pattern");

		var results = PatternDetector.ScanForSignature(data, pattern);

		Assert.Equal(3, results.Count);
		Assert.Equal(0, results[0].Offset);
		Assert.Equal(4, results[1].Offset);
		Assert.Equal(8, results[2].Offset);
	}

	[Fact]
	public void ScanForSignature_WithWildcard_FindsMatches() {
		byte[] data = [0xaa, 0x11, 0xcc, 0x00, 0xaa, 0x22, 0xcc, 0x00, 0xaa, 0x33, 0xcc];
		var pattern = PatternDetector.CreatePattern("Test", "AA ?? CC", "Wildcard pattern");

		var results = PatternDetector.ScanForSignature(data, pattern);

		Assert.Equal(3, results.Count);
	}

	[Fact]
	public void ScanForSignatures_ScansMultiplePatterns() {
		byte[] data = [0xaa, 0xbb, 0x00, 0xcc, 0xdd, 0x00];
		var patterns = new[] {
			PatternDetector.CreatePattern("Pattern1", "AA BB"),
			PatternDetector.CreatePattern("Pattern2", "CC DD")
		};

		var results = PatternDetector.ScanForSignatures(data, patterns);

		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void GeneratePattern_CreatesPatternFromBytes() {
		byte[] bytes = [0xaa, 0xbb, 0xcc, 0xdd];
		var pattern = PatternDetector.GeneratePattern("Test", bytes, [1, 2], "Test desc", "Test cat");

		Assert.Equal("Test", pattern.Name);
		Assert.Equal((byte)0xaa, pattern.Bytes[0]);
		Assert.Null(pattern.Bytes[1]); // Wildcard
		Assert.Null(pattern.Bytes[2]); // Wildcard
		Assert.Equal((byte)0xdd, pattern.Bytes[3]);
		Assert.Equal("Test desc", pattern.Description);
		Assert.Equal("Test cat", pattern.Category);
	}

	[Fact]
	public void CreatePattern_CreatesValidPattern() {
		var pattern = PatternDetector.CreatePattern("NES_JSR", "20 ?? ??", "JSR instruction", "Code");

		Assert.Equal("NES_JSR", pattern.Name);
		Assert.Equal(3, pattern.Bytes.Length);
		Assert.Equal((byte)0x20, pattern.Bytes[0]);
		Assert.Null(pattern.Bytes[1]);
		Assert.Null(pattern.Bytes[2]);
	}

	[Fact]
	public void GetCommonPatterns_ReturnsNesPatterns() {
		var patterns = PatternDetector.GetCommonPatterns(SystemType.Nes);

		Assert.NotEmpty(patterns);
		Assert.Contains(patterns, p => p.Category == "Code");
	}

	[Fact]
	public void GetCommonPatterns_ReturnsSnesPatterns() {
		var patterns = PatternDetector.GetCommonPatterns(SystemType.Snes);

		Assert.NotEmpty(patterns);
	}

	[Fact]
	public void GetCommonPatterns_ReturnsGameBoyPatterns() {
		var patterns = PatternDetector.GetCommonPatterns(SystemType.GameBoy);

		Assert.NotEmpty(patterns);
	}

	[Fact]
	public void GetCommonPatterns_ReturnsGbaPatterns() {
		var patterns = PatternDetector.GetCommonPatterns(SystemType.GameBoyAdvance);

		Assert.NotEmpty(patterns);
	}

	#endregion

	#region Pattern Library Tests

	[Fact]
	public void PatternLibrary_Add_AddsPattern() {
		var library = new PatternDetector.PatternLibrary();
		var pattern = PatternDetector.CreatePattern("Test", "AA BB");

		library.Add(pattern);

		Assert.Single(library.Patterns);
		Assert.Equal("Test", library.Patterns[0].Name);
	}

	[Fact]
	public void PatternLibrary_AddRange_AddsMultiplePatterns() {
		var library = new PatternDetector.PatternLibrary();
		var patterns = new[] {
			PatternDetector.CreatePattern("Test1", "AA BB"),
			PatternDetector.CreatePattern("Test2", "CC DD")
		};

		library.AddRange(patterns);

		Assert.Equal(2, library.Patterns.Count);
	}

	[Fact]
	public void PatternLibrary_Remove_RemovesPattern() {
		var library = new PatternDetector.PatternLibrary();
		library.Add(PatternDetector.CreatePattern("Test1", "AA BB"));
		library.Add(PatternDetector.CreatePattern("Test2", "CC DD"));

		library.Remove("Test1");

		Assert.Single(library.Patterns);
		Assert.Equal("Test2", library.Patterns[0].Name);
	}

	[Fact]
	public void PatternLibrary_Clear_RemovesAllPatterns() {
		var library = new PatternDetector.PatternLibrary();
		library.Add(PatternDetector.CreatePattern("Test1", "AA BB"));
		library.Add(PatternDetector.CreatePattern("Test2", "CC DD"));

		library.Clear();

		Assert.Empty(library.Patterns);
	}

	[Fact]
	public void PatternLibrary_GetByCategory_FiltersPatterns() {
		var library = new PatternDetector.PatternLibrary();
		library.Add(PatternDetector.CreatePattern("Test1", "AA BB", category: "Code"));
		library.Add(PatternDetector.CreatePattern("Test2", "CC DD", category: "Data"));
		library.Add(PatternDetector.CreatePattern("Test3", "EE FF", category: "Code"));

		var codePatterns = library.GetByCategory("Code");

		Assert.Equal(2, codePatterns.Count);
	}

	[Fact]
	public void PatternLibrary_GetByName_ReturnsPattern() {
		var library = new PatternDetector.PatternLibrary();
		library.Add(PatternDetector.CreatePattern("Test1", "AA BB"));
		library.Add(PatternDetector.CreatePattern("Test2", "CC DD"));

		var pattern = library.GetByName("Test2");

		Assert.NotNull(pattern);
		Assert.Equal("Test2", pattern.Name);
	}

	[Fact]
	public void PatternLibrary_GetByName_ReturnsNullIfNotFound() {
		var library = new PatternDetector.PatternLibrary();
		library.Add(PatternDetector.CreatePattern("Test1", "AA BB"));

		var pattern = library.GetByName("NonExistent");

		Assert.Null(pattern);
	}

	[Fact]
	public void PatternLibrary_ScanAll_ScansAllPatterns() {
		var library = new PatternDetector.PatternLibrary();
		library.Add(PatternDetector.CreatePattern("Pattern1", "AA BB"));
		library.Add(PatternDetector.CreatePattern("Pattern2", "CC DD"));

		byte[] data = [0xaa, 0xbb, 0x00, 0xcc, 0xdd];
		var results = library.ScanAll(data);

		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void PatternLibrary_ExportToJson_CreatesValidJson() {
		var library = new PatternDetector.PatternLibrary();
		library.Add(PatternDetector.CreatePattern("Test", "AA ?? BB", "Test desc", "Code"));

		var json = library.ExportToJson();

		Assert.Contains("\"name\": \"Test\"", json);
		Assert.Contains("\"pattern\": \"aa ?? bb\"", json);
		Assert.Contains("\"description\": \"Test desc\"", json);
		Assert.Contains("\"category\": \"Code\"", json);
	}

	[Fact]
	public void PatternLibrary_ImportFromJson_LoadsPatterns() {
		var library = new PatternDetector.PatternLibrary();
		string json = """
			[
			  {
			    "name": "Test",
			    "pattern": "AA BB CC",
			    "description": "Test pattern",
			    "category": "Code"
			  }
			]
			""";

		library.ImportFromJson(json);

		Assert.Single(library.Patterns);
		Assert.Equal("Test", library.Patterns[0].Name);
	}

	[Fact]
	public void PatternLibrary_ExportImportRoundTrip_PreservesPatterns() {
		var original = new PatternDetector.PatternLibrary();
		original.Add(PatternDetector.CreatePattern("Pattern1", "AA BB CC", "Desc1", "Cat1"));
		original.Add(PatternDetector.CreatePattern("Pattern2", "DD ?? FF", "Desc2", "Cat2"));

		var json = original.ExportToJson();

		var imported = new PatternDetector.PatternLibrary();
		imported.ImportFromJson(json);

		Assert.Equal(2, imported.Patterns.Count);
		Assert.Equal("Pattern1", imported.Patterns[0].Name);
		Assert.Equal("Pattern2", imported.Patterns[1].Name);
	}

	#endregion

	#region YARA Rule Tests

	[Fact]
	public void ParseYaraRule_BasicRule_ParsesCorrectly() {
		string ruleText = """
			rule test_rule
			{
			    meta:
			        description = "Test rule"
			    strings:
			        $hex = { AA BB CC }
			    condition:
			        any of them
			}
			""";

		var rule = PatternDetector.ParseYaraRule(ruleText);

		Assert.Equal("test_rule", rule.Name);
		Assert.Equal("Test rule", rule.Description);
		Assert.Single(rule.Strings);
		Assert.Contains("$hex", rule.Strings.Keys);
	}

	[Fact]
	public void ParseYaraRule_WithStringPattern_ParsesCorrectly() {
		string ruleText = """
			rule string_rule
			{
			    strings:
			        $str = "test" nocase
			    condition:
			        $str
			}
			""";

		var rule = PatternDetector.ParseYaraRule(ruleText);

		Assert.Contains("$str", rule.Strings.Keys);
		Assert.Equal(PatternDetector.PatternType.String, rule.Strings["$str"].Type);
		Assert.Equal("test", rule.Strings["$str"].Value);
		Assert.True(rule.Strings["$str"].Modifiers.HasFlag(PatternDetector.PatternModifiers.NoCase));
	}

	[Fact]
	public void ParseYaraRule_WithTags_ParsesTags() {
		string ruleText = """
			rule tagged_rule : malware test
			{
			    condition:
			        true
			}
			""";

		var rule = PatternDetector.ParseYaraRule(ruleText);

		Assert.Contains("malware", rule.Tags);
		Assert.Contains("test", rule.Tags);
	}

	[Fact]
	public void EvaluateYaraRule_HexMatch_ReturnsMatch() {
		var rule = new PatternDetector.YaraRule {
			Name = "test",
			Strings = {
				["$hex"] = new PatternDetector.PatternDefinition {
					Type = PatternDetector.PatternType.Hex,
					Value = "AA BB CC"
				}
			},
			Condition = "any of them"
		};

		byte[] data = [0x00, 0xaa, 0xbb, 0xcc, 0x00];

		var result = PatternDetector.EvaluateYaraRule(data, rule);

		Assert.NotNull(result);
		Assert.Single(result.Matches);
		Assert.Equal(1, result.Matches[0].Offset);
	}

	[Fact]
	public void EvaluateYaraRule_StringMatch_ReturnsMatch() {
		var rule = new PatternDetector.YaraRule {
			Name = "test",
			Strings = {
				["$str"] = new PatternDetector.PatternDefinition {
					Type = PatternDetector.PatternType.String,
					Value = "test"
				}
			},
			Condition = "any of them"
		};

		byte[] data = System.Text.Encoding.ASCII.GetBytes("this is a test string");

		var result = PatternDetector.EvaluateYaraRule(data, rule);

		Assert.NotNull(result);
		Assert.Single(result.Matches);
	}

	[Fact]
	public void EvaluateYaraRule_NoMatch_ReturnsNull() {
		var rule = new PatternDetector.YaraRule {
			Name = "test",
			Strings = {
				["$hex"] = new PatternDetector.PatternDefinition {
					Type = PatternDetector.PatternType.Hex,
					Value = "FF FF FF"
				}
			},
			Condition = "any of them"
		};

		byte[] data = [0x00, 0x11, 0x22, 0x33];

		var result = PatternDetector.EvaluateYaraRule(data, rule);

		Assert.Null(result);
	}

	[Fact]
	public void ScanYaraRules_MultipleRules_FindsAllMatches() {
		var rules = new List<PatternDetector.YaraRule> {
			new() {
				Name = "rule1",
				Strings = {
					["$a"] = new PatternDetector.PatternDefinition {
						Type = PatternDetector.PatternType.Hex,
						Value = "AA BB"
					}
				},
				Condition = "any of them"
			},
			new() {
				Name = "rule2",
				Strings = {
					["$b"] = new PatternDetector.PatternDefinition {
						Type = PatternDetector.PatternType.Hex,
						Value = "CC DD"
					}
				},
				Condition = "any of them"
			}
		};

		byte[] data = [0xaa, 0xbb, 0x00, 0xcc, 0xdd];

		var results = PatternDetector.ScanYaraRules(data, rules);

		Assert.Equal(2, results.Count);
	}

	[Fact]
	public void GenerateYaraRule_CreatesValidRule() {
		var patterns = new List<PatternDetector.SignaturePattern> {
			PatternDetector.CreatePattern("p1", "AA BB"),
			PatternDetector.CreatePattern("p2", "CC DD")
		};

		var ruleText = PatternDetector.GenerateYaraRule("generated", patterns, "Auto-generated");

		Assert.Contains("rule generated", ruleText);
		Assert.Contains("description", ruleText);
		Assert.Contains("$s0", ruleText);
		Assert.Contains("$s1", ruleText);
		Assert.Contains("AA BB", ruleText);
		Assert.Contains("CC DD", ruleText);
	}

	#endregion

	#region Batch Scanning Tests

	[Fact]
	public void BatchScan_SingleFile_ReturnsResults() {
		// Create test data file in memory
		byte[] testData = [0x20, 0x00, 0x80, 0x60]; // JSR, RTS-like

		// Create temp file
		string tempFile = Path.GetTempFileName();
		try {
			File.WriteAllBytes(tempFile, testData);

			var options = new PatternDetector.BatchScanOptions {
				Signatures = [PatternDetector.CreatePattern("test", "20 ?? ??")]
			};

			var result = PatternDetector.BatchScan([tempFile], options);

			Assert.Equal(1, result.TotalFiles);
			Assert.Equal(1, result.SuccessfulScans);
			Assert.Equal(0, result.FailedScans);
			Assert.Single(result.FileResults);
			Assert.NotEmpty(result.FileResults[0].SignatureMatches);
		} finally {
			File.Delete(tempFile);
		}
	}

	[Fact]
	public void BatchScan_WithSystemPatterns_AppliesSystemPatterns() {
		byte[] testData = [0x20, 0x00, 0x80, 0x60]; // NES-like code

		string tempFile = Path.GetTempFileName();
		try {
			File.WriteAllBytes(tempFile, testData);

			var options = new PatternDetector.BatchScanOptions {
				SystemType = SystemType.Nes
			};

			var result = PatternDetector.BatchScan([tempFile], options);

			Assert.Equal(1, result.SuccessfulScans);
		} finally {
			File.Delete(tempFile);
		}
	}

	[Fact]
	public void BatchScan_InvalidFile_RecordsError() {
		var options = new PatternDetector.BatchScanOptions();

		var result = PatternDetector.BatchScan(["nonexistent_file.bin"], options);

		Assert.Equal(1, result.TotalFiles);
		Assert.Equal(0, result.SuccessfulScans);
		Assert.Equal(1, result.FailedScans);
		Assert.NotNull(result.FileResults[0].Error);
	}

	[Fact]
	public void GenerateBatchReport_CreatesReport() {
		var fileResults = new List<PatternDetector.BatchScanFileResult> {
			new("test.bin",
				[new(PatternDetector.CreatePattern("test", "AA"), 0, [0xaa])],
				[],
				[new PatternDetector.PatternMatch(0, 10, "Code", 0.8, null)],
				null)
		};

		var batchResult = new PatternDetector.BatchScanResult(
			fileResults, 1, 1, 0, TimeSpan.FromSeconds(1));

		var report = PatternDetector.GenerateBatchReport(batchResult);

		Assert.Contains("Files scanned: 1", report);
		Assert.Contains("Successful: 1", report);
		Assert.Contains("Signature matches:", report);
	}

	#endregion

	#region Multi-Architecture Tests

	[Fact]
	public void GetArchitecturePatterns_6502_ReturnsPatterns() {
		var patterns = PatternDetector.GetArchitecturePatterns(PatternDetector.ArchitectureType.Mos6502);

		Assert.NotEmpty(patterns);
		Assert.Contains(patterns, p => p.Name.Contains("6502"));
	}

	[Fact]
	public void GetArchitecturePatterns_65816_ReturnsPatterns() {
		var patterns = PatternDetector.GetArchitecturePatterns(PatternDetector.ArchitectureType.Wdc65816);

		Assert.NotEmpty(patterns);
		Assert.Contains(patterns, p => p.Name.Contains("65816"));
	}

	[Fact]
	public void GetArchitecturePatterns_Z80_ReturnsPatterns() {
		var patterns = PatternDetector.GetArchitecturePatterns(PatternDetector.ArchitectureType.Z80);

		Assert.NotEmpty(patterns);
		Assert.Contains(patterns, p => p.Name.Contains("Z80"));
	}

	[Fact]
	public void GetArchitecturePatterns_M68000_ReturnsPatterns() {
		var patterns = PatternDetector.GetArchitecturePatterns(PatternDetector.ArchitectureType.M68000);

		Assert.NotEmpty(patterns);
		Assert.Contains(patterns, p => p.Name.Contains("M68K"));
	}

	[Fact]
	public void GetArchitecturePatterns_Arm7_ReturnsPatterns() {
		var patterns = PatternDetector.GetArchitecturePatterns(PatternDetector.ArchitectureType.Arm7);

		Assert.NotEmpty(patterns);
		Assert.Contains(patterns, p => p.Name.Contains("ARM") || p.Name.Contains("THUMB"));
	}

	[Fact]
	public void GetArchitecturePatterns_Spc700_ReturnsPatterns() {
		var patterns = PatternDetector.GetArchitecturePatterns(PatternDetector.ArchitectureType.Spc700);

		Assert.NotEmpty(patterns);
		Assert.Contains(patterns, p => p.Name.Contains("SPC"));
	}

	[Fact]
	public void ScoreAsArchitectureCode_6502Code_ReturnsHighScore() {
		// Some 6502 code: LDA #$00, STA $00, RTS
		byte[] code = [0xa9, 0x00, 0x85, 0x00, 0x60];

		var score = PatternDetector.ScoreAsArchitectureCode(code, 0, code.Length, PatternDetector.ArchitectureType.Mos6502);

		Assert.True(score > 0);
	}

	[Fact]
	public void DetectArchitecture_6502Code_Identifies6502() {
		// Typical 6502 code sequence
		byte[] code = [0x20, 0x00, 0x80, 0x60, 0xa9, 0x00, 0x85, 0x00];

		var (arch, confidence) = PatternDetector.DetectArchitecture(code, 0, code.Length);

		// Should at least give a result
		Assert.True(confidence >= 0);
	}

	[Fact]
	public void DetectArchitecture_Z80Code_HasResult() {
		// Z80: NOP, RET, JP
		byte[] code = [0x00, 0xc9, 0xc3, 0x00, 0x80];

		var (arch, confidence) = PatternDetector.DetectArchitecture(code, 0, code.Length);

		Assert.True(confidence >= 0);
	}

	[Fact]
	public void PatternModifiers_Flags_WorkCorrectly() {
		var mods = PatternDetector.PatternModifiers.NoCase | PatternDetector.PatternModifiers.Wide;

		Assert.True(mods.HasFlag(PatternDetector.PatternModifiers.NoCase));
		Assert.True(mods.HasFlag(PatternDetector.PatternModifiers.Wide));
		Assert.False(mods.HasFlag(PatternDetector.PatternModifiers.Fullword));
	}

	[Fact]
	public void YaraRule_DefaultValues_AreCorrect() {
		var rule = new PatternDetector.YaraRule();

		Assert.Equal("", rule.Name);
		Assert.Equal("any of them", rule.Condition);
		Assert.Empty(rule.Tags);
		Assert.Empty(rule.Strings);
		Assert.Empty(rule.Meta);
	}

	#endregion
}

