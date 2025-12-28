#!/usr/bin/env python3
"""
Soul Blazer (SNES) NPC and Dialogue Analyzer
Identifies NPCs, their locations, and associated dialogue.
"""

import json
import struct
from dataclasses import dataclass, asdict
from pathlib import Path
from typing import Optional


@dataclass
class NPC:
	"""Represents an NPC in Soul Blazer."""
	npc_id: int
	name: str
	area_id: int
	area_name: str
	x_pos: int
	y_pos: int
	sprite_id: int
	dialogue_ptr: int
	dialogue_text: str
	release_condition: str
	file_offset: int


@dataclass
class DialogueEntry:
	"""Represents a dialogue entry."""
	index: int
	pointer: int
	file_offset: int
	cpu_address: str
	speaker: str
	context: str
	raw_bytes: str
	text: str


# Soul Blazer text encoding
TEXT_TABLE = {
	0x00: '{END}',
	0x01: '{NL}',
	0x02: '{WAIT}',
	0x03: '{CLEAR}',
	0x04: '{PAUSE}',
	0x05: '{NAME}',
	0x06: '{ITEM}',
	0x07: '{NUM}',
}

SPECIAL_CHARS = {
	0x80: "'",
	0x81: '"',
	0x82: '...',
	0x83: '-',
	0x84: '!',
	0x85: '?',
}

# Area names
AREA_NAMES = {
	0x00: "Grass Valley Underground",
	0x01: "Grass Valley Village",
	0x02: "Underground Castle B1",
	0x03: "Underground Castle B2",
	0x04: "Underground Castle B3",
	0x05: "Underground Castle B4",
	0x06: "GreenWood",
	0x07: "GreenWood Underground",
	0x08: "Water Shrine",
	0x09: "Fire Shrine",
	0x0A: "Light Shrine",
	0x0B: "Lost Marsh",
	0x0C: "St. Elles Seabed",
	0x0D: "St. Elles Underground",
	0x0E: "Durean",
	0x0F: "Ghost Ship",
	0x10: "Southerta",
	0x11: "Mermaid Queen Palace",
	0x12: "Mountain of Souls",
	0x13: "Laynole",
	0x14: "Nome",
	0x15: "Lune",
	0x16: "Model Town 1",
	0x17: "Model Town 2",
	0x18: "Leo's Lab Basement",
	0x19: "Leo's Lab Attic",
	0x1A: "Leo's Paintings",
	0x1B: "Magridd Castle Town",
	0x1C: "Magridd Castle",
	0x1D: "Castle Basement",
	0x1E: "World of Evil",
	0x1F: "Deathtoll's Lair",
}

# Known NPC names from the game
NPC_NAMES = {
	# Grass Valley NPCs (released from Soul Lairs)
	0x01: "Old Woman",
	0x02: "Old Man",
	0x03: "Boy",
	0x04: "Girl",
	0x05: "Dog",
	0x06: "Cat",
	0x07: "Goat",
	0x08: "Squirrel",
	0x09: "Bridge Guard",
	0x0A: "Tool Shop Owner",
	0x0B: "Tulip",
	0x0C: "Ivy",
	0x0D: "Emblem Tile A",

	# GreenWood NPCs
	0x10: "Deer",
	0x11: "Squirrel",
	0x12: "Bird",
	0x13: "Mole",
	0x14: "Crocodile",
	0x15: "Great Tree",
	0x16: "Turbo",

	# St. Elles NPCs
	0x20: "Mermaid",
	0x21: "Dolphin",
	0x22: "Angelfish",
	0x23: "Mermaid Queen",
	0x24: "Lue",

	# Mountain of Souls NPCs
	0x30: "Mushroom",
	0x31: "Nome",
	0x32: "Grandpa",
	0x33: "Grandma",

	# Leo's Lab NPCs
	0x40: "Mouse",
	0x41: "Doll",
	0x42: "Cat",
	0x43: "Model Soldier",
	0x44: "Model Tank",
	0x45: "Toy Airplane",
	0x46: "Marie",

	# Magridd Castle NPCs
	0x50: "Soldier",
	0x51: "Maid",
	0x52: "King Magridd",
	0x53: "Queen Magridd",
	0x54: "Dr. Leo",
	0x55: "Lisa",

	# Special NPCs
	0x60: "Master",
	0x61: "Soul of Magridd",
	0x62: "Gem Fairy",
}


