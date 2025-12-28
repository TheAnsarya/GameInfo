using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Analysis.Games.DQ3r;

/// <summary>
/// DQ3r data map configuration loaded from datamap.json.
/// Contains ROM addresses for known data structures.
/// </summary>
public class DQ3rDataMap {
	/// <summary>
	/// ROM file information.
	/// </summary>
	[JsonPropertyName("romfile")]
	public RomFileInfo? RomFile { get; set; }

	/// <summary>
	/// Data map entries.
	/// </summary>
	[JsonPropertyName("datamap")]
	public DataMapEntries? DataMap { get; set; }

	/// <summary>
	/// Load data map from JSON file.
	/// </summary>
	/// <param name="path">Path to datamap.json.</param>
	/// <returns>Loaded data map.</returns>
	public static DQ3rDataMap LoadFromFile(string path) {
		var json = File.ReadAllText(path);
		return JsonSerializer.Deserialize<DQ3rDataMap>(json, JsonOptions) ?? new DQ3rDataMap();
	}

	/// <summary>
	/// Load data map from JSON string.
	/// </summary>
	public static DQ3rDataMap LoadFromJson(string json) =>
		JsonSerializer.Deserialize<DQ3rDataMap>(json, JsonOptions) ?? new DQ3rDataMap();

	private static readonly JsonSerializerOptions JsonOptions = new() {
		PropertyNameCaseInsensitive = true,
		ReadCommentHandling = JsonCommentHandling.Skip
	};
}

/// <summary>
/// ROM file identification info.
/// </summary>
public class RomFileInfo {
	[JsonPropertyName("directory")]
	public string Directory { get; set; } = string.Empty;

	[JsonPropertyName("filename")]
	public string Filename { get; set; } = string.Empty;

	[JsonPropertyName("filesize")]
	public int FileSize { get; set; }

	[JsonPropertyName("crc32")]
	public string Crc32 { get; set; } = string.Empty;

	[JsonPropertyName("MD5")]
	public string Md5 { get; set; } = string.Empty;

	[JsonPropertyName("SHA1")]
	public string Sha1 { get; set; } = string.Empty;
}

/// <summary>
/// Data map entry categories.
/// </summary>
public class DataMapEntries {
	[JsonPropertyName("text")]
	public TextDataMap? Text { get; set; }
}

/// <summary>
/// Text data locations.
/// </summary>
public class TextDataMap {
	[JsonPropertyName("menu")]
	public MenuTextData? Menu { get; set; }

	[JsonPropertyName("dialog")]
	public DialogTextData? Dialog { get; set; }
}

/// <summary>
/// Menu text configuration.
/// </summary>
public class MenuTextData {
	[JsonPropertyName("font")]
	public FontData? Font { get; set; }
}

/// <summary>
/// Dialog text configuration.
/// </summary>
public class DialogTextData {
	[JsonPropertyName("table")]
	public TableData? Table { get; set; }

	[JsonPropertyName("font")]
	public DialogFontData? Font { get; set; }

	[JsonPropertyName("script")]
	public AddressRange? Script { get; set; }
}

/// <summary>
/// Font data configuration.
/// </summary>
public class FontData {
	[JsonPropertyName("tableFile")]
	public string TableFile { get; set; } = string.Empty;

	[JsonPropertyName("address")]
	public string Address { get; set; } = "0x0";

	[JsonPropertyName("length")]
	public string Length { get; set; } = "0x0";

	[JsonPropertyName("charWidth")]
	public int CharWidth { get; set; } = 8;

	[JsonPropertyName("charHeight")]
	public int CharHeight { get; set; } = 8;

	/// <summary>
	/// Get address as integer.
	/// </summary>
	public int AddressInt => ParseHex(Address);

	/// <summary>
	/// Get length as integer.
	/// </summary>
	public int LengthInt => ParseHex(Length);

