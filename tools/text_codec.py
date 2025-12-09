#!/usr/bin/env python3
"""
Text Codec Tool

Encodes and decodes game text using custom text tables.
Supports multiple table formats and control codes.

Author: GameInfo Project
License: MIT
"""

import re
import struct
import argparse
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional, Callable
from enum import Enum


class TableFormat(Enum):
	"""Supported text table formats"""
	THINGY = "thingy"  # Standard .tbl format
	ATLAS = "atlas"
	CUSTOM = "custom"


@dataclass
class ControlCode:
	"""A control code in the text encoding"""
	byte_sequence: bytes
	name: str
	description: str = ""
	has_parameter: bool = False
	param_length: int = 0
	formatter: Optional[Callable[[bytes], str]] = None


@dataclass
class TextTable:
	"""Text encoding table"""
	name: str = ""
	encoding: dict[bytes, str] = field(default_factory=dict)  # bytes -> text
	decoding: dict[str, bytes] = field(default_factory=dict)  # text -> bytes
	control_codes: list[ControlCode] = field(default_factory=list)
	end_byte: bytes = b'\x00'
	line_break: bytes = b'\x01'

	def add_entry(self, byte_val: bytes, text: str):
		"""Add an entry to the table"""
		self.encoding[byte_val] = text
		self.decoding[text] = byte_val

	def add_control_code(self, byte_val: bytes, name: str, **kwargs):
		"""Add a control code"""
		code = ControlCode(byte_sequence=byte_val, name=name, **kwargs)
		self.control_codes.append(code)
		# Also add to encoding/decoding
		self.encoding[byte_val] = f"[{name}]"
		self.decoding[f"[{name}]"] = byte_val


class TextTableParser:
	"""Parse text table files"""

	def parse_thingy_table(self, content: str) -> TextTable:
		"""Parse Thingy/standard .tbl format

		Format: XX=char or XXXX=char
		"""
		table = TextTable()

		for line in content.split('\n'):
			line = line.strip()
			if not line or line.startswith('#') or line.startswith(';'):
				continue

			if '=' not in line:
				continue

			parts = line.split('=', 1)
			if len(parts) != 2:
				continue

			hex_part = parts[0].strip()
			char_part = parts[1]

			# Handle special cases
			if not hex_part:
				continue

			try:
				# Parse hex bytes
				if len(hex_part) == 2:
					byte_val = bytes([int(hex_part, 16)])
				elif len(hex_part) == 4:
					byte_val = bytes([int(hex_part[0:2], 16), int(hex_part[2:4], 16)])
				else:
					byte_val = bytes.fromhex(hex_part)

				# Handle special characters
				if char_part == '':
					char_part = ' '  # Empty means space in some tables
				elif char_part.startswith('[') and char_part.endswith(']'):
					# Control code
					table.add_entry(byte_val, char_part)
					continue

				table.add_entry(byte_val, char_part)

			except ValueError:
				continue

		return table

	def parse_file(self, path: Path, format: TableFormat = TableFormat.THINGY) -> TextTable:
		"""Parse a text table file"""
		content = path.read_text(encoding='utf-8')

		if format == TableFormat.THINGY:
			return self.parse_thingy_table(content)
		else:
			return self.parse_thingy_table(content)  # Default to thingy format

	def generate_standard_table(self, variant: str = "ascii") -> TextTable:
		"""Generate a standard text table"""
		table = TextTable(name=variant)

		if variant == "ascii":
			# Standard ASCII mapping
			for i in range(0x20, 0x7f):
				table.add_entry(bytes([i]), chr(i))

		elif variant == "nes_dq":
			# Dragon Quest NES style
			# Uppercase letters
			for i, c in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):
				table.add_entry(bytes([0x8a + i]), c)
			# Lowercase letters
			for i, c in enumerate("abcdefghijklmnopqrstuvwxyz"):
				table.add_entry(bytes([0xa4 + i]), c)
			# Numbers
			for i, c in enumerate("0123456789"):
				table.add_entry(bytes([0x80 + i]), c)
			# Common punctuation
			table.add_entry(bytes([0xbe]), " ")
			table.add_entry(bytes([0xbf]), ".")
			table.add_entry(bytes([0xc0]), ",")
			table.add_entry(bytes([0xc1]), "'")
			table.add_entry(bytes([0xc2]), "?")
			table.add_entry(bytes([0xc3]), "!")
			table.add_entry(bytes([0xc4]), "-")
			table.add_entry(bytes([0xfc]), "\n")
			table.add_entry(bytes([0xff]), "[END]")

		elif variant == "snes_dq":
			# Dragon Quest SNES style (simplified)
			# This is an example - actual tables vary by game
			for i, c in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):
				table.add_entry(bytes([0x0a + i]), c)
			for i, c in enumerate("abcdefghijklmnopqrstuvwxyz"):
				table.add_entry(bytes([0x24 + i]), c)
			for i, c in enumerate("0123456789"):
				table.add_entry(bytes([0x00 + i]), c)
			table.add_entry(bytes([0x3e]), " ")
			table.add_entry(bytes([0x3f]), ".")

		return table


