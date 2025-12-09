# GameInfo Tools CLI Reference

Complete reference for the GameInfo Tools command-line interface.

## Overview

GameInfo Tools (`git`) is a comprehensive ROM hacking toolkit providing commands for:

- ROM file operations
- Text extraction and insertion
- Graphics/tile manipulation
- ROM analysis
- Game data editing
- Disassembly tools

## Installation

```bash
# Build from source
dotnet build src/GameInfoTools.sln

# Run the CLI
dotnet run --project src/GameInfoTools.Cli
```

## Command Structure

```
git <category> <command> [arguments] [options]
```

Categories: `rom`, `text`, `graphics`, `analysis`, `data`, `disasm`, `list`

---

## ROM Commands

### rom info

Display detailed ROM information including header data, checksums, and metadata.

```bash
git rom info <rom-file>
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Output:**
- File size
- System type (NES, SNES, etc.)
- Title (if available)
- Header size
- PRG ROM size (NES)
- CHR ROM size (NES)
- Mapper number (NES)
- Battery/trainer flags
- CRC32, MD5, SHA1 checksums

**Example:**
```bash
git rom info "Dragon Warrior IV.nes"
```

---

### rom checksum

Calculate or fix ROM checksums.

```bash
git rom checksum <rom-file> [--fix]
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Options:**
- `--fix` - Attempt to fix incorrect checksum (SNES only)

**Notes:**
- NES ROMs don't have internal checksums (displays CRC32)
- SNES ROMs have internal checksum at header location

**Example:**
```bash
git rom checksum "game.sfc" --fix
```

---

### rom expand

Expand a ROM to a larger size.

```bash
git rom expand <rom-file> <size>
```

**Arguments:**
- `rom-file` - Path to the ROM file
- `size` - New size (e.g., `512KB`, `1MB`, or raw bytes)

**Size formats:**
- `512KB` - 512 kilobytes
- `1MB` - 1 megabyte  
- `524288` - Raw byte count

**Example:**
```bash
git rom expand "game.nes" 1MB
```

---

### rom header

View ROM header data in hex dump format.

```bash
git rom header <rom-file>
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Output:**
- Hex dump of raw header bytes
- ASCII representation

**Example:**
```bash
git rom header "game.nes"
```

---

## Text Commands

### text extract

Extract text strings from a ROM using a table file.

```bash
git text extract <rom-file> [--table <tbl-file>] [--output <output-file>]
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Options:**
- `--table` - Table file (.tbl) for character mapping
- `--output` - Output file path

**Example:**
```bash
git text extract "game.nes" --table "game.tbl" --output "script.txt"
```

---

### text insert

Insert text strings into a ROM from a script file.

```bash
git text insert <rom-file> <script-file> [--table <tbl-file>]
```

**Arguments:**
- `rom-file` - Path to the ROM file
- `script-file` - Script file to insert

**Options:**
- `--table` - Table file (.tbl) for character mapping

**Example:**
```bash
git text insert "game.nes" "translation.txt" --table "game.tbl"
```

---

### text dte

Analyze text for DTE (Dual Tile Encoding) compression opportunities.

```bash
git text dte <rom-file>
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Notes:**
- DTE compresses common character pairs into single bytes
- Analysis shows potential space savings

**Example:**
```bash
git text dte "game.nes"
```

---

## Graphics Commands

### graphics chr

Extract CHR (character/tile) data from a ROM.

```bash
git graphics chr <rom-file> [--output <directory>]
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Options:**
- `--output` - Output directory for extracted files

**Output files:**
- `.chr` - Raw CHR bank data
- `.txt` - Text visualization of tiles

**Notes:**
- NES: Extracts 8KB CHR banks
- SNES: Tile extraction (planned)
- Other: Generic chunk extraction

**Example:**
```bash
git graphics chr "game.nes" --output "./chr-banks"
```

---

### graphics palette

Extract or convert palette data from a ROM.

