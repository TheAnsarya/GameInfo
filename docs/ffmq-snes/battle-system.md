# Final Fantasy Mystic Quest (SNES) - Battle System

Documentation of the battle system mechanics in Final Fantasy Mystic Quest.

## Battle Overview

FFMQ uses a simplified turn-based battle system with a maximum of:
- 2 player characters (Benjamin + 1 partner)
- 3 enemies on screen

## Turn Order

### Speed-Based Initiative

Turn order is determined by the Speed stat:

```
Turn Priority = Speed + Random(0-15)
```

Higher values act first. Ties are broken by:
1. Player characters before enemies
2. Benjamin before partner
3. Enemy slot order (1 → 2 → 3)

### Action Queue

Each turn, actions are queued and executed in order:

```
struct ActionQueueEntry {
    uint8   actor_id;       // Who is acting
    uint8   action_type;    // Attack/Magic/Item/Defend
    uint8   action_id;      // Specific action
    uint8   target_id;      // Target of action
}
```

## Damage Calculation

### Physical Damage

```
Base Damage = (Attack × 2) - Defense
Variance = Base × Random(0.9 - 1.1)
Critical = Base × 1.5 (if critical hit)
Final Damage = max(1, Variance × Elemental Modifier)
```

### Hit Chance

```
Hit Rate = Accuracy - Evasion + 80
Clamped to range [5, 100]
```

### Critical Hits

```
Crit Chance = Speed / 4 + Weapon Crit Rate
```

### Magic Damage

```
Base Damage = Power × (Magic / 4 + 8)
Resistance Factor = 1.0 - (Resistance / 100)
Final = Base × Resistance Factor × Elemental Modifier
```

### Elemental Modifiers

| Condition | Modifier |
|-----------|----------|
| Weakness | ×2.0 |
| Normal | ×1.0 |
| Resistance | ×0.5 |
| Immunity | ×0.0 |
| Absorb | Heal instead |

## Status Effects

### Combat Status

| Status | Effect | Duration |
|--------|--------|----------|
| Poison | Lose HP each turn | Until cured |
| Paralysis | Cannot act | 3 turns |
| Blind | -50% accuracy | Until cured |
| Confuse | Random target | 3 turns |
| Silence | Cannot cast spells | Until cured |
| Petrify | Cannot act, 0 defense | Permanent |

### Battle End Conditions

1. **Victory**: All enemies defeated
   - Gain EXP and gold
   - Status effects may persist

2. **Defeat**: Both characters KO'd
   - Game Over screen
   - Reload from last save

3. **Escape**: Use Escape spell/item
   - No rewards
   - Return to field

## Enemy AI System

### AI Pattern Table

Each monster has an AI pattern ID that determines behavior:

```
struct AIPattern {
    uint8   action_weights[8];  // Weight for each action
    uint8   hp_threshold;       // HP % for alternate behavior
    uint8   alt_pattern;        // Pattern when HP low
}
```

### Action Selection

```
1. Check HP threshold
2. If HP < threshold, use alternate pattern
3. Roll weighted random for action
4. Validate action (has MP, target exists)
5. Execute or fall back to basic attack
```

### Sample AI Patterns

**Pattern 0x00 (Basic)**
- 80% Attack
- 20% Do nothing

**Pattern 0x02 (Mage)**
- 30% Attack
- 50% Offensive spell
- 20% Status spell

**Pattern 0x05 (Defensive)**
- 40% Attack
- 30% Defend
- 30% Counter on next hit

## Weapon Systems

### Weapon Types

| Type | Behavior |
|------|----------|
| Sword | Standard single target |
| Axe | Can destroy obstacles on field |
| Claw | Fast, multiple hits |
| Bomb | All enemies, area damage |

### Weapon Leveling

Weapons gain levels through use:
- Level 1: Base stats
- Level 2: +25% damage
- Level 3: +50% damage, special effect

```
Weapon EXP gained = Enemy Level × 10
Level up at: 100, 300, 600 EXP
```

## Magic System

### Spell Schools

**White Magic**
- Cure: Single target heal
- Life: Revive fallen ally
- Heal: Cure all status
- Exit: Escape dungeon

**Black Magic**
- Fire: Fire damage
- Ice: Ice damage
- Thunder: Lightning damage
- Quake: Earth damage

**Wizard Magic**
- Flare: High non-elemental
- White: Holy damage
- Meteor: Multi-hit random

### MP Management

Benjamin and partner have separate MP pools:
- MP regenerates at save points
- Items can restore MP
- Max MP increases with level

## Battle Rewards

### Experience Formula

```
Base EXP = Sum of all enemy EXP values
Bonus = Base × (1 + 0.1 × Turn Bonus)
Turn Bonus = max(0, 10 - Turns Taken)
```

### Gold Formula

```
Gold = Sum of all enemy gold values
No multipliers
```

### Level Up

At level up:
- HP/MP increase by class values
- Stats increase (some randomness)
- May learn new spells

## Battlefield Objects

### Destructible Objects

Some battle backgrounds have destroyable objects:
- Trees (Axe)
- Rocks (Bomb)
- Ice blocks (Fire spell)

Destroying reveals items or enemies.

### Background Hazards

Some battlefields have hazards:
- Poison floor (damage over time)
- Lava (fire damage)
- Water (electric damage amplified)

## External References

- [Full Disassembly](https://github.com/TheAnsarya/ffmq-info)
- [Battle System Details](https://github.com/TheAnsarya/ffmq-info/blob/master/docs/BATTLE_SYSTEM.md)
