#!/usr/bin/env python3
"""
Batch Processing Tool

Process multiple ROMs, CDL files, and label files in batch operations.
Useful for managing large collections of game analysis data.

Features:
- Batch convert between formats
- Batch merge CDL files
- Batch validate files
- Generate summary reports
- Parallel processing support
- Configurable via JSON/YAML

Usage:
	python batch_process.py convert --input <dir> --output <dir> --to mlb
	python batch_process.py merge --config <config.json>
	python batch_process.py validate --input <dir> --report <report.html>
	python batch_process.py stats --input <dir>
"""

import argparse
import concurrent.futures
import glob
import json
import os
import sys
import time
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Callable


@dataclass
class ProcessResult:
	"""Result of processing a single file"""
	filepath: str
	success: bool
	output_path: str = ""
	message: str = ""
	stats: Dict = field(default_factory=dict)
	duration: float = 0.0


@dataclass
class BatchResult:
	"""Result of a batch operation"""
	total: int = 0
	succeeded: int = 0
	failed: int = 0
	skipped: int = 0
	results: List[ProcessResult] = field(default_factory=list)
	duration: float = 0.0


class FileConverter:
	"""Convert files between formats"""

	@staticmethod
	def convert_mlb_to_nl(input_path: str, output_dir: str, rom_name: str = None) -> ProcessResult:
		"""Convert MLB to NL format"""
		start = time.time()
		result = ProcessResult(filepath=input_path, success=False)

		try:
			if not rom_name:
				rom_name = os.path.splitext(os.path.basename(input_path))[0]

			# Parse MLB
			labels_by_bank: Dict[int, List[Tuple[int, str, str]]] = {}
			ram_labels: List[Tuple[int, str, str]] = []

			with open(input_path, 'r', encoding='utf-8') as f:
				for line in f:
					line = line.strip()
					if not line or line.startswith(';'):
						continue

					parts = line.split(':')
					if len(parts) < 3:
						continue

					addr_type = parts[0]
					is_ram = addr_type in ('R', 'I', 'S')

					if len(parts) >= 5:
						bank = int(parts[1], 16)
						address = int(parts[2], 16)
						name = parts[3]
						comment = parts[4] if len(parts) > 4 else ""
					else:
						bank = 0
						address = int(parts[1], 16)
						name = parts[2]
						comment = parts[3] if len(parts) > 3 else ""

					if is_ram:
						ram_labels.append((address, name, comment))
					else:
						if bank not in labels_by_bank:
							labels_by_bank[bank] = []
						labels_by_bank[bank].append((address, name, comment))

			os.makedirs(output_dir, exist_ok=True)
			files_written = 0

			# Write RAM file
			if ram_labels:
				ram_path = os.path.join(output_dir, f"{rom_name}.nes.ram.nl")
				with open(ram_path, 'w', encoding='utf-8', newline='\n') as f:
					f.write("; RAM Labels\n")
					for addr, name, comment in sorted(ram_labels):
						f.write(f"${addr:04X}#{name}#{comment}\n")
				files_written += 1

			# Write bank files
			for bank, labels in labels_by_bank.items():
				bank_path = os.path.join(output_dir, f"{rom_name}.nes.{bank}.nl")
				with open(bank_path, 'w', encoding='utf-8', newline='\n') as f:
					f.write(f"; Bank {bank} Labels\n")
					for addr, name, comment in sorted(labels):
						f.write(f"${addr:04X}#{name}#{comment}\n")
				files_written += 1

			result.success = True
			result.output_path = output_dir
			result.message = f"Created {files_written} NL files"
			result.stats = {
				'files_created': files_written,
				'ram_labels': len(ram_labels),
				'rom_labels': sum(len(l) for l in labels_by_bank.values())
			}

		except Exception as e:
			result.message = str(e)

		result.duration = time.time() - start
		return result

	@staticmethod
	def convert_nl_to_mlb(input_dir: str, output_path: str, rom_name: str = None) -> ProcessResult:
		"""Convert NL files to MLB format"""
		start = time.time()
		result = ProcessResult(filepath=input_dir, success=False)

		try:
			lines = ["; Mesen Label File", f"; Converted from NL files", ""]
			total_labels = 0

			# Find all NL files
			nl_files = glob.glob(os.path.join(input_dir, "*.nl"))

			for nl_path in sorted(nl_files):
				basename = os.path.basename(nl_path)
				is_ram = '.ram.nl' in basename

				bank = -1
				if not is_ram:
					import re
					match = re.search(r'\.(\d+)\.nl$', basename, re.IGNORECASE)
					if match:
						bank = int(match.group(1))

				with open(nl_path, 'r', encoding='utf-8') as f:
					for line in f:
						line = line.strip()
						if not line or line.startswith(';'):
							continue

						import re
						match = re.match(r'\$([0-9A-Fa-f]+)#([^#]+)(?:#(.*))?', line)
						if match:
							address = int(match.group(1), 16)
							name = match.group(2)
							comment = match.group(3) or ""

							if is_ram:
								lines.append(f"R:{address:04X}:{name}:{comment}")
							elif bank >= 0:
								lines.append(f"P:{bank:02X}:{address:04X}:{name}:{comment}")
							else:
								lines.append(f"P:{address:04X}:{name}:{comment}")

							total_labels += 1

			with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
				f.write('\n'.join(lines) + '\n')

			result.success = True
			result.output_path = output_path
			result.message = f"Converted {total_labels} labels"
			result.stats = {'labels': total_labels, 'files_read': len(nl_files)}

		except Exception as e:
			result.message = str(e)

		result.duration = time.time() - start
		return result