```bash
git graphics palette <rom-file>
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Notes:**
- NES: 64-color system palette
- SNES: 15-bit RGB palettes

**Example:**
```bash
git graphics palette "game.nes"
```

---

## Analysis Commands

### analysis opcodes

Analyze CPU opcode usage patterns in a ROM.

```bash
git analysis opcodes <rom-file> [--bank <number>]
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Options:**
- `--bank` - Analyze specific bank only

**Output:**
- Opcode frequency distribution
- Most/least used instructions
- Potential code vs data regions

**Example:**
```bash
git analysis opcodes "game.nes" --bank 15
```

---

### analysis compression

Detect compression algorithms used in a ROM.

```bash
git analysis compression <rom-file>
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Detected algorithms:**
- RLE (Run-Length Encoding)
- LZ variants
- Huffman
- Custom compression

**Example:**
```bash
git analysis compression "game.sfc"
```

---

### analysis xref

Build a cross-reference database for ROM analysis.

```bash
git analysis xref <rom-file> [--output <db-file>]
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Options:**
- `--output` - Output database file path

**Output:**
- Code references
- Data references
- Jump tables
- Call graphs

**Example:**
```bash
git analysis xref "game.nes" --output "game.xref"
```

---

## Data Commands

### data export

Export game data structures to JSON format.

```bash
git data export <rom-file> <data-type>
```

**Arguments:**
- `rom-file` - Path to the ROM file
- `data-type` - Type of data to export

**Supported data types:**
- `monsters` - Monster/enemy stats
- `items` - Item definitions
- `spells` - Spell/magic data
- `shops` - Shop inventories
- `maps` - Map/level data

**Example:**
```bash
git data export "game.nes" monsters
```

---

### data import

Import game data from JSON back into a ROM.

```bash
git data import <rom-file> <json-file>
```

**Arguments:**
- `rom-file` - Path to the ROM file
- `json-file` - JSON file with data to import

**Example:**
```bash
git data import "game.nes" "monsters.json"
```

---

## Disassembly Commands

### disasm bank

Disassemble a specific ROM bank.

```bash
git disasm bank <rom-file> <bank-number>
```

**Arguments:**
- `rom-file` - Path to the ROM file
- `bank-number` - Bank number to disassemble (0-based)

**Output:**
- 6502/65816 assembly listing
- Address labels
- Comments for known patterns

**Example:**
```bash
git disasm bank "game.nes" 0
```

---

### disasm labels

Manage debug labels for disassembly.

```bash
git disasm labels <rom-file> [--format <format>]
```

**Arguments:**
- `rom-file` - Path to the ROM file

**Options:**
- `--format` - Label file format (default: `mlb`)

**Supported formats:**
- `mlb` - Mesen label format
- `nl` - FCEUX name list format
- `sym` - Generic symbol format

**Example:**
```bash
git disasm labels "game.nes" --format mlb
```

---

### disasm cdl

Process a Code/Data Logger file for analysis.

```bash
git disasm cdl <cdl-file>
```

**Arguments:**
- `cdl-file` - Path to the CDL file

**Notes:**
- CDL files record which bytes are code vs data
- Generated by emulators like Mesen/FCEUX
- Improves disassembly accuracy

**Example:**
```bash
git disasm cdl "game.cdl"
```

---

## Utility Commands

### list

Display all available tools and commands.

```bash
git list
```

**Output:**
- Table of all tools with category and description

---

## File Formats

### Table Files (.tbl)

Standard ROM hacking table format for character encoding:

```
00=A
01=B
...
FF=[END]
```

### JSON Data Files

Structured game data in JSON format:

```json
{
	"type": "monsters",
	"version": "1.0",
	"data": [
		{
			"id": 0,
			"name": "Slime",
			"hp": 8,
			"attack": 4
		}
	]
}
```

---

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | General error |
| 2 | Invalid arguments |
| 3 | File not found |
| 4 | Invalid file format |

---

## See Also

- [Tool Usage Guide](tool-usage.md) - General tool usage patterns
- [CDL Tools Guide](cdl-tools.md) - Working with CDL files
- [Label Management](label-management.md) - Managing debug labels
- [TBL Format](../formats/tbl-format.md) - Table file format specification
