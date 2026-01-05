using System.Text;
using System.Text.RegularExpressions;
using System.Xml.Linq;

namespace GameInfoTools.Dats;

/// <summary>
/// Parses DAT files from various sources (NoIntro, TOSEC, GoodTools/OpenGood).
/// </summary>
public static partial class DatParser {
	/// <summary>
	/// Parses a DAT file from a stream, auto-detecting the format.
	/// </summary>
	public static DatFile Parse(Stream stream, string? sourceName = null) {
		using var reader = new StreamReader(stream, Encoding.UTF8, leaveOpen: true);
		var content = reader.ReadToEnd();

		// Detect format by content
		if (content.TrimStart().StartsWith('<')) {
			return ParseLogiqxXml(content, sourceName);
		}
		else if (content.Contains("clrmamepro (")) {
			return ParseClrMamePro(content, sourceName);
		}

		throw new FormatException("Unknown DAT file format");
	}

	/// <summary>
	/// Parses a DAT file from a file path.
	/// </summary>
	public static DatFile ParseFile(string path) {
		using var stream = File.OpenRead(path);
		return Parse(stream, Path.GetFileName(path));
	}

	/// <summary>
	/// Parses Logiqx XML format DAT (used by NoIntro, TOSEC, OpenGood).
	/// </summary>
	public static DatFile ParseLogiqxXml(string content, string? sourceName = null) {
		var doc = XDocument.Parse(content);
		var root = doc.Root ?? throw new FormatException("Invalid XML");

		var header = root.Element("header");
		var name = header?.Element("name")?.Value ?? sourceName ?? "Unknown";
		var description = header?.Element("description")?.Value;
		var version = header?.Element("version")?.Value;
		var author = header?.Element("author")?.Value;
		var url = header?.Element("url")?.Value;

		// Detect source from header or content
		var source = DetectSource(name, description, author);

		// Parse date
		DateOnly? date = null;
		var dateStr = header?.Element("date")?.Value;
		if (dateStr is not null && DateOnly.TryParse(dateStr, out var parsed)) {
			date = parsed;
		}

		// System detection from name
		var system = DetectSystem(name, description);

		var games = new List<GameEntry>();

		foreach (var gameEl in root.Elements("game").Concat(root.Elements("machine"))) {
			var gameName = gameEl.Attribute("name")?.Value ?? gameEl.Element("description")?.Value ?? "Unknown";
			var gameDesc = gameEl.Element("description")?.Value ?? gameName;
			var cloneOf = gameEl.Attribute("cloneof")?.Value;
			var romOf = gameEl.Attribute("romof")?.Value;

			var roms = new List<RomEntry>();
			foreach (var romEl in gameEl.Elements("rom")) {
				var romName = romEl.Attribute("name")?.Value ?? "Unknown";
				var sizeStr = romEl.Attribute("size")?.Value;
				var size = sizeStr is not null ? long.Parse(sizeStr) : 0;

				var crc = romEl.Attribute("crc")?.Value?.ToLowerInvariant();
				var md5 = romEl.Attribute("md5")?.Value?.ToLowerInvariant();
				var sha1 = romEl.Attribute("sha1")?.Value?.ToLowerInvariant();
				var sha256 = romEl.Attribute("sha256")?.Value?.ToLowerInvariant();
				var serial = romEl.Attribute("serial")?.Value;

				var flags = ParseFlags(romEl.Attribute("status")?.Value, gameName);

				roms.Add(new RomEntry {
					Name = romName,
					Size = size,
					Crc32 = crc,
					Md5 = md5,
					Sha1 = sha1,
					Sha256 = sha256,
					Serial = serial,
					Flags = flags
				});
			}

			var (region, languages) = ParseRegionLanguages(gameName);
			var category = DetectCategory(gameName, flags: roms.FirstOrDefault()?.Flags ?? RomFlags.None);
			var year = ParseYear(gameName);

			games.Add(new GameEntry {
				Name = gameName,
				Description = gameDesc,
				Region = region,
				Languages = languages,
				Roms = roms,
				Category = category,
				Year = year,
				CloneOf = cloneOf,
				RomOf = romOf
			});
		}

		return new DatFile {
			Name = name,
			Description = description,
			System = system,
			Version = version,
			Author = author,
			Source = source,
			Date = date,
			Url = url,
			Games = games
		};
	}

