# 🕹️ Atari 2600 Disassembly Initiative

> Comprehensive disassembly of 40+ classic Atari 2600 games
> **Version:** 1.0.0
> **Created:** 2026-01-16

---

## 📋 Overview

This initiative aims to create high-quality, well-documented disassemblies of 40+ classic Atari 2600 games using the **Peony** disassembler and **Poppy** assembler toolchain.

### ROM Source
- **Collection:** Good2600 v3.14
- **Location:** `~roms/Good2600 v3.14/`
- **Total ROMs:** 7,204 files
- **Target:** 40 classic games

---

## 🎮 Target Games (40)

### Tier 1: Priority Classics (15 games)

| # | Game | Publisher | Year | Size | Banked |
|---|------|-----------|------|------|--------|
| 1 | Adventure | Atari | 1979 | 4K | No |
| 2 | Asteroids | Atari | 1981 | 8K | Yes |
| 3 | Combat | Atari | 1977 | 2K | No |
| 4 | Defender | Atari | 1982 | 4K | No |
| 5 | Donkey Kong | Coleco | 1982 | 4K | No |
| 6 | E.T. | Atari | 1982 | 8K | Yes |
| 7 | Frogger | Parker Bros | 1982 | 4K | No |
| 8 | Missile Command | Atari | 1981 | 4K | No |
| 9 | Ms. Pac-Man | Atari | 1982 | 8K | Yes |
| 10 | Pac-Man | Atari | 1981 | 4K | No |
| 11 | Pitfall! | Activision | 1982 | 4K | No |
| 12 | Q*bert | Parker Bros | 1983 | 4K | No |
| 13 | River Raid | Activision | 1982 | 4K | No |
| 14 | Space Invaders | Atari | 1978 | 4K | No |
| 15 | Yars' Revenge | Atari | 1981 | 4K | No |

### Tier 2: Important Titles (15 games)

| # | Game | Publisher | Year | Size | Banked |
|---|------|-----------|------|------|--------|
| 16 | Berzerk | Atari | 1982 | 4K | No |
| 17 | Breakout | Atari | 1978 | 2K | No |
| 18 | Centipede | Atari | 1982 | 8K | Yes |
| 19 | Demon Attack | Imagic | 1982 | 4K | No |
| 20 | Dig Dug | Atari | 1983 | 8K | Yes |
| 21 | Galaxian | Atari | 1983 | 4K | No |
| 22 | Haunted House | Atari | 1981 | 4K | No |
| 23 | Joust | Atari | 1983 | 8K | Yes |
| 24 | Kaboom! | Activision | 1981 | 2K | No |
| 25 | Keystone Kapers | Activision | 1983 | 4K | No |
| 26 | Megamania | Activision | 1982 | 4K | No |
| 27 | Moon Patrol | Atari | 1983 | 8K | Yes |
| 28 | Pitfall II | Activision | 1984 | 10K | Yes |
| 29 | Pole Position | Atari | 1983 | 8K | Yes |
| 30 | Robot Tank | Activision | 1983 | 8K | Yes |

### Tier 3: Additional Classics (10 games)

| # | Game | Publisher | Year | Size | Banked |
|---|------|-----------|------|------|--------|
| 31 | Phoenix | Atari | 1982 | 8K | Yes |
| 32 | Seaquest | Activision | 1983 | 4K | No |
| 33 | Solaris | Atari | 1986 | 16K | Yes |
| 34 | Spider Fighter | Activision | 1983 | 4K | No |
| 35 | Star Raiders | Atari | 1982 | 8K | Yes |
| 36 | Stargate | Atari | 1984 | 8K | Yes |
| 37 | Super Breakout | Atari | 1978 | 4K | No |
| 38 | Vanguard | Atari | 1982 | 8K | Yes |
| 39 | Warlords | Atari | 1981 | 4K | No |
| 40 | Jr. Pac-Man | Atari | 1984 | 16K | Yes |

---

## 📁 Directory Structure

