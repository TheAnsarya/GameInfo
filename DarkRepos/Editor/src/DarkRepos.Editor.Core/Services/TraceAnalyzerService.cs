using System.Text;
using System.Text.RegularExpressions;

namespace DarkRepos.Editor.Core.Services;

/// <summary>
/// Service for analyzing execution traces and CDL (Code-Data Logger) files.
/// CDL files are produced by emulators like Mesen/Snes9x and indicate which
/// bytes in ROM are code vs data based on actual execution.
/// </summary>
public partial class TraceAnalyzerService : ITraceAnalyzerService {
	/// <summary>
	/// CDL byte flag values (Mesen format for SNES).
	/// </summary>
	[Flags]
	public enum CdlFlags : byte {
		None = 0x00,
		Code = 0x01,       // Byte was executed as code
		Data = 0x02,       // Byte was read as data
		Drawn = 0x04,      // Byte was used as graphics
		IndexMode8 = 0x10, // X/Y were 8-bit when accessed
		MemoryMode8 = 0x20 // A was 8-bit when accessed
	}

	/// <summary>
	/// Summary statistics from CDL analysis.
	/// </summary>
	public record CdlSummary(
		int TotalBytes,
		int CodeBytes,
		int DataBytes,
		int DrawnBytes,
		int UnknownBytes,
		double CodePercent,
		double DataPercent,
		double DrawnPercent,
		double UnknownPercent
	);

	/// <summary>
	/// Represents a contiguous region identified in CDL data.
	/// </summary>
	public record CdlRegion(
		int StartAddress,
		int EndAddress,
		CdlFlags Flags,
		string Type
	) {
		public int Length => EndAddress - StartAddress + 1;
	}

	/// <summary>
	/// Parsed trace log entry.
	/// </summary>
	public record TraceEntry(
		int Address,
		byte[] Bytes,
		string Mnemonic,
		string Operand,
		ushort A,
		ushort X,
		ushort Y,
		ushort S,
		ushort D,
		byte DB,
		byte P
	);

	private byte[]? _cdlData;
	private readonly List<TraceEntry> _traceEntries = [];

	/// <summary>
	/// Loads a CDL file from the specified path.
	/// </summary>
	public void LoadCdl(string filePath) {
		_cdlData = File.ReadAllBytes(filePath);
	}

	/// <summary>
	/// Loads CDL data from a byte array.
	/// </summary>
	public void LoadCdl(byte[] data) {
		_cdlData = data;
	}

	/// <summary>
	/// Gets CDL flags for a specific address.
	/// </summary>
	public CdlFlags GetFlags(int address) {
		if (_cdlData == null || address < 0 || address >= _cdlData.Length) {
			return CdlFlags.None;
		}
		return (CdlFlags)_cdlData[address];
	}

	/// <summary>
	/// Checks if an address was executed as code.
	/// </summary>
	public bool IsCode(int address) => GetFlags(address).HasFlag(CdlFlags.Code);

	/// <summary>
	/// Checks if an address was read as data.
	/// </summary>
	public bool IsData(int address) => GetFlags(address).HasFlag(CdlFlags.Data);

	/// <summary>
	/// Checks if an address was used as graphics.
	/// </summary>
	public bool IsDrawn(int address) => GetFlags(address).HasFlag(CdlFlags.Drawn);

	/// <summary>
	/// Gets summary statistics for the loaded CDL data.
	/// </summary>
	public CdlSummary? GetSummary() {
		if (_cdlData == null) return null;

		int code = 0, data = 0, drawn = 0;

		foreach (var b in _cdlData) {
			var flags = (CdlFlags)b;
			if (flags.HasFlag(CdlFlags.Code)) code++;
			if (flags.HasFlag(CdlFlags.Data)) data++;
			if (flags.HasFlag(CdlFlags.Drawn)) drawn++;
		}

		int unknown = _cdlData.Length - (code + data + drawn);
		// Adjust for overlap
		if (unknown < 0) unknown = 0;

		// Count bytes that have no flags set
		unknown = _cdlData.Count(b => b == 0);

		return new CdlSummary(
			_cdlData.Length,
			code,
			data,
			drawn,
			unknown,
			100.0 * code / _cdlData.Length,
			100.0 * data / _cdlData.Length,
			100.0 * drawn / _cdlData.Length,
			100.0 * unknown / _cdlData.Length
		);
	}

