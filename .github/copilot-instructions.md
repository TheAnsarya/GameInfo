# GameInfo Project - AI Copilot Directives

## Project Overview

**Main Purpose:** Create Data Crystal `*.wikitext` files (ROM map, RAM map, data structures, systems descriptions) for SNES, NES, and other retro games, along with `*.md` documentation, disassemblies, and comprehensive ROM hacking tools.

**Home Folder:** `C:\Users\me\source\repos\GameInfo`

## Related Repositories

- `GameInfo` - Main repository (this one) - tools and wiki documentation
- `ffmq-info` - Final Fantasy Mystic Quest disassembly and documentation
- `dw4-info` / `dragon-warrior-4-info` - Dragon Warrior IV NES disassembly
- `dragon-warrior-info` - Dragon Warrior series documentation

## Code Style & Formatting

### Indentation
- **ALWAYS use TABS, never spaces** - This is enforced by `.editorconfig`
- Tab width: 4 spaces equivalent
- Applies to: Python, JSON, Assembly, Markdown, YAML, all files

### Hexadecimal Values
- **Always lowercase** for hex values in code
- Correct: `$9d`, `0xca6e`, `$ff00`
- Incorrect: `$9D`, `0xCA6E`, `$FF00`

### Address Notation
- File addresses vs ROM/CPU addresses are NOT the same
- Always clarify which address space is being referenced
- Document header offsets when relevant

## Documentation Structure

### `~docs/` (Tilde Docs - Development Documentation)
Documentation about *making* the project:
- `~docs/session-logs/` - AI session log files (markdown)
- `~docs/chat-logs/` - AI chat conversation logs (markdown)
- `~docs/plans/` - Planning documents
- Development notes, decisions, process documentation

### `docs/` (Project Documentation)
Documentation about the project itself:
- Organized into subfolders by subject/system
- All documentation reachable from `README.md` link tree
- Game-specific documentation
- Tool usage guides
- Format specifications

## Git Workflow

### Commit Strategy
- Commit in logical groups as work progresses
- Always commit at appropriate checkpoints
- Push commits regularly
- Use conventional commit messages:
  - `feat:` - New features
  - `fix:` - Bug fixes
  - `docs:` - Documentation
  - `style:` - Formatting/whitespace
  - `refactor:` - Code restructuring
  - `test:` - Tests
  - `chore:` - Maintenance

## GitHub Issue Management

### Issue Structure
- All issues tied to parent issues up to epics
- Use GitHub Projects with Kanban board
- Create epics for major work areas
- Break epics into detailed sub-issues
- Update issues as work completes

### Labels
- Use full descriptive labels, no abbreviations
- Labels should have clear meanings
- Categories: priority, type, component, status

### Project Board
- Always associate issues with the project board
- Use Kanban workflow: Backlog → In Progress → Done
- Track all planned and unplanned work

## Session Management

### Session Logs
- Create session logs in `~docs/session-logs/`
- Format: `YYYY-MM-DD-session-NN.md`
- Document work completed, decisions made, next steps

### Chat Logs
- Save chat logs in `~docs/chat-logs/`
- Format: `YYYY-MM-DD-chat-NN.md`
- Preserve context for future sessions

### End of Response
- Always include "What's Next" section
- List remaining work or suggested next prompts
- Track progress against todo lists

## Asset Management

### Extraction
- Extract all possible assets from ROMs
- Use `.include` directives for:
  - Graphics (export to PNG)
  - Stats and data tables (export to JSON)
  - Text and dialog
  - Data structures
  - Sound/music data

### Build Pipeline
- Support transformations: binary ↔ JSON/PNG/etc
- Maintain bidirectional conversion capability
- Document all data formats

## Output Formats

### Data Crystal Wikitext
- ROM maps
- RAM maps
- Data structures
- System descriptions
- Format specifications

### Markdown Documentation
- Game mechanics
- Tool usage
- Development guides
- Research notes

### Disassembly
- Annotated assembly source
- Symbol/label files
- Cross-references

## Token Usage

- **Maximize token usage per session**
- Continue implementing improvements until token limit
- Don't waste allocated resources
- Complete as much meaningful work as possible

## Todo List Management

- Create todo lists for all work
- Update status as tasks complete
- Use GitHub issues for tracking
- Maintain visibility of progress
