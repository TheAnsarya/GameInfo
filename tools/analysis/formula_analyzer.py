#!/usr/bin/env python3
"""
Battle Formula Analyzer - Analyze and test RPG damage formulas.

Tools for understanding and testing damage calculation formulas
used in retro RPGs.

Usage:
	python formula_analyzer.py --damage 50 20 10
	python formula_analyzer.py --test formulas.json
	python formula_analyzer.py --reverse 100 60 15 45

Features:
	- Common formula patterns
	- Parameter testing
	- Reverse engineering
	- Statistical analysis
	- Formula comparison
"""

import argparse
import json
import math
import random
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple


class FormulaType(Enum):
	"""Common formula types."""
	LINEAR = 0           # attack - defense
	PERCENTAGE = 1       # attack * (100 - defense) / 100
	QUADRATIC = 2        # attack^2 / (attack + defense)
	SQRT = 3             # sqrt(attack) - sqrt(defense)
	LEVEL_BASED = 4      # (attack * level) / defense
	FIXED_RANDOM = 5     # base + random(0, variance)
	DQ_STYLE = 6         # (attack - defense/2) * random
	FF_STYLE = 7         # ((attack^2 / defense) * multiplier) / 4


@dataclass
class FormulaParameter:
	"""A parameter in a formula."""
	name: str
	value: float = 0
	min_val: float = 0
	max_val: float = 999
	description: str = ""

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"value": self.value,
			"min": self.min_val,
			"max": self.max_val,
			"description": self.description
		}


@dataclass
class Formula:
	"""A damage/effect formula."""
	name: str
	description: str
	formula_type: FormulaType
	expression: str  # Human-readable

	# Parameters
	parameters: List[FormulaParameter] = field(default_factory=list)

	# Bounds
	min_result: int = 0
	max_result: int = 9999

	# Variance
	variance_percent: int = 0  # Random variance %
	variance_absolute: int = 0  # Fixed variance

	def calculate(self, **kwargs) -> float:
		"""Calculate formula result."""
		# Override for specific formulas
		return 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"description": self.description,
			"formula_type": self.formula_type.name,
			"expression": self.expression,
			"parameters": [p.to_dict() for p in self.parameters],
			"min_result": self.min_result,
			"max_result": self.max_result,
			"variance_percent": self.variance_percent,
			"variance_absolute": self.variance_absolute
		}


class LinearFormula(Formula):
	"""Simple attack - defense formula."""

	def __init__(self):
		super().__init__(
			name="Linear",
			description="Simple subtraction: attack - defense",
			formula_type=FormulaType.LINEAR,
			expression="damage = ATK - DEF"
		)
		self.parameters = [
			FormulaParameter("attack", description="Attack power"),
			FormulaParameter("defense", description="Defense power")
		]

	def calculate(self, attack: float = 0, defense: float = 0, **kwargs) -> float:
		"""Calculate damage."""
		damage = attack - defense
		return max(self.min_result, min(self.max_result, damage))


class PercentageFormula(Formula):
	"""Percentage-based reduction formula."""

	def __init__(self):
		super().__init__(
			name="Percentage",
			description="Defense reduces by percentage",
			formula_type=FormulaType.PERCENTAGE,
			expression="damage = ATK * (100 - DEF) / 100"
		)
		self.parameters = [
			FormulaParameter("attack", description="Attack power"),
			FormulaParameter("defense", description="Defense % (0-100)")
		]

	def calculate(self, attack: float = 0, defense: float = 0, **kwargs) -> float:
		"""Calculate damage."""
		defense = min(100, max(0, defense))
		damage = attack * (100 - defense) / 100
		return max(self.min_result, min(self.max_result, damage))


