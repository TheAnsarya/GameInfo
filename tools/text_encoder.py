#!/usr/bin/env python3
"""
Text Encoding Converter - Convert between text encodings.

Tools for converting text between different game encodings and formats.

Usage:
	python text_encoder.py --encode "Hello" --table dw4.tbl
	python text_encoder.py --decode 80 81 82 --table dw4.tbl
	python text_encoder.py --convert input.txt --from sjis --to utf8

Features:
	- Custom table files
	- Standard encodings
	- Control code handling
	- Batch conversion
	- DTE/MTE support
"""

import argparse
import json
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


@dataclass
class TableEntry:
	"""A table entry for encoding/decoding."""
	value: int  # Byte value or multi-byte
	text: str   # Text representation
	is_control: bool = False  # Is this a control code?

	def __repr__(self):
		if self.is_control:
			return f"<{self.text}>"
		return self.text


@dataclass
class EncodingTable:
	"""A text encoding table."""
	name: str = ""

	# Mappings
	value_to_text: Dict[int, TableEntry] = field(default_factory=dict)
	text_to_value: Dict[str, int] = field(default_factory=dict)

	# DTE/MTE entries (multi-byte text)
	dte_entries: Dict[int, str] = field(default_factory=dict)

	# Control codes
	control_codes: Dict[int, str] = field(default_factory=dict)

	def add_entry(self, value: int, text: str, is_control: bool = False):
		"""Add entry to table."""
		entry = TableEntry(value, text, is_control)
		self.value_to_text[value] = entry
		if not is_control:
			self.text_to_value[text] = value
		else:
			self.control_codes[value] = text

	def decode_byte(self, value: int) -> Optional[TableEntry]:
		"""Decode a single byte."""
		return self.value_to_text.get(value)

	def encode_char(self, char: str) -> Optional[int]:
		"""Encode a single character."""
		return self.text_to_value.get(char)


class TableParser:
	"""Parser for .tbl files."""

	@staticmethod
	def parse(content: str) -> EncodingTable:
		"""Parse table file content."""
		table = EncodingTable()

		for line in content.split("\n"):
			line = line.strip()
			if not line or line.startswith(";") or line.startswith("#"):
				continue

			# Format: XX=text or XXXX=text
			if "=" in line:
				parts = line.split("=", 1)
				if len(parts) == 2:
					hex_part = parts[0].strip()
					text_part = parts[1]

					try:
						value = int(hex_part, 16)

						# Check for control codes (usually in brackets or special)
						is_control = text_part.startswith("[") or text_part.startswith("<")
						if is_control:
							text_part = text_part.strip("[]<>")

						# Handle newline
						if text_part == "\\n" or text_part.lower() == "newline":
							text_part = "\n"
							is_control = True

						table.add_entry(value, text_part, is_control)
					except ValueError:
						pass

		return table

	@staticmethod
	def save(table: EncodingTable, path: Path):
		"""Save table to file."""
		lines = []
		lines.append(f"; Table: {table.name}")
		lines.append("")

		# Sort by value
		for value in sorted(table.value_to_text.keys()):
			entry = table.value_to_text[value]

			if len(f"{value:X}") <= 2:
				hex_str = f"{value:02X}"
			else:
				hex_str = f"{value:04X}"

			if entry.is_control:
				text_str = f"[{entry.text}]"
			elif entry.text == "\n":
				text_str = "[newline]"
			else:
				text_str = entry.text

			lines.append(f"{hex_str}={text_str}")

		path.write_text("\n".join(lines))


