# Dragon Warrior (NES) - Text System

## Overview

Dragon Warrior uses a custom character encoding table for text display. The Japanese version uses a different encoding from the US localization.

## US Version Text Encoding

### Main Character Table ($00-$5F)

| Range | Characters |
|-------|------------|
| $00-$09 | `0-9` (digits) |
| $0A-$23 | `A-Z` (uppercase) |
| $24-$3D | `a-z` (lowercase) |
| $3E | `.` (period) |
| $3F | `,` (comma) |
| $40 | `'` (apostrophe) |
| $41 | `"` (quote) |
| $42 | `!` (exclamation) |
| $43 | `?` (question) |
| $44 | `-` (dash) |
| $45 | `:` (colon) |
| $46-$4F | Reserved |
| $50 | ` ` (space) |

### Control Codes ($F0-$FF)

| Code | Description |
|------|-------------|
| $F0 | New line |
| $F1 | Clear text box |
| $F2 | Wait for button |
| $F3 | Insert player name |
| $F4 | Insert monster name |
| $F5 | Insert item name |
| $F6 | Insert number (from buffer) |
| $F7 | Insert location name |
| $F8 | Pause (short) |
| $F9 | Pause (long) |
| $FA | Text speed: fast |
| $FB | Text speed: slow |
| $FC | Play sound effect |
| $FD | Set text color |
| $FE | End message (return to menu) |
| $FF | End dialog (close window) |

## Text Encoding Table (TBL Format)

```
00=0
01=1
02=2
03=3
04=4
05=5
06=6
07=7
08=8
09=9
0A=A
0B=B
0C=C
0D=D
0E=E
0F=F
10=G
11=H
12=I
13=J
14=K
15=L
16=M
17=N
18=O
19=P
1A=Q
1B=R
1C=S
1D=T
1E=U
1F=V
20=W
21=X
22=Y
23=Z
24=a
25=b
26=c
27=d
28=e
29=f
2A=g
2B=h
2C=i
2D=j
2E=k
2F=l
30=m
31=n
32=o
33=p
34=q
35=r
36=s
37=t
38=u
39=v
3A=w
3B=x
3C=y
3D=z
3E=.
3F=,
40='
41="
42=!
43=?
44=-
45=:
50= 
F0=<LINE>
F1=<CLEAR>
F2=<WAIT>
F3=<HERO>
F4=<MONSTER>
F5=<ITEM>
F6=<NUMBER>
F7=<LOCATION>
FE=<END>
FF=<CLOSE>
```

## Text Compression

Dragon Warrior uses simple dictionary compression for common words and phrases:

### Dictionary Entries ($80-$EF)

| Code | Expands To |
|------|------------|
| $80 | "the " |
| $81 | "thou " |
| $82 | "hast " |
| $83 | "thy " |
| $84 | "thee " |
| $85 | "art " |
| $86 | "dost " |
| $87 | " of " |
| $88 | " to " |
| $89 | "Dragon" |
| $8A | "Warrior" |
| $8B | "Slime" |
| $8C | "monster" |
| $8D | " and " |
| $8E | "Erdrick" |
| $8F | "level" |
| ... | ... |

## Dialog Structure

### Dialog Header

| Offset | Size | Description |
|--------|------|-------------|
| $00-$01 | 2 bytes | Pointer to text data |
| $02 | 1 byte | Speaker portrait ID |
| $03 | 1 byte | Text box style |

### Text Box Styles

| ID | Style |
|----|-------|
| $00 | Standard dialog box |
| $01 | Menu/selection box |
| $02 | Status display |
| $03 | Battle message |

## Name Input

### Valid Name Characters

Player names can use:
- A-Z (uppercase only)
- Limited set of symbols

Name is stored as 8 bytes at $0400, padded with spaces ($50).

### Name Length
- Maximum: 8 characters
- Minimum: 1 character

## Menu Text

Menu text is stored separately from dialog:

| ROM Address | Contents |
|-------------|----------|
| $E800 | Main menu options |
| $E820 | Battle menu options |
| $E840 | Status labels |
| $E860 | Item names |

### Main Menu Text
```
COMMAND
TALK
STATUS
STAIRS
SEARCH
SPELL
ITEM
DOOR
TAKE
```

### Battle Menu Text
```
FIGHT
RUN
SPELL
ITEM
```

## Monster Names

Monster names are stored with fixed lengths (12 characters, space-padded):

| ROM Address | Size | Contents |
|-------------|------|----------|
| $ED00 | 40 × 12 | All monster names |

## Spell Names

| ROM Address | Size | Contents |
|-------------|------|----------|
| $EE00 | 10 × 10 | Spell names |

## Location Names

| ROM Address | Size | Contents |
|-------------|------|----------|
| $EF00 | varies | Town/dungeon names |

### Location List
- Tantegel Castle
- Brecconary
- Garinham
- Kol
- Rimuldar
- Cantlin
- Hauksness
- Charlock Castle

## Text Display Routine

The text display routine at $D800:

1. Load text pointer from dialog table
2. Read character byte
3. If control code ($F0-$FF), execute special function
4. If dictionary entry ($80-$EF), expand and recurse
5. Otherwise, look up tile in font table
6. Write tile to screen buffer
7. Repeat until end code

## RAM Text Buffers

| Address | Size | Description |
|---------|------|-------------|
| $0300 | 64 bytes | Current text line buffer |
| $0340 | 64 bytes | Text scratch buffer |
| $0380 | 32 bytes | Name/number insertion buffer |

## Example: Decoding Text

Raw bytes:
```
$80 $15 $0E $1B $18 $50 $82 $24 $25 $28 $24 $37 $28 $27 $FF
```

Decoded:
```
"the " + "H" + "E" + "R" + "O" + " " + "hast " + "d" + "e" + "f" + "e" + "a" + "t" + "e" + "d" + <CLOSE>
= "the HERO hast defeated"
```

## See Also

- [ROM Map](rom-map.md) - ROM layout, text location
- [RAM Map](ram-map.md) - Text buffer addresses
- [Data Structures](data-structures.md) - Monster/item name tables
