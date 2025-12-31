#!/usr/bin/env python3
"""
Doom Engine TAS Format Parsers

Supports:
- LMP (Doom) - Binary format, read-only
- Heretic LMP - Heretic variant, read-only
- Hexen LMP - Hexen variant, read-only
"""

import struct
from pathlib import Path
from dataclasses import dataclass, field
from typing import List, Optional, Tuple

from tas_formats import DoomButtons, TASSystem


@dataclass
class FrameInput:
	"""Input data for a single frame (tic)."""
	controllers: List[int] = field(default_factory=list)
	forward_move: int = 0  # -127 to 127
	side_move: int = 0  # -127 to 127
	turn: int = 0  # Turn angle (signed)
	use_artifact: int = 0  # Heretic/Hexen artifact use
	fly_look: int = 0  # Heretic/Hexen fly/look


@dataclass
class MovieInfo:
	"""Common movie metadata."""
	title: str = ""
	author: str = ""
	description: str = ""
	rom_name: str = ""
	wad_name: str = ""
	skill_level: int = 0  # 0-4
	episode: int = 0
	map_number: int = 0
	game_mode: int = 0  # 0=single, 1=coop, 2=deathmatch
	respawn: bool = False
	fast: bool = False
	nomonsters: bool = False
	frame_count: int = 0
	rerecord_count: int = 0
	controllers: int = 1  # Number of players
	region: str = ""
	system: str = TASSystem.DOS
	frames: List[FrameInput] = field(default_factory=list)
	version: int = 0  # Doom version
	is_heretic: bool = False
	is_hexen: bool = False
	has_header: bool = False


# =============================================================================
# LMP Format (Doom) - Binary
# =============================================================================

def parse_lmp(filepath: Path, game_type: str = 'doom') -> MovieInfo:
	"""
	Parse Doom/Heretic/Hexen .lmp demo file.

	Args:
		filepath: Path to LMP file
		game_type: 'doom', 'heretic', or 'hexen'
	"""
	movie = MovieInfo()
	movie.system = TASSystem.DOS

	if game_type == 'heretic':
		movie.is_heretic = True
	elif game_type == 'hexen':
		movie.is_hexen = True

	with open(filepath, 'rb') as f:
		data = f.read()

	if len(data) < 13:
		raise ValueError("LMP file too short")

	# Check for header based on version byte
	# Doom 1.9: version 109
	# Doom 2: version 109
	# Heretic: version 109 with different data
	# Hexen: version 109 with different data

	version = data[0]
	movie.version = version

	# Most LMP files have a 13-byte header (Doom 1.9+)
	# Version, skill, episode, map, deathmatch, respawn, fast, nomonsters, viewpoint, player1-4 present
	if version == 109 or (100 <= version <= 110):
		movie.has_header = True
		movie.skill_level = data[1]
		movie.episode = data[2]
		movie.map_number = data[3]
		movie.game_mode = data[4]  # 0=single/coop, 1=deathmatch
		movie.respawn = bool(data[5])
		movie.fast = bool(data[6])
		movie.nomonsters = bool(data[7])
		console_player = data[8]  # POV player

		# Players present flags (bytes 9-12)
		players_present = [bool(data[i]) for i in range(9, 13)]
		movie.controllers = sum(players_present)
		if movie.controllers == 0:
			movie.controllers = 1

		offset = 13
	else:
		# Old format without header
		movie.has_header = False
		movie.controllers = 1
		offset = 0

	# Determine bytes per tic per player
	if movie.is_heretic:
		bytes_per_player = 5  # Heretic: forward, side, turn, buttons, artifact
	elif movie.is_hexen:
		bytes_per_player = 6  # Hexen: forward, side, turn, buttons, artifact, fly/look
	else:
		bytes_per_player = 4  # Doom: forward, side, turn, buttons

	bytes_per_tic = bytes_per_player * movie.controllers

	# Read tic data until end marker (0x80)
	remaining = data[offset:]
	tic_count = 0

	i = 0
	while i < len(remaining):
		# Check for end marker
		if remaining[i] == 0x80:
			break

		# Check if we have enough data for a full tic
		if i + bytes_per_tic > len(remaining):
			break

		frame = FrameInput(controllers=[])

		for player in range(movie.controllers):
			player_offset = i + player * bytes_per_player

			# Read movement values (signed bytes)
			forward = struct.unpack('b', remaining[player_offset:player_offset + 1])[0]
			side = struct.unpack('b', remaining[player_offset + 1:player_offset + 2])[0]

			# Turn is signed byte
			turn = struct.unpack('b', remaining[player_offset + 2:player_offset + 3])[0]

			# Buttons byte
			buttons = remaining[player_offset + 3]

			# Convert Doom buttons to our format
			doom_buttons = 0

			# Doom button bits:
			# Bit 0: Fire
			# Bit 1: Use
			# Bit 2: Change weapon (combined with weapon bits)
			# Bits 2-4: Weapon select (if bit 2 set)
			# Speed modifier is in movement values (double values = running)

			if buttons & 0x01:
				doom_buttons |= DoomButtons.FIRE
			if buttons & 0x02:
				doom_buttons |= DoomButtons.USE
			if buttons & 0x04:
				doom_buttons |= DoomButtons.CHANGE

			# Encode weapon selection in buttons
			weapon = (buttons >> 3) & 0x07
			if weapon:
				if weapon == 1:
					doom_buttons |= DoomButtons.WEAPON1
				elif weapon == 2:
					doom_buttons |= DoomButtons.WEAPON2
				elif weapon == 3:
					doom_buttons |= DoomButtons.WEAPON3
				elif weapon == 4:
					doom_buttons |= DoomButtons.WEAPON4
				elif weapon == 5:
					doom_buttons |= DoomButtons.WEAPON5
				elif weapon == 6:
					doom_buttons |= DoomButtons.WEAPON6
				elif weapon == 7:
					doom_buttons |= DoomButtons.WEAPON7

			frame.controllers.append(doom_buttons)
			frame.forward_move = forward
			frame.side_move = side
			frame.turn = turn

			# Heretic/Hexen extras
			if movie.is_heretic or movie.is_hexen:
				if player_offset + 4 < len(remaining):
					frame.use_artifact = remaining[player_offset + 4]

			if movie.is_hexen:
				if player_offset + 5 < len(remaining):
					frame.fly_look = remaining[player_offset + 5]

		movie.frames.append(frame)
		tic_count += 1
		i += bytes_per_tic

	movie.frame_count = len(movie.frames)

	game_name = 'Hexen' if movie.is_hexen else 'Heretic' if movie.is_heretic else 'Doom'
	print(f"Parsed LMP ({game_name}): {filepath.name}")
	print(f"  Version: {movie.version}")
	print(f"  Frames (tics): {movie.frame_count}")
	print(f"  Players: {movie.controllers}")
	if movie.has_header:
		print(f"  Skill: {movie.skill_level + 1}")
		print(f"  Episode: {movie.episode}")
		print(f"  Map: {movie.map_number}")
		print(f"  Game Mode: {'Deathmatch' if movie.game_mode else 'Single/Coop'}")

	return movie


