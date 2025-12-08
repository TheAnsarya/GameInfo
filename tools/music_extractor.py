#!/usr/bin/env python3
"""
Music Extractor - Extract and convert game music from ROMs.

Supports extracting music data from various game formats and converting
to standard formats like MIDI, NSF, SPC, etc.

Usage:
	python music_extractor.py <rom_file> --output <output_dir>
	python music_extractor.py <rom_file> --track 5 --format midi

Features:
	- Extract NSF (NES Sound Format) data
	- Extract SPC (SNES Audio) data
	- Extract GBS (Game Boy Sound) data
	- Convert to MIDI approximations
	- Export track lists and metadata
"""

import argparse
import json
import os
import struct
import sys
from dataclasses import dataclass, field
from enum import IntEnum
from pathlib import Path
from typing import Any, BinaryIO, Dict, List, Optional, Tuple


class Platform(IntEnum):
	"""Supported platforms."""
	NES = 0
	SNES = 1
	GB = 2
	GBC = 3
	GBA = 4
	GENESIS = 5


@dataclass
class MusicTrack:
	"""Single music track."""
	id: int
	name: str
	offset: int
	length: int
	data: bytes = b""
	metadata: Dict[str, Any] = field(default_factory=dict)
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		return {
			"id": self.id,
			"name": self.name,
			"offset": f"0x{self.offset:06X}",
			"length": self.length,
			"metadata": self.metadata
		}


@dataclass
class SoundEffect:
	"""Sound effect data."""
	id: int
	name: str
	offset: int
	length: int
	data: bytes = b""


class NSFExtractor:
	"""Extract NSF format music from NES ROMs."""
	
	NSF_HEADER_SIZE = 128
	
	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.tracks: List[MusicTrack] = []
	
	def create_nsf(self, 
				   music_data: bytes,
				   song_count: int = 1,
				   start_song: int = 1,
				   load_addr: int = 0x8000,
				   init_addr: int = 0x8000,
				   play_addr: int = 0x8003,
				   title: str = "Extracted Music",
				   artist: str = "Unknown",
				   copyright_str: str = "") -> bytes:
		"""Create an NSF file from extracted music data."""
		
		# NSF header
		header = bytearray(self.NSF_HEADER_SIZE)
		
		# Magic number "NESM" + 0x1A
		header[0:5] = b"NESM\x1A"
		
		# Version (always 1)
		header[5] = 0x01
		
		# Total songs
		header[6] = min(song_count, 255)
		
		# Starting song (1-based)
		header[7] = start_song
		
		# Load address (little-endian)
		header[8:10] = struct.pack("<H", load_addr)
		
		# Init address
		header[10:12] = struct.pack("<H", init_addr)
		
		# Play address
		header[12:14] = struct.pack("<H", play_addr)
		
		# Song name (32 bytes max)
		title_bytes = title.encode("ascii", errors="ignore")[:31]
		header[14:14+len(title_bytes)] = title_bytes
		
		# Artist (32 bytes max)
		artist_bytes = artist.encode("ascii", errors="ignore")[:31]
		header[46:46+len(artist_bytes)] = artist_bytes
		
		# Copyright (32 bytes max)
		copyright_bytes = copyright_str.encode("ascii", errors="ignore")[:31]
		header[78:78+len(copyright_bytes)] = copyright_bytes
		
		# Play speed (NTSC) in microseconds (16667 for 60Hz)
		header[110:112] = struct.pack("<H", 16667)
		
		# Bankswitch values (0 = not used)
		# header[112:120] already zeros
		
		# Play speed (PAL) in microseconds (20000 for 50Hz)
		header[120:122] = struct.pack("<H", 20000)
		
		# PAL/NTSC flags (0 = NTSC)
		header[122] = 0x00
		
		# Extra chip support (0 = none)
		header[123] = 0x00
		
		# Expansion bytes
		header[124:128] = b"\x00\x00\x00\x00"
		
		return bytes(header) + music_data
	
	def find_music_engine(self) -> Optional[Dict[str, Any]]:
		"""Try to identify the music engine used."""
		# Common signatures for NES music engines
		
		signatures = {
			"Konami VRC6": b"\x9002\x9001\x9000",
			"Konami VRC7": b"\x9010\x9030",
			"Namco N163": b"\xF800",
			"FDS": b"\x4080\x4082\x4083",
			"MMC5": b"\x5000\x5002\x5004",
			"Sunsoft 5B": b"\xC000\xE000",
		}
		
		for name, sig in signatures.items():
			if sig in self.rom_data:
				return {"engine": name, "signature": sig.hex()}
		
		return None
	
	def extract_tracks(self) -> List[MusicTrack]:
		"""Extract music tracks from ROM."""
		# This is a simplified extraction - real implementation would need
		# game-specific knowledge of the music format
		
		tracks = []
		
		# Look for common music table patterns
		# Many games store music pointers in a table
		
		# Search for potential pointer tables
		for offset in range(0, len(self.rom_data) - 32, 16):
			# Check if this looks like a pointer table
			potential_pointers = []
			valid = True
			
			for i in range(8):
				ptr_offset = offset + i * 2
				if ptr_offset + 2 > len(self.rom_data):
					valid = False
					break
				
				ptr = struct.unpack_from("<H", self.rom_data, ptr_offset)[0]
				
				# NES address space check
				if not (0x8000 <= ptr <= 0xFFFF):
					valid = False
					break
				
				potential_pointers.append(ptr)
			
			if valid and len(set(potential_pointers)) == len(potential_pointers):
				# Found potential music table
				for i, ptr in enumerate(potential_pointers):
					tracks.append(MusicTrack(
						id=i,
						name=f"Track_{i:02d}",
						offset=ptr,
						length=0  # Would need further analysis
					))
		
		self.tracks = tracks[:16]  # Limit to reasonable number
		return self.tracks


