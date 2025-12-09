#!/usr/bin/env python3
"""
Byte Pattern Finder - Find and analyze byte patterns in ROM data.

Tools for pattern matching and data discovery in binary files.

Usage:
	python pattern_finder.py --search rom.nes --pattern "4C ?? ??"
	python pattern_finder.py --compare file1.nes file2.nes
	python pattern_finder.py --entropy rom.nes

Features:
	- Wildcard pattern matching
	- Relative search
	- Entropy analysis
	- Duplicate detection
	- Cross-file comparison
"""

import argparse
import math
import struct
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set


@dataclass
class PatternMatch:
	"""A pattern match result."""
	offset: int
	data: bytes
	context_before: bytes = b""
	context_after: bytes = b""

	def __str__(self):
		hex_data = ' '.join(f'{b:02X}' for b in self.data)
		return f"${self.offset:06X}: {hex_data}"


@dataclass
class PatternInfo:
	"""Information about a pattern."""
	pattern: bytes
	mask: bytes           # 0xFF = exact match, 0x00 = wildcard
	count: int = 0
	matches: List[PatternMatch] = None

	def __post_init__(self):
		if self.matches is None:
			self.matches = []


class PatternFinder:
	"""Find patterns in binary data."""

	@staticmethod
	def parse_pattern(pattern_str: str) -> Tuple[bytes, bytes]:
		"""Parse pattern string with wildcards.

		Supports:
		  "4C ?? ??" - wildcard bytes
		  "20 XX YY" - named wildcards
		  "A9 00-0F" - range
		"""
		pattern_bytes = []
		mask_bytes = []

		parts = pattern_str.split()
		for part in parts:
			part = part.strip().upper()

			if part in ('??', 'XX', 'YY', 'ZZ', '**'):
				# Wildcard
				pattern_bytes.append(0x00)
				mask_bytes.append(0x00)

			elif '-' in part:
				# Range (simplified - treated as wildcard for now)
				pattern_bytes.append(0x00)
				mask_bytes.append(0x00)

			else:
				try:
					value = int(part, 16)
					pattern_bytes.append(value)
					mask_bytes.append(0xFF)
				except ValueError:
					continue

		return bytes(pattern_bytes), bytes(mask_bytes)

	@staticmethod
	def match_pattern(data: bytes, pattern: bytes, mask: bytes,
					 offset: int) -> bool:
		"""Check if pattern matches at offset."""
		if offset + len(pattern) > len(data):
			return False

		for i, (p, m) in enumerate(zip(pattern, mask)):
			if m == 0xFF and data[offset + i] != p:
				return False
			elif m != 0xFF and m != 0x00:
				# Partial mask
				if (data[offset + i] & m) != (p & m):
					return False

		return True

	def search(self, data: bytes, pattern_str: str,
			  context: int = 0) -> PatternInfo:
		"""Search for pattern in data."""
		pattern, mask = self.parse_pattern(pattern_str)
		info = PatternInfo(pattern=pattern, mask=mask)

		for i in range(len(data) - len(pattern) + 1):
			if self.match_pattern(data, pattern, mask, i):
				match = PatternMatch(
					offset=i,
					data=data[i:i + len(pattern)]
				)

				if context > 0:
					start = max(0, i - context)
					end = min(len(data), i + len(pattern) + context)
					match.context_before = data[start:i]
					match.context_after = data[i + len(pattern):end]

				info.matches.append(match)

		info.count = len(info.matches)
		return info

	def search_relative(self, data: bytes, reference: int,
					   offset: int, size: int = 2) -> List[PatternMatch]:
		"""Search for relative pointers/jumps to a reference."""
		matches = []

		for i in range(len(data) - size + 1):
			if size == 2:
				# Check for relative 16-bit offset
				rel = struct.unpack('<h', data[i:i + 2])[0]
				target = i + 2 + rel

				if target == reference:
					matches.append(PatternMatch(
						offset=i,
						data=data[i:i + size]
					))

			elif size == 1:
				# Check for relative 8-bit offset
				rel = struct.unpack('b', bytes([data[i]]))[0]
				target = i + 1 + rel

				if target == reference:
					matches.append(PatternMatch(
						offset=i,
						data=bytes([data[i]])
					))

		return matches


