# Dragon Quest IV Remake (SNES) - Testing Documentation

## Overview

DQ4r is a SNES port of Dragon Warrior IV, built on the DQ3r engine. This document covers testing for the core systems unique to DQ4r.

## System Architecture

DQ4r consists of these major systems:
- **SaveManager** - 3 save slots, checksum validation, adventure log
- **CutsceneManager** - Scripted sequences with ~15 opcodes
- **EventEngine** - NPC/map scripting with ~50 opcodes
- **BattleManager** - Turn-based combat with AI tactics
- **ChapterManager** - 5-chapter structure with party changes

---

# Save System Testing

## SaveManager Structure

```csharp
public class SaveManager {
    public const int MaxSaveSlots = 3;
    public const int SramSize = 0x2000;     // 8KB total
    public SaveSlot[] Slots { get; }
    public AdventureLogEntry[] AdventureLog { get; }
    public SystemSettings Settings { get; set; }
}
```

### SRAM Layout (8KB)
| Offset | Size | Contents |
|--------|------|----------|
| $0000 | $0800 | Save Slot 0 (2KB) |
| $0800 | $0800 | Save Slot 1 (2KB) |
| $1000 | $0800 | Save Slot 2 (2KB) |
| $1800 | $0200 | Adventure Log |
| $1A00 | $0100 | System Settings |
| $1B00 | $0500 | Reserved |

### SaveData Structure
| Field | Size | Description |
|-------|------|-------------|
| Checksum | 2 | XOR checksum with 0x5A5A mask |
| Chapter | 1 | Current chapter (1-5) |
| PlayTime | 4 | Frames played (32-bit) |
| Gold | 4 | Party gold (32-bit) |
| Characters | 640 | 8 chars × 80 bytes each |
| Inventory | 256 | Item slots |
| EventFlags | 32 | 256 flags (32 bytes) |
| MapState | 64 | Current map, position |
| Wagon | 128 | Wagon inventory |

## Test Cases

### TC-SAV-001: Create New Save
**Objective:** Test new save creation

**Steps:**
1. Start new game, name Hero "TEST"
2. Play until first save point (church)
3. Save to Slot 0
4. Power cycle emulator
5. Load Slot 0

**Expected Results:**
- Save preview shows "Chapter 1 - Ragnar"
- Play time ~0:05
- Gold = 0
- Location = Burland

```csharp
var saveManager = new SaveManager();
var chapterManager = new ChapterManager();
chapterManager.StartChapter(1);

Assert.IsTrue(saveManager.Save(0, chapterManager));
var loaded = saveManager.Load(0);
Assert.IsNotNull(loaded);
Assert.AreEqual(1, loaded.Chapter);
```

### TC-SAV-002: Checksum Validation
**Objective:** Test checksum integrity

**Steps:**
1. Save game normally
2. Export SRAM
3. Corrupt 1 byte in save data
4. Import corrupted SRAM
5. Attempt to load

**Expected Results:**
- Load fails with checksum error
- Save marked as corrupted
- Other slots unaffected

```csharp
var saveData = new SaveData();
saveData.Gold = 1000;
var checksum = saveData.CalculateChecksum();
Assert.IsTrue(saveData.ValidateChecksum());

// Corrupt data
saveData.Gold = 9999;
Assert.IsFalse(saveData.ValidateChecksum());
```

### TC-SAV-003: Chapter Progress Persistence
**Objective:** Test chapter state saves correctly

**Steps:**
1. Complete Chapter 1 (Ragnar)
2. Save at Chapter 2 start
3. Load and verify:
   - Chapter = 2
   - Alena/Cristo/Brey in party
   - Ragnar stats preserved

### TC-SAV-004: Event Flag Persistence
**Objective:** Test 256 event flags save/load

**Steps:**
1. Set flag #10 (example: boss defeated)
2. Save game
3. Load game
4. Check flag #10

```csharp
saveData.SetEventFlag(10, true);
Assert.IsTrue(saveData.GetEventFlag(10));

var bytes = saveData.ToBytes();
var loaded = SaveData.FromBytes(bytes);
Assert.IsTrue(loaded.GetEventFlag(10));
```

