#!/usr/bin/env python3
"""
Sega Master System / Game Gear TAS Format Parsers

Supports:
- MMV (Dega) - Binary format, read/write
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Optional

from tas_formats import SmsButtons, TASSystem


@dataclass
class FrameInput:
	"""Input data for a single frame."""
	controllers: List[int] = field(default_factory=list)
	commands: int = 0


@dataclass
class MovieInfo:
	"""Common movie metadata."""
	title: str = ""
	author: str = ""
	description: str = ""
	rom_name: str = ""
	rom_checksum: str = ""
	sha1: str = ""
	frame_count: int = 0
	rerecord_count: int = 0
	controllers: int = 1
	region: str = ""
	system: str = TASSystem.SMS
	frames: List[FrameInput] = field(default_factory=list)
	start_from_savestate: bool = False
	is_game_gear: bool = False


# =============================================================================
# MMV Format (Dega) - Binary
# =============================================================================

MMV_SIGNATURE = b'Dega Movie '


def parse_mmv(filepath: Path) -> MovieInfo:
	"""Parse Dega .mmv movie file (Master System / Game Gear)."""
	movie = MovieInfo()
	movie.system = TASSystem.SMS

	with open(filepath, 'rb') as f:
		# Read signature (16 bytes, should start with "Dega Movie ")
		sig = f.read(16)
		if not sig.startswith(MMV_SIGNATURE):
			raise ValueError(f"Invalid MMV signature: {sig}")

		# Version info is in the signature string
		# Format: "Dega Movie X.Y"

		# Read rerecord count (4 bytes)
		rerecord_count = struct.unpack('<I', f.read(4))[0]

		# Read frame count (4 bytes)
		frame_count = struct.unpack('<I', f.read(4))[0]

		# Read FPS (4 bytes) - typically 60 or 50
		fps = struct.unpack('<I', f.read(4))[0]

		# Read flags (4 bytes)
		flags = struct.unpack('<I', f.read(4))[0]

		# Game Gear vs SMS determined by flags or file extension
		movie.is_game_gear = bool(flags & 0x01)
		if movie.is_game_gear:
			movie.system = TASSystem.SMS  # Still use SMS system, but marked as GG

		# Start from savestate
		movie.start_from_savestate = bool(flags & 0x02)

		# Controllers (usually 1 or 2)
		movie.controllers = 2 if (flags & 0x04) else 1

		# Read ROM name (128 bytes, null-terminated)
		rom_name_bytes = f.read(128)
		try:
			movie.rom_name = rom_name_bytes.split(b'\x00')[0].decode('utf-8', errors='replace')
		except:
			movie.rom_name = ""

		# Read author (64 bytes, null-terminated)
		author_bytes = f.read(64)
		try:
			movie.author = author_bytes.split(b'\x00')[0].decode('utf-8', errors='replace')
		except:
			movie.author = ""

		movie.rerecord_count = rerecord_count
		movie.frame_count = frame_count

		# MMV uses 2 bytes per frame per controller
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

					# MMV button format:
					# Bit 0: Up, Bit 1: Down, Bit 2: Left, Bit 3: Right
					# Bit 4: Button 1 (B), Bit 5: Button 2 (C)
					# Game Gear also has: Bit 6: Start

					sms_buttons = 0
					if buttons & 0x01:
						sms_buttons |= SmsButtons.UP
					if buttons & 0x02:
						sms_buttons |= SmsButtons.DOWN
					if buttons & 0x04:
						sms_buttons |= SmsButtons.LEFT
					if buttons & 0x08:
						sms_buttons |= SmsButtons.RIGHT
					if buttons & 0x10:
						sms_buttons |= SmsButtons.B1
					if buttons & 0x20:
						sms_buttons |= SmsButtons.B2
					if buttons & 0x40 and movie.is_game_gear:
						sms_buttons |= SmsButtons.START

					frame.controllers.append(sms_buttons)
				else:
					frame.controllers.append(0)

			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed MMV: {filepath.name}")
	print(f"  System: {'Game Gear' if movie.is_game_gear else 'Master System'}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  ROM: {movie.rom_name}")
	print(f"  Author: {movie.author}")

	return movie


def create_mmv_file(movie: MovieInfo, output_path: Path):
	"""Create a Dega .mmv movie file."""
	with open(output_path, 'wb') as f:
		# Signature (16 bytes) - "Dega Movie 1.0" + padding
		sig = b'Dega Movie 1.0  '
		f.write(sig[:16])

		# Rerecord count
		f.write(struct.pack('<I', movie.rerecord_count))

		# Frame count
		f.write(struct.pack('<I', len(movie.frames)))

		# FPS (60 for NTSC, 50 for PAL)
		fps = 60
		f.write(struct.pack('<I', fps))

		# Flags
		flags = 0
		if movie.is_game_gear:
			flags |= 0x01
		if movie.start_from_savestate:
			flags |= 0x02
		if movie.controllers > 1:
			flags |= 0x04
		f.write(struct.pack('<I', flags))

		# ROM name (128 bytes)
		rom_name = movie.rom_name[:127].encode('utf-8', errors='replace')
		f.write(rom_name.ljust(128, b'\x00'))

		# Author (64 bytes)
		author = movie.author[:63].encode('utf-8', errors='replace')
		f.write(author.ljust(64, b'\x00'))

		# Write frame data
		for frame in movie.frames:
			for ctrl in range(movie.controllers):
				buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0

				# Convert to MMV format
				mmv_buttons = 0
				if buttons & SmsButtons.UP:
					mmv_buttons |= 0x01
				if buttons & SmsButtons.DOWN:
					mmv_buttons |= 0x02
				if buttons & SmsButtons.LEFT:
					mmv_buttons |= 0x04
				if buttons & SmsButtons.RIGHT:
					mmv_buttons |= 0x08
				if buttons & SmsButtons.B1:
					mmv_buttons |= 0x10
				if buttons & SmsButtons.B2:
					mmv_buttons |= 0x20
				if buttons & SmsButtons.START and movie.is_game_gear:
					mmv_buttons |= 0x40

				f.write(struct.pack('<H', mmv_buttons))

	print(f"Created MMV: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  System: {'Game Gear' if movie.is_game_gear else 'Master System'}")


# =============================================================================
# Button Conversion
# =============================================================================

def sms_to_bk2_text(buttons: int, is_game_gear: bool = False) -> str:
	"""Convert SMS/GG buttons to BK2 text format."""
	result = ""

	# SMS: Up, Down, Left, Right, B1, B2
	# GG: Up, Down, Left, Right, Start, B1, B2
	if is_game_gear:
		button_order = [
			(SmsButtons.UP, 'U'),
			(SmsButtons.DOWN, 'D'),
			(SmsButtons.LEFT, 'L'),
			(SmsButtons.RIGHT, 'R'),
			(SmsButtons.START, 'S'),
			(SmsButtons.B1, '1'),
			(SmsButtons.B2, '2'),
		]
	else:
		button_order = [
			(SmsButtons.UP, 'U'),
			(SmsButtons.DOWN, 'D'),
			(SmsButtons.LEFT, 'L'),
			(SmsButtons.RIGHT, 'R'),
			(SmsButtons.B1, '1'),
			(SmsButtons.B2, '2'),
		]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	return result


def detect_sms_format(filepath: Path) -> Optional[str]:
	"""Detect SMS movie format from file extension or signature."""
	ext = filepath.suffix.lower()
	if ext == '.mmv':
		return 'MMV'
	return None
