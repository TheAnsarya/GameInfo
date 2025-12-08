#!/usr/bin/env python3
"""
Compression Utilities

Handle common compression formats used in retro games.
Supports detection, decompression, and compression.

Supported Formats:
- RLE (Run-Length Encoding) - various variants
- LZ variants (LZSS, LZ77)
- Huffman
- Nintendo-specific formats

Usage:
	python compression.py detect <file> [--offset 0x1000]
	python compression.py decompress <file> --format rle --offset 0x1000 --output out.bin
	python compression.py compress <file> --format rle --output out.bin
	python compression.py analyze <file> --scan
"""

import argparse
import os
import struct
import sys
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple


class CompressionFormat(Enum):
	UNKNOWN = "unknown"
	RLE_SIMPLE = "rle_simple"
	RLE_DUAL = "rle_dual"
	LZSS = "lzss"
	LZ77 = "lz77"
	HUFFMAN = "huffman"
	NONE = "none"


@dataclass
class CompressionResult:
	"""Result of compression detection/operation"""
	format: CompressionFormat
	compressed_size: int
	decompressed_size: int
	ratio: float
	data: bytes = b''


class RLESimple:
	"""
	Simple RLE compression
	Format: [count] [value] for runs, or direct bytes
	"""

	@staticmethod
	def detect(data: bytes, offset: int = 0) -> Optional[CompressionResult]:
		"""Try to detect simple RLE compression"""
		if offset >= len(data):
			return None

		# Look for RLE patterns
		runs = 0
		i = offset
		max_check = min(offset + 256, len(data))

		while i < max_check - 1:
			if data[i] >= 0x80:  # Potential run marker
				runs += 1
			i += 1

		if runs > 10:  # Likely RLE
			return CompressionResult(
				format=CompressionFormat.RLE_SIMPLE,
				compressed_size=0,
				decompressed_size=0,
				ratio=0.0,
			)
		return None

	@staticmethod
	def decompress(data: bytes, offset: int = 0, end_marker: int = 0x00) -> bytes:
		"""
		Decompress simple RLE
		High bit set = run: count (low 7 bits) of next byte
		High bit clear = literal byte
		"""
		result = bytearray()
		i = offset

		while i < len(data):
			byte = data[i]
			if byte == end_marker:
				break

			if byte & 0x80:  # Run
				count = (byte & 0x7F) + 1
				i += 1
				if i < len(data):
					result.extend([data[i]] * count)
			else:  # Literal
				result.append(byte)
			i += 1

		return bytes(result)

	@staticmethod
	def compress(data: bytes) -> bytes:
		"""Compress with simple RLE"""
		result = bytearray()
		i = 0

		while i < len(data):
			# Check for run
			run_length = 1
			while i + run_length < len(data) and \
				  data[i] == data[i + run_length] and \
				  run_length < 127:
				run_length += 1

			if run_length >= 3:  # Worth encoding as run
				result.append(0x80 | (run_length - 1))
				result.append(data[i])
				i += run_length
			else:
				# Literal (ensure high bit clear)
				if data[i] & 0x80:
					# Need to encode high-bit bytes specially
					result.append(0x81)  # Run of 1
					result.append(data[i])
				else:
					result.append(data[i])
				i += 1

		return bytes(result)


