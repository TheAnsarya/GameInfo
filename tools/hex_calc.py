#!/usr/bin/env python3
"""
Hex Calculator

Quick hex/decimal/binary conversion and calculation utility.
Useful for ROM hacking address calculations.

Features:
- Convert between hex, decimal, binary
- Calculate bank/offset from ROM address
- Add/subtract addresses
- Calculate pointer values
- Bit manipulation

Usage:
	python hex_calc.py convert 0x8000
	python hex_calc.py bank 0x3C010 --size 0x4000
	python hex_calc.py add 0x8000 0x100
	python hex_calc.py ptr 0x1234 --little-endian
"""

import argparse
import sys
from typing import Optional


class HexCalc:
	"""Hex calculator and converter."""

	@staticmethod
	def parse_number(s: str) -> int:
		"""Parse a number from string (hex, dec, bin)."""
		s = s.strip().lower()

		if s.startswith('0x') or s.startswith('$'):
			# Hex
			return int(s.replace('$', '0x'), 16)
		elif s.startswith('0b') or s.startswith('%'):
			# Binary
			return int(s.replace('%', '0b'), 2)
		elif s.startswith('0o'):
			# Octal
			return int(s, 8)
		else:
			# Try hex first if it contains a-f
			if any(c in s for c in 'abcdef'):
				return int(s, 16)
			# Otherwise decimal
			return int(s)

	@staticmethod
	def format_all(value: int, bits: int = 32) -> dict:
		"""Format value in all bases."""
		mask = (1 << bits) - 1
		value = value & mask

		# Determine appropriate hex width
		hex_width = (bits + 3) // 4

		return {
			'decimal': value,
			'signed': value if value < (1 << (bits - 1)) else value - (1 << bits),
			'hex': f"0x{value:0{hex_width}X}",
			'hex_alt': f"${value:0{hex_width}X}",
			'binary': f"0b{value:0{bits}b}",
			'octal': f"0o{value:o}",
		}

	@staticmethod
	def calc_bank_offset(address: int, bank_size: int = 0x4000) -> dict:
		"""Calculate bank and offset from ROM address."""
		# Handle iNES header offset
		header_size = 16
		if address < header_size:
			return {
				'location': 'header',
				'offset': address,
			}

		rom_offset = address - header_size
		bank = rom_offset // bank_size
		offset = rom_offset % bank_size

		# Calculate CPU address (assuming PRG mapping)
		if bank_size == 0x4000:
			# 16KB banks
			cpu_base = 0x8000 if bank % 2 == 0 else 0xC000
			cpu_addr = cpu_base + offset
		else:
			# Other bank sizes
			cpu_addr = 0x8000 + offset

		return {
			'rom_offset': f"0x{address:06X}",
			'bank': bank,
			'bank_hex': f"0x{bank:02X}",
			'offset': f"0x{offset:04X}",
			'cpu_address': f"0x{cpu_addr:04X}",
		}

	@staticmethod
	def cpu_to_rom(cpu_addr: int, bank: int, bank_size: int = 0x4000, header: int = 16) -> int:
		"""Convert CPU address and bank to ROM offset."""
		# Normalize CPU address to bank offset
		offset = cpu_addr & (bank_size - 1)
		return header + (bank * bank_size) + offset

	@staticmethod
	def pointer_bytes(address: int, little_endian: bool = True, size: int = 2) -> bytes:
		"""Convert address to pointer bytes."""
		if little_endian:
			return address.to_bytes(size, 'little')
		return address.to_bytes(size, 'big')

	@staticmethod
	def bytes_to_pointer(data: bytes, little_endian: bool = True) -> int:
		"""Convert bytes to pointer value."""
		if little_endian:
			return int.from_bytes(data, 'little')
		return int.from_bytes(data, 'big')


def cmd_convert(args):
	"""Convert number between bases."""
	calc = HexCalc()
	value = calc.parse_number(args.value)

	bits = args.bits or (
		8 if value < 256 else
		16 if value < 65536 else
		24 if value < 16777216 else
		32
	)

	result = calc.format_all(value, bits)

	print(f"Value: {args.value}")
	print(f"Bits: {bits}")
	print("-" * 40)
	print(f"Decimal:  {result['decimal']}")
	print(f"Signed:   {result['signed']}")
	print(f"Hex:      {result['hex']}")
	print(f"Hex ($):  {result['hex_alt']}")
	print(f"Binary:   {result['binary']}")
	print(f"Octal:    {result['octal']}")


