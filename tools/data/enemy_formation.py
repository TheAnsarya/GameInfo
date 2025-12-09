#!/usr/bin/env python3
"""
Enemy Formation Editor - Edit encounter formations and battle groups.

Tools for defining enemy formations, encounter rates, and
battle configurations for RPGs.

Usage:
	python enemy_formation.py game.json --view
	python enemy_formation.py --edit formation_id
	python enemy_formation.py --export

Features:
	- Formation editing
	- Position layout
	- Encounter rates
	- Boss battles
	- Group AI
"""

import argparse
import json
import os
import struct
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class FormationType(Enum):
	"""Types of battle formations."""
	NORMAL = auto()        # Random encounter
	BOSS = auto()          # Boss battle
	SCRIPTED = auto()      # Story event
	AMBUSH = auto()        # Preemptive enemy
	SURPRISE = auto()      # Preemptive player
	FIXED = auto()         # Fixed encounter


class AIPattern(Enum):
	"""Enemy AI patterns."""
	RANDOM = auto()        # Random actions
	AGGRESSIVE = auto()    # Focus attacks
	DEFENSIVE = auto()     # Use defense/heal
	SUPPORT = auto()       # Buff allies
	SCRIPTED = auto()      # Follow script
	ADAPTIVE = auto()      # React to situation


@dataclass
class EnemySlot:
	"""An enemy in a formation."""
	enemy_id: int
	x: int = 0
	y: int = 0
	level_mod: int = 0
	hp_mod: int = 0
	flags: int = 0

	# Flags
	is_hidden: bool = False
	is_boss: bool = False
	can_escape: bool = True

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"enemy_id": self.enemy_id,
			"x": self.x,
			"y": self.y,
			"level_mod": self.level_mod,
			"hp_mod": self.hp_mod,
			"flags": self.flags,
			"is_hidden": self.is_hidden,
			"is_boss": self.is_boss,
			"can_escape": self.can_escape
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EnemySlot":
		"""Create from dictionary."""
		return cls(
			enemy_id=data.get("enemy_id", 0),
			x=data.get("x", 0),
			y=data.get("y", 0),
			level_mod=data.get("level_mod", 0),
			hp_mod=data.get("hp_mod", 0),
			flags=data.get("flags", 0),
			is_hidden=data.get("is_hidden", False),
			is_boss=data.get("is_boss", False),
			can_escape=data.get("can_escape", True)
		)


@dataclass
class Formation:
	"""Battle formation."""
	id: int
	name: str
	form_type: FormationType = FormationType.NORMAL
	enemies: List[EnemySlot] = field(default_factory=list)

	# Battle properties
	escape_rate: int = 50        # Percent chance to escape
	surprise_rate: int = 0       # Chance of preemptive
	ambush_rate: int = 0         # Chance of being ambushed

	# Rewards
	exp_bonus: int = 0
	gold_bonus: int = 0
	drop_rate_bonus: int = 0

	# Battle settings
	background_id: int = 0
	music_id: int = 0
	can_escape: bool = True
	can_use_items: bool = True
	can_run_first_turn: bool = False

	# AI
	ai_pattern: AIPattern = AIPattern.RANDOM
	ai_script_id: int = 0

	def enemy_count(self) -> int:
		"""Get number of enemies."""
		return len(self.enemies)

	def get_positions(self) -> List[Tuple[int, int]]:
		"""Get all enemy positions."""
		return [(e.x, e.y) for e in self.enemies]

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"type": self.form_type.name,
			"enemies": [e.to_dict() for e in self.enemies],
			"escape_rate": self.escape_rate,
			"surprise_rate": self.surprise_rate,
			"ambush_rate": self.ambush_rate,
			"exp_bonus": self.exp_bonus,
			"gold_bonus": self.gold_bonus,
			"drop_rate_bonus": self.drop_rate_bonus,
			"background_id": self.background_id,
			"music_id": self.music_id,
			"can_escape": self.can_escape,
			"can_use_items": self.can_use_items,
			"can_run_first_turn": self.can_run_first_turn,
			"ai_pattern": self.ai_pattern.name,
			"ai_script_id": self.ai_script_id
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Formation":
		"""Create from dictionary."""
		enemies = [EnemySlot.from_dict(e) for e in data.get("enemies", [])]

		return cls(
			id=data.get("id", 0),
			name=data.get("name", ""),
			form_type=FormationType[data.get("type", "NORMAL")],
			enemies=enemies,
			escape_rate=data.get("escape_rate", 50),
			surprise_rate=data.get("surprise_rate", 0),
			ambush_rate=data.get("ambush_rate", 0),
			exp_bonus=data.get("exp_bonus", 0),
			gold_bonus=data.get("gold_bonus", 0),
			drop_rate_bonus=data.get("drop_rate_bonus", 0),
			background_id=data.get("background_id", 0),
			music_id=data.get("music_id", 0),
			can_escape=data.get("can_escape", True),
			can_use_items=data.get("can_use_items", True),
			can_run_first_turn=data.get("can_run_first_turn", False),
			ai_pattern=AIPattern[data.get("ai_pattern", "RANDOM")],
			ai_script_id=data.get("ai_script_id", 0)
		)


