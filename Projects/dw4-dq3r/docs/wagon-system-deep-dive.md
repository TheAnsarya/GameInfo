# Wagon System Deep Dive: DW4 NES Implementation

## Overview

The Wagon System is one of Dragon Warrior IV's most innovative features, allowing management of up to 12 party members (4 active + 8 in wagon) during Chapter 5. This document provides a detailed technical analysis for porting to the DQ3r SNES engine.

## System Requirements

### Basic Concept

```
┌─────────────────────────────────────────────┐
│              ACTIVE PARTY (4)               │
│  ┌────────┐ ┌────────┐ ┌────────┐ ┌───────┐│
│  │ HERO   │ │ Alena  │ │ Cristo │ │ Taloon││
│  │ (Lead) │ │        │ │        │ │       ││
│  └────────┘ └────────┘ └────────┘ └───────┘│
└─────────────────────────────────────────────┘
                    │ SWAP │
                    ▼
┌─────────────────────────────────────────────┐
│              WAGON PARTY (8)                │
│  ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐│
│  │Rag│ │Bry│ │Mar│ │Nar│ │Mna│ │   │ │   ││
│  └───┘ └───┘ └───┘ └───┘ └───┘ └───┘ └───┘│
└─────────────────────────────────────────────┘
```

### When Wagon is Accessible

| Location Type | Wagon Access | In-Battle Swap |
|---------------|--------------|----------------|
| Overworld | ✓ Yes | ✓ Yes |
| Towns | ✓ Yes | N/A |
| Cave/Dungeon | ✗ No | ✗ No |
| Tower | ✗ No | ✗ No |
| Final Dungeon | ✗ No | ✗ No |
| Ship | ✓ Yes | ✓ Yes |
| Balloon | ✗ No* | ✗ No |

*Balloon only holds 4

## Memory Structure

### DW4 NES Implementation

```
Wagon State Byte ($0480):
  Bit 0: Wagon enabled (Chapter 5)
  Bit 1: Wagon accessible (current area)
  Bit 2: In-battle swap allowed
  Bit 3: Reserved
  Bit 4-7: Wagon location ID

Active Party ($0500-$050F):
  $0500-$0503: Character IDs (4 slots)
  $0504-$0507: Formation order
  $0508-$050B: Battle positions
  $050C-$050F: Reserved

Wagon Party ($0510-$051F):
  $0510-$0517: Character IDs (8 slots)
  $0518-$051F: Wagon order/positions

Character Status Cache ($0520-$053F):
  Per character (32 bytes total):
    +$00: Character ID
    +$01: Current HP (low)
    +$02: Current HP (high)
    +$03: Current MP (low)
    +$04: Current MP (high)
    +$05: Status flags
    +$06-$07: Reserved
```

### Proposed DQ3r Implementation

```
$7E1A00-$7E1A0F: Wagon State Block
  $7E1A00: wagon_enabled (1 byte)
  $7E1A01: wagon_accessible (1 byte)
  $7E1A02: battle_swap_enabled (1 byte)
  $7E1A03: wagon_location_type (1 byte)
  $7E1A04-$7E1A07: Reserved
  $7E1A08-$7E1A0B: Active party IDs
  $7E1A0C-$7E1A0F: Formation data

$7E1A10-$7E1A1F: Wagon Party Slots
  $7E1A10-$7E1A17: Character IDs (8 slots)
  $7E1A18-$7E1A1F: Wagon positions

$7E1A20-$7E1A7F: Extended Character Cache
  Per character × 12 (8 bytes each = 96 bytes):
    +$00: Character ID
    +$01-$02: Current HP (16-bit)
    +$03-$04: Current MP (16-bit)
    +$05: Status flags
    +$06: AI mode
    +$07: Reserved
```

## Swap Mechanics

### Overworld Swap (Menu)

