# DW4 NES - Debugging Notes

Dragon Warrior IV NES-specific debugging documentation.

## 📋 Quick Reference

### ROM Info
- **Platform**: Nintendo Entertainment System (NES)
- **Region**: USA
- **Size**: 512KB (4Mbit)
- **Mapper**: MMC3 (iNES Mapper 4)
- **PRG**: 512KB
- **CHR**: 256KB (RAM)

### Key ROM Regions

| Address (ROM) | Bank | Size | Contents |
|---------------|------|------|----------|
| $00000 | 0-1 | 32KB | Code (fixed?) |
| $08000 | 2-3 | 32KB | Code |
| $10000 | 4-5 | 32KB | Data/Code |
| ... | ... | ... | ... |
| $70000 | 28-29 | 32KB | Monster data |
| $78000 | 30-31 | 32KB | Experience tables |

### Key RAM Addresses

| Address | Size | Description |
|---------|------|-------------|
| $0000-$00FF | 256B | Zero Page |
| $0100-$01FF | 256B | Stack |
| $0200-$02FF | 256B | OAM buffer |
| $0300-$07FF | 1.25KB | Work RAM |
| $6000-$7FFF | 8KB | PRG-RAM (save) |

## 🔬 Debugging Sessions

### Session Log

| Date | Focus | Findings | Link |
|------|-------|----------|------|
| 2024-12-30 | Monster tables | Found at Bank 27 | See DW4Lib |
| 2024-12-30 | EXP tables | Found at Bank 27 | See DW4Lib |

## 📍 Known Breakpoints

### Battle System

```
; Battle initialization
$8000 (varies by bank)

; Monster stat lookup
Bank 27, varies
```

### Data Access

```
; EXP table read
Bank 27
```

## 📊 Data Structures

### Monster Table
- 256 monsters max
- 32 bytes per entry
- Located in Bank 27

### Experience Table
- Per-class tables
- 99 levels
- Variable byte encoding

## 🔧 Tools

- **DW4Lib** (C#): Monster/EXP extraction tools
- **Ophis**: NES assembler for disassembly
- **FCEUX**: NES debugger

## 🔗 Related Documentation

- [DW4Lib Source](../../../logsmall/DW4Lib/)
- [Dragon Warrior IV Info Repo](../../../dragon-warrior-4-info/)
