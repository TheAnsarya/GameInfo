# Data Tables Guide

This guide documents how to work with data tables in retro game ROMs.

## Overview

Data tables are structured arrays of data used by games to store information like:
- Character statistics
- Item properties
- Enemy data
- Equipment stats
- Spell effects
- Shop inventories

Understanding data table formats is essential for ROM hacking and documentation.

## Identifying Data Tables

### Common Patterns

Data tables often have recognizable patterns:

1. **Sequential IDs** - Values increment (0, 1, 2, 3...)
2. **Repeated structure** - Same byte pattern repeats
3. **Pointer tables** - Series of 2-byte addresses
4. **Aligned data** - Entries at regular intervals

### Using Hex Editor

```bash
# Search for potential table patterns
python tools/analysis/pattern_finder.py game.nes --pattern "00 01 02 03"

# Find repeated structures
python tools/analysis/structure_finder.py game.nes --interval 8 --min-entries 10
```

## Table Types

### Fixed-Length Tables

Each entry has the same size:

```
Entry 0: [byte0][byte1][byte2][byte3]  ; 4 bytes
Entry 1: [byte0][byte1][byte2][byte3]  ; 4 bytes
Entry 2: [byte0][byte1][byte2][byte3]  ; 4 bytes
...
```

**Advantages:**
- Easy to calculate offsets: `address = base + (index × entry_size)`
- Simple to parse and modify
- No pointer overhead

### Variable-Length Tables

Entries have different sizes, require pointers:

```
Pointer Table:
$8000: $8020  ; Entry 0 at $8020
$8002: $8028  ; Entry 1 at $8028
$8004: $8035  ; Entry 2 at $8035

Data:
$8020: [variable length data for entry 0]
$8028: [variable length data for entry 1]
$8035: [variable length data for entry 2]
```

**Advantages:**
- Space efficient for variable data
- Can share entries (same pointer)

### Packed Tables

Multiple values packed into single bytes:

```
Byte value: 0xA5 = 10100101 binary

Bits 7-6: Value A (10 = 2)
Bits 5-4: Value B (10 = 2)
Bits 3-2: Value C (01 = 1)
Bits 1-0: Value D (01 = 1)
```

**Example - NES Equipment Flags:**
```
Bit 0: Hero can equip
Bit 1: Warrior can equip
Bit 2: Mage can equip
Bit 3: Cleric can equip
Bit 4-7: Equipment slot
```

## Common Table Formats

### Character Stats Table

Typical RPG character data:

```
Offset  Size  Field
$00     1     Character ID
$01     1     Level
$02     2     Current HP (little-endian)
$04     2     Max HP
$06     1     Current MP
$07     1     Max MP
$08     1     Strength
$09     1     Agility
$0A     1     Intelligence
$0B     1     Vitality
$0C     1     Luck
$0D     1     Attack Power
$0E     1     Defense Power
$0F     1     Class/Job
$10-$13 4     Experience (32-bit)
$14-$17 4     Equipment slots
$18-$1F 8     Spell flags
```

### Item Table

```
Offset  Size  Field
$00     1     Item ID
$01     1     Item Type (weapon/armor/consumable)
$02     2     Price
$04     1     Effect/Power
$05     1     Element
$06     1     Equipment flags (who can use)
$07     1     Special flags
```

### Enemy Table

```
Offset  Size  Field
$00     1     Enemy ID
$01     2     HP
$03     1     Attack
$04     1     Defense
$05     1     Agility
$06     1     Magic Defense
$07     2     Experience reward
$09     2     Gold reward
$0B     1     Drop item ID
$0C     1     Drop rate
$0D-$0F 3     Element resistances
```

### Spell Table

```
Offset  Size  Field
$00     1     Spell ID
$01     1     MP Cost
$02     1     Effect Type
$03     1     Power
$04     1     Element
$05     1     Target Type
$06     1     Animation ID
$07     1     Sound effect
```

## Extraction Tools

### table_extractor.py

Extract and format data tables:

```bash
# Extract character stats
python tools/data/table_extractor.py game.nes \
    --offset 0x10000 \
    --entry-size 32 \
    --count 8 \
    --format json \
    --output characters.json

# With field definitions
python tools/data/table_extractor.py game.nes \
    --config character_table.json \
    --output characters.json
```

### Table Configuration Format

```json
{
  "name": "Character Stats",
  "offset": "0x10000",
  "entry_size": 32,
  "count": 8,
  "fields": [
    {"name": "id", "offset": 0, "size": 1, "type": "uint8"},
    {"name": "level", "offset": 1, "size": 1, "type": "uint8"},
    {"name": "hp", "offset": 2, "size": 2, "type": "uint16le"},
    {"name": "max_hp", "offset": 4, "size": 2, "type": "uint16le"},
    {"name": "str", "offset": 8, "size": 1, "type": "uint8"},
    {"name": "equipment", "offset": 20, "size": 4, "type": "array", 
     "element_size": 1, "element_type": "uint8"}
  ]
}
```

