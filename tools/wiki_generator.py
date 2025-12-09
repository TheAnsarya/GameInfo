#!/usr/bin/env python3
"""
Wiki Generator - Generate Data Crystal wikitext from analyzed ROM data.

Generates:
- ROM maps from analysis
- RAM maps from memory analysis
- Data structure documentation
- Value tables
- TBL files

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


@dataclass
class WikiSection:
	"""A section in a wiki document."""
	title: str
	level: int
	content: List[str]
	subsections: List["WikiSection"] = field(default_factory=list)

	def render(self) -> str:
		lines = []
		prefix = "=" * (self.level + 1)
		lines.append(f"{prefix}{self.title}{prefix}")
		lines.extend(self.content)
		lines.append("")
		for sub in self.subsections:
			lines.append(sub.render())
		return "\n".join(lines)


class WikiGenerator:
	"""Generate Data Crystal wikitext documentation."""

	def __init__(self, game_name: str):
		self.game_name = game_name

	def generate_rom_map(
		self,
		rom_data: Dict,
		include_header: bool = True,
	) -> str:
		"""Generate a ROM map wikitext document."""
		lines = []

		if include_header:
			lines.append(f"{{{{rommap|game={self.game_name}}}}}")
			lines.append("")
			lines.append(f"This is the ROM map for ''{self.game_name}''.")
			lines.append("")

		# ROM header section
		if "header" in rom_data:
			lines.extend(self._generate_header_section(rom_data["header"]))

		# Bank layout
		if "banks" in rom_data:
			lines.extend(self._generate_bank_section(rom_data["banks"]))

		# Data tables
		if "tables" in rom_data:
			for table in rom_data["tables"]:
				lines.extend(self._generate_table_section(table))

		# See also
		lines.extend([
			"==See Also==",
			f"* [[{self.game_name}:RAM map|RAM Map]]",
			f"* [[{self.game_name}:TBL|Text Table]]",
			"",
			f"[[Category:{self.game_name}|ROM map]]",
		])

		return "\n".join(lines)

	def generate_ram_map(
		self,
		ram_data: Dict,
		include_header: bool = True,
	) -> str:
		"""Generate a RAM map wikitext document."""
		lines = []

		if include_header:
			lines.append(f"{{{{rammap|game={self.game_name}}}}}")
			lines.append("")
			lines.append(f"This is the RAM map for ''{self.game_name}''.")
			lines.append("")

		# Memory regions
		if "regions" in ram_data:
			for region in ram_data["regions"]:
				lines.extend(self._generate_memory_region(region))

		# See also
		lines.extend([
			"==See Also==",
			f"* [[{self.game_name}:ROM map|ROM Map]]",
			f"* [[{self.game_name}:SRAM map|SRAM Map]]",
			"",
			f"[[Category:{self.game_name}|RAM map]]",
		])

		return "\n".join(lines)

	def generate_tbl_file(
		self,
		encoding_data: Dict,
		include_header: bool = True,
	) -> str:
		"""Generate a TBL wikitext document."""
		lines = []

		if include_header:
			lines.append(f"{{{{tbl|game={self.game_name}}}}}")
			lines.append("")
			lines.append(
				f"This is the text table (TBL) file for ''{self.game_name}''. "
				"It defines the mapping between ROM byte values and displayed characters."
			)
			lines.append("")

		# Standard characters
		if "characters" in encoding_data:
			lines.extend(self._generate_character_table(encoding_data["characters"]))

		# Control codes
		if "control_codes" in encoding_data:
			lines.extend(self._generate_control_codes(encoding_data["control_codes"]))

		# DTE
		if "dte" in encoding_data:
			lines.extend(self._generate_dte_table(encoding_data["dte"]))

		# Raw TBL format
		if include_header:
			lines.extend(self._generate_raw_tbl(encoding_data))

		# See also
		lines.extend([
			"==See Also==",
			f"* [[{self.game_name}:ROM map|ROM Map]]",
			f"* [[{self.game_name}:RAM map|RAM Map]]",
			"",
			f"[[Category:{self.game_name}|TBL]]",
		])

		return "\n".join(lines)

	def generate_values_table(
		self,
		values_data: Dict,
		title: str = "Values",
	) -> str:
		"""Generate a values wikitext document."""
		lines = [
			f"{{{{values|game={self.game_name}}}}}",
			"",
			f"This page lists data values for ''{self.game_name}''.",
			"",
		]

		for category, items in values_data.items():
			lines.append(f"=={category}==")
			lines.append('{| class="wikitable sortable"')
			lines.append("! ID !! Name !! Description")

			for item in items:
				lines.append("|-")
				item_id = item.get("id", "")
				if isinstance(item_id, int):
					item_id = f"${item_id:02x}"
				name = item.get("name", "")
				desc = item.get("description", "")
				lines.append(f"| {item_id} || {name} || {desc}")

			lines.append("|}")
			lines.append("")

		lines.append(f"[[Category:{self.game_name}|Values]]")
		return "\n".join(lines)

	def _generate_header_section(self, header: Dict) -> List[str]:
		"""Generate ROM header section."""
		lines = [
			"==ROM Header==",
			'{| class="wikitable"',
			"! Offset !! Size !! Description",
		]

		for entry in header.get("entries", []):
			offset = entry.get("offset", 0)
			size = entry.get("size", 1)
			desc = entry.get("description", "")

			if isinstance(offset, int):
				offset = f"${offset:02x}"

			lines.append("|-")
			lines.append(f"| {offset} || {size} || {desc}")

		lines.append("|}")
		lines.append("")
		return lines

	def _generate_bank_section(self, banks: List[Dict]) -> List[str]:
		"""Generate bank layout section."""
		lines = [
			"==Bank Layout==",
			'{| class="wikitable"',
			"! Bank !! File Offset !! CPU Address !! Description",
		]

		for bank in banks:
			bank_num = bank.get("number", 0)
			file_offset = bank.get("file_offset", 0)
			cpu_addr = bank.get("cpu_address", "")
			desc = bank.get("description", "")

			if isinstance(bank_num, int):
				bank_num = f"{bank_num:02d}"
			if isinstance(file_offset, int):
				file_offset = f"${file_offset:05x}"
			if isinstance(cpu_addr, int):
				cpu_addr = f"${cpu_addr:04x}"

			lines.append("|-")
			lines.append(f"| {bank_num} || {file_offset} || {cpu_addr} || {desc}")

		lines.append("|}")
		lines.append("")
		return lines

	def _generate_table_section(self, table: Dict) -> List[str]:
		"""Generate a data table section."""
		lines = [
			f"=={table.get('name', 'Data Table')}==",
		]

		if "description" in table:
			lines.append(table["description"])
			lines.append("")

		# Main table
		if "entries" in table:
			lines.append('{| class="wikitable sortable"')
			lines.append("! Offset !! End !! Size !! Description")

			for entry in table["entries"]:
				offset = entry.get("offset", 0)
				end = entry.get("end", offset)
				size = entry.get("size", end - offset) if isinstance(offset, int) and isinstance(end, int) else ""
				desc = entry.get("description", "")

				if isinstance(offset, int):
					offset = f"${offset:05x}"
				if isinstance(end, int):
					end = f"${end:05x}"
				if isinstance(size, int) and size > 0:
					size = f"${size:x}" if size >= 16 else str(size)

				lines.append("|-")
				lines.append(f"| {offset} || {end} || {size} || {desc}")

			lines.append("|}")

		# Structure definition
		if "structure" in table:
			lines.append("")
			lines.append(f"'''{table.get('name', 'Entry')} Structure''' "
						f"({table.get('entry_size', '?')} bytes per entry):")
			lines.append('{| class="wikitable"')
			lines.append("! Offset !! Size !! Description")

			for field in table["structure"]:
				offset = field.get("offset", 0)
				size = field.get("size", 1)
				desc = field.get("description", "")

				if isinstance(offset, int):
					offset = f"+${offset:02x}"

				lines.append("|-")
				lines.append(f"| {offset} || {size} || {desc}")

			lines.append("|}")

		lines.append("")
		return lines

	def _generate_memory_region(self, region: Dict) -> List[str]:
		"""Generate a memory region section."""
		name = region.get("name", "Memory Region")
		start = region.get("start", 0)
		end = region.get("end", start)

		if isinstance(start, int):
			start = f"${start:04x}"
		if isinstance(end, int):
			end = f"${end:04x}"

		lines = [
			f"=={name} ({start}-{end})==",
			'{| class="wikitable sortable"',
			"! Address !! Size !! Description",
		]

		for entry in region.get("entries", []):
			addr = entry.get("address", 0)
			size = entry.get("size", 1)
			desc = entry.get("description", "")

			if isinstance(addr, int):
				addr = f"${addr:04x}"

			lines.append("|-")
			lines.append(f"| {addr} || {size} || {desc}")

		lines.append("|}")
		lines.append("")
		return lines

	def _generate_character_table(self, characters: Dict) -> List[str]:
		"""Generate character mapping table."""
		lines = [
			"==Standard Characters==",
			'{| class="wikitable"',
			"! Hex !! Char !! Hex !! Char !! Hex !! Char !! Hex !! Char",
		]

		# Sort by hex value
		sorted_chars = sorted(
			[(int(k.replace("$", ""), 16), v) for k, v in characters.items()]
		)

		# Generate rows of 4 columns
		row = []
		for hex_val, char in sorted_chars:
			row.append(f"${hex_val:02x}")
			row.append(char if char else "(space)")

			if len(row) == 8:
				lines.append("|-")
				lines.append("| " + " || ".join(row))
				row = []

		# Finish partial row
		if row:
			while len(row) < 8:
				row.extend(["", ""])
			lines.append("|-")
			lines.append("| " + " || ".join(row))

		lines.append("|}")
		lines.append("")
		return lines

	def _generate_control_codes(self, codes: Dict) -> List[str]:
		"""Generate control codes table."""
		lines = [
			"==Control Codes==",
			'{| class="wikitable"',
			"! Hex !! Name !! Description",
		]

		sorted_codes = sorted(
			[(int(k.replace("$", ""), 16), v) for k, v in codes.items()]
		)

		for hex_val, info in sorted_codes:
			if isinstance(info, dict):
				name = info.get("name", "")
				desc = info.get("description", "")
			else:
				name = info
				desc = ""

			lines.append("|-")
			lines.append(f"| ${hex_val:02x} || {name} || {desc}")

		lines.append("|}")
		lines.append("")
		return lines

	def _generate_dte_table(self, dte: Dict) -> List[str]:
		"""Generate DTE table."""
		lines = [
			"==DTE (Dual-Tile Encoding)==",
			'{| class="wikitable"',
			"! Hex !! DTE !! Hex !! DTE !! Hex !! DTE !! Hex !! DTE",
		]

		sorted_dte = sorted(
			[(int(k.replace("$", ""), 16), v) for k, v in dte.items()]
		)

		row = []
		for hex_val, chars in sorted_dte:
			row.append(f"${hex_val:02x}")
			row.append(chars)

			if len(row) == 8:
				lines.append("|-")
				lines.append("| " + " || ".join(row))
				row = []

		if row:
			while len(row) < 8:
				row.extend(["", ""])
			lines.append("|-")
			lines.append("| " + " || ".join(row))

		lines.append("|}")
		lines.append("")
		return lines

	def _generate_raw_tbl(self, encoding: Dict) -> List[str]:
		"""Generate raw TBL file format."""
		lines = [
			"==TBL File Format==",
			"<pre>",
		]

		# Standard characters
		for hex_str, char in sorted(encoding.get("characters", {}).items()):
			val = hex_str.replace("$", "").upper()
			lines.append(f"{val}={char}")

		# Control codes
		for hex_str, info in sorted(encoding.get("control_codes", {}).items()):
			val = hex_str.replace("$", "").upper()
			if isinstance(info, dict):
				name = info.get("name", "")
			else:
				name = info
			lines.append(f"{val}={name}")

		# DTE
		for hex_str, chars in sorted(encoding.get("dte", {}).items()):
			val = hex_str.replace("$", "").upper()
			lines.append(f"{val}={chars}")

		lines.append("</pre>")
		lines.append("")
		return lines


def main():
	parser = argparse.ArgumentParser(
		description="Wiki Generator - Generate Data Crystal wikitext"
	)
	parser.add_argument(
		"input",
		type=Path,
		help="Input JSON file with data",
	)
	parser.add_argument(
		"-o", "--output",
		type=Path,
		help="Output file (default: stdout)",
	)
	parser.add_argument(
		"-g", "--game",
		required=True,
		help="Game name for wiki templates",
	)
	parser.add_argument(
		"-t", "--type",
		choices=["rom-map", "ram-map", "tbl", "values"],
		required=True,
		help="Type of wiki document to generate",
	)
	parser.add_argument(
		"--no-header",
		action="store_true",
		help="Skip wiki template header",
	)

	args = parser.parse_args()

	# Load input data
	with open(args.input, "r", encoding="utf-8") as f:
		data = json.load(f)

	generator = WikiGenerator(args.game)

	# Generate document
	if args.type == "rom-map":
		output = generator.generate_rom_map(data, not args.no_header)
	elif args.type == "ram-map":
		output = generator.generate_ram_map(data, not args.no_header)
	elif args.type == "tbl":
		output = generator.generate_tbl_file(data, not args.no_header)
	elif args.type == "values":
		output = generator.generate_values_table(data)
	else:
		print(f"Unknown type: {args.type}", file=sys.stderr)
		sys.exit(1)

	# Output
	if args.output:
		with open(args.output, "w", encoding="utf-8") as f:
			f.write(output)
		print(f"Generated {args.output}")
	else:
		print(output)


if __name__ == "__main__":
	main()
