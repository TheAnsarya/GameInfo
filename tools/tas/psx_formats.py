#!/usr/bin/env python3
"""
PlayStation TAS Format Parsers

Supports:
- PXM (PCSX) - Binary format, read-only
- PJM (PSXjin) - Binary format, read-only
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Optional

from tas_formats import PsxButtons, TASSystem


@dataclass
class FrameInput:
	"""Input data for a single frame."""
	controllers: List[int] = field(default_factory=list)
	analog_l: tuple = (0, 0)  # Left stick (x, y)
	analog_r: tuple = (0, 0)  # Right stick (x, y)
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
	system: str = TASSystem.PSX
	frames: List[FrameInput] = field(default_factory=list)
	start_from_savestate: bool = False
	controller_type: str = "standard"  # standard, analog, multitap


# =============================================================================
# PXM Format (PCSX) - Binary
# =============================================================================

PXM_SIGNATURE = b'PXM '


def parse_pxm(filepath: Path) -> MovieInfo:
	"""Parse PCSX .pxm movie file."""
	movie = MovieInfo()
	movie.system = TASSystem.PSX

	with open(filepath, 'rb') as f:
		# Read signature (4 bytes)
		sig = f.read(4)
		if sig != PXM_SIGNATURE:
			raise ValueError(f"Invalid PXM signature: {sig}")

		# Version (4 bytes)
		version = struct.unpack('<I', f.read(4))[0]

		# Flags (4 bytes)
		flags = struct.unpack('<I', f.read(4))[0]

		# Frame count (4 bytes)
		frame_count = struct.unpack('<I', f.read(4))[0]

		# Rerecord count (4 bytes)
		rerecord_count = struct.unpack('<I', f.read(4))[0]

		# Reserved/padding (varies by version)
		f.read(12)

		# CD ID (varies)
		cd_id = f.read(32).split(b'\x00')[0].decode('ascii', errors='replace')

		# Author (32 bytes)
		author_bytes = f.read(32)
		try:
			movie.author = author_bytes.split(b'\x00')[0].decode('utf-8', errors='replace')
		except:
			movie.author = ""

		movie.frame_count = frame_count
		movie.rerecord_count = rerecord_count
		movie.rom_name = cd_id
		movie.start_from_savestate = bool(flags & 0x01)

		# Determine controller configuration
		# Controller type from flags
		has_analog = bool(flags & 0x02)
		movie.controller_type = "analog" if has_analog else "standard"
		movie.controllers = 2 if (flags & 0x04) else 1

		# PXM uses 2 bytes per controller for digital, more for analog
		bytes_per_controller = 6 if has_analog else 2
		bytes_per_frame = bytes_per_controller * movie.controllers

		# Read frame data
		frame_data = f.read()

		for i in range(frame_count):
			frame = FrameInput(controllers=[])
			base = i * bytes_per_frame

			for ctrl in range(movie.controllers):
				offset = base + ctrl * bytes_per_controller

				if offset + bytes_per_controller <= len(frame_data):
					# Read digital buttons (2 bytes)
					buttons = struct.unpack_from('<H', frame_data, offset)[0]

					# PXM button format (active low in hardware, but stored active high):
					# Bit 0: Select, Bit 3: Start
					# Bit 4: Up, Bit 5: Right, Bit 6: Down, Bit 7: Left
					# Bit 8: L2, Bit 9: R2, Bit 10: L1, Bit 11: R1
					# Bit 12: Triangle, Bit 13: Circle, Bit 14: X, Bit 15: Square

					psx_buttons = 0
					if buttons & 0x0001:
						psx_buttons |= PsxButtons.SELECT
					if buttons & 0x0008:
						psx_buttons |= PsxButtons.START
					if buttons & 0x0010:
						psx_buttons |= PsxButtons.UP
					if buttons & 0x0020:
						psx_buttons |= PsxButtons.RIGHT
					if buttons & 0x0040:
						psx_buttons |= PsxButtons.DOWN
					if buttons & 0x0080:
						psx_buttons |= PsxButtons.LEFT
					if buttons & 0x0100:
						psx_buttons |= PsxButtons.L2
					if buttons & 0x0200:
						psx_buttons |= PsxButtons.R2
					if buttons & 0x0400:
						psx_buttons |= PsxButtons.L1
					if buttons & 0x0800:
						psx_buttons |= PsxButtons.R1
					if buttons & 0x1000:
						psx_buttons |= PsxButtons.TRIANGLE
					if buttons & 0x2000:
						psx_buttons |= PsxButtons.CIRCLE
					if buttons & 0x4000:
						psx_buttons |= PsxButtons.CROSS
					if buttons & 0x8000:
						psx_buttons |= PsxButtons.SQUARE

					frame.controllers.append(psx_buttons)

					# Read analog sticks if present
					if has_analog:
						lx = frame_data[offset + 2]
						ly = frame_data[offset + 3]
						rx = frame_data[offset + 4]
						ry = frame_data[offset + 5]
						frame.analog_l = (lx, ly)
						frame.analog_r = (rx, ry)
				else:
					frame.controllers.append(0)

			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed PXM: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Controller Type: {movie.controller_type}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  CD ID: {movie.rom_name}")
	print(f"  Author: {movie.author}")

	return movie


# =============================================================================
# PJM Format (PSXjin) - Binary
# =============================================================================

PJM_SIGNATURE = b'PJM '


def parse_pjm(filepath: Path) -> MovieInfo:
	"""Parse PSXjin .pjm movie file."""
	movie = MovieInfo()
	movie.system = TASSystem.PSX

	with open(filepath, 'rb') as f:
		# Read signature (4 bytes)
		sig = f.read(4)
		if sig != PJM_SIGNATURE:
			raise ValueError(f"Invalid PJM signature: {sig}")

		# Version (4 bytes)
		version = struct.unpack('<I', f.read(4))[0]

		# Flags (4 bytes)
		flags = struct.unpack('<I', f.read(4))[0]

		# Controller flags (4 bytes) - which controllers and types
		controller_flags = struct.unpack('<I', f.read(4))[0]

		# Frame count (4 bytes)
		frame_count = struct.unpack('<I', f.read(4))[0]

		# Rerecord count (4 bytes)
		rerecord_count = struct.unpack('<I', f.read(4))[0]

		# CD info (64 bytes)
		cd_info = f.read(64).split(b'\x00')[0].decode('ascii', errors='replace')

		# Padding to 256 bytes for header
		f.seek(256)

		movie.frame_count = frame_count
		movie.rerecord_count = rerecord_count
		movie.rom_name = cd_info
		movie.start_from_savestate = bool(flags & 0x01)

		# Controller configuration from controller_flags
		# Bit 0-1: Port 1 type (0=none, 1=standard, 2=analog, 3=mouse)
		# Bit 2-3: Port 2 type
		port1_type = controller_flags & 0x03
		port2_type = (controller_flags >> 2) & 0x03

		movie.controllers = 0
		if port1_type > 0:
			movie.controllers += 1
		if port2_type > 0:
			movie.controllers += 1
		if movie.controllers == 0:
			movie.controllers = 1

		has_analog = (port1_type == 2) or (port2_type == 2)
		movie.controller_type = "analog" if has_analog else "standard"

		# PJM uses variable bytes per frame based on controller type
		bytes_per_controller = 6 if has_analog else 2
		bytes_per_frame = bytes_per_controller * movie.controllers

		# Read frame data
		frame_data = f.read()

		for i in range(frame_count):
			frame = FrameInput(controllers=[])
			base = i * bytes_per_frame

			for ctrl in range(movie.controllers):
				offset = base + ctrl * bytes_per_controller

				if offset + 2 <= len(frame_data):
					buttons = struct.unpack_from('<H', frame_data, offset)[0]

					# Same button format as PXM
					psx_buttons = 0
					if buttons & 0x0001:
						psx_buttons |= PsxButtons.SELECT
					if buttons & 0x0008:
						psx_buttons |= PsxButtons.START
					if buttons & 0x0010:
						psx_buttons |= PsxButtons.UP
					if buttons & 0x0020:
						psx_buttons |= PsxButtons.RIGHT
					if buttons & 0x0040:
						psx_buttons |= PsxButtons.DOWN
					if buttons & 0x0080:
						psx_buttons |= PsxButtons.LEFT
					if buttons & 0x0100:
						psx_buttons |= PsxButtons.L2
					if buttons & 0x0200:
						psx_buttons |= PsxButtons.R2
					if buttons & 0x0400:
						psx_buttons |= PsxButtons.L1
					if buttons & 0x0800:
						psx_buttons |= PsxButtons.R1
					if buttons & 0x1000:
						psx_buttons |= PsxButtons.TRIANGLE
					if buttons & 0x2000:
						psx_buttons |= PsxButtons.CIRCLE
					if buttons & 0x4000:
						psx_buttons |= PsxButtons.CROSS
					if buttons & 0x8000:
						psx_buttons |= PsxButtons.SQUARE

					frame.controllers.append(psx_buttons)

					if has_analog and offset + bytes_per_controller <= len(frame_data):
						lx = frame_data[offset + 2]
						ly = frame_data[offset + 3]
						rx = frame_data[offset + 4]
						ry = frame_data[offset + 5]
						frame.analog_l = (lx, ly)
						frame.analog_r = (rx, ry)
				else:
					frame.controllers.append(0)

			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed PJM: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Controller Type: {movie.controller_type}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  CD: {movie.rom_name}")

	return movie


# =============================================================================
# Button Conversion
# =============================================================================

def psx_to_bk2_text(buttons: int, has_analog: bool = False, analog_l: tuple = (128, 128), analog_r: tuple = (128, 128)) -> str:
	"""Convert PSX buttons to BK2 text format."""
	# BizHawk PSX: udlrSsxocTARL123?
	# Up, Down, Left, Right, Start, Select, Cross, Circle, Square, Triangle, L1, R1, L2, R2, L3, R3, ?
	result = ""

	button_order = [
		(PsxButtons.UP, 'U'),
		(PsxButtons.DOWN, 'D'),
		(PsxButtons.LEFT, 'L'),
		(PsxButtons.RIGHT, 'R'),
		(PsxButtons.START, 'S'),
		(PsxButtons.SELECT, 's'),
		(PsxButtons.CROSS, 'x'),
		(PsxButtons.CIRCLE, 'o'),
		(PsxButtons.SQUARE, 'q'),
		(PsxButtons.TRIANGLE, 'T'),
		(PsxButtons.L1, '1'),
		(PsxButtons.R1, '2'),
		(PsxButtons.L2, '3'),
		(PsxButtons.R2, '4'),
		(PsxButtons.L3, '5'),
		(PsxButtons.R3, '6'),
	]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	return result


def buttons_to_psx_word(buttons: int) -> int:
	"""Convert PsxButtons to raw 16-bit word format."""
	word = 0
	if buttons & PsxButtons.SELECT:
		word |= 0x0001
	if buttons & PsxButtons.START:
		word |= 0x0008
	if buttons & PsxButtons.UP:
		word |= 0x0010
	if buttons & PsxButtons.RIGHT:
		word |= 0x0020
	if buttons & PsxButtons.DOWN:
		word |= 0x0040
	if buttons & PsxButtons.LEFT:
		word |= 0x0080
	if buttons & PsxButtons.L2:
		word |= 0x0100
	if buttons & PsxButtons.R2:
		word |= 0x0200
	if buttons & PsxButtons.L1:
		word |= 0x0400
	if buttons & PsxButtons.R1:
		word |= 0x0800
	if buttons & PsxButtons.TRIANGLE:
		word |= 0x1000
	if buttons & PsxButtons.CIRCLE:
		word |= 0x2000
	if buttons & PsxButtons.CROSS:
		word |= 0x4000
	if buttons & PsxButtons.SQUARE:
		word |= 0x8000
	return word


def create_pxm_file(movie: MovieInfo, output_path: Path):
	"""Create a PCSX .pxm movie file."""
	header = bytearray(128)

	# Signature
	header[0:4] = PXM_SIGNATURE

	# Version
	struct.pack_into('<I', header, 4, 2)

	# Flags
	flags = 0
	if movie.start_from_savestate:
		flags |= 0x01
	has_analog = movie.controller_type == "analog"
	if has_analog:
		flags |= 0x02
	if movie.controllers > 1:
		flags |= 0x04
	struct.pack_into('<I', header, 8, flags)

	# Frame count
	struct.pack_into('<I', header, 12, len(movie.frames))

	# Rerecord count
	struct.pack_into('<I', header, 16, movie.rerecord_count)

	# Reserved
	header[20:32] = b'\x00' * 12

	# CD ID (32 bytes)
	cd_id = movie.rom_name[:31].encode('ascii', errors='replace')
	header[32:64] = cd_id.ljust(32, b'\x00')

	# Author (32 bytes)
	author = movie.author[:31].encode('utf-8', errors='replace')
	header[64:96] = author.ljust(32, b'\x00')

	# Build frame data
	bytes_per_controller = 6 if has_analog else 2
	frame_data = bytearray()

	for frame in movie.frames:
		for ctrl in range(movie.controllers):
			buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0
			word = buttons_to_psx_word(buttons)
			frame_data.extend(struct.pack('<H', word))

			if has_analog:
				lx, ly = frame.analog_l if hasattr(frame, 'analog_l') else (128, 128)
				rx, ry = frame.analog_r if hasattr(frame, 'analog_r') else (128, 128)
				frame_data.extend(bytes([lx, ly, rx, ry]))

	with open(output_path, 'wb') as f:
		f.write(header)
		f.write(frame_data)

	print(f"Created PXM: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


def create_pjm_file(movie: MovieInfo, output_path: Path):
	"""Create a PSXjin .pjm movie file."""
	header = bytearray(256)

	# Signature
	header[0:4] = PJM_SIGNATURE

	# Version
	struct.pack_into('<I', header, 4, 2)

	# Flags
	flags = 0
	if movie.start_from_savestate:
		flags |= 0x01
	struct.pack_into('<I', header, 8, flags)

	# Controller flags
	has_analog = movie.controller_type == "analog"
	ctrl_flags = 2 if has_analog else 1  # Port 1 type
	if movie.controllers > 1:
		ctrl_flags |= (2 if has_analog else 1) << 2  # Port 2 type
	struct.pack_into('<I', header, 12, ctrl_flags)

	# Frame count
	struct.pack_into('<I', header, 16, len(movie.frames))

	# Rerecord count
	struct.pack_into('<I', header, 20, movie.rerecord_count)

	# CD info (64 bytes)
	cd_info = movie.rom_name[:63].encode('ascii', errors='replace')
	header[24:88] = cd_info.ljust(64, b'\x00')

	# Build frame data
	bytes_per_controller = 6 if has_analog else 2
	frame_data = bytearray()

	for frame in movie.frames:
		for ctrl in range(movie.controllers):
			buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0
			word = buttons_to_psx_word(buttons)
			frame_data.extend(struct.pack('<H', word))

			if has_analog:
				lx, ly = frame.analog_l if hasattr(frame, 'analog_l') else (128, 128)
				rx, ry = frame.analog_r if hasattr(frame, 'analog_r') else (128, 128)
				frame_data.extend(bytes([lx, ly, rx, ry]))

	with open(output_path, 'wb') as f:
		f.write(header)
		f.write(frame_data)

	print(f"Created PJM: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


def detect_psx_format(filepath: Path) -> Optional[str]:
	"""Detect PlayStation movie format from file extension or signature."""
	ext = filepath.suffix.lower()

	if ext == '.pxm':
		return 'PXM'
	elif ext == '.pjm':
		return 'PJM'

	# Try to detect by signature
	try:
		with open(filepath, 'rb') as f:
			sig = f.read(4)
			if sig == PXM_SIGNATURE:
				return 'PXM'
			elif sig == PJM_SIGNATURE:
				return 'PJM'
	except:
		pass

	return None
