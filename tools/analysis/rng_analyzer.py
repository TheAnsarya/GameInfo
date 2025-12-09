#!/usr/bin/env python3
"""
RNG Analyzer - Analyze random number generation in games

Features:
- Detect common PRNG algorithms (LCG, LFSR, etc.)
- Analyze RNG sequences from memory dumps
- Predict next values
- Find RNG manipulation opportunities
- Generate lookup tables

Useful for:
- Speedrun route planning
- Understanding game mechanics
- Finding exploits
"""

import argparse
import json
import os
import struct
import sys
from collections import Counter
from dataclasses import dataclass, field
from enum import Enum
from typing import Optional, Tuple


class RNGType(Enum):
	"""Common RNG algorithm types"""
	LCG = "lcg"  # Linear Congruential Generator
	LFSR = "lfsr"  # Linear Feedback Shift Register
	TABLE = "table"  # Table-based
	COMBINED = "combined"  # Multiple sources combined
	UNKNOWN = "unknown"


@dataclass
class LCGParams:
	"""Parameters for Linear Congruential Generator"""
	multiplier: int
	increment: int
	modulus: int
	bit_width: int = 16


@dataclass
class LFSRParams:
	"""Parameters for Linear Feedback Shift Register"""
	taps: list  # Bit positions for feedback
	bit_width: int = 16


@dataclass
class RNGAnalysis:
	"""Analysis results"""
	rng_type: RNGType
	params: Optional[dict] = None
	sequence_length: int = 0
	period: Optional[int] = None
	chi_squared: float = 0.0
	is_uniform: bool = False
	notes: str = ""


