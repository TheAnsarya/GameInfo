#!/usr/bin/env python3
"""
Save State Analyzer

Analyze and compare save states from emulators.
Useful for finding memory locations and understanding game state.

Features:
- Parse save state formats (Mesen, FCEUX, ZSNES, etc.)
- Compare states to find differences
- Extract RAM/VRAM/SRAM
- Search for values in states
- Track value changes over multiple states

Usage:
	python savestate.py analyze <state_file>
	python savestate.py compare <state1> <state2> --ram
	python savestate.py search <state_file> --value 0x50
	python savestate.py track <state_dir> --address 0x0400
	python savestate.py extract <state_file> --ram --output ram.bin
"""

import argparse
import gzip
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, BinaryIO


@dataclass
class SaveStateInfo:
	"""Save state information"""
	format: str = ""
	emulator: str = ""
	rom_name: str = ""
	file_size: int = 0
	sections: Dict[str, Tuple[int, int]] = field(default_factory=dict)  # name -> (offset, size)


@dataclass
class RAMData:
	"""RAM data from save state"""
	data: bytes = b''
	size: int = 0
	offset_in_file: int = 0


@dataclass
class Difference:
	"""Difference between two states"""
	address: int
	old_value: int
	new_value: int
	section: str = "RAM"


class MesenSaveState:
	"""Parse Mesen save states"""

	@staticmethod
	def detect(data: bytes) -> bool:
		"""Check if this is a Mesen save state"""
		# Mesen states are gzipped
		try:
			decompressed = gzip.decompress(data)
			# Look for Mesen signature
			return b'MesenState' in decompressed[:100] or len(decompressed) > len(data)
		except:
			return False

	@staticmethod
	def parse(filepath: str) -> Tuple[SaveStateInfo, Dict[str, bytes]]:
		"""Parse Mesen save state"""
		with open(filepath, 'rb') as f:
			data = f.read()

		# Try to decompress
		try:
			data = gzip.decompress(data)
		except:
			pass

		info = SaveStateInfo(format='mesen', emulator='Mesen')
		info.file_size = len(data)

		sections = {}

		# Mesen format uses sections with headers
		# This is a simplified parser - actual format is more complex
		pos = 0
		while pos < len(data) - 8:
			# Look for section markers
			if data[pos:pos + 3] == b'RAM':
				# Find size (varies by section type)
				# NES RAM is 2KB
				ram_start = pos
				ram_size = 0x800  # 2KB for NES
				# Look for actual data
				for offset in range(pos, min(pos + 100, len(data) - ram_size)):
					# Heuristic: RAM data usually doesn't start with many zeros
					potential_ram = data[offset:offset + ram_size]
					if potential_ram.count(0) < ram_size * 0.9:  # Not mostly zeros
						sections['RAM'] = potential_ram
						info.sections['RAM'] = (offset, ram_size)
						break
				break
			pos += 1

		# Fallback: extract probable RAM location
		if 'RAM' not in sections and len(data) >= 0x800:
			# Try common offsets
			for offset in [0x100, 0x200, 0x400, 0x800]:
				if offset + 0x800 <= len(data):
					sections['RAM'] = data[offset:offset + 0x800]
					info.sections['RAM'] = (offset, 0x800)
					break

		return info, sections


