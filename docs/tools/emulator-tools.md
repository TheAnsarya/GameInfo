# Emulator Tools Guide

Tools and guides for using emulators in ROM hacking and reverse engineering.

## Supported Emulators

| Emulator | Platform | Features |
|----------|----------|----------|
| [Mesen](https://mesen.ca) | NES, SNES, GB | Debugging, tracing, CDL |
| [FCEUX](https://fceux.com) | NES | Debugging, Lua scripting |
| [bsnes](https://github.com/bsnes-emu/bsnes) | SNES | Accuracy, debugging |
| [BGB](https://bgb.bircd.org) | GB, GBC | Debugging |

## Mesen Setup

### Installation

1. Download Mesen from [mesen.ca](https://mesen.ca)
2. Extract to `C:\Emulators\Mesen\` (recommended)
3. Configure data folders in Options → Preferences

### Debug Features

**Memory Viewer** (`Ctrl+M`)
- View/edit RAM, ROM, VRAM
- Set memory breakpoints
- Watch for value changes

**Debugger** (`Ctrl+D`)
- Step through code
- Set execution breakpoints
- View registers and flags

**Trace Logger** (`Ctrl+T`)
- Log CPU execution
- Filter by address range
- Export to file

### CDL Recording

1. Load ROM
2. Debug → CDL Tools → Start Recording
3. Play through areas of interest
4. Stop recording and save CDL file

### Creating Labels

1. Debug → Label Manager
2. Add labels for known addresses
3. Export to `.mlb` file

## FCEUX Setup

### Installation

1. Download from [fceux.com](https://fceux.com)
2. Extract to preferred location
3. Configure paths in Config → Directories

### Debug Features

**Debugger** (`F1`)
- CPU disassembly
- Breakpoints and watchpoints
- Symbolic debugging

**PPU Viewer**
- View name tables
- View pattern tables
- View sprites

**Hex Editor**
- Edit RAM/ROM
- Search for values
- Freeze RAM addresses

### Lua Scripting

FCEUX supports Lua scripts for automation:

```lua
-- Example: Track player position
while true do
    local x = memory.readbyte(0x0086)
    local y = memory.readbyte(0x0084)
    gui.text(10, 10, string.format("X: %d Y: %d", x, y))
    emu.frameadvance()
end
```

## bsnes Setup

### Installation

1. Download from GitHub releases
2. Extract to preferred location
3. Configure in Settings → Configuration

### Debug Features

**Memory Editor**
- View all memory regions
- Search and replace
- Watch values

**CPU Debugger**
- 65816 disassembly
- Execution tracing
- Breakpoints

**VRAM Viewer**
- Background layers
- Sprite tiles
- Palettes

## Common Debugging Tasks

### Finding RAM Addresses

1. Open Memory Viewer
2. Search for known value (e.g., HP = 100)
3. Change value in game
4. Filter search results
5. Verify correct address

### Setting Breakpoints

**Execution Breakpoint**
- Triggers when CPU executes address
- Useful for finding code routines

**Read Breakpoint**
- Triggers when RAM is read
- Find what reads a value

**Write Breakpoint**
- Triggers when RAM is written
- Find what modifies a value

### Tracing Code

1. Set breakpoint at routine start
2. Enable trace logging
3. Step through code
4. Analyze trace output

### Memory Mapping

Understanding memory maps:

**NES Memory Map**
```
$0000-$07FF  RAM (2KB, mirrored)
$2000-$2007  PPU registers
$4000-$401F  APU/IO registers
$6000-$7FFF  PRG-RAM (if present)
$8000-$FFFF  PRG-ROM (banked)
```

**SNES Memory Map (LoROM)**
```
$0000-$1FFF  Low RAM
$2000-$5FFF  Hardware registers
$7E0000-$7FFFFF  WRAM (128KB)
$008000-$FFFF  ROM (per bank)
```

## Exporting Data

### CDL Files

CDL (Code/Data Logger) files track which ROM bytes are:
- Code (executed)
- Data (read as data)
- Unaccessed

Export for analysis:
```bash
python tools/analyze_cdl.py visualize game.cdl --output coverage.png
```

### Label Files

Export labels for use in disassemblies:
```bash
python tools/converters/label_converter.py game.mlb --to asm --output labels.asm
```

### Memory Dumps

Save RAM state for analysis:
1. Debug → Dump Memory
2. Select region
3. Save to file

## Integration with GameInfo Tools

### CDL Analysis

```bash
# Import CDL from Mesen
python tools/analyze_cdl.py import game.cdl --format mesen

# Generate coverage report
python tools/analyze_cdl.py report game.cdl --output report.md
```

### Label Import

```bash
# Convert Mesen labels to assembly
python tools/converters/label_converter.py game.mlb --to asm

# Merge multiple label files
python tools/editors/label_merge.py *.mlb --output merged.mlb
```

## Best Practices

1. **Save states frequently** - Create states before testing
2. **Label as you go** - Document discovered addresses
3. **Use CDL recording** - Track ROM coverage systematically
4. **Backup everything** - Keep original files safe
5. **Take notes** - Document findings in markdown

## See Also

- [CDL Tools](cdl-tools.md) - CDL file management
- [Label Tools](label-tools.md) - Label file editing
- [Analysis Tools](analysis-tools.md) - ROM analysis