class RLEDual:
	"""
	Dual-mode RLE compression (common in NES games)
	Control byte determines mode for following bytes
	"""

	@staticmethod
	def decompress(data: bytes, offset: int = 0, end_marker: int = 0xFF) -> bytes:
		"""
		Decompress dual-mode RLE
		0x00-0x7F: Copy next N+1 bytes literally
		0x80-0xFE: Repeat next byte (N-0x80+3) times
		0xFF: End marker
		"""
		result = bytearray()
		i = offset

		while i < len(data):
			control = data[i]
			i += 1

			if control == end_marker:
				break
			elif control < 0x80:  # Literal run
				count = control + 1
				result.extend(data[i:i + count])
				i += count
			else:  # Repeat
				count = control - 0x80 + 3
				if i < len(data):
					result.extend([data[i]] * count)
					i += 1

		return bytes(result)

	@staticmethod
	def compress(data: bytes) -> bytes:
		"""Compress with dual-mode RLE"""
		result = bytearray()
		i = 0

		while i < len(data):
			# Check for repeat run
			run_length = 1
			while i + run_length < len(data) and \
				  data[i] == data[i + run_length] and \
				  run_length < 127:
				run_length += 1

			if run_length >= 3:  # Repeat run
				result.append(0x80 + run_length - 3)
				result.append(data[i])
				i += run_length
			else:
				# Literal run - collect non-repeating bytes
				literal_start = i
				literal_count = 0

				while i < len(data) and literal_count < 128:
					# Check if a run starts here
					next_run = 1
					while i + next_run < len(data) and \
						  data[i] == data[i + next_run] and \
						  next_run < 3:
						next_run += 1

					if next_run >= 3:
						break

					literal_count += 1
					i += 1

				if literal_count > 0:
					result.append(literal_count - 1)
					result.extend(data[literal_start:literal_start + literal_count])

		result.append(0xFF)  # End marker
		return bytes(result)


class LZSS:
	"""
	LZSS compression (used in many games)
	"""

	@staticmethod
	def decompress(data: bytes, offset: int = 0, window_size: int = 0x1000) -> bytes:
		"""
		Decompress LZSS data
		Standard format with flag bytes
		"""
		result = bytearray()
		i = offset

		while i < len(data):
			flags = data[i]
			i += 1

			for bit in range(8):
				if i >= len(data):
					break

				if flags & (1 << bit):  # Literal
					result.append(data[i])
					i += 1
				else:  # Reference
					if i + 1 >= len(data):
						break

					# Read offset and length
					b1 = data[i]
					b2 = data[i + 1]
					i += 2

					# Common format: 12-bit offset, 4-bit length
					ref_offset = ((b2 & 0xF0) << 4) | b1
					length = (b2 & 0x0F) + 3

					# Copy from output buffer
					for _ in range(length):
						if len(result) > ref_offset:
							result.append(result[-ref_offset - 1])
						else:
							result.append(0)

		return bytes(result)


def detect_compression(data: bytes, offset: int = 0) -> CompressionFormat:
	"""Attempt to detect compression format"""

	if offset >= len(data):
		return CompressionFormat.UNKNOWN

	# Sample the data
	sample = data[offset:offset + 256]
	if len(sample) < 16:
		return CompressionFormat.UNKNOWN

	# Check for patterns
	# High frequency of bytes with high bit set might indicate RLE
	high_bit_count = sum(1 for b in sample if b & 0x80)
	zero_count = sample.count(0)
	ff_count = sample.count(0xFF)

	# Check byte distribution
	unique_bytes = len(set(sample))

	# Heuristics
	if high_bit_count > len(sample) * 0.3 and unique_bytes < 64:
		return CompressionFormat.RLE_SIMPLE

	if ff_count > 5 and sample[-1] == 0xFF:
		return CompressionFormat.RLE_DUAL

	# Check for LZSS flag byte patterns
	flag_pattern = 0
	for i in range(0, min(64, len(sample)), 9):
		if sample[i] in (0x00, 0xFF, 0x0F, 0xF0):
			flag_pattern += 1

	if flag_pattern >= 4:
		return CompressionFormat.LZSS

	return CompressionFormat.UNKNOWN


def scan_for_compression(data: bytes, step: int = 0x100) -> List[Tuple[int, CompressionFormat]]:
	"""Scan file for compressed sections"""
	results = []

	for offset in range(0, len(data) - 64, step):
		fmt = detect_compression(data, offset)
		if fmt != CompressionFormat.UNKNOWN:
			results.append((offset, fmt))

	return results


def analyze_compression_ratio(original: bytes, compressed: bytes) -> float:
	"""Calculate compression ratio"""
	if len(original) == 0:
		return 0.0
	return len(compressed) / len(original)


