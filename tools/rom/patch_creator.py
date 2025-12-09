#!/usr/bin/env python3
"""
IPS/BPS Patch Creator - Create and apply ROM patches

Supports:
- IPS (International Patching System)
- BPS (Binary Patching System)
- UPS (Universal Patching System)
"""

import argparse
import struct
import sys
import zlib
from pathlib import Path
from typing import List, Optional, Tuple


class IPSPatch:
	"""IPS patch format handler."""

	HEADER = b"PATCH"
	EOF = b"EOF"

	def __init__(self):
		self.records: List[Tuple[int, bytes]] = []  # (offset, data)
		self.rle_records: List[Tuple[int, int, int]] = []  # (offset, count, value)
		self.truncate_length: Optional[int] = None

	def add_record(self, offset: int, data: bytes):
		"""Add a patch record."""
		if offset > 0xFFFFFF:
			raise ValueError(f"Offset ${offset:X} exceeds IPS limit (24-bit)")

		# Check for RLE opportunity
		if len(data) >= 3 and len(set(data)) == 1:
			self.rle_records.append((offset, len(data), data[0]))
		else:
			# Split large records
			while len(data) > 0xFFFF:
				self.records.append((offset, data[:0xFFFF]))
				offset += 0xFFFF
				data = data[0xFFFF:]
			if data:
				self.records.append((offset, data))

	def create_from_diff(self, original: bytes, modified: bytes) -> bytes:
		"""Create patch from two ROMs."""
		self.records = []
		self.rle_records = []

		# Compare byte by byte
		i = 0
		while i < len(modified):
			# Skip matching bytes
			while i < len(original) and i < len(modified) and original[i] == modified[i]:
				i += 1

			if i >= len(modified):
				break

			# Found difference - collect contiguous changes
			start = i
			while i < len(modified) and (i >= len(original) or original[i] != modified[i]):
				i += 1
				# Limit record size
				if i - start >= 0xFFFF:
					break

			# Add record
			self.add_record(start, modified[start:i])

		# Handle size differences
		if len(modified) < len(original):
			self.truncate_length = len(modified)

		return self.to_bytes()

	def to_bytes(self) -> bytes:
		"""Serialize patch to bytes."""
		result = bytearray(self.HEADER)

		# Write regular records
		for offset, data in self.records:
			# 3-byte offset
			result.extend(struct.pack(">I", offset)[1:])
			# 2-byte length
			result.extend(struct.pack(">H", len(data)))
			# Data
			result.extend(data)

		# Write RLE records
		for offset, count, value in self.rle_records:
			# 3-byte offset
			result.extend(struct.pack(">I", offset)[1:])
			# 0-length indicates RLE
			result.extend(b'\x00\x00')
			# 2-byte RLE count
			result.extend(struct.pack(">H", count))
			# 1-byte value
			result.append(value)

		# Write EOF
		result.extend(self.EOF)

		# Write truncate length if needed
		if self.truncate_length is not None:
			result.extend(struct.pack(">I", self.truncate_length)[1:])

		return bytes(result)

	@classmethod
	def from_bytes(cls, data: bytes) -> "IPSPatch":
		"""Load patch from bytes."""
		patch = cls()

		if data[:5] != cls.HEADER:
			raise ValueError("Invalid IPS header")

		i = 5
		while i < len(data):
			# Check for EOF
			if data[i:i + 3] == cls.EOF:
				# Check for truncate extension
				if i + 3 < len(data):
					trunc_bytes = b'\x00' + data[i + 3:i + 6]
					patch.truncate_length = struct.unpack(">I", trunc_bytes)[0]
				break

			# Read offset (3 bytes)
			offset = struct.unpack(">I", b'\x00' + data[i:i + 3])[0]
			i += 3

			# Read length (2 bytes)
			length = struct.unpack(">H", data[i:i + 2])[0]
			i += 2

			if length == 0:
				# RLE record
				rle_count = struct.unpack(">H", data[i:i + 2])[0]
				i += 2
				rle_value = data[i]
				i += 1
				patch.rle_records.append((offset, rle_count, rle_value))
			else:
				# Regular record
				patch.records.append((offset, data[i:i + length]))
				i += length

		return patch

	def apply(self, rom_data: bytes) -> bytes:
		"""Apply patch to ROM."""
		result = bytearray(rom_data)

		# Apply regular records
		for offset, data in self.records:
			# Extend if necessary
			if offset + len(data) > len(result):
				result.extend(b'\x00' * (offset + len(data) - len(result)))
			result[offset:offset + len(data)] = data

		# Apply RLE records
		for offset, count, value in self.rle_records:
			if offset + count > len(result):
				result.extend(b'\x00' * (offset + count - len(result)))
			for j in range(count):
				result[offset + j] = value

		# Apply truncation
		if self.truncate_length is not None:
			result = result[:self.truncate_length]

		return bytes(result)


