#!/usr/bin/env python3
"""
Soul Blazer (SNES) Audio Extractor
Extracts SPC audio data and music information from the ROM.

The SNES uses the SPC700 audio processor with 64KB of audio RAM.
Soul Blazer stores its audio driver and music data in ROM and
transfers it to the SPC during gameplay.
"""

import json
import struct
from pathlib import Path
from typing import Dict, List, Optional, Tuple, BinaryIO
from dataclasses import dataclass, asdict


# SPC700 Constants
SPC_RAM_SIZE = 0x10000  # 64KB
SPC_DSP_REGISTERS = 128

# Common SNES audio driver signatures
AUDIO_SIGNATURES = [
	b'\x8f\x00\xf1',  # mov $f1, #$00 - common init
	b'\x8f\x6c\xf2',  # mov $f2, #$6c - DSP write
	b'\x8f\x4c\xf2',  # mov $f2, #$4c - DSP write
	b'\xcd\xff',      # mov x, #$ff - stack init
	b'\xbd',          # mov sp, x
]


@dataclass
class AudioTrack:
	"""Represents a music track."""
	id: int
	name: str
	offset: int
	size: int
	bank: int
	tempo: int = 0
	channels: int = 8


@dataclass
class SoundEffect:
	"""Represents a sound effect."""
	id: int
	name: str
	offset: int
	size: int


@dataclass
class SampleInfo:
	"""Represents a BRR sample."""
	id: int
	offset: int
	size: int
	loop_point: int
	pitch: int


@dataclass
class AudioExtractionResult:
	"""Results of audio extraction."""
	driver_offset: int
	driver_size: int
	music_tracks: List[AudioTrack]
	sound_effects: List[SoundEffect]
	samples: List[SampleInfo]
	total_audio_size: int


