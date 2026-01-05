namespace GameInfoTools.Dats;

/// <summary>
/// Merges multiple DAT files into a unified whitelist.
/// </summary>
public sealed class DatMerger {
	private readonly Dictionary<string, MergedRomInfo> _romsBySha1 = new(StringComparer.OrdinalIgnoreCase);
	private readonly Dictionary<string, MergedRomInfo> _romsByMd5 = new(StringComparer.OrdinalIgnoreCase);
	private readonly Dictionary<string, MergedRomInfo> _romsByCrc = new(StringComparer.OrdinalIgnoreCase);

	/// <summary>
	/// Priority order for sources when merging (higher priority sources win for naming).
	/// </summary>
	public List<DatSource> SourcePriority { get; } = [
		DatSource.NoIntro,    // Most accurate/curated
		DatSource.Redump,     // Good for disc-based
		DatSource.TOSEC,      // Comprehensive
		DatSource.OpenGood,   // GoodTools archive
		DatSource.GoodTools,  // Legacy
		DatSource.Custom,
		DatSource.Unknown
	];

	/// <summary>
	/// Adds a DAT file to the merger.
	/// </summary>
	public void AddDat(DatFile dat) {
		foreach (var game in dat.Games) {
			foreach (var rom in game.Roms) {
				var info = new MergedRomInfo {
					PrimaryName = rom.Name,
					GameName = game.Name,
					Size = rom.Size,
					Crc32 = rom.Crc32,
					Md5 = rom.Md5,
					Sha1 = rom.Sha1,
					Sha256 = rom.Sha256,
					Sources = [dat.Source],
					SourceNames = new Dictionary<DatSource, string> { [dat.Source] = rom.Name },
					Category = game.Category,
					Region = game.Region,
					Flags = rom.Flags,
					Serial = rom.Serial
				};

				MergeRom(info);
			}
		}
	}

	private void MergeRom(MergedRomInfo newInfo) {
		MergedRomInfo? existing = null;

		// Try to find existing by hashes (prefer SHA1 > MD5 > CRC32)
		if (newInfo.Sha1 is not null && _romsBySha1.TryGetValue(newInfo.Sha1, out existing)) {
		}
		else if (newInfo.Md5 is not null && _romsByMd5.TryGetValue(newInfo.Md5, out existing)) {
		}
		else if (newInfo.Crc32 is not null && _romsByCrc.TryGetValue(newInfo.Crc32, out existing)) {
			// Only match by CRC if size matches
			if (existing.Size != newInfo.Size) {
				existing = null;
			}
		}

		if (existing is not null) {
			// Merge sources
			foreach (var source in newInfo.Sources) {
				if (!existing.Sources.Contains(source)) {
					existing.Sources.Add(source);
				}
			}

			// Merge source names
			foreach (var (source, name) in newInfo.SourceNames) {
				existing.SourceNames.TryAdd(source, name);
			}

			// Fill in missing hashes
			existing.Sha1 ??= newInfo.Sha1;
			existing.Sha256 ??= newInfo.Sha256;
			existing.Md5 ??= newInfo.Md5;
			existing.Crc32 ??= newInfo.Crc32;
			existing.Serial ??= newInfo.Serial;

			// Update flags (OR them together)
			existing.Flags |= newInfo.Flags;

			// Use higher priority source for primary name
			var existingPriority = GetSourcePriority(existing.Sources);
			var newPriority = GetSourcePriority(newInfo.Sources);
			if (newPriority < existingPriority) {
				existing.PrimaryName = newInfo.PrimaryName;
				existing.GameName = newInfo.GameName;
			}

			// Re-index if we got new hashes
			IndexRom(existing);
		}
		else {
			// New ROM
			IndexRom(newInfo);
		}
	}

	private void IndexRom(MergedRomInfo info) {
		if (info.Sha1 is not null) {
			_romsBySha1[info.Sha1] = info;
		}
		if (info.Md5 is not null) {
			_romsByMd5[info.Md5] = info;
		}
		if (info.Crc32 is not null && info.Size > 0) {
			_romsByCrc[$"{info.Crc32}:{info.Size}"] = info;
		}
	}

	private int GetSourcePriority(IEnumerable<DatSource> sources) {
		var minPriority = int.MaxValue;
		foreach (var source in sources) {
			var idx = SourcePriority.IndexOf(source);
			if (idx >= 0 && idx < minPriority) {
				minPriority = idx;
			}
		}
		return minPriority;
	}

	/// <summary>
	/// Gets all merged ROMs.
	/// </summary>
	public IReadOnlyCollection<MergedRomInfo> GetAllRoms() => _romsBySha1.Values.ToList();

	/// <summary>
	/// Gets ROMs filtered by category.
	/// </summary>
	public IEnumerable<MergedRomInfo> GetRomsByCategory(params GameCategory[] categories) {
		var cats = categories.ToHashSet();
		return _romsBySha1.Values.Where(r => cats.Contains(r.Category));
	}

	/// <summary>
	/// Gets only verified commercial ROMs.
	/// </summary>
	public IEnumerable<MergedRomInfo> GetVerifiedCommercialRoms() {
		return _romsBySha1.Values.Where(r =>
			r.Category == GameCategory.Commercial &&
			r.Flags.HasFlag(RomFlags.Verified) &&
			!r.Flags.HasFlag(RomFlags.BadDump));
	}

