# Breakpoint Analysis Guides

Step-by-step guides for using emulator breakpoints to analyze game code and extract data.

## 📚 Guides

| Guide | Game | Description |
|-------|------|-------------|
| [DQ3r Animation Extraction](dq3r-animation-extraction.md) | DQ3r SNES | Extract spell/battle animations via DMA tracing |
| [DMA Tracing](dma-tracing.md) | General SNES | Track data transfers to locate asset sources |
| [VRAM Analysis](vram-analysis.md) | General SNES | Monitor graphics memory during gameplay |

## 🔧 Quick Reference

### Common SNES Breakpoint Addresses

#### PPU Registers (Graphics)
| Address | Register | Description |
|---------|----------|-------------|
| $2100 | INIDISP | Display control |
| $2105 | BGMODE | BG mode and tile size |
| $2115 | VMAIN | VRAM address increment |
| $2116 | VMADDL | VRAM address (low) |
| $2117 | VMADDH | VRAM address (high) |
| $2118 | VMDATAL | VRAM data write (low) |
| $2119 | VMDATAH | VRAM data write (high) |
| $2121 | CGADD | CGRAM (palette) address |
| $2122 | CGDATA | CGRAM data write |

#### DMA Registers
| Address | Register | Description |
|---------|----------|-------------|
| $4300 | DMAPx | DMA control |
| $4301 | BBADx | DMA destination |
| $4302-$4304 | A1Tx | DMA source address |
| $4305-$4306 | DASx | DMA size |
| $420B | MDMAEN | DMA enable |

#### APU (Audio)
| Address | Register | Description |
|---------|----------|-------------|
| $2140-$2143 | APUIO0-3 | SPC700 communication ports |

### Breakpoint Types

| Type | When to Use |
|------|-------------|
| **Execute** | Find what code runs at a specific address |
| **Read** | Find what code reads from a variable |
| **Write** | Find what code modifies a variable |
| **Access** | Both read and write on same address |

## 💡 Tips

1. **Save states are your friend** - Create save states before setting breakpoints
2. **Use conditional breakpoints** - Filter by register values to reduce noise
3. **Frame advance** - Step one frame at a time to catch timing-sensitive code
4. **Log to file** - Enable trace logging for later analysis
5. **Start simple** - Begin with known addresses, expand from there
