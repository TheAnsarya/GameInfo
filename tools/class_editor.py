#!/usr/bin/env python3
"""
Class/Job Editor - Edit RPG character classes and jobs.

Comprehensive editor for character class data including stats,
skills, equipment, and job change systems.

Usage:
	python class_editor.py classes.json --view
	python class_editor.py classes.json --add "Dragoon"
	python class_editor.py classes.json --edit 3 --hp-growth 15

Features:
	- Class stats and growth rates
	- Skill learning
	- Equipment restrictions
	- Job change requirements
	- Class abilities
"""

import argparse
import json
import os
from dataclasses import dataclass, field
from enum import Enum, Flag, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set


class ClassCategory(Enum):
	"""Class categories."""
	PHYSICAL = 0     # Physical combat focused
	MAGIC = 1        # Magic focused
	SUPPORT = 2      # Support/healing
	HYBRID = 3       # Mixed
	SPECIAL = 4      # Unique/secret class


class StatType(Enum):
	"""Stat types."""
	HP = 0
	MP = 1
	STRENGTH = 2
	AGILITY = 3
	VITALITY = 4
	INTELLIGENCE = 5
	LUCK = 6
	ATTACK = 7
	DEFENSE = 8
	MAGIC_ATTACK = 9
	MAGIC_DEFENSE = 10
	SPEED = 11
	EVASION = 12


class EquipmentType(Flag):
	"""Equipment types a class can use."""
	NONE = 0
	SWORD = auto()
	AXE = auto()
	SPEAR = auto()
	BOW = auto()
	STAFF = auto()
	WAND = auto()
	DAGGER = auto()
	HAMMER = auto()
	WHIP = auto()
	CLAW = auto()
	FAN = auto()
	BOOMERANG = auto()
	SHIELD = auto()
	HEAVY_ARMOR = auto()
	LIGHT_ARMOR = auto()
	ROBE = auto()
	HAT = auto()
	HELMET = auto()


class ClassFlag(Flag):
	"""Class flags."""
	NONE = 0
	STARTER = auto()         # Available at start
	ADVANCED = auto()        # Advanced class
	SECRET = auto()          # Secret/hidden class
	MONSTER = auto()         # Monster class
	UNIQUE = auto()          # One character only
	GENDER_MALE = auto()     # Male only
	GENDER_FEMALE = auto()   # Female only


@dataclass
class StatGrowth:
	"""Stat growth rates."""
	hp: int = 10
	mp: int = 5
	strength: int = 5
	agility: int = 5
	vitality: int = 5
	intelligence: int = 5
	luck: int = 5

	def to_dict(self) -> Dict[str, int]:
		"""Convert to dictionary."""
		return {
			"hp": self.hp,
			"mp": self.mp,
			"strength": self.strength,
			"agility": self.agility,
			"vitality": self.vitality,
			"intelligence": self.intelligence,
			"luck": self.luck
		}

	@classmethod
	def from_dict(cls, data: Dict[str, int]) -> "StatGrowth":
		"""Create from dictionary."""
		return cls(
			hp=data.get("hp", 10),
			mp=data.get("mp", 5),
			strength=data.get("strength", 5),
			agility=data.get("agility", 5),
			vitality=data.get("vitality", 5),
			intelligence=data.get("intelligence", 5),
			luck=data.get("luck", 5)
		)


@dataclass
class BaseStats:
	"""Base stats for a class."""
	hp: int = 50
	mp: int = 20
	strength: int = 10
	agility: int = 10
	vitality: int = 10
	intelligence: int = 10
	luck: int = 10

	def to_dict(self) -> Dict[str, int]:
		"""Convert to dictionary."""
		return {
			"hp": self.hp,
			"mp": self.mp,
			"strength": self.strength,
			"agility": self.agility,
			"vitality": self.vitality,
			"intelligence": self.intelligence,
			"luck": self.luck
		}

	@classmethod
	def from_dict(cls, data: Dict[str, int]) -> "BaseStats":
		"""Create from dictionary."""
		return cls(
			hp=data.get("hp", 50),
			mp=data.get("mp", 20),
			strength=data.get("strength", 10),
			agility=data.get("agility", 10),
			vitality=data.get("vitality", 10),
			intelligence=data.get("intelligence", 10),
			luck=data.get("luck", 10)
		)


