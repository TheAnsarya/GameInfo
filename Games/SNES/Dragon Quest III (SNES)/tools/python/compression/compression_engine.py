#!/usr/bin/env python3
"""
Compression Algorithm Integration Module
Ports compression algorithms from logsmall repository for DQ3R project
Integrates BasicRing400, SimpleTailWindowCompression, and Huffman text compression
"""

import struct
import os
import sys
import time
from pathlib import Path
from typing import List, Dict, Any, Optional, Tuple, Union
from dataclasses import dataclass
from collections import deque
import json


@dataclass
class CompressionStats:
	"""Statistics for compression operations"""

	original_size: int
	compressed_size: int
	compression_ratio: float
	algorithm: str
	time_taken: float = 0.0

	def __post_init__(self):
		if self.original_size > 0:
			self.compression_ratio = self.compressed_size / self.original_size
		else:
			self.compression_ratio = 0.0


class BasicRing400:
	"""
	BasicRing400 compression algorithm from logsmall
	Uses 0x400 (1024) byte ring buffer with optimal path finding
	Format: 10-bit address field + 6-bit copy size field
	"""

	RING_SIZE = 0x400	# 1024 bytes
	MAX_COPY_SIZE = 63	# 6-bit field max value
	MIN_COPY_SIZE = 3	# Minimum bytes to make compression worthwhile

	def __init__(self):
		self.ring_buffer = bytearray(self.RING_SIZE)
		self.ring_pos = 0

	def compress(self, data: bytes) -> bytes:
		"""Compress data using BasicRing400 algorithm"""
		if not data:
			return b""

		compressed = bytearray()
		data_pos = 0
		self.ring_pos = 0
		self.ring_buffer = bytearray(self.RING_SIZE)

		while data_pos < len(data):
			# Find best match in ring buffer
			best_match = self._find_best_match(data, data_pos)

			if best_match and best_match["length"] >= self.MIN_COPY_SIZE:
				# Use compression
				match_addr = best_match["address"]
				match_length = best_match["length"]

				# Encode: 10-bit address + 6-bit length
				# Format: AAAAAAAA AALLLLL
				byte1 = (match_addr >> 2) & 0xff
				byte2 = ((match_addr & 0x03) << 6) | (match_length & 0x3f)

				compressed.extend([byte1, byte2])

				# Add copied bytes to ring buffer
				for i in range(match_length):
					if data_pos + i < len(data):
						self._add_to_ring(data[data_pos + i])

				data_pos += match_length

			else:
				# Use literal byte
				# Literal format: 1LLLLLLL (high bit set)
				literal_byte = data[data_pos] | 0x80
				compressed.append(literal_byte)

				self._add_to_ring(data[data_pos])
				data_pos += 1

		return bytes(compressed)

	def decompress(self, compressed_data: bytes) -> bytes:
		"""Decompress BasicRing400 compressed data"""
		if not compressed_data:
			return b""

		decompressed = bytearray()
		self.ring_pos = 0
		self.ring_buffer = bytearray(self.RING_SIZE)
		data_pos = 0

		while data_pos < len(compressed_data):
			if data_pos + 1 >= len(compressed_data):
				break

			byte1 = compressed_data[data_pos]

			if byte1 & 0x80:	# Literal byte
				literal = byte1 & 0x7f
				decompressed.append(literal)
				self._add_to_ring(literal)
				data_pos += 1
			else:
				# Compression pair
				if data_pos + 1 >= len(compressed_data):
					break

				byte2 = compressed_data[data_pos + 1]

				# Decode: 10-bit address + 6-bit length
				match_addr = ((byte1 << 2) | (byte2 >> 6)) & 0x3ff
				match_length = byte2 & 0x3f

				# Copy from ring buffer
				for _ in range(match_length):
					copied_byte = self.ring_buffer[match_addr]
					decompressed.append(copied_byte)
					self._add_to_ring(copied_byte)
					match_addr = (match_addr + 1) % self.RING_SIZE

				data_pos += 2

		return bytes(decompressed)

	def _find_best_match(self, data: bytes, pos: int) -> Optional[Dict[str, int]]:
		"""Find best match in ring buffer using optimal path approach"""
		if pos >= len(data):
			return None

		best_match = None
		max_length = min(self.MAX_COPY_SIZE, len(data) - pos)

		# Search ring buffer for matches
		for ring_addr in range(self.RING_SIZE):
			match_length = 0

			# Check how many bytes match
			while (
				match_length < max_length
				and pos + match_length < len(data)
				and data[pos + match_length] == self.ring_buffer[(ring_addr + match_length) % self.RING_SIZE]
			):
				match_length += 1

			# Update best match if this is better
			if match_length >= self.MIN_COPY_SIZE:
				if not best_match or match_length > best_match["length"]:
					best_match = {"address": ring_addr, "length": match_length}

		return best_match

	def _add_to_ring(self, byte: int):
		"""Add byte to ring buffer at current position"""
		self.ring_buffer[self.ring_pos] = byte
		self.ring_pos = (self.ring_pos + 1) % self.RING_SIZE


