#!/usr/bin/env python3
"""
Bank Analyzer

Analyze ROM banks for content type, code patterns, and data.
Helps understand ROM structure and find specific content.

Features:
- Analyze bank content types (code, data, graphics, text)
- Find entry points and vectors
- Detect duplicate banks
- Generate bank map documentation
- Identify common patterns

Usage:
	python bank_analyzer.py analyze <rom_file>
	python bank_analyzer.py map <rom_file> --output bank_map.txt
	python bank_analyzer.py compare <rom_file> --bank1 5 --bank2 6
	python bank_analyzer.py find-code <rom_file> --bank 10
	python bank_analyzer.py entropy <rom_file>
"""

import argparse
import json
import math
import os
import struct
import sys
from collections import Counter
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class BankInfo:
	"""Information about a single bank"""
	number: int
	offset: int
	size: int
	content_type: str = "unknown"
	entropy: float = 0.0
	code_density: float = 0.0
	unique_bytes: int = 0
	most_common: List[Tuple[int, int]] = field(default_factory=list)
	entry_points: List[int] = field(default_factory=list)
	description: str = ""


# Common 6502/65816 opcodes for code detection
CODE_OPCODES = {
	# Common instructions
	0x20: 'JSR', 0x60: 'RTS', 0x4C: 'JMP', 0x6C: 'JMP_IND',
	0xA9: 'LDA_IMM', 0xA5: 'LDA_ZP', 0xAD: 'LDA_ABS',
	0x85: 'STA_ZP', 0x8D: 'STA_ABS',
	0xA2: 'LDX_IMM', 0xA0: 'LDY_IMM',
	0xE8: 'INX', 0xC8: 'INY', 0xCA: 'DEX', 0x88: 'DEY',
	0x10: 'BPL', 0x30: 'BMI', 0xF0: 'BEQ', 0xD0: 'BNE',
	0x00: 'BRK', 0xEA: 'NOP',
	0x48: 'PHA', 0x68: 'PLA', 0x08: 'PHP', 0x28: 'PLP',
	0x18: 'CLC', 0x38: 'SEC', 0x78: 'SEI', 0x58: 'CLI',
	0x40: 'RTI',
}

# Graphics tile patterns (NES 2bpp)
TILE_SIZE_NES = 16  # 8x8 pixels, 2 planes


def calculate_entropy(data: bytes) -> float:
	"""Calculate Shannon entropy of data"""
	if len(data) == 0:
		return 0.0

	counter = Counter(data)
	length = len(data)
	entropy = 0.0

	for count in counter.values():
		probability = count / length
		if probability > 0:
			entropy -= probability * math.log2(probability)

	return entropy


def detect_code_density(data: bytes) -> float:
	"""
	Estimate how much of the data looks like 6502 code.
	Returns value 0.0 to 1.0
	"""
	if len(data) == 0:
		return 0.0

	code_indicators = 0

	for i, byte in enumerate(data):
		if byte in CODE_OPCODES:
			code_indicators += 1

		# Look for JSR/JMP patterns with $8000-$FFFF targets
		if i + 2 < len(data):
			if byte == 0x20 or byte == 0x4C:  # JSR/JMP
				target = struct.unpack('<H', data[i + 1:i + 3])[0]
				if 0x8000 <= target <= 0xFFFF:
					code_indicators += 2

	return min(1.0, code_indicators / (len(data) / 3))


def detect_graphics(data: bytes) -> float:
	"""
	Estimate if data looks like graphics tiles.
	Returns value 0.0 to 1.0
	"""
	if len(data) < TILE_SIZE_NES:
		return 0.0

	# Graphics tend to have:
	# - Moderate entropy (not too random, not too repetitive)
	# - 16-byte aligned patterns for NES
	# - Specific bit patterns

	entropy = calculate_entropy(data)

	# Graphics typically have entropy between 3 and 6
	if 3.0 <= entropy <= 6.0:
		# Check for tile-aligned patterns
		tile_count = len(data) // TILE_SIZE_NES
		unique_tiles = set()

		for i in range(tile_count):
			tile = data[i * TILE_SIZE_NES:(i + 1) * TILE_SIZE_NES]
			unique_tiles.add(tile)

		# If many unique tiles, likely graphics
		uniqueness = len(unique_tiles) / tile_count if tile_count > 0 else 0
		if uniqueness > 0.5:
			return 0.7 + (0.3 * uniqueness)

	return 0.0