### TC-SAV-005: Adventure Log
**Objective:** Test shared adventure log

**Steps:**
1. Create save in Slot 0
2. Create save in Slot 1
3. Delete Slot 0
4. Verify adventure log entries remain

---

# Cutscene System Testing

## CutsceneManager Structure

```csharp
public class CutsceneManager {
    public bool IsPlaying { get; }
    public event EventHandler<CutsceneCompletedEventArgs> CutsceneCompleted;
    public void Play(Cutscene cutscene);
    public void Update();
    public void Skip();
}
```

### Cutscene Opcodes
| Opcode | Name | Parameters | Description |
|--------|------|------------|-------------|
| 0x00 | End | - | End cutscene |
| 0x01 | Dialog | msgId | Show dialog box |
| 0x02 | ShowPortrait | charId | Display character portrait |
| 0x03 | HidePortrait | - | Hide portrait |
| 0x04 | FadeIn | frames | Fade from black |
| 0x05 | FadeOut | frames | Fade to black |
| 0x06 | Flash | color, frames | Screen flash |
| 0x07 | ShakeScreen | intensity, frames | Screen shake |
| 0x08 | PlaySound | soundId | Play SFX |
| 0x09 | PlayMusic | musicId | Change BGM |
| 0x0A | StopMusic | - | Stop BGM |
| 0x0B | Wait | frames | Delay execution |
| 0x0C | Jump | offset | Jump to offset |
| 0x0D | Call | offset | Call subroutine |
| 0x0E | Return | - | Return from call |
| 0x0F | MoveCameraTo | x, y, frames | Pan camera |

## Test Cases

### TC-CUT-001: Basic Cutscene Playback
**Objective:** Test simple cutscene execution

**Steps:**
1. Create cutscene with: FadeOut, Dialog, Wait, FadeIn
2. Play cutscene
3. Verify each opcode executes in order

```csharp
var cutscene = new Cutscene("test") {
    Commands = [
        new CutsceneCommand(CutsceneOpcode.FadeOut),
        new CutsceneCommand(CutsceneOpcode.Dialog) { Parameters = [0x01] },
        new CutsceneCommand(CutsceneOpcode.Wait) { Parameters = [60] },
        new CutsceneCommand(CutsceneOpcode.FadeIn)
    ]
};

var manager = new CutsceneManager();
manager.Play(cutscene);
while (manager.IsPlaying) manager.Update();
```

### TC-CUT-002: Cutscene Skip
**Objective:** Test skip functionality

**Steps:**
1. Start long cutscene
2. Call Skip() mid-execution
3. Verify immediate end
4. Verify state consistent

### TC-CUT-003: Nested Calls
**Objective:** Test Call/Return opcodes

**Steps:**
1. Create cutscene with Call to subroutine
2. Subroutine has Return
3. Verify execution continues after Call

---

# Event Engine Testing

## EventEngine Structure

```csharp
public class EventEngine {
    public bool IsExecuting { get; }
    public event EventHandler<ScriptCompletedEventArgs> ScriptCompleted;
    public void LoadScript(EventScript script);
    public void Execute(string scriptId);
    public void Step();
}
```

### Script Opcodes (50+)
| Category | Opcodes |
|----------|---------|
| Dialog | ShowMessage, ShowChoice, GetInput |
| Flags | CheckFlag, SetFlag, ClearFlag |
| Control | Jump, JumpIfTrue, JumpIfFalse, Call, Return, End |
| Party | AddCharacter, RemoveCharacter, SetLeader |
| Inventory | GiveItem, TakeItem, CheckItem |
| Gold | GiveGold, TakeGold, CheckGold |
| Movement | MovePlayer, TeleportPlayer, FaceDirection |
| Shop | OpenShop, OpenInn, OpenChurch |
| Battle | StartBattle, CheckBattleResult |
| Misc | PlaySound, PlayMusic, Wait |

### Trigger Types
| ID | Type | Description |
|----|------|-------------|
| 0 | None | Manual trigger only |
| 1 | MapEntry | On entering map |
| 2 | Talk | Talking to NPC |
| 3 | Step | Walking on tile |
| 4 | Item | Using item |
| 5 | Timer | After X frames |
| 6 | Battle | After battle |
| 7 | Chapter | Chapter change |