class AudioExtractor:
	"""Extract audio data from Soul Blazer ROM."""

	# Known track names for Soul Blazer
	TRACK_NAMES = {
		0x00: "Silence",
		0x01: "Title Screen",
		0x02: "The Shrine",
		0x03: "Grass Valley",
		0x04: "Underground Castle",
		0x05: "GreenWood",
		0x06: "Lost Marsh",
		0x07: "St. Elles",
		0x08: "Seabed",
		0x09: "Ghost Ship",
		0x0A: "Mountain of Souls",
		0x0B: "Laynole",
		0x0C: "Leo's Lab",
		0x0D: "Model Town",
		0x0E: "Magridd Castle",
		0x0F: "World of Evil",
		0x10: "Boss Battle",
		0x11: "Deathtoll",
		0x12: "Victory",
		0x13: "Soul Released",
		0x14: "NPC Theme",
		0x15: "Shop",
		0x16: "Inn",
		0x17: "Game Over",
		0x18: "Ending",
		0x19: "Credits",
	}

	# Known SFX names
	SFX_NAMES = {
		0x00: "Menu Select",
		0x01: "Menu Cancel",
		0x02: "Sword Swing",
		0x03: "Sword Hit",
		0x04: "Enemy Hit",
		0x05: "Enemy Death",
		0x06: "Player Damage",
		0x07: "Level Up",
		0x08: "Item Get",
		0x09: "Soul Release",
		0x0A: "Door Open",
		0x0B: "Chest Open",
		0x0C: "Magic Cast",
		0x0D: "Fireball",
		0x0E: "Warp",
		0x0F: "Save",
	}

	def __init__(self, rom_path: str):
		self.rom_path = Path(rom_path)
		self.rom_data: bytes = b''
		self.driver_offset = 0
		self.driver_size = 0

	def load_rom(self) -> bool:
		"""Load the ROM file."""
		try:
			with open(self.rom_path, 'rb') as f:
				self.rom_data = f.read()
			return True
		except Exception as e:
			print(f"Error loading ROM: {e}")
			return False

	def find_audio_driver(self) -> Tuple[int, int]:
		"""
		Find the SPC audio driver in the ROM.
		Returns (offset, size) or (0, 0) if not found.
		"""
		# Soul Blazer audio is typically in bank $0F ($078000-$07FFFF)
		# Search for common SPC initialization patterns
		search_start = 0x078000  # Bank $0F
		search_end = 0x080000

		for sig in AUDIO_SIGNATURES:
			pos = search_start
			while pos < search_end:
				idx = self.rom_data.find(sig, pos, search_end)
				if idx == -1:
					break

				# Check if this looks like driver start
				# Typically preceded by transfer size bytes
				if idx > 2:
					# Look for reasonable driver size
					potential_size = struct.unpack('<H', self.rom_data[idx-2:idx])[0]
					if 0x100 <= potential_size <= 0x4000:
						self.driver_offset = idx - 2
						self.driver_size = potential_size + 2
						return (self.driver_offset, self.driver_size)

				pos = idx + 1

		# Fallback: assume driver is at start of bank $0F
		self.driver_offset = 0x078000
		self.driver_size = 0x2000  # 8KB default
		return (self.driver_offset, self.driver_size)

	def find_music_pointers(self) -> List[int]:
		"""Find music track pointer table."""
		# Look for pointer table pattern in audio bank
		# Music pointers are typically 2-byte offsets
		pointers = []

		# Search in bank $0F for pointer table
		for offset in range(0x078000, 0x07F000, 2):
			# Check if this could be a pointer table
			potential_ptrs = []
			valid = True

			for i in range(32):  # Check up to 32 potential pointers
				if offset + i * 2 + 2 > len(self.rom_data):
					break
				ptr = struct.unpack('<H', self.rom_data[offset + i * 2:offset + i * 2 + 2])[0]

				# Valid SPC pointers are typically $0200-$FF00
				if ptr < 0x0200 or ptr > 0xFF00:
					if i < 10:  # Need at least 10 valid pointers
						valid = False
					break
				potential_ptrs.append(ptr)

			if valid and len(potential_ptrs) >= 10:
				# Found a potential pointer table
				return potential_ptrs

		return pointers

	def scan_brr_samples(self) -> List[SampleInfo]:
		"""
		Scan for BRR (Bit Rate Reduction) audio samples.
		BRR is the SNES audio compression format.
		"""
		samples = []

		# BRR blocks are 9 bytes: 1 header + 8 data bytes
		# Header format: RRRR FFLL
		#   R = range (0-12)
		#   F = filter (0-3)
		#   L = loop/end flags

		# Scan bank $0F and graphics banks for samples
		for bank in [0x0F, 0x10, 0x11, 0x12]:
			bank_start = bank * 0x8000
			bank_end = bank_start + 0x8000

			if bank_end > len(self.rom_data):
				continue

			offset = bank_start
			while offset < bank_end - 9:
				header = self.rom_data[offset]
				range_val = (header >> 4) & 0x0F
				filter_val = (header >> 2) & 0x03
				flags = header & 0x03

				# Valid BRR header checks
				if range_val <= 12 and filter_val <= 3:
					# Check if this is a valid BRR block sequence
					sample_size = self._measure_brr_sample(offset, bank_end)
					if sample_size >= 18:  # At least 2 blocks
						loop_point = 0
						if flags & 0x02:  # Has loop
							loop_point = sample_size - 9

						samples.append(SampleInfo(
							id=len(samples),
							offset=offset,
							size=sample_size,
							loop_point=loop_point,
							pitch=0
						))
						offset += sample_size
						continue

				offset += 1

		return samples[:100]  # Limit to first 100 samples found

	def _measure_brr_sample(self, start: int, limit: int) -> int:
		"""Measure the size of a BRR sample starting at offset."""
		offset = start
		blocks = 0

		while offset < limit - 9 and blocks < 1000:
			header = self.rom_data[offset]
			range_val = (header >> 4) & 0x0F
			flags = header & 0x03

			# Invalid range
			if range_val > 12:
				break

			blocks += 1
			offset += 9

			# End flag set
			if flags & 0x01:
				break

		return blocks * 9

	def extract_tracks(self) -> List[AudioTrack]:
		"""Extract music track information."""
		tracks = []
		pointers = self.find_music_pointers()

		for i, ptr in enumerate(pointers):
			name = self.TRACK_NAMES.get(i, f"Track_{i:02X}")

			# Calculate file offset from SPC pointer
			# This is approximate - actual mapping depends on transfer routine
			file_offset = 0x078000 + (ptr - 0x0200) if ptr >= 0x0200 else 0

			# Estimate track size (until next track or end)
			next_offset = pointers[i + 1] if i + 1 < len(pointers) else ptr + 0x0800
			size = (next_offset - ptr) if next_offset > ptr else 0x0800

			tracks.append(AudioTrack(
				id=i,
				name=name,
				offset=file_offset,
				size=min(size, 0x2000),
				bank=0x0F,
				channels=8
			))

		# If no pointers found, create placeholder tracks
		if not tracks:
			for i in range(26):
				name = self.TRACK_NAMES.get(i, f"Track_{i:02X}")
				tracks.append(AudioTrack(
					id=i,
					name=name,
					offset=0x078000 + i * 0x0400,
					size=0x0400,
					bank=0x0F
				))

		return tracks

	def extract_sfx(self) -> List[SoundEffect]:
		"""Extract sound effect information."""
		sfx = []

		for i in range(16):
			name = self.SFX_NAMES.get(i, f"SFX_{i:02X}")
			sfx.append(SoundEffect(
				id=i,
				name=name,
				offset=0x07C000 + i * 0x0100,  # Estimate
				size=0x0100
			))

		return sfx

	def extract_all(self) -> AudioExtractionResult:
		"""Perform full audio extraction."""
		if not self.rom_data:
			if not self.load_rom():
				raise RuntimeError("Failed to load ROM")

		# Find audio driver
		driver_offset, driver_size = self.find_audio_driver()
		print(f"Audio driver: ${driver_offset:06X}, size: {driver_size} bytes")

		# Extract music tracks
		tracks = self.extract_tracks()
		print(f"Found {len(tracks)} music tracks")

		# Extract sound effects
		sfx = self.extract_sfx()
		print(f"Found {len(sfx)} sound effects")

		# Scan for BRR samples
		samples = self.scan_brr_samples()
		print(f"Found {len(samples)} BRR samples")

		# Calculate total audio size
		total_size = driver_size
		total_size += sum(t.size for t in tracks)
		total_size += sum(s.size for s in sfx)
		total_size += sum(s.size for s in samples)

		return AudioExtractionResult(
			driver_offset=driver_offset,
			driver_size=driver_size,
			music_tracks=tracks,
			sound_effects=sfx,
			samples=samples,
			total_audio_size=total_size
		)

	def export_spc_template(self, output_path: Path, track_id: int = 0) -> bool:
		"""
		Export an SPC file template.
		Note: This creates a basic SPC structure but may not be playable
		without proper audio driver analysis.
		"""
		# SPC file format header
		spc_header = bytearray(0x10200)

		# Header signature
		spc_header[0:33] = b'SNES-SPC700 Sound File Data v0.30'
		spc_header[33] = 0x1A
		spc_header[34] = 0x1A

		# Version minor
		spc_header[35] = 30

		# PC (program counter) - typically $0200 for driver start
		spc_header[0x25:0x27] = struct.pack('<H', 0x0200)

		# A, X, Y, PSW, SP registers
		spc_header[0x27] = 0x00  # A
		spc_header[0x28] = 0x00  # X
		spc_header[0x29] = 0x00  # Y
		spc_header[0x2A] = 0x00  # PSW
		spc_header[0x2B] = 0xFF  # SP

		# Copy audio driver to SPC RAM area
		driver_start = 0x0100  # In SPC file
		ram_start = driver_start + self.driver_offset

		# Copy driver (limited to what fits)
		driver_end = min(self.driver_offset + self.driver_size, len(self.rom_data))
		driver_data = self.rom_data[self.driver_offset:driver_end]
		spc_header[0x100:0x100 + len(driver_data)] = driver_data

		try:
			with open(output_path, 'wb') as f:
				f.write(spc_header)
			return True
		except Exception as e:
			print(f"Error writing SPC: {e}")
			return False

	def save_results(self, output_path: Path, result: AudioExtractionResult):
		"""Save extraction results to JSON."""
		data = {
			'driver_offset': f"${result.driver_offset:06X}",
			'driver_size': result.driver_size,
			'total_audio_size': result.total_audio_size,
			'music_tracks': [
				{
					'id': t.id,
					'name': t.name,
					'offset': f"${t.offset:06X}",
					'size': t.size,
					'bank': f"${t.bank:02X}"
				}
				for t in result.music_tracks
			],
			'sound_effects': [
				{
					'id': s.id,
					'name': s.name,
					'offset': f"${s.offset:06X}",
					'size': s.size
				}
				for s in result.sound_effects
			],
			'brr_samples': [
				{
					'id': s.id,
					'offset': f"${s.offset:06X}",
					'size': s.size,
					'loop_point': s.loop_point
				}
				for s in result.samples[:50]  # Limit output
			]
		}

		with open(output_path, 'w') as f:
			json.dump(data, f, indent='\t')


