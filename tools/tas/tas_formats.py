#!/usr/bin/env python3
"""
TAS Format Definitions and Button Mappings

This module defines all supported TAS movie file formats and their button mappings.
Each system has its own button flags and conversion mappings.
"""

from enum import IntFlag, auto
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Tuple


# =============================================================================
# System Enumeration
# =============================================================================

class TASSystem:
	"""Supported gaming systems."""
	SNES = "SNES"
	NES = "NES"
	GB = "GB"
	GBC = "GBC"
	GBA = "GBA"
	GENESIS = "Genesis"
	SMS = "SMS"
	GG = "GameGear"
	PSX = "PSX"
	SATURN = "Saturn"
	PCE = "PCEngine"
	NDS = "NDS"
	DOS = "DOS"
	UNKNOWN = "Unknown"


# =============================================================================
# SNES Button Definitions
# =============================================================================

class SnesButtons(IntFlag):
	"""SNES controller button flags (as used in SMV format)."""
	# Low byte (directly from controller)
	RIGHT = 0x0001
	LEFT = 0x0002
	DOWN = 0x0004
	UP = 0x0008
	START = 0x0010
	SELECT = 0x0020
	Y = 0x0040
	B = 0x0080
	# High byte
	R = 0x1000
	L = 0x2000
	X = 0x4000
	A = 0x8000


# SNES button order for BK2 format
SNES_BK2_BUTTONS = [
	(SnesButtons.UP, 'U'),
	(SnesButtons.DOWN, 'D'),
	(SnesButtons.LEFT, 'L'),
	(SnesButtons.RIGHT, 'R'),
	(SnesButtons.SELECT, 's'),  # lowercase
	(SnesButtons.START, 'S'),
	(SnesButtons.Y, 'Y'),
	(SnesButtons.B, 'B'),
	(SnesButtons.X, 'X'),
	(SnesButtons.A, 'A'),
	(SnesButtons.L, 'l'),  # lowercase
	(SnesButtons.R, 'r'),  # lowercase
]

# SNES button order for LSMV format
SNES_LSMV_BUTTONS = [
	(SnesButtons.B, 'B'),
	(SnesButtons.Y, 'Y'),
	(SnesButtons.SELECT, 's'),
	(SnesButtons.START, 'S'),
	(SnesButtons.UP, 'u'),
	(SnesButtons.DOWN, 'd'),
	(SnesButtons.LEFT, 'l'),
	(SnesButtons.RIGHT, 'r'),
	(SnesButtons.A, 'A'),
	(SnesButtons.X, 'X'),
	(SnesButtons.L, 'L'),
	(SnesButtons.R, 'R'),
]


# =============================================================================
# NES Button Definitions
# =============================================================================

class NesButtons(IntFlag):
	"""NES controller button flags."""
	RIGHT = 0x01
	LEFT = 0x02
	DOWN = 0x04
	UP = 0x08
	START = 0x10
	SELECT = 0x20
	B = 0x40
	A = 0x80


# NES button order for FM2 format: RLDUTSBA
NES_FM2_BUTTONS = [
	(NesButtons.RIGHT, 'R'),
	(NesButtons.LEFT, 'L'),
	(NesButtons.DOWN, 'D'),
	(NesButtons.UP, 'U'),
	(NesButtons.START, 'T'),
	(NesButtons.SELECT, 'S'),
	(NesButtons.B, 'B'),
	(NesButtons.A, 'A'),
]

# NES button order for BK2 format
NES_BK2_BUTTONS = [
	(NesButtons.UP, 'U'),
	(NesButtons.DOWN, 'D'),
	(NesButtons.LEFT, 'L'),
	(NesButtons.RIGHT, 'R'),
	(NesButtons.SELECT, 's'),
	(NesButtons.START, 'S'),
	(NesButtons.B, 'B'),
	(NesButtons.A, 'A'),
]


# =============================================================================
# Game Boy / GBA Button Definitions
# =============================================================================

class GbButtons(IntFlag):
	"""Game Boy controller button flags."""
	RIGHT = 0x01
	LEFT = 0x02
	UP = 0x04
	DOWN = 0x08
	A = 0x10
	B = 0x20
	SELECT = 0x40
	START = 0x80


class GbaButtons(IntFlag):
	"""GBA controller button flags."""
	A = 0x0001
	B = 0x0002
	SELECT = 0x0004
	START = 0x0008
	RIGHT = 0x0010
	LEFT = 0x0020
	UP = 0x0040
	DOWN = 0x0080
	R = 0x0100
	L = 0x0200


