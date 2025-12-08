#!/usr/bin/env python3
"""
CDL Build System

A build process for managing, merging, and validating CDL files across
multiple game projects.

Features:
- Merge multiple CDL files from different sessions
- Validate CDL files against ROM sizes
- Generate coverage reports
- Create differential CDL files (what's new between versions)
- Build combined CDL files from multiple sources

Usage:
	python cdl_build.py build <config.json>
	python cdl_build.py merge <output.cdl> <input1.cdl> [input2.cdl ...]
	python cdl_build.py diff <old.cdl> <new.cdl> [--output diff.cdl]
	python cdl_build.py validate <cdl_file> --rom <rom_file>
	python cdl_build.py report <cdl_file> [--output report.html]
"""

import argparse
import hashlib
import json
import os
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# Import from cdl_editor if available
try:
	from cdl_editor import CDLFile, CDLStats
except ImportError:
	# Standalone implementation
	@dataclass
	class CDLStats:
		total_bytes: int
		code_bytes: int
		data_bytes: int
		rendered_bytes: int
		unused_bytes: int
		mixed_bytes: int

		@property
		def code_percent(self) -> float:
			return (self.code_bytes / self.total_bytes * 100) if self.total_bytes > 0 else 0

		@property
		def data_percent(self) -> float:
			return (self.data_bytes / self.total_bytes * 100) if self.total_bytes > 0 else 0

		@property
		def coverage_percent(self) -> float:
			used = self.total_bytes - self.unused_bytes
			return (used / self.total_bytes * 100) if self.total_bytes > 0 else 0

	class CDLFile:
		def __init__(self, filepath: Optional[str] = None):
			self.filepath = filepath
			self.data: bytearray = bytearray()
			if filepath:
				self.load(filepath)

		def load(self, filepath: str) -> None:
			self.filepath = filepath
			with open(filepath, 'rb') as f:
				self.data = bytearray(f.read())

		def save(self, filepath: Optional[str] = None) -> None:
			filepath = filepath or self.filepath
			with open(filepath, 'wb') as f:
				f.write(self.data)

		def get_stats(self) -> CDLStats:
			total = len(self.data)
			code = data = rendered = unused = mixed = 0
			for byte in self.data:
				is_code = bool(byte & 0x01)
				is_data = bool(byte & 0x02)
				is_rendered = bool(byte & 0x04)
				if byte == 0:
					unused += 1
				elif is_code and is_data:
					mixed += 1
				elif is_code:
					code += 1
				elif is_data:
					data += 1
				elif is_rendered:
					rendered += 1
			return CDLStats(total, code, data, rendered, unused, mixed)

		def merge(self, other: 'CDLFile') -> None:
			if len(self.data) != len(other.data):
				raise ValueError(f"Size mismatch: {len(self.data)} vs {len(other.data)}")
			for i in range(len(self.data)):
				self.data[i] |= other.data[i]

		def __len__(self) -> int:
			return len(self.data)


@dataclass
class BuildConfig:
	"""Configuration for a CDL build"""
	name: str
	output_dir: str
	sources: List[Dict]  # List of CDL source files
	rom_file: Optional[str] = None
	expected_size: Optional[int] = None
	generate_report: bool = True
	backup_existing: bool = True


@dataclass
class BuildResult:
	"""Result of a build operation"""
	success: bool
	output_file: Optional[str] = None
	stats: Optional[CDLStats] = None
	errors: List[str] = field(default_factory=list)
	warnings: List[str] = field(default_factory=list)
	merged_count: int = 0


