#!/usr/bin/env python3
"""
NES TAS Format Parsers

Supports:
- FM2 (FCEUX) - Text format, read/write
- FCM (FCEU legacy) - Binary format, read only
- FMV (Famtasia) - Binary format, read only
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Optional, Tuple

from tas_formats import NesButtons, NES_FM2_BUTTONS, TASSystem


@dataclass
class FrameInput:
	"""Input data for a single frame."""
	controllers: List[int] = field(default_factory=list)
	commands: int = 0  # Reset, power, etc.


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
	system: str = TASSystem.NES
	frames: List[FrameInput] = field(default_factory=list)
	start_from_savestate: bool = False
	pal: bool = False


# =============================================================================
# FM2 Format (FCEUX) - Text
# =============================================================================

def parse_fm2(filepath: Path) -> MovieInfo:
	"""Parse FCEUX .fm2 movie file (text format)."""
	movie = MovieInfo()
	movie.system = TASSystem.NES

	with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
		for line in f:
			line = line.strip()

			# Parse header key-value pairs
			if ' ' in line and not line.startswith('|'):
				key, value = line.split(' ', 1)
				if key == 'version':
					pass  # Version number
				elif key == 'emuVersion':
					pass  # Emulator version
				elif key == 'rerecordCount':
					movie.rerecord_count = int(value) if value.isdigit() else 0
				elif key == 'palFlag':
					movie.pal = value == '1'
				elif key == 'romFilename':
					movie.rom_name = value
				elif key == 'romChecksum':
					movie.rom_checksum = value
				elif key == 'comment':
					if movie.description:
						movie.description += '\n'
					movie.description += value
				elif key == 'subtitle':
					pass  # Subtitles
				elif key == 'guid':
					pass  # Unique ID

			# Parse input frames: |flags|port0|port1|
			elif line.startswith('|'):
				parts = line.split('|')
				if len(parts) >= 3:
					frame = FrameInput(controllers=[])

					# Parse command flags (reset, etc.)
					try:
						frame.commands = int(parts[1]) if parts[1].isdigit() else 0
					except (ValueError, IndexError):
						frame.commands = 0

					# Parse controller inputs (RLDUTSBA format)
					for i in range(2, min(4, len(parts))):
						buttons = 0
						ctrl_text = parts[i] if i < len(parts) else ''
						# FM2 format: RLDUTSBA (8 chars)
						for j, char in enumerate(ctrl_text[:8]):
							if char != '.':
								if j == 0 and char.upper() == 'R':
									buttons |= NesButtons.RIGHT
								elif j == 1 and char.upper() == 'L':
									buttons |= NesButtons.LEFT
								elif j == 2 and char.upper() == 'D':
									buttons |= NesButtons.DOWN
								elif j == 3 and char.upper() == 'U':
									buttons |= NesButtons.UP
								elif j == 4 and char.upper() == 'T':
									buttons |= NesButtons.START
								elif j == 5 and char.upper() == 'S':
									buttons |= NesButtons.SELECT
								elif j == 6 and char.upper() == 'B':
									buttons |= NesButtons.B
								elif j == 7 and char.upper() == 'A':
									buttons |= NesButtons.A
						frame.controllers.append(buttons)

					movie.frames.append(frame)
					movie.controllers = max(movie.controllers, len(frame.controllers))

	movie.frame_count = len(movie.frames)

	print(f"Parsed FM2: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Rerecords: {movie.rerecord_count}")

	return movie


def create_fm2_file(movie: MovieInfo, output_path: Path):
	"""Create an FCEUX .fm2 movie file."""
	lines = []

	# Header
	lines.append("version 3")
	lines.append("emuVersion 20500")
	lines.append(f"rerecordCount {movie.rerecord_count}")
	lines.append(f"palFlag {'1' if movie.pal else '0'}")
	if movie.rom_name:
		lines.append(f"romFilename {movie.rom_name}")
	if movie.rom_checksum:
		lines.append(f"romChecksum {movie.rom_checksum}")
	if movie.author:
		lines.append(f"comment author {movie.author}")
	lines.append("fourscore 0")
	lines.append("microphone 0")
	lines.append("port0 1")
	lines.append(f"port1 {1 if movie.controllers > 1 else 0}")
	lines.append("port2 0")

	# Frames
	for frame in movie.frames:
		line = f"|{frame.commands}|"
		for i in range(max(2, movie.controllers)):
			buttons = frame.controllers[i] if i < len(frame.controllers) else 0
			# FM2 format: RLDUTSBA
			ctrl = ""
			ctrl += 'R' if buttons & NesButtons.RIGHT else '.'
			ctrl += 'L' if buttons & NesButtons.LEFT else '.'
			ctrl += 'D' if buttons & NesButtons.DOWN else '.'
			ctrl += 'U' if buttons & NesButtons.UP else '.'
			ctrl += 'T' if buttons & NesButtons.START else '.'
			ctrl += 'S' if buttons & NesButtons.SELECT else '.'
			ctrl += 'B' if buttons & NesButtons.B else '.'
			ctrl += 'A' if buttons & NesButtons.A else '.'
			line += ctrl + '|'
		lines.append(line)

	with open(output_path, 'w', encoding='utf-8') as f:
		f.write('\n'.join(lines))

	print(f"Created FM2: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


# =============================================================================
# FCM Format (FCEU Legacy) - Binary
# =============================================================================

def parse_fcm(filepath: Path) -> MovieInfo:
	"""Parse FCEU .fcm movie file (legacy binary format)."""
	movie = MovieInfo()
	movie.system = TASSystem.NES

	with open(filepath, 'rb') as f:
		# Read signature
		sig = f.read(4)
		if sig != b'FCM\x1a':
			raise ValueError(f"Invalid FCM signature: {sig}")

		# Read header
		version = struct.unpack('<I', f.read(4))[0]
		flags = struct.unpack('<B', f.read(1))[0]
		f.read(3)  # Reserved
		frame_count = struct.unpack('<I', f.read(4))[0]
		rerecord_count = struct.unpack('<I', f.read(4))[0]
		movie_data_size = struct.unpack('<I', f.read(4))[0]
		savestate_offset = struct.unpack('<I', f.read(4))[0]
		movie_data_offset = struct.unpack('<I', f.read(4))[0]
		md5 = f.read(16)
		emu_version = struct.unpack('<I', f.read(4))[0]

		movie.rerecord_count = rerecord_count
		movie.start_from_savestate = savestate_offset > 0
		movie.rom_checksum = md5.hex()

		# FCM uses delta encoding - complex to parse
		# For now, read basic structure
		f.seek(movie_data_offset)
		movie_data = f.read(movie_data_size)

		# Parse delta-encoded input
		# FCM format uses variable-length encoding
		# This is a simplified parser that may not handle all cases
		controller_state = [0, 0]
		pos = 0

		while pos < len(movie_data) and len(movie.frames) < frame_count:
			if pos >= len(movie_data):
				break

			byte = movie_data[pos]
			pos += 1

			# Decode command
			# Bit 7: controller update follows
			# Bit 6: controller 1 updated
			# Bits 0-5: frame advance count

			frame_advance = byte & 0x3F
			ctrl_update = byte & 0x80
			ctrl1_updated = byte & 0x40

			# Add frames with current state
			for _ in range(frame_advance):
				frame = FrameInput(controllers=list(controller_state))
				movie.frames.append(frame)

			# Handle controller updates
			if ctrl_update and pos < len(movie_data):
				ctrl_byte = movie_data[pos]
				pos += 1
				# Update controller state
				if ctrl1_updated:
					controller_state[0] = ctrl_byte
				else:
					controller_state[1] = ctrl_byte

		# Convert to NesButtons format
		for frame in movie.frames:
			for i, ctrl in enumerate(frame.controllers):
				# FCM bit order: A B Select Start Up Down Left Right
				buttons = 0
				if ctrl & 0x01:
					buttons |= NesButtons.A
				if ctrl & 0x02:
					buttons |= NesButtons.B
				if ctrl & 0x04:
					buttons |= NesButtons.SELECT
				if ctrl & 0x08:
					buttons |= NesButtons.START
				if ctrl & 0x10:
					buttons |= NesButtons.UP
				if ctrl & 0x20:
					buttons |= NesButtons.DOWN
				if ctrl & 0x40:
					buttons |= NesButtons.LEFT
				if ctrl & 0x80:
					buttons |= NesButtons.RIGHT
				frame.controllers[i] = buttons

	movie.frame_count = len(movie.frames)
	movie.controllers = 2 if any(f.controllers[1] if len(f.controllers) > 1 else 0 for f in movie.frames) else 1

	print(f"Parsed FCM: {filepath.name}")
	print(f"  Version: {version}")
	print(f"  Frames: {movie.frame_count} (header said {frame_count})")
	print(f"  Rerecords: {movie.rerecord_count}")

	return movie


# =============================================================================
# FMV Format (Famtasia) - Binary
# =============================================================================

def parse_fmv(filepath: Path) -> MovieInfo:
	"""Parse Famtasia .fmv movie file."""
	movie = MovieInfo()
	movie.system = TASSystem.NES

	with open(filepath, 'rb') as f:
		# Read signature
		sig = f.read(4)
		if sig != b'FMV\x1a':
			raise ValueError(f"Invalid FMV signature: {sig}")

		# Read flags
		flags = struct.unpack('<B', f.read(1))[0]
		f.read(8)  # Reserved

		# Determine controller count from flags
		ctrl1_active = flags & 0x01
		ctrl2_active = flags & 0x02

		movie.controllers = 1
		if ctrl2_active:
			movie.controllers = 2

		# Read frame data
		# Each frame is 1 byte per active controller
		bytes_per_frame = movie.controllers

		# Read all remaining data as frames
		frame_data = f.read()
		frame_count = len(frame_data) // bytes_per_frame

		for i in range(frame_count):
			frame = FrameInput(controllers=[])
			for ctrl in range(movie.controllers):
				offset = i * bytes_per_frame + ctrl
				if offset < len(frame_data):
					byte = frame_data[offset]
					# FMV bit order: ABSTUDLR
					buttons = 0
					if byte & 0x80:
						buttons |= NesButtons.A
					if byte & 0x40:
						buttons |= NesButtons.B
					if byte & 0x20:
						buttons |= NesButtons.SELECT
					if byte & 0x10:
						buttons |= NesButtons.START
					if byte & 0x08:
						buttons |= NesButtons.UP
					if byte & 0x04:
						buttons |= NesButtons.DOWN
					if byte & 0x02:
						buttons |= NesButtons.LEFT
					if byte & 0x01:
						buttons |= NesButtons.RIGHT
					frame.controllers.append(buttons)
				else:
					frame.controllers.append(0)
			movie.frames.append(frame)

	movie.frame_count = len(movie.frames)

	print(f"Parsed FMV: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")

	return movie


def create_fcm_file(movie: MovieInfo, output_path: Path):
	"""Create an FCEU .fcm movie file (legacy binary format).

	Note: FCM uses delta encoding which is complex. This creates a simplified
	version that may not be fully compatible with all FCM readers.
	"""
	# FCM header structure
	header = bytearray(56)

	# Signature
	header[0:4] = b'FCM\x1a'

	# Version (2)
	struct.pack_into('<I', header, 4, 2)

	# Flags (0)
	header[8] = 0

	# Frame count
	struct.pack_into('<I', header, 12, len(movie.frames))

	# Rerecord count
	struct.pack_into('<I', header, 16, movie.rerecord_count)

	# Build movie data with simple delta encoding
	movie_data = bytearray()
	prev_state = [0, 0]

	for frame in movie.frames:
		# Convert buttons to FCM format
		ctrl_bytes = []
		for i in range(2):
			buttons = frame.controllers[i] if i < len(frame.controllers) else 0
			byte = 0
			if buttons & NesButtons.A:
				byte |= 0x01
			if buttons & NesButtons.B:
				byte |= 0x02
			if buttons & NesButtons.SELECT:
				byte |= 0x04
			if buttons & NesButtons.START:
				byte |= 0x08
			if buttons & NesButtons.UP:
				byte |= 0x10
			if buttons & NesButtons.DOWN:
				byte |= 0x20
			if buttons & NesButtons.LEFT:
				byte |= 0x40
			if buttons & NesButtons.RIGHT:
				byte |= 0x80
			ctrl_bytes.append(byte)

		# Simple encoding: 1 frame advance + controller update if changed
		if ctrl_bytes != prev_state:
			# Frame with controller update
			if ctrl_bytes[0] != prev_state[0]:
				movie_data.append(0x81)  # 1 frame + update ctrl0
				movie_data.append(ctrl_bytes[0])
			if ctrl_bytes[1] != prev_state[1]:
				movie_data.append(0xC1)  # 1 frame + update ctrl1
				movie_data.append(ctrl_bytes[1])
			prev_state = list(ctrl_bytes)
		else:
			movie_data.append(0x01)  # Just 1 frame advance

	# Movie data size
	struct.pack_into('<I', header, 20, len(movie_data))

	# Savestate offset (0 = no savestate)
	struct.pack_into('<I', header, 24, 0)

	# Movie data offset
	struct.pack_into('<I', header, 28, 56)

	# MD5 placeholder
	header[32:48] = bytes.fromhex(movie.rom_checksum.ljust(32, '0')[:32]) if movie.rom_checksum else b'\x00' * 16

	# Emu version
	struct.pack_into('<I', header, 48, 9828)

	with open(output_path, 'wb') as f:
		f.write(header)
		f.write(movie_data)

	print(f"Created FCM: {output_path}")
	print(f"  Frames: {len(movie.frames)}")


def create_fmv_file(movie: MovieInfo, output_path: Path):
	"""Create a Famtasia .fmv movie file."""
	# FMV header
	header = bytearray(13)

	# Signature
	header[0:4] = b'FMV\x1a'

	# Flags
	flags = 0x01  # Controller 1 active
	if movie.controllers > 1:
		flags |= 0x02
	header[4] = flags

	# Reserved (8 bytes)
	header[5:13] = b'\x00' * 8

	# Build frame data
	frame_data = bytearray()
	for frame in movie.frames:
		for ctrl in range(movie.controllers):
			buttons = frame.controllers[ctrl] if ctrl < len(frame.controllers) else 0
			# FMV bit order: ABSTUDLR
			byte = 0
			if buttons & NesButtons.A:
				byte |= 0x80
			if buttons & NesButtons.B:
				byte |= 0x40
			if buttons & NesButtons.SELECT:
				byte |= 0x20
			if buttons & NesButtons.START:
				byte |= 0x10
			if buttons & NesButtons.UP:
				byte |= 0x08
			if buttons & NesButtons.DOWN:
				byte |= 0x04
			if buttons & NesButtons.LEFT:
				byte |= 0x02
			if buttons & NesButtons.RIGHT:
				byte |= 0x01
			frame_data.append(byte)

	with open(output_path, 'wb') as f:
		f.write(header)
		f.write(frame_data)

	print(f"Created FMV: {output_path}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


# =============================================================================
# Utility Functions
# =============================================================================

def detect_nes_format(filepath: Path) -> str:
	"""Detect NES movie format from file."""
	ext = filepath.suffix.lower()
	if ext == '.fm2':
		return 'fm2'
	elif ext == '.fcm':
		return 'fcm'
	elif ext == '.fmv':
		return 'fmv'

	# Check signature
	with open(filepath, 'rb') as f:
		sig = f.read(4)
		if sig == b'FCM\x1a':
			return 'fcm'
		elif sig == b'FMV\x1a':
			return 'fmv'

	# Default to FM2 if text
	with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
		first_line = f.readline()
		if first_line.startswith('version') or first_line.startswith('|'):
			return 'fm2'

	return 'unknown'


def convert_nes_buttons_to_snes(nes_buttons: int) -> int:
	"""Convert NES buttons to SNES button format."""
	from tas_formats import SnesButtons
	snes = 0
	if nes_buttons & NesButtons.A:
		snes |= SnesButtons.A
	if nes_buttons & NesButtons.B:
		snes |= SnesButtons.B
	if nes_buttons & NesButtons.SELECT:
		snes |= SnesButtons.SELECT
	if nes_buttons & NesButtons.START:
		snes |= SnesButtons.START
	if nes_buttons & NesButtons.UP:
		snes |= SnesButtons.UP
	if nes_buttons & NesButtons.DOWN:
		snes |= SnesButtons.DOWN
	if nes_buttons & NesButtons.LEFT:
		snes |= SnesButtons.LEFT
	if nes_buttons & NesButtons.RIGHT:
		snes |= SnesButtons.RIGHT
	return snes
