#!/usr/bin/env python3
"""
Music/Sound Data Editor - Edit music and sound effect data.

Tools for working with music and sound data in retro games.

Usage:
	python music_editor.py --analyze music.bin
	python music_editor.py --extract rom.nes --offset 0x10000
	python music_editor.py --edit song.json

Features:
	- NSF/SPC header parsing
	- Note/instrument data
	- Channel configuration
	- Tempo/volume control
	- Pattern/sequence editing
"""

import argparse
import json
import struct
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple


class SoundChip(Enum):
	"""Sound chip types."""
	NES_APU = 0         # NES 2A03
	NES_VRC6 = 1        # Konami VRC6
	NES_VRC7 = 2        # Konami VRC7
	NES_FDS = 3         # Famicom Disk System
	NES_MMC5 = 4        # Nintendo MMC5
	NES_N163 = 5        # Namco 163
	NES_SUNSOFT = 6     # Sunsoft 5B
	SNES_SPC = 7        # SNES SPC700
	GB_APU = 8          # Game Boy
	GBA_APU = 9         # Game Boy Advance


class NoteValue(Enum):
	"""Musical notes."""
	REST = -1
	C = 0
	CS = 1   # C#
	D = 2
	DS = 3   # D#
	E = 4
	F = 5
	FS = 6   # F#
	G = 7
	GS = 8   # G#
	A = 9
	AS = 10  # A#
	B = 11


@dataclass
class Note:
	"""A single note."""
	value: NoteValue
	octave: int = 4
	duration: int = 16    # In ticks
	volume: int = 15      # 0-15
	instrument: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"note": self.value.name if self.value != NoteValue.REST else "REST",
			"octave": self.octave,
			"duration": self.duration,
			"volume": self.volume,
			"instrument": self.instrument
		}

	def to_string(self) -> str:
		"""Get note string (e.g., C4, G#5)."""
		if self.value == NoteValue.REST:
			return "---"

		name = self.value.name
		if len(name) == 2:
			name = name[0] + "#"
		return f"{name}{self.octave}"


@dataclass
class Channel:
	"""A sound channel."""
	channel_id: int
	name: str = ""
	enabled: bool = True

	# Channel properties
	volume: int = 15
	pan: int = 64        # 0-127 (64 = center)

	# Notes/patterns
	notes: List[Note] = field(default_factory=list)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"channel_id": self.channel_id,
			"name": self.name,
			"enabled": self.enabled,
			"volume": self.volume,
			"pan": self.pan,
			"notes": [n.to_dict() for n in self.notes]
		}


@dataclass
class Pattern:
	"""A music pattern/phrase."""
	pattern_id: int
	name: str = ""
	length: int = 64      # In ticks

	# Channel data
	channels: Dict[int, Channel] = field(default_factory=dict)

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"pattern_id": self.pattern_id,
			"name": self.name,
			"length": self.length,
			"channels": {k: v.to_dict() for k, v in self.channels.items()}
		}


@dataclass
class Song:
	"""A complete song."""
	song_id: int
	name: str = ""

	# Playback settings
	tempo: int = 120       # BPM
	ticks_per_beat: int = 4

	# Pattern sequence
	pattern_sequence: List[int] = field(default_factory=list)
	patterns: Dict[int, Pattern] = field(default_factory=dict)

	# Loop point
	loop_point: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"song_id": self.song_id,
			"name": self.name,
			"tempo": self.tempo,
			"ticks_per_beat": self.ticks_per_beat,
			"pattern_sequence": self.pattern_sequence,
			"patterns": {k: v.to_dict() for k, v in self.patterns.items()},
			"loop_point": self.loop_point
		}


@dataclass
class SoundEffect:
	"""A sound effect."""
	sfx_id: int
	name: str = ""

	# Effect data
	data: bytes = b""

	# Decoded parameters
	pitch_start: int = 0
	pitch_end: int = 0
	duration: int = 0
	volume_start: int = 15
	volume_end: int = 0
	channel: int = 0

	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"sfx_id": self.sfx_id,
			"name": self.name,
			"data_hex": self.data.hex(),
			"pitch_start": self.pitch_start,
			"pitch_end": self.pitch_end,
			"duration": self.duration,
			"volume_start": self.volume_start,
			"volume_end": self.volume_end,
			"channel": self.channel
		}


