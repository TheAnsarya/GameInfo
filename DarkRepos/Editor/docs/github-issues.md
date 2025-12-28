# Dark Repos Editor - GitHub Issues

This document contains the GitHub issues to be created for the Dark Repos Editor project.

---

## Epic Issues

### Epic 1: Project Foundation
**Title:** [EPIC] Dark Repos Editor - Project Foundation
**Labels:** epic, enhancement, priority-high
**Milestone:** Phase 1 - Foundation

**Description:**
Set up the foundational infrastructure for the Dark Repos Editor project including:
- Blazor project structure
- Design system implementation
- Database layer with EF Core
- Core services and APIs
- Build and deployment pipelines

**Acceptance Criteria:**
- [ ] Solution structure created with all projects
- [ ] Design system implemented with color palette and components
- [ ] SQLite database with EF Core migrations
- [ ] Basic API endpoints functional
- [ ] CI/CD pipeline configured
- [ ] Docker support added

**Sub-issues:**
- #DRE-001 Create solution structure
- #DRE-002 Implement design system
- #DRE-003 Set up database layer
- #DRE-004 Create base API controllers
- #DRE-005 Configure CI/CD

---

### Epic 2: Core Editor Components
**Title:** [EPIC] Dark Repos Editor - Core Editor Components
**Labels:** epic, enhancement, priority-high
**Milestone:** Phase 2 - Core Editors

**Description:**
Implement the core editor components that form the backbone of the application:
- Hex Editor
- Disassembler
- CHR/Graphics Editor
- Text Editor

**Acceptance Criteria:**
- [ ] Hex Editor with full functionality
- [ ] Disassembler with 6502/65816 support
- [ ] CHR Editor with visual tile editing
- [ ] Text Editor with TBL support
- [ ] All editors keyboard accessible
- [ ] Unit tests for all editors

**Sub-issues:**
- #DRE-010 Implement Hex Editor
- #DRE-011 Implement Disassembler
- #DRE-012 Implement CHR Editor
- #DRE-013 Implement Text Editor

---

### Epic 3: Advanced Editors
**Title:** [EPIC] Dark Repos Editor - Advanced Editors
**Labels:** epic, enhancement, priority-medium
**Milestone:** Phase 3 - Advanced Features

**Description:**
Implement advanced editor components:
- Map Editor
- Script Editor
- Data Table Editor
- Palette Editor
- Save Editor

**Acceptance Criteria:**
- [ ] Map Editor with tilemap support
- [ ] Script Editor with syntax highlighting
- [ ] Data Table Editor with schemas
- [ ] Palette Editor with visual picker
- [ ] Save Editor with checksum fixing
- [ ] Full test coverage

**Sub-issues:**
- #DRE-020 Implement Map Editor
- #DRE-021 Implement Script Editor
- #DRE-022 Implement Data Table Editor
- #DRE-023 Implement Palette Editor
- #DRE-024 Implement Save Editor

---

### Epic 4: Analysis Tools
**Title:** [EPIC] Dark Repos Editor - Analysis Tools
**Labels:** epic, enhancement, priority-medium
**Milestone:** Phase 3 - Advanced Features

**Description:**
Implement analysis and visualization tools:
- CDL Viewer
- Bank View
- Symbol Manager
- ROM Analyzer

**Acceptance Criteria:**
- [ ] CDL Viewer with heatmap
- [ ] Bank View with content analysis
- [ ] Symbol Manager with import/export
- [ ] ROM Analyzer with structure detection
- [ ] Accessible interfaces

**Sub-issues:**
- #DRE-030 Implement CDL Viewer
- #DRE-031 Implement Bank View
- #DRE-032 Implement Symbol Manager
- #DRE-033 Implement ROM Analyzer

---

### Epic 5: Desktop Application
**Title:** [EPIC] Dark Repos Editor - Desktop Application
**Labels:** epic, enhancement, priority-medium
**Milestone:** Phase 4 - Desktop & Polish

**Description:**
Create native desktop application using MAUI Blazor Hybrid:
- Windows installer
- macOS app bundle
- Linux AppImage
- System tray integration
- File associations

**Acceptance Criteria:**
- [ ] Windows installer working
- [ ] macOS app bundle signed
- [ ] Linux AppImage functional
- [ ] System tray with status
- [ ] ROM file associations
- [ ] Auto-update mechanism

**Sub-issues:**
- #DRE-040 Set up MAUI Blazor Hybrid
- #DRE-041 Create Windows installer
- #DRE-042 Create macOS app bundle
- #DRE-043 Create Linux AppImage
- #DRE-044 Implement system tray
- #DRE-045 Add file associations