class LCGDetector:
	"""Detect and analyze Linear Congruential Generators"""

	# Known LCG parameters from various games/systems
	KNOWN_LCGS = {
		'nes_common': LCGParams(5, 1, 256, 8),
		'snes_dq3': LCGParams(13, 1, 256, 8),
		'glibc': LCGParams(1103515245, 12345, 2**31, 32),
		'msvc': LCGParams(214013, 2531011, 2**32, 32),
		'cc65': LCGParams(22695477, 1, 2**32, 32),
	}

	def detect_lcg(self, sequence: list, bit_width: int = 8) -> Optional[LCGParams]:
		"""Try to detect LCG parameters from a sequence"""
		if len(sequence) < 4:
			return None

		modulus = 2 ** bit_width

		# Try known parameters first
		for name, params in self.KNOWN_LCGS.items():
			if params.bit_width != bit_width:
				continue
			if self._verify_lcg(sequence, params):
				return params

		# Try to deduce parameters
		# For x[n+1] = (a * x[n] + c) mod m
		# We can solve if we have enough values

		# Brute force for small bit widths
		if bit_width <= 8:
			for a in range(1, modulus):
				for c in range(modulus):
					params = LCGParams(a, c, modulus, bit_width)
					if self._verify_lcg(sequence[:10], params):
						# Verify with more values
						if self._verify_lcg(sequence, params):
							return params

		return None

	def _verify_lcg(self, sequence: list, params: LCGParams) -> bool:
		"""Verify if sequence matches LCG parameters"""
		if len(sequence) < 2:
			return False

		for i in range(len(sequence) - 1):
			expected = (params.multiplier * sequence[i] + params.increment) % params.modulus
			if expected != sequence[i + 1]:
				return False

		return True

	def predict_next(self, current: int, params: LCGParams, count: int = 10) -> list:
		"""Predict next values from current state"""
		values = [current]
		for _ in range(count):
			current = (params.multiplier * current + params.increment) % params.modulus
			values.append(current)
		return values[1:]  # Exclude starting value

	def reverse_step(self, current: int, params: LCGParams) -> int:
		"""Calculate previous state (inverse LCG)"""
		# Need modular inverse of multiplier
		# a * a_inv ≡ 1 (mod m)
		a_inv = self._mod_inverse(params.multiplier, params.modulus)
		if a_inv is None:
			return None
		return (a_inv * (current - params.increment)) % params.modulus

	def _mod_inverse(self, a: int, m: int) -> Optional[int]:
		"""Calculate modular multiplicative inverse"""
		def extended_gcd(a, b):
			if a == 0:
				return b, 0, 1
			gcd, x1, y1 = extended_gcd(b % a, a)
			x = y1 - (b // a) * x1
			y = x1
			return gcd, x, y

		gcd, x, _ = extended_gcd(a % m, m)
		if gcd != 1:
			return None
		return (x % m + m) % m


class LFSRDetector:
	"""Detect and analyze Linear Feedback Shift Registers"""

	def detect_lfsr(self, sequence: list, bit_width: int = 8) -> Optional[LFSRParams]:
		"""Try to detect LFSR parameters from sequence"""
		# This is a simplified detector
		# Full LFSR detection requires Berlekamp-Massey algorithm

		if len(sequence) < 2 * bit_width:
			return None

		# Try common tap configurations
		common_taps = {
			8: [[8, 6, 5, 4], [8, 4, 3, 2], [8, 5, 3, 1]],
			16: [[16, 15, 13, 4], [16, 14, 13, 11], [16, 12, 3, 1]],
		}

		if bit_width not in common_taps:
			return None

		for taps in common_taps[bit_width]:
			params = LFSRParams(taps=taps, bit_width=bit_width)
			if self._verify_lfsr_byte_sequence(sequence, params):
				return params

		return None

	def _verify_lfsr_byte_sequence(self, sequence: list, params: LFSRParams) -> bool:
		"""Verify byte sequence against LFSR parameters"""
		# LFSR typically produces bits, which get assembled into bytes
		# This is a simplified check

		# Not implemented fully - would need to track internal state
		return False

	def predict_next(self, state: int, params: LFSRParams, count: int = 10) -> list:
		"""Predict next values from current state"""
		values = []
		current = state

		for _ in range(count):
			# Calculate feedback bit
			feedback = 0
			for tap in params.taps:
				feedback ^= (current >> (tap - 1)) & 1

			# Shift and insert feedback
			current = ((current << 1) | feedback) & ((1 << params.bit_width) - 1)
			values.append(current)

		return values


class SequenceAnalyzer:
	"""Analyze RNG sequences for patterns and statistics"""

	def analyze(self, sequence: list) -> dict:
		"""Comprehensive sequence analysis"""
		if not sequence:
			return {}

		results = {
			'length': len(sequence),
			'unique_values': len(set(sequence)),
			'min': min(sequence),
			'max': max(sequence),
			'mean': sum(sequence) / len(sequence),
		}

		# Distribution analysis
		counter = Counter(sequence)
		results['most_common'] = counter.most_common(5)
		results['least_common'] = counter.most_common()[-5:]

		# Chi-squared test for uniformity
		expected = len(sequence) / (max(sequence) - min(sequence) + 1)
		chi_sq = sum((count - expected) ** 2 / expected
					for count in counter.values())
		results['chi_squared'] = chi_sq

		# Period detection
		period = self._find_period(sequence)
		results['period'] = period

		# Autocorrelation (for detecting patterns)
		results['autocorrelation'] = self._autocorrelation(sequence, min(50, len(sequence) // 4))

		return results

	def _find_period(self, sequence: list, max_period: int = 10000) -> Optional[int]:
		"""Find the period of a repeating sequence"""
		if len(sequence) < 4:
			return None

		for period in range(1, min(max_period, len(sequence) // 2)):
			is_periodic = True
			for i in range(period, min(period * 3, len(sequence))):
				if sequence[i] != sequence[i % period]:
					is_periodic = False
					break
			if is_periodic:
				return period

		return None

	def _autocorrelation(self, sequence: list, max_lag: int) -> list:
		"""Calculate autocorrelation for various lags"""
		n = len(sequence)
		mean = sum(sequence) / n
		var = sum((x - mean) ** 2 for x in sequence) / n

		if var == 0:
			return []

		correlations = []
		for lag in range(1, min(max_lag, n)):
			correlation = sum((sequence[i] - mean) * (sequence[i + lag] - mean)
							 for i in range(n - lag)) / ((n - lag) * var)
			correlations.append((lag, correlation))

		return correlations


class RNGManipulator:
	"""Find RNG manipulation opportunities"""

	def __init__(self, lcg_params: LCGParams):
		self.params = lcg_params
		self.lcg = LCGDetector()

	def find_target_value(self, start_state: int, target: int,
						 max_advances: int = 10000) -> Optional[int]:
		"""Find number of advances needed to reach target value"""
		state = start_state
		for i in range(max_advances):
			state = (self.params.multiplier * state + self.params.increment) % self.params.modulus
			if state == target:
				return i + 1
		return None

	def find_range_entry(self, start_state: int, range_start: int, range_end: int,
						max_advances: int = 10000) -> list:
		"""Find advances that produce values in target range"""
		results = []
		state = start_state

		for i in range(max_advances):
			state = (self.params.multiplier * state + self.params.increment) % self.params.modulus
			if range_start <= state <= range_end:
				results.append((i + 1, state))

		return results

	def build_advance_table(self, start_state: int, num_advances: int,
						   output_bits: int = None) -> list:
		"""Build table of RNG advances and outputs"""
		table = []
		state = start_state

		for i in range(num_advances):
			output = state
			if output_bits:
				output = state >> (self.params.bit_width - output_bits)

			table.append({
				'advance': i,
				'state': state,
				'output': output
			})

			state = (self.params.multiplier * state + self.params.increment) % self.params.modulus

		return table


def parse_sequence_file(filepath: str) -> list:
	"""Parse sequence from various file formats"""
	ext = os.path.splitext(filepath)[1].lower()

	if ext == '.json':
		with open(filepath, 'r') as f:
			data = json.load(f)
			if isinstance(data, list):
				return data
			return data.get('sequence', data.get('values', []))

	elif ext in ('.bin', '.raw'):
		with open(filepath, 'rb') as f:
			return list(f.read())

	else:
		# Try text format (one value per line)
		values = []
		with open(filepath, 'r') as f:
			for line in f:
				line = line.strip()
				if line and not line.startswith('#'):
					try:
						if line.startswith(('0x', '$')):
							values.append(int(line.replace('$', '0x'), 16))
						else:
							values.append(int(line))
					except ValueError:
						continue
		return values


def main():
	parser = argparse.ArgumentParser(
		description='Analyze random number generation in games'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze RNG sequence')
	analyze_parser.add_argument('input', help='Input file with RNG values')
	analyze_parser.add_argument('--bits', type=int, default=8, help='Bit width')
	analyze_parser.add_argument('--json', action='store_true', help='JSON output')

	# Detect command
	detect_parser = subparsers.add_parser('detect', help='Detect RNG type')
	detect_parser.add_argument('input', help='Input file with RNG values')
	detect_parser.add_argument('--bits', type=int, default=8, help='Bit width')

	# Predict command
	predict_parser = subparsers.add_parser('predict', help='Predict next values')
	predict_parser.add_argument('--state', type=lambda x: int(x, 0), required=True,
							   help='Current RNG state')
	predict_parser.add_argument('--type', choices=['lcg'], default='lcg')
	predict_parser.add_argument('--mult', type=int, help='LCG multiplier')
	predict_parser.add_argument('--inc', type=int, help='LCG increment')
	predict_parser.add_argument('--mod', type=int, help='LCG modulus')
	predict_parser.add_argument('--preset', choices=list(LCGDetector.KNOWN_LCGS.keys()),
							   help='Use preset LCG parameters')
	predict_parser.add_argument('--count', type=int, default=20, help='Values to predict')

	# Find command
	find_parser = subparsers.add_parser('find', help='Find RNG manipulation')
	find_parser.add_argument('--state', type=lambda x: int(x, 0), required=True,
						   help='Starting RNG state')
	find_parser.add_argument('--target', type=lambda x: int(x, 0),
						   help='Target value')
	find_parser.add_argument('--range', type=str, help='Target range (start-end)')
	find_parser.add_argument('--preset', choices=list(LCGDetector.KNOWN_LCGS.keys()),
						   required=True, help='LCG preset')
	find_parser.add_argument('--max', type=int, default=10000, help='Max advances')

	# Table command
	table_parser = subparsers.add_parser('table', help='Generate advance table')
	table_parser.add_argument('--state', type=lambda x: int(x, 0), required=True)
	table_parser.add_argument('--preset', choices=list(LCGDetector.KNOWN_LCGS.keys()),
						   required=True)
	table_parser.add_argument('--count', type=int, default=100)
	table_parser.add_argument('-o', '--output', help='Output file')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	lcg_detector = LCGDetector()
	analyzer = SequenceAnalyzer()

	if args.command == 'analyze':
		sequence = parse_sequence_file(args.input)
		results = analyzer.analyze(sequence)

		if args.json:
			print(json.dumps(results, indent=2, default=str))
		else:
			print(f"Sequence Analysis ({args.input})")
			print("=" * 50)
			print(f"Length: {results['length']}")
			print(f"Unique values: {results['unique_values']}")
			print(f"Range: {results['min']} - {results['max']}")
			print(f"Mean: {results['mean']:.2f}")
			print(f"Chi-squared: {results['chi_squared']:.2f}")
			if results['period']:
				print(f"Period: {results['period']}")

			print("\nMost common values:")
			for val, count in results['most_common']:
				print(f"  {val}: {count} times")

	elif args.command == 'detect':
		sequence = parse_sequence_file(args.input)

		print(f"Analyzing {len(sequence)} values...")

		# Try LCG detection
		lcg_params = lcg_detector.detect_lcg(sequence, args.bits)
		if lcg_params:
			print(f"\nDetected LCG:")
			print(f"  Multiplier: {lcg_params.multiplier}")
			print(f"  Increment: {lcg_params.increment}")
			print(f"  Modulus: {lcg_params.modulus}")
		else:
			print("\nCould not detect LCG parameters")

		# Basic stats
		results = analyzer.analyze(sequence)
		if results.get('period'):
			print(f"\nPeriod detected: {results['period']}")

	elif args.command == 'predict':
		if args.preset:
			params = lcg_detector.KNOWN_LCGS[args.preset]
		else:
			params = LCGParams(args.mult, args.inc, args.mod)

		predictions = lcg_detector.predict_next(args.state, params, args.count)

		print(f"Predictions from state ${args.state:x}:")
		print("-" * 40)
		for i, val in enumerate(predictions, 1):
			print(f"  +{i}: ${val:02x} ({val})")

	elif args.command == 'find':
		params = lcg_detector.KNOWN_LCGS[args.preset]
		manipulator = RNGManipulator(params)

		if args.target is not None:
			advances = manipulator.find_target_value(args.state, args.target, args.max)
			if advances:
				print(f"Target ${args.target:x} reached after {advances} advances")
			else:
				print(f"Target not found within {args.max} advances")

		elif args.range:
			start, end = map(lambda x: int(x, 0), args.range.split('-'))
			results = manipulator.find_range_entry(args.state, start, end, args.max)

			print(f"Values in range ${start:x}-${end:x}:")
			for advance, value in results[:20]:
				print(f"  +{advance}: ${value:02x}")
			if len(results) > 20:
				print(f"  ... and {len(results) - 20} more")

	elif args.command == 'table':
		params = lcg_detector.KNOWN_LCGS[args.preset]
		manipulator = RNGManipulator(params)
		table = manipulator.build_advance_table(args.state, args.count)

		if args.output:
			with open(args.output, 'w') as f:
				json.dump(table, f, indent=2)
			print(f"Table written to {args.output}")
		else:
			print(f"{'Advance':>8} {'State':>10} {'Output':>10}")
			print("-" * 30)
			for entry in table[:50]:
				print(f"{entry['advance']:>8} ${entry['state']:08x} {entry['output']:>10}")


if __name__ == '__main__':
	main()
