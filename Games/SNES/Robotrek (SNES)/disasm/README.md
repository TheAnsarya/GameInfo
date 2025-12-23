# Robotrek Disassembly Notes

## ROM Structure

### Verified Addresses

| Type | ROM Offset | SNES Address | Description |
|------|-----------|--------------|-------------|
| Item Names (script) | $01E413 | $C1E413 | CC-separated strings, 98 entries |
| Item Names (menu) | $01F8A0 | $C1F8A0 | Null-separated, 8-byte aligned |
| Enemy Name Pointers | $01FD00 | $C1FD00 | 16-bit pointer table |
| Enemy Names | $01FDBE | $C1FDBE | Null-terminated strings, 58 entries |

### Interrupt Vectors (at $FFE0)

| Vector | Address | Description |
|--------|---------|-------------|
| RESET | $8000 | Game entry point |
| NMI_native | $800D | VBlank interrupt (JML $8BFB43) |
| IRQ_native | $8011 | IRQ interrupt (JML $8BFBC8) |
| COP_native | $8015 | COP handler (JML $809EE8) |
| BRK_native | $8019 | BRK handler (JML $8BFBC9) |

### Bank Analysis (JSL Destinations)

Most frequently called banks:
| Bank | Calls | Likely Purpose |
|------|-------|----------------|
| $02 | 632 | Data/Library routines |
| $80 | 399 | Core system routines |
| $84 | 343 | Main game logic |
| $88 | 281 | Secondary systems |
| $8A | 214 | Additional game code |
| $8B | 97 | Interrupt handlers |

### Reset Sequence Analysis

```asm
$C08000: SEI          ; Disable interrupts
$C08001: CLC          ; Switch to native mode
$C08002: XCE          ; 
$C08003: STZ $420B    ; Disable DMA
$C08006: STZ $420C    ; Disable HDMA
$C08009: JML $80801D  ; Jump to main initialization
```

### Main Loop

Located at $C0803D-$C08049:
```asm
$C0803D: JSL $8081FC  ; Frame processing
$C08041: JSL $848000  ; Main game update
$C08045: JSL $808199  ; Post-frame
$C08049: BRA $803D    ; Loop
```

## Code Organization

### Bank $80 ($C0xxxx in HiROM)
- System initialization
- Main loop
- Core subroutines
- Interrupt vector handlers

### Bank $84
- Main game logic
- State machine
- Scene management

### Bank $88
- Secondary game systems
- TBD: Need further analysis

### Bank $8A
- Additional game code
- TBD: Need further analysis

### Bank $8B
- Interrupt handlers (NMI, IRQ, BRK)
- VBlank processing

## Next Steps

1. **Map RAM usage** - Find key variables for:
   - Player stats
   - Robot data
   - Inventory
   - Battle state

2. **Identify data tables** - Locate:
   - Item stats (power, guard, etc.)
   - Enemy stats (HP, attack, etc.)
   - Invention recipes

3. **Battle system** - Analyze:
   - Damage calculation
   - Turn order
   - AI routines

4. **Compression** - Identify format for:
   - Graphics
   - Text/dialog
   - Map data