@dataclass
class EncounterZone:
	"""Zone encounter configuration."""
	id: int
	name: str
	formations: List[int] = field(default_factory=list)  # Formation IDs
	weights: List[int] = field(default_factory=list)     # Encounter weights

	base_rate: int = 8           # Steps between checks
	min_steps: int = 1           # Minimum before encounter
	max_steps: int = 255         # Maximum before forced

	danger_level: int = 0        # Zone danger level

	def get_total_weight(self) -> int:
		"""Get total encounter weight."""
		return sum(self.weights)

	def get_formation_chance(self, form_id: int) -> float:
		"""Get chance of specific formation."""
		total = self.get_total_weight()
		if total == 0:
			return 0.0

		for i, fid in enumerate(self.formations):
			if fid == form_id and i < len(self.weights):
				return self.weights[i] / total * 100
		return 0.0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"formations": self.formations,
			"weights": self.weights,
			"base_rate": self.base_rate,
			"min_steps": self.min_steps,
			"max_steps": self.max_steps,
			"danger_level": self.danger_level
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EncounterZone":
		"""Create from dictionary."""
		return cls(
			id=data.get("id", 0),
			name=data.get("name", ""),
			formations=data.get("formations", []),
			weights=data.get("weights", []),
			base_rate=data.get("base_rate", 8),
			min_steps=data.get("min_steps", 1),
			max_steps=data.get("max_steps", 255),
			danger_level=data.get("danger_level", 0)
		)


