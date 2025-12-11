# CDL Viewer - UI Manual Testing

> **Parent Guide:** [UI Overview](README.md)  
> **GitHub Issue:** [#34](https://github.com/TheAnsarya/GameInfo/issues/34)  
> **Related:** [#4](https://github.com/TheAnsarya/GameInfo/issues/4) (CDL Visualization)

## 📋 Overview

The CDL Viewer displays coverage data from emulator Code/Data Log files with both ASCII and graphical heatmap visualizations.

## 🎯 Prerequisites

- [ ] GameInfo UI application launches
- [ ] Sample CDL files available (FCEUX, Mesen, or bsnes format)
- [ ] ROM file for context (optional)

---

## ✅ Test Checklist

### Loading CDL Files
- [ ] TEST-CDL-UI-001: Open CDL file dialog
- [ ] TEST-CDL-UI-002: Load FCEUX CDL
- [ ] TEST-CDL-UI-003: Load Mesen CDL
- [ ] TEST-CDL-UI-004: Handle invalid file

### ASCII Heatmap Tab
- [ ] TEST-CDL-UI-005: ASCII heatmap displays
- [ ] TEST-CDL-UI-006: Legend visible
- [ ] TEST-CDL-UI-007: Scrolling works
- [ ] TEST-CDL-UI-008: Bank navigation

### Graphical Heatmap Tab
- [ ] TEST-CDL-UI-009: Graphical heatmap displays
- [ ] TEST-CDL-UI-010: Colors correct (code=green, data=yellow)
- [ ] TEST-CDL-UI-011: Tooltips show info
- [ ] TEST-CDL-UI-012: Zoom/scale works

### Statistics Panel
- [ ] TEST-CDL-UI-013: Coverage percentages shown
- [ ] TEST-CDL-UI-014: Byte counts accurate
- [ ] TEST-CDL-UI-015: Progress bar updates

### Tab Switching
- [ ] TEST-CDL-UI-016: Switch ASCII ↔ Graphical
- [ ] TEST-CDL-UI-017: State preserved on switch

---

## 🧪 Detailed Test Instructions

### TEST-CDL-UI-001: Open CDL File Dialog

**Purpose:** Verify file open dialog works correctly.

**Steps:**
1. Launch GameInfo UI
2. Go to View → CDL Viewer (or Tools → CDL Viewer)
3. Click "Open CDL" button or File → Open

**Expected Result:**
- File dialog opens
- Filter shows CDL file types (*.cdl, *.mcdl)
- Can browse to and select files

**Verification:**
- [ ] Dialog opens
- [ ] Filter correct
- [ ] Can navigate directories

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-002: Load FCEUX CDL

**Purpose:** Verify FCEUX format CDL loads correctly.

**Prerequisites:**
- FCEUX .cdl file

**Steps:**
1. Open CDL Viewer
2. Load an FCEUX .cdl file
3. Wait for processing

**Expected Result:**
- File loads without error
- Format detected as "FCEUX"
- Statistics populate
- Heatmap displays

**Verification:**
- [ ] No error dialog
- [ ] Format shown correctly
- [ ] Coverage data displayed

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-003: Load Mesen CDL

**Purpose:** Verify Mesen format CDL loads correctly.

**Prerequisites:**
- Mesen .mcdl file

**Steps:**
1. Open CDL Viewer
2. Load a Mesen .mcdl file

**Expected Result:**
- File loads without error
- Format detected as "Mesen"
- All data displayed correctly

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-004: Handle Invalid File

**Purpose:** Verify graceful handling of invalid files.

**Steps:**
1. Try to load a non-CDL file (e.g., .txt, .png)
2. Observe result

**Expected Result:**
- Clear error message
- No crash
- UI remains functional

**Verification:**
- [ ] Error message helpful
- [ ] No unhandled exception
- [ ] Can try again with valid file

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-005: ASCII Heatmap Displays

**Purpose:** Verify ASCII heatmap tab shows coverage.

**Steps:**
1. Load a CDL file
2. Click "ASCII Heatmap" tab (if not default)

**Expected Result:**
```
CDL Heatmap
════════════════════════════════════════════════════════════
Legend: C=Code  D=Data  #=Both  ░=Unknown

Bank 0:
CCCCDDDD####CCCC░░░░DDDDCCCC####████░░░░CCCCDDDD████████░░░░░░░░
DDDDCCCC████████████CCCCDDDD░░░░░░░░CCCCDDDDCCCC████████░░░░░░░░
...
```

**Verification:**
- [ ] Characters display correctly
- [ ] Monospace font used
- [ ] Readable and aligned

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-006: Legend Visible

**Purpose:** Verify heatmap legend is shown.

**Steps:**
1. View ASCII heatmap
2. Locate legend

**Expected Result:**
- Legend explains symbols
- Clear color/symbol meanings
- Easy to understand

**Verification:**
- [ ] Legend present
- [ ] All symbols explained
- [ ] Positioned clearly

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-007: ASCII Scrolling Works

**Purpose:** Verify scrolling through large heatmaps.

**Steps:**
1. Load CDL for large ROM
2. Scroll down through heatmap
3. Scroll up

**Expected Result:**
- Smooth scrolling
- Content renders correctly at all positions
- No visual glitches

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-008: Bank Navigation

**Purpose:** Verify navigation between banks.

**Steps:**
1. Load multi-bank CDL
2. If bank selector exists, switch banks
3. Or scroll to different bank sections

**Expected Result:**
- Can view different banks
- Bank labels/headers shown
- Data matches selected bank

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-009: Graphical Heatmap Displays

**Purpose:** Verify graphical/colored heatmap tab.

**Steps:**
1. Load a CDL file
2. Click "Graphical Heatmap" tab

**Expected Result:**
- Grid of colored cells appears
- Cells colored based on coverage type
- Smooth rendering

**Verification:**
- [ ] Grid displays
- [ ] Colors visible
- [ ] No rendering errors

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-010: Colors Correct

**Purpose:** Verify color coding is accurate.

**Expected Colors:**
| Coverage Type | Color |
|---------------|-------|
| Code | Green (#00FF00 or similar) |
| Data | Yellow (#FFFF00 or similar) |
| Both | Cyan or Blue |
| Unknown | Gray |

**Steps:**
1. View graphical heatmap
2. Identify areas with different coverage types
3. Verify colors match expectations

**Verification:**
- [ ] Code regions are green
- [ ] Data regions are yellow
- [ ] Unknown is clearly different
- [ ] Colors are distinguishable

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-011: Tooltips Show Info

**Purpose:** Verify tooltips provide detailed information.

**Steps:**
1. View graphical heatmap
2. Hover mouse over a cell
3. Wait for tooltip

**Expected Result:**
Tooltip shows:
- Address range
- Coverage type (Code/Data/Both/Unknown)
- Byte count
- Percentage (optional)

**Example Tooltip:**
```
Address: $8000-$80FF
Type: Code
Bytes: 256
Coverage: 100%
```

**Verification:**
- [ ] Tooltip appears on hover
- [ ] Information accurate
- [ ] Readable formatting

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-012: Zoom/Scale Works

**Purpose:** Verify zoom or scale controls.

**Steps:**
1. View graphical heatmap
2. If zoom controls exist:
   - Zoom in
   - Zoom out
   - Reset to default
3. Or try mouse wheel zoom

**Expected Result:**
- Can increase detail level
- Can zoom out for overview
- Rendering stays clean at all levels

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-013: Coverage Percentages Shown

**Purpose:** Verify statistics panel shows percentages.

**Steps:**
1. Load CDL file
2. Locate statistics panel/section

**Expected Result:**
```
Coverage Statistics
═══════════════════
Code:    42.3%
Data:    28.1%
Both:     5.2%
Unknown: 24.4%

Total Logged: 75.6%
```

**Verification:**
- [ ] Percentages displayed
- [ ] Values sum correctly
- [ ] Updates when file changes

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-014: Byte Counts Accurate

**Purpose:** Verify raw byte counts are shown.

**Steps:**
1. View statistics panel
2. Check byte counts

**Expected Result:**
- Shows actual byte numbers
- Code bytes: XXXX
- Data bytes: XXXX
- Total matches file size

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-015: Progress Bar Updates

**Purpose:** Verify visual progress indicator.

**Steps:**
1. View statistics panel
2. Look for progress bar or visual indicator

**Expected Result:**
- Progress bar shows coverage level
- Color-coded sections (optional)
- Updates with data

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-016: Switch ASCII ↔ Graphical

**Purpose:** Verify tab switching works.

**Steps:**
1. Load CDL file
2. Click ASCII tab
3. Click Graphical tab
4. Switch back and forth several times

**Expected Result:**
- Instant or fast switching
- Each view renders correctly
- No data loss between switches

**Verification:**
- [ ] ASCII tab works
- [ ] Graphical tab works
- [ ] No lag or glitches

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

### TEST-CDL-UI-017: State Preserved on Switch

**Purpose:** Verify scroll position and settings preserved.

**Steps:**
1. Scroll to specific location in ASCII view
2. Switch to Graphical tab
3. Switch back to ASCII tab

**Expected Result:**
- Scroll position preserved
- Selected bank preserved (if applicable)
- Settings maintained

**Result:** ☐ Pass ☐ Fail ☐ Blocked

---

## 📊 Test Results Summary

| Test ID | Description | Status |
|---------|-------------|--------|
| TEST-CDL-UI-001 | Open dialog | ☐ |
| TEST-CDL-UI-002 | Load FCEUX | ☐ |
| TEST-CDL-UI-003 | Load Mesen | ☐ |
| TEST-CDL-UI-004 | Invalid file | ☐ |
| TEST-CDL-UI-005 | ASCII heatmap | ☐ |
| TEST-CDL-UI-006 | Legend | ☐ |
| TEST-CDL-UI-007 | Scrolling | ☐ |
| TEST-CDL-UI-008 | Bank nav | ☐ |
| TEST-CDL-UI-009 | Graphical heatmap | ☐ |
| TEST-CDL-UI-010 | Colors | ☐ |
| TEST-CDL-UI-011 | Tooltips | ☐ |
| TEST-CDL-UI-012 | Zoom | ☐ |
| TEST-CDL-UI-013 | Percentages | ☐ |
| TEST-CDL-UI-014 | Byte counts | ☐ |
| TEST-CDL-UI-015 | Progress bar | ☐ |
| TEST-CDL-UI-016 | Tab switch | ☐ |
| TEST-CDL-UI-017 | State preserved | ☐ |

**Total:** 0/17 tests completed

---

**Previous:** [Hex Editor](hex-editor.md)  
**Next:** [Disassembler](disassembler.md)