## JSON Output Formats

### Simple Format

```json
[
  {
    "id": 0,
    "name": "Hero",
    "hp": 100,
    "mp": 50,
    "attack": 15,
    "defense": 10
  },
  {
    "id": 1,
    "name": "Warrior",
    "hp": 150,
    "mp": 0,
    "attack": 20,
    "defense": 18
  }
]
```

### Annotated Format

```json
{
  "table_name": "Characters",
  "rom_offset": "0x10000",
  "entry_size": 32,
  "entries": [
    {
      "_index": 0,
      "_offset": "0x10000",
      "id": 0,
      "name": "Hero",
      "stats": {
        "hp": {"value": 100, "offset": "0x10002"},
        "mp": {"value": 50, "offset": "0x10006"}
      }
    }
  ]
}
```

## Modifying Tables

### json_to_bin.py

Convert JSON back to binary:

```bash
# Convert modified JSON to binary
python tools/data/json_to_bin.py characters.json --output characters.bin

# Insert into ROM
python tools/patch/inserter.py game.nes --data characters.bin --at 0x10000
```

### Direct Table Editing

```python
from tools.data.table_editor import TableEditor

# Load table
editor = TableEditor('game.nes', offset=0x10000, entry_size=32, count=8)

# Modify entry
editor.set_field(entry_index=0, field_offset=2, value=150, size=2)

# Save changes
editor.save()
```

## Pointer Table Management

### Finding Pointer Tables

```bash
# Find 16-bit pointer tables
python tools/analysis/pointer_finder.py game.nes --bank 0x8000 --min-entries 5

# Validate pointers
python tools/analysis/pointer_validator.py game.nes --table 0x8000 --count 20
```

### Pointer Table Format

**NES (16-bit CPU addresses):**
```
$8000: $00 $A0  ; Points to $A000
$8002: $50 $A0  ; Points to $A050
$8004: $A0 $A0  ; Points to $A0A0
```

**SNES (24-bit addresses):**
```
$018000: $00 $80 $01  ; Points to $018000
$018003: $00 $90 $01  ; Points to $019000
```

### Relocation Tools

```bash
# Relocate pointer table entries
python tools/data/pointer_relocator.py game.nes \
    --table 0x8000 \
    --old-base 0xA000 \
    --new-base 0xC000 \
    --count 20
```

## Analysis Tools

### table_analyzer.py

Analyze unknown table structures:

```bash
# Auto-detect table structure
python tools/analysis/table_analyzer.py game.nes \
    --offset 0x10000 \
    --length 256 \
    --output analysis.txt
```

Output example:
```
Potential table at $10000:
  Detected entry size: 8 bytes
  Estimated entries: 32
  
  Likely structure:
    Byte 0: Sequential ID (0-31)
    Byte 1: Values 1-99 (stat-like)
    Bytes 2-3: 16-bit values (HP?)
    Byte 4: Bitfield (equipment flags?)
    Bytes 5-7: Unknown
```

### table_comparer.py

Compare tables between ROM versions:

```bash
# Compare character stats between versions
python tools/analysis/table_comparer.py original.nes patched.nes \
    --table-offset 0x10000 \
    --entry-size 32 \
    --count 8 \
    --output diff.txt
```

## Best Practices

### Documentation

Always document discovered tables:

```markdown
## Character Stats Table

**Location:** $10000-$100FF (PRG Bank 2)
**Entry Size:** 32 bytes
**Entry Count:** 8 characters

| Offset | Size | Field | Notes |
|--------|------|-------|-------|
| $00 | 1 | ID | Character index |
| $01 | 1 | Level | 1-99 |
| $02 | 2 | HP | Little-endian |
...
```

### Backup Before Modifying

```bash
# Always backup original
cp game.nes game.nes.bak

# Use version control
git add game.nes
git commit -m "Original unmodified ROM"
```

### Validate Changes

```python
def validate_table(rom_path, offset, entry_size, count):
    """Validate table data is within expected ranges."""
    with open(rom_path, 'rb') as f:
        f.seek(offset)
        for i in range(count):
            entry = f.read(entry_size)
            # Add your validation logic
            assert entry[0] == i, f"Entry {i} has wrong ID"
            assert entry[1] <= 99, f"Level out of range"
```

## Common Issues

### Endianness

- NES/SNES use little-endian for 16-bit values
- Value $1234 stored as: $34 $12

### Bank Boundaries

- Tables may span multiple banks
- Pointers may need bank adjustment

### Alignment

- Some tables require alignment
- Entries may have padding

## See Also

- [Text Tools](text-tools.md) - Text table extraction
- [Analysis Tools](analysis-tools.md) - ROM analysis
- [Workflow Guide](workflow-guide.md) - Project workflows
