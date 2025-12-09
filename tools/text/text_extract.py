#!/usr/bin/env python3
"""
Game Text Extractor

Extract and manage game text/dialogue from ROM files.
Supports custom encoding tables, pointer tables, and compression.

Features:
- Load custom TBL encoding files
- Extract text using pointer tables
- Support for various text termination styles
- Export to readable format
- Reinsertion support
- Dictionary/compression handling

Usage:
	python text_extract.py extract <rom> --table <tbl_file> --pointers 0x8000
	python text_extract.py dump <rom> --table <tbl_file> --start 0x8000 --end 0xFFFF
	python text_extract.py insert <rom> --script <script.txt> --output <new_rom>
"""

import argparse
import json
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set


@dataclass
class TextEntry:
	"""Single text entry"""
	index: int
	pointer_offset: int
	text_offset: int
	raw_bytes: bytes
	decoded_text: str
	bank: int = -1


@dataclass
class EncodingTable:
	"""Text encoding table"""
	byte_to_char: Dict[int, str] = field(default_factory=dict)
	char_to_byte: Dict[str, int] = field(default_factory=dict)
	multi_byte: Dict[bytes, str] = field(default_factory=dict)
	control_codes: Dict[int, str] = field(default_factory=dict)
	terminators: Set[int] = field(default_factory=set)


class TBLParser:
	"""Parse TBL encoding files"""

	@staticmethod
	def load(filepath: str) -> EncodingTable:
		"""Load TBL file"""
		table = EncodingTable()
		table.terminators.add(0x00)  # Default terminator

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';') or line.startswith('#'):
					continue

				# Handle BOM
				if line.startswith('\ufeff'):
					line = line[1:]

				# Parse format: XX=char or XXYY=char
				if '=' not in line:
					continue

				hex_part, char_part = line.split('=', 1)
				hex_part = hex_part.strip()
				char_part = char_part  # Keep leading/trailing spaces

				try:
					if len(hex_part) == 2:
						byte_val = int(hex_part, 16)

						# Check for control codes
						if char_part.startswith('<') and char_part.endswith('>'):
							table.control_codes[byte_val] = char_part

							# Common terminators
							if char_part.upper() in ('<END>', '<NULL>', '<TERM>'):
								table.terminators.add(byte_val)
						else:
							table.byte_to_char[byte_val] = char_part
							if char_part not in table.char_to_byte:
								table.char_to_byte[char_part] = byte_val

					elif len(hex_part) == 4:
						# Multi-byte sequence
						byte_seq = bytes([int(hex_part[0:2], 16), int(hex_part[2:4], 16)])
						table.multi_byte[byte_seq] = char_part

				except ValueError:
					continue

		return table

	@staticmethod
	def save(table: EncodingTable, filepath: str) -> None:
		"""Save TBL file"""
		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write("; Encoding Table\n\n")

			# Single byte mappings
			for byte_val in sorted(table.byte_to_char.keys()):
				char = table.byte_to_char[byte_val]
				f.write(f"{byte_val:02X}={char}\n")

			# Control codes
			if table.control_codes:
				f.write("\n; Control Codes\n")
				for byte_val in sorted(table.control_codes.keys()):
					code = table.control_codes[byte_val]
					f.write(f"{byte_val:02X}={code}\n")

			# Multi-byte
			if table.multi_byte:
				f.write("\n; Multi-byte Sequences\n")
				for seq, char in sorted(table.multi_byte.items()):
					hex_str = ''.join(f'{b:02X}' for b in seq)
					f.write(f"{hex_str}={char}\n")


