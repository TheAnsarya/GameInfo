#!/usr/bin/env python3
"""
Table Editor - Text Table (.tbl) File Editor

Create, edit, and manage text table files used for ROM translation.
Supports multiple encoding formats and special characters.
"""

import argparse
import json
import re
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple


class TextTable:
	"""Text table for character encoding/decoding."""

	def __init__(self):
		self.entries: Dict[int, str] = {}  # byte value -> character
		self.reverse: Dict[str, int] = {}  # character -> byte value
		self.multi_byte: Dict[Tuple[int, ...], str] = {}  # multi-byte sequences
		self.reverse_multi: Dict[str, Tuple[int, ...]] = {}
		self.control_codes: Dict[int, str] = {}  # special control codes
		self.comments: Dict[int, str] = {}  # comments for entries
		self.metadata: Dict[str, str] = {}  # file metadata

	def add_entry(self, value: int, char: str, comment: str = ""):
		"""Add a single-byte entry."""
		self.entries[value] = char
		self.reverse[char] = value
		if comment:
			self.comments[value] = comment

	def add_multi_byte(self, values: Tuple[int, ...], char: str, comment: str = ""):
		"""Add a multi-byte entry."""
		self.multi_byte[values] = char
		self.reverse_multi[char] = values
		if comment:
			# Use first byte as key for comment
			self.comments[values[0]] = comment

	def add_control_code(self, value: int, name: str, comment: str = ""):
		"""Add a control code entry."""
		self.control_codes[value] = name
		self.entries[value] = f"[{name}]"
		if comment:
			self.comments[value] = comment

	def get_char(self, value: int) -> Optional[str]:
		"""Get character for byte value."""
		return self.entries.get(value)

	def get_value(self, char: str) -> Optional[int]:
		"""Get byte value for character."""
		return self.reverse.get(char)

	def decode_bytes(self, data: bytes) -> str:
		"""Decode bytes to string using table."""
		result = []
		i = 0
		while i < len(data):
			# Try multi-byte sequences first (longest match)
			found = False
			for length in range(4, 0, -1):  # Try 4, 3, 2, 1 byte sequences
				if i + length <= len(data):
					seq = tuple(data[i:i + length])
					if seq in self.multi_byte:
						result.append(self.multi_byte[seq])
						i += length
						found = True
						break

			if not found:
				byte_val = data[i]
				if byte_val in self.entries:
					result.append(self.entries[byte_val])
				else:
					result.append(f"[{byte_val:02X}]")
				i += 1

		return "".join(result)

	def encode_string(self, text: str) -> bytes:
		"""Encode string to bytes using table."""
		result = []
		i = 0
		while i < len(text):
			found = False

			# Check for control code brackets [XX] or [NAME]
			if text[i] == "[":
				end = text.find("]", i)
				if end != -1:
					code = text[i + 1:end]
					# Try hex value
					if re.match(r'^[0-9A-Fa-f]{2}$', code):
						result.append(int(code, 16))
						i = end + 1
						found = True
					# Try control code name
					elif code in [self.control_codes[k] for k in self.control_codes]:
						for val, name in self.control_codes.items():
							if name == code:
								result.append(val)
								i = end + 1
								found = True
								break

			if not found:
				# Try multi-byte characters first
				for length in range(4, 0, -1):
					substr = text[i:i + length]
					if substr in self.reverse_multi:
						result.extend(self.reverse_multi[substr])
						i += length
						found = True
						break

			if not found:
				# Try single character
				char = text[i]
				if char in self.reverse:
					result.append(self.reverse[char])
				else:
					# Unknown character - use placeholder
					result.append(ord(char) if ord(char) < 256 else 0x3F)
				i += 1

		return bytes(result)


