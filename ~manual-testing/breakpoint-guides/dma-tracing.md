# DMA Tracing Guide

How to trace DMA (Direct Memory Access) transfers to locate source data in ROM.

## 🎯 Overview

The SNES uses DMA to efficiently transfer large blocks of data without CPU involvement. By tracing DMA operations, we can:
- Find where graphics/audio data is stored in ROM
- Identify decompression routine outputs
- Map data flow from ROM → RAM → VRAM

## 🔧 SNES DMA Architecture

### DMA Channels

The SNES has 8 DMA channels (0-7). Each channel has registers at:

| Channel | Base Address |
|---------|--------------|
| 0 | $4300 |
| 1 | $4310 |
| 2 | $4320 |
| 3 | $4330 |
| 4 | $4340 |
| 5 | $4350 |
| 6 | $4360 |
| 7 | $4370 |

### Channel Registers

| Offset | Register | Description |
|--------|----------|-------------|
| $0 | DMAPx | DMA control/mode |
| $1 | BBADx | B-bus destination |
| $2 | A1TxL | Source address (low) |
| $3 | A1TxM | Source address (mid) |
| $4 | A1TxB | Source address (bank) |
| $5 | DASxL | Transfer size (low) |
| $6 | DASxH | Transfer size (high) |

### DMA Enable Register

| Address | Register | Description |
|---------|----------|-------------|
| $420B | MDMAEN | DMA enable (bits = channels) |

## 📍 Setting DMA Breakpoints

### Method 1: Break on DMA Enable

Set write breakpoint on `$420B`:
```
Address: $420B
Type: Write
```

This breaks whenever ANY DMA transfer is initiated.

### Method 2: Break on Specific Channel

Set write breakpoint on channel source address:
```
Address: $4302-$4304  (Channel 0)
Type: Write
```

### Method 3: Conditional DMA Break

Break only when DMA destination is VRAM:
```
Address: $420B
Type: Write
Condition: [$4301] == $18 || [$4301] == $19
```
($18/$19 = VMDATAL/VMDATAH = VRAM write)

## 🔬 DMA Analysis Procedure

### Step 1: Set Up Breakpoints

In Mesen-S or bsnes-plus:
1. Open Debugger
2. Add breakpoint on `$420B` (write)
3. Load save state before target event

### Step 2: Trigger Transfer

1. Resume emulation
2. Perform action that loads graphics (enter battle, cast spell, etc.)
3. Debugger breaks on DMA

### Step 3: Read DMA Parameters

When breakpoint hits, examine:

```
; Example register values
$4300: 01      ; DMA mode (transfer pattern)
$4301: 18      ; Destination ($2118 = VRAM low)
$4302: 00      ; Source low
$4303: 80      ; Source mid
$4304: C4      ; Source bank
$4305: 00      ; Size low
$4306: 20      ; Size high

; Decoded:
Source: $C48000 (Bank $C4, offset $8000)
Size: $2000 (8KB)
Dest: VRAM ($2118)
```

### Step 4: Calculate ROM Address

For HiROM games (like DQ3r):
```
SNES Bank $C0-$FF → ROM offset = SNES - $C00000
Example: $C48000 → ROM $048000
```

### Step 5: Verify in Hex Editor

1. Open ROM in hex editor
2. Navigate to calculated ROM offset
3. Verify data looks correct (graphics = pattern, compressed = high entropy)

## 📊 Common DMA Destinations

| Destination | B-Bus Addr | Purpose |
|-------------|------------|---------|
| VRAM Low | $18 | Video tile data |
| VRAM High | $19 | Video tile data |
| CGRAM | $22 | Palette data |
| OAM | $04 | Sprite attributes |
| APUIO | $40-$43 | Audio transfer |

## 📝 DMA Log Template

```markdown
## DMA Transfer Log

**Event:** [What triggered this transfer]
**Timestamp:** [Frame count or in-game state]

### Channel 0
- Mode: $__
- Source: $______
- Destination: $__ ([name])
- Size: $____
- Purpose: [What data is being transferred]

### ROM Mapping
- SNES Address: $______
- ROM Offset: $______
- Data Type: [Graphics/Audio/Script/etc.]
```

## 🎮 Game-Specific Notes

### DQ3r SNES

Common DMA patterns:
- Battle init: Monster sprites to VRAM
- Spell cast: Effect tiles to VRAM
- Map transition: Tileset to VRAM
- Dialog: Font tiles to VRAM

### DW4 NES

NES doesn't have DMA in the same sense - uses PPU writes or OAM DMA ($4014).

## ⚠️ Gotchas

### Decompressed Data
- DMA source may be RAM, not ROM
- Look for decompression routine BEFORE the DMA
- Set breakpoint on RAM area writes

### Double-Buffered Transfers
- Some games transfer to RAM first
- Then DMA from RAM to VRAM
- May need to trace backwards

### HDMA
- HDMA (channels 0-7) transfers during scanlines
- Used for effects like gradients, wavy backgrounds
- Controlled by $420C, not $420B

## 🔗 Related Guides

- [VRAM Analysis](vram-analysis.md) - Analyze VRAM contents
- [DQ3r Animation Extraction](dq3r-animation-extraction.md) - Full extraction workflow
