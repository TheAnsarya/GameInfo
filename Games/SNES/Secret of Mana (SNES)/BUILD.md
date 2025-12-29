# Secret of Mana - Build Instructions

## Prerequisites

- **Assembler:** Asar or bass (65816 assembler)
- **.NET 10:** For C# tools
- **PowerShell:** For build scripts
- **Original ROM:** `Secret of Mana (U) [!].sfc` (2 MB, SHA256: `4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f`)

## Directory Structure

```
Secret of Mana (SNES)/
├── build/                  # Build output
│   ├── rom/                # Assembled ROM
│   └── assets/             # Converted assets
├── disasm/                 # Disassembly source
├── src/
│   └── data/               # Data tables as includes
├── assets/
│   ├── graphics/           # PNG graphics
│   ├── audio/              # SPC/BRR audio
│   ├── text/               # Text/dialog
│   └── maps/               # Map data
└── tools/                  # Build tools
```

## Building the ROM

### Quick Build

```powershell
# From the project directory
./build.ps1
```

### Clean Build

```powershell
./build.ps1 -Clean
```

### Build with Verification

```powershell
./build.ps1 -Verify
```

## Build Pipeline

### Phase 1: Asset Conversion

Converts editable assets to binary format:

```powershell
# Graphics: PNG → Binary
tools/convert_graphics.py --input assets/graphics --output build/assets/graphics

# Text: JSON → Binary
tools/convert_text.py --input assets/text --output build/assets/text

# Audio: Keep as binary (no conversion needed)
```

### Phase 2: Assembly

Assembles disassembly source into ROM:

```powershell
# Using Asar
asar --fix-checksum disasm/main.asm build/rom/secret-of-mana.sfc
```

### Phase 3: Verification

Compares built ROM against original:

```powershell
# Byte comparison
tools/verify_rom.py --original "../../../~roms/SNES/GoodSNES/Secret of Mana (U) [!].sfc" --built build/rom/secret-of-mana.sfc
```

## Expected Checksums

| File | SHA256 |
|------|--------|
| Original ROM | `4c15013131351e694e05f22e38bb1b3e4031dedac77ec75abecebe8520d82d5f` |
| Built ROM | Should match original |

## Build Configuration

The `build.config.json` file controls build settings:

```json
{
  "assembler": "asar",
  "source": "disasm/main.asm",
  "output": "build/rom/secret-of-mana.sfc",
  "originalRom": "../../../~roms/SNES/GoodSNES/Secret of Mana (U) [!].sfc",
  "verify": true,
  "assets": {
    "graphics": true,
    "audio": true,
    "text": true
  }
}
```

## Troubleshooting

### ROM doesn't match original

1. Check assembler version compatibility
2. Verify all data tables are included
3. Check bank alignment
4. Review any patches or modifications

### Missing dependencies

```powershell
# Install .NET tools
dotnet tool restore

# Install Python dependencies
pip install -r requirements.txt
```

### Checksum mismatch

The assembler should automatically fix the internal checksum. If issues persist:

```powershell
# Manual checksum fix
tools/fix_checksum.py build/rom/secret-of-mana.sfc
```

## Development Workflow

1. **Edit** source files in `disasm/` or `assets/`
2. **Build** with `./build.ps1`
3. **Test** in emulator
4. **Verify** with `-Verify` flag
5. **Commit** changes

## Related Documentation

- [README.md](README.md) - Project overview
- [ROM-MAP.md](ROM-MAP.md) - ROM address reference
- [RAM-MAP.md](RAM-MAP.md) - RAM address reference
- [ROADMAP.md](ROADMAP.md) - Project roadmap

---

*Note: Build pipeline is under development. Some features may not be fully implemented.*
