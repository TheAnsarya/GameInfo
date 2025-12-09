using GameInfoTools.Core;
using Spectre.Console;

namespace GameInfoTools.Cli;

/// <summary>
/// Assembly and disassembly related commands.
/// </summary>
public static class AsmCommands {
	public static void Disassemble(FileInfo romFile, string outputPath, SystemType system) {
		if (!romFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: ROM file not found: {romFile.FullName}[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Disassembling {romFile.Name} for {system}...[/]");

		using var rom = new RomFile();
		rom.Load(romFile.FullName);

		switch (system) {
			case SystemType.Nes:
				Disassemble6502(rom, outputPath);
				break;

			case SystemType.Snes:
				Disassemble65816(rom, outputPath);
				break;

			case SystemType.GameBoy:
			case SystemType.GameBoyColor:
				DisassembleGbZ80(rom, outputPath);
				break;

			case SystemType.GameBoyAdvance:
				DisassembleArm(rom, outputPath);
				break;

			default:
				AnsiConsole.MarkupLine($"[yellow]Disassembly not yet implemented for {system}[/]");
				break;
		}
	}

	private static void Disassemble6502(RomFile rom, string outputPath) {
		AnsiConsole.MarkupLine("[cyan]6502/NES Disassembly[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]6502 Instruction Set Reference[/]")
			.AddColumn("Category")
			.AddColumn("Instructions");

		table.AddRow("Load/Store", "LDA, LDX, LDY, STA, STX, STY");
		table.AddRow("Transfer", "TAX, TAY, TXA, TYA, TSX, TXS");
		table.AddRow("Stack", "PHA, PHP, PLA, PLP");
		table.AddRow("Arithmetic", "ADC, SBC, INC, INX, INY, DEC, DEX, DEY");
		table.AddRow("Logic", "AND, ORA, EOR, BIT");
		table.AddRow("Shift", "ASL, LSR, ROL, ROR");
		table.AddRow("Branch", "BPL, BMI, BVC, BVS, BCC, BCS, BNE, BEQ");
		table.AddRow("Jump", "JMP, JSR, RTS, RTI, BRK");
		table.AddRow("Flags", "CLC, SEC, CLI, SEI, CLV, CLD, SED");
		table.AddRow("Compare", "CMP, CPX, CPY");

		AnsiConsole.Write(table);

		// Create output directory
		var outDir = Path.GetDirectoryName(outputPath);
		if (!string.IsNullOrEmpty(outDir)) {
			Directory.CreateDirectory(outDir);
		}

		AnsiConsole.MarkupLine($"[yellow]Full disassembly requires code/data separation analysis[/]");
		AnsiConsole.MarkupLine($"[grey]Output would be written to: {outputPath}[/]");
	}

	private static void Disassemble65816(RomFile rom, string outputPath) {
		AnsiConsole.MarkupLine("[cyan]65816/SNES Disassembly[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]65816 Extended Instructions[/]")
			.AddColumn("Feature")
			.AddColumn("Description");

		table.AddRow("16-bit Mode", "REP/SEP for mode switching");
		table.AddRow("Direct Page", "24-bit addressing with bank byte");
		table.AddRow("Stack Relative", "Stack-relative addressing modes");
		table.AddRow("Block Move", "MVN/MVP for memory block operations");
		table.AddRow("Long Addressing", "JML, JSL for 24-bit jumps");

		AnsiConsole.Write(table);

		AnsiConsole.MarkupLine($"[yellow]65816 disassembly requires tracking processor state (8/16-bit mode)[/]");
	}

	private static void DisassembleGbZ80(RomFile rom, string outputPath) {
		AnsiConsole.MarkupLine("[cyan]Game Boy Z80 Disassembly[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]GB Z80 Special Features[/]")
			.AddColumn("Feature")
			.AddColumn("Description");

		table.AddRow("Registers", "A, B, C, D, E, H, L, SP, PC");
		table.AddRow("Pairs", "BC, DE, HL, AF");
		table.AddRow("IO", "LDH (FF00+n) for hardware registers");
		table.AddRow("STOP/HALT", "Power management instructions");
		table.AddRow("CB Prefix", "Extended bit manipulation instructions");

		AnsiConsole.Write(table);
	}

	private static void DisassembleArm(RomFile rom, string outputPath) {
		AnsiConsole.MarkupLine("[cyan]ARM/Thumb Disassembly (GBA)[/]");

		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]ARM7TDMI Features[/]")
			.AddColumn("Mode")
			.AddColumn("Description");

		table.AddRow("ARM", "32-bit instructions, full register access");
		table.AddRow("Thumb", "16-bit compressed instructions");
		table.AddRow("Switching", "BX instruction toggles mode");

		AnsiConsole.Write(table);
	}

	public static void Labels(FileInfo labelFile, string operation) {
		switch (operation.ToLowerInvariant()) {
			case "import":
				ImportLabels(labelFile);
				break;

			case "export":
				ExportLabels(labelFile);
				break;

			case "merge":
				MergeLabels(labelFile);
				break;

			default:
				AnsiConsole.MarkupLine($"[yellow]Unknown label operation: {operation}[/]");
				AnsiConsole.MarkupLine("[grey]Available operations: import, export, merge[/]");
				break;
		}
	}

	private static void ImportLabels(FileInfo labelFile) {
		if (!labelFile.Exists) {
			AnsiConsole.MarkupLine($"[red]Error: Label file not found: {labelFile.FullName}[/]");
			return;
		}

		AnsiConsole.MarkupLine($"[cyan]Importing labels from {labelFile.Name}...[/]");

		var lines = File.ReadAllLines(labelFile.FullName);
		int labelCount = 0;

		foreach (var line in lines) {
			if (string.IsNullOrWhiteSpace(line) || line.StartsWith(";") || line.StartsWith("#"))
				continue;

			labelCount++;
		}

		AnsiConsole.MarkupLine($"[green]Found {labelCount} labels[/]");
	}

	private static void ExportLabels(FileInfo labelFile) {
		AnsiConsole.MarkupLine($"[cyan]Exporting labels to {labelFile.FullName}...[/]");
		AnsiConsole.MarkupLine("[yellow]Label export requires an existing project database[/]");
	}

	private static void MergeLabels(FileInfo labelFile) {
		AnsiConsole.MarkupLine($"[cyan]Merging labels from {labelFile.Name}...[/]");
		AnsiConsole.MarkupLine("[yellow]Merge will combine with existing labels, keeping most specific[/]");
	}

	public static void ShowOpcodes(SystemType system) {
		AnsiConsole.MarkupLine($"[cyan]Opcode Reference for {system}[/]");

		switch (system) {
			case SystemType.Nes:
				Show6502Opcodes();
				break;

			case SystemType.Snes:
				Show65816Opcodes();
				break;

			case SystemType.GameBoy:
			case SystemType.GameBoyColor:
				ShowGbOpcodes();
				break;

			default:
				AnsiConsole.MarkupLine($"[yellow]Opcode reference not available for {system}[/]");
				break;
		}
	}

	private static void Show6502Opcodes() {
		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]6502 Common Opcodes[/]")
			.AddColumn("Hex")
			.AddColumn("Instruction")
			.AddColumn("Mode")
			.AddColumn("Bytes")
			.AddColumn("Cycles");

		// Load/Store
		table.AddRow("a9", "LDA #imm", "Immediate", "2", "2");
		table.AddRow("a5", "LDA zp", "Zero Page", "2", "3");
		table.AddRow("ad", "LDA abs", "Absolute", "3", "4");
		table.AddRow("85", "STA zp", "Zero Page", "2", "3");
		table.AddRow("8d", "STA abs", "Absolute", "3", "4");

		// Branches
		table.AddRow("d0", "BNE rel", "Relative", "2", "2/3");
		table.AddRow("f0", "BEQ rel", "Relative", "2", "2/3");
		table.AddRow("90", "BCC rel", "Relative", "2", "2/3");
		table.AddRow("b0", "BCS rel", "Relative", "2", "2/3");

		// Jumps
		table.AddRow("4c", "JMP abs", "Absolute", "3", "3");
		table.AddRow("6c", "JMP (ind)", "Indirect", "3", "5");
		table.AddRow("20", "JSR abs", "Absolute", "3", "6");
		table.AddRow("60", "RTS", "Implied", "1", "6");

		AnsiConsole.Write(table);
	}