	private static int ParseHex(string value) {
		if (string.IsNullOrEmpty(value)) return 0;
		var clean = value.TrimStart('$').Replace("0x", "", StringComparison.OrdinalIgnoreCase);
		return int.TryParse(clean, System.Globalization.NumberStyles.HexNumber, null, out int result)
			? result : 0;
	}
}

/// <summary>
/// Table data configuration.
/// </summary>
public class TableData {
	[JsonPropertyName("file")]
	public string File { get; set; } = string.Empty;

	[JsonPropertyName("length")]
	public string Length { get; set; } = "0x0";

	public int LengthInt => ParseHex(Length);

	private static int ParseHex(string value) {
		if (string.IsNullOrEmpty(value)) return 0;
		var clean = value.TrimStart('$').Replace("0x", "", StringComparison.OrdinalIgnoreCase);
		return int.TryParse(clean, System.Globalization.NumberStyles.HexNumber, null, out int result)
			? result : 0;
	}
}

/// <summary>
/// Dialog font configuration with metadata table.
/// </summary>
public class DialogFontData {
	[JsonPropertyName("settings")]
	public FontSettings? Settings { get; set; }

	[JsonPropertyName("bankAddress")]
	public string BankAddress { get; set; } = "0x0";

	[JsonPropertyName("metadataTable")]
	public MetadataTable? MetadataTable { get; set; }

	[JsonPropertyName("data")]
	public AddressRange? Data { get; set; }

	public int BankAddressInt => ParseHex(BankAddress);

	private static int ParseHex(string value) {
		if (string.IsNullOrEmpty(value)) return 0;
		var clean = value.TrimStart('$').Replace("0x", "", StringComparison.OrdinalIgnoreCase);
		return int.TryParse(clean, System.Globalization.NumberStyles.HexNumber, null, out int result)
			? result : 0;
	}
}

/// <summary>
/// Font file settings.
/// </summary>
public class FontSettings {
	[JsonPropertyName("rawFile")]
	public string RawFile { get; set; } = string.Empty;

	[JsonPropertyName("imageFile")]
	public string ImageFile { get; set; } = string.Empty;
}

/// <summary>
/// Metadata table configuration.
/// </summary>
public class MetadataTable {
	[JsonPropertyName("address")]
	public string Address { get; set; } = "0x0";

	[JsonPropertyName("addressEnd")]
	public string AddressEnd { get; set; } = "0x0";

	[JsonPropertyName("count")]
	public int Count { get; set; }

	[JsonPropertyName("entryLength")]
	public int EntryLength { get; set; }

	public int AddressInt => ParseHex(Address);
	public int AddressEndInt => ParseHex(AddressEnd);

	private static int ParseHex(string value) {
		if (string.IsNullOrEmpty(value)) return 0;
		var clean = value.TrimStart('$').Replace("0x", "", StringComparison.OrdinalIgnoreCase);
		return int.TryParse(clean, System.Globalization.NumberStyles.HexNumber, null, out int result)
			? result : 0;
	}
}

/// <summary>
/// Address range configuration.
/// </summary>
public class AddressRange {
	[JsonPropertyName("address")]
	public string Address { get; set; } = "0x0";

	[JsonPropertyName("addressEnd")]
	public string AddressEnd { get; set; } = "0x0";

	[JsonPropertyName("length")]
	public string Length { get; set; } = "0x0";

	public int AddressInt => ParseHex(Address);
	public int AddressEndInt => ParseHex(AddressEnd);
	public int LengthInt => ParseHex(Length);

	/// <summary>
	/// Get size based on address range or explicit length.
	/// </summary>
	public int Size => LengthInt > 0 ? LengthInt : AddressEndInt - AddressInt;

	private static int ParseHex(string value) {
		if (string.IsNullOrEmpty(value)) return 0;
		var clean = value.TrimStart('$').Replace("0x", "", StringComparison.OrdinalIgnoreCase);
		return int.TryParse(clean, System.Globalization.NumberStyles.HexNumber, null, out int result)
			? result : 0;
	}
}
