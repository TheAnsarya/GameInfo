#!/usr/bin/env python3
"""
Soul Blazer - Compression Tools
Compress and decompress data using RLE and LZ77 algorithms.
"""

import argparse
import os
import struct
from dataclasses import dataclass
from typing import List, Optional, Tuple, BinaryIO
from enum import IntEnum


class CompressionType(IntEnum):
	"""Compression algorithm types."""
	RAW = 0
	RLE = 1
	LZ77 = 2
	LZ77_VARIANT = 3


@dataclass
class CompressionResult:
	"""Result of compression/decompression."""
	data: bytes
	original_size: int
	compressed_size: int
	algorithm: CompressionType
	ratio: float


class RLECodec:
	"""Run-Length Encoding for Soul Blazer."""

	# RLE format:
	# - If byte < 0x80: Copy next (byte + 1) bytes literally
	# - If byte >= 0x80: Repeat next byte (byte - 0x7F) times

	def decompress(self, data: bytes, max_output: int = 65536) -> bytes:
		"""
		Decompress RLE data.

		Args:
			data: Compressed data
			max_output: Maximum output size

		Returns:
			Decompressed data
		"""
		output = bytearray()
		i = 0

		while i < len(data) and len(output) < max_output:
			control = data[i]
			i += 1

			if control < 0x80:
				# Literal run: copy next (control + 1) bytes
				count = control + 1
				if i + count > len(data):
					break
				output.extend(data[i:i + count])
				i += count
			else:
				# Repeat run: repeat next byte (control - 0x7F) times
				count = control - 0x7F
				if i >= len(data):
					break
				byte_val = data[i]
				i += 1
				output.extend([byte_val] * count)

		return bytes(output)

	def compress(self, data: bytes) -> bytes:
		"""
		Compress data using RLE.

		Args:
			data: Uncompressed data

		Returns:
			RLE compressed data
		"""
		if not data:
			return b""

		output = bytearray()
		i = 0

		while i < len(data):
			# Check for a repeat run
			run_byte = data[i]
			run_length = 1

			while (i + run_length < len(data) and
				   data[i + run_length] == run_byte and
				   run_length < 129):
				run_length += 1

			if run_length >= 3:
				# Worth encoding as repeat
				control = 0x7F + run_length
				output.append(control)
				output.append(run_byte)
				i += run_length
			else:
				# Encode as literal run
				literal_start = i
				literal_end = i + 1

				# Find extent of literal run
				while literal_end < len(data) and (literal_end - literal_start) < 128:
					# Check if next bytes would be better as repeat
					if literal_end + 2 < len(data):
						if (data[literal_end] == data[literal_end + 1] ==
							data[literal_end + 2]):
							break
					literal_end += 1

				literal_length = literal_end - literal_start
				control = literal_length - 1
				output.append(control)
				output.extend(data[literal_start:literal_end])
				i = literal_end

		return bytes(output)