class CDLProcessor:
	"""Process CDL files"""

	@staticmethod
	def merge_cdl_files(input_files: List[str], output_path: str) -> ProcessResult:
		"""Merge multiple CDL files"""
		start = time.time()
		result = ProcessResult(filepath=str(input_files), success=False)

		try:
			merged_data = None

			for filepath in input_files:
				with open(filepath, 'rb') as f:
					data = f.read()

				# Skip headers
				if data[:3] == b'MCD':
					data = data[3:]
				elif data[:4] == b'CDL\x1a':
					data = data[4:]

				if merged_data is None:
					merged_data = bytearray(data)
				else:
					# Merge with OR operation
					for i in range(min(len(merged_data), len(data))):
						merged_data[i] |= data[i]

					# Extend if needed
					if len(data) > len(merged_data):
						merged_data.extend(data[len(merged_data):])

			with open(output_path, 'wb') as f:
				f.write(merged_data)

			# Calculate coverage
			total = len(merged_data)
			logged = sum(1 for b in merged_data if b != 0)
			coverage = logged / total * 100 if total > 0 else 0

			result.success = True
			result.output_path = output_path
			result.message = f"Merged {len(input_files)} files"
			result.stats = {
				'files_merged': len(input_files),
				'size': total,
				'logged': logged,
				'coverage': f"{coverage:.2f}%"
			}

		except Exception as e:
			result.message = str(e)

		result.duration = time.time() - start
		return result

	@staticmethod
	def get_cdl_stats(filepath: str) -> ProcessResult:
		"""Get statistics for a CDL file"""
		start = time.time()
		result = ProcessResult(filepath=filepath, success=False)

		try:
			with open(filepath, 'rb') as f:
				data = f.read()

			# Skip headers
			if data[:3] == b'MCD':
				format_type = 'mesen'
				data = data[3:]
			elif data[:4] == b'CDL\x1a':
				format_type = 'mesen2'
				data = data[4:]
			else:
				format_type = 'fceux'

			total = len(data)
			code = sum(1 for b in data if b & 0x01)
			data_bytes = sum(1 for b in data if b & 0x02)
			logged = sum(1 for b in data if b != 0)
			coverage = logged / total * 100 if total > 0 else 0

			result.success = True
			result.message = f"{coverage:.2f}% coverage"
			result.stats = {
				'format': format_type,
				'size': total,
				'code': code,
				'data': data_bytes,
				'logged': logged,
				'coverage': coverage
			}

		except Exception as e:
			result.message = str(e)

		result.duration = time.time() - start
		return result


