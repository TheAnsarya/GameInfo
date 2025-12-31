# Battle System Comparison: DW4 NES vs DQ3r SNES

## Overview

This document compares the battle systems between Dragon Warrior IV (NES) and Dragon Quest III Remake (SNES), identifying the modifications needed for the port.

## Core Battle Mechanics

### Turn Order System

| Aspect | DW4 NES | DQ3r SNES |
|--------|---------|-----------|
| Order Calculation | Agility + Random(0-31) | Agility × modifier |
| First Strike | Hero agility vs enemy | Party avg vs enemy avg |
| Surprise Attack | Enemy gets free turn | Enemy free turn + status |
| Pre-emptive | Party gets free turn | Party free turn |

### Damage Formulas

#### DW4 NES Physical Damage
```
Base = Strength / 2
Variance = Random(Base * 0.75, Base * 1.25)
Defense = Enemy_Defense / 4
Damage = Variance - Defense
Minimum = 1
Critical = Base × 2 (ignores defense)
```

#### DQ3r SNES Physical Damage
```
Base = (Strength × WeaponPower) / 64
Variance = Base × Random(0.9, 1.1)
Defense = (Enemy_Defense × ArmorRating) / 128
Damage = Variance - Defense
Minimum = 1
Critical = Base × 2 + Random(0, Strength/4)
```

### Magic Damage

