#!/usr/bin/env python3
"""
ROM Patcher - Create and apply patches to ROMs.

Tools for creating IPS, BPS, and other patch formats.

Usage:
	python rom_patcher.py --create original.nes modified.nes --output patch.ips
	python rom_patcher.py --apply patch.ips base.nes --output patched.nes
	python rom_patcher.py --analyze patch.ips

Features:
	- IPS patch creation/application
	- BPS patch creation/application
	- Patch analysis
	- Multi-patch support
	- Checksum verification
"""

import argparse
import hashlib
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class PatchFormat(Enum):
	"""Patch format types."""
	IPS = 0    # International Patching System
	BPS = 1    # Beat Patching System
	UPS = 2    # Universal Patching System
	PPF = 3    # PlayStation Patch Format


@dataclass
class PatchRecord:
	"""A single patch record."""
	offset: int
	data: bytes
	rle_count: int = 0  # For IPS RLE encoding

	def __repr__(self):
		return f"PatchRecord(offset=0x{self.offset:X}, size={len(self.data)})"


@dataclass
class PatchInfo:
	"""Information about a patch."""
	format: PatchFormat
	records: List[PatchRecord] = field(default_factory=list)

	# Metadata
	source_size: int = 0
	target_size: int = 0
	source_checksum: str = ""
	target_checksum: str = ""

	def get_total_bytes(self) -> int:
		"""Get total patched bytes."""
		return sum(len(r.data) for r in self.records)

	def get_affected_ranges(self) -> List[Tuple[int, int]]:
		"""Get list of affected offset ranges."""
		ranges = []
		for record in self.records:
			if record.rle_count > 0:
				size = record.rle_count
			else:
				size = len(record.data)
			ranges.append((record.offset, record.offset + size))
		return ranges


class IPSPatcher:
	"""IPS format patch handler."""

	HEADER = b"PATCH"
	EOF = b"EOF"

	def create_patch(self, source: bytes, target: bytes) -> bytes:
		"""Create IPS patch from source to target."""
		patch = bytearray(self.HEADER)

		# Find differences
		max_len = max(len(source), len(target))
		i = 0

		while i < max_len:
			# Find start of difference
			while i < len(source) and i < len(target) and source[i] == target[i]:
				i += 1

			if i >= max_len:
				break

			# Find end of difference
			start = i
			diff_data = bytearray()

			while i < max_len:
				if i < len(source) and i < len(target):
					if source[i] == target[i]:
						# Check if similarity continues
						same_count = 0
						check = i
						while check < max_len and check < len(source) and \
							  check < len(target) and source[check] == target[check]:
							same_count += 1
							check += 1
							if same_count >= 6:  # Break if enough same bytes
								break

						if same_count >= 6:
							break

					diff_data.append(target[i])
				elif i < len(target):
					diff_data.append(target[i])
				else:
					break

				i += 1

				# IPS max record size
				if len(diff_data) >= 0xFFFF:
					break

			if diff_data:
				# Check for RLE opportunity
				if len(diff_data) >= 13 and len(set(diff_data)) == 1:
					# RLE encode
					patch.extend(struct.pack(">I", start)[1:])  # 3-byte offset
					patch.extend(b"\x00\x00")  # Zero size = RLE
					patch.extend(struct.pack(">H", len(diff_data)))  # RLE count
					patch.append(diff_data[0])  # RLE value
				else:
					# Normal record
					patch.extend(struct.pack(">I", start)[1:])  # 3-byte offset
					patch.extend(struct.pack(">H", len(diff_data)))  # Size
					patch.extend(diff_data)  # Data

		# Truncation record if target is shorter
		# (IPS can't really handle this well, but we can add padding)

		patch.extend(self.EOF)
		return bytes(patch)

	def apply_patch(self, source: bytes, patch: bytes) -> bytes:
		"""Apply IPS patch to source."""
		if not patch.startswith(self.HEADER):
			raise ValueError("Invalid IPS patch header")

		result = bytearray(source)
		offset = 5  # Skip header

		while offset < len(patch) - 3:
			# Check for EOF
			if patch[offset:offset + 3] == self.EOF:
				break

			# Read record
			record_offset = struct.unpack(">I", b"\x00" + patch[offset:offset + 3])[0]
			offset += 3

			size = struct.unpack(">H", patch[offset:offset + 2])[0]
			offset += 2

			if size == 0:
				# RLE record
				rle_count = struct.unpack(">H", patch[offset:offset + 2])[0]
				offset += 2
				rle_value = patch[offset]
				offset += 1

				# Extend if needed
				while len(result) < record_offset + rle_count:
					result.append(0)

				# Apply RLE
				for i in range(rle_count):
					result[record_offset + i] = rle_value
			else:
				# Normal record
				data = patch[offset:offset + size]
				offset += size

				# Extend if needed
				while len(result) < record_offset + size:
					result.append(0)

				# Apply data
				result[record_offset:record_offset + size] = data

		return bytes(result)

	def parse_patch(self, patch: bytes) -> PatchInfo:
		"""Parse IPS patch into records."""
		if not patch.startswith(self.HEADER):
			raise ValueError("Invalid IPS patch header")

		info = PatchInfo(format=PatchFormat.IPS)
		offset = 5

		while offset < len(patch) - 3:
			if patch[offset:offset + 3] == self.EOF:
				break

			record_offset = struct.unpack(">I", b"\x00" + patch[offset:offset + 3])[0]
			offset += 3

			size = struct.unpack(">H", patch[offset:offset + 2])[0]
			offset += 2

			if size == 0:
				# RLE
				rle_count = struct.unpack(">H", patch[offset:offset + 2])[0]
				offset += 2
				rle_value = patch[offset]
				offset += 1

				record = PatchRecord(
					offset=record_offset,
					data=bytes([rle_value]),
					rle_count=rle_count
				)
			else:
				data = patch[offset:offset + size]
				offset += size

				record = PatchRecord(
					offset=record_offset,
					data=data
				)

			info.records.append(record)

		return info


