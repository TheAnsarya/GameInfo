# Text System Comparison: DW4 NES vs DQ3r SNES

## Overview

This document compares the text and dialog systems between Dragon Warrior IV (NES) and Dragon Quest III Remake (SNES), providing the specifications needed for text conversion tools.

## Encoding Systems

### DW4 NES Text Encoding

DW4 uses a custom single-byte encoding with DTE (Dual Tile Encoding) compression:

```
Range        Usage
-----------  --------------------------
$00-$0F      Control codes
$10          [END] - End of text
$11          [LINE] - New line
$12          [WAIT] - Wait for input
$13          [NAME] - Insert hero name
$14          [ITEM] - Insert item name
$15          [NUMB] - Insert number
$16-$1F      More control codes
$20-$7F      (Not used directly)
$80-$99      Uppercase A-Z
$9A-$B3      Lowercase a-z
$B4-$BD      Numbers 0-9
$BE-$DF      Punctuation, symbols
$E0-$FF      DTE pairs (2 chars per byte)
```

### DQ3r SNES Text Encoding

DQ3r uses modified Shift-JIS for Japanese, with ASCII-compatible codes for menus:

```
Range        Usage
-----------  --------------------------
$00-$1F      Control codes
$20-$7E      ASCII compatible
$80-$9F      Shift-JIS high bytes
$A0-$DF      Katakana / half-width
$E0-$FF      Extended / MTE codes
```

## Control Codes Comparison

### DW4 NES Control Codes

| Code | Name | Effect |
|------|------|--------|
| $00 | NOP | No operation |
| $01 | DELAY | Brief pause |
| $02 | CLEAR | Clear text box |
| $03 | SCROLL | Scroll up one line |
| $10 | END | End text block |
| $11 | LINE | New line |
| $12 | WAIT | Wait for A button |
| $13 | NAME | Hero name variable |
| $14 | ITEM | Item name variable |
| $15 | NUM | Number variable |
| $16 | MONSTER | Monster name variable |
| $17 | GOLD | Gold amount variable |

### DQ3r SNES Control Codes

| Code | Name | Effect |
|------|------|--------|
| $00 | END | End text |
| $01 | LINE | New line |
| $02 | WAIT | Wait for button |
| $03 | CLEAR | Clear window |
| $04 | NAME_1 | Party member 1 name |
| $05 | NAME_2 | Party member 2 name |
| $06 | NAME_3 | Party member 3 name |
| $07 | NAME_4 | Party member 4 name |
| $08 | NUMBER | Insert number |
| $09 | ITEM | Insert item name |
| $0A | SPELL | Insert spell name |
| $0B | MONSTER | Monster name |
| $0C | LOCATION | Location name |
| $0D | COLOR | Text color change |
| $0E | SPEED | Text speed modifier |
| $0F | CHOICE | Branch for choices |

### Control Code Mapping

| DW4 Code | DQ3r Equivalent | Notes |
|----------|-----------------|-------|
| $10 (END) | $00 (END) | Direct map |
| $11 (LINE) | $01 (LINE) | Direct map |
| $12 (WAIT) | $02 (WAIT) | Direct map |
| $13 (NAME) | $04 (NAME_1) | Hero is always slot 1 |
| $14 (ITEM) | $09 (ITEM) | Direct map |
| $15 (NUM) | $08 (NUMBER) | Direct map |
| $16 (MONSTER) | $0B (MONSTER) | Direct map |
| N/A | $0D (COLOR) | New feature |
| N/A | $0E (SPEED) | New feature |

## DTE/MTE Compression

### DW4 DTE (Dual Tile Encoding)

DTE stores 2 characters in 1 byte, achieving ~33% compression:

```
Byte    Expands To
-----   ----------
$E0     "th"
$E1     "he"
$E2     "in"
$E3     "er"
$E4     "an"
$E5     "re"
$E6     "on"
$E7     "en"
$E8     "at"
$E9     "ed"
$EA     "ou"
$EB     "to"
$EC     "it"
$ED     "es"
$EE     "or"
$EF     "nd"
$F0     "st"
$F1     "is"
$F2     "le"
$F3     "ng"
$F4     "te"
$F5     "al"
$F6     "ar"
$F7     "se"
$F8     "ve"
$F9     "me"
$FA     "ll"
$FB     " t"
$FC     "yo"
$FD     "of"
$FE     "ha"
$FF     "ne"
```

### DQ3r MTE (Multi Tile Encoding)

DQ3r uses more sophisticated compression with variable-length sequences:

```
Code Range    Expansion Type
-----------   ---------------
$E0-$EF       2-byte sequences
$F0-$F7       3-byte sequences
$F8-$FB       4-byte sequences
$FC-$FE       Dictionary lookups
$FF           Special escape
```

## Character Sets

### DW4 Character Mapping

