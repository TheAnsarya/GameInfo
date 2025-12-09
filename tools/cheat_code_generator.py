#!/usr/bin/env python3
"""
Cheat Code Generator
Generate cheat codes for various emulator formats from RAM addresses and values.

Supports:
- Game Genie (NES, SNES, Genesis)
- Pro Action Replay (SNES, GBA)
- GameShark (N64, PS1, GBA)
- Raw/hex codes
- Code conversion between formats
"""

import argparse
import json
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional


class CodeFormat(Enum):
	"""Supported cheat code formats."""
	RAW = "raw"
	GAME_GENIE_NES = "gg_nes"
	GAME_GENIE_SNES = "gg_snes"
	GAME_GENIE_GENESIS = "gg_genesis"
	PRO_ACTION_REPLAY_SNES = "par_snes"
	PRO_ACTION_REPLAY_GBA = "par_gba"
	GAMESHARK_N64 = "gs_n64"
	GAMESHARK_PS1 = "gs_ps1"
	GAMESHARK_GBA = "gs_gba"


@dataclass
class CheatCode:
	"""A cheat code with metadata."""
	address: int
	value: int
	compare: Optional[int] = None  # For conditional codes
	format: CodeFormat = CodeFormat.RAW
	name: str = ""
	description: str = ""
	encoded: str = ""

	def to_dict(self) -> dict:
		"""Convert to dictionary."""
		return {
			"address": f"${self.address:06x}",
			"value": f"${self.value:02x}",
			"compare": f"${self.compare:02x}" if self.compare is not None else None,
			"format": self.format.value,
			"name": self.name,
			"description": self.description,
			"code": self.encoded
		}


# Game Genie encoding tables
GG_NES_CHARS = "APZLGITYEOXUKSVN"
GG_SNES_CHARS = "DF4709156BC8A23E"
GG_GENESIS_CHARS = "ABCDEFGHJKLMNPRSTVWXYZ0123456789"