def cmd_bank(args):
	"""Calculate bank/offset from ROM address."""
	calc = HexCalc()
	address = calc.parse_number(args.address)
	bank_size = calc.parse_number(args.size) if args.size else 0x4000

	result = calc.calc_bank_offset(address, bank_size)

	print(f"ROM Address: 0x{address:06X}")
	print(f"Bank Size: 0x{bank_size:04X} ({bank_size} bytes)")
	print("-" * 40)

	if 'location' in result:
		print(f"Location: {result['location']}")
		print(f"Offset: {result['offset']}")
	else:
		print(f"Bank: {result['bank']} ({result['bank_hex']})")
		print(f"Bank Offset: {result['offset']}")
		print(f"CPU Address: {result['cpu_address']}")


def cmd_add(args):
	"""Add two values."""
	calc = HexCalc()
	a = calc.parse_number(args.a)
	b = calc.parse_number(args.b)
	result = a + b

	print(f"  0x{a:08X}")
	print(f"+ 0x{b:08X}")
	print("-" * 14)
	print(f"= 0x{result:08X}")
	print(f"= {result}")


def cmd_sub(args):
	"""Subtract two values."""
	calc = HexCalc()
	a = calc.parse_number(args.a)
	b = calc.parse_number(args.b)
	result = a - b

	print(f"  0x{a:08X}")
	print(f"- 0x{b:08X}")
	print("-" * 14)
	print(f"= 0x{result & 0xFFFFFFFF:08X}")
	print(f"= {result}")


def cmd_ptr(args):
	"""Convert address to pointer bytes."""
	calc = HexCalc()
	address = calc.parse_number(args.address)

	little = calc.pointer_bytes(address, little_endian=True, size=args.size)
	big = calc.pointer_bytes(address, little_endian=False, size=args.size)

	print(f"Address: 0x{address:0{args.size * 2}X}")
	print("-" * 40)
	print(f"Little-endian: {' '.join(f'{b:02X}' for b in little)}")
	print(f"Big-endian:    {' '.join(f'{b:02X}' for b in big)}")


def cmd_bits(args):
	"""Show individual bits."""
	calc = HexCalc()
	value = calc.parse_number(args.value)
	bits = args.bits or 8

	print(f"Value: 0x{value:0{bits // 4}X} ({value})")
	print("-" * 40)

	for i in range(bits - 1, -1, -1):
		bit = (value >> i) & 1
		if bit:
			print(f"  Bit {i:2d} (0x{1 << i:0{bits // 4}X}): SET")


def cmd_mask(args):
	"""Apply bit mask."""
	calc = HexCalc()
	value = calc.parse_number(args.value)
	mask = calc.parse_number(args.mask)

	result_and = value & mask
	result_or = value | mask
	result_xor = value ^ mask

	print(f"Value: 0x{value:08X}")
	print(f"Mask:  0x{mask:08X}")
	print("-" * 40)
	print(f"AND:   0x{result_and:08X}")
	print(f"OR:    0x{result_or:08X}")
	print(f"XOR:   0x{result_xor:08X}")


def cmd_cpu2rom(args):
	"""Convert CPU address to ROM offset."""
	calc = HexCalc()
	cpu_addr = calc.parse_number(args.cpu_addr)
	bank = calc.parse_number(args.bank)
	bank_size = calc.parse_number(args.size) if args.size else 0x4000
	header = calc.parse_number(args.header) if args.header else 16

	rom_offset = calc.cpu_to_rom(cpu_addr, bank, bank_size, header)

	print(f"CPU Address: 0x{cpu_addr:04X}")
	print(f"Bank: {bank} (0x{bank:02X})")
	print(f"Bank Size: 0x{bank_size:04X}")
	print("-" * 40)
	print(f"ROM Offset: 0x{rom_offset:06X}")


def cmd_range(args):
	"""Calculate range info."""
	calc = HexCalc()
	start = calc.parse_number(args.start)
	end = calc.parse_number(args.end)

	length = end - start
	if length < 0:
		start, end = end, start
		length = -length

	print(f"Start: 0x{start:08X}")
	print(f"End:   0x{end:08X}")
	print("-" * 40)
	print(f"Length: 0x{length:08X} ({length} bytes)")
	print(f"Last byte: 0x{end - 1:08X}")


