#!/usr/bin/env python3
"""
IPS/BPS Patch Manager - Create, apply, and analyze ROM patches.

Supports:
- IPS (International Patching System) patches
- BPS (Beat Patching System) patches
- UPS patches
- Patch analysis and comparison

Author: ROM Hacking Toolkit
"""

import argparse
import hashlib
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, BinaryIO


class PatchFormat(Enum):
	"""Supported patch formats."""
	IPS = "ips"
	BPS = "bps"
	UPS = "ups"


@dataclass
class IPSRecord:
	"""IPS patch record."""
	offset: int
	data: bytes
	is_rle: bool = False
	rle_count: int = 0
	rle_byte: int = 0


@dataclass
class BPSAction:
	"""BPS patch action."""
	action_type: str  # source_read, target_read, source_copy, target_copy
	length: int
	offset: int = 0


@dataclass
class PatchInfo:
	"""Information about a patch."""
	format_type: PatchFormat
	source_size: int = 0
	target_size: int = 0
	source_crc: int = 0
	target_crc: int = 0
	patch_crc: int = 0
	record_count: int = 0
	modified_bytes: int = 0
	ranges: List[Tuple[int, int]] = field(default_factory=list)


class IPSPatch:
	"""Handle IPS format patches."""
	
	HEADER = b'PATCH'
	EOF = b'EOF'
	
	def __init__(self):
		"""Initialize IPS patch."""
		self.records: List[IPSRecord] = []
	
	@classmethod
	def create(cls, source: bytes, target: bytes) -> 'IPSPatch':
		"""Create IPS patch from source and target files."""
		patch = cls()
		
		# Ensure same length by padding
		max_len = max(len(source), len(target))
		source = source.ljust(max_len, b'\x00')
		target = target.ljust(max_len, b'\x00')
		
		i = 0
		while i < max_len:
			# Find start of difference
			while i < max_len and source[i] == target[i]:
				i += 1
			
			if i >= max_len:
				break
			
			start = i
			
			# Find end of difference (or max record size)
			end = start
			while end < max_len and end - start < 0xFFFF:
				if source[end] == target[end]:
					# Check for enough same bytes to end record
					same_count = 0
					j = end
					while j < max_len and source[j] == target[j] and same_count < 8:
						same_count += 1
						j += 1
					if same_count >= 8:
						break
				end += 1
			
			data = target[start:end]
			
			# Check if RLE is beneficial
			if len(data) >= 13 and len(set(data)) == 1:
				patch.records.append(IPSRecord(
					offset=start,
					data=bytes(),
					is_rle=True,
					rle_count=len(data),
					rle_byte=data[0]
				))
			else:
				patch.records.append(IPSRecord(
					offset=start,
					data=data
				))
			
			i = end
		
		return patch
	
	def apply(self, source: bytes) -> bytes:
		"""Apply patch to source file."""
		result = bytearray(source)
		
		for record in self.records:
			# Extend if needed
			end_offset = record.offset + (record.rle_count if record.is_rle else len(record.data))
			if end_offset > len(result):
				result.extend(b'\x00' * (end_offset - len(result)))
			
			if record.is_rle:
				for i in range(record.rle_count):
					result[record.offset + i] = record.rle_byte
			else:
				result[record.offset:record.offset + len(record.data)] = record.data
		
		return bytes(result)
	
	@classmethod
	def load(cls, path: str) -> 'IPSPatch':
		"""Load IPS patch from file."""
		patch = cls()
		
		with open(path, 'rb') as f:
			header = f.read(5)
			if header != cls.HEADER:
				raise ValueError("Invalid IPS header")
			
			while True:
				offset_data = f.read(3)
				if offset_data == cls.EOF or len(offset_data) < 3:
					break
				
				offset = (offset_data[0] << 16) | (offset_data[1] << 8) | offset_data[2]
				size = struct.unpack('>H', f.read(2))[0]
				
				if size == 0:
					# RLE record
					rle_count = struct.unpack('>H', f.read(2))[0]
					rle_byte = f.read(1)[0]
					patch.records.append(IPSRecord(
						offset=offset,
						data=bytes(),
						is_rle=True,
						rle_count=rle_count,
						rle_byte=rle_byte
					))
				else:
					data = f.read(size)
					patch.records.append(IPSRecord(
						offset=offset,
						data=data
					))
		
		return patch
	
	def save(self, path: str) -> None:
		"""Save IPS patch to file."""
		with open(path, 'wb') as f:
			f.write(self.HEADER)
			
			for record in self.records:
				# Write offset (3 bytes, big-endian)
				offset = record.offset
				f.write(bytes([(offset >> 16) & 0xFF, (offset >> 8) & 0xFF, offset & 0xFF]))
				
				if record.is_rle:
					f.write(struct.pack('>H', 0))  # Size = 0 indicates RLE
					f.write(struct.pack('>H', record.rle_count))
					f.write(bytes([record.rle_byte]))
				else:
					f.write(struct.pack('>H', len(record.data)))
					f.write(record.data)
			
			f.write(self.EOF)
	
	def get_info(self) -> PatchInfo:
		"""Get patch information."""
		info = PatchInfo(format_type=PatchFormat.IPS)
		info.record_count = len(self.records)
		
		for record in self.records:
			if record.is_rle:
				size = record.rle_count
			else:
				size = len(record.data)
			
			info.modified_bytes += size
			info.ranges.append((record.offset, record.offset + size))
		
		return info