class TableFileParser:
	"""Parser for .tbl files."""

	def __init__(self):
		self.table = TextTable()

	def parse_file(self, filepath: Path) -> TextTable:
		"""Parse a .tbl file."""
		content = filepath.read_text(encoding="utf-8", errors="replace")
		return self.parse_content(content)

	def parse_content(self, content: str) -> TextTable:
		"""Parse .tbl file content."""
		self.table = TextTable()

		for line_num, line in enumerate(content.split("\n"), 1):
			line = line.strip()

			# Skip empty lines
			if not line:
				continue

			# Handle comments
			if line.startswith(";") or line.startswith("#") or line.startswith("//"):
				# Check for metadata comments
				if "=" in line:
					meta_match = re.match(r'[;#/]+\s*@(\w+)\s*=\s*(.+)', line)
					if meta_match:
						self.table.metadata[meta_match.group(1)] = meta_match.group(2)
				continue

			# Extract inline comment
			comment = ""
			if ";" in line:
				parts = line.split(";", 1)
				line = parts[0].strip()
				comment = parts[1].strip()

			# Parse entry
			if "=" in line:
				self._parse_entry(line, comment, line_num)

		return self.table

	def _parse_entry(self, line: str, comment: str, line_num: int):
		"""Parse a single table entry."""
		parts = line.split("=", 1)
		if len(parts) != 2:
			return

		hex_part = parts[0].strip()
		char_part = parts[1]

		# Parse hex value(s)
		try:
			if "-" in hex_part or "," in hex_part:
				# Multi-byte sequence
				if "-" in hex_part:
					bytes_list = [int(b.strip(), 16) for b in hex_part.split("-")]
				else:
					bytes_list = [int(b.strip(), 16) for b in hex_part.split(",")]
				self.table.add_multi_byte(tuple(bytes_list), char_part, comment)
			else:
				byte_val = int(hex_part, 16)

				# Check for control code (surrounded by brackets or special name)
				if char_part.startswith("[") and char_part.endswith("]"):
					code_name = char_part[1:-1]
					self.table.add_control_code(byte_val, code_name, comment)
				else:
					self.table.add_entry(byte_val, char_part, comment)
		except ValueError:
			print(f"Warning: Invalid hex value on line {line_num}: {hex_part}", file=sys.stderr)


class TableFileWriter:
	"""Writer for .tbl files."""

	def __init__(self, table: TextTable):
		self.table = table

	def write_file(self, filepath: Path, format_type: str = "standard"):
		"""Write table to file."""
		content = self.generate_content(format_type)
		filepath.write_text(content, encoding="utf-8")

	def generate_content(self, format_type: str = "standard") -> str:
		"""Generate .tbl file content."""
		lines = []

		# Add header
		lines.append("; Text Table File")
		lines.append("; Generated by Table Editor")
		lines.append("")

		# Add metadata
		if self.table.metadata:
			lines.append("; Metadata")
			for key, value in self.table.metadata.items():
				lines.append(f"; @{key}={value}")
			lines.append("")

		# Group entries by range
		if format_type == "grouped":
			lines.extend(self._generate_grouped())
		else:
			lines.extend(self._generate_standard())

		return "\n".join(lines)

	def _generate_standard(self) -> List[str]:
		"""Generate standard format output."""
		lines = []

		# Single-byte entries
		sorted_entries = sorted(self.table.entries.items())
		for value, char in sorted_entries:
			comment = self.table.comments.get(value, "")
			if char.startswith("[") and char.endswith("]"):
				# Control code
				line = f"{value:02X}={char}"
			else:
				line = f"{value:02X}={char}"

			if comment:
				line += f"\t; {comment}"
			lines.append(line)

		# Multi-byte entries
		if self.table.multi_byte:
			lines.append("")
			lines.append("; Multi-byte sequences")
			for values, char in sorted(self.table.multi_byte.items()):
				hex_str = "-".join(f"{v:02X}" for v in values)
				lines.append(f"{hex_str}={char}")

		return lines

	def _generate_grouped(self) -> List[str]:
		"""Generate grouped format output."""
		lines = []

		# Group by type
		control_codes = []
		numbers = []
		uppercase = []
		lowercase = []
		symbols = []
		other = []

		for value, char in sorted(self.table.entries.items()):
			if char.startswith("["):
				control_codes.append((value, char))
			elif char.isdigit():
				numbers.append((value, char))
			elif char.isupper() and char.isalpha():
				uppercase.append((value, char))
			elif char.islower() and char.isalpha():
				lowercase.append((value, char))
			elif char in "!@#$%^&*()_+-=[]{}|;':\",./<>?`~ ":
				symbols.append((value, char))
			else:
				other.append((value, char))

		# Output groups
		groups = [
			("Control Codes", control_codes),
			("Numbers", numbers),
			("Uppercase Letters", uppercase),
			("Lowercase Letters", lowercase),
			("Symbols", symbols),
			("Other Characters", other),
		]

		for name, entries in groups:
			if entries:
				lines.append(f"; {name}")
				for value, char in entries:
					comment = self.table.comments.get(value, "")
					line = f"{value:02X}={char}"
					if comment:
						line += f"\t; {comment}"
					lines.append(line)
				lines.append("")

		return lines


