# DQ3r Animation Extraction via Breakpoint Analysis

> **GitHub Issue:** [#167 - DQ3r: Spell Animation Extraction & Cataloging](https://github.com/TheAnsarya/GameInfo/issues/167)

This guide walks through the process of extracting battle animation data from Dragon Quest III (SNES) using emulator breakpoints and memory analysis.

## 🎯 Objectives

1. Locate spell animation tile data in ROM
2. Identify animation script/sequence data
3. Extract palette data for each animation
4. Document animation timing and frame data
5. Map animation IDs to spell IDs

## 📋 Prerequisites

- [ ] Mesen-S or bsnes-plus installed and configured
- [ ] DQ3r ROM file (Japanese or translated)
- [ ] Save state near a battle (recommended: early game random encounter)
- [ ] Notepad/text editor for logging findings

## 🔧 Emulator Setup

### Mesen-S Configuration

1. **Enable Debug Mode:**
   - Tools → Debugger (or press `D`)
   - Ensure "Break on Reset" is unchecked for now

2. **Open Memory Viewer:**
   - Debug → Memory Viewer
   - Set to "VRAM" mode for graphics inspection

3. **Open Trace Logger:**
   - Debug → Trace Logger
   - Configure format: `[PC] [Instruction] A:[A] X:[X] Y:[Y]`

### bsnes-plus Configuration

1. **Open Debugger:**
   - Tools → Debugger
   
2. **Open VRAM Viewer:**
   - Tools → VRAM Viewer

3. **Enable Trace:**
   - Debug → Trace (configure output file)

## 📍 Key ROM Addresses (Known)

| Content | ROM Address | SNES Address | Size |
|---------|-------------|--------------|------|
| Monster Graphics | $220000 | $C40000 | 128KB |
| Battle BG Tiles | ~$240000 | ~$C80000 | ~32KB |
| Spell Effect Tiles | TBD | TBD | ~96KB |
| Animation Scripts | TBD | TBD | ~32KB |
| Palette Data | TBD | TBD | ~16KB |

## 🔬 Step-by-Step Extraction Process

### Phase 1: Locate DMA Transfer Routines

The SNES transfers graphics to VRAM via DMA. We need to find where spell animations are loaded.

#### Step 1.1: Set DMA Breakpoints

Set **write breakpoints** on the DMA registers:

```
$4300 - DMA Control (Channel 0)
$4301 - DMA Destination
$4302-$4304 - DMA Source Address
$4305-$4306 - DMA Size

Repeat for channels 1-7 ($4310, $4320, etc.)
```

**In Mesen-S:**
1. Debug → Breakpoints
2. Add breakpoint: Type=Write, Address=$4300-$4306
3. Enable "Break on Write"

**In bsnes-plus:**
1. Debugger → Add Breakpoint
2. Set Memory Write on $4300-$4306

#### Step 1.2: Trigger a Spell Animation

1. Load save state in battle
2. Select a spell (start with "Blaze" / メラ - Fire spell)
3. Execute the spell
4. Emulator should break on DMA setup

#### Step 1.3: Document the Transfer

When breakpoint hits, record:

```
PC Address: $_______ (code location)
DMA Source: $_______ (ROM/RAM address of graphics)
DMA Dest:   $_______ (VRAM address)
DMA Size:   $_______ (bytes transferred)
```

**Example Log Entry:**
```
Spell: Blaze (メラ)
PC: $C35A21
DMA Channel: 0
Source: $C48000 (ROM $248000)
Dest: $4000 (VRAM)
Size: $0800 (2KB)
Notes: Fire particle tiles
```

### Phase 2: Trace Animation Sequence Loading

#### Step 2.1: Find Animation ID Loading

1. Set a **read breakpoint** on the spell ID RAM location
   - Try $7E0A00-$7E0AFF (common battle variable area)
   
2. Cast a spell and note which address is read

3. Follow the code to find where it converts spell ID → animation ID

#### Step 2.2: Find Animation Script Table

Look for code patterns like:
```asm
; Typical animation table lookup
LDA spell_id
ASL A           ; Multiply by 2 (or more for larger entries)
TAX
LDA animation_table,X
STA animation_ptr
LDA animation_table+1,X
STA animation_ptr+1
```

Set breakpoints on likely table areas:
- Banks $C3-$C5 (common data banks in DQ3)

#### Step 2.3: Document Animation Script Format

When you find animation data, document its structure:

```
Animation Script Format (tentative):
Offset  Size  Description
------  ----  -----------
$00     2     Duration (frames)
$02     2     Tile source address
$04     2     Palette index
$06     2     X position
$08     2     Y position
$0A     1     Flags (flip, layer, etc.)
$0B     1     Next frame offset (0=end)
```

### Phase 3: Extract Palette Data

#### Step 3.1: Set CGRAM Breakpoints

```
$2121 - CGRAM Address
$2122 - CGRAM Data Write
```

#### Step 3.2: Capture Palette During Animation

1. Enable trace logging
2. Cast a spell
3. Review trace for writes to $2122
4. Note source addresses of palette data

### Phase 4: Catalog All Animations

Create a spreadsheet or JSON file:

```json
{
  "animations": [
    {
      "id": 0,
      "name": "Blaze",
      "spell_ids": [1],
      "tile_address": "$C48000",
      "tile_size": "2KB",
      "palette_address": "$C4A000",
      "script_address": "$C52100",
      "frames": 12,
      "duration_ms": 200
    }
  ]
}
```

## 🎬 Animation Categories to Extract

### Fire Spells
| Spell | JP Name | Animation ID | Priority |
|-------|---------|--------------|----------|
| Blaze | メラ | TBD | High |
| Blazemore | メラミ | TBD | High |
| Blazemost | メラゾーマ | TBD | High |
| Firebane | ギラ | TBD | Medium |
| Firebolt | ベギラマ | TBD | Medium |
| Firevolt | ベギラゴン | TBD | Medium |

### Ice Spells
| Spell | JP Name | Animation ID | Priority |
|-------|---------|--------------|----------|
| Icebolt | ヒャド | TBD | High |
| Snowblast | ヒャダルコ | TBD | High |
| IceStorm | マヒャド | TBD | Medium |

### Electric Spells
| Spell | JP Name | Animation ID | Priority |
|-------|---------|--------------|----------|
| Zap | ライデイン | TBD | High |
| Lightning | ギガデイン | TBD | High |
| Thordain | ミナデイン | TBD | Medium |

### Healing/Support
| Spell | JP Name | Animation ID | Priority |
|-------|---------|--------------|----------|
| Heal | ホイミ | TBD | High |
| Healmore | ベホイミ | TBD | High |
| Healall | ベホマ | TBD | Medium |
| HealUs | ベホマラー | TBD | Medium |

### Status Effects
| Spell | JP Name | Animation ID | Priority |
|-------|---------|--------------|----------|
| Sleep | ラリホー | TBD | Medium |
| Stopspell | マホトーン | TBD | Medium |
| Surround | マヌーサ | TBD | Low |

## 📊 Progress Tracking

Use this checklist as you work through extraction:

### DMA Routines Located
- [ ] Battle graphics DMA routine
- [ ] Spell effect DMA routine
- [ ] Palette DMA routine
- [ ] Monster sprite DMA routine

### Animation System Mapped
- [ ] Animation ID table location
- [ ] Animation script format documented
- [ ] Frame timing system understood
- [ ] Sound effect trigger points identified

### Assets Extracted
- [ ] Fire spell animations (6 spells)
- [ ] Ice spell animations (3 spells)
- [ ] Electric spell animations (3 spells)
- [ ] Healing animations (4+ spells)
- [ ] Status effect animations (3+ spells)
- [ ] Monster attack animations
- [ ] Critical hit effects
- [ ] Miss/evade effects

## 📝 Logging Template

Use this template for each debugging session:

```markdown
## Session: YYYY-MM-DD

### Objective
[What you're trying to find]

### Setup
- Emulator: [Mesen-S / bsnes-plus / etc.]
- ROM: [version/checksum]
- Save State: [location in game]

### Breakpoints Set
1. $______ - [description]
2. $______ - [description]

### Findings
| Address | Type | Description |
|---------|------|-------------|
| $______ | Code | [what it does] |
| $______ | Data | [what it contains] |

### Conclusions
[Summary of what was learned]

### Next Steps
[What to investigate next]
```

## 🔗 Related Files

After extraction, update these files:

- [DQ3rAnimationMappings.cs](../../../logsmall/DW4Lib/DQ3r/DQ3rAnimationMappings.cs) - Animation ID constants
- [spell-animations.md](../../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/reference/technical/spell-animations.md) - Animation documentation
- [battle-animations.md](../../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/reference/technical/battle-animations.md) - Battle system overview

## ⚠️ Common Issues

### Breakpoint Not Hitting
- Ensure you're in battle mode
- Check that the spell actually has a visual effect
- Verify DMA channel (0-7) being monitored

### Wrong Data Captured
- Animation data may be decompressed to RAM first
- Set breakpoints on RAM $7E/$7F banks as well
- Some effects use HDMA (channels 0-3 typically)

### Timing Issues
- Animation may span multiple frames
- Use frame advance (F key in most emulators)
- Enable "Break on Scanline" for precise timing

## 📚 Reference Material

- [SNES Dev Manual - DMA](https://wiki.superfamicom.org/dma-and-hdma)
- [Anomie's SNES Docs](https://www.romhacking.net/documents/196/)
- [DQ3 DataCrystal Page](https://datacrystal.tcrf.net/wiki/Dragon_Quest_III_(SNES))
