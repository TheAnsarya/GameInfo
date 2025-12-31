# DW4→DQ3r Technical Specifications

## Overview

This document provides detailed technical specifications for porting Dragon Warrior IV (NES) to the Dragon Quest III Remake (SNES) engine.

---

## 1. System Architecture Comparison

### NES (Dragon Warrior IV)

| Component | Specification |
|-----------|---------------|
| CPU | Ricoh 2A03 (6502-based), 1.79 MHz |
| RAM | 2 KB + 8 KB WRAM (battery-backed) |
| ROM | 512 KB PRG-ROM, 256 KB CHR-ROM |
| Mapper | MMC3 (iNES Mapper 4) |
| Graphics | 2bpp, 256 tiles per pattern table |
| Audio | 5 channels (2 pulse, 1 triangle, 1 noise, 1 DPCM) |

### SNES (Dragon Quest III Remake)

| Component | Specification |
|-----------|---------------|
| CPU | 65C816, 3.58 MHz (variable) |
| RAM | 128 KB WRAM |
| ROM | 4 MB (32 Mbit) |
| Graphics | 4bpp, Mode 1, multiple BG layers |
| Audio | SPC700, 8 channels, 64 KB audio RAM |
| Enhancement | SA-1 coprocessor (some versions) |

---

## 2. Memory Layout

### DW4 NES Memory Map

```
$0000-$07FF: Internal RAM (2 KB)
$6000-$7FFF: WRAM/SRAM (8 KB, battery-backed)
$8000-$9FFF: PRG-ROM Bank (switchable)
$A000-$BFFF: PRG-ROM Bank (switchable)
$C000-$DFFF: PRG-ROM Bank (switchable)
$E000-$FFFF: PRG-ROM Bank (fixed)
```

### DQ3r SNES Memory Map

```
$00:0000-$00:1FFF: LowRAM (8 KB mirror)
$7E:0000-$7E:FFFF: WRAM Bank 1 (64 KB)
$7F:0000-$7F:FFFF: WRAM Bank 2 (64 KB)
$00-$3F:8000-$FFFF: ROM Banks
$80-$BF:8000-$FFFF: ROM Banks (mirror)
```

---

## 3. Data Structure Specifications

### 3.1 Character Data

#### DW4 NES Character Structure (32 bytes)

```
Offset  Size  Field
------  ----  -----
$00     8     Name (8 chars)
$08     1     Level
$09     1     Class/Character ID
$0A     2     Current HP
$0C     2     Max HP
$0E     2     Current MP
$10     2     Max MP
$12     1     Strength
$13     1     Agility
$14     1     Vitality
$16     1     Intelligence
$17     1     Luck
$18     2     Experience (low word)
$1A     2     Experience (high word)
$1C     4     Equipment slots (weapon/armor/shield/helmet)
```

#### DQ3r SNES Character Structure (64 bytes)

```
Offset  Size  Field
------  ----  -----
$00     12    Name (12 chars, SJIS)
$0C     1     Class ID
$0D     1     Level
$0E     2     Current HP
$10     2     Max HP
$12     2     Current MP
$14     2     Max MP
$16     2     Strength
$18     2     Agility
$1A     2     Vitality
$1C     2     Intelligence
$1E     2     Luck
$20     4     Experience
$24     6     Equipment (6 slots)
$2A     1     Status flags
$2B     1     Personality
$2C     20    Reserved/spells learned
```

### 3.2 Monster Encounter Data

#### DW4 NES Encounter Structure

```
Offset  Size  Field
------  ----  -----
$00     1     Monster Group ID
$01     1     Min Count
$02     1     Max Count
$03     1     Encounter Rate
```

#### DQ3r SNES Encounter Structure

```
Offset  Size  Field
------  ----  -----
$00     2     Monster Group ID
$02     1     Formation Type
$03     1     Encounter Rate
$04     2     Terrain Modifier
```

---

## 4. Chapter System Implementation

### State Machine

```
ChapterState:
  - chapter_number (1-5)
  - chapter_flags (per-chapter progress)
  - active_party (character IDs)
  - wagon_party (character IDs, Chapter 5 only)
  - inventory_slot (0-4, pointing to chapter inventory)
  - gold (per-chapter in 1-4, shared in 5)
```

### Chapter Transition Logic