class QuadraticFormula(Formula):
	"""Quadratic formula used in many RPGs."""

	def __init__(self):
		super().__init__(
			name="Quadratic",
			description="ATK squared divided by ATK + DEF",
			formula_type=FormulaType.QUADRATIC,
			expression="damage = ATK^2 / (ATK + DEF)"
		)
		self.parameters = [
			FormulaParameter("attack", description="Attack power"),
			FormulaParameter("defense", description="Defense power")
		]

	def calculate(self, attack: float = 0, defense: float = 0, **kwargs) -> float:
		"""Calculate damage."""
		if attack + defense == 0:
			return 0
		damage = (attack * attack) / (attack + defense)
		return max(self.min_result, min(self.max_result, damage))


class DQStyleFormula(Formula):
	"""Dragon Quest style damage formula."""

	def __init__(self):
		super().__init__(
			name="Dragon Quest Style",
			description="Attack - Defense/2, with variance",
			formula_type=FormulaType.DQ_STYLE,
			expression="damage = (ATK - DEF/2) * random(0.875, 1.0)"
		)
		self.parameters = [
			FormulaParameter("attack", description="Attack power"),
			FormulaParameter("defense", description="Defense power")
		]
		self.variance_percent = 12  # ~7/8 to 1

	def calculate(self, attack: float = 0, defense: float = 0,
				  with_variance: bool = True, **kwargs) -> float:
		"""Calculate damage."""
		base = attack - (defense / 2)
		if with_variance:
			# DQ uses 7/8 to 1 multiplier
			mult = random.uniform(0.875, 1.0)
			damage = base * mult
		else:
			damage = base
		return max(self.min_result, min(self.max_result, damage))


class FFStyleFormula(Formula):
	"""Final Fantasy style damage formula."""

	def __init__(self):
		super().__init__(
			name="Final Fantasy Style",
			description="Power * (ATK^2 / DEF) / 4",
			formula_type=FormulaType.FF_STYLE,
			expression="damage = Power * (ATK^2 / DEF) / 4"
		)
		self.parameters = [
			FormulaParameter("power", description="Skill power"),
			FormulaParameter("attack", description="Attack stat"),
			FormulaParameter("defense", description="Defense stat")
		]
		self.variance_percent = 25

	def calculate(self, power: float = 100, attack: float = 0,
				  defense: float = 1, with_variance: bool = True, **kwargs) -> float:
		"""Calculate damage."""
		if defense <= 0:
			defense = 1
		base = power * (attack * attack / defense) / 4
		if with_variance:
			mult = random.uniform(0.75, 1.25)
			damage = base * mult
		else:
			damage = base
		return max(self.min_result, min(self.max_result, damage))


class LevelBasedFormula(Formula):
	"""Level-based damage formula."""

	def __init__(self):
		super().__init__(
			name="Level Based",
			description="Incorporates level into calculation",
			formula_type=FormulaType.LEVEL_BASED,
			expression="damage = (ATK * LVL) / (DEF + LVL/2)"
		)
		self.parameters = [
			FormulaParameter("attack", description="Attack power"),
			FormulaParameter("defense", description="Defense power"),
			FormulaParameter("level", description="Character level")
		]

	def calculate(self, attack: float = 0, defense: float = 0,
				  level: float = 1, **kwargs) -> float:
		"""Calculate damage."""
		divisor = defense + (level / 2)
		if divisor <= 0:
			divisor = 1
		damage = (attack * level) / divisor
		return max(self.min_result, min(self.max_result, damage))


