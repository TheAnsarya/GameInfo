#!/usr/bin/env python3
"""
6502 Assembly Helper

Quick reference and utilities for 6502/65816 assembly.
Includes opcode tables, addressing modes, and code analysis.

Features:
- Opcode lookup and encoding
- Disassemble bytes to assembly
- Assemble single instructions
- Calculate branch offsets
- Instruction timing info

Usage:
	python asm_helper.py opcode LDA
	python asm_helper.py disasm "A9 42 8D 00 20"
	python asm_helper.py assemble "LDA #$42"
	python asm_helper.py branch --from 0x8000 --to 0x8020
	python asm_helper.py timing LDA
"""

import argparse
import re
import struct
import sys
from dataclasses import dataclass
from typing import Dict, List, Optional, Tuple


@dataclass
class Opcode:
	"""6502 opcode information"""
	mnemonic: str
	opcode: int
	addressing: str
	bytes: int
	cycles: int
	extra_cycle: bool = False  # Page crossing or branch taken


# Complete 6502 opcode table
OPCODES_6502 = {
	# ADC - Add with Carry
	0x69: Opcode('ADC', 0x69, 'Immediate', 2, 2),
	0x65: Opcode('ADC', 0x65, 'Zero Page', 2, 3),
	0x75: Opcode('ADC', 0x75, 'Zero Page,X', 2, 4),
	0x6D: Opcode('ADC', 0x6D, 'Absolute', 3, 4),
	0x7D: Opcode('ADC', 0x7D, 'Absolute,X', 3, 4, True),
	0x79: Opcode('ADC', 0x79, 'Absolute,Y', 3, 4, True),
	0x61: Opcode('ADC', 0x61, '(Indirect,X)', 2, 6),
	0x71: Opcode('ADC', 0x71, '(Indirect),Y', 2, 5, True),

	# AND
	0x29: Opcode('AND', 0x29, 'Immediate', 2, 2),
	0x25: Opcode('AND', 0x25, 'Zero Page', 2, 3),
	0x35: Opcode('AND', 0x35, 'Zero Page,X', 2, 4),
	0x2D: Opcode('AND', 0x2D, 'Absolute', 3, 4),
	0x3D: Opcode('AND', 0x3D, 'Absolute,X', 3, 4, True),
	0x39: Opcode('AND', 0x39, 'Absolute,Y', 3, 4, True),
	0x21: Opcode('AND', 0x21, '(Indirect,X)', 2, 6),
	0x31: Opcode('AND', 0x31, '(Indirect),Y', 2, 5, True),

	# ASL - Arithmetic Shift Left
	0x0A: Opcode('ASL', 0x0A, 'Accumulator', 1, 2),
	0x06: Opcode('ASL', 0x06, 'Zero Page', 2, 5),
	0x16: Opcode('ASL', 0x16, 'Zero Page,X', 2, 6),
	0x0E: Opcode('ASL', 0x0E, 'Absolute', 3, 6),
	0x1E: Opcode('ASL', 0x1E, 'Absolute,X', 3, 7),

	# Branch instructions
	0x90: Opcode('BCC', 0x90, 'Relative', 2, 2, True),
	0xB0: Opcode('BCS', 0xB0, 'Relative', 2, 2, True),
	0xF0: Opcode('BEQ', 0xF0, 'Relative', 2, 2, True),
	0x30: Opcode('BMI', 0x30, 'Relative', 2, 2, True),
	0xD0: Opcode('BNE', 0xD0, 'Relative', 2, 2, True),
	0x10: Opcode('BPL', 0x10, 'Relative', 2, 2, True),
	0x50: Opcode('BVC', 0x50, 'Relative', 2, 2, True),
	0x70: Opcode('BVS', 0x70, 'Relative', 2, 2, True),

	# BIT
	0x24: Opcode('BIT', 0x24, 'Zero Page', 2, 3),
	0x2C: Opcode('BIT', 0x2C, 'Absolute', 3, 4),

	# BRK
	0x00: Opcode('BRK', 0x00, 'Implied', 1, 7),

	# Clear flags
	0x18: Opcode('CLC', 0x18, 'Implied', 1, 2),
	0xD8: Opcode('CLD', 0xD8, 'Implied', 1, 2),
	0x58: Opcode('CLI', 0x58, 'Implied', 1, 2),
	0xB8: Opcode('CLV', 0xB8, 'Implied', 1, 2),

	# CMP - Compare
	0xC9: Opcode('CMP', 0xC9, 'Immediate', 2, 2),
	0xC5: Opcode('CMP', 0xC5, 'Zero Page', 2, 3),
	0xD5: Opcode('CMP', 0xD5, 'Zero Page,X', 2, 4),
	0xCD: Opcode('CMP', 0xCD, 'Absolute', 3, 4),
	0xDD: Opcode('CMP', 0xDD, 'Absolute,X', 3, 4, True),
	0xD9: Opcode('CMP', 0xD9, 'Absolute,Y', 3, 4, True),
	0xC1: Opcode('CMP', 0xC1, '(Indirect,X)', 2, 6),
	0xD1: Opcode('CMP', 0xD1, '(Indirect),Y', 2, 5, True),

	# CPX - Compare X
	0xE0: Opcode('CPX', 0xE0, 'Immediate', 2, 2),
	0xE4: Opcode('CPX', 0xE4, 'Zero Page', 2, 3),
	0xEC: Opcode('CPX', 0xEC, 'Absolute', 3, 4),

	# CPY - Compare Y
	0xC0: Opcode('CPY', 0xC0, 'Immediate', 2, 2),
	0xC4: Opcode('CPY', 0xC4, 'Zero Page', 2, 3),
	0xCC: Opcode('CPY', 0xCC, 'Absolute', 3, 4),

	# DEC - Decrement
	0xC6: Opcode('DEC', 0xC6, 'Zero Page', 2, 5),
	0xD6: Opcode('DEC', 0xD6, 'Zero Page,X', 2, 6),
	0xCE: Opcode('DEC', 0xCE, 'Absolute', 3, 6),
	0xDE: Opcode('DEC', 0xDE, 'Absolute,X', 3, 7),

	# DEX/DEY
	0xCA: Opcode('DEX', 0xCA, 'Implied', 1, 2),
	0x88: Opcode('DEY', 0x88, 'Implied', 1, 2),

	# EOR - Exclusive OR
	0x49: Opcode('EOR', 0x49, 'Immediate', 2, 2),
	0x45: Opcode('EOR', 0x45, 'Zero Page', 2, 3),
	0x55: Opcode('EOR', 0x55, 'Zero Page,X', 2, 4),
	0x4D: Opcode('EOR', 0x4D, 'Absolute', 3, 4),
	0x5D: Opcode('EOR', 0x5D, 'Absolute,X', 3, 4, True),
	0x59: Opcode('EOR', 0x59, 'Absolute,Y', 3, 4, True),
	0x41: Opcode('EOR', 0x41, '(Indirect,X)', 2, 6),
	0x51: Opcode('EOR', 0x51, '(Indirect),Y', 2, 5, True),

	# INC - Increment
	0xE6: Opcode('INC', 0xE6, 'Zero Page', 2, 5),
	0xF6: Opcode('INC', 0xF6, 'Zero Page,X', 2, 6),
	0xEE: Opcode('INC', 0xEE, 'Absolute', 3, 6),
	0xFE: Opcode('INC', 0xFE, 'Absolute,X', 3, 7),

	# INX/INY
	0xE8: Opcode('INX', 0xE8, 'Implied', 1, 2),
	0xC8: Opcode('INY', 0xC8, 'Implied', 1, 2),

	# JMP
	0x4C: Opcode('JMP', 0x4C, 'Absolute', 3, 3),
	0x6C: Opcode('JMP', 0x6C, '(Indirect)', 3, 5),

	# JSR
	0x20: Opcode('JSR', 0x20, 'Absolute', 3, 6),

	# LDA - Load Accumulator
	0xA9: Opcode('LDA', 0xA9, 'Immediate', 2, 2),
	0xA5: Opcode('LDA', 0xA5, 'Zero Page', 2, 3),
	0xB5: Opcode('LDA', 0xB5, 'Zero Page,X', 2, 4),
	0xAD: Opcode('LDA', 0xAD, 'Absolute', 3, 4),
	0xBD: Opcode('LDA', 0xBD, 'Absolute,X', 3, 4, True),
	0xB9: Opcode('LDA', 0xB9, 'Absolute,Y', 3, 4, True),
	0xA1: Opcode('LDA', 0xA1, '(Indirect,X)', 2, 6),
	0xB1: Opcode('LDA', 0xB1, '(Indirect),Y', 2, 5, True),

	# LDX - Load X
	0xA2: Opcode('LDX', 0xA2, 'Immediate', 2, 2),
	0xA6: Opcode('LDX', 0xA6, 'Zero Page', 2, 3),
	0xB6: Opcode('LDX', 0xB6, 'Zero Page,Y', 2, 4),
	0xAE: Opcode('LDX', 0xAE, 'Absolute', 3, 4),
	0xBE: Opcode('LDX', 0xBE, 'Absolute,Y', 3, 4, True),

	# LDY - Load Y
	0xA0: Opcode('LDY', 0xA0, 'Immediate', 2, 2),
	0xA4: Opcode('LDY', 0xA4, 'Zero Page', 2, 3),
	0xB4: Opcode('LDY', 0xB4, 'Zero Page,X', 2, 4),
	0xAC: Opcode('LDY', 0xAC, 'Absolute', 3, 4),
	0xBC: Opcode('LDY', 0xBC, 'Absolute,X', 3, 4, True),

	# LSR - Logical Shift Right
	0x4A: Opcode('LSR', 0x4A, 'Accumulator', 1, 2),
	0x46: Opcode('LSR', 0x46, 'Zero Page', 2, 5),
	0x56: Opcode('LSR', 0x56, 'Zero Page,X', 2, 6),
	0x4E: Opcode('LSR', 0x4E, 'Absolute', 3, 6),
	0x5E: Opcode('LSR', 0x5E, 'Absolute,X', 3, 7),

	# NOP
	0xEA: Opcode('NOP', 0xEA, 'Implied', 1, 2),

	# ORA - OR with Accumulator
	0x09: Opcode('ORA', 0x09, 'Immediate', 2, 2),
	0x05: Opcode('ORA', 0x05, 'Zero Page', 2, 3),
	0x15: Opcode('ORA', 0x15, 'Zero Page,X', 2, 4),
	0x0D: Opcode('ORA', 0x0D, 'Absolute', 3, 4),
	0x1D: Opcode('ORA', 0x1D, 'Absolute,X', 3, 4, True),
	0x19: Opcode('ORA', 0x19, 'Absolute,Y', 3, 4, True),
	0x01: Opcode('ORA', 0x01, '(Indirect,X)', 2, 6),
	0x11: Opcode('ORA', 0x11, '(Indirect),Y', 2, 5, True),

	# Stack
	0x48: Opcode('PHA', 0x48, 'Implied', 1, 3),
	0x08: Opcode('PHP', 0x08, 'Implied', 1, 3),
	0x68: Opcode('PLA', 0x68, 'Implied', 1, 4),
	0x28: Opcode('PLP', 0x28, 'Implied', 1, 4),

	# ROL - Rotate Left
	0x2A: Opcode('ROL', 0x2A, 'Accumulator', 1, 2),
	0x26: Opcode('ROL', 0x26, 'Zero Page', 2, 5),
	0x36: Opcode('ROL', 0x36, 'Zero Page,X', 2, 6),
	0x2E: Opcode('ROL', 0x2E, 'Absolute', 3, 6),
	0x3E: Opcode('ROL', 0x3E, 'Absolute,X', 3, 7),

	# ROR - Rotate Right
	0x6A: Opcode('ROR', 0x6A, 'Accumulator', 1, 2),
	0x66: Opcode('ROR', 0x66, 'Zero Page', 2, 5),
	0x76: Opcode('ROR', 0x76, 'Zero Page,X', 2, 6),
	0x6E: Opcode('ROR', 0x6E, 'Absolute', 3, 6),
	0x7E: Opcode('ROR', 0x7E, 'Absolute,X', 3, 7),

	# RTI/RTS
	0x40: Opcode('RTI', 0x40, 'Implied', 1, 6),
	0x60: Opcode('RTS', 0x60, 'Implied', 1, 6),

	# SBC - Subtract with Carry
	0xE9: Opcode('SBC', 0xE9, 'Immediate', 2, 2),
	0xE5: Opcode('SBC', 0xE5, 'Zero Page', 2, 3),
	0xF5: Opcode('SBC', 0xF5, 'Zero Page,X', 2, 4),
	0xED: Opcode('SBC', 0xED, 'Absolute', 3, 4),
	0xFD: Opcode('SBC', 0xFD, 'Absolute,X', 3, 4, True),
	0xF9: Opcode('SBC', 0xF9, 'Absolute,Y', 3, 4, True),
	0xE1: Opcode('SBC', 0xE1, '(Indirect,X)', 2, 6),
	0xF1: Opcode('SBC', 0xF1, '(Indirect),Y', 2, 5, True),

	# Set flags
	0x38: Opcode('SEC', 0x38, 'Implied', 1, 2),
	0xF8: Opcode('SED', 0xF8, 'Implied', 1, 2),
	0x78: Opcode('SEI', 0x78, 'Implied', 1, 2),

	# STA - Store Accumulator
	0x85: Opcode('STA', 0x85, 'Zero Page', 2, 3),
	0x95: Opcode('STA', 0x95, 'Zero Page,X', 2, 4),
	0x8D: Opcode('STA', 0x8D, 'Absolute', 3, 4),
	0x9D: Opcode('STA', 0x9D, 'Absolute,X', 3, 5),
	0x99: Opcode('STA', 0x99, 'Absolute,Y', 3, 5),
	0x81: Opcode('STA', 0x81, '(Indirect,X)', 2, 6),
	0x91: Opcode('STA', 0x91, '(Indirect),Y', 2, 6),

	# STX - Store X
	0x86: Opcode('STX', 0x86, 'Zero Page', 2, 3),
	0x96: Opcode('STX', 0x96, 'Zero Page,Y', 2, 4),
	0x8E: Opcode('STX', 0x8E, 'Absolute', 3, 4),

	# STY - Store Y
	0x84: Opcode('STY', 0x84, 'Zero Page', 2, 3),
	0x94: Opcode('STY', 0x94, 'Zero Page,X', 2, 4),
	0x8C: Opcode('STY', 0x8C, 'Absolute', 3, 4),

	# Transfers
	0xAA: Opcode('TAX', 0xAA, 'Implied', 1, 2),
	0xA8: Opcode('TAY', 0xA8, 'Implied', 1, 2),
	0xBA: Opcode('TSX', 0xBA, 'Implied', 1, 2),
	0x8A: Opcode('TXA', 0x8A, 'Implied', 1, 2),
	0x9A: Opcode('TXS', 0x9A, 'Implied', 1, 2),
	0x98: Opcode('TYA', 0x98, 'Implied', 1, 2),
}