def detect_text(data: bytes, table: Dict[int, str] = None) -> float:
	"""
	Estimate if data looks like text.
	Returns value 0.0 to 1.0
	"""
	if len(data) == 0:
		return 0.0

	# Check for ASCII-like patterns
	printable = 0
	for byte in data:
		# Common text range for games
		if 0x20 <= byte <= 0x7F or byte in (0x00, 0x0A, 0x0D):
			printable += 1

	ratio = printable / len(data)

	# Also check for pointer tables (text usually has them)
	pointer_patterns = 0
	for i in range(0, len(data) - 2, 2):
		val = struct.unpack('<H', data[i:i + 2])[0]
		if 0x8000 <= val <= 0xFFFF:
			pointer_patterns += 1

	if ratio > 0.7:
		return ratio
	elif pointer_patterns > len(data) / 20:  # ~5% pointers
		return 0.5

	return ratio * 0.5


def classify_bank(data: bytes) -> str:
	"""Classify bank content type"""
	code_score = detect_code_density(data)
	gfx_score = detect_graphics(data)
	text_score = detect_text(data)
	entropy = calculate_entropy(data)

	# All zeros or all same value
	if len(set(data)) == 1:
		return "empty"

	# Very low entropy = likely padding or repetitive data
	if entropy < 1.0:
		return "padding"

	# Very high entropy = possibly compressed
	if entropy > 7.5:
		return "compressed"

	# Compare scores
	max_score = max(code_score, gfx_score, text_score)

	if max_score < 0.3:
		return "data"

	if code_score == max_score:
		return "code"
	elif gfx_score == max_score:
		return "graphics"
	elif text_score == max_score:
		return "text"

	return "mixed"


def find_entry_points(data: bytes, bank_base: int = 0x8000) -> List[int]:
	"""Find potential entry points (targets of JSR/JMP)"""
	targets = set()

	for i in range(len(data) - 2):
		if data[i] in (0x20, 0x4C):  # JSR, JMP absolute
			target = struct.unpack('<H', data[i + 1:i + 3])[0]
			if bank_base <= target < bank_base + len(data):
				# Convert to local offset
				targets.add(target - bank_base)

	return sorted(targets)[:20]  # Top 20


def analyze_bank(data: bytes, bank_num: int, offset: int, size: int) -> BankInfo:
	"""Analyze a single bank"""
	info = BankInfo(
		number=bank_num,
		offset=offset,
		size=size,
	)

	info.entropy = calculate_entropy(data)
	info.code_density = detect_code_density(data)
	info.unique_bytes = len(set(data))
	info.content_type = classify_bank(data)

	# Most common bytes
	counter = Counter(data)
	info.most_common = counter.most_common(5)

	# Entry points for code banks
	if info.content_type == "code":
		info.entry_points = find_entry_points(data)

	return info


def analyze_rom(filepath: str, bank_size: int = 0x4000, header_size: int = 16) -> List[BankInfo]:
	"""Analyze all banks in a ROM"""
	with open(filepath, 'rb') as f:
		data = f.read()

	# Skip header
	rom_data = data[header_size:]
	num_banks = len(rom_data) // bank_size

	banks = []
	for i in range(num_banks):
		offset = header_size + (i * bank_size)
		bank_data = rom_data[i * bank_size:(i + 1) * bank_size]
		info = analyze_bank(bank_data, i, offset, bank_size)
		banks.append(info)

	return banks


def generate_bank_map(banks: List[BankInfo]) -> str:
	"""Generate text bank map"""
	lines = [
		"ROM Bank Map",
		"============",
		"",
		f"{'Bank':>4} | {'Offset':>8} | {'Type':<12} | {'Entropy':>7} | {'Code%':>5} | {'Unique':>6}",
		"-" * 60,
	]

	for bank in banks:
		lines.append(
			f"{bank.number:>4} | 0x{bank.offset:06X} | {bank.content_type:<12} | "
			f"{bank.entropy:>7.2f} | {bank.code_density * 100:>5.1f} | {bank.unique_bytes:>6}"
		)

	# Summary
	content_types = Counter(b.content_type for b in banks)
	lines.append("")
	lines.append("Summary:")
	for content_type, count in sorted(content_types.items()):
		lines.append(f"  {content_type}: {count} banks")

	return '\n'.join(lines)


def compare_banks(data1: bytes, data2: bytes) -> Dict[str, any]:
	"""Compare two banks"""
	result = {
		'identical': data1 == data2,
		'size_match': len(data1) == len(data2),
	}

	if len(data1) == len(data2):
		differences = sum(1 for a, b in zip(data1, data2) if a != b)
		result['differences'] = differences
		result['similarity'] = (len(data1) - differences) / len(data1) if len(data1) > 0 else 0
	else:
		result['differences'] = abs(len(data1) - len(data2))
		result['similarity'] = 0

	return result


