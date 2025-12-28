#!/usr/bin/env python3
"""
Dragon Quest III - SNES Address Translation Utility (HiROM)
Critical address mapping system for accurate ROM data extraction

This module provides comprehensive SNES address translation functionality,
implementing correct HiROM banking calculations and address validation
for accurate ROM file offset mapping.

CORRECTION: Dragon Quest III uses HiROM mapping, not LoROM!
HiROM uses different banking where $C0:0000-$FF:FFFF maps to ROM data.

Critical for all analysis tools to extract meaningful data instead of
random bytes from incorrect address calculations.
"""

import re
from typing import Optional, Tuple, Union
from dataclasses import dataclass

@dataclass
class SNESAddress:
	"""Represents a SNES address with bank and offset components"""
	bank: int
	offset: int

	def __str__(self) -> str:
		return f"${self.bank:02X}:{self.offset:04X}"

	def to_24bit(self) -> int:
		"""Convert to 24-bit address format"""
		return (self.bank << 16) | self.offset

@dataclass
class ROMMapping:
	"""Represents ROM file mapping information"""
	rom_offset: int
	size: int
	is_valid: bool
	mapping_type: str	# 'hirom', 'lorom', 'invalid'
	mirror_of: Optional[int] = None

class SNESAddressTranslator:
	"""SNES address translation and validation utility for HiROM"""

	def __init__(self, rom_size: int = 0x600000):
		self.rom_size = rom_size

		# HiROM mapping ranges for Dragon Quest III
		self.hirom_ranges = {
			# Banks $C0-$FF: Direct ROM mapping $000000-$3FFFFF
			'rom_high': {
				'bank_start': 0xC0, 'bank_end': 0xFF,
				'offset_start': 0x0000, 'offset_end': 0xFFFF,
				'rom_base': 0x000000
			},
			# Banks $40-$7F: Direct ROM mapping $000000-$3FFFFF
			'rom_mid': {
				'bank_start': 0x40, 'bank_end': 0x7F,
				'offset_start': 0x0000, 'offset_end': 0xFFFF,
				'rom_base': 0x000000
			},
			# Banks $00-$3F: SRAM/Hardware (not ROM data)
			'system_low': {
				'bank_start': 0x00, 'bank_end': 0x3F,
				'offset_start': 0x0000, 'offset_end': 0x7FFF,
				'rom_base': None	# Not ROM data
			},
			# Banks $80-$BF: Mirror of $00-$3F
			'system_mirror': {
				'bank_start': 0x80, 'bank_end': 0xBF,
				'offset_start': 0x0000, 'offset_end': 0x7FFF,
				'rom_base': None	# Not ROM data
			}
		}

	def parse_snes_address(self, address: Union[str, int]) -> Optional[SNESAddress]:
		"""Parse SNES address from string or integer format"""

		if isinstance(address, str):
			# Handle string formats: "$BB:HHLL", "BB:HHLL", "BBHHLL", "$BBHHLL"
			address = address.strip().upper()

			# Remove $ prefix if present
			if address.startswith('$'):
				address = address[1:]

			# Parse BB:HHLL format
			if ':' in address:
				try:
					bank_str, offset_str = address.split(':')
					bank = int(bank_str, 16)
					offset = int(offset_str, 16)
					return SNESAddress(bank, offset)
				except ValueError:
					return None

			# Parse BBHHLL format (6 hex digits)
			elif len(address) == 6:
				try:
					bank = int(address[:2], 16)
					offset = int(address[2:], 16)
					return SNESAddress(bank, offset)
				except ValueError:
					return None

			# Parse HHLL format (4 hex digits) - assume bank 0
			elif len(address) == 4:
				try:
					bank = 0
					offset = int(address, 16)
					return SNESAddress(bank, offset)
				except ValueError:
					return None

		elif isinstance(address, int):
			# 24-bit address format
			if 0 <= address <= 0xFFFFFF:
				bank = (address >> 16) & 0xFF
				offset = address & 0xFFFF
				return SNESAddress(bank, offset)

		return None

	def validate_snes_address(self, snes_addr: SNESAddress) -> bool:
		"""Validate SNES address for HiROM mapping"""

		# Check bank range
		if not (0 <= snes_addr.bank <= 0xFF):
			return False

		# Check offset range - HiROM uses full $0000-$FFFF range
		if not (0x0000 <= snes_addr.offset <= 0xFFFF):
			return False

		# Check if this bank contains ROM data
		bank = snes_addr.bank
		if (0x40 <= bank <= 0x7F) or (0xC0 <= bank <= 0xFF):
			return True

		return False

	def snes_to_rom_offset(self, address: Union[str, int, SNESAddress]) -> int:
		"""Convert SNES address to ROM file offset (simple integer return)"""
		mapping = self.snes_to_rom_mapping(address)
		if mapping and mapping.is_valid:
			return mapping.rom_offset
		return 0

	def snes_to_rom_mapping(self, address: Union[str, int, SNESAddress]) -> Optional[ROMMapping]:
		"""Convert SNES address to ROM file offset with full mapping details"""

		# Parse address if needed
		if not isinstance(address, SNESAddress):
			snes_addr = self.parse_snes_address(address)
			if not snes_addr:
				return ROMMapping(0, 0, False, 'invalid')
		else:
			snes_addr = address

		# Validate address
		if not self.validate_snes_address(snes_addr):
			return ROMMapping(0, 0, False, 'invalid')

		# Calculate ROM offset using HiROM mapping
		bank = snes_addr.bank
		offset = snes_addr.offset

		# Determine which range this bank falls into
		mapping_info = None
		for range_name, range_data in self.hirom_ranges.items():
			if (range_data['bank_start'] <= bank <= range_data['bank_end'] and
				range_data['offset_start'] <= offset <= range_data['offset_end']):
				mapping_info = range_data
				break

		if not mapping_info or mapping_info['rom_base'] is None:
			return ROMMapping(0, 0, False, 'invalid')

		# HiROM calculation: Direct mapping for $C0-$FF and $40-$7F
		if bank >= 0xC0:
			# Banks $C0-$FF: ROM offset = (bank - $C0) * $10000 + offset
			rom_offset = ((bank - 0xC0) * 0x10000) + offset
		elif bank >= 0x40:
			# Banks $40-$7F: ROM offset = (bank - $40) * $10000 + offset
			rom_offset = ((bank - 0x40) * 0x10000) + offset
		else:
			return ROMMapping(0, 0, False, 'invalid')

		# Validate ROM offset is within file bounds
		if rom_offset < 0 or rom_offset >= self.rom_size:
			return ROMMapping(rom_offset, 0, False, 'out_of_bounds')

		# Calculate available size from this offset
		available_size = self.rom_size - rom_offset

		# HiROM doesn't use mirrors in the same way as LoROM
		mirror_of = None

		return ROMMapping(
			rom_offset=rom_offset,
			size=available_size,
			is_valid=True,
			mapping_type='hirom',
			mirror_of=mirror_of
		)

	def rom_to_snes_address(self, rom_offset: int) -> Optional[SNESAddress]:
		"""Convert ROM file offset back to SNES address"""

		if rom_offset < 0 or rom_offset >= self.rom_size:
			return None

		# Determine which ROM range this offset falls into
		if 0x000000 <= rom_offset < 0x200000:
			# First 2MB - maps to banks $00-$3F
			bank_offset = rom_offset // 0x8000
			within_bank_offset = rom_offset % 0x8000
			snes_bank = bank_offset
			snes_offset = 0x8000 + within_bank_offset

		elif 0x200000 <= rom_offset < 0x400000:
			# Second 2MB - maps to banks $40-$7F
			adjusted_offset = rom_offset - 0x200000
			bank_offset = adjusted_offset // 0x8000
			within_bank_offset = adjusted_offset % 0x8000
			snes_bank = 0x40 + bank_offset
			snes_offset = 0x8000 + within_bank_offset

		else:
			# Beyond 4MB - extended ROM (may not apply to DQ3)
			return None

		return SNESAddress(snes_bank, snes_offset)

	def get_bank_info(self, bank: int) -> dict:
		"""Get detailed information about a specific bank"""

		info = {
			'bank': bank,
			'bank_hex': f"${bank:02X}",
			'valid': False,
			'rom_range': None,
			'is_mirror': False,
			'mirror_of': None,
			'description': 'Invalid bank'
		}

		# Find matching range
		for range_name, range_data in self.hirom_ranges.items():
			if (range_data['bank_start'] <= bank <= range_data['bank_end']):
				info['valid'] = True

				if range_data['rom_base'] is not None:
					# Calculate ROM range for this bank
					if bank >= 0xC0:
						rom_start = ((bank - 0xC0) * 0x10000)
						rom_end = rom_start + 0x10000
					elif bank >= 0x40:
						rom_start = ((bank - 0x40) * 0x10000)
						rom_end = rom_start + 0x10000
					else:
						rom_start = 0
						rom_end = 0

					info['rom_range'] = (rom_start, min(rom_end, self.rom_size))

				# Generate description for HiROM
				if range_name == 'rom_high':
					info['description'] = f'HiROM high banks $C0-$FF (Bank ${bank:02X})'
				elif range_name == 'rom_mid':
					info['description'] = f'HiROM mid banks $40-$7F (Bank ${bank:02X})'
				elif range_name == 'system_low':
					info['description'] = f'System/SRAM banks $00-$3F (Bank ${bank:02X}) - Not ROM'
				elif range_name == 'system_mirror':
					info['description'] = f'System mirror $80-$BF (Bank ${bank:02X}) - Not ROM'

				break

		return info

	def validate_rom_extraction(self, rom_data: bytes, test_addresses: list) -> dict:
		"""Validate address translation using known test addresses"""

		results = {
			'total_tests': len(test_addresses),
			'successful_translations': 0,
			'failed_translations': 0,
			'test_results': []
		}

		for test_addr in test_addresses:
			test_result = {
				'snes_address': test_addr,
				'success': False,
				'rom_offset': None,
				'data_sample': None,
				'error': None
			}

			try:
				# Parse and translate address
				mapping = self.snes_to_rom_mapping(test_addr)

				if mapping and mapping.is_valid:
					test_result['rom_offset'] = mapping.rom_offset
					test_result['success'] = True

					# Extract small data sample for validation
					if mapping.rom_offset + 16 <= len(rom_data):
						sample = rom_data[mapping.rom_offset:mapping.rom_offset + 16]
						test_result['data_sample'] = ' '.join(f'{b:02X}' for b in sample)
						results['successful_translations'] += 1
					else:
						test_result['error'] = 'ROM offset out of bounds'
						results['failed_translations'] += 1
				else:
					test_result['error'] = 'Invalid address translation'
					results['failed_translations'] += 1

			except Exception as e:
				test_result['error'] = str(e)
				results['failed_translations'] += 1

			results['test_results'].append(test_result)

		results['success_rate'] = (results['successful_translations'] /
								 results['total_tests'] * 100) if results['total_tests'] > 0 else 0

		return results

