#!/usr/bin/env python3
"""
Character Stats Calculator - Calculate and analyze character progression.

Tools for modeling character stat growth, class progressions,
and equipment effects for RPG games.

Usage:
	python stats_calculator.py <config.json>
	python stats_calculator.py --level 50 --class Warrior
	python stats_calculator.py --compare

Features:
	- Stat growth modeling
	- Level progression
	- Equipment calculations
	- Class comparison
	- Optimal builds
"""

import argparse
import json
import math
import os
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple


class GrowthType(Enum):
	"""Stat growth curve types."""
	LINEAR = auto()
	LOGARITHMIC = auto()
	EXPONENTIAL = auto()
	POLYNOMIAL = auto()
	CUSTOM = auto()


@dataclass
class StatGrowth:
	"""Defines how a stat grows with level."""
	base: int
	growth_per_level: float
	growth_type: GrowthType = GrowthType.LINEAR
	variance: float = 0.0  # Random variance per level
	cap: int = 9999  # Maximum value
	
	def calculate(self, level: int) -> int:
		"""Calculate stat value at level."""
		if level < 1:
			return self.base
		
		if self.growth_type == GrowthType.LINEAR:
			value = self.base + (level - 1) * self.growth_per_level
		elif self.growth_type == GrowthType.LOGARITHMIC:
			value = self.base + self.growth_per_level * math.log2(level + 1) * 10
		elif self.growth_type == GrowthType.EXPONENTIAL:
			value = self.base * (1 + self.growth_per_level / 100) ** (level - 1)
		elif self.growth_type == GrowthType.POLYNOMIAL:
			value = self.base + self.growth_per_level * (level ** 1.5) / 10
		else:
			value = self.base + (level - 1) * self.growth_per_level
		
		return min(int(value), self.cap)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"base": self.base,
			"growth": self.growth_per_level,
			"type": self.growth_type.name,
			"variance": self.variance,
			"cap": self.cap
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "StatGrowth":
		"""Create from dictionary."""
		return cls(
			base=data["base"],
			growth_per_level=data["growth"],
			growth_type=GrowthType[data.get("type", "LINEAR")],
			variance=data.get("variance", 0.0),
			cap=data.get("cap", 9999)
		)


@dataclass
class Equipment:
	"""Equipment that modifies stats."""
	name: str
	slot: str
	stat_bonuses: Dict[str, int] = field(default_factory=dict)
	requirements: Dict[str, int] = field(default_factory=dict)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"name": self.name,
			"slot": self.slot,
			"stats": self.stat_bonuses
		}
		if self.requirements:
			result["requirements"] = self.requirements
		return result


@dataclass
class CharacterClass:
	"""A character class with stat growths."""
	name: str
	growths: Dict[str, StatGrowth] = field(default_factory=dict)
	base_stats: Dict[str, int] = field(default_factory=dict)
	stat_caps: Dict[str, int] = field(default_factory=dict)
	equippable_types: List[str] = field(default_factory=list)
	skills: List[Tuple[int, str]] = field(default_factory=list)  # (level, skill)
	
	def get_stats_at_level(self, level: int) -> Dict[str, int]:
		"""Get all stats at a level."""
		stats = {}
		for stat_name, growth in self.growths.items():
			stats[stat_name] = growth.calculate(level)
		return stats
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"growths": {k: v.to_dict() for k, v in self.growths.items()},
			"base_stats": self.base_stats,
			"stat_caps": self.stat_caps,
			"equippable": self.equippable_types,
			"skills": [{"level": l, "skill": s} for l, s in self.skills]
		}
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "CharacterClass":
		"""Create from dictionary."""
		growths = {k: StatGrowth.from_dict(v) for k, v in data.get("growths", {}).items()}
		skills = [(s["level"], s["skill"]) for s in data.get("skills", [])]
		
		return cls(
			name=data["name"],
			growths=growths,
			base_stats=data.get("base_stats", {}),
			stat_caps=data.get("stat_caps", {}),
			equippable_types=data.get("equippable", []),
			skills=skills
		)