class LZ77Codec:
	"""LZ77 compression for Soul Blazer."""

	# LZ77 format (16-bit lookback):
	# Control byte determines 8 operations
	# - Bit 0 = literal byte follows
	# - Bit 1 = match reference (2 bytes: offset, length)

	def __init__(self, window_size: int = 4096, min_match: int = 3, max_match: int = 18):
		"""
		Initialize LZ77 codec.

		Args:
			window_size: Size of sliding window
			min_match: Minimum match length
			max_match: Maximum match length
		"""
		self.window_size = window_size
		self.min_match = min_match
		self.max_match = max_match

	def decompress(self, data: bytes, max_output: int = 65536) -> bytes:
		"""
		Decompress LZ77 data.

		Args:
			data: Compressed data
			max_output: Maximum output size

		Returns:
			Decompressed data
		"""
		output = bytearray()
		i = 0

		while i < len(data) and len(output) < max_output:
			# Read control byte
			if i >= len(data):
				break
			control = data[i]
			i += 1

			# Process 8 bits
			for bit in range(8):
				if len(output) >= max_output:
					break

				if control & (1 << bit):
					# Match reference
					if i + 1 >= len(data):
						break

					# Read offset/length encoded pair
					low = data[i]
					high = data[i + 1]
					i += 2

					# Decode offset and length
					# Format: LLLL OOOO OOOO OOOO (4 bit length, 12 bit offset)
					offset = ((high & 0x0F) << 8) | low
					length = (high >> 4) + self.min_match

					if offset == 0:
						# End marker
						return bytes(output)

					# Copy from back-reference
					copy_pos = len(output) - offset
					for _ in range(length):
						if copy_pos >= 0 and copy_pos < len(output):
							output.append(output[copy_pos])
							copy_pos += 1
						else:
							output.append(0)
				else:
					# Literal byte
					if i >= len(data):
						break
					output.append(data[i])
					i += 1

		return bytes(output)

	def compress(self, data: bytes) -> bytes:
		"""
		Compress data using LZ77.

		Args:
			data: Uncompressed data

		Returns:
			LZ77 compressed data
		"""
		if not data:
			return b""

		output = bytearray()
		i = 0

		while i < len(data):
			control_byte = 0
			chunk = bytearray()

			for bit in range(8):
				if i >= len(data):
					break

				# Search for match in window
				best_offset = 0
				best_length = 0
				window_start = max(0, i - self.window_size)

				for j in range(window_start, i):
					length = 0
					while (i + length < len(data) and
						   length < self.max_match and
						   data[j + length] == data[i + length]):
						length += 1
						# Handle overlapping copy
						if j + length >= i:
							break

					if length >= self.min_match and length > best_length:
						best_offset = i - j
						best_length = length

				if best_length >= self.min_match:
					# Encode match
					control_byte |= (1 << bit)

					# Encode offset and length
					length_enc = best_length - self.min_match
					low = best_offset & 0xFF
					high = ((best_offset >> 8) & 0x0F) | (length_enc << 4)

					chunk.append(low)
					chunk.append(high)
					i += best_length
				else:
					# Literal byte
					chunk.append(data[i])
					i += 1

			output.append(control_byte)
			output.extend(chunk)

		return bytes(output)