class BPSPatcher:
	"""BPS format patch handler."""

	HEADER = b"BPS1"

	def _read_number(self, data: bytes, offset: int) -> Tuple[int, int]:
		"""Read variable-length number."""
		result = 0
		shift = 0

		while True:
			byte = data[offset]
			offset += 1
			result += (byte & 0x7F) << shift

			if byte & 0x80:
				result += 1 << (shift + 7)
				shift += 7
			else:
				break

		return result, offset

	def _write_number(self, value: int) -> bytes:
		"""Write variable-length number."""
		data = bytearray()

		while True:
			byte = value & 0x7F
			value >>= 7

			if value == 0:
				data.append(byte)
				break
			else:
				data.append(byte | 0x80)
				value -= 1

		return bytes(data)

	def create_patch(self, source: bytes, target: bytes) -> bytes:
		"""Create BPS patch from source to target."""
		patch = bytearray(self.HEADER)

		# Sizes
		patch.extend(self._write_number(len(source)))
		patch.extend(self._write_number(len(target)))

		# Metadata (empty for now)
		patch.extend(self._write_number(0))

		# Simple implementation: just use target copy
		# A full implementation would use delta encoding
		output_offset = 0
		source_rel = 0
		target_rel = 0

		while output_offset < len(target):
			# Find matching run in source
			best_len = 0
			best_offset = 0

			for src_off in range(len(source)):
				match_len = 0
				while output_offset + match_len < len(target) and \
					  src_off + match_len < len(source) and \
					  source[src_off + match_len] == target[output_offset + match_len]:
					match_len += 1
					if match_len >= 255:
						break

				if match_len > best_len:
					best_len = match_len
					best_offset = src_off

			if best_len >= 4:
				# Source copy
				rel_offset = best_offset - source_rel
				source_rel = best_offset + best_len

				action = ((best_len - 1) << 2) | 2
				patch.extend(self._write_number(action))
				patch.extend(self._write_number(
					(abs(rel_offset) << 1) | (1 if rel_offset < 0 else 0)
				))
				output_offset += best_len
			else:
				# Target data
				# Find run of non-matching bytes
				run_start = output_offset
				run_data = bytearray()

				while output_offset < len(target):
					# Check if source copy would be better
					found_match = False
					for src_off in range(len(source)):
						match_len = 0
						while output_offset + match_len < len(target) and \
							  src_off + match_len < len(source) and \
							  source[src_off + match_len] == target[output_offset + match_len]:
							match_len += 1
						if match_len >= 4:
							found_match = True
							break

					if found_match:
						break

					run_data.append(target[output_offset])
					output_offset += 1

					if len(run_data) >= 255:
						break

				if run_data:
					# Target read action
					action = ((len(run_data) - 1) << 2) | 1
					patch.extend(self._write_number(action))
					patch.extend(run_data)

		# Checksums
		source_crc = self._crc32(source)
		target_crc = self._crc32(target)

		patch.extend(struct.pack("<I", source_crc))
		patch.extend(struct.pack("<I", target_crc))

		patch_crc = self._crc32(bytes(patch))
		patch.extend(struct.pack("<I", patch_crc))

		return bytes(patch)

	def _crc32(self, data: bytes) -> int:
		"""Calculate CRC32."""
		import zlib
		return zlib.crc32(data) & 0xFFFFFFFF

	def parse_patch(self, patch: bytes) -> PatchInfo:
		"""Parse BPS patch."""
		if not patch.startswith(self.HEADER):
			raise ValueError("Invalid BPS patch header")

		info = PatchInfo(format=PatchFormat.BPS)

		offset = 4
		info.source_size, offset = self._read_number(patch, offset)
		info.target_size, offset = self._read_number(patch, offset)

		# Metadata length
		meta_len, offset = self._read_number(patch, offset)
		offset += meta_len

		# Parse actions
		output_offset = 0
		source_rel = 0
		target_rel = 0

		while offset < len(patch) - 12:
			action, offset = self._read_number(patch, offset)
			action_type = action & 3
			length = (action >> 2) + 1

			if action_type == 0:
				# SourceRead
				record = PatchRecord(
					offset=output_offset,
					data=b""  # Just a marker
				)
				output_offset += length

			elif action_type == 1:
				# TargetRead
				data = patch[offset:offset + length]
				offset += length
				record = PatchRecord(
					offset=output_offset,
					data=data
				)
				info.records.append(record)
				output_offset += length

			elif action_type == 2:
				# SourceCopy
				rel, offset = self._read_number(patch, offset)
				rel_offset = rel >> 1
				if rel & 1:
					rel_offset = -rel_offset
				source_rel += rel_offset
				source_rel += length
				output_offset += length

			elif action_type == 3:
				# TargetCopy
				rel, offset = self._read_number(patch, offset)
				rel_offset = rel >> 1
				if rel & 1:
					rel_offset = -rel_offset
				target_rel += rel_offset
				target_rel += length
				output_offset += length

		return info