class TextEncoder:
	"""Text encoding/decoding engine."""

	def __init__(self):
		self.tables: Dict[str, EncodingTable] = {}
		self._load_default_tables()

	def _load_default_tables(self):
		"""Load some default tables."""
		# ASCII
		ascii_table = EncodingTable(name="ascii")
		for i in range(32, 127):
			ascii_table.add_entry(i, chr(i))
		ascii_table.add_entry(0x0A, "\n", True)
		ascii_table.add_entry(0x00, "[END]", True)
		self.tables["ascii"] = ascii_table

	def load_table(self, path: Path) -> EncodingTable:
		"""Load table from file."""
		content = path.read_text(encoding="utf-8", errors="replace")
		table = TableParser.parse(content)
		table.name = path.stem
		self.tables[table.name] = table
		return table

	def encode(self, text: str, table_name: str = "ascii") -> bytes:
		"""Encode text to bytes."""
		table = self.tables.get(table_name)
		if not table:
			raise ValueError(f"Unknown table: {table_name}")

		result = bytearray()
		i = 0

		while i < len(text):
			# Check for control codes in brackets
			if text[i] == "[":
				end = text.find("]", i)
				if end > i:
					code_name = text[i + 1:end]
					# Find control code
					for value, name in table.control_codes.items():
						if name.lower() == code_name.lower():
							if value <= 0xFF:
								result.append(value)
							else:
								result.extend(value.to_bytes(2, "little"))
							break
					i = end + 1
					continue

			# Try multi-char matches (DTE)
			matched = False
			for length in range(4, 0, -1):
				if i + length <= len(text):
					substr = text[i:i + length]
					value = table.text_to_value.get(substr)
					if value is not None:
						if value <= 0xFF:
							result.append(value)
						else:
							result.extend(value.to_bytes(2, "little"))
						i += length
						matched = True
						break

			if not matched:
				# Single char
				char = text[i]
				value = table.text_to_value.get(char)
				if value is not None:
					if value <= 0xFF:
						result.append(value)
					else:
						result.extend(value.to_bytes(2, "little"))
				else:
					# Unknown char, use placeholder or skip
					result.append(0x20)  # Space
				i += 1

		return bytes(result)

	def decode(self, data: bytes, table_name: str = "ascii") -> str:
		"""Decode bytes to text."""
		table = self.tables.get(table_name)
		if not table:
			raise ValueError(f"Unknown table: {table_name}")

		result = []
		i = 0

		while i < len(data):
			# Try two-byte values first
			if i + 1 < len(data):
				value16 = data[i] | (data[i + 1] << 8)
				entry = table.value_to_text.get(value16)
				if entry:
					if entry.is_control:
						result.append(f"[{entry.text}]")
					else:
						result.append(entry.text)
					i += 2
					continue

			# Single byte
			value = data[i]
			entry = table.value_to_text.get(value)

			if entry:
				if entry.is_control:
					result.append(f"[{entry.text}]")
				else:
					result.append(entry.text)
			else:
				result.append(f"[${value:02X}]")

			i += 1

		return "".join(result)

	def convert_encoding(self, text: str, from_enc: str, to_enc: str) -> str:
		"""Convert between standard encodings."""
		try:
			# Encode with source encoding
			if from_enc.lower() == "sjis":
				from_enc = "shift_jis"
			elif from_enc.lower() == "utf8":
				from_enc = "utf-8"

			if to_enc.lower() == "sjis":
				to_enc = "shift_jis"
			elif to_enc.lower() == "utf8":
				to_enc = "utf-8"

			data = text.encode(from_enc)
			return data.decode(to_enc, errors="replace")
		except Exception as e:
			return f"Error: {e}"

	def analyze_text(self, data: bytes, table_name: str = "ascii") -> Dict[str, Any]:
		"""Analyze text data."""
		table = self.tables.get(table_name)

		# Count characters
		char_counts: Dict[int, int] = {}
		unknown_count = 0
		control_count = 0

		for byte in data:
			char_counts[byte] = char_counts.get(byte, 0) + 1

			if table:
				entry = table.value_to_text.get(byte)
				if not entry:
					unknown_count += 1
				elif entry.is_control:
					control_count += 1

		# Find most common
		sorted_chars = sorted(char_counts.items(), key=lambda x: x[1], reverse=True)

		return {
			"total_bytes": len(data),
			"unique_bytes": len(char_counts),
			"unknown_bytes": unknown_count,
			"control_codes": control_count,
			"most_common": sorted_chars[:10]
		}

	def format_hex_dump(self, data: bytes, table_name: str = "ascii",
					   width: int = 16) -> str:
		"""Format hex dump with decoded text."""
		table = self.tables.get(table_name)
		lines = []

		for i in range(0, len(data), width):
			chunk = data[i:i + width]

			# Hex part
			hex_str = " ".join(f"{b:02X}" for b in chunk)
			hex_str = hex_str.ljust(width * 3 - 1)

			# Text part
			text_parts = []
			for b in chunk:
				if table:
					entry = table.value_to_text.get(b)
					if entry and not entry.is_control:
						char = entry.text
						if len(char) == 1 and ord(char) >= 32:
							text_parts.append(char)
						else:
							text_parts.append(".")
					else:
						text_parts.append(".")
				elif 32 <= b < 127:
					text_parts.append(chr(b))
				else:
					text_parts.append(".")

			text_str = "".join(text_parts)

			lines.append(f"{i:06X}  {hex_str}  |{text_str}|")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Text Encoding Converter")
	parser.add_argument("--encode", "-e", type=str,
						help="Text to encode")
	parser.add_argument("--decode", "-d", nargs="+", type=str,
						help="Hex bytes to decode")
	parser.add_argument("--table", "-t", type=Path,
						help="Table file to use")
	parser.add_argument("--convert", type=Path,
						help="File to convert")
	parser.add_argument("--from", dest="from_enc", type=str,
						help="Source encoding")
	parser.add_argument("--to", dest="to_enc", type=str,
						help="Target encoding")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Analyze binary file")
	parser.add_argument("--hexdump", type=Path,
						help="Show hex dump with text")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--list-encodings", action="store_true",
						help="List standard encodings")

	args = parser.parse_args()
	encoder = TextEncoder()

	table_name = "ascii"
	if args.table:
		table = encoder.load_table(args.table)
		table_name = table.name

	if args.list_encodings:
		print("Standard Encodings:")
		print("  utf8, utf16, sjis (shift_jis), euc_jp, iso8859_1")
		print("  cp437 (DOS), cp1252 (Windows)")
		print()
		print("Loaded Tables:")
		for name in encoder.tables:
			print(f"  {name}")
		return

	if args.encode:
		data = encoder.encode(args.encode, table_name)
		print(f"Encoded ({len(data)} bytes):")
		print(" ".join(f"{b:02X}" for b in data))

		if args.output:
			args.output.write_bytes(data)
			print(f"Saved to: {args.output}")
		return

	if args.decode:
		# Parse hex bytes
		hex_str = " ".join(args.decode)
		hex_str = hex_str.replace(",", " ").replace("$", "").replace("0x", "")
		data = bytes(int(b, 16) for b in hex_str.split())

		text = encoder.decode(data, table_name)
		print(f"Decoded:")
		print(text)
		return

	if args.convert:
		if not args.from_enc or not args.to_enc:
			print("Error: --from and --to required for conversion")
			return

		text = args.convert.read_text(encoding=args.from_enc, errors="replace")
		converted = text  # Already decoded

		if args.output:
			args.output.write_text(converted, encoding=args.to_enc)
			print(f"Converted {args.convert} to {args.output}")
		else:
			print(converted)
		return

	if args.analyze:
		data = args.analyze.read_bytes()
		analysis = encoder.analyze_text(data, table_name)

		print(f"Text Analysis: {args.analyze}")
		print("=" * 50)
		print(f"Total Bytes: {analysis['total_bytes']}")
		print(f"Unique Bytes: {analysis['unique_bytes']}")
		print(f"Unknown Bytes: {analysis['unknown_bytes']}")
		print(f"Control Codes: {analysis['control_codes']}")
		print()
		print("Most Common:")
		for value, count in analysis['most_common']:
			entry = encoder.tables.get(table_name, {}).value_to_text.get(value) if table_name else None
			char = entry.text if entry else "?"
			print(f"  ${value:02X} ({char}): {count}")
		return

	if args.hexdump:
		data = args.hexdump.read_bytes()
		print(encoder.format_hex_dump(data, table_name))
		return

	# Default: show help
	print("Text Encoding Converter")
	print()
	print("Usage:")
	print("  --encode TEXT            Encode text to bytes")
	print("  --decode HEX...          Decode hex bytes to text")
	print("  --table FILE             Use custom table file")
	print("  --convert FILE           Convert file encoding")
	print("  --analyze FILE           Analyze binary text")
	print("  --hexdump FILE           Show hex dump")
	print("  --list-encodings         List available encodings")


if __name__ == "__main__":
	main()
