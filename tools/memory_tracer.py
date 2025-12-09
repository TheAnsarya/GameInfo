#!/usr/bin/env python3
"""
Memory Tracer - Analyze memory access patterns from emulator traces

Parses execution traces from emulators to identify:
- Memory read/write patterns
- Hot memory locations (frequently accessed)
- Data flow between memory locations
- Temporal access patterns (sequences)
- Memory region usage statistics

Supports trace formats from:
- FCEUX (NES)
- Mesen (NES/SNES)
- bsnes (SNES)
- No$gba (GBA)
- Various logging formats
"""

import argparse
import json
import os
import re
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional


class AccessType(Enum):
	"""Memory access types"""
	READ = "read"
	WRITE = "write"
	EXECUTE = "execute"
	DMA = "dma"


class MemoryRegion(Enum):
	"""Common memory regions"""
	RAM = "ram"
	ROM = "rom"
	VRAM = "vram"
	SRAM = "sram"
	IO = "io"
	WRAM = "wram"
	APU = "apu"
	PPU = "ppu"
	UNKNOWN = "unknown"


@dataclass
class MemoryAccess:
	"""Single memory access event"""
	address: int
	access_type: AccessType
	value: Optional[int] = None
	pc: Optional[int] = None  # Program counter at time of access
	cycle: Optional[int] = None
	bank: Optional[int] = None
	instruction: Optional[str] = None
	timestamp: int = 0


@dataclass
class AccessStats:
	"""Statistics for a memory location"""
	address: int
	read_count: int = 0
	write_count: int = 0
	exec_count: int = 0
	values_written: set = field(default_factory=set)
	values_read: set = field(default_factory=set)
	accessing_pcs: set = field(default_factory=set)
	first_access: int = 0
	last_access: int = 0


@dataclass
class AccessSequence:
	"""Sequence of related memory accesses"""
	addresses: list = field(default_factory=list)
	access_types: list = field(default_factory=list)
	count: int = 0