---

## Detailed Sub-Issues

### DRE-001: Create Solution Structure
**Title:** Create solution structure and project scaffolding
**Labels:** enhancement, infrastructure, priority-high
**Milestone:** Phase 1 - Foundation
**Parent:** Epic 1

**Description:**
Create the .NET solution with all required projects:
- `DarkRepos.Editor.Core` - Core business logic
- `DarkRepos.Editor.Data` - EF Core database layer
- `DarkRepos.Editor.Web` - Blazor web application
- `DarkRepos.Editor.Desktop` - MAUI Blazor Hybrid
- `DarkRepos.Editor.Tests` - Unit and integration tests

**Tasks:**
- [ ] Create solution file
- [ ] Create Core project with interfaces
- [ ] Create Data project with DbContext
- [ ] Create Web project with Blazor
- [ ] Create Desktop project placeholder
- [ ] Create Tests project with xUnit
- [ ] Add EditorConfig
- [ ] Configure package references

**Acceptance Criteria:**
- Solution builds without errors
- All projects reference correctly
- EditorConfig enforces code style

---

### DRE-002: Implement Design System
**Title:** Implement design system with color palette and base components
**Labels:** enhancement, ui, priority-high
**Milestone:** Phase 1 - Foundation
**Parent:** Epic 1

**Description:**
Implement the Dark Repos Editor design system with:
- CSS custom properties (variables)
- Color palette (browns, greens, cream accents)
- Typography system
- Base UI components
- Dark/light mode support

**Tasks:**
- [ ] Create CSS variables file
- [ ] Define color palette
- [ ] Define typography scale
- [ ] Define spacing scale
- [ ] Create Button component
- [ ] Create Input component
- [ ] Create Card component
- [ ] Create Modal component
- [ ] Create Tabs component
- [ ] Create Toolbar component
- [ ] Create StatusBar component
- [ ] Add dark mode toggle
- [ ] Create component showcase page

**Acceptance Criteria:**
- All colors meet WCAG contrast requirements
- Components are keyboard accessible
- Design is consistent across editors

**Design Tokens:**
```css
/* Primary palette */
--color-forest-900: #1a2e1a;
--color-forest-700: #2d4a2d;
--color-forest-500: #3d6b3d;

/* Secondary palette */
--color-earth-900: #2d1f1a;
--color-earth-700: #4a352d;
--color-earth-500: #6b4d3d;

/* Accent palette */
--color-cream-100: #faf8f5;
--color-cream-200: #f5f0e8;
--color-cream-300: #ebe3d6;

/* Status colors */
--color-success: #22c55e;
--color-warning: #f59e0b;
--color-error: #ef4444;
--color-info: #3b82f6;
```

---

### DRE-003: Set Up Database Layer
**Title:** Set up EF Core with SQLite database
**Labels:** enhancement, infrastructure, priority-high
**Milestone:** Phase 1 - Foundation
**Parent:** Epic 1

**Description:**
Create the database layer using EF Core with SQLite:
- DbContext configuration
- Entity models
- Migrations
- Repository pattern
- Switchable database provider

**Tasks:**
- [ ] Create EditorDbContext
- [ ] Create Rom entity
- [ ] Create Project entity
- [ ] Create Edit entity
- [ ] Create Label entity
- [ ] Create Settings entity
- [ ] Add initial migration
- [ ] Create repository interfaces
- [ ] Implement SQLite repositories
- [ ] Add database seeding
- [ ] Configure connection string switching

**Entities:**
```csharp
public class Rom
{
	public Guid Id { get; set; }
	public string Name { get; set; }
	public string Platform { get; set; }
	public long Size { get; set; }
	public string Sha256 { get; set; }
	public byte[] Data { get; set; }
	public DateTime AddedAt { get; set; }
}

public class Project
{
	public Guid Id { get; set; }
	public string Name { get; set; }
	public Guid RomId { get; set; }
	public string Description { get; set; }
	public DateTime CreatedAt { get; set; }
	public DateTime ModifiedAt { get; set; }
}
```

---

### DRE-010: Implement Hex Editor
**Title:** Implement Hex Editor component
**Labels:** enhancement, editor, priority-high
**Milestone:** Phase 2 - Core Editors
**Parent:** Epic 2

**Description:**
Create a full-featured hex editor component with:
- Virtualized rendering for large files
- Multiple view modes (hex/dec/bin/ascii)
- Search and replace
- Bookmarks
- Selection and copy/paste
- Undo/redo
- Go to address

