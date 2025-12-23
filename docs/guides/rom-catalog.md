# ROM Catalog System

The ROM Catalog system provides a way to reference and work with ROM files even though the actual ROM files are not in source control (due to copyright concerns).

## Overview

Since ROM files are excluded from Git via `.gitignore`, scripts and tools cannot rely on their presence in the repository. Instead, we maintain a JSON catalog file (`data/rom_catalog.json`) that contains:

- File metadata (name, size, path)
- Multiple hash algorithms for identification
- Platform-specific information (SNES headers, etc.)
- Filename-parsed metadata (region, version, dump flags)

Users must manually obtain and copy ROM files to the `~roms/` folder to use the tools that require actual ROM data.

## Catalog Structure

### Top-Level Fields

```json
{
	"generated": "2025-12-23T04:32:09.051617",
	"generator": "rom_catalog_generator.py",
	"version": "1.0.0",
	"root_path": "~roms",
	"total_files": 111,
	"total_size": 189530112,
	"platforms": {"SNES": 111},
	"folders": { ... },
	"files": [ ... ]
}
```

| Field | Description |
|-------|-------------|
| `generated` | ISO 8601 timestamp when the catalog was created |
| `generator` | Script that generated the catalog |
| `version` | Catalog format version |
| `root_path` | Root folder that was scanned |
| `total_files` | Number of ROM files cataloged |
| `total_size` | Total size of all files in bytes |
| `platforms` | Count of files per platform |
| `folders` | Nested folder structure with file summaries |
| `files` | Flat list of all files with full metadata |

### File Entry Structure

Each file entry in the `files` array contains:

```json
{
	"filename": "Soul Blazer (U) [!].sfc",
	"relative_path": "SNES/GoodSNES/Soul Blazer (U) [!].sfc",
	"size": 1048576,
	"extension": ".sfc",
	"crc32": "31b965db",
	"md5": "83cf41d53a1b94aeea1a645037a24004",
	"sha1": "f2832eb02547c39cae3bdaab5c2a53e4f8b31810",
	"sha256": "8438da09de8ce9aded3bb08644543f7b60fb60cffc68ce2d67d6a0643f2ecfc2",
	"sha512": "0783c8f1b4029e70c5426f350c0af5d2a9fbf86139cb64f4680bf681e2aabd9fdfc213384f0477ad2cceb34c69fc9ab65065564bb9549b48530ea9917e425191",
	"blake2b": "a59eab337aeec606f57d5297871ab658bb5b898c5af5f423ad3dac59aca04369a8012f633e65a6fd59c2576f1e314468086299fdb09741b59268616abe6e76a5",
	"blake3": "",
	"description": "Soul Blazer",
	"platform": "SNES",
	"region": "USA",
	"revision": "",
	"is_verified": true,
	"is_bad_dump": false,
	"is_overdump": false,
	"is_underdump": false,
	"is_hack": false,
	"is_translation": false,
	"is_unlicensed": false,
	"is_prototype": false,
	"is_beta": false,
	"snes_header": { ... }
}
```

### Hash Algorithms

The catalog includes multiple hash algorithms for maximum compatibility with various ROM databases and verification tools:

| Algorithm | Length | Use Case |
|-----------|--------|----------|
| `crc32` | 8 chars | Quick identification, No-Intro, GoodTools |
| `md5` | 32 chars | Legacy databases, MAME |
| `sha1` | 40 chars | No-Intro, Redump |
| `sha256` | 64 chars | Modern verification |
| `sha512` | 128 chars | Cryptographic verification |
| `blake2b` | 128 chars | Modern, fast hashing |
| `blake3` | 64 chars | Latest generation (optional) |

Note: `blake3` requires the optional `blake3` Python package. If not installed, this field will be empty.

### SNES Header Information

For SNES ROMs, additional header information is parsed:

```json
{
	"snes_header": {
		"title": "SOULBLAZER - 1 USA",
		"mapper": "LoROM",
		"rom_type": "ROM+RAM+Battery",
		"rom_size": 1048576,
		"sram_size": 8192,
		"country": "USA",
		"license": "0xB4",
		"version": 0,
		"checksum": 24665,
		"complement": 40870,
		"header_offset": 32704,
		"is_valid": true
	}
}
```

| Field | Description |
|-------|-------------|
| `title` | Internal ROM title (21 bytes, ASCII) |
| `mapper` | Memory map type (LoROM, HiROM, ExLoROM, ExHiROM) |
| `rom_type` | ROM features (ROM, RAM, Battery, etc.) |
| `rom_size` | ROM size in bytes |
| `sram_size` | Save RAM size in bytes |
| `country` | Target region/country |
| `license` | Licensee code |
| `version` | ROM version number |
| `checksum` | Internal checksum |
| `complement` | Checksum complement |
| `header_offset` | Offset where header was found ($7FC0 or $FFC0) |
| `is_valid` | Whether checksum + complement = $FFFF |

### Filename Parsing (GoodTools Format)

The catalog parser understands GoodTools naming conventions:

| Flag | Meaning |
|------|---------|
| `[!]` | Verified good dump |
| `[b]` | Bad dump |
| `[o]` | Overdump |
| `[a]` | Alternate dump |
| `[h]` | Hack |
| `[T]` | Translation |
| `(Unl)` | Unlicensed |
| `(Prototype)` | Prototype version |
| `(Beta)` | Beta version |
| `(U)` | USA region |
| `(E)` | Europe region |
| `(J)` | Japan region |
| `(F)` | France region |
| `(G)` | Germany region |
| `(V1.0)`, `(V1.1)` | Version numbers |

