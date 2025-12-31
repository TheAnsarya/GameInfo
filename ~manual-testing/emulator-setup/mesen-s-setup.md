# Mesen-S Debugger Setup

Complete setup guide for Mesen-S SNES emulator debugging features.

## 📥 Installation

### Windows
1. Download from [mesen.ca](https://www.mesen.ca/)
2. Extract to a folder (e.g., `C:\Emulators\Mesen-S\`)
3. Run `Mesen.exe`

### Linux
```bash
# Download AppImage
wget https://www.mesen.ca/Mesen.AppImage
chmod +x Mesen.AppImage
./Mesen.AppImage
```

### macOS
1. Download from [mesen.ca](https://www.mesen.ca/)
2. Extract and move to Applications
3. May need to allow in Security & Privacy settings

## ⚙️ Initial Configuration

### General Settings

1. **Options → Configuration**
2. Set **General** tab:
   - Save folder: `./Saves`
   - Screenshot folder: `./Screenshots`
   
3. Set **Video** tab:
   - Aspect Ratio: Auto (or 8:7 for pixel-perfect)
   - Filter: None (for debugging)

### Emulation Settings

1. **Options → Emulation**
2. Recommended settings:
   - Run Ahead: Off (interferes with debugging)
   - Rewind: Off (saves memory)
   - Overclock: Off (affects timing)

### Input Configuration

1. **Options → Input**
2. Configure controller for gameplay testing
3. Set hotkeys:
   - F5-F8: Save states
   - F9-F12: Load states
   - Pause: Space or P
   - Frame Advance: F (essential!)

## 🔧 Debugger Setup

### Opening the Debugger

- **Tools → Debugger** or press **D**

### Debugger Layout

```
┌─────────────────────────────────────────────────┐
│ Disassembly View          │ Registers          │
│                           │ A: 0000            │
│ $C00000: SEI             │ X: 0000            │
│ $C00001: CLC             │ Y: 0000            │
│ $C00002: XCE             │ S: 01FF            │
│                           │ D: 0000            │
│                           │ DB: 00             │
│                           │ P: envmxdizc       │
├───────────────────────────┼────────────────────┤
│ Breakpoints               │ Watch              │
│                           │                    │
├───────────────────────────┴────────────────────┤
│ Call Stack                │ Memory View        │
└─────────────────────────────────────────────────┘
```

### Essential Debugger Windows

Open these from **Debug** menu:

| Window | Hotkey | Purpose |
|--------|--------|---------|
| Memory Viewer | M | View/edit RAM, ROM, VRAM |
| Breakpoints | B | Manage breakpoints |
| Watch | W | Monitor variable values |
| Call Stack | - | View subroutine calls |
| Trace Logger | T | Log execution trace |

## 📍 Setting Breakpoints

### Execute Breakpoint
Breaks when CPU executes an address:

1. Click **Breakpoints** window
2. Click **Add**
3. Set:
   - Type: Execute
   - Address: `$C35A00` (example)
   - Enabled: ✓

### Read/Write Breakpoint
Breaks when memory is accessed:

1. Click **Add** in Breakpoints
2. Set:
   - Type: Read, Write, or Read/Write
   - Address: `$7E0100` (example)
   - Address End: `$7E01FF` (for range)

### Conditional Breakpoint
Breaks only when condition is met:

1. Create breakpoint
2. Add **Condition**: `A == $0042` or `X >= $100`

### Common Conditions
```
A == $xxxx      ; Accumulator equals value
X >= $xxxx      ; X register >= value
Y < $xxxx       ; Y register < value
[address] == $xx ; Memory location equals value
```

## 🖥️ Memory Viewer

### Viewing Different Memory Types

Use dropdown to select:

| Type | Address Range | Contents |
|------|---------------|----------|
| CPU Memory | $00-$FF | Full memory map |
| Work RAM | $7E0000-$7FFFFF | Main RAM (128KB) |
| VRAM | $0000-$FFFF | Video RAM (64KB) |
| CGRAM | $00-$1FF | Color palette (512 bytes) |
| OAM | $00-$21F | Sprite attributes |
| SA-1 RAM | - | Enhancement chip RAM |

### Search Memory

1. **Edit → Find** (Ctrl+F)
2. Enter hex pattern: `0A 0B 0C 0D`
3. Click Find Next

### Export Memory

1. **File → Export**
2. Select format (Binary, Hex)
3. Choose address range

## 📺 VRAM & Graphics Viewers

### PPU Viewer (Graphics)

**Tools → PPU Viewer**

Tabs:
- **Tiles** - Raw tile graphics
- **Tilemap** - BG layer composition
- **Sprites** - OAM sprite display
- **Palette** - Color palettes

### Viewing Battle Graphics

1. Enter a battle in-game
2. Open PPU Viewer
3. Switch to **Tiles** tab
4. Set BPP mode: 4bpp (most common)
5. Locate monster/spell tiles

### Exporting Graphics

1. Right-click in PPU Viewer
2. **Export to PNG**
3. Includes palette information

## 📝 Trace Logger

### Configuration

1. **Debug → Trace Logger**
2. Configure format:
```
[PC] [Code] [Instruction] A:[A] X:[X] Y:[Y] S:[SP]
```

3. Set output file: `trace.log`

### Running Trace

1. **Start Logging**
2. Perform in-game action
3. **Stop Logging**
4. Analyze `trace.log`

### Trace Options

- **Log to file**: Save trace for offline analysis
- **Log CPU**: Standard CPU instructions
- **Log SPC**: SPC700 audio processor
- **Condition**: Only log when condition is met

## 💾 Save States

### Creating Debug Save States

1. Navigate to point of interest in game
2. Press F5-F8 to save to slot
3. Note what state contains in personal log

### Recommended Save State Strategy

| Slot | Purpose |
|------|---------|
| F5 | Battle start |
| F6 | Just before casting spell |
| F7 | During animation |
| F8 | Working backup |

## 🔗 Integration with GameInfo Tools

### Exporting Findings

After identifying data with Mesen-S:

1. Note ROM addresses discovered
2. Export memory regions as binary
3. Update `DQ3rAnimationMappings.cs` with verified values
4. Document in session logs

### Using with CDL Files

Mesen-S generates CDL (Code/Data Log) files:

1. Run game to generate coverage
2. Export CDL from **Debug → Code/Data Logger**
3. Import into GameInfo CDL tools for analysis

## ⚠️ Troubleshooting

### Debugger Won't Break
- Ensure breakpoint is enabled
- Check address is correct (bank + offset)
- Verify condition syntax if using conditional

### Memory View Shows Wrong Data
- Check memory type dropdown
- Refresh view after emulation runs
- Some memory is bank-switched

### Trace File Too Large
- Use conditional tracing
- Limit trace duration
- Filter by PC address range

## 📚 Resources

- [Mesen-S Documentation](https://www.mesen.ca/docs/)
- [SNES Development Wiki](https://wiki.superfamicom.org/)
- [65816 Reference](https://www.westerndesigncenter.com/wdc/documentation/w65c816s.pdf)