```c
// Menu: Party → Wagon submenu
void open_wagon_menu() {
    if (!wagon_enabled || !wagon_accessible) {
        show_message("Cannot access wagon here.");
        return;
    }
    
    // Show current party
    display_active_party();
    
    // Show wagon contents
    display_wagon_party();
    
    // Get selection
    int active_slot = get_active_selection();
    int wagon_slot = get_wagon_selection();
    
    // Validate swap
    if (validate_swap(active_slot, wagon_slot)) {
        perform_swap(active_slot, wagon_slot);
    }
}

bool validate_swap(int active, int wagon) {
    // Hero cannot be swapped out
    if (active_party[active] == HERO_ID) {
        show_message("The Hero must stay in the party!");
        return false;
    }
    
    // Cannot swap dead characters out (optional rule)
    if (is_dead(active_party[active])) {
        show_message("Cannot move unconscious allies.");
        return false;
    }
    
    // Check wagon slot is valid
    if (wagon >= wagon_count) {
        return false;
    }
    
    return true;
}

void perform_swap(int active, int wagon) {
    // Swap IDs
    uint8_t temp = active_party[active];
    active_party[active] = wagon_party[wagon];
    wagon_party[wagon] = temp;
    
    // Swap cached status
    swap_character_cache(active, wagon);
    
    // Update displays
    refresh_party_display();
    refresh_wagon_display();
}
```

### In-Battle Swap

```c
// Battle menu: "Swap" command
void battle_swap_command(int party_slot) {
    if (!wagon_accessible || !battle_swap_enabled) {
        show_message("Cannot swap here!");
        return;
    }
    
    // Show wagon selection
    int wagon_slot = select_wagon_character();
    
    if (wagon_slot < 0) return;  // Cancelled
    
    // Perform battle swap
    perform_battle_swap(party_slot, wagon_slot);
}

void perform_battle_swap(int active, int wagon) {
    // Standard swap
    perform_swap(active, wagon);
    
    // Battle-specific effects
    
    // Swapped-out character loses their turn
    // (already acted or turn cancelled)
    
    // Swapped-in character:
    //   - Acts at end of turn order
    //   - Cannot act this turn (original DW4)
    //   - Or: Gets turn if slot not yet acted
    
    battle_state.turn_used[active] = true;
    
    // Status effects may transfer or clear
    // (DW4 keeps status on character)
}
```

## Location-Based Accessibility

### Area Type Detection

```c
enum AreaType {
    AREA_OVERWORLD = 0,
    AREA_TOWN = 1,
    AREA_CAVE = 2,
    AREA_TOWER = 3,
    AREA_DUNGEON = 4,
    AREA_SHIP = 5,
    AREA_SPECIAL = 6
};

// Table of area types (indexed by map ID)
const uint8_t area_types[256] = {
    AREA_OVERWORLD,  // Map 0: World map
    AREA_TOWN,       // Map 1: Branca
    AREA_TOWN,       // Map 2: Endor
    // ... etc
    AREA_CAVE,       // Map 50: Cave South of Branca
    // ... etc
};

void update_wagon_accessibility() {
    uint8_t current_map = get_current_map();
    uint8_t area_type = area_types[current_map];
    
    switch (area_type) {
        case AREA_OVERWORLD:
        case AREA_TOWN:
        case AREA_SHIP:
            wagon_accessible = true;
            battle_swap_enabled = (area_type != AREA_TOWN);
            break;
            
        case AREA_CAVE:
        case AREA_TOWER:
        case AREA_DUNGEON:
            wagon_accessible = false;
            battle_swap_enabled = false;
            // Reduce active party if > 4 somehow
            enforce_party_limit(4);
            break;
            
        default:
            wagon_accessible = check_special_area(current_map);
            break;
    }
}
```

### Dungeon Entry Handling

```c
void on_dungeon_entry() {
    if (!wagon_accessible) {
        // Wagon stays outside
        
        // Check party composition
        if (count_alive_party() < 4) {
            // Auto-fill from wagon if available
            auto_fill_party_from_wagon();
        }
        
        // Show message
        show_message("The wagon must wait outside.");
    }
}

void auto_fill_party_from_wagon() {
    for (int i = 0; i < 4; i++) {
        if (active_party[i] == EMPTY || is_dead(active_party[i])) {
            // Find first alive wagon member
            for (int w = 0; w < 8; w++) {
                if (wagon_party[w] != EMPTY && !is_dead(wagon_party[w])) {
                    // Swap them in
                    active_party[i] = wagon_party[w];
                    wagon_party[w] = EMPTY;
                    compact_wagon();
                    break;
                }
            }
        }
    }
}
```

## Character Order and Formation

### Order Priority

```
Default Chapter 5 Order (by recruitment):
1. Hero (always first, cannot be swapped out)
2. Ragnar (first recruited)
3. Alena/Cristo/Brey (group recruit)
4. Taloon
5. Mara/Nara (group recruit)
6. Meena (last)
```

