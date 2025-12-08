#!/usr/bin/env python3
"""
Cheat Code Generator - Generate and convert cheat codes.

Supports:
- Game Genie (NES, SNES, Genesis, GB)
- Pro Action Replay (NES, SNES, GB)
- GameShark (GB, GBA)
- Raw address/value pairs
- Conversion between formats

Author: ROM Hacking Toolkit
"""

import argparse
import json
import sys
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple


class Platform(Enum):
	"""Supported platforms."""
	NES = "nes"
	SNES = "snes"
	GENESIS = "genesis"
	GAMEBOY = "gb"
	GBA = "gba"


class CheatType(Enum):
	"""Cheat code types."""
	GAME_GENIE = "game_genie"
	PRO_ACTION_REPLAY = "par"
	GAMESHARK = "gameshark"
	RAW = "raw"


@dataclass
class CheatCode:
	"""Cheat code representation."""
	name: str
	code: str
	cheat_type: CheatType
	platform: Platform
	address: int = 0
	value: int = 0
	compare: int = -1  # -1 = no compare
	description: str = ""


# Game Genie character maps
NES_GG_CHARS = "APZLGITYEOXUKSVN"
SNES_GG_CHARS = "DF4709156BC8A23E"
GB_GG_CHARS = "APZLGITYEOXUKSVN"
GENESIS_GG_CHARS = "ABCDEFGHJKLMNPRSTVWXYZ0123456789"


class NESGameGenie:
	"""NES Game Genie encoder/decoder."""
	
	@staticmethod
	def decode(code: str) -> Tuple[int, int, int]:
		"""Decode Game Genie code to address, value, compare."""
		code = code.upper().replace('-', '')
		
		if len(code) not in [6, 8]:
			raise ValueError("NES Game Genie codes must be 6 or 8 characters")
		
		# Convert to hex nibbles
		values = []
		for c in code:
			if c not in NES_GG_CHARS:
				raise ValueError(f"Invalid character: {c}")
			values.append(NES_GG_CHARS.index(c))
		
		n = values
		
		# Decode address (15 bits)
		address = (
			((n[3] & 7) << 12) |
			((n[5] & 7) << 8) |
			((n[4] & 8) << 8) |
			((n[2] & 7) << 4) |
			((n[1] & 8) << 4) |
			(n[4] & 7) |
			(n[3] & 8)
		)
		address |= 0x8000  # NES codes are always ROM space
		
		# Decode value (8 bits)
		value = (
			((n[1] & 7) << 4) |
			((n[0] & 8) << 4) |
			(n[0] & 7) |
			(n[5] & 8)
		)
		
		# Decode compare (8 bits, only for 8-char codes)
		compare = -1
		if len(code) == 8:
			compare = (
				((n[7] & 7) << 4) |
				((n[6] & 8) << 4) |
				(n[6] & 7) |
				(n[2] & 8)
			)
		
		return address, value, compare
	
	@staticmethod
	def encode(address: int, value: int, compare: int = -1) -> str:
		"""Encode address, value, compare to Game Genie code."""
		n = [0] * (8 if compare >= 0 else 6)
		
		# Encode value
		n[0] = ((value >> 4) & 8) | (value & 7)
		n[1] = ((address >> 4) & 8) | ((value >> 4) & 7)
		
		# Encode address
		n[2] = ((compare if compare >= 0 else 0) & 8) | ((address >> 4) & 7)
		n[3] = (address & 8) | ((address >> 12) & 7)
		n[4] = ((address >> 8) & 8) | (address & 7)
		n[5] = (value & 8) | ((address >> 8) & 7)
		
		# Encode compare
		if compare >= 0:
			n[6] = ((compare >> 4) & 8) | (compare & 7)
			n[7] = (compare & 8) | ((compare >> 4) & 7)
		
		# Convert to characters
		code = ''.join(NES_GG_CHARS[v] for v in n)
		
		# Format with dash
		if len(code) == 6:
			return f"{code[:3]}-{code[3:]}"
		else:
			return f"{code[:4]}-{code[4:]}"
	
	@staticmethod
	def to_raw(code: str) -> str:
		"""Convert to raw format."""
		address, value, compare = NESGameGenie.decode(code)
		if compare >= 0:
			return f"${address:04X}?{compare:02X}:{value:02X}"
		return f"${address:04X}:{value:02X}"


