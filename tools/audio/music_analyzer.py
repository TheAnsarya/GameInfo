#!/usr/bin/env python3
"""
Music Data Analyzer - Analyze game music data formats

Analyzes music/sound engine data:
- Detect music engine types
- Parse sequence data
- Extract instrument definitions
- Convert to MIDI (basic)
- Document format specifications

Supports common engines:
- NES: Nintendo, Konami, Capcom, Squaresoft
- SNES: SPC700 based engines
- Genesis: FM/PSG engines
"""

import argparse
import json
import os
import struct
import sys
from collections import defaultdict
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Optional, Tuple


class EngineType(Enum):
	"""Known music engine types"""
	NINTENDO_NES = "nintendo_nes"
	KONAMI_NES = "konami_nes"
	CAPCOM_NES = "capcom_nes"
	SQUARE_NES = "square_nes"
	ENIX_NES = "enix_nes"
	SPC_GENERIC = "spc_generic"
	SNES_NINTENDO = "snes_nintendo"
	GENESIS_GEMS = "genesis_gems"
	GENESIS_SMPS = "genesis_smps"
	UNKNOWN = "unknown"


@dataclass
class NoteEvent:
	"""Single musical note event"""
	tick: int
	channel: int
	note: int  # MIDI note number
	duration: int
	velocity: int = 100
	is_rest: bool = False


@dataclass
class InstrumentDef:
	"""Instrument/voice definition"""
	id: int
	name: str = ""
	envelope: list = field(default_factory=list)
	wave: int = 0
	params: dict = field(default_factory=dict)


@dataclass
class MusicTrack:
	"""Complete music track"""
	name: str = ""
	tempo: int = 120
	channels: int = 4
	events: list = field(default_factory=list)
	instruments: list = field(default_factory=list)
	loop_start: Optional[int] = None
	loop_end: Optional[int] = None


class NESMusicAnalyzer:
	"""Analyze NES music data"""

	# Common NES note frequency table indices
	NES_NOTES = {
		# Period to MIDI note mapping (approximate)
	}

	def __init__(self, rom_data: bytes):
		self.rom = rom_data

	def detect_engine(self) -> EngineType:
		"""Try to detect the music engine"""
		# Look for characteristic patterns

		# Nintendo - typically uses specific APU register patterns
		# Konami - VRC6/VRC7 expansion audio
		# Capcom - distinctive volume envelope patterns
		# Square - complex sequence format

		# Check for VRC6 audio signature
		if b'\x90\x00' in self.rom[0x10:0x20]:
			return EngineType.KONAMI_NES

		# Generic detection based on common patterns
		return EngineType.UNKNOWN

	def find_music_pointers(self, bank_offset: int = 0) -> list:
		"""Search for music data pointer tables"""
		pointers = []

		# Look for patterns that suggest pointer tables
		# Usually: consecutive 16-bit pointers with values in ROM range

		for i in range(len(self.rom) - 32):
			# Check for potential pointer table start
			potential_pointers = []
			is_table = True

			for j in range(8):  # Check 8 consecutive 16-bit values
				offset = i + j * 2
				if offset + 1 >= len(self.rom):
					is_table = False
					break

				ptr = self.rom[offset] | (self.rom[offset + 1] << 8)

				# Check if pointer is in valid ROM range
				if ptr < 0x8000 or ptr > 0xffff:
					is_table = False
					break

				potential_pointers.append(ptr)

			if is_table and len(set(potential_pointers)) == len(potential_pointers):
				# Found potential pointer table (all unique pointers)
				pointers.append({
					'offset': i,
					'pointers': potential_pointers
				})

		return pointers[:20]  # Return first 20 candidates

	def analyze_sequence(self, offset: int, max_bytes: int = 256) -> dict:
		"""Analyze potential music sequence data"""
		data = self.rom[offset:offset + max_bytes]
		analysis = {
			'offset': offset,
			'note_like_bytes': 0,
			'control_bytes': 0,
			'potential_notes': [],
			'potential_loops': []
		}

		# Count byte patterns
		for i, byte in enumerate(data):
			# Notes typically in range 0x00-0x60 for most engines
			if 0x00 <= byte <= 0x60:
				analysis['note_like_bytes'] += 1
			# Control codes often 0x80+ or specific values
			elif byte >= 0x80:
				analysis['control_bytes'] += 1

			# Look for loop markers (often 0xff followed by offset)
			if byte == 0xff and i + 2 < len(data):
				loop_offset = data[i + 1] | (data[i + 2] << 8)
				if 0x8000 <= loop_offset <= 0xffff:
					analysis['potential_loops'].append({
						'position': offset + i,
						'target': loop_offset
					})

		return analysis