```python
def transition_chapter(from_chapter, to_chapter):
    # Save current chapter state
    save_chapter_state(from_chapter)
    
    # Initialize new chapter
    if to_chapter < 5:
        # Chapters 1-4: Fresh start with chapter characters
        initialize_chapter_party(to_chapter)
        initialize_chapter_inventory(to_chapter)
        set_chapter_start_location(to_chapter)
    else:
        # Chapter 5: Merge all characters and inventories
        merge_all_parties()
        merge_all_inventories()
        unlock_wagon_system()
        set_chapter_5_start()
```

### Memory Requirements

- 5 separate inventory spaces (248 slots × 5 = 1,240 bytes)
- 5 gold counters (4 bytes × 5 = 20 bytes)
- 5 chapter flag sets (32 bytes × 5 = 160 bytes)
- Party state per chapter (32 bytes × 5 = 160 bytes)

**Total additional RAM:** ~1,600 bytes

---

## 5. AI Battle System Implementation

### AI Decision Tree

```
For each AI-controlled character:
  1. Evaluate battle state
     - Party HP levels
     - Enemy count
     - Enemy types/threats
     - MP remaining
  
  2. Determine priority action
     a. Emergency heal (any ally < 25% HP)
     b. Remove status effects
     c. Buff if needed (early battle)
     d. Attack/damage enemies
  
  3. Select specific action
     - Choose best healing spell if healing
     - Choose most effective attack spell
     - Physical attack if MP conserving
  
  4. Select target
     - Weakest enemy for attacks
     - Most injured ally for heals
```

### Character AI Profiles

```c
struct AIProfile {
    uint8_t healing_priority;    // 0-100, likelihood to heal
    uint8_t magic_preference;    // 0-100, magic vs physical
    uint8_t aggression;          // 0-100, target selection
    uint8_t mp_conservation;     // 0-100, save MP tendency
    uint8_t special_flags;       // Character-specific behaviors
};

// Taloon special actions
enum TaloonActions {
    TALOON_TRIP = 0x80,      // Trip and miss turn
    TALOON_CALL_HELP,        // Call merchant for item
    TALOON_EXAMINE,          // Examine enemy for weakness
    TALOON_MERCHANT_SMILE    // Chance to avoid enemy attack
};
```

---

## 6. Wagon System Implementation

### Data Structure

```c
struct WagonSystem {
    uint8_t active_party[4];     // Characters in battle
    uint8_t wagon_party[8];      // Characters in wagon
    uint8_t wagon_accessible;    // Can swap in current area
    uint8_t swap_enabled;        // Mid-battle swap allowed
};
```

### Battle Integration

```python
def process_wagon_swap(slot_out, slot_in):
    # Validate swap
    if not wagon_accessible or not swap_enabled:
        return False
    
    # Check if character can swap (not dead, not status-locked)
    if party[slot_out].status & NO_SWAP_FLAGS:
        return False
    
    # Perform swap
    temp = active_party[slot_out]
    active_party[slot_out] = wagon_party[slot_in]
    wagon_party[slot_in] = temp
    
    # Swapped character loses turn
    active_party[slot_out].turn_used = True
    
    return True
```

---

## 7. Graphics Conversion Specification

### Tile Format Conversion

#### NES 2bpp to SNES 4bpp

```python
def convert_2bpp_to_4bpp(nes_tile):
    """
    NES 2bpp: 16 bytes per 8x8 tile
    - Bytes 0-7: Bit plane 0
    - Bytes 8-15: Bit plane 1
    
    SNES 4bpp: 32 bytes per 8x8 tile
    - Interleaved format
    """
    snes_tile = bytearray(32)
    
    for row in range(8):
        # Copy existing planes
        snes_tile[row * 2] = nes_tile[row]          # Plane 0
        snes_tile[row * 2 + 1] = nes_tile[row + 8]  # Plane 1
        # New planes are zero (colors 0-3 only)
        snes_tile[row * 2 + 16] = 0                 # Plane 2
        snes_tile[row * 2 + 17] = 0                 # Plane 3
    
    return snes_tile
```

### Palette Expansion

```python
def expand_palette(nes_palette):
    """
    NES: 4 colors per palette
    SNES: 16 colors per palette
    
    Strategy: Place NES colors in first 4 slots,
    use remaining 12 for enhanced colors.
    """
    snes_palette = [0] * 16
    
    # Copy original colors (with NES→SNES color conversion)
    for i in range(4):
        snes_palette[i] = nes_to_snes_color(nes_palette[i])
    
    # Generate enhancement colors (interpolation, shadows, highlights)
    snes_palette[4:8] = generate_shadows(snes_palette[0:4])
    snes_palette[8:12] = generate_highlights(snes_palette[0:4])
    snes_palette[12:16] = generate_midtones(snes_palette[0:4])
    
    return snes_palette
```

