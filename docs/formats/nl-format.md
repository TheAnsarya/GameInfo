# NL File Format Specification

FCEUX Name List (.nl) file format documentation.

## Overview

NL (Name List) files store debug labels for the FCEUX emulator. Unlike MLB files, FCEUX uses separate files for different memory regions.

## File Naming Convention

FCEUX expects specific filenames based on the ROM name:

| File Pattern | Purpose |
|--------------|---------|
| `game.ram.nl` | RAM labels (`$0000-$07FF`) |
| `game.0.nl` | PRG Bank 0 labels |
| `game.1.nl` | PRG Bank 1 labels |
| `game.N.nl` | PRG Bank N labels |

Example for "Dragon Warrior.nes":
- `Dragon Warrior.ram.nl`
- `Dragon Warrior.0.nl`
- `Dragon Warrior.1.nl`

## Line Format

```
$AAAA#LABEL#COMMENT
```

| Field | Description |
|-------|-------------|
| `$AAAA` | Hexadecimal address with `$` prefix |
| `LABEL` | Label name (no spaces) |
| `COMMENT` | Optional comment |

Fields are separated by `#` characters.

## Address Ranges

### RAM File (`.ram.nl`)

| Range | Description |
|-------|-------------|
| `$0000-$00FF` | Zero page |
| `$0100-$01FF` | Stack |
| `$0200-$07FF` | General RAM |

### Bank Files (`.N.nl`)

Bank-relative addresses, typically `$8000-$BFFF` or `$C000-$FFFF`:

| Address | Meaning |
|---------|---------|
| `$8000` | Start of bank |
| `$BFFF` | End of 16KB bank |
| `$FFFF` | End of 32KB bank |

## Examples

### RAM Labels (`game.ram.nl`)

```
$00A5#player_hp#Current HP
$00A6#player_mp#Current MP
$00A7#player_x_lo#X position low byte
$00A8#player_x_hi#X position high byte
$0200#sprite_data#OAM sprite buffer (256 bytes)
```

### Bank Labels (`game.0.nl`)

```
$8000#bank0_start#Start of bank 0
$8234#update_player#Main player update
$8500#enemy_ai#Enemy AI routine
$BFFF#bank0_end#End of bank 0
```

### Fixed Bank (`game.7.nl` - last bank)

```
$C000#fixed_bank#Fixed bank start
$FF00#music_engine#Sound driver
$FFFA#nmi_vector#NMI vector
$FFFC#reset_vector#Reset vector
$FFFE#irq_vector#IRQ vector
```

## Parsing NL Files

### Python Parser

```python
def parse_nl_line(line):
	"""Parse a single NL line."""
	line = line.strip()
	if not line or line.startswith(';'):
		return None

	# Remove leading $ and split by #
	if line.startswith('$'):
		line = line[1:]

	parts = line.split('#')
	if len(parts) < 2:
		return None

	return {
		'address': int(parts[0], 16),
		'label': parts[1],
		'comment': parts[2] if len(parts) > 2 else ''
	}

def load_nl_file(filename):
	"""Load all labels from NL file."""
	labels = []
	with open(filename, 'r', encoding='utf-8') as f:
		for line in f:
			label = parse_nl_line(line)
			if label:
				labels.append(label)
	return labels
```

### Writing NL Files

```python
def format_nl_line(address, label, comment=''):
	"""Format as NL line."""
	line = f"${address:04X}#{label}"
	if comment:
		line += f"#{comment}"
	return line

def save_nl_file(filename, labels):
	"""Save labels to NL file."""
	# Sort by address
	sorted_labels = sorted(labels, key=lambda l: l['address'])

	with open(filename, 'w', encoding='utf-8') as f:
		for label in sorted_labels:
			f.write(format_nl_line(
				label['address'],
				label['label'],
				label.get('comment', '')
			) + '\n')
```

## Bank Mapping

### Calculating Bank Number

For mappers like MMC1 (16KB banks):

```python
def get_bank_number(rom_offset, bank_size=0x4000):
	"""Get bank number from ROM offset."""
	# Skip header (16 bytes for iNES)
	offset = rom_offset - 16
	return offset // bank_size
```

### CPU to Bank Address

```python
def cpu_to_bank_address(cpu_address, bank_base=0x8000):
	"""Convert CPU address to bank-relative address."""
	return cpu_address  # NL files use CPU addresses directly
```

## Multi-Bank Projects

For games with many banks, organize files:

```
labels/
├── Dragon Warrior.ram.nl
├── Dragon Warrior.0.nl
├── Dragon Warrior.1.nl
├── Dragon Warrior.2.nl
├── Dragon Warrior.3.nl
├── Dragon Warrior.4.nl
├── Dragon Warrior.5.nl
├── Dragon Warrior.6.nl
└── Dragon Warrior.7.nl
```

### Batch Creation

```python
def create_nl_files(game_name, num_banks):
	"""Create empty NL files for a game."""
	# Create RAM file
	with open(f"{game_name}.ram.nl", 'w') as f:
		f.write("; RAM labels for {}\n".format(game_name))

	# Create bank files
	for bank in range(num_banks):
		with open(f"{game_name}.{bank}.nl", 'w') as f:
			f.write(f"; Bank {bank} labels for {game_name}\n")
```

## Conversion

### MLB to NL

```python
def mlb_to_nl(mlb_labels, game_name):
	"""Convert MLB labels to NL files."""
	ram_labels = []
	bank_labels = {}

	for label in mlb_labels:
		addr = label['address']

		if label['type'] == 'W':  # Work RAM
			ram_labels.append(label)
		elif label['type'] == 'P':  # PRG ROM
			# Determine bank (simplified - assumes 16KB banks)
			if addr >= 0xC000:
				bank = 'fixed'
			else:
				bank = (addr - 0x8000) // 0x4000

			if bank not in bank_labels:
				bank_labels[bank] = []
			bank_labels[bank].append(label)

	# Save RAM file
	save_nl_file(f"{game_name}.ram.nl", ram_labels)

	# Save bank files
	for bank, labels in bank_labels.items():
		save_nl_file(f"{game_name}.{bank}.nl", labels)
```

### NL to MLB

```python
def nl_to_mlb(game_name, nl_files):
	"""Convert NL files to MLB format."""
	mlb_labels = []

	for nl_file in nl_files:
		nl_labels = load_nl_file(nl_file)

		# Determine type from filename
		if '.ram.' in nl_file:
			label_type = 'W'
		else:
			label_type = 'P'

		for label in nl_labels:
			mlb_labels.append({
				'type': label_type,
				'address': label['address'],
				'label': label['label'],
				'comment': label.get('comment', '')
			})

	return mlb_labels
```

## Best Practices

### Comments

Use semicolons for file comments:

```
; Dragon Warrior RAM Labels
; Created: 2024-01-15
; Last updated: 2024-01-20

$00A5#player_hp#Current HP (1 byte)
$00A6#player_mp#Current MP (1 byte)
```

### Organization

Group related labels:

```
; === Player Data ===
$00A5#player_hp
$00A6#player_mp
$00A7#player_level

; === Enemy Data ===
$0100#enemy_count
$0101#enemy_hp_table
```

### Consistency

- Use same label names across RAM and ROM files
- Keep naming conventions consistent
- Document address ranges at top of file

## References

- [FCEUX Documentation](https://fceux.com/web/help/NLFilesFormat.html)
- [FCEUX GitHub](https://github.com/TASEmulators/fceux)