class TextDecoder:
	"""Decode text from ROM data"""

	def __init__(self, table: EncodingTable):
		self.table = table

	def decode(
		self,
		data: bytes,
		start: int,
		max_length: int = 1000,
		stop_on_terminator: bool = True
	) -> Tuple[str, int]:
		"""
		Decode text from data.
		Returns (decoded_string, bytes_consumed)
		"""
		result = []
		pos = start
		end = min(start + max_length, len(data))

		while pos < end:
			byte = data[pos]

			# Check terminator
			if stop_on_terminator and byte in self.table.terminators:
				term_char = self.table.control_codes.get(byte, '<END>')
				result.append(term_char)
				pos += 1
				break

			# Check multi-byte sequences
			if pos + 1 < end:
				two_bytes = data[pos:pos + 2]
				if two_bytes in self.table.multi_byte:
					result.append(self.table.multi_byte[two_bytes])
					pos += 2
					continue

			# Check control codes
			if byte in self.table.control_codes:
				result.append(self.table.control_codes[byte])
				pos += 1
				continue

			# Regular character
			if byte in self.table.byte_to_char:
				result.append(self.table.byte_to_char[byte])
			else:
				# Unknown byte
				result.append(f'[{byte:02X}]')

			pos += 1

		return ''.join(result), pos - start


class TextEncoder:
	"""Encode text to ROM data"""

	def __init__(self, table: EncodingTable):
		self.table = table

	def encode(self, text: str, add_terminator: bool = True) -> bytes:
		"""Encode text string to bytes"""
		result = bytearray()
		i = 0

		while i < len(text):
			# Check for control codes
			if text[i] == '<':
				end = text.find('>', i)
				if end != -1:
					code = text[i:end + 1]
					# Find matching control code
					for byte_val, ctrl in self.table.control_codes.items():
						if ctrl == code:
							result.append(byte_val)
							i = end + 1
							break
					else:
						# Unknown control code - skip
						i = end + 1
					continue

			# Check for raw byte notation [XX]
			if text[i] == '[':
				end = text.find(']', i)
				if end != -1 and end - i == 3:
					try:
						byte_val = int(text[i + 1:end], 16)
						result.append(byte_val)
						i = end + 1
						continue
					except ValueError:
						pass

			# Regular character
			char = text[i]
			if char in self.table.char_to_byte:
				result.append(self.table.char_to_byte[char])
			else:
				# Try case conversion
				if char.upper() in self.table.char_to_byte:
					result.append(self.table.char_to_byte[char.upper()])
				elif char.lower() in self.table.char_to_byte:
					result.append(self.table.char_to_byte[char.lower()])
				else:
					# Can't encode - use placeholder
					result.append(0x20)  # Space

			i += 1

		# Add terminator
		if add_terminator and self.table.terminators:
			result.append(min(self.table.terminators))

		return bytes(result)


class PointerTableReader:
	"""Read text using pointer tables"""

	def __init__(self, data: bytes, table: EncodingTable):
		self.data = data
		self.table = table
		self.decoder = TextDecoder(table)

	def read_pointer_table(
		self,
		pointer_offset: int,
		count: int,
		pointer_size: int = 2,
		base_address: int = 0,
		bank_offset: int = 0
	) -> List[TextEntry]:
		"""Read text entries from pointer table"""
		entries = []

		for i in range(count):
			ptr_loc = pointer_offset + (i * pointer_size)

			# Read pointer
			if pointer_size == 2:
				text_addr = struct.unpack('<H', self.data[ptr_loc:ptr_loc + 2])[0]
			elif pointer_size == 3:
				text_addr = struct.unpack('<I', self.data[ptr_loc:ptr_loc + 3] + b'\x00')[0] & 0xFFFFFF
			else:
				continue

			# Convert to file offset
			if base_address:
				text_offset = text_addr - base_address + bank_offset
			else:
				text_offset = text_addr

			if text_offset < 0 or text_offset >= len(self.data):
				continue

			# Decode text
			decoded, length = self.decoder.decode(self.data, text_offset)
			raw = self.data[text_offset:text_offset + length]

			entries.append(TextEntry(
				index=i,
				pointer_offset=ptr_loc,
				text_offset=text_offset,
				raw_bytes=raw,
				decoded_text=decoded,
			))

		return entries

	def scan_for_text(
		self,
		start: int,
		end: int,
		min_length: int = 3
	) -> List[TextEntry]:
		"""Scan range for text strings"""
		entries = []
		pos = start

		while pos < end:
			decoded, length = self.decoder.decode(
				self.data, pos, max_length=500, stop_on_terminator=True
			)

			# Check if valid text
			if length >= min_length:
				# Count printable ratio
				printable = sum(1 for c in decoded if c.isprintable() or c in '\n<>')
				total = len(decoded)

				if total > 0 and printable / total > 0.8:
					entries.append(TextEntry(
						index=len(entries),
						pointer_offset=-1,
						text_offset=pos,
						raw_bytes=self.data[pos:pos + length],
						decoded_text=decoded,
					))
					pos += length
					continue

			pos += 1

		return entries