	private static void Show65816Opcodes() {
		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]65816 Extended Opcodes[/]")
			.AddColumn("Hex")
			.AddColumn("Instruction")
			.AddColumn("Description");

		table.AddRow("c2", "REP #imm", "Reset processor status bits");
		table.AddRow("e2", "SEP #imm", "Set processor status bits");
		table.AddRow("5c", "JML long", "Jump long (24-bit)");
		table.AddRow("22", "JSL long", "Jump subroutine long");
		table.AddRow("6b", "RTL", "Return from subroutine long");
		table.AddRow("54", "MVN s,d", "Move block negative");
		table.AddRow("44", "MVP s,d", "Move block positive");

		AnsiConsole.Write(table);
	}

	private static void ShowGbOpcodes() {
		var table = new Table()
			.Border(TableBorder.Rounded)
			.Title("[cyan]Game Boy Z80 Common Opcodes[/]")
			.AddColumn("Hex")
			.AddColumn("Instruction")
			.AddColumn("Description");

		table.AddRow("3e", "LD A,n", "Load immediate to A");
		table.AddRow("06", "LD B,n", "Load immediate to B");
		table.AddRow("21", "LD HL,nn", "Load 16-bit immediate to HL");
		table.AddRow("c3", "JP nn", "Jump to address");
		table.AddRow("cd", "CALL nn", "Call subroutine");
		table.AddRow("c9", "RET", "Return from subroutine");
		table.AddRow("e0", "LDH (n),A", "Store A to $ff00+n");
		table.AddRow("f0", "LDH A,(n)", "Load $ff00+n to A");
		table.AddRow("cb", "CB prefix", "Extended instruction prefix");

		AnsiConsole.Write(table);
	}
}
