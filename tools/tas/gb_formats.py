#!/usr/bin/env python3
"""
Game Boy / GBA TAS Format Parsers

Supports:
- VBM (Visual Boy Advance) - Binary format, read/write
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Optional

from tas_formats import GbButtons, GbaButtons, TASSystem


@dataclass
class FrameInput:
	"""Input data for a single frame."""
	controllers: List[int] = field(default_factory=list)
	commands: int = 0
	reset: bool = False


@dataclass
class MovieInfo:
	"""Common movie metadata."""
	title: str = ""
	author: str = ""
	description: str = ""
	rom_name: str = ""
	rom_checksum: str = ""
	rom_crc32: int = 0
	sha1: str = ""
	frame_count: int = 0
	rerecord_count: int = 0
	controllers: int = 1
	region: str = ""
	system: str = TASSystem.GB
	frames: List[FrameInput] = field(default_factory=list)
	start_from_savestate: bool = False
	is_gba: bool = False
	is_gbc: bool = False
	is_sgb: bool = False


# =============================================================================
# VBM Format (Visual Boy Advance) - Binary
# =============================================================================

VBM_SIGNATURE = 0x1a4d4256  # "VBM\x1a" in little-endian


def parse_vbm(filepath: Path) -> MovieInfo:
	"""Parse Visual Boy Advance .vbm movie file."""
	movie = MovieInfo()

	with open(filepath, 'rb') as f:
		# Read signature (4 bytes) - should be "VBM\x1a"
		sig = struct.unpack('<I', f.read(4))[0]
		if sig != VBM_SIGNATURE:
			raise ValueError(f"Invalid VBM signature: {hex(sig)}")

		# Read header version (4 bytes)
		version = struct.unpack('<I', f.read(4))[0]

		# Read UID (4 bytes)
		uid = struct.unpack('<I', f.read(4))[0]

		# Read frame count (4 bytes)
		frame_count = struct.unpack('<I', f.read(4))[0]

		# Read rerecord count (4 bytes)
		rerecord_count = struct.unpack('<I', f.read(4))[0]

		# Start from savestate (1 byte)
		start_from_savestate = struct.unpack('B', f.read(1))[0]

		# Controllers (1 byte)
		controller_flags = struct.unpack('B', f.read(1))[0]

		# System type (1 byte)
		# 0 = GBA, 1 = GB, 2 = GBC, 3 = SGB
		system_type = struct.unpack('B', f.read(1))[0]

		# Reserved (1 byte)
		f.read(1)

		# Movie flags (4 bytes)
		movie_flags = struct.unpack('<I', f.read(4))[0]

		# WinLoseTie (4 bytes) - for SGB
		f.read(4)

		# Start time (4 bytes) - BIOS skip
		f.read(4)

		# ROM checksum (4 bytes) - internal checksum
		rom_checksum = struct.unpack('<I', f.read(4))[0]

		# ROM CRC32 (4 bytes)
		rom_crc32 = struct.unpack('<I', f.read(4))[0]

		# ROM game code (4 bytes)
		game_code = f.read(4).decode('ascii', errors='replace').strip('\x00')

		# ROM title (12 bytes)
		rom_title = f.read(12).decode('ascii', errors='replace').strip('\x00')

		# Minor version (1 byte)
		f.read(1)

		# Internal ROM name (3 bytes)
		f.read(3)

		# Controller flags (4 bytes)
		controller_bits = struct.unpack('<I', f.read(4))[0]

		# Type flags (4 bytes)
		type_flags = struct.unpack('<I', f.read(4))[0]

		# Reserved (8 bytes)
		f.read(8)

		# Author name (64 bytes, null-terminated UTF-8)
		author_bytes = f.read(64)
		try:
			movie.author = author_bytes.split(b'\x00')[0].decode('utf-8')
		except:
			movie.author = ""

		# Description (128 bytes, null-terminated UTF-8)
		desc_bytes = f.read(128)
		try:
			movie.description = desc_bytes.split(b'\x00')[0].decode('utf-8')
		except:
			movie.description = ""

		# Calculate offset to frame data
		# VBM header is 256 bytes
		f.seek(256)

		# Set movie info
		movie.frame_count = frame_count
		movie.rerecord_count = rerecord_count
		movie.start_from_savestate = bool(start_from_savestate)
		movie.rom_name = rom_title
		movie.rom_crc32 = rom_crc32

		# Determine system type
		if system_type == 0:
			movie.system = TASSystem.GBA
			movie.is_gba = True
		elif system_type == 1:
			movie.system = TASSystem.GB
		elif system_type == 2:
			movie.system = TASSystem.GB
			movie.is_gbc = True
		elif system_type == 3:
			movie.system = TASSystem.GB
			movie.is_sgb = True

		# Determine active controllers from controller_flags
		# Bit 0: Controller 1, Bit 1: Controller 2, etc.
		movie.controllers = bin(controller_flags & 0x0F).count('1')
		if movie.controllers == 0:
			movie.controllers = 1

		# VBM uses 2 bytes per controller per frame
		bytes_per_frame = 2 * movie.controllers

		# Read frame data
		frame_data = f.read()

		for i in range(frame_count):
			frame = FrameInput(controllers=[])
			base = i * bytes_per_frame

			for ctrl in range(movie.controllers):
				offset = base + ctrl * 2
				if offset + 2 <= len(frame_data):
					buttons = struct.unpack_from('<H', frame_data, offset)[0]

					# VBM button format is native to hardware:
					# GBA: bit 0=A, 1=B, 2=Select, 3=Start, 4=Right, 5=Left, 6=Up, 7=Down,
					#      8=R, 9=L, ...
					# GB: bit 0=A, 1=B, 2=Select, 3=Start, 4=Right, 5=Left, 6=Up, 7=Down

					if movie.is_gba:
						translated = 0
						if buttons & 0x0001:
							translated |= GbaButtons.A
						if buttons & 0x0002:
							translated |= GbaButtons.B
						if buttons & 0x0004:
							translated |= GbaButtons.SELECT
						if buttons & 0x0008:
							translated |= GbaButtons.START
						if buttons & 0x0010:
							translated |= GbaButtons.RIGHT
						if buttons & 0x0020:
							translated |= GbaButtons.LEFT
						if buttons & 0x0040:
							translated |= GbaButtons.UP
						if buttons & 0x0080:
							translated |= GbaButtons.DOWN
						if buttons & 0x0100:
							translated |= GbaButtons.R
						if buttons & 0x0200:
							translated |= GbaButtons.L
						frame.controllers.append(translated)
					else:
						translated = 0
						if buttons & 0x0001:
							translated |= GbButtons.A
						if buttons & 0x0002:
							translated |= GbButtons.B
						if buttons & 0x0004:
							translated |= GbButtons.SELECT
						if buttons & 0x0008:
							translated |= GbButtons.START
						if buttons & 0x0010:
							translated |= GbButtons.RIGHT
						if buttons & 0x0020:
							translated |= GbButtons.LEFT
						if buttons & 0x0040:
							translated |= GbButtons.UP
						if buttons & 0x0080:
							translated |= GbButtons.DOWN
						frame.controllers.append(translated)
				else:
					frame.controllers.append(0)

			# Check for reset
			if movie.controllers > 0 and offset + 2 <= len(frame_data):
				# Reset is indicated in high byte
				last_buttons = struct.unpack_from('<H', frame_data, offset - (movie.controllers - 1) * 2 + bytes_per_frame - 2)[0] if bytes_per_frame > 2 else 0
				frame.reset = bool(last_buttons & 0x8000)

			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed VBM: {filepath.name}")
	print(f"  System: {'GBA' if movie.is_gba else 'GBC' if movie.is_gbc else 'SGB' if movie.is_sgb else 'GB'}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  ROM: {movie.rom_name}")
	print(f"  Author: {movie.author}")

	return movie


def create_vbm_file(movie: MovieInfo, output_path: Path):
	"""Create a Visual Boy Advance .vbm movie file."""
	with open(output_path, 'wb') as f:
		# Signature
		f.write(struct.pack('<I', VBM_SIGNATURE))

		# Version (use 1)
		f.write(struct.pack('<I', 1))

		# UID (random or 0)
		f.write(struct.pack('<I', 0))

		# Frame count
		f.write(struct.pack('<I', len(movie.frames)))

		# Rerecord count
		f.write(struct.pack('<I', movie.rerecord_count))

		# Start from savestate (1 byte)
		f.write(struct.pack('B', 1 if movie.start_from_savestate else 0))

		# Controller flags (1 byte) - bitmask of active controllers
		controller_flags = (1 << movie.controllers) - 1
		f.write(struct.pack('B', controller_flags))

		# System type (1 byte)
		if movie.is_gba:
			system_type = 0
		elif movie.is_gbc:
			system_type = 2
		elif movie.is_sgb:
			system_type = 3
		else:
			system_type = 1
		f.write(struct.pack('B', system_type))

		# Reserved (1 byte)
		f.write(b'\x00')

		# Movie flags (4 bytes)
		f.write(struct.pack('<I', 0))

		# WinLoseTie (4 bytes)
		f.write(struct.pack('<I', 0))

		# Start time (4 bytes)
		f.write(struct.pack('<I', 0))

		# ROM checksum (4 bytes)
		f.write(struct.pack('<I', 0))

		# ROM CRC32 (4 bytes)
		f.write(struct.pack('<I', movie.rom_crc32))

		# Game code (4 bytes)
		f.write(b'\x00' * 4)

		# ROM title (12 bytes)
		rom_title = movie.rom_name[:12].encode('ascii', errors='replace')
		f.write(rom_title.ljust(12, b'\x00'))

		# Minor version (1 byte)
		f.write(b'\x00')

		# Internal ROM name (3 bytes)
		f.write(b'\x00' * 3)

		# Controller flags (4 bytes)
		f.write(struct.pack('<I', controller_flags))

		# Type flags (4 bytes)
		f.write(struct.pack('<I', 0))

		# Reserved (8 bytes)
		f.write(b'\x00' * 8)

		# Author (64 bytes)
		author = movie.author[:63].encode('utf-8')
		f.write(author.ljust(64, b'\x00'))

		# Description (128 bytes)
		desc = movie.description[:127].encode('utf-8')
		f.write(desc.ljust(128, b'\x00'))

		# Pad to 256 bytes
		current_pos = f.tell()
		if current_pos < 256:
			f.write(b'\x00' * (256 - current_pos))

		# Write frame data
		for frame in movie.frames:
			for ctrl in range(movie.controllers):
				buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0

				# Convert to VBM format
				vbm_buttons = 0

				if movie.is_gba:
					if buttons & GbaButtons.A:
						vbm_buttons |= 0x0001
					if buttons & GbaButtons.B:
						vbm_buttons |= 0x0002
					if buttons & GbaButtons.SELECT:
						vbm_buttons |= 0x0004
					if buttons & GbaButtons.START:
						vbm_buttons |= 0x0008
					if buttons & GbaButtons.RIGHT:
						vbm_buttons |= 0x0010
					if buttons & GbaButtons.LEFT:
						vbm_buttons |= 0x0020
					if buttons & GbaButtons.UP:
						vbm_buttons |= 0x0040
					if buttons & GbaButtons.DOWN:
						vbm_buttons |= 0x0080
					if buttons & GbaButtons.R:
						vbm_buttons |= 0x0100
					if buttons & GbaButtons.L:
						vbm_buttons |= 0x0200
				else:
					if buttons & GbButtons.A:
						vbm_buttons |= 0x0001
					if buttons & GbButtons.B:
						vbm_buttons |= 0x0002
					if buttons & GbButtons.SELECT:
						vbm_buttons |= 0x0004
					if buttons & GbButtons.START:
						vbm_buttons |= 0x0008
					if buttons & GbButtons.RIGHT:
						vbm_buttons |= 0x0010
					if buttons & GbButtons.LEFT:
						vbm_buttons |= 0x0020
					if buttons & GbButtons.UP:
						vbm_buttons |= 0x0040
					if buttons & GbButtons.DOWN:
						vbm_buttons |= 0x0080

				f.write(struct.pack('<H', vbm_buttons))

	print(f"Created VBM: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  System: {'GBA' if movie.is_gba else 'GBC' if movie.is_gbc else 'SGB' if movie.is_sgb else 'GB'}")


# =============================================================================
# Button Conversion
# =============================================================================

def gb_to_bk2_text(buttons: int) -> str:
	"""Convert GB buttons to BK2 text format."""
	# GB: Up, Down, Left, Right, Start, Select, B, A
	result = ""
	button_order = [
		(GbButtons.UP, 'U'),
		(GbButtons.DOWN, 'D'),
		(GbButtons.LEFT, 'L'),
		(GbButtons.RIGHT, 'R'),
		(GbButtons.START, 'S'),
		(GbButtons.SELECT, 's'),
		(GbButtons.B, 'B'),
		(GbButtons.A, 'A'),
	]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	return result


def gba_to_bk2_text(buttons: int) -> str:
	"""Convert GBA buttons to BK2 text format."""
	# GBA: Up, Down, Left, Right, Start, Select, B, A, L, R
	result = ""
	button_order = [
		(GbaButtons.UP, 'U'),
		(GbaButtons.DOWN, 'D'),
		(GbaButtons.LEFT, 'L'),
		(GbaButtons.RIGHT, 'R'),
		(GbaButtons.START, 'S'),
		(GbaButtons.SELECT, 's'),
		(GbaButtons.B, 'B'),
		(GbaButtons.A, 'A'),
		(GbaButtons.L, 'l'),
		(GbaButtons.R, 'r'),
	]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	return result


def detect_gb_format(filepath: Path) -> Optional[str]:
	"""Detect Game Boy movie format from file extension or signature."""
	ext = filepath.suffix.lower()
	if ext == '.vbm':
		return 'VBM'
	return None
