#!/usr/bin/env python3
"""
Soul Blazer (SNES) Pointer Table Scanner
Scans ROM for pointer tables and data structures.
"""

import json
import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from collections import defaultdict


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
DATA_DIR = ASSETS_DIR / "data"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


@dataclass
class PointerEntry:
	"""Single pointer entry."""
	offset: int           # ROM offset where pointer was found
	target: int           # Target address the pointer points to
	target_bank: int      # Bank of target
	is_valid: bool        # Points to valid ROM location
	is_16bit: bool        # True if 16-bit, False if 24-bit


@dataclass
class PointerTable:
	"""A table of pointers."""
	offset: int           # ROM offset of table start
	bank: int             # Bank containing table
	count: int            # Number of entries
	entry_size: int       # Bytes per entry (2 or 3)
	entries: list[PointerEntry] = field(default_factory=list)
	name: str = ""
	purpose: str = ""


@dataclass
class DataBlock:
	"""A block of data pointed to."""
	offset: int
	size: int
	referenced_by: list[int] = field(default_factory=list)
	data_type: str = "unknown"


class PointerScanner:
	"""Scan ROM for pointer tables."""

	# Known pointer tables
	KNOWN_TABLES = {
		0x008000: ("Reset Vector Table", "CPU vectors", 8, 2),
		0x010000: ("Bank 02 Text Pointers", "Dialogue text", 64, 2),
		0x018000: ("Bank 03 Text Pointers", "NPC dialogue", 128, 2),
		0x028000: ("Bank 05 Data Pointers", "Game data", 32, 2),
		0x030000: ("Bank 06 Enemy Pointers", "Enemy data", 64, 2),
		0x038000: ("Bank 07 Item Pointers", "Item/equipment", 48, 2),
		0x040000: ("Bank 08 Map Pointers", "Level 1 maps", 32, 3),
		0x048000: ("Bank 09 Map Pointers", "Level 2 maps", 32, 3),
		0x050000: ("Bank 0A Map Pointers", "Level 3 maps", 32, 3),
		0x058000: ("Bank 0B Map Pointers", "Level 4 maps", 32, 3),
		0x060000: ("Bank 0C Tileset Pointers", "Tileset data", 16, 3),
		0x068000: ("Bank 0D Music Pointers", "Music data", 32, 2),
		0x070000: ("Bank 0E SFX Pointers", "Sound effects", 32, 2),
		0x078000: ("Bank 0F Audio Pointers", "Audio driver", 16, 3),
		0x080000: ("Bank 10 Sprite Pointers", "Character sprites", 64, 2),
	}

	def __init__(self, rom_path: str = None):
		"""Initialize scanner."""
		self.rom_data: Optional[bytes] = None
		self.tables: list[PointerTable] = []
		self.data_blocks: dict[int, DataBlock] = {}

		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def snes_to_file(self, snes_addr: int) -> int:
		"""Convert SNES LoROM address to file offset."""
		bank = (snes_addr >> 16) & 0x7F
		offset = snes_addr & 0x7FFF
		return (bank * 0x8000) + offset

	def file_to_snes(self, file_offset: int) -> int:
		"""Convert file offset to SNES LoROM address."""
		bank = file_offset // 0x8000
		offset = (file_offset % 0x8000) + 0x8000
		return (bank << 16) | offset

	def is_valid_pointer(self, target: int, is_24bit: bool = False) -> bool:
		"""Check if a pointer target is valid ROM location."""
		if is_24bit:
			bank = (target >> 16) & 0xFF
			offset = target & 0xFFFF
			# Check bank range (LoROM: $00-$3F, $80-$BF have ROM)
			if bank > 0x3F and bank < 0x80:
				return False
			if bank >= 0xC0:
				return False
			# Check offset is in ROM area ($8000-$FFFF)
			if offset < 0x8000:
				return False
		else:
			# 16-bit pointer (bank-relative)
			if target < 0x8000:
				return False

		return True

	def read_pointer_16(self, offset: int) -> int:
		"""Read 16-bit pointer at offset."""
		if offset + 2 > len(self.rom_data):
			return 0
		return struct.unpack_from('<H', self.rom_data, offset)[0]

	def read_pointer_24(self, offset: int) -> int:
		"""Read 24-bit pointer at offset."""
		if offset + 3 > len(self.rom_data):
			return 0
		low = self.rom_data[offset]
		mid = self.rom_data[offset + 1]
		high = self.rom_data[offset + 2]
		return (high << 16) | (mid << 8) | low

	def scan_for_pointer_table(self, offset: int, max_entries: int = 256,
							   entry_size: int = 2) -> Optional[PointerTable]:
		"""Scan for a potential pointer table at offset."""
		if not self.rom_data or offset + 4 > len(self.rom_data):
			return None

		bank = offset // 0x8000
		entries = []
		consecutive_valid = 0
		targets_seen = set()

		for i in range(max_entries):
			entry_offset = offset + (i * entry_size)
			if entry_offset + entry_size > len(self.rom_data):
				break

			if entry_size == 2:
				target = self.read_pointer_16(entry_offset)
				target_full = (bank << 16) | target
				is_24bit = False
			else:
				target = self.read_pointer_24(entry_offset)
				target_full = target
				is_24bit = True

			is_valid = self.is_valid_pointer(target_full, is_24bit)

			if is_valid:
				consecutive_valid += 1
				targets_seen.add(target_full)
			else:
				# End of table if we see invalid pointer after valid ones
				if consecutive_valid >= 4:
					break
				consecutive_valid = 0

			entry = PointerEntry(
				offset=entry_offset,
				target=target_full,
				target_bank=(target_full >> 16) & 0xFF,
				is_valid=is_valid,
				is_16bit=(entry_size == 2)
			)
			entries.append(entry)

		# Must have at least 4 valid pointers to be considered a table
		valid_entries = [e for e in entries if e.is_valid]
		if len(valid_entries) < 4:
			return None

		# Check for reasonable spread of targets
		if len(targets_seen) < 3:
			return None

		table = PointerTable(
			offset=offset,
			bank=bank,
			count=len(valid_entries),
			entry_size=entry_size,
			entries=entries[:len(valid_entries)]
		)

		return table

	def scan_known_tables(self) -> None:
		"""Scan all known pointer table locations."""
		self.tables.clear()

		for offset, (name, purpose, count, size) in self.KNOWN_TABLES.items():
			if offset >= len(self.rom_data):
				continue

			table = self.scan_for_pointer_table(offset, count, size)
			if table:
				table.name = name
				table.purpose = purpose
				self.tables.append(table)

	def scan_bank_for_tables(self, bank: int, entry_size: int = 2) -> list[PointerTable]:
		"""Scan an entire bank for pointer tables."""
		tables = []
		bank_start = bank * 0x8000
		bank_end = bank_start + 0x8000

		if bank_end > len(self.rom_data):
			return tables

		# Scan at aligned offsets
		for offset in range(bank_start, bank_end - 16, 2):
			# Skip if inside a known table
			skip = False
			for t in tables:
				if t.offset <= offset < t.offset + (t.count * t.entry_size):
					skip = True
					break
			if skip:
				continue

			table = self.scan_for_pointer_table(offset, 64, entry_size)
			if table and table.count >= 8:
				tables.append(table)

		return tables

	def scan_all_banks(self) -> None:
		"""Scan all banks for pointer tables."""
		self.tables.clear()

		# First, add known tables
		self.scan_known_tables()

		# Then scan each bank
		for bank in range(0x20):  # Banks $00-$1F
			bank_tables = self.scan_bank_for_tables(bank, 2)
			for t in bank_tables:
				# Avoid duplicates
				exists = any(existing.offset == t.offset for existing in self.tables)
				if not exists and t.count >= 8:
					self.tables.append(t)

	def analyze_data_blocks(self) -> None:
		"""Analyze data blocks pointed to by tables."""
		self.data_blocks.clear()

		for table in self.tables:
			for entry in table.entries:
				if not entry.is_valid:
					continue

				target = entry.target
				file_offset = self.snes_to_file(target)

				if file_offset not in self.data_blocks:
					self.data_blocks[file_offset] = DataBlock(
						offset=file_offset,
						size=0,
						referenced_by=[]
					)

				self.data_blocks[file_offset].referenced_by.append(entry.offset)

		# Estimate sizes by looking at gaps between blocks
		sorted_offsets = sorted(self.data_blocks.keys())
		for i, offset in enumerate(sorted_offsets):
			if i + 1 < len(sorted_offsets):
				next_offset = sorted_offsets[i + 1]
				size = next_offset - offset
				# Cap at reasonable size
				self.data_blocks[offset].size = min(size, 0x1000)
			else:
				self.data_blocks[offset].size = 0x100  # Default

	def export_to_json(self, output_path: Path) -> None:
		"""Export scan results to JSON."""
		data = {
			"total_tables": len(self.tables),
			"total_pointers": sum(t.count for t in self.tables),
			"data_blocks": len(self.data_blocks),
			"tables": [
				{
					"offset": f"${t.offset:06X}",
					"bank": f"${t.bank:02X}",
					"name": t.name,
					"purpose": t.purpose,
					"count": t.count,
					"entry_size": t.entry_size,
					"entries": [
						{
							"offset": f"${e.offset:06X}",
							"target": f"${e.target:06X}",
							"bank": f"${e.target_bank:02X}",
						}
						for e in t.entries[:20]  # First 20 entries
					]
				}
				for t in sorted(self.tables, key=lambda x: x.offset)
			],
		}

		output_path.parent.mkdir(parents=True, exist_ok=True)
		with open(output_path, 'w') as f:
			json.dump(data, f, indent='\t')

	def generate_wikitext(self) -> str:
		"""Generate wikitext documentation."""
		lines = [
			"== Pointer Tables ==",
			"",
			"This page documents pointer tables found in the ROM.",
			"",
			f"* Total tables: {len(self.tables)}",
			f"* Total pointers: {sum(t.count for t in self.tables)}",
			"",
			"=== Known Tables ===",
			"",
			"{| class=\"wikitable sortable\"",
			"! Offset !! Bank !! Name !! Count !! Size !! Purpose",
		]

		for table in sorted(self.tables, key=lambda x: x.offset):
			if table.name:
				lines.append("|-")
				lines.append(f"| ${{{{hex|{table.offset:06X}}}}} || ${table.bank:02X} || "
							f"{table.name} || {table.count} || {table.entry_size} || {table.purpose}")

		lines.append("|}")
		lines.append("")

		# Unknown tables
		unknown = [t for t in self.tables if not t.name]
		if unknown:
			lines.append("=== Discovered Tables ===")
			lines.append("")
			lines.append("{| class=\"wikitable sortable\"")
			lines.append("! Offset !! Bank !! Count !! Entry Size")

			for table in sorted(unknown, key=lambda x: x.offset)[:30]:
				lines.append("|-")
				lines.append(f"| ${{{{hex|{table.offset:06X}}}}} || ${table.bank:02X} || "
							f"{table.count} || {table.entry_size}")

			lines.append("|}")

		return "\n".join(lines)

	def print_summary(self) -> None:
		"""Print scan summary."""
		print("=" * 60)
		print("SOUL BLAZER POINTER TABLE SCANNER")
		print("=" * 60)

		print(f"\nTotal pointer tables: {len(self.tables)}")
		print(f"Total pointers: {sum(t.count for t in self.tables)}")
		print(f"Data blocks referenced: {len(self.data_blocks)}")

		print("\n--- Known Tables ---")
		for table in sorted(self.tables, key=lambda x: x.offset):
			if table.name:
				print(f"  ${table.offset:06X}: {table.name} ({table.count} entries)")

		print("\n--- Discovered Tables (Top 20) ---")
		unknown = [t for t in self.tables if not t.name]
		for table in sorted(unknown, key=lambda x: -x.count)[:20]:
			print(f"  ${table.offset:06X}: {table.count} entries × {table.entry_size} bytes")

		print("\n--- Pointers by Bank ---")
		bank_counts = defaultdict(int)
		for table in self.tables:
			bank_counts[table.bank] += table.count
		for bank, count in sorted(bank_counts.items()):
			print(f"  Bank ${bank:02X}: {count} pointers")


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Pointer Table Scanner")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--output", "-o", help="Output directory", default=str(DATA_DIR))
	parser.add_argument("--wikitext", "-w", action="store_true", help="Generate wikitext output")
	parser.add_argument("--bank", "-b", type=int, help="Scan specific bank only (decimal)")
	parser.add_argument("--known", "-k", action="store_true", help="Scan known tables only")

	args = parser.parse_args()

	scanner = PointerScanner(args.rom)

	if not scanner.rom_data:
		print("Error: Could not load ROM")
		return

	if args.known:
		print("Scanning known pointer tables...")
		scanner.scan_known_tables()
	elif args.bank is not None:
		print(f"Scanning bank ${args.bank:02X}...")
		tables = scanner.scan_bank_for_tables(args.bank)
		scanner.tables = tables
	else:
		print("Scanning all banks for pointer tables...")
		scanner.scan_all_banks()

	scanner.analyze_data_blocks()

	if args.wikitext:
		print(scanner.generate_wikitext())
	else:
		scanner.print_summary()

		output_dir = Path(args.output)
		scanner.export_to_json(output_dir / "pointer_tables.json")
		print(f"\nExported to: {output_dir}")


if __name__ == "__main__":
	main()