def get_opcode_by_mnemonic(mnemonic: str) -> List[Opcode]:
	"""Get all opcodes for a mnemonic"""
	mnemonic = mnemonic.upper()
	return [op for op in OPCODES_6502.values() if op.mnemonic == mnemonic]


def disassemble_bytes(data: bytes, start_address: int = 0x8000) -> List[Tuple[int, str, str]]:
	"""Disassemble bytes to assembly"""
	result = []
	i = 0

	while i < len(data):
		addr = start_address + i
		opcode_byte = data[i]

		if opcode_byte in OPCODES_6502:
			op = OPCODES_6502[opcode_byte]
			instruction = op.mnemonic

			if op.bytes == 1:
				if op.addressing == 'Accumulator':
					instruction += ' A'
				hex_bytes = f'{opcode_byte:02X}'
			elif op.bytes == 2:
				if i + 1 < len(data):
					operand = data[i + 1]
					hex_bytes = f'{opcode_byte:02X} {operand:02X}'

					if op.addressing == 'Immediate':
						instruction += f' #${operand:02X}'
					elif op.addressing == 'Zero Page':
						instruction += f' ${operand:02X}'
					elif op.addressing == 'Zero Page,X':
						instruction += f' ${operand:02X},X'
					elif op.addressing == 'Zero Page,Y':
						instruction += f' ${operand:02X},Y'
					elif op.addressing == '(Indirect,X)':
						instruction += f' (${operand:02X},X)'
					elif op.addressing == '(Indirect),Y':
						instruction += f' (${operand:02X}),Y'
					elif op.addressing == 'Relative':
						# Calculate branch target
						if operand >= 0x80:
							offset = operand - 256
						else:
							offset = operand
						target = addr + 2 + offset
						instruction += f' ${target:04X}'
				else:
					hex_bytes = f'{opcode_byte:02X}'
			elif op.bytes == 3:
				if i + 2 < len(data):
					low = data[i + 1]
					high = data[i + 2]
					operand = low | (high << 8)
					hex_bytes = f'{opcode_byte:02X} {low:02X} {high:02X}'

					if op.addressing == 'Absolute':
						instruction += f' ${operand:04X}'
					elif op.addressing == 'Absolute,X':
						instruction += f' ${operand:04X},X'
					elif op.addressing == 'Absolute,Y':
						instruction += f' ${operand:04X},Y'
					elif op.addressing == '(Indirect)':
						instruction += f' (${operand:04X})'
				else:
					hex_bytes = f'{opcode_byte:02X}'

			result.append((addr, hex_bytes, instruction))
			i += op.bytes
		else:
			# Unknown opcode
			result.append((addr, f'{opcode_byte:02X}', f'.db ${opcode_byte:02X}'))
			i += 1

	return result


