# Dragon Quest III (SNES) - Text System

Documentation of the text encoding and dialog system in Dragon Quest III (SNES).

## Text Encoding

DQ3 SNES uses Shift-JIS encoding for Japanese text with custom control codes.

### Character Encoding

| Range | Description |
|-------|-------------|
| $00 | Null/End of string |
| $01-$7F | ASCII subset (partial) |
| $81-$9F | Shift-JIS first byte (Kanji) |
| $A1-$DF | Half-width katakana |
| $E0-$EF | Shift-JIS first byte (Kanji) |
| $F0-$FF | Control codes |

### Shift-JIS Mapping

Standard Shift-JIS encoding:
- Hiragana: $82xx range
- Katakana: $83xx range
- Kanji: $88xx-$98xx, $E0xx-$EExx

### Half-Width Katakana ($A1-$DF)

| Byte | Character |
|------|-----------|
| $A1 | 。 |
| $A2 | 「 |
| $A3 | 」 |
| $A4 | 、 |
| $A5 | ・ |
| $A6-$DF | ァ-ン |

## Control Codes ($F0-$FF)

### Basic Control ($F0-$F7)

| Code | Description |
|------|-------------|
| $F0 | End of string |
| $F1 | Line break |
| $F2 | New text box |
| $F3 | Wait for button |
| $F4 | Short pause |
| $F5 | Clear text window |
| $F6 | Text speed fast |
| $F7 | Text speed normal |

### Variable Insertion ($F8-$FD)

| Code | Parameter | Description |
|------|-----------|-------------|
| $F8 | - | Insert hero name |
| $F9 | byte | Insert party member name |
| $FA | byte | Insert item name |
| $FB | byte | Insert spell name |
| $FC | word | Insert number |
| $FD | byte | Insert monster name |

### Special ($FE-$FF)

| Code | Description |
|------|-------------|
| $FE | Extended control (next byte specifies) |
| $FF | Raw byte follows (escape) |

## Extended Control Codes ($FE xx)

| Code | Description |
|------|-------------|
| $FE $00 | Center text |
| $FE $01 | Right align |
| $FE $02 | Start choice menu |
| $FE $03 | End choice menu |
| $FE $04 | Choice option separator |
| $FE $10 | Play sound effect |
| $FE $11 | Play jingle |
| $FE $20 | Text color normal |
| $FE $21 | Text color highlight |
| $FE $22 | Text color warning |
| $FE $30 | Start shaking |
| $FE $31 | Stop shaking |
| $FE $40 | Insert gold amount |
| $FE $41 | Insert time played |

## Dialog System

### Dialog Table

Located in ROM banks $F0-$F3.

```
struct DialogTable {
    uint16  entry_count;        // Number of entries
    uint24  pointers[];         // 24-bit pointers to entries
    uint8   compressed_data[];  // Compressed text
}
```

### Dialog Entry Header

```
struct DialogHeader {
    uint8   speaker_id;     // Who speaks (0 = none)
    uint8   flags;          // Dialog flags
    uint16  text_length;    // Decompressed size
}
```

### Dialog Flags

```
Bit 0: Show speaker portrait
Bit 1: Play voice SFX
Bit 2: Auto-advance
Bit 3: Yes/No choice
Bit 4: Multiple choice
Bit 5: Requires item
Bit 6: Time-of-day specific
Bit 7: Post-event dialog
```

## Text Compression

DQ3 uses dictionary + Huffman compression.

### Dictionary Structure

Common words stored in a dictionary ($F4:8000):

```
struct TextDictionary {
    uint16  entry_count;
    uint16  offsets[entry_count];
    uint8   strings[];      // Null-terminated
}
```

### Dictionary Codes

Bytes $80-$BF (in context) reference dictionary entries:
- $80 = Entry 0
- $81 = Entry 1
- ...

### Huffman Decoding

Remaining text uses Huffman coding:
1. Read bit stream
2. Traverse Huffman tree
3. Output character when leaf reached

## Menu Text

### Menu Categories

| Category | ROM Address |
|----------|-------------|
| Main menu | $F4:0000 |
| Battle menu | $F4:1000 |
| Item menu | $F4:2000 |
| Status menu | $F4:3000 |
| Shop menu | $F4:4000 |
| Church menu | $F4:5000 |

### Menu String Format

```
struct MenuString {
    uint8   text[16];       // Fixed-width (padded)
    uint8   description_ptr_lo;
    uint8   description_ptr_hi;
}
```

## Name Tables

### Item Names ($F4:8000)

```
struct ItemNameTable {
    uint16  count;
    struct {
        uint8   name[12];   // Item name (Shift-JIS)
        uint8   padding[4]; // Padding to 16 bytes
    } items[];
}
```

### Spell Names ($F5:0000)

```
struct SpellNameTable {
    uint16  count;
    struct {
        uint8   name[8];    // Spell name
        uint8   school;     // Magic school
        uint8   padding[7];
    } spells[];
}
```

### Monster Names ($F6:0000)

```
struct MonsterNameTable {
    uint16  count;
    struct {
        uint8   name[12];   // Monster name
        uint8   padding[4];
    } monsters[];
}
```

## Name Entry System

### Hero Name Input

Available characters for hero naming (Japanese):
- Hiragana (full set)
- Katakana (full set)
- Numbers 0-9
- Basic punctuation

### Name Length

Maximum 4 characters (8 bytes in Shift-JIS).

```
struct HeroName {
    uint8   chars[8];       // Name (Shift-JIS, null-padded)
}
```

## NPC Dialog System

### NPC Dialog Lookup

```
struct NPCDialogEntry {
    uint16  npc_id;         // NPC identifier
    uint8   map_id;         // Map location
    uint8   condition;      // Trigger condition
    uint24  dialog_ptr;     // Pointer to dialog
    uint8   post_flag;      // Flag to set after
}
```

### Time-Based Dialog

NPCs have different dialog for day/night:

```
struct TimeDialog {
    uint24  day_dialog;     // Day time dialog
    uint24  night_dialog;   // Night time dialog
}
```

### Condition Types

| ID | Condition |
|----|-----------|
| $00 | Always |
| $01 | First time only |
| $02 | Story flag set |
| $03 | Story flag clear |
| $04 | Has item |
| $05 | Party member present |
| $06 | Class present |
| $07 | Level >= value |
| $08 | Gold >= value |

## Script Events

### Event Text Triggers

```
struct EventText {
    uint16  event_id;       // Triggering event
    uint8   event_type;     // Event category
    uint24  dialog_ptr;     // Dialog to show
    uint8   post_action;    // Action after dialog
}
```

### Event Types

| ID | Type |
|----|------|
| $00 | Talk to NPC |
| $01 | Examine object |
| $02 | Step on tile |
| $03 | Open chest |
| $04 | Enter area |
| $05 | Use item |
| $06 | Cast spell |
| $07 | Battle complete |

## External References

- [DQ3R-Info Repository](https://github.com/TheAnsarya/dq3r-info)
- [Japanese Text Table](https://github.com/TheAnsarya/dq3r-info/blob/main/docs/text_table.md)