class SNESMusicAnalyzer:
	"""Analyze SNES music data (SPC format)"""

	def __init__(self, data: bytes):
		self.data = data
		self.is_spc = self._check_spc_format()

	def _check_spc_format(self) -> bool:
		"""Check if data is SPC file format"""
		return self.data[:33] == b'SNES-SPC700 Sound File Data v0.30'

	def parse_spc_header(self) -> dict:
		"""Parse SPC file header"""
		if not self.is_spc:
			return {}

		return {
			'has_id666': self.data[0x23] == 0x1a,
			'song_title': self.data[0x2e:0x4e].rstrip(b'\x00').decode('ascii', errors='replace'),
			'game_title': self.data[0x4e:0x6e].rstrip(b'\x00').decode('ascii', errors='replace'),
			'dumper': self.data[0x6e:0x7e].rstrip(b'\x00').decode('ascii', errors='replace'),
			'comments': self.data[0x7e:0x9e].rstrip(b'\x00').decode('ascii', errors='replace'),
			'date_dumped': self.data[0x9e:0xa9].rstrip(b'\x00').decode('ascii', errors='replace'),
			'length_seconds': int.from_bytes(self.data[0xa9:0xac], 'little'),
			'fade_length': int.from_bytes(self.data[0xac:0xb0], 'little'),
		}

	def extract_brr_samples(self) -> list:
		"""Extract BRR (Bit Rate Reduced) sample data"""
		# BRR format: 9 bytes per block (1 header + 8 data)
		# This is simplified - actual extraction requires DSP knowledge
		samples = []

		if not self.is_spc:
			return samples

		# SPC RAM starts at offset 0x100
		ram = self.data[0x100:0x10100]

		# Look for BRR sample headers
		# Header byte format: EFNN NNNN (E=end, F=filter, N=shift)
		for i in range(0, len(ram) - 9, 9):
			header = ram[i]
			if header & 0x03 <= 3:  # Valid filter (0-3)
				# Potential BRR block
				shift = (header >> 4) & 0x0f
				if shift <= 12:  # Valid shift amount
					samples.append({
						'offset': i,
						'header': header,
						'is_end': bool(header & 0x01),
						'is_loop': bool(header & 0x02)
					})

		return samples[:100]  # First 100 potential samples


class MusicDocumenter:
	"""Generate documentation for music format"""

	def document_engine(self, engine_type: EngineType) -> str:
		"""Generate documentation for known engine types"""
		docs = {
			EngineType.NINTENDO_NES: self._doc_nintendo_nes(),
			EngineType.KONAMI_NES: self._doc_konami_nes(),
			EngineType.SQUARE_NES: self._doc_square_nes(),
			EngineType.GENESIS_SMPS: self._doc_smps(),
		}

		return docs.get(engine_type, self._doc_unknown())

	def _doc_nintendo_nes(self) -> str:
		return """
# Nintendo NES Music Engine

## Overview
Standard Nintendo sound engine used in first-party games.

## Channel Layout
- Channel 0: Pulse 1 (12.5%, 25%, 50%, 75% duty)
- Channel 1: Pulse 2 (12.5%, 25%, 50%, 75% duty)
- Channel 2: Triangle
- Channel 3: Noise
- Channel 4: DPCM (samples)

## Sequence Format
Typical byte format:
- $00-$5F: Note values (period index)
- $60-$7F: Note durations
- $80-$EF: Control commands
- $F0-$FF: Special commands (loop, end)

## Common Commands
- $FE: Loop marker
- $FF: End of track
"""

	def _doc_konami_nes(self) -> str:
		return """
# Konami NES Music Engine

## Overview
Used in Konami NES games, may include VRC6 expansion audio.

## Channel Layout
- Channel 0-1: Pulse
- Channel 2: Triangle
- Channel 3: Noise
- Channel 4-5: VRC6 Pulse (expansion)
- Channel 6: VRC6 Sawtooth (expansion)

## Features
- Advanced envelope system
- Vibrato/tremolo effects
- Multiple voice support
"""

	def _doc_square_nes(self) -> str:
		return """
# Square/Squaresoft NES Music Engine

## Overview
Used in Square NES titles (Final Fantasy, etc.)

## Features
- Complex sequence format
- Instrument macros
- Echo/delay effects simulation
- Advanced looping system
"""

	def _doc_smps(self) -> str:
		return """
# SMPS (Sega Mega Play Sound System)

## Overview
Standard Sega Genesis/Mega Drive music engine.

## Channel Layout
- FM Channels: 1-6 (YM2612)
- PSG Channels: 1-4 (SN76489)

## Sequence Format
Header includes:
- Pointer to voice bank
- Channel pointers
- Tempo/timing info

## FM Voice Format
25 bytes per voice:
- Algorithm/feedback (1 byte)
- Operator data (6 bytes × 4 operators)
"""

	def _doc_unknown(self) -> str:
		return """
# Unknown Music Engine

## Analysis Required
This engine type could not be automatically identified.

## Manual Analysis Steps
1. Locate music pointer tables
2. Trace sequence data format
3. Identify note/duration encoding
4. Document control commands
5. Find instrument/voice data
"""


