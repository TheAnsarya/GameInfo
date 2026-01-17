# 🌼 Peony Disassembler Framework

> **The Anti-Poppy: Disassembly ↔ Assembly**
> **Status:** Planning
> **Target:** 2026-Q1 Initial Release

---

## 📋 Overview

**Peony** is a multi-system disassembler framework - the logical counterpart to Poppy (assembler).

| | Poppy | Peony |
|---|-------|-------|
| **Direction** | Source → ROM | ROM → Source |
| **Input** | `.pasm` assembly | Binary ROM files |
| **Output** | Binary ROM | `.pasm` assembly |
| **Purpose** | Building | Reverse engineering |

---

## 🎯 Core Features

### Multi-System Support (Match Poppy)

| Platform | CPU | Priority | Status |
|----------|-----|----------|--------|
| **Atari 2600** | MOS 6507 | 🔴 High | Planned |
| **NES** | MOS 6502 | 🔴 High | Planned |
| **SNES** | WDC 65816 | 🔴 High | Planned |
| **Game Boy** | Sharp SM83 | 🔴 High | Planned |
| **Atari Lynx** | WDC 65C02 | 🟡 Medium | Planned |
| **Genesis** | Motorola 68000 | 🟡 Medium | Planned |
| **GBA** | ARM7TDMI | 🟡 Medium | Planned |
| **Master System** | Zilog Z80 | 🟢 Low | Planned |

### Disassembly Modes

1. **Linear Sweep** - Disassemble sequentially
2. **Recursive Descent** - Follow code flow
3. **Speculative Execution** - Trace all paths
4. **Hybrid Analysis** - Combine approaches

### Output Formats

1. **Poppy Assembly (`.pasm`)** - Native format, reassembles identically
2. **Annotated Listing** - With addresses and hex
3. **Symbol File** - Labels and constants
4. **Memory Map** - Data structure analysis

---

## 🏗️ Architecture

### Project Structure

```
peony/
├── src/
│   └── Peony.sln
│       ├── Peony.Core/           - Core disassembly engine
│       │   ├── Analyzer.cs       - Control flow analysis
│       │   ├── Decoder.cs        - Instruction decoding
│       │   ├── Formatter.cs      - Output formatting
│       │   └── Memory.cs         - Memory model
│       │
│       ├── Peony.Cpu.6502/       - 6502 family (NES, Atari)
│       ├── Peony.Cpu.65816/      - 65816 (SNES)
│       ├── Peony.Cpu.SM83/       - Sharp SM83 (Game Boy)
│       ├── Peony.Cpu.68000/      - Motorola 68000 (Genesis)
│       ├── Peony.Cpu.Z80/        - Zilog Z80 (SMS, GB-like)
│       ├── Peony.Cpu.ARM7/       - ARM7TDMI (GBA)
│       │
│       ├── Peony.Platform.Atari2600/
│       ├── Peony.Platform.NES/
│       ├── Peony.Platform.SNES/
│       ├── Peony.Platform.GB/
│       ├── Peony.Platform.Genesis/
│       ├── Peony.Platform.GBA/
│       │
│       ├── Peony.Analysis/       - Advanced analysis
│       │   ├── DataFlowAnalysis.cs
│       │   ├── PatternMatching.cs
│       │   ├── StringDetection.cs
│       │   └── GraphicsDetection.cs
│       │
│       ├── Peony.Integration/    - Tool integrations
│       │   ├── MesenIntegration.cs
│       │   ├── DiztinGUIshIntegration.cs
│       │   └── CDLImport.cs
│       │
│       ├── Peony.Cli/            - Command-line interface
│       └── Peony.Tests/          - Test suite
│
├── docs/
│   ├── architecture.md
│   ├── cpu-support.md
│   └── integration-guide.md
│
├── examples/
│   ├── atari2600/
│   ├── nes/
│   └── snes/
│
└── vscode-extension/             - VS Code integration
```

### Core Interfaces

```csharp
// CPU abstraction
public interface ICpuDecoder {
	Instruction Decode(ReadOnlySpan<byte> bytes, uint address);
	int GetInstructionLength(byte opcode);
	AddressingMode GetAddressingMode(byte opcode);
}

// Platform abstraction
public interface IPlatformAnalyzer {
	MemoryMap GetMemoryMap();
	IEnumerable<uint> GetEntryPoints();
	IEnumerable<InterruptVector> GetVectors();
	RomType DetectRomType(ReadOnlySpan<byte> data);
}

// Output abstraction
public interface IOutputFormatter {
	string FormatInstruction(Instruction inst);
	string FormatLabel(Label label);
	string FormatData(DataBlock block);
}
```

---

## 🎮 Atari 2600 Specific Features

### TIA Register Recognition
```csharp
// Automatic TIA register labeling
$00 → VSYNC
$01 → VBLANK
$02 → WSYNC
$09 → COLUPF
$0D → PF0
$0E → PF1
$0F → PF2
// ... all 128 TIA addresses
```

