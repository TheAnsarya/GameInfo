#!/usr/bin/env python3
"""
Execution Trace Analyzer

Analyze CPU execution traces from emulators.
Parse, filter, and analyze instruction traces.

Features:
- Parse Mesen/FCEUX trace logs
- Filter by address/instruction/register
- Detect loops and call patterns
- Generate execution statistics
- Export annotated traces

Usage:
	python trace_analyzer.py parse <trace.log> --format mesen
	python trace_analyzer.py filter <trace.log> --address 0x8000-0x8FFF
	python trace_analyzer.py stats <trace.log> --output stats.json
	python trace_analyzer.py loops <trace.log> --min-iterations 10
"""

import argparse
import json
import os
import re
import sys
from collections import Counter, defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Set


@dataclass
class TraceEntry:
	"""Single trace entry"""
	line_num: int = 0
	address: int = 0
	bank: int = -1
	opcode: int = 0
	instruction: str = ""
	operand: str = ""
	bytes_hex: str = ""
	a: int = 0
	x: int = 0
	y: int = 0
	sp: int = 0
	p: int = 0
	cycles: int = 0
	raw_line: str = ""


@dataclass
class LoopInfo:
	"""Detected loop information"""
	start_addr: int
	end_addr: int
	iterations: int
	instructions: List[str] = field(default_factory=list)


@dataclass
class TraceStats:
	"""Trace statistics"""
	total_entries: int = 0
	unique_addresses: int = 0
	instruction_counts: Dict[str, int] = field(default_factory=dict)
	address_counts: Dict[int, int] = field(default_factory=dict)
	bank_usage: Dict[int, int] = field(default_factory=dict)
	register_changes: Dict[str, int] = field(default_factory=dict)
	call_targets: Dict[int, int] = field(default_factory=dict)
	jump_targets: Dict[int, int] = field(default_factory=dict)


class MesenTraceParser:
	"""Parse Mesen trace format"""

	# Example: 8000 A9 00     LDA #$00            A:00 X:00 Y:00 SP:FF P:-- CYC:123
	PATTERN = re.compile(
		r'([0-9A-F]{4})\s+'  # Address
		r'([0-9A-F]{2}(?:\s[0-9A-F]{2})*)\s+'  # Bytes
		r'(\w+)\s*'  # Instruction
		r'([^\t]*?)\s*'  # Operand
		r'A:([0-9A-F]{2})\s+'  # A register
		r'X:([0-9A-F]{2})\s+'  # X register
		r'Y:([0-9A-F]{2})\s+'  # Y register
		r'(?:SP:([0-9A-F]{2})\s+)?'  # SP (optional)
		r'(?:P:([0-9A-F]{2}|[\-nvubdizc]+)\s+)?'  # P (optional)
		r'(?:CYC:(\d+))?',  # Cycles (optional)
		re.IGNORECASE
	)

	# With bank: 00:8000 ...
	PATTERN_BANK = re.compile(
		r'([0-9A-F]{2}):([0-9A-F]{4})\s+'  # Bank:Address
		r'([0-9A-F]{2}(?:\s[0-9A-F]{2})*)\s+'  # Bytes
		r'(\w+)\s*'  # Instruction
		r'([^\t]*?)\s*'  # Operand
		r'A:([0-9A-F]{2})',  # A register (at least)
		re.IGNORECASE
	)

	@classmethod
	def parse_line(cls, line: str, line_num: int) -> Optional[TraceEntry]:
		"""Parse single trace line"""
		line = line.strip()
		if not line:
			return None

		entry = TraceEntry(line_num=line_num, raw_line=line)

		# Try bank format first
		match = cls.PATTERN_BANK.match(line)
		if match:
			entry.bank = int(match.group(1), 16)
			entry.address = int(match.group(2), 16)
			entry.bytes_hex = match.group(3)
			entry.instruction = match.group(4).upper()
			entry.operand = match.group(5).strip()
			entry.a = int(match.group(6), 16)
			return entry

		# Try standard format
		match = cls.PATTERN.match(line)
		if match:
			entry.address = int(match.group(1), 16)
			entry.bytes_hex = match.group(2)
			entry.instruction = match.group(3).upper()
			entry.operand = match.group(4).strip()
			entry.a = int(match.group(5), 16)
			entry.x = int(match.group(6), 16)
			entry.y = int(match.group(7), 16)
			if match.group(8):
				entry.sp = int(match.group(8), 16)
			if match.group(10):
				entry.cycles = int(match.group(10))
			return entry

		return None


