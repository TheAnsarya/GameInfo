namespace GameInfoTools.Core.Interfaces;

/// <summary>
/// Represents a disassembled instruction.
/// </summary>
public record DisassemblyLine(
	int Address,
	byte[] Bytes,
	string Mnemonic,
	string Operand,
	string? Label = null,
	string? Comment = null,
	bool IsData = false
);

/// <summary>
/// Represents a cross-reference (xref) to/from an address.
/// </summary>
public record CrossReference(int FromAddress, int ToAddress, string Type);

/// <summary>
/// CPU architecture for disassembly.
/// </summary>
public enum CpuArchitecture
{
	Mos6502,      // NES, C64, etc.
	Wdc65c816,    // SNES
	Z80,          // Game Boy, Master System
	Spc700,       // SNES APU
	Sm83          // Game Boy CPU (modified Z80)
}

/// <summary>
/// Interface for disassembler services.
/// </summary>
public interface IDisassemblerService
{
	/// <summary>CPU architecture being disassembled.</summary>
	CpuArchitecture Architecture { get; set; }

	/// <summary>Whether to use bank-aware addressing.</summary>
	bool UseBankAddressing { get; set; }

	/// <summary>Current bank number (for banked systems).</summary>
	int CurrentBank { get; set; }

	/// <summary>Disassembles a region of ROM.</summary>
	IEnumerable<DisassemblyLine> Disassemble(int startOffset, int length);

	/// <summary>Disassembles starting from an entry point, following code flow.</summary>
	IEnumerable<DisassemblyLine> DisassembleFromEntryPoint(int entryPoint);

	/// <summary>Gets all labels.</summary>
	IReadOnlyDictionary<int, string> Labels { get; }

	/// <summary>Sets a label at an address.</summary>
	void SetLabel(int address, string label);

	/// <summary>Removes a label.</summary>
	void RemoveLabel(int address);

	/// <summary>Gets all comments.</summary>
	IReadOnlyDictionary<int, string> Comments { get; }

	/// <summary>Sets a comment at an address.</summary>
	void SetComment(int address, string comment);

	/// <summary>Marks a region as data (not code).</summary>
	void MarkAsData(int startAddress, int length, string? dataType = null);

	/// <summary>Marks a region as code.</summary>
	void MarkAsCode(int startAddress, int length);

	/// <summary>Gets cross-references to an address.</summary>
	IEnumerable<CrossReference> GetReferencesTo(int address);

	/// <summary>Gets cross-references from an address.</summary>
	IEnumerable<CrossReference> GetReferencesFrom(int address);

	/// <summary>Imports labels from a file (various formats).</summary>
	void ImportLabels(string path);

	/// <summary>Exports labels to a file.</summary>
	void ExportLabels(string path, string format = "sym");

	/// <summary>Exports disassembly as assembly source.</summary>
	string ExportAsm(int startOffset, int length);

	/// <summary>Loads CDL (Code/Data Log) data for enhanced disassembly.</summary>
	void LoadCdl(string path);

	/// <summary>Fired when labels change.</summary>
	event EventHandler? LabelsChanged;
}
