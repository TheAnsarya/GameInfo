#!/usr/bin/env python3
"""
Script Inserter - Insert translated text scripts into ROMs

Handles pointer table updates, text encoding, and insertion
with support for multiple compression schemes.
"""

import argparse
import json
import re
import struct
import sys
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Union


class TextEncoder:
	"""Encodes text strings to ROM bytes."""

	def __init__(self, table_path: Optional[Path] = None):
		self.char_map: Dict[str, bytes] = {}
		self.control_codes: Dict[str, bytes] = {}
		self.end_byte = b'\x00'

		if table_path:
			self.load_table(table_path)

	def load_table(self, table_path: Path):
		"""Load character table from .tbl file."""
		content = table_path.read_text(encoding="utf-8", errors="replace")

		for line in content.split("\n"):
			line = line.strip()

			# Skip empty lines and comments
			if not line or line.startswith(";") or line.startswith("#"):
				continue

			# Remove inline comments
			if ";" in line:
				line = line.split(";")[0].strip()

			# Parse entry
			if "=" in line:
				parts = line.split("=", 1)
				hex_part = parts[0].strip()
				char_part = parts[1]

				# Convert hex to bytes
				try:
					if "-" in hex_part or "," in hex_part:
						# Multi-byte
						if "-" in hex_part:
							byte_list = [int(b.strip(), 16) for b in hex_part.split("-")]
						else:
							byte_list = [int(b.strip(), 16) for b in hex_part.split(",")]
						byte_val = bytes(byte_list)
					else:
						byte_val = bytes([int(hex_part, 16)])

					# Check for control code
					if char_part.startswith("[") and char_part.endswith("]"):
						self.control_codes[char_part] = byte_val
					else:
						self.char_map[char_part] = byte_val

				except ValueError:
					continue

	def encode(self, text: str, add_terminator: bool = True) -> bytes:
		"""Encode text string to bytes."""
		result = bytearray()
		i = 0

		while i < len(text):
			# Check for control codes [XXX]
			if text[i] == "[":
				end = text.find("]", i)
				if end != -1:
					code = text[i:end + 1]
					if code in self.control_codes:
						result.extend(self.control_codes[code])
						i = end + 1
						continue
					# Try raw hex [XX]
					hex_match = re.match(r'\[([0-9A-Fa-f]{2})\]', code)
					if hex_match:
						result.append(int(hex_match.group(1), 16))
						i = end + 1
						continue

			# Try multi-character matches (longest first)
			found = False
			for length in range(4, 0, -1):
				substr = text[i:i + length]
				if substr in self.char_map:
					result.extend(self.char_map[substr])
					i += length
					found = True
					break

			if not found:
				# Single character fallback
				char = text[i]
				if char in self.char_map:
					result.extend(self.char_map[char])
				else:
					# Use raw byte if it's ASCII
					if ord(char) < 256:
						result.append(ord(char))
					else:
						# Unknown character - use placeholder
						result.append(0x3F)  # '?'
				i += 1

		if add_terminator:
			result.extend(self.end_byte)

		return bytes(result)


class PointerTable:
	"""Manages pointer tables in ROM."""

	def __init__(
		self,
		base_address: int,
		pointer_size: int = 2,
		endian: str = "little",
		bank_byte: Optional[int] = None,
	):
		self.base_address = base_address
		self.pointer_size = pointer_size
		self.endian = endian
		self.bank_byte = bank_byte  # For 3-byte pointers
		self.pointers: List[int] = []

	def read_from_rom(self, rom_data: bytes, table_offset: int, count: int):
		"""Read pointers from ROM."""
		self.pointers = []

		for i in range(count):
			offset = table_offset + (i * self.pointer_size)
			if self.pointer_size == 2:
				if self.endian == "little":
					ptr = struct.unpack_from("<H", rom_data, offset)[0]
				else:
					ptr = struct.unpack_from(">H", rom_data, offset)[0]
			elif self.pointer_size == 3:
				if self.endian == "little":
					ptr = rom_data[offset] | (rom_data[offset + 1] << 8) | (rom_data[offset + 2] << 16)
				else:
					ptr = (rom_data[offset] << 16) | (rom_data[offset + 1] << 8) | rom_data[offset + 2]
			else:
				if self.endian == "little":
					ptr = struct.unpack_from("<I", rom_data, offset)[0]
				else:
					ptr = struct.unpack_from(">I", rom_data, offset)[0]

			self.pointers.append(ptr)

	def write_pointer(self, value: int) -> bytes:
		"""Convert pointer value to bytes."""
		if self.pointer_size == 2:
			if self.endian == "little":
				return struct.pack("<H", value & 0xFFFF)
			else:
				return struct.pack(">H", value & 0xFFFF)
		elif self.pointer_size == 3:
			if self.endian == "little":
				return bytes([value & 0xFF, (value >> 8) & 0xFF, (value >> 16) & 0xFF])
			else:
				return bytes([(value >> 16) & 0xFF, (value >> 8) & 0xFF, value & 0xFF])
		else:
			if self.endian == "little":
				return struct.pack("<I", value)
			else:
				return struct.pack(">I", value)

	def calculate_address(self, pointer: int) -> int:
		"""Calculate ROM address from pointer value."""
		# Handle NES banking
		if self.base_address:
			return (pointer - self.base_address)
		return pointer


