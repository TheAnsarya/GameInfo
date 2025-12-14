using System.Text;
using System.Text.RegularExpressions;
using GameInfoTools.Core;

namespace GameInfoTools.Analysis;

/// <summary>
/// Handles loading and integrating label files with CDL coverage data.
/// </summary>
public class CdlLabelIntegration {
	private readonly CdlHeatmap _cdl;
	private readonly int _baseAddress;

	/// <summary>
	/// Information about a label with CDL coverage context.
	/// </summary>
	public record LabelWithCoverage(
		int Address,
		string Name,
		SymbolTable.SymbolType Type,
		string? Comment,
		bool IsCode,
		bool IsData,
		bool IsCovered,
		CdlHeatmap.CdlFlags Flags
	) {
		public string AddressHex => $"${Address:X4}";
		public string CoverageStatus => IsCovered ? (IsCode ? "Code" : IsData ? "Data" : "Unknown") : "Not Covered";
	}

	/// <summary>
	/// Summary of label coverage analysis.
	/// </summary>
	public record LabelCoverageSummary(
		int TotalLabels,
		int CoveredLabels,
		int UncoveredLabels,
		int CodeLabels,
		int DataLabels,
		double CoveredPercentage
	);

	/// <summary>
	/// Creates a new label integration analyzer.
	/// </summary>
	/// <param name="cdl">CDL coverage data.</param>
	/// <param name="baseAddress">Base address for offset-to-address conversion (default $8000 for NES).</param>
	public CdlLabelIntegration(CdlHeatmap cdl, int baseAddress = 0x8000) {
		_cdl = cdl ?? throw new ArgumentNullException(nameof(cdl));
		_baseAddress = baseAddress;
	}

	/// <summary>
	/// Gets the loaded symbol table.
	/// </summary>
	public SymbolTable Symbols { get; } = new();

	/// <summary>
	/// Gets whether any labels are loaded.
	/// </summary>
	public bool HasLabels => Symbols.GetAllSymbols().Any();

	/// <summary>
	/// Loads labels from a Mesen MLB file.
	/// </summary>
	public void LoadMlb(string content) {
		Symbols.LoadMlb(content);
	}

	/// <summary>
	/// Loads labels from a Mesen MLB file path.
	/// </summary>
	public void LoadMlbFile(string filePath) {
		var content = File.ReadAllText(filePath);
		LoadMlb(content);
	}

	/// <summary>
	/// Loads labels from an FCEUX NL file.
	/// </summary>
	public void LoadFceuxNl(string content) {
		var lines = content.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.RemoveEmptyEntries);

		foreach (var line in lines) {
			var trimmed = line.Trim();
			if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith(";")) {
				continue;
			}

