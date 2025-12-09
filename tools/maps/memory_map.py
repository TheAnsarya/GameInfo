#!/usr/bin/env python3
"""
Memory Map Generator

Generate memory map documentation from various sources.
Creates visual and text representations of ROM and RAM usage.

Features:
- Parse CDL files for code/data coverage
- Parse label files for named regions
- Generate HTML/Markdown/Text reports
- Visualize memory layout
- Track unknowns and document progress

Usage:
	python memory_map.py generate <rom> --cdl <file.cdl> --labels <file.mlb> --output map.html
	python memory_map.py compare <rom1> <rom2> --output diff.html
	python memory_map.py document <rom> --format wikitext
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set


@dataclass
class MemoryRegion:
	"""Memory region definition"""
	name: str
	start: int
	end: int
	type: str = 'unknown'  # code, data, graphics, text, audio, unknown
	bank: int = -1
	description: str = ""
	labels: List[str] = field(default_factory=list)
	coverage: float = 0.0


@dataclass
class MemoryMap:
	"""Complete memory map"""
	name: str = ""
	total_size: int = 0
	header_size: int = 0
	regions: List[MemoryRegion] = field(default_factory=list)
	banks: Dict[int, List[MemoryRegion]] = field(default_factory=dict)
	ram_regions: List[MemoryRegion] = field(default_factory=list)
	coverage_stats: Dict = field(default_factory=dict)


class CDLParser:
	"""Parse CDL files for coverage info"""

	@staticmethod
	def parse(filepath: str) -> Dict[int, int]:
		"""Parse CDL file and return offset->flags mapping"""
		with open(filepath, 'rb') as f:
			data = f.read()

		# Skip headers
		if data[:3] == b'MCD':
			data = data[3:]
		elif data[:4] == b'CDL\x1a':
			data = data[4:]

		return {i: b for i, b in enumerate(data) if b != 0}

	@staticmethod
	def analyze_coverage(
		cdl_data: Dict[int, int],
		total_size: int
	) -> Dict:
		"""Analyze CDL coverage"""
		code_bytes = sum(1 for f in cdl_data.values() if f & 0x01)
		data_bytes = sum(1 for f in cdl_data.values() if f & 0x02 and not (f & 0x01))
		logged_bytes = len(cdl_data)

		return {
			'total': total_size,
			'logged': logged_bytes,
			'code': code_bytes,
			'data': data_bytes,
			'coverage_pct': logged_bytes / total_size * 100 if total_size > 0 else 0,
		}


class LabelParser:
	"""Parse label files"""

	@staticmethod
	def parse_mlb(filepath: str) -> Dict[int, Tuple[str, str]]:
		"""Parse MLB file, return address->(name, comment) mapping"""
		labels = {}

		with open(filepath, 'r', encoding='utf-8') as f:
			for line in f:
				line = line.strip()
				if not line or line.startswith(';'):
					continue

				parts = line.split(':')
				if len(parts) >= 3:
					addr_type = parts[0]
					if addr_type in ('P', 'G'):  # PRG or generic
						if len(parts) >= 5:
							bank = int(parts[1], 16)
							addr = int(parts[2], 16)
							name = parts[3]
							comment = parts[4] if len(parts) > 4 else ""
							# Convert to file offset (simplified)
							offset = bank * 0x4000 + (addr - 0x8000)
						else:
							addr = int(parts[1], 16)
							name = parts[2]
							comment = parts[3] if len(parts) > 3 else ""
							offset = addr
						labels[offset] = (name, comment)

		return labels


class MemoryMapGenerator:
	"""Generate memory maps"""

	def __init__(self, rom_path: str):
		with open(rom_path, 'rb') as f:
			self.data = f.read()
		self.rom_path = rom_path
		self.map = MemoryMap()
		self._analyze_header()

	def _analyze_header(self):
		"""Analyze ROM header"""
		if self.data[:4] == b'NES\x1a':
			self.map.header_size = 16
			prg_banks = self.data[4]
			chr_banks = self.data[5]
			if self.data[6] & 0x04:
				self.map.header_size += 512

			self.map.total_size = len(self.data)
			prg_size = prg_banks * 16384
			chr_size = chr_banks * 8192

			# Add PRG banks
			for i in range(prg_banks):
				bank_start = self.map.header_size + i * 16384
				bank_end = bank_start + 16383
				self.map.regions.append(MemoryRegion(
					name=f"PRG Bank {i:02X}",
					start=bank_start,
					end=bank_end,
					type='code',
					bank=i,
				))

			# Add CHR banks
			for i in range(chr_banks):
				bank_start = self.map.header_size + prg_size + i * 8192
				bank_end = bank_start + 8191
				self.map.regions.append(MemoryRegion(
					name=f"CHR Bank {i:02X}",
					start=bank_start,
					end=bank_end,
					type='graphics',
					bank=i,
				))

	def add_cdl(self, filepath: str):
		"""Add CDL coverage data"""
		cdl_data = CDLParser.parse(filepath)
		self.map.coverage_stats = CDLParser.analyze_coverage(
			cdl_data, self.map.total_size - self.map.header_size
		)

		# Update region coverage
		for region in self.map.regions:
			region_logged = sum(
				1 for offset in range(region.start, region.end + 1)
				if (offset - self.map.header_size) in cdl_data
			)
			region_size = region.end - region.start + 1
			region.coverage = region_logged / region_size * 100 if region_size > 0 else 0

	def add_labels(self, filepath: str):
		"""Add label data"""
		labels = LabelParser.parse_mlb(filepath)

		for offset, (name, comment) in labels.items():
			# Find containing region
			for region in self.map.regions:
				if region.start <= offset + self.map.header_size <= region.end:
					region.labels.append(f"{name}: {comment}" if comment else name)
					break

	def generate_html(self, filepath: str):
		"""Generate HTML memory map"""
		html = f"""<!DOCTYPE html>