class ScriptInserter:
	"""Inserts text scripts into ROMs."""

	def __init__(
		self,
		rom_path: Path,
		table_path: Optional[Path] = None,
	):
		self.rom_path = rom_path
		self.rom_data = bytearray(rom_path.read_bytes())
		self.encoder = TextEncoder(table_path)
		self.insertions: List[Dict] = []
		self.warnings: List[str] = []

	def insert_at_offset(
		self,
		offset: int,
		text: str,
		max_length: Optional[int] = None,
	) -> int:
		"""Insert text at specific offset."""
		encoded = self.encoder.encode(text)

		if max_length and len(encoded) > max_length:
			self.warnings.append(f"Text at ${offset:06X} exceeds max length ({len(encoded)} > {max_length})")
			encoded = encoded[:max_length]

		# Insert into ROM
		self.rom_data[offset:offset + len(encoded)] = encoded

		self.insertions.append({
			"offset": offset,
			"length": len(encoded),
			"text": text[:50] + "..." if len(text) > 50 else text,
		})

		return len(encoded)

	def insert_with_pointer(
		self,
		pointer_offset: int,
		text_offset: int,
		text: str,
		pointer_base: int = 0,
		pointer_size: int = 2,
		endian: str = "little",
	) -> int:
		"""Insert text and update pointer."""
		# Encode text
		encoded = self.encoder.encode(text)

		# Insert text
		self.rom_data[text_offset:text_offset + len(encoded)] = encoded

		# Calculate and write pointer
		ptr_value = text_offset + pointer_base
		ptr_table = PointerTable(pointer_base, pointer_size, endian)
		ptr_bytes = ptr_table.write_pointer(ptr_value)
		self.rom_data[pointer_offset:pointer_offset + pointer_size] = ptr_bytes

		self.insertions.append({
			"pointer_offset": pointer_offset,
			"text_offset": text_offset,
			"pointer_value": ptr_value,
			"length": len(encoded),
			"text": text[:50] + "..." if len(text) > 50 else text,
		})

		return len(encoded)

	def insert_script_file(
		self,
		script_path: Path,
		start_offset: int,
		pointer_table_offset: Optional[int] = None,
		pointer_base: int = 0,
		pointer_size: int = 2,
	):
		"""Insert script from JSON file."""
		script_data = json.loads(script_path.read_text(encoding="utf-8"))

		current_offset = start_offset
		pointer_index = 0

		for entry in script_data:
			text = entry.get("text", entry.get("translated", ""))
			if not text:
				continue

			# Encode text
			encoded = self.encoder.encode(text)

			# Check space
			max_offset = entry.get("max_offset")
			if max_offset and current_offset + len(encoded) > max_offset:
				self.warnings.append(f"Entry {pointer_index} exceeds available space")

			# Insert text
			self.rom_data[current_offset:current_offset + len(encoded)] = encoded

			# Update pointer if table provided
			if pointer_table_offset is not None:
				ptr_offset = pointer_table_offset + (pointer_index * pointer_size)
				ptr_value = current_offset + pointer_base
				ptr_table = PointerTable(pointer_base, pointer_size)
				ptr_bytes = ptr_table.write_pointer(ptr_value)
				self.rom_data[ptr_offset:ptr_offset + pointer_size] = ptr_bytes

			self.insertions.append({
				"index": pointer_index,
				"text_offset": current_offset,
				"length": len(encoded),
			})

			current_offset += len(encoded)
			pointer_index += 1

		return current_offset - start_offset

	def apply_patch_file(self, patch_path: Path):
		"""Apply patches from JSON patch file."""
		patches = json.loads(patch_path.read_text(encoding="utf-8"))

		for patch in patches:
			offset = patch.get("offset")
			if isinstance(offset, str):
				offset = int(offset, 16)

			patch_type = patch.get("type", "text")

			if patch_type == "text":
				text = patch.get("text", "")
				max_length = patch.get("max_length")
				self.insert_at_offset(offset, text, max_length)

			elif patch_type == "bytes":
				hex_data = patch.get("data", "")
				data = bytes.fromhex(hex_data.replace(" ", ""))
				self.rom_data[offset:offset + len(data)] = data
				self.insertions.append({
					"offset": offset,
					"length": len(data),
					"type": "raw_bytes",
				})

			elif patch_type == "pointer":
				ptr_value = patch.get("value")
				if isinstance(ptr_value, str):
					ptr_value = int(ptr_value, 16)
				ptr_size = patch.get("size", 2)
				ptr_table = PointerTable(0, ptr_size)
				ptr_bytes = ptr_table.write_pointer(ptr_value)
				self.rom_data[offset:offset + ptr_size] = ptr_bytes

	def save_rom(self, output_path: Path):
		"""Save modified ROM."""
		output_path.write_bytes(bytes(self.rom_data))

	def get_report(self) -> str:
		"""Generate insertion report."""
		lines = [
			"Script Insertion Report",
			"=" * 50,
			f"Total insertions: {len(self.insertions)}",
			"",
		]

		total_bytes = 0
		for ins in self.insertions:
			total_bytes += ins.get("length", 0)
			if "text_offset" in ins:
				lines.append(f"  ${ins['text_offset']:06X}: {ins['length']} bytes")
			elif "offset" in ins:
				lines.append(f"  ${ins['offset']:06X}: {ins['length']} bytes")

		lines.append("")
		lines.append(f"Total bytes inserted: {total_bytes:,}")

		if self.warnings:
			lines.append("")
			lines.append("Warnings:")
			for warning in self.warnings:
				lines.append(f"  - {warning}")

		return "\n".join(lines)


