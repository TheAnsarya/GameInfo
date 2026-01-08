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

**Total: 31 tests (all passing)**

## Git Commits

| Commit | Description |
|--------|-------------|
| `d4392f8` | style: Remove trailing whitespace from DW4 extractor |
| `b7b454c` | feat(ui): Wire up Create Project Wizard with DI and file dialogs (#196) |
| `eb18a3c` | test(project): Add unit tests for registry and result types (#193) |

## Files Created/Modified

### Created
- [CreateProjectWizardWindow.axaml](../src/GameInfoTools.UI/Views/CreateProjectWizardWindow.axaml) - Window XAML
- [CreateProjectWizardWindow.axaml.cs](../src/GameInfoTools.UI/Views/CreateProjectWizardWindow.axaml.cs) - Window code-behind
- [RegistryTests.cs](../../tests/GameInfoTools.Core.Tests/Project/RegistryTests.cs) - Unit tests

### Modified
- [App.axaml.cs](../src/GameInfoTools.UI/App.axaml.cs) - DI setup
- [GameInfoTools.UI.csproj](../src/GameInfoTools.UI/GameInfoTools.UI.csproj) - Added DI package
- [MainWindowViewModel.cs](../src/GameInfoTools.UI/ViewModels/MainWindowViewModel.cs) - DI constructor

## Build Status

✅ Build succeeds with 5 pre-existing warnings (nullable types in other modules)

## GitHub Issues Updated

- **#196** - Create New Project wizard UI - Added progress comment

## What's Next

1. **Wire actual project creation** - Connect wizard's CreateProjectCommand to ProjectService.CreateProjectAsync
2. **Add validation feedback** - Show errors in wizard when ROM verification fails
3. **Implement Open Project** - Wire MainWindowViewModel.OpenProjectCommand to actually load .giproj files
4. **Create ProjectExplorer integration** - Show opened project in the explorer tree view
5. **Test end-to-end** - Test full workflow with Dragon Warrior IV ROM

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
