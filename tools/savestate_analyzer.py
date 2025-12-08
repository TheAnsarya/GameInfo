#!/usr/bin/env python3
"""
Save State Analyzer - Parse and analyze emulator save states.

Supports:
- FCEUX (NES) save states
- SNES9x save states
- BGB (Game Boy) save states
- VBA (GBA) save states
- Generic save state inspection

Author: ROM Hacking Toolkit
"""

import argparse
import gzip
import json
import os
import struct
import sys
import zlib
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, BinaryIO, Dict, List, Optional, Tuple


class EmulatorType(Enum):
	"""Supported emulator types."""
	FCEUX = "fceux"
	SNES9X = "snes9x"
	BGB = "bgb"
	VBA = "vba"
	MESEN = "mesen"
	BSNES = "bsnes"
	UNKNOWN = "unknown"


@dataclass
class MemoryRegion:
	"""Memory region within save state."""
	name: str
	offset: int
	size: int
	data: Optional[bytes] = None


@dataclass
class SaveStateInfo:
	"""Information about a save state."""
	emulator: EmulatorType
	platform: str
	rom_name: str = ""
	timestamp: str = ""
	frame_count: int = 0
	regions: List[MemoryRegion] = field(default_factory=list)
	metadata: Dict[str, Any] = field(default_factory=dict)


class FCEUXState:
	"""Parse FCEUX save states (.fcs files)."""
	
	def __init__(self, data: bytes):
		"""Initialize with state data."""
		self.data = data
		self.sections: Dict[str, bytes] = {}
		self._parse()
	
	def _parse(self) -> None:
		"""Parse the save state."""
		# FCEUX states may be gzip compressed
		if self.data[:3] == b'FCS':
			self._parse_fcs()
		elif self.data[:2] == b'\x1f\x8b':
			# Gzip compressed
			decompressed = gzip.decompress(self.data)
			self.data = decompressed
			self._parse_fcs()
	
	def _parse_fcs(self) -> None:
		"""Parse FCS format."""
		if self.data[:3] != b'FCS':
			raise ValueError("Not a valid FCEUX state")
		
		# FCS format: "FCS" + version byte + sections
		pos = 4
		
		while pos < len(self.data):
			if pos + 5 > len(self.data):
				break
			
			# Section: 4-byte name + 4-byte size + data
			section_name = self.data[pos:pos+4].decode('ascii', errors='replace').strip('\x00')
			pos += 4
			
			if pos + 4 > len(self.data):
				break
			
			section_size = struct.unpack('<I', self.data[pos:pos+4])[0]
			pos += 4
			
			if pos + section_size > len(self.data):
				section_size = len(self.data) - pos
			
			section_data = self.data[pos:pos+section_size]
			self.sections[section_name] = section_data
			pos += section_size
	
	def get_ram(self) -> Optional[bytes]:
		"""Get RAM contents."""
		return self.sections.get('RAM')
	
	def get_info(self) -> SaveStateInfo:
		"""Get save state information."""
		info = SaveStateInfo(
			emulator=EmulatorType.FCEUX,
			platform="NES"
		)
		
		for name, data in self.sections.items():
			info.regions.append(MemoryRegion(
				name=name,
				offset=0,
				size=len(data),
				data=data
			))
		
		# Try to get frame count
		if 'FCEUMOV' in self.sections:
			info.metadata['movie_data'] = True
		
		return info


class SNES9xState:
	"""Parse SNES9x save states."""
	
	def __init__(self, data: bytes):
		"""Initialize with state data."""
		self.data = data
		self.sections: Dict[str, bytes] = {}
		self._parse()
	
	def _parse(self) -> None:
		"""Parse the save state."""
		# SNES9x states can be compressed or not
		if self.data[:2] == b'\x1f\x8b':
			self.data = gzip.decompress(self.data)
		
		# Check for SNES9x header
		if self.data[:8] == b'#!snes9x':
			self._parse_snes9x()
		elif self.data[:3] in [b'SN9', b'\x00SN']:
			self._parse_snes9x()
	
	def _parse_snes9x(self) -> None:
		"""Parse SNES9x format."""
		# Find section markers and RAM
		pos = 0
		
		# WRAM is typically 128KB
		wram_size = 0x20000
		
		# Search for known patterns
		for offset in range(0, min(len(self.data), 0x10000), 0x100):
			chunk = self.data[offset:offset+8]
			if chunk == b'RAM:' or chunk[:4] == b'RAM\x00':
				self.sections['WRAM'] = self.data[offset+4:offset+4+wram_size]
				break
	
	def get_info(self) -> SaveStateInfo:
		"""Get save state information."""
		info = SaveStateInfo(
			emulator=EmulatorType.SNES9X,
			platform="SNES"
		)
		
		for name, data in self.sections.items():
			info.regions.append(MemoryRegion(
				name=name,
				offset=0,
				size=len(data),
				data=data
			))
		
		return info