### Formation Types

```c
// Formation affects battle positioning
enum Formation {
    FORM_STANDARD = 0,   // Front row: slots 0-1, Back: 2-3
    FORM_OFFENSIVE = 1,  // All front row
    FORM_DEFENSIVE = 2,  // All back row
    FORM_MIXED = 3       // Custom positions
};

struct PartyFormation {
    uint8_t formation_type;
    uint8_t front_row;      // Bitmask of front row slots
    uint8_t row_bonus[4];   // Per-slot row modifier
};

// Front row: +10% damage dealt, +10% damage taken
// Back row: -10% damage dealt, -10% damage taken
```

## Experience Distribution

### With Wagon

```c
void distribute_experience(uint32_t total_exp) {
    int active_alive = count_alive_active();
    
    if (active_alive == 0) {
        // All dead - no exp
        return;
    }
    
    // Only active, alive party members get experience
    uint32_t per_member = total_exp / active_alive;
    
    for (int i = 0; i < 4; i++) {
        if (active_party[i] != EMPTY && !is_dead(active_party[i])) {
            add_experience(active_party[i], per_member);
        }
    }
    
    // WAGON MEMBERS GET NOTHING
    // This is the DW4 rule - provides incentive to rotate party
}
```

### DQ3r Modification Needed

DQ3r would need this logic added:
- Track which characters are "wagon" vs "active"
- Exclude wagon from exp distribution
- Possibly add option for partial wagon exp (QoL feature)

## UI Requirements

### Menu Integration

```
Main Menu
├── Item
├── Magic
├── Equip
├── Status
├── Tactics
├── Wagon ← NEW
│   ├── View Party
│   ├── Swap Members
│   └── Order
└── Misc
```

### Battle Menu Integration

```
Battle Commands (per character)
├── Fight
├── Magic
├── Item
├── Defend
├── Swap ← NEW (if wagon accessible)
└── Run (Hero only)
```

### Graphics Requirements

- Party lineup display (4 character portraits)
- Wagon lineup display (8 character portraits, smaller)
- Swap selection cursor
- "Wagon inaccessible" indicator

## Implementation Checklist

### Phase 1: Data Structures
- [ ] Define wagon state memory block
- [ ] Define character cache structure
- [ ] Add wagon party array
- [ ] Add area accessibility table

### Phase 2: Core Logic
- [ ] Implement swap validation
- [ ] Implement swap execution
- [ ] Implement area checking
- [ ] Implement dungeon entry handling

### Phase 3: Battle Integration
- [ ] Add "Swap" battle command
- [ ] Implement turn order adjustment
- [ ] Handle mid-battle state changes
- [ ] Update battle displays

### Phase 4: Menu Integration
- [ ] Add Wagon submenu
- [ ] Implement party view screen
- [ ] Implement swap selection UI
- [ ] Add formation editing

### Phase 5: Polish
- [ ] Add wagon inaccessible messages
- [ ] Add swap sound effects
- [ ] Add visual feedback
- [ ] Edge case handling

## Testing Matrix

| Test Case | Expected Result |
|-----------|-----------------|
| Swap Hero out | Should fail with message |
| Swap in dungeon | Should fail, no wagon access |
| Swap on overworld | Should succeed |
| Swap dead character | Should fail (if rule enforced) |
| Battle swap | Character loses turn |
| Enter dungeon with < 4 alive | Auto-fill from wagon |
| Exit dungeon | Wagon rejoins |
| Exp with wagon | Only active get exp |

## ROM Space Estimate

| Component | Size |
|-----------|------|
| Wagon state logic | ~1KB |
| Swap routines | ~512B |
| Area table | ~256B |
| Menu code | ~1KB |
| Battle integration | ~512B |
| **Total** | ~3.3KB |

## RAM Space Estimate

| Component | Size |
|-----------|------|
| Wagon state | 16 bytes |
| Active party | 16 bytes |
| Wagon party | 16 bytes |
| Character cache | 96 bytes |
| Temp buffers | 32 bytes |
| **Total** | ~176 bytes |

## References

- [DW4 Wagon System](../../dragon-warrior-4-info/docs/formats/WAGON_SYSTEM.md)
- [Chapter System Comparison](chapter-system-comparison.md)
- [Battle System Comparison](battle-system-comparison.md)
- [Technical Specifications](technical-specs.md)
