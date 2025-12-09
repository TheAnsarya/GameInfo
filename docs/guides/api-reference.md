# GameInfoTools API Reference

This document provides an overview of the C# library APIs available in the GameInfoTools solution.

## Library Overview

The solution is organized into specialized libraries:

| Library | Namespace | Purpose |
|---------|-----------|---------|
| Core | `GameInfoTools.Core` | Address conversion, checksums, patterns, text tables |
| Rom | `GameInfoTools.Rom` | ROM file operations, bank management |
| Graphics | `GameInfoTools.Graphics` | CHR editing, sprite extraction |
| Text | `GameInfoTools.Text` | String extraction, script compilation |
| Data | `GameInfoTools.Data` | Data table editing |
| Analysis | `GameInfoTools.Analysis` | ROM analysis, cross-references |
| Disassembly | `GameInfoTools.Disassembly` | 6502/65816 disassembly |

## Core Library

### AddressConverter

Converts between file offsets and CPU/PPU addresses for various systems.

```csharp
using GameInfoTools.Core;

// Parse hex strings
int value = AddressConverter.ParseHex("$8000");      // Returns 32768
int value2 = AddressConverter.ParseHex("0x1234");   // Returns 4660

// Format to hex
string hex = AddressConverter.ToHex(0x8000);        // Returns "$8000"
string hex6 = AddressConverter.ToHex(0x8000, 6);    // Returns "$008000"

// NES address conversion
int fileOffset = AddressConverter.NesToFile(0x8000, bank: 0);
int cpuAddr = AddressConverter.FileToNes(0x10, bank: 0);

// SNES address conversion (LoROM/HiROM)
int snesFile = AddressConverter.SnesToFile(0x808000, AddressConverter.SnesMapping.LoRom);
int cpuSnes = AddressConverter.FileToSnes(0x0000, AddressConverter.SnesMapping.LoRom);
```

### TextTable

Loads and uses text encoding tables (TBL files).

```csharp
using GameInfoTools.Core;

// Load from file
var table = TextTable.LoadFromFile("game.tbl");

// Decode bytes to string
string text = table.Decode(new byte[] { 0x8A, 0x8B, 0x8C });

// Encode string to bytes
byte[] bytes = table.Encode("HERO");

// Add custom entries
table.AddEntry(0xFE, "{WAIT}");
table.AddEntry(0xFF, "{END}");
```

### Checksum

Calculate checksums for various systems.

```csharp
using GameInfoTools.Core;

// Calculate checksums
ushort nesChecksum = Checksum.CalculateNes(romData);
ushort snesChecksum = Checksum.CalculateSnes(romData);
ushort crc16 = Checksum.Crc16(data);
uint crc32 = Checksum.Crc32(data);
string md5 = Checksum.Md5(data);
string sha1 = Checksum.Sha1(data);

// Verify checksum
bool valid = Checksum.VerifyNes(romData);
```

### PatternDetector

Detect common data patterns in ROM files.

```csharp
using GameInfoTools.Core;

// Find pointer tables
var pointerTables = PatternDetector.FindPointerTables(data, bank: 0);

// Find repeated patterns
var patterns = PatternDetector.FindRepeatedPatterns(data, minLength: 4);

// Find jump tables
var jumpTables = PatternDetector.FindJumpTables(data);
```

### TileGraphics

Encode/decode tile graphics for various systems.

```csharp
using GameInfoTools.Core;

// Decode a tile
byte[,] pixels = TileGraphics.DecodeTile(data, offset, TileGraphics.TileFormat.Nes2Bpp);

// Encode a tile
byte[] encoded = TileGraphics.EncodeTile(pixels, TileGraphics.TileFormat.Nes2Bpp);

// Supported formats
// - Nes2Bpp: NES 2 bits per pixel (16 bytes/tile)
// - Snes4Bpp: SNES 4 bits per pixel (32 bytes/tile)
// - Gb2Bpp: Game Boy 2 bits per pixel
// - Linear4Bpp: Linear 4bpp (SEGA Genesis)
```