class SimpleTailWindowCompression:
	"""
	SimpleTailWindowCompression algorithm from logsmall
	Used by Final Fantasy Mystic Quest and Dragon Quest III
	Command + data format with word-based offset addressing
	"""

	def __init__(self, window_size: int = 0x1000):
		self.window_size = window_size
		self.min_match = 3
		self.max_match = 255 + self.min_match

	def compress(self, data: bytes) -> bytes:
		"""Compress using SimpleTailWindow algorithm"""
		if not data:
			return b""

		compressed = bytearray()
		pos = 0

		while pos < len(data):
			# Look for matches in previous data
			best_match = self._find_match(data, pos)

			if best_match and best_match["length"] >= self.min_match:
				# Compression command
				offset = best_match["offset"]
				length = best_match["length"]

				# Command format: offset as word + length byte
				command = struct.pack("<HB", offset, length - self.min_match)
				compressed.extend(command)

				pos += length
			else:
				# Literal byte
				compressed.append(data[pos])
				pos += 1

		return bytes(compressed)

	def decompress(self, compressed_data: bytes) -> bytes:
		"""Decompress SimpleTailWindow compressed data"""
		if not compressed_data:
			return b""

		decompressed = bytearray()
		pos = 0

		while pos < len(compressed_data):
			# Check if this could be a compression command
			if pos + 2 < len(compressed_data):
				# Try to read as command: word offset + byte length
				offset = struct.unpack("<H", compressed_data[pos : pos + 2])[0]
				length_byte = compressed_data[pos + 2]

				# Validate command
				if offset > 0 and offset <= len(decompressed) and length_byte + self.min_match <= self.max_match:

					# Copy from previous data
					copy_length = length_byte + self.min_match
					copy_pos = len(decompressed) - offset

					for _ in range(copy_length):
						if copy_pos < len(decompressed):
							decompressed.append(decompressed[copy_pos])
							copy_pos += 1

					pos += 3
					continue

			# Literal byte
			decompressed.append(compressed_data[pos])
			pos += 1

		return bytes(decompressed)

	def _find_match(self, data: bytes, pos: int) -> Optional[Dict[str, int]]:
		"""Find best match in sliding window"""
		if pos < self.min_match:
			return None

		best_match = None
		max_length = min(self.max_match, len(data) - pos)
		window_start = max(0, pos - self.window_size)

		# Search backwards in window
		for search_pos in range(pos - 1, window_start - 1, -1):
			match_length = 0

			# Count matching bytes
			while (
				match_length < max_length
				and pos + match_length < len(data)
				and search_pos + match_length < pos
				and data[pos + match_length] == data[search_pos + match_length]
			):
				match_length += 1

			# Update best match
			if match_length >= self.min_match:
				if not best_match or match_length > best_match["length"]:
					best_match = {"offset": pos - search_pos, "length": match_length}

		return best_match