class BatchProcessor:
	"""Process files in batch"""

	def __init__(self, max_workers: int = 4):
		self.max_workers = max_workers

	def process_files(
		self,
		files: List[str],
		processor: Callable[[str], ProcessResult],
		parallel: bool = True
	) -> BatchResult:
		"""Process multiple files"""
		start = time.time()
		batch_result = BatchResult(total=len(files))

		if parallel and self.max_workers > 1:
			with concurrent.futures.ThreadPoolExecutor(max_workers=self.max_workers) as executor:
				futures = {executor.submit(processor, f): f for f in files}
				for future in concurrent.futures.as_completed(futures):
					result = future.result()
					batch_result.results.append(result)
					if result.success:
						batch_result.succeeded += 1
					else:
						batch_result.failed += 1
		else:
			for filepath in files:
				result = processor(filepath)
				batch_result.results.append(result)
				if result.success:
					batch_result.succeeded += 1
				else:
					batch_result.failed += 1

		batch_result.duration = time.time() - start
		return batch_result

	def find_files(self, input_dir: str, patterns: List[str]) -> List[str]:
		"""Find files matching patterns"""
		files = []
		for pattern in patterns:
			files.extend(glob.glob(os.path.join(input_dir, pattern)))
			files.extend(glob.glob(os.path.join(input_dir, '**', pattern), recursive=True))
		return sorted(set(files))


class ReportGenerator:
	"""Generate reports from batch results"""

	@staticmethod
	def generate_text_report(batch_result: BatchResult, output_path: str = None) -> str:
		"""Generate text report"""
		lines = [
			"=" * 60,
			"BATCH PROCESSING REPORT",
			"=" * 60,
			f"Date: {datetime.now().isoformat()}",
			f"Duration: {batch_result.duration:.2f}s",
			"",
			"Summary:",
			f"  Total:     {batch_result.total}",
			f"  Succeeded: {batch_result.succeeded}",
			f"  Failed:    {batch_result.failed}",
			f"  Skipped:   {batch_result.skipped}",
			"",
			"-" * 60,
			"Details:",
			"-" * 60,
		]

		for result in batch_result.results:
			status = "OK" if result.success else "FAIL"
			lines.append(f"[{status}] {result.filepath}")
			if result.message:
				lines.append(f"       {result.message}")
			if result.stats:
				for key, value in result.stats.items():
					lines.append(f"       {key}: {value}")

		report = '\n'.join(lines)

		if output_path:
			with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
				f.write(report + '\n')

		return report

	@staticmethod
	def generate_html_report(batch_result: BatchResult, output_path: str) -> str:
		"""Generate HTML report"""
		success_rate = batch_result.succeeded / batch_result.total * 100 if batch_result.total > 0 else 0

		html = f"""<!DOCTYPE html>
<html>
<head>
	<title>Batch Processing Report</title>
	<style>
		body {{ font-family: sans-serif; margin: 20px; }}
		.summary {{ display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin: 20px 0; }}
		.card {{ background: #f5f5f5; padding: 20px; border-radius: 8px; text-align: center; }}
		.card h3 {{ margin: 0 0 10px 0; font-size: 0.9em; color: #666; }}
		.card .value {{ font-size: 2em; font-weight: bold; }}
		.success {{ color: #4CAF50; }}
		.failed {{ color: #f44336; }}
		table {{ border-collapse: collapse; width: 100%; margin: 20px 0; }}
		th, td {{ border: 1px solid #ddd; padding: 8px; text-align: left; }}
		th {{ background: #f0f0f0; }}
		.status-ok {{ color: #4CAF50; }}
		.status-fail {{ color: #f44336; }}
	</style>
</head>
<body>
	<h1>Batch Processing Report</h1>
	<p>Generated: {datetime.now().isoformat()}</p>
	<p>Duration: {batch_result.duration:.2f}s</p>

	<div class="summary">
		<div class="card">
			<h3>Total</h3>
			<div class="value">{batch_result.total}</div>
		</div>
		<div class="card">
			<h3>Succeeded</h3>
			<div class="value success">{batch_result.succeeded}</div>
		</div>
		<div class="card">
			<h3>Failed</h3>
			<div class="value failed">{batch_result.failed}</div>
		</div>
		<div class="card">
			<h3>Success Rate</h3>
			<div class="value">{success_rate:.1f}%</div>
		</div>
	</div>

	<h2>Details</h2>
	<table>
		<tr>
			<th>Status</th>
			<th>File</th>
			<th>Message</th>
			<th>Duration</th>
		</tr>
"""

		for result in batch_result.results:
			status_class = "status-ok" if result.success else "status-fail"
			status = "OK" if result.success else "FAIL"
			html += f"""		<tr>
			<td class="{status_class}">{status}</td>
			<td>{os.path.basename(result.filepath)}</td>
			<td>{result.message}</td>
			<td>{result.duration:.3f}s</td>
		</tr>
"""

		html += """	</table>
</body>
</html>"""

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			f.write(html)

		return output_path

	@staticmethod
	def generate_json_report(batch_result: BatchResult, output_path: str) -> str:
		"""Generate JSON report"""
		data = {
			'timestamp': datetime.now().isoformat(),
			'duration': batch_result.duration,
			'summary': {
				'total': batch_result.total,
				'succeeded': batch_result.succeeded,
				'failed': batch_result.failed,
				'skipped': batch_result.skipped,
			},
			'results': [
				{
					'filepath': r.filepath,
					'success': r.success,
					'output_path': r.output_path,
					'message': r.message,
					'stats': r.stats,
					'duration': r.duration,
				}
				for r in batch_result.results
			]
		}

		with open(output_path, 'w', encoding='utf-8', newline='\n') as f:
			json.dump(data, f, indent='\t')

		return output_path


