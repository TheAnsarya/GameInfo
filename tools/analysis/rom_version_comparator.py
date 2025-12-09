#!/usr/bin/env python3
"""
ROM Version Comparator - Compare ROM versions to identify differences.

Useful for:
- Comparing regional versions (US/JP/EU)
- Finding bugfixes between revisions
- Identifying localization changes
- Documenting censorship/changes

Author: ROM Hacking Toolkit
"""

import argparse
import hashlib
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class ChangeType(Enum):
	"""Types of changes between ROMs."""
	MODIFIED = auto()
	ADDED = auto()
	REMOVED = auto()
	IDENTICAL = auto()


@dataclass
class DiffRegion:
	"""A region of differences between ROMs."""
	offset: int
	size: int
	rom1_data: bytes
	rom2_data: bytes
	change_type: ChangeType

	def to_dict(self) -> Dict:
		return {
			"offset": f"${self.offset:06x}",
			"size": self.size,
			"rom1_hex": self.rom1_data.hex() if len(self.rom1_data) <= 64 else f"{self.rom1_data[:32].hex()}...",
			"rom2_hex": self.rom2_data.hex() if len(self.rom2_data) <= 64 else f"{self.rom2_data[:32].hex()}...",
			"change_type": self.change_type.name,
		}


@dataclass
class ROMInfo:
	"""Information about a ROM file."""
	path: Path
	size: int
	sha1: str
	crc32: str
	header_size: int = 0
	format_type: str = "unknown"

	def to_dict(self) -> Dict:
		return {
			"path": str(self.path),
			"size": self.size,
			"sha1": self.sha1,
			"crc32": self.crc32,
			"header_size": self.header_size,
			"format_type": self.format_type,
		}


@dataclass
class ComparisonResult:
	"""Result of comparing two ROMs."""
	rom1: ROMInfo
	rom2: ROMInfo
	identical: bool
	diff_regions: List[DiffRegion]
	total_changed_bytes: int
	similarity_percent: float
	bank_diffs: Dict[int, int] = field(default_factory=dict)

	def to_dict(self) -> Dict:
		return {
			"rom1": self.rom1.to_dict(),
			"rom2": self.rom2.to_dict(),
			"identical": self.identical,
			"total_changed_bytes": self.total_changed_bytes,
			"similarity_percent": round(self.similarity_percent, 2),
			"diff_region_count": len(self.diff_regions),
			"diff_regions": [r.to_dict() for r in self.diff_regions[:100]],
			"bank_diffs": {f"${k:02x}": v for k, v in self.bank_diffs.items()},
		}


