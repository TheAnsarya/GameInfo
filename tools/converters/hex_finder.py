#!/usr/bin/env python3
"""
Hex Pattern Finder

Search for hex patterns, text strings, and data structures in ROM files.
Useful for finding code sequences, data tables, and strings.

Features:
- Search by hex pattern with wildcards
- Search for text strings with encoding tables
- Find relative pointers
- Detect repeated patterns
- Cross-reference with CDL data

Usage:
	python hex_finder.py search <rom> --hex "4C ?? 80"
	python hex_finder.py text <rom> --string "DRAGON"
	python hex_finder.py pointers <rom> --start 0x8000 --end 0xFFFF
	python hex_finder.py patterns <rom> --min-length 8 --min-count 3
"""

import argparse
import json
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set


@dataclass
class SearchResult:
	"""Search result container"""
	offset: int
	data: bytes
	context: bytes = b''
	bank: int = -1
	address: int = 0
	info: str = ""


@dataclass
class PatternMatch:
	"""Repeated pattern match"""
	pattern: bytes
	count: int
	offsets: List[int] = field(default_factory=list)


class HexPatternMatcher:
	"""Match hex patterns with wildcards"""

	@staticmethod
	def compile_pattern(pattern_str: str) -> Tuple[bytes, bytes]:
		"""
		Compile pattern string to (data, mask) tuple.
		Supports ?? for wildcard bytes.
		"""
		# Remove spaces and clean up
		pattern_str = pattern_str.replace(' ', '').upper()

		data = bytearray()
		mask = bytearray()

		i = 0
		while i < len(pattern_str):
			if i + 1 < len(pattern_str):
				byte_str = pattern_str[i:i + 2]
				if byte_str == '??':
					data.append(0x00)
					mask.append(0x00)  # Don't care
				else:
					data.append(int(byte_str, 16))
					mask.append(0xFF)  # Must match
				i += 2
			else:
				break

		return bytes(data), bytes(mask)

	@staticmethod
	def search(data: bytes, pattern: bytes, mask: bytes) -> List[int]:
		"""Search for pattern in data"""
		results = []
		pattern_len = len(pattern)

		for i in range(len(data) - pattern_len + 1):
			match = True
			for j in range(pattern_len):
				if (data[i + j] & mask[j]) != (pattern[j] & mask[j]):
					match = False
					break
			if match:
				results.append(i)

		return results


class TextSearcher:
	"""Search for text strings with encoding tables"""

	# Standard ASCII
	ASCII_TABLE = {chr(i): i for i in range(32, 127)}

	# Common NES/SNES uppercase alphabet starting at different offsets
	NES_TABLES = {
		'standard': {chr(i): i - 0x41 + 0x0A for i in range(65, 91)},  # A-Z at 0x0A-0x23
		'space_start': {chr(i): i - 0x41 + 0x00 for i in range(65, 91)},  # A-Z at 0x00-0x19
		'offset_80': {chr(i): i - 0x41 + 0x80 for i in range(65, 91)},  # A-Z at 0x80-0x99
		'offset_C0': {chr(i): i - 0x41 + 0xC0 for i in range(65, 91)},  # A-Z at 0xC0-0xD9
	}

	@classmethod
	def load_table(cls, filepath: str) -> Dict[str, int]:
		"""Load encoding table from file"""
		table = {}

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';') or line.startswith('#'):
					continue

				# Parse format: XX=char or XX=<description>
				if '=' in line:
					hex_part, char_part = line.split('=', 1)
					try:
						byte_val = int(hex_part.strip(), 16)
						char = char_part.strip()
						if len(char) == 1:
							table[char] = byte_val
						elif char.startswith('<') and char.endswith('>'):
							# Control code like <END>
							table[char] = byte_val
					except ValueError:
						continue

		return table

	@classmethod
	def encode_string(cls, text: str, table: Dict[str, int]) -> Optional[bytes]:
		"""Encode text string to bytes using table"""
		result = bytearray()

		for char in text.upper():
			if char in table:
				result.append(table[char])
			elif char == ' ' and ' ' not in table:
				# Try common space values
				if 0x00 in table.values():
					result.append(0x00)
				elif 0xFF in table.values():
					result.append(0xFF)
				else:
					return None  # Can't encode
			else:
				return None  # Can't encode

		return bytes(result)

	@classmethod
	def search_ascii(cls, data: bytes, text: str) -> List[int]:
		"""Search for ASCII text"""
		text_bytes = text.encode('ascii')
		results = []

		for i in range(len(data) - len(text_bytes) + 1):
			if data[i:i + len(text_bytes)] == text_bytes:
				results.append(i)

		# Also search for uppercase
		if text != text.upper():
			text_upper = text.upper().encode('ascii')
			for i in range(len(data) - len(text_upper) + 1):
				if data[i:i + len(text_upper)] == text_upper:
					if i not in results:
						results.append(i)

		return sorted(results)