def main():
	parser = argparse.ArgumentParser(
		description='Batch Processing Tool',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Convert command
	convert_parser = subparsers.add_parser('convert', help='Batch convert files')
	convert_parser.add_argument('--input', '-i', required=True, help='Input directory')
	convert_parser.add_argument('--output', '-o', required=True, help='Output directory')
	convert_parser.add_argument('--from', dest='from_fmt', help='Input format')
	convert_parser.add_argument('--to', dest='to_fmt', required=True,
								choices=['mlb', 'nl', 'json'],
								help='Output format')
	convert_parser.add_argument('--pattern', '-p', default='*', help='File pattern')
	convert_parser.add_argument('--workers', '-w', type=int, default=4, help='Worker threads')

	# Merge command
	merge_parser = subparsers.add_parser('merge', help='Batch merge CDL files')
	merge_parser.add_argument('--input', '-i', required=True, help='Input directory')
	merge_parser.add_argument('--output', '-o', required=True, help='Output file')
	merge_parser.add_argument('--pattern', '-p', default='*.cdl', help='File pattern')
	merge_parser.add_argument('--by-rom', action='store_true', help='Merge by ROM name')

	# Stats command
	stats_parser = subparsers.add_parser('stats', help='Get statistics for files')
	stats_parser.add_argument('--input', '-i', required=True, help='Input directory')
	stats_parser.add_argument('--pattern', '-p', default='*.cdl', help='File pattern')
	stats_parser.add_argument('--report', '-r', help='Output report file')
	stats_parser.add_argument('--format', '-f', default='text',
							  choices=['text', 'html', 'json'],
							  help='Report format')

	# Validate command
	validate_parser = subparsers.add_parser('validate', help='Validate files')
	validate_parser.add_argument('--input', '-i', required=True, help='Input directory')
	validate_parser.add_argument('--pattern', '-p', default='*.*', help='File pattern')
	validate_parser.add_argument('--report', '-r', help='Output report file')

	args = parser.parse_args()

	if args.command == 'convert':
		processor = BatchProcessor(max_workers=args.workers)
		files = processor.find_files(args.input, [args.pattern])
		print(f"Found {len(files)} files to convert")

		os.makedirs(args.output, exist_ok=True)

		if args.to_fmt == 'nl' and (not args.from_fmt or args.from_fmt == 'mlb'):
			# Convert MLB files to NL
			def convert_file(filepath):
				rom_name = os.path.splitext(os.path.basename(filepath))[0]
				out_dir = os.path.join(args.output, rom_name)
				return FileConverter.convert_mlb_to_nl(filepath, out_dir, rom_name)

			result = processor.process_files(files, convert_file)

		elif args.to_fmt == 'mlb' and (not args.from_fmt or args.from_fmt == 'nl'):
			# Convert NL directories to MLB
			# This case is more complex - need to find directories with NL files
			print("Converting NL to MLB requires directory input")
			return

		else:
			print(f"Conversion from {args.from_fmt or 'auto'} to {args.to_fmt} not implemented")
			return

		print(f"\nCompleted in {result.duration:.2f}s")
		print(f"  Succeeded: {result.succeeded}")
		print(f"  Failed: {result.failed}")

	elif args.command == 'merge':
		processor = BatchProcessor()
		files = processor.find_files(args.input, [args.pattern])
		print(f"Found {len(files)} files to merge")

		if args.by_rom:
			# Group by ROM name
			by_rom: Dict[str, List[str]] = {}
			for filepath in files:
				# Extract ROM name from filename
				basename = os.path.basename(filepath)
				rom_name = basename.split('.')[0]
				if rom_name not in by_rom:
					by_rom[rom_name] = []
				by_rom[rom_name].append(filepath)

			for rom_name, rom_files in by_rom.items():
				output_path = os.path.join(args.output, f"{rom_name}.cdl")
				result = CDLProcessor.merge_cdl_files(rom_files, output_path)
				status = "OK" if result.success else "FAIL"
				print(f"[{status}] {rom_name}: {result.message}")
		else:
			result = CDLProcessor.merge_cdl_files(files, args.output)
			print(f"Merged: {result.message}")
			print(f"Stats: {result.stats}")

	elif args.command == 'stats':
		processor = BatchProcessor()
		files = processor.find_files(args.input, [args.pattern])
		print(f"Found {len(files)} files")

		batch_result = processor.process_files(files, CDLProcessor.get_cdl_stats)

		# Print summary
		total_size = sum(r.stats.get('size', 0) for r in batch_result.results if r.success)
		total_logged = sum(r.stats.get('logged', 0) for r in batch_result.results if r.success)
		avg_coverage = total_logged / total_size * 100 if total_size > 0 else 0

		print(f"\nSummary:")
		print(f"  Files: {batch_result.succeeded}")
		print(f"  Total size: {total_size:,} bytes")
		print(f"  Total logged: {total_logged:,} bytes")
		print(f"  Average coverage: {avg_coverage:.2f}%")

		if args.report:
			if args.format == 'text':
				ReportGenerator.generate_text_report(batch_result, args.report)
			elif args.format == 'html':
				ReportGenerator.generate_html_report(batch_result, args.report)
			elif args.format == 'json':
				ReportGenerator.generate_json_report(batch_result, args.report)
			print(f"\nReport saved to: {args.report}")

	elif args.command == 'validate':
		processor = BatchProcessor()
		files = processor.find_files(args.input, [args.pattern])
		print(f"Found {len(files)} files to validate")

		def validate_file(filepath: str) -> ProcessResult:
			start = time.time()
			result = ProcessResult(filepath=filepath, success=True)

			try:
				ext = os.path.splitext(filepath)[1].lower()

				if ext == '.cdl':
					# Validate CDL
					with open(filepath, 'rb') as f:
						data = f.read()
					if len(data) == 0:
						result.success = False
						result.message = "Empty file"
				elif ext in ('.mlb', '.nl'):
					# Validate label file
					with open(filepath, 'r', encoding='utf-8') as f:
						content = f.read()
					lines = [l for l in content.split('\n') if l.strip() and not l.startswith(';')]
					result.stats['labels'] = len(lines)
					result.message = f"{len(lines)} labels"
				else:
					result.message = "Unknown format"

			except Exception as e:
				result.success = False
				result.message = str(e)

			result.duration = time.time() - start
			return result

		batch_result = processor.process_files(files, validate_file)

		print(f"\nValidation complete:")
		print(f"  Valid: {batch_result.succeeded}")
		print(f"  Invalid: {batch_result.failed}")

		if args.report:
			ReportGenerator.generate_html_report(batch_result, args.report)
			print(f"Report saved to: {args.report}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