class BPSPatch:
	"""Handle BPS format patches."""
	
	HEADER = b'BPS1'
	
	def __init__(self):
		"""Initialize BPS patch."""
		self.source_size = 0
		self.target_size = 0
		self.metadata = ""
		self.actions: List[BPSAction] = []
		self.source_crc = 0
		self.target_crc = 0
		self.patch_crc = 0
	
	@staticmethod
	def _decode_number(f: BinaryIO) -> int:
		"""Decode variable-length number."""
		data = 0
		shift = 1
		
		while True:
			x = f.read(1)
			if not x:
				break
			x = x[0]
			data += (x & 0x7f) * shift
			if x & 0x80:
				break
			shift <<= 7
			data += shift
		
		return data
	
	@staticmethod
	def _encode_number(value: int) -> bytes:
		"""Encode variable-length number."""
		result = bytearray()
		
		while True:
			x = value & 0x7f
			value >>= 7
			if value == 0:
				result.append(x | 0x80)
				break
			result.append(x)
			value -= 1
		
		return bytes(result)
	
	@classmethod
	def load(cls, path: str) -> 'BPSPatch':
		"""Load BPS patch from file."""
		patch = cls()
		
		with open(path, 'rb') as f:
			# Read entire file for CRC check
			f.seek(0, 2)
			file_size = f.tell()
			f.seek(0)
			all_data = f.read()
			
			# Verify patch CRC
			patch.patch_crc = struct.unpack('<I', all_data[-4:])[0]
			calculated_crc = cls._crc32(all_data[:-4])
			if calculated_crc != patch.patch_crc:
				raise ValueError("Patch CRC mismatch")
			
			f.seek(0)
			
			header = f.read(4)
			if header != cls.HEADER:
				raise ValueError("Invalid BPS header")
			
			patch.source_size = cls._decode_number(f)
			patch.target_size = cls._decode_number(f)
			
			metadata_size = cls._decode_number(f)
			if metadata_size:
				patch.metadata = f.read(metadata_size).decode('utf-8', errors='replace')
			
			# Read actions until we reach CRCs
			while f.tell() < file_size - 12:
				data = cls._decode_number(f)
				command = data & 3
				length = (data >> 2) + 1
				
				if command == 0:
					patch.actions.append(BPSAction('source_read', length))
				elif command == 1:
					target_data = f.read(length)
					patch.actions.append(BPSAction('target_read', length, offset=0))
				elif command == 2:
					offset = cls._decode_number(f)
					offset = (-1 if offset & 1 else 1) * (offset >> 1)
					patch.actions.append(BPSAction('source_copy', length, offset))
				elif command == 3:
					offset = cls._decode_number(f)
					offset = (-1 if offset & 1 else 1) * (offset >> 1)
					patch.actions.append(BPSAction('target_copy', length, offset))
			
			# Read CRCs
			f.seek(file_size - 12)
			patch.source_crc = struct.unpack('<I', f.read(4))[0]
			patch.target_crc = struct.unpack('<I', f.read(4))[0]
		
		return patch
	
	@staticmethod
	def _crc32(data: bytes) -> int:
		"""Calculate CRC32."""
		import zlib
		return zlib.crc32(data) & 0xFFFFFFFF
	
	def get_info(self) -> PatchInfo:
		"""Get patch information."""
		return PatchInfo(
			format_type=PatchFormat.BPS,
			source_size=self.source_size,
			target_size=self.target_size,
			source_crc=self.source_crc,
			target_crc=self.target_crc,
			patch_crc=self.patch_crc,
			record_count=len(self.actions)
		)


