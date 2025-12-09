#!/usr/bin/env python3
"""
Opcode Analyzer Tool
Analyze 6502/65816 opcode usage patterns and generate statistics.

Usage:
	python opcode_analyzer.py rom.nes --bank 0
	python opcode_analyzer.py rom.sfc --all-banks
	python opcode_analyzer.py rom.nes --output stats.json
"""

import argparse
import json
import os
import sys
from collections import Counter, defaultdict
from pathlib import Path
from typing import Optional

# 6502 Opcode Table
OPCODES_6502 = {
	0x00: ('BRK', 'impl', 1),
	0x01: ('ORA', 'indx', 2),
	0x05: ('ORA', 'zpg', 2),
	0x06: ('ASL', 'zpg', 2),
	0x08: ('PHP', 'impl', 1),
	0x09: ('ORA', 'imm', 2),
	0x0a: ('ASL', 'acc', 1),
	0x0d: ('ORA', 'abs', 3),
	0x0e: ('ASL', 'abs', 3),
	0x10: ('BPL', 'rel', 2),
	0x11: ('ORA', 'indy', 2),
	0x15: ('ORA', 'zpgx', 2),
	0x16: ('ASL', 'zpgx', 2),
	0x18: ('CLC', 'impl', 1),
	0x19: ('ORA', 'absy', 3),
	0x1d: ('ORA', 'absx', 3),
	0x1e: ('ASL', 'absx', 3),
	0x20: ('JSR', 'abs', 3),
	0x21: ('AND', 'indx', 2),
	0x24: ('BIT', 'zpg', 2),
	0x25: ('AND', 'zpg', 2),
	0x26: ('ROL', 'zpg', 2),
	0x28: ('PLP', 'impl', 1),
	0x29: ('AND', 'imm', 2),
	0x2a: ('ROL', 'acc', 1),
	0x2c: ('BIT', 'abs', 3),
	0x2d: ('AND', 'abs', 3),
	0x2e: ('ROL', 'abs', 3),
	0x30: ('BMI', 'rel', 2),
	0x31: ('AND', 'indy', 2),
	0x35: ('AND', 'zpgx', 2),
	0x36: ('ROL', 'zpgx', 2),
	0x38: ('SEC', 'impl', 1),
	0x39: ('AND', 'absy', 3),
	0x3d: ('AND', 'absx', 3),
	0x3e: ('ROL', 'absx', 3),
	0x40: ('RTI', 'impl', 1),
	0x41: ('EOR', 'indx', 2),
	0x45: ('EOR', 'zpg', 2),
	0x46: ('LSR', 'zpg', 2),
	0x48: ('PHA', 'impl', 1),
	0x49: ('EOR', 'imm', 2),
	0x4a: ('LSR', 'acc', 1),
	0x4c: ('JMP', 'abs', 3),
	0x4d: ('EOR', 'abs', 3),
	0x4e: ('LSR', 'abs', 3),
	0x50: ('BVC', 'rel', 2),
	0x51: ('EOR', 'indy', 2),
	0x55: ('EOR', 'zpgx', 2),
	0x56: ('LSR', 'zpgx', 2),
	0x58: ('CLI', 'impl', 1),
	0x59: ('EOR', 'absy', 3),
	0x5d: ('EOR', 'absx', 3),
	0x5e: ('LSR', 'absx', 3),
	0x60: ('RTS', 'impl', 1),
	0x61: ('ADC', 'indx', 2),
	0x65: ('ADC', 'zpg', 2),
	0x66: ('ROR', 'zpg', 2),
	0x68: ('PLA', 'impl', 1),
	0x69: ('ADC', 'imm', 2),
	0x6a: ('ROR', 'acc', 1),
	0x6c: ('JMP', 'ind', 3),
	0x6d: ('ADC', 'abs', 3),
	0x6e: ('ROR', 'abs', 3),
	0x70: ('BVS', 'rel', 2),
	0x71: ('ADC', 'indy', 2),
	0x75: ('ADC', 'zpgx', 2),
	0x76: ('ROR', 'zpgx', 2),
	0x78: ('SEI', 'impl', 1),
	0x79: ('ADC', 'absy', 3),
	0x7d: ('ADC', 'absx', 3),
	0x7e: ('ROR', 'absx', 3),
	0x81: ('STA', 'indx', 2),
	0x84: ('STY', 'zpg', 2),
	0x85: ('STA', 'zpg', 2),
	0x86: ('STX', 'zpg', 2),
	0x88: ('DEY', 'impl', 1),
	0x8a: ('TXA', 'impl', 1),
	0x8c: ('STY', 'abs', 3),
	0x8d: ('STA', 'abs', 3),
	0x8e: ('STX', 'abs', 3),
	0x90: ('BCC', 'rel', 2),
	0x91: ('STA', 'indy', 2),
	0x94: ('STY', 'zpgx', 2),
	0x95: ('STA', 'zpgx', 2),
	0x96: ('STX', 'zpgy', 2),
	0x98: ('TYA', 'impl', 1),
	0x99: ('STA', 'absy', 3),
	0x9a: ('TXS', 'impl', 1),
	0x9d: ('STA', 'absx', 3),
	0xa0: ('LDY', 'imm', 2),
	0xa1: ('LDA', 'indx', 2),
	0xa2: ('LDX', 'imm', 2),
	0xa4: ('LDY', 'zpg', 2),
	0xa5: ('LDA', 'zpg', 2),
	0xa6: ('LDX', 'zpg', 2),
	0xa8: ('TAY', 'impl', 1),
	0xa9: ('LDA', 'imm', 2),
	0xaa: ('TAX', 'impl', 1),
	0xac: ('LDY', 'abs', 3),
	0xad: ('LDA', 'abs', 3),
	0xae: ('LDX', 'abs', 3),
	0xb0: ('BCS', 'rel', 2),
	0xb1: ('LDA', 'indy', 2),
	0xb4: ('LDY', 'zpgx', 2),
	0xb5: ('LDA', 'zpgx', 2),
	0xb6: ('LDX', 'zpgy', 2),
	0xb8: ('CLV', 'impl', 1),
	0xb9: ('LDA', 'absy', 3),
	0xba: ('TSX', 'impl', 1),
	0xbc: ('LDY', 'absx', 3),
	0xbd: ('LDA', 'absx', 3),
	0xbe: ('LDX', 'absy', 3),
	0xc0: ('CPY', 'imm', 2),
	0xc1: ('CMP', 'indx', 2),
	0xc4: ('CPY', 'zpg', 2),
	0xc5: ('CMP', 'zpg', 2),
	0xc6: ('DEC', 'zpg', 2),
	0xc8: ('INY', 'impl', 1),
	0xc9: ('CMP', 'imm', 2),
	0xca: ('DEX', 'impl', 1),
	0xcc: ('CPY', 'abs', 3),
	0xcd: ('CMP', 'abs', 3),
	0xce: ('DEC', 'abs', 3),
	0xd0: ('BNE', 'rel', 2),
	0xd1: ('CMP', 'indy', 2),
	0xd5: ('CMP', 'zpgx', 2),
	0xd6: ('DEC', 'zpgx', 2),
	0xd8: ('CLD', 'impl', 1),
	0xd9: ('CMP', 'absy', 3),
	0xdd: ('CMP', 'absx', 3),
	0xde: ('DEC', 'absx', 3),
	0xe0: ('CPX', 'imm', 2),
	0xe1: ('SBC', 'indx', 2),
	0xe4: ('CPX', 'zpg', 2),
	0xe5: ('SBC', 'zpg', 2),
	0xe6: ('INC', 'zpg', 2),
	0xe8: ('INX', 'impl', 1),
	0xe9: ('SBC', 'imm', 2),
	0xea: ('NOP', 'impl', 1),
	0xec: ('CPX', 'abs', 3),
	0xed: ('SBC', 'abs', 3),
	0xee: ('INC', 'abs', 3),
	0xf0: ('BEQ', 'rel', 2),
	0xf1: ('SBC', 'indy', 2),
	0xf5: ('SBC', 'zpgx', 2),
	0xf6: ('INC', 'zpgx', 2),
	0xf8: ('SED', 'impl', 1),
	0xf9: ('SBC', 'absy', 3),
	0xfd: ('SBC', 'absx', 3),
	0xfe: ('INC', 'absx', 3),
}