```python
DW4_CHARSET = {
    # Uppercase A-Z ($80-$99)
    0x80: 'A', 0x81: 'B', 0x82: 'C', 0x83: 'D',
    0x84: 'E', 0x85: 'F', 0x86: 'G', 0x87: 'H',
    0x88: 'I', 0x89: 'J', 0x8A: 'K', 0x8B: 'L',
    0x8C: 'M', 0x8D: 'N', 0x8E: 'O', 0x8F: 'P',
    0x90: 'Q', 0x91: 'R', 0x92: 'S', 0x93: 'T',
    0x94: 'U', 0x95: 'V', 0x96: 'W', 0x97: 'X',
    0x98: 'Y', 0x99: 'Z',
    
    # Lowercase a-z ($9A-$B3)
    0x9A: 'a', 0x9B: 'b', 0x9C: 'c', 0x9D: 'd',
    0x9E: 'e', 0x9F: 'f', 0xA0: 'g', 0xA1: 'h',
    0xA2: 'i', 0xA3: 'j', 0xA4: 'k', 0xA5: 'l',
    0xA6: 'm', 0xA7: 'n', 0xA8: 'o', 0xA9: 'p',
    0xAA: 'q', 0xAB: 'r', 0xAC: 's', 0xAD: 't',
    0xAE: 'u', 0xAF: 'v', 0xB0: 'w', 0xB1: 'x',
    0xB2: 'y', 0xB3: 'z',
    
    # Numbers 0-9 ($B4-$BD)
    0xB4: '0', 0xB5: '1', 0xB6: '2', 0xB7: '3',
    0xB8: '4', 0xB9: '5', 0xBA: '6', 0xBB: '7',
    0xBC: '8', 0xBD: '9',
    
    # Punctuation ($BE-$DF)
    0xBE: '.', 0xBF: ',', 0xC0: '!', 0xC1: '?',
    0xC2: "'", 0xC3: '"', 0xC4: ':', 0xC5: ';',
    0xC6: '-', 0xC7: '/', 0xC8: '(', 0xC9: ')',
    # ... etc
}
```

### Character Conversion Table

```python
def dw4_to_dq3r_char(dw4_byte):
    """Convert DW4 character to DQ3r encoding."""
    
    # Uppercase A-Z
    if 0x80 <= dw4_byte <= 0x99:
        return 0x41 + (dw4_byte - 0x80)  # ASCII A-Z
    
    # Lowercase a-z
    if 0x9A <= dw4_byte <= 0xB3:
        return 0x61 + (dw4_byte - 0x9A)  # ASCII a-z
    
    # Numbers 0-9
    if 0xB4 <= dw4_byte <= 0xBD:
        return 0x30 + (dw4_byte - 0xB4)  # ASCII 0-9
    
    # Punctuation (map individually)
    punct_map = {
        0xBE: 0x2E,  # .
        0xBF: 0x2C,  # ,
        0xC0: 0x21,  # !
        0xC1: 0x3F,  # ?
        # ... etc
    }
    return punct_map.get(dw4_byte, 0x20)  # Default to space
```

## Dialog System

### DW4 Dialog Structure

```
Dialog Block:
  +$00: Pointer to next block (2 bytes)
  +$02: Speaker ID (1 byte)
  +$03: Text data (variable)
  ...
  +$xx: $10 (END marker)

Speaker IDs:
  $00 = No speaker (narration)
  $01 = Hero
  $02-$0F = Party members
  $10-$FF = NPCs
```

### DQ3r Dialog Structure

```
Dialog Block:
  +$00: Block type (1 byte)
  +$01: Block length (2 bytes)
  +$03: Speaker info (2 bytes)
  +$05: Portrait ID (1 byte)
  +$06: Text data (variable)
  ...
  +$xx: $00 (END marker)

Block Types:
  $00 = Simple text
  $01 = Choice branch
  $02 = Conditional
  $03 = Portrait with text
```

### Dialog Conversion

```c
// Convert DW4 dialog block to DQ3r format
void convert_dialog_block(uint8_t* dw4_data, uint8_t* dq3r_out) {
    int src = 0;
    int dst = 0;
    
    // Write DQ3r header
    dq3r_out[dst++] = 0x00;  // Block type: simple
    int len_pos = dst;
    dst += 2;  // Reserve length bytes
    
    // Convert speaker to portrait
    uint8_t speaker = dw4_data[src++];
    dq3r_out[dst++] = speaker;  // Speaker
    dq3r_out[dst++] = 0;        // Sub-speaker
    dq3r_out[dst++] = speaker_to_portrait(speaker);
    
    // Convert text
    while (dw4_data[src] != 0x10) {  // Until END
        uint8_t b = dw4_data[src++];
        
        // Handle control codes
        if (b < 0x20) {
            dst += convert_control_code(b, &dq3r_out[dst]);
            continue;
        }
        
        // Handle DTE
        if (b >= 0xE0) {
            const char* dte = dte_table[b - 0xE0];
            while (*dte) {
                dq3r_out[dst++] = char_to_dq3r(*dte++);
            }
            continue;
        }
        
        // Convert character
        dq3r_out[dst++] = dw4_to_dq3r_char(b);
    }
    
    // Write END and length
    dq3r_out[dst++] = 0x00;
    int length = dst - 3;
    dq3r_out[len_pos] = length & 0xFF;
    dq3r_out[len_pos + 1] = (length >> 8) & 0xFF;
}
```

