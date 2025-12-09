#!/usr/bin/env python3
"""
Text Script Extractor - Extract and insert game text.

Tools for extracting, editing, and reinserting game text scripts.

Usage:
	python text_script.py --extract rom.nes --table game.tbl
	python text_script.py --insert script.txt --rom rom.nes
	python text_script.py --analyze rom.nes

Features:
	- Table file support (.tbl)
	- Pointer tracking
	- Control code handling
	- Script formatting
	- Multiple encoding support
"""

import argparse
import json
import re
import struct
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set


@dataclass
class TableEntry:
	"""A text table entry."""
	value: int              # Byte value(s)
	text: str               # Decoded text
	byte_count: int = 1     # How many bytes
	is_control: bool = False
	description: str = ""


@dataclass
class TextTable:
	"""Text encoding table."""
	entries: Dict[int, TableEntry] = field(default_factory=dict)
	multi_byte: Dict[Tuple[int, ...], TableEntry] = field(default_factory=dict)

	end_codes: Set[int] = field(default_factory=lambda: {0x00, 0xFF})
	line_codes: Set[int] = field(default_factory=lambda: {0xFE})

	name: str = ""

	def encode(self, text: str) -> bytes:
		"""Encode text to bytes."""
		result = bytearray()
		i = 0

		# Build reverse lookup
		reverse = {e.text: e for e in self.entries.values()}
		reverse.update({e.text: e for e in self.multi_byte.values()})

		while i < len(text):
			# Check control codes [XX]
			match = re.match(r'\[([0-9A-Fa-f]{2}(?:[0-9A-Fa-f]{2})*)\]', text[i:])
			if match:
				hex_str = match.group(1)
				for j in range(0, len(hex_str), 2):
					result.append(int(hex_str[j:j + 2], 16))
				i += len(match.group(0))
				continue

			# Check named control codes {NAME}
			match = re.match(r'\{(\w+)\}', text[i:])
			if match:
				name = match.group(1).upper()
				# Find by description
				for entry in list(self.entries.values()) + list(self.multi_byte.values()):
					if entry.description.upper() == name:
						for _ in range(entry.byte_count):
							result.append(entry.value)
						break
				i += len(match.group(0))
				continue

			# Try longest match first
			found = False
			for length in range(min(8, len(text) - i), 0, -1):
				substr = text[i:i + length]
				if substr in reverse:
					entry = reverse[substr]
					if entry.byte_count == 1:
						result.append(entry.value)
					else:
						for b in entry.value if isinstance(entry.value, tuple) else [entry.value]:
							result.append(b)
					i += length
					found = True
					break

			if not found:
				# Unknown character - use placeholder
				result.append(0x20)  # Space
				i += 1

		return bytes(result)

	def decode(self, data: bytes, start: int = 0,
			  max_length: int = 0) -> Tuple[str, int]:
		"""Decode bytes to text. Returns (text, bytes_consumed)."""
		result = []
		i = start
		end = len(data) if max_length == 0 else min(len(data), start + max_length)

		while i < end:
			byte = data[i]

			# Check end codes
			if byte in self.end_codes:
				result.append(f"[{byte:02X}]")
				i += 1
				break

			# Check multi-byte entries
			found = False
			for key, entry in self.multi_byte.items():
				if i + len(key) <= end:
					if all(data[i + j] == key[j] for j in range(len(key))):
						if entry.is_control:
							result.append(f"{{{entry.description}}}" if entry.description else f"[{''.join(f'{b:02X}' for b in key)}]")
						else:
							result.append(entry.text)
						i += len(key)
						found = True
						break

			if found:
				continue

			# Single byte lookup
			if byte in self.entries:
				entry = self.entries[byte]
				if entry.is_control:
					if byte in self.line_codes:
						result.append("\n")
					elif entry.description:
						result.append(f"{{{entry.description}}}")
					else:
						result.append(f"[{byte:02X}]")
				else:
					result.append(entry.text)
			else:
				result.append(f"[{byte:02X}]")

			i += 1

		return ''.join(result), i - start

	@classmethod
	def load(cls, path: Path) -> "TextTable":
		"""Load from .tbl file."""
		table = cls()
		table.name = path.stem

		content = path.read_text(errors='replace')

		for line in content.splitlines():
			line = line.strip()
			if not line or line.startswith('#') or line.startswith(';'):
				continue

			# Format: XX=text or XXYY=text
			if '=' in line:
				hex_part, text_part = line.split('=', 1)
				hex_part = hex_part.strip()
				text_part = text_part if text_part else ''

				try:
					if len(hex_part) == 2:
						value = int(hex_part, 16)
						entry = TableEntry(
							value=value,
							text=text_part,
							byte_count=1
						)
						table.entries[value] = entry

					elif len(hex_part) >= 4:
						# Multi-byte entry
						bytes_list = tuple(int(hex_part[i:i + 2], 16)
										  for i in range(0, len(hex_part), 2))
						entry = TableEntry(
							value=bytes_list[0],
							text=text_part,
							byte_count=len(bytes_list)
						)
						table.multi_byte[bytes_list] = entry

				except ValueError:
					continue

			# Control code definitions
			elif line.startswith('/'):
				# /XX description
				match = re.match(r'/([0-9A-Fa-f]+)\s+(.+)', line)
				if match:
					hex_str = match.group(1)
					desc = match.group(2)

					if len(hex_str) == 2:
						value = int(hex_str, 16)
						entry = TableEntry(
							value=value,
							text='',
							byte_count=1,
							is_control=True,
							description=desc
						)
						table.entries[value] = entry

		return table

	def save(self, path: Path):
		"""Save to .tbl file."""
		lines = [f"; Text table: {self.name}", ""]

		# Single byte entries
		for value in sorted(self.entries.keys()):
			entry = self.entries[value]
			if entry.is_control:
				lines.append(f"/{value:02X} {entry.description}")
			else:
				lines.append(f"{value:02X}={entry.text}")

		# Multi-byte entries
		if self.multi_byte:
			lines.append("")
			lines.append("; Multi-byte entries")
			for key, entry in sorted(self.multi_byte.items()):
				hex_str = ''.join(f'{b:02X}' for b in key)
				lines.append(f"{hex_str}={entry.text}")

		path.write_text('\n'.join(lines))


