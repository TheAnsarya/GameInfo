# Chapter System Comparison: DW4 NES vs DQ3r SNES

## Overview

Dragon Warrior IV's unique 5-chapter structure is its most distinguishing feature. This document details how the chapter system works and what modifications are needed to implement it in the DQ3r SNES engine.

## DW4 Chapter Structure

### Chapter Overview

| Chapter | Protagonist | Party Size | Control | Duration |
|---------|-------------|------------|---------|----------|
| 1 | Ragnar | 1-2 | Manual | ~2 hours |
| 2 | Alena, Cristo, Brey | 3 | AI-controlled | ~3 hours |
| 3 | Taloon | 1 | Manual | ~3 hours |
| 4 | Mara, Nara | 2 | AI-controlled | ~3 hours |
| 5 | Hero (all) | 4+wagon | Manual (Hero) | ~30 hours |

### Chapter Data Isolation

Each chapter maintains separate:

| Data | Isolation Level | Chapter 5 Behavior |
|------|-----------------|-------------------|
| Gold | Fully separate | Merged (sum all) |
| Inventory | Fully separate | Merged (priority order) |
| Progress Flags | Per chapter | All accessible |
| Map State | Per chapter | Shared world |
| Save Data | Slot per chapter | Single unified save |

## Memory Layout

### DW4 NES Chapter RAM

```
$0500-$0507: Current chapter state
  $0500: chapter_number (1-5)
  $0501: chapter_flags
  $0502: chapter_progress
  $0503-$0507: Reserved

$0600-$06FF: Chapter 1 data (256 bytes)
$0700-$07FF: Chapter 2 data (256 bytes)
$6000-$60FF: Chapter 3 data (256 bytes)
$6100-$61FF: Chapter 4 data (256 bytes)
$6200-$67FF: Chapter 5 data (1536 bytes - unified)

Per-Chapter Data Block:
  +$00-$1F: Party state (32 bytes)
  +$20-$5F: Inventory (64 slots, 64 bytes)
  +$60-$63: Gold (4 bytes)
  +$64-$9F: Progress flags (60 bytes)
  +$A0-$FF: Reserved (96 bytes)
```

### DQ3r SNES Memory (Current)

DQ3r has no chapter system - single continuous game state:

```
$7E1000-$7E10FF: Party data
$7E1100-$7E11FF: Inventory
$7E1200-$7E12FF: Progress flags
$7E1300-$7E13FF: Equipment
```

### Required Modifications

```
New Memory Map for Chapters:
$7E2000-$7E27FF: Chapter 1 data (2KB)
$7E2800-$7E2FFF: Chapter 2 data (2KB)
$7E3000-$7E37FF: Chapter 3 data (2KB)
$7E3800-$7E3FFF: Chapter 4 data (2KB)
$7E4000-$7E5FFF: Chapter 5 data (8KB)
$7E6000-$7E60FF: Chapter state machine

Total Additional RAM: ~18KB
```

## Chapter Transitions

### Transition Types

| Transition | Trigger | Actions |
|------------|---------|---------|
| 1 → 2 | Ragnar joins | Save Ch1, init Ch2 |
| 2 → 3 | Princess saved | Save Ch2, init Ch3 |
| 3 → 4 | Shop established | Save Ch3, init Ch4 |
| 4 → 5 | Edgar defeated | Save Ch4, merge all |
| Any → 5 | Hero departs | Begin unified game |

### Transition Logic

```c
void transition_to_chapter_5() {
    // Save current chapter if not already done
    if (current_chapter < 5) {
        save_chapter_state(current_chapter);
    }
    
    // Merge all parties
    clear_active_party();
    for (int ch = 1; ch <= 4; ch++) {
        merge_party_from_chapter(ch);
    }
    
    // Hero is always first
    set_party_leader(HERO_ID);
    
    // Merge inventories (priority: equipped > key items > consumables)
    merge_inventories_priority();
    
    // Sum all gold
    chapter_5_gold = 0;
    for (int ch = 1; ch <= 4; ch++) {
        chapter_5_gold += get_chapter_gold(ch);
    }
    
    // Enable wagon system
    wagon_enabled = true;
    
    // Set initial party (Hero + 3 others)
    set_initial_chapter5_party();
    
    // Enable chapter 5 world map
    unlock_chapter5_areas();
    
    current_chapter = 5;
}
```

## Party Management

### Chapters 1-4: Fixed Parties

```c
struct ChapterParty {
    uint8_t characters[4];
    uint8_t party_size;
    uint8_t control_mode;  // MANUAL or AI
};

const ChapterParty chapter_parties[] = {
    // Chapter 1: Ragnar (+ optional Healie)
    { {RAGNAR, HEALIE, NONE, NONE}, 2, MANUAL },
    
    // Chapter 2: Alena, Cristo, Brey
    { {ALENA, CRISTO, BREY, NONE}, 3, AI_CONTROLLED },
    
    // Chapter 3: Taloon (solo)
    { {TALOON, NONE, NONE, NONE}, 1, MANUAL },
    
    // Chapter 4: Mara, Nara
    { {MARA, NARA, NONE, NONE}, 2, AI_CONTROLLED },
};
```

### Chapter 5: Dynamic Party