class ScriptExporter:
	"""Export text to editable script format"""

	@staticmethod
	def export(
		entries: List[TextEntry],
		filepath: str,
		include_hex: bool = False
	) -> None:
		"""Export to script file"""
		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write("; Game Script Export\n")
			f.write(f"; {len(entries)} entries\n\n")

			for entry in entries:
				f.write(f"; Entry {entry.index}\n")
				f.write(f"; Offset: 0x{entry.text_offset:06X}\n")
				if include_hex:
					hex_str = ' '.join(f'{b:02X}' for b in entry.raw_bytes[:32])
					f.write(f"; Hex: {hex_str}\n")
				f.write(f"#{entry.index}#\n")
				f.write(f"{entry.decoded_text}\n")
				f.write("\n")

	@staticmethod
	def export_json(entries: List[TextEntry], filepath: str) -> None:
		"""Export to JSON"""
		data = [
			{
				'index': e.index,
				'pointer_offset': f"0x{e.pointer_offset:06X}" if e.pointer_offset >= 0 else None,
				'text_offset': f"0x{e.text_offset:06X}",
				'text': e.decoded_text,
				'hex': ' '.join(f'{b:02X}' for b in e.raw_bytes),
			}
			for e in entries
		]

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(data, f, indent='\t', ensure_ascii=False)


class ScriptImporter:
	"""Import edited scripts"""

	@staticmethod
	def parse(filepath: str) -> Dict[int, str]:
		"""Parse script file, return index -> text mapping"""
		scripts = {}
		current_index = None
		current_text = []

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				# Skip comments
				if line.startswith(';'):
					continue

				# Check for entry marker
				if line.startswith('#') and line.rstrip().endswith('#'):
					# Save previous entry
					if current_index is not None and current_text:
						scripts[current_index] = ''.join(current_text).rstrip('\n')

					# Parse new index
					try:
						current_index = int(line.strip('#').strip())
						current_text = []
					except ValueError:
						current_index = None
				elif current_index is not None:
					current_text.append(line)

		# Save last entry
		if current_index is not None and current_text:
			scripts[current_index] = ''.join(current_text).rstrip('\n')

		return scripts


