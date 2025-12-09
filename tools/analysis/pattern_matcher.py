#!/usr/bin/env python3
"""
Pattern Matcher

Find patterns and data structures in ROM files.
Search for byte patterns, strings, pointers, and data tables.

Features:
- Byte pattern search with wildcards
- Relative search (find similar sequences)
- Pointer table detection
- String search with custom encoding
- Data structure scanning

Usage:
	python pattern_matcher.py search rom.nes --pattern "A9 00 8D ?? 20"
	python pattern_matcher.py strings rom.nes --table game.tbl
	python pattern_matcher.py pointers rom.nes --start 0x8000 --end 0xFFFF
	python pattern_matcher.py tables rom.nes --entry-size 8
"""

import argparse
import json
import re
import struct
import sys
from pathlib import Path
from typing import List, Tuple, Optional, Dict


class PatternMatcher:
	"""Search for patterns in binary data."""

	def __init__(self, data: bytes):
		self.data = data

	def search_pattern(
		self,
		pattern: str,
		start: int = 0,
		end: Optional[int] = None
	) -> List[int]:
		"""
		Search for byte pattern with wildcards.

		Pattern format: "A9 00 8D ?? 20"
		?? = any byte
		"""
		if end is None:
			end = len(self.data)

		# Parse pattern
		parts = pattern.upper().split()
		pattern_bytes = []
		mask = []

		for part in parts:
			if part == '??' or part == '**':
				pattern_bytes.append(0)
				mask.append(False)
			else:
				pattern_bytes.append(int(part, 16))
				mask.append(True)

		# Search
		results = []
		pattern_len = len(pattern_bytes)

		for i in range(start, end - pattern_len + 1):
			match = True
			for j, (pb, m) in enumerate(zip(pattern_bytes, mask)):
				if m and self.data[i + j] != pb:
					match = False
					break

			if match:
				results.append(i)

		return results

	def search_relative(
		self,
		sequence: bytes,
		tolerance: int = 0
	) -> List[int]:
		"""
		Search for sequences with relative values.

		Finds sequences where the differences between bytes match,
		useful for finding transposed music or shifted data.
		"""
		if len(sequence) < 2:
			return []

		# Calculate deltas
		deltas = [sequence[i + 1] - sequence[i] for i in range(len(sequence) - 1)]

		results = []

		for i in range(len(self.data) - len(sequence) + 1):
			match = True
			for j, delta in enumerate(deltas):
				actual_delta = self.data[i + j + 1] - self.data[i + j]
				if abs(actual_delta - delta) > tolerance:
					match = False
					break

			if match:
				results.append(i)

		return results

	def find_pointers(
		self,
		target_range: Tuple[int, int],
		search_range: Optional[Tuple[int, int]] = None,
		little_endian: bool = True,
		pointer_size: int = 2
	) -> List[Tuple[int, int]]:
		"""
		Find pointers that point to target range.

		Returns list of (pointer_location, target_address).
		"""
		min_target, max_target = target_range

		if search_range:
			start, end = search_range
		else:
			start, end = 0, len(self.data)

		results = []

		for i in range(start, end - pointer_size + 1):
			if pointer_size == 2:
				if little_endian:
					value = struct.unpack('<H', self.data[i:i + 2])[0]
				else:
					value = struct.unpack('>H', self.data[i:i + 2])[0]
			elif pointer_size == 3:
				if little_endian:
					value = self.data[i] | (self.data[i + 1] << 8) | (self.data[i + 2] << 16)
				else:
					value = (self.data[i] << 16) | (self.data[i + 1] << 8) | self.data[i + 2]
			else:
				continue

			if min_target <= value <= max_target:
				results.append((i, value))

		return results

	def find_pointer_tables(
		self,
		target_range: Tuple[int, int],
		min_entries: int = 4,
		little_endian: bool = True
	) -> List[Dict]:
		"""
		Find consecutive pointer tables.

		Returns list of table info dictionaries.
		"""
		min_target, max_target = target_range
		tables = []

		i = 0
		while i < len(self.data) - 4:
			# Check if this could be start of pointer table
			consecutive = 0
			entries = []

			for j in range(i, len(self.data) - 1, 2):
				if little_endian:
					value = struct.unpack('<H', self.data[j:j + 2])[0]
				else:
					value = struct.unpack('>H', self.data[j:j + 2])[0]

				if min_target <= value <= max_target:
					consecutive += 1
					entries.append(value)
				else:
					break

			if consecutive >= min_entries:
				tables.append({
					'offset': i,
					'count': consecutive,
					'entries': entries,
					'size': consecutive * 2,
				})
				i += consecutive * 2
			else:
				i += 1

		return tables

	def find_strings(
		self,
		char_table: Optional[Dict[int, str]] = None,
		min_length: int = 3,
		terminator: Optional[int] = None
	) -> List[Dict]:
		"""
		Find text strings in data.
		"""
		if char_table is None:
			# Default ASCII
			char_table = {i: chr(i) for i in range(0x20, 0x7F)}

		strings = []
		i = 0

		while i < len(self.data):
			if self.data[i] in char_table:
				# Start of potential string
				start = i
				text = []

				while i < len(self.data):
					byte = self.data[i]

					if terminator is not None and byte == terminator:
						i += 1
						break
					elif byte in char_table:
						text.append(char_table[byte])
						i += 1
					else:
						break

				if len(text) >= min_length:
					strings.append({
						'offset': start,
						'length': i - start,
						'text': ''.join(text),
					})
			else:
				i += 1

		return strings

	def find_data_tables(
		self,
		entry_size: int,
		min_entries: int = 4,
		alignment: int = 1
	) -> List[Dict]:
		"""
		Find potential data tables based on patterns.
		"""
		tables = []

		for i in range(0, len(self.data) - entry_size * min_entries, alignment):
			# Check for repeating structure
			entries = []
			valid = True

			for j in range(min_entries * 2):  # Check up to 2x min entries
				offset = i + j * entry_size
				if offset + entry_size > len(self.data):
					break

				entry = self.data[offset:offset + entry_size]
				entries.append(entry)

			if len(entries) >= min_entries:
				# Analyze pattern consistency
				# Check if certain byte positions have similar ranges
				consistency = self._check_table_consistency(entries)

				if consistency > 0.7:  # 70% consistency threshold
					tables.append({
						'offset': i,
						'entry_size': entry_size,
						'entries': len(entries),
						'consistency': consistency,
						'sample': entries[:4],
					})

		return tables

	def _check_table_consistency(self, entries: List[bytes]) -> float:
		"""Check how consistent table entries are."""
		if not entries or len(entries) < 2:
			return 0.0

		entry_size = len(entries[0])
		consistent_positions = 0

		for pos in range(entry_size):
			values = [e[pos] for e in entries]
			value_range = max(values) - min(values)

			# Position is consistent if values don't vary too wildly
			if value_range < 128:  # Reasonable variation
				consistent_positions += 1

		return consistent_positions / entry_size


