#!/usr/bin/env python3
"""
TAS Format Converter - Convert between TAS replay file formats.

This tool converts TAS (Tool-Assisted Speedrun) replay files between various
emulator formats for SNES games.

Supported input formats:
- SMV (Snes9x)
- BKM (BizHawk legacy text format)
- BK2 (BizHawk ZIP format)
- LSMV (lsnes)

Supported output formats:
- MMO (Mesen2) - ZIP archive containing Input.txt, GameSettings.txt, etc.
- BK2 (BizHawk) - ZIP archive with Header.txt, Input Log.txt, etc.
- SMV (Snes9x) - Binary format with header and controller data

Author: GameInfo Project
License: MIT
"""

import argparse
import hashlib
import os
import re
import struct
import sys
import zipfile
from dataclasses import dataclass, field
from datetime import datetime
from enum import IntFlag
from io import BytesIO
from pathlib import Path
from typing import Optional


class SnesButtons(IntFlag):
	"""SNES controller button flags (as used in SMV format)."""
	# Low byte (directly from controller)
	B = 0x80
	Y = 0x40
	SELECT = 0x20
	START = 0x10
	UP = 0x08
	DOWN = 0x04
	LEFT = 0x02
	RIGHT = 0x01
	# High byte
	A = 0x8000
	X = 0x4000
	L = 0x2000
	R = 0x1000


@dataclass
class MovieInfo:
	"""Common movie metadata across all formats."""
	title: str = ""
	author: str = ""
	description: str = ""
	rom_name: str = ""
	sha1: str = ""
	frame_count: int = 0
	rerecord_count: int = 0
	start_from_savestate: bool = False
	region: str = "NTSC"
	controllers: int = 1
	frames: list = field(default_factory=list)  # List of frame data (per-controller states)


@dataclass
class FrameInput:
	"""Input state for a single frame."""
	controllers: list  # List of button states per controller


# =============================================================================
# Mesen MMO Format (Output)
# =============================================================================

# Mesen2 SNES controller key names: "ABXYLRSTUDLR"
# Mapping: A=0, B=1, X=2, Y=3, L=4, R=5, Select=6, Start=7, Up=8, Down=9, Left=10, Right=11
MESEN_SNES_KEYS = "ABXYLRSTUDLR"


def buttons_to_mesen_text(buttons: int) -> str:
	"""Convert button bitmask to Mesen text format.

	Mesen format uses GetKeyNames() which returns "ABXYLRSTUDLR" for SNES.
	Each position is the letter if pressed, or '.' if not.
	"""
	result = ""
	# Map from our button flags to Mesen key order
	button_order = [
		SnesButtons.A,       # 0: A
		SnesButtons.B,       # 1: B
		SnesButtons.X,       # 2: X
		SnesButtons.Y,       # 3: Y
		SnesButtons.L,       # 4: L
		SnesButtons.R,       # 5: R
		SnesButtons.SELECT,  # 6: S (Select)
		SnesButtons.START,   # 7: T (Start)
		SnesButtons.UP,      # 8: U (Up)
		SnesButtons.DOWN,    # 9: D (Down)
		SnesButtons.LEFT,    # 10: L (Left)
		SnesButtons.RIGHT,   # 11: R (Right)
	]

	for i, btn in enumerate(button_order):
		if buttons & btn:
			result += MESEN_SNES_KEYS[i]
		else:
			result += "."

	return result