class PointerFinder:
	"""Find pointers in ROM data"""

	@staticmethod
	def find_pointers(
		data: bytes,
		target_range: Tuple[int, int],
		pointer_size: int = 2,
		bank_byte: bool = False
	) -> List[Tuple[int, int]]:
		"""
		Find potential pointers to target range.
		Returns list of (offset, target_address) tuples.
		"""
		results = []
		min_target, max_target = target_range

		for i in range(len(data) - pointer_size + 1):
			if pointer_size == 2:
				# Little-endian 16-bit pointer
				addr = struct.unpack('<H', data[i:i + 2])[0]
			elif pointer_size == 3:
				# 24-bit pointer (bank:addr)
				addr = struct.unpack('<I', data[i:i + 3] + b'\x00')[0] & 0xFFFFFF
			else:
				continue

			if min_target <= addr <= max_target:
				results.append((i, addr))

		return results

	@staticmethod
	def find_pointer_table(
		data: bytes,
		table_start: int,
		entry_count: int,
		pointer_size: int = 2,
		base_address: int = 0
	) -> List[Tuple[int, int]]:
		"""
		Read pointer table at given offset.
		Returns list of (index, target_address) tuples.
		"""
		results = []

		for i in range(entry_count):
			offset = table_start + (i * pointer_size)
			if offset + pointer_size > len(data):
				break

			if pointer_size == 2:
				addr = struct.unpack('<H', data[offset:offset + 2])[0]
			elif pointer_size == 3:
				addr = struct.unpack('<I', data[offset:offset + 3] + b'\x00')[0] & 0xFFFFFF
			else:
				continue

			if base_address:
				addr = (addr - base_address) & 0xFFFF

			results.append((i, addr))

		return results


class PatternDetector:
	"""Detect repeated patterns in data"""

	@staticmethod
	def find_repeated_patterns(
		data: bytes,
		min_length: int = 4,
		max_length: int = 32,
		min_count: int = 3
	) -> List[PatternMatch]:
		"""Find patterns that repeat multiple times"""
		patterns: Dict[bytes, List[int]] = {}

		for length in range(min_length, max_length + 1):
			for i in range(len(data) - length + 1):
				pattern = data[i:i + length]

				# Skip patterns with too many zeros or FFs
				zero_count = pattern.count(0x00)
				ff_count = pattern.count(0xFF)
				if zero_count > length * 0.5 or ff_count > length * 0.5:
					continue

				if pattern not in patterns:
					patterns[pattern] = []
				patterns[pattern].append(i)

		# Filter by minimum count and remove overlapping
		results = []
		seen_ranges: Set[Tuple[int, int]] = set()

		for pattern, offsets in sorted(patterns.items(), key=lambda x: -len(x[1])):
			if len(offsets) < min_count:
				continue

			# Check for overlapping matches
			valid_offsets = []
			for offset in offsets:
				range_key = (offset, offset + len(pattern))
				if not any(
					(o <= offset < o + len(pattern)) or (offset <= o < range_key[1])
					for o, _ in seen_ranges
				):
					valid_offsets.append(offset)
					seen_ranges.add(range_key)

			if len(valid_offsets) >= min_count:
				results.append(PatternMatch(
					pattern=pattern,
					count=len(valid_offsets),
					offsets=valid_offsets[:10]  # Limit stored offsets
				))

		# Sort by count * length (most significant patterns first)
		results.sort(key=lambda x: -(x.count * len(x.pattern)))

		return results[:100]  # Limit results