## Test Cases

### TC-EVT-001: Basic Script Execution
**Objective:** Test simple script

**Steps:**
1. Create script: ShowMessage, End
2. Execute script
3. Verify message displays

```csharp
var script = new EventScript("test") {
    Triggers = [TriggerType.Talk],
    Instructions = [
        new ScriptInstruction(ScriptOpcode.ShowMessage) { Parameters = [0x01] },
        new ScriptInstruction(ScriptOpcode.End)
    ]
};

var engine = new EventEngine();
engine.LoadScript(script);
engine.Execute("test");
```

### TC-EVT-002: Flag Conditionals
**Objective:** Test CheckFlag branching

**Steps:**
1. Create script with CheckFlag → JumpIfFalse
2. Run with flag = false
3. Run with flag = true
4. Verify different paths taken

```csharp
var script = new EventScript("guard") {
    Instructions = [
        new ScriptInstruction(ScriptOpcode.CheckFlag) { Parameters = [10] },
        new ScriptInstruction(ScriptOpcode.JumpIfFalse) { Parameters = [3] },
        new ScriptInstruction(ScriptOpcode.ShowMessage) { Parameters = [0x42] },
        new ScriptInstruction(ScriptOpcode.End),
        new ScriptInstruction(ScriptOpcode.ShowMessage) { Parameters = [0x41] },
        new ScriptInstruction(ScriptOpcode.End)
    ]
};
```

### TC-EVT-003: Call Stack
**Objective:** Test 16-level call stack

**Steps:**
1. Create script with nested Calls
2. Test up to 16 levels deep
3. Verify all Returns execute correctly
4. Test stack overflow (17+ levels)

### TC-EVT-004: Variable Operations
**Objective:** Test 64 temporary variables

**Steps:**
1. SetVariable(0, 100)
2. AddVariable(0, 50)
3. CheckVariable(0, ==, 150)
4. Verify result

---

# Battle System Testing

## BattleManager Structure

```csharp
public class BattleManager {
    public BattleState State { get; }
    public event EventHandler<BattleStartedEventArgs> BattleStarted;
    public event EventHandler<BattleEndedEventArgs> BattleEnded;
    public void StartBattle(int encounterId);
    public void SetAction(BattleAction action);
    public void ExecuteTurn();
}
```

### AI Tactics (DQ4 unique)
| Tactic | Description |
|--------|-------------|
| ShowNoMercy | All-out offense |
| GoAllOut | Balanced offense |
| WatchMyMp | Conserve MP |
| UseNoMagic | Physical only |
| DontUseSkills | Basic attacks |
| FocusOnHealing | Prioritize healing |
| FollowOrders | Manual control |

## Test Cases

### TC-BTL-001: Basic Combat
**Objective:** Test attack/defend cycle

**Steps:**
1. Start battle vs Slime
2. Set Attack action
3. Execute turn
4. Verify damage dealt/received

### TC-BTL-002: AI Tactics
**Objective:** Test AI behavior

**Steps:**
1. Set tactic to WatchMyMp
2. Start battle with MP-heavy caster
3. Verify MP usage reduced
4. Change to ShowNoMercy
5. Verify full spell usage

### TC-BTL-003: Turn Order
**Objective:** Test agility-based ordering

**Steps:**
1. Set up party with varied Agility
2. Start battle
3. Verify turn order matches Agility

---

# Chapter System Testing

## ChapterManager Structure

```csharp
public class ChapterManager {
    public ChapterState State { get; }
    public Chapter CurrentChapter { get; }
    public void StartChapter(int number);
    public Character[] GetChapterParty();
}
```

### Chapters
| # | Title | Party |
|---|-------|-------|
| 1 | Ragnar | Ragnar (+ temp) |
| 2 | Alena | Alena, Cristo, Brey |
| 3 | Taloon | Taloon (solo) |
| 4 | Sisters | Mara, Nara (+ temp) |
| 5 | Hero | Hero → All |

## Test Cases

### TC-CHP-001: Chapter Start
**Objective:** Test chapter initialization

**Steps:**
1. StartChapter(1)
2. Verify Ragnar in party
3. Verify starting location = Burland
4. Verify initial equipment

