namespace DarkRepos.Editor.Core.Services.Games;

/// <summary>
/// DQ3r-specific trace analysis service.
/// Integrates CDL data and trace logs with known DQ3r ROM structure.
/// </summary>
public class DQ3rTraceService : IDQ3rTraceService
{
	private readonly ITraceAnalyzerService _traceAnalyzer;
	private bool _cdlLoaded;

	/// <summary>
	/// Known function addresses from trace analysis.
	/// </summary>
	public static readonly Dictionary<int, string> KnownFunctions = new()
	{
		// Main game loop (Bank $C0)
		[0xc0936f] = "UpdateStateMachine",
		[0xc600bd] = "MainLoopJsl_C6061F",
		[0xc600c1] = "MainLoopJsl_C609E0",
		[0xc600c5] = "MainLoopJsl_C6029A",
		[0xc600c9] = "AudioAndJoypad",
		[0xc600cd] = "TilemapTransform",
		[0xc600d1] = "MainLoopJsl_C60951",
		[0xc600d5] = "MainLoopJsl_C60706",
		[0xc600d9] = "LoadTiles",
		[0xc600dd] = "MainLoopJsl_C60F98",
		[0xc600e1] = "MainLoopJsl_C6072B",
		[0xc600f1] = "TilemapECC6",
		[0xc600f9] = "MainLoopJsl_C0629E",
		[0xc600fd] = "MainLoopJsl_C907CC",

		// Compression routines
		[0xc0539b] = "DecompressOverworldMap",
		[0xc02b70] = "MenuPaddingRoutine",
		[0xc02b8d] = "InsertDummySpace",

		// Menu system (Bank $C9)
		[0xc90717] = "MenuSizeHandler",
		[0xc902b1] = "MenuDataLookup",

		// Graphics/DMA
		[0xc60654] = "TilemapHandler",
		[0xc6061f] = "GraphicsRoutine1",
		[0xc609e0] = "GraphicsRoutine2",
		[0xc6029a] = "GraphicsRoutine3",
		[0xc60f42] = "AudioJoypadHandler",
		[0xc60286] = "TilemapTransformC086",
		[0xc60951] = "GraphicsRoutine5",
		[0xc60706] = "GraphicsRoutine6",
		[0xc60b57] = "TileLoadRoutine",
		[0xc60f98] = "GraphicsRoutine8",
		[0xc6072b] = "GraphicsRoutine9",

		// Text/Dialog
		[0xc10ed3] = "DialogFontData",
		[0xc151aa] = "FontMetadataTable",
	};

	/// <summary>
	/// Known RAM addresses from trace analysis.
	/// </summary>
	public static readonly Dictionary<int, string> KnownRamAddresses = new()
	{
		// Game state
		[0x7edd45] = "GameStateFlag1",
		[0x7edd47] = "GameStateFlag2",
		[0x7e3696] = "CurrentGold",
		[0x7e3725] = "BagItems",
		[0x7e3825] = "BagItemCounts",
		[0x7e3925] = "HeroStats",

		// Graphics state (OAM)
		[0x7edb1f] = "OamSpriteData",
		[0x7edb20] = "SpriteY_0",
		[0x7edb24] = "SpriteY_1",
		[0x7edb28] = "SpriteY_2",

		// DMA scheduling
		[0x7e8bae] = "DmaSourceAddresses",
		[0x7e8dae] = "DmaSourceBanks",
		[0x7e8fae] = "DmaVramDestinations",
		[0x7e91ae] = "DmaTransferSizes",
		[0x7e93ae] = "DmaTransferCount",

		// Joypad
		[0x7e7ff8] = "JoypadButtons",

		// Graphics settings
		[0x7e7f8a] = "OamSettings_2101",
		[0x7e7f8c] = "BgMode_2105",
		[0x7e7f8e] = "MosaicSettings_2106",
		[0x7e7f90] = "Bg1ScreenBase_2107",
		[0x7e7f92] = "Bg2ScreenBase_2108",
		[0x7e7f94] = "Bg3ScreenBase_2109",
		[0x7e7f96] = "Bg4ScreenBase_210A",
		[0x7e7f98] = "Bg12TileBase_210B",
		[0x7e7f9a] = "Bg34TileBase_210C",
		[0x7e7fac] = "Mode7Settings_211A",
		[0x7e7fae] = "Mode7MatrixA_211B",
		[0x7e7fb0] = "Mode7MatrixB_211C",
		[0x7e7fb2] = "Mode7MatrixC_211D",
		[0x7e7fb4] = "Mode7MatrixD_211E",
		[0x7e7fb6] = "Mode7CenterX_211F",
		[0x7e7fb8] = "Mode7CenterY_2120",
		[0x7e7ffe] = "CgramMirror",
	};

	/// <summary>
	/// Bank descriptions based on trace analysis.
	/// </summary>
	public static readonly Dictionary<int, string> BankDescriptions = new()
	{
		[0xc0] = "Main game loop, state machine, compression",
		[0xc1] = "Dialog font data and rendering",
		[0xc4] = "Character class data",
		[0xc6] = "Graphics routines, DMA, tilemap handling",
		[0xc9] = "Menu system",
		[0xd0] = "Item/Equipment data (Bank $50)",
		[0xd1] = "Monster data (Bank $51)",
		[0xd2] = "Magic/Class data (Bank $52)",
		[0xe5] = "Tile definitions (Bank $25)",
		[0xed] = "Overworld tilemap chunks (Bank $2D)",
		[0xee] = "Overworld tilemap chunks continued (Bank $2E)",
		[0xfc] = "Dialog script text (Bank $3C)",
	};