<html>
<head>
	<title>Memory Map - {os.path.basename(self.rom_path)}</title>
	<style>
		body {{ font-family: sans-serif; margin: 20px; }}
		.summary {{ background: #f5f5f5; padding: 15px; margin: 20px 0; border-radius: 8px; }}
		.region {{ margin: 10px 0; padding: 10px; border: 1px solid #ddd; border-radius: 4px; }}
		.region.code {{ border-left: 4px solid #4CAF50; }}
		.region.data {{ border-left: 4px solid #2196F3; }}
		.region.graphics {{ border-left: 4px solid #FF9800; }}
		.region.unknown {{ border-left: 4px solid #9E9E9E; }}
		.coverage-bar {{ background: #e0e0e0; height: 20px; border-radius: 4px; overflow: hidden; }}
		.coverage-fill {{ background: #4CAF50; height: 100%; }}
		.labels {{ font-size: 0.9em; color: #666; margin-top: 8px; }}
		table {{ border-collapse: collapse; width: 100%; }}
		th, td {{ border: 1px solid #ddd; padding: 8px; text-align: left; }}
		th {{ background: #f0f0f0; }}
	</style>
</head>
<body>
	<h1>Memory Map</h1>
	<p>ROM: {os.path.basename(self.rom_path)}</p>
	<p>Size: {self.map.total_size:,} bytes ({self.map.total_size // 1024} KB)</p>

	<div class="summary">
		<h2>Coverage Summary</h2>
"""
		if self.map.coverage_stats:
			stats = self.map.coverage_stats
			html += f"""
		<p>Total logged: {stats['logged']:,} / {stats['total']:,} bytes ({stats['coverage_pct']:.1f}%)</p>
		<p>Code: {stats['code']:,} bytes</p>
		<p>Data: {stats['data']:,} bytes</p>
		<div class="coverage-bar">
			<div class="coverage-fill" style="width: {stats['coverage_pct']:.1f}%"></div>
		</div>
"""
		html += """
	</div>

	<h2>Regions</h2>
"""
		for region in self.map.regions:
			html += f"""
	<div class="region {region.type}">
		<h3>{region.name}</h3>
		<p>Offset: 0x{region.start:06X} - 0x{region.end:06X} ({region.end - region.start + 1:,} bytes)</p>
		<p>Coverage: {region.coverage:.1f}%</p>
		<div class="coverage-bar">
			<div class="coverage-fill" style="width: {region.coverage:.1f}%"></div>
		</div>
"""
			if region.labels:
				html += '<div class="labels"><strong>Labels:</strong><br>'
				for label in region.labels[:20]:
					html += f'{label}<br>'
				if len(region.labels) > 20:
					html += f'... and {len(region.labels) - 20} more'
				html += '</div>'
			html += '</div>\n'

		html += """
</body>
</html>"""

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write(html)

	def generate_markdown(self, filepath: str):
		"""Generate Markdown memory map"""
		lines = [
			f"# Memory Map - {os.path.basename(self.rom_path)}",
			"",
			"## Overview",
			"",
			f"- **Size:** {self.map.total_size:,} bytes ({self.map.total_size // 1024} KB)",
			f"- **Header:** {self.map.header_size} bytes",
			"",
		]

		if self.map.coverage_stats:
			stats = self.map.coverage_stats
			lines.extend([
				"## Coverage",
				"",
				f"- **Logged:** {stats['logged']:,} / {stats['total']:,} ({stats['coverage_pct']:.1f}%)",
				f"- **Code:** {stats['code']:,} bytes",
				f"- **Data:** {stats['data']:,} bytes",
				"",
			])

		lines.extend([
			"## Regions",
			"",
			"| Region | Offset | Size | Type | Coverage |",
			"|--------|--------|------|------|----------|",
		])

		for region in self.map.regions:
			size = region.end - region.start + 1
			lines.append(
				f"| {region.name} | 0x{region.start:06X} | {size:,} | {region.type} | {region.coverage:.1f}% |"
			)

		lines.append("")

		# Detailed regions
		for region in self.map.regions:
			lines.extend([
				f"### {region.name}",
				"",
				f"- **Offset:** 0x{region.start:06X} - 0x{region.end:06X}",
				f"- **Size:** {region.end - region.start + 1:,} bytes",
				f"- **Type:** {region.type}",
				f"- **Coverage:** {region.coverage:.1f}%",
				"",
			])

			if region.labels:
				lines.append("**Labels:**")
				for label in region.labels[:20]:
					lines.append(f"- {label}")
				if len(region.labels) > 20:
					lines.append(f"- ... and {len(region.labels) - 20} more")
				lines.append("")

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines))

	def generate_json(self, filepath: str):
		"""Generate JSON memory map"""
		data = {
			'rom': os.path.basename(self.rom_path),
			'total_size': self.map.total_size,
			'header_size': self.map.header_size,
			'coverage': self.map.coverage_stats,
			'regions': [
				{
					'name': r.name,
					'start': f"0x{r.start:06X}",
					'end': f"0x{r.end:06X}",
					'size': r.end - r.start + 1,
					'type': r.type,
					'bank': r.bank if r.bank >= 0 else None,
					'coverage': r.coverage,
					'label_count': len(r.labels),
				}
				for r in self.map.regions
			]
		}

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(data, f, indent='\t')

	def generate_wikitext(self, filepath: str):
		"""Generate wikitext memory map"""
		lines = [
			f"== Memory Map - {os.path.basename(self.rom_path)} ==",
			"",
			"=== Overview ===",
			f"* Size: {self.map.total_size:,} bytes",
			f"* Header: {self.map.header_size} bytes",
			"",
			"=== Regions ===",
			'{| class="wikitable sortable"',
			"|-",
			"! Region !! Offset !! Size !! Type !! Coverage",
		]

		for region in self.map.regions:
			size = region.end - region.start + 1
			lines.extend([
				"|-",
				f"| {region.name} || 0x{region.start:06X} || {size:,} || {region.type} || {region.coverage:.1f}%"
			])

		lines.append("|}")
		lines.append("")

		with open(filepath, 'w', encoding='utf-8', newline='\n') as f:
			f.write('\n'.join(lines))


def main():
	parser = argparse.ArgumentParser(
		description='Memory Map Generator',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Generate command
	gen_parser = subparsers.add_parser('generate', help='Generate memory map')
	gen_parser.add_argument('rom', help='ROM file')
	gen_parser.add_argument('--cdl', '-c', help='CDL file for coverage')
	gen_parser.add_argument('--labels', '-l', help='Label file (MLB)')
	gen_parser.add_argument('--output', '-o', required=True, help='Output file')
	gen_parser.add_argument('--format', '-f', default='html',
						   choices=['html', 'md', 'json', 'wikitext'],
						   help='Output format')

	# Document command
	doc_parser = subparsers.add_parser('document', help='Generate documentation')
	doc_parser.add_argument('rom', help='ROM file')
	doc_parser.add_argument('--output', '-o', help='Output file')
	doc_parser.add_argument('--format', '-f', default='md',
						   choices=['html', 'md', 'json', 'wikitext'],
						   help='Output format')

	args = parser.parse_args()

	if args.command == 'generate':
		generator = MemoryMapGenerator(args.rom)

		if args.cdl:
			generator.add_cdl(args.cdl)
			print(f"Loaded CDL: {args.cdl}")

		if args.labels:
			generator.add_labels(args.labels)
			print(f"Loaded labels: {args.labels}")

		if args.format == 'html':
			generator.generate_html(args.output)
		elif args.format == 'md':
			generator.generate_markdown(args.output)
		elif args.format == 'json':
			generator.generate_json(args.output)
		elif args.format == 'wikitext':
			generator.generate_wikitext(args.output)

		print(f"Generated: {args.output}")

	elif args.command == 'document':
		generator = MemoryMapGenerator(args.rom)

		output = args.output or f"{os.path.splitext(args.rom)[0]}_map.{args.format}"

		if args.format == 'html':
			generator.generate_html(output)
		elif args.format == 'md':
			generator.generate_markdown(output)
		elif args.format == 'json':
			generator.generate_json(output)
		elif args.format == 'wikitext':
			generator.generate_wikitext(output)

		print(f"Generated: {output}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