### TC-CHP-002: Chapter Transition
**Objective:** Test inter-chapter saves

**Steps:**
1. Complete Chapter 1
2. Save at Chapter 2 start
3. Load save
4. Verify Chapter 1 data preserved

### TC-CHP-003: Chapter 5 Party Assembly
**Objective:** Test full party assembly

**Steps:**
1. Progress to Chapter 5 party union
2. Verify all characters available
3. Verify individual inventories merged
4. Verify wagon system active

---

# Regression Tests

### RT-001: Save System Round-Trip
1. Create save with specific state
2. Export SRAM
3. Import SRAM
4. Verify all fields match

### RT-002: Event Flag Persistence
1. Set 50 random flags
2. Save/Load cycle
3. Verify all flags preserved

### RT-003: Chapter Progress Integrity
1. Play through all 5 chapters
2. Save at each chapter boundary
3. Verify no data loss

### RT-004: Battle State Recovery
1. Save mid-battle (if supported)
2. Load save
3. Verify battle resumes correctly

---

# Integration Test Harness

```csharp
[TestClass]
public class DQ4rIntegrationTests {
    private SaveManager _saveManager;
    private ChapterManager _chapterManager;
    private EventEngine _eventEngine;
    private BattleManager _battleManager;
    private CutsceneManager _cutsceneManager;

    [TestInitialize]
    public void Setup() {
        _saveManager = new SaveManager();
        _chapterManager = new ChapterManager();
        _eventEngine = new EventEngine();
        _battleManager = new BattleManager(_chapterManager);
        _cutsceneManager = new CutsceneManager();
    }

    [TestMethod]
    public void FullPlaythrough_Chapter1() {
        // Start chapter 1
        _chapterManager.StartChapter(1);
        Assert.AreEqual(1, _chapterManager.State.CurrentChapter);
        Assert.AreEqual("Ragnar", _chapterManager.CurrentChapter.Party[0].Name);

        // Save at church
        Assert.IsTrue(_saveManager.Save(0, _chapterManager));

        // Load and verify
        var loaded = _saveManager.Load(0);
        Assert.IsNotNull(loaded);
        Assert.AreEqual(1, loaded.Chapter);
    }

    [TestMethod]
    public void EventScript_NPCDialog() {
        var script = new EventScript("npc") {
            Triggers = [TriggerType.Talk],
            Instructions = [
                new ScriptInstruction(ScriptOpcode.ShowMessage) { Parameters = [1] },
                new ScriptInstruction(ScriptOpcode.End)
            ]
        };

        _eventEngine.LoadScript(script);
        bool completed = false;
        _eventEngine.ScriptCompleted += (s, e) => completed = true;
        _eventEngine.Execute("npc");

        while (_eventEngine.IsExecuting)
            _eventEngine.Step();

        Assert.IsTrue(completed);
    }
}
```

---

# Sign-Off

## Save System
| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-SAV-001 | | | ☐ |
| TC-SAV-002 | | | ☐ |
| TC-SAV-003 | | | ☐ |
| TC-SAV-004 | | | ☐ |
| TC-SAV-005 | | | ☐ |

## Cutscene System
| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-CUT-001 | | | ☐ |
| TC-CUT-002 | | | ☐ |
| TC-CUT-003 | | | ☐ |

## Event Engine
| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-EVT-001 | | | ☐ |
| TC-EVT-002 | | | ☐ |
| TC-EVT-003 | | | ☐ |
| TC-EVT-004 | | | ☐ |

## Battle System
| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-BTL-001 | | | ☐ |
| TC-BTL-002 | | | ☐ |
| TC-BTL-003 | | | ☐ |

## Chapter System
| Test Case | Tester | Date | Status |
|-----------|--------|------|--------|
| TC-CHP-001 | | | ☐ |
| TC-CHP-002 | | | ☐ |
| TC-CHP-003 | | | ☐ |

## Regression
| Test | Tester | Date | Status |
|------|--------|------|--------|
| RT-001 | | | ☐ |
| RT-002 | | | ☐ |
| RT-003 | | | ☐ |
| RT-004 | | | ☐ |
