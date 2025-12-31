# Emulator Setup for Debugging

Configuration guides for SNES debugging emulators.

## 📚 Guides

| Guide | Emulator | Platform | Description |
|-------|----------|----------|-------------|
| [Mesen-S Setup](mesen-s-setup.md) | Mesen-S | Win/Linux/Mac | Primary recommended debugger |
| [bsnes-plus Setup](bsnes-plus-setup.md) | bsnes-plus | Win/Linux | Advanced debugging features |
| [NO$SNS Setup](no$sns-setup.md) | NO$SNS | Windows | Alternative debugger |

## 🏆 Recommended Setup

For most DQ3r/DW4/FFMQ debugging work, we recommend:

### Primary: Mesen-S
- Modern, actively maintained
- Excellent debugger with breakpoints, trace, memory viewer
- VRAM/OAM/Tilemap viewers
- Cross-platform

### Secondary: bsnes-plus
- Cycle-accurate emulation
- Advanced breakpoint conditions
- HDMA visualization
- Better for timing-critical analysis

## ⚡ Quick Comparison

| Feature | Mesen-S | bsnes-plus | NO$SNS |
|---------|---------|------------|--------|
| Accuracy | High | Very High | High |
| Speed | Fast | Medium | Fast |
| Debugger | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| VRAM Viewer | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| Trace Logger | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ |
| Ease of Use | ⭐⭐⭐⭐⭐ | ⭐⭐⭐ | ⭐⭐ |
| Cross-Platform | Yes | Yes | No |
| Active Dev | Yes | Limited | No |

## 📥 Downloads

- **Mesen-S**: [mesen.ca](https://www.mesen.ca/)
- **bsnes-plus**: [github.com/devinacker/bsnes-plus](https://github.com/devinacker/bsnes-plus/releases)
- **NO$SNS**: [problemkaputt.de/sns.htm](https://problemkaputt.de/sns.htm)

## 🔧 General Configuration

### Recommended Settings (All Emulators)

1. **Disable rewind** - Saves memory, reduces interference
2. **Enable frame advance** - Essential for debugging
3. **Configure save state slots** - 10+ slots recommended
4. **Set up trace file output** - For offline analysis
5. **Configure VRAM/PPU viewer shortcuts** - Quick access during debugging