class BGBState:
	"""Parse BGB save states (.sn* files)."""
	
	def __init__(self, data: bytes):
		"""Initialize with state data."""
		self.data = data
		self.sections: Dict[str, bytes] = {}
		self._parse()
	
	def _parse(self) -> None:
		"""Parse the save state."""
		# BGB states start with version info
		if len(self.data) < 0x100:
			return
		
		# Work RAM is at known offsets
		# WRAM: 8KB for GB, 32KB for GBC
		# HRAM: 127 bytes
		# VRAM: 8KB for GB, 16KB for GBC
		
		# Try to detect GBC vs GB
		# This is a simplified parser
		if len(self.data) > 0x10000:
			# GBC mode likely
			self.sections['WRAM'] = self.data[0x0000:0x8000]
			self.sections['VRAM'] = self.data[0x8000:0xC000]
		else:
			self.sections['WRAM'] = self.data[0x0000:0x2000]
			self.sections['VRAM'] = self.data[0x2000:0x4000]
	
	def get_info(self) -> SaveStateInfo:
		"""Get save state information."""
		info = SaveStateInfo(
			emulator=EmulatorType.BGB,
			platform="Game Boy"
		)
		
		for name, data in self.sections.items():
			info.regions.append(MemoryRegion(
				name=name,
				offset=0,
				size=len(data),
				data=data
			))
		
		return info


class MesenState:
	"""Parse Mesen save states."""
	
	def __init__(self, data: bytes):
		"""Initialize with state data."""
		self.data = data
		self.sections: Dict[str, bytes] = {}
		self._parse()
	
	def _parse(self) -> None:
		"""Parse the save state."""
		# Mesen uses a compressed format with JSON metadata
		# Try to decompress
		try:
			if self.data[:2] == b'\x1f\x8b':
				self.data = gzip.decompress(self.data)
		except Exception:
			pass
		
		# Look for known section markers
		pos = 0
		while pos < len(self.data) - 8:
			# Look for section headers
			marker = self.data[pos:pos+8]
			if marker.startswith(b'MSS'):
				# Found Mesen section
				break
			pos += 1
	
	def get_info(self) -> SaveStateInfo:
		"""Get save state information."""
		return SaveStateInfo(
			emulator=EmulatorType.MESEN,
			platform="NES/SNES"
		)


def detect_emulator(data: bytes, filename: str = "") -> EmulatorType:
	"""Detect emulator type from save state data."""
	ext = Path(filename).suffix.lower() if filename else ""
	
	# Check by extension
	if ext in ['.fcs', '.fc0', '.fc1', '.fc2']:
		return EmulatorType.FCEUX
	elif ext in ['.000', '.001', '.zs0', '.zs1', '.zss']:
		return EmulatorType.SNES9X
	elif ext in ['.sn0', '.sn1', '.sna', '.ss0', '.ss1']:
		return EmulatorType.BGB
	elif ext in ['.sgm', '.ss1', '.ss2']:
		return EmulatorType.VBA
	elif ext == '.mss':
		return EmulatorType.MESEN
	elif ext in ['.bss', '.bs0', '.bs1']:
		return EmulatorType.BSNES
	
	# Check by content
	# Decompress if needed
	if data[:2] == b'\x1f\x8b':
		try:
			data = gzip.decompress(data)
		except Exception:
			pass
	
	# FCEUX
	if data[:3] == b'FCS':
		return EmulatorType.FCEUX
	
	# SNES9x
	if data[:8] == b'#!snes9x' or data[:3] == b'SN9':
		return EmulatorType.SNES9X
	
	# Mesen
	if data[:3] == b'MSS':
		return EmulatorType.MESEN
	
	return EmulatorType.UNKNOWN


