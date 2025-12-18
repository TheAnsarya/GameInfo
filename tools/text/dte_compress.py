#!/usr/bin/env python3
"""
DTE/MTE Text Compression Tool

Dual Tile Encoding (DTE) and Multi Tile Encoding (MTE) compression
for ROM hacking text. Compresses text by replacing common pairs/sequences
with single byte codes.

C# equivalent: GameInfoTools.Text.DteOptimizer
See: src/GameInfoTools.Text/DteOptimizer.cs
"""

import argparse
import json
import re
from collections import Counter
from pathlib import Path
from typing import Optional


class DTECompressor:
	"""DTE/MTE text compression and decompression."""

	def __init__(self):
		self.dte_table = {}  # byte -> string
		self.reverse_table = {}  # string -> byte
		self.char_table = {}  # byte -> char (standard encoding)
		self.reverse_char_table = {}  # char -> byte

	def load_tbl(self, tbl_path: str):
		"""Load a .tbl character encoding file."""
		tbl_data = Path(tbl_path).read_text(encoding='utf-8')

		for line in tbl_data.splitlines():
			line = line.strip()
			if not line or line.startswith('#') or line.startswith(';'):
				continue

			if '=' in line:
				parts = line.split('=', 1)
				if len(parts) == 2:
					hex_val = parts[0].strip()
					char = parts[1]

					# Handle special characters
					if char == '\\n':
						char = '\n'
					elif char == '\\r':
						char = '\r'

					try:
						byte_val = int(hex_val, 16)
						self.char_table[byte_val] = char
						self.reverse_char_table[char] = byte_val
					except ValueError:
						pass

	def load_dte_table(self, dte_path: str):
		"""Load a DTE/MTE table file."""
		dte_data = Path(dte_path).read_text(encoding='utf-8')

		for line in dte_data.splitlines():
			line = line.strip()
			if not line or line.startswith('#') or line.startswith(';'):
				continue

			if '=' in line:
				parts = line.split('=', 1)
				if len(parts) == 2:
					hex_val = parts[0].strip()
					text = parts[1]

					try:
						byte_val = int(hex_val, 16)
						self.dte_table[byte_val] = text
						self.reverse_table[text] = byte_val
					except ValueError:
						pass

	def save_dte_table(self, output_path: str):
		"""Save DTE table to file."""
		lines = ["# DTE/MTE Table", "# Format: HexByte=Text", ""]

		for byte_val in sorted(self.dte_table.keys()):
			text = self.dte_table[byte_val]
			lines.append(f"{byte_val:02X}={text}")

		Path(output_path).write_text('\n'.join(lines), encoding='utf-8')

	def analyze_text(self, text: str, min_len: int = 2, max_len: int = 4) -> Counter:
		"""Analyze text for common sequences."""
		sequences = Counter()

		for length in range(min_len, max_len + 1):
			for i in range(len(text) - length + 1):
				seq = text[i:i + length]
				# Only count if it contains valid characters
				if all(c.isprintable() or c in '\n\r' for c in seq):
					sequences[seq] += 1

		return sequences

	def generate_dte_table(
		self,
		text: str,
		start_byte: int = 0x80,
		end_byte: int = 0xFE,
		min_len: int = 2,
		max_len: int = 4,
		min_occurrences: int = 3
	) -> dict:
		"""
		Generate optimal DTE table from text.

		Returns dictionary of byte -> string mappings.
		"""
		# Analyze text for common sequences
		sequences = self.analyze_text(text, min_len, max_len)

		# Filter by minimum occurrences
		valid_sequences = {
			seq: count for seq, count in sequences.items()
			if count >= min_occurrences
		}

		# Calculate savings for each sequence
		# Savings = (length - 1) * occurrences
		# (Each occurrence saves length-1 bytes by replacing with 1 byte)
		savings = {}
		for seq, count in valid_sequences.items():
			savings[seq] = (len(seq) - 1) * count

		# Sort by savings (descending)
		sorted_sequences = sorted(savings.items(), key=lambda x: -x[1])

		# Assign bytes
		dte_table = {}
		used_sequences = set()
		current_byte = start_byte

		for seq, save in sorted_sequences:
			if current_byte > end_byte:
				break

			# Check if this sequence overlaps with already used sequences
			# (Simple check - skip if already a substring of an assigned sequence)
			can_use = True
			for used in used_sequences:
				if seq in used and seq != used:
					can_use = False
					break

			if can_use:
				dte_table[current_byte] = seq
				used_sequences.add(seq)
				current_byte += 1

		self.dte_table = dte_table
		self.reverse_table = {v: k for k, v in dte_table.items()}

		return dte_table

	def compress(self, text: str) -> bytes:
		"""Compress text using DTE table."""
		result = bytearray()

		# Sort DTE entries by length (longest first) for greedy matching
		sorted_dte = sorted(self.reverse_table.items(), key=lambda x: -len(x[0]))

		i = 0
		while i < len(text):
			matched = False

			# Try DTE sequences first (longest first)
			for seq, byte_val in sorted_dte:
				if text[i:i + len(seq)] == seq:
					result.append(byte_val)
					i += len(seq)
					matched = True
					break

			if not matched:
				# Use standard character encoding
				char = text[i]
				if char in self.reverse_char_table:
					result.append(self.reverse_char_table[char])
				else:
					# Unknown character - encode as-is or skip
					if ord(char) < 256:
						result.append(ord(char))
				i += 1

		return bytes(result)

	def decompress(self, data: bytes) -> str:
		"""Decompress DTE-encoded data."""
		result = []

		for byte in data:
			if byte in self.dte_table:
				result.append(self.dte_table[byte])
			elif byte in self.char_table:
				result.append(self.char_table[byte])
			else:
				# Unknown byte - try as ASCII or use placeholder
				if 0x20 <= byte < 0x7F:
					result.append(chr(byte))
				else:
					result.append(f"[{byte:02X}]")

		return ''.join(result)

	def calculate_compression_ratio(self, original: str, compressed: bytes) -> dict:
		"""Calculate compression statistics."""
		# Estimate original size using character table
		original_size = len(original)  # Simplified - assume 1 byte per char
		compressed_size = len(compressed)

		return {
			"original_size": original_size,
			"compressed_size": compressed_size,
			"ratio": compressed_size / original_size if original_size > 0 else 1.0,
			"savings": original_size - compressed_size,
			"percent_saved": (1 - compressed_size / original_size) * 100 if original_size > 0 else 0,
		}


