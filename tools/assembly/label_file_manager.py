#!/usr/bin/env python3
"""
Label File Manager - Manage debug labels across multiple formats

Converts between label file formats:
- FCEUX .nl (NES)
- Mesen .mlb (NES/SNES)
- No$gba .sym (GBA)
- WLAB .sym (various)
- Custom JSON format

Features:
- Merge multiple label files
- Filter by address range
- Export to wiki format
- Validate addresses
- Auto-generate labels from patterns
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional


class LabelType(Enum):
	"""Label types"""
	CODE = "code"
	DATA = "data"
	SUBROUTINE = "sub"
	VARIABLE = "var"
	CONSTANT = "const"
	POINTER = "ptr"
	TABLE = "table"
	TEXT = "text"
	UNKNOWN = "unknown"


@dataclass
class Label:
	"""Single label entry"""
	address: int
	name: str
	label_type: LabelType = LabelType.UNKNOWN
	comment: str = ""
	bank: Optional[int] = None
	size: Optional[int] = None
	source_file: str = ""


@dataclass
class LabelDatabase:
	"""Collection of labels"""
	labels: dict = field(default_factory=dict)  # address -> Label
	name: str = ""
	platform: str = ""  # nes, snes, gba, etc.

	def add_label(self, label: Label):
		"""Add a label, handling duplicates"""
		self.labels[label.address] = label

	def get_label(self, address: int) -> Optional[Label]:
		"""Get label by address"""
		return self.labels.get(address)

	def get_labels_in_range(self, start: int, end: int) -> list:
		"""Get all labels in address range"""
		return [l for l in self.labels.values() if start <= l.address <= end]


class FCEUXParser:
	"""Parse FCEUX .nl label files"""

	def parse_file(self, filepath: str) -> LabelDatabase:
		"""Parse FCEUX .nl file"""
		db = LabelDatabase(name=os.path.basename(filepath), platform='nes')

		# Determine bank from filename (e.g., game.nes.0.nl for bank 0)
		bank = None
		match = re.search(r'\.(\d+)\.nl$', filepath)
		if match:
			bank = int(match.group(1))

		with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith('#'):
					continue

				# Format: $XXXX#name#comment
				match = re.match(r'\$([0-9A-Fa-f]+)#([^#]*)(?:#(.*))?', line)
				if match:
					address = int(match.group(1), 16)
					name = match.group(2).strip()
					comment = match.group(3).strip() if match.group(3) else ""

					if name:
						label = Label(
							address=address,
							name=name,
							comment=comment,
							bank=bank,
							source_file=filepath
						)
						db.add_label(label)

		return db

	def export_file(self, db: LabelDatabase, filepath: str, bank: int = None):
		"""Export to FCEUX .nl format"""
		with open(filepath, 'w', encoding='utf-8') as f:
			for addr in sorted(db.labels.keys()):
				label = db.labels[addr]
				if bank is not None and label.bank is not None and label.bank != bank:
					continue

				line = f"${addr:04x}#{label.name}"
				if label.comment:
					line += f"#{label.comment}"
				f.write(line + "\n")


class MesenParser:
	"""Parse Mesen .mlb label files"""

	def parse_file(self, filepath: str) -> LabelDatabase:
		"""Parse Mesen .mlb file"""
		db = LabelDatabase(name=os.path.basename(filepath), platform='nes')

		with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith('#'):
					continue

				# Format varies by memory type
				# P:XXXX:name:comment - PRG
				# R:XXXX:name:comment - RAM
				# G:XXXX:name:comment - Register
				parts = line.split(':')
				if len(parts) >= 3:
					mem_type = parts[0]
					try:
						address = int(parts[1], 16)
					except ValueError:
						continue

					name = parts[2].strip()
					comment = parts[3].strip() if len(parts) > 3 else ""

					# Determine label type from prefix
					label_type = LabelType.UNKNOWN
					if mem_type == 'P':
						label_type = LabelType.CODE
					elif mem_type == 'R':
						label_type = LabelType.VARIABLE
					elif mem_type == 'G':
						label_type = LabelType.CONSTANT

					if name:
						label = Label(
							address=address,
							name=name,
							label_type=label_type,
							comment=comment,
							source_file=filepath
						)
						db.add_label(label)

		return db

	def export_file(self, db: LabelDatabase, filepath: str):
		"""Export to Mesen .mlb format"""
		with open(filepath, 'w', encoding='utf-8') as f:
			for addr in sorted(db.labels.keys()):
				label = db.labels[addr]

				# Determine memory type prefix
				if label.label_type == LabelType.VARIABLE:
					prefix = 'R'
				elif label.label_type == LabelType.CONSTANT:
					prefix = 'G'
				else:
					prefix = 'P'

				line = f"{prefix}:{addr:04x}:{label.name}"
				if label.comment:
					line += f":{label.comment}"
				f.write(line + "\n")


class NoGBAParser:
	"""Parse No$gba .sym files"""

	def parse_file(self, filepath: str) -> LabelDatabase:
		"""Parse No$gba .sym file"""
		db = LabelDatabase(name=os.path.basename(filepath), platform='gba')

		with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				# Format: XXXXXXXX name
				match = re.match(r'([0-9A-Fa-f]{8})\s+(\S+)', line)
				if match:
					address = int(match.group(1), 16)
					name = match.group(2)

					label = Label(
						address=address,
						name=name,
						source_file=filepath
					)
					db.add_label(label)

		return db

	def export_file(self, db: LabelDatabase, filepath: str):
		"""Export to No$gba .sym format"""
		with open(filepath, 'w', encoding='utf-8') as f:
			for addr in sorted(db.labels.keys()):
				label = db.labels[addr]
				f.write(f"{addr:08x} {label.name}\n")


class WLABParser:
	"""Parse WLAB .sym files"""

	def parse_file(self, filepath: str) -> LabelDatabase:
		"""Parse WLAB .sym file"""
		db = LabelDatabase(name=os.path.basename(filepath))

		with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
			current_section = None

			for line in f:
				line = line.strip()

				# Section headers
				if line.startswith('[') and line.endswith(']'):
					current_section = line[1:-1].lower()
					continue

				if not line:
					continue

				# Format: XX:XXXX name
				match = re.match(r'([0-9A-Fa-f]{2}):([0-9A-Fa-f]{4})\s+(\S+)', line)
				if match:
					bank = int(match.group(1), 16)
					address = int(match.group(2), 16)
					name = match.group(3)

					# Calculate full address
					full_addr = (bank << 16) | address

					label = Label(
						address=full_addr,
						name=name,
						bank=bank,
						source_file=filepath
					)
					db.add_label(label)
				else:
					# Try format without bank: XXXX name
					match = re.match(r'([0-9A-Fa-f]{4})\s+(\S+)', line)
					if match:
						address = int(match.group(1), 16)
						name = match.group(2)

						label = Label(
							address=address,
							name=name,
							source_file=filepath
						)
						db.add_label(label)

		return db


class JSONParser:
	"""Parse JSON label files"""

	def parse_file(self, filepath: str) -> LabelDatabase:
		"""Parse JSON label file"""
		with open(filepath, 'r', encoding='utf-8') as f:
			data = json.load(f)

		db = LabelDatabase(
			name=data.get('name', os.path.basename(filepath)),
			platform=data.get('platform', '')
		)

		for item in data.get('labels', []):
			address = item.get('address', 0)
			if isinstance(address, str):
				address = int(address.replace('0x', '').replace('$', ''), 16)

			label = Label(
				address=address,
				name=item.get('name', ''),
				label_type=LabelType(item.get('type', 'unknown')),
				comment=item.get('comment', ''),
				bank=item.get('bank'),
				size=item.get('size'),
				source_file=filepath
			)
			db.add_label(label)

		return db

	def export_file(self, db: LabelDatabase, filepath: str):
		"""Export to JSON format"""
		data = {
			'name': db.name,
			'platform': db.platform,
			'labels': []
		}

		for addr in sorted(db.labels.keys()):
			label = db.labels[addr]
			entry = {
				'address': f"${addr:04x}" if addr < 0x10000 else f"${addr:06x}",
				'name': label.name,
				'type': label.label_type.value
			}
			if label.comment:
				entry['comment'] = label.comment
			if label.bank is not None:
				entry['bank'] = label.bank
			if label.size:
				entry['size'] = label.size

			data['labels'].append(entry)

		with open(filepath, 'w', encoding='utf-8') as f:
			json.dump(data, f, indent=2)


class WikiExporter:
	"""Export labels to wiki format"""

	def export_rom_map(self, db: LabelDatabase, game_name: str) -> str:
		"""Export as ROM map wikitext"""
		lines = []
		lines.append(f"{{{{game|title={game_name}}}}}")
		lines.append("")
		lines.append("== ROM Map ==")
		lines.append("")
		lines.append("{{rommap|")

		for addr in sorted(db.labels.keys()):
			label = db.labels[addr]
			if label.label_type in (LabelType.CODE, LabelType.SUBROUTINE, LabelType.TABLE):
				addr_str = f"${addr:04x}" if addr < 0x10000 else f"${addr:06x}"
				desc = label.name
				if label.comment:
					desc += f" - {label.comment}"
				lines.append(f"  | {addr_str} | {desc}")

		lines.append("}}")
		return "\n".join(lines)

	def export_ram_map(self, db: LabelDatabase, game_name: str) -> str:
		"""Export as RAM map wikitext"""
		lines = []
		lines.append(f"{{{{game|title={game_name}}}}}")
		lines.append("")
		lines.append("== RAM Map ==")
		lines.append("")
		lines.append("{{rammap|")

		for addr in sorted(db.labels.keys()):
			label = db.labels[addr]
			if label.label_type in (LabelType.VARIABLE, LabelType.DATA):
				addr_str = f"${addr:04x}" if addr < 0x10000 else f"${addr:06x}"
				desc = label.name
				if label.comment:
					desc += f" - {label.comment}"
				lines.append(f"  | {addr_str} | {desc}")

		lines.append("}}")
		return "\n".join(lines)


class LabelMerger:
	"""Merge multiple label databases"""

	def merge(self, databases: list, conflict_resolution: str = 'first') -> LabelDatabase:
		"""Merge multiple databases into one"""
		result = LabelDatabase()

		for db in databases:
			for addr, label in db.labels.items():
				if addr in result.labels:
					if conflict_resolution == 'first':
						continue  # Keep first
					elif conflict_resolution == 'last':
						result.add_label(label)  # Overwrite
					elif conflict_resolution == 'combine':
						# Combine comments
						existing = result.labels[addr]
						if label.comment and label.comment != existing.comment:
							existing.comment = f"{existing.comment}; {label.comment}"
				else:
					result.add_label(label)

		return result


def detect_format(filepath: str) -> str:
	"""Auto-detect label file format"""
	ext = os.path.splitext(filepath)[1].lower()

	if ext == '.nl':
		return 'fceux'
	elif ext == '.mlb':
		return 'mesen'
	elif ext == '.sym':
		# Could be No$gba or WLAB - check content
		with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
			first_line = f.readline().strip()
			if re.match(r'[0-9A-Fa-f]{8}\s+\S', first_line):
				return 'nogba'
			elif re.match(r'\[', first_line) or re.match(r'[0-9A-Fa-f]{2}:', first_line):
				return 'wlab'
		return 'wlab'
	elif ext == '.json':
		return 'json'

	return 'unknown'


def get_parser(format_type: str):
	"""Get parser for format"""
	parsers = {
		'fceux': FCEUXParser(),
		'mesen': MesenParser(),
		'nogba': NoGBAParser(),
		'wlab': WLABParser(),
		'json': JSONParser(),
	}
	return parsers.get(format_type)


def main():
	parser = argparse.ArgumentParser(
		description='Manage and convert debug label files'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Convert command
	convert_parser = subparsers.add_parser('convert', help='Convert between formats')
	convert_parser.add_argument('input', help='Input file')
	convert_parser.add_argument('-o', '--output', required=True, help='Output file')
	convert_parser.add_argument('--from', dest='from_format',
							   choices=['fceux', 'mesen', 'nogba', 'wlab', 'json', 'auto'],
							   default='auto', help='Input format')
	convert_parser.add_argument('--to', dest='to_format',
							   choices=['fceux', 'mesen', 'nogba', 'json', 'wiki-rom', 'wiki-ram'],
							   required=True, help='Output format')
	convert_parser.add_argument('--game', help='Game name (for wiki export)')

	# Merge command
	merge_parser = subparsers.add_parser('merge', help='Merge label files')
	merge_parser.add_argument('inputs', nargs='+', help='Input files')
	merge_parser.add_argument('-o', '--output', required=True, help='Output file')
	merge_parser.add_argument('--format', choices=['json', 'fceux', 'mesen'],
							default='json', help='Output format')
	merge_parser.add_argument('--conflict', choices=['first', 'last', 'combine'],
							default='first', help='Conflict resolution')

	# Filter command
	filter_parser = subparsers.add_parser('filter', help='Filter labels')
	filter_parser.add_argument('input', help='Input file')
	filter_parser.add_argument('-o', '--output', required=True, help='Output file')
	filter_parser.add_argument('--start', type=lambda x: int(x, 0),
							 help='Start address')
	filter_parser.add_argument('--end', type=lambda x: int(x, 0),
							 help='End address')
	filter_parser.add_argument('--type', choices=[t.value for t in LabelType],
							 help='Filter by type')
	filter_parser.add_argument('--format', default='json', help='Output format')

	# Info command
	info_parser = subparsers.add_parser('info', help='Show label file info')
	info_parser.add_argument('input', help='Input file')

	# Search command
	search_parser = subparsers.add_parser('search', help='Search labels')
	search_parser.add_argument('input', help='Input file')
	search_parser.add_argument('pattern', help='Search pattern (regex)')
	search_parser.add_argument('--case-insensitive', '-i', action='store_true')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	if args.command == 'convert':
		# Detect input format
		from_format = args.from_format
		if from_format == 'auto':
			from_format = detect_format(args.input)

		# Parse
		parser_obj = get_parser(from_format)
		if not parser_obj:
			print(f"Unknown input format: {from_format}")
			return

		db = parser_obj.parse_file(args.input)
		print(f"Loaded {len(db.labels)} labels from {args.input}")

		# Export
		if args.to_format in ('wiki-rom', 'wiki-ram'):
			exporter = WikiExporter()
			game_name = args.game or "Game"
			if args.to_format == 'wiki-rom':
				output = exporter.export_rom_map(db, game_name)
			else:
				output = exporter.export_ram_map(db, game_name)
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(output)
		else:
			exporter = get_parser(args.to_format)
			exporter.export_file(db, args.output)

		print(f"Exported to {args.output}")

	elif args.command == 'merge':
		databases = []
		for input_file in args.inputs:
			format_type = detect_format(input_file)
			parser_obj = get_parser(format_type)
			if parser_obj:
				db = parser_obj.parse_file(input_file)
				databases.append(db)
				print(f"Loaded {len(db.labels)} labels from {input_file}")

		merger = LabelMerger()
		result = merger.merge(databases, args.conflict)

		exporter = get_parser(args.format)
		exporter.export_file(result, args.output)

		print(f"Merged {len(result.labels)} labels to {args.output}")

	elif args.command == 'filter':
		format_type = detect_format(args.input)
		parser_obj = get_parser(format_type)
		db = parser_obj.parse_file(args.input)

		# Filter
		filtered = LabelDatabase(name=db.name, platform=db.platform)
		for addr, label in db.labels.items():
			# Address range filter
			if args.start and addr < args.start:
				continue
			if args.end and addr > args.end:
				continue
			# Type filter
			if args.type and label.label_type.value != args.type:
				continue
			filtered.add_label(label)

		exporter = get_parser(args.format)
		exporter.export_file(filtered, args.output)

		print(f"Filtered to {len(filtered.labels)} labels")

	elif args.command == 'info':
		format_type = detect_format(args.input)
		parser_obj = get_parser(format_type)
		db = parser_obj.parse_file(args.input)

		print(f"Label File: {args.input}")
		print(f"Format: {format_type}")
		print(f"Total labels: {len(db.labels)}")

		# Count by type
		type_counts = {}
		for label in db.labels.values():
			t = label.label_type.value
			type_counts[t] = type_counts.get(t, 0) + 1

		print("\nBy type:")
		for t, count in sorted(type_counts.items()):
			print(f"  {t}: {count}")

		# Address range
		if db.labels:
			addrs = list(db.labels.keys())
			print(f"\nAddress range: ${min(addrs):06x} - ${max(addrs):06x}")

	elif args.command == 'search':
		format_type = detect_format(args.input)
		parser_obj = get_parser(format_type)
		db = parser_obj.parse_file(args.input)

		flags = re.IGNORECASE if args.case_insensitive else 0
		pattern = re.compile(args.pattern, flags)

		matches = []
		for addr, label in db.labels.items():
			if pattern.search(label.name) or (label.comment and pattern.search(label.comment)):
				matches.append(label)

		print(f"Found {len(matches)} matches:")
		for label in sorted(matches, key=lambda x: x.address):
			addr_str = f"${label.address:06x}" if label.address >= 0x10000 else f"${label.address:04x}"
			print(f"  {addr_str} {label.name}")
			if label.comment:
				print(f"           ; {label.comment}")


if __name__ == '__main__':
	main()
