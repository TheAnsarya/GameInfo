# Atari 2600 ROM Analysis

This document provides comprehensive analysis of Atari 2600 ROM formats, bank switching detection, and disassembly techniques using the Good2600 v3.14 ROM collection.

## ROM Collection Overview

The Good2600 v3.14 collection contains thousands of Atari 2600 ROMs including:
- Original commercial releases
- Homebrew games
- Hacks and modifications
- Prototypes
- Demos

### ROM Naming Convention

Filenames follow the No-Intro/GoodTools convention:
```
Game Title (Year) (Publisher) (Region) [Status].a26
```

Examples:
- `Adventure (1979) (Atari) [!].a26` - Verified good dump
- `Ms. Pac-Man (1982) (Atari) (PAL) [!].a26` - PAL region, verified
- `Pitfall II - Lost Caverns (1984) (Activision) [!].a26` - Official release

Flags:
- `[!]` - Verified good dump
- `[b1]`, `[b2]` - Bad dumps (different versions)
- `[a1]`, `[a2]` - Alternative versions
- `[h1]`, `[h2]` - Hacked versions
- `[o1]`, `[o2]` - Overdumps
- `[t1]`, `[t2]` - Trained versions (cheats)
- `[f1]`, `[f2]` - Fixed versions
- `[p1]`, `[p2]` - Pirate versions

## ROM Sizes and Bank Switching

### Common ROM Sizes

| Size | Description | Bank Switching | Examples |
|------|-------------|----------------|----------|
| 2KB  | 2048 bytes  | None           | Combat, Air-Sea Battle |
| 4KB  | 4096 bytes  | None           | Adventure, Pitfall!, River Raid II |
| 8KB  | 8192 bytes  | F8 (2×4KB)     | Ms. Pac-Man, Asteroids, Space Invaders |
| 16KB | 16384 bytes | F6 (4×4KB)     | Crystal Castles, Millipede |
| 32KB | 32768 bytes | F4 (8×4KB)     | Fatal Run |
| 10KB | 10495 bytes | F8+DPC         | Pitfall II (with DPC audio chip) |

### Bank Switching Detection

Peony automatically detects bank switching schemes based on:
1. **ROM size** - 2K/4K have no banking, 8K+ usually do
2. **Reset vector** - Location of entry point
3. **Bank switching patterns** - Access to hotspots ($1ff8-$1fff)

Detection algorithm:
```
if size ≤ 4096:
	mapper = None
elif size == 8192:
	mapper = F8  # 2 banks × 4KB
elif size == 16384:
	mapper = F6  # 4 banks × 4KB
elif size == 32768:
	mapper = F4  # 8 banks × 4KB
else:
	mapper = Detect from hotspot access patterns
```

## Testing Results

### Test ROMs

| ROM | Size | Mapper | Banks | Entry Points | Blocks Disassembled |
|-----|------|--------|-------|--------------|---------------------|
| Adventure - Odyssey 2600 (Adventure Hack).a26 | 4KB | None | 1 | $f000 | 88 |
| Ms. Pac-Man (1982) (Atari) (PAL) [!].a26 | 8KB | F8 | 2 | $f000, $ffee | TBD |
| Pitfall II - Lost Caverns (1984) (Activision) [!].a26 | 10KB | F8+DPC | 2 | $60b0, $80c0 | 0 (bug) |

### Known Issues

1. **Banked ROM Entry Points**: Pitfall II shows 0 blocks disassembled
   - Entry points: $60b0, $80c0 (unusual addresses)
   - F8 mapper with DPC audio chip complicates disassembly
   - Need to implement proper bank traversal

2. **Multi-bank Disassembly**: `--all-banks` option needs testing
   - Should disassemble all banks separately
   - Track bank switching instructions
   - Handle cross-bank calls

## Bank Switching Schemes

### F8 (8KB, 2 banks)

**Hotspots:**
- Read from $1ff8 → Switch to bank 0
- Read from $1ff9 → Switch to bank 1

**Memory Map:**
```
$f000-$ffff: Banked ROM (4KB window)
  Bank 0: $1ff8 access
  Bank 1: $1ff9 access
```

**Disassembly Strategy:**
1. Start at reset vector (usually $f000 in last bank)
2. Trace code flow across banks
3. Detect bank switches via hotspot reads
4. Mark cross-bank calls

### F6 (16KB, 4 banks)

**Hotspots:**
- $1ff6 → Bank 0
- $1ff7 → Bank 1
- $1ff8 → Bank 2
- $1ff9 → Bank 3

### F4 (32KB, 8 banks)