@dataclass
class TextPointer:
	"""A text pointer in ROM."""
	address: int            # ROM address of pointer
	target: int             # Address pointed to
	bank: int = -1          # Bank number
	is_absolute: bool = True


@dataclass
class TextBlock:
	"""A block of text in ROM."""
	address: int            # ROM address
	data: bytes             # Raw bytes
	text: str = ""          # Decoded text
	pointer: Optional[TextPointer] = None

	index: int = -1         # Index in table
	label: str = ""         # Optional label


@dataclass
class TextScript:
	"""Collection of text blocks."""
	blocks: List[TextBlock] = field(default_factory=list)
	table: Optional[TextTable] = None

	rom_name: str = ""

	def get_by_address(self, address: int) -> Optional[TextBlock]:
		"""Find block by address."""
		for block in self.blocks:
			if block.address == address:
				return block
		return None

	def sort(self):
		"""Sort blocks by address."""
		self.blocks.sort(key=lambda b: b.address)

	def to_script_format(self) -> str:
		"""Export as human-readable script."""
		lines = [
			f"; Text Script: {self.rom_name}",
			f"; Blocks: {len(self.blocks)}",
			"",
		]

		for i, block in enumerate(self.blocks):
			header = f"#{i:04d}"
			if block.label:
				header += f" ({block.label})"
			header += f" @ ${block.address:06X}"

			if block.pointer:
				header += f" [ptr: ${block.pointer.address:06X}]"

			lines.append(header)
			lines.append("-" * 60)

			# Format text with line wrapping
			text = block.text.replace('\n', '\n')
			lines.append(text)
			lines.append("")

		return '\n'.join(lines)

	@classmethod
	def from_script_format(cls, content: str) -> "TextScript":
		"""Import from script format."""
		script = cls()

		current_block = None
		current_text = []

		for line in content.splitlines():
			if line.startswith('#'):
				# Save previous block
				if current_block:
					current_block.text = '\n'.join(current_text)
					script.blocks.append(current_block)

				# Parse header
				match = re.match(r'#(\d+)\s*(?:\(([^)]+)\))?\s*@\s*\$([0-9A-Fa-f]+)', line)
				if match:
					index = int(match.group(1))
					label = match.group(2) or ""
					address = int(match.group(3), 16)

					current_block = TextBlock(
						address=address,
						data=b"",
						index=index,
						label=label
					)
					current_text = []

			elif line.startswith('-'):
				continue  # Separator

			elif current_block:
				current_text.append(line)

		# Save last block
		if current_block:
			current_block.text = '\n'.join(current_text)
			script.blocks.append(current_block)

		return script


class TextExtractor:
	"""Extract text from ROMs."""

	def __init__(self, table: Optional[TextTable] = None):
		self.table = table or TextTable()
		self.script = TextScript(table=self.table)

	def extract_at(self, data: bytes, address: int,
				  max_length: int = 0) -> TextBlock:
		"""Extract single text block."""
		text, consumed = self.table.decode(data, address, max_length)

		block = TextBlock(
			address=address,
			data=data[address:address + consumed],
			text=text
		)

		return block

	def extract_pointer_table(self, data: bytes, table_address: int,
							 count: int, pointer_size: int = 2,
							 base_address: int = 0,
							 big_endian: bool = False) -> List[TextBlock]:
		"""Extract text via pointer table."""
		blocks = []

		for i in range(count):
			ptr_addr = table_address + i * pointer_size

			if ptr_addr + pointer_size > len(data):
				break

			# Read pointer
			if pointer_size == 2:
				if big_endian:
					target = struct.unpack('>H', data[ptr_addr:ptr_addr + 2])[0]
				else:
					target = struct.unpack('<H', data[ptr_addr:ptr_addr + 2])[0]
			elif pointer_size == 3:
				if big_endian:
					target = (data[ptr_addr] << 16) | (data[ptr_addr + 1] << 8) | data[ptr_addr + 2]
				else:
					target = data[ptr_addr] | (data[ptr_addr + 1] << 8) | (data[ptr_addr + 2] << 16)
			else:
				continue

			target += base_address

			pointer = TextPointer(
				address=ptr_addr,
				target=target
			)

			if target < len(data):
				block = self.extract_at(data, target)
				block.pointer = pointer
				block.index = i
				blocks.append(block)

		return blocks

	def find_strings(self, data: bytes, min_length: int = 4,
					printable_ratio: float = 0.8) -> List[TextBlock]:
		"""Find text strings in data."""
		blocks = []

		# Look for sequences of printable characters
		printable_chars = set(range(0x20, 0x7F))
		for entry in self.table.entries.values():
			if not entry.is_control:
				printable_chars.add(entry.value)

		i = 0
		while i < len(data):
			# Find start of printable sequence
			if data[i] in printable_chars:
				start = i
				while i < len(data) and data[i] in printable_chars:
					i += 1

				length = i - start
				if length >= min_length:
					block = self.extract_at(data, start, length)

					# Verify printable ratio
					printable = sum(1 for c in block.text if c.isprintable() or c == '\n')
					if printable / len(block.text) >= printable_ratio:
						blocks.append(block)
			else:
				i += 1

		return blocks


