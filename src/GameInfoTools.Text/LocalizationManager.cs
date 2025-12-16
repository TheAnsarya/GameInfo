using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Text;

/// <summary>
/// Service for managing localization and multi-language text in ROMs.
/// Supports translation management, import/export, and ROM patching.
/// </summary>
public class LocalizationManager {
	private readonly Dictionary<string, LocaleData> _locales = [];
	private string _currentLocale = "en";
	private LocalizationSchema? _schema;

	/// <summary>
	/// Gets the available locale codes.
	/// </summary>
	public IReadOnlyList<string> AvailableLocales => _locales.Keys.ToList();

	/// <summary>
	/// Gets or sets the current locale.
	/// </summary>
	public string CurrentLocale {
		get => _currentLocale;
		set {
			if (_locales.ContainsKey(value) || value == _currentLocale) {
				_currentLocale = value;
			}
		}
	}

	/// <summary>
	/// Gets the current schema.
	/// </summary>
	public LocalizationSchema? Schema => _schema;

	/// <summary>
	/// Gets the locale data for a specific locale.
	/// </summary>
	public LocaleData? GetLocaleData(string locale) {
		return _locales.TryGetValue(locale, out var data) ? data : null;
	}

	#region Data Classes

	/// <summary>
	/// Schema for localization data layout.
	/// </summary>
	public class LocalizationSchema {
		public string Name { get; set; } = "";
		public int MaxStringLength { get; set; } = 256;
		public int MaxTotalSize { get; set; } = 65536;
		public bool SupportsDTE { get; set; } = true;
		public bool SupportsVariableWidth { get; set; } = false;
		public Encoding? Encoding { get; set; }
		public Dictionary<string, StringCategory> Categories { get; set; } = [];
	}

	/// <summary>
	/// Category of strings (for organization).
	/// </summary>
	public class StringCategory {
		public string Name { get; set; } = "";
		public string Description { get; set; } = "";
		public int MaxLength { get; set; } = 256;
		public bool AllowLineBreaks { get; set; } = true;
		public bool AllowSpecialChars { get; set; } = true;
	}

	/// <summary>
	/// Data for a single locale.
	/// </summary>
	public class LocaleData {
		public string Code { get; set; } = "";
		public string Name { get; set; } = "";
		public string NativeName { get; set; } = "";
		public bool IsRightToLeft { get; set; } = false;
		public Dictionary<string, LocalizedString> Strings { get; set; } = [];
		public Dictionary<byte, string> CharacterTable { get; set; } = [];
		public Dictionary<string, byte[]> DteTable { get; set; } = [];
	}

	/// <summary>
	/// A single localized string entry.
	/// </summary>
	public class LocalizedString {
		public string Key { get; set; } = "";
		public string Value { get; set; } = "";
		public string? Category { get; set; }
		public string? Context { get; set; }
		public string? Comment { get; set; }
		public int MaxLength { get; set; }
		public bool IsTranslated { get; set; } = false;
		public bool NeedsReview { get; set; } = false;
		public DateTime? LastModified { get; set; }
	}

	/// <summary>
	/// Result of a translation operation.
	/// </summary>
	public record TranslationResult(
		bool Success,
		string Key,
		string? Error = null,
		int? ByteLength = null
	);

	/// <summary>
	/// Statistics about localization progress.
	/// </summary>
	public record LocalizationStatistics(
		int TotalStrings,
		int TranslatedStrings,
		int StringsNeedingReview,
		int TotalCharacters,
		double TranslationPercentage,
		Dictionary<string, int> StringsByCategory
	);

	#endregion

	#region Schema Methods

	/// <summary>
	/// Sets the localization schema.
	/// </summary>
	public void SetSchema(LocalizationSchema schema) {
		_schema = schema ?? throw new ArgumentNullException(nameof(schema));
	}

	/// <summary>
	/// Creates a schema for NES games.
	/// </summary>
	public static LocalizationSchema CreateNesSchema() {
		return new LocalizationSchema {
			Name = "NES Localization",
			MaxStringLength = 128,
			MaxTotalSize = 32768,
			SupportsDTE = true,
			SupportsVariableWidth = false,
			Categories = new Dictionary<string, StringCategory> {
				["dialogue"] = new() { Name = "Dialogue", MaxLength = 128, AllowLineBreaks = true },
				["menu"] = new() { Name = "Menu", MaxLength = 16, AllowLineBreaks = false },
				["item"] = new() { Name = "Items", MaxLength = 12, AllowLineBreaks = false },
				["monster"] = new() { Name = "Monsters", MaxLength = 12, AllowLineBreaks = false },
				["spell"] = new() { Name = "Spells", MaxLength = 8, AllowLineBreaks = false }
			}
		};
	}