class HuffmanDialogCompression:
	"""
	Huffman text compression for game dialog
	Optimized for common text patterns in RPG dialog
	"""

	def __init__(self):
		self.frequency_table = {}
		self.huffman_tree = None
		self.codes = {}

	def build_frequency_table(self, text: str) -> Dict[str, int]:
		"""Build character frequency table from text"""
		frequency = {}
		for char in text:
			frequency[char] = frequency.get(char, 0) + 1
		return frequency

	def build_huffman_tree(self, frequency: Dict[str, int]) -> Dict[str, str]:
		"""Build Huffman tree and generate codes"""
		import heapq

		if not frequency:
			return {}

		# Create priority queue
		heap = [[weight, char] for char, weight in frequency.items()]
		heapq.heapify(heap)

		# Build tree
		while len(heap) > 1:
			left = heapq.heappop(heap)
			right = heapq.heappop(heap)

			merged = [left[0] + right[0], left, right]
			heapq.heappush(heap, merged)

		# Generate codes
		codes = {}

		def generate_codes(node, code=""):
			if isinstance(node[1], str):	# Leaf node
				codes[node[1]] = code or "0"	# Handle single character case
			else:
				generate_codes(node[1], code + "0")
				generate_codes(node[2], code + "1")

		if heap:
			generate_codes(heap[0])

		return codes

	def compress_text(self, text: str) -> bytes:
		"""Compress text using Huffman encoding"""
		if not text:
			return b""

		# Build frequency table and Huffman codes
		frequency = self.build_frequency_table(text)
		codes = self.build_huffman_tree(frequency)

		# Encode text
		bit_string = "".join(codes[char] for char in text)

		# Convert bit string to bytes
		compressed = bytearray()

		# Store frequency table for decompression
		freq_data = json.dumps(frequency).encode("utf-8")
		compressed.extend(struct.pack("<H", len(freq_data)))
		compressed.extend(freq_data)

		# Store compressed data
		bit_length = len(bit_string)
		compressed.extend(struct.pack("<I", bit_length))

		# Pack bits into bytes
		for i in range(0, len(bit_string), 8):
			byte_bits = bit_string[i : i + 8].ljust(8, "0")
			byte_value = int(byte_bits, 2)
			compressed.append(byte_value)

		return bytes(compressed)

	def decompress_text(self, compressed_data: bytes) -> str:
		"""Decompress Huffman encoded text"""
		if not compressed_data:
			return ""

		pos = 0

		# Read frequency table
		freq_length = struct.unpack("<H", compressed_data[pos : pos + 2])[0]
		pos += 2

		freq_data = compressed_data[pos : pos + freq_length].decode("utf-8")
		frequency = json.loads(freq_data)
		pos += freq_length

		# Rebuild Huffman codes
		codes = self.build_huffman_tree(frequency)

		# Create reverse lookup
		reverse_codes = {code: char for char, code in codes.items()}

		# Read bit length
		bit_length = struct.unpack("<I", compressed_data[pos : pos + 4])[0]
		pos += 4

		# Convert bytes back to bit string
		bit_string = ""
		remaining_bytes = compressed_data[pos:]

		for byte_value in remaining_bytes:
			bit_string += format(byte_value, "08b")

		# Truncate to actual bit length
		bit_string = bit_string[:bit_length]

		# Decode using Huffman tree
		decoded_text = ""
		code_buffer = ""

		for bit in bit_string:
			code_buffer += bit
			if code_buffer in reverse_codes:
				decoded_text += reverse_codes[code_buffer]
				code_buffer = ""

		return decoded_text