def detect_format(path: str) -> PatchFormat:
	"""Detect patch format from file."""
	with open(path, 'rb') as f:
		header = f.read(5)
	
	if header[:5] == b'PATCH':
		return PatchFormat.IPS
	elif header[:4] == b'BPS1':
		return PatchFormat.BPS
	elif header[:4] == b'UPS1':
		return PatchFormat.UPS
	else:
		raise ValueError("Unknown patch format")


def format_patch_info(info: PatchInfo) -> str:
	"""Format patch info for display."""
	lines = [
		f"Format: {info.format_type.value.upper()}",
	]
	
	if info.source_size:
		lines.append(f"Source size: {info.source_size:,} bytes")
	if info.target_size:
		lines.append(f"Target size: {info.target_size:,} bytes")
	if info.source_crc:
		lines.append(f"Source CRC32: {info.source_crc:08X}")
	if info.target_crc:
		lines.append(f"Target CRC32: {info.target_crc:08X}")
	
	lines.append(f"Records: {info.record_count}")
	
	if info.modified_bytes:
		lines.append(f"Modified bytes: {info.modified_bytes:,}")
	
	if info.ranges:
		lines.append("")
		lines.append("Modified ranges:")
		for start, end in info.ranges[:20]:
			lines.append(f"  ${start:06X} - ${end:06X} ({end - start} bytes)")
		if len(info.ranges) > 20:
			lines.append(f"  ... and {len(info.ranges) - 20} more ranges")
	
	return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Create, apply, and analyze ROM patches",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s create original.nes modified.nes -o patch.ips
  %(prog)s apply original.nes patch.ips -o patched.nes
  %(prog)s info patch.ips
  %(prog)s compare original.nes modified.nes
		"""
	)
	
	subparsers = parser.add_subparsers(dest="command", help="Command to execute")
	
	# Create command
	create_parser = subparsers.add_parser("create", help="Create patch")
	create_parser.add_argument("source", help="Original ROM file")
	create_parser.add_argument("target", help="Modified ROM file")
	create_parser.add_argument("-o", "--output", required=True, help="Output patch file")
	create_parser.add_argument("-f", "--format", choices=["ips", "bps"], default="ips")
	
	# Apply command
	apply_parser = subparsers.add_parser("apply", help="Apply patch")
	apply_parser.add_argument("source", help="Original ROM file")
	apply_parser.add_argument("patch", help="Patch file")
	apply_parser.add_argument("-o", "--output", required=True, help="Output ROM file")
	
	# Info command
	info_parser = subparsers.add_parser("info", help="Show patch information")
	info_parser.add_argument("patch", help="Patch file")
	
	# Compare command
	compare_parser = subparsers.add_parser("compare", help="Compare two ROM files")
	compare_parser.add_argument("file1", help="First ROM file")
	compare_parser.add_argument("file2", help="Second ROM file")
	
	# Verify command
	verify_parser = subparsers.add_parser("verify", help="Verify ROM against patch")
	verify_parser.add_argument("rom", help="ROM file")
	verify_parser.add_argument("patch", help="Patch file")
	verify_parser.add_argument("--type", choices=["source", "target"], default="source")
	
	args = parser.parse_args()
	
	if not args.command:
		parser.print_help()
		return 1
	
	try:
		if args.command == "create":
			source = Path(args.source).read_bytes()
			target = Path(args.target).read_bytes()
			
			if args.format == "ips":
				patch = IPSPatch.create(source, target)
				patch.save(args.output)
			else:
				print("BPS creation not yet implemented")
				return 1
			
			info = patch.get_info()
			print(f"Created {args.format.upper()} patch: {args.output}")
			print(f"Records: {info.record_count}")
			print(f"Modified bytes: {info.modified_bytes:,}")
		
		elif args.command == "apply":
			source = Path(args.source).read_bytes()
			
			fmt = detect_format(args.patch)
			
			if fmt == PatchFormat.IPS:
				patch = IPSPatch.load(args.patch)
				result = patch.apply(source)
			elif fmt == PatchFormat.BPS:
				print("BPS applying not yet implemented")
				return 1
			else:
				print(f"Unsupported format: {fmt}")
				return 1
			
			Path(args.output).write_bytes(result)
			print(f"Applied patch: {args.output}")
			print(f"Output size: {len(result):,} bytes")
		
		elif args.command == "info":
			fmt = detect_format(args.patch)
			
			if fmt == PatchFormat.IPS:
				patch = IPSPatch.load(args.patch)
			elif fmt == PatchFormat.BPS:
				patch = BPSPatch.load(args.patch)
			else:
				print(f"Unsupported format: {fmt}")
				return 1
			
			info = patch.get_info()
			print(format_patch_info(info))
		
		elif args.command == "compare":
			file1 = Path(args.file1).read_bytes()
			file2 = Path(args.file2).read_bytes()
			
			print(f"File 1: {args.file1}")
			print(f"  Size: {len(file1):,} bytes")
			print(f"  CRC32: {IPSPatch._crc32(file1) if hasattr(IPSPatch, '_crc32') else 0:08X}")
			print()
			print(f"File 2: {args.file2}")
			print(f"  Size: {len(file2):,} bytes")
			print(f"  CRC32: {BPSPatch._crc32(file2):08X}")
			print()
			
			# Find differences
			max_len = max(len(file1), len(file2))
			diff_count = 0
			diff_ranges = []
			in_diff = False
			diff_start = 0
			
			for i in range(max_len):
				b1 = file1[i] if i < len(file1) else 0
				b2 = file2[i] if i < len(file2) else 0
				
				if b1 != b2:
					diff_count += 1
					if not in_diff:
						in_diff = True
						diff_start = i
				else:
					if in_diff:
						diff_ranges.append((diff_start, i))
						in_diff = False
			
			if in_diff:
				diff_ranges.append((diff_start, max_len))
			
			print(f"Differences: {diff_count:,} bytes in {len(diff_ranges)} ranges")
			
			if diff_ranges:
				print()
				print("Difference ranges:")
				for start, end in diff_ranges[:20]:
					print(f"  ${start:06X} - ${end:06X} ({end - start} bytes)")
				if len(diff_ranges) > 20:
					print(f"  ... and {len(diff_ranges) - 20} more")
		
		elif args.command == "verify":
			rom = Path(args.rom).read_bytes()
			rom_crc = BPSPatch._crc32(rom)
			
			fmt = detect_format(args.patch)
			
			if fmt == PatchFormat.BPS:
				patch = BPSPatch.load(args.patch)
				expected = patch.source_crc if args.type == "source" else patch.target_crc
				
				if rom_crc == expected:
					print(f"✓ ROM matches {args.type} CRC: {rom_crc:08X}")
				else:
					print(f"✗ CRC mismatch!")
					print(f"  ROM CRC: {rom_crc:08X}")
					print(f"  Expected: {expected:08X}")
					return 1
			else:
				print("Verification only supported for BPS patches")
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