class FormationManager:
	"""Manage enemy formations."""

	def __init__(self):
		self.formations: Dict[int, Formation] = {}
		self.zones: Dict[int, EncounterZone] = {}
		self.enemy_names: Dict[int, str] = {}

	def add_formation(self, formation: Formation) -> None:
		"""Add formation."""
		self.formations[formation.id] = formation

	def get_formation(self, form_id: int) -> Optional[Formation]:
		"""Get formation by ID."""
		return self.formations.get(form_id)

	def add_zone(self, zone: EncounterZone) -> None:
		"""Add encounter zone."""
		self.zones[zone.id] = zone

	def get_zone(self, zone_id: int) -> Optional[EncounterZone]:
		"""Get zone by ID."""
		return self.zones.get(zone_id)

	def get_formations_with_enemy(self, enemy_id: int) -> List[Formation]:
		"""Get all formations containing an enemy."""
		return [f for f in self.formations.values()
				if any(e.enemy_id == enemy_id for e in f.enemies)]

	def get_boss_formations(self) -> List[Formation]:
		"""Get all boss formations."""
		return [f for f in self.formations.values()
				if f.form_type == FormationType.BOSS]

	def create_formation(self, form_id: int, name: str,
						 enemy_ids: List[int]) -> Formation:
		"""Create a simple formation."""
		enemies = []

		# Default positions in a line
		for i, eid in enumerate(enemy_ids):
			slot = EnemySlot(
				enemy_id=eid,
				x=40 + i * 24,
				y=32 + (i % 2) * 16
			)
			enemies.append(slot)

		formation = Formation(
			id=form_id,
			name=name,
			enemies=enemies
		)

		self.add_formation(formation)
		return formation

	def load_enemy_names(self, filepath: str) -> None:
		"""Load enemy name lookup."""
		with open(filepath, "r") as f:
			data = json.load(f)

		if isinstance(data, list):
			for i, entry in enumerate(data):
				if isinstance(entry, dict):
					self.enemy_names[entry.get("id", i)] = entry.get("name", f"Enemy {i}")
				else:
					self.enemy_names[i] = str(entry)
		elif isinstance(data, dict):
			for key, value in data.items():
				self.enemy_names[int(key)] = str(value)

	def get_enemy_name(self, enemy_id: int) -> str:
		"""Get enemy name."""
		return self.enemy_names.get(enemy_id, f"Enemy #{enemy_id}")

	def format_formation(self, form_id: int) -> str:
		"""Format formation for display."""
		formation = self.formations.get(form_id)
		if not formation:
			return f"Formation {form_id}: Not found"

		lines = [
			f"Formation {formation.id}: {formation.name}",
			f"  Type: {formation.form_type.name}",
			f"  Escape Rate: {formation.escape_rate}%",
			"  Enemies:"
		]

		for i, slot in enumerate(formation.enemies):
			name = self.get_enemy_name(slot.enemy_id)
			pos = f"({slot.x}, {slot.y})"
			flags = []
			if slot.is_boss:
				flags.append("BOSS")
			if slot.is_hidden:
				flags.append("HIDDEN")
			flag_str = f" [{', '.join(flags)}]" if flags else ""
			lines.append(f"    {i + 1}. {name} at {pos}{flag_str}")

		return "\n".join(lines)

	def save(self, filepath: str) -> None:
		"""Save formations and zones."""
		data = {
			"formations": [f.to_dict() for f in self.formations.values()],
			"zones": [z.to_dict() for z in self.zones.values()],
			"enemy_names": self.enemy_names
		}

		with open(filepath, "w") as f:
			json.dump(data, f, indent="\t")

	def load(self, filepath: str) -> None:
		"""Load formations and zones."""
		with open(filepath, "r") as f:
			data = json.load(f)

		self.formations = {}
		for f_data in data.get("formations", []):
			formation = Formation.from_dict(f_data)
			self.formations[formation.id] = formation

		self.zones = {}
		for z_data in data.get("zones", []):
			zone = EncounterZone.from_dict(z_data)
			self.zones[zone.id] = zone

		self.enemy_names = {}
		names_data = data.get("enemy_names", {})
		for key, value in names_data.items():
			self.enemy_names[int(key)] = str(value)


class FormationBinaryReader:
	"""Read formations from binary ROM data."""

	def __init__(self, data: bytes):
		self.data = data

	def read_nes_formation(self, address: int, enemy_count: int = 4) -> Formation:
		"""Read NES-style formation (simple format)."""
		enemies = []

		for i in range(enemy_count):
			enemy_id = self.data[address + i] if address + i < len(self.data) else 0
			if enemy_id > 0:  # 0 often means empty slot
				slot = EnemySlot(
					enemy_id=enemy_id,
					x=32 + i * 32,
					y=48
				)
				enemies.append(slot)

		return Formation(
			id=address,
			name=f"Formation_{address:04X}",
			enemies=enemies
		)

	def read_formation_table(self, address: int, entry_size: int,
							  count: int, enemy_slots: int = 4) -> List[Formation]:
		"""Read formation table."""
		formations = []

		for i in range(count):
			offset = address + i * entry_size
			formation = self.read_nes_formation(offset, enemy_slots)
			formation.id = i
			formation.name = f"Formation {i}"
			formations.append(formation)

		return formations


