# Getting Started with GameInfo Tools

A quick guide to setting up and using the GameInfo ROM hacking toolkit.

## Prerequisites

- [.NET 9.0 SDK](https://dotnet.microsoft.com/download/dotnet/9.0) or later
- A code editor (VS Code recommended)
- ROM files to work with

## Installation

### From Source

```bash
# Clone the repository
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo

# Build the solution
dotnet build src/GameInfoTools.sln

# Run the CLI
dotnet run --project src/GameInfoTools.Cli
```

### Building Release

```bash
# Build release configuration
dotnet build src/GameInfoTools.sln -c Release

# Or publish as single file
dotnet publish src/GameInfoTools.Cli -c Release -r win-x64 --self-contained
```

## Quick Start

### 1. View ROM Information

```bash
git rom info "path/to/game.nes"
```

This displays:
- File size and system type
- Header information (PRG/CHR sizes, mapper, etc.)
- Checksums (CRC32, MD5, SHA1)

### 2. Extract Graphics (NES)

```bash
git graphics chr "game.nes" --output "./chr-banks"
```

Extracts CHR ROM banks to:
- `.chr` files (raw binary)
- `.txt` files (ASCII visualization)

### 3. Extract Text

```bash
# With a table file
git text extract "game.nes" --table "game.tbl" --output "script.txt"

# Using default ASCII
git text extract "game.nes"
```

### 4. Analyze Compression

```bash
git analysis compression "game.sfc"
```

Detects compression algorithms:
- RLE (Run-Length Encoding)
- LZ77/LZSS variants
- Nintendo LZ (GBA/DS)
- Custom formats

### 5. Disassemble Code

```bash
# Disassemble a specific bank
git disasm bank "game.nes" 15

# View with labels
git disasm labels "game.nes" --format mlb
```

### 6. Export Game Data

```bash
git data export "game.nes" monsters
git data export "game.nes" items
git data export "game.nes" spells
```

## Table File Format (.tbl)

Table files map ROM bytes to text characters:

```
00=A
01=B
02=C
...
20=[space]
FF=[END]
```

Special entries use brackets: `{NEWLINE}`, `{END}`, `{WAIT}`, etc.

## Common Workflows

### Script Translation

1. Extract text with table file
2. Edit the extracted script
3. Insert translated text back

```bash
# Extract
git text extract "game.nes" --table "game.tbl" --output "script.txt"

# (Edit script.txt externally)

# Insert
git text insert "game.nes" "script.txt" --table "game.tbl"
```

### Graphics Editing

1. Extract CHR data
2. Edit with external tile editor
3. Import modified tiles

```bash
# Extract
git graphics chr "game.nes" --output "./chr"

# (Edit CHR files with YY-CHR or similar)

# Import (not yet implemented)
```

### ROM Analysis

1. Get ROM info
2. Analyze code patterns
3. Build cross-reference database

```bash
# Basic info
git rom info "game.nes"

# Opcode analysis
git analysis opcodes "game.nes"

# Build xref database
git analysis xref "game.nes" --output "game.xref"
```

## Supported Systems

| System | Info | Graphics | Text | Disasm |
|--------|------|----------|------|--------|
| NES | ✅ | ✅ | ✅ | ✅ |
| SNES | ✅ | 🔄 | ✅ | ✅ |
| Game Boy | ✅ | 🔄 | ✅ | 🔄 |
| GBA | ✅ | 🔄 | 🔄 | 🔄 |

✅ = Full support  
🔄 = Partial/In progress

## Configuration

### Project Configuration

Create `gameinfo.json` in your project root:

```json
{
	"system": "nes",
	"tableFile": "game.tbl",
	"outputDir": "./output",
	"banks": {
		"text": [0, 1, 2],
		"graphics": [3, 4]
	}
}
```

### Label Files

Supported formats:
- `.mlb` - Mesen label format
- `.nl` - FCEUX name list
- `.sym` - Generic symbol file

## Troubleshooting

### "Unknown ROM type"

The ROM header wasn't recognized. Try:
1. Verify the ROM is not corrupted
2. Check if it has a header (NES should start with "NES\x1A")
3. Some ROMs may need manual configuration

### "Table file not found"

Ensure the table file exists and uses correct format:
- Lines must be `XX=char` format
- Use `{control}` for special characters
- UTF-8 encoding recommended

### Build Errors

```bash
# Clean and rebuild
dotnet clean src/GameInfoTools.sln
dotnet build src/GameInfoTools.sln
```

## Next Steps

- Read the [CLI Reference](cli-reference.md) for all commands
- Check [format specifications](../formats/) for file formats
- See [CDL Tools Guide](cdl-tools.md) for debugging workflows

## Getting Help

- Run `git --help` for command list
- Run `git <command> --help` for specific help
- Check [GitHub Issues](https://github.com/TheAnsarya/GameInfo/issues) for known issues
