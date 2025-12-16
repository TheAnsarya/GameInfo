using GameInfoTools.Text;

namespace GameInfoTools.Tests.Text;

/// <summary>
/// Tests for the LocalizationManager service.
/// </summary>
public class LocalizationManagerTests {
	private static LocalizationManager CreateManagerWithLocales() {
		var manager = new LocalizationManager();
		manager.AddLocale("en", "English", "English");
		manager.AddLocale("ja", "Japanese", "日本語");
		manager.AddLocale("es", "Spanish", "Español");
		return manager;
	}

	private static LocalizationManager CreateManagerWithStrings() {
		var manager = CreateManagerWithLocales();

		// Add string keys to all locales first
		manager.AddStringKey("greeting");
		manager.AddStringKey("farewell");
		manager.AddStringKey("item_sword", "item");
		manager.AddStringKey("item_shield", "item");
		manager.AddStringKey("dialogue_intro", "dialogue");

		// Add English translations
		manager.SetString("greeting", "Hello!", "en");
		manager.SetString("farewell", "Goodbye!", "en");
		manager.SetString("item_sword", "Iron Sword", "en", "item");
		manager.SetString("item_shield", "Wooden Shield", "en", "item");
		manager.SetString("dialogue_intro", "Welcome to the adventure!", "en", "dialogue");

		// Add Japanese translations (only some)
		manager.SetString("greeting", "こんにちは！", "ja");
		manager.SetString("farewell", "さようなら！", "ja");

		return manager;
	}

	#region Constructor and Schema Tests

	[Fact]
	public void NewManager_HasNoLocales() {
		var manager = new LocalizationManager();
		Assert.Empty(manager.AvailableLocales);
	}

	[Fact]
	public void NewManager_DefaultLocaleIsEnglish() {
		var manager = new LocalizationManager();
		Assert.Equal("en", manager.CurrentLocale);
	}

	[Fact]
	public void SetSchema_StoresSchema() {
		var manager = new LocalizationManager();
		var schema = LocalizationManager.CreateNesSchema();

		manager.SetSchema(schema);

		Assert.NotNull(manager.Schema);
		Assert.Equal("NES Localization", manager.Schema.Name);
	}

	[Fact]
	public void CreateNesSchema_HasExpectedCategories() {
		var schema = LocalizationManager.CreateNesSchema();

		Assert.Contains("dialogue", schema.Categories.Keys);
		Assert.Contains("menu", schema.Categories.Keys);
		Assert.Contains("item", schema.Categories.Keys);
		Assert.Equal(128, schema.MaxStringLength);
	}

	[Fact]
	public void CreateSnesSchema_HasExpectedCategories() {
		var schema = LocalizationManager.CreateSnesSchema();

		Assert.Contains("dialogue", schema.Categories.Keys);
		Assert.Contains("location", schema.Categories.Keys);
		Assert.Equal(256, schema.MaxStringLength);
		Assert.True(schema.SupportsVariableWidth);
	}

	#endregion

	#region Locale Management Tests

	[Fact]
	public void AddLocale_AddsNewLocale() {
		var manager = new LocalizationManager();

		bool result = manager.AddLocale("en", "English");

		Assert.True(result);
		Assert.Contains("en", manager.AvailableLocales);
	}

	[Fact]
	public void AddLocale_WithDuplicate_ReturnsFalse() {
		var manager = new LocalizationManager();
		manager.AddLocale("en", "English");

		bool result = manager.AddLocale("en", "English");

		Assert.False(result);
	}

	[Fact]
	public void AddLocale_WithEmptyCode_ReturnsFalse() {
		var manager = new LocalizationManager();

		bool result = manager.AddLocale("", "Empty");

		Assert.False(result);
	}

	[Fact]
	public void RemoveLocale_RemovesExistingLocale() {
		var manager = CreateManagerWithLocales();

		bool result = manager.RemoveLocale("ja");

		Assert.True(result);
		Assert.DoesNotContain("ja", manager.AvailableLocales);
	}

	[Fact]
	public void RemoveLocale_CannotRemoveCurrentLocale() {
		var manager = CreateManagerWithLocales();
		manager.CurrentLocale = "en";

		bool result = manager.RemoveLocale("en");

		Assert.False(result);
		Assert.Contains("en", manager.AvailableLocales);
	}

	[Fact]
	public void CurrentLocale_CanBeChanged() {
		var manager = CreateManagerWithLocales();

		manager.CurrentLocale = "ja";

		Assert.Equal("ja", manager.CurrentLocale);
	}

