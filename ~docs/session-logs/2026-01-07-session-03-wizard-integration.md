# Session Log: .giproj Project System - UI Integration

**Date:** 2026-01-07
**Session:** 03
**Focus:** Wiring up Create Project Wizard with DI and file dialogs

## Summary

Continued implementation of the .giproj project system by integrating the wizard UI with the service layer through dependency injection, and adding file dialog support for ROM and project selection.

## Completed Work

### 1. Dependency Injection Setup

Updated `App.axaml.cs` to configure DI:
- Added `Microsoft.Extensions.DependencyInjection` package
- Created `ConfigureServices` method to register project services
- Set up `IProjectService` and `IAssetExtractorRegistry` as singletons
- Registered `MainWindowViewModel` for DI resolution

### 2. CreateProjectWizardWindow

Created dialog window to host the wizard:
- Handles file picker dialogs for ROM selection (platform-aware filters)
- Handles folder picker for project location selection
- Subscribes to wizard events (BrowseForRom, BrowseForProject, ProjectCreated, Cancelled)
- Includes dummy services for design-time support

### 3. MainWindowViewModel Updates

- Added constructor with DI parameters for `IProjectService` and `IAssetExtractorRegistry`
- Updated `NewProjectCommand` to show wizard dialog and handle result
- Fallback design-time constructor using `App.Services`

### 4. Unit Tests

Added comprehensive tests for project system components:

| Test Class | Tests | Status |
|------------|-------|--------|
| `AssetExtractorRegistryTests` | 6 | ✅ Pass |
| `AssemblerRegistryTests` | 5 | ✅ Pass |
| `GameDefinitionTests` | 3 | ✅ Pass |
| `BuildResultTests` | 2 | ✅ Pass |
| `VerifyResultTests` | 2 | ✅ Pass |

**Total: 4350 tests (all passing)**

### 5. FFMQ Extractor

Added asset extractor for Final Fantasy Mystic Quest (SNES):
- ROM verification with CRC32 validation
- Monster stats extraction (83 monsters)
- Weapon/armor/spell data extraction
- Symbol file generation
- No external library dependencies

## Git Commits

| Commit | Description |
|--------|-------------|
| `d4392f8` | style: Remove trailing whitespace from DW4 extractor |
| `b7b454c` | feat(ui): Wire up Create Project Wizard with DI and file dialogs (#196) |
| `eb18a3c` | test(project): Add unit tests for registry and result types (#193) |
| `65ae47a` | docs: Add session log for wizard integration session 03 |
| `b6318a6` | feat(project): Pass asset type selections to project creation (#196) |
| `544cc13` | feat(ui): Implement Open Project command with ProjectService (#197) |
| `1f887f4` | feat(extractors): Add FFMQ (SNES) asset extractor (#193) |
| `e0b95b7` | test: Fix MainWindowViewModel tests with mock DI services |

## Files Created/Modified

### Created
- [CreateProjectWizardWindow.axaml](../src/GameInfoTools.UI/Views/CreateProjectWizardWindow.axaml) - Window XAML
- [CreateProjectWizardWindow.axaml.cs](../src/GameInfoTools.UI/Views/CreateProjectWizardWindow.axaml.cs) - Window code-behind
- [RegistryTests.cs](../../tests/GameInfoTools.Core.Tests/Project/RegistryTests.cs) - Unit tests
- [FfmqExtractor.cs](../src/GameInfoTools.Core/Project/Extractors/FfmqExtractor.cs) - FFMQ SNES extractor

### Modified
- [App.axaml.cs](../src/GameInfoTools.UI/App.axaml.cs) - DI setup
- [GameInfoTools.UI.csproj](../src/GameInfoTools.UI/GameInfoTools.UI.csproj) - Added DI package
- [MainWindowViewModel.cs](../src/GameInfoTools.UI/ViewModels/MainWindowViewModel.cs) - DI constructor, project commands
- [ViewModelTests.cs](../src/GameInfoTools.Tests/ViewModelTests.cs) - Mock services for testing
- [DependencyInjection.cs](../src/GameInfoTools.Core/Project/DependencyInjection.cs) - Registered FFMQ extractor
- [CreateProjectWizardViewModel.cs](../src/GameInfoTools.Core/Project/ViewModels/CreateProjectWizardViewModel.cs) - Asset type selection

## Build Status

✅ Build succeeds with 5 pre-existing warnings (nullable types in other modules)

## GitHub Issues Updated

- **#196** - Create New Project wizard UI - Added progress comment

## What's Next

1. **Add more game extractors** - DQ3, DQ4, Zelda, etc.
2. **Test end-to-end flow** - Create project with actual ROM
3. **Show project in explorer** - Display opened project in tree view
4. **Enable project-specific views** - Refresh views with project data
5. **Build and verify ROM** - Test full round-trip extraction and rebuild

## Completed Items from Previous "What's Next"

- ✅ Wire actual project creation - CreateProjectCommand calls ProjectService
- ✅ Implement Open Project - OpenProjectCommand loads .giproj files
- ✅ Add FFMQ extractor - First SNES game support

## Related Issues

- #191 - [EPIC] Implement .giproj Project File System
- #193 - Implement IProjectService interface
- #196 - Create New Project wizard UI
- #197 - Project Explorer and Build Panel UI

## Technical Notes

### DI Pattern
The app uses `Microsoft.Extensions.DependencyInjection` with:
- Singleton lifetime for services (ProjectService, Registries)
- Transient lifetime for view models
- Static `App.Services` for accessing DI container

### File Picker Filters
ROM filters are platform-aware:
- NES: `*.nes`
- SNES: `*.sfc`, `*.smc`
- GB: `*.gb`, `*.gbc`
- GBA: `*.gba`

### Design-Time Support
Dummy implementations of interfaces allow XAML designer to work:
- `DummyProjectService`
- `DummyExtractorRegistry`