	/// <summary>
	/// Creates a schema for SNES games.
	/// </summary>
	public static LocalizationSchema CreateSnesSchema() {
		return new LocalizationSchema {
			Name = "SNES Localization",
			MaxStringLength = 256,
			MaxTotalSize = 65536,
			SupportsDTE = true,
			SupportsVariableWidth = true,
			Categories = new Dictionary<string, StringCategory> {
				["dialogue"] = new() { Name = "Dialogue", MaxLength = 256, AllowLineBreaks = true },
				["menu"] = new() { Name = "Menu", MaxLength = 24, AllowLineBreaks = false },
				["item"] = new() { Name = "Items", MaxLength = 16, AllowLineBreaks = false },
				["monster"] = new() { Name = "Monsters", MaxLength = 16, AllowLineBreaks = false },
				["spell"] = new() { Name = "Spells", MaxLength = 12, AllowLineBreaks = false },
				["location"] = new() { Name = "Locations", MaxLength = 20, AllowLineBreaks = false }
			}
		};
	}

	#endregion

	#region Locale Management

	/// <summary>
	/// Adds a new locale.
	/// </summary>
	public bool AddLocale(string code, string name, string? nativeName = null) {
		if (string.IsNullOrWhiteSpace(code)) return false;
		if (_locales.ContainsKey(code)) return false;

		_locales[code] = new LocaleData {
			Code = code,
			Name = name,
			NativeName = nativeName ?? name
		};

		return true;
	}

	/// <summary>
	/// Removes a locale.
	/// </summary>
	public bool RemoveLocale(string code) {
		if (code == _currentLocale) return false;
		return _locales.Remove(code);
	}

