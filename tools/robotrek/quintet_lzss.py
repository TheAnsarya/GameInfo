#!/usr/bin/env python3
"""
Quintet LZSS Decompressor

Decompresses data using Quintet's standard LZSS compression algorithm.
Used in Robotrek, Soul Blazer, Illusion of Gaia, Terranigma, and ActRaiser.

Usage:
	python quintet_lzss.py <rom_path> <offset> [--output <file>] [--size <bytes>]
"""

import argparse
import struct
from pathlib import Path
from typing import Optional


def decompress_quintet_lzss(data: bytes, offset: int = 0) -> bytes:
	"""
	Decompress Quintet LZSS compressed data.

	Quintet LZSS format:
	- First 2 bytes: uncompressed size (little-endian)
	- Followed by flag bytes and data
	- Flag byte: each bit indicates if next byte is literal (1) or reference (0)
	- Reference: 2 bytes encoding (offset, length)

	Args:
		data: Raw ROM data
		offset: Starting offset in data

	Returns:
		Decompressed bytes
	"""
	if offset + 2 > len(data):
		raise ValueError(f"Offset {offset:x} is beyond data length {len(data):x}")

	# Read uncompressed size
	uncompressed_size = struct.unpack_from("<H", data, offset)[0]
	pos = offset + 2

	if uncompressed_size == 0:
		return b""

	output = bytearray()

	while len(output) < uncompressed_size and pos < len(data):
		# Read flag byte
		flags = data[pos]
		pos += 1

		# Process 8 bits
		for bit in range(8):
			if len(output) >= uncompressed_size:
				break
			if pos >= len(data):
				break

			if flags & (1 << bit):
				# Literal byte
				output.append(data[pos])
				pos += 1
			else:
				# Reference (copy from output buffer)
				if pos + 1 >= len(data):
					break

				# Read reference bytes
				ref_low = data[pos]
				ref_high = data[pos + 1]
				pos += 2

				# Decode offset and length
				# Format varies by game, this is one common format:
				# Low byte + (high byte & 0xF0) << 4 = offset
				# (high byte & 0x0F) + 3 = length
				copy_offset = ref_low | ((ref_high & 0xF0) << 4)
				copy_length = (ref_high & 0x0F) + 3

				# Copy from output buffer
				# Offset is from current position, going backwards
				src = len(output) - copy_offset
				if src < 0:
					# Handle negative offset (copy zeros or wrap)
					for _ in range(copy_length):
						if len(output) >= uncompressed_size:
							break
						if src < 0:
							output.append(0)
						else:
							output.append(output[src])
						src += 1
				else:
					for _ in range(copy_length):
						if len(output) >= uncompressed_size:
							break
						# Allow overlapping copies (RLE-like)
						if src < len(output):
							output.append(output[src])
						else:
							output.append(0)
						src += 1

	return bytes(output[:uncompressed_size])


def decompress_quintet_lzss_v2(data: bytes, offset: int = 0) -> bytes:
	"""
	Alternative Quintet LZSS decompression (variant format).

	Some Quintet games use a slightly different encoding:
	- Flag bit 0 = literal, bit 1 = reference (reversed)
	- Different offset/length encoding

	Args:
		data: Raw ROM data
		offset: Starting offset in data

	Returns:
		Decompressed bytes
	"""
	if offset + 2 > len(data):
		raise ValueError(f"Offset {offset:x} is beyond data length {len(data):x}")

	# Read uncompressed size
	uncompressed_size = struct.unpack_from("<H", data, offset)[0]
	pos = offset + 2

	if uncompressed_size == 0:
		return b""

	output = bytearray()

	while len(output) < uncompressed_size and pos < len(data):
		# Read flag byte
		flags = data[pos]
		pos += 1

		# Process 8 bits (high to low)
		for bit in range(7, -1, -1):
			if len(output) >= uncompressed_size:
				break
			if pos >= len(data):
				break

			if flags & (1 << bit):
				# Literal byte
				output.append(data[pos])
				pos += 1
			else:
				# Reference
				if pos + 1 >= len(data):
					break

				ref_byte1 = data[pos]
				ref_byte2 = data[pos + 1]
				pos += 2

				# Different encoding: offset in bits 0-11, length-3 in bits 12-15
				copy_offset = ((ref_byte1 << 8) | ref_byte2) & 0x0FFF
				copy_length = ((ref_byte1 >> 4) & 0x0F) + 3

				if copy_offset == 0:
					copy_offset = 0x1000  # Special case

				src = len(output) - copy_offset
				for _ in range(copy_length):
					if len(output) >= uncompressed_size:
						break
					if src >= 0 and src < len(output):
						output.append(output[src])
					else:
						output.append(0)
					src += 1

	return bytes(output[:uncompressed_size])


