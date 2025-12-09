#!/usr/bin/env python3
"""
Battle Formula Analyzer Tool
Analyze and reverse-engineer battle formulas from game code.

Usage:
	python battle_formula_analyzer.py rom.nes --bank 19 --trace
	python battle_formula_analyzer.py rom.sfc --formula damage
	python battle_formula_analyzer.py rom.nes --simulate attack 100 50 25
"""

import argparse
import json
import os
import re
import sys
from collections import defaultdict
from pathlib import Path
from typing import Optional


class BattleFormulaAnalyzer:
	"""Analyze battle formulas in game code."""

	# Common battle-related opcodes patterns
	MULTIPLY_PATTERN = b'\xa9'  # LDA followed by multiply routines
	RANDOM_PATTERNS = [
		b'\x20',  # JSR to RNG
		b'\xad',  # LDA from RNG address
	]

	# Known formula types
	FORMULA_TYPES = {
		'damage': {
			'description': 'Physical damage calculation',
			'variables': ['attack', 'defense', 'weapon', 'level'],
			'typical_range': (1, 999)
		},
		'magic': {
			'description': 'Magic damage calculation',
			'variables': ['magic_power', 'resistance', 'spell_power', 'level'],
			'typical_range': (1, 999)
		},
		'hit_chance': {
			'description': 'Hit/miss calculation',
			'variables': ['agility', 'luck', 'evasion'],
			'typical_range': (0, 100)
		},
		'critical': {
			'description': 'Critical hit calculation',
			'variables': ['luck', 'level', 'critical_rate'],
			'typical_range': (0, 100)
		},
		'experience': {
			'description': 'Experience gained calculation',
			'variables': ['enemy_exp', 'party_size', 'level'],
			'typical_range': (1, 65535)
		},
		'gold': {
			'description': 'Gold dropped calculation',
			'variables': ['enemy_gold', 'luck'],
			'typical_range': (0, 65535)
		}
	}

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		self.rom_path = Path(rom_path)
		self.rom_data = None
		self.header_size = 0
		self.formulas = []

	def load_rom(self) -> bool:
		"""Load ROM file."""
		try:
			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()

			if self.rom_data[:4] == b'NES\x1a':
				self.header_size = 16

			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def find_multiply_routines(self, bank: int, bank_size: int = 0x4000) -> list:
		"""Find multiplication routines in a bank."""
		offset = self.header_size + (bank * bank_size)
		bank_data = self.rom_data[offset:offset + bank_size]

		routines = []

		# Look for common 8-bit multiply patterns
		# Typically: shift and add loops
		patterns = [
			# ROL + ADC pattern (multiply)
			bytes([0x2a, 0x90]),  # ROL A, BCC
			bytes([0x0a, 0x90]),  # ASL A, BCC
			# Loop-based multiply
			bytes([0xa2, 0x08]),  # LDX #$08 (8-bit counter)
		]

		for pattern in patterns:
			pos = 0
			while True:
				idx = bank_data.find(pattern, pos)
				if idx == -1:
					break

				routines.append({
					'offset': offset + idx,
					'bank': bank,
					'local_offset': idx,
					'pattern': pattern.hex()
				})
				pos = idx + 1

		return routines

	def find_rng_calls(self, bank: int, bank_size: int = 0x4000) -> list:
		"""Find RNG/random number calls in a bank."""
		offset = self.header_size + (bank * bank_size)
		bank_data = self.rom_data[offset:offset + bank_size]

		rng_calls = []

		# Look for JSR instructions
		for i in range(len(bank_data) - 2):
			if bank_data[i] == 0x20:  # JSR
				target = bank_data[i + 1] | (bank_data[i + 2] << 8)

				# Common RNG addresses (game-specific)
				# This would need customization per game
				rng_calls.append({
					'offset': offset + i,
					'target': f"${target:04x}",
					'bank': bank,
					'local_offset': i
				})

		return rng_calls

	def analyze_damage_formula(self, code_offset: int,
							   length: int = 0x100) -> dict:
		"""Analyze code at offset for damage formula patterns."""
		data = self.rom_data[code_offset:code_offset + length]

		analysis = {
			'offset': code_offset,
			'operations': [],
			'memory_reads': [],
			'memory_writes': [],
			'branches': [],
			'likely_formula': None
		}

		i = 0
		while i < len(data):
			opcode = data[i]

			# LDA immediate
			if opcode == 0xa9 and i + 1 < len(data):
				analysis['operations'].append({
					'type': 'load_immediate',
					'value': data[i + 1],
					'offset': code_offset + i
				})
				i += 2

			# LDA absolute
			elif opcode == 0xad and i + 2 < len(data):
				addr = data[i + 1] | (data[i + 2] << 8)
				analysis['memory_reads'].append({
					'address': f"${addr:04x}",
					'offset': code_offset + i
				})
				i += 3

			# STA absolute
			elif opcode == 0x8d and i + 2 < len(data):
				addr = data[i + 1] | (data[i + 2] << 8)
				analysis['memory_writes'].append({
					'address': f"${addr:04x}",
					'offset': code_offset + i
				})
				i += 3

			# ADC (add)
			elif opcode in [0x65, 0x69, 0x6d, 0x75, 0x79, 0x7d]:
				analysis['operations'].append({
					'type': 'add',
					'offset': code_offset + i
				})
				i += 2 if opcode in [0x65, 0x69, 0x75] else 3

			# SBC (subtract)
			elif opcode in [0xe5, 0xe9, 0xed, 0xf5, 0xf9, 0xfd]:
				analysis['operations'].append({
					'type': 'subtract',
					'offset': code_offset + i
				})
				i += 2 if opcode in [0xe5, 0xe9, 0xf5] else 3

			# ASL/ROL (multiply by 2)
			elif opcode in [0x0a, 0x06, 0x0e, 0x2a, 0x26, 0x2e]:
				analysis['operations'].append({
					'type': 'shift_left',
					'offset': code_offset + i
				})
				i += 1 if opcode in [0x0a, 0x2a] else 2

			# LSR/ROR (divide by 2)
			elif opcode in [0x4a, 0x46, 0x4e, 0x6a, 0x66, 0x6e]:
				analysis['operations'].append({
					'type': 'shift_right',
					'offset': code_offset + i
				})
				i += 1 if opcode in [0x4a, 0x6a] else 2

			# JSR
			elif opcode == 0x20 and i + 2 < len(data):
				target = data[i + 1] | (data[i + 2] << 8)
				analysis['operations'].append({
					'type': 'subroutine_call',
					'target': f"${target:04x}",
					'offset': code_offset + i
				})
				i += 3

			# RTS
			elif opcode == 0x60:
				break

			else:
				i += 1

		# Deduce formula type
		analysis['likely_formula'] = self._deduce_formula_type(analysis)

		return analysis

	def _deduce_formula_type(self, analysis: dict) -> Optional[str]:
		"""Deduce formula type from analysis."""
		ops = analysis['operations']

		shift_count = sum(1 for o in ops if 'shift' in o.get('type', ''))
		add_count = sum(1 for o in ops if o.get('type') == 'add')
		sub_count = sum(1 for o in ops if o.get('type') == 'subtract')
		call_count = sum(1 for o in ops if o.get('type') == 'subroutine_call')

		# Heuristics for formula type
		if shift_count >= 3 and add_count > 0:
			return 'damage'  # Likely multiply/accumulate
		elif sub_count > add_count:
			return 'damage'  # Attack - Defense pattern
		elif call_count >= 2:
			return 'hit_chance'  # Multiple RNG calls

		return None

	def simulate_formula(self, formula_type: str,
						 params: dict) -> dict:
		"""Simulate a common formula type with given parameters."""
		result = {
			'formula_type': formula_type,
			'parameters': params,
			'result': 0,
			'formula_string': ''
		}

		if formula_type == 'damage':
			attack = params.get('attack', 100)
			defense = params.get('defense', 50)
			weapon = params.get('weapon', 10)
			variance = params.get('variance', 0.1)

			# Common damage formula: (ATK - DEF/2) * weapon_mod
			base = attack - (defense // 2)
			if base < 1:
				base = 1
			damage = base * (1 + weapon / 100)

			result['result'] = int(damage)
			result['formula_string'] = f"(ATK:{attack} - DEF:{defense}/2) * (1 + WPN:{weapon}/100)"

		elif formula_type == 'hit_chance':
			agility = params.get('agility', 50)
			evasion = params.get('evasion', 20)
			luck = params.get('luck', 10)

			# Common hit formula
			hit = 90 + (agility - evasion) + (luck // 4)
			hit = max(5, min(99, hit))

			result['result'] = hit
			result['formula_string'] = f"90 + (AGI:{agility} - EVA:{evasion}) + LUCK:{luck}/4"

		elif formula_type == 'critical':
			luck = params.get('luck', 10)
			base_rate = params.get('base_rate', 5)

			crit = base_rate + (luck // 4)
			crit = min(50, crit)

			result['result'] = crit
			result['formula_string'] = f"BASE:{base_rate} + LUCK:{luck}/4"

		elif formula_type == 'experience':
			base_exp = params.get('base_exp', 100)
			party_size = params.get('party_size', 4)
			level_diff = params.get('level_diff', 0)

			exp = base_exp // party_size
			exp = exp + (exp * level_diff // 10)

			result['result'] = max(1, exp)
			result['formula_string'] = f"BASE:{base_exp} / PARTY:{party_size} * level_mod"

		return result

	def generate_formula_report(self, analyses: list) -> str:
		"""Generate a report of analyzed formulas."""
		lines = []
		lines.append("=" * 60)
		lines.append("Battle Formula Analysis Report")
		lines.append("=" * 60)
		lines.append("")

		for i, analysis in enumerate(analyses):
			lines.append(f"Formula #{i + 1}")
			lines.append(f"  Offset: 0x{analysis['offset']:06x}")
			lines.append(f"  Likely type: {analysis.get('likely_formula', 'Unknown')}")
			lines.append(f"  Operations: {len(analysis['operations'])}")
			lines.append(f"  Memory reads: {len(analysis['memory_reads'])}")
			lines.append(f"  Memory writes: {len(analysis['memory_writes'])}")

			if analysis['memory_reads']:
				lines.append("  Read addresses:")
				for r in analysis['memory_reads'][:5]:
					lines.append(f"    {r['address']}")

			if analysis['operations']:
				lines.append("  Operation sequence:")
				for op in analysis['operations'][:10]:
					lines.append(f"    {op['type']}")

			lines.append("")

		return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description='Analyze battle formulas in game ROMs'
	)
	parser.add_argument('rom', help='ROM file to analyze')
	parser.add_argument('--bank', type=int, help='Bank to analyze')
	parser.add_argument('--offset', type=lambda x: int(x, 0),
						help='Specific offset to analyze')
	parser.add_argument('--formula', help='Formula type to search for')
	parser.add_argument('--trace', action='store_true',
						help='Detailed operation trace')
	parser.add_argument('--simulate', nargs='+',
						help='Simulate formula: type param1 param2 ...')
	parser.add_argument('--output', '-o', help='Output file')
	parser.add_argument('--json', action='store_true',
						help='Output as JSON')

	args = parser.parse_args()

	if args.simulate:
		# Simulation mode (no ROM needed)
		formula_type = args.simulate[0]
		params = {}

		for i in range(1, len(args.simulate), 2):
			if i + 1 < len(args.simulate):
				params[args.simulate[i]] = int(args.simulate[i + 1])

		analyzer = BattleFormulaAnalyzer('')
		result = analyzer.simulate_formula(formula_type, params)

		if args.json:
			print(json.dumps(result, indent='\t'))
		else:
			print(f"Formula: {result['formula_string']}")
			print(f"Result: {result['result']}")

		return

	analyzer = BattleFormulaAnalyzer(args.rom)

	if not analyzer.load_rom():
		sys.exit(1)

	if args.offset is not None:
		# Analyze specific offset
		analysis = analyzer.analyze_damage_formula(args.offset)

		if args.json:
			print(json.dumps(analysis, indent='\t'))
		else:
			print(f"Analysis of 0x{args.offset:06x}:")
			print(f"  Likely formula: {analysis.get('likely_formula', 'Unknown')}")
			print(f"  Operations: {len(analysis['operations'])}")

			if args.trace:
				for op in analysis['operations']:
					print(f"    {op['type']}")

	elif args.bank is not None:
		# Analyze entire bank
		multiply_routines = analyzer.find_multiply_routines(args.bank)
		rng_calls = analyzer.find_rng_calls(args.bank)

		if args.json:
			output = {
				'multiply_routines': multiply_routines,
				'rng_calls': rng_calls[:20]  # Limit output
			}
			print(json.dumps(output, indent='\t'))
		else:
			print(f"Bank {args.bank} Analysis:")
			print(f"  Multiply routines: {len(multiply_routines)}")
			print(f"  RNG calls: {len(rng_calls)}")

			if multiply_routines:
				print("\nMultiply routine locations:")
				for r in multiply_routines[:10]:
					print(f"  0x{r['offset']:06x}")

	else:
		# List known formula types
		print("Known formula types:")
		for ftype, info in BattleFormulaAnalyzer.FORMULA_TYPES.items():
			print(f"\n{ftype}:")
			print(f"  {info['description']}")
			print(f"  Variables: {', '.join(info['variables'])}")
			print(f"  Range: {info['typical_range']}")


if __name__ == '__main__':
	main()