class SoulBlazerCompression:
	"""Soul Blazer compression handler."""

	# Known compressed data locations
	COMPRESSED_DATA = [
		{"name": "Act 1 Maps", "address": 0x040000, "type": CompressionType.LZ77},
		{"name": "Act 2 Maps", "address": 0x048000, "type": CompressionType.LZ77},
		{"name": "Act 3 Maps", "address": 0x050000, "type": CompressionType.LZ77},
		{"name": "Act 4 Maps", "address": 0x058000, "type": CompressionType.LZ77},
		{"name": "Act 5 Maps", "address": 0x060000, "type": CompressionType.LZ77},
		{"name": "Act 6 Maps", "address": 0x068000, "type": CompressionType.LZ77},
		{"name": "Title Screen", "address": 0x0D0000, "type": CompressionType.RLE},
		{"name": "Ending Graphics", "address": 0x0D8000, "type": CompressionType.RLE},
	]

	def __init__(self):
		"""Initialize compression handler."""
		self.rle = RLECodec()
		self.lz77 = LZ77Codec()
		self.rom_data: Optional[bytes] = None

	def load_rom(self, rom_path: str) -> bool:
		"""Load ROM file."""
		if not os.path.exists(rom_path):
			print(f"Error: File not found: {rom_path}")
			return False

		with open(rom_path, "rb") as f:
			self.rom_data = f.read()

		# Handle copier header
		if len(self.rom_data) % 1024 == 512:
			self.rom_data = self.rom_data[512:]

		print(f"Loaded: {rom_path}")
		return True

	def detect_compression(self, data: bytes) -> CompressionType:
		"""
		Attempt to detect compression type.

		Args:
			data: Data to analyze

		Returns:
			Detected compression type
		"""
		if len(data) < 4:
			return CompressionType.RAW

		# Check for LZ77 header patterns
		# Usually starts with control byte followed by literals or references

		# Check for RLE patterns
		# Usually has control bytes < 0x80 for literals, >= 0x80 for runs

		# Simple heuristic: check first few bytes
		rle_score = 0
		lz_score = 0

		for i in range(min(32, len(data))):
			b = data[i]
			if b >= 0x80:
				rle_score += 1
			if b < 0x20:
				lz_score += 1

		if rle_score > lz_score:
			return CompressionType.RLE
		elif lz_score > 0:
			return CompressionType.LZ77

		return CompressionType.RAW

	def decompress(self, data: bytes, comp_type: Optional[CompressionType] = None) -> CompressionResult:
		"""
		Decompress data.

		Args:
			data: Compressed data
			comp_type: Compression type (auto-detect if None)

		Returns:
			CompressionResult
		"""
		if comp_type is None:
			comp_type = self.detect_compression(data)

		if comp_type == CompressionType.RLE:
			decompressed = self.rle.decompress(data)
		elif comp_type in (CompressionType.LZ77, CompressionType.LZ77_VARIANT):
			decompressed = self.lz77.decompress(data)
		else:
			decompressed = data

		ratio = len(data) / len(decompressed) if decompressed else 1.0

		return CompressionResult(
			data=decompressed,
			original_size=len(decompressed),
			compressed_size=len(data),
			algorithm=comp_type,
			ratio=ratio
		)

	def compress(self, data: bytes, comp_type: CompressionType = CompressionType.LZ77) -> CompressionResult:
		"""
		Compress data.

		Args:
			data: Uncompressed data
			comp_type: Compression type to use

		Returns:
			CompressionResult
		"""
		if comp_type == CompressionType.RLE:
			compressed = self.rle.compress(data)
		elif comp_type in (CompressionType.LZ77, CompressionType.LZ77_VARIANT):
			compressed = self.lz77.compress(data)
		else:
			compressed = data

		ratio = len(compressed) / len(data) if data else 1.0

		return CompressionResult(
			data=compressed,
			original_size=len(data),
			compressed_size=len(compressed),
			algorithm=comp_type,
			ratio=ratio
		)

	def extract_compressed_data(self, address: int, max_size: int = 0x8000) -> Tuple[bytes, int]:
		"""
		Extract compressed data from ROM.

		Args:
			address: ROM address
			max_size: Maximum compressed size

		Returns:
			(data, size)
		"""
		if not self.rom_data or address >= len(self.rom_data):
			return b"", 0

		end = min(address + max_size, len(self.rom_data))
		data = self.rom_data[address:end]

		# Try to find end of compressed data
		# For LZ77: look for end marker (0x0000)
		# For RLE: estimate based on control bytes

		return data, len(data)

	def list_compressed_data(self):
		"""Print list of known compressed data locations."""
		print("\nKnown Compressed Data Locations")
		print("=" * 60)
		print(f"{'Name':<25} {'Address':<12} {'Type'}")
		print("-" * 60)

		for item in self.COMPRESSED_DATA:
			comp_name = item["type"].name
			print(f"{item['name']:<25} 0x{item['address']:06X}    {comp_name}")

	def analyze_compression(self, address: int, size: int = 0x1000):
		"""Analyze compression at address."""
		if not self.rom_data:
			return

		data = self.rom_data[address:address + size]
		comp_type = self.detect_compression(data)

		print(f"\nAnalysis at 0x{address:06X}")
		print("=" * 50)
		print(f"Detected type: {comp_type.name}")

		# Try to decompress
		result = self.decompress(data, comp_type)
		print(f"Input size:    {len(data)} bytes")
		print(f"Output size:   {len(result.data)} bytes")
		print(f"Ratio:         {result.ratio:.2%}")

		# Show sample of decompressed data
		if result.data:
			print(f"\nFirst 32 bytes of output:")
			hex_str = " ".join(f"{b:02X}" for b in result.data[:32])
			print(f"  {hex_str}")