class TextCodec:
	"""Encode and decode game text"""

	def __init__(self, table: TextTable):
		self.table = table

		# Sort decoding entries by length (longest first) for proper matching
		self.sorted_text_keys = sorted(
			self.table.decoding.keys(),
			key=len,
			reverse=True
		)

		# Sort encoding entries by length (longest first) for proper matching
		self.sorted_byte_keys = sorted(
			self.table.encoding.keys(),
			key=len,
			reverse=True
		)

	def decode(self, data: bytes, stop_at_end: bool = True) -> tuple[str, int]:
		"""Decode bytes to text

		Returns: (decoded_text, bytes_consumed)
		"""
		result = []
		pos = 0

		while pos < len(data):
			# Check for end byte
			if stop_at_end:
				remaining = data[pos:]
				if remaining.startswith(self.table.end_byte):
					pos += len(self.table.end_byte)
					break

			# Try to match bytes
			matched = False
			for byte_key in self.sorted_byte_keys:
				if data[pos:pos + len(byte_key)] == byte_key:
					text = self.table.encoding[byte_key]
					result.append(text)
					pos += len(byte_key)
					matched = True
					break

			if not matched:
				# Unknown byte - output as hex
				result.append(f"[{data[pos]:02x}]")
				pos += 1

		return ''.join(result), pos

	def encode(self, text: str) -> bytes:
		"""Encode text to bytes"""
		result = bytearray()
		pos = 0

		while pos < len(text):
			# Try to match text
			matched = False
			for text_key in self.sorted_text_keys:
				if text[pos:pos + len(text_key)] == text_key:
					byte_val = self.table.decoding[text_key]
					result.extend(byte_val)
					pos += len(text_key)
					matched = True
					break

			if not matched:
				# Check for hex notation [XX]
				hex_match = re.match(r'\[([0-9a-fA-F]{2})\]', text[pos:])
				if hex_match:
					byte_val = int(hex_match.group(1), 16)
					result.append(byte_val)
					pos += 4
				else:
					# Skip unknown character
					pos += 1

		return bytes(result)

	def decode_with_pointers(self, data: bytes, pointer_offset: int,
							num_strings: int, pointer_size: int = 2) -> dict[int, str]:
		"""Decode multiple strings using pointer table"""
		strings = {}

		for i in range(num_strings):
			ptr_addr = pointer_offset + (i * pointer_size)

			if pointer_size == 2:
				pointer = struct.unpack_from('<H', data, ptr_addr)[0]
			else:
				pointer = struct.unpack_from('<I', data, ptr_addr)[0] & 0xffffff

			# Decode string at pointer
			text, _ = self.decode(data[pointer:])
			strings[pointer] = text

		return strings