	/// <summary>
	/// Gets contiguous regions of the same type from CDL data.
	/// </summary>
	public List<CdlRegion> GetRegions(int minSize = 16) {
		if (_cdlData == null) return [];

		var regions = new List<CdlRegion>();
		int regionStart = 0;
		CdlFlags currentFlags = GetFlags(0);

		for (int i = 1; i < _cdlData.Length; i++) {
			var flags = GetFlags(i);
			if (flags != currentFlags) {
				int length = i - regionStart;
				if (length >= minSize) {
					regions.Add(new CdlRegion(
						regionStart,
						i - 1,
						currentFlags,
						GetTypeString(currentFlags)
					));
				}
				regionStart = i;
				currentFlags = flags;
			}
		}

		// Add final region
		if (_cdlData.Length - regionStart >= minSize) {
			regions.Add(new CdlRegion(
				regionStart,
				_cdlData.Length - 1,
				currentFlags,
				GetTypeString(currentFlags)
			));
		}

		return regions;
	}

	/// <summary>
	/// Parses a Snes9x trace log file.
	/// </summary>
	public void LoadTraceLog(string filePath) {
		_traceEntries.Clear();
		var lines = File.ReadAllLines(filePath);

		foreach (var line in lines) {
			var entry = ParseTraceLine(line);
			if (entry != null) {
				_traceEntries.Add(entry);
			}
		}
	}

	/// <summary>
	/// Gets all loaded trace entries.
	/// </summary>
	public IReadOnlyList<TraceEntry> GetTraceEntries() => _traceEntries.AsReadOnly();

	/// <summary>
	/// Gets unique addresses accessed in the trace.
	/// </summary>
	public HashSet<int> GetUniqueAddresses() => _traceEntries.Select(e => e.Address).ToHashSet();

	/// <summary>
	/// Gets a histogram of instruction mnemonics from the trace.
	/// </summary>
	public Dictionary<string, int> GetMnemonicHistogram() {
		var histogram = new Dictionary<string, int>();
		foreach (var entry in _traceEntries) {
			if (!histogram.TryAdd(entry.Mnemonic, 1)) {
				histogram[entry.Mnemonic]++;
			}
		}
		return histogram.OrderByDescending(kv => kv.Value).ToDictionary();
	}

	/// <summary>
	/// Gets addresses accessed in a specific address range.
	/// </summary>
	public List<TraceEntry> GetEntriesInRange(int startAddress, int endAddress) =>
		_traceEntries.Where(e => e.Address >= startAddress && e.Address <= endAddress).ToList();