class MTEOptimizer:
	"""Advanced MTE optimization using dynamic programming."""

	def __init__(self, compressor: DTECompressor):
		self.compressor = compressor

	def optimal_compress(self, text: str) -> bytes:
		"""
		Find optimal compression using dynamic programming.

		This finds the minimum-length encoding considering all possible
		combinations of DTE entries and regular characters.
		"""
		n = len(text)
		if n == 0:
			return b''

		# dp[i] = (min_bytes, backtrack_info) to encode text[i:]
		dp = [(float('inf'), None) for _ in range(n + 1)]
		dp[n] = (0, None)

		# Build sorted DTE entries
		dte_entries = sorted(
			self.compressor.reverse_table.items(),
			key=lambda x: -len(x[0])
		)

		# Fill DP table backwards
		for i in range(n - 1, -1, -1):
			# Option 1: Use single character
			char = text[i]
			if char in self.compressor.reverse_char_table:
				cost = 1 + dp[i + 1][0]
				if cost < dp[i][0]:
					dp[i] = (cost, ('char', char, i + 1))
			elif ord(char) < 256:
				cost = 1 + dp[i + 1][0]
				if cost < dp[i][0]:
					dp[i] = (cost, ('raw', char, i + 1))

			# Option 2: Use DTE entries
			for seq, byte_val in dte_entries:
				if text[i:i + len(seq)] == seq:
					cost = 1 + dp[i + len(seq)][0]
					if cost < dp[i][0]:
						dp[i] = (cost, ('dte', byte_val, i + len(seq)))

		# Reconstruct solution
		result = bytearray()
		pos = 0
		while pos < n:
			_, info = dp[pos]
			if info is None:
				break

			type_, val, next_pos = info
			if type_ == 'char':
				result.append(self.compressor.reverse_char_table[val])
			elif type_ == 'raw':
				result.append(ord(val))
			elif type_ == 'dte':
				result.append(val)

			pos = next_pos

		return bytes(result)