class SNESGameGenie:
	"""SNES Game Genie encoder/decoder."""
	
	@staticmethod
	def decode(code: str) -> Tuple[int, int]:
		"""Decode SNES Game Genie code to address, value."""
		code = code.upper().replace('-', '')
		
		if len(code) != 8:
			raise ValueError("SNES Game Genie codes must be 8 characters")
		
		# Convert to hex values
		values = []
		for c in code:
			if c not in SNES_GG_CHARS:
				raise ValueError(f"Invalid character: {c}")
			values.append(SNES_GG_CHARS.index(c))
		
		# Decode (SNES format is scrambled hex)
		n = values
		
		# Reconstruct address and value
		address = (
			(n[2] << 20) | (n[3] << 16) |
			(n[4] << 12) | (n[5] << 8) |
			(n[6] << 4) | n[7]
		)
		value = (n[0] << 4) | n[1]
		
		return address, value
	
	@staticmethod
	def encode(address: int, value: int) -> str:
		"""Encode address, value to SNES Game Genie code."""
		n = [
			(value >> 4) & 0xF,
			value & 0xF,
			(address >> 20) & 0xF,
			(address >> 16) & 0xF,
			(address >> 12) & 0xF,
			(address >> 8) & 0xF,
			(address >> 4) & 0xF,
			address & 0xF
		]
		
		code = ''.join(SNES_GG_CHARS[v] for v in n)
		return f"{code[:4]}-{code[4:]}"
	
	@staticmethod
	def to_raw(code: str) -> str:
		"""Convert to raw format."""
		address, value = SNESGameGenie.decode(code)
		return f"${address:06X}:{value:02X}"


class GameBoyGameGenie:
	"""Game Boy Game Genie encoder/decoder."""
	
	@staticmethod
	def decode(code: str) -> Tuple[int, int, int]:
		"""Decode GB Game Genie code."""
		code = code.upper().replace('-', '')
		
		if len(code) not in [6, 9]:
			raise ValueError("GB Game Genie codes must be 6 or 9 characters")
		
		# Handle the 9-character format (XXX-XXX-XXX)
		if len(code) == 9:
			code = code[:6] + code[6:]
		
		# Convert to values
		values = []
		for c in code[:9] if len(code) >= 9 else code:
			if c not in GB_GG_CHARS:
				raise ValueError(f"Invalid character: {c}")
			values.append(GB_GG_CHARS.index(c))
		
		n = values
		
		# Decode similar to NES
		address = (
			((n[5] & 0xF) << 8) |
			((n[2] & 0xF) << 4) |
			((n[3] & 0xF) << 12) |
			(n[4] & 0xF)
		)
		
		value = ((n[0] & 0xF) << 4) | (n[1] & 0xF)
		
		compare = -1
		if len(n) > 6:
			# 9-character code has compare value
			compare = ((n[6] ^ 0xF) << 4) | (n[8] ^ 0xF)
			# Adjust for encoding
			compare = (compare >> 2) | ((compare & 3) << 6)
			compare ^= 0xBA
		
		return address, value, compare
	
	@staticmethod
	def encode(address: int, value: int, compare: int = -1) -> str:
		"""Encode to GB Game Genie code."""
		n = [0] * (9 if compare >= 0 else 6)
		
		n[0] = (value >> 4) & 0xF
		n[1] = value & 0xF
		n[2] = (address >> 4) & 0xF
		n[3] = (address >> 12) & 0xF
		n[4] = address & 0xF
		n[5] = (address >> 8) & 0xF
		
		if compare >= 0:
			encoded = compare ^ 0xBA
			encoded = ((encoded << 2) & 0xFC) | ((encoded >> 6) & 3)
			n[6] = (encoded >> 4) ^ 0xF
			n[7] = 0  # Checksum placeholder
			n[8] = (encoded & 0xF) ^ 0xF
		
		code = ''.join(GB_GG_CHARS[v] for v in n)
		if len(code) == 9:
			return f"{code[:3]}-{code[3:6]}-{code[6:]}"
		return f"{code[:3]}-{code[3:]}"


