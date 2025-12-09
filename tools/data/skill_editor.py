#!/usr/bin/env python3
"""
Skill Editor - Edit RPG character skills and abilities.

Comprehensive editor for skill data including learning levels,
MP costs, effects, and targeting.

Usage:
	python skill_editor.py skills.json --view
	python skill_editor.py skills.json --add "Fireball"
	python skill_editor.py skills.json --edit 5 --mp 15

Features:
	- Skill properties
	- Learning requirements
	- MP/HP costs
	- Effect targeting
	- Animation data
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, Flag, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class SkillType(Enum):
	"""Types of skills."""
	ATTACK = 0        # Physical attack skill
	MAGIC = 1         # Magic spell
	SUPPORT = 2       # Buff/support
	HEAL = 3          # Healing
	DEBUFF = 4        # Enemy debuff
	FIELD = 5         # Field/utility spell
	SUMMON = 6        # Summon creature
	PASSIVE = 7       # Passive ability
	LIMIT = 8         # Limit break/special


class Element(Enum):
	"""Elemental types."""
	NONE = 0
	FIRE = 1
	ICE = 2
	LIGHTNING = 3
	WIND = 4
	EARTH = 5
	WATER = 6
	LIGHT = 7
	DARK = 8
	POISON = 9
	HOLY = 10


class TargetType(Enum):
	"""Skill targeting."""
	SELF = 0
	SINGLE_ALLY = 1
	ALL_ALLIES = 2
	SINGLE_ENEMY = 3
	ALL_ENEMIES = 4
	SINGLE_ANY = 5
	ALL = 6
	RANDOM_ENEMY = 7
	DEAD_ALLY = 8
	FIELD = 9


class StatusEffect(Flag):
	"""Status effects."""
	NONE = 0
	POISON = auto()
	SLEEP = auto()
	CONFUSE = auto()
	PARALYZE = auto()
	STONE = auto()
	BLIND = auto()
	SILENCE = auto()
	CURSE = auto()
	BERSERK = auto()
	REGEN = auto()
	PROTECT = auto()
	SHELL = auto()
	HASTE = auto()
	SLOW = auto()
	DEATH = auto()


class SkillFlag(Flag):
	"""Skill flags."""
	NONE = 0
	USABLE_BATTLE = auto()     # Can use in battle
	USABLE_FIELD = auto()      # Can use on field
	REFLECTABLE = auto()       # Can be reflected
	PIERCING = auto()          # Ignores defense
	DRAIN = auto()             # HP/MP drain
	MULTI_HIT = auto()         # Hits multiple times
	RANDOM_TARGET = auto()     # Random targeting
	ALWAYS_HIT = auto()        # Never misses
	COST_HP = auto()           # Costs HP instead of MP


@dataclass
class SkillEffect:
	"""Effect of a skill."""
	# Damage/Healing
	power: int = 0               # Base power
	formula_type: int = 0        # Damage formula
	variance: int = 0            # Damage variance %

	# Status
	inflict_status: StatusEffect = StatusEffect.NONE
	cure_status: StatusEffect = StatusEffect.NONE
	status_chance: int = 100     # % chance

	# Stat modification
	stat_mods: Dict[str, int] = field(default_factory=dict)  # STR: +10, etc.
	duration: int = 0            # Buff duration in turns

	# Special
	hp_percent: int = 0          # HP % damage/heal
	mp_percent: int = 0          # MP % damage/heal

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {}
		if self.power:
			result["power"] = self.power
		if self.formula_type:
			result["formula_type"] = self.formula_type
		if self.variance:
			result["variance"] = self.variance

		if self.inflict_status != StatusEffect.NONE:
			result["inflict_status"] = self._status_to_list(self.inflict_status)
			result["status_chance"] = self.status_chance
		if self.cure_status != StatusEffect.NONE:
			result["cure_status"] = self._status_to_list(self.cure_status)

		if self.stat_mods:
			result["stat_mods"] = self.stat_mods
		if self.duration:
			result["duration"] = self.duration

		if self.hp_percent:
			result["hp_percent"] = self.hp_percent
		if self.mp_percent:
			result["mp_percent"] = self.mp_percent

		return result

	def _status_to_list(self, status: StatusEffect) -> List[str]:
		"""Convert status flags to list."""
		result = []
		for s in StatusEffect:
			if s != StatusEffect.NONE and (status & s):
				result.append(s.name)
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "SkillEffect":
		"""Create from dictionary."""
		effect = cls()
		effect.power = data.get("power", 0)
		effect.formula_type = data.get("formula_type", 0)
		effect.variance = data.get("variance", 0)

		if "inflict_status" in data:
			status = StatusEffect.NONE
			for name in data["inflict_status"]:
				status |= StatusEffect[name]
			effect.inflict_status = status
		effect.status_chance = data.get("status_chance", 100)

		if "cure_status" in data:
			status = StatusEffect.NONE
			for name in data["cure_status"]:
				status |= StatusEffect[name]
			effect.cure_status = status

		effect.stat_mods = data.get("stat_mods", {})
		effect.duration = data.get("duration", 0)
		effect.hp_percent = data.get("hp_percent", 0)
		effect.mp_percent = data.get("mp_percent", 0)

		return effect


@dataclass
class Skill:
	"""A skill/ability."""
	id: int = 0
	name: str = ""
	description: str = ""

	# Type
	skill_type: SkillType = SkillType.ATTACK
	element: Element = Element.NONE

	# Cost
	mp_cost: int = 0
	hp_cost: int = 0

	# Targeting
	target_type: TargetType = TargetType.SINGLE_ENEMY

	# Effect
	effect: SkillEffect = field(default_factory=SkillEffect)

	# Multi-hit
	hit_count: int = 1
	hit_variance: int = 0  # Random hit count variance

	# Accuracy
	accuracy: int = 100

	# Flags
	flags: SkillFlag = SkillFlag.USABLE_BATTLE

	# Learning
	learn_level: int = 0          # Level to learn
	learn_class: int = 0          # Class that learns it
	learn_item_id: int = 0        # Item that teaches it

	# Prerequisites
	required_skill_id: int = 0    # Must know this skill first
	required_stat: str = ""       # Required stat
	required_value: int = 0       # Required stat value

	# Visual/Audio
	animation_id: int = 0
	sound_id: int = 0

	# ROM data
	rom_address: int = 0
	data_size: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.id,
			"name": self.name,
			"description": self.description,
			"skill_type": self.skill_type.name,
			"element": self.element.name,
			"mp_cost": self.mp_cost,
			"hp_cost": self.hp_cost,
			"target_type": self.target_type.name,
			"effect": self.effect.to_dict(),
			"hit_count": self.hit_count,
			"hit_variance": self.hit_variance,
			"accuracy": self.accuracy,
			"flags": self._flags_to_list()
		}

		# Learning
		learning = {}
		if self.learn_level:
			learning["level"] = self.learn_level
		if self.learn_class:
			learning["class"] = self.learn_class
		if self.learn_item_id:
			learning["item_id"] = self.learn_item_id
		if learning:
			result["learning"] = learning

		# Prerequisites
		prereq = {}
		if self.required_skill_id:
			prereq["skill_id"] = self.required_skill_id
		if self.required_stat:
			prereq["stat"] = self.required_stat
			prereq["value"] = self.required_value
		if prereq:
			result["prerequisites"] = prereq

		if self.animation_id:
			result["animation_id"] = self.animation_id
		if self.sound_id:
			result["sound_id"] = self.sound_id

		if self.rom_address:
			result["rom_address"] = f"0x{self.rom_address:06X}"
		if self.data_size:
			result["data_size"] = self.data_size

		return result

	def _flags_to_list(self) -> List[str]:
		"""Convert flags to list."""
		result = []
		for flag in SkillFlag:
			if flag != SkillFlag.NONE and (self.flags & flag):
				result.append(flag.name)
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "Skill":
		"""Create from dictionary."""
		skill = cls()
		skill.id = data.get("id", 0)
		skill.name = data.get("name", "")
		skill.description = data.get("description", "")

		skill.skill_type = SkillType[data.get("skill_type", "ATTACK")]
		skill.element = Element[data.get("element", "NONE")]

		skill.mp_cost = data.get("mp_cost", 0)
		skill.hp_cost = data.get("hp_cost", 0)

		skill.target_type = TargetType[data.get("target_type", "SINGLE_ENEMY")]

		if "effect" in data:
			skill.effect = SkillEffect.from_dict(data["effect"])

		skill.hit_count = data.get("hit_count", 1)
		skill.hit_variance = data.get("hit_variance", 0)
		skill.accuracy = data.get("accuracy", 100)

		flags = SkillFlag.NONE
		for fname in data.get("flags", []):
			flags |= SkillFlag[fname]
		skill.flags = flags

		learning = data.get("learning", {})
		skill.learn_level = learning.get("level", 0)
		skill.learn_class = learning.get("class", 0)
		skill.learn_item_id = learning.get("item_id", 0)

		prereq = data.get("prerequisites", {})
		skill.required_skill_id = prereq.get("skill_id", 0)
		skill.required_stat = prereq.get("stat", "")
		skill.required_value = prereq.get("value", 0)

		skill.animation_id = data.get("animation_id", 0)
		skill.sound_id = data.get("sound_id", 0)

		if data.get("rom_address"):
			skill.rom_address = int(data["rom_address"], 16)
		skill.data_size = data.get("data_size", 0)

		return skill


class SkillDatabase:
	"""Database of skills."""

	def __init__(self):
		self.skills: Dict[int, Skill] = {}
		self.next_id: int = 1

	def add(self, skill: Skill) -> int:
		"""Add skill to database."""
		if skill.id == 0:
			skill.id = self.next_id

		self.skills[skill.id] = skill
		self.next_id = max(self.next_id, skill.id + 1)
		return skill.id

	def get(self, skill_id: int) -> Optional[Skill]:
		"""Get skill by ID."""
		return self.skills.get(skill_id)

	def get_by_name(self, name: str) -> Optional[Skill]:
		"""Get skill by name."""
		name_lower = name.lower()
		for skill in self.skills.values():
			if skill.name.lower() == name_lower:
				return skill
		return None

	def delete(self, skill_id: int) -> bool:
		"""Delete skill."""
		if skill_id in self.skills:
			del self.skills[skill_id]
			return True
		return False

	def get_by_type(self, skill_type: SkillType) -> List[Skill]:
		"""Get skills by type."""
		return [s for s in self.skills.values() if s.skill_type == skill_type]

	def get_by_element(self, element: Element) -> List[Skill]:
		"""Get skills by element."""
		return [s for s in self.skills.values() if s.element == element]

	def get_learnable_at_level(self, level: int, class_id: int = 0) -> List[Skill]:
		"""Get skills learnable at a specific level."""
		result = []
		for skill in self.skills.values():
			if skill.learn_level == level:
				if class_id == 0 or skill.learn_class == 0 or skill.learn_class == class_id:
					result.append(skill)
		return result

	def to_json(self) -> str:
		"""Export to JSON."""
		data = {
			"skills": [s.to_dict() for s in sorted(self.skills.values(), key=lambda x: x.id)]
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

			self.skills.clear()
			for skill_data in data.get("skills", []):
				skill = Skill.from_dict(skill_data)
				self.add(skill)

			return True
		except Exception as e:
			print(f"Error loading: {e}")
			return False

	def format_list(self) -> str:
		"""Format skill list."""
		lines = []
		lines.append(f"{'ID':>4} {'Name':<20} {'Type':<10} {'MP':>4} {'Element':<10} {'Target':<12}")
		lines.append("-" * 65)

		for skill in sorted(self.skills.values(), key=lambda x: x.id):
			lines.append(
				f"{skill.id:>4} {skill.name:<20} {skill.skill_type.name:<10} "
				f"{skill.mp_cost:>4} {skill.element.name:<10} {skill.target_type.name:<12}"
			)

		return "\n".join(lines)

	def format_detail(self, skill_id: int) -> str:
		"""Format skill detail."""
		skill = self.get(skill_id)
		if not skill:
			return f"Skill {skill_id} not found"

		lines = []
		lines.append(f"=== {skill.name} (ID: {skill.id}) ===")
		lines.append(f"Type: {skill.skill_type.name}")
		lines.append(f"Description: {skill.description}")
		lines.append("")
		lines.append(f"Element: {skill.element.name}")
		lines.append(f"Target: {skill.target_type.name}")
		lines.append(f"MP Cost: {skill.mp_cost}")
		if skill.hp_cost:
			lines.append(f"HP Cost: {skill.hp_cost}")
		lines.append(f"Accuracy: {skill.accuracy}%")

		if skill.hit_count > 1:
			lines.append(f"Hits: {skill.hit_count}")

		lines.append("")
		lines.append("Effect:")
		eff = skill.effect
		if eff.power:
			lines.append(f"  Power: {eff.power}")
		if eff.hp_percent:
			lines.append(f"  HP %: {eff.hp_percent}")
		if eff.inflict_status != StatusEffect.NONE:
			status_list = eff._status_to_list(eff.inflict_status)
			lines.append(f"  Inflicts: {', '.join(status_list)} ({eff.status_chance}%)")
		if eff.cure_status != StatusEffect.NONE:
			status_list = eff._status_to_list(eff.cure_status)
			lines.append(f"  Cures: {', '.join(status_list)}")
		if eff.stat_mods:
			mods = [f"{k} {v:+d}" for k, v in eff.stat_mods.items()]
			lines.append(f"  Stat Mods: {', '.join(mods)}")

		flags = skill._flags_to_list()
		if flags:
			lines.append("")
			lines.append(f"Flags: {', '.join(flags)}")

		if skill.learn_level:
			lines.append("")
			lines.append(f"Learn at Level: {skill.learn_level}")

		return "\n".join(lines)


def create_sample_database() -> SkillDatabase:
	"""Create sample skill database."""
	db = SkillDatabase()

	# Basic attack skill
	slash = Skill(
		id=1, name="Slash",
		description="A basic sword attack",
		skill_type=SkillType.ATTACK,
		mp_cost=0,
		target_type=TargetType.SINGLE_ENEMY,
		effect=SkillEffect(power=120),
		flags=SkillFlag.USABLE_BATTLE,
		learn_level=1
	)
	db.add(slash)

	# Fire spell
	fire = Skill(
		id=2, name="Fire",
		description="Deals fire damage to one enemy",
		skill_type=SkillType.MAGIC,
		element=Element.FIRE,
		mp_cost=5,
		target_type=TargetType.SINGLE_ENEMY,
		effect=SkillEffect(power=80, variance=10),
		flags=SkillFlag.USABLE_BATTLE | SkillFlag.REFLECTABLE,
		learn_level=3
	)
	db.add(fire)

	# Stronger fire spell
	firaga = Skill(
		id=3, name="Firaga",
		description="Deals heavy fire damage to all enemies",
		skill_type=SkillType.MAGIC,
		element=Element.FIRE,
		mp_cost=30,
		target_type=TargetType.ALL_ENEMIES,
		effect=SkillEffect(power=180, variance=15),
		flags=SkillFlag.USABLE_BATTLE | SkillFlag.REFLECTABLE,
		learn_level=25,
		required_skill_id=2
	)
	db.add(firaga)

	# Heal
	heal = Skill(
		id=4, name="Heal",
		description="Restores HP to one ally",
		skill_type=SkillType.HEAL,
		mp_cost=4,
		target_type=TargetType.SINGLE_ALLY,
		effect=SkillEffect(power=100),
		flags=SkillFlag.USABLE_BATTLE | SkillFlag.USABLE_FIELD,
		learn_level=2
	)
	db.add(heal)

	# Status skill
	sleep_spell = Skill(
		id=5, name="Sleep",
		description="Puts one enemy to sleep",
		skill_type=SkillType.DEBUFF,
		mp_cost=6,
		target_type=TargetType.SINGLE_ENEMY,
		effect=SkillEffect(
			inflict_status=StatusEffect.SLEEP,
			status_chance=75
		),
		accuracy=80,
		flags=SkillFlag.USABLE_BATTLE | SkillFlag.REFLECTABLE,
		learn_level=8
	)
	db.add(sleep_spell)

	# Buff skill
	protect = Skill(
		id=6, name="Protect",
		description="Increases defense for one ally",
		skill_type=SkillType.SUPPORT,
		mp_cost=8,
		target_type=TargetType.SINGLE_ALLY,
		effect=SkillEffect(
			inflict_status=StatusEffect.PROTECT,
			duration=5
		),
		flags=SkillFlag.USABLE_BATTLE,
		learn_level=10
	)
	db.add(protect)

	# Multi-hit skill
	double_slash = Skill(
		id=7, name="Double Slash",
		description="Strikes twice",
		skill_type=SkillType.ATTACK,
		mp_cost=8,
		target_type=TargetType.SINGLE_ENEMY,
		effect=SkillEffect(power=80),
		hit_count=2,
		flags=SkillFlag.USABLE_BATTLE,
		learn_level=15
	)
	db.add(double_slash)

	# Field skill
	teleport = Skill(
		id=8, name="Teleport",
		description="Return to a previously visited town",
		skill_type=SkillType.FIELD,
		mp_cost=10,
		target_type=TargetType.FIELD,
		flags=SkillFlag.USABLE_FIELD,
		learn_level=12
	)
	db.add(teleport)

	# Drain skill
	drain = Skill(
		id=9, name="Drain",
		description="Absorbs HP from enemy",
		skill_type=SkillType.MAGIC,
		element=Element.DARK,
		mp_cost=12,
		target_type=TargetType.SINGLE_ENEMY,
		effect=SkillEffect(power=60),
		flags=SkillFlag.USABLE_BATTLE | SkillFlag.DRAIN,
		learn_level=18
	)
	db.add(drain)

	# Death skill
	death = Skill(
		id=10, name="Death",
		description="Instantly kills one enemy",
		skill_type=SkillType.MAGIC,
		element=Element.DARK,
		mp_cost=25,
		target_type=TargetType.SINGLE_ENEMY,
		effect=SkillEffect(
			inflict_status=StatusEffect.DEATH,
			status_chance=30
		),
		accuracy=75,
		flags=SkillFlag.USABLE_BATTLE,
		learn_level=30
	)
	db.add(death)

	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Skill Editor")
	parser.add_argument("input", nargs="?", help="Skill database file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all skills")
	parser.add_argument("--detail", "-d", type=int,
						help="View skill details by ID")
	parser.add_argument("--type", "-t",
						help="Filter by skill type")
	parser.add_argument("--element", "-e",
						help="Filter by element")
	parser.add_argument("--sample", action="store_true",
						help="Create sample database")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")
	parser.add_argument("--output", "-o",
						help="Output file")

	# Edit options
	parser.add_argument("--add", help="Add new skill with name")
	parser.add_argument("--edit", type=int,
						help="Edit skill by ID")
	parser.add_argument("--delete", type=int,
						help="Delete skill by ID")
	parser.add_argument("--mp", type=int,
						help="Set MP cost")
	parser.add_argument("--power", type=int,
						help="Set power")
	parser.add_argument("--description",
						help="Set description")

	args = parser.parse_args()

	if not args.input and not args.sample:
		print("Skill Editor")
		print()
		print("Usage: python skill_editor.py <skills.json> [options]")
		print()
		print("Options:")
		print("  --view, -v          View all skills")
		print("  --detail, -d ID     View skill details")
		print("  --type, -t TYPE     Filter by type")
		print("  --element, -e ELEM  Filter by element")
		print("  --sample            Create sample database")
		print("  --json, -j          Output as JSON")
		print("  --output, -o FILE   Output file")
		print()
		print("Skill Types: ATTACK, MAGIC, SUPPORT, HEAL, DEBUFF, FIELD, SUMMON")
		print("Elements: NONE, FIRE, ICE, LIGHTNING, WIND, EARTH, WATER, LIGHT, DARK")
		return

	# Create sample
	if args.sample:
		db = create_sample_database()
		out_file = args.output or "skills_sample.json"
		if db.save(out_file):
			print(f"Created sample database: {out_file}")
		return

	# Load database
	db = SkillDatabase()
	if os.path.exists(args.input):
		db.load(args.input)

	# View
	if args.view:
		if args.json:
			print(db.to_json())
		else:
			print(db.format_list())
		return

	# Detail
	if args.detail:
		print(db.format_detail(args.detail))
		return

	# Type filter
	if args.type:
		try:
			stype = SkillType[args.type.upper()]
			skills = db.get_by_type(stype)
			for skill in skills:
				print(f"{skill.id}: {skill.name} (MP: {skill.mp_cost})")
		except KeyError:
			print(f"Unknown skill type: {args.type}")
		return

	# Element filter
	if args.element:
		try:
			elem = Element[args.element.upper()]
			skills = db.get_by_element(elem)
			for skill in skills:
				print(f"{skill.id}: {skill.name} (MP: {skill.mp_cost})")
		except KeyError:
			print(f"Unknown element: {args.element}")
		return

	# Add
	if args.add:
		skill = Skill(name=args.add)
		if args.mp is not None:
			skill.mp_cost = args.mp
		if args.power is not None:
			skill.effect = SkillEffect(power=args.power)
		if args.description:
			skill.description = args.description

		sid = db.add(skill)
		print(f"Added skill: {skill.name} (ID: {sid})")

	# Edit
	if args.edit:
		skill = db.get(args.edit)
		if skill:
			if args.mp is not None:
				skill.mp_cost = args.mp
			if args.power is not None:
				skill.effect.power = args.power
			if args.description:
				skill.description = args.description
			print(f"Updated skill: {skill.name}")
		else:
			print(f"Skill {args.edit} not found")
			return

	# Delete
	if args.delete:
		if db.delete(args.delete):
			print(f"Deleted skill {args.delete}")
		else:
			print(f"Skill {args.delete} not found")
			return

	# Save
	if args.add or args.edit or args.delete:
		out_file = args.output or args.input
		if db.save(out_file):
			print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
