using GameInfoTools.Analysis;
using GameInfoTools.Core;
using GameInfoTools.Data;
using GameInfoTools.Disassembly;
using GameInfoTools.Graphics;
using GameInfoTools.Rom;
using GameInfoTools.Text;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Integration tests that verify multi-component workflows.
/// These tests ensure components work together correctly.
/// </summary>
public class WorkflowIntegrationTests {
	#region ROM Analysis Workflow

	[Fact]
	public void RomAnalysisWorkflow_NesRom_ExtractsAllData() {
		// Create a minimal NES ROM with known content
		var rom = CreateNesRom(1, 1);

		// 1. Get ROM info directly from bytes
		var info = RomFile.GetRomInfo(rom);
		Assert.Equal(SystemType.Nes, info.System);
		Assert.Equal(16, info.HeaderSize);

		// 2. Analyze banks
		var bankManager = new BankManager(rom);
		var banks = bankManager.GetBanks();
		Assert.NotEmpty(banks);

		// 3. Extract CHR data
		var chrBanks = banks.Where(b => !b.IsPrgRom).ToList();
		if (chrBanks.Any()) {
			var chrData = bankManager.ExtractBank(chrBanks[0].Number);
			Assert.NotEmpty(chrData);
		}

		// 4. Calculate checksums
		var dataCrc = Checksum.Crc32(rom);
		var dataMd5 = Checksum.Md5(rom);
		Assert.NotEqual(0u, dataCrc);
		Assert.NotEmpty(dataMd5);
	}

	[Fact]
	public void RomAnalysisWorkflow_UnknownRom_HandlesGracefully() {
		// Create generic binary data
		var data = new byte[1024];
		for (int i = 0; i < data.Length; i++) {
			data[i] = (byte)(i % 256);
		}

		// Get ROM info directly
		var info = RomFile.GetRomInfo(data);

		// Should detect as unknown
		Assert.Equal(SystemType.Unknown, info.System);

		// Analysis should still work
		var analyzer = new RomAnalyzer(data);
		Assert.NotNull(analyzer);
	}

	#endregion

	#region Text Extraction Workflow

	[Fact]
	public void TextExtractionWorkflow_CreateTable() {
		// 1. Create text table
		var tableText = "80=A\n81=B\n82=C\n00={END}";
		var table = TextTable.FromString(tableText);

		// Verify table was created
		Assert.NotNull(table);
		Assert.True(table.EntryCount > 0);
	}

	[Fact]
	public void TextExtractionWorkflow_DecodeBytes() {
		var tableText = "80=A\n81=B\n82=C\n00={END}";
		var table = TextTable.FromString(tableText);

		// Decode some bytes
		var data = new byte[] { 0x80, 0x81, 0x82 };
		var decoded = table.Decode(data);

		// Verify it contains the expected characters
		Assert.Contains("A", decoded);
		Assert.Contains("B", decoded);
		Assert.Contains("C", decoded);
	}

	[Fact]
	public void TextExtractionWorkflow_DecodeWithEndMarker() {
		var tableText = "80=A\n81=B\n82=C\n00={END}";
		var table = TextTable.FromString(tableText);

		// Create ROM data with text
		var data = new byte[] { 0x80, 0x81, 0x82, 0x00 };

		// Decode
		var decoded = table.Decode(data);

		// Should contain the decoded text and END marker
		Assert.NotEmpty(decoded);
		Assert.Contains("A", decoded);
	}

	#endregion

	#region Graphics Workflow

