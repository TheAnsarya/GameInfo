#!/usr/bin/env python3
"""
Label Merge Utility

A tool for merging, comparing, and synchronizing label files across different formats.
Supports MLB (Mesen), NL (FCEUX), and ASM symbol formats.

Features:
- Merge multiple label files
- Compare label sets and find differences
- Synchronize labels across formats
- Detect and resolve conflicts
- Generate merge reports
- Batch processing

Usage:
	python label_merge.py merge <file1> <file2> --output <merged>
	python label_merge.py compare <file1> <file2>
	python label_merge.py sync <source> --to-mlb <output.mlb> --to-nl <output_dir>
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


class LabelFormat(Enum):
	"""Label file formats"""
	MLB = "mlb"
	NL = "nl"
	ASM = "asm"
	JSON = "json"
	UNKNOWN = "unknown"


@dataclass
class UnifiedLabel:
	"""A label in a unified format for merging"""
	address: int
	name: str
	comment: str = ""
	bank: int = -1
	is_ram: bool = False
	source: str = ""

	@property
	def key(self) -> str:
		"""Unique key for this label"""
		if self.is_ram:
			return f"RAM:{self.address:04X}"
		if self.bank >= 0:
			return f"PRG:{self.bank:02X}:{self.address:04X}"
		return f"PRG:{self.address:04X}"

	def __eq__(self, other):
		if not isinstance(other, UnifiedLabel):
			return False
		return self.key == other.key and self.name == other.name

	def __hash__(self):
		return hash(self.key)


class LabelConflict:
	"""Represents a conflict between labels"""

	def __init__(self, address: str, labels: List[UnifiedLabel]):
		self.address = address
		self.labels = labels

	@property
	def names(self) -> List[str]:
		return [l.name for l in self.labels]

	def auto_resolve(self, strategy: str = "first") -> UnifiedLabel:
		"""Auto-resolve using a strategy"""
		if strategy == "first":
			return self.labels[0]
		elif strategy == "longest":
			return max(self.labels, key=lambda l: len(l.name))
		elif strategy == "shortest":
			return min(self.labels, key=lambda l: len(l.name))
		elif strategy == "most_info":
			# Prefer labels with comments
			with_comment = [l for l in self.labels if l.comment]
			if with_comment:
				return with_comment[0]
			return self.labels[0]
		return self.labels[0]


class LabelSet:
	"""A collection of labels from one or more sources"""

	def __init__(self, name: str = ""):
		self.name = name
		self.labels: Dict[str, UnifiedLabel] = {}

	def add(self, label: UnifiedLabel) -> None:
		"""Add a label"""
		self.labels[label.key] = label

	def get(self, key: str) -> Optional[UnifiedLabel]:
		"""Get a label by key"""
		return self.labels.get(key)

	def remove(self, key: str) -> bool:
		"""Remove a label"""
		if key in self.labels:
			del self.labels[key]
			return True
		return False

	def keys(self) -> Set[str]:
		"""Get all label keys"""
		return set(self.labels.keys())

	def __len__(self) -> int:
		return len(self.labels)

	def __iter__(self):
		return iter(self.labels.values())


class LabelParser:
	"""Parse various label file formats"""

	@staticmethod
	def detect_format(filepath: str) -> LabelFormat:
		"""Detect the format of a label file"""
		ext = os.path.splitext(filepath)[1].lower()

		if ext == '.mlb':
			return LabelFormat.MLB
		elif ext == '.nl':
			return LabelFormat.NL
		elif ext in ('.asm', '.s', '.inc'):
			return LabelFormat.ASM
		elif ext == '.json':
			return LabelFormat.JSON

		# Try to detect from content
		with open(filepath, 'r', encoding='utf-8') as f:
			first_line = f.readline().strip()

			if first_line.startswith('$') and '#' in first_line:
				return LabelFormat.NL
			if ':' in first_line and first_line[0] in 'PCRSG':
				return LabelFormat.MLB
			if first_line.startswith('{'):
				return LabelFormat.JSON

		return LabelFormat.UNKNOWN

	@staticmethod
	def parse_mlb(filepath: str, source_name: str = "") -> LabelSet:
		"""Parse an MLB file"""
		labels = LabelSet(source_name or filepath)

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				parts = line.split(':')
				if len(parts) < 3:
					continue

				addr_type = parts[0]
				is_ram = addr_type in ('R', 'I', 'S')

				try:
					if len(parts) >= 5:
						bank = int(parts[1], 16)
						address = int(parts[2], 16)
						name = parts[3]
						comment = parts[4] if len(parts) > 4 else ""
					else:
						bank = -1
						address = int(parts[1], 16)
						name = parts[2]
						comment = parts[3] if len(parts) > 3 else ""

					label = UnifiedLabel(
						address=address,
						name=name,
						comment=comment,
						bank=bank if not is_ram else -1,
						is_ram=is_ram,
						source=filepath
					)
					labels.add(label)
				except (ValueError, IndexError):
					continue

		return labels

	@staticmethod
	def parse_nl(filepath: str, source_name: str = "") -> LabelSet:
		"""Parse an NL file"""
		labels = LabelSet(source_name or filepath)

		# Determine bank/type from filename
		basename = os.path.basename(filepath)
		is_ram = '.ram.nl' in basename

		bank = -1
		if not is_ram:
			match = re.search(r'\.(\d+)\.nl$', basename, re.IGNORECASE)
			if match:
				bank = int(match.group(1))

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				match = re.match(r'\$([0-9A-Fa-f]+)#([^#]+)(?:#(.*))?', line)
				if match:
					address = int(match.group(1), 16)
					name = match.group(2)
					comment = match.group(3) or ""

					label = UnifiedLabel(
						address=address,
						name=name,
						comment=comment,
						bank=bank,
						is_ram=is_ram,
						source=filepath
					)
					labels.add(label)

		return labels

	@staticmethod
	def parse_asm(filepath: str, source_name: str = "") -> LabelSet:
		"""Parse ASM symbols (equ/= definitions)"""
		labels = LabelSet(source_name or filepath)

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				# Match: name = $XXXX or name equ $XXXX
				match = re.match(
					r'(\w+)\s*(?:=|equ)\s*\$([0-9A-Fa-f]+)',
					line, re.IGNORECASE
				)
				if match:
					name = match.group(1)
					address = int(match.group(2), 16)

					# Determine if RAM based on address
					is_ram = address < 0x8000

					label = UnifiedLabel(
						address=address,
						name=name,
						is_ram=is_ram,
						source=filepath
					)
					labels.add(label)

		return labels

	@staticmethod
	def parse_json(filepath: str, source_name: str = "") -> LabelSet:
		"""Parse JSON label file"""
		labels = LabelSet(source_name or filepath)

		with open(filepath, 'r', encoding='utf-8') as f:
			data = json.load(f)

		for entry in data.get('labels', []):
			label = UnifiedLabel(
				address=entry.get('address', 0),
				name=entry.get('name', ''),
				comment=entry.get('comment', ''),
				bank=entry.get('bank', -1),
				is_ram=entry.get('is_ram', False),
				source=filepath
			)
			labels.add(label)

		return labels

	@classmethod
	def parse(cls, filepath: str, source_name: str = "") -> LabelSet:
		"""Parse a label file auto-detecting format"""
		fmt = cls.detect_format(filepath)

		if fmt == LabelFormat.MLB:
			return cls.parse_mlb(filepath, source_name)
		elif fmt == LabelFormat.NL:
			return cls.parse_nl(filepath, source_name)
		elif fmt == LabelFormat.ASM:
			return cls.parse_asm(filepath, source_name)
		elif fmt == LabelFormat.JSON:
			return cls.parse_json(filepath, source_name)
		else:
			raise ValueError(f"Unknown label file format: {filepath}")


class LabelWriter:
	"""Write labels to various formats"""

	@staticmethod
	def write_mlb(labels: LabelSet, filepath: str) -> int:
		"""Write labels to MLB format"""
		lines = ["; Mesen Label File", f"; Generated from: {labels.name}", ""]

		# Group by type
		ram_labels = [l for l in labels if l.is_ram]
		rom_labels = [l for l in labels if not l.is_ram]

		if ram_labels:
			lines.append("; RAM Labels")
			for label in sorted(ram_labels, key=lambda l: l.address):
				lines.append(f"R:{label.address:04X}:{label.name}:{label.comment}")
			lines.append("")

		if rom_labels:
			lines.append("; ROM Labels")
			for label in sorted(rom_labels, key=lambda l: (l.bank, l.address)):
				if label.bank >= 0:
					lines.append(f"P:{label.bank:02X}:{label.address:04X}:{label.name}:{label.comment}")
				else:
					lines.append(f"P:{label.address:04X}:{label.name}:{label.comment}")

		with open(filepath, 'w', encoding='utf-8') as f:
			f.write('\n'.join(lines) + '\n')

		return len(labels)

	@staticmethod
	def write_nl(labels: LabelSet, output_dir: str, rom_name: str) -> Dict[str, int]:
		"""Write labels to NL format"""
		os.makedirs(output_dir, exist_ok=True)

		result = {'ram': 0, 'rom': 0}

		# RAM labels
		ram_labels = [l for l in labels if l.is_ram]
		if ram_labels:
			ram_path = os.path.join(output_dir, f"{rom_name}.nes.ram.nl")
			with open(ram_path, 'w', encoding='utf-8') as f:
				f.write("; RAM Labels\n")
				for label in sorted(ram_labels, key=lambda l: l.address):
					f.write(f"${label.address:04X}#{label.name}#{label.comment}\n")
			result['ram'] = len(ram_labels)

		# ROM labels by bank
		rom_labels = [l for l in labels if not l.is_ram]
		by_bank: Dict[int, List[UnifiedLabel]] = {}
		for label in rom_labels:
			bank = max(0, label.bank)
			if bank not in by_bank:
				by_bank[bank] = []
			by_bank[bank].append(label)

		for bank, bank_labels in by_bank.items():
			bank_path = os.path.join(output_dir, f"{rom_name}.nes.{bank}.nl")
			with open(bank_path, 'w', encoding='utf-8') as f:
				f.write(f"; Bank {bank} Labels\n")
				for label in sorted(bank_labels, key=lambda l: l.address):
					f.write(f"${label.address:04X}#{label.name}#{label.comment}\n")
			result['rom'] += len(bank_labels)

		return result

	@staticmethod
	def write_json(labels: LabelSet, filepath: str) -> int:
		"""Write labels to JSON format"""
		data = {
			'source': labels.name,
			'labels': [
				{
					'address': l.address,
					'name': l.name,
					'comment': l.comment,
					'bank': l.bank,
					'is_ram': l.is_ram
				}
				for l in sorted(labels, key=lambda l: (l.is_ram, l.bank, l.address))
			]
		}

		with open(filepath, 'w', encoding='utf-8') as f:
			json.dump(data, f, indent=2)

		return len(labels)

	@staticmethod
	def write_asm(labels: LabelSet, filepath: str) -> int:
		"""Write labels to ASM format"""
		lines = ["; Assembly Symbol Definitions", f"; Generated from: {labels.name}", ""]

		# RAM first
		ram_labels = [l for l in labels if l.is_ram]
		if ram_labels:
			lines.append("; RAM Addresses")
			for label in sorted(ram_labels, key=lambda l: l.address):
				if label.comment:
					lines.append(f"{label.name} = ${label.address:04X}  ; {label.comment}")
				else:
					lines.append(f"{label.name} = ${label.address:04X}")
			lines.append("")

		# ROM addresses
		rom_labels = [l for l in labels if not l.is_ram]
		if rom_labels:
			lines.append("; ROM Addresses")
			for label in sorted(rom_labels, key=lambda l: (l.bank, l.address)):
				if label.comment:
					lines.append(f"{label.name} = ${label.address:04X}  ; {label.comment}")
				else:
					lines.append(f"{label.name} = ${label.address:04X}")

		with open(filepath, 'w', encoding='utf-8') as f:
			f.write('\n'.join(lines) + '\n')

		return len(labels)


class LabelMerger:
	"""Merge multiple label sets"""

	def __init__(self):
		self.label_sets: List[LabelSet] = []
		self.conflicts: List[LabelConflict] = []

	def add_labels(self, labels: LabelSet) -> None:
		"""Add a label set for merging"""
		self.label_sets.append(labels)

	def merge(self, strategy: str = "first", allow_conflicts: bool = False) -> LabelSet:
		"""Merge all label sets"""
		merged = LabelSet("merged")
		self.conflicts = []

		# Group all labels by key
		by_key: Dict[str, List[UnifiedLabel]] = {}
		for label_set in self.label_sets:
			for label in label_set:
				if label.key not in by_key:
					by_key[label.key] = []
				by_key[label.key].append(label)

		# Process each key
		for key, labels in by_key.items():
			if len(labels) == 1:
				merged.add(labels[0])
			else:
				# Check if they're actually different
				names = set(l.name for l in labels)
				if len(names) == 1:
					# Same name, just merge (prefer one with comment)
					with_comment = [l for l in labels if l.comment]
					merged.add(with_comment[0] if with_comment else labels[0])
				else:
					# Conflict
					conflict = LabelConflict(key, labels)
					self.conflicts.append(conflict)

					if allow_conflicts or strategy != "manual":
						resolved = conflict.auto_resolve(strategy)
						merged.add(resolved)

		return merged

	def get_report(self) -> str:
		"""Generate a merge report"""
		lines = ["# Label Merge Report", ""]

		total = sum(len(ls) for ls in self.label_sets)
		lines.append(f"## Input Statistics")
		for ls in self.label_sets:
			lines.append(f"- {ls.name}: {len(ls)} labels")
		lines.append(f"- Total: {total} labels")
		lines.append("")

		if self.conflicts:
			lines.append(f"## Conflicts ({len(self.conflicts)})")
			for conflict in self.conflicts:
				lines.append(f"\n### {conflict.address}")
				for label in conflict.labels:
					lines.append(f"- `{label.name}` from {label.source}")
		else:
			lines.append("## Conflicts")
			lines.append("No conflicts found.")

		return '\n'.join(lines)


class LabelComparer:
	"""Compare two label sets"""

	def __init__(self, set_a: LabelSet, set_b: LabelSet):
		self.set_a = set_a
		self.set_b = set_b

	def compare(self) -> Dict:
		"""Compare the two sets"""
		keys_a = self.set_a.keys()
		keys_b = self.set_b.keys()

		only_a = keys_a - keys_b
		only_b = keys_b - keys_a
		common = keys_a & keys_b

		# Check for name differences in common keys
		different = []
		for key in common:
			label_a = self.set_a.get(key)
			label_b = self.set_b.get(key)
			if label_a and label_b and label_a.name != label_b.name:
				different.append({
					'key': key,
					'name_a': label_a.name,
					'name_b': label_b.name
				})

		return {
			'only_a': only_a,
			'only_b': only_b,
			'common': common,
			'different': different,
			'count_a': len(self.set_a),
			'count_b': len(self.set_b),
		}

	def get_report(self) -> str:
		"""Generate comparison report"""
		result = self.compare()

		lines = ["# Label Comparison Report", ""]

		lines.append("## Summary")
		lines.append(f"- {self.set_a.name}: {result['count_a']} labels")
		lines.append(f"- {self.set_b.name}: {result['count_b']} labels")
		lines.append(f"- Common addresses: {len(result['common'])}")
		lines.append(f"- Different names at same address: {len(result['different'])}")
		lines.append("")

		if result['only_a']:
			lines.append(f"## Only in {self.set_a.name} ({len(result['only_a'])})")
			for key in sorted(result['only_a']):
				label = self.set_a.get(key)
				if label:
					lines.append(f"- {key}: `{label.name}`")
			lines.append("")

		if result['only_b']:
			lines.append(f"## Only in {self.set_b.name} ({len(result['only_b'])})")
			for key in sorted(result['only_b']):
				label = self.set_b.get(key)
				if label:
					lines.append(f"- {key}: `{label.name}`")
			lines.append("")

		if result['different']:
			lines.append("## Different Names")
			for diff in result['different']:
				lines.append(f"- {diff['key']}: `{diff['name_a']}` vs `{diff['name_b']}`")

		return '\n'.join(lines)


def main():
	parser = argparse.ArgumentParser(
		description='Label Merge Utility',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Merge command
	merge_parser = subparsers.add_parser('merge', help='Merge label files')
	merge_parser.add_argument('files', nargs='+', help='Label files to merge')
	merge_parser.add_argument('--output', '-o', required=True, help='Output file')
	merge_parser.add_argument('--format', '-f', choices=['mlb', 'nl', 'json', 'asm'],
							  help='Output format (default: auto-detect from extension)')
	merge_parser.add_argument('--strategy', '-s', 
							  choices=['first', 'longest', 'shortest', 'most_info'],
							  default='most_info', help='Conflict resolution strategy')
	merge_parser.add_argument('--report', help='Generate merge report to file')
	merge_parser.add_argument('--rom-name', help='ROM name for NL export')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Compare label files')
	compare_parser.add_argument('file_a', help='First label file')
	compare_parser.add_argument('file_b', help='Second label file')
	compare_parser.add_argument('--report', '-r', help='Save report to file')

	# Sync command
	sync_parser = subparsers.add_parser('sync', help='Synchronize labels to multiple formats')
	sync_parser.add_argument('source', help='Source label file')
	sync_parser.add_argument('--to-mlb', help='Output MLB file')
	sync_parser.add_argument('--to-nl', help='Output NL directory')
	sync_parser.add_argument('--to-json', help='Output JSON file')
	sync_parser.add_argument('--to-asm', help='Output ASM file')
	sync_parser.add_argument('--rom-name', help='ROM name for NL export')

	# Convert command
	convert_parser = subparsers.add_parser('convert', help='Convert between formats')
	convert_parser.add_argument('input', help='Input label file')
	convert_parser.add_argument('--output', '-o', required=True, help='Output file')
	convert_parser.add_argument('--format', '-f', 
								choices=['mlb', 'nl', 'json', 'asm'],
								required=True, help='Output format')
	convert_parser.add_argument('--rom-name', help='ROM name for NL export')

	args = parser.parse_args()

	if args.command == 'merge':
		# Load all label files
		merger = LabelMerger()
		for filepath in args.files:
			labels = LabelParser.parse(filepath)
			merger.add_labels(labels)
			print(f"Loaded {len(labels)} labels from {filepath}")

		# Merge
		merged = merger.merge(strategy=args.strategy)
		print(f"Merged to {len(merged)} labels")

		if merger.conflicts:
			print(f"Resolved {len(merger.conflicts)} conflicts using '{args.strategy}' strategy")

		# Determine output format
		output_format = args.format
		if not output_format:
			ext = os.path.splitext(args.output)[1].lower()
			format_map = {'.mlb': 'mlb', '.nl': 'nl', '.json': 'json', '.asm': 'asm'}
			output_format = format_map.get(ext, 'mlb')

		# Write output
		if output_format == 'mlb':
			LabelWriter.write_mlb(merged, args.output)
		elif output_format == 'nl':
			rom_name = args.rom_name or 'rom'
			LabelWriter.write_nl(merged, args.output, rom_name)
		elif output_format == 'json':
			LabelWriter.write_json(merged, args.output)
		elif output_format == 'asm':
			LabelWriter.write_asm(merged, args.output)

		print(f"Saved to {args.output}")

		# Generate report
		if args.report:
			report = merger.get_report()
			with open(args.report, 'w', encoding='utf-8') as f:
				f.write(report)
			print(f"Report saved to {args.report}")

	elif args.command == 'compare':
		# Load both files
		set_a = LabelParser.parse(args.file_a)
		set_b = LabelParser.parse(args.file_b)

		print(f"Loaded {len(set_a)} labels from {args.file_a}")
		print(f"Loaded {len(set_b)} labels from {args.file_b}")

		# Compare
		comparer = LabelComparer(set_a, set_b)
		result = comparer.compare()

		print(f"\nCommon addresses: {len(result['common'])}")
		print(f"Only in {args.file_a}: {len(result['only_a'])}")
		print(f"Only in {args.file_b}: {len(result['only_b'])}")
		print(f"Different names: {len(result['different'])}")

		# Save report
		if args.report:
			report = comparer.get_report()
			with open(args.report, 'w', encoding='utf-8') as f:
				f.write(report)
			print(f"\nReport saved to {args.report}")

	elif args.command == 'sync':
		# Load source
		labels = LabelParser.parse(args.source)
		print(f"Loaded {len(labels)} labels from {args.source}")

		# Export to all specified formats
		if args.to_mlb:
			LabelWriter.write_mlb(labels, args.to_mlb)
			print(f"Exported MLB to {args.to_mlb}")

		if args.to_nl:
			rom_name = args.rom_name or 'rom'
			result = LabelWriter.write_nl(labels, args.to_nl, rom_name)
			print(f"Exported NL to {args.to_nl} ({result['ram']} RAM, {result['rom']} ROM)")

		if args.to_json:
			LabelWriter.write_json(labels, args.to_json)
			print(f"Exported JSON to {args.to_json}")

		if args.to_asm:
			LabelWriter.write_asm(labels, args.to_asm)
			print(f"Exported ASM to {args.to_asm}")

	elif args.command == 'convert':
		# Load input
		labels = LabelParser.parse(args.input)
		print(f"Loaded {len(labels)} labels from {args.input}")

		# Convert
		if args.format == 'mlb':
			LabelWriter.write_mlb(labels, args.output)
		elif args.format == 'nl':
			rom_name = args.rom_name or os.path.splitext(os.path.basename(args.input))[0]
			output_dir = os.path.dirname(args.output) or '.'
			LabelWriter.write_nl(labels, output_dir, rom_name)
		elif args.format == 'json':
			LabelWriter.write_json(labels, args.output)
		elif args.format == 'asm':
			LabelWriter.write_asm(labels, args.output)

		print(f"Converted to {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