class SPCExtractor:
	"""Extract SPC format music from SNES ROMs."""
	
	SPC_HEADER_SIZE = 256
	SPC_RAM_SIZE = 65536
	SPC_DSP_SIZE = 128
	
	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.tracks: List[MusicTrack] = []
	
	def create_spc(self,
				   spc_ram: bytes,
				   dsp_regs: bytes = b"\x00" * 128,
				   pc: int = 0x0200,
				   a: int = 0,
				   x: int = 0,
				   y: int = 0,
				   psw: int = 0,
				   sp: int = 0xEF,
				   title: str = "Extracted",
				   game: str = "Unknown",
				   dumper: str = "") -> bytes:
		"""Create an SPC file."""
		
		# SPC header
		header = bytearray(self.SPC_HEADER_SIZE)
		
		# Magic string
		header[0:33] = b"SNES-SPC700 Sound File Data v0.30"
		
		# Two separator bytes
		header[33:35] = b"\x1a\x1a"
		
		# Has ID666 tag
		header[35] = 0x1A
		
		# Version minor
		header[36] = 30
		
		# SPC700 registers
		header[37:39] = struct.pack("<H", pc)  # PC
		header[39] = a  # A
		header[40] = x  # X
		header[41] = y  # Y
		header[42] = psw  # PSW
		header[43] = sp  # SP
		header[44:46] = b"\x00\x00"  # Reserved
		
		# ID666 tag (text format)
		title_bytes = title.encode("ascii", errors="ignore")[:32]
		header[46:46+len(title_bytes)] = title_bytes
		
		game_bytes = game.encode("ascii", errors="ignore")[:32]
		header[78:78+len(game_bytes)] = game_bytes
		
		dumper_bytes = dumper.encode("ascii", errors="ignore")[:16]
		header[110:110+len(dumper_bytes)] = dumper_bytes
		
		# Pad SPC RAM to 64KB
		spc_ram_padded = spc_ram[:self.SPC_RAM_SIZE]
		if len(spc_ram_padded) < self.SPC_RAM_SIZE:
			spc_ram_padded = spc_ram_padded + b"\x00" * (self.SPC_RAM_SIZE - len(spc_ram_padded))
		
		# Pad DSP regs to 128 bytes
		dsp_padded = dsp_regs[:self.SPC_DSP_SIZE]
		if len(dsp_padded) < self.SPC_DSP_SIZE:
			dsp_padded = dsp_padded + b"\x00" * (self.SPC_DSP_SIZE - len(dsp_padded))
		
		# Extra RAM (64 bytes)
		extra_ram = b"\x00" * 64
		
		return bytes(header) + spc_ram_padded + dsp_padded + extra_ram
	
	def find_brr_samples(self) -> List[Tuple[int, int]]:
		"""Find BRR (Bit Rate Reduction) samples in ROM."""
		samples = []
		
		# BRR samples are 9 bytes each
		# First byte is header, next 8 are compressed audio
		
		offset = 0
		while offset < len(self.rom_data) - 9:
			header = self.rom_data[offset]
			
			# Check for valid BRR header
			# Bits 0-1: filter (0-3)
			# Bits 2-3: range (0-12 valid)
			# Bit 4: end flag
			# Bit 5: loop flag
			
			brr_range = (header >> 4) & 0x0F
			
			if brr_range <= 12:
				# Could be valid BRR
				# Look for sequence of valid headers
				valid_blocks = 0
				check_offset = offset
				
				while check_offset < len(self.rom_data) - 9:
					h = self.rom_data[check_offset]
					r = (h >> 4) & 0x0F
					
					if r > 12:
						break
					
					valid_blocks += 1
					
					if h & 0x01:  # End flag
						break
					
					check_offset += 9
				
				if valid_blocks >= 4:  # Minimum 4 blocks
					sample_len = valid_blocks * 9
					samples.append((offset, sample_len))
					offset = check_offset + 9
					continue
			
			offset += 1
		
		return samples
	
	def extract_sample_table(self, table_offset: int) -> List[Dict[str, Any]]:
		"""Extract sample directory table."""
		samples = []
		
		# SNES sample directory: 4 bytes per entry
		# 2 bytes: start address
		# 2 bytes: loop address
		
		for i in range(64):  # Max 64 samples
			entry_offset = table_offset + i * 4
			if entry_offset + 4 > len(self.rom_data):
				break
			
			start = struct.unpack_from("<H", self.rom_data, entry_offset)[0]
			loop = struct.unpack_from("<H", self.rom_data, entry_offset + 2)[0]
			
			if start == 0 and loop == 0:
				continue
			
			samples.append({
				"id": i,
				"start": f"0x{start:04X}",
				"loop": f"0x{loop:04X}"
			})
		
		return samples


