#!/usr/bin/env python3
"""
Soul Blazer (SNES) Compression Analyzer
Analyzes and decompresses RLE and LZ compressed data in the ROM.
"""

import json
import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import Optional
from enum import IntEnum


# Paths
SCRIPT_DIR = Path(__file__).parent
ASSETS_DIR = SCRIPT_DIR.parent / "assets"
COMPRESS_DIR = ASSETS_DIR / "compression"
DEFAULT_ROM = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")


class CompressionType(IntEnum):
	"""Compression format types."""
	NONE = 0
	RLE = 1
	LZ = 2
	HUFFMAN = 3
	UNKNOWN = 255


@dataclass
class CompressedBlock:
	"""Represents a compressed data block."""
	offset: int
	compression_type: CompressionType
	compressed_size: int
	decompressed_size: int
	data: bytes = field(default_factory=bytes, repr=False)
	ratio: float = 0.0

	def __post_init__(self):
		if self.compressed_size > 0:
			self.ratio = self.decompressed_size / self.compressed_size


class CompressionAnalyzer:
	"""Analyze and decompress compressed data in Soul Blazer ROM."""

	# Known compressed data locations (from analysis)
	KNOWN_COMPRESSED_BLOCKS = [
		# (offset, type, description)
		(0x40000, CompressionType.RLE, "Tileset data bank $08"),
		(0x48000, CompressionType.RLE, "Tileset data bank $09"),
		(0x50000, CompressionType.LZ, "Map data bank $0A"),
		(0x58000, CompressionType.LZ, "Map data bank $0B"),
		(0x60000, CompressionType.LZ, "Map data bank $0C"),
		(0x68000, CompressionType.LZ, "Sprite graphics bank $0D"),
		(0x70000, CompressionType.LZ, "Sprite graphics bank $0E"),
	]

	# RLE control bytes
	RLE_LITERAL_FLAG = 0x80  # Bit 7 set = literal run
	RLE_MAX_RUN = 127

	# LZ window size
	LZ_WINDOW_SIZE = 4096
	LZ_MIN_MATCH = 3
	LZ_MAX_MATCH = 18

	def __init__(self, rom_path: str = None):
		"""Initialize analyzer."""
		self.rom_data: Optional[bytes] = None
		self.blocks: list[CompressedBlock] = []

		if rom_path:
			self.load_rom(rom_path)

	def load_rom(self, path: str) -> bool:
		"""Load ROM file."""
		try:
			with open(path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def _read_byte(self, offset: int) -> int:
		"""Read byte from ROM."""
		if offset >= len(self.rom_data):
			return 0
		return self.rom_data[offset]

	def _read_word(self, offset: int) -> int:
		"""Read 16-bit word from ROM."""
		if offset + 1 >= len(self.rom_data):
			return 0
		return self.rom_data[offset] | (self.rom_data[offset + 1] << 8)

	def decompress_rle(self, offset: int, max_output: int = 0x10000) -> tuple[bytes, int]:
		"""
		Decompress RLE data.

		Format:
		- $00: End of data
		- $01-$7F: Copy next N bytes literally
		- $80-$FF: Repeat next byte (N & 0x7F) times

		Returns: (decompressed_data, bytes_consumed)
		"""
		output = bytearray()
		pos = offset

		while pos < len(self.rom_data) and len(output) < max_output:
			control = self._read_byte(pos)
			pos += 1

			if control == 0x00:
				# End marker
				break
			elif control & 0x80:
				# Run of repeated bytes
				run_length = (control & 0x7F) + 1
				if pos >= len(self.rom_data):
					break
				repeat_byte = self._read_byte(pos)
				pos += 1
				output.extend([repeat_byte] * run_length)
			else:
				# Literal run
				literal_count = control
				for _ in range(literal_count):
					if pos >= len(self.rom_data):
						break
					output.append(self._read_byte(pos))
					pos += 1

		return bytes(output), pos - offset

	def decompress_lz(self, offset: int, max_output: int = 0x10000) -> tuple[bytes, int]:
		"""
		Decompress LZ77-style compressed data.

		Format:
		- First word: Decompressed size
		- Control bytes with 8 flags each
		- Flag = 0: Literal byte
		- Flag = 1: Back-reference (2 bytes: offset + length)

		Returns: (decompressed_data, bytes_consumed)
		"""
		if offset + 2 >= len(self.rom_data):
			return bytes(), 0

		expected_size = self._read_word(offset)
		if expected_size == 0 or expected_size > max_output:
			return bytes(), 0

		output = bytearray()
		pos = offset + 2

		while pos < len(self.rom_data) and len(output) < expected_size:
			# Read control byte
			if pos >= len(self.rom_data):
				break
			control = self._read_byte(pos)
			pos += 1

			# Process 8 bits
			for bit in range(8):
				if len(output) >= expected_size:
					break

				if control & (1 << bit):
					# Back-reference
					if pos + 1 >= len(self.rom_data):
						break

					ref_data = self._read_word(pos)
					pos += 2

					# Extract offset and length
					# Common format: 12-bit offset, 4-bit length
					ref_offset = ref_data & 0x0FFF
					ref_length = ((ref_data >> 12) & 0x0F) + self.LZ_MIN_MATCH

					# Copy from back-reference
					if ref_offset > 0:
						for _ in range(ref_length):
							if len(output) >= expected_size:
								break
							if ref_offset > len(output):
								output.append(0)  # Padding for invalid ref
							else:
								output.append(output[-ref_offset])
				else:
					# Literal byte
					if pos >= len(self.rom_data):
						break
					output.append(self._read_byte(pos))
					pos += 1

		return bytes(output), pos - offset

	def detect_compression_type(self, offset: int) -> CompressionType:
		"""Attempt to detect compression type at offset."""
		if offset + 4 >= len(self.rom_data):
			return CompressionType.NONE

		# Check for LZ header (decompressed size)
		size_word = self._read_word(offset)
		if 0x100 <= size_word <= 0x8000:
			# Reasonable decompressed size, might be LZ
			# Try to decompress and see if it makes sense
			try:
				data, consumed = self.decompress_lz(offset)
				if len(data) == size_word and consumed > 2:
					return CompressionType.LZ
			except:
				pass

		# Check for RLE patterns
		b0 = self._read_byte(offset)
		b1 = self._read_byte(offset + 1)

		# RLE typically starts with control byte
		if b0 & 0x80 or (1 <= b0 <= 0x7F and b0 > 0):
			# Could be RLE, try to decompress
			try:
				data, consumed = self.decompress_rle(offset, max_output=0x1000)
				if len(data) > 0 and consumed > 1:
					return CompressionType.RLE
			except:
				pass

		return CompressionType.UNKNOWN

	def scan_for_compressed_blocks(self, start: int = 0, end: int = None) -> list[CompressedBlock]:
		"""Scan ROM for compressed data blocks."""
		if end is None:
			end = len(self.rom_data)

		blocks = []
		offset = start

		while offset < end:
			# Check for compression signatures
			comp_type = self.detect_compression_type(offset)

			if comp_type == CompressionType.LZ:
				data, consumed = self.decompress_lz(offset)
				if len(data) > 0:
					block = CompressedBlock(
						offset=offset,
						compression_type=comp_type,
						compressed_size=consumed,
						decompressed_size=len(data),
						data=data,
					)
					blocks.append(block)
					offset += consumed
					continue
			elif comp_type == CompressionType.RLE:
				data, consumed = self.decompress_rle(offset)
				if len(data) > 32:  # Skip tiny blocks
					block = CompressedBlock(
						offset=offset,
						compression_type=comp_type,
						compressed_size=consumed,
						decompressed_size=len(data),
						data=data,
					)
					blocks.append(block)
					offset += consumed
					continue

			offset += 1

		return blocks

	def analyze_known_blocks(self) -> list[CompressedBlock]:
		"""Analyze known compressed data locations."""
		blocks = []

		for offset, comp_type, description in self.KNOWN_COMPRESSED_BLOCKS:
			if offset >= len(self.rom_data):
				continue

			if comp_type == CompressionType.RLE:
				data, consumed = self.decompress_rle(offset)
			elif comp_type == CompressionType.LZ:
				data, consumed = self.decompress_lz(offset)
			else:
				continue

			if len(data) > 0:
				block = CompressedBlock(
					offset=offset,
					compression_type=comp_type,
					compressed_size=consumed,
					decompressed_size=len(data),
					data=data,
				)
				blocks.append(block)
				print(f"${offset:05X}: {description}")
				print(f"  Type: {comp_type.name}")
				print(f"  Compressed: {consumed:,} bytes")
				print(f"  Decompressed: {len(data):,} bytes")
				print(f"  Ratio: {block.ratio:.2f}x")

		return blocks

	def export_results(self, output_dir: Path) -> None:
		"""Export analysis results."""
		output_dir.mkdir(parents=True, exist_ok=True)

		# Export summary
		summary = {
			"block_count": len(self.blocks),
			"total_compressed": sum(b.compressed_size for b in self.blocks),
			"total_decompressed": sum(b.decompressed_size for b in self.blocks),
			"blocks": [
				{
					"offset": f"${b.offset:05X}",
					"type": b.compression_type.name,
					"compressed_size": b.compressed_size,
					"decompressed_size": b.decompressed_size,
					"ratio": round(b.ratio, 2),
				}
				for b in self.blocks
			]
		}

		with open(output_dir / "compression_analysis.json", 'w') as f:
			json.dump(summary, f, indent='\t')

		# Export decompressed data
		for i, block in enumerate(self.blocks):
			filename = f"block_{block.offset:05x}_{block.compression_type.name.lower()}.bin"
			with open(output_dir / filename, 'wb') as f:
				f.write(block.data)

	def compress_rle(self, data: bytes) -> bytes:
		"""
		Compress data using RLE.
		Returns compressed data.
		"""
		if not data:
			return bytes([0x00])

		output = bytearray()
		i = 0

		while i < len(data):
			# Check for run of identical bytes
			run_start = i
			while i < len(data) - 1 and data[i] == data[i + 1] and i - run_start < 127:
				i += 1

			run_length = i - run_start + 1

			if run_length >= 3:
				# Encode as run
				output.append(0x80 | (run_length - 1))
				output.append(data[run_start])
				i += 1
			else:
				# Encode as literal
				literal_start = run_start
				# Find end of literal run
				while i < len(data):
					if i < len(data) - 2 and data[i] == data[i + 1] == data[i + 2]:
						break
					if i - literal_start >= 126:
						break
					i += 1

				literal_count = i - literal_start
				if literal_count > 0:
					output.append(literal_count)
					output.extend(data[literal_start:literal_start + literal_count])

		# End marker
		output.append(0x00)

		return bytes(output)

	def print_report(self) -> None:
		"""Print analysis report."""
		print("=" * 60)
		print("SOUL BLAZER COMPRESSION ANALYSIS")
		print("=" * 60)

		if not self.blocks:
			print("No compressed blocks analyzed. Run analyze_known_blocks() first.")
			return

		print(f"\nBlocks found: {len(self.blocks)}")

		total_comp = sum(b.compressed_size for b in self.blocks)
		total_decomp = sum(b.decompressed_size for b in self.blocks)

		print(f"Total compressed: {total_comp:,} bytes")
		print(f"Total decompressed: {total_decomp:,} bytes")
		if total_comp > 0:
			print(f"Overall ratio: {total_decomp / total_comp:.2f}x")

		print("\n--- Blocks by Type ---")
		by_type = {}
		for b in self.blocks:
			t = b.compression_type.name
			if t not in by_type:
				by_type[t] = []
			by_type[t].append(b)

		for t, blocks in by_type.items():
			print(f"\n{t}: {len(blocks)} blocks")
			for b in blocks:
				print(f"  ${b.offset:05X}: {b.compressed_size:,} -> {b.decompressed_size:,} ({b.ratio:.1f}x)")


def main():
	"""Main entry point."""
	import argparse

	parser = argparse.ArgumentParser(description="Soul Blazer Compression Analyzer")
	parser.add_argument("--rom", "-r", help="Path to ROM file", default=str(DEFAULT_ROM))
	parser.add_argument("--output", "-o", help="Output directory", default=str(COMPRESS_DIR))
	parser.add_argument("--scan", "-s", action="store_true", help="Scan for compressed blocks")
	parser.add_argument("--known", "-k", action="store_true", help="Analyze known blocks only")
	parser.add_argument("--test", "-t", help="Test decompression at offset (hex)")

	args = parser.parse_args()

	analyzer = CompressionAnalyzer(args.rom)

	if not analyzer.rom_data:
		print(f"Failed to load ROM: {args.rom}")
		return

	print(f"Loaded ROM: {len(analyzer.rom_data):,} bytes")

	if args.test:
		# Test decompression at specific offset
		offset = int(args.test, 16)
		print(f"\nTesting decompression at ${offset:05X}...")

		comp_type = analyzer.detect_compression_type(offset)
		print(f"Detected type: {comp_type.name}")

		if comp_type == CompressionType.RLE:
			data, consumed = analyzer.decompress_rle(offset)
		elif comp_type == CompressionType.LZ:
			data, consumed = analyzer.decompress_lz(offset)
		else:
			print("Unknown compression type")
			return

		print(f"Compressed: {consumed:,} bytes")
		print(f"Decompressed: {len(data):,} bytes")
		if consumed > 0:
			print(f"Ratio: {len(data)/consumed:.2f}x")

		# Show first 64 bytes
		print("\nFirst 64 bytes of decompressed data:")
		for i in range(min(64, len(data))):
			if i % 16 == 0:
				print(f"  ${offset + i:05X}:", end="")
			print(f" {data[i]:02x}", end="")
			if i % 16 == 15:
				print()
		print()

	elif args.known:
		print("\nAnalyzing known compressed blocks...")
		analyzer.blocks = analyzer.analyze_known_blocks()
		analyzer.print_report()

		output_dir = Path(args.output)
		analyzer.export_results(output_dir)
		print(f"\nExported to: {output_dir}")

	elif args.scan:
		print("\nScanning for compressed blocks (this may take a while)...")
		analyzer.blocks = analyzer.scan_for_compressed_blocks()
		analyzer.print_report()

	else:
		# Default: analyze known blocks
		print("\nAnalyzing known compressed blocks...")
		analyzer.blocks = analyzer.analyze_known_blocks()
		analyzer.print_report()


if __name__ == "__main__":
	main()
