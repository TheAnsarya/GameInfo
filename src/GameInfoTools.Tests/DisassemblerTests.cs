using GameInfoTools.Disassembly;

namespace GameInfoTools.Tests;

public class DisassemblerTests
{
	[Fact]
	public void Constructor_CreatesInstanceFromData()
	{
		byte[] data = [0xA9, 0x00]; // LDA #$00
		var disasm = new Disassembler(data);

		Assert.NotNull(disasm);
	}

	[Fact]
	public void DisassembleOne_ReturnsInstruction()
	{
		byte[] data = [0xA9, 0x42]; // LDA #$42
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.NotNull(instr);
		Assert.True(instr.Bytes.Length > 0);
	}

	[Fact]
	public void DisassembleOne_LdaImmediate()
	{
		byte[] data = [0xA9, 0x42]; // LDA #$42
		var disasm = new Disassembler(data, new Disassembler.Options { LowercaseMnemonics = true });

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("lda", instr.Mnemonic);
		Assert.Equal(2, instr.Bytes.Length);
	}

	[Fact]
	public void DisassembleOne_Nop()
	{
		byte[] data = [0xEA]; // NOP
		var disasm = new Disassembler(data, new Disassembler.Options { LowercaseMnemonics = true });

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("nop", instr.Mnemonic);
		Assert.Single(instr.Bytes);
	}

	[Fact]
	public void DisassembleOne_Jmp()
	{
		byte[] data = [0x4C, 0x00, 0x80]; // JMP $8000
		var disasm = new Disassembler(data, new Disassembler.Options { LowercaseMnemonics = true });

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("jmp", instr.Mnemonic);
		Assert.Equal(3, instr.Bytes.Length);
	}

	[Fact]
	public void Disassemble_ReturnsMultipleInstructions()
	{
		byte[] data = [0xA9, 0x00, 0xEA, 0x60]; // LDA #$00, NOP, RTS
		var disasm = new Disassembler(data);

		var instructions = disasm.Disassemble(0, 4);

		Assert.True(instructions.Count >= 3);
	}

	[Fact]
	public void DisassembledInstruction_HasCorrectAddress()
	{
		byte[] data = [0xA9, 0x00]; // LDA #$00
		var options = new Disassembler.Options { BaseAddress = 0x8000 };
		var disasm = new Disassembler(data, options);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal(0x8000, instr.Address);
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
	}

	[Fact]
	public void CpuMode_HasExpectedValues()
	{
		Assert.Equal(0, (int)Disassembler.CpuMode.Cpu6502);
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), "Cpu65C02"));
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), "Cpu65816"));
	}
}
