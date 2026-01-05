using System.Text.Json;
using System.Text.Json.Serialization;

namespace GameInfoTools.Dats;

/// <summary>
/// Generates whitelist files in various formats from merged DAT data.
/// </summary>
public sealed class WhitelistGenerator {
	private static readonly JsonSerializerOptions JsonOptions = new() {
		WriteIndented = true,
		PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
		Converters = { new JsonStringEnumConverter(JsonNamingPolicy.CamelCase) },
		DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull
	};

	/// <summary>
	/// Generates a JSON whitelist file.
	/// </summary>
	public static void WriteJson(RomWhitelist whitelist, string outputPath) {
		var json = JsonSerializer.Serialize(whitelist, JsonOptions);
		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);
		File.WriteAllText(outputPath, json);
	}

	/// <summary>
	/// Generates a simple text hash list (one hash per line).
	/// </summary>
	public static void WriteHashList(RomWhitelist whitelist, string outputPath, HashType hashType = HashType.Sha1) {
		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);

		using var writer = new StreamWriter(outputPath);
		writer.WriteLine($"# {whitelist.Name} - {whitelist.System}");
		writer.WriteLine($"# Generated: {whitelist.GeneratedDate}");
		writer.WriteLine($"# Hash type: {hashType}");
		writer.WriteLine($"# Entries: {whitelist.Entries.Count}");
		writer.WriteLine();

		foreach (var entry in whitelist.Entries.OrderBy(e => e.Name)) {
			var hash = hashType switch {
				HashType.Crc32 => entry.Crc32,
				HashType.Md5 => entry.Md5,
				HashType.Sha1 => entry.Sha1,
				HashType.Sha256 => entry.Sha256,
				_ => entry.Sha1
			};

			if (hash is not null) {
				writer.WriteLine($"{hash}  {entry.Name}");
			}
		}
	}

	/// <summary>
	/// Generates a CSV export of the whitelist.
	/// </summary>
	public static void WriteCsv(RomWhitelist whitelist, string outputPath) {
		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);

		using var writer = new StreamWriter(outputPath);
		writer.WriteLine("Name,GameName,Size,CRC32,MD5,SHA1,Category,Region,Verified,SourceCount");

		foreach (var entry in whitelist.Entries.OrderBy(e => e.Name)) {
			var fields = new[] {
				EscapeCsv(entry.Name),
				EscapeCsv(entry.GameName),
				entry.Size.ToString(),
				entry.Crc32 ?? "",
				entry.Md5 ?? "",
				entry.Sha1 ?? "",
				entry.Category.ToString(),
				entry.Region ?? "",
				entry.Verified ? "true" : "false",
				entry.SourceCount.ToString()
			};
			writer.WriteLine(string.Join(",", fields));
		}
	}

	/// <summary>
	/// Generates a Logiqx XML DAT file from the whitelist.
	/// </summary>
	public static void WriteLogiqxDat(RomWhitelist whitelist, string outputPath) {
		Directory.CreateDirectory(Path.GetDirectoryName(outputPath)!);

		using var writer = new StreamWriter(outputPath);
		writer.WriteLine("""<?xml version="1.0" encoding="UTF-8"?>""");
		writer.WriteLine("""<!DOCTYPE datafile PUBLIC "-//Logiqx//DTD ROM Management Datafile//EN" "http://www.logiqx.com/Dats/datafile.dtd">""");
		writer.WriteLine("<datafile>");
		writer.WriteLine("\t<header>");
		writer.WriteLine($"\t\t<name>{EscapeXml(whitelist.Name)}</name>");
		writer.WriteLine($"\t\t<description>{EscapeXml(whitelist.Name)} - {EscapeXml(whitelist.System)}</description>");
		writer.WriteLine($"\t\t<version>{whitelist.GeneratedDate:yyyy-MM-dd}</version>");
		writer.WriteLine($"\t\t<date>{whitelist.GeneratedDate:yyyy-MM-dd}</date>");
		writer.WriteLine("\t\t<author>GameInfoTools</author>");
		writer.WriteLine("\t</header>");

		foreach (var entry in whitelist.Entries.OrderBy(e => e.GameName)) {
			writer.WriteLine($"\t<game name=\"{EscapeXml(entry.GameName)}\">");
			writer.WriteLine($"\t\t<description>{EscapeXml(entry.GameName)}</description>");

			var romAttrs = new List<string> {
				$"name=\"{EscapeXml(entry.Name)}\"",
				$"size=\"{entry.Size}\""
			};

			if (entry.Crc32 is not null)
				romAttrs.Add($"crc=\"{entry.Crc32}\"");
			if (entry.Md5 is not null)
				romAttrs.Add($"md5=\"{entry.Md5}\"");
			if (entry.Sha1 is not null)
				romAttrs.Add($"sha1=\"{entry.Sha1}\"");
			if (entry.Sha256 is not null)
				romAttrs.Add($"sha256=\"{entry.Sha256}\"");

			writer.WriteLine($"\t\t<rom {string.Join(" ", romAttrs)}/>");
			writer.WriteLine("\t</game>");
		}

		writer.WriteLine("</datafile>");
	}

	/// <summary>
	/// Generates categorized whitelists (commercial, translations, hacks).
	/// </summary>
	public static void WriteCategorizedLists(DatMerger merger, string outputDir, string system) {
		Directory.CreateDirectory(outputDir);

		// Commercial ROMs
		var commercial = new RomWhitelist {
			Name = $"{system} Commercial ROMs",
			System = system,
			GeneratedDate = DateOnly.FromDateTime(DateTime.UtcNow),
			Entries = merger.GetVerifiedCommercialRoms().Select(ToEntry).ToList()
		};
		WriteJson(commercial, Path.Combine(outputDir, $"{system.ToLowerInvariant()}-commercial.json"));
		WriteHashList(commercial, Path.Combine(outputDir, $"{system.ToLowerInvariant()}-commercial-sha1.txt"));

		// Translations
		var translations = new RomWhitelist {
			Name = $"{system} Translation Patches",
			System = system,
			GeneratedDate = DateOnly.FromDateTime(DateTime.UtcNow),
			Entries = merger.GetTranslations().Select(ToEntry).ToList()
		};
		WriteJson(translations, Path.Combine(outputDir, $"{system.ToLowerInvariant()}-translations.json"));

		// Hacks
		var hacks = new RomWhitelist {
			Name = $"{system} ROM Hacks",
			System = system,
			GeneratedDate = DateOnly.FromDateTime(DateTime.UtcNow),
			Entries = merger.GetHacks().Select(ToEntry).ToList()
		};
		WriteJson(hacks, Path.Combine(outputDir, $"{system.ToLowerInvariant()}-hacks.json"));

		// All ROMs (master list)
		var all = new RomWhitelist {
			Name = $"{system} Complete ROM List",
			System = system,
			GeneratedDate = DateOnly.FromDateTime(DateTime.UtcNow),
			Entries = merger.GetAllRoms().Select(ToEntry).ToList()
		};
		WriteJson(all, Path.Combine(outputDir, $"{system.ToLowerInvariant()}-all.json"));
		WriteCsv(all, Path.Combine(outputDir, $"{system.ToLowerInvariant()}-all.csv"));
		WriteLogiqxDat(all, Path.Combine(outputDir, $"{system.ToLowerInvariant()}-all.dat"));
	}

	private static WhitelistEntry ToEntry(MergedRomInfo rom) => new() {
		Name = rom.PrimaryName,
		GameName = rom.GameName,
		Size = rom.Size,
		Crc32 = rom.Crc32,
		Md5 = rom.Md5,
		Sha1 = rom.Sha1,
		Sha256 = rom.Sha256,
		Category = rom.Category,
		Region = rom.Region,
		Verified = rom.Flags.HasFlag(RomFlags.Verified),
		SourceCount = rom.Sources.Count
	};

	private static string EscapeCsv(string value) {
		if (value.Contains(',') || value.Contains('"') || value.Contains('\n')) {
			return $"\"{value.Replace("\"", "\"\"")}\"";
		}
		return value;
	}

	private static string EscapeXml(string value) {
		return value
			.Replace("&", "&amp;")
			.Replace("<", "&lt;")
			.Replace(">", "&gt;")
			.Replace("\"", "&quot;")
			.Replace("'", "&apos;");
	}
}

/// <summary>
/// Hash type for hash list output.
/// </summary>
public enum HashType {
	Crc32,
	Md5,
	Sha1,
	Sha256
}
