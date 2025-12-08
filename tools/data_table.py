#!/usr/bin/env python3
"""
Data Table Analyzer

Analyze and extract data tables from ROM files.
Useful for finding monster stats, item data, level-up tables, etc.

Features:
- Detect table boundaries
- Analyze record structures
- Export to JSON/CSV
- Compare tables between ROMs
- Visualize data patterns

Usage:
	python data_table.py analyze <rom> --start 0x8000 --size 16 --count 50
	python data_table.py detect <rom> --min-records 10
	python data_table.py export <rom> --start 0x8000 --format json
	python data_table.py compare <rom1> <rom2> --start 0x8000
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


@dataclass
class TableField:
	"""Definition of a field in a table record"""
	name: str
	offset: int
	size: int
	type: str = 'uint'  # uint, sint, pointer, flags, string
	format_str: str = ''


@dataclass
class TableDefinition:
	"""Definition of a data table"""
	name: str = ""
	start_offset: int = 0
	record_size: int = 0
	record_count: int = 0
	fields: List[TableField] = field(default_factory=list)
	pointer_base: int = 0  # For relative pointers


@dataclass
class AnalysisResult:
	"""Result of table analysis"""
	offset: int
	record_size: int
	likely_count: int
	confidence: float
	field_analysis: Dict[int, Dict] = field(default_factory=dict)
	sample_records: List[bytes] = field(default_factory=list)


class TableDetector:
	"""Detect potential data tables in ROM"""

	@staticmethod
	def analyze_byte_distribution(data: bytes, offset: int, record_size: int, count: int) -> Dict[int, Dict]:
		"""Analyze byte distribution for each position in record"""
		analysis = {}

		for pos in range(record_size):
			values = []
			for i in range(count):
				idx = offset + (i * record_size) + pos
				if idx < len(data):
					values.append(data[idx])

			if values:
				unique = len(set(values))
				min_val = min(values)
				max_val = max(values)
				avg_val = sum(values) / len(values)

				# Determine likely type
				if unique == 1:
					field_type = 'constant'
				elif max_val - min_val <= 1 and unique == 2:
					field_type = 'boolean'
				elif max_val <= 100 and min_val >= 0:
					field_type = 'small_int'
				elif all(v & 0x80 for v in values) or all(not (v & 0x80) for v in values):
					field_type = 'pointer_byte'
				else:
					field_type = 'variable'

				analysis[pos] = {
					'unique': unique,
					'min': min_val,
					'max': max_val,
					'avg': round(avg_val, 2),
					'type': field_type,
					'sample': values[:5],
				}

		return analysis

	@staticmethod
	def detect_record_size(data: bytes, offset: int, max_size: int = 64) -> List[Tuple[int, float]]:
		"""Detect likely record sizes based on patterns"""
		candidates = []

		for size in range(2, max_size + 1):
			if offset + size * 10 > len(data):
				continue

			# Check for repeating patterns
			score = 0
			checks = 0

			for pos in range(size):
				values = []
				for i in range(10):
					idx = offset + (i * size) + pos
					if idx < len(data):
						values.append(data[idx])

				if values:
					unique = len(set(values))
					# Consistent values suggest structure
					if unique <= 5:
						score += 1
					checks += 1

			if checks > 0:
				confidence = score / checks
				candidates.append((size, confidence))

		# Sort by confidence
		candidates.sort(key=lambda x: -x[1])

		return candidates[:10]

	@staticmethod
	def detect_tables(
		data: bytes,
		min_records: int = 10,
		min_record_size: int = 4,
		max_record_size: int = 32
	) -> List[AnalysisResult]:
		"""Detect potential data tables in ROM"""
		results = []
		checked_ranges = set()

		for record_size in range(min_record_size, max_record_size + 1):
			for offset in range(0, len(data) - record_size * min_records, record_size):
				# Skip already covered ranges
				range_key = (offset // 256, record_size)
				if range_key in checked_ranges:
					continue
				checked_ranges.add(range_key)

				# Check if this looks like a table
				analysis = TableDetector.analyze_byte_distribution(
					data, offset, record_size, min_records
				)

				# Score based on consistency
				constant_fields = sum(1 for a in analysis.values() if a['type'] == 'constant')
				boolean_fields = sum(1 for a in analysis.values() if a['type'] == 'boolean')
				variable_fields = sum(1 for a in analysis.values() if a['type'] == 'variable')

				# Good tables have mix of constant and variable fields
				if constant_fields > 0 and variable_fields > 0:
					total = len(analysis)
					confidence = (constant_fields + boolean_fields * 0.5) / total

					if confidence > 0.1 and confidence < 0.9:
						# Try to find table end
						count = min_records
						while offset + (count + 1) * record_size <= len(data):
							test_analysis = TableDetector.analyze_byte_distribution(
								data, offset, record_size, count + 1
							)
							# Check if pattern still holds
							still_valid = True
							for pos, orig in analysis.items():
								if pos in test_analysis:
									new = test_analysis[pos]
									if orig['type'] == 'constant' and new['unique'] > 1:
										still_valid = False
										break
							if not still_valid:
								break
							count += 1

						if count >= min_records:
							# Collect sample records
							samples = []
							for i in range(min(5, count)):
								idx = offset + (i * record_size)
								samples.append(data[idx:idx + record_size])

							results.append(AnalysisResult(
								offset=offset,
								record_size=record_size,
								likely_count=count,
								confidence=confidence,
								field_analysis=analysis,
								sample_records=samples,
							))

		# Sort by confidence and size
		results.sort(key=lambda x: -(x.confidence * x.likely_count * x.record_size))

		return results[:50]


class TableReader:
	"""Read and parse data tables"""

	def __init__(self, data: bytes):
		self.data = data

	def read_table(
		self,
		definition: TableDefinition
	) -> List[Dict[str, Any]]:
		"""Read table using definition"""
		records = []

		for i in range(definition.record_count):
			offset = definition.start_offset + (i * definition.record_size)
			record = {'_index': i, '_offset': offset}

			for field_def in definition.fields:
				field_offset = offset + field_def.offset
				value = self._read_field(field_offset, field_def)
				record[field_def.name] = value

			records.append(record)

		return records

	def _read_field(self, offset: int, field_def: TableField) -> Any:
		"""Read single field value"""
		if offset + field_def.size > len(self.data):
			return None

		raw = self.data[offset:offset + field_def.size]

		if field_def.type == 'uint':
			if field_def.size == 1:
				return raw[0]
			elif field_def.size == 2:
				return struct.unpack('<H', raw)[0]
			elif field_def.size == 4:
				return struct.unpack('<I', raw)[0]
		elif field_def.type == 'sint':
			if field_def.size == 1:
				return struct.unpack('b', raw)[0]
			elif field_def.size == 2:
				return struct.unpack('<h', raw)[0]
		elif field_def.type == 'pointer':
			if field_def.size == 2:
				return struct.unpack('<H', raw)[0]
			elif field_def.size == 3:
				return struct.unpack('<I', raw + b'\x00')[0] & 0xFFFFFF
		elif field_def.type == 'flags':
			return [bool(raw[0] & (1 << i)) for i in range(8)]
		elif field_def.type == 'string':
			# Read until terminator or max size
			return raw.rstrip(b'\x00\xff')

		return list(raw)

	def read_raw(
		self,
		offset: int,
		record_size: int,
		count: int
	) -> List[Dict[str, Any]]:
		"""Read raw records without field definitions"""
		records = []

		for i in range(count):
			rec_offset = offset + (i * record_size)
			raw = self.data[rec_offset:rec_offset + record_size]

			record = {
				'_index': i,
				'_offset': rec_offset,
				'_hex': ' '.join(f'{b:02X}' for b in raw),
			}

			# Add individual bytes
			for j, b in enumerate(raw):
				record[f'byte_{j:02d}'] = b

			records.append(record)

		return records


class TableExporter:
	"""Export tables to various formats"""

	@staticmethod
	def to_json(records: List[Dict], filepath: str) -> None:
		"""Export to JSON"""
		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(records, f, indent='\t')

	@staticmethod
	def to_csv(records: List[Dict], filepath: str) -> None:
		"""Export to CSV"""
		if not records:
			return

		keys = list(records[0].keys())

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write(','.join(keys) + '\n')
			for record in records:
				values = [str(record.get(k, '')) for k in keys]
				f.write(','.join(values) + '\n')

	@staticmethod
	def to_asm(records: List[Dict], filepath: str, table_name: str = "DataTable") -> None:
		"""Export to assembly include file"""
		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write(f"; {table_name}\n")
			f.write(f"; Generated data table ({len(records)} records)\n\n")

			for record in records:
				idx = record.get('_index', 0)
				hex_data = record.get('_hex', '')
				if hex_data:
					# Convert to .byte format
					bytes_str = ', '.join(f'${b}' for b in hex_data.split())
					f.write(f"{table_name}_{idx:03d}: .byte {bytes_str}\n")


class TableComparator:
	"""Compare tables between ROMs"""

	@staticmethod
	def compare(
		data1: bytes,
		data2: bytes,
		offset: int,
		record_size: int,
		count: int
	) -> Dict:
		"""Compare tables between two ROMs"""
		differences = []

		for i in range(count):
			rec_offset = offset + (i * record_size)
			rec1 = data1[rec_offset:rec_offset + record_size]
			rec2 = data2[rec_offset:rec_offset + record_size]

			if rec1 != rec2:
				diff = {
					'record': i,
					'offset': rec_offset,
					'changes': [],
				}

				for j in range(min(len(rec1), len(rec2))):
					if rec1[j] != rec2[j]:
						diff['changes'].append({
							'byte': j,
							'rom1': f'{rec1[j]:02X}',
							'rom2': f'{rec2[j]:02X}',
						})

				differences.append(diff)

		return {
			'total_records': count,
			'different_records': len(differences),
			'differences': differences,
		}


def format_analysis(analysis: AnalysisResult) -> str:
	"""Format analysis result as string"""
	lines = [
		f"Offset: 0x{analysis.offset:06X}",
		f"Record Size: {analysis.record_size} bytes",
		f"Record Count: ~{analysis.likely_count}",
		f"Confidence: {analysis.confidence:.2f}",
		"",
		"Field Analysis:",
	]

	for pos, info in sorted(analysis.field_analysis.items()):
		type_str = info['type']
		range_str = f"[{info['min']:02X}-{info['max']:02X}]"
		lines.append(f"  +{pos:02d}: {type_str:12s} {range_str} (unique: {info['unique']})")

	if analysis.sample_records:
		lines.append("")
		lines.append("Sample Records:")
		for i, rec in enumerate(analysis.sample_records):
			hex_str = ' '.join(f'{b:02X}' for b in rec)
			lines.append(f"  {i}: {hex_str}")

	return '\n'.join(lines)


def main():
	parser = argparse.ArgumentParser(
		description='Data Table Analyzer',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze known table')
	analyze_parser.add_argument('rom', help='ROM file')
	analyze_parser.add_argument('--start', '-s', type=lambda x: int(x, 0), required=True, help='Start offset')
	analyze_parser.add_argument('--size', type=int, required=True, help='Record size')
	analyze_parser.add_argument('--count', '-c', type=int, required=True, help='Record count')

	# Detect command
	detect_parser = subparsers.add_parser('detect', help='Detect tables automatically')
	detect_parser.add_argument('rom', help='ROM file')
	detect_parser.add_argument('--min-records', type=int, default=10, help='Minimum records')
	detect_parser.add_argument('--min-size', type=int, default=4, help='Minimum record size')
	detect_parser.add_argument('--max-size', type=int, default=32, help='Maximum record size')
	detect_parser.add_argument('--report', '-r', help='Output report file')

	# Export command
	export_parser = subparsers.add_parser('export', help='Export table data')
	export_parser.add_argument('rom', help='ROM file')
	export_parser.add_argument('--start', '-s', type=lambda x: int(x, 0), required=True, help='Start offset')
	export_parser.add_argument('--size', type=int, required=True, help='Record size')
	export_parser.add_argument('--count', '-c', type=int, required=True, help='Record count')
	export_parser.add_argument('--output', '-o', required=True, help='Output file')
	export_parser.add_argument('--format', '-f', default='json', choices=['json', 'csv', 'asm'], help='Output format')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Compare tables between ROMs')
	compare_parser.add_argument('rom1', help='First ROM')
	compare_parser.add_argument('rom2', help='Second ROM')
	compare_parser.add_argument('--start', '-s', type=lambda x: int(x, 0), required=True, help='Start offset')
	compare_parser.add_argument('--size', type=int, required=True, help='Record size')
	compare_parser.add_argument('--count', '-c', type=int, required=True, help='Record count')

	args = parser.parse_args()

	if args.command == 'analyze':
		with open(args.rom, 'rb') as f:
			data = f.read()

		analysis = TableDetector.analyze_byte_distribution(
			data, args.start, args.size, args.count
		)

		result = AnalysisResult(
			offset=args.start,
			record_size=args.size,
			likely_count=args.count,
			confidence=1.0,
			field_analysis=analysis,
		)

		# Add sample records
		for i in range(min(5, args.count)):
			idx = args.start + (i * args.size)
			result.sample_records.append(data[idx:idx + args.size])

		print(format_analysis(result))

	elif args.command == 'detect':
		with open(args.rom, 'rb') as f:
			data = f.read()

		print(f"Scanning for tables (this may take a while)...")

		results = TableDetector.detect_tables(
			data,
			min_records=args.min_records,
			min_record_size=args.min_size,
			max_record_size=args.max_size
		)

		print(f"\nFound {len(results)} potential tables:\n")

		for i, result in enumerate(results[:20]):
			print(f"--- Table {i + 1} ---")
			print(format_analysis(result))
			print()

		if args.report:
			report = {
				'tables': [
					{
						'offset': f"0x{r.offset:06X}",
						'record_size': r.record_size,
						'record_count': r.likely_count,
						'confidence': r.confidence,
						'fields': {
							str(k): v for k, v in r.field_analysis.items()
						},
					}
					for r in results
				]
			}

			with open(args.report, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(report, f, indent='\t')

			print(f"Report saved to: {args.report}")

	elif args.command == 'export':
		with open(args.rom, 'rb') as f:
			data = f.read()

		reader = TableReader(data)
		records = reader.read_raw(args.start, args.size, args.count)

		if args.format == 'json':
			TableExporter.to_json(records, args.output)
		elif args.format == 'csv':
			TableExporter.to_csv(records, args.output)
		elif args.format == 'asm':
			TableExporter.to_asm(records, args.output)

		print(f"Exported {len(records)} records to: {args.output}")

	elif args.command == 'compare':
		with open(args.rom1, 'rb') as f:
			data1 = f.read()
		with open(args.rom2, 'rb') as f:
			data2 = f.read()

		result = TableComparator.compare(
			data1, data2, args.start, args.size, args.count
		)

		print(f"Comparison Results:")
		print(f"  Total Records: {result['total_records']}")
		print(f"  Different: {result['different_records']}")
		print()

		for diff in result['differences'][:20]:
			print(f"Record {diff['record']} (0x{diff['offset']:06X}):")
			for change in diff['changes']:
				print(f"  Byte {change['byte']}: {change['rom1']} -> {change['rom2']}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
