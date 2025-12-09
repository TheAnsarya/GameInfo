#!/usr/bin/env python3
"""
Battle System Analyzer - Analyze RPG battle mechanics from ROM data.

Extracts and documents battle formulas, damage calculations, AI patterns,
and combat mechanics from game ROMs.

Usage:
	python battle_analyzer.py <rom_file> --game dw4
	python battle_analyzer.py <rom_file> --trace-combat

Features:
	- Extract damage formulas
	- Analyze AI patterns
	- Document status effects
	- Parse combat tables
	- Generate battle documentation
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import IntEnum, IntFlag
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class DamageType(IntEnum):
	"""Damage types."""
	PHYSICAL = 0
	MAGICAL = 1
	FIRE = 2
	ICE = 3
	LIGHTNING = 4
	WIND = 5
	EARTH = 6
	DARK = 7
	HOLY = 8
	POISON = 9
	FIXED = 10


class TargetType(IntEnum):
	"""Target types."""
	SINGLE_ENEMY = 0
	ALL_ENEMIES = 1
	SINGLE_ALLY = 2
	ALL_ALLIES = 3
	SELF = 4
	RANDOM_ENEMY = 5
	RANDOM_ALLY = 6


class StatusEffect(IntFlag):
	"""Status effect flags."""
	NONE = 0x00
	POISON = 0x01
	PARALYZE = 0x02
	SLEEP = 0x04
	CONFUSE = 0x08
	SILENCE = 0x10
	BLIND = 0x20
	DEATH = 0x40
	STONE = 0x80


@dataclass
class MonsterData:
	"""Monster statistics."""
	id: int
	name: str = ""
	hp: int = 0
	mp: int = 0
	attack: int = 0
	defense: int = 0
	agility: int = 0
	exp: int = 0
	gold: int = 0
	resistances: int = 0
	weaknesses: int = 0
	ai_pattern: int = 0
	actions: List[int] = field(default_factory=list)
	drop_item: int = 0
	drop_rate: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"stats": {
				"hp": self.hp,
				"mp": self.mp,
				"attack": self.attack,
				"defense": self.defense,
				"agility": self.agility
			},
			"rewards": {
				"exp": self.exp,
				"gold": self.gold,
				"item": self.drop_item,
				"drop_rate": self.drop_rate
			},
			"ai_pattern": f"0x{self.ai_pattern:02X}",
			"actions": [f"0x{a:02X}" for a in self.actions],
			"resistances": f"0x{self.resistances:02X}",
			"weaknesses": f"0x{self.weaknesses:02X}"
		}


@dataclass
class SpellData:
	"""Spell/ability data."""
	id: int
	name: str = ""
	mp_cost: int = 0
	power: int = 0
	damage_type: DamageType = DamageType.MAGICAL
	target_type: TargetType = TargetType.SINGLE_ENEMY
	status_effect: int = 0
	success_rate: int = 100
	element: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"mp_cost": self.mp_cost,
			"power": self.power,
			"damage_type": self.damage_type.name,
			"target": self.target_type.name,
			"status": f"0x{self.status_effect:02X}",
			"success_rate": self.success_rate,
			"element": self.element
		}


@dataclass
class AIAction:
	"""AI action entry."""
	condition_type: int
	condition_value: int
	action: int
	weight: int = 1

	def describe(self) -> str:
		"""Describe the action."""
		conditions = {
			0x00: "Always",
			0x01: "HP < {value}%",
			0x02: "HP > {value}%",
			0x03: "Turn > {value}",
			0x04: "Turn < {value}",
			0x05: "Random {value}%",
			0x06: "Ally dead",
			0x07: "All allies alive",
			0x08: "Status on self",
			0x09: "Player has status"
		}

		cond_str = conditions.get(self.condition_type, f"Cond 0x{self.condition_type:02X}")
		if "{value}" in cond_str:
			cond_str = cond_str.format(value=self.condition_value)

		return f"If {cond_str}: Action 0x{self.action:02X} (weight: {self.weight})"


@dataclass
class AIPattern:
	"""Complete AI pattern."""
	id: int
	actions: List[AIAction] = field(default_factory=list)
	default_action: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": f"0x{self.id:02X}",
			"actions": [
				{
					"condition_type": a.condition_type,
					"condition_value": a.condition_value,
					"action": f"0x{a.action:02X}",
					"weight": a.weight,
					"description": a.describe()
				}
				for a in self.actions
			],
			"default_action": f"0x{self.default_action:02X}"
		}


class DamageFormula:
	"""Represents a damage calculation formula."""

	def __init__(self, formula_type: str, components: Dict[str, Any]):
		self.formula_type = formula_type
		self.components = components

	def calculate(self, attacker: Dict[str, int], defender: Dict[str, int],
				  spell_power: int = 0) -> int:
		"""Calculate damage using the formula."""
		if self.formula_type == "physical":
			# Basic physical: ATK - DEF/2
			base = attacker.get("attack", 0) - defender.get("defense", 0) // 2
			variance = self.components.get("variance", 0.25)
			# Random variance would be applied here
			return max(1, base)

		elif self.formula_type == "magical":
			# Magic: Power * (MAG/4) - MDEF/2
			power = spell_power or self.components.get("power", 10)
			magic = attacker.get("magic", attacker.get("attack", 0))
			mdef = defender.get("magic_def", defender.get("defense", 0) // 2)
			base = power * (magic // 4) - mdef // 2
			return max(1, base)

		elif self.formula_type == "dw4_physical":
			# Dragon Warrior 4 physical formula
			# Damage = ATK - DEF/2, with random variance
			atk = attacker.get("attack", 0)
			defe = defender.get("defense", 0)
			base = atk - defe // 2
			# Variance is typically +/- 1/8 of base
			return max(1, base)

		elif self.formula_type == "dw4_spell":
			# Dragon Warrior 4 spell damage
			# Base damage from spell table, modified by resistance
			return spell_power

		return 0

	def to_string(self) -> str:
		"""Get formula as human-readable string."""
		if self.formula_type == "physical":
			return "ATK - DEF/2 ± variance"
		elif self.formula_type == "magical":
			return "Power × (MAG/4) - MDEF/2"
		elif self.formula_type == "dw4_physical":
			return "ATK - DEF/2 ± ATK/8"
		elif self.formula_type == "dw4_spell":
			return "SpellPower × (1 - Resistance)"
		return self.formula_type


class BattleAnalyzer:
	"""Analyze battle system from ROM data."""

	def __init__(self, rom_data: bytes, game_type: str = "generic"):
		self.rom_data = rom_data
		self.game_type = game_type.lower()
		self.monsters: List[MonsterData] = []
		self.spells: List[SpellData] = []
		self.ai_patterns: List[AIPattern] = []
		self.formulas: Dict[str, DamageFormula] = {}

		# Game-specific configurations
		self.configs = {
			"dw4": {
				"monster_table": 0x2C010,
				"monster_count": 179,
				"monster_size": 32,
				"spell_table": 0x2D000,
				"spell_count": 64,
				"spell_size": 8,
				"ai_table": 0x2E000,
			},
			"ff4": {
				"monster_table": 0x0F0000,
				"monster_count": 256,
				"monster_size": 32,
			},
			"generic": {
				"monster_table": 0,
				"monster_count": 0,
				"monster_size": 16,
			}
		}

		self.config = self.configs.get(game_type, self.configs["generic"])

	def analyze(self) -> Dict[str, Any]:
		"""Perform full battle system analysis."""
		result = {
			"game_type": self.game_type,
			"monsters": [],
			"spells": [],
			"ai_patterns": [],
			"formulas": {},
			"analysis": {}
		}

		# Extract data
		self._extract_monsters()
		self._extract_spells()
		self._analyze_ai()
		self._analyze_formulas()

		# Convert to output format
		result["monsters"] = [m.to_dict() for m in self.monsters]
		result["spells"] = [s.to_dict() for s in self.spells]
		result["ai_patterns"] = [p.to_dict() for p in self.ai_patterns]
		result["formulas"] = {
			name: {"type": f.formula_type, "formula": f.to_string()}
			for name, f in self.formulas.items()
		}

		# Statistical analysis
		result["analysis"] = self._statistical_analysis()

		return result

	def _extract_monsters(self) -> None:
		"""Extract monster data from ROM."""
		if self.game_type == "dw4":
			self._extract_dw4_monsters()
		else:
			self._extract_generic_monsters()

	def _extract_dw4_monsters(self) -> None:
		"""Extract Dragon Warrior 4 monster data."""
		table_offset = self.config["monster_table"]
		count = self.config["monster_count"]
		size = self.config["monster_size"]

		for i in range(count):
			offset = table_offset + i * size
			if offset + size > len(self.rom_data):
				break

			# DW4 monster format (approximate)
			# Byte 0-1: HP
			# Byte 2-3: MP
			# Byte 4: Attack
			# Byte 5: Defense
			# Byte 6: Agility
			# Byte 7-8: Exp
			# Byte 9-10: Gold
			# Byte 11: Resistances
			# Byte 12: AI Pattern
			# Byte 13-16: Actions
			# Byte 17: Drop item
			# Byte 18: Drop rate

			monster = MonsterData(
				id=i,
				hp=struct.unpack_from("<H", self.rom_data, offset)[0],
				mp=struct.unpack_from("<H", self.rom_data, offset + 2)[0],
				attack=self.rom_data[offset + 4],
				defense=self.rom_data[offset + 5],
				agility=self.rom_data[offset + 6],
				exp=struct.unpack_from("<H", self.rom_data, offset + 7)[0],
				gold=struct.unpack_from("<H", self.rom_data, offset + 9)[0],
				resistances=self.rom_data[offset + 11],
				ai_pattern=self.rom_data[offset + 12],
				actions=list(self.rom_data[offset + 13:offset + 17]),
				drop_item=self.rom_data[offset + 17] if offset + 17 < len(self.rom_data) else 0,
				drop_rate=self.rom_data[offset + 18] if offset + 18 < len(self.rom_data) else 0
			)

			self.monsters.append(monster)

	def _extract_generic_monsters(self) -> None:
		"""Extract monsters using generic heuristics."""
		# Look for patterns that might be monster tables
		# Common patterns: sequential HP values, stat groupings

		# Placeholder for generic extraction
		pass

	def _extract_spells(self) -> None:
		"""Extract spell data from ROM."""
		if self.game_type == "dw4":
			self._extract_dw4_spells()

	def _extract_dw4_spells(self) -> None:
		"""Extract Dragon Warrior 4 spell data."""
		table_offset = self.config.get("spell_table", 0)
		count = self.config.get("spell_count", 64)
		size = self.config.get("spell_size", 8)

		if table_offset == 0:
			return

		for i in range(count):
			offset = table_offset + i * size
			if offset + size > len(self.rom_data):
				break

			# DW4 spell format (approximate)
			# Byte 0: MP cost
			# Byte 1: Power
			# Byte 2: Target type
			# Byte 3: Damage type / Element
			# Byte 4: Status effect
			# Byte 5: Success rate

			spell = SpellData(
				id=i,
				mp_cost=self.rom_data[offset],
				power=self.rom_data[offset + 1],
				target_type=TargetType(self.rom_data[offset + 2] & 0x0F),
				damage_type=DamageType(self.rom_data[offset + 3] & 0x0F),
				status_effect=self.rom_data[offset + 4],
				success_rate=self.rom_data[offset + 5],
				element=self.rom_data[offset + 3] >> 4
			)

			self.spells.append(spell)

	def _analyze_ai(self) -> None:
		"""Analyze AI patterns."""
		if self.game_type == "dw4":
			self._analyze_dw4_ai()

	def _analyze_dw4_ai(self) -> None:
		"""Analyze Dragon Warrior 4 AI patterns."""
		ai_offset = self.config.get("ai_table", 0)
		if ai_offset == 0:
			return

		# Get unique AI pattern IDs from monsters
		pattern_ids = set(m.ai_pattern for m in self.monsters)

		for pattern_id in sorted(pattern_ids):
			# AI patterns are typically variable length
			# Each action has: condition type, condition value, action, weight

			pattern = AIPattern(id=pattern_id)
			offset = ai_offset + pattern_id * 16  # Approximate

			if offset >= len(self.rom_data):
				continue

			# Parse up to 4 actions per pattern
			for i in range(4):
				action_offset = offset + i * 4
				if action_offset + 4 > len(self.rom_data):
					break

				cond_type = self.rom_data[action_offset]
				cond_value = self.rom_data[action_offset + 1]
				action = self.rom_data[action_offset + 2]
				weight = self.rom_data[action_offset + 3]

				if cond_type == 0xFF:  # End marker
					break

				pattern.actions.append(AIAction(
					condition_type=cond_type,
					condition_value=cond_value,
					action=action,
					weight=weight
				))

			self.ai_patterns.append(pattern)

	def _analyze_formulas(self) -> None:
		"""Analyze and identify damage formulas."""
		if self.game_type == "dw4":
			self.formulas["physical"] = DamageFormula(
				"dw4_physical",
				{"variance": 0.125}
			)
			self.formulas["magical"] = DamageFormula(
				"dw4_spell",
				{}
			)
		else:
			# Generic formulas
			self.formulas["physical"] = DamageFormula(
				"physical",
				{"variance": 0.25}
			)
			self.formulas["magical"] = DamageFormula(
				"magical",
				{}
			)

	def _statistical_analysis(self) -> Dict[str, Any]:
		"""Perform statistical analysis of battle data."""
		if not self.monsters:
			return {}

		stats = {}

		# HP distribution
		hp_values = [m.hp for m in self.monsters if m.hp > 0]
		if hp_values:
			stats["hp"] = {
				"min": min(hp_values),
				"max": max(hp_values),
				"avg": sum(hp_values) / len(hp_values)
			}

		# Attack distribution
		atk_values = [m.attack for m in self.monsters if m.attack > 0]
		if atk_values:
			stats["attack"] = {
				"min": min(atk_values),
				"max": max(atk_values),
				"avg": sum(atk_values) / len(atk_values)
			}

		# Defense distribution
		def_values = [m.defense for m in self.monsters if m.defense > 0]
		if def_values:
			stats["defense"] = {
				"min": min(def_values),
				"max": max(def_values),
				"avg": sum(def_values) / len(def_values)
			}

		# Experience scaling
		exp_values = [(m.hp, m.exp) for m in self.monsters if m.exp > 0 and m.hp > 0]
		if len(exp_values) > 10:
			# Calculate correlation between HP and EXP
			hp_list, exp_list = zip(*exp_values)
			avg_hp = sum(hp_list) / len(hp_list)
			avg_exp = sum(exp_list) / len(exp_list)

			numerator = sum((h - avg_hp) * (e - avg_exp) for h, e in exp_values)
			denom_hp = sum((h - avg_hp) ** 2 for h in hp_list) ** 0.5
			denom_exp = sum((e - avg_exp) ** 2 for e in exp_list) ** 0.5

			if denom_hp > 0 and denom_exp > 0:
				correlation = numerator / (denom_hp * denom_exp)
				stats["hp_exp_correlation"] = round(correlation, 3)

		# AI pattern distribution
		pattern_counts: Dict[int, int] = {}
		for m in self.monsters:
			pattern_counts[m.ai_pattern] = pattern_counts.get(m.ai_pattern, 0) + 1

		stats["ai_patterns"] = {
			"unique_patterns": len(pattern_counts),
			"most_common": max(pattern_counts.items(), key=lambda x: x[1])[0] if pattern_counts else 0
		}

		# Resistance analysis
		resistance_counts: Dict[int, int] = {}
		for m in self.monsters:
			for bit in range(8):
				if m.resistances & (1 << bit):
					resistance_counts[bit] = resistance_counts.get(bit, 0) + 1

		stats["resistances"] = {
			f"type_{k}": v for k, v in resistance_counts.items()
		}

		return stats

	def generate_documentation(self) -> str:
		"""Generate markdown documentation of battle system."""
		lines = []
		lines.append("# Battle System Documentation")
		lines.append("")
		lines.append(f"Game Type: {self.game_type}")
		lines.append("")

		# Damage Formulas
		lines.append("## Damage Formulas")
		lines.append("")
		for name, formula in self.formulas.items():
			lines.append(f"### {name.title()}")
			lines.append(f"- Type: {formula.formula_type}")
			lines.append(f"- Formula: `{formula.to_string()}`")
			lines.append("")

		# Monster Statistics
		lines.append("## Monster Statistics")
		lines.append("")
		lines.append("| ID | Name | HP | MP | ATK | DEF | AGI | EXP | Gold |")
		lines.append("|---:|------|---:|---:|---:|---:|---:|---:|---:|")

		for monster in self.monsters[:50]:  # Limit output
			lines.append(
				f"| {monster.id} | {monster.name or f'Monster_{monster.id}'} | "
				f"{monster.hp} | {monster.mp} | {monster.attack} | "
				f"{monster.defense} | {monster.agility} | "
				f"{monster.exp} | {monster.gold} |"
			)

		if len(self.monsters) > 50:
			lines.append(f"| ... | ... ({len(self.monsters) - 50} more) | ... | ... | ... | ... | ... | ... | ... |")

		lines.append("")

		# AI Patterns
		lines.append("## AI Patterns")
		lines.append("")

		for pattern in self.ai_patterns[:20]:
			lines.append(f"### Pattern 0x{pattern.id:02X}")
			for action in pattern.actions:
				lines.append(f"- {action.describe()}")
			lines.append("")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Battle System Analyzer")
	parser.add_argument("rom", help="ROM file to analyze")
	parser.add_argument("--game", "-g", default="generic",
						help="Game type (dw4, ff4, generic)")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--format", "-f", choices=["json", "markdown", "text"],
						default="json", help="Output format")
	parser.add_argument("--monsters", action="store_true",
						help="List all monsters")
	parser.add_argument("--spells", action="store_true",
						help="List all spells")
	parser.add_argument("--ai", action="store_true",
						help="Show AI analysis")

	args = parser.parse_args()

	if not os.path.exists(args.rom):
		print(f"Error: ROM file not found: {args.rom}")
		sys.exit(1)

	# Load ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()

	print(f"Analyzing: {args.rom}")
	print(f"Game type: {args.game}")
	print(f"ROM size: {len(rom_data):,} bytes")
	print()

	# Create analyzer
	analyzer = BattleAnalyzer(rom_data, args.game)

	# Perform analysis
	results = analyzer.analyze()

	# Output
	if args.format == "markdown":
		output = analyzer.generate_documentation()
	elif args.format == "json":
		output = json.dumps(results, indent="\t")
	else:
		# Text format
		lines = []
		lines.append(f"Monsters found: {len(results['monsters'])}")
		lines.append(f"Spells found: {len(results['spells'])}")
		lines.append(f"AI patterns: {len(results['ai_patterns'])}")
		lines.append("")

		if args.monsters:
			lines.append("Monsters:")
			for m in results["monsters"][:20]:
				lines.append(f"  #{m['id']}: HP={m['stats']['hp']} ATK={m['stats']['attack']} DEF={m['stats']['defense']}")

		if args.spells:
			lines.append("\nSpells:")
			for s in results["spells"][:20]:
				lines.append(f"  #{s['id']}: MP={s['mp_cost']} Power={s['power']} {s['damage_type']}")

		if args.ai:
			lines.append("\nAI Patterns:")
			for p in results["ai_patterns"][:10]:
				lines.append(f"  Pattern {p['id']}:")
				for a in p["actions"]:
					lines.append(f"    - {a['description']}")

		output = "\n".join(lines)

	# Write output
	if args.output:
		with open(args.output, "w", encoding="utf-8") as f:
			f.write(output)
		print(f"Output written to: {args.output}")
	else:
		print(output)


if __name__ == "__main__":
	main()
