#!/usr/bin/env python3
"""
Spell/Ability Database - Manage magic spells and special abilities.

Comprehensive database for tracking spells, skills, abilities,
and their effects for RPG games.

Usage:
	python spell_database.py <database.json>
	python spell_database.py --search "fire"
	python spell_database.py --analyze

Features:
	- Search and filter spells
	- Analyze MP costs and damage
	- Track learners and levels
	- Effect documentation
	- Balance analysis
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class SpellType(Enum):
	"""Types of spells/abilities."""
	ATTACK = auto()
	HEAL = auto()
	BUFF = auto()
	DEBUFF = auto()
	STATUS = auto()
	SUPPORT = auto()
	FIELD = auto()  # Field/exploration spells
	SUMMON = auto()
	SPECIAL = auto()


class TargetType(Enum):
	"""Spell targeting types."""
	SELF = auto()
	SINGLE_ALLY = auto()
	ALL_ALLIES = auto()
	SINGLE_ENEMY = auto()
	ALL_ENEMIES = auto()
	ALL = auto()
	DEAD_ALLY = auto()


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
class SpellEffect:
	"""An effect a spell can have."""
	effect_type: str  # "damage", "heal", "status", "buff", etc.
	value: int = 0
	formula: str = ""  # e.g., "INT * 2 + 10"
	chance: float = 1.0  # Success rate
	duration: int = 0  # Turns (0 = instant)
	stat: str = ""  # For buffs/debuffs
	status: str = ""  # Status effect name
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"type": self.effect_type}
		
		if self.value:
			result["value"] = self.value
		if self.formula:
			result["formula"] = self.formula
		if self.chance < 1.0:
			result["chance"] = f"{self.chance:.0%}"
		if self.duration:
			result["duration"] = self.duration
		if self.stat:
			result["stat"] = self.stat
		if self.status:
			result["status"] = self.status
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "SpellEffect":
		"""Create from dictionary."""
		chance = data.get("chance", "100%")
		if isinstance(chance, str):
			chance = float(chance.strip("%")) / 100
		
		return cls(
			effect_type=data["type"],
			value=data.get("value", 0),
			formula=data.get("formula", ""),
			chance=chance,
			duration=data.get("duration", 0),
			stat=data.get("stat", ""),
			status=data.get("status", "")
		)


@dataclass
class SpellLearner:
	"""Who can learn a spell and at what level."""
	character: str
	learn_level: int = 1
	learn_method: str = "level"  # level, item, quest, etc.
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"character": self.character}
		if self.learn_level > 1:
			result["level"] = self.learn_level
		if self.learn_method != "level":
			result["method"] = self.learn_method
		return result


@dataclass
class Spell:
	"""A magic spell or ability."""
	spell_id: int
	name: str
	spell_type: SpellType
	mp_cost: int = 0
	target: TargetType = TargetType.SINGLE_ENEMY
	element: Element = Element.NONE
	effects: List[SpellEffect] = field(default_factory=list)
	learners: List[SpellLearner] = field(default_factory=list)
	description: str = ""
	animation_id: int = 0
	can_reflect: bool = False
	ignores_defense: bool = False
	notes: str = ""
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.spell_id,
			"name": self.name,
			"type": self.spell_type.name,
			"mp": self.mp_cost,
			"target": self.target.name
		}
		
		if self.element != Element.NONE:
			result["element"] = self.element.name
		if self.effects:
			result["effects"] = [e.to_dict() for e in self.effects]
		if self.learners:
			result["learners"] = [l.to_dict() for l in self.learners]
		if self.description:
			result["description"] = self.description
		if self.animation_id:
			result["animation"] = self.animation_id
		if self.can_reflect:
			result["reflect"] = True
		if self.ignores_defense:
			result["ignores_defense"] = True
		if self.notes:
			result["notes"] = self.notes
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Spell":
		"""Create from dictionary."""
		effects = [SpellEffect.from_dict(e) for e in data.get("effects", [])]
		
		learners = []
		for l in data.get("learners", []):
			learners.append(SpellLearner(
				character=l["character"],
				learn_level=l.get("level", 1),
				learn_method=l.get("method", "level")
			))
		
		return cls(
			spell_id=data["id"],
			name=data["name"],
			spell_type=SpellType[data["type"]],
			mp_cost=data.get("mp", 0),
			target=TargetType[data.get("target", "SINGLE_ENEMY")],
			element=Element[data.get("element", "NONE")],
			effects=effects,
			learners=learners,
			description=data.get("description", ""),
			animation_id=data.get("animation", 0),
			can_reflect=data.get("reflect", False),
			ignores_defense=data.get("ignores_defense", False),
			notes=data.get("notes", "")
		)
	
	def get_primary_damage(self) -> int:
		"""Get primary damage value."""
		for effect in self.effects:
			if effect.effect_type == "damage":
				return effect.value
		return 0


class SpellDatabase:
	"""Database of spells and abilities."""
	
	def __init__(self):
		self.spells: Dict[int, Spell] = {}
		self.metadata: Dict[str, Any] = {}
	
	def add_spell(self, spell: Spell) -> None:
		"""Add spell to database."""
		self.spells[spell.spell_id] = spell
	
	def get_spell(self, spell_id: int) -> Optional[Spell]:
		"""Get spell by ID."""
		return self.spells.get(spell_id)
	
	def get_by_name(self, name: str) -> Optional[Spell]:
		"""Get spell by name (case-insensitive)."""
		name_lower = name.lower()
		for spell in self.spells.values():
			if spell.name.lower() == name_lower:
				return spell
		return None
	
	def search(self, query: str) -> List[Spell]:
		"""Search spells by name or description."""
		query_lower = query.lower()
		results = []
		
		for spell in self.spells.values():
			if query_lower in spell.name.lower():
				results.append(spell)
			elif query_lower in spell.description.lower():
				results.append(spell)
		
		return results
	
	def filter_by_type(self, spell_type: SpellType) -> List[Spell]:
		"""Get all spells of a type."""
		return [s for s in self.spells.values()
				if s.spell_type == spell_type]
	
	def filter_by_element(self, element: Element) -> List[Spell]:
		"""Get all spells of an element."""
		return [s for s in self.spells.values()
				if s.element == element]
	
	def filter_by_learner(self, character: str) -> List[Spell]:
		"""Get spells learnable by a character."""
		char_lower = character.lower()
		results = []
		
		for spell in self.spells.values():
			for learner in spell.learners:
				if char_lower in learner.character.lower():
					results.append(spell)
					break
		
		return results
	
	def get_spell_progression(self, character: str) -> List[Tuple[int, Spell]]:
		"""Get spells in order of learning for a character."""
		char_lower = character.lower()
		progression = []
		
		for spell in self.spells.values():
			for learner in spell.learners:
				if char_lower in learner.character.lower():
					progression.append((learner.learn_level, spell))
					break
		
		progression.sort(key=lambda x: x[0])
		return progression
	
	def analyze(self) -> Dict[str, Any]:
		"""Analyze spell database."""
		if not self.spells:
			return {}
		
		analysis = {
			"count": len(self.spells),
			"type_counts": {},
			"element_counts": {},
			"mp_analysis": {},
			"damage_analysis": {},
			"efficiency": []
		}
		
		# Count by type
		for spell_type in SpellType:
			spells = self.filter_by_type(spell_type)
			if spells:
				analysis["type_counts"][spell_type.name] = len(spells)
		
		# Count by element
		for element in Element:
			spells = self.filter_by_element(element)
			if spells:
				analysis["element_counts"][element.name] = len(spells)
		
		# MP cost analysis
		mp_costs = [s.mp_cost for s in self.spells.values() if s.mp_cost > 0]
		if mp_costs:
			analysis["mp_analysis"] = {
				"min": min(mp_costs),
				"max": max(mp_costs),
				"avg": sum(mp_costs) / len(mp_costs)
			}
		
		# Damage analysis for attack spells
		attack_spells = self.filter_by_type(SpellType.ATTACK)
		if attack_spells:
			damages = [s.get_primary_damage() for s in attack_spells if s.get_primary_damage() > 0]
			if damages:
				analysis["damage_analysis"] = {
					"min": min(damages),
					"max": max(damages),
					"avg": sum(damages) / len(damages)
				}
		
		# Efficiency (damage per MP)
		for spell in attack_spells:
			if spell.mp_cost > 0 and spell.get_primary_damage() > 0:
				efficiency = spell.get_primary_damage() / spell.mp_cost
				analysis["efficiency"].append({
					"spell": spell.name,
					"damage": spell.get_primary_damage(),
					"mp": spell.mp_cost,
					"efficiency": round(efficiency, 2)
				})
		
		analysis["efficiency"].sort(key=lambda x: x["efficiency"], reverse=True)
		analysis["efficiency"] = analysis["efficiency"][:10]
		
		return analysis
	
	def load(self, filepath: str) -> None:
		"""Load database from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for spell_data in data.get("spells", []):
			spell = Spell.from_dict(spell_data)
			self.add_spell(spell)
	
	def save(self, filepath: str) -> None:
		"""Save database to JSON file."""
		data = {
			"metadata": self.metadata,
			"spells": [s.to_dict() for s in self.spells.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)
	
	def export_markdown(self, filepath: str) -> None:
		"""Export as Markdown document."""
		with open(filepath, "w", encoding="utf-8") as f:
			f.write("# Spell Database\n\n")
			
			for spell_type in SpellType:
				spells = self.filter_by_type(spell_type)
				if not spells:
					continue
				
				f.write(f"## {spell_type.name.title()} Spells\n\n")
				f.write("| ID | Name | MP | Target | Element | Description |\n")
				f.write("|:---|:-----|---:|:-------|:--------|:------------|\n")
				
				for spell in sorted(spells, key=lambda x: x.spell_id):
					elem = spell.element.name if spell.element != Element.NONE else "-"
					desc = spell.description[:30] + "..." if len(spell.description) > 30 else spell.description
					f.write(f"| {spell.spell_id} | {spell.name} | {spell.mp_cost} | "
						   f"{spell.target.name} | {elem} | {desc} |\n")
				
				f.write("\n")


def create_example_database() -> SpellDatabase:
	"""Create example database."""
	db = SpellDatabase()
	db.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Attack spells
	db.add_spell(Spell(
		spell_id=1, name="Fire",
		spell_type=SpellType.ATTACK,
		mp_cost=4, target=TargetType.SINGLE_ENEMY,
		element=Element.FIRE,
		effects=[SpellEffect("damage", 30, "INT * 1.5")],
		learners=[SpellLearner("Mage", 1), SpellLearner("Hero", 8)],
		description="Deals fire damage to one enemy"
	))
	
	db.add_spell(Spell(
		spell_id=2, name="Firaga",
		spell_type=SpellType.ATTACK,
		mp_cost=20, target=TargetType.ALL_ENEMIES,
		element=Element.FIRE,
		effects=[SpellEffect("damage", 120, "INT * 3")],
		learners=[SpellLearner("Mage", 25)],
		description="Deals heavy fire damage to all enemies"
	))
	
	db.add_spell(Spell(
		spell_id=3, name="Blizzard",
		spell_type=SpellType.ATTACK,
		mp_cost=5, target=TargetType.SINGLE_ENEMY,
		element=Element.ICE,
		effects=[SpellEffect("damage", 35)],
		learners=[SpellLearner("Mage", 4)],
		description="Deals ice damage to one enemy"
	))
	
	db.add_spell(Spell(
		spell_id=4, name="Thunder",
		spell_type=SpellType.ATTACK,
		mp_cost=6, target=TargetType.SINGLE_ENEMY,
		element=Element.THUNDER,
		effects=[SpellEffect("damage", 40)],
		learners=[SpellLearner("Mage", 7)],
		description="Deals lightning damage to one enemy"
	))
	
	# Heal spells
	db.add_spell(Spell(
		spell_id=10, name="Heal",
		spell_type=SpellType.HEAL,
		mp_cost=3, target=TargetType.SINGLE_ALLY,
		effects=[SpellEffect("heal", 50, "WIS * 2")],
		learners=[SpellLearner("Healer", 1), SpellLearner("Hero", 5)],
		description="Restores HP to one ally"
	))
	
	db.add_spell(Spell(
		spell_id=11, name="Healall",
		spell_type=SpellType.HEAL,
		mp_cost=10, target=TargetType.ALL_ALLIES,
		effects=[SpellEffect("heal", 80)],
		learners=[SpellLearner("Healer", 15)],
		description="Restores HP to all allies"
	))
	
	db.add_spell(Spell(
		spell_id=12, name="Revive",
		spell_type=SpellType.HEAL,
		mp_cost=15, target=TargetType.DEAD_ALLY,
		effects=[SpellEffect("revive", 0, chance=0.75)],
		learners=[SpellLearner("Healer", 20)],
		description="Attempt to revive a fallen ally"
	))
	
	# Buff spells
	db.add_spell(Spell(
		spell_id=20, name="Protect",
		spell_type=SpellType.BUFF,
		mp_cost=4, target=TargetType.SINGLE_ALLY,
		effects=[SpellEffect("buff", 25, stat="defense", duration=5)],
		learners=[SpellLearner("Healer", 8)],
		description="Increases defense for 5 turns"
	))
	
	db.add_spell(Spell(
		spell_id=21, name="Haste",
		spell_type=SpellType.BUFF,
		mp_cost=8, target=TargetType.SINGLE_ALLY,
		effects=[SpellEffect("buff", 50, stat="speed", duration=3)],
		learners=[SpellLearner("Mage", 12)],
		description="Increases speed for 3 turns"
	))
	
	# Status spells
	db.add_spell(Spell(
		spell_id=30, name="Sleep",
		spell_type=SpellType.STATUS,
		mp_cost=5, target=TargetType.SINGLE_ENEMY,
		effects=[SpellEffect("status", status="Sleep", chance=0.6, duration=3)],
		learners=[SpellLearner("Mage", 10)],
		description="Attempt to put an enemy to sleep"
	))
	
	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Spell Database Manager")
	parser.add_argument("database", nargs="?", help="Database JSON file")
	parser.add_argument("--search", "-s", help="Search for spells")
	parser.add_argument("--type", "-t", choices=[t.name for t in SpellType],
						help="Filter by type")
	parser.add_argument("--element", "-e", choices=[e.name for e in Element],
						help="Filter by element")
	parser.add_argument("--character", "-c", help="Show spells for character")
	parser.add_argument("--progression", "-p", help="Show spell progression for character")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze database")
	parser.add_argument("--export", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example database")
	
	args = parser.parse_args()
	
	db = SpellDatabase()
	
	if args.create_example:
		db = create_example_database()
		output = args.database or "spells.json"
		db.save(output)
		print(f"Created example database: {output}")
		print(f"Spells: {len(db.spells)}")
		return
	
	if args.database:
		if os.path.exists(args.database):
			db.load(args.database)
			print(f"Loaded: {args.database}")
			print(f"Spells: {len(db.spells)}")
		else:
			print(f"Database not found: {args.database}")
			print("Use --create-example to create a new database")
			return
	else:
		# Demo mode
		db = create_example_database()
		print("Spell Database Manager")
		print()
		print("Usage: python spell_database.py <database.json>")
		print()
		print("Demo mode - using example data:")
	
	print()
	
	# Search
	if args.search:
		results = db.search(args.search)
		print(f"Search results for '{args.search}':")
		for spell in results:
			elem = f" [{spell.element.name}]" if spell.element != Element.NONE else ""
			print(f"  [{spell.spell_id}] {spell.name}{elem} - MP:{spell.mp_cost}")
		print()
	
	# Filter by type
	if args.type:
		spell_type = SpellType[args.type]
		spells = db.filter_by_type(spell_type)
		print(f"{spell_type.name} spells ({len(spells)}):")
		for spell in spells:
			print(f"  [{spell.spell_id}] {spell.name} - MP:{spell.mp_cost}")
		print()
	
	# Filter by element
	if args.element:
		element = Element[args.element]
		spells = db.filter_by_element(element)
		print(f"{element.name} spells ({len(spells)}):")
		for spell in spells:
			print(f"  [{spell.spell_id}] {spell.name} - MP:{spell.mp_cost}")
		print()
	
	# Filter by character
	if args.character:
		spells = db.filter_by_learner(args.character)
		print(f"Spells for '{args.character}' ({len(spells)}):")
		for spell in spells:
			print(f"  [{spell.spell_id}] {spell.name} - MP:{spell.mp_cost}")
		print()
	
	# Show progression
	if args.progression:
		progression = db.get_spell_progression(args.progression)
		print(f"Spell progression for '{args.progression}':")
		for level, spell in progression:
			print(f"  Lv{level:2d}: {spell.name} (MP:{spell.mp_cost})")
		print()
	
	# Analyze
	if args.analyze:
		analysis = db.analyze()
		
		print("Database Analysis:")
		print()
		
		print("Spells by type:")
		for stype, count in analysis.get("type_counts", {}).items():
			print(f"  {stype}: {count}")
		print()
		
		print("Spells by element:")
		for elem, count in analysis.get("element_counts", {}).items():
			print(f"  {elem}: {count}")
		print()
		
		if analysis.get("mp_analysis"):
			mp = analysis["mp_analysis"]
			print(f"MP cost range: {mp['min']}-{mp['max']} (avg: {mp['avg']:.1f})")
		
		if analysis.get("damage_analysis"):
			dmg = analysis["damage_analysis"]
			print(f"Damage range: {dmg['min']}-{dmg['max']} (avg: {dmg['avg']:.1f})")
		print()
		
		if analysis.get("efficiency"):
			print("Most efficient attack spells (damage per MP):")
			for spell in analysis["efficiency"][:5]:
				print(f"  {spell['spell']}: {spell['efficiency']} "
					  f"({spell['damage']} dmg / {spell['mp']} MP)")
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
