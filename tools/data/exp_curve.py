#!/usr/bin/env python3
"""
Experience Curve Editor - Analyze and modify RPG experience curves.

Tools for working with experience/leveling systems in retro RPGs.

Usage:
	python exp_curve.py --analyze exp_table.bin
	python exp_curve.py --fit 0 100 350 800 1500 2600
	python exp_curve.py --generate polynomial 99 --params 1.5 10 0

Features:
	- Common curve patterns
	- Curve fitting
	- Table generation
	- Visualization
	- Import/export
"""

import argparse
import json
import math
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple


class CurveType(Enum):
	"""Experience curve types."""
	LINEAR = 0           # n * base
	POLYNOMIAL = 1       # a*n^b + c
	EXPONENTIAL = 2      # a * b^n
	FIBONACCI = 3        # Fibonacci-based
	CUSTOM = 4           # Table lookup
	DQ_STYLE = 5         # Dragon Quest pattern
	FF_STYLE = 6         # Final Fantasy pattern


@dataclass
class ExpCurve:
	"""Experience curve definition."""
	name: str
	curve_type: CurveType
	max_level: int = 99

	# Parameters for formula-based curves
	param_a: float = 1.0
	param_b: float = 2.0
	param_c: float = 0.0

	# Custom table
	exp_table: List[int] = field(default_factory=list)

	# Computed cache
	_cache: Dict[int, int] = field(default_factory=dict)

	def get_exp_for_level(self, level: int) -> int:
		"""Get total EXP needed for level."""
		if level <= 1:
			return 0

		if level in self._cache:
			return self._cache[level]

		if self.curve_type == CurveType.CUSTOM and self.exp_table:
			idx = min(level - 1, len(self.exp_table) - 1)
			return self.exp_table[idx]

		exp = self._calculate(level)
		self._cache[level] = exp
		return exp

	def _calculate(self, level: int) -> int:
		"""Calculate EXP for level."""
		if self.curve_type == CurveType.LINEAR:
			return int(self.param_a * level + self.param_c)

		elif self.curve_type == CurveType.POLYNOMIAL:
			return int(self.param_a * (level ** self.param_b) + self.param_c)

		elif self.curve_type == CurveType.EXPONENTIAL:
			return int(self.param_a * (self.param_b ** level) + self.param_c)

		elif self.curve_type == CurveType.FIBONACCI:
			return self._fibonacci_exp(level)

		elif self.curve_type == CurveType.DQ_STYLE:
			return self._dq_style(level)

		elif self.curve_type == CurveType.FF_STYLE:
			return self._ff_style(level)

		return 0

	def _fibonacci_exp(self, level: int) -> int:
		"""Fibonacci-based curve."""
		a, b = 0, 1
		total = 0
		for _ in range(level):
			a, b = b, a + b
			total += int(a * self.param_a)
		return total

	def _dq_style(self, level: int) -> int:
		"""Dragon Quest style curve."""
		# DQ uses roughly n^3 / k pattern
		return int((level ** 3) / 6 + level * 5)

	def _ff_style(self, level: int) -> int:
		"""Final Fantasy style curve."""
		# FF uses varying growth rates
		if level <= 20:
			return int(100 * level * level)
		elif level <= 50:
			return int(200 * level * level - 2000)
		else:
			return int(300 * level * level - 7000)

	def get_exp_to_next(self, level: int) -> int:
		"""Get EXP needed for next level."""
		if level >= self.max_level:
			return 0
		current = self.get_exp_for_level(level)
		next_lvl = self.get_exp_for_level(level + 1)
		return next_lvl - current

	def get_level_for_exp(self, exp: int) -> int:
		"""Get level for given EXP total."""
		for level in range(1, self.max_level + 1):
			if self.get_exp_for_level(level) > exp:
				return level - 1
		return self.max_level

	def generate_table(self) -> List[int]:
		"""Generate complete EXP table."""
		return [self.get_exp_for_level(lvl) for lvl in range(1, self.max_level + 1)]

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"curve_type": self.curve_type.name,
			"max_level": self.max_level,
			"param_a": self.param_a,
			"param_b": self.param_b,
			"param_c": self.param_c,
			"exp_table": self.exp_table if self.curve_type == CurveType.CUSTOM else []
		}

	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "ExpCurve":
		"""Create from dictionary."""
		return cls(
			name=data.get("name", "Unknown"),
			curve_type=CurveType[data.get("curve_type", "POLYNOMIAL")],
			max_level=data.get("max_level", 99),
			param_a=data.get("param_a", 1.0),
			param_b=data.get("param_b", 2.0),
			param_c=data.get("param_c", 0.0),
			exp_table=data.get("exp_table", [])
		)


