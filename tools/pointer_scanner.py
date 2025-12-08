#!/usr/bin/env python3
"""
Pointer Scanner - Scan ROMs for pointer tables and references.

Identifies and analyzes pointer structures, builds reference maps,
and helps locate data referenced by pointers.

Usage:
	python pointer_scanner.py <rom_file> --find-tables
	python pointer_scanner.py <rom_file> --analyze 0x8000

Features:
	- Find pointer tables automatically
	- Trace pointer references
	- Identify data structures
	- Generate pointer maps
	- Support multiple addressing modes
"""

import argparse
import json
import os
import struct
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from enum import IntEnum
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class AddressMode(IntEnum):
	"""Pointer addressing modes."""
	ABSOLUTE = 0  # Direct address
	RELATIVE = 1  # Relative to some base
	BANKED = 2  # Bank + offset
	HIROM = 3  # SNES HiROM
	LOROM = 4  # SNES LoROM
	INES = 5  # NES with iNES header


@dataclass
class Pointer:
	"""Single pointer entry."""
	offset: int  # Offset in ROM where pointer is stored
	target: int  # Target address the pointer points to
	size: int = 2  # Pointer size in bytes (2 or 3)
	bank: int = 0  # Bank number if applicable
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"offset": f"0x{self.offset:06X}",
			"target": f"0x{self.target:06X}",
			"size": self.size,
			"bank": self.bank
		}


@dataclass
class PointerTable:
	"""Table of pointers."""
	offset: int
	pointers: List[Pointer]
	entry_size: int = 2
	count: int = 0
	stride: int = 0  # Gap between entries if not contiguous
	name: str = ""
	data_type: str = ""  # What kind of data the pointers reference
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"name": self.name,
			"offset": f"0x{self.offset:06X}",
			"count": len(self.pointers),
			"entry_size": self.entry_size,
			"stride": self.stride,
			"data_type": self.data_type,
			"pointers": [p.to_dict() for p in self.pointers[:50]],  # Limit output
			"truncated": len(self.pointers) > 50
		}


@dataclass
class Reference:
	"""Reference to an address."""
	source: int  # Where the reference comes from
	target: int  # What it points to
	ref_type: str = "pointer"  # pointer, jump, call, etc.
	
	def to_dict(self) -> Dict[str, Any]:
		return {
			"source": f"0x{self.source:06X}",
			"target": f"0x{self.target:06X}",
			"type": self.ref_type
		}


