#!/usr/bin/env python3
"""
Encounter Editor - Design random encounter tables and formations.

Tools for managing random battles, encounter rates, and
enemy party configurations.

Usage:
	python encounter_editor.py <encounters.json>
	python encounter_editor.py --zone "Forest"
	python encounter_editor.py --simulate

Features:
	- Zone-based encounter tables
	- Weighted probability system
	- Formation layouts
	- Step counter mechanics
	- Rate analysis
"""

import argparse
import json
import os
import random
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class TerrainType(Enum):
	"""Terrain categories."""
	FIELD = auto()
	FOREST = auto()
	MOUNTAIN = auto()
	DESERT = auto()
	SWAMP = auto()
	CAVE = auto()
	DUNGEON = auto()
	TOWER = auto()
	WATER = auto()
	SKY = auto()
	VOLCANO = auto()
	ICE = auto()
	CASTLE = auto()


class EncounterTime(Enum):
	"""Time of day for encounters."""
	ANY = auto()
	DAY = auto()
	NIGHT = auto()
	DAWN = auto()
	DUSK = auto()


class FormationPosition(Enum):
	"""Position in battle formation."""
	FRONT_LEFT = auto()
	FRONT_CENTER = auto()
	FRONT_RIGHT = auto()
	BACK_LEFT = auto()
	BACK_CENTER = auto()
	BACK_RIGHT = auto()
	FLYING = auto()


@dataclass
class EnemySlot:
	"""An enemy slot in a formation."""
	monster_id: str
	position: FormationPosition = FormationPosition.FRONT_CENTER
	count_min: int = 1
	count_max: int = 1
	level_mod: int = 0  # Level adjustment from base
	
	def roll_count(self) -> int:
		"""Roll number of this enemy."""
		return random.randint(self.count_min, self.count_max)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"monster": self.monster_id}
		if self.position != FormationPosition.FRONT_CENTER:
			result["position"] = self.position.name
		if self.count_max > 1 or self.count_min != 1:
			result["count"] = [self.count_min, self.count_max]
		if self.level_mod:
			result["level_mod"] = self.level_mod
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EnemySlot":
		"""Create from dictionary."""
		count = data.get("count", [1, 1])
		if isinstance(count, int):
			count = [count, count]
		
		return cls(
			monster_id=data["monster"],
			position=FormationPosition[data.get("position", "FRONT_CENTER")],
			count_min=count[0],
			count_max=count[1],
			level_mod=data.get("level_mod", 0)
		)


@dataclass
class Formation:
	"""A battle formation of enemies."""
	formation_id: str
	name: str = ""
	enemies: List[EnemySlot] = field(default_factory=list)
	boss: bool = False
	scripted: bool = False  # Fixed, not random
	ambush_chance: int = 0  # Percentage
	preemptive_chance: int = 0  # Percentage
	can_flee: bool = True
	background_id: str = ""
	music_id: str = ""
	
	def get_total_enemies(self) -> Tuple[int, int]:
		"""Get min/max total enemy count."""
		min_count = sum(e.count_min for e in self.enemies)
		max_count = sum(e.count_max for e in self.enemies)
		return min_count, max_count
	
	def get_unique_monsters(self) -> List[str]:
		"""Get list of unique monster IDs."""
		return list(set(e.monster_id for e in self.enemies))
	
	def roll_encounter(self) -> List[Tuple[str, int]]:
		"""Roll actual enemies for encounter."""
		result = []
		for slot in self.enemies:
			count = slot.roll_count()
			if count > 0:
				result.append((slot.monster_id, count))
		return result
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"id": self.formation_id}
		if self.name:
			result["name"] = self.name
		result["enemies"] = [e.to_dict() for e in self.enemies]
		if self.boss:
			result["boss"] = True
		if self.scripted:
			result["scripted"] = True
		if self.ambush_chance:
			result["ambush"] = self.ambush_chance
		if self.preemptive_chance:
			result["preemptive"] = self.preemptive_chance
		if not self.can_flee:
			result["can_flee"] = False
		if self.background_id:
			result["background"] = self.background_id
		if self.music_id:
			result["music"] = self.music_id
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Formation":
		"""Create from dictionary."""
		enemies = [EnemySlot.from_dict(e) for e in data.get("enemies", [])]
		
		return cls(
			formation_id=data["id"],
			name=data.get("name", ""),
			enemies=enemies,
			boss=data.get("boss", False),
			scripted=data.get("scripted", False),
			ambush_chance=data.get("ambush", 0),
			preemptive_chance=data.get("preemptive", 0),
			can_flee=data.get("can_flee", True),
			background_id=data.get("background", ""),
			music_id=data.get("music", "")
		)