### Palette

Color conversion utilities.

```csharp
using GameInfoTools.Core;

// NES palette conversion
var (r, g, b) = Palette.NesToRgb(0x0F);  // Black

// SNES 15-bit color conversion
var (r, g, b) = Palette.SnesColorToRgb(0x7FFF);  // White
ushort snesColor = Palette.RgbToSnesColor(255, 255, 255);

// Read SNES palette from ROM
var palette = Palette.ReadSnesPalette(data, offset, colorCount: 16);
```

## ROM Library

### RomFile

Load, modify, and save ROM files.

```csharp
using GameInfoTools.Rom;

// Load a ROM
var rom = new RomFile();
rom.Load("game.nes");

// Read data
byte value = rom.ReadByte(0x1234);
ushort word = rom.ReadUInt16(0x1234);
var bytes = rom.Read(0x1234, 16);

// Write data
rom.WriteByte(0x1234, 0xAB);
rom.Write(0x1234, new byte[] { 0x01, 0x02, 0x03 });

// Save changes
rom.Save();
rom.Save("modified.nes");

// Get ROM info
var info = rom.GetInfo();
Console.WriteLine($"System: {info.System}, Mapper: {info.Mapper}");
```

### BankManager

Manage ROM banks for NES/SNES.

```csharp
using GameInfoTools.Rom;

var bankManager = new BankManager(romData, headerSize: 16, bankSize: 0x4000);

// Get bank data
byte[] bank0 = bankManager.GetBank(0);

// Set bank data
bankManager.SetBank(0, newBankData);

// Get bank count
int count = bankManager.BankCount;
```

## Graphics Library

### ChrEditor

Edit NES CHR tile data.

```csharp
using GameInfoTools.Graphics;

var chrEditor = new ChrEditor(romData, chrOffset, chrLength);

// Get/set tiles
byte[,] tile = chrEditor.GetTile(0);
chrEditor.SetTile(0, newTilePixels);

// Tile manipulation
var flipped = ChrEditor.FlipHorizontal(tile);
var rotated = ChrEditor.Rotate90(tile);

// Export to grid for editing
byte[,] grid = chrEditor.ExportToGrid(tilesPerRow: 16);

// Find duplicate tiles
var duplicates = chrEditor.FindDuplicates();
```

### SpriteExtractor

Extract and analyze sprite data.

```csharp
using GameInfoTools.Graphics;

// Parse NES OAM data
var sprites = SpriteExtractor.ParseNesOam(oamData);

// Extract metasprite definitions
var metasprite = SpriteExtractor.ExtractMetasprite(data, offset, spriteCount);

// Get metasprite bounds
var (minX, minY, maxX, maxY) = metasprite.GetBounds();
```

## Text Library

### StringExtractor

Extract text from ROM using text tables.

```csharp
using GameInfoTools.Text;

var extractor = new StringExtractor(textTable);

// Extract all strings
var strings = extractor.ExtractAllStrings(data, minLength: 3, minConfidence: 0.7f);

// Search for text
var matches = extractor.SearchString(data, "HERO");

// Export formats
string csv = extractor.ExportToCsv(strings);
string json = extractor.ExportToJson(strings);
string script = extractor.ExportToScript(strings);
```

### ScriptCompiler

Compile script files to binary.

```csharp
using GameInfoTools.Text;

var compiler = new ScriptCompiler(textTable);

// Compile script
byte[] binary = compiler.Compile(scriptText);

// With options
var options = new ScriptCompiler.Options 
{
    BaseAddress = 0x8000,
    AllowUndefinedLabels = false
};
byte[] binary = compiler.Compile(scriptText, options);
```

## Analysis Library

### RomAnalyzer

Analyze ROM structure and identify data types.

