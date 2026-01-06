# Disassembly Guide

Guide to creating and maintaining ROM disassemblies.

## Overview

A disassembly converts binary ROM data back to human-readable assembly source code that can be:
- Studied for reverse engineering
- Modified for ROM hacks
- Reassembled to create identical or modified ROMs

## Disassembly Tools

### Supported Assemblers

| Assembler | Platform | Features |
|-----------|----------|----------|
| [ca65](https://cc65.github.io) | NES, SNES | Feature-rich, standard |
| [bass](https://byuu.org/bass) | SNES | Accurate, simple |
| [Ophis](https://michaelcmartin.github.io/Ophis) | NES, 6502 | Python-based |
| [asar](https://github.com/RPGHacker/asar) | SNES | ROM hacking focus |

### GameInfo Disassembly Tools

```bash
# Generate initial disassembly
python tools/disasm/disassemble.py game.nes --output src/

# Update disassembly with new labels
python tools/disasm/update_labels.py src/ --labels labels.mlb

# Verify reassembly
python tools/verify_rom.py original.nes built.nes
```

## Disassembly Workflow

### Phase 1: Initial Setup

1. **Gather resources**
   - Original ROM file
   - Any existing documentation
   - CDL files from gameplay

2. **Create project structure**
   ```
   project/
   ├── src/              # Assembly source
   │   ├── main.asm      # Entry point
   │   ├── bank00.asm    # Bank 0 code
   │   └── ...
   ├── assets/           # Extracted data
   ├── build/            # Build output
   ├── docs/             # Documentation
   ├── roms/             # Original ROMs
   └── build.ps1         # Build script
   ```

3. **Extract data**
   ```bash
   python tools/extract_assets.py game.nes --output assets/
   ```

### Phase 2: Code Analysis

1. **Record CDL data**
   - Play through game in debug emulator
   - Record CDL to identify code vs data

2. **Import CDL**
   ```bash
   python tools/analyze_cdl.py import game.cdl --format mesen
   ```

3. **Generate initial disassembly**
   ```bash
   python tools/disasm/disassemble.py game.nes \
       --cdl game.cdl \
       --output src/
   ```

### Phase 3: Labeling

1. **Identify known routines**
   - NMI handler
   - Reset vector
   - IRQ handler
   - Main game loop

2. **Add labels**
   ```asm
   ; Common label conventions
   NMI_Handler:        ; Interrupt handler
   Reset:              ; Reset vector
   MainLoop:           ; Main game loop
   ReadController:     ; Subroutine
   PlayerX:            ; RAM variable
   TileData:           ; ROM data table
   ```

3. **Export/import labels**
   ```bash
   # Export from Mesen
   # Debug → Label Manager → Export
   
   # Import to disassembly
   python tools/disasm/update_labels.py src/ --labels game.mlb
   ```

### Phase 4: Documentation

1. **Comment code**
   ```asm
   ; Read controller input
   ; Returns: A = button state
   ReadController:
       LDA $4016       ; Read controller port
       AND #$01        ; Mask button bit
       RTS
   ```

2. **Document data structures**
   ```asm
   ; Monster data structure (8 bytes per entry)
   ; Offset 0: HP (2 bytes)
   ; Offset 2: Attack
   ; Offset 3: Defense
   ; Offset 4: Experience (2 bytes)
   ; Offset 6: Gold (2 bytes)
   MonsterTable:
       .word $0064     ; HP = 100
       .byte $0A       ; Attack = 10
       .byte $05       ; Defense = 5
       .word $001E     ; Exp = 30
       .word $000A     ; Gold = 10
   ```

3. **Create documentation files**
   - Memory maps
   - Data structure definitions
   - System descriptions

### Phase 5: Build System

1. **Create build script**
   ```powershell
   # build.ps1
   param([switch]$Clean)
   
   if ($Clean) {
       Remove-Item build/* -Recurse -Force
   }
   
   # Assemble source
   ca65 src/main.asm -o build/main.o
   
   # Link
   ld65 -C config.cfg -o build/game.nes build/main.o
   
   # Verify
   python tools/verify_rom.py roms/original.nes build/game.nes
   ```

2. **Create linker config**
   ```
   # config.cfg - NES linker configuration
   MEMORY {
       ZP:     start = $00,    size = $100,  type = rw;
       RAM:    start = $0200,  size = $600,  type = rw;
       PRG:    start = $8000,  size = $8000, type = ro, file = %O;
   }
   
   SEGMENTS {
       ZEROPAGE: load = ZP,  type = zp;
       BSS:      load = RAM, type = bss;
       CODE:     load = PRG, type = ro;
       RODATA:   load = PRG, type = ro;
   }
   ```

### Phase 6: Verification

1. **Binary comparison**
   ```bash
   python tools/verify_rom.py original.nes built.nes
   ```

2. **Test in emulator**
   - Load built ROM
   - Play through key areas
   - Verify behavior matches

3. **Track coverage**
   ```bash
   python tools/disasm/coverage.py src/ --cdl game.cdl --report
   ```

## Assembly Style Guide

### Naming Conventions

```asm
; Labels: PascalCase for routines/data
MainGameLoop:
PlayerDataTable:

; Labels: CAPS for constants
SCREEN_WIDTH = 256
MAX_ENEMIES  = 8

; Labels: snake_case for local labels
.check_collision:
.update_position:

; Variables: camelCase or snake_case
playerHealth:
enemy_count:
```

### Code Formatting

```asm
; Indent instructions with tab
Label:
	LDA #$00
	STA Variable
	
; Align operands
	LDA #$00        ; Load zero
	LDX PlayerX     ; Get X position
	
; Group related code
; === Player Movement ===
UpdatePlayer:
	JSR ReadInput
	JSR MovePlayer
	RTS
```

### Comments

```asm
; File header
;===============================================
; Module: player.asm
; Description: Player movement and collision
; Author: [Name]
;===============================================

; Section headers
;-----------------------------------------------
; Movement Routines
;-----------------------------------------------

; Inline comments (align right)
	LDA $4016       ; Read controller port
	AND #$01        ; Mask button bit
```

## Common Patterns

### NES Reset Handler

```asm
Reset:
	SEI             ; Disable IRQs
	CLD             ; Clear decimal mode
	LDX #$40
	STX $4017       ; Disable APU frame IRQ
	LDX #$FF
	TXS             ; Set up stack
	INX             ; X = 0
	STX $2000       ; Disable NMI
	STX $2001       ; Disable rendering
	STX $4010       ; Disable DMC IRQs
	
	; Wait for PPU
	BIT $2002
:	BIT $2002
	BPL :-
	
	; Clear RAM
	LDA #$00
:	STA $0000,X
	STA $0100,X
	STA $0200,X
	; ...
	INX
	BNE :-
	
	; Wait for PPU again
:	BIT $2002
	BPL :-
	
	; Initialize game
	JMP Main
```

### SNES Reset Handler

```asm
Reset:
	SEI             ; Disable interrupts
	CLC
	XCE             ; Switch to native mode
	REP #$30        ; 16-bit A,X,Y
	
	LDA #$0000
	TCD             ; Direct page = 0
	
	LDA #$01FF
	TCS             ; Stack at $01FF
	
	SEP #$20        ; 8-bit A
	
	; Initialize hardware
	JSR InitPPU
	JSR InitAPU
	
	JMP Main
```

## See Also

- [Analysis Tools](analysis-tools.md) - ROM analysis
- [Label Tools](label-tools.md) - Label management
- [CDL Tools](cdl-tools.md) - Code/Data logging
