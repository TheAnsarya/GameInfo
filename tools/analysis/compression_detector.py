#!/usr/bin/env python3
"""
Compression Detector Tool
Detect and identify compression algorithms used in ROMs.

Usage:
	python compression_detector.py rom.nes --scan
	python compression_detector.py rom.sfc --offset 0x10000 --length 0x1000
	python compression_detector.py rom.nes --decompress lz --offset 0x8000
"""

import argparse
import json
import os
import sys
from pathlib import Path
from typing import Optional, Tuple


class CompressionDetector:
	"""Detect compression algorithms in ROM data."""

	# Known compression signatures and patterns
	COMPRESSION_PATTERNS = {
		'lz77': {
			'description': 'LZ77/LZSS compression',
			'signatures': [],
			'heuristics': ['high_repeat_ratio', 'back_references']
		},
		'rle': {
			'description': 'Run-Length Encoding',
			'signatures': [],
			'heuristics': ['repeated_bytes', 'control_bytes']
		},
		'huffman': {
			'description': 'Huffman coding',
			'signatures': [],
			'heuristics': ['bit_packed', 'tree_header']
		},
		'dq_text': {
			'description': 'Dragon Quest text compression',
			'signatures': [b'\xff'],
			'heuristics': ['dictionary_codes', 'terminator_ff']
		},
		'ff_lzss': {
			'description': 'Final Fantasy LZSS variant',
			'signatures': [],
			'heuristics': ['lzss_flags', 'window_size_4096']
		},
		'nintendo_lz': {
			'description': 'Nintendo LZ compression (GBA/DS)',
			'signatures': [b'\x10'],
			'heuristics': ['lz10_header']
		}
	}

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		self.rom_path = Path(rom_path)
		self.rom_data = None
		self.header_size = 0

	def load_rom(self) -> bool:
		"""Load ROM file."""
		try:
			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()

			# Detect header
			if self.rom_data[:4] == b'NES\x1a':
				self.header_size = 16
			elif len(self.rom_data) % 0x8000 == 0x200:
				self.header_size = 0x200

			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def analyze_region(self, offset: int, length: int) -> dict:
		"""Analyze a region for compression patterns."""
		data = self.rom_data[offset:offset + length]

		results = {
			'offset': offset,
			'length': length,
			'entropy': self._calculate_entropy(data),
			'byte_distribution': self._byte_distribution(data),
			'repeat_ratio': self._repeat_ratio(data),
			'zero_ratio': data.count(0) / len(data) if data else 0,
			'ff_ratio': data.count(0xff) / len(data) if data else 0,
			'likely_types': [],
			'confidence': {}
		}

		# Check for different compression types
		for comp_type, info in self.COMPRESSION_PATTERNS.items():
			confidence = self._check_compression_type(data, comp_type, info)
			results['confidence'][comp_type] = confidence
			if confidence > 0.5:
				results['likely_types'].append((comp_type, confidence))

		# Sort by confidence
		results['likely_types'].sort(key=lambda x: -x[1])

		return results

	def _calculate_entropy(self, data: bytes) -> float:
		"""Calculate Shannon entropy of data."""
		import math

		if not data:
			return 0.0

		counts = [0] * 256
		for b in data:
			counts[b] += 1

		entropy = 0.0
		length = len(data)
		for count in counts:
			if count > 0:
				p = count / length
				entropy -= p * math.log2(p)

		return entropy

	def _byte_distribution(self, data: bytes) -> dict:
		"""Get byte value distribution."""
		counts = [0] * 256
		for b in data:
			counts[b] += 1

		return {
			'unique_bytes': sum(1 for c in counts if c > 0),
			'most_common': sorted(
				[(i, c) for i, c in enumerate(counts) if c > 0],
				key=lambda x: -x[1]
			)[:10],
			'distribution_type': self._classify_distribution(counts)
		}

	def _classify_distribution(self, counts: list) -> str:
		"""Classify byte distribution pattern."""
		non_zero = [c for c in counts if c > 0]
		if not non_zero:
			return 'empty'

		total = sum(non_zero)
		avg = total / len(non_zero)

		# Check for uniform distribution
		variance = sum((c - avg) ** 2 for c in non_zero) / len(non_zero)

		if len(non_zero) < 32:
			return 'sparse'
		elif variance < avg * 0.5:
			return 'uniform'
		elif max(non_zero) > total * 0.1:
			return 'skewed'
		else:
			return 'mixed'

	def _repeat_ratio(self, data: bytes) -> float:
		"""Calculate ratio of repeated byte sequences."""
		if len(data) < 2:
			return 0.0

		repeats = 0
		for i in range(1, len(data)):
			if data[i] == data[i-1]:
				repeats += 1

		return repeats / (len(data) - 1)

	def _check_compression_type(self, data: bytes,
								comp_type: str, info: dict) -> float:
		"""Check confidence for a specific compression type."""
		if not data:
			return 0.0

		confidence = 0.0
		checks = 0

		# Check signatures
		for sig in info.get('signatures', []):
			checks += 1
			if data.startswith(sig):
				confidence += 1.0

		# Apply heuristics
		for heuristic in info.get('heuristics', []):
			checks += 1
			confidence += self._apply_heuristic(data, heuristic)

		return confidence / checks if checks > 0 else 0.0

	def _apply_heuristic(self, data: bytes, heuristic: str) -> float:
		"""Apply a specific heuristic check."""
		if heuristic == 'high_repeat_ratio':
			ratio = self._repeat_ratio(data)
			return 1.0 if ratio > 0.3 else ratio

		elif heuristic == 'repeated_bytes':
			# Look for RLE patterns (count byte, value byte)
			rle_score = 0
			for i in range(0, len(data) - 2, 2):
				count = data[i]
				if 2 <= count <= 127:
					rle_score += 1
			return min(1.0, rle_score / (len(data) / 10))

		elif heuristic == 'back_references':
			# Look for back-reference patterns
			ref_score = 0
			for i in range(len(data) - 2):
				if (data[i] & 0x80) and i > 0:
					ref_score += 1
			return min(1.0, ref_score / (len(data) / 20))

		elif heuristic == 'dictionary_codes':
			# Check for dictionary-based text codes
			high_bytes = sum(1 for b in data if b >= 0x80 and b != 0xff)
			return min(1.0, high_bytes / (len(data) * 0.3))

		elif heuristic == 'terminator_ff':
			return 1.0 if 0xff in data else 0.0

		elif heuristic == 'lz10_header':
			if len(data) >= 4 and data[0] == 0x10:
				size = data[1] | (data[2] << 8) | (data[3] << 16)
				if 0 < size < 0x100000:
					return 0.8
			return 0.0

		return 0.0

	def scan_for_compressed(self, window_size: int = 0x100,
							 step: int = 0x40) -> list:
		"""Scan ROM for likely compressed regions."""
		results = []
		data = self.rom_data[self.header_size:]

		i = 0
		while i < len(data) - window_size:
			region = self.analyze_region(
				i + self.header_size,
				min(window_size, len(data) - i)
			)

			if region['likely_types']:
				results.append({
					'offset': i + self.header_size,
					'types': region['likely_types'],
					'entropy': region['entropy']
				})

			i += step

		# Merge adjacent regions
		merged = []
		for r in results:
			if merged and r['offset'] - merged[-1]['offset'] < step * 2:
				merged[-1]['end'] = r['offset'] + window_size
			else:
				r['end'] = r['offset'] + window_size
				merged.append(r)

		return merged

	def detect_at_offset(self, offset: int) -> dict:
		"""Detect compression type at a specific offset."""
		# Try different sizes
		for size in [0x100, 0x200, 0x400, 0x800]:
			if offset + size > len(self.rom_data):
				break
			result = self.analyze_region(offset, size)
			if result['likely_types']:
				return result
		return {'likely_types': [], 'confidence': {}}

	def try_decompress(self, offset: int, comp_type: str) -> Optional[bytes]:
		"""Attempt to decompress data at offset."""
		data = self.rom_data[offset:]

		if comp_type == 'rle':
			return self._decompress_rle(data)
		elif comp_type == 'lz77':
			return self._decompress_lz77(data)
		elif comp_type == 'dq_text':
			return self._decompress_dq_text(data)

		return None

	def _decompress_rle(self, data: bytes) -> bytes:
		"""Decompress RLE data."""
		output = bytearray()
		i = 0

		while i < len(data):
			control = data[i]
			i += 1

			if control == 0:
				break
			elif control < 0x80:
				# Literal run
				output.extend(data[i:i + control])
				i += control
			else:
				# Repeat run
				count = control - 0x80 + 1
				if i < len(data):
					output.extend([data[i]] * count)
					i += 1

			# Safety limit
			if len(output) > 0x10000:
				break

		return bytes(output)

	def _decompress_lz77(self, data: bytes,
						 window_size: int = 0x1000) -> bytes:
		"""Decompress LZ77/LZSS data."""
		output = bytearray()
		i = 0

		while i < len(data):
			flags = data[i]
			i += 1

			for bit in range(8):
				if i >= len(data):
					break

				if flags & (1 << bit):
					# Literal byte
					output.append(data[i])
					i += 1
				else:
					# Back reference
					if i + 1 >= len(data):
						break
					ref = data[i] | (data[i + 1] << 8)
					i += 2

					length = (ref >> 12) + 3
					offset = ref & 0xfff

					if offset == 0:
						break

					for _ in range(length):
						if len(output) >= offset:
							output.append(output[-offset])
						else:
							output.append(0)

			# Safety limit
			if len(output) > 0x40000:
				break

		return bytes(output)

	def _decompress_dq_text(self, data: bytes) -> bytes:
		"""Decompress Dragon Quest style text."""
		output = bytearray()

		for b in data:
			if b == 0xff:
				break
			output.append(b)

		return bytes(output)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description='Detect compression algorithms in ROMs'
	)
	parser.add_argument('rom', help='ROM file to analyze')
	parser.add_argument('--scan', action='store_true',
						help='Scan for compressed regions')
	parser.add_argument('--offset', type=lambda x: int(x, 0),
						help='Analyze specific offset')
	parser.add_argument('--length', type=lambda x: int(x, 0),
						default=0x200, help='Length to analyze')
	parser.add_argument('--decompress', help='Try to decompress (type)')
	parser.add_argument('--output', '-o', help='Output file')
	parser.add_argument('--json', action='store_true',
						help='Output as JSON')

	args = parser.parse_args()

	detector = CompressionDetector(args.rom)

	if not detector.load_rom():
		sys.exit(1)

	if args.decompress and args.offset is not None:
		result = detector.try_decompress(args.offset, args.decompress)
		if result:
			if args.output:
				with open(args.output, 'wb') as f:
					f.write(result)
				print(f"Decompressed {len(result)} bytes to {args.output}")
			else:
				print(f"Decompressed {len(result)} bytes")
				print(result[:256].hex())
		else:
			print("Decompression failed")

	elif args.scan:
		regions = detector.scan_for_compressed()

		if args.json:
			print(json.dumps(regions, indent='\t'))
		else:
			print(f"Found {len(regions)} potential compressed regions:")
			for r in regions:
				types_str = ', '.join(
					f"{t[0]}({t[1]:.1%})" for t in r['types']
				)
				print(f"  0x{r['offset']:06x}: {types_str}")

	elif args.offset is not None:
		result = detector.analyze_region(args.offset, args.length)

		if args.json:
			print(json.dumps(result, indent='\t'))
		else:
			print(f"Analysis of 0x{args.offset:06x}:")
			print(f"  Entropy: {result['entropy']:.2f} bits/byte")
			print(f"  Zero ratio: {result['zero_ratio']:.1%}")
			print(f"  Repeat ratio: {result['repeat_ratio']:.1%}")
			print(f"  Unique bytes: {result['byte_distribution']['unique_bytes']}")
			print(f"\nLikely compression types:")
			for comp_type, conf in result['likely_types']:
				print(f"  {comp_type}: {conf:.1%}")

	else:
		# Default: scan
		regions = detector.scan_for_compressed()
		print(f"Found {len(regions)} potential compressed regions")
		for r in regions[:10]:
			types_str = ', '.join(f"{t[0]}" for t in r['types'])
			print(f"  0x{r['offset']:06x}: {types_str}")


if __name__ == '__main__':
	main()