**Tasks:**
- [ ] Create HexEditor component
- [ ] Implement virtualized grid
- [ ] Add hex/decimal/binary/ASCII views
- [ ] Implement byte editing
- [ ] Add search functionality
- [ ] Add replace functionality
- [ ] Implement bookmarks
- [ ] Add selection support
- [ ] Implement copy/paste
- [ ] Add undo/redo
- [ ] Add go to address dialog
- [ ] Add keyboard shortcuts
- [ ] Create HexEditorService
- [ ] Write unit tests
- [ ] Write component tests

**Acceptance Criteria:**
- Handles ROMs up to 8MB smoothly
- All keyboard shortcuts work
- Screen reader accessible
- Full test coverage

---

### DRE-011: Implement Disassembler
**Title:** Implement Disassembler component
**Labels:** enhancement, editor, priority-high
**Milestone:** Phase 2 - Core Editors
**Parent:** Epic 2

**Description:**
Create a disassembler component supporting:
- 6502 instruction set
- 65816 instruction set
- Multiple output formats
- Label management
- Cross-references
- Bank navigation

**Tasks:**
- [ ] Create Disassembler component
- [ ] Implement 6502 decoder
- [ ] Implement 65816 decoder
- [ ] Add label support
- [ ] Add cross-reference tracking
- [ ] Implement output formatters
- [ ] Add bank navigation
- [ ] Add address input
- [ ] Implement export functionality
- [ ] Add keyboard navigation
- [ ] Create DisassemblerService
- [ ] Write unit tests
- [ ] Write component tests

**Acceptance Criteria:**
- Correctly decodes all 6502 opcodes
- Correctly decodes 65816 opcodes
- Labels are editable
- Export matches ca65 format

---

### DRE-012: Implement CHR Editor
**Title:** Implement CHR/Graphics Editor component
**Labels:** enhancement, editor, priority-high
**Milestone:** Phase 2 - Core Editors
**Parent:** Epic 2

**Description:**
Create a visual tile/CHR editor with:
- Canvas-based tile rendering
- Multiple tile formats
- Palette integration
- Drawing tools
- Copy/paste tiles
- Import/export PNG

**Tasks:**
- [ ] Create ChrEditor component
- [ ] Implement tile rendering
- [ ] Add NES 2BPP format
- [ ] Add SNES 4BPP format
- [ ] Add Game Boy format
- [ ] Create palette selector
- [ ] Implement pencil tool
- [ ] Implement fill tool
- [ ] Implement selection tool
- [ ] Add flip/rotate
- [ ] Implement copy/paste
- [ ] Add PNG import
- [ ] Add PNG export
- [ ] Add zoom controls
- [ ] Create ChrEditorService
- [ ] Write unit tests
- [ ] Write component tests

**Acceptance Criteria:**
- Renders tiles correctly
- All tools work intuitively
- PNG import/export accurate
- Keyboard accessible

---

### DRE-013: Implement Text Editor
**Title:** Implement Text Editor component
**Labels:** enhancement, editor, priority-high
**Milestone:** Phase 2 - Core Editors
**Parent:** Epic 2

**Description:**
Create a game text editor with:
- TBL file support
- Pointer table navigation
- DTE/MTE handling
- Visual text editing
- Search within text
- Insert back to ROM

**Tasks:**
- [ ] Create TextEditor component
- [ ] Implement TBL parser
- [ ] Add pointer table support
- [ ] Implement text extraction
- [ ] Create visual editor
- [ ] Add search functionality
- [ ] Implement DTE decoding
- [ ] Implement MTE decoding
- [ ] Add text insertion
- [ ] Add script export
- [ ] Add script import
- [ ] Create TextEditorService
- [ ] Write unit tests
- [ ] Write component tests

**Acceptance Criteria:**
- TBL files load correctly
- Text extracts accurately
- Text inserts without corruption
- DTE/MTE handled properly

---

### DRE-020: Implement Map Editor
**Title:** Implement Map Editor component
**Labels:** enhancement, editor, priority-medium
**Milestone:** Phase 3 - Advanced Features
**Parent:** Epic 3

**Description:**
Create a visual map editor for game maps with:
- Tilemap rendering
- Tileset selection
- Layer support
- Event placement
- Collision editing
- PNG export

**Tasks:**
- [ ] Create MapEditor component
- [ ] Implement tilemap rendering
- [ ] Add tileset panel
- [ ] Add tile placement
- [ ] Implement layer system
- [ ] Add event markers
- [ ] Add collision overlay
- [ ] Implement selection tools
- [ ] Add PNG export
- [ ] Create MapEditorService
- [ ] Write unit tests
- [ ] Write component tests

---