### Location in GameInfo
```
GameInfo/Games/Atari2600/
├── README.md                    # Overview and index
├── _templates/                  # Templates for new disassemblies
│   ├── build.config.json
│   ├── main.pasm
│   └── README.md
│
├── Adventure/
│   ├── README.md                # Game documentation
│   ├── build.config.json        # Build configuration
│   ├── src/
│   │   ├── main.pasm            # Main assembly source
│   │   ├── constants.pasm       # TIA/RIOT constants
│   │   ├── variables.pasm       # RAM variables
│   │   ├── graphics.pasm        # Graphics data
│   │   ├── audio.pasm           # Audio data
│   │   └── data.pasm            # Game data tables
│   ├── docs/
│   │   ├── memory-map.md        # Memory map documentation
│   │   ├── routines.md          # Subroutine documentation
│   │   ├── graphics.md          # Graphics format docs
│   │   └── gameplay.md          # Gameplay mechanics
│   ├── assets/
│   │   ├── binary/              # Extracted binary assets
│   │   └── json/                # Editable JSON data
│   └── wiki/
│       └── ROM_Map.wikitext     # DarkRepos wiki page
│
├── Asteroids/
│   └── ... (same structure)
│
└── ... (38 more games)
```

---

## 🎯 Atari 2600 Architecture

### Memory Map

| Address | Size | Description |
|---------|------|-------------|
| $00-$7F | 128 bytes | TIA Write Registers |
| $00-$0F | 16 bytes | TIA Read Registers |
| $80-$FF | 128 bytes | RIOT RAM |
| $280-$29F | 32 bytes | RIOT Registers |
| $F000-$FFFF | 4K | ROM (standard) |

### TIA Write Registers ($00-$2C)

| Addr | Name | Description |
|------|------|-------------|
| $00 | VSYNC | Vertical Sync |
| $01 | VBLANK | Vertical Blank |
| $02 | WSYNC | Wait for Sync |
| $03 | RSYNC | Reset Sync |
| $04 | NUSIZ0 | Number-Size Player 0 |
| $05 | NUSIZ1 | Number-Size Player 1 |
| $06 | COLUP0 | Color Player 0 |
| $07 | COLUP1 | Color Player 1 |
| $08 | COLUPF | Color Playfield |
| $09 | COLUBK | Color Background |
| $0A | CTRLPF | Control Playfield |
| $0B | REFP0 | Reflect Player 0 |
| $0C | REFP1 | Reflect Player 1 |
| $0D | PF0 | Playfield 0 |
| $0E | PF1 | Playfield 1 |
| $0F | PF2 | Playfield 2 |
| $10 | RESP0 | Reset Player 0 |
| $11 | RESP1 | Reset Player 1 |
| $12 | RESM0 | Reset Missile 0 |
| $13 | RESM1 | Reset Missile 1 |
| $14 | RESBL | Reset Ball |
| $15 | AUDC0 | Audio Control 0 |
| $16 | AUDC1 | Audio Control 1 |
| $17 | AUDF0 | Audio Frequency 0 |
| $18 | AUDF1 | Audio Frequency 1 |
| $19 | AUDV0 | Audio Volume 0 |
| $1A | AUDV1 | Audio Volume 1 |
| $1B | GRP0 | Graphics Player 0 |
| $1C | GRP1 | Graphics Player 1 |
| $1D | ENAM0 | Enable Missile 0 |
| $1E | ENAM1 | Enable Missile 1 |
| $1F | ENABL | Enable Ball |
| $20 | HMP0 | H Motion Player 0 |
| $21 | HMP1 | H Motion Player 1 |
| $22 | HMM0 | H Motion Missile 0 |
| $23 | HMM1 | H Motion Missile 1 |
| $24 | HMBL | H Motion Ball |
| $25 | VDELP0 | V Delay Player 0 |
| $26 | VDELP1 | V Delay Player 1 |
| $27 | VDELBL | V Delay Ball |
| $28 | RESMP0 | Reset Missile 0 to Player 0 |
| $29 | RESMP1 | Reset Missile 1 to Player 1 |
| $2A | HMOVE | Apply H Motion |
| $2B | HMCLR | Clear H Motion |
| $2C | CXCLR | Clear Collision Latches |