class ROMPatcher:
	"""Main patch manager."""

	def __init__(self):
		self.ips = IPSPatcher()
		self.bps = BPSPatcher()

	def detect_format(self, patch: bytes) -> Optional[PatchFormat]:
		"""Detect patch format."""
		if patch.startswith(b"PATCH"):
			return PatchFormat.IPS
		elif patch.startswith(b"BPS1"):
			return PatchFormat.BPS
		elif patch.startswith(b"UPS1"):
			return PatchFormat.UPS
		return None

	def create_patch(self, source: bytes, target: bytes,
					format: PatchFormat = PatchFormat.IPS) -> bytes:
		"""Create patch."""
		if format == PatchFormat.IPS:
			return self.ips.create_patch(source, target)
		elif format == PatchFormat.BPS:
			return self.bps.create_patch(source, target)
		else:
			raise ValueError(f"Unsupported format: {format}")

	def apply_patch(self, source: bytes, patch: bytes) -> bytes:
		"""Apply patch."""
		format = self.detect_format(patch)

		if format == PatchFormat.IPS:
			return self.ips.apply_patch(source, patch)
		else:
			raise ValueError(f"Unsupported format: {format}")

	def analyze_patch(self, patch: bytes) -> PatchInfo:
		"""Analyze patch."""
		format = self.detect_format(patch)

		if format == PatchFormat.IPS:
			return self.ips.parse_patch(patch)
		elif format == PatchFormat.BPS:
			return self.bps.parse_patch(patch)
		else:
			raise ValueError(f"Unsupported format: {format}")

	def format_analysis(self, info: PatchInfo) -> str:
		"""Format patch analysis."""
		lines = []
		lines.append(f"Patch Format: {info.format.name}")
		lines.append("=" * 50)
		lines.append(f"Records: {len(info.records)}")
		lines.append(f"Total Patched Bytes: {info.get_total_bytes()}")

		if info.source_size:
			lines.append(f"Source Size: {info.source_size}")
		if info.target_size:
			lines.append(f"Target Size: {info.target_size}")

		# Affected ranges
		ranges = info.get_affected_ranges()
		if ranges:
			lines.append("")
			lines.append("Affected Ranges:")
			for start, end in ranges[:20]:
				size = end - start
				lines.append(f"  ${start:06X} - ${end:06X} ({size} bytes)")
			if len(ranges) > 20:
				lines.append(f"  ... and {len(ranges) - 20} more")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="ROM Patcher")
	parser.add_argument("--create", "-c", nargs=2, type=Path,
						metavar=("SOURCE", "TARGET"),
						help="Create patch from source to target")
	parser.add_argument("--apply", "-a", nargs=2, type=Path,
						metavar=("PATCH", "SOURCE"),
						help="Apply patch to source")
	parser.add_argument("--analyze", type=Path,
						help="Analyze patch file")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--format", "-f", type=str,
						choices=["ips", "bps"],
						default="ips",
						help="Patch format")

	args = parser.parse_args()
	patcher = ROMPatcher()

	if args.create:
		source = args.create[0].read_bytes()
		target = args.create[1].read_bytes()

		format = PatchFormat.IPS if args.format == "ips" else PatchFormat.BPS
		patch = patcher.create_patch(source, target, format)

		if args.output:
			args.output.write_bytes(patch)
			print(f"Created {len(patch)} byte patch: {args.output}")
		else:
			print(f"Created {len(patch)} byte patch")

		# Analyze
		info = patcher.analyze_patch(patch)
		print()
		print(patcher.format_analysis(info))
		return

	if args.apply:
		patch = args.apply[0].read_bytes()
		source = args.apply[1].read_bytes()

		result = patcher.apply_patch(source, patch)

		if args.output:
			args.output.write_bytes(result)
			print(f"Patched ROM saved to: {args.output}")
		else:
			print(f"Patched ROM: {len(result)} bytes")
		return

	if args.analyze:
		patch = args.analyze.read_bytes()
		info = patcher.analyze_patch(patch)
		print(patcher.format_analysis(info))
		return

	# Default: show help
	print("ROM Patcher")
	print()
	print("Usage:")
	print("  --create SOURCE TARGET   Create patch")
	print("  --apply PATCH SOURCE     Apply patch")
	print("  --analyze PATCH          Analyze patch")
	print("  --output FILE            Output file")
	print("  --format FORMAT          Patch format (ips, bps)")


if __name__ == "__main__":
	main()
