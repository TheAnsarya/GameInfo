# Dragon Quest III - Battle System Analysis

## Analysis Summary
- **ROM:** Dragon Quest III - english (patched).smc
- **Battle Functions:** 1
- **Spells Identified:** 24969
- **Monster AI Patterns:** 33682
- **Combat Formulas:** 2
- **Status Effects:** 0

## Battle Functions

### rng_func_af3e
- **Address:** $af3e
- **Purpose:** Random number generation
- **Battle Phase:** calculation
- **Complexity:** 50
- **Math Operations:** SHIFT, ADD

## Spell System

| ID | Name | MP Cost | Power | Target | Element |
|----|------|---------|-------|--------|----------|
| 07 | Spell_07 | 24 | 169 | single | neutral |
| 08 | Spell_08 | 9 | 171 | unknown | unknown |
| 09 | Spell_09 | 56 | 107 | unknown | unknown |
| 0E | Spell_0e | 5 | 201 | single | unknown |
| 10 | Spell_10 | 34 | 114 | unknown | unknown |
| 11 | Spell_11 | 24 | 197 | group | neutral |
| 13 | Spell_13 | 35 | 111 | unknown | unknown |
| 15 | Spell_15 | 16 | 192 | unknown | unknown |
| 16 | Spell_16 | 10 | 34 | unknown | unknown |
| 17 | Spell_17 | 58 | 111 | unknown | unknown |
| 1A | Spell_1a | 34 | 114 | unknown | unknown |
| 1B | Spell_1b | 24 | 197 | self | neutral |
| 1D | Spell_1d | 3 | 201 | single | unknown |
| 28 | Spell_28 | 40 | 24 | unknown | unknown |
| 29 | Spell_29 | 90 | 139 | unknown | unknown |
| 2A | Spell_2a | 34 | 114 | unknown | unknown |
| 2B | Spell_2b | 66 | 197 | single | neutral |
| 2F | Spell_2f | 3 | 76 | unknown | unknown |
| 31 | Spell_31 | 34 | 214 | unknown | unknown |
| 33 | Spell_33 | 3 | 76 | unknown | unknown |

## Monster AI Patterns

### Monster 02
- **AI Address:** $80ad
- **Behaviors:** Complex behavior subroutines
- **Spell List:** []
- **Complexity:** 10

### Monster 04
- **AI Address:** $c2ab
- **Behaviors:** 
- **Spell List:** []
- **Complexity:** 0

### Monster 07
- **AI Address:** $ad48
- **Behaviors:** 
- **Spell List:** [0, 1, 4]
- **Complexity:** 0

### Monster 08
- **AI Address:** $db80
- **Behaviors:** 
- **Spell List:** [0, 1]
- **Complexity:** 0

### Monster 0B
- **AI Address:** $c010
- **Behaviors:** 
- **Spell List:** [0, 16, 32, 48]
- **Complexity:** 0

### Monster 0C
- **AI Address:** $c2c0
- **Behaviors:** 
- **Spell List:** []
- **Complexity:** 0

### Monster 0E
- **AI Address:** $c010
- **Behaviors:** 
- **Spell List:** [0, 16, 32, 48]
- **Complexity:** 0

### Monster 0F
- **AI Address:** $e201
- **Behaviors:** 
- **Spell List:** []
- **Complexity:** 0

### Monster 11
- **AI Address:** $eb01
- **Behaviors:** 
- **Spell List:** [0]
- **Complexity:** 0

### Monster 12
- **AI Address:** $a320
- **Behaviors:** 
- **Spell List:** []
- **Complexity:** 0