### TIA Read Registers ($00-$0D)

| Addr | Name | Description |
|------|------|-------------|
| $00 | CXM0P | Collision M0-P |
| $01 | CXM1P | Collision M1-P |
| $02 | CXP0FB | Collision P0-PF-BL |
| $03 | CXP1FB | Collision P1-PF-BL |
| $04 | CXM0FB | Collision M0-PF-BL |
| $05 | CXM1FB | Collision M1-PF-BL |
| $06 | CXBLPF | Collision BL-PF |
| $07 | CXPPMM | Collision P-P M-M |
| $08 | INPT0 | Input Port 0 |
| $09 | INPT1 | Input Port 1 |
| $0A | INPT2 | Input Port 2 |
| $0B | INPT3 | Input Port 3 |
| $0C | INPT4 | Input Port 4 |
| $0D | INPT5 | Input Port 5 |

### RIOT Registers ($280-$297)

| Addr | Name | Description |
|------|------|-------------|
| $280 | SWCHA | Port A I/O (Joysticks) |
| $281 | SWACNT | Port A DDR |
| $282 | SWCHB | Port B I/O (Console Switches) |
| $283 | SWBCNT | Port B DDR |
| $284 | INTIM | Timer Output |
| $285 | TIMINT | Timer Interrupt |
| $294 | TIM1T | Set Timer /1 |
| $295 | TIM8T | Set Timer /8 |
| $296 | TIM64T | Set Timer /64 |
| $297 | T1024T | Set Timer /1024 |

---

## 🏗️ Standard Constants File