### Bank Switching Detection
- Automatic mapper detection (F8, F6, F4, etc.)
- Bank boundary identification
- Cross-bank reference analysis

### Kernel Pattern Recognition
- VSYNC/VBLANK timing analysis
- Scanline counting
- Overscan detection

---

## 📥 Input Sources

### Direct ROM Loading
```csharp
var disasm = new PeonyDisassembler();
disasm.LoadRom("game.a26", Platform.Atari2600);
disasm.Analyze();
disasm.Export("game.pasm");
```

### CDL Import (Code Data Logger)
```csharp
// Import Mesen2 CDL files
disasm.ImportCdl("game.cdl");
// Import FCEUX CDL files
disasm.ImportFceuxCdl("game.cdl");
```

### DiztinGUIsh Import
```csharp
// Import DiztinGUIsh project
disasm.ImportDizProject("game.diz");
```

### Symbol File Import
```csharp
// Import existing labels
disasm.ImportSymbols("game.sym");
disasm.ImportDbgFile("game.dbg");
```

---

## 📤 Output Options

### Full Disassembly
```powershell
peony disassemble game.a26 --output game.pasm --platform atari2600
```

### Memory Map Only
```powershell
peony analyze game.a26 --output memory-map.json --platform atari2600
```

### Symbol Export
```powershell
peony symbols game.a26 --output game.sym --format mesen
```

### Partial Disassembly
```powershell
peony disassemble game.nes --range $8000-$9FFF --output bank0.pasm
```

---

## 🔄 Roundtrip Guarantee

**Critical Feature:** Any ROM disassembled by Peony must reassemble identically with Poppy.

```
Original ROM → Peony → .pasm source → Poppy → Rebuilt ROM
    ↓                                           ↓
  CRC32 ─────────── MUST MATCH ─────────── CRC32
```

### Verification Command
```powershell
peony verify game.a26 game.pasm --assembler poppy
```

---

## 📋 Development Phases

### Phase 1: Foundation (2026-01 to 2026-02)
- [ ] Create repository structure
- [ ] Implement core interfaces
- [ ] 6502 instruction decoder
- [ ] Basic linear sweep disassembler
- [ ] CLI scaffolding

### Phase 2: Atari 2600 (2026-02 to 2026-03)
- [ ] TIA register recognition
- [ ] Bank switching detection
- [ ] RIOT RAM analysis
- [ ] Kernel pattern detection
- [ ] First 10 games disassembled

### Phase 3: NES Support (2026-03 to 2026-04)
- [ ] iNES header parsing
- [ ] Mapper support (NROM, MMC1, MMC3)
- [ ] PPU register recognition
- [ ] NMI/IRQ vector handling

### Phase 4: SNES Support (2026-04 to 2026-05)
- [ ] 65816 instruction decoder
- [ ] LoROM/HiROM detection
- [ ] DMA/HDMA analysis
- [ ] Native/emulation mode tracking

### Phase 5: Advanced Analysis (2026-05 to 2026-06)
- [ ] Data flow analysis
- [ ] String detection
- [ ] Graphics data detection
- [ ] Cross-reference generation

### Phase 6: Integrations (2026-06 to 2026-07)
- [ ] Mesen2 CDL import
- [ ] DiztinGUIsh import/export
- [ ] VS Code extension
- [ ] GameInfo integration

---

## 🔧 CLI Reference

### Basic Commands

```powershell
# Disassemble a ROM
peony disassemble <rom> [options]
  --platform <platform>    Target platform (atari2600, nes, snes, gb)
  --output <file>          Output file (.pasm)
  --format <format>        Output format (pasm, listing, json)

# Analyze without full disassembly
peony analyze <rom> [options]
  --output <file>          Output analysis file
  --json                   JSON format output

# Import annotations
peony import <rom> [options]
  --cdl <file>             Import CDL file
  --symbols <file>         Import symbol file
  --diz <file>             Import DiztinGUIsh project

# Export data
peony export <project> [options]
  --symbols <file>         Export symbol file
  --memory-map <file>      Export memory map

# Verify roundtrip
peony verify <rom> <source> [options]
  --assembler <path>       Path to assembler (default: poppy)
```

---

## 📚 Related Documentation

- [Poppy Assembler](https://github.com/TheAnsarya/poppy)
- [BPS-Patch](https://github.com/TheAnsarya/bps-patch)
- [DiztinGUIsh](https://github.com/DizTools/DiztinGUIsh)
- [Mesen2](https://github.com/SourMesen/Mesen2)

---

## 🎯 Success Criteria

| Criteria | Target |
|----------|--------|
| 6502 instruction accuracy | 100% |
| Roundtrip verification | 100% pass |
| Atari 2600 games supported | 40+ |
| NES games supported | 20+ |
| Documentation coverage | 90%+ |
| Test coverage | 80%+ |

---

*Document Version: 1.0.0*
*Last Updated: 2026-01-16*