	/// <summary>
	/// Parses ClrMamePro DAT format (used by some GoodTools).
	/// </summary>
	public static DatFile ParseClrMamePro(string content, string? sourceName = null) {
		var lines = content.Split('\n').Select(l => l.Trim()).ToList();

		string? name = null;
		string? description = null;
		string? version = null;
		string? author = null;

		var games = new List<GameEntry>();
		var inHeader = false;
		var inGame = false;
		var inRom = false;

		string? currentGameName = null;
		string? currentGameDesc = null;
		var currentRoms = new List<RomEntry>();

		string? romName = null;
		long romSize = 0;
		string? romCrc = null;
		string? romMd5 = null;
		string? romSha1 = null;
		var romFlags = RomFlags.None;

		foreach (var line in lines) {
			if (line.StartsWith("clrmamepro (")) {
				inHeader = true;
				continue;
			}

			if (line.StartsWith("game (")) {
				inGame = true;
				currentGameName = null;
				currentGameDesc = null;
				currentRoms = [];
				continue;
			}

			if (line == ")") {
				if (inRom) {
					if (romName is not null) {
						currentRoms.Add(new RomEntry {
							Name = romName,
							Size = romSize,
							Crc32 = romCrc?.ToLowerInvariant(),
							Md5 = romMd5?.ToLowerInvariant(),
							Sha1 = romSha1?.ToLowerInvariant(),
							Flags = romFlags
						});
					}
					inRom = false;
					romName = null;
					romSize = 0;
					romCrc = null;
					romMd5 = null;
					romSha1 = null;
					romFlags = RomFlags.None;
				}
				else if (inGame && currentGameName is not null) {
					var (region, languages) = ParseRegionLanguages(currentGameName);
					var category = DetectCategory(currentGameName);

					games.Add(new GameEntry {
						Name = currentGameName,
						Description = currentGameDesc ?? currentGameName,
						Region = region,
						Languages = languages,
						Roms = currentRoms,
						Category = category
					});
					inGame = false;
				}
				else if (inHeader) {
					inHeader = false;
				}
				continue;
			}

			if (line.StartsWith("rom (") || line.StartsWith("rom(")) {
				inRom = true;
				// Parse inline rom definition
				var romContent = line["rom (".Length..].TrimEnd(')');
				ParseInlineRomDef(romContent, out romName, out romSize, out romCrc, out romMd5, out romSha1, out romFlags);
				if (!line.EndsWith(")")) continue;
				// Complete inline rom
				if (romName is not null) {
					currentRoms.Add(new RomEntry {
						Name = romName,
						Size = romSize,
						Crc32 = romCrc?.ToLowerInvariant(),
						Md5 = romMd5?.ToLowerInvariant(),
						Sha1 = romSha1?.ToLowerInvariant(),
						Flags = romFlags
					});
				}
				inRom = false;
				romName = null;
				continue;
			}

			// Parse key-value pairs
			var match = KeyValueRegex().Match(line);
			if (match.Success) {
				var key = match.Groups[1].Value;
				var value = match.Groups[2].Value.Trim('"');

				if (inHeader) {
					switch (key) {
						case "name": name = value; break;
						case "description": description = value; break;
						case "version": version = value; break;
						case "author": author = value; break;
					}
				}
				else if (inGame && !inRom) {
					switch (key) {
						case "name": currentGameName = value; break;
						case "description": currentGameDesc = value; break;
					}
				}
				else if (inRom) {
					switch (key) {
						case "name": romName = value; break;
						case "size": romSize = long.TryParse(value, out var s) ? s : 0; break;
						case "crc": romCrc = value; break;
						case "md5": romMd5 = value; break;
						case "sha1": romSha1 = value; break;
					}
				}
			}
		}

		var source = DetectSource(name, description, author);
		var system = DetectSystem(name, description);

		return new DatFile {
			Name = name ?? sourceName ?? "Unknown",
			Description = description,
			System = system,
			Version = version,
			Author = author,
			Source = source,
			Games = games
		};
	}

