#!/usr/bin/env python3
"""
Wikitext Generator - Generate Data Crystal wiki markup from analysis data

Creates properly formatted wikitext files for:
- ROM maps
- RAM maps
- Text tables (TBL)
- Notes pages
- Format documentation

Converts structured data (JSON, CSV, ASM comments) into wiki markup.
"""

import argparse
import csv
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional


class WikiSection(Enum):
	"""Wiki page section types"""
	ROM_MAP = "rommap"
	RAM_MAP = "rammap"
	TBL = "tbl"
	NOTES = "notes"
	FORMAT = "format"


@dataclass
class MemoryEntry:
	"""Single memory map entry"""
	address: int
	end_address: Optional[int] = None
	size: Optional[int] = None
	description: str = ""
	type_info: str = ""  # byte, word, pointer, etc.
	notes: str = ""


@dataclass
class TableEntry:
	"""Text table (TBL) entry"""
	hex_value: int
	character: str
	notes: str = ""
	is_control: bool = False


@dataclass
class WikiPage:
	"""Complete wiki page structure"""
	title: str
	game_name: str
	section_type: WikiSection
	entries: list = field(default_factory=list)
	header_notes: str = ""
	footer_notes: str = ""


class JSONParser:
	"""Parse JSON data files into wiki entries"""

	def parse_rom_map(self, json_path: str) -> list:
		"""Parse ROM map from JSON"""
		with open(json_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		entries = []

		# Handle various JSON formats
		if isinstance(data, list):
			for item in data:
				entry = self._parse_entry(item)
				if entry:
					entries.append(entry)
		elif isinstance(data, dict):
			if 'entries' in data:
				for item in data['entries']:
					entry = self._parse_entry(item)
					if entry:
						entries.append(entry)
			elif 'banks' in data:
				for bank in data['banks']:
					for item in bank.get('entries', []):
						entry = self._parse_entry(item)
						if entry:
							entries.append(entry)

		return entries

	def parse_ram_map(self, json_path: str) -> list:
		"""Parse RAM map from JSON"""
		return self.parse_rom_map(json_path)  # Same format

	def parse_tbl(self, json_path: str) -> list:
		"""Parse text table from JSON"""
		with open(json_path, 'r', encoding='utf-8') as f:
			data = json.load(f)

		entries = []

		if isinstance(data, dict):
			for hex_str, char in data.items():
				try:
					hex_val = int(hex_str.replace('0x', '').replace('$', ''), 16)
					entries.append(TableEntry(
						hex_value=hex_val,
						character=char,
						is_control=len(char) > 1 or char.startswith('[')
					))
				except ValueError:
					continue
		elif isinstance(data, list):
			for item in data:
				if isinstance(item, dict):
					hex_val = item.get('hex', item.get('value', 0))
					if isinstance(hex_val, str):
						hex_val = int(hex_val.replace('0x', '').replace('$', ''), 16)
					entries.append(TableEntry(
						hex_value=hex_val,
						character=item.get('char', item.get('character', '')),
						notes=item.get('notes', ''),
						is_control=item.get('control', False)
					))

		return sorted(entries, key=lambda x: x.hex_value)

	def _parse_entry(self, item: dict) -> Optional[MemoryEntry]:
		"""Parse a single entry from JSON"""
		if not item:
			return None

		# Handle various address field names
		address = (item.get('address') or item.get('addr') or
				  item.get('offset') or item.get('start'))

		if address is None:
			return None

		if isinstance(address, str):
			address = int(address.replace('0x', '').replace('$', ''), 16)

		end_addr = item.get('end_address') or item.get('end') or item.get('endAddress')
		if isinstance(end_addr, str):
			end_addr = int(end_addr.replace('0x', '').replace('$', ''), 16)

		size = item.get('size') or item.get('length')

		return MemoryEntry(
			address=address,
			end_address=end_addr,
			size=size,
			description=item.get('description', item.get('desc', item.get('name', ''))),
			type_info=item.get('type', ''),
			notes=item.get('notes', '')
		)


class ASMParser:
	"""Parse assembly files for annotated data"""

	# Common comment patterns
	COMMENT_PATTERNS = [
		r';\s*([0-9A-Fa-f]{4,6}):\s*(.+)',  # ; ADDR: description
		r';\s*\$([0-9A-Fa-f]{4,6})\s*[-=]\s*(.+)',  # ; $ADDR - description
	]

	def parse_file(self, asm_path: str) -> list:
		"""Parse assembly file for memory map entries"""
		entries = []

		with open(asm_path, 'r', encoding='utf-8', errors='replace') as f:
			for line in f:
				entry = self._parse_line(line)
				if entry:
					entries.append(entry)

		return entries

	def _parse_line(self, line: str) -> Optional[MemoryEntry]:
		"""Parse a single line for memory map info"""
		for pattern in self.COMMENT_PATTERNS:
			match = re.search(pattern, line)
			if match:
				addr = int(match.group(1), 16)
				desc = match.group(2).strip()
				return MemoryEntry(address=addr, description=desc)

		# Check for labeled data
		label_match = re.match(r'^([a-zA-Z_][a-zA-Z0-9_]*):\s*;?\s*(.*)', line)
		if label_match:
			label = label_match.group(1)
			comment = label_match.group(2).strip()
			# Need to determine address from context - simplified here
			return MemoryEntry(address=0, description=f"{label}: {comment}")

		return None


class TBLParser:
	"""Parse traditional TBL format files"""

	def parse_file(self, tbl_path: str) -> list:
		"""Parse TBL file"""
		entries = []

		with open(tbl_path, 'r', encoding='utf-8', errors='replace') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(('#', '//', ';')):
					continue

				# Standard TBL format: HH=C
				match = re.match(r'([0-9A-Fa-f]{2,4})=(.+)', line)
				if match:
					hex_val = int(match.group(1), 16)
					char = match.group(2)
					entries.append(TableEntry(
						hex_value=hex_val,
						character=char,
						is_control=char.startswith('<') or char.startswith('[')
					))

		return sorted(entries, key=lambda x: x.hex_value)


class WikitextGenerator:
	"""Generate wikitext markup from parsed data"""

	def __init__(self, game_name: str):
		self.game_name = game_name

	def generate_rom_map(self, entries: list, bank_info: dict = None) -> str:
		"""Generate ROM map wikitext"""
		lines = []

		# Header
		lines.append(f"{{{{game|title={self.game_name}}}}}")
		lines.append("")
		lines.append("== ROM Map ==")
		lines.append("")
		lines.append("{{rommap|")

		# Sort by address
		entries = sorted(entries, key=lambda x: x.address)

		# Group by bank if bank_info provided
		current_bank = None

		for entry in entries:
			# Format address
			if entry.address >= 0x10000:
				addr_str = f"${entry.address:06x}"
			else:
				addr_str = f"${entry.address:04x}"

			# End address
			end_str = ""
			if entry.end_address:
				if entry.end_address >= 0x10000:
					end_str = f" - ${entry.end_address:06x}"
				else:
					end_str = f" - ${entry.end_address:04x}"

			# Size
			size_str = ""
			if entry.size:
				size_str = f" ({entry.size} bytes)"

			# Type
			type_str = f" [{entry.type_info}]" if entry.type_info else ""

			# Escape wiki characters
			desc = self._escape_wiki(entry.description)
			notes = self._escape_wiki(entry.notes)

			# Build row
			row = f"  | {addr_str}{end_str}{size_str}{type_str} | {desc}"
			if notes:
				row += f" <!-- {notes} -->"

			lines.append(row)

		lines.append("}}")
		lines.append("")

		# Categories
		lines.append(f"[[Category:{self.game_name}]]")
		lines.append("[[Category:ROM Maps]]")

		return "\n".join(lines)

	def generate_ram_map(self, entries: list) -> str:
		"""Generate RAM map wikitext"""
		lines = []

		# Header
		lines.append(f"{{{{game|title={self.game_name}}}}}")
		lines.append("")
		lines.append("== RAM Map ==")
		lines.append("")
		lines.append("{{rammap|")

		# Sort by address
		entries = sorted(entries, key=lambda x: x.address)

		for entry in entries:
			# Format address
			if entry.address >= 0x10000:
				addr_str = f"${entry.address:06x}"
			else:
				addr_str = f"${entry.address:04x}"

			# End address
			end_str = ""
			if entry.end_address:
				if entry.end_address >= 0x10000:
					end_str = f" - ${entry.end_address:06x}"
				else:
					end_str = f" - ${entry.end_address:04x}"

			# Size info
			size_str = ""
			if entry.size:
				if entry.size == 1:
					size_str = " (byte)"
				elif entry.size == 2:
					size_str = " (word)"
				elif entry.size == 4:
					size_str = " (long)"
				else:
					size_str = f" ({entry.size} bytes)"

			# Type
			type_str = f" [{entry.type_info}]" if entry.type_info else ""

			desc = self._escape_wiki(entry.description)
			lines.append(f"  | {addr_str}{end_str}{size_str}{type_str} | {desc}")

		lines.append("}}")
		lines.append("")

		lines.append(f"[[Category:{self.game_name}]]")
		lines.append("[[Category:RAM Maps]]")

		return "\n".join(lines)

	def generate_tbl(self, entries: list) -> str:
		"""Generate text table wikitext"""
		lines = []

		# Header
		lines.append(f"{{{{game|title={self.game_name}}}}}")
		lines.append("")
		lines.append("== Text Table ==")
		lines.append("")
		lines.append("This is the text encoding table for the game.")
		lines.append("")

		# Main table
		lines.append("{{tbl|")

		# Standard characters
		lines.append("  ; Standard Characters")
		for entry in entries:
			if not entry.is_control:
				char_display = self._escape_wiki(entry.character)
				lines.append(f"  | ${entry.hex_value:02x} | {char_display}")

		# Control codes
		control_entries = [e for e in entries if e.is_control]
		if control_entries:
			lines.append("")
			lines.append("  ; Control Codes")
			for entry in control_entries:
				char_display = self._escape_wiki(entry.character)
				lines.append(f"  | ${entry.hex_value:02x} | {char_display}")

		lines.append("}}")
		lines.append("")

		# TBL format section
		lines.append("=== TBL File Format ===")
		lines.append("<pre>")
		for entry in entries:
			lines.append(f"{entry.hex_value:02X}={entry.character}")
		lines.append("</pre>")
		lines.append("")

		lines.append(f"[[Category:{self.game_name}]]")
		lines.append("[[Category:Text Tables]]")

		return "\n".join(lines)

	def generate_notes_page(self, title: str, content: str) -> str:
		"""Generate notes page wikitext"""
		lines = []

		lines.append(f"{{{{game|title={self.game_name}}}}}")
		lines.append("")
		lines.append(f"== {title} ==")
		lines.append("")
		lines.append(content)
		lines.append("")
		lines.append(f"[[Category:{self.game_name}]]")
		lines.append("[[Category:Notes]]")

		return "\n".join(lines)

	def _escape_wiki(self, text: str) -> str:
		"""Escape wiki markup characters"""
		if not text:
			return ""
		# Escape pipe characters in templates
		text = text.replace('|', '&#124;')
		# Escape brackets
		text = text.replace('[', '&#91;')
		text = text.replace(']', '&#93;')
		return text


class CSVParser:
	"""Parse CSV files into wiki entries"""

	def parse_file(self, csv_path: str, address_col: str = 'address',
				  desc_col: str = 'description') -> list:
		"""Parse CSV file"""
		entries = []

		with open(csv_path, 'r', encoding='utf-8', newline='') as f:
			reader = csv.DictReader(f)

			for row in reader:
				address_str = row.get(address_col, '')
				if not address_str:
					continue

				# Parse address
				address_str = address_str.strip().replace('0x', '').replace('$', '')
				try:
					address = int(address_str, 16)
				except ValueError:
					continue

				entry = MemoryEntry(
					address=address,
					description=row.get(desc_col, row.get('desc', row.get('name', ''))),
					type_info=row.get('type', ''),
					size=int(row.get('size', 0)) if row.get('size') else None,
					notes=row.get('notes', '')
				)
				entries.append(entry)

		return entries


def main():
	parser = argparse.ArgumentParser(
		description='Generate Data Crystal wikitext from data files'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# ROM map
	rom_parser = subparsers.add_parser('rommap', help='Generate ROM map')
	rom_parser.add_argument('input', help='Input file (JSON, CSV, or ASM)')
	rom_parser.add_argument('--game', required=True, help='Game name')
	rom_parser.add_argument('-o', '--output', help='Output file')

	# RAM map
	ram_parser = subparsers.add_parser('rammap', help='Generate RAM map')
	ram_parser.add_argument('input', help='Input file (JSON, CSV, or ASM)')
	ram_parser.add_argument('--game', required=True, help='Game name')
	ram_parser.add_argument('-o', '--output', help='Output file')

	# TBL
	tbl_parser = subparsers.add_parser('tbl', help='Generate text table')
	tbl_parser.add_argument('input', help='Input file (JSON or TBL)')
	tbl_parser.add_argument('--game', required=True, help='Game name')
	tbl_parser.add_argument('-o', '--output', help='Output file')

	# Notes
	notes_parser = subparsers.add_parser('notes', help='Generate notes page')
	notes_parser.add_argument('input', help='Input text/markdown file')
	notes_parser.add_argument('--game', required=True, help='Game name')
	notes_parser.add_argument('--title', default='Notes', help='Page title')
	notes_parser.add_argument('-o', '--output', help='Output file')

	# Convert
	convert_parser = subparsers.add_parser('convert', help='Convert between formats')
	convert_parser.add_argument('input', help='Input file')
	convert_parser.add_argument('output', help='Output file')
	convert_parser.add_argument('--type', choices=['rommap', 'rammap', 'tbl'],
							  required=True, help='Data type')
	convert_parser.add_argument('--game', required=True, help='Game name')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	generator = WikitextGenerator(args.game)

	# Determine input format
	input_ext = os.path.splitext(args.input)[1].lower()

	if args.command in ('rommap', 'rammap'):
		# Parse input
		if input_ext == '.json':
			parser_obj = JSONParser()
			entries = parser_obj.parse_rom_map(args.input)
		elif input_ext == '.csv':
			parser_obj = CSVParser()
			entries = parser_obj.parse_file(args.input)
		elif input_ext == '.asm':
			parser_obj = ASMParser()
			entries = parser_obj.parse_file(args.input)
		else:
			print(f"Unsupported input format: {input_ext}")
			return

		# Generate wikitext
		if args.command == 'rommap':
			output = generator.generate_rom_map(entries)
		else:
			output = generator.generate_ram_map(entries)

	elif args.command == 'tbl':
		if input_ext == '.json':
			parser_obj = JSONParser()
			entries = parser_obj.parse_tbl(args.input)
		elif input_ext == '.tbl':
			parser_obj = TBLParser()
			entries = parser_obj.parse_file(args.input)
		else:
			print(f"Unsupported input format: {input_ext}")
			return

		output = generator.generate_tbl(entries)

	elif args.command == 'notes':
		with open(args.input, 'r', encoding='utf-8') as f:
			content = f.read()
		output = generator.generate_notes_page(args.title, content)

	elif args.command == 'convert':
		# Auto-detect and convert
		if input_ext == '.json':
			parser_obj = JSONParser()
			if args.type == 'tbl':
				entries = parser_obj.parse_tbl(args.input)
			else:
				entries = parser_obj.parse_rom_map(args.input)
		elif input_ext == '.tbl':
			parser_obj = TBLParser()
			entries = parser_obj.parse_file(args.input)
		elif input_ext == '.csv':
			parser_obj = CSVParser()
			entries = parser_obj.parse_file(args.input)
		else:
			print(f"Unsupported input format: {input_ext}")
			return

		if args.type == 'rommap':
			output = generator.generate_rom_map(entries)
		elif args.type == 'rammap':
			output = generator.generate_ram_map(entries)
		else:
			output = generator.generate_tbl(entries)

	# Output
	output_path = getattr(args, 'output', None)
	if output_path:
		with open(output_path, 'w', encoding='utf-8') as f:
			f.write(output)
		print(f"Written to {output_path}")
	else:
		print(output)


if __name__ == '__main__':
	main()