	/// <summary>
	/// Gets translations only.
	/// </summary>
	public IEnumerable<MergedRomInfo> GetTranslations() {
		return _romsBySha1.Values.Where(r =>
			r.Category == GameCategory.Translation ||
			r.Flags.HasFlag(RomFlags.Translation));
	}

	/// <summary>
	/// Gets hacks only.
	/// </summary>
	public IEnumerable<MergedRomInfo> GetHacks() {
		return _romsBySha1.Values.Where(r =>
			r.Category == GameCategory.Hack ||
			r.Flags.HasFlag(RomFlags.Hack));
	}

	/// <summary>
	/// Tries to find a ROM by any hash.
	/// </summary>
	public MergedRomInfo? FindByHash(string? sha1 = null, string? sha256 = null, string? md5 = null, string? crc32 = null, long? size = null) {
		if (sha1 is not null && _romsBySha1.TryGetValue(sha1, out var rom)) {
			return rom;
		}
		if (md5 is not null && _romsByMd5.TryGetValue(md5, out rom)) {
			return rom;
		}
		if (crc32 is not null && size.HasValue && _romsByCrc.TryGetValue($"{crc32}:{size}", out rom)) {
			return rom;
		}
		return null;
	}

	/// <summary>
	/// Creates a whitelist of known good ROMs.
	/// </summary>
	public RomWhitelist CreateWhitelist(string name, string system, WhitelistOptions? options = null) {
		options ??= new WhitelistOptions();

		var roms = _romsBySha1.Values.AsEnumerable();

		// Filter by options
		if (options.OnlyVerified) {
			roms = roms.Where(r => r.Flags.HasFlag(RomFlags.Verified));
		}
		if (options.ExcludeBadDumps) {
			roms = roms.Where(r => !r.Flags.HasFlag(RomFlags.BadDump));
		}
		if (options.Categories.Count > 0) {
			roms = roms.Where(r => options.Categories.Contains(r.Category));
		}
		if (options.MinSourceCount > 1) {
			roms = roms.Where(r => r.Sources.Count >= options.MinSourceCount);
		}
		if (options.RequiredSources.Count > 0) {
			roms = roms.Where(r => options.RequiredSources.All(s => r.Sources.Contains(s)));
		}

		return new RomWhitelist {
			Name = name,
			System = system,
			GeneratedDate = DateOnly.FromDateTime(DateTime.UtcNow),
			Entries = roms.Select(r => new WhitelistEntry {
				Name = r.PrimaryName,
				GameName = r.GameName,
				Size = r.Size,
				Crc32 = r.Crc32,
				Md5 = r.Md5,
				Sha1 = r.Sha1,
				Sha256 = r.Sha256,
				Category = r.Category,
				Region = r.Region,
				Verified = r.Flags.HasFlag(RomFlags.Verified),
				SourceCount = r.Sources.Count
			}).ToList()
		};
	}
}

/// <summary>
/// Merged ROM information from multiple sources.
/// </summary>
public sealed class MergedRomInfo {
	public required string PrimaryName { get; set; }
	public required string GameName { get; set; }
	public required long Size { get; set; }
	public string? Crc32 { get; set; }
	public string? Md5 { get; set; }
	public string? Sha1 { get; set; }
	public string? Sha256 { get; set; }
	public string? Serial { get; set; }
	public List<DatSource> Sources { get; set; } = [];
	public Dictionary<DatSource, string> SourceNames { get; set; } = [];
	public GameCategory Category { get; set; }
	public string? Region { get; set; }
	public RomFlags Flags { get; set; }
}

/// <summary>
/// Options for whitelist generation.
/// </summary>
public sealed class WhitelistOptions {
	/// <summary>Only include verified ROMs</summary>
	public bool OnlyVerified { get; set; }

	/// <summary>Exclude bad dumps</summary>
	public bool ExcludeBadDumps { get; set; } = true;

	/// <summary>Categories to include (empty = all)</summary>
	public List<GameCategory> Categories { get; set; } = [];

	/// <summary>Minimum number of sources that must agree</summary>
	public int MinSourceCount { get; set; } = 1;

	/// <summary>Required sources (ROM must be in all of these)</summary>
	public List<DatSource> RequiredSources { get; set; } = [];
}

/// <summary>
/// A whitelist of known good ROMs.
/// </summary>
public sealed class RomWhitelist {
	public required string Name { get; init; }
	public required string System { get; init; }
	public DateOnly GeneratedDate { get; init; }
	public List<WhitelistEntry> Entries { get; init; } = [];
}

/// <summary>
/// A single entry in the whitelist.
/// </summary>
public sealed record WhitelistEntry {
	public required string Name { get; init; }
	public required string GameName { get; init; }
	public required long Size { get; init; }
	public string? Crc32 { get; init; }
	public string? Md5 { get; init; }
	public string? Sha1 { get; init; }
	public string? Sha256 { get; init; }
	public GameCategory Category { get; init; }
	public string? Region { get; init; }
	public bool Verified { get; init; }
	public int SourceCount { get; init; }
}