@dataclass
class Character:
	"""A character with class and equipment."""
	name: str
	char_class: CharacterClass
	level: int = 1
	equipment: Dict[str, Equipment] = field(default_factory=dict)
	bonus_stats: Dict[str, int] = field(default_factory=dict)
	
	def get_base_stats(self) -> Dict[str, int]:
		"""Get stats from class/level without equipment."""
		return self.char_class.get_stats_at_level(self.level)
	
	def get_equipment_bonus(self) -> Dict[str, int]:
		"""Get total stat bonuses from equipment."""
		bonuses: Dict[str, int] = {}
		for equip in self.equipment.values():
			for stat, value in equip.stat_bonuses.items():
				bonuses[stat] = bonuses.get(stat, 0) + value
		return bonuses
	
	def get_total_stats(self) -> Dict[str, int]:
		"""Get total stats including all modifiers."""
		stats = self.get_base_stats()
		
		# Add equipment bonuses
		for stat, value in self.get_equipment_bonus().items():
			stats[stat] = stats.get(stat, 0) + value
		
		# Add bonus stats
		for stat, value in self.bonus_stats.items():
			stats[stat] = stats.get(stat, 0) + value
		
		# Apply caps
		for stat, cap in self.char_class.stat_caps.items():
			if stat in stats:
				stats[stat] = min(stats[stat], cap)
		
		return stats
	
	def get_skills_learned(self) -> List[str]:
		"""Get skills learned at current level."""
		return [skill for lvl, skill in self.char_class.skills if lvl <= self.level]