## Text Window Differences

### DW4 NES Text Window

- **Size**: 20 columns × 4 rows
- **Position**: Bottom of screen
- **Font**: 8×8 pixels, fixed width
- **Colors**: 2 colors (white on black)

### DQ3r SNES Text Window

- **Size**: 28 columns × 4 rows
- **Position**: Variable (can be top or bottom)
- **Font**: 8×8 or variable width
- **Colors**: 4-16 colors (palette-based)

### Reformatting Requirements

```python
def reformat_text_for_dq3r(text, max_width=28):
    """Reformat DW4 text for wider DQ3r window."""
    
    words = text.split(' ')
    lines = []
    current_line = ""
    
    for word in words:
        test_line = current_line + " " + word if current_line else word
        
        if len(test_line) <= max_width:
            current_line = test_line
        else:
            if current_line:
                lines.append(current_line)
            current_line = word
    
    if current_line:
        lines.append(current_line)
    
    return '\n'.join(lines)
```

## Name Tables

### DW4 Name Storage

```
Item Names: Bank $0C, $8000-$8FFF (4KB)
  - 8 bytes per name
  - ~150 items

Monster Names: Bank $06, $A000-$AFFF
  - 10 bytes per name
  - ~200 monsters

Spell Names: Bank $0D, $9000-$9FFF
  - 8 bytes per name
  - ~70 spells

Location Names: Bank $0E, $B000-$BFFF
  - 12 bytes per name
  - ~100 locations
```

### DQ3r Name Storage

```
All names in single table: Bank $20-$23
  - Variable length with pointers
  - UTF-16 compatible structure
  - Separate tables for each type
```

## Conversion Pipeline

### Full Text Conversion Flow

```
DW4 ROM Binary
    │
    ▼
[Extract Text Blocks]
    │
    ├── Dialog blocks
    ├── Menu strings
    ├── Item names
    ├── Monster names
    └── Location names
    │
    ▼
[Decode DW4 Encoding]
    │
    ├── Apply DTE expansion
    ├── Convert characters
    └── Parse control codes
    │
    ▼
[Intermediate Format (JSON)]
    │
    {
      "type": "dialog",
      "speaker": "npc_001",
      "text": "Welcome to our town!",
      "controls": ["wait", "end"]
    }
    │
    ▼
[Encode for DQ3r]
    │
    ├── Apply MTE compression
    ├── Convert to Shift-JIS
    └── Add DQ3r control codes
    │
    ▼
DQ3r ROM Binary
```

### C# Converter Class

```csharp
public class TextConverter
{
    private readonly Dictionary<byte, string> _dteTable;
    private readonly Dictionary<byte, byte> _charMap;
    private readonly Dictionary<byte, byte[]> _controlMap;
    
    public byte[] Convert(byte[] dw4Data)
    {
        var output = new List<byte>();
        var decoded = DecodeDw4Text(dw4Data);
        var reformatted = ReformatForWidth(decoded, 28);
        var encoded = EncodeDq3rText(reformatted);
        return encoded;
    }
    
    private string DecodeDw4Text(byte[] data)
    {
        var sb = new StringBuilder();
        foreach (var b in data)
        {
            if (b == 0x10) break;  // END
            
            if (b >= 0xE0)
            {
                sb.Append(_dteTable[b]);
            }
            else if (b >= 0x80)
            {
                sb.Append(Dw4ToChar(b));
            }
            else
            {
                // Control code - handle separately
            }
        }
        return sb.ToString();
    }
}
```

## Testing Requirements

| Test Case | Expected Result |
|-----------|-----------------|
| Basic ASCII | "Hello" converts correctly |
| DTE expansion | $E0 → "th" |
| Control codes | $11 → $01 (LINE) |
| Name variable | $13 → $04 (NAME_1) |
| Window width | Text reflows to 28 chars |
| Special chars | "'" and "!" preserved |

## References

- [DW4 Text System](../../dragon-warrior-4-info/docs/formats/TEXT_SYSTEM.md)
- [DW4 Table File](../../dragon-warrior-4-info/data/dw4.tbl)
- [Data Formats Comparison](data-formats.md)
- [Converter Tools](converter-tools.md)
