#!/usr/bin/env python3
"""
Soul Blazer (SNES) Deep ROM Scanner
Scans for text, graphics, music, and data structures.
"""

import struct
from pathlib import Path


def load_rom(rom_path: str) -> bytes:
	"""Load ROM data."""
	with open(rom_path, 'rb') as f:
		return f.read()


def lorom_to_file(bank: int, addr: int) -> int:
	"""Convert LoROM CPU address to file offset."""
	# LoROM: banks $00-$3f, $80-$bf map to ROM
	# CPU addr $8000-$ffff in each bank
	if bank >= 0x80:
		bank -= 0x80
	return bank * 0x8000 + (addr & 0x7fff)


def file_to_lorom(offset: int) -> tuple:
	"""Convert file offset to LoROM bank:address."""
	bank = offset // 0x8000
	addr = 0x8000 + (offset % 0x8000)
	return bank, addr


def find_text_with_encoding(rom: bytes, start: int = 0, end: int = None) -> list:
	"""
	Find text using Soul Blazer's text encoding.
	Soul Blazer uses a custom encoding with control codes.
	"""
	if end is None:
		end = len(rom)

	text_blocks = []
	i = start

	while i < end - 10:
		# Look for sequences that look like dialogue
		# Soul Blazer text often starts with control codes
		block_start = i
		text = []
		valid_chars = 0

		while i < end:
			b = rom[i]

			# Standard ASCII range (space to ~)
			if 0x20 <= b <= 0x7e:
				text.append(chr(b))
				valid_chars += 1
				i += 1
			# Newline/control codes
			elif b in (0x00, 0x01, 0x02, 0x03, 0x0a, 0x0d):
				if b == 0x00:
					# End of string
					break
				elif b == 0x01:
					text.append('[NL]')
				elif b == 0x02:
					text.append('[WAIT]')
				elif b == 0x03:
					text.append('[END]')
				i += 1
			else:
				# Unknown byte - might be control code or end
				break

		if valid_chars >= 10 and len(text) > 0:
			bank, addr = file_to_lorom(block_start)
			text_blocks.append({
				'file_offset': block_start,
				'bank': bank,
				'address': addr,
				'length': i - block_start,
				'text': ''.join(text)[:200],
				'full_text': ''.join(text),
			})

		i += 1

	return text_blocks


def find_4bpp_graphics(rom: bytes) -> list:
	"""
	Find potential 4BPP tile graphics.
	SNES 4BPP tiles are 8x8 pixels, 32 bytes each.
	"""
	tiles = []

	# Look for sections with typical tile data patterns
	# 4BPP tiles have 4 bytes per row (8 pixels * 4 bits / 8)
	# Organized as: plane0, plane1 interleaved (16 bytes), then plane2, plane3 (16 bytes)

	for offset in range(0, len(rom) - 0x2000, 0x20):
		# Check if this looks like tile data
		# Tile data typically has some variety but not completely random
		chunk = rom[offset:offset+0x200]  # 16 tiles

		# Count unique bytes - graphics usually have moderate variety
		unique = len(set(chunk))

		# Graphics typically have 10-200 unique values per 512 bytes
		if 10 <= unique <= 200:
			# Check if it looks like actual graphics patterns
			# (not all zeros, not all same value)
			if chunk.count(0x00) < 256 and chunk.count(0xff) < 256:
				bank, addr = file_to_lorom(offset)
				tiles.append({
					'file_offset': offset,
					'bank': bank,
					'address': addr,
					'unique_bytes': unique,
				})

	return tiles