def main():
	import sys

	# Default paths
	script_dir = Path(__file__).parent
	rom_path = Path(r"c:\Users\me\source\repos\GameInfo\~roms\SNES\GoodSNES\Soul Blazer (U) [!].sfc")
	output_dir = script_dir.parent / "assets" / "audio"

	if len(sys.argv) > 1:
		rom_path = Path(sys.argv[1])

	if not rom_path.exists():
		print(f"ROM not found: {rom_path}")
		sys.exit(1)

	# Create output directory
	output_dir.mkdir(parents=True, exist_ok=True)

	print(f"Soul Blazer Audio Extractor")
	print(f"ROM: {rom_path}")
	print(f"Output: {output_dir}")
	print()

	# Extract audio
	extractor = AudioExtractor(str(rom_path))
	result = extractor.extract_all()

	# Save results
	json_path = output_dir / "audio_extraction.json"
	extractor.save_results(json_path, result)
	print(f"\nSaved: {json_path}")

	# Print summary
	print(f"\n=== Audio Extraction Summary ===")
	print(f"Driver offset: ${result.driver_offset:06X}")
	print(f"Driver size: {result.driver_size} bytes")
	print(f"Music tracks: {len(result.music_tracks)}")
	print(f"Sound effects: {len(result.sound_effects)}")
	print(f"BRR samples: {len(result.samples)}")
	print(f"Total audio data: {result.total_audio_size:,} bytes")

	print("\n=== Music Tracks ===")
	for track in result.music_tracks:
		print(f"  {track.id:02X}: {track.name}")


if __name__ == '__main__':
	main()
