#!/usr/bin/env python3
"""
Treasure Chest Editor - Edit chest contents and locations.

Tools for managing treasure chest placement, contents, and
reward systems in retro RPGs.

Usage:
	python chest_editor.py chests.json --view
	python chest_editor.py chests.json --add --item 5 --map 3
	python chest_editor.py chests.json --edit 10 --gold 1000

Features:
	- Chest placement
	- Item/gold contents
	- Mimic configuration
	- One-time/respawn flags
	- Trap settings
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, Flag, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class ChestType(Enum):
	"""Types of chests."""
	NORMAL = 0
	WOODEN = 1
	IRON = 2
	SILVER = 3
	GOLD = 4
	CRYSTAL = 5
	MAGIC = 6
	INVISIBLE = 7
	MIMIC = 8


class ContentType(Enum):
	"""Types of chest contents."""
	EMPTY = 0
	ITEM = 1
	GOLD = 2
	ITEM_MULTI = 3     # Multiple items
	GOLD_RANDOM = 4    # Random gold amount
	EQUIPMENT = 5
	KEY_ITEM = 6


class TrapType(Enum):
	"""Trap types."""
	NONE = 0
	POISON_GAS = 1
	EXPLOSION = 2
	ALARM = 3           # Triggers encounter
	CURSE = 4
	TELEPORT = 5
	NEEDLE = 6


class ChestFlag(Flag):
	"""Chest flags."""
	NONE = 0
	ONE_TIME = auto()      # Can only be opened once
	RESPAWN = auto()       # Respawns after time
	LOCKED = auto()        # Requires key
	MAGIC_LOCKED = auto()  # Requires magic key
	TRAPPED = auto()       # Has trap
	BOSS_DROP = auto()     # Dropped by boss
	HIDDEN = auto()        # Not visible
	QUEST_ITEM = auto()    # Required for quest


@dataclass
class ChestContent:
	"""Contents of a chest."""
	content_type: ContentType = ContentType.EMPTY

	# For items
	item_id: int = 0
	item_name: str = ""
	item_count: int = 1

	# For multiple items
	items: List[Tuple[int, str, int]] = field(default_factory=list)  # (id, name, count)

	# For gold
	gold_amount: int = 0
	gold_min: int = 0      # For random gold
	gold_max: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"content_type": self.content_type.name}

		if self.content_type == ContentType.ITEM:
			result["item_id"] = self.item_id
			result["item_name"] = self.item_name
			result["item_count"] = self.item_count
		elif self.content_type == ContentType.ITEM_MULTI:
			result["items"] = [
				{"id": i, "name": n, "count": c}
				for i, n, c in self.items
			]
		elif self.content_type == ContentType.GOLD:
			result["gold_amount"] = self.gold_amount
		elif self.content_type == ContentType.GOLD_RANDOM:
			result["gold_min"] = self.gold_min
			result["gold_max"] = self.gold_max
		elif self.content_type in [ContentType.EQUIPMENT, ContentType.KEY_ITEM]:
			result["item_id"] = self.item_id
			result["item_name"] = self.item_name

		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "ChestContent":
		"""Create from dictionary."""
		content = cls()
		content.content_type = ContentType[data.get("content_type", "EMPTY")]

		if content.content_type == ContentType.ITEM:
			content.item_id = data.get("item_id", 0)
			content.item_name = data.get("item_name", "")
			content.item_count = data.get("item_count", 1)
		elif content.content_type == ContentType.ITEM_MULTI:
			for item in data.get("items", []):
				content.items.append((
					item.get("id", 0),
					item.get("name", ""),
					item.get("count", 1)
				))
		elif content.content_type == ContentType.GOLD:
			content.gold_amount = data.get("gold_amount", 0)
		elif content.content_type == ContentType.GOLD_RANDOM:
			content.gold_min = data.get("gold_min", 0)
			content.gold_max = data.get("gold_max", 0)
		elif content.content_type in [ContentType.EQUIPMENT, ContentType.KEY_ITEM]:
			content.item_id = data.get("item_id", 0)
			content.item_name = data.get("item_name", "")

		return content


@dataclass
class TreasureChest:
	"""A treasure chest."""
	id: int = 0
	name: str = ""

	# Location
	map_id: int = 0
	map_name: str = ""
	x: int = 0
	y: int = 0
	layer: int = 0  # For multi-layer maps

	# Type and appearance
	chest_type: ChestType = ChestType.NORMAL
	sprite_id: int = 0

	# Contents
	contents: ChestContent = field(default_factory=ChestContent)

	# Flags
	flags: ChestFlag = ChestFlag.ONE_TIME

	# Locking
	key_id: int = 0           # Key item required
	key_name: str = ""

	# Trap
	trap_type: TrapType = TrapType.NONE
	trap_damage: int = 0
	trap_encounter_id: int = 0  # For alarm traps

	# Mimic
	mimic_monster_id: int = 0
	mimic_monster_name: str = ""

	# Respawn
	respawn_time: int = 0  # In game hours/steps

	# Event flag
	event_flag: int = 0    # Flag set when opened

	# ROM data
	rom_address: int = 0
	data_size: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.id,
			"name": self.name,
			"location": {
				"map_id": self.map_id,
				"map_name": self.map_name,
				"x": self.x,
				"y": self.y,
				"layer": self.layer
			},
			"chest_type": self.chest_type.name,
			"sprite_id": self.sprite_id,
			"contents": self.contents.to_dict(),
			"flags": self._flags_to_list()
		}

		if ChestFlag.LOCKED in self.flags or ChestFlag.MAGIC_LOCKED in self.flags:
			result["key"] = {
				"id": self.key_id,
				"name": self.key_name
			}

		if self.trap_type != TrapType.NONE:
			result["trap"] = {
				"type": self.trap_type.name,
				"damage": self.trap_damage,
				"encounter_id": self.trap_encounter_id
			}

		if self.chest_type == ChestType.MIMIC:
			result["mimic"] = {
				"monster_id": self.mimic_monster_id,
				"monster_name": self.mimic_monster_name
			}

		if ChestFlag.RESPAWN in self.flags:
			result["respawn_time"] = self.respawn_time

		if self.event_flag:
			result["event_flag"] = self.event_flag

		if self.rom_address:
			result["rom_address"] = f"0x{self.rom_address:06X}"
		if self.data_size:
			result["data_size"] = self.data_size

		return result

	def _flags_to_list(self) -> List[str]:
		"""Convert flags to list."""
		result = []
		for flag in ChestFlag:
			if flag != ChestFlag.NONE and (self.flags & flag):
				result.append(flag.name)
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "TreasureChest":
		"""Create from dictionary."""
		chest = cls()
		chest.id = data.get("id", 0)
		chest.name = data.get("name", "")

		loc = data.get("location", {})
		chest.map_id = loc.get("map_id", 0)
		chest.map_name = loc.get("map_name", "")
		chest.x = loc.get("x", 0)
		chest.y = loc.get("y", 0)
		chest.layer = loc.get("layer", 0)

		chest.chest_type = ChestType[data.get("chest_type", "NORMAL")]
		chest.sprite_id = data.get("sprite_id", 0)

		if "contents" in data:
			chest.contents = ChestContent.from_dict(data["contents"])

		# Flags
		flags = ChestFlag.NONE
		for fname in data.get("flags", []):
			flags |= ChestFlag[fname]
		chest.flags = flags

		# Key
		key_data = data.get("key", {})
		chest.key_id = key_data.get("id", 0)
		chest.key_name = key_data.get("name", "")

		# Trap
		trap_data = data.get("trap", {})
		chest.trap_type = TrapType[trap_data.get("type", "NONE")]
		chest.trap_damage = trap_data.get("damage", 0)
		chest.trap_encounter_id = trap_data.get("encounter_id", 0)

		# Mimic
		mimic_data = data.get("mimic", {})
		chest.mimic_monster_id = mimic_data.get("monster_id", 0)
		chest.mimic_monster_name = mimic_data.get("monster_name", "")

		chest.respawn_time = data.get("respawn_time", 0)
		chest.event_flag = data.get("event_flag", 0)

		if data.get("rom_address"):
			chest.rom_address = int(data["rom_address"], 16)
		chest.data_size = data.get("data_size", 0)

		return chest

	def get_contents_description(self) -> str:
		"""Get human-readable contents description."""
		c = self.contents

		if c.content_type == ContentType.EMPTY:
			return "Empty"
		elif c.content_type == ContentType.ITEM:
			if c.item_count > 1:
				return f"{c.item_name} x{c.item_count}"
			return c.item_name
		elif c.content_type == ContentType.ITEM_MULTI:
			parts = []
			for _, name, count in c.items:
				if count > 1:
					parts.append(f"{name} x{count}")
				else:
					parts.append(name)
			return ", ".join(parts)
		elif c.content_type == ContentType.GOLD:
			return f"{c.gold_amount} G"
		elif c.content_type == ContentType.GOLD_RANDOM:
			return f"{c.gold_min}-{c.gold_max} G"
		elif c.content_type == ContentType.EQUIPMENT:
			return f"[E] {c.item_name}"
		elif c.content_type == ContentType.KEY_ITEM:
			return f"[K] {c.item_name}"

		return "???"


class ChestDatabase:
	"""Database of treasure chests."""

	def __init__(self):
		self.chests: Dict[int, TreasureChest] = {}
		self.next_id: int = 1

	def add(self, chest: TreasureChest) -> int:
		"""Add chest to database."""
		if chest.id == 0:
			chest.id = self.next_id

		self.chests[chest.id] = chest
		self.next_id = max(self.next_id, chest.id + 1)
		return chest.id

	def get(self, chest_id: int) -> Optional[TreasureChest]:
		"""Get chest by ID."""
		return self.chests.get(chest_id)

	def delete(self, chest_id: int) -> bool:
		"""Delete chest."""
		if chest_id in self.chests:
			del self.chests[chest_id]
			return True
		return False

	def get_by_map(self, map_id: int) -> List[TreasureChest]:
		"""Get all chests on a map."""
		return [c for c in self.chests.values() if c.map_id == map_id]

	def get_by_type(self, chest_type: ChestType) -> List[TreasureChest]:
		"""Get all chests of a type."""
		return [c for c in self.chests.values() if c.chest_type == chest_type]

	def get_mimics(self) -> List[TreasureChest]:
		"""Get all mimic chests."""
		return self.get_by_type(ChestType.MIMIC)

	def search(self, **criteria) -> List[TreasureChest]:
		"""Search chests by criteria."""
		results = []

		for chest in self.chests.values():
			match = True

			if "map_id" in criteria:
				if chest.map_id != criteria["map_id"]:
					match = False

			if "item_id" in criteria:
				if chest.contents.item_id != criteria["item_id"]:
					match = False

			if "has_flag" in criteria:
				if not (chest.flags & criteria["has_flag"]):
					match = False

			if "chest_type" in criteria:
				if chest.chest_type != criteria["chest_type"]:
					match = False

			if match:
				results.append(chest)

		return results

	def to_json(self) -> str:
		"""Export to JSON."""
		data = {
			"chests": [c.to_dict() for c in sorted(self.chests.values(), key=lambda x: x.id)]
		}
		return json.dumps(data, indent="\t")

	def save(self, filepath: str) -> bool:
		"""Save to file."""
		try:
			with open(filepath, "w", encoding="utf-8") as f:
				f.write(self.to_json())
			return True
		except Exception as e:
			print(f"Error saving: {e}")
			return False

	def load(self, filepath: str) -> bool:
		"""Load from file."""
		try:
			with open(filepath, "r", encoding="utf-8") as f:
				data = json.load(f)

			self.chests.clear()
			for chest_data in data.get("chests", []):
				chest = TreasureChest.from_dict(chest_data)
				self.add(chest)

			return True
		except Exception as e:
			print(f"Error loading: {e}")
			return False

	def format_list(self, chests: List[TreasureChest] = None) -> str:
		"""Format chest list."""
		if chests is None:
			chests = list(self.chests.values())

		lines = []
		lines.append(f"{'ID':>4} {'Map':<15} {'Pos':<10} {'Type':<10} {'Contents':<25}")
		lines.append("-" * 68)

		for chest in sorted(chests, key=lambda x: (x.map_id, x.y, x.x)):
			pos = f"({chest.x},{chest.y})"
			contents = chest.get_contents_description()
			if len(contents) > 25:
				contents = contents[:22] + "..."

			map_name = chest.map_name[:15] if chest.map_name else f"Map {chest.map_id}"
			lines.append(
				f"{chest.id:>4} {map_name:<15} {pos:<10} {chest.chest_type.name:<10} {contents:<25}"
			)

		return "\n".join(lines)

	def format_detail(self, chest_id: int) -> str:
		"""Format chest detail."""
		chest = self.get(chest_id)
		if not chest:
			return f"Chest {chest_id} not found"

		lines = []
		lines.append(f"=== Chest {chest.id}: {chest.name or 'Unnamed'} ===")
		lines.append(f"Location: {chest.map_name or 'Map ' + str(chest.map_id)} ({chest.x}, {chest.y})")
		lines.append(f"Type: {chest.chest_type.name}")
		lines.append(f"Contents: {chest.get_contents_description()}")
		lines.append("")

		flags = chest._flags_to_list()
		if flags:
			lines.append(f"Flags: {', '.join(flags)}")

		if ChestFlag.LOCKED in chest.flags:
			lines.append(f"Requires Key: {chest.key_name or f'Key {chest.key_id}'}")

		if chest.trap_type != TrapType.NONE:
			lines.append(f"Trap: {chest.trap_type.name} ({chest.trap_damage} damage)")

		if chest.chest_type == ChestType.MIMIC:
			lines.append(f"Mimic Monster: {chest.mimic_monster_name or f'Monster {chest.mimic_monster_id}'}")

		if ChestFlag.RESPAWN in chest.flags:
			lines.append(f"Respawn Time: {chest.respawn_time}")

		if chest.event_flag:
			lines.append(f"Event Flag: {chest.event_flag}")

		return "\n".join(lines)


def create_sample_database() -> ChestDatabase:
	"""Create sample chest database."""
	db = ChestDatabase()

	# Basic item chest
	herb_chest = TreasureChest(
		id=1, name="Herb Chest",
		map_id=0, map_name="Starting Cave", x=5, y=3,
		chest_type=ChestType.WOODEN,
		contents=ChestContent(
			content_type=ContentType.ITEM,
			item_id=1, item_name="Herb", item_count=3
		),
		flags=ChestFlag.ONE_TIME
	)
	db.add(herb_chest)

	# Gold chest
	gold_chest = TreasureChest(
		id=2, name="Gold Cache",
		map_id=0, map_name="Starting Cave", x=10, y=8,
		chest_type=ChestType.IRON,
		contents=ChestContent(
			content_type=ContentType.GOLD,
			gold_amount=500
		),
		flags=ChestFlag.ONE_TIME
	)
	db.add(gold_chest)

	# Locked chest with equipment
	locked_chest = TreasureChest(
		id=3, name="Secret Armory",
		map_id=1, map_name="Castle Basement", x=15, y=20,
		chest_type=ChestType.SILVER,
		contents=ChestContent(
			content_type=ContentType.EQUIPMENT,
			item_id=50, item_name="Silver Sword"
		),
		flags=ChestFlag.ONE_TIME | ChestFlag.LOCKED,
		key_id=10, key_name="Silver Key"
	)
	db.add(locked_chest)

	# Trapped chest
	trapped_chest = TreasureChest(
		id=4, name="Treasure Room",
		map_id=2, map_name="Dungeon B2", x=30, y=12,
		chest_type=ChestType.GOLD,
		contents=ChestContent(
			content_type=ContentType.GOLD,
			gold_amount=5000
		),
		flags=ChestFlag.ONE_TIME | ChestFlag.TRAPPED,
		trap_type=TrapType.POISON_GAS,
		trap_damage=50
	)
	db.add(trapped_chest)

	# Mimic
	mimic_chest = TreasureChest(
		id=5, name="Suspicious Chest",
		map_id=2, map_name="Dungeon B2", x=35, y=15,
		chest_type=ChestType.MIMIC,
		contents=ChestContent(
			content_type=ContentType.EMPTY
		),
		flags=ChestFlag.ONE_TIME,
		mimic_monster_id=100, mimic_monster_name="Mimic"
	)
	db.add(mimic_chest)

	# Key item chest
	key_chest = TreasureChest(
		id=6, name="Dragon Orb",
		map_id=3, map_name="Dragon's Lair", x=50, y=50,
		chest_type=ChestType.CRYSTAL,
		contents=ChestContent(
			content_type=ContentType.KEY_ITEM,
			item_id=200, item_name="Dragon Orb"
		),
		flags=ChestFlag.ONE_TIME | ChestFlag.QUEST_ITEM | ChestFlag.BOSS_DROP,
		event_flag=150
	)
	db.add(key_chest)

	# Respawning chest
	respawn_chest = TreasureChest(
		id=7, name="Forest Cache",
		map_id=0, map_name="Overworld", x=100, y=75,
		chest_type=ChestType.WOODEN,
		contents=ChestContent(
			content_type=ContentType.GOLD_RANDOM,
			gold_min=50, gold_max=200
		),
		flags=ChestFlag.RESPAWN,
		respawn_time=24
	)
	db.add(respawn_chest)

	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Treasure Chest Editor")
	parser.add_argument("input", nargs="?", help="Chest database file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all chests")
	parser.add_argument("--detail", "-d", type=int,
						help="View chest details by ID")
	parser.add_argument("--map", "-m", type=int,
						help="Filter by map ID")
	parser.add_argument("--mimics", action="store_true",
						help="Show only mimics")
	parser.add_argument("--sample", action="store_true",
						help="Create sample database")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")
	parser.add_argument("--output", "-o",
						help="Output file")

	# Edit options
	parser.add_argument("--add", action="store_true",
						help="Add new chest")
	parser.add_argument("--edit", "-e", type=int,
						help="Edit chest by ID")
	parser.add_argument("--delete", type=int,
						help="Delete chest by ID")
	parser.add_argument("--item", type=int,
						help="Set item ID")
	parser.add_argument("--gold", type=int,
						help="Set gold amount")
	parser.add_argument("--pos", nargs=2, type=int, metavar=("X", "Y"),
						help="Set position")

	args = parser.parse_args()

	if not args.input and not args.sample:
		print("Treasure Chest Editor")
		print()
		print("Usage: python chest_editor.py <chests.json> [options]")
		print()
		print("Options:")
		print("  --view, -v          View all chests")
		print("  --detail, -d ID     View chest details")
		print("  --map, -m ID        Filter by map ID")
		print("  --mimics            Show only mimics")
		print("  --sample            Create sample database")
		print("  --json, -j          Output as JSON")
		print("  --output, -o FILE   Output file")
		print()
		print("Edit Options:")
		print("  --add               Add new chest")
		print("  --edit, -e ID       Edit chest")
		print("  --delete ID         Delete chest")
		print("  --item ID           Set item ID")
		print("  --gold NUM          Set gold amount")
		print("  --pos X Y           Set position")
		return

	# Create sample
	if args.sample:
		db = create_sample_database()
		out_file = args.output or "chests_sample.json"
		if db.save(out_file):
			print(f"Created sample database: {out_file}")
		return

	# Load database
	db = ChestDatabase()
	if os.path.exists(args.input):
		db.load(args.input)

	# View
	if args.view:
		chests = None
		if args.map is not None:
			chests = db.get_by_map(args.map)
		elif args.mimics:
			chests = db.get_mimics()

		if args.json:
			print(db.to_json())
		else:
			print(db.format_list(chests))
		return

	# Detail
	if args.detail:
		print(db.format_detail(args.detail))
		return

	# Map filter view
	if args.map is not None and not args.add and args.edit is None:
		chests = db.get_by_map(args.map)
		print(db.format_list(chests))
		return

	# Add
	if args.add:
		chest = TreasureChest()
		chest.map_id = args.map or 0
		if args.pos:
			chest.x, chest.y = args.pos
		if args.item:
			chest.contents = ChestContent(
				content_type=ContentType.ITEM,
				item_id=args.item
			)
		elif args.gold:
			chest.contents = ChestContent(
				content_type=ContentType.GOLD,
				gold_amount=args.gold
			)
		chest.flags = ChestFlag.ONE_TIME

		cid = db.add(chest)
		print(f"Added chest ID: {cid}")

	# Edit
	if args.edit:
		chest = db.get(args.edit)
		if not chest:
			print(f"Chest {args.edit} not found")
			return

		if args.map is not None:
			chest.map_id = args.map
		if args.pos:
			chest.x, chest.y = args.pos
		if args.item is not None:
			chest.contents = ChestContent(
				content_type=ContentType.ITEM,
				item_id=args.item
			)
		if args.gold is not None:
			chest.contents = ChestContent(
				content_type=ContentType.GOLD,
				gold_amount=args.gold
			)

		print(f"Updated chest {args.edit}")

	# Delete
	if args.delete:
		if db.delete(args.delete):
			print(f"Deleted chest {args.delete}")
		else:
			print(f"Chest {args.delete} not found")
			return

	# Save if modified
	if args.add or args.edit or args.delete:
		out_file = args.output or args.input
		if db.save(out_file):
			print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
