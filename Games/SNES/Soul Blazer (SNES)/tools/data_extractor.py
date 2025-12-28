#!/usr/bin/env python3
"""
Soul Blazer (SNES) Enemy and Item Data Extractor
Extracts game data tables for enemies, items, and Soul Lairs.
"""

import json
import struct
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import Optional


@dataclass
class EnemyData:
	"""Enemy data structure."""
	id: int
	name: str
	hp: int
	attack: int
	defense: int
	exp: int
	gold: int
	drop_item: int
	ai_type: int
	sprite_id: int


@dataclass
class ItemData:
	"""Item data structure."""
	id: int
	name: str
	item_type: int  # weapon, armor, accessory, consumable
	effect: int
	power: int
	price: int
	equip_flags: int


@dataclass
class SoulLairData:
	"""Soul Lair data structure."""
	id: int
	area: int
	enemy_type: int
	enemy_count: int
	release_type: int  # NPC, item, path, etc
	release_id: int


class GameDataExtractor:
	"""Extract game data tables from Soul Blazer ROM."""

	# Known enemy names from game
	ENEMY_NAMES = [
		"Golem",
		"Blue Metal",
		"Armored Knight",
		"Torch",
		"Stone Statue",
		"Spike Ball",
		"Blue Slime",
		"Red Slime",
		"Metally",
		"Bat",
		"Skeleton",
		"Ghost",
		"Demon",
		"Fire Spirit",
		"Ice Spirit",
		"Mummy",
		"Fish",
		"Jellyfish",
		"Sea Dragon",
		"Crab",
		"Seahorse",
		"Squid",
		"Eagle",
		"Condor",
		"Mountain Spirit",
		"Ice Golem",
		"Toy Soldier",
		"Toy Car",
		"Doll",
		"Mouse",
		"Scorpion",
		"Spider",
	]

	# Known item names
	ITEM_NAMES = [
		# Swords
		"Sword of Life",
		"Psycho Sword",
		"Critical Sword",
		"Lucky Blade",
		"Zantetsu Sword",
		"Spirit Sword",
		"Recovery Sword",
		"Soul Blade",
		# Armor
		"Iron Armor",
		"Ice Armor",
		"Bubble Armor",
		"Magic Armor",
		"Mystic Armor",
		"Light Armor",
		"Elemental Armor",
		"Soul Armor",
		# Items
		"Medical Herb",
		"Strange Bottle",
		"Rotation Gem",
		"Flame Ball Gem",
		"Light Arrow Gem",
		"Magic Flare Gem",
		"Spark Bomb",
		"Flame Pillar",
		"Tornado",
		"Phoenix",
	]

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		with open(rom_path, 'rb') as f:
			self.rom = f.read()
		self.enemies = []
		self.items = []
		self.soul_lairs = []

	def read_byte(self, offset: int) -> int:
		"""Read single byte."""
		return self.rom[offset] if offset < len(self.rom) else 0

	def read_word(self, offset: int) -> int:
		"""Read 16-bit word."""
		if offset + 1 < len(self.rom):
			return struct.unpack('<H', self.rom[offset:offset+2])[0]
		return 0

	def scan_for_data_tables(self) -> list[dict]:
		"""Scan for potential data tables."""
		tables = []

		# Look for patterns typical of enemy/item data tables
		# These typically have: consistent structure size, sequential IDs

		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			# Check for data table patterns
			for struct_size in [8, 10, 12, 16]:  # Common structure sizes
				for offset in range(start, end - struct_size * 32, struct_size):
					# Check if this could be a sequential data table
					valid_entries = 0

					for entry in range(32):
						entry_offset = offset + entry * struct_size

						# Check for reasonable values
						vals = [self.read_byte(entry_offset + i) for i in range(struct_size)]

						# Heuristics for enemy data:
						# - HP typically 1-255
						# - ATK/DEF typically 1-100
						# - Values shouldn't all be 0 or FF

						non_zero = sum(1 for v in vals if 0 < v < 0xff)
						if 2 < non_zero < struct_size - 1:
							valid_entries += 1

					if valid_entries >= 20:  # At least 20 valid entries
						tables.append({
							'bank': bank,
							'offset': offset,
							'struct_size': struct_size,
							'valid_entries': valid_entries,
						})

		return tables

	def extract_enemy_table(self, offset: int, count: int = 32) -> list[EnemyData]:
		"""Extract enemy data from offset."""
		enemies = []

		# Assumed structure (8 bytes):
		# [HP:2] [ATK:1] [DEF:1] [EXP:2] [GOLD:1] [FLAGS:1]
		struct_size = 8

		for i in range(count):
			entry_offset = offset + i * struct_size

			hp = self.read_word(entry_offset)
			attack = self.read_byte(entry_offset + 2)
			defense = self.read_byte(entry_offset + 3)
			exp = self.read_word(entry_offset + 4)
			gold = self.read_byte(entry_offset + 6)
			flags = self.read_byte(entry_offset + 7)

			# Skip if all zeros
			if hp == 0 and attack == 0:
				continue

			name = self.ENEMY_NAMES[i] if i < len(self.ENEMY_NAMES) else f"Enemy_{i:02d}"

			enemies.append(EnemyData(
				id=i,
				name=name,
				hp=hp,
				attack=attack,
				defense=defense,
				exp=exp,
				gold=gold,
				drop_item=0,
				ai_type=flags,
				sprite_id=i,
			))

		return enemies

	def extract_item_table(self, offset: int, count: int = 32) -> list[ItemData]:
		"""Extract item data from offset."""
		items = []

		# Assumed structure (6 bytes):
		# [TYPE:1] [EFFECT:1] [POWER:2] [PRICE:2]
		struct_size = 6

		for i in range(count):
			entry_offset = offset + i * struct_size

			item_type = self.read_byte(entry_offset)
			effect = self.read_byte(entry_offset + 1)
			power = self.read_word(entry_offset + 2)
			price = self.read_word(entry_offset + 4)

			# Skip empty entries
			if item_type == 0 and power == 0:
				continue

			name = self.ITEM_NAMES[i] if i < len(self.ITEM_NAMES) else f"Item_{i:02d}"

			items.append(ItemData(
				id=i,
				name=name,
				item_type=item_type,
				effect=effect,
				power=power,
				price=price,
				equip_flags=0,
			))

		return items

	def scan_for_soul_lairs(self) -> list[dict]:
		"""Scan for Soul Lair data."""
		lairs = []

		# Soul Lairs have: area ID, position, enemy type, count, release

		for bank in range(32):
			start = bank * 0x8000
			end = start + 0x8000

			# Look for lair-like data
			for offset in range(start, end - 8):
				# Lair pattern: small area ID, small counts, valid enemy ID
				area = self.read_byte(offset)
				enemy_type = self.read_byte(offset + 1)
				count = self.read_byte(offset + 2)
				release_type = self.read_byte(offset + 3)

				# Validate
				if (0 < area < 50 and
					0 < enemy_type < 64 and
					0 < count < 20 and
					release_type < 10):
					lairs.append({
						'offset': offset,
						'bank': bank,
						'area': area,
						'enemy_type': enemy_type,
						'count': count,
						'release_type': release_type,
					})

		return lairs

	def extract_all(self, output_dir: str):
		"""Extract all game data."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)

		print("Scanning for data tables...")
		tables = self.scan_for_data_tables()
		print(f"Found {len(tables)} potential data tables")

		# Save table scan results
		with open(output / 'data_table_scan.json', 'w') as f:
			json.dump(tables[:100], f, indent='\t')

		# Try to extract enemy data from likely locations
		# Bank $03-$04 often contains enemy data in Quintet games
		print("\nExtracting enemy data...")

		best_enemy_tables = sorted(
			[t for t in tables if t['struct_size'] == 8],
			key=lambda t: t['valid_entries'],
			reverse=True
		)[:5]

		for i, table in enumerate(best_enemy_tables):
			enemies = self.extract_enemy_table(table['offset'], 32)
			if enemies:
				filename = f'enemies_candidate_{i}.json'
				with open(output / filename, 'w') as f:
					json.dump([asdict(e) for e in enemies], f, indent='\t')
				print(f"  Saved {len(enemies)} enemies to {filename}")

		# Scan for Soul Lair data
		print("\nScanning for Soul Lair data...")
		lairs = self.scan_for_soul_lairs()
		print(f"Found {len(lairs)} potential Soul Lair entries")

		with open(output / 'soul_lairs_scan.json', 'w') as f:
			json.dump(lairs[:200], f, indent='\t')

		# Create summary
		summary = {
			'rom_size': len(self.rom),
			'data_tables_found': len(tables),
			'soul_lairs_found': len(lairs),
			'enemy_names': self.ENEMY_NAMES,
			'item_names': self.ITEM_NAMES,
		}

		with open(output / 'data_extraction_summary.json', 'w') as f:
			json.dump(summary, f, indent='\t')

		print(f"\nData extracted to: {output}")


def main():
	import sys

	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	output_dir = r"c:\Users\me\source\repos\GameInfo\Games\SNES\Soul Blazer (SNES)\assets\data"

	if len(sys.argv) > 1:
		rom_path = sys.argv[1]
	if len(sys.argv) > 2:
		output_dir = sys.argv[2]

	extractor = GameDataExtractor(rom_path)
	extractor.extract_all(output_dir)


if __name__ == '__main__':
	main()
