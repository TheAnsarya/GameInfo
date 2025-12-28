using DarkRepos.Editor.Core.Interfaces;
using DarkRepos.Editor.Core.Models;
using DarkRepos.Editor.Core.Services;
using FluentAssertions;
using Xunit;

namespace DarkRepos.Editor.Core.Tests.Services;

public class DisassemblerServiceTests {
	private readonly IDisassemblerService _service;

	public DisassemblerServiceTests() {
		_service = new DisassemblerService();
	}

	#region Decoder Selection Tests

	[Theory]
	[InlineData(RomPlatform.Nes, "MOS 6502")]
	[InlineData(RomPlatform.Snes, "WDC 65816")]
	[InlineData(RomPlatform.GameBoy, "Sharp LR35902 (Game Boy)")]
	[InlineData(RomPlatform.GameBoyColor, "Sharp LR35902 (Game Boy)")]
	public void GetDecoder_ReturnsCorrectArchitecture(RomPlatform platform, string expectedArch) {
		var decoder = _service.GetDecoder(platform);
		decoder.Architecture.Should().Be(expectedArch);
	}

	[Fact]
	public void GetDecoder_UnknownPlatform_ReturnsDefaultDecoder() {
		var decoder = _service.GetDecoder(RomPlatform.Unknown);
		decoder.Should().NotBeNull();
		decoder.Architecture.Should().Be("MOS 6502"); // Default
	}

	#endregion

	#region 6502 Decoding Tests

