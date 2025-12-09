#!/usr/bin/env python3
"""
Music Ripper - Extract music data from NES/SNES/GB ROMs.

Supports:
- NES: NSF format extraction, FamiTracker module detection
- SNES: SPC700 music data, BRR samples
- GB/GBC: GBS format extraction

Author: ROM Hacking Toolkit
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional, Tuple, Any, Set


class Platform(Enum):
	"""Supported platforms."""
	NES = "nes"
	SNES = "snes"
	GB = "gb"
	GBC = "gbc"
	UNKNOWN = "unknown"


@dataclass
class MusicTrack:
	"""Represents a music track."""
	index: int
	name: str
	offset: int
	size: int
	platform: Platform
	data: bytes = field(default_factory=bytes, repr=False)
	metadata: Dict[str, Any] = field(default_factory=dict)


@dataclass
class SampleData:
	"""Represents audio sample data."""
	index: int
	name: str
	offset: int
	size: int
	sample_rate: int
	bit_depth: int
	data: bytes = field(default_factory=bytes, repr=False)


class NESMusicRipper:
	"""Extract music data from NES ROMs."""

	# Common NES audio driver signatures
	DRIVER_SIGNATURES = {
		"famitracker": bytes([0xA9, 0x00, 0x8D, 0x15, 0x40]),  # LDA #$00, STA $4015
		"nsd_lib": bytes([0x20, 0x00, 0x80]),  # JSR to music init
		"famitone": bytes([0xA2, 0x00, 0xA9]),  # LDX #$00, LDA
		"ppmck": bytes([0xA9, 0x0F, 0x8D, 0x15, 0x40]),  # LDA #$0F, STA $4015
	}

	def __init__(self, rom_data: bytes):
		"""Initialize with ROM data."""
		self.rom_data = rom_data
		self.header_size = 16
		self.prg_size = 0
		self.chr_size = 0
		self.mapper = 0
		self._parse_header()

	def _parse_header(self) -> None:
		"""Parse iNES header."""
		if len(self.rom_data) < 16:
			return

		if self.rom_data[:4] != b'NES\x1a':
			return

		self.prg_size = self.rom_data[4] * 16384
		self.chr_size = self.rom_data[5] * 8192
		self.mapper = (self.rom_data[6] >> 4) | (self.rom_data[7] & 0xF0)

	def find_music_driver(self) -> Optional[str]:
		"""Detect which music driver the ROM uses."""
		prg_data = self.rom_data[self.header_size:self.header_size + self.prg_size]

		for driver_name, signature in self.DRIVER_SIGNATURES.items():
			if signature in prg_data:
				return driver_name

		return None

	def find_music_pointers(self) -> List[Tuple[int, int]]:
		"""Find potential music data pointers."""
		pointers = []
		prg_data = self.rom_data[self.header_size:self.header_size + self.prg_size]

		# Look for pointer tables (consecutive low/high byte pairs)
		for i in range(0, len(prg_data) - 32, 2):
			potential_ptrs = []
			valid = True

			for j in range(16):
				if i + j * 2 + 1 >= len(prg_data):
					valid = False
					break

				low = prg_data[i + j * 2]
				high = prg_data[i + j * 2 + 1]
				addr = (high << 8) | low

				# Check if pointer is in valid ROM range
				if 0x8000 <= addr <= 0xFFFF:
					potential_ptrs.append(addr)
				else:
					valid = False
					break

			if valid and len(potential_ptrs) >= 4:
				# Check for reasonable spacing between pointers
				diffs = [potential_ptrs[k+1] - potential_ptrs[k] for k in range(len(potential_ptrs)-1)]
				if all(0 < d < 0x1000 for d in diffs):
					pointers.append((self.header_size + i, len(potential_ptrs)))

		return pointers

	def extract_nsf_data(self, title: str = "Unknown", artist: str = "Unknown") -> bytes:
		"""Create NSF file from ROM music data."""
		# NSF header
		nsf_header = bytearray(128)
		nsf_header[0:5] = b'NESM\x1a'
		nsf_header[5] = 1  # Version
		nsf_header[6] = 1  # Total songs (placeholder)
		nsf_header[7] = 1  # Starting song

		# Load address (typically $8000)
		nsf_header[8] = 0x00
		nsf_header[9] = 0x80

		# Init address
		nsf_header[10] = 0x00
		nsf_header[11] = 0x80

		# Play address
		nsf_header[12] = 0x03
		nsf_header[13] = 0x80

		# Title
		title_bytes = title.encode('ascii', errors='replace')[:31]
		nsf_header[14:14+len(title_bytes)] = title_bytes

		# Artist
		artist_bytes = artist.encode('ascii', errors='replace')[:31]
		nsf_header[46:46+len(artist_bytes)] = artist_bytes

		# Copyright
		nsf_header[78:110] = b'Extracted by Music Ripper\x00\x00\x00\x00\x00\x00'

		# NTSC speed
		nsf_header[110] = 0xA3
		nsf_header[111] = 0x41

		# Bankswitch init (no bankswitching)
		# Bytes 112-119 = 0

		# PAL speed
		nsf_header[120] = 0x00
		nsf_header[121] = 0x00

		# PAL/NTSC bits
		nsf_header[122] = 0  # NTSC

		# Extra sound chip support
		nsf_header[123] = 0

		# PRG data
		prg_data = self.rom_data[self.header_size:self.header_size + self.prg_size]

		return bytes(nsf_header) + prg_data

	def find_square_wave_patterns(self) -> List[int]:
		"""Find locations that write to square wave registers."""
		locations = []
		prg_data = self.rom_data[self.header_size:self.header_size + self.prg_size]

		# Look for writes to $4000-$4007 (square wave channels)
		for i in range(len(prg_data) - 2):
			# STA $40xx pattern
			if prg_data[i] == 0x8D:  # STA absolute
				addr = prg_data[i+1] | (prg_data[i+2] << 8)
				if 0x4000 <= addr <= 0x4007:
					locations.append(self.header_size + i)

		return locations


class SNESMusicRipper:
	"""Extract music data from SNES ROMs."""

	def __init__(self, rom_data: bytes):
		"""Initialize with ROM data."""
		self.rom_data = rom_data
		self.header_offset = self._detect_header()
		self.is_lorom = True
		self._detect_mapping()

	def _detect_header(self) -> int:
		"""Detect if ROM has a copier header."""
		size = len(self.rom_data)
		if size % 1024 == 512:
			return 512
		return 0

	def _detect_mapping(self) -> None:
		"""Detect ROM mapping mode."""
		# Check for LoROM or HiROM
		header_loc = self.header_offset + 0x7FC0
		if header_loc + 32 <= len(self.rom_data):
			mode = self.rom_data[header_loc + 0x15]
			self.is_lorom = (mode & 0x01) == 0

	def find_spc_driver(self) -> Optional[int]:
		"""Find SPC700 driver upload location."""
		# Look for SPC700 upload pattern
		# Common pattern: block copy to APU ports $2140-$2143

		patterns = [
			bytes([0x8D, 0x40, 0x21]),  # STA $2140
			bytes([0x8D, 0x41, 0x21]),  # STA $2141
			bytes([0x8F]),  # STA direct page
		]

		for pattern in patterns:
			pos = self.rom_data.find(pattern)
			if pos >= 0:
				return pos

		return None

	def find_brr_samples(self) -> List[SampleData]:
		"""Find BRR (Bit Rate Reduction) audio samples."""
		samples = []
		data = self.rom_data[self.header_offset:]

		# BRR samples are 9 bytes per block
		# First byte is header: filter, range, loop, end flags

		sample_idx = 0
		i = 0
		while i < len(data) - 9:
			# Check for valid BRR header
			header = data[i]
			range_val = (header >> 4) & 0x0F
			filter_val = (header >> 2) & 0x03

			# Validate header
			if range_val <= 12:  # Valid range
				# Look for consecutive valid BRR blocks
				valid_blocks = 0
				j = i
				while j < len(data) - 9:
					h = data[j]
					if (h >> 4) & 0x0F <= 12:
						valid_blocks += 1
						if h & 0x01:  # End flag
							break
						j += 9
					else:
						break

				if valid_blocks >= 4:  # Minimum sample length
					sample_size = (valid_blocks + 1) * 9
					samples.append(SampleData(
						index=sample_idx,
						name=f"sample_{sample_idx:03d}",
						offset=self.header_offset + i,
						size=sample_size,
						sample_rate=32000,  # Default SNES sample rate
						bit_depth=16,
						data=data[i:i+sample_size]
					))
					sample_idx += 1
					i += sample_size
					continue

			i += 1

		return samples

	def extract_spc_template(self) -> bytes:
		"""Create a template SPC file."""
		# SPC700 file format
		spc = bytearray(0x10200)

		# Header
		spc[0:33] = b'SNES-SPC700 Sound File Data v0.30'
		spc[33] = 0x1A
		spc[34] = 0x1A
		spc[35] = 0x1E  # Has ID666 tag
		spc[36] = 30  # Version minor

		# SPC700 registers (placeholder)
		spc[37] = 0x00  # PC low
		spc[38] = 0x02  # PC high
		spc[39] = 0x00  # A
		spc[40] = 0x00  # X
		spc[41] = 0x00  # Y
		spc[42] = 0x02  # PSW
		spc[43] = 0xEF  # SP

		return bytes(spc)


class GBMusicRipper:
	"""Extract music data from Game Boy ROMs."""

	def __init__(self, rom_data: bytes):
		"""Initialize with ROM data."""
		self.rom_data = rom_data
		self.title = self._get_title()
		self.is_gbc = self._detect_gbc()

	def _get_title(self) -> str:
		"""Get game title from header."""
		title_bytes = self.rom_data[0x134:0x143]
		title = ""
		for b in title_bytes:
			if b == 0:
				break
			if 32 <= b < 127:
				title += chr(b)
		return title.strip()

	def _detect_gbc(self) -> bool:
		"""Detect if ROM is GBC."""
		cgb_flag = self.rom_data[0x143]
		return cgb_flag in (0x80, 0xC0)

	def find_music_engine(self) -> Optional[str]:
		"""Detect music engine type."""
		# Common GB music engine signatures
		signatures = {
			"lsdj": b'LSDJ',
			"gbsound": bytes([0x3E, 0x80, 0xE0, 0x26]),  # LD A,$80; LDH ($26),A
			"gbt_player": bytes([0x21, 0x00, 0xC0]),  # LD HL,$C000
		}

		for engine, sig in signatures.items():
			if sig in self.rom_data:
				return engine

		return None

	def find_wave_patterns(self) -> List[Tuple[int, bytes]]:
		"""Find wave channel patterns (16 bytes each)."""
		patterns = []

		# Look for writes to wave RAM ($FF30-$FF3F)
		# These are often preceded by wave pattern data

		for i in range(len(self.rom_data) - 16):
			# Check for 16 consecutive bytes that could be wave data
			chunk = self.rom_data[i:i+16]

			# Wave patterns typically have varied values
			unique_values = len(set(chunk))
			if 4 <= unique_values <= 16:
				# Check if this could be a wave pattern
				all_valid = all(b <= 0xFF for b in chunk)
				if all_valid:
					patterns.append((i, chunk))

		# Filter to likely candidates (remove duplicates and nearby)
		filtered = []
		for i, (offset, pattern) in enumerate(patterns):
			is_duplicate = False
			for prev_offset, prev_pattern in filtered:
				if pattern == prev_pattern or abs(offset - prev_offset) < 32:
					is_duplicate = True
					break
			if not is_duplicate:
				filtered.append((offset, pattern))

		return filtered[:100]  # Limit results

	def extract_gbs_data(self) -> bytes:
		"""Create GBS file from ROM."""
		# GBS header (112 bytes)
		gbs = bytearray(112)

		gbs[0:3] = b'GBS'
		gbs[3] = 1  # Version
		gbs[4] = 1  # Number of songs
		gbs[5] = 1  # First song

		# Load address
		gbs[6] = 0x00
		gbs[7] = 0x40  # $4000

		# Init address
		gbs[8] = 0x00
		gbs[9] = 0x40

		# Play address
		gbs[10] = 0x03
		gbs[11] = 0x40

		# Stack pointer
		gbs[12] = 0xFE
		gbs[13] = 0xFF

		# Timer modulo
		gbs[14] = 0

		# Timer control
		gbs[15] = 0

		# Title (32 bytes)
		title_bytes = self.title.encode('ascii', errors='replace')[:31]
		gbs[16:16+len(title_bytes)] = title_bytes

		# Author (32 bytes)
		gbs[48:80] = b'Unknown' + bytes(25)

		# Copyright (32 bytes)
		gbs[80:112] = b'Extracted by Music Ripper' + bytes(7)

		# ROM data (first 32K)
		rom_portion = self.rom_data[:32768]

		return bytes(gbs) + rom_portion


class MusicRipper:
	"""Main music ripper class."""

	def __init__(self, rom_path: str):
		"""Initialize with ROM file."""
		self.rom_path = Path(rom_path)
		self.rom_data = self.rom_path.read_bytes()
		self.platform = self._detect_platform()
		self.ripper = self._create_ripper()

	def _detect_platform(self) -> Platform:
		"""Detect ROM platform."""
		# Check file extension first
		ext = self.rom_path.suffix.lower()
		if ext in ('.nes', '.nsf'):
			return Platform.NES
		elif ext in ('.sfc', '.smc', '.spc'):
			return Platform.SNES
		elif ext == '.gb':
			return Platform.GB
		elif ext == '.gbc':
			return Platform.GBC

		# Check file content
		if self.rom_data[:4] == b'NES\x1a':
			return Platform.NES
		elif self.rom_data[:3] == b'GBS':
			return Platform.GB

		# Check for GB header
		if len(self.rom_data) >= 0x150:
			if self.rom_data[0x104:0x134] == bytes([
				0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B,
				0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D,
				0x00, 0x08, 0x11, 0x1F, 0x88, 0x89, 0x00, 0x0E,
				0xDC, 0xCC, 0x6E, 0xE6, 0xDD, 0xDD, 0xD9, 0x99,
				0xBB, 0xBB, 0x67, 0x63, 0x6E, 0x0E, 0xEC, 0xCC,
				0xDD, 0xDC, 0x99, 0x9F, 0xBB, 0xB9, 0x33, 0x3E,
			]):
				if self.rom_data[0x143] in (0x80, 0xC0):
					return Platform.GBC
				return Platform.GB

		# Assume SNES for larger ROMs
		if len(self.rom_data) >= 0x10000:
			return Platform.SNES

		return Platform.UNKNOWN

	def _create_ripper(self):
		"""Create platform-specific ripper."""
		if self.platform == Platform.NES:
			return NESMusicRipper(self.rom_data)
		elif self.platform == Platform.SNES:
			return SNESMusicRipper(self.rom_data)
		elif self.platform in (Platform.GB, Platform.GBC):
			return GBMusicRipper(self.rom_data)
		return None

	def analyze(self) -> Dict[str, Any]:
		"""Analyze ROM for music data."""
		result = {
			"platform": self.platform.value,
			"file_size": len(self.rom_data),
			"music_driver": None,
			"tracks": [],
			"samples": [],
		}

		if self.platform == Platform.NES:
			result["music_driver"] = self.ripper.find_music_driver()
			result["pointer_tables"] = self.ripper.find_music_pointers()[:10]
			result["square_writes"] = len(self.ripper.find_square_wave_patterns())

		elif self.platform == Platform.SNES:
			result["brr_samples"] = len(self.ripper.find_brr_samples())
			spc_driver = self.ripper.find_spc_driver()
			if spc_driver:
				result["spc_driver_offset"] = f"0x{spc_driver:06X}"

		elif self.platform in (Platform.GB, Platform.GBC):
			result["music_engine"] = self.ripper.find_music_engine()
			result["wave_patterns"] = len(self.ripper.find_wave_patterns())

		return result

	def extract_format(self, output_path: str, format_type: str = "auto") -> bool:
		"""Extract music to standard format."""
		output = Path(output_path)

		if self.platform == Platform.NES and format_type in ("auto", "nsf"):
			nsf_data = self.ripper.extract_nsf_data(
				title=self.rom_path.stem,
				artist="Unknown"
			)
			output.write_bytes(nsf_data)
			return True

		elif self.platform == Platform.SNES and format_type in ("auto", "spc"):
			spc_data = self.ripper.extract_spc_template()
			output.write_bytes(spc_data)
			return True

		elif self.platform in (Platform.GB, Platform.GBC) and format_type in ("auto", "gbs"):
			gbs_data = self.ripper.extract_gbs_data()
			output.write_bytes(gbs_data)
			return True

		return False

	def extract_samples(self, output_dir: str) -> int:
		"""Extract audio samples to files."""
		output = Path(output_dir)
		output.mkdir(parents=True, exist_ok=True)
		count = 0

		if self.platform == Platform.SNES:
			samples = self.ripper.find_brr_samples()
			for sample in samples:
				sample_path = output / f"{sample.name}.brr"
				sample_path.write_bytes(sample.data)

				# Also create metadata
				meta_path = output / f"{sample.name}.json"
				meta = {
					"offset": f"0x{sample.offset:06X}",
					"size": sample.size,
					"sample_rate": sample.sample_rate,
				}
				meta_path.write_text(json.dumps(meta, indent='\t'))
				count += 1

		return count


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(
		description="Extract music data from ROMs",
		formatter_class=argparse.RawDescriptionHelpFormatter,
		epilog="""