class ByteAnalyzer:
	"""Analyze byte data for patterns and structure."""

	@staticmethod
	def entropy(data: bytes, block_size: int = 256) -> List[float]:
		"""Calculate entropy per block."""
		results = []

		for i in range(0, len(data), block_size):
			block = data[i:i + block_size]
			if len(block) == 0:
				continue

			# Calculate Shannon entropy
			counts = Counter(block)
			entropy = 0.0

			for count in counts.values():
				prob = count / len(block)
				if prob > 0:
					entropy -= prob * math.log2(prob)

			results.append(entropy)

		return results

	@staticmethod
	def find_repeating_blocks(data: bytes, block_size: int = 16,
							 min_repeats: int = 2) -> Dict[bytes, List[int]]:
		"""Find repeating blocks of data."""
		blocks: Dict[bytes, List[int]] = {}

		for i in range(0, len(data) - block_size + 1, block_size):
			block = data[i:i + block_size]

			if block not in blocks:
				blocks[block] = []
			blocks[block].append(i)

		# Filter to only repeated blocks
		return {k: v for k, v in blocks.items() if len(v) >= min_repeats}

	@staticmethod
	def find_empty_regions(data: bytes, fill_byte: int = 0xFF,
						  min_size: int = 16) -> List[Tuple[int, int]]:
		"""Find regions filled with a specific byte."""
		regions = []
		start = None

		for i, b in enumerate(data):
			if b == fill_byte:
				if start is None:
					start = i
			else:
				if start is not None:
					length = i - start
					if length >= min_size:
						regions.append((start, length))
					start = None

		# Check end of data
		if start is not None:
			length = len(data) - start
			if length >= min_size:
				regions.append((start, length))

		return regions

	@staticmethod
	def byte_frequency(data: bytes) -> Dict[int, int]:
		"""Get byte frequency counts."""
		return dict(Counter(data))

	@staticmethod
	def find_sequences(data: bytes, min_length: int = 3) -> List[Tuple[int, bytes]]:
		"""Find ascending/descending byte sequences."""
		results = []

		i = 0
		while i < len(data) - min_length:
			# Check ascending
			length = 1
			while i + length < len(data):
				if data[i + length] == data[i + length - 1] + 1:
					length += 1
				else:
					break

			if length >= min_length:
				results.append((i, data[i:i + length]))
				i += length
				continue

			# Check descending
			length = 1
			while i + length < len(data):
				if data[i + length] == data[i + length - 1] - 1:
					length += 1
				else:
					break

			if length >= min_length:
				results.append((i, data[i:i + length]))
				i += length
				continue

			i += 1

		return results


class FileComparer:
	"""Compare binary files."""

	@staticmethod
	def diff(data1: bytes, data2: bytes) -> List[Tuple[int, int, int]]:
		"""Find differences between two files.

		Returns list of (offset, byte1, byte2) tuples.
		"""
		diffs = []
		min_len = min(len(data1), len(data2))

		for i in range(min_len):
			if data1[i] != data2[i]:
				diffs.append((i, data1[i], data2[i]))

		return diffs

	@staticmethod
	def diff_regions(data1: bytes, data2: bytes,
					context: int = 8) -> List[Dict]:
		"""Find difference regions with context."""
		regions = []
		min_len = min(len(data1), len(data2))

		i = 0
		while i < min_len:
			if data1[i] != data2[i]:
				# Found difference - find extent
				start = i
				while i < min_len and data1[i] != data2[i]:
					i += 1
				end = i

				# Get context
				ctx_start = max(0, start - context)
				ctx_end = min(min_len, end + context)

				regions.append({
					'offset': start,
					'length': end - start,
					'data1': data1[start:end],
					'data2': data2[start:end],
					'context_before': data1[ctx_start:start],
					'context_after': data1[end:ctx_end]
				})
			else:
				i += 1

		return regions

	@staticmethod
	def similarity(data1: bytes, data2: bytes) -> float:
		"""Calculate similarity ratio (0.0 to 1.0)."""
		min_len = min(len(data1), len(data2))
		if min_len == 0:
			return 0.0

		same = sum(1 for i in range(min_len) if data1[i] == data2[i])
		return same / min_len