class FCEUXTraceParser:
	"""Parse FCEUX trace format"""

	# Example: $8000:A9 00     LDA #$00
	PATTERN = re.compile(
		r'\$([0-9A-F]{4}):([0-9A-F]{2}(?:\s[0-9A-F]{2})*)\s+'  # Address:Bytes
		r'(\w+)\s*'  # Instruction
		r'(.*)',  # Rest
		re.IGNORECASE
	)

	@classmethod
	def parse_line(cls, line: str, line_num: int) -> Optional[TraceEntry]:
		"""Parse single trace line"""
		line = line.strip()
		if not line:
			return None

		match = cls.PATTERN.match(line)
		if match:
			entry = TraceEntry(line_num=line_num, raw_line=line)
			entry.address = int(match.group(1), 16)
			entry.bytes_hex = match.group(2)
			entry.instruction = match.group(3).upper()
			entry.operand = match.group(4).strip()
			return entry

		return None


class TraceAnalyzer:
	"""Analyze execution traces"""

	def __init__(self, entries: List[TraceEntry]):
		self.entries = entries

	def compute_stats(self) -> TraceStats:
		"""Compute trace statistics"""
		stats = TraceStats()
		stats.total_entries = len(self.entries)

		prev_entry = None
		for entry in self.entries:
			# Address counts
			stats.address_counts[entry.address] = stats.address_counts.get(entry.address, 0) + 1

			# Bank usage
			if entry.bank >= 0:
				stats.bank_usage[entry.bank] = stats.bank_usage.get(entry.bank, 0) + 1

			# Instruction counts
			stats.instruction_counts[entry.instruction] = \
				stats.instruction_counts.get(entry.instruction, 0) + 1

			# JSR targets
			if entry.instruction == 'JSR':
				# Extract target address from operand
				target = self._parse_address(entry.operand)
				if target is not None:
					stats.call_targets[target] = stats.call_targets.get(target, 0) + 1

			# JMP targets
			if entry.instruction in ('JMP', 'BRA', 'BCC', 'BCS', 'BEQ', 'BNE', 'BMI', 'BPL', 'BVC', 'BVS'):
				target = self._parse_address(entry.operand)
				if target is not None:
					stats.jump_targets[target] = stats.jump_targets.get(target, 0) + 1

			# Register changes
			if prev_entry:
				if entry.a != prev_entry.a:
					stats.register_changes['A'] = stats.register_changes.get('A', 0) + 1
				if entry.x != prev_entry.x:
					stats.register_changes['X'] = stats.register_changes.get('X', 0) + 1
				if entry.y != prev_entry.y:
					stats.register_changes['Y'] = stats.register_changes.get('Y', 0) + 1

			prev_entry = entry

		stats.unique_addresses = len(stats.address_counts)
		return stats

	def detect_loops(self, min_iterations: int = 5, window: int = 50) -> List[LoopInfo]:
		"""Detect repeated instruction sequences (loops)"""
		loops = []
		i = 0

		while i < len(self.entries) - window:
			# Check for repeated address
			start_addr = self.entries[i].address

			# Find next occurrence
			for j in range(i + 1, min(i + window, len(self.entries))):
				if self.entries[j].address == start_addr:
					# Potential loop found
					loop_len = j - i
					iterations = 1

					# Count iterations
					k = j
					while k + loop_len <= len(self.entries):
						match = True
						for offset in range(loop_len):
							if self.entries[k + offset].address != self.entries[i + offset].address:
								match = False
								break
						if match:
							iterations += 1
							k += loop_len
						else:
							break

					if iterations >= min_iterations:
						# Get loop instructions
						instructions = [
							f"{self.entries[i + x].instruction} {self.entries[i + x].operand}"
							for x in range(loop_len)
						]

						loops.append(LoopInfo(
							start_addr=start_addr,
							end_addr=self.entries[j - 1].address,
							iterations=iterations,
							instructions=instructions[:10],
						))
						i = k - 1  # Skip past loop
						break
			i += 1

		return loops

	def filter_by_address(self, start: int, end: int) -> List[TraceEntry]:
		"""Filter entries by address range"""
		return [e for e in self.entries if start <= e.address <= end]

	def filter_by_instruction(self, instructions: List[str]) -> List[TraceEntry]:
		"""Filter entries by instruction type"""
		instructions = [i.upper() for i in instructions]
		return [e for e in self.entries if e.instruction in instructions]

	def find_calls_to(self, address: int) -> List[TraceEntry]:
		"""Find JSR/JMP to specific address"""
		results = []
		for entry in self.entries:
			if entry.instruction in ('JSR', 'JMP'):
				target = self._parse_address(entry.operand)
				if target == address:
					results.append(entry)
		return results

	def _parse_address(self, operand: str) -> Optional[int]:
		"""Parse address from operand"""
		# Handle $XXXX format
		match = re.search(r'\$([0-9A-F]{4})', operand, re.IGNORECASE)
		if match:
			return int(match.group(1), 16)
		# Handle #$XX format (not an address)
		if operand.startswith('#'):
			return None
		# Handle bare hex
		match = re.match(r'([0-9A-F]{4})', operand, re.IGNORECASE)
		if match:
			return int(match.group(1), 16)
		return None


