# Dragon Quest III (SNES) - Testing Procedures

Detailed manual testing procedures for Dragon Quest III (SNES) reverse engineering.

## Emulator Setup

### Recommended: Mesen-S

1. Download Mesen from [mesen.ca](https://mesen.ca)
2. Switch to SNES mode
3. Load `Dragon Quest III - Soshite Densetsu he... (J).sfc`
4. Enable debug features:
   - Debug → Debugger
   - Debug → Memory Tools
   - Debug → Event Viewer

### Alternative: bsnes-plus

1. Download bsnes-plus
2. Load ROM
3. Tools → Debugger

### Language Note

DQ3 SNES is Japanese-only. Useful for:
- Data structure research
- Graphics extraction
- Game mechanics analysis

## Save State Positions

| Slot | Position | Use Case |
|------|----------|----------|
| 1 | After name entry | Initial state |
| 2 | Party of 4 | Full party testing |
| 3 | Before boss | Battle testing |
| 4 | Class change shrine | Class system testing |
| 5 | Day/Night transition | Time system testing |

## Test Cases

### TC-001: Character Data Verification

**Purpose:** Verify character data structure

**Setup:**
1. Load save with known character
2. Open Memory Viewer at $00:E100

**Steps:**
1. Check HP at $E104-$E105
2. Check Level at $E100
3. Verify stats at $E10C-$E10F
4. Compare with in-game display

**Expected:** Memory matches displayed values

### TC-002: Class Change Testing

**Purpose:** Understand class change mechanics

**Setup:**
1. Load save at Dharma Temple
2. Monitor character data area

**Steps:**
1. Note current class at $E180
2. Perform class change
3. Note new class value
4. Check stat recalculation

**Expected:** Class ID changes, stats recalculated

### TC-003: Personality System

**Purpose:** Map personality types

**Setup:**
1. Create new character
2. Answer questions differently

**Steps:**
1. Complete personality quiz
2. Note personality byte at $E182
3. Restart and answer differently
4. Map question answers to personality

**Expected:** Different answers = different personality

### TC-004: Day/Night Cycle

**Purpose:** Understand time system

**Setup:**
1. Load save in town
2. Monitor time-related addresses

**Steps:**
1. Wait for day to change to night
2. Note NPC behavior changes
3. Check time flag in memory
4. Visit time-dependent location

**Expected:** Time affects NPCs and access

### TC-005: Encounter Rate Testing

**Purpose:** Verify encounter mechanics

**Setup:**
1. Load save on overworld
2. Monitor encounter counter

**Steps:**
1. Walk set number of steps
2. Note encounter counter changes
3. Compare different areas
4. Test with items that affect rate

**Expected:** Counter matches expected rate

### TC-006: Spell Learning Verification

**Purpose:** Map spell learning tables

**Setup:**
1. Load save near level up
2. Monitor spell flags

**Steps:**
1. Note current spells at $E120-$E13F
2. Gain level
3. Check for new spell bit set
4. Map level to spell learning

**Expected:** Spell flag set at correct level

### TC-007: Equipment Effects

**Purpose:** Test equipment stat modifiers

**Setup:**
1. Load save with equipment options
2. Note base stats

**Steps:**
1. Remove all equipment
2. Note base Attack/Defense
3. Equip weapon
4. Note new Attack value
5. Calculate bonus applied

**Expected:** Stats change by equipment value

## HiROM Address Conversion

DQ3 SNES uses HiROM mapping:
- Banks $C0-$FF contain ROM
- Address = $C00000 + ROM offset
- CPU can also access via $00-$3F banks at $8000-$FFFF

### Conversion Formula
```
ROM_Offset = (Bank - $C0) × $10000 + Address
CPU_Address = $C00000 + ROM_Offset
```

## Breakpoint Locations

### Core System

| Address | Bank | Type | Description |
|---------|------|------|-------------|
| $C0:8000 | $C0 | Exec | Reset/boot |
| $C0:8050 | $C0 | Exec | NMI handler |
| $00:E000 | - | Write | Game mode |

### Battle System

| Address | Bank | Type | Description |
|---------|------|------|-------------|
| $C2:8000 | $C2 | Exec | Battle entry |
| $00:EA00 | - | Write | Encounter |
| $00:EA10 | - | Write | Enemy data |

### Menu System

| Address | Bank | Type | Description |
|---------|------|------|-------------|
| $C3:8000 | $C3 | Exec | Menu entry |
| $00:EB00 | - | Write | Menu state |

### Map System

| Address | Bank | Type | Description |
|---------|------|------|-------------|
| $C4:8000 | $C4 | Exec | Field entry |
| $00:E800 | - | Write | Map ID |
| $00:E802 | - | Write | Player X |
| $00:E803 | - | Write | Player Y |

## Memory Watch Points

### Character 1 (Hero)

```
$00:E100: Level
$00:E101-E103: Experience (24-bit)
$00:E104-E105: HP current
$00:E106-E107: HP max
$00:E108-E109: MP current
$00:E10A-E10B: MP max
$00:E10C: Strength
$00:E10D: Agility
$00:E10E: Wisdom
$00:E10F: Vitality
$00:E180: Class ID
$00:E181: Gender
$00:E182: Personality
```

### Party 2-4

Same structure at:
- Character 2: $00:E200
- Character 3: $00:E300
- Character 4: $00:E400

### World State

```
$00:E500-E57F: Inventory
$00:E580-E583: Gold
$00:E800: Current map
$00:E900-E93F: Story flags
```

## CDL Recording Sessions

### Recommended Sessions

1. **New Game to First Save** - Initialization
2. **Complete Dungeon** - Map and battle
3. **Class Change** - Class system
4. **Day/Night Cycle** - Time system
5. **Casino** - Mini-game system

### Recording Tips

- DQ3 has large ROM (4MB)
- Focus on specific systems
- Multiple sessions recommended

## Japanese Text Analysis

### Shift-JIS Encoding

Text uses Shift-JIS. To decode:
1. Look for two-byte sequences ($81xx-$9Fxx, $E0xx-$EFxx)
2. Half-width katakana at $A1-$DF
3. Control codes at $F0-$FF

### Finding Text

1. Play to text display
2. Set read breakpoint on VRAM writes
3. Trace back to ROM source
4. Identify compression

## Troubleshooting

### Bank Confusion

HiROM can be confusing:
- Same ROM data accessible from multiple banks
- Use Mesen's memory map display
- Check header at $FFD5 (should be $31 for HiROM + FastROM)

### Japanese ROM

- Use hex comparison with known values
- Reference existing translations
- Focus on numeric/byte data first

### Large ROM Size

4MB requires systematic approach:
- Break analysis into bank ranges
- Use CDL to identify active areas
- Document findings incrementally

## Results Template

```
Test ID: TC-XXX
Date: YYYY-MM-DD
Tester: [Name]
ROM: Dragon Quest III (J) [CRC]
Emulator: [Name] [Version]
Result: PASS/FAIL

Character State:
- Level: XX
- Class: [Name]
- Party size: X

Observations:
[Details - note Japanese text as hex if needed]

Memory Values:
[Address]: [Value] - [Interpretation]

Bank Information:
[Active banks during test]

Screenshots:
[Filename]
```

## External Resources

- [dq3r-info Repository](https://github.com/TheAnsarya/dq3r-info) - Full analysis project
- Shift-JIS encoding tables
- Japanese DQ3 guides (for reference)