class CDLBuilder:
	"""Build system for CDL files"""

	def __init__(self, config: Optional[BuildConfig] = None):
		self.config = config
		self.verbose = True

	def log(self, message: str) -> None:
		"""Log a message if verbose mode is on"""
		if self.verbose:
			print(f"[CDL Build] {message}")

	def merge_files(self, output_path: str, input_paths: List[str]) -> BuildResult:
		"""Merge multiple CDL files into one"""
		result = BuildResult(success=False)

		if not input_paths:
			result.errors.append("No input files specified")
			return result

		# Load first file as base
		try:
			self.log(f"Loading base: {input_paths[0]}")
			base_cdl = CDLFile(input_paths[0])
			result.merged_count = 1
		except Exception as e:
			result.errors.append(f"Failed to load {input_paths[0]}: {e}")
			return result

		# Merge remaining files
		for path in input_paths[1:]:
			try:
				self.log(f"Merging: {path}")
				other_cdl = CDLFile(path)
				base_cdl.merge(other_cdl)
				result.merged_count += 1
			except Exception as e:
				result.warnings.append(f"Failed to merge {path}: {e}")

		# Save output
		try:
			os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
			base_cdl.save(output_path)
			result.output_file = output_path
			result.stats = base_cdl.get_stats()
			result.success = True
			self.log(f"Saved merged CDL to: {output_path}")
		except Exception as e:
			result.errors.append(f"Failed to save {output_path}: {e}")

		return result

	def create_diff(self, old_path: str, new_path: str, 
					output_path: Optional[str] = None) -> Tuple[BuildResult, bytearray]:
		"""Create a differential CDL showing what's new in the newer file"""
		result = BuildResult(success=False)
		diff_data = bytearray()

		try:
			old_cdl = CDLFile(old_path)
			new_cdl = CDLFile(new_path)

			if len(old_cdl) != len(new_cdl):
				result.errors.append(f"Size mismatch: {len(old_cdl)} vs {len(new_cdl)}")
				return result, diff_data

			# Create diff: bytes that are set in new but not in old
			diff_data = bytearray(len(new_cdl))
			new_bytes = 0

			for i in range(len(new_cdl.data)):
				# Find bits that are new (set in new, not set in old)
				new_bits = new_cdl.data[i] & ~old_cdl.data[i]
				diff_data[i] = new_bits
				if new_bits:
					new_bytes += 1

			self.log(f"Found {new_bytes} bytes with new data")

			if output_path:
				os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
				with open(output_path, 'wb') as f:
					f.write(diff_data)
				result.output_file = output_path
				self.log(f"Saved diff to: {output_path}")

			result.success = True

		except Exception as e:
			result.errors.append(f"Diff failed: {e}")

		return result, diff_data

	def validate(self, cdl_path: str, rom_path: Optional[str] = None,
				 expected_size: Optional[int] = None) -> BuildResult:
		"""Validate a CDL file"""
		result = BuildResult(success=True)

		try:
			cdl = CDLFile(cdl_path)
			result.stats = cdl.get_stats()

			# Check size against ROM if provided
			if rom_path:
				rom_size = os.path.getsize(rom_path)
				# Account for iNES header (16 bytes)
				expected = rom_size - 16
				if len(cdl) != expected:
					result.warnings.append(
						f"CDL size ({len(cdl)}) doesn't match ROM PRG size ({expected})"
					)

			# Check against expected size
			if expected_size and len(cdl) != expected_size:
				result.warnings.append(
					f"CDL size ({len(cdl)}) doesn't match expected ({expected_size})"
				)

			# Check for suspicious patterns
			if result.stats.unused_bytes == result.stats.total_bytes:
				result.warnings.append("CDL file is completely empty (no logged data)")

			if result.stats.mixed_bytes > result.stats.total_bytes * 0.1:
				result.warnings.append(
					f"High number of mixed code/data bytes ({result.stats.mixed_bytes})"
				)

			self.log(f"Validation complete: {len(result.warnings)} warnings")

		except Exception as e:
			result.success = False
			result.errors.append(f"Validation failed: {e}")

		return result

	def generate_report(self, cdl_path: str, output_path: str,
						rom_name: Optional[str] = None) -> BuildResult:
		"""Generate an HTML coverage report"""
		result = BuildResult(success=False)

		try:
			cdl = CDLFile(cdl_path)
			stats = cdl.get_stats()

			# Calculate bank stats (16KB banks)
			bank_size = 0x4000
			num_banks = (len(cdl) + bank_size - 1) // bank_size
			bank_stats = []

			for bank in range(num_banks):
				start = bank * bank_size
				end = min(start + bank_size, len(cdl))

				code = data = rendered = unused = 0
				for i in range(start, end):
					byte = cdl.data[i]
					if byte == 0:
						unused += 1
					elif byte & 0x01:
						code += 1
					elif byte & 0x02:
						data += 1
					elif byte & 0x04:
						rendered += 1

				total = end - start
				bank_stats.append({
					'bank': bank,
					'code': code,
					'data': data,
					'rendered': rendered,
					'unused': unused,
					'total': total,
					'coverage': (total - unused) / total * 100 if total > 0 else 0
				})

			# Generate HTML report
			html = self._generate_html_report(
				cdl_path=cdl_path,
				rom_name=rom_name or os.path.basename(cdl_path),
				stats=stats,
				bank_stats=bank_stats,
				file_size=len(cdl)
			)

			os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
			with open(output_path, 'w') as f:
				f.write(html)

			result.output_file = output_path
			result.stats = stats
			result.success = True
			self.log(f"Report generated: {output_path}")

		except Exception as e:
			result.errors.append(f"Report generation failed: {e}")

		return result

	def _generate_html_report(self, cdl_path: str, rom_name: str,
							  stats: CDLStats, bank_stats: List[Dict],
							  file_size: int) -> str:
		"""Generate HTML report content"""

		# Generate bank rows
		bank_rows = ""
		for bs in bank_stats:
			coverage_class = "high" if bs['coverage'] >= 75 else "medium" if bs['coverage'] >= 50 else "low"
			bank_rows += f"""
			<tr>
				<td>{bs['bank']}</td>
				<td>${bs['bank'] * 0x4000:06X}</td>
				<td>{bs['code']:,}</td>
				<td>{bs['data']:,}</td>
				<td>{bs['rendered']:,}</td>
				<td>{bs['unused']:,}</td>
				<td class="{coverage_class}">{bs['coverage']:.1f}%</td>
			</tr>"""

		html = f"""<!DOCTYPE html>
<html>
<head>
	<title>CDL Coverage Report - {rom_name}</title>
	<style>
		body {{
			font-family: 'Segoe UI', Arial, sans-serif;
			margin: 20px;
			background: #f5f5f5;
		}}
		.container {{
			max-width: 1200px;
			margin: 0 auto;
			background: white;
			padding: 20px;
			border-radius: 8px;
			box-shadow: 0 2px 4px rgba(0,0,0,0.1);
		}}
		h1 {{
			color: #333;
			border-bottom: 2px solid #4CAF50;
			padding-bottom: 10px;
		}}
		h2 {{
			color: #666;
			margin-top: 30px;
		}}
		.summary {{
			display: grid;
			grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
			gap: 20px;
			margin: 20px 0;
		}}
		.stat-card {{
			background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
			color: white;
			padding: 20px;
			border-radius: 8px;
			text-align: center;
		}}
		.stat-card.code {{
			background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
		}}
		.stat-card.data {{
			background: linear-gradient(135deg, #fc4a1a 0%, #f7b733 100%);
		}}
		.stat-card.unused {{
			background: linear-gradient(135deg, #834d9b 0%, #d04ed6 100%);
		}}
		.stat-value {{
			font-size: 2em;
			font-weight: bold;
		}}
		.stat-label {{
			font-size: 0.9em;
			opacity: 0.9;
		}}
		table {{
			width: 100%;
			border-collapse: collapse;
			margin: 20px 0;
		}}
		th, td {{
			padding: 12px;
			text-align: left;
			border-bottom: 1px solid #ddd;
		}}
		th {{
			background: #4CAF50;
			color: white;
		}}
		tr:hover {{
			background: #f5f5f5;
		}}
		.high {{ color: #4CAF50; font-weight: bold; }}
		.medium {{ color: #FF9800; font-weight: bold; }}
		.low {{ color: #f44336; font-weight: bold; }}
		.progress-bar {{
			width: 100%;
			height: 30px;
			background: #ddd;
			border-radius: 4px;
			overflow: hidden;
			margin: 10px 0;
		}}
		.progress-code {{
			height: 100%;
			background: #4CAF50;
			float: left;
		}}
		.progress-data {{
			height: 100%;
			background: #FF9800;
			float: left;
		}}
		.progress-rendered {{
			height: 100%;
			background: #2196F3;
			float: left;
		}}
		.legend {{
			display: flex;
			gap: 20px;
			margin: 10px 0;
		}}
		.legend-item {{
			display: flex;
			align-items: center;
			gap: 5px;
		}}
		.legend-color {{
			width: 20px;
			height: 20px;
			border-radius: 4px;
		}}
		.meta {{
			color: #666;
			font-size: 0.9em;
			margin-bottom: 20px;
		}}
	</style>
</head>
<body>
	<div class="container">
		<h1>CDL Coverage Report</h1>

		<div class="meta">
			<strong>ROM:</strong> {rom_name}<br>
			<strong>CDL File:</strong> {os.path.basename(cdl_path)}<br>
			<strong>File Size:</strong> {file_size:,} bytes ({file_size // 1024} KB)<br>
			<strong>Generated:</strong> {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}
		</div>

		<h2>Overall Coverage</h2>

		<div class="progress-bar">
			<div class="progress-code" style="width: {stats.code_percent}%"></div>
			<div class="progress-data" style="width: {stats.data_percent}%"></div>
			<div class="progress-rendered" style="width: {(stats.rendered_bytes / stats.total_bytes * 100) if stats.total_bytes > 0 else 0}%"></div>
		</div>

		<div class="legend">
			<div class="legend-item">
				<div class="legend-color" style="background: #4CAF50;"></div>
				<span>Code ({stats.code_percent:.1f}%)</span>
			</div>
			<div class="legend-item">
				<div class="legend-color" style="background: #FF9800;"></div>
				<span>Data ({stats.data_percent:.1f}%)</span>
			</div>
			<div class="legend-item">
				<div class="legend-color" style="background: #2196F3;"></div>
				<span>Rendered ({(stats.rendered_bytes / stats.total_bytes * 100) if stats.total_bytes > 0 else 0:.1f}%)</span>
			</div>
			<div class="legend-item">
				<div class="legend-color" style="background: #9E9E9E;"></div>
				<span>Unused ({(stats.unused_bytes / stats.total_bytes * 100) if stats.total_bytes > 0 else 0:.1f}%)</span>
			</div>
		</div>

		<div class="summary">
			<div class="stat-card">
				<div class="stat-value">{stats.coverage_percent:.1f}%</div>
				<div class="stat-label">Total Coverage</div>
			</div>
			<div class="stat-card code">
				<div class="stat-value">{stats.code_bytes:,}</div>
				<div class="stat-label">Code Bytes</div>
			</div>
			<div class="stat-card data">
				<div class="stat-value">{stats.data_bytes:,}</div>
				<div class="stat-label">Data Bytes</div>
			</div>
			<div class="stat-card unused">
				<div class="stat-value">{stats.unused_bytes:,}</div>
				<div class="stat-label">Unused Bytes</div>
			</div>
		</div>

		<h2>Bank Statistics</h2>

		<table>
			<thead>
				<tr>
					<th>Bank</th>
					<th>Offset</th>
					<th>Code</th>
					<th>Data</th>
					<th>Rendered</th>
					<th>Unused</th>
					<th>Coverage</th>
				</tr>
			</thead>
			<tbody>
				{bank_rows}
			</tbody>
		</table>

		<h2>Summary</h2>
		<table>
			<tr><td>Total Bytes</td><td>{stats.total_bytes:,}</td></tr>
			<tr><td>Code Bytes</td><td>{stats.code_bytes:,} ({stats.code_percent:.2f}%)</td></tr>
			<tr><td>Data Bytes</td><td>{stats.data_bytes:,} ({stats.data_percent:.2f}%)</td></tr>
			<tr><td>Rendered Bytes</td><td>{stats.rendered_bytes:,}</td></tr>
			<tr><td>Mixed (Code+Data)</td><td>{stats.mixed_bytes:,}</td></tr>
			<tr><td>Unused Bytes</td><td>{stats.unused_bytes:,}</td></tr>
			<tr><td><strong>Total Coverage</strong></td><td><strong>{stats.coverage_percent:.2f}%</strong></td></tr>
		</table>
	</div>
</body>
</html>"""

		return html

	def build_from_config(self, config_path: str) -> BuildResult:
		"""Build CDL from a configuration file"""
		result = BuildResult(success=False)

		try:
			with open(config_path) as f:
				config_data = json.load(f)

			config = BuildConfig(
				name=config_data.get('name', 'CDL Build'),
				output_dir=config_data.get('output_dir', 'build'),
				sources=config_data.get('sources', []),
				rom_file=config_data.get('rom_file'),
				expected_size=config_data.get('expected_size'),
				generate_report=config_data.get('generate_report', True),
				backup_existing=config_data.get('backup_existing', True)
			)

			self.config = config
			self.log(f"Building: {config.name}")

			# Collect source files
			source_files = []
			for source in config.sources:
				if isinstance(source, str):
					source_files.append(source)
				elif isinstance(source, dict):
					path = source.get('path')
					if path:
						# Support glob patterns
						if '*' in path:
							import glob
							source_files.extend(glob.glob(path))
						else:
							source_files.append(path)

			if not source_files:
				result.errors.append("No source files found")
				return result

			self.log(f"Found {len(source_files)} source files")

			# Create output directory
			os.makedirs(config.output_dir, exist_ok=True)

			# Backup existing output if needed
			output_cdl = os.path.join(config.output_dir, f"{config.name}.cdl")
			if config.backup_existing and os.path.exists(output_cdl):
				backup_path = output_cdl + f".backup.{datetime.now().strftime('%Y%m%d_%H%M%S')}"
				os.rename(output_cdl, backup_path)
				self.log(f"Backed up existing to: {backup_path}")

			# Merge all sources
			result = self.merge_files(output_cdl, source_files)

			if not result.success:
				return result

			# Validate
			validation = self.validate(output_cdl, config.rom_file, config.expected_size)
			result.warnings.extend(validation.warnings)

			# Generate report
			if config.generate_report:
				report_path = os.path.join(config.output_dir, f"{config.name}_report.html")
				self.generate_report(output_cdl, report_path, config.name)

			self.log(f"Build complete: {output_cdl}")

		except Exception as e:
			result.errors.append(f"Build failed: {e}")

		return result


