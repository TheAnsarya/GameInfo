#!/usr/bin/env python3
"""
Soul Blazer (SNES) Text Extractor
Extracts dialogue and text from the ROM.
"""

import json
import struct
from pathlib import Path
from typing import Optional


# Soul Blazer text encoding table
# The game uses mostly ASCII with some control codes
TEXT_TABLE = {
	# Control codes
	0x00: '{END}',
	0x01: '{NL}',       # Newline
	0x02: '{WAIT}',     # Wait for button
	0x03: '{CLEAR}',    # Clear textbox
	0x04: '{PAUSE}',    # Short pause
	0x05: '{NAME}',     # Player name
	0x06: '{ITEM}',     # Item name
	0x07: '{NUM}',      # Number placeholder

	# Printable ASCII (0x20-0x7e maps directly)
}

# Special characters and dictionary compression (if any)
SPECIAL_CHARS = {
	0x80: "'",
	0x81: '"',
	0x82: '...',
	0x83: '-',
	0x84: '!',
	0x85: '?',
}


def decode_text(data: bytes, table: dict = None) -> str:
	"""Decode Soul Blazer text to string."""
	if table is None:
		table = TEXT_TABLE

	result = []
	i = 0

	while i < len(data):
		b = data[i]

		# End of string
		if b == 0x00:
			break

		# Check control codes
		if b in table:
			result.append(table[b])
		# Check special characters
		elif b in SPECIAL_CHARS:
			result.append(SPECIAL_CHARS[b])
		# Standard ASCII
		elif 0x20 <= b <= 0x7e:
			result.append(chr(b))
		# Unknown - show as hex
		else:
			result.append(f'[{b:02x}]')

		i += 1

	return ''.join(result)


def find_text_pointers(rom: bytes, table_offset: int, count: int, bank: int = 0) -> list:
	"""Read pointer table and extract text."""
	texts = []

	for i in range(count):
		ptr_offset = table_offset + i * 2
		ptr = struct.unpack('<H', rom[ptr_offset:ptr_offset+2])[0]

		# Convert to file offset (LoROM)
		file_offset = bank * 0x8000 + (ptr & 0x7fff)

		# Read until null terminator (max 1000 bytes)
		end = file_offset
		while end < len(rom) and rom[end] != 0x00 and end - file_offset < 1000:
			end += 1

		text_data = rom[file_offset:end]
		text = decode_text(text_data)

		texts.append({
			'index': i,
			'pointer': ptr,
			'file_offset': file_offset,
			'length': len(text_data),
			'raw': text_data.hex(),
			'text': text,
		})

	return texts


def scan_for_dialogue(rom: bytes, start: int = 0, end: int = None) -> list:
	"""Scan ROM for dialogue strings."""
	if end is None:
		end = len(rom)

	dialogues = []
	i = start

	while i < end - 10:
		# Look for printable text runs
		text_start = i
		text_bytes = []

		while i < end:
			b = rom[i]

			# Printable ASCII or known control codes
			if 0x20 <= b <= 0x7e or b in TEXT_TABLE or b in SPECIAL_CHARS:
				text_bytes.append(b)
				i += 1
			elif b == 0x00:
				# End of string
				break
			else:
				# Unknown byte - might be end or control
				if len(text_bytes) > 5:
					# Check if it's a known control code
					pass
				break

		# Require minimum length and some letters
		if len(text_bytes) >= 10:
			letter_count = sum(1 for b in text_bytes if (0x41 <= b <= 0x5a) or (0x61 <= b <= 0x7a))
			if letter_count >= 5:  # At least 5 letters
				text = decode_text(bytes(text_bytes))
				bank = text_start // 0x8000
				addr = 0x8000 + (text_start % 0x8000)

				dialogues.append({
					'file_offset': text_start,
					'bank': bank,
					'address': addr,
					'cpu_address': f'${bank:02x}:{addr:04x}',
					'length': len(text_bytes),
					'raw': bytes(text_bytes).hex(),
					'text': text,
				})

		i += 1

	return dialogues


def extract_all_text(rom_path: str, output_dir: str) -> dict:
	"""Extract all text from ROM and save to files."""
	with open(rom_path, 'rb') as f:
		rom = f.read()

	output = Path(output_dir)
	output.mkdir(parents=True, exist_ok=True)

	# Scan for dialogue
	print("Scanning for dialogue...")
	dialogues = scan_for_dialogue(rom)
	print(f"  Found {len(dialogues)} text blocks")

	# Save dialogues to JSON
	with open(output / 'dialogues.json', 'w', encoding='utf-8') as f:
		json.dump(dialogues, f, indent='\t', ensure_ascii=False)

	# Save dialogues to text file for easy reading
	with open(output / 'dialogues.txt', 'w', encoding='utf-8') as f:
		f.write("# Soul Blazer (SNES) - Extracted Dialogue\n")
		f.write("# " + "=" * 60 + "\n\n")

		for d in dialogues:
			f.write(f"# {d['cpu_address']} (File: ${d['file_offset']:06x})\n")
			f.write(f"{d['text']}\n\n")

	# Group by bank
	by_bank = {}
	for d in dialogues:
		bank = d['bank']
		if bank not in by_bank:
			by_bank[bank] = []
		by_bank[bank].append(d)

	# Save per-bank files
	for bank, texts in by_bank.items():
		with open(output / f'bank{bank:02x}_text.json', 'w', encoding='utf-8') as f:
			json.dump(texts, f, indent='\t', ensure_ascii=False)

	return {
		'total_texts': len(dialogues),
		'banks_with_text': len(by_bank),
		'output_dir': str(output),
	}


def create_text_table_file(output_path: str) -> None:
	"""Create a .tbl file for use with ROM editors."""
	with open(output_path, 'w', encoding='utf-8') as f:
		f.write("# Soul Blazer Text Table\n")
		f.write("# Format: XX=character\n\n")

		# Standard ASCII
		for i in range(0x20, 0x7f):
			f.write(f"{i:02x}={chr(i)}\n")

		f.write("\n# Control codes\n")
		f.write("00=<END>\n")
		f.write("01=<NL>\n")
		f.write("02=<WAIT>\n")
		f.write("03=<CLEAR>\n")
		f.write("04=<PAUSE>\n")
		f.write("05=<NAME>\n")
		f.write("06=<ITEM>\n")
		f.write("07=<NUM>\n")

		f.write("\n# Special characters\n")
		f.write("80='\n")
		f.write("81=\"\n")
		f.write("82=...\n")
		f.write("83=-\n")
		f.write("84=!\n")
		f.write("85=?\n")


if __name__ == '__main__':
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\assets\text"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	print("=" * 60)
	print("Soul Blazer Text Extractor")
	print("=" * 60)

	# Extract text
	result = extract_all_text(rom_path, output_dir)
	print(f"\nExtracted {result['total_texts']} text blocks")
	print(f"Text found in {result['banks_with_text']} banks")
	print(f"Output saved to: {result['output_dir']}")

	# Create table file
	tbl_path = Path(output_dir) / 'soul_blazer.tbl'
	create_text_table_file(str(tbl_path))
	print(f"Table file saved to: {tbl_path}")