	[Fact]
	public void CurrentLocale_IgnoresInvalidLocale() {
		var manager = CreateManagerWithLocales();
		manager.CurrentLocale = "en";

		manager.CurrentLocale = "invalid";

		Assert.Equal("en", manager.CurrentLocale);
	}

	[Fact]
	public void GetLocaleData_ReturnsCorrectData() {
		var manager = CreateManagerWithLocales();

		var data = manager.GetLocaleData("ja");

		Assert.NotNull(data);
		Assert.Equal("ja", data.Code);
		Assert.Equal("Japanese", data.Name);
		Assert.Equal("日本語", data.NativeName);
	}

	[Fact]
	public void GetLocaleData_ReturnsNullForInvalidLocale() {
		var manager = CreateManagerWithLocales();

		var data = manager.GetLocaleData("invalid");

		Assert.Null(data);
	}

	#endregion

	#region String Management Tests

	[Fact]
	public void SetString_AddsNewString() {
		var manager = CreateManagerWithLocales();

		var result = manager.SetString("test_key", "Test Value", "en");

		Assert.True(result.Success);
		Assert.Equal("test_key", result.Key);
	}

	[Fact]
	public void SetString_UpdatesExistingString() {
		var manager = CreateManagerWithStrings();

		var result = manager.SetString("greeting", "Hi there!", "en");

		Assert.True(result.Success);
		Assert.Equal("Hi there!", manager.GetString("greeting", "en"));
	}

	[Fact]
	public void SetString_WithInvalidLocale_ReturnsFalse() {
		var manager = CreateManagerWithLocales();

		var result = manager.SetString("test", "value", "invalid");

		Assert.False(result.Success);
		Assert.Equal("Locale not found", result.Error);
	}

	[Fact]
	public void SetString_ExceedingMaxLength_ReturnsFalse() {
		var manager = CreateManagerWithLocales();
		var schema = new LocalizationManager.LocalizationSchema {
			MaxStringLength = 10
		};
		manager.SetSchema(schema);

		var result = manager.SetString("test", "This is way too long", "en");

		Assert.False(result.Success);
		Assert.Contains("exceeds max length", result.Error);
	}

	[Fact]
	public void GetString_ReturnsCorrectValue() {
		var manager = CreateManagerWithStrings();

		var value = manager.GetString("greeting", "en");

		Assert.Equal("Hello!", value);
	}

	[Fact]
	public void GetString_UsesCurrentLocaleByDefault() {
		var manager = CreateManagerWithStrings();
		manager.CurrentLocale = "en";

		var value = manager.GetString("greeting");

		Assert.Equal("Hello!", value);
	}

	[Fact]
	public void GetString_ReturnsNullForMissingKey() {
		var manager = CreateManagerWithStrings();

		var value = manager.GetString("nonexistent", "en");

		Assert.Null(value);
	}

	[Fact]
	public void GetStrings_ReturnsAllStringsForLocale() {
		var manager = CreateManagerWithStrings();

		var strings = manager.GetStrings("en");

		Assert.Equal(5, strings.Count);
	}

	[Fact]
	public void AddStringKey_AddsToAllLocales() {
		var manager = CreateManagerWithLocales();

		manager.AddStringKey("new_key", "menu", "Menu context");

		Assert.NotNull(manager.GetLocaleData("en")?.Strings["new_key"]);
		Assert.NotNull(manager.GetLocaleData("ja")?.Strings["new_key"]);
		Assert.NotNull(manager.GetLocaleData("es")?.Strings["new_key"]);
	}

	[Fact]
	public void RemoveStringKey_RemovesFromAllLocales() {
		var manager = CreateManagerWithStrings();

		manager.RemoveStringKey("greeting");

		Assert.Null(manager.GetString("greeting", "en"));
		Assert.Null(manager.GetString("greeting", "ja"));
	}

	[Fact]
	public void MarkForReview_SetsReviewFlag() {
		var manager = CreateManagerWithStrings();

		manager.MarkForReview("greeting", "en", true);

		var data = manager.GetLocaleData("en");
		Assert.True(data?.Strings["greeting"].NeedsReview);
	}

	[Fact]
	public void AddComment_SetsComment() {
		var manager = CreateManagerWithStrings();

		manager.AddComment("greeting", "Standard greeting message", "en");

		var data = manager.GetLocaleData("en");
		Assert.Equal("Standard greeting message", data?.Strings["greeting"].Comment);
	}

	#endregion

	#region Character Table Tests

	[Fact]
	public void SetCharacterTable_StoresTable() {
		var manager = CreateManagerWithLocales();
		var table = new Dictionary<byte, string> {
			[0x00] = "A",
			[0x01] = "B",
			[0x02] = "C"
		};

		manager.SetCharacterTable("en", table);

		var retrieved = manager.GetCharacterTable("en");
		Assert.Equal(3, retrieved.Count);
		Assert.Equal("A", retrieved[0x00]);
	}

