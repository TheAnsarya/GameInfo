# The Legend of Zelda (NES) - Testing Documentation

## Overview

| Property | Value |
|----------|-------|
| **Platform** | NES |
| **ROM Size** | 128 KB (no header) |
| **Mapper** | MMC1 (1) |
| **PRG ROM** | 128 KB (8 × 16KB banks) |
| **CHR ROM** | 0 KB (uses CHR RAM) |
| **Extractor** | `ZeldaNesExtractor` |

## Asset Extraction Coverage

| Asset Type | Status | Location | Notes |
|------------|--------|----------|-------|
| Graphics (2bpp) | ✅ Implemented | Bank 1 ($4000-$7FFF) | 512 tiles, 8KB |
| Palettes | ✅ Implemented | $1390-$139F | 16 colors (4 palettes × 4) |
| Overworld Map | ✅ Implemented | Bank 3 | 16×8 screens (128 screens) |
| Dungeon Maps | ✅ Implemented | Bank 5 | 9 dungeons, ~256 rooms total |
| Enemy Data | ✅ Implemented | Bank 6 | 50 enemies, 16-byte records |
| Item Data | ✅ Implemented | Various | 28 items |

## Manual Testing Procedures

### Test Environment Setup

1. **ROM Requirements**
   - File: `Legend of Zelda, The (U) (PRG0).nes`
   - CRC32: `A12D74C1` (PRG0) or `D7AE93DF` (PRG1)
   - Either PRG0 or PRG1 revision works

2. **Emulator Setup**
   - Mesen recommended for debugging
   - Enable CHR RAM viewer to verify graphics loading

### Test Cases

#### TC-ZNE-001: Graphics Extraction
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Create new project with Zelda ROM | Project wizard completes |
| 2 | Run extraction | Graphics asset appears in tree |
| 3 | Open graphics asset | 2bpp tile viewer displays 512 tiles |
| 4 | Verify tile content | Link sprite, enemies, items visible |

#### TC-ZNE-002: Palette Extraction
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open palette asset from tree | Palette editor loads |
| 2 | Verify 4 palettes | Each palette shows 4 colors |
| 3 | Check color values | Greens, browns, grays for overworld |

#### TC-ZNE-003: Overworld Map Extraction
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open overworld map asset | Map viewer loads 16×8 grid |
| 2 | Navigate to screen 0,0 | Top-left corner of Hyrule |
| 3 | Verify screen tiles | Matches in-game appearance |
| 4 | Check all 128 screens exist | Grid fully populated |

#### TC-ZNE-004: Dungeon Map Extraction
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open dungeon maps asset | Dungeon selector appears |
| 2 | Select Level 1 | Eagle dungeon layout shown |
| 3 | Verify room count | ~8-12 rooms per dungeon |
| 4 | Check all 9 dungeons | Dungeons 1-9 all load |

#### TC-ZNE-005: Enemy Data Extraction
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open enemy data asset | Enemy list shows 50 entries |
| 2 | Select "Octorok" | Stats display HP, damage, etc. |
| 3 | Verify record size | 16 bytes per enemy |
| 4 | Check boss entries | Ganon and dungeon bosses present |

#### TC-ZNE-006: Item Data Extraction
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Open item data asset | Item list shows 28 entries |
| 2 | Select "Wooden Sword" | Item properties displayed |
| 3 | Verify all items | Sword, bow, bombs, etc. present |

#### TC-ZNE-007: Full Project Roundtrip
| Step | Action | Expected Result |
|------|--------|-----------------|
| 1 | Create project, extract all | All assets extracted |
| 2 | Close and reopen project | Project loads successfully |
| 3 | Verify all assets | All previously extracted assets visible |
| 4 | Modify one asset | Change saved to project |

### Regression Tests

#### RT-ZNE-001: ROM Compatibility
- PRG0 revision extracts correctly
- PRG1 revision extracts correctly
- Invalid ROM rejected with error

#### RT-ZNE-002: Edge Cases
- Very large dungeon rooms handled
- Missing/incomplete data handled gracefully
- Corrupted asset data doesn't crash

#### RT-ZNE-003: UI Responsiveness
- Large map scrolls smoothly
- Graphics tile selection responsive
- Asset tree updates without delay

## Known ROM Addresses

### Graphics
| Description | Address | Size |
|-------------|---------|------|
| CHR Pattern Table | Bank 1 $4000-$5FFF | 8 KB |
| Sprite Patterns | $0000-$0FFF (CHR RAM) | 4 KB |
| Background Patterns | $1000-$1FFF (CHR RAM) | 4 KB |

### Palettes
| Description | Address | Size |
|-------------|---------|------|
| BG Palettes | $1390-$139F | 16 bytes |
| Sprite Palettes | $13A0-$13AF | 16 bytes |

### Maps
| Description | Address | Notes |
|-------------|---------|-------|
| Overworld Columns | Bank 3 | Column-encoded |
| Overworld Metatiles | Bank 3 | 16×16 pixel tiles |
| Dungeon Rooms | Bank 5 | Per-dungeon data |

### Enemies
| Description | Address | Size |
|-------------|---------|------|
| Enemy Table | Bank 6 | 50 × 16 bytes |
| Enemy AI Scripts | Bank 6 | Variable length |

## Debugging Notes

### CHR RAM Loading
Zelda uses CHR RAM, not CHR ROM. Graphics are loaded from PRG ROM to CHR RAM during gameplay. The extractor pulls from PRG ROM Bank 1 where the graphics data is stored.

### Map Encoding
Overworld uses column-based compression. Each screen is stored as a series of column definitions rather than raw tile data, saving significant space.

### Dungeon Structure
Each dungeon has its own room layout table. Rooms reference shared tile/object definitions to reduce redundancy.

## Related Documentation

- [breakpoint-guides/zelda-nes-breakpoints.md](../../breakpoint-guides/zelda-nes-breakpoints.md) - Debugging breakpoints
- [extraction-workflows/zelda-nes-workflow.md](../../extraction-workflows/zelda-nes-workflow.md) - Full extraction process