	/// <summary>
	/// Exports CDL data to a human-readable format.
	/// </summary>
	public string ExportCdlReport(int startAddress = 0, int length = -1) {
		if (_cdlData == null) return "No CDL data loaded.";

		if (length < 0) length = _cdlData.Length - startAddress;
		var sb = new StringBuilder();

		sb.AppendLine("CDL Analysis Report");
		sb.AppendLine("===================");

		var summary = GetSummary();
		if (summary != null) {
			sb.AppendLine($"Total bytes: {summary.TotalBytes:N0}");
			sb.AppendLine($"Code bytes:  {summary.CodeBytes:N0} ({summary.CodePercent:F2}%)");
			sb.AppendLine($"Data bytes:  {summary.DataBytes:N0} ({summary.DataPercent:F2}%)");
			sb.AppendLine($"Drawn bytes: {summary.DrawnBytes:N0} ({summary.DrawnPercent:F2}%)");
			sb.AppendLine($"Unknown:     {summary.UnknownBytes:N0} ({summary.UnknownPercent:F2}%)");
			sb.AppendLine();
		}

		sb.AppendLine("Regions:");
		var regions = GetRegions();
		foreach (var region in regions.Take(100)) {
			sb.AppendLine($"  ${region.StartAddress:x6}-${region.EndAddress:x6}: {region.Type} ({region.Length:N0} bytes)");
		}

		if (regions.Count > 100) {
			sb.AppendLine($"  ... and {regions.Count - 100} more regions");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Parses a single Snes9x trace line.
	/// Format: "C0936F $08             PHP                             A:0000 X:0010 Y:0004 S:03F9 D:00C0 DB:7F P:nvmxdIZc V:26  H:264"
	/// </summary>
	private TraceEntry? ParseTraceLine(string line) {
		if (string.IsNullOrWhiteSpace(line)) return null;

		var match = TraceLineRegex().Match(line);
		if (!match.Success) return null;

		try {
			int address = Convert.ToInt32(match.Groups["addr"].Value, 16);
			string bytesHex = match.Groups["bytes"].Value.Replace("$", "").Replace(" ", "");
			byte[] bytes = ConvertHexStringToBytes(bytesHex);
			string mnemonic = match.Groups["mnemonic"].Value.Trim();
			string operand = match.Groups["operand"].Value.Trim();
			ushort a = Convert.ToUInt16(match.Groups["a"].Value, 16);
			ushort x = Convert.ToUInt16(match.Groups["x"].Value, 16);
			ushort y = Convert.ToUInt16(match.Groups["y"].Value, 16);
			ushort s = Convert.ToUInt16(match.Groups["s"].Value, 16);
			ushort d = Convert.ToUInt16(match.Groups["d"].Value, 16);
			byte db = Convert.ToByte(match.Groups["db"].Value, 16);
			byte p = ParseStatusFlags(match.Groups["p"].Value);

			return new TraceEntry(address, bytes, mnemonic, operand, a, x, y, s, d, db, p);
		} catch {
			return null;
		}
	}

	private static string GetTypeString(CdlFlags flags) {
		if (flags == CdlFlags.None) return "Unknown";
		var parts = new List<string>();
		if (flags.HasFlag(CdlFlags.Code)) parts.Add("Code");
		if (flags.HasFlag(CdlFlags.Data)) parts.Add("Data");
		if (flags.HasFlag(CdlFlags.Drawn)) parts.Add("Graphics");
		return string.Join("+", parts);
	}

	private static byte[] ConvertHexStringToBytes(string hex) {
		if (string.IsNullOrEmpty(hex)) return [];
		var bytes = new byte[hex.Length / 2];
		for (int i = 0; i < bytes.Length; i++) {
			bytes[i] = Convert.ToByte(hex.Substring(i * 2, 2), 16);
		}
		return bytes;
	}

	private static byte ParseStatusFlags(string flags) {
		byte result = 0;
		if (flags.Contains('N') || flags.Contains('n')) {
			if (char.IsUpper(flags[flags.IndexOfAny(['N', 'n'])])) result |= 0x80;
		}
		// Simplified - full implementation would parse all flags
		return result;
	}

	[GeneratedRegex(@"^(?<addr>[0-9A-F]{6})\s+(?<bytes>\$[0-9A-F]{2}(?:\s+\$[0-9A-F]{2})*)\s+(?<mnemonic>[A-Z]{3})\s*(?<operand>[^\s]*)\s+A:(?<a>[0-9A-F]{4})\s+X:(?<x>[0-9A-F]{4})\s+Y:(?<y>[0-9A-F]{4})\s+S:(?<s>[0-9A-F]{4})\s+D:(?<d>[0-9A-F]{4})\s+DB:(?<db>[0-9A-F]{2})\s+P:(?<p>[a-zA-Z]+)", RegexOptions.IgnoreCase)]
	private static partial Regex TraceLineRegex();
}

/// <summary>
/// Interface for trace analysis services.
/// </summary>
public interface ITraceAnalyzerService {
	void LoadCdl(string filePath);
	void LoadCdl(byte[] data);
	TraceAnalyzerService.CdlFlags GetFlags(int address);
	bool IsCode(int address);
	bool IsData(int address);
	bool IsDrawn(int address);
	TraceAnalyzerService.CdlSummary? GetSummary();
	List<TraceAnalyzerService.CdlRegion> GetRegions(int minSize = 16);
	void LoadTraceLog(string filePath);
	IReadOnlyList<TraceAnalyzerService.TraceEntry> GetTraceEntries();
	HashSet<int> GetUniqueAddresses();
	Dictionary<string, int> GetMnemonicHistogram();
	List<TraceAnalyzerService.TraceEntry> GetEntriesInRange(int startAddress, int endAddress);
	string ExportCdlReport(int startAddress = 0, int length = -1);
}