def cmd_repl(args):
	"""Interactive REPL mode."""
	calc = HexCalc()
	print("Hex Calculator REPL")
	print("Enter values or expressions. Type 'help' for commands, 'quit' to exit.")
	print()

	while True:
		try:
			line = input("> ").strip()
		except (EOFError, KeyboardInterrupt):
			print()
			break

		if not line:
			continue

		if line.lower() in ('quit', 'exit', 'q'):
			break

		if line.lower() == 'help':
			print("Commands:")
			print("  <value>           - Convert value to all bases")
			print("  <a> + <b>         - Add")
			print("  <a> - <b>         - Subtract")
			print("  <a> & <b>         - AND")
			print("  <a> | <b>         - OR")
			print("  <a> ^ <b>         - XOR")
			print("  <a> << <n>        - Shift left")
			print("  <a> >> <n>        - Shift right")
			print("  quit              - Exit")
			continue

		try:
			# Check for operators
			for op, func in [
				(' + ', lambda a, b: a + b),
				(' - ', lambda a, b: a - b),
				(' & ', lambda a, b: a & b),
				(' | ', lambda a, b: a | b),
				(' ^ ', lambda a, b: a ^ b),
				(' << ', lambda a, b: a << b),
				(' >> ', lambda a, b: a >> b),
			]:
				if op in line:
					parts = line.split(op, 1)
					a = calc.parse_number(parts[0])
					b = calc.parse_number(parts[1])
					result = func(a, b)
					print(f"= 0x{result & 0xFFFFFFFF:X} ({result})")
					break
			else:
				# Just convert the value
				value = calc.parse_number(line)
				result = calc.format_all(value)
				print(f"  Dec: {result['decimal']}")
				print(f"  Hex: {result['hex']}")
				print(f"  Bin: {result['binary']}")

		except Exception as e:
			print(f"Error: {e}")


def main():
	parser = argparse.ArgumentParser(description="Hex Calculator")
	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Convert
	conv = subparsers.add_parser('convert', help='Convert number between bases')
	conv.add_argument('value', help='Value to convert')
	conv.add_argument('--bits', type=int, help='Bit width')

	# Bank
	bank = subparsers.add_parser('bank', help='Calculate bank/offset')
	bank.add_argument('address', help='ROM address')
	bank.add_argument('--size', help='Bank size (default: 0x4000)')

	# Add
	add = subparsers.add_parser('add', help='Add two values')
	add.add_argument('a', help='First value')
	add.add_argument('b', help='Second value')

	# Subtract
	sub = subparsers.add_parser('sub', help='Subtract two values')
	sub.add_argument('a', help='First value')
	sub.add_argument('b', help='Second value')

	# Pointer
	ptr = subparsers.add_parser('ptr', help='Convert to pointer bytes')
	ptr.add_argument('address', help='Address value')
	ptr.add_argument('--size', type=int, default=2, help='Pointer size (default: 2)')

	# Bits
	bits = subparsers.add_parser('bits', help='Show set bits')
	bits.add_argument('value', help='Value to analyze')
	bits.add_argument('--bits', type=int, help='Bit width')

	# Mask
	mask = subparsers.add_parser('mask', help='Apply bit mask')
	mask.add_argument('value', help='Value')
	mask.add_argument('mask', help='Mask')

	# CPU to ROM
	cpu2rom = subparsers.add_parser('cpu2rom', help='Convert CPU address to ROM')
	cpu2rom.add_argument('cpu_addr', help='CPU address')
	cpu2rom.add_argument('bank', help='Bank number')
	cpu2rom.add_argument('--size', help='Bank size (default: 0x4000)')
	cpu2rom.add_argument('--header', help='Header size (default: 16)')

	# Range
	rng = subparsers.add_parser('range', help='Calculate range info')
	rng.add_argument('start', help='Start address')
	rng.add_argument('end', help='End address')

	# REPL
	repl = subparsers.add_parser('repl', help='Interactive mode')

	args = parser.parse_args()

	commands = {
		'convert': cmd_convert,
		'bank': cmd_bank,
		'add': cmd_add,
		'sub': cmd_sub,
		'ptr': cmd_ptr,
		'bits': cmd_bits,
		'mask': cmd_mask,
		'cpu2rom': cmd_cpu2rom,
		'range': cmd_range,
		'repl': cmd_repl,
	}

	if args.command in commands:
		commands[args.command](args)
	elif args.command is None:
		# Default to REPL mode
		cmd_repl(args)
	else:
		parser.print_help()


if __name__ == '__main__':
	main()
