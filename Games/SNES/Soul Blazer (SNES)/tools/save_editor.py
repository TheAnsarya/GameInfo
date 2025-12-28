#!/usr/bin/env python3
"""
Soul Blazer (SNES) Save File Editor
Edits SRAM save data for Soul Blazer.
"""

import json
import struct
import sys
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import IntEnum


# Paths
SCRIPT_DIR = Path(__file__).parent
SAVES_DIR = SCRIPT_DIR.parent / "saves"


class GameArea(IntEnum):
	"""Game area IDs."""
	GRASS_VALLEY = 0x00
	GREENWOOD = 0x01
	ST_ELLES = 0x02
	MOUNTAIN_OF_SOULS = 0x03
	LEOS_LAB = 0x04
	MAGRIDD_CASTLE = 0x05
	WORLD_OF_EVIL = 0x06


@dataclass
class SaveSlot:
	"""Represents a save game slot."""
	slot_number: int
	name: str
	level: int
	hp: int
	max_hp: int
	exp: int
	gems: int
	sword: int
	armor: int
	magic: int
	area: GameArea
	souls_released: int
	lairs_cleared: list[int] = field(default_factory=list)
	items: list[int] = field(default_factory=list)
	emblems: list[bool] = field(default_factory=list)
	play_time: int = 0
	checksum: int = 0

	# SRAM offsets (relative to slot start)
	OFFSETS = {
		"name": (0x00, 8),       # 8-byte name
		"level": (0x08, 1),
		"hp": (0x0A, 2),
		"max_hp": (0x0C, 2),
		"exp": (0x10, 4),
		"gems": (0x14, 2),
		"sword": (0x16, 1),
		"armor": (0x17, 1),
		"magic": (0x18, 1),
		"area": (0x1A, 1),
		"souls_released": (0x1C, 2),
		"lairs_cleared": (0x20, 32),  # Bit flags
		"items": (0x40, 16),      # Item inventory
		"emblems": (0x50, 1),     # Bit flags
		"play_time": (0x52, 4),   # Frames
		"checksum": (0x1FE, 2),   # At end of slot
	}