def generate_ascii_table() -> TextTable:
	"""Generate a standard ASCII table."""
	table = TextTable()

	# Control codes
	table.add_control_code(0x00, "END", "End of string")
	table.add_control_code(0x01, "NL", "New line")
	table.add_control_code(0x02, "WAIT", "Wait for input")

	# Numbers
	for i, char in enumerate("0123456789"):
		table.add_entry(0x30 + i, char)

	# Uppercase letters
	for i, char in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):
		table.add_entry(0x41 + i, char)

	# Lowercase letters
	for i, char in enumerate("abcdefghijklmnopqrstuvwxyz"):
		table.add_entry(0x61 + i, char)

	# Common symbols
	table.add_entry(0x20, " ", "Space")
	table.add_entry(0x21, "!")
	table.add_entry(0x22, '"')
	table.add_entry(0x27, "'")
	table.add_entry(0x28, "(")
	table.add_entry(0x29, ")")
	table.add_entry(0x2C, ",")
	table.add_entry(0x2D, "-")
	table.add_entry(0x2E, ".")
	table.add_entry(0x2F, "/")
	table.add_entry(0x3A, ":")
	table.add_entry(0x3B, ";")
	table.add_entry(0x3F, "?")

	return table


def generate_japanese_table() -> TextTable:
	"""Generate a basic Japanese hiragana table."""
	table = TextTable()

	# Hiragana (example mapping)
	hiragana = "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん"
	for i, char in enumerate(hiragana):
		table.add_entry(0x20 + i, char)

	return table


def convert_table_format(
	input_path: Path,
	output_path: Path,
	output_format: str = "standard",
):
	"""Convert between table formats."""
	parser = TableFileParser()
	table = parser.parse_file(input_path)

	writer = TableFileWriter(table)
	writer.write_file(output_path, output_format)


def merge_tables(tables: List[TextTable]) -> TextTable:
	"""Merge multiple tables into one."""
	merged = TextTable()

	for table in tables:
		# Merge single-byte entries
		merged.entries.update(table.entries)
		merged.reverse.update(table.reverse)

		# Merge multi-byte entries
		merged.multi_byte.update(table.multi_byte)
		merged.reverse_multi.update(table.reverse_multi)

		# Merge control codes
		merged.control_codes.update(table.control_codes)

		# Merge comments
		merged.comments.update(table.comments)

		# Merge metadata
		merged.metadata.update(table.metadata)

	return merged


def export_to_json(table: TextTable) -> str:
	"""Export table to JSON format."""
	data = {
		"entries": {f"{k:02X}": v for k, v in table.entries.items()},
		"multi_byte": {
			"-".join(f"{b:02X}" for b in k): v
			for k, v in table.multi_byte.items()
		},
		"control_codes": {f"{k:02X}": v for k, v in table.control_codes.items()},
		"comments": {f"{k:02X}": v for k, v in table.comments.items()},
		"metadata": table.metadata,
	}
	return json.dumps(data, indent="\t", ensure_ascii=False)


