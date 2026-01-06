# FFMQ SNES - Debugging Notes

Final Fantasy Mystic Quest SNES-specific debugging documentation.

## 📋 Testing Documents

| Document | Purpose | Test Cases |
|----------|---------|------------|
| [Map Editor Testing](map-editor-testing.md) | Dungeon/town maps, tilesets, collision | 8 TC + 3 RT |
| [Monster Editor Testing](monster-editor-testing.md) | Enemy stats, elements, AI scripts | 8 TC + 3 RT |
| [Item Editor Testing](item-editor-testing.md) | Weapons, armor, consumables | 8 TC + 3 RT |
| [Spell Editor Testing](spell-editor-testing.md) | Magic system, animations, effects | 8 TC + 3 RT |

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
| $C00000 | $808000 | - | Monster Graphics |
| $C40000 | $828000 | - | Item Icons |
| $C60000 | $838000 | - | Spell Animations |
| $D00000 | $868000 | - | Map Palettes |
| $D18000 | $8C8000 | - | Monster Stats |
| $D28000 | $948000 | - | Item Data |
| $D50000 | $AA8000 | - | Spell Data |
| $D80000 | $AC8000 | - | Tilesets |
| $E00000 | $C08000 | - | Map Data |

### Key RAM Addresses

| Address | Size | Description |
|---------|------|-------------|
| $7E0000-$7E1FFF | 8KB | Work RAM |
| $7E2000 | 0x100 | Battle state |
| $7E2100 | 0x80 | Character stats |
| $7E2200 | 0x40 | Inventory |

## 🔬 Debugging Sessions

### Session Log

| Date | Focus | Findings | Link |
|------|-------|----------|------|
| TBD | TBD | TBD | TBD |

## 📊 Data Structures

### Monster Data
- 60 monsters total
- 32 bytes per entry

### Spell Data
- 16 spells total
- 12 bytes per entry

### Weapon Data
- 16 weapons (4×4 progression)
- 8 bytes per entry

## 🔧 Tools

- **FFMQLib** (C#): FFMQ data tools (in development)
- **Mesen-S**: SNES debugging
- **bsnes-plus**: Advanced SNES debugging

## 🔗 Related Documentation

- [FFMQLib Source](../../../logsmall/FFMQLib/)