Examples:
  %(prog)s analyze game.nes
  %(prog)s extract game.nes --output music.nsf
  %(prog)s samples game.sfc --output samples/
  %(prog)s extract game.gb --output music.gbs
		"""
	)

	subparsers = parser.add_subparsers(dest="command", help="Command to execute")

	# Analyze command
	analyze_parser = subparsers.add_parser("analyze", help="Analyze ROM for music data")
	analyze_parser.add_argument("rom", help="Input ROM file")
	analyze_parser.add_argument("--json", action="store_true", help="Output as JSON")

	# Extract command
	extract_parser = subparsers.add_parser("extract", help="Extract music to standard format")
	extract_parser.add_argument("rom", help="Input ROM file")
	extract_parser.add_argument("-o", "--output", required=True, help="Output file")
	extract_parser.add_argument("-f", "--format", choices=["auto", "nsf", "spc", "gbs"],
		default="auto", help="Output format")

	# Samples command
	samples_parser = subparsers.add_parser("samples", help="Extract audio samples")
	samples_parser.add_argument("rom", help="Input ROM file")
	samples_parser.add_argument("-o", "--output", required=True, help="Output directory")

	args = parser.parse_args()

	if not args.command:
		parser.print_help()
		return 1

	try:
		ripper = MusicRipper(args.rom)

		if args.command == "analyze":
			result = ripper.analyze()

			if args.json:
				print(json.dumps(result, indent='\t'))
			else:
				print(f"Platform: {result['platform'].upper()}")
				print(f"File Size: {result['file_size']:,} bytes")

				if result.get('music_driver'):
					print(f"Music Driver: {result['music_driver']}")

				if result.get('pointer_tables'):
					print(f"Potential Music Tables: {len(result['pointer_tables'])}")

				if result.get('square_writes'):
					print(f"Square Wave Writes: {result['square_writes']}")

				if result.get('brr_samples'):
					print(f"BRR Samples Found: {result['brr_samples']}")

				if result.get('spc_driver_offset'):
					print(f"SPC Driver: {result['spc_driver_offset']}")

				if result.get('music_engine'):
					print(f"Music Engine: {result['music_engine']}")

				if result.get('wave_patterns'):
					print(f"Wave Patterns: {result['wave_patterns']}")

		elif args.command == "extract":
			if ripper.extract_format(args.output, args.format):
				print(f"Extracted to: {args.output}")
			else:
				print("Extraction failed or format not supported")
				return 1

		elif args.command == "samples":
			count = ripper.extract_samples(args.output)
			print(f"Extracted {count} samples to {args.output}")

	except FileNotFoundError:
		print(f"Error: File not found: {args.rom}")
		return 1
	except Exception as e:
		print(f"Error: {e}")
		return 1

	return 0


if __name__ == "__main__":
	sys.exit(main())
