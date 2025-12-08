#!/usr/bin/env python3
"""
Label Format Converter

Convert between various emulator and tool label file formats.
Supports MLB (Mesen), NL (FCEUX), SYM, DBG, and custom formats.
"""

import argparse
import json
import re
from pathlib import Path
from typing import Dict, List, Optional, Tuple


class Label:
	"""Represents a single label/symbol."""

	def __init__(
		self,
		name: str,
		address: int,
		bank: int = -1,
		label_type: str = "code",
		comment: str = ""
	):
		self.name = name
		self.address = address
		self.bank = bank
		self.label_type = label_type  # code, data, ram, io, comment
		self.comment = comment
		self.length = 1  # For data labels

	def __repr__(self):
		if self.bank >= 0:
			return f"Label({self.name}, ${self.address:04X}, bank={self.bank})"
		return f"Label({self.name}, ${self.address:04X})"


class LabelDatabase:
	"""Database of labels from various sources."""

	def __init__(self):
		self.labels: List[Label] = []
		self.comments: Dict[int, str] = {}  # Address -> comment
		self.metadata: Dict[str, str] = {}

	def add_label(self, label: Label):
		"""Add a label to the database."""
		self.labels.append(label)

	def add_comment(self, address: int, comment: str):
		"""Add a standalone comment."""
		self.comments[address] = comment

	def get_by_address(self, address: int, bank: int = -1) -> Optional[Label]:
		"""Get label by address."""
		for label in self.labels:
			if label.address == address:
				if bank < 0 or label.bank < 0 or label.bank == bank:
					return label
		return None

	def get_by_name(self, name: str) -> Optional[Label]:
		"""Get label by name."""
		for label in self.labels:
			if label.name == name:
				return label
		return None

	def sort(self):
		"""Sort labels by bank and address."""
		self.labels.sort(key=lambda l: (l.bank if l.bank >= 0 else 0xFFFF, l.address))


