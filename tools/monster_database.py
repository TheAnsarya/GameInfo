#!/usr/bin/env python3
"""
Monster Database Manager - Manage enemy/monster databases for RPG games.

Provides tools for creating, editing, and analyzing monster data
including stats, drops, AI patterns, and encounter groups.

Usage:
	python monster_database.py <database.json>
	python monster_database.py --search "slime"
	python monster_database.py --analyze

Features:
	- Search and filter monsters
	- Analyze stat distributions
	- Track drops and locations
	- AI pattern documentation
	- Encounter group management
"""

import argparse
import json
import math
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class MonsterType(Enum):
	"""Monster categories."""
	NORMAL = auto()
	BOSS = auto()
	MINI_BOSS = auto()
	RARE = auto()
	UNDEAD = auto()
	DRAGON = auto()
	DEMON = auto()
	BEAST = auto()
	SLIME = auto()
	MACHINE = auto()
	HUMANOID = auto()
	ELEMENTAL = auto()


class Element(Enum):
	"""Elemental affinities."""
	NONE = auto()
	FIRE = auto()
	ICE = auto()
	THUNDER = auto()
	WIND = auto()
	WATER = auto()
	EARTH = auto()
	LIGHT = auto()
	DARK = auto()


@dataclass
class ItemDrop:
	"""Item drop information."""
	item_name: str
	item_id: int = 0
	drop_rate: float = 0.0  # 0.0-1.0
	steal_rate: float = 0.0
	quantity: int = 1
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"item": self.item_name,
		}
		if self.item_id:
			result["id"] = self.item_id
		if self.drop_rate:
			result["drop_rate"] = f"{self.drop_rate:.1%}"
		if self.steal_rate:
			result["steal_rate"] = f"{self.steal_rate:.1%}"
		if self.quantity > 1:
			result["quantity"] = self.quantity
		return result


@dataclass
class MonsterStats:
	"""Monster combat statistics."""
	hp: int = 0
	mp: int = 0
	attack: int = 0
	defense: int = 0
	magic_attack: int = 0
	magic_defense: int = 0
	speed: int = 0
	accuracy: int = 100
	evasion: int = 0
	crit_rate: int = 0
	
	def to_dict(self) -> Dict[str, int]:
		"""Convert to dictionary."""
		return {
			"hp": self.hp,
			"mp": self.mp,
			"attack": self.attack,
			"defense": self.defense,
			"magic_attack": self.magic_attack,
			"magic_defense": self.magic_defense,
			"speed": self.speed,
			"accuracy": self.accuracy,
			"evasion": self.evasion,
			"crit_rate": self.crit_rate
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, int]) -> "MonsterStats":
		"""Create from dictionary."""
		return cls(
			hp=data.get("hp", 0),
			mp=data.get("mp", 0),
			attack=data.get("attack", 0),
			defense=data.get("defense", 0),
			magic_attack=data.get("magic_attack", 0),
			magic_defense=data.get("magic_defense", 0),
			speed=data.get("speed", 0),
			accuracy=data.get("accuracy", 100),
			evasion=data.get("evasion", 0),
			crit_rate=data.get("crit_rate", 0)
		)


@dataclass
class AIPattern:
	"""Monster AI behavior pattern."""
	action: str
	probability: float = 0.0
	condition: str = ""
	target: str = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"action": self.action,
			"probability": f"{self.probability:.0%}"
		}
		if self.condition:
			result["condition"] = self.condition
		if self.target:
			result["target"] = self.target
		return result


