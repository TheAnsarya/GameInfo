#!/usr/bin/env python3
"""
Data Comparator Tool
Compare data structures across different game versions or regional releases.

Usage:
	python data_comparator.py rom1.nes rom2.nes --offset 0x10000 --length 256
	python data_comparator.py rom1.nes rom2.nes --table enemy_stats
	python data_comparator.py rom1.nes rom2.nes --scan --threshold 80
"""

import argparse
import json
import os
import sys
from pathlib import Path
from typing import Optional


class DataComparator:
	"""Compare data structures between ROM versions."""

	def __init__(self, rom1_path: str, rom2_path: str):
		"""Initialize with two ROM paths."""
		self.rom1_path = Path(rom1_path)
		self.rom2_path = Path(rom2_path)
		self.rom1_data = None
		self.rom2_data = None
		self.differences = []

	def load_roms(self) -> bool:
		"""Load both ROM files."""
		try:
			with open(self.rom1_path, 'rb') as f:
				self.rom1_data = f.read()
			with open(self.rom2_path, 'rb') as f:
				self.rom2_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROMs: {e}")
			return False

	def compare_region(self, offset: int, length: int) -> dict:
		"""Compare a specific region between ROMs."""
		result = {
			'offset': offset,
			'length': length,
			'rom1_hex': '',
			'rom2_hex': '',
			'differences': [],
			'similarity': 0.0
		}

		if not self.rom1_data or not self.rom2_data:
			return result

		data1 = self.rom1_data[offset:offset + length]
		data2 = self.rom2_data[offset:offset + length]

		result['rom1_hex'] = data1.hex()
		result['rom2_hex'] = data2.hex()

		# Find byte-level differences
		matches = 0
		for i in range(min(len(data1), len(data2))):
			if data1[i] == data2[i]:
				matches += 1
			else:
				result['differences'].append({
					'relative_offset': i,
					'absolute_offset': offset + i,
					'rom1_value': f"0x{data1[i]:02x}",
					'rom2_value': f"0x{data2[i]:02x}"
				})

		if max(len(data1), len(data2)) > 0:
			result['similarity'] = matches / max(len(data1), len(data2)) * 100

		return result

	def scan_for_matches(self, pattern: bytes, region_start: int = 0,
						 region_end: Optional[int] = None) -> list:
		"""Find matching patterns in both ROMs."""
		if region_end is None:
			region_end = min(len(self.rom1_data), len(self.rom2_data))

		rom1_matches = []
		rom2_matches = []

		# Scan ROM 1
		pos = region_start
		while pos < region_end:
			idx = self.rom1_data.find(pattern, pos, region_end)
			if idx == -1:
				break
			rom1_matches.append(idx)
			pos = idx + 1

		# Scan ROM 2
		pos = region_start
		while pos < region_end:
			idx = self.rom2_data.find(pattern, pos, region_end)
			if idx == -1:
				break
			rom2_matches.append(idx)
			pos = idx + 1

		return {
			'pattern': pattern.hex(),
			'rom1_matches': rom1_matches,
			'rom2_matches': rom2_matches,
			'rom1_count': len(rom1_matches),
			'rom2_count': len(rom2_matches)
		}

	def find_relocated_data(self, sample_offset: int, sample_length: int,
							 search_range: int = 0x10000) -> list:
		"""Find where data from ROM1 might have moved in ROM2."""
		if not self.rom1_data or not self.rom2_data:
			return []

		sample = self.rom1_data[sample_offset:sample_offset + sample_length]
		if len(sample) < sample_length:
			return []

		matches = []

		# Search in ROM2
		start = max(0, sample_offset - search_range)
		end = min(len(self.rom2_data), sample_offset + search_range)

		pos = start
		while pos < end:
			idx = self.rom2_data.find(sample, pos, end)
			if idx == -1:
				break
			matches.append({
				'original_offset': f"0x{sample_offset:06x}",
				'found_offset': f"0x{idx:06x}",
				'delta': idx - sample_offset
			})
			pos = idx + 1

		return matches

	def compare_table(self, table_def: dict) -> dict:
		"""Compare a table structure between ROMs."""
		result = {
			'table_name': table_def.get('name', 'Unknown'),
			'entries': [],
			'summary': {
				'identical': 0,
				'different': 0,
				'missing': 0
			}
		}

		offset = table_def.get('offset', 0)
		entry_size = table_def.get('entry_size', 1)
		entry_count = table_def.get('entry_count', 1)
		fields = table_def.get('fields', [])

		for i in range(entry_count):
			entry_offset = offset + (i * entry_size)

			entry1 = self.rom1_data[entry_offset:entry_offset + entry_size]
			entry2 = self.rom2_data[entry_offset:entry_offset + entry_size]

			if entry1 == entry2:
				result['summary']['identical'] += 1
			else:
				result['summary']['different'] += 1

				# Parse fields for detailed comparison
				entry_diff = {
					'index': i,
					'offset': f"0x{entry_offset:06x}",
					'fields': []
				}

				for field in fields:
					field_offset = field.get('offset', 0)
					field_size = field.get('size', 1)
					field_name = field.get('name', f'Field_{field_offset}')

					abs_offset = field_offset
					val1 = int.from_bytes(
						entry1[abs_offset:abs_offset + field_size], 'little'
					) if abs_offset + field_size <= len(entry1) else 0
					val2 = int.from_bytes(
						entry2[abs_offset:abs_offset + field_size], 'little'
					) if abs_offset + field_size <= len(entry2) else 0

					if val1 != val2:
						entry_diff['fields'].append({
							'name': field_name,
							'rom1': val1,
							'rom2': val2,
							'delta': val2 - val1
						})

				result['entries'].append(entry_diff)

		return result

	def generate_diff_report(self) -> str:
		"""Generate a human-readable diff report."""
		lines = []
		lines.append("=" * 60)
		lines.append("ROM Comparison Report")
		lines.append("=" * 60)
		lines.append(f"ROM 1: {self.rom1_path.name}")
		lines.append(f"  Size: {len(self.rom1_data):,} bytes")
		lines.append(f"ROM 2: {self.rom2_path.name}")
		lines.append(f"  Size: {len(self.rom2_data):,} bytes")
		lines.append("")

		# Overall statistics
		min_len = min(len(self.rom1_data), len(self.rom2_data))
		diff_count = 0
		for i in range(min_len):
			if self.rom1_data[i] != self.rom2_data[i]:
				diff_count += 1

		similarity = (min_len - diff_count) / min_len * 100 if min_len > 0 else 0

		lines.append(f"Overall similarity: {similarity:.2f}%")
		lines.append(f"Different bytes: {diff_count:,}")
		lines.append("")

		# Find continuous difference regions
		lines.append("Difference Regions:")
		lines.append("-" * 40)

		in_diff = False
		diff_start = 0
		regions = []

		for i in range(min_len):
			is_diff = self.rom1_data[i] != self.rom2_data[i]

			if is_diff and not in_diff:
				diff_start = i
				in_diff = True
			elif not is_diff and in_diff:
				regions.append((diff_start, i - 1))
				in_diff = False

		if in_diff:
			regions.append((diff_start, min_len - 1))

		# Show first 20 regions
		for start, end in regions[:20]:
			length = end - start + 1
			lines.append(f"  0x{start:06x} - 0x{end:06x} ({length} bytes)")

		if len(regions) > 20:
			lines.append(f"  ... and {len(regions) - 20} more regions")

		return '\n'.join(lines)

	def export_diff(self, output_path: str, format: str = 'json'):
		"""Export difference data."""
		if format == 'json':
			min_len = min(len(self.rom1_data), len(self.rom2_data))

			diff_bytes = []
			for i in range(min_len):
				if self.rom1_data[i] != self.rom2_data[i]:
					diff_bytes.append({
						'offset': i,
						'rom1': self.rom1_data[i],
						'rom2': self.rom2_data[i]
					})

			data = {
				'rom1': {
					'path': str(self.rom1_path),
					'size': len(self.rom1_data)
				},
				'rom2': {
					'path': str(self.rom2_path),
					'size': len(self.rom2_data)
				},
				'differences': diff_bytes,
				'diff_count': len(diff_bytes)
			}

			with open(output_path, 'w') as f:
				json.dump(data, f, indent='\t')

		elif format == 'ips':
			# Generate IPS patch from ROM1 to ROM2
			patches = self._generate_ips_records()

			with open(output_path, 'wb') as f:
				f.write(b'PATCH')
				for offset, data in patches:
					# 3-byte offset
					f.write(offset.to_bytes(3, 'big'))
					# 2-byte size
					f.write(len(data).to_bytes(2, 'big'))
					# Data
					f.write(data)
				f.write(b'EOF')

	def _generate_ips_records(self) -> list:
		"""Generate IPS patch records."""
		records = []
		min_len = min(len(self.rom1_data), len(self.rom2_data))

		i = 0
		while i < min_len:
			if self.rom1_data[i] != self.rom2_data[i]:
				start = i
				# Find extent of difference
				while i < min_len and self.rom1_data[i] != self.rom2_data[i]:
					i += 1
					# IPS has max record size of 65535
					if i - start >= 65535:
						break

				records.append((start, self.rom2_data[start:i]))
			else:
				i += 1

		return records


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description='Compare data structures between ROM versions'
	)
	parser.add_argument('rom1', help='First ROM file')
	parser.add_argument('rom2', help='Second ROM file')
	parser.add_argument('--offset', type=lambda x: int(x, 0),
						help='Start offset to compare')
	parser.add_argument('--length', type=int, default=256,
						help='Length to compare (default: 256)')
	parser.add_argument('--table', help='Compare using table definition JSON')
	parser.add_argument('--scan', help='Scan for hex pattern')
	parser.add_argument('--relocate', type=lambda x: int(x, 0),
						help='Find relocated data from this offset')
	parser.add_argument('--output', '-o', help='Output file')
	parser.add_argument('--format', choices=['json', 'ips', 'text'],
						default='text', help='Output format')
	parser.add_argument('--report', action='store_true',
						help='Generate full comparison report')

	args = parser.parse_args()

	comparator = DataComparator(args.rom1, args.rom2)

	if not comparator.load_roms():
		sys.exit(1)

	if args.report:
		report = comparator.generate_diff_report()
		if args.output:
			with open(args.output, 'w') as f:
				f.write(report)
		else:
			print(report)

	elif args.offset is not None:
		result = comparator.compare_region(args.offset, args.length)
		print(f"Comparing 0x{args.offset:06x} - 0x{args.offset + args.length:06x}")
		print(f"Similarity: {result['similarity']:.2f}%")
		print(f"Differences: {len(result['differences'])}")
		for diff in result['differences'][:20]:
			print(f"  0x{diff['absolute_offset']:06x}: "
				  f"{diff['rom1_value']} -> {diff['rom2_value']}")

	elif args.table:
		with open(args.table, 'r') as f:
			table_def = json.load(f)
		result = comparator.compare_table(table_def)
		print(json.dumps(result, indent='\t'))

	elif args.scan:
		pattern = bytes.fromhex(args.scan)
		result = comparator.scan_for_matches(pattern)
		print(f"Pattern: {args.scan}")
		print(f"ROM1 matches: {result['rom1_count']} at {result['rom1_matches'][:10]}")
		print(f"ROM2 matches: {result['rom2_count']} at {result['rom2_matches'][:10]}")

	elif args.relocate is not None:
		matches = comparator.find_relocated_data(args.relocate, args.length)
		print(f"Looking for data from 0x{args.relocate:06x}")
		for match in matches:
			print(f"  Found at {match['found_offset']} (delta: {match['delta']:+d})")

	elif args.output:
		comparator.export_diff(args.output, args.format)
		print(f"Exported to {args.output}")

	else:
		report = comparator.generate_diff_report()
		print(report)


if __name__ == '__main__':
	main()