def main():
	parser = argparse.ArgumentParser(
		description="Soul Blazer Compression Tools"
	)

	parser.add_argument("input", nargs="?", help="Input file")
	parser.add_argument("--decompress", "-d", action="store_true",
						help="Decompress input file")
	parser.add_argument("--compress", "-c", action="store_true",
						help="Compress input file")
	parser.add_argument("--rle", action="store_true",
						help="Use RLE compression")
	parser.add_argument("--lz77", action="store_true",
						help="Use LZ77 compression")
	parser.add_argument("--output", "-o", type=str,
						help="Output file path")
	parser.add_argument("--rom", "-r", type=str,
						help="ROM file for extraction")
	parser.add_argument("--address", "-a", type=str,
						help="Address to extract from ROM (hex)")
	parser.add_argument("--size", "-s", type=str, default="0x1000",
						help="Size to extract (hex)")
	parser.add_argument("--list", "-l", action="store_true",
						help="List known compressed data")
	parser.add_argument("--analyze", action="store_true",
						help="Analyze compression at address")
	parser.add_argument("--test", action="store_true",
						help="Test compression roundtrip")

	args = parser.parse_args()

	compressor = SoulBlazerCompression()

	if args.list:
		compressor.list_compressed_data()
		return

	# Determine compression type
	if args.rle:
		comp_type = CompressionType.RLE
	elif args.lz77:
		comp_type = CompressionType.LZ77
	else:
		comp_type = None  # Auto-detect

	if args.rom:
		# ROM operations
		if not compressor.load_rom(args.rom):
			return

		if args.address:
			try:
				address = int(args.address, 16)
			except ValueError:
				print(f"Error: Invalid address: {args.address}")
				return

			size = int(args.size, 16)

			if args.analyze:
				compressor.analyze_compression(address, size)
			else:
				data, _ = compressor.extract_compressed_data(address, size)
				result = compressor.decompress(data, comp_type)

				print(f"Decompressed {len(data)} -> {len(result.data)} bytes")

				if args.output:
					with open(args.output, "wb") as f:
						f.write(result.data)
					print(f"Saved to: {args.output}")
		return

	if args.test:
		# Run compression test
		print("Compression Test")
		print("=" * 50)

		test_data = b"AAAAAABBBBBCCCDEEEEEEEEEFFFFF" * 10

		# Test RLE
		rle_result = compressor.compress(test_data, CompressionType.RLE)
		rle_back = compressor.decompress(rle_result.data, CompressionType.RLE)

		print(f"RLE: {len(test_data)} -> {len(rle_result.data)} ({rle_result.ratio:.2%})")
		print(f"     Roundtrip: {'OK' if rle_back.data == test_data else 'FAIL'}")

		# Test LZ77
		lz_result = compressor.compress(test_data, CompressionType.LZ77)
		lz_back = compressor.decompress(lz_result.data, CompressionType.LZ77)

		print(f"LZ77: {len(test_data)} -> {len(lz_result.data)} ({lz_result.ratio:.2%})")
		print(f"      Roundtrip: {'OK' if lz_back.data == test_data else 'FAIL'}")
		return

	if not args.input:
		parser.print_help()
		print("\nExamples:")
		print("  python compression.py input.bin -d -o output.bin  # Decompress")
		print("  python compression.py input.bin -c --rle -o out.bin  # RLE compress")
		print("  python compression.py --rom game.sfc -a 0x40000 -d -o map.bin")
		print("  python compression.py --rom game.sfc -a 0x40000 --analyze")
		print("  python compression.py --list  # Show known compressed data")
		print("  python compression.py --test  # Test compression")
		return

	# File operations
	with open(args.input, "rb") as f:
		data = f.read()

	print(f"Input: {args.input} ({len(data)} bytes)")

	if args.decompress:
		if comp_type is None:
			comp_type = compressor.detect_compression(data)
		result = compressor.decompress(data, comp_type)
		print(f"Decompressed: {len(result.data)} bytes ({comp_type.name})")
		output_data = result.data
	elif args.compress:
		if comp_type is None:
			comp_type = CompressionType.LZ77
		result = compressor.compress(data, comp_type)
		print(f"Compressed: {len(result.data)} bytes ({result.ratio:.2%})")
		output_data = result.data
	else:
		print("Specify --decompress or --compress")
		return

	if args.output:
		with open(args.output, "wb") as f:
			f.write(output_data)
		print(f"Saved to: {args.output}")


if __name__ == "__main__":
	main()
