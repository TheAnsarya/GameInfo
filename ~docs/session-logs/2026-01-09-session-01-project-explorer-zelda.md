# Session Log: .giproj Project System - Part 3

**Date:** 2026-01-09
**Session:** 01
**Focus:** Wiring ProjectExplorer to MainWindow, adding Zelda NES extractor

## Summary

Continued implementation of the .giproj project file system. This session focused on wiring the ProjectExplorerViewModel to the MainWindow, enabling project-specific views, and adding a new asset extractor for The Legend of Zelda (NES).

## Completed Work

### 1. ProjectExplorer Integration (commits `818c4ba`, `648f8bb`, `e0cf3b8`)

Wired the ProjectExplorerViewModel to MainWindowViewModel:

**MainWindowViewModel Updates:**
- Added `_projectExplorer` field with ProjectExplorerViewModel instance
- Changed initial view from WelcomeViewModel to `_projectExplorer`
- Updated `OnSelectedCategoryChanged` to use `_projectExplorer` for "project" category
- Added `OnProjectServiceChanged` handler for project state changes
- Subscribed to explorer events: `OpenProjectRequested`, `NewProjectRequested`, `OpenFileRequested`
- Added `OnProjectExplorerOpenFile` handler that maps file extensions to tool categories

**ViewLocator Updates:**
- Added ProjectExplorerViewModel to explicit ViewModelToViewMap
- Updated `Match()` to accept `INotifyPropertyChanged` for Core project ViewModels
- Added using directive for `GameInfoTools.Core.Project.ViewModels`

**ProjectExplorerView Updates:**
- Added `IsVisible="{Binding HasProject}"` to TreeView border
- Ensures proper display of "No Project" placeholder when no project is open

### 2. Zelda NES Extractor (commit `155ed65`)

Created `ZeldaNesExtractor` for The Legend of Zelda (NES, US):

**Features:**
- Supports both PRG0 (CRC32: `d7ae93df`) and PRG1 (CRC32: `cebd2a53`) versions
- ROM verification with full checksum support (CRC32, MD5, SHA1, SHA256)
- MMC1 mapper detection (mapper 1)

**Extracted Assets:**
- **Data Tables:** Items (22 items), Enemies (30+ enemies including bosses), Dungeon data (9 levels)
- **Text:** Dialog strings (16+ entries), character encoding table file
- **Graphics:** CHR banks for title, player, enemies, items
- **Maps:** Overworld (16x8 screens) and dungeon layouts
- **Audio:** Music track metadata (8 tracks)
- **Source:** main.asm, memory.inc, constants.inc
- **Symbols:** Symbol table with known addresses

**Registration:**
- Added to DependencyInjection.cs extractor list

### 3. Test Updates

- Updated `MainWindowViewModel_InitializesWithWelcomeView` to `MainWindowViewModel_InitializesWithProjectExplorerView`
- Added using directive for `GameInfoTools.Core.Project.ViewModels`

## Git Commits

| Commit | Description |
|--------|-------------|
| `a55e4ea` | style: Remove trailing whitespace in App.axaml.cs |
| `818c4ba` | feat: Wire ProjectExplorerViewModel to MainWindow |
| `648f8bb` | feat: Register ProjectExplorerView in ViewLocator |
| `e0cf3b8` | feat: Wire ProjectExplorer events to MainWindow |
| `155ed65` | feat: Add The Legend of Zelda NES extractor |

## Build Status

✅ All 4352 tests passing
- Core.Tests: 31 passed
- Audio.Tests: 242 passed
- Tests: 3968 passed
- TasConvert.Tests: 111 passed (2 skipped)

## Files Created/Modified This Session

**Created:**
- `src/GameInfoTools.Core/Project/Extractors/ZeldaNesExtractor.cs` (~800 lines)

**Modified:**
- `src/GameInfoTools.UI/ViewModels/MainWindowViewModel.cs` - Added explorer wiring
- `src/GameInfoTools.UI/ViewLocator.cs` - Added ProjectExplorerViewModel mapping
- `src/GameInfoTools.UI/Views/ProjectExplorerView.axaml` - Added IsVisible binding
- `src/GameInfoTools.Core/Project/DependencyInjection.cs` - Registered ZeldaNesExtractor
- `src/GameInfoTools.Tests/ViewModelTests.cs` - Updated test for new initial view

## Supported Game Extractors

The project now supports extraction for:

| Game | Platform | Extractor |
|------|----------|-----------|
| Dragon Warrior IV (US) | NES | DragonWarrior4Extractor |
| Final Fantasy Mystic Quest | SNES | FfmqExtractor |
| Dragon Quest III (JP/US) | SNES | Dq3SnesExtractor |
| Dragon Quest IV (JP) | SNES | Dq4SnesExtractor |
| The Legend of Zelda (US) | NES | ZeldaNesExtractor |

## What's Next

1. **Test end-to-end flow** - Create project with actual ROM
2. **File dialogs** - Implement browse handlers in wizard
3. **Build and verify** - Test full round-trip extraction and rebuild
4. **Add more extractors** - Metroid, Super Mario Bros, other classics
5. **Enable project-specific views** - Refresh views with project data

## Related Issues

- #191 - [EPIC] Implement .giproj Project File System
- #196 - Create New Project wizard UI - **In Progress**
- #197 - Project Explorer and Build Panel UI - **UI wired to MainWindow** ✅

## Architecture Notes

The ProjectExplorerViewModel lives in `GameInfoTools.Core` to keep it platform-agnostic, but it now integrates fully with the Avalonia UI through:

1. ViewLocator explicit mapping (for AOT compatibility)
2. MainWindowViewModel event subscriptions
3. Extension of `Match()` to support `INotifyPropertyChanged`

This pattern allows the same view model to be used with both Avalonia and Blazor UIs.
