# Dragon Warrior II (NES) - Text System

## Overview

Dragon Warrior II uses a custom character encoding for text storage. The text system is similar to DW1 but expanded to support party dialogue and more complex messages.

## Character Encoding

### Standard Characters ($00-$5F)

| Range | Characters |
|-------|------------|
| $00-$09 | 0-9 (digits) |
| $0A-$23 | A-Z (uppercase) |
| $24-$3D | a-z (lowercase) |
| $3E | ' (apostrophe) |
| $3F | . (period) |
| $40 | , (comma) |
| $41 | ? (question) |
| $42 | ! (exclamation) |
| $43 | - (hyphen) |
| $44 | ( |
| $45 | ) |
| $46 | " (quote) |
| $47 | : (colon) |
| $48 | ; (semicolon) |
| $49 | * (star) |
| $4A-$5F | Special symbols |

### Control Codes ($E0-$FF)

| Code | Meaning |
|------|---------|
| $E0 | Window pause (wait for button) |
| $E1 | Newline |
| $E2 | Clear window |
| $E3 | Name: Midenhall |
| $E4 | Name: Cannock |
| $E5 | Name: Moonbrooke |
| $E6 | Number parameter (2 digits) |
| $E7 | Number parameter (4 digits) |
| $E8 | Item name |
| $E9 | Monster name |
| $EA | Spell name |
| $EB | Location name |
| $EC | Gold amount |
| $ED | Experience amount |
| $EE-$F0 | Sound effect triggers |
| $F1 | Color change |
| $F2 | Delay |
| $F3-$FE | Reserved |
| $FF | End of string |

## Text Pointers

Text strings are stored with a pointer table.

### Main Dialogue Pointers

Located at bank 2, $8000-$8FFF:
```
Pointer Table: $8000-$81FF (256 entries × 2 bytes)
Text Data: $8200-$BFFF
```

### Menu Text

Located at bank 0, $B000-$BFFF:
- Command names
- Item names
- Spell names
- Status messages

## Message Categories

### Town NPC Dialogue ($8000+)

| ID Range | Town |
|----------|------|
| $00-$0F | Midenhall |
| $10-$1F | Leftwyne |
| $20-$2F | Cannock |
| $30-$3F | Hamlin |
| $40-$4F | Moonbrooke |
| $50-$5F | Lianport |
| $60-$6F | Tantegel |
| $70-$7F | Zahan |
| $80-$8F | Tuhn |
| $90-$9F | Osterfair |
| $A0-$AF | Wellgarth |
| $B0-$BF | Beran |
| $C0-$CF | Hargon's Castle |

### System Messages ($B000+)

| ID | Message |
|----|---------|
| $00 | "Thy HP have been restored." |
| $01 | "Thy MP have been restored." |
| $02 | "Thy status is normal again." |
| $03 | "Thy game has been saved." |
| $04 | "Not enough MP!" |
| $05 | "Not enough gold!" |
| $06 | "Thy inventory is full!" |
| $07 | "This cannot be used here." |
| $08 | "The spell failed!" |
| $09 | "Thou art not strong enough!" |
| $0A | "But nobody was there." |

### Battle Messages

| ID | Message |
|----|---------|
| $20 | "[Name] attacks!" |
| $21 | "[Name] casts [Spell]!" |
| $22 | "[Name] uses [Item]!" |
| $23 | "[Enemy] is defeated!" |
| $24 | "Thy party gained [X] EXP!" |
| $25 | "Thy party received [X] gold!" |
| $26 | "[Name] has leveled up!" |
| $27 | "[Name] is poisoned!" |
| $28 | "[Name] is asleep!" |
| $29 | "[Name] is confused!" |
| $2A | "[Name] has fallen!" |
| $2B | "Thy party flees!" |

## Name Entry

### Character Entry Screen

Uses a subset of the character table:
- A-Z ($0A-$23) - uppercase only
- 0-9 ($00-$09)
- ' ($3E)
- . ($3F)

Maximum name length: 8 characters per hero

### Default Names

| Character | Default |
|-----------|---------|
| Midenhall | Erdrick |
| Cannock | Cookie |
| Moonbrooke | Moomin |

## Compression

DW2 uses simple run-length encoding for common patterns:

### RLE Format
```
$F0 [count] [char] = Repeat [char] [count] times
```

Example:
```
$F0 $05 $40  = ",,,,,", (5 commas)
```

### Common Patterns

| Code | Expansion |
|------|-----------|
| $F1 | "the " |
| $F2 | "and " |
| $F3 | "you " |
| $F4 | "have " |
| $F5 | "with " |
| $F6 | "this " |
| $F7 | "from " |
| $F8 | "will " |

## Example Text Decoding

### Raw Bytes
```
$1D $11 $18 $24 $3F $3F $3F $E0 $E1 $E3 $40 $28
$34 $2A $35 $0E $24 $38 $32 $2A $FF
```

### Decoded
```
"Welcome..." [wait] [newline]
"[Midenhall], the brave one"
[end]
```

## Text Editing Tips

1. **String Length**: Strings can vary in length but should end with $FF
2. **Pointer Updates**: If a string changes size, update subsequent pointers
3. **Bank Boundaries**: Text cannot cross bank boundaries
4. **Control Code Spacing**: Some control codes add implicit spaces

## ROM Locations

| Data | Bank | Address |
|------|------|---------|
| Main dialogue pointers | 2 | $8000-$81FF |
| Main dialogue text | 2 | $8200-$BFFF |
| Menu text | 0 | $B000-$BFFF |
| Battle messages | 3 | $8000-$8FFF |
| Item/spell names | 0 | $A000-$AFFF |
| Monster names | 4 | $9000-$9FFF |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Data Structures](data-structures.md) - Monster and item data