def find_compressed_blocks(data: bytes, start: int = 0, end: int = None) -> list[tuple[int, int]]:
	"""
	Scan ROM data to find potential compressed blocks.

	Args:
		data: Raw ROM data
		start: Starting offset
		end: Ending offset (default: end of data)

	Returns:
		List of (offset, uncompressed_size) tuples
	"""
	if end is None:
		end = len(data)

	blocks = []
	pos = start

	while pos + 2 < end:
		# Read potential size
		size = struct.unpack_from("<H", data, pos)[0]

		# Reasonable size check (not too small, not too large)
		if 0x10 <= size <= 0x10000:
			# Try to decompress
			try:
				result = decompress_quintet_lzss(data, pos)
				if len(result) == size:
					blocks.append((pos, size))
					# Skip past this block (estimate)
					pos += size // 2  # Rough estimate of compressed size
					continue
			except Exception:
				pass

		pos += 1

	return blocks


class QuintetLZSS:
	"""Utility class for Quintet LZSS compression/decompression."""

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		with open(self.rom_path, "rb") as f:
			self.rom_data = f.read()

	def decompress_at(self, offset: int, variant: int = 1) -> bytes:
		"""
		Decompress data at the given offset.

		Args:
			offset: ROM file offset
			variant: Decompression variant (1 or 2)

		Returns:
			Decompressed data
		"""
		if variant == 1:
			return decompress_quintet_lzss(self.rom_data, offset)
		else:
			return decompress_quintet_lzss_v2(self.rom_data, offset)

	def get_size_at(self, offset: int) -> int:
		"""Get the uncompressed size header at an offset."""
		if offset + 2 > len(self.rom_data):
			return 0
		return struct.unpack_from("<H", self.rom_data, offset)[0]

	def extract_graphics(self, offset: int, output_path: str, variant: int = 1):
		"""
		Extract and save decompressed graphics data.

		Args:
			offset: ROM file offset
			output_path: Output file path
			variant: Decompression variant
		"""
		data = self.decompress_at(offset, variant)
		with open(output_path, "wb") as f:
			f.write(data)
		return len(data)


def main():
	parser = argparse.ArgumentParser(description="Quintet LZSS Decompressor")
	parser.add_argument("rom_path", help="Path to ROM file")
	parser.add_argument("offset", type=lambda x: int(x, 16),
					   help="Offset of compressed data (hex)")
	parser.add_argument("--output", "-o", help="Output file")
	parser.add_argument("--variant", "-v", type=int, default=1, choices=[1, 2],
					   help="Decompression variant (1 or 2)")
	parser.add_argument("--scan", action="store_true",
					   help="Scan for compressed blocks instead of decompressing")
	parser.add_argument("--end", type=lambda x: int(x, 16),
					   help="End offset for scanning (hex)")

	args = parser.parse_args()

	lzss = QuintetLZSS(args.rom_path)

	if args.scan:
		end = args.end if args.end else len(lzss.rom_data)
		print(f"Scanning for compressed blocks from ${args.offset:x} to ${end:x}...")
		blocks = find_compressed_blocks(lzss.rom_data, args.offset, end)
		print(f"Found {len(blocks)} potential compressed blocks:")
		for offset, size in blocks[:50]:  # Limit output
			print(f"  ${offset:06x}: {size} bytes uncompressed")
		if len(blocks) > 50:
			print(f"  ... and {len(blocks) - 50} more")
	else:
		size = lzss.get_size_at(args.offset)
		print(f"Compressed data at ${args.offset:06x}")
		print(f"Uncompressed size: {size} bytes (${size:04x})")

		try:
			data = lzss.decompress_at(args.offset, args.variant)
			print(f"Decompressed: {len(data)} bytes")

			if args.output:
				with open(args.output, "wb") as f:
					f.write(data)
				print(f"Saved to {args.output}")
			else:
				# Show hex dump of first 64 bytes
				print("\nFirst 64 bytes:")
				for i in range(0, min(64, len(data)), 16):
					hex_part = " ".join(f"{data[i+j]:02x}" for j in range(min(16, len(data) - i)))
					ascii_part = "".join(
						chr(data[i+j]) if 32 <= data[i+j] < 127 else "."
						for j in range(min(16, len(data) - i))
					)
					print(f"  {i:04X}: {hex_part:<48} {ascii_part}")
		except Exception as e:
			print(f"Decompression failed: {e}")
			print("Try using --variant 2 for alternative format")


if __name__ == "__main__":
	main()