@dataclass
class EncounterEntry:
	"""An entry in an encounter table."""
	formation_id: str
	weight: int = 10  # Relative probability
	time: EncounterTime = EncounterTime.ANY
	min_level: int = 0
	max_level: int = 99
	story_flag: str = ""  # Required flag
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"formation": self.formation_id}
		if self.weight != 10:
			result["weight"] = self.weight
		if self.time != EncounterTime.ANY:
			result["time"] = self.time.name
		if self.min_level:
			result["min_level"] = self.min_level
		if self.max_level < 99:
			result["max_level"] = self.max_level
		if self.story_flag:
			result["flag"] = self.story_flag
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EncounterEntry":
		"""Create from dictionary."""
		return cls(
			formation_id=data["formation"],
			weight=data.get("weight", 10),
			time=EncounterTime[data["time"]] if "time" in data else EncounterTime.ANY,
			min_level=data.get("min_level", 0),
			max_level=data.get("max_level", 99),
			story_flag=data.get("flag", "")
		)


@dataclass
class EncounterZone:
	"""A zone with its encounter table."""
	zone_id: str
	name: str
	terrain: TerrainType = TerrainType.FIELD
	base_rate: int = 32  # Steps between encounters (average)
	rate_variance: int = 16  # +/- variance
	entries: List[EncounterEntry] = field(default_factory=list)
	danger_level: int = 1
	no_encounters: bool = False  # Safe zone
	
	def get_step_range(self) -> Tuple[int, int]:
		"""Get min/max steps between encounters."""
		return (
			max(1, self.base_rate - self.rate_variance),
			self.base_rate + self.rate_variance
		)
	
	def roll_steps(self) -> int:
		"""Roll steps until next encounter."""
		min_steps, max_steps = self.get_step_range()
		return random.randint(min_steps, max_steps)
	
	def get_active_entries(self, time: EncounterTime = EncounterTime.ANY,
						   level: int = 1, flags: set = None) -> List[EncounterEntry]:
		"""Get entries active for current conditions."""
		flags = flags or set()
		active = []
		
		for entry in self.entries:
			# Check time
			if entry.time != EncounterTime.ANY and entry.time != time:
				continue
			
			# Check level
			if level < entry.min_level or level > entry.max_level:
				continue
			
			# Check flag
			if entry.story_flag and entry.story_flag not in flags:
				continue
			
			active.append(entry)
		
		return active
	
	def roll_encounter(self, time: EncounterTime = EncounterTime.ANY,
					   level: int = 1, flags: set = None) -> Optional[str]:
		"""Roll for encounter, return formation ID."""
		if self.no_encounters:
			return None
		
		active = self.get_active_entries(time, level, flags)
		if not active:
			return None
		
		# Weighted selection
		total_weight = sum(e.weight for e in active)
		roll = random.randint(1, total_weight)
		
		cumulative = 0
		for entry in active:
			cumulative += entry.weight
			if roll <= cumulative:
				return entry.formation_id
		
		return active[-1].formation_id
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.zone_id,
			"name": self.name,
			"terrain": self.terrain.name
		}
		
		if self.base_rate != 32:
			result["rate"] = self.base_rate
		if self.rate_variance != 16:
			result["variance"] = self.rate_variance
		if self.danger_level != 1:
			result["danger"] = self.danger_level
		if self.no_encounters:
			result["safe"] = True
		
		result["encounters"] = [e.to_dict() for e in self.entries]
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "EncounterZone":
		"""Create from dictionary."""
		entries = [EncounterEntry.from_dict(e) for e in data.get("encounters", [])]
		
		return cls(
			zone_id=data["id"],
			name=data["name"],
			terrain=TerrainType[data.get("terrain", "FIELD")],
			base_rate=data.get("rate", 32),
			rate_variance=data.get("variance", 16),
			entries=entries,
			danger_level=data.get("danger", 1),
			no_encounters=data.get("safe", False)
		)


