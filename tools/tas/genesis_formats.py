#!/usr/bin/env python3
"""
Sega Genesis/Mega Drive TAS Format Parsers

Supports:
- GMV (Gens) - Binary format, read/write
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Optional

from tas_formats import GenesisButtons, Genesis6Buttons, GENESIS_GMV_BUTTONS, TASSystem


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
	system: str = TASSystem.GENESIS
	frames: List[FrameInput] = field(default_factory=list)
	start_from_savestate: bool = False
	is_6button: bool = False


# =============================================================================
# GMV Format (Gens) - Binary
# =============================================================================

GMV_SIGNATURE = b'Gens Movie TEST9'


def parse_gmv(filepath: Path) -> MovieInfo:
	"""Parse Gens .gmv movie file."""
	movie = MovieInfo()
	movie.system = TASSystem.GENESIS

	with open(filepath, 'rb') as f:
		# Read signature (16 bytes)
		sig = f.read(16)
		if sig != GMV_SIGNATURE:
			raise ValueError(f"Invalid GMV signature: {sig}")

		# Read header
		rerecord_count = struct.unpack('<I', f.read(4))[0]
		controller_config = struct.unpack('<H', f.read(2))[0]
		flags = struct.unpack('<H', f.read(2))[0]

		# Read ROM name (40 bytes, null-terminated)
		rom_name_bytes = f.read(40)
		try:
			movie.rom_name = rom_name_bytes.split(b'\x00')[0].decode('ascii', errors='replace')
		except:
			movie.rom_name = ""

		movie.rerecord_count = rerecord_count

		# Determine controller type and count
		# Flags bit 0: 3-button (0) or 6-button (1)
		movie.is_6button = bool(flags & 0x0001)
		bytes_per_frame = 3 if not movie.is_6button else 4

		# Controller config determines which controllers are active
		ctrl1_active = bool(controller_config & 0x01)
		ctrl2_active = bool(controller_config & 0x02)
		movie.controllers = 2 if ctrl2_active else 1

		# Read frame data
		frame_data = f.read()
		total_bytes = len(frame_data)
		frames_per_set = bytes_per_frame * movie.controllers

		frame_count = total_bytes // frames_per_set if frames_per_set > 0 else 0

		for i in range(frame_count):
			frame = FrameInput(controllers=[])
			base_offset = i * frames_per_set

			for ctrl in range(movie.controllers):
				offset = base_offset + ctrl * bytes_per_frame

				if offset + bytes_per_frame <= len(frame_data):
					if movie.is_6button:
						# 6-button: read 4 bytes
						data = struct.unpack_from('<I', frame_data, offset)[0]
						buttons = data & 0xFFFF  # Use lower 16 bits
					else:
						# 3-button: read 3 bytes (only first byte has buttons)
						data = frame_data[offset]
						buttons = data

					# GMV button format: SACBRLDU (for 3-button)
					# Bit 0: Up, Bit 1: Down, Bit 2: Left, Bit 3: Right
					# Bit 4: B, Bit 5: C, Bit 6: A, Bit 7: Start
					genesis_buttons = 0
					if buttons & 0x01:
						genesis_buttons |= GenesisButtons.UP
					if buttons & 0x02:
						genesis_buttons |= GenesisButtons.DOWN
					if buttons & 0x04:
						genesis_buttons |= GenesisButtons.LEFT
					if buttons & 0x08:
						genesis_buttons |= GenesisButtons.RIGHT
					if buttons & 0x10:
						genesis_buttons |= GenesisButtons.B
					if buttons & 0x20:
						genesis_buttons |= GenesisButtons.C
					if buttons & 0x40:
						genesis_buttons |= GenesisButtons.A
					if buttons & 0x80:
						genesis_buttons |= GenesisButtons.START

					frame.controllers.append(genesis_buttons)
				else:
					frame.controllers.append(0)

			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed GMV: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  6-Button: {movie.is_6button}")
	print(f"  Rerecords: {movie.rerecord_count}")
	print(f"  ROM: {movie.rom_name}")

	return movie


def create_gmv_file(movie: MovieInfo, output_path: Path):
	"""Create a Gens .gmv movie file."""
	with open(output_path, 'wb') as f:
		# Write signature
		f.write(GMV_SIGNATURE)

		# Write header
		f.write(struct.pack('<I', movie.rerecord_count))

		# Controller config
		controller_config = 0x01  # Controller 1 active
		if movie.controllers > 1:
			controller_config |= 0x02  # Controller 2 active
		f.write(struct.pack('<H', controller_config))

		# Flags (0 = 3-button, 1 = 6-button)
		flags = 0x0001 if movie.is_6button else 0x0000
		f.write(struct.pack('<H', flags))

		# ROM name (40 bytes, null-padded)
		rom_name = movie.rom_name[:39].encode('ascii', errors='replace')
		rom_name = rom_name.ljust(40, b'\x00')
		f.write(rom_name)

		# Write frame data
		bytes_per_frame = 4 if movie.is_6button else 3

		for frame in movie.frames:
			for ctrl in range(movie.controllers):
				buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0

				# Convert to GMV format
				data = 0
				if buttons & GenesisButtons.UP:
					data |= 0x01
				if buttons & GenesisButtons.DOWN:
					data |= 0x02
				if buttons & GenesisButtons.LEFT:
					data |= 0x04
				if buttons & GenesisButtons.RIGHT:
					data |= 0x08
				if buttons & GenesisButtons.B:
					data |= 0x10
				if buttons & GenesisButtons.C:
					data |= 0x20
				if buttons & GenesisButtons.A:
					data |= 0x40
				if buttons & GenesisButtons.START:
					data |= 0x80

				if movie.is_6button:
					f.write(struct.pack('<I', data))
				else:
					f.write(bytes([data, 0, 0]))  # 3 bytes per frame

	print(f"Created GMV: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


# =============================================================================
# Button Conversion
# =============================================================================

def genesis_to_bk2_text(buttons: int, is_6button: bool = False) -> str:
	"""Convert Genesis buttons to BK2 text format."""
	result = ""
	button_order = [
		(GenesisButtons.UP, 'U'),
		(GenesisButtons.DOWN, 'D'),
		(GenesisButtons.LEFT, 'L'),
		(GenesisButtons.RIGHT, 'R'),
		(GenesisButtons.START, 'S'),
		(GenesisButtons.A, 'A'),
		(GenesisButtons.C, 'C'),
		(GenesisButtons.B, 'B'),
	]

	if is_6button:
		button_order.extend([
			(Genesis6Buttons.X, 'X'),
			(Genesis6Buttons.Y, 'Y'),
			(Genesis6Buttons.Z, 'Z'),
			(Genesis6Buttons.MODE, 'M'),
		])

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += '.'

	return result


def bk2_text_to_genesis(text: str, is_6button: bool = False) -> int:
	"""Convert BK2 text to Genesis buttons."""
	buttons = 0
	button_map = {
		0: GenesisButtons.UP,
		1: GenesisButtons.DOWN,
		2: GenesisButtons.LEFT,
		3: GenesisButtons.RIGHT,
		4: GenesisButtons.START,
		5: GenesisButtons.A,
		6: GenesisButtons.C,
		7: GenesisButtons.B,
	}

	for i, char in enumerate(text):
		if char != '.' and i in button_map:
			buttons |= button_map[i]

	return buttons