---

## 8. Map Conversion Specification

### Decompression/Recompression Pipeline

```
DW4 Map (RLE) 
    ↓ decompress_rle()
Raw Tile Data (1 byte/tile)
    ↓ convert_tiles()
Converted Tiles (2 bytes/tile)
    ↓ add_tile_properties()
Tile + Properties
    ↓ compress_lzss()
DQ3r Map (LZSS)
```

### Tile Property Mapping

```c
// DW4 NES tile properties (looked up separately)
struct DW4TileProperty {
    uint8_t walkable : 1;
    uint8_t encounter_zone : 1;
    uint8_t damage_floor : 1;
    uint8_t warp_tile : 1;
    uint8_t barrier : 1;
    uint8_t unused : 3;
};

// DQ3r SNES tile (property embedded)
struct DQ3rTile {
    uint16_t tile_id : 10;
    uint16_t palette : 3;
    uint16_t priority : 1;
    uint16_t flip_h : 1;
    uint16_t flip_v : 1;
    // Properties in separate layer
};
```

---

## 9. Text System Conversion

### Encoding Tables

#### DW4 NES Text Encoding (partial)

```
$00-$0F: Control codes
$10: [END]
$11: [LINE]
$12: [WAIT]
$13: [NAME] - Insert hero name
$14-$1F: More control codes
$20-$7F: Not used
$80-$9F: A-Z uppercase
$A0-$B9: a-z lowercase
$BA-$C3: 0-9
$C4-$DF: Punctuation, symbols
$E0-$FF: DTE pairs
```

#### DQ3r SNES Text Encoding

```
Modified Shift-JIS with custom extensions
$00-$1F: Control codes
$20-$7E: ASCII compatible
$80-$9F: Katakana
$A0-$DF: Extended codes
$E0-$FF: DTE/MTE compression
```

### Control Code Translation

| DW4 Code | DQ3r Code | Function |
|----------|-----------|----------|
| $10 | $00 | End of text |
| $11 | $01 | New line |
| $12 | $02 | Wait for input |
| $13 | $10 | Insert hero name |
| $14 | $11 | Insert party member |
| $15 | $12 | Insert number |
| $16 | $13 | Insert item name |

---

## 10. Audio Considerations

### Music Adaptation Options

1. **Option A: Direct Port**
   - Convert NES music data to SNES SPC format
   - Limited by NES's simpler sound capabilities
   
2. **Option B: Enhanced Arrangements**
   - Use existing DQ SNES soundfont
   - Rearrange DW4 music with SNES capabilities
   - More work but better quality

3. **Option C: Hybrid**
   - Port simple tracks directly
   - Enhance important themes (battle, boss, overworld)

### Sound Effect Mapping

Create mapping table from DW4 NES sound effects to equivalent DQ3r SNES effects.

---

## 11. Testing Strategy

### Unit Tests

- [ ] Monster stat conversion accuracy
- [ ] Item data conversion accuracy
- [ ] Map decompression/recompression integrity
- [ ] Text encoding conversion
- [ ] Save data compatibility

### Integration Tests

- [ ] Chapter transitions
- [ ] AI battle decisions
- [ ] Wagon system operations
- [ ] Event sequences

### Playthrough Tests

- [ ] Chapter 1 completable
- [ ] Chapter 2 completable
- [ ] Chapter 3 completable
- [ ] Chapter 4 completable
- [ ] Chapter 5 completable
- [ ] Full game (all chapters)
- [ ] Optional content

---

## 12. File Format Specifications

### Converter Input/Output Formats

All converters use JSON as intermediate format for human readability and easy editing.

```json
// Monster data example
{
  "id": 1,
  "name": "Slime",
  "stats": {
    "hp": 8,
    "attack": 7,
    "defense": 4,
    "agility": 4
  },
  "rewards": {
    "exp": 1,
    "gold": 2
  },
  "drops": [
    {"item": "Herb", "rate": 8}
  ],
  "actions": ["Attack", "Flee"]
}
```

### Binary Packing Specifications

See [data-formats.md](data-formats.md) for detailed binary format specifications.

---

*Last Updated: 2025-12-30*