class TextDumper:
	"""Dump text from ROM files"""

	def __init__(self, codec: TextCodec):
		self.codec = codec

	def dump_string_at(self, data: bytes, offset: int) -> tuple[str, int]:
		"""Dump a single string at offset"""
		return self.codec.decode(data[offset:])

	def dump_pointer_table(self, data: bytes, table_offset: int,
						  num_entries: int, pointer_size: int = 2,
						  base_offset: int = 0) -> list[dict]:
		"""Dump strings referenced by pointer table"""
		strings = []

		for i in range(num_entries):
			ptr_addr = table_offset + (i * pointer_size)

			if pointer_size == 2:
				pointer = struct.unpack_from('<H', data, ptr_addr)[0]
			else:
				pointer = struct.unpack_from('<I', data, ptr_addr)[0] & 0xffffff

			actual_offset = pointer + base_offset
			text, length = self.codec.decode(data[actual_offset:])

			strings.append({
				'index': i,
				'pointer': f"0x{pointer:04x}",
				'offset': f"0x{actual_offset:04x}",
				'length': length,
				'text': text
			})

		return strings

	def scan_for_text(self, data: bytes, min_length: int = 4) -> list[dict]:
		"""Scan ROM for text strings"""
		found = []
		pos = 0

		while pos < len(data):
			text, length = self.codec.decode(data[pos:])

			# Check if it looks like valid text
			if length >= min_length and self._is_valid_text(text):
				found.append({
					'offset': f"0x{pos:04x}",
					'length': length,
					'text': text
				})
				pos += length
			else:
				pos += 1

		return found

	def _is_valid_text(self, text: str, min_printable_ratio: float = 0.7) -> bool:
		"""Check if text looks valid"""
		if not text:
			return False

		# Count printable characters
		printable = sum(1 for c in text if c.isprintable() or c in '\n\r')
		ratio = printable / len(text)

		return ratio >= min_printable_ratio


class TextInserter:
	"""Insert translated text into ROM"""

	def __init__(self, codec: TextCodec):
		self.codec = codec

	def insert_string(self, data: bytearray, offset: int, text: str,
					 max_length: int = 0, padding: int = 0x00) -> int:
		"""Insert a single string at offset

		Returns: bytes written
		"""
		encoded = self.codec.encode(text)

		if max_length > 0 and len(encoded) > max_length:
			raise ValueError(f"Encoded text too long: {len(encoded)} > {max_length}")

		# Write encoded text
		for i, byte in enumerate(encoded):
			data[offset + i] = byte

		# Pad if needed
		if max_length > 0:
			for i in range(len(encoded), max_length):
				data[offset + i] = padding

		return len(encoded)

	def insert_with_pointers(self, data: bytearray, strings: list[dict],
							pointer_table_offset: int, text_start_offset: int,
							pointer_size: int = 2) -> int:
		"""Insert multiple strings and update pointer table

		Returns: total bytes written
		"""
		current_offset = text_start_offset

		for i, string_data in enumerate(strings):
			text = string_data.get('text', '')
			encoded = self.codec.encode(text)

			# Write string
			for j, byte in enumerate(encoded):
				data[current_offset + j] = byte

			# Write pointer
			ptr_addr = pointer_table_offset + (i * pointer_size)
			if pointer_size == 2:
				struct.pack_into('<H', data, ptr_addr, current_offset & 0xffff)
			else:
				struct.pack_into('<I', data, ptr_addr, current_offset & 0xffffff)

			current_offset += len(encoded)

		return current_offset - text_start_offset


def export_table_wikitext(table: TextTable, output_path: Path):
	"""Export table in Data Crystal wikitext format"""
	lines = [
		"{{TBL|1=",
		"{{TBL/Header}}"
	]

	# Group entries by first byte
	groups = {}
	for byte_key, text in sorted(table.encoding.items()):
		first_byte = byte_key[0]
		if first_byte not in groups:
			groups[first_byte] = []
		groups[first_byte].append((byte_key, text))

	# Output each group
	for first_byte in sorted(groups.keys()):
		high_nibble = first_byte >> 4
		low_nibble = first_byte & 0x0f

		entries = groups[first_byte]
		for byte_key, text in entries:
			hex_str = byte_key.hex()

			# Escape wiki markup
			display_text = text
			if text in ['|', '=', '{', '}', '[', ']']:
				display_text = f"<nowiki>{text}</nowiki>"

			lines.append(f"{{{{TBL/Entry|{hex_str.upper()}|{display_text}}}}}")

	lines.extend([
		"{{TBL/Footer}}",
		"}}"
	])

	output_path.write_text('\n'.join(lines), encoding='utf-8')