class MusicEditor:
	"""Editor for music and sound data."""

	def __init__(self):
		self.songs: Dict[int, Song] = {}
		self.sound_effects: Dict[int, SoundEffect] = {}
		self.sound_chip: SoundChip = SoundChip.NES_APU

	def parse_nsf_header(self, data: bytes) -> Dict[str, Any]:
		"""Parse NSF file header."""
		if len(data) < 128:
			return {"error": "Data too short for NSF header"}

		if data[:5] != b"NESM\x1a":
			return {"error": "Not a valid NSF file"}

		header = {
			"format": "NSF",
			"version": data[5],
			"total_songs": data[6],
			"starting_song": data[7],
			"load_address": struct.unpack("<H", data[8:10])[0],
			"init_address": struct.unpack("<H", data[10:12])[0],
			"play_address": struct.unpack("<H", data[12:14])[0],
			"title": data[14:46].rstrip(b"\x00").decode("ascii", errors="replace"),
			"artist": data[46:78].rstrip(b"\x00").decode("ascii", errors="replace"),
			"copyright": data[78:110].rstrip(b"\x00").decode("ascii", errors="replace"),
			"ntsc_speed": struct.unpack("<H", data[110:112])[0],
			"bankswitch": list(data[112:120]),
			"pal_speed": struct.unpack("<H", data[120:122])[0],
			"pal_ntsc_bits": data[122],
			"extra_sound": data[123]
		}

		# Decode extra sound chips
		extra = []
		if header["extra_sound"] & 0x01:
			extra.append("VRC6")
		if header["extra_sound"] & 0x02:
			extra.append("VRC7")
		if header["extra_sound"] & 0x04:
			extra.append("FDS")
		if header["extra_sound"] & 0x08:
			extra.append("MMC5")
		if header["extra_sound"] & 0x10:
			extra.append("N163")
		if header["extra_sound"] & 0x20:
			extra.append("Sunsoft 5B")
		header["extra_chips"] = extra

		return header

	def parse_spc_header(self, data: bytes) -> Dict[str, Any]:
		"""Parse SPC file header."""
		if len(data) < 256:
			return {"error": "Data too short for SPC header"}

		if data[:33] != b"SNES-SPC700 Sound File Data v0.30":
			return {"error": "Not a valid SPC file"}

		header = {
			"format": "SPC",
			"pc": struct.unpack("<H", data[37:39])[0],
			"a": data[39],
			"x": data[40],
			"y": data[41],
			"psw": data[42],
			"sp": data[43],
			"title": data[46:78].rstrip(b"\x00").decode("ascii", errors="replace"),
			"game_title": data[78:110].rstrip(b"\x00").decode("ascii", errors="replace"),
			"dumper": data[110:126].rstrip(b"\x00").decode("ascii", errors="replace"),
			"comments": data[126:158].rstrip(b"\x00").decode("ascii", errors="replace"),
			"date": data[158:169].rstrip(b"\x00").decode("ascii", errors="replace"),
			"song_length": data[169:172].rstrip(b"\x00").decode("ascii", errors="replace"),
			"fade_length": data[172:177].rstrip(b"\x00").decode("ascii", errors="replace")
		}

		return header

	def extract_note_data(self, data: bytes, format_type: str = "simple") -> List[Note]:
		"""Extract note data from raw bytes."""
		notes = []

		if format_type == "simple":
			# Simple format: note byte, duration byte
			for i in range(0, len(data) - 1, 2):
				note_byte = data[i]
				duration = data[i + 1]

				if note_byte == 0xFF:
					notes.append(Note(NoteValue.REST, duration=duration))
				else:
					note_val = note_byte % 12
					octave = note_byte // 12
					notes.append(Note(
						NoteValue(note_val),
						octave=octave,
						duration=duration
					))

		elif format_type == "extended":
			# Extended: note, duration, volume, instrument
			for i in range(0, len(data) - 3, 4):
				note_byte = data[i]
				duration = data[i + 1]
				volume = data[i + 2]
				instrument = data[i + 3]

				if note_byte == 0xFF:
					notes.append(Note(NoteValue.REST, duration=duration))
				else:
					note_val = note_byte % 12
					octave = note_byte // 12
					notes.append(Note(
						NoteValue(note_val),
						octave=octave,
						duration=duration,
						volume=volume,
						instrument=instrument
					))

		return notes

	def create_song(self, song_id: int, name: str = "") -> Song:
		"""Create a new song."""
		song = Song(song_id=song_id, name=name or f"Song_{song_id}")
		self.songs[song_id] = song
		return song

	def add_pattern(self, song_id: int, pattern: Pattern) -> bool:
		"""Add pattern to song."""
		if song_id in self.songs:
			self.songs[song_id].patterns[pattern.pattern_id] = pattern
			return True
		return False

	def create_sfx(self, sfx_id: int, name: str = "") -> SoundEffect:
		"""Create a new sound effect."""
		sfx = SoundEffect(sfx_id=sfx_id, name=name or f"SFX_{sfx_id}")
		self.sound_effects[sfx_id] = sfx
		return sfx

	def load_json(self, path: Path):
		"""Load from JSON."""
		with open(path) as f:
			data = json.load(f)

		for song_data in data.get("songs", []):
			song = Song(
				song_id=song_data.get("song_id", 0),
				name=song_data.get("name", ""),
				tempo=song_data.get("tempo", 120),
				ticks_per_beat=song_data.get("ticks_per_beat", 4),
				pattern_sequence=song_data.get("pattern_sequence", []),
				loop_point=song_data.get("loop_point", 0)
			)
			self.songs[song.song_id] = song

		for sfx_data in data.get("sound_effects", []):
			sfx = SoundEffect(
				sfx_id=sfx_data.get("sfx_id", 0),
				name=sfx_data.get("name", ""),
				data=bytes.fromhex(sfx_data.get("data_hex", "")),
				pitch_start=sfx_data.get("pitch_start", 0),
				pitch_end=sfx_data.get("pitch_end", 0),
				duration=sfx_data.get("duration", 0),
				volume_start=sfx_data.get("volume_start", 15),
				volume_end=sfx_data.get("volume_end", 0),
				channel=sfx_data.get("channel", 0)
			)
			self.sound_effects[sfx.sfx_id] = sfx

	def save_json(self, path: Path):
		"""Save to JSON."""
		data = {
			"songs": [s.to_dict() for s in self.songs.values()],
			"sound_effects": [s.to_dict() for s in self.sound_effects.values()]
		}

		with open(path, "w") as f:
			json.dump(data, f, indent="\t")

	def format_song(self, song: Song) -> str:
		"""Format song for display."""
		lines = []
		lines.append(f"Song: {song.name} (ID: {song.song_id})")
		lines.append("=" * 50)
		lines.append(f"Tempo: {song.tempo} BPM")
		lines.append(f"Ticks/Beat: {song.ticks_per_beat}")
		lines.append(f"Loop Point: {song.loop_point}")
		lines.append(f"Patterns: {len(song.patterns)}")
		lines.append(f"Sequence: {song.pattern_sequence[:20]}...")

		if song.patterns:
			lines.append("")
			lines.append("Patterns:")
			for pid, pattern in song.patterns.items():
				lines.append(f"  Pattern {pid}: {pattern.name} ({pattern.length} ticks)")

		return "\n".join(lines)

	def format_notes(self, notes: List[Note], per_line: int = 8) -> str:
		"""Format notes for display."""
		lines = []

		for i in range(0, len(notes), per_line):
			row = []
			for j in range(per_line):
				if i + j < len(notes):
					note = notes[i + j]
					row.append(note.to_string())
				else:
					row.append("   ")
			lines.append(" ".join(row))

		return "\n".join(lines)

	def format_sfx(self, sfx: SoundEffect) -> str:
		"""Format sound effect for display."""
		lines = []
		lines.append(f"Sound Effect: {sfx.name} (ID: {sfx.sfx_id})")
		lines.append("=" * 40)
		lines.append(f"Channel: {sfx.channel}")
		lines.append(f"Duration: {sfx.duration}")
		lines.append(f"Pitch: {sfx.pitch_start} -> {sfx.pitch_end}")
		lines.append(f"Volume: {sfx.volume_start} -> {sfx.volume_end}")

		if sfx.data:
			lines.append("")
			lines.append(f"Data ({len(sfx.data)} bytes):")
			# Show hex dump
			for i in range(0, min(len(sfx.data), 64), 16):
				chunk = sfx.data[i:i + 16]
				hex_str = " ".join(f"{b:02X}" for b in chunk)
				lines.append(f"  {i:04X}: {hex_str}")

		return "\n".join(lines)


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Music/Sound Data Editor")
	parser.add_argument("--analyze", "-a", type=Path,
						help="Analyze music file (NSF, SPC)")
	parser.add_argument("--extract", "-e", type=Path,
						help="Extract from ROM")
	parser.add_argument("--offset", type=str,
						help="Offset in ROM (hex)")
	parser.add_argument("--length", "-l", type=int, default=256,
						help="Data length to extract")
	parser.add_argument("--input", "-i", type=Path,
						help="Input JSON file")
	parser.add_argument("--output", "-o", type=Path,
						help="Output file")
	parser.add_argument("--format", "-f", type=str,
						choices=["simple", "extended"],
						default="simple",
						help="Note data format")
	parser.add_argument("--list", action="store_true",
						help="List songs/effects")

	args = parser.parse_args()
	editor = MusicEditor()

	if args.analyze:
		data = args.analyze.read_bytes()

		# Try NSF
		header = editor.parse_nsf_header(data)
		if "error" not in header:
			print("NSF File Analysis")
			print("=" * 50)
			for k, v in header.items():
				print(f"{k}: {v}")
			return

		# Try SPC
		header = editor.parse_spc_header(data)
		if "error" not in header:
			print("SPC File Analysis")
			print("=" * 50)
			for k, v in header.items():
				print(f"{k}: {v}")
			return

		# Unknown format - show raw data
		print("Unknown Format - Raw Data Analysis")
		print("=" * 50)
		print(f"Size: {len(data)} bytes")
		print(f"First 16 bytes: {data[:16].hex()}")
		return

	if args.extract:
		rom_data = args.extract.read_bytes()
		offset = int(args.offset, 16) if args.offset else 0
		length = args.length

		if offset + length > len(rom_data):
			print(f"Error: Offset + length exceeds ROM size")
			return

		music_data = rom_data[offset:offset + length]
		notes = editor.extract_note_data(music_data, args.format)

		print(f"Extracted {len(notes)} notes from offset 0x{offset:X}")
		print()
		print(editor.format_notes(notes))

		if args.output:
			# Save as song
			song = editor.create_song(0, "Extracted")
			pattern = Pattern(pattern_id=0, name="Main")
			channel = Channel(channel_id=0, name="Square1")
			channel.notes = notes
			pattern.channels[0] = channel
			song.patterns[0] = pattern
			song.pattern_sequence = [0]

			editor.save_json(args.output)
			print(f"\nSaved to: {args.output}")
		return

	if args.input:
		editor.load_json(args.input)

		if args.list:
			print("Songs:")
			for song in editor.songs.values():
				print(f"  {song.song_id}: {song.name}")
			print()
			print("Sound Effects:")
			for sfx in editor.sound_effects.values():
				print(f"  {sfx.sfx_id}: {sfx.name}")
		else:
			for song in editor.songs.values():
				print(editor.format_song(song))
				print()
			for sfx in editor.sound_effects.values():
				print(editor.format_sfx(sfx))
				print()
		return

	# Default: show help
	print("Music/Sound Data Editor")
	print()
	print("Usage:")
	print("  --analyze FILE           Analyze NSF/SPC file")
	print("  --extract ROM --offset   Extract note data")
	print("  --input FILE             Load JSON data")
	print("  --output FILE            Save extracted data")


if __name__ == "__main__":
	main()
