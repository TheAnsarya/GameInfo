# Final Fantasy Mystic Quest (SNES) - Testing Procedures

Detailed manual testing procedures for FFMQ reverse engineering.

## Emulator Setup

### Recommended: Mesen-S

1. Download Mesen from [mesen.ca](https://mesen.ca)
2. Switch to SNES mode
3. Load `Final Fantasy - Mystic Quest (USA).sfc`
4. Enable debug features:
   - Debug → Debugger
   - Debug → Memory Tools
   - Debug → Tilemap Viewer
   - Debug → Sprite Viewer

### Alternative: bsnes-plus

1. Download bsnes-plus
2. Load ROM
3. Tools → Debugger

## Save State Positions

| Slot | Position | Use Case |
|------|----------|----------|
| 1 | Foresta (start) | Initial testing |
| 2 | First boss (Minotaur) | Boss AI testing |
| 3 | Aquaria region | Partner testing (Phoebe) |
| 4 | Full weapon set | Equipment testing |
| 5 | Doom Castle | Late-game testing |

## Test Cases

### TC-001: Battle Damage Formula

**Purpose:** Verify physical damage calculation

**Setup:**
1. Load save with known equipment
2. Enter battle with standard enemy
3. Set memory watch on damage addresses

**Steps:**
1. Record Benjamin's Attack stat
2. Record enemy's Defense stat
3. Execute Attack command
4. Record damage dealt
5. Compare with formula: `(Attack × 2) - Defense`

**Expected:** Damage within ±10% of calculated value

### TC-002: Magic Damage Testing

**Purpose:** Verify spell damage calculation

**Setup:**
1. Load save with spells learned
2. Enter battle
3. Monitor damage output

**Steps:**
1. Record Magic stat
2. Cast Fire spell on enemy
3. Record damage
4. Calculate expected: `Power × (Magic / 4 + 8)`

**Expected:** Damage matches formula × element modifier

### TC-003: Weapon Leveling

**Purpose:** Verify weapon experience system

**Setup:**
1. Load save with level 1 weapon
2. Set watch on weapon EXP address

**Steps:**
1. Note current weapon EXP
2. Defeat enemy
3. Check EXP increase
4. Verify formula: `Enemy Level × 10`

**Expected:** EXP increases by calculated amount

### TC-004: Partner Switching

**Purpose:** Test partner data handling

**Setup:**
1. Load save at partner change point
2. Monitor $7E:2100 (partner data)

**Steps:**
1. Note current partner stats
2. Trigger partner change event
3. Verify new partner data loads
4. Check stats match expected values

**Expected:** Partner data correctly swaps

### TC-005: Status Effect Duration

**Purpose:** Verify status turn counters

**Setup:**
1. Enter battle
2. Get hit with Paralysis
3. Monitor status timer

**Steps:**
1. Count turns until status clears
2. Verify matches expected (3 turns)
3. Test with other statuses

**Expected:** Status durations match documentation

### TC-006: Item Effect Verification

**Purpose:** Test consumable items

**Setup:**
1. Load save with Cure items
2. Damage character to known HP
3. Monitor HP addresses

**Steps:**
1. Record current HP
2. Use Cure item
3. Record new HP
4. Verify healing matches item power (100)

**Expected:** Healing amount correct

### TC-007: Save Data Integrity

**Purpose:** Verify save/load system

**Setup:**
1. Load game at specific point
2. Note all important values

**Steps:**
1. Save game
2. Modify some values (gold, HP)
3. Load game
4. Verify values restored correctly

**Expected:** All values match pre-save state

## Breakpoint Locations

### Core System

| Address | Type | Description |
|---------|------|-------------|
| $00:8000 | Exec | Reset vector |
| $00:8050 | Exec | NMI handler |
| $7E:1000 | Write | Game mode change |

### Battle System

| Address | Type | Description |
|---------|------|-------------|
| $01:8000 | Exec | Battle engine entry |
| $7E:4000 | Write | Battle state |
| $7E:4400 | Write | Damage calculation |
| $7E:2000 | Read | Benjamin stats read |

### Menu System

| Address | Type | Description |
|---------|------|-------------|
| $03:8000 | Exec | Menu engine |
| $7E:EB00 | Write | Menu state |
| $7E:3000 | Read | Inventory access |

### Audio System

| Address | Type | Description |
|---------|------|-------------|
| $06:8000 | Exec | Audio driver |
| $2140 | Write | APU communication |
| $7E:E0D0 | Write | Music ID change |

## Memory Watch Points

### Character Stats

```
$7E:2000-$7E:2001: Benjamin HP current
$7E:2002-$7E:2003: Benjamin HP max
$7E:2004: Benjamin Attack
$7E:2005: Benjamin Defense
$7E:2028: Benjamin Weapon ID
```

### Battle State

```
$7E:4000: Battle phase
$7E:4001: Battle flags
$7E:4002: Turn counter
$7E:4003: Enemy count
```

### Inventory

```
$7E:3000-$7E:301F: Weapons
$7E:3100-$7E:3103: Gold (32-bit)
```

## CDL Recording Sessions

### Recommended Sessions

1. **Title to First Save** - Covers initialization
2. **Complete Battle** - Full battle system
3. **Menu Navigation** - All menu screens
4. **Boss Fight** - AI patterns
5. **Overworld Travel** - Map system

### Recording Procedure

1. Create save state before recording area
2. Debug → CDL Tools → Start Recording
3. Perform actions thoroughly
4. Stop recording
5. Save with descriptive filename

## Trace Logging

### Battle Trace

1. Set execution breakpoint at $01:8000
2. Enable trace logging
3. Execute one turn
4. Stop trace
5. Analyze call stack

### DMA Trace

1. Set write breakpoint on $2100-$213F
2. Trigger graphics update
3. Note source addresses
4. Map to ROM locations

## Troubleshooting

### Bank Switching Issues

FFMQ uses LoROM mapping. Convert addresses:
- ROM offset = (Bank × $8000) + (Address - $8000)
- CPU address = (ROM offset MOD $8000) + $8000

### HiROM vs LoROM

FFMQ is LoROM. Verify with header check:
- Offset $FFD5 should be $20 (LoROM)

### Audio Debugging

SPC700 runs independently. Use:
- Debug → APU Debugger (Mesen-S)
- Export SPC files at specific points

## Results Template

```
Test ID: TC-XXX
Date: YYYY-MM-DD
Tester: [Name]
ROM CRC: F8A3725C
Emulator: Mesen-S [version]
Result: PASS/FAIL

Setup State:
- Save slot: X
- Benjamin Level: XX
- Partner: [Name]

Observations:
[Details]

Memory Values:
[Address]: [Value]

Screenshots:
[Filename]
```