class ProActionReplay:
	"""Pro Action Replay encoder/decoder."""
	
	@staticmethod
	def decode_nes(code: str) -> Tuple[int, int]:
		"""Decode NES PAR code."""
		code = code.upper().replace(' ', '')
		
		# Format: AAAA:VV or AAAAVV
		if ':' in code:
			addr_str, val_str = code.split(':')
		elif len(code) == 6:
			addr_str = code[:4]
			val_str = code[4:]
		else:
			raise ValueError("Invalid PAR code format")
		
		address = int(addr_str, 16)
		value = int(val_str, 16)
		
		return address, value
	
	@staticmethod
	def encode_nes(address: int, value: int) -> str:
		"""Encode NES PAR code."""
		return f"{address:04X}:{value:02X}"
	
	@staticmethod
	def decode_snes(code: str) -> Tuple[int, int]:
		"""Decode SNES PAR code."""
		code = code.upper().replace(' ', '')
		
		# Format: AAAAAA:VV or 7Exxxx:VV
		if ':' in code:
			addr_str, val_str = code.split(':')
		elif len(code) == 8:
			addr_str = code[:6]
			val_str = code[6:]
		else:
			raise ValueError("Invalid PAR code format")
		
		address = int(addr_str, 16)
		value = int(val_str, 16)
		
		return address, value
	
	@staticmethod
	def encode_snes(address: int, value: int) -> str:
		"""Encode SNES PAR code."""
		return f"{address:06X}:{value:02X}"


class GameShark:
	"""GameShark encoder/decoder."""
	
	@staticmethod
	def decode_gb(code: str) -> Tuple[int, int]:
		"""Decode GB GameShark code."""
		code = code.upper().replace('-', '').replace(' ', '')
		
		# Format: 01XXAAAA (8 hex digits)
		if len(code) != 8:
			raise ValueError("GB GameShark codes must be 8 characters")
		
		# Byte 0: Type (01 = 8-bit write)
		# Byte 1: Value
		# Bytes 2-3: Address (little-endian, reversed)
		code_type = int(code[0:2], 16)
		value = int(code[2:4], 16)
		addr_lo = int(code[4:6], 16)
		addr_hi = int(code[6:8], 16)
		
		address = (addr_hi << 8) | addr_lo
		
		return address, value
	
	@staticmethod
	def encode_gb(address: int, value: int) -> str:
		"""Encode GB GameShark code."""
		addr_lo = address & 0xFF
		addr_hi = (address >> 8) & 0xFF
		return f"01{value:02X}{addr_lo:02X}{addr_hi:02X}"
	
	@staticmethod
	def decode_gba(code: str) -> Tuple[int, int, int]:
		"""Decode GBA GameShark/AR code."""
		code = code.upper().replace(' ', '')
		
		# Format: AAAAAAAA VVVVVVVV (two 8-digit hex numbers)
		if len(code) == 16:
			addr_part = code[:8]
			value_part = code[8:]
		elif ' ' in code:
			addr_part, value_part = code.split()
		else:
			raise ValueError("Invalid GBA code format")
		
		# Decode address (may be encrypted)
		address = int(addr_part, 16)
		value = int(value_part, 16)
		
		# Extract code type from high byte of address
		code_type = (address >> 24) & 0xFF
		address &= 0x0FFFFFFF
		
		return address, value, code_type
	
	@staticmethod
	def encode_gba(address: int, value: int, code_type: int = 0) -> str:
		"""Encode GBA GameShark code."""
		full_addr = (code_type << 24) | (address & 0x0FFFFFFF)
		return f"{full_addr:08X} {value:08X}"


def convert_code(
	code: str,
	from_type: CheatType,
	to_type: CheatType,
	platform: Platform
) -> str:
	"""Convert cheat code between formats."""
	# First decode to raw address/value
	address = 0
	value = 0
	compare = -1
	
	if from_type == CheatType.GAME_GENIE:
		if platform == Platform.NES:
			address, value, compare = NESGameGenie.decode(code)
		elif platform == Platform.SNES:
			address, value = SNESGameGenie.decode(code)
		elif platform == Platform.GAMEBOY:
			address, value, compare = GameBoyGameGenie.decode(code)
	
	elif from_type == CheatType.PRO_ACTION_REPLAY:
		if platform == Platform.NES:
			address, value = ProActionReplay.decode_nes(code)
		elif platform == Platform.SNES:
			address, value = ProActionReplay.decode_snes(code)
	
	elif from_type == CheatType.GAMESHARK:
		if platform == Platform.GAMEBOY:
			address, value = GameShark.decode_gb(code)
		elif platform == Platform.GBA:
			address, value, _ = GameShark.decode_gba(code)
	
	elif from_type == CheatType.RAW:
		# Parse raw format: $XXXX:YY or $XXXX?CC:YY
		code = code.strip()
		if code.startswith('$'):
			code = code[1:]
		
		if '?' in code:
			addr_part, rest = code.split('?')
			compare_part, value_part = rest.split(':')
			address = int(addr_part, 16)
			compare = int(compare_part, 16)
			value = int(value_part, 16)
		elif ':' in code:
			addr_part, value_part = code.split(':')
			address = int(addr_part, 16)
			value = int(value_part, 16)
	
	# Now encode to target format
	if to_type == CheatType.GAME_GENIE:
		if platform == Platform.NES:
			return NESGameGenie.encode(address, value, compare)
		elif platform == Platform.SNES:
			return SNESGameGenie.encode(address, value)
		elif platform == Platform.GAMEBOY:
			return GameBoyGameGenie.encode(address, value, compare)
	
	elif to_type == CheatType.PRO_ACTION_REPLAY:
		if platform == Platform.NES:
			return ProActionReplay.encode_nes(address, value)
		elif platform == Platform.SNES:
			return ProActionReplay.encode_snes(address, value)
	
	elif to_type == CheatType.GAMESHARK:
		if platform == Platform.GAMEBOY:
			return GameShark.encode_gb(address, value)
		elif platform == Platform.GBA:
			return GameShark.encode_gba(address, value)
	
	elif to_type == CheatType.RAW:
		if compare >= 0:
			return f"${address:04X}?{compare:02X}:{value:02X}"
		return f"${address:04X}:{value:02X}"
	
	raise ValueError(f"Cannot convert {from_type} to {to_type} for {platform}")