	[Fact]
	public void Decode6502_Nop_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xea };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("nop");
		line.Operand.Should().BeEmpty();
		line.Bytes.Should().HaveCount(1);
		line.Bytes[0].Should().Be(0xea);
	}

	[Fact]
	public void Decode6502_LdaImmediate_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xa9, 0x42 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("lda");
		line.Operand.Should().Be("#$42");
		line.Bytes.Should().HaveCount(2);
	}

	[Fact]
	public void Decode6502_LdaAbsolute_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xad, 0x00, 0x80 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("lda");
		line.Operand.Should().Be("$8000");
		line.Bytes.Should().HaveCount(3);
	}

	[Fact]
	public void Decode6502_LdaZeroPage_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xa5, 0x10 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("lda");
		line.Operand.Should().Be("$10");
	}

	[Fact]
	public void Decode6502_StaIndirectY_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x91, 0x20 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("sta");
		line.Operand.Should().Be("($20),y");
	}

	[Fact]
	public void Decode6502_JmpAbsolute_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x4c, 0x00, 0xc0 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("jmp");
		line.Operand.Should().Be("$c000");
	}

	[Fact]
	public void Decode6502_JsrAbsolute_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x20, 0x34, 0x12 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("jsr");
		line.Operand.Should().Be("$1234");
	}

	[Fact]
	public void Decode6502_Rts_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x60 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("rts");
		line.Operand.Should().BeEmpty();
	}

	[Fact]
	public void Decode6502_BranchRelative_CalculatesTargetAddress() {
		// BNE at offset 0 with displacement +5 should target offset 7 (0 + 2 + 5)
		var data = new byte[] { 0xd0, 0x05 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("bne");
		line.Operand.Should().Be("$0007");
	}

	[Fact]
	public void Decode6502_BranchRelativeNegative_CalculatesTargetAddress() {
		// BNE at offset 0x10 with displacement -10 (0xF6) should target offset 0x08
		var data = new byte[0x20];
		data[0x10] = 0xd0; // BNE
		data[0x11] = 0xf6; // -10 signed
		var line = _service.DisassembleInstruction(data, 0x10, RomPlatform.Nes);

		line.Mnemonic.Should().Be("bne");
		line.Operand.Should().Be("$0008");
	}

	[Fact]
	public void Decode6502_IndexedIndirectX_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xa1, 0x30 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("lda");
		line.Operand.Should().Be("($30,x)");
	}

	[Fact]
	public void Decode6502_AbsoluteIndexedX_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xbd, 0x00, 0x80 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("lda");
		line.Operand.Should().Be("$8000,x");
	}

	[Fact]
	public void Decode6502_AslAccumulator_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x0a };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("asl");
		line.Operand.Should().Be("a");
	}

	[Fact]
	public void Decode6502_UnknownOpcode_ReturnsQuestionMarks() {
		var data = new byte[] { 0x02 }; // Unofficial/illegal opcode
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		line.Mnemonic.Should().Be("???");
	}

	#endregion

	#region Disassemble Range Tests

	[Fact]
	public void Disassemble_MultipleInstructions_ReturnsAllLines() {
		// LDA #$42, LDX #$00, STA $8000
		var data = new byte[] { 0xa9, 0x42, 0xa2, 0x00, 0x8d, 0x00, 0x80 };
		var lines = _service.Disassemble(data, 0, data.Length, RomPlatform.Nes).ToList();

		lines.Should().HaveCount(3);

		lines[0].Address.Should().Be(0);
		lines[0].Mnemonic.Should().Be("lda");
		lines[0].Operand.Should().Be("#$42");

		lines[1].Address.Should().Be(2);
		lines[1].Mnemonic.Should().Be("ldx");
		lines[1].Operand.Should().Be("#$00");

		lines[2].Address.Should().Be(4);
		lines[2].Mnemonic.Should().Be("sta");
		lines[2].Operand.Should().Be("$8000");
	}

	[Fact]
	public void Disassemble_WithOffset_StartsAtCorrectAddress() {
		var data = new byte[] { 0x00, 0x00, 0xa9, 0x42 };
		var lines = _service.Disassemble(data, 2, 2, RomPlatform.Nes).ToList();

		lines.Should().HaveCount(1);
		lines[0].Address.Should().Be(2);
		lines[0].Mnemonic.Should().Be("lda");
	}

	[Fact]
	public void Disassemble_WithLabels_IncludesLabelNames() {
		var data = new byte[] { 0xa9, 0x42, 0x8d, 0x00, 0x80 };
		var labels = new List<Label>
		{
			new Label { Address = 0, Name = "start", Comment = "Entry point" }
		};

		var lines = _service.Disassemble(data, 0, data.Length, RomPlatform.Nes, labels).ToList();

		lines[0].Label.Should().Be("start");
		lines[0].Comment.Should().Be("Entry point");
	}

	[Fact]
	public void Disassemble_WithLabels_ResolvesAddressesToLabels() {
		var data = new byte[] { 0x20, 0x05, 0x00 }; // JSR $0005
		var labels = new List<Label>
		{
			new Label { Address = 0x0005, Name = "subroutine" }
		};

		var lines = _service.Disassemble(data, 0, data.Length, RomPlatform.Nes, labels).ToList();

		lines[0].Operand.Should().Contain("subroutine");
	}

	#endregion

	#region Output Formatting Tests

	[Fact]
	public void FormatOutput_Ca65Format_FormatsCorrectly() {
		var lines = new List<DisassemblyLine>
		{
			new DisassemblyLine(0x8000, new byte[] { 0xa9, 0x42 }, "lda", "#$42", "start"),
			new DisassemblyLine(0x8002, new byte[] { 0x60 }, "rts", "")
		};

		var output = _service.FormatOutput(lines, DisassemblyFormat.Ca65, true);

		output.Should().Contain("start:");
		output.Should().Contain("lda #$42");
		output.Should().Contain("rts");
		output.Should().Contain("$8000");
	}

	[Fact]
	public void FormatOutput_PlainFormat_IncludesAddressesAndBytes() {
		var lines = new List<DisassemblyLine>
		{
			new DisassemblyLine(0x8000, new byte[] { 0xea }, "nop", "")
		};

		var output = _service.FormatOutput(lines, DisassemblyFormat.Plain, true);

		output.Should().Contain("$8000");
		output.Should().Contain("ea");
		output.Should().Contain("nop");
	}

	[Fact]
	public void FormatOutput_WithoutBytes_OmitsHexBytes() {
		var lines = new List<DisassemblyLine>
		{
			new DisassemblyLine(0x8000, new byte[] { 0xea }, "nop", "")
		};

		var output = _service.FormatOutput(lines, DisassemblyFormat.Ca65, false);

		output.Should().Contain("nop");
		output.Should().NotContain("ea");
	}

	[Fact]
	public void FormatOutput_WithComments_IncludesComments() {
		var lines = new List<DisassemblyLine>
		{
			new DisassemblyLine(0x8000, new byte[] { 0xea }, "nop", "", null, "Do nothing")
		};

		var output = _service.FormatOutput(lines, DisassemblyFormat.Ca65, false);

		output.Should().Contain("Do nothing");
		output.Should().Contain(";");
	}

	#endregion

	#region Game Boy Decoding Tests

	[Fact]
	public void DecodeGameBoy_Nop_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x00 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.GameBoy);

		line.Mnemonic.Should().Be("nop");
	}

	[Fact]
	public void DecodeGameBoy_LdBcImmediate_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x01, 0x34, 0x12 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.GameBoy);

		line.Mnemonic.Should().Be("ld bc,");
		line.Operand.Should().Be("$1234");
		line.Bytes.Should().HaveCount(3);
	}

	[Fact]
	public void DecodeGameBoy_JpAbsolute_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xc3, 0x50, 0x01 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.GameBoy);

		line.Mnemonic.Should().Be("jp");
		line.Operand.Should().Be("$0150");
	}

	[Fact]
	public void DecodeGameBoy_Call_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xcd, 0x00, 0x40 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.GameBoy);

		line.Mnemonic.Should().Be("call");
		line.Operand.Should().Be("$4000");
	}

	[Fact]
	public void DecodeGameBoy_Push_ReturnsCorrectInstruction() {
		var data = new byte[] { 0xc5 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.GameBoy);

		line.Mnemonic.Should().Be("push bc");
		line.Bytes.Should().HaveCount(1);
	}

	[Fact]
	public void DecodeGameBoy_JrNz_ReturnsCorrectInstruction() {
		var data = new byte[] { 0x20, 0x10 };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.GameBoy);

		line.Mnemonic.Should().Be("jr nz,");
		line.Operand.Should().Be("$10");
	}

	#endregion

	#region Edge Cases

	[Fact]
	public void Disassemble_EmptyData_ReturnsNoLines() {
		var lines = _service.Disassemble(Array.Empty<byte>(), 0, 0, RomPlatform.Nes).ToList();
		lines.Should().BeEmpty();
	}

	[Fact]
	public void Disassemble_OffsetBeyondData_ReturnsNoLines() {
		var data = new byte[] { 0xea };
		var lines = _service.Disassemble(data, 10, 5, RomPlatform.Nes).ToList();
		lines.Should().BeEmpty();
	}

	[Fact]
	public void Disassemble_LengthBeyondData_StopsAtEnd() {
		var data = new byte[] { 0xea, 0xea };
		var lines = _service.Disassemble(data, 0, 100, RomPlatform.Nes).ToList();
		lines.Should().HaveCount(2);
	}

	[Fact]
	public void DisassembleInstruction_TruncatedMultiByteInstruction_HandlesGracefully() {
		// LDA absolute expects 3 bytes, but only 1 is provided
		var data = new byte[] { 0xad };
		var line = _service.DisassembleInstruction(data, 0, RomPlatform.Nes);

		// Should not throw, should handle gracefully
		line.Should().NotBeNull();
		line.Mnemonic.Should().Be("lda");
	}

	#endregion

	#region Common Instruction Sequences

	[Fact]
	public void Disassemble_CommonNesResetVector_DisassemblesCorrectly() {
		// Typical NES reset vector code: SEI, CLD, LDX #$FF, TXS
		var data = new byte[] { 0x78, 0xd8, 0xa2, 0xff, 0x9a };
		var lines = _service.Disassemble(data, 0, data.Length, RomPlatform.Nes).ToList();

		lines.Should().HaveCount(4);
		lines[0].Mnemonic.Should().Be("sei");
		lines[1].Mnemonic.Should().Be("cld");
		lines[2].Mnemonic.Should().Be("ldx");
		lines[2].Operand.Should().Be("#$ff");
		lines[3].Mnemonic.Should().Be("txs");
	}

	[Fact]
	public void Disassemble_LoopWithBranch_DisassemblesCorrectly() {
		// Simple loop: DEX, BNE loop
		// At address 0: DEX (0xCA), BNE -2 (0xD0, 0xFE)
		var data = new byte[] { 0xca, 0xd0, 0xfe };
		var lines = _service.Disassemble(data, 0, data.Length, RomPlatform.Nes).ToList();

		lines.Should().HaveCount(2);
		lines[0].Mnemonic.Should().Be("dex");
		lines[1].Mnemonic.Should().Be("bne");
		lines[1].Operand.Should().Be("$0001"); // Branch back to address 1 (offset 1)
	}

	#endregion
}