def find_potential_tables(rom: bytes) -> dict:
	"""Find potential data tables in the ROM."""
	tables = {
		'pointer_tables': [],
		'byte_tables': [],
		'word_tables': [],
	}

	# Scan for pointer tables (consecutive 16-bit values in $8000-$ffff range)
	for offset in range(0, len(rom) - 32, 2):
		count = 0
		for i in range(16):
			ptr = struct.unpack('<H', rom[offset + i*2:offset + i*2 + 2])[0]
			if 0x8000 <= ptr <= 0xffff:
				count += 1
			else:
				break

		if count >= 8:
			bank, addr = file_to_lorom(offset)
			tables['pointer_tables'].append({
				'file_offset': offset,
				'bank': bank,
				'address': addr,
				'count': count,
				'sample': [struct.unpack('<H', rom[offset + i*2:offset + i*2 + 2])[0]
				          for i in range(min(count, 8))],
			})

	# Scan for byte tables (repeated small value patterns)
	for offset in range(0, len(rom) - 64, 1):
		chunk = rom[offset:offset+64]
		unique = len(set(chunk))
		# Tables often have limited value ranges
		if 4 <= unique <= 32:
			max_val = max(chunk)
			if max_val <= 0x40:  # Small values suggest table data
				bank, addr = file_to_lorom(offset)
				tables['byte_tables'].append({
					'file_offset': offset,
					'bank': bank,
					'address': addr,
					'max_value': max_val,
					'unique_values': unique,
				})

	return tables


def scan_for_music_data(rom: bytes) -> list:
	"""
	Find potential SPC700 music data.
	SNES music often has distinctive patterns.
	"""
	music_blocks = []

	# Look for N-SPC or other music driver signatures
	signatures = [
		b'N-SPC',
		b'ARAM',
	]

	for sig in signatures:
		idx = 0
		while True:
			idx = rom.find(sig, idx)
			if idx == -1:
				break
			bank, addr = file_to_lorom(idx)
			music_blocks.append({
				'file_offset': idx,
				'bank': bank,
				'address': addr,
				'signature': sig.decode('ascii', errors='replace'),
			})
			idx += 1

	return music_blocks


def analyze_bank_contents(rom: bytes) -> list:
	"""Analyze what each bank likely contains."""
	banks = []
	num_banks = len(rom) // 0x8000

	for bank in range(num_banks):
		start = bank * 0x8000
		end = start + 0x8000
		data = rom[start:end]

		# Calculate statistics
		zeros = data.count(0x00)
		ffs = data.count(0xff)
		unique = len(set(data))

		# Classify bank content
		if zeros > 0x6000:
			content_type = "Mostly empty"
		elif ffs > 0x6000:
			content_type = "Mostly unused (FF)"
		elif unique < 50:
			content_type = "Compressed or repetitive data"
		elif unique > 230:
			content_type = "Code or varied data"
		else:
			content_type = "Mixed data/graphics"

		# Check for text
		text_count = sum(1 for b in data if 0x20 <= b <= 0x7e)

		banks.append({
			'bank': bank,
			'file_offset': start,
			'zeros': zeros,
			'ffs': ffs,
			'unique': unique,
			'text_bytes': text_count,
			'content_type': content_type,
		})

	return banks


if __name__ == '__main__':
	rom_path = r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc"
	rom = load_rom(rom_path)

	print("=" * 60)
	print("Soul Blazer Deep ROM Scan")
	print("=" * 60)

	# Analyze banks
	print("\n=== Bank Content Analysis ===")
	banks = analyze_bank_contents(rom)
	for b in banks:
		print(f"  Bank ${b['bank']:02x} (${b['file_offset']:06x}): {b['content_type']}")
		print(f"    Unique bytes: {b['unique']}, Text chars: {b['text_bytes']}, Zeros: {b['zeros']}")

	# Find text
	print("\n=== Text Blocks Found ===")
	text_blocks = find_text_with_encoding(rom)
	for t in text_blocks[:20]:
		print(f"  ${t['file_offset']:06x} (${t['bank']:02x}:{t['address']:04x}): {t['text'][:60]}...")

	# Find potential tables
	print("\n=== Pointer Tables Found ===")
	tables = find_potential_tables(rom)
	for t in tables['pointer_tables'][:10]:
		ptrs = ', '.join([f'${p:04x}' for p in t['sample'][:4]])
		print(f"  ${t['file_offset']:06x}: {t['count']} pointers - {ptrs}...")

	# Find music data
	print("\n=== Music Data Signatures ===")
	music = scan_for_music_data(rom)
	for m in music:
		print(f"  ${m['file_offset']:06x}: {m['signature']}")

	# Summary
	print("\n=== Summary ===")
	print(f"  Text blocks found: {len(text_blocks)}")
	print(f"  Pointer tables: {len(tables['pointer_tables'])}")
	print(f"  Byte tables: {len(tables['byte_tables'])}")
