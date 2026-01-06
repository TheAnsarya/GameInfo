# Dragon Quest I & II (SNES) - Text System

## Overview

Dragon Quest I & II for SNES uses a Japanese text encoding system with dictionary compression. The game supports the full hiragana, katakana, and kanji character sets used in the Japanese release.

## Character Encoding

### Control Codes ($00-$1F)

| Code | Meaning |
|------|---------|
| $00 | End of string |
| $01 | Newline |
| $02 | Clear window |
| $03 | Wait for button |
| $04 | Show selection |
| $05 | Hero name |
| $06 | Party member 2 |
| $07 | Party member 3 |
| $08 | Number (1 byte) |
| $09 | Number (2 bytes) |
| $0A | Number (4 bytes) |
| $0B | Item name |
| $0C | Monster name |
| $0D | Spell name |
| $0E | Location name |
| $0F | Gold amount |
| $10-$17 | Color change |
| $18 | Dictionary (1 byte) |
| $19 | Dictionary (2 byte) |
| $1A | Sound effect |
| $1B | Delay |
| $1C | Animation |
| $1D-$1F | Reserved |

### Hiragana ($20-$5F)

| Range | Characters |
|-------|------------|
| $20-$25 | あ い う え お (a i u e o) |
| $26-$2B | か き く け こ (ka ki ku ke ko) |
| $2C-$31 | さ し す せ そ (sa shi su se so) |
| $32-$37 | た ち つ て と (ta chi tsu te to) |
| $38-$3C | な に ぬ ね の (na ni nu ne no) |
| $3D-$42 | は ひ ふ へ ほ (ha hi fu he ho) |
| $43-$47 | ま み む め も (ma mi mu me mo) |
| $48-$4A | や ゆ よ (ya yu yo) |
| $4B-$4F | ら り る れ ろ (ra ri ru re ro) |
| $50-$51 | わ を (wa wo) |
| $52 | ん (n) |
| $53-$5F | Small kana, punctuation |

### Katakana ($60-$9F)

Same layout as hiragana but for katakana characters.

### Kanji ($A0-$FF, extended)

Common kanji are stored in a table. Codes $A0+ reference kanji by index.

### Extended Characters (2-byte codes)

For less common kanji, a 2-byte escape sequence is used:
```
$FF [kanji_id_lo] [kanji_id_hi]
```

## Dictionary Compression

The game uses dictionary compression to reduce text size.

### Dictionary Format
```
$18 [index] = Lookup word at dictionary[index]
$19 [lo] [hi] = Lookup at dictionary[hi:lo]
```

### Dictionary Location

| Game | Bank | Address |
|------|------|---------|
| DQ1 | $C9 | $C9F000-$C9FFFF |
| DQ2 | $D4 | $D4F000-$D4FFFF |

### Common Dictionary Entries

| Index | Entry (Japanese) | Meaning |
|-------|-----------------|---------|
| $00 | の | (particle) |
| $01 | は | (particle) |
| $02 | を | (particle) |
| $03 | が | (particle) |
| $04 | に | (particle) |
| $05 | だ | is/are |
| $06 | です | (polite) |
| $07 | します | do |
| $08 | ありがとう | thank you |
| $09 | 勇者 | hero |
| $0A | 王様 | king |
| $0B | モンスター | monster |
| $0C | 城 | castle |
| $0D | 町 | town |
| ... | ... | ... |

## Text Pointer Tables

### DQ1 Text

| Type | Bank | Pointer Table | Data Range |
|------|------|---------------|------------|
| NPC Dialogue | $C8 | $C80000-$C803FF | $C80400-$C8FFFF |
| Story Text | $C9 | $C90000-$C903FF | $C90400-$C9EFFF |
| System Messages | $C3 | $C3E000-$C3E1FF | $C3E200-$C3FFFF |
| Item Names | $C3 | $C38200-$C3837F | (inline) |
| Monster Names | $C7 | $C704B0-$C707CF | (inline) |

### DQ2 Text

| Type | Bank | Pointer Table | Data Range |
|------|------|---------------|------------|
| NPC Dialogue 1 | $D2 | $D20000-$D203FF | $D20400-$D2FFFF |
| NPC Dialogue 2 | $D3 | $D30000-$D303FF | $D30400-$D3FFFF |
| Story Text | $D4 | $D40000-$D403FF | $D40400-$D4EFFF |
| System Messages | $CC | $CCE000-$CCE1FF | $CCE200-$CCFFFF |