class PointerScanner:
	"""Scan and analyze pointers in ROM data."""
	
	def __init__(self, rom_data: bytes, address_mode: AddressMode = AddressMode.ABSOLUTE):
		self.rom_data = rom_data
		self.address_mode = address_mode
		
		# Reference map: target -> list of sources
		self.references: Dict[int, List[Reference]] = defaultdict(list)
		
		# Detected tables
		self.tables: List[PointerTable] = []
		
		# ROM offset adjustments
		self.header_size = 0
		self.bank_size = 0x4000  # NES PRG bank size
		
		self._detect_rom_format()
	
	def _detect_rom_format(self) -> None:
		"""Detect ROM format and set parameters."""
		# Check for iNES header
		if self.rom_data[:4] == b"NES\x1A":
			self.header_size = 16
			self.address_mode = AddressMode.INES
			self.bank_size = 0x4000
			return
		
		# Check for SNES
		for offset in [0x7FC0, 0xFFC0]:
			if offset + 32 <= len(self.rom_data):
				if offset + 0x1E + 2 <= len(self.rom_data):
					checksum = struct.unpack_from("<H", self.rom_data, offset + 0x1E)[0]
					complement = struct.unpack_from("<H", self.rom_data, offset + 0x1C)[0]
					if checksum ^ complement == 0xFFFF:
						if offset == 0x7FC0:
							self.address_mode = AddressMode.LOROM
							self.bank_size = 0x8000
						else:
							self.address_mode = AddressMode.HIROM
							self.bank_size = 0x10000
						return
	
	def address_to_offset(self, address: int, bank: int = 0) -> Optional[int]:
		"""Convert CPU address to ROM offset."""
		if self.address_mode == AddressMode.ABSOLUTE:
			return address
		
		elif self.address_mode == AddressMode.INES:
			# NES: $8000-$FFFF mapped to PRG ROM
			if 0x8000 <= address <= 0xFFFF:
				return self.header_size + (address - 0x8000) + bank * self.bank_size
		
		elif self.address_mode == AddressMode.LOROM:
			# SNES LoROM: $8000-$FFFF of each bank
			bank_num = (address >> 16) & 0xFF
			offset = address & 0xFFFF
			if offset >= 0x8000:
				return bank_num * 0x8000 + (offset - 0x8000)
		
		elif self.address_mode == AddressMode.HIROM:
			# SNES HiROM: linear mapping
			bank_num = (address >> 16) & 0xFF
			offset = address & 0xFFFF
			if bank_num >= 0xC0:
				return (bank_num - 0xC0) * 0x10000 + offset
		
		return None
	
	def offset_to_address(self, offset: int, bank: int = 0) -> int:
		"""Convert ROM offset to CPU address."""
		if self.address_mode == AddressMode.ABSOLUTE:
			return offset
		
		elif self.address_mode == AddressMode.INES:
			# NES: map to $8000-$FFFF
			rom_offset = offset - self.header_size
			return 0x8000 + (rom_offset % self.bank_size)
		
		elif self.address_mode == AddressMode.LOROM:
			# SNES LoROM
			bank_num = offset // 0x8000
			bank_offset = offset % 0x8000
			return (bank_num << 16) | (0x8000 + bank_offset)
		
		elif self.address_mode == AddressMode.HIROM:
			# SNES HiROM
			bank_num = 0xC0 + (offset // 0x10000)
			bank_offset = offset % 0x10000
			return (bank_num << 16) | bank_offset
		
		return offset
	
	def read_pointer(self, offset: int, size: int = 2) -> Optional[int]:
		"""Read a pointer value at offset."""
		if offset + size > len(self.rom_data):
			return None
		
		if size == 2:
			return struct.unpack_from("<H", self.rom_data, offset)[0]
		elif size == 3:
			return struct.unpack_from("<I", self.rom_data, offset)[0] & 0xFFFFFF
		elif size == 4:
			return struct.unpack_from("<I", self.rom_data, offset)[0]
		
		return None
	
	def is_valid_pointer(self, address: int, min_addr: int = 0, 
						 max_addr: int = 0xFFFF) -> bool:
		"""Check if address is a valid pointer target."""
		if address < min_addr or address > max_addr:
			return False
		
		# Convert to ROM offset and check bounds
		offset = self.address_to_offset(address)
		if offset is None:
			return False
		
		return 0 <= offset < len(self.rom_data) - self.header_size
	
	def find_pointer_tables(self, min_entries: int = 4,
							pointer_size: int = 2,
							min_addr: int = 0,
							max_addr: int = 0xFFFF) -> List[PointerTable]:
		"""Find potential pointer tables."""
		tables = []
		checked = set()
		
		# Scan for sequences of valid pointers
		for offset in range(self.header_size, len(self.rom_data) - pointer_size * min_entries, 2):
			if offset in checked:
				continue
			
			# Check if this could be start of pointer table
			valid_count = 0
			pointers = []
			
			for i in range(256):  # Max 256 entries
				ptr_offset = offset + i * pointer_size
				if ptr_offset + pointer_size > len(self.rom_data):
					break
				
				ptr_value = self.read_pointer(ptr_offset, pointer_size)
				if ptr_value is None:
					break
				
				if self.is_valid_pointer(ptr_value, min_addr, max_addr):
					valid_count += 1
					pointers.append(Pointer(
						offset=ptr_offset,
						target=ptr_value,
						size=pointer_size
					))
				else:
					break
			
			if valid_count >= min_entries:
				table = PointerTable(
					offset=offset,
					pointers=pointers,
					entry_size=pointer_size,
					count=valid_count
				)
				tables.append(table)
				
				# Mark these offsets as checked
				for i in range(valid_count * pointer_size):
					checked.add(offset + i)
		
		self.tables = tables
		return tables
	
	def find_references_to(self, target_addr: int,
						   pointer_size: int = 2) -> List[Reference]:
		"""Find all pointers that reference a target address."""
		refs = []
		target_bytes = struct.pack("<H" if pointer_size == 2 else "<I", target_addr)
		target_bytes = target_bytes[:pointer_size]
		
		# Search for target bytes
		offset = 0
		while True:
			offset = self.rom_data.find(target_bytes, offset)
			if offset == -1:
				break
			
			refs.append(Reference(
				source=offset,
				target=target_addr,
				ref_type="pointer"
			))
			
			offset += 1
		
		return refs
	
	def find_code_references(self, target_addr: int) -> List[Reference]:
		"""Find code references (jumps, calls) to an address."""
		refs = []
		
		# NES/6502 opcodes that reference addresses
		# JMP absolute: 4C xx xx
		# JSR: 20 xx xx
		# JMP indirect: 6C xx xx
		
		target_lo = target_addr & 0xFF
		target_hi = (target_addr >> 8) & 0xFF
		
		for offset in range(self.header_size, len(self.rom_data) - 2):
			opcode = self.rom_data[offset]
			
			if opcode in (0x4C, 0x20, 0x6C):  # JMP, JSR, JMP indirect
				if offset + 2 < len(self.rom_data):
					if (self.rom_data[offset + 1] == target_lo and 
						self.rom_data[offset + 2] == target_hi):
						
						ref_type = {
							0x4C: "jmp",
							0x20: "jsr",
							0x6C: "jmp_indirect"
						}[opcode]
						
						refs.append(Reference(
							source=offset,
							target=target_addr,
							ref_type=ref_type
						))
		
		return refs
	
	def analyze_table_data(self, table: PointerTable) -> Dict[str, Any]:
		"""Analyze what kind of data a pointer table references."""
		analysis = {
			"pointer_count": len(table.pointers),
			"target_range": {"min": 0xFFFF, "max": 0},
			"data_sizes": [],
			"common_patterns": []
		}
		
		targets = [p.target for p in table.pointers]
		
		if targets:
			analysis["target_range"]["min"] = min(targets)
			analysis["target_range"]["max"] = max(targets)
		
		# Analyze data at each target
		for i, ptr in enumerate(table.pointers):
			target_offset = self.address_to_offset(ptr.target)
			if target_offset is None:
				continue
			
			# Estimate data size (distance to next pointer target or end)
			if i + 1 < len(table.pointers):
				next_offset = self.address_to_offset(table.pointers[i + 1].target)
				if next_offset and next_offset > target_offset:
					size = next_offset - target_offset
					analysis["data_sizes"].append(size)
		
		# Analyze common patterns
		if analysis["data_sizes"]:
			analysis["avg_data_size"] = sum(analysis["data_sizes"]) / len(analysis["data_sizes"])
			analysis["min_data_size"] = min(analysis["data_sizes"])
			analysis["max_data_size"] = max(analysis["data_sizes"])
		
		# Check first few bytes of data for patterns
		first_bytes = []
		for ptr in table.pointers[:16]:
			target_offset = self.address_to_offset(ptr.target)
			if target_offset and target_offset < len(self.rom_data):
				first_bytes.append(self.rom_data[target_offset])
		
		if first_bytes:
			# Check for consistent header bytes
			from collections import Counter
			byte_freq = Counter(first_bytes)
			most_common = byte_freq.most_common(1)
			if most_common and most_common[0][1] > len(first_bytes) // 2:
				analysis["common_first_byte"] = f"0x{most_common[0][0]:02X}"
		
		return analysis
	
	def build_reference_map(self) -> Dict[int, List[Reference]]:
		"""Build complete reference map for ROM."""
		self.references.clear()
		
		# Add pointer table references
		for table in self.tables:
			for ptr in table.pointers:
				self.references[ptr.target].append(Reference(
					source=ptr.offset,
					target=ptr.target,
					ref_type="pointer_table"
				))
		
		# Scan for code references
		for offset in range(self.header_size, len(self.rom_data) - 2):
			opcode = self.rom_data[offset]
			
			if opcode in (0x4C, 0x20):  # JMP, JSR
				target = struct.unpack_from("<H", self.rom_data, offset + 1)[0]
				self.references[target].append(Reference(
					source=offset,
					target=target,
					ref_type="jsr" if opcode == 0x20 else "jmp"
				))
		
		return dict(self.references)
	
	def export_results(self, output_path: str) -> None:
		"""Export analysis results to JSON."""
		results = {
			"rom_size": len(self.rom_data),
			"address_mode": self.address_mode.name,
			"header_size": self.header_size,
			"bank_size": self.bank_size,
			"tables": [
				{
					**t.to_dict(),
					"analysis": self.analyze_table_data(t)
				}
				for t in self.tables
			],
			"reference_count": sum(len(refs) for refs in self.references.values())
		}
		
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(results, f, indent="\t")


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Pointer Scanner")
	parser.add_argument("rom", help="ROM file to scan")
	parser.add_argument("--find-tables", action="store_true",
						help="Find pointer tables")
	parser.add_argument("--min-entries", type=int, default=4,
						help="Minimum entries for a table")
	parser.add_argument("--pointer-size", type=int, choices=[2, 3], default=2,
						help="Pointer size in bytes")
	parser.add_argument("--analyze", type=lambda x: int(x, 0),
						help="Analyze specific offset")
	parser.add_argument("--find-refs", type=lambda x: int(x, 0),
						help="Find references to address")
	parser.add_argument("--output", "-o", help="Output JSON file")
	parser.add_argument("--verbose", "-v", action="store_true",
						help="Verbose output")
	
	args = parser.parse_args()
	
	if not os.path.exists(args.rom):
		print(f"Error: ROM file not found: {args.rom}")
		sys.exit(1)
	
	# Load ROM
	with open(args.rom, "rb") as f:
		rom_data = f.read()
	
	print(f"ROM: {args.rom}")
	print(f"Size: {len(rom_data):,} bytes")
	
	scanner = PointerScanner(rom_data)
	print(f"Address mode: {scanner.address_mode.name}")
	print(f"Header size: {scanner.header_size}")
	print()
	
	if args.find_tables:
		print(f"Scanning for pointer tables (min {args.min_entries} entries)...")
		tables = scanner.find_pointer_tables(
			min_entries=args.min_entries,
			pointer_size=args.pointer_size
		)
		
		print(f"Found {len(tables)} potential pointer tables:")
		for table in tables[:30]:
			cpu_addr = scanner.offset_to_address(table.offset)
			print(f"  0x{table.offset:06X} (${cpu_addr:04X}): {len(table.pointers)} pointers")
			
			if args.verbose:
				for ptr in table.pointers[:5]:
					print(f"    -> ${ptr.target:04X}")
				if len(table.pointers) > 5:
					print(f"    ... and {len(table.pointers) - 5} more")
		
		if len(tables) > 30:
			print(f"  ... and {len(tables) - 30} more tables")
	
	if args.analyze is not None:
		print(f"\nAnalyzing offset 0x{args.analyze:06X}...")
		
		# Try to identify what's at this offset
		refs = scanner.find_references_to(
			scanner.offset_to_address(args.analyze),
			args.pointer_size
		)
		
		print(f"Found {len(refs)} pointer references")
		
		code_refs = scanner.find_code_references(
			scanner.offset_to_address(args.analyze)
		)
		print(f"Found {len(code_refs)} code references")
		
		if args.verbose:
			for ref in refs[:10]:
				print(f"  Pointer at 0x{ref.source:06X}")
			for ref in code_refs[:10]:
				print(f"  {ref.ref_type.upper()} at 0x{ref.source:06X}")
	
	if args.find_refs is not None:
		print(f"\nFinding references to ${args.find_refs:04X}...")
		
		ptr_refs = scanner.find_references_to(args.find_refs, args.pointer_size)
		code_refs = scanner.find_code_references(args.find_refs)
		
		print(f"Pointer references: {len(ptr_refs)}")
		for ref in ptr_refs[:20]:
			print(f"  0x{ref.source:06X}")
		
		print(f"\nCode references: {len(code_refs)}")
		for ref in code_refs[:20]:
			print(f"  0x{ref.source:06X} ({ref.ref_type})")
	
	if args.output:
		scanner.export_results(args.output)
		print(f"\nResults exported to: {args.output}")


if __name__ == "__main__":
	main()
