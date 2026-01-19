# 📅 Testing Calendar - Daily Schedule

> **Period:** January 20, 2026 - February 16, 2026  
> **Working Days:** 28 days  
> **Daily Time Budget:** 2-3 hours recommended

---

## Week 1: Core Tools (Jan 20-26, 2026)

### Monday, January 20 - 🌼 Pansy UI Testing Part 1
**Time Budget:** 3 hours  
**Focus:** File operations and symbol management

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Setup & launch Pansy.UI | [PANSY-TESTING.md#ui-launch](repos/PANSY-TESTING.md#ui-launch) | 15 min |
| 0:15 | Test: Open .pansy file | [PANSY-TESTING.md#test-open-file](repos/PANSY-TESTING.md#test-open-file) | 20 min |
| 0:35 | Test: Create new file | [PANSY-TESTING.md#test-create-file](repos/PANSY-TESTING.md#test-create-file) | 20 min |
| 0:55 | Test: Add symbols | [PANSY-TESTING.md#test-add-symbol](repos/PANSY-TESTING.md#test-add-symbol) | 30 min |
| 1:25 | Test: Edit symbols | [PANSY-TESTING.md#test-edit-symbol](repos/PANSY-TESTING.md#test-edit-symbol) | 30 min |
| 1:55 | Test: Delete symbols | [PANSY-TESTING.md#test-delete-symbol](repos/PANSY-TESTING.md#test-delete-symbol) | 20 min |
| 2:15 | Test: Symbol search | [PANSY-TESTING.md#test-symbol-search](repos/PANSY-TESTING.md#test-symbol-search) | 30 min |
| 2:45 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 15 min |

**Checklist:**
- [ ] Pansy.UI launches successfully
- [ ] Can open existing .pansy files
- [ ] Can create new .pansy files
- [ ] Symbol CRUD operations work
- [ ] Symbol search works with patterns
- [ ] Results logged

---

### Tuesday, January 21 - 🌼 Pansy UI Testing Part 2
**Time Budget:** 3 hours  
**Focus:** Comments, memory regions, cross-references

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Test: Add comments | [PANSY-TESTING.md#test-add-comment](repos/PANSY-TESTING.md#test-add-comment) | 30 min |
| 0:30 | Test: Edit comments | [PANSY-TESTING.md#test-edit-comment](repos/PANSY-TESTING.md#test-edit-comment) | 20 min |
| 0:50 | Test: Delete comments | [PANSY-TESTING.md#test-delete-comment](repos/PANSY-TESTING.md#test-delete-comment) | 15 min |
| 1:05 | Test: Memory regions | [PANSY-TESTING.md#test-memory-regions](repos/PANSY-TESTING.md#test-memory-regions) | 45 min |
| 1:50 | Test: Cross-references | [PANSY-TESTING.md#test-cross-refs](repos/PANSY-TESTING.md#test-cross-refs) | 30 min |
| 2:20 | Test: Call graph viz | [PANSY-TESTING.md#test-call-graph](repos/PANSY-TESTING.md#test-call-graph) | 25 min |
| 2:45 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 15 min |

**Checklist:**
- [ ] Comment CRUD operations work
- [ ] Memory region CRUD operations work
- [ ] Cross-reference filtering works
- [ ] Call graph renders correctly
- [ ] Graph zoom works
- [ ] Results logged

---

### Wednesday, January 22 - 🌼 Pansy CLI & Roundtrip
**Time Budget:** 3 hours  
**Focus:** CLI commands and format verification

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Test: `pansy info` | [PANSY-TESTING.md#test-cli-info](repos/PANSY-TESTING.md#test-cli-info) | 20 min |
| 0:20 | Test: `pansy symbols` | [PANSY-TESTING.md#test-cli-symbols](repos/PANSY-TESTING.md#test-cli-symbols) | 20 min |
| 0:40 | Test: `pansy find` | [PANSY-TESTING.md#test-cli-find](repos/PANSY-TESTING.md#test-cli-find) | 20 min |
| 1:00 | Test: `pansy xrefs` | [PANSY-TESTING.md#test-cli-xrefs](repos/PANSY-TESTING.md#test-cli-xrefs) | 25 min |
| 1:25 | Test: `pansy diff` | [PANSY-TESTING.md#test-cli-diff](repos/PANSY-TESTING.md#test-cli-diff) | 25 min |
| 1:50 | Test: Roundtrip write/read | [PANSY-TESTING.md#test-roundtrip](repos/PANSY-TESTING.md#test-roundtrip) | 40 min |
| 2:30 | Test: Binary format inspection | [PANSY-TESTING.md#test-binary-format](repos/PANSY-TESTING.md#test-binary-format) | 20 min |
| 2:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] All CLI commands work
- [ ] CLI output formatting correct
- [ ] Roundtrip preserves all data
- [ ] Binary format matches spec
- [ ] Results logged

---

### Thursday, January 23 - 🌺 Peony Disassembly Part 1
**Time Budget:** 3 hours  
**Focus:** NES ROM disassembly

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Setup test ROMs | [PEONY-TESTING.md#setup](repos/PEONY-TESTING.md#setup) | 15 min |
| 0:15 | Test: NES disassembly | [PEONY-TESTING.md#test-nes-disasm](repos/PEONY-TESTING.md#test-nes-disasm) | 45 min |
| 1:00 | Verify: Opcode accuracy | [PEONY-TESTING.md#verify-opcodes](repos/PEONY-TESTING.md#verify-opcodes) | 30 min |
| 1:30 | Verify: Label detection | [PEONY-TESTING.md#verify-labels](repos/PEONY-TESTING.md#verify-labels) | 30 min |
| 2:00 | Test: Pansy output | [PEONY-TESTING.md#test-pansy-output](repos/PEONY-TESTING.md#test-pansy-output) | 30 min |
| 2:30 | Test: Various mappers | [PEONY-TESTING.md#test-mappers](repos/PEONY-TESTING.md#test-mappers) | 20 min |
| 2:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] NES ROMs disassemble correctly
- [ ] All 6502 opcodes decoded properly
- [ ] Labels auto-detected
- [ ] .pansy file generated
- [ ] Multiple mappers work
- [ ] Results logged

---

### Friday, January 24 - 🌺 Peony Disassembly Part 2
**Time Budget:** 3 hours  
**Focus:** SNES ROM disassembly

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Test: SNES LoROM | [PEONY-TESTING.md#test-snes-lorom](repos/PEONY-TESTING.md#test-snes-lorom) | 45 min |
| 0:45 | Test: SNES HiROM | [PEONY-TESTING.md#test-snes-hirom](repos/PEONY-TESTING.md#test-snes-hirom) | 45 min |
| 1:30 | Verify: 65816 opcodes | [PEONY-TESTING.md#verify-65816](repos/PEONY-TESTING.md#verify-65816) | 30 min |
| 2:00 | Test: Bank boundaries | [PEONY-TESTING.md#test-banks](repos/PEONY-TESTING.md#test-banks) | 30 min |
| 2:30 | Test: Output formats | [PEONY-TESTING.md#test-output-formats](repos/PEONY-TESTING.md#test-output-formats) | 20 min |
| 2:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] SNES LoROM disassembles
- [ ] SNES HiROM disassembles
- [ ] 65816 opcodes correct
- [ ] Bank boundaries handled
- [ ] Output formats work
- [ ] Results logged

---

### Saturday, January 25 - 🌷 Poppy Assembly Part 1
**Time Budget:** 2 hours  
**Focus:** Basic assembly and NES output

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Test: Hello World NES | [POPPY-TESTING.md#test-hello-nes](repos/POPPY-TESTING.md#test-hello-nes) | 30 min |
| 0:30 | Verify: Binary output | [POPPY-TESTING.md#verify-binary](repos/POPPY-TESTING.md#verify-binary) | 20 min |
| 0:50 | Test: All 6502 opcodes | [POPPY-TESTING.md#test-6502-opcodes](repos/POPPY-TESTING.md#test-6502-opcodes) | 40 min |
| 1:30 | Test: Addressing modes | [POPPY-TESTING.md#test-addressing](repos/POPPY-TESTING.md#test-addressing) | 20 min |
| 1:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] NES ROM assembles
- [ ] Binary matches expected
- [ ] All 6502 opcodes work
- [ ] Addressing modes correct
- [ ] Results logged

---

### Sunday, January 26 - 🌷 Poppy Assembly Part 2
**Time Budget:** 2 hours  
**Focus:** SNES assembly and advanced features

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Test: SNES LoROM | [POPPY-TESTING.md#test-snes-lorom](repos/POPPY-TESTING.md#test-snes-lorom) | 30 min |
| 0:30 | Test: 65816 opcodes | [POPPY-TESTING.md#test-65816-opcodes](repos/POPPY-TESTING.md#test-65816-opcodes) | 40 min |
| 1:10 | Test: Directives | [POPPY-TESTING.md#test-directives](repos/POPPY-TESTING.md#test-directives) | 30 min |
| 1:40 | Test: Error messages | [POPPY-TESTING.md#test-errors](repos/POPPY-TESTING.md#test-errors) | 15 min |
| 1:55 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 5 min |

**Checklist:**
- [ ] SNES ROM assembles
- [ ] 65816 opcodes work
- [ ] Directives work
- [ ] Error messages clear
- [ ] Results logged

---

## Week 2: Integration (Jan 27 - Feb 2, 2026)

### Monday, January 27 - 🎮 Mesen2 Testing Part 1
**Time Budget:** 3 hours  
**Focus:** Pansy export functionality

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Build Mesen2 pansy-export | [MESEN2-TESTING.md#build](repos/MESEN2-TESTING.md#build) | 30 min |
| 0:30 | Load NES ROM | [MESEN2-TESTING.md#load-nes](repos/MESEN2-TESTING.md#load-nes) | 15 min |
| 0:45 | Add debug labels | [MESEN2-TESTING.md#add-labels](repos/MESEN2-TESTING.md#add-labels) | 30 min |
| 1:15 | Export Pansy file | [MESEN2-TESTING.md#export-pansy](repos/MESEN2-TESTING.md#export-pansy) | 20 min |
| 1:35 | Verify with Pansy CLI | [MESEN2-TESTING.md#verify-export](repos/MESEN2-TESTING.md#verify-export) | 25 min |
| 2:00 | Test auto-export | [MESEN2-TESTING.md#test-auto-export](repos/MESEN2-TESTING.md#test-auto-export) | 30 min |
| 2:30 | Test SNES export | [MESEN2-TESTING.md#test-snes-export](repos/MESEN2-TESTING.md#test-snes-export) | 20 min |
| 2:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] Mesen2 builds successfully
- [ ] Debug labels can be added
- [ ] Pansy export works
- [ ] Export verified by CLI
- [ ] Auto-export works
- [ ] SNES export works
- [ ] Results logged

---

### Tuesday, January 28 - 🎮 Mesen2 Testing Part 2
**Time Budget:** 3 hours  
**Focus:** Multi-platform and edge cases

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Test: GB export | [MESEN2-TESTING.md#test-gb-export](repos/MESEN2-TESTING.md#test-gb-export) | 30 min |
| 0:30 | Test: GBA export | [MESEN2-TESTING.md#test-gba-export](repos/MESEN2-TESTING.md#test-gba-export) | 30 min |
| 1:00 | Test: PC Engine | [MESEN2-TESTING.md#test-pce-export](repos/MESEN2-TESTING.md#test-pce-export) | 30 min |
| 1:30 | Test: Large ROMs | [MESEN2-TESTING.md#test-large-roms](repos/MESEN2-TESTING.md#test-large-roms) | 30 min |
| 2:00 | Test: Unicode labels | [MESEN2-TESTING.md#test-unicode](repos/MESEN2-TESTING.md#test-unicode) | 20 min |
| 2:20 | Test: Empty labels | [MESEN2-TESTING.md#test-empty](repos/MESEN2-TESTING.md#test-empty) | 20 min |
| 2:40 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 20 min |

**Checklist:**
- [ ] GB export works
- [ ] GBA export works
- [ ] PCE export works
- [ ] Large ROMs handled
- [ ] Unicode supported
- [ ] Edge cases handled
- [ ] Results logged

---

### Wednesday, January 29 - Integration: Pansy ↔ Peony
**Time Budget:** 3 hours  
**Focus:** Disassembly to metadata roundtrip

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Disassemble NES ROM | [INTEGRATION-PANSY-PEONY.md#step1](integration/INTEGRATION-PANSY-PEONY.md#step1) | 30 min |
| 0:30 | Open .pansy in UI | [INTEGRATION-PANSY-PEONY.md#step2](integration/INTEGRATION-PANSY-PEONY.md#step2) | 20 min |
| 0:50 | Edit metadata | [INTEGRATION-PANSY-PEONY.md#step3](integration/INTEGRATION-PANSY-PEONY.md#step3) | 30 min |
| 1:20 | Re-disassemble with metadata | [INTEGRATION-PANSY-PEONY.md#step4](integration/INTEGRATION-PANSY-PEONY.md#step4) | 30 min |
| 1:50 | Verify labels in output | [INTEGRATION-PANSY-PEONY.md#step5](integration/INTEGRATION-PANSY-PEONY.md#step5) | 30 min |
| 2:20 | Test SNES workflow | [INTEGRATION-PANSY-PEONY.md#snes-workflow](integration/INTEGRATION-PANSY-PEONY.md#snes-workflow) | 30 min |
| 2:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] Peony generates .pansy
- [ ] Pansy UI opens file
- [ ] Edits saved correctly
- [ ] Peony uses edited metadata
- [ ] Labels appear in disassembly
- [ ] SNES workflow works
- [ ] Results logged

---

### Thursday, January 30 - Integration: Pansy ↔ Poppy
**Time Budget:** 3 hours  
**Focus:** Assembly with metadata

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Create .pansy with symbols | [INTEGRATION-PANSY-POPPY.md#step1](integration/INTEGRATION-PANSY-POPPY.md#step1) | 30 min |
| 0:30 | Write assembly source | [INTEGRATION-PANSY-POPPY.md#step2](integration/INTEGRATION-PANSY-POPPY.md#step2) | 30 min |
| 1:00 | Assemble with Poppy | [INTEGRATION-PANSY-POPPY.md#step3](integration/INTEGRATION-PANSY-POPPY.md#step3) | 30 min |
| 1:30 | Verify symbols in output | [INTEGRATION-PANSY-POPPY.md#step4](integration/INTEGRATION-PANSY-POPPY.md#step4) | 30 min |
| 2:00 | Test symbol import | [INTEGRATION-PANSY-POPPY.md#step5](integration/INTEGRATION-PANSY-POPPY.md#step5) | 30 min |
| 2:30 | Test symbol export | [INTEGRATION-PANSY-POPPY.md#step6](integration/INTEGRATION-PANSY-POPPY.md#step6) | 20 min |
| 2:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] Symbols from .pansy used
- [ ] Assembly completes
- [ ] Output ROM correct
- [ ] Symbol import works
- [ ] Symbol export works
- [ ] Results logged

---

### Friday, January 31 - Full Roundtrip Testing
**Time Budget:** 3 hours  
**Focus:** Complete workflow: ROM → Disasm → Edit → Assemble → ROM

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | ROM → Peony disassembly | [INTEGRATION-FULL-ROUNDTRIP.md#step1](integration/INTEGRATION-FULL-ROUNDTRIP.md#step1) | 30 min |
| 0:30 | Peony → Pansy metadata | [INTEGRATION-FULL-ROUNDTRIP.md#step2](integration/INTEGRATION-FULL-ROUNDTRIP.md#step2) | 20 min |
| 0:50 | Edit in Pansy UI | [INTEGRATION-FULL-ROUNDTRIP.md#step3](integration/INTEGRATION-FULL-ROUNDTRIP.md#step3) | 30 min |
| 1:20 | Poppy assembly | [INTEGRATION-FULL-ROUNDTRIP.md#step4](integration/INTEGRATION-FULL-ROUNDTRIP.md#step4) | 30 min |
| 1:50 | Compare ROMs | [INTEGRATION-FULL-ROUNDTRIP.md#step5](integration/INTEGRATION-FULL-ROUNDTRIP.md#step5) | 30 min |
| 2:20 | Test in emulator | [INTEGRATION-FULL-ROUNDTRIP.md#step6](integration/INTEGRATION-FULL-ROUNDTRIP.md#step6) | 30 min |
| 2:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] Disassembly successful
- [ ] Metadata generated
- [ ] Edits preserved
- [ ] Assembly successful
- [ ] ROMs match (or documented changes)
- [ ] ROM runs in emulator
- [ ] Results logged

---

### Saturday, February 1 - 📦 bps-patch Testing
**Time Budget:** 2 hours  
**Focus:** Patch creation and application

| Time | Task | Document | Duration |
|------|------|----------|----------|
| 0:00 | Test: Create patch | [BPS-PATCH-TESTING.md#test-create](repos/BPS-PATCH-TESTING.md#test-create) | 30 min |
| 0:30 | Test: Apply patch | [BPS-PATCH-TESTING.md#test-apply](repos/BPS-PATCH-TESTING.md#test-apply) | 30 min |
| 1:00 | Test: Roundtrip | [BPS-PATCH-TESTING.md#test-roundtrip](repos/BPS-PATCH-TESTING.md#test-roundtrip) | 30 min |
| 1:30 | Test: Large files | [BPS-PATCH-TESTING.md#test-large](repos/BPS-PATCH-TESTING.md#test-large) | 20 min |
| 1:50 | Log results | [TEST-RESULTS.md](TEST-RESULTS.md) | 10 min |

**Checklist:**
- [ ] Patch creation works
- [ ] Patch application works
- [ ] Roundtrip successful
- [ ] Large files handled
- [ ] Results logged

---

### Sunday, February 2 - Buffer Day
**Time Budget:** 2 hours  
**Focus:** Catch up and issue investigation

| Time | Task | Duration |
|------|------|----------|
| 0:00 | Review Week 2 results | 30 min |
| 0:30 | Investigate any failures | 60 min |
| 1:30 | Update documentation | 20 min |
| 1:50 | Prepare for Week 3 | 10 min |

---

## Week 3: Game Projects (Feb 3-9, 2026)

### Monday, February 3 - 🐉 Dragon Warrior IV Part 1
**Time Budget:** 3 hours  
**Focus:** ROM structure and build system

See [DW4-TESTING.md](repos/DW4-TESTING.md) for detailed steps.

---

### Tuesday, February 4 - 🐉 Dragon Warrior IV Part 2
**Time Budget:** 3 hours  
**Focus:** Asset extraction and conversion

See [DW4-TESTING.md](repos/DW4-TESTING.md) for detailed steps.

---

### Wednesday, February 5 - 🐉 Dragon Warrior I
**Time Budget:** 3 hours  
**Focus:** Disassembly verification

See [DW1-TESTING.md](repos/DW1-TESTING.md) for detailed steps.

---

### Thursday, February 6 - ⚔️ FFMQ Part 1
**Time Budget:** 3 hours  
**Focus:** SNES disassembly and build

See [FFMQ-TESTING.md](repos/FFMQ-TESTING.md) for detailed steps.

---

### Friday, February 7 - ⚔️ FFMQ Part 2
**Time Budget:** 3 hours  
**Focus:** Asset tools and editors

See [FFMQ-TESTING.md](repos/FFMQ-TESTING.md) for detailed steps.

---

### Saturday, February 8 - 🏰 DQ3r Testing
**Time Budget:** 2 hours  
**Focus:** Analysis tools

See [DQ3R-TESTING.md](repos/DQ3R-TESTING.md) for detailed steps.

---

### Sunday, February 9 - 🏰 DQ4r Testing
**Time Budget:** 2 hours  
**Focus:** Remix build system

See [DQ4R-TESTING.md](repos/DQ4R-TESTING.md) for detailed steps.

---

## Week 4: Polish & Documentation (Feb 10-16, 2026)

### Monday-Wednesday, February 10-12 - 🔧 GameInfo Toolkit
**Time Budget:** 3 hours/day  
**Focus:** Tool validation

See [GAMEINFO-TESTING.md](repos/GAMEINFO-TESTING.md) for detailed steps.

---

### Thursday, February 13 - 📊 logsmall Testing
**Time Budget:** 2 hours  
**Focus:** Library validation

See [LOGSMALL-TESTING.md](repos/LOGSMALL-TESTING.md) for detailed steps.

---

### Friday, February 14 - 🔬 DiztinGUIsh Testing
**Time Budget:** 2 hours  
**Focus:** Integration verification

See [DIZTINGUISH-TESTING.md](repos/DIZTINGUISH-TESTING.md) for detailed steps.

---

### Saturday-Sunday, February 15-16 - Final Review
**Time Budget:** 4 hours total  
**Focus:** Documentation and sign-off

| Time | Task | Duration |
|------|------|----------|
| 0:00 | Compile final test results | 60 min |
| 1:00 | Document all discovered issues | 60 min |
| 2:00 | Create release notes | 30 min |
| 2:30 | Update roadmaps | 30 min |
| 3:00 | Final sign-off checklist | 60 min |

---

## Quick Reference

### Daily Workflow
1. Open this calendar
2. Find today's section
3. Follow linked test documents
4. Log results in [TEST-RESULTS.md](TEST-RESULTS.md)
5. Report issues in [ISSUES-LOG.md](ISSUES-LOG.md)

### If You Fall Behind
- Use buffer days to catch up
- Prioritize P1 tests
- Skip P3 tests if needed
- Document what was skipped

### If You Finish Early
- Move to next day's tasks
- Re-test any failures
- Explore edge cases
- Improve documentation