class BPSPatch:
	"""BPS patch format handler."""

	HEADER = b"BPS1"

	def __init__(self):
		self.source_size = 0
		self.target_size = 0
		self.metadata = b""
		self.actions: List[Tuple[int, bytes]] = []  # (action_type, data)
		self.source_checksum = 0
		self.target_checksum = 0
		self.patch_checksum = 0

	@staticmethod
	def _encode_number(n: int) -> bytes:
		"""Encode variable-length number."""
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

	@staticmethod
	def _decode_number(data: bytes, offset: int) -> Tuple[int, int]:
		"""Decode variable-length number. Returns (value, bytes_read)."""
		result = 0
		shift = 1
		i = offset
		while True:
			x = data[i]
			i += 1
			result += (x & 0x7F) * shift
			if x & 0x80:
				break
			shift <<= 7
			result += shift
		return result, i - offset

	def create_from_diff(self, source: bytes, target: bytes) -> bytes:
		"""Create BPS patch from source and target."""
		self.source_size = len(source)
		self.target_size = len(target)
		self.source_checksum = zlib.crc32(source) & 0xFFFFFFFF
		self.target_checksum = zlib.crc32(target) & 0xFFFFFFFF

		# Build patch using simple delta encoding
		result = bytearray(self.HEADER)

		# Sizes
		result.extend(self._encode_number(self.source_size))
		result.extend(self._encode_number(self.target_size))
		result.extend(self._encode_number(len(self.metadata)))
		result.extend(self.metadata)

		# Generate actions (simplified - just TargetRead for differences)
		i = 0
		source_offset = 0
		target_offset = 0

		while i < len(target):
			# Find run of matching bytes (SourceRead)
			match_len = 0
			while (i + match_len < len(target) and
				   source_offset + match_len < len(source) and
				   target[i + match_len] == source[source_offset + match_len]):
				match_len += 1

			if match_len > 0:
				# SourceRead action (type 0)
				result.extend(self._encode_number((match_len - 1) << 2 | 0))
				i += match_len
				source_offset += match_len
				target_offset += match_len
				continue

			# Find run of different bytes (TargetRead)
			diff_start = i
			while (i < len(target) and
				   (source_offset >= len(source) or target[i] != source[source_offset])):
				i += 1
				source_offset += 1
				# Limit run length
				if i - diff_start >= 1000:
					break

			diff_len = i - diff_start
			if diff_len > 0:
				# TargetRead action (type 1)
				result.extend(self._encode_number((diff_len - 1) << 2 | 1))
				result.extend(target[diff_start:diff_start + diff_len])
				target_offset += diff_len

		# Checksums
		result.extend(struct.pack("<I", self.source_checksum))
		result.extend(struct.pack("<I", self.target_checksum))

		# Patch checksum
		self.patch_checksum = zlib.crc32(result) & 0xFFFFFFFF
		result.extend(struct.pack("<I", self.patch_checksum))

		return bytes(result)

	@classmethod
	def from_bytes(cls, data: bytes) -> "BPSPatch":
		"""Load patch from bytes."""
		patch = cls()

		if data[:4] != cls.HEADER:
			raise ValueError("Invalid BPS header")

		i = 4

		# Read sizes
		patch.source_size, consumed = cls._decode_number(data, i)
		i += consumed
		patch.target_size, consumed = cls._decode_number(data, i)
		i += consumed

		# Read metadata
		meta_size, consumed = cls._decode_number(data, i)
		i += consumed
		patch.metadata = data[i:i + meta_size]
		i += meta_size

		# Store action data start position
		patch._action_data = data[i:-12]

		# Read checksums
		patch.source_checksum = struct.unpack("<I", data[-12:-8])[0]
		patch.target_checksum = struct.unpack("<I", data[-8:-4])[0]
		patch.patch_checksum = struct.unpack("<I", data[-4:])[0]

		return patch

	def apply(self, source: bytes) -> bytes:
		"""Apply patch to source ROM."""
		# Verify source checksum
		if zlib.crc32(source) & 0xFFFFFFFF != self.source_checksum:
			raise ValueError("Source checksum mismatch")

		target = bytearray(self.target_size)
		source_offset = 0
		target_offset = 0

		i = 0
		action_data = self._action_data

		while i < len(action_data) and target_offset < self.target_size:
			# Decode action
			action, consumed = self._decode_number(action_data, i)
			i += consumed

			length = (action >> 2) + 1
			action_type = action & 3

			if action_type == 0:
				# SourceRead
				for j in range(length):
					if source_offset < len(source):
						target[target_offset] = source[source_offset]
					source_offset += 1
					target_offset += 1

			elif action_type == 1:
				# TargetRead
				target[target_offset:target_offset + length] = action_data[i:i + length]
				i += length
				target_offset += length

			elif action_type == 2:
				# SourceCopy
				offset, consumed = self._decode_number(action_data, i)
				i += consumed
				offset = (offset >> 1) * (-1 if offset & 1 else 1)
				source_offset += offset
				for j in range(length):
					target[target_offset] = source[source_offset]
					source_offset += 1
					target_offset += 1

			elif action_type == 3:
				# TargetCopy
				offset, consumed = self._decode_number(action_data, i)
				i += consumed
				offset = (offset >> 1) * (-1 if offset & 1 else 1)
				target_copy_offset = target_offset + offset
				for j in range(length):
					target[target_offset] = target[target_copy_offset]
					target_copy_offset += 1
					target_offset += 1

		# Verify target checksum
		result = bytes(target)
		if zlib.crc32(result) & 0xFFFFFFFF != self.target_checksum:
			raise ValueError("Target checksum mismatch - patch may be corrupt")

		return result