def load_tbl(path: str) -> Dict[int, str]:
	"""Load character table file."""
	char_table = {}
	content = Path(path).read_text(encoding='utf-8')

	for line in content.splitlines():
		line = line.strip()
		if not line or line.startswith('#') or line.startswith(';'):
			continue

		if '=' in line:
			parts = line.split('=', 1)
			try:
				byte_val = int(parts[0].strip(), 16)
				char = parts[1]
				char_table[byte_val] = char
			except ValueError:
				pass

	return char_table


def cmd_search(args):
	"""Search for byte pattern."""
	data = Path(args.rom).read_bytes()
	matcher = PatternMatcher(data)

	start = int(args.start, 16) if args.start else 0
	end = int(args.end, 16) if args.end else None

	results = matcher.search_pattern(args.pattern, start, end)

	print(f"Pattern: {args.pattern}")
	print(f"Found: {len(results)} matches")
	print()

	for offset in results[:args.limit]:
		# Show context
		context_start = max(0, offset - 4)
		context_end = min(len(data), offset + 20)
		context = data[context_start:context_end]

		hex_str = ' '.join(f'{b:02X}' for b in context)
		print(f"${offset:06X}: {hex_str}")

	if len(results) > args.limit:
		print(f"\n... and {len(results) - args.limit} more matches")


def cmd_strings(args):
	"""Find strings in ROM."""
	data = Path(args.rom).read_bytes()
	matcher = PatternMatcher(data)

	char_table = None
	if args.table:
		char_table = load_tbl(args.table)

	terminator = int(args.terminator, 16) if args.terminator else None

	strings = matcher.find_strings(
		char_table=char_table,
		min_length=args.min_length,
		terminator=terminator
	)

	print(f"Found {len(strings)} strings")
	print()

	for s in strings[:args.limit]:
		text_preview = s['text'][:60]
		if len(s['text']) > 60:
			text_preview += '...'
		print(f"${s['offset']:06X} ({s['length']:3d}): {text_preview}")

	if len(strings) > args.limit:
		print(f"\n... and {len(strings) - args.limit} more strings")


