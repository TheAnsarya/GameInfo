using GameInfoTools.Disassembly;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for Disassembler functionality.
/// </summary>
public class DisassemblerAdvancedTests
{
	[Fact]
	public void CpuMode_HasAllExpectedValues()
	{
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), Disassembler.CpuMode.Cpu6502));
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), Disassembler.CpuMode.Cpu65C02));
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), Disassembler.CpuMode.Cpu65816));
	}

	[Fact]
	public void Options_HasDefaultValues()
	{
		var options = new Disassembler.Options();

		Assert.Equal(Disassembler.CpuMode.Cpu6502, options.Mode);
		Assert.Equal(0x8000, options.BaseAddress);
		Assert.True(options.ShowBytes);
		Assert.True(options.ShowAddresses);
		Assert.True(options.LowercaseHex);
		Assert.True(options.LowercaseMnemonics);
		Assert.Null(options.Symbols);
		Assert.Equal(4, options.TabWidth);
	}

	[Fact]
	public void DisassembledInstruction_Record_HasCorrectProperties()
	{
		var bytes = new byte[] { 0xa9, 0x00 };
		var instr = new Disassembler.DisassembledInstruction(
			0x8000, bytes, "lda", "#$00", "Load accumulator");

		Assert.Equal(0x8000, instr.Address);
		Assert.Equal(bytes, instr.Bytes);
		Assert.Equal("lda", instr.Mnemonic);
		Assert.Equal("#$00", instr.Operand);
		Assert.Equal("Load accumulator", instr.Comment);
	}

	[Fact]
	public void Constructor_AcceptsData()
	{
		var data = new byte[] { 0xa9, 0x00 };
		var disasm = new Disassembler(data);

		Assert.NotNull(disasm);
	}

	[Fact]
	public void Constructor_AcceptsOptions()
	{
		var data = new byte[] { 0xa9, 0x00 };
		var options = new Disassembler.Options { BaseAddress = 0xC000 };
		var disasm = new Disassembler(data, options);

		Assert.NotNull(disasm);
	}

	[Fact]
	public void DisassembleOne_LdaImmediate_ReturnsCorrect()
	{
		var data = new byte[] { 0xa9, 0x42 }; // LDA #$42
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("lda", instr.Mnemonic);
		Assert.Equal(2, instr.Bytes.Length);
	}

	[Fact]
	public void DisassembleOne_Nop_ReturnsCorrect()
	{
		var data = new byte[] { 0xea }; // NOP
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("nop", instr.Mnemonic);
		Assert.Single(instr.Bytes);
	}

	[Fact]
	public void DisassembleOne_JmpAbsolute_ReturnsCorrect()
	{
		var data = new byte[] { 0x4c, 0x00, 0x80 }; // JMP $8000
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("jmp", instr.Mnemonic);
		Assert.Equal(3, instr.Bytes.Length);
	}

	[Fact]
	public void DisassembleOne_BeyondData_ReturnsSpecialInstruction()
	{
		var data = new byte[] { 0xa9 };
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(10); // Beyond data

		Assert.Equal(".byte", instr.Mnemonic);
	}

	[Fact]
	public void Disassemble_MultipleInstructions_ReturnsList()
	{
		var data = new byte[] { 0xa9, 0x00, 0xea, 0x60 }; // LDA #$00, NOP, RTS
		var disasm = new Disassembler(data);

		var instrs = disasm.Disassemble(0, 4);

		Assert.Equal(3, instrs.Count);
		Assert.Equal("lda", instrs[0].Mnemonic);
		Assert.Equal("nop", instrs[1].Mnemonic);
		Assert.Equal("rts", instrs[2].Mnemonic);
	}

	[Fact]
	public void Disassemble_RespectsLength()
	{
		var data = new byte[] { 0xea, 0xea, 0xea, 0xea }; // 4 NOPs
		var disasm = new Disassembler(data);

		var instrs = disasm.Disassemble(0, 2);

		Assert.Equal(2, instrs.Count);
	}

	[Fact]
	public void DisassembleOne_UsesBaseAddress()
	{
		var data = new byte[] { 0xea };
		var options = new Disassembler.Options { BaseAddress = 0xC000 };
		var disasm = new Disassembler(data, options);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal(0xC000, instr.Address);
	}

	[Fact]
	public void DisassembledInstruction_WithoutComment_IsNull()
	{
		var instr = new Disassembler.DisassembledInstruction(
			0x8000, [0xea], "nop", "");

		Assert.Null(instr.Comment);
	}

	[Fact]
	public void Disassemble_StaZeroPage_ReturnsCorrect()
	{
		var data = new byte[] { 0x85, 0x10 }; // STA $10
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("sta", instr.Mnemonic);
		Assert.Equal(2, instr.Bytes.Length);
	}

	[Fact]
	public void Disassemble_LdxImmediate_ReturnsCorrect()
	{
		var data = new byte[] { 0xa2, 0xff }; // LDX #$FF
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("ldx", instr.Mnemonic);
	}

	[Fact]
	public void Disassemble_LdyImmediate_ReturnsCorrect()
	{
		var data = new byte[] { 0xa0, 0x10 }; // LDY #$10
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("ldy", instr.Mnemonic);
	}

	[Fact]
	public void Disassemble_Jsr_ReturnsCorrect()
	{
		var data = new byte[] { 0x20, 0x00, 0x80 }; // JSR $8000
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("jsr", instr.Mnemonic);
		Assert.Equal(3, instr.Bytes.Length);
	}

	[Fact]
	public void Disassemble_BranchInstruction_ReturnsCorrect()
	{
		var data = new byte[] { 0xd0, 0x10 }; // BNE +16
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("bne", instr.Mnemonic);
		Assert.Equal(2, instr.Bytes.Length);
	}

	[Fact]
	public void Options_CanSetAllProperties()
	{
		var options = new Disassembler.Options
		{
			Mode = Disassembler.CpuMode.Cpu65816,
			BaseAddress = 0x008000,
			ShowBytes = false,
			ShowAddresses = false,
			LowercaseHex = false,
			LowercaseMnemonics = false,
			TabWidth = 8
		};

		Assert.Equal(Disassembler.CpuMode.Cpu65816, options.Mode);
		Assert.Equal(0x008000, options.BaseAddress);
		Assert.False(options.ShowBytes);
		Assert.False(options.ShowAddresses);
		Assert.False(options.LowercaseHex);
		Assert.False(options.LowercaseMnemonics);
		Assert.Equal(8, options.TabWidth);
	}
}
