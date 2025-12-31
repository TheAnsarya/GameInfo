# GameInfoTools CLI Reference

Complete command reference for the .NET GameInfoTools command-line interface.

## Installation

```bash
# Build from source
dotnet build

# Run CLI
dotnet run --project src/GameInfoTools.Cli -- <command>

# Or use built binary
./src/GameInfoTools.Cli/bin/Debug/net10.0/git <command>
```

## Global Options

| Option | Description |
|--------|-------------|
| `--help`, `-h` | Show help |
| `--version`, `-v` | Show version |
| `--verbose` | Verbose output |
| `--quiet`, `-q` | Suppress non-error output |

---

## ROM Commands

### `rom info`

Display ROM information including header, checksums, and system type.

```bash
git rom info <file> [options]

# Examples
git rom info game.nes
git rom info game.sfc --verbose
git rom info game.gb --format json
```

**Options:**
| Option | Description |
|--------|-------------|
| `--format` | Output format: `text`, `json`, `xml` |
| `--verbose` | Show all header fields |

### `rom checksum`

Calculate or verify ROM checksums.

```bash
git rom checksum <file> [options]

# Examples
git rom checksum game.nes
git rom checksum game.sfc --verify
git rom checksum game.nes --algorithm sha256
```

**Options:**
| Option | Description |
|--------|-------------|
| `--verify` | Verify against header checksum |
| `--algorithm` | Hash: `crc32`, `md5`, `sha1`, `sha256` |
| `--fix` | Fix incorrect header checksum |

### `rom expand`

Expand ROM to specified size.

```bash
git rom expand <file> <size> [options]

# Examples
git rom expand game.nes 512KB --output expanded.nes
git rom expand game.sfc 4MB --fill 0xFF
```

**Options:**
| Option | Description |
|--------|-------------|
| `--output`, `-o` | Output file (default: overwrite) |
| `--fill` | Fill byte (default: 0x00) |

### `rom header`

View or modify ROM header.

```bash
git rom header <file> [options]

# Examples
git rom header game.nes
git rom header game.nes --set mapper=4
git rom header game.sfc --remove
```

**Options:**
| Option | Description |
|--------|-------------|
| `--set` | Set header field (key=value) |
| `--remove` | Remove header |
| `--add` | Add header |

---

## Text Commands

### `text extract`

Extract text using encoding tables.

```bash
git text extract <file> [options]

# Examples
git text extract game.nes --tbl table.tbl --output strings.txt
git text extract game.nes --offset 0x8000 --length 0x1000
git text extract game.nes --pointers 0x8000 --count 100
```

**Options:**
| Option | Description |
|--------|-------------|
| `--tbl` | Text encoding table file |
| `--output`, `-o` | Output file |
| `--offset` | Start offset (hex) |
| `--length` | Bytes to scan |
| `--pointers` | Pointer table offset |
| `--count` | Number of pointers |
| `--format` | Output: `text`, `json`, `csv` |

### `text insert`

Insert translated text back into ROM.

```bash
git text insert <file> [options]

# Examples
git text insert game.nes --tbl table.tbl --input strings.txt --output game_en.nes
```

**Options:**
| Option | Description |
|--------|-------------|
| `--tbl` | Text encoding table file |
| `--input`, `-i` | Input text file |
| `--output`, `-o` | Output ROM file |
| `--pointers` | Update pointer table |

---

## Graphics Commands

### `graphics chr`

Extract CHR graphics data.

```bash
git graphics chr <file> [options]

# Examples
git graphics chr game.nes --output chr.png
git graphics chr game.nes --bank 0 --output bank0.png
```

**Options:**
| Option | Description |
|--------|-------------|
| `--output`, `-o` | Output image file |
| `--bank` | Specific CHR bank |
| `--palette` | Palette colors (hex) |
| `--format` | Image format: `png`, `bmp` |

### `graphics tiles`

Export or import tile graphics.

```bash
git graphics tiles <file> [options]

# Examples
git graphics tiles game.sfc --offset 0x10000 --bpp 4 --output tiles.png
git graphics tiles import game.sfc --input tiles.png --offset 0x10000
```