	private static void ParseInlineRomDef(string content, out string? name, out long size, out string? crc, out string? md5, out string? sha1, out RomFlags flags) {
		name = null;
		size = 0;
		crc = null;
		md5 = null;
		sha1 = null;
		flags = RomFlags.None;

		var matches = InlineKvRegex().Matches(content);
		foreach (Match m in matches) {
			var key = m.Groups[1].Value;
			var value = m.Groups[2].Value.Trim('"');
			switch (key) {
				case "name": name = value; break;
				case "size": size = long.TryParse(value, out var s) ? s : 0; break;
				case "crc": crc = value; break;
				case "md5": md5 = value; break;
				case "sha1": sha1 = value; break;
				case "flags":
					if (value.Contains("verified")) flags |= RomFlags.Verified;
					if (value.Contains("baddump")) flags |= RomFlags.BadDump;
					break;
			}
		}
	}

	private static DatSource DetectSource(string? name, string? description, string? author) {
		var combined = $"{name} {description} {author}".ToLowerInvariant();

		if (combined.Contains("no-intro") || combined.Contains("nointro")) return DatSource.NoIntro;
		if (combined.Contains("tosec")) return DatSource.TOSEC;
		if (combined.Contains("opengood") || combined.Contains("open")) return DatSource.OpenGood;
		if (combined.Contains("good") && (combined.Contains("snes") || combined.Contains("nes") || combined.Contains("gen"))) return DatSource.GoodTools;
		if (combined.Contains("redump")) return DatSource.Redump;
		if (combined.Contains("mame")) return DatSource.MAME;

		return DatSource.Unknown;
	}

	private static string DetectSystem(string? name, string? description) {
		var combined = $"{name} {description}".ToLowerInvariant();

		if (combined.Contains("super nintendo") || combined.Contains("snes") || combined.Contains("super famicom") || combined.Contains("sfc")) return "SNES";
		if (combined.Contains("nes") || combined.Contains("famicom") || combined.Contains("nintendo entertainment")) return "NES";
		if (combined.Contains("game boy advance") || combined.Contains("gba")) return "GBA";
		if (combined.Contains("game boy color") || combined.Contains("gbc")) return "GBC";
		if (combined.Contains("game boy") || combined.Contains("dmg")) return "GB";
		if (combined.Contains("nintendo 64") || combined.Contains("n64")) return "N64";
		if (combined.Contains("nintendo ds") || combined.Contains("nds")) return "NDS";
		if (combined.Contains("genesis") || combined.Contains("mega drive") || combined.Contains("megadrive")) return "Genesis";
		if (combined.Contains("master system") || combined.Contains("sms")) return "SMS";
		if (combined.Contains("game gear") || combined.Contains("gg")) return "GG";
		if (combined.Contains("pc engine") || combined.Contains("turbografx")) return "PCE";
		if (combined.Contains("saturn")) return "Saturn";
		if (combined.Contains("dreamcast")) return "Dreamcast";
		if (combined.Contains("playstation 2") || combined.Contains("ps2")) return "PS2";
		if (combined.Contains("playstation") || combined.Contains("psx")) return "PSX";

		return "Unknown";
	}

	private static (string? region, IReadOnlyList<string> languages) ParseRegionLanguages(string name) {
		string? region = null;
		var languages = new List<string>();

		// Region detection
		if (name.Contains("(USA)") || name.Contains("(U)")) region = "USA";
		else if (name.Contains("(Europe)") || name.Contains("(E)")) region = "Europe";
		else if (name.Contains("(Japan)") || name.Contains("(J)")) region = "Japan";
		else if (name.Contains("(World)") || name.Contains("(W)")) region = "World";
		else if (name.Contains("(Germany)") || name.Contains("(G)")) region = "Germany";
		else if (name.Contains("(France)") || name.Contains("(F)")) region = "France";
		else if (name.Contains("(Spain)") || name.Contains("(S)")) region = "Spain";
		else if (name.Contains("(Italy)") || name.Contains("(I)")) region = "Italy";
		else if (name.Contains("(Korea)") || name.Contains("(K)")) region = "Korea";
		else if (name.Contains("(China)") || name.Contains("(Ch)")) region = "China";

		// Language extraction
		var langMatch = LanguageRegex().Match(name);
		if (langMatch.Success) {
			var langs = langMatch.Groups[1].Value.Split(',', '+');
			languages.AddRange(langs.Select(l => l.Trim()));
		}

		return (region, languages);
	}