	[Fact]
	public void GetCharacterTable_UsesCurrentLocale() {
		var manager = CreateManagerWithLocales();
		manager.SetCharacterTable("en", new Dictionary<byte, string> { [0x00] = "X" });
		manager.CurrentLocale = "en";

		var table = manager.GetCharacterTable();

		Assert.Single(table);
	}

	[Fact]
	public void SetDteEntry_StoresDteMapping() {
		var manager = CreateManagerWithLocales();

		manager.SetDteEntry("en", "th", [0xf0]);

		var dte = manager.GetDteTable("en");
		Assert.Contains("th", dte.Keys);
		Assert.Equal([0xf0], dte["th"]);
	}

	#endregion

	#region Search Tests

	[Fact]
	public void SearchStrings_FindsMatchingStrings() {
		var manager = CreateManagerWithStrings();

		var results = manager.SearchStrings("Sword", "en");

		Assert.Single(results);
		Assert.Equal("item_sword", results[0].Key);
	}

	[Fact]
	public void SearchStrings_CaseInsensitiveByDefault() {
		var manager = CreateManagerWithStrings();

		var results = manager.SearchStrings("sword", "en");

		Assert.Single(results);
	}

	[Fact]
	public void SearchStrings_CaseSensitiveWhenSpecified() {
		var manager = CreateManagerWithStrings();

		// "Iron" appears only in the value "Iron Sword", not in the key
		// So searching for "iron" (lowercase) case-sensitively should find nothing
		var results = manager.SearchStrings("iron", "en", caseSensitive: true);

		Assert.Empty(results);
	}

	[Fact]
	public void GetStringsByCategory_ReturnsCorrectStrings() {
		var manager = CreateManagerWithStrings();

		var items = manager.GetStringsByCategory("item", "en");

		Assert.Equal(2, items.Count);
		Assert.All(items, s => Assert.Equal("item", s.Category));
	}

	[Fact]
	public void GetUntranslatedStrings_ReturnsCorrectStrings() {
		var manager = CreateManagerWithStrings();

		var untranslated = manager.GetUntranslatedStrings("ja");

		Assert.Equal(3, untranslated.Count);  // item_sword, item_shield, dialogue_intro
	}

	[Fact]
	public void GetStringsNeedingReview_ReturnsMarkedStrings() {
		var manager = CreateManagerWithStrings();
		manager.MarkForReview("greeting", "en", true);
		manager.MarkForReview("farewell", "en", true);

		var needsReview = manager.GetStringsNeedingReview("en");

		Assert.Equal(2, needsReview.Count);
	}

	#endregion

	#region Import/Export Tests

	[Fact]
	public void ExportToJson_ReturnsValidJson() {
		var manager = CreateManagerWithStrings();

		var json = manager.ExportToJson();

		Assert.Contains("en", json);
		Assert.Contains("greeting", json);
		Assert.Contains("Hello!", json);
	}

	[Fact]
	public void ExportLocaleToJson_ReturnsLocaleData() {
		var manager = CreateManagerWithStrings();

		var json = manager.ExportLocaleToJson("en");

		Assert.Contains("greeting", json);
		Assert.DoesNotContain("日本語", json);  // Shouldn't include Japanese
	}

	[Fact]
	public void ImportFromJson_ImportsData() {
		var manager = new LocalizationManager();
		var json = """
		{
			"fr": {
				"Code": "fr",
				"Name": "French",
				"NativeName": "Français",
				"Strings": {
					"test": { "Key": "test", "Value": "Bonjour" }
				}
			}
		}
		""";

		bool result = manager.ImportFromJson(json);

		Assert.True(result);
		Assert.Contains("fr", manager.AvailableLocales);
	}

	[Fact]
	public void ImportLocaleFromJson_ImportsSpecificLocale() {
		var manager = CreateManagerWithLocales();
		var json = """
		{
			"Code": "de",
			"Name": "German",
			"NativeName": "Deutsch",
			"Strings": {
				"test": { "Key": "test", "Value": "Hallo" }
			}
		}
		""";

		bool result = manager.ImportLocaleFromJson("de", json);

		Assert.True(result);
		Assert.Contains("de", manager.AvailableLocales);
	}

	[Fact]
	public void ExportToCsv_ReturnsValidCsv() {
		var manager = CreateManagerWithStrings();

		var csv = manager.ExportToCsv("en");

		Assert.Contains("Key,Value,Category", csv);
		Assert.Contains("greeting", csv);
		Assert.Contains("Hello!", csv);
	}

