# Robotrek Disassembly Notes

## References

- [Data Crystal ROM Map](https://datacrystal.tcrf.net/wiki/Robotrek/ROM_map) - Comprehensive ROM structure
- [Data Crystal RAM Map](https://datacrystal.tcrf.net/wiki/Robotrek/RAM_map) - SRAM save format

## ROM Structure

### Key Information

| Property | Value |
|----------|-------|
| Internal Name | ROBOTREK 1 USA |
| Developer | Quintet / Ancient |
| Publisher | Enix |
| Compression | Quintet LZSS |
| ROM Size | 1.5 MB ($180000) |
| SRAM | 8 KB |
| Mapper | HiROM + FastROM |
| Checksum | $6d44 |
| CRC32 | 7AD4AADC |

### Verified Addresses

| Type | ROM Offset | SNES Address | Description |
|------|-----------|--------------|-------------|
| Item Names (script) | $01e413 | $c1e413 | CC-separated strings, 98 entries |
| Item Names (menu) | $01f8a0 | $c1f8a0 | Null-separated, 8-byte aligned |
| Enemy Name Pointers | $01fd00 | $c1fd00 | 16-bit pointer table |
| Enemy Names | $01fdbe | $c1fdbe | Null-terminated strings, 58 entries |
| Font Graphics | $80000 | $d08000 | 2BPP GameBoy format (uncompressed) |
| Map Metadata | $d8000 | $db8000 | Map structure data |
| Inventory Graphics | $d9310 | $db9310 | Menu graphics (uncompressed) |

### Interrupt Vectors (at $ffe0)

| Vector | Address | Description |
|--------|---------|-------------|
| RESET | $8000 | Game entry point |
| NMI_native | $800d | VBlank interrupt (JML $8bfb43) |
| IRQ_native | $8011 | IRQ interrupt (JML $8bfbc8) |
| COP_native | $8015 | COP handler (JML $809ee8) |
| BRK_native | $8019 | BRK handler (JML $8bfbc9) |

### Bank Analysis (JSL Destinations)

Most frequently called banks:
| Bank | Calls | Likely Purpose |
|------|-------|----------------|
| $02 | 632 | Data/Library routines |
| $80 | 399 | Core system routines |
| $84 | 343 | Main game logic |
| $88 | 281 | Secondary systems |
| $8a | 214 | Additional game code |
| $8b | 97 | Interrupt handlers |

### Reset Sequence Analysis

```asm
$c08000: SEI          ; Disable interrupts
$c08001: CLC          ; Switch to native mode
$c08002: XCE          ; 
$c08003: STZ $420b    ; Disable DMA
$c08006: STZ $420c    ; Disable HDMA
$c08009: JML $80801d  ; Jump to main initialization
```

### Main Loop

Located at $c0803d-$c08049:
```asm
$c0803d: JSL $8081fc  ; Frame processing
$c08041: JSL $848000  ; Main game update
$c08045: JSL $808199  ; Post-frame
$c08049: BRA $803d    ; Loop
```

## Code Organization

### Bank $80 ($c0xxxx in HiROM)
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

### Bank $8a
- Additional game code
- TBD: Need further analysis

### Bank $8b
- Interrupt handlers (NMI, IRQ, BRK)
- VBlank processing

## Next Steps

1. **Decompress LZSS data** - Implement Quintet LZSS decompressor to access:
   - Graphics
   - Map tilesets
   - Map arrangements

2. **Locate item/enemy stats tables** - Names found, but stats (HP, Power, Guard) need research

3. **Map RAM variables** - Find working RAM addresses for:
   - Current battle state
   - Active menu/dialog
   - Player position in real-time

4. **Disassemble battle damage formula** - Core battle calculation

5. **Research invention system** - Recipe format and crafting logic

6. **Extract music** - Sequence data at known offsets (see ROM Map)

## Music Track Locations (from Data Crystal)

| Offset | Track Name |
|--------|------------|
| $0296b | Robots vs. Hackers |
| $02eeb | Count Prinky's Mansion |
| $039a9 | Super Robot Battle! |
| $05879 | Futuristic World in Peril |
| $07a69 | The World of Quintenix |
| $10d21 | Hometown in Autumn |
| $1264e | Music Box of Memories |
| $efad5 | Gateau ~ Master of Time |
| $14848e | Staff Roll |
| $14f2ee | Beyond the Stars! |
| $17f054 | Tropical Paradise |

## SRAM Save Structure (from Data Crystal)

3 save slots + 3 backup slots, each 1280 bytes ($500):

| Offset | Size | Description |
|--------|------|-------------|
| $0000 | 144 | Inventory (72 slots × 2 bytes) |
| $0302 | 1 | Player Facing Direction |
| $0303 | 2 | Player X Position |
| $0305 | 2 | Player Y Position |
| $0312 | 7 | Player Name |
| $031e | 7 | Robot 1 Name |
| $0325 | 7 | Robot 2 Name |
| $0336 | 7 | Robot 3 Name |
| $0388 | 2 | Program Points |
| $038a | 6 | Robot Current HP (×3) |
| $0390 | 6 | Robot Max HP (×3) |
| $0396 | 6 | Robot Power (×3) |
| $039c | 6 | Robot Guard (×3) |
| $03a2 | 6 | Robot Speed (×3) |
| $03a8 | 6 | Robot Charge (×3) |
| $03e9 | 3 | GP (Gold) |
| $04fa | 4 | Checksum |
