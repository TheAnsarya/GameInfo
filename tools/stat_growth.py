#!/usr/bin/env python3
"""
Stat Growth Editor - Edit character stat progression curves.

Tools for modifying how stats grow when characters level up.

Usage:
	python stat_growth.py --analyze hero_growth.bin
	python stat_growth.py --generate linear 1-99 --base 10 --growth 5
	python stat_growth.py --edit growth.json

Features:
	- Growth curve patterns
	- Per-level stat tables
	- Class modifiers
	- Random variance
	- Stat caps
"""

import argparse
import json
import math
import random
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class GrowthType(Enum):
	"""Stat growth types."""
	FIXED = 0           # Same amount each level
	LINEAR = 1          # Linear growth
	CURVED = 2          # Polynomial curve
	RANDOM = 3          # Random within range
	TABLE = 4           # Lookup table
	HYBRID = 5          # Base + random


class StatType(Enum):
	"""Common stat types."""
	HP = 0
	MP = 1
	STRENGTH = 2
	DEFENSE = 3
	AGILITY = 4
	INTELLIGENCE = 5
	LUCK = 6
	ATTACK = 7
	MAGIC_ATTACK = 8
	MAGIC_DEFENSE = 9


@dataclass
class StatGrowth:
	"""Growth parameters for a single stat."""
	stat_type: StatType
	growth_type: GrowthType

	# Base values
	base_value: int = 10
	max_value: int = 999

	# Fixed/Linear growth
	fixed_growth: int = 1

	# Curved growth
	curve_power: float = 1.0
	curve_scale: float = 1.0

	# Random growth
	min_growth: int = 0
	max_growth: int = 5

	# Level thresholds (for changing growth rate)
	thresholds: Dict[int, int] = field(default_factory=dict)

	# Table for TABLE type
	growth_table: List[int] = field(default_factory=list)

	def get_growth_at_level(self, level: int) -> int:
		"""Get stat growth amount for a level."""
		if self.growth_type == GrowthType.FIXED:
			return self.fixed_growth

		elif self.growth_type == GrowthType.LINEAR:
			# Check thresholds
			current_growth = self.fixed_growth
			for threshold_level, growth_val in sorted(self.thresholds.items()):
				if level >= threshold_level:
					current_growth = growth_val
			return current_growth

		elif self.growth_type == GrowthType.CURVED:
			return int(self.curve_scale * (level ** self.curve_power))

		elif self.growth_type == GrowthType.RANDOM:
			return random.randint(self.min_growth, self.max_growth)

		elif self.growth_type == GrowthType.TABLE:
			if self.growth_table and level <= len(self.growth_table):
				return self.growth_table[level - 1]
			return self.fixed_growth

		elif self.growth_type == GrowthType.HYBRID:
			base = self.fixed_growth
			rand = random.randint(self.min_growth, self.max_growth)
			return base + rand

		return 0

	def get_stat_at_level(self, level: int) -> int:
		"""Get total stat value at a level."""
		value = self.base_value
		for lvl in range(2, level + 1):
			value += self.get_growth_at_level(lvl)
		return min(value, self.max_value)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"stat_type": self.stat_type.name,
			"growth_type": self.growth_type.name,
			"base_value": self.base_value,
			"max_value": self.max_value,
			"fixed_growth": self.fixed_growth,
			"curve_power": self.curve_power,
			"curve_scale": self.curve_scale,
			"min_growth": self.min_growth,
			"max_growth": self.max_growth,
			"thresholds": self.thresholds,
			"growth_table": self.growth_table
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "StatGrowth":
		"""Create from dictionary."""
		return cls(
			stat_type=StatType[data.get("stat_type", "HP")],
			growth_type=GrowthType[data.get("growth_type", "FIXED")],
			base_value=data.get("base_value", 10),
			max_value=data.get("max_value", 999),
			fixed_growth=data.get("fixed_growth", 1),
			curve_power=data.get("curve_power", 1.0),
			curve_scale=data.get("curve_scale", 1.0),
			min_growth=data.get("min_growth", 0),
			max_growth=data.get("max_growth", 5),
			thresholds=data.get("thresholds", {}),
			growth_table=data.get("growth_table", [])
		)