@dataclass
class SkillLearn:
	"""Skill learning data."""
	skill_id: int
	skill_name: str
	level: int

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"skill_id": self.skill_id,
			"skill_name": self.skill_name,
			"level": self.level
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "SkillLearn":
		"""Create from dictionary."""
		return cls(
			skill_id=data.get("skill_id", 0),
			skill_name=data.get("skill_name", ""),
			level=data.get("level", 1)
		)


@dataclass
class JobChangeRequirement:
	"""Requirements to change to this class."""
	min_level: int = 1
	required_class_id: int = 0         # Must have been this class
	required_class_level: int = 0      # Must have reached this level in required class
	required_item_id: int = 0          # Item needed
	required_stat: str = ""            # Stat requirement
	required_stat_value: int = 0       # Stat value needed

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {"min_level": self.min_level}
		if self.required_class_id:
			result["required_class_id"] = self.required_class_id
			result["required_class_level"] = self.required_class_level
		if self.required_item_id:
			result["required_item_id"] = self.required_item_id
		if self.required_stat:
			result["required_stat"] = self.required_stat
			result["required_stat_value"] = self.required_stat_value
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "JobChangeRequirement":
		"""Create from dictionary."""
		return cls(
			min_level=data.get("min_level", 1),
			required_class_id=data.get("required_class_id", 0),
			required_class_level=data.get("required_class_level", 0),
			required_item_id=data.get("required_item_id", 0),
			required_stat=data.get("required_stat", ""),
			required_stat_value=data.get("required_stat_value", 0)
		)


@dataclass
class CharacterClass:
	"""A character class/job."""
	id: int = 0
	name: str = ""
	description: str = ""

	# Category
	category: ClassCategory = ClassCategory.PHYSICAL

	# Base stats
	base_stats: BaseStats = field(default_factory=BaseStats)

	# Growth rates (per level)
	growth: StatGrowth = field(default_factory=StatGrowth)

	# Stat multipliers (for class bonuses)
	stat_multipliers: Dict[str, float] = field(default_factory=dict)

	# Equipment
	equip_types: EquipmentType = EquipmentType.SWORD | EquipmentType.LIGHT_ARMOR

	# Skills learned
	skills: List[SkillLearn] = field(default_factory=list)

	# Innate abilities (always active)
	innate_abilities: List[int] = field(default_factory=list)

	# Flags
	flags: ClassFlag = ClassFlag.STARTER

	# Job change
	change_requirements: Optional[JobChangeRequirement] = None

	# Promoted/advanced class
	promotes_to: List[int] = field(default_factory=list)
	promotes_from: int = 0

	# Visual
	sprite_id: int = 0
	palette: int = 0
	portrait_id: int = 0

	# EXP curve
	exp_curve_type: int = 0
	exp_modifier: float = 1.0

	# ROM data
	rom_address: int = 0
	data_size: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.id,
			"name": self.name,
			"description": self.description,
			"category": self.category.name,
			"base_stats": self.base_stats.to_dict(),
			"growth": self.growth.to_dict(),
			"equip_types": self._equip_to_list(),
			"skills": [s.to_dict() for s in self.skills],
			"flags": self._flags_to_list()
		}

		if self.stat_multipliers:
			result["stat_multipliers"] = self.stat_multipliers

		if self.innate_abilities:
			result["innate_abilities"] = self.innate_abilities

		if self.change_requirements:
			result["change_requirements"] = self.change_requirements.to_dict()

		if self.promotes_to:
			result["promotes_to"] = self.promotes_to
		if self.promotes_from:
			result["promotes_from"] = self.promotes_from

		result["visual"] = {
			"sprite_id": self.sprite_id,
			"palette": self.palette,
			"portrait_id": self.portrait_id
		}

		result["exp_curve_type"] = self.exp_curve_type
		result["exp_modifier"] = self.exp_modifier

		if self.rom_address:
			result["rom_address"] = f"0x{self.rom_address:06X}"
		if self.data_size:
			result["data_size"] = self.data_size

		return result

	def _equip_to_list(self) -> List[str]:
		"""Convert equipment flags to list."""
		result = []
		for etype in EquipmentType:
			if etype != EquipmentType.NONE and (self.equip_types & etype):
				result.append(etype.name)
		return result

	def _flags_to_list(self) -> List[str]:
		"""Convert flags to list."""
		result = []
		for flag in ClassFlag:
			if flag != ClassFlag.NONE and (self.flags & flag):
				result.append(flag.name)
		return result

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "CharacterClass":
		"""Create from dictionary."""
		char_class = cls()
		char_class.id = data.get("id", 0)
		char_class.name = data.get("name", "")
		char_class.description = data.get("description", "")

		char_class.category = ClassCategory[data.get("category", "PHYSICAL")]

		if "base_stats" in data:
			char_class.base_stats = BaseStats.from_dict(data["base_stats"])
		if "growth" in data:
			char_class.growth = StatGrowth.from_dict(data["growth"])

		char_class.stat_multipliers = data.get("stat_multipliers", {})

		# Equipment
		equip = EquipmentType.NONE
		for ename in data.get("equip_types", []):
			equip |= EquipmentType[ename]
		char_class.equip_types = equip

		# Skills
		for skill_data in data.get("skills", []):
			char_class.skills.append(SkillLearn.from_dict(skill_data))

		char_class.innate_abilities = data.get("innate_abilities", [])

		# Flags
		flags = ClassFlag.NONE
		for fname in data.get("flags", []):
			flags |= ClassFlag[fname]
		char_class.flags = flags

		if "change_requirements" in data:
			char_class.change_requirements = JobChangeRequirement.from_dict(
				data["change_requirements"]
			)

		char_class.promotes_to = data.get("promotes_to", [])
		char_class.promotes_from = data.get("promotes_from", 0)

		visual = data.get("visual", {})
		char_class.sprite_id = visual.get("sprite_id", 0)
		char_class.palette = visual.get("palette", 0)
		char_class.portrait_id = visual.get("portrait_id", 0)

		char_class.exp_curve_type = data.get("exp_curve_type", 0)
		char_class.exp_modifier = data.get("exp_modifier", 1.0)

		if data.get("rom_address"):
			char_class.rom_address = int(data["rom_address"], 16)
		char_class.data_size = data.get("data_size", 0)

		return char_class