def parse_heretic_lmp(filepath: Path) -> MovieInfo:
	"""Parse Heretic .lmp demo file."""
	return parse_lmp(filepath, 'heretic')


def parse_hexen_lmp(filepath: Path) -> MovieInfo:
	"""Parse Hexen .lmp demo file."""
	return parse_lmp(filepath, 'hexen')


# =============================================================================
# Button Conversion
# =============================================================================

def doom_to_bk2_text(frame: FrameInput) -> str:
	"""
	Convert Doom frame input to BK2 text format.

	BizHawk's Doom format includes analog axes for movement.
	Format: |Fire Use weapon|forward,side,turn|
	"""
	buttons = frame.controllers[0] if frame.controllers else 0

	result = ""

	# Buttons
	if buttons & DoomButtons.FIRE:
		result += 'F'
	else:
		result += '.'

	if buttons & DoomButtons.USE:
		result += 'U'
	else:
		result += '.'

	if buttons & DoomButtons.STRAFE:
		result += 'S'
	else:
		result += '.'

	if buttons & DoomButtons.SPEED:
		result += 'R'  # Run
	else:
		result += '.'

	# Weapon (0-7)
	weapon = 0
	if buttons & DoomButtons.WEAPON1:
		weapon = 1
	elif buttons & DoomButtons.WEAPON2:
		weapon = 2
	elif buttons & DoomButtons.WEAPON3:
		weapon = 3
	elif buttons & DoomButtons.WEAPON4:
		weapon = 4
	elif buttons & DoomButtons.WEAPON5:
		weapon = 5
	elif buttons & DoomButtons.WEAPON6:
		weapon = 6
	elif buttons & DoomButtons.WEAPON7:
		weapon = 7

	result += f'{weapon}'

	return result


def doom_to_bk2_analog(frame: FrameInput) -> str:
	"""Get analog axis string for Doom frame."""
	return f"{frame.forward_move},{frame.side_move},{frame.turn}"


def detect_doom_format(filepath: Path) -> Optional[str]:
	"""Detect Doom movie format from file."""
	ext = filepath.suffix.lower()

	if ext != '.lmp':
		return None

	# Try to determine game type from filename or content
	filename_lower = filepath.name.lower()

	if 'heretic' in filename_lower:
		return 'HERETIC_LMP'
	elif 'hexen' in filename_lower:
		return 'HEXEN_LMP'
	else:
		return 'DOOM_LMP'


# =============================================================================
# Helper Functions
# =============================================================================

def get_doom_skill_name(skill: int) -> str:
	"""Get skill level name."""
	skills = [
		"I'm Too Young To Die",
		"Hey, Not Too Rough",
		"Hurt Me Plenty",
		"Ultra-Violence",
		"Nightmare!"
	]
	if 0 <= skill < len(skills):
		return skills[skill]
	return f"Unknown ({skill})"
