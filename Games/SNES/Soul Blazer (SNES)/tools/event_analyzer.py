#!/usr/bin/env python3
"""
Soul Blazer (SNES) Event and Progression Analyzer
Analyzes event flags, soul lair data, and game progression logic.
"""

import json
import struct
from dataclasses import dataclass, asdict, field
from pathlib import Path
from typing import Optional


@dataclass
class SoulLair:
	"""Represents a Soul Lair in Soul Blazer."""
	lair_id: int
	area_id: int
	area_name: str
	map_x: int
	map_y: int
	enemy_type: int
	enemy_count: int
	release_type: str
	release_id: int
	release_name: str
	file_offset: int
	raw_bytes: str


@dataclass
class EventFlag:
	"""Represents an event flag."""
	flag_id: int
	byte_offset: int
	bit_mask: int
	description: str
	area: str
	trigger: str


@dataclass
class ProgressionStep:
	"""Represents a progression step in the game."""
	step_id: int
	area: str
	requirement: str
	unlocks: str
	flags_set: list[int] = field(default_factory=list)


# Area definitions
AREAS = {
	0x00: {"name": "Grass Valley Underground", "act": 1},
	0x01: {"name": "Grass Valley Village", "act": 1},
	0x02: {"name": "Underground Castle B1", "act": 1},
	0x03: {"name": "Underground Castle B2", "act": 1},
	0x04: {"name": "Underground Castle B3", "act": 1},
	0x05: {"name": "Underground Castle B4", "act": 1},
	0x06: {"name": "GreenWood", "act": 2},
	0x07: {"name": "GreenWood Underground", "act": 2},
	0x08: {"name": "Water Shrine", "act": 2},
	0x09: {"name": "Fire Shrine", "act": 2},
	0x0A: {"name": "Light Shrine", "act": 2},
	0x0B: {"name": "Lost Marsh", "act": 2},
	0x0C: {"name": "St. Elles Seabed", "act": 3},
	0x0D: {"name": "St. Elles Underground", "act": 3},
	0x0E: {"name": "Durean", "act": 3},
	0x0F: {"name": "Ghost Ship", "act": 3},
	0x10: {"name": "Southerta", "act": 3},
	0x11: {"name": "Mermaid Queen Palace", "act": 3},
	0x12: {"name": "Mountain of Souls", "act": 4},
	0x13: {"name": "Laynole", "act": 4},
	0x14: {"name": "Nome", "act": 4},
	0x15: {"name": "Lune", "act": 4},
	0x16: {"name": "Model Town 1", "act": 5},
	0x17: {"name": "Model Town 2", "act": 5},
	0x18: {"name": "Leo's Lab Basement", "act": 5},
	0x19: {"name": "Leo's Lab Attic", "act": 5},
	0x1A: {"name": "Leo's Paintings", "act": 5},
	0x1B: {"name": "Magridd Castle Town", "act": 6},
	0x1C: {"name": "Magridd Castle", "act": 6},
	0x1D: {"name": "Castle Basement", "act": 6},
	0x1E: {"name": "World of Evil", "act": 6},
	0x1F: {"name": "Deathtoll's Lair", "act": 6},
}

# Release types for Soul Lairs
RELEASE_TYPES = {
	0x00: "NPC",
	0x01: "Item",
	0x02: "Path/Bridge",
	0x03: "Stairs",
	0x04: "Platform",
	0x05: "Door",
	0x06: "Plant/Tree",
	0x07: "Water Source",
	0x08: "Building Part",
	0x09: "Special Object",
	0x0A: "Master's Shrine",
	0x0B: "Teleporter",
	0x0C: "Treasure Chest",
	0xFF: "Nothing/Boss",
}

