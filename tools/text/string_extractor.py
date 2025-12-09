#!/usr/bin/env python3
"""
String Extractor - Extract and catalog text strings from ROMs.

Finds and extracts text strings using various encoding methods,
with support for custom text tables and control codes.

Usage:
	python string_extractor.py <rom_file> --tbl encoding.tbl
	python string_extractor.py <rom_file> --auto-detect

Features:
	- Extract with custom TBL files
	- Auto-detect string locations
	- Follow pointer tables
	- Export in multiple formats
	- Generate script files
"""

import argparse
import json
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


@dataclass
class ExtractedString:
	"""An extracted text string."""
	offset: int
	text: str
	raw_bytes: bytes
	length: int
	terminator: int = 0
	pointer_refs: List[int] = field(default_factory=list)
	context: str = ""

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"offset": f"0x{self.offset:06X}",
			"text": self.text,
			"length": self.length,
			"raw_hex": " ".join(f"{b:02X}" for b in self.raw_bytes[:64]),
			"terminator": f"0x{self.terminator:02X}",
			"references": [f"0x{r:06X}" for r in self.pointer_refs],
			"context": self.context
		}


@dataclass
class TextTable:
	"""Text encoding table."""
	mappings: Dict[int, str] = field(default_factory=dict)
	multi_byte: Dict[bytes, str] = field(default_factory=dict)
	control_codes: Dict[int, str] = field(default_factory=dict)
	terminators: Set[int] = field(default_factory=lambda: {0x00})
	dte_entries: Dict[int, str] = field(default_factory=dict)

	def load_tbl(self, filepath: str) -> None:
		"""Load from TBL file."""
		with open(filepath, "r", encoding="utf-8") as f:
			for line in f:
				line = line.strip()

				# Skip comments and empty lines
				if not line or line.startswith(";") or line.startswith("//"):
					continue

				# Parse mapping
				if "=" in line:
					# Remove inline comments
					if ";" in line:
						line = line[:line.index(";")].strip()
					if "//" in line:
						line = line[:line.index("//")].strip()

					hex_part, char_part = line.split("=", 1)
					hex_part = hex_part.strip()

					try:
						# Multi-byte sequence
						if len(hex_part) > 2:
							byte_seq = bytes.fromhex(hex_part)
							self.multi_byte[byte_seq] = char_part
						else:
							byte_val = int(hex_part, 16)

							# Control code
							if char_part.startswith("<") and char_part.endswith(">"):
								self.control_codes[byte_val] = char_part
								if char_part in ("<END>", "<end>", "<NULL>"):
									self.terminators.add(byte_val)
							# DTE (multi-char mapping)
							elif len(char_part) > 1:
								self.dte_entries[byte_val] = char_part
							else:
								self.mappings[byte_val] = char_part
					except ValueError:
						pass

	def decode_byte(self, byte_val: int) -> Tuple[str, bool]:
		"""
		Decode a single byte.
		Returns (decoded_string, is_terminator).
		"""
		if byte_val in self.terminators:
			return "", True

		if byte_val in self.control_codes:
			return self.control_codes[byte_val], False

		if byte_val in self.dte_entries:
			return self.dte_entries[byte_val], False

		if byte_val in self.mappings:
			return self.mappings[byte_val], False

		return f"[{byte_val:02X}]", False