	/// <summary>
	/// Gets all strings for a locale.
	/// </summary>
	public IReadOnlyDictionary<string, LocalizedString> GetStrings(string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) {
			return new Dictionary<string, LocalizedString>();
		}
		return data.Strings;
	}

	#endregion

	#region String Management

	/// <summary>
	/// Gets a localized string.
	/// </summary>
	public string? GetString(string key, string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return null;
		if (!data.Strings.TryGetValue(key, out var str)) return null;
		return str.Value;
	}

	/// <summary>
	/// Sets a localized string.
	/// </summary>
	public TranslationResult SetString(string key, string value, string? locale = null, string? category = null) {
		locale ??= _currentLocale;

		if (!_locales.TryGetValue(locale, out var data)) {
			return new TranslationResult(false, key, "Locale not found");
		}

		// Validate length
		int maxLength = _schema?.MaxStringLength ?? 256;
		if (category != null && _schema?.Categories.TryGetValue(category, out var cat) == true) {
			maxLength = cat.MaxLength;
		}

		if (value.Length > maxLength) {
			return new TranslationResult(false, key, $"String exceeds max length ({value.Length} > {maxLength})");
		}

		if (!data.Strings.TryGetValue(key, out var existing)) {
			existing = new LocalizedString {
				Key = key,
				Category = category,
				MaxLength = maxLength
			};
			data.Strings[key] = existing;
		}

		existing.Value = value;
		existing.IsTranslated = true;
		existing.LastModified = DateTime.UtcNow;

		// Calculate encoded byte length
		int byteLength = CalculateByteLength(value, data);

		return new TranslationResult(true, key, ByteLength: byteLength);
	}

	/// <summary>
	/// Adds a string key (without translation).
	/// </summary>
	public bool AddStringKey(string key, string? category = null, string? context = null, int? maxLength = null) {
		foreach (var locale in _locales.Values) {
			if (!locale.Strings.ContainsKey(key)) {
				locale.Strings[key] = new LocalizedString {
					Key = key,
					Category = category,
					Context = context,
					MaxLength = maxLength ?? _schema?.MaxStringLength ?? 256,
					IsTranslated = false
				};
			}
		}
		return true;
	}

	/// <summary>
	/// Removes a string key from all locales.
	/// </summary>
	public bool RemoveStringKey(string key) {
		bool removed = false;
		foreach (var locale in _locales.Values) {
			if (locale.Strings.Remove(key)) {
				removed = true;
			}
		}
		return removed;
	}

	/// <summary>
	/// Marks a string as needing review.
	/// </summary>
	public bool MarkForReview(string key, string? locale = null, bool needsReview = true) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return false;
		if (!data.Strings.TryGetValue(key, out var str)) return false;

		str.NeedsReview = needsReview;
		return true;
	}

	/// <summary>
	/// Adds a comment to a string.
	/// </summary>
	public bool AddComment(string key, string comment, string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return false;
		if (!data.Strings.TryGetValue(key, out var str)) return false;

		str.Comment = comment;
		return true;
	}

	#endregion

	#region Character Tables

	/// <summary>
	/// Sets the character table for a locale.
	/// </summary>
	public void SetCharacterTable(string locale, Dictionary<byte, string> table) {
		if (!_locales.TryGetValue(locale, out var data)) return;
		data.CharacterTable = new Dictionary<byte, string>(table);
	}

	/// <summary>
	/// Gets the character table for a locale.
	/// </summary>
	public IReadOnlyDictionary<byte, string> GetCharacterTable(string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) {
			return new Dictionary<byte, string>();
		}
		return data.CharacterTable;
	}

	/// <summary>
	/// Sets a DTE (Dual Tile Encoding) entry.
	/// </summary>
	public void SetDteEntry(string locale, string text, byte[] bytes) {
		if (!_locales.TryGetValue(locale, out var data)) return;
		data.DteTable[text] = bytes;
	}

	/// <summary>
	/// Gets the DTE table for a locale.
	/// </summary>
	public IReadOnlyDictionary<string, byte[]> GetDteTable(string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) {
			return new Dictionary<string, byte[]>();
		}
		return data.DteTable;
	}

	#endregion

	#region Search and Filter

	/// <summary>
	/// Searches for strings containing text.
	/// </summary>
	public List<LocalizedString> SearchStrings(string searchText, string? locale = null, bool caseSensitive = false) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return [];

		var comparison = caseSensitive ? StringComparison.Ordinal : StringComparison.OrdinalIgnoreCase;

		return data.Strings.Values
			.Where(s => s.Value.Contains(searchText, comparison) || s.Key.Contains(searchText, comparison))
			.ToList();
	}

	/// <summary>
	/// Gets strings by category.
	/// </summary>
	public List<LocalizedString> GetStringsByCategory(string category, string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return [];

		return data.Strings.Values
			.Where(s => s.Category == category)
			.ToList();
	}

	/// <summary>
	/// Gets untranslated strings.
	/// </summary>
	public List<LocalizedString> GetUntranslatedStrings(string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return [];

		return data.Strings.Values
			.Where(s => !s.IsTranslated)
			.ToList();
	}

	/// <summary>
	/// Gets strings needing review.
	/// </summary>
	public List<LocalizedString> GetStringsNeedingReview(string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return [];

		return data.Strings.Values
			.Where(s => s.NeedsReview)
			.ToList();
	}

	#endregion

	#region Import/Export

	/// <summary>
	/// Exports all localization data to JSON.
	/// </summary>
	public string ExportToJson() {
		return JsonSerializer.Serialize(_locales, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Exports a single locale to JSON.
	/// </summary>
	public string ExportLocaleToJson(string locale) {
		if (!_locales.TryGetValue(locale, out var data)) return "{}";

		return JsonSerializer.Serialize(data, new JsonSerializerOptions {
			WriteIndented = true,
			Converters = { new JsonStringEnumConverter() }
		});
	}

	/// <summary>
	/// Imports localization data from JSON.
	/// </summary>
	public bool ImportFromJson(string json) {
		try {
			var data = JsonSerializer.Deserialize<Dictionary<string, LocaleData>>(json);
			if (data == null) return false;

			foreach (var kvp in data) {
				_locales[kvp.Key] = kvp.Value;
			}
			return true;
		} catch {
			return false;
		}
	}

	/// <summary>
	/// Imports a single locale from JSON.
	/// </summary>
	public bool ImportLocaleFromJson(string locale, string json) {
		try {
			var data = JsonSerializer.Deserialize<LocaleData>(json);
			if (data == null) return false;

			data.Code = locale;
			_locales[locale] = data;
			return true;
		} catch {
			return false;
		}
	}

	/// <summary>
	/// Exports strings to CSV format.
	/// </summary>
	public string ExportToCsv(string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return "";

		var sb = new StringBuilder();
		sb.AppendLine("Key,Value,Category,Context,Translated,NeedsReview");

		foreach (var str in data.Strings.Values) {
			sb.AppendLine($"\"{EscapeCsv(str.Key)}\",\"{EscapeCsv(str.Value)}\",\"{EscapeCsv(str.Category ?? "")}\",\"{EscapeCsv(str.Context ?? "")}\",{str.IsTranslated},{str.NeedsReview}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Imports strings from CSV format.
	/// </summary>
	public int ImportFromCsv(string csv, string? locale = null) {
		locale ??= _currentLocale;
		if (!_locales.TryGetValue(locale, out var data)) return 0;

		var lines = csv.Split('\n', StringSplitOptions.RemoveEmptyEntries);
		int imported = 0;

		// Skip header
		foreach (var line in lines.Skip(1)) {
			var fields = ParseCsvLine(line);
			if (fields.Length < 2) continue;

			var key = fields[0];
			var value = fields[1];

			if (string.IsNullOrEmpty(key)) continue;

			data.Strings[key] = new LocalizedString {
				Key = key,
				Value = value,
				Category = fields.Length > 2 ? fields[2] : null,
				Context = fields.Length > 3 ? fields[3] : null,
				IsTranslated = !string.IsNullOrEmpty(value)
			};
			imported++;
		}

		return imported;
	}

	private static string EscapeCsv(string value) {
		return value.Replace("\"", "\"\"").Replace("\n", "\\n").Replace("\r", "");
	}

	private static string[] ParseCsvLine(string line) {
		var fields = new List<string>();
		var current = new StringBuilder();
		bool inQuotes = false;

		for (int i = 0; i < line.Length; i++) {
			char c = line[i];

			if (c == '"') {
				if (inQuotes && i + 1 < line.Length && line[i + 1] == '"') {
					current.Append('"');
					i++;
				} else {
					inQuotes = !inQuotes;
				}
			} else if (c == ',' && !inQuotes) {
				fields.Add(current.ToString());
				current.Clear();
			} else {
				current.Append(c);
			}
		}
		fields.Add(current.ToString());

		return fields.ToArray();
	}

	#endregion

	#region Validation

	/// <summary>
	/// Validates all strings in a locale.
	/// </summary>
	public List<ValidationError> ValidateLocale(string? locale = null) {
		locale ??= _currentLocale;
		var errors = new List<ValidationError>();

		if (!_locales.TryGetValue(locale, out var data)) {
			errors.Add(new ValidationError("locale", "Locale not found", ValidationSeverity.Error));
			return errors;
		}

		foreach (var str in data.Strings.Values) {
			// Check length
			if (str.Value.Length > str.MaxLength) {
				errors.Add(new ValidationError(str.Key, $"String exceeds max length ({str.Value.Length} > {str.MaxLength})", ValidationSeverity.Error));
			}

			// Check for untranslated
			if (!str.IsTranslated) {
				errors.Add(new ValidationError(str.Key, "String is not translated", ValidationSeverity.Warning));
			}

			// Check for line breaks in non-dialogue
			if (str.Category != "dialogue" && str.Value.Contains('\n')) {
				if (_schema?.Categories.TryGetValue(str.Category ?? "", out var cat) == true) {
					if (!cat.AllowLineBreaks) {
						errors.Add(new ValidationError(str.Key, "Line breaks not allowed in this category", ValidationSeverity.Warning));
					}
				}
			}

			// Check byte length with DTE
			int byteLength = CalculateByteLength(str.Value, data);
			if (byteLength > str.MaxLength) {
				errors.Add(new ValidationError(str.Key, $"Encoded length exceeds limit ({byteLength} bytes)", ValidationSeverity.Error));
			}
		}

		return errors;
	}

	/// <summary>
	/// Validation error details.
	/// </summary>
	public record ValidationError(string Key, string Message, ValidationSeverity Severity);

	/// <summary>
	/// Validation severity levels.
	/// </summary>
	public enum ValidationSeverity {
		Info,
		Warning,
		Error
	}

	#endregion

	#region Statistics

	/// <summary>
	/// Gets statistics for a locale.
	/// </summary>
	public LocalizationStatistics GetStatistics(string? locale = null) {
		locale ??= _currentLocale;

		if (!_locales.TryGetValue(locale, out var data)) {
			return new LocalizationStatistics(0, 0, 0, 0, 0, []);
		}

		var strings = data.Strings.Values;
		int total = strings.Count();
		int translated = strings.Count(s => s.IsTranslated);
		int needsReview = strings.Count(s => s.NeedsReview);
		int totalChars = strings.Sum(s => s.Value.Length);

		var byCategory = strings
			.Where(s => s.Category != null)
			.GroupBy(s => s.Category!)
			.ToDictionary(g => g.Key, g => g.Count());

		double percentage = total > 0 ? (double)translated / total * 100 : 0;

		return new LocalizationStatistics(
			total, translated, needsReview, totalChars, percentage, byCategory
		);
	}

	/// <summary>
	/// Compares two locales and returns differences.
	/// </summary>
	public List<LocaleDifference> CompareLocales(string locale1, string locale2) {
		var differences = new List<LocaleDifference>();

		var data1 = GetLocaleData(locale1);
		var data2 = GetLocaleData(locale2);

		if (data1 == null || data2 == null) return differences;

		var allKeys = data1.Strings.Keys.Union(data2.Strings.Keys);

		foreach (var key in allKeys) {
			var has1 = data1.Strings.TryGetValue(key, out var str1);
			var has2 = data2.Strings.TryGetValue(key, out var str2);

			if (has1 && !has2) {
				differences.Add(new LocaleDifference(key, DifferenceType.MissingInSecond, str1?.Value, null));
			} else if (!has1 && has2) {
				differences.Add(new LocaleDifference(key, DifferenceType.MissingInFirst, null, str2?.Value));
			} else if (has1 && has2 && str1?.Value != str2?.Value) {
				differences.Add(new LocaleDifference(key, DifferenceType.Different, str1?.Value, str2?.Value));
			}
		}

		return differences;
	}

	/// <summary>
	/// Difference between locales.
	/// </summary>
	public record LocaleDifference(string Key, DifferenceType Type, string? Value1, string? Value2);

	/// <summary>
	/// Types of locale differences.
	/// </summary>
	public enum DifferenceType {
		MissingInFirst,
		MissingInSecond,
		Different
	}

	#endregion

	#region Helpers

	private int CalculateByteLength(string text, LocaleData data) {
		if (data.CharacterTable.Count == 0) {
			// No character table, assume 1 byte per character
			return text.Length;
		}

		// Check for DTE compression
		string processed = text;
		int dteCount = 0;

		if (_schema?.SupportsDTE == true) {
			// Sort DTE entries by length (longest first) for greedy matching
			var sortedDte = data.DteTable.OrderByDescending(kvp => kvp.Key.Length);

			foreach (var dte in sortedDte) {
				int count = 0;
				int index = 0;
				while ((index = processed.IndexOf(dte.Key, index, StringComparison.Ordinal)) >= 0) {
					count++;
					index += dte.Key.Length;
				}
				dteCount += count * (dte.Key.Length - dte.Value.Length);
				processed = processed.Replace(dte.Key, new string('\0', dte.Value.Length));
			}
		}

		// Count remaining characters
		int byteLength = 0;
		var reverseTable = data.CharacterTable.ToDictionary(kvp => kvp.Value, kvp => kvp.Key);

		foreach (char c in processed) {
			if (c == '\0') {
				byteLength++;  // DTE placeholder
			} else if (reverseTable.ContainsKey(c.ToString())) {
				byteLength++;
			} else {
				byteLength++;  // Unknown character, assume 1 byte
			}
		}

		return byteLength;
	}

	/// <summary>
	/// Copies strings from one locale to another.
	/// </summary>
	public int CopyStringsToLocale(string sourceLocale, string destLocale, bool overwrite = false) {
		var source = GetLocaleData(sourceLocale);
		var dest = GetLocaleData(destLocale);

		if (source == null || dest == null) return 0;

		int copied = 0;
		foreach (var kvp in source.Strings) {
			if (!dest.Strings.ContainsKey(kvp.Key) || overwrite) {
				dest.Strings[kvp.Key] = new LocalizedString {
					Key = kvp.Value.Key,
					Value = kvp.Value.Value,
					Category = kvp.Value.Category,
					Context = kvp.Value.Context,
					Comment = kvp.Value.Comment,
					MaxLength = kvp.Value.MaxLength,
					IsTranslated = false,  // Mark as not translated in dest
					NeedsReview = true
				};
				copied++;
			}
		}

		return copied;
	}

	#endregion
}