class TraceParser:
	"""Parse various emulator trace formats"""

	# FCEUX trace format patterns
	FCEUX_PATTERNS = {
		'instruction': r'\$([0-9A-Fa-f]{4}):([0-9A-Fa-f ]+)\s+(\w+)',
		'read': r'@\s*\$([0-9A-Fa-f]{4})\s*=\s*#?\$?([0-9A-Fa-f]{2})',
		'write': r'\$([0-9A-Fa-f]{4})\s*<-\s*#?\$?([0-9A-Fa-f]{2})',
	}

	# Mesen trace format patterns
	MESEN_PATTERNS = {
		'line': r'([0-9A-Fa-f]{4,6})\s+([0-9A-Fa-f ]+)\s+(\w+)\s+(.+)',
		'memory': r'\[([0-9A-Fa-f]{4,6})\]\s*=\s*([0-9A-Fa-f]{2})',
	}

	# Generic patterns
	GENERIC_PATTERNS = {
		'hex_address': r'(?:0x|$)([0-9A-Fa-f]{2,8})',
		'read_access': r'(?:read|rd|r)\s*[@:]?\s*(?:0x|\$)?([0-9A-Fa-f]{2,8})',
		'write_access': r'(?:write|wr|w)\s*[@:]?\s*(?:0x|\$)?([0-9A-Fa-f]{2,8})',
	}

	def __init__(self, format_type: str = 'auto'):
		self.format_type = format_type
		self.line_count = 0

	def detect_format(self, sample_lines: list) -> str:
		"""Auto-detect trace format from sample lines"""
		for line in sample_lines:
			# Check for FCEUX format
			if re.search(r'\$[0-9A-Fa-f]{4}:[0-9A-Fa-f ]+\s+[A-Z]{2,3}', line):
				return 'fceux'
			# Check for Mesen format
			if re.search(r'^[0-9A-Fa-f]{4,6}\s+[0-9A-Fa-f]{2}', line):
				return 'mesen'
			# Check for bsnes format
			if re.search(r'^[0-9a-f]{6}\s+[a-z]{2,4}\s+', line.lower()):
				return 'bsnes'
		return 'generic'

	def parse_file(self, filepath: str, max_lines: int = None) -> list:
		"""Parse a trace file"""
		accesses = []
		self.line_count = 0

		with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
			# Auto-detect format if needed
			if self.format_type == 'auto':
				sample = [f.readline() for _ in range(100)]
				self.format_type = self.detect_format(sample)
				f.seek(0)

			for line in f:
				self.line_count += 1
				if max_lines and self.line_count > max_lines:
					break

				parsed = self._parse_line(line)
				if parsed:
					accesses.extend(parsed)

		return accesses

	def _parse_line(self, line: str) -> list:
		"""Parse a single trace line based on detected format"""
		if self.format_type == 'fceux':
			return self._parse_fceux(line)
		elif self.format_type == 'mesen':
			return self._parse_mesen(line)
		elif self.format_type == 'bsnes':
			return self._parse_bsnes(line)
		else:
			return self._parse_generic(line)

	def _parse_fceux(self, line: str) -> list:
		"""Parse FCEUX trace format"""
		accesses = []

		# Parse instruction
		instr_match = re.search(self.FCEUX_PATTERNS['instruction'], line)
		pc = None
		instruction = None
		if instr_match:
			pc = int(instr_match.group(1), 16)
			instruction = instr_match.group(3)

			# Execution access
			accesses.append(MemoryAccess(
				address=pc,
				access_type=AccessType.EXECUTE,
				pc=pc,
				instruction=instruction,
				timestamp=self.line_count
			))

		# Parse reads
		for match in re.finditer(self.FCEUX_PATTERNS['read'], line):
			addr = int(match.group(1), 16)
			value = int(match.group(2), 16)
			accesses.append(MemoryAccess(
				address=addr,
				access_type=AccessType.READ,
				value=value,
				pc=pc,
				instruction=instruction,
				timestamp=self.line_count
			))

		# Parse writes
		for match in re.finditer(self.FCEUX_PATTERNS['write'], line):
			addr = int(match.group(1), 16)
			value = int(match.group(2), 16)
			accesses.append(MemoryAccess(
				address=addr,
				access_type=AccessType.WRITE,
				value=value,
				pc=pc,
				instruction=instruction,
				timestamp=self.line_count
			))

		return accesses

	def _parse_mesen(self, line: str) -> list:
		"""Parse Mesen trace format"""
		accesses = []

		match = re.match(self.MESEN_PATTERNS['line'], line)
		if match:
			pc = int(match.group(1), 16)
			instruction = match.group(3)

			accesses.append(MemoryAccess(
				address=pc,
				access_type=AccessType.EXECUTE,
				pc=pc,
				instruction=instruction,
				timestamp=self.line_count
			))

			# Memory accesses in brackets
			for mem_match in re.finditer(self.MESEN_PATTERNS['memory'], line):
				addr = int(mem_match.group(1), 16)
				value = int(mem_match.group(2), 16)
				# Determine read/write based on instruction
				acc_type = AccessType.WRITE if instruction in ['STA', 'STX', 'STY', 'STZ'] else AccessType.READ
				accesses.append(MemoryAccess(
					address=addr,
					access_type=acc_type,
					value=value,
					pc=pc,
					instruction=instruction,
					timestamp=self.line_count
				))

		return accesses

	def _parse_bsnes(self, line: str) -> list:
		"""Parse bsnes trace format"""
		accesses = []

		# bsnes format: address instruction [operands]
		parts = line.strip().split()
		if len(parts) >= 2:
			try:
				pc = int(parts[0], 16)
				instruction = parts[1].upper()

				accesses.append(MemoryAccess(
					address=pc,
					access_type=AccessType.EXECUTE,
					pc=pc,
					instruction=instruction,
					timestamp=self.line_count
				))
			except ValueError:
				pass

		return accesses

	def _parse_generic(self, line: str) -> list:
		"""Parse generic/unknown trace format"""
		accesses = []

		# Look for read accesses
		for match in re.finditer(self.GENERIC_PATTERNS['read_access'], line, re.IGNORECASE):
			addr = int(match.group(1), 16)
			accesses.append(MemoryAccess(
				address=addr,
				access_type=AccessType.READ,
				timestamp=self.line_count
			))

		# Look for write accesses
		for match in re.finditer(self.GENERIC_PATTERNS['write_access'], line, re.IGNORECASE):
			addr = int(match.group(1), 16)
			accesses.append(MemoryAccess(
				address=addr,
				access_type=AccessType.WRITE,
				timestamp=self.line_count
			))

		return accesses


