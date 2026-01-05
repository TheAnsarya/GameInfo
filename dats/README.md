# DAT Files and ROM Whitelists

This folder contains ROM DAT files and generated whitelists for various game systems.

## DAT Sources

We combine data from multiple trusted sources to create comprehensive ROM databases:

| Source | Description | URL |
|--------|-------------|-----|
| **NoIntro** | Curated, verified dumps of original releases | [datomatic.no-intro.org](https://datomatic.no-intro.org/) |
| **TOSEC** | The Old School Emulation Center - comprehensive catalog | [tosecdev.org](https://www.tosecdev.org/) |
| **OpenGood** | Open source GoodTools-style DATs | [github.com/SnowflakePowered/opengood](https://github.com/SnowflakePowered/opengood) |
| **Redump** | Disc-based system verification | [redump.org](http://redump.org/) |

## Folder Structure

```
dats/
├── README.md           # This file
├── sources/            # Original DAT files from various sources
│   ├── nointro/        # NoIntro DATs
│   ├── tosec/          # TOSEC DATs
│   └── opengood/       # OpenGood DATs
├── whitelists/         # Generated whitelist files
│   ├── snes/           # SNES ROM whitelists
│   ├── nes/            # NES ROM whitelists
│   └── ...
└── scripts/            # Helper scripts for DAT management
```

## Whitelist Categories

Each system has multiple whitelist files:

- **`{system}-commercial.json`** - Verified commercial releases only
- **`{system}-translations.json`** - Fan translation patches
- **`{system}-hacks.json`** - ROM hacks and modifications
- **`{system}-all.json`** - Complete list of all known ROMs
- **`{system}-commercial-sha1.txt`** - Simple SHA1 hash list for verification

## Using the CLI Tools

### Hash a ROM

```bash
dattools hash "MyRom.sfc"
```

Output:
```
=== MyRom.sfc ===
Name:     MyRom.sfc
Size:     2,097,152 bytes (file: 2,097,664, header: 512)
CRC32:    a1b2c3d4
MD5:      e5f6a7b8c9d0e1f2a3b4c5d6e7f80910
SHA1:     1234567890abcdef1234567890abcdef12345678
SHA256:   abcdef1234567890abcdef1234567890abcdef1234567890abcdef1234567890

SNES Checksum Info:
Internal Name: SUPER GAME
Map Mode:      HiROM
Header Offset: 0x00FFC0
Stored:        0x1234 (complement: 0xEDCB)
Calculated:    0x1234
Valid:         True
```

### Verify ROMs Against Whitelist

```bash
dattools verify "MyRom.sfc" --whitelist whitelists/snes/snes-commercial.json
```

### Parse DAT Files

```bash
dattools parse sources/nointro/*.dat --stats
```

### Merge DATs into Whitelists

```bash
dattools merge sources/nointro/snes.dat sources/tosec/snes.dat sources/opengood/snes.dat --output whitelists/snes --system SNES
```

### Scan ROM Directory

```bash
dattools scan "C:\ROMs\SNES" --whitelist whitelists/snes/snes-all.json
```

## Downloading DAT Files

### NoIntro

1. Visit [datomatic.no-intro.org](https://datomatic.no-intro.org/)
2. Register an account
3. Download DATs for desired systems
4. Place in `sources/nointro/`

### TOSEC

1. Visit [tosecdev.org/downloads](https://www.tosecdev.org/downloads)
2. Download the main TOSEC pack
3. Extract relevant system DATs to `sources/tosec/`

### OpenGood

```bash
git clone https://github.com/SnowflakePowered/opengood
cp opengood/dats/*.dat sources/opengood/
```

## Hash Algorithm Notes

### Standard Hashes

- **CRC32** - Fast but weak; used historically by GoodTools
- **MD5** - Widely supported but cryptographically broken
- **SHA1** - NoIntro's primary identifier; strong enough for ROM verification
- **SHA256** - Most secure; used for additional verification

### SNES Internal Checksum

SNES ROMs contain an internal checksum in the header:

- Located at offset `$7FDC-$7FDF` (LoROM) or `$FFDC-$FFDF` (HiROM)
- Two 16-bit values: checksum complement and checksum
- `complement XOR checksum` should equal `0xFFFF`
- Calculated by summing all ROM bytes modulo 65536

The CLI tool automatically detects and validates this checksum.

### Copier Headers

SNES ROMs often have 512-byte "copier headers" from devices like Super Magicom or Super Wild Card. These are **not** part of the actual ROM and should be stripped before hashing for database matching.

The tools automatically detect and handle copier headers.

## File Formats

### JSON Whitelist

```json
{
  "name": "SNES Commercial ROMs",
  "system": "SNES",
  "generatedDate": "2025-01-15",
  "entries": [
    {
      "name": "Super Mario World (USA).sfc",
      "gameName": "Super Mario World",
      "size": 524288,
      "crc32": "b19ed489",
      "md5": "cdd3c8c37322978ca8669b34bc89c804",
      "sha1": "6b47bb75d16514b6a476aa0c73a683f60cc6bef5",
      "category": "commercial",
      "region": "USA",
      "verified": true,
      "sourceCount": 3
    }
  ]
}
```

### Hash List (SHA1)

```
# SNES Commercial ROMs - SNES
# Generated: 2025-01-15
# Hash type: Sha1
# Entries: 1234

6b47bb75d16514b6a476aa0c73a683f60cc6bef5  Super Mario World (USA).sfc
...
```

### Logiqx XML DAT

The generated `.dat` files use standard Logiqx XML format compatible with ROM managers like clrmamepro, RomVault, and others.