class ROMVersionComparator:
	"""Compare two ROM versions."""

	def __init__(
		self,
		min_diff_size: int = 1,
		max_merge_gap: int = 4,
		bank_size: int = 0x4000,
	):
		self.min_diff_size = min_diff_size
		self.max_merge_gap = max_merge_gap
		self.bank_size = bank_size

	def analyze_rom(self, path: Path) -> Tuple[ROMInfo, bytes]:
		"""Analyze a ROM file and return info + data."""
		with open(path, "rb") as f:
			data = f.read()

		# Calculate hashes
		sha1 = hashlib.sha1(data).hexdigest()
		crc32 = f"{struct.unpack('>I', struct.pack('>i', hash(data) & 0xffffffff))[0]:08x}"

		# Detect format and header
		header_size = 0
		format_type = "unknown"

		if data[:4] == b'NES\x1a':
			format_type = "iNES"
			header_size = 16
			if data[7] & 0x0c == 0x08:
				format_type = "NES2.0"
		elif len(data) > 0x8000 and len(data) % 0x8000 == 0x200:
			# SNES with copier header
			format_type = "SNES (copier header)"
			header_size = 0x200
		elif len(data) >= 0x8000:
			# Check SNES internal header
			lorom_name = data[0x7fc0:0x7fd5]
			hirom_name = data[0xffc0:0xffd5]
			if all(0x20 <= b <= 0x7e or b == 0 for b in lorom_name):
				format_type = "SNES (LoROM)"
			elif all(0x20 <= b <= 0x7e or b == 0 for b in hirom_name):
				format_type = "SNES (HiROM)"

		if len(data) >= 0x100 and data[0x104:0x134] != bytes(48):
			# Check for GB Nintendo logo
			nintendo_logo = bytes([
				0xce, 0xed, 0x66, 0x66, 0xcc, 0x0d, 0x00, 0x0b,
				0x03, 0x73, 0x00, 0x83, 0x00, 0x0c, 0x00, 0x0d,
			])
			if data[0x104:0x114] == nintendo_logo:
				format_type = "Game Boy"

		return ROMInfo(
			path=path,
			size=len(data),
			sha1=sha1,
			crc32=crc32,
			header_size=header_size,
			format_type=format_type,
		), data

	def compare(
		self,
		rom1_path: Path,
		rom2_path: Path,
	) -> ComparisonResult:
		"""Compare two ROMs and return detailed differences."""
		rom1_info, rom1_data = self.analyze_rom(rom1_path)
		rom2_info, rom2_data = self.analyze_rom(rom2_path)

		# Skip headers for comparison
		start1 = rom1_info.header_size
		start2 = rom2_info.header_size

		data1 = rom1_data[start1:]
		data2 = rom2_data[start2:]

		# Quick identity check
		if data1 == data2:
			return ComparisonResult(
				rom1=rom1_info,
				rom2=rom2_info,
				identical=True,
				diff_regions=[],
				total_changed_bytes=0,
				similarity_percent=100.0,
			)

		# Find differences
		diff_regions = self._find_diff_regions(data1, data2)
		merged_regions = self._merge_regions(diff_regions)

		# Calculate bank differences
		bank_diffs = self._calculate_bank_diffs(data1, data2)

		# Calculate statistics
		total_changed = sum(r.size for r in merged_regions)
		compare_size = max(len(data1), len(data2))
		similarity = ((compare_size - total_changed) / compare_size) * 100

		return ComparisonResult(
			rom1=rom1_info,
			rom2=rom2_info,
			identical=False,
			diff_regions=merged_regions,
			total_changed_bytes=total_changed,
			similarity_percent=similarity,
			bank_diffs=bank_diffs,
		)

	def _find_diff_regions(
		self,
		data1: bytes,
		data2: bytes,
	) -> List[DiffRegion]:
		"""Find all differing regions between two data blocks."""
		regions = []
		min_len = min(len(data1), len(data2))

		in_diff = False
		diff_start = 0

		for i in range(min_len):
			if data1[i] != data2[i]:
				if not in_diff:
					in_diff = True
					diff_start = i
			else:
				if in_diff:
					regions.append(DiffRegion(
						offset=diff_start,
						size=i - diff_start,
						rom1_data=data1[diff_start:i],
						rom2_data=data2[diff_start:i],
						change_type=ChangeType.MODIFIED,
					))
					in_diff = False

		# Handle trailing diff
		if in_diff:
			regions.append(DiffRegion(
				offset=diff_start,
				size=min_len - diff_start,
				rom1_data=data1[diff_start:min_len],
				rom2_data=data2[diff_start:min_len],
				change_type=ChangeType.MODIFIED,
			))

		# Handle size differences
		if len(data1) > len(data2):
			regions.append(DiffRegion(
				offset=len(data2),
				size=len(data1) - len(data2),
				rom1_data=data1[len(data2):],
				rom2_data=b"",
				change_type=ChangeType.REMOVED,
			))
		elif len(data2) > len(data1):
			regions.append(DiffRegion(
				offset=len(data1),
				size=len(data2) - len(data1),
				rom1_data=b"",
				rom2_data=data2[len(data1):],
				change_type=ChangeType.ADDED,
			))

		return regions

	def _merge_regions(
		self,
		regions: List[DiffRegion],
	) -> List[DiffRegion]:
		"""Merge nearby diff regions."""
		if not regions:
			return []

		merged = [regions[0]]

		for region in regions[1:]:
			last = merged[-1]
			gap = region.offset - (last.offset + last.size)

			if gap <= self.max_merge_gap and last.change_type == region.change_type:
				# Merge regions
				merged[-1] = DiffRegion(
					offset=last.offset,
					size=(region.offset + region.size) - last.offset,
					rom1_data=last.rom1_data + bytes(gap) + region.rom1_data,
					rom2_data=last.rom2_data + bytes(gap) + region.rom2_data,
					change_type=last.change_type,
				)
			else:
				merged.append(region)

		return merged

	def _calculate_bank_diffs(
		self,
		data1: bytes,
		data2: bytes,
	) -> Dict[int, int]:
		"""Calculate differences per bank."""
		bank_diffs = {}
		min_len = min(len(data1), len(data2))
		num_banks = (min_len + self.bank_size - 1) // self.bank_size

		for bank in range(num_banks):
			start = bank * self.bank_size
			end = min(start + self.bank_size, min_len)

			diff_count = sum(
				1 for i in range(start, end)
				if data1[i] != data2[i]
			)

			if diff_count > 0:
				bank_diffs[bank] = diff_count

		return bank_diffs

	def generate_report(
		self,
		result: ComparisonResult,
		output_format: str = "text",
	) -> str:
		"""Generate a comparison report."""
		if output_format == "json":
			return json.dumps(result.to_dict(), indent="\t")

		if output_format == "wikitext":
			return self._generate_wikitext_report(result)

		return self._generate_text_report(result)

	def _generate_text_report(self, result: ComparisonResult) -> str:
		"""Generate a text report."""
		lines = [
			"=" * 60,
			"ROM VERSION COMPARISON REPORT",
			"=" * 60,
			"",
			"ROM 1:",
			f"  Path: {result.rom1.path}",
			f"  Size: {result.rom1.size} bytes",
			f"  Format: {result.rom1.format_type}",
			f"  SHA-1: {result.rom1.sha1}",
			"",
			"ROM 2:",
			f"  Path: {result.rom2.path}",
			f"  Size: {result.rom2.size} bytes",
			f"  Format: {result.rom2.format_type}",
			f"  SHA-1: {result.rom2.sha1}",
			"",
			"-" * 60,
		]

		if result.identical:
			lines.append("ROMs are IDENTICAL (excluding headers)")
		else:
			lines.extend([
				f"Similarity: {result.similarity_percent:.2f}%",
				f"Total changed bytes: {result.total_changed_bytes}",
				f"Diff regions: {len(result.diff_regions)}",
				"",
				"CHANGED BANKS:",
			])

			for bank, count in sorted(result.bank_diffs.items()):
				lines.append(f"  Bank ${bank:02x}: {count} bytes changed")

			lines.extend(["", "DIFF REGIONS (first 50):"])

			for i, region in enumerate(result.diff_regions[:50]):
				lines.append(
					f"  ${region.offset:06x}-${region.offset+region.size-1:06x} "
					f"({region.size} bytes) [{region.change_type.name}]"
				)
				if region.size <= 16:
					lines.append(f"    ROM1: {region.rom1_data.hex()}")
					lines.append(f"    ROM2: {region.rom2_data.hex()}")

		return "\n".join(lines)

	def _generate_wikitext_report(self, result: ComparisonResult) -> str:
		"""Generate a wikitext report."""
		lines = [
			"==ROM Version Comparison==",
			"",
			"===ROM Information===",
			'{| class="wikitable"',
			"! Property !! ROM 1 !! ROM 2",
			"|-",
			f"| Path || {result.rom1.path.name} || {result.rom2.path.name}",
			"|-",
			f"| Size || {result.rom1.size} || {result.rom2.size}",
			"|-",
			f"| Format || {result.rom1.format_type} || {result.rom2.format_type}",
			"|-",
			f"| SHA-1 || <code>{result.rom1.sha1[:16]}...</code> || <code>{result.rom2.sha1[:16]}...</code>",
			"|}",
			"",
		]

		if result.identical:
			lines.append("'''ROMs are identical''' (excluding headers)")
		else:
			lines.extend([
				"===Comparison Summary===",
				'{| class="wikitable"',
				"! Metric !! Value",
				"|-",
				f"| Similarity || {result.similarity_percent:.2f}%",
				"|-",
				f"| Changed bytes || {result.total_changed_bytes}",
				"|-",
				f"| Diff regions || {len(result.diff_regions)}",
				"|}",
				"",
				"===Changed Banks===",
				'{| class="wikitable sortable"',
				"! Bank !! Offset !! Changed Bytes",
			])

			for bank, count in sorted(result.bank_diffs.items()):
				offset = bank * self.bank_size
				lines.append("|-")
				lines.append(f"| ${bank:02x} || ${offset:06x} || {count}")

			lines.extend([
				"|}",
				"",
				"===Differences===",
				'{| class="wikitable"',
				"! Offset !! Size !! Type",
			])

			for region in result.diff_regions[:30]:
				lines.append("|-")
				lines.append(
					f"| ${region.offset:06x} || {region.size} || {region.change_type.name}"
				)

			lines.append("|}")

		return "\n".join(lines)