class OpcodeAnalyzer:
	"""Analyze opcode usage in ROM code."""

	def __init__(self, rom_path: str):
		"""Initialize with ROM path."""
		self.rom_path = Path(rom_path)
		self.rom_data = None
		self.is_snes = False
		self.header_size = 0

	def load_rom(self) -> bool:
		"""Load ROM file and detect type."""
		try:
			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()

			# Detect ROM type
			ext = self.rom_path.suffix.lower()
			if ext in ['.sfc', '.smc']:
				self.is_snes = True
				# Check for SMC header
				if len(self.rom_data) % 0x8000 == 0x200:
					self.header_size = 0x200
			else:
				# NES detection
				if self.rom_data[:4] == b'NES\x1a':
					self.header_size = 16

			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def analyze_bank(self, bank_num: int, bank_size: int = 0x4000) -> dict:
		"""Analyze opcode usage in a single bank."""
		offset = self.header_size + (bank_num * bank_size)

		if offset + bank_size > len(self.rom_data):
			return {'error': 'Bank out of range'}

		bank_data = self.rom_data[offset:offset + bank_size]

		opcode_counts = Counter()
		mnemonic_counts = Counter()
		addressing_counts = Counter()
		invalid_opcodes = Counter()

		# Track opcode sequences (for pattern detection)
		sequences = defaultdict(int)

		i = 0
		prev_opcodes = []
		while i < len(bank_data):
			opcode = bank_data[i]

			if opcode in OPCODES_6502:
				mnem, addr_mode, length = OPCODES_6502[opcode]
				opcode_counts[opcode] += 1
				mnemonic_counts[mnem] += 1
				addressing_counts[addr_mode] += 1

				# Track sequences
				if len(prev_opcodes) >= 2:
					seq = tuple(prev_opcodes[-2:] + [mnem])
					sequences[seq] += 1

				prev_opcodes.append(mnem)
				if len(prev_opcodes) > 3:
					prev_opcodes.pop(0)

				i += length
			else:
				invalid_opcodes[opcode] += 1
				i += 1
				prev_opcodes = []

		# Calculate statistics
		total_instructions = sum(opcode_counts.values())
		total_invalid = sum(invalid_opcodes.values())

		return {
			'bank': bank_num,
			'offset': f"0x{offset:06x}",
			'size': bank_size,
			'total_instructions': total_instructions,
			'invalid_bytes': total_invalid,
			'code_ratio': total_instructions / (total_instructions + total_invalid) if total_instructions + total_invalid > 0 else 0,
			'opcode_counts': dict(opcode_counts.most_common(20)),
			'mnemonic_counts': dict(mnemonic_counts.most_common()),
			'addressing_counts': dict(addressing_counts),
			'invalid_opcodes': dict(invalid_opcodes.most_common(10)),
			'common_sequences': dict(
				[(str(k), v) for k, v in sorted(sequences.items(), key=lambda x: -x[1])[:10]]
			)
		}

	def analyze_all_banks(self, bank_size: int = 0x4000) -> dict:
		"""Analyze all banks in the ROM."""
		data_size = len(self.rom_data) - self.header_size
		num_banks = data_size // bank_size

		all_stats = {
			'rom_file': str(self.rom_path),
			'rom_size': len(self.rom_data),
			'header_size': self.header_size,
			'bank_size': bank_size,
			'num_banks': num_banks,
			'banks': [],
			'global_stats': {
				'total_instructions': 0,
				'total_invalid': 0,
				'mnemonic_totals': Counter(),
				'addressing_totals': Counter()
			}
		}

		for bank in range(num_banks):
			stats = self.analyze_bank(bank, bank_size)
			all_stats['banks'].append(stats)

			if 'error' not in stats:
				all_stats['global_stats']['total_instructions'] += stats['total_instructions']
				all_stats['global_stats']['total_invalid'] += stats['invalid_bytes']

				for mnem, count in stats['mnemonic_counts'].items():
					all_stats['global_stats']['mnemonic_totals'][mnem] += count
				for mode, count in stats['addressing_counts'].items():
					all_stats['global_stats']['addressing_totals'][mode] += count

		# Convert Counters to dicts for JSON
		all_stats['global_stats']['mnemonic_totals'] = dict(
			all_stats['global_stats']['mnemonic_totals'].most_common()
		)
		all_stats['global_stats']['addressing_totals'] = dict(
			all_stats['global_stats']['addressing_totals']
		)

		return all_stats

	def detect_code_regions(self, threshold: float = 0.7) -> list:
		"""Detect regions that look like code vs data."""
		regions = []
		window_size = 256
		step = 64

		data = self.rom_data[self.header_size:]

		for i in range(0, len(data) - window_size, step):
			window = data[i:i + window_size]

			valid = 0
			pos = 0
			while pos < len(window):
				if window[pos] in OPCODES_6502:
					_, _, length = OPCODES_6502[window[pos]]
					valid += 1
					pos += length
				else:
					pos += 1

			ratio = valid / window_size

			regions.append({
				'offset': i + self.header_size,
				'code_ratio': ratio,
				'is_code': ratio >= threshold
			})

		return regions

	def find_subroutines(self, bank_num: int, bank_size: int = 0x4000) -> list:
		"""Find likely subroutine entry points."""
		offset = self.header_size + (bank_num * bank_size)
		bank_data = self.rom_data[offset:offset + bank_size]

		subroutines = []

		# Find JSR targets
		jsr_targets = set()
		i = 0
		while i < len(bank_data):
			if bank_data[i] == 0x20:  # JSR
				if i + 2 < len(bank_data):
					target = bank_data[i + 1] | (bank_data[i + 2] << 8)
					# Check if target is in this bank (simplified)
					if 0x8000 <= target < 0xC000:
						local_target = target - 0x8000
						if 0 <= local_target < bank_size:
							jsr_targets.add(local_target)
				i += 3
			elif bank_data[i] in OPCODES_6502:
				_, _, length = OPCODES_6502[bank_data[i]]
				i += length
			else:
				i += 1

		# Also find code after RTS/RTI
		i = 0
		while i < len(bank_data):
			opcode = bank_data[i]
			if opcode in OPCODES_6502:
				mnem, _, length = OPCODES_6502[opcode]
				if mnem in ('RTS', 'RTI') and i + length < len(bank_data):
					next_offset = i + length
					if bank_data[next_offset] in OPCODES_6502:
						jsr_targets.add(next_offset)
				i += length
			else:
				i += 1

		# Verify targets look like code
		for target in sorted(jsr_targets):
			if target < len(bank_data) and bank_data[target] in OPCODES_6502:
				subroutines.append({
					'offset': target,
					'absolute': offset + target,
					'cpu_address': f"${0x8000 + target:04x}",
					'first_opcode': OPCODES_6502[bank_data[target]][0]
				})

		return subroutines

	def generate_report(self, stats: dict) -> str:
		"""Generate human-readable report."""
		lines = []
		lines.append("=" * 60)
		lines.append("Opcode Analysis Report")
		lines.append("=" * 60)
		lines.append(f"ROM: {stats.get('rom_file', 'Unknown')}")
		lines.append(f"Size: {stats.get('rom_size', 0):,} bytes")
		lines.append(f"Banks: {stats.get('num_banks', 0)}")
		lines.append("")

		global_stats = stats.get('global_stats', {})
		lines.append("Global Statistics:")
		lines.append("-" * 40)
		lines.append(f"Total instructions: {global_stats.get('total_instructions', 0):,}")
		lines.append(f"Invalid/data bytes: {global_stats.get('total_invalid', 0):,}")
		lines.append("")

		lines.append("Top 10 Mnemonics:")
		mnemonics = list(global_stats.get('mnemonic_totals', {}).items())[:10]
		for mnem, count in mnemonics:
			lines.append(f"  {mnem:4s}: {count:,}")
		lines.append("")

		lines.append("Addressing Mode Usage:")
		for mode, count in global_stats.get('addressing_totals', {}).items():
			lines.append(f"  {mode:6s}: {count:,}")
		lines.append("")

		lines.append("Per-Bank Code Ratio:")
		for bank in stats.get('banks', []):
			ratio = bank.get('code_ratio', 0)
			bar = '#' * int(ratio * 20)
			lines.append(f"  Bank {bank['bank']:2d}: [{bar:20s}] {ratio*100:.1f}%")

		return '\n'.join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description='Analyze opcode usage in NES/SNES ROMs'
	)
	parser.add_argument('rom', help='ROM file to analyze')
	parser.add_argument('--bank', type=int, help='Analyze specific bank')
	parser.add_argument('--all-banks', action='store_true',
						help='Analyze all banks')
	parser.add_argument('--bank-size', type=lambda x: int(x, 0),
						default=0x4000, help='Bank size (default: 0x4000)')
	parser.add_argument('--subroutines', action='store_true',
						help='Find subroutine entry points')
	parser.add_argument('--regions', action='store_true',
						help='Detect code vs data regions')
	parser.add_argument('--output', '-o', help='Output file')
	parser.add_argument('--json', action='store_true',
						help='Output as JSON')

	args = parser.parse_args()

	analyzer = OpcodeAnalyzer(args.rom)

	if not analyzer.load_rom():
		sys.exit(1)

	if args.subroutines:
		bank = args.bank if args.bank is not None else 0
		subs = analyzer.find_subroutines(bank, args.bank_size)

		if args.json or args.output:
			output = json.dumps(subs, indent='\t')
		else:
			output = f"Found {len(subs)} subroutines in bank {bank}:\n"
			for sub in subs:
				output += f"  {sub['cpu_address']}: {sub['first_opcode']}\n"

		if args.output:
			with open(args.output, 'w') as f:
				f.write(output)
		else:
			print(output)

	elif args.regions:
		regions = analyzer.detect_code_regions()

		if args.json or args.output:
			output = json.dumps(regions, indent='\t')
		else:
			output = "Code/Data Regions:\n"
			for r in regions:
				marker = 'CODE' if r['is_code'] else 'DATA'
				output += f"  0x{r['offset']:06x}: {r['code_ratio']*100:.1f}% [{marker}]\n"

		if args.output:
			with open(args.output, 'w') as f:
				f.write(output)
		else:
			print(output)

	elif args.all_banks:
		stats = analyzer.analyze_all_banks(args.bank_size)

		if args.json or (args.output and args.output.endswith('.json')):
			output = json.dumps(stats, indent='\t')
		else:
			output = analyzer.generate_report(stats)

		if args.output:
			with open(args.output, 'w') as f:
				f.write(output)
		else:
			print(output)

	elif args.bank is not None:
		stats = analyzer.analyze_bank(args.bank, args.bank_size)

		if args.json:
			output = json.dumps(stats, indent='\t')
		else:
			output = f"Bank {args.bank} Analysis:\n"
			output += f"  Instructions: {stats['total_instructions']}\n"
			output += f"  Invalid bytes: {stats['invalid_bytes']}\n"
			output += f"  Code ratio: {stats['code_ratio']*100:.1f}%\n"
			output += "\nTop mnemonics:\n"
			for mnem, count in list(stats['mnemonic_counts'].items())[:10]:
				output += f"  {mnem}: {count}\n"

		if args.output:
			with open(args.output, 'w') as f:
				f.write(output)
		else:
			print(output)
	else:
		# Default: analyze all banks
		stats = analyzer.analyze_all_banks(args.bank_size)
		print(analyzer.generate_report(stats))


if __name__ == '__main__':
	main()
