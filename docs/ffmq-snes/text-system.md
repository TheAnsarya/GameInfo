# Final Fantasy Mystic Quest (SNES) - Text System

Documentation of the text encoding and dialog system in Final Fantasy Mystic Quest.

## Text Encoding

FFMQ uses a custom text encoding for all in-game text.

### Standard Character Table

| Range | Characters |
|-------|------------|
| $00 | (null/end) |
| $01-$1A | A-Z |
| $1B-$34 | a-z |
| $35-$3E | 0-9 |
| $3F | (space) |
| $40-$5F | Punctuation |
| $60-$7F | Special chars |
| $80-$FF | Control codes |

### Extended Characters ($40-$5F)

| Byte | Character |
|------|-----------|
| $40 | ! |
| $41 | ? |
| $42 | . |
| $43 | , |
| $44 | ' |
| $45 | " |
| $46 | - |
| $47 | : |
| $48 | ; |
| $49 | ( |
| $4A | ) |
| $4B | / |
| $4C | & |
| $4D | + |
| $4E | = |
| $4F | * |

## Control Codes

### Basic Control ($80-$8F)

| Code | Description |
|------|-------------|
| $80 | End of string |
| $81 | Line break |
| $82 | New text box |
| $83 | Wait for input |
| $84 | Short pause |
| $85 | Medium pause |
| $86 | Long pause |
| $87 | Clear line |
| $88 | Center text |
| $89 | Right align |
| $8A | Flash text |
| $8B | Stop flash |

### Variable Insertion ($90-$9F)

| Code | Parameters | Description |
|------|------------|-------------|
| $90 | - | Insert Benjamin's name |
| $91 | - | Insert partner's name |
| $92 | byte | Insert item name |
| $93 | byte | Insert spell name |
| $94 | byte | Insert monster name |
| $95 | word | Insert number |
| $96 | byte | Insert location name |
| $97 | - | Insert current gold |
| $98 | byte | Insert weapon name |
| $99 | byte | Insert armor name |

### Text Effects ($A0-$AF)

| Code | Description |
|------|-------------|
| $A0 | Normal color |
| $A1 | Blue color |
| $A2 | Red color |
| $A3 | Green color |
| $A4 | Yellow color |
| $A5 | Purple color |
| $A6 | Orange color |
| $A7 | White color |

### Sound Effects ($B0-$BF)

| Code | Parameters | Description |
|------|------------|-------------|
| $B0 | byte | Play sound effect |
| $B1 | byte | Play jingle |
| $B2 | - | Stop all sounds |

## Dialog System

### Dialog Table Structure

Located in ROM starting at $18:0000.

```
struct DialogTable {
    uint16  pointers[1024];     // Dialog entry pointers
    uint8   text_data[];        // Compressed text
}
```

### Dialog Entry

Each dialog entry starts with a header:

```
struct DialogEntry {
    uint8   flags;              // Dialog flags
    uint8   portrait_id;        // Speaker portrait (0 = none)
    uint16  text_length;        // Decompressed length
    uint8   compressed_text[];  // Text data
}
```

### Dialog Flags

```
Bit 0: Show portrait
Bit 1: Play voice sound
Bit 2: Auto-advance
Bit 3: Yes/No choice
Bit 4: Multiple choice
Bit 5: Trigger event
Bit 6: Shop dialog
Bit 7: Battle dialog
```

## Text Compression

### Compression Method

FFMQ uses dictionary-based compression:

1. Common words stored in dictionary
2. Bytes $C0-$FF reference dictionary
3. Huffman coding for remaining text

### Dictionary Structure

```
struct Dictionary {
    uint16  entry_count;
    uint16  offsets[entry_count];
    uint8   strings[];          // Null-terminated strings
}
```

### Dictionary Entries ($C0-$FF)

| Code | Entry |
|------|-------|
| $C0 | "the " |
| $C1 | "you " |
| $C2 | "and " |
| $C3 | "to " |
| $C4 | "of " |
| $C5 | "is " |
| $C6 | "that" |
| $C7 | "have" |
| $C8 | "with" |
| $C9 | "will" |
| $CA | "from" |
| $CB | "this" |
| ... | ... |

## Menu Text

### Menu String Categories

| Category | ROM Location |
|----------|--------------|
| Main menu | $1A:8000 |
| Battle menu | $1A:8200 |
| Item names | $1A:8400 |
| Spell names | $1A:8800 |
| Monster names | $1A:8C00 |
| Status text | $1A:9000 |

### Menu Item Format

```
struct MenuItem {
    uint8   text[12];       // Fixed-width name
    uint8   description[32];// Description (pointer)
}
```

## Name Entry

### Character Names

Benjamin's name can be customized (up to 6 characters):

```
struct PlayerName {
    uint8   chars[6];       // Name characters
    uint8   length;         // Actual length
    uint8   padding;        // Alignment
}
```

### Available Characters

Name entry allows:
- A-Z (uppercase)
- a-z (lowercase)
- Space
- Period
- Hyphen

## Script Events

### Event Dialog Links

Events can trigger specific dialog:

```
struct EventDialogLink {
    uint16  event_id;       // Event that triggers
    uint8   condition;      // Required flag
    uint16  dialog_id;      // Dialog to show
    uint8   post_action;    // Action after
}
```

### Conditions

| ID | Condition |
|----|-----------|
| $00 | Always show |
| $01 | First time only |
| $02 | Quest item owned |
| $03 | Specific chapter |
| $04 | Partner present |
| $05 | Event flag set |
| $06 | Gold >= amount |
| $07 | Level >= value |

## NPC Dialog

### NPC Entry Dialog Format

```
struct NPCDialog {
    uint8   npc_id;         // NPC identifier
    uint8   map_id;         // Map where found
    uint16  dialog_ptr;     // Primary dialog
    uint16  alt_dialog_ptr; // After event dialog
    uint8   trigger_event;  // Event to check
}
```

### Dialog State Machine

```
1. Player interacts with NPC
2. Check trigger event
3. Select primary or alternate dialog
4. Play dialog with effects
5. Handle choices if present
6. Execute post-dialog action
```

## External References

- [Full Disassembly](https://github.com/TheAnsarya/ffmq-info)
- [Dialog System Docs](https://github.com/TheAnsarya/ffmq-info/blob/master/docs/DIALOG_SYSTEM.md)