class HexFinder:
	"""Main hex finder class"""

	def __init__(self, filepath: str):
		self.filepath = filepath
		self.data = b''
		self.header_size = 0
		self.prg_size = 0
		self.chr_size = 0
		self.load()

	def load(self):
		"""Load ROM file"""
		with open(self.filepath, 'rb') as f:
			self.data = f.read()

		# Detect iNES header
		if self.data[:4] == b'NES\x1a':
			self.header_size = 16
			self.prg_size = self.data[4] * 16384
			self.chr_size = self.data[5] * 8192
			if self.data[6] & 0x04:  # Trainer
				self.header_size += 512

	def offset_to_address(self, offset: int) -> Tuple[int, int]:
		"""Convert file offset to bank:address"""
		if self.header_size > 0:
			rom_offset = offset - self.header_size
			if rom_offset < 0:
				return -1, offset  # In header
			bank = rom_offset // 16384
			addr = 0x8000 + (rom_offset % 16384)
			return bank, addr
		return -1, offset

	def search_hex(self, pattern_str: str, context_size: int = 8) -> List[SearchResult]:
		"""Search for hex pattern"""
		pattern, mask = HexPatternMatcher.compile_pattern(pattern_str)
		offsets = HexPatternMatcher.search(self.data, pattern, mask)

		results = []
		for offset in offsets:
			bank, addr = self.offset_to_address(offset)
			context_start = max(0, offset - context_size)
			context_end = min(len(self.data), offset + len(pattern) + context_size)

			results.append(SearchResult(
				offset=offset,
				data=self.data[offset:offset + len(pattern)],
				context=self.data[context_start:context_end],
				bank=bank,
				address=addr,
			))

		return results

	def search_text(
		self,
		text: str,
		table_path: str = None,
		context_size: int = 8
	) -> List[SearchResult]:
		"""Search for text string"""
		results = []

		# Try ASCII first
		ascii_matches = TextSearcher.search_ascii(self.data, text)
		for offset in ascii_matches:
			bank, addr = self.offset_to_address(offset)
			context_start = max(0, offset - context_size)
			context_end = min(len(self.data), offset + len(text) + context_size)

			results.append(SearchResult(
				offset=offset,
				data=self.data[offset:offset + len(text)],
				context=self.data[context_start:context_end],
				bank=bank,
				address=addr,
				info="ASCII",
			))

		# Try with table if provided
		if table_path:
			table = TextSearcher.load_table(table_path)
			encoded = TextSearcher.encode_string(text, table)
			if encoded:
				for i in range(len(self.data) - len(encoded) + 1):
					if self.data[i:i + len(encoded)] == encoded:
						bank, addr = self.offset_to_address(i)
						context_start = max(0, i - context_size)
						context_end = min(len(self.data), i + len(encoded) + context_size)

						results.append(SearchResult(
							offset=i,
							data=encoded,
							context=self.data[context_start:context_end],
							bank=bank,
							address=addr,
							info=f"Table: {os.path.basename(table_path)}",
						))

		# Try common NES tables
		if not table_path:
			for table_name, table in TextSearcher.NES_TABLES.items():
				encoded = TextSearcher.encode_string(text, table)
				if encoded:
					for i in range(len(self.data) - len(encoded) + 1):
						if self.data[i:i + len(encoded)] == encoded:
							bank, addr = self.offset_to_address(i)
							# Avoid duplicates
							if not any(r.offset == i for r in results):
								results.append(SearchResult(
									offset=i,
									data=encoded,
									bank=bank,
									address=addr,
									info=f"Table: {table_name}",
								))

		return results

	def find_pointers(
		self,
		target_min: int,
		target_max: int,
		limit: int = 100
	) -> List[Tuple[int, int, int, int]]:
		"""Find pointers to address range"""
		raw_results = PointerFinder.find_pointers(
			self.data,
			(target_min, target_max)
		)

		results = []
		for offset, target in raw_results[:limit]:
			bank, addr = self.offset_to_address(offset)
			results.append((offset, bank, addr, target))

		return results


def format_hex(data: bytes, max_len: int = 32) -> str:
	"""Format bytes as hex string"""
	hex_str = ' '.join(f'{b:02X}' for b in data[:max_len])
	if len(data) > max_len:
		hex_str += '...'
	return hex_str