	[Fact]
	public void GraphicsWorkflow_EncodesAndDecodesNesTile() {
		// 1. Create test tile (8x8 2bpp)
		var tile = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				tile[y, x] = (byte)((x + y) % 4);
			}
		}

		// 2. Encode to NES format
		var encoded = TileGraphics.EncodeTile(tile, TileGraphics.TileFormat.Nes2Bpp);
		Assert.Equal(16, encoded.Length); // NES tiles are 16 bytes

		// 3. Decode back
		var decoded = TileGraphics.DecodeTile(encoded, 0, TileGraphics.TileFormat.Nes2Bpp);

		// 4. Verify round-trip
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				Assert.Equal(tile[y, x], decoded[y, x]);
			}
		}
	}

	[Fact]
	public void GraphicsWorkflow_EncodesAndDecodesSnesTile() {
		var tile = new byte[8, 8];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				tile[y, x] = (byte)((x + y) % 16); // 4bpp = 16 colors
			}
		}

		var encoded = TileGraphics.EncodeTile(tile, TileGraphics.TileFormat.Snes4Bpp);
		Assert.Equal(32, encoded.Length);

		var decoded = TileGraphics.DecodeTile(encoded, 0, TileGraphics.TileFormat.Snes4Bpp);

		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				Assert.Equal(tile[y, x], decoded[y, x]);
			}
		}
	}

	[Fact]
	public void GraphicsWorkflow_PaletteConversion() {
		// NES color 0x12 (blue-ish)
		var (r, g, b) = Palette.NesToRgb(0x12);

		// Verify it returns valid RGB values
		Assert.InRange(r, 0, 255);
		Assert.InRange(g, 0, 255);
		Assert.InRange(b, 0, 255);
	}

	[Fact]
	public void GraphicsWorkflow_SnesPaletteRoundTrip() {
		// SNES palette data (2 bytes per color)
		var snesData = new byte[] { 0x00, 0x00, 0xff, 0x7f }; // Black, White

		// Read palette
		var readColors = Palette.ReadSnesPalette(snesData, 0, 2);

		// Verify we got 2 colors
		Assert.Equal(2, readColors.Length);

		// First should be black (0,0,0)
		Assert.Equal(0, readColors[0].R);
		Assert.Equal(0, readColors[0].G);
		Assert.Equal(0, readColors[0].B);

		// Second should be near-white
		Assert.InRange(readColors[1].R, 248, 255);
		Assert.InRange(readColors[1].G, 248, 255);
		Assert.InRange(readColors[1].B, 248, 255);
	}

	#endregion

	#region Disassembly Workflow

	[Fact]
	public void DisassemblyWorkflow_DisassembleAndFormat() {
		// 1. Create test code
		var code = new byte[] {
			0xa9, 0x00,       // LDA #$00
			0x8d, 0x00, 0x20, // STA $2000
			0xea,             // NOP
			0x60              // RTS
		};

		// 2. Disassemble
		var disasm = new Disassembler(code);
		var instructions = disasm.Disassemble(0, code.Length);

		// 3. Verify instruction count
		Assert.Equal(4, instructions.Count);

		// 4. Format as text
		var text = disasm.FormatAsText(instructions);

		// 5. Verify output contains expected content
		Assert.Contains("lda", text);
		Assert.Contains("sta", text);
		Assert.Contains("nop", text);
		Assert.Contains("rts", text);
	}

	[Fact]
	public void DisassemblyWorkflow_WithSymbols() {
		var code = new byte[] {
			0x20, 0x00, 0x90, // JSR $9000
			0x60              // RTS
		};

		var symbols = new SymbolTable();
		symbols.AddSymbol("SubRoutine", 0x9000);

		var options = new Disassembler.Options { Symbols = symbols };
		var disasm = new Disassembler(code, options);
		var instructions = disasm.Disassemble(0, code.Length);

		// First instruction should reference the symbol
		var jsrInstr = instructions[0];
		Assert.Equal("jsr", jsrInstr.Mnemonic);
	}

	[Fact]
	public void DisassemblyWorkflow_CrossReferenceBuilding() {
		var code = new byte[] {
			0x20, 0x10, 0x80, // JSR $8010
			0x4c, 0x00, 0x80, // JMP $8000
			0xea, 0xea, 0xea, // NOP NOP NOP (padding)
			0xea, 0xea, 0xea,
			0xea, 0xea, 0xea,
			0xea,             // $8010: NOP
			0x60              // RTS
		};

		var xref = new CrossReferenceDb();
		xref.BuildFromRom(code, 0, code.Length, 0x8000);

		// Should find JSR reference to $8010
		var refsTo8010 = xref.GetRefsTo(0x8010).ToList();
		Assert.NotEmpty(refsTo8010);
		Assert.Contains(refsTo8010, r => r.Type == CrossReferenceDb.RefType.Call);

		// Should find JMP reference to $8000
		var refsTo8000 = xref.GetRefsTo(0x8000).ToList();
		Assert.NotEmpty(refsTo8000);
		Assert.Contains(refsTo8000, r => r.Type == CrossReferenceDb.RefType.Jump);
	}

	#endregion

	#region Data Table Workflow

	[Fact]
	public void DataTableWorkflow_ReadWriteRecord() {
		// Create mock ROM data
		var data = new byte[100];

		// Define a monster stat table
		var table = new DataTableEditor.TableDef {
			Name = "Monsters",
			BaseOffset = 0,
			RecordSize = 8,
			RecordCount = 5
		};
		table.Fields.Add(new DataTableEditor.FieldDef("HP", DataTableEditor.FieldType.Word, 0));
		table.Fields.Add(new DataTableEditor.FieldDef("Attack", DataTableEditor.FieldType.Byte, 2));
		table.Fields.Add(new DataTableEditor.FieldDef("Defense", DataTableEditor.FieldType.Byte, 3));
		table.Fields.Add(new DataTableEditor.FieldDef("Speed", DataTableEditor.FieldType.Byte, 4));

		var editor = new DataTableEditor(data);

		// Write a record
		var monster = new Dictionary<string, object> {
			["HP"] = (ushort)100,
			["Attack"] = (byte)25,
			["Defense"] = (byte)15,
			["Speed"] = (byte)10
		};
		editor.WriteRecord(table, 0, monster);

		// Read it back
		var readMonster = editor.ReadRecord(table, 0);

		// Verify
		Assert.Equal(100, Convert.ToInt32(readMonster["HP"]));
		Assert.Equal(25, Convert.ToByte(readMonster["Attack"]));
		Assert.Equal(15, Convert.ToByte(readMonster["Defense"]));
		Assert.Equal(10, Convert.ToByte(readMonster["Speed"]));
	}

	[Fact]
	public void DataTableWorkflow_JsonExportImport() {
		var data = new byte[100];

		var table = new DataTableEditor.TableDef {
			Name = "Items",
			BaseOffset = 0,
			RecordSize = 4,
			RecordCount = 3
		};
		table.Fields.Add(new DataTableEditor.FieldDef("ID", DataTableEditor.FieldType.Byte, 0));
		table.Fields.Add(new DataTableEditor.FieldDef("Power", DataTableEditor.FieldType.Word, 1));
		table.Fields.Add(new DataTableEditor.FieldDef("Type", DataTableEditor.FieldType.Byte, 3));

		var editor = new DataTableEditor(data);

		// Write some records
		editor.WriteRecord(table, 0, new Dictionary<string, object> { ["ID"] = (byte)1, ["Power"] = (ushort)10, ["Type"] = (byte)0 });
		editor.WriteRecord(table, 1, new Dictionary<string, object> { ["ID"] = (byte)2, ["Power"] = (ushort)25, ["Type"] = (byte)1 });
		editor.WriteRecord(table, 2, new Dictionary<string, object> { ["ID"] = (byte)3, ["Power"] = (ushort)50, ["Type"] = (byte)2 });

		// Export to JSON
		var json = editor.ExportToJson(table);

		// Create new data buffer and import
		var data2 = new byte[100];
		var editor2 = new DataTableEditor(data2);
		editor2.ImportFromJson(table, json);

		// Verify data matches
		var record0 = editor2.ReadRecord(table, 0);
		Assert.Equal(1, Convert.ToByte(record0["ID"]));
		Assert.Equal(10, Convert.ToInt32(record0["Power"]));
	}

	[Fact]
	public void DataTableWorkflow_CsvExport() {
		var data = new byte[100];

		var table = new DataTableEditor.TableDef {
			Name = "Test",
			BaseOffset = 0,
			RecordSize = 2,
			RecordCount = 2
		};
		table.Fields.Add(new DataTableEditor.FieldDef("A", DataTableEditor.FieldType.Byte, 0));
		table.Fields.Add(new DataTableEditor.FieldDef("B", DataTableEditor.FieldType.Byte, 1));

		var editor = new DataTableEditor(data);
		editor.WriteRecord(table, 0, new Dictionary<string, object> { ["A"] = (byte)1, ["B"] = (byte)2 });
		editor.WriteRecord(table, 1, new Dictionary<string, object> { ["A"] = (byte)3, ["B"] = (byte)4 });

		var csv = editor.ExportToCsv(table);

		Assert.Contains("A,B", csv);
		Assert.Contains("1,2", csv);
		Assert.Contains("3,4", csv);
	}

	#endregion

	#region Pointer Table Workflow

	[Fact]
	public void PointerTableWorkflow_ReadAndResolve() {
		// Create pointer table data
		var data = new byte[] {
			0x00, 0x80, // Pointer to $8000
			0x10, 0x80, // Pointer to $8010
			0x20, 0x80, // Pointer to $8020
			// ... padding to $8000 ...
		};
		Array.Resize(ref data, 0x100);

		// Read pointer table
		var table = PointerTable.Read(data, 0, 3, PointerTable.PointerFormat.Absolute16, 0);

		// Verify pointers
		Assert.Equal(3, table.Entries.Count);
		Assert.Equal(0x8000, table.Entries[0].TargetAddress);
		Assert.Equal(0x8010, table.Entries[1].TargetAddress);
		Assert.Equal(0x8020, table.Entries[2].TargetAddress);
	}

	[Fact]
	public void PointerTableWorkflow_WritePointers() {
		var data = new byte[100];

		// Create and write pointer table
		var table = new PointerTable();
		table.Entries.Add(new PointerTable.PointerEntry(0, 0x9000, 0x9000, 0));
		table.Entries.Add(new PointerTable.PointerEntry(2, 0x9100, 0x9100, 1));

		var result = table.WriteTable(data);

		// Verify bytes
		Assert.Equal(0x00, result[0]); // Low byte of 0x9000
		Assert.Equal(0x90, result[1]); // High byte of 0x9000
		Assert.Equal(0x00, result[2]); // Low byte of 0x9100
		Assert.Equal(0x91, result[3]); // High byte of 0x9100
	}

	#endregion

	#region Complete Analysis Workflow

	[Fact]
	public void CompleteWorkflow_AnalyzeNesRom() {
		// Create NES ROM
		var rom = CreateNesRom(2, 1);

		// Add some recognizable code patterns
		int codeOffset = 16; // After header
		rom[codeOffset + 0] = 0xa9; // LDA #$00
		rom[codeOffset + 1] = 0x00;
		rom[codeOffset + 2] = 0x8d; // STA $2000
		rom[codeOffset + 3] = 0x00;
		rom[codeOffset + 4] = 0x20;
		rom[codeOffset + 5] = 0x20; // JSR $8100
		rom[codeOffset + 6] = 0x00;
		rom[codeOffset + 7] = 0x81;
		rom[codeOffset + 8] = 0x4c; // JMP $8000
		rom[codeOffset + 9] = 0x00;
		rom[codeOffset + 10] = 0x80;

		// 1. Analyze ROM directly
		var info = RomFile.GetRomInfo(rom);

		Assert.Equal(SystemType.Nes, info.System);

		// 2. Build cross-references
		var xref = new CrossReferenceDb();
		xref.BuildFromRom(rom, 16, 0x4000, 0x8000);

		// 3. Find subroutines
		var subroutines = xref.FindSubroutines().ToList();
		Assert.Contains(0x8100, subroutines);

		// 4. Disassemble
		var disasm = new Disassembler(rom, new Disassembler.Options { BaseAddress = 0x8000 });
		var instructions = disasm.Disassemble(16, 11);

		Assert.Equal(4, instructions.Count);

		// 5. Generate report
		var report = xref.GenerateReport();
		Assert.NotEmpty(report);

		// 6. Checksum
		var crc = Checksum.Crc32(rom);
		Assert.NotEqual(0u, crc);
	}

	#endregion

	#region Disassembler Enhanced Workflow

	[Fact]
	public void DisassemblerWorkflow_BasicBlockDetection() {
		// Create ROM with branch structure
		var rom = new byte[32];
		int offset = 0;

		// Block 1: Simple code
		rom[offset++] = 0xa9; // LDA #$42
		rom[offset++] = 0x42;
		rom[offset++] = 0xd0; // BNE +5 (to block 2)
		rom[offset++] = 0x05;

		// Fall-through block
		rom[offset++] = 0xa2; // LDX #$00
		rom[offset++] = 0x00;
		rom[offset++] = 0x4c; // JMP somewhere
		rom[offset++] = 0x10;
		rom[offset++] = 0x80;

		// Block 2 (branch target)
		rom[offset++] = 0xa0; // LDY #$ff
		rom[offset++] = 0xff;
		rom[offset++] = 0x60; // RTS

		var disasm = new Disassembler(rom, new Disassembler.Options { BaseAddress = 0x8000 });
		var instructions = disasm.Disassemble(0, 12);

		// Verify we have branch and jump instructions detected
		Assert.True(instructions.Count >= 4);
		Assert.Contains(instructions, i => i.Mnemonic.StartsWith("bne", StringComparison.OrdinalIgnoreCase));
		Assert.Contains(instructions, i => i.Mnemonic.StartsWith("jmp", StringComparison.OrdinalIgnoreCase));
	}

	[Fact]
	public void DisassemblerWorkflow_SymbolTableIntegration() {
		var rom = new byte[16];
		rom[0] = 0x20; // JSR $8100
		rom[1] = 0x00;
		rom[2] = 0x81;
		rom[3] = 0xa9; // LDA $0010
		rom[4] = 0x10;
		rom[5] = 0x00;
		rom[6] = 0x60; // RTS

		var symbols = new SymbolTable();
		symbols.AddSymbol("MySubroutine", 0x8100);
		symbols.AddSymbol("PlayerHealth", 0x0010);

		var disasm = new Disassembler(rom, new Disassembler.Options {
			BaseAddress = 0x8000,
			Symbols = symbols
		});

		var instructions = disasm.Disassemble(0, 7);

		Assert.NotEmpty(instructions);
		// Note: The disassembler should use symbol names when available
		// The actual symbol resolution depends on disassembler implementation
	}

	[Fact]
	public void DisassemblerWorkflow_CrossReferenceCollection() {
		// Simple ROM with JSR and JMP instructions
		var rom = new byte[] {
			0x20, 0x06, 0x80, // $8000: JSR $8006
			0x4c, 0x09, 0x80, // $8003: JMP $8009
			0xa9, 0x42,       // $8006: LDA #$42
			0x60,             // $8008: RTS
			0xa2, 0x00,       // $8009: LDX #$00
			0x60              // $800B: RTS
		};

		var xref = new CrossReferenceBuilder();
		xref.ProcessCode(rom, 0x8000);

		// JSR at $8000 should reference $8006
		var callsFrom8000 = xref.GetReferencesFrom(0x8000).ToList();
		Assert.Contains(callsFrom8000, r => r.Target == 0x8006);

		// $8006 should have a reference from $8000
		var refsTo8006 = xref.GetReferencesTo(0x8006).ToList();
		Assert.NotEmpty(refsTo8006);
	}

	#endregion

	#region Map Editor Workflow

	[Fact]
	public void MapEditorWorkflow_LoadModifySave() {
		// Simulate map data
		const int width = 16;
		const int height = 16;
		var mapData = new byte[width * height];

		// Fill with pattern
		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				mapData[(y * width) + x] = (byte)((x + y) % 256);
			}
		}

		// Modify tile at position (5, 5)
		int targetX = 5, targetY = 5;
		byte newTile = 0xff;
		mapData[(targetY * width) + targetX] = newTile;

		// Verify modification
		Assert.Equal(newTile, mapData[(targetY * width) + targetX]);

		// Verify neighbors unchanged
		Assert.NotEqual(newTile, mapData[((targetY - 1) * width) + targetX]);
		Assert.NotEqual(newTile, mapData[(targetY * width) + (targetX - 1)]);
	}

	[Fact]
	public void MapEditorWorkflow_FloodFill() {
		const int width = 8;
		const int height = 8;
		var mapData = new byte[width * height];

		// Create a region of tile 0x01
		mapData[0] = 0x01;
		mapData[1] = 0x01;
		mapData[width] = 0x01;
		mapData[width + 1] = 0x01;

		// Simple flood fill implementation
		byte targetTile = 0x01;
		byte replacementTile = 0xff;
		var visited = new HashSet<int>();
		var queue = new Queue<int>();
		queue.Enqueue(0);

		while (queue.Count > 0) {
			int pos = queue.Dequeue();
			if (visited.Contains(pos)) continue;
			if (pos < 0 || pos >= mapData.Length) continue;
			if (mapData[pos] != targetTile) continue;

			visited.Add(pos);
			mapData[pos] = replacementTile;

			int x = pos % width;
			int y = pos / width;
			if (x > 0) queue.Enqueue(pos - 1);
			if (x < width - 1) queue.Enqueue(pos + 1);
			if (y > 0) queue.Enqueue(pos - width);
			if (y < height - 1) queue.Enqueue(pos + width);
		}

		// Verify the fill worked
		Assert.Equal(replacementTile, mapData[0]);
		Assert.Equal(replacementTile, mapData[1]);
		Assert.Equal(replacementTile, mapData[width]);
		Assert.Equal(replacementTile, mapData[width + 1]);
		Assert.Equal(0x00, mapData[2]); // Adjacent unfilled
	}

	#endregion

	#region CHR Editor Workflow

	[Fact]
	public void ChrEditorWorkflow_TileRoundTrip() {
		// Create an 8x8 2bpp tile
		var tileData = new byte[16];
		for (int i = 0; i < 16; i++) {
			tileData[i] = (byte)(i * 17); // Create some pattern
		}

		// Decode to pixel data
		var pixels = TileCodec.DecodeNes2bpp(tileData);
		Assert.Equal(64, pixels.Length);

		// Encode back
		var reencoded = TileCodec.EncodeNes2bpp(pixels);
		Assert.Equal(tileData, reencoded);
	}

	[Fact]
	public void ChrEditorWorkflow_MultiTileSelection() {
		// Simulate multi-tile selection
		var selectedIndices = new List<int> { 0, 1, 16, 17 }; // 2x2 block

		// Calculate bounding box
		int minX = selectedIndices.Min() % 16;
		int maxX = selectedIndices.Max() % 16;
		int minY = selectedIndices.Min() / 16;
		int maxY = selectedIndices.Max() / 16;

		Assert.Equal(0, minX);
		Assert.Equal(1, maxX);
		Assert.Equal(0, minY);
		Assert.Equal(1, maxY);

		// Selection width/height
		int selWidth = maxX - minX + 1;
		int selHeight = maxY - minY + 1;

		Assert.Equal(2, selWidth);
		Assert.Equal(2, selHeight);
	}

	[Fact]
	public void ChrEditorWorkflow_TileFlipHorizontal() {
		// Create simple 8x8 tile with left side filled
		var pixels = new byte[64];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 4; x++) {
				pixels[(y * 8) + x] = 1; // Left half = color 1
			}
		}

		// Flip horizontally
		var flipped = new byte[64];
		for (int y = 0; y < 8; y++) {
			for (int x = 0; x < 8; x++) {
				flipped[(y * 8) + x] = pixels[(y * 8) + (7 - x)];
			}
		}

		// Verify right side is now filled
		Assert.Equal(0, flipped[0]); // Top-left is now 0
		Assert.Equal(1, flipped[7]); // Top-right is now 1
	}

	#endregion

	#region Script Editor Workflow

	[Fact]
	public void ScriptEditorWorkflow_SimpleScript() {
		// Simple script bytecode
		var script = new byte[] {
			0x01, 0x42,       // Command 1 with param
			0x02, 0x10, 0x00, // Command 2 with 16-bit param
			0x00              // END
		};

		// Parse commands (simplified)
		var commands = new List<(int offset, byte opcode, byte[] parameters)>();
		int offset = 0;

		while (offset < script.Length) {
			byte opcode = script[offset++];
			if (opcode == 0x00) break;

			int paramCount = opcode switch {
				0x01 => 1,
				0x02 => 2,
				_ => 0
			};

			var parameters = new byte[paramCount];
			for (int i = 0; i < paramCount; i++) {
				parameters[i] = script[offset++];
			}

			commands.Add((offset - paramCount - 1, opcode, parameters));
		}

		Assert.Equal(2, commands.Count);
		Assert.Equal(0x01, commands[0].opcode);
		Assert.Equal(0x02, commands[1].opcode);
	}

	[Fact]
	public void ScriptEditorWorkflow_ControlFlowDetection() {
		// Script with conditional branch
		var script = new byte[] {
			0x10, 0x05,       // IF condition, skip 5 bytes
			0x01, 0x42,       // True branch command
			0x11, 0x03,       // ELSE, skip 3 bytes
			0x01, 0x43,       // False branch command
			0x00              // END
		};

		// Detect control flow edges (simplified)
		var edges = new List<(int from, int to, string type)>();
		int offset = 0;

		while (offset < script.Length - 1) {
			byte opcode = script[offset];

			if (opcode == 0x10) { // IF
				int skipBytes = script[offset + 1];
				edges.Add((offset, offset + 2 + skipBytes, "ConditionalJump"));
				edges.Add((offset, offset + 2, "FallThrough"));
			} else if (opcode == 0x11) { // ELSE
				int skipBytes = script[offset + 1];
				edges.Add((offset, offset + 2 + skipBytes, "UnconditionalJump"));
			}

			offset++;
		}

		Assert.True(edges.Count >= 2);
		Assert.Contains(edges, e => e.type == "ConditionalJump");
	}

	#endregion

	#region Helper Methods

	private static byte[] CreateNesRom(int prgBanks, int chrBanks) {
		int prgSize = prgBanks * 0x4000;
		int chrSize = chrBanks * 0x2000;
		var rom = new byte[16 + prgSize + chrSize];

		// iNES header
		rom[0] = (byte)'N';
		rom[1] = (byte)'E';
		rom[2] = (byte)'S';
		rom[3] = 0x1a;
		rom[4] = (byte)prgBanks;
		rom[5] = (byte)chrBanks;

		// Fill with NOPs
		for (int i = 16; i < 16 + prgSize; i++) {
			rom[i] = 0xea;
		}

		return rom;
	}

	#endregion
}