def main():
	parser = argparse.ArgumentParser(
		description='Analyze game music data formats'
	)

	subparsers = parser.add_subparsers(dest='command', help='Commands')

	# Analyze command
	analyze_parser = subparsers.add_parser('analyze', help='Analyze music data')
	analyze_parser.add_argument('input', help='ROM or music file')
	analyze_parser.add_argument('--platform', choices=['nes', 'snes', 'genesis', 'spc'],
							   default='nes', help='Platform')
	analyze_parser.add_argument('--offset', type=lambda x: int(x, 0), default=0,
							   help='Start offset')

	# Detect command
	detect_parser = subparsers.add_parser('detect', help='Detect music engine')
	detect_parser.add_argument('input', help='ROM file')
	detect_parser.add_argument('--platform', choices=['nes', 'snes', 'genesis'],
							  default='nes')

	# Pointers command
	ptr_parser = subparsers.add_parser('pointers', help='Find music pointers')
	ptr_parser.add_argument('input', help='ROM file')
	ptr_parser.add_argument('--bank', type=lambda x: int(x, 0), default=0,
						   help='Bank offset')

	# Document command
	doc_parser = subparsers.add_parser('document', help='Generate format documentation')
	doc_parser.add_argument('--engine', choices=[e.value for e in EngineType],
						   help='Engine type')
	doc_parser.add_argument('-o', '--output', help='Output file')

	# SPC command
	spc_parser = subparsers.add_parser('spc', help='Analyze SPC file')
	spc_parser.add_argument('input', help='SPC file')
	spc_parser.add_argument('--samples', action='store_true',
						   help='Find BRR samples')

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return

	if args.command == 'analyze':
		with open(args.input, 'rb') as f:
			data = f.read()

		if args.platform == 'nes':
			analyzer = NESMusicAnalyzer(data)
			result = analyzer.analyze_sequence(args.offset)
			print(json.dumps(result, indent=2))

		elif args.platform in ('snes', 'spc'):
			analyzer = SNESMusicAnalyzer(data)
			if analyzer.is_spc:
				header = analyzer.parse_spc_header()
				print(json.dumps(header, indent=2))
			else:
				print("Not a valid SPC file")

	elif args.command == 'detect':
		with open(args.input, 'rb') as f:
			data = f.read()

		if args.platform == 'nes':
			analyzer = NESMusicAnalyzer(data)
			engine = analyzer.detect_engine()
			print(f"Detected engine: {engine.value}")

	elif args.command == 'pointers':
		with open(args.input, 'rb') as f:
			data = f.read()

		analyzer = NESMusicAnalyzer(data)
		pointers = analyzer.find_music_pointers(args.bank)

		print(f"Found {len(pointers)} potential pointer tables:")
		for table in pointers:
			print(f"\nOffset ${table['offset']:06x}:")
			for i, ptr in enumerate(table['pointers']):
				print(f"  [{i}] ${ptr:04x}")

	elif args.command == 'document':
		documenter = MusicDocumenter()
		if args.engine:
			engine = EngineType(args.engine)
		else:
			engine = EngineType.UNKNOWN

		doc = documenter.document_engine(engine)

		if args.output:
			with open(args.output, 'w', encoding='utf-8') as f:
				f.write(doc)
			print(f"Documentation written to {args.output}")
		else:
			print(doc)

	elif args.command == 'spc':
		with open(args.input, 'rb') as f:
			data = f.read()

		analyzer = SNESMusicAnalyzer(data)

		if not analyzer.is_spc:
			print("Not a valid SPC file")
			return

		header = analyzer.parse_spc_header()
		print("SPC File Information:")
		print("-" * 40)
		for key, value in header.items():
			print(f"  {key}: {value}")

		if args.samples:
			print("\nBRR Samples Found:")
			print("-" * 40)
			samples = analyzer.extract_brr_samples()
			for sample in samples[:20]:
				flags = []
				if sample['is_end']:
					flags.append("END")
				if sample['is_loop']:
					flags.append("LOOP")
				print(f"  ${sample['offset']:04x}: header=${sample['header']:02x} "
					 f"{' '.join(flags)}")


if __name__ == '__main__':
	main()
