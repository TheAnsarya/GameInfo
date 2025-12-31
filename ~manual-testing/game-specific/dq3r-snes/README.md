# DQ3r SNES - Debugging Notes

Dragon Quest III SNES-specific debugging documentation.

## 📋 Quick Reference

### ROM Info
- **Platform**: Super Nintendo (SNES)
- **Region**: Japan (with fan translation available)
- **Size**: 4MB (32Mbit)
- **Mapper**: HiROM
- **Checksum**: [varies by version]

### Key ROM Regions

| Address (ROM) | Address (SNES) | Size | Contents |
|---------------|----------------|------|----------|
| $000000 | $C00000 | 128KB | Code Bank 0 |
| $020000 | $C20000 | 128KB | Code Bank 1 |
| $220000 | $C40000 | 128KB | Monster Graphics |
| $240000 | $C80000 | ~64KB | Battle BG Tiles |
| TBD | TBD | ~96KB | Spell Effect Tiles |

### Key RAM Addresses

| Address | Size | Description |
|---------|------|-------------|
| $7E0000-$7E1FFF | 8KB | Direct Page / Stack |
| $7E2000-$7EFFFF | ~56KB | Work RAM |
| $7F0000-$7FFFFF | 64KB | Extended RAM |

## 🔬 Debugging Sessions

### Session Log

| Date | Focus | Findings | Link |
|------|-------|----------|------|
| TBD | Battle animations | TBD | [breakpoint-log.md](breakpoint-log.md) |

## 📍 Known Breakpoints

### Battle System

```
; Battle initialization
TBD

; Spell cast handler
TBD

; Animation player
TBD
```

### Graphics Loading

```
; Monster sprite DMA
TBD

; Spell effect DMA
TBD
```

## 📊 Data Structures

See [structures.md](structures.md) for detailed format documentation.

### Monster Data (Summary)
- 155 monsters total
- Variable sprite sizes (16x16 to 64x64)
- Palette indices 0-7

### Spell Data (Summary)
- ~100 spells total
- Animation IDs in spell table
- Effect tiles loaded dynamically

## 🔗 Related Documentation

- [Technical Reference](../../../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/reference/technical/)
- [Battle Animations](../../../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/reference/technical/battle-animations.md)
- [Animation Extraction Guide](../../breakpoint-guides/dq3r-animation-extraction.md)