def main():
	parser = argparse.ArgumentParser(
		description='Game Text Extractor',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract text using pointers')
	extract_parser.add_argument('rom', help='ROM file')
	extract_parser.add_argument('--table', '-t', required=True, help='TBL encoding file')
	extract_parser.add_argument('--pointers', '-p', type=lambda x: int(x, 0), required=True,
							   help='Pointer table offset')
	extract_parser.add_argument('--count', '-c', type=int, required=True, help='Number of entries')
	extract_parser.add_argument('--base', '-b', type=lambda x: int(x, 0), default=0, help='Base address')
	extract_parser.add_argument('--output', '-o', help='Output file')
	extract_parser.add_argument('--format', '-f', default='txt', choices=['txt', 'json'], help='Output format')

	# Dump command
	dump_parser = subparsers.add_parser('dump', help='Dump text from range')
	dump_parser.add_argument('rom', help='ROM file')
	dump_parser.add_argument('--table', '-t', required=True, help='TBL encoding file')
	dump_parser.add_argument('--start', '-s', type=lambda x: int(x, 0), required=True, help='Start offset')
	dump_parser.add_argument('--end', '-e', type=lambda x: int(x, 0), required=True, help='End offset')
	dump_parser.add_argument('--output', '-o', help='Output file')

	# Insert command
	insert_parser = subparsers.add_parser('insert', help='Insert text back into ROM')
	insert_parser.add_argument('rom', help='Source ROM file')
	insert_parser.add_argument('--table', '-t', required=True, help='TBL encoding file')
	insert_parser.add_argument('--script', '-s', required=True, help='Script file to insert')
	insert_parser.add_argument('--output', '-o', required=True, help='Output ROM')
	insert_parser.add_argument('--pointers', '-p', type=lambda x: int(x, 0), help='Pointer table offset')

	# Create table command
	create_parser = subparsers.add_parser('create-table', help='Create basic TBL file')
	create_parser.add_argument('output', help='Output TBL file')
	create_parser.add_argument('--type', '-t', default='ascii',
							   choices=['ascii', 'nes-standard', 'snes-standard'],
							   help='Table type')

	args = parser.parse_args()

	if args.command == 'extract':
		# Load table
		table = TBLParser.load(args.table)

		# Load ROM
		with open(args.rom, 'rb') as f:
			data = f.read()

		# Extract text
		reader = PointerTableReader(data, table)
		entries = reader.read_pointer_table(
			args.pointers,
			args.count,
			base_address=args.base
		)

		print(f"Extracted {len(entries)} text entries")

		# Output
		if args.output:
			if args.format == 'json':
				ScriptExporter.export_json(entries, args.output)
			else:
				ScriptExporter.export(entries, args.output, include_hex=True)
			print(f"Saved to: {args.output}")
		else:
			for entry in entries[:10]:
				print(f"\n[{entry.index}] @ 0x{entry.text_offset:06X}:")
				print(f"  {entry.decoded_text[:80]}")

	elif args.command == 'dump':
		# Load table
		table = TBLParser.load(args.table)

		# Load ROM
		with open(args.rom, 'rb') as f:
			data = f.read()

		# Scan for text
		reader = PointerTableReader(data, table)
		entries = reader.scan_for_text(args.start, args.end)

		print(f"Found {len(entries)} text strings")

		# Output
		if args.output:
			ScriptExporter.export(entries, args.output, include_hex=True)
			print(f"Saved to: {args.output}")
		else:
			for entry in entries[:20]:
				print(f"\n0x{entry.text_offset:06X}:")
				text = entry.decoded_text.replace('\n', '\\n')
				print(f"  {text[:60]}")

	elif args.command == 'insert':
		print("Text insertion not fully implemented yet")
		# TODO: Full insertion with pointer recalculation

	elif args.command == 'create-table':
		table = EncodingTable()

		if args.type == 'ascii':
			# Standard ASCII
			for i in range(32, 127):
				table.byte_to_char[i] = chr(i)
				table.char_to_byte[chr(i)] = i
			table.control_codes[0x00] = '<END>'
			table.terminators.add(0x00)

		elif args.type == 'nes-standard':
			# Common NES layout (A=0x0A, space=0x00)
			table.byte_to_char[0x00] = ' '
			table.char_to_byte[' '] = 0x00
			for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
				table.byte_to_char[0x0A + i] = c
				table.char_to_byte[c] = 0x0A + i
			for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
				table.byte_to_char[0x24 + i] = c
				table.char_to_byte[c] = 0x24 + i
			for i, c in enumerate('0123456789'):
				table.byte_to_char[0x3E + i] = c
				table.char_to_byte[c] = 0x3E + i
			table.control_codes[0xFF] = '<END>'
			table.terminators.add(0xFF)

		elif args.type == 'snes-standard':
			# SNES with DTE
			for i, c in enumerate('ABCDEFGHIJKLMNOPQRSTUVWXYZ'):
				table.byte_to_char[0x00 + i] = c
				table.char_to_byte[c] = 0x00 + i
			for i, c in enumerate('abcdefghijklmnopqrstuvwxyz'):
				table.byte_to_char[0x1A + i] = c
				table.char_to_byte[c] = 0x1A + i
			table.byte_to_char[0x34] = ' '
			table.char_to_byte[' '] = 0x34
			table.control_codes[0x00] = '<END>'
			table.terminators.add(0x00)

		TBLParser.save(table, args.output)
		print(f"Created table: {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
