# Dragon Warrior IV (NES) - Map Editor Manual Testing

## Overview

This document provides manual testing procedures for the DW4 NES map editor functionality. DW4 uses a chapter-based map system with 73 total maps spread across 5 chapters plus shared locations.

## Map System Architecture

### Map Structure
- **73 total maps** (Map IDs 0x00 - 0x48)
- **Chapter-based organization** with shared locations
- **Submaps** - Each location can have multiple submaps (floors, rooms)
- **Tileset system** - 6 tilesets (castle, town, dungeon, tower, cave, overworld)

### ROM Layout
| Component | Bank | Address | Description |
|-----------|------|---------|-------------|
| Map Pointers | $17 | $B08D | 73 entries × 2 bytes |
| Map Info | $17 | $B121 | 3 bytes per submap (tileset + address) |
| Map Data | $09+ | Varies | Compressed tile data |
| Tileset Graphics | $08 | $8000+ | 2bpp tile graphics |

## Test Cases

### TC-001: Load Map Data
**Objective:** Verify map loading from ROM

**Steps:**
1. Open DW4 ROM in editor (`Dragon Warrior IV (1992-10)(Enix)(US).nes`)
2. Navigate to Map Editor
3. Select Chapter 1 → Burland Castle (Map 0x02)
4. Verify map loads without errors

**Expected Results:**
- Map displays correct dimensions
- Tileset applied correctly
- No tile artifacts or corruption

**Test Data:**
```
Map: Burland Castle (0x02)
Bank: 0x09
Submaps: 4 (Main floor, Throne room, Basement, Tower)
Tileset: Castle (0x01)
```

### TC-002: Edit Map Tiles
**Objective:** Verify tile editing functionality

**Steps:**
1. Load Burland Castle main floor
2. Select a floor tile (tile index ~0x20)
3. Place tile at coordinates (5, 5)
4. Save map data
5. Reload map and verify change persisted

**Expected Results:**
- Tile placement visual feedback
- Save operation completes
- Tile persists after reload

### TC-003: Chapter Map Switching
**Objective:** Verify chapter-specific map loading

**Steps:**
1. Load Chapter 1 maps (Ragnar)
   - Burland (0x02), Izmit (0x0E), Strathbaile (0x0F)
2. Switch to Chapter 2 maps (Alena)
   - Santeem (0x01), Tempe (0x0E), Frenor (0x14)
3. Verify each map loads correctly
4. Verify chapter-specific features (available submaps)

**Chapter Map Reference:**

| Chapter | Maps | Key Locations |
|---------|------|---------------|
| 1 (Ragnar) | 5 | Burland, Izmit, Strathbaile, Loch Tower |
| 2 (Alena) | 10 | Santeem, Tempe, Frenor, Birdsong Tower |
| 3 (Taloon) | 9 | Lakanaba, Fox Village, Endor |
| 4 (Sisters) | 12 | Monbaraba, Haville, Kievs |
| 5 (Hero) | 16+ | All locations + Zenithia |

### TC-004: Tileset Rendering
**Objective:** Verify tileset display

**Steps:**
1. Load a castle map (Burland - 0x02)
2. View tileset panel - should show castle tiles
3. Load a town map (Endor - 0x04)
4. Verify tileset switches to town tileset
5. Load dungeon (Dire Palace - 0x03)
6. Verify dungeon tileset displayed

**Tileset IDs:**
- 0x01: Castle interior
- 0x02: Town/village
- 0x03: Dungeon
- 0x04: Tower
- 0x05: Cave/underground
- 0x00: Overworld

### TC-005: Warp/Exit Editing
**Objective:** Test warp point editing

**Steps:**
1. Load Burland Castle (0x02)
2. Find stairway tile leading to basement
3. View warp data (destination map, coordinates)
4. Modify destination coordinates (+2, +2)
5. Export and test in emulator