class ScriptDumper:
	"""Extracts text scripts from ROMs."""

	def __init__(
		self,
		rom_path: Path,
		table_path: Optional[Path] = None,
	):
		self.rom_path = rom_path
		self.rom_data = rom_path.read_bytes()
		self.char_map: Dict[int, str] = {}
		self.multi_byte: Dict[Tuple[int, ...], str] = {}
		self.end_bytes = {0x00}

		if table_path:
			self.load_table(table_path)

	def load_table(self, table_path: Path):
		"""Load character table."""
		content = table_path.read_text(encoding="utf-8", errors="replace")

		for line in content.split("\n"):
			line = line.strip()
			if not line or line.startswith(";") or line.startswith("#"):
				continue
			if ";" in line:
				line = line.split(";")[0].strip()

			if "=" in line:
				parts = line.split("=", 1)
				hex_part = parts[0].strip()
				char_part = parts[1]

				try:
					if "-" in hex_part:
						byte_list = tuple(int(b.strip(), 16) for b in hex_part.split("-"))
						self.multi_byte[byte_list] = char_part
					else:
						byte_val = int(hex_part, 16)
						self.char_map[byte_val] = char_part
				except ValueError:
					continue

	def decode_string(self, offset: int, max_length: int = 1000) -> Tuple[str, int]:
		"""Decode string at offset."""
		result = []
		i = offset

		while i < len(self.rom_data) and i < offset + max_length:
			byte_val = self.rom_data[i]

			# Check end byte
			if byte_val in self.end_bytes:
				i += 1
				break

			# Try multi-byte
			found = False
			for length in range(4, 1, -1):
				if i + length <= len(self.rom_data):
					seq = tuple(self.rom_data[i:i + length])
					if seq in self.multi_byte:
						result.append(self.multi_byte[seq])
						i += length
						found = True
						break

			if not found:
				if byte_val in self.char_map:
					result.append(self.char_map[byte_val])
				else:
					result.append(f"[{byte_val:02X}]")
				i += 1

		return "".join(result), i - offset

	def dump_pointer_table(
		self,
		table_offset: int,
		count: int,
		pointer_base: int = 0,
		pointer_size: int = 2,
		text_bank_offset: int = 0,
	) -> List[Dict]:
		"""Dump strings from pointer table."""
		entries = []

		for i in range(count):
			ptr_offset = table_offset + (i * pointer_size)

			# Read pointer
			if pointer_size == 2:
				ptr = struct.unpack_from("<H", self.rom_data, ptr_offset)[0]
			elif pointer_size == 3:
				ptr = self.rom_data[ptr_offset] | (self.rom_data[ptr_offset + 1] << 8) | (self.rom_data[ptr_offset + 2] << 16)
			else:
				ptr = struct.unpack_from("<I", self.rom_data, ptr_offset)[0]

			# Calculate ROM offset
			text_offset = ptr - pointer_base + text_bank_offset

			# Decode string
			if 0 <= text_offset < len(self.rom_data):
				text, length = self.decode_string(text_offset)
				entries.append({
					"index": i,
					"pointer_offset": ptr_offset,
					"pointer_value": ptr,
					"text_offset": text_offset,
					"length": length,
					"original": text,
					"translated": "",
				})
			else:
				entries.append({
					"index": i,
					"pointer_offset": ptr_offset,
					"pointer_value": ptr,
					"text_offset": text_offset,
					"error": "Invalid pointer",
				})

		return entries


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Script Inserter - Insert translated text into ROMs",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# Insert single string
	python script_inserter.py insert rom.nes -t table.tbl --offset 0x8000 --text "Hello World"

	# Insert script file
	python script_inserter.py script rom.nes -t table.tbl --script script.json --start 0x8000

	# Apply patch file
	python script_inserter.py patch rom.nes -t table.tbl --patches patches.json -o patched.nes

	# Dump pointer table
	python script_inserter.py dump rom.nes -t table.tbl --table 0x8000 --count 100 -o strings.json
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Insert command
	insert_parser = subparsers.add_parser("insert", help="Insert single string")
	insert_parser.add_argument("rom", help="Input ROM file")
	insert_parser.add_argument("-t", "--table", help="Text table file")
	insert_parser.add_argument("--offset", required=True, help="Insertion offset (hex)")
	insert_parser.add_argument("--text", required=True, help="Text to insert")
	insert_parser.add_argument("--max-length", type=int, help="Maximum length")
	insert_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Script command
	script_parser = subparsers.add_parser("script", help="Insert script file")
	script_parser.add_argument("rom", help="Input ROM file")
	script_parser.add_argument("-t", "--table", help="Text table file")
	script_parser.add_argument("--script", required=True, help="Script JSON file")
	script_parser.add_argument("--start", required=True, help="Start offset (hex)")
	script_parser.add_argument("--pointer-table", help="Pointer table offset (hex)")
	script_parser.add_argument("--pointer-base", default="0", help="Pointer base address (hex)")
	script_parser.add_argument("--pointer-size", type=int, default=2, help="Pointer size")
	script_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Patch command
	patch_parser = subparsers.add_parser("patch", help="Apply patch file")
	patch_parser.add_argument("rom", help="Input ROM file")
	patch_parser.add_argument("-t", "--table", help="Text table file")
	patch_parser.add_argument("--patches", required=True, help="Patches JSON file")
	patch_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Dump command
	dump_parser = subparsers.add_parser("dump", help="Dump strings from ROM")
	dump_parser.add_argument("rom", help="Input ROM file")
	dump_parser.add_argument("-t", "--table", help="Text table file")
	dump_parser.add_argument("--table-offset", required=True, help="Pointer table offset (hex)")
	dump_parser.add_argument("--count", type=int, required=True, help="Number of pointers")
	dump_parser.add_argument("--pointer-base", default="0", help="Pointer base (hex)")
	dump_parser.add_argument("--pointer-size", type=int, default=2, help="Pointer size")
	dump_parser.add_argument("--text-bank", default="0", help="Text bank offset (hex)")
	dump_parser.add_argument("-o", "--output", required=True, help="Output JSON file")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	rom_path = Path(args.rom)
	if not rom_path.exists():
		print(f"Error: ROM file not found: {rom_path}", file=sys.stderr)
		return 1

	table_path = Path(args.table) if args.table else None
	if table_path and not table_path.exists():
		print(f"Error: Table file not found: {table_path}", file=sys.stderr)
		return 1

	try:
		if args.command == "insert":
			inserter = ScriptInserter(rom_path, table_path)
			offset = int(args.offset, 16)
			length = inserter.insert_at_offset(offset, args.text, args.max_length)
			inserter.save_rom(Path(args.output))
			print(f"Inserted {length} bytes at ${offset:06X}")
			print(f"Saved: {args.output}")

		elif args.command == "script":
			inserter = ScriptInserter(rom_path, table_path)
			script_path = Path(args.script)
			start_offset = int(args.start, 16)
			pointer_table = int(args.pointer_table, 16) if args.pointer_table else None
			pointer_base = int(args.pointer_base, 16)

			total = inserter.insert_script_file(
				script_path,
				start_offset,
				pointer_table,
				pointer_base,
				args.pointer_size,
			)
			inserter.save_rom(Path(args.output))
			print(inserter.get_report())
			print(f"\nSaved: {args.output}")

		elif args.command == "patch":
			inserter = ScriptInserter(rom_path, table_path)
			inserter.apply_patch_file(Path(args.patches))
			inserter.save_rom(Path(args.output))
			print(inserter.get_report())
			print(f"\nSaved: {args.output}")

		elif args.command == "dump":
			dumper = ScriptDumper(rom_path, table_path)
			table_offset = int(args.table_offset, 16)
			pointer_base = int(args.pointer_base, 16)
			text_bank = int(args.text_bank, 16)

			entries = dumper.dump_pointer_table(
				table_offset,
				args.count,
				pointer_base,
				args.pointer_size,
				text_bank,
			)

			output_path = Path(args.output)
			output_path.write_text(
				json.dumps(entries, indent="\t", ensure_ascii=False),
				encoding="utf-8",
			)
			print(f"Dumped {len(entries)} strings to {args.output}")

	except Exception as e:
		print(f"Error: {e}", file=sys.stderr)
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
