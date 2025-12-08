# GameInfo - Planned GitHub Issues

Enable GitHub Issues in your repository settings first, then create these issues.

---

## Issue 1: CDL Editor Enhancements

**Title:** CDL Editor - Add advanced editing features

**Labels:** enhancement, tools

**Description:**
Add advanced editing capabilities to the CDL editor tool:

- [ ] Region selection and bulk editing in GUI
- [ ] Undo/redo support
- [ ] Search functionality (find specific byte patterns)
- [ ] Bookmark system for marking interesting offsets
- [ ] Side-by-side comparison view for two CDL files
- [ ] Integration with label files (.mlb, .nl) for named regions
- [ ] Dark mode theme option

**Priority:** Medium

---

## Issue 2: CDL Build System Improvements  

**Title:** CDL Build System - Add CI/CD integration

**Labels:** enhancement, tools, automation

**Description:**
Improve the CDL build system with automation features:

- [ ] GitHub Actions workflow for automatic CDL builds
- [ ] Automatic coverage tracking over time
- [ ] Coverage badges for README
- [ ] Slack/Discord notifications on coverage changes
- [ ] Diff reports when PRs are merged
- [ ] Archive historical CDL versions

**Priority:** Low

---

## Issue 3: Add More File Format Documentation

**Title:** Document additional emulator file formats

**Labels:** documentation

**Description:**
Add documentation for other common emulator file formats:

- [ ] MLB (Mesen Label) file format
- [ ] NL (FCEUX Name List) file format  
- [ ] DBG (Debug symbols) file format
- [ ] MSS (Mesen Save State) file format
- [ ] TBL (Text Table) file format specification
- [ ] IPS/BPS patch file formats

**Priority:** Medium

---

## Issue 4: CDL Visualization Tool

**Title:** Create CDL visualization/heatmap tool

**Labels:** enhancement, tools, visualization

**Description:**
Create a visual representation of CDL coverage:

- [ ] Memory map heatmap showing coverage density
- [ ] Bank-by-bank visual comparison
- [ ] Timeline view showing coverage growth over sessions
- [ ] Interactive web-based viewer
- [ ] Export visualizations as images/SVG

**Priority:** Low

---

## Issue 5: Cross-Platform CDL Conversion

**Title:** Add CDL format conversion between emulators

**Labels:** enhancement, tools

**Description:**
Support converting CDL files between different emulator formats:

- [ ] FCEUX to Mesen conversion
- [ ] Mesen to FCEUX conversion
- [ ] Support for Bizhawk CDL format
- [ ] Support for other emulator formats (Nestopia, etc.)
- [ ] Batch conversion utility

**Priority:** Medium

---

## Issue 6: Test Suite for CDL Tools

**Title:** Add comprehensive test suite for CDL tools

**Labels:** testing, tools

**Description:**
Create unit tests and integration tests for the CDL tools:

- [ ] Unit tests for CDLFile class
- [ ] Unit tests for CDLBuilder class
- [ ] Integration tests for merge operations
- [ ] Integration tests for diff operations
- [ ] Test CDL files for different scenarios
- [ ] CI workflow to run tests on PR

**Priority:** High

---

## Issue 7: ROM Analysis Integration

**Title:** Integrate CDL tools with ROM analysis

**Labels:** enhancement, tools

**Description:**
Connect CDL data with ROM analysis tools:

- [ ] Auto-generate labels from CDL code regions
- [ ] Identify potential function boundaries
- [ ] Detect data table patterns
- [ ] Export analysis to disassembler formats
- [ ] Cross-reference with existing label files

**Priority:** Medium

---

## How to Create These Issues

1. Go to https://github.com/TheAnsarya/GameInfo/issues
2. Click "New Issue"
3. Copy the title and description for each issue
4. Add appropriate labels
5. Submit

Or use GitHub CLI:
```bash
gh issue create --title "Issue Title" --body "Description" --label "enhancement"
```