	[Fact]
	public void ImportFromCsv_ImportsStrings() {
		var manager = CreateManagerWithLocales();
		var csv = """
		Key,Value,Category,Context,Translated,NeedsReview
		"test1","Value 1","menu","",true,false
		"test2","Value 2","item","",true,false
		""";

		int imported = manager.ImportFromCsv(csv, "en");

		Assert.Equal(2, imported);
		Assert.Equal("Value 1", manager.GetString("test1", "en"));
	}

	#endregion

	#region Validation Tests

	[Fact]
	public void ValidateLocale_ReportsLengthErrors() {
		var manager = CreateManagerWithLocales();
		var schema = new LocalizationManager.LocalizationSchema {
			MaxStringLength = 5
		};
		manager.SetSchema(schema);
		manager.SetString("test", "OK", "en");  // This passes
		manager.AddStringKey("long_string");
		manager.GetLocaleData("en")!.Strings["long_string"].Value = "This is too long";
		manager.GetLocaleData("en")!.Strings["long_string"].MaxLength = 5;

		var errors = manager.ValidateLocale("en");

		Assert.Contains(errors, e => e.Key == "long_string" && e.Severity == LocalizationManager.ValidationSeverity.Error);
	}

	[Fact]
	public void ValidateLocale_ReportsUntranslated() {
		var manager = CreateManagerWithStrings();

		var errors = manager.ValidateLocale("ja");

		// Japanese is missing translations for items and dialogue
		Assert.Contains(errors, e => e.Severity == LocalizationManager.ValidationSeverity.Warning);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void GetStatistics_ReturnsCorrectCounts() {
		var manager = CreateManagerWithStrings();

		var stats = manager.GetStatistics("en");

		Assert.Equal(5, stats.TotalStrings);
		Assert.Equal(5, stats.TranslatedStrings);
		Assert.Equal(100, stats.TranslationPercentage);
	}

	[Fact]
	public void GetStatistics_CalculatesCategoryBreakdown() {
		var manager = CreateManagerWithStrings();

		var stats = manager.GetStatistics("en");

		Assert.Equal(2, stats.StringsByCategory["item"]);
		Assert.Equal(1, stats.StringsByCategory["dialogue"]);
	}

	[Fact]
	public void GetStatistics_HandlesPartialTranslation() {
		var manager = CreateManagerWithStrings();

		var stats = manager.GetStatistics("ja");

		Assert.Equal(5, stats.TotalStrings);
		Assert.Equal(2, stats.TranslatedStrings);
		Assert.Equal(40, stats.TranslationPercentage);
	}

	[Fact]
	public void CompareLocales_FindsDifferences() {
		var manager = CreateManagerWithStrings();

		var differences = manager.CompareLocales("en", "ja");

		// ja has empty strings for item_sword, item_shield, dialogue_intro (they exist but are different)
		Assert.Contains(differences, d => d.Key == "item_sword" && d.Type == LocalizationManager.DifferenceType.Different);
	}

	[Fact]
	public void CompareLocales_FindsValueDifferences() {
		var manager = CreateManagerWithStrings();

		var differences = manager.CompareLocales("en", "ja");

		// greeting has different values
		Assert.Contains(differences, d => d.Key == "greeting" && d.Type == LocalizationManager.DifferenceType.Different);
	}

	#endregion

	#region Copy Tests

	[Fact]
	public void CopyStringsToLocale_CopiesStrings() {
		var manager = CreateManagerWithStrings();

		int copied = manager.CopyStringsToLocale("en", "es");

		Assert.Equal(5, copied);
		Assert.Equal("Hello!", manager.GetString("greeting", "es"));
	}

	[Fact]
	public void CopyStringsToLocale_MarksAsUntranslated() {
		var manager = CreateManagerWithStrings();

		manager.CopyStringsToLocale("en", "es");

		var data = manager.GetLocaleData("es");
		Assert.False(data?.Strings["greeting"].IsTranslated);
	}

	[Fact]
	public void CopyStringsToLocale_DoesNotOverwriteByDefault() {
		var manager = CreateManagerWithStrings();
		manager.SetString("greeting", "Hola!", "es");

		manager.CopyStringsToLocale("en", "es", overwrite: false);

		Assert.Equal("Hola!", manager.GetString("greeting", "es"));
	}

	[Fact]
	public void CopyStringsToLocale_OverwritesWhenSpecified() {
		var manager = CreateManagerWithStrings();
		manager.SetString("greeting", "Hola!", "es");

		manager.CopyStringsToLocale("en", "es", overwrite: true);

		Assert.Equal("Hello!", manager.GetString("greeting", "es"));
	}

	#endregion
}
