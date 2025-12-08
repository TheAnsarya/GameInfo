#!/usr/bin/env python3
"""
ROM Statistics - Analyze ROM data and generate statistics

Provides:
- Byte frequency analysis
- Data pattern detection
- Code vs data estimation
- Compression potential analysis
"""

import argparse
import json
import math
import sys
from collections import Counter
from pathlib import Path
from typing import Dict, List, Optional, Tuple


class ROMStatistics:
	"""ROM data statistics analyzer."""

	def __init__(self, rom_path: Path):
		self.rom_path = rom_path
		self.rom_data = rom_path.read_bytes()
		self.header_size = self._detect_header()

	def _detect_header(self) -> int:
		"""Detect ROM header size."""
		# iNES header
		if self.rom_data[:4] == b'NES\x1a':
			return 16

		# SNES SMC header
		if len(self.rom_data) % 0x8000 == 0x200:
			return 0x200

		return 0

	def get_byte_frequency(self) -> Dict[int, int]:
		"""Get frequency of each byte value."""
		data = self.rom_data[self.header_size:]
		return dict(Counter(data))

	def get_entropy(self, data: Optional[bytes] = None) -> float:
		"""Calculate Shannon entropy of data."""
		if data is None:
			data = self.rom_data[self.header_size:]

		if len(data) == 0:
			return 0.0

		freq = Counter(data)
		total = len(data)

		entropy = 0.0
		for count in freq.values():
			if count > 0:
				p = count / total
				entropy -= p * math.log2(p)

		return entropy

	def get_block_entropy(self, block_size: int = 256) -> List[Tuple[int, float]]:
		"""Calculate entropy for each block."""
		data = self.rom_data[self.header_size:]
		results = []

		for i in range(0, len(data), block_size):
			block = data[i:i + block_size]
			if len(block) >= block_size // 2:  # Skip very small final blocks
				entropy = self.get_entropy(block)
				results.append((i + self.header_size, entropy))

		return results

	def find_repeated_sequences(
		self,
		min_length: int = 4,
		min_count: int = 3,
	) -> Dict[bytes, List[int]]:
		"""Find repeated byte sequences."""
		data = self.rom_data[self.header_size:]
		sequences: Dict[bytes, List[int]] = {}

		# Simple sliding window search
		for length in range(min_length, min(min_length + 8, len(data) // 10)):
			seen: Dict[bytes, List[int]] = {}

			for i in range(len(data) - length):
				seq = data[i:i + length]
				if seq not in seen:
					seen[seq] = []
				seen[seq].append(i + self.header_size)

			# Keep sequences that appear multiple times
			for seq, offsets in seen.items():
				if len(offsets) >= min_count:
					sequences[seq] = offsets

		return sequences

	def estimate_code_vs_data(self) -> Dict[str, float]:
		"""Estimate percentage of code vs data."""
		data = self.rom_data[self.header_size:]

		# 6502/65816 opcode bytes (simplified)
		code_indicators = {
			0x00, 0x01, 0x05, 0x06, 0x08, 0x09, 0x0A, 0x10,  # Common opcodes
			0x18, 0x20, 0x24, 0x25, 0x26, 0x28, 0x29, 0x2A,
			0x30, 0x38, 0x40, 0x48, 0x4A, 0x4C, 0x50, 0x58,
			0x60, 0x68, 0x6A, 0x6C, 0x70, 0x78,
			0x84, 0x85, 0x86, 0x88, 0x8A, 0x8C, 0x8D, 0x8E,
			0x90, 0x98, 0x9A, 0xA0, 0xA2, 0xA4, 0xA5, 0xA6,
			0xA8, 0xA9, 0xAA, 0xAC, 0xAD, 0xAE,
			0xB0, 0xB8, 0xBA, 0xC0, 0xC4, 0xC5, 0xC6, 0xC8,
			0xC9, 0xCA, 0xCC, 0xCD, 0xCE,
			0xD0, 0xD8, 0xE0, 0xE4, 0xE5, 0xE6, 0xE8, 0xE9,
			0xEA, 0xEC, 0xED, 0xEE,
			0xF0, 0xF8,
		}

		code_count = sum(1 for b in data if b in code_indicators)
		total = len(data)

		# Rough estimation
		code_ratio = code_count / total if total > 0 else 0

		return {
			"estimated_code": code_ratio * 100,
			"estimated_data": (1 - code_ratio) * 100,
			"code_indicator_bytes": code_count,
			"total_bytes": total,
		}

	def find_empty_regions(self, fill_byte: int = 0xFF) -> List[Tuple[int, int]]:
		"""Find regions filled with a specific byte."""
		data = self.rom_data[self.header_size:]
		regions = []
		start = None

		for i, b in enumerate(data):
			if b == fill_byte:
				if start is None:
					start = i
			else:
				if start is not None and i - start >= 16:  # Min 16 bytes
					regions.append((start + self.header_size, i - start))
				start = None

		# Handle trailing region
		if start is not None and len(data) - start >= 16:
			regions.append((start + self.header_size, len(data) - start))

		return regions

	def get_compression_potential(self) -> Dict:
		"""Estimate compression potential."""
		data = self.rom_data[self.header_size:]

		# Byte frequency for RLE potential
		freq = Counter(data)
		most_common = freq.most_common(1)[0] if freq else (0, 0)

		# Count runs
		runs = []
		current_byte = None
		current_count = 0

		for b in data:
			if b == current_byte:
				current_count += 1
			else:
				if current_count >= 3:
					runs.append(current_count)
				current_byte = b
				current_count = 1

		if current_count >= 3:
			runs.append(current_count)

		rle_savings = sum(run - 2 for run in runs)  # 2 bytes per RLE sequence

		# Entropy-based LZ estimate
		entropy = self.get_entropy()
		theoretical_min = (entropy / 8) * len(data)

		return {
			"original_size": len(data),
			"entropy": entropy,
			"theoretical_minimum": int(theoretical_min),
			"rle_potential_savings": rle_savings,
			"most_common_byte": f"${most_common[0]:02X}",
			"most_common_count": most_common[1],
			"run_count": len(runs),
			"average_run_length": sum(runs) / len(runs) if runs else 0,
		}

	def generate_report(self) -> str:
		"""Generate comprehensive statistics report."""
		lines = [
			"ROM Statistics Report",
			"=" * 60,
			f"File: {self.rom_path.name}",
			f"Total size: {len(self.rom_data):,} bytes",
			f"Header size: {self.header_size} bytes",
			f"Data size: {len(self.rom_data) - self.header_size:,} bytes",
			"",
		]

		# Entropy
		entropy = self.get_entropy()
		lines.append(f"Shannon Entropy: {entropy:.4f} bits/byte")
		lines.append(f"  (Max possible: 8.0, Random data: ~8.0, Compressed: 7.5-8.0)")
		lines.append("")

		# Byte frequency
		freq = self.get_byte_frequency()
		sorted_freq = sorted(freq.items(), key=lambda x: x[1], reverse=True)

		lines.append("Most Common Bytes:")
		lines.append("-" * 40)
		for byte_val, count in sorted_freq[:10]:
			pct = (count / (len(self.rom_data) - self.header_size)) * 100
			lines.append(f"  ${byte_val:02X}: {count:>8,} ({pct:>5.2f}%)")
		lines.append("")

		# Code vs Data estimate
		code_data = self.estimate_code_vs_data()
		lines.append("Code vs Data Estimate:")
		lines.append("-" * 40)
		lines.append(f"  Estimated code: {code_data['estimated_code']:.1f}%")
		lines.append(f"  Estimated data: {code_data['estimated_data']:.1f}%")
		lines.append("")

		# Empty regions
		empty_ff = self.find_empty_regions(0xFF)
		empty_00 = self.find_empty_regions(0x00)

		lines.append("Empty/Unused Regions:")
		lines.append("-" * 40)
		ff_total = sum(size for _, size in empty_ff)
		zero_total = sum(size for _, size in empty_00)
		lines.append(f"  Filled with $FF: {len(empty_ff)} regions, {ff_total:,} bytes")
		lines.append(f"  Filled with $00: {len(empty_00)} regions, {zero_total:,} bytes")
		lines.append("")

		# Compression potential
		comp = self.get_compression_potential()
		lines.append("Compression Potential:")
		lines.append("-" * 40)
		lines.append(f"  Theoretical minimum: {comp['theoretical_minimum']:,} bytes")
		lines.append(f"  RLE potential savings: {comp['rle_potential_savings']:,} bytes")
		lines.append(f"  Run sequences (≥3): {comp['run_count']}")
		if comp['average_run_length'] > 0:
			lines.append(f"  Average run length: {comp['average_run_length']:.1f}")
		lines.append("")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="ROM Statistics - Analyze ROM data and generate statistics",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
	# Generate full report
	python rom_stats.py report game.nes

	# Show byte frequency
	python rom_stats.py frequency game.nes --top 20

	# Calculate entropy
	python rom_stats.py entropy game.nes

	# Find empty regions
	python rom_stats.py empty game.nes

	# Block entropy analysis
	python rom_stats.py blocks game.nes --size 1024 -o entropy.csv

	# Export statistics as JSON
	python rom_stats.py report game.nes --json -o stats.json
		""",
	)

	subparsers = parser.add_subparsers(dest="command", help="Command")

	# Report command
	report_parser = subparsers.add_parser("report", help="Generate full report")
	report_parser.add_argument("rom", help="Input ROM file")
	report_parser.add_argument("--json", action="store_true", help="Output as JSON")
	report_parser.add_argument("-o", "--output", help="Output file")

	# Frequency command
	freq_parser = subparsers.add_parser("frequency", help="Show byte frequency")
	freq_parser.add_argument("rom", help="Input ROM file")
	freq_parser.add_argument("--top", type=int, default=16, help="Show top N bytes")
	freq_parser.add_argument("--all", action="store_true", help="Show all 256 values")

	# Entropy command
	entropy_parser = subparsers.add_parser("entropy", help="Calculate entropy")
	entropy_parser.add_argument("rom", help="Input ROM file")
	entropy_parser.add_argument("--range", help="Address range (start-end in hex)")

	# Empty command
	empty_parser = subparsers.add_parser("empty", help="Find empty regions")
	empty_parser.add_argument("rom", help="Input ROM file")
	empty_parser.add_argument("--fill", default="FF", help="Fill byte (hex)")
	empty_parser.add_argument("--min-size", type=int, default=16, help="Minimum region size")

	# Blocks command
	blocks_parser = subparsers.add_parser("blocks", help="Block entropy analysis")
	blocks_parser.add_argument("rom", help="Input ROM file")
	blocks_parser.add_argument("--size", type=int, default=256, help="Block size")
	blocks_parser.add_argument("-o", "--output", help="Output CSV file")

	# Sequences command
	seq_parser = subparsers.add_parser("sequences", help="Find repeated sequences")
	seq_parser.add_argument("rom", help="Input ROM file")
	seq_parser.add_argument("--min-length", type=int, default=4, help="Minimum length")
	seq_parser.add_argument("--min-count", type=int, default=5, help="Minimum occurrences")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	rom_path = Path(args.rom)
	if not rom_path.exists():
		print(f"Error: ROM file not found: {rom_path}", file=sys.stderr)
		return 1

	try:
		stats = ROMStatistics(rom_path)

		if args.command == "report":
			if args.json:
				# Generate JSON output
				data = {
					"file": rom_path.name,
					"total_size": len(stats.rom_data),
					"header_size": stats.header_size,
					"entropy": stats.get_entropy(),
					"byte_frequency": {f"${k:02X}": v for k, v in stats.get_byte_frequency().items()},
					"code_vs_data": stats.estimate_code_vs_data(),
					"compression": stats.get_compression_potential(),
					"empty_regions_ff": [{"offset": f"${o:06X}", "size": s} for o, s in stats.find_empty_regions(0xFF)],
					"empty_regions_00": [{"offset": f"${o:06X}", "size": s} for o, s in stats.find_empty_regions(0x00)],
				}
				output = json.dumps(data, indent="\t")
			else:
				output = stats.generate_report()

			if args.output:
				Path(args.output).write_text(output, encoding="utf-8")
				print(f"Report saved: {args.output}")
			else:
				print(output)

		elif args.command == "frequency":
			freq = stats.get_byte_frequency()
			sorted_freq = sorted(freq.items(), key=lambda x: x[1], reverse=True)

			total = sum(freq.values())
			print(f"\nByte Frequency Analysis for: {rom_path.name}")
			print("=" * 50)

			if args.all:
				items = sorted_freq
			else:
				items = sorted_freq[:args.top]

			print(f"{'Byte':>6}  {'Count':>10}  {'Percent':>8}  Bar")
			print("-" * 50)

			max_count = items[0][1] if items else 1
			for byte_val, count in items:
				pct = (count / total) * 100
				bar_len = int((count / max_count) * 20)
				bar = "█" * bar_len
				print(f"${byte_val:02X}    {count:>10,}  {pct:>7.2f}%  {bar}")

		elif args.command == "entropy":
			if args.range:
				parts = args.range.replace("$", "").replace("0x", "").split("-")
				start = int(parts[0], 16)
				end = int(parts[1], 16)
				data = stats.rom_data[start:end]
				entropy = stats.get_entropy(data)
				print(f"Entropy for ${start:06X}-${end:06X}: {entropy:.4f} bits/byte")
			else:
				entropy = stats.get_entropy()
				print(f"Overall entropy: {entropy:.4f} bits/byte")
				print(f"  (Max: 8.0, Random: ~8.0, Text: ~4-5, Compressed: ~7.5+)")

		elif args.command == "empty":
			fill = int(args.fill, 16)
			regions = stats.find_empty_regions(fill)

			print(f"\nEmpty Regions (filled with ${fill:02X}):")
			print("=" * 50)

			if not regions:
				print("No empty regions found.")
			else:
				total = 0
				for offset, size in regions:
					if size >= args.min_size:
						print(f"  ${offset:06X} - ${offset + size - 1:06X}  ({size:,} bytes)")
						total += size
				print(f"\nTotal: {total:,} bytes in {len(regions)} regions")

		elif args.command == "blocks":
			block_entropy = stats.get_block_entropy(args.size)

			if args.output:
				# Output CSV
				lines = ["Offset,Entropy"]
				for offset, entropy in block_entropy:
					lines.append(f"0x{offset:06X},{entropy:.4f}")
				Path(args.output).write_text("\n".join(lines), encoding="utf-8")
				print(f"Block entropy saved: {args.output}")
			else:
				print(f"\nBlock Entropy Analysis (block size: {args.size})")
				print("=" * 50)

				# Show summary
				entropies = [e for _, e in block_entropy]
				avg = sum(entropies) / len(entropies) if entropies else 0
				min_e = min(entropies) if entropies else 0
				max_e = max(entropies) if entropies else 0

				print(f"Average entropy: {avg:.4f}")
				print(f"Min entropy: {min_e:.4f}")
				print(f"Max entropy: {max_e:.4f}")

				# Show low entropy blocks (likely data/empty)
				low_entropy = [(o, e) for o, e in block_entropy if e < 4.0]
				if low_entropy:
					print(f"\nLow entropy blocks (<4.0): {len(low_entropy)}")
					for offset, entropy in low_entropy[:10]:
						print(f"  ${offset:06X}: {entropy:.4f}")

		elif args.command == "sequences":
			sequences = stats.find_repeated_sequences(args.min_length, args.min_count)

			print(f"\nRepeated Sequences Analysis")
			print("=" * 50)
			print(f"Found {len(sequences)} repeated sequences")
			print()

			# Sort by total bytes saved
			sorted_seqs = sorted(
				sequences.items(),
				key=lambda x: len(x[0]) * len(x[1]),
				reverse=True,
			)

			for seq, offsets in sorted_seqs[:20]:
				hex_str = seq.hex().upper()
				if len(hex_str) > 20:
					hex_str = hex_str[:20] + "..."
				savings = (len(seq) - 1) * len(offsets)
				print(f"  {hex_str}: {len(offsets)} times, saves ~{savings} bytes")

	except Exception as e:
		print(f"Error: {e}", file=sys.stderr)
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
