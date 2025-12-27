# Dark Repos Editor - User Guide

## Introduction

Dark Repos Editor is a comprehensive ROM hacking suite that runs in your web browser. It provides powerful tools for analyzing, editing, and documenting retro game ROMs (NES, SNES, Game Boy, and more).

**Website:** [https://editor.darkrepos.com](https://editor.darkrepos.com)

---

## Getting Started

### Installation Options

#### Option 1: Use Online (No Installation)
Visit [https://editor.darkrepos.com](https://editor.darkrepos.com) and start editing immediately.

#### Option 2: Install Desktop App
Download the desktop application for offline use:
- **Windows:** `DarkReposEditor-Setup.exe`
- **macOS:** `DarkReposEditor.dmg`
- **Linux:** `DarkReposEditor.AppImage`

The desktop app runs a local server and opens in your default browser, just like Plex.

### First Steps

1. **Upload a ROM** - Click "Upload ROM" or drag a file onto the page
2. **Choose an Editor** - Select from the editor toolbar
3. **Make Changes** - Edit using the visual tools
4. **Export** - Save your changes or create a patch

---

## Editors Overview

### 🔢 Hex Editor

The foundation of ROM hacking - view and edit raw bytes.

**Features:**
- Multiple view modes (Hex, Decimal, Binary, ASCII)
- Search and replace patterns
- Go to address
- Bookmarks
- Selection highlighting
- Copy/paste bytes
- Undo/redo

**Keyboard Shortcuts:**
| Key | Action |
|-----|--------|
| `Ctrl+G` | Go to address |
| `Ctrl+F` | Find pattern |
| `Ctrl+H` | Find and replace |
| `Ctrl+B` | Add bookmark |
| `Arrow keys` | Navigate cells |
| `Page Up/Down` | Scroll pages |

### 🔍 Disassembler

Convert binary code to readable assembly language.

**Features:**
- 6502, 65816, and Z80 support
- Multiple output formats (ca65, ASM6, custom)
- Automatic label generation
- Cross-reference analysis
- Bank navigation
- Export to file

**Usage:**
1. Select the CPU architecture
2. Set the starting address
3. Click "Disassemble"
4. Add labels by clicking addresses
5. Export to assembly file

### 🎨 CHR/Graphics Editor

Edit tile graphics visually.

**Features:**
- Visual tile editor with zoom
- Palette selection
- Flip/rotate tools
- Copy/paste tiles
- Import/export PNG
- Animation preview
- Multiple formats (NES 2BPP, SNES 4BPP, etc.)

**Tools:**
- **Pencil** - Draw pixels
- **Fill** - Flood fill area
- **Select** - Select tile region
- **Eyedropper** - Pick color

### 🎨 Palette Editor

Edit color palettes.

**Features:**
- Visual color picker
- NES/SNES palette support
- Import/export palettes
- Preview on tiles
- Color cycling animation

### 📝 Text Editor

Extract and edit game text.

**Features:**
- Table file (TBL) support
- Pointer table navigation
- DTE/MTE compression
- Script import/export
- Search within text
- Spell checking

**Workflow:**
1. Load a TBL file
2. Set pointer table offset
3. Extract text
4. Edit in the visual editor
5. Insert back into ROM

### 🗺️ Map Editor

Edit game maps and tilesets.

**Features:**
- Visual tile placement
- Layer support
- Event/trigger editing
- Tileset selection
- Export to PNG
- Collision editing

### 📊 Data Table Editor

Edit structured game data (monsters, items, etc.).

**Features:**
- Schema-based editing
- Multiple record types
- Field validation
- Export to JSON/CSV
- Batch editing

**Supported Data:**
- Monster stats
- Item properties
- Spell data
- Shop inventories
- Experience tables

### 📜 Script Editor

Edit game scripts and events.

**Features:**
- Visual script editing
- Syntax highlighting
- Command documentation
- Compile/decompile
- Error checking

### 🏦 Bank View

Analyze ROM bank structure and content.

**Features:**
- Visual bank overview
- Content type detection
- Bank comparison
- Export individual banks
- Mapper information

### 📈 CDL Viewer

Visualize code/data logger coverage.

**Features:**
- Coverage heatmap
- Region analysis
- Import FCEUX/Mesen CDL
- Export coverage report
- Merge CDL files

### 🏷️ Symbol Manager

Manage labels and symbols.

**Features:**
- Import MLB/NL files
- Add/edit labels
- Export to multiple formats
- Cross-reference view
- Auto-label generation

### 💾 Save Editor

Edit save game data.

**Features:**
- Save state support
- Battery save editing
- Structure detection
- Checksum fixing

### 🔧 Build Pipeline

Create automated ROM building workflows.

**Features:**
- Asset pipeline
- Patch application
- Script compilation
- Multi-step builds
- Project templates

---

## Working with Projects

### Creating a Project

1. Click **New Project**
2. Enter project name
3. Select base ROM
4. Choose project type (hack, translation, etc.)
5. Click **Create**

### Project Structure

```
My Project/
├── rom/              # Working ROM copy
├── assets/           # Graphics, text, etc.
├── patches/          # IPS/BPS patches
├── scripts/          # Game scripts
├── labels/           # Symbol files
└── project.json      # Project metadata
```

### Collaboration

- Export project as ZIP
- Share with collaborators
- Import shared projects
- Track change history

---

## Keyboard Shortcuts

### Global Shortcuts

| Key | Action |
|-----|--------|
| `Ctrl+O` | Open ROM |
| `Ctrl+S` | Save changes |
| `Ctrl+Z` | Undo |
| `Ctrl+Y` | Redo |
| `Ctrl+Shift+Z` | Redo (alternate) |
| `F1` | Help |
| `F11` | Toggle fullscreen |
| `Escape` | Close dialog/cancel |

### Navigation

| Key | Action |
|-----|--------|
| `Ctrl+1` | Switch to Hex Editor |
| `Ctrl+2` | Switch to Disassembler |
| `Ctrl+3` | Switch to CHR Editor |
| `Ctrl+4` | Switch to Text Editor |
| `Ctrl+Tab` | Next editor tab |
| `Ctrl+Shift+Tab` | Previous editor tab |

---

## File Formats

### Supported ROM Formats

| Format | Extension | Description |
|--------|-----------|-------------|
| iNES | `.nes` | NES ROMs |
| NES 2.0 | `.nes` | Extended NES format |
| SNES | `.sfc`, `.smc` | Super NES ROMs |
| Game Boy | `.gb`, `.gbc` | Game Boy ROMs |
| GBA | `.gba` | Game Boy Advance |
| Genesis | `.md`, `.bin` | Sega Genesis |

### Patch Formats

| Format | Extension | Description |
|--------|-----------|-------------|
| IPS | `.ips` | International Patching System |
| BPS | `.bps` | Beat Patching System |
| UPS | `.ups` | Universal Patching System |

### Data Formats

| Format | Extension | Description |
|--------|-----------|-------------|
| TBL | `.tbl` | Text table file |
| MLB | `.mlb` | Mesen label file |
| NL | `.nl` | FCEUX name list |
| CDL | `.cdl` | Code/Data logger |
| SYM | `.sym` | Symbol file |

---

## Tips and Tricks

### Hex Editor

- **Find unknown values:** Use relative search to find values that change together
- **Track pointers:** Right-click an address to follow pointer references
- **Compare ROMs:** Load two ROMs and use diff view to see changes

### Graphics

- **Extract sprites:** Use the sprite sheet export for full sprite rips
- **Fix colors:** Import a reference image to match palette

### Text

- **Handle control codes:** Define them in your TBL file with `XX=<code>`
- **Compress text:** Use DTE analysis to find common byte pairs

### Disassembly

- **Start at vectors:** Begin at reset/NMI/IRQ vectors (typically $FFFA-$FFFF)
- **Label subroutines:** JSR targets are almost always subroutine starts

---

## Troubleshooting

### ROM Won't Load

- Check file format is supported
- Ensure file isn't corrupted (verify checksum)
- Try removing any headers

### Changes Not Saving

- Check browser storage permissions
- Ensure you have enough disk space
- Try exporting as patch instead

### Slow Performance

- Close unused editor tabs
- Reduce virtualization viewport
- Clear browser cache
- Use desktop app for large ROMs

### Display Issues

- Update your browser
- Disable browser extensions
- Clear local storage
- Try a different browser

---

## FAQ

**Q: Is this free?**
A: Yes, Dark Repos Editor is completely free and open source.

**Q: Can I use this for commercial ROM hacks?**
A: The editor is free to use, but you need permission from the original game's rights holder to distribute ROM hacks commercially.

**Q: Does it work offline?**
A: The desktop app works completely offline. The web version requires an internet connection initially but can work offline after loading.

**Q: What browsers are supported?**
A: Chrome, Firefox, Edge, and Safari (latest versions). Chrome is recommended for best performance.

**Q: How do I report bugs?**
A: Open an issue on GitHub: https://github.com/TheAnsarya/GameInfo/issues

**Q: Can I request features?**
A: Yes! Open a feature request issue on GitHub.

---

## Support

- **Documentation:** https://editor.darkrepos.com/docs
- **GitHub:** https://github.com/TheAnsarya/GameInfo
- **Discord:** https://discord.gg/darkrepos
- **Wiki:** https://games.darkrepos.com

---

## Credits

Dark Repos Editor is part of the GameInfo project by TheAnsarya.

Special thanks to the ROM hacking community for documentation and inspiration.
