# Dragon Warrior Universal Editor → C# Blazor Migration Plan

## Overview

This document outlines the migration of the Python/tkinter Dragon Warrior Universal Editor to the existing DarkRepos.Editor Blazor WebAssembly project in GameInfo.

## Current State Analysis

### Python Universal Editor (dragon-warrior-info)
**File:** `tools/universal_editor.py` (7,537 lines)
**Technology:** Python 3 + tkinter

**Existing Tabs (21 total):**
1. `DashboardTab` - Quick start, asset status, build shortcuts
2. `JsonEditorTab` - Raw JSON editing
3. `MonsterEditorTab` - Monster stats (HP, attack, defense, XP, gold)
4. `DialogEditorTab` - Dialog text editing
5. `ItemEditorTab` - Item properties and costs
6. `SpellEditorTab` - Spell MP costs and effects
7. `ShopEditorTab` - Shop inventories
8. `NpcEditorTab` - NPC positions and behaviors
9. `GraphicsEditorTab` - CHR tile editing
10. `MapEditorTab` - World/dungeon map editing
11. `PaletteEditorTab` - Color palette editing
12. `BaseTab` - Abstract base class
13. `HexViewerTab` - ROM hex viewer/editor
14. `ScriptEditorTab` - Event script editing
15. `RomComparisonTab` - Compare ROMs byte-by-byte
16. `CheatCodeTab` - Game Genie/Pro Action codes
17. `MusicEditorTab` - Music sequence editing
18. `TextTableEditorTab` - TBL file editing
19. `EncounterEditorTab` - Random encounter tables
20. `RomInfoTab` - ROM header and metadata

**Extended Tabs (editor_tabs_extended.py):**
- `DamageEditorTab` - Damage formula parameters
- `SpellEffectsEditorTab` - Spell effect implementations
- `ExperienceEditorTab` - Level progression tables
- `MusicDataEditorTab` - Alternative music editor

### DarkRepos.Editor (GameInfo)
**Location:** `DarkRepos/Editor/`
**Technology:** .NET 10 + Blazor WebAssembly

**Existing Components:**
- `HexEditor/` - Hex editing component
- `TextEditor/` - Text/dialog editing
- `ChrEditor/` - CHR tile editing
- `MapEditor/` - Map/tilemap editing
- `DisassemblyViewer/` - Disassembly view

**Web Pages:**
- `Home.razor` - Welcome/dashboard
- `HexEditor.razor` - Hex editor page
- `TextEditor.razor` - Text editor page
- `ScriptEditor.razor` - Script editor page
- `DataEditor.razor` - Data table editor
- `Games/DQ3rEditor.razor` - Game-specific page

## Migration Approach

### Phase 1: Core Data Infrastructure
**Priority: HIGH | Effort: Medium**

1. **Create Dragon Warrior data models** in `DarkRepos.Editor.Data/`
	- `DragonWarriorRom.cs` - ROM parsing and validation
	- `MonsterData.cs` - Monster stat structures
	- `ItemData.cs` - Item/equipment structures
	- `SpellData.cs` - Spell cost/effect structures
	- `ShopData.cs` - Shop inventory structures
	- `NpcData.cs` - NPC position/dialog structures
	- `DamageFormula.cs` - Damage calculation parameters
	- `EncounterTable.cs` - Random encounter structures

2. **Create Dragon Warrior service** in `DarkRepos.Editor.Core/`
	- `DragonWarriorService.cs` - ROM read/write operations
	- `DragonWarriorJsonConverter.cs` - JSON ↔ binary conversion
	- `DragonWarriorAssetManager.cs` - Asset pipeline integration

### Phase 2: UI Components
**Priority: HIGH | Effort: High**

Create new Blazor components in `DarkRepos.Editor.Shared/Components/Editors/DragonWarrior/`:

1. **DragonWarriorDashboard.razor** - Asset status, build shortcuts
2. **MonsterEditor.razor** - Monster stat editing
3. **ItemEditor.razor** - Item/equipment editing
4. **SpellEditor.razor** - Spell editing
5. **ShopEditor.razor** - Shop inventory editing
6. **NpcEditor.razor** - NPC editing
7. **EncounterEditor.razor** - Encounter table editing

### Phase 3: Specialized Editors
**Priority: MEDIUM | Effort: Medium**

8. **DamageFormulaEditor.razor** - Damage calculation editor
9. **SpellEffectsEditor.razor** - Spell effect implementations
10. **ExperienceTableEditor.razor** - Level progression editing
11. **DialogEditor.razor** - Dialog/text editing (extend TextEditor)
12. **CheatCodeEditor.razor** - Game Genie codes

### Phase 4: Integration
**Priority: MEDIUM | Effort: Low**

1. **DragonWarriorEditor.razor** - Main page combining all editors
2. **Add to navigation** - Update NavMenu.razor
3. **ROM loading** - Support .nes file upload
4. **Project persistence** - Save/load project files

## Component Architecture

