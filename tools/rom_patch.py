#!/usr/bin/env python3
"""
ROM Diff and Patch Tool

Create and apply patches between ROM versions.
Supports IPS, BPS, and custom JSON patch formats.

Features:
- Generate diffs between ROMs
- Create IPS/BPS patches
- Apply patches to ROMs
- Analyze patch contents
- Batch patch operations

Usage:
	python rom_patch.py diff <original> <modified> --output patch.ips
	python rom_patch.py apply <rom> <patch> --output patched.rom
	python rom_patch.py analyze <patch>
	python rom_patch.py create <changes.json> --rom <base.rom> --output patch.ips
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, BinaryIO


@dataclass
class PatchRecord:
	"""Single patch record"""
	offset: int
	data: bytes
	original: bytes = b''


@dataclass
class PatchInfo:
	"""Patch file information"""
	format: str
	records: List[PatchRecord] = field(default_factory=list)
	source_size: int = 0
	target_size: int = 0
	source_crc: int = 0
	target_crc: int = 0


class IPSFormat:
	"""IPS patch format (International Patching System)"""

	HEADER = b'PATCH'
	EOF = b'EOF'

	@classmethod
	def create(cls, original: bytes, modified: bytes) -> bytes:
		"""Create IPS patch from two ROMs"""
		records = cls._find_differences(original, modified)
		return cls._encode(records)

	@classmethod
	def _find_differences(cls, original: bytes, modified: bytes) -> List[PatchRecord]:
		"""Find differences between two ROMs"""
		records = []
		in_diff = False
		diff_start = 0
		diff_data = bytearray()

		# Use longer of the two for comparison
		max_len = max(len(original), len(modified))
		orig_padded = original.ljust(max_len, b'\x00')
		mod_padded = modified.ljust(max_len, b'\x00')

		for i in range(max_len):
			if orig_padded[i] != mod_padded[i]:
				if not in_diff:
					in_diff = True
					diff_start = i
					diff_data = bytearray()
				diff_data.append(mod_padded[i])

				# IPS limit: 65535 bytes per record
				if len(diff_data) >= 65535:
					records.append(PatchRecord(
						offset=diff_start,
						data=bytes(diff_data)
					))
					in_diff = False
			else:
				if in_diff:
					records.append(PatchRecord(
						offset=diff_start,
						data=bytes(diff_data)
					))
					in_diff = False

		# Final record
		if in_diff:
			records.append(PatchRecord(
				offset=diff_start,
				data=bytes(diff_data)
			))

		return records

	@classmethod
	def _encode(cls, records: List[PatchRecord]) -> bytes:
		"""Encode records to IPS format"""
		result = bytearray(cls.HEADER)

		for record in records:
			# Offset (3 bytes, big-endian)
			result.extend(struct.pack('>I', record.offset)[1:4])

			# Size (2 bytes, big-endian)
			size = len(record.data)

			# Check for RLE opportunity
			if size >= 3 and all(b == record.data[0] for b in record.data):
				# RLE record
				result.extend(b'\x00\x00')  # Size = 0 indicates RLE
				result.extend(struct.pack('>H', size))  # RLE size
				result.append(record.data[0])  # RLE byte
			else:
				result.extend(struct.pack('>H', size))
				result.extend(record.data)

		result.extend(cls.EOF)
		return bytes(result)

	@classmethod
	def parse(cls, data: bytes) -> PatchInfo:
		"""Parse IPS patch file"""
		if data[:5] != cls.HEADER:
			raise ValueError("Not a valid IPS file")

		info = PatchInfo(format='IPS')
		pos = 5

		while pos < len(data) - 3:
			# Check for EOF
			if data[pos:pos + 3] == cls.EOF:
				break

			# Read offset (3 bytes, big-endian)
			offset = struct.unpack('>I', b'\x00' + data[pos:pos + 3])[0]
			pos += 3

			# Read size (2 bytes, big-endian)
			size = struct.unpack('>H', data[pos:pos + 2])[0]
			pos += 2

			if size == 0:
				# RLE record
				rle_size = struct.unpack('>H', data[pos:pos + 2])[0]
				pos += 2
				rle_byte = data[pos]
				pos += 1
				patch_data = bytes([rle_byte] * rle_size)
			else:
				patch_data = data[pos:pos + size]
				pos += size

			info.records.append(PatchRecord(offset=offset, data=patch_data))

		return info

	@classmethod
	def apply(cls, rom: bytes, patch_data: bytes) -> bytes:
		"""Apply IPS patch to ROM"""
		info = cls.parse(patch_data)
		result = bytearray(rom)

		for record in info.records:
			# Extend if necessary
			end_offset = record.offset + len(record.data)
			if end_offset > len(result):
				result.extend(b'\x00' * (end_offset - len(result)))

			# Apply patch
			result[record.offset:record.offset + len(record.data)] = record.data

		return bytes(result)


class BPSFormat:
	"""BPS patch format (Beat Patching System)"""

	HEADER = b'BPS1'

	@classmethod
	def create(cls, original: bytes, modified: bytes) -> bytes:
		"""Create BPS patch"""
		# Simplified BPS - use delta encoding
		result = bytearray(cls.HEADER)

		# Source size (variable length)
		result.extend(cls._encode_number(len(original)))

		# Target size (variable length)
		result.extend(cls._encode_number(len(modified)))

		# Metadata size (0 for now)
		result.extend(cls._encode_number(0))

		# Generate actions
		output_offset = 0
		source_offset = 0
		target_offset = 0

		while output_offset < len(modified):
			# Find matching run from source
			match_len = 0
			if source_offset < len(original):
				while (source_offset + match_len < len(original) and
					   output_offset + match_len < len(modified) and
					   original[source_offset + match_len] == modified[output_offset + match_len]):
					match_len += 1

			if match_len >= 3:
				# SourceCopy
				action = (match_len - 1) << 2 | 2
				result.extend(cls._encode_number(action))
				offset_diff = source_offset - target_offset
				result.extend(cls._encode_signed(offset_diff))
				target_offset = source_offset + match_len
				source_offset += match_len
				output_offset += match_len
			else:
				# TargetRead (literal data)
				literal_start = output_offset
				literal_end = output_offset + 1

				# Collect consecutive non-matching bytes
				while literal_end < len(modified) and literal_end - literal_start < 256:
					if (source_offset + (literal_end - literal_start) < len(original) and
						original[source_offset + (literal_end - literal_start)] == modified[literal_end]):
						break
					literal_end += 1

				length = literal_end - literal_start
				action = (length - 1) << 2 | 0
				result.extend(cls._encode_number(action))
				result.extend(modified[literal_start:literal_end])
				output_offset = literal_end

		# Checksums
		result.extend(struct.pack('<I', cls._crc32(original)))
		result.extend(struct.pack('<I', cls._crc32(modified)))
		result.extend(struct.pack('<I', cls._crc32(bytes(result))))

		return bytes(result)

	@classmethod
	def _encode_number(cls, n: int) -> bytes:
		"""Encode variable-length number"""
		result = bytearray()
		while True:
			x = n & 0x7F
			n >>= 7
			if n == 0:
				result.append(0x80 | x)
				break
			result.append(x)
			n -= 1
		return bytes(result)

	@classmethod
	def _decode_number(cls, data: bytes, pos: int) -> Tuple[int, int]:
		"""Decode variable-length number, return (value, new_pos)"""
		n = 0
		shift = 1
		while True:
			x = data[pos]
			pos += 1
			n += (x & 0x7F) * shift
			if x & 0x80:
				break
			shift <<= 7
			n += shift
		return n, pos

	@classmethod
	def _encode_signed(cls, n: int) -> bytes:
		"""Encode signed number"""
		negative = n < 0
		if negative:
			n = -n - 1
		n = (n << 1) | (1 if negative else 0)
		return cls._encode_number(n)

	@classmethod
	def _crc32(cls, data: bytes) -> int:
		"""Calculate CRC32"""
		crc = 0xFFFFFFFF
		for byte in data:
			crc ^= byte
			for _ in range(8):
				if crc & 1:
					crc = (crc >> 1) ^ 0xEDB88320
				else:
					crc >>= 1
		return crc ^ 0xFFFFFFFF


class JSONPatch:
	"""JSON-based patch format for human-readable patches"""

	@classmethod
	def create(cls, original: bytes, modified: bytes) -> Dict:
		"""Create JSON patch"""
		records = IPSFormat._find_differences(original, modified)

		return {
			'format': 'json-patch',
			'version': '1.0',
			'source_size': len(original),
			'target_size': len(modified),
			'records': [
				{
					'offset': f"0x{r.offset:06X}",
					'size': len(r.data),
					'data': r.data.hex().upper(),
				}
				for r in records
			]
		}

	@classmethod
	def parse(cls, data: Dict) -> PatchInfo:
		"""Parse JSON patch"""
		info = PatchInfo(format='JSON')
		info.source_size = data.get('source_size', 0)
		info.target_size = data.get('target_size', 0)

		for record in data.get('records', []):
			offset = int(record['offset'], 16) if isinstance(record['offset'], str) else record['offset']
			patch_data = bytes.fromhex(record['data'])
			info.records.append(PatchRecord(offset=offset, data=patch_data))

		return info

	@classmethod
	def apply(cls, rom: bytes, patch_data: Dict) -> bytes:
		"""Apply JSON patch"""
		info = cls.parse(patch_data)
		result = bytearray(rom)

		for record in info.records:
			end_offset = record.offset + len(record.data)
			if end_offset > len(result):
				result.extend(b'\x00' * (end_offset - len(result)))
			result[record.offset:record.offset + len(record.data)] = record.data

		return bytes(result)


class PatchAnalyzer:
	"""Analyze patch contents"""

	@staticmethod
	def analyze(info: PatchInfo) -> Dict:
		"""Analyze patch and return statistics"""
		total_bytes = sum(len(r.data) for r in info.records)
		offsets = [r.offset for r in info.records]

		return {
			'format': info.format,
			'record_count': len(info.records),
			'total_bytes': total_bytes,
			'offset_range': {
				'min': f"0x{min(offsets):06X}" if offsets else None,
				'max': f"0x{max(offsets):06X}" if offsets else None,
			},
			'largest_record': max(len(r.data) for r in info.records) if info.records else 0,
			'smallest_record': min(len(r.data) for r in info.records) if info.records else 0,
		}


def detect_format(filepath: str) -> str:
	"""Detect patch file format"""
	with open(filepath, 'rb') as f:
		header = f.read(5)

	if header[:5] == b'PATCH':
		return 'ips'
	elif header[:4] == b'BPS1':
		return 'bps'

	# Try JSON
	try:
		with open(filepath, 'r', encoding='utf-8') as f:
			data = json.load(f)
			if 'format' in data and 'records' in data:
				return 'json'
	except:
		pass

	return 'unknown'


def main():
	parser = argparse.ArgumentParser(
		description='ROM Diff and Patch Tool',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Diff command
	diff_parser = subparsers.add_parser('diff', help='Create patch from two ROMs')
	diff_parser.add_argument('original', help='Original ROM')
	diff_parser.add_argument('modified', help='Modified ROM')
	diff_parser.add_argument('--output', '-o', required=True, help='Output patch file')
	diff_parser.add_argument('--format', '-f', default='ips', choices=['ips', 'json'],
							 help='Patch format')

	# Apply command
	apply_parser = subparsers.add_parser('apply', help='Apply patch to ROM')
	apply_parser.add_argument('rom', help='ROM file')
	apply_parser.add_argument('patch', help='Patch file')
	apply_parser.add_argument('--output', '-o', required=True, help='Output ROM')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze patch file')
	analyze_parser.add_argument('patch', help='Patch file')
	analyze_parser.add_argument('--verbose', '-v', action='store_true', help='Show all records')

	# Create command
	create_parser = subparsers.add_parser('create', help='Create patch from JSON changes')
	create_parser.add_argument('changes', help='JSON changes file')
	create_parser.add_argument('--rom', '-r', required=True, help='Base ROM for size')
	create_parser.add_argument('--output', '-o', required=True, help='Output patch file')
	create_parser.add_argument('--format', '-f', default='ips', choices=['ips', 'json'],
							   help='Patch format')

	args = parser.parse_args()

	if args.command == 'diff':
		# Load ROMs
		with open(args.original, 'rb') as f:
			original = f.read()
		with open(args.modified, 'rb') as f:
			modified = f.read()

		print(f"Original: {len(original)} bytes")
		print(f"Modified: {len(modified)} bytes")

		# Create patch
		if args.format == 'ips':
			patch = IPSFormat.create(original, modified)
			with open(args.output, 'wb') as f:
				f.write(patch)
		elif args.format == 'json':
			patch = JSONPatch.create(original, modified)
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(patch, f, indent='\t')

		print(f"Created patch: {args.output}")

		# Show stats
		if args.format == 'ips':
			info = IPSFormat.parse(patch)
		else:
			info = JSONPatch.parse(patch)

		stats = PatchAnalyzer.analyze(info)
		print(f"Records: {stats['record_count']}")
		print(f"Total bytes: {stats['total_bytes']}")

	elif args.command == 'apply':
		# Load ROM
		with open(args.rom, 'rb') as f:
			rom = f.read()

		# Detect and load patch
		fmt = detect_format(args.patch)

		if fmt == 'ips':
			with open(args.patch, 'rb') as f:
				patch = f.read()
			result = IPSFormat.apply(rom, patch)
		elif fmt == 'json':
			with open(args.patch, 'r', encoding='utf-8') as f:
				patch = json.load(f)
			result = JSONPatch.apply(rom, patch)
		else:
			print(f"Unknown patch format: {args.patch}")
			sys.exit(1)

		# Save result
		with open(args.output, 'wb') as f:
			f.write(result)

		print(f"Applied patch to: {args.output}")
		print(f"Original size: {len(rom)}")
		print(f"Patched size: {len(result)}")

	elif args.command == 'analyze':
		fmt = detect_format(args.patch)

		if fmt == 'ips':
			with open(args.patch, 'rb') as f:
				patch = f.read()
			info = IPSFormat.parse(patch)
		elif fmt == 'json':
			with open(args.patch, 'r', encoding='utf-8') as f:
				patch = json.load(f)
			info = JSONPatch.parse(patch)
		else:
			print(f"Unknown patch format")
			sys.exit(1)

		stats = PatchAnalyzer.analyze(info)

		print(f"Format: {stats['format']}")
		print(f"Records: {stats['record_count']}")
		print(f"Total bytes modified: {stats['total_bytes']}")
		if stats['offset_range']['min']:
			print(f"Offset range: {stats['offset_range']['min']} - {stats['offset_range']['max']}")
		print(f"Largest record: {stats['largest_record']} bytes")
		print(f"Smallest record: {stats['smallest_record']} bytes")

		if args.verbose:
			print("\nRecords:")
			for i, record in enumerate(info.records[:50]):
				hex_preview = record.data[:16].hex().upper()
				if len(record.data) > 16:
					hex_preview += '...'
				print(f"  {i}: 0x{record.offset:06X} ({len(record.data)} bytes) {hex_preview}")

	elif args.command == 'create':
		# Load changes
		with open(args.changes, 'r', encoding='utf-8') as f:
			changes = json.load(f)

		# Load base ROM for size reference
		with open(args.rom, 'rb') as f:
			rom = f.read()

		# Create patch info
		records = []
		for change in changes.get('changes', []):
			offset = int(change['offset'], 16) if isinstance(change['offset'], str) else change['offset']
			data = bytes.fromhex(change['data'])
			records.append(PatchRecord(offset=offset, data=data))

		# Generate patch
		if args.format == 'ips':
			patch = IPSFormat._encode(records)
			with open(args.output, 'wb') as f:
				f.write(patch)
		elif args.format == 'json':
			patch = {
				'format': 'json-patch',
				'version': '1.0',
				'source_size': len(rom),
				'records': [
					{
						'offset': f"0x{r.offset:06X}",
						'size': len(r.data),
						'data': r.data.hex().upper(),
					}
					for r in records
				]
			}
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(patch, f, indent='\t')

		print(f"Created patch: {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