@dataclass
class Monster:
	"""A game monster/enemy."""
	monster_id: int
	name: str
	monster_type: MonsterType = MonsterType.NORMAL
	stats: MonsterStats = field(default_factory=MonsterStats)
	exp_reward: int = 0
	gold_reward: int = 0
	element: Element = Element.NONE
	weaknesses: List[Element] = field(default_factory=list)
	resistances: List[Element] = field(default_factory=list)
	immunities: List[Element] = field(default_factory=list)
	status_immunities: List[str] = field(default_factory=list)
	drops: List[ItemDrop] = field(default_factory=list)
	skills: List[str] = field(default_factory=list)
	ai_patterns: List[AIPattern] = field(default_factory=list)
	locations: List[str] = field(default_factory=list)
	description: str = ""
	sprite_id: int = 0
	notes: str = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.monster_id,
			"name": self.name,
			"type": self.monster_type.name,
			"stats": self.stats.to_dict(),
			"exp": self.exp_reward,
			"gold": self.gold_reward
		}
		
		if self.element != Element.NONE:
			result["element"] = self.element.name
		if self.weaknesses:
			result["weaknesses"] = [e.name for e in self.weaknesses]
		if self.resistances:
			result["resistances"] = [e.name for e in self.resistances]
		if self.immunities:
			result["immunities"] = [e.name for e in self.immunities]
		if self.status_immunities:
			result["status_immunities"] = self.status_immunities
		if self.drops:
			result["drops"] = [d.to_dict() for d in self.drops]
		if self.skills:
			result["skills"] = self.skills
		if self.ai_patterns:
			result["ai"] = [p.to_dict() for p in self.ai_patterns]
		if self.locations:
			result["locations"] = self.locations
		if self.description:
			result["description"] = self.description
		if self.sprite_id:
			result["sprite_id"] = self.sprite_id
		if self.notes:
			result["notes"] = self.notes
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Monster":
		"""Create from dictionary."""
		drops = []
		for d in data.get("drops", []):
			drop_rate = d.get("drop_rate", "0%")
			if isinstance(drop_rate, str):
				drop_rate = float(drop_rate.strip("%")) / 100
			steal_rate = d.get("steal_rate", "0%")
			if isinstance(steal_rate, str):
				steal_rate = float(steal_rate.strip("%")) / 100
			drops.append(ItemDrop(
				item_name=d["item"],
				item_id=d.get("id", 0),
				drop_rate=drop_rate,
				steal_rate=steal_rate,
				quantity=d.get("quantity", 1)
			))
		
		ai_patterns = []
		for p in data.get("ai", []):
			prob = p.get("probability", "0%")
			if isinstance(prob, str):
				prob = float(prob.strip("%")) / 100
			ai_patterns.append(AIPattern(
				action=p["action"],
				probability=prob,
				condition=p.get("condition", ""),
				target=p.get("target", "")
			))
		
		return cls(
			monster_id=data["id"],
			name=data["name"],
			monster_type=MonsterType[data.get("type", "NORMAL")],
			stats=MonsterStats.from_dict(data.get("stats", {})),
			exp_reward=data.get("exp", 0),
			gold_reward=data.get("gold", 0),
			element=Element[data.get("element", "NONE")],
			weaknesses=[Element[e] for e in data.get("weaknesses", [])],
			resistances=[Element[e] for e in data.get("resistances", [])],
			immunities=[Element[e] for e in data.get("immunities", [])],
			status_immunities=data.get("status_immunities", []),
			drops=drops,
			skills=data.get("skills", []),
			ai_patterns=ai_patterns,
			locations=data.get("locations", []),
			description=data.get("description", ""),
			sprite_id=data.get("sprite_id", 0),
			notes=data.get("notes", "")
		)


@dataclass
class EncounterGroup:
	"""A group of monsters that can appear together."""
	group_id: int
	monsters: List[Tuple[int, int]]  # (monster_id, count)
	formation: str = ""  # e.g., "front", "surround"
	rate: float = 0.0
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.group_id,
			"monsters": [{"id": m[0], "count": m[1]} for m in self.monsters],
			"formation": self.formation,
			"rate": f"{self.rate:.1%}" if self.rate else ""
		}