def parse_save_state(path: str) -> SaveStateInfo:
	"""Parse a save state file."""
	data = Path(path).read_bytes()
	emulator = detect_emulator(data, path)
	
	if emulator == EmulatorType.FCEUX:
		state = FCEUXState(data)
		return state.get_info()
	elif emulator == EmulatorType.SNES9X:
		state = SNES9xState(data)
		return state.get_info()
	elif emulator == EmulatorType.BGB:
		state = BGBState(data)
		return state.get_info()
	elif emulator == EmulatorType.MESEN:
		state = MesenState(data)
		return state.get_info()
	else:
		# Generic inspection
		info = SaveStateInfo(
			emulator=EmulatorType.UNKNOWN,
			platform="Unknown"
		)
		info.metadata['size'] = len(data)
		info.metadata['compressed'] = data[:2] == b'\x1f\x8b'
		return info


def extract_memory(state_path: str, output_path: str, region: str = "RAM") -> bool:
	"""Extract memory region from save state."""
	data = Path(state_path).read_bytes()
	emulator = detect_emulator(data, state_path)
	
	if emulator == EmulatorType.FCEUX:
		state = FCEUXState(data)
		ram = state.get_ram()
		if ram:
			Path(output_path).write_bytes(ram)
			return True
	elif emulator == EmulatorType.SNES9X:
		state = SNES9xState(data)
		if 'WRAM' in state.sections:
			Path(output_path).write_bytes(state.sections['WRAM'])
			return True
	elif emulator == EmulatorType.BGB:
		state = BGBState(data)
		if region in state.sections:
			Path(output_path).write_bytes(state.sections[region])
			return True
	
	return False


def compare_states(path1: str, path2: str) -> Dict[str, Any]:
	"""Compare two save states."""
	data1 = Path(path1).read_bytes()
	data2 = Path(path2).read_bytes()
	
	# Decompress if needed
	if data1[:2] == b'\x1f\x8b':
		try:
			data1 = gzip.decompress(data1)
		except Exception:
			pass
	
	if data2[:2] == b'\x1f\x8b':
		try:
			data2 = gzip.decompress(data2)
		except Exception:
			pass
	
	# Basic comparison
	result = {
		'size1': len(data1),
		'size2': len(data2),
		'same_size': len(data1) == len(data2),
		'differences': []
	}
	
	# Find differences
	min_len = min(len(data1), len(data2))
	diff_count = 0
	
	for i in range(min_len):
		if data1[i] != data2[i]:
			if diff_count < 100:
				result['differences'].append({
					'offset': i,
					'old': data1[i],
					'new': data2[i]
				})
			diff_count += 1
	
	result['total_differences'] = diff_count
	
	return result


def format_state_info(info: SaveStateInfo) -> str:
	"""Format save state info for display."""
	lines = [
		f"Emulator: {info.emulator.value}",
		f"Platform: {info.platform}",
	]
	
	if info.rom_name:
		lines.append(f"ROM: {info.rom_name}")
	if info.timestamp:
		lines.append(f"Timestamp: {info.timestamp}")
	if info.frame_count:
		lines.append(f"Frame count: {info.frame_count:,}")
	
	if info.regions:
		lines.append("")
		lines.append("Memory regions:")
		for region in info.regions:
			lines.append(f"  {region.name}: {region.size:,} bytes")
	
	if info.metadata:
		lines.append("")
		lines.append("Metadata:")
		for key, value in info.metadata.items():
			lines.append(f"  {key}: {value}")
	
	return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Parse and analyze emulator save states",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Supported Emulators:
  FCEUX   - NES emulator (.fcs, .fc0-fc9)
  SNES9x  - SNES emulator (.000-009, .zs0-zs9)
  BGB     - Game Boy emulator (.sn0-sn9)
  VBA     - GBA emulator (.sgm)
  Mesen   - Multi-system (.mss)

