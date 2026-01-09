# Manual Testing & Debugging Documentation

This folder contains all manual testing procedures, debugging guides, and step-by-step workflows for ROM hacking research that require human interaction with emulators, debuggers, and analysis tools.

## 📁 Folder Structure

```
~manual-testing/
├── README.md                    # This file
├── emulator-setup/              # Emulator configuration guides
│   ├── README.md
│   ├── mesen-s-setup.md         # Mesen-S debugger setup
│   ├── bsnes-plus-setup.md      # bsnes-plus debugger setup
│   └── no$sns-setup.md          # NO$SNS setup (Windows)
├── breakpoint-guides/           # Breakpoint analysis workflows
│   ├── README.md
│   ├── dq3r-animation-extraction.md
│   ├── dma-tracing.md
│   └── vram-analysis.md
├── extraction-workflows/        # Asset extraction procedures
│   ├── README.md
│   ├── graphics-extraction.md
│   ├── audio-extraction.md
│   └── compression-analysis.md
└── game-specific/               # Per-game debugging notes
    ├── README.md
    ├── dq3r-snes/
    ├── dq4r-snes/
    ├── dw4-nes/
    ├── ffmq-snes/
    └── zelda-nes/
```

## 🎯 Purpose

These guides document **manual procedures** that cannot be fully automated:

- **Breakpoint Analysis** - Setting debugger breakpoints to trace code execution
- **VRAM Inspection** - Watching graphics memory during specific game events
- **DMA Tracing** - Capturing data transfers to locate asset sources
- **State Machine Analysis** - Understanding game logic through runtime debugging
- **Reverse Engineering** - Documenting findings from emulator debugging sessions

## 🔧 Prerequisites

### Required Software

| Tool | Purpose | Download |
|------|---------|----------|
| **Mesen-S** | Primary SNES debugger | [mesen.ca](https://www.mesen.ca/) |
| **bsnes-plus** | Advanced debugging features | [github.com/devinacker/bsnes-plus](https://github.com/devinacker/bsnes-plus) |
| **NO$SNS** | Windows debugger (alt) | [problemkaputt.de](https://problemkaputt.de/sns.htm) |
| **Tile Molester** | Graphics viewer | [github.com](https://github.com/toruzz/TileMolester) |
| **YY-CHR** | CHR tile editor | [yychr.org](http://yychr.org/) |

### ROM Files

Place original ROM files in your local `~roms/` folder (not tracked by git):
- `DQ3r` - Dragon Quest III (SNES) - Japanese or translated
- `DW4` - Dragon Warrior IV (NES)
- `FFMQ` - Final Fantasy Mystic Quest (SNES)

## 📚 Guide Index

### Getting Started
- [Emulator Setup](emulator-setup/README.md) - Configure debugging emulators

### Breakpoint Analysis
- [DQ3r Animation Extraction](breakpoint-guides/dq3r-animation-extraction.md) - Extract battle animations via breakpoints
- [DMA Tracing](breakpoint-guides/dma-tracing.md) - Track data transfers to find asset sources
- [VRAM Analysis](breakpoint-guides/vram-analysis.md) - Monitor graphics memory changes

### Extraction Workflows
- [Project System](extraction-workflows/project-system-workflow.md) - Create and manage .giproj projects
- [Graphics Extraction](extraction-workflows/graphics-extraction.md) - Extract and decode graphics
- [Audio Extraction](extraction-workflows/audio-extraction.md) - Extract sound/music data
- [Compression Analysis](extraction-workflows/compression-analysis.md) - Identify and decode compression

### Game-Specific
- [DQ3r SNES](game-specific/dq3r-snes/README.md) - Dragon Quest III debugging notes
- [DW4 NES](game-specific/dw4-nes/README.md) - Dragon Warrior IV debugging notes
- [FFMQ SNES](game-specific/ffmq-snes/README.md) - Final Fantasy Mystic Quest notes
- [Zelda NES](game-specific/zelda-nes/README.md) - The Legend of Zelda testing docs

## 🔗 Related Resources

- [GameInfo Tools CLI](../docs/guides/cli-reference.md) - Automated extraction tools
- [DQ3r Technical Docs](../Games/SNES/Dragon%20Quest%20III%20(SNES)/Docs/reference/technical/) - Technical documentation
- [Session Logs](../~docs/session-logs/) - AI session documentation

## 📝 Contributing

When adding new guides:

1. Use the templates in each subfolder
2. Include screenshots where helpful (store in `assets/` subfolder)
3. Document exact emulator versions tested
4. Link related GitHub issues
5. Update this README's index

## ⚠️ Notes

- These are **manual** procedures - they require human judgment and interaction
- Results should be documented and fed back into automated extraction tools
- ROM files are **not** included in this repository