class MonsterDatabase:
	"""Database of game monsters."""
	
	def __init__(self):
		self.monsters: Dict[int, Monster] = {}
		self.encounter_groups: List[EncounterGroup] = []
		self.metadata: Dict[str, Any] = {}
	
	def add_monster(self, monster: Monster) -> None:
		"""Add monster to database."""
		self.monsters[monster.monster_id] = monster
	
	def get_monster(self, monster_id: int) -> Optional[Monster]:
		"""Get monster by ID."""
		return self.monsters.get(monster_id)
	
	def get_by_name(self, name: str) -> Optional[Monster]:
		"""Get monster by name (case-insensitive)."""
		name_lower = name.lower()
		for monster in self.monsters.values():
			if monster.name.lower() == name_lower:
				return monster
		return None
	
	def search(self, query: str) -> List[Monster]:
		"""Search monsters by name or description."""
		query_lower = query.lower()
		results = []
		
		for monster in self.monsters.values():
			if query_lower in monster.name.lower():
				results.append(monster)
			elif query_lower in monster.description.lower():
				results.append(monster)
		
		return results
	
	def filter_by_type(self, monster_type: MonsterType) -> List[Monster]:
		"""Get all monsters of a type."""
		return [m for m in self.monsters.values()
				if m.monster_type == monster_type]
	
	def filter_by_location(self, location: str) -> List[Monster]:
		"""Get monsters found in a location."""
		location_lower = location.lower()
		return [m for m in self.monsters.values()
				if any(location_lower in loc.lower() for loc in m.locations)]
	
	def get_bosses(self) -> List[Monster]:
		"""Get all boss monsters."""
		return [m for m in self.monsters.values()
				if m.monster_type in [MonsterType.BOSS, MonsterType.MINI_BOSS]]
	
	def get_by_drop(self, item_name: str) -> List[Monster]:
		"""Find monsters that drop an item."""
		item_lower = item_name.lower()
		results = []
		for monster in self.monsters.values():
			for drop in monster.drops:
				if item_lower in drop.item_name.lower():
					results.append(monster)
					break
		return results
	
	def analyze_stats(self) -> Dict[str, Any]:
		"""Analyze stat distributions."""
		if not self.monsters:
			return {}
		
		analysis = {
			"count": len(self.monsters),
			"type_counts": {},
			"stat_ranges": {},
			"reward_analysis": {},
			"scaling_analysis": []
		}
		
		# Count by type
		for monster_type in MonsterType:
			monsters = self.filter_by_type(monster_type)
			if monsters:
				analysis["type_counts"][monster_type.name] = len(monsters)
		
		# Stat ranges
		stat_names = ["hp", "attack", "defense", "speed"]
		for stat in stat_names:
			values = [getattr(m.stats, stat) for m in self.monsters.values()]
			if values:
				analysis["stat_ranges"][stat] = {
					"min": min(values),
					"max": max(values),
					"avg": sum(values) / len(values),
					"median": sorted(values)[len(values) // 2]
				}
		
		# Reward analysis
		exp_values = [m.exp_reward for m in self.monsters.values() if m.exp_reward > 0]
		gold_values = [m.gold_reward for m in self.monsters.values() if m.gold_reward > 0]
		
		if exp_values:
			analysis["reward_analysis"]["exp"] = {
				"min": min(exp_values),
				"max": max(exp_values),
				"avg": sum(exp_values) / len(exp_values)
			}
		
		if gold_values:
			analysis["reward_analysis"]["gold"] = {
				"min": min(gold_values),
				"max": max(gold_values),
				"avg": sum(gold_values) / len(gold_values)
			}
		
		# Scaling analysis (HP vs rewards)
		monsters_by_hp = sorted(self.monsters.values(), key=lambda m: m.stats.hp)
		for i in range(0, len(monsters_by_hp), max(1, len(monsters_by_hp) // 5)):
			m = monsters_by_hp[i]
			analysis["scaling_analysis"].append({
				"name": m.name,
				"hp": m.stats.hp,
				"attack": m.stats.attack,
				"exp": m.exp_reward,
				"gold": m.gold_reward
			})
		
		return analysis
	
	def analyze_drops(self) -> Dict[str, Any]:
		"""Analyze drop rates and items."""
		analysis = {
			"monsters_with_drops": 0,
			"unique_items": set(),
			"drop_rate_ranges": {},
			"best_farming": []
		}
		
		for monster in self.monsters.values():
			if monster.drops:
				analysis["monsters_with_drops"] += 1
				for drop in monster.drops:
					analysis["unique_items"].add(drop.item_name)
		
		analysis["unique_items"] = len(analysis["unique_items"])
		
		# Find best monsters for farming (high drop rates)
		farming_candidates = []
		for monster in self.monsters.values():
			for drop in monster.drops:
				if drop.drop_rate >= 0.1:  # 10%+
					farming_candidates.append({
						"monster": monster.name,
						"item": drop.item_name,
						"rate": drop.drop_rate,
						"exp": monster.exp_reward
					})
		
		farming_candidates.sort(key=lambda x: x["rate"], reverse=True)
		analysis["best_farming"] = farming_candidates[:10]
		
		return analysis
	
	def load(self, filepath: str) -> None:
		"""Load database from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for monster_data in data.get("monsters", []):
			monster = Monster.from_dict(monster_data)
			self.add_monster(monster)
		
		# Load encounter groups
		for group_data in data.get("encounter_groups", []):
			monsters = [(m["id"], m["count"]) for m in group_data.get("monsters", [])]
			rate = group_data.get("rate", "0%")
			if isinstance(rate, str):
				rate = float(rate.strip("%")) / 100
			group = EncounterGroup(
				group_id=group_data["id"],
				monsters=monsters,
				formation=group_data.get("formation", ""),
				rate=rate
			)
			self.encounter_groups.append(group)
	
	def save(self, filepath: str) -> None:
		"""Save database to JSON file."""
		data = {
			"metadata": self.metadata,
			"monsters": [m.to_dict() for m in self.monsters.values()],
			"encounter_groups": [g.to_dict() for g in self.encounter_groups]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)
	
	def export_markdown(self, filepath: str) -> None:
		"""Export as Markdown document."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write("# Monster Database\n\n")
			
			# Regular monsters
			f.write("## Monsters\n\n")
			f.write("| ID | Name | HP | ATK | DEF | EXP | Gold |\n")
			f.write("|:---|:-----|---:|----:|----:|----:|-----:|\n")
			
			regular = [m for m in self.monsters.values()
					   if m.monster_type not in [MonsterType.BOSS, MonsterType.MINI_BOSS]]
			for m in sorted(regular, key=lambda x: x.monster_id):
				f.write(f"| {m.monster_id} | {m.name} | {m.stats.hp} | "
					   f"{m.stats.attack} | {m.stats.defense} | "
					   f"{m.exp_reward} | {m.gold_reward} |\n")
			f.write("\n")
			
			# Bosses
			bosses = self.get_bosses()
			if bosses:
				f.write("## Bosses\n\n")
				for boss in sorted(bosses, key=lambda x: x.monster_id):
					f.write(f"### {boss.name}\n\n")
					f.write(f"- **HP:** {boss.stats.hp}\n")
					f.write(f"- **Attack:** {boss.stats.attack}\n")
					f.write(f"- **Defense:** {boss.stats.defense}\n")
					f.write(f"- **EXP:** {boss.exp_reward}\n")
					if boss.weaknesses:
						f.write(f"- **Weaknesses:** {', '.join(e.name for e in boss.weaknesses)}\n")
					if boss.skills:
						f.write(f"- **Skills:** {', '.join(boss.skills)}\n")
					f.write("\n")


def create_example_database() -> MonsterDatabase:
	"""Create example database."""
	db = MonsterDatabase()
	db.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Basic monsters
	db.add_monster(Monster(
		monster_id=1, name="Slime",
		monster_type=MonsterType.SLIME,
		stats=MonsterStats(hp=10, attack=5, defense=3, speed=3),
		exp_reward=2, gold_reward=5,
		drops=[ItemDrop("Slime Jelly", drop_rate=0.25)],
		locations=["Starting Area", "Plains"]
	))
	
	db.add_monster(Monster(
		monster_id=2, name="Goblin",
		monster_type=MonsterType.HUMANOID,
		stats=MonsterStats(hp=30, attack=12, defense=8, speed=8),
		exp_reward=10, gold_reward=15,
		drops=[ItemDrop("Herb", drop_rate=0.15), ItemDrop("Gold Coin", drop_rate=0.10)],
		skills=["Tackle"],
		ai_patterns=[AIPattern("Attack", 0.7), AIPattern("Tackle", 0.3)],
		locations=["Forest", "Cave Entrance"]
	))
	
	db.add_monster(Monster(
		monster_id=3, name="Skeleton",
		monster_type=MonsterType.UNDEAD,
		stats=MonsterStats(hp=45, attack=18, defense=5, speed=6),
		exp_reward=20, gold_reward=25,
		weaknesses=[Element.FIRE, Element.LIGHT],
		status_immunities=["Poison", "Sleep"],
		drops=[ItemDrop("Bone", drop_rate=0.30)],
		locations=["Dungeon", "Graveyard"]
	))
	
	# Boss
	db.add_monster(Monster(
		monster_id=100, name="Dragon King",
		monster_type=MonsterType.BOSS,
		stats=MonsterStats(hp=5000, mp=500, attack=150, defense=100, magic_attack=120, speed=50),
		exp_reward=5000, gold_reward=10000,
		element=Element.FIRE,
		resistances=[Element.FIRE],
		weaknesses=[Element.ICE],
		skills=["Fire Breath", "Tail Swipe", "Roar"],
		ai_patterns=[
			AIPattern("Fire Breath", 0.4, "HP > 50%", "All"),
			AIPattern("Tail Swipe", 0.3, target="Random"),
			AIPattern("Roar", 0.15, "HP < 50%"),
			AIPattern("Attack", 0.15)
		],
		drops=[ItemDrop("Dragon Scale", drop_rate=1.0), ItemDrop("Dragon Fang", drop_rate=0.5)],
		locations=["Dragon's Lair"],
		description="The fearsome ruler of all dragons"
	))
	
	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Monster Database Manager")
	parser.add_argument("database", nargs="?", help="Database JSON file")
	parser.add_argument("--search", "-s", help="Search for monsters")
	parser.add_argument("--type", "-t", choices=[t.name for t in MonsterType],
						help="Filter by type")
	parser.add_argument("--location", "-l", help="Filter by location")
	parser.add_argument("--drops", help="Find monsters dropping item")
	parser.add_argument("--bosses", "-b", action="store_true",
						help="List all bosses")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze stats")
	parser.add_argument("--export", "-e", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")
	
	args = parser.parse_args()
	
	db = MonsterDatabase()
	
	if args.create_example:
		db = create_example_database()
		output = args.database or "monsters.json"
		db.save(output)
		print(f"Created example database: {output}")
		print(f"Monsters: {len(db.monsters)}")
		return
	
	if args.database:
		if os.path.exists(args.database):
			db.load(args.database)
			print(f"Loaded: {args.database}")
			print(f"Monsters: {len(db.monsters)}")
		else:
			print(f"Database not found: {args.database}")
			print("Use --create-example to create a new database")
			return
	else:
		# Demo mode
		db = create_example_database()
		print("Monster Database Manager")
		print()
		print("Usage: python monster_database.py <database.json>")
		print()
		print("Demo mode - using example data:")
	
	print()
	
	# Search
	if args.search:
		results = db.search(args.search)
		print(f"Search results for '{args.search}':")
		for m in results:
			print(f"  [{m.monster_id}] {m.name} - HP:{m.stats.hp} ATK:{m.stats.attack}")
		print()
	
	# Filter by type
	if args.type:
		monster_type = MonsterType[args.type]
		monsters = db.filter_by_type(monster_type)
		print(f"{monster_type.name} monsters ({len(monsters)}):")
		for m in monsters:
			print(f"  [{m.monster_id}] {m.name} - HP:{m.stats.hp}")
		print()
	
	# Filter by location
	if args.location:
		monsters = db.filter_by_location(args.location)
		print(f"Monsters in '{args.location}' ({len(monsters)}):")
		for m in monsters:
			print(f"  [{m.monster_id}] {m.name}")
		print()
	
	# Find by drop
	if args.drops:
		monsters = db.get_by_drop(args.drops)
		print(f"Monsters dropping '{args.drops}' ({len(monsters)}):")
		for m in monsters:
			for drop in m.drops:
				if args.drops.lower() in drop.item_name.lower():
					print(f"  [{m.monster_id}] {m.name} - {drop.drop_rate:.0%}")
		print()
	
	# List bosses
	if args.bosses:
		bosses = db.get_bosses()
		print(f"Bosses ({len(bosses)}):")
		for boss in bosses:
			print(f"  [{boss.monster_id}] {boss.name} - HP:{boss.stats.hp}")
		print()
	
	# Analyze
	if args.analyze:
		analysis = db.analyze_stats()
		
		print("Stat Analysis:")
		print()
		
		print("Monster counts by type:")
		for mtype, count in analysis.get("type_counts", {}).items():
			print(f"  {mtype}: {count}")
		print()
		
		print("Stat ranges:")
		for stat, ranges in analysis.get("stat_ranges", {}).items():
			print(f"  {stat}: {ranges['min']}-{ranges['max']} (avg: {ranges['avg']:.1f})")
		print()
		
		drop_analysis = db.analyze_drops()
		print(f"Monsters with drops: {drop_analysis['monsters_with_drops']}")
		print(f"Unique drop items: {drop_analysis['unique_items']}")
		
		if drop_analysis["best_farming"]:
			print("\nBest farming targets:")
			for farm in drop_analysis["best_farming"][:5]:
				print(f"  {farm['monster']}: {farm['item']} ({farm['rate']:.0%})")
		print()
	
	# Export
	if args.export:
		if args.export.endswith(".md"):
			db.export_markdown(args.export)
		else:
			db.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