class StatsCalculator:
	"""Calculate and compare character stats."""
	
	def __init__(self):
		self.classes: Dict[str, CharacterClass] = {}
		self.equipment_db: Dict[str, Equipment] = {}
		self.metadata: Dict[str, Any] = {}
	
	def add_class(self, char_class: CharacterClass) -> None:
		"""Add character class."""
		self.classes[char_class.name] = char_class
	
	def add_equipment(self, equipment: Equipment) -> None:
		"""Add equipment to database."""
		self.equipment_db[equipment.name] = equipment
	
	def calculate_progression(self, class_name: str, 
							  max_level: int = 99,
							  step: int = 10) -> List[Dict[str, Any]]:
		"""Calculate stat progression for a class."""
		if class_name not in self.classes:
			return []
		
		char_class = self.classes[class_name]
		progression = []
		
		for level in range(1, max_level + 1, step):
			stats = char_class.get_stats_at_level(level)
			skills = [s for l, s in char_class.skills if l <= level]
			
			progression.append({
				"level": level,
				"stats": stats,
				"skills_count": len(skills),
				"latest_skill": skills[-1] if skills else None
			})
		
		return progression
	
	def compare_classes(self, level: int = 50,
						stat: str = None) -> List[Dict[str, Any]]:
		"""Compare all classes at a level."""
		comparison = []
		
		for class_name, char_class in self.classes.items():
			stats = char_class.get_stats_at_level(level)
			
			entry = {
				"class": class_name,
				"stats": stats,
				"total": sum(stats.values())
			}
			
			if stat:
				entry["target_stat"] = stats.get(stat, 0)
			
			comparison.append(entry)
		
		# Sort by total or target stat
		sort_key = "target_stat" if stat else "total"
		comparison.sort(key=lambda x: x.get(sort_key, 0), reverse=True)
		
		return comparison
	
	def find_best_class(self, priorities: Dict[str, float]) -> str:
		"""Find best class based on stat priorities."""
		scores = []
		
		for class_name, char_class in self.classes.items():
			stats = char_class.get_stats_at_level(50)
			
			score = 0
			for stat, weight in priorities.items():
				score += stats.get(stat, 0) * weight
			
			scores.append((class_name, score))
		
		scores.sort(key=lambda x: x[1], reverse=True)
		return scores[0][0] if scores else ""
	
	def calculate_damage(self, attack: int, defense: int,
						 formula: str = "basic") -> int:
		"""Calculate damage using common formulas."""
		if formula == "basic":
			# Basic: ATK - DEF/2
			return max(1, attack - defense // 2)
		elif formula == "dq":
			# Dragon Quest style
			import random
			base = (attack - defense // 2) // 2
			variance = base // 4
			return max(1, base + random.randint(-variance, variance))
		elif formula == "ff":
			# Final Fantasy style
			base = attack * attack // (attack + defense)
			return max(1, base)
		else:
			return max(1, attack - defense)
	
	def calculate_exp_curve(self, formula: str = "quadratic",
							max_level: int = 99) -> List[Tuple[int, int]]:
		"""Calculate experience curve."""
		curve = []
		total = 0
		
		for level in range(1, max_level + 1):
			if formula == "linear":
				exp_needed = 100 * level
			elif formula == "quadratic":
				exp_needed = int(50 * level ** 2)
			elif formula == "cubic":
				exp_needed = int(10 * level ** 3)
			elif formula == "dq":
				# Dragon Quest style
				exp_needed = int(level ** 3 * 0.8 + level ** 2 * 4)
			else:
				exp_needed = 100 * level
			
			total += exp_needed
			curve.append((level, total))
		
		return curve
	
	def load(self, filepath: str) -> None:
		"""Load from JSON file."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		
		for class_data in data.get("classes", []):
			char_class = CharacterClass.from_dict(class_data)
			self.add_class(char_class)
		
		for equip_data in data.get("equipment", []):
			equipment = Equipment(
				name=equip_data["name"],
				slot=equip_data["slot"],
				stat_bonuses=equip_data.get("stats", {}),
				requirements=equip_data.get("requirements", {})
			)
			self.add_equipment(equipment)
	
	def save(self, filepath: str) -> None:
		"""Save to JSON file."""
		data = {
			"metadata": self.metadata,
			"classes": [c.to_dict() for c in self.classes.values()],
			"equipment": [e.to_dict() for e in self.equipment_db.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)


def create_example_config() -> StatsCalculator:
	"""Create example configuration."""
	calc = StatsCalculator()
	calc.metadata = {"game": "Example RPG", "version": "1.0"}
	
	# Warrior class
	warrior = CharacterClass(
		name="Warrior",
		growths={
			"hp": StatGrowth(30, 8.0, GrowthType.LINEAR, cap=999),
			"mp": StatGrowth(5, 1.0, GrowthType.LINEAR, cap=99),
			"attack": StatGrowth(10, 4.0, GrowthType.LINEAR, cap=255),
			"defense": StatGrowth(8, 3.5, GrowthType.LINEAR, cap=255),
			"speed": StatGrowth(6, 2.0, GrowthType.LINEAR, cap=255)
		},
		equippable_types=["sword", "axe", "heavy_armor", "shield"],
		skills=[
			(5, "Power Strike"),
			(10, "Guard"),
			(20, "War Cry"),
			(35, "Berserk")
		]
	)
	calc.add_class(warrior)
	
	# Mage class
	mage = CharacterClass(
		name="Mage",
		growths={
			"hp": StatGrowth(20, 4.0, GrowthType.LINEAR, cap=999),
			"mp": StatGrowth(15, 5.0, GrowthType.LINEAR, cap=999),
			"attack": StatGrowth(5, 1.5, GrowthType.LINEAR, cap=255),
			"defense": StatGrowth(4, 1.5, GrowthType.LINEAR, cap=255),
			"speed": StatGrowth(7, 2.5, GrowthType.LINEAR, cap=255)
		},
		equippable_types=["staff", "rod", "light_armor"],
		skills=[
			(1, "Fire"),
			(5, "Blizzard"),
			(10, "Thunder"),
			(20, "Firaga"),
			(30, "Meteor")
		]
	)
	calc.add_class(mage)
	
	# Healer class
	healer = CharacterClass(
		name="Healer",
		growths={
			"hp": StatGrowth(25, 5.0, GrowthType.LINEAR, cap=999),
			"mp": StatGrowth(20, 6.0, GrowthType.LINEAR, cap=999),
			"attack": StatGrowth(4, 1.0, GrowthType.LINEAR, cap=255),
			"defense": StatGrowth(5, 2.0, GrowthType.LINEAR, cap=255),
			"speed": StatGrowth(5, 2.0, GrowthType.LINEAR, cap=255)
		},
		equippable_types=["staff", "light_armor"],
		skills=[
			(1, "Heal"),
			(8, "Cure Poison"),
			(15, "Healall"),
			(25, "Revive"),
			(40, "Full Heal")
		]
	)
	calc.add_class(healer)
	
	# Thief class
	thief = CharacterClass(
		name="Thief",
		growths={
			"hp": StatGrowth(22, 5.0, GrowthType.LINEAR, cap=999),
			"mp": StatGrowth(8, 2.0, GrowthType.LINEAR, cap=99),
			"attack": StatGrowth(8, 3.0, GrowthType.LINEAR, cap=255),
			"defense": StatGrowth(5, 2.0, GrowthType.LINEAR, cap=255),
			"speed": StatGrowth(12, 4.0, GrowthType.LINEAR, cap=255)
		},
		equippable_types=["dagger", "sword", "light_armor"],
		skills=[
			(3, "Steal"),
			(10, "Backstab"),
			(18, "Escape"),
			(30, "Assassinate")
		]
	)
	calc.add_class(thief)
	
	return calc


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Character Stats Calculator")
	parser.add_argument("config", nargs="?", help="Config JSON file")
	parser.add_argument("--class", "-c", dest="char_class",
						help="Calculate for class")
	parser.add_argument("--level", "-l", type=int, default=50,
						help="Level to calculate")
	parser.add_argument("--compare", action="store_true",
						help="Compare all classes")
	parser.add_argument("--progression", "-p", action="store_true",
						help="Show level progression")
	parser.add_argument("--exp-curve", action="store_true",
						help="Show experience curve")
	parser.add_argument("--export", "-e", help="Export to file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example config")
	
	args = parser.parse_args()
	
	calc = StatsCalculator()
	
	if args.create_example:
		calc = create_example_config()
		output = args.config or "stats_config.json"
		calc.save(output)
		print(f"Created example config: {output}")
		print(f"Classes: {len(calc.classes)}")
		return
	
	if args.config:
		if os.path.exists(args.config):
			calc.load(args.config)
			print(f"Loaded: {args.config}")
			print(f"Classes: {len(calc.classes)}")
		else:
			print(f"Config not found: {args.config}")
			print("Use --create-example to create a new config")
			return
	else:
		# Demo mode
		calc = create_example_config()
		print("Character Stats Calculator")
		print()
		print("Usage: python stats_calculator.py <config.json>")
		print()
		print("Demo mode - using example config:")
	
	print()
	
	# Calculate for specific class
	if args.char_class:
		if args.char_class in calc.classes:
			char_class = calc.classes[args.char_class]
			stats = char_class.get_stats_at_level(args.level)
			
			print(f"{args.char_class} at Level {args.level}:")
			for stat, value in stats.items():
				print(f"  {stat.upper()}: {value}")
			
			skills = [s for l, s in char_class.skills if l <= args.level]
			if skills:
				print(f"\nSkills learned: {', '.join(skills)}")
		else:
			print(f"Class not found: {args.char_class}")
			print(f"Available: {', '.join(calc.classes.keys())}")
		print()
	
	# Compare classes
	if args.compare:
		comparison = calc.compare_classes(args.level)
		
		print(f"Class Comparison at Level {args.level}:")
		print("-" * 60)
		
		for entry in comparison:
			print(f"\n{entry['class']} (Total: {entry['total']})")
			for stat, value in entry["stats"].items():
				print(f"  {stat.upper()}: {value:4d}", end="")
			print()
		print()
	
	# Show progression
	if args.progression:
		class_name = args.char_class or list(calc.classes.keys())[0]
		if class_name in calc.classes:
			progression = calc.calculate_progression(class_name)
			
			print(f"{class_name} Progression:")
			print("-" * 60)
			
			for entry in progression:
				stats_str = " | ".join(f"{k}:{v}" for k, v in entry["stats"].items())
				print(f"Lv{entry['level']:3d}: {stats_str}")
		print()
	
	# Show exp curve
	if args.exp_curve:
		curve = calc.calculate_exp_curve("dq")
		
		print("Experience Curve (DQ style):")
		print("-" * 40)
		
		for level, total in curve[::10]:  # Every 10 levels
			print(f"Level {level:3d}: {total:,} total exp")
		print()
	
	# Export
	if args.export:
		calc.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
