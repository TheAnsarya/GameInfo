#!/usr/bin/env python3
"""
Memory Watch Viewer - Parse and display emulator memory watch files.

Supports:
- Mesen watch files (.mwf)
- FCEUX watch files
- BizHawk watch files
- Custom watch file formats

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import re
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any


class WatchType(Enum):
	"""Watch value types."""
	BYTE = "byte"
	WORD = "word"           # 16-bit
	DWORD = "dword"         # 32-bit
	SIGNED_BYTE = "sbyte"
	SIGNED_WORD = "sword"
	SIGNED_DWORD = "sdword"
	HEX_BYTE = "hexbyte"
	HEX_WORD = "hexword"
	BINARY = "binary"
	TEXT = "text"


class MemoryDomain(Enum):
	"""Memory domains."""
	RAM = "ram"
	VRAM = "vram"
	OAM = "oam"
	ROM = "rom"
	SRAM = "sram"
	WRAM = "wram"
	HRAM = "hram"           # GB high RAM
	SYSTEM_BUS = "systembus"


@dataclass
class Watch:
	"""Represents a memory watch."""
	address: int
	name: str
	watch_type: WatchType = WatchType.BYTE
	domain: MemoryDomain = MemoryDomain.RAM
	size: int = 1
	big_endian: bool = False
	notes: str = ""
	category: str = ""

	def format_value(self, value: int) -> str:
		"""Format value according to watch type."""
		if self.watch_type == WatchType.BYTE:
			return str(value & 0xFF)
		elif self.watch_type == WatchType.WORD:
			return str(value & 0xFFFF)
		elif self.watch_type == WatchType.DWORD:
			return str(value & 0xFFFFFFFF)
		elif self.watch_type == WatchType.SIGNED_BYTE:
			v = value & 0xFF
			return str(v if v < 128 else v - 256)
		elif self.watch_type == WatchType.SIGNED_WORD:
			v = value & 0xFFFF
			return str(v if v < 32768 else v - 65536)
		elif self.watch_type == WatchType.HEX_BYTE:
			return f"${value & 0xFF:02X}"
		elif self.watch_type == WatchType.HEX_WORD:
			return f"${value & 0xFFFF:04X}"
		elif self.watch_type == WatchType.BINARY:
			return f"%{value & 0xFF:08b}"
		else:
			return str(value)


@dataclass
class WatchList:
	"""Collection of memory watches."""
	name: str = "Watch List"
	watches: List[Watch] = field(default_factory=list)

	def add(self, watch: Watch) -> None:
		"""Add a watch."""
		self.watches.append(watch)

	def remove(self, address: int) -> bool:
		"""Remove watch by address."""
		for i, watch in enumerate(self.watches):
			if watch.address == address:
				del self.watches[i]
				return True
		return False

	def find(self, address: int) -> Optional[Watch]:
		"""Find watch by address."""
		for watch in self.watches:
			if watch.address == address:
				return watch
		return None

	def get_by_category(self, category: str) -> List[Watch]:
		"""Get watches by category."""
		return [w for w in self.watches if w.category == category]

	def get_categories(self) -> List[str]:
		"""Get unique categories."""
		return sorted(set(w.category for w in self.watches if w.category))


class MesenWatchParser:
	"""Parse Mesen watch files."""

	def parse(self, content: str) -> WatchList:
		"""Parse Mesen watch file content."""
		watch_list = WatchList(name="Mesen Watches")

		for line in content.split('\n'):
			line = line.strip()
			if not line or line.startswith('#'):
				continue

			# Mesen format: Address,Name,Type,Domain
			parts = line.split(',')
			if len(parts) >= 2:
				try:
					address = int(parts[0], 16)
					name = parts[1] if len(parts) > 1 else f"Watch_{address:04X}"

					watch_type = WatchType.BYTE
					if len(parts) > 2:
						type_str = parts[2].lower()
						if 'word' in type_str or '16' in type_str:
							watch_type = WatchType.WORD
						elif 'signed' in type_str:
							watch_type = WatchType.SIGNED_BYTE

					watch = Watch(
						address=address,
						name=name,
						watch_type=watch_type
					)
					watch_list.add(watch)
				except ValueError:
					continue

		return watch_list

	def export(self, watch_list: WatchList) -> str:
		"""Export to Mesen format."""
		lines = []

		for watch in watch_list.watches:
			type_str = "Byte"
			if watch.watch_type == WatchType.WORD:
				type_str = "Word"
			elif watch.watch_type == WatchType.DWORD:
				type_str = "DWord"

			lines.append(f"{watch.address:04X},{watch.name},{type_str},RAM")

		return '\n'.join(lines)


class FCEUXWatchParser:
	"""Parse FCEUX watch files."""

	def parse(self, content: str) -> WatchList:
		"""Parse FCEUX watch file content."""
		watch_list = WatchList(name="FCEUX Watches")

		for line in content.split('\n'):
			line = line.strip()
			if not line or line.startswith(';'):
				continue

			# FCEUX format varies, try common patterns
			# Format 1: ADDRESS NAME
			# Format 2: ADDRESS,NAME,TYPE

			parts = re.split(r'[\s,]+', line, maxsplit=2)
			if len(parts) >= 1:
				try:
					# Try parsing address
					addr_str = parts[0].lstrip('$').lstrip('0x')
					address = int(addr_str, 16)
					name = parts[1] if len(parts) > 1 else f"Watch_{address:04X}"

					watch = Watch(
						address=address,
						name=name,
						watch_type=WatchType.BYTE
					)
					watch_list.add(watch)
				except ValueError:
					continue

		return watch_list

	def export(self, watch_list: WatchList) -> str:
		"""Export to FCEUX format."""
		lines = []

		for watch in watch_list.watches:
			lines.append(f"${watch.address:04X} {watch.name}")

		return '\n'.join(lines)


class BizHawkWatchParser:
	"""Parse BizHawk watch files."""

	def parse(self, content: str) -> WatchList:
		"""Parse BizHawk watch file content."""
		watch_list = WatchList(name="BizHawk Watches")

		# BizHawk uses a specific format
		# SystemID Name Address Size Type BigEndian Domain Notes

		for line in content.split('\n'):
			line = line.strip()
			if not line or line.startswith('#'):
				continue

			parts = line.split('\t')
			if len(parts) >= 4:
				try:
					name = parts[1]
					address = int(parts[2], 16)
					size = int(parts[3])

					watch_type = WatchType.BYTE
					if size == 2:
						watch_type = WatchType.WORD
					elif size == 4:
						watch_type = WatchType.DWORD

					watch = Watch(
						address=address,
						name=name,
						watch_type=watch_type,
						size=size,
						notes=parts[7] if len(parts) > 7 else ""
					)
					watch_list.add(watch)
				except (ValueError, IndexError):
					continue

		return watch_list

	def export(self, watch_list: WatchList, system_id: str = "NES") -> str:
		"""Export to BizHawk format."""
		lines = []

		for watch in watch_list.watches:
			size = 1
			type_char = 'b'

			if watch.watch_type in (WatchType.WORD, WatchType.SIGNED_WORD, WatchType.HEX_WORD):
				size = 2
				type_char = 'w'
			elif watch.watch_type in (WatchType.DWORD, WatchType.SIGNED_DWORD):
				size = 4
				type_char = 'd'

			big_endian = 'True' if watch.big_endian else 'False'

			lines.append(f"{system_id}\t{watch.name}\t{watch.address:04X}\t{size}\t{type_char}\t{big_endian}\tRAM\t{watch.notes}")

		return '\n'.join(lines)


class JSONWatchParser:
	"""Parse JSON watch files."""

	def parse(self, content: str) -> WatchList:
		"""Parse JSON watch file content."""
		data = json.loads(content)

		watch_list = WatchList(name=data.get("name", "Watch List"))

		for watch_data in data.get("watches", []):
			address = watch_data["address"]
			if isinstance(address, str):
				address = int(address, 16)

			watch_type = WatchType.BYTE
			type_str = watch_data.get("type", "byte").lower()
			for wt in WatchType:
				if wt.value == type_str:
					watch_type = wt
					break

			domain = MemoryDomain.RAM
			domain_str = watch_data.get("domain", "ram").lower()
			for md in MemoryDomain:
				if md.value == domain_str:
					domain = md
					break

			watch = Watch(
				address=address,
				name=watch_data.get("name", f"Watch_{address:04X}"),
				watch_type=watch_type,
				domain=domain,
				size=watch_data.get("size", 1),
				big_endian=watch_data.get("big_endian", False),
				notes=watch_data.get("notes", ""),
				category=watch_data.get("category", "")
			)
			watch_list.add(watch)

		return watch_list

	def export(self, watch_list: WatchList) -> str:
		"""Export to JSON format."""
		data = {
			"name": watch_list.name,
			"watches": [
				{
					"address": f"0x{w.address:04X}",
					"name": w.name,
					"type": w.watch_type.value,
					"domain": w.domain.value,
					"size": w.size,
					"big_endian": w.big_endian,
					"notes": w.notes,
					"category": w.category
				}
				for w in watch_list.watches
			]
		}
		return json.dumps(data, indent='\t')


def detect_format(content: str) -> str:
	"""Detect watch file format."""
	lines = content.strip().split('\n')

	# Check for JSON
	if content.strip().startswith('{'):
		return "json"

	# Check for BizHawk (tab-separated with system ID)
	for line in lines[:5]:
		if '\t' in line and line.split('\t')[0] in ('NES', 'SNES', 'GB', 'GBC', 'GBA'):
			return "bizhawk"

	# Check for Mesen (comma-separated with hex address)
	for line in lines[:5]:
		if ',' in line:
			parts = line.split(',')
			try:
				int(parts[0], 16)
				return "mesen"
			except ValueError:
				pass

	# Default to FCEUX
	return "fceux"


def format_watch_list(watch_list: WatchList, group_by_category: bool = False) -> str:
	"""Format watch list for display."""
	lines = [f"Watch List: {watch_list.name}", f"Total: {len(watch_list.watches)} watches", ""]

	if group_by_category and watch_list.get_categories():
		# Group by category
		categorized = {}
		uncategorized = []

		for watch in watch_list.watches:
			if watch.category:
				if watch.category not in categorized:
					categorized[watch.category] = []
				categorized[watch.category].append(watch)
			else:
				uncategorized.append(watch)

		for category in sorted(categorized.keys()):
			lines.append(f"[{category}]")
			for watch in categorized[category]:
				lines.append(f"  ${watch.address:04X}  {watch.name:<30} ({watch.watch_type.value})")
			lines.append("")

		if uncategorized:
			lines.append("[Uncategorized]")
			for watch in uncategorized:
				lines.append(f"  ${watch.address:04X}  {watch.name:<30} ({watch.watch_type.value})")
	else:
		# Simple list sorted by address
		for watch in sorted(watch_list.watches, key=lambda w: w.address):
			type_str = watch.watch_type.value[:4]
			lines.append(f"  ${watch.address:04X}  {watch.name:<30} {type_str}")
			if watch.notes:
				lines.append(f"          ; {watch.notes}")

	return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Parse and convert memory watch files",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s view watches.mwf                    # View watch file
  %(prog)s convert watches.mwf -o watches.json # Convert to JSON
  %(prog)s merge file1.mwf file2.mwf -o all.json
  %(prog)s create -o watches.json              # Create new watch file
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# View command
	view_parser = subparsers.add_parser("view", help="View watch file")
	view_parser.add_argument("file", help="Watch file")
	view_parser.add_argument("-f", "--format", choices=["mesen", "fceux", "bizhawk", "json"],
		help="File format (auto-detect if not specified)")
	view_parser.add_argument("-g", "--group", action="store_true", help="Group by category")

	# Convert command
	convert_parser = subparsers.add_parser("convert", help="Convert watch file format")
	convert_parser.add_argument("input", help="Input file")
	convert_parser.add_argument("-o", "--output", required=True, help="Output file")
	convert_parser.add_argument("-f", "--format", choices=["mesen", "fceux", "bizhawk", "json"],
		help="Output format (auto-detect from extension if not specified)")
	convert_parser.add_argument("--system", default="NES", help="System ID for BizHawk export")

	# Merge command
	merge_parser = subparsers.add_parser("merge", help="Merge multiple watch files")
	merge_parser.add_argument("files", nargs="+", help="Input files")
	merge_parser.add_argument("-o", "--output", required=True, help="Output file")
	merge_parser.add_argument("-f", "--format", choices=["mesen", "fceux", "bizhawk", "json"],
		default="json", help="Output format")

	# Create command
	create_parser = subparsers.add_parser("create", help="Create new watch file")
	create_parser.add_argument("-o", "--output", required=True, help="Output file")
	create_parser.add_argument("-n", "--name", default="Watch List", help="List name")
	create_parser.add_argument("-a", "--add", nargs="+", help="Add watches (address:name)")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	parsers = {
		"mesen": MesenWatchParser(),
		"fceux": FCEUXWatchParser(),
		"bizhawk": BizHawkWatchParser(),
		"json": JSONWatchParser()
	}

	try:
		if args.command == "view":
			content = Path(args.file).read_text(encoding='utf-8')
			format_type = args.format or detect_format(content)

			watch_list = parsers[format_type].parse(content)
			print(format_watch_list(watch_list, args.group))

		elif args.command == "convert":
			content = Path(args.input).read_text(encoding='utf-8')
			in_format = detect_format(content)

			# Determine output format
			out_format = args.format
			if not out_format:
				ext = Path(args.output).suffix.lower()
				if ext == '.json':
					out_format = 'json'
				elif ext == '.mwf':
					out_format = 'mesen'
				elif ext == '.wch':
					out_format = 'fceux'
				else:
					out_format = 'json'

			# Parse and export
			watch_list = parsers[in_format].parse(content)

			if out_format == "bizhawk":
				output = parsers[out_format].export(watch_list, args.system)
			else:
				output = parsers[out_format].export(watch_list)

			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Converted {len(watch_list.watches)} watches: {args.input} -> {args.output}")

		elif args.command == "merge":
			merged = WatchList(name="Merged Watches")
			addresses_seen = set()

			for file_path in args.files:
				content = Path(file_path).read_text(encoding='utf-8')
				format_type = detect_format(content)
				watch_list = parsers[format_type].parse(content)

				for watch in watch_list.watches:
					if watch.address not in addresses_seen:
						merged.add(watch)
						addresses_seen.add(watch.address)

			output = parsers[args.format].export(merged)
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Merged {len(merged.watches)} watches from {len(args.files)} files")

		elif args.command == "create":
			watch_list = WatchList(name=args.name)

			if args.add:
				for entry in args.add:
					parts = entry.split(':')
					address = int(parts[0], 16)
					name = parts[1] if len(parts) > 1 else f"Watch_{address:04X}"
					watch_list.add(Watch(address=address, name=name))

			# Determine format from extension
			ext = Path(args.output).suffix.lower()
			format_type = 'json'
			if ext == '.mwf':
				format_type = 'mesen'
			elif ext == '.wch':
				format_type = 'fceux'

			output = parsers[format_type].export(watch_list)
			Path(args.output).write_text(output, encoding='utf-8')
			print(f"Created watch file: {args.output}")

	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