# VBM GB button order (reversed from internal)
GB_VBM_BUTTONS = [
	(GbButtons.A, 'A'),
	(GbButtons.B, 'B'),
	(GbButtons.SELECT, 's'),
	(GbButtons.START, 'S'),
	(GbButtons.RIGHT, 'R'),
	(GbButtons.LEFT, 'L'),
	(GbButtons.UP, 'U'),
	(GbButtons.DOWN, 'D'),
]

# GBA BK2 button order
GBA_BK2_BUTTONS = [
	(GbaButtons.UP, 'U'),
	(GbaButtons.DOWN, 'D'),
	(GbaButtons.LEFT, 'L'),
	(GbaButtons.RIGHT, 'R'),
	(GbaButtons.SELECT, 's'),
	(GbaButtons.START, 'S'),
	(GbaButtons.B, 'B'),
	(GbaButtons.A, 'A'),
	(GbaButtons.L, 'l'),
	(GbaButtons.R, 'r'),
]


# =============================================================================
# Genesis / Mega Drive Button Definitions
# =============================================================================

class GenesisButtons(IntFlag):
	"""Genesis/Mega Drive controller button flags (3-button)."""
	UP = 0x01
	DOWN = 0x02
	LEFT = 0x04
	RIGHT = 0x08
	B = 0x10
	C = 0x20
	A = 0x40
	START = 0x80


class Genesis6Buttons(IntFlag):
	"""Genesis/Mega Drive controller button flags (6-button)."""
	UP = 0x0001
	DOWN = 0x0002
	LEFT = 0x0004
	RIGHT = 0x0008
	B = 0x0010
	C = 0x0020
	A = 0x0040
	START = 0x0080
	Z = 0x0100
	Y = 0x0200
	X = 0x0400
	MODE = 0x0800


# GMV button order
GENESIS_GMV_BUTTONS = [
	(GenesisButtons.UP, 'U'),
	(GenesisButtons.DOWN, 'D'),
	(GenesisButtons.LEFT, 'L'),
	(GenesisButtons.RIGHT, 'R'),
	(GenesisButtons.B, 'B'),
	(GenesisButtons.C, 'C'),
	(GenesisButtons.A, 'A'),
	(GenesisButtons.START, 'S'),
]

# Genesis BK2 button order
GENESIS_BK2_BUTTONS = [
	(GenesisButtons.UP, 'U'),
	(GenesisButtons.DOWN, 'D'),
	(GenesisButtons.LEFT, 'L'),
	(GenesisButtons.RIGHT, 'R'),
	(GenesisButtons.START, 'S'),
	(GenesisButtons.A, 'A'),
	(GenesisButtons.C, 'C'),
	(GenesisButtons.B, 'B'),
]


# =============================================================================
# SMS / Game Gear Button Definitions
# =============================================================================

class SmsButtons(IntFlag):
	"""Sega Master System controller button flags."""
	UP = 0x01
	DOWN = 0x02
	LEFT = 0x04
	RIGHT = 0x08
	BUTTON1 = 0x10
	BUTTON2 = 0x20


class GGButtons(IntFlag):
	"""Game Gear controller button flags."""
	UP = 0x01
	DOWN = 0x02
	LEFT = 0x04
	RIGHT = 0x08
	BUTTON1 = 0x10
	BUTTON2 = 0x20
	START = 0x80


# SMS/GG button order for MMV/BK2
SMS_BUTTONS = [
	(SmsButtons.UP, 'U'),
	(SmsButtons.DOWN, 'D'),
	(SmsButtons.LEFT, 'L'),
	(SmsButtons.RIGHT, 'R'),
	(SmsButtons.BUTTON1, '1'),
	(SmsButtons.BUTTON2, '2'),
]


# =============================================================================
# PlayStation Button Definitions
# =============================================================================

class PsxButtons(IntFlag):
	"""PlayStation controller button flags."""
	SELECT = 0x0001
	L3 = 0x0002
	R3 = 0x0004
	START = 0x0008
	UP = 0x0010
	RIGHT = 0x0020
	DOWN = 0x0040
	LEFT = 0x0080
	L2 = 0x0100
	R2 = 0x0200
	L1 = 0x0400
	R1 = 0x0800
	TRIANGLE = 0x1000
	CIRCLE = 0x2000
	CROSS = 0x4000
	SQUARE = 0x8000