class EncounterManager:
	"""Manage encounter system."""
	
	def __init__(self):
		self.formations: Dict[str, Formation] = {}
		self.zones: Dict[str, EncounterZone] = {}
		self.metadata: Dict[str, Any] = {}
	
	def add_formation(self, formation: Formation) -> None:
		"""Add formation."""
		self.formations[formation.formation_id] = formation
	
	def add_zone(self, zone: EncounterZone) -> None:
		"""Add zone."""
		self.zones[zone.zone_id] = zone
	
	def get_formation(self, formation_id: str) -> Optional[Formation]:
		"""Get formation by ID."""
		return self.formations.get(formation_id)
	
	def get_zone(self, zone_id: str) -> Optional[EncounterZone]:
		"""Get zone by ID."""
		return self.zones.get(zone_id)
	
	def get_zones_by_terrain(self, terrain: TerrainType) -> List[EncounterZone]:
		"""Get zones by terrain type."""
		return [z for z in self.zones.values() if z.terrain == terrain]
	
	def get_formation_usage(self, formation_id: str) -> List[str]:
		"""Get zones using a formation."""
		zones = []
		for zone in self.zones.values():
			for entry in zone.entries:
				if entry.formation_id == formation_id:
					zones.append(zone.zone_id)
					break
		return zones
	
	def simulate_zone(self, zone_id: str, steps: int = 1000,
					  time: EncounterTime = EncounterTime.ANY,
					  level: int = 1) -> Dict[str, int]:
		"""Simulate encounters in zone."""
		zone = self.get_zone(zone_id)
		if not zone or zone.no_encounters:
			return {}
		
		results = {}
		current_step = 0
		next_encounter = zone.roll_steps()
		
		while current_step < steps:
			current_step += 1
			
			if current_step >= next_encounter:
				formation_id = zone.roll_encounter(time, level)
				if formation_id:
					results[formation_id] = results.get(formation_id, 0) + 1
				next_encounter = current_step + zone.roll_steps()
		
		return results
	
	def analyze_balance(self) -> Dict[str, Any]:
		"""Analyze encounter balance."""
		analysis = {
			"total_formations": len(self.formations),
			"total_zones": len(self.zones),
			"unused_formations": [],
			"zone_stats": {}
		}
		
		# Find unused formations
		used = set()
		for zone in self.zones.values():
			for entry in zone.entries:
				used.add(entry.formation_id)
		
		analysis["unused_formations"] = [
			f for f in self.formations.keys() if f not in used
		]
		
		# Zone stats
		for zone in self.zones.values():
			total_weight = sum(e.weight for e in zone.entries)
			entry_probs = []
			
			for entry in zone.entries:
				prob = entry.weight / total_weight * 100 if total_weight else 0
				entry_probs.append((entry.formation_id, prob))
			
			analysis["zone_stats"][zone.zone_id] = {
				"terrain": zone.terrain.name,
				"danger": zone.danger_level,
				"rate": f"{zone.base_rate}±{zone.rate_variance}",
				"formations": len(zone.entries),
				"probabilities": entry_probs
			}
		
		return analysis
	
	def validate(self) -> List[str]:
		"""Validate encounter data."""
		issues = []
		
		for zone in self.zones.values():
			for entry in zone.entries:
				if entry.formation_id not in self.formations:
					issues.append(
						f"Zone '{zone.name}': Unknown formation '{entry.formation_id}'"
					)
		
		# Check for empty zones
		for zone in self.zones.values():
			if not zone.no_encounters and not zone.entries:
				issues.append(
					f"Zone '{zone.name}': No encounters defined"
				)
		
		# Check formation balance
		for formation in self.formations.values():
			if not formation.enemies:
				issues.append(
					f"Formation '{formation.formation_id}': No enemies defined"
				)
		
		return issues
	
	def load(self, filepath: str) -> None:
		"""Load from JSON."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for form_data in data.get("formations", []):
			formation = Formation.from_dict(form_data)
			self.add_formation(formation)
		
		for zone_data in data.get("zones", []):
			zone = EncounterZone.from_dict(zone_data)
			self.add_zone(zone)
	
	def save(self, filepath: str) -> None:
		"""Save to JSON."""
		data = {
			"metadata": self.metadata,
			"formations": [f.to_dict() for f in self.formations.values()],
			"zones": [z.to_dict() for z in self.zones.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)


def create_example_encounters() -> EncounterManager:
	"""Create example encounter data."""
	manager = EncounterManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Formations
	manager.add_formation(Formation(
		formation_id="slime-1",
		name="Slime x1-3",
		enemies=[
			EnemySlot("slime", FormationPosition.FRONT_CENTER, 1, 3)
		]
	))
	
	manager.add_formation(Formation(
		formation_id="slime-2",
		name="Slime Group",
		enemies=[
			EnemySlot("slime", FormationPosition.FRONT_LEFT, 1, 2),
			EnemySlot("slime", FormationPosition.FRONT_RIGHT, 1, 2),
			EnemySlot("slime", FormationPosition.BACK_CENTER, 0, 1)
		]
	))
	
	manager.add_formation(Formation(
		formation_id="goblin-1",
		name="Goblin x1-2",
		enemies=[
			EnemySlot("goblin", FormationPosition.FRONT_CENTER, 1, 2)
		]
	))
	
	manager.add_formation(Formation(
		formation_id="goblin-mixed",
		name="Goblin and Slimes",
		enemies=[
			EnemySlot("goblin", FormationPosition.BACK_CENTER, 1, 1),
			EnemySlot("slime", FormationPosition.FRONT_LEFT, 1, 2),
			EnemySlot("slime", FormationPosition.FRONT_RIGHT, 1, 2)
		]
	))
	
	manager.add_formation(Formation(
		formation_id="wolf-1",
		name="Wolf Pack",
		enemies=[
			EnemySlot("wolf", FormationPosition.FRONT_CENTER, 2, 4)
		],
		ambush_chance=15
	))
	
	manager.add_formation(Formation(
		formation_id="bat-1",
		name="Bat Swarm",
		enemies=[
			EnemySlot("bat", FormationPosition.FLYING, 3, 6)
		],
		preemptive_chance=20
	))
	
	manager.add_formation(Formation(
		formation_id="boss-forest",
		name="Forest Guardian",
		enemies=[
			EnemySlot("treant", FormationPosition.BACK_CENTER, 1, 1),
			EnemySlot("wolf", FormationPosition.FRONT_LEFT, 1, 1),
			EnemySlot("wolf", FormationPosition.FRONT_RIGHT, 1, 1)
		],
		boss=True,
		scripted=True,
		can_flee=False,
		music_id="boss_theme_1"
	))
	
	# Zones
	manager.add_zone(EncounterZone(
		zone_id="starting-field",
		name="Starting Plains",
		terrain=TerrainType.FIELD,
		base_rate=40,
		rate_variance=20,
		danger_level=1,
		entries=[
			EncounterEntry("slime-1", weight=20),
			EncounterEntry("slime-2", weight=10)
		]
	))
	
	manager.add_zone(EncounterZone(
		zone_id="east-forest",
		name="East Forest",
		terrain=TerrainType.FOREST,
		base_rate=30,
		rate_variance=15,
		danger_level=2,
		entries=[
			EncounterEntry("slime-1", weight=10),
			EncounterEntry("goblin-1", weight=15),
			EncounterEntry("goblin-mixed", weight=10),
			EncounterEntry("wolf-1", weight=5)
		]
	))
	
	manager.add_zone(EncounterZone(
		zone_id="forest-depths",
		name="Forest Depths",
		terrain=TerrainType.FOREST,
		base_rate=25,
		rate_variance=10,
		danger_level=3,
		entries=[
			EncounterEntry("goblin-mixed", weight=10),
			EncounterEntry("wolf-1", weight=15),
			EncounterEntry("bat-1", weight=10, time=EncounterTime.NIGHT)
		]
	))
	
	manager.add_zone(EncounterZone(
		zone_id="village",
		name="Village",
		terrain=TerrainType.FIELD,
		no_encounters=True
	))
	
	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Encounter Editor")
	parser.add_argument("datafile", nargs="?", help="Encounter JSON file")
	parser.add_argument("--list-zones", "-z", action="store_true",
						help="List all zones")
	parser.add_argument("--list-formations", "-f", action="store_true",
						help="List all formations")
	parser.add_argument("--zone", help="Show zone details")
	parser.add_argument("--simulate", "-s", nargs="?", const="starting-field",
						help="Simulate zone encounters")
	parser.add_argument("--steps", type=int, default=1000,
						help="Steps to simulate")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze encounter balance")
	parser.add_argument("--validate", "-v", action="store_true",
						help="Validate data")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")
	parser.add_argument("--export", "-e", help="Export to file")
	
	args = parser.parse_args()
	
	manager = EncounterManager()
	
	if args.create_example:
		manager = create_example_encounters()
		output = args.datafile or "encounters.json"
		manager.save(output)
		print(f"Created example database: {output}")
		return
	
	if args.datafile and os.path.exists(args.datafile):
		manager.load(args.datafile)
		print(f"Loaded: {args.datafile}")
	else:
		manager = create_example_encounters()
		print("Encounter Editor - Demo Mode")
	
	print(f"Formations: {len(manager.formations)}")
	print(f"Zones: {len(manager.zones)}")
	print()
	
	# List zones
	if args.list_zones:
		print("Encounter Zones:")
		for zone in manager.zones.values():
			safe = " (Safe)" if zone.no_encounters else ""
			print(f"  [{zone.zone_id}] {zone.name} ({zone.terrain.name}){safe}")
			if not zone.no_encounters:
				print(f"    Rate: {zone.base_rate}±{zone.rate_variance} steps, "
					  f"Danger: {zone.danger_level}")
		print()
	
	# List formations
	if args.list_formations:
		print("Battle Formations:")
		for form in manager.formations.values():
			min_e, max_e = form.get_total_enemies()
			monsters = ", ".join(form.get_unique_monsters())
			boss = " [BOSS]" if form.boss else ""
			print(f"  [{form.formation_id}] {monsters} ({min_e}-{max_e}){boss}")
		print()
	
	# Zone details
	if args.zone:
		zone = manager.get_zone(args.zone)
		if zone:
			print(f"Zone: {zone.name}")
			print(f"  Terrain: {zone.terrain.name}")
			print(f"  Danger Level: {zone.danger_level}")
			print(f"  Step Rate: {zone.base_rate}±{zone.rate_variance}")
			
			if zone.entries:
				total_weight = sum(e.weight for e in zone.entries)
				print(f"\n  Encounters ({len(zone.entries)}):")
				for entry in zone.entries:
					prob = entry.weight / total_weight * 100
					time_str = f" [{entry.time.name}]" if entry.time != EncounterTime.ANY else ""
					print(f"    {entry.formation_id}: {prob:.1f}%{time_str}")
		else:
			print(f"Zone not found: {args.zone}")
		print()
	
	# Simulate
	if args.simulate:
		zone = manager.get_zone(args.simulate)
		if zone and not zone.no_encounters:
			print(f"Simulating {args.steps} steps in {zone.name}...")
			results = manager.simulate_zone(args.simulate, args.steps)
			
			total = sum(results.values())
			print(f"\nEncounters: {total}")
			print(f"Rate: {args.steps / total:.1f} steps/encounter" if total else "None")
			print("\nFormation Distribution:")
			for form_id, count in sorted(results.items(), key=lambda x: -x[1]):
				pct = count / total * 100 if total else 0
				print(f"  {form_id}: {count} ({pct:.1f}%)")
		else:
			print(f"Cannot simulate zone: {args.simulate}")
		print()
	
	# Analyze
	if args.analyze:
		analysis = manager.analyze_balance()
		print("Balance Analysis:")
		print(f"  Total formations: {analysis['total_formations']}")
		print(f"  Total zones: {analysis['total_zones']}")
		
		if analysis["unused_formations"]:
			print(f"\n  Unused formations: {', '.join(analysis['unused_formations'])}")
		print()
	
	# Validate
	if args.validate:
		issues = manager.validate()
		if issues:
			print(f"Validation Issues ({len(issues)}):")
			for issue in issues:
				print(f"  - {issue}")
		else:
			print("No validation issues found")
		print()
	
	# Export
	if args.export:
		manager.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