**Hotspots:**
- $1ff4 → Bank 0
- $1ff5 → Bank 1
- $1ff6 → Bank 2
- $1ff7 → Bank 3
- $1ff8 → Bank 4
- $1ff9 → Bank 5
- $1ffa → Bank 6
- $1ffb → Bank 7

### Special Cases

**DPC (Pitfall II):**
- Custom audio/graphics coprocessor
- Additional registers at $0050-$007f
- Complex data fetch from ROM
- Requires special handling

**3F (Tigervision):**
- Writes to $003f to select bank
- Used in Espial, Polaris, etc.

**E0 (Parker Bros):**
- 8KB ROM split into 4×2KB slices
- Complex hotspot mapping
- Used in Montezuma's Revenge, Gyruss

## ROM Header Analysis

Atari 2600 ROMs have no standard header. The only reliable markers are:

1. **Reset Vector** at $fffc-$fffd (last 2 bytes)
2. **IRQ/BRK Vector** at $fffe-$ffff
3. **Typical patterns**:
   - Reset vector usually points to $fxxx range
   - Common start: $f000, $f800, $1000

Example (Adventure):
```
Offset $0ffe-$0fff: [$00, $f0] → Reset vector = $f000
```

## Disassembly Workflow

### 1. ROM Identification
```bash
dotnet run --project src/Peony.Cli -- info "rom.a26"
```

Output shows:
- Size and bank configuration
- Detected mapper
- Entry points

### 2. Disassembly
```bash
dotnet run --project src/Peony.Cli -- disasm "rom.a26" \
  -o "output.asm" \
  --all-banks
```

### 3. Symbol Export
```bash
dotnet run --project src/Peony.Cli -- export "rom.a26" \
  -f mesen \
  -o "symbols.mlb"
```

Supported formats:
- MAME (.sym)
- FCEUX (.nl)
- Mesen (.mlb)
- BizHawk (.sym)
- JSON

### 4. Verification
```bash
dotnet run --project src/Peony.Cli -- verify "original.a26" \
  --assembled "rebuilt.bin"
```

## Analysis Tools Integration

### Stella Debugger
Export symbols for use in Stella emulator:
```bash
peony export rom.a26 -f stella -o rom.sym
```

### Distella
Compare Peony output with Distella (classic disassembler):
```bash
distella rom.a26 > distella.asm
peony disasm rom.a26 -o peony.asm
diff distella.asm peony.asm
```

### DiztinGUIsh Integration
Load Peony-generated DIZ project:
```bash
peony disasm rom.a26 --format diz -o rom.diz
```

## Common Patterns

### Initialization Sequence
```asm
reset:
	sei                  ; Disable interrupts
	cld                  ; Clear decimal mode
	ldx #$ff             ; Initialize stack pointer
	txs
	lda #$00
	tax
.clear_loop:
	sta $00,x            ; Clear zero page
	dex
	bne .clear_loop
```

### VSYNC/VBLANK Routine
```asm
vertical_sync:
	lda #$02
	sta VSYNC            ; Start VSYNC
	sta WSYNC            ; Wait 3 scanlines
	sta WSYNC
	sta WSYNC
	lda #$00
	sta VSYNC            ; End VSYNC
	lda #$2c
	sta TIM64T           ; Set VBLANK timer (37 scanlines)
.wait_vblank:
	lda INTIM
	bne .wait_vblank
	sta VBLANK           ; Turn off VBLANK
```

### Sprite Positioning
```asm
position_player:
	sta WSYNC            ; Start new scanline
	sec
	lda horizontal_pos   ; Desired position (0-159)
.div_loop:
	sbc #15              ; Divide by 15
	bcs .div_loop
	eor #$07
	asl
	asl
	asl
	asl
	sta HMP0             ; Fine positioning
	sta RESP0            ; Coarse positioning
	sta WSYNC
	sta HMOVE            ; Apply fine positioning
```

## Statistics

From Good2600 v3.14 collection:

- **Total ROMs**: ~3000+
- **2KB ROMs**: ~500 (no banking)
- **4KB ROMs**: ~1200 (no banking)
- **8KB ROMs**: ~800 (F8 banking)
- **16KB+ ROMs**: ~300 (F6/F4/E0/3F banking)
- **Special chip ROMs**: ~20 (DPC, ARM, etc.)

## References

- [Atari 2600 Programming Guide](https://www.ataricompendium.com/game_library/programming/2600_programming.html)
- [Stella Programmer's Guide](http://atarihq.com/danb/files/stella.pdf)
- [Bank Switching Information](https://problemkaputt.de/2k6specs.htm)
- [Atari 2600 Mappers](https://wiki.nesdev.org/w/index.php/Mapper)
- [DiztinGUIsh Documentation](https://github.com/DizTools/DiztinGUIsh/wiki)