class ExpCurveEditor:
	"""Editor for experience curves."""

	def __init__(self):
		self.curves: Dict[str, ExpCurve] = {}

	def create_curve(self, name: str, curve_type: CurveType,
					max_level: int = 99, **params) -> ExpCurve:
		"""Create a new curve."""
		curve = ExpCurve(
			name=name,
			curve_type=curve_type,
			max_level=max_level,
			param_a=params.get("param_a", 1.0),
			param_b=params.get("param_b", 2.0),
			param_c=params.get("param_c", 0.0)
		)
		self.curves[name] = curve
		return curve

	def load_table(self, path: Path, word_size: int = 2,
				  endian: str = "little") -> List[int]:
		"""Load EXP table from binary."""
		data = path.read_bytes()

		fmt_char = "H" if word_size == 2 else "I"
		endian_char = "<" if endian == "little" else ">"

		count = len(data) // word_size
		table = []

		for i in range(count):
			offset = i * word_size
			value = struct.unpack(f"{endian_char}{fmt_char}",
								  data[offset:offset + word_size])[0]
			table.append(value)

		return table

	def save_table(self, table: List[int], path: Path,
				  word_size: int = 2, endian: str = "little"):
		"""Save EXP table to binary."""
		fmt_char = "H" if word_size == 2 else "I"
		endian_char = "<" if endian == "little" else ">"

		data = b""
		for value in table:
			data += struct.pack(f"{endian_char}{fmt_char}", value)

		path.write_bytes(data)

	def fit_curve(self, values: List[int]) -> Tuple[CurveType, Dict[str, float], float]:
		"""Fit curve to observed values."""
		best_fit = None
		best_error = float("inf")
		best_params = {}

		# Try polynomial fitting
		for exp in [1.5, 2.0, 2.5, 3.0]:
			error, params = self._fit_polynomial(values, exp)
			if error < best_error:
				best_error = error
				best_fit = CurveType.POLYNOMIAL
				best_params = params

		# Try DQ style
		error = self._calculate_error(values, self._dq_values(len(values)))
		if error < best_error:
			best_error = error
			best_fit = CurveType.DQ_STYLE
			best_params = {}

		# Try FF style
		error = self._calculate_error(values, self._ff_values(len(values)))
		if error < best_error:
			best_error = error
			best_fit = CurveType.FF_STYLE
			best_params = {}

		return best_fit, best_params, best_error

	def _fit_polynomial(self, values: List[int],
					   exponent: float) -> Tuple[float, Dict[str, float]]:
		"""Fit polynomial to values."""
		# Simple least squares for a*x^b + c
		n = len(values)

		# Calculate coefficients
		sum_xb = sum((i + 1) ** exponent for i in range(n))
		sum_y = sum(values)
		sum_xb_y = sum(values[i] * ((i + 1) ** exponent) for i in range(n))
		sum_xb2 = sum(((i + 1) ** exponent) ** 2 for i in range(n))

		# Solve for a (simplified)
		a = sum_xb_y / sum_xb2 if sum_xb2 > 0 else 1
		c = (sum_y - a * sum_xb) / n

		# Calculate error
		predicted = [int(a * ((i + 1) ** exponent) + c) for i in range(n)]
		error = self._calculate_error(values, predicted)

		return error, {"param_a": a, "param_b": exponent, "param_c": c}

	def _calculate_error(self, actual: List[int], predicted: List[int]) -> float:
		"""Calculate RMS error."""
		if not actual:
			return float("inf")

		squared_errors = sum((a - p) ** 2 for a, p in zip(actual, predicted))
		return math.sqrt(squared_errors / len(actual))

	def _dq_values(self, count: int) -> List[int]:
		"""Generate DQ-style values."""
		return [int((i ** 3) / 6 + i * 5) for i in range(1, count + 1)]

	def _ff_values(self, count: int) -> List[int]:
		"""Generate FF-style values."""
		result = []
		for i in range(1, count + 1):
			if i <= 20:
				result.append(int(100 * i * i))
			elif i <= 50:
				result.append(int(200 * i * i - 2000))
			else:
				result.append(int(300 * i * i - 7000))
		return result

	def compare_curves(self, levels: List[int] = None) -> str:
		"""Compare all curves."""
		if not levels:
			levels = [1, 10, 25, 50, 75, 99]

		lines = []
		lines.append("Experience Curve Comparison")
		lines.append("=" * 80)

		# Header
		header = f"{'Level':>6}"
		for name in self.curves:
			header += f" {name:>12}"
		lines.append(header)
		lines.append("-" * 80)

		# Data rows
		for level in levels:
			row = f"{level:>6}"
			for curve in self.curves.values():
				exp = curve.get_exp_for_level(level)
				row += f" {exp:>12,}"
			lines.append(row)

		return "\n".join(lines)

	def analyze_curve(self, curve: ExpCurve) -> Dict[str, Any]:
		"""Analyze curve properties."""
		table = curve.generate_table()

		# Calculate growth rates
		growth_rates = []
		for i in range(1, len(table)):
			if table[i - 1] > 0:
				rate = table[i] / table[i - 1]
				growth_rates.append(rate)

		# Find inflection points
		differences = [table[i] - table[i - 1] for i in range(1, len(table))]
		diff_changes = []
		for i in range(1, len(differences)):
			if differences[i - 1] > 0:
				change = differences[i] / differences[i - 1]
				diff_changes.append((i + 1, change))

		# Find levels with significant changes
		inflections = [(lvl, chg) for lvl, chg in diff_changes if chg > 1.5 or chg < 0.7]

		return {
			"name": curve.name,
			"curve_type": curve.curve_type.name,
			"max_level": curve.max_level,
			"total_exp": table[-1] if table else 0,
			"avg_growth_rate": sum(growth_rates) / len(growth_rates) if growth_rates else 0,
			"min_growth_rate": min(growth_rates) if growth_rates else 0,
			"max_growth_rate": max(growth_rates) if growth_rates else 0,
			"inflection_points": inflections[:10]  # Top 10
		}

	def format_table(self, curve: ExpCurve, columns: int = 4) -> str:
		"""Format EXP table for display."""
		table = curve.generate_table()

		lines = []
		lines.append(f"Experience Table: {curve.name}")
		lines.append(f"Type: {curve.curve_type.name}")
		lines.append("=" * 60)

		# Show columns
		col_width = 60 // columns

		for start in range(0, len(table), columns):
			row_parts = []
			for i in range(columns):
				idx = start + i
				if idx < len(table):
					level = idx + 1
					exp = table[idx]
					row_parts.append(f"Lv{level:>2}: {exp:>8,}")
			lines.append("  ".join(row_parts))

		return "\n".join(lines)

	def format_analysis(self, curve: ExpCurve) -> str:
		"""Format curve analysis."""
		analysis = self.analyze_curve(curve)

		lines = []
		lines.append(f"Curve Analysis: {analysis['name']}")
		lines.append("=" * 50)
		lines.append(f"Type:            {analysis['curve_type']}")
		lines.append(f"Max Level:       {analysis['max_level']}")
		lines.append(f"Total EXP:       {analysis['total_exp']:,}")
		lines.append(f"Avg Growth:      {analysis['avg_growth_rate']:.2f}x")
		lines.append(f"Min Growth:      {analysis['min_growth_rate']:.2f}x")
		lines.append(f"Max Growth:      {analysis['max_growth_rate']:.2f}x")

		if analysis["inflection_points"]:
			lines.append("")
			lines.append("Inflection Points:")
			for lvl, chg in analysis["inflection_points"][:5]:
				lines.append(f"  Level {lvl}: {chg:.2f}x change")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Experience Curve Editor")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Analyze EXP table from file")
	parser.add_argument("--fit", "-f", nargs="+", type=int,
						help="Fit curve to values")
	parser.add_argument("--generate", "-g", type=str,
						help="Generate curve (polynomial, dq_style, ff_style, linear)")
	parser.add_argument("--params", "-p", nargs=3, type=float,
						metavar=("A", "B", "C"),
						help="Parameters for curve generation")
	parser.add_argument("--levels", "-l", type=int, default=99,
						help="Max level")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--word-size", "-w", type=int, default=2,
						help="Word size for binary (2 or 4)")
	parser.add_argument("--endian", "-e", choices=["little", "big"],
						default="little", help="Byte order")
	parser.add_argument("--compare", "-c", action="store_true",
						help="Compare standard curves")

	args = parser.parse_args()
	editor = ExpCurveEditor()

	if args.analyze:
		table = editor.load_table(args.analyze, args.word_size, args.endian)

		# Create custom curve from table
		curve = ExpCurve(
			name=args.analyze.stem,
			curve_type=CurveType.CUSTOM,
			max_level=len(table),
			exp_table=table
		)

		print(editor.format_table(curve))
		print()
		print(editor.format_analysis(curve))

		# Try to fit
		fit_type, fit_params, error = editor.fit_curve(table)
		print()
		print(f"Best Fit: {fit_type.name}")
		print(f"Error: {error:.2f}")
		if fit_params:
			for k, v in fit_params.items():
				print(f"  {k}: {v:.4f}")
		return

	if args.fit:
		fit_type, fit_params, error = editor.fit_curve(args.fit)
		print("Curve Fitting Results")
		print("=" * 40)
		print(f"Values: {args.fit}")
		print(f"Best Fit: {fit_type.name}")
		print(f"Error: {error:.2f}")
		if fit_params:
			for k, v in fit_params.items():
				print(f"  {k}: {v:.4f}")
		return

	if args.generate:
		# Map name to curve type
		type_map = {
			"polynomial": CurveType.POLYNOMIAL,
			"linear": CurveType.LINEAR,
			"dq_style": CurveType.DQ_STYLE,
			"ff_style": CurveType.FF_STYLE,
			"exponential": CurveType.EXPONENTIAL,
			"fibonacci": CurveType.FIBONACCI
		}

		curve_type = type_map.get(args.generate.lower(), CurveType.POLYNOMIAL)

		params = {}
		if args.params:
			params = {
				"param_a": args.params[0],
				"param_b": args.params[1],
				"param_c": args.params[2]
			}

		curve = editor.create_curve(
			name="Generated",
			curve_type=curve_type,
			max_level=args.levels,
			**params
		)

		print(editor.format_table(curve))
		print()
		print(editor.format_analysis(curve))

		if args.output:
			table = curve.generate_table()
			editor.save_table(table, args.output, args.word_size, args.endian)
			print(f"\nSaved to: {args.output}")
		return

	if args.compare:
		# Create standard curves
		editor.create_curve("Linear", CurveType.LINEAR, args.levels, param_a=100)
		editor.create_curve("Polynomial", CurveType.POLYNOMIAL, args.levels, param_a=10, param_b=2)
		editor.create_curve("DQ Style", CurveType.DQ_STYLE, args.levels)
		editor.create_curve("FF Style", CurveType.FF_STYLE, args.levels)

		print(editor.compare_curves())
		return

	# Default: show help
	print("Experience Curve Editor")
	print()
	print("Usage:")
	print("  --analyze FILE           Analyze binary EXP table")
	print("  --fit VAL1 VAL2 ...      Fit curve to values")
	print("  --generate TYPE          Generate curve")
	print("  --compare                Compare standard curves")
	print()
	print("Curve Types: polynomial, linear, dq_style, ff_style, exponential, fibonacci")


if __name__ == "__main__":
	main()