@dataclass
class CharacterGrowth:
	"""Full character growth profile."""
	name: str
	char_id: int = 0

	# Stats
	stats: Dict[StatType, StatGrowth] = field(default_factory=dict)

	# Class/job modifier
	class_name: str = ""

	def get_all_stats_at_level(self, level: int) -> Dict[StatType, int]:
		"""Get all stats at a level."""
		return {
			stat_type: growth.get_stat_at_level(level)
			for stat_type, growth in self.stats.items()
		}

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"char_id": self.char_id,
			"class_name": self.class_name,
			"stats": {k.name: v.to_dict() for k, v in self.stats.items()}
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "CharacterGrowth":
		"""Create from dictionary."""
		char = cls(
			name=data.get("name", "Unknown"),
			char_id=data.get("char_id", 0),
			class_name=data.get("class_name", "")
		)

		for stat_name, stat_data in data.get("stats", {}).items():
			stat_type = StatType[stat_name]
			char.stats[stat_type] = StatGrowth.from_dict(stat_data)

		return char


class StatGrowthEditor:
	"""Editor for stat growth systems."""

	def __init__(self):
		self.characters: Dict[str, CharacterGrowth] = {}

	def create_character(self, name: str, char_id: int = 0) -> CharacterGrowth:
		"""Create a new character."""
		char = CharacterGrowth(name=name, char_id=char_id)
		self.characters[name] = char
		return char

	def add_stat(self, char_name: str, stat_type: StatType,
				growth: StatGrowth) -> bool:
		"""Add stat growth to character."""
		if char_name in self.characters:
			self.characters[char_name].stats[stat_type] = growth
			return True
		return False

	def load_binary(self, path: Path, format_spec: Dict) -> List[CharacterGrowth]:
		"""Load growth data from binary."""
		data = path.read_bytes()
		characters = []

		offset = format_spec.get("offset", 0)
		char_size = format_spec.get("char_size", 16)
		char_count = format_spec.get("char_count", 1)
		stat_order = format_spec.get("stat_order", ["HP", "MP", "STRENGTH"])

		for i in range(char_count):
			char_offset = offset + i * char_size
			char = CharacterGrowth(name=f"Character_{i}", char_id=i)

			stat_offset = 0
			for stat_name in stat_order:
				if char_offset + stat_offset + 2 <= len(data):
					base = data[char_offset + stat_offset]
					growth = data[char_offset + stat_offset + 1]

					stat_type = StatType[stat_name]
					char.stats[stat_type] = StatGrowth(
						stat_type=stat_type,
						growth_type=GrowthType.FIXED,
						base_value=base,
						fixed_growth=growth
					)
					stat_offset += 2

			characters.append(char)
			self.characters[char.name] = char

		return characters

	def save_binary(self, path: Path, characters: List[CharacterGrowth],
				   format_spec: Dict):
		"""Save growth data to binary."""
		char_size = format_spec.get("char_size", 16)
		stat_order = format_spec.get("stat_order", ["HP", "MP", "STRENGTH"])

		data = bytearray()

		for char in characters:
			char_data = bytearray(char_size)
			stat_offset = 0

			for stat_name in stat_order:
				stat_type = StatType[stat_name]
				if stat_type in char.stats:
					growth = char.stats[stat_type]
					char_data[stat_offset] = growth.base_value & 0xFF
					char_data[stat_offset + 1] = growth.fixed_growth & 0xFF
				stat_offset += 2

			data.extend(char_data)

		path.write_bytes(data)

	def load_json(self, path: Path):
		"""Load from JSON."""
		with open(path) as f:
			data = json.load(f)

		for char_data in data.get("characters", []):
			char = CharacterGrowth.from_dict(char_data)
			self.characters[char.name] = char

	def save_json(self, path: Path):
		"""Save to JSON."""
		data = {
			"characters": [c.to_dict() for c in self.characters.values()]
		}

		with open(path, "w") as f:
			json.dump(data, f, indent="\t")

	def generate_growth_table(self, growth: StatGrowth,
							 max_level: int = 99) -> List[int]:
		"""Generate stat values for all levels."""
		return [growth.get_stat_at_level(lvl) for lvl in range(1, max_level + 1)]

	def compare_characters(self, stat_type: StatType,
						  levels: List[int] = None) -> str:
		"""Compare characters for a specific stat."""
		if not levels:
			levels = [1, 10, 25, 50, 75, 99]

		lines = []
		lines.append(f"Character Comparison: {stat_type.name}")
		lines.append("=" * 80)

		# Header
		header = f"{'Level':>6}"
		for name in self.characters:
			header += f" {name[:12]:>12}"
		lines.append(header)
		lines.append("-" * 80)

		# Data rows
		for level in levels:
			row = f"{level:>6}"
			for char in self.characters.values():
				if stat_type in char.stats:
					value = char.stats[stat_type].get_stat_at_level(level)
					row += f" {value:>12}"
				else:
					row += f" {'N/A':>12}"
			lines.append(row)

		return "\n".join(lines)

	def format_character(self, char: CharacterGrowth, max_level: int = 99) -> str:
		"""Format character growth table."""
		lines = []
		lines.append(f"Character: {char.name}")
		if char.class_name:
			lines.append(f"Class: {char.class_name}")
		lines.append("=" * 70)

		# Header
		header = f"{'Level':>6}"
		for stat_type in char.stats:
			header += f" {stat_type.name[:8]:>8}"
		lines.append(header)
		lines.append("-" * 70)

		# Show key levels
		key_levels = [1, 5, 10, 15, 20, 25, 30, 40, 50, 60, 70, 80, 90, 99]
		for level in key_levels:
			if level > max_level:
				break
			row = f"{level:>6}"
			for growth in char.stats.values():
				value = growth.get_stat_at_level(level)
				row += f" {value:>8}"
			lines.append(row)

		return "\n".join(lines)

	def analyze_growth(self, growth: StatGrowth,
					  max_level: int = 99) -> Dict[str, Any]:
		"""Analyze stat growth."""
		values = self.generate_growth_table(growth, max_level)

		# Calculate growth rates
		growths = []
		for i in range(1, len(values)):
			growth_amount = values[i] - values[i - 1]
			growths.append(growth_amount)

		return {
			"stat_type": growth.stat_type.name,
			"growth_type": growth.growth_type.name,
			"base_value": growth.base_value,
			"final_value": values[-1],
			"total_growth": values[-1] - values[0],
			"avg_growth": sum(growths) / len(growths) if growths else 0,
			"min_growth": min(growths) if growths else 0,
			"max_growth": max(growths) if growths else 0,
			"growth_variance": self._variance(growths) if growths else 0
		}

	def _variance(self, values: List[int]) -> float:
		"""Calculate variance."""
		if not values:
			return 0
		avg = sum(values) / len(values)
		return sum((v - avg) ** 2 for v in values) / len(values)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Stat Growth Editor")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Analyze growth file")
	parser.add_argument("--generate", "-g", type=str,
						choices=["fixed", "linear", "curved", "random", "hybrid"],
						help="Generate growth curve")
	parser.add_argument("--base", "-b", type=int, default=10,
						help="Base stat value")
	parser.add_argument("--growth", type=int, default=2,
						help="Growth per level")
	parser.add_argument("--min-growth", type=int, default=0,
						help="Min random growth")
	parser.add_argument("--max-growth", type=int, default=5,
						help="Max random growth")
	parser.add_argument("--levels", "-l", type=int, default=99,
						help="Max level")
	parser.add_argument("--stat", "-s", type=str, default="HP",
						choices=[s.name for s in StatType],
						help="Stat type")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--input", "-i", type=Path,
						help="Input JSON file")
	parser.add_argument("--compare", "-c", action="store_true",
						help="Compare loaded characters")

	args = parser.parse_args()
	editor = StatGrowthEditor()

	if args.input:
		editor.load_json(args.input)

		if args.compare:
			for stat_type in StatType:
				# Check if any character has this stat
				has_stat = any(stat_type in c.stats for c in editor.characters.values())
				if has_stat:
					print(editor.compare_characters(stat_type))
					print()
		else:
			for char in editor.characters.values():
				print(editor.format_character(char, args.levels))
				print()
		return

	if args.generate:
		# Create sample character
		char = editor.create_character("Generated", 0)

		growth_type = GrowthType[args.generate.upper()]
		stat_type = StatType[args.stat]

		growth = StatGrowth(
			stat_type=stat_type,
			growth_type=growth_type,
			base_value=args.base,
			fixed_growth=args.growth,
			min_growth=args.min_growth,
			max_growth=args.max_growth
		)

		char.stats[stat_type] = growth

		print(editor.format_character(char, args.levels))
		print()

		analysis = editor.analyze_growth(growth, args.levels)
		print("Analysis:")
		for k, v in analysis.items():
			if isinstance(v, float):
				print(f"  {k}: {v:.2f}")
			else:
				print(f"  {k}: {v}")

		if args.output:
			editor.save_json(args.output)
			print(f"\nSaved to: {args.output}")
		return

	# Default: show help
	print("Stat Growth Editor")
	print()
	print("Usage:")
	print("  --generate TYPE          Generate growth curve")
	print("  --input FILE             Load JSON file")
	print("  --compare                Compare characters")
	print("  --output FILE            Save to JSON")
	print()
	print("Growth Types: fixed, linear, curved, random, hybrid")
	print("Stat Types:", ", ".join(s.name for s in StatType))


if __name__ == "__main__":
	main()