class CheatCodeGenerator:
	"""Generate and convert cheat codes."""

	def __init__(self):
		pass

	def generate(self, address: int, value: int, format: CodeFormat,
	             compare: int = None, name: str = "", description: str = "") -> CheatCode:
		"""
		Generate a cheat code.

		Args:
			address: RAM/ROM address
			value: Value to set
			format: Output format
			compare: Compare value (for 8-char NES codes)
			name: Code name
			description: Code description

		Returns:
			CheatCode with encoded string
		"""
		code = CheatCode(
			address=address,
			value=value,
			compare=compare,
			format=format,
			name=name,
			description=description
		)

		if format == CodeFormat.GAME_GENIE_NES:
			code.encoded = self._encode_gg_nes(address, value, compare)
		elif format == CodeFormat.GAME_GENIE_SNES:
			code.encoded = self._encode_gg_snes(address, value)
		elif format == CodeFormat.GAME_GENIE_GENESIS:
			code.encoded = self._encode_gg_genesis(address, value)
		elif format == CodeFormat.PRO_ACTION_REPLAY_SNES:
			code.encoded = self._encode_par_snes(address, value)
		elif format == CodeFormat.PRO_ACTION_REPLAY_GBA:
			code.encoded = self._encode_par_gba(address, value)
		elif format == CodeFormat.GAMESHARK_N64:
			code.encoded = self._encode_gs_n64(address, value)
		elif format == CodeFormat.GAMESHARK_PS1:
			code.encoded = self._encode_gs_ps1(address, value)
		elif format == CodeFormat.GAMESHARK_GBA:
			code.encoded = self._encode_gs_gba(address, value)
		else:
			code.encoded = f"${address:06X}:${value:02X}"

		return code

	def _encode_gg_nes(self, address: int, value: int, compare: int = None) -> str:
		"""
		Encode NES Game Genie code.

		6-char format: AAAA VV
		8-char format: AAAA VV CC (with compare)
		"""
		# Address is in CPU space ($8000-$FFFF mapped to $0000-$7FFF)
		if address >= 0x8000:
			address -= 0x8000

		# Build the code
		n0 = ((value >> 4) & 0x08) | (value & 0x07)
		n1 = ((address >> 4) & 0x08) | ((value >> 4) & 0x07)
		n2 = (address & 0x08) | ((address >> 8) & 0x07)
		n3 = ((address >> 4) & 0x07) | ((address >> 12) & 0x08)
		n4 = ((address >> 12) & 0x07) | ((value >> 4) & 0x08)
		n5 = ((address >> 8) & 0x08) | ((address >> 4) & 0x07)

		if compare is not None:
			# 8-character code
			n5 = ((address >> 8) & 0x08) | (compare & 0x07)
			n6 = ((compare >> 4) & 0x08) | ((compare >> 4) & 0x07)
			n7 = (compare & 0x08) | ((address >> 4) & 0x07)

			return "".join([
				GG_NES_CHARS[n0], GG_NES_CHARS[n1], GG_NES_CHARS[n2],
				GG_NES_CHARS[n3], GG_NES_CHARS[n4], GG_NES_CHARS[n5],
				GG_NES_CHARS[n6], GG_NES_CHARS[n7]
			])
		else:
			# 6-character code
			return "".join([
				GG_NES_CHARS[n0], GG_NES_CHARS[n1], GG_NES_CHARS[n2],
				GG_NES_CHARS[n3], GG_NES_CHARS[n4], GG_NES_CHARS[n5]
			])

	def _encode_gg_snes(self, address: int, value: int) -> str:
		"""
		Encode SNES Game Genie code.

		Format: AAAA-BBCC
		"""
		# SNES Game Genie uses a specific encoding
		raw = ((address & 0xf) << 20) | ((address & 0xf0) << 12) | \
		      ((address & 0xf00) << 4) | ((address & 0xf000) >> 4) | \
		      ((address & 0xf0000) >> 12) | ((address & 0xf00000) >> 20) | \
		      ((value & 0xf) << 4) | ((value & 0xf0) >> 4)

		# Convert to characters
		chars = []
		for i in range(8):
			idx = (raw >> (28 - i * 4)) & 0xf
			chars.append(GG_SNES_CHARS[idx])

		code = "".join(chars)
		return f"{code[:4]}-{code[4:]}"

	def _encode_gg_genesis(self, address: int, value: int) -> str:
		"""
		Encode Genesis/Mega Drive Game Genie code.

		Format: AAAA-BBBB (8 chars)
		"""
		# Genesis Game Genie encoding
		# Address and data are interleaved
		encoded = (value << 16) | address

		chars = []
		for i in range(8):
			idx = (encoded >> (28 - i * 4)) & 0x1f
			chars.append(GG_GENESIS_CHARS[idx])

		code = "".join(chars)
		return f"{code[:4]}-{code[4:]}"

	def _encode_par_snes(self, address: int, value: int) -> str:
		"""
		Encode SNES Pro Action Replay code.

		Format: 7EAAAA:VV
		"""
		# PAR uses direct address format
		# 7E prefix for RAM
		if address < 0x7e0000:
			address = 0x7e0000 | (address & 0xffff)
		return f"{address:06X}:{value:02X}"

	def _encode_par_gba(self, address: int, value: int) -> str:
		"""
		Encode GBA Pro Action Replay code.

		Format: XXXXXXXX YYYYYYYY
		"""
		# Type based on write size
		code_type = 0x00  # 8-bit write
		return f"{code_type:02X}{address:06X} {value:08X}"

	def _encode_gs_n64(self, address: int, value: int) -> str:
		"""
		Encode N64 GameShark code.

		Format: 80XXXXXX YYYY
		"""
		# 80 = constant write
		return f"80{address:06X} {value:04X}"

	def _encode_gs_ps1(self, address: int, value: int) -> str:
		"""
		Encode PS1 GameShark code.

		Format: 80XXXXXX YYYY
		"""
		# Similar to N64
		return f"80{address:06X} {value:04X}"

	def _encode_gs_gba(self, address: int, value: int) -> str:
		"""
		Encode GBA GameShark code.

		Format: XXXXXXXX YYYYYYYY
		"""
		# Master code prefix sometimes needed
		return f"0{address:07X} {value:08X}"

	def decode(self, code: str, format: CodeFormat) -> Optional[CheatCode]:
		"""
		Decode a cheat code string.

		Args:
			code: Encoded code string
			format: Code format

		Returns:
			Decoded CheatCode or None if invalid
		"""
		code = code.upper().replace(" ", "").replace("-", "")

		if format == CodeFormat.GAME_GENIE_NES:
			return self._decode_gg_nes(code)
		elif format == CodeFormat.PRO_ACTION_REPLAY_SNES:
			return self._decode_par_snes(code)
		elif format == CodeFormat.GAMESHARK_N64:
			return self._decode_gs_n64(code)

		return None

	def _decode_gg_nes(self, code: str) -> Optional[CheatCode]:
		"""Decode NES Game Genie code."""
		if len(code) not in (6, 8):
			return None

		try:
			values = [GG_NES_CHARS.index(c) for c in code]
		except ValueError:
			return None

		# Decode address and value
		address = (
			((values[3] & 0x07) << 12) |
			((values[5] & 0x07) << 8) |
			((values[4] & 0x08) << 8) |
			((values[2] & 0x07) << 4) |
			((values[1] & 0x08) << 0) |
			((values[4] & 0x07) << 0)
		)
		address += 0x8000

		value = (
			((values[1] & 0x07) << 4) |
			((values[0] & 0x08) << 0) |
			((values[0] & 0x07) << 0)
		)

		compare = None
		if len(code) == 8:
			compare = (
				((values[6] & 0x07) << 4) |
				((values[5] & 0x08) >> 0) |
				((values[7] & 0x08) >> 0) |
				((values[5] & 0x07) << 0)
			)

		return CheatCode(
			address=address,
			value=value,
			compare=compare,
			format=CodeFormat.GAME_GENIE_NES,
			encoded=code
		)

	def _decode_par_snes(self, code: str) -> Optional[CheatCode]:
		"""Decode SNES PAR code."""
		code = code.replace(":", "")
		if len(code) != 8:
			return None

		try:
			address = int(code[:6], 16)
			value = int(code[6:8], 16)
		except ValueError:
			return None

		return CheatCode(
			address=address,
			value=value,
			format=CodeFormat.PRO_ACTION_REPLAY_SNES,
			encoded=f"{address:06X}:{value:02X}"
		)

	def _decode_gs_n64(self, code: str) -> Optional[CheatCode]:
		"""Decode N64 GameShark code."""
		if len(code) != 12:
			return None

		try:
			address = int(code[2:8], 16)
			value = int(code[8:12], 16)
		except ValueError:
			return None

		return CheatCode(
			address=address,
			value=value,
			format=CodeFormat.GAMESHARK_N64,
			encoded=f"80{address:06X} {value:04X}"
		)

	def convert(self, code: CheatCode, target_format: CodeFormat) -> CheatCode:
		"""
		Convert code between formats.

		Args:
			code: Source code
			target_format: Target format

		Returns:
			New CheatCode in target format
		"""
		return self.generate(
			address=code.address,
			value=code.value,
			format=target_format,
			compare=code.compare,
			name=code.name,
			description=code.description
		)

	def generate_common_codes(self, platform: str) -> list[dict]:
		"""
		Generate templates for common cheat types.

		Args:
			platform: Target platform (nes, snes, gba, etc.)

		Returns:
			List of code templates
		"""
		templates = []

		if platform.lower() == "nes":
			templates = [
				{"name": "Infinite Lives", "address": "????", "value": "99", "type": "lives"},
				{"name": "Infinite Health", "address": "????", "value": "FF", "type": "health"},
				{"name": "Max Score", "address": "????", "value": "99", "type": "score"},
				{"name": "Invincibility", "address": "????", "value": "01", "type": "invuln"},
				{"name": "Start with All Items", "address": "????", "value": "FF", "type": "items"},
			]
		elif platform.lower() == "snes":
			templates = [
				{"name": "Infinite Lives", "address": "7E????", "value": "63", "type": "lives"},
				{"name": "Infinite Health", "address": "7E????", "value": "FF", "type": "health"},
				{"name": "Max Money", "address": "7E????", "value": "FFFF", "type": "money"},
				{"name": "No Encounters", "address": "7E????", "value": "00", "type": "encounter"},
				{"name": "Walk Through Walls", "address": "7E????", "value": "00", "type": "clip"},
			]
		elif platform.lower() == "gba":
			templates = [
				{"name": "Infinite HP", "address": "02??????", "value": "03E7", "type": "health"},
				{"name": "Max Money", "address": "02??????", "value": "0F423F", "type": "money"},
				{"name": "Instant Win Battles", "address": "02??????", "value": "00", "type": "battle"},
			]

		return templates


