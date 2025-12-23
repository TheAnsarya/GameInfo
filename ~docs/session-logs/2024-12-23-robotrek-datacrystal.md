# Session Log - 2024-12-23 - Robotrek Data Crystal Integration

## Session Overview

Continued Robotrek documentation work, integrating information from Data Crystal wiki (https://datacrystal.tcrf.net/wiki/Robotrek).

## Work Completed

### 1. Data Crystal Integration

Fetched and integrated comprehensive ROM/RAM map data from Data Crystal:
- ROM map with all data regions, music tracks, graphics locations
- SRAM save file structure (verified)
- Key technical details (Quintet LZSS compression)

### 2. Wiki Updates

**ROM_Map.wikitext:**
- Complete rewrite with Data Crystal information
- Added 23+ music track locations with names
- Documented sound sample regions ($90000-$DFFFF)
- Added compressed graphics locations
- Documented unused ROM space for potential expansion
- Added interrupt vector table with targets

**RAM_Map.wikitext:**
- Added verified SRAM structure from Data Crystal
- 3 save slots + 3 backup slots (1280 bytes each)
- Complete save slot field layout:
  - Inventory (72 slots × 2 bytes)
  - Player/Robot names
  - Robot stats (HP, Power, Guard, Speed, Charge)
  - Gold and Program Points
  - Checksum field

**Main.wikitext:**
- Added Ancient as co-developer
- Added technical notes about Quintet LZSS compression
- Added Data Crystal external link

### 3. Disassembly Documentation

Updated disasm/README.md with:
- Data Crystal references
- Music track location table
- SRAM structure quick reference
- Updated next steps

### 4. LZSS Decompressor Tool

Created `tools/robotrek/quintet_lzss.py`:
- Decompresses Quintet's standard LZSS compression
- Two variants for different Quintet games
- Scanning mode to find compressed blocks
- Hex dump preview output
- Tested successfully:
  - $410A2: 8192 bytes graphics
  - $82000: 8192 bytes graphics

## Commits

1. `4143fe4` - docs(robotrek): Integrate Data Crystal ROM/RAM map information
2. `9945d07` - feat(robotrek): Add Quintet LZSS decompressor

## Key Technical Findings

### From Data Crystal

1. **Compression:** Quintet's standard LZSS (shared with Soul Blazer series)
2. **Map format:** Similar to other Quintet games
3. **Font:** Uncompressed 2BPP GameBoy format at $80000
4. **Developer:** Quintet + Ancient (co-development)

### Music Track Locations

| Offset | Track |
|--------|-------|
| $0296B | Robots vs. Hackers |
| $02EEB | Count Prinky's Mansion |
| $039A9 | Super Robot Battle! |
| $EFAD5 | Gateau ~ Master of Time |
| $14848E | Staff Roll |
| $14F2EE | Beyond the Stars! |

### Save Structure

- 8 KB SRAM total
- 3 main slots + 3 backup slots
- 1280 bytes per slot
- Includes checksum validation

## What's Next

1. **Graphics extraction** - Use LZSS decompressor to extract:
   - Character sprites
   - Enemy graphics
   - Tilesets

2. **Locate item stats** - Find tables for:
   - Weapon power/guard values
   - Item effects
   - Prices

3. **Research battle formulas** - Document:
   - Damage calculation
   - Hit/miss rates
   - Critical hit mechanics

4. **Invention recipes** - Map the crafting system:
   - Recipe data structure
   - Material requirements
   - Success conditions

## Session 2 - GameFAQs Integration

### Work Completed

#### 1. Hex Case Standardization

Fixed all uppercase hexadecimal values to lowercase per project conventions:
- `tools/robotrek/extract_data.py` - Format specifiers (06X → 06x)
- `tools/robotrek/extract_graphics.py` - Format specifiers
- `tools/robotrek/quintet_lzss.py` - Print statements
- `Games/SNES/Robotrek (SNES)/disasm/README.md`
- `Games/SNES/Robotrek (SNES)/BUILD.md`
- All Wiki/SNES/Robotrek/*.wikitext files

#### 2. GameFAQs Data Integration

Fetched comprehensive game data from GameFAQs guides:
- DSLevantine's Guide and Walkthrough (2024)
- saintly's Weapons Guide (2003)

#### 3. New Documentation Created

**Wiki/SNES/Robotrek/Weapons.wikitext** (new file):
- Complete damage tables for all 17 weapon types by level (1-9)
- Base ATK and scaling for Swords, Axes, Hammers, Punches, Shots, Lasers, Blades, Celtis, Blows, Bombs
- Shield and Boots defense stats
- Pack equipment stats
- All weapon combination recipes
- Inventor's Friend locations and level requirements (Level 1-80)
- Item combination recipes (Smoke, Cure, Clean, Repair, Big Bomb)

#### 4. Updated Documentation

**Wiki/SNES/Robotrek/Items.wikitext**:
- Added key item descriptions from game
- Added consumable item costs
- Added scrap material notes
- Added cross-references to Weapons page

**Wiki/SNES/Robotrek/Enemies.wikitext**:
- Added enemy drop tables (45+ entries)
- Added "message" difficulty factor
- Added drop items and gold rewards

**Wiki/SNES/Robotrek/RAM_Map.wikitext**:
- Added verified Pro Action Replay addresses:
  - $7e0b14 - Hero Level
  - $7e0690 - Robot 1 Energy
  - $7e0696 - Robot 1 Power
  - $7e069c - Robot 1 Guard
  - $7e07b0-bf - Inventor's Friend flags

**Wiki/SNES/Robotrek/Main.wikitext**:
- Updated subpages to include Weapons
- Updated item/enemy counts

### Session 2 Commits

| Hash | Message |
|------|---------|
| 327073f | style: standardize hex values to lowercase across Robotrek project |
| ddb1dcd | docs: add comprehensive weapon/item stats from GameFAQs reference |

## Files Modified

- `Wiki/SNES/Robotrek/ROM_Map.wikitext`
- `Wiki/SNES/Robotrek/RAM_Map.wikitext`
- `Wiki/SNES/Robotrek/Main.wikitext`
- `Wiki/SNES/Robotrek/Items.wikitext`
- `Wiki/SNES/Robotrek/Enemies.wikitext`
- `Games/SNES/Robotrek (SNES)/disasm/README.md`
- `Games/SNES/Robotrek (SNES)/BUILD.md`
- `tools/robotrek/extract_data.py`
- `tools/robotrek/extract_graphics.py`
- `tools/robotrek/quintet_lzss.py`

## Files Created

- `tools/robotrek/quintet_lzss.py`
- `tools/robotrek/extract_graphics.py`
- `tools/robotrek/extract_data.py`
- `Wiki/SNES/Robotrek/Weapons.wikitext`
- `Games/SNES/Robotrek (SNES)/extracted/font_80000.png`
- `Games/SNES/Robotrek (SNES)/extracted/font_81000.png`
- `Games/SNES/Robotrek (SNES)/extracted/inventory_d9310.png`
- `Games/SNES/Robotrek (SNES)/extracted/enemies.json`
- `Games/SNES/Robotrek (SNES)/extracted/items.json`

## All Commits This Session

| Hash | Message |
|------|---------|
| 4143fe4 | docs(robotrek): Integrate Data Crystal ROM/RAM map |
| 9945d07 | feat(robotrek): Add Quintet LZSS decompressor |
| a952223 | feat(robotrek): Add graphics extractor and assets |
| 66a934f | feat(robotrek): Add data extractor with enemies/items |
| 327073f | style: standardize hex values to lowercase |
| ddb1dcd | docs: add comprehensive weapon/item stats from GameFAQs |

## Session 3 - ROM Research Continuation

### Work Completed

#### 1. Item Name Pointer Table Discovery

Located the item name pointer table at **$01F748**:
- 83 16-bit little-endian pointers
- Points to null-terminated strings at $01F8A9+
- Items indexed 0-82 (indices 0-4 and 55-76 are unused/placeholders)

**Item Categories by Index:**
- 5-8: Swords (1-4)
- 9-11: Axes (1-3)
- 12-15: Blades (1-4)
- 16-18: Hammers (1-3)
- 19-21: Celtis (1-3)
- 22-24: Punches (1-3)
- 25-27: Blows (1-3)
- 28-30: Shots (1-3)
- 31-33: Lasers (1-3)
- 34-37: Bombs (1-4)
- 38-42: Shields (1-5)
- 43-48: Packs
- 49-54: Boots (1-6)
- 77-82: Key Items (Trans, Horn, Drill, etc.)

#### 2. PAR Address Verification

Confirmed PAR addresses by finding references in ROM code:
- `$0b14` (Hero Level): 63 occurrences
- `$0690` (Robot Energy): 58 occurrences
- `$0696` (Robot Power): 16 occurrences
- `$069c` (Robot Guard): 37 occurrences
- `$07b0` (Inventor Flags): 37 occurrences

These addresses are heavily used throughout the codebase, confirming the GameFAQs PAR codes are valid.

#### 3. Actor/Enemy Data Pointer Table

Found pointer table at **$038000**:
- 128 16-bit pointers to actor/enemy data
- 22-byte entry size (consistent increment of 22)
- Data records at $0381A4+
- Likely contains enemy stats, behavior, graphics pointers

#### 4. Combination Recipe Table

Located recipe table at **$01C2C6**:
- Complex format with special markers ($68-$71, $74-$79)
- $FF as section separator
- Confirmed pattern: `05 05 06 06 07` = Sword 1+1=2, Sword 2+2=3

Recipe encoding:
- Same item pairs: next byte is result (or implied +1)
- Cross-combinations: explicit result byte
- Markers separate weapon categories

#### 5. Updated ROM Map

Added new verified entries to ROM_Map.wikitext:
- Item name pointer table ($01F748)
- Actor/Enemy data table ($038000)
- Detailed item index breakdown

#### 6. JSON Export Created

Created `extracted/item_names.json`:
- Complete item list with ROM addresses
- Pointer addresses for each item
- 83 total items

### Files Modified

- `Wiki/SNES/Robotrek/ROM_Map.wikitext` - Added item pointer table, actor data table
- `Games/SNES/Robotrek (SNES)/extracted/item_names.json` - New file

### Session 3 Commits

| Hash | Message |
|------|---------|
| TBD | docs: add item pointer table and actor data research |

## What's Next

1. **Decode full recipe table** - Complete parsing of combination recipes
2. **Map actor/enemy data structure** - Decode the 22-byte entry format
3. **Find level-up stat formulas** - Weapon damage scaling per level
4. **Extract enemy HP/EXP/Gold** - From actor data table
5. **Create comprehensive extraction tool** - All game data to JSON
