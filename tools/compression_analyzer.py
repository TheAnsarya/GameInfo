#!/usr/bin/env python3
"""
Compression Analyzer - Detect and analyze compression schemes in ROMs.

Identifies common compression algorithms used in retro games and
provides tools for analyzing compressed data blocks.

Usage:
	python compression_analyzer.py <rom_file>
	python compression_analyzer.py <rom_file> --scan
	python compression_analyzer.py <rom_file> --test 0x10000

Supported Algorithms:
	- LZ77/LZSS variants
	- RLE (Run-Length Encoding)
	- Huffman
	- Nintendo LZ (GBA/DS)
	- SNES-specific compression
"""

import argparse
import os
import struct
import sys
from dataclasses import dataclass
from enum import Enum, auto
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any


class CompressionType(Enum):
	"""Known compression types."""
	UNKNOWN = auto()
	RLE = auto()
	RLE_SIMPLE = auto()
	LZ77 = auto()
	LZSS = auto()
	NINTENDO_LZ = auto()
	HUFFMAN = auto()
	DTE = auto()  # Dictionary encoding
	KONAMI = auto()
	CAPCOM = auto()
	SQUARE = auto()
	ENIX = auto()


@dataclass
class CompressionBlock:
	"""Detected compressed data block."""
	offset: int
	compressed_size: int
	estimated_decompressed_size: int
	compression_type: CompressionType
	confidence: float
	header_bytes: bytes
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"offset": f"0x{self.offset:06X}",
			"compressed_size": self.compressed_size,
			"decompressed_size": self.estimated_decompressed_size,
			"type": self.compression_type.name,
			"confidence": f"{self.confidence:.1%}",
			"header": " ".join(f"{b:02X}" for b in self.header_bytes)
		}