class TextInserter:
	"""Insert text back into ROMs."""

	def __init__(self, table: Optional[TextTable] = None):
		self.table = table or TextTable()

	def insert_block(self, data: bytearray, block: TextBlock,
					expand: bool = False) -> int:
		"""Insert single text block. Returns new size."""
		encoded = self.table.encode(block.text)
		original_size = len(block.data)
		new_size = len(encoded)

		if new_size <= original_size or expand:
			# Simple replacement
			for i, b in enumerate(encoded):
				if block.address + i < len(data):
					data[block.address + i] = b

			# Pad with end code if smaller
			if new_size < original_size:
				for i in range(new_size, original_size):
					if block.address + i < len(data):
						data[block.address + i] = 0x00

		return new_size - original_size  # Delta

	def update_pointer(self, data: bytearray, pointer: TextPointer,
					  new_target: int):
		"""Update a pointer value."""
		if pointer.is_absolute:
			if pointer.address + 2 <= len(data):
				data[pointer.address] = new_target & 0xFF
				data[pointer.address + 1] = (new_target >> 8) & 0xFF


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Text Script Extractor")
	parser.add_argument("--extract", "-e", type=Path,
						help="ROM to extract from")
	parser.add_argument("--insert", "-i", type=Path,
						help="Script to insert")
	parser.add_argument("--rom", "-r", type=Path,
						help="ROM file for insertion")
	parser.add_argument("--table", "-t", type=Path,
						help="Text table file (.tbl)")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--pointers", "-p", type=str,
						help="Pointer table address (hex)")
	parser.add_argument("--count", "-c", type=int, default=0,
						help="Number of entries")
	parser.add_argument("--find", "-f", action="store_true",
						help="Find strings automatically")
	parser.add_argument("--min-length", type=int, default=4,
						help="Minimum string length")

	args = parser.parse_args()

	# Load table
	table = None
	if args.table:
		table = TextTable.load(args.table)
		print(f"Loaded table: {args.table} ({len(table.entries)} entries)")

	if args.extract:
		data = args.extract.read_bytes()
		extractor = TextExtractor(table)

		if args.pointers and args.count:
			ptr_addr = int(args.pointers, 16)
			blocks = extractor.extract_pointer_table(data, ptr_addr, args.count)
			print(f"Extracted {len(blocks)} blocks from pointer table")

		elif args.find:
			blocks = extractor.find_strings(data, args.min_length)
			print(f"Found {len(blocks)} strings")

		else:
			print("Specify --pointers or --find")
			return

		extractor.script.blocks = blocks
		extractor.script.rom_name = args.extract.name

		if args.output:
			script_text = extractor.script.to_script_format()
			args.output.write_text(script_text, encoding='utf-8')
			print(f"Saved to: {args.output}")
		else:
			# Print first few
			for block in blocks[:5]:
				print(f"\n${block.address:06X}:")
				print(block.text[:200])

	elif args.insert and args.rom:
		# Load script
		script_text = args.insert.read_text(encoding='utf-8')
		script = TextScript.from_script_format(script_text)
		print(f"Loaded script: {len(script.blocks)} blocks")

		# Load ROM
		data = bytearray(args.rom.read_bytes())
		inserter = TextInserter(table)

		for block in script.blocks:
			delta = inserter.insert_block(data, block)
			if delta > 0:
				print(f"Warning: Block #{block.index} grew by {delta} bytes")

		output = args.output or args.rom.with_suffix('.new' + args.rom.suffix)
		output.write_bytes(bytes(data))
		print(f"Saved to: {output}")

	else:
		print("Text Script Extractor")
		print()
		print("Usage:")
		print("  --extract ROM [-t TBL] -p ADDR -c COUNT -o OUT")
		print("  --insert SCRIPT -r ROM -o OUT")
		print("  --extract ROM --find -o OUT")


if __name__ == "__main__":
	main()
