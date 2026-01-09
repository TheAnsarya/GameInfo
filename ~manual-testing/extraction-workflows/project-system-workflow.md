# Project System Workflows

Step-by-step procedures for using the GameInfo project system to manage ROM hacking projects.

## 📚 Guides

| Guide | Description |
|-------|-------------|
| [Creating Projects](#creating-a-new-project) | Start a new ROM hacking project |
| [Opening Projects](#opening-an-existing-project) | Load saved project files |
| [Asset Management](#asset-management) | Browse, view, and edit extracted assets |
| [File Dialogs](#file-dialog-testing) | Manual testing for browse dialogs |

## Creating a New Project

### Prerequisites
- GameInfoTools application installed
- Original ROM file (not modified)
- Target location for .giproj file

### Step-by-Step

1. **Launch Application**
   - Open GameInfoTools UI application
   - Project Explorer should be visible on left panel

2. **Open Project Wizard**
   - Click "New Project" button (📁+) or use Ctrl+Shift+N
   - Project Creation Wizard opens

3. **Select ROM File**
   - Click "Browse..." next to ROM Path field
   - Navigate to your ROM file
   - Supported formats: `.nes`, `.sfc`, `.smc`, `.gb`, `.gbc`, `.gba`, `.bin`
   - Select file and click "Open"

4. **Configure Project**
   - Enter Project Name (default from ROM filename)
   - Click "Browse..." for project location
   - Choose save location for `.giproj` file
   - Platform auto-detected from ROM extension

5. **Auto-Detection**
   - Game title detected from ROM header
   - Available extractors listed based on game
   - Extractor selection shown

6. **Create Project**
   - Click "Create Project" button
   - Project file created at selected location
   - Extraction runs automatically
   - Asset tree populates with results

### Expected Results
- `.giproj` JSON file created
- `/assets/` folder with extracted data
- Project Explorer shows asset tree
- Views ready to display asset content

## Opening an Existing Project

### Step-by-Step

1. **Use Open Dialog**
   - Click "Open Project" button (📂) or use Ctrl+O
   - File picker opens

2. **Select Project File**
   - Navigate to `.giproj` file location
   - Select the project file
   - Click "Open"

3. **Project Loads**
   - Project metadata displayed
   - Asset tree populated
   - Ready to browse and edit

### Expected Results
- Project Explorer shows all assets
- Recent projects list updated
- Views can display asset content

## Asset Management

### Browsing Assets

1. **Navigate Tree**
   - Expand/collapse categories in tree view
   - Categories: Graphics, Maps, Data, Audio, Text

2. **View Asset**
   - Double-click asset to open in appropriate view
   - View selected based on asset type
   - Data provider switches to project asset

3. **Edit Asset**
   - Make changes in view
   - Changes tracked in project
   - Save updates project asset

### Asset Types & Views

| Asset Type | View | File Extensions |
|------------|------|-----------------|
| Graphics | Graphics View | `.chr`, `.bin` |
| Palettes | Palette View | `.pal` |
| Maps | Map View | `.map` |
| Data Tables | Hex View | `.dat`, `.bin` |
| Text | Text View | `.txt`, `.tbl` |
| Assembly | Code View | `.asm`, `.inc` |
| Symbols | Text View | `.sym`, `.labels` |

## File Dialog Testing

### Test Case: ROM Browse Dialog

| ID | TC-FD-001 |
|----|-----------|
| **Description** | Test ROM file browse dialog in wizard |
| **Preconditions** | Wizard open on ROM selection step |

| Step | Action | Expected |
|------|--------|----------|
| 1 | Click "Browse..." next to ROM Path | File picker opens |
| 2 | Navigate to folder with ROMs | Files listed |
| 3 | Verify filter shows supported types | `.nes`, `.sfc`, `.smc`, etc. visible |
| 4 | Select a `.nes` file | File selected |
| 5 | Click "Open" | Dialog closes, path populated |

### Test Case: Project Save Dialog

| ID | TC-FD-002 |
|----|-----------|
| **Description** | Test project location browse dialog |
| **Preconditions** | Wizard open on location step |

| Step | Action | Expected |
|------|--------|----------|
| 1 | Click "Browse..." next to Project Path | Save dialog opens |
| 2 | Navigate to target folder | Folder contents shown |
| 3 | Verify filter is `.giproj` | Only project files shown |
| 4 | Enter filename | Filename accepted |
| 5 | Click "Save" | Dialog closes, path populated |

### Test Case: Open Project Dialog

| ID | TC-FD-003 |
|----|-----------|
| **Description** | Test open project dialog |
| **Preconditions** | Application open, existing project available |

| Step | Action | Expected |
|------|--------|----------|
| 1 | Click "Open Project" button | File picker opens |
| 2 | Navigate to project folder | `.giproj` files visible |
| 3 | Select project file | File selected |
| 4 | Click "Open" | Project loads in explorer |

### Regression Tests

#### RT-FD-001: Cancel Dialog
- Open any file dialog
- Click "Cancel" or press Escape
- Verify no changes to application state

#### RT-FD-002: Invalid Selection
- Try to open non-ROM file as ROM
- Verify appropriate error message
- Application remains stable

#### RT-FD-003: Missing File
- Open project pointing to moved ROM
- Verify error handling
- Option to relocate ROM offered

## IDataProvider Testing

The application uses `IDataProvider` to abstract data access between ROM and project assets.

### Test Case: ROM Data Provider

| ID | TC-DP-001 |
|----|-----------|
| **Description** | Verify views work with ROM data |

| Step | Action | Expected |
|------|--------|----------|
| 1 | Open ROM directly (no project) | ROM loads |
| 2 | Open Graphics View | Graphics displayed from ROM |
| 3 | Navigate to different offset | View updates |
| 4 | Verify data matches ROM file | Data correct |

### Test Case: Project Asset Provider

| ID | TC-DP-002 |
|----|-----------|
| **Description** | Verify views work with project assets |

| Step | Action | Expected |
|------|--------|----------|
| 1 | Open project with extracted assets | Project loads |
| 2 | Double-click graphics asset | Graphics View opens |
| 3 | Verify data shows asset content | Extracted tiles displayed |
| 4 | Close and reopen asset | Data persists |

### Test Case: Provider Switching

| ID | TC-DP-003 |
|----|-----------|
| **Description** | Verify switching between data sources |

| Step | Action | Expected |
|------|--------|----------|
| 1 | Open ROM, view graphics | ROM data displayed |
| 2 | Open project asset | Asset data displayed |
| 3 | Switch back to ROM view | ROM data again |
| 4 | Verify no data corruption | All data correct |

## Related Documentation

- [Game-Specific Testing](../game-specific/README.md) - Per-game test procedures
- [Graphics Extraction](graphics-extraction.md) - Manual graphics workflows
