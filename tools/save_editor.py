#!/usr/bin/env python3
"""
Save File Editor - Edit game save files for various platforms.

Tools for reading, modifying, and validating game saves
with checksum recalculation.

Usage:
	python save_editor.py <save.sav>
	python save_editor.py --analyze
	python save_editor.py --checksum

Features:
	- Multiple save format support
	- Checksum detection and fixing
	- Value editing with validation
	- Backup creation
	- Structure analysis
"""

import argparse
import hashlib
import json
import os
import shutil
import struct
import sys
from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum, auto
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple, Union


class Platform(Enum):
	"""Game platforms."""
	NES = auto()
	SNES = auto()
	GB = auto()
	GBC = auto()
	GBA = auto()
	N64 = auto()
	PS1 = auto()
	GENERIC = auto()


class DataType(Enum):
	"""Save data types."""
	UINT8 = "B"
	INT8 = "b"
	UINT16_LE = "<H"
	UINT16_BE = ">H"
	INT16_LE = "<h"
	INT16_BE = ">h"
	UINT32_LE = "<I"
	UINT32_BE = ">I"
	INT32_LE = "<i"
	INT32_BE = ">i"
	STRING = "s"
	BCD = "bcd"
	BITFIELD = "bits"


class ChecksumType(Enum):
	"""Checksum algorithms."""
	SUM8 = auto()      # 8-bit sum
	SUM16_LE = auto()  # 16-bit sum LE
	SUM16_BE = auto()  # 16-bit sum BE
	XOR8 = auto()      # 8-bit XOR
	CRC16 = auto()     # CRC-16
	CRC32 = auto()     # CRC-32
	COMPLEMENT = auto()  # Two's complement


@dataclass
class SaveField:
	"""A field within a save file."""
	name: str
	offset: int
	data_type: DataType
	size: int = 1
	description: str = ""
	min_value: Optional[int] = None
	max_value: Optional[int] = None
	encoding: str = "ascii"  # For strings
	
	def get_size(self) -> int:
		"""Get byte size of field."""
		if self.data_type == DataType.STRING:
			return self.size
		elif self.data_type in [DataType.UINT8, DataType.INT8]:
			return 1
		elif self.data_type in [DataType.UINT16_LE, DataType.UINT16_BE,
								DataType.INT16_LE, DataType.INT16_BE]:
			return 2
		elif self.data_type in [DataType.UINT32_LE, DataType.UINT32_BE,
								DataType.INT32_LE, DataType.INT32_BE]:
			return 4
		elif self.data_type == DataType.BCD:
			return self.size
		elif self.data_type == DataType.BITFIELD:
			return self.size
		return 1
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"name": self.name,
			"offset": self.offset,
			"type": self.data_type.name
		}
		if self.size > 1:
			result["size"] = self.size
		if self.description:
			result["description"] = self.description
		if self.min_value is not None:
			result["min"] = self.min_value
		if self.max_value is not None:
			result["max"] = self.max_value
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "SaveField":
		"""Create from dictionary."""
		return cls(
			name=data["name"],
			offset=data["offset"],
			data_type=DataType[data.get("type", "UINT8")],
			size=data.get("size", 1),
			description=data.get("description", ""),
			min_value=data.get("min"),
			max_value=data.get("max"),
			encoding=data.get("encoding", "ascii")
		)


@dataclass
class ChecksumInfo:
	"""Checksum configuration."""
	algorithm: ChecksumType
	start: int
	end: int
	location: int
	size: int = 2


@dataclass
class SaveSlot:
	"""A save slot configuration."""
	name: str
	start: int
	size: int
	fields: List[SaveField] = field(default_factory=list)
	checksum: Optional[ChecksumInfo] = None


@dataclass
class SaveFormat:
	"""Complete save format specification."""
	name: str
	platform: Platform
	file_size: int
	slots: List[SaveSlot] = field(default_factory=list)
	header_size: int = 0
	endianness: str = "little"