	public DQ3rTraceService(ITraceAnalyzerService traceAnalyzer)
	{
		_traceAnalyzer = traceAnalyzer;
	}

	/// <summary>
	/// Loads DQ3r CDL file.
	/// </summary>
	public void LoadCdl(string filePath)
	{
		_traceAnalyzer.LoadCdl(filePath);
		_cdlLoaded = true;
	}

	/// <summary>
	/// Loads DQ3r trace log.
	/// </summary>
	public void LoadTraceLog(string filePath)
	{
		_traceAnalyzer.LoadTraceLog(filePath);
	}

	/// <summary>
	/// Gets the known function name for an address, if any.
	/// </summary>
	public string? GetFunctionName(int address) =>
		KnownFunctions.GetValueOrDefault(address);

	/// <summary>
	/// Gets the known RAM label for an address, if any.
	/// </summary>
	public string? GetRamLabel(int address) =>
		KnownRamAddresses.GetValueOrDefault(address);

	/// <summary>
	/// Gets the bank description.
	/// </summary>
	public string? GetBankDescription(int bank) =>
		BankDescriptions.GetValueOrDefault(bank);

	/// <summary>
	/// Analyzes CDL data for a specific data table region.
	/// </summary>
	public TraceAnalyzerService.CdlSummary? AnalyzeTableRegion(int startAddress, int length)
	{
		if (!_cdlLoaded) return null;

		int code = 0, data = 0, drawn = 0, unknown = 0;

		for (int i = 0; i < length; i++)
		{
			var flags = _traceAnalyzer.GetFlags(startAddress + i);
			if (flags == TraceAnalyzerService.CdlFlags.None) unknown++;
			else
			{
				if (flags.HasFlag(TraceAnalyzerService.CdlFlags.Code)) code++;
				if (flags.HasFlag(TraceAnalyzerService.CdlFlags.Data)) data++;
				if (flags.HasFlag(TraceAnalyzerService.CdlFlags.Drawn)) drawn++;
			}
		}

		return new TraceAnalyzerService.CdlSummary(
			length, code, data, drawn, unknown,
			100.0 * code / length,
			100.0 * data / length,
			100.0 * drawn / length,
			100.0 * unknown / length
		);
	}

	/// <summary>
	/// Finds functions that access a specific RAM address range.
	/// </summary>
	public List<int> FindFunctionsAccessingRam(int startRam, int endRam)
	{
		var entries = _traceAnalyzer.GetTraceEntries();
		var functions = new HashSet<int>();

		foreach (var entry in entries)
		{
			// Check if operand contains RAM address in range
			if (entry.Operand.Contains('['))
			{
				var match = System.Text.RegularExpressions.Regex.Match(
					entry.Operand, @"\[(?<bank>[0-9A-F]{2}):(?<addr>[0-9A-F]{4})\]",
					System.Text.RegularExpressions.RegexOptions.IgnoreCase);

				if (match.Success)
				{
					int bank = Convert.ToInt32(match.Groups["bank"].Value, 16);
					int addr = Convert.ToInt32(match.Groups["addr"].Value, 16);
					int fullAddr = (bank << 16) | addr;

					if (fullAddr >= startRam && fullAddr <= endRam)
					{
						functions.Add(entry.Address);
					}
				}
			}
		}

		return functions.OrderBy(x => x).ToList();
	}

	/// <summary>
	/// Exports a labeled disassembly report using CDL and trace data.
	/// </summary>
	public string ExportLabeledReport()
	{
		var sb = new System.Text.StringBuilder();

		sb.AppendLine("DQ3r Trace Analysis Report");
		sb.AppendLine("==========================");
		sb.AppendLine();

		// CDL Summary
		var summary = _traceAnalyzer.GetSummary();
		if (summary != null)
		{
			sb.AppendLine("CDL Coverage:");
			sb.AppendLine($"  Code:     {summary.CodeBytes:N0} bytes ({summary.CodePercent:F2}%)");
			sb.AppendLine($"  Data:     {summary.DataBytes:N0} bytes ({summary.DataPercent:F2}%)");
			sb.AppendLine($"  Graphics: {summary.DrawnBytes:N0} bytes ({summary.DrawnPercent:F2}%)");
			sb.AppendLine($"  Unknown:  {summary.UnknownBytes:N0} bytes ({summary.UnknownPercent:F2}%)");
			sb.AppendLine();
		}

		// Known Functions
		sb.AppendLine("Known Functions:");
		foreach (var (addr, name) in KnownFunctions.OrderBy(kv => kv.Key))
		{
			string codeStatus = _cdlLoaded && _traceAnalyzer.IsCode(addr - 0xc00000) ? "[CDL:Code]" : "";
			sb.AppendLine($"  ${addr:x6}: {name} {codeStatus}");
		}
		sb.AppendLine();

		// Bank Analysis
		sb.AppendLine("Bank Descriptions:");
		foreach (var (bank, desc) in BankDescriptions.OrderBy(kv => kv.Key))
		{
			sb.AppendLine($"  Bank ${bank:x2}: {desc}");
		}

		return sb.ToString();
	}
}

/// <summary>
/// Interface for DQ3r-specific trace analysis.
/// </summary>
public interface IDQ3rTraceService
{
	void LoadCdl(string filePath);
	void LoadTraceLog(string filePath);
	string? GetFunctionName(int address);
	string? GetRamLabel(int address);
	string? GetBankDescription(int bank);
	TraceAnalyzerService.CdlSummary? AnalyzeTableRegion(int startAddress, int length);
	List<int> FindFunctionsAccessingRam(int startRam, int endRam);
	string ExportLabeledReport();
}