class CompressionEngine:
	"""Main compression engine integrating all algorithms"""

	def __init__(self):
		self.algorithms = {
			"basic_ring400": BasicRing400(),
			"simple_tail_window": SimpleTailWindowCompression(),
			"huffman_dialog": HuffmanDialogCompression(),
		}

		self.stats_log = Path(__file__).parent.parent.parent / "logs" / "compression_stats.json"
		self.stats_log.parent.mkdir(exist_ok=True)

	def compress(self, data: Union[bytes, str], algorithm: str = "auto") -> Tuple[bytes, CompressionStats]:
		"""Compress data using specified algorithm"""
		import time

		if isinstance(data, str):
			# Text data - use Huffman for dialog
			if algorithm == "auto":
				algorithm = "huffman_dialog"
			original_bytes = data.encode("utf-8")
		else:
			original_bytes = data

		if algorithm == "auto":
			# Auto-select best algorithm for binary data
			algorithm = self._select_best_algorithm(original_bytes)

		if algorithm not in self.algorithms:
			raise ValueError(f"Unknown algorithm: {algorithm}")

		start_time = time.time()

		if isinstance(data, str) and algorithm == "huffman_dialog":
			compressed = self.algorithms[algorithm].compress_text(data)
		else:
			compressed = self.algorithms[algorithm].compress(original_bytes)

		end_time = time.time()

		stats = CompressionStats(
			original_size=len(original_bytes),
			compressed_size=len(compressed),
			compression_ratio=(len(compressed) / len(original_bytes) if original_bytes else 0.0),
			algorithm=algorithm,
			time_taken=end_time - start_time,
		)

		self._log_stats(stats)
		return compressed, stats

	def decompress(self, compressed_data: bytes, algorithm: str) -> bytes:
		"""Decompress data using specified algorithm"""
		if algorithm not in self.algorithms:
			raise ValueError(f"Unknown algorithm: {algorithm}")

		if algorithm == "huffman_dialog":
			return self.algorithms[algorithm].decompress_text(compressed_data).encode("utf-8")
		else:
			return self.algorithms[algorithm].decompress(compressed_data)

	def _select_best_algorithm(self, data: bytes) -> str:
		"""Auto-select best compression algorithm based on data characteristics"""
		# Small data - use BasicRing400
		if len(data) < 1024:
			return "basic_ring400"

		# Check for text patterns
		try:
			text = data.decode("utf-8")
			if self._is_dialog_text(text):
				return "huffman_dialog"
		except UnicodeDecodeError:
			pass

		# Default to SimpleTailWindow for larger binary data
		return "simple_tail_window"

	def _is_dialog_text(self, text: str) -> bool:
		"""Check if text appears to be game dialog"""
		dialog_indicators = [
			'"',
			"'",
			"!",
			"?",
			"...",
			"Hero",
			"King",
			"Princess",
			"Wizard",
			"gold",
			"experience",
			"level",
		]

		indicator_count = sum(1 for indicator in dialog_indicators if indicator.lower() in text.lower())
		return indicator_count >= 2

	def _log_stats(self, stats: CompressionStats):
		"""Log compression statistics"""
		try:
			if self.stats_log.exists():
				with open(self.stats_log, "r") as f:
					all_stats = json.load(f)
			else:
				all_stats = []

			all_stats.append(
				{
					"timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
					"algorithm": stats.algorithm,
					"original_size": stats.original_size,
					"compressed_size": stats.compressed_size,
					"compression_ratio": stats.compression_ratio,
					"time_taken": stats.time_taken,
				}
			)

			with open(self.stats_log, "w") as f:
				json.dump(all_stats, f, indent=2)

		except Exception as e:
			print(f"Warning: Could not log compression stats: {e}")


# Factory function for easy usage
def get_compression_engine() -> CompressionEngine:
	"""Get a configured compression engine instance"""
	return CompressionEngine()


if __name__ == "__main__":
	# Example usage and testing
	engine = get_compression_engine()

	# Test text compression
	sample_dialog = """
	"Welcome to the world of Dragon Quest III, brave Hero!
	Your quest to defeat the Archfiend Baramos awaits.
	Gather your party of brave adventurers and save the world!"
	"""

	print("Testing Huffman dialog compression...")
	compressed_dialog, dialog_stats = engine.compress(sample_dialog, "huffman_dialog")
	print(f"Original: {dialog_stats.original_size} bytes")
	print(f"Compressed: {dialog_stats.compressed_size} bytes")
	print(f"Ratio: {dialog_stats.compression_ratio:.2f}")

	# Test binary compression
	sample_binary = b"\x00\x01\x02\x03" * 256	# Repeating pattern

	print("\nTesting BasicRing400 compression...")
	compressed_binary, binary_stats = engine.compress(sample_binary, "basic_ring400")
	print(f"Original: {binary_stats.original_size} bytes")
	print(f"Compressed: {binary_stats.compressed_size} bytes")
	print(f"Ratio: {binary_stats.compression_ratio:.2f}")
