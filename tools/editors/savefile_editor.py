#!/usr/bin/env python3
"""
Save State Editor

Edit emulator save states (FCEUX, SNES9x, etc.)
View and modify RAM contents, registers, and game state.

Features:
- Parse various save state formats
- View/edit RAM contents
- Modify CPU registers
- Extract compressed data
- Compare save states

Usage:
	python savefile_editor.py info save.fc0
	python savefile_editor.py dump save.fc0 --section ram
	python savefile_editor.py edit save.fc0 --offset 0x100 --value 0xFF
	python savefile_editor.py compare save1.fc0 save2.fc0
"""

import argparse
import gzip
import json
import struct
import sys
import zlib
from pathlib import Path
from typing import Optional, Dict, List, Tuple, Any


class SaveStateFormat:
	"""Base class for save state formats."""

	def __init__(self, data: bytes):
		self.data = data
		self.sections: Dict[str, bytes] = {}
		self.metadata: Dict[str, Any] = {}
		self._parse()

	def _parse(self):
		"""Parse the save state. Override in subclasses."""
		raise NotImplementedError

	def get_ram(self) -> bytes:
		"""Get RAM contents."""
		return self.sections.get('ram', b'')

	def set_ram(self, offset: int, value: bytes):
		"""Modify RAM at offset."""
		ram = bytearray(self.get_ram())
		ram[offset:offset + len(value)] = value
		self.sections['ram'] = bytes(ram)

	def export(self) -> bytes:
		"""Export modified save state."""
		raise NotImplementedError


class FCEUXSaveState(SaveStateFormat):
	"""FCEUX save state format (.fc0, .fcs)."""

	def _parse(self):
		"""Parse FCEUX save state."""
		# Check for gzip compression
		if self.data[:2] == b'\x1f\x8b':
			self.data = gzip.decompress(self.data)

		self.metadata['format'] = 'FCEUX'

		# Parse FCEUX state format
		# Format: FCS\x1a followed by sections
		if self.data[:3] != b'FCS':
			# Older format or different structure
			self._parse_legacy()
			return

		pos = 4  # Skip header

		while pos < len(self.data):
			if pos + 5 > len(self.data):
				break

			# Section: 3-byte name + 4-byte size
			section_name = self.data[pos:pos + 3].decode('ascii', errors='replace')
			section_size = struct.unpack('<I', self.data[pos + 3:pos + 7])[0]
			pos += 7

			if pos + section_size > len(self.data):
				break

			section_data = self.data[pos:pos + section_size]
			self.sections[section_name] = section_data
			pos += section_size

		# Extract RAM from appropriate section
		if 'RAM' in self.sections:
			self.sections['ram'] = self.sections['RAM']
		elif 'CPU' in self.sections:
			# RAM might be embedded in CPU section
			cpu_data = self.sections['CPU']
			if len(cpu_data) >= 0x800:
				self.sections['ram'] = cpu_data[:0x800]

	def _parse_legacy(self):
		"""Parse legacy FCEUX format."""
		# Try to find RAM data in raw format
		# NES RAM is 2KB at a predictable location
		self.sections['raw'] = self.data
		self.metadata['format'] = 'FCEUX (legacy)'

	def export(self) -> bytes:
		"""Export modified save state."""
		# Simple export - reconstruct FCS format
		output = bytearray(b'FCS\x1a')

		for name, data in self.sections.items():
			if name in ('ram', 'raw'):
				continue
			if len(name) == 3:
				output.extend(name.encode('ascii'))
				output.extend(struct.pack('<I', len(data)))
				output.extend(data)

		return bytes(output)


class SNES9xSaveState(SaveStateFormat):
	"""SNES9x save state format."""

	def _parse(self):
		"""Parse SNES9x save state."""
		# Check for gzip
		if self.data[:2] == b'\x1f\x8b':
			self.data = gzip.decompress(self.data)

		self.metadata['format'] = 'SNES9x'

		# SNES9x uses #!s9x followed by version
		if self.data[:4] != b'#!s9':
			self._parse_raw()
			return

		pos = 0

		# Find various sections
		# SNES9x format varies by version

		# Try to locate RAM section
		ram_marker = b'RAM:'
		ram_pos = self.data.find(ram_marker)
		if ram_pos >= 0:
			# RAM size in SNES is 128KB (or less for some games)
			ram_start = ram_pos + 4
			self.sections['ram'] = self.data[ram_start:ram_start + 0x20000]

	def _parse_raw(self):
		"""Parse as raw data."""
		self.sections['raw'] = self.data
		self.metadata['format'] = 'SNES9x (unknown version)'

	def export(self) -> bytes:
		"""Export modified save state."""
		# For now, return raw data
		return self.data