class MemoryAnalyzer:
	"""Analyze memory access patterns"""

	def __init__(self, platform: str = 'nes'):
		self.platform = platform
		self.stats = {}  # address -> AccessStats
		self.sequences = []
		self.accesses = []

	def add_accesses(self, accesses: list):
		"""Add memory accesses for analysis"""
		self.accesses.extend(accesses)

		for access in accesses:
			addr = access.address

			if addr not in self.stats:
				self.stats[addr] = AccessStats(
					address=addr,
					first_access=access.timestamp
				)

			stats = self.stats[addr]
			stats.last_access = access.timestamp

			if access.access_type == AccessType.READ:
				stats.read_count += 1
				if access.value is not None:
					stats.values_read.add(access.value)
			elif access.access_type == AccessType.WRITE:
				stats.write_count += 1
				if access.value is not None:
					stats.values_written.add(access.value)
			elif access.access_type == AccessType.EXECUTE:
				stats.exec_count += 1

			if access.pc is not None:
				stats.accessing_pcs.add(access.pc)

	def get_region(self, address: int) -> MemoryRegion:
		"""Determine memory region for an address"""
		if self.platform == 'nes':
			if address < 0x0800:
				return MemoryRegion.RAM
			elif address < 0x2000:
				return MemoryRegion.RAM  # Mirror
			elif address < 0x4000:
				return MemoryRegion.PPU
			elif address < 0x4020:
				return MemoryRegion.IO
			elif address >= 0x6000 and address < 0x8000:
				return MemoryRegion.SRAM
			elif address >= 0x8000:
				return MemoryRegion.ROM
		elif self.platform == 'snes':
			bank = (address >> 16) & 0xff
			offset = address & 0xffff
			if bank < 0x40:
				if offset < 0x2000:
					return MemoryRegion.RAM
				elif offset < 0x8000:
					return MemoryRegion.IO
				else:
					return MemoryRegion.ROM
			elif bank >= 0x7e and bank <= 0x7f:
				return MemoryRegion.WRAM
		elif self.platform == 'gba':
			if address < 0x04000000:
				return MemoryRegion.ROM
			elif address < 0x05000000:
				return MemoryRegion.IO
			elif address < 0x06000000:
				return MemoryRegion.RAM  # Palette
			elif address < 0x08000000:
				return MemoryRegion.VRAM
			elif address >= 0x08000000:
				return MemoryRegion.ROM

		return MemoryRegion.UNKNOWN

	def find_hot_spots(self, min_accesses: int = 100) -> list:
		"""Find frequently accessed memory locations"""
		hot_spots = []

		for addr, stats in self.stats.items():
			total = stats.read_count + stats.write_count + stats.exec_count
			if total >= min_accesses:
				hot_spots.append({
					'address': addr,
					'total_accesses': total,
					'reads': stats.read_count,
					'writes': stats.write_count,
					'executes': stats.exec_count,
					'region': self.get_region(addr).value,
					'accessing_pcs': len(stats.accessing_pcs)
				})

		return sorted(hot_spots, key=lambda x: x['total_accesses'], reverse=True)

	def find_access_sequences(self, window_size: int = 5) -> list:
		"""Find common sequences of memory accesses"""
		# Build sequence counts
		sequence_counts = defaultdict(int)

		for i in range(len(self.accesses) - window_size):
			window = self.accesses[i:i + window_size]
			# Filter to reads/writes only
			filtered = [(a.address, a.access_type.value) for a in window
					   if a.access_type in (AccessType.READ, AccessType.WRITE)]
			if len(filtered) >= 2:
				key = tuple(filtered)
				sequence_counts[key] += 1

		# Convert to list and sort
		sequences = []
		for seq, count in sequence_counts.items():
			if count >= 5:  # Minimum occurrence threshold
				sequences.append({
					'sequence': list(seq),
					'count': count
				})

		return sorted(sequences, key=lambda x: x['count'], reverse=True)[:50]

	def find_data_flow(self) -> list:
		"""Find data flow between memory locations (read then write same value)"""
		flows = defaultdict(int)

		# Track recent reads
		recent_reads = {}  # value -> (address, timestamp)

		for access in self.accesses:
			if access.value is None:
				continue

			if access.access_type == AccessType.READ:
				recent_reads[access.value] = (access.address, access.timestamp)
			elif access.access_type == AccessType.WRITE:
				if access.value in recent_reads:
					src_addr, src_time = recent_reads[access.value]
					if access.timestamp - src_time < 10:  # Within 10 instructions
						flow_key = (src_addr, access.address)
						flows[flow_key] += 1

		# Convert to list
		result = []
		for (src, dst), count in flows.items():
			if count >= 3:  # Minimum occurrence
				result.append({
					'source': src,
					'destination': dst,
					'count': count,
					'source_region': self.get_region(src).value,
					'dest_region': self.get_region(dst).value
				})

		return sorted(result, key=lambda x: x['count'], reverse=True)

	def get_region_stats(self) -> dict:
		"""Get statistics by memory region"""
		region_stats = defaultdict(lambda: {
			'addresses': 0,
			'total_reads': 0,
			'total_writes': 0,
			'total_executes': 0
		})

		for addr, stats in self.stats.items():
			region = self.get_region(addr)
			region_stats[region.value]['addresses'] += 1
			region_stats[region.value]['total_reads'] += stats.read_count
			region_stats[region.value]['total_writes'] += stats.write_count
			region_stats[region.value]['total_executes'] += stats.exec_count

		return dict(region_stats)

	def export_report(self, format_type: str = 'text') -> str:
		"""Generate analysis report"""
		if format_type == 'json':
			return self._export_json()
		else:
			return self._export_text()

	def _export_text(self) -> str:
		"""Generate text report"""
		lines = []
		lines.append("Memory Access Analysis Report")
		lines.append("=" * 60)
		lines.append("")

		# Overall stats
		total_accesses = sum(s.read_count + s.write_count + s.exec_count
						   for s in self.stats.values())
		lines.append(f"Total memory accesses: {total_accesses:,}")
		lines.append(f"Unique addresses accessed: {len(self.stats):,}")
		lines.append("")

		# Region stats
		lines.append("Access by Memory Region:")
		lines.append("-" * 40)
		for region, stats in self.get_region_stats().items():
			total = stats['total_reads'] + stats['total_writes'] + stats['total_executes']
			lines.append(f"  {region.upper():10} - {stats['addresses']:,} addrs, "
						f"{total:,} accesses (R:{stats['total_reads']:,} "
						f"W:{stats['total_writes']:,} X:{stats['total_executes']:,})")
		lines.append("")

		# Hot spots
		lines.append("Hot Spots (Top 20):")
		lines.append("-" * 40)
		for spot in self.find_hot_spots(min_accesses=10)[:20]:
			lines.append(f"  ${spot['address']:04x} ({spot['region']:5}) - "
						f"{spot['total_accesses']:,} accesses "
						f"(R:{spot['reads']:,} W:{spot['writes']:,} X:{spot['executes']:,})")
		lines.append("")

		# Data flow
		flows = self.find_data_flow()
		if flows:
			lines.append("Data Flow Patterns (Top 10):")
			lines.append("-" * 40)
			for flow in flows[:10]:
				lines.append(f"  ${flow['source']:04x} -> ${flow['destination']:04x} "
							f"({flow['count']} times)")

		return "\n".join(lines)

	def _export_json(self) -> str:
		"""Generate JSON report"""
		data = {
			'summary': {
				'total_accesses': sum(s.read_count + s.write_count + s.exec_count
									 for s in self.stats.values()),
				'unique_addresses': len(self.stats)
			},
			'region_stats': self.get_region_stats(),
			'hot_spots': self.find_hot_spots(min_accesses=10)[:50],
			'data_flows': self.find_data_flow()[:30],
			'sequences': self.find_access_sequences()[:20]
		}
		return json.dumps(data, indent=2)