class StringExtractor:
	"""Extract text strings from ROM data."""

	def __init__(self, rom_data: bytes, text_table: Optional[TextTable] = None):
		self.rom_data = rom_data
		self.table = text_table or TextTable()
		self.strings: List[ExtractedString] = []

		# Default ASCII table if none provided
		if not self.table.mappings:
			self._init_ascii_table()

	def _init_ascii_table(self) -> None:
		"""Initialize with basic ASCII mapping."""
		for i in range(0x20, 0x7F):
			self.table.mappings[i] = chr(i)
		self.table.terminators.add(0x00)

	def extract_at(self, offset: int, max_length: int = 256,
				   context: str = "") -> Optional[ExtractedString]:
		"""Extract string at specific offset."""
		if offset >= len(self.rom_data):
			return None

		text_parts = []
		raw_bytes = bytearray()
		pos = offset

		while pos < len(self.rom_data) and len(raw_bytes) < max_length:
			byte_val = self.rom_data[pos]
			raw_bytes.append(byte_val)

			# Check for multi-byte sequences
			found_multi = False
			for seq_len in range(4, 0, -1):
				if pos + seq_len <= len(self.rom_data):
					seq = bytes(self.rom_data[pos:pos + seq_len])
					if seq in self.table.multi_byte:
						text_parts.append(self.table.multi_byte[seq])
						raw_bytes.extend(self.rom_data[pos + 1:pos + seq_len])
						pos += seq_len
						found_multi = True
						break

			if found_multi:
				continue

			# Single byte decode
			decoded, is_term = self.table.decode_byte(byte_val)

			if is_term:
				break

			text_parts.append(decoded)
			pos += 1

		text = "".join(text_parts)

		# Validate - must have some printable content
		printable = sum(1 for c in text if c.isprintable() and c not in "[]<>")
		if printable < 2:
			return None

		return ExtractedString(
			offset=offset,
			text=text,
			raw_bytes=bytes(raw_bytes),
			length=len(raw_bytes),
			terminator=self.rom_data[pos] if pos < len(self.rom_data) else 0,
			context=context
		)

	def extract_range(self, start: int, end: int,
					  skip_overlaps: bool = True) -> List[ExtractedString]:
		"""Extract all strings in a range."""
		strings = []
		offset = start

		while offset < end:
			s = self.extract_at(offset)

			if s and s.length > 2:
				strings.append(s)
				if skip_overlaps:
					offset = s.offset + s.length + 1
				else:
					offset += 1
			else:
				offset += 1

		return strings

	def find_strings(self, min_length: int = 4,
					 min_printable_ratio: float = 0.7) -> List[ExtractedString]:
		"""Find all strings in ROM using heuristics."""
		strings = []
		checked = set()

		# Find potential string starts
		for offset in range(len(self.rom_data) - min_length):
			if offset in checked:
				continue

			# Quick check: first few bytes should be valid
			valid_start = True
			for i in range(min(3, min_length)):
				byte_val = self.rom_data[offset + i]
				if byte_val in self.table.terminators:
					valid_start = False
					break
				if byte_val not in self.table.mappings and byte_val not in self.table.dte_entries:
					# Allow control codes at start
					if byte_val not in self.table.control_codes:
						valid_start = False
						break

			if not valid_start:
				continue

			# Try to extract
			s = self.extract_at(offset)

			if s and s.length >= min_length:
				# Check printable ratio
				printable = sum(1 for c in s.text if c.isprintable())
				ratio = printable / len(s.text) if s.text else 0

				if ratio >= min_printable_ratio:
					strings.append(s)

					# Mark bytes as checked
					for i in range(s.length):
						checked.add(offset + i)

		self.strings = strings
		return strings

	def extract_from_pointers(self, pointer_table_offset: int,
							  pointer_count: int,
							  pointer_size: int = 2,
							  base_address: int = 0) -> List[ExtractedString]:
		"""Extract strings referenced by a pointer table."""
		strings = []

		for i in range(pointer_count):
			ptr_offset = pointer_table_offset + i * pointer_size

			if ptr_offset + pointer_size > len(self.rom_data):
				break

			# Read pointer
			if pointer_size == 2:
				ptr_value = struct.unpack_from("<H", self.rom_data, ptr_offset)[0]
			else:
				ptr_value = struct.unpack_from("<I", self.rom_data, ptr_offset)[0]
				ptr_value &= 0xFFFFFF

			# Calculate ROM offset
			string_offset = ptr_value
			if base_address:
				string_offset = ptr_value - base_address

			if 0 <= string_offset < len(self.rom_data):
				s = self.extract_at(string_offset, context=f"pointer_table_{i}")
				if s:
					s.pointer_refs.append(ptr_offset)
					strings.append(s)

		return strings

	def export_script(self, filepath: str, format_type: str = "atlas") -> None:
		"""Export strings as script file."""
		with open(filepath, "w", encoding="utf-8") as f:
			if format_type == "atlas":
				# Atlas script format
				for s in self.strings:
					f.write(f"#${s.offset:06X}\n")
					f.write(f"{s.text}\n")
					f.write("\n")

			elif format_type == "csv":
				# CSV format
				f.write("offset,length,text,context\n")
				for s in self.strings:
					text_escaped = s.text.replace('"', '""')
					f.write(f'0x{s.offset:06X},{s.length},"{text_escaped}","{s.context}"\n')

			elif format_type == "json":
				# JSON format
				data = [s.to_dict() for s in self.strings]
				json.dump(data, f, indent="\t", ensure_ascii=False)

			else:  # plain text
				for s in self.strings:
					f.write(f"[0x{s.offset:06X}] {s.text}\n")

	def generate_stats(self) -> Dict[str, Any]:
		"""Generate statistics about extracted strings."""
		if not self.strings:
			return {}

		total_chars = sum(len(s.text) for s in self.strings)
		total_bytes = sum(s.length for s in self.strings)

		# Character frequency
		char_freq: Dict[str, int] = {}
		for s in self.strings:
			for c in s.text:
				char_freq[c] = char_freq.get(c, 0) + 1

		# Most common characters
		sorted_chars = sorted(char_freq.items(), key=lambda x: x[1], reverse=True)

		return {
			"string_count": len(self.strings),
			"total_characters": total_chars,
			"total_bytes": total_bytes,
			"avg_length": total_chars / len(self.strings),
			"unique_chars": len(char_freq),
			"most_common_chars": sorted_chars[:20],
			"compression_ratio": total_chars / total_bytes if total_bytes else 0
		}