class NPCAnalyzer:
	"""Analyze NPC data and dialogue in Soul Blazer ROM."""

	# Potential NPC table locations (bank, address)
	# These are estimates - need to be verified with actual ROM analysis
	NPC_TABLE_CANDIDATES = [
		(0x05, 0x8000),  # Bank 05
		(0x06, 0x8000),  # Bank 06
		(0x09, 0x8000),  # Bank 09
	]

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		with open(rom_path, 'rb') as f:
			self.rom = f.read()
		self.npcs: list[NPC] = []
		self.dialogues: list[DialogueEntry] = []

	def lorom_to_file(self, bank: int, addr: int) -> int:
		"""Convert LoROM bank:address to file offset."""
		return bank * 0x8000 + (addr - 0x8000)

	def file_to_lorom(self, offset: int) -> tuple[int, int]:
		"""Convert file offset to LoROM bank:address."""
		bank = offset // 0x8000
		addr = 0x8000 + (offset % 0x8000)
		return bank, addr

	def read_word(self, offset: int) -> int:
		"""Read 16-bit word at offset."""
		if offset + 2 > len(self.rom):
			return 0
		return struct.unpack('<H', self.rom[offset:offset+2])[0]

	def read_byte(self, offset: int) -> int:
		"""Read byte at offset."""
		if offset >= len(self.rom):
			return 0
		return self.rom[offset]

	def decode_text(self, data: bytes) -> str:
		"""Decode Soul Blazer text to string."""
		result = []

		for b in data:
			if b == 0x00:
				break
			elif b in TEXT_TABLE:
				result.append(TEXT_TABLE[b])
			elif b in SPECIAL_CHARS:
				result.append(SPECIAL_CHARS[b])
			elif 0x20 <= b <= 0x7e:
				result.append(chr(b))
			else:
				result.append(f'[{b:02x}]')

		return ''.join(result)

	def read_text_at(self, offset: int, max_len: int = 500) -> tuple[bytes, str]:
		"""Read text string at offset."""
		end = offset
		while end < len(self.rom) and self.rom[end] != 0x00 and end - offset < max_len:
			end += 1

		raw = self.rom[offset:end]
		text = self.decode_text(raw)
		return raw, text

	def scan_npc_patterns(self) -> list[dict]:
		"""Scan ROM for NPC data patterns."""
		results = []

		# NPC data typically has:
		# - Position bytes (X, Y)
		# - Sprite ID
		# - Behavior ID
		# - Dialogue pointer

		# Scan for repeating patterns that look like NPC definitions
		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			for offset in range(start, end - 16, 8):
				# Check if this looks like an NPC entry
				# Typical pattern: X, Y, SpriteID, BehaviorID, DialoguePtr(2), Flags(2)

				x = self.read_byte(offset)
				y = self.read_byte(offset + 1)
				sprite = self.read_byte(offset + 2)
				behavior = self.read_byte(offset + 3)
				dialogue_ptr = self.read_word(offset + 4)

				# Validate potential NPC entry
				if (0 < x < 256 and 0 < y < 240 and
					sprite < 128 and behavior < 64 and
					0x8000 <= dialogue_ptr < 0x10000):

					# Check if dialogue pointer resolves to text
					ptr_offset = bank * 0x8000 + (dialogue_ptr - 0x8000)
					if 0 <= ptr_offset < len(self.rom):
						first_byte = self.read_byte(ptr_offset)
						# Text should start with printable ASCII or control code
						if 0x20 <= first_byte <= 0x7e or first_byte in TEXT_TABLE:
							raw, text = self.read_text_at(ptr_offset, 100)
							if len(text) >= 5 and any(c.isalpha() for c in text[:20]):
								results.append({
									'file_offset': offset,
									'bank': bank,
									'x': x,
									'y': y,
									'sprite_id': sprite,
									'behavior_id': behavior,
									'dialogue_ptr': dialogue_ptr,
									'dialogue_offset': ptr_offset,
									'dialogue_preview': text[:50],
								})

		return results

	def scan_dialogue_tables(self) -> list[dict]:
		"""Scan for dialogue pointer tables."""
		results = []

		# Look for tables of pointers to text strings
		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			for offset in range(start, end - 32, 2):
				# Check for sequence of valid text pointers
				valid_ptrs = 0
				texts = []

				for i in range(8):
					ptr = self.read_word(offset + i * 2)
					if 0x8000 <= ptr < 0x10000:
						ptr_offset = bank * 0x8000 + (ptr - 0x8000)
						if 0 <= ptr_offset < len(self.rom):
							first_byte = self.read_byte(ptr_offset)
							if 0x20 <= first_byte <= 0x7e or first_byte in TEXT_TABLE:
								raw, text = self.read_text_at(ptr_offset, 100)
								if len(text) >= 3:
									valid_ptrs += 1
									texts.append({
										'ptr_index': i,
										'pointer': ptr,
										'offset': ptr_offset,
										'text': text[:40],
									})

				if valid_ptrs >= 6:  # At least 6 of 8 are valid
					b, a = self.file_to_lorom(offset)
					results.append({
						'file_offset': offset,
						'cpu_address': f'${b:02x}:{a:04x}',
						'valid_count': valid_ptrs,
						'texts': texts,
					})

		return results

	def analyze_known_areas(self) -> dict:
		"""Analyze NPCs and dialogue by known game area."""
		area_data = {}

		for area_id, area_name in AREA_NAMES.items():
			area_data[area_name] = {
				'area_id': area_id,
				'npcs': [],
				'dialogue_count': 0,
			}

		return area_data

	def generate_script_dump(self, output_path: str) -> None:
		"""Generate a readable script dump of all dialogue."""
		dialogues = []

		# Scan all banks for text
		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			i = start
			while i < end - 10:
				# Look for text strings
				text_bytes = []
				text_start = i

				while i < end:
					b = self.rom[i]
					if b == 0x00:
						break
					elif 0x20 <= b <= 0x7e or b in TEXT_TABLE or b in SPECIAL_CHARS:
						text_bytes.append(b)
						i += 1
					else:
						break

				if len(text_bytes) >= 15:
					text = self.decode_text(bytes(text_bytes))
					letter_count = sum(1 for c in text if c.isalpha())

					if letter_count >= 8:
						b, a = self.file_to_lorom(text_start)
						dialogues.append({
							'file_offset': text_start,
							'cpu_address': f'${b:02x}:{a:04x}',
							'bank': bank,
							'length': len(text_bytes),
							'text': text,
						})

				i += 1

		# Group by bank
		by_bank = {}
		for d in dialogues:
			bank = d['bank']
			if bank not in by_bank:
				by_bank[bank] = []
			by_bank[bank].append(d)

		# Write script dump
		with open(output_path, 'w', encoding='utf-8') as f:
			f.write("=" * 70 + "\n")
			f.write("  SOUL BLAZER (SNES) - COMPLETE SCRIPT DUMP\n")
			f.write("=" * 70 + "\n\n")
			f.write(f"Total dialogue blocks: {len(dialogues)}\n")
			f.write(f"Banks with dialogue: {len(by_bank)}\n\n")

			for bank in sorted(by_bank.keys()):
				texts = by_bank[bank]
				f.write("-" * 70 + "\n")
				f.write(f"  BANK ${bank:02X} ({len(texts)} entries)\n")
				f.write("-" * 70 + "\n\n")

				for entry in texts:
					f.write(f"[{entry['cpu_address']}]\n")
					# Format text with line wrapping
					text = entry['text']
					text = text.replace('{NL}', '\n  ')
					text = text.replace('{WAIT}', '\n  [WAIT]\n  ')
					text = text.replace('{CLEAR}', '\n  [CLEAR]\n  ')
					text = text.replace('{END}', '')
					f.write(f"  {text}\n\n")

		print(f"Script dump saved to: {output_path}")
		return len(dialogues)

	def export_analysis(self, output_dir: str) -> dict:
		"""Export all analysis data."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		results = {
			'npc_patterns': [],
			'dialogue_tables': [],
			'script_entries': 0,
		}

		print("Scanning for NPC patterns...")
		npc_patterns = self.scan_npc_patterns()
		print(f"  Found {len(npc_patterns)} potential NPC entries")
		results['npc_patterns'] = npc_patterns

		with open(output / 'npc_patterns.json', 'w', encoding='utf-8') as f:
			json.dump(npc_patterns, f, indent='\t')

		print("Scanning for dialogue tables...")
		dialogue_tables = self.scan_dialogue_tables()
		print(f"  Found {len(dialogue_tables)} dialogue pointer tables")
		results['dialogue_tables'] = dialogue_tables

		with open(output / 'dialogue_tables.json', 'w', encoding='utf-8') as f:
			json.dump(dialogue_tables, f, indent='\t')

		print("Generating script dump...")
		script_count = self.generate_script_dump(str(output / 'complete_script.txt'))
		results['script_entries'] = script_count

		# Create summary
		summary = {
			'npc_pattern_count': len(npc_patterns),
			'dialogue_table_count': len(dialogue_tables),
			'script_entry_count': script_count,
			'areas': list(AREA_NAMES.values()),
			'known_npcs': {k: v for k, v in NPC_NAMES.items()},
		}

		with open(output / 'analysis_summary.json', 'w', encoding='utf-8') as f:
			json.dump(summary, f, indent='\t')

		return results


def main():
	"""Main entry point."""
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\assets\npc"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	print("=" * 60)
	print("Soul Blazer NPC and Dialogue Analyzer")
	print("=" * 60)
	print(f"ROM: {rom_path}")
	print(f"Output: {output_dir}")
	print()

	analyzer = NPCAnalyzer(rom_path)
	results = analyzer.export_analysis(output_dir)

	print()
	print("Analysis complete!")
	print(f"  NPC patterns found: {results['npc_patterns'][:5] if results['npc_patterns'] else 'None'}...")
	print(f"  Dialogue tables: {len(results['dialogue_tables'])}")
	print(f"  Script entries: {results['script_entries']}")


if __name__ == '__main__':
	main()
