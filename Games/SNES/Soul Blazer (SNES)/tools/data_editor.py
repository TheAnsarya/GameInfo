#!/usr/bin/env python3
"""
Soul Blazer (SNES) Data Editor
Edit game data (enemies, items, etc.) via JSON.
"""

import json
import struct
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import Optional, Any


@dataclass
class Enemy:
	"""Enemy data structure."""
	id: int
	name: str
	hp: int
	attack: int
	defense: int
	exp: int
	gems: int
	soul_type: int
	sprite_id: int
	behavior: int

	def to_dict(self) -> dict:
		return asdict(self)

	@classmethod
	def from_dict(cls, data: dict) -> 'Enemy':
		return cls(**data)


@dataclass
class Item:
	"""Item data structure."""
	id: int
	name: str
	type: int
	power: int
	price: int
	description_ptr: int

	def to_dict(self) -> dict:
		return asdict(self)

	@classmethod
	def from_dict(cls, data: dict) -> 'Item':
		return cls(**data)


@dataclass
class SoulLair:
	"""Soul lair (monster spawn point) data."""
	id: int
	x: int
	y: int
	enemy_type: int
	enemy_count: int
	soul_count: int
	release_type: int  # What gets released when cleared
	release_id: int    # ID of released NPC/object

	def to_dict(self) -> dict:
		return asdict(self)

	@classmethod
	def from_dict(cls, data: dict) -> 'SoulLair':
		return cls(**data)


class SoulBlazerEditor:
	"""Editor for Soul Blazer game data."""

	# Known data offsets (to be discovered through analysis)
	ENEMY_TABLE_OFFSET = 0x030000  # Estimated, needs verification
	ITEM_TABLE_OFFSET = 0x038000   # Estimated, needs verification
	ENEMY_ENTRY_SIZE = 16          # Estimated
	ITEM_ENTRY_SIZE = 8            # Estimated

	def __init__(self, rom_path: str):
		self.rom_path = rom_path
		with open(rom_path, 'rb') as f:
			self.rom_data = bytearray(f.read())
		self.modified = False

	def read_byte(self, offset: int) -> int:
		"""Read a single byte."""
		return self.rom_data[offset]

	def read_word(self, offset: int) -> int:
		"""Read a 16-bit word (little-endian)."""
		return struct.unpack('<H', self.rom_data[offset:offset+2])[0]

	def read_long(self, offset: int) -> int:
		"""Read a 24-bit value (little-endian)."""
		return struct.unpack('<I', self.rom_data[offset:offset+3] + b'\x00')[0]

	def write_byte(self, offset: int, value: int):
		"""Write a single byte."""
		self.rom_data[offset] = value & 0xff
		self.modified = True

	def write_word(self, offset: int, value: int):
		"""Write a 16-bit word (little-endian)."""
		self.rom_data[offset:offset+2] = struct.pack('<H', value & 0xffff)
		self.modified = True

	def lorom_to_file(self, bank: int, addr: int) -> int:
		"""Convert LoROM CPU address to file offset."""
		if bank >= 0x80:
			bank -= 0x80
		return bank * 0x8000 + (addr & 0x7fff)

	def file_to_lorom(self, offset: int) -> tuple[int, int]:
		"""Convert file offset to LoROM bank:address."""
		bank = offset // 0x8000
		addr = 0x8000 + (offset % 0x8000)
		return bank, addr

	def read_text(self, offset: int, max_length: int = 256) -> str:
		"""Read null-terminated text."""
		text = []
		for i in range(max_length):
			b = self.rom_data[offset + i]
			if b == 0x00:
				break
			elif 0x20 <= b <= 0x7e:
				text.append(chr(b))
			else:
				text.append(f'[{b:02x}]')
		return ''.join(text)

	def get_enemy(self, enemy_id: int) -> Optional[Enemy]:
		"""Read enemy data by ID."""
		# This is placeholder - actual offsets need to be discovered
		offset = self.ENEMY_TABLE_OFFSET + enemy_id * self.ENEMY_ENTRY_SIZE

		if offset + self.ENEMY_ENTRY_SIZE > len(self.rom_data):
			return None

		return Enemy(
			id=enemy_id,
			name=f"Enemy_{enemy_id:02x}",  # Would need name table lookup
			hp=self.read_word(offset),
			attack=self.read_byte(offset + 2),
			defense=self.read_byte(offset + 3),
			exp=self.read_word(offset + 4),
			gems=self.read_byte(offset + 6),
			soul_type=self.read_byte(offset + 7),
			sprite_id=self.read_byte(offset + 8),
			behavior=self.read_byte(offset + 9),
		)

	def set_enemy(self, enemy: Enemy):
		"""Write enemy data."""
		offset = self.ENEMY_TABLE_OFFSET + enemy.id * self.ENEMY_ENTRY_SIZE

		self.write_word(offset, enemy.hp)
		self.write_byte(offset + 2, enemy.attack)
		self.write_byte(offset + 3, enemy.defense)
		self.write_word(offset + 4, enemy.exp)
		self.write_byte(offset + 6, enemy.gems)
		self.write_byte(offset + 7, enemy.soul_type)
		self.write_byte(offset + 8, enemy.sprite_id)
		self.write_byte(offset + 9, enemy.behavior)

	def export_enemies_json(self, output_path: str, count: int = 100):
		"""Export all enemies to JSON."""
		enemies = []
		for i in range(count):
			enemy = self.get_enemy(i)
			if enemy:
				enemies.append(enemy.to_dict())

		with open(output_path, 'w', encoding='utf-8') as f:
			json.dump(enemies, f, indent='\t')

	def import_enemies_json(self, input_path: str):
		"""Import enemies from JSON."""
		with open(input_path, 'r', encoding='utf-8') as f:
			enemies_data = json.load(f)

		for data in enemies_data:
			enemy = Enemy.from_dict(data)
			self.set_enemy(enemy)

	def save(self, output_path: Optional[str] = None):
		"""Save modified ROM."""
		path = output_path or self.rom_path
		with open(path, 'wb') as f:
			f.write(self.rom_data)
		self.modified = False

	def update_checksum(self):
		"""Recalculate and update ROM checksum."""
		# SNES checksum is at $7fdc-$7fdf (LoROM)
		# Checksum complement at $7fdc-$7fdd
		# Checksum at $7fde-$7fdf

		# Calculate sum of all bytes
		checksum = sum(self.rom_data) & 0xffff

		# Write checksum and complement
		complement = checksum ^ 0xffff
		self.write_word(0x7fdc, complement)
		self.write_word(0x7fde, checksum)