def parse_trace_file(filepath: str, format: str = 'auto', limit: int = -1) -> List[TraceEntry]:
	"""Parse trace file"""
	entries = []

	# Auto-detect format
	if format == 'auto':
		with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
			first_line = f.readline()
			if first_line.startswith('$'):
				format = 'fceux'
			else:
				format = 'mesen'

	parser = MesenTraceParser if format == 'mesen' else FCEUXTraceParser

	with open(filepath, 'r', encoding='utf-8', errors='ignore') as f:
		for line_num, line in enumerate(f, 1):
			if limit > 0 and len(entries) >= limit:
				break

			entry = parser.parse_line(line, line_num)
			if entry:
				entries.append(entry)

	return entries


def main():
	parser = argparse.ArgumentParser(
		description='Execution Trace Analyzer',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Parse command
	parse_parser = subparsers.add_parser('parse', help='Parse and display trace')
	parse_parser.add_argument('trace', help='Trace file')
	parse_parser.add_argument('--format', '-f', default='auto', choices=['auto', 'mesen', 'fceux'],
							 help='Trace format')
	parse_parser.add_argument('--limit', '-l', type=int, default=100, help='Limit entries')
	parse_parser.add_argument('--offset', '-o', type=int, default=0, help='Start offset')

	# Filter command
	filter_parser = subparsers.add_parser('filter', help='Filter trace entries')
	filter_parser.add_argument('trace', help='Trace file')
	filter_parser.add_argument('--address', '-a', help='Address range (e.g., 0x8000-0x8FFF)')
	filter_parser.add_argument('--instruction', '-i', help='Instruction (comma-separated)')
	filter_parser.add_argument('--output', '-o', help='Output file')

	# Stats command
	stats_parser = subparsers.add_parser('stats', help='Generate statistics')
	stats_parser.add_argument('trace', help='Trace file')
	stats_parser.add_argument('--output', '-o', help='Output file')
	stats_parser.add_argument('--limit', '-l', type=int, default=-1, help='Limit entries to analyze')

	# Loops command
	loops_parser = subparsers.add_parser('loops', help='Detect loops')
	loops_parser.add_argument('trace', help='Trace file')
	loops_parser.add_argument('--min-iterations', '-m', type=int, default=10, help='Minimum iterations')
	loops_parser.add_argument('--output', '-o', help='Output file')

	# Calls command
	calls_parser = subparsers.add_parser('calls', help='Find calls to address')
	calls_parser.add_argument('trace', help='Trace file')
	calls_parser.add_argument('--address', '-a', type=lambda x: int(x, 0), required=True, help='Target address')

	args = parser.parse_args()

	if args.command == 'parse':
		entries = parse_trace_file(args.trace, args.format, args.limit + args.offset)

		print(f"Parsed {len(entries)} entries from {args.trace}")
		print()

		for entry in entries[args.offset:args.offset + args.limit]:
			bank_str = f"{entry.bank:02X}:" if entry.bank >= 0 else ""
			print(f"{bank_str}{entry.address:04X}  {entry.instruction:4s} {entry.operand:20s} A:{entry.a:02X} X:{entry.x:02X} Y:{entry.y:02X}")

	elif args.command == 'filter':
		entries = parse_trace_file(args.trace)
		analyzer = TraceAnalyzer(entries)

		filtered = entries

		if args.address:
			parts = args.address.replace('0x', '').split('-')
			start = int(parts[0], 16)
			end = int(parts[1], 16) if len(parts) > 1 else start
			filtered = analyzer.filter_by_address(start, end)

		if args.instruction:
			instructions = [i.strip() for i in args.instruction.split(',')]
			temp_analyzer = TraceAnalyzer(filtered)
			filtered = temp_analyzer.filter_by_instruction(instructions)

		print(f"Filtered to {len(filtered)} entries")

		if args.output:
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				for entry in filtered:
					f.write(entry.raw_line + '\n')
			print(f"Saved to: {args.output}")
		else:
			for entry in filtered[:50]:
				print(entry.raw_line)

	elif args.command == 'stats':
		entries = parse_trace_file(args.trace, limit=args.limit)
		analyzer = TraceAnalyzer(entries)
		stats = analyzer.compute_stats()

		print(f"Trace Statistics")
		print(f"================")
		print(f"Total entries: {stats.total_entries}")
		print(f"Unique addresses: {stats.unique_addresses}")
		print()

		print("Top 20 Instructions:")
		for instr, count in sorted(stats.instruction_counts.items(), key=lambda x: -x[1])[:20]:
			print(f"  {instr:6s}: {count:8d}")

		print()
		print("Top 20 Addresses:")
		for addr, count in sorted(stats.address_counts.items(), key=lambda x: -x[1])[:20]:
			print(f"  ${addr:04X}: {count:8d}")

		if stats.call_targets:
			print()
			print("Top JSR Targets:")
			for addr, count in sorted(stats.call_targets.items(), key=lambda x: -x[1])[:10]:
				print(f"  ${addr:04X}: {count:8d}")

		if args.output:
			output = {
				'total_entries': stats.total_entries,
				'unique_addresses': stats.unique_addresses,
				'instructions': stats.instruction_counts,
				'addresses': {f"${k:04X}": v for k, v in stats.address_counts.items()},
				'call_targets': {f"${k:04X}": v for k, v in stats.call_targets.items()},
			}
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(output, f, indent='\t')
			print(f"\nSaved to: {args.output}")

	elif args.command == 'loops':
		entries = parse_trace_file(args.trace)
		analyzer = TraceAnalyzer(entries)
		loops = analyzer.detect_loops(args.min_iterations)

		print(f"Found {len(loops)} loops")
		print()

		for i, loop in enumerate(loops[:20]):
			print(f"Loop {i + 1}:")
			print(f"  Address: ${loop.start_addr:04X} - ${loop.end_addr:04X}")
			print(f"  Iterations: {loop.iterations}")
			print(f"  Instructions: {', '.join(loop.instructions[:5])}")
			print()

		if args.output:
			output = [
				{
					'start': f"${l.start_addr:04X}",
					'end': f"${l.end_addr:04X}",
					'iterations': l.iterations,
					'instructions': l.instructions,
				}
				for l in loops
			]
			with open(args.output, 'w', encoding='utf-8', newline='\n') as f:
				json.dump(output, f, indent='\t')
			print(f"Saved to: {args.output}")

	elif args.command == 'calls':
		entries = parse_trace_file(args.trace)
		analyzer = TraceAnalyzer(entries)
		calls = analyzer.find_calls_to(args.address)

		print(f"Found {len(calls)} calls to ${args.address:04X}")
		print()

		for entry in calls[:50]:
			bank_str = f"{entry.bank:02X}:" if entry.bank >= 0 else ""
			print(f"Line {entry.line_num}: {bank_str}{entry.address:04X}  {entry.instruction} {entry.operand}")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