```pasm
; =============================================================================
; Atari 2600 Standard Constants
; For use with Poppy assembler
; =============================================================================

; -----------------------------------------------------------------------------
; TIA Write Registers
; -----------------------------------------------------------------------------
VSYNC   = $00   ; Vertical Sync
VBLANK  = $01   ; Vertical Blank
WSYNC   = $02   ; Wait for Sync
RSYNC   = $03   ; Reset Sync
NUSIZ0  = $04   ; Number-Size Player 0
NUSIZ1  = $05   ; Number-Size Player 1
COLUP0  = $06   ; Color Player 0
COLUP1  = $07   ; Color Player 1
COLUPF  = $08   ; Color Playfield
COLUBK  = $09   ; Color Background
CTRLPF  = $0a   ; Control Playfield
REFP0   = $0b   ; Reflect Player 0
REFP1   = $0c   ; Reflect Player 1
PF0     = $0d   ; Playfield 0
PF1     = $0e   ; Playfield 1
PF2     = $0f   ; Playfield 2
RESP0   = $10   ; Reset Player 0
RESP1   = $11   ; Reset Player 1
RESM0   = $12   ; Reset Missile 0
RESM1   = $13   ; Reset Missile 1
RESBL   = $14   ; Reset Ball
AUDC0   = $15   ; Audio Control 0
AUDC1   = $16   ; Audio Control 1
AUDF0   = $17   ; Audio Frequency 0
AUDF1   = $18   ; Audio Frequency 1
AUDV0   = $19   ; Audio Volume 0
AUDV1   = $1a   ; Audio Volume 1
GRP0    = $1b   ; Graphics Player 0
GRP1    = $1c   ; Graphics Player 1
ENAM0   = $1d   ; Enable Missile 0
ENAM1   = $1e   ; Enable Missile 1
ENABL   = $1f   ; Enable Ball
HMP0    = $20   ; H Motion Player 0
HMP1    = $21   ; H Motion Player 1
HMM0    = $22   ; H Motion Missile 0
HMM1    = $23   ; H Motion Missile 1
HMBL    = $24   ; H Motion Ball
VDELP0  = $25   ; V Delay Player 0
VDELP1  = $26   ; V Delay Player 1
VDELBL  = $27   ; V Delay Ball
RESMP0  = $28   ; Reset Missile 0 to Player 0
RESMP1  = $29   ; Reset Missile 1 to Player 1
HMOVE   = $2a   ; Apply H Motion
HMCLR   = $2b   ; Clear H Motion
CXCLR   = $2c   ; Clear Collision Latches

; -----------------------------------------------------------------------------
; TIA Read Registers
; -----------------------------------------------------------------------------
CXM0P   = $00   ; Collision M0-P
CXM1P   = $01   ; Collision M1-P
CXP0FB  = $02   ; Collision P0-PF-BL
CXP1FB  = $03   ; Collision P1-PF-BL
CXM0FB  = $04   ; Collision M0-PF-BL
CXM1FB  = $05   ; Collision M1-PF-BL
CXBLPF  = $06   ; Collision BL-PF
CXPPMM  = $07   ; Collision P-P M-M
INPT0   = $08   ; Input Port 0
INPT1   = $09   ; Input Port 1
INPT2   = $0a   ; Input Port 2
INPT3   = $0b   ; Input Port 3
INPT4   = $0c   ; Input Port 4
INPT5   = $0d   ; Input Port 5

; -----------------------------------------------------------------------------
; RIOT Registers
; -----------------------------------------------------------------------------
SWCHA   = $280  ; Port A I/O (Joysticks)
SWACNT  = $281  ; Port A DDR
SWCHB   = $282  ; Port B I/O (Console Switches)
SWBCNT  = $283  ; Port B DDR
INTIM   = $284  ; Timer Output
TIMINT  = $285  ; Timer Interrupt
TIM1T   = $294  ; Set Timer /1
TIM8T   = $295  ; Set Timer /8
TIM64T  = $296  ; Set Timer /64
T1024T  = $297  ; Set Timer /1024

; -----------------------------------------------------------------------------
; RAM
; -----------------------------------------------------------------------------
RAM_START = $80
RAM_END   = $ff
RAM_SIZE  = $80     ; 128 bytes

; -----------------------------------------------------------------------------
; ROM Vectors
; -----------------------------------------------------------------------------
RESET_VEC = $fffc
IRQ_VEC   = $fffe

; -----------------------------------------------------------------------------
; TV Constants
; -----------------------------------------------------------------------------
NTSC_SCANLINES = 262
PAL_SCANLINES  = 312
VBLANK_LINES   = 37
KERNEL_LINES   = 192
OVERSCAN_LINES = 30

; -----------------------------------------------------------------------------
; Controller Constants
; -----------------------------------------------------------------------------
JOY_UP    = $10
JOY_DOWN  = $20
JOY_LEFT  = $40
JOY_RIGHT = $80
JOY_FIRE  = $80     ; INPT4/INPT5 bit 7

; -----------------------------------------------------------------------------
; Console Switch Constants
; -----------------------------------------------------------------------------
SWITCH_RESET  = $01
SWITCH_SELECT = $02
SWITCH_BW     = $08
SWITCH_P0_PRO = $40
SWITCH_P1_PRO = $80
```

---

## 📝 Disassembly Template

