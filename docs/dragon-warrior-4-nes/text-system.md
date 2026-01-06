# Dragon Warrior IV (NES) - Text System

Documentation of the text encoding and dialog system in Dragon Warrior IV.

## Text Encoding

Dragon Warrior IV uses a custom text encoding table for game text.

### Character Table

| Byte | Character | Byte | Character | Byte | Character |
|------|-----------|------|-----------|------|-----------|
| $00 | (space) | $20 | ` ` | $40 | `@` |
| $01-$1A | A-Z | $21-$3A | a-z | $41-$5A | 0-9, punct |
| $80-$FF | (control codes) | | | | |

### Standard ASCII Range ($20-$7F)

```
$20 = Space
$21-$3A = a-z (lowercase)
$41-$5A = A-Z (uppercase)
$30-$39 = 0-9 (numbers)
$2E = .
$2C = ,
$21 = !
$3F = ?
$27 = '
$2D = -
```

## Control Codes

### Dialog Control ($80-$9F)

| Code | Description |
|------|-------------|
| $80 | End of string |
| $81 | New line |
| $82 | Clear text box |
| $83 | Wait for button press |
| $84 | Pause (short) |
| $85 | Pause (medium) |
| $86 | Pause (long) |
| $87 | Play sound effect (next byte = SFX ID) |
| $88 | Change text speed |
| $89 | Start choice prompt |
| $8A | Choice separator |
| $8B | End choice prompt |

### Variable Insertion ($90-$9F)

| Code | Description |
|------|-------------|
| $90 | Insert Hero name |
| $91 | Insert party member name (next byte = index) |
| $92 | Insert item name (next byte = ID) |
| $93 | Insert spell name (next byte = ID) |
| $94 | Insert monster name (next byte = ID) |
| $95 | Insert number (next 2 bytes = value) |
| $96 | Insert location name (next byte = ID) |
| $97 | Insert current gold amount |
| $98 | Insert current chapter name |

### Text Effects ($A0-$AF)

| Code | Description |
|------|-------------|
| $A0 | Normal text color |
| $A1 | Highlight color |
| $A2 | Warning/red color |
| $A3 | Emphasis/gold color |
| $A4 | Start shaking text |
| $A5 | Stop shaking text |
| $A6 | Start slow reveal |
| $A7 | Normal reveal speed |

## Dialog Data Format

### Dialog Block Header

```
struct DialogHeader {
    uint16  text_ptr;       // Pointer to text data
    uint8   speaker_id;     // Who is speaking (0 = none)
    uint8   flags;          // Dialog flags
}
```

### Dialog Flags

```
Bit 0: Show speaker portrait
Bit 1: Play voice sound
Bit 2: Auto-advance
Bit 3: Can skip
Bit 4: Choice required
Bit 5: Triggers event after
Bit 6: Reserved
Bit 7: Reserved
```

## Text Compression

Dialog text uses a simple dictionary compression:

### Dictionary Codes ($C0-$FF)

Byte values $C0-$FF reference common word/phrase entries in a dictionary table.

| Code | Entry |
|------|-------|
| $C0 | "the " |
| $C1 | "and " |
| $C2 | "you " |
| $C3 | "to " |
| $C4 | "of " |
| $C5 | "is " |
| $C6 | "in " |
| $C7 | "that " |
| $C8 | "it " |
| $C9 | "was " |
| $CA | "for " |
| $CB | "with " |
| ... | ... |

## Menu Text

### Menu String Table

Located in ROM bank $1F.

| ID | Text |
|----|------|
| $00 | "TALK" |
| $01 | "STATUS" |
| $02 | "ITEM" |
| $03 | "EQUIP" |
| $04 | "SPELL" |
| $05 | "SEARCH" |
| $06 | "DOOR" |
| $07 | "STAIRS" |
| ... | ... |

## Name Entry

### Character Name Table

Hero and character names use 8 characters max:

```
struct CharacterName {
    uint8   chars[8];       // Name characters (padded with $00)
}
```

### Name Input Characters

Available characters for Hero naming:
```
A-Z (uppercase only)
a-z (lowercase)
0-9 (numbers)
.  (period)
-  (hyphen)
'  (apostrophe)
(space)
```

## Script Events

### Event Text Triggers

Events can trigger specific dialog:

```
struct EventDialog {
    uint8   event_id;       // Event identifier
    uint8   condition;      // Condition to check
    uint16  dialog_ptr;     // Dialog to display
    uint8   post_action;    // Action after dialog
}
```

### Conditions

| ID | Condition |
|----|-----------|
| $00 | Always |
| $01 | First time only |
| $02 | Chapter check |
| $03 | Item in inventory |
| $04 | Party member present |
| $05 | Event flag set |
| $06 | Gold >= amount |
| ... | ... |

## External References

- [Full Disassembly](https://github.com/TheAnsarya/dragon-warrior-4-info)
- [Text System Analysis](https://github.com/TheAnsarya/dragon-warrior-4-info/blob/main/docs/text_system_analysis.md)