### DRE-030: Implement CDL Viewer
**Title:** Implement CDL Viewer component
**Labels:** enhancement, analysis, priority-medium
**Milestone:** Phase 3 - Advanced Features
**Parent:** Epic 4

**Description:**
Create a CDL (Code Data Logger) viewer with:
- Visual heatmap
- Coverage statistics
- Region analysis
- Multi-format support (FCEUX, Mesen)
- CDL merging

**Tasks:**
- [ ] Create CdlViewer component
- [ ] Implement FCEUX CDL parser
- [ ] Implement Mesen CDL parser
- [ ] Create heatmap visualization
- [ ] Add coverage statistics
- [ ] Implement region analysis
- [ ] Add CDL merging
- [ ] Add export functionality
- [ ] Create CdlService
- [ ] Write unit tests
- [ ] Write component tests

---

### DRE-040: Set Up MAUI Blazor Hybrid
**Title:** Set up MAUI Blazor Hybrid for desktop app
**Labels:** enhancement, desktop, priority-medium
**Milestone:** Phase 4 - Desktop & Polish
**Parent:** Epic 5

**Description:**
Configure the MAUI Blazor Hybrid project for native desktop deployment:
- Share Blazor components with web
- Configure native window
- Add local server hosting
- Set up file system access

**Tasks:**
- [ ] Create MAUI Blazor Hybrid project
- [ ] Configure shared component library
- [ ] Set up native window
- [ ] Add local Kestrel server
- [ ] Configure file system permissions
- [ ] Add splash screen
- [ ] Configure app icons
- [ ] Test on Windows
- [ ] Test on macOS
- [ ] Test on Linux

---

## Issue Labels

Create the following labels in the repository:

| Label | Color | Description |
|-------|-------|-------------|
| `epic` | `#7057ff` | Epic/parent issue |
| `enhancement` | `#a2eeef` | New feature or request |
| `bug` | `#d73a4a` | Something isn't working |
| `documentation` | `#0075ca` | Documentation updates |
| `infrastructure` | `#fbca04` | Build/CI/deployment |
| `ui` | `#c5def5` | User interface |
| `editor` | `#bfdadc` | Editor component |
| `analysis` | `#d4c5f9` | Analysis tool |
| `desktop` | `#f9d0c4` | Desktop application |
| `priority-high` | `#b60205` | High priority |
| `priority-medium` | `#fbca04` | Medium priority |
| `priority-low` | `#0e8a16` | Low priority |
| `good-first-issue` | `#7057ff` | Good for newcomers |
| `help-wanted` | `#008672` | Extra attention needed |

---

## Milestones

Create the following milestones:

| Milestone | Due Date | Description |
|-----------|----------|-------------|
| Phase 1 - Foundation | Week 4 | Project setup, design system, database |
| Phase 2 - Core Editors | Week 8 | Hex, Disassembler, CHR, Text editors |
| Phase 3 - Advanced Features | Week 12 | Map, Script, Data editors, analysis tools |
| Phase 4 - Desktop & Polish | Week 16 | Desktop app, testing, documentation |

---

## Project Board

Create a GitHub Project board with columns:
- **Backlog** - Issues not yet started
- **Ready** - Issues ready to work on
- **In Progress** - Currently being worked on
- **Review** - In code review
- **Done** - Completed

---

## Creating Issues Script

```bash
#!/bin/bash
# Script to create GitHub issues using gh CLI

# Create labels
gh label create "epic" --color "7057ff" --description "Epic/parent issue"
gh label create "editor" --color "bfdadc" --description "Editor component"
gh label create "analysis" --color "d4c5f9" --description "Analysis tool"
gh label create "desktop" --color "f9d0c4" --description "Desktop application"
gh label create "priority-high" --color "b60205" --description "High priority"
gh label create "priority-medium" --color "fbca04" --description "Medium priority"
gh label create "priority-low" --color "0e8a16" --description "Low priority"

# Create milestones
gh api repos/:owner/:repo/milestones -f title="Phase 1 - Foundation" -f due_on="2026-01-24T00:00:00Z"
gh api repos/:owner/:repo/milestones -f title="Phase 2 - Core Editors" -f due_on="2026-02-21T00:00:00Z"
gh api repos/:owner/:repo/milestones -f title="Phase 3 - Advanced Features" -f due_on="2026-03-21T00:00:00Z"
gh api repos/:owner/:repo/milestones -f title="Phase 4 - Desktop & Polish" -f due_on="2026-04-18T00:00:00Z"

# Create epic issues
gh issue create --title "[EPIC] Dark Repos Editor - Project Foundation" \
	--label "epic,enhancement,priority-high" \
	--body "Set up foundational infrastructure..."

# ... (continue for all issues)
```
