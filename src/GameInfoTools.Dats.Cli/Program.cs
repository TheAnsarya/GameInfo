using System.Text.Json;
using GameInfoTools.Dats;

// Simple CLI without System.CommandLine for now
if (args.Length == 0) {
	ShowHelp();
	return 0;
}

var command = args[0].ToLowerInvariant();

return command switch {
	"hash" => HashCommand(args[1..]),
	"verify" => VerifyCommand(args[1..]),
	"parse" => ParseCommand(args[1..]),
	"merge" => MergeCommand(args[1..]),
	"scan" => ScanCommand(args[1..]),
	"help" or "--help" or "-h" => ShowHelp(),
	_ => UnknownCommand(command)
};

static int ShowHelp() {
	Console.WriteLine("""
		GameInfo DAT and ROM Management Tools
		
		Usage: dattools <command> [options]
		
		Commands:
		  hash <files...>                    Hash ROM files with multiple algorithms
		    --no-snes                        Don't detect SNES headers
		    --format <text|json|csv>         Output format (default: text)
		
		  verify <files...>                  Verify ROMs against a whitelist
		    --whitelist <file>               JSON whitelist file (required)
		    --strict                         Require exact SHA1 match
		
		  parse <dat-files...>               Parse DAT files (NoIntro, TOSEC, etc.)
		    --output <file>                  Output file (JSON format)
		    --stats                          Show statistics only
		
		  merge <dat-files...>               Merge multiple DAT files into whitelists
		    --output <dir>                   Output directory (default: ./whitelists)
		    --system <name>                  System name (default: SNES)
		
		  scan <directory>                   Scan directory for ROMs and identify them
		    --whitelist <file>               Whitelist to identify against
		    --extensions <ext1,ext2,...>     File extensions (default: .sfc,.smc,.nes,...)
		    --no-recursive                   Don't scan subdirectories
		
		Examples:
		  dattools hash "My Game.sfc"
		  dattools verify *.sfc --whitelist snes-commercial.json
		  dattools merge nointro.dat tosec.dat --system SNES --output ./whitelists
		  dattools scan "C:\ROMs\SNES" --whitelist snes-all.json
		""");
	return 0;
}

static int UnknownCommand(string cmd) {
	Console.Error.WriteLine($"Unknown command: {cmd}");
	Console.Error.WriteLine("Use 'dattools help' for usage information.");
	return 1;
}

static int HashCommand(string[] args) {
	var detectSnes = true;
	var format = "text";
	var files = new List<string>();

	for (var i = 0; i < args.Length; i++) {
		switch (args[i]) {
			case "--no-snes":
				detectSnes = false;
				break;
			case "--format" when i + 1 < args.Length:
				format = args[++i];
				break;
			default:
				files.Add(args[i]);
				break;
		}
	}

	if (files.Count == 0) {
		Console.Error.WriteLine("No files specified. Usage: dattools hash <files...>");
		return 1;
	}

	var results = new List<RomHashes>();

	foreach (var filePath in files) {
		if (!File.Exists(filePath)) {
			Console.Error.WriteLine($"File not found: {filePath}");
			continue;
		}

		var hashes = RomHasher.HashFile(filePath, detectSnes);
		results.Add(hashes);

		if (format == "text") {
			Console.WriteLine($"=== {Path.GetFileName(filePath)} ===");
			Console.WriteLine(hashes);

			if (hashes.SnesChecksum is { } snes) {
				Console.WriteLine();
				Console.WriteLine("SNES Checksum Info:");
				Console.WriteLine(snes);
			}
			Console.WriteLine();
		}
	}

	if (format == "json") {
		var json = JsonSerializer.Serialize(results, new JsonSerializerOptions { WriteIndented = true });
		Console.WriteLine(json);
	}
	else if (format == "csv") {
		Console.WriteLine("Name,FileSize,RomSize,HeaderSize,CRC32,MD5,SHA1,SHA256,SnesValid");
		foreach (var h in results) {
			Console.WriteLine($"{h.Name},{h.FileSize},{h.RomSize},{h.HeaderSize},{h.Crc32},{h.Md5},{h.Sha1},{h.Sha256},{h.SnesChecksum?.IsValid}");
		}
	}

	return 0;
}