def main():
	"""Main entry point"""
	parser = argparse.ArgumentParser(
		description="Text Codec Tool - Encode/decode game text"
	)
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Decode command
	decode_parser = subparsers.add_parser('decode', help='Decode ROM text')
	decode_parser.add_argument('rom', help='Input ROM file')
	decode_parser.add_argument('table', help='Text table file (.tbl)')
	decode_parser.add_argument('-o', '--output', help='Output file')
	decode_parser.add_argument('--offset', type=lambda x: int(x, 0),
							  help='Start offset')
	decode_parser.add_argument('--length', type=lambda x: int(x, 0),
							  help='Length to decode')
	decode_parser.add_argument('--pointers', type=lambda x: int(x, 0),
							  help='Pointer table offset')
	decode_parser.add_argument('--num-strings', type=int, default=1,
							  help='Number of strings in pointer table')

	# Encode command
	encode_parser = subparsers.add_parser('encode', help='Encode text to bytes')
	encode_parser.add_argument('text_file', help='Input text file')
	encode_parser.add_argument('table', help='Text table file (.tbl)')
	encode_parser.add_argument('-o', '--output', help='Output binary file')

	# Scan command
	scan_parser = subparsers.add_parser('scan', help='Scan ROM for text')
	scan_parser.add_argument('rom', help='Input ROM file')
	scan_parser.add_argument('table', help='Text table file (.tbl)')
	scan_parser.add_argument('-o', '--output', help='Output file')
	scan_parser.add_argument('--min-length', type=int, default=4,
						   help='Minimum string length')

	# Generate command
	gen_parser = subparsers.add_parser('generate', help='Generate standard table')
	gen_parser.add_argument('variant', choices=['ascii', 'nes_dq', 'snes_dq'],
						   help='Table variant')
	gen_parser.add_argument('-o', '--output', required=True, help='Output file')
	gen_parser.add_argument('--wikitext', action='store_true',
						   help='Output as wikitext')

	args = parser.parse_args()

	if args.command == 'generate':
		table_parser = TextTableParser()
		table = table_parser.generate_standard_table(args.variant)

		output_path = Path(args.output)

		if args.wikitext:
			export_table_wikitext(table, output_path)
		else:
			# Export as .tbl file
			lines = []
			for byte_key, text in sorted(table.encoding.items()):
				hex_str = byte_key.hex().upper()
				lines.append(f"{hex_str}={text}")
			output_path.write_text('\n'.join(lines), encoding='utf-8')

		print(f"Generated table: {output_path}")

	elif args.command == 'decode':
		# Load table
		table_parser = TextTableParser()
		table = table_parser.parse_file(Path(args.table))
		codec = TextCodec(table)
		dumper = TextDumper(codec)

		# Read ROM
		rom_data = Path(args.rom).read_bytes()

		if args.pointers is not None:
			# Decode from pointer table
			strings = dumper.dump_pointer_table(
				rom_data, args.pointers, args.num_strings
			)
			output_lines = [
				f"# Pointer table at 0x{args.pointers:04x}",
				""
			]
			for s in strings:
				output_lines.append(f"[{s['index']:3d}] {s['offset']}: {s['text']}")
			output = '\n'.join(output_lines)

		elif args.offset is not None:
			# Decode at specific offset
			length = args.length or (len(rom_data) - args.offset)
			text, bytes_read = codec.decode(rom_data[args.offset:args.offset + length])
			output = f"# Offset: 0x{args.offset:04x}, Read: {bytes_read} bytes\n\n{text}"

		else:
			print("Error: Specify --offset or --pointers")
			return

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Wrote output to {args.output}")
		else:
			print(output)

	elif args.command == 'encode':
		# Load table
		table_parser = TextTableParser()
		table = table_parser.parse_file(Path(args.table))
		codec = TextCodec(table)

		# Read text
		text = Path(args.text_file).read_text(encoding='utf-8')

		# Encode
		encoded = codec.encode(text)

		if args.output:
			Path(args.output).write_bytes(encoded)
			print(f"Encoded {len(text)} chars to {len(encoded)} bytes: {args.output}")
		else:
			print(f"Encoded bytes: {encoded.hex()}")

	elif args.command == 'scan':
		# Load table
		table_parser = TextTableParser()
		table = table_parser.parse_file(Path(args.table))
		codec = TextCodec(table)
		dumper = TextDumper(codec)

		# Read ROM
		rom_data = Path(args.rom).read_bytes()

		# Scan
		found = dumper.scan_for_text(rom_data, args.min_length)

		output_lines = [f"# Found {len(found)} text strings", ""]
		for entry in found:
			output_lines.append(f"{entry['offset']}: {entry['text'][:60]}...")

		output = '\n'.join(output_lines)

		if args.output:
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Found {len(found)} strings, wrote to {args.output}")
		else:
			print(output)

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