def generate_cheat(
	address: int,
	value: int,
	cheat_type: CheatType,
	platform: Platform,
	compare: int = -1
) -> str:
	"""Generate cheat code from address and value."""
	if cheat_type == CheatType.GAME_GENIE:
		if platform == Platform.NES:
			return NESGameGenie.encode(address, value, compare)
		elif platform == Platform.SNES:
			return SNESGameGenie.encode(address, value)
		elif platform == Platform.GAMEBOY:
			return GameBoyGameGenie.encode(address, value, compare)
	
	elif cheat_type == CheatType.PRO_ACTION_REPLAY:
		if platform == Platform.NES:
			return ProActionReplay.encode_nes(address, value)
		elif platform == Platform.SNES:
			return ProActionReplay.encode_snes(address, value)
	
	elif cheat_type == CheatType.GAMESHARK:
		if platform == Platform.GAMEBOY:
			return GameShark.encode_gb(address, value)
		elif platform == Platform.GBA:
			return GameShark.encode_gba(address, value)
	
	elif cheat_type == CheatType.RAW:
		if compare >= 0:
			return f"${address:04X}?{compare:02X}:{value:02X}"
		return f"${address:04X}:{value:02X}"
	
	raise ValueError(f"Cannot generate {cheat_type} for {platform}")


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Generate and convert cheat codes",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Supported Formats:
  game_genie - Game Genie codes (NES, SNES, GB)
  par        - Pro Action Replay (NES, SNES)
  gameshark  - GameShark (GB, GBA)
  raw        - Raw address:value format