class FormulaAnalyzer:
	"""Analyzer for damage formulas."""

	def __init__(self):
		self.formulas: Dict[str, Formula] = {}
		self._register_standard_formulas()

	def _register_standard_formulas(self):
		"""Register standard formula types."""
		self.formulas["linear"] = LinearFormula()
		self.formulas["percentage"] = PercentageFormula()
		self.formulas["quadratic"] = QuadraticFormula()
		self.formulas["dq_style"] = DQStyleFormula()
		self.formulas["ff_style"] = FFStyleFormula()
		self.formulas["level_based"] = LevelBasedFormula()

	def calculate(self, formula_name: str, **kwargs) -> float:
		"""Calculate using named formula."""
		formula = self.formulas.get(formula_name.lower())
		if formula:
			return formula.calculate(**kwargs)
		return 0

	def test_formula(self, formula_name: str, attack_range: Tuple[int, int],
					defense_range: Tuple[int, int], samples: int = 100) -> Dict[str, Any]:
		"""Test formula with ranges."""
		formula = self.formulas.get(formula_name.lower())
		if not formula:
			return {"error": f"Unknown formula: {formula_name}"}

		results = []
		for _ in range(samples):
			attack = random.randint(*attack_range)
			defense = random.randint(*defense_range)
			damage = formula.calculate(attack=attack, defense=defense, with_variance=False)
			results.append({
				"attack": attack,
				"defense": defense,
				"damage": damage
			})

		damages = [r["damage"] for r in results]
		return {
			"formula": formula_name,
			"samples": samples,
			"attack_range": attack_range,
			"defense_range": defense_range,
			"min_damage": min(damages),
			"max_damage": max(damages),
			"avg_damage": sum(damages) / len(damages),
			"results": results[:10]  # First 10 for display
		}

	def compare_formulas(self, attack: float, defense: float) -> List[Dict[str, Any]]:
		"""Compare all formulas with same input."""
		results = []
		for name, formula in self.formulas.items():
			damage = formula.calculate(attack=attack, defense=defense,
									   with_variance=False, power=100, level=50)
			results.append({
				"name": name,
				"formula": formula.expression,
				"damage": damage
			})
		return sorted(results, key=lambda x: x["damage"], reverse=True)

	def reverse_engineer(self, observed_damage: float, attack: float,
						defense: float, tolerance: float = 5) -> List[Dict[str, Any]]:
		"""Find formulas that could produce observed damage."""
		matches = []

		for name, formula in self.formulas.items():
			# Calculate expected
			expected = formula.calculate(attack=attack, defense=defense,
										with_variance=False, power=100, level=50)

			diff = abs(expected - observed_damage)
			diff_percent = (diff / observed_damage * 100) if observed_damage else 0

			if diff_percent <= tolerance:
				matches.append({
					"name": name,
					"expected": expected,
					"difference": diff,
					"diff_percent": diff_percent
				})

		return sorted(matches, key=lambda x: x["difference"])

	def analyze_variance(self, formula_name: str, attack: float,
						defense: float, samples: int = 1000) -> Dict[str, Any]:
		"""Analyze variance of a formula."""
		formula = self.formulas.get(formula_name.lower())
		if not formula:
			return {"error": f"Unknown formula: {formula_name}"}

		results = []
		for _ in range(samples):
			damage = formula.calculate(attack=attack, defense=defense,
									   with_variance=True, power=100, level=50)
			results.append(damage)

		avg = sum(results) / len(results)
		variance = sum((x - avg) ** 2 for x in results) / len(results)
		std_dev = math.sqrt(variance)

		# Distribution
		buckets = {}
		bucket_size = max(1, int((max(results) - min(results)) / 10))
		for r in results:
			bucket = int(r / bucket_size) * bucket_size
			buckets[bucket] = buckets.get(bucket, 0) + 1

		return {
			"formula": formula_name,
			"attack": attack,
			"defense": defense,
			"samples": samples,
			"min": min(results),
			"max": max(results),
			"average": avg,
			"std_dev": std_dev,
			"variance": variance,
			"distribution": dict(sorted(buckets.items()))
		}

	def format_comparison(self, attack: float, defense: float) -> str:
		"""Format formula comparison."""
		results = self.compare_formulas(attack, defense)

		lines = []
		lines.append(f"Formula Comparison (ATK={attack}, DEF={defense})")
		lines.append("=" * 60)
		lines.append(f"{'Formula':<20} {'Result':>10} {'Expression':<30}")
		lines.append("-" * 60)

		for r in results:
			lines.append(f"{r['name']:<20} {r['damage']:>10.1f} {r['formula']:<30}")

		return "\n".join(lines)

	def format_variance(self, formula_name: str, attack: float,
					   defense: float, samples: int = 1000) -> str:
		"""Format variance analysis."""
		result = self.analyze_variance(formula_name, attack, defense, samples)

		if "error" in result:
			return result["error"]

		lines = []
		lines.append(f"Variance Analysis: {formula_name}")
		lines.append(f"ATK={attack}, DEF={defense}, Samples={samples}")
		lines.append("=" * 40)
		lines.append(f"Min:       {result['min']:.1f}")
		lines.append(f"Max:       {result['max']:.1f}")
		lines.append(f"Average:   {result['average']:.1f}")
		lines.append(f"Std Dev:   {result['std_dev']:.2f}")
		lines.append("")
		lines.append("Distribution:")

		max_count = max(result['distribution'].values()) if result['distribution'] else 1
		for bucket, count in result['distribution'].items():
			bar_len = int(count / max_count * 30)
			bar = "#" * bar_len
			lines.append(f"  {bucket:>5}: {bar} ({count})")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Battle Formula Analyzer")
	parser.add_argument("--damage", nargs=2, type=float, metavar=("ATK", "DEF"),
						help="Calculate damage with ATK and DEF")
	parser.add_argument("--formula", "-f", default="linear",
						help="Formula to use (linear, percentage, quadratic, dq_style, ff_style, level_based)")
	parser.add_argument("--compare", "-c", nargs=2, type=float, metavar=("ATK", "DEF"),
						help="Compare all formulas")
	parser.add_argument("--reverse", "-r", nargs=3, type=float, metavar=("DAMAGE", "ATK", "DEF"),
						help="Reverse engineer formula from observed damage")
	parser.add_argument("--variance", "-v", nargs=2, type=float, metavar=("ATK", "DEF"),
						help="Analyze formula variance")
	parser.add_argument("--samples", type=int, default=1000,
						help="Number of samples for analysis")
	parser.add_argument("--level", type=float, default=50,
						help="Level for level-based formulas")
	parser.add_argument("--power", type=float, default=100,
						help="Power for FF-style formulas")
	parser.add_argument("--list", "-l", action="store_true",
						help="List available formulas")

	args = parser.parse_args()
	analyzer = FormulaAnalyzer()

	if args.list:
		print("Available Formulas:")
		print("=" * 50)
		for name, formula in analyzer.formulas.items():
			print(f"\n{name}:")
			print(f"  {formula.description}")
			print(f"  {formula.expression}")
		return

	if args.damage:
		attack, defense = args.damage
		result = analyzer.calculate(
			args.formula,
			attack=attack,
			defense=defense,
			level=args.level,
			power=args.power,
			with_variance=False
		)
		print(f"Formula: {args.formula}")
		print(f"ATK: {attack}, DEF: {defense}")
		print(f"Damage: {result:.1f}")
		return

	if args.compare:
		attack, defense = args.compare
		print(analyzer.format_comparison(attack, defense))
		return

	if args.reverse:
		damage, attack, defense = args.reverse
		print(f"Reverse Engineering: Damage={damage}, ATK={attack}, DEF={defense}")
		print("=" * 50)

		matches = analyzer.reverse_engineer(damage, attack, defense)
		if matches:
			for m in matches:
				print(f"{m['name']}: expected {m['expected']:.1f} (diff: {m['diff_percent']:.1f}%)")
		else:
			print("No matching formulas found within tolerance")
		return

	if args.variance:
		attack, defense = args.variance
		print(analyzer.format_variance(args.formula, attack, defense, args.samples))
		return

	# Default: show help
	print("Battle Formula Analyzer")
	print()
	print("Usage:")
	print("  --damage ATK DEF         Calculate damage")
	print("  --compare ATK DEF        Compare all formulas")
	print("  --reverse DMG ATK DEF    Find matching formula")
	print("  --variance ATK DEF       Analyze variance")
	print("  --formula NAME           Select formula")
	print("  --list                   List all formulas")
	print()
	print("Formulas: linear, percentage, quadratic, dq_style, ff_style, level_based")


if __name__ == "__main__":
	main()