## Usage

### Generating the Catalog

Run the generator script to create or update the catalog:

```powershell
python tools/rom_catalog_generator.py --root "~roms" --output "data/rom_catalog.json"
```

### Looking Up ROMs

Use the `--lookup` option to search for ROMs by name or hash:

```powershell
# Search by name
python tools/rom_catalog_generator.py --catalog "data/rom_catalog.json" --lookup "Soul Blazer"

# Search by CRC32
python tools/rom_catalog_generator.py --catalog "data/rom_catalog.json" --lookup "31b965db"

# Search by SHA1
python tools/rom_catalog_generator.py --catalog "data/rom_catalog.json" --lookup "f2832eb02547c39cae3bdaab5c2a53e4f8b31810"
```

### Using in Scripts

```python
import json

# Load catalog
with open("data/rom_catalog.json", "r") as f:
	catalog = json.load(f)

# Find a ROM by CRC32
def find_rom_by_crc(catalog, crc32):
	for rom in catalog["files"]:
		if rom["crc32"] == crc32.lower():
			return rom
	return None

# Find Soul Blazer (U)
soul_blazer = find_rom_by_crc(catalog, "31b965db")
if soul_blazer:
	rom_path = f"~roms/{soul_blazer['relative_path']}"
	print(f"Found: {rom_path}")
```

### Using the ROM Lookup Helper Module

For more advanced usage, see the `tools/rom_catalog_helper.py` module:

```python
from tools.rom_catalog_helper import RomCatalogHelper

helper = RomCatalogHelper("data/rom_catalog.json")

# Find by various criteria
rom = helper.find_by_crc32("31b965db")
rom = helper.find_by_sha1("f2832eb02547c39cae3bdaab5c2a53e4f8b31810")
rom = helper.find_by_name("Soul Blazer", region="USA")

# Get the actual file path
if rom:
	path = helper.get_rom_path(rom)
	if path.exists():
		# ROM file is present, can process it
		data = path.read_bytes()
```

## File Organization

### Expected ROM Folder Structure

```
~roms/
├── SNES/
│   └── GoodSNES/
│       ├── Chrono Trigger (U) [!].sfc
│       ├── Dragon Quest I & II (J) [!].sfc
│       ├── Final Fantasy - Mystic Quest (U) (V1.0) [!].sfc
│       ├── Soul Blazer (U) [!].sfc
│       └── ...
├── NES/
│   └── GoodNES/
│       └── ...
├── GBA/
│   └── ...
└── ...
```

### File Extensions

| Extension | Platform |
|-----------|----------|
| `.sfc` | SNES (Super Famicom) |
| `.smc` | SNES (with copier header) |
| `.nes` | NES |
| `.gb` | Game Boy |
| `.gbc` | Game Boy Color |
| `.gba` | Game Boy Advance |
| `.gen`, `.md` | Sega Genesis / Mega Drive |
| `.sms` | Sega Master System |
| `.gg` | Sega Game Gear |

## Updating the Catalog

Whenever ROMs are added, removed, or modified in the `~roms/` folder:

1. Run the catalog generator:
   ```powershell
   python tools/rom_catalog_generator.py --root "~roms" --output "data/rom_catalog.json"
   ```

2. Commit the updated catalog:
   ```powershell
   git add data/rom_catalog.json
   git commit -m "docs: update ROM catalog"
   ```

Note: The catalog file IS tracked in Git, only the actual ROM files are ignored.

## Known ROMs Reference

The following ROMs are documented in the catalog (see `data/rom_catalog.json` for complete list):

### Soul Blazer (Main Focus)

| Region | CRC32 | SHA1 |
|--------|-------|------|
| USA | `31b965db` | `f2832eb02547c39cae3bdaab5c2a53e4f8b31810` |
| Europe | `54370191` | `862b017e9ee68e5f19e464f7666adaba4e1b9f99` |
| France | `20157693` | `7498fb48bc977a85a73610c3185af3e5998c09b5` |
| Germany | `fe28d2c1` | `3278e5d375a0e206f711c89cd92a9b80dfbbd95e` |
| Japan (Soul Blader) | `1f03c7e0` | `8ae0bc80c8fa2d03e1ef53e8e4ad9d00af3c40dc` |

### Final Fantasy Mystic Quest

| Region | Version | CRC32 | SHA1 |
|--------|---------|-------|------|
| USA | V1.0 | `6b19a2c6` | (verified [!]) |
| USA | V1.1 | `2c52c792` | (unverified) |
| Japan | - | `1da17f0c` | (verified [!]) |
| Europe (Mystic Quest Legend) | - | (see catalog) | (verified [!]) |

### Dragon Quest Series

| Game | Region | CRC32 |
|------|--------|-------|
| Dragon Quest I & II | Japan | `98bb6853` |
| Dragon Quest III | Japan | `13836bd2` |
| Dragon Quest V | Japan | `bc955f3b` |
| Dragon Quest VI | Japan | `33304519` |

See `data/rom_catalog.json` for the complete list of 111 cataloged ROMs.