def create_mmo_file(movie: MovieInfo, output_path: Path, rom_path: Optional[Path] = None):
	"""Create a Mesen2 .mmo movie file from MovieInfo."""

	# Calculate ROM SHA1 if we have a ROM path
	sha1 = movie.sha1
	rom_name = movie.rom_name
	if rom_path and rom_path.exists():
		with open(rom_path, 'rb') as f:
			sha1 = hashlib.sha1(f.read()).hexdigest().upper()
		rom_name = rom_path.name

	# Create the ZIP archive
	with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zf:
		# GameSettings.txt - Required settings file
		settings = []
		settings.append("MesenVersion 2.0.0")
		settings.append("MovieFormatVersion 2")
		settings.append(f"GameFile {rom_name}")
		if sha1:
			settings.append(f"SHA1 {sha1}")

		# Add console type
		settings.append("emu.consoleType Snes")
		settings.append("emu.region Auto")

		# Controller configuration
		settings.append("snes.port1.type SnesController")
		if movie.controllers > 1:
			settings.append("snes.port2.type SnesController")
		else:
			settings.append("snes.port2.type None")

		zf.writestr("GameSettings.txt", "\n".join(settings).encode('utf-8'))

		# MovieInfo.txt - Optional metadata
		info = []
		if movie.author:
			# Sanitize author name to avoid encoding issues in console output
			safe_author = movie.author.encode('ascii', errors='replace').decode('ascii')
			info.append(f"Author {safe_author}")
		if movie.description:
			safe_desc = movie.description.encode('ascii', errors='replace').decode('ascii')
			info.append(f"Description {safe_desc}")
		info.append(f"RerecordCount {movie.rerecord_count}")

		if info:
			zf.writestr("MovieInfo.txt", "\n".join(info).encode('utf-8'))

		# Input.txt - Frame input data
		input_lines = []
		for frame in movie.frames:
			# Each line starts with | then has controller states separated by |
			line = "|"
			for ctrl_idx in range(max(2, movie.controllers)):
				if ctrl_idx < len(frame.controllers):
					buttons = frame.controllers[ctrl_idx]
					line += buttons_to_mesen_text(buttons)
				else:
					line += "............"  # No input
				line += "|"
			input_lines.append(line.rstrip("|"))

		zf.writestr("Input.txt", "\n".join(input_lines).encode('utf-8'))

	# Safely print output path (avoid unicode issues on Windows console)
	safe_output = str(output_path).encode('ascii', errors='replace').decode('ascii')
	print(f"Created: {safe_output}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


# =============================================================================
# SMV Format (Snes9x)
# =============================================================================

def parse_smv(filepath: Path) -> MovieInfo:
	"""Parse Snes9x .smv movie file."""
	movie = MovieInfo()

	with open(filepath, 'rb') as f:
		data = f.read()

	# Check signature
	if data[:4] != b'SMV\x1a':
		raise ValueError(f"Invalid SMV signature: {data[:4]}")

	# Read header
	version = struct.unpack_from('<I', data, 0x04)[0]
	movie.uid = struct.unpack_from('<I', data, 0x08)[0]
	movie.rerecord_count = struct.unpack_from('<I', data, 0x0c)[0]
	movie.frame_count = struct.unpack_from('<I', data, 0x10)[0]

	controller_mask = data[0x14]
	movie_opts = data[0x15]
	sync_opts = struct.unpack_from('<H', data, 0x16)[0]

	# Offsets
	savestate_offset = struct.unpack_from('<I', data, 0x18)[0]
	controller_data_offset = struct.unpack_from('<I', data, 0x1c)[0]

	# Version-specific header parsing
	if version >= 4:  # v1.51+
		# Extended header at 0x20+
		pass  # Additional fields available but not critical for conversion

	# Count active controllers
	movie.controllers = bin(controller_mask).count('1')
	if movie.controllers == 0:
		movie.controllers = 1  # At least one controller

	# Movie start type
	movie.start_from_savestate = bool(movie_opts & 0x01)

	# Parse controller data
	# Each frame has 2 bytes per controller
	bytes_per_frame = 2 * 5  # Up to 5 controllers (though usually 1-2)

	# Count actual controllers from mask
	active_controllers = []
	for i in range(5):
		if controller_mask & (1 << i):
			active_controllers.append(i)

	if not active_controllers:
		active_controllers = [0]  # Default to controller 1

	bytes_per_frame = 2 * len(active_controllers)

	# Extract frames
	pos = controller_data_offset
	frame_num = 0

	while pos + bytes_per_frame <= len(data) and frame_num < movie.frame_count:
		frame = FrameInput(controllers=[])

		for ctrl_idx in range(len(active_controllers)):
			# SMV stores as little-endian 16-bit
			btn_data = struct.unpack_from('<H', data, pos + ctrl_idx * 2)[0]

			# Convert SMV button format to our standard format
			# SMV format: BYsSUDLR AXLR----
			# Low byte: R=0x01, L=0x02, D=0x04, U=0x08, Start=0x10, Select=0x20, Y=0x40, B=0x80
			# High byte: ----=0x00, R=0x10, L=0x20, X=0x40, A=0x80
			buttons = 0

			# Low byte mappings
			if btn_data & 0x80:  # B
				buttons |= SnesButtons.B
			if btn_data & 0x40:  # Y
				buttons |= SnesButtons.Y
			if btn_data & 0x20:  # Select
				buttons |= SnesButtons.SELECT
			if btn_data & 0x10:  # Start
				buttons |= SnesButtons.START
			if btn_data & 0x08:  # Up
				buttons |= SnesButtons.UP
			if btn_data & 0x04:  # Down
				buttons |= SnesButtons.DOWN
			if btn_data & 0x02:  # Left
				buttons |= SnesButtons.LEFT
			if btn_data & 0x01:  # Right
				buttons |= SnesButtons.RIGHT

			# High byte mappings
			if btn_data & 0x8000:  # A
				buttons |= SnesButtons.A
			if btn_data & 0x4000:  # X
				buttons |= SnesButtons.X
			if btn_data & 0x2000:  # L shoulder
				buttons |= SnesButtons.L
			if btn_data & 0x1000:  # R shoulder
				buttons |= SnesButtons.R

			frame.controllers.append(buttons)

		movie.frames.append(frame)
		pos += bytes_per_frame
		frame_num += 1

	movie.controllers = len(active_controllers)

	print(f"Parsed SMV: {filepath.name}")
	print(f"  Version: {version}")
	print(f"  Frames: {len(movie.frames)} (header says {movie.frame_count})")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Rerecords: {movie.rerecord_count}")

	return movie


# =============================================================================
# BKM Format (BizHawk)
# =============================================================================

def parse_bkm(filepath: Path) -> MovieInfo:
	"""Parse BizHawk .bkm movie file."""
	movie = MovieInfo()

	with open(filepath, 'r', encoding='utf-8', errors='replace') as f:
		lines = f.readlines()

	# Parse header
	in_header = True

	for line in lines:
		line = line.strip()

		if line.startswith('|'):
			in_header = False
			# Parse input line
			# Format: |F|controller1|controller2|controller3|controller4|
			# Each controller section has ~12 characters for SNES
			parts = line.split('|')

			# Skip empty parts and frame marker
			frame = FrameInput(controllers=[])

			for i, part in enumerate(parts):
				if i == 0 or not part:  # Skip leading empty or frame marker
					continue
				if i == 1 and len(part) <= 2:  # Frame marker (like "." or "F")
					continue

				# Parse controller state
				# BKM SNES format: "UDLRSsABXYLR" or similar
				# Each character is a button letter if pressed, or '.' if not
				buttons = 0

				if len(part) >= 12:  # Standard SNES controller
					# BKM format: UDLR Ss ?? ?? AB XY LR
					# Position mapping (observed from samples):
					# 0=U, 1=D, 2=L, 3=R, 4=S(Select), 5=s(Start),
					# 6-7=??, 8=A, 9=B, 10=X, 11=Y (varies by BizHawk version)

					# Try to detect format from character positions
					for j, c in enumerate(part):
						if c == 'U':
							buttons |= SnesButtons.UP
						elif c == 'D':
							buttons |= SnesButtons.DOWN
						elif c == 'L' and j < 4:  # Left (not L button)
							buttons |= SnesButtons.LEFT
						elif c == 'R' and j < 4:  # Right (not R button)
							buttons |= SnesButtons.RIGHT
						elif c == 'S':  # Select or Start
							if j == 4:
								buttons |= SnesButtons.SELECT
							elif j == 5:
								buttons |= SnesButtons.START
						elif c == 's':  # Start (lowercase)
							buttons |= SnesButtons.START
						elif c == 'A':
							buttons |= SnesButtons.A
						elif c == 'B':
							buttons |= SnesButtons.B
						elif c == 'X':
							buttons |= SnesButtons.X
						elif c == 'Y':
							buttons |= SnesButtons.Y
						elif c == 'l':  # L shoulder (lowercase)
							buttons |= SnesButtons.L
						elif c == 'r':  # R shoulder (lowercase)
							buttons |= SnesButtons.R

				frame.controllers.append(buttons)

			if frame.controllers:
				movie.frames.append(frame)
				movie.controllers = max(movie.controllers, len(frame.controllers))

		elif in_header:
			# Parse header fields
			if line.startswith('GameName'):
				movie.rom_name = line.split(' ', 1)[1] if ' ' in line else ""
			elif line.startswith('Author'):
				movie.author = line.split(' ', 1)[1] if ' ' in line else ""
			elif line.startswith('rerecordCount'):
				try:
					movie.rerecord_count = int(line.split(' ', 1)[1])
				except (ValueError, IndexError):
					pass
			elif line.startswith('SHA1'):
				movie.sha1 = line.split(' ', 1)[1] if ' ' in line else ""

	movie.frame_count = len(movie.frames)

	print(f"Parsed BKM: {filepath.name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Author: {movie.author}")
	print(f"  ROM: {movie.rom_name}")

	return movie


# =============================================================================
# LSMV Format (lsnes)
# =============================================================================

def parse_lsmv(filepath: Path) -> MovieInfo:
	"""Parse lsnes .lsmv movie file."""
	movie = MovieInfo()

	with zipfile.ZipFile(filepath, 'r') as zf:
		# Read metadata files
		try:
			gamename = zf.read('gamename').decode('utf-8').strip()
			movie.rom_name = gamename
		except KeyError:
			pass

		try:
			authors = zf.read('authors').decode('utf-8').strip()
			movie.author = authors
		except KeyError:
			pass

		try:
			rerecords = zf.read('rerecords').decode('utf-8').strip()
			movie.rerecord_count = int(rerecords)
		except (KeyError, ValueError):
			pass

		try:
			sha256 = zf.read('rom.sha256').decode('utf-8').strip()
			# Convert SHA256 to something usable (we don't have SHA1)
		except KeyError:
			pass

		try:
			gametype = zf.read('gametype').decode('utf-8').strip()
			if 'pal' in gametype.lower():
				movie.region = 'PAL'
			else:
				movie.region = 'NTSC'
		except KeyError:
			pass

		# Read input data
		try:
			input_data = zf.read('input').decode('utf-8')
		except KeyError:
			raise ValueError("No input data found in LSMV file")

		# Parse input lines
		# LSMV format: "F. X Y|BYsSudlrAXLR|..." or similar
		# The format after the first | is: BYsSudlrAXLR (per controller)
		# Each character is the button letter if pressed, or '.' if not

		for line in input_data.split('\n'):
			line = line.strip()
			if not line:
				continue

			# Check if it's a frame line (starts with F or .)
			if not (line.startswith('F') or line.startswith('.')):
				continue

			# Split by |
			parts = line.split('|')

			frame = FrameInput(controllers=[])

			# First part is frame marker + optional coordinates
			# Skip to controller parts (after first |)
			for i, part in enumerate(parts[1:]):
				if not part:
					continue

				# Parse LSMV controller state
				# Format: BYsSudlrAXLR.... (16 chars for SNES gamepad)
				# Or: BYsS.d.r.X.R.1.3 / B.s.u.l.A.L.0.2. (observed)
				buttons = 0

				for c in part:
					if c == 'B':
						buttons |= SnesButtons.B
					elif c == 'Y':
						buttons |= SnesButtons.Y
					elif c == 's':  # Select (lowercase)
						buttons |= SnesButtons.SELECT
					elif c == 'S':  # Start
						buttons |= SnesButtons.START
					elif c == 'u':  # Up (lowercase)
						buttons |= SnesButtons.UP
					elif c == 'd':  # Down (lowercase)
						buttons |= SnesButtons.DOWN
					elif c == 'l':  # Left (lowercase)
						buttons |= SnesButtons.LEFT
					elif c == 'r':  # Right (lowercase)
						buttons |= SnesButtons.RIGHT
					elif c == 'A':
						buttons |= SnesButtons.A
					elif c == 'X':
						buttons |= SnesButtons.X
					elif c == 'L':  # L shoulder
						buttons |= SnesButtons.L
					elif c == 'R':  # R shoulder
						buttons |= SnesButtons.R

				frame.controllers.append(buttons)

			if frame.controllers:
				movie.frames.append(frame)
				movie.controllers = max(movie.controllers, len(frame.controllers))

	movie.frame_count = len(movie.frames)

	# Safely print (handle unicode on Windows console)
	safe_name = filepath.name.encode('ascii', errors='replace').decode('ascii')
	safe_author = (movie.author or '').encode('ascii', errors='replace').decode('ascii')
	safe_rom = (movie.rom_name or '').encode('ascii', errors='replace').decode('ascii')
	print(f"Parsed LSMV: {safe_name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Author: {safe_author}")
	print(f"  ROM: {safe_rom}")

	return movie


# =============================================================================
# BK2 Format (BizHawk - ZIP-based)
# =============================================================================

# BK2 SNES LogKey: #Reset|Power|#P1 Up|P1 Down|P1 Left|P1 Right|P1 Select|P1 Start|P1 Y|P1 B|P1 X|P1 A|P1 L|P1 R|
# Button order in input: U, D, L, R, s(Select), S(Start), Y, B, X, A, L, R
BK2_SNES_BUTTONS = "UDLRsSYBXALR"


def parse_bk2(filepath: Path) -> MovieInfo:
	"""Parse BizHawk .bk2 movie file (ZIP format)."""
	movie = MovieInfo()

	with zipfile.ZipFile(filepath, 'r') as zf:
		# Read header
		header_data = zf.read('Header.txt').decode('utf-8')
		for line in header_data.split('\n'):
			line = line.strip()
			if ' ' in line:
				key, value = line.split(' ', 1)
				if key == 'Author':
					movie.author = value
				elif key == 'rerecordCount':
					movie.rerecord_count = int(value) if value.isdigit() else 0
				elif key == 'GameName':
					movie.rom_name = value
				elif key == 'SHA1':
					movie.sha1 = value
				elif key == 'Platform':
					movie.region = value  # Store platform as region

		# Read input log
		input_data = zf.read('Input Log.txt').decode('utf-8')
		lines = input_data.split('\n')

		# Parse LogKey to understand button order
		log_key = None
		for line in lines:
			if line.startswith('LogKey:'):
				log_key = line[7:]  # Remove 'LogKey:' prefix
				break

		# Parse input frames
		for line in lines:
			if not line.startswith('|'):
				continue

			parts = line.split('|')
			frame = FrameInput(controllers=[])

			# First part after | is typically reset/power (2 chars like "..")
			# Second part is controller 1
			# Third part (if present) is controller 2
			ctrl_idx = 0
			for i, part in enumerate(parts):
				if i == 0:  # Empty before first |
					continue
				if i == 1 and len(part) <= 2:  # Reset/Power section
					continue
				if not part:
					continue

				# Parse controller input
				buttons = 0
				if len(part) >= 12:  # SNES controller has 12 buttons
					# BK2 format: UDLR sS YB XA LR
					for j, char in enumerate(part[:12]):
						if char != '.':
							# Map position to button
							if j == 0:   buttons |= SnesButtons.UP
							elif j == 1: buttons |= SnesButtons.DOWN
							elif j == 2: buttons |= SnesButtons.LEFT
							elif j == 3: buttons |= SnesButtons.RIGHT
							elif j == 4: buttons |= SnesButtons.SELECT
							elif j == 5: buttons |= SnesButtons.START
							elif j == 6: buttons |= SnesButtons.Y
							elif j == 7: buttons |= SnesButtons.B
							elif j == 8: buttons |= SnesButtons.X
							elif j == 9: buttons |= SnesButtons.A
							elif j == 10: buttons |= SnesButtons.L
							elif j == 11: buttons |= SnesButtons.R

				frame.controllers.append(buttons)
				ctrl_idx += 1

			if frame.controllers:
				movie.frames.append(frame)
				movie.controllers = max(movie.controllers, len(frame.controllers))

	movie.frame_count = len(movie.frames)

	safe_name = filepath.name.encode('ascii', errors='replace').decode('ascii')
	safe_author = (movie.author or '').encode('ascii', errors='replace').decode('ascii')
	print(f"Parsed BK2: {safe_name}")
	print(f"  Frames: {movie.frame_count}")
	print(f"  Controllers: {movie.controllers}")
	print(f"  Author: {safe_author}")
	print(f"  Rerecords: {movie.rerecord_count}")

	return movie


def buttons_to_bk2_text(buttons: int) -> str:
	"""Convert button bitmask to BK2 text format.

	BK2 format for SNES: UDLR sS YB XA LR (12 characters)
	"""
	result = ""
	# BK2 button order
	button_order = [
		(SnesButtons.UP, 'U'),
		(SnesButtons.DOWN, 'D'),
		(SnesButtons.LEFT, 'L'),
		(SnesButtons.RIGHT, 'R'),
		(SnesButtons.SELECT, 's'),
		(SnesButtons.START, 'S'),
		(SnesButtons.Y, 'Y'),
		(SnesButtons.B, 'B'),
		(SnesButtons.X, 'X'),
		(SnesButtons.A, 'A'),
		(SnesButtons.L, 'L'),
		(SnesButtons.R, 'R'),
	]

	for btn, char in button_order:
		if buttons & btn:
			result += char
		else:
			result += "."

	return result


def create_bk2_file(movie: MovieInfo, output_path: Path, rom_path: Optional[Path] = None):
	"""Create a BizHawk .bk2 movie file from MovieInfo."""

	# Create the ZIP archive
	with zipfile.ZipFile(output_path, 'w', zipfile.ZIP_DEFLATED) as zf:
		# Header.txt
		header = []
		header.append("MovieVersion BizHawk v2.0.0")
		header.append(f"rerecordCount {movie.rerecord_count}")
		if movie.author:
			safe_author = movie.author.encode('ascii', errors='replace').decode('ascii')
			header.append(f"Author {safe_author}")
		header.append("emuVersion Version 2.9.1")
		header.append("Platform SNES")
		if movie.rom_name:
			header.append(f"GameName {movie.rom_name}")
		if movie.sha1:
			header.append(f"SHA1 {movie.sha1.upper()}")
		header.append("Core BSNES")

		zf.writestr("Header.txt", "\n".join(header).encode('utf-8'))

		# Input Log.txt
		input_lines = []
		input_lines.append("[Input]")

		# Generate LogKey based on controller count
		log_key = "LogKey:#Reset|Power|"
		for ctrl in range(max(1, movie.controllers)):
			ctrl_name = f"P{ctrl+1}"
			log_key += f"#{ctrl_name} Up|{ctrl_name} Down|{ctrl_name} Left|{ctrl_name} Right|"
			log_key += f"{ctrl_name} Select|{ctrl_name} Start|{ctrl_name} Y|{ctrl_name} B|"
			log_key += f"{ctrl_name} X|{ctrl_name} A|{ctrl_name} L|{ctrl_name} R|"
		input_lines.append(log_key)

		# Write frames
		for frame in movie.frames:
			line = "|..|"  # Reset/Power off
			for ctrl_idx in range(max(1, movie.controllers)):
				if ctrl_idx < len(frame.controllers):
					buttons = frame.controllers[ctrl_idx]
					line += buttons_to_bk2_text(buttons)
				else:
					line += "............"  # 12 dots for no input
				line += "|"
			input_lines.append(line)

		zf.writestr("Input Log.txt", "\n".join(input_lines).encode('utf-8'))

		# Comments.txt (optional)
		if movie.description:
			zf.writestr("Comments.txt", movie.description.encode('utf-8'))

		# Subtitles.txt (empty)
		zf.writestr("Subtitles.txt", "".encode('utf-8'))

		# SyncSettings.json (minimal SNES settings)
		sync_settings = '{"o":{"LeftPort":"Gamepad","RightPort":"None"}}'
		if movie.controllers > 1:
			sync_settings = '{"o":{"LeftPort":"Gamepad","RightPort":"Gamepad"}}'
		zf.writestr("SyncSettings.json", sync_settings.encode('utf-8'))

	safe_output = str(output_path).encode('ascii', errors='replace').decode('ascii')
	print(f"Created BK2: {safe_output}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


def buttons_to_smv_bytes(buttons: int) -> bytes:
	"""Convert button bitmask to SMV 16-bit format."""
	# SMV format: low byte = BYsSUDLR, high byte = AXLR----
	low = 0
	high = 0

	if buttons & SnesButtons.B: low |= 0x80
	if buttons & SnesButtons.Y: low |= 0x40
	if buttons & SnesButtons.SELECT: low |= 0x20
	if buttons & SnesButtons.START: low |= 0x10
	if buttons & SnesButtons.UP: low |= 0x08
	if buttons & SnesButtons.DOWN: low |= 0x04
	if buttons & SnesButtons.LEFT: low |= 0x02
	if buttons & SnesButtons.RIGHT: low |= 0x01

	if buttons & SnesButtons.A: high |= 0x80
	if buttons & SnesButtons.X: high |= 0x40
	if buttons & SnesButtons.L: high |= 0x20
	if buttons & SnesButtons.R: high |= 0x10

	return struct.pack('<BB', low, high)


def create_smv_file(movie: MovieInfo, output_path: Path):
	"""Create a Snes9x .smv movie file from MovieInfo."""

	# SMV v1.51 header format (32 bytes)
	header = bytearray(32)

	# Signature
	header[0:4] = b'SMV\x1a'

	# Version (1.51 = 4)
	struct.pack_into('<I', header, 0x04, 4)

	# UID (random or timestamp)
	struct.pack_into('<I', header, 0x08, int(datetime.now().timestamp()) & 0xFFFFFFFF)

	# Rerecord count
	struct.pack_into('<I', header, 0x0c, movie.rerecord_count)

	# Frame count
	struct.pack_into('<I', header, 0x10, len(movie.frames))

	# Controller flags (which controllers are active)
	ctrl_flags = 0
	for i in range(movie.controllers):
		ctrl_flags |= (1 << i)
	header[0x14] = ctrl_flags

	# Movie flags (0x17): bit 0 = starts from savestate, bit 1 = PAL
	movie_flags = 0
	if movie.start_from_savestate:
		movie_flags |= 0x01
	if movie.region == "PAL":
		movie_flags |= 0x02
	header[0x17] = movie_flags

	# Offset to controller data (after header)
	struct.pack_into('<I', header, 0x1c, 32)

	# Build the file
	output_data = bytes(header)

	# Add frame data
	for frame in movie.frames:
		for ctrl_idx in range(movie.controllers):
			if ctrl_idx < len(frame.controllers):
				output_data += buttons_to_smv_bytes(frame.controllers[ctrl_idx])
			else:
				output_data += b'\x00\x00'

	with open(output_path, 'wb') as f:
		f.write(output_data)

	safe_output = str(output_path).encode('ascii', errors='replace').decode('ascii')
	print(f"Created SMV: {safe_output}")
	print(f"  Frames: {len(movie.frames)}")
	print(f"  Controllers: {movie.controllers}")


# =============================================================================
# Main Conversion Logic
# =============================================================================

def detect_format(filepath: Path) -> str:
	"""Detect the TAS format from file extension or content."""
	ext = filepath.suffix.lower()

	if ext == '.smv':
		return 'smv'
	elif ext == '.bkm':
		return 'bkm'
	elif ext == '.bk2':
		return 'bk2'
	elif ext == '.lsmv':
		return 'lsmv'
	elif ext == '.mmo':
		return 'mmo'
	else:
		# Try to detect from content
		with open(filepath, 'rb') as f:
			header = f.read(4)

		if header == b'SMV\x1a':
			return 'smv'
		elif header[:2] == b'PK':  # ZIP file (could be LSMV, BK2, or MMO)
			# Check ZIP contents to distinguish
			try:
				with zipfile.ZipFile(filepath, 'r') as zf:
					names = zf.namelist()
					if 'Header.txt' in names or 'Header' in names:
						return 'bk2'
					elif 'input' in names or 'gametype' in names:
						return 'lsmv'
					elif 'Input.txt' in names or 'GameSettings.txt' in names:
						return 'mmo'
			except zipfile.BadZipFile:
				pass
		else:
			# Might be BKM (text format)
			try:
				with open(filepath, 'r', encoding='utf-8') as f:
					first_lines = f.read(1000)
				if 'emuVersion' in first_lines or 'Platform' in first_lines:
					return 'bkm'
			except UnicodeDecodeError:
				pass

	raise ValueError(f"Unknown TAS format: {filepath}")


def extract_game_name(filepath: Path, movie: MovieInfo) -> str:
	"""Extract or infer game name from file path or movie info."""
	# Try to get from movie metadata
	if movie.rom_name:
		# Clean up ROM name to get game name
		name = movie.rom_name
		name = re.sub(r'\.(sfc|smc|nes|gb|gbc|gba)$', '', name, flags=re.IGNORECASE)
		name = re.sub(r'\s*\([^)]*\)\s*', ' ', name)  # Remove (USA), (U), etc.
		name = re.sub(r'\s*\[[^\]]*\]\s*', ' ', name)  # Remove [!], etc.
		name = name.strip()
		if name:
			return sanitize_filename(name)  # Apply sanitization!

	# Extract from filename
	# Pattern: author-gamename.ext or gamename.ext
	stem = filepath.stem

	# Remove author prefix if present (author-gamename format)
	if '-' in stem:
		parts = stem.split('-', 1)
		# Check if first part looks like an author name
		if len(parts[0]) < 20 and parts[0].isalnum():
			return sanitize_filename(parts[1].replace('-', ' ').title())

	return sanitize_filename(stem.replace('-', ' ').replace('_', ' ').title())


def sanitize_filename(name: str) -> str:
	"""Sanitize a string to be safe for use as a filename/directory name.

	Removes or replaces characters that are invalid on Windows filesystems:
	- : (colon)
	- " (double quote)
	- < > (angle brackets)
	- | (pipe)
	- ? (question mark)
	- * (asterisk)
	- / \\ (slashes)
	- Control characters (0-31)
	"""
	# Replace common problematic characters
	replacements = {
		':': ' -',  # Colon often separates title:subtitle, replace with dash
		'"': "'",   # Replace double quotes with single quotes
		'<': '(',
		'>': ')',
		'|': '-',
		'?': '',
		'*': '',
		'/': '-',
		'\\': '-',
	}

	result = name
	for old, new in replacements.items():
		result = result.replace(old, new)

	# Remove control characters
	result = ''.join(c for c in result if ord(c) >= 32)

	# Remove leading/trailing whitespace and dots (Windows doesn't like trailing dots)
	result = result.strip().rstrip('.')

	# Replace multiple spaces with single space
	result = re.sub(r'\s+', ' ', result)

	# Limit length to avoid path issues (Windows MAX_PATH is 260)
	if len(result) > 100:
		result = result[:100].rstrip()

	return result


def convert_file(input_path: Path, output_dir: Path, output_format: str = 'mmo',
				 rom_path: Optional[Path] = None, organize_by_game: bool = True):
	"""Convert a single TAS file to the specified output format.

	Args:
		input_path: Path to input TAS file
		output_dir: Output directory for converted files
		output_format: Target format ('mmo', 'bk2', 'smv')
		rom_path: Optional ROM file for SHA1 calculation
		organize_by_game: If True, organize output into game-name subdirectories
	"""
	try:
		# Detect input format
		fmt = detect_format(input_path)
		print(f"\nConverting: {input_path.name} ({fmt.upper()} → {output_format.upper()})")

		# Parse input file
		if fmt == 'smv':
			movie = parse_smv(input_path)
		elif fmt == 'bkm':
			movie = parse_bkm(input_path)
		elif fmt == 'bk2':
			movie = parse_bk2(input_path)
		elif fmt == 'lsmv':
			movie = parse_lsmv(input_path)
		else:
			raise ValueError(f"Unsupported input format: {fmt}")

		# Determine output directory
		if organize_by_game:
			game_name = extract_game_name(input_path, movie)
			out_dir = output_dir / game_name
		else:
			out_dir = output_dir
		out_dir.mkdir(parents=True, exist_ok=True)

		# Generate output filename
		output_name = input_path.stem + f".{output_format}"
		output_path = out_dir / output_name

		# Create output file in target format
		if output_format == 'mmo':
			create_mmo_file(movie, output_path, rom_path)
		elif output_format == 'bk2':
			create_bk2_file(movie, output_path, rom_path)
		elif output_format == 'smv':
			create_smv_file(movie, output_path)
		else:
			raise ValueError(f"Unsupported output format: {output_format}")

		return True

	except Exception as e:
		print(f"Error converting {input_path.name}: {e}")
		import traceback
		traceback.print_exc()
		return False


def convert_directory(input_dir: Path, output_dir: Path, output_format: str = 'mmo',
					  recursive: bool = True, organize_by_game: bool = True):
	"""Convert all TAS files in a directory."""
	patterns = ['*.smv', '*.bkm', '*.bk2', '*.lsmv']

	files_found = []
	for pattern in patterns:
		if recursive:
			files_found.extend(input_dir.rglob(pattern))
		else:
			files_found.extend(input_dir.glob(pattern))

	print(f"Found {len(files_found)} TAS files to convert")

	success = 0
	failed = 0

	for filepath in sorted(files_found):
		if convert_file(filepath, output_dir, output_format, organize_by_game=organize_by_game):
			success += 1
		else:
			failed += 1

	print(f"\n=== Conversion Complete ===")
	print(f"Success: {success}")
	print(f"Failed: {failed}")


def main():
	parser = argparse.ArgumentParser(
		description="Convert TAS replay files between various emulator formats",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Supported formats:
  Input:  SMV (Snes9x), BKM (BizHawk legacy), BK2 (BizHawk), LSMV (lsnes)
  Output: MMO (Mesen2), BK2 (BizHawk), SMV (Snes9x)

Examples:
  # Convert SMV to Mesen2 MMO format
  %(prog)s --input movie.smv --output mesen-mmo/

  # Convert SMV to BizHawk BK2 format
  %(prog)s --input movie.smv --output bizhawk/ --format bk2

  # Convert BK2 back to SMV
  %(prog)s --input movie.bk2 --output snes9x/ --format smv

  # Batch convert all SNES TAS files to MMO
  %(prog)s --input-dir ~/tas-files/SNES/ --output mesen-mmo/ --recursive

  # Convert without game-name subdirectories
  %(prog)s --input movie.smv --output output/ --no-organize
		"""
	)

	parser.add_argument('-i', '--input', type=Path,
						help='Input TAS file to convert')
	parser.add_argument('-d', '--input-dir', type=Path,
						help='Input directory containing TAS files')
	parser.add_argument('-o', '--output', type=Path, required=True,
						help='Output directory for converted files')
	parser.add_argument('-f', '--format', type=str, default='mmo',
						choices=['mmo', 'bk2', 'smv'],
						help='Output format (default: mmo)')
	parser.add_argument('-r', '--recursive', action='store_true',
						help='Recursively process subdirectories')
	parser.add_argument('--rom', type=Path,
						help='Optional ROM file for SHA1 calculation')
	parser.add_argument('--no-organize', action='store_true',
						help='Do not organize output into game-name subdirectories')
	parser.add_argument('--verbose', '-v', action='store_true',
						help='Verbose output')

	args = parser.parse_args()

	# Validate arguments
	if not args.input and not args.input_dir:
		parser.error("Either --input or --input-dir must be specified")

	# Create output directory
	args.output.mkdir(parents=True, exist_ok=True)

	organize = not args.no_organize

	if args.input:
		# Single file conversion
		convert_file(args.input, args.output, args.format, args.rom, organize_by_game=organize)
	else:
		# Directory conversion
		convert_directory(args.input_dir, args.output, args.format, args.recursive, organize)


if __name__ == '__main__':
	main()