class ClassDatabase:
	"""Database of character classes."""

	def __init__(self):
		self.classes: Dict[int, CharacterClass] = {}
		self.next_id: int = 1

	def add(self, char_class: CharacterClass) -> int:
		"""Add class to database."""
		if char_class.id == 0:
			char_class.id = self.next_id

		self.classes[char_class.id] = char_class
		self.next_id = max(self.next_id, char_class.id + 1)
		return char_class.id

	def get(self, class_id: int) -> Optional[CharacterClass]:
		"""Get class by ID."""
		return self.classes.get(class_id)

	def get_by_name(self, name: str) -> Optional[CharacterClass]:
		"""Get class by name."""
		name_lower = name.lower()
		for char_class in self.classes.values():
			if char_class.name.lower() == name_lower:
				return char_class
		return None

	def delete(self, class_id: int) -> bool:
		"""Delete class."""
		if class_id in self.classes:
			del self.classes[class_id]
			return True
		return False

	def get_by_category(self, category: ClassCategory) -> List[CharacterClass]:
		"""Get classes by category."""
		return [c for c in self.classes.values() if c.category == category]

	def get_starter_classes(self) -> List[CharacterClass]:
		"""Get starter classes."""
		return [c for c in self.classes.values() if ClassFlag.STARTER in c.flags]

	def get_advanced_classes(self) -> List[CharacterClass]:
		"""Get advanced classes."""
		return [c for c in self.classes.values() if ClassFlag.ADVANCED in c.flags]

	def get_promotions(self, class_id: int) -> List[CharacterClass]:
		"""Get classes this class can promote to."""
		char_class = self.get(class_id)
		if not char_class:
			return []
		return [self.get(pid) for pid in char_class.promotes_to if self.get(pid)]

	def to_json(self) -> str:
		"""Export to JSON."""
		data = {
			"classes": [c.to_dict() for c in sorted(self.classes.values(), key=lambda x: x.id)]
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

			self.classes.clear()
			for class_data in data.get("classes", []):
				char_class = CharacterClass.from_dict(class_data)
				self.add(char_class)

			return True
		except Exception as e:
			print(f"Error loading: {e}")
			return False

	def format_list(self) -> str:
		"""Format class list."""
		lines = []
		lines.append(f"{'ID':>4} {'Name':<15} {'Category':<10} {'HP':>4} {'STR':>4} {'INT':>4}")
		lines.append("-" * 45)

		for c in sorted(self.classes.values(), key=lambda x: x.id):
			lines.append(
				f"{c.id:>4} {c.name:<15} {c.category.name:<10} "
				f"{c.growth.hp:>4} {c.growth.strength:>4} {c.growth.intelligence:>4}"
			)

		return "\n".join(lines)

	def format_detail(self, class_id: int) -> str:
		"""Format class detail."""
		c = self.get(class_id)
		if not c:
			return f"Class {class_id} not found"

		lines = []
		lines.append(f"=== {c.name} (ID: {c.id}) ===")
		lines.append(f"Category: {c.category.name}")
		lines.append(f"Description: {c.description}")
		lines.append("")

		lines.append("Base Stats:")
		bs = c.base_stats
		lines.append(f"  HP: {bs.hp}  MP: {bs.mp}")
		lines.append(f"  STR: {bs.strength}  AGI: {bs.agility}  VIT: {bs.vitality}")
		lines.append(f"  INT: {bs.intelligence}  LUK: {bs.luck}")
		lines.append("")

		lines.append("Growth per Level:")
		g = c.growth
		lines.append(f"  HP: +{g.hp}  MP: +{g.mp}")
		lines.append(f"  STR: +{g.strength}  AGI: +{g.agility}  VIT: +{g.vitality}")
		lines.append(f"  INT: +{g.intelligence}  LUK: +{g.luck}")
		lines.append("")

		equip = c._equip_to_list()
		lines.append(f"Equipment: {', '.join(equip)}")
		lines.append("")

		if c.skills:
			lines.append("Skills Learned:")
			for skill in sorted(c.skills, key=lambda x: x.level):
				lines.append(f"  Lv.{skill.level}: {skill.skill_name}")
			lines.append("")

		flags = c._flags_to_list()
		if flags:
			lines.append(f"Flags: {', '.join(flags)}")

		if c.promotes_to:
			promo_names = []
			for pid in c.promotes_to:
				pc = self.get(pid)
				if pc:
					promo_names.append(pc.name)
			if promo_names:
				lines.append(f"Promotes to: {', '.join(promo_names)}")

		return "\n".join(lines)


def create_sample_database() -> ClassDatabase:
	"""Create sample class database."""
	db = ClassDatabase()

	# Warrior
	warrior = CharacterClass(
		id=1, name="Warrior",
		description="A strong fighter specializing in physical combat",
		category=ClassCategory.PHYSICAL,
		base_stats=BaseStats(hp=80, mp=10, strength=15, agility=10, vitality=15, intelligence=5, luck=10),
		growth=StatGrowth(hp=15, mp=2, strength=8, agility=5, vitality=7, intelligence=2, luck=4),
		equip_types=EquipmentType.SWORD | EquipmentType.AXE | EquipmentType.SHIELD | EquipmentType.HEAVY_ARMOR | EquipmentType.HELMET,
		skills=[
			SkillLearn(1, "Slash", 1),
			SkillLearn(10, "Power Strike", 5),
			SkillLearn(15, "War Cry", 12),
		],
		flags=ClassFlag.STARTER,
		promotes_to=[5, 6]
	)
	db.add(warrior)

	# Mage
	mage = CharacterClass(
		id=2, name="Mage",
		description="A wielder of offensive magic",
		category=ClassCategory.MAGIC,
		base_stats=BaseStats(hp=40, mp=60, strength=5, agility=10, vitality=8, intelligence=18, luck=10),
		growth=StatGrowth(hp=8, mp=12, strength=2, agility=4, vitality=3, intelligence=10, luck=5),
		equip_types=EquipmentType.STAFF | EquipmentType.WAND | EquipmentType.ROBE | EquipmentType.HAT,
		skills=[
			SkillLearn(2, "Fire", 1),
			SkillLearn(20, "Ice", 3),
			SkillLearn(25, "Thunder", 8),
			SkillLearn(30, "Firaga", 20),
		],
		flags=ClassFlag.STARTER,
		promotes_to=[7]
	)
	db.add(mage)

	# Cleric
	cleric = CharacterClass(
		id=3, name="Cleric",
		description="A healer devoted to supporting allies",
		category=ClassCategory.SUPPORT,
		base_stats=BaseStats(hp=55, mp=50, strength=8, agility=8, vitality=12, intelligence=15, luck=12),
		growth=StatGrowth(hp=10, mp=10, strength=3, agility=4, vitality=5, intelligence=8, luck=6),
		equip_types=EquipmentType.STAFF | EquipmentType.HAMMER | EquipmentType.LIGHT_ARMOR | EquipmentType.SHIELD | EquipmentType.HAT,
		skills=[
			SkillLearn(4, "Heal", 1),
			SkillLearn(35, "Cure Poison", 5),
			SkillLearn(40, "Healall", 15),
		],
		flags=ClassFlag.STARTER,
		promotes_to=[8]
	)
	db.add(cleric)

	# Thief
	thief = CharacterClass(
		id=4, name="Thief",
		description="A nimble rogue with high agility",
		category=ClassCategory.PHYSICAL,
		base_stats=BaseStats(hp=50, mp=20, strength=10, agility=18, vitality=10, intelligence=10, luck=15),
		growth=StatGrowth(hp=10, mp=4, strength=5, agility=10, vitality=4, intelligence=4, luck=8),
		equip_types=EquipmentType.DAGGER | EquipmentType.SWORD | EquipmentType.BOW | EquipmentType.LIGHT_ARMOR,
		skills=[
			SkillLearn(50, "Steal", 1),
			SkillLearn(55, "Backstab", 8),
			SkillLearn(60, "Flee", 3),
		],
		flags=ClassFlag.STARTER,
		promotes_to=[6, 9]
	)
	db.add(thief)

	# Paladin (advanced from Warrior)
	paladin = CharacterClass(
		id=5, name="Paladin",
		description="A holy warrior combining strength and magic",
		category=ClassCategory.HYBRID,
		base_stats=BaseStats(hp=90, mp=40, strength=14, agility=10, vitality=16, intelligence=12, luck=12),
		growth=StatGrowth(hp=14, mp=6, strength=7, agility=4, vitality=7, intelligence=5, luck=5),
		equip_types=EquipmentType.SWORD | EquipmentType.SPEAR | EquipmentType.SHIELD | EquipmentType.HEAVY_ARMOR | EquipmentType.HELMET,
		skills=[
			SkillLearn(4, "Heal", 1),
			SkillLearn(70, "Holy Strike", 5),
			SkillLearn(75, "Divine Shield", 15),
		],
		flags=ClassFlag.ADVANCED,
		change_requirements=JobChangeRequirement(min_level=20, required_class_id=1, required_class_level=15),
		promotes_from=1
	)
	db.add(paladin)

	# Berserker (advanced from Warrior)
	berserker = CharacterClass(
		id=6, name="Berserker",
		description="A savage fighter with devastating attacks",
		category=ClassCategory.PHYSICAL,
		base_stats=BaseStats(hp=100, mp=5, strength=20, agility=8, vitality=18, intelligence=3, luck=8),
		growth=StatGrowth(hp=18, mp=1, strength=12, agility=4, vitality=8, intelligence=1, luck=3),
		equip_types=EquipmentType.AXE | EquipmentType.HAMMER | EquipmentType.LIGHT_ARMOR,
		skills=[
			SkillLearn(80, "Rage", 1),
			SkillLearn(85, "Reckless Attack", 10),
		],
		flags=ClassFlag.ADVANCED,
		change_requirements=JobChangeRequirement(min_level=20, required_class_id=1, required_class_level=15),
		promotes_from=1
	)
	db.add(berserker)

	# Sage (advanced from Mage)
	sage = CharacterClass(
		id=7, name="Sage",
		description="A master of all magic",
		category=ClassCategory.MAGIC,
		base_stats=BaseStats(hp=50, mp=100, strength=5, agility=10, vitality=10, intelligence=25, luck=15),
		growth=StatGrowth(hp=7, mp=15, strength=2, agility=4, vitality=3, intelligence=12, luck=6),
		equip_types=EquipmentType.STAFF | EquipmentType.WAND | EquipmentType.ROBE | EquipmentType.HAT,
		skills=[
			SkillLearn(4, "Heal", 1),
			SkillLearn(2, "Fire", 1),
			SkillLearn(90, "Ultima", 30),
		],
		flags=ClassFlag.ADVANCED,
		change_requirements=JobChangeRequirement(min_level=30, required_class_id=2, required_class_level=25),
		promotes_from=2
	)
	db.add(sage)

	# Hero (secret class)
	hero = CharacterClass(
		id=10, name="Hero",
		description="The legendary hero class",
		category=ClassCategory.HYBRID,
		base_stats=BaseStats(hp=100, mp=60, strength=18, agility=15, vitality=15, intelligence=15, luck=18),
		growth=StatGrowth(hp=15, mp=8, strength=8, agility=7, vitality=7, intelligence=7, luck=8),
		equip_types=EquipmentType.SWORD | EquipmentType.SHIELD | EquipmentType.HEAVY_ARMOR | EquipmentType.LIGHT_ARMOR | EquipmentType.HELMET,
		flags=ClassFlag.SECRET | ClassFlag.UNIQUE,
		change_requirements=JobChangeRequirement(required_item_id=999)
	)
	db.add(hero)

	return db


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Class/Job Editor")
	parser.add_argument("input", nargs="?", help="Class database file")
	parser.add_argument("--view", "-v", action="store_true",
						help="View all classes")
	parser.add_argument("--detail", "-d", type=int,
						help="View class details by ID")
	parser.add_argument("--category", "-c",
						help="Filter by category")
	parser.add_argument("--starter", action="store_true",
						help="Show starter classes")
	parser.add_argument("--advanced", action="store_true",
						help="Show advanced classes")
	parser.add_argument("--sample", action="store_true",
						help="Create sample database")
	parser.add_argument("--json", "-j", action="store_true",
						help="Output as JSON")
	parser.add_argument("--output", "-o",
						help="Output file")

	# Edit options
	parser.add_argument("--add", help="Add new class with name")
	parser.add_argument("--edit", "-e", type=int,
						help="Edit class by ID")
	parser.add_argument("--delete", type=int,
						help="Delete class by ID")
	parser.add_argument("--hp-growth", type=int,
						help="Set HP growth")
	parser.add_argument("--str-growth", type=int,
						help="Set strength growth")
	parser.add_argument("--description",
						help="Set description")

	args = parser.parse_args()

	if not args.input and not args.sample:
		print("Class/Job Editor")
		print()
		print("Usage: python class_editor.py <classes.json> [options]")
		print()
		print("Options:")
		print("  --view, -v          View all classes")
		print("  --detail, -d ID     View class details")
		print("  --category, -c CAT  Filter by category")
		print("  --starter           Show starter classes")
		print("  --advanced          Show advanced classes")
		print("  --sample            Create sample database")
		print("  --json, -j          Output as JSON")
		print("  --output, -o FILE   Output file")
		print()
		print("Categories: PHYSICAL, MAGIC, SUPPORT, HYBRID, SPECIAL")
		return

	# Create sample
	if args.sample:
		db = create_sample_database()
		out_file = args.output or "classes_sample.json"
		if db.save(out_file):
			print(f"Created sample database: {out_file}")
		return

	# Load database
	db = ClassDatabase()
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

	# Category filter
	if args.category:
		try:
			cat = ClassCategory[args.category.upper()]
			classes = db.get_by_category(cat)
			for c in classes:
				print(f"{c.id}: {c.name}")
		except KeyError:
			print(f"Unknown category: {args.category}")
		return

	# Starter classes
	if args.starter:
		classes = db.get_starter_classes()
		for c in classes:
			print(f"{c.id}: {c.name}")
		return

	# Advanced classes
	if args.advanced:
		classes = db.get_advanced_classes()
		for c in classes:
			print(f"{c.id}: {c.name}")
		return

	# Add
	if args.add:
		char_class = CharacterClass(name=args.add)
		if args.hp_growth:
			char_class.growth.hp = args.hp_growth
		if args.str_growth:
			char_class.growth.strength = args.str_growth
		if args.description:
			char_class.description = args.description

		cid = db.add(char_class)
		print(f"Added class: {char_class.name} (ID: {cid})")

	# Edit
	if args.edit:
		char_class = db.get(args.edit)
		if char_class:
			if args.hp_growth is not None:
				char_class.growth.hp = args.hp_growth
			if args.str_growth is not None:
				char_class.growth.strength = args.str_growth
			if args.description:
				char_class.description = args.description
			print(f"Updated class: {char_class.name}")
		else:
			print(f"Class {args.edit} not found")
			return

	# Delete
	if args.delete:
		if db.delete(args.delete):
			print(f"Deleted class {args.delete}")
		else:
			print(f"Class {args.delete} not found")
			return

	# Save
	if args.add or args.edit or args.delete:
		out_file = args.output or args.input
		if db.save(out_file):
			print(f"Saved: {out_file}")


if __name__ == "__main__":
	main()