def scan_for_enemy_table(rom_path: str) -> list[dict]:
	"""Scan ROM to find potential enemy data tables."""
	with open(rom_path, 'rb') as f:
		rom = f.read()

	candidates = []

	# Look for patterns typical of enemy data:
	# - Sequences of 16-byte entries
	# - HP values in reasonable range (1-999)
	# - Attack/defense in reasonable range (1-255)
	# - EXP values following HP

	for offset in range(0x020000, 0x060000, 16):
		# Check if this looks like enemy data
		entries_valid = 0

		for i in range(10):  # Check 10 consecutive entries
			entry_offset = offset + i * 16
			if entry_offset + 16 > len(rom):
				break

			hp = struct.unpack('<H', rom[entry_offset:entry_offset+2])[0]
			atk = rom[entry_offset + 2]
			defense = rom[entry_offset + 3]
			exp = struct.unpack('<H', rom[entry_offset + 4:entry_offset+6])[0]

			# Check for reasonable values
			if 1 <= hp <= 9999 and 1 <= atk <= 255 and 0 <= defense <= 255 and exp <= 9999:
				entries_valid += 1

		if entries_valid >= 5:
			bank = offset // 0x8000
			addr = 0x8000 + (offset % 0x8000)
			candidates.append({
				'file_offset': offset,
				'bank': bank,
				'address': addr,
				'valid_entries': entries_valid,
			})

	return candidates


if __name__ == '__main__':
	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"

	print("=" * 60)
	print("Soul Blazer Data Editor")
	print("=" * 60)

	# Scan for enemy table
	print("\nScanning for enemy data tables...")
	candidates = scan_for_enemy_table(rom_path)

	if candidates:
		print(f"Found {len(candidates)} potential enemy tables:")
		for c in candidates[:10]:
			print(f"  ${c['file_offset']:06x} (${c['bank']:02x}:{c['address']:04x}) - {c['valid_entries']} valid entries")
	else:
		print("  No clear enemy tables found - needs manual analysis")

	# Create editor instance
	editor = SoulBlazerEditor(rom_path)
	print(f"\nROM loaded: {len(editor.rom_data):,} bytes")
	print(f"Checksum valid: {(editor.read_word(0x7fdc) ^ editor.read_word(0x7fde)) == 0xffff}")
