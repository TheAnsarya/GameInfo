# Mesen2 Pansy Integration - Issues and Plans

**Created:** January 24, 2026
**Last Updated:** January 24, 2026

## Overview

This document tracks the integration between Mesen2 emulator and the 🌼 Pansy metadata format for the play-to-document workflow.

## Current Status

| Component | Status | Branch/Location |
|-----------|--------|-----------------|
| PansyExporter | ✅ Implemented | `pansy-export` branch |
| Menu Integration | ✅ Complete | Debugger menu |
| Auto-export Config | ✅ Complete | Settings UI |
| Testing | ⏳ Pending | Manual testing needed |
| Documentation | ✅ Complete | `~docs/`, `GameInfo/docs` |

## GitHub Issues

### High Priority

#### Issue: Test Pansy Export Workflow
**Priority:** High  
**Assignee:** TBD  
**Labels:** testing, pansy, mesen2

**Description:**
Test the complete Mesen2 → Pansy export workflow with multiple games.

**Tasks:**
- [ ] Load Dragon Warrior (NES) in Mesen2
- [ ] Load existing CDL file: `C:\~reference-roms\cdls\Dragon Warrior (U) (PRG1) [!].cdl`
- [ ] Add test labels and comments in debugger
- [ ] Export Pansy file manually
- [ ] Verify with `pansy info` command
- [ ] Test auto-export on debugger close
- [ ] Repeat for SNES (FFMQ) and GB games

**Acceptance Criteria:**
- Pansy files are created successfully
- All symbols and comments are preserved
- CDL data is correctly converted
- Files can be read by Pansy CLI/viewer

---

#### Issue: CDL to Pansy Conversion for Existing Files
**Priority:** High  
**Labels:** feature, pansy, tooling

**Description:**
Create a tool to convert existing CDL files to Pansy format without needing to run Mesen2.

**Rationale:**
We have CDL files for several games (DW1, DW4, FFMQ, Secret of Evermore, DQ3) that should be converted to Pansy format for use with Peony/Poppy.

**Tasks:**
- [ ] Create `cdl-to-pansy` converter in GameInfo tools
- [ ] Parse Mesen CDL binary format
- [ ] Output valid Pansy files
- [ ] Test with all existing CDL files
- [ ] Optionally merge with existing Pansy metadata

**Reference CDL Files:**
```
C:\~reference-roms\cdls\
├── Dragon Warrior (U) (PRG1) [!].cdl (80 KB)
├── Dragon Warrior IV (1992-10)(Enix)(US).cdl (512 KB)
├── Final Fantasy - Mystic Quest (U) (V1.1).cdl (512 KB)
├── Secret of Evermore (U) [!].cdl (3 MB)
└── Dragon Quest III - english (patched).cdl (6 MB)
```

---

### Medium Priority

#### Issue: Cross-Reference Export in Pansy
**Priority:** Medium  
**Labels:** enhancement, pansy, phase-2

**Description:**
Extend PansyExporter to include cross-reference data (who calls what).

**Tasks:**
- [ ] Track JSR/JMP relationships during CDL
- [ ] Add CROSS_REFERENCES section to exporter
- [ ] Test with games that have complex call graphs
- [ ] Verify xrefs in Pansy viewer

---

#### Issue: Memory Region Export
**Priority:** Medium  
**Labels:** enhancement, pansy, phase-3

**Description:**
Export named memory regions (PRG-ROM, CHR-ROM, SRAM, etc.) to Pansy format.

**Tasks:**
- [ ] Map Mesen2 memory types to Pansy region types
- [ ] Add MEMORY_REGIONS section to exporter
- [ ] Include bank information for banked systems

---

### Low Priority

#### Issue: Pansy Import into Mesen2
**Priority:** Low  
**Labels:** feature, enhancement

**Description:**
Import Pansy files into Mesen2 debugger (reverse of export).

**Tasks:**
- [ ] Parse Pansy binary format
- [ ] Create/update CodeLabels from symbols
- [ ] Create comments from Pansy comments
- [ ] Apply CDL data (code/data marking)

---

## Available CDL Files

| Game | Platform | CDL Size | JSON Size |
|------|----------|----------|-----------|
| Dragon Warrior | NES | 80 KB | 10 KB |
| Dragon Warrior IV | NES | 512 KB | 42 KB |
| Final Fantasy Mystic Quest | SNES | 512 KB | 48 KB |
| Secret of Evermore | SNES | 3 MB | 48 KB |
| Dragon Quest III (patched) | SNES | 6 MB | - |

## Workflow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                      Play-to-Document Workflow                       │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  1. PLAY                    2. DOCUMENT                 3. EXPORT   │
│  ┌─────────┐               ┌─────────────┐              ┌────────┐  │
│  │ Mesen2  │──CDL Logs───▶│ Add Labels  │──Export───▶│ .pansy │  │
│  │ Emulator│               │ Add Comments│              │  file  │  │
│  └─────────┘               └─────────────┘              └────────┘  │
│       │                                                      │      │
│       └──────────── Load CDL ────────────────────────────────┘      │
│                                                                     │
│  4. USE WITH TOOLCHAIN                                              │
│  ┌────────────────────────────────────────────────────────────────┐ │
│  │  🌺 Peony ◀── .pansy ──▶ 🌼 Pansy Viewer ◀── .pansy ──▶ 🌸 Poppy │
│  │  (disasm)                 (view/edit)                  (assemble)│
│  └────────────────────────────────────────────────────────────────┘ │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

## Next Steps

1. **Immediate:**
   - Test Pansy export with DW1 ROM in Mesen2
   - Verify exported file with Pansy CLI

2. **Short-term:**
   - Create CDL-to-Pansy converter
   - Convert all existing CDL files

3. **Medium-term:**
   - Add cross-reference export
   - Add memory region export

4. **Long-term:**
   - Pansy import into Mesen2
   - Two-way synchronization