def main():
	parser = argparse.ArgumentParser(
		description='Bank Analyzer',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze ROM banks')
	analyze_parser.add_argument('file', help='ROM file')
	analyze_parser.add_argument('--bank-size', type=lambda x: int(x, 0), default=0x4000, help='Bank size')
	analyze_parser.add_argument('--header', type=lambda x: int(x, 0), default=16, help='Header size')

	# Map command
	map_parser = subparsers.add_parser('map', help='Generate bank map')
	map_parser.add_argument('file', help='ROM file')
	map_parser.add_argument('--output', '-o', help='Output file')
	map_parser.add_argument('--bank-size', type=lambda x: int(x, 0), default=0x4000, help='Bank size')
	map_parser.add_argument('--header', type=lambda x: int(x, 0), default=16, help='Header size')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Compare two banks')
	compare_parser.add_argument('file', help='ROM file')
	compare_parser.add_argument('--bank1', type=int, required=True, help='First bank number')
	compare_parser.add_argument('--bank2', type=int, required=True, help='Second bank number')
	compare_parser.add_argument('--bank-size', type=lambda x: int(x, 0), default=0x4000, help='Bank size')
	compare_parser.add_argument('--header', type=lambda x: int(x, 0), default=16, help='Header size')

	# Find-code command
	findcode_parser = subparsers.add_parser('find-code', help='Find code patterns in bank')
	findcode_parser.add_argument('file', help='ROM file')
	findcode_parser.add_argument('--bank', '-b', type=int, required=True, help='Bank number')
	findcode_parser.add_argument('--bank-size', type=lambda x: int(x, 0), default=0x4000, help='Bank size')
	findcode_parser.add_argument('--header', type=lambda x: int(x, 0), default=16, help='Header size')

	# Entropy command
	entropy_parser = subparsers.add_parser('entropy', help='Show entropy for all banks')
	entropy_parser.add_argument('file', help='ROM file')
	entropy_parser.add_argument('--bank-size', type=lambda x: int(x, 0), default=0x4000, help='Bank size')
	entropy_parser.add_argument('--header', type=lambda x: int(x, 0), default=16, help='Header size')

	args = parser.parse_args()

	if args.command == 'analyze':
		banks = analyze_rom(args.file, args.bank_size, args.header)

		print(f"ROM Analysis: {args.file}")
		print(f"Banks: {len(banks)}")
		print()

		for bank in banks:
			print(f"Bank {bank.number:>2}: {bank.content_type:<12} "
				  f"entropy={bank.entropy:.2f} code={bank.code_density * 100:.0f}%")
			if bank.entry_points:
				print(f"         Entry points: {', '.join(f'${ep:04X}' for ep in bank.entry_points[:5])}")

	elif args.command == 'map':
		banks = analyze_rom(args.file, args.bank_size, args.header)
		map_text = generate_bank_map(banks)

		if args.output:
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				f.write(map_text)
			print(f"Bank map saved to: {args.output}")
		else:
			print(map_text)

	elif args.command == 'compare':
		with open(args.file, 'rb') as f:
			data = f.read()

		offset1 = args.header + (args.bank1 * args.bank_size)
		offset2 = args.header + (args.bank2 * args.bank_size)

		bank1_data = data[offset1:offset1 + args.bank_size]
		bank2_data = data[offset2:offset2 + args.bank_size]

		result = compare_banks(bank1_data, bank2_data)

		print(f"Comparing Bank {args.bank1} vs Bank {args.bank2}")
		print(f"Identical: {result['identical']}")
		print(f"Similarity: {result['similarity'] * 100:.1f}%")
		print(f"Different bytes: {result['differences']}")

	elif args.command == 'find-code':
		with open(args.file, 'rb') as f:
			data = f.read()

		offset = args.header + (args.bank * args.bank_size)
		bank_data = data[offset:offset + args.bank_size]

		print(f"Code Analysis: Bank {args.bank}")
		print()

		# Find subroutines (JSR targets)
		jsr_targets = Counter()
		for i in range(len(bank_data) - 2):
			if bank_data[i] == 0x20:  # JSR
				target = struct.unpack('<H', bank_data[i + 1:i + 3])[0]
				jsr_targets[target] += 1

		print("Most called subroutines:")
		for target, count in jsr_targets.most_common(20):
			print(f"  ${target:04X}: {count} calls")

	elif args.command == 'entropy':
		banks = analyze_rom(args.file, args.bank_size, args.header)

		print(f"Entropy Analysis: {args.file}")
		print()

		# ASCII bar graph
		max_entropy = 8.0
		for bank in banks:
			bar_width = int(bank.entropy / max_entropy * 40)
			bar = '█' * bar_width + '░' * (40 - bar_width)
			print(f"Bank {bank.number:>2}: [{bar}] {bank.entropy:.2f}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