```csharp
using GameInfoTools.Analysis;

var analyzer = new RomAnalyzer(romData);

// Analyze entire ROM
var blocks = analyzer.AnalyzeRom(blockSize: 256);

// Each block has type, confidence, and offset
foreach (var block in blocks)
{
    Console.WriteLine($"0x{block.Offset:X}: {block.Type} ({block.Confidence:P0})");
}
```

### CrossReferenceDb

Track code cross-references.

```csharp
using GameInfoTools.Analysis;

var xrefs = new CrossReferenceDb();

// Add references
xrefs.AddReference(0x8100, 0x8000, CrossReferenceDb.RefType.Call);
xrefs.AddReference(0x8200, 0x8000, CrossReferenceDb.RefType.Jump);

// Query references
var refs = xrefs.GetReferencesTo(0x8000);
var from = xrefs.GetReferencesFrom(0x8100);
```

## Disassembly Library

### Disassembler

Disassemble 6502/65816 code.

```csharp
using GameInfoTools.Disassembly;

var options = new Disassembler.Options
{
    Mode = Disassembler.CpuMode.Cpu6502,
    BaseAddress = 0x8000,
    ShowBytes = true,
    LowercaseHex = true
};

var disasm = new Disassembler(romData, options);

// Disassemble a range
var instructions = disasm.Disassemble(offset: 0, length: 100);

// Disassemble single instruction
var instr = disasm.DisassembleOne(offset);
Console.WriteLine($"{instr.Mnemonic} {instr.Operand}");
```

## Data Library

### DataTableEditor

Edit structured game data tables.

```csharp
using GameInfoTools.Data;

var editor = new DataTableEditor(romData);

// Define table structure
var table = new DataTableEditor.TableDef
{
    Name = "Monsters",
    BaseOffset = 0x10000,
    RecordSize = 16,
    RecordCount = 100
};

// Add field definitions
table.Fields.Add(new DataTableEditor.FieldDef("HP", DataTableEditor.FieldType.Word, 0));
table.Fields.Add(new DataTableEditor.FieldDef("Attack", DataTableEditor.FieldType.Byte, 2));
table.Fields.Add(new DataTableEditor.FieldDef("Defense", DataTableEditor.FieldType.Byte, 3));

// Read/write records
var record = editor.ReadRecord(table, index: 0);
record["HP"] = (ushort)200;
editor.WriteRecord(table, index: 0, record);
```

## CLI Tool

The `gameinfo` CLI provides command-line access to all features:

```bash
# ROM operations
gameinfo rom info game.nes
gameinfo rom checksum game.sfc
gameinfo rom extract-bank game.nes --bank 0 --output bank0.bin

# Text operations
gameinfo text extract game.nes --table game.tbl --output strings.txt
gameinfo text compile script.txt --table game.tbl --output text.bin

# Graphics operations
gameinfo graphics export-chr game.nes --offset 0x20010 --output tiles.png
gameinfo graphics import-chr tiles.png --output game.nes --offset 0x20010

# Analysis
gameinfo analysis map game.nes --output map.txt
gameinfo analysis xref game.nes --output xrefs.json

# Disassembly
gameinfo disasm dump game.nes --offset 0 --length 256 --output code.asm
```

## Error Handling

Most methods throw standard .NET exceptions:

- `ArgumentException` - Invalid arguments
- `ArgumentOutOfRangeException` - Index/offset out of bounds
- `FileNotFoundException` - File not found
- `InvalidOperationException` - Invalid state

```csharp
try
{
    var rom = new RomFile();
    rom.Load("nonexistent.nes");
}
catch (FileNotFoundException ex)
{
    Console.WriteLine($"ROM not found: {ex.Message}");
}
```

## Further Reading

- [Getting Started Guide](getting-started.md)
- [CLI Reference](cli-reference.md)
- [Contributing Guide](../CONTRIBUTING.md)
