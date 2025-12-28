using DarkRepos.Editor.Core.Models;

namespace DarkRepos.Editor.Core.Interfaces;

/// <summary>
/// Service for disassembly operations.
/// </summary>
public interface IDisassemblerService
{
	/// <summary>
	/// Disassemble a range of bytes.
	/// </summary>
	IEnumerable<DisassemblyLine> Disassemble(
		byte[] data,
		int offset,
		int length,
		RomPlatform platform,
		IEnumerable<Label>? labels = null);

	/// <summary>
	/// Disassemble a single instruction at an offset.
	/// </summary>
	DisassemblyLine DisassembleInstruction(byte[] data, int offset, RomPlatform platform);

	/// <summary>
	/// Get the instruction decoder for a platform.
	/// </summary>
	IInstructionDecoder GetDecoder(RomPlatform platform);

	/// <summary>
	/// Format disassembly output.
	/// </summary>
	string FormatOutput(
		IEnumerable<DisassemblyLine> lines,
		DisassemblyFormat format = DisassemblyFormat.Ca65,
		bool includeBytes = true);
}

/// <summary>
/// A line of disassembly output.
/// </summary>
public record DisassemblyLine(
	int Address,
	byte[] Bytes,
	string Mnemonic,
	string Operand,
	string? Label = null,
	string? Comment = null);

/// <summary>
/// Output format for disassembly.
/// </summary>
public enum DisassemblyFormat
{
	/// <summary>ca65 assembler format.</summary>
	Ca65,

	/// <summary>ASM6 assembler format.</summary>
	Asm6,

	/// <summary>NESASM format.</summary>
	NesAsm,

	/// <summary>Plain text format.</summary>
	Plain
}

/// <summary>
/// Interface for CPU-specific instruction decoders.
/// </summary>
public interface IInstructionDecoder
{
	/// <summary>
	/// Decode an instruction at the given offset.
	/// </summary>
	(string Mnemonic, string Operand, int Size) Decode(byte[] data, int offset);

	/// <summary>
	/// Get the CPU architecture name.
	/// </summary>
	string Architecture { get; }
}
