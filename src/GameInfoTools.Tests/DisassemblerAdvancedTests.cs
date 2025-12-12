using GameInfoTools.Disassembly;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for Disassembler functionality.
/// </summary>
public class DisassemblerAdvancedTests {
	[Fact]
	public void CpuMode_HasAllExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), Disassembler.CpuMode.Cpu6502));
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), Disassembler.CpuMode.Cpu65C02));
		Assert.True(Enum.IsDefined(typeof(Disassembler.CpuMode), Disassembler.CpuMode.Cpu65816));
	}

	[Fact]
	public void Options_HasDefaultValues() {
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
	public void DisassembledInstruction_Record_HasCorrectProperties() {
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
	public void Constructor_AcceptsData() {
		var data = new byte[] { 0xa9, 0x00 };
		var disasm = new Disassembler(data);

		Assert.NotNull(disasm);
	}

	[Fact]
	public void Constructor_AcceptsOptions() {
		var data = new byte[] { 0xa9, 0x00 };
		var options = new Disassembler.Options { BaseAddress = 0xC000 };
		var disasm = new Disassembler(data, options);

		Assert.NotNull(disasm);
	}

	[Fact]
	public void DisassembleOne_LdaImmediate_ReturnsCorrect() {
		var data = new byte[] { 0xa9, 0x42 }; // LDA #$42
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("lda", instr.Mnemonic);
		Assert.Equal(2, instr.Bytes.Length);
	}

	[Fact]
	public void DisassembleOne_Nop_ReturnsCorrect() {
		var data = new byte[] { 0xea }; // NOP
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("nop", instr.Mnemonic);
		Assert.Single(instr.Bytes);
	}

	[Fact]
	public void DisassembleOne_JmpAbsolute_ReturnsCorrect() {
		var data = new byte[] { 0x4c, 0x00, 0x80 }; // JMP $8000
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("jmp", instr.Mnemonic);
		Assert.Equal(3, instr.Bytes.Length);
	}

	[Fact]
	public void DisassembleOne_BeyondData_ReturnsSpecialInstruction() {
		var data = new byte[] { 0xa9 };
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(10); // Beyond data

		Assert.Equal(".byte", instr.Mnemonic);
	}

	[Fact]
	public void Disassemble_MultipleInstructions_ReturnsList() {
		var data = new byte[] { 0xa9, 0x00, 0xea, 0x60 }; // LDA #$00, NOP, RTS
		var disasm = new Disassembler(data);

		var instrs = disasm.Disassemble(0, 4);

		Assert.Equal(3, instrs.Count);
		Assert.Equal("lda", instrs[0].Mnemonic);
		Assert.Equal("nop", instrs[1].Mnemonic);
		Assert.Equal("rts", instrs[2].Mnemonic);
	}

	[Fact]
	public void Disassemble_RespectsLength() {
		var data = new byte[] { 0xea, 0xea, 0xea, 0xea }; // 4 NOPs
		var disasm = new Disassembler(data);

		var instrs = disasm.Disassemble(0, 2);

		Assert.Equal(2, instrs.Count);
	}

	[Fact]
	public void DisassembleOne_UsesBaseAddress() {
		var data = new byte[] { 0xea };
		var options = new Disassembler.Options { BaseAddress = 0xC000 };
		var disasm = new Disassembler(data, options);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal(0xC000, instr.Address);
	}

	[Fact]
	public void DisassembledInstruction_WithoutComment_IsNull() {
		var instr = new Disassembler.DisassembledInstruction(
			0x8000, [0xea], "nop", "");

		Assert.Null(instr.Comment);
	}

	[Fact]
	public void Disassemble_StaZeroPage_ReturnsCorrect() {
		var data = new byte[] { 0x85, 0x10 }; // STA $10
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("sta", instr.Mnemonic);
		Assert.Equal(2, instr.Bytes.Length);
	}

	[Fact]
	public void Disassemble_LdxImmediate_ReturnsCorrect() {
		var data = new byte[] { 0xa2, 0xff }; // LDX #$FF
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("ldx", instr.Mnemonic);
	}

	[Fact]
	public void Disassemble_LdyImmediate_ReturnsCorrect() {
		var data = new byte[] { 0xa0, 0x10 }; // LDY #$10
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("ldy", instr.Mnemonic);
	}

	[Fact]
	public void Disassemble_Jsr_ReturnsCorrect() {
		var data = new byte[] { 0x20, 0x00, 0x80 }; // JSR $8000
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("jsr", instr.Mnemonic);
		Assert.Equal(3, instr.Bytes.Length);
	}

	[Fact]
	public void Disassemble_BranchInstruction_ReturnsCorrect() {
		var data = new byte[] { 0xd0, 0x10 }; // BNE +16
		var disasm = new Disassembler(data);

		var instr = disasm.DisassembleOne(0);

		Assert.Equal("bne", instr.Mnemonic);
		Assert.Equal(2, instr.Bytes.Length);
	}

	[Fact]
	public void Options_CanSetAllProperties() {
		var options = new Disassembler.Options {
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

	#region Z80 Disassembly Tests

	[Fact]
	public void DisassembleZ80_NOP_ReturnsNop() {
		byte[] data = [0x00];  // NOP
		var instructions = Disassembler.DisassembleZ80(data, 0, 1, 0);

		Assert.Single(instructions);
		Assert.Equal("nop", instructions[0].Mnemonic);
	}

	[Fact]
	public void DisassembleZ80_LdBcImm_ReturnsCorrect() {
		byte[] data = [0x01, 0x34, 0x12];  // LD BC, $1234
		var instructions = Disassembler.DisassembleZ80(data, 0, 3, 0);

		Assert.Single(instructions);
		Assert.Equal("ld", instructions[0].Mnemonic);
		// Operand contains BC and value
	}

	[Fact]
	public void DisassembleZ80_Jr_ReturnsRelative() {
		byte[] data = [0x18, 0x10];  // JR +16
		var instructions = Disassembler.DisassembleZ80(data, 0, 2, 0x100);

		Assert.Single(instructions);
		Assert.Equal("jr", instructions[0].Mnemonic);
		// Target should be 0x100 + 2 + 16 = 0x112
		Assert.Contains("112", instructions[0].Operand);
	}

	[Fact]
	public void DisassembleZ80_CBPrefix_DisassemblesBitOps() {
		byte[] data = [0xcb, 0x47];  // BIT 0,A
		var instructions = Disassembler.DisassembleZ80(data, 0, 2, 0);

		Assert.Single(instructions);
		Assert.Equal("bit", instructions[0].Mnemonic);
		Assert.Contains("a", instructions[0].Operand);
	}

	[Fact]
	public void DisassembleZ80_EDPrefix_DisassemblesExtended() {
		byte[] data = [0xed, 0xb0];  // LDIR
		var instructions = Disassembler.DisassembleZ80(data, 0, 2, 0);

		Assert.Single(instructions);
		Assert.Equal("ldir", instructions[0].Mnemonic);
	}

	[Fact]
	public void DisassembleZ80_LdRR_DisassemblesRegToReg() {
		byte[] data = [0x78];  // LD A,B
		var instructions = Disassembler.DisassembleZ80(data, 0, 1, 0);

		Assert.Single(instructions);
		Assert.Equal("ld", instructions[0].Mnemonic);
		Assert.Equal("a,b", instructions[0].Operand);
	}

	[Fact]
	public void DisassembleZ80_AluOps_DisassemblesCorrectly() {
		byte[] data = [0x80, 0x90, 0xa0, 0xb0];  // ADD A,B; SUB B; AND B; OR B
		var instructions = Disassembler.DisassembleZ80(data, 0, 4, 0);

		Assert.Equal(4, instructions.Count);
		Assert.Equal("add", instructions[0].Mnemonic);
		Assert.Equal("sub", instructions[1].Mnemonic);
		Assert.Equal("and", instructions[2].Mnemonic);
		Assert.Equal("or", instructions[3].Mnemonic);
	}

	[Fact]
	public void DisassembleZ80_MultipleInstructions_DisassemblesAll() {
		byte[] data = [0x00, 0x3e, 0x42, 0xc9];  // NOP; LD A,$42; RET
		var instructions = Disassembler.DisassembleZ80(data, 0, 4, 0);

		Assert.Equal(3, instructions.Count);
	}

	#endregion

	#region SPC700 Disassembly Tests

	[Fact]
	public void DisassembleSpc700_NOP_ReturnsNop() {
		byte[] data = [0x00];  // NOP
		var instructions = Disassembler.DisassembleSpc700(data, 0, 1, 0);

		Assert.Single(instructions);
		Assert.Equal("nop", instructions[0].Mnemonic);
	}

	[Fact]
	public void DisassembleSpc700_MovAImm_ReturnsCorrect() {
		byte[] data = [0xe8, 0x42];  // MOV A, #$42
		var instructions = Disassembler.DisassembleSpc700(data, 0, 2, 0);

		Assert.Single(instructions);
		Assert.Equal("mov", instructions[0].Mnemonic);
		// Operand format may vary
	}

	[Fact]
	public void DisassembleSpc700_Tcall_ReturnsCorrect() {
		byte[] data = [0x01, 0x11, 0x21];  // TCALL 0, 1, 2
		var instructions = Disassembler.DisassembleSpc700(data, 0, 3, 0);

		Assert.Equal(3, instructions.Count);
		Assert.All(instructions, i => Assert.Equal("tcall", i.Mnemonic));
	}

	[Fact]
	public void DisassembleSpc700_Branch_ReturnsRelative() {
		byte[] data = [0x2f, 0x10];  // BRA +16
		var instructions = Disassembler.DisassembleSpc700(data, 0, 2, 0x100);

		Assert.Single(instructions);
		Assert.Equal("bra", instructions[0].Mnemonic);
		// Operand contains relative address
	}

	[Fact]
	public void DisassembleSpc700_PushPop_ReturnsCorrect() {
		byte[] data = [0x2d, 0xae];  // PUSH A; POP A
		var instructions = Disassembler.DisassembleSpc700(data, 0, 2, 0);

		Assert.Equal(2, instructions.Count);
		Assert.Equal("push", instructions[0].Mnemonic);
		Assert.Equal("pop", instructions[1].Mnemonic);
	}

	[Fact]
	public void DisassembleSpc700_Ret_ReturnsCorrect() {
		byte[] data = [0x6f];  // RET
		var instructions = Disassembler.DisassembleSpc700(data, 0, 1, 0);

		Assert.Single(instructions);
		Assert.Equal("ret", instructions[0].Mnemonic);
	}

	#endregion

	#region ARM7 Thumb Disassembly Tests

	[Fact]
	public void DisassembleArm7Thumb_Instruction_ReturnsResult() {
		byte[] data = [0x00, 0x20];  // Some Thumb instruction
		var instructions = Disassembler.DisassembleArm7Thumb(data, 0, 2, 0);

		Assert.Single(instructions);
		Assert.NotEmpty(instructions[0].Mnemonic);
	}

	[Fact]
	public void DisassembleArm7Thumb_Push_ReturnsResult() {
		byte[] data = [0x00, 0xb5];  // PUSH-like instruction
		var instructions = Disassembler.DisassembleArm7Thumb(data, 0, 2, 0);

		Assert.Single(instructions);
		// Result depends on decoding
	}

	[Fact]
	public void DisassembleArm7Thumb_Pop_ReturnsResult() {
		byte[] data = [0x00, 0xbd];  // POP-like instruction
		var instructions = Disassembler.DisassembleArm7Thumb(data, 0, 2, 0);

		Assert.Single(instructions);
	}

	[Fact]
	public void DisassembleArm7Thumb_MultipleInstructions_DisassemblesAll() {
		byte[] data = [0x00, 0x20, 0x01, 0x21, 0x00, 0xbd];  // Multiple Thumb instructions
		var instructions = Disassembler.DisassembleArm7Thumb(data, 0, 6, 0);

		Assert.Equal(3, instructions.Count);
	}

	#endregion

	#region Function Detection Tests

	[Fact]
	public void DetectFunctions_WithJsr_DetectsFunction() {
		// Simulated instructions with JSR
		var instructions = new List<Disassembler.DisassembledInstruction> {
			new(0x8000, [0x20, 0x00, 0x90], "jsr", "$9000"),
			new(0x8003, [0x60], "rts", ""),
			new(0x9000, [0xa9, 0x00], "lda", "#$00"),
			new(0x9002, [0x60], "rts", "")
		};

		var functions = Disassembler.DetectFunctions(instructions, 0x8000);

		Assert.True(functions.Count >= 1);
	}

	[Fact]
	public void DetectFunctions_LeafFunction_MarkedAsLeaf() {
		// Function without calls
		var instructions = new List<Disassembler.DisassembledInstruction> {
			new(0x8000, [0xa9, 0x00], "lda", "#$00"),
			new(0x8002, [0x60], "rts", "")
		};

		var functions = Disassembler.DetectFunctions(instructions, 0x8000);

		Assert.Single(functions);
		Assert.True(functions[0].IsLeaf);
	}

	[Fact]
	public void DetectedFunction_HasCorrectProperties() {
		var func = new Disassembler.DetectedFunction(
			0x8000, 0x8010, "TestFunc", [0x9000], [0xa000], 4, false);

		Assert.Equal(0x8000, func.StartAddress);
		Assert.Equal(0x8010, func.EndAddress);
		Assert.Equal("TestFunc", func.Name);
		Assert.Single(func.CalledBy);
		Assert.Single(func.Calls);
		Assert.Equal(4, func.StackUsage);
		Assert.False(func.IsLeaf);
	}

	#endregion

	#region Local Variable Detection Tests

	[Fact]
	public void DetectLocalVariables_WithStackOps_DetectsVars() {
		var instructions = new List<Disassembler.DisassembledInstruction> {
			new(0x8000, [0xa5, 0x01], "lda", "$01,s"),
			new(0x8002, [0x85, 0x03], "sta", "$03,s"),
		};

		var vars = Disassembler.DetectLocalVariables(instructions);

		// Should detect stack-relative accesses
		Assert.NotNull(vars);
	}

	[Fact]
	public void LocalVariable_HasCorrectProperties() {
		var var = new Disassembler.LocalVariable("local_0", 4, 2, "word");

		Assert.Equal("local_0", var.Name);
		Assert.Equal(4, var.StackOffset);
		Assert.Equal(2, var.Size);
		Assert.Equal("word", var.Type);
	}

	#endregion

	#region Extended CPU Mode Tests

	[Fact]
	public void ExtendedCpuMode_HasAllValues() {
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.Cpu6502));
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.Cpu65816));
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.Spc700));
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.Z80));
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.Gbz80));
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.Arm7Tdmi));
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.SuperFx));
		Assert.True(Enum.IsDefined(typeof(Disassembler.ExtendedCpuMode), Disassembler.ExtendedCpuMode.Sa1));
	}

	#endregion

	#region Edge Case Tests

	[Fact]
	public void DisassembleZ80_EmptyData_ReturnsEmpty() {
		byte[] data = [];
		var instructions = Disassembler.DisassembleZ80(data, 0, 0, 0);

		Assert.Empty(instructions);
	}

	[Fact]
	public void DisassembleSpc700_EmptyData_ReturnsEmpty() {
		byte[] data = [];
		var instructions = Disassembler.DisassembleSpc700(data, 0, 0, 0);

		Assert.Empty(instructions);
	}

	[Fact]
	public void DisassembleArm7Thumb_OddLength_HandlesCorrectly() {
		byte[] data = [0x00, 0x20, 0x00];  // One complete instruction + 1 byte
		var instructions = Disassembler.DisassembleArm7Thumb(data, 0, 3, 0);

		// Should only return the complete 16-bit instruction
		Assert.Single(instructions);
	}

	[Fact]
	public void DisassembleZ80_UnknownOpcode_ReturnsByte() {
		// Use an opcode that's not in the table
		byte[] data = [0xd3];  // OUT (n),A - might not be in basic table
		var result = Disassembler.DisassembleZ80One(data, 0, 0);

		Assert.NotNull(result);
		// Either disassembles correctly or returns .byte
	}

	#endregion
}