| Aspect | DW4 NES | DQ3r SNES |
|--------|---------|-----------|
| Base Damage | Fixed per spell | Fixed + INT bonus |
| Resistance | Binary (resist/don't) | Percentage (0-100%) |
| Element System | 4 types | 8 types |
| Group Damage | Fixed reduction | Variable reduction |

## Battle Flow Comparison

### DW4 NES Battle Flow
```
1. Encounter Check (area encounter rate)
2. Battle Start
   - Formation display
   - Surprise check
3. Turn Loop:
   a. Player Input (Hero only in Ch5)
   b. AI Decision (party members)
   c. Turn Order Calculation
   d. Action Execution
   e. Status Check
   f. Victory/Defeat Check
4. Battle End
   - Experience distribution
   - Gold collection
   - Item drops
```

### DQ3r SNES Battle Flow
```
1. Encounter Check (step counter based)
2. Battle Start
   - Animated formation
   - Pre-emptive/surprise
3. Turn Loop:
   a. Full Party Input
   b. Turn Order Calculation
   c. Action Execution (animated)
   d. Status/Effect Tick
   e. Victory/Defeat Check
4. Battle End
   - Level up sequence
   - Drop sequence
   - Transition animation
```

## Status Effects Comparison

### DW4 NES Status Effects

| Status | Byte | Effect | Cure |
|--------|------|--------|------|
| Poison | $01 | HP drain (1/step) | Antidote, Heal |
| Sleep | $02 | Skip turn | Physical hit |
| Surround | $04 | Miss rate +75% | Fade, end battle |
| Chaos | $08 | Random targets | Heal, end battle |
| Numb | $10 | Skip turn (perma) | NumbOff |
| Death | $20 | 0 HP | Revive, church |
| Stopspell | $40 | No magic | End battle |
| Sap | $80 | Defense halved | End battle |

### DQ3r SNES Status Effects

| Status | Effect | Duration |
|--------|--------|----------|
| Poison | HP drain | Until cured |
| Sleep | Skip turn | 1-3 turns or hit |
| Confusion | Random action | 1-3 turns |
| Paralysis | Skip turn | 1-5 turns |
| Death | 0 HP | Until revived |
| Silence | No magic | 1-5 turns |
| Defense Down | DEF -50% | Battle duration |
| Attack Down | ATK -50% | Battle duration |
| Blind | Accuracy -50% | Battle duration |
| Slow | AGI -50% | Battle duration |

### Status Mapping

| DW4 Status | DQ3r Equivalent | Notes |
|------------|-----------------|-------|
| Poison | Poison | Direct map |
| Sleep | Sleep | Similar |
| Surround | Blind | Close enough |
| Chaos | Confusion | Same concept |
| Numb | Paralysis | Similar |
| Death | Death | Direct map |
| Stopspell | Silence | Direct map |
| Sap | Defense Down | Direct map |

## Party Size and Formation

### DW4 NES
- **Active Party**: 4 members maximum
- **Wagon**: 8 additional members (Chapter 5)
- **Formation**: Single row, no positioning
- **Swap**: Mid-battle swap from wagon (if accessible)

### DQ3r SNES
- **Active Party**: 4 members maximum
- **Reserve**: None (no wagon system)
- **Formation**: Single row, no positioning
- **Swap**: Not available mid-battle

### Wagon System Implementation

DQ3r needs wagon system added:

```
New Memory Structure:
$7E1B00: wagon_enabled (1 byte)
$7E1B01: wagon_accessible (1 byte)  
$7E1B02: wagon_swap_enabled (1 byte)
$7E1B10: wagon_party[8] (8 bytes)
$7E1B20: wagon_hp[8 × 2] (16 bytes)
$7E1B30: wagon_mp[8 × 2] (16 bytes)
$7E1B40: wagon_status[8] (8 bytes)
Total: ~50 bytes
```

## Enemy Encounter System

### Encounter Rate Calculation

#### DW4 NES
```
rate = zone_base_rate
if in_dungeon: rate += 5
if chapter_5: rate -= wagon_bonus
chance = random(0, 255)
if chance < rate: trigger_encounter()
```

#### DQ3r SNES
```
step_counter -= 1
if step_counter <= 0:
    encounter()
    step_counter = base_steps + random(-16, 16)
```

### Enemy Group Formation

#### DW4 NES Groups
- Up to 8 enemies total
- Max 4 different enemy types
- Formation ID determines mix

#### DQ3r SNES Groups
- Up to 8 enemies total
- Max 3 different enemy types
- Formation + pattern system

## Experience and Leveling

### Experience Distribution

| Aspect | DW4 NES | DQ3r SNES |
|--------|---------|-----------|
| Division | Equal among living | Equal among party |
| Dead Members | 0 EXP | 50% EXP |
| Wagon Members | 0 EXP | N/A (no wagon) |
| Level Cap | 99 | 99 |

### Level Up Stats

#### DW4 NES
```
Stats gained are semi-random:
  HP: base + random(0, level/4)
  MP: base + random(0, level/8)
  STR/AGI/VIT/INT/LUCK: class_curve[level]
```

#### DQ3r SNES
```
Stats based on personality + class:
  Each stat = base × personality_mod × class_mod
  Bonus points distributed by personality
```

## Spell System Differences

### Healing Spells

| DW4 Spell | Effect | DQ3r Equivalent | Notes |
|-----------|--------|-----------------|-------|
| Heal | 30-40 HP | Heal | Same |
| Healmore | 85-100 HP | Midheal | Scale up |
| Healall | Full HP | Fullheal | Same |
| Healus | Party 100 HP | Multiheal | Similar |
| Healusall | Party Full | Omniheal | Same |
| Vivify | 50% revive | Zing | Same |
| Revive | Full revive | Kazing | Same |

### Attack Spells

| DW4 Spell | Damage | DQ3r Equivalent | Notes |
|-----------|--------|-----------------|-------|
| Blaze | 10-17 | Frizz | Low fire |
| Blazemore | 45-60 | Frizzle | Mid fire |
| Blazemost | 180-210 | Kafrizz | High fire |
| Firebal | 20-30 | Bang | Low explode |
| Firebane | 60-80 | Boom | Mid explode |
| Firevolt | 120-160 | Kaboom | High explode |
| Icebolt | 15-25 | Crack | Low ice |
| Snowstorm | 40-55 | Crackle | Mid ice |
| Blizzard | 90-120 | Kacrack | High ice |
| Zap | 70-90 | Zap | Lightning |
| Thordain | 200-250 | Kazap | High lightning |

## Required Engine Modifications

### High Priority

1. **Tactics System** - Full AI behavior system
2. **Wagon System** - Party reserve and swap
3. **Turn Order** - Match DW4 calculation
4. **Damage Formula** - Adjust for 8-bit stats

### Medium Priority

1. **Status Mapping** - Ensure all DW4 statuses work
2. **Spell Effects** - Match DW4 animations
3. **Experience Split** - Add wagon exclusion
4. **Encounter Rate** - Match DW4 feel

### Low Priority

1. **Battle Animations** - Port NES style optional
2. **Sound Effects** - Map to SNES equivalents
3. **Victory Sequence** - Match DW4 style

## Testing Matrix

| Feature | Test Case | Expected |
|---------|-----------|----------|
| Physical | Ragnar attack | ~Strength/2 damage |
| Magic | Brey Blazemore | 45-60 fire damage |
| Healing | Cristo Healmore | 85-100 HP |
| Status | Numb hit | Skip turn |
| Critical | Any attack | 2× damage, no def |
| Wagon Swap | Ch5 battle | Success if accessible |
| AI Tactic | Normal mode | Balanced decisions |

## References

- [DW4 Battle System](../../dragon-warrior-4-info/docs/formats/BATTLE_SYSTEM.md)
- [DW4 Spell Format](../../dragon-warrior-4-info/docs/formats/SPELL_FORMAT.md)
- [DW4 Tactics System](../../dragon-warrior-4-info/docs/formats/TACTICS_SYSTEM.md)
- [AI Behavior Comparison](ai-behavior-comparison.md)

## See Also

- [Data Formats Comparison](data-formats.md)
- [Technical Specifications](technical-specs.md)