def cmd_pointers(args):
	"""Find pointer tables."""
	data = Path(args.rom).read_bytes()
	matcher = PatternMatcher(data)

	target_range = (
		int(args.start, 16) if args.start else 0x8000,
		int(args.end, 16) if args.end else 0xFFFF
	)

	tables = matcher.find_pointer_tables(
		target_range=target_range,
		min_entries=args.min_entries,
		little_endian=not args.big_endian
	)

	print(f"Target range: ${target_range[0]:04X}-${target_range[1]:04X}")
	print(f"Found {len(tables)} potential pointer tables")
	print()

	for table in tables[:args.limit]:
		print(f"${table['offset']:06X}: {table['count']} entries")
		# Show first few entries
		preview = ', '.join(f"${e:04X}" for e in table['entries'][:5])
		if len(table['entries']) > 5:
			preview += ', ...'
		print(f"  Values: {preview}")
		print()


def cmd_tables(args):
	"""Find data tables."""
	data = Path(args.rom).read_bytes()
	matcher = PatternMatcher(data)

	tables = matcher.find_data_tables(
		entry_size=args.entry_size,
		min_entries=args.min_entries,
		alignment=args.alignment
	)

	print(f"Entry size: {args.entry_size} bytes")
	print(f"Found {len(tables)} potential tables")
	print()

	for table in tables[:args.limit]:
		print(f"${table['offset']:06X}: {table['entries']} entries "
			f"({table['consistency']:.0%} consistent)")

		# Show sample entries
		for i, entry in enumerate(table['sample'][:3]):
			hex_str = ' '.join(f'{b:02X}' for b in entry)
			print(f"  [{i}] {hex_str}")
		print()


def cmd_relative(args):
	"""Search for relative patterns."""
	data = Path(args.rom).read_bytes()
	matcher = PatternMatcher(data)

	# Parse sequence
	sequence = bytes.fromhex(args.sequence.replace(' ', ''))

	results = matcher.search_relative(sequence, args.tolerance)

	print(f"Reference: {' '.join(f'{b:02X}' for b in sequence)}")
	print(f"Tolerance: {args.tolerance}")
	print(f"Found: {len(results)} matches")
	print()

	for offset in results[:args.limit]:
		match = data[offset:offset + len(sequence)]
		hex_str = ' '.join(f'{b:02X}' for b in match)
		delta = match[0] - sequence[0]
		print(f"${offset:06X}: {hex_str} (delta: {delta:+d})")


def main():
	parser = argparse.ArgumentParser(description="Pattern Matcher")
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Search
	search = subparsers.add_parser('search', help='Search for byte pattern')
	search.add_argument('rom', help='ROM file')
	search.add_argument('--pattern', '-p', required=True,
		help='Pattern to search (e.g., "A9 00 8D ?? 20")')
	search.add_argument('--start', '-s', help='Start offset (hex)')
	search.add_argument('--end', '-e', help='End offset (hex)')
	search.add_argument('--limit', type=int, default=50, help='Max results')

	# Strings
	strings = subparsers.add_parser('strings', help='Find text strings')
	strings.add_argument('rom', help='ROM file')
	strings.add_argument('--table', '-t', help='Character table file')
	strings.add_argument('--min-length', type=int, default=3, help='Min string length')
	strings.add_argument('--terminator', help='String terminator byte (hex)')
	strings.add_argument('--limit', type=int, default=100, help='Max results')

	# Pointers
	pointers = subparsers.add_parser('pointers', help='Find pointer tables')
	pointers.add_argument('rom', help='ROM file')
	pointers.add_argument('--start', default='0x8000', help='Target range start')
	pointers.add_argument('--end', default='0xFFFF', help='Target range end')
	pointers.add_argument('--min-entries', type=int, default=4, help='Min table entries')
	pointers.add_argument('--big-endian', action='store_true', help='Big-endian pointers')
	pointers.add_argument('--limit', type=int, default=50, help='Max results')

	# Tables
	tables = subparsers.add_parser('tables', help='Find data tables')
	tables.add_argument('rom', help='ROM file')
	tables.add_argument('--entry-size', type=int, default=8, help='Entry size in bytes')
	tables.add_argument('--min-entries', type=int, default=4, help='Min table entries')
	tables.add_argument('--alignment', type=int, default=1, help='Search alignment')
	tables.add_argument('--limit', type=int, default=50, help='Max results')

	# Relative
	relative = subparsers.add_parser('relative', help='Search relative patterns')
	relative.add_argument('rom', help='ROM file')
	relative.add_argument('--sequence', '-s', required=True,
		help='Reference sequence (hex)')
	relative.add_argument('--tolerance', type=int, default=0,
		help='Delta tolerance')
	relative.add_argument('--limit', type=int, default=50, help='Max results')

	args = parser.parse_args()

	commands = {
		'search': cmd_search,
		'strings': cmd_strings,
		'pointers': cmd_pointers,
		'tables': cmd_tables,
		'relative': cmd_relative,
	}

	if args.command in commands:
		commands[args.command](args)
	else:
		parser.print_help()


if __name__ == '__main__':
	main()
