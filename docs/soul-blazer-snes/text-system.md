# Soul Blazer (SNES) - Text System

## Overview

Soul Blazer uses a custom text encoding system with dictionary compression to fit its extensive dialogue within the ROM. The game supports English text in the North American release.

## Character Encoding

### Control Codes ($00-$1F)

| Code | Meaning |
|------|---------|
| $00 | End of string |
| $01 | Newline |
| $02 | Clear window |
| $03 | Wait for button |
| $04 | Page break |
| $05 | Show selection (Yes/No) |
| $06 | Player name |
| $07 | NPC name |
| $08 | Item name |
| $09 | Number (1 byte) |
| $0A | Number (2 bytes) |
| $0B | Gem count |
| $0C | Gold count |
| $0D | EXP count |
| $0E | Current HP |
| $0F | Max HP |
| $10-$17 | Text color |
| $18 | Dictionary lookup |
| $19 | Extended dictionary |
| $1A | Sound effect |
| $1B | Music change |
| $1C | Portrait change |
| $1D | Animation |
| $1E | Delay |
| $1F | Reserved |

### Standard Characters ($20-$7F)

| Range | Characters |
|-------|------------|
| $20 | (space) |
| $21-$2F | ! " # $ % & ' ( ) * + , - . / |
| $30-$39 | 0-9 |
| $3A-$40 | : ; < = > ? @ |
| $41-$5A | A-Z (uppercase) |
| $5B-$60 | [ \ ] ^ _ ` |
| $61-$7A | a-z (lowercase) |
| $7B-$7F | { \| } ~ |

### Extended Characters ($80-$FF)

| Range | Characters |
|-------|------------|
| $80-$9F | Accented characters (é, ü, etc.) |
| $A0-$BF | Special symbols (→, ♥, ★, etc.) |
| $C0-$FF | Dictionary index range |

## Dictionary Compression

Soul Blazer uses extensive dictionary compression to reduce text size.

### Dictionary Format
```
$18 [index] = Lookup word at dictionary[index]
$C0-$FF = Direct dictionary reference (index - $C0)
```

### Dictionary Location

| Address | Size | Contents |
|---------|------|----------|
| $1E8000 | 4KB | Common words dictionary |
| $1E9000 | 8KB | Extended phrases |

### Common Dictionary Entries

| Index | Entry |
|-------|-------|
| $00 | "the " |
| $01 | "and " |
| $02 | "you " |
| $03 | "to " |
| $04 | "of " |
| $05 | "is " |
| $06 | "in " |
| $07 | "a " |
| $08 | "that " |
| $09 | "have " |
| $0A | "for " |
| $0B | "with " |
| $0C | "it " |
| $0D | "this " |
| $0E | "from " |
| $0F | "will " |
| $10 | "your " |
| $11 | "soul " |
| $12 | "monster" |
| $13 | "people " |
| $14 | "world " |
| $15 | "power " |
| $16 | "Deathtoll" |
| $17 | "Master " |
| $18 | "thank " |
| $19 | "help " |
| $1A | "village " |
| $1B | "town " |
| $1C | "water " |
| $1D | "tree " |
| $1E | "please " |
| $1F | "creature" |
| ... | ... |

## Text Pointer Tables

### Main Dialogue

| Area | Pointer Table | Data Range |
|------|---------------|------------|
| Grass Valley | $0E8000-$0E83FF | $0E8400-$0EBFFF |
| GreenWood | $0EC000-$0EC3FF | $0EC400-$0EFFFF |
| St. Elles | $108000-$1083FF | $108400-$10BFFF |
| Mountain | $10C000-$10C3FF | $10C400-$10FFFF |
| Seabed | $128000-$1283FF | $128400-$12BFFF |
| Ice Palace | $12C000-$12C3FF | $12C400-$12FFFF |
| World of Evil | $148000-$1483FF | $148400-$14BFFF |

### System Messages

| Address | Contents |
|---------|----------|
| $068000 | Menu text |
| $068800 | Item descriptions |
| $069000 | Status messages |
| $069800 | Battle messages |

## Message Window System

### Window Properties

| Property | Value |
|----------|-------|
| Width | 26 tiles (208 pixels) |
| Height | 4 lines |
| Font | 8×8 variable width |
| Border | 8 pixel frame |
| Position | Bottom of screen |

### Portrait System

When talking to NPCs, a portrait may be displayed:

```
$1C [portrait_id]  ; Change portrait
```

| Portrait ID | Character |
|-------------|-----------|
| $00 | No portrait |
| $01 | Hero |
| $02 | Lisa |
| $03 | Master (Angel) |
| $04 | Village Elder |
| $05-$1F | Various NPCs |

### Text Colors

| Code | Color |
|------|-------|
| $10 | White (default) |
| $11 | Yellow (highlight) |
| $12 | Green (items) |
| $13 | Blue (magic) |
| $14 | Red (enemy/danger) |
| $15 | Gray (disabled) |

## Message Categories

### NPC Dialogue

Each area has unique NPC dialogue:

| ID Range | Area |
|----------|------|
| $000-$03F | Grass Valley town |
| $040-$07F | GreenWood town |
| $080-$0BF | St. Elles town |
| $0C0-$0FF | Mountain town |
| $100-$13F | Seabed town |
| $140-$17F | Ice Palace area |
| $180-$1BF | World of Evil |
| $1C0-$1FF | Ending/misc |

### Released Soul Messages

When releasing souls from monster lairs:

| Type | Message |
|------|---------|
| Person | "Thank you for saving me!" |
| Animal | "[Animal] has been released." |
| Plant | "The [plant] has been revived." |
| Object | "The [object] has returned." |

### System Messages

| ID | Message |
|----|---------|
| $00 | "[Name] found [Item]!" |
| $01 | "[Name] received [X] EXP!" |
| $02 | "[Name] received [X] GEMs!" |
| $03 | "Level up! [Name] is now level [X]!" |
| $04 | "[Name] learned [Magic]!" |
| $05 | "HP restored!" |
| $06 | "Saved!" |
| $07 | "You cannot carry any more." |
| $08 | "You do not have that item." |
| $09 | "Nothing happens..." |

### Battle/Status Messages

| ID | Message |
|----|---------|
| $20 | "[Name] attacks!" |
| $21 | "[Enemy] is defeated!" |
| $22 | "[Name] took [X] damage!" |
| $23 | "Critical hit!" |
| $24 | "The attack missed!" |
| $25 | "[Name] used [Item]!" |
| $26 | "[Name] casts [Magic]!" |
| $27 | "Not enough magic power!" |

## Name Entry

### Hero Name

- Maximum length: 8 characters
- Character set: A-Z (uppercase), a-z (lowercase), 0-9
- Default: "BLAZER"

### Name Storage

| Address | Contents |
|---------|----------|
| $7E0100-$7E0107 | Hero name (8 bytes, null-padded) |

## Item/Magic Names

### Item Names (Bank $06)

| Address | Contents |
|---------|----------|
| $068800-$069000 | Item names (64 items × 16 bytes) |

### Magic Names

| ID | Name |
|----|------|
| $00 | Soul Blade |
| $01 | Phoenix |
| $02 | Light Arrow |
| $03 | Magic Flare |
| $04 | Rotation |
| $05 | Zantetsu |
| $06 | Spark Bomb |
| $07 | Flame Ball |

## Text Rendering

### Font Information

The game uses a variable-width 8×8 font:

| Character Type | Width |
|----------------|-------|
| Space | 4 pixels |
| Punctuation | 4-6 pixels |
| Lowercase | 6-8 pixels |
| Uppercase | 7-8 pixels |
| Numbers | 7 pixels |

### Text Speed

| Setting | Frames per character |
|---------|---------------------|
| Fast | 1 |
| Normal | 2 |
| Slow | 4 |

## ROM Locations Summary

| Data Type | Bank | Address Range |
|-----------|------|---------------|
| Dictionary | $1E | $1E8000-$1E9FFF |
| Menu text | $06 | $068000-$0687FF |
| Item names | $06 | $068800-$068FFF |
| System messages | $06 | $069000-$069FFF |
| Area 1 dialogue | $0E | $0E8000-$0EFFFF |
| Area 2 dialogue | $10 | $108000-$10FFFF |
| Area 3 dialogue | $12 | $128000-$12FFFF |
| Area 4 dialogue | $14 | $148000-$14FFFF |

## See Also

- [ROM Map](rom-map.md) - Complete ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Data Structures](data-structures.md) - Enemy, item, and magic data
