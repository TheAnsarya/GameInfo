# ✅ Daily Testing Checklist

> **Purpose:** Quick daily checklist for testing progress  
> **Print this or copy to your task manager**

---

## Pre-Session Checklist

Before starting any testing session:

- [ ] Computer powered on, plugged in
- [ ] VS Code open with workspace loaded
- [ ] Terminal ready
- [ ] All repositories have latest changes pulled:
  ```powershell
  cd "C:\Users\me\source\repos"
  Get-ChildItem -Directory | ForEach-Object { 
      Write-Host "📂 $($_.Name)"
      Push-Location $_.FullName
      git pull --rebase 2>$null
      Pop-Location
  }
  ```
- [ ] All projects build successfully
- [ ] Test ROMs available
- [ ] Testing documentation open for reference

---

## Week 1 Daily Checklists

### Day 1 (Mon) - Pansy UI Part 1

**Time Budget:** 2 hours

- [ ] Launch Pansy UI successfully
- [ ] Test window operations (resize, minimize, maximize)
- [ ] Test all menu items exist
- [ ] Test File → Open with valid file
- [ ] Test File → Open with invalid file
- [ ] Test File → New
- [ ] Test File → Save
- [ ] Test File → Save As
- [ ] Test unsaved changes warning
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 2 (Tue) - Pansy UI Part 2

**Time Budget:** 2 hours

- [ ] Test Symbols panel - view
- [ ] Test Symbols panel - add
- [ ] Test Symbols panel - edit
- [ ] Test Symbols panel - delete
- [ ] Test Symbols panel - search
- [ ] Test Cross-References panel
- [ ] Test Call Graph panel
- [ ] Test navigation between panels
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 3 (Wed) - Pansy CLI & Roundtrip

**Time Budget:** 2 hours

- [ ] CLI --help works
- [ ] CLI --version works
- [ ] CLI info command works
- [ ] CLI symbols command works
- [ ] CLI find command works
- [ ] CLI xrefs command works
- [ ] CLI convert (to Mesen) works
- [ ] CLI convert (to FCEUX) works
- [ ] Create → Save → Load file identical
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 4 (Thu) - Peony Part 1

**Time Budget:** 2 hours

- [ ] CLI --help works
- [ ] CLI --version works
- [ ] Auto-detect platform works
- [ ] NES disassembly works
- [ ] Output file has correct format
- [ ] All 6502 instructions present
- [ ] All addressing modes correct
- [ ] Vector table correct
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 5 (Fri) - Peony Part 2

**Time Budget:** 2 hours

- [ ] SNES disassembly works
- [ ] 65816 instructions present
- [ ] SEP/REP tracking works
- [ ] LoROM mapping works
- [ ] Pansy export during disassembly
- [ ] Symbol import from file works
- [ ] Error handling (bad file)
- [ ] Performance acceptable
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 6 (Sat) - Poppy Part 1

**Time Budget:** 2 hours

- [ ] CLI --help works
- [ ] CLI --version works
- [ ] Simple file assembles
- [ ] NES ROM with header works
- [ ] All 6502 opcodes work
- [ ] .org directive works
- [ ] .byte/.word/.long work
- [ ] .fill/.align work
- [ ] .define works
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 7 (Sun) - Poppy Part 2 & Integration

**Time Budget:** 3 hours

- [ ] Macros work
- [ ] Local labels work
- [ ] Forward references work
- [ ] .include works
- [ ] .incbin works
- [ ] Error messages helpful
- [ ] CRITICAL: NES roundtrip test
- [ ] Document any issues found

**Notes:**
_______________________________________________

---

## Week 2 Daily Checklists

### Day 8 (Mon) - Mesen2

**Time Budget:** 2 hours

- [ ] Mesen2 builds
- [ ] Mesen2 launches
- [ ] NES ROM loads
- [ ] SNES ROM loads
- [ ] Debugger opens
- [ ] Pansy export menu exists
- [ ] Empty export works
- [ ] Export with labels works
- [ ] Import Pansy file works
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 9 (Tue) - Mesen2 Integration

**Time Budget:** 2 hours

- [ ] Export → Open in Pansy UI
- [ ] Edit in Pansy → Re-import
- [ ] Full workflow test
- [ ] Regression: save states work
- [ ] Regression: breakpoints work
- [ ] Regression: memory viewer works
- [ ] Regression: other exports work
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 10 (Wed) - BPS Patch

**Time Budget:** 2 hours

- [ ] CLI --help works
- [ ] Apply patch (decode) works
- [ ] Create patch (encode) works
- [ ] Roundtrip: create → apply = identical
- [ ] CRC32 validation works
- [ ] Wrong source CRC warned
- [ ] Error: file not found
- [ ] Error: invalid patch format
- [ ] Performance acceptable
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 11 (Thu) - Roundtrip Deep Testing

**Time Budget:** 3 hours

- [ ] Run automated roundtrip script
- [ ] Dragon Warrior IV: PASS/FAIL
- [ ] Dragon Warrior I: PASS/FAIL
- [ ] FFMQ (SNES): PASS/FAIL
- [ ] Investigate any failures
- [ ] Document specific failure offsets
- [ ] Document any issues found

**Notes:**
_______________________________________________

### Day 12-14 (Fri-Sun) - Cross-Tool Integration

**Time Budget:** 2-3 hours each day

- [ ] Pansy ↔ Peony integration
- [ ] Pansy ↔ Poppy integration
- [ ] Mesen2 ↔ Pansy integration
- [ ] Full workflow: ROM → Mesen → Pansy → Peony → Poppy → ROM
- [ ] Document any issues found

**Notes:**
_______________________________________________

---

## Week 3 Daily Checklists

### Days 15-21 - Game Project Testing

Each day, test one game project:

**Dragon Warrior IV (2 days)**
- [ ] Build script works
- [ ] Assets extract
- [ ] ROM builds
- [ ] ROM runs in emulator
- [ ] Tools work

**FFMQ (2 days)**
- [ ] Build script works
- [ ] Assets extract
- [ ] ROM builds
- [ ] ROM runs in emulator
- [ ] Tools work

**Other projects (3 days)**
- [ ] DQ3r tools
- [ ] DQ4r tools
- [ ] GameInfo tools

---

## Week 4 Daily Checklists

### Days 22-28 - Polish & Documentation

- [ ] Re-test any failed items
- [ ] Update documentation
- [ ] Create issue reports
- [ ] Write final summary
- [ ] Plan next testing cycle

---

## Issue Logging Quick Reference

When you find an issue:

1. **Note the details:**
   - Repository:
   - Test section:
   - Steps to reproduce:
   - Expected result:
   - Actual result:
   - Severity (Critical/High/Medium/Low):

2. **Create GitHub issue** (if significant)

3. **Log in** `~manual-testing/issues-log.md`

---

## End-of-Day Routine

- [ ] Save all test results
- [ ] Commit any test file changes
- [ ] Update progress in calendar
- [ ] Note tomorrow's starting point
- [ ] Close unnecessary applications

---

**Print-friendly version available at:** [CHECKLIST-PRINTABLE.md](CHECKLIST-PRINTABLE.md)