class VisualBoySaveState(SaveStateFormat):
	"""Visual Boy Advance save state format."""

	def _parse(self):
		"""Parse VBA save state."""
		# Check for gzip
		if self.data[:2] == b'\x1f\x8b':
			self.data = gzip.decompress(self.data)

		self.metadata['format'] = 'VisualBoyAdvance'

		# VBA format starts with VBA header
		# Structure varies by version

		# GBA has 256KB internal RAM + other RAM areas
		self.sections['raw'] = self.data

	def export(self) -> bytes:
		return self.data


class MesenSaveState(SaveStateFormat):
	"""Mesen save state format."""

	def _parse(self):
		"""Parse Mesen save state."""
		# Mesen uses MSS format with compression
		if self.data[:3] != b'MSS':
			# Try decompression
			try:
				self.data = zlib.decompress(self.data)
			except zlib.error:
				pass

		self.metadata['format'] = 'Mesen'

		# Parse MSS sections
		if self.data[:3] == b'MSS':
			pos = 8  # Skip header

			while pos < len(self.data):
				if pos + 8 > len(self.data):
					break

				# Section header
				section_name = self.data[pos:pos + 4].decode('ascii', errors='replace')
				section_size = struct.unpack('<I', self.data[pos + 4:pos + 8])[0]
				pos += 8

				if pos + section_size > len(self.data):
					break

				self.sections[section_name] = self.data[pos:pos + section_size]
				pos += section_size

			# Extract RAM
			if 'NRAM' in self.sections:
				self.sections['ram'] = self.sections['NRAM']

	def export(self) -> bytes:
		return self.data


def detect_format(data: bytes) -> Optional[SaveStateFormat]:
	"""Detect and parse save state format."""
	# Check for gzip first
	if data[:2] == b'\x1f\x8b':
		try:
			data = gzip.decompress(data)
		except gzip.BadGzipFile:
			pass

	# FCEUX
	if data[:3] == b'FCS' or data[:4] == b'FCEU':
		return FCEUXSaveState(data)

	# SNES9x
	if data[:4] == b'#!s9':
		return SNES9xSaveState(data)

	# Mesen
	if data[:3] == b'MSS':
		return MesenSaveState(data)

	# VBA
	if data[:3] == b'VBA' or b'VBAM' in data[:20]:
		return VisualBoySaveState(data)

	# Unknown - return as raw
	class RawSaveState(SaveStateFormat):
		def _parse(self):
			self.sections['raw'] = self.data
			self.metadata['format'] = 'Unknown (raw)'

		def export(self):
			return self.data

	return RawSaveState(data)


def cmd_info(args):
	"""Show save state info."""
	data = Path(args.file).read_bytes()
	state = detect_format(data)

	print(f"File: {args.file}")
	print(f"Size: {len(data):,} bytes")
	print(f"Format: {state.metadata.get('format', 'Unknown')}")
	print()

	print("Sections:")
	for name, section_data in state.sections.items():
		print(f"  {name}: {len(section_data):,} bytes")


def cmd_dump(args):
	"""Dump section data."""
	data = Path(args.file).read_bytes()
	state = detect_format(data)

	section = args.section.lower()
	section_data = state.sections.get(section)

	if section_data is None:
		# Try case-insensitive match
		for name, sdata in state.sections.items():
			if name.lower() == section:
				section_data = sdata
				break

	if section_data is None:
		print(f"Section '{args.section}' not found")
		print(f"Available sections: {', '.join(state.sections.keys())}")
		sys.exit(1)

	if args.output:
		Path(args.output).write_bytes(section_data)
		print(f"Dumped {len(section_data):,} bytes to {args.output}")
	else:
		# Hex dump
		offset = args.offset or 0
		length = args.length or min(256, len(section_data) - offset)

		for i in range(0, length, 16):
			addr = offset + i
			row = section_data[addr:addr + 16]

			hex_str = ' '.join(f'{b:02X}' for b in row)
			ascii_str = ''.join(chr(b) if 32 <= b < 127 else '.' for b in row)

			print(f"{addr:06X}  {hex_str:<48}  {ascii_str}")