def main():
	parser = argparse.ArgumentParser(description="DTE/MTE Text Compression Tool")
	subparsers = parser.add_subparsers(dest="command", help="Command to run")

	# Generate command
	gen_parser = subparsers.add_parser("generate",
		help="Generate DTE table from text")
	gen_parser.add_argument("input", help="Input text file")
	gen_parser.add_argument("-o", "--output", required=True,
		help="Output DTE table file")
	gen_parser.add_argument("--start", type=lambda x: int(x, 16), default=0x80,
		help="Start byte for DTE entries (hex)")
	gen_parser.add_argument("--end", type=lambda x: int(x, 16), default=0xFE,
		help="End byte for DTE entries (hex)")
	gen_parser.add_argument("--min-len", type=int, default=2,
		help="Minimum sequence length")
	gen_parser.add_argument("--max-len", type=int, default=4,
		help="Maximum sequence length")
	gen_parser.add_argument("--min-count", type=int, default=3,
		help="Minimum occurrences to include")

	# Compress command
	comp_parser = subparsers.add_parser("compress",
		help="Compress text using DTE table")
	comp_parser.add_argument("input", help="Input text file")
	comp_parser.add_argument("-o", "--output", required=True,
		help="Output binary file")
	comp_parser.add_argument("--dte", required=True, help="DTE table file")
	comp_parser.add_argument("--tbl", help="Character encoding table file")
	comp_parser.add_argument("--optimal", action="store_true",
		help="Use optimal (slower) compression")

	# Decompress command
	decomp_parser = subparsers.add_parser("decompress",
		help="Decompress DTE-encoded data")
	decomp_parser.add_argument("input", help="Input binary file")
	decomp_parser.add_argument("-o", "--output", required=True,
		help="Output text file")
	decomp_parser.add_argument("--dte", required=True, help="DTE table file")
	decomp_parser.add_argument("--tbl", help="Character encoding table file")

	# Analyze command
	analyze_parser = subparsers.add_parser("analyze",
		help="Analyze text for compression potential")
	analyze_parser.add_argument("input", help="Input text file")
	analyze_parser.add_argument("--top", type=int, default=50,
		help="Number of top sequences to show")
	analyze_parser.add_argument("--min-len", type=int, default=2,
		help="Minimum sequence length")
	analyze_parser.add_argument("--max-len", type=int, default=4,
		help="Maximum sequence length")

	args = parser.parse_args()

	if args.command == "generate":
		text = Path(args.input).read_text(encoding='utf-8')

		compressor = DTECompressor()
		dte_table = compressor.generate_dte_table(
			text,
			start_byte=args.start,
			end_byte=args.end,
			min_len=args.min_len,
			max_len=args.max_len,
			min_occurrences=args.min_count
		)

		compressor.save_dte_table(args.output)
		print(f"Generated DTE table with {len(dte_table)} entries")
		print(f"Saved to {args.output}")

		# Show top entries
		print("\nTop 10 DTE entries:")
		for i, (byte, seq) in enumerate(dte_table.items()):
			if i >= 10:
				break
			print(f"  ${byte:02X} = '{seq}'")

	elif args.command == "compress":
		text = Path(args.input).read_text(encoding='utf-8')

		compressor = DTECompressor()
		if args.tbl:
			compressor.load_tbl(args.tbl)
		compressor.load_dte_table(args.dte)

		if args.optimal:
			optimizer = MTEOptimizer(compressor)
			compressed = optimizer.optimal_compress(text)
		else:
			compressed = compressor.compress(text)

		Path(args.output).write_bytes(compressed)

		stats = compressor.calculate_compression_ratio(text, compressed)
		print(f"Compressed {args.input} -> {args.output}")
		print(f"  Original: {stats['original_size']} bytes")
		print(f"  Compressed: {stats['compressed_size']} bytes")
		print(f"  Savings: {stats['savings']} bytes ({stats['percent_saved']:.1f}%)")

	elif args.command == "decompress":
		data = Path(args.input).read_bytes()

		compressor = DTECompressor()
		if args.tbl:
			compressor.load_tbl(args.tbl)
		compressor.load_dte_table(args.dte)

		text = compressor.decompress(data)

		Path(args.output).write_text(text, encoding='utf-8')
		print(f"Decompressed {args.input} -> {args.output}")

	elif args.command == "analyze":
		text = Path(args.input).read_text(encoding='utf-8')

		compressor = DTECompressor()
		sequences = compressor.analyze_text(text, args.min_len, args.max_len)

		# Calculate savings potential
		savings = []
		for seq, count in sequences.most_common(args.top * 2):
			save = (len(seq) - 1) * count
			savings.append((seq, count, save))

		savings.sort(key=lambda x: -x[2])

		print(f"Top {args.top} sequences by compression potential:\n")
		print(f"{'Sequence':<20} {'Count':>8} {'Savings':>8}")
		print("-" * 40)

		for seq, count, save in savings[:args.top]:
			# Escape special characters for display
			display_seq = repr(seq)[1:-1]
			print(f"{display_seq:<20} {count:>8} {save:>8}")

		# Calculate total potential savings
		total_potential = sum(s[2] for s in savings[:127])  # Max 127 DTE entries
		print(f"\nPotential savings with up to 127 DTE entries: ~{total_potential} bytes")

	else:
		parser.print_help()


if __name__ == "__main__":
	main()