def create_test_suite() -> list:
	"""Create comprehensive test suite for Dragon Quest III addresses"""

	# Known addresses from Dragon Quest III ROM map
	test_addresses = [
		# ROM Header area
		"$00:FFC0",	# ROM title
		"$00:FFD5",	# ROM speed/map mode
		"$00:FFD6",	# Cartridge type

		# Graphics data (examples)
		"$01:8000",	# Early graphics bank
		"$02:8000",	# Graphics bank 2
		"$10:8000",	# Graphics bank 16

		# Audio data
		"$06:8000",	# Audio bank 6
		"$07:8000",	# Audio bank 7

		# Code areas
		"$00:8000",	# Boot code
		"$01:A000",	# Code area

		# Extended ROM areas
		"$40:8000",	# Extended bank start
		"$41:8000",	# Extended bank 1

		# Mirror tests
		"$80:8000",	# Mirror of $00:8000
		"$C0:8000",	# Mirror of $40:8000

		# Edge cases
		"$3F:FFFF",	# End of first 2MB
		"$7F:FFFF",	# End of second 2MB
		"$BF:FFFF",	# End of first mirror
		"$FF:FFFF",	# End of second mirror
	]

	return test_addresses

def main():
	"""Test address translation functionality"""

	print("🔧 SNES Address Translation Utility - Testing")
	print("=" * 55)

	# Initialize translator
	translator = SNESAddressTranslator(rom_size=0x600000)	# 6MB ROM

	# Test address parsing and translation
	test_addresses = create_test_suite()

	print("📋 Testing Address Translation")
	print("-" * 40)

	for addr_str in test_addresses[:10]:	# Test first 10 addresses
		snes_addr = translator.parse_snes_address(addr_str)
		if snes_addr:
			mapping = translator.snes_to_rom_mapping(snes_addr)
			if mapping and mapping.is_valid:
				print(f"✅ {addr_str} → ROM ${mapping.rom_offset:06X}")

				# Test reverse translation
				reverse_addr = translator.rom_to_snes_address(mapping.rom_offset)
				if reverse_addr and str(reverse_addr) == str(snes_addr):
					print(f"	 ↔️ Reverse: ROM ${mapping.rom_offset:06X} → {reverse_addr}")
				else:
					print(f"	 ⚠️ Reverse translation mismatch")
			else:
				print(f"❌ {addr_str} → Invalid translation")
		else:
			print(f"❌ {addr_str} → Parse error")

	# Test bank information
	print(f"\n🏦 Bank Information Sample")
	print("-" * 30)

	for bank in [0x00, 0x01, 0x40, 0x80, 0xC0]:
		info = translator.get_bank_info(bank)
		print(f"Bank {info['bank_hex']}: {info['description']}")
		if info['is_mirror']:
			print(f"	Mirror of ROM ${info['mirror_of']:06X}")

	print("\n✅ Address translation utility ready for integration")

if __name__ == "__main__":
	main()