```
DarkRepos.Editor.Shared/
├── Components/
│   └── Editors/
│       └── DragonWarrior/
│           ├── DragonWarriorDashboard.razor
│           ├── DragonWarriorDashboard.razor.css
│           ├── MonsterEditor.razor
│           ├── MonsterEditor.razor.cs (code-behind)
│           ├── ItemEditor.razor
│           ├── SpellEditor.razor
│           ├── ShopEditor.razor
│           ├── NpcEditor.razor
│           ├── DamageFormulaEditor.razor
│           ├── SpellEffectsEditor.razor
│           ├── EncounterEditor.razor
│           └── Shared/
│               ├── StatInput.razor
│               ├── HexInput.razor
│               └── TableGrid.razor

DarkRepos.Editor.Data/
├── Games/
│   └── DragonWarrior/
│       ├── DragonWarriorRom.cs
│       ├── MonsterData.cs
│       ├── ItemData.cs
│       ├── SpellData.cs
│       ├── ShopData.cs
│       ├── NpcData.cs
│       ├── DamageFormula.cs
│       └── EncounterTable.cs

DarkRepos.Editor.Core/
├── Services/
│   └── DragonWarrior/
│       ├── DragonWarriorService.cs
│       ├── DragonWarriorJsonConverter.cs
│       └── DragonWarriorAssetManager.cs
```

## Data Model Examples

### MonsterData.cs
```csharp
public record MonsterData(
	int Id,
	string Name,
	int Hp,
	int Attack,
	int Defense,
	int Agility,
	int Experience,
	int Gold,
	int SpriteIndex,
	MonsterType Type,
	SpellPattern SpellPattern,
	byte Flags
);
```

### SpellData.cs
```csharp
public record SpellData(
	int Id,
	string Name,
	int MpCost,
	SpellType Type,
	int BasePower,
	SpellTarget Target,
	byte EffectFlags
);
```

### DamageFormula.cs
```csharp
public record DamageFormula(
	int AttackMultiplier,
	int DefenseMultiplier,
	int RandomVariance,
	int CriticalMultiplier,
	int MinimumDamage
);
```

## ROM Offset Reference

**Verified offsets from disassembly (CPU → File):**
- SpellCostTable: $9D53 → 0x1D63 (10 bytes)
- ItemCostTable: $9947 → 0x1957 (56 bytes)
- WeaponsBonusTable: $99CF → 0x19DF (8 bytes)
- ArmorBonusTable: $99D7 → 0x19E7 (8 bytes)
- ShieldBonusTable: $99DF → 0x19EF (4 bytes)
- MonsterTable: Bank3 @ various offsets

## JSON Format Compatibility

The Blazor editor should read/write the same JSON format as the Python tools:

```json
{
	"monsters": [
		{
			"id": 0,
			"name": "Slime",
			"hp": 3,
			"attack": 5,
			"defense": 3,
			"agility": 3,
			"xp": 1,
			"gold": 2
		}
	]
}
```

## GitHub Issues to Create

### Epic
- [ ] **[EPIC] Migrate Dragon Warrior Editor to Blazor**

### Phase 1 Issues
- [ ] Create Dragon Warrior data models
- [ ] Implement DragonWarriorRom parser
- [ ] Create JSON converter service
- [ ] Add unit tests for data models

### Phase 2 Issues
- [ ] Create DragonWarriorDashboard component
- [ ] Create MonsterEditor component
- [ ] Create ItemEditor component
- [ ] Create SpellEditor component
- [ ] Create ShopEditor component
- [ ] Create NpcEditor component
- [ ] Create EncounterEditor component

### Phase 3 Issues
- [ ] Create DamageFormulaEditor component
- [ ] Create SpellEffectsEditor component
- [ ] Create ExperienceTableEditor component
- [ ] Create CheatCodeEditor component

### Phase 4 Issues
- [ ] Create main DragonWarriorEditor page
- [ ] Add navigation integration
- [ ] Implement ROM file upload
- [ ] Add project save/load

## Timeline Estimate

- **Phase 1:** 2-3 sessions (core infrastructure)
- **Phase 2:** 4-6 sessions (main editors)
- **Phase 3:** 2-3 sessions (specialized editors)
- **Phase 4:** 1-2 sessions (integration)

**Total:** ~10-14 sessions

## Benefits of Migration

1. **Cross-platform:** Blazor WASM runs in any browser
2. **Unified codebase:** Single editor for all games
3. **Modern UI:** Fluent design, responsive layout
4. **Type safety:** C# strong typing prevents data errors
5. **Shared components:** Reuse editors across games
6. **Better testing:** xUnit + bUnit for component tests
7. **API integration:** Connect to DarkRepos wiki directly

## Risks and Mitigations

| Risk | Mitigation |
|------|------------|
| JSON format incompatibility | Maintain exact Python format |
| Missing features | Priority order by usage |
| Performance issues | Virtual scrolling for large tables |
| Browser file access | Use File System Access API |

## Next Steps

1. Create GitHub issues from this plan
2. Start with Phase 1 data models
3. Build MonsterEditor as first component
4. Iterate and add remaining editors