## Message Window Format

### Window Properties

| Property | Value |
|----------|-------|
| Width | 28 tiles (224 pixels) |
| Height | 4 lines |
| Font | 8×8 variable width |
| Border | 8 pixels |

### Text Flow
1. Characters appear one at a time
2. $03 pauses for button press
3. $01 advances to next line
4. $02 clears window and continues

## Name Entry

### DQ1 Name Entry
- Maximum length: 4 characters (Japanese)
- Character set: Hiragana only
- Dakuten/Handakuten supported

### DQ2 Name Entry
- Maximum length: 4 characters per hero
- Same character set as DQ1

### Default Names (Japanese)

| Character | Default |
|-----------|---------|
| DQ1 Hero | ロト (Loto/Erdrick) |
| DQ2 Midenhall | ローレシア (Lorecia) |
| DQ2 Cannock | サマルトリア (Samaltria) |
| DQ2 Moonbrooke | ムーンブルク (Moonbrooke) |

## Message Categories

### DQ1 NPCs

| ID Range | Location |
|----------|----------|
| $000-$01F | Tantegel Castle |
| $020-$02F | Brecconary |
| $030-$03F | Garinham |
| $040-$04F | Kol |
| $050-$05F | Rimuldar |
| $060-$06F | Cantlin |
| $070-$07F | Charlock Castle |

### DQ2 NPCs

| ID Range | Location |
|----------|----------|
| $000-$01F | Midenhall |
| $020-$03F | Leftwyne |
| $040-$05F | Cannock |
| $060-$07F | Hamlin |
| $080-$09F | Moonbrooke |
| $0A0-$0BF | Lianport |
| ... | ... |

## System Messages

### DQ1 System Messages

| ID | Message (Translation) |
|----|----------------------|
| $00 | "Your HP have been restored." |
| $01 | "Your MP have been restored." |
| $02 | "Your game has been saved." |
| $03 | "Not enough MP!" |
| $04 | "The spell failed!" |

### DQ2 System Messages

| ID | Message (Translation) |
|----|----------------------|
| $00 | "The party's HP have been restored." |
| $01 | "The party's MP have been restored." |
| $02 | "Your game has been saved." |
| $03 | "[Name] does not have enough MP!" |
| $04 | "The item box is full!" |

## Battle Messages

### Attack Messages

| ID | Message Pattern |
|----|-----------------|
| $40 | "[Name] attacks!" |
| $41 | "[Name] casts [Spell]!" |
| $42 | "[Monster] attacks!" |
| $43 | "[Monster] breathes fire!" |
| $44 | "[Target] takes [X] damage!" |
| $45 | "[Target] is defeated!" |
| $46 | "Critical hit!" |
| $47 | "But it missed!" |

### Result Messages

| ID | Message Pattern |
|----|-----------------|
| $60 | "Victory!" |
| $61 | "Gained [X] experience!" |
| $62 | "Received [X] gold!" |
| $63 | "[Name] has leveled up!" |
| $64 | "[Name] learned [Spell]!" |
| $65 | "The party has been defeated..." |

## Text Rendering

### Variable Width Font

Character widths range from 6-8 pixels:
- Punctuation: 4-6 pixels
- Kana: 8 pixels
- Kanji: 8 pixels

### Text Speed Settings

| Setting | Delay per character |
|---------|-------------------|
| Fast | 1 frame |
| Normal | 2 frames |
| Slow | 4 frames |

## ROM Locations Summary

| Data Type | DQ1 Bank | DQ2 Bank |
|-----------|----------|----------|
| Dialogue pointers | $C8 | $D2-$D4 |
| Dictionary | $C9 | $D4 |
| System text | $C3 | $CC |
| Item names | $C3 | $CC |
| Monster names | $C7 | $D1 |
| Spell names | $C3 | $CC |
| Location names | $C8 | $D4 |

## See Also

- [ROM Map](rom-map.md) - ROM layout
- [RAM Map](ram-map.md) - Memory addresses
- [Data Structures](data-structures.md) - Monster and item data
