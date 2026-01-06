# Dragon Warrior III (NES) - Text System

## Overview

Dragon Warrior III uses an extended text encoding system to support its larger dialogue requirements. The game includes dictionary compression and multiple text banks to fit all the content.

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
| $49-$5F | Special symbols |

### Control Codes ($E0-$FF)

| Code | Meaning |
|------|---------|
| $E0 | Window pause (wait for button) |
| $E1 | Newline |
| $E2 | Clear window |
| $E3 | Hero name |
| $E4 | Party member 2 name |
| $E5 | Party member 3 name |
| $E6 | Party member 4 name |
| $E7 | Number (1 byte) |
| $E8 | Number (2 bytes) |
| $E9 | Number (4 bytes, gold) |
| $EA | Item name |
| $EB | Monster name |
| $EC | Spell name |
| $ED | Town/Location name |
| $EE | Class name |
| $EF | Personality name |
| $F0 | Color/attribute change |
| $F1-$F7 | Reserved |
| $F8 | Dictionary lookup (1 byte index) |
| $F9 | Dictionary lookup (2 byte index) |
| $FA | Bank switch |
| $FB | Conditional branch |
| $FC | Gender switch (he/she) |
| $FD | Sound effect |
| $FE | Delay |
| $FF | End of string |

## Text Banks

Text is distributed across multiple PRG banks:

| Bank | Address | Contents |
|------|---------|----------|
| 20 | $50000-$53FFF | NPC dialogue (Aliahan) |
| 21 | $54000-$57FFF | NPC dialogue (other towns) |
| 22 | $58000-$5BFFF | NPC dialogue (World of Darkness) |
| 23 | $5C000-$5FFFF | Story/event dialogue |
| 0 | $B000-$BFFF | Menu text, item names |

## Pointer Table Format

Each text bank has its own pointer table:

```
Pointer Table: Bank start + $0000 to Bank start + $03FF
  - 512 entries × 2 bytes = 1024 bytes
  - Points to text within same bank

Text Data: Bank start + $0400 to end of bank
```

## Dictionary Compression

DW3 uses a dictionary of common words/phrases.

### Dictionary Entry Format
```
$F8 [index] = Look up word at dictionary[index]
$F9 [lo] [hi] = Look up word at dictionary[hi:lo]
```

### Dictionary Location
Bank 23, $5FC00-$5FFFF

### Common Dictionary Entries

| Index | Entry |
|-------|-------|
| $00 | "the " |
| $01 | "and " |
| $02 | "you " |
| $03 | "to " |
| $04 | "have " |
| $05 | "for " |
| $06 | "of " |
| $07 | "Thy " |
| $08 | "Thou " |
| $09 | "with " |
| $0A | "art " |
| $0B | "hast " |
| $0C | "dost " |
| $0D | "canst " |
| $0E | "will " |
| $0F | "this " |
| $10 | "from " |
| $11 | "that " |
| $12 | "what " |
| $13 | "hero " |
| $14 | "king " |
| $15 | "castle " |
| $16 | "monster" |
| $17 | "weapon " |
| $18 | "armor " |
| $19 | "spell " |
| $1A | "level " |
| $1B | "experience" |
| ... | ... |

## Name Entry System

### Character Set for Names
- A-Z (uppercase only)
- 0-9
- ' . - 

Maximum name length: 8 characters

### Default Names

| Character | Default (US) |
|-----------|-------------|
| Hero | Erdrick |
| Party 2 | Various |
| Party 3 | Various |
| Party 4 | Various |

## Message Categories

### Town NPC Dialogue

| ID Range | Location |
|----------|----------|
| $000-$01F | Aliahan |
| $020-$03F | Reeve |
| $040-$05F | Romaly |
| $060-$07F | Kazave |
| $080-$09F | Noaniels |
| $0A0-$0BF | Assaram |
| $0C0-$0DF | Isis |
| $0E0-$0FF | Portoga |
| $100-$11F | Baharata |
| $120-$13F | Dharma Temple |
| $140-$15F | Tedanki |
| $160-$17F | Lancel |
| $180-$19F | Edinburgh |
| $1A0-$1BF | Soo |
| $1C0-$1DF | Muor |
| $1E0-$1FF | Rimuldar |

### System Messages

| ID | Message |
|----|---------|
| $00 | "Thy HP have been restored." |
| $01 | "Thy MP have been restored." |
| $02 | "Thy party's strength rises!" |
| $03 | "Thy game has been saved." |
| $04 | "Not enough MP!" |
| $05 | "Not enough gold!" |
| $06 | "Thy inventory is full!" |
| $07 | "This cannot be used here." |
| $08 | "The spell failed!" |
| $09 | "But it had no effect!" |
| $0A | "[Name] learned [Spell]!" |
| $0B | "[Name] has reached Level [X]!" |

### Battle Messages

| ID | Message |
|----|---------|
| $40 | "[Name] attacks!" |
| $41 | "[Name] casts [Spell]!" |
| $42 | "[Name] uses [Item]!" |
| $43 | "The enemy attacks!" |
| $44 | "[Enemy] is defeated!" |
| $45 | "Thy party gained [X] EXP!" |
| $46 | "Thy party found [X] gold!" |
| $47 | "[Name] found [Item]!" |
| $48 | "But nothing happened." |
| $49 | "[Name] is poisoned!" |
| $4A | "[Name] falls asleep!" |
| $4B | "[Name] is confused!" |
| $4C | "[Name] has fallen in battle!" |
| $4D | "Thy party has been defeated..." |
| $4E | "Thou hast done well in defeating [Boss]!" |

### Shop/Inn Messages

| ID | Message |
|----|---------|
| $80 | "Welcome! What dost thou wish to buy?" |
| $81 | "That will be [X] gold. Is that acceptable?" |
| $82 | "Thank thee! Come again!" |
| $83 | "A night's stay will be [X] gold." |
| $84 | "Have a good rest!" |
| $85 | "Thy strength has been restored!" |
| $86 | "What wouldst thou like to sell?" |
| $87 | "I'll give thee [X] gold for that." |

## Gender-Sensitive Text

DW3 supports gender-sensitive pronouns using the $FC control code:

```
$FC [male_text_len] [male_text] [female_text]
```

Example:
```
"${FC}03he she can do it!"
  → "he can do it!" (male)
  → "she can do it!" (female)
```

## Example Text Decoding

### Raw Bytes
```
$17 $24 $38 $3E $39 $E1 $E3 $40 $E0 $F8 $03 $F8 $0B
$24 $2D $2D $38 $34 $2E $38 $FF
```

### Decoded
```
"Welc'me" [newline]
"[Hero], " [wait]
"to "[dictionary: hast]
"achieved" [end]
```

Full: "Welc'me\n[Hero], to hast achieved"

## Text ROM Locations Summary

| Data Type | Bank | Address Range |
|-----------|------|---------------|
| Menu strings | 0 | $B000-$BFFF |
| Item names | 0 | $A000-$A7FF |
| Spell names | 0 | $A800-$AFFF |
| Monster names | 15 | $3C6A0-$3C847 |
| Class names | 18 | $48300-$4837F |
| Personality names | 18 | $48380-$485FF |
| Town names | 0 | $B800-$BFFF |
| NPC dialogue 1 | 20 | $50000-$53FFF |
| NPC dialogue 2 | 21 | $54000-$57FFF |
| NPC dialogue 3 | 22 | $58000-$5BFFF |
| Story text | 23 | $5C000-$5FBFF |
| Dictionary | 23 | $5FC00-$5FFFF |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Data Structures](data-structures.md) - Monster and item data
