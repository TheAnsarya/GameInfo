#!/usr/bin/env python3
"""
Map Encounter Editor - Edit random encounter data for RPG maps.

Tools for editing encounter rates, enemy groups, and spawn zones
for retro RPG game maps.

Usage:
	python map_encounter.py encounters.json --view
	python map_encounter.py encounters.json --map 5 --rate 10
	python map_encounter.py --from-rom game.nes

Features:
	- Encounter rate editing
	- Enemy group assignment
	- Zone-based encounters
	- Terrain modifiers
	- Step counter mechanics
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class TerrainType(Enum):
	"""Terrain types affecting encounters."""
	NORMAL = 0
	GRASS = 1
	FOREST = 2
	SWAMP = 3
	DESERT = 4
	MOUNTAINS = 5
	SNOW = 6
	CAVE = 7
	DUNGEON = 8
	WATER = 9
	LAVA = 10
	ROAD = 11      # Usually reduced encounters


class TimeOfDay(Enum):
	"""Time of day affecting encounters."""
	ANY = 0
	DAY = 1
	NIGHT = 2
	DAWN = 3
	DUSK = 4


@dataclass
class EnemyGroup:
	"""A group of enemies that can appear together."""
	id: int = 0
	name: str = ""
	enemies: List[int] = field(default_factory=list)  # Enemy IDs
	enemy_names: List[str] = field(default_factory=list)  # For display
	min_count: int = 1
	max_count: int = 1
	weight: int = 1  # Relative probability

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"enemies": self.enemies,
			"enemy_names": self.enemy_names,
			"min_count": self.min_count,
			"max_count": self.max_count,
			"weight": self.weight
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EnemyGroup":
		"""Create from dictionary."""
		return cls(
			id=data.get("id", 0),
			name=data.get("name", ""),
			enemies=data.get("enemies", []),
			enemy_names=data.get("enemy_names", []),
			min_count=data.get("min_count", 1),
			max_count=data.get("max_count", 1),
			weight=data.get("weight", 1)
		)


@dataclass
class EncounterZone:
	"""A zone within a map with specific encounters."""
	id: int = 0
	name: str = ""
	x1: int = 0
	y1: int = 0
	x2: int = 0
	y2: int = 0
	enemy_groups: List[int] = field(default_factory=list)  # Group IDs
	encounter_rate: int = 10  # Base encounter rate (0-100)
	terrain_type: TerrainType = TerrainType.NORMAL
	time_restriction: TimeOfDay = TimeOfDay.ANY
	level_range: Tuple[int, int] = (1, 99)

	def contains(self, x: int, y: int) -> bool:
		"""Check if point is in zone."""
		return self.x1 <= x <= self.x2 and self.y1 <= y <= self.y2

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"bounds": {
				"x1": self.x1,
				"y1": self.y1,
				"x2": self.x2,
				"y2": self.y2
			},
			"enemy_groups": self.enemy_groups,
			"encounter_rate": self.encounter_rate,
			"terrain_type": self.terrain_type.name,
			"time_restriction": self.time_restriction.name,
			"level_range": list(self.level_range)
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EncounterZone":
		"""Create from dictionary."""
		bounds = data.get("bounds", {})
		return cls(
			id=data.get("id", 0),
			name=data.get("name", ""),
			x1=bounds.get("x1", 0),
			y1=bounds.get("y1", 0),
			x2=bounds.get("x2", 0),
			y2=bounds.get("y2", 0),
			enemy_groups=data.get("enemy_groups", []),
			encounter_rate=data.get("encounter_rate", 10),
			terrain_type=TerrainType[data.get("terrain_type", "NORMAL")],
			time_restriction=TimeOfDay[data.get("time_restriction", "ANY")],
			level_range=tuple(data.get("level_range", [1, 99]))
		)


@dataclass
class MapEncounterData:
	"""Encounter data for a single map."""
	map_id: int = 0
	map_name: str = ""

	# Global settings
	base_encounter_rate: int = 10     # Base rate (0-100)
	steps_between_checks: int = 1     # Steps between encounter checks
	min_steps: int = 0                # Minimum steps before encounter

	# Terrain modifiers
	terrain_modifiers: Dict[TerrainType, float] = field(default_factory=dict)

	# Zones
	zones: List[EncounterZone] = field(default_factory=list)

	# Default enemy groups (when not in a zone)
	default_groups: List[int] = field(default_factory=list)

	# Flags
	encounters_enabled: bool = True
	boss_zone_ids: List[int] = field(default_factory=list)  # Zones with bosses
	safe_zone_ids: List[int] = field(default_factory=list)  # No random encounters

	# ROM info
	rom_address: int = 0
	data_size: int = 0

	def get_zone_at(self, x: int, y: int) -> Optional[EncounterZone]:
		"""Get encounter zone at position."""
		for zone in self.zones:
			if zone.contains(x, y):
				return zone
		return None

	def calculate_encounter_rate(self, x: int, y: int,
								terrain: TerrainType = TerrainType.NORMAL,
								time: TimeOfDay = TimeOfDay.ANY) -> int:
		"""Calculate effective encounter rate at position."""
		# Check for safe zone
		zone = self.get_zone_at(x, y)
		if zone and zone.id in self.safe_zone_ids:
			return 0

		# Get base rate
		rate = zone.encounter_rate if zone else self.base_encounter_rate

		# Apply terrain modifier
		modifier = self.terrain_modifiers.get(terrain, 1.0)
		rate = int(rate * modifier)

		# Cap at 100
		return min(100, max(0, rate))

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"map_id": self.map_id,
			"map_name": self.map_name,
			"base_encounter_rate": self.base_encounter_rate,
			"steps_between_checks": self.steps_between_checks,
			"min_steps": self.min_steps,
			"terrain_modifiers": {t.name: v for t, v in self.terrain_modifiers.items()},
			"zones": [z.to_dict() for z in self.zones],
			"default_groups": self.default_groups,
			"encounters_enabled": self.encounters_enabled,
			"boss_zone_ids": self.boss_zone_ids,
			"safe_zone_ids": self.safe_zone_ids,
			"rom_address": f"0x{self.rom_address:06X}" if self.rom_address else None,
			"data_size": self.data_size if self.data_size else None
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "MapEncounterData":
		"""Create from dictionary."""
		result = cls(
			map_id=data.get("map_id", 0),
			map_name=data.get("map_name", ""),
			base_encounter_rate=data.get("base_encounter_rate", 10),
			steps_between_checks=data.get("steps_between_checks", 1),
			min_steps=data.get("min_steps", 0),
			default_groups=data.get("default_groups", []),
			encounters_enabled=data.get("encounters_enabled", True),
			boss_zone_ids=data.get("boss_zone_ids", []),
			safe_zone_ids=data.get("safe_zone_ids", [])
		)

		# Terrain modifiers
		for tname, value in data.get("terrain_modifiers", {}).items():
			result.terrain_modifiers[TerrainType[tname]] = value

		# Zones
		for zone_data in data.get("zones", []):
			result.zones.append(EncounterZone.from_dict(zone_data))

		if data.get("rom_address"):
			result.rom_address = int(data["rom_address"], 16)
		result.data_size = data.get("data_size", 0)

		return result


class MapEncounterDatabase:
	"""Database of map encounters."""

	def __init__(self):
		self.maps: Dict[int, MapEncounterData] = {}
		self.enemy_groups: Dict[int, EnemyGroup] = {}
		self.next_group_id: int = 1

	def add_map(self, map_data: MapEncounterData) -> int:
		"""Add map encounter data."""
		self.maps[map_data.map_id] = map_data
		return map_data.map_id

	def get_map(self, map_id: int) -> Optional[MapEncounterData]:
		"""Get map encounter data."""
		return self.maps.get(map_id)

	def add_enemy_group(self, group: EnemyGroup) -> int:
		"""Add enemy group."""
		if group.id == 0:
			group.id = self.next_group_id

		self.enemy_groups[group.id] = group
		self.next_group_id = max(self.next_group_id, group.id + 1)
		return group.id

	def get_enemy_group(self, group_id: int) -> Optional[EnemyGroup]:
		"""Get enemy group."""
		return self.enemy_groups.get(group_id)

	def to_json(self) -> str:
		"""Export to JSON."""
		data = {
			"enemy_groups": [g.to_dict() for g in sorted(
				self.enemy_groups.values(), key=lambda x: x.id
			)],
			"maps": [m.to_dict() for m in sorted(
				self.maps.values(), key=lambda x: x.map_id
			)]
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

			self.maps.clear()
			self.enemy_groups.clear()

			for group_data in data.get("enemy_groups", []):
				group = EnemyGroup.from_dict(group_data)
				self.add_enemy_group(group)

			for map_data in data.get("maps", []):
				encounter = MapEncounterData.from_dict(map_data)
				self.add_map(encounter)

			return True
		except Exception as e:
			print(f"Error loading: {e}")
			return False

	def format_map_list(self) -> str:
		"""Format map list."""
		lines = []
		lines.append(f"{'ID':>4} {'Name':<30} {'Rate':>5} {'Zones':>5} {'Groups':>6}")
		lines.append("-" * 55)

		for m in sorted(self.maps.values(), key=lambda x: x.map_id):
			group_count = len(m.default_groups) + sum(len(z.enemy_groups) for z in m.zones)
			lines.append(
				f"{m.map_id:>4} {m.map_name:<30} {m.base_encounter_rate:>5} "
				f"{len(m.zones):>5} {group_count:>6}"
			)

		return "\n".join(lines)

	def format_map_detail(self, map_id: int) -> str:
		"""Format map detail."""
		m = self.get_map(map_id)
		if not m:
			return f"Map {map_id} not found"

		lines = []
		lines.append(f"=== {m.map_name} (ID: {m.map_id}) ===")
		lines.append(f"Base Encounter Rate: {m.base_encounter_rate}%")
		lines.append(f"Steps Between Checks: {m.steps_between_checks}")
		lines.append(f"Minimum Steps: {m.min_steps}")
		lines.append(f"Encounters Enabled: {m.encounters_enabled}")
		lines.append("")

		if m.terrain_modifiers:
			lines.append("Terrain Modifiers:")
			for terrain, mod in m.terrain_modifiers.items():
				lines.append(f"  {terrain.name}: {mod:.1f}x")
			lines.append("")

		if m.default_groups:
			lines.append("Default Enemy Groups:")
			for gid in m.default_groups:
				group = self.get_enemy_group(gid)
				if group:
					lines.append(f"  [{gid}] {group.name}")
			lines.append("")

		if m.zones:
			lines.append("Encounter Zones:")
			for zone in m.zones:
				lines.append(f"  Zone {zone.id}: {zone.name}")
				lines.append(f"    Bounds: ({zone.x1},{zone.y1}) - ({zone.x2},{zone.y2})")
				lines.append(f"    Rate: {zone.encounter_rate}%")
				lines.append(f"    Terrain: {zone.terrain_type.name}")
				if zone.enemy_groups:
					lines.append("    Groups:")
					for gid in zone.enemy_groups:
						group = self.get_enemy_group(gid)
						if group:
							lines.append(f"      [{gid}] {group.name}")

		return "\n".join(lines)


def create_sample_database() -> MapEncounterDatabase:
	"""Create sample encounter database."""
	db = MapEncounterDatabase()

	# Enemy groups
	slime_group = EnemyGroup(
		id=1, name="Slimes",
		enemies=[1], enemy_names=["Slime"],
		min_count=1, max_count=4, weight=10
	)
	db.add_enemy_group(slime_group)

	ghost_group = EnemyGroup(
		id=2, name="Ghosts",
		enemies=[5, 6], enemy_names=["Ghost", "Specter"],
		min_count=1, max_count=3, weight=5
	)
	db.add_enemy_group(ghost_group)

	dragon_group = EnemyGroup(
		id=3, name="Dragons",
		enemies=[20], enemy_names=["Fire Dragon"],
		min_count=1, max_count=1, weight=1
	)
	db.add_enemy_group(dragon_group)

	# Maps
	overworld = MapEncounterData(
		map_id=0,
		map_name="Overworld",
		base_encounter_rate=8,
		steps_between_checks=4,
		min_steps=8,
		default_groups=[1],
		terrain_modifiers={
			TerrainType.ROAD: 0.5,
			TerrainType.GRASS: 1.0,
			TerrainType.FOREST: 1.5,
			TerrainType.SWAMP: 2.0
		}
	)

	# Add zones to overworld
	forest_zone = EncounterZone(
		id=1,
		name="Dark Forest",
		x1=50, y1=50, x2=100, y2=100,
		enemy_groups=[1, 2],
		encounter_rate=15,
		terrain_type=TerrainType.FOREST
	)
	overworld.zones.append(forest_zone)

	dragon_zone = EncounterZone(
		id=2,
		name="Dragon's Peak",
		x1=200, y1=10, x2=250, y2=50,
		enemy_groups=[3],
		encounter_rate=20,
		terrain_type=TerrainType.MOUNTAINS,
		level_range=(30, 99)
	)
	overworld.zones.append(dragon_zone)
	overworld.boss_zone_ids.append(2)

	# Town - safe zone
	town_zone = EncounterZone(
		id=3,
		name="Hometown",
		x1=10, y1=10, x2=30, y2=30,
		enemy_groups=[],
		encounter_rate=0
	)
	overworld.zones.append(town_zone)
	overworld.safe_zone_ids.append(3)

	db.add_map(overworld)

	# Cave
	cave = MapEncounterData(
		map_id=1,
		map_name="Cave of Trials",
		base_encounter_rate=12,
		steps_between_checks=2,
		min_steps=4,
		default_groups=[1, 2],
		terrain_modifiers={
			TerrainType.CAVE: 1.0
		}
	)
	db.add_map(cave)

	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Map Encounter Editor")
	parser.add_argument("input", nargs="?", help="Encounter data file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all maps")
	parser.add_argument("--map", "-m", type=int,
						help="Select map by ID")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")
	parser.add_argument("--sample", action="store_true",
						help="Create sample database")
	parser.add_argument("--output", "-o",
						help="Output file")

	# Edit options
	parser.add_argument("--rate", type=int,
						help="Set base encounter rate")
	parser.add_argument("--enable", action="store_true",
						help="Enable encounters")
	parser.add_argument("--disable", action="store_true",
						help="Disable encounters")

	args = parser.parse_args()

	if not args.input and not args.sample:
		print("Map Encounter Editor")
		print()
		print("Usage: python map_encounter.py <encounters.json> [options]")
		print()
		print("Options:")
		print("  --view, -v          View all maps")
		print("  --map, -m ID        Select map by ID")
		print("  --json, -j          Output as JSON")
		print("  --sample            Create sample database")
		print("  --output, -o FILE   Output file")
		print("  --rate NUM          Set base encounter rate")
		print("  --enable            Enable encounters")
		print("  --disable           Disable encounters")
		print()
		print("Examples:")
		print("  View all maps:")
		print("    python map_encounter.py encounters.json --view")
		print()
		print("  Set encounter rate:")
		print("    python map_encounter.py encounters.json --map 0 --rate 15")
		return

	# Create sample
	if args.sample:
		db = create_sample_database()
		out_file = args.output or "encounters_sample.json"
		if db.save(out_file):
			print(f"Created sample database: {out_file}")
		return

	# Load database
	db = MapEncounterDatabase()
	if os.path.exists(args.input):
		db.load(args.input)

	# View
	if args.view:
		if args.json:
			print(db.to_json())
		else:
			print(db.format_map_list())
		return

	# Map detail
	if args.map is not None:
		if args.rate is None and not args.enable and not args.disable:
			# Just view the map
			print(db.format_map_detail(args.map))
			return

		# Edit map
		m = db.get_map(args.map)
		if not m:
			print(f"Map {args.map} not found")
			return

		if args.rate is not None:
			m.base_encounter_rate = max(0, min(100, args.rate))
			print(f"Set encounter rate to {m.base_encounter_rate}%")

		if args.enable:
			m.encounters_enabled = True
			print("Encounters enabled")

		if args.disable:
			m.encounters_enabled = False
			print("Encounters disabled")

	# Save if modified
	if args.rate is not None or args.enable or args.disable:
		out_file = args.output or args.input
		if db.save(out_file):
			print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
