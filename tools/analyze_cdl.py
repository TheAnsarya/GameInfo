#!/usr/bin/env python3
"""
Analyze Mesen2 CDL (Code/Data Log) files.

CDL files record which bytes in a ROM have been accessed as code vs data
during emulation, which is useful for disassembly and ROM hacking.

Mesen2 CDL v2 format:
- 5 bytes: "CDLv2" magic
- 4 bytes: CRC32 of ROM
- N bytes: CDL flags (one byte per ROM byte)

SNES CDL flag bits:
- Bit 0: Code (executed as instruction)
- Bit 1: Data (read as data)
- Bit 2: Jump target
- Bit 3: Sub entry point
- Bit 4-7: Various other flags
"""

import sys
import os
from pathlib import Path
from collections import Counter


def analyze_cdl(cdl_path: str) -> dict:
	"""Analyze a Mesen2 CDL file and return statistics."""
	with open(cdl_path, 'rb') as f:
		data = f.read()

	# Parse header
	header = data[:5].decode('ascii', errors='replace')
	if header != 'CDLv2':
		print(f"Warning: Expected 'CDLv2' header, got '{header}'")

	crc32 = data[5:9].hex()

	# CDL data starts after 9-byte header
	cdl_data = data[9:]

	# Count flags
	code_count = 0
	data_count = 0
	jump_targets = 0
	sub_entries = 0
	unknown_count = 0

	for b in cdl_data:
		if b & 0x01:  # Code
			code_count += 1
			if b & 0x04:  # Jump target
				jump_targets += 1
			if b & 0x08:  # Sub entry point
				sub_entries += 1
		elif b & 0x02:  # Data (but not code)
			data_count += 1
		else:
			unknown_count += 1

	total = len(cdl_data)
	coverage = code_count + data_count

	return {
		'file': cdl_path,
		'header': header,
		'crc32': crc32,
		'rom_size': total,
		'code_bytes': code_count,
		'data_bytes': data_count,
		'unknown_bytes': unknown_count,
		'coverage': coverage,
		'coverage_pct': coverage / total * 100 if total > 0 else 0,
		'jump_targets': jump_targets,
		'sub_entries': sub_entries,
	}


def print_report(stats: dict):
	"""Print a human-readable report."""
	print(f"\n{'='*60}")
	print(f"CDL Analysis: {Path(stats['file']).name}")
	print(f"{'='*60}")
	print(f"Header: {stats['header']}")
	print(f"ROM CRC32: {stats['crc32']}")
	print(f"ROM Size: {stats['rom_size']:,} bytes ({stats['rom_size']/1024/1024:.2f} MB)")
	print()
	print(f"Coverage Statistics:")
	print(f"  Code bytes:    {stats['code_bytes']:>10,} ({stats['code_bytes']/stats['rom_size']*100:>6.2f}%)")
	print(f"  Data bytes:    {stats['data_bytes']:>10,} ({stats['data_bytes']/stats['rom_size']*100:>6.2f}%)")
	print(f"  Unknown:       {stats['unknown_bytes']:>10,} ({stats['unknown_bytes']/stats['rom_size']*100:>6.2f}%)")
	print(f"  {'─'*40}")
	print(f"  Total covered: {stats['coverage']:>10,} ({stats['coverage_pct']:>6.2f}%)")
	print()
	print(f"Code Analysis:")
	print(f"  Jump targets:     {stats['jump_targets']:>8,}")
	print(f"  Subroutine entries: {stats['sub_entries']:>6,}")
	print(f"{'='*60}\n")


def main():
	if len(sys.argv) < 2:
		# Default to Secret of Evermore CDL
		cdl_path = r"C:\Users\me\Documents\Mesen2\Debugger\Secret of Evermore (U) [!].cdl"
		if not os.path.exists(cdl_path):
			print(f"Usage: {sys.argv[0]} <cdl_file>")
			sys.exit(1)
	else:
		cdl_path = sys.argv[1]

	if not os.path.exists(cdl_path):
		print(f"Error: File not found: {cdl_path}")
		sys.exit(1)

	stats = analyze_cdl(cdl_path)
	print_report(stats)

	return stats


if __name__ == '__main__':
	main()