def calculate_branch_offset(from_addr: int, to_addr: int) -> Tuple[int, bool]:
	"""Calculate branch offset and check if in range"""
	# Branch is relative to instruction after the branch (PC + 2)
	offset = to_addr - (from_addr + 2)

	in_range = -128 <= offset <= 127
	if offset < 0:
		offset = offset & 0xFF  # Convert to unsigned

	return offset, in_range


def main():
	parser = argparse.ArgumentParser(
		description='6502 Assembly Helper',
		formatter_class=argparse.RawDescriptionHelpFormatter
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Opcode command
	opcode_parser = subparsers.add_parser('opcode', help='Look up opcode')
	opcode_parser.add_argument('mnemonic', help='Instruction mnemonic')

	# Disasm command
	disasm_parser = subparsers.add_parser('disasm', help='Disassemble hex bytes')
	disasm_parser.add_argument('hex', help='Hex bytes (space separated)')
	disasm_parser.add_argument('--address', '-a', type=lambda x: int(x, 0), default=0x8000, help='Start address')

	# Branch command
	branch_parser = subparsers.add_parser('branch', help='Calculate branch offset')
	branch_parser.add_argument('--from', dest='from_addr', type=lambda x: int(x, 0), required=True, help='Branch instruction address')
	branch_parser.add_argument('--to', dest='to_addr', type=lambda x: int(x, 0), required=True, help='Target address')

	# Timing command
	timing_parser = subparsers.add_parser('timing', help='Show instruction timing')
	timing_parser.add_argument('mnemonic', help='Instruction mnemonic')

	# List command
	list_parser = subparsers.add_parser('list', help='List all opcodes')
	list_parser.add_argument('--sort', choices=['opcode', 'mnemonic'], default='opcode', help='Sort order')

	args = parser.parse_args()

	if args.command == 'opcode':
		opcodes = get_opcode_by_mnemonic(args.mnemonic)

		if opcodes:
			print(f"Opcode: {args.mnemonic.upper()}")
			print("-" * 50)
			print(f"{'Byte':<6} {'Addressing':<16} {'Bytes':<6} {'Cycles':<8}")
			for op in opcodes:
				cycles = f"{op.cycles}" + ("+1" if op.extra_cycle else "")
				print(f"${op.opcode:02X}    {op.addressing:<16} {op.bytes:<6} {cycles:<8}")
		else:
			print(f"Unknown mnemonic: {args.mnemonic}")

	elif args.command == 'disasm':
		# Parse hex bytes
		hex_str = args.hex.replace(' ', '').replace(',', '')
		try:
			data = bytes.fromhex(hex_str)
		except ValueError:
			print("Invalid hex string")
			sys.exit(1)

		result = disassemble_bytes(data, args.address)

		print(f"Disassembly at ${args.address:04X}:")
		print("-" * 40)
		for addr, hex_bytes, instruction in result:
			print(f"${addr:04X}:  {hex_bytes:<12} {instruction}")

	elif args.command == 'branch':
		offset, in_range = calculate_branch_offset(args.from_addr, args.to_addr)

		print(f"Branch from ${args.from_addr:04X} to ${args.to_addr:04X}")
		print(f"Offset: ${offset:02X} ({offset if offset < 128 else offset - 256})")
		print(f"In range: {'Yes' if in_range else 'No'}")

		if not in_range:
			print("Warning: Branch out of range! Use JMP instead.")

	elif args.command == 'timing':
		opcodes = get_opcode_by_mnemonic(args.mnemonic)

		if opcodes:
			print(f"Timing for {args.mnemonic.upper()}:")
			print("-" * 50)
			for op in opcodes:
				extra = " (+1 for page cross)" if op.extra_cycle else ""
				print(f"  {op.addressing:<16}: {op.cycles} cycles{extra}")
		else:
			print(f"Unknown mnemonic: {args.mnemonic}")

	elif args.command == 'list':
		print("6502 Opcode Table")
		print("=" * 60)

		if args.sort == 'opcode':
			sorted_ops = sorted(OPCODES_6502.items())
		else:
			sorted_ops = sorted(OPCODES_6502.items(), key=lambda x: (x[1].mnemonic, x[0]))

		for opcode, op in sorted_ops:
			cycles = f"{op.cycles}" + ("+" if op.extra_cycle else "")
			print(f"${opcode:02X}  {op.mnemonic:<4}  {op.addressing:<16}  {op.bytes}B  {cycles}c")

	else:
		parser.print_help()


if __name__ == '__main__':
	main()