class CompressionAnalyzer:
	"""Analyze ROM data for compression."""
	
	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.blocks: List[CompressionBlock] = []
	
	def scan_rle(self, offset: int) -> Optional[CompressionBlock]:
		"""Check for RLE compression at offset."""
		if offset + 4 > len(self.rom_data):
			return None
		
		data = self.rom_data[offset:]
		
		# Pattern 1: Length header + RLE data
		# Many games use 0x00 or 0xFF as escape byte
		escape_bytes = [0x00, 0xFF, 0xFE, 0x80]
		
		for escape in escape_bytes:
			score = self._score_rle(data, escape)
			if score > 0.5:
				# Estimate size
				size = self._estimate_rle_size(data, escape)
				return CompressionBlock(
					offset=offset,
					compressed_size=size,
					estimated_decompressed_size=int(size * (1 + score)),
					compression_type=CompressionType.RLE,
					confidence=score,
					header_bytes=data[:8]
				)
		
		return None
	
	def _score_rle(self, data: bytes, escape: int, sample_size: int = 256) -> float:
		"""Score how likely data is RLE with given escape byte."""
		if len(data) < 16:
			return 0.0
		
		sample = data[:min(sample_size, len(data))]
		escape_count = sample.count(escape)
		
		if escape_count < 2:
			return 0.0
		
		# Check for valid RLE patterns
		valid_patterns = 0
		i = 0
		while i < len(sample) - 2:
			if sample[i] == escape:
				# Check if next bytes form valid run
				if i + 2 < len(sample):
					run_len = sample[i + 1]
					if 3 <= run_len <= 127:
						valid_patterns += 1
				i += 3
			else:
				i += 1
		
		if escape_count == 0:
			return 0.0
		
		return min(1.0, valid_patterns / (escape_count + 1))
	
	def _estimate_rle_size(self, data: bytes, escape: int) -> int:
		"""Estimate RLE compressed block size."""
		i = 0
		while i < min(len(data), 0x10000):
			if data[i] == escape:
				if i + 2 >= len(data):
					break
				run_len = data[i + 1]
				if run_len == 0:  # End marker
					return i + 2
				i += 3
			else:
				i += 1
		return min(i, 0x1000)
	
	def scan_lz77(self, offset: int) -> Optional[CompressionBlock]:
		"""Check for LZ77/LZSS compression at offset."""
		if offset + 8 > len(self.rom_data):
			return None
		
		data = self.rom_data[offset:]
		
		# Check for Nintendo LZ header (0x10)
		if data[0] == 0x10:
			decomp_size = struct.unpack_from("<I", data, 0)[0] >> 8
			if 0x100 <= decomp_size <= 0x100000:
				return CompressionBlock(
					offset=offset,
					compressed_size=self._estimate_lz_size(data),
					estimated_decompressed_size=decomp_size,
					compression_type=CompressionType.NINTENDO_LZ,
					confidence=0.9,
					header_bytes=data[:8]
				)
		
		# Generic LZ77 detection
		score = self._score_lz77(data)
		if score > 0.4:
			return CompressionBlock(
				offset=offset,
				compressed_size=self._estimate_lz_size(data),
				estimated_decompressed_size=0,
				compression_type=CompressionType.LZ77,
				confidence=score,
				header_bytes=data[:8]
			)
		
		return None
	
	def _score_lz77(self, data: bytes, sample_size: int = 256) -> float:
		"""Score how likely data is LZ77 compressed."""
		if len(data) < 16:
			return 0.0
		
		sample = data[:min(sample_size, len(data))]
		
		# LZ77 typically has flag bytes followed by literals/references
		# Flag bytes control 8 subsequent tokens
		
		# Check for patterns typical of LZ77
		flag_like = 0
		for i in range(0, len(sample) - 1, 9):
			if i >= len(sample):
				break
			flag = sample[i]
			# Flags often have mixed bits
			bits = bin(flag).count('1')
			if 2 <= bits <= 6:
				flag_like += 1
		
		# Check for back-reference patterns
		ref_patterns = 0
		for i in range(len(sample) - 2):
			# Back refs often have high bit set in offset
			if sample[i] & 0xF0 >= 0x10 and sample[i + 1] < 0x20:
				ref_patterns += 1
		
		if len(sample) < 20:
			return 0.0
		
		return min(1.0, (flag_like * 3 + ref_patterns) / (len(sample) // 10 + 1))
	
	def _estimate_lz_size(self, data: bytes) -> int:
		"""Estimate LZ compressed size."""
		# For Nintendo LZ, parse header
		if data[0] == 0x10:
			# Parse flags and count data
			i = 4
			while i < min(len(data), 0x20000):
				if i >= len(data):
					break
				flag = data[i]
				i += 1
				
				for _ in range(8):
					if i >= len(data):
						break
					if flag & 0x80:
						# Reference
						i += 2
					else:
						# Literal
						i += 1
					flag <<= 1
			return i
		
		return min(len(data), 0x1000)
	
	def scan_huffman(self, offset: int) -> Optional[CompressionBlock]:
		"""Check for Huffman compression at offset."""
		if offset + 16 > len(self.rom_data):
			return None
		
		data = self.rom_data[offset:]
		
		# Nintendo Huffman header (0x20 or 0x28)
		if data[0] in (0x20, 0x28):
			decomp_size = struct.unpack_from("<I", data, 0)[0] >> 8
			if 0x10 <= decomp_size <= 0x100000:
				# Check tree structure
				tree_size = (data[4] + 1) * 2
				if tree_size < len(data) - 5:
					return CompressionBlock(
						offset=offset,
						compressed_size=tree_size + decomp_size // 2,
						estimated_decompressed_size=decomp_size,
						compression_type=CompressionType.HUFFMAN,
						confidence=0.8,
						header_bytes=data[:8]
					)
		
		return None
	
	def scan_konami(self, offset: int) -> Optional[CompressionBlock]:
		"""Check for Konami-style compression."""
		if offset + 4 > len(self.rom_data):
			return None
		
		data = self.rom_data[offset:]
		
		# Konami often uses 2-byte size header
		size = struct.unpack_from("<H", data, 0)[0]
		if 0x20 <= size <= 0x4000:
			# Check for Konami flag patterns
			flags_valid = 0
			for i in range(2, min(len(data), size + 2)):
				# Konami uses specific control values
				if data[i] in (0x00, 0x80, 0xC0, 0xFF):
					flags_valid += 1
			
			if flags_valid > 5:
				return CompressionBlock(
					offset=offset,
					compressed_size=size + 2,
					estimated_decompressed_size=size * 2,
					compression_type=CompressionType.KONAMI,
					confidence=0.6,
					header_bytes=data[:8]
				)
		
		return None
	
	def scan_all(self, min_confidence: float = 0.5,
				 progress_callback=None) -> List[CompressionBlock]:
		"""Scan entire ROM for compressed blocks."""
		blocks = []
		checked = set()
		
		scanners = [
			self.scan_lz77,
			self.scan_rle,
			self.scan_huffman,
			self.scan_konami,
		]
		
		# Scan at aligned offsets first
		for alignment in [0x4000, 0x1000, 0x100, 0x10]:
			for offset in range(0, len(self.rom_data), alignment):
				if offset in checked:
					continue
				
				for scanner in scanners:
					block = scanner(offset)
					if block and block.confidence >= min_confidence:
						blocks.append(block)
						# Mark range as checked
						for i in range(block.compressed_size):
							checked.add(offset + i)
						break
				
				if progress_callback and offset % 0x10000 == 0:
					progress_callback(offset / len(self.rom_data))
		
		self.blocks = blocks
		return blocks
	
	def analyze_block(self, offset: int) -> Dict[str, Any]:
		"""Detailed analysis of compression at offset."""
		results = {
			"offset": f"0x{offset:06X}",
			"candidates": []
		}
		
		# Try all scanners
		if block := self.scan_lz77(offset):
			results["candidates"].append(block.to_dict())
		if block := self.scan_rle(offset):
			results["candidates"].append(block.to_dict())
		if block := self.scan_huffman(offset):
			results["candidates"].append(block.to_dict())
		if block := self.scan_konami(offset):
			results["candidates"].append(block.to_dict())
		
		# Add entropy analysis
		data = self.rom_data[offset:offset + 256]
		results["entropy"] = self._calculate_entropy(data)
		results["byte_distribution"] = self._analyze_distribution(data)
		
		return results
	
	def _calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy."""
		import math
		
		if not data:
			return 0.0
		
		freq = {}
		for byte in data:
			freq[byte] = freq.get(byte, 0) + 1
		
		entropy = 0.0
		for count in freq.values():
			p = count / len(data)
			if p > 0:
				entropy -= p * math.log2(p)
		
		return entropy
	
	def _analyze_distribution(self, data: bytes) -> Dict[str, Any]:
		"""Analyze byte distribution."""
		if not data:
			return {}
		
		freq = {}
		for byte in data:
			freq[byte] = freq.get(byte, 0) + 1
		
		sorted_freq = sorted(freq.items(), key=lambda x: x[1], reverse=True)
		
		return {
			"unique_bytes": len(freq),
			"most_common": [(f"0x{b:02X}", c) for b, c in sorted_freq[:5]],
			"zero_count": freq.get(0, 0),
			"ff_count": freq.get(0xFF, 0)
		}
	
	def suggest_decompressor(self, block: CompressionBlock) -> str:
		"""Suggest decompression code for block."""
		if block.compression_type == CompressionType.NINTENDO_LZ:
			return """
# Nintendo LZ (GBA/DS style)
def decompress_nintendo_lz(data, offset=0):
	header = struct.unpack_from('<I', data, offset)[0]
	decomp_size = header >> 8
	output = bytearray()
	
	pos = offset + 4
	while len(output) < decomp_size:
		flag = data[pos]
		pos += 1
		
		for i in range(8):
			if len(output) >= decomp_size:
				break
			
			if flag & 0x80:
				# Reference
				ref = struct.unpack_from('>H', data, pos)[0]
				pos += 2
				length = ((ref >> 12) & 0xF) + 3
				distance = (ref & 0xFFF) + 1
				
				for j in range(length):
					output.append(output[-distance])
			else:
				# Literal
				output.append(data[pos])
				pos += 1
			
			flag <<= 1
	
	return bytes(output)
"""
		elif block.compression_type == CompressionType.RLE:
			return """
# Simple RLE decompression
def decompress_rle(data, offset=0, escape=0x00):
	output = bytearray()
	pos = offset
	
	while pos < len(data):
		byte = data[pos]
		
		if byte == escape:
			if pos + 2 >= len(data):
				break
			run_len = data[pos + 1]
			if run_len == 0:  # End marker
				break
			run_byte = data[pos + 2]
			output.extend([run_byte] * run_len)
			pos += 3
		else:
			output.append(byte)
			pos += 1
	
	return bytes(output)
"""
		else:
			return "# Unknown compression - manual analysis required"


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Compression Analyzer")
	parser.add_argument("rom", help="ROM file to analyze")
	parser.add_argument("--scan", "-s", action="store_true",
						help="Scan entire ROM")
	parser.add_argument("--test", "-t", type=lambda x: int(x, 0),
						help="Test specific offset")
	parser.add_argument("--min-confidence", type=float, default=0.5,
						help="Minimum detection confidence")
	parser.add_argument("--verbose", "-v", action="store_true")
	
	args = parser.parse_args()
	
	if not os.path.exists(args.rom):
		print(f"Error: ROM not found: {args.rom}")
		sys.exit(1)
	
	with open(args.rom, "rb") as f:
		rom_data = f.read()
	
	print(f"ROM: {args.rom}")
	print(f"Size: {len(rom_data):,} bytes")
	print()
	
	analyzer = CompressionAnalyzer(rom_data)
	
	if args.test is not None:
		# Analyze specific offset
		results = analyzer.analyze_block(args.test)
		print(f"Analysis at {results['offset']}:")
		print(f"  Entropy: {results['entropy']:.2f} bits/byte")
		print(f"  Distribution: {results['byte_distribution']}")
		print()
		
		if results["candidates"]:
			print("Detected compression:")
			for candidate in results["candidates"]:
				print(f"  Type: {candidate['type']}")
				print(f"  Confidence: {candidate['confidence']}")
				print(f"  Size: {candidate['compressed_size']}")
				print(f"  Header: {candidate['header']}")
				print()
		else:
			print("No compression detected")
		
		# Suggest decompressor if high confidence
		for block in analyzer.blocks:
			if block.confidence > 0.7:
				print("\nSuggested decompressor:")
				print(analyzer.suggest_decompressor(block))
	
	elif args.scan:
		# Full scan
		print("Scanning for compressed data...")
		
		def progress(pct):
			print(f"\r  Progress: {pct:.1%}", end="", flush=True)
		
		blocks = analyzer.scan_all(
			min_confidence=args.min_confidence,
			progress_callback=progress if args.verbose else None
		)
		
		if args.verbose:
			print()
		
		print(f"\nFound {len(blocks)} compressed blocks:")
		
		# Group by type
		by_type: Dict[CompressionType, List[CompressionBlock]] = {}
		for block in blocks:
			if block.compression_type not in by_type:
				by_type[block.compression_type] = []
			by_type[block.compression_type].append(block)
		
		for comp_type, type_blocks in by_type.items():
			print(f"\n{comp_type.name}: {len(type_blocks)} blocks")
			for block in type_blocks[:10]:
				print(f"  0x{block.offset:06X}: {block.compressed_size} bytes "
					  f"(confidence: {block.confidence:.1%})")
			if len(type_blocks) > 10:
				print(f"  ... and {len(type_blocks) - 10} more")
	
	else:
		# Quick overview
		print("Quick scan at common offsets...")
		
		interesting = []
		for offset in range(0, len(rom_data), 0x4000):
			results = analyzer.analyze_block(offset)
			if results["candidates"]:
				interesting.append((offset, results["candidates"][0]))
		
		if interesting:
			print(f"\nFound {len(interesting)} potential compressed blocks:")
			for offset, candidate in interesting[:20]:
				print(f"  0x{offset:06X}: {candidate['type']} "
					  f"({candidate['confidence']})")
		else:
			print("No compression detected at aligned offsets")
			print("Try --scan for full analysis")


if __name__ == "__main__":
	main()