def create_patch(
	original_path: Path,
	modified_path: Path,
	output_path: Path,
	format_type: str = "ips",
):
	"""Create a patch file."""
	original = original_path.read_bytes()
	modified = modified_path.read_bytes()

	if format_type == "ips":
		patch = IPSPatch()
		patch_data = patch.create_from_diff(original, modified)
	elif format_type == "bps":
		patch = BPSPatch()
		patch_data = patch.create_from_diff(original, modified)
	else:
		raise ValueError(f"Unknown format: {format_type}")

	output_path.write_bytes(patch_data)
	return len(patch_data)


def apply_patch(
	rom_path: Path,
	patch_path: Path,
	output_path: Path,
):
	"""Apply a patch to a ROM."""
	rom_data = rom_path.read_bytes()
	patch_data = patch_path.read_bytes()

	# Detect format
	if patch_data[:5] == IPSPatch.HEADER:
		patch = IPSPatch.from_bytes(patch_data)
	elif patch_data[:4] == BPSPatch.HEADER:
		patch = BPSPatch.from_bytes(patch_data)
	else:
		raise ValueError("Unknown patch format")

	result = patch.apply(rom_data)
	output_path.write_bytes(result)
	return len(result)


def get_patch_info(patch_path: Path) -> dict:
	"""Get information about a patch file."""
	patch_data = patch_path.read_bytes()

	info = {
		"file": patch_path.name,
		"size": len(patch_data),
	}

	if patch_data[:5] == IPSPatch.HEADER:
		patch = IPSPatch.from_bytes(patch_data)
		info["format"] = "IPS"
		info["records"] = len(patch.records)
		info["rle_records"] = len(patch.rle_records)
		info["truncate"] = patch.truncate_length

		# Calculate total bytes changed
		total_bytes = sum(len(data) for _, data in patch.records)
		total_bytes += sum(count for _, count, _ in patch.rle_records)
		info["bytes_changed"] = total_bytes

	elif patch_data[:4] == BPSPatch.HEADER:
		patch = BPSPatch.from_bytes(patch_data)
		info["format"] = "BPS"
		info["source_size"] = patch.source_size
		info["target_size"] = patch.target_size
		info["source_crc32"] = f"{patch.source_checksum:08X}"
		info["target_crc32"] = f"{patch.target_checksum:08X}"
		if patch.metadata:
			try:
				info["metadata"] = patch.metadata.decode("utf-8")
			except UnicodeDecodeError:
				info["metadata"] = f"{len(patch.metadata)} bytes"

	else:
		info["format"] = "Unknown"

	return info


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="IPS/BPS Patch Creator - Create and apply ROM patches",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# Create IPS patch
	python patch_creator.py create original.nes modified.nes -o patch.ips

	# Create BPS patch
	python patch_creator.py create original.sfc modified.sfc -o patch.bps --format bps

	# Apply patch
	python patch_creator.py apply rom.nes patch.ips -o patched.nes

	# Get patch info
	python patch_creator.py info patch.ips
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Create command
	create_parser = subparsers.add_parser("create", help="Create patch")
	create_parser.add_argument("original", help="Original ROM file")
	create_parser.add_argument("modified", help="Modified ROM file")
	create_parser.add_argument("-o", "--output", required=True, help="Output patch file")
	create_parser.add_argument("--format", choices=["ips", "bps"], default="ips", help="Patch format")

	# Apply command
	apply_parser = subparsers.add_parser("apply", help="Apply patch")
	apply_parser.add_argument("rom", help="Input ROM file")
	apply_parser.add_argument("patch", help="Patch file")
	apply_parser.add_argument("-o", "--output", required=True, help="Output ROM file")

	# Info command
	info_parser = subparsers.add_parser("info", help="Show patch info")
	info_parser.add_argument("patch", help="Patch file")
	info_parser.add_argument("--json", action="store_true", help="Output as JSON")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	try:
		if args.command == "create":
			original_path = Path(args.original)
			modified_path = Path(args.modified)
			output_path = Path(args.output)

			if not original_path.exists():
				print(f"Error: Original file not found: {original_path}", file=sys.stderr)
				return 1
			if not modified_path.exists():
				print(f"Error: Modified file not found: {modified_path}", file=sys.stderr)
				return 1

			size = create_patch(original_path, modified_path, output_path, args.format)
			print(f"Created {args.format.upper()} patch: {output_path}")
			print(f"Patch size: {size:,} bytes")

		elif args.command == "apply":
			rom_path = Path(args.rom)
			patch_path = Path(args.patch)
			output_path = Path(args.output)

			if not rom_path.exists():
				print(f"Error: ROM file not found: {rom_path}", file=sys.stderr)
				return 1
			if not patch_path.exists():
				print(f"Error: Patch file not found: {patch_path}", file=sys.stderr)
				return 1

			size = apply_patch(rom_path, patch_path, output_path)
			print(f"Patched ROM saved: {output_path}")
			print(f"Output size: {size:,} bytes")

		elif args.command == "info":
			patch_path = Path(args.patch)
			if not patch_path.exists():
				print(f"Error: Patch file not found: {patch_path}", file=sys.stderr)
				return 1

			info = get_patch_info(patch_path)

			if args.json:
				import json
				print(json.dumps(info, indent="\t"))
			else:
				print(f"\nPatch: {info['file']}")
				print(f"Format: {info['format']}")
				print(f"Size: {info['size']:,} bytes")

				if info["format"] == "IPS":
					print(f"Records: {info['records']}")
					if info['rle_records']:
						print(f"RLE Records: {info['rle_records']}")
					print(f"Bytes changed: {info['bytes_changed']:,}")
					if info['truncate']:
						print(f"Truncate to: {info['truncate']:,} bytes")

				elif info["format"] == "BPS":
					print(f"Source size: {info['source_size']:,} bytes")
					print(f"Target size: {info['target_size']:,} bytes")
					print(f"Source CRC32: {info['source_crc32']}")
					print(f"Target CRC32: {info['target_crc32']}")
					if info.get('metadata'):
						print(f"Metadata: {info['metadata']}")

	except Exception as e:
		print(f"Error: {e}", file=sys.stderr)
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