def main():
	parser = argparse.ArgumentParser(
		description='Hex Pattern Finder',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Search command
	search_parser = subparsers.add_parser('search', help='Search for hex pattern')
	search_parser.add_argument('rom', help='ROM file')
	search_parser.add_argument('--hex', '-x', required=True, help='Hex pattern (use ?? for wildcard)')
	search_parser.add_argument('--context', '-c', type=int, default=8, help='Context bytes')
	search_parser.add_argument('--json', '-j', action='store_true', help='Output as JSON')

	# Text command
	text_parser = subparsers.add_parser('text', help='Search for text string')
	text_parser.add_argument('rom', help='ROM file')
	text_parser.add_argument('--string', '-s', required=True, help='Text to search')
	text_parser.add_argument('--table', '-t', help='Encoding table file')
	text_parser.add_argument('--context', '-c', type=int, default=8, help='Context bytes')

	# Pointers command
	ptr_parser = subparsers.add_parser('pointers', help='Find pointers')
	ptr_parser.add_argument('rom', help='ROM file')
	ptr_parser.add_argument('--start', type=lambda x: int(x, 0), default=0x8000, help='Target range start')
	ptr_parser.add_argument('--end', type=lambda x: int(x, 0), default=0xFFFF, help='Target range end')
	ptr_parser.add_argument('--limit', '-l', type=int, default=100, help='Max results')

	# Patterns command
	patterns_parser = subparsers.add_parser('patterns', help='Find repeated patterns')
	patterns_parser.add_argument('rom', help='ROM file')
	patterns_parser.add_argument('--min-length', type=int, default=8, help='Minimum pattern length')
	patterns_parser.add_argument('--max-length', type=int, default=32, help='Maximum pattern length')
	patterns_parser.add_argument('--min-count', type=int, default=3, help='Minimum occurrences')
	patterns_parser.add_argument('--report', '-r', help='Output report file')

	args = parser.parse_args()

	if args.command == 'search':
		finder = HexFinder(args.rom)
		results = finder.search_hex(args.hex, args.context)

		print(f"Found {len(results)} matches for pattern: {args.hex}")
		print()

		if args.json:
			output = [
				{
					'offset': f"0x{r.offset:06X}",
					'bank': r.bank,
					'address': f"${r.address:04X}" if r.bank >= 0 else None,
					'data': format_hex(r.data),
				}
				for r in results
			]
			print(json.dumps(output, indent='\t'))
		else:
			for r in results:
				loc = f"Bank {r.bank:02X}:${r.address:04X}" if r.bank >= 0 else f"0x{r.offset:06X}"
				print(f"  {loc}")
				print(f"    Offset: 0x{r.offset:06X}")
				print(f"    Data: {format_hex(r.data)}")
				if r.context:
					print(f"    Context: {format_hex(r.context)}")
				print()

	elif args.command == 'text':
		finder = HexFinder(args.rom)
		results = finder.search_text(args.string, args.table, args.context)

		print(f"Found {len(results)} matches for: \"{args.string}\"")
		print()

		for r in results:
			loc = f"Bank {r.bank:02X}:${r.address:04X}" if r.bank >= 0 else f"0x{r.offset:06X}"
			print(f"  {loc}")
			print(f"    Offset: 0x{r.offset:06X}")
			print(f"    Data: {format_hex(r.data)}")
			if r.info:
				print(f"    Encoding: {r.info}")
			print()

	elif args.command == 'pointers':
		finder = HexFinder(args.rom)
		results = finder.find_pointers(args.start, args.end, args.limit)

		print(f"Found {len(results)} pointers to ${args.start:04X}-${args.end:04X}")
		print()

		for offset, bank, addr, target in results:
			if bank >= 0:
				print(f"  Bank {bank:02X}:${addr:04X} -> ${target:04X}")
			else:
				print(f"  0x{offset:06X} -> ${target:04X}")

	elif args.command == 'patterns':
		finder = HexFinder(args.rom)
		results = PatternDetector.find_repeated_patterns(
			finder.data,
			args.min_length,
			args.max_length,
			args.min_count
		)

		print(f"Found {len(results)} repeated patterns")
		print()

		for i, match in enumerate(results[:20]):
			print(f"{i + 1}. {match.count} occurrences ({len(match.pattern)} bytes)")
			print(f"   Pattern: {format_hex(match.pattern)}")
			locs = [f"0x{o:06X}" for o in match.offsets[:5]]
			print(f"   At: {', '.join(locs)}")
			print()

		if args.report:
			report = {
				'patterns': [
					{
						'pattern': format_hex(m.pattern, 64),
						'length': len(m.pattern),
						'count': m.count,
						'offsets': [f"0x{o:06X}" for o in m.offsets],
					}
					for m in results
				]
			}
			with open(args.report, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(report, f, indent='\t')
			print(f"Report saved to: {args.report}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