def main():
	parser = argparse.ArgumentParser(
		description='CDL Build System',
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s merge output.cdl session1.cdl session2.cdl session3.cdl
  %(prog)s diff old.cdl new.cdl --output changes.cdl
  %(prog)s validate game.cdl --rom game.nes
  %(prog)s report game.cdl --output report.html
  %(prog)s build config.json
		"""
	)

	subparsers = parser.add_subparsers(dest='command', help='Command to run')

	# Merge command
	merge_parser = subparsers.add_parser('merge', help='Merge multiple CDL files')
	merge_parser.add_argument('output', help='Output CDL file')
	merge_parser.add_argument('inputs', nargs='+', help='Input CDL files to merge')

	# Diff command
	diff_parser = subparsers.add_parser('diff', help='Create differential CDL')
	diff_parser.add_argument('old', help='Old CDL file')
	diff_parser.add_argument('new', help='New CDL file')
	diff_parser.add_argument('--output', '-o', help='Output diff file')

	# Validate command
	validate_parser = subparsers.add_parser('validate', help='Validate CDL file')
	validate_parser.add_argument('cdl_file', help='CDL file to validate')
	validate_parser.add_argument('--rom', help='ROM file to validate against')
	validate_parser.add_argument('--size', type=int, help='Expected CDL size')

	# Report command
	report_parser = subparsers.add_parser('report', help='Generate coverage report')
	report_parser.add_argument('cdl_file', help='CDL file')
	report_parser.add_argument('--output', '-o', default='report.html', help='Output HTML file')
	report_parser.add_argument('--name', help='ROM/project name')

	# Build command
	build_parser = subparsers.add_parser('build', help='Build from config file')
	build_parser.add_argument('config', help='Build configuration JSON file')

	args = parser.parse_args()

	builder = CDLBuilder()

	if args.command == 'merge':
		result = builder.merge_files(args.output, args.inputs)
		if result.success:
			print(f"Successfully merged {result.merged_count} files")
			print(f"Output: {result.output_file}")
			if result.stats:
				print(f"Coverage: {result.stats.coverage_percent:.1f}%")
		else:
			print("Merge failed:")
			for error in result.errors:
				print(f"  - {error}")
			sys.exit(1)

	elif args.command == 'diff':
		result, diff_data = builder.create_diff(args.old, args.new, args.output)
		if result.success:
			new_bytes = sum(1 for b in diff_data if b)
			print(f"Diff created: {new_bytes} bytes with new data")
			if result.output_file:
				print(f"Output: {result.output_file}")
		else:
			print("Diff failed:")
			for error in result.errors:
				print(f"  - {error}")
			sys.exit(1)

	elif args.command == 'validate':
		result = builder.validate(args.cdl_file, args.rom, args.size)
		if result.success:
			print("Validation passed")
			if result.stats:
				print(f"Coverage: {result.stats.coverage_percent:.1f}%")
		if result.warnings:
			print("Warnings:")
			for warning in result.warnings:
				print(f"  - {warning}")
		if result.errors:
			print("Errors:")
			for error in result.errors:
				print(f"  - {error}")
			sys.exit(1)

	elif args.command == 'report':
		result = builder.generate_report(args.cdl_file, args.output, args.name)
		if result.success:
			print(f"Report generated: {result.output_file}")
			if result.stats:
				print(f"Coverage: {result.stats.coverage_percent:.1f}%")
		else:
			print("Report generation failed:")
			for error in result.errors:
				print(f"  - {error}")
			sys.exit(1)

	elif args.command == 'build':
		result = builder.build_from_config(args.config)
		if result.success:
			print(f"Build successful: {result.output_file}")
			print(f"Merged {result.merged_count} files")
			if result.stats:
				print(f"Coverage: {result.stats.coverage_percent:.1f}%")
		else:
			print("Build failed:")
			for error in result.errors:
				print(f"  - {error}")
			sys.exit(1)

		if result.warnings:
			print("Warnings:")
			for warning in result.warnings:
				print(f"  - {warning}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