class GBSExtractor:
	"""Extract GBS format music from Game Boy ROMs."""
	
	GBS_HEADER_SIZE = 112
	
	def __init__(self, rom_data: bytes):
		self.rom_data = rom_data
		self.tracks: List[MusicTrack] = []
	
	def create_gbs(self,
				   music_data: bytes,
				   song_count: int = 1,
				   first_song: int = 1,
				   load_addr: int = 0x4000,
				   init_addr: int = 0x4000,
				   play_addr: int = 0x4003,
				   sp: int = 0xFFFE,
				   timer_mod: int = 0,
				   timer_ctrl: int = 0,
				   title: str = "Extracted Music",
				   author: str = "Unknown",
				   copyright_str: str = "") -> bytes:
		"""Create a GBS file."""
		
		# GBS header
		header = bytearray(self.GBS_HEADER_SIZE)
		
		# Magic string "GBS"
		header[0:3] = b"GBS"
		
		# Version
		header[3] = 0x01
		
		# Song count
		header[4] = min(song_count, 255)
		
		# First song (1-based)
		header[5] = first_song
		
		# Load address
		header[6:8] = struct.pack("<H", load_addr)
		
		# Init address
		header[8:10] = struct.pack("<H", init_addr)
		
		# Play address
		header[10:12] = struct.pack("<H", play_addr)
		
		# Stack pointer
		header[12:14] = struct.pack("<H", sp)
		
		# Timer modulo
		header[14] = timer_mod
		
		# Timer control
		header[15] = timer_ctrl
		
		# Title (32 bytes)
		title_bytes = title.encode("ascii", errors="ignore")[:31]
		header[16:16+len(title_bytes)] = title_bytes
		
		# Author (32 bytes)
		author_bytes = author.encode("ascii", errors="ignore")[:31]
		header[48:48+len(author_bytes)] = author_bytes
		
		# Copyright (32 bytes)
		copyright_bytes = copyright_str.encode("ascii", errors="ignore")[:31]
		header[80:80+len(copyright_bytes)] = copyright_bytes
		
		return bytes(header) + music_data
	
	def find_wave_patterns(self) -> List[Tuple[int, bytes]]:
		"""Find Game Boy wave channel patterns."""
		patterns = []
		
		# Wave patterns are 16 bytes each (32 4-bit samples)
		# Look for patterns that look like waveforms
		
		for offset in range(0, len(self.rom_data) - 16):
			pattern = self.rom_data[offset:offset+16]
			
			# Check if it looks like a wave pattern
			# Should have varied values between 0x00 and 0xFF
			unique_nibbles = set()
			for byte in pattern:
				unique_nibbles.add(byte >> 4)
				unique_nibbles.add(byte & 0x0F)
			
			# Good wave patterns have variety
			if 4 <= len(unique_nibbles) <= 12:
				# Check it's not just random data
				# Wave patterns often have some structure
				patterns.append((offset, pattern))
		
		return patterns


