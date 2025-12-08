#!/usr/bin/env python3
"""
ROM Diff

Compare ROM files and generate detailed diff reports.
Find differences between versions, translations, or hacks.

Features:
- Binary diff between ROMs
- Intelligent region detection
- Generate HTML visual diff
- Export difference lists
- Filter by region type (code, data, graphics)

Usage:
	python rom_diff.py compare <rom1> <rom2>
	python rom_diff.py report <rom1> <rom2> --output diff.html
	python rom_diff.py regions <rom1> <rom2> --min-size 16
	python rom_diff.py patch-list <rom1> <rom2> --output changes.json
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class DiffRegion:
	"""A contiguous region of differences"""
	offset: int
	size: int
	data1: bytes
	data2: bytes
	region_type: str = "unknown"  # code, data, graphics, text


@dataclass
class DiffStats:
	"""Statistics about differences"""
	total_bytes: int = 0
	different_bytes: int = 0
	identical_bytes: int = 0
	regions: int = 0
	largest_region: int = 0
	percentage: float = 0.0


def compare_files(data1: bytes, data2: bytes, min_gap: int = 4) -> Tuple[DiffStats, List[DiffRegion]]:
	"""
	Compare two files and find differences.
	Consecutive differences within min_gap bytes are merged into regions.
	"""
	stats = DiffStats()
	regions = []

	min_len = min(len(data1), len(data2))
	max_len = max(len(data1), len(data2))

	stats.total_bytes = max_len

	# Find all different bytes
	diff_offsets = []
	for i in range(min_len):
		if data1[i] != data2[i]:
			diff_offsets.append(i)

	# Add size difference if any
	if len(data1) != len(data2):
		for i in range(min_len, max_len):
			diff_offsets.append(i)

	stats.different_bytes = len(diff_offsets)
	stats.identical_bytes = stats.total_bytes - stats.different_bytes
	stats.percentage = (stats.different_bytes / stats.total_bytes * 100) if stats.total_bytes > 0 else 0

	# Merge into regions
	if diff_offsets:
		region_start = diff_offsets[0]
		region_end = diff_offsets[0]

		for offset in diff_offsets[1:]:
			if offset - region_end <= min_gap:
				region_end = offset
			else:
				# Save current region
				size = region_end - region_start + 1
				d1 = data1[region_start:region_start + size] if region_start + size <= len(data1) else data1[region_start:]
				d2 = data2[region_start:region_start + size] if region_start + size <= len(data2) else data2[region_start:]

				regions.append(DiffRegion(
					offset=region_start,
					size=size,
					data1=d1,
					data2=d2,
				))

				# Start new region
				region_start = offset
				region_end = offset

		# Save last region
		size = region_end - region_start + 1
		d1 = data1[region_start:region_start + size] if region_start + size <= len(data1) else data1[region_start:]
		d2 = data2[region_start:region_start + size] if region_start + size <= len(data2) else data2[region_start:]

		regions.append(DiffRegion(
			offset=region_start,
			size=size,
			data1=d1,
			data2=d2,
		))

	stats.regions = len(regions)
	stats.largest_region = max((r.size for r in regions), default=0)

	return stats, regions


def classify_region(region: DiffRegion) -> str:
	"""Attempt to classify what type of data a region contains"""
	data = region.data1  # Use first file's data

	if len(data) < 4:
		return "unknown"

	# Check for code patterns (6502)
	code_opcodes = {0x20, 0x60, 0x4C, 0xA9, 0xA5, 0xAD, 0x85, 0x8D, 0xA2, 0xA0, 0xE8, 0xC8}
	code_count = sum(1 for b in data if b in code_opcodes)
	code_ratio = code_count / len(data)

	# Check for graphics (NES tiles have specific patterns)
	# Tiles often have moderate entropy
	unique_bytes = len(set(data))
	unique_ratio = unique_bytes / min(len(data), 256)

	# Check for text (printable ASCII or common game text ranges)
	printable = sum(1 for b in data if 0x20 <= b <= 0x7F or b in (0, 0xFF))
	text_ratio = printable / len(data)

	if code_ratio > 0.15:
		return "code"
	elif text_ratio > 0.6:
		return "text"
	elif unique_ratio < 0.3 and len(data) >= 16:
		return "graphics"
	else:
		return "data"


def generate_html_report(
	file1: str,
	file2: str,
	stats: DiffStats,
	regions: List[DiffRegion],
	output_path: str
):
	"""Generate HTML diff report"""

	html = f"""<!DOCTYPE html>