```c
struct Chapter5Party {
    uint8_t active[4];       // In battle
    uint8_t wagon[8];        // In wagon
    uint8_t hero_position;   // Hero always active
    uint8_t wagon_accessible;
};

// Hero must always be in active party
void validate_party() {
    bool hero_found = false;
    for (int i = 0; i < 4; i++) {
        if (active[i] == HERO_ID) {
            hero_found = true;
            break;
        }
    }
    if (!hero_found) {
        // Force hero into party
        swap_character(0, find_hero_in_wagon());
    }
}
```

## Character Availability

### By Chapter

| Character | Ch1 | Ch2 | Ch3 | Ch4 | Ch5 |
|-----------|-----|-----|-----|-----|-----|
| Ragnar | ✓ | - | - | - | ✓ |
| Alena | - | ✓ | - | - | ✓ |
| Cristo | - | ✓ | - | - | ✓ |
| Brey | - | ✓ | - | - | ✓ |
| Taloon | - | - | ✓ | - | ✓ |
| Mara | - | - | - | ✓ | ✓ |
| Nara | - | - | - | ✓ | ✓ |
| Meena | - | - | - | - | ✓ |
| Hero | - | - | - | - | ✓ |
| Healie | ✓ | - | - | - | - |

### Recruitment in Chapter 5

```c
// Characters join at specific story points
enum RecruitmentPoint {
    RAGNAR_JOINS = 0x20,    // After Burland
    ALENA_JOINS = 0x21,     // After Endor
    TALOON_JOINS = 0x22,    // Endor shop
    MARA_NARA_JOIN = 0x23,  // Monbaraba
    // etc.
};

void check_recruitment(uint8_t event_id) {
    switch (event_id) {
        case RAGNAR_JOINS:
            add_to_wagon(RAGNAR);
            restore_chapter_equipment(1, RAGNAR);
            break;
        // ... etc
    }
}
```

## Inventory Management

### Per-Chapter Inventory

```c
struct ChapterInventory {
    uint8_t items[64];      // Item IDs
    uint8_t counts[64];     // Stack counts
    uint8_t key_items[16];  // Key item flags
    uint32_t gold;
};
```

### Chapter 5 Merge Algorithm

```c
void merge_inventories() {
    // 1. Collect all equipped items (keep equipped)
    for (int ch = 1; ch <= 4; ch++) {
        for (int char_idx = 0; char_idx < 4; char_idx++) {
            copy_equipment_to_chapter5(ch, char_idx);
        }
    }
    
    // 2. Collect all key items
    for (int ch = 1; ch <= 4; ch++) {
        merge_key_items(ch);
    }
    
    // 3. Collect consumables (up to limit)
    int slot = 0;
    for (int ch = 1; ch <= 4; ch++) {
        for (int i = 0; i < 64 && slot < MAX_INVENTORY; i++) {
            if (chapter_inventory[ch].items[i] != EMPTY) {
                add_to_chapter5_inventory(
                    chapter_inventory[ch].items[i],
                    chapter_inventory[ch].counts[i]
                );
                slot++;
            }
        }
    }
}
```

## Implementation Requirements

### Engine Modifications

1. **Chapter State Machine**
   - Track current chapter
   - Handle transitions
   - Save/load chapter data

2. **Multiple Save Slots**
   - 5 sub-slots per main slot
   - Or expanded single save

3. **Party Control Mode**
   - Toggle AI vs manual
   - Per-chapter default

4. **World State Isolation**
   - Chapter-specific map states
   - Event flags per chapter

### ROM Space Requirements

| Component | Size |
|-----------|------|
| Chapter state machine | ~1KB |
| Transition code | ~2KB |
| Merge algorithms | ~1KB |
| Chapter data tables | ~512B |
| **Total** | ~4.5KB |

### RAM Requirements

| Component | Size |
|-----------|------|
| Chapter 1-4 data | 8KB |
| Chapter 5 data | 8KB |
| State machine | 256B |
| Transition buffers | 256B |
| **Total** | ~17KB |

## Testing Matrix

| Test | Expected Result |
|------|-----------------|
| Start Chapter 1 | Ragnar alone, manual control |
| Chapter 1 → 2 | Ragnar data saved, Alena party AI mode |
| Chapter 2 → 3 | Ch2 saved, Taloon manual |
| Chapter 3 → 4 | Ch3 saved, sisters AI mode |
| Enter Chapter 5 | All characters available, gold merged |
| Chapter 5 wagon | Swap works in valid areas |
| Chapter 5 dungeon | Wagon inaccessible |
| Recruitment | Characters join with chapter equipment |

## DQ3r Comparison

| Feature | DQ3r SNES | DW4 NES | Port Requirement |
|---------|-----------|---------|------------------|
| Chapters | None | 5 chapters | Full implementation |
| Party Control | Full manual | AI + manual | Add AI system |
| Save Structure | Single | Multi-slot | Expand saves |
| World State | Unified | Per-chapter | Isolate by chapter |
| Inventory | 1 pool | 5 pools | Multiple inventories |

## References

- [DW4 Party System](../../dragon-warrior-4-info/docs/formats/PARTY_SYSTEM.md)
- [DW4 Save Format](../../dragon-warrior-4-info/docs/formats/SAVE_FORMAT.md)
- [AI Behavior Comparison](ai-behavior-comparison.md)
- [Technical Specifications](technical-specs.md)