class SaveEditor:
	"""Edit game save files."""
	
	def __init__(self, format_spec: Optional[SaveFormat] = None):
		self.format = format_spec
		self.data: bytearray = bytearray()
		self.filepath: str = ""
		self.modified = False
	
	def load(self, filepath: str) -> None:
		"""Load save file."""
		with open(filepath, "rb") as f:
			self.data = bytearray(f.read())
		self.filepath = filepath
		self.modified = False
	
	def save(self, filepath: Optional[str] = None) -> None:
		"""Save file with backup."""
		filepath = filepath or self.filepath
		if not filepath:
			raise ValueError("No filepath specified")
		
		# Create backup
		if os.path.exists(filepath):
			backup = f"{filepath}.bak"
			shutil.copy2(filepath, backup)
		
		with open(filepath, "wb") as f:
			f.write(self.data)
		
		self.modified = False
	
	def read_value(self, offset: int, data_type: DataType, 
				   size: int = 1) -> Union[int, str, bytes]:
		"""Read value from save data."""
		if data_type == DataType.STRING:
			return self.data[offset:offset + size].decode("ascii", errors="replace").rstrip("\x00")
		elif data_type == DataType.BCD:
			# Binary-coded decimal
			value = 0
			for i, b in enumerate(self.data[offset:offset + size]):
				high = (b >> 4) * 10 ** ((size - i - 1) * 2 + 1)
				low = (b & 0x0F) * 10 ** ((size - i - 1) * 2)
				value += high + low
			return value
		elif data_type == DataType.BITFIELD:
			return bytes(self.data[offset:offset + size])
		else:
			return struct.unpack(data_type.value, 
								 bytes(self.data[offset:offset + struct.calcsize(data_type.value)]))[0]
	
	def write_value(self, offset: int, value: Union[int, str, bytes],
					data_type: DataType, size: int = 1) -> None:
		"""Write value to save data."""
		if data_type == DataType.STRING:
			encoded = value.encode("ascii")[:size].ljust(size, b"\x00")
			self.data[offset:offset + size] = encoded
		elif data_type == DataType.BCD:
			# Binary-coded decimal
			remaining = value
			for i in range(size - 1, -1, -1):
				low = remaining % 10
				remaining //= 10
				high = remaining % 10
				remaining //= 10
				self.data[offset + i] = (high << 4) | low
		elif data_type == DataType.BITFIELD:
			self.data[offset:offset + size] = value
		else:
			packed = struct.pack(data_type.value, value)
			fmt_size = struct.calcsize(data_type.value)
			self.data[offset:offset + fmt_size] = packed
		
		self.modified = True
	
	def read_field(self, field_ref: SaveField) -> Union[int, str, bytes]:
		"""Read a defined field."""
		return self.read_value(field_ref.offset, field_ref.data_type, field_ref.size)
	
	def write_field(self, field_ref: SaveField, value: Union[int, str, bytes]) -> None:
		"""Write a defined field."""
		# Validate
		if isinstance(value, int):
			if field_ref.min_value is not None and value < field_ref.min_value:
				raise ValueError(f"Value {value} below minimum {field_ref.min_value}")
			if field_ref.max_value is not None and value > field_ref.max_value:
				raise ValueError(f"Value {value} above maximum {field_ref.max_value}")
		
		self.write_value(field_ref.offset, value, field_ref.data_type, field_ref.size)
	
	def calculate_checksum(self, checksum: ChecksumInfo) -> int:
		"""Calculate checksum for data range."""
		data = self.data[checksum.start:checksum.end]
		
		if checksum.algorithm == ChecksumType.SUM8:
			return sum(data) & 0xFF
		
		elif checksum.algorithm == ChecksumType.SUM16_LE:
			return sum(data) & 0xFFFF
		
		elif checksum.algorithm == ChecksumType.SUM16_BE:
			return sum(data) & 0xFFFF
		
		elif checksum.algorithm == ChecksumType.XOR8:
			result = 0
			for b in data:
				result ^= b
			return result
		
		elif checksum.algorithm == ChecksumType.CRC16:
			# CRC-16-CCITT
			crc = 0xFFFF
			for b in data:
				crc ^= b << 8
				for _ in range(8):
					if crc & 0x8000:
						crc = (crc << 1) ^ 0x1021
					else:
						crc <<= 1
					crc &= 0xFFFF
			return crc
		
		elif checksum.algorithm == ChecksumType.CRC32:
			return binascii.crc32(bytes(data)) & 0xFFFFFFFF
		
		elif checksum.algorithm == ChecksumType.COMPLEMENT:
			return (~sum(data) + 1) & (0xFF if checksum.size == 1 else 0xFFFF)
		
		return 0
	
	def verify_checksum(self, checksum: ChecksumInfo) -> Tuple[bool, int, int]:
		"""Verify checksum. Returns (valid, stored, calculated)."""
		stored = self.read_value(
			checksum.location,
			DataType.UINT16_LE if checksum.size == 2 else DataType.UINT8
		)
		calculated = self.calculate_checksum(checksum)
		return stored == calculated, stored, calculated
	
	def fix_checksum(self, checksum: ChecksumInfo) -> None:
		"""Recalculate and write correct checksum."""
		calculated = self.calculate_checksum(checksum)
		data_type = DataType.UINT16_LE if checksum.size == 2 else DataType.UINT8
		self.write_value(checksum.location, calculated, data_type)
	
	def analyze(self) -> Dict[str, Any]:
		"""Analyze save file structure."""
		analysis = {
			"size": len(self.data),
			"entropy": self._calculate_entropy(),
			"null_regions": self._find_null_regions(),
			"repeated_patterns": self._find_patterns(),
			"potential_checksums": self._detect_checksums()
		}
		return analysis
	
	def _calculate_entropy(self) -> float:
		"""Calculate Shannon entropy."""
		if not self.data:
			return 0.0
		
		import math
		freq = [0] * 256
		for b in self.data:
			freq[b] += 1
		
		entropy = 0.0
		for count in freq:
			if count > 0:
				p = count / len(self.data)
				entropy -= p * math.log2(p)
		
		return entropy
	
	def _find_null_regions(self, min_size: int = 16) -> List[Tuple[int, int]]:
		"""Find regions of null bytes."""
		regions = []
		start = None
		
		for i, b in enumerate(self.data):
			if b == 0:
				if start is None:
					start = i
			else:
				if start is not None and i - start >= min_size:
					regions.append((start, i - start))
				start = None
		
		# Handle end
		if start is not None and len(self.data) - start >= min_size:
			regions.append((start, len(self.data) - start))
		
		return regions
	
	def _find_patterns(self, min_length: int = 4) -> List[Tuple[int, bytes, int]]:
		"""Find repeated byte patterns."""
		patterns = {}
		
		for length in range(min_length, min(16, len(self.data) // 4)):
			for i in range(len(self.data) - length + 1):
				pattern = bytes(self.data[i:i + length])
				if pattern not in patterns:
					# Count occurrences
					count = 0
					pos = 0
					while True:
						pos = self.data.find(pattern, pos)
						if pos == -1:
							break
						count += 1
						pos += 1
					
					if count >= 3:
						patterns[pattern] = count
		
		# Return top patterns
		sorted_patterns = sorted(patterns.items(), key=lambda x: x[1], reverse=True)
		return [(0, p, c) for p, c in sorted_patterns[:10]]
	
	def _detect_checksums(self) -> List[Dict[str, Any]]:
		"""Attempt to detect checksum locations."""
		candidates = []
		
		# Look for potential checksum values
		for i in range(len(self.data) - 2):
			value = struct.unpack("<H", bytes(self.data[i:i + 2]))[0]
			
			# Test if this might be a checksum
			for start in range(0, i, 16):
				for end in range(start + 16, len(self.data), 16):
					if end > i:
						continue
					
					# Test sum16
					test_sum = sum(self.data[start:end]) & 0xFFFF
					if test_sum == value:
						candidates.append({
							"type": "SUM16",
							"location": i,
							"start": start,
							"end": end,
							"value": value
						})
						break
		
		return candidates[:5]  # Limit results
	
	def hex_dump(self, start: int = 0, length: int = 256) -> str:
		"""Generate hex dump of save data."""
		lines = []
		end = min(start + length, len(self.data))
		
		for offset in range(start, end, 16):
			# Hex values
			hex_values = []
			ascii_values = []
			
			for i in range(16):
				if offset + i < end:
					b = self.data[offset + i]
					hex_values.append(f"{b:02X}")
					ascii_values.append(chr(b) if 32 <= b < 127 else ".")
				else:
					hex_values.append("  ")
					ascii_values.append(" ")
			
			hex_str = " ".join(hex_values[:8]) + "  " + " ".join(hex_values[8:])
			ascii_str = "".join(ascii_values)
			
			lines.append(f"{offset:08X}  {hex_str}  |{ascii_str}|")
		
		return "\n".join(lines)
	
	def find_string(self, text: str, encoding: str = "ascii") -> List[int]:
		"""Find string in save data."""
		encoded = text.encode(encoding)
		positions = []
		pos = 0
		
		while True:
			pos = self.data.find(encoded, pos)
			if pos == -1:
				break
			positions.append(pos)
			pos += 1
		
		return positions
	
	def compare(self, other_path: str) -> List[Tuple[int, int, int]]:
		"""Compare with another save file. Returns list of (offset, old, new)."""
		with open(other_path, "rb") as f:
			other = f.read()
		
		differences = []
		for i in range(min(len(self.data), len(other))):
			if self.data[i] != other[i]:
				differences.append((i, self.data[i], other[i]))
		
		return differences


def create_example_format() -> SaveFormat:
	"""Create example save format specification."""
	# Example: Simple RPG save
	slot_fields = [
		SaveField("player_name", 0x00, DataType.STRING, size=8,
				 description="Player name"),
		SaveField("level", 0x08, DataType.UINT8,
				 description="Character level", min_value=1, max_value=99),
		SaveField("current_hp", 0x09, DataType.UINT16_LE,
				 description="Current HP", max_value=9999),
		SaveField("max_hp", 0x0B, DataType.UINT16_LE,
				 description="Maximum HP", max_value=9999),
		SaveField("current_mp", 0x0D, DataType.UINT16_LE,
				 description="Current MP", max_value=999),
		SaveField("max_mp", 0x0F, DataType.UINT16_LE,
				 description="Maximum MP", max_value=999),
		SaveField("experience", 0x11, DataType.UINT32_LE,
				 description="Experience points"),
		SaveField("gold", 0x15, DataType.UINT32_LE,
				 description="Gold", max_value=9999999),
		SaveField("strength", 0x19, DataType.UINT8,
				 description="Strength stat", max_value=255),
		SaveField("agility", 0x1A, DataType.UINT8,
				 description="Agility stat", max_value=255),
		SaveField("intelligence", 0x1B, DataType.UINT8,
				 description="Intelligence stat", max_value=255),
		SaveField("vitality", 0x1C, DataType.UINT8,
				 description="Vitality stat", max_value=255),
		SaveField("play_time", 0x20, DataType.UINT32_LE,
				 description="Play time in frames"),
	]
	
	slots = [
		SaveSlot(
			name="Slot 1",
			start=0x00,
			size=0x100,
			fields=slot_fields,
			checksum=ChecksumInfo(
				algorithm=ChecksumType.SUM16_LE,
				start=0x00,
				end=0xFE,
				location=0xFE
			)
		),
		SaveSlot(
			name="Slot 2",
			start=0x100,
			size=0x100,
			fields=[
				SaveField(f.name, f.offset + 0x100, f.data_type, f.size,
						 f.description, f.min_value, f.max_value)
				for f in slot_fields
			],
			checksum=ChecksumInfo(
				algorithm=ChecksumType.SUM16_LE,
				start=0x100,
				end=0x1FE,
				location=0x1FE
			)
		)
	]
	
	return SaveFormat(
		name="Example RPG Save",
		platform=Platform.SNES,
		file_size=0x2000,
		slots=slots
	)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Save File Editor")
	parser.add_argument("savefile", nargs="?", help="Save file to edit")
	parser.add_argument("--analyze", "-a", action="store_true",
						help="Analyze save structure")
	parser.add_argument("--dump", "-d", type=int, nargs="?", const=0,
						help="Hex dump from offset")
	parser.add_argument("--length", "-n", type=int, default=256,
						help="Dump length")
	parser.add_argument("--compare", "-c", help="Compare with another save")
	parser.add_argument("--find", "-f", help="Find string in save")
	parser.add_argument("--checksum", action="store_true",
						help="Verify/fix checksums")
	parser.add_argument("--export", "-e", help="Export format to JSON")
	parser.add_argument("--format", help="Load format from JSON")
	
	args = parser.parse_args()
	
	editor = SaveEditor()
	
	if args.format:
		# Load format specification
		# For now, use example
		editor.format = create_example_format()
	
	if args.savefile and os.path.exists(args.savefile):
		editor.load(args.savefile)
		print(f"Loaded: {args.savefile}")
		print(f"Size: {len(editor.data)} bytes")
		print()
	else:
		print("Save File Editor")
		print()
		print("Usage: python save_editor.py <save.sav>")
		print()
		print("Options:")
		print("  -a, --analyze    Analyze save structure")
		print("  -d, --dump       Hex dump")
		print("  -c, --compare    Compare saves")
		print("  -f, --find       Find string")
		print("  --checksum       Verify checksums")
		
		if not args.export:
			return
	
	# Analyze
	if args.analyze:
		analysis = editor.analyze()
		print("Analysis Results:")
		print(f"  Entropy: {analysis['entropy']:.2f} bits/byte")
		print(f"  Null regions: {len(analysis['null_regions'])}")
		for start, size in analysis["null_regions"][:5]:
			print(f"    0x{start:04X}-0x{start + size:04X} ({size} bytes)")
		
		if analysis["potential_checksums"]:
			print(f"\n  Potential checksums:")
			for cs in analysis["potential_checksums"]:
				print(f"    {cs['type']} at 0x{cs['location']:04X}: "
					  f"covers 0x{cs['start']:04X}-0x{cs['end']:04X}")
		print()
	
	# Hex dump
	if args.dump is not None:
		print(f"Hex dump from 0x{args.dump:04X}:")
		print(editor.hex_dump(args.dump, args.length))
		print()
	
	# Compare
	if args.compare:
		if os.path.exists(args.compare):
			diffs = editor.compare(args.compare)
			print(f"Differences: {len(diffs)}")
			for offset, old_val, new_val in diffs[:50]:
				print(f"  0x{offset:04X}: {old_val:02X} -> {new_val:02X}")
			if len(diffs) > 50:
				print(f"  ... and {len(diffs) - 50} more")
		else:
			print(f"File not found: {args.compare}")
		print()
	
	# Find string
	if args.find:
		positions = editor.find_string(args.find)
		print(f"Found '{args.find}' at {len(positions)} location(s):")
		for pos in positions[:10]:
			context = editor.data[max(0, pos - 8):pos + len(args.find) + 8]
			print(f"  0x{pos:04X}: {context.hex()}")
		print()
	
	# Checksum
	if args.checksum and editor.format:
		print("Checksum verification:")
		for slot in editor.format.slots:
			if slot.checksum:
				valid, stored, calc = editor.verify_checksum(slot.checksum)
				status = "OK" if valid else "MISMATCH"
				print(f"  {slot.name}: {status}")
				print(f"    Stored: 0x{stored:04X}, Calculated: 0x{calc:04X}")
		print()
	
	# Export format
	if args.export:
		fmt = create_example_format()
		data = {
			"name": fmt.name,
			"platform": fmt.platform.name,
			"file_size": fmt.file_size,
			"slots": []
		}
		for slot in fmt.slots:
			slot_data = {
				"name": slot.name,
				"start": slot.start,
				"size": slot.size,
				"fields": [f.to_dict() for f in slot.fields]
			}
			data["slots"].append(slot_data)
		
		with open(args.export, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t")
		print(f"Exported format: {args.export}")


if __name__ == "__main__":
	main()