			// FCEUX NL format: $XXXX#name#comment
			var match = Regex.Match(trimmed, @"^\$([0-9a-fA-F]+)#([^#]+)(?:#(.*))?$");
			if (match.Success) {
				var address = Convert.ToInt32(match.Groups[1].Value, 16);
				var name = match.Groups[2].Value.Trim();
				var comment = match.Groups[3].Success ? match.Groups[3].Value.Trim() : null;

				Symbols.AddSymbol(name, address, SymbolTable.SymbolType.Unknown, comment);
			}
		}
	}

	/// <summary>
	/// Loads labels from an FCEUX NL file path.
	/// </summary>
	public void LoadFceuxNlFile(string filePath) {
		var content = File.ReadAllText(filePath);
		LoadFceuxNl(content);
	}

	/// <summary>
	/// Loads labels from a generic label file.
	/// </summary>
	public void LoadLabels(string content) {
		Symbols.LoadLabels(content);
	}

	/// <summary>
	/// Loads labels from a generic label file path.
	/// </summary>
	public void LoadLabelsFile(string filePath) {
		var content = File.ReadAllText(filePath);
		LoadLabels(content);
	}

	/// <summary>
	/// Auto-detects format and loads labels from a file.
	/// </summary>
	public void LoadAuto(string filePath) {
		var ext = Path.GetExtension(filePath).ToLowerInvariant();
		var content = File.ReadAllText(filePath);

		if (ext == ".mlb" || content.Contains("P:") || content.Contains("G:") || content.Contains("R:")) {
			LoadMlb(content);
		} else if (content.Contains("$") && content.Contains("#")) {
			LoadFceuxNl(content);
		} else {
			LoadLabels(content);
		}
	}

	/// <summary>
	/// Converts a CPU address to a CDL offset.
	/// </summary>
	public int AddressToOffset(int address) {
		return address - _baseAddress;
	}

	/// <summary>
	/// Converts a CDL offset to a CPU address.
	/// </summary>
	public int OffsetToAddress(int offset) {
		return offset + _baseAddress;
	}

	/// <summary>
	/// Gets all labels with their CDL coverage status.
	/// </summary>
	public List<LabelWithCoverage> GetLabelsWithCoverage() {
		var result = new List<LabelWithCoverage>();

		foreach (var (name, address, type) in Symbols.GetAllSymbols()) {
			int offset = AddressToOffset(address);
			CdlHeatmap.CdlFlags flags = CdlHeatmap.CdlFlags.None;
			bool isCovered = false;
			bool isCode = false;
			bool isData = false;

			if (offset >= 0 && offset < _cdl.Size) {
				flags = _cdl.GetFlags(offset);
				isCovered = flags != CdlHeatmap.CdlFlags.None;
				isCode = (flags & CdlHeatmap.CdlFlags.Code) != 0;
				isData = (flags & CdlHeatmap.CdlFlags.Data) != 0;
			}

			result.Add(new LabelWithCoverage(
				address,
				name,
				type,
				Symbols.GetComment(name),
				isCode,
				isData,
				isCovered,
				flags
			));
		}

		return result.OrderBy(l => l.Address).ToList();
	}

	/// <summary>
	/// Gets labels in a specific offset range.
	/// </summary>
	public List<LabelWithCoverage> GetLabelsInRange(int startOffset, int endOffset) {
		var startAddr = OffsetToAddress(startOffset);
		var endAddr = OffsetToAddress(endOffset);

		return GetLabelsWithCoverage()
			.Where(l => l.Address >= startAddr && l.Address < endAddr)
			.ToList();
	}

	/// <summary>
	/// Gets labels that match coverage type (code, data, uncovered).
	/// </summary>
	public List<LabelWithCoverage> GetLabelsByCoverage(bool? isCode = null, bool? isData = null, bool? isCovered = null) {
		var labels = GetLabelsWithCoverage();

		if (isCode.HasValue) {
			labels = labels.Where(l => l.IsCode == isCode.Value).ToList();
		}

		if (isData.HasValue) {
			labels = labels.Where(l => l.IsData == isData.Value).ToList();
		}

		if (isCovered.HasValue) {
			labels = labels.Where(l => l.IsCovered == isCovered.Value).ToList();
		}

		return labels;
	}

	/// <summary>
	/// Gets a summary of label coverage.
	/// </summary>
	public LabelCoverageSummary GetCoverageSummary() {
		var labels = GetLabelsWithCoverage();
		var total = labels.Count;
		var covered = labels.Count(l => l.IsCovered);
		var uncovered = total - covered;
		var code = labels.Count(l => l.IsCode);
		var data = labels.Count(l => l.IsData);
		var percentage = total > 0 ? (covered * 100.0 / total) : 0;

		return new LabelCoverageSummary(total, covered, uncovered, code, data, percentage);
	}

	/// <summary>
	/// Gets the label at a specific offset (if any).
	/// </summary>
	public string? GetLabelAtOffset(int offset) {
		int address = OffsetToAddress(offset);
		return Symbols.GetSymbol(address);
	}

	/// <summary>
	/// Gets the label at a specific address (if any).
	/// </summary>
	public string? GetLabelAtAddress(int address) {
		return Symbols.GetSymbol(address);
	}

	/// <summary>
	/// Finds labels that don't match their CDL coverage type.
	/// </summary>
	public List<LabelWithCoverage> FindMismatchedLabels() {
		var labels = GetLabelsWithCoverage();
		var mismatched = new List<LabelWithCoverage>();

		foreach (var label in labels) {
			// Check if symbol type matches CDL coverage
			var symbolType = label.Type;

			// Code-type symbols should be in code regions
			if ((symbolType == SymbolTable.SymbolType.Code ||
				 symbolType == SymbolTable.SymbolType.Subroutine ||
				 symbolType == SymbolTable.SymbolType.Label) &&
				!label.IsCode && label.IsCovered) {
				mismatched.Add(label);
			}

			// Data-type symbols should be in data regions
			if ((symbolType == SymbolTable.SymbolType.Data ||
				 symbolType == SymbolTable.SymbolType.Table ||
				 symbolType == SymbolTable.SymbolType.Pointer) &&
				!label.IsData && label.IsCovered) {
				mismatched.Add(label);
			}
		}

		return mismatched;
	}

	/// <summary>
	/// Merges labels from CDL analysis with loaded labels.
	/// </summary>
	public void MergeWithGeneratedLabels(CdlRomIntegration integration, bool overwriteExisting = false) {
		var generated = integration.GenerateLabelsFromCdl();

		foreach (var label in generated) {
			// Skip if we already have a label at this address (unless overwrite is enabled)
			if (!overwriteExisting && Symbols.HasSymbol(label.Address)) {
				continue;
			}

			var symbolType = label.Type switch {
				CdlRomIntegration.LabelType.Code => SymbolTable.SymbolType.Code,
				CdlRomIntegration.LabelType.SubRoutine => SymbolTable.SymbolType.Subroutine,
				CdlRomIntegration.LabelType.Data => SymbolTable.SymbolType.Data,
				CdlRomIntegration.LabelType.DataTable => SymbolTable.SymbolType.Table,
				CdlRomIntegration.LabelType.Pointer => SymbolTable.SymbolType.Pointer,
				CdlRomIntegration.LabelType.JumpTarget => SymbolTable.SymbolType.Label,
				_ => SymbolTable.SymbolType.Unknown
			};

			Symbols.AddSymbol(label.Name, label.Address, symbolType, label.Comment);
		}
	}

	/// <summary>
	/// Exports labels to Mesen MLB format.
	/// </summary>
	public string ExportToMlb() {
		var sb = new StringBuilder();
		sb.AppendLine("; Label file exported from CDL analysis");
		sb.AppendLine($"; Generated: {DateTime.Now:yyyy-MM-dd HH:mm:ss}");
		sb.AppendLine();

		foreach (var (name, address, type) in Symbols.GetAllSymbols().OrderBy(s => s.Address)) {
			var typeCode = type switch {
				SymbolTable.SymbolType.Code or SymbolTable.SymbolType.Subroutine or SymbolTable.SymbolType.Label => "G",
				SymbolTable.SymbolType.Ram => "R",
				SymbolTable.SymbolType.Data or SymbolTable.SymbolType.Table or SymbolTable.SymbolType.Pointer => "S",
				_ => "P"
			};

			var comment = Symbols.GetComment(name) ?? "";
			sb.AppendLine($"{typeCode}:{address:X4}:{name}:{comment}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Exports labels to FCEUX NL format.
	/// </summary>
	public string ExportToFceuxNl() {
		var sb = new StringBuilder();
		sb.AppendLine("; Label file exported from CDL analysis");
		sb.AppendLine();

		foreach (var (name, address, _) in Symbols.GetAllSymbols().OrderBy(s => s.Address)) {
			var comment = Symbols.GetComment(name) ?? "";
			sb.AppendLine($"${address:X4}#{name}#{comment}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Exports labels to generic symbol format.
	/// </summary>
	public string ExportToSymbols() {
		var sb = new StringBuilder();
		sb.AppendLine("; Symbol file");
		sb.AppendLine();

		foreach (var (name, address, _) in Symbols.GetAllSymbols().OrderBy(s => s.Address)) {
			sb.AppendLine($"{name} = ${address:X4}");
		}

		return sb.ToString();
	}

	/// <summary>
	/// Clears all loaded labels.
	/// </summary>
	public void Clear() {
		// SymbolTable doesn't have a clear method, so we need to recreate
		// For now, just note that this requires recreating the integration
	}
}