class MIDIExporter:
	"""Export music data to MIDI format."""
	
	def __init__(self):
		self.tempo = 120  # BPM
		self.ticks_per_beat = 480
	
	def create_midi_header(self, track_count: int = 1) -> bytes:
		"""Create MIDI file header."""
		# MThd chunk
		header = bytearray()
		header.extend(b"MThd")  # Chunk type
		header.extend(struct.pack(">I", 6))  # Chunk length
		header.extend(struct.pack(">H", 1 if track_count > 1 else 0))  # Format
		header.extend(struct.pack(">H", track_count))  # Track count
		header.extend(struct.pack(">H", self.ticks_per_beat))  # Ticks per beat
		return bytes(header)
	
	def create_midi_track(self, events: List[Tuple[int, bytes]]) -> bytes:
		"""Create a MIDI track chunk."""
		track_data = bytearray()
		
		# Add tempo event
		track_data.extend(self._encode_vlq(0))  # Delta time
		track_data.extend(b"\xFF\x51\x03")  # Tempo meta event
		microseconds = int(60_000_000 / self.tempo)
		track_data.extend(struct.pack(">I", microseconds)[1:])  # 3 bytes
		
		# Add events
		for delta, event_data in events:
			track_data.extend(self._encode_vlq(delta))
			track_data.extend(event_data)
		
		# End of track
		track_data.extend(self._encode_vlq(0))
		track_data.extend(b"\xFF\x2F\x00")
		
		# MTrk chunk
		chunk = bytearray()
		chunk.extend(b"MTrk")
		chunk.extend(struct.pack(">I", len(track_data)))
		chunk.extend(track_data)
		
		return bytes(chunk)
	
	def _encode_vlq(self, value: int) -> bytes:
		"""Encode variable-length quantity."""
		if value < 0:
			value = 0
		
		result = [value & 0x7F]
		value >>= 7
		
		while value > 0:
			result.insert(0, (value & 0x7F) | 0x80)
			value >>= 7
		
		return bytes(result)
	
	def note_on(self, channel: int, note: int, velocity: int = 100) -> bytes:
		"""Create note on event."""
		return bytes([0x90 | (channel & 0x0F), note & 0x7F, velocity & 0x7F])
	
	def note_off(self, channel: int, note: int) -> bytes:
		"""Create note off event."""
		return bytes([0x80 | (channel & 0x0F), note & 0x7F, 0])
	
	def program_change(self, channel: int, program: int) -> bytes:
		"""Create program change event."""
		return bytes([0xC0 | (channel & 0x0F), program & 0x7F])