def main():
	parser = argparse.ArgumentParser(
		description="Generate and convert cheat codes",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Formats:
  raw            Raw hex address:value
  gg_nes         NES Game Genie
  gg_snes        SNES Game Genie
  gg_genesis     Genesis Game Genie
  par_snes       SNES Pro Action Replay
  par_gba        GBA Pro Action Replay
  gs_n64         N64 GameShark
  gs_ps1         PS1 GameShark
  gs_gba         GBA GameShark

Examples:
  %(prog)s --address 0x036D --value 99 --format gg_nes
  %(prog)s --decode SXIOPO --format gg_nes
  %(prog)s --address 0x7E0DBF --value 99 --format par_snes
  %(prog)s --convert "SXIOPO" --from gg_nes --to par_snes
		"""
	)

	parser.add_argument("--address", "-a", type=lambda x: int(x, 0),
	                    help="Address to modify")
	parser.add_argument("--value", "-v", type=lambda x: int(x, 0),
	                    help="Value to set")
	parser.add_argument("--compare", "-c", type=lambda x: int(x, 0),
	                    help="Compare value (NES 8-char codes)")
	parser.add_argument("--format", "-f", default="raw",
	                    help="Output format")
	parser.add_argument("--decode", "-d", help="Decode a cheat code")
	parser.add_argument("--convert", help="Code to convert")
	parser.add_argument("--from", dest="from_fmt", help="Source format (for convert)")
	parser.add_argument("--to", dest="to_fmt", help="Target format (for convert)")
	parser.add_argument("--templates", help="Show code templates for platform")
	parser.add_argument("--name", "-n", default="", help="Code name")
	parser.add_argument("--desc", default="", help="Code description")
	parser.add_argument("--json", action="store_true", help="Output as JSON")

	args = parser.parse_args()
	gen = CheatCodeGenerator()

	if args.templates:
		templates = gen.generate_common_codes(args.templates)
		if args.json:
			print(json.dumps(templates, indent="\t"))
		else:
			print(f"Code templates for {args.templates.upper()}:")
			for t in templates:
				print(f"  {t['name']}: Address={t['address']} Value={t['value']}")
		return

	if args.decode:
		try:
			code_format = CodeFormat(args.format)
		except:
			print(f"Unknown format: {args.format}")
			return

		code = gen.decode(args.decode, code_format)
		if code:
			if args.json:
				print(json.dumps(code.to_dict(), indent="\t"))
			else:
				print(f"Decoded: {args.decode}")
				print(f"  Address: ${code.address:06X}")
				print(f"  Value:   ${code.value:02X}")
				if code.compare is not None:
					print(f"  Compare: ${code.compare:02X}")
		else:
			print(f"Failed to decode: {args.decode}")
		return

	if args.convert:
		if not args.from_fmt or not args.to_fmt:
			print("--from and --to required for conversion")
			return

		try:
			from_format = CodeFormat(args.from_fmt)
			to_format = CodeFormat(args.to_fmt)
		except:
			print("Invalid format")
			return

		original = gen.decode(args.convert, from_format)
		if original:
			converted = gen.convert(original, to_format)
			if args.json:
				print(json.dumps(converted.to_dict(), indent="\t"))
			else:
				print(f"Original ({from_format.value}): {args.convert}")
				print(f"Converted ({to_format.value}): {converted.encoded}")
		else:
			print(f"Failed to decode: {args.convert}")
		return

	if args.address is not None and args.value is not None:
		try:
			code_format = CodeFormat(args.format)
		except:
			print(f"Unknown format: {args.format}")
			return

		code = gen.generate(
			address=args.address,
			value=args.value,
			format=code_format,
			compare=args.compare,
			name=args.name,
			description=args.desc
		)

		if args.json:
			print(json.dumps(code.to_dict(), indent="\t"))
		else:
			print(f"Generated code ({code_format.value}):")
			print(f"  Code: {code.encoded}")
			print(f"  Address: ${code.address:06X}")
			print(f"  Value: ${code.value:02X}")
			if code.compare is not None:
				print(f"  Compare: ${code.compare:02X}")
		return

	parser.print_help()


if __name__ == "__main__":
	main()