class FCEUXSaveState:
	"""Parse FCEUX save states"""

	@staticmethod
	def detect(data: bytes) -> bool:
		"""Check if this is a FCEUX save state"""
		# FCEUX states start with "FCSX" (compressed) or "FCS\x"
		return data[:4] in (b'FCSX', b'FCS\xff', b'FCS\x00')

	@staticmethod
	def parse(filepath: str) -> Tuple[SaveStateInfo, Dict[str, bytes]]:
		"""Parse FCEUX save state"""
		with open(filepath, 'rb') as f:
			data = f.read()

		info = SaveStateInfo(format='fceux', emulator='FCEUX')
		info.file_size = len(data)

		sections = {}

		# FCEUX format
		if data[:4] == b'FCSX':
			# Compressed - decompress
			try:
				import zlib
				data = data[:4] + zlib.decompress(data[4:])
			except:
				pass

		# Look for RAM section marker
		ram_marker = b'RAM\x00'
		pos = data.find(ram_marker)
		if pos >= 0:
			# RAM size follows marker
			pos += 4
			if pos + 4 <= len(data):
				ram_size = struct.unpack('<I', data[pos:pos + 4])[0]
				pos += 4
				if pos + ram_size <= len(data):
					sections['RAM'] = data[pos:pos + ram_size]
					info.sections['RAM'] = (pos, ram_size)

		# Look for PPU RAM
		ppu_marker = b'PPUR'
		pos = data.find(ppu_marker)
		if pos >= 0:
			pos += 4
			if pos + 4 <= len(data):
				ppu_size = struct.unpack('<I', data[pos:pos + 4])[0]
				pos += 4
				if pos + ppu_size <= len(data):
					sections['VRAM'] = data[pos:pos + ppu_size]
					info.sections['VRAM'] = (pos, ppu_size)

		return info, sections


class GenericSaveState:
	"""Generic save state parser for unknown formats"""

	@staticmethod
	def parse(filepath: str) -> Tuple[SaveStateInfo, Dict[str, bytes]]:
		"""Parse unknown save state format"""
		with open(filepath, 'rb') as f:
			data = f.read()

		# Try to decompress
		try:
			decompressed = gzip.decompress(data)
			data = decompressed
		except:
			pass

		info = SaveStateInfo(format='unknown', emulator='Unknown')
		info.file_size = len(data)

		sections = {}

		# Try to find 2KB aligned sections (common RAM sizes)
		for size in [0x800, 0x2000, 0x8000]:
			if len(data) >= size:
				# Take first non-header region
				offset = min(0x100, len(data) - size)
				sections['RAM'] = data[offset:offset + size]
				info.sections['RAM'] = (offset, size)
				break

		return info, sections


def parse_save_state(filepath: str) -> Tuple[SaveStateInfo, Dict[str, bytes]]:
	"""Auto-detect and parse save state"""
	with open(filepath, 'rb') as f:
		data = f.read()

	if FCEUXSaveState.detect(data):
		return FCEUXSaveState.parse(filepath)
	elif MesenSaveState.detect(data):
		return MesenSaveState.parse(filepath)
	else:
		return GenericSaveState.parse(filepath)


def compare_sections(data1: bytes, data2: bytes, section_name: str = "RAM") -> List[Difference]:
	"""Compare two data sections"""
	differences = []
	min_len = min(len(data1), len(data2))

	for i in range(min_len):
		if data1[i] != data2[i]:
			differences.append(Difference(
				address=i,
				old_value=data1[i],
				new_value=data2[i],
				section=section_name,
			))

	return differences


def search_value(data: bytes, value: int, size: int = 1) -> List[int]:
	"""Search for value in data"""
	results = []

	if size == 1:
		for i, b in enumerate(data):
			if b == value:
				results.append(i)
	elif size == 2:
		for i in range(len(data) - 1):
			v = struct.unpack('<H', data[i:i + 2])[0]
			if v == value:
				results.append(i)

	return results


