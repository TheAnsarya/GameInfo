#!/usr/bin/env python3
"""
Additional System TAS Format Parsers

Supports:
- YMV (Yabause) - Sega Saturn, read-only
- MC2 (PCEjin/Mednafen) - PC Engine/TurboGrafx-16, read-only
- DSM (DeSmuME) - Nintendo DS, read-only
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Optional, Tuple

from tas_formats import SaturnButtons, PceButtons, NdsButtons, TASSystem


@dataclass
class FrameInput:
	"""Input data for a single frame."""
	controllers: List[int] = field(default_factory=list)
	touch: Optional[Tuple[int, int]] = None  # NDS touch screen (x, y)
	touch_pressed: bool = False
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
	system: str = ""
	frames: List[FrameInput] = field(default_factory=list)
	start_from_savestate: bool = False


# =============================================================================
# YMV Format (Yabause) - Sega Saturn
# =============================================================================

YMV_SIGNATURE = b'YMV '


def parse_ymv(filepath: Path) -> MovieInfo:
	"""Parse Yabause .ymv movie file (Sega Saturn)."""
	movie = MovieInfo()
	movie.system = TASSystem.SATURN

	with open(filepath, 'rb') as f:
		# Read signature (4 bytes)
		sig = f.read(4)
		if sig != YMV_SIGNATURE:
			raise ValueError(f"Invalid YMV signature: {sig}")

		# Version (4 bytes)
		version = struct.unpack('<I', f.read(4))[0]

		# Frame count (4 bytes)
		frame_count = struct.unpack('<I', f.read(4))[0]

		# Rerecord count (4 bytes)
		rerecord_count = struct.unpack('<I', f.read(4))[0]

		# Flags (4 bytes)
		flags = struct.unpack('<I', f.read(4))[0]

		# CD info (64 bytes)
		cd_info = f.read(64).split(b'\x00')[0].decode('ascii', errors='replace')

		# Author (64 bytes)
		author_bytes = f.read(64)
		try:
			movie.author = author_bytes.split(b'\x00')[0].decode('utf-8', errors='replace')
		except:
			movie.author = ""

		movie.frame_count = frame_count
		movie.rerecord_count = rerecord_count
		movie.rom_name = cd_info
		movie.start_from_savestate = bool(flags & 0x01)
		movie.controllers = 2 if (flags & 0x02) else 1

		# YMV uses 4 bytes per controller
		bytes_per_frame = 4 * movie.controllers

		# Read frame data
		frame_data = f.read()

		for i in range(frame_count):
			frame = FrameInput(controllers=[])
			base = i * bytes_per_frame

			for ctrl in range(movie.controllers):
				offset = base + ctrl * 4

				if offset + 4 <= len(frame_data):
					buttons = struct.unpack_from('<I', frame_data, offset)[0]

					# Saturn button format:
					# D-pad, A, B, C, X, Y, Z, L, R, Start

					saturn_buttons = 0
					if buttons & 0x0001:
						saturn_buttons |= SaturnButtons.UP
					if buttons & 0x0002:
						saturn_buttons |= SaturnButtons.DOWN
					if buttons & 0x0004:
						saturn_buttons |= SaturnButtons.LEFT
					if buttons & 0x0008:
						saturn_buttons |= SaturnButtons.RIGHT
					if buttons & 0x0010:
						saturn_buttons |= SaturnButtons.A
					if buttons & 0x0020:
						saturn_buttons |= SaturnButtons.B
					if buttons & 0x0040:
						saturn_buttons |= SaturnButtons.C
					if buttons & 0x0080:
						saturn_buttons |= SaturnButtons.X
					if buttons & 0x0100:
						saturn_buttons |= SaturnButtons.Y
					if buttons & 0x0200:
						saturn_buttons |= SaturnButtons.Z
					if buttons & 0x0400:
						saturn_buttons |= SaturnButtons.L
					if buttons & 0x0800:
						saturn_buttons |= SaturnButtons.R
					if buttons & 0x1000:
						saturn_buttons |= SaturnButtons.START

					frame.controllers.append(saturn_buttons)
				else:
					frame.controllers.append(0)

			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed YMV: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  CD: {movie.rom_name}")
	print(f"  Author: {movie.author}")

	return movie


# =============================================================================
# MC2 Format (PCEjin/Mednafen) - PC Engine / TurboGrafx-16
# =============================================================================

MC2_SIGNATURE = b'MCMV'  # Mednafen Cinema Movie Version


def parse_mc2(filepath: Path) -> MovieInfo:
	"""Parse PCEjin/Mednafen .mc2 movie file (PC Engine)."""
	movie = MovieInfo()
	movie.system = TASSystem.PCE

	with open(filepath, 'rb') as f:
		# Read signature (4 bytes)
		sig = f.read(4)
		if sig != MC2_SIGNATURE:
			raise ValueError(f"Invalid MC2 signature: {sig}")

		# Version (4 bytes)
		version = struct.unpack('<I', f.read(4))[0]

		# Frame count (4 bytes)
		frame_count = struct.unpack('<I', f.read(4))[0]

		# Rerecord count (4 bytes)
		rerecord_count = struct.unpack('<I', f.read(4))[0]

		# Flags (4 bytes)
		flags = struct.unpack('<I', f.read(4))[0]

		# Controllers active (4 bytes)
		controllers_active = struct.unpack('<I', f.read(4))[0]
		movie.controllers = bin(controllers_active & 0x1F).count('1')
		if movie.controllers == 0:
			movie.controllers = 1

		# ROM CRC (4 bytes)
		rom_crc = struct.unpack('<I', f.read(4))[0]
		movie.rom_checksum = f"{rom_crc:08x}"

		# ROM name (64 bytes)
		rom_name = f.read(64).split(b'\x00')[0].decode('ascii', errors='replace')
		movie.rom_name = rom_name

		# Author (64 bytes)
		author_bytes = f.read(64)
		try:
			movie.author = author_bytes.split(b'\x00')[0].decode('utf-8', errors='replace')
		except:
			movie.author = ""

		movie.frame_count = frame_count
		movie.rerecord_count = rerecord_count
		movie.start_from_savestate = bool(flags & 0x01)

		# MC2 uses 2 bytes per controller
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

					# PC Engine button format:
					# I, II, Select, Run, Up, Down, Left, Right

					pce_buttons = 0
					if buttons & 0x0001:
						pce_buttons |= PceButtons.I
					if buttons & 0x0002:
						pce_buttons |= PceButtons.II
					if buttons & 0x0004:
						pce_buttons |= PceButtons.SELECT
					if buttons & 0x0008:
						pce_buttons |= PceButtons.RUN
					if buttons & 0x0010:
						pce_buttons |= PceButtons.UP
					if buttons & 0x0020:
						pce_buttons |= PceButtons.DOWN
					if buttons & 0x0040:
						pce_buttons |= PceButtons.LEFT
					if buttons & 0x0080:
						pce_buttons |= PceButtons.RIGHT

					frame.controllers.append(pce_buttons)
				else:
					frame.controllers.append(0)

			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed MC2: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  ROM: {movie.rom_name}")
	print(f"  CRC: {movie.rom_checksum}")
	print(f"  Author: {movie.author}")

	return movie


# =============================================================================
# DSM Format (DeSmuME) - Nintendo DS
# =============================================================================

DSM_SIGNATURE = b'DESMUME MOVIE'


def parse_dsm(filepath: Path) -> MovieInfo:
	"""Parse DeSmuME .dsm movie file (Nintendo DS)."""
	movie = MovieInfo()
	movie.system = TASSystem.NDS

	with open(filepath, 'rb') as f:
		# Read signature (14 bytes)
		sig = f.read(14)
		if not sig.startswith(b'DESMUME MOVIE'):
			raise ValueError(f"Invalid DSM signature: {sig}")

		# Skip to known header structure
		f.seek(0)

		# Read entire file as text-based format
		content = f.read().decode('utf-8', errors='replace')

		lines = content.split('\n')
		frame_lines = []

		for line in lines:
			line = line.strip()
			if line.startswith('rerecordCount '):
				movie.rerecord_count = int(line.split(' ')[1])
			elif line.startswith('romFilename '):
				movie.rom_name = line[len('romFilename '):]
			elif line.startswith('romChecksum '):
				movie.rom_checksum = line[len('romChecksum '):]
			elif line.startswith('comment author '):
				movie.author = line[len('comment author '):]
			elif line.startswith('|'):
				frame_lines.append(line)

		# Parse frame data
		# DSM format: |commands|P1buttons|touch_x touch_y touch_press|
		for line in frame_lines:
			parts = line.split('|')
			if len(parts) >= 3:
				frame = FrameInput(controllers=[])

				# Parse buttons
				buttons_str = parts[2] if len(parts) > 2 else ""
				nds_buttons = 0

				# NDS button string format varies
				# Common: UDLRSBAYXWE  (Up Down Left Right Start Select B A Y X L R)

				button_chars = {
					'U': NdsButtons.UP,
					'D': NdsButtons.DOWN,
					'L': NdsButtons.LEFT,
					'R': NdsButtons.RIGHT,
					'S': NdsButtons.START,
					'E': NdsButtons.SELECT,  # 'E' for sElect in some formats
					'B': NdsButtons.B,
					'A': NdsButtons.A,
					'Y': NdsButtons.Y,
					'X': NdsButtons.X,
					'W': NdsButtons.L,  # shoulder buttons
					'Q': NdsButtons.R,
				}

				for char in buttons_str:
					if char in button_chars:
						nds_buttons |= button_chars[char]

				frame.controllers.append(nds_buttons)

				# Parse touch screen if present
				if len(parts) > 3:
					touch_part = parts[3].strip()
					if touch_part and touch_part != '0 0 0':
						touch_values = touch_part.split()
						if len(touch_values) >= 3:
							try:
								touch_x = int(touch_values[0])
								touch_y = int(touch_values[1])
								touch_pressed = int(touch_values[2]) != 0
								frame.touch = (touch_x, touch_y)
								frame.touch_pressed = touch_pressed
							except:
								pass

				movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed DSM: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  ROM: {movie.rom_name}")
	print(f"  Author: {movie.author}")

	return movie


# =============================================================================
# Write Functions
# =============================================================================

def create_ymv_file(movie: MovieInfo, output_path: Path):
	"""Create a Yabause .ymv movie file (Sega Saturn)."""
	header = bytearray(192)

	# Signature
	header[0:4] = YMV_SIGNATURE

	# Version
	struct.pack_into('<I', header, 4, 1)

	# Frame count
	struct.pack_into('<I', header, 8, len(movie.frames))

	# Rerecord count
	struct.pack_into('<I', header, 12, movie.rerecord_count)

	# Flags
	flags = 0
	if movie.start_from_savestate:
		flags |= 0x01
	if movie.controllers > 1:
		flags |= 0x02
	struct.pack_into('<I', header, 16, flags)

	# CD info (64 bytes)
	cd_info = movie.rom_name[:63].encode('ascii', errors='replace')
	header[20:84] = cd_info.ljust(64, b'\x00')

	# Author (64 bytes)
	author = movie.author[:63].encode('utf-8', errors='replace')
	header[84:148] = author.ljust(64, b'\x00')

	# Build frame data (4 bytes per controller)
	frame_data = bytearray()
	for frame in movie.frames:
		for ctrl in range(movie.controllers):
			buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0

			# Convert to YMV format
			word = 0
			if buttons & SaturnButtons.UP:
				word |= 0x0001
			if buttons & SaturnButtons.DOWN:
				word |= 0x0002
			if buttons & SaturnButtons.LEFT:
				word |= 0x0004
			if buttons & SaturnButtons.RIGHT:
				word |= 0x0008
			if buttons & SaturnButtons.A:
				word |= 0x0010
			if buttons & SaturnButtons.B:
				word |= 0x0020
			if buttons & SaturnButtons.C:
				word |= 0x0040
			if buttons & SaturnButtons.X:
				word |= 0x0080
			if buttons & SaturnButtons.Y:
				word |= 0x0100
			if buttons & SaturnButtons.Z:
				word |= 0x0200
			if buttons & SaturnButtons.L:
				word |= 0x0400
			if buttons & SaturnButtons.R:
				word |= 0x0800
			if buttons & SaturnButtons.START:
				word |= 0x1000

			frame_data.extend(struct.pack('<I', word))

	with open(output_path, 'wb') as f:
		f.write(header)
		f.write(frame_data)

	print(f"Created YMV: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


def create_mc2_file(movie: MovieInfo, output_path: Path):
	"""Create a PCEjin/Mednafen .mc2 movie file (PC Engine)."""
	header = bytearray(192)

	# Signature
	header[0:4] = MC2_SIGNATURE

	# Version
	struct.pack_into('<I', header, 4, 1)

	# Frame count
	struct.pack_into('<I', header, 8, len(movie.frames))

	# Rerecord count
	struct.pack_into('<I', header, 12, movie.rerecord_count)

	# Flags
	flags = 0
	if movie.start_from_savestate:
		flags |= 0x01
	struct.pack_into('<I', header, 16, flags)

	# Controllers active bitmask
	ctrl_mask = (1 << movie.controllers) - 1
	struct.pack_into('<I', header, 20, ctrl_mask)

	# ROM CRC (if available)
	try:
		crc = int(movie.rom_checksum, 16) if movie.rom_checksum else 0
	except ValueError:
		crc = 0
	struct.pack_into('<I', header, 24, crc)

	# ROM name (64 bytes)
	rom_name = movie.rom_name[:63].encode('ascii', errors='replace')
	header[28:92] = rom_name.ljust(64, b'\x00')

	# Author (64 bytes)
	author = movie.author[:63].encode('utf-8', errors='replace')
	header[92:156] = author.ljust(64, b'\x00')

	# Build frame data (2 bytes per controller)
	frame_data = bytearray()
	for frame in movie.frames:
		for ctrl in range(movie.controllers):
			buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0

			# Convert to MC2 format
			word = 0
			if buttons & PceButtons.I:
				word |= 0x0001
			if buttons & PceButtons.II:
				word |= 0x0002
			if buttons & PceButtons.SELECT:
				word |= 0x0004
			if buttons & PceButtons.RUN:
				word |= 0x0008
			if buttons & PceButtons.UP:
				word |= 0x0010
			if buttons & PceButtons.DOWN:
				word |= 0x0020
			if buttons & PceButtons.LEFT:
				word |= 0x0040
			if buttons & PceButtons.RIGHT:
				word |= 0x0080

			frame_data.extend(struct.pack('<H', word))

	with open(output_path, 'wb') as f:
		f.write(header)
		f.write(frame_data)

	print(f"Created MC2: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


def create_dsm_file(movie: MovieInfo, output_path: Path):
	"""Create a DeSmuME .dsm movie file (Nintendo DS)."""
	lines = []

	# Header
	lines.append("DESMUME MOVIE")
	lines.append(f"version 1")
	lines.append(f"emuVersion 0.9.11")
	lines.append(f"rerecordCount {movie.rerecord_count}")
	if movie.rom_name:
		lines.append(f"romFilename {movie.rom_name}")
	if movie.rom_checksum:
		lines.append(f"romChecksum {movie.rom_checksum}")
	if movie.author:
		lines.append(f"comment author {movie.author}")

	# Frame data
	for frame in movie.frames:
		buttons = frame.controllers[0] if frame.controllers else 0

		# Build button string
		btn_str = ""
		btn_str += 'U' if buttons & NdsButtons.UP else '.'
		btn_str += 'D' if buttons & NdsButtons.DOWN else '.'
		btn_str += 'L' if buttons & NdsButtons.LEFT else '.'
		btn_str += 'R' if buttons & NdsButtons.RIGHT else '.'
		btn_str += 'S' if buttons & NdsButtons.START else '.'
		btn_str += 'E' if buttons & NdsButtons.SELECT else '.'
		btn_str += 'B' if buttons & NdsButtons.B else '.'
		btn_str += 'A' if buttons & NdsButtons.A else '.'
		btn_str += 'Y' if buttons & NdsButtons.Y else '.'
		btn_str += 'X' if buttons & NdsButtons.X else '.'
		btn_str += 'W' if buttons & NdsButtons.L else '.'
		btn_str += 'Q' if buttons & NdsButtons.R else '.'

		# Touch screen
		touch_str = "0 0 0"
		if hasattr(frame, 'touch') and frame.touch and frame.touch_pressed:
			touch_str = f"{frame.touch[0]} {frame.touch[1]} 1"

		lines.append(f"|0|{btn_str}|{touch_str}|")

	with open(output_path, 'w', encoding='utf-8') as f:
		f.write('\n'.join(lines))

	print(f"Created DSM: {output_path}")
	print(f"  Frames: {len(movie.frames)}")


# =============================================================================
# Button Conversion Functions
# =============================================================================

def saturn_to_bk2_text(buttons: int) -> str:
	"""Convert Saturn buttons to BK2 text format."""
	result = ""
	button_order = [
		(SaturnButtons.UP, 'U'),
		(SaturnButtons.DOWN, 'D'),
		(SaturnButtons.LEFT, 'L'),
		(SaturnButtons.RIGHT, 'R'),
		(SaturnButtons.START, 'S'),
		(SaturnButtons.A, 'A'),
		(SaturnButtons.B, 'B'),
		(SaturnButtons.C, 'C'),
		(SaturnButtons.X, 'X'),
		(SaturnButtons.Y, 'Y'),
		(SaturnButtons.Z, 'Z'),
		(SaturnButtons.L, 'l'),
		(SaturnButtons.R, 'r'),
	]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	return result


def pce_to_bk2_text(buttons: int) -> str:
	"""Convert PC Engine buttons to BK2 text format."""
	result = ""
	button_order = [
		(PceButtons.UP, 'U'),
		(PceButtons.DOWN, 'D'),
		(PceButtons.LEFT, 'L'),
		(PceButtons.RIGHT, 'R'),
		(PceButtons.RUN, 'R'),  # Run = Start equivalent
		(PceButtons.SELECT, 'S'),
		(PceButtons.II, '2'),
		(PceButtons.I, '1'),
	]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	return result


def nds_to_bk2_text(buttons: int, touch: Optional[Tuple[int, int]] = None, touch_pressed: bool = False) -> str:
	"""Convert NDS buttons to BK2 text format."""
	result = ""
	button_order = [
		(NdsButtons.UP, 'U'),
		(NdsButtons.DOWN, 'D'),
		(NdsButtons.LEFT, 'L'),
		(NdsButtons.RIGHT, 'R'),
		(NdsButtons.START, 'S'),
		(NdsButtons.SELECT, 's'),
		(NdsButtons.B, 'B'),
		(NdsButtons.A, 'A'),
		(NdsButtons.Y, 'Y'),
		(NdsButtons.X, 'X'),
		(NdsButtons.L, 'l'),
		(NdsButtons.R, 'r'),
	]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	# Touch screen is handled separately in BK2 format
	return result


def detect_misc_format(filepath: Path) -> Optional[str]:
	"""Detect movie format from file extension or signature."""
	ext = filepath.suffix.lower()

	if ext == '.ymv':
		return 'YMV'
	elif ext == '.mc2':
		return 'MC2'
	elif ext == '.dsm':
		return 'DSM'

	return None