def format_hex_dump(data: bytes, offset: int = 0, width: int = 16) -> str:
	"""Format data as hex dump."""
	lines = []

	for i in range(0, len(data), width):
		chunk = data[i:i + width]
		hex_str = ' '.join(f'{b:02X}' for b in chunk)
		ascii_str = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)

		lines.append(f"{offset + i:06X}  {hex_str:<{width * 3}}  |{ascii_str}|")

	return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Byte Pattern Finder")
	parser.add_argument("file", type=Path, nargs='?',
						help="File to analyze")
	parser.add_argument("--search", "-s", type=str,
						help="Pattern to search for")
	parser.add_argument("--context", "-c", type=int, default=8,
						help="Context bytes to show")
	parser.add_argument("--compare", type=Path,
						help="Compare with another file")
	parser.add_argument("--entropy", "-e", action="store_true",
						help="Calculate entropy")
	parser.add_argument("--block-size", type=int, default=256,
						help="Block size for analysis")
	parser.add_argument("--repeats", "-r", action="store_true",
						help="Find repeating blocks")
	parser.add_argument("--empty", action="store_true",
						help="Find empty regions")
	parser.add_argument("--frequency", "-f", action="store_true",
						help="Show byte frequency")
	parser.add_argument("--max-results", type=int, default=20,
						help="Maximum results to show")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")

	args = parser.parse_args()

	if not args.file:
		print("Byte Pattern Finder")
		print()
		print("Usage:")
		print("  pattern_finder.py FILE -s 'PATTERN'")
		print("  pattern_finder.py FILE --entropy")
		print("  pattern_finder.py FILE --compare OTHER")
		print()
		print("Pattern examples:")
		print("  '4C ?? ??'  - JMP with any address")
		print("  'A9 00 8D'  - LDA #$00 STA")
		print("  '20 XX YY'  - JSR with wildcard address")
		return

	data = args.file.read_bytes()
	print(f"Loaded: {args.file} ({len(data)} bytes)")

	if args.search:
		finder = PatternFinder()
		result = finder.search(data, args.search, args.context)

		print(f"\nPattern: {args.search}")
		print(f"Found: {result.count} matches")

		for match in result.matches[:args.max_results]:
			print(f"\n{match}")
			if match.context_before:
				hex_before = ' '.join(f'{b:02X}' for b in match.context_before)
				print(f"  Before: {hex_before}")
			if match.context_after:
				hex_after = ' '.join(f'{b:02X}' for b in match.context_after)
				print(f"  After:  {hex_after}")

		if result.count > args.max_results:
			print(f"\n... and {result.count - args.max_results} more")

	elif args.compare:
		data2 = args.compare.read_bytes()
		comparer = FileComparer()

		similarity = comparer.similarity(data, data2)
		print(f"\nSimilarity: {similarity:.1%}")

		regions = comparer.diff_regions(data, data2, args.context)
		print(f"Difference regions: {len(regions)}")

		for region in regions[:args.max_results]:
			print(f"\n${region['offset']:06X} ({region['length']} bytes):")
			print(f"  File 1: {' '.join(f'{b:02X}' for b in region['data1'])}")
			print(f"  File 2: {' '.join(f'{b:02X}' for b in region['data2'])}")

	elif args.entropy:
		analyzer = ByteAnalyzer()
		entropy = analyzer.entropy(data, args.block_size)

		print(f"\nEntropy analysis (block size: {args.block_size})")
		print("-" * 50)

		# Show histogram
		for i, e in enumerate(entropy):
			offset = i * args.block_size
			bar = '#' * int(e * 5)
			print(f"${offset:06X}: {e:.2f} {bar}")

		avg_entropy = sum(entropy) / len(entropy) if entropy else 0
		print(f"\nAverage entropy: {avg_entropy:.2f}")

	elif args.repeats:
		analyzer = ByteAnalyzer()
		blocks = analyzer.find_repeating_blocks(data, args.block_size)

		print(f"\nRepeating blocks ({len(blocks)} unique patterns)")

		# Sort by count
		sorted_blocks = sorted(blocks.items(), key=lambda x: -len(x[1]))

		for block_data, offsets in sorted_blocks[:args.max_results]:
			hex_str = ' '.join(f'{b:02X}' for b in block_data[:8])
			print(f"\n{hex_str}... ({len(offsets)} times)")
			print(f"  At: {', '.join(f'${o:06X}' for o in offsets[:5])}")

	elif args.empty:
		analyzer = ByteAnalyzer()
		regions = analyzer.find_empty_regions(data)

		print(f"\nEmpty regions (0xFF fill): {len(regions)}")

		total_empty = 0
		for offset, length in regions:
			print(f"  ${offset:06X} - ${offset + length - 1:06X} ({length} bytes)")
			total_empty += length

		print(f"\nTotal empty space: {total_empty} bytes ({total_empty * 100 / len(data):.1f}%)")

	elif args.frequency:
		analyzer = ByteAnalyzer()
		freq = analyzer.byte_frequency(data)

		print("\nByte frequency:")

		# Sort by frequency
		sorted_freq = sorted(freq.items(), key=lambda x: -x[1])

		for byte_val, count in sorted_freq[:32]:
			pct = count * 100 / len(data)
			bar = '#' * int(pct)
			print(f"  ${byte_val:02X}: {count:6d} ({pct:5.2f}%) {bar}")


if __name__ == "__main__":
	main()