def import_from_json(json_str: str) -> TextTable:
	"""Import table from JSON format."""
	data = json.loads(json_str)
	table = TextTable()

	# Import entries
	for hex_str, char in data.get("entries", {}).items():
		table.entries[int(hex_str, 16)] = char
		table.reverse[char] = int(hex_str, 16)

	# Import multi-byte
	for hex_str, char in data.get("multi_byte", {}).items():
		values = tuple(int(b, 16) for b in hex_str.split("-"))
		table.multi_byte[values] = char
		table.reverse_multi[char] = values

	# Import control codes
	for hex_str, name in data.get("control_codes", {}).items():
		table.control_codes[int(hex_str, 16)] = name

	# Import comments
	for hex_str, comment in data.get("comments", {}).items():
		table.comments[int(hex_str, 16)] = comment

	# Import metadata
	table.metadata = data.get("metadata", {})

	return table


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Table Editor - Text Table File Editor",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# Parse and display table
	python table_editor.py show input.tbl

	# Generate ASCII table
	python table_editor.py generate ascii -o output.tbl

	# Convert to JSON
	python table_editor.py convert input.tbl -o output.json --format json

	# Merge tables
	python table_editor.py merge table1.tbl table2.tbl -o merged.tbl

	# Decode bytes using table
	python table_editor.py decode input.tbl --hex "48656C6C6F"
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Show command
	show_parser = subparsers.add_parser("show", help="Display table contents")
	show_parser.add_argument("input", help="Input .tbl file")
	show_parser.add_argument("--format", choices=["standard", "grouped", "json"], default="standard")

	# Generate command
	gen_parser = subparsers.add_parser("generate", help="Generate table template")
	gen_parser.add_argument("type", choices=["ascii", "japanese", "empty"], help="Table type")
	gen_parser.add_argument("-o", "--output", required=True, help="Output file")

	# Convert command
	conv_parser = subparsers.add_parser("convert", help="Convert table format")
	conv_parser.add_argument("input", help="Input file")
	conv_parser.add_argument("-o", "--output", required=True, help="Output file")
	conv_parser.add_argument("--format", choices=["standard", "grouped", "json"], default="standard")

	# Merge command
	merge_parser = subparsers.add_parser("merge", help="Merge multiple tables")
	merge_parser.add_argument("inputs", nargs="+", help="Input .tbl files")
	merge_parser.add_argument("-o", "--output", required=True, help="Output file")

	# Decode command
	decode_parser = subparsers.add_parser("decode", help="Decode bytes using table")
	decode_parser.add_argument("table", help="Table file")
	decode_parser.add_argument("--hex", required=True, help="Hex string to decode")

	# Encode command
	encode_parser = subparsers.add_parser("encode", help="Encode string using table")
	encode_parser.add_argument("table", help="Table file")
	encode_parser.add_argument("--text", required=True, help="Text to encode")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	if args.command == "show":
		input_path = Path(args.input)
		if not input_path.exists():
			print(f"Error: File not found: {input_path}", file=sys.stderr)
			return 1

		table_parser = TableFileParser()
		table = table_parser.parse_file(input_path)

		if args.format == "json":
			print(export_to_json(table))
		else:
			writer = TableFileWriter(table)
			print(writer.generate_content(args.format))

	elif args.command == "generate":
		if args.type == "ascii":
			table = generate_ascii_table()
		elif args.type == "japanese":
			table = generate_japanese_table()
		else:
			table = TextTable()

		writer = TableFileWriter(table)
		output_path = Path(args.output)
		writer.write_file(output_path)
		print(f"Generated: {output_path}")

	elif args.command == "convert":
		input_path = Path(args.input)
		output_path = Path(args.output)

		if not input_path.exists():
			print(f"Error: File not found: {input_path}", file=sys.stderr)
			return 1

		if args.format == "json":
			table_parser = TableFileParser()
			table = table_parser.parse_file(input_path)
			output_path.write_text(export_to_json(table), encoding="utf-8")
		else:
			convert_table_format(input_path, output_path, args.format)

		print(f"Converted: {input_path} -> {output_path}")

	elif args.command == "merge":
		tables = []
		for input_file in args.inputs:
			input_path = Path(input_file)
			if not input_path.exists():
				print(f"Warning: File not found: {input_path}", file=sys.stderr)
				continue

			table_parser = TableFileParser()
			tables.append(table_parser.parse_file(input_path))

		if tables:
			merged = merge_tables(tables)
			writer = TableFileWriter(merged)
			output_path = Path(args.output)
			writer.write_file(output_path)
			print(f"Merged {len(tables)} tables -> {output_path}")

	elif args.command == "decode":
		table_path = Path(args.table)
		if not table_path.exists():
			print(f"Error: File not found: {table_path}", file=sys.stderr)
			return 1

		table_parser = TableFileParser()
		table = table_parser.parse_file(table_path)

		hex_str = args.hex.replace(" ", "")
		data = bytes.fromhex(hex_str)
		decoded = table.decode_bytes(data)
		print(f"Decoded: {decoded}")

	elif args.command == "encode":
		table_path = Path(args.table)
		if not table_path.exists():
			print(f"Error: File not found: {table_path}", file=sys.stderr)
			return 1

		table_parser = TableFileParser()
		table = table_parser.parse_file(table_path)

		encoded = table.encode_string(args.text)
		hex_str = encoded.hex().upper()
		print(f"Encoded: {hex_str}")

	return 0


if __name__ == "__main__":
	sys.exit(main())