def main():
	parser = argparse.ArgumentParser(
		description="ROM Version Comparator - Compare ROM versions"
	)
	parser.add_argument(
		"rom1",
		type=Path,
		help="First ROM file",
	)
	parser.add_argument(
		"rom2",
		type=Path,
		help="Second ROM file",
	)
	parser.add_argument(
		"-o", "--output",
		type=Path,
		help="Output file (default: stdout)",
	)
	parser.add_argument(
		"-f", "--format",
		choices=["text", "json", "wikitext"],
		default="text",
		help="Output format",
	)
	parser.add_argument(
		"--bank-size",
		type=lambda x: int(x, 0),
		default=0x4000,
		help="Bank size for bank-by-bank comparison",
	)
	parser.add_argument(
		"--merge-gap",
		type=int,
		default=4,
		help="Maximum gap to merge nearby diff regions",
	)

	args = parser.parse_args()

	comparator = ROMVersionComparator(
		bank_size=args.bank_size,
		max_merge_gap=args.merge_gap,
	)

	result = comparator.compare(args.rom1, args.rom2)
	report = comparator.generate_report(result, args.format)

	if args.output:
		with open(args.output, "w", encoding="utf-8") as f:
			f.write(report)
		print(f"Report written to {args.output}")
	else:
		print(report)


if __name__ == "__main__":
	main()