class SaveEditor:
	"""Editor for Soul Blazer SRAM save files."""

	# SRAM structure
	HEADER_SIZE = 0x10
	SLOT_SIZE = 0x200
	NUM_SLOTS = 3
	SRAM_SIZE = 0x800  # 2KB SRAM

	# Text encoding (simplified)
	TEXT_TABLE = {
		0x00: ' ', 0x0A: 'A', 0x0B: 'B', 0x0C: 'C', 0x0D: 'D',
		0x0E: 'E', 0x0F: 'F', 0x10: 'G', 0x11: 'H', 0x12: 'I',
		0x13: 'J', 0x14: 'K', 0x15: 'L', 0x16: 'M', 0x17: 'N',
		0x18: 'O', 0x19: 'P', 0x1A: 'Q', 0x1B: 'R', 0x1C: 'S',
		0x1D: 'T', 0x1E: 'U', 0x1F: 'V', 0x20: 'W', 0x21: 'X',
		0x22: 'Y', 0x23: 'Z',
		0x24: 'a', 0x25: 'b', 0x26: 'c', 0x27: 'd', 0x28: 'e',
		0x29: 'f', 0x2A: 'g', 0x2B: 'h', 0x2C: 'i', 0x2D: 'j',
		0x2E: 'k', 0x2F: 'l', 0x30: 'm', 0x31: 'n', 0x32: 'o',
		0x33: 'p', 0x34: 'q', 0x35: 'r', 0x36: 's', 0x37: 't',
		0x38: 'u', 0x39: 'v', 0x3A: 'w', 0x3B: 'x', 0x3C: 'y',
		0x3D: 'z',
		0x40: '0', 0x41: '1', 0x42: '2', 0x43: '3', 0x44: '4',
		0x45: '5', 0x46: '6', 0x47: '7', 0x48: '8', 0x49: '9',
		0xFF: '',  # End/padding
	}

	# Reverse table for encoding
	TEXT_ENCODE = {v: k for k, v in TEXT_TABLE.items() if v}

	# Equipment names
	SWORDS = [
		"None", "Sword of Life", "Psycho Sword", "Critical Sword",
		"Lucky Blade", "Zantetsu Sword", "Spirit Sword", "Recovery Sword",
		"Soul Blade",
	]
	ARMORS = [
		"None", "Iron Armor", "Ice Armor", "Bubble Armor",
		"Magic Armor", "Mystic Armor", "Light Armor", "Elemental Armor",
		"Soul Armor",
	]
	MAGICS = [
		"None", "Flame Ball", "Light Arrow", "Magic Flair",
		"Rotator", "Spark Bomb", "Flame Pillar", "Tornado", "Phoenix",
	]

	def __init__(self, sram_path: str = None):
		"""Initialize editor."""
		self.sram_data: Optional[bytearray] = None
		self.slots: list[SaveSlot] = []
		self.sram_path: Optional[Path] = None

		if sram_path:
			self.load_sram(sram_path)

	def load_sram(self, path: str) -> bool:
		"""Load SRAM file."""
		try:
			self.sram_path = Path(path)
			with open(path, 'rb') as f:
				self.sram_data = bytearray(f.read())

			# Validate size
			if len(self.sram_data) < self.SRAM_SIZE:
				print(f"Warning: SRAM file too small ({len(self.sram_data)} bytes)")
				# Pad to expected size
				self.sram_data.extend(bytes(self.SRAM_SIZE - len(self.sram_data)))

			self._parse_slots()
			return True
		except Exception as e:
			print(f"Error loading SRAM: {e}")
			return False

	def create_new(self) -> None:
		"""Create new blank SRAM."""
		self.sram_data = bytearray(self.SRAM_SIZE)
		self.slots = [self._create_empty_slot(i) for i in range(self.NUM_SLOTS)]

	def _create_empty_slot(self, slot_num: int) -> SaveSlot:
		"""Create empty save slot."""
		return SaveSlot(
			slot_number=slot_num,
			name="",
			level=1,
			hp=20,
			max_hp=20,
			exp=0,
			gems=0,
			sword=0,
			armor=0,
			magic=0,
			area=GameArea.GRASS_VALLEY,
			souls_released=0,
			lairs_cleared=[],
			items=[],
			emblems=[False] * 8,
		)

	def _read_byte(self, offset: int) -> int:
		"""Read byte from SRAM."""
		if offset >= len(self.sram_data):
			return 0
		return self.sram_data[offset]

	def _read_word(self, offset: int) -> int:
		"""Read 16-bit word from SRAM."""
		if offset + 1 >= len(self.sram_data):
			return 0
		return self.sram_data[offset] | (self.sram_data[offset + 1] << 8)

	def _read_long(self, offset: int) -> int:
		"""Read 32-bit value from SRAM."""
		if offset + 3 >= len(self.sram_data):
			return 0
		return (self.sram_data[offset] |
				(self.sram_data[offset + 1] << 8) |
				(self.sram_data[offset + 2] << 16) |
				(self.sram_data[offset + 3] << 24))

	def _write_byte(self, offset: int, value: int) -> None:
		"""Write byte to SRAM."""
		if offset < len(self.sram_data):
			self.sram_data[offset] = value & 0xFF

	def _write_word(self, offset: int, value: int) -> None:
		"""Write 16-bit word to SRAM."""
		if offset + 1 < len(self.sram_data):
			self.sram_data[offset] = value & 0xFF
			self.sram_data[offset + 1] = (value >> 8) & 0xFF

	def _write_long(self, offset: int, value: int) -> None:
		"""Write 32-bit value to SRAM."""
		if offset + 3 < len(self.sram_data):
			self.sram_data[offset] = value & 0xFF
			self.sram_data[offset + 1] = (value >> 8) & 0xFF
			self.sram_data[offset + 2] = (value >> 16) & 0xFF
			self.sram_data[offset + 3] = (value >> 24) & 0xFF

	def _decode_name(self, data: bytes) -> str:
		"""Decode character name from SRAM."""
		name = ""
		for b in data:
			if b == 0xFF or b == 0x00:
				break
			name += self.TEXT_TABLE.get(b, '?')
		return name

	def _encode_name(self, name: str, length: int = 8) -> bytes:
		"""Encode character name for SRAM."""
		result = bytearray(length)
		for i, c in enumerate(name[:length]):
			result[i] = self.TEXT_ENCODE.get(c, 0x00)
		# Fill rest with FF
		for i in range(len(name), length):
			result[i] = 0xFF
		return bytes(result)

	def _parse_slots(self) -> None:
		"""Parse save slots from SRAM."""
		self.slots = []

		for i in range(self.NUM_SLOTS):
			slot_offset = self.HEADER_SIZE + (i * self.SLOT_SIZE)
			slot = self._parse_slot(i, slot_offset)
			self.slots.append(slot)

	def _parse_slot(self, slot_num: int, base_offset: int) -> SaveSlot:
		"""Parse a single save slot."""
		# Read name
		name_offset, name_len = SaveSlot.OFFSETS["name"]
		name_data = self.sram_data[base_offset + name_offset:base_offset + name_offset + name_len]
		name = self._decode_name(name_data)

		# Read stats
		level = self._read_byte(base_offset + SaveSlot.OFFSETS["level"][0])
		hp = self._read_word(base_offset + SaveSlot.OFFSETS["hp"][0])
		max_hp = self._read_word(base_offset + SaveSlot.OFFSETS["max_hp"][0])
		exp = self._read_long(base_offset + SaveSlot.OFFSETS["exp"][0])
		gems = self._read_word(base_offset + SaveSlot.OFFSETS["gems"][0])

		# Read equipment
		sword = self._read_byte(base_offset + SaveSlot.OFFSETS["sword"][0])
		armor = self._read_byte(base_offset + SaveSlot.OFFSETS["armor"][0])
		magic = self._read_byte(base_offset + SaveSlot.OFFSETS["magic"][0])

		# Read area and progress
		area_id = self._read_byte(base_offset + SaveSlot.OFFSETS["area"][0])
		try:
			area = GameArea(area_id)
		except ValueError:
			area = GameArea.GRASS_VALLEY

		souls = self._read_word(base_offset + SaveSlot.OFFSETS["souls_released"][0])

		# Read lair flags
		lair_offset = base_offset + SaveSlot.OFFSETS["lairs_cleared"][0]
		lairs_cleared = []
		for byte_idx in range(32):
			byte_val = self._read_byte(lair_offset + byte_idx)
			for bit in range(8):
				if byte_val & (1 << bit):
					lairs_cleared.append(byte_idx * 8 + bit)

		# Read items
		item_offset = base_offset + SaveSlot.OFFSETS["items"][0]
		items = [self._read_byte(item_offset + j) for j in range(16)]

		# Read emblems
		emblem_byte = self._read_byte(base_offset + SaveSlot.OFFSETS["emblems"][0])
		emblems = [(emblem_byte & (1 << j)) != 0 for j in range(8)]

		# Read play time
		play_time = self._read_long(base_offset + SaveSlot.OFFSETS["play_time"][0])

		# Read checksum
		checksum = self._read_word(base_offset + SaveSlot.OFFSETS["checksum"][0])

		return SaveSlot(
			slot_number=slot_num,
			name=name,
			level=level,
			hp=hp,
			max_hp=max_hp,
			exp=exp,
			gems=gems,
			sword=sword,
			armor=armor,
			magic=magic,
			area=area,
			souls_released=souls,
			lairs_cleared=lairs_cleared,
			items=items,
			emblems=emblems,
			play_time=play_time,
			checksum=checksum,
		)

	def _write_slot(self, slot: SaveSlot) -> None:
		"""Write save slot to SRAM."""
		base_offset = self.HEADER_SIZE + (slot.slot_number * self.SLOT_SIZE)

		# Write name
		name_offset, name_len = SaveSlot.OFFSETS["name"]
		name_data = self._encode_name(slot.name, name_len)
		for i, b in enumerate(name_data):
			self._write_byte(base_offset + name_offset + i, b)

		# Write stats
		self._write_byte(base_offset + SaveSlot.OFFSETS["level"][0], slot.level)
		self._write_word(base_offset + SaveSlot.OFFSETS["hp"][0], slot.hp)
		self._write_word(base_offset + SaveSlot.OFFSETS["max_hp"][0], slot.max_hp)
		self._write_long(base_offset + SaveSlot.OFFSETS["exp"][0], slot.exp)
		self._write_word(base_offset + SaveSlot.OFFSETS["gems"][0], slot.gems)

		# Write equipment
		self._write_byte(base_offset + SaveSlot.OFFSETS["sword"][0], slot.sword)
		self._write_byte(base_offset + SaveSlot.OFFSETS["armor"][0], slot.armor)
		self._write_byte(base_offset + SaveSlot.OFFSETS["magic"][0], slot.magic)

		# Write area
		self._write_byte(base_offset + SaveSlot.OFFSETS["area"][0], slot.area.value)
		self._write_word(base_offset + SaveSlot.OFFSETS["souls_released"][0], slot.souls_released)

		# Write lair flags
		lair_offset = base_offset + SaveSlot.OFFSETS["lairs_cleared"][0]
		for byte_idx in range(32):
			byte_val = 0
			for bit in range(8):
				lair_num = byte_idx * 8 + bit
				if lair_num in slot.lairs_cleared:
					byte_val |= (1 << bit)
			self._write_byte(lair_offset + byte_idx, byte_val)

		# Write items
		item_offset = base_offset + SaveSlot.OFFSETS["items"][0]
		for i, item in enumerate(slot.items[:16]):
			self._write_byte(item_offset + i, item)

		# Write emblems
		emblem_byte = 0
		for i, has_emblem in enumerate(slot.emblems[:8]):
			if has_emblem:
				emblem_byte |= (1 << i)
		self._write_byte(base_offset + SaveSlot.OFFSETS["emblems"][0], emblem_byte)

		# Write play time
		self._write_long(base_offset + SaveSlot.OFFSETS["play_time"][0], slot.play_time)

		# Calculate and write checksum
		checksum = self._calculate_checksum(slot.slot_number)
		self._write_word(base_offset + SaveSlot.OFFSETS["checksum"][0], checksum)

	def _calculate_checksum(self, slot_num: int) -> int:
		"""Calculate checksum for save slot."""
		base_offset = self.HEADER_SIZE + (slot_num * self.SLOT_SIZE)
		checksum = 0

		# Sum all bytes except checksum itself
		for i in range(self.SLOT_SIZE - 2):
			checksum = (checksum + self._read_byte(base_offset + i)) & 0xFFFF

		return checksum

	def save(self, path: str = None) -> bool:
		"""Save SRAM to file."""
		if path is None:
			path = self.sram_path

		if path is None:
			print("No save path specified")
			return False

		try:
			# Write all slots first
			for slot in self.slots:
				self._write_slot(slot)

			with open(path, 'wb') as f:
				f.write(self.sram_data)
			return True
		except Exception as e:
			print(f"Error saving SRAM: {e}")
			return False

	def export_to_json(self, path: str) -> bool:
		"""Export save data to JSON."""
		try:
			data = {
				"slots": []
			}

			for slot in self.slots:
				slot_data = {
					"slot": slot.slot_number,
					"name": slot.name,
					"level": slot.level,
					"hp": slot.hp,
					"max_hp": slot.max_hp,
					"exp": slot.exp,
					"gems": slot.gems,
					"equipment": {
						"sword": self.SWORDS[min(slot.sword, len(self.SWORDS)-1)],
						"sword_id": slot.sword,
						"armor": self.ARMORS[min(slot.armor, len(self.ARMORS)-1)],
						"armor_id": slot.armor,
						"magic": self.MAGICS[min(slot.magic, len(self.MAGICS)-1)],
						"magic_id": slot.magic,
					},
					"area": slot.area.name,
					"souls_released": slot.souls_released,
					"lairs_cleared": slot.lairs_cleared,
					"items": slot.items,
					"emblems": slot.emblems,
					"play_time_frames": slot.play_time,
					"play_time_formatted": self._format_time(slot.play_time),
				}
				data["slots"].append(slot_data)

			with open(path, 'w') as f:
				json.dump(data, f, indent='\t')
			return True
		except Exception as e:
			print(f"Error exporting to JSON: {e}")
			return False

	def _format_time(self, frames: int) -> str:
		"""Format play time from frame count."""
		seconds = frames // 60
		minutes = seconds // 60
		hours = minutes // 60
		return f"{hours}:{minutes % 60:02d}:{seconds % 60:02d}"

	def print_slot(self, slot: SaveSlot) -> None:
		"""Print save slot information."""
		print(f"\n=== Slot {slot.slot_number + 1} ===")

		if not slot.name:
			print("(Empty slot)")
			return

		print(f"Name: {slot.name}")
		print(f"Level: {slot.level}")
		print(f"HP: {slot.hp}/{slot.max_hp}")
		print(f"EXP: {slot.exp:,}")
		print(f"GEMs: {slot.gems:,}")
		print(f"\nEquipment:")
		print(f"  Sword: {self.SWORDS[min(slot.sword, len(self.SWORDS)-1)]}")
		print(f"  Armor: {self.ARMORS[min(slot.armor, len(self.ARMORS)-1)]}")
		print(f"  Magic: {self.MAGICS[min(slot.magic, len(self.MAGICS)-1)]}")
		print(f"\nProgress:")
		print(f"  Area: {slot.area.name}")
		print(f"  Souls Released: {slot.souls_released}")
		print(f"  Lairs Cleared: {len(slot.lairs_cleared)}")
		print(f"\nEmblems: {sum(slot.emblems)}/8")
		print(f"Play Time: {self._format_time(slot.play_time)}")

	def print_all(self) -> None:
		"""Print all save slots."""
		print("=" * 40)
		print("SOUL BLAZER SAVE FILE")
		print("=" * 40)

		for slot in self.slots:
			self.print_slot(slot)


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Save Editor")
	parser.add_argument("sram", nargs="?", help="Path to SRAM file")
	parser.add_argument("--export", "-e", help="Export to JSON file")
	parser.add_argument("--slot", "-s", type=int, choices=[1, 2, 3], help="Slot to modify")
	parser.add_argument("--set-level", type=int, help="Set level (1-50)")
	parser.add_argument("--set-hp", type=int, help="Set current HP")
	parser.add_argument("--set-gems", type=int, help="Set GEM count")
	parser.add_argument("--max-stats", action="store_true", help="Maximize all stats")
	parser.add_argument("--all-items", action="store_true", help="Unlock all items")
	parser.add_argument("--output", "-o", help="Output SRAM file")

	args = parser.parse_args()

	if not args.sram:
		print("Usage: python save_editor.py <sram_file> [options]")
		print("\nOptions:")
		print("  --export FILE     Export to JSON")
		print("  --slot N          Select slot (1-3)")
		print("  --set-level N     Set level")
		print("  --set-hp N        Set HP")
		print("  --set-gems N      Set GEMs")
		print("  --max-stats       Maximize all stats")
		print("  --all-items       Unlock all items")
		print("  --output FILE     Save modified SRAM")
		return

	editor = SaveEditor(args.sram)

	if not editor.sram_data:
		print(f"Failed to load SRAM: {args.sram}")
		return

	print(f"Loaded SRAM: {len(editor.sram_data):,} bytes")

	if args.export:
		editor.export_to_json(args.export)
		print(f"Exported to: {args.export}")
		return

	# Apply modifications
	if args.slot:
		slot = editor.slots[args.slot - 1]

		if args.set_level:
			slot.level = max(1, min(50, args.set_level))
			print(f"Set level to {slot.level}")

		if args.set_hp:
			slot.hp = max(1, min(999, args.set_hp))
			slot.max_hp = max(slot.max_hp, slot.hp)
			print(f"Set HP to {slot.hp}/{slot.max_hp}")

		if args.set_gems:
			slot.gems = max(0, min(9999, args.set_gems))
			print(f"Set GEMs to {slot.gems}")

		if args.max_stats:
			slot.level = 50
			slot.hp = 999
			slot.max_hp = 999
			slot.exp = 99999999
			slot.gems = 9999
			slot.sword = 8  # Soul Blade
			slot.armor = 8  # Soul Armor
			slot.magic = 8  # Phoenix
			slot.emblems = [True] * 8
			print("Maximized all stats!")

		if args.all_items:
			slot.items = list(range(1, 17))
			print("Unlocked all items!")

		# Save if output specified
		if args.output:
			if editor.save(args.output):
				print(f"Saved to: {args.output}")
		else:
			editor.print_slot(slot)
	else:
		editor.print_all()


if __name__ == "__main__":
	main()