static int VerifyCommand(string[] args) {
	string? whitelistPath = null;
	var strict = false;
	var files = new List<string>();

	for (var i = 0; i < args.Length; i++) {
		switch (args[i]) {
			case "--whitelist" when i + 1 < args.Length:
				whitelistPath = args[++i];
				break;
			case "--strict":
				strict = true;
				break;
			default:
				files.Add(args[i]);
				break;
		}
	}

	if (whitelistPath is null) {
		Console.Error.WriteLine("--whitelist is required. Usage: dattools verify <files...> --whitelist <file>");
		return 1;
	}

	if (!File.Exists(whitelistPath)) {
		Console.Error.WriteLine($"Whitelist not found: {whitelistPath}");
		return 1;
	}

	var json = File.ReadAllText(whitelistPath);
	var wl = JsonSerializer.Deserialize<RomWhitelist>(json);
	if (wl is null) {
		Console.Error.WriteLine("Failed to parse whitelist");
		return 1;
	}

	// Index whitelist by hash
	var bySha1 = wl.Entries.Where(e => e.Sha1 is not null)
		.ToDictionary(e => e.Sha1!, StringComparer.OrdinalIgnoreCase);
	var byMd5 = wl.Entries.Where(e => e.Md5 is not null)
		.ToDictionary(e => e.Md5!, StringComparer.OrdinalIgnoreCase);
	var byCrc = wl.Entries.Where(e => e.Crc32 is not null)
		.GroupBy(e => e.Crc32!)
		.ToDictionary(g => g.Key, g => g.ToList(), StringComparer.OrdinalIgnoreCase);

	var verified = 0;
	var failed = 0;

	foreach (var filePath in files) {
		if (!File.Exists(filePath)) {
			Console.Error.WriteLine($"File not found: {filePath}");
			failed++;
			continue;
		}

		var hashes = RomHasher.HashFile(filePath, true);
		WhitelistEntry? match = null;
		var matchType = "";

		// Try SHA1 first (most reliable)
		if (bySha1.TryGetValue(hashes.Sha1, out match)) {
			matchType = "SHA1";
		}
		else if (!strict && byMd5.TryGetValue(hashes.Md5, out match)) {
			matchType = "MD5";
		}
		else if (!strict && byCrc.TryGetValue(hashes.Crc32, out var crcMatches)) {
			// Check size matches for CRC
			match = crcMatches.FirstOrDefault(e => e.Size == hashes.RomSize);
			if (match is not null) matchType = "CRC32+Size";
		}

		if (match is not null) {
			Console.WriteLine($"✓ {Path.GetFileName(filePath)}");
			Console.WriteLine($"  Matched: {match.GameName} ({matchType})");
			Console.WriteLine($"  Category: {match.Category}, Region: {match.Region ?? "Unknown"}");
			verified++;
		}
		else {
			Console.WriteLine($"✗ {Path.GetFileName(filePath)}");
			Console.WriteLine($"  SHA1: {hashes.Sha1}");
			Console.WriteLine($"  Not found in whitelist");
			failed++;
		}
		Console.WriteLine();
	}

	Console.WriteLine($"Results: {verified} verified, {failed} failed/unknown");
	return failed > 0 ? 1 : 0;
}

static int ParseCommand(string[] args) {
	string? outputPath = null;
	var statsOnly = false;
	var datFiles = new List<string>();

	for (var i = 0; i < args.Length; i++) {
		switch (args[i]) {
			case "--output" when i + 1 < args.Length:
				outputPath = args[++i];
				break;
			case "--stats":
				statsOnly = true;
				break;
			default:
				datFiles.Add(args[i]);
				break;
		}
	}

	if (datFiles.Count == 0) {
		Console.Error.WriteLine("No DAT files specified. Usage: dattools parse <dat-files...>");
		return 1;
	}

	var allDats = new List<DatFile>();

	foreach (var datFilePath in datFiles) {
		if (!File.Exists(datFilePath)) {
			Console.Error.WriteLine($"DAT not found: {datFilePath}");
			continue;
		}

		Console.WriteLine($"Parsing: {Path.GetFileName(datFilePath)}");
		var dat = DatParser.ParseFile(datFilePath);
		allDats.Add(dat);

		if (statsOnly) {
			var romCount = dat.Games.Sum(g => g.Roms.Count);
			var categories = dat.Games.GroupBy(g => g.Category)
				.OrderByDescending(g => g.Count())
				.Select(g => $"{g.Key}: {g.Count()}");

			Console.WriteLine($"  Name: {dat.Name}");
			Console.WriteLine($"  System: {dat.System}");
			Console.WriteLine($"  Source: {dat.Source}");
			Console.WriteLine($"  Games: {dat.Games.Count}");
			Console.WriteLine($"  ROMs: {romCount}");
			Console.WriteLine($"  Categories: {string.Join(", ", categories)}");
			Console.WriteLine();
		}
	}

	if (outputPath is not null && !statsOnly) {
		var json = JsonSerializer.Serialize(allDats, new JsonSerializerOptions { WriteIndented = true });
		File.WriteAllText(outputPath, json);
		Console.WriteLine($"Saved to: {outputPath}");
	}

	return 0;
}

