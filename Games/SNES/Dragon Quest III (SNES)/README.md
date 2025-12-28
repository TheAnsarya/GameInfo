# Dragon Quest III (SNES) - DQ3r Project

> **Project Codename:** DQ3r (Dragon Quest III Remix)

Complete disassembly, documentation, asset extraction, and editor suite for **Dragon Quest III - Soshite Densetsu he...** (そして伝説へ..., "And Into the Legend...") - the 1996 Super Famicom remake of the classic NES RPG.

## 📋 ROM Information

| Property | Value |
|----------|-------|
| **Title** | Dragon Quest III - Soshite Densetsu he... |
| **Platform** | Super Nintendo / Super Famicom |
| **Region** | Japan |
| **Release** | 1996 |
| **ROM Type** | HiROM |
| **Size** | 4 MB (4,194,304 bytes) |
| **Banks** | 64 |

## 📁 Folder Structure

```
Dragon Quest III (SNES)/
├── README.md                   # This file
├── disasm/                     # Disassembly output
│   └── reconstructed/          # 192 bank source files (bank_00.s - bank_bf.s)
├── src/                        # Buildable source code
│   └── README.md              # Source folder placeholder
├── assets/                     # Extracted assets
│   ├── data/                  # Game data tables
│   ├── dq3_extracted/         # Extracted ROM regions
│   ├── graphics/              # PNG graphics (sprites, tiles, UI)
│   ├── music/                 # Music sequences
│   └── text/                  # Dialog and strings
├── Docs/                       # Documentation
│   ├── reference/             # Technical reference docs
│   │   ├── memory_map.md     # RAM/ROM address map
│   │   ├── TECHNICAL_SPECS.md # Hardware specs
│   │   └── ...               # API docs, guides, etc.
│   ├── ROM-Map.md             # ROM address map
│   └── RAM-Map.md             # RAM address map
├── tools/                      # Analysis tools
│   └── python/                # Python analysis tools
│       ├── analysis/          # ROM analyzers
│       ├── graphics/          # Graphics decoders
│       ├── reconstruction/    # Source reconstruction
│       └── ...
├── analysis/                   # Analysis output data
├── reports/                    # Analysis reports
├── Debugging/                  # Debug labels and notes
└── build/                      # Build output
```

## 🔗 Related Resources

- **GitHub Issues:** [game:dq3r-snes label](https://github.com/TheAnsarya/GameInfo/labels/game%3Adq3r-snes)
- **Epic Issue:** [#127 - DQ3r Complete Disassembly Project](https://github.com/TheAnsarya/GameInfo/issues/127)
- **Project Plan:** [~Plans/DQ3r SNES - Comprehensive Plan.md](../../../~Plans/DQ3r%20SNES%20-%20Comprehensive%20Plan.md)
- **dq3r-info repo:** https://github.com/TheAnsarya/dq3r-info
- **logsmall repo:** https://github.com/TheAnsarya/logsmall

## 📊 Progress

| Phase | Status | Progress |
|-------|--------|----------|
| Setup | ✅ Complete | 100% |
| ROM Analysis | 🟡 In Progress | 75% |
| Disassembly | 🟡 In Progress | 96.48% (192 bank files) |
| Asset Extraction | 🟡 In Progress | 50% |
| Documentation | 🟡 In Progress | 60% |
| Editor Tools | ⬜ Not Started | 0% |

### Disassembly Statistics

- **Total ROM Size:** 6,291,456 bytes
- **Coverage:** 96.48%
- **Source Files:** 192 assembly files (one per bank)
- **Documentation:** Technical specs, memory maps, API reference

## 🎮 About the Game

Dragon Quest III is the prequel to Dragon Quest I and II, telling the story of the legendary hero Ortega's child on their quest to defeat the Archfiend Baramos. The SNES remake features:

- **Enhanced Graphics** - 16-bit graphics with Mode 7 effects
- **Improved Music** - Remastered soundtrack
- **New Features** - Personality system, additional content
- **Quality of Life** - Faster gameplay, improved UI

## 📝 Naming Convention

| Abbreviation | Full Name | Platform |
|--------------|-----------|----------|
| DQ3 | Dragon Quest III | NES/Famicom (1988) |
| DQ3r | Dragon Quest III Remix | SNES/Super Famicom (1996) |

Use "Dragon Quest III (SNES)" in folder names and formal documentation.
Use "DQ3r" as shorthand in issues, labels, and casual references.