Examples:
  %(prog)s decode SXIOPO --platform nes --type game_genie
  %(prog)s encode 0xC0DE 0xFF --platform nes --type game_genie
  %(prog)s convert SXIOPO --from game_genie --to par --platform nes
  %(prog)s batch cheats.txt -o output.txt --to gameshark --platform gb
		"""
	)
	
	subparsers = parser.add_subparsers(dest="command", help="Command to execute")
	
	# Decode command
	decode_parser = subparsers.add_parser("decode", help="Decode cheat code")
	decode_parser.add_argument("code", help="Cheat code to decode")
	decode_parser.add_argument("-p", "--platform", required=True,
		choices=["nes", "snes", "genesis", "gb", "gba"])
	decode_parser.add_argument("-t", "--type", required=True,
		choices=["game_genie", "par", "gameshark"])
	
	# Encode command
	encode_parser = subparsers.add_parser("encode", help="Encode cheat code")
	encode_parser.add_argument("address", help="Memory address (hex)")
	encode_parser.add_argument("value", help="Value to write (hex)")
	encode_parser.add_argument("-c", "--compare", help="Compare value (hex)")
	encode_parser.add_argument("-p", "--platform", required=True,
		choices=["nes", "snes", "genesis", "gb", "gba"])
	encode_parser.add_argument("-t", "--type", required=True,
		choices=["game_genie", "par", "gameshark", "raw"])
	
	# Convert command
	convert_parser = subparsers.add_parser("convert", help="Convert between formats")
	convert_parser.add_argument("code", help="Cheat code to convert")
	convert_parser.add_argument("-f", "--from", dest="from_type", required=True,
		choices=["game_genie", "par", "gameshark", "raw"])
	convert_parser.add_argument("-t", "--to", dest="to_type", required=True,
		choices=["game_genie", "par", "gameshark", "raw"])
	convert_parser.add_argument("-p", "--platform", required=True,
		choices=["nes", "snes", "genesis", "gb", "gba"])
	
	# Batch command
	batch_parser = subparsers.add_parser("batch", help="Batch convert codes")
	batch_parser.add_argument("input", help="Input file with codes")
	batch_parser.add_argument("-o", "--output", help="Output file")
	batch_parser.add_argument("-f", "--from", dest="from_type",
		choices=["game_genie", "par", "gameshark", "raw"])
	batch_parser.add_argument("-t", "--to", dest="to_type", required=True,
		choices=["game_genie", "par", "gameshark", "raw"])
	batch_parser.add_argument("-p", "--platform", required=True,
		choices=["nes", "snes", "genesis", "gb", "gba"])
	
	args = parser.parse_args()
	
	if not args.command:
		parser.print_help()
		return 1
	
	try:
		if args.command == "decode":
			platform = Platform(args.platform)
			cheat_type = CheatType(args.type)
			
			if cheat_type == CheatType.GAME_GENIE:
				if platform == Platform.NES:
					addr, val, cmp = NESGameGenie.decode(args.code)
				elif platform == Platform.SNES:
					addr, val = SNESGameGenie.decode(args.code)
					cmp = -1
				elif platform == Platform.GAMEBOY:
					addr, val, cmp = GameBoyGameGenie.decode(args.code)
				else:
					raise ValueError(f"Game Genie not supported for {platform}")
			elif cheat_type == CheatType.PRO_ACTION_REPLAY:
				if platform in [Platform.NES, Platform.SNES]:
					if platform == Platform.NES:
						addr, val = ProActionReplay.decode_nes(args.code)
					else:
						addr, val = ProActionReplay.decode_snes(args.code)
					cmp = -1
				else:
					raise ValueError(f"PAR not supported for {platform}")
			elif cheat_type == CheatType.GAMESHARK:
				if platform == Platform.GAMEBOY:
					addr, val = GameShark.decode_gb(args.code)
					cmp = -1
				elif platform == Platform.GBA:
					addr, val, _ = GameShark.decode_gba(args.code)
					cmp = -1
				else:
					raise ValueError(f"GameShark not supported for {platform}")
			
			print(f"Address: ${addr:04X} ({addr})")
			print(f"Value:   ${val:02X} ({val})")
			if cmp >= 0:
				print(f"Compare: ${cmp:02X} ({cmp})")
		
		elif args.command == "encode":
			platform = Platform(args.platform)
			cheat_type = CheatType(args.type)
			
			address = int(args.address, 16) if args.address.startswith('0x') else int(args.address, 16)
			value = int(args.value, 16) if args.value.startswith('0x') else int(args.value, 16)
			compare = int(args.compare, 16) if args.compare else -1
			
			code = generate_cheat(address, value, cheat_type, platform, compare)
			print(f"Code: {code}")
		
		elif args.command == "convert":
			platform = Platform(args.platform)
			from_type = CheatType(args.from_type)
			to_type = CheatType(args.to_type)
			
			result = convert_code(args.code, from_type, to_type, platform)
			print(f"Original: {args.code}")
			print(f"Converted: {result}")
		
		elif args.command == "batch":
			platform = Platform(args.platform)
			to_type = CheatType(args.to_type)
			from_type = CheatType(args.from_type) if args.from_type else None
			
			results = []
			with open(args.input, 'r') as f:
				for line in f:
					line = line.strip()
					if not line or line.startswith('#') or line.startswith(';'):
						results.append(line)
						continue
					
					try:
						# Auto-detect format if not specified
						actual_from = from_type
						if not actual_from:
							if '-' in line and len(line.replace('-', '')) in [6, 8]:
								actual_from = CheatType.GAME_GENIE
							elif ':' in line:
								actual_from = CheatType.RAW
							else:
								actual_from = CheatType.GAMESHARK
						
						converted = convert_code(line, actual_from, to_type, platform)
						results.append(f"{converted}  ; from {line}")
					except Exception as e:
						results.append(f"; ERROR: {line} - {e}")
			
			output_text = '\n'.join(results)
			
			if args.output:
				Path(args.output).write_text(output_text)
				print(f"Output saved to: {args.output}")
			else:
				print(output_text)
	
	except ValueError as e:
		print(f"Error: {e}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1
	
	return 0


if __name__ == "__main__":
	sys.exit(main())