class MusicExtractor:
	"""Main music extraction class."""
	
	def __init__(self, filepath: str):
		self.filepath = filepath
		self.filename = os.path.basename(filepath)
		
		with open(filepath, "rb") as f:
			self.rom_data = f.read()
		
		self.platform = self._detect_platform()
		self.tracks: List[MusicTrack] = []
		self.samples: List[Dict[str, Any]] = []
	
	def _detect_platform(self) -> Platform:
		"""Detect ROM platform."""
		# Check for iNES header
		if self.rom_data[:4] == b"NES\x1A":
			return Platform.NES
		
		# Check for SNES
		# Look for valid SNES header at $7FC0 or $FFC0
		for header_offset in [0x7FC0, 0xFFC0, 0x81C0, 0x101C0]:
			if header_offset + 32 <= len(self.rom_data):
				# Check checksum complement
				if header_offset + 0x1E + 2 <= len(self.rom_data):
					checksum = struct.unpack_from("<H", self.rom_data, header_offset + 0x1E)[0]
					complement = struct.unpack_from("<H", self.rom_data, header_offset + 0x1C)[0]
					if checksum ^ complement == 0xFFFF:
						return Platform.SNES
		
		# Check for Game Boy
		if len(self.rom_data) >= 0x150:
			# Nintendo logo check
			if self.rom_data[0x104:0x134] == bytes([
				0xCE, 0xED, 0x66, 0x66, 0xCC, 0x0D, 0x00, 0x0B,
				0x03, 0x73, 0x00, 0x83, 0x00, 0x0C, 0x00, 0x0D,
				0x00, 0x08, 0x11, 0x1F, 0x88, 0x89, 0x00, 0x0E,
				0xDC, 0xCC, 0x6E, 0xE6, 0xDD, 0xDD, 0xD9, 0x99,
				0xBB, 0xBB, 0x67, 0x63, 0x6E, 0x0E, 0xEC, 0xCC,
				0xDD, 0xDC, 0x99, 0x9F, 0xBB, 0xB9, 0x33, 0x3E
			]):
				cgb_flag = self.rom_data[0x143]
				if cgb_flag & 0x80:
					return Platform.GBC
				return Platform.GB
		
		# Check for GBA
		if len(self.rom_data) >= 0xC0:
			if self.rom_data[0x04:0x9C] == bytes([0x24, 0xFF, 0xAE] + [0x51, 0x69] * 77):
				return Platform.GBA
		
		return Platform.NES  # Default
	
	def extract(self) -> Dict[str, Any]:
		"""Extract music from ROM."""
		result = {
			"file": self.filename,
			"platform": self.platform.name,
			"tracks": [],
			"samples": [],
			"metadata": {}
		}
		
		if self.platform == Platform.NES:
			extractor = NSFExtractor(self.rom_data)
			engine_info = extractor.find_music_engine()
			if engine_info:
				result["metadata"]["engine"] = engine_info
			
			self.tracks = extractor.extract_tracks()
		
		elif self.platform == Platform.SNES:
			extractor = SPCExtractor(self.rom_data)
			samples = extractor.find_brr_samples()
			result["metadata"]["brr_samples"] = len(samples)
			
			# Store sample locations
			for i, (offset, length) in enumerate(samples[:32]):
				self.samples.append({
					"id": i,
					"offset": f"0x{offset:06X}",
					"length": length
				})
		
		elif self.platform in (Platform.GB, Platform.GBC):
			extractor = GBSExtractor(self.rom_data)
			patterns = extractor.find_wave_patterns()
			result["metadata"]["wave_patterns"] = len(patterns)
		
		result["tracks"] = [t.to_dict() for t in self.tracks]
		result["samples"] = self.samples
		
		return result
	
	def export_nsf(self, output_path: str, title: str = "") -> bool:
		"""Export as NSF file."""
		if self.platform != Platform.NES:
			print("NSF export only supported for NES ROMs")
			return False
		
		extractor = NSFExtractor(self.rom_data)
		
		# Get music data (simplified - actual implementation needs game-specific knowledge)
		# For now, export a portion of the ROM that might contain music
		
		# Skip iNES header if present
		data_start = 16 if self.rom_data[:4] == b"NES\x1A" else 0
		
		# Create NSF
		nsf_data = extractor.create_nsf(
			self.rom_data[data_start:data_start + 0x8000],
			song_count=len(self.tracks) or 1,
			title=title or Path(self.filename).stem,
		)
		
		with open(output_path, "wb") as f:
			f.write(nsf_data)
		
		return True
	
	def export_track_list(self, output_path: str) -> None:
		"""Export track list as JSON."""
		data = self.extract()
		
		with open(output_path, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t")


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Music Extractor")
	parser.add_argument("rom", help="ROM file to extract from")
	parser.add_argument("--output", "-o", help="Output directory")
	parser.add_argument("--format", "-f", choices=["nsf", "spc", "gbs", "midi", "json"],
						default="json", help="Output format")
	parser.add_argument("--track", "-t", type=int, help="Specific track to extract")
	parser.add_argument("--list", "-l", action="store_true", help="List tracks only")
	parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")
	
	args = parser.parse_args()
	
	if not os.path.exists(args.rom):
		print(f"Error: ROM file not found: {args.rom}")
		sys.exit(1)
	
	extractor = MusicExtractor(args.rom)
	
	print(f"ROM: {extractor.filename}")
	print(f"Platform: {extractor.platform.name}")
	print()
	
	# Extract music info
	info = extractor.extract()
	
	if args.list or args.verbose:
		print(f"Tracks found: {len(info['tracks'])}")
		for track in info["tracks"]:
			print(f"  {track['id']:3d}: {track['name']} @ {track['offset']}")
		
		if info["samples"]:
			print(f"\nSamples found: {len(info['samples'])}")
			for sample in info["samples"][:10]:
				print(f"  {sample['id']:3d}: @ {sample['offset']} ({sample['length']} bytes)")
		
		if info["metadata"]:
			print(f"\nMetadata:")
			for key, value in info["metadata"].items():
				print(f"  {key}: {value}")
	
	# Export
	if args.output:
		os.makedirs(args.output, exist_ok=True)
		
		if args.format == "json":
			output_file = os.path.join(args.output, f"{Path(args.rom).stem}_music.json")
			extractor.export_track_list(output_file)
			print(f"\nExported track list to: {output_file}")
		
		elif args.format == "nsf":
			output_file = os.path.join(args.output, f"{Path(args.rom).stem}.nsf")
			if extractor.export_nsf(output_file):
				print(f"\nExported NSF to: {output_file}")
		
		else:
			print(f"\nFormat '{args.format}' export not yet implemented")


if __name__ == "__main__":
	main()