class FormationBinaryWriter:
	"""Write formations to binary format."""

	def __init__(self):
		self.output = bytearray()

	def write_nes_formation(self, formation: Formation, enemy_slots: int = 4) -> bytes:
		"""Write NES-style formation."""
		output = bytearray(enemy_slots)

		for i in range(min(len(formation.enemies), enemy_slots)):
			output[i] = formation.enemies[i].enemy_id & 0xFF

		return bytes(output)

	def write_all(self, formations: List[Formation], enemy_slots: int = 4) -> bytes:
		"""Write all formations."""
		self.output = bytearray()

		for formation in sorted(formations, key=lambda f: f.id):
			self.output.extend(self.write_nes_formation(formation, enemy_slots))

		return bytes(self.output)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Enemy Formation Editor")
	parser.add_argument("input", nargs="?", help="Input file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View formations")
	parser.add_argument("--formation", "-f", type=int,
						help="Formation ID to view/edit")
	parser.add_argument("--list", "-l", action="store_true",
						help="List all formations")
	parser.add_argument("--bosses", action="store_true",
						help="List boss formations")
	parser.add_argument("--enemy", "-e", type=int,
						help="Find formations with enemy")
	parser.add_argument("--zone", "-z", type=int,
						help="View zone encounters")
	parser.add_argument("--enemies", help="Enemy names file")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--export-bin", action="store_true",
						help="Export to binary")
	parser.add_argument("--import-bin", action="store_true",
						help="Import from binary ROM")
	parser.add_argument("--address", "-a", type=lambda x: int(x, 0),
						help="Binary address")
	parser.add_argument("--count", "-c", type=int, default=64,
						help="Formation count")
	parser.add_argument("--slots", type=int, default=4,
						help="Enemy slots per formation")

	args = parser.parse_args()

	manager = FormationManager()

	# Load enemy names
	if args.enemies and os.path.exists(args.enemies):
		manager.load_enemy_names(args.enemies)

	# Load formations
	if args.input and os.path.exists(args.input):
		if args.import_bin:
			# Read binary
			with open(args.input, "rb") as f:
				rom_data = f.read()

			reader = FormationBinaryReader(rom_data)
			addr = args.address or 0
			formations = reader.read_formation_table(addr, args.slots, args.count, args.slots)

			for f in formations:
				manager.add_formation(f)

			print(f"Imported {len(formations)} formations from ROM")
		else:
			# Load JSON
			manager.load(args.input)
			print(f"Loaded {len(manager.formations)} formations")

	# View specific formation
	if args.formation is not None:
		print(manager.format_formation(args.formation))
		return

	# List all formations
	if args.list:
		print("Formations:")
		for fid in sorted(manager.formations.keys()):
			f = manager.formations[fid]
			enemy_count = len(f.enemies)
			print(f"  {fid:3}: {f.name:<30} ({enemy_count} enemies) - {f.form_type.name}")
		return

	# List boss formations
	if args.bosses:
		print("Boss Formations:")
		for f in manager.get_boss_formations():
			enemy_names = [manager.get_enemy_name(e.enemy_id) for e in f.enemies]
			print(f"  {f.id}: {f.name}")
			print(f"      Enemies: {', '.join(enemy_names)}")
		return

	# Find formations with enemy
	if args.enemy is not None:
		name = manager.get_enemy_name(args.enemy)
		print(f"Formations containing {name}:")

		for f in manager.get_formations_with_enemy(args.enemy):
			print(f"  {f.id}: {f.name}")
		return

	# View zone
	if args.zone is not None:
		zone = manager.get_zone(args.zone)
		if zone:
			print(f"Zone {zone.id}: {zone.name}")
			print(f"  Base Rate: 1/{zone.base_rate}")
			print(f"  Steps: {zone.min_steps}-{zone.max_steps}")
			print("  Formations:")
			for i, fid in enumerate(zone.formations):
				f = manager.get_formation(fid)
				weight = zone.weights[i] if i < len(zone.weights) else 0
				chance = zone.get_formation_chance(fid)
				name = f.name if f else "Unknown"
				print(f"    {fid}: {name} - {chance:.1f}% (weight: {weight})")
		return

	# Export binary
	if args.export_bin and args.output:
		writer = FormationBinaryWriter()
		binary = writer.write_all(list(manager.formations.values()), args.slots)

		with open(args.output, "wb") as f:
			f.write(binary)
		print(f"Exported {len(manager.formations)} formations to {args.output}")
		return

	# Save JSON
	if args.output:
		manager.save(args.output)
		print(f"Saved to {args.output}")
		return

	if not args.input:
		print("Enemy Formation Editor")
		print()
		print("Usage: python enemy_formation.py <input> [options]")
		print()
		print("Options:")
		print("  --view, -v           View formations")
		print("  --formation, -f ID   View/edit specific formation")
		print("  --list, -l           List all formations")
		print("  --bosses             List boss formations")
		print("  --enemy, -e ID       Find formations with enemy")
		print("  --zone, -z ID        View zone encounters")
		print("  --enemies FILE       Enemy names file")
		print("  --output, -o FILE    Output file")
		print("  --import-bin         Import from ROM binary")
		print("  --export-bin         Export to binary")
		print()
		print("Examples:")
		print("  View formation 5:")
		print("    python enemy_formation.py game.json -f 5")
		print()
		print("  Find formations with enemy 10:")
		print("    python enemy_formation.py game.json -e 10")


if __name__ == "__main__":
	main()