static int MergeCommand(string[] args) {
	var outputDir = "./whitelists";
	var system = "SNES";
	var datFiles = new List<string>();

	for (var i = 0; i < args.Length; i++) {
		switch (args[i]) {
			case "--output" when i + 1 < args.Length:
				outputDir = args[++i];
				break;
			case "--system" when i + 1 < args.Length:
				system = args[++i];
				break;
			default:
				datFiles.Add(args[i]);
				break;
		}
	}

	if (datFiles.Count == 0) {
		Console.Error.WriteLine("No DAT files specified. Usage: dattools merge <dat-files...>");
		return 1;
	}

	var merger = new DatMerger();

	foreach (var datFilePath in datFiles) {
		if (!File.Exists(datFilePath)) {
			Console.Error.WriteLine($"DAT not found: {datFilePath}");
			continue;
		}

		Console.WriteLine($"Loading: {Path.GetFileName(datFilePath)}");
		var dat = DatParser.ParseFile(datFilePath);
		merger.AddDat(dat);
	}

	var totalRoms = merger.GetAllRoms().Count;
	var commercial = merger.GetVerifiedCommercialRoms().Count();
	var translations = merger.GetTranslations().Count();
	var hacks = merger.GetHacks().Count();

	Console.WriteLine();
	Console.WriteLine($"Merged Statistics:");
	Console.WriteLine($"  Total ROMs: {totalRoms}");
	Console.WriteLine($"  Commercial (verified): {commercial}");
	Console.WriteLine($"  Translations: {translations}");
	Console.WriteLine($"  Hacks: {hacks}");
	Console.WriteLine();

	Console.WriteLine($"Generating whitelists to: {Path.GetFullPath(outputDir)}");
	WhitelistGenerator.WriteCategorizedLists(merger, outputDir, system);
	Console.WriteLine("Done!");

	return 0;
}

static int ScanCommand(string[] args) {
	string? directory = null;
	string? whitelistPath = null;
	var extensions = new[] { ".sfc", ".smc", ".nes", ".gb", ".gbc", ".gba", ".md", ".sms" };
	var recursive = true;

	for (var i = 0; i < args.Length; i++) {
		switch (args[i]) {
			case "--whitelist" when i + 1 < args.Length:
				whitelistPath = args[++i];
				break;
			case "--extensions" when i + 1 < args.Length:
				extensions = args[++i].Split(',').Select(e => e.Trim()).ToArray();
				break;
			case "--no-recursive":
				recursive = false;
				break;
			default:
				directory ??= args[i];
				break;
		}
	}

	if (directory is null) {
		Console.Error.WriteLine("No directory specified. Usage: dattools scan <directory>");
		return 1;
	}

	if (!Directory.Exists(directory)) {
		Console.Error.WriteLine($"Directory not found: {directory}");
		return 1;
	}

	// Load whitelist if provided
	Dictionary<string, WhitelistEntry>? wlIndex = null;
	if (whitelistPath is not null && File.Exists(whitelistPath)) {
		var json = File.ReadAllText(whitelistPath);
		var wl = JsonSerializer.Deserialize<RomWhitelist>(json);
		if (wl is not null) {
			wlIndex = wl.Entries
				.Where(e => e.Sha1 is not null)
				.ToDictionary(e => e.Sha1!, StringComparer.OrdinalIgnoreCase);
			Console.WriteLine($"Loaded whitelist: {wl.Entries.Count} entries");
		}
	}

	var searchOption = recursive ? SearchOption.AllDirectories : SearchOption.TopDirectoryOnly;
	var extSet = extensions.Select(e => e.StartsWith('.') ? e : $".{e}").ToHashSet(StringComparer.OrdinalIgnoreCase);

	var files = Directory.EnumerateFiles(directory, "*", searchOption)
		.Where(f => extSet.Contains(Path.GetExtension(f)))
		.ToList();

	Console.WriteLine($"Found {files.Count} ROM files");
	Console.WriteLine();

	var identified = 0;
	var unknown = 0;

	foreach (var filePath in files) {
		var hashes = RomHasher.HashFile(filePath, true);
		var relativePath = Path.GetRelativePath(directory, filePath);

		if (wlIndex?.TryGetValue(hashes.Sha1, out var match) == true) {
			Console.WriteLine($"✓ {relativePath}");
			Console.WriteLine($"  → {match.GameName}");
			identified++;
		}
		else {
			Console.WriteLine($"? {relativePath}");
			Console.WriteLine($"  SHA1: {hashes.Sha1}");
			unknown++;
		}
	}

	Console.WriteLine();
	Console.WriteLine($"Identified: {identified}, Unknown: {unknown}");
	return 0;
}