# Enemy types
ENEMY_TYPES = {
	# Act 1 - Grass Valley
	0x01: "Blue Slime",
	0x02: "Green Slime",
	0x03: "Red Slime",
	0x04: "Skull Head",
	0x05: "Ghost",
	0x06: "Spike Ball",
	0x07: "Metal Scorpion",
	0x08: "Torch",
	0x09: "Dark Soldier",
	0x0A: "Metal Armor",
	0x0B: "Demon Head",
	0x0C: "Fire Demon",

	# Act 2 - GreenWood
	0x10: "Stinger",
	0x11: "Big Worm",
	0x12: "Fire Bug",
	0x13: "Stone Golem",
	0x14: "Mud Slime",
	0x15: "Poison Butterfly",
	0x16: "Dark Elf",
	0x17: "Maneater",
	0x18: "Guardian",
	0x19: "Fire Spirit",
	0x1A: "Ice Spirit",

	# Act 3 - St. Elles
	0x20: "Urchin",
	0x21: "Jellyfish",
	0x22: "Merman",
	0x23: "Fish Monster",
	0x24: "Zombie",
	0x25: "Ghost Pirate",
	0x26: "Phantom",
	0x27: "Bat",

	# Act 4 - Mountain of Souls
	0x30: "Imp",
	0x31: "Demon Eye",
	0x32: "Fire Elemental",
	0x33: "Ice Elemental",
	0x34: "Stone Face",
	0x35: "Demon Knight",

	# Act 5 - Leo's Lab
	0x40: "Toy Soldier",
	0x41: "Toy Tank",
	0x42: "Cat",
	0x43: "Mouse",
	0x44: "Painting Monster",

	# Act 6 - Magridd
	0x50: "Dark Knight",
	0x51: "Demon Wizard",
	0x52: "Shadow",
	0x53: "Dragon",
	0x54: "Demon",
	0x55: "Deathtoll",
}