class LabelConverter:
	"""Convert between label file formats."""

	def __init__(self):
		self.db = LabelDatabase()

	def load_mlb(self, path: str):
		"""
		Load Mesen Label file (.mlb).

		Format: TYPE:BANK:ADDRESS:LABEL or TYPE:ADDRESS:LABEL
		Types: R (RAM), G (register), P (PRG ROM), W (work RAM)
		"""
		content = Path(path).read_text(encoding='utf-8')

		for line in content.splitlines():
			line = line.strip()
			if not line or line.startswith('#') or line.startswith(';'):
				continue

			# Handle comments after the label
			comment = ""
			if ':' in line:
				# Check for comment at end
				parts = line.split(':')
				if len(parts) >= 4:
					# May have comment
					pass

			parts = line.split(':')
			if len(parts) >= 3:
				label_type_char = parts[0]

				if len(parts) == 4:
					# TYPE:BANK:ADDRESS:LABEL
					try:
						bank = int(parts[1], 16)
						address = int(parts[2], 16)
						name = parts[3]
					except ValueError:
						continue
				else:
					# TYPE:ADDRESS:LABEL
					bank = -1
					try:
						address = int(parts[1], 16)
						name = parts[2]
					except ValueError:
						continue

				# Determine type
				type_map = {
					'P': 'code',
					'R': 'ram',
					'G': 'io',
					'W': 'ram',
					'S': 'data',
				}
				label_type = type_map.get(label_type_char, 'code')

				label = Label(name, address, bank, label_type)
				self.db.add_label(label)

	def save_mlb(self, path: str):
		"""Save as Mesen Label file (.mlb)."""
		lines = []

		self.db.sort()

		for label in self.db.labels:
			# Determine type character
			type_map = {
				'code': 'P',
				'data': 'S',
				'ram': 'R',
				'io': 'G',
			}
			type_char = type_map.get(label.label_type, 'P')

			if label.bank >= 0:
				lines.append(f"{type_char}:{label.bank:X}:{label.address:04X}:{label.name}")
			else:
				lines.append(f"{type_char}:{label.address:04X}:{label.name}")

		Path(path).write_text('\n'.join(lines), encoding='utf-8')

	def load_nl(self, path: str):
		"""
		Load FCEUX Name List file (.nl).

		Format: $ADDRESS#LABEL#COMMENT
		Bank-specific files are named: romname.bank.nl
		"""
		content = Path(path).read_text(encoding='utf-8')

		# Try to determine bank from filename
		bank = -1
		match = re.search(r'\.(\d+)\.nl$', path, re.IGNORECASE)
		if match:
			bank = int(match.group(1))

		for line in content.splitlines():
			line = line.strip()
			if not line or line.startswith(';'):
				continue

			# Parse $ADDRESS#LABEL#COMMENT format
			if line.startswith('$'):
				parts = line[1:].split('#')
				if len(parts) >= 2:
					try:
						address = int(parts[0], 16)
						name = parts[1]
						comment = parts[2] if len(parts) > 2 else ""

						label = Label(name, address, bank, "code", comment)
						self.db.add_label(label)
					except ValueError:
						continue

	def save_nl(self, path: str, bank: int = -1):
		"""Save as FCEUX Name List file (.nl)."""
		lines = []

		self.db.sort()

		for label in self.db.labels:
			# Skip labels not in requested bank
			if bank >= 0 and label.bank >= 0 and label.bank != bank:
				continue

			line = f"${label.address:04X}#{label.name}"
			if label.comment:
				line += f"#{label.comment}"
			lines.append(line)

		Path(path).write_text('\n'.join(lines), encoding='utf-8')

	def load_sym(self, path: str):
		"""
		Load SYM file (various formats).

		Common formats:
		- BANK:ADDRESS LABEL
		- ADDRESS LABEL
		- LABEL = $ADDRESS
		"""
		content = Path(path).read_text(encoding='utf-8')

		for line in content.splitlines():
			line = line.strip()
			if not line or line.startswith(';') or line.startswith('#'):
				continue

			# Try different formats

			# Format: BANK:ADDRESS LABEL
			match = re.match(r'([0-9A-Fa-f]+):([0-9A-Fa-f]+)\s+(\w+)', line)
			if match:
				bank = int(match.group(1), 16)
				address = int(match.group(2), 16)
				name = match.group(3)
				self.db.add_label(Label(name, address, bank))
				continue

			# Format: ADDRESS LABEL
			match = re.match(r'\$?([0-9A-Fa-f]+)\s+(\w+)', line)
			if match:
				address = int(match.group(1), 16)
				name = match.group(2)
				self.db.add_label(Label(name, address))
				continue

			# Format: LABEL = $ADDRESS
			match = re.match(r'(\w+)\s*=\s*\$?([0-9A-Fa-f]+)', line)
			if match:
				name = match.group(1)
				address = int(match.group(2), 16)
				self.db.add_label(Label(name, address))
				continue

	def save_sym(self, path: str, format_style: str = "bank_addr"):
		"""Save as SYM file."""
		lines = []

		self.db.sort()

		for label in self.db.labels:
			if format_style == "bank_addr" and label.bank >= 0:
				lines.append(f"{label.bank:02X}:{label.address:04X} {label.name}")
			elif format_style == "addr_label":
				lines.append(f"${label.address:04X} {label.name}")
			elif format_style == "label_eq":
				lines.append(f"{label.name} = ${label.address:04X}")
			else:
				if label.bank >= 0:
					lines.append(f"{label.bank:02X}:{label.address:04X} {label.name}")
				else:
					lines.append(f"${label.address:04X} {label.name}")

		Path(path).write_text('\n'.join(lines), encoding='utf-8')

	def load_ca65_dbg(self, path: str):
		"""
		Load ca65 debug file (.dbg).

		Complex format with multiple sections.
		"""
		content = Path(path).read_text(encoding='utf-8')

		# Parse symbol lines
		for line in content.splitlines():
			if line.startswith('sym'):
				# Parse: sym id=X,name="NAME",addrsize=X,scope=X,def=X,val=X,type=lab
				match = re.search(r'name="([^"]+)".*val=0x([0-9A-Fa-f]+)', line)
				if match:
					name = match.group(1)
					address = int(match.group(2), 16)

					# Try to get segment/bank info
					bank = -1
					seg_match = re.search(r'seg=(\d+)', line)
					if seg_match:
						# Would need segment table to map to bank
						pass

					self.db.add_label(Label(name, address, bank))

	def load_wla_sym(self, path: str):
		"""
		Load WLA-DX symbol file.

		Format:
		[labels]
		BANK:ADDRESS LABEL
		"""
		content = Path(path).read_text(encoding='utf-8')
		in_labels = False

		for line in content.splitlines():
			line = line.strip()

			if line == '[labels]':
				in_labels = True
				continue
			elif line.startswith('['):
				in_labels = False
				continue

			if in_labels and line:
				match = re.match(r'([0-9A-Fa-f]+):([0-9A-Fa-f]+)\s+(.+)', line)
				if match:
					bank = int(match.group(1), 16)
					address = int(match.group(2), 16)
					name = match.group(3)
					self.db.add_label(Label(name, address, bank))

	def save_wla_sym(self, path: str):
		"""Save as WLA-DX symbol file."""
		lines = ["[labels]"]

		self.db.sort()

		for label in self.db.labels:
			bank = label.bank if label.bank >= 0 else 0
			lines.append(f"{bank:02X}:{label.address:04X} {label.name}")

		Path(path).write_text('\n'.join(lines), encoding='utf-8')

	def load_json(self, path: str):
		"""Load labels from JSON file."""
		data = json.loads(Path(path).read_text(encoding='utf-8'))

		for entry in data.get("labels", []):
			label = Label(
				entry["name"],
				entry["address"],
				entry.get("bank", -1),
				entry.get("type", "code"),
				entry.get("comment", "")
			)
			self.db.add_label(label)

		self.db.metadata = data.get("metadata", {})

	def save_json(self, path: str):
		"""Save labels to JSON file."""
		data = {
			"metadata": self.db.metadata,
			"labels": []
		}

		self.db.sort()

		for label in self.db.labels:
			entry = {
				"name": label.name,
				"address": label.address,
			}
			if label.bank >= 0:
				entry["bank"] = label.bank
			if label.label_type != "code":
				entry["type"] = label.label_type
			if label.comment:
				entry["comment"] = label.comment

			data["labels"].append(entry)

		Path(path).write_text(
			json.dumps(data, indent='\t'),
			encoding='utf-8'
		)

	def load_asm_equates(self, path: str):
		"""Load labels from assembly equate definitions."""
		content = Path(path).read_text(encoding='utf-8')

		for line in content.splitlines():
			line = line.strip()
			if not line or line.startswith(';'):
				continue

			# Format: LABEL = $ADDRESS or LABEL EQU $ADDRESS
			match = re.match(
				r'(\w+)\s*(?:=|\.?[Ee][Qq][Uu])\s*\$?([0-9A-Fa-f]+)',
				line
			)
			if match:
				name = match.group(1)
				address = int(match.group(2), 16)
				self.db.add_label(Label(name, address))

	def save_asm_equates(self, path: str, syntax: str = "ca65"):
		"""Save labels as assembly equate definitions."""
		lines = ["; Auto-generated label definitions", ""]

		self.db.sort()

		# Group by address range
		current_section = None

		for label in self.db.labels:
			# Determine section
			if label.address < 0x2000:
				section = "Zero Page / RAM"
			elif label.address < 0x4000:
				section = "PPU Registers"
			elif label.address < 0x4020:
				section = "APU / IO Registers"
			elif label.address < 0x8000:
				section = "Cartridge Space"
			else:
				section = "PRG ROM"

			if section != current_section:
				lines.append(f"\n; === {section} ===")
				current_section = section

			if syntax == "ca65":
				lines.append(f"{label.name} = ${label.address:04X}")
			elif syntax == "asm6":
				lines.append(f"{label.name} = ${label.address:04X}")
			elif syntax == "nesasm":
				lines.append(f"{label.name} .equ ${label.address:04X}")

		Path(path).write_text('\n'.join(lines), encoding='utf-8')

	def auto_detect_format(self, path: str) -> str:
		"""Auto-detect label file format."""
		content = Path(path).read_text(encoding='utf-8')
		filename = Path(path).name.lower()

		# Check extension
		if filename.endswith('.mlb'):
			return 'mlb'
		if filename.endswith('.nl'):
			return 'nl'
		if filename.endswith('.sym'):
			# Could be WLA or generic
			if '[labels]' in content:
				return 'wla_sym'
			return 'sym'
		if filename.endswith('.dbg'):
			return 'ca65_dbg'
		if filename.endswith('.json'):
			return 'json'

		# Check content patterns
		if re.search(r'^[PRGWS]:[0-9A-Fa-f]+:', content, re.MULTILINE):
			return 'mlb'
		if re.search(r'^\$[0-9A-Fa-f]+#', content, re.MULTILINE):
			return 'nl'
		if re.search(r'^\[labels\]', content, re.MULTILINE):
			return 'wla_sym'
		if re.search(r'^sym\s+id=', content, re.MULTILINE):
			return 'ca65_dbg'

		return 'sym'  # Default

	def load(self, path: str, format_type: str = None):
		"""Load labels from file."""
		if format_type is None:
			format_type = self.auto_detect_format(path)

		loaders = {
			'mlb': self.load_mlb,
			'nl': self.load_nl,
			'sym': self.load_sym,
			'wla_sym': self.load_wla_sym,
			'ca65_dbg': self.load_ca65_dbg,
			'json': self.load_json,
			'asm': self.load_asm_equates,
		}

		loader = loaders.get(format_type)
		if loader:
			loader(path)
		else:
			raise ValueError(f"Unknown format: {format_type}")

	def save(self, path: str, format_type: str):
		"""Save labels to file."""
		savers = {
			'mlb': self.save_mlb,
			'nl': self.save_nl,
			'sym': self.save_sym,
			'wla_sym': self.save_wla_sym,
			'json': self.save_json,
			'asm': self.save_asm_equates,
		}

		saver = savers.get(format_type)
		if saver:
			saver(path)
		else:
			raise ValueError(f"Unknown format: {format_type}")

	def get_stats(self) -> dict:
		"""Get statistics about loaded labels."""
		types = {}
		banks = set()

		for label in self.db.labels:
			types[label.label_type] = types.get(label.label_type, 0) + 1
			if label.bank >= 0:
				banks.add(label.bank)

		return {
			"total_labels": len(self.db.labels),
			"label_types": types,
			"banks": sorted(banks),
			"comments": len(self.db.comments),
		}


