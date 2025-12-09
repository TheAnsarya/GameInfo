#!/usr/bin/env python3
"""
Warp Point Editor - Edit warp/teleport destinations.

Tools for managing warp points, teleporters, doors, and
map transitions in retro games.

Usage:
	python warp_editor.py warps.json --view
	python warp_editor.py warps.json --add --src 0,10,5 --dst 1,20,10
	python warp_editor.py warps.json --edit 5 --dst 2,30,15

Features:
	- Door/exit management
	- Teleport destinations
	- One-way/two-way warps
	- Conditional warps
	- Warp chains
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, Flag, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class WarpType(Enum):
	"""Types of warps."""
	DOOR = 0           # Standard door
	STAIRS_UP = 1      # Stairs going up
	STAIRS_DOWN = 2    # Stairs going down
	TELEPORT = 3       # Magical teleport
	CAVE_ENTRANCE = 4  # Cave entry
	CAVE_EXIT = 5      # Cave exit
	TOWN_ENTRANCE = 6  # Town entry
	WORLD_MAP = 7      # Return to world map
	DUNGEON = 8        # Dungeon entrance
	HIDDEN = 9         # Hidden passage
	FALLING = 10       # Fall to lower floor
	SHIP = 11          # Board ship
	FLYING = 12        # Flying mount


class TriggerType(Enum):
	"""How the warp is triggered."""
	STEP = 0           # Walk on tile
	ACTION = 1         # Press action button
	AUTOMATIC = 2      # Automatic on enter
	CONDITIONAL = 3    # Requires condition


class WarpFlag(Flag):
	"""Warp flags."""
	NONE = 0
	ONE_WAY = auto()           # Cannot return
	TWO_WAY = auto()           # Creates return warp
	REQUIRES_KEY = auto()      # Needs key item
	REQUIRES_MAGIC = auto()    # Needs magic spell
	REQUIRES_FLIGHT = auto()   # Needs flying ability
	LOCKED = auto()            # Locked door
	BOSS_ROOM = auto()         # Point of no return
	SAVE_POINT = auto()        # Save before warp
	CUTSCENE = auto()          # Triggers cutscene
	PARTY_REQUIRED = auto()    # Needs full party
	TIME_LIMITED = auto()      # Only at certain times


@dataclass
class WarpCondition:
	"""Condition for conditional warps."""
	flag_id: int = 0           # Event flag to check
	flag_value: bool = True    # Expected value
	item_id: int = 0           # Required item
	min_level: int = 0         # Minimum party level
	time_start: int = 0        # Start time (hours)
	time_end: int = 24         # End time (hours)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {}
		if self.flag_id:
			result["flag_id"] = self.flag_id
			result["flag_value"] = self.flag_value
		if self.item_id:
			result["item_id"] = self.item_id
		if self.min_level:
			result["min_level"] = self.min_level
		if self.time_start != 0 or self.time_end != 24:
			result["time_start"] = self.time_start
			result["time_end"] = self.time_end
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "WarpCondition":
		"""Create from dictionary."""
		return cls(
			flag_id=data.get("flag_id", 0),
			flag_value=data.get("flag_value", True),
			item_id=data.get("item_id", 0),
			min_level=data.get("min_level", 0),
			time_start=data.get("time_start", 0),
			time_end=data.get("time_end", 24)
		)


@dataclass
class WarpPoint:
	"""A warp point/teleporter."""
	id: int = 0
	name: str = ""

	# Source location
	src_map_id: int = 0
	src_map_name: str = ""
	src_x: int = 0
	src_y: int = 0
	src_layer: int = 0

	# Source trigger area (for multi-tile warps)
	src_width: int = 1
	src_height: int = 1

	# Destination
	dst_map_id: int = 0
	dst_map_name: str = ""
	dst_x: int = 0
	dst_y: int = 0
	dst_layer: int = 0
	dst_facing: int = 0  # Direction player faces after warp

	# Type
	warp_type: WarpType = WarpType.DOOR
	trigger_type: TriggerType = TriggerType.STEP

	# Flags
	flags: WarpFlag = WarpFlag.TWO_WAY

	# Condition
	condition: Optional[WarpCondition] = None

	# Key for locked warps
	key_id: int = 0
	key_name: str = ""

	# Visual/audio
	transition_type: int = 0   # Screen transition style
	sound_id: int = 0          # Sound effect

	# Link to return warp
	return_warp_id: int = 0

	# ROM data
	rom_address: int = 0
	data_size: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.id,
			"name": self.name,
			"source": {
				"map_id": self.src_map_id,
				"map_name": self.src_map_name,
				"x": self.src_x,
				"y": self.src_y,
				"layer": self.src_layer,
				"width": self.src_width,
				"height": self.src_height
			},
			"destination": {
				"map_id": self.dst_map_id,
				"map_name": self.dst_map_name,
				"x": self.dst_x,
				"y": self.dst_y,
				"layer": self.dst_layer,
				"facing": self.dst_facing
			},
			"warp_type": self.warp_type.name,
			"trigger_type": self.trigger_type.name,
			"flags": self._flags_to_list()
		}

		if self.condition:
			result["condition"] = self.condition.to_dict()

		if WarpFlag.REQUIRES_KEY in self.flags or WarpFlag.LOCKED in self.flags:
			result["key"] = {
				"id": self.key_id,
				"name": self.key_name
			}

		if self.transition_type:
			result["transition_type"] = self.transition_type
		if self.sound_id:
			result["sound_id"] = self.sound_id

		if self.return_warp_id:
			result["return_warp_id"] = self.return_warp_id

		if self.rom_address:
			result["rom_address"] = f"0x{self.rom_address:06X}"
		if self.data_size:
			result["data_size"] = self.data_size

		return result

	def _flags_to_list(self) -> List[str]:
		"""Convert flags to list."""
		result = []
		for flag in WarpFlag:
			if flag != WarpFlag.NONE and (self.flags & flag):
				result.append(flag.name)
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "WarpPoint":
		"""Create from dictionary."""
		warp = cls()
		warp.id = data.get("id", 0)
		warp.name = data.get("name", "")

		src = data.get("source", {})
		warp.src_map_id = src.get("map_id", 0)
		warp.src_map_name = src.get("map_name", "")
		warp.src_x = src.get("x", 0)
		warp.src_y = src.get("y", 0)
		warp.src_layer = src.get("layer", 0)
		warp.src_width = src.get("width", 1)
		warp.src_height = src.get("height", 1)

		dst = data.get("destination", {})
		warp.dst_map_id = dst.get("map_id", 0)
		warp.dst_map_name = dst.get("map_name", "")
		warp.dst_x = dst.get("x", 0)
		warp.dst_y = dst.get("y", 0)
		warp.dst_layer = dst.get("layer", 0)
		warp.dst_facing = dst.get("facing", 0)

		warp.warp_type = WarpType[data.get("warp_type", "DOOR")]
		warp.trigger_type = TriggerType[data.get("trigger_type", "STEP")]

		flags = WarpFlag.NONE
		for fname in data.get("flags", []):
			flags |= WarpFlag[fname]
		warp.flags = flags

		if "condition" in data:
			warp.condition = WarpCondition.from_dict(data["condition"])

		key = data.get("key", {})
		warp.key_id = key.get("id", 0)
		warp.key_name = key.get("name", "")

		warp.transition_type = data.get("transition_type", 0)
		warp.sound_id = data.get("sound_id", 0)
		warp.return_warp_id = data.get("return_warp_id", 0)

		if data.get("rom_address"):
			warp.rom_address = int(data["rom_address"], 16)
		warp.data_size = data.get("data_size", 0)

		return warp

	def get_source_str(self) -> str:
		"""Get source location string."""
		map_name = self.src_map_name or f"Map {self.src_map_id}"
		return f"{map_name} ({self.src_x},{self.src_y})"

	def get_dest_str(self) -> str:
		"""Get destination location string."""
		map_name = self.dst_map_name or f"Map {self.dst_map_id}"
		return f"{map_name} ({self.dst_x},{self.dst_y})"


class WarpDatabase:
	"""Database of warp points."""

	def __init__(self):
		self.warps: Dict[int, WarpPoint] = {}
		self.next_id: int = 1

	def add(self, warp: WarpPoint) -> int:
		"""Add warp to database."""
		if warp.id == 0:
			warp.id = self.next_id

		self.warps[warp.id] = warp
		self.next_id = max(self.next_id, warp.id + 1)
		return warp.id

	def get(self, warp_id: int) -> Optional[WarpPoint]:
		"""Get warp by ID."""
		return self.warps.get(warp_id)

	def delete(self, warp_id: int) -> bool:
		"""Delete warp."""
		if warp_id in self.warps:
			del self.warps[warp_id]
			return True
		return False

	def get_by_source_map(self, map_id: int) -> List[WarpPoint]:
		"""Get all warps from a source map."""
		return [w for w in self.warps.values() if w.src_map_id == map_id]

	def get_by_dest_map(self, map_id: int) -> List[WarpPoint]:
		"""Get all warps to a destination map."""
		return [w for w in self.warps.values() if w.dst_map_id == map_id]

	def get_by_type(self, warp_type: WarpType) -> List[WarpPoint]:
		"""Get all warps of a type."""
		return [w for w in self.warps.values() if w.warp_type == warp_type]

	def find_at_position(self, map_id: int, x: int, y: int) -> Optional[WarpPoint]:
		"""Find warp at a specific position."""
		for warp in self.warps.values():
			if warp.src_map_id != map_id:
				continue
			if (warp.src_x <= x < warp.src_x + warp.src_width and
				warp.src_y <= y < warp.src_y + warp.src_height):
				return warp
		return None

	def create_two_way(self, warp: WarpPoint) -> Tuple[int, int]:
		"""Create a two-way warp pair."""
		# Add forward warp
		warp.flags |= WarpFlag.TWO_WAY
		warp_id = self.add(warp)

		# Create return warp
		return_warp = WarpPoint(
			name=f"Return: {warp.name}",
			src_map_id=warp.dst_map_id,
			src_map_name=warp.dst_map_name,
			src_x=warp.dst_x,
			src_y=warp.dst_y,
			src_layer=warp.dst_layer,
			dst_map_id=warp.src_map_id,
			dst_map_name=warp.src_map_name,
			dst_x=warp.src_x,
			dst_y=warp.src_y,
			dst_layer=warp.src_layer,
			warp_type=warp.warp_type,
			trigger_type=warp.trigger_type,
			flags=WarpFlag.TWO_WAY
		)
		return_id = self.add(return_warp)

		# Link them
		warp.return_warp_id = return_id
		return_warp.return_warp_id = warp_id

		return warp_id, return_id

	def to_json(self) -> str:
		"""Export to JSON."""
		data = {
			"warps": [w.to_dict() for w in sorted(self.warps.values(), key=lambda x: x.id)]
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

			self.warps.clear()
			for warp_data in data.get("warps", []):
				warp = WarpPoint.from_dict(warp_data)
				self.add(warp)

			return True
		except Exception as e:
			print(f"Error loading: {e}")
			return False

	def format_list(self, warps: List[WarpPoint] = None) -> str:
		"""Format warp list."""
		if warps is None:
			warps = list(self.warps.values())

		lines = []
		lines.append(f"{'ID':>4} {'Type':<12} {'Source':<25} {'Dest':<25}")
		lines.append("-" * 70)

		for warp in sorted(warps, key=lambda x: (x.src_map_id, x.src_y, x.src_x)):
			src = warp.get_source_str()[:25]
			dst = warp.get_dest_str()[:25]
			lines.append(
				f"{warp.id:>4} {warp.warp_type.name:<12} {src:<25} {dst:<25}"
			)

		return "\n".join(lines)

	def format_detail(self, warp_id: int) -> str:
		"""Format warp detail."""
		warp = self.get(warp_id)
		if not warp:
			return f"Warp {warp_id} not found"

		lines = []
		lines.append(f"=== Warp {warp.id}: {warp.name or 'Unnamed'} ===")
		lines.append(f"Type: {warp.warp_type.name}")
		lines.append(f"Trigger: {warp.trigger_type.name}")
		lines.append("")
		lines.append(f"Source: {warp.get_source_str()}")
		if warp.src_width > 1 or warp.src_height > 1:
			lines.append(f"  Size: {warp.src_width}x{warp.src_height}")
		lines.append("")
		lines.append(f"Destination: {warp.get_dest_str()}")
		if warp.dst_facing:
			directions = {0: "Down", 1: "Up", 2: "Left", 3: "Right"}
			lines.append(f"  Facing: {directions.get(warp.dst_facing, warp.dst_facing)}")
		lines.append("")

		flags = warp._flags_to_list()
		if flags:
			lines.append(f"Flags: {', '.join(flags)}")

		if WarpFlag.REQUIRES_KEY in warp.flags or WarpFlag.LOCKED in warp.flags:
			lines.append(f"Key: {warp.key_name or f'Key {warp.key_id}'}")

		if warp.condition:
			lines.append("Condition:")
			cond = warp.condition
			if cond.flag_id:
				lines.append(f"  Flag {cond.flag_id} = {cond.flag_value}")
			if cond.item_id:
				lines.append(f"  Requires Item {cond.item_id}")
			if cond.min_level:
				lines.append(f"  Min Level: {cond.min_level}")
			if cond.time_start != 0 or cond.time_end != 24:
				lines.append(f"  Time: {cond.time_start}:00 - {cond.time_end}:00")

		if warp.return_warp_id:
			lines.append(f"Return Warp: #{warp.return_warp_id}")

		return "\n".join(lines)


def create_sample_database() -> WarpDatabase:
	"""Create sample warp database."""
	db = WarpDatabase()

	# Town door
	town_door = WarpPoint(
		id=1, name="Inn Door",
		src_map_id=0, src_map_name="Town", src_x=10, src_y=5,
		dst_map_id=1, dst_map_name="Inn", dst_x=5, dst_y=8,
		warp_type=WarpType.DOOR,
		trigger_type=TriggerType.ACTION,
		flags=WarpFlag.TWO_WAY
	)
	db.add(town_door)

	# Inn exit (return)
	inn_exit = WarpPoint(
		id=2, name="Inn Exit",
		src_map_id=1, src_map_name="Inn", src_x=5, src_y=9,
		dst_map_id=0, dst_map_name="Town", dst_x=10, dst_y=6,
		warp_type=WarpType.DOOR,
		trigger_type=TriggerType.STEP,
		flags=WarpFlag.TWO_WAY,
		return_warp_id=1
	)
	db.add(inn_exit)
	town_door.return_warp_id = 2

	# Cave entrance
	cave_entrance = WarpPoint(
		id=3, name="Cave Entrance",
		src_map_id=0, src_map_name="Overworld", src_x=50, src_y=30,
		dst_map_id=10, dst_map_name="Cave B1", dst_x=20, dst_y=3,
		warp_type=WarpType.CAVE_ENTRANCE,
		trigger_type=TriggerType.STEP,
		flags=WarpFlag.TWO_WAY
	)
	db.add(cave_entrance)

	# Stairs down
	stairs_down = WarpPoint(
		id=4, name="Cave B1 to B2",
		src_map_id=10, src_map_name="Cave B1", src_x=30, src_y=25,
		dst_map_id=11, dst_map_name="Cave B2", dst_x=5, dst_y=5,
		warp_type=WarpType.STAIRS_DOWN,
		trigger_type=TriggerType.STEP,
		flags=WarpFlag.TWO_WAY
	)
	db.add(stairs_down)

	# Teleport spell destination
	teleport = WarpPoint(
		id=5, name="Return Teleport",
		src_map_id=0, src_map_name="Anywhere", src_x=0, src_y=0,
		dst_map_id=0, dst_map_name="Town", dst_x=15, dst_y=10,
		warp_type=WarpType.TELEPORT,
		trigger_type=TriggerType.AUTOMATIC,
		flags=WarpFlag.REQUIRES_MAGIC
	)
	db.add(teleport)

	# Locked door
	locked_door = WarpPoint(
		id=6, name="Treasure Room",
		src_map_id=5, src_map_name="Castle", src_x=40, src_y=20,
		dst_map_id=6, dst_map_name="Treasury", dst_x=5, dst_y=10,
		warp_type=WarpType.DOOR,
		trigger_type=TriggerType.ACTION,
		flags=WarpFlag.LOCKED | WarpFlag.REQUIRES_KEY,
		key_id=50, key_name="Treasury Key"
	)
	db.add(locked_door)

	# One-way boss room
	boss_room = WarpPoint(
		id=7, name="Boss Chamber",
		src_map_id=15, src_map_name="Tower Top", src_x=10, src_y=5,
		dst_map_id=16, dst_map_name="Boss Arena", dst_x=20, dst_y=25,
		warp_type=WarpType.DOOR,
		trigger_type=TriggerType.STEP,
		flags=WarpFlag.ONE_WAY | WarpFlag.BOSS_ROOM | WarpFlag.SAVE_POINT,
		transition_type=2
	)
	db.add(boss_room)

	# Hidden passage
	hidden = WarpPoint(
		id=8, name="Secret Path",
		src_map_id=5, src_map_name="Castle", src_x=25, src_y=15,
		dst_map_id=7, dst_map_name="Secret Room", dst_x=3, dst_y=3,
		warp_type=WarpType.HIDDEN,
		trigger_type=TriggerType.ACTION,
		flags=WarpFlag.TWO_WAY
	)
	db.add(hidden)

	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Warp Point Editor")
	parser.add_argument("input", nargs="?", help="Warp database file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all warps")
	parser.add_argument("--detail", "-d", type=int,
						help="View warp details by ID")
	parser.add_argument("--map", "-m", type=int,
						help="Filter by source map ID")
	parser.add_argument("--type", "-t",
						help="Filter by warp type")
	parser.add_argument("--sample", action="store_true",
						help="Create sample database")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")
	parser.add_argument("--output", "-o",
						help="Output file")

	# Edit options
	parser.add_argument("--add", action="store_true",
						help="Add new warp")
	parser.add_argument("--edit", "-e", type=int,
						help="Edit warp by ID")
	parser.add_argument("--delete", type=int,
						help="Delete warp by ID")
	parser.add_argument("--src", nargs=3, type=int, metavar=("MAP", "X", "Y"),
						help="Set source location")
	parser.add_argument("--dst", nargs=3, type=int, metavar=("MAP", "X", "Y"),
						help="Set destination location")
	parser.add_argument("--two-way", action="store_true",
						help="Create two-way warp pair")

	args = parser.parse_args()

	if not args.input and not args.sample:
		print("Warp Point Editor")
		print()
		print("Usage: python warp_editor.py <warps.json> [options]")
		print()
		print("Options:")
		print("  --view, -v          View all warps")
		print("  --detail, -d ID     View warp details")
		print("  --map, -m ID        Filter by source map")
		print("  --type, -t TYPE     Filter by type")
		print("  --sample            Create sample database")
		print("  --json, -j          Output as JSON")
		print("  --output, -o FILE   Output file")
		print()
		print("Edit Options:")
		print("  --add               Add new warp")
		print("  --edit, -e ID       Edit warp")
		print("  --delete ID         Delete warp")
		print("  --src MAP X Y       Set source location")
		print("  --dst MAP X Y       Set destination")
		print("  --two-way           Create two-way pair")
		print()
		print("Warp Types: DOOR, STAIRS_UP, STAIRS_DOWN, TELEPORT, CAVE_ENTRANCE, etc.")
		return

	# Create sample
	if args.sample:
		db = create_sample_database()
		out_file = args.output or "warps_sample.json"
		if db.save(out_file):
			print(f"Created sample database: {out_file}")
		return

	# Load database
	db = WarpDatabase()
	if os.path.exists(args.input):
		db.load(args.input)

	# View
	if args.view:
		warps = None
		if args.map is not None:
			warps = db.get_by_source_map(args.map)
		elif args.type:
			try:
				wtype = WarpType[args.type.upper()]
				warps = db.get_by_type(wtype)
			except KeyError:
				print(f"Unknown warp type: {args.type}")
				return

		if args.json:
			print(db.to_json())
		else:
			print(db.format_list(warps))
		return

	# Detail
	if args.detail:
		print(db.format_detail(args.detail))
		return

	# Map filter view
	if args.map is not None and not args.add and args.edit is None:
		warps = db.get_by_source_map(args.map)
		print(db.format_list(warps))
		return

	# Add
	if args.add:
		warp = WarpPoint()
		if args.src:
			warp.src_map_id, warp.src_x, warp.src_y = args.src
		if args.dst:
			warp.dst_map_id, warp.dst_x, warp.dst_y = args.dst

		if args.two_way:
			warp_id, return_id = db.create_two_way(warp)
			print(f"Added two-way warp pair: {warp_id} <-> {return_id}")
		else:
			warp_id = db.add(warp)
			print(f"Added warp ID: {warp_id}")

	# Edit
	if args.edit:
		warp = db.get(args.edit)
		if not warp:
			print(f"Warp {args.edit} not found")
			return

		if args.src:
			warp.src_map_id, warp.src_x, warp.src_y = args.src
		if args.dst:
			warp.dst_map_id, warp.dst_x, warp.dst_y = args.dst

		print(f"Updated warp {args.edit}")

	# Delete
	if args.delete:
		if db.delete(args.delete):
			print(f"Deleted warp {args.delete}")
		else:
			print(f"Warp {args.delete} not found")
			return

	# Save if modified
	if args.add or args.edit or args.delete:
		out_file = args.output or args.input
		if db.save(out_file):
			print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