```pasm
; =============================================================================
; [GAME NAME]
; Atari 2600 Disassembly
;
; Original: [Publisher] [Year]
; Disassembled: [Date]
; Assembler: Poppy
;
; This disassembly is for educational and preservation purposes.
; =============================================================================

.atari2600                          ; Target platform

.include "constants.pasm"           ; TIA/RIOT constants

; =============================================================================
; RAM Variables ($80-$FF)
; =============================================================================
.org $80

; Game state variables
; TODO: Document RAM usage

; =============================================================================
; ROM Start
; =============================================================================
.org $f000

; -----------------------------------------------------------------------------
; Entry Point
; -----------------------------------------------------------------------------
Reset:
	sei                             ; Disable interrupts
	cld                             ; Clear decimal mode
	ldx #$ff
	txs                             ; Initialize stack

	; Clear RAM
	lda #$00
@ClearRam:
	sta $00,x
	dex
	bne @ClearRam

; -----------------------------------------------------------------------------
; Main Loop
; -----------------------------------------------------------------------------
MainLoop:
	; VSYNC (3 scanlines)
	lda #$02
	sta VSYNC
	sta WSYNC
	sta WSYNC
	sta WSYNC
	lda #$00
	sta VSYNC

	; VBLANK (37 scanlines)
	lda #$02
	sta VBLANK
	; TODO: Game logic during VBLANK

	; Kernel (192 scanlines)
	lda #$00
	sta VBLANK
	; TODO: Display kernel

	; Overscan (30 scanlines)
	lda #$02
	sta VBLANK
	; TODO: Additional game logic

	jmp MainLoop

; =============================================================================
; Subroutines
; =============================================================================

; TODO: Document subroutines

; =============================================================================
; Data Tables
; =============================================================================

; TODO: Graphics, audio, game data

; =============================================================================
; Vectors
; =============================================================================
.org $fffc

.word Reset                         ; Reset vector
.word Reset                         ; IRQ vector (usually same as reset)
```

---

## 🔧 Bank Switching Support

### Mapper Types

| Type | Size | Banks | Switch Address |
|------|------|-------|----------------|
| F8 | 8K | 2 × 4K | $1FF8-$1FF9 |
| F6 | 16K | 4 × 4K | $1FF6-$1FF9 |
| F4 | 32K | 8 × 4K | $1FF4-$1FFB |
| FE | 8K | 2 × 4K | $01FE (on JSR/RTS) |
| E0 | 8K | 8 × 1K | $1FE0-$1FF8 |
| 3F | 8K+ | 2K banks | $003F |
| FA | 12K | 3 × 4K | $1FF8-$1FFA |
| E7 | 16K | 8 × 2K | $1FE0-$1FE7 |

### F8 Bankswitching Example

```pasm
; =============================================================================
; 8K ROM with F8 Bankswitching
; =============================================================================

.atari2600
.mapper F8                          ; 8K F8 bankswitching

; Bank 0 ($1000-$1FFF, appears at $F000-$FFFF)
.bank 0
.org $f000

Bank0Code:
	; Code for bank 0
	; ...
	
	; Switch to bank 1
	sta $1ff9
	jmp Bank1Code

.org $fff8
.byte $ff, $ff                      ; Bank switch triggers
.word Reset                         ; Reset
.word Reset                         ; IRQ

; Bank 1 ($1000-$1FFF, appears at $F000-$FFFF)
.bank 1
.org $f000

Bank1Code:
	; Code for bank 1
	; ...
	
	; Switch to bank 0
	sta $1ff8
	jmp Bank0Code

.org $fff8
.byte $ff, $ff
.word Reset
.word Reset
```

---

## ✅ Per-Game Checklist

For each game, complete the following:

- [ ] Obtain clean ROM file
- [ ] Create directory structure
- [ ] Initial disassembly with Peony
- [ ] Identify all entry points and vectors
- [ ] Map RAM variables
- [ ] Document TIA register usage
- [ ] Identify display kernel type
- [ ] Label all subroutines
- [ ] Document graphics data format
- [ ] Document audio data format
- [ ] Document game data tables
- [ ] Verify roundtrip (reassembly = original)
- [ ] Write memory map documentation
- [ ] Write subroutine documentation
- [ ] Create DarkRepos wiki page
- [ ] Final review and polish

---

## 📊 Progress Tracking

| Game | Peony | Labels | Docs | Wiki | Status |
|------|-------|--------|------|------|--------|
| Adventure | ⬜ | ⬜ | ⬜ | ⬜ | Not Started |
| Asteroids | ⬜ | ⬜ | ⬜ | ⬜ | Not Started |
| Combat | ⬜ | ⬜ | ⬜ | ⬜ | Not Started |
| ... | ... | ... | ... | ... | ... |

Legend: ⬜ Not Started | 🔄 In Progress | ✅ Complete

---

*Last Updated: 2026-01-16*
