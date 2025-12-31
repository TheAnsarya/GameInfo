# FFMQ SNES - Debugging Notes

Final Fantasy Mystic Quest SNES-specific debugging documentation.

## 📋 Quick Reference

### ROM Info
- **Platform**: Super Nintendo (SNES)
- **Region**: USA
- **Size**: 1MB (8Mbit)
- **Mapper**: LoROM
- **Checksum**: [standard retail]

### Key ROM Regions

| Address (ROM) | Address (SNES) | Size | Contents |
|---------------|----------------|------|----------|
| $000000 | $008000 | 32KB | Code Bank 0 |
| TBD | TBD | TBD | Monster Graphics |
| TBD | TBD | TBD | Spell Effects |

### Key RAM Addresses

| Address | Size | Description |
|---------|------|-------------|
| $7E0000-$7E1FFF | 8KB | Work RAM |
| TBD | TBD | Battle variables |

## 🔬 Debugging Sessions

### Session Log

| Date | Focus | Findings | Link |
|------|-------|----------|------|
| TBD | TBD | TBD | TBD |

## 📊 Data Structures

### Monster Data
- TBD monster count
- TBD bytes per entry

### Spell Data
- TBD

## 🔧 Tools

- **FFMQLib** (C#): FFMQ data tools
- **Mesen-S**: SNES debugging

## 🔗 Related Documentation

- [FFMQLib Source](../../../logsmall/FFMQLib/)