**Options:**
| Option | Description |
|--------|-------------|
| `--offset` | Data offset (hex) |
| `--bpp` | Bits per pixel: 1, 2, 4, 8 |
| `--count` | Number of tiles |
| `--width` | Tiles per row |
| `--output`, `-o` | Output file |

---

## Analysis Commands

### `analysis opcodes`

Find code by opcode patterns.

```bash
git analysis opcodes <file> [options]

# Examples
git analysis opcodes game.nes --pattern "4C ?? 80"
git analysis opcodes game.nes --instruction JSR --to 0x8000
```

**Options:**
| Option | Description |
|--------|-------------|
| `--pattern` | Hex pattern with ?? wildcards |
| `--instruction` | Opcode mnemonic |
| `--to` | Target address |
| `--bank` | Search specific bank |

### `analysis map`

Generate ROM content map.

```bash
git analysis map <file> [options]

# Examples
git analysis map game.nes --output map.txt
git analysis map game.nes --cdl game.cdl --output map.html
```

**Options:**
| Option | Description |
|--------|-------------|
| `--output`, `-o` | Output file |
| `--cdl` | Include CDL coverage data |
| `--format` | Output: `text`, `html`, `json` |

### `analysis xref`

Generate cross-reference report.

```bash
git analysis xref <file> [options]

# Examples
git analysis xref game.nes --address 0x8000
git analysis xref game.nes --all --output xref.txt
```

**Options:**
| Option | Description |
|--------|-------------|
| `--address` | Address to find references to |
| `--all` | Generate full xref table |
| `--output`, `-o` | Output file |

---

## Data Commands

### `data monsters`

View or edit monster statistics.

```bash
git data monsters <file> [options]

# Examples
git data monsters game.nes --list
git data monsters game.nes --id 5 --verbose
git data monsters game.nes --export monsters.json
```

**Options:**
| Option | Description |
|--------|-------------|
| `--list` | List all monsters |
| `--id` | Specific monster ID |
| `--export` | Export to JSON |
| `--import` | Import from JSON |

### `data items`

View or edit item data.

```bash
git data items <file> [options]

# Examples
git data items game.nes --list
git data items game.nes --export items.json
```

**Options:**
| Option | Description |
|--------|-------------|
| `--list` | List all items |
| `--id` | Specific item ID |
| `--export` | Export to JSON |
| `--import` | Import from JSON |

---

## Disassembly Commands

### `disasm bank`

Disassemble a ROM bank.

```bash
git disasm bank <file> <bank> [options]

# Examples
git disasm bank game.nes 0 --output bank0.asm
git disasm bank game.nes 7 --labels labels.mlb
```

**Options:**
| Option | Description |
|--------|-------------|
| `--output`, `-o` | Output file |
| `--labels` | Label file (MLB/NL) |
| `--cdl` | CDL file for code hints |
| `--format` | Output: `ca65`, `asm6`, `nesasm` |

### `disasm trace`

Trace-based disassembly.

```bash
git disasm trace <file> [options]

# Examples
git disasm trace game.nes --entry 0x8000 --output disasm.asm
```

**Options:**
| Option | Description |
|--------|-------------|
| `--entry` | Entry point address |
| `--output`, `-o` | Output file |
| `--recursive` | Follow JSR/JMP |

---

## Utility Commands

### `list`

List available tools and commands.

```bash
git list
git list rom
git list --all
```

### `convert`

Convert between formats.

```bash
git convert <input> <output> [options]

# Examples
git convert labels.mlb labels.nl
git convert game.cdl game.mesen.cdl --format mesen
```

---

## Configuration

### Config File

Create `.gameinfotools.json` in project root:

```json
{
  "defaultTbl": "table.tbl",
  "defaultOutput": "output/",
  "verbose": false
}
```

### Environment Variables

| Variable | Description |
|----------|-------------|
| `GAMEINFO_TBL` | Default TBL file path |
| `GAMEINFO_OUTPUT` | Default output directory |

---

## Exit Codes

| Code | Meaning |
|------|---------|
| 0 | Success |
| 1 | General error |
| 2 | Invalid arguments |
| 3 | File not found |
| 4 | Invalid file format |

## See Also

- [Python Tools](README.md) - Python tool documentation
- [API Reference](../guides/api-reference.md) - C# library API
- [Getting Started](../guides/getting-started.md) - Quick start guide