Examples:
  %(prog)s info state.fcs
  %(prog)s extract state.fcs -o ram.bin
  %(prog)s compare state1.fcs state2.fcs
  %(prog)s dump state.fcs --hex
		"""
	)
	
	subparsers = parser.add_subparsers(dest="command", help="Command to execute")
	
	# Info command
	info_parser = subparsers.add_parser("info", help="Show save state information")
	info_parser.add_argument("state", help="Save state file")
	
	# Extract command
	extract_parser = subparsers.add_parser("extract", help="Extract memory region")
	extract_parser.add_argument("state", help="Save state file")
	extract_parser.add_argument("-o", "--output", required=True, help="Output file")
	extract_parser.add_argument("-r", "--region", default="RAM", help="Memory region name")
	
	# Compare command
	compare_parser = subparsers.add_parser("compare", help="Compare two save states")
	compare_parser.add_argument("state1", help="First save state")
	compare_parser.add_argument("state2", help="Second save state")
	compare_parser.add_argument("--json", action="store_true", help="Output as JSON")
	
	# Dump command
	dump_parser = subparsers.add_parser("dump", help="Dump save state contents")
	dump_parser.add_argument("state", help="Save state file")
	dump_parser.add_argument("--hex", action="store_true", help="Hex dump")
	dump_parser.add_argument("-o", "--output", help="Output file")
	
	# Watch command
	watch_parser = subparsers.add_parser("watch", help="Watch address in save state")
	watch_parser.add_argument("state", help="Save state file")
	watch_parser.add_argument("--address", "-a", type=lambda x: int(x, 16), required=True)
	watch_parser.add_argument("--length", "-l", type=int, default=16)
	
	args = parser.parse_args()
	
	if not args.command:
		parser.print_help()
		return 1
	
	try:
		if args.command == "info":
			info = parse_save_state(args.state)
			print(format_state_info(info))
		
		elif args.command == "extract":
			if extract_memory(args.state, args.output, args.region):
				print(f"Extracted {args.region} to: {args.output}")
			else:
				print(f"Could not extract region: {args.region}")
				return 1
		
		elif args.command == "compare":
			result = compare_states(args.state1, args.state2)
			
			if args.json:
				print(json.dumps(result, indent=2))
			else:
				print(f"State 1 size: {result['size1']:,} bytes")
				print(f"State 2 size: {result['size2']:,} bytes")
				print(f"Total differences: {result['total_differences']:,}")
				
				if result['differences']:
					print()
					print("First differences:")
					for diff in result['differences'][:20]:
						print(f"  ${diff['offset']:06X}: ${diff['old']:02X} -> ${diff['new']:02X}")
		
		elif args.command == "dump":
			info = parse_save_state(args.state)
			
			output_lines = []
			for region in info.regions:
				if region.data:
					output_lines.append(f"=== {region.name} ({region.size} bytes) ===")
					
					if args.hex:
						for i in range(0, min(len(region.data), 0x1000), 16):
							hex_part = ' '.join(f'{b:02X}' for b in region.data[i:i+16])
							ascii_part = ''.join(
								chr(b) if 32 <= b < 127 else '.'
								for b in region.data[i:i+16]
							)
							output_lines.append(f"{i:06X}  {hex_part:<48}  {ascii_part}")
					else:
						output_lines.append(f"First 256 bytes: {region.data[:256].hex()}")
			
			output = '\n'.join(output_lines)
			
			if args.output:
				Path(args.output).write_text(output)
				print(f"Dump saved to: {args.output}")
			else:
				print(output)
		
		elif args.command == "watch":
			data = Path(args.state).read_bytes()
			
			# Decompress if needed
			if data[:2] == b'\x1f\x8b':
				data = gzip.decompress(data)
			
			addr = args.address
			length = args.length
			
			if addr + length <= len(data):
				chunk = data[addr:addr + length]
				print(f"Address ${addr:06X}:")
				hex_str = ' '.join(f'{b:02X}' for b in chunk)
				print(f"  Hex: {hex_str}")
				print(f"  Dec: {', '.join(str(b) for b in chunk)}")
			else:
				print(f"Address ${addr:06X} out of range (file size: {len(data)})")
				return 1
	
	except FileNotFoundError as e:
		print(f"Error: File not found: {e.filename}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1
	
	return 0


if __name__ == "__main__":
	sys.exit(main())