	private static GameCategory DetectCategory(string name, RomFlags flags = RomFlags.None) {
		var lower = name.ToLowerInvariant();

		if (flags.HasFlag(RomFlags.BadDump)) return GameCategory.Other;
		if (flags.HasFlag(RomFlags.Hack) || lower.Contains("[h") || lower.Contains("(hack)")) return GameCategory.Hack;
		if (flags.HasFlag(RomFlags.Translation) || lower.Contains("[t+") || lower.Contains("[t-") || lower.Contains("(translation)")) return GameCategory.Translation;
		if (flags.HasFlag(RomFlags.Homebrew) || lower.Contains("(pd)") || lower.Contains("(homebrew)")) return GameCategory.Homebrew;
		if (flags.HasFlag(RomFlags.Prototype) || lower.Contains("(proto)") || lower.Contains("(prototype)")) return GameCategory.Prototype;
		if (flags.HasFlag(RomFlags.Demo) || lower.Contains("(demo)")) return GameCategory.Demo;
		if (flags.HasFlag(RomFlags.Beta) || lower.Contains("(beta)")) return GameCategory.Beta;
		if (lower.Contains("(unl)") || lower.Contains("(unlicensed)")) return GameCategory.Unlicensed;
		if (lower.Contains("(pirate)") || lower.Contains("[p]")) return GameCategory.Pirate;
		if (lower.Contains("bios")) return GameCategory.BIOS;

		return GameCategory.Commercial;
	}

	private static int? ParseYear(string name) {
		var match = YearRegex().Match(name);
		if (match.Success && int.TryParse(match.Groups[1].Value, out var year)) {
			return year >= 1980 && year <= 2030 ? year : null;
		}
		return null;
	}

	private static RomFlags ParseFlags(string? status, string? gameName) {
		var flags = RomFlags.None;

		if (status?.Equals("verified", StringComparison.OrdinalIgnoreCase) == true) {
			flags |= RomFlags.Verified;
		}
		if (status?.Equals("baddump", StringComparison.OrdinalIgnoreCase) == true) {
			flags |= RomFlags.BadDump;
		}

		// Parse GoodTools-style flags from name
		if (gameName is not null) {
			if (gameName.Contains("[!]")) flags |= RomFlags.Verified;
			if (gameName.Contains("[b")) flags |= RomFlags.BadDump;
			if (gameName.Contains("[o")) flags |= RomFlags.Overdump;
			if (gameName.Contains("[h")) flags |= RomFlags.Hack;
			if (gameName.Contains("[T+") || gameName.Contains("[T-")) flags |= RomFlags.Translation;
			if (gameName.Contains("(PD)")) flags |= RomFlags.Homebrew;
			if (gameName.Contains("(Proto)") || gameName.Contains("(Prototype)")) flags |= RomFlags.Prototype;
			if (gameName.Contains("(Beta)")) flags |= RomFlags.Beta;
			if (gameName.Contains("(Demo)")) flags |= RomFlags.Demo;
			if (gameName.Contains("[a")) flags |= RomFlags.Alternate;
			if (gameName.Contains("[p")) flags |= RomFlags.Pirate;
		}

		return flags;
	}

	[GeneratedRegex(@"^\s*(\w+)\s+(.+)$")]
	private static partial Regex KeyValueRegex();

	[GeneratedRegex(@"(\w+)\s+([""'][^""']+[""']|\S+)")]
	private static partial Regex InlineKvRegex();

	[GeneratedRegex(@"\(M(\d+)\)|\((En|Ja|Fr|De|Es|It|Nl|Pt|Sv|No|Da|Fi|Pl|Ru|Ko|Zh|Tw)[,+]?")]
	private static partial Regex LanguageRegex();

	[GeneratedRegex(@"\((\d{4})\)")]
	private static partial Regex YearRegex();
}