**Warp Data Structure (4 bytes):**
```
Byte 0: Destination Map ID
Byte 1: Destination X coordinate
Byte 2: Destination Y coordinate
Byte 3: Flags (door type, direction)
```

### TC-006: NPC Placement
**Objective:** Verify NPC editing

**Steps:**
1. Load Burland Castle
2. View NPC list (should show ~12 NPCs)
3. Select a guard NPC
4. Move NPC position from (10,5) to (12,5)
5. Save and verify in emulator

**NPC Data Structure (8 bytes):**
```
Byte 0-1: NPC ID
Byte 2: X position
Byte 3: Y position
Byte 4: Facing direction
Byte 5: Movement pattern
Byte 6-7: Dialog pointer
```

### TC-007: Treasure Chest Editing
**Objective:** Test treasure chest data

**Steps:**
1. Load Strathbaile (0x0F)
2. Locate treasure chest tiles
3. View chest contents (should show item IDs)
4. Change chest contents from "Medical Herb" to "Leather Shield"
5. Verify item ID mapping correct

**Chapter 1 Treasures:**
| Location | Item | Item ID |
|----------|------|---------|
| Burland B1 | Medical Herb | 0x00 |
| Burland B1 | 120 Gold | 0xFF + 0x78 |
| Loch Tower | Iron Spear | 0x0A |

### TC-008: Encounter Zone Editing
**Objective:** Test random encounter zones

**Steps:**
1. Load Chapter 1 Overworld (0x00)
2. View encounter zones overlay
3. Verify zone boundaries match game
4. Modify encounter table for zone 1
5. Test encounter rates in emulator

**Encounter Zone Structure:**
```
Zone Definition: Rectangle (x1, y1, x2, y2)
Encounter Table: 8 monster group IDs per zone
Encounter Rate: 1/8, 1/16, 1/32 steps
```

## Regression Tests

### RT-001: Round-Trip Export/Import
1. Load original ROM
2. Export all Chapter 1 maps to JSON
3. Clear map data
4. Import JSON back
5. Binary compare exported maps with original ROM sections

### RT-002: Cross-Chapter Locations
1. Load Endor (0x04) - appears in Chapters 2, 3, 5
2. Verify all 15 submaps accessible
3. Edit Casino submap
4. Verify change visible in all chapters

### RT-003: Memory Limits
1. Load largest map (Zenithia - ~128x64 tiles)
2. Perform 100 tile edits
3. Verify no memory leaks
4. Check undo/redo stack

## Known Issues

1. **Submap addressing** - Some maps share tile data across submaps; editing one may affect others
2. **Tileset palette** - Day/night palettes not fully supported
3. **Compression** - Map data uses simple RLE; avoid exceeding original compressed size

## Test Environment

### Required Files
- `Dragon Warrior IV (1992-10)(Enix)(US).nes` (CRC32: 0x23AD0D2D)
- Clean backup ROM for comparison
- Emulator: FCEUX (for debugging), Mesen (for accuracy)

### Test Harness
```csharp
// Load DW4 ROM and test map
using DW4Lib.DataStructures.Maps;
using DW4Lib.ROM;

var rom = RomLoader.Load("dw4.nes");
var maps = MapDatabase.Maps;

// Verify map count
Assert.AreEqual(73, maps.Length);

// Load specific map
var burland = MapInfo.Parse(rom.Data, 0x1B121, 0x02, 0, 0x09);
Assert.AreEqual(0x01, burland.TilesetNumber); // Castle tileset
```

## Sign-Off

| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-001 | | | ☐ |
| TC-002 | | | ☐ |
| TC-003 | | | ☐ |
| TC-004 | | | ☐ |
| TC-005 | | | ☐ |
| TC-006 | | | ☐ |
| TC-007 | | | ☐ |
| TC-008 | | | ☐ |
| RT-001 | | | ☐ |
| RT-002 | | | ☐ |
| RT-003 | | | ☐ |