class EventAnalyzer:
	"""Analyze event flags and progression in Soul Blazer ROM."""

	# Soul Lair structure locations (estimated)
	LAIR_TABLE_START = 0x030000  # Bank $06
	LAIR_ENTRY_SIZE = 8

	# Event flag locations
	EVENT_FLAG_RAM = 0x1000  # In-game RAM location for lair flags

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		with open(rom_path, 'rb') as f:
			self.rom = f.read()
		self.lairs: list[SoulLair] = []
		self.events: list[EventFlag] = []

	def read_byte(self, offset: int) -> int:
		"""Read byte at offset."""
		if offset >= len(self.rom):
			return 0
		return self.rom[offset]

	def read_word(self, offset: int) -> int:
		"""Read 16-bit word at offset."""
		if offset + 2 > len(self.rom):
			return 0
		return struct.unpack('<H', self.rom[offset:offset+2])[0]

	def scan_lair_patterns(self) -> list[dict]:
		"""Scan ROM for Soul Lair data patterns."""
		results = []

		# Soul Lair structure (estimated 8 bytes):
		# Byte 0: Area ID
		# Byte 1: Map X position
		# Byte 2: Map Y position
		# Byte 3: Enemy type
		# Byte 4: Enemy count
		# Byte 5: Release type
		# Byte 6-7: Release ID or pointer

		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			for offset in range(start, end - 64, 8):
				# Check for potential lair entry
				area_id = self.read_byte(offset)
				map_x = self.read_byte(offset + 1)
				map_y = self.read_byte(offset + 2)
				enemy_type = self.read_byte(offset + 3)
				enemy_count = self.read_byte(offset + 4)
				release_type = self.read_byte(offset + 5)
				release_id = self.read_word(offset + 6)

				# Validate lair entry
				if (area_id < 0x20 and  # Valid area
					map_x < 0x40 and map_y < 0x40 and  # Reasonable map position
					enemy_count > 0 and enemy_count < 32 and  # Reasonable enemy count
					release_type in RELEASE_TYPES):  # Valid release type

					area_info = AREAS.get(area_id, {"name": f"Unknown ({area_id})", "act": 0})

					results.append({
						'file_offset': offset,
						'bank': bank,
						'area_id': area_id,
						'area_name': area_info['name'],
						'act': area_info['act'],
						'map_x': map_x,
						'map_y': map_y,
						'enemy_type': enemy_type,
						'enemy_name': ENEMY_TYPES.get(enemy_type, f"Unknown ({enemy_type:02x})"),
						'enemy_count': enemy_count,
						'release_type': release_type,
						'release_type_name': RELEASE_TYPES.get(release_type, "Unknown"),
						'release_id': release_id,
						'raw_bytes': self.rom[offset:offset+8].hex(),
					})

		return results

	def scan_flag_checks(self) -> list[dict]:
		"""Scan disassembly for event flag check patterns."""
		results = []

		# Look for patterns that check event flags
		# Common pattern: LDA $1000,X / AND #$xx / BEQ/BNE

		for offset in range(len(self.rom) - 6):
			# Check for LDA absolute indexed
			if self.rom[offset] == 0xBD:  # LDA abs,X
				addr = self.read_word(offset + 1)
				if 0x1000 <= addr < 0x1100:  # Event flag range
					# Check for AND instruction following
					if offset + 3 < len(self.rom) and self.rom[offset + 3] == 0x29:  # AND immediate
						mask = self.read_byte(offset + 4)
						bank = offset // 0x8000
						cpu_addr = 0x8000 + (offset % 0x8000)

						results.append({
							'file_offset': offset,
							'cpu_address': f'${bank:02x}:{cpu_addr:04x}',
							'flag_address': addr,
							'flag_byte': addr - 0x1000,
							'flag_mask': mask,
							'flag_bits': [i for i in range(8) if mask & (1 << i)],
						})

		return results

	def generate_progression_guide(self) -> list[dict]:
		"""Generate game progression guide based on analysis."""
		# This is a curated list based on game knowledge
		progression = [
			# Act 1 - Grass Valley
			{
				"act": 1,
				"area": "Grass Valley",
				"steps": [
					"Clear Underground Castle B1 - Release Old Woman",
					"Clear Underground Castle B2 - Release Tool Shop Owner",
					"Get Dream Rod from Tool Shop",
					"Clear Underground Castle B3 - Release Bridge Guard",
					"Cross bridge to B4",
					"Defeat Metal Mantis boss",
					"Release remaining villagers",
					"Speak to Dr. Leo (via dream)",
					"Receive Sword of Life",
				]
			},
			# Act 2 - GreenWood
			{
				"act": 2,
				"area": "GreenWood",
				"steps": [
					"Enter GreenWood through western path",
					"Clear Fire Shrine - Release deer",
					"Clear Water Shrine - Release bird",
					"Clear Light Shrine - Release mole",
					"Enter Lost Marsh",
					"Defeat Plantentacle boss",
					"Release Great Tree",
					"Speak to Turbo for key item",
				]
			},
			# Act 3 - St. Elles
			{
				"act": 3,
				"area": "St. Elles",
				"steps": [
					"Dive into seabed",
					"Clear Durean - Release dolphins",
					"Board Ghost Ship",
					"Defeat Ghost Ship boss",
					"Enter Southerta",
					"Visit Mermaid Queen",
					"Defeat Poseidon boss",
					"Receive Bubble Armor",
				]
			},
			# Act 4 - Mountain of Souls
			{
				"act": 4,
				"area": "Mountain of Souls",
				"steps": [
					"Enter mountain via Nome",
					"Clear Laynole - Release mushrooms",
					"Enter Lune area",
					"Defeat Stone Guardian boss",
					"Release grandparents",
					"Receive Phoenix magic",
				]
			},
			# Act 5 - Leo's Lab
			{
				"act": 5,
				"area": "Leo's Lab",
				"steps": [
					"Enter model town",
					"Shrink to toy size",
					"Clear Model Town areas",
					"Enter Leo's Laboratory",
					"Explore paintings (4 total)",
					"Defeat Tin Doll boss",
					"Rescue Marie",
				]
			},
			# Act 6 - Magridd Castle
			{
				"act": 6,
				"area": "Magridd Castle",
				"steps": [
					"Enter Castle Town",
					"Get audience with King Magridd",
					"Enter castle dungeon",
					"Clear basement areas",
					"Defeat Castle bosses",
					"Enter World of Evil",
					"Defeat Deathtoll (final boss)",
					"Watch ending",
				]
			},
		]

		return progression

	def analyze_boss_flags(self) -> list[dict]:
		"""Identify boss defeat flags."""
		bosses = [
			{"id": 0x01, "name": "Metal Mantis", "area": "Underground Castle", "act": 1},
			{"id": 0x02, "name": "Plantentacle", "area": "Lost Marsh", "act": 2},
			{"id": 0x03, "name": "Ghost Ship Captain", "area": "Ghost Ship", "act": 3},
			{"id": 0x04, "name": "Poseidon", "area": "Southerta", "act": 3},
			{"id": 0x05, "name": "Stone Guardian", "area": "Mountain of Souls", "act": 4},
			{"id": 0x06, "name": "Tin Doll", "area": "Leo's Lab", "act": 5},
			{"id": 0x07, "name": "Demon Bird", "area": "Magridd Castle", "act": 6},
			{"id": 0x08, "name": "Deathtoll", "area": "World of Evil", "act": 6},
		]

		return bosses

	def export_analysis(self, output_dir: str) -> dict:
		"""Export all analysis data."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		results = {}

		# Scan for lair patterns
		print("Scanning for Soul Lair patterns...")
		lairs = self.scan_lair_patterns()
		print(f"  Found {len(lairs)} potential lair entries")

		# Filter to most likely candidates (group by area)
		by_area = {}
		for lair in lairs:
			area = lair['area_id']
			if area not in by_area:
				by_area[area] = []
			by_area[area].append(lair)

		results['lair_patterns'] = lairs
		results['lairs_by_area'] = {AREAS.get(k, {"name": f"Unknown"})['name']: len(v) for k, v in by_area.items()}

		with open(output / 'lair_patterns.json', 'w', encoding='utf-8') as f:
			json.dump(lairs[:1000], f, indent='\t')  # Limit to first 1000

		# Scan for flag checks
		print("Scanning for event flag checks...")
		flags = self.scan_flag_checks()
		print(f"  Found {len(flags)} flag check patterns")

		results['flag_checks'] = flags

		with open(output / 'flag_checks.json', 'w', encoding='utf-8') as f:
			json.dump(flags, f, indent='\t')

		# Generate progression guide
		print("Generating progression guide...")
		progression = self.generate_progression_guide()

		with open(output / 'progression_guide.json', 'w', encoding='utf-8') as f:
			json.dump(progression, f, indent='\t')

		# Generate progression guide text
		with open(output / 'progression_guide.txt', 'w', encoding='utf-8') as f:
			f.write("=" * 60 + "\n")
			f.write("  SOUL BLAZER - PROGRESSION GUIDE\n")
			f.write("=" * 60 + "\n\n")

			for act in progression:
				f.write(f"\n{'='*60}\n")
				f.write(f"  ACT {act['act']} - {act['area'].upper()}\n")
				f.write(f"{'='*60}\n\n")

				for i, step in enumerate(act['steps'], 1):
					f.write(f"  {i}. {step}\n")

				f.write("\n")

		# Boss data
		bosses = self.analyze_boss_flags()
		results['bosses'] = bosses

		with open(output / 'boss_data.json', 'w', encoding='utf-8') as f:
			json.dump(bosses, f, indent='\t')

		# Summary
		summary = {
			'total_lair_patterns': len(lairs),
			'lairs_by_area': results['lairs_by_area'],
			'flag_check_count': len(flags),
			'boss_count': len(bosses),
			'areas': {k: v['name'] for k, v in AREAS.items()},
			'enemy_types': ENEMY_TYPES,
			'release_types': RELEASE_TYPES,
		}

		results['summary'] = summary

		with open(output / 'event_summary.json', 'w', encoding='utf-8') as f:
			json.dump(summary, f, indent='\t')

		return results


def main():
	"""Main entry point."""
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\assets\events"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	print("=" * 60)
	print("Soul Blazer Event and Progression Analyzer")
	print("=" * 60)
	print(f"ROM: {rom_path}")
	print(f"Output: {output_dir}")
	print()

	analyzer = EventAnalyzer(rom_path)
	results = analyzer.export_analysis(output_dir)

	print()
	print("Analysis complete!")
	print(f"  Lair patterns: {results['summary']['total_lair_patterns']}")
	print(f"  Flag checks: {results['summary']['flag_check_count']}")
	print(f"  Bosses documented: {results['summary']['boss_count']}")


if __name__ == '__main__':
	main()