def main():
	parser = argparse.ArgumentParser(
		description='Save State Analyzer',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze save state')
	analyze_parser.add_argument('state', help='Save state file')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Compare two states')
	compare_parser.add_argument('state1', help='First state')
	compare_parser.add_argument('state2', help='Second state')
	compare_parser.add_argument('--section', '-s', default='RAM', help='Section to compare')
	compare_parser.add_argument('--output', '-o', help='Output file')

	# Search command
	search_parser = subparsers.add_parser('search', help='Search for value')
	search_parser.add_argument('state', help='Save state file')
	search_parser.add_argument('--value', '-v', type=lambda x: int(x, 0), required=True, help='Value to search')
	search_parser.add_argument('--size', '-s', type=int, default=1, choices=[1, 2], help='Value size (bytes)')
	search_parser.add_argument('--section', default='RAM', help='Section to search')

	# Track command
	track_parser = subparsers.add_parser('track', help='Track address across states')
	track_parser.add_argument('directory', help='Directory with states')
	track_parser.add_argument('--address', '-a', type=lambda x: int(x, 0), required=True, help='Address to track')
	track_parser.add_argument('--section', '-s', default='RAM', help='Section')

	# Extract command
	extract_parser = subparsers.add_parser('extract', help='Extract section from state')
	extract_parser.add_argument('state', help='Save state file')
	extract_parser.add_argument('--section', '-s', default='RAM', help='Section to extract')
	extract_parser.add_argument('--output', '-o', required=True, help='Output file')

	args = parser.parse_args()

	if args.command == 'analyze':
		info, sections = parse_save_state(args.state)

		print(f"Save State Analysis")
		print(f"==================")
		print(f"File: {args.state}")
		print(f"Size: {info.file_size:,} bytes")
		print(f"Format: {info.format}")
		print(f"Emulator: {info.emulator}")
		print()

		print("Sections:")
		for name, (offset, size) in info.sections.items():
			print(f"  {name}: offset 0x{offset:06X}, size {size:,} bytes")

		if sections:
			print()
			print("Section Details:")
			for name, data in sections.items():
				non_zero = sum(1 for b in data if b != 0)
				print(f"  {name}:")
				print(f"    Non-zero bytes: {non_zero} / {len(data)} ({non_zero / len(data) * 100:.1f}%)")
				print(f"    First 32 bytes: {data[:32].hex().upper()}")

	elif args.command == 'compare':
		info1, sections1 = parse_save_state(args.state1)
		info2, sections2 = parse_save_state(args.state2)

		section = args.section.upper()
		if section not in sections1 or section not in sections2:
			print(f"Section '{section}' not found in both states")
			sys.exit(1)

		differences = compare_sections(sections1[section], sections2[section], section)

		print(f"Comparing {section} sections")
		print(f"State 1: {args.state1}")
		print(f"State 2: {args.state2}")
		print(f"Differences: {len(differences)}")
		print()

		for diff in differences[:100]:
			print(f"  ${diff.address:04X}: {diff.old_value:02X} -> {diff.new_value:02X}")

		if len(differences) > 100:
			print(f"  ... and {len(differences) - 100} more")

		if args.output:
			output = [
				{
					'address': f"${d.address:04X}",
					'old': f"0x{d.old_value:02X}",
					'new': f"0x{d.new_value:02X}",
				}
				for d in differences
			]
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(output, f, indent='\t')
			print(f"\nSaved to: {args.output}")

	elif args.command == 'search':
		info, sections = parse_save_state(args.state)

		section = args.section.upper()
		if section not in sections:
			print(f"Section '{section}' not found")
			sys.exit(1)

		results = search_value(sections[section], args.value, args.size)

		print(f"Search Results")
		print(f"Value: 0x{args.value:02X} ({args.value})")
		print(f"Found: {len(results)} locations")
		print()

		for addr in results[:50]:
			context_start = max(0, addr - 4)
			context_end = min(len(sections[section]), addr + 5)
			context = sections[section][context_start:context_end]
			context_hex = ' '.join(f'{b:02X}' for b in context)
			print(f"  ${addr:04X}: {context_hex}")

	elif args.command == 'track':
		import glob

		states = sorted(glob.glob(os.path.join(args.directory, '*')))
		print(f"Tracking ${args.address:04X} across {len(states)} states")
		print()

		for state_path in states:
			try:
				info, sections = parse_save_state(state_path)
				section = args.section.upper()
				if section in sections:
					data = sections[section]
					if args.address < len(data):
						value = data[args.address]
						print(f"  {os.path.basename(state_path)}: ${value:02X} ({value})")
			except Exception as e:
				print(f"  {os.path.basename(state_path)}: Error - {e}")

	elif args.command == 'extract':
		info, sections = parse_save_state(args.state)

		section = args.section.upper()
		if section not in sections:
			print(f"Section '{section}' not found")
			print(f"Available: {', '.join(sections.keys())}")
			sys.exit(1)

		with open(args.output, 'wb') as f:
			f.write(sections[section])

		print(f"Extracted {len(sections[section]):,} bytes to: {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