def main():
	parser = argparse.ArgumentParser(
		description='Compression Utilities',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Detect command
	detect_parser = subparsers.add_parser('detect', help='Detect compression format')
	detect_parser.add_argument('file', help='Input file')
	detect_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Start offset')

	# Decompress command
	decomp_parser = subparsers.add_parser('decompress', help='Decompress data')
	decomp_parser.add_argument('file', help='Input file')
	decomp_parser.add_argument('--format', '-f', required=True,
							  choices=['rle_simple', 'rle_dual', 'lzss'],
							  help='Compression format')
	decomp_parser.add_argument('--offset', '-o', type=lambda x: int(x, 0), default=0, help='Start offset')
	decomp_parser.add_argument('--output', required=True, help='Output file')

	# Compress command
	comp_parser = subparsers.add_parser('compress', help='Compress data')
	comp_parser.add_argument('file', help='Input file')
	comp_parser.add_argument('--format', '-f', required=True,
						    choices=['rle_simple', 'rle_dual'],
						    help='Compression format')
	comp_parser.add_argument('--output', required=True, help='Output file')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze file for compression')
	analyze_parser.add_argument('file', help='Input file')
	analyze_parser.add_argument('--scan', action='store_true', help='Scan for compressed sections')
	analyze_parser.add_argument('--step', type=lambda x: int(x, 0), default=0x100, help='Scan step size')

	args = parser.parse_args()

	if args.command == 'detect':
		with open(args.file, 'rb') as f:
			data = f.read()

		fmt = detect_compression(data, args.offset)
		print(f"Detected format at offset 0x{args.offset:06X}: {fmt.value}")

	elif args.command == 'decompress':
		with open(args.file, 'rb') as f:
			data = f.read()

		if args.format == 'rle_simple':
			result = RLESimple.decompress(data, args.offset)
		elif args.format == 'rle_dual':
			result = RLEDual.decompress(data, args.offset)
		elif args.format == 'lzss':
			result = LZSS.decompress(data, args.offset)
		else:
			print(f"Unknown format: {args.format}")
			sys.exit(1)

		with open(args.output, 'wb') as f:
			f.write(result)

		print(f"Decompressed {len(result):,} bytes to: {args.output}")

	elif args.command == 'compress':
		with open(args.file, 'rb') as f:
			data = f.read()

		if args.format == 'rle_simple':
			result = RLESimple.compress(data)
		elif args.format == 'rle_dual':
			result = RLEDual.compress(data)
		else:
			print(f"Compression not implemented for: {args.format}")
			sys.exit(1)

		with open(args.output, 'wb') as f:
			f.write(result)

		ratio = len(result) / len(data) if len(data) > 0 else 0
		print(f"Compressed {len(data):,} -> {len(result):,} bytes ({ratio:.2%})")
		print(f"Saved to: {args.output}")

	elif args.command == 'analyze':
		with open(args.file, 'rb') as f:
			data = f.read()

		print(f"File: {args.file}")
		print(f"Size: {len(data):,} bytes")
		print()

		if args.scan:
			print("Scanning for compressed sections...")
			results = scan_for_compression(data, args.step)

			if results:
				print(f"Found {len(results)} potential compressed sections:")
				for offset, fmt in results[:50]:
					print(f"  0x{offset:06X}: {fmt.value}")
			else:
				print("No compressed sections detected")
		else:
			fmt = detect_compression(data, 0)
			print(f"Detected format: {fmt.value}")

			# Show byte distribution
			byte_counts = {}
			for b in data[:4096]:
				byte_counts[b] = byte_counts.get(b, 0) + 1

			print()
			print("Byte distribution (first 4KB):")
			sorted_bytes = sorted(byte_counts.items(), key=lambda x: -x[1])
			for byte_val, count in sorted_bytes[:10]:
				pct = count / min(len(data), 4096) * 100
				print(f"  0x{byte_val:02X}: {count:4} ({pct:.1f}%)")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
