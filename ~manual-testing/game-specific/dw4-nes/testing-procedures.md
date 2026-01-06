# Dragon Warrior IV (NES) - Testing Procedures

Detailed manual testing procedures for Dragon Warrior IV reverse engineering.

## Emulator Setup

### Recommended: Mesen

1. Download Mesen from [mesen.ca](https://mesen.ca)
2. Load `Dragon Warrior IV (1992-10)(Enix)(US).nes`
3. Enable these debug features:
   - Debug → Debugger
   - Debug → Memory Tools → Memory Viewer
   - Debug → PPU Tools → PPU Viewer
   - Debug → Tools → Event Viewer

### Alternative: FCEUX

1. Download FCEUX from [fceux.com](https://fceux.com)
2. Load ROM
3. Open Debug → Debugger

## Save State Positions

Create save states at these points for testing:

| Slot | Position | Use Case |
|------|----------|----------|
| 1 | Chapter 1 start | Initial state testing |
| 2 | First battle | Battle system testing |
| 3 | Chapter 5 with wagon | Full party testing |
| 4 | Boss battle | AI testing |
| 5 | Shop menu | Item system testing |

## Test Cases

### TC-001: Battle Damage Calculation

**Purpose:** Verify damage formula accuracy

**Setup:**
1. Load save state with known stats
2. Enter battle with weak enemy
3. Set memory watch on $6191-$6192 (damage output)

**Steps:**
1. Note attacker's Attack stat
2. Note defender's Defense stat
3. Select Attack command
4. Record damage dealt
5. Compare with formula: `(Attack × 2) - Defense`

**Expected:** Damage matches formula ±10% (variance)

### TC-002: Party Member Data Integrity

**Purpose:** Verify party data structure

**Setup:**
1. Load Chapter 5 save with full party
2. Open Memory Viewer at $6000

**Steps:**
1. Check Hero data at $6000-$603F
2. Verify HP at $6004-$6005 matches displayed HP
3. Verify Level at $6008 matches displayed level
4. Check equipment slots at $6015-$601F

**Expected:** Memory values match UI display

### TC-003: Text Encoding Verification

**Purpose:** Test text extraction accuracy

**Setup:**
1. Find known text string in ROM
2. Set read breakpoint on text address

**Steps:**
1. Trigger dialog that uses the text
2. Note CPU address when breakpoint hits
3. Compare with ROM offset
4. Verify character encoding

**Expected:** Text decodes correctly using TBL file

### TC-004: Monster Data Extraction

**Purpose:** Verify monster stat table

**Setup:**
1. Enter battle with known monster
2. Set breakpoint on monster data load

**Steps:**
1. Note address of monster data
2. Extract 27-byte monster entry
3. Compare HP, Attack, Defense to in-game values

**Expected:** Extracted stats match game behavior

### TC-005: Item Effect Testing

**Purpose:** Test item use functionality

**Setup:**
1. Load save with various items
2. Set breakpoint on item use routine

**Steps:**
1. Use healing item
2. Note HP before and after
3. Verify healing amount matches item data

**Expected:** Item effect matches data table

## Breakpoint Locations

### Common Breakpoints

| Address | Type | Description |
|---------|------|-------------|
| $C000 | Exec | NMI handler entry |
| $E000 | Exec | Main game loop |
| $6000 | Read | Party data access |
| $6191 | Write | Damage calculation result |
| $6195 | Write | Battle counter update |

### Battle System Breakpoints

| Address | Type | Description |
|---------|------|-------------|
| Bank 16 $8000 | Exec | Battle engine entry |
| $615A | Write | Active actor set |
| $615B | Write | Tactics setting |
| $618E | Write | Battle state flags |

### Menu System Breakpoints

| Address | Type | Description |
|---------|------|-------------|
| Bank 17 $8000 | Exec | Menu engine entry |
| $0300 | Write | Menu state change |
| $0301 | Write | Cursor position |

## Memory Watch Points

### Party Monitoring

```
$6000: Hero HP Low
$6001: Hero HP High
$6008: Hero Level
$6300: Gold Low
$6301: Gold Mid-Low
$6302: Gold Mid-High
$6303: Gold High
```

### Battle Monitoring

```
$615A: Current actor
$6191: Damage Low
$6192: Damage High
$618E: Battle state
```

## CDL Recording Sessions

### Full Game Recording

1. Start new game
2. Enable CDL recording
3. Play through Chapter 1 completely
4. Save CDL file as `chapter1.cdl`
5. Repeat for each chapter

### Targeted Recording

1. Load save state at target area
2. Enable CDL recording
3. Perform specific action (battle, menu, etc.)
4. Save CDL file with descriptive name

## Troubleshooting

### Common Issues

**Problem:** Breakpoint not triggering
- Check bank switching - address may be in wrong bank
- Verify breakpoint type (exec vs read vs write)

**Problem:** Memory values unexpected
- Check if value is cached elsewhere
- Verify byte order (little-endian on NES)

**Problem:** Game crashes after modification
- Check for checksum verification
- Verify modification didn't corrupt adjacent data

## Results Logging

Use this template for test results:

```
Test ID: TC-XXX
Date: YYYY-MM-DD
Tester: [Name]
ROM: [CRC32]
Result: PASS/FAIL

Notes:
[Observations]

Evidence:
[Screenshots, memory dumps, etc.]
```