def auto_detect_strings(rom_data: bytes) -> Tuple[List[ExtractedString], TextTable]:
	"""Auto-detect strings without a table file."""
	# Try ASCII first
	ascii_table = TextTable()
	for i in range(0x20, 0x7F):
		ascii_table.mappings[i] = chr(i)
	ascii_table.terminators.add(0x00)

	extractor = StringExtractor(rom_data, ascii_table)
	ascii_strings = extractor.find_strings(min_length=6, min_printable_ratio=0.8)

	# Try uppercase only
	upper_table = TextTable()
	for i, c in enumerate("ABCDEFGHIJKLMNOPQRSTUVWXYZ"):
		upper_table.mappings[0x80 + i] = c
	upper_table.mappings[0x9A] = " "
	upper_table.terminators.add(0xFF)
	upper_table.terminators.add(0x00)

	upper_extractor = StringExtractor(rom_data, upper_table)
	upper_strings = upper_extractor.find_strings(min_length=4)

	# Return whichever found more strings
	if len(upper_strings) > len(ascii_strings) * 1.5:
		return upper_strings, upper_table
	else:
		return ascii_strings, ascii_table


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="String Extractor")
	parser.add_argument("rom", help="ROM file to extract from")
	parser.add_argument("--tbl", "-t", help="Text table file")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--format", "-f",
						choices=["text", "atlas", "csv", "json"],
						default="text", help="Output format")
	parser.add_argument("--auto-detect", "-a", action="store_true",
						help="Auto-detect encoding")
	parser.add_argument("--offset", type=lambda x: int(x, 0),
						help="Extract at specific offset")
	parser.add_argument("--range", nargs=2, type=lambda x: int(x, 0),
						metavar=("START", "END"),
						help="Extract from range")
	parser.add_argument("--pointers", type=lambda x: int(x, 0),
						help="Pointer table offset")
	parser.add_argument("--pointer-count", type=int, default=256,
						help="Number of pointers")
	parser.add_argument("--min-length", type=int, default=4,
						help="Minimum string length")
	parser.add_argument("--stats", action="store_true",
						help="Show statistics")
	parser.add_argument("--verbose", "-v", action="store_true")

	args = parser.parse_args()

	if not os.path.exists(args.rom):
		print(f"Error: ROM file not found: {args.rom}")
		sys.exit(1)

	# Load ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()

	print(f"ROM: {args.rom}")
	print(f"Size: {len(rom_data):,} bytes")

	# Load text table
	table = TextTable()
	if args.tbl:
		if os.path.exists(args.tbl):
			table.load_tbl(args.tbl)
			print(f"Loaded table: {args.tbl}")
			print(f"  Mappings: {len(table.mappings)}")
			print(f"  DTE entries: {len(table.dte_entries)}")
			print(f"  Control codes: {len(table.control_codes)}")
		else:
			print(f"Warning: Table file not found: {args.tbl}")

	print()

	# Auto-detect if requested
	if args.auto_detect:
		print("Auto-detecting encoding...")
		strings, detected_table = auto_detect_strings(rom_data)
		print(f"Found {len(strings)} strings")

		if args.output:
			extractor = StringExtractor(rom_data, detected_table)
			extractor.strings = strings
			extractor.export_script(args.output, args.format)
			print(f"Exported to: {args.output}")
		else:
			for s in strings[:30]:
				print(f"[0x{s.offset:06X}] {s.text[:60]}")
			if len(strings) > 30:
				print(f"... and {len(strings) - 30} more")
		return

	extractor = StringExtractor(rom_data, table)

	# Extract based on options
	if args.offset is not None:
		s = extractor.extract_at(args.offset)
		if s:
			print(f"String at 0x{args.offset:06X}:")
			print(f"  Text: {s.text}")
			print(f"  Length: {s.length} bytes")
			print(f"  Raw: {' '.join(f'{b:02X}' for b in s.raw_bytes[:32])}")
		else:
			print("No valid string at that offset")

	elif args.range:
		strings = extractor.extract_range(args.range[0], args.range[1])
		print(f"Found {len(strings)} strings in range")

		for s in strings[:30]:
			print(f"[0x{s.offset:06X}] {s.text[:60]}")

	elif args.pointers is not None:
		strings = extractor.extract_from_pointers(
			args.pointers,
			args.pointer_count
		)
		print(f"Extracted {len(strings)} strings from pointer table")

		for s in strings[:30]:
			print(f"[0x{s.offset:06X}] {s.text[:60]}")

	else:
		# Find all strings
		strings = extractor.find_strings(min_length=args.min_length)
		print(f"Found {len(strings)} strings")

		if args.stats:
			stats = extractor.generate_stats()
			print(f"\nStatistics:")
			print(f"  Total strings: {stats['string_count']}")
			print(f"  Total characters: {stats['total_characters']}")
			print(f"  Total bytes: {stats['total_bytes']}")
			print(f"  Average length: {stats['avg_length']:.1f}")
			print(f"  Unique characters: {stats['unique_chars']}")

		if args.verbose:
			for s in strings[:50]:
				print(f"[0x{s.offset:06X}] {s.text[:60]}")

	# Export if output specified
	if args.output:
		extractor.export_script(args.output, args.format)
		print(f"\nExported to: {args.output}")


if __name__ == "__main__":
	main()
