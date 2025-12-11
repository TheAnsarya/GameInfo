# TBL File Format Specification

Text Table (.tbl) file format documentation.

## Overview

TBL (Text Table) files define character encoding mappings for game text. They translate between hex values in the ROM and human-readable characters.

## Basic Format

Each line maps a hex value to a character:

```
XX=C
```

| Part | Description |
|------|-------------|
| `XX` | Hexadecimal byte value (1-2 bytes) |
| `=` | Separator |
| `C` | Character or string |

## Single-Byte Encoding

Most games use single-byte encoding:

```
00=0
01=1
02=2
...
0A=A
0B=B
0C=C
...
50= 
51=.
52=!
```

### Example: Dragon Quest Style

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
40= 
41=.
42=,
43=!
44=?
45='
FF=[END]
```

## Multi-Byte Encoding

Some games use multi-byte sequences:

```
AB00=Fire
AB01=Ice
AB02=Thunder
```

### Dictionary/DTE Encoding

Dictionary Table Entry (DTE) compression:

```
80=th
81=he
82=in
83=er
84=an
85=re
```

## Special Characters

### Control Codes

```
F0=[LINE]
F1=[WAIT]
F2=[CLEAR]
F3=[NAME]
FF=[END]
```

### Line Breaks

```
FE=\n
```

Or with brackets:

```
FE=[LINE]
```

### Variables/Placeholders

```
F0=[HERO]
F1=[GOLD]
F2=[ITEM]
```

## Comments

Lines starting with `;` or `//` are comments:

```
; Character Table for Dragon Quest
; Version 1.0

00=0
01=1
; ...
```

## Case Sensitivity

Hex values should be lowercase per project convention:

```
; Correct
0a=A
ff=[END]

; Incorrect
0A=A
FF=[END]
```

## TBL File Sections

### Data Crystal Wikitext Format

For wiki documentation:

```
{{TBL
|00=0
|01=1
|02=2
...
}}
```

### Grid Format

16x16 grid display:

```
    0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F
0x  0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F
1x  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V
2x  W  X  Y  Z  a  b  c  d  e  f  g  h  i  j  k  l
...
```

## Parsing TBL Files

### Python Parser

```python
def parse_tbl_file(filename):
	"""Parse TBL file into dictionary."""
	encoding = {}

	with open(filename, 'r', encoding='utf-8') as f:
		for line in f:
			line = line.strip()

			# Skip comments and empty lines
			if not line or line.startswith(';') or line.startswith('//'):
				continue

			# Parse XX=C format
			if '=' in line:
				parts = line.split('=', 1)
				hex_value = int(parts[0], 16)
				char = parts[1]
				encoding[hex_value] = char

	return encoding
```

### Decoding Text

```python
def decode_text(data, tbl):
	"""Decode bytes using TBL encoding."""
	result = []
	i = 0

	while i < len(data):
		byte = data[i]

		if byte in tbl:
			result.append(tbl[byte])
		else:
			result.append(f'[{byte:02x}]')

		i += 1

	return ''.join(result)
```

### Encoding Text

```python
def encode_text(text, tbl):
	"""Encode text using TBL encoding."""
	# Create reverse mapping
	reverse_tbl = {v: k for k, v in tbl.items()}

	result = []
	i = 0

	while i < len(text):
		found = False

		# Try multi-character matches first (longest match)
		for length in range(min(10, len(text) - i), 0, -1):
			substr = text[i:i+length]
			if substr in reverse_tbl:
				result.append(reverse_tbl[substr])
				i += length
				found = True
				break

		if not found:
			raise ValueError(f"Cannot encode character: {text[i]}")

	return bytes(result)
```

## Multi-Byte Handling

### Variable-Width Encoding

```python
def decode_variable_width(data, tbl, multi_byte_prefix=0xab):
	"""Decode with multi-byte sequences."""
	result = []
	i = 0

	while i < len(data):
		byte = data[i]

		# Check for multi-byte prefix
		if byte == multi_byte_prefix and i + 1 < len(data):
			two_byte = (byte << 8) | data[i + 1]
			if two_byte in tbl:
				result.append(tbl[two_byte])
				i += 2
				continue

		# Single byte
		if byte in tbl:
			result.append(tbl[byte])
		else:
			result.append(f'[{byte:02x}]')

		i += 1

	return ''.join(result)
```

## Common Control Codes

### NES Games

| Code | Meaning |
|------|---------|
| `$00` | String terminator |
| `$FE` | Line break |
| `$FF` | End of text |

### SNES Games

| Code | Meaning |
|------|---------|
| `$00` | String terminator |
| `$01-$0F` | Control codes |
| `$01` | Line break |
| `$02` | New page |

## Best Practices

### File Organization

```
tables/
├── game.tbl           # Main table
├── game_items.tbl     # Item names
├── game_enemies.tbl   # Enemy names
└── game_menu.tbl      # Menu text
```

### Documentation

Include header comments:

```
; Game Name - Text Table
; Version: 1.0
; Date: 2024-01-15
; 
; Encoding: Single-byte
; End marker: $ff
; Line break: $fe
;
; Notes:
; - Characters $00-$09 are digits
; - Characters $0a-$23 are uppercase letters
; - Character $ff terminates all strings

00=0
01=1
...
```

### Validation

```python
def validate_tbl(tbl):
	"""Validate TBL for common issues."""
	issues = []

	# Check for duplicate values
	chars = {}
	for hex_val, char in tbl.items():
		if char in chars:
			issues.append(f"Duplicate character '{char}' at ${hex_val:02x} and ${chars[char]:02x}")
		chars[char] = hex_val

	# Check for gaps
	for i in range(max(tbl.keys()) + 1):
		if i not in tbl:
			issues.append(f"Missing entry for ${i:02x}")

	return issues
```

## References

- [Data Crystal TBL Format](https://datacrystal.tcrf.net/wiki/TBL)
- [Romhacking.net Translation Guide](https://www.romhacking.net/documents/164/)
