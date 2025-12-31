# AI Behavior Comparison: DW4 NES vs DQ3r SNES

## Overview

This document compares the AI behavior systems between Dragon Warrior IV (NES) and Dragon Quest III Remake (SNES), highlighting key differences that must be addressed during the port.

## System Architecture

### DW4 NES: Tactics-Based AI

DW4 uses a unique **Tactics System** where the player selects a general behavior mode for AI-controlled party members.

| Tactic | Byte | Behavior |
|--------|------|----------|
| Use No MP | $00 | Physical attacks only |
| Normal | $01 | Balanced approach |
| Save MP | $02 | Conserve magic |
| Focus on Healing | $03 | Priority heal |
| Use MP Freely | $04 | Full magic usage |
| Show No Mercy | $05 | Maximum damage |
| Try Out | $06 | Random actions |
| Do Nothing | $07 | Defend only |

### DQ3r SNES: Personality-Based AI

DQ3r uses a **Personality System** that affects stat growth and minor behavior tendencies, but party members are fully player-controlled.

| Personality | Effect | Stat Bonus |
|-------------|--------|------------|
| Sexy | Charm-based | AGI+ |
| Smart | Intelligence | INT+ |
| Tough | Endurance | VIT+ |
| Lucky | Fortune | LUCK+ |
| Vain | Self-focused | Mixed |
| etc. | ~50 total | Various |

## Comparison Table

| Aspect | DW4 NES | DQ3r SNES |
|--------|---------|-----------|
| Control Type | AI-managed (Chapters 1-4) | Player-controlled |
| Behavior Mode | 8 tactics | N/A (manual) |
| Party Control | Hero only (Ch5) or none | Full control |
| AI Complexity | High (decision trees) | None (personalities only) |
| Chapter System | 5 chapters with AI parties | No chapters |
| Wagon System | Yes (Ch5) | No |

## Implementation Requirements

### Required New Systems for DQ3r Engine

#### 1. Tactics Command System

```
New Menu Structure:
  Battle Menu
  ├── Fight
  ├── Tactics → [Submenu with 8 options]
  ├── Run
  └── Items

Tactic Selection:
  - Store current tactic per character
  - RAM location: Needs 8 bytes (1 per party slot)
  - Default: Normal ($01)
```

#### 2. AI Decision Engine

The DQ3r engine needs a complete AI decision system:

```c
// Required AI state machine
enum AIState {
    AI_EVALUATE,       // Check battle conditions
    AI_HEAL_CHECK,     // Emergency healing needed?
    AI_BUFF_CHECK,     // Should buff party?
    AI_ATTACK_SELECT,  // Choose attack type
    AI_TARGET_SELECT,  // Choose target
    AI_EXECUTE         // Perform action
};

struct AIContext {
    uint8_t tactic;           // Current tactic mode
    uint8_t party_hp_avg;     // Average party HP %
    uint8_t enemy_count;      // Enemies remaining
    uint8_t threat_level;     // Calculated threat
    uint8_t mp_remaining;     // Character's MP %
    uint8_t turn_number;      // Battle turn count
};
```

#### 3. Character-Specific Behaviors

DW4 characters have unique AI quirks:

| Character | Special Behavior |
|-----------|-----------------|
| Ragnar | Never uses magic (warrior) |
| Alena | Prefers physical, critical focus |
| Cristo | Heavy healing priority |
| Brey | Magic damage focus |
| Taloon | Random special actions |
| Mara | Fire magic preference |
| Nara | Healing + death magic |
| Meena | Fortune-telling (status) |
| Hero | Player controlled |

**Taloon's Special Actions** (must be implemented):

| Action | Effect | Chance |
|--------|--------|--------|
| Trip | Lose turn | 10% |
| Call Help | Random item from merchant | 5% |
| Examine | Reveal enemy weakness | 15% |
| Lucky Hit | Critical chance +50% | 10% |
| Goof Off | Random effect | 5% |

### 4. AI Decision Trees by Tactic

#### Use No MP ($00)
```
IF enemy_count > 0:
    physical_attack(strongest_weapon)
```

#### Normal ($01)
```
IF any_ally.hp < 50%:
    IF can_cast_heal():
        heal(lowest_hp_ally)
IF enemy.weak_to_magic AND mp > 30%:
    cast_attack_spell()
ELSE:
    physical_attack()
```

#### Save MP ($02)
```
IF any_ally.hp < 25%:
    IF can_cast_heal():
        heal(lowest_hp_ally)
ELSE:
    physical_attack()
```

#### Focus on Healing ($03)
```
IF any_ally.hp < 75%:
    heal(lowest_hp_ally)
ELIF any_ally.has_status:
    cure_status()
ELIF enemy_count > 0:
    physical_attack()
```

#### Use MP Freely ($04)
```
IF any_ally.hp < 50%:
    heal_best_spell(lowest_hp_ally)
IF enemy_count > 2:
    cast_group_spell()
ELSE:
    cast_best_attack_spell()
```

#### Show No Mercy ($05)
```
cast_most_damaging_ability()
# No defensive consideration
```

#### Try Out ($06)
```
random_action()  # Pick any valid action
```

#### Do Nothing ($07)
```
defend()
```

## Memory Requirements

### Additional RAM Needed

| Purpose | Size | Address (Proposed) |
|---------|------|-------------------|
| Party tactics | 8 bytes | $7E1A00 |
| AI state | 16 bytes | $7E1A08 |
| Threat calc | 8 bytes | $7E1A18 |
| Turn counter | 2 bytes | $7E1A20 |
| **Total** | **34 bytes** | |

### ROM Space Needed

| Component | Estimated Size |
|-----------|---------------|
| AI decision code | ~2KB |
| Tactic menus | ~512 bytes |
| Character profiles | ~256 bytes |
| Special actions | ~1KB |
| **Total** | **~4KB** |

## Conversion Strategy

### Phase 1: Basic AI Framework
1. Add tactic storage to RAM
2. Implement tactic menu in battle
3. Create basic decision loop

### Phase 2: Decision Trees
1. Implement each tactic's decision tree
2. Add target selection logic
3. Add MP/HP evaluation

### Phase 3: Character-Specific AI
1. Add character profile data
2. Implement Taloon's special actions
3. Add class-specific tendencies

### Phase 4: Integration
1. Hook into battle system
2. Handle party swap (wagon)
3. Testing and balancing

## Testing Considerations

| Test Case | Expected Behavior |
|-----------|------------------|
| Cristo low HP ally | Should heal immediately |
| Brey vs single enemy | Should use attack magic |
| Taloon any situation | Random special actions |
| Normal vs group | Should use group attacks |
| Save MP early battle | Should conserve magic |

## References

- [DW4 Tactics System](../../dragon-warrior-4-info/docs/formats/TACTICS_SYSTEM.md)
- [DW4 AI Behavior](../../dragon-warrior-4-info/docs/formats/AI_BEHAVIOR.md)
- [DW4 Battle System](../../dragon-warrior-4-info/docs/formats/BATTLE_SYSTEM.md)
- [DQ3r Technical Specs](../../../dq3r-info/docs/TECHNICAL_SPECS.md)

## See Also

- [Data Formats Comparison](data-formats.md)
- [Technical Specifications](technical-specs.md)
- [Battle System Comparison](battle-system-comparison.md)