PSX_BK2_BUTTONS = [
	(PsxButtons.UP, 'U'),
	(PsxButtons.DOWN, 'D'),
	(PsxButtons.LEFT, 'L'),
	(PsxButtons.RIGHT, 'R'),
	(PsxButtons.SELECT, 's'),
	(PsxButtons.START, 'S'),
	(PsxButtons.SQUARE, '□'),
	(PsxButtons.TRIANGLE, '△'),
	(PsxButtons.CIRCLE, '○'),
	(PsxButtons.CROSS, '×'),
	(PsxButtons.L1, 'l'),
	(PsxButtons.R1, 'r'),
	(PsxButtons.L2, 'L'),
	(PsxButtons.R2, 'R'),
]


# =============================================================================
# Saturn Button Definitions
# =============================================================================

class SaturnButtons(IntFlag):
	"""Sega Saturn controller button flags."""
	RIGHT = 0x0001
	LEFT = 0x0002
	DOWN = 0x0004
	UP = 0x0008
	START = 0x0010
	A = 0x0020
	C = 0x0040
	B = 0x0080
	R = 0x0100
	X = 0x0200
	Y = 0x0400
	Z = 0x0800
	L = 0x1000


SATURN_BUTTONS = [
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


# =============================================================================
# PC Engine Button Definitions
# =============================================================================

class PceButtons(IntFlag):
	"""PC Engine / TurboGrafx-16 controller button flags."""
	UP = 0x01
	DOWN = 0x02
	LEFT = 0x04
	RIGHT = 0x08
	I = 0x10
	II = 0x20
	SELECT = 0x40
	RUN = 0x80


PCE_BUTTONS = [
	(PceButtons.UP, 'U'),
	(PceButtons.DOWN, 'D'),
	(PceButtons.LEFT, 'L'),
	(PceButtons.RIGHT, 'R'),
	(PceButtons.SELECT, 's'),
	(PceButtons.RUN, 'S'),
	(PceButtons.I, 'I'),
	(PceButtons.II, 'i'),
]


# =============================================================================
# NDS Button Definitions
# =============================================================================

class NdsButtons(IntFlag):
	"""Nintendo DS button flags."""
	A = 0x0001
	B = 0x0002
	SELECT = 0x0004
	START = 0x0008
	RIGHT = 0x0010
	LEFT = 0x0020
	UP = 0x0040
	DOWN = 0x0080
	R = 0x0100
	L = 0x0200
	X = 0x0400
	Y = 0x0800
	DEBUG = 0x1000
	LID = 0x2000


NDS_BUTTONS = [
	(NdsButtons.UP, 'U'),
	(NdsButtons.DOWN, 'D'),
	(NdsButtons.LEFT, 'L'),
	(NdsButtons.RIGHT, 'R'),
	(NdsButtons.SELECT, 's'),
	(NdsButtons.START, 'S'),
	(NdsButtons.B, 'B'),
	(NdsButtons.A, 'A'),
	(NdsButtons.Y, 'Y'),
	(NdsButtons.X, 'X'),
	(NdsButtons.L, 'l'),
	(NdsButtons.R, 'r'),
]


# =============================================================================
# Doom Button Definitions
# =============================================================================

class DoomButtons(IntFlag):
	"""Doom input flags (per tic)."""
	FIRE = 0x01
	USE = 0x02
	CHANGE = 0x04  # Weapon change
	SPECIAL = 0x08


# =============================================================================
# Format Metadata
# =============================================================================

@dataclass
class TASFormat:
	"""Metadata about a TAS file format."""
	extension: str
	name: str
	emulator: str
	system: str
	binary: bool = True
	archive: bool = False
	read_support: bool = True
	write_support: bool = False
	signature: Optional[bytes] = None


# All supported formats
TAS_FORMATS: Dict[str, TASFormat] = {
	# SNES
	"smv": TASFormat("smv", "SMV", "Snes9x", TASSystem.SNES, True, False, True, True, b"SMV\x1a"),
	"lsmv": TASFormat("lsmv", "LSMV", "lsnes", TASSystem.SNES, False, True, True, False),

	# NES
	"fm2": TASFormat("fm2", "FM2", "FCEUX", TASSystem.NES, False, False, True, True),
	"fcm": TASFormat("fcm", "FCM", "FCEU", TASSystem.NES, True, False, True, False, b"FCM\x1a"),
	"fmv": TASFormat("fmv", "FMV", "Famtasia", TASSystem.NES, True, False, True, False, b"FMV\x1a"),

	# Game Boy / GBA
	"vbm": TASFormat("vbm", "VBM", "VisualBoyAdvance", TASSystem.GB, True, False, True, True, b"VBM\x1a"),

	# Genesis
	"gmv": TASFormat("gmv", "GMV", "Gens", TASSystem.GENESIS, True, False, True, True, b"Gens Movie TEST9"),

	# SMS / Game Gear
	"mmv": TASFormat("mmv", "MMV", "Dega", TASSystem.SMS, True, False, True, True, b"MMV\x00"),

	# PlayStation
	"pxm": TASFormat("pxm", "PXM", "PCSX", TASSystem.PSX, True, False, True, False, b"PXM "),
	"pjm": TASFormat("pjm", "PJM", "PSXjin", TASSystem.PSX, True, False, True, False, b"PJM "),

	# Saturn
	"ymv": TASFormat("ymv", "YMV", "Yabause", TASSystem.SATURN, True, False, True, False, b"YMV\x00"),

	# PC Engine
	"mc2": TASFormat("mc2", "MC2", "PCEjin/Mednafen", TASSystem.PCE, True, False, True, False),

	# NDS
	"dsm": TASFormat("dsm", "DSM", "DeSmuME", TASSystem.NDS, False, False, True, False),

	# BizHawk
	"bk2": TASFormat("bk2", "BK2", "BizHawk", TASSystem.UNKNOWN, False, True, True, True),
	"bkm": TASFormat("bkm", "BKM", "BizHawk", TASSystem.UNKNOWN, False, False, True, False),

	# Mesen
	"mmo": TASFormat("mmo", "MMO", "Mesen2", TASSystem.UNKNOWN, False, True, False, True),

	# Doom
	"lmp": TASFormat("lmp", "LMP", "Doom", TASSystem.DOS, True, False, True, False),
	"hereticlmp": TASFormat("hereticlmp", "Heretic LMP", "Heretic", TASSystem.DOS, True, False, True, False),
	"hexenlmp": TASFormat("hexenlmp", "Hexen LMP", "Hexen", TASSystem.DOS, True, False, True, False),
}


def get_format_by_extension(ext: str) -> Optional[TASFormat]:
	"""Get format info by file extension."""
	ext = ext.lower().lstrip('.')
	return TAS_FORMATS.get(ext)


def get_formats_for_system(system: str) -> List[TASFormat]:
	"""Get all formats supporting a given system."""
	return [f for f in TAS_FORMATS.values() if f.system == system]


def get_writable_formats() -> List[TASFormat]:
	"""Get all formats that can be written."""
	return [f for f in TAS_FORMATS.values() if f.write_support]


def get_readable_formats() -> List[TASFormat]:
	"""Get all formats that can be read."""
	return [f for f in TAS_FORMATS.values() if f.read_support]


# =============================================================================
# Button Conversion Utilities
# =============================================================================

def buttons_to_text(buttons: int, button_map: List[Tuple], fill_char: str = '.') -> str:
	"""Convert button bitmask to text using a button map."""
	result = ""
	for btn, char in button_map:
		if buttons & btn:
			result += char
		else:
			result += fill_char
	return result


def text_to_buttons(text: str, button_map: List[Tuple], fill_char: str = '.') -> int:
	"""Convert text to button bitmask using a button map."""
	buttons = 0
	for i, (btn, char) in enumerate(button_map):
		if i < len(text) and text[i] != fill_char:
			buttons |= btn
	return buttons


# System-specific conversion functions
def snes_to_bk2_text(buttons: int) -> str:
	"""Convert SNES buttons to BK2 text format."""
	return buttons_to_text(buttons, SNES_BK2_BUTTONS)


def bk2_text_to_snes(text: str) -> int:
	"""Convert BK2 text to SNES buttons."""
	return text_to_buttons(text, SNES_BK2_BUTTONS)


def nes_to_fm2_text(buttons: int) -> str:
	"""Convert NES buttons to FM2 text format."""
	return buttons_to_text(buttons, NES_FM2_BUTTONS)


def fm2_text_to_nes(text: str) -> int:
	"""Convert FM2 text to NES buttons."""
	return text_to_buttons(text, NES_FM2_BUTTONS)


def genesis_to_text(buttons: int) -> str:
	"""Convert Genesis buttons to text format."""
	return buttons_to_text(buttons, GENESIS_GMV_BUTTONS)


def text_to_genesis(text: str) -> int:
	"""Convert text to Genesis buttons."""
	return text_to_buttons(text, GENESIS_GMV_BUTTONS)