def main():
	parser = argparse.ArgumentParser(description="Label Format Converter")
	parser.add_argument("input", help="Input label file")
	parser.add_argument("-o", "--output", required=True, help="Output label file")
	parser.add_argument("-f", "--from-format",
		choices=['mlb', 'nl', 'sym', 'wla_sym', 'ca65_dbg', 'json', 'asm'],
		help="Input format (auto-detected if not specified)")
	parser.add_argument("-t", "--to-format", required=True,
		choices=['mlb', 'nl', 'sym', 'wla_sym', 'json', 'asm'],
		help="Output format")
	parser.add_argument("--merge", nargs='+',
		help="Additional files to merge")
	parser.add_argument("--info", action="store_true",
		help="Show label statistics")
	parser.add_argument("--filter-bank", type=int,
		help="Only include labels from specific bank")
	parser.add_argument("--filter-type",
		help="Only include labels of specific type")

	args = parser.parse_args()

	converter = LabelConverter()

	# Load main file
	converter.load(args.input, args.from_format)
	print(f"Loaded {len(converter.db.labels)} labels from {args.input}")

	# Merge additional files
	if args.merge:
		for merge_file in args.merge:
			merge_converter = LabelConverter()
			merge_converter.load(merge_file)
			print(f"Merging {len(merge_converter.db.labels)} labels from {merge_file}")
			converter.db.labels.extend(merge_converter.db.labels)

	# Apply filters
	if args.filter_bank is not None:
		converter.db.labels = [
			l for l in converter.db.labels
			if l.bank < 0 or l.bank == args.filter_bank
		]
		print(f"Filtered to {len(converter.db.labels)} labels in bank {args.filter_bank}")

	if args.filter_type:
		converter.db.labels = [
			l for l in converter.db.labels
			if l.label_type == args.filter_type
		]
		print(f"Filtered to {len(converter.db.labels)} {args.filter_type} labels")

	# Show stats
	if args.info:
		stats = converter.get_stats()
		print(f"\nLabel Statistics:")
		print(f"  Total: {stats['total_labels']}")
		print(f"  Types: {stats['label_types']}")
		if stats['banks']:
			print(f"  Banks: {stats['banks']}")

	# Save
	converter.save(args.output, args.to_format)
	print(f"Saved {len(converter.db.labels)} labels to {args.output}")


if __name__ == "__main__":
	main()