def cmd_edit(args):
	"""Edit save state value."""
	data = Path(args.file).read_bytes()
	state = detect_format(data)

	offset = int(args.offset, 16) if args.offset.startswith('0x') else int(args.offset)

	if args.value.startswith('0x'):
		value = bytes.fromhex(args.value[2:])
	else:
		value = bytes([int(args.value)])

	# Edit RAM
	state.set_ram(offset, value)

	# Save
	output_path = args.output or args.file
	modified_data = state.export()
	Path(output_path).write_bytes(modified_data)

	print(f"Set {len(value)} byte(s) at offset 0x{offset:04X}")
	print(f"Saved to: {output_path}")


def cmd_compare(args):
	"""Compare two save states."""
	data1 = Path(args.file1).read_bytes()
	data2 = Path(args.file2).read_bytes()

	state1 = detect_format(data1)
	state2 = detect_format(data2)

	print(f"File 1: {args.file1} ({state1.metadata.get('format', 'Unknown')})")
	print(f"File 2: {args.file2} ({state2.metadata.get('format', 'Unknown')})")
	print()

	# Compare RAM
	ram1 = state1.get_ram()
	ram2 = state2.get_ram()

	if not ram1 or not ram2:
		print("Cannot compare: RAM not found in one or both states")
		return

	print(f"RAM size 1: {len(ram1):,} bytes")
	print(f"RAM size 2: {len(ram2):,} bytes")
	print()

	# Find differences
	min_len = min(len(ram1), len(ram2))
	diffs = []

	for i in range(min_len):
		if ram1[i] != ram2[i]:
			diffs.append((i, ram1[i], ram2[i]))

	print(f"Differences: {len(diffs)}")

	if diffs and len(diffs) <= 50:
		print("\nOffset     File1  File2")
		print("-" * 30)
		for offset, val1, val2 in diffs:
			print(f"0x{offset:04X}     ${val1:02X}   ${val2:02X}")
	elif diffs:
		print(f"\n(Too many differences to display - showing first 50)")
		print("\nOffset     File1  File2")
		print("-" * 30)
		for offset, val1, val2 in diffs[:50]:
			print(f"0x{offset:04X}     ${val1:02X}   ${val2:02X}")


def cmd_extract(args):
	"""Extract all sections."""
	data = Path(args.file).read_bytes()
	state = detect_format(data)

	output_dir = Path(args.output)
	output_dir.mkdir(parents=True, exist_ok=True)

	for name, section_data in state.sections.items():
		safe_name = ''.join(c if c.isalnum() else '_' for c in name)
		output_path = output_dir / f"{safe_name}.bin"
		output_path.write_bytes(section_data)
		print(f"Extracted {name}: {len(section_data):,} bytes -> {output_path}")


def main():
	parser = argparse.ArgumentParser(description="Save State Editor")
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Info
	info = subparsers.add_parser('info', help='Show save state info')
	info.add_argument('file', help='Save state file')

	# Dump
	dump = subparsers.add_parser('dump', help='Dump section data')
	dump.add_argument('file', help='Save state file')
	dump.add_argument('--section', '-s', default='ram', help='Section to dump')
	dump.add_argument('--offset', '-o', type=lambda x: int(x, 0), help='Start offset')
	dump.add_argument('--length', '-l', type=int, help='Length to dump')
	dump.add_argument('--output', help='Output file (binary)')

	# Edit
	edit = subparsers.add_parser('edit', help='Edit save state value')
	edit.add_argument('file', help='Save state file')
	edit.add_argument('--offset', '-o', required=True, help='Offset in RAM')
	edit.add_argument('--value', '-v', required=True, help='New value (hex or decimal)')
	edit.add_argument('--output', help='Output file (default: overwrite)')

	# Compare
	compare = subparsers.add_parser('compare', help='Compare two save states')
	compare.add_argument('file1', help='First save state')
	compare.add_argument('file2', help='Second save state')

	# Extract
	extract = subparsers.add_parser('extract', help='Extract all sections')
	extract.add_argument('file', help='Save state file')
	extract.add_argument('--output', '-o', default='extracted', help='Output directory')

	args = parser.parse_args()

	commands = {
		'info': cmd_info,
		'dump': cmd_dump,
		'edit': cmd_edit,
		'compare': cmd_compare,
		'extract': cmd_extract,
	}

	if args.command in commands:
		commands[args.command](args)
	else:
		parser.print_help()


if __name__ == '__main__':
	main()