<html>
<head>
	<title>ROM Diff Report</title>
	<style>
		body {{
			font-family: 'Consolas', 'Monaco', monospace;
			background: #1e1e1e;
			color: #d4d4d4;
			margin: 20px;
		}}
		h1, h2 {{ color: #569cd6; }}
		.stats {{
			background: #252526;
			padding: 15px;
			border-radius: 5px;
			margin-bottom: 20px;
		}}
		.stats table {{ border-collapse: collapse; }}
		.stats td {{ padding: 5px 15px 5px 0; }}
		.stats .label {{ color: #9cdcfe; }}
		.stats .value {{ color: #ce9178; }}
		.region {{
			background: #252526;
			margin: 10px 0;
			padding: 10px;
			border-radius: 5px;
			border-left: 3px solid #569cd6;
		}}
		.region.code {{ border-left-color: #4ec9b0; }}
		.region.text {{ border-left-color: #ce9178; }}
		.region.graphics {{ border-left-color: #b5cea8; }}
		.region.data {{ border-left-color: #dcdcaa; }}
		.region-header {{
			display: flex;
			justify-content: space-between;
			margin-bottom: 10px;
		}}
		.hex-view {{
			display: flex;
			gap: 20px;
		}}
		.hex-block {{
			flex: 1;
		}}
		.hex-block h4 {{
			margin: 5px 0;
			color: #9cdcfe;
		}}
		.hex {{
			background: #1e1e1e;
			padding: 10px;
			font-size: 12px;
			overflow-x: auto;
			white-space: pre-wrap;
			word-break: break-all;
		}}
		.diff {{ color: #f14c4c; background: #4b1818; }}
		.same {{ color: #6a9955; }}
		.offset {{ color: #569cd6; }}
		.type-badge {{
			padding: 2px 8px;
			border-radius: 3px;
			font-size: 12px;
			background: #3c3c3c;
		}}
	</style>
</head>
<body>
	<h1>ROM Diff Report</h1>

	<div class="stats">
		<h2>Summary</h2>
		<table>
			<tr><td class="label">File 1:</td><td class="value">{os.path.basename(file1)}</td></tr>
			<tr><td class="label">File 2:</td><td class="value">{os.path.basename(file2)}</td></tr>
			<tr><td class="label">Total Size:</td><td class="value">{stats.total_bytes:,} bytes</td></tr>
			<tr><td class="label">Different Bytes:</td><td class="value">{stats.different_bytes:,} ({stats.percentage:.2f}%)</td></tr>
			<tr><td class="label">Diff Regions:</td><td class="value">{stats.regions}</td></tr>
			<tr><td class="label">Largest Region:</td><td class="value">{stats.largest_region:,} bytes</td></tr>
		</table>
	</div>

	<h2>Differences</h2>
"""

	for i, region in enumerate(regions[:100]):  # Limit to 100 regions
		region_type = classify_region(region)

		# Format hex with highlighting
		def format_hex(data: bytes, other: bytes) -> str:
			result = []
			for j, b in enumerate(data):
				if j < len(other) and b != other[j]:
					result.append(f'<span class="diff">{b:02X}</span>')
				else:
					result.append(f'{b:02X}')
				if (j + 1) % 16 == 0:
					result.append('\n')
				elif (j + 1) % 8 == 0:
					result.append('  ')
				else:
					result.append(' ')
			return ''.join(result)

		hex1 = format_hex(region.data1[:64], region.data2[:64])
		hex2 = format_hex(region.data2[:64], region.data1[:64])

		html += f"""
	<div class="region {region_type}">
		<div class="region-header">
			<span><span class="offset">0x{region.offset:06X}</span> - 0x{region.offset + region.size - 1:06X} ({region.size} bytes)</span>
			<span class="type-badge">{region_type}</span>
		</div>
		<div class="hex-view">
			<div class="hex-block">
				<h4>File 1</h4>
				<div class="hex">{hex1}</div>
			</div>
			<div class="hex-block">
				<h4>File 2</h4>
				<div class="hex">{hex2}</div>
			</div>
		</div>
	</div>
"""

	if len(regions) > 100:
		html += f"<p>... and {len(regions) - 100} more regions</p>"

	html += """
</body>
</html>
"""

	with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
		f.write(html)


def export_patch_list(regions: List[DiffRegion], output_path: str, format: str = 'json'):
	"""Export differences as a patch list"""
	patches = []

	for region in regions:
		patch = {
			'offset': f"0x{region.offset:06X}",
			'size': region.size,
			'original': region.data1.hex().upper(),
			'modified': region.data2.hex().upper(),
			'type': classify_region(region),
		}
		patches.append(patch)

	if format == 'json':
		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			json.dump({'patches': patches, 'count': len(patches)}, f, indent='\t')
	elif format == 'txt':
		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			for p in patches:
				f.write(f"{p['offset']}: {p['original']} -> {p['modified']}\n")


def main():
	parser = argparse.ArgumentParser(
		description='ROM Diff',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Compare command
	compare_parser = subparsers.add_parser('compare', help='Quick comparison')
	compare_parser.add_argument('file1', help='First ROM')
	compare_parser.add_argument('file2', help='Second ROM')

	# Report command
	report_parser = subparsers.add_parser('report', help='Generate HTML report')
	report_parser.add_argument('file1', help='First ROM')
	report_parser.add_argument('file2', help='Second ROM')
	report_parser.add_argument('--output', '-o', required=True, help='Output HTML file')

	# Regions command
	regions_parser = subparsers.add_parser('regions', help='List diff regions')
	regions_parser.add_argument('file1', help='First ROM')
	regions_parser.add_argument('file2', help='Second ROM')
	regions_parser.add_argument('--min-size', type=int, default=1, help='Minimum region size')
	regions_parser.add_argument('--type', '-t', help='Filter by type')

	# Patch-list command
	patch_parser = subparsers.add_parser('patch-list', help='Export patch list')
	patch_parser.add_argument('file1', help='Original ROM')
	patch_parser.add_argument('file2', help='Modified ROM')
	patch_parser.add_argument('--output', '-o', required=True, help='Output file')
	patch_parser.add_argument('--format', '-f', default='json', choices=['json', 'txt'], help='Output format')

	args = parser.parse_args()

	if args.command == 'compare':
		with open(args.file1, 'rb') as f:
			data1 = f.read()
		with open(args.file2, 'rb') as f:
			data2 = f.read()

		stats, regions = compare_files(data1, data2)

		print(f"Comparing:")
		print(f"  File 1: {args.file1} ({len(data1):,} bytes)")
		print(f"  File 2: {args.file2} ({len(data2):,} bytes)")
		print()
		print(f"Results:")
		print(f"  Different bytes: {stats.different_bytes:,} ({stats.percentage:.2f}%)")
		print(f"  Identical bytes: {stats.identical_bytes:,}")
		print(f"  Diff regions: {stats.regions}")
		print(f"  Largest region: {stats.largest_region:,} bytes")

		if regions:
			print()
			print("First 10 differences:")
			for region in regions[:10]:
				rtype = classify_region(region)
				print(f"  0x{region.offset:06X}: {region.size} bytes ({rtype})")

	elif args.command == 'report':
		with open(args.file1, 'rb') as f:
			data1 = f.read()
		with open(args.file2, 'rb') as f:
			data2 = f.read()

		stats, regions = compare_files(data1, data2)
		generate_html_report(args.file1, args.file2, stats, regions, args.output)

		print(f"Report saved to: {args.output}")
		print(f"Found {stats.regions} diff regions ({stats.different_bytes:,} bytes)")

	elif args.command == 'regions':
		with open(args.file1, 'rb') as f:
			data1 = f.read()
		with open(args.file2, 'rb') as f:
			data2 = f.read()

		stats, regions = compare_files(data1, data2)

		# Filter
		filtered = [r for r in regions if r.size >= args.min_size]
		if args.type:
			filtered = [r for r in filtered if classify_region(r) == args.type]

		print(f"Diff Regions (>= {args.min_size} bytes):")
		print(f"{'Offset':<12} {'Size':<10} {'Type':<12}")
		print("-" * 40)

		for region in filtered[:100]:
			rtype = classify_region(region)
			print(f"0x{region.offset:06X}    {region.size:<10} {rtype:<12}")

		if len(filtered) > 100:
			print(f"... and {len(filtered) - 100} more")

	elif args.command == 'patch-list':
		with open(args.file1, 'rb') as f:
			data1 = f.read()
		with open(args.file2, 'rb') as f:
			data2 = f.read()

		stats, regions = compare_files(data1, data2)
		export_patch_list(regions, args.output, args.format)

		print(f"Exported {len(regions)} patches to: {args.output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