def main():
	parser = argparse.ArgumentParser(
		description='Analyze memory access patterns from emulator traces'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze a trace file')
	analyze_parser.add_argument('trace_file', help='Trace file to analyze')
	analyze_parser.add_argument('--platform', choices=['nes', 'snes', 'gba', 'gb'],
							   default='nes', help='Target platform')
	analyze_parser.add_argument('--format', choices=['fceux', 'mesen', 'bsnes', 'auto'],
							   default='auto', help='Trace format')
	analyze_parser.add_argument('--max-lines', type=int, help='Maximum lines to process')
	analyze_parser.add_argument('--output', choices=['text', 'json'], default='text',
							   help='Output format')
	analyze_parser.add_argument('-o', '--output-file', help='Output file')

	# Hot spots command
	hot_parser = subparsers.add_parser('hotspots', help='Find hot memory spots')
	hot_parser.add_argument('trace_file', help='Trace file to analyze')
	hot_parser.add_argument('--platform', choices=['nes', 'snes', 'gba', 'gb'],
						   default='nes', help='Target platform')
	hot_parser.add_argument('--min-accesses', type=int, default=100,
						   help='Minimum access count threshold')
	hot_parser.add_argument('--top', type=int, default=20, help='Number of results')

	# Data flow command
	flow_parser = subparsers.add_parser('dataflow', help='Analyze data flow patterns')
	flow_parser.add_argument('trace_file', help='Trace file to analyze')
	flow_parser.add_argument('--platform', choices=['nes', 'snes', 'gba', 'gb'],
						   default='nes', help='Target platform')
	flow_parser.add_argument('--top', type=int, default=20, help='Number of results')

	# Stats command
	stats_parser = subparsers.add_parser('stats', help='Show address statistics')
	stats_parser.add_argument('trace_file', help='Trace file to analyze')
	stats_parser.add_argument('address', help='Address to analyze (hex)')
	stats_parser.add_argument('--platform', choices=['nes', 'snes', 'gba', 'gb'],
						   default='nes', help='Target platform')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	# Parse trace file
	trace_format = getattr(args, 'format', 'auto')
	parser_obj = TraceParser(trace_format)
	max_lines = getattr(args, 'max_lines', None)
	accesses = parser_obj.parse_file(args.trace_file, max_lines)

	print(f"Parsed {len(accesses):,} memory accesses from {parser_obj.line_count:,} lines")
	print(f"Detected format: {parser_obj.format_type}")
	print()

	# Create analyzer
	analyzer = MemoryAnalyzer(args.platform)
	analyzer.add_accesses(accesses)

	if args.command == 'analyze':
		report = analyzer.export_report(args.output)

		if args.output_file:
			with open(args.output_file, 'w', encoding='utf-8') as f:
				f.write(report)
			print(f"Report written to {args.output_file}")
		else:
			print(report)

	elif args.command == 'hotspots':
		hot_spots = analyzer.find_hot_spots(args.min_accesses)[:args.top]

		print(f"Top {args.top} Hot Spots (min {args.min_accesses} accesses):")
		print("-" * 70)
		print(f"{'Address':>10} {'Region':>8} {'Total':>10} {'Reads':>10} {'Writes':>10} {'Exec':>10}")
		print("-" * 70)

		for spot in hot_spots:
			print(f"${spot['address']:04x}       "
				 f"{spot['region']:>8} "
				 f"{spot['total_accesses']:>10,} "
				 f"{spot['reads']:>10,} "
				 f"{spot['writes']:>10,} "
				 f"{spot['executes']:>10,}")

	elif args.command == 'dataflow':
		flows = analyzer.find_data_flow()[:args.top]

		print(f"Top {args.top} Data Flow Patterns:")
		print("-" * 60)
		print(f"{'Source':>10} -> {'Dest':>10} {'Count':>10} {'Regions':<20}")
		print("-" * 60)

		for flow in flows:
			print(f"${flow['source']:04x}       "
				 f"-> ${flow['destination']:04x}       "
				 f"{flow['count']:>10} "
				 f"({flow['source_region']} -> {flow['dest_region']})")

	elif args.command == 'stats':
		addr = int(args.address.replace('$', '').replace('0x', ''), 16)

		if addr in analyzer.stats:
			stats = analyzer.stats[addr]
			region = analyzer.get_region(addr)

			print(f"Statistics for ${addr:04x} ({region.value}):")
			print("-" * 40)
			print(f"  Read count:    {stats.read_count:,}")
			print(f"  Write count:   {stats.write_count:,}")
			print(f"  Execute count: {stats.exec_count:,}")
			print(f"  First access:  line {stats.first_access}")
			print(f"  Last access:   line {stats.last_access}")
			print(f"  Unique values written: {len(stats.values_written)}")
			print(f"  Unique values read:    {len(stats.values_read)}")
			print(f"  Accessing PCs:         {len(stats.accessing_pcs)}")

			if stats.values_written:
				vals = sorted(stats.values_written)[:10]
				print(f"  Sample written values: {', '.join(f'${v:02x}' for v in vals)}")
			if stats.accessing_pcs:
				pcs = sorted(stats.accessing_pcs)[:10]
				print(f"  Sample accessing PCs:  {', '.join(f'${pc:04x}' for pc in pcs)}")
		else:
			print(f"Address ${addr:04x} not found in trace")


if __name__ == '__main__':
	main()